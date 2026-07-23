#!/usr/bin/env python3
"""Exact QF_LRA audit of the robust exact-four ``B``-minimality escape.

This checker keeps the original exact first-apex class, the retained
physical-second-apex row, the actual late-blocker row, the displayed cap
order, every triangle inequality, and every strict Kalmanson inequality.
It then adds the strongest direct selected-row consequence of global
minimality for

    B = first_apex_class ∪ physical_second_row ∪ triangle_vertices:

some center in ``B`` has an ambient four-row meeting ``A \\ B``, while no
four points of ``B`` form a radius class at that center.

The two robustness causes are checked separately:

* one exact five-point class at the physical second apex; and
* two support-disjoint exact four-point classes at distinct radii.

A SAT result is exact only in this rational linear-distance abstraction.  It
is not a Euclidean coordinate realization, a ``CounterexampleData``, a
complete critical-shell system, a model of full subset minimality, or a
model of the MEC/no-M44 contract.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
AUDIT_PATH = HERE / "audit.json"


def edge(left: int, right: int) -> tuple[int, int]:
    return tuple(sorted((left, right)))


def distance(table, left: int, right: int):
    return z3.RealVal(0) if left == right else table[edge(left, right)]


def base_solver(n: int, order: tuple[int, ...]):
    solver = z3.Solver()
    table = {
        (left, right): z3.Real(f"d_{left}_{right}")
        for left in range(n)
        for right in range(left + 1, n)
    }
    for variable in table.values():
        solver.add(variable >= 1)
    for ia, ib, ic, id_ in itertools.combinations(range(n), 4):
        a, b, c, d = order[ia], order[ib], order[ic], order[id_]
        diagonals = distance(table, a, c) + distance(table, b, d)
        solver.add(
            diagonals >= distance(table, a, b) + distance(table, c, d) + 1
        )
        solver.add(
            diagonals >= distance(table, a, d) + distance(table, b, c) + 1
        )
    for a, b, c in itertools.combinations(range(n), 3):
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
    return solver, table


def add_selected_row(solver, table, center: int, support: tuple[int, ...]) -> None:
    anchor = support[0]
    for point in support[1:]:
        solver.add(
            distance(table, center, point)
            == distance(table, center, anchor)
        )


def add_unique_exact_class(
    solver,
    table,
    n: int,
    center: int,
    support: tuple[int, ...],
) -> None:
    add_selected_row(solver, table, center, support)
    anchor = support[0]
    outside = [
        point
        for point in range(n)
        if point != center and point not in support
    ]
    for point in outside:
        solver.add(
            distance(table, center, point)
            != distance(table, center, anchor)
        )
    if len(outside) > 1:
        solver.add(
            z3.Distinct(*(distance(table, center, point) for point in outside))
        )


def add_exact_two_four_classes(
    solver,
    table,
    n: int,
    center: int,
    first: tuple[int, ...],
    second: tuple[int, ...],
) -> None:
    add_selected_row(solver, table, center, first)
    add_selected_row(solver, table, center, second)
    first_radius = distance(table, center, first[0])
    second_radius = distance(table, center, second[0])
    solver.add(first_radius != second_radius)
    outside = [
        point
        for point in range(n)
        if point != center and point not in first and point not in second
    ]
    for point in outside:
        solver.add(distance(table, center, point) != first_radius)
        solver.add(distance(table, center, point) != second_radius)
    if len(outside) > 1:
        solver.add(
            z3.Distinct(*(distance(table, center, point) for point in outside))
        )


def no_four_equal_inside(
    solver,
    table,
    center: int,
    inside: frozenset[int],
) -> None:
    candidates = sorted(inside - {center})
    for support in itertools.combinations(candidates, 4):
        anchor = support[0]
        solver.add(
            z3.Or(
                *(
                    distance(table, center, point)
                    != distance(table, center, anchor)
                    for point in support[1:]
                )
            )
        )


def find_b_escape(
    solver,
    table,
    n: int,
    B: frozenset[int],
) -> tuple[int, tuple[int, ...]] | None:
    outside = frozenset(range(n)) - B
    if not outside:
        return None
    for center in sorted(B):
        available = [point for point in range(n) if point != center]
        for support in itertools.combinations(available, 4):
            if not (set(support) & outside):
                continue
            solver.push()
            add_selected_row(solver, table, center, support)
            no_four_equal_inside(solver, table, center, B)
            if solver.check() == z3.sat:
                solver.pop()
                return center, support
            solver.pop()
    return None


def k4_constraint(table, n: int, center: int):
    available = [point for point in range(n) if point != center]
    witnesses = []
    for support in itertools.combinations(available, 4):
        anchor = support[0]
        witnesses.append(
            z3.And(
                *(
                    distance(table, center, point)
                    == distance(table, center, anchor)
                    for point in support[1:]
                )
            )
        )
    return z3.Or(*witnesses)


def add_global_k4(solver, table, n: int) -> None:
    """Require at least one four-point distance class at every carrier center."""
    for center in range(n):
        solver.add(k4_constraint(table, n, center))


def global_k4_verdict(solver, table, n: int) -> dict[str, object]:
    solver.push()
    add_global_k4(solver, table, n)
    solver.set(timeout=60_000)
    verdict = solver.check()
    result: dict[str, object] = {"status": str(verdict)}
    if verdict == z3.unknown:
        result["reason_unknown"] = solver.reason_unknown()
    solver.pop()
    if verdict == z3.unsat:
        centers = list(range(n))
        for center in list(centers):
            trial = [other for other in centers if other != center]
            solver.push()
            solver.add(*(k4_constraint(table, n, other) for other in trial))
            trial_verdict = solver.check()
            solver.pop()
            if trial_verdict == z3.unsat:
                centers = trial
        result["deletion_minimized_centers"] = centers
        individually_unsat = []
        for center in range(n):
            solver.push()
            solver.add(k4_constraint(table, n, center))
            center_verdict = solver.check()
            solver.pop()
            if center_verdict == z3.unsat:
                individually_unsat.append(center)
        result["individually_unsat_centers"] = individually_unsat
    return result


def model_distances(model, table) -> dict[str, str]:
    return {
        f"{left},{right}": str(model.eval(variable, model_completion=True))
        for (left, right), variable in sorted(table.items())
    }


def exact_five_cases() -> list[dict[str, object]]:
    n = 11
    order = (0, 5, 9, 10, 1, 3, 4, 2, 6, 7, 8)
    first_class = (3, 4, 5, 6)
    triangle = frozenset({0, 1, 2})
    cases = (
        {
            "name": "overlap_le_one",
            "late_center": 6,
            "late_class": (0, 2, 5, 10),
            "robust_class": (2, 6, 7, 8, 9),
            "physical_row": (6, 7, 8, 9),
        },
        {
            "name": "alternating_overlap_two",
            "late_center": 6,
            "late_class": (2, 4, 8, 9),
            "robust_class": (2, 6, 7, 8, 10),
            "physical_row": (2, 7, 8, 10),
        },
    )
    results: list[dict[str, object]] = []
    for case in cases:
        solver, table = base_solver(n, order)
        add_unique_exact_class(solver, table, n, 0, first_class)
        add_unique_exact_class(
            solver, table, n, int(case["late_center"]), case["late_class"]
        )
        add_unique_exact_class(solver, table, n, 1, case["robust_class"])
        B = frozenset(first_class) | frozenset(case["physical_row"]) | triangle
        escape = find_b_escape(solver, table, n, B)
        if escape is None:
            raise AssertionError(f"exact-five {case['name']} lost B escape")
        center, support = escape
        add_selected_row(solver, table, center, support)
        no_four_equal_inside(solver, table, center, B)
        if solver.check() != z3.sat:
            raise AssertionError("stored exact-five escape did not replay")
        distances = model_distances(solver.model(), table)
        hk4 = global_k4_verdict(solver, table, n)
        results.append(
            {
                **case,
                "B": sorted(B),
                "outside_B": sorted(set(range(n)) - B),
                "minimality_escape_center": center,
                "minimality_escape_row": list(support),
                "global_k4_extension": hk4,
                "status": "SAT",
                "distances": distances,
            }
        )
    return results


def second_apex_supports() -> list[tuple[int, ...]]:
    strict_cap = {8, 9, 10, 11}
    surplus_side = {0, 1, 2, 3}
    first_cap_side = {5, 6, 7}
    return [
        support
        for support in itertools.combinations(
            [point for point in range(12) if point != 4], 4
        )
        if 2 <= len(set(support) & strict_cap)
        and len(set(support) & surplus_side) <= 1
        and len(set(support) & first_cap_side) <= 1
    ]


def two_radii_case() -> dict[str, object]:
    n = 12
    order = tuple(range(n))
    first_class = (3, 5, 6, 8)
    triangle = frozenset({0, 4, 7})
    deleted = 5
    solver, table = base_solver(n, order)
    add_unique_exact_class(solver, table, n, 0, first_class)
    supports = second_apex_supports()
    for first in supports:
        for second in supports:
            if first >= second or set(first) & set(second):
                continue
            for physical_row in (first, second):
                if deleted in physical_row:
                    continue
                solver.push()
                add_exact_two_four_classes(
                    solver, table, n, 4, first, second
                )
                if solver.check() != z3.sat:
                    solver.pop()
                    continue
                for late_center in range(n):
                    if late_center in {0, 4, deleted}:
                        continue
                    available = [
                        point
                        for point in range(n)
                        if point not in {late_center, deleted}
                    ]
                    for late_class in itertools.combinations(available, 4):
                        if len(set(late_class) & set(physical_row)) > 2:
                            continue
                        if not (set(late_class) - set(first_class)):
                            continue
                        solver.push()
                        add_unique_exact_class(
                            solver, table, n, late_center, late_class
                        )
                        if solver.check() != z3.sat:
                            solver.pop()
                            continue
                        B = (
                            frozenset(first_class)
                            | frozenset(physical_row)
                            | triangle
                        )
                        escape = find_b_escape(solver, table, n, B)
                        if escape is not None:
                            center, escape_row = escape
                            add_selected_row(
                                solver, table, center, escape_row
                            )
                            no_four_equal_inside(
                                solver, table, center, B
                            )
                            if solver.check() != z3.sat:
                                raise AssertionError(
                                    "stored two-radii escape did not replay"
                                )
                            distances = model_distances(
                                solver.model(), table
                            )
                            hk4 = global_k4_verdict(
                                solver, table, n
                            )
                            return {
                                "status": "SAT",
                                "first_apex_class": list(first_class),
                                "second_apex_first_class": list(first),
                                "second_apex_second_class": list(second),
                                "physical_row": list(physical_row),
                                "deleted": deleted,
                                "late_center": late_center,
                                "late_class": list(late_class),
                                "B": sorted(B),
                                "outside_B": sorted(
                                    set(range(n)) - B
                                ),
                                "minimality_escape_center": center,
                                "minimality_escape_row": list(escape_row),
                                "global_k4_extension": hk4,
                                "distances": distances,
                            }
                        solver.pop()
                solver.pop()
    raise AssertionError("two-radii B-minimality escape became UNSAT")


def compute() -> dict[str, object]:
    return {
        "schema": "p97-unique4-robust-b-minimality-escape-v1",
        "epistemic_status": (
            "exact QF_LRA SAT witnesses for two local projections; not "
            "Euclidean realizations or CounterexampleData"
        ),
        "B_definition": (
            "original exact first-apex class union retained physical "
            "second-apex row union the three displayed Moser vertices"
        ),
        "minimality_overlay": (
            "some center in B has a selected ambient K4 row meeting A\\\\B "
            "and has no four-point radius class wholly contained in B"
        ),
        "large_class_exact_five": exact_five_cases(),
        "two_distinct_radii": two_radii_case(),
        "omitted_global_inputs": [
            "complete source-indexed critical-shell system at every source",
            "full subset-minimality beyond this one B",
            "nonlinear Euclidean coordinate realizability",
            "minimum-enclosing-circle boundary data",
            "no alternative (m,4,4) support triangle",
        ],
    }


def canonical_bytes(payload: dict[str, object]) -> bytes:
    return (
        json.dumps(payload, indent=2, sort_keys=True) + "\n"
    ).encode()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    payload = compute()
    encoded = canonical_bytes(payload)
    if args.check:
        if not AUDIT_PATH.exists():
            raise AssertionError(f"missing {AUDIT_PATH}")
        stored = AUDIT_PATH.read_bytes()
        if stored != encoded:
            raise AssertionError("stored audit drifted")
        print(
            "PASS_B_MINIMALITY_ESCAPE "
            + hashlib.sha256(encoded).hexdigest()
        )
    else:
        AUDIT_PATH.write_bytes(encoded)
        print(
            "WROTE_B_MINIMALITY_ESCAPE "
            + hashlib.sha256(encoded).hexdigest()
        )


if __name__ == "__main__":
    main()
