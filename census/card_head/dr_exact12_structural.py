"""D-R two-radius branch: exact-12 structural CNF over the edge-equality relation.

Encoding 1b, structural stage, for
``Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch``
(specification: ``docs/specs/p97-dr-two-radius-exact12-cell-v1.md``).

Twelve labelled points in the fixed profile ``(surplus, opp1, opp2) = (5, 4, 6)``.
The Boolean relation ``eq(e, e')`` on the 66 edges says two distances are equal.
Every D-R hypothesis is stated as a cardinality or exclusion constraint on the
per-center classes this relation induces.  No coordinates, no cyclic order.

Claim boundary.  A model is an equality pattern, not a configuration; an UNSAT
is a statement about this CNF at card 12 under the cut admission record below.
Nothing here closes a Lean theorem or is promotion eligible.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections.abc import Iterable, Mapping, Sequence
from dataclasses import dataclass, field
from itertools import combinations
from pathlib import Path
from typing import Any

SCHEMA = "p97-dr-exact12-structural-cnf/v1"
TARGET_THEOREM = (
    "Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch"
)
LANE_ID = "dr-two-radius-20260901"
PROMOTION_ELIGIBLE = False

N = 12
A2, A1, A3 = 0, 1, 2
APEXES = (A2, A1, A3)
IS = (3, 4, 5)  # surplus interior, chord a1 a2
I1 = (6, 7)  # first-opposite interior, chord a2 a3
I2 = (8, 9, 10, 11)  # second-opposite interior, chord a3 a1
IQ, IW = 6, 7
LABELS = tuple(range(N))
CONTROLS = ("none", "five-at-second-apex", "first-apex-symmetry")

# Cut admission record: every clause family names its Lean image or declares
# itself a relaxation.  Families marked RELAXATION are weaker than the source.
SOURCE_CLAUSE_LEDGER: tuple[dict[str, str], ...] = (
    {"family": "transitivity", "content": "equality of distances is an equivalence relation", "status": "definition"},
    {"family": "duplicate_three_point_center", "content": "two distinct centers are not both equidistant from three common points (circumcenter uniqueness)", "status": "proved-source", "lean_sources": "b1_exact12_static_equality generic_duplicate_three_point_center_obstruction"},
    {"family": "second_apex_rows", "content": "firstRow/secondRow: two disjoint full four-classes at oppApex2; each has two points in the second-cap interior and one point in each adjacent closed cap", "status": "proved-source", "lean_sources": "SelectedFourClass, _hdisjoint, _hnoFive, twoRichClassSlices_partition_of_capInterior_card_eq_four, exactFourTwoRadiusAdjacentCapGrid"},
    {"family": "first_apex_class", "content": "the oppApex1 class has exactly four points, contains interior_q and interior_w, one point in each adjacent closed cap, and is the unique four-class at oppApex1", "status": "proved-source", "lean_sources": "OriginalUniqueFourResidual.class_card_eq_four, interior_q_mem, interior_w_mem, unique_K4_radius, leftAdjacentCap_at_opposite_card_le_one_of_convexIndep"},
    {"family": "k4_everywhere", "content": "every point has at least four equidistant points", "status": "proved-source", "lean_sources": "CounterexampleData.K4"},
    {"family": "blockers", "content": "every point has a blocker other than oppApex2 whose unique four-class contains it; late system sends the first-apex class to oppApex1", "status": "proved-source", "lean_sources": "CriticalShellSystem.shellAt, no_qfree, CriticalFourShell.support_eq, lateFirstApexSystem, DeletionRobustRadiusClassification.twoDistinctRadii (no blocker at oppApex2)"},
    {"family": "ingress", "content": "source with blocker outside {oppApex1, oppApex2}; deleted point in the first-apex class outside the surplus interior; B1 = source shell avoids deleted; B2 in {firstRow, secondRow} avoids deleted; |B1 ∩ B2| ≤ 2", "status": "RELAXATION: deleted ∈ {q, w} is projected to deleted ∈ U \\ surplus interior (closed-cap exclusion weakened to interior)", "lean_sources": "ExactFourPhysicalCommonDeletionIngress, CommonDeletionTwoCenterPacket, U5QDeletedK4Class, outsideFirstApexFiber, blocker_ne_secondApex"},
)
OMITTED_FACTS = (
    "convex cyclic order (metric stage)",
    "geometry and perpendicular-bisector deltas of the B1 static layers (label-genericity not yet audited)",
    "minimality / no M44",
    "bisector_center_mem_interior",
    "FullyDeletionRobustAt oppApex2 (implied by the two disjoint four-classes)",
)


class DRStructuralError(RuntimeError):
    pass


def _fail(condition: bool, message: str) -> None:
    if not condition:
        raise DRStructuralError(message)


# --------------------------------------------------------------------------
# CNF container
# --------------------------------------------------------------------------


@dataclass
class CNF:
    n_variables: int = 0
    clauses: list[tuple[int, ...]] = field(default_factory=list)
    counts: dict[str, int] = field(default_factory=dict)
    names: dict[int, str] = field(default_factory=dict)

    def new_variable(self, name: str) -> int:
        self.n_variables += 1
        self.names[self.n_variables] = name
        return self.n_variables

    def add(self, family: str, literals: Iterable[int]) -> None:
        clause = tuple(sorted(set(literals), key=abs))
        _fail(bool(clause) and all(0 < abs(lit) <= self.n_variables for lit in clause), "bad clause")
        _fail(not any(-lit in clause for lit in clause), "tautological clause")
        self.clauses.append(clause)
        self.counts[family] = self.counts.get(family, 0) + 1

    def dimacs(self) -> bytes:
        lines = [f"p cnf {self.n_variables} {len(self.clauses)}"]
        lines.extend(" ".join(str(lit) for lit in clause) + " 0" for clause in self.clauses)
        return ("\n".join(lines) + "\n").encode("ascii")


def _exactly_one(cnf: CNF, family: str, variables: Sequence[int]) -> None:
    cnf.add(family, variables)
    for left, right in combinations(variables, 2):
        cnf.add(family, (-left, -right))


def _exactly_k(cnf: CNF, family: str, variables: Sequence[int], k: int) -> None:
    """Exact cardinality by subset enumeration (small variable sets only)."""

    _fail(len(variables) <= 6, "enumerated cardinality needs a small set")
    for subset in combinations(variables, len(variables) - k + 1):  # at least k
        cnf.add(family, subset)
    for subset in combinations(variables, k + 1):  # at most k
        cnf.add(family, tuple(-v for v in subset))


# --------------------------------------------------------------------------
# Encoding
# --------------------------------------------------------------------------


@dataclass(frozen=True)
class Layout:
    edges: tuple[tuple[int, int], ...]
    relation_variables: Mapping[tuple[int, int], int]
    x: Mapping[int, int]
    y: Mapping[int, int]
    u: Mapping[int, int]
    chi: Mapping[tuple[int, int], int]
    src: Mapping[int, int]
    deleted: Mapping[int, int]
    b2x: int
    b2y: int
    k4: Mapping[tuple[int, tuple[int, ...]], int]


def others(center: int) -> tuple[int, ...]:
    return tuple(label for label in LABELS if label != center)


def build(control: str = "none") -> tuple[CNF, Layout]:
    _fail(control in CONTROLS, "unknown control")
    cnf = CNF()
    edges = tuple(combinations(LABELS, 2))
    edge_index = {edge: index for index, edge in enumerate(edges)}
    relation: dict[tuple[int, int], int] = {}
    for left, right in combinations(range(len(edges)), 2):
        relation[(left, right)] = cnf.new_variable(f"eq:{edges[left]}:{edges[right]}")

    def edge(a: int, b: int) -> int:
        _fail(a != b, "edge needs two endpoints")
        return edge_index[(min(a, b), max(a, b))]

    def same(center: int, a: int, b: int) -> int:
        """Variable: a and b are equidistant from center."""

        _fail(center not in (a, b) and a != b, "same needs three distinct points")
        first, second = sorted((edge(center, a), edge(center, b)))
        return relation[(first, second)]

    # 1. transitivity of distance equality
    for first, second, third in combinations(range(len(edges)), 3):
        fs, ft, st = relation[(first, second)], relation[(first, third)], relation[(second, third)]
        cnf.add("transitivity", (-fs, -st, ft))
        cnf.add("transitivity", (-fs, -ft, st))
        cnf.add("transitivity", (-ft, -st, fs))
    # 2. two centers never share three equidistant points
    for c1, c2 in combinations(LABELS, 2):
        rest = tuple(label for label in LABELS if label not in (c1, c2))
        for p, q, r in combinations(rest, 3):
            cnf.add("duplicate_three_point_center", (-same(c1, p, q), -same(c1, p, r), -same(c2, p, q), -same(c2, p, r)))

    def exact_class(family: str, center: int, member: Mapping[int, int]) -> None:
        """member[z] holds exactly for the points of one full class at center."""

        for a, b in combinations(others(center), 2):
            cnf.add(family, (-member[a], -member[b], same(center, a, b)))
            cnf.add(family, (-member[a], member[b], -same(center, a, b)))
            cnf.add(family, (member[a], -member[b], -same(center, a, b)))

    # 3. rows at the second apex
    x = {z: cnf.new_variable(f"X:{z}") for z in others(A2)}
    y = {z: cnf.new_variable(f"Y:{z}") for z in others(A2)}
    for member in (x, y):
        exact_class("second_apex_rows", A2, member)
        _exactly_k(cnf, "second_apex_rows", [member[z] for z in I2], 2)
        _exactly_k(cnf, "second_apex_rows", [member[z] for z in IS + (A1,)], 1)
        _exactly_k(cnf, "second_apex_rows", [member[z] for z in I1 + (A3,)], 1)
    for z in others(A2):
        cnf.add("second_apex_rows", (-x[z], -y[z]))
    # 4. the first-apex class
    u = {z: cnf.new_variable(f"U:{z}") for z in others(A1)}
    exact_class("first_apex_class", A1, u)
    cnf.add("first_apex_class", (u[IQ],))
    cnf.add("first_apex_class", (u[IW],))
    _exactly_k(cnf, "first_apex_class", [u[z] for z in IS + (A2,)], 1)
    _exactly_k(cnf, "first_apex_class", [u[z] for z in I2 + (A3,)], 1)
    for quad in combinations(others(A1), 4):
        pairwise = tuple(-same(A1, a, b) for a, b in combinations(quad, 2))
        for z in quad:
            cnf.add("first_apex_class", pairwise + (u[z],))
    # 5. K4 everywhere, with selector variables
    k4: dict[tuple[int, tuple[int, ...]], int] = {}
    for center in LABELS:
        selectors = []
        for quad in combinations(others(center), 4):
            selector = cnf.new_variable(f"K4:{center}:{quad}")
            k4[(center, quad)] = selector
            selectors.append(selector)
            for a, b in combinations(quad, 2):
                cnf.add("k4_everywhere", (-selector, same(center, a, b)))
        cnf.add("k4_everywhere", selectors)
    # 6. blockers
    chi: dict[tuple[int, int], int] = {}
    for z in LABELS:
        centers = tuple(c for c in LABELS if c not in (z, A2))
        for c in centers:
            chi[(z, c)] = cnf.new_variable(f"chi:{z}:{c}")
        _exactly_one(cnf, "blockers", [chi[(z, c)] for c in centers])
        for c in centers:
            guard = -chi[(z, c)]
            rest = tuple(label for label in LABELS if label not in (z, c))
            # the class of z at c has at least four points
            cnf.add("blockers", (guard,) + tuple(k4[(c, quad)] for quad in combinations(others(c), 4) if z in quad))
            # ... and at most four
            for quad in combinations(rest, 4):
                cnf.add("blockers", (guard,) + tuple(-same(c, z, s) for s in quad))
            # ... and every other class at c has at most three points
            for quad in combinations(rest, 4):
                cnf.add("blockers", (guard,) + tuple(-same(c, a, b) for a, b in combinations(quad, 2)))
    for z in others(A1):
        cnf.add("blockers", (-u[z], chi[(z, A1)]))
    # 7. ingress: source, deleted point, rows B1 (source shell) and B2
    src = {z: cnf.new_variable(f"src:{z}") for z in LABELS}
    _exactly_one(cnf, "ingress", [src[z] for z in LABELS])
    for z in others(A1):
        cnf.add("ingress", (-src[z], -chi[(z, A1)]))
    deleted = {d: cnf.new_variable(f"deleted:{d}") for d in LABELS if d not in IS and d != A1}
    _exactly_one(cnf, "ingress", list(deleted.values()))
    for d, var in deleted.items():
        cnf.add("ingress", (-var, u[d]))
    b2x, b2y = cnf.new_variable("B2:X"), cnf.new_variable("B2:Y")
    _exactly_one(cnf, "ingress", [b2x, b2y])
    for d, var in deleted.items():
        if d in x:
            cnf.add("ingress", (-b2x, -var, -x[d]))
            cnf.add("ingress", (-b2y, -var, -y[d]))
    for z in LABELS:
        for c in LABELS:
            if c in (z, A2):
                continue
            guard = (-src[z], -chi[(z, c)])
            for d, var in deleted.items():
                if d in (z, c):
                    if d == z:
                        cnf.add("ingress", (-src[z], -var))
                    continue
                cnf.add("ingress", guard + (-var, -same(c, z, d)))
            candidates = tuple(t for t in LABELS if t not in (A2, c))
            for row, member in ((b2x, x), (b2y, y)):
                for triple in combinations(candidates, 3):
                    clause = guard + (-row,) + tuple(-member[t] for t in triple)
                    clause += tuple(-same(c, z, t) for t in triple if t != z)
                    cnf.add("ingress", clause)
    # controls
    if control == "five-at-second-apex":
        for a, b in combinations((A1, 3, 6, 8, 9), 2):
            cnf.add("control", (same(A2, a, b),))
    if control == "first-apex-symmetry":
        cnf.add("control", (x[8],))
    layout = Layout(edges, relation, x, y, u, chi, src, deleted, b2x, b2y, k4)
    return cnf, layout


# --------------------------------------------------------------------------
# Decoding and independent semantic check
# --------------------------------------------------------------------------


@dataclass(frozen=True)
class Pattern:
    classes: Mapping[int, tuple[tuple[int, ...], ...]]  # center -> partition of the other points
    x: tuple[int, ...]
    y: tuple[int, ...]
    u: tuple[int, ...]
    chi: Mapping[int, int]
    source: int
    deleted: int
    b2: str

    def payload(self) -> dict[str, Any]:
        return {
            "schema": "p97-dr-exact12-structural-pattern/v1",
            "classes": {str(c): [list(k) for k in ks] for c, ks in sorted(self.classes.items())},
            "x": list(self.x), "y": list(self.y), "u": list(self.u),
            "chi": {str(z): c for z, c in sorted(self.chi.items())},
            "source": self.source, "deleted": self.deleted, "b2": self.b2,
        }


def decode(layout: Layout, assignment: Sequence[int]) -> Pattern:
    true = {lit for lit in assignment if lit > 0}
    edge_index = {edge: index for index, edge in enumerate(layout.edges)}

    def same(center: int, a: int, b: int) -> bool:
        first, second = sorted((edge_index[(min(center, a), max(center, a))], edge_index[(min(center, b), max(center, b))]))
        return layout.relation_variables[(first, second)] in true

    classes: dict[int, tuple[tuple[int, ...], ...]] = {}
    for center in LABELS:
        remaining = list(others(center))
        parts = []
        while remaining:
            head = remaining[0]
            part = tuple(z for z in remaining if z == head or same(center, head, z))
            parts.append(part)
            remaining = [z for z in remaining if z not in part]
        classes[center] = tuple(parts)
    chi = {z: c for (z, c), var in layout.chi.items() if var in true}
    sources = [z for z, var in layout.src.items() if var in true]
    deleted = [d for d, var in layout.deleted.items() if var in true]
    _fail(len(sources) == 1 and len(deleted) == 1 and len(chi) == N, "decoded selectors are not unique")
    return Pattern(
        classes=classes,
        x=tuple(z for z, var in sorted(layout.x.items()) if var in true),
        y=tuple(z for z, var in sorted(layout.y.items()) if var in true),
        u=tuple(z for z, var in sorted(layout.u.items()) if var in true),
        chi=chi, source=sources[0], deleted=deleted[0],
        b2="X" if layout.b2x in true else "Y",
    )


def check_pattern(pattern: Pattern) -> list[str]:
    """Independent semantic readback of every D-R property on a decoded pattern."""

    problems: list[str] = []
    classes = pattern.classes

    def class_of(center: int, z: int) -> tuple[int, ...]:
        return next(k for k in classes[center] if z in k)

    for center in LABELS:
        if max(len(k) for k in classes[center]) < 4:
            problems.append(f"no four-class at {center}")
    for c1, c2 in combinations(LABELS, 2):
        for k1 in classes[c1]:
            for k2 in classes[c2]:
                if len(set(k1) & set(k2)) >= 3:
                    problems.append(f"centers {c1},{c2} share three equidistant points")
    x, y, u = set(pattern.x), set(pattern.y), set(pattern.u)
    for name, row in (("X", x), ("Y", y)):
        if len(row) != 4 or tuple(sorted(row)) not in classes[A2]:
            problems.append(f"{name} is not a full class at a2")
        if len(row & set(I2)) != 2 or len(row & (set(IS) | {A1})) != 1 or len(row & (set(I1) | {A3})) != 1:
            problems.append(f"{name} cap counts wrong")
    if x & y:
        problems.append("X and Y intersect")
    if max(len(k) for k in classes[A2]) >= 5:
        problems.append("five-class at a2")
    if len(u) != 4 or tuple(sorted(u)) not in classes[A1] or not {IQ, IW} <= u:
        problems.append("U is not the full four-class through interior_q, interior_w at a1")
    if len(u & (set(IS) | {A2})) != 1 or len(u & (set(I2) | {A3})) != 1:
        problems.append("U cap counts wrong")
    if sum(1 for k in classes[A1] if len(k) >= 4) != 1:
        problems.append("a1 is not a unique-four center")
    for z in LABELS:
        c = pattern.chi[z]
        if c in (z, A2):
            problems.append(f"blocker of {z} is {c}")
            continue
        if len(class_of(c, z)) != 4 or sum(1 for k in classes[c] if len(k) >= 4) != 1:
            problems.append(f"blocker {c} of {z} is not a unique-four center through {z}")
        if z in u and c != A1:
            problems.append(f"late system: {z} in U but blocker {c}")
    s, d, c1 = pattern.source, pattern.deleted, pattern.chi[pattern.source]
    if c1 in (A1, A2):
        problems.append("source blocker is an apex")
    if d not in u or d in IS or d == A1:
        problems.append("deleted point is not in U outside the surplus interior")
    b1 = set(class_of(c1, s))
    if d in b1:
        problems.append("deleted point lies in B1")
    b2 = x if pattern.b2 == "X" else y
    if d in b2:
        problems.append("deleted point lies in B2")
    if len(b1 & b2) > 2:
        problems.append("|B1 ∩ B2| > 2")
    return problems


# --------------------------------------------------------------------------
# CLI
# --------------------------------------------------------------------------


def manifest(cnf: CNF, control: str) -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "target_theorem": TARGET_THEOREM,
        "lane_id": LANE_ID,
        "promotion_eligible": PROMOTION_ELIGIBLE,
        "control": control,
        "n_variables": cnf.n_variables,
        "n_clauses": len(cnf.clauses),
        "clause_counts": dict(sorted(cnf.counts.items())),
        "cnf_sha256": hashlib.sha256(cnf.dimacs()).hexdigest(),
        "source_clause_ledger": list(SOURCE_CLAUSE_LEDGER),
        "omitted_facts": list(OMITTED_FACTS),
        "labels": {"a2": A2, "a1": A1, "a3": A3, "Is": list(IS), "I1": list(I1), "I2": list(I2), "interior_q": IQ, "interior_w": IW},
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--control", choices=CONTROLS, default="none")
    parser.add_argument("--cnf", type=Path, required=True, help="DIMACS output path")
    parser.add_argument("--manifest", type=Path, required=True)
    arguments = parser.parse_args(argv)
    cnf, _layout = build(arguments.control)
    arguments.cnf.write_bytes(cnf.dimacs())
    arguments.manifest.write_text(json.dumps(manifest(cnf, arguments.control), indent=1, sort_keys=True) + "\n")
    sys.stdout.write(json.dumps({"variables": cnf.n_variables, "clauses": len(cnf.clauses), "counts": cnf.counts}, sort_keys=True) + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
