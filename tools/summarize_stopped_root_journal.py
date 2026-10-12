"""Read only the Root cleanup metadata journal; credit confirmed unique dispositions."""
import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
FOLDER = HERE / 'root-execute-native-r2'
PLAN_SHA = '689742ff6e5dcdd8522c29a5ea22e28f45f63069d8146a8699dacf8367b4378d'
raw_plan = (HERE / 'frozen-static-plan.json').read_bytes()
if hashlib.sha256(raw_plan).hexdigest() != PLAN_SHA:
    raise ValueError('Frozen scope changed')
targets = [Path(t['target']) for t in json.loads(raw_plan)['targets']]
raw = (FOLDER / 'events.jsonl').read_bytes()
seen = set()
counts = {}
incomplete_lines = 0
for line in raw.splitlines():
    try:
        row = json.loads(line)
    except json.JSONDecodeError:
        incomplete_lines += 1
        continue
    if row.get('event') != 'deleted_exact_public_static_file':
        continue
    path = Path(row['path'])
    scope = next((t for t in targets if path.is_relative_to(t)), None)
    if scope is None or str(path).casefold() in seen:
        raise ValueError('Out-of-scope or duplicated deletion event')
    if not isinstance(row['bytes'], int) or row['bytes'] < 0:
        raise ValueError('Invalid disposition count')
    seen.add(str(path).casefold())
    item = counts.setdefault(str(scope), {'path': str(scope), 'status': 'journal_confirmed_dispositions',
                                        'deleted_files': 0, 'deleted_bytes': 0})
    item['deleted_files'] += 1
    item['deleted_bytes'] += row['bytes']
out = {'schema': 'private-stopped-root-cleanup-confirmed-dispositions/1', 'execute': True,
       'stopped_root_pid': 13096, 'plan_sha256': PLAN_SHA,
       'journal_sha256': hashlib.sha256(raw).hexdigest(), 'incomplete_lines_not_credited': incomplete_lines,
       'targets': list(counts.values()), 'no_new_deletions_by_this_script': True}
destination = FOLDER / 'confirmed-stopped-journal-results.json'
with destination.open('x', encoding='utf-8') as stream:
    json.dump(out, stream, indent=2)
print(json.dumps({'confirmed_deleted_files': len(seen),
                  'confirmed_deleted_bytes': sum(t['deleted_bytes'] for t in counts.values()),
                  'incomplete_lines_not_credited': incomplete_lines}))
