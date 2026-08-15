#!/usr/bin/env python3
"""Measure the checked fixed-pair consumer predicates in exact-12 survivors.

This is diagnostic model mining only.  It does not prove that any reported
predicate follows from the Lean residual or that the SAT abstraction is a
complete representation of that residual.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path

from probe import PHYSICAL_APEX, U, XV, XU


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("journal", type=Path)
    parser.add_argument("--deleted", type=int, default=0)
    parser.add_argument("--other", type=int, default=2)
    args = parser.parse_args()

    records = [json.loads(line) for line in args.journal.read_text().splitlines()]
    masks: Counter[str] = Counter()
    predicate_counts: Counter[str] = Counter()
    collision_counts: Counter[str] = Counter()
    examples: dict[str, int] = {}

    physical_after_u = {args.deleted, args.other, XV, XU}
    names = (
        "center_xu_in_physical_after_u",
        "physical_apex_in_Kxu",
        "center_deleted_in_Kxu",
        "physical_apex_in_Kdeleted",
        "center_xu_in_Kdeleted",
    )

    for record in records:
        model = record["source_model"]
        blockers = {int(q): int(a) for q, a in model["blockers"].items()}
        cube = {int(a): set(row) for a, row in model["cube"].items()}
        center_xu = blockers[XU]
        center_deleted = blockers[args.deleted]
        values = (
            center_xu in physical_after_u,
            PHYSICAL_APEX in cube[center_xu],
            center_deleted in cube[center_xu],
            PHYSICAL_APEX in cube[center_deleted],
            center_xu in cube[center_deleted],
        )
        mask = "".join("1" if value else "0" for value in values)
        masks[mask] += 1
        examples.setdefault(mask, record["iteration"])
        for name, value in zip(names, values, strict=True):
            if value:
                predicate_counts[name] += 1

        collision_counts[
            "xu_deleted_blockers_equal"
            if center_xu == center_deleted
            else "xu_deleted_blockers_distinct"
        ] += 1
        collision_counts[
            "xu_blocker_is_physical_apex"
            if center_xu == PHYSICAL_APEX
            else "xu_blocker_not_physical_apex"
        ] += 1
        collision_counts[
            "deleted_blocker_is_physical_apex"
            if center_deleted == PHYSICAL_APEX
            else "deleted_blocker_not_physical_apex"
        ] += 1

    report = {
        "schema": "p97_pentagon_offclass_exact12_fixed_pair_predicate_mining.v1",
        "scope": "empirical SAT survivor statistics; not a source producer or proof",
        "journal": str(args.journal),
        "records": len(records),
        "roles": {
            "deleted": args.deleted,
            "other_physical_point": args.other,
            "u": U,
            "xv": XV,
            "xu": XU,
            "physical_apex": PHYSICAL_APEX,
        },
        "predicate_order": list(names),
        "predicate_counts": dict(sorted(predicate_counts.items())),
        "five_predicate_mask_counts": dict(sorted(masks.items())),
        "first_iteration_by_mask": dict(sorted(examples.items())),
        "collision_counts": dict(sorted(collision_counts.items())),
    }
    output = args.journal.parent / "fixed-pair-predicate-analysis.json"
    output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "output": str(output),
        "records": len(records),
        "masks": dict(sorted(masks.items())),
        "predicate_counts": dict(sorted(predicate_counts.items())),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
