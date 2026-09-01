"""Named-role metric quotient of the D-R two-radius branch through PIQD/Z3.

Target
    Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch
    (lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean:1245).

Every point in the encoding is a role that the target's binders name, so the
quotient is independent of the carrier cardinality.  A cell fixes the discrete
skeleton (cap placement, cyclic order, frontier selectors, the second ingress
row's identity); the metric stage then asks Z3 (QF_NRA, through PIQD) whether
that cell is realizable.  Each hard-atom family names the Lean declaration it
images in SOURCE_CLAUSE_LEDGER; facts the quotient cannot name are listed under
OMITTED_FACTS and are checked against every SAT model at readback.

Verdicts are diagnostic.  SAT is retained only after exact-rational replay of
every asserted atom.  UNSAT is a Z3 verdict at quotient scope with no
certificate.  There is no local solver fallback.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import subprocess
import sys
from collections.abc import Iterable, Mapping, Sequence
from dataclasses import dataclass, field
from datetime import datetime, timezone
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any

from census.endpoint_confinement import metric_realizability_piqd as endpoint_piqd
from census.p97_search import phase3_piqd_smt_source_adapter as neutral

RESULT_SCHEMA = "p97-dr-two-radius-quotient-metric-piqd-result/v1"
SOURCE_SCHEMA = "p97-dr-two-radius-quotient-metric-piqd-source/v1"
DESCRIPTOR_SCHEMA = "p97-dr-two-radius-quotient-metric-piqd-query/v1"
PROFILE_SCHEMA = "p97-dr-two-radius-quotient-metric-piqd-z3-qfnra-one-shot/v1"
NORMALIZATION_SCHEMA = "p97-dr-two-radius-quotient-metric-smt-normalization/v1"
CELL_SCHEMA = "p97-dr-two-radius-quotient-cell/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
SEMANTIC_STATUS = "diagnostic_named_role_quotient_metric_only"
PROMOTION_ELIGIBLE = False
LANE_ID = "dr-two-radius-20260901"
TARGET_THEOREM = (
    "Problem97.ATailFrontierLiveClosure."
    "false_of_exactFourPostCardElevenTwoRadiusBranch"
)
DEFAULT_SERVER = "http://127.0.0.1:7272"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
CONTROLS = ("none", "duplicate-center", "five-at-second-apex", "small-sat")
CAPS = ("Is", "I1", "I2")
B2_ROLES = ("X", "Y", "Z")

FALSE_CLAIMS = {
    "theorem": False,
    "global": False,
    "universal": False,
    "lean": False,
    "proof": False,
    "euclidean_problem97": False,
    "coverage": False,
    "closure": False,
    "promotion": False,
}

APEX_LABELS = ("a2", "a1", "a3")
GROUPS = {
    "U": tuple(f"U{i}" for i in range(4)),
    "X": tuple(f"X{i}" for i in range(4)),
    "Y": tuple(f"Y{i}" for i in range(4)),
    "B1": tuple(f"B1_{i}" for i in range(4)),
    "Z": tuple(f"Z{i}" for i in range(4)),
}
INTERIOR_Q, INTERIOR_W = "U0", "U1"
SOURCE, FIRST_BLOCKER = "B1_0", "c1"

# Cut admission record.  Every asserted family names its Lean image or is a
# documented derivation from named Lean facts.
SOURCE_CLAUSE_LEDGER: tuple[dict[str, Any], ...] = (
    {
        "family": "gauge",
        "content": "oppApex2 at the origin, oppApex1 at (1,0)",
        "status": "relaxation-free similarity gauge",
        "lean_sources": ["Problem97.SurplusCapPacket.oppApex1", "Problem97.SurplusCapPacket.oppApex2", "Problem97.MoserTriangle.v12_ne"],
        "note": "every other atom is invariant under orientation-preserving similarities; the reflected configuration is covered by the CCW order convention",
    },
    {
        "family": "mec_boundary",
        "content": "the three Moser vertices lie on the minimum enclosing circle",
        "status": "proved-source",
        "lean_sources": ["Problem97.MEC.MoserTriangle.v1_boundary", "Problem97.MEC.MoserTriangle.v2_boundary", "Problem97.MEC.MoserTriangle.v3_boundary"],
    },
    {
        "family": "mec_enclosing",
        "content": "every named carrier point lies in the closed MEC disk",
        "status": "proved-source",
        "lean_sources": ["Problem97.MinEnclosingCircle.enclosing", "Problem97.MEC.dist_mecSphere_center_le"],
    },
    {
        "family": "nonobtuse",
        "content": "inner products at the three Moser vertices are nonnegative",
        "status": "proved-source",
        "lean_sources": ["Problem97.MEC.NonObtuseCircumscribedMoserTriangle.inner_at_v1", "Problem97.MEC.NonObtuseCircumscribedMoserTriangle.inner_at_v2", "Problem97.MEC.NonObtuseCircumscribedMoserTriangle.inner_at_v3"],
    },
    {
        "family": "cap_membership",
        "content": "a point placed in cap i satisfies OnArcOpposite for that cap",
        "status": "proved-source",
        "lean_sources": ["Problem97.CapTriple.arc_membership", "Problem97.OnArcOpposite", "Problem97.signedArea2"],
    },
    {
        "family": "cap_exclusion",
        "content": "a non-Moser point is outside the two other caps (strict product)",
        "status": "proved-source",
        "lean_sources": ["Problem97.CapTriple.nonmoser_in_one", "Problem97.CapTriple.arc_membership"],
    },
    {
        "family": "convexity",
        "content": "strict counterclockwise convex position along the cell's cyclic order",
        "status": "proved-source",
        "lean_sources": ["Problem97.CounterexampleData.convex", "Problem97.ConvexIndep"],
        "note": "the cyclic order a1, Is, a2, I1, a3, I2 follows CapTriple endpoint membership; the within-cap order is the cell's choice",
    },
    {
        "family": "row_equalities",
        "content": "U equidistant from a1; X, Y (and Z) equidistant from a2; B1 equidistant from c1",
        "status": "proved-source",
        "lean_sources": ["Problem97.SelectedClass", "Problem97.SelectedFourClass.support_eq_radius", "Problem97.ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual.class_card_eq_four", "Problem97.ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket.row₁", "Problem97.ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket.row₂", "Problem97.U5QDeletedK4Class.same_radius"],
    },
    {
        "family": "row_exactness",
        "content": "no other named carrier point is at a row's radius from its center",
        "status": "derived",
        "lean_sources": ["Problem97.ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual.class_card_eq_four", "Problem97.ATailExactFourRobustCapExpansion.DeletionRobustRadiusClassification.twoDistinctRadii", "Problem97.CriticalFourShell.support_eq", "Problem97.CriticalFourShell.support_card", "Problem97.ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket.B₂_card"],
        "note": "U, X, Y are full classes of card 4; B1 is the full CriticalFourShell at c1 = lateFirstApexSystem centerAt source; B2 is a 4-subset of a class at a2 that hnoFive bounds by 4, so it is the full class",
    },
    {
        "family": "bisector",
        "content": "no named carrier point other than a1 outside the cap-1 interior is equidistant from interior_q and interior_w",
        "status": "proved-source",
        "lean_sources": ["Problem97.ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual.bisector_center_mem_interior"],
    },
    {
        "family": "distinctness",
        "content": "the cell's carrier labels are pairwise distinct points",
        "status": "cell-choice",
        "lean_sources": ["Problem97.MoserTriangle.v12_ne", "Problem97.MoserTriangle.v13_ne", "Problem97.MoserTriangle.v23_ne", "Problem97.SelectedFourClass.support_card"],
        "note": "coincidence patterns are separate cells; this module's cells make every label a distinct point",
    },
    {
        "family": "source_in_first_row",
        "content": "the ingress source lies in the row B1 at its own blocker c1",
        "status": "derived",
        "lean_sources": ["Problem97.CriticalShellSystem.no_qfree", "Problem97.ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket.row₁", "Problem97.ATailExactFourPhysicalConsumer.ExactFourPhysicalCommonDeletionIngress.packet"],
        "note": "if source were outside B1, then B1 would witness a four-class at c1 inside A.erase source, contradicting no_qfree at source; realized structurally as the label identity B1_0 = source",
    },
    {
        "family": "structural_cell_rules",
        "content": "interior_q, interior_w in the cap-1 interior; at most one member of each apex class in each adjacent closed cap; at least two members of X, Y in the cap-2 interior; frontier pair outside the surplus cap; source outside U; c1 distinct from a1, a2",
        "status": "proved-source",
        "lean_sources": ["Problem97.ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual.interior_q_mem", "Problem97.ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual.interior_w_mem", "Problem97.SurplusCapPacket.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep", "Problem97.SurplusCapPacket.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep", "Problem97.ATailExactFourRobustCapExpansion.interiorPairGood_or_twoDistinctExactFourInteriorRows", "Problem97.ATailCriticalPairFrontier.SurvivorPairRelocationPacket.q_mem_marginal", "Problem97.ATailExactFourPhysicalConsumer.outsideFirstApexFiber", "Problem97.ATailExactFourPhysicalConsumer.ExactFourPhysicalCommonDeletionIngress.blocker_ne_secondApex"],
    },
)

# Facts the named-role quotient cannot assert.  Each is checked against the
# exact-rational coordinates of every SAT model and reported, never asserted.
OMITTED_FACTS: tuple[dict[str, str], ...] = (
    {"fact": "no_five_at_second_apex", "lean": "hnoFive binder", "check": "at most four named carrier points share a distance from a2"},
    {"fact": "unique_four_radius_at_first_apex", "lean": "OriginalUniqueFourResidual.unique_K4_radius", "check": "only the U radius has at least four named points from a1"},
    {"fact": "first_blocker_unique_four", "lean": "CriticalShellSystem.no_qfree at source", "check": "only the B1 radius has at least four named points from c1"},
    {"fact": "k4_named", "lean": "CounterexampleData.K4", "check": "which named points have four named equidistant points (informational; unnamed carrier points may supply them)"},
    {"fact": "blockers_named", "lean": "CriticalShellSystem.shellAt", "check": "which named points have a named unique-four blocker (informational)"},
    {"fact": "minimality_no_m44", "lean": "OriginalUniqueFourResidual.minimal, noM44", "check": "not checkable on a quotient"},
)


class DRQuotientError(RuntimeError):
    """The cell, journal, PIQD response, or custody boundary failed closed."""


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("utf-8")


def _fail(condition: bool, message: str) -> None:
    if not condition:
        raise DRQuotientError(message)


# --------------------------------------------------------------------------
# Cells
# --------------------------------------------------------------------------


@dataclass(frozen=True)
class QuotientCell:
    """One discrete skeleton of the named-role quotient.

    ``placement`` maps every non-apex carrier label to a cap interior;
    ``interior_order`` lists, per cap, its labels in counterclockwise order;
    ``q_slot``/``w_slot`` pick the frontier pair inside U; ``deleted`` picks
    which of the pair the ingress deletes; ``b2_role`` identifies the second
    ingress row with X, Y, or a third exact class Z at a2.
    """

    cell_id: str
    b2_role: str
    placement: Mapping[str, str]
    interior_order: Mapping[str, tuple[str, ...]]
    q_slot: int
    w_slot: int
    deleted: str

    def payload(self) -> dict[str, Any]:
        return {
            "schema": CELL_SCHEMA,
            "cell_id": self.cell_id,
            "b2_role": self.b2_role,
            "placement": dict(sorted(self.placement.items())),
            "interior_order": {cap: list(self.interior_order[cap]) for cap in CAPS},
            "q_slot": self.q_slot,
            "w_slot": self.w_slot,
            "deleted": self.deleted,
        }


def cell_from_payload(value: object) -> QuotientCell:
    _fail(type(value) is dict, "cell payload must be a JSON object")
    assert type(value) is dict
    _fail(value.get("schema") == CELL_SCHEMA, "cell schema mismatch")
    placement = value.get("placement")
    order = value.get("interior_order")
    _fail(type(placement) is dict and type(order) is dict, "cell placement/order must be objects")
    assert type(placement) is dict and type(order) is dict
    _fail(set(order) == set(CAPS), "interior_order must name exactly the three caps")
    return QuotientCell(
        cell_id=str(value.get("cell_id")),
        b2_role=str(value.get("b2_role")),
        placement={str(k): str(v) for k, v in placement.items()},
        interior_order={cap: tuple(str(x) for x in order[cap]) for cap in CAPS},
        q_slot=int(value.get("q_slot")),
        w_slot=int(value.get("w_slot")),
        deleted=str(value.get("deleted")),
    )


def carrier_labels(cell: QuotientCell) -> tuple[str, ...]:
    """Carrier labels in index order; the first two carry the gauge."""

    groups = ("U", "X", "Y", "B1") + (("Z",) if cell.b2_role == "Z" else ())
    labels = list(APEX_LABELS)
    for group in groups:
        labels.extend(GROUPS[group])
    labels.append(FIRST_BLOCKER)
    return tuple(labels)


def frontier_pair(cell: QuotientCell) -> tuple[str, str, str]:
    q = GROUPS["U"][cell.q_slot]
    w = GROUPS["U"][cell.w_slot]
    return q, w, (q if cell.deleted == "q" else w)


def second_row(cell: QuotientCell) -> tuple[str, ...]:
    return GROUPS[cell.b2_role]


def validate_cell(cell: QuotientCell) -> tuple[str, ...]:
    """Check the structural rules the Lean sources impose on a cell."""

    _fail(
        type(cell.cell_id) is str
        and bool(cell.cell_id)
        and all(ch.isalnum() or ch in "-_" for ch in cell.cell_id),
        "cell_id must be alphanumeric with dashes or underscores",
    )
    _fail(cell.b2_role in B2_ROLES, "b2_role must be X, Y, or Z")
    labels = carrier_labels(cell)
    non_apex = tuple(label for label in labels if label not in APEX_LABELS)
    _fail(set(cell.placement) == set(non_apex), "placement must cover exactly the non-apex carrier labels")
    _fail(all(cap in CAPS for cap in cell.placement.values()), "placement values must be cap interiors")
    for cap in CAPS:
        placed = sorted(label for label, where in cell.placement.items() if where == cap)
        _fail(sorted(cell.interior_order[cap]) == placed, f"interior_order[{cap}] must be a permutation of the labels placed there")
    _fail(cell.q_slot in range(4) and cell.w_slot in range(4) and cell.q_slot != cell.w_slot, "q_slot and w_slot must be distinct U slots")
    _fail(cell.deleted in {"q", "w"}, "deleted must be q or w")

    def count(group: str, cap: str) -> int:
        return sum(1 for label in GROUPS[group] if cell.placement[label] == cap)

    # OriginalUniqueFourResidual.interior_q_mem / interior_w_mem.
    _fail(cell.placement[INTERIOR_Q] == "I1" and cell.placement[INTERIOR_W] == "I1", "interior_q and interior_w must lie in the cap-1 interior")
    # Adjacent-cap one-hit bounds at oppApex1 (caps Is and I2 are adjacent to a1).
    _fail(count("U", "Is") <= 1 and count("U", "I2") <= 1, "U has at most one point in each cap adjacent to a1")
    # Producer interior bounds and adjacent-cap one-hit bounds at oppApex2.
    for group in ("X", "Y") + (("Z",) if cell.b2_role == "Z" else ()):
        _fail(count(group, "I2") >= 2, f"{group} needs at least two points in the cap-2 interior")
        _fail(count(group, "Is") <= 1 and count(group, "I1") <= 1, f"{group} has at most one point in each cap adjacent to a2")
    # Frontier pair outside the surplus cap.
    q, w, _deleted = frontier_pair(cell)
    _fail(cell.placement[q] != "Is" and cell.placement[w] != "Is", "the frontier pair lies outside the surplus cap")
    return labels


def cyclic_order(cell: QuotientCell) -> tuple[str, ...]:
    """CCW hull order: a1, surplus interior, a2, cap-1 interior, a3, cap-2 interior."""

    return (
        "a1",
        *cell.interior_order["Is"],
        "a2",
        *cell.interior_order["I1"],
        "a3",
        *cell.interior_order["I2"],
    )


def generic_cell(cell_id: str = "generic-x", b2_role: str = "X") -> QuotientCell:
    """The all-distinct principal cell with a natural within-cap order."""

    placement = {
        "U0": "I1", "U1": "I1", "U2": "I2", "U3": "Is",
        "X0": "I2", "X1": "I2", "X2": "Is", "X3": "I1",
        "Y0": "I2", "Y1": "I2", "Y2": "Is", "Y3": "I1",
        "B1_0": "I2", "B1_1": "Is", "B1_2": "I1", "B1_3": "I2",
        "c1": "Is",
    }
    if b2_role == "Z":
        placement.update({"Z0": "I2", "Z1": "I2", "Z2": "Is", "Z3": "I1"})
    order = {
        "Is": ("U3", "X2", "c1", "B1_1", "Y2") + (("Z2",) if b2_role == "Z" else ()),
        "I1": ("X3", "U0", "B1_2", "U1", "Y3") + (("Z3",) if b2_role == "Z" else ()),
        "I2": ("Y0", "B1_0", "X0", "U2", "X1", "B1_3", "Y1") + (("Z0", "Z1") if b2_role == "Z" else ()),
    }
    return QuotientCell(
        cell_id=cell_id,
        b2_role=b2_role,
        placement=placement,
        interior_order=order,
        q_slot=0,
        w_slot=1,
        deleted="q",
    )


# --------------------------------------------------------------------------
# Atoms: a tiny polynomial AST printed to SMT-LIB and evaluated over Q
# --------------------------------------------------------------------------

Expr = tuple


def _var(name: str) -> Expr:
    return ("var", name)


def _const(value: int) -> Expr:
    return ("const", value)


def _add(*terms: Expr) -> Expr:
    return ("+",) + terms


def _sub(left: Expr, right: Expr) -> Expr:
    return ("-", left, right)


def _mul(*terms: Expr) -> Expr:
    return ("*",) + terms


def _x(index: int) -> Expr:
    return _var(f"x_{index}")


def _y(index: int) -> Expr:
    return _var(f"y_{index}")


def _d2(p: int, q: int) -> Expr:
    dx = _sub(_x(p), _x(q))
    dy = _sub(_y(p), _y(q))
    return _add(_mul(dx, dx), _mul(dy, dy))


def _d2_center(p: int) -> Expr:
    dx = _sub(_x(p), _var("ox"))
    dy = _sub(_y(p), _var("oy"))
    return _add(_mul(dx, dx), _mul(dy, dy))


def _signed_area(v: int, j: int, k: int) -> Expr:
    """Problem97.signedArea2 v vj vk."""

    return _sub(
        _mul(_sub(_x(j), _x(v)), _sub(_y(k), _y(v))),
        _mul(_sub(_x(k), _x(v)), _sub(_y(j), _y(v))),
    )


def _inner_at(v: int, u: int, w: int) -> Expr:
    """inner (u - v) (w - v)."""

    return _add(
        _mul(_sub(_x(u), _x(v)), _sub(_x(w), _x(v))),
        _mul(_sub(_y(u), _y(v)), _sub(_y(w), _y(v))),
    )


def _smt(expr: Expr) -> str:
    head = expr[0]
    if head == "var":
        return expr[1]
    if head == "const":
        value = expr[1]
        return str(value) if value >= 0 else f"(- {-value})"
    return "(" + head + " " + " ".join(_smt(item) for item in expr[1:]) + ")"


def _evaluate(expr: Expr, values: Mapping[str, Fraction]) -> Fraction:
    head = expr[0]
    if head == "var":
        return values[expr[1]]
    if head == "const":
        return Fraction(expr[1])
    parts = [_evaluate(item, values) for item in expr[1:]]
    if head == "+":
        return sum(parts, Fraction(0))
    if head == "-":
        return parts[0] - parts[1]
    if head == "*":
        result = Fraction(1)
        for part in parts:
            result *= part
        return result
    raise DRQuotientError("unknown expression head")


Atom = tuple[str, str, Expr]  # (family, relation against zero, expression)
_RELATIONS = {"=", ">", ">=", "<="}


def _holds(relation: str, value: Fraction) -> bool:
    if relation == "=":
        return value == 0
    if relation == ">":
        return value > 0
    if relation == ">=":
        return value >= 0
    if relation == "<=":
        return value <= 0
    raise DRQuotientError("unknown relation")


def build_atoms(cell: QuotientCell, control: str = "none") -> tuple[Atom, ...]:
    """Every asserted atom of the cell, in deterministic family order."""

    _fail(control in CONTROLS, "unknown control")
    labels = validate_cell(cell)
    index = {label: position for position, label in enumerate(labels)}
    a2, a1, a3 = index["a2"], index["a1"], index["a3"]
    n = len(labels)
    order = [index[label] for label in cyclic_order(cell)]
    _fail(sorted(order) == list(range(n)), "cyclic order must cover every carrier label once")
    atoms: list[Atom] = []
    if control in {"duplicate-center", "small-sat"}:
        return _reduced_control_atoms(control, index)

    # gauge
    atoms.append(("gauge", "=", _x(a2)))
    atoms.append(("gauge", "=", _y(a2)))
    atoms.append(("gauge", "=", _sub(_x(a1), _const(1))))
    atoms.append(("gauge", "=", _y(a1)))
    # mec
    for apex in (a1, a2, a3):
        atoms.append(("mec_boundary", "=", _sub(_d2_center(apex), _var("rr"))))
    for point in range(n):
        atoms.append(("mec_enclosing", "<=", _sub(_d2_center(point), _var("rr"))))
    # nonobtuse
    atoms.append(("nonobtuse", ">=", _inner_at(a1, a2, a3)))
    atoms.append(("nonobtuse", ">=", _inner_at(a2, a3, a1)))
    atoms.append(("nonobtuse", ">=", _inner_at(a3, a1, a2)))
    # caps: Is opposite a3 (chord a1 a2); I1 opposite a1 (chord a2 a3); I2 opposite a2 (chord a3 a1)
    chord = {"Is": (a3, a1, a2), "I1": (a1, a2, a3), "I2": (a2, a3, a1)}
    for label in labels:
        if label in APEX_LABELS:
            continue
        point = index[label]
        home = cell.placement[label]
        for cap in CAPS:
            vi, vj, vk = chord[cap]
            product = _mul(_signed_area(point, vj, vk), _signed_area(vi, vj, vk))
            if cap == home:
                atoms.append(("cap_membership", "<=", product))
            else:
                atoms.append(("cap_exclusion", ">", product))
    # convexity
    for position, left in enumerate(order):
        right = order[(position + 1) % n]
        for point in order:
            if point not in {left, right}:
                atoms.append(("convexity", ">", _signed_area(left, right, point)))
    # rows
    rows: list[tuple[int, tuple[int, ...]]] = [
        (a1, tuple(index[label] for label in GROUPS["U"])),
        (a2, tuple(index[label] for label in GROUPS["X"])),
        (a2, tuple(index[label] for label in GROUPS["Y"])),
        (index[FIRST_BLOCKER], tuple(index[label] for label in GROUPS["B1"])),
    ]
    if cell.b2_role == "Z":
        rows.append((a2, tuple(index[label] for label in GROUPS["Z"])))
    for center, support in rows:
        reference = _d2(center, support[0])
        for point in support[1:]:
            atoms.append(("row_equalities", "=", _sub(_d2(center, point), reference)))
        for point in range(n):
            if point != center and point not in support:
                delta = _sub(_d2(center, point), reference)
                atoms.append(("row_exactness", ">", _mul(delta, delta)))
    # bisector
    iq, iw = index[INTERIOR_Q], index[INTERIOR_W]
    for label in labels:
        if label == "a1" or cell.placement.get(label) == "I1":
            continue
        point = index[label]
        delta = _sub(_d2(point, iq), _d2(point, iw))
        atoms.append(("bisector", ">", _mul(delta, delta)))
    # distinctness
    for left, right in combinations(range(n), 2):
        atoms.append(("distinctness", ">", _d2(left, right)))
    # full-system negative control (expected UNSAT by the exactness family)
    if control == "five-at-second-apex":
        atoms.append(("control", "=", _sub(_d2(a2, index["Y0"]), _d2(a2, index["X0"]))))
    return tuple(atoms)


def _reduced_control_atoms(control: str, index: Mapping[str, int]) -> tuple[Atom, ...]:
    """Tiny hand-checkable systems over a few labels (Guardrail 1 smoke gates).

    duplicate-center: a2 and a3 both equidistant from X0, X1, X2, all five
    distinct.  Two distinct circles share at most two points, so UNSAT.
    small-sat: a2, a1 and three points of X on a circle around a2 in strict
    convex position with a1.  Realizable, so SAT with a rational model.
    """

    a2, a1, a3 = index["a2"], index["a1"], index["a3"]
    x0, x1, x2 = index["X0"], index["X1"], index["X2"]
    atoms: list[Atom] = [
        ("gauge", "=", _x(a2)),
        ("gauge", "=", _y(a2)),
        ("gauge", "=", _sub(_x(a1), _const(1))),
        ("gauge", "=", _y(a1)),
    ]
    if control == "duplicate-center":
        points = (a2, a3, x0, x1, x2)
        for center in (a2, a3):
            reference = _d2(center, x0)
            for point in (x1, x2):
                atoms.append(("row_equalities", "=", _sub(_d2(center, point), reference)))
        for left, right in combinations(points, 2):
            atoms.append(("distinctness", ">", _d2(left, right)))
        return tuple(atoms)
    reference = _d2(a2, x0)
    for point in (x1, x2):
        atoms.append(("row_equalities", "=", _sub(_d2(a2, point), reference)))
    cycle = (a1, a2, x0, x1, x2)
    for position, left in enumerate(cycle):
        right = cycle[(position + 1) % len(cycle)]
        for point in cycle:
            if point not in {left, right}:
                atoms.append(("convexity", ">", _signed_area(left, right, point)))
    for left, right in combinations(cycle, 2):
        atoms.append(("distinctness", ">", _d2(left, right)))
    return tuple(atoms)


def atom_counts(atoms: Sequence[Atom]) -> dict[str, int]:
    counts: dict[str, int] = {}
    for family, _relation, _expr in atoms:
        counts[family] = counts.get(family, 0) + 1
    counts["total"] = len(atoms)
    return dict(sorted(counts.items()))


def _variables_of(expr: Expr, found: set[str]) -> None:
    if expr[0] == "var":
        found.add(expr[1])
    elif expr[0] != "const":
        for item in expr[1:]:
            _variables_of(item, found)


def variable_terms(cell: QuotientCell, control: str = "none") -> tuple[str, ...]:
    """Declared real variables: every coordinate the asserted atoms mention, in index order."""

    n = len(carrier_labels(cell))
    terms = [f"{axis}_{point}" for point in range(n) for axis in ("x", "y")] + ["ox", "oy", "rr"]
    used: set[str] = set()
    for _family, _relation, expr in build_atoms(cell, control):
        _variables_of(expr, used)
    return tuple(term for term in terms if term in used)


def build_journal(cell: QuotientCell, control: str = "none") -> tuple[tuple[str, ...], dict[str, int]]:
    """Deterministic, terminal-command-free QF_NRA state journal."""

    atoms = build_atoms(cell, control)
    commands = ["(set-logic QF_NRA)"]
    commands.extend(f"(declare-fun {term} () Real)" for term in variable_terms(cell, control))
    for _family, relation, expr in atoms:
        commands.append(f"(assert ({relation} {_smt(expr)} 0))")
    return tuple(commands), atom_counts(atoms)


# --------------------------------------------------------------------------
# Exact-rational replay and omitted-fact readback
# --------------------------------------------------------------------------


def replay_atoms(cell: QuotientCell, control: str, values: Mapping[str, Fraction]) -> tuple[bool, dict[str, Any]]:
    atoms = build_atoms(cell, control)
    checked: dict[str, int] = {}
    for family, relation, expr in atoms:
        checked[family] = checked.get(family, 0) + 1
        if not _holds(relation, _evaluate(expr, values)):
            return False, {"reason": family, "atom_index": checked[family] - 1}
    return True, {"checks": dict(sorted(checked.items())), "total": len(atoms)}


def _distance_classes(values: Mapping[str, Fraction], n: int, center: int) -> dict[Fraction, list[int]]:
    classes: dict[Fraction, list[int]] = {}
    for point in range(n):
        if point == center:
            continue
        d2 = _evaluate(_d2(center, point), values)
        classes.setdefault(d2, []).append(point)
    return classes


def omitted_fact_readback(cell: QuotientCell, values: Mapping[str, Fraction]) -> dict[str, Any]:
    """Check the omitted universal facts on one exact model (diagnostic only)."""

    labels = carrier_labels(cell)
    index = {label: position for position, label in enumerate(labels)}
    n = len(labels)
    a1, a2, c1 = index["a1"], index["a2"], index[FIRST_BLOCKER]
    report: dict[str, Any] = {}
    classes_a2 = _distance_classes(values, n, a2)
    report["no_five_at_second_apex"] = {
        "holds": max(len(v) for v in classes_a2.values()) <= 4,
        "class_sizes": sorted((len(v) for v in classes_a2.values()), reverse=True),
    }
    u_radius = _evaluate(_d2(a1, index["U0"]), values)
    classes_a1 = _distance_classes(values, n, a1)
    report["unique_four_radius_at_first_apex"] = {
        "holds": all(len(v) < 4 for d2, v in classes_a1.items() if d2 != u_radius),
        "other_class_sizes": sorted((len(v) for d2, v in classes_a1.items() if d2 != u_radius), reverse=True),
    }
    b1_radius = _evaluate(_d2(c1, index[SOURCE]), values)
    classes_c1 = _distance_classes(values, n, c1)
    report["first_blocker_unique_four"] = {
        "holds": all(len(v) < 4 for d2, v in classes_c1.items() if d2 != b1_radius),
        "other_class_sizes": sorted((len(v) for d2, v in classes_c1.items() if d2 != b1_radius), reverse=True),
    }
    k4: dict[str, int] = {}
    for point, label in enumerate(labels):
        classes = _distance_classes(values, n, point)
        k4[label] = max(len(v) for v in classes.values())
    report["k4_named"] = {
        "max_named_class_size": k4,
        "named_points_without_four": sorted(label for label, size in k4.items() if size < 4),
    }
    blockers: dict[str, list[str]] = {}
    for point, label in enumerate(labels):
        found: list[str] = []
        for center, center_label in enumerate(labels):
            if center == point:
                continue
            classes = _distance_classes(values, n, center)
            sizes = [len(v) for v in classes.values()]
            own = classes.get(_evaluate(_d2(center, point), values), [])
            if len(own) == 4 and sizes.count(4) == 1 and max(sizes) == 4:
                found.append(center_label)
        blockers[label] = found
    report["blockers_named"] = {
        "named_unique_four_blockers": blockers,
        "named_points_without_named_blocker": sorted(label for label, found in blockers.items() if not found),
    }
    return report


def verify_sat_model(
    query: neutral.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> neutral.SemanticVerification:
    """Independently replay every asserted atom using exact rationals."""

    if solver != "z3" or type(model) is not str or type(values) is not str:
        raise DRQuotientError("SAT replay received the wrong solver/model shape")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict:
        raise DRQuotientError("SAT semantic input has the wrong type")
    cell = cell_from_payload(semantic.get("cell"))
    control = semantic.get("control")
    _fail(control in CONTROLS, "SAT semantic input has an unknown control")
    expected = atom_counts(build_atoms(cell, control))
    if semantic.get("constraint_counts") != expected:
        raise DRQuotientError("SAT constraint counts are not authenticated")
    try:
        readback = endpoint_piqd._readback(values, query.get_values)
    except endpoint_piqd.EndpointMetricPiqdError as exc:
        return neutral.SemanticVerification(False, {"reason": "non-rational-readback", "detail": str(exc)})
    accepted, evidence = replay_atoms(cell, control, readback)
    if not accepted:
        return neutral.SemanticVerification(False, evidence)
    if evidence["total"] != expected["total"]:
        raise DRQuotientError("SAT replay did not cover every asserted atom")
    n = len(carrier_labels(cell))
    coordinates = {
        label: {"x": str(readback[f"x_{point}"]), "y": str(readback[f"y_{point}"])}
        for point, label in enumerate(carrier_labels(cell))
    }
    coordinates["mec_center"] = {"x": str(readback["ox"]), "y": str(readback["oy"])}
    return neutral.SemanticVerification(
        True,
        {
            "cell_id": cell.cell_id,
            "control": control,
            "model_sha256": _sha(model.encode()),
            "values_sha256": _sha(values.encode()),
            "exact_rational_readback": True,
            "all_asserted_atoms_replayed": True,
            "checks": evidence["checks"],
            "carrier_points": n,
            "mec_squared_radius": str(readback["rr"]),
            "coordinates": coordinates,
            "omitted_fact_readback": omitted_fact_readback(cell, readback),
        },
    )


# --------------------------------------------------------------------------
# Constructive exact witness search (float optimisation, exact replay; no solver)
# --------------------------------------------------------------------------

Point = tuple[Fraction, Fraction]

# Fixed near-equilateral rational Moser triangle with rational circumcentre.
WITNESS_APEX_A3: Point = (Fraction(1, 2), Fraction(-6, 7))
WITNESS_MEC_CENTER: Point = (Fraction(1, 2), Fraction(-665, 2352))
WITNESS_MEC_RR: Fraction = Fraction(1, 4) + Fraction(665, 2352) ** 2

# Cap each class point occupies (the generic placement, in class order).
WITNESS_NEEDS: dict[str, tuple[str, ...]] = {
    "U": ("I1", "I1", "I2", "Is"),
    "X": ("I2", "I2", "Is", "I1"),
    "Y": ("I2", "I2", "Is", "I1"),
    "B1": ("I2", "Is", "I1", "I2"),
    "Z": ("I2", "I2", "Is", "I1"),
}

# Target margins per strict family, in the units returned by `_atom_margin`
# (lengths for orientation and distinctness atoms, squared lengths for the
# exactness and bisector atoms, a fraction of rr for enclosure).
MARGIN_TARGETS: dict[str, float] = {
    "mec_enclosing": 0.02,
    "nonobtuse": 0.05,
    "cap_membership": 0.004,
    "cap_exclusion": 0.004,
    "convexity": 0.003,
    "row_exactness": 0.004,
    "bisector": 0.004,
    "distinctness": 0.03,
}
_EXACT_FAMILIES = frozenset({"gauge", "mec_boundary", "row_equalities", "control"})
_EDGE_FLOOR = 0.02  # keeps the edge-normalised convexity margin bounded near coincident points
_RATIONAL_LIMIT = 10_000
_CAP_START = {"Is": "a1", "I1": "a2", "I2": "a3"}


def _circle_point(center: Point, radius: Fraction, t: Fraction) -> Point:
    """Point on the circle |p - center| = radius with Pythagorean parameter t.

    Exact over Q; the same map is used with floats during the search so the
    rationalised parameters land within rounding of the optimised point.
    """

    denominator = 1 + t * t
    return (center[0] + radius * (1 - t * t) / denominator, center[1] + radius * 2 * t / denominator)


def _signed_area_points(v: Point, j: Point, k: Point) -> Fraction:
    return (j[0] - v[0]) * (k[1] - v[1]) - (k[0] - v[0]) * (j[1] - v[1])


def _cap_of(point: Point, a1: Point, a2: Point, a3: Point) -> str | None:
    """Cap interior by the OnArcOpposite rule; None if in no cap or in two."""

    chords = {"Is": (a3, a1, a2), "I1": (a1, a2, a3), "I2": (a2, a3, a1)}
    caps = [
        cap
        for cap, (vi, vj, vk) in chords.items()
        if _signed_area_points(point, vj, vk) * _signed_area_points(vi, vj, vk) <= 0
    ]
    return caps[0] if len(caps) == 1 else None


def _fraction(value: float, limit: int) -> Fraction:
    return Fraction(value).limit_denominator(limit)


def _python_source(expr: Expr) -> str:
    head = expr[0]
    if head == "var":
        return expr[1]
    if head == "const":
        return repr(expr[1])
    parts = [_python_source(item) for item in expr[1:]]
    if head == "+":
        return "(" + "+".join(parts) + ")"
    if head == "-":
        return f"({parts[0]}-{parts[1]})"
    if head == "*":
        return "(" + "*".join(parts) + ")"
    raise DRQuotientError("unknown expression head")


def _var_index(expr: Expr) -> int:
    _fail(expr[0] == "var" and "_" in expr[1], "expected a point coordinate variable")
    return int(expr[1].split("_")[1])


def _signed_area_args(expr: Expr) -> tuple[int, int, int]:
    """Recover (v, j, k) from an expression built by `_signed_area`."""

    first = expr[1]
    return _var_index(first[1][2]), _var_index(first[1][1]), _var_index(first[2][1])


@dataclass(frozen=True)
class _CompiledAtom:
    family: str
    relation: str
    code: Any
    normaliser: tuple[int, ...] | None
    triangle_code: Any


def _compile_atoms(atoms: Sequence[Atom]) -> tuple[_CompiledAtom, ...]:
    compiled: list[_CompiledAtom] = []
    for family, relation, expr in atoms:
        code = compile(_python_source(expr), "<atom>", "eval")
        normaliser: tuple[int, ...] | None = None
        triangle_code = None
        if family == "convexity":
            v, j, _k = _signed_area_args(expr)
            normaliser = (v, j)
        elif family == "mec_enclosing":
            normaliser = (_var_index(expr[1][1][1][1]),)
        elif family in {"cap_membership", "cap_exclusion"}:
            _p, vj, vk = _signed_area_args(expr[1])
            normaliser = (vj, vk)
            triangle_code = compile(_python_source(expr[2]), "<atom>", "eval")
        compiled.append(_CompiledAtom(family, relation, code, normaliser, triangle_code))
    return tuple(compiled)


def _atom_margin(atom: _CompiledAtom, values: Mapping[str, float]) -> float:
    """Signed slack of one strict atom in comparable geometric units."""

    if atom.family in _EXACT_FAMILIES:
        return math.inf
    if atom.family == "mec_enclosing" and atom.normaliser is not None and atom.normaliser[0] < len(APEX_LABELS):
        return math.inf  # the three Moser vertices lie on the MEC by construction
    value = float(eval(atom.code, {"__builtins__": {}}, values))
    if atom.family == "mec_enclosing":
        return -value / values["rr"]
    if atom.family == "nonobtuse":
        return value
    if atom.family == "convexity":
        assert atom.normaliser is not None
        v, j = atom.normaliser
        edge = math.hypot(values[f"x_{j}"] - values[f"x_{v}"], values[f"y_{j}"] - values[f"y_{v}"])
        return value / max(edge, _EDGE_FLOOR)
    if atom.family in {"cap_membership", "cap_exclusion"}:
        assert atom.normaliser is not None
        vj, vk = atom.normaliser
        chord = math.hypot(values[f"x_{vk}"] - values[f"x_{vj}"], values[f"y_{vk}"] - values[f"y_{vj}"])
        triangle = abs(float(eval(atom.triangle_code, {"__builtins__": {}}, values)))
        signed = value / (chord * triangle)
        return -signed if atom.family == "cap_membership" else signed
    if atom.family in {"row_exactness", "bisector", "distinctness"}:
        return math.copysign(math.sqrt(abs(value)), value)
    raise DRQuotientError(f"no margin rule for family {atom.family}")


@dataclass
class _WitnessModel:
    """Float search model over the rational parametrisation."""

    b2_role: str
    cell_id: str
    groups: tuple[str, ...]
    a1: tuple[float, float]
    a2: tuple[float, float]
    a3: tuple[float, float]
    center: tuple[float, float]
    rr: float
    atoms_cache: dict[tuple[tuple[str, ...], ...], tuple[_CompiledAtom, ...]] = field(default_factory=dict)

    @property
    def radius_groups(self) -> tuple[str, ...]:
        return tuple(group for group in self.groups if group != "B1")

    def parameter_names(self) -> tuple[str, ...]:
        names = [f"radius:{group}" for group in self.radius_groups]
        names += ["c1:x", "c1:y", "radius:B1"]
        for group in self.groups:
            names += [f"angle:{label}" for label in GROUPS[group]]
        return tuple(names)

    def bounds(self) -> list[tuple[float, float]]:
        bounds = [(0.87, 0.99)] * len(self.radius_groups)
        bounds += [(0.05, 0.95), (0.005, 0.27), (0.3, 1.1)]
        bounds += [(-math.pi + 1e-3, math.pi - 1e-3)] * (4 * len(self.groups))
        return bounds

    def unpack(self, params: Sequence[float]) -> tuple[dict[str, float], tuple[float, float], float, dict[str, float]]:
        radii = dict(zip(self.radius_groups, params[: len(self.radius_groups)], strict=True))
        offset = len(self.radius_groups)
        c1 = (float(params[offset]), float(params[offset + 1]))
        radii["B1"] = float(params[offset + 2])
        offset += 3
        angles: dict[str, float] = {}
        for group in self.groups:
            for label in GROUPS[group]:
                angles[label] = float(params[offset])
                offset += 1
        return radii, c1, radii["B1"], angles

    def circle_center(self, group: str, c1: tuple[float, float]) -> tuple[float, float]:
        if group == "U":
            return self.a1
        if group == "B1":
            return c1
        return self.a2

    def points(self, params: Sequence[float]) -> dict[str, tuple[float, float]]:
        radii, c1, _rb, angles = self.unpack(params)
        points: dict[str, tuple[float, float]] = {"a1": self.a1, "a2": self.a2, "a3": self.a3, "c1": c1}
        for group in self.groups:
            center = self.circle_center(group, c1)
            for label in GROUPS[group]:
                points[label] = _circle_point(center, radii[group], math.tan(angles[label] / 2))  # type: ignore[arg-type]
        return points

    def placement(self) -> dict[str, str]:
        placement = {"c1": "Is"}
        for group in self.groups:
            placement.update(zip(GROUPS[group], WITNESS_NEEDS[group], strict=True))
        return placement

    def order(self, points: Mapping[str, tuple[float, float]]) -> dict[str, tuple[str, ...]]:
        placement = self.placement()

        def angle(label: str) -> float:
            px, py = points[label]
            return math.atan2(float(py) - self.center[1], float(px) - self.center[0])

        order: dict[str, tuple[str, ...]] = {}
        for cap in CAPS:
            base = angle(_CAP_START[cap])
            members = [label for label, where in placement.items() if where == cap]
            order[cap] = tuple(sorted(members, key=lambda label: (angle(label) - base) % (2 * math.pi)))
        return order

    def cell(self, order: Mapping[str, tuple[str, ...]]) -> QuotientCell:
        return QuotientCell(
            cell_id=self.cell_id,
            b2_role=self.b2_role,
            placement=self.placement(),
            interior_order={cap: tuple(order[cap]) for cap in CAPS},
            q_slot=0,
            w_slot=1,
            deleted="q",
        )

    def compiled(self, order: Mapping[str, tuple[str, ...]]) -> tuple[_CompiledAtom, ...]:
        key = tuple(tuple(order[cap]) for cap in CAPS)
        if key not in self.atoms_cache:
            self.atoms_cache[key] = _compile_atoms(build_atoms(self.cell(order), "none"))
        return self.atoms_cache[key]

    def values(self, points: Mapping[str, tuple[float, float]], order: Mapping[str, tuple[str, ...]]) -> dict[str, float]:
        values: dict[str, float] = {}
        for position, label in enumerate(carrier_labels(self.cell(order))):
            values[f"x_{position}"], values[f"y_{position}"] = points[label]
        values["ox"], values["oy"], values["rr"] = self.center[0], self.center[1], self.rr
        return values

    def worst(self, params: Sequence[float]) -> tuple[float, str]:
        """Smallest normalised margin over every strict atom and its family."""

        points = self.points(params)
        order = self.order(points)
        values = self.values(points, order)
        worst_score, worst_family = math.inf, "none"
        for atom in self.compiled(order):
            margin = _atom_margin(atom, values)
            if margin is math.inf:
                continue
            score = margin / MARGIN_TARGETS[atom.family]
            if score < worst_score:
                worst_score, worst_family = score, atom.family
        return worst_score, worst_family

    def objective(self, params: Sequence[float]) -> float:
        return -self.worst(params)[0]

    def initial_angles(self, radii: Mapping[str, float], c1: tuple[float, float], rng: Any = None) -> dict[str, float]:
        """Spread each group's points along the feasible arc of its needed cap.

        With ``rng`` the positions along each arc are random; otherwise they are
        evenly spaced.
        """

        angles: dict[str, float] = {}
        grid = [(-math.pi + 1e-3) + (2 * math.pi - 2e-3) * k / 1440 for k in range(1441)]
        for group in self.groups:
            center = self.circle_center(group, c1)
            radius = radii[group]
            feasible: dict[str, list[float]] = {cap: [] for cap in CAPS}
            for theta in grid:
                point = _circle_point(center, radius, math.tan(theta / 2))  # type: ignore[arg-type]
                inside = (point[0] - self.center[0]) ** 2 + (point[1] - self.center[1]) ** 2 <= self.rr * 0.995
                cap = _cap_of(point, self.a1, self.a2, self.a3)  # type: ignore[arg-type]
                if inside and cap is not None:
                    feasible[cap].append(theta)
            for cap in CAPS:
                labels = [label for label, need in zip(GROUPS[group], WITNESS_NEEDS[group], strict=True) if need == cap]
                if not labels:
                    continue
                arc = feasible[cap]
                if not arc:
                    for label in labels:
                        angles[label] = 0.0
                    continue
                # Choose the longest contiguous run of grid angles.
                runs: list[list[float]] = [[arc[0]]]
                for previous, theta in zip(arc, arc[1:], strict=False):
                    if theta - previous > 3 * (2 * math.pi / 1440):
                        runs.append([])
                    runs[-1].append(theta)
                run = max(runs, key=len)
                if rng is None:
                    positions = [(slot + 1) / (len(labels) + 1) for slot in range(len(labels))]
                else:
                    positions = sorted(float(v) for v in rng.uniform(0.1, 0.9, size=len(labels)))
                for label, position in zip(labels, positions, strict=True):
                    angles[label] = run[int(round(position * (len(run) - 1)))]
        return angles

    def pack(self, radii: Mapping[str, float], c1: tuple[float, float], angles: Mapping[str, float]) -> list[float]:
        params = [radii[group] for group in self.radius_groups]
        params += [c1[0], c1[1], radii["B1"]]
        for group in self.groups:
            params += [angles[label] for label in GROUPS[group]]
        return params

    def exact(self, params: Sequence[float]) -> tuple[QuotientCell, dict[str, Fraction]]:
        """Rationalise the parameters and rebuild every point exactly on its circle."""

        radii, c1, _rb, angles = self.unpack(params)
        exact_radii = {group: _fraction(radius, _RATIONAL_LIMIT) for group, radius in radii.items()}
        exact_c1: Point = (_fraction(c1[0], _RATIONAL_LIMIT), _fraction(c1[1], _RATIONAL_LIMIT))
        a2: Point = (Fraction(0), Fraction(0))
        a1: Point = (Fraction(1), Fraction(0))
        centers: dict[str, Point] = {"U": a1, "X": a2, "Y": a2, "Z": a2, "B1": exact_c1}
        points: dict[str, Point] = {"a1": a1, "a2": a2, "a3": WITNESS_APEX_A3, "c1": exact_c1}
        for group in self.groups:
            for label in GROUPS[group]:
                t = _fraction(math.tan(angles[label] / 2), _RATIONAL_LIMIT)
                points[label] = _circle_point(centers[group], exact_radii[group], t)
        order = self.order({label: (float(p[0]), float(p[1])) for label, p in points.items()})
        cell = self.cell(order)
        values: dict[str, Fraction] = {}
        for position, label in enumerate(validate_cell(cell)):
            values[f"x_{position}"], values[f"y_{position}"] = points[label]
        values["ox"], values["oy"], values["rr"] = WITNESS_MEC_CENTER[0], WITNESS_MEC_CENTER[1], WITNESS_MEC_RR
        return cell, values


def witness_model(b2_role: str = "X", cell_id: str = "witness") -> _WitnessModel:
    _fail(b2_role in B2_ROLES, "b2_role must be X, Y, or Z")
    groups = ("U", "X", "Y", "B1") + (("Z",) if b2_role == "Z" else ())
    return _WitnessModel(
        b2_role=b2_role,
        cell_id=cell_id,
        groups=groups,
        a1=(1.0, 0.0),
        a2=(0.0, 0.0),
        a3=(float(WITNESS_APEX_A3[0]), float(WITNESS_APEX_A3[1])),
        center=(float(WITNESS_MEC_CENTER[0]), float(WITNESS_MEC_CENTER[1])),
        rr=float(WITNESS_MEC_RR),
    )


def _solve_fixed_order(
    model: _WitnessModel,
    x0: Sequence[float],
    order: Mapping[str, tuple[str, ...]],
    *,
    iterations: int,
) -> tuple[list[float], float]:
    """Push every strict atom of the frozen cell to its target margin.

    Residuals r_i = max(0, 1 - margin_i/target_i) for every strict atom of
    the frozen cell are driven to zero by a bounded trust-region
    least-squares solve with finite-difference Jacobians.  Freezing the
    within-cap order makes the residuals a fixed family of piecewise-smooth
    functions of the parameters.
    """

    import numpy as np
    from scipy.optimize import least_squares

    strict = [atom for atom in model.compiled(order) if atom.family not in _EXACT_FAMILIES]
    targets = np.array([MARGIN_TARGETS[atom.family] for atom in strict])

    def margins(x: Sequence[float]) -> Any:
        points = model.points(x)
        values = model.values(points, order)
        return np.array([_atom_margin(atom, values) for atom in strict]) / targets

    def residuals(x: Sequence[float]) -> Any:
        return np.maximum(0.0, 1.0 - margins(x))

    lower, upper = (np.array(side, dtype=float) for side in zip(*model.bounds(), strict=True))
    x_start = np.clip(np.asarray(x0, dtype=float), lower + 1e-9, upper - 1e-9)
    result = least_squares(
        residuals, x_start, bounds=(lower, upper), method="trf", x_scale="jac",
        max_nfev=iterations, ftol=1e-12, xtol=1e-12, gtol=1e-12,
    )
    x = [float(v) for v in result.x]
    return x, float(margins(x).min())


def witness_search(
    *,
    b2_role: str = "X",
    seed: int = 0,
    trials: int = 40,
    cell_id: str = "witness",
    diagnostics: dict[str, Any] | None = None,
) -> tuple[QuotientCell, dict[str, Fraction], dict[str, Any]] | None:
    """Search for an exactly replayed rational configuration of the generic placement.

    The Moser triangle and MEC are fixed rationally; every class point is a
    rational point of its class circle, so every equality holds exactly by
    construction.  Each restart freezes the within-cap order read off the
    current float configuration, maximises the smallest normalised slack of
    the strict atoms by SLSQP, re-reads the order, and repeats until the
    order is stable.  The parameters are then rationalised and every atom is
    replayed with `Fraction` arithmetic by `replay_atoms`.  Only an exactly
    replayed configuration is returned, together with the cell it realizes.
    """

    import numpy as np

    model = witness_model(b2_role, cell_id)
    rng = np.random.default_rng(seed)
    history: list[dict[str, Any]] = [] if diagnostics is None else diagnostics.setdefault("restarts", [])

    def sliver_height(x_coordinate: float) -> float:
        """Height of the surplus-cap sliver above the chord a1 a2 at abscissa x."""

        inside = model.rr - (x_coordinate - model.center[0]) ** 2
        return model.center[1] + math.sqrt(inside) if inside > 0 else 0.0

    for restart in range(trials):
        if restart == 0:
            # Designed start: the parameters of the first exactly replayed witness
            # (q1a-wave-2, seed 0, restart 8), rounded.
            radii = {"U": 0.9645, "X": 0.982, "Y": 0.9638, "Z": 0.905, "B1": 0.841}
            c1 = (0.1335, 0.0103)
            fractions = None
        else:
            radii = {group: float(rng.uniform(0.89, 0.98)) for group in ("U", "X", "Y", "Z")}
            while abs(radii["X"] - radii["Y"]) < 0.015 or abs(radii["X"] - radii["Z"]) < 0.015 or abs(radii["Y"] - radii["Z"]) < 0.015:
                radii["Y"], radii["Z"] = float(rng.uniform(0.89, 0.98)), float(rng.uniform(0.89, 0.98))
            radii["B1"] = float(rng.uniform(0.5, 1.0))
            cx = float(rng.uniform(0.1, 0.9))
            c1 = (cx, float(rng.uniform(0.2, 0.9)) * sliver_height(cx))
            fractions = rng
        x = model.pack(radii, c1, model.initial_angles(radii, c1, fractions))
        order = model.order(model.points(x))
        rounds: list[dict[str, Any]] = []
        score = -math.inf
        for _round in range(10):
            x, score = _solve_fixed_order(model, x, order, iterations=3000)
            reread = model.order(model.points(x))
            rounds.append({"frozen_score": score, "order_changed": reread != order})
            if reread == order:
                break
            order = reread
        score, family = model.worst(x)
        record: dict[str, Any] = {
            "restart": restart,
            "min_normalised_margin": score,
            "worst_family": family,
            "rounds": rounds,
        }
        if score > 0:
            cell, values = model.exact(x)
            accepted, evidence = replay_atoms(cell, "none", values)
            record["exact_replay"] = accepted if accepted else evidence
            history.append(record)
            if accepted:
                return cell, values, {
                    "restart": restart,
                    "min_normalised_margin": score,
                    "worst_family": family,
                    "restarts": list(history),
                    "checks": evidence["checks"],
                }
            continue
        history.append(record)
    return None


def witness_payload(cell: QuotientCell, values: Mapping[str, Fraction], evidence: Mapping[str, Any]) -> dict[str, Any]:
    labels = carrier_labels(cell)
    return {
        "schema": "p97-dr-two-radius-quotient-exact-witness/v1",
        "target_theorem": TARGET_THEOREM,
        "semantic_status": SEMANTIC_STATUS,
        "promotion_eligible": PROMOTION_ELIGIBLE,
        "cell": cell.payload(),
        "coordinates": {label: {"x": str(values[f"x_{i}"]), "y": str(values[f"y_{i}"])} for i, label in enumerate(labels)},
        "mec_center": {"x": str(values["ox"]), "y": str(values["oy"])},
        "mec_squared_radius": str(values["rr"]),
        "replay": {"all_asserted_atoms_replayed": True, "checks": dict(evidence["checks"])},
        "search": {k: v for k, v in evidence.items() if k != "checks"},
        "omitted_fact_readback": omitted_fact_readback(cell, values),
        "claims": dict(FALSE_CLAIMS),
    }


# --------------------------------------------------------------------------
# PIQD stage
# --------------------------------------------------------------------------


@dataclass(frozen=True)
class PreparedStage:
    cell: QuotientCell
    control: str
    source_record: dict[str, Any]
    source_record_bytes: bytes
    query: neutral.SourceSemanticQuery


def _read(path: Path) -> bytes:
    with open(path, "rb") as handle:
        return handle.read()


def prepare_stage(cell: QuotientCell, control: str, *, timeout_ms: int) -> PreparedStage:
    _fail(type(timeout_ms) is int and 1 <= timeout_ms <= 3_600_000, "timeout_ms must be in 1..3600000")
    commands, counts = build_journal(cell, control)
    journal = b"".join(command.encode() + b"\n" for command in commands)
    implementations = [
        ("quotient_encoder", Path(__file__).resolve()),
        ("generic_adapter", Path(neutral.__file__).resolve()),
        ("readback_helper", Path(endpoint_piqd.__file__).resolve()),
    ]
    implementation_sources = [(role, path, _read(path)) for role, path in implementations]
    cell_bytes = _canonical(cell.payload()) + b"\n"
    source_record = {
        "schema": SOURCE_SCHEMA,
        "target_theorem": TARGET_THEOREM,
        "lane_id": LANE_ID,
        "semantic_status": SEMANTIC_STATUS,
        "promotion_eligible": PROMOTION_ELIGIBLE,
        "cell": cell.payload(),
        "cell_sha256": _sha(cell_bytes),
        "control": control,
        "carrier_labels": list(carrier_labels(cell)),
        "cyclic_order": list(cyclic_order(cell)),
        "constraint_counts": counts,
        "normalization": {
            "schema": NORMALIZATION_SCHEMA,
            "encoding": "utf-8",
            "line_endings": "LF",
            "state_commands_only": True,
            "journal_sha256": _sha(journal),
        },
        "implementation_sources": [
            {"role": role, "path": os.path.relpath(path, REPOSITORY_ROOT), "bytes": len(payload), "sha256": _sha(payload)}
            for role, path, payload in implementation_sources
        ],
        "solver_profile": {
            "schema": PROFILE_SCHEMA,
            "solver": "z3",
            "lane": "smt",
            "logic": "QF_NRA",
            "fresh_session": True,
            "solve_count": 1,
            "workers": 1,
            "timeout_ms": timeout_ms,
            "local_fallback": False,
        },
        "source_clause_ledger": list(SOURCE_CLAUSE_LEDGER),
        "omitted_facts": list(OMITTED_FACTS),
        "claims": dict(FALSE_CLAIMS),
    }
    source_record_bytes = _canonical(source_record) + b"\n"
    snapshots = [
        neutral.SourceSnapshot("0000-source-record.json", source_record_bytes),
        neutral.SourceSnapshot("0001-cell.json", cell_bytes),
    ]
    snapshots.extend(
        neutral.SourceSnapshot(f"implementation-{index:04d}-{role}.py", payload)
        for index, (role, _path, payload) in enumerate(implementation_sources)
    )
    snapshots.sort(key=lambda item: item.path)
    semantic = {
        "cell": cell.payload(),
        "control": control,
        "constraint_counts": counts,
        "normalization_sha256": _sha(journal),
        "source_record_sha256": _sha(source_record_bytes),
    }
    variables = [
        {"id": f"{position:03d}-{term}", "term": term, "sort": "Real"}
        for position, term in enumerate(variable_terms(cell, control))
    ]
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "p97-dr-two-radius-quotient-metric", "version": "v1"},
        "semantic_verifier": {"id": "exact-rational-every-asserted-atom-replay", "version": "v1"},
        "stage_id": f"{control}",
        "query_id": f"{cell.cell_id}-{control}",
        "sources": [{"path": item.path, "bytes": len(item.payload), "sha256": _sha(item.payload)} for item in snapshots],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {"path": "original.smt2", "bytes": len(journal), "sha256": _sha(journal)},
        "variables": variables,
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [item["id"] for item in variables],
            "include_model": True,
        },
        "solver_profile": {"schema": PROFILE_SCHEMA, "solvers": ["z3"], "timeout_ms": timeout_ms},
    }
    descriptor_bytes = _canonical(descriptor) + b"\n"
    query = neutral.SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=descriptor_bytes,
        original_smt2=journal,
        journal_commands=commands,
        journal_smt2=journal,
        source_files=tuple(snapshots),
    )
    try:
        query = neutral.validate_authenticated_single_solver_query(
            query,
            solver="z3",
            descriptor_schema=DESCRIPTOR_SCHEMA,
            solver_profile_schema=PROFILE_SCHEMA,
            authenticated_journal_commands=commands,
        )
    except neutral.SmtSourceAdapterError as exc:
        raise DRQuotientError("quotient source-semantic query failed authentication") from exc
    return PreparedStage(cell, control, source_record, source_record_bytes, query)


def _algebraic_model(semantic_replay: object) -> bool:
    """True when Z3 answered SAT with a non-rational (root-obj) model.

    The exact replay cannot read such a model, so the verdict stays a bare
    solver SAT: published as a diagnostic, never as a verified witness.
    """

    return (
        type(semantic_replay) is dict
        and semantic_replay.get("accepted") is False
        and type(semantic_replay.get("evidence")) is dict
        and semantic_replay["evidence"].get("reason") == "non-rational-readback"
    )


def _classification(raw_status: object, effective_status: object, semantic_replay: object = None) -> str:
    if raw_status == "SAT" and effective_status == "SAT_SEMANTICALLY_REPLAYED":
        return "SAT_EXACT_RATIONAL_REPLAYED_DIAGNOSTIC"
    if raw_status == "SAT" and _algebraic_model(semantic_replay):
        return "Z3_SAT_ALGEBRAIC_MODEL_NOT_RATIONALLY_REPLAYED_DIAGNOSTIC"
    if raw_status == "UNSAT":
        return "Z3_UNSAT_QUOTIENT_SCOPE_DIAGNOSTIC_NOT_CERTIFIED"
    if raw_status == "UNKNOWN":
        return "UNKNOWN_INCONCLUSIVE"
    return "INCONCLUSIVE_NO_VERDICT"


def _compact_result(prepared: PreparedStage, engine: Mapping[str, object], output_directory: Path) -> dict[str, Any]:
    raw_status = engine.get("raw_status")
    effective_status = engine.get("effective_status")
    semantic_replay = engine.get("semantic_replay")
    replayed = (
        effective_status == "SAT_SEMANTICALLY_REPLAYED"
        and type(semantic_replay) is dict
        and semantic_replay.get("accepted") is True
    )
    if raw_status == "SAT" and not replayed and not _algebraic_model(semantic_replay):
        raise DRQuotientError("PIQD SAT did not pass exact-rational semantic replay")
    _fail(raw_status in {"SAT", "UNSAT", "UNKNOWN", None}, "PIQD returned an invalid raw status")
    status = raw_status if raw_status in {"SAT", "UNSAT", "UNKNOWN"} else "UNKNOWN"
    return {
        "schema": RESULT_SCHEMA,
        "target_theorem": TARGET_THEOREM,
        "lane_id": LANE_ID,
        "semantic_status": SEMANTIC_STATUS,
        "promotion_eligible": PROMOTION_ELIGIBLE,
        "cell_id": prepared.cell.cell_id,
        "control": prepared.control,
        "scope": "named-role quotient; one fixed discrete cell; no carrier completeness",
        "status": status,
        "effective_status": effective_status,
        "classification": _classification(raw_status, effective_status, semantic_replay),
        "route": "piqd-z3-qfnra-one-shot",
        "workers": 1,
        "local_fallback": False,
        "constraint_counts": prepared.source_record["constraint_counts"],
        "source_record_sha256": _sha(prepared.source_record_bytes),
        "descriptor_sha256": _sha(prepared.query.descriptor_bytes),
        "journal_sha256": _sha(prepared.query.journal_smt2),
        "solver_evidence": {
            key: engine.get(key)
            for key in (
                "solver", "session_id", "solver_signature", "solver_sha256", "solve_index",
                "result_sha256", "response_lost", "reconciled_from_receipt", "result_digest_advisory",
            )
        },
        "semantic_replay": semantic_replay,
        "output_custody": {"publication": "atomic-directory-rename-no-replace", "create_once": True, "directory": output_directory.name},
        "claims": dict(FALSE_CLAIMS),
    }


def run_stage(
    cell: QuotientCell,
    control: str,
    *,
    timeout_s: float,
    transport: neutral.PiqdTransport,
    output_directory: Path,
) -> dict[str, Any]:
    """Run exactly one authenticated Z3 solve and publish create-once custody."""

    _fail(output_directory.is_absolute(), "output_directory must be absolute")
    _fail(
        type(timeout_s) in {int, float} and type(timeout_s) is not bool and math.isfinite(timeout_s) and 0 < timeout_s <= 3_600,
        "timeout_s must be in (0, 3600]",
    )
    prepared = prepare_stage(cell, control, timeout_ms=max(1, int(timeout_s * 1000)))
    try:
        with neutral.SmtOutputTransaction(output_directory) as custody:
            custody.write_bytes("source-record.json", prepared.source_record_bytes)
            custody.write_bytes("descriptor.json", prepared.query.descriptor_bytes)
            custody.write_bytes("original.smt2", prepared.query.original_smt2)
            custody.write_bytes("journal.smt2", prepared.query.journal_smt2)
            for index, snapshot in enumerate(prepared.query.source_files):
                custody.write_bytes(f"source-{index:04d}-{snapshot.path}", snapshot.payload)
            engine = neutral.run_authenticated_single_solver_query(
                prepared.query,
                solver="z3",
                descriptor_schema=DESCRIPTOR_SCHEMA,
                solver_profile_schema=PROFILE_SCHEMA,
                authenticated_journal_commands=prepared.query.journal_commands,
                transport=transport,
                semantic_verifier=verify_sat_model,
                output_fd=custody.file_descriptor,
                used_session_ids=set(),
            )
            result = _compact_result(prepared, engine, output_directory)
            custody.write_bytes("result.json", _canonical(result) + b"\n")
            custody.publish()
            return result
    except DRQuotientError:
        raise
    except (OSError, neutral.SmtSourceAdapterError) as exc:
        raise DRQuotientError("authenticated quotient PIQD stage failed closed") from exc


# --------------------------------------------------------------------------
# Run root and manifest (worktree-run-manifest/v1)
# --------------------------------------------------------------------------


def _git_head() -> str:
    completed = subprocess.run(
        ["git", "rev-parse", "HEAD"], cwd=REPOSITORY_ROOT, capture_output=True, text=True, check=True
    )
    return completed.stdout.strip()


def _load_checkpoint() -> dict[str, Any]:
    path = REPOSITORY_ROOT / ".codex" / "worktree-checkpoints" / f"{LANE_ID}.json"
    value = json.loads(_read(path))
    _fail(value.get("schema") == "worktree-lane-checkpoint/v1" and value.get("lane_id") == LANE_ID, "lane checkpoint mismatch")
    return value


def _manifest_self_hash(value: Mapping[str, Any]) -> str:
    unsigned = {key: item for key, item in value.items() if key != "manifest_sha256"}
    return _sha(_canonical(unsigned))


def ensure_run_root(run_id: str, *, cell_files: Sequence[Path]) -> Path:
    """Create scratch/runs/<lane>/<run_id>/ with a hygiene-conformant manifest."""

    _fail(run_id.replace("-", "").replace("_", "").isalnum(), "run_id must be alphanumeric with dashes")
    checkpoint = _load_checkpoint()
    root = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / run_id
    manifest_path = root / "run_manifest.json"
    if manifest_path.exists():
        return root
    for name in ("artifacts", "events", "tmp"):
        (root / name).mkdir(parents=True, exist_ok=True)
    sources = [
        Path(__file__).resolve(),
        Path(neutral.__file__).resolve(),
        Path(endpoint_piqd.__file__).resolve(),
    ]
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": run_id,
        "root": f"scratch/runs/{LANE_ID}/{run_id}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "created_utc": datetime.now(timezone.utc).replace(microsecond=0).isoformat().replace("+00:00", "Z"),
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": {os.path.relpath(path, REPOSITORY_ROOT): _sha(_read(path)) for path in sources},
        "input_digests": {os.path.relpath(path, REPOSITORY_ROOT): _sha(_read(path)) for path in cell_files},
    }
    manifest["manifest_sha256"] = _manifest_self_hash(manifest)
    manifest_path.write_bytes(_canonical(manifest) + b"\n")
    return root


# --------------------------------------------------------------------------
# CLI
# --------------------------------------------------------------------------


def _parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)
    journal = sub.add_parser("journal", help="print the SMT-LIB journal and atom counts; no solver")
    journal.add_argument("--cell", default="generic-x")
    journal.add_argument("--cell-file", type=Path)
    journal.add_argument("--control", choices=CONTROLS, default="none")
    run = sub.add_parser("run", help="run one cell through PIQD/Z3 and publish custody")
    run.add_argument("--run-id", required=True)
    run.add_argument("--cell", default="generic-x")
    run.add_argument("--cell-file", type=Path)
    run.add_argument("--control", choices=CONTROLS, default="none")
    run.add_argument("--timeout", type=float, default=600.0)
    run.add_argument("--server", default=DEFAULT_SERVER)
    witness = sub.add_parser("witness", help="constructive exact-rational witness search; no solver")
    witness.add_argument("--run-id", required=True)
    witness.add_argument("--b2-role", choices=B2_ROLES, default="X")
    witness.add_argument("--seed", type=int, default=0)
    witness.add_argument("--trials", type=int, default=2000)
    witness.add_argument("--cell-id", default="witness-x")
    return parser.parse_args(argv)


def _resolve_cell(arguments: argparse.Namespace) -> QuotientCell:
    if arguments.cell_file is not None:
        return cell_from_payload(json.loads(_read(arguments.cell_file)))
    if arguments.cell in {"generic-x", "generic-y", "generic-z"}:
        return generic_cell(arguments.cell, arguments.cell[-1].upper())
    raise DRQuotientError("unknown named cell; pass --cell-file")


def main(argv: list[str] | None = None) -> int:
    arguments = _parse_args(argv)
    if arguments.command == "witness":
        diagnostics: dict[str, Any] = {}
        found = witness_search(
            b2_role=arguments.b2_role, seed=arguments.seed, trials=arguments.trials, cell_id=arguments.cell_id, diagnostics=diagnostics
        )
        if found is None:
            best = max((r["min_normalised_margin"] for r in diagnostics.get("restarts", [])), default=None)
            sys.stdout.write(json.dumps({"witness": None, "seed": arguments.seed, "trials": arguments.trials, "best_min_normalised_margin": best}, sort_keys=True) + "\n")
            return 1
        cell, values, evidence = found
        root = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / arguments.run_id
        cells_dir = root / "artifacts" / "cells"
        cells_dir.mkdir(parents=True, exist_ok=True)
        cell_path = cells_dir / f"{cell.cell_id}.json"
        cell_path.write_bytes(_canonical(cell.payload()) + b"\n")
        ensure_run_root(arguments.run_id, cell_files=[cell_path])
        witness_path = root / "artifacts" / f"{cell.cell_id}-exact-witness.json"
        payload = witness_payload(cell, values, evidence)
        witness_path.write_bytes(_canonical(payload) + b"\n")
        sys.stdout.write(json.dumps({"witness": str(witness_path), "cell": str(cell_path), "restart": evidence["restart"], "min_normalised_margin": evidence["min_normalised_margin"], "omitted": {k: v.get("holds") for k, v in payload["omitted_fact_readback"].items() if "holds" in v}}, sort_keys=True) + "\n")
        return 0
    cell = _resolve_cell(arguments)
    if arguments.command == "journal":
        commands, counts = build_journal(cell, arguments.control)
        sys.stdout.write("\n".join(commands) + "\n")
        sys.stdout.write(json.dumps({"constraint_counts": counts, "cyclic_order": list(cyclic_order(cell))}, sort_keys=True) + "\n")
        return 0
    stem = f"{cell.cell_id}-{arguments.control}"
    root = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / arguments.run_id
    cells_dir = root / "artifacts" / "cells"
    cells_dir.mkdir(parents=True, exist_ok=True)
    cell_path = cells_dir / f"{cell.cell_id}.json"
    payload = _canonical(cell.payload()) + b"\n"
    if cell_path.exists():
        _fail(_read(cell_path) == payload, "existing cell file differs from the requested cell")
    else:
        cell_path.write_bytes(payload)
    ensure_run_root(arguments.run_id, cell_files=[cell_path])
    transport = neutral.UrllibPiqdTransport(arguments.server, http_timeout_s=max(1.0, arguments.timeout + 60.0))
    result = run_stage(
        cell,
        arguments.control,
        timeout_s=arguments.timeout,
        transport=transport,
        output_directory=root / "artifacts" / stem,
    )
    sys.stdout.write(json.dumps({"status": result["status"], "classification": result["classification"], "cell_id": result["cell_id"], "control": result["control"], "artifacts": str(root / "artifacts" / stem)}, sort_keys=True) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
