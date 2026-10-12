#requires -Version 7.6
[CmdletBinding()]
param([switch]$LibraryOnly,[switch]$Execute,[int[]]$ProcessIds,[string]$ExpectedPythonSha256,[string]$ExpectedNativeCodeSha256,[string]$ExpectedCollectorSha256,[string]$OutputPath)
$ErrorActionPreference='Stop'
$taskPython='C:\Users\jiacu\AppData\Local\Programs\Python\Python312\python.exe'
$taskNativeCode=Join-Path $PSScriptRoot 'ScopedHttpCwd.cs'
function Get-Utf8Sha([string]$Value){
 $h=[Security.Cryptography.SHA256]::Create()
 try{return [Convert]::ToHexString($h.ComputeHash([Text.Encoding]::UTF8.GetBytes($Value))).ToLowerInvariant()}finally{$h.Dispose()}
}
function Get-StandardHttpArgs([string[]]$Argv){
 if($Argv.Count -lt 3 -or $Argv.Count -gt 24 -or [IO.Path]::GetFileName($Argv[0]) -notin @('python','python.exe')){throw 'Not a bounded standard Python command'}
 $index=1;$flags=[Collections.Generic.HashSet[string]]::new()
 while($index -lt $Argv.Count -and $Argv[$index] -in @('-B','-u')){if(!$flags.Add($Argv[$index])){throw 'Repeated interpreter flag'};$index++}
 if($index+1 -ge $Argv.Count -or $Argv[$index] -cne '-m' -or $Argv[$index+1] -cne 'http.server'){throw 'Only standard -m http.server is admitted'}
 $index+=2;$port=8000;$directory=$null;$bind=$null;$protocol=$null;$options=[Collections.Generic.HashSet[string]]::new()
 if($index -lt $Argv.Count -and $Argv[$index] -cmatch '^\d{1,5}$'){$port=[int]$Argv[$index];$index++}
 if($port -lt 1 -or $port -gt 65535){throw 'Invalid standard HTTP port'}
 while($index -lt $Argv.Count){
  $key=$Argv[$index];$index++
  if($key -cnotin @('-d','--directory','-b','--bind','-p','--protocol') -or $index -ge $Argv.Count){throw 'Unsupported HTTP option retained unknown'}
  $value=$Argv[$index];$index++
  $role=if($key -in @('-d','--directory')){'directory'}elseif($key -in @('-b','--bind')){'bind'}else{'protocol'}
  if(!$options.Add($role) -or !$value -or $value.Contains([char]0)){throw 'Duplicate/empty HTTP option'}
  switch($role){'directory'{$directory=$value};'bind'{$bind=$value};'protocol'{if($value -cnotin @('HTTP/1.0','HTTP/1.1')){throw 'Unsupported protocol'};$protocol=$value}}
 }
 return @{port=$port;directory=$directory;directory_argument_present=($null -ne $directory);bind=$bind;protocol=$protocol;standard_http_argv=$true}
}
function Normalize-ObservedDosPath([string]$Value){
 if($Value -cnotmatch '^[A-Za-z]:[\\/]' -or $Value.Substring(2).Contains(':') -or $Value.Contains([char]0) -or $Value.Contains("`r") -or $Value.Contains("`n")){throw 'Only an observed literal absolute DOS directory is supported'}
 $path=[IO.Path]::GetFullPath($Value.Replace('/','\'))
 return $(if($path.Length -gt 3){$path.TrimEnd('\')}else{$path})
}
function Resolve-StandardServedDirectory([string]$Cwd,$HttpArgs){
 $base=Normalize-ObservedDosPath $Cwd
 if(!$HttpArgs.directory_argument_present){return @{served_directory=$base;directory_source='native_current_directory'}}
 $value=[string]$HttpArgs.directory
 if([IO.Path]::IsPathFullyQualified($value)){return @{served_directory=(Normalize-ObservedDosPath $value);directory_source='argv'}}
 if([IO.Path]::IsPathRooted($value) -or $value -match '^[A-Za-z]:'){throw 'Ambiguous rooted or drive-relative directory retained unknown'}
 return @{served_directory=(Normalize-ObservedDosPath ([IO.Path]::GetFullPath($value,$base)));directory_source='argv_relative_to_observed_cwd'}
}
if($LibraryOnly){return}
if(!$Execute){@{plan_only=$true;schema='private-standard-python-http-cwd-native/1';same_user_standard_python_http_only=$true;native_memory_reads=0;maximum_directory_bytes=32766;processes_stopped=0;files_deleted=0;ownership_claim='same-user identity only; no Root-owned label'}|ConvertTo-Json -Compress;return}
if($ExpectedPythonSha256 -cnotmatch '^[0-9a-f]{64}$'){throw 'Root-observed exact Python image SHA256 required'}
if(!(Test-Path -LiteralPath $taskPython) -or (Get-FileHash -LiteralPath $taskPython -Algorithm SHA256).Hash.ToLowerInvariant() -cne $ExpectedPythonSha256){throw 'Expected standard Python image differs'}
if([IntPtr]::Size -ne 8 -or ![Environment]::Is64BitOperatingSystem){throw 'Only native64 collector supported'}
$output=[IO.Path]::GetFullPath($OutputPath)
if((Split-Path -Parent $output) -cne $PSScriptRoot -or (Test-Path -LiteralPath $output)){throw 'A NEW exact private collector output file is required'}
$nativeSha=(Get-FileHash -LiteralPath $taskNativeCode -Algorithm SHA256).Hash.ToLowerInvariant()
$collectorSha=(Get-FileHash -LiteralPath $PSCommandPath -Algorithm SHA256).Hash.ToLowerInvariant()
if($ExpectedNativeCodeSha256 -cnotmatch '^[0-9a-f]{64}$' -or $ExpectedCollectorSha256 -cnotmatch '^[0-9a-f]{64}$' -or $nativeSha -cne $ExpectedNativeCodeSha256 -or $collectorSha -cne $ExpectedCollectorSha256){throw 'Root-reviewed exact collector and native module hashes required'}
Add-Type -Path $taskNativeCode
if((@([ScopedHttpCwd.Native]::Layout()) -join ',') -cne '48,32,56,16'){throw 'Managed x64 structure layout unsupported'}
$readerIdentity=[Security.Principal.WindowsIdentity]::GetCurrent();$readerSid=$readerIdentity.User.Value
$readerSession=[Diagnostics.Process]::GetCurrentProcess().SessionId
$rows=[Collections.Generic.List[object]]::new()
$candidates=if($ProcessIds){
 foreach($requested in $ProcessIds){
  if($requested -le 0){throw 'Positive explicit PID required'}
  try{
   $candidate=Get-CimInstance Win32_Process -Filter "ProcessId=$requested" -ErrorAction Stop
   if($candidate){$candidate}else{$rows.Add([pscustomobject]@{pid=$requested;status='unknown';reason='Requested process absent at collection';identity_stable=$false;native_read_stable=$false;current_directory=$null;ownership_not_asserted=$true})}
  }catch{$rows.Add([pscustomobject]@{pid=$requested;status='unknown';reason='Requested process metadata unavailable';identity_stable=$false;native_read_stable=$false;current_directory=$null;ownership_not_asserted=$true})}
 }
}else{Get-CimInstance Win32_Process -Filter "Name='python.exe'" -ErrorAction Stop}
foreach($process in @($candidates)){
 if(!$process.CommandLine -or [string]$process.CommandLine -notmatch '(?i)\bhttp\.server\b'){if($ProcessIds){$rows.Add([pscustomobject]@{pid=[int]$process.ProcessId;status='unknown';reason='Requested process is not a recognized standard HTTP command';identity_stable=$false;native_read_stable=$false;current_directory=$null;ownership_not_asserted=$true})};continue}
 $row=[ordered]@{pid=[int]$process.ProcessId;status='unknown';created_at=$null;executable=$process.ExecutablePath;executable_sha256=$null;commandline_sha256=(Get-Utf8Sha ([string]$process.CommandLine));owner_sid=$null;owner_name=$null;session_id=[int]$process.SessionId;current_directory=$null;served_directory=$null;native_read_method='NtQueryInformationProcess ProcessBasicInformation; fixed x64 PEB+0x20; RTL params+0x38 CurrentDirectory UNICODE_STRING; two equal bounded reads';identity_stable=$false;native_read_stable=$false;ownership_not_asserted=$true;memory_write_or_scan=$false}
 try{
  $argv=[ScopedHttpCwd.Native]::Args([string]$process.CommandLine)
  $argsInfo=Get-StandardHttpArgs $argv
  if([IO.Path]::GetFullPath([string]$process.ExecutablePath) -cne $taskPython -or $process.SessionId -ne $readerSession){throw 'Different native image/session retained unknown'}
  $ownerSid=Invoke-CimMethod -InputObject $process -MethodName GetOwnerSid -ErrorAction Stop
  $owner=Invoke-CimMethod -InputObject $process -MethodName GetOwner -ErrorAction Stop
  if($ownerSid.ReturnValue -ne 0 -or $ownerSid.Sid -cne $readerSid -or $owner.ReturnValue -ne 0){throw 'Different or unavailable process owner retained unknown'}
  $row.owner_sid=$ownerSid.Sid;$row.owner_name=$owner.Domain+'\'+$owner.User;$row.executable_sha256=$ExpectedPythonSha256
  $creation=$process.CreationDate.ToUniversalTime();$row.cim_creation_utc_before=$creation.ToString('o')
  $result=[ScopedHttpCwd.Native]::Read([uint32]$process.ProcessId,[uint32]$readerSession,[long]$creation.Ticks,$taskPython)
  # Re-query only this same PID and compare before/after identity; no ancestry or other process memory.
  $after=Get-CimInstance Win32_Process -Filter "ProcessId=$($process.ProcessId)" -ErrorAction Stop
  if(!$after -or $after.CreationDate.ToUniversalTime().Ticks -ne $creation.Ticks -or $after.SessionId -ne $readerSession -or [IO.Path]::GetFullPath([string]$after.ExecutablePath) -cne $taskPython -or (Get-Utf8Sha ([string]$after.CommandLine)) -cne $row.commandline_sha256){throw 'CIM PID/creation/image/session/argv identity changed after read'}
  $afterOwner=Invoke-CimMethod -InputObject $after -MethodName GetOwnerSid -ErrorAction Stop
  if($afterOwner.ReturnValue -ne 0 -or $afterOwner.Sid -cne $readerSid -or (Get-FileHash -LiteralPath $taskPython -Algorithm SHA256).Hash.ToLowerInvariant() -cne $ExpectedPythonSha256){throw 'Owner/image bytes changed after read'}
  $cwd=Normalize-ObservedDosPath $result.CurrentDirectory
  $served=Resolve-StandardServedDirectory $cwd $argsInfo
  $row.created_at=$result.CreatedUtc;$row.cim_creation_utc_after=$after.CreationDate.ToUniversalTime().ToString('o')
  $row.current_directory=$result.CurrentDirectory;$row.normalized_current_directory=$cwd;$row.served_directory=$served.served_directory;$row.directory_source=$served.directory_source
  $row.directory_argument_present=$argsInfo.directory_argument_present;$row.port=$argsInfo.port;$row.bind=$argsInfo.bind
  $row.native_read_stable=$true;$row.identity_stable=$true;$row.read_calls=$result.ReadCalls;$row.bytes_read_total=$result.BytesRead
  $row.process_machine=$result.ProcessMachine;$row.native_machine=$result.NativeMachine;$row.status='observed'
 }catch{$row.reason=$_.Exception.Message;$row.status='unknown';$row.identity_stable=$false;$row.native_read_stable=$false}
 $rows.Add([pscustomobject]$row)
}
if((Get-FileHash -LiteralPath $taskNativeCode -Algorithm SHA256).Hash.ToLowerInvariant() -cne $nativeSha -or (Get-FileHash -LiteralPath $PSCommandPath -Algorithm SHA256).Hash.ToLowerInvariant() -cne $collectorSha){throw 'Reviewed collector code changed during collection'}
$document=[ordered]@{schema='private-standard-python-http-cwd-native/1';observed_at=[datetimeoffset]::UtcNow.ToString('o');collector_code_path=$PSCommandPath;collector_code_sha256=$collectorSha;native_reader_code_path=$taskNativeCode;native_reader_code_sha256=$nativeSha;reader_pid=$PID;reader_owner_sid=$readerSid;reader_owner_name=$readerIdentity.Name;reader_session_id=$readerSession;expected_python_image=$taskPython;expected_python_sha256=$ExpectedPythonSha256;maximum_directory_bytes=32766;process_read_rights='0x1410: query and VM_READ only';only_fixed_current_directory_structures_read=$true;processes=$rows.ToArray();processes_stopped=0;files_deleted=0;memory_writes=0;arbitrary_memory_scans=0;Root_owned_processes_asserted=0;raw_commandlines_or_memory_not_saved=$true}
[IO.File]::WriteAllText($output,($document|ConvertTo-Json -Depth 8),[Text.UTF8Encoding]::new($false))
$mapSha=(Get-FileHash -LiteralPath $output -Algorithm SHA256).Hash.ToLowerInvariant()
$pinsPath=$output+'.pins.json'
if(Test-Path -LiteralPath $pinsPath){throw 'Preserve existing map-pins receipt'}
@{native_receipt_path=$output;native_receipt_sha256=$mapSha;collector_code_path=$PSCommandPath;collector_code_sha256=$collectorSha;native_reader_code_path=$taskNativeCode;native_reader_code_sha256=$nativeSha;observed=@($rows|Where-Object status -eq 'observed').Count;unknown=@($rows|Where-Object status -eq 'unknown').Count;processes_stopped=0;files_deleted=0}|ConvertTo-Json|Set-Content -LiteralPath $pinsPath -Encoding utf8
@{schema=$document.schema;observed=@($rows|Where-Object status -eq 'observed').Count;unknown=@($rows|Where-Object status -eq 'unknown').Count;native_receipt_path=$output;native_receipt_sha256=$mapSha;processes_stopped=0;files_deleted=0}|ConvertTo-Json -Compress
