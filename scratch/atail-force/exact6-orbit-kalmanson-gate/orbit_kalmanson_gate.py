#!/usr/bin/env python3
"""Exact strict-metric/Kalmanson gate for the seven exact-six mutual orbits.

This is a projected abstract-distance test.  It keeps exactly the four
complete rows exposed by ``ExactSixMutualCompleteRowManifest``:

* the physical-apex exact-five radius class;
* the continuation unused-source critical row;
* the mutual-source critical row; and
* the mutual-target critical row.

No anonymous row is added.  SAT means only that the displayed exact rows and
all linear consequences of one strict convex boundary order are compatible.
It is not a planar Euclidean, MEC, total-CSS, minimality, or noM44 model.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from concurrent.futures import ProcessPoolExecutor
from dataclasses import dataclass
from fractions import Fraction
from itertools import combinations, permutations
from pathlib import Path
from typing import Iterable

import numpy as np
import z3
from scipy.optimize import linprog
from scipy.sparse import csr_matrix


ORBITS = (
    "continuationOrder",
    "reverseContinuationOrder",
    "sharesFirstAtSource",
    "sharesFirstAtTarget",
    "sharesSecondAtSource",
    "sharesSecondAtTarget",
    "fourDistinct",
)

PHYSICAL = ("p0", "p1", "p2", "p3")
APEX_PRIVATE = ("a0", "a1")
UNUSED_PRIVATE = ("u0", "u1", "u2")
SOURCE_PRIVATE = ("s0", "s1", "s2")
TARGET_PRIVATE = ("t0", "t1", "t2")
BLOCKERS = ("bu", "bs", "bt")
APEX = "o"
UNUSED = "u"


def edge(a: str, b: str) -> tuple[str, str]:
    if a == b:
        raise ValueError(f"loop edge at {a}")
    return tuple(sorted((a, b)))


def qstr(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"{value.numerator}/{value.denominator}"


@dataclass(frozen=True)
class Cell:
    orbit: str
    cap_kind: str
    physical_card: int
    cap_boundary: tuple[str, ...]

    @property
    def name(self) -> str:
        return f"{self.orbit}__{self.cap_kind}__{'-'.join(self.cap_boundary)}"


def role_map(orbit: str) -> dict[str, str]:
    roles = {
        "first": "p0",
        "second": "p1",
    }
    if orbit == "continuationOrder":
        roles.update(source="p0", target="p1")
    elif orbit == "reverseContinuationOrder":
        roles.update(source="p1", target="p0")
    elif orbit == "sharesFirstAtSource":
        roles.update(source="p0", target="p2")
    elif orbit == "sharesFirstAtTarget":
        roles.update(source="p2", target="p0")
    elif orbit == "sharesSecondAtSource":
        roles.update(source="p1", target="p2")
    elif orbit == "sharesSecondAtTarget":
        roles.update(source="p2", target="p1")
    elif orbit == "fourDistinct":
        roles.update(source="p2", target="p3")
    else:
        raise ValueError(orbit)
    return roles


def cells_for_orbit(orbit: str) -> list[Cell]:
    cells: list[Cell] = []
    if orbit != "fourDistinct":
        for interior in permutations(("p0", "p1", "p2", UNUSED)):
            cells.append(Cell(
                orbit=orbit,
                cap_kind="physical3_unusedInterior",
                physical_card=3,
                cap_boundary=("el", *interior, "er"),
            ))
        # Global boundary reversal exchanges the two cap endpoints.  Fixing
        # the unused source at the left endpoint is therefore one complete
        # representative set for the endpoint case.
        for interior in permutations(("p0", "p1", "p2", "x")):
            cells.append(Cell(
                orbit=orbit,
                cap_kind="physical3_unusedEndpoint_modReflection",
                physical_card=3,
                cap_boundary=(UNUSED, *interior, "er"),
            ))
    for interior in permutations(PHYSICAL):
        cells.append(Cell(
            orbit=orbit,
            cap_kind="physical4_unusedEndpoint_modReflection",
            physical_card=4,
            cap_boundary=(UNUSED, *interior, "er"),
        ))
    return cells


def boundary_of(cell: Cell) -> tuple[str, ...]:
    # The cap chain is consecutive.  Every other named carrier point is put
    # on the complementary chain, which contains the opposite physical apex.
    # Their order is a legal witness choice; the live packet does not force it.
    complement = (
        "bu", "u0", "bs", "s0", "bt", "t0", "a0", APEX, "a1",
        "u1", "u2", "s1", "s2", "t1", "t2",
    )
    return (*cell.cap_boundary, *complement)


def supports_of(cell: Cell) -> dict[str, tuple[str, ...]]:
    roles = role_map(cell.orbit)
    physical = PHYSICAL[:cell.physical_card]
    apex_tail = APEX_PRIVATE[:5 - cell.physical_card]
    return {
        APEX: (*physical, *apex_tail),
        "bu": (UNUSED, *UNUSED_PRIVATE),
        "bs": (roles["source"], *SOURCE_PRIVATE),
        "bt": (roles["target"], *TARGET_PRIVATE),
    }


def solve_cell(
    cell: Cell,
    keep_ledger: bool = False,
    enforce_full_filters: bool = True,
) -> dict[str, object]:
    boundary = boundary_of(cell)
    points = tuple(boundary)
    assert len(points) == len(set(points)) == 21
    supports = supports_of(cell)
    roles = role_map(cell.orbit)
    assert all(len(support) in (4, 5) for support in supports.values())
    assert len(supports[APEX]) == 5
    assert roles["source"] != roles["target"]

    # Source-faithful cap-local counting gate.  The physical cap is one
    # consecutive six-vertex chain.  Its complementary chain is split at the
    # opposite physical apex into the two adjacent caps.
    apex_index = boundary.index(APEX)
    physical_cap = set(cell.cap_boundary)
    adjacent_before = set(boundary[len(cell.cap_boundary) - 1:apex_index + 1])
    adjacent_after = set(boundary[apex_index:]) | {cell.cap_boundary[0]}
    assert APEX in adjacent_before & adjacent_after
    assert not physical_cap & {"bu", "bs", "bt"}
    assert {"bu", "bs", "bt"} < adjacent_before
    if cell.physical_card == 3:
        assert len(set(supports[APEX]) & adjacent_before) == 1
        assert len(set(supports[APEX]) & adjacent_after) == 1
    else:
        assert len(set(supports[APEX]) & (adjacent_before | adjacent_after)) == 1
    for center in BLOCKERS:
        assert len(set(supports[center]) & adjacent_before) <= 2

    all_edges = tuple(edge(a, b) for a, b in combinations(points, 2))
    parent = {item: item for item in all_edges}

    def find(item: tuple[str, str]) -> tuple[str, str]:
        while parent[item] != item:
            parent[item] = parent[parent[item]]
            item = parent[item]
        return item

    def union(left: tuple[str, str], right: tuple[str, str]) -> None:
        left_root, right_root = find(left), find(right)
        if left_root != right_root:
            parent[max(left_root, right_root)] = min(left_root, right_root)

    # Quotient the distance terms by exactly the four displayed row equalities.
    for center, support in supports.items():
        radius_edge = edge(center, support[0])
        for point in support[1:]:
            union(radius_edge, edge(center, point))

    representatives = sorted({find(item) for item in all_edges})
    variable_index = {item: index for index, item in enumerate(representatives)}
    edge_index = {item: variable_index[find(item)] for item in all_edges}

    def vi(a: str, b: str) -> int:
        return edge_index[edge(a, b)]

    base_rows: list[dict[int, int]] = []

    def add_row(terms: Iterable[tuple[int, int]]) -> bool:
        row: dict[int, int] = {}
        for index, coefficient in terms:
            row[index] = row.get(index, 0) + coefficient
        row = {index: coefficient for index, coefficient in row.items() if coefficient}
        if not row:
            return False
        base_rows.append(row)
        return True

    # Every named point is a distinct vertex of one strictly convex polygon.
    # All rows are stored as linear_expression <= -1.
    for a, b, c in combinations(points, 3):
        if not add_row(((vi(a, c), 1), (vi(a, b), -1), (vi(b, c), -1))):
            return {"cell": cell.name, "orbit": cell.orbit, "status": "unsat",
                    "reason": "strict triangle cancels after row quotient"}
        if not add_row(((vi(b, c), 1), (vi(a, b), -1), (vi(a, c), -1))):
            return {"cell": cell.name, "orbit": cell.orbit, "status": "unsat",
                    "reason": "strict triangle cancels after row quotient"}
        if not add_row(((vi(a, b), 1), (vi(a, c), -1), (vi(b, c), -1))):
            return {"cell": cell.name, "orbit": cell.orbit, "status": "unsat",
                    "reason": "strict triangle cancels after row quotient"}
    for ia, ib, ic, id_ in combinations(range(len(boundary)), 4):
        a, b, c, d = (boundary[index] for index in (ia, ib, ic, id_))
        if not add_row(((vi(a, b), 1), (vi(c, d), 1),
                        (vi(a, c), -1), (vi(b, d), -1))):
            return {"cell": cell.name, "orbit": cell.orbit, "status": "unsat",
                    "reason": "first Kalmanson inequality cancels after row quotient"}
        if not add_row(((vi(a, d), 1), (vi(b, c), 1),
                        (vi(a, c), -1), (vi(b, d), -1))):
            return {"cell": cell.name, "orbit": cell.orbit, "status": "unsat",
                    "reason": "second Kalmanson inequality cancels after row quotient"}

    apex_outside = [
        point for point in points if point not in {*supports[APEX], APEX}
    ]
    filter_pairs: list[tuple[int, int]] = []
    if enforce_full_filters:
        for center, support in supports.items():
            radius_index = vi(center, support[0])
            for point in points:
                if point not in {*support, center}:
                    outside_index = vi(center, point)
                    if outside_index == radius_index:
                        return {"cell": cell.name, "orbit": cell.orbit, "status": "unsat",
                                "reason": "full-filter exclusion collapsed by row quotient"}
                    filter_pairs.append((outside_index, radius_index))
        # Pairwise-distinct off-class apex distances are a legal cell satisfying
        # the profile's unique-K4-radius field.
        for left, right in combinations(apex_outside, 2):
            left_index, right_index = vi(APEX, left), vi(APEX, right)
            if left_index == right_index:
                return {"cell": cell.name, "orbit": cell.orbit, "status": "unsat",
                        "reason": "unique apex off-class distances collapsed"}
            filter_pairs.append((left_index, right_index))

    def matrix(rows: list[dict[int, int]]) -> csr_matrix:
        data: list[int] = []
        row_indices: list[int] = []
        column_indices: list[int] = []
        for row_index, row in enumerate(rows):
            for column_index, coefficient in row.items():
                data.append(coefficient)
                row_indices.append(row_index)
                column_indices.append(column_index)
        return csr_matrix(
            (data, (row_indices, column_indices)),
            shape=(len(rows), len(representatives)),
            dtype=float,
        )

    def objective(seed: int) -> np.ndarray:
        values = []
        for index in range(len(representatives)):
            digest = hashlib.sha256(f"{cell.name}:{seed}:{index}".encode()).digest()
            integer = int.from_bytes(digest[:8], "big")
            values.append((integer / (2**64 - 1)) * 2 - 1)
        return np.asarray(values)

    def run_lp(rows: list[dict[int, int]], seed: int):
        return linprog(
            objective(seed),
            A_ub=matrix(rows),
            b_ub=-np.ones(len(rows)),
            bounds=[(1, 100_000)] * len(representatives),
            method="highs",
            options={"presolve": True},
        )

    solution = None
    oriented_rows: list[dict[int, int]] = []
    for seed in range(16):
        relaxed = run_lp(base_rows, seed)
        if not relaxed.success:
            if relaxed.status == 2:
                return {"cell": cell.name, "orbit": cell.orbit, "status": "unsat",
                        "reason": "strict metric and Kalmanson LP infeasible"}
            continue
        candidate_rows = list(base_rows)
        for left, right in filter_pairs:
            if relaxed.x[left] >= relaxed.x[right]:
                candidate_rows.append({right: 1, left: -1})
            else:
                candidate_rows.append({left: 1, right: -1})
        branched = run_lp(candidate_rows, seed + 1000)
        if branched.success:
            solution = branched.x
            oriented_rows = candidate_rows
            break
    if solution is None:
        return {
            "cell": cell.name,
            "orbit": cell.orbit,
            "cap_kind": cell.cap_kind,
            "physical_card": cell.physical_card,
            "cap_boundary": list(cell.cap_boundary),
            "boundary": list(boundary),
            "status": "unknown",
            "reason": "no full-filter sign branch found from 16 deterministic LP seeds",
        }

    # Scale away all floating tolerances, reconstruct rationals, and then replay
    # every inequality exactly.  The final witness is the Fraction ledger, not
    # the floating HiGHS output.
    qvalues = [Fraction(float(item) * 1000).limit_denominator(10**9) for item in solution]
    assert min(qvalues) >= 1
    for row in oriented_rows:
        assert sum(Fraction(coefficient) * qvalues[index]
                   for index, coefficient in row.items()) <= -1

    def value(a: str, b: str) -> Fraction:
        return qvalues[vi(a, b)]

    distance_values = {edge(a, b): value(a, b) for a, b in combinations(points, 2)}
    triangle_margins: list[Fraction] = []
    for a, b, c in combinations(points, 3):
        triangle_margins.extend((
            value(a, b) + value(b, c) - value(a, c),
            value(a, b) + value(a, c) - value(b, c),
            value(a, c) + value(b, c) - value(a, b),
        ))
    assert min(triangle_margins) >= 1
    kalmanson_margins: list[Fraction] = []
    for ia, ib, ic, id_ in combinations(range(len(boundary)), 4):
        a, b, c, d = (boundary[index] for index in (ia, ib, ic, id_))
        diagonal = value(a, c) + value(b, d)
        kalmanson_margins.extend((
            diagonal - value(a, b) - value(c, d),
            diagonal - value(a, d) - value(b, c),
        ))
    assert min(kalmanson_margins) >= 1
    for center, support in supports.items():
        row_values = {value(center, point) for point in support}
        assert len(row_values) == 1
        radius = next(iter(row_values))
        if enforce_full_filters:
            assert all(
                abs(value(center, point) - radius) >= 1
                for point in points if point not in {*support, center}
            )
    if enforce_full_filters:
        assert all(
            abs(value(APEX, left) - value(APEX, right)) >= 1
            for left, right in combinations(apex_outside, 2)
        )

    physical = set(PHYSICAL[:cell.physical_card])
    assert set(supports[APEX]) & set(cell.cap_boundary) == physical
    assert len(set(supports["bu"]) & physical) == 0
    assert len(set(supports["bs"]) & physical) == 1
    assert len(set(supports["bt"]) & physical) == 1
    assert roles["target"] not in supports["bs"]
    assert roles["source"] not in supports["bt"]
    assert len(set(supports["bs"]) & set(supports["bt"])) == 0

    result: dict[str, object] = {
        "cell": cell.name,
        "orbit": cell.orbit,
        "cap_kind": cell.cap_kind,
        "physical_card": cell.physical_card,
        "cap_boundary": list(cell.cap_boundary),
        "boundary": list(boundary),
        "roles": roles,
        "supports": {center: list(support) for center, support in supports.items()},
        "status": "sat",
        "minimum_distance": qstr(min(distance_values.values())),
        "minimum_triangle_margin": qstr(min(triangle_margins)),
        "minimum_kalmanson_margin": qstr(min(kalmanson_margins)),
        "radii": {
            center: qstr(value(center, support[0]))
            for center, support in supports.items()
        },
    }
    if keep_ledger:
        result["distance_ledger"] = {
            "__".join(pair): qstr(distance_values[pair])
            for pair in sorted(distance_values)
        }
    return result


def smoke_tests() -> dict[str, str]:
    # Hand-checkable strict-Kalmanson four-point metric.
    manual = {
        edge("a", "b"): Fraction(1),
        edge("b", "c"): Fraction(1),
        edge("c", "d"): Fraction(1),
        edge("a", "d"): Fraction(1),
        edge("a", "c"): Fraction(2),
        edge("b", "d"): Fraction(2),
    }
    diagonal = manual[edge("a", "c")] + manual[edge("b", "d")]
    assert diagonal > manual[edge("a", "b")] + manual[edge("c", "d")]
    assert diagonal > manual[edge("a", "d")] + manual[edge("b", "c")]

    # The ordinal corollary: d(a,c)=d(a,d) and Kalmanson force d(b,c)<d(b,d).
    dab, dac, dad, dbc, dbd, dcd = z3.Reals("dab dac dad dbc dbd dcd")
    solver = z3.SolverFor("QF_LRA")
    solver.add(*(x >= 1 for x in (dab, dac, dad, dbc, dbd, dcd)))
    solver.add(dac + dbd >= dab + dcd + 1)
    solver.add(dac + dbd >= dad + dbc + 1)
    solver.add(dac == dad, dbc >= dbd)
    assert solver.check() == z3.unsat
    return {
        "manual_strict_kalmanson": "PASS",
        "ordinal_unsat": "PASS",
    }


def _worker(payload: tuple[Cell, bool]) -> dict[str, object]:
    cell, enforce_full_filters = payload
    return solve_cell(cell, keep_ledger=False, enforce_full_filters=enforce_full_filters)


def run_orbit(
    orbit: str,
    jobs: int,
    max_cells: int | None = None,
    enforce_full_filters: bool = True,
) -> dict[str, object]:
    cells = cells_for_orbit(orbit)
    if max_cells is not None:
        cells = cells[:max_cells]
    if jobs == 1:
        results = [_worker((cell, enforce_full_filters)) for cell in cells]
    else:
        with ProcessPoolExecutor(max_workers=jobs) as pool:
            results = list(pool.map(_worker, ((cell, enforce_full_filters) for cell in cells)))
    statuses: dict[str, int] = {}
    by_kind: dict[str, dict[str, int]] = {}
    for result in results:
        status = str(result["status"])
        statuses[status] = statuses.get(status, 0) + 1
        kind = str(result.get("cap_kind", "unclassified"))
        kind_statuses = by_kind.setdefault(kind, {})
        kind_statuses[status] = kind_statuses.get(status, 0) + 1

    exact_witness = None
    for cell, result in zip(cells, results, strict=True):
        if result["status"] == "sat":
            exact_witness = solve_cell(
                cell,
                keep_ledger=True,
                enforce_full_filters=enforce_full_filters,
            )
            break
    return {
        "orbit": orbit,
        "cell_count": len(cells),
        "statuses": statuses,
        "statuses_by_cap_kind": by_kind,
        "exact_witness": exact_witness,
        "non_sat_cells": [
            result for result in results if result["status"] != "sat"
        ],
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--jobs", type=int, default=1)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--orbit", choices=ORBITS, action="append")
    parser.add_argument("--max-cells", type=int)
    parser.add_argument("--omit-full-filters", action="store_true")
    args = parser.parse_args()
    if not 1 <= args.jobs <= 24:
        raise SystemExit("--jobs must be between 1 and 24")

    smoke = smoke_tests()
    orbits: Iterable[str] = args.orbit or ORBITS
    results = []
    for orbit in orbits:
        result = run_orbit(
            orbit,
            args.jobs,
            args.max_cells,
            enforce_full_filters=not args.omit_full_filters,
        )
        results.append(result)
        print(
            f"{orbit}: {result['statuses']} over {result['cell_count']} cap-order cells",
            flush=True,
        )
        if result["non_sat_cells"]:
            print("  non-SAT cells:", len(result["non_sat_cells"]))

    payload = {
        "schema": "p97-exact6-mutual-four-complete-row-kalmanson-gate-v1",
        "epistemic_status": (
            "EXACT_SUBSTITUTION_CHECKED_QF_LRA_NOT_EUCLIDEAN_NOT_MEC_"
            "NOT_TOTAL_CSS_NOT_MINIMALITY_NOT_NOM44_NOT_LEAN"
        ),
        "smoke_tests": smoke,
        "point_count_per_cell": 21,
        "strict_triangle_inequalities_per_cell":
            3 * len(list(combinations(range(21), 3))),
        "strict_kalmanson_inequalities_per_cell":
            2 * len(list(combinations(range(21), 4))),
        "orbit_results": results,
        "omitted": [
            "planar Euclidean rank-two realization",
            "MEC containment and nonobtuse support triangle",
            "total critical-shell rows outside the three displayed sources",
            "global minimality and noM44",
        ],
    }
    if args.output:
        args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    if any(result["non_sat_cells"] for result in results):
        raise SystemExit(2)


if __name__ == "__main__":
    main()
