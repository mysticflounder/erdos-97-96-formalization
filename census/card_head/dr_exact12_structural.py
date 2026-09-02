"""D-R two-radius branch: exact-12 structural CNF over the edge-equality relation.

Encoding 1b, structural stage, for
``Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch``
(specification: ``docs/specs/p97-dr-two-radius-exact12-cell-v1.md``).

Twelve labelled points in the fixed profile ``(surplus, opp1, opp2) = (5, 4, 6)``.
The Boolean relation ``eq(e, e')`` on the 66 edges says two distances are equal.
Every D-R hypothesis is stated as a cardinality or exclusion constraint on the
per-center classes this relation induces.  No coordinates; the only
geometric input is the cyclic order ``CYCLIC_ORDER`` below.
The label-generic equality cores of ``Problem97.Census554`` (``GENERIC_CORES``)
are included as all-negative clauses on the relation: each Lean source needs
only an injective realization, convex independence, and, for the order cores,
orientation signs of carrier triples, which the fixed cyclic order
``CYCLIC_ORDER`` supplies.  Cores with at most six labels are eager clause
families; larger cores are checked lazily by ``core_violations``.

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
from itertools import combinations, permutations
from pathlib import Path
from typing import Any

import numpy as np

SCHEMA = "p97-dr-exact12-structural-cnf/v2"  # v1: incidence only (wave 1)
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
    {"family": "duplicate_three_point_center", "content": "two distinct centers are not both equidistant from three common points (circumcenter uniqueness)", "status": "proved-source", "lean_sources": "Problem97.Census554.EqualityCore.not_realizes_of_duplicateCenterCore (EqualityCore.lean; the B1 rule generic_duplicate_three_point_center_obstruction is the same clause)"},
    {"family": "perp_bisector", "content": "three distinct points, each equidistant from two distinct points a, b, are collinear, contradicting convex independence of the carrier", "status": "proved-source", "lean_sources": "Problem97.Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore (PerpBisectorCore; ConvexIndep from CounterexampleData.convex)"},
    {"family": "two_circle_same_arc", "content": "two distinct points equidistant from q and from v are mirror images in the line qv, hence on different sides of it; on the convex carrier with the fixed cyclic order they lie on different arcs of the chord qv", "status": "proved-source (core) + convex-position side/arc bridge", "lean_sources": "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_same_side; side/arc bridge Problem97.onArc_iff_between and Problem97.signedArea2_neg_of_outside (ArcBlockContiguity.lean, proved, reachable from the aggregator by import walk through SurplusM44Packet/Shard01; audit 2026-09-01) via exists_isCcwConvexPolygon_of_convexIndep"},
    {"family": "generic_cores", "content": "label-generic equality cores of Problem97.Census554 (see GENERIC_CORES): each source theorem needs only an injective planar realization, plus convex independence of the carrier and orientation signs of carrier triples where its table row says so; cores with at most six labels are eager clause families named as in GENERIC_CORES, seven-label cores are lazy model checks", "status": "proved-source", "lean_sources": "GENERIC_CORES[*].lean"},
    {"family": "second_apex_rows", "content": "firstRow/secondRow: two disjoint full four-classes at oppApex2; each has two points in the second-cap interior and one point in each adjacent closed cap", "status": "proved-source", "lean_sources": "SelectedFourClass, _hdisjoint, _hnoFive, twoRichClassSlices_partition_of_capInterior_card_eq_four, exactFourTwoRadiusAdjacentCapGrid"},
    {"family": "first_apex_class", "content": "the oppApex1 class has exactly four points, contains interior_q and interior_w, one point in each adjacent closed cap, and is the unique four-class at oppApex1", "status": "proved-source", "lean_sources": "OriginalUniqueFourResidual.class_card_eq_four, interior_q_mem, interior_w_mem, unique_K4_radius, leftAdjacentCap_at_opposite_card_le_one_of_convexIndep"},
    {"family": "k4_everywhere", "content": "every point has at least four equidistant points", "status": "proved-source", "lean_sources": "CounterexampleData.K4"},
    {"family": "blockers", "content": "every point has a blocker other than oppApex2 whose unique four-class contains it; late system sends the first-apex class to oppApex1", "status": "proved-source", "lean_sources": "CriticalShellSystem.shellAt, no_qfree, CriticalFourShell.support_eq, lateFirstApexSystem, FullyDeletionRobustAt.centerAt_ne on surface.secondApex_robust (ATail/DeletionRobustness.lean; no blocker at oppApex2)"},
    {"family": "ingress", "content": "source with blocker outside {oppApex1, oppApex2}; deleted point in the first-apex class outside the surplus interior; B1 = source shell avoids deleted; B2 in {firstRow, secondRow} avoids deleted; |B1 ∩ B2| ≤ 2", "status": "RELAXATION: deleted ∈ {q, w} is projected to deleted ∈ U \\ surplus interior (closed-cap exclusion weakened to interior)", "lean_sources": "ExactFourPhysicalCommonDeletionIngress, CommonDeletionTwoCenterPacket, U5QDeletedK4Class, outsideFirstApexFiber, blocker_ne_secondApex"},
)
OMITTED_FACTS = (
    "metric positions along the cyclic order (only orientation signs of carrier triples are used, through CYCLIC_ORDER)",
    "cores whose Lean statement needs non-carrier data (MECStraddlingRowCore, CircleIntersectionInequalityCore) or the card-11 macro-order machinery (SeparationCore)",
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
    families: list[str] = field(default_factory=list)  # family of clauses[i], in order
    groups: list[str | None] = field(default_factory=list)  # label group of clauses[i] (geometry only)
    coarse: list[str | None] = field(default_factory=list)  # coarse group of clauses[i] (geometry only)

    def new_variable(self, name: str) -> int:
        self.n_variables += 1
        self.names[self.n_variables] = name
        return self.n_variables

    def add(self, family: str, literals: Iterable[int], group: str | None = None, coarse: str | None = None) -> None:
        clause = tuple(sorted(set(literals), key=abs))
        _fail(bool(clause) and all(0 < abs(lit) <= self.n_variables for lit in clause), "bad clause")
        _fail(not any(-lit in clause for lit in clause), "tautological clause")
        self.clauses.append(clause)
        self.families.append(family)
        self.groups.append(group)
        self.coarse.append(coarse)
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


# Cyclic order of the carrier (one boundary orientation, up to reversal; from CapTriple endpoint
# membership): a1, Is, a2, I1, a3, I2.  Within-cap orders are fixed WLOG: the
# base CNF is invariant under relabelling inside Is, inside I2, and under the
# swap of interior_q/interior_w, so every equality pattern has a relabelled
# copy with this order.
CYCLIC_ORDER = (A1, 3, 4, 5, A2, 6, 7, A3, 8, 9, 10, 11)

# Label-generic cores of ``Problem97.Census554``.  Each entry names its labels
# (one character per label, all distinct), the distance equalities it forces
# as pairs of two-letter edges, and its Lean source.  Every source theorem
# needs only ``Realizes`` (an injective planar realization) and the listed
# equalities (plus convex independence and orientation signs where its entry
# says so), so the all-negative clause over every injective label tuple is
# sound for any 12 distinct points.  Cores with at most six labels are added
# eagerly; seven-label cores (about four million instances each) are checked
# lazily against models by ``core_violations``.
GENERIC_CORES: dict[str, dict[str, Any]] = {
    "equal_k4": {
        "labels": "pxyz",
        "equalities": (("px", "py"), ("px", "pz"), ("px", "xy"), ("px", "xz"), ("px", "yz")),
        "lean": "Problem97.Census554.EqualityCore.not_realizes_of_equalK4Core (EqualK4Core)",
    },
    "equilateral_bisector": {
        "labels": "pabcx",
        "equalities": (("pa", "pb"), ("pa", "pc"), ("pa", "ab"), ("pa", "ax"), ("pa", "bx"), ("cx", "ca")),
        "lean": "Problem97.Census554.EqualityCore.not_realizes_of_equilateralBisectorCollisionCore (EquilateralBisectorCollisionCore, Census554/FivePointCollision.lean)",
    },
    "hinge_five_cycle": {
        "labels": "ABCDH",
        "equalities": (("AB", "AD"), ("AB", "AH"), ("BA", "BC"), ("BA", "BH"), ("CA", "CD"), ("DB", "DH"), ("HC", "HD")),
        "lean": "Problem97.Census554.EqualityCore.false_of_fivePointHingeCycleCore (FivePointHingeCycleCore, Census554/EquilateralHingeCollisions.lean)",
    },
    "equilateral_chain_bisector": {
        "labels": "pqxyza",  # x, y, z = t1, t2, t3
        "equalities": (("px", "pz"), ("px", "pq"), ("px", "xy"), ("px", "xq"), ("yp", "yx"), ("pz", "zy"), ("pz", "za"), ("ap", "aq")),
        "lean": "Problem97.Census554.EqualityCore.not_realizes_of_equilateralChainBisectorCore (EquilateralChainBisectorCore); metric kernel Problem97.u5_qcritical_aux_center_metric_incompatibility",
    },
    "hinge_six_tail": {
        "labels": "ABCDHT",
        "equalities": (("AB", "AD"), ("AB", "AH"), ("BA", "BC"), ("BA", "BH"), ("CA", "CD"), ("CA", "CT"), ("DB", "DH"), ("DB", "DT"), ("HC", "HT")),
        "lean": "Problem97.Census554.EqualityCore.false_of_sixPointHingeTailCore (SixPointHingeTailCore)",
    },
    "hinge_six_double_spoke": {
        "labels": "ABCLHR",
        "equalities": (("AB", "AL"), ("AB", "AH"), ("BA", "BC"), ("BA", "BH"), ("BA", "BR"), ("LB", "LC"), ("HC", "HR"), ("RA", "RC"), ("RA", "RL")),
        "lean": "Problem97.Census554.EqualityCore.false_of_sixPointHingeDoubleSpokeCore (SixPointHingeDoubleSpokeCore)",
    },
    "six_point_five_row_interlock": {
        "labels": "pqtuva",
        "equalities": (("qp", "qt"), ("tp", "tq"), ("tp", "tv"), ("tp", "ta"), ("uq", "ut"), ("uq", "uv"), ("vq", "vu"), ("vq", "va"), ("at", "au")),
        "lean": "Problem97.Census554.EqualityCore.not_realizes_of_sixPointFiveRowInterlockCollisionCore",
    },
    "six_point_six_row_interlock": {
        "labels": "pqtuab",
        "equalities": (("qp", "qa"), ("qp", "qt"), ("pq", "pu"), ("uq", "up"), ("aq", "au"), ("aq", "at"), ("aq", "ab"), ("tp", "tb"), ("bq", "bt")),
        "lean": "Problem97.Census554.EqualityCore.not_realizes_of_sixPointSixRowInterlockCollisionCore",
    },
    "hinge_seven_closed_tail": {
        "labels": "ABLMHRT",
        "equalities": (("AB", "AL"), ("AB", "AM"), ("AB", "AH"), ("BA", "BH"), ("BA", "BR"), ("LB", "LH"), ("LB", "LT"), ("HM", "HR"), ("HM", "HT"), ("TA", "TM"), ("TA", "TR")),
        "lean": "Problem97.Census554.EqualityCore.false_of_sevenPointHingeClosedTailCore (SevenPointHingeClosedTailCore)",
    },
    "seven_point_six_row_anchor": {
        "labels": "pqtuvab",
        "equalities": (("pu", "pq"), ("pv", "pq"), ("pa", "pq"), ("qt", "pq"), ("qa", "pq"), ("qb", "pq"), ("tq", "tp"), ("ut", "up"), ("uv", "up"), ("vb", "vq"), ("ba", "bp")),
        "lean": "Problem97.Census554.EqualityCore.not_realizes_of_sevenPointSixRowAnchorCollisionCore",
    },
    "seven_point_six_row_interlock": {
        "labels": "pqtuvab",
        "equalities": (("pq", "pu"), ("pq", "qt"), ("pq", "qb"), ("tp", "tq"), ("up", "ut"), ("up", "uv"), ("up", "ua"), ("vq", "va"), ("vq", "vb"), ("ap", "av"), ("ap", "ab")),
        "lean": "Problem97.Census554.EqualityCore.not_realizes_of_sevenPointSixRowInterlockCollisionCore",
    },
    "seven_point_seven_row_interlock": {
        "labels": "pqtuvab",
        "equalities": (("pq", "pu"), ("pq", "qt"), ("pq", "qv"), ("tp", "tb"), ("uq", "uv"), ("uq", "ua"), ("vp", "va"), ("aq", "at"), ("aq", "ab"), ("bq", "bu"), ("bq", "ba")),
        "lean": "Problem97.Census554.EqualityCore.not_realizes_of_sevenPointSevenRowInterlockCollisionCore",
    },
    "seven_point_equilateral_median_interlock": {
        "labels": "pqtavbu",
        "equalities": (("tp", "tq"), ("qp", "qt"), ("qp", "qv"), ("qp", "qb"), ("at", "aq"), ("vt", "vb"), ("vt", "vu"), ("bq", "ba"), ("bq", "bu"), ("uq", "ua"), ("uq", "uv")),
        "lean": "Problem97.Census554.EqualityCore.not_realizes_of_sevenPointEquilateralMedianInterlockCollisionCore",
    },
    # Order cores: the source theorem also needs orientation signs of carrier
    # triples.  ``same`` lists triples that must all have one sign (the Lean
    # module provides both the all-positive and the all-negative form, so the
    # instance set is independent of the sign convention); ``opposite`` lists
    # pairs of triples with different signs; ``cross`` lists pairs of chords
    # that must cross.  On the convex carrier a triple's sign is fixed by the
    # cyclic order (Problem97.onArc_iff_between / signedArea2_neg_of_outside).
    "convex_five_point": {
        "labels": "axbcy",
        "equalities": (("xa", "xb"), ("ya", "yb"), ("cb", "cx"), ("cb", "cy")),
        "orientation": {"same": ("axb", "bcy")},
        "lean": "Problem97.Census554.ConvexFivePointCore.false_of_core_of_common_orientation",
    },
    "nested_equal_chord": {
        "labels": "oabcd",
        "equalities": (("oa", "ob"), ("oa", "oc"), ("oa", "od"), ("oa", "ad"), ("oa", "bc")),
        "orientation": {"same": ("oad", "obc", "abd", "bcd")},
        "lean": "Problem97.Census554.NestedEqualChordCore.false_of_core / false_of_core_of_neg",
    },
    "six_point_two_circle_order": {
        "labels": "APQBDC",
        "equalities": (("AB", "AC"), ("AB", "AD"), ("AB", "BC"), ("CD", "CP"), ("DA", "DQ")),
        "orientation": {"same": ("ABC", "ABD", "BDC", "APB", "AQB", "QBD", "APQ")},
        "lean": "Problem97.Census554.SixPointTwoCircleOrderCore.false_of_core / false_of_core_of_neg",
    },
    "six_point_nested_center_order": {
        "labels": "OADEXC",
        "equalities": (("OA", "OC"), ("OA", "AC"), ("OA", "OD"), ("OA", "OE"), ("DA", "DE"), ("DA", "DX"), ("EO", "EX")),
        "orientation": {"same": ("OAC", "OAD", "ADC", "ODE", "OEX")},
        "lean": "Problem97.Census554.SixPointNestedCenterOrderCore.false_of_core / false_of_core_of_neg",
    },
    "six_point_circle_chain_order": {
        "labels": "OADECY",
        "equalities": (("OA", "OC"), ("OA", "AC"), ("OA", "OD"), ("OA", "OE"), ("DA", "DE"), ("EA", "EC"), ("EA", "EY"), ("CD", "CY")),
        "orientation": {"same": ("OAC", "OAE", "OAD", "CYO")},
        "lean": "Problem97.Census554.SixPointCircleChainOrderCore.false_of_core / false_of_core_of_neg",
    },
    "six_point_two_circle_arc_overtake_order": {
        "labels": "OACDEF",
        "equalities": (("OA", "OC"), ("OA", "AC"), ("OA", "OD"), ("OA", "OE"), ("DA", "DE"), ("DA", "DF")),
        "orientation": {"same": ("OAC", "OAD", "OAE", "OEC", "OEF", "EFC")},
        "lean": "Problem97.Census554.SixPointTwoCircleArcOvertakeOrderCore.false_of_core / false_of_core_of_neg",
    },
    "convex_rhombus": {
        "labels": "abcxyd",
        "equalities": (("ab", "bc"), ("ab", "cd"), ("ab", "da"), ("ab", "by"), ("ab", "cy"), ("ab", "xd"), ("ab", "xa")),
        "orientation": {"same": ("abc", "abd", "bcy", "xda", "cxy", "xyd")},
        "lean": "Problem97.Census554.ConvexRhombusCore.false_of_core / false_of_core_of_neg",
    },
    "five_point_circle_isosceles_order": {
        "labels": "WFPXZ",
        "equalities": (("WF", "WX"), ("WF", "WZ"), ("PZ", "XZ")),
        "orientation": {"opposite": (("WFZ", "XFZ"),), "cross": (("FX", "PZ"),)},
        "lean": "Problem97.Census554.FivePointCircleIsoscelesOrderCore.false_of_core / false_of_core_of_neg; bridge FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw (proved: linear order W<F<P<X<Z on a ccw indexing, chords cross by CapCrossingKalmansonBridge.exists_mem_openSegment_diagonals_of_ccw); the wrapper from the cyclic predicate (rotation and reversal of the indexing) is {{NEEDS_PROOF}}",
    },
    "five_row_circle_intersection_order": {
        "labels": "OACDEFGH",  # F, G, H = X5, X6, X9
        "equalities": (("OA", "OC"), ("OA", "OD"), ("OA", "OE"), ("OA", "AC"), ("DA", "DF"), ("OA", "EF"), ("OA", "AG"), ("DA", "DG"), ("CD", "CH"), ("OA", "EH")),
        "orientation": {"same": ("OAC", "OAD", "OAE", "ODE", "ODC", "OEC")},
        "lean": "Problem97.Census554.FiveRowCircleIntersectionOrderCore.false_of_core / false_of_core_of_neg",
    },
}
EAGER_CORES = tuple(name for name, core in GENERIC_CORES.items() if len(core["labels"]) <= 6)
LAZY_CORES = tuple(name for name, core in GENERIC_CORES.items() if len(core["labels"]) > 6)

EDGES = tuple(combinations(LABELS, 2))
_EDGE_INDEX = {edge: index for index, edge in enumerate(EDGES)}
EDGE_TABLE = np.full((N, N), -1, dtype=np.int16)
for _index, (_a, _b) in enumerate(EDGES):
    EDGE_TABLE[_a, _b] = EDGE_TABLE[_b, _a] = _index


def _core_index_pairs(core: Mapping[str, Any]) -> tuple[tuple[tuple[int, int], tuple[int, int]], ...]:
    labels = core["labels"]
    _fail(len(set(labels)) == len(labels), "core labels must be distinct")
    position = {label: index for index, label in enumerate(labels)}

    def pair(edge_name: str) -> tuple[int, int]:
        _fail(len(edge_name) == 2 and edge_name[0] != edge_name[1], "edge name needs two distinct labels")
        return position[edge_name[0]], position[edge_name[1]]

    return tuple((pair(left), pair(right)) for left, right in core["equalities"])


def core_clause(name: str, labels: Sequence[int], equal: Any) -> tuple[int, ...]:
    """The all-negative clause of one core instance on concrete labels."""

    core = GENERIC_CORES[name]
    _fail(len(labels) == len(core["labels"]) and len(set(labels)) == len(labels), "instance needs distinct labels")
    literals = []
    for (i, j), (k, l) in _core_index_pairs(core):
        first = _EDGE_INDEX[(min(labels[i], labels[j]), max(labels[i], labels[j]))]
        second = _EDGE_INDEX[(min(labels[k], labels[l]), max(labels[k], labels[l]))]
        literals.append(-equal(first, second))
    return tuple(literals)


_PERMUTATION_CACHE: dict[int, np.ndarray] = {}
_INSTANCE_CACHE: dict[str, np.ndarray] = {}
POSITION = np.zeros(N, dtype=np.int8)
for _index, _label in enumerate(CYCLIC_ORDER):
    POSITION[_label] = _index


def _permutations(size: int) -> np.ndarray:
    if size not in _PERMUTATION_CACHE:
        _PERMUTATION_CACHE[size] = np.array(list(permutations(range(N), size)), dtype=np.int8)
    return _PERMUTATION_CACHE[size]


def _forward(pos: np.ndarray, i: int, j: int, k: int) -> np.ndarray:
    """Labels i, j, k (columns of pos) appear in this order going forward."""

    return ((pos[:, j] - pos[:, i]) % N) < ((pos[:, k] - pos[:, i]) % N)


def core_instances(name: str) -> np.ndarray:
    """Injective label tuples of the core that satisfy its orientation data."""

    if name in _INSTANCE_CACHE:
        return _INSTANCE_CACHE[name]
    core = GENERIC_CORES[name]
    labels = core["labels"]
    perms = _permutations(len(labels))
    orientation = core.get("orientation", {})
    if orientation:
        index = {label: i for i, label in enumerate(labels)}
        pos = POSITION[perms].astype(np.int16)
        mask = np.ones(len(perms), dtype=bool)
        same = [_forward(pos, index[t[0]], index[t[1]], index[t[2]]) for t in orientation.get("same", ())]
        if same:
            stack = np.stack(same, axis=1)
            mask &= stack.all(axis=1) | (~stack).all(axis=1)
        for left, right in orientation.get("opposite", ()):
            mask &= _forward(pos, index[left[0]], index[left[1]], index[left[2]]) != _forward(pos, index[right[0]], index[right[1]], index[right[2]])
        for chord, other in orientation.get("cross", ()):
            a, b = index[chord[0]], index[chord[1]]
            between = [_forward(pos, a, index[z], b) for z in other]
            mask &= between[0] != between[1]
        perms = perms[mask]
    _INSTANCE_CACHE[name] = perms
    return perms


def relation_matrix(layout: "Layout", assignment: Sequence[int]) -> np.ndarray:
    """Symmetric 66x66 Boolean matrix of the equality relation in a model."""

    truth = {abs(literal): literal > 0 for literal in assignment}
    matrix = np.eye(len(EDGES), dtype=bool)
    for (first, second), variable in layout.relation_variables.items():
        matrix[first, second] = matrix[second, first] = truth.get(variable, False)
    return matrix


def core_violations(name: str, matrix: np.ndarray) -> np.ndarray:
    """Every injective label tuple on which the core's equalities all hold."""

    core = GENERIC_CORES[name]
    perms = core_instances(name)
    mask = np.ones(len(perms), dtype=bool)
    for (i, j), (k, l) in _core_index_pairs(core):
        first = EDGE_TABLE[perms[:, i], perms[:, j]]
        second = EDGE_TABLE[perms[:, k], perms[:, l]]
        mask &= matrix[first, second]
    return perms[mask]


def _same_arc(q: int, v: int, u: int, y: int) -> bool:
    pq, pv = int(POSITION[q]), int(POSITION[v])

    def forward(z: int) -> bool:
        return (int(POSITION[z]) - pq) % N < (pv - pq) % N

    return forward(u) == forward(y)


GEOMETRY_FAMILIES = ("duplicate_three_point_center", "perp_bisector", "two_circle_same_arc")


def _group(*labels: int) -> str:
    """Group key of a geometry clause: its unordered label set.

    The coarse key of a clause is the group key of its distinguished labels:
    the chord ``q, v`` of a same-arc clause, the pair ``a, b`` of a
    perpendicular-bisector clause, the two centers of a duplicate-center
    clause, and the label in role position 0 of a generic core (the center
    ``W`` of ``five_point_circle_isosceles_order``).
    """

    return ".".join(str(z) for z in sorted(labels))
SELECTABLE_FAMILIES = GEOMETRY_FAMILIES + EAGER_CORES


def _geometry_nogoods(cnf: CNF, edge: Any, equal: Any, families: frozenset[str]) -> None:
    """Label-generic all-negative nogoods on the equality relation (listed families only)."""

    # PerpBisectorCore: a != b, p/q/r distinct, pa = pb, qa = qb, ra = rb
    if "perp_bisector" in families:
        for a, b in combinations(LABELS, 2):
            rest = tuple(z for z in LABELS if z not in (a, b))
            for p, q, r in combinations(rest, 3):
                cnf.add("perp_bisector", tuple(-equal(edge(z, a), edge(z, b)) for z in (p, q, r)), _group(a, b, p, q, r), _group(a, b))
    # FourPointTwoCircleBisectorOrderCore on the fixed cyclic order: two
    # distinct common points of the q-circle and the v-circle are mirror
    # images in the line qv, so they lie on different sides of it; on a
    # convex carrier that means different arcs of the chord qv.
    if "two_circle_same_arc" in families:
        for q, v in combinations(LABELS, 2):
            rest = tuple(z for z in LABELS if z not in (q, v))
            for u, y in combinations(rest, 2):
                if _same_arc(q, v, u, y):
                    cnf.add("two_circle_same_arc", (-equal(edge(q, u), edge(q, y)), -equal(edge(u, v), edge(y, v))), _group(q, v, u, y), _group(q, v))
    # eager generic cores, one clause per distinct literal set
    for name in EAGER_CORES:
        if name not in families:
            continue
        seen: set[frozenset[int]] = set()
        for row in core_instances(name):
            labels = tuple(int(x) for x in row)
            clause = core_clause(name, labels, equal)
            key = frozenset(clause)
            if key in seen:
                continue
            seen.add(key)
            cnf.add(name, clause, _group(*labels), _group(labels[0]))


def build(control: str = "none", *, geometry: bool = True, families: Sequence[str] | None = None) -> tuple[CNF, Layout]:
    """Build the structural CNF.

    ``geometry=False`` reproduces wave 1 (incidence only, which still carries
    ``duplicate_three_point_center``); ``families`` restricts the selectable
    geometry families (``SELECTABLE_FAMILIES``) to the listed ones, for
    reduced formulas such as the wave-4 minimal family core.
    """

    _fail(control in CONTROLS, "unknown control")
    if families is None:
        active = frozenset(SELECTABLE_FAMILIES) if geometry else frozenset(("duplicate_three_point_center",))
    else:
        _fail(set(families) <= set(SELECTABLE_FAMILIES), "unknown family")
        active = frozenset(families)
    cnf = CNF()
    edges = tuple(combinations(LABELS, 2))
    edge_index = {edge: index for index, edge in enumerate(edges)}
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
        for c1, c2 in combinations(LABELS, 2):
            rest = tuple(label for label in LABELS if label not in (c1, c2))
            for p, q, r in combinations(rest, 3):
                cnf.add("duplicate_three_point_center", (-same(c1, p, q), -same(c1, p, r), -same(c2, p, q), -same(c2, p, r)), _group(c1, c2, p, q, r), _group(c1, c2))
    # 2a. label-generic geometry nogoods (B1 static layers, audited 2026-09-01)
    _geometry_nogoods(cnf, edge, equal, active)

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


def manifest(cnf: CNF, control: str, *, geometry: bool = True, families: Sequence[str] | None = None) -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "target_theorem": TARGET_THEOREM,
        "lane_id": LANE_ID,
        "promotion_eligible": PROMOTION_ELIGIBLE,
        "control": control,
        "geometry": geometry,
        "families": None if families is None else list(families),
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
    parser.add_argument("--no-geometry", action="store_true", help="incidence-only CNF (wave 1)")
    parser.add_argument("--family", action="append", default=None, help="keep only this selectable geometry family (repeatable)")
    arguments = parser.parse_args(argv)
    geometry = not arguments.no_geometry
    cnf, _layout = build(arguments.control, geometry=geometry, families=arguments.family)
    arguments.cnf.write_bytes(cnf.dimacs())
    arguments.manifest.write_text(json.dumps(manifest(cnf, arguments.control, geometry=geometry, families=arguments.family), indent=1, sort_keys=True) + "\n")
    sys.stdout.write(json.dumps({"variables": cnf.n_variables, "clauses": len(cnf.clauses), "counts": cnf.counts}, sort_keys=True) + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
