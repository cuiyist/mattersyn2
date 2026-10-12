"""Credit only the old Root worker's confirmed completed unit removals."""
import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
FOLDER = HERE / 'root-execute-20261012-r1'
PIN = 'a1748a1aa92e8bcc65eabba300a882e8368333c35e437f4bbce3b23234114773'
raw_plan = (HERE / 'normalized-generated-only-plan.json').read_bytes()
if hashlib.sha256(raw_plan).hexdigest() != PIN:
    raise ValueError('Frozen generated scope changed')
targets = [Path(t['absolute_path']) for t in json.loads(raw_plan)['targets']]
raw = (FOLDER / 'events.jsonl').read_bytes()
units = set()
unit_ancestors = set()
counts = {}
incomplete = 0
for line in raw.splitlines():
    try:
        row = json.loads(line)
    except json.JSONDecodeError:
        incomplete += 1
        continue
    if row.get('event') != 'deleted_exact_generated_unit':
        continue
    unit = Path(row['path'])
    scope = next((t for t in targets if unit.is_relative_to(t)), None)
    key = str(unit).casefold()
    parent_keys = {str(p).casefold() for p in unit.parents}
    if scope is None or key in units or key in unit_ancestors or parent_keys.intersection(units):
        raise ValueError('Overlapping or out-of-scope completed unit')
    units.add(key)
    unit_ancestors.update(parent_keys)
    if any(not isinstance(row[k], int) or row[k] < 0 for k in ('files', 'logical_bytes')):
        raise ValueError('Invalid completed-unit totals')
    item = counts.setdefault(str(scope), {'path': str(scope), 'status': 'journal_confirmed_completed_units',
                                        'deleted_files': 0, 'deleted_bytes': 0})
    item['deleted_files'] += row['files']
    item['deleted_bytes'] += row['logical_bytes']
out = {'schema': 'private-stopped-generated-cleanup-confirmed-units/1', 'execute': True,
       'stopped_root_pid': 66128, 'plan_sha256': PIN, 'journal_sha256': hashlib.sha256(raw).hexdigest(),
       'incomplete_lines_not_credited': incomplete, 'unfinished_unit_not_credited': True,
       'targets': list(counts.values()), 'no_new_deletions_by_this_script': True}
with (FOLDER / 'confirmed-stopped-journal-results.json').open('x', encoding='utf-8') as stream:
    json.dump(out, stream, indent=2)
print(json.dumps({'confirmed_removed_bytes': sum(x['deleted_bytes'] for x in counts.values()),
                  'confirmed_removed_files': sum(x['deleted_files'] for x in counts.values()),
                  'incomplete_lines_not_credited': incomplete}))
