"""Read-only comparison of the historical NamedOrder-1 scans.

This intentionally imports the production scanner but writes no production
artifact.  The `old` order is the v2 interpretation (cyclic reversal); the
`corrected` order is the v3 Lean table (swap labels 9 and 12).
"""
from __future__ import annotations

import json
import argparse
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
from census.atail_force import producer_bank

ORDER0 = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
CORRECTED = (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
OLD = tuple(reversed(ORDER0))
NAMES = (
    "twenty-second", "twenty-third", "twenty-fourth", "twenty-fifth",
    "twenty-sixth", "twenty-seventh", "twenty-eighth", "twenty-ninth",
    "thirtieth", "thirty-first",
)


def key(record: dict) -> str:
    return json.dumps(record, sort_keys=True, separators=(",", ":"))


def scan(path: Path, order: tuple[int, ...]) -> tuple[dict, ...]:
    obj = json.loads(path.read_text())
    rows = [
        producer_bank.MetricRow(int(center), tuple(points), exact=False)
        for center, points in sorted(obj["rows"].items(), key=lambda pair: int(pair[0]))
    ]
    return tuple(producer_bank.scan_all_formalized_cores(rows, 17, order))


def short(record: dict) -> str:
    return ";".join(
        f"{record.get('stage')}|{record.get('orientation')}|{record.get('lean_consumer')}"
        for record in [record]
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("names", nargs="*", default=NAMES)
    selected = tuple(parser.parse_args().names)
    base = ROOT / "scratch/exact17-lean-to-sat"
    print(f"orders old={OLD} corrected={CORRECTED}")
    total_old = total_new = total_add = total_drop = 0
    for name in selected:
        path = base / f"piqd-{name}-root-model-analysis.json"
        old = scan(path, OLD)
        new = scan(path, CORRECTED)
        old_keys, new_keys = {key(x) for x in old}, {key(x) for x in new}
        added = [x for x in new if key(x) not in old_keys]
        dropped = [x for x in old if key(x) not in new_keys]
        total_old += len(old); total_new += len(new)
        total_add += len(added); total_drop += len(dropped)
        print(f"{name}\told={len(old)}\tcorrected={len(new)}\tadded={len(added)}\tdropped={len(dropped)}")
        for label, records in (("ADD", added), ("DROP", dropped)):
            for record in records:
                print(f"  {label}\t{short(record)}")
    print(f"TOTAL\told={total_old}\tcorrected={total_new}\tadded={total_add}\tdropped={total_drop}")


if __name__ == "__main__":
    main()
