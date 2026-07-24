#!/usr/bin/env python3
"""Source-indexed card-14 global parent surface for the large-opposite-caps
bi-apex robust branch.

This encoder is a theorem-discovery outer for the open production theorem

    Problem97.ATailFrontierLiveClosure.
      false_of_frontierLargeOppositeCapsBiApexRobustResidual

It represents, at the exact least live profile (card 14, cap profile
(5,6,6)), the complete-radius-partition projection of every production field
of the packet F/R/B/L together with the previously omitted global fields
identified by the 2026-07-22 audits:

  * the total critical-shell system (one blocker per source, blocker image
    omitting both robust apices, per-source deletion criticality);
  * all-center K4 (one selected four-row inside one complete radius class at
    every carrier center);
  * full apex deletion robustness at both opposite apices, in its proven
    two-mode normal form (a five-class or two disjoint K4 classes);
  * the frontier pair with all six production survival/double-deletion
    witnesses and the retained/double first-apex rows with their two
    strict-cap hits;
  * singleton-deletion minimality (subsumed by blocker totality), full
    pair-deletion minimality (every 12-point subcarrier fails all-center
    K4 somewhere), and weak selected-row escape for every proper subset.

Production-proved geometric constraint families are imposed at the level of
complete radius classes (not merely selected rows):

  * at most two carrier centers equidistant from any fixed pair (convex
    independence forbids three collinear points on the perpendicular
    bisector);
  * cyclic alternation of a co-radial pair across its two centers;
  * two distinct-center circles meet in at most two carrier points;
  * `selectedFourClass_inter_capByIndex_card_le_two` lifted to 4-cliques;
  * `Card11SelectedCube.support_inter_capByIndex_card_le_one` for Moser
    endpoints, lifted to 4-cliques;
  * `CapSelectedRowCounting.outsidePair_unique_capCenter`: no two distinct
    centers in one closed cap are both equidistant from one pair outside
    that cap.

Deliberately omitted fields, recorded in the emitted metadata: Euclidean
coordinates and planarity beyond the CEGAR triangle/Kalmanson relaxation,
MEC-disk containment bounds, the alternative-support-triangle content of
noM44 beyond the fixed (5,6,6) cap partition, and every carrier cardinality
other than 14.  Bounded UNSAT of this surface is theorem-discovery evidence
only; SAT models are finite shadows pending the exact metric oracle.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter
from pathlib import Path


N = 14
VERTICES = tuple(range(N))
O1 = 0           # first opposite apex (frontier apex), opposite cap C2
O2 = 4           # physical second apex, opposite cap C3
SURPLUS_APEX = 9  # apex opposite the surplus cap C1
MOSER = (O1, O2, SURPLUS_APEX)
ROBUST_APICES = (O1, O2)

SURPLUS_CAP = (0, 1, 2, 3, 4)               # C1, card 5
OPP_CAP_1 = (4, 5, 6, 7, 8, 9)              # C2, card 6, opposite apex O1=0
OPP_CAP_2 = (9, 10, 11, 12, 13, 0)          # C3, card 6, opposite apex O2=4
CAPS = {"C1": SURPLUS_CAP, "C2": OPP_CAP_1, "C3": OPP_CAP_2}
STRICT_C2 = (5, 6, 7, 8)                    # strictFirstOppositeCap
FRONTIER_DOMAIN = tuple(range(5, 14))       # marginal \ surplusCap
# Caps incident to each Moser vertex (the caps having it as an endpoint).
INCIDENT_CAPS = {0: ("C1", "C3"), 4: ("C1", "C2"), 9: ("C2", "C3")}
# The unique cap containing each strict-interior center.
INTERIOR_CAP = {}
for _name, _cap in CAPS.items():
    for _p in _cap:
        if _p not in MOSER:
            INTERIOR_CAP[_p] = _name


class CNF:
    def __init__(self) -> None:
        self.names: list[str] = ["<unused-zero>"]
        self.ids: dict[str, int] = {}
        self.clauses: list[tuple[int, ...]] = []
        self.block_counts: Counter[str] = Counter()

    def var(self, name: str) -> int:
        found = self.ids.get(name)
        if found is not None:
            return found
        identifier = len(self.names)
        self.ids[name] = identifier
        self.names.append(name)
        return identifier

    def add(self, block: str, literals: list[int] | tuple[int, ...]) -> None:
        clause = tuple(dict.fromkeys(literals))
        literal_set = set(clause)
        if any(-literal in literal_set for literal in clause):
            return
        if not clause:
            raise ValueError(f"attempted to add an empty clause in {block}")
        self.clauses.append(clause)
        self.block_counts[block] += 1

    def write_dimacs(self, path: Path, metadata: dict[str, object]) -> None:
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open("w", encoding="ascii") as handle:
            handle.write("c lcap14 global parent surface\n")
            for key, value in metadata.items():
                handle.write(f"c {key} {json.dumps(value, sort_keys=True)}\n")
            for identifier, name in enumerate(self.names[1:], start=1):
                handle.write(f"c var {identifier} {name}\n")
            handle.write(f"p cnf {len(self.names) - 1} {len(self.clauses)}\n")
            for clause in self.clauses:
                handle.write(" ".join(str(literal) for literal in clause))
                handle.write(" 0\n")


def add_exactly_k(cnf: CNF, variables: tuple[int, ...], k: int, prefix: str) -> None:
    if not 0 <= k <= len(variables):
        raise ValueError((len(variables), k))
    for too_many in itertools.combinations(variables, k + 1):
        cnf.add(f"{prefix}_at_most_{k}", [-variable for variable in too_many])
    false_count = len(variables) - k + 1
    for forced_true in itertools.combinations(variables, false_count):
        cnf.add(f"{prefix}_at_least_{k}", list(forced_true))


def targets(center: int) -> tuple[int, ...]:
    return tuple(p for p in VERTICES if p != center)


def cyclic_arc_interior(a: int, b: int) -> frozenset[int]:
    """Vertices strictly between a and b in the +1 direction."""
    out = []
    i = (a + 1) % N
    while i != b:
        out.append(i)
        i = (i + 1) % N
    return frozenset(out)


def pair_separates(x: int, y: int, c: int, cp: int) -> bool:
    """Whether {x,y} and {c,cp} alternate in the cyclic order."""
    side = cyclic_arc_interior(x, y)
    return (c in side) != (cp in side)


def build(pair_minimality: bool, subset_escape: bool) -> tuple[CNF, dict[str, object]]:
    cnf = CNF()

    eq = {}
    for center in VERTICES:
        for left, right in itertools.combinations(targets(center), 2):
            eq[center, left, right] = cnf.var(f"eq_{center}_{left}_{right}")

    def eq_var(center: int, left: int, right: int) -> int:
        if left == right or center in {left, right}:
            raise ValueError((center, left, right))
        return eq[center, min(left, right), max(left, right)]

    def anticlique_clause(center: int, quad: tuple[int, ...], guards: list[int]) -> list[int]:
        """Clause forbidding the 4-clique `quad` at `center` under `guards`.

        Uses the spanning-tree reduction: under partition transitivity, the
        three root-edge equalities imply the full clique, so forbidding them
        forbids exactly the clique."""
        root, *rest = sorted(quad)
        clause = list(guards)
        for other in rest:
            clause.append(-eq_var(center, root, other))
        return clause

    # ---- 1. complete radius partition: transitivity ----
    for center in VERTICES:
        for left, middle, right in itertools.combinations(targets(center), 3):
            lm = eq_var(center, left, middle)
            lr = eq_var(center, left, right)
            mr = eq_var(center, middle, right)
            cnf.add("radius_partition_transitivity", [-lm, -mr, lr])
            cnf.add("radius_partition_transitivity", [-lm, -lr, mr])
            cnf.add("radius_partition_transitivity", [-lr, -mr, lm])

    # ---- helper: one k-row family inside one class at a fixed center ----
    def add_row(prefix: str, center: int, k: int, conditional_guard: int | None = None) -> dict[int, int]:
        member = {p: cnf.var(f"{prefix}_{p}") for p in targets(center)}
        add_exactly_k(cnf, tuple(member.values()), k, prefix)
        for left, right in itertools.combinations(targets(center), 2):
            clause = [-member[left], -member[right], eq_var(center, left, right)]
            if conditional_guard is not None:
                clause.insert(0, conditional_guard)
            cnf.add(f"{prefix}_in_one_class", clause)
        return member

    # ---- 2. all-center K4: one selected four-row at every center ----
    m = {}
    for center in VERTICES:
        row = add_row(f"m_{center}", center, 4)
        for p, var in row.items():
            m[center, p] = var

    # ---- 3. at most two centers equidistant from any pair ----
    for left, right in itertools.combinations(VERTICES, 2):
        centers = tuple(c for c in VERTICES if c not in {left, right})
        for triple in itertools.combinations(centers, 3):
            cnf.add(
                "bisector_le_two_centers",
                [-eq_var(c, left, right) for c in triple],
            )

    # ---- 4. co-radial pair at two centers alternates cyclically ----
    for left, right in itertools.combinations(VERTICES, 2):
        centers = tuple(c for c in VERTICES if c not in {left, right})
        for c, cp in itertools.combinations(centers, 2):
            if not pair_separates(left, right, c, cp):
                cnf.add(
                    "shared_pair_alternation",
                    [-eq_var(c, left, right), -eq_var(cp, left, right)],
                )

    # ---- 5. two distinct-center circles meet in at most two points ----
    for c, cp in itertools.combinations(VERTICES, 2):
        common = tuple(p for p in VERTICES if p not in {c, cp})
        for x, y, z in itertools.combinations(common, 3):
            cnf.add(
                "circle_pair_le_two",
                [
                    -eq_var(c, x, y), -eq_var(c, x, z),
                    -eq_var(cp, x, y), -eq_var(cp, x, z),
                ],
            )

    # ---- 6/7. cap incidence bounds lifted to 4-cliques ----
    for center in VERTICES:
        if center in MOSER:
            # Endpoint bound <= 1 on both incident caps.
            for cap_name in INCIDENT_CAPS[center]:
                cap = set(CAPS[cap_name]) - {center}
                for quad in itertools.combinations(targets(center), 4):
                    if len(cap.intersection(quad)) >= 2:
                        cnf.add(
                            "cap_endpoint_le_one",
                            anticlique_clause(center, quad, []),
                        )
        else:
            # Interior bound <= 2 on the unique containing cap.
            cap = set(CAPS[INTERIOR_CAP[center]]) - {center}
            for quad in itertools.combinations(targets(center), 4):
                if len(cap.intersection(quad)) >= 3:
                    cnf.add(
                        "cap_class_le_two",
                        anticlique_clause(center, quad, []),
                    )

    # ---- 8. outsidePair_unique_capCenter ----
    for cap_name, cap in CAPS.items():
        cap_set = set(cap)
        outside = tuple(p for p in VERTICES if p not in cap_set)
        for z1, z2 in itertools.combinations(sorted(cap_set), 2):
            for a, b in itertools.combinations(outside, 2):
                cnf.add(
                    "cap_outside_pair_unique_center",
                    [-eq_var(z1, a, b), -eq_var(z2, a, b)],
                )

    # ---- 9/10. total critical map with per-source criticality ----
    blocker = {}
    for source in VERTICES:
        domain = tuple(
            c for c in VERTICES if c != source and c not in ROBUST_APICES
        )
        for center in domain:
            blocker[source, center] = cnf.var(f"b_{source}_{center}")
        add_exactly_k(
            cnf,
            tuple(blocker[source, center] for center in domain),
            1,
            f"blocker_{source}",
        )
        for center in domain:
            guard = -blocker[source, center]
            # Criticality: no four-clique at the blocker avoids the source.
            for quad in itertools.combinations(
                tuple(p for p in targets(center) if p != source), 4
            ):
                cnf.add(
                    "blocker_criticality",
                    anticlique_clause(center, quad, [guard]),
                )
            # Derived, propagation-helping: the selected row contains the source.
            cnf.add("blocker_row_contains_source", [guard, m[center, source]])

    # ---- 11. full deletion robustness at both apices ----
    robust_mode = {}
    for apex in ROBUST_APICES:
        r5 = cnf.var(f"r5_{apex}")
        robust_mode[apex] = r5
        # Five-class witness, constrained only in r5 mode.
        row5 = add_row(f"row5_{apex}", apex, 5, conditional_guard=-r5)
        # Second disjoint four-class witness, constrained only in the other mode.
        m2 = add_row(f"m2_{apex}", apex, 4)
        for x in targets(apex):
            for y in targets(apex):
                if x == y:
                    continue
                cnf.add(
                    "apex_two_class_disjoint",
                    [r5, -m2[x], -m[apex, y], -eq_var(apex, x, y)],
                )
        del row5

    # ---- 12. frontier pair and its production witnesses ----
    rq = {p: cnf.var(f"rq_{p}") for p in FRONTIER_DOMAIN}
    rw = {p: cnf.var(f"rw_{p}") for p in FRONTIER_DOMAIN}
    add_exactly_k(cnf, tuple(rq.values()), 1, "frontier_q_choice")
    add_exactly_k(cnf, tuple(rw.values()), 1, "frontier_w_choice")
    for p in FRONTIER_DOMAIN:
        cnf.add("frontier_pair_distinct", [-rq[p], -rw[p]])
    for p in FRONTIER_DOMAIN:
        for pp in FRONTIER_DOMAIN:
            if p != pp:
                cnf.add(
                    "frontier_pair_coradial_first_apex",
                    [-rq[p], -rw[pp], eq_var(O1, p, pp)],
                )
    # one_frontier_source_strict: q or w lies in the strict first opposite cap.
    nonstrict = tuple(p for p in FRONTIER_DOMAIN if p not in STRICT_C2)
    for p in nonstrict:
        for pp in nonstrict:
            if p != pp:
                cnf.add("one_frontier_source_strict", [-rq[p], -rw[pp]])

    def add_witness_row(prefix: str, center: int, avoid: tuple[dict[int, int], ...]) -> dict[int, int]:
        row = add_row(prefix, center, 4)
        for choice in avoid:
            for p, chosen in choice.items():
                if p in row:
                    cnf.add(f"{prefix}_avoids_deleted", [-row[p], -chosen])
        return row

    sq1 = add_witness_row("sq1", O1, (rq,))       # q_firstApex_survives
    sw1 = add_witness_row("sw1", O1, (rw,))       # w_firstApex_survives
    sq2 = add_witness_row("sq2", O2, (rq,))       # q_survives (second apex)
    sw2 = add_witness_row("sw2", O2, (rw,))       # w_survives (second apex)
    d1 = add_witness_row("d1", O1, (rq, rw))      # firstApexDouble
    d2 = add_witness_row("d2", O2, (rq, rw))      # secondApexDouble
    del sq1, sw1, sq2, sw2, d2

    # Retained row T0: contains q and w (hence lies in the frontier class).
    t0 = add_row("t0", O1, 4)
    for p in FRONTIER_DOMAIN:
        cnf.add("t0_contains_q", [-rq[p], t0[p]])
        cnf.add("t0_contains_w", [-rw[p], t0[p]])
    # Two strict-cap hits in T0 and in the double row T1 = d1.
    for prefix, row in (("t0", t0), ("d1", d1)):
        outside_strict = tuple(p for p in targets(O1) if p not in STRICT_C2)
        for triple in itertools.combinations(outside_strict, 3):
            cnf.add(
                f"{prefix}_two_strict_cap_hits",
                [-row[p] for p in triple],
            )

    # ---- 13. weak selected-row escape for every proper subset ----
    if subset_escape:
        for size in range(1, N):
            for subset in itertools.combinations(VERTICES, size):
                inside = frozenset(subset)
                clause = [
                    m[center, point]
                    for center in subset
                    for point in VERTICES
                    if point not in inside and point != center
                ]
                cnf.add("subset_row_escape", clause)

    # ---- 14. full pair-deletion minimality ----
    if pair_minimality:
        for i, j in itertools.combinations(VERTICES, 2):
            witnesses = []
            for y in VERTICES:
                if y in {i, j}:
                    continue
                w_var = cnf.var(f"wdel2_{i}_{j}_{y}")
                witnesses.append(w_var)
                remaining = tuple(
                    p for p in targets(y) if p not in {i, j}
                )
                for quad in itertools.combinations(remaining, 4):
                    cnf.add(
                        "pair_minimality_criticality",
                        anticlique_clause(y, quad, [-w_var]),
                    )
            cnf.add("pair_minimality_witness_exists", witnesses)

    metadata: dict[str, object] = {
        "schema": "p97-lcap14-global-parent-surface-v1",
        "n": N,
        "moser_vertices": list(MOSER),
        "first_apex": O1,
        "second_apex": O2,
        "surplus_apex": SURPLUS_APEX,
        "caps": {name: list(cap) for name, cap in CAPS.items()},
        "cap_profile_surplus_opp1_opp2": [5, 6, 6],
        "strict_first_opposite_cap": list(STRICT_C2),
        "frontier_domain": list(FRONTIER_DOMAIN),
        "robust_apices": list(ROBUST_APICES),
        "pair_minimality": pair_minimality,
        "subset_escape": subset_escape,
        "orientation_wlog": "O1=0, O2=4 fixed up to reflection of the cyclic order",
        "omitted_fields": [
            "Euclidean coordinates / planarity beyond the CEGAR triangle+Kalmanson relaxation",
            "MEC disk containment bounds",
            "noM44 alternative-support-triangle content beyond the fixed (5,6,6) cap partition",
            "carrier cardinalities other than 14",
            "triple-and-deeper subset minimality beyond the weak selected-row escape",
        ],
        "variable_count": len(cnf.names) - 1,
        "clause_count": len(cnf.clauses),
        "block_counts": dict(sorted(cnf.block_counts.items())),
    }
    return cnf, metadata


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--no-pair-minimality", action="store_true")
    parser.add_argument("--no-subset-escape", action="store_true")
    args = parser.parse_args()

    cnf, metadata = build(
        pair_minimality=not args.no_pair_minimality,
        subset_escape=not args.no_subset_escape,
    )
    cnf.write_dimacs(args.output, metadata)
    digest = hashlib.sha256(args.output.read_bytes()).hexdigest()
    metadata["dimacs_sha256"] = digest
    args.output.with_suffix(".meta.json").write_text(
        json.dumps(metadata, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "dimacs": str(args.output),
        "variables": metadata["variable_count"],
        "clauses": metadata["clause_count"],
        "sha256": digest,
    }, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
