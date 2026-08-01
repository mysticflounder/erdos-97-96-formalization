#!/usr/bin/env python3
"""Independent DIMACS and formula verifier for the card-11 D3 projection.

This file deliberately does not import the encoder.  It reconstructs the
variable universe and the complete clause multiset, then compares that
reference formula with the parsed DIMACS file.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter
from pathlib import Path


SCHEMA = "p97-card11-exact5-distinct-full-partition-v1"
ARMS = {
    "delete_interior_w_survives_at_q_blocker": ("interior_q", "interior_w"),
    "delete_interior_q_survives_at_w_blocker": ("interior_w", "interior_q"),
}


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


class Reference:
    def __init__(self) -> None:
        self.names = ["<unused>"]
        self.number: dict[str, int] = {}
        self.clauses: list[tuple[int, ...]] = []
        self.blocks: Counter[str] = Counter()

    def var(self, name: str) -> int:
        if name not in self.number:
            self.number[name] = len(self.names)
            self.names.append(name)
        return self.number[name]

    def add(self, block: str, *literals: int) -> None:
        clause = tuple(dict.fromkeys(literals))
        values = set(clause)
        if any(-literal in values for literal in clause):
            return
        if not clause:
            raise AssertionError(f"empty reference clause in {block}")
        self.clauses.append(clause)
        self.blocks[block] += 1

    def exactly(self, variables: tuple[int, ...], count: int, block: str) -> None:
        for subset in itertools.combinations(variables, count + 1):
            self.add(f"{block}_at_most_{count}", *(-x for x in subset))
        width = len(variables) - count + 1
        for subset in itertools.combinations(variables, width):
            self.add(f"{block}_at_least_{count}", *subset)

    def at_least(self, variables: tuple[int, ...], count: int, block: str) -> None:
        width = len(variables) - count + 1
        for subset in itertools.combinations(variables, width):
            self.add(f"{block}_at_least_{count}", *subset)


def reference_formula(arm: str) -> Reference:
    if arm not in ARMS:
        raise ValueError(f"unknown arm {arm!r}")
    r = Reference()
    vs = tuple(range(11))
    a1, a2 = 0, 4
    surplus = frozenset({0, 1, 2, 3, 4})
    strict = frozenset({5, 6, 7})
    second_opp = frozenset({8, 9, 10, 0})

    m = {(c, p): r.var(f"m_{c}_{p}") for c in vs for p in vs}
    eqs = {
        (c, x, y): r.var(f"eq_{c}_{x}_{y}")
        for c in vs
        for x, y in itertools.combinations((p for p in vs if p != c), 2)
    }
    b = {(s, c): r.var(f"b_{s}_{c}") for s in vs for c in vs}
    h = {(s, p): r.var(f"h_{s}_{p}") for s in vs for p in vs}
    cls = {p: r.var(f"class_{p}") for p in vs}
    role = {
        tag: {p: r.var(f"{tag}_{p}") for p in vs}
        for tag in ("original_q", "original_w", "interior_q", "interior_w")
    }
    a2row = {
        tag: {p: r.var(f"a2_{tag}_{p}") for p in vs}
        for tag in ("original", "interior")
    }

    def eq(c: int, x: int, y: int) -> int:
        if c in {x, y} or x == y:
            raise AssertionError((c, x, y))
        return eqs[c, min(x, y), max(x, y)]

    for c in vs:
        targets = tuple(p for p in vs if p != c)
        for x, y, z in itertools.combinations(targets, 3):
            xy, xz, yz = eq(c, x, y), eq(c, x, z), eq(c, y, z)
            r.add("radius_partition_transitivity", -xy, -yz, xz)
            r.add("radius_partition_transitivity", -xy, -xz, yz)
            r.add("radius_partition_transitivity", -xz, -yz, xy)
        r.add("selected_row_nonself", -m[c, c])
        r.exactly(tuple(m[c, p] for p in targets), 4, "selected_row")
        for x, y in itertools.combinations(targets, 2):
            r.add("selected_row_subset_radius_class", -m[c, x], -m[c, y], eq(c, x, y))

    for left, right in itertools.combinations(vs, 2):
        possible = tuple(p for p in vs if p not in {left, right})
        for x, y in itertools.combinations(possible, 2):
            if not ((left < x < right) != (left < y < right)):
                r.add("cyclic_alternation", -eq(left, x, y), -eq(right, x, y))

    for size in range(1, 11):
        for subset_tuple in itertools.combinations(vs, size):
            subset = frozenset(subset_tuple)
            r.add("minimality_selected_row_strong_connectivity",
                  *(m[c, p] for c in subset_tuple for p in vs if p not in subset))

    r.exactly(tuple(cls.values()), 5, "a1_exact_five_class")
    r.add("a1_not_in_own_class", -cls[a1])
    a1targets = tuple(p for p in vs if p != a1)
    for x, y in itertools.combinations(a1targets, 2):
        relation = eq(a1, x, y)
        r.add("a1_class_pairwise_equal", -cls[x], -cls[y], relation)
        r.add("a1_class_closed", -cls[x], -relation, cls[y])
        r.add("a1_class_closed", -cls[y], -relation, cls[x])
    for four in itertools.combinations(a1targets, 4):
        r.add("a1_unique_k4_radius", -eq(a1, four[0], four[1]),
              -eq(a1, four[0], four[2]), -eq(a1, four[0], four[3]), cls[four[0]])
    for p in vs:
        r.add("a1_selected_row_subset_exact_five", -m[a1, p], cls[p])
    for label, cap in (("surplus", surplus), ("second_opposite", second_opp)):
        for x, y in itertools.combinations(sorted(cap), 2):
            r.add(f"a1_class_{label}_at_most_one", -cls[x], -cls[y])
    r.at_least(tuple(cls[p] for p in sorted(strict)), 2,
               "a1_class_strict_first_opposite")

    original_allowed = tuple(p for p in vs if p not in surplus)
    for tag in ("original_q", "original_w"):
        r.exactly(tuple(role[tag][p] for p in original_allowed), 1, tag)
        for p in vs:
            if p in surplus:
                r.add("original_pair_outside_surplus", -role[tag][p])
            else:
                r.add("original_pair_in_a1_class", -role[tag][p], cls[p])
    for tag in ("interior_q", "interior_w"):
        r.exactly(tuple(role[tag][p] for p in sorted(strict)), 1, tag)
        for p in vs:
            if p not in strict:
                r.add("interior_pair_in_strict_cap", -role[tag][p])
            else:
                r.add("interior_pair_in_a1_class", -role[tag][p], cls[p])
    for p in vs:
        r.add("original_pair_distinct", -role["original_q"][p], -role["original_w"][p])
        r.add("interior_pair_distinct", -role["interior_q"][p], -role["interior_w"][p])

    for source in vs:
        centers = tuple(c for c in vs if c != source)
        r.exactly(tuple(b[source, c] for c in centers), 1, "blocker")
        r.add("blocker_fixed_point_free", -b[source, source])
        r.add("all_blockers_ne_a1", -b[source, a1])
        r.exactly(tuple(h[source, p] for p in vs), 4, "critical_support")
        r.add("critical_support_contains_source", h[source, source])
        for center in centers:
            for p in vs:
                if p == center:
                    r.add("critical_support_excludes_center", -b[source, center], -h[source, p])
                elif p != source:
                    relation = eq(center, source, p)
                    r.add("critical_support_full_class", -b[source, center],
                          -h[source, p], relation)
                    r.add("critical_support_full_class", -b[source, center],
                          -relation, h[source, p])
                r.add("blocker_row_eq_support", -b[source, center], -m[center, p],
                      h[source, p])
                r.add("blocker_row_eq_support", -b[source, center], -h[source, p],
                      m[center, p])
            remaining = tuple(p for p in vs if p not in {center, source})
            for four in itertools.combinations(remaining, 4):
                r.add("critical_no_k4_after_source_deletion", -b[source, center],
                      -eq(center, four[0], four[1]), -eq(center, four[0], four[2]),
                      -eq(center, four[0], four[3]))

    for left, right in itertools.combinations(vs, 2):
        for center in vs:
            for p in vs:
                r.add("same_blocker_same_support", -b[left, center], -b[right, center],
                      -h[left, p], h[right, p])
                r.add("same_blocker_same_support", -b[left, center], -b[right, center],
                      -h[right, p], h[left, p])

    for pair, qtag, wtag in (
        ("original", "original_q", "original_w"),
        ("interior", "interior_q", "interior_w"),
    ):
        row = a2row[pair]
        r.exactly(tuple(row.values()), 4, f"a2_{pair}_survival_row")
        r.add("a2_survival_row_nonself", -row[a2])
        for p in vs:
            r.add("a2_survival_row_avoids_pair", -role[qtag][p], -row[p])
            r.add("a2_survival_row_avoids_pair", -role[wtag][p], -row[p])
        targets = tuple(p for p in vs if p != a2)
        for x, y in itertools.combinations(targets, 2):
            r.add("a2_survival_row_subset_radius_class", -row[x], -row[y], eq(a2, x, y))

    for tag in role:
        for source in vs:
            r.add("pair_endpoint_blocker_ne_a2", -role[tag][source], -b[source, a2])
    for q in vs:
        for w in vs:
            for center in vs:
                r.add("interior_obstruction_centers_distinct",
                      -role["interior_q"][q], -role["interior_w"][w],
                      -b[q, center], -b[w, center])

    source_tag, deleted_tag = ARMS[arm]
    for source in vs:
        for deleted in vs:
            r.add("directed_survival_partner_omission",
                  -role[source_tag][source], -role[deleted_tag][deleted],
                  -h[source, deleted])
    return r


def parse_dimacs(path: Path) -> tuple[dict[int, str], list[tuple[int, ...]], tuple[int, int]]:
    variables: dict[int, str] = {}
    clauses: list[tuple[int, ...]] = []
    header: tuple[int, int] | None = None
    for number, raw in enumerate(path.read_text(encoding="ascii").splitlines(), 1):
        if raw.startswith("c var "):
            fields = raw.split(maxsplit=3)
            index = int(fields[2])
            if index in variables:
                raise ValueError(f"line {number}: repeated variable id")
            variables[index] = fields[3]
        elif raw.startswith("p cnf "):
            if header is not None:
                raise ValueError("repeated DIMACS header")
            _, _, nv, nc = raw.split()
            header = int(nv), int(nc)
        elif raw and not raw.startswith("c"):
            values = tuple(map(int, raw.split()))
            if not values or values[-1] != 0 or 0 in values[:-1]:
                raise ValueError(f"line {number}: malformed clause terminator")
            clause = values[:-1]
            if len(clause) != len(set(clause)):
                raise ValueError(f"line {number}: repeated literal")
            if any(-x in clause for x in clause):
                raise ValueError(f"line {number}: tautological clause")
            clauses.append(clause)
    if header is None:
        raise ValueError("missing DIMACS header")
    return variables, clauses, header


def verify(cnf_path: Path, result_path: Path) -> dict[str, object]:
    result = json.loads(result_path.read_text(encoding="utf-8"))
    arm = result.get("directed_arm")
    reference = reference_formula(arm)
    variables, clauses, header = parse_dimacs(cnf_path)
    expected_variables = {i: name for i, name in enumerate(reference.names[1:], 1)}
    checks = {
        "schema": result.get("encoding_schema") == SCHEMA,
        "stage": result.get("original_d3_opp1_card") == 5,
        "downstream_separate":
            result.get("downstream_stage_not_encoded", {}).get("opp1_card") == 4,
        "orbit": result.get("cap_pair_orbit") ==
            "FULL_ORDERED_ROLE_ORBIT_NO_SYMMETRY_QUOTIENT",
        "solver_not_run": result.get("solver_status") == "NOT_RUN_ENCODE_ONLY",
        "sha256": result.get("cnf_sha256") == digest(cnf_path),
        "variables": variables == expected_variables,
        "header": header == (len(expected_variables), len(reference.clauses)),
        "result_counts": (result.get("variable_count"), result.get("clause_count")) ==
            (len(expected_variables), len(reference.clauses)),
        "clause_multiset": Counter(clauses) == Counter(reference.clauses),
        "block_counts": result.get("clause_block_counts") ==
            dict(sorted(reference.blocks.items())),
    }
    failed = [name for name, value in checks.items() if not value]
    if failed:
        raise ValueError("verification failed: " + ", ".join(failed))
    return {
        "status": "VERIFIED_ENCODE_ONLY",
        "arm": arm,
        "variables": len(expected_variables),
        "clauses": len(reference.clauses),
        "cnf_sha256": digest(cnf_path),
        "independent_checks": sorted(checks),
    }


def self_test() -> None:
    for arm in ARMS:
        reference = reference_formula(arm)
        assert len(reference.names) - 1 == 935
        assert len(reference.clauses) == 55200
        assert reference.blocks["directed_survival_partner_omission"] == 121
    first = Counter(reference_formula(next(iter(ARMS))).clauses)
    second = Counter(reference_formula(tuple(ARMS)[1]).clauses)
    assert first != second
    print("SELF_TEST_OK: independent reference counts and directed-arm separation")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cnf", type=Path)
    parser.add_argument("--result", type=Path)
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if args.self_test:
        self_test()
        return 0
    if args.cnf is None or args.result is None:
        parser.error("--cnf and --result are required")
    print(json.dumps(verify(args.cnf, args.result), sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
