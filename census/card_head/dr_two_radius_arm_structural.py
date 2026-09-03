"""D-R two-radius branch: profile-parametrized structural CNF (card 12 and the card-13 growth arms).

Phase 4 diagnostic encoder for
``Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen``
(specification: ``docs/specs/p97-dr-two-radius-card13-arms-v1.md``).

The encoding is that of ``dr_exact12_structural`` (edge-equality relation,
label-generic equality cores, D-R hypothesis blocks) with every use of the
exact-12 label set, cyclic order, and count form routed through a frozen
``Profile``.  Two modes:

* ``legacy`` (exact-12 profile only): the exact-12 count forms (exactly two
  row members in the second-opposite interior, exactly one in each adjacent
  cap; ingress on).  Reproduces ``dr_exact12_structural.build`` clause for
  clause, in the same order, with the same variable numbering.
* ``generic``: the section-4 forms of the specification (exactly four
  members, at most one in each adjacent cap; the interior slice follows);
  ingress only on request.  Valid for every profile.

Claim boundary.  A model is an equality pattern, not a configuration; an UNSAT
is a statement about one CNF at one card for one arm under the cut admission
record ``CUT_ADMISSION_LEDGER``.  Nothing here closes a Lean theorem or is
promotion eligible.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from itertools import combinations, permutations
from pathlib import Path
from typing import Any

import numpy as np

from census.card_head import dr_exact12_structural as exact12
from census.card_head.dr_exact12_structural import (
    CNF,
    EAGER_CORES,
    GENERIC_CORES,
    LAZY_CORES,
    SELECTABLE_FAMILIES,
    _core_index_pairs,
    _exactly_one,
    _fail,
    _group,
)

SCHEMA = "p97-dr-two-radius-arm-structural-cnf/v1"
SPEC = "docs/specs/p97-dr-two-radius-card13-arms-v1.md"
LANE_ID = exact12.LANE_ID
PROMOTION_ELIGIBLE = False
MODES = ("legacy", "generic")
CONTROLS = exact12.CONTROLS  # only "none" is valid in generic mode
TARGET_THEOREMS = {
    12: exact12.TARGET_THEOREM,
    13: "Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen",
}
A2, A1, A3 = exact12.A2, exact12.A1, exact12.A3
APEXES = (A2, A1, A3)

# Selectable cut families of this module (generic mode only), on top of the
# exact-12 ``SELECTABLE_FAMILIES``.  See ``CUT_ADMISSION_LEDGER`` for the Lean
# image and admission status of each.
NEW_FAMILIES = ("cap_betweenness", "common_pair_localization", "frontier_bisector_interior")

# (|IS|, |I1|, |I2|) per (card, arm); specification section 2.
ARM_SIZES: dict[int, dict[str, tuple[int, int, int]]] = {
    12: {"exact12": (3, 2, 4)},
    13: {"secondOpposite": (3, 2, 5), "surplus": (4, 2, 4), "firstOpposite": (3, 3, 4)},
}

# Cut admission record of the specification (section 4) for generic mode.
# Families marked GENERIC are the exact-12 clauses over the profile's labels
# and cyclic order.  Legacy mode is covered by ``exact12.SOURCE_CLAUSE_LEDGER``.
CUT_ADMISSION_LEDGER: tuple[dict[str, str], ...] = (
    {"family": "transitivity", "content": "equal-length is an equivalence relation on edges", "status": "definition, GENERIC"},
    {"family": "two_circle_same_arc", "content": "as at card 12", "status": "proved-source, GENERIC (FourPointTwoCircleBisectorOrderCore.false_of_core_of_same_side + arc bridge)"},
    {"family": "five_point_circle_isosceles_order", "content": "as at card 12", "status": "proved-source, GENERIC (GENERIC_CORES entry)"},
    {"family": "other SELECTABLE_FAMILIES", "content": "optional, as at card 12", "status": "proved-source, GENERIC"},
    {"family": "cap_betweenness", "content": "in each closed cap, taken in boundary order, a cap point equidistant from two other cap points lies strictly between them in that order: for cap labels j and r < s with j outside {r, s} and j not strictly between r and s, the unit clause -same(j; r, s)", "status": "proved-source; exact-card-13 label-level ingress pending", "lean_sources": "CGN.boundary_indices_cyclically_between_of_equidistant (lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean), applied to the ordered-cap data from SurplusCapPacket.capByIndex_cgn4g_capData and the retained CCW boundary enumeration; the exact-card-13 ingress must instantiate the finite direct/mirror label order"},
    {"family": "common_pair_localization", "content": "a center c outside a cap's interior and distinct from the cap's opposite apex a is not equidistant from two distinct interior points s < p that the opposite apex is also equidistant from: the clause (-same(c; s, p), -same(a; s, p))", "status": "proved-source", "lean_sources": "ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_capInteriorByIndex (lean/Erdos9796Proof/P97/ATail/TwoCenterCapLocalization.lean:121); antecedents all available at the leaf"},
    {"family": "frontier_bisector_interior", "content": "a center c distinct from A1 and outside I1 is not equidistant from interior_q and interior_w: the unit clause -same(c; interior_q, interior_w)", "status": "proved-source (leaf hypothesis field)", "lean_sources": "field OriginalUniqueFourResidual.bisector_center_mem_interior (lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/UniqueArmRouteAudit/OriginalUniqueResidualDispatch.lean:66)"},
    {"family": "second_apex_rows", "content": "two rows X, Y: full class at A2 (exact_class); exactly 4 members; at most 1 in IS ∪ {A1}; at most 1 in I1 ∪ {A3}; disjoint", "status": "SelectedFourClass.support_card; _hnoFive (a row is the full class at its radius); _hdisjoint; leftAdjacentCap_at_opposite_card_le_one_of_convexIndep, rightAdjacentCap_at_opposite_card_le_one_of_convexIndep (SurplusM44Packet/Shard01.lean:1064,1079, any radius, index oppIndex2). The interior slice ≥ 2 follows. Card 12 used the stronger exact forms (exactly 2 in I2, exactly 1 per adjacent cap); those are exact-12 rigidity and are NOT used here"},
    {"family": "first_apex_class", "content": "full class at A1; contains interior_q, interior_w; exactly 4 members; at most 1 in IS ∪ {A2}; at most 1 in I2 ∪ {A3}; unique four-class at A1", "status": "OriginalUniqueFourResidual.class_card_eq_four, interior_q_mem, interior_w_mem, unique_K4_radius; adjacent-cap lemmas above at index oppIndex1. Card 12 used exactly 1 per adjacent cap"},
    {"family": "k4_everywhere", "content": "every label has four equidistant labels", "status": "CounterexampleData.K4, GENERIC"},
    {"family": "blockers", "content": "every label has a blocker other than A2 whose unique four-class contains it; late system sends U to A1", "status": "as in the exact-12 ledger, GENERIC"},
    {"family": "ingress", "content": "dropped by default (0 of 30,062 clauses in the card-12 core)", "status": "RELAXATION when included, as at card 12"},
)
OMITTED_FACTS = exact12.OMITTED_FACTS + (
    "every exact-12 rigidity fact (TwoRadiusExactTwelveProfile.lean)",
)


# --------------------------------------------------------------------------
# Profiles
# --------------------------------------------------------------------------


@dataclass(frozen=True)
class Profile:
    """Label layout of one growth arm: ``A2 = 0``, ``A1 = 1``, ``A3 = 2``, then
    ``IS``, ``I1``, ``I2`` consecutively; cyclic order ``(A1, IS…, A2, I1…, A3, I2…)``."""

    card: int
    arm: str
    sizes: tuple[int, int, int]
    is_labels: tuple[int, ...]
    i1_labels: tuple[int, ...]
    i2_labels: tuple[int, ...]
    cyclic_order: tuple[int, ...]

    @property
    def labels(self) -> tuple[int, ...]:
        return tuple(range(self.card))

    @property
    def interior_q(self) -> int:
        return self.i1_labels[0]

    @property
    def interior_w(self) -> int:
        return self.i1_labels[1]

    def others(self, center: int) -> tuple[int, ...]:
        return tuple(label for label in self.labels if label != center)

    def payload(self) -> dict[str, Any]:
        return {
            "card": self.card,
            "arm": self.arm,
            "sizes": list(self.sizes),
            "labels": {
                "a2": A2, "a1": A1, "a3": A3,
                "Is": list(self.is_labels), "I1": list(self.i1_labels), "I2": list(self.i2_labels),
                "interior_q": self.interior_q, "interior_w": self.interior_w,
            },
            "cyclic_order": list(self.cyclic_order),
        }


def profile_for(card: int, arm: str) -> Profile:
    _fail(card in ARM_SIZES, f"no profiles at card {card}")
    _fail(arm in ARM_SIZES[card], f"unknown arm {arm!r} at card {card}")
    sizes = ARM_SIZES[card][arm]
    n_is, n_i1, n_i2 = sizes
    _fail(3 + n_is + n_i1 + n_i2 == card, "profile sizes do not sum to the card")
    _fail(n_i1 >= 2, "profile needs interior_q and interior_w")
    is_labels = tuple(range(3, 3 + n_is))
    i1_labels = tuple(range(3 + n_is, 3 + n_is + n_i1))
    i2_labels = tuple(range(3 + n_is + n_i1, card))
    cyclic_order = (A1,) + is_labels + (A2,) + i1_labels + (A3,) + i2_labels
    return Profile(card, arm, sizes, is_labels, i1_labels, i2_labels, cyclic_order)


EXACT12 = profile_for(12, "exact12")


def all_profiles() -> tuple[Profile, ...]:
    return tuple(profile_for(card, arm) for card, arms in ARM_SIZES.items() for arm in arms)


# --------------------------------------------------------------------------
# Cardinality helpers (subset enumeration; the exact-12 six-variable cap is lifted here)
# --------------------------------------------------------------------------


def _at_most_k(cnf: CNF, family: str, variables: Sequence[int], k: int) -> None:
    for subset in combinations(variables, k + 1):
        cnf.add(family, tuple(-v for v in subset))


def _exactly_k(cnf: CNF, family: str, variables: Sequence[int], k: int) -> None:
    """Exact cardinality by subset enumeration; same clause order as the exact-12 helper."""

    _fail(0 <= k <= len(variables), "cardinality out of range")
    for subset in combinations(variables, len(variables) - k + 1):  # at least k
        cnf.add(family, subset)
    _at_most_k(cnf, family, variables, k)


# --------------------------------------------------------------------------
# Per-profile tables, cores, and orientation
# --------------------------------------------------------------------------


class _Tables:
    def __init__(self, profile: Profile) -> None:
        n = profile.card
        self.n = n
        self.edges: tuple[tuple[int, int], ...] = tuple(combinations(profile.labels, 2))
        self.edge_index = {edge: index for index, edge in enumerate(self.edges)}
        self.edge_table = np.full((n, n), -1, dtype=np.int16)
        for index, (a, b) in enumerate(self.edges):
            self.edge_table[a, b] = self.edge_table[b, a] = index
        self.position = np.zeros(n, dtype=np.int8)
        for index, label in enumerate(profile.cyclic_order):
            self.position[label] = index


_TABLE_CACHE: dict[Profile, _Tables] = {}
_PERMUTATION_CACHE: dict[tuple[int, int], np.ndarray] = {}
_INSTANCE_CACHE: dict[tuple[Profile, str], np.ndarray] = {}


def _tables(profile: Profile) -> _Tables:
    if profile not in _TABLE_CACHE:
        _TABLE_CACHE[profile] = _Tables(profile)
    return _TABLE_CACHE[profile]


def edges_of(profile: Profile) -> tuple[tuple[int, int], ...]:
    return _tables(profile).edges


def _permutations(n: int, size: int) -> np.ndarray:
    key = (n, size)
    if key not in _PERMUTATION_CACHE:
        _PERMUTATION_CACHE[key] = np.array(list(permutations(range(n), size)), dtype=np.int8)
    return _PERMUTATION_CACHE[key]


def _forward(pos: np.ndarray, n: int, i: int, j: int, k: int) -> np.ndarray:
    """Labels i, j, k (columns of pos) appear in this order going forward round the carrier."""

    return ((pos[:, j] - pos[:, i]) % n) < ((pos[:, k] - pos[:, i]) % n)


def core_instances(profile: Profile, name: str) -> np.ndarray:
    """Injective label tuples of the core that satisfy its orientation data on the profile's cyclic order."""

    key = (profile, name)
    if key in _INSTANCE_CACHE:
        return _INSTANCE_CACHE[key]
    tables = _tables(profile)
    core = GENERIC_CORES[name]
    labels = core["labels"]
    perms = _permutations(tables.n, len(labels))
    orientation = core.get("orientation", {})
    if orientation:
        index = {label: i for i, label in enumerate(labels)}
        pos = tables.position[perms].astype(np.int16)
        n = tables.n
        mask = np.ones(len(perms), dtype=bool)
        same = [_forward(pos, n, index[t[0]], index[t[1]], index[t[2]]) for t in orientation.get("same", ())]
        if same:
            stack = np.stack(same, axis=1)
            mask &= stack.all(axis=1) | (~stack).all(axis=1)
        for left, right in orientation.get("opposite", ()):
            mask &= _forward(pos, n, index[left[0]], index[left[1]], index[left[2]]) != _forward(pos, n, index[right[0]], index[right[1]], index[right[2]])
        for chord, other in orientation.get("cross", ()):
            a, b = index[chord[0]], index[chord[1]]
            between = [_forward(pos, n, a, index[z], b) for z in other]
            mask &= between[0] != between[1]
        perms = perms[mask]
    _INSTANCE_CACHE[key] = perms
    return perms


def core_clause(profile: Profile, name: str, labels: Sequence[int], equal: Callable[[int, int], int]) -> tuple[int, ...]:
    """The all-negative clause of one core instance on concrete labels."""

    core = GENERIC_CORES[name]
    _fail(len(labels) == len(core["labels"]) and len(set(labels)) == len(labels), "instance needs distinct labels")
    edge_index = _tables(profile).edge_index
    literals = []
    for (i, j), (k, l) in _core_index_pairs(core):
        first = edge_index[(min(labels[i], labels[j]), max(labels[i], labels[j]))]
        second = edge_index[(min(labels[k], labels[l]), max(labels[k], labels[l]))]
        literals.append(-equal(first, second))
    return tuple(literals)


def relation_matrix(layout: Layout, assignment: Sequence[int]) -> np.ndarray:
    """Symmetric Boolean matrix of the edge-equality relation in a model."""

    truth = {abs(literal): literal > 0 for literal in assignment}
    matrix = np.eye(len(layout.edges), dtype=bool)
    for (first, second), variable in layout.relation_variables.items():
        matrix[first, second] = matrix[second, first] = truth.get(variable, False)
    return matrix


def core_violations(profile: Profile, name: str, matrix: np.ndarray) -> np.ndarray:
    """Every injective label tuple on which the core's equalities all hold (lazy-core check)."""

    core = GENERIC_CORES[name]
    perms = core_instances(profile, name)
    edge_table = _tables(profile).edge_table
    mask = np.ones(len(perms), dtype=bool)
    for (i, j), (k, l) in _core_index_pairs(core):
        first = edge_table[perms[:, i], perms[:, j]]
        second = edge_table[perms[:, k], perms[:, l]]
        mask &= matrix[first, second]
    return perms[mask]


def _same_arc(profile: Profile, q: int, v: int, u: int, y: int) -> bool:
    position = _tables(profile).position
    n = profile.card
    pq, pv = int(position[q]), int(position[v])

    def forward(z: int) -> bool:
        return (int(position[z]) - pq) % n < (pv - pq) % n

    return forward(u) == forward(y)


def _geometry_nogoods(cnf: CNF, profile: Profile, edge: Callable[[int, int], int], equal: Callable[[int, int], int], families: frozenset[str]) -> None:
    """Label-generic all-negative nogoods on the equality relation (listed families only)."""

    labels = profile.labels
    # PerpBisectorCore: a != b, p/q/r distinct, pa = pb, qa = qb, ra = rb
    if "perp_bisector" in families:
        for a, b in combinations(labels, 2):
            rest = tuple(z for z in labels if z not in (a, b))
            for p, q, r in combinations(rest, 3):
                cnf.add("perp_bisector", tuple(-equal(edge(z, a), edge(z, b)) for z in (p, q, r)), _group(a, b, p, q, r), _group(a, b))
    # FourPointTwoCircleBisectorOrderCore on the profile's cyclic order: two
    # distinct common points of the q-circle and the v-circle are mirror
    # images in the line qv, hence on different arcs of the chord qv.
    if "two_circle_same_arc" in families:
        for q, v in combinations(labels, 2):
            rest = tuple(z for z in labels if z not in (q, v))
            for u, y in combinations(rest, 2):
                if _same_arc(profile, q, v, u, y):
                    cnf.add("two_circle_same_arc", (-equal(edge(q, u), edge(q, y)), -equal(edge(u, v), edge(y, v))), _group(q, v, u, y), _group(q, v))
    # eager generic cores, one clause per distinct literal set
    for name in EAGER_CORES:
        if name not in families:
            continue
        seen: set[frozenset[int]] = set()
        for row in core_instances(profile, name):
            instance = tuple(int(x) for x in row)
            clause = core_clause(profile, name, instance, equal)
            key = frozenset(clause)
            if key in seen:
                continue
            seen.add(key)
            cnf.add(name, clause, _group(*instance), _group(instance[0]))


def closed_caps(profile: Profile) -> tuple[tuple[str, tuple[int, ...], int, tuple[int, ...]], ...]:
    """The three closed caps of the profile: ``(name, boundary order, opposite apex, interior)``.

    ``capS = A1, IS…, A2`` (opposite apex ``A3``), ``cap1 = A2, I1…, A3``
    (opposite apex ``A1``), ``cap2 = A3, I2…, A1`` (opposite apex ``A2``); each
    order is the restriction of ``profile.cyclic_order`` to the closed cap,
    read from one end apex to the other.
    """

    return (
        ("capS", (A1,) + profile.is_labels + (A2,), A3, profile.is_labels),
        ("cap1", (A2,) + profile.i1_labels + (A3,), A1, profile.i1_labels),
        ("cap2", (A3,) + profile.i2_labels + (A1,), A2, profile.i2_labels),
    )


def _new_family_nogoods(cnf: CNF, profile: Profile, same: Callable[[int, int, int], int], families: frozenset[str]) -> None:
    """The ``NEW_FAMILIES`` cut families (generic mode only, listed families only).

    Every clause below is built from ``same(center, a, b)``, the relation
    variable of the two edges ``center-a`` and ``center-b``; the loop guards
    keep the three points distinct, so the two edges never coincide.
    """

    labels = profile.labels
    caps = closed_caps(profile)
    # cap_betweenness: a cap point equidistant from two cap points is strictly
    # between them in the cap's boundary order (CGN.index_strictly_between_of_equidistant).
    if "cap_betweenness" in families:
        for _name, order, _opposite, _interior in caps:
            position = {label: index for index, label in enumerate(order)}
            for j in order:
                for r, s in combinations(order, 2):  # order is a sequence, so position[r] < position[s]
                    if j in (r, s):
                        continue
                    if position[r] < position[j] < position[s]:
                        continue
                    cnf.add("cap_betweenness", (-same(j, r, s),), _group(j, r, s), _group(j))
    # common_pair_localization: a common center of two cap-interior points that
    # the opposite apex is also equidistant from lies in the cap interior
    # (commonPhysicalPair_center_mem_capInteriorByIndex).
    if "common_pair_localization" in families:
        for _name, _order, opposite, interior in caps:
            for s, p in combinations(interior, 2):
                for c in labels:
                    if c in interior or c == opposite:
                        continue
                    cnf.add("common_pair_localization", (-same(c, s, p), -same(opposite, s, p)), _group(c, opposite, s, p), _group(s, p))
    # frontier_bisector_interior: a center equidistant from interior_q and
    # interior_w other than A1 lies in I1 (bisector_center_mem_interior).
    if "frontier_bisector_interior" in families:
        q, w = profile.interior_q, profile.interior_w
        for c in labels:
            if c in profile.i1_labels or c == A1:
                continue
            cnf.add("frontier_bisector_interior", (-same(c, q, w),), _group(c, q, w), _group(c))


# --------------------------------------------------------------------------
# Encoding
# --------------------------------------------------------------------------


@dataclass(frozen=True)
class Layout:
    profile: Profile
    mode: str
    edges: tuple[tuple[int, int], ...]
    relation_variables: Mapping[tuple[int, int], int]
    x: Mapping[int, int]
    y: Mapping[int, int]
    u: Mapping[int, int]
    chi: Mapping[tuple[int, int], int]
    k4: Mapping[tuple[int, tuple[int, ...]], int]
    src: Mapping[int, int]  # empty without ingress
    deleted: Mapping[int, int]  # empty without ingress
    b2x: int | None
    b2y: int | None


def build(profile: Profile, *, mode: str, control: str = "none", families: Sequence[str] | None = None, ingress: bool) -> tuple[CNF, Layout]:
    """Build the structural CNF of ``profile`` in ``mode`` (see the module docstring).

    ``families`` restricts the selectable geometry families
    (``SELECTABLE_FAMILIES``); ``None`` keeps all of them.  The ``NEW_FAMILIES``
    cuts are never in the default set: they are emitted only when named, and
    only in generic mode.  ``ingress`` must be ``True`` in legacy mode (the
    exact-12 encoder always emits the family).
    """

    _fail(mode in MODES, "unknown mode")
    _fail(control in CONTROLS, "unknown control")
    if mode == "legacy":
        _fail(profile == EXACT12, "legacy mode is the exact-12 profile only")
        _fail(ingress, "legacy mode always emits the ingress family")
    else:
        _fail(control == "none", "controls are legacy-mode only")
    if families is None:
        active = frozenset(SELECTABLE_FAMILIES)
    else:
        _fail(set(families) <= set(SELECTABLE_FAMILIES) | set(NEW_FAMILIES), "unknown family")
        active = frozenset(families)
    labels = profile.labels
    is_labels, i1_labels, i2_labels = profile.is_labels, profile.i1_labels, profile.i2_labels
    others = profile.others
    cnf = CNF()
    edges = edges_of(profile)
    edge_index = _tables(profile).edge_index
    relation: dict[tuple[int, int], int] = {}
    for left, right in combinations(range(len(edges)), 2):
        relation[(left, right)] = cnf.new_variable(f"eq:{edges[left]}:{edges[right]}")

    def edge(a: int, b: int) -> int:
        _fail(a != b, "edge needs two endpoints")
        return edge_index[(min(a, b), max(a, b))]

    def equal(first_edge: int, second_edge: int) -> int:
        """Variable: the two (distinct) edges have equal length."""

        _fail(first_edge != second_edge, "equal needs two distinct edges")
        return relation[(min(first_edge, second_edge), max(first_edge, second_edge))]

    def same(center: int, a: int, b: int) -> int:
        """Variable: a and b are equidistant from center."""

        _fail(center not in (a, b) and a != b, "same needs three distinct points")
        return equal(edge(center, a), edge(center, b))

    # 1. transitivity of distance equality
    for first, second, third in combinations(range(len(edges)), 3):
        fs, ft, st = relation[(first, second)], relation[(first, third)], relation[(second, third)]
        cnf.add("transitivity", (-fs, -st, ft))
        cnf.add("transitivity", (-fs, -ft, st))
        cnf.add("transitivity", (-ft, -st, fs))
    # 2. two centers never share three equidistant points
    if "duplicate_three_point_center" in active:
        for c1, c2 in combinations(labels, 2):
            rest = tuple(label for label in labels if label not in (c1, c2))
            for p, q, r in combinations(rest, 3):
                cnf.add("duplicate_three_point_center", (-same(c1, p, q), -same(c1, p, r), -same(c2, p, q), -same(c2, p, r)), _group(c1, c2, p, q, r), _group(c1, c2))
    # 2a. label-generic geometry nogoods over the profile's labels and cyclic order
    _geometry_nogoods(cnf, profile, edge, equal, active)
    # 2b. NEW_FAMILIES cuts: generic mode only, and only when named in ``families``
    if mode == "generic":
        _new_family_nogoods(cnf, profile, same, active)

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
        if mode == "legacy":
            _exactly_k(cnf, "second_apex_rows", [member[z] for z in i2_labels], 2)
            _exactly_k(cnf, "second_apex_rows", [member[z] for z in is_labels + (A1,)], 1)
            _exactly_k(cnf, "second_apex_rows", [member[z] for z in i1_labels + (A3,)], 1)
        else:
            _exactly_k(cnf, "second_apex_rows", [member[z] for z in others(A2)], 4)
            _at_most_k(cnf, "second_apex_rows", [member[z] for z in is_labels + (A1,)], 1)
            _at_most_k(cnf, "second_apex_rows", [member[z] for z in i1_labels + (A3,)], 1)
    for z in others(A2):
        cnf.add("second_apex_rows", (-x[z], -y[z]))
    # 4. the first-apex class
    u = {z: cnf.new_variable(f"U:{z}") for z in others(A1)}
    exact_class("first_apex_class", A1, u)
    cnf.add("first_apex_class", (u[profile.interior_q],))
    cnf.add("first_apex_class", (u[profile.interior_w],))
    if mode == "legacy":
        _exactly_k(cnf, "first_apex_class", [u[z] for z in is_labels + (A2,)], 1)
        _exactly_k(cnf, "first_apex_class", [u[z] for z in i2_labels + (A3,)], 1)
    else:
        _exactly_k(cnf, "first_apex_class", [u[z] for z in others(A1)], 4)
        _at_most_k(cnf, "first_apex_class", [u[z] for z in is_labels + (A2,)], 1)
        _at_most_k(cnf, "first_apex_class", [u[z] for z in i2_labels + (A3,)], 1)
    for quad in combinations(others(A1), 4):
        pairwise = tuple(-same(A1, a, b) for a, b in combinations(quad, 2))
        for z in quad:
            cnf.add("first_apex_class", pairwise + (u[z],))
    # 5. K4 everywhere, with selector variables
    k4: dict[tuple[int, tuple[int, ...]], int] = {}
    for center in labels:
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
    for z in labels:
        centers = tuple(c for c in labels if c not in (z, A2))
        for c in centers:
            chi[(z, c)] = cnf.new_variable(f"chi:{z}:{c}")
        _exactly_one(cnf, "blockers", [chi[(z, c)] for c in centers])
        for c in centers:
            guard = -chi[(z, c)]
            rest = tuple(label for label in labels if label not in (z, c))
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
    # 7. ingress: source, deleted point, rows B1 (source shell) and B2 (relaxation, see the ledger)
    src: dict[int, int] = {}
    deleted: dict[int, int] = {}
    b2x: int | None = None
    b2y: int | None = None
    if ingress:
        src = {z: cnf.new_variable(f"src:{z}") for z in labels}
        _exactly_one(cnf, "ingress", [src[z] for z in labels])
        for z in others(A1):
            cnf.add("ingress", (-src[z], -chi[(z, A1)]))
        deleted = {d: cnf.new_variable(f"deleted:{d}") for d in labels if d not in is_labels and d != A1}
        _exactly_one(cnf, "ingress", list(deleted.values()))
        for d, var in deleted.items():
            cnf.add("ingress", (-var, u[d]))
        b2x, b2y = cnf.new_variable("B2:X"), cnf.new_variable("B2:Y")
        _exactly_one(cnf, "ingress", [b2x, b2y])
        for d, var in deleted.items():
            if d in x:
                cnf.add("ingress", (-b2x, -var, -x[d]))
                cnf.add("ingress", (-b2y, -var, -y[d]))
        for z in labels:
            for c in labels:
                if c in (z, A2):
                    continue
                guard = (-src[z], -chi[(z, c)])
                for d, var in deleted.items():
                    if d in (z, c):
                        if d == z:
                            cnf.add("ingress", (-src[z], -var))
                        continue
                    cnf.add("ingress", guard + (-var, -same(c, z, d)))
                candidates = tuple(t for t in labels if t not in (A2, c))
                for row, member in ((b2x, x), (b2y, y)):
                    for triple in combinations(candidates, 3):
                        clause = guard + (-row,) + tuple(-member[t] for t in triple)
                        clause += tuple(-same(c, z, t) for t in triple if t != z)
                        cnf.add("ingress", clause)
    # controls (legacy mode only; the exact-12 label choices)
    if control == "five-at-second-apex":
        for a, b in combinations((A1, is_labels[0], i1_labels[0], i2_labels[0], i2_labels[1]), 2):
            cnf.add("control", (same(A2, a, b),))
    if control == "first-apex-symmetry":
        cnf.add("control", (x[i2_labels[0]],))
    layout = Layout(profile, mode, edges, relation, x, y, u, chi, k4, src, deleted, b2x, b2y)
    return cnf, layout


# --------------------------------------------------------------------------
# CLI
# --------------------------------------------------------------------------


def manifest(cnf: CNF, profile: Profile, *, mode: str, control: str = "none", families: Sequence[str] | None = None, ingress: bool) -> dict[str, Any]:
    legacy = mode == "legacy"
    return {
        "schema": SCHEMA,
        "spec": SPEC,
        "target_theorem": TARGET_THEOREMS[profile.card],
        "lane_id": LANE_ID,
        "promotion_eligible": PROMOTION_ELIGIBLE,
        "profile": profile.payload(),
        "mode": mode,
        "control": control,
        "ingress": ingress,
        "families": None if families is None else list(families),
        "n_variables": cnf.n_variables,
        "n_clauses": len(cnf.clauses),
        "clause_counts": dict(sorted(cnf.counts.items())),
        "cnf_sha256": hashlib.sha256(cnf.dimacs()).hexdigest(),
        "cut_admission_ledger": list(exact12.SOURCE_CLAUSE_LEDGER if legacy else CUT_ADMISSION_LEDGER),
        "omitted_facts": list(exact12.OMITTED_FACTS if legacy else OMITTED_FACTS),
        "lazy_cores": list(LAZY_CORES),
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--card", type=int, choices=sorted(ARM_SIZES), required=True)
    parser.add_argument("--arm", required=True, help="profile name: " + ", ".join(arm for arms in ARM_SIZES.values() for arm in arms))
    parser.add_argument("--mode", choices=MODES, required=True)
    parser.add_argument("--control", choices=CONTROLS, default="none")
    parser.add_argument("--family", action="append", default=None, choices=SELECTABLE_FAMILIES + NEW_FAMILIES, help="keep only this selectable geometry family (repeatable); the NEW_FAMILIES cuts apply in generic mode only")
    parser.add_argument("--ingress", action=argparse.BooleanOptionalAction, default=None, help="emit the ingress family (default: on in legacy mode, off in generic mode)")
    parser.add_argument("--cnf", type=Path, required=True, help="DIMACS output path")
    parser.add_argument("--manifest", type=Path, required=True)
    arguments = parser.parse_args(argv)
    profile = profile_for(arguments.card, arguments.arm)
    ingress = arguments.mode == "legacy" if arguments.ingress is None else arguments.ingress
    cnf, _layout = build(profile, mode=arguments.mode, control=arguments.control, families=arguments.family, ingress=ingress)
    arguments.cnf.write_bytes(cnf.dimacs())
    payload = manifest(cnf, profile, mode=arguments.mode, control=arguments.control, families=arguments.family, ingress=ingress)
    arguments.manifest.write_text(json.dumps(payload, indent=1, sort_keys=True) + "\n")
    sys.stdout.write(json.dumps({"variables": cnf.n_variables, "clauses": len(cnf.clauses), "counts": cnf.counts, "sha256": payload["cnf_sha256"]}, sort_keys=True) + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
