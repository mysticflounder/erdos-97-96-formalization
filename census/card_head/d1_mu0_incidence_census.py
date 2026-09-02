"""Stage 1 incidence census of the TriApex leaf at carrier size 15 (mu = 0 cell).

Named-role quotient at ``card = 15``: three apices plus three caps of four
ordered interior slots.  Every hard clause block carries a cut-admission
record that names the Lean theorem or definition it images (PROVEN), or
declares itself DERIVED (a composition of proven facts not compiled in Lean)
or a cell selector (ASSUMPTION_CONTROL).  The encoding is an incidence
abstraction: it has no metric content, so every SAT verdict is an
UNRESOLVED_ABSTRACT_MODEL and every UNSAT verdict is scoped to the encoded
clause set at ``card = 15``.  Nothing here closes a Lean obligation.

Every solver call goes through the piqd daemon: the base formula of each cell
is a raw-DIMACS job (``POST /jobs/prepare-cnf``; proof capture on UNSAT is
automatic), and the targeted queries and the blocking-clause enumeration run
in a piqd SAT session seeded from that job (``POST /sessions``,
``/sessions/:id/solve`` with assumptions, ``/sessions/:id/clauses``).

Label convention.  Apex ``k`` (``k = 0, 1, 2``) is the Moser vertex opposite
cap ``k`` (``SurplusCapPacket.oppositeVertexByIndex``).  Cap ``k``'s closed
cap ``capByIndex k`` is its four interior slots plus the two chord apices
``(k+1) % 3`` and ``(k+2) % 3``; in the oriented complete cap order of cap
``k`` slot ``0`` is apex ``(k+1) % 3``, slots ``1..4`` are the interior, and
slot ``5`` is apex ``(k+2) % 3`` (this is the orientation in which every cap
runs counterclockwise, one of the two orientations
``exists_orderedCap_six_of_card_eq_fifteen`` allows).  Apex ``0`` is the first
apex ``S.oppApex1`` and cap ``0`` is the first opposite cap ``S.oppIndex1``.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
import time
import urllib.error
import urllib.request
import uuid
from collections.abc import Iterable, Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from itertools import combinations
from pathlib import Path
from typing import Any

SCHEMA = "p97_d1_mu0_incidence_census.v1"
SEMANTIC_STATUS = "discovery_incidence_abstraction_card15_only"
PROMOTION_ELIGIBLE = False
LANE_ID = "d1-triapex-plan-20260901"
LANE_BASE_HEAD = "9a222da97112efc204a038ca2f71ff5a12078f94"
LANE_OWNER = "claude-fable-d1-triapex"
DEFAULT_SERVER = "http://127.0.0.1:7272"
SESSION_SOLVER = "piqd-satworker-cadical-3.0.1"
PROJECT_LABEL = "d1-mu0-incidence-census"

N_LABELS = 15
APEX_LABELS = (0, 1, 2)
ARMS = ("1R", "2R")
# Slice partitions of the four interior slots in the twoRadii arm; slice 0
# always contains slot 1 (``twoRichClassSlices_partition_of_capInterior_card_eq_four``).
PARTITIONS: tuple[tuple[tuple[int, int], tuple[int, int]], ...] = (
    ((1, 2), (3, 4)),
    ((1, 3), (2, 4)),
    ((1, 4), (2, 3)),
)
PROJECTIONS = ("full", "capi", "centres")


class D1Mu0CensusError(ValueError):
    """The cell, the encoding, a decoded model, or a piqd reply broke its contract."""


# --------------------------------------------------------------------------
# Label geometry
# --------------------------------------------------------------------------


def interior(k: int) -> tuple[int, ...]:
    """The four interior labels of cap ``k`` in slot order 1..4."""

    if k not in (0, 1, 2):
        raise D1Mu0CensusError("cap index must be 0, 1, or 2")
    return tuple(3 + 4 * k + s for s in range(4))


def interior_label(k: int, slot: int) -> int:
    if slot not in (1, 2, 3, 4):
        raise D1Mu0CensusError("interior slot must be 1..4")
    return interior(k)[slot - 1]


def is_apex(label: int) -> bool:
    return label in APEX_LABELS


def cap_of_interior(label: int) -> int:
    if is_apex(label) or not 0 <= label < N_LABELS:
        raise D1Mu0CensusError("label is not an interior label")
    return (label - 3) // 4


def cap_by_index(k: int) -> tuple[int, ...]:
    """Closed cap: interior slots plus the two chord apices."""

    return interior(k) + ((k + 1) % 3, (k + 2) % 3)


def slot_of(k: int, label: int) -> int | None:
    """Slot of ``label`` in the oriented complete cap order of cap ``k``."""

    if label == (k + 1) % 3:
        return 0
    if label == (k + 2) % 3:
        return 5
    if label in interior(k):
        return label - 3 - 4 * k + 1
    return None


def adjacent_pick_domain(k: int, side: int) -> tuple[int, ...]:
    """Labels of the closed adjacent cap of apex ``k`` minus apex ``k`` itself.

    ``side = 0`` is ``leftAdjacentCapByIndex k = capByIndex (k+1)``,
    ``side = 1`` is ``rightAdjacentCapByIndex k = capByIndex (k+2)``.
    """

    if side not in (0, 1):
        raise D1Mu0CensusError("side must be 0 or 1")
    m = (k + 1 + side) % 3
    return tuple(label for label in cap_by_index(m) if label != k)


def label_name(label: int) -> str:
    if is_apex(label):
        return f"A{label}"
    k = cap_of_interior(label)
    return f"P{k}.{slot_of(k, label)}"


def slice_labels(k: int, partition: int, t: int) -> tuple[int, ...]:
    return tuple(interior_label(k, s) for s in PARTITIONS[partition][t])


def sigma_label(label: int) -> int:
    """The reflection fixing apex 0: swaps apices 1, 2, caps 1, 2, reverses slots."""

    if is_apex(label):
        return (0, 2, 1)[label]
    k = cap_of_interior(label)
    return interior_label((0, 2, 1)[k], 5 - slot_of(k, label))


# --------------------------------------------------------------------------
# Cells
# --------------------------------------------------------------------------


@dataclass(frozen=True)
class Cell:
    """One arm combination with a pair index, over 12 or 15 modelled points."""

    pair_index: int
    arms: tuple[str, str, str]
    apex_shells: bool = False

    def __post_init__(self) -> None:
        if self.pair_index not in (0, 1, 2):
            raise D1Mu0CensusError("pair index must be 0, 1, or 2")
        if len(self.arms) != 3 or any(arm not in ARMS for arm in self.arms):
            raise D1Mu0CensusError("arms must be three of 1R/2R")

    @property
    def name(self) -> str:
        return (
            f"i{self.pair_index}-{''.join(self.arms)}-"
            f"{'ax15' if self.apex_shells else 'in12'}"
        )

    @property
    def is_target(self) -> bool:
        return self.arms[self.pair_index] == "1R"

    @property
    def points(self) -> tuple[int, ...]:
        labels = interior(0) + interior(1) + interior(2)
        if self.apex_shells:
            return APEX_LABELS + labels
        return labels

    @property
    def sigma_fixed(self) -> bool:
        """Whether the reflection sigma is an automorphism of this cell."""

        return self.pair_index == 0 and self.arms[1] == self.arms[2]

    def classes(self) -> tuple[tuple[int, int], ...]:
        """The apex class objects ``(apex, t)`` this cell models."""

        result: list[tuple[int, int]] = []
        for k in range(3):
            result.extend((k, t) for t in range(1 if self.arms[k] == "1R" else 2))
        return tuple(result)


def parse_cell(name: str) -> Cell:
    parts = name.split("-")
    if len(parts) != 3 or not parts[0].startswith("i") or len(parts[1]) != 6:
        raise D1Mu0CensusError(f"bad cell name {name!r}")
    arms = (parts[1][0:2], parts[1][2:4], parts[1][4:6])
    if parts[2] not in ("in12", "ax15"):
        raise D1Mu0CensusError(f"bad cell name {name!r}")
    return Cell(int(parts[0][1:]), arms, parts[2] == "ax15")


def all_cells(apex_shells: bool, pair_indices: Iterable[int] = (0, 1)) -> tuple[Cell, ...]:
    """Cells modulo the reflection: pair index 2 is the sigma-image of index 1."""

    cells: list[Cell] = []
    for i in pair_indices:
        for a0 in ARMS:
            for a1 in ARMS:
                for a2 in ARMS:
                    cells.append(Cell(i, (a0, a1, a2), apex_shells))
    return tuple(cells)


# --------------------------------------------------------------------------
# CNF builder with cut-admission records
# --------------------------------------------------------------------------


@dataclass
class Block:
    block_id: str
    clause_class: str
    admission: str
    lean_sources: tuple[str, ...]
    antecedent: str
    clauses: int = 0


class Cnf:
    def __init__(self) -> None:
        self.nvars = 0
        self.clauses: list[tuple[int, ...]] = []
        self.var: dict[tuple[Any, ...], int] = {}
        self.name_of: dict[int, tuple[Any, ...]] = {}
        self.blocks: list[Block] = []
        self._current: Block | None = None

    def new_var(self, key: tuple[Any, ...]) -> int:
        if key in self.var:
            raise D1Mu0CensusError(f"duplicate variable {key!r}")
        self.nvars += 1
        self.var[key] = self.nvars
        self.name_of[self.nvars] = key
        return self.nvars

    def aux(self, tag: str) -> int:
        return self.new_var(("aux", tag, self.nvars + 1))

    def begin(
        self,
        block_id: str,
        clause_class: str,
        admission: str,
        lean_sources: Sequence[str],
        antecedent: str,
    ) -> None:
        if clause_class not in (
            "ROOT_STATIC",
            "ASSUMPTION_CONTROL",
            "ENUMERATION_CONTROL",
        ):
            raise D1Mu0CensusError("unknown clause class")
        if admission not in ("PROVEN", "DERIVED", "IMPLIED", "RELAXATION", "SELECTOR"):
            raise D1Mu0CensusError("unknown admission label")
        self._current = Block(
            block_id, clause_class, admission, tuple(lean_sources), antecedent
        )
        self.blocks.append(self._current)

    def add(self, clause: Iterable[int]) -> None:
        lits = tuple(clause)
        if not lits or any(lit == 0 or abs(lit) > self.nvars for lit in lits):
            raise D1Mu0CensusError("malformed clause")
        if self._current is None:
            raise D1Mu0CensusError("clause added outside a block")
        self.clauses.append(lits)
        self._current.clauses += 1

    def exactly_one(self, lits: Sequence[int]) -> None:
        self.add(lits)
        for a, b in combinations(lits, 2):
            self.add((-a, -b))

    def at_most(self, lits: Sequence[int], bound: int, condition: Sequence[int] = ()) -> None:
        """Sinz sequential counter ``sum(lits) <= bound`` under ``condition``.

        Every clause carries the negation of each condition literal, so the
        bound is active only when all condition literals are true.
        """

        guard = tuple(-lit for lit in condition)
        n = len(lits)
        if bound < 0:
            raise D1Mu0CensusError("bound must be nonnegative")
        if bound >= n:
            return
        if bound == 0:
            for lit in lits:
                self.add(guard + (-lit,))
            return
        regs = [[self.aux("amo") for _ in range(bound)] for _ in range(n - 1)]
        self.add(guard + (-lits[0], regs[0][0]))
        for j in range(1, bound):
            self.add(guard + (-regs[0][j],))
        for i in range(1, n - 1):
            self.add(guard + (-lits[i], regs[i][0]))
            self.add(guard + (-regs[i - 1][0], regs[i][0]))
            for j in range(1, bound):
                self.add(guard + (-lits[i], -regs[i - 1][j - 1], regs[i][j]))
                self.add(guard + (-regs[i - 1][j], regs[i][j]))
            self.add(guard + (-lits[i], -regs[i - 1][bound - 1]))
        self.add(guard + (-lits[n - 1], -regs[n - 2][bound - 1]))

    def counter(self, lits: Sequence[int], tag: str) -> list[int]:
        """Bidirectional unary counter: ``regs[j-1]`` holds iff at least ``j`` literals hold."""

        n = len(lits)
        prev: list[int | None] = [None] * (n + 1)  # prev[j] for j >= 1; None = false
        for i, x in enumerate(lits, start=1):
            cur: list[int | None] = [None] * (n + 1)
            for j in range(1, i + 1):
                r = self.aux(f"cnt-{tag}")
                cur[j] = r
                below = prev[j]
                diag = prev[j - 1] if j > 1 else None
                # forward: prev[j] -> r ; x & prev[j-1] -> r
                if below is not None:
                    self.add((-below, r))
                if j == 1:
                    self.add((-x, r))
                elif diag is not None:
                    self.add((-x, -diag, r))
                # backward: r -> prev[j] | x ; r -> prev[j] | prev[j-1]
                if j == 1:
                    if below is None:
                        self.add((-r, x))
                    else:
                        self.add((-r, below, x))
                else:
                    if below is None and diag is None:
                        self.add((-r,))
                    elif below is None:
                        self.add((-r, x))
                        self.add((-r, diag))
                    elif diag is None:
                        self.add((-r, below))
                    else:
                        self.add((-r, below, x))
                        self.add((-r, below, diag))
            prev = cur
        return [prev[j] for j in range(1, n + 1)]  # type: ignore[misc]

    def dimacs(self) -> bytes:
        lines = [f"p cnf {self.nvars} {len(self.clauses)}"]
        lines.extend(" ".join(str(lit) for lit in clause) + " 0" for clause in self.clauses)
        return ("\n".join(lines) + "\n").encode("ascii")


# --------------------------------------------------------------------------
# Encoding
# --------------------------------------------------------------------------


@dataclass
class Encoding:
    cell: Cell
    cnf: Cnf
    used_regs: list[int]
    omitted_binders: tuple[str, ...]

    def v(self, *key: Any) -> int:
        try:
            return self.cnf.var[key]
        except KeyError as exc:
            raise D1Mu0CensusError(f"unknown variable {key!r}") from exc

    def has(self, *key: Any) -> bool:
        return key in self.cnf.var


CLOSURE_LEAN_SOURCES = (
            "Problem97.dist_eq_dist_of_mutual_bisector",
            "Problem97.mem_selectedClass",
            "CriticalFourShell.support_eq",
            "CriticalFourShell.support_eq_radius",
        )

OMITTED_BINDERS = (
    "R.minimal (D.Minimal) beyond the critical shell system H it induces",
    "R.noM44 and the CriticalPairFrontier packet F except F.radius_pos",
    "P : RetainedInteriorDirectedOmission fields not normalized into O",
    (
        "O.packet / J.keptPacket / J.deletedPacket U5QDeletedK4Class row internals "
        "(only survival, blocker distinctness, and overlap <= 2 are imaged; overlap "
        "<= 2 is the two-circle bound)"
    ),
    (
        "K : SelectedFourClass at oppApex1 of L6 as an explicit four-row (only "
        "z, w, source in the same apex-0 class is imaged)"
    ),
    (
        "G.notRobustCover_card (card <= 4 * |notRobustCenters|): implied when 15 "
        "points are modelled (fibres <= 4 give >= 4 centres); not imaged in the "
        "12-point model"
    ),
    (
        "IsUniqueFourCenter beyond the centre domain (other radius classes at an "
        "interior centre are not modelled)"
    ),
    (
        "CriticalFourShell.support_eq exactness for distance pairs outside the "
        "modelled shells and apex classes (no same-distance relation is modelled)"
    ),
    (
        "D.convex and the cap order beyond CGN.index_strictly_between_of_equidistant "
        "and outsidePair_unique_capCenter (no metric or cyclic-order content)"
    ),
    (
        "J.sourceRadius versus radius: the source is allowed in any apex-0 class of "
        "card >= 4 (the leaf does not record sourceRadius = radius)"
    ),
    (
        "shell constraints of a role point (source, z, w) that lands on an apex "
        "label when apex shells are not modelled (12-point model only)"
    ),
)


def build(cell: Cell, equilateral: bool = False) -> Encoding:
    cnf = Cnf()
    points = cell.points
    labels = tuple(range(N_LABELS))

    # -- variables -----------------------------------------------------------
    for x in points:
        for label in labels:
            cnf.new_var(("c", x, label))
    for x in points:
        for label in labels:
            cnf.new_var(("s", x, label))
    for x in points:
        for k in range(3):
            cnf.new_var(("cin", x, k))
    for x, y in combinations(points, 2):
        cnf.new_var(("samec", x, y))
    for x, y in combinations(points, 2):
        for label in labels:
            cnf.new_var(("com", x, y, label))
    for k in range(3):
        if cell.arms[k] == "2R":
            for p in range(3):
                cnf.new_var(("part", k, p))
    for k, t in cell.classes():
        for label in labels:
            cnf.new_var(("A", k, t, label))
    for role in ("kept", "deleted", "source", "z", "w"):
        for label in labels:
            cnf.new_var((role, label))
    for label in labels:
        cnf.new_var(("E", label))
    if cell.arms[0] == "2R":
        for t in range(2):
            cnf.new_var(("srcT", t))
    for label in labels:
        cnf.new_var(("used", label))

    def c(x: int, label: int) -> int:
        return cnf.var[("c", x, label)]

    def s(x: int, label: int) -> int:
        return cnf.var[("s", x, label)]

    def cin(x: int, k: int) -> int:
        return cnf.var[("cin", x, k)]

    def samec(x: int, y: int) -> int:
        return cnf.var[("samec", min(x, y), max(x, y))]

    def com(x: int, y: int, label: int) -> int:
        return cnf.var[("com", min(x, y), max(x, y), label)]

    def A(k: int, t: int, label: int) -> int:
        return cnf.var[("A", k, t, label)]

    def role(name: str, label: int) -> int:
        return cnf.var[(name, label)]

    # -- (a) shell contains its source, exact four, centre off the shell -----
    cnf.begin(
        "R1_shell_source_membership",
        "ROOT_STATIC",
        "PROVEN",
        ("CriticalFourShell.q_mem_support",),
        "H : CriticalShellSystem D.A, every x in D.A",
    )
    for x in points:
        cnf.add((s(x, x),))
    cnf.begin(
        "R2_shell_card_four",
        "ROOT_STATIC",
        "PROVEN",
        ("CriticalFourShell.support_card",),
        "H : CriticalShellSystem D.A",
    )
    for x in points:
        regs = cnf.counter([s(x, label) for label in labels], f"shell{x}")
        cnf.add((regs[3],))
        cnf.add((-regs[4],))
    cnf.begin(
        "R3_centre_one_hot_and_off_shell",
        "ROOT_STATIC",
        "PROVEN",
        (
            "CriticalShellSystem.centerAt",
            "CriticalFourShell.radius_pos",
            "CriticalFourShell.support_eq",
            "CriticalFourShell.center_mem",
        ),
        "dist c c = 0 < radius, so the centre is not on its own shell; "
        "center_mem gives c in A.erase x",
    )
    for x in points:
        cnf.exactly_one([c(x, label) for label in labels])
        cnf.add((-c(x, x),))
        for label in labels:
            cnf.add((-c(x, label), -s(x, label)))
    cnf.begin(
        "R4_centre_in_a_strict_cap_interior",
        "ROOT_STATIC",
        "PROVEN",
        (
            "exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge",
            "isUniqueFourCenter_centerAt",
            "not_isUniqueFourCenter_of_fullyDeletionRobust",
            "fullyDeletionRobustAt_of_apexRichClassStructure",
        ),
        "G.apex_rich at all three apices; at card 15 the strict interiors are "
        "the twelve interior slots",
    )
    for x in points:
        for a in APEX_LABELS:
            cnf.add((-c(x, a),))
        for k in range(3):
            for label in interior(k):
                cnf.add((-c(x, label), cin(x, k)))
            cnf.add((-cin(x, k),) + tuple(c(x, label) for label in interior(k)))

    # -- (c) same centre, same shell ---------------------------------------
    cnf.begin(
        "R5_same_centre_same_shell",
        "ROOT_STATIC",
        "PROVEN",
        (
            "ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support",
            "CriticalShellSystem.no_qfree_at",
        ),
        "a second four-point class at the same centre would survive deleting x",
    )
    for x, y in combinations(points, 2):
        for label in labels:
            cnf.add((-c(x, label), -c(y, label), samec(x, y)))
            cnf.add((-samec(x, y), -c(x, label), c(y, label)))
        for label in labels:
            cnf.add((-samec(x, y), -s(x, label), s(y, label)))
            cnf.add((-samec(x, y), s(x, label), -s(y, label)))
    cnf.begin(
        "R9_two_circle_bound_shells",
        "ROOT_STATIC",
        "PROVEN",
        ("SelectedFourClass.inter_card_le_two",),
        "distinct centres; also yields the converse of R5 (equal supports at "
        "distinct centres would share four > two points), so that converse is "
        "IMPLIED rather than an extra DERIVED clause",
    )
    for x, y in combinations(points, 2):
        for label in labels:
            cnf.add((-com(x, y, label), s(x, label)))
            cnf.add((-com(x, y, label), s(y, label)))
            cnf.add((com(x, y, label), -s(x, label), -s(y, label)))
        cnf.at_most([com(x, y, label) for label in labels], 2, condition=(-samec(x, y),))

    # -- (d)(f) own-cap betweenness and at-most-two -------------------------
    cnf.begin(
        "R6_own_cap_strict_betweenness",
        "ROOT_STATIC",
        "PROVEN",
        (
            "CGN.index_strictly_between_of_equidistant",
            "exists_orderedCap_six_of_card_eq_fifteen",
            "CriticalFourShell.support_eq_radius",
        ),
        "the centre at slot u of cap k is equidistant from any two shell points "
        "in capByIndex k, so their slots straddle u; apices sit at slots 0 and 5",
    )
    for x in points:
        for k in range(3):
            cap = cap_by_index(k)
            for u in range(1, 5):
                cu = interior_label(k, u)
                for a, b in combinations(cap, 2):
                    sa, sb = slot_of(k, a), slot_of(k, b)
                    assert sa is not None and sb is not None
                    lo, hi = min(sa, sb), max(sa, sb)
                    if not (lo < u < hi):
                        cnf.add((-c(x, cu), -s(x, a), -s(x, b)))
    cnf.begin(
        "R7_own_cap_at_most_two",
        "ROOT_STATIC",
        "IMPLIED",
        ("CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two",),
        "PROVEN on its own; implied by R6 (at most one shell point on each side)",
    )
    for x in points:
        for k in range(3):
            for triple in combinations(cap_by_index(k), 3):
                cnf.add((-cin(x, k),) + tuple(-s(x, label) for label in triple))

    # -- (e) one-hit rule on other rich cap slices ---------------------------
    cnf.begin(
        "R8_one_hit_other_cap_slice",
        "ROOT_STATIC",
        "PROVEN",
        (
            "criticalShell_inter_otherRichCapSlice_card_le_one",
            "criticalShellCenter_mem_capInteriorByIndex_of_two_hits",
            "twoRichClassSlices_partition_of_capInterior_card_eq_four",
        ),
        "G.apex_rich j; centre outside interior j; slice = whole interior in "
        "the oneRadius arm, each two-slot slice in the twoRadii arm",
    )
    for x in points:
        for j in range(3):
            if cell.arms[j] == "1R":
                for a, b in combinations(interior(j), 2):
                    cnf.add((cin(x, j), -s(x, a), -s(x, b)))
            else:
                for p in range(3):
                    for t in range(2):
                        a, b = slice_labels(j, p, t)
                        cnf.add((-cnf.var[("part", j, p)], cin(x, j), -s(x, a), -s(x, b)))

    # -- outside pair uniqueness and all-apex exclusion ----------------------
    cnf.begin(
        "R10_outside_pair_unique_cap_centre",
        "ROOT_STATIC",
        "PROVEN",
        (
            "CapSelectedRowCounting.outsidePair_unique_capCenter",
            "exists_orderedCap_six_of_card_eq_fifteen",
        ),
        "two distinct centres in one cap cannot both be equidistant from two "
        "distinct points outside that closed cap",
    )
    for x, y in combinations(points, 2):
        for k in range(3):
            outside = tuple(label for label in labels if label not in cap_by_index(k))
            cnf.at_most(
                [com(x, y, label) for label in outside],
                1,
                condition=(cin(x, k), cin(y, k), -samec(x, y)),
            )
    cnf.begin(
        "R11_no_shell_covers_all_apices",
        "ROOT_STATIC",
        "PROVEN",
        ("TriApexAllLargeContext.no_center_covers_all_apices",),
        "G, applied to the shell centre and radius",
    )
    for x in points:
        cnf.add(tuple(-s(x, a) for a in APEX_LABELS))

    # -- arm selectors and slice partitions ----------------------------------
    cnf.begin(
        "C1_arm_selector_and_slice_partition",
        "ASSUMPTION_CONTROL",
        "SELECTOR",
        (
            "StrictApexFourWitness (oneRadius | twoRadii)",
            "strictApexFourFamily_supportAt_eq_capInteriorByIndex_of_card_eq_fifteen",
            "twoRichClassSlices_partition_of_capInterior_card_eq_four",
        ),
        "cell parameter: the witness constructor at each cap; in the twoRadii "
        "arm the two slices are a 2+2 partition of the interior (PROVEN)",
    )
    for k in range(3):
        if cell.arms[k] == "2R":
            cnf.exactly_one([cnf.var[("part", k, p)] for p in range(3)])

    # -- (g) apex classes -----------------------------------------------------
    cnf.begin(
        "R12_apex_class_oneRadius_exact_six",
        "ROOT_STATIC",
        "PROVEN",
        ("selectedClass_card_eq_six_of_oneRadius_card_eq_fifteen",),
        "oneRadius arm at cap k, card 15: the class at the interior radius is "
        "the four interior slots plus exactly one label of each closed "
        "adjacent cap of apex k; the class never contains apex k",
    )
    for k, t in cell.classes():
        if cell.arms[k] != "1R":
            continue
        cnf.add((-A(k, t, k),))
        for label in interior(k):
            cnf.add((A(k, t, label),))
        for side in (0, 1):
            cnf.exactly_one([A(k, t, label) for label in adjacent_pick_domain(k, side)])
    cnf.begin(
        "R13_apex_class_twoRadii_exact_four_each",
        "ROOT_STATIC",
        "DERIVED",
        (
            "twoRichClassSlices_partition_of_capInterior_card_eq_four",
            "SurplusCapPacket.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep",
            "SurplusCapPacket.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep",
            "selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps",
        ),
        "twoRadii arm: each class of card >= 4 at apex k meets the interior in "
        "one two-slot slice and each closed adjacent cap in at most one point, "
        "so it has exactly four points; classes at distinct radii are disjoint. "
        "Composition of PROVEN facts, not compiled in Lean",
    )
    for k, t in cell.classes():
        if cell.arms[k] != "2R":
            continue
        cnf.add((-A(k, t, k),))
        for p in range(3):
            inside = set(slice_labels(k, p, t))
            for label in interior(k):
                lit = A(k, t, label) if label in inside else -A(k, t, label)
                cnf.add((-cnf.var[("part", k, p)], lit))
        for side in (0, 1):
            cnf.exactly_one([A(k, t, label) for label in adjacent_pick_domain(k, side)])
    for k in range(3):
        if cell.arms[k] == "2R":
            for label in labels:
                if label not in interior(k):
                    cnf.add((-A(k, 0, label), -A(k, 1, label)))
    cnf.begin(
        "R14_two_circle_bound_apex_class_vs_shell",
        "ROOT_STATIC",
        "PROVEN",
        (
            "SelectedFourClass.inter_card_le_two",
            "criticalShell_inter_frontierRadiusClass_card_le_two",
        ),
        "any four-subset of an apex class is a SelectedFourClass at the apex; "
        "the shell centre is never an apex (R4)",
    )
    for k, t in cell.classes():
        for x in points:
            both: list[int] = []
            for label in labels:
                aux = cnf.aux("comA")
                both.append(aux)
                cnf.add((-aux, A(k, t, label)))
                cnf.add((-aux, s(x, label)))
                cnf.add((aux, -A(k, t, label), -s(x, label)))
            cnf.at_most(both, 2)
    cnf.begin(
        "R15_two_circle_bound_apex_class_vs_apex_class",
        "ROOT_STATIC",
        "PROVEN",
        ("SelectedFourClass.inter_card_le_two",),
        "classes at distinct apices",
    )
    for (k1, t1), (k2, t2) in combinations(cell.classes(), 2):
        if k1 == k2:
            continue
        both = []
        for label in labels:
            aux = cnf.aux("comAA")
            both.append(aux)
            cnf.add((-aux, A(k1, t1, label)))
            cnf.add((-aux, A(k2, t2, label)))
            cnf.add((aux, -A(k1, t1, label), -A(k2, t2, label)))
        cnf.at_most(both, 2)

    # -- (h) Section 2 binders ------------------------------------------------
    cnf.begin(
        "B1_oriented_retained_common_deletion",
        "ROOT_STATIC",
        "PROVEN",
        (
            "OrientedRetainedCommonDeletion.kept_mem_capInterior",
            "OrientedRetainedCommonDeletion.deleted_mem_capInterior",
            "OrientedRetainedCommonDeletion.kept_mem_radius",
            "OrientedRetainedCommonDeletion.deleted_mem_radius",
            "OrientedRetainedCommonDeletion.sources_ne",
            "OrientedRetainedCommonDeletion.blockers_ne",
            "OrientedRetainedCommonDeletion.deleted_not_mem_kept_shell",
            "cross_deletion_survives_iff_not_mem_selected_support",
        ),
        "kept, deleted are distinct interior points of cap 0 on one apex-0 "
        "radius (in the twoRadii arm: one slice); distinct blockers; deleted "
        "avoids shell(kept); the packet survival at c(kept) is that omission",
    )
    for name in ("kept", "deleted"):
        cnf.exactly_one([role(name, label) for label in interior(0)])
        for label in labels:
            if label not in interior(0):
                cnf.add((-role(name, label),))
    for q in interior(0):
        cnf.add((-role("kept", q), -role("deleted", q)))
    for q in interior(0):
        for q2 in interior(0):
            if q == q2:
                continue
            cnf.add((-role("kept", q), -role("deleted", q2), -s(q, q2)))
            cnf.add((-role("kept", q), -role("deleted", q2), -samec(q, q2)))
            if cell.arms[0] == "2R":
                for p in range(3):
                    same_slice = any(
                        {q, q2} <= set(slice_labels(0, p, t)) for t in range(2)
                    )
                    if not same_slice:
                        cnf.add(
                            (-cnf.var[("part", 0, p)], -role("kept", q), -role("deleted", q2))
                        )
    cnf.begin(
        "B2_paired_apex_class_joint_deletion",
        "ROOT_STATIC",
        "PROVEN",
        (
            "PairedApexClassJointDeletion.source_mem_class",
            "PairedApexClassJointDeletion.sourceClass_card_ge_four",
            "PairedApexClassJointDeletion.source_not_mem_keptShell",
            "PairedApexClassJointDeletion.source_not_mem_deletedShell",
            "PairedApexClassJointDeletion.blocker_ne_keptBlocker",
            "PairedApexClassJointDeletion.blocker_ne_deletedBlocker",
            "selectedClass_card_eq_six_of_oneRadius_card_eq_fifteen",
        ),
        "the source lies on an apex-0 class of card >= 4; at card 15 those "
        "classes are exactly the modelled ones (oneRadius: the six-class, "
        "PROVEN; twoRadii: the two four-classes, DERIVED as in R13)",
    )
    cnf.exactly_one([role("source", label) for label in labels if label != 0])
    cnf.add((-role("source", 0),))
    zero_classes = [t for (k, t) in cell.classes() if k == 0]
    for label in labels:
        if label == 0:
            continue
        cnf.add((-role("source", label),) + tuple(A(0, t, label) for t in zero_classes))
    for q in labels:
        if q == 0:
            continue
        for q2 in interior(0):
            for name in ("kept", "deleted"):
                cnf.add((-role("source", q), -role(name, q2), -s(q2, q)))
                if q in points and q != q2:
                    cnf.add((-role("source", q), -role(name, q2), -samec(q, q2)))
    if cell.arms[0] == "2R":
        cnf.exactly_one([cnf.var[("srcT", t)] for t in range(2)])
        for t in range(2):
            for label in labels:
                if label == 0:
                    continue
                cnf.add((-cnf.var[("srcT", t)], -role("source", label), A(0, t, label)))
    cnf.begin(
        "B3_five_survive_one_fail_sources",
        "ROOT_STATIC",
        "PROVEN",
        (
            "TriApexFiveSurviveOneFail.E_subset",
            "TriApexFiveSurviveOneFail.E_card",
            "TriApexFiveSurviveOneFail.actualBlocker_ne_retained₁",
            "TriApexFiveSurviveOneFail.actualBlocker_ne_retained₂",
            "TriApexFiveSurviveOneFail.retained₁_survives",
            "TriApexFiveSurviveOneFail.retained₂_survives",
            "strictApexFourFamily_supportAt_eq_capInteriorByIndex_of_card_eq_fifteen",
            "cross_deletion_survives_iff_not_mem_selected_support",
        ),
        "E has four interior points outside both retained shells with blockers "
        "distinct from both retained blockers; apex survival and own-blocker "
        "failure hold automatically (apex rich; no_qfree_at)",
    )
    all_interior = interior(0) + interior(1) + interior(2)
    for a in APEX_LABELS:
        cnf.add((-role("E", a),))
    regs = cnf.counter([role("E", label) for label in all_interior], "E")
    cnf.add((regs[3],))
    cnf.add((-regs[4],))
    for q in all_interior:
        for q2 in interior(0):
            for name in ("kept", "deleted"):
                cnf.add((-role("E", q), -role(name, q2), -s(q2, q)))
                if q != q2:
                    cnf.add((-role("E", q), -role(name, q2), -samec(q, q2)))
    cnf.begin(
        "C2_pair_index_selector",
        "ASSUMPTION_CONTROL",
        "SELECTOR",
        ("exists_index_safe_pair_of_fiveSurviveOneFail",),
        "cell parameter i: two points of E lie in the interior of cap i "
        "(pigeonhole guarantees some i; the cell fixes it)",
    )
    for triple in combinations(interior(cell.pair_index), 3):
        cnf.add(tuple(role("E", label) for label in triple))
    cnf.begin(
        "B4_first_apex_mutual_cross_deletion_pair",
        "ROOT_STATIC",
        "PROVEN",
        (
            "exists_firstApex_mutualCrossDeletion_pair_through_source",
            "cross_deletion_survives_iff_not_mem_selected_support",
        ),
        "z != w on a four-row at apex 0 through the source (so in the source's "
        "apex-0 class), mutually omitting, with distinct blockers",
    )
    for name in ("z", "w"):
        cnf.exactly_one([role(name, label) for label in labels if label != 0])
        cnf.add((-role(name, 0),))
        for label in labels:
            if label == 0:
                continue
            if cell.arms[0] == "1R":
                cnf.add((-role(name, label), A(0, 0, label)))
            else:
                for t in range(2):
                    cnf.add((-cnf.var[("srcT", t)], -role(name, label), A(0, t, label)))
    for q in labels:
        if q == 0:
            continue
        cnf.add((-role("z", q), -role("w", q)))
        for q2 in labels:
            if q2 == 0 or q2 == q:
                continue
            if q in points:
                cnf.add((-role("z", q), -role("w", q2), -s(q, q2)))
            if q2 in points:
                cnf.add((-role("z", q), -role("w", q2), -s(q2, q)))
            if q in points and q2 in points:
                cnf.add((-role("z", q), -role("w", q2), -samec(q, q2)))

    # -- centre usage counter for the minimal-centre query --------------------
    cnf.begin(
        "Q1_distinct_centre_counter",
        "ROOT_STATIC",
        "IMPLIED",
        (),
        "definitional: used[l] iff some modelled point has centre l; the "
        "counter registers are queried by assumption only",
    )
    for label in labels:
        used = cnf.var[("used", label)]
        for x in points:
            cnf.add((-c(x, label), used))
        cnf.add((-used,) + tuple(c(x, label) for x in points))
    used_regs = cnf.counter([cnf.var[("used", label)] for label in labels], "used")

    # -- CL0: static equilateral closure (length-two distance-equality chains) --
    if equilateral:
        cnf.begin(
            "CL0_equilateral_closure",
            "ROOT_STATIC",
            "PROVEN",
            CLOSURE_LEAN_SOURCES,
            "two equidistance facts make the triangle equilateral "
            "(dist_eq_dist_of_mutual_bisector); exactness of the third object "
            "(mem_selectedClass, CriticalFourShell.support_eq). M(z, y) is the "
            "membership of y in the shell centred at the interior label z, "
            "realized by any modelled source of centre z",
        )
        for z in all_interior:
            for y in labels:
                if y != z:
                    cnf.new_var(("M", z, y))
        for z in all_interior:
            for y in labels:
                if y == z:
                    continue
                m = cnf.var[("M", z, y)]
                for x in points:
                    if x == z:
                        continue
                    cnf.add((-c(x, z), -s(x, y), m))
                    cnf.add((-m, -c(x, z), s(x, y)))
        objects: list[tuple[str, int, int]] = [("I", z, 0) for z in all_interior]
        objects.extend(("A", k, t) for (k, t) in cell.classes())

        def mem(obj: tuple[str, int, int], y: int) -> int:
            if obj[0] == "I":
                return cnf.var[("M", obj[1], y)]
            return A(obj[1], obj[2], y)

        for op in objects:
            for oq in objects:
                for orr in objects:
                    pp, qq, rr = op[1], oq[1], orr[1]
                    if len({pp, qq, rr}) != 3:
                        continue
                    cnf.add(
                        (
                            -mem(op, qq),
                            -mem(oq, pp),
                            -mem(oq, rr),
                            -mem(orr, pp),
                            -mem(orr, qq),
                            mem(op, rr),
                        )
                    )

    omitted = OMITTED_BINDERS if not cell.apex_shells else tuple(
        item for item in OMITTED_BINDERS if not item.startswith("shell constraints of a role")
        and not item.startswith("G.notRobustCover_card")
    )
    return Encoding(cell, cnf, used_regs, omitted)


# --------------------------------------------------------------------------
# Decoding and independent replay
# --------------------------------------------------------------------------


@dataclass
class Pattern:
    cell: Cell
    centre: dict[int, int]
    shell: dict[int, frozenset[int]]
    partition: dict[int, int]
    classes: dict[tuple[int, int], frozenset[int]]
    roles: dict[str, int]
    E: frozenset[int]

    def key(self, projection: str) -> tuple[Any, ...]:
        if projection == "full":
            return tuple(
                (x, self.centre[x], tuple(sorted(self.shell[x]))) for x in self.cell.points
            )
        if projection == "centres":
            return tuple((x, self.centre[x]) for x in self.cell.points)
        if projection == "capi":
            i = self.cell.pair_index
            cap = set(cap_by_index(i))
            return tuple(
                (x, self.centre[x], tuple(sorted(self.shell[x] & cap))) for x in interior(i)
            )
        raise D1Mu0CensusError(f"unknown projection {projection!r}")

    def to_json(self) -> dict[str, Any]:
        return {
            "centre": {label_name(x): label_name(c) for x, c in self.centre.items()},
            "shell": {
                label_name(x): [label_name(l) for l in sorted(sh)]
                for x, sh in self.shell.items()
            },
            "partition": {str(k): p for k, p in self.partition.items()},
            "classes": {
                f"A{k}.{t}": [label_name(l) for l in sorted(cls)]
                for (k, t), cls in self.classes.items()
            },
            "roles": {name: label_name(l) for name, l in self.roles.items()},
            "E": [label_name(l) for l in sorted(self.E)],
        }


def decode(enc: Encoding, model: Sequence[int]) -> Pattern:
    cell = enc.cell
    true = {lit for lit in model if lit > 0}
    if len(model) < enc.cnf.nvars:
        raise D1Mu0CensusError("model is not total over the encoding")

    def on(*key: Any) -> bool:
        return enc.v(*key) in true

    centre: dict[int, int] = {}
    shell: dict[int, frozenset[int]] = {}
    for x in cell.points:
        cs = [label for label in range(N_LABELS) if on("c", x, label)]
        if len(cs) != 1:
            raise D1Mu0CensusError("centre is not one-hot in the model")
        centre[x] = cs[0]
        shell[x] = frozenset(label for label in range(N_LABELS) if on("s", x, label))
    partition: dict[int, int] = {}
    for k in range(3):
        if cell.arms[k] == "2R":
            ps = [p for p in range(3) if on("part", k, p)]
            if len(ps) != 1:
                raise D1Mu0CensusError("slice partition is not one-hot in the model")
            partition[k] = ps[0]
    classes = {
        (k, t): frozenset(label for label in range(N_LABELS) if on("A", k, t, label))
        for (k, t) in cell.classes()
    }
    roles: dict[str, int] = {}
    for name in ("kept", "deleted", "source", "z", "w"):
        ls = [label for label in range(N_LABELS) if on(name, label)]
        if len(ls) != 1:
            raise D1Mu0CensusError(f"role {name} is not one-hot in the model")
        roles[name] = ls[0]
    E = frozenset(label for label in range(N_LABELS) if on("E", label))
    return Pattern(cell, centre, shell, partition, classes, roles, E)


def slices_of(cell: Cell, pattern: Pattern, k: int) -> tuple[tuple[int, ...], ...]:
    if cell.arms[k] == "1R":
        return (interior(k),)
    p = pattern.partition[k]
    return (slice_labels(k, p, 0), slice_labels(k, p, 1))


def replay(pattern: Pattern) -> list[str]:
    """Check a decoded pattern against the encoded contract, independently of the CNF."""

    cell = pattern.cell
    points = cell.points
    bad: list[str] = []
    c, S = pattern.centre, pattern.shell
    for x in points:
        if x not in S[x]:
            bad.append(f"R1 {label_name(x)} not on its own shell")
        if len(S[x]) != 4:
            bad.append(f"R2 shell of {label_name(x)} has {len(S[x])} points")
        if c[x] == x or c[x] in S[x]:
            bad.append(f"R3 centre of {label_name(x)} on its own shell")
        if set(APEX_LABELS) <= S[x]:
            bad.append(f"R11 shell of {label_name(x)} covers all apices")
        if is_apex(c[x]):
            bad.append(f"R4 centre of {label_name(x)} is an apex")
            continue
        k = cap_of_interior(c[x])
        cap = cap_by_index(k)
        u = slot_of(k, c[x])
        own = [label for label in S[x] if label in cap]
        if len(own) > 2:
            bad.append(f"R7 shell of {label_name(x)} has {len(own)} points in its centre cap")
        for a, b in combinations(own, 2):
            sa, sb = slot_of(k, a), slot_of(k, b)
            assert sa is not None and sb is not None and u is not None
            if not (min(sa, sb) < u < max(sa, sb)):
                bad.append(f"R6 betweenness fails at {label_name(x)}")
        for j in range(3):
            if j == k:
                continue
            for sl in slices_of(cell, pattern, j):
                if len(S[x] & set(sl)) > 1:
                    bad.append(f"R8 one-hit fails at {label_name(x)} in cap {j}")
    for x, y in combinations(points, 2):
        if c[x] == c[y] and S[x] != S[y]:
            bad.append(f"R5 same centre different shells {label_name(x)} {label_name(y)}")
        if c[x] != c[y]:
            if len(S[x] & S[y]) > 2:
                bad.append(f"R9 two-circle fails {label_name(x)} {label_name(y)}")
            if is_apex(c[x]) or is_apex(c[y]):
                continue
            kx, ky = cap_of_interior(c[x]), cap_of_interior(c[y])
            if kx == ky:
                outside = (S[x] & S[y]) - set(cap_by_index(kx))
                if len(outside) > 1:
                    bad.append(f"R10 outside pair fails {label_name(x)} {label_name(y)}")
    for (k, t), cls in pattern.classes.items():
        if k in cls:
            bad.append(f"R12/13 class A{k}.{t} contains its apex")
        if cell.arms[k] == "1R":
            if not set(interior(k)) <= cls or len(cls) != 6:
                bad.append(f"R12 class A{k}.{t} is not interior plus two")
        else:
            sl = set(slice_labels(k, pattern.partition[k], t))
            if cls & set(interior(k)) != sl or len(cls) != 4:
                bad.append(f"R13 class A{k}.{t} is not slice plus two")
        for side in (0, 1):
            if len(cls & set(adjacent_pick_domain(k, side))) != 1:
                bad.append(f"R12/13 class A{k}.{t} adjacent pick on side {side} is not one")
        for x in points:
            if len(cls & S[x]) > 2:
                bad.append(f"R14 class A{k}.{t} meets shell of {label_name(x)} in > 2")
    for (k1, t1), (k2, t2) in combinations(pattern.classes, 2):
        c1, c2 = pattern.classes[(k1, t1)], pattern.classes[(k2, t2)]
        if k1 == k2 and c1 & c2:
            bad.append(f"R13 classes at apex {k1} are not disjoint")
        if k1 != k2 and len(c1 & c2) > 2:
            bad.append(f"R15 classes A{k1}.{t1} A{k2}.{t2} meet in > 2")
    r = pattern.roles
    kept, deleted, source, z, w = r["kept"], r["deleted"], r["source"], r["z"], r["w"]
    zero_classes = [cls for (k, t), cls in pattern.classes.items() if k == 0]
    if kept not in interior(0) or deleted not in interior(0) or kept == deleted:
        bad.append("B1 kept/deleted are not distinct interior points of cap 0")
    else:
        if cell.arms[0] == "2R" and not any(
            {kept, deleted} <= set(sl) for sl in slices_of(cell, pattern, 0)
        ):
            bad.append("B1 kept/deleted are not on one slice")
        if c[kept] == c[deleted]:
            bad.append("B1 kept/deleted share a blocker")
        if deleted in S[kept]:
            bad.append("B1 deleted lies on shell(kept)")
    src_class = [cls for cls in zero_classes if source in cls]
    if len(src_class) != 1:
        bad.append("B2 source is not on exactly one apex-0 class")
    if source in S[kept] or source in S[deleted]:
        bad.append("B2 source lies on a retained shell")
    if source in points and c[source] in (c[kept], c[deleted]):
        bad.append("B2 source blocker coincides with a retained blocker")
    if len(pattern.E) != 4 or any(is_apex(x) for x in pattern.E):
        bad.append("B3 E is not four interior points")
    for x in pattern.E:
        if x in S[kept] or x in S[deleted]:
            bad.append(f"B3 {label_name(x)} in E lies on a retained shell")
        if c[x] in (c[kept], c[deleted]):
            bad.append(f"B3 {label_name(x)} in E shares a retained blocker")
    if len(pattern.E & set(interior(cell.pair_index))) < 2:
        bad.append("C2 fewer than two E points at the pair index")
    if z == w or z == 0 or w == 0:
        bad.append("B4 z, w are not distinct non-first-apex labels")
    if src_class and (z not in src_class[0] or w not in src_class[0]):
        bad.append("B4 z, w are not on the source's apex-0 class")
    if z in points and w in S[z]:
        bad.append("B4 w lies on shell(z)")
    if w in points and z in S[w]:
        bad.append("B4 z lies on shell(w)")
    if z in points and w in points and c[z] == c[w]:
        bad.append("B4 z, w share a blocker")
    return bad


@dataclass(frozen=True)
class ClosureObject:
    """One exact equidistance object of a pattern: a shell or an apex class."""

    kind: str
    centre: int
    members: frozenset[int]
    source: int | None
    apex_class: tuple[int, int] | None

    def centre_keys(self) -> tuple[tuple[Any, ...], ...]:
        if self.kind == "shell":
            return (("c", self.source, self.centre),)
        return ()

    def member_key(self, y: int) -> tuple[Any, ...]:
        if self.kind == "shell":
            return ("s", self.source, y)
        assert self.apex_class is not None
        return ("A", self.apex_class[0], self.apex_class[1], y)

    def label(self) -> str:
        if self.kind == "shell":
            return f"shell@{label_name(self.centre)}"
        assert self.apex_class is not None
        return f"class A{self.apex_class[0]}.{self.apex_class[1]}"


@dataclass(frozen=True)
class ClosureViolation:
    kind: str
    centre: int
    missing: int
    witness: int
    chain: tuple[tuple[str, int, int, int], ...]
    antecedent: tuple[tuple[Any, ...], ...]
    consequent: tuple[Any, ...]

    @property
    def chain_length(self) -> int:
        return len(self.chain)

    def to_json(self) -> dict[str, Any]:
        return {
            "kind": self.kind,
            "centre": label_name(self.centre),
            "missing": label_name(self.missing),
            "witness": label_name(self.witness),
            "chain_length": self.chain_length,
            "chain": [
                {"object": obj, "centre": label_name(o), "from": label_name(m), "to": label_name(m2)}
                for obj, o, m, m2 in self.chain
            ],
            "antecedent": [list(map(str, key)) for key in self.antecedent],
            "consequent": list(map(str, self.consequent)),
        }


def closure_objects(pattern: Pattern) -> list[ClosureObject]:
    objects: list[ClosureObject] = []
    by_centre: dict[int, int] = {}
    for x in pattern.cell.points:
        centre = pattern.centre[x]
        if centre not in by_centre or x < by_centre[centre]:
            by_centre[centre] = x
    for centre in sorted(by_centre):
        q = by_centre[centre]
        objects.append(ClosureObject("shell", centre, pattern.shell[q], q, None))
    for (k, t), members in sorted(pattern.classes.items()):
        objects.append(ClosureObject("class", k, members, None, (k, t)))
    return objects


def _push_keys(antecedent: list[tuple[Any, ...]], keys: Iterable[tuple[Any, ...]]) -> None:
    for key in keys:
        if key not in antecedent:
            antecedent.append(key)


def closure_violation(pattern: Pattern) -> ClosureViolation | None:
    """Distance-equality closure oracle over unordered label pairs.

    Every object asserts ``dist(centre, y) = dist(centre, y')`` for its members
    (``support_eq_radius`` / ``mem_selectedClass``); equality is transitive;
    both objects are exact, so any of the fifteen carrier labels whose distance
    to the centre equals the object's radius must be a member.  Returns the
    violation with the shortest explanation chain, or ``None``.
    """

    objects = closure_objects(pattern)
    adjacency: dict[frozenset[int], list[tuple[frozenset[int], int, int, int]]] = {}
    for index, obj in enumerate(objects):
        for m, m2 in combinations(sorted(obj.members), 2):
            a, b = frozenset((obj.centre, m)), frozenset((obj.centre, m2))
            adjacency.setdefault(a, []).append((b, index, m, m2))
            adjacency.setdefault(b, []).append((a, index, m2, m))
    best: ClosureViolation | None = None
    for obj in objects:
        targets = {frozenset((obj.centre, y)): y for y in obj.members}
        for x in range(N_LABELS):
            if x == obj.centre or x in obj.members:
                continue
            start = frozenset((obj.centre, x))
            if start not in adjacency:
                continue
            parent: dict[frozenset[int], tuple[frozenset[int], int, int, int] | None] = {start: None}
            queue = [start]
            found: frozenset[int] | None = None
            while queue and found is None:
                node = queue.pop(0)
                for nxt, index, m, m2 in adjacency.get(node, ()):
                    if nxt in parent:
                        continue
                    parent[nxt] = (node, index, m, m2)
                    if nxt in targets:
                        found = nxt
                        break
                    queue.append(nxt)
            if found is None:
                continue
            edges: list[tuple[int, int, int]] = []
            node = found
            while parent[node] is not None:
                prev, index, m, m2 = parent[node]  # type: ignore[misc]
                edges.append((index, m, m2))
                node = prev
            edges.reverse()
            if best is not None and len(edges) >= best.chain_length:
                continue
            antecedent: list[tuple[Any, ...]] = []
            chain: list[tuple[str, int, int, int]] = []
            for index, m, m2 in edges:
                edge_obj = objects[index]
                _push_keys(antecedent, edge_obj.centre_keys())
                _push_keys(antecedent, (edge_obj.member_key(m), edge_obj.member_key(m2)))
                chain.append((edge_obj.label(), edge_obj.centre, m, m2))
            witness = targets[found]
            _push_keys(antecedent, obj.centre_keys())
            _push_keys(antecedent, (obj.member_key(witness),))
            best = ClosureViolation(
                obj.kind, obj.centre, x, witness, tuple(chain), tuple(antecedent), obj.member_key(x)
            )
    return best


def explanation_clause(enc: Encoding, violation: ClosureViolation) -> list[int]:
    clause = [-enc.v(*key) for key in violation.antecedent]
    clause.append(enc.v(*violation.consequent))
    return clause


CL1_CUT_RECORD = {
    "block_id": "CL1_distance_equality_closure",
    "clause_class": "DERIVED_CUT",
    "admission": "PROVEN",
    "lean_sources": list(CLOSURE_LEAN_SOURCES),
    "antecedent": (
        "transitivity of real equality plus exactness of SelectedClass and "
        "CriticalFourShell.support; the metric core is dist_eq_dist_of_mutual_bisector"
    ),
}


def sigma_key(key: tuple[Any, ...], projection: str) -> tuple[Any, ...]:
    """Image of a projection key under the reflection sigma (cells with sigma_fixed)."""

    mapped = []
    for item in key:
        x = sigma_label(item[0])
        if projection == "centres":
            mapped.append((x, sigma_label(item[1])))
        else:
            mapped.append((x, sigma_label(item[1]), tuple(sorted(sigma_label(l) for l in item[2]))))
    return tuple(sorted(mapped))


def normalize_key(key: tuple[Any, ...]) -> tuple[Any, ...]:
    return tuple(sorted(key))


def blocking_clause(enc: Encoding, pattern: Pattern, projection: str) -> list[int]:
    cell = enc.cell
    if projection == "full":
        lits = [-enc.v("c", x, pattern.centre[x]) for x in cell.points]
        lits.extend(-enc.v("s", x, l) for x in cell.points for l in sorted(pattern.shell[x]))
        return lits
    if projection == "centres":
        return [-enc.v("c", x, pattern.centre[x]) for x in cell.points]
    if projection == "capi":
        i = cell.pair_index
        lits = [-enc.v("c", x, pattern.centre[x]) for x in interior(i)]
        for x in interior(i):
            for label in cap_by_index(i):
                var = enc.v("s", x, label)
                lits.append(-var if label in pattern.shell[x] else var)
        return lits
    raise D1Mu0CensusError(f"unknown projection {projection!r}")


# --------------------------------------------------------------------------
# piqd client (raw-DIMACS jobs and SAT sessions)
# --------------------------------------------------------------------------


class Piqd:
    def __init__(self, server: str = DEFAULT_SERVER, http_timeout: float = 120.0) -> None:
        self.server = server.rstrip("/")
        self.http_timeout = http_timeout
        self.trace: list[dict[str, Any]] = []

    def _request(
        self, method: str, path: str, body: bytes | None = None, headers: Mapping[str, str] | None = None
    ) -> tuple[int, bytes]:
        request = urllib.request.Request(
            self.server + path, data=body, method=method, headers=dict(headers or {})
        )
        self.trace.append({"method": method, "target": path})
        try:
            with urllib.request.urlopen(request, timeout=self.http_timeout) as response:
                return response.status, response.read()
        except urllib.error.HTTPError as exc:
            return exc.code, exc.read()

    def _json(self, method: str, path: str, payload: Any = None, expect: int = 200) -> dict[str, Any]:
        body = None
        headers = {}
        if payload is not None:
            body = json.dumps(payload).encode("utf-8")
            headers["Content-Type"] = "application/json"
        status, raw = self._request(method, path, body, headers)
        try:
            value = json.loads(raw.decode("utf-8"))
        except (UnicodeDecodeError, json.JSONDecodeError) as exc:
            raise D1Mu0CensusError(f"piqd {method} {path}: non-JSON reply {raw[:200]!r}") from exc
        if status != expect:
            raise D1Mu0CensusError(f"piqd {method} {path}: status {status}, reply {value}")
        return value

    def version(self) -> dict[str, Any]:
        return self._json("GET", "/version")

    def prepare_cnf(
        self, cnf: bytes, manifest: bytes, timeout_s: int, project: str = PROJECT_LABEL
    ) -> dict[str, Any]:
        meta = json.dumps(
            {
                "backend": "cadical",
                "solver_profile": "sat",
                "timeout_s": timeout_s,
                "project": project,
            }
        ).encode("utf-8")
        boundary = "p97-d1-" + uuid.uuid4().hex
        parts = (
            ("cnf", "cell.cnf", "application/octet-stream", cnf),
            ("meta", "meta.json", "application/json", meta),
            ("manifest", "producer.json", "application/json", manifest),
        )
        chunks: list[bytes] = []
        for name, filename, content_type, payload in parts:
            chunks.extend(
                [
                    f"--{boundary}\r\n".encode(),
                    f'Content-Disposition: form-data; name="{name}"; filename="{filename}"\r\n'.encode(),
                    f"Content-Type: {content_type}\r\n\r\n".encode(),
                    payload,
                    b"\r\n",
                ]
            )
        chunks.append(f"--{boundary}--\r\n".encode())
        status, raw = self._request(
            "POST",
            "/jobs/prepare-cnf",
            b"".join(chunks),
            {"Content-Type": f"multipart/form-data; boundary={boundary}"},
        )
        value = json.loads(raw.decode("utf-8"))
        if status != 200:
            raise D1Mu0CensusError(f"piqd prepare-cnf: status {status}, reply {value}")
        expected = hashlib.sha256(cnf).hexdigest()
        if value.get("cnf_blob_hash") != expected:
            raise D1Mu0CensusError("piqd prepare-cnf returned a different CNF blob hash")
        return value

    def confirm(self, job_id: str) -> dict[str, Any]:
        return self._json("POST", f"/jobs/confirm?job_id={job_id}")

    def job(self, job_id: str) -> dict[str, Any]:
        return self._json("GET", f"/jobs/{job_id}")

    def wait(self, job_id: str, deadline_s: float, poll_s: float = 0.2) -> dict[str, Any]:
        start = time.monotonic()
        while True:
            record = self.job(job_id)
            if record.get("status") in ("completed", "failed"):
                return record
            if time.monotonic() - start > deadline_s:
                raise D1Mu0CensusError(f"piqd job {job_id} did not finish within {deadline_s}s")
            time.sleep(poll_s)

    def run_job(self, cnf: bytes, manifest: bytes, timeout_s: int) -> tuple[dict[str, Any], dict[str, Any]]:
        prepared = self.prepare_cnf(cnf, manifest, timeout_s)
        job_id = prepared["job_id"]
        record = self.job(job_id)
        if record.get("status") in ("prepared",) or record.get("status") == "completed" and record.get("result") == "UNKNOWN":
            self.confirm(job_id)
        record = self.wait(job_id, deadline_s=timeout_s + 600)
        return prepared, record

    def model(self, job_id: str) -> list[int]:
        value = self._json("GET", f"/jobs/{job_id}/model")
        assignment = value.get("assignment")
        if not isinstance(assignment, list):
            raise D1Mu0CensusError("piqd model reply has no assignment")
        return [int(lit) for lit in assignment]

    def create_session(self, seed_from_job: str, label: str) -> dict[str, Any]:
        return self._json(
            "POST",
            "/sessions",
            {"solver": SESSION_SOLVER, "lane": "sat", "label": label, "seed_from_job": seed_from_job},
            expect=201,
        )

    def session_status(self, session_id: str) -> dict[str, Any]:
        return self._json("GET", f"/sessions/{session_id}")

    def add_clauses(self, session_id: str, clauses: Sequence[Sequence[int]]) -> dict[str, Any]:
        return self._json(
            "POST", f"/sessions/{session_id}/clauses", {"clauses": [list(cl) for cl in clauses]}
        )

    def solve(self, session_id: str, assumptions: Sequence[int], timeout_ms: int) -> dict[str, Any]:
        return self._json(
            "POST",
            f"/sessions/{session_id}/solve",
            {"assumptions": list(assumptions), "timeout_ms": timeout_ms, "include_model": True},
        )

    def close_session(self, session_id: str) -> dict[str, Any]:
        return self._json("DELETE", f"/sessions/{session_id}")


# --------------------------------------------------------------------------
# Cell runner
# --------------------------------------------------------------------------


def sha256_hex(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def canonical_json(value: Any) -> bytes:
    return json.dumps(value, ensure_ascii=True, sort_keys=True, separators=(",", ":")).encode("utf-8")


def encoding_record(enc: Encoding, cnf_bytes: bytes) -> dict[str, Any]:
    cell = enc.cell
    return {
        "schema": SCHEMA,
        "semantic_status": SEMANTIC_STATUS,
        "promotion_eligible": PROMOTION_ELIGIBLE,
        "cell": {
            "name": cell.name,
            "pair_index": cell.pair_index,
            "arms": list(cell.arms),
            "apex_shells": cell.apex_shells,
            "is_target": cell.is_target,
            "sigma_fixed": cell.sigma_fixed,
            "modelled_points": [label_name(x) for x in cell.points],
        },
        "cnf_sha256": sha256_hex(cnf_bytes),
        "num_vars": enc.cnf.nvars,
        "num_clauses": len(enc.cnf.clauses),
        "clause_blocks": [
            {
                "block_id": b.block_id,
                "clause_class": b.clause_class,
                "admission": b.admission,
                "lean_sources": list(b.lean_sources),
                "antecedent": b.antecedent,
                "clauses": b.clauses,
            }
            for b in enc.cnf.blocks
        ],
        "omitted_binders": list(enc.omitted_binders),
        "symmetry": (
            "labels are roles; apex 0 = oppApex1 and cap 0 = oppIndex1 are fixed by "
            "O and J; the only label symmetry of the hypothesis packet is the "
            "reflection sigma (apex 1 <-> apex 2, cap 1 <-> cap 2, every slot "
            "order reversed); pair index 2 is the sigma-image of pair index 1 "
            "and is not run; a single cap's slot reversal is not a symmetry "
            "because the apex endpoint slots 0 and 5 enter R6"
        ),
    }


def producer_manifest(enc: Encoding, cnf_bytes: bytes, purpose: str, units: Sequence[int] = ()) -> bytes:
    return canonical_json(
        {
            "schema": SCHEMA + "/producer",
            "lane_id": LANE_ID,
            "cell": enc.cell.name,
            "purpose": purpose,
            "units": list(units),
            "base_cnf_sha256": sha256_hex(cnf_bytes),
            "encoder": "census/card_head/d1_mu0_incidence_census.py",
        }
    )


def with_units(cnf_bytes: bytes, units: Sequence[int]) -> bytes:
    header, _, rest = cnf_bytes.partition(b"\n")
    parts = header.split()
    nvars, nclauses = int(parts[2]), int(parts[3])
    extra = "".join(f"{lit} 0\n" for lit in units).encode("ascii")
    return f"p cnf {nvars} {nclauses + len(units)}\n".encode("ascii") + rest + extra


def with_clauses(cnf_bytes: bytes, clauses: Sequence[Sequence[int]]) -> bytes:
    header, _, rest = cnf_bytes.partition(b"\n")
    parts = header.split()
    nvars, nclauses = int(parts[2]), int(parts[3])
    extra = "".join(" ".join(str(lit) for lit in clause) + " 0\n" for clause in clauses).encode("ascii")
    return f"p cnf {nvars} {nclauses + len(clauses)}\n".encode("ascii") + rest + extra


def job_summary(record: Mapping[str, Any]) -> dict[str, Any]:
    keys = (
        "id",
        "status",
        "result",
        "wall_ms",
        "cnf_blob_hash",
        "identity_hash",
        "proof_blob_hash",
        "proof_format",
        "proof_size_bytes",
        "model_blob_hash",
        "daemon_sha256",
    )
    return {key: record.get(key) for key in keys}


class CellRun:
    def __init__(self, cell: Cell, client: Piqd | None, artifacts: Path, args: argparse.Namespace) -> None:
        self.cell = cell
        self.client = client
        self.artifacts = artifacts
        self.args = args
        self.enc = build(cell, equilateral=bool(getattr(args, "cl0", False)))
        self.cnf_bytes = self.enc.cnf.dimacs()
        self.result: dict[str, Any] = {
            "cell": cell.name,
            "is_target": cell.is_target,
            "cl0_static_block": bool(getattr(args, "cl0", False)),
            "closure_oracle": bool(getattr(args, "closure", False)),
        }
        self.session_id: str | None = None

    def log(self, message: str) -> None:
        line = f"{datetime.now(UTC).isoformat()} {self.cell.name} {message}"
        print(line, flush=True)
        with (self.artifacts.parent / "events" / "log.txt").open("a", encoding="utf-8") as handle:
            handle.write(line + "\n")

    def write_encoding(self) -> None:
        (self.artifacts / f"{self.cell.name}.cnf").write_bytes(self.cnf_bytes)
        record = encoding_record(self.enc, self.cnf_bytes)
        (self.artifacts / f"{self.cell.name}.encoding.json").write_text(
            json.dumps(record, indent=1, sort_keys=True) + "\n", encoding="utf-8"
        )
        self.result["encoding"] = {
            "cnf_sha256": record["cnf_sha256"],
            "num_vars": record["num_vars"],
            "num_clauses": record["num_clauses"],
        }

    def base_job(self) -> dict[str, Any]:
        assert self.client is not None
        manifest = producer_manifest(self.enc, self.cnf_bytes, "base")
        prepared, record = self.client.run_job(self.cnf_bytes, manifest, self.args.timeout)
        summary = job_summary(record)
        summary["existing"] = prepared.get("existing")
        self.result["base_job"] = summary
        self.log(f"base job {record['id']} -> {record.get('result')} ({record.get('wall_ms')} ms)")
        if record.get("result") == "SAT":
            model = self.client.model(record["id"])
            pattern = decode(self.enc, model)
            violations = replay(pattern)
            self.result["base_model_replay"] = {"violations": violations, "pattern": pattern.to_json()}
            if violations:
                raise D1Mu0CensusError(f"base SAT model failed replay: {violations[:3]}")
        return record

    def open_session(self, job_id: str) -> str:
        assert self.client is not None
        session = self.client.create_session(job_id, f"{PROJECT_LABEL}:{self.cell.name}")
        self.session_id = session["id"]
        status = self.client.session_status(self.session_id)
        if status.get("clauses") != len(self.enc.cnf.clauses):
            raise D1Mu0CensusError("session seed clause count differs from the encoding")
        self.result.setdefault("sessions", []).append(
            {
                "id": self.session_id,
                "solver_name": session.get("solver_name"),
                "solver_sha256": session.get("solver_sha256"),
                "seed_job": job_id,
            }
        )
        return self.session_id

    def close(self) -> None:
        if self.client is not None and self.session_id is not None:
            try:
                status = self.client.session_status(self.session_id)
                entry = self.result["sessions"][-1]
                entry["solves"] = status.get("solves")
                entry["clauses"] = status.get("clauses")
                self.client.close_session(self.session_id)
            except D1Mu0CensusError as exc:
                self.result.setdefault("defects", []).append(str(exc))
            self.session_id = None

    def query(self, name: str, assumptions: Sequence[int]) -> dict[str, Any]:
        assert self.client is not None and self.session_id is not None
        reply = self.client.solve(self.session_id, assumptions, self.args.timeout * 1000)
        entry: dict[str, Any] = {
            "name": name,
            "assumptions": list(assumptions),
            "status": reply["status"],
            "solve_ms": reply.get("solve_ms"),
            "solve_index": reply.get("solve_index"),
            "result_sha256": reply.get("result_sha256"),
        }
        if reply["status"] == "SAT":
            pattern = decode(self.enc, reply["model"])
            violations = replay(pattern)
            entry["replay_violations"] = violations
            if violations:
                raise D1Mu0CensusError(f"query {name}: SAT model failed replay: {violations[:3]}")
        elif reply["status"] == "UNSAT":
            entry["core"] = reply.get("core")
            entry["terminal_unsat"] = reply.get("terminal_unsat")
        else:
            entry["interrupted_by"] = reply.get("interrupted_by")
        return entry

    def targeted_queries(self) -> None:
        cell, enc = self.cell, self.enc
        i = cell.pair_index
        queries: list[dict[str, Any]] = []
        for x in interior(i):
            for k in range(3):
                queries.append(self.query(f"centre_of_{label_name(x)}_in_cap_{k}", [enc.v("cin", x, k)]))
        for x in interior(i):
            for y in interior(i):
                if x != y:
                    queries.append(self.query(f"arrow_{label_name(x)}_to_{label_name(y)}", [enc.v("s", x, y)]))
        for x in interior(i):
            queries.append(
                self.query(
                    f"shell_of_{label_name(x)}_meets_cap_{i}_interior_only_in_itself",
                    [-enc.v("s", x, y) for y in interior(i) if y != x],
                )
            )
        p1, p2 = interior_label(i, 1), interior_label(i, 2)
        for k1 in range(3):
            for k2 in range(3):
                queries.append(
                    self.query(
                        f"pair_centres_{label_name(p1)}_in_cap_{k1}_and_{label_name(p2)}_in_cap_{k2}",
                        [enc.v("cin", p1, k1), enc.v("cin", p2, k2)],
                    )
                )
        queries.append(
            self.query(
                "no_two_hit_arrow_anywhere_in_pair_cap",
                [-enc.v("s", x, y) for x in interior(i) for y in interior(i) if x != y],
            )
        )
        queries.append(
            self.query(
                f"arrow_{label_name(interior_label(i, 3))}_to_{label_name(p1)}_with_both_pair_centres_outside_cap_{i}",
                [-enc.v("cin", p1, i), -enc.v("cin", p2, i), enc.v("s", interior_label(i, 3), p1)],
            )
        )
        minimal: int | None = None
        for m in range(1, N_LABELS + 1):
            entry = self.query(f"at_most_{m}_distinct_centres", [-enc.used_regs[m]] if m < N_LABELS else [])
            queries.append(entry)
            if entry["status"] == "SAT":
                minimal = m
                break
            if entry["status"] == "UNKNOWN":
                break
        self.result["queries"] = queries
        self.result["minimal_distinct_centres"] = minimal
        summary = {
            "centre_locations": {
                label_name(x): [k for k in range(3) if any(
                    q["name"] == f"centre_of_{label_name(x)}_in_cap_{k}" and q["status"] == "SAT" for q in queries
                )]
                for x in interior(i)
            },
            "surviving_arrows": [
                q["name"]
                for q in queries
                if q["name"].startswith("arrow_") and "with_both" not in q["name"] and q["status"] == "SAT"
            ],
            "refuted_arrows": [
                q["name"]
                for q in queries
                if q["name"].startswith("arrow_") and "with_both" not in q["name"] and q["status"] == "UNSAT"
            ],
            "minimal_distinct_centres": minimal,
        }
        self.result["query_summary"] = summary
        self.log(f"queries done: arrows surviving {len(summary['surviving_arrows'])}, min centres {minimal}")

    def enumerate(self, projection: str) -> None:
        assert self.client is not None and self.session_id is not None
        cap, budget = self.args.cap, self.args.budget_seconds
        keys: list[tuple[Any, ...]] = []
        seen: set[tuple[Any, ...]] = set()
        start = time.monotonic()
        status = "complete"
        models_path = self.artifacts / f"{self.cell.name}.{self.args.tag}.{projection}.models.jsonl"
        cuts_path = self.artifacts / f"{self.cell.name}.{self.args.tag}.{projection}.cuts.jsonl"
        use_oracle = bool(getattr(self.args, "closure", False))
        cut_clauses: list[list[int]] = []
        block_clauses: list[list[int]] = []
        chain_histogram: dict[int, int] = {}
        last: dict[str, Any] | None = None
        with models_path.open("w", encoding="utf-8") as handle, cuts_path.open("w", encoding="utf-8") as cuts_handle:
            while True:
                if len(keys) + len(cut_clauses) >= cap:
                    status = "cap_hit"
                    break
                if time.monotonic() - start > budget:
                    status = "budget_hit"
                    break
                reply = self.client.solve(self.session_id, [], self.args.timeout * 1000)
                last = {"solve_index": reply.get("solve_index"), "status": reply["status"]}
                if reply["status"] == "UNSAT":
                    status = "complete"
                    break
                if reply["status"] != "SAT":
                    status = f"solver_{reply['status'].lower()}"
                    break
                pattern = decode(self.enc, reply["model"])
                violations = replay(pattern)
                if violations:
                    raise D1Mu0CensusError(f"enumeration model failed replay: {violations[:3]}")
                if use_oracle:
                    violation = closure_violation(pattern)
                    if violation is not None:
                        clause = explanation_clause(self.enc, violation)
                        true_lits = {lit for lit in reply["model"] if lit > 0}
                        if any((lit > 0 and lit in true_lits) or (lit < 0 and -lit not in true_lits) for lit in clause):
                            raise D1Mu0CensusError("closure cut is not falsified by the model it explains")
                        cut_clauses.append(clause)
                        chain_histogram[violation.chain_length] = chain_histogram.get(violation.chain_length, 0) + 1
                        cuts_handle.write(
                            json.dumps(
                                {
                                    "index": len(cut_clauses),
                                    "solve_index": reply.get("solve_index"),
                                    "violation": violation.to_json(),
                                    "clause": clause,
                                }
                            )
                            + "\n"
                        )
                        self.client.add_clauses(self.session_id, [clause])
                        continue
                key = normalize_key(pattern.key(projection))
                if key in seen:
                    raise D1Mu0CensusError("blocking clause did not exclude a repeated pattern")
                seen.add(key)
                keys.append(key)
                handle.write(
                    json.dumps(
                        {"index": len(keys), "solve_index": reply.get("solve_index"), "pattern": pattern.to_json()}
                    )
                    + "\n"
                )
                block = blocking_clause(self.enc, pattern, projection)
                block_clauses.append(block)
                self.client.add_clauses(self.session_id, [block])
        certification: dict[str, Any] | None = None
        if status == "complete" and (cut_clauses or block_clauses):
            extra = [tuple(cl) for cl in cut_clauses] + [tuple(cl) for cl in block_clauses]
            certified = with_clauses(self.cnf_bytes, extra)
            formula = "base+CL1_cuts" if not block_clauses else "base+CL1_cuts+survivor_blocks"
            cert_path = self.artifacts / f"{self.cell.name}.{self.args.tag}.{projection}.certified.cnf"
            cert_path.write_bytes(certified)
            manifest = producer_manifest(self.enc, self.cnf_bytes, f"certify:{formula}:{len(extra)}")
            _prepared, record = self.client.run_job(certified, manifest, self.args.timeout)
            certification = {
                "formula": formula,
                "cut_clauses": len(cut_clauses),
                "survivor_blocks": len(block_clauses),
                "cnf_file": cert_path.name,
                "cnf_sha256": sha256_hex(certified),
                "job": job_summary(record),
            }
            self.log(
                f"certification job {record.get('id')} -> {record.get('result')} "
                f"proof {record.get('proof_blob_hash')}"
            )
        orbits: int | None = None
        if self.cell.sigma_fixed:
            orbits = len({min(key, sigma_key(key, projection)) for key in keys})
        entry = {
            "projection": projection,
            "status": status,
            "count": len(keys),
            "cap": cap,
            "budget_seconds": budget,
            "elapsed_seconds": round(time.monotonic() - start, 2),
            "sigma_orbits": orbits,
            "last_solve": last,
            "models_file": models_path.name,
        }
        if projection == "capi":
            entry["statistics"] = capi_statistics(keys, self.cell)
        if use_oracle:
            entry["closure"] = {
                "cuts": len(cut_clauses),
                "survivors": len(keys),
                "chain_length_histogram": dict(sorted(chain_histogram.items())),
                "cuts_file": cuts_path.name,
                "cut_admission_record": CL1_CUT_RECORD,
                "certification": certification,
            }
        self.result.setdefault("enumeration", []).append(entry)
        self.log(
            f"enumeration {projection}: {status} with {len(keys)} survivors and {len(cut_clauses)} CL1 cuts"
        )

    def run(self) -> dict[str, Any]:
        self.write_encoding()
        if self.client is None:
            self.result["verdict"] = "not_run"
            return self.result
        record = self.base_job()
        self.result["verdict"] = record.get("result")
        if record.get("result") == "SAT" and (self.args.queries or self.args.enumerate != "none"):
            self.open_session(record["id"])
            try:
                if self.args.queries:
                    self.targeted_queries()
                projections = (
                    list(PROJECTIONS) if self.args.enumerate == "all" else [self.args.enumerate]
                )
                if self.args.enumerate != "none":
                    for projection in projections:
                        # each projection needs a fresh session (blocks accumulate)
                        if self.session_id is None:
                            self.open_session(record["id"])
                        self.enumerate(projection)
                        self.close()
            finally:
                self.close()
        return self.result


def capi_statistics(keys: Sequence[tuple[Any, ...]], cell: Cell) -> dict[str, Any]:
    i = cell.pair_index
    location_counts: dict[str, dict[str, int]] = {}
    two_hit = 0
    for key in keys:
        has_arrow = False
        for x, centre, own in key:
            loc = "own_cap_interior" if cap_of_interior(centre) == i else f"cap_{cap_of_interior(centre)}"
            location_counts.setdefault(label_name(x), {}).setdefault(loc, 0)
            location_counts[label_name(x)][loc] += 1
            if len(set(own) & set(interior(i))) >= 2:
                has_arrow = True
        two_hit += has_arrow
    return {
        "patterns": len(keys),
        "centre_location_counts": location_counts,
        "patterns_with_a_two_hit_arrow_in_cap_i": two_hit,
    }


# --------------------------------------------------------------------------
# Smoke tests (Guardrail 1)
# --------------------------------------------------------------------------


def smoke_units(enc: Encoding) -> dict[str, tuple[tuple[int, ...], str]]:
    """The four smoke tests as unit sets with their expected verdict."""

    cell = enc.cell
    i = cell.pair_index
    if cell.arms[i] != "1R":
        raise D1Mu0CensusError("smoke tests need the pair index in the oneRadius arm")
    p = interior(i)
    witness: list[int] = []
    for x in p:
        witness.append(-enc.v("cin", x, i))
        witness.extend(-enc.v("s", x, y) for y in p if y != x)
    for x, y in combinations(p, 2):
        witness.append(-enc.v("samec", x, y))
    other = [k for k in range(3) if k != i]
    l0 = interior_label(other[0], 1)
    m = interior_label(other[1], 1)
    return {
        "i_audit_section4_witness": (tuple(witness), "SAT"),
        "ii_adjacent_slot_arrow": ((enc.v("s", p[0], p[1]),), "UNSAT"),
        "iii_centre_at_apex": ((enc.v("c", p[0], 0),), "UNSAT"),
        "iv_same_centre_different_shells": (
            (enc.v("c", p[0], l0), enc.v("c", p[1], l0), enc.v("s", p[0], m), -enc.v("s", p[1], m)),
            "UNSAT",
        ),
    }


def run_smoke(cell: Cell, client: Piqd, artifacts: Path, args: argparse.Namespace) -> dict[str, Any]:
    enc = build(cell)
    cnf_bytes = enc.cnf.dimacs()
    results: dict[str, Any] = {"cell": cell.name, "tests": {}}
    for name, (units, expected) in smoke_units(enc).items():
        cnf = with_units(cnf_bytes, units)
        (artifacts / f"smoke-{cell.name}-{name}.cnf").write_bytes(cnf)
        manifest = producer_manifest(enc, cnf_bytes, f"smoke:{name}", units)
        prepared, record = client.run_job(cnf, manifest, args.timeout)
        entry: dict[str, Any] = {
            "units": list(units),
            "expected": expected,
            "job": job_summary(record),
            "existing": prepared.get("existing"),
            "passed": record.get("result") == expected,
        }
        if record.get("result") == "SAT":
            pattern = decode(enc, client.model(record["id"]))
            entry["replay_violations"] = replay(pattern)
            entry["pattern"] = pattern.to_json()
            if name.startswith("i_"):
                i = cell.pair_index
                entry["witness_check"] = all(
                    cap_of_interior(pattern.centre[x]) != i
                    and pattern.shell[x] & set(interior(i)) == {x}
                    for x in interior(i)
                ) and len({pattern.centre[x] for x in interior(i)}) == 4
                entry["passed"] = entry["passed"] and entry["witness_check"] and not entry["replay_violations"]
        results["tests"][name] = entry
        print(f"smoke {cell.name} {name}: {record.get('result')} (expected {expected}) job {record.get('id')}", flush=True)
    # cross-check through session assumptions
    _base_prepared, base_record = client.run_job(cnf_bytes, producer_manifest(enc, cnf_bytes, "base"), args.timeout)
    session = client.create_session(base_record["id"], f"{PROJECT_LABEL}:smoke:{cell.name}")
    try:
        for name, (units, expected) in smoke_units(enc).items():
            reply = client.solve(session["id"], units, args.timeout * 1000)
            results["tests"][name]["session_cross_check"] = {
                "status": reply["status"],
                "agrees": reply["status"] == expected,
                "solve_index": reply.get("solve_index"),
            }
    finally:
        client.close_session(session["id"])
    results["session"] = {"id": session["id"], "seed_job": base_record["id"]}
    results["all_passed"] = all(t["passed"] for t in results["tests"].values()) and all(
        t["session_cross_check"]["agrees"] for t in results["tests"].values()
    )
    (artifacts / f"smoke-{cell.name}.json").write_text(
        json.dumps(results, indent=1, sort_keys=True) + "\n", encoding="utf-8"
    )
    return results


# --------------------------------------------------------------------------
# Run manifest and report
# --------------------------------------------------------------------------


def file_digest(path: Path) -> str:
    return sha256_hex(path.read_bytes())


def write_run_manifest(repo: Path, run_root: Path, run_id: str) -> None:
    sources = [
        "census/card_head/d1_mu0_incidence_census.py",
        "census/card_head/tests/test_d1_mu0_incidence_census.py",
    ]
    inputs = ["docs/audits/2026-09-01-d1-mu0-terminal-analysis.md"]
    manifest: dict[str, Any] = {
        "schema": "worktree-run-manifest/v1",
        "lane_id": LANE_ID,
        "run_id": run_id,
        "root": f"scratch/runs/{LANE_ID}/{run_id}",
        "owner": LANE_OWNER,
        "base_head": LANE_BASE_HEAD,
        "created_utc": datetime.now(UTC).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": {p: file_digest(repo / p) for p in sources if (repo / p).exists()},
        "input_digests": {p: file_digest(repo / p) for p in inputs if (repo / p).exists()},
    }
    manifest["manifest_sha256"] = sha256_hex(canonical_json(manifest))
    (run_root / "run_manifest.json").write_text(json.dumps(manifest, indent=1, sort_keys=True) + "\n", encoding="utf-8")


# --------------------------------------------------------------------------
# Report aggregation over an existing run root
# --------------------------------------------------------------------------


def _load_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def _cap_of_name(name: str) -> int | None:
    return None if name.startswith("A") else int(name[1])


def model_statistics(models_path: Path, cell: Cell) -> dict[str, Any]:
    """Aggregate decoded patterns of one enumeration file."""

    i = cell.pair_index
    pair = [label_name(interior_label(i, 1)), label_name(interior_label(i, 2))]
    centre_hist: dict[int, int] = {}
    location: dict[str, dict[str, int]] = {p: {} for p in pair}
    arrow_patterns = 0
    fibre_max: dict[int, int] = {}
    total = 0
    with models_path.open(encoding="utf-8") as handle:
        for line in handle:
            record = json.loads(line)
            pattern = record["pattern"]
            total += 1
            centres = pattern["centre"]
            distinct = len(set(centres.values()))
            centre_hist[distinct] = centre_hist.get(distinct, 0) + 1
            for p in pair:
                c = centres.get(p)
                if c is None:
                    continue
                loc = "own_cap" if _cap_of_name(c) == i else f"cap_{_cap_of_name(c)}"
                location[p][loc] = location[p].get(loc, 0) + 1
            own = [label_name(x) for x in interior(i)]
            has_arrow = any(
                len(set(pattern["shell"].get(x, [])) & set(own)) >= 2 for x in own
            )
            arrow_patterns += has_arrow
            fibres: dict[str, int] = {}
            for c in centres.values():
                fibres[c] = fibres.get(c, 0) + 1
            biggest = max(fibres.values())
            fibre_max[biggest] = fibre_max.get(biggest, 0) + 1
    return {
        "patterns": total,
        "distinct_centre_histogram": dict(sorted(centre_hist.items())),
        "largest_fibre_histogram": dict(sorted(fibre_max.items())),
        "pair_centre_location": location,
        "patterns_with_two_hit_arrow_in_cap_i": arrow_patterns,
    }


def write_report(run_root: Path) -> Path:
    artifacts = run_root / "artifacts"
    results: dict[str, dict[str, dict[str, Any]]] = {}
    for path in sorted(artifacts.glob("*.result.json")):
        name, tag = path.name[: -len(".result.json")].rsplit(".", 1)
        results.setdefault(name, {})[tag] = _load_json(path)
    smokes = [_load_json(path) for path in sorted(artifacts.glob("smoke-*.json"))]
    encodings = {
        path.name[: -len(".encoding.json")]: _load_json(path)
        for path in sorted(artifacts.glob("*.encoding.json"))
    }
    lines: list[str] = []
    add = lines.append
    add("# D1 mu = 0 Stage 1 incidence census at carrier size 15")
    add("")
    add(f"Lane `{LANE_ID}`, run `{run_root.name}`, base head `{LANE_BASE_HEAD}`.")
    add("Encoder `census/card_head/d1_mu0_incidence_census.py`; every solver call went")
    add("through piqd (raw-DIMACS jobs for base verdicts and smoke tests, SAT sessions")
    add("for assumption queries and the blocking-clause enumeration).")
    add("")
    add("**Rigor label: every verdict below is CONJECTURE at the encoded scope** (an")
    add("incidence abstraction at `card = 15`, no metric or cyclic-order content,")
    add("survivor superset because of the omitted binders listed in Section 2). The")
    add("encoding-to-claim map has not been adversarially audited. SAT models are")
    add("`UNRESOLVED_ABSTRACT_MODEL`s; UNSAT verdicts hold only for the encoded clause")
    add("set. Nothing here closes or narrows a Lean obligation.")
    add("")
    add("## 1. Clause inventory and cut-admission records")
    add("")
    rep = encodings.get("i0-1R2R1R-in12") or next(iter(encodings.values()))
    add(f"Representative cell `{rep['cell']['name']}`: {rep['num_vars']} variables, "
        f"{rep['num_clauses']} clauses, CNF sha256 `{rep['cnf_sha256']}`.")
    add("")
    add("| block | class | admission | clauses | Lean sources | antecedent |")
    add("|---|---|---|---|---|---|")
    for block in rep["clause_blocks"]:
        add(
            f"| `{block['block_id']}` | {block['clause_class']} | {block['admission']} | "
            f"{block['clauses']} | {', '.join('`' + s + '`' for s in block['lean_sources'])} | "
            f"{block['antecedent']} |"
        )
    add("")
    add("Admission labels: PROVEN = images a theorem or definition present in the live")
    add("Lean tree; DERIVED = composition of proven facts not compiled in Lean;")
    add("IMPLIED = redundant with other blocks or definitional; SELECTOR = cell")
    add("parameter (arm constructor, slice partition, pair index).")
    add("")
    add("## 2. Omitted binders (the encoding is a survivor superset)")
    add("")
    for item in rep["omitted_binders"]:
        add(f"- {item}")
    add("")
    add("Symmetry: " + rep["symmetry"] + ".")
    add("")
    add("## 3. Smoke tests (Guardrail 1)")
    add("")
    add("| cell | test | expected | job verdict | session verdict | proof blob | job id |")
    add("|---|---|---|---|---|---|---|")
    for smoke in smokes:
        for name, entry in smoke["tests"].items():
            job = entry["job"]
            add(
                f"| `{smoke['cell']}` | {name} | {entry['expected']} | {job['result']} | "
                f"{entry['session_cross_check']['status']} | "
                f"{(job['proof_blob_hash'] or '-')[:16]} | `{job['id']}` |"
            )
    add("")
    add("## 4. Per-cell verdicts (base formula, raw-DIMACS job) and targeted queries")
    add("")
    add("Cells are named `i<pair index>-<arm cap0><arm cap1><arm cap2>-<in12|ax15>`;")
    add("`in12` models the twelve interior shells only (the caller's specification),")
    add("`ax15` also models the three apex shells. Pair index 2 is the sigma-image of")
    add("pair index 1. Target cells are those with the pair index in the oneRadius arm.")
    add("")
    add("Columns: `adjacent arrows` = the six directed same-radius hits between")
    add("adjacent slots of the pair cap (all must be UNSAT in the oneRadius arm by")
    add("`not_mem_selected_support_of_adjacent_interior_slots_of_oneRadius`); `far")
    add("arrows` = the six distance-two-or-three hits; `pair centre combos` = how many")
    add("of the nine (cap of c(P_i.1), cap of c(P_i.2)) placements are SAT; `arrow-free`")
    add("= a pattern with no two-hit arrow in the pair cap exists; `far arrow, pair")
    add("centres outside` = an arrow P_i.3 -> P_i.1 coexists with both pair centres")
    add("outside the pair cap.")
    add("")
    add("| cell | target | verdict | base job | min centres | adjacent arrows | far arrows | pair centre combos | arrow-free | far arrow, pair centres outside |")
    add("|---|---|---|---|---|---|---|---|---|---|")
    for name in sorted(results):
        base = results[name].get("base") or next(iter(results[name].values()))
        cell = parse_cell(name)
        summary = base.get("query_summary", {})
        queries = {q["name"]: q["status"] for q in base.get("queries", [])}
        i = cell.pair_index
        adjacent = {f"arrow_{label_name(interior_label(i, s))}_to_{label_name(interior_label(i, s + 1))}" for s in (1, 2, 3)}
        adjacent |= {f"arrow_{label_name(interior_label(i, s + 1))}_to_{label_name(interior_label(i, s))}" for s in (1, 2, 3)}
        surviving = {q for q in summary.get("surviving_arrows", []) if "with_both" not in q}
        refuted = {q for q in summary.get("refuted_arrows", []) if "with_both" not in q}
        adj_txt = f"{len(surviving & adjacent)} SAT / {len(refuted & adjacent)} UNSAT" if summary else "-"
        far_txt = f"{len(surviving - adjacent)} SAT / {len(refuted - adjacent)} UNSAT" if summary else "-"
        combos = [status for q, status in queries.items() if q.startswith("pair_centres_")]
        combo_txt = f"{combos.count('SAT')} SAT of {len(combos)}" if combos else "-"
        arrow_free = queries.get("no_two_hit_arrow_anywhere_in_pair_cap", "-")
        far_outside = next(
            (status for q, status in queries.items() if "with_both_pair_centres_outside" in q), "-"
        )
        add(
            f"| `{name}` | {'yes' if cell.is_target else 'no'} | {base.get('verdict')} | "
            f"`{base.get('base_job', {}).get('id', '-')}` | {summary.get('minimal_distinct_centres', '-')} | "
            f"{adj_txt} | {far_txt} | {combo_txt} | {arrow_free} | {far_outside} |"
        )
    add("")
    add("## 5. Enumeration (blocking-clause loop in piqd SAT sessions)")
    add("")
    add("Projection `full` blocks on the centre and shell of every modelled point;")
    add("`capi` blocks on the centres of the four pair-cap points and their shells")
    add("restricted to the closed pair cap; `centres` blocks on centres only.")
    add("`sigma_orbits` counts patterns modulo the reflection where it is an")
    add("automorphism of the cell (pair index 0, equal arms at caps 1 and 2); it is")
    add("meaningful only for a complete enumeration.")
    add("")
    add("| cell | projection | status | patterns | sigma orbits | seconds | session | last solve index |")
    add("|---|---|---|---|---|---|---|---|")
    stats_lines: list[str] = []
    for name in sorted(results):
        for tag, record in sorted(results[name].items()):
            for entry in record.get("enumeration", []):
                sessions = record.get("sessions", [])
                sid = sessions[-1]["id"] if sessions else "-"
                add(
                    f"| `{name}` | {entry['projection']} | {entry['status']} | {entry['count']} | "
                    f"{entry['sigma_orbits'] if entry['sigma_orbits'] is not None else '-'} | "
                    f"{entry['elapsed_seconds']} | `{sid}` | {entry['last_solve']} |"
                )
                models_path = artifacts / entry["models_file"]
                if models_path.exists() and entry["projection"] == "full":
                    stats = model_statistics(models_path, parse_cell(name))
                    stats_lines.append(f"### `{name}` ({entry['status']}, {stats['patterns']} full patterns)")
                    stats_lines.append("")
                    stats_lines.append(f"- distinct-centre histogram: {stats['distinct_centre_histogram']}")
                    stats_lines.append(f"- largest-fibre histogram: {stats['largest_fibre_histogram']}")
                    stats_lines.append(f"- centre location of the adjacent pair: {stats['pair_centre_location']}")
                    stats_lines.append(
                        f"- patterns with a two-hit arrow inside the pair cap: "
                        f"{stats['patterns_with_two_hit_arrow_in_cap_i']}"
                    )
                    stats_lines.append("")
                if entry["projection"] == "capi" and "statistics" in entry:
                    stats_lines.append(f"### `{name}` capi projection ({entry['status']}, {entry['count']} patterns)")
                    stats_lines.append("")
                    stats_lines.append(f"- {json.dumps(entry['statistics'])}")
                    stats_lines.append("")
    add("")
    add("### Statistics over the enumerated patterns")
    add("")
    add("For a capped enumeration these are statistics of the first `cap` patterns")
    add("the solver produced, not of the whole survivor set; the assumption queries")
    add("in Section 4 are the exact instrument for location and arrow questions.")
    add("")
    lines.extend(stats_lines)
    closure_rows: list[str] = []
    cl0_unsat = oracle_unsat = closure_cells = 0
    for name in sorted(results):
        for tag, record in sorted(results[name].items()):
            if not record.get("closure_oracle") and not record.get("cl0_static_block"):
                continue
            closure_cells += 1
            base_verdict = record.get("verdict")
            if base_verdict == "UNSAT":
                cl0_unsat += 1
            entries = record.get("enumeration", [])
            closure = entries[0].get("closure", {}) if entries else {}
            status = entries[0]["status"] if entries else "-"
            if status == "complete" and closure.get("survivors", 0) == 0 and base_verdict == "SAT":
                oracle_unsat += 1
            cert = closure.get("certification") or {}
            cert_job = cert.get("job", {})
            base_job = record.get("base_job", {})
            proof = base_job.get("proof_blob_hash") if base_verdict == "UNSAT" else cert_job.get("proof_blob_hash")
            closure_rows.append(
                f"| `{name}` | {'on' if record.get('cl0_static_block') else 'off'} | {base_verdict} | "
                f"`{base_job.get('id', '-')}` | {status} | {closure.get('cuts', '-')} | "
                f"{closure.get('survivors', '-')} | {closure.get('chain_length_histogram', '-')} | "
                f"{cert.get('formula', '-')} | `{cert_job.get('id', '-')}` | "
                f"{cert_job.get('result', '-')} | {(proof or '-')[:16]} |"
            )
    if closure_rows:
        add("## 5b. Stage 1b: distance-equality closure (CL0 static block, CL1 oracle)")
        add("")
        add("`base verdict` is the raw-DIMACS job on the base formula (with CL0 when on);")
        add("`status` is the session loop outcome (`complete` = UNSAT reached); `cuts` are")
        add("CL1 explanation clauses (block `CL1_distance_equality_closure`, DERIVED_CUT,")
        add("PROVEN); `survivors` are closure-consistent full patterns; the certification")
        add("job re-solves base + cuts (+ survivor blocks) from scratch for an LRAT proof.")
        add("")
        add(f"Cells with closure: {closure_cells}; UNSAT from CL0 alone (base job): "
            f"{cl0_unsat}; UNSAT only after the CL1 oracle: {oracle_unsat}.")
        add("")
        total_cuts = total_survivors = 0
        length_totals: dict[int, int] = {}
        for record_map in results.values():
            for record in record_map.values():
                for entry in record.get("enumeration", []):
                    closure = entry.get("closure")
                    if not closure:
                        continue
                    total_cuts += closure["cuts"]
                    total_survivors += closure["survivors"]
                    for length, count in closure["chain_length_histogram"].items():
                        length_totals[int(length)] = length_totals.get(int(length), 0) + count
        add(f"Totals over these cells: {total_cuts} CL1 cuts, {total_survivors} closure-consistent "
            f"survivors; CL1 chain-length totals {dict(sorted(length_totals.items()))}.")
        add("")
        add("Convergence note: the static block CL0 is the direct encoding of every")
        add("chain of length two (two objects plus the target object), and no CL1 cut of")
        add("length two was produced while CL0 was on. A static encoding of length-three")
        add("chains would replace the length-three cuts (ordered quadruples of objects,")
        add("about 18^4 clauses of eight literals) but not the longer ones. It would not")
        add("change the outcome: the loops stop at the cap because closure-consistent")
        add("survivors dominate the iterations, not because the oracle keeps cutting;")
        add("the distance-equality closure alone does not refute any cell at this scope.")
        add("")
        add("| cell | CL0 | base verdict | base job | loop status | CL1 cuts | survivors | chain lengths | certified formula | certification job | result | proof |")
        add("|---|---|---|---|---|---|---|---|---|---|---|---|")
        lines.extend(closure_rows)
        add("")
    add("## 6. Defects and notes")
    add("")
    defects = [
        f"`{name}`/{tag}: {d}"
        for name in results
        for tag, record in results[name].items()
        for d in record.get("defects", [])
    ]
    if defects:
        lines.extend(f"- {d}" for d in defects)
    else:
        add("- No piqd defect was observed: every prepare-cnf, confirm, status, model,")
        add("  session create/solve/clauses/close request returned the documented shape.")
    add("- The lane checkpoint `.codex/worktree-checkpoints/d1-triapex-plan-20260901.json`")
    add("  does not yet declare this run root in `generated_roots` nor the encoder and")
    add("  test files in `owned_paths`; the lane owner must add them before staging.")
    add("")
    path = run_root / "artifacts" / "REPORT.md"
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return path


def parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--cell", default="targets", help="targets | all | comma-separated cell names")
    parser.add_argument("--apex-shells", choices=("off", "on", "both"), default="off")
    parser.add_argument("--enumerate", choices=("none",) + PROJECTIONS + ("all",), default="none")
    parser.add_argument("--cap", type=int, default=3000)
    parser.add_argument("--budget-seconds", type=float, default=900.0)
    parser.add_argument("--timeout", type=int, default=120, help="per piqd solve, seconds")
    parser.add_argument("--out-dir", default=None, help="run root; default scratch/runs/<lane>/<run-id>")
    parser.add_argument("--run-id", default="stage1-incidence-01")
    parser.add_argument("--tag", default="run", help="pass label used in per-cell artifact names")
    parser.add_argument("--server", default=DEFAULT_SERVER)
    parser.add_argument("--smoke", action="store_true")
    parser.add_argument("--queries", action="store_true")
    parser.add_argument("--dry-run", action="store_true", help="emit CNF and encoding records only")
    parser.add_argument("--report", action="store_true", help="only aggregate an existing run root into REPORT.md")
    parser.add_argument("--cl0", action="store_true", help="add the static CL0 equilateral closure block")
    parser.add_argument("--closure", action="store_true", help="run the CL1 distance-equality closure oracle in the loop")
    return parser.parse_args(argv)


def select_cells(args: argparse.Namespace) -> tuple[Cell, ...]:
    variants = {"off": (False,), "on": (True,), "both": (False, True)}[args.apex_shells]
    if args.cell in ("targets", "all"):
        cells = [cell for ax in variants for cell in all_cells(ax)]
        if args.cell == "targets":
            cells = [cell for cell in cells if cell.is_target]
        return tuple(cells)
    return tuple(parse_cell(name.strip()) for name in args.cell.split(","))


def main(argv: Sequence[str] | None = None) -> int:
    args = parse_args(argv)
    repo = Path(__file__).resolve().parents[2]
    run_root = Path(args.out_dir) if args.out_dir else repo / "scratch" / "runs" / LANE_ID / args.run_id
    artifacts = run_root / "artifacts"
    for sub in ("artifacts", "events", "tmp"):
        (run_root / sub).mkdir(parents=True, exist_ok=True)
    if args.report:
        path = write_report(run_root)
        write_run_manifest(repo, run_root, args.run_id)
        print(f"report written to {path}")
        return 0
    client = None if args.dry_run else Piqd(args.server, http_timeout=max(60.0, args.timeout + 60.0))
    daemon = client.version() if client is not None else None
    results: dict[str, Any] = {
        "schema": SCHEMA + "/run",
        "run_id": args.run_id,
        "tag": args.tag,
        "daemon": daemon,
        "arguments": vars(args),
        "cells": [],
        "smoke": [],
    }
    cells = select_cells(args)
    if args.smoke and client is not None:
        for cell in cells:
            if cell.is_target:
                results["smoke"].append(run_smoke(cell, client, artifacts, args))
    for cell in cells:
        run = CellRun(cell, client, artifacts, args)
        try:
            results["cells"].append(run.run())
        finally:
            run.close()
        (artifacts / f"{cell.name}.{args.tag}.result.json").write_text(
            json.dumps(run.result, indent=1, sort_keys=True) + "\n", encoding="utf-8"
        )
    if client is not None:
        results["endpoint_trace_counts"] = {
            key: sum(1 for t in client.trace if t["method"] + " " + t["target"].split("/")[1] == key)
            for key in sorted({t["method"] + " " + t["target"].split("/")[1] for t in client.trace})
        }
    summary_path = artifacts / f"summary-{args.tag}-{datetime.now(UTC).strftime('%Y%m%dT%H%M%SZ')}.json"
    summary_path.write_text(json.dumps(results, indent=1, sort_keys=True) + "\n", encoding="utf-8")
    write_run_manifest(repo, run_root, args.run_id)
    print(f"summary written to {summary_path}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
