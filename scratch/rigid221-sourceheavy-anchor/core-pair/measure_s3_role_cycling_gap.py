"""Surplus-S3 / role-cycling closure-gap measurement (v26 era).

Action 1 residue of docs/exact12-v24-survivor-structural-analysis-2026-08-16.md:
the Klein widening {id, xy, ab, ab.xy} was measured 2026-08-16; the
surplus-S3 shape was flagged NEEDS_RESEARCH and never measured.  This
script measures the full role-reassignment widening, which contains every
S3 cycle, and decomposes the answer by subgroup, so the S3 question is
answered as a labeled slice of a complete measurement.

Two parts:

1. v26 survivor instance analysis (decisive).  For each realized
   common-five instance of the v26 survivor that the mine classified
   unoriented, take all role reassignments of its five labels whose
   membership rows hold in the survivor cube, and ask whether every one
   of the 48 canonical orders is covered by some firing variant.
   - If YES for some instance, an orientation-widened membership family
     using exactly those variants would have blocked this survivor; the
     variant classification names the 23rd-bank family.
   - If NO for all instances, no orientation-disjunction widening of the
     common-five shape, S3 or otherwise, can block the v26 survivor.

2. Global gap count.  Over all C(12,5) = 792 unordered five-label sets,
   count the sets that are fully-widened orientable at all 48 orders
   (variants restricted to side-condition-valid assignments with
   realizable rows on the frozen candidate surface) while no assignment
   in the orbit is admissible for an installed per-pattern family
   (strict, center-exchange in both (a,b) orders).  The 22nd (core-pair)
   bank blocks conjunctions of two instances, never a single pattern.
   NOTE ON SCOPE: "uncovered" here means not admissible for the
   per-pattern orientation families strict and center-exchange, the same
   convention the 2026-08-16 Klein measurement used.  The installed
   chain also holds label-class-scoped membership families this filter
   does not replay, so the global count is an upper bound on the true
   uncovered gap.  The surplus-S3 slice (sets containing all of {3,4,5})
   is reported separately.

Diagnostic only.  Nothing here authorizes a bank, a formula, or a wave.
"""

from __future__ import annotations

import itertools
import json
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(REPO_ROOT))

from census.card_head.exact12_center_exchange_all_order_common_five_membership_family_bank import (  # noqa: E402
    EXPECTED_ROLE_COUNT,
    EXPECTED_STRICT_ORBIT_ROLE_COUNT,
    EXPECTED_WIDENED_ORBIT_ROLE_COUNT,
    _admissible_center_exchange,
    _admissible_strict,
    _common_five,
    _positions,
    _row_realizable,
    _side_conditions,
)
from census.card_head.exact12_v14_ordered_coverage import source_boundary_orders

V26_WORKDIR = REPO_ROOT / (
    "scratch/runs/exact12-rigid221-all-order-common-five/"
    "canary-v14-20260818/artifacts/workdir"
)
SURPLUS = frozenset({3, 4, 5})
ROLES = ("a", "x", "b", "c", "y")


def _load_supports() -> dict[int, frozenset[int]]:
    payload = json.loads((V26_WORKDIR / "survivor.json").read_text())
    cube = payload["cube"] if "cube" in payload else payload
    return {int(center): frozenset(row) for center, row in cube.items()}


def _validate_harness() -> None:
    widened = strict = delta = 0
    for a in range(12):
        for b in range(12):
            for c in range(12):
                for x in range(12):
                    for y in range(x + 1, 12):
                        if not _admissible_center_exchange(a, x, b, c, y):
                            continue
                        widened += 1
                        if _admissible_strict(a, x, b, c, y) or _admissible_strict(
                            a, y, b, c, x
                        ):
                            strict += 1
                        elif (
                            _row_realizable(x, (a, b) if a < b else (b, a))
                            and _row_realizable(y, (a, b) if a < b else (b, a))
                            and _row_realizable(c, tuple(sorted((b, x, y))))
                        ):
                            delta += 1
    assert widened == EXPECTED_WIDENED_ORBIT_ROLE_COUNT, widened
    assert strict == EXPECTED_STRICT_ORBIT_ROLE_COUNT, strict
    assert delta == EXPECTED_ROLE_COUNT, delta
    print(
        "harness validated against frozen pins: "
        f"widened={widened} strict={strict} delta_realizable={delta}"
    )


def _unoriented_instances(
    supports: dict[int, frozenset[int]],
) -> list[tuple[int, int, int, int, int]]:
    """Re-derive the mine's unoriented instance list independently."""

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
                has_a_row = {a, x, y} <= supports[c]
                if has_a_row and _klein_admissible(a, x, b, c, y):
                    continue
                unoriented.append((a, b, c, x, y))
    return unoriented


def _klein_admissible(a: int, x: int, b: int, c: int, y: int) -> bool:
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


def _membership_ok(
    supports: dict[int, frozenset[int]], a: int, x: int, b: int, c: int, y: int
) -> bool:
    return (
        {a, b} <= supports[x]
        and {a, b} <= supports[y]
        and {b, x, y} <= supports[c]
    )


def _variant_kind(
    base: tuple[int, int, int, int, int], variant: tuple[int, int, int, int, int]
) -> str:
    """Classify a variant by which roles moved relative to the base."""

    moved = tuple(role for role, s, t in zip(ROLES, base, variant) if s != t)
    if not moved:
        return "id"
    if set(moved) <= {"a", "b", "x", "y"}:
        ba, bx, bb, bc, by = base
        klein = {
            (ba, by, bb, bc, bx): "klein_xy",
            (bb, bx, ba, bc, by): "klein_ab",
            (bb, by, ba, bc, bx): "klein_ab_xy",
        }
        if variant in klein:
            return klein[variant]
    moved_labels = {s for s, t in zip(base, variant) if s != t}
    if moved_labels <= SURPLUS:
        return f"surplus_only:{''.join(moved)}"
    return f"other:{''.join(moved)}"


def _order_signature(order: tuple[int, ...], orientation: str) -> str:
    surplus_seq = tuple(l for l in order if l in SURPLUS)
    second_seq = tuple(l for l in order if l in (6, 7, 8, 9))
    first_seq = tuple(l for l in order if l in (10, 11))
    return (
        f"{orientation}/surplus{surplus_seq}/second{second_seq}/first{first_seq}"
    )


def _survivor_part(supports: dict[int, frozenset[int]]) -> None:
    orders = source_boundary_orders()
    positions = _positions()
    instances = _unoriented_instances(supports)
    print(f"\nv26 unoriented instances re-derived: {len(instances)}")
    fully_covered = []
    for base in instances:
        a, b, c, x, y = base
        base_axbcy = (a, x, b, c, y)
        labels = (a, b, c, x, y)
        variants = [
            v
            for v in itertools.permutations(labels)
            if _side_conditions(*v) and _membership_ok(supports, *v)
        ]
        uncovered = []
        kinds_used: set[str] = set()
        for (orientation, order), position in zip(orders, positions):
            firing = [v for v in variants if _common_five(position, *v)]
            if not firing:
                uncovered.append(_order_signature(order, orientation))
            else:
                kinds_used.update(_variant_kind(base_axbcy, v) for v in firing)
        status = "COVERED" if not uncovered else f"uncovered_orders={len(uncovered)}"
        print(
            f"  instance (a,b,c,x,y)={base}: variants={len(variants)} {status}"
        )
        if uncovered:
            for signature in uncovered[:4]:
                print(f"    e.g. {signature}")
        else:
            fully_covered.append((base, sorted(kinds_used)))
    print(f"\ninstances coverable by role-cycling widening: {len(fully_covered)}")
    for base, kinds in fully_covered:
        print(f"  {base} via variant kinds {kinds}")


def _global_part() -> None:
    positions = _positions()
    gap_sets = []
    s3_gap_sets = []
    for labels in itertools.combinations(range(12), 5):
        assignments = [
            v
            for v in itertools.permutations(labels)
            if _side_conditions(*v)
            and _row_realizable(v[1], tuple(sorted((v[0], v[2]))))
            and _row_realizable(v[4], tuple(sorted((v[0], v[2]))))
            and _row_realizable(v[3], tuple(sorted((v[2], v[1], v[4]))))
        ]
        if not assignments:
            continue
        if any(
            _admissible_center_exchange(*v)
            or _admissible_strict(*v)
            for v in assignments
        ):
            continue
        orientable = all(
            any(_common_five(position, *v) for v in assignments)
            for position in positions
        )
        if not orientable:
            continue
        gap_sets.append(labels)
        if SURPLUS <= set(labels):
            s3_gap_sets.append(labels)
    print(f"\nglobal gap five-label sets (fully-widened, realizable, uncovered): {len(gap_sets)}")
    print(f"  of these, surplus-S3 slice (contain all of 3,4,5): {len(s3_gap_sets)}")
    print(f"  total five-label sets: 792")
    if gap_sets:
        for labels in gap_sets[:10]:
            print(f"  gap set {labels}")


def main() -> None:
    _validate_harness()
    supports = _load_supports()
    _survivor_part(supports)
    _global_part()


if __name__ == "__main__":
    main()
