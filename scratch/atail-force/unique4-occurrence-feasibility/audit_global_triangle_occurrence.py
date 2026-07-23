#!/usr/bin/env python3
"""Audit the six-role Kalmanson-row occurrence at arbitrary carrier cardinality.

This is a finite incidence projection, not a Euclidean realization and not a proof
about ``OriginalUniqueFourResidual``.  It keeps the source-backed row-cardinality,
cap-intersection, selected-witness strong-connectivity, late-blocker-fiber, and
omitted-image completion-center constraints relevant to the proposed occurrence.

A SAT result is an exact countermodel to deriving the occurrence from this finite
projection.  It does not refute a theorem which additionally uses nonlinear Euclidean,
MEC, ``noM44``, or full subset-minimality information.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
import time
from collections import Counter
from pathlib import Path


class CNF:
    def __init__(self) -> None:
        self.names = ["<unused-zero>"]
        self.ids: dict[str, int] = {}
        self.clauses: list[tuple[int, ...]] = []
        self.block_counts: Counter[str] = Counter()

    def var(self, name: str) -> int:
        found = self.ids.get(name)
        if found is not None:
            return found
        result = len(self.names)
        self.ids[name] = result
        self.names.append(name)
        return result

    def add(self, block: str, literals: list[int] | tuple[int, ...]) -> None:
        clause = tuple(dict.fromkeys(literals))
        values = set(clause)
        if any(-literal in values for literal in clause):
            return
        if not clause:
            raise ValueError(f"empty clause in {block}")
        self.clauses.append(clause)
        self.block_counts[block] += 1

    def write(self, path: Path) -> None:
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open("w", encoding="ascii") as handle:
            handle.write("c unique-four global six-role occurrence audit\n")
            for identifier, name in enumerate(self.names[1:], start=1):
                handle.write(f"c var {identifier} {name}\n")
            handle.write(f"p cnf {len(self.names) - 1} {len(self.clauses)}\n")
            for clause in self.clauses:
                handle.write(" ".join(map(str, clause)) + " 0\n")


def add_exactly_k(
    cnf: CNF, variables: tuple[int, ...], k: int, block: str
) -> None:
    for choice in itertools.combinations(variables, k + 1):
        cnf.add(f"{block}_at_most_{k}", tuple(-variable for variable in choice))
    for choice in itertools.combinations(variables, len(variables) - k + 1):
        cnf.add(f"{block}_at_least_{k}", choice)


def add_at_most_k(
    cnf: CNF, variables: tuple[int, ...], k: int, block: str
) -> None:
    for choice in itertools.combinations(variables, k + 1):
        cnf.add(block, tuple(-variable for variable in choice))


def cyclic_orders(vertices: tuple[int, ...]) -> set[tuple[int, ...]]:
    """Both cyclic orientations of a six-element boundary subset."""
    orders: set[tuple[int, ...]] = set()
    forward = vertices
    backward = tuple(reversed(vertices))
    for base in (forward, backward):
        for shift in range(len(base)):
            orders.add(base[shift:] + base[:shift])
    return orders


def encode(
    n: int,
    opp1_card: int,
    *,
    bisector_localization: bool = False,
    two_center_parity: bool = False,
) -> tuple[CNF, dict[str, object]]:
    if n < 12:
        raise ValueError("this arbitrary-card countermodel gate starts at n = 12")
    if opp1_card not in {4, 5}:
        raise ValueError("opp1_card must be 4 or 5")

    first_apex = 0
    second_apex = 4
    completion_center = 2
    successor = 1
    surplus_vertex = 4 + (opp1_card - 2) + 1
    vertices = tuple(range(n))
    surplus_cap = frozenset(range(0, second_apex + 1))
    first_opposite_cap = frozenset(range(second_apex, surplus_vertex + 1))
    second_opposite_cap = frozenset({surplus_vertex, *range(surplus_vertex + 1, n), 0})
    first_opposite_strict = first_opposite_cap - {second_apex, surplus_vertex}
    caps = (surplus_cap, first_opposite_cap, second_opposite_cap)
    endpoints = (
        frozenset({first_apex, second_apex}),
        frozenset({second_apex, surplus_vertex}),
        frozenset({surplus_vertex, first_apex}),
    )

    cnf = CNF()
    member = {
        (center, point): cnf.var(f"m_{center}_{point}")
        for center in vertices
        for point in vertices
    }
    blocker = {
        (source, center): cnf.var(f"b_{source}_{center}")
        for source in vertices
        for center in vertices
    }

    # One selected four-point nonself row at every carrier center.
    for center in vertices:
        cnf.add("row_nonself", (-member[center, center],))
        add_exactly_k(
            cnf,
            tuple(member[center, point] for point in vertices if point != center),
            4,
            "row_card_eq_four",
        )

    # Every displayed cap contributes at most two selected support points.
    # At a physical endpoint of that cap, endpoint-chain monotonicity sharpens
    # this to at most one after the row's nonself condition removes the center.
    for center in vertices:
        for cap_index, cap in enumerate(caps):
            add_at_most_k(
                cnf,
                tuple(member[center, point] for point in sorted(cap)),
                2,
                f"cap_{cap_index}_row_hit_at_most_two",
            )
            if center in endpoints[cap_index]:
                add_at_most_k(
                    cnf,
                    tuple(member[center, point] for point in sorted(cap)),
                    1,
                    f"cap_{cap_index}_endpoint_row_hit_at_most_one",
                )

    # Every selected witness digraph is strongly connected: each nonempty
    # proper source subset has a selected edge leaving it.
    for size in range(1, n):
        for subset_tuple in itertools.combinations(vertices, size):
            subset = frozenset(subset_tuple)
            cnf.add(
                "selected_witness_strong_connectivity",
                tuple(
                    member[center, point]
                    for center in subset_tuple
                    for point in vertices
                    if point not in subset
                ),
            )

    # A total fixed-point-free late blocker map.  Every source belongs to the
    # selected row at its actual blocker.  The first-apex blocker fiber equals
    # the exact first-apex row.
    for source in vertices:
        add_exactly_k(
            cnf,
            tuple(blocker[source, center] for center in vertices if center != source),
            1,
            "blocker_total",
        )
        cnf.add("blocker_fixed_point_free", (-blocker[source, source],))
        for center in vertices:
            cnf.add(
                "source_mem_actual_blocker_row",
                (-blocker[source, center], member[center, source]),
            )
        cnf.add(
            "first_apex_fiber_eq_exact_row",
            (-blocker[source, first_apex], member[first_apex, source]),
        )
        cnf.add(
            "first_apex_fiber_eq_exact_row",
            (-member[first_apex, source], blocker[source, first_apex]),
        )

    # The anchored mutual two-cycle and one fixed omitted-image completion
    # center.  These are precisely the center-level fields of the mutual ingress.
    cnf.add("mutual_first_step", (blocker[first_apex, successor],))
    cnf.add("mutual_return", (blocker[successor, first_apex],))
    for source in vertices:
        cnf.add("completion_center_omitted_from_image", (-blocker[source, completion_center],))

    # Exact 2+1+1 cap distribution of the first-apex row.
    add_exactly_k(
        cnf,
        tuple(member[first_apex, point] for point in sorted(first_opposite_strict)),
        2,
        "exact_row_two_strict_hits",
    )
    add_exactly_k(
        cnf,
        tuple(member[first_apex, point] for point in sorted(surplus_cap)),
        1,
        "exact_row_left_adjacent_hit",
    )
    add_exactly_k(
        cnf,
        tuple(member[first_apex, point] for point in sorted(second_opposite_cap)),
        1,
        "exact_row_right_adjacent_hit",
    )

    # Source-valid optional strengthening.  The exact first-apex row has a
    # unique pair of strict first-opposite-cap hits.  If another selected row
    # contains both hits, its carrier center is equidistant from the pair;
    # R.bisector_center_mem_interior then puts that center in the same strict
    # cap interior.  This is deliberately opt-in so the original incidence-
    # only SAT artifacts remain exactly reproducible.
    if bisector_localization:
        outside_strict = set(vertices) - set(first_opposite_strict)
        for center in sorted(outside_strict - {first_apex}):
            for left, right in itertools.combinations(
                sorted(first_opposite_strict), 2
            ):
                cnf.add(
                    "exact_pair_bisector_center_mem_interior",
                    (
                        -member[first_apex, left],
                        -member[first_apex, right],
                        -member[center, left],
                        -member[center, right],
                    ),
                )

    # Distinct circles have at most two common support points.
    for left, right in itertools.combinations(vertices, 2):
        add_at_most_k(
            cnf,
            tuple(
                cnf.var(f"pair_hit_{left}_{right}_{point}")
                for point in vertices
            ),
            2,
            "row_pair_intersection_at_most_two",
        )
        for point in vertices:
            hit = cnf.var(f"pair_hit_{left}_{right}_{point}")
            cnf.add("pair_hit_definition", (-hit, member[left, point]))
            cnf.add("pair_hit_definition", (-hit, member[right, point]))
            cnf.add(
                "pair_hit_definition",
                (-member[left, point], -member[right, point], hit),
            )

    # Two distinct carrier centers equidistant from the same carrier pair
    # must alternate with that pair in cyclic boundary order.  The two
    # nonalternating arrangements are already refuted by the production
    # `false_of_two_centers_equidistant_pair_after` and `_split` consumers.
    if two_center_parity:
        parity_cuts: set[tuple[int, ...]] = set()
        for chosen in itertools.combinations(vertices, 4):
            for center_pair in itertools.combinations(chosen, 2):
                point_pair = tuple(x for x in chosen if x not in center_pair)
                center_positions = tuple(chosen.index(x) for x in center_pair)
                if (center_positions[0] - center_positions[1]) % 2 == 0:
                    continue
                left, right = center_pair
                x, y = point_pair
                parity_cuts.add(tuple(sorted((
                    -member[left, x],
                    -member[left, y],
                    -member[right, x],
                    -member[right, y],
                ))))
        for cut in sorted(parity_cuts):
            cnf.add("forbid_nonalternating_two_center_pair", cut)

    # Negate every cyclic or reflected occurrence of the six-role consumer:
    # R0 {x02,x01}, R1 {x12,x01}, R2 {x02,x12}.
    occurrence_cut_count = 0
    seen_cuts: set[tuple[int, ...]] = set()
    for chosen in itertools.combinations(vertices, 6):
        for i0, i1, i2, i3, i4, i5 in cyclic_orders(chosen):
            cut = tuple(
                sorted(
                    (
                        -member[i0, i3],
                        -member[i0, i5],
                        -member[i1, i4],
                        -member[i1, i5],
                        -member[i2, i3],
                        -member[i2, i4],
                    )
                )
            )
            if cut in seen_cuts:
                continue
            seen_cuts.add(cut)
            cnf.add("forbid_global_six_role_triangle", cut)
            occurrence_cut_count += 1

    metadata: dict[str, object] = {
        "schema": (
            "p97-unique4-global-six-role-occurrence-feasibility-v2"
            if bisector_localization or two_center_parity
            else "p97-unique4-global-six-role-occurrence-feasibility-v1"
        ),
        "epistemic_status": "EXACT_CNF_FOR_DOCUMENTED_INCIDENCE_PROJECTION",
        "n": n,
        "opp1_card": opp1_card,
        "boundary_order": list(vertices),
        "first_apex": first_apex,
        "successor": successor,
        "completion_center": completion_center,
        "closed_caps": [sorted(cap) for cap in caps],
        "first_opposite_strict": sorted(first_opposite_strict),
        "bisector_localization": bisector_localization,
        "two_center_parity": two_center_parity,
        "occurrence_cut_count": occurrence_cut_count,
        "encoded_source_projection": [
            "one nonself four-row at every carrier center",
            "selected-witness strong connectivity",
            "displayed cap row-hit bounds and endpoint one-hit bounds",
            "total fixed-point-free blocker map with source in actual blocker row",
            "first-apex blocker fiber equal to its exact selected row",
            "anchored mutual blocker two-cycle",
            "completion center omitted from the whole blocker image",
            "exact first-apex row 2+1+1 cap distribution",
            "pairwise selected-row intersections have cardinality at most two",
            *(
                ["exact strict-pair bisector center lies in the strict cap interior"]
                if bisector_localization
                else []
            ),
            *(
                ["two centers sharing a pair alternate with that pair"]
                if two_center_parity
                else []
            ),
        ],
        "deliberately_omitted": [
            "nonlinear Euclidean distance realization",
            "complete ambient radius partitions outside the displayed rows",
            "MEC and nonobtuse support-triangle geometry",
            *(
                []
                if bisector_localization
                else ["exact strict-pair bisector-center localization"]
            ),
            *(
                []
                if two_center_parity
                else ["four-role two-center shared-pair parity"]
            ),
            "alternative-triangle content of noM44",
            "full subset-minimality beyond selected-witness strong connectivity",
        ],
        "claim_scope": (
            "SAT refutes occurrence from this incidence projection only; it does not "
            "refute a source theorem using an omitted geometric field"
        ),
        "variable_count": len(cnf.names) - 1,
        "clause_count": len(cnf.clauses),
        "clause_block_counts": dict(sorted(cnf.block_counts.items())),
    }
    return cnf, metadata


def parse_assignment(output: str) -> set[int]:
    assignment: set[int] = set()
    for line in output.splitlines():
        if not line.startswith("v "):
            continue
        assignment.update(int(token) for token in line.split()[1:] if int(token))
    return assignment


def check_model(cnf: CNF, assignment: set[int]) -> None:
    for index, clause in enumerate(cnf.clauses):
        if not any(
            (abs(literal) in assignment) == (literal > 0)
            for literal in clause
        ):
            raise AssertionError(f"model falsifies clause {index}: {clause}")


def decode(cnf: CNF, assignment: set[int], n: int) -> dict[str, object]:
    check_model(cnf, assignment)
    rows = {
        str(center): [
            point
            for point in range(n)
            if cnf.ids[f"m_{center}_{point}"] in assignment
        ]
        for center in range(n)
    }
    blockers = {}
    for source in range(n):
        choices = [
            center
            for center in range(n)
            if cnf.ids[f"b_{source}_{center}"] in assignment
        ]
        if len(choices) != 1:
            raise AssertionError((source, choices))
        blockers[str(source)] = choices[0]
    return {"rows": rows, "blockers": blockers, "cnf_model_checked": True}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, default=12)
    parser.add_argument("--opp1-card", type=int, choices=(4, 5), default=4)
    parser.add_argument("--timeout-seconds", type=int, default=300)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--bisector-localization", action="store_true")
    parser.add_argument("--two-center-parity", action="store_true")
    args = parser.parse_args()

    if args.check:
        expected = json.loads(args.output.read_text(encoding="utf-8"))
        cnf, metadata = encode(
            int(expected["n"]),
            int(expected["opp1_card"]),
            bisector_localization=bool(expected.get("bisector_localization", False)),
            two_center_parity=bool(expected.get("two_center_parity", False)),
        )
        if metadata["clause_block_counts"] != expected["clause_block_counts"]:
            raise AssertionError("clause block counts drifted")
        cnf.write(args.cnf)
        if sha256(args.cnf) != expected["cnf_sha256"]:
            raise AssertionError("CNF hash drifted")
        print("PASS: occurrence-feasibility artifact reproduces exactly")
        return 0

    cnf, metadata = encode(
        args.n,
        args.opp1_card,
        bisector_localization=args.bisector_localization,
        two_center_parity=args.two_center_parity,
    )
    cnf.write(args.cnf)
    started = time.monotonic()
    completed = subprocess.run(
        [args.cadical, "-t", str(args.timeout_seconds), str(args.cnf)],
        capture_output=True,
        text=True,
        timeout=args.timeout_seconds + 30,
        check=False,
    )
    elapsed = time.monotonic() - started
    status = (
        "SAT"
        if completed.returncode == 10
        else "UNSAT"
        if completed.returncode == 20
        else "UNKNOWN"
    )
    result: dict[str, object] = {
        **metadata,
        "solver": "CaDiCaL",
        "solver_status": status,
        "solver_returncode": completed.returncode,
        "solver_elapsed_seconds": elapsed,
        "cnf_path": str(args.cnf),
        "cnf_sha256": sha256(args.cnf),
    }
    if status == "SAT":
        result.update(decode(cnf, parse_assignment(completed.stdout), args.n))
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
