"""Analyze the enumerated v26 projected model space.

Consumes v26_projected_models.json written by
enumerate_v26_projected_models.py.  For every enumerated cube:

1. does it carry the six frozen anchor-star rows (centers 0,1,2,3,4,9
   byte-identical to the v24/v25/v26 frozen values)?
2. how many realized common-five instances does it hold that are not
   strict/center-exchange/klein admissible, and is any of them coverable
   by a role-cycling orientation widening (variants restricted to
   membership-valid reassignments, per the 2026-08-20 measurement)?

A cube with zero coverable instances cannot be removed by any
orientation-widened common-five family.  The count of such cubes is the
residue beyond the entire orientation-family vocabulary.

Diagnostic only, over unauthenticated enumeration output.
"""

from __future__ import annotations

import itertools
import json
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(REPO_ROOT))

from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (  # noqa: E402
    _admissible_center_exchange,
    _admissible_strict,
    _common_five,
    _positions,
    _side_conditions,
)

FROZEN_STAR = {
    0: frozenset({1, 2, 3, 4}),
    1: frozenset({0, 3, 6, 8}),
    2: frozenset({0, 1, 10, 11}),
    3: frozenset({0, 5, 7, 9}),
    4: frozenset({0, 5, 6, 10}),
    9: frozenset({0, 3, 7, 11}),
}


def _klein_admissible(a, x, b, c, y):
    variants = [
        v
        for v in ((a, x, b, c, y), (a, y, b, c, x), (b, x, a, c, y), (b, y, a, c, x))
        if _side_conditions(*v)
    ]
    if not variants:
        return False
    return all(
        any(_common_five(position, *v) for v in variants)
        for position in _positions()
    )


def _membership_ok(supports, a, x, b, c, y):
    return (
        {a, b} <= supports[x]
        and {a, b} <= supports[y]
        and {b, x, y} <= supports[c]
    )


def _unoriented_instances(supports):
    unoriented = []
    for x, y in itertools.combinations(range(12), 2):
        common = supports[x] & supports[y]
        for a, b in itertools.permutations(sorted(common), 2):
            for c in range(12):
                if c in (a, b, x, y):
                    continue
                if not {b, x, y} <= supports[c]:
                    continue
                if _admissible_strict(a, x, b, c, y) or _admissible_strict(
                    a, y, b, c, x
                ):
                    continue
                if _admissible_center_exchange(a, x, b, c, y):
                    continue
                if {a, x, y} <= supports[c] and _klein_admissible(a, x, b, c, y):
                    continue
                unoriented.append((a, b, c, x, y))
    return unoriented


def _coverable(supports, base):
    a, b, c, x, y = base
    labels = (a, b, c, x, y)
    variants = [
        v
        for v in itertools.permutations(labels)
        if _side_conditions(*v) and _membership_ok(supports, *v)
    ]
    if not variants:
        return False
    return all(
        any(_common_five(position, *v) for v in variants)
        for position in _positions()
    )


def main(path: Path) -> None:
    payload = json.loads(path.read_text())
    print(
        f"enumeration complete={payload['complete']} count={payload['count']}"
    )
    star_holders = 0
    uncoverable_cubes = 0
    coverable_report = []
    for number, cube_json in enumerate(payload["cubes"], start=1):
        supports = {int(k): frozenset(v) for k, v in cube_json.items()}
        has_star = all(supports[c] == row for c, row in FROZEN_STAR.items())
        star_holders += has_star
        instances = _unoriented_instances(supports)
        coverable = [i for i in instances if _coverable(supports, i)]
        if coverable:
            coverable_report.append((number, len(instances), coverable))
        else:
            uncoverable_cubes += 1
        print(
            f"cube {number}: frozen_star={has_star} "
            f"unoriented={len(instances)} coverable={len(coverable)}"
        )
    print(f"\ncubes carrying the full frozen anchor star: {star_holders}/{payload['count']}")
    print(f"cubes with NO orientation-coverable instance: {uncoverable_cubes}/{payload['count']}")
    for number, total, coverable in coverable_report:
        print(f"  cube {number}: {len(coverable)}/{total} coverable, e.g. {coverable[:3]}")


if __name__ == "__main__":
    main(Path(sys.argv[1]))
