#!/usr/bin/env python3
"""Find nearest five-point bank antecedents around the forced live literals."""

from __future__ import annotations

import itertools
import json
from pathlib import Path

from crossed_arm_cegar import ARMS, FAMILIES, family_literals, rotations


HERE = Path(__file__).resolve().parent


def analyze(arm: str) -> dict[str, object]:
    witness = json.loads((HERE / arm / "witness.json").read_text())
    mapping = witness["live_Lean_mapping"]
    order = tuple(witness["existential_cyclic_order"])
    rows = {center: set(support) for center, support in witness["rows"].items()}
    positions = {point: index for index, point in enumerate(order)}
    bq = mapping["common_source_row_center_bq"]
    br = mapping["opposite_collision_blocker_row_center_br"]
    forced = {
        (bq, mapping["forced_common_row_point"]),
        (br, mapping["forced_opposite_row_point"]),
    }

    candidates = []
    for subset in itertools.combinations(order, 5):
        for points in rotations(subset):
            for family in FAMILIES:
                required = set(family_literals(family, points))
                used_forced = required & forced
                if not used_forced:
                    continue
                missing = sorted(
                    required - {(center, point) for center, point in required if point in rows[center]}
                )
                candidates.append(
                    {
                        "family": family,
                        "points": list(points),
                        "missing": [[c, p] for c, p in missing],
                        "missing_count": len(missing),
                        "uses_forced": [[c, p] for c, p in sorted(used_forced)],
                        "uses_both_forced": used_forced == forced,
                        "row_centers": sorted({center for center, _ in required}),
                        "cyclic_positions": [positions[p] for p in points],
                    }
                )

    both = [item for item in candidates if item["uses_both_forced"]]
    one_or_more = candidates
    min_both = min((item["missing_count"] for item in both), default=None)
    min_any = min(item["missing_count"] for item in one_or_more)
    best_both = [item for item in both if item["missing_count"] == min_both]
    best_any = [item for item in one_or_more if item["missing_count"] == min_any]
    return {
        "arm": arm,
        "forced_literals": [[c, p] for c, p in sorted(forced)],
        "minimum_missing_using_both_forced": min_both,
        "best_using_both_forced": best_both[:20],
        "best_using_both_forced_count": len(best_both),
        "minimum_missing_using_at_least_one_forced": min_any,
        "best_using_at_least_one_forced": best_any[:20],
        "best_using_at_least_one_forced_count": len(best_any),
        "note": (
            "Missing row memberships are candidate positive metric equalities only; "
            "the bounded model shows they are not consequences of the encoded bank."
        ),
    }


def main() -> None:
    result = {arm: analyze(arm) for arm in ARMS}
    (HERE / "nearest-live-bank-relations.json").write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps({
        arm: {
            "min_both": result[arm]["minimum_missing_using_both_forced"],
            "count_both": result[arm]["best_using_both_forced_count"],
            "min_any": result[arm]["minimum_missing_using_at_least_one_forced"],
            "count_any": result[arm]["best_using_at_least_one_forced_count"],
        }
        for arm in ARMS
    }, sort_keys=True))


if __name__ == "__main__":
    main()
