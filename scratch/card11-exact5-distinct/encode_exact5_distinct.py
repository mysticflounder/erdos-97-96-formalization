#!/usr/bin/env python3
"""Encode the exact-n=11, (5,5,4) distinct-obstruction-center D3 surface.

This is an encode-first finite projection, not a theorem or a solver
certificate.  It keeps the two directed-survival disjuncts in separate CNFs.
The full ordered original/reselected pair roles are retained; no endpoint
swap or reflection quotient is taken.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter
from pathlib import Path


SCHEMA = "p97-card11-exact5-distinct-full-partition-v1"
ARMS = ("delete_interior_w_survives_at_q_blocker",
        "delete_interior_q_survives_at_w_blocker")


class CNF:
    def __init__(self) -> None:
        self.names = ["<zero-unused>"]
        self.ids: dict[str, int] = {}
        self.clauses: list[tuple[int, ...]] = []
        self.blocks: Counter[str] = Counter()

    def var(self, name: str) -> int:
        if name not in self.ids:
            self.ids[name] = len(self.names)
            self.names.append(name)
        return self.ids[name]

    def add(self, block: str, literals: list[int] | tuple[int, ...]) -> None:
        clause = tuple(dict.fromkeys(literals))
        values = set(clause)
        if any(-literal in values for literal in clause):
            return
        if not clause:
            raise ValueError(f"empty clause in {block}")
        self.clauses.append(clause)
        self.blocks[block] += 1

    def write(self, path: Path, metadata: dict[str, object]) -> None:
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open("w", encoding="ascii") as out:
            out.write(f"c encoding_schema {SCHEMA}\n")
            out.write(f"c metadata {json.dumps(metadata, sort_keys=True)}\n")
            for index, name in enumerate(self.names[1:], 1):
                out.write(f"c var {index} {name}\n")
            out.write(f"p cnf {len(self.names) - 1} {len(self.clauses)}\n")
            for clause in self.clauses:
                out.write(" ".join(map(str, clause)) + " 0\n")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def exactly(cnf: CNF, variables: tuple[int, ...], count: int, block: str) -> None:
    for subset in itertools.combinations(variables, count + 1):
        cnf.add(f"{block}_at_most_{count}", tuple(-x for x in subset))
    for subset in itertools.combinations(variables, len(variables) - count + 1):
        cnf.add(f"{block}_at_least_{count}", subset)


def at_least(cnf: CNF, variables: tuple[int, ...], count: int, block: str) -> None:
    for subset in itertools.combinations(variables, len(variables) - count + 1):
        cnf.add(f"{block}_at_least_{count}", subset)


def encode(arm: str) -> tuple[CNF, dict[str, object]]:
    if arm not in ARMS:
        raise ValueError(f"unknown directed arm: {arm}")
    n = 11
    vertices = tuple(range(n))
    a1, a2, surplus_vertex = 0, 4, 8
    surplus_cap = frozenset({0, 1, 2, 3, 4})
    first_opposite_cap = frozenset({4, 5, 6, 7, 8})
    first_opposite_strict = frozenset({5, 6, 7})
    second_opposite_cap = frozenset({8, 9, 10, 0})

    cnf = CNF()
    member = {(c, p): cnf.var(f"m_{c}_{p}") for c in vertices for p in vertices}
    same = {
        (c, x, y): cnf.var(f"eq_{c}_{x}_{y}")
        for c in vertices
        for x, y in itertools.combinations((p for p in vertices if p != c), 2)
    }
    blocker = {(s, c): cnf.var(f"b_{s}_{c}") for s in vertices for c in vertices}
    support = {(s, p): cnf.var(f"h_{s}_{p}") for s in vertices for p in vertices}
    in_class = {p: cnf.var(f"class_{p}") for p in vertices}
    roles = {
        role: {p: cnf.var(f"{role}_{p}") for p in vertices}
        for role in ("original_q", "original_w", "interior_q", "interior_w")
    }
    a2_rows = {
        role: {p: cnf.var(f"a2_{role}_{p}") for p in vertices}
        for role in ("original", "interior")
    }

    def eq(c: int, x: int, y: int) -> int:
        if c in {x, y} or x == y:
            raise ValueError((c, x, y))
        return same[c, min(x, y), max(x, y)]

    # Complete positive-radius partitions and one arbitrary selected K4 row
    # at every carrier center.
    for c in vertices:
        targets = tuple(p for p in vertices if p != c)
        for x, y, z in itertools.combinations(targets, 3):
            xy, xz, yz = eq(c, x, y), eq(c, x, z), eq(c, y, z)
            cnf.add("radius_partition_transitivity", (-xy, -yz, xz))
            cnf.add("radius_partition_transitivity", (-xy, -xz, yz))
            cnf.add("radius_partition_transitivity", (-xz, -yz, xy))
        cnf.add("selected_row_nonself", (-member[c, c],))
        exactly(cnf, tuple(member[c, p] for p in targets), 4, "selected_row")
        for x, y in itertools.combinations(targets, 2):
            cnf.add("selected_row_subset_radius_class",
                    (-member[c, x], -member[c, y], eq(c, x, y)))

    # Euclidean two-circle intersection consequence in the fixed cyclic order.
    for left, right in itertools.combinations(vertices, 2):
        possible = tuple(p for p in vertices if p not in {left, right})
        for x, y in itertools.combinations(possible, 2):
            alternate = (left < x < right) != (left < y < right)
            if not alternate:
                cnf.add("cyclic_alternation", (-eq(left, x, y), -eq(right, x, y)))

    # Only this already-proved finite consequence of D.Minimal is encoded.
    for size in range(1, n):
        for subset_tuple in itertools.combinations(vertices, size):
            subset = frozenset(subset_tuple)
            cnf.add("minimality_selected_row_strong_connectivity",
                    tuple(member[c, p] for c in subset_tuple for p in vertices
                          if p not in subset))

    # Exact-five ambient A1 class.  A1's selected row is a four-subset, not
    # identified with the complete five-class.
    exactly(cnf, tuple(in_class.values()), 5, "a1_exact_five_class")
    cnf.add("a1_not_in_own_class", (-in_class[a1],))
    a1_targets = tuple(p for p in vertices if p != a1)
    for x, y in itertools.combinations(a1_targets, 2):
        relation = eq(a1, x, y)
        cnf.add("a1_class_pairwise_equal", (-in_class[x], -in_class[y], relation))
        cnf.add("a1_class_closed", (-in_class[x], -relation, in_class[y]))
        cnf.add("a1_class_closed", (-in_class[y], -relation, in_class[x]))
    for four in itertools.combinations(a1_targets, 4):
        cnf.add("a1_unique_k4_radius",
                (-eq(a1, four[0], four[1]), -eq(a1, four[0], four[2]),
                 -eq(a1, four[0], four[3]), in_class[four[0]]))
    for p in vertices:
        cnf.add("a1_selected_row_subset_exact_five",
                (-member[a1, p], in_class[p]))
    for cap_name, cap in (("surplus", surplus_cap), ("second_opposite", second_opposite_cap)):
        for x, y in itertools.combinations(sorted(cap), 2):
            cnf.add(f"a1_class_{cap_name}_at_most_one", (-in_class[x], -in_class[y]))
    at_least(cnf, tuple(in_class[p] for p in sorted(first_opposite_strict)), 2,
             "a1_class_strict_first_opposite")

    # Original frontier pair and reselected strict-interior pair remain
    # independent ordered roles.  Overlap between the two pairs is allowed.
    original_allowed = tuple(p for p in vertices if p not in surplus_cap)
    for role in ("original_q", "original_w"):
        exactly(cnf, tuple(roles[role][p] for p in original_allowed), 1, role)
        for p in vertices:
            if p in surplus_cap:
                cnf.add("original_pair_outside_surplus", (-roles[role][p],))
            else:
                cnf.add("original_pair_in_a1_class",
                        (-roles[role][p], in_class[p]))
    for role in ("interior_q", "interior_w"):
        exactly(cnf, tuple(roles[role][p] for p in sorted(first_opposite_strict)), 1, role)
        for p in vertices:
            if p not in first_opposite_strict:
                cnf.add("interior_pair_in_strict_cap", (-roles[role][p],))
            else:
                cnf.add("interior_pair_in_a1_class",
                        (-roles[role][p], in_class[p]))
    for p in vertices:
        cnf.add("original_pair_distinct",
                (-roles["original_q"][p], -roles["original_w"][p]))
        cnf.add("interior_pair_distinct",
                (-roles["interior_q"][p], -roles["interior_w"][p]))

    # Critical map H: exact critical support through every source, selected as
    # the row at its unique actual blocker, with no K4 after deleting source.
    for source in vertices:
        allowed_centers = tuple(c for c in vertices if c != source)
        exactly(cnf, tuple(blocker[source, c] for c in allowed_centers), 1, "blocker")
        cnf.add("blocker_fixed_point_free", (-blocker[source, source],))
        cnf.add("all_blockers_ne_a1", (-blocker[source, a1],))
        exactly(cnf, tuple(support[source, p] for p in vertices), 4, "critical_support")
        cnf.add("critical_support_contains_source", (support[source, source],))
        for center in allowed_centers:
            for p in vertices:
                if p == center:
                    cnf.add("critical_support_excludes_center",
                            (-blocker[source, center], -support[source, p]))
                elif p != source:
                    relation = eq(center, source, p)
                    cnf.add("critical_support_full_class",
                            (-blocker[source, center], -support[source, p], relation))
                    cnf.add("critical_support_full_class",
                            (-blocker[source, center], -relation, support[source, p]))
                cnf.add("blocker_row_eq_support",
                        (-blocker[source, center], -member[center, p], support[source, p]))
                cnf.add("blocker_row_eq_support",
                        (-blocker[source, center], -support[source, p], member[center, p]))
            remaining = tuple(p for p in vertices if p not in {center, source})
            for four in itertools.combinations(remaining, 4):
                cnf.add("critical_no_k4_after_source_deletion",
                        (-blocker[source, center], -eq(center, four[0], four[1]),
                         -eq(center, four[0], four[2]), -eq(center, four[0], four[3])))

    for left, right in itertools.combinations(vertices, 2):
        for center in vertices:
            for p in vertices:
                cnf.add("same_blocker_same_support",
                        (-blocker[left, center], -blocker[right, center],
                         -support[left, p], support[right, p]))
                cnf.add("same_blocker_same_support",
                        (-blocker[left, center], -blocker[right, center],
                         -support[right, p], support[left, p]))

    # The original and reselected frontiers each carry an independent A2 row
    # surviving deletion of their own ordered pair.
    for pair_name, q_role, w_role in (
        ("original", "original_q", "original_w"),
        ("interior", "interior_q", "interior_w"),
    ):
        row = a2_rows[pair_name]
        exactly(cnf, tuple(row.values()), 4, f"a2_{pair_name}_survival_row")
        cnf.add("a2_survival_row_nonself", (-row[a2],))
        for p in vertices:
            cnf.add("a2_survival_row_avoids_pair", (-roles[q_role][p], -row[p]))
            cnf.add("a2_survival_row_avoids_pair", (-roles[w_role][p], -row[p]))
        targets = tuple(p for p in vertices if p != a2)
        for x, y in itertools.combinations(targets, 2):
            cnf.add("a2_survival_row_subset_radius_class",
                    (-row[x], -row[y], eq(a2, x, y)))

    # Source-proved blocker inequalities at A2 for endpoints of both frontier
    # pairs, plus the distinct reselected obstruction centers.
    for role in roles:
        for source in vertices:
            cnf.add("pair_endpoint_blocker_ne_a2",
                    (-roles[role][source], -blocker[source, a2]))
    for q in vertices:
        for w in vertices:
            for center in vertices:
                cnf.add("interior_obstruction_centers_distinct",
                        (-roles["interior_q"][q], -roles["interior_w"][w],
                         -blocker[q, center], -blocker[w, center]))

    # Keep the two directed-survival arms separate.  Criticality makes
    # survival after deleting the partner equivalent to partner omission.
    if arm == ARMS[0]:
        source_role, deleted_role = "interior_q", "interior_w"
    else:
        source_role, deleted_role = "interior_w", "interior_q"
    for source in vertices:
        for deleted in vertices:
            cnf.add("directed_survival_partner_omission",
                    (-roles[source_role][source], -roles[deleted_role][deleted],
                     -support[source, deleted]))

    metadata: dict[str, object] = {
        "encoding_schema": SCHEMA,
        "epistemic_status": "EXACT_CNF_FOR_DOCUMENTED_FINITE_PROJECTION",
        "source_leaf":
            "Problem97.FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual",
        "n": n,
        "cap_profile": [5, 5, 4],
        "original_d3_opp1_card": 5,
        "directed_arm": arm,
        "cap_pair_orbit": "FULL_ORDERED_ROLE_ORBIT_NO_SYMMETRY_QUOTIENT",
        "boundary_order": list(vertices),
        "first_apex": a1,
        "second_apex": a2,
        "surplus_vertex": surplus_vertex,
        "closed_caps": {
            "surplus": sorted(surplus_cap),
            "first_opposite": sorted(first_opposite_cap),
            "second_opposite": sorted(second_opposite_cap),
        },
        "first_opposite_strict": sorted(first_opposite_strict),
        "variable_count": len(cnf.names) - 1,
        "clause_count": len(cnf.clauses),
        "clause_block_counts": dict(sorted(cnf.blocks.items())),
        "encoded_minimality_scope":
            "only the proved selected-row strong-connectivity consequence on this carrier",
        "global_minimal_not_finitized":
            "D.Minimal quantifies over arbitrary smaller counterexamples/carriers and is not "
            "replaced by a Boolean flag or a bounded surrogate",
        "downstream_stage_not_encoded": {
            "stage": "physicalSecondApex_split swapped exact-four",
            "opp1_card": 4,
            "reason": "different downstream packet; not a second original-D3 orbit",
        },
        "deliberately_omitted": [
            "the full global D.Minimal predicate",
            "coordinates and nonlinear Euclidean realizability",
            "MEC and nonobtuse support-triangle geometry",
            "the alternative-triangle content of noM44 beyond the fixed cap profile",
            "all consequences of the downstream physical swap except its stage tag",
        ],
        "scope_warning":
            "SAT/UNSAT concerns only this documented finite projection; no solver verdict "
            "is a Lean theorem or a source-to-model proof.",
    }
    return cnf, metadata


def self_test() -> None:
    tiny = CNF()
    xs = tuple(tiny.var(f"x{i}") for i in range(4))
    exactly(tiny, xs, 2, "tiny")
    for mask in range(16):
        assignment = {x: bool(mask & (1 << i)) for i, x in enumerate(xs)}
        holds = all(any((lit > 0) == assignment[abs(lit)] for lit in clause)
                    for clause in tiny.clauses)
        if holds != (mask.bit_count() == 2):
            raise AssertionError(("exactly-two", mask, holds))
    for arm in ARMS:
        cnf, metadata = encode(arm)
        if metadata["variable_count"] != len(cnf.names) - 1:
            raise AssertionError("variable count mismatch")
        if metadata["clause_count"] != len(cnf.clauses):
            raise AssertionError("clause count mismatch")
        if any(not clause for clause in cnf.clauses):
            raise AssertionError("empty clause")
    print("SELF_TEST_OK: cardinality truth table and both directed encodings")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--arm", choices=ARMS)
    parser.add_argument("--cnf", type=Path)
    parser.add_argument("--result", type=Path)
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if args.self_test:
        self_test()
        return 0
    if args.arm is None or args.cnf is None or args.result is None:
        parser.error("--arm, --cnf, and --result are required")
    cnf, metadata = encode(args.arm)
    cnf.write(args.cnf, metadata)
    result = {
        **metadata,
        "cnf_path": str(args.cnf),
        "cnf_sha256": sha256(args.cnf),
        "solver_status": "NOT_RUN_ENCODE_ONLY",
    }
    args.result.parent.mkdir(parents=True, exist_ok=True)
    args.result.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n",
                           encoding="utf-8")
    print(json.dumps({
        "arm": args.arm,
        "variables": metadata["variable_count"],
        "clauses": metadata["clause_count"],
        "cnf_sha256": result["cnf_sha256"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
