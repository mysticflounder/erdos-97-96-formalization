#!/usr/bin/env python3
"""Audit the selected-row closure consequence of live minimality.

This is a finite structural check of the rows already stored in the corrected
robust MARCO checkpoint.  It does not assert Euclidean realizability or prove
the Lean parent.  It asks whether a stored row system satisfies the exact
finite consequence formalized by
`FaithfulCarrierPattern.eq_carrier_of_nonempty_closed`: every nonempty subset
closed under its selected rows must be the whole represented carrier.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
DEFAULT_CHECKPOINT = (
    ROOT
    / "scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json"
)


def row_closure(seed: str, rows: dict[str, set[str]]) -> frozenset[str]:
    closure = {seed}
    changed = True
    while changed:
        changed = False
        for center in tuple(closure):
            before = len(closure)
            closure.update(rows[center])
            changed = changed or len(closure) != before
    return frozenset(closure)


def audit(checkpoint: Path) -> dict[str, object]:
    checkpoint_bytes = checkpoint.read_bytes()
    payload = json.loads(checkpoint_bytes)
    survivors = payload["structural_survivors"]
    records: list[dict[str, object]] = []
    full_count = 0
    target_hold_count = 0
    total_blocker_map_count = 0
    for ordinal, survivor in enumerate(survivors):
        rows = {
            row["center"]: set(row["support"])
            for row in survivor["rows"]
        }
        if len(rows) != len(survivor["rows"]):
            raise ValueError(f"survivor {ordinal} repeats a row center")
        malformed = sorted(
            center
            for center, support in rows.items()
            if len(support) != 4 or center in support
        )
        if malformed:
            raise ValueError(
                f"survivor {ordinal} has malformed selected rows: {malformed}"
            )
        centers = frozenset(rows)
        blockers = survivor["blockers"]
        blocker_map_total = (
            frozenset(blockers) == centers
            and set(blockers.values()) <= centers
        )
        total_blocker_map_count += int(blocker_map_total)
        if not blocker_map_total:
            raise ValueError(f"survivor {ordinal} has a non-total blocker map")
        unknown = sorted(set().union(*rows.values()) - centers)
        if unknown:
            raise ValueError(f"survivor {ordinal} has unrepresented labels: {unknown}")
        closures = {seed: row_closure(seed, rows) for seed in centers}
        full = all(value == centers for value in closures.values())
        full_count += int(full)
        target_holds = survivor["sharpened_live_target"]["holds"]
        target_hold_count += int(target_holds)
        proper = sorted(
            {tuple(sorted(value)) for value in closures.values() if value != centers},
            key=lambda value: (len(value), value),
        )
        records.append(
            {
                "ordinal": ordinal,
                "iteration": survivor["iteration"],
                "all_single_seed_closures_full": full,
                "sharpened_live_target_holds": target_holds,
                "smallest_proper_closed_set": list(proper[0]) if proper else None,
                "smallest_proper_closed_card": len(proper[0]) if proper else None,
                "proper_single_seed_closure_count": sum(
                    value != centers for value in closures.values()
                ),
            }
        )
    return {
        "checkpoint": str(checkpoint.relative_to(ROOT)),
        "checkpoint_sha256": hashlib.sha256(checkpoint_bytes).hexdigest(),
        "checkpoint_status": payload["status"],
        "bank_cut_count": len(payload["bank_cuts"]),
        "survivor_count": len(survivors),
        "total_blocker_map_count": total_blocker_map_count,
        "sharpened_live_target_hold_count": target_hold_count,
        "sharpened_live_target_avoid_count": len(survivors) - target_hold_count,
        "minimal_closure_surface_pass_count": full_count,
        "minimal_closure_surface_fail_count": len(survivors) - full_count,
        "records": records,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--checkpoint", type=Path, default=DEFAULT_CHECKPOINT)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--expect-sha256")
    parser.add_argument("--expect-survivors", type=int)
    parser.add_argument("--summary", action="store_true")
    args = parser.parse_args()
    result = audit(args.checkpoint.resolve())
    if args.check:
        if args.expect_sha256 is not None:
            assert result["checkpoint_sha256"] == args.expect_sha256
        if args.expect_survivors is not None:
            assert result["survivor_count"] == args.expect_survivors
        assert (
            result["minimal_closure_surface_pass_count"]
            + result["minimal_closure_surface_fail_count"]
            == result["survivor_count"]
        )
    if args.summary:
        result.pop("records")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
