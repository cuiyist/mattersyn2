using System;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using Microsoft.Win32.SafeHandles;
namespace ScopedHttpCwd {
 [StructLayout(LayoutKind.Sequential)] public struct BasicInfo { public int ExitStatus; public IntPtr Peb; public UIntPtr Affinity; public int Priority; public UIntPtr ProcessId; public UIntPtr ParentId; }
 [StructLayout(LayoutKind.Sequential)] public struct Unicode64 { public ushort Length, MaximumLength; public IntPtr Buffer; }
 [StructLayout(LayoutKind.Sequential)] public struct CurrentDir { public Unicode64 DosPath; public IntPtr Handle; }
 [StructLayout(LayoutKind.Sequential)] public struct ParametersPrefix { public uint MaximumLength, Length, Flags, DebugFlags; public IntPtr ConsoleHandle; public uint ConsoleFlags; public IntPtr Input, Output, Error; public CurrentDir CurrentDirectory; }
 [StructLayout(LayoutKind.Sequential)] public struct PebPrefix { public byte Inherited, ReadOptions, Debugged, Flags; public IntPtr Mutant, ImageBase, Loader, ProcessParameters; }
 [StructLayout(LayoutKind.Sequential)] struct FileTime { public uint Low,High; public long Value { get { return (long)(((ulong)High << 32) | Low); } } }
 public sealed class CwdResult { public string CurrentDirectory,Executable,CreatedUtc; public int ReadCalls,BytesRead; public ushort ProcessMachine,NativeMachine; }
 public static class Native {
  [DllImport("kernel32.dll",SetLastError=true)] static extern SafeProcessHandle OpenProcess(uint access,bool inherit,uint pid);
  [DllImport("kernel32.dll",SetLastError=true)] static extern bool IsWow64Process2(SafeProcessHandle process,out ushort processMachine,out ushort nativeMachine);
  [DllImport("kernel32.dll",SetLastError=true)] static extern bool ReadProcessMemory(SafeProcessHandle process,IntPtr address,byte[] buffer,UIntPtr size,out UIntPtr read);
  [DllImport("kernel32.dll",SetLastError=true)] static extern uint GetProcessId(SafeProcessHandle process);
  [DllImport("kernel32.dll",SetLastError=true)] static extern bool ProcessIdToSessionId(uint pid,out uint session);
  [DllImport("kernel32.dll",SetLastError=true)] static extern bool GetProcessTimes(SafeProcessHandle process,out FileTime created,out FileTime exit,out FileTime kernel,out FileTime user);
  [DllImport("kernel32.dll",SetLastError=true)] static extern bool GetExitCodeProcess(SafeProcessHandle process,out uint code);
  [DllImport("kernel32.dll",CharSet=CharSet.Unicode,SetLastError=true)] static extern bool QueryFullProcessImageName(SafeProcessHandle process,uint flags,StringBuilder name,ref uint size);
  [DllImport("kernel32.dll",CharSet=CharSet.Unicode)] static extern IntPtr GetModuleHandle(string name);
  [DllImport("kernel32.dll",CharSet=CharSet.Ansi)] static extern IntPtr GetProcAddress(IntPtr module,string name);
  [DllImport("shell32.dll",CharSet=CharSet.Unicode,SetLastError=true)] static extern IntPtr CommandLineToArgvW(string command,out int count);
  [DllImport("kernel32.dll")] static extern IntPtr LocalFree(IntPtr value);
  [UnmanagedFunctionPointer(CallingConvention.Winapi)] delegate int QueryBasic(SafeProcessHandle process,int informationClass,out BasicInfo info,int length,out int returned);
  public static int[] Layout() { return new[]{Marshal.SizeOf<BasicInfo>(),Marshal.OffsetOf<PebPrefix>("ProcessParameters").ToInt32(),Marshal.OffsetOf<ParametersPrefix>("CurrentDirectory").ToInt32(),Marshal.SizeOf<Unicode64>()}; }
  public static string[] Args(string command) {
   int count;IntPtr args=CommandLineToArgvW(command,out count);
   if(args==IntPtr.Zero||count<1||count>24)throw new IOException("Standard HTTP argv unavailable or too long.");
   try{var result=new string[count];for(int i=0;i<count;i++)result[i]=Marshal.PtrToStringUni(Marshal.ReadIntPtr(args,i*IntPtr.Size));return result;}finally{LocalFree(args);}
  }
  static void ValidPointer(long value,int alignment) { if(value<0x10000 || value>=0x0000800000000000L || value%alignment!=0)throw new IOException("Unsupported fixed-structure pointer."); }
  static byte[] ReadExact(SafeProcessHandle process,IntPtr address,int count,CwdResult result) {
   if(count<1||count>32766)throw new IOException("Bounded read length refused.");
   var bytes=new byte[count];UIntPtr read;
   if(!ReadProcessMemory(process,address,bytes,(UIntPtr)(uint)count,out read)||read.ToUInt64()!=(ulong)count)throw new IOException("Fixed bounded process-directory read failed.",new Win32Exception(Marshal.GetLastWin32Error()));
   result.ReadCalls++;result.BytesRead+=count;return bytes;
  }
  static byte[] ReadCwd(SafeProcessHandle process,IntPtr peb,CwdResult result,out byte[] parameterPin,out byte[] directoryPin) {
   var pointer=ReadExact(process,IntPtr.Add(peb,0x20),8,result);long address=BitConverter.ToInt64(pointer,0);ValidPointer(address,8);
   var parameters=new IntPtr(address);var header=ReadExact(process,parameters,12,result);
   uint maximum=BitConverter.ToUInt32(header,0),length=BitConverter.ToUInt32(header,4),flags=BitConverter.ToUInt32(header,8);
   if(length<0x50||maximum<length||maximum>1024*1024||(flags&1)==0)throw new IOException("Unsupported or unnormalized process-directory header.");
   var unicode=ReadExact(process,IntPtr.Add(parameters,0x38),16,result);
   ushort bytes=BitConverter.ToUInt16(unicode,0),max=BitConverter.ToUInt16(unicode,2);long buffer=BitConverter.ToInt64(unicode,8);
   if(bytes<2||bytes%2!=0||bytes>32766||max<bytes||max%2!=0||max>65534)throw new IOException("Invalid bounded directory UNICODE_STRING.");
   ValidPointer(buffer,2);parameterPin=pointer.Concat(header).ToArray();directoryPin=unicode;
   return ReadExact(process,new IntPtr(buffer),bytes,result);
  }
  public static CwdResult Read(uint pid,uint expectedSession,long expectedCreationTicks,string expectedImage) {
   if(!Environment.Is64BitProcess||!Environment.Is64BitOperatingSystem||!Layout().SequenceEqual(new[]{48,0x20,0x38,16}))throw new IOException("Only the verified native x64 layout is supported.");
   // QUERY_INFORMATION | QUERY_LIMITED_INFORMATION | VM_READ; no write/terminate/operation/debug privileges.
   using(var process=OpenProcess(0x1410,false,pid)) {
    if(process.IsInvalid)throw new IOException("Read-only process handle unavailable.",new Win32Exception(Marshal.GetLastWin32Error()));
    if(GetProcessId(process)!=pid)throw new IOException("Native PID identity changed.");
    uint session;if(!ProcessIdToSessionId(pid,out session)||session!=expectedSession)throw new IOException("Native process session differs.");
    var result=new CwdResult();ushort pm,nm;
    if(!IsWow64Process2(process,out pm,out nm)||pm!=0||nm!=0x8664)throw new IOException("WOW64, non-AMD64 or unknown architecture retained.");result.ProcessMachine=pm;result.NativeMachine=nm;
    FileTime created,exit,kernel,user;if(!GetProcessTimes(process,out created,out exit,out kernel,out user))throw new IOException("Native creation time unavailable.");
    DateTime creation=DateTime.FromFileTimeUtc(created.Value);
    if(Math.Abs(creation.Ticks-expectedCreationTicks)>2*TimeSpan.TicksPerSecond)throw new IOException("Native creation identity differs.");
    var image=new StringBuilder(4096);uint imageLength=4096;
    if(!QueryFullProcessImageName(process,0,image,ref imageLength)||!String.Equals(Path.GetFullPath(image.ToString()),Path.GetFullPath(expectedImage),StringComparison.OrdinalIgnoreCase))throw new IOException("Native executable identity differs.");
    uint alive;if(!GetExitCodeProcess(process,out alive)||alive!=259)throw new IOException("HTTP process is not active.");
    IntPtr module=GetModuleHandle("ntdll.dll"),address=GetProcAddress(module,"NtQueryInformationProcess");
    if(module==IntPtr.Zero||address==IntPtr.Zero)throw new IOException("Process basic-info query unavailable.");
    var query=Marshal.GetDelegateForFunctionPointer<QueryBasic>(address);BasicInfo info;int returned;
    if(query(process,0,out info,48,out returned)!=0||returned!=48||info.ProcessId.ToUInt64()!=pid)throw new IOException("Process basic-info identity unavailable.");ValidPointer(info.Peb.ToInt64(),8);
    byte[] pp1,dir1,pp2,dir2;var one=ReadCwd(process,info.Peb,result,out pp1,out dir1);var two=ReadCwd(process,info.Peb,result,out pp2,out dir2);
    if(!pp1.SequenceEqual(pp2)||!dir1.SequenceEqual(dir2)||!one.SequenceEqual(two))throw new IOException("Current-directory snapshot changed during bounded reads.");
    if(!GetProcessTimes(process,out created,out exit,out kernel,out user)||created.Value!=creation.ToFileTimeUtc()||!GetExitCodeProcess(process,out alive)||alive!=259)throw new IOException("Native process creation/alive identity changed after read.");
    string cwd=new UnicodeEncoding(false,false,true).GetString(one);
    if(cwd.IndexOf('\0')>=0||cwd.IndexOf('\r')>=0||cwd.IndexOf('\n')>=0)throw new IOException("Directory contains invalid control characters.");
    result.CurrentDirectory=cwd;result.Executable=image.ToString();result.CreatedUtc=creation.ToString("o");return result;
   }
  }
 }
}
