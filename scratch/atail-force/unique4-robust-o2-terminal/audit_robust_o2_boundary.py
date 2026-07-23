#!/usr/bin/env python3
"""Audit the honest local geometry of the exact-four robust-O2 ingress.

This is deliberately a local QF_LRA audit of the large-class subarm.  It
tests the exact first-apex four-class, one exact late-blocker class, and one
exact five-point robust class at the second apex against every strict
Kalmanson inequality and every triangle inequality in one cap-compatible
boundary order.  It does not audit the alternative robust mode with two
disjoint K4 radii.  It is not a model of ``CounterexampleData`` and does not
encode global minimality or ``noM44``.
"""

from __future__ import annotations

import hashlib
import argparse
import itertools
import json
import random
from pathlib import Path

import z3


VERTICES = tuple(range(11))
ORDER = (0, 5, 9, 10, 1, 3, 4, 2, 6, 7, 8)
FIRST_APEX = 0
SECOND_APEX = 1
DELETED = 3
EXACT_FIRST_CLASS = frozenset({3, 4, 5, 6})
STRICT_FIRST_CAP = frozenset({3, 4})
SURPLUS_CAP = frozenset({0, 1, 5, 9, 10})
FIRST_OPPOSITE_CAP = frozenset({1, 2, 3, 4})
SECOND_OPPOSITE_CAP = frozenset({0, 2, 6, 7, 8})
STRICT_SECOND_CAP = frozenset({6, 7, 8})


def edge(left: int, right: int) -> tuple[int, int]:
    return tuple(sorted((left, right)))


def distance(
    table: dict[tuple[int, int], z3.ArithRef], left: int, right: int
) -> z3.ArithRef:
    return z3.RealVal(0) if left == right else table[edge(left, right)]


def add_exact_class(
    solver: z3.Solver,
    table: dict[tuple[int, int], z3.ArithRef],
    center: int,
    support: frozenset[int],
) -> None:
    anchor = min(support)
    radius = distance(table, center, anchor)
    for point in support:
        solver.add(distance(table, center, point) == radius)
    outside = [point for point in VERTICES if point != center and point not in support]
    for point in outside:
        solver.add(distance(table, center, point) != radius)
    # This also prevents an unrecorded second K4 class at the center.
    solver.add(z3.Distinct(*(distance(table, center, point) for point in outside)))


def add_base_geometry() -> tuple[z3.Solver, dict[tuple[int, int], z3.ArithRef]]:
    solver = z3.Solver()
    table = {
        (left, right): z3.Real(f"d_{left}_{right}")
        for left in VERTICES
        for right in VERTICES
        if left < right
    }
    for variable in table.values():
        solver.add(variable >= 1)
    for ia, ib, ic, id_ in itertools.combinations(range(len(ORDER)), 4):
        a, b, c, d = ORDER[ia], ORDER[ib], ORDER[ic], ORDER[id_]
        diagonals = distance(table, a, c) + distance(table, b, d)
        solver.add(
            diagonals >= distance(table, a, b) + distance(table, c, d) + 1
        )
        solver.add(
            diagonals >= distance(table, a, d) + distance(table, b, c) + 1
        )
    for a, b, c in itertools.combinations(VERTICES, 3):
        solver.add(
            distance(table, a, b) + distance(table, b, c)
            >= distance(table, a, c)
        )
        solver.add(
            distance(table, a, c) + distance(table, b, c)
            >= distance(table, a, b)
        )
        solver.add(
            distance(table, a, b) + distance(table, a, c)
            >= distance(table, b, c)
        )
    add_exact_class(solver, table, FIRST_APEX, EXACT_FIRST_CLASS)
    # Exact-four bisector localization for the selected strict pair {3,4}.
    for center in VERTICES:
        if center not in {FIRST_APEX, *STRICT_FIRST_CAP}:
            solver.add(
                distance(table, center, 3) != distance(table, center, 4)
            )
    return solver, table


def alternates(center1: int, center2: int, point1: int, point2: int) -> bool:
    position = {vertex: index for index, vertex in enumerate(ORDER)}
    n = len(ORDER)

    def between(start: int, stop: int, point: int) -> bool:
        width = (position[stop] - position[start]) % n
        offset = (position[point] - position[start]) % n
        return 0 < offset < width

    return between(center1, center2, point1) != between(
        center1, center2, point2
    )


def cap_bound_ok(center: int, support: frozenset[int]) -> bool:
    if center in SURPLUS_CAP - {0, 1}:
        return len(support & SURPLUS_CAP) <= 2
    if center in FIRST_OPPOSITE_CAP - {1, 2}:
        return len(support & FIRST_OPPOSITE_CAP) <= 2
    if center in SECOND_OPPOSITE_CAP - {0, 2}:
        return len(support & SECOND_OPPOSITE_CAP) <= 2
    return True


def rejected_old_fixture() -> dict[str, object]:
    orders = [
        (0,) + surplus + (1,) + first_cap + (2,) + second_cap
        for surplus in itertools.permutations((5, 9, 10))
        for first_cap in itertools.permutations((3, 4))
        for second_cap in itertools.permutations((6, 7, 8))
    ]
    rejected = 0
    for order in orders:
        rank = {vertex: index for index, vertex in enumerate(order)}
        # Rows 0 and 1 both contain {4,6}.  This order is exactly the K2
        # same-side arrangement 0 < 1 < 4 < 6.
        if rank[0] < rank[1] < rank[4] < rank[6]:
            rejected += 1
    if rejected != len(orders):
        raise AssertionError("old fixture was not uniformly rejected")
    return {
        "cap_compatible_order_count": len(orders),
        "orders_rejected_by_rows_0_and_1": rejected,
        "row_0": [3, 4, 5, 6],
        "row_1": [4, 6, 8, 9],
        "shared_pair": [4, 6],
        "normalized_core": [
            "row_0_4_6",
            "row_1_4_6",
            "kal2_0_1_4_6",
        ],
        "classification": (
            "nonalternating shared pair; already excluded by the "
            "two-center bisector-parity consumer"
        ),
    }


def model_distances(
    model: z3.ModelRef, table: dict[tuple[int, int], z3.ArithRef]
) -> dict[str, str]:
    return {
        f"{left},{right}": str(model.eval(variable, model_completion=True))
        for (left, right), variable in sorted(table.items())
    }


def search() -> dict[str, object]:
    solver, table = add_base_geometry()
    rng = random.Random(0)
    candidates: list[
        tuple[frozenset[int], frozenset[int], int, frozenset[int]]
    ] = []
    for surplus_point in (5, 9, 10):
        for other_point in (2, 4):
            robust_class = STRICT_SECOND_CAP | {surplus_point, other_point}
            for second_row_tuple in itertools.combinations(sorted(robust_class), 4):
                second_row = frozenset(second_row_tuple)
                for late_center in VERTICES:
                    if late_center in {FIRST_APEX, SECOND_APEX, DELETED}:
                        continue
                    available = [
                        point
                        for point in VERTICES
                        if point not in {late_center, DELETED}
                    ]
                    for first_row_tuple in itertools.combinations(available, 4):
                        first_row = frozenset(first_row_tuple)
                        if len(first_row & EXACT_FIRST_CLASS) > 2:
                            continue
                        if not (first_row - EXACT_FIRST_CLASS):
                            continue
                        if not cap_bound_ok(late_center, first_row):
                            continue
                        overlap = first_row & second_row
                        if len(overlap) > 2:
                            continue
                        if len(overlap) == 2 and not alternates(
                            late_center, SECOND_APEX, *sorted(overlap)
                        ):
                            continue
                        candidates.append(
                            (robust_class, second_row, late_center, first_row)
                        )
    rng.shuffle(candidates)

    found: dict[str, object] = {}
    for robust_class, second_row, late_center, first_row in candidates:
        overlap_size = len(first_row & second_row)
        target = "overlap_le_one" if overlap_size <= 1 else "alternating_overlap_two"
        if target in found:
            continue
        solver.push()
        add_exact_class(solver, table, late_center, first_row)
        add_exact_class(solver, table, SECOND_APEX, robust_class)
        solver.set(timeout=10_000)
        verdict = solver.check()
        if verdict == z3.sat:
            overlap = sorted(first_row & second_row)
            found[target] = {
                "status": "SAT",
                "late_center": late_center,
                "exact_first_class": sorted(EXACT_FIRST_CLASS),
                "late_blocker_exact_class": sorted(first_row),
                "second_apex_selected_row": sorted(second_row),
                "second_apex_robust_five_class": sorted(robust_class),
                "selected_row_overlap": overlap,
                "overlap_alternates": (
                    None
                    if len(overlap) < 2
                    else alternates(late_center, SECOND_APEX, *overlap)
                ),
                "distances": model_distances(solver.model(), table),
            }
        solver.pop()
        if len(found) == 2:
            break
    return {
        "schema": "p97-unique4-robust-o2-local-boundary-v1",
        "robust_subarm": (
            "one exact five-point second-apex class; the two-disjoint-K4-"
            "radii subarm is not encoded"
        ),
        "epistemic_status": (
            "exact QF_LRA witnesses for a local projection; not Euclidean "
            "realizations and not CounterexampleData"
        ),
        "boundary_order": list(ORDER),
        "fixed_deleted_point": DELETED,
        "rejected_old_fixture": rejected_old_fixture(),
        "cases": found,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    output = search()
    path = Path(__file__).with_name("audit.json")
    encoded = json.dumps(output, indent=2, sort_keys=True) + "\n"
    if args.check:
        stored = path.read_text(encoding="utf-8")
        if stored != encoded:
            raise SystemExit("stored audit.json does not match exact replay")
        print("OK: stored audit.json matches exact replay")
    else:
        path.write_text(encoded, encoding="utf-8")
        print(encoded, end="")
    print("sha256", hashlib.sha256(encoded.encode()).hexdigest())
    if set(output["cases"]) != {"overlap_le_one", "alternating_overlap_two"}:
        raise SystemExit("did not find both honest local cases")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
