"""Publish only administrative counts from the fixed cleanup receipts; no file payloads."""
import argparse
import base64
import datetime
import hashlib
import importlib.util
import json
import shutil
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = Path('C:/Users/jiacu/Desktop/mattersyn')
CONTROL = ROOT / 'repos/mattersyn/tools/publication/github_release_control.py'
RECEIPTS = [
    HERE / 'cleanup-method/root-execute-20261012-r1/fresh-target-results.json',
    HERE / 'fresh-generated-manifest-cleanup/root-execute-20261012-r1/confirmed-stopped-journal-results.json',
    HERE / 'fresh-generated-manifest-cleanup/root-execute-bulk-r2/fresh-target-results.json',
    HERE / 'fresh-public-static-cleanup/root-execute-native-r2/confirmed-stopped-journal-results.json',
    HERE / 'fresh-public-static-cleanup/root-bulk-frozen-r1/root-execute-r3/results.json',
]

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--execute', action='store_true')
    args = parser.parse_args()
    rows = []
    for path in RECEIPTS:
        if not path.exists():
            continue
        raw = path.read_bytes()
        doc = json.loads(raw.decode('utf-8-sig'))
        if doc.get('execute') is not True:
            raise ValueError('Actual execution receipt required')
        targets = doc['targets']
        rows.append({'scope': path.parent.parent.name, 'receipt_sha256': hashlib.sha256(raw).hexdigest(),
                     'finished_targets': len(targets),
                     'removed_bytes': sum(int(row.get('deleted_bytes', 0)) for row in targets),
                     'removed_files': sum(int(row.get('deleted_files', 0)) for row in targets)})
    for path in sorted((HERE / 'worktree-local-private-preservation').glob('wt-*/actual-receipt.json')):
        raw = path.read_bytes()
        doc = json.loads(raw)
        if (doc.get('schema') != 'private-one-worktree-retirement-actual/1'
                or doc.get('returncode') != 0 or doc.get('target_exists_after') is not False
                or doc.get('Source_Site_heads_rechecked') is not True):
            continue
        proof = json.loads((path.parent / 'preservation-proof.private.json').read_bytes())
        if proof.get('duplicate_logical_bytes') != doc.get('duplicate_logical_bytes'):
            raise ValueError('Worktree actual/proof byte totals differ')
        rows.append({'scope': 'obsolete_checkout_' + str(len(rows)),
                     'receipt_sha256': hashlib.sha256(raw).hexdigest(), 'finished_targets': 1,
                     'removed_bytes': int(doc['duplicate_logical_bytes']),
                     'removed_files': int(proof['Git_public_or_local_bundled_duplicate_files'])})
    total = sum(row['removed_bytes'] for row in rows)
    count = sum(row['removed_files'] for row in rows)
    free = shutil.disk_usage(ROOT).free
    now = datetime.datetime.now(datetime.timezone.utc).isoformat()
    prose = '# Storage cleanup, October 12, 2026\n\n'
    prose += f'Updated: {now}. Cleanup is **in progress**.\n\n'
    prose += 'The requested target is at least 600 GB removed from the local MatterSyn folder. '
    prose += 'The fresh scans observed about 845 GB outside the main paper-collection folders; '
    prose += 'these are logical file sizes and do not establish that all of it is removable.\n\n'
    prose += f'Completed target receipts currently confirm **{total:,} logical bytes ({total / 1e9:.2f} GB)** '
    prose += f'and **{count:,} files** removed since this request. Earlier cleanup events are excluded. '
    prose += 'A target still being processed is credited only after its result is saved.\n\n'
    prose += f'C: free space at this update: {free:,} bytes. '
    prose += 'Free-space changes also reflect concurrent website staging and other disk activity.\n\n'
    prose += '| Scope | Finished targets | Removed files | Removed bytes | Receipt SHA256 |\n'
    prose += '|---|---:|---:|---:|---|\n'
    for row in rows:
        prose += f"| {row['scope']} | {row['finished_targets']} | {row['removed_files']:,} | {row['removed_bytes']:,} | `{row['receipt_sha256']}` |\n"
    prose += '\nNecessary publication-safe material is retained in GitHub. Regenerable caches and verified redundant copies are deleted directly. '
    prose += 'Original papers, quoted text/pass/pair files, unique private evidence, the active local model and current working repositories remain local. '
    prose += 'Detailed paths, audits, patches, model payloads and source text are excluded from this public report.\n\n'
    prose += 'Automatic approval rejected removal of one worktree whose name indicates pending integration; it remains intact. '
    prose += 'Other verified scopes continue. No website review status, sampling denominator or release gate changes.\n'
    safe = {'at_utc': now, 'status': 'cleanup_in_progress', 'requested_removed_bytes': 600_000_000_000,
            'confirmed_completed_target_removed_bytes': total, 'removed_files': count,
            'C_free_bytes': free, 'receipts': rows, 'private_payloads_uploaded': False}
    snapshot = HERE / ('safe-progress-' + now.replace(':', '').replace('+', '_') + '.json')
    snapshot.write_text(json.dumps(safe, indent=2) + '\n', encoding='utf-8')
    if not args.execute:
        print(json.dumps(safe))
        return
    spec = importlib.util.spec_from_file_location('safe_cleanup_github', CONTROL)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    token = mod.credential()
    user = mod.request(token, '/user')
    repo = mod.request(token, '/repos/cuiyist/mattersyn2')
    if user.get('id') != 147659097 or repo.get('id') != 1415837116 or repo.get('private'):
        raise ValueError('Account/archive identity mismatch')
    path = '/repos/cuiyist/mattersyn2/contents/CLEANUP_REPORT_2026-10-12.md'
    old = mod.request(token, path)
    result = mod.request(token, path, 'PUT', {'message': 'Record actual completed cleanup targets',
                'sha': old['sha'], 'content': base64.b64encode(prose.encode()).decode()})
    print(json.dumps({'removed_bytes': total, 'removed_files': count,
                      'report_commit': result['commit']['sha'], 'private_payloads_uploaded': False}))

if __name__ == '__main__':
    main()
