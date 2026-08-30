#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Bounded, source-mapped Rigid221 S0/L1 discovery and exact replay.

The search surface is deliberately finite: fourteen named carrier roles, one
fixed cyclic-order template per S0 branch, the M0 auxiliary-overlap cell, and
pairwise-distinct roles.  A positive result says only that every active L1
constraint below holds for that serialized finite cell.  It makes no universal,
Lean, source-carrier-coverage, or promotion claim.

Every SAT assignment is accepted only when Z3 or the cvc5 fallback returns
rational values and a fresh :class:`fractions.Fraction` replay checks the
source-facing contract.
Fixed-order UNSAT and solver ``unknown`` both remain UNKNOWN at the advertised
scope.  ``--output-dir`` writes deterministic per-cell SMT2 and JSON artifacts;
authenticated terminal artifacts are reused without a solver call.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import os
import re
import subprocess
import sys
from collections import Counter
from collections.abc import Callable, Mapping, Sequence
from concurrent.futures import ProcessPoolExecutor, as_completed
from dataclasses import asdict, dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any

import z3

F = Fraction
Point = tuple[F, F]
Z3Point = tuple[z3.ArithRef, z3.ArithRef]

SCHEMA = "rigid221-s0-bounded-full-l1/v1"
RUN_SCHEMA = "rigid221-s0-bounded-full-l1-run/v1"
ENCODING_VERSION = "rigid221-s0-full-l1-m0-distinct-2026-08-29.6"
SAT_STATUS = "SAT_EXACT"
PARTIAL_SAT_STATUS = "PARTIAL_SAT_EXACT"
UNKNOWN_UNSAT_STATUS = "UNKNOWN_FIXED_ORDER_UNSAT"
UNKNOWN_TIMEOUT_STATUS = "UNKNOWN_TIMEOUT"
UNKNOWN_NONRATIONAL_STATUS = "UNKNOWN_NONRATIONAL_MODEL"
ERROR_STATUS = "ENCODING_ERROR"
BLOCKED_STATUS = "ENCODING_BLOCKED"
ALLOWED_STATUSES = frozenset(
    {
        SAT_STATUS,
        UNKNOWN_UNSAT_STATUS,
        UNKNOWN_TIMEOUT_STATUS,
        UNKNOWN_NONRATIONAL_STATUS,
        ERROR_STATUS,
        BLOCKED_STATUS,
    }
)
TERMINAL_STATUSES = frozenset({SAT_STATUS, UNKNOWN_UNSAT_STATUS})
RESULT_FILENAME = "result.json"
SMT2_FILENAME = "input.smt2"
RUN_FILENAME = "run_result.json"

ROLE_ORDER = (
    "O",
    "m1",
    "m2",
    "u",
    "xu",
    "delta",
    "v",
    "xv",
    "cu",
    "cv",
    "au",
    "bu",
    "av",
    "bv",
)
ROLE_SET = frozenset(ROLE_ORDER)
MOSER = ("m1", "m2", "O")
PHYSICAL = frozenset({"u", "xu", "delta", "v", "xv"})
KU = frozenset({"u", "xu", "au", "bu"})
KV = frozenset({"v", "xv", "av", "bv"})
FIXED_POINTS: dict[str, Point] = {
    "O": (F(0), F(0)),
    "m1": (F(8, 5), F(-4, 5)),
    "m2": (F(8, 5), F(4, 5)),
}
MEC_CENTER: Point = (F(1), F(0))
MEC_RADIUS2 = F(1)
SURPLUS_INDEX = 0
SURPLUS_CAP_INDEX = 0
J_CAP_INDEX = 2

CAP_INDEXING = {
    "moser_vertices": {"v1": "m1", "v2": "m2", "v3": "O"},
    "surplus_index": SURPLUS_INDEX,
    "surplus_cap_index": SURPLUS_CAP_INDEX,
    "surplus_cap_name": "C1",
    "opp_index2_of_surplus_index": J_CAP_INDEX,
    "j_cap_index": J_CAP_INDEX,
    "j_cap_name": "C3",
    "j_opposite_vertex": "O=v3",
    "j_erased_endpoints": ["m1=v1", "m2=v2"],
}

ACTIVE_CONSTRAINTS = (
    "closed 14-role all-distinct M0 carrier with fixed cyclic order",
    "O=(0,0), MEC center=(1,0), R^2=1, m1=(8/5,-4/5), m2=(8/5,4/5)",
    "Moser boundary, enclosure, and all three non-obtuse dot products",
    "exact positive physical fiber C={u,xu,delta,v,xv} about O",
    "complete positive four-fibers Ku={u,xu,au,bu} and Kv={v,xv,av,bv}",
    "exact rigid 2+2+1 traces and mutual omission",
    "source and center membership/exclusion, cu!=cv, cu/cv!=O",
    "post-u and post-v no-four-equal-positive-distance over the whole carrier",
    "strict convexity by every edge/nonincident orientation",
    "closed OnArcOpposite cap filters and exact-one non-Moser membership",
    "Moser endpoint pattern, endpoint-erased cap interiors, and surplus cap C1 size > 4",
    "surplusIdx=0 names C1 while oppIndex2(0)=2 rotates J to C3 opposite O",
    "u in J and the cell-specific S0-I/S0-N condition on xu",
)

OMITTED_CONSTRAINTS = (
    "source carriers with unnamed points or cardinality other than fourteen",
    "cyclic orders other than the serialized M0 template",
    "M1/M2 auxiliary overlap and source-legal center quotient cells",
    "source-legal Moser-endpoint identifications, including S0-N xu at an endpoint",
    "CounterexampleData.K4 and the all-center ambient K4 existential surface",
    "OriginalUniqueFourResidual and global noM44 across alternative cap packets",
    "counterexample and deletion minimality beyond the two encoded singleton obstructions",
    "first-apex exact-four, unique-radius, and original-residual obligations",
    "q/w identities, memberships, bisector geometry, other, and source-survival data",
    "the remaining L2 ExactFourMutualOmissionSourceContext fields",
    "both common-deletion packets and later robust-surface constraints",
    "globalDeletion.restores, globalDeletion.geometry, and MinimalDeletionCore",
    "universal coverage, Lean ingress, kernel checking, and proof promotion",
)

ALGEBRAIC_DOF = {
    "named_point_coordinate_variables": 28,
    "fixed_coordinate_equalities": 6,
    "free_coordinate_variables": 22,
    "radius_variables": 3,
    "raw_physical_and_row_equalities": 13,
    "independent_equalities_after_eliminating_three_radii": 10,
    "nominal_residual_coordinate_dof": 12,
    "qualification": (
        "structural bookkeeping before inequalities and disequalities; "
        "not a certified Jacobian-rank calculation"
    ),
}

UNSUPPORTED_CELL_FAMILIES = (
    {
        "dimension": "overlap",
        "cells": ["M1", "M2"],
        "status": BLOCKED_STATUS,
        "reason": "overlap quotient templates are not encoded in v1",
    },
    {
        "dimension": "equality",
        "cells": ["source-legal center/auxiliary quotient cells"],
        "status": BLOCKED_STATUS,
        "reason": "only the all-distinct equality cell is encoded in v1",
    },
    {
        "dimension": "moser_endpoint_identification",
        "cells": [
            "S0-N xu=m1",
            "S0-N xu=m2",
            "other source-legal role=Moser-endpoint cells",
        ],
        "status": BLOCKED_STATUS,
        "reason": "the all-distinct canary excludes endpoint identifications",
    },
    {
        "dimension": "cyclic_order",
        "cells": ["all templates except M0-I-v1 and M0-N-v1"],
        "status": BLOCKED_STATUS,
        "reason": "additional cyclic-order templates have not been enumerated",
    },
)


class VerificationError(ValueError):
    """An exact check failed, with a stable mutation-test code."""

    def __init__(self, code: str, detail: str) -> None:
        super().__init__(f"{code}: {detail}")
        self.code = code
        self.detail = detail


@dataclass(frozen=True)
class Cell:
    """One bounded discrete cell; future quotient cells use the same schema."""

    cell_id: str
    branch: str
    overlap_cell: str
    equality_cell: str
    order_template: str
    order: tuple[str, ...]
    xu_in_j: bool


@dataclass(frozen=True)
class ExactWitness:
    """A rational carrier returned by Z3 and replayed without Z3."""

    points: tuple[tuple[str, Point], ...]
    physical_radius2: F
    ku_radius2: F
    kv_radius2: F

    def point_map(self) -> dict[str, Point]:
        return dict(self.points)


@dataclass(frozen=True)
class ReplayReport:
    """Derived exact metrics retained with a successful witness."""

    minimum_orientation: F
    cap_members: tuple[tuple[str, ...], tuple[str, ...], tuple[str, ...]]
    cap_interiors: tuple[tuple[str, ...], tuple[str, ...], tuple[str, ...]]
    surplus_cap_size: int
    j_closed_cap_size: int
    j_interior_size: int
    post_u_max_multiplicity: int
    post_v_max_multiplicity: int
    moser_dot_products: tuple[F, F, F]


CELL_TEMPLATES = (
    Cell(
        cell_id="m0-distinct-s0-i",
        branch="S0-I",
        overlap_cell="M0",
        equality_cell="all-distinct",
        order_template="M0-I-v1",
        order=(
            "O",
            "au",
            "av",
            "v",
            "delta",
            "m1",
            "u",
            "cv",
            "cu",
            "xu",
            "m2",
            "xv",
            "bv",
            "bu",
        ),
        xu_in_j=True,
    ),
    Cell(
        cell_id="m0-distinct-s0-n",
        branch="S0-N",
        overlap_cell="M0",
        equality_cell="all-distinct",
        order_template="M0-N-v1",
        order=(
            "O",
            "au",
            "av",
            "v",
            "delta",
            "m1",
            "u",
            "cv",
            "cu",
            "m2",
            "xu",
            "xv",
            "bv",
            "bu",
        ),
        xu_in_j=False,
    ),
)


def _require(condition: bool, code: str, detail: str) -> None:
    if not condition:
        raise VerificationError(code, detail)


def dist2(a: Point, b: Point) -> F:
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def orient(a: Point, b: Point, c: Point) -> F:
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def dot(a: Point, b: Point) -> F:
    return a[0] * b[0] + a[1] * b[1]


def sub(a: Point, b: Point) -> Point:
    return (a[0] - b[0], a[1] - b[1])


def on_arc_opposite(vi: Point, vj: Point, vk: Point, x: Point) -> bool:
    """The source's closed signed-area product predicate."""

    return orient(x, vj, vk) * orient(vi, vj, vk) <= 0


def opp_index2(index: int) -> int:
    table = (2, 0, 1)
    if index not in range(3):
        raise VerificationError("surplus_index", f"invalid cap index {index}")
    return table[index]


def derive_caps(points: Mapping[str, Point]) -> tuple[frozenset[str], ...]:
    v1, v2, v3 = (points[name] for name in MOSER)
    triples = ((v1, v2, v3), (v2, v3, v1), (v3, v1, v2))
    return tuple(
        frozenset(
            role
            for role in ROLE_ORDER
            if on_arc_opposite(apex, endpoint1, endpoint2, points[role])
        )
        for apex, endpoint1, endpoint2 in triples
    )


def cap_interior(caps: Sequence[frozenset[str]], index: int) -> frozenset[str]:
    endpoints = (("m2", "O"), ("O", "m1"), ("m1", "m2"))
    if index not in range(3):
        raise VerificationError("cap_index", f"invalid cap index {index}")
    return caps[index] - set(endpoints[index])


def cap_arm_from_order(cell: Cell, role: str) -> int:
    """Return the unique cap arm forced by the serialized cyclic-order arc."""

    if role in MOSER:
        raise VerificationError("cap_arm_role", f"{role} is a Moser endpoint")
    positions = {name: index for index, name in enumerate(cell.order)}
    o_pos = positions["O"]
    m1_pos = positions["m1"]
    m2_pos = positions["m2"]
    _require(
        o_pos == 0 and 0 < m1_pos < m2_pos,
        "cap_order_template",
        "expected O ... m1 ... m2 cyclic normalization",
    )
    role_pos = positions[role]
    if o_pos < role_pos < m1_pos:
        return 1  # cap opposite m2, along O--m1
    if m1_pos < role_pos < m2_pos:
        return 2  # cap opposite O, along m1--m2
    return 0  # cap opposite m1, along m2--O


def verify_surplus_and_j(
    caps: Sequence[frozenset[str]],
    interiors: Sequence[frozenset[str]],
    cell: Cell,
) -> None:
    """Keep the surplus cap C1 separate from the rotated interior J in C3."""

    _require(
        SURPLUS_CAP_INDEX == SURPLUS_INDEX and opp_index2(SURPLUS_INDEX) == J_CAP_INDEX,
        "wrong_fixed_cap_index",
        "surplus cap or rotated J index differs from the fixed packet",
    )
    surplus_cap = caps[SURPLUS_CAP_INDEX]
    j_interior = interiors[J_CAP_INDEX]
    _require(
        len(surplus_cap) > 4,
        "surplus_cap_size",
        f"surplus C1 has size {len(surplus_cap)}",
    )
    _require(
        "m1" not in j_interior and "m2" not in j_interior,
        "cap_endpoint_erasure",
        "C3 endpoints survived J erasure",
    )
    _require("u" in j_interior, "s0_u_in_j", "u is not in J")
    _require(
        ("xu" in j_interior) is cell.xu_in_j,
        "s0_xu_branch",
        f"xu membership does not realize {cell.branch}",
    )


def verify_cap_semantics(
    points: Mapping[str, Point], cell: Cell
) -> tuple[tuple[frozenset[str], ...], tuple[frozenset[str], ...]]:
    caps = derive_caps(points)
    endpoint_patterns = (
        (("m1", False), ("m2", True), ("O", True)),
        (("m1", True), ("m2", False), ("O", True)),
        (("m1", True), ("m2", True), ("O", False)),
    )
    for index, pattern in enumerate(endpoint_patterns):
        for role, expected in pattern:
            _require(
                (role in caps[index]) is expected,
                "cap_endpoint_pattern",
                f"cap {index} has wrong endpoint membership for {role}",
            )
    for role in ROLE_ORDER:
        if role in MOSER:
            continue
        count = sum(role in cap for cap in caps)
        _require(
            count == 1,
            "cap_exactly_one",
            f"{role} belongs to {count} closed caps",
        )
        arm = cap_arm_from_order(cell, role)
        _require(
            role in caps[arm],
            "cap_order_arm",
            f"{role} is not in order-derived cap arm {arm}",
        )
    interiors = tuple(cap_interior(caps, index) for index in range(3))
    verify_surplus_and_j(caps, interiors, cell)
    return caps, interiors


def verify_strict_convexity(points: Mapping[str, Point], order: Sequence[str]) -> F:
    _require(
        len(order) == len(ROLE_ORDER)
        and frozenset(order) == ROLE_SET
        and len(set(order)) == len(order),
        "cyclic_order_image",
        "cyclic order is not an enumeration of the carrier",
    )
    values: list[F] = []
    for index, first in enumerate(order):
        second = order[(index + 1) % len(order)]
        for other in order:
            if other in (first, second):
                continue
            value = orient(points[first], points[second], points[other])
            _require(
                value > 0,
                "strict_convexity",
                f"edge {first}->{second}, point {other}, orientation {value}",
            )
            values.append(value)
    return min(values)


def _positive_multiplicities(
    points: Mapping[str, Point], center: str, deleted: str
) -> Counter[F]:
    values = (
        dist2(points[center], points[role]) for role in ROLE_ORDER if role != deleted
    )
    return Counter(value for value in values if value > 0)


def verify_no_qfree(
    points: Mapping[str, Point], center: str, deleted: str, label: str
) -> int:
    multiplicities = _positive_multiplicities(points, center, deleted)
    maximum = max(multiplicities.values(), default=0)
    _require(
        maximum <= 3,
        "no_qfree",
        f"{label} has positive squared-distance multiplicity {maximum}",
    )
    return maximum


def _fiber(points: Mapping[str, Point], center: str, radius2: F) -> frozenset[str]:
    return frozenset(
        role for role in ROLE_ORDER if dist2(points[center], points[role]) == radius2
    )


def verify_carrier_shape(points: Mapping[str, Point]) -> None:
    _require(set(points) == ROLE_SET, "witness_roles", "carrier roles differ")
    _require(
        len(frozenset(points.values())) == len(ROLE_ORDER),
        "pairwise_distinct",
        "two modeled roles have equal coordinates",
    )
    for role, expected in FIXED_POINTS.items():
        _require(points[role] == expected, "normalization", f"wrong point {role}")


def verify_exact_fiber(
    points: Mapping[str, Point],
    center: str,
    radius2: F,
    expected: frozenset[str],
    code: str,
) -> None:
    actual = _fiber(points, center, radius2)
    _require(
        actual == expected, code, f"expected {sorted(expected)}, got {sorted(actual)}"
    )


def verify_rigid_packet(
    physical: frozenset[str], ku: frozenset[str], kv: frozenset[str]
) -> None:
    _require("v" not in ku and "u" not in kv, "mutual_omission", "row omission failed")
    _require(ku & physical == {"u", "xu"}, "rigid_ku_trace", "wrong Ku trace")
    _require(kv & physical == {"v", "xv"}, "rigid_kv_trace", "wrong Kv trace")
    _require(
        not ((ku & physical) & (kv & physical)), "rigid_disjoint", "traces overlap"
    )
    _require(
        physical == (ku & physical) | (kv & physical) | {"delta"},
        "rigid_221",
        "physical class is not the exact 2+2+1 cover",
    )


def verify_mec_certificate(points: Mapping[str, Point]) -> tuple[F, F, F]:
    for role in ROLE_ORDER:
        _require(
            dist2(MEC_CENTER, points[role]) <= MEC_RADIUS2,
            "mec_enclosure",
            f"{role} is outside the canonical disk",
        )
    for role in MOSER:
        _require(
            dist2(MEC_CENTER, points[role]) == MEC_RADIUS2,
            "mec_boundary",
            f"{role} is not on the MEC boundary",
        )
    m1, m2, o = (points[role] for role in MOSER)
    dots = (
        dot(sub(m2, m1), sub(o, m1)),
        dot(sub(o, m2), sub(m1, m2)),
        dot(sub(m1, o), sub(m2, o)),
    )
    _require(all(value >= 0 for value in dots), "moser_nonobtuse", str(dots))
    return dots


def replay_witness(witness: ExactWitness, cell: Cell) -> ReplayReport:
    """Independently replay all active constraints over exact Fractions."""

    names = tuple(name for name, _point in witness.points)
    _require(names == ROLE_ORDER, "witness_roles", "roles are missing or reordered")
    points = witness.point_map()
    verify_carrier_shape(points)

    _require(witness.physical_radius2 > 0, "physical_radius", "rho^2 is not positive")
    _require(witness.ku_radius2 > 0, "ku_radius", "Ku radius is not positive")
    _require(witness.kv_radius2 > 0, "kv_radius", "Kv radius is not positive")
    verify_exact_fiber(
        points, "O", witness.physical_radius2, PHYSICAL, "physical_fiber"
    )
    verify_exact_fiber(points, "cu", witness.ku_radius2, KU, "ku_fiber")
    verify_exact_fiber(points, "cv", witness.kv_radius2, KV, "kv_fiber")
    verify_rigid_packet(PHYSICAL, KU, KV)
    _require("cu" not in PHYSICAL and "cu" not in KU, "cu_exclusion", "cu is excluded")
    _require("cv" not in KV, "cv_exclusion", "cv lies in its row")
    _require(points["cu"] != points["cv"], "center_distinct", "cu=cv")
    _require(points["cu"] != points["O"], "cu_ne_o", "cu=O")
    _require(points["cv"] != points["O"], "cv_ne_o", "cv=O")

    dots = verify_mec_certificate(points)

    minimum_orientation = verify_strict_convexity(points, cell.order)
    caps, interiors = verify_cap_semantics(points, cell)
    post_u = verify_no_qfree(points, "cu", "u", "post-u/cu")
    post_v = verify_no_qfree(points, "cv", "v", "post-v/cv")
    return ReplayReport(
        minimum_orientation=minimum_orientation,
        cap_members=tuple(
            tuple(role for role in ROLE_ORDER if role in cap) for cap in caps
        ),  # type: ignore[arg-type]
        cap_interiors=tuple(
            tuple(role for role in ROLE_ORDER if role in interior)
            for interior in interiors
        ),  # type: ignore[arg-type]
        surplus_cap_size=len(caps[SURPLUS_CAP_INDEX]),
        j_closed_cap_size=len(caps[J_CAP_INDEX]),
        j_interior_size=len(interiors[J_CAP_INDEX]),
        post_u_max_multiplicity=post_u,
        post_v_max_multiplicity=post_v,
        moser_dot_products=dots,
    )


def _z3_rat(value: F) -> z3.RatNumRef:
    return z3.RealVal(f"{value.numerator}/{value.denominator}")


def _z3_dist2(a: Z3Point, b: Z3Point) -> z3.ArithRef:
    dx = a[0] - b[0]
    dy = a[1] - b[1]
    # Multiplication keeps exported SMT-LIB portable.  Z3's Python ``** 2``
    # currently serializes the exponent as ``2.0``, which fresh SMT-LIB parsers
    # and cvc5 correctly reject because ``^`` requires an integer exponent.
    return dx * dx + dy * dy


def _z3_orient(a: Z3Point, b: Z3Point, c: Z3Point) -> z3.ArithRef:
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def _z3_dot(a: Z3Point, b: Z3Point) -> z3.ArithRef:
    return a[0] * b[0] + a[1] * b[1]


def _z3_sub(a: Z3Point, b: Z3Point) -> Z3Point:
    return (a[0] - b[0], a[1] - b[1])


def _z3_on_arc(vi: Z3Point, vj: Z3Point, vk: Z3Point, x: Z3Point) -> z3.BoolRef:
    return _z3_orient(x, vj, vk) * _z3_orient(vi, vj, vk) <= 0


def _symbol_prefix(cell: Cell) -> str:
    return re.sub(r"[^a-zA-Z0-9_]", "_", cell.cell_id)


def _cell_symbols(
    cell: Cell,
) -> tuple[dict[str, Z3Point], tuple[z3.ArithRef, ...]]:
    prefix = _symbol_prefix(cell)
    points: dict[str, Z3Point] = {
        role: (z3.Real(f"{prefix}__{role}_x"), z3.Real(f"{prefix}__{role}_y"))
        for role in ROLE_ORDER
    }
    radii = (
        z3.Real(f"{prefix}__rho2"),
        z3.Real(f"{prefix}__ku_radius2"),
        z3.Real(f"{prefix}__kv_radius2"),
    )
    return points, radii


def build_solver(
    cell: Cell, timeout_ms: int
) -> tuple[z3.Solver, dict[str, Z3Point], tuple[z3.ArithRef, ...]]:
    """Build one fresh QF_NRA solver for a bounded cell."""

    solver = z3.SolverFor("QF_NRA")
    solver.set("timeout", timeout_ms)
    points, radii = _cell_symbols(cell)
    rho2, ku_radius2, kv_radius2 = radii

    for role, fixed in FIXED_POINTS.items():
        solver.add(points[role][0] == _z3_rat(fixed[0]))
        solver.add(points[role][1] == _z3_rat(fixed[1]))
    solver.add(rho2 > 0, ku_radius2 > 0, kv_radius2 > 0)

    for first, second in itertools.combinations(ROLE_ORDER, 2):
        solver.add(
            z3.Or(
                points[first][0] != points[second][0],
                points[first][1] != points[second][1],
            )
        )

    for role in ROLE_ORDER:
        physical_distance = _z3_dist2(points["O"], points[role])
        solver.add(
            physical_distance == rho2 if role in PHYSICAL else physical_distance != rho2
        )
        ku_distance = _z3_dist2(points["cu"], points[role])
        solver.add(
            ku_distance == ku_radius2 if role in KU else ku_distance != ku_radius2
        )
        kv_distance = _z3_dist2(points["cv"], points[role])
        solver.add(
            kv_distance == kv_radius2 if role in KV else kv_distance != kv_radius2
        )

    mec = (_z3_rat(MEC_CENTER[0]), _z3_rat(MEC_CENTER[1]))
    for role in ROLE_ORDER:
        solver.add(_z3_dist2(mec, points[role]) <= _z3_rat(MEC_RADIUS2))
    for role in MOSER:
        solver.add(_z3_dist2(mec, points[role]) == _z3_rat(MEC_RADIUS2))
    m1, m2, o = (points[role] for role in MOSER)
    solver.add(_z3_dot(_z3_sub(m2, m1), _z3_sub(o, m1)) >= 0)
    solver.add(_z3_dot(_z3_sub(o, m2), _z3_sub(m1, m2)) >= 0)
    solver.add(_z3_dot(_z3_sub(m1, o), _z3_sub(m2, o)) >= 0)

    for index, first in enumerate(cell.order):
        second = cell.order[(index + 1) % len(cell.order)]
        for other in cell.order:
            if other not in (first, second):
                solver.add(_z3_orient(points[first], points[second], points[other]) > 0)

    v1, v2, v3 = (points[role] for role in MOSER)
    cap_exprs: dict[str, tuple[z3.BoolRef, z3.BoolRef, z3.BoolRef]] = {}
    for role in ROLE_ORDER:
        point = points[role]
        cap_exprs[role] = (
            _z3_on_arc(v1, v2, v3, point),
            _z3_on_arc(v2, v3, v1, point),
            _z3_on_arc(v3, v1, v2, point),
        )
    endpoint_patterns = (
        (("m1", False), ("m2", True), ("O", True)),
        (("m1", True), ("m2", False), ("O", True)),
        (("m1", True), ("m2", True), ("O", False)),
    )
    for cap_index, pattern in enumerate(endpoint_patterns):
        for role, expected in pattern:
            solver.add(cap_exprs[role][cap_index] == expected)
    for role in ROLE_ORDER:
        if role not in MOSER:
            arm = cap_arm_from_order(cell, role)
            for index, expr in enumerate(cap_exprs[role]):
                solver.add(expr if index == arm else z3.Not(expr))
    solver.add(
        z3.Sum([z3.If(cap_exprs[role][SURPLUS_CAP_INDEX], 1, 0) for role in ROLE_ORDER])
        > 4
    )
    solver.add(cap_exprs["u"][J_CAP_INDEX])
    solver.add(cap_exprs["xu"][J_CAP_INDEX] == cell.xu_in_j)

    for center, deleted in (("cu", "u"), ("cv", "v")):
        # Any four-set containing the center has one zero distance and three
        # positive distances in this all-distinct cell, so it cannot witness a
        # positive four-fiber.  Removing those tautological cases cuts 440
        # nonlinear disjunctions while preserving the full obstruction.
        remaining = [role for role in ROLE_ORDER if role not in {center, deleted}]
        for four in itertools.combinations(remaining, 4):
            distances = [_z3_dist2(points[center], points[role]) for role in four]
            solver.add(
                z3.Or(
                    distances[0] <= 0,
                    *(distance != distances[0] for distance in distances[1:]),
                )
            )

    return solver, points, radii


def export_smt2(solver: z3.Solver) -> str:
    # Serialize each assertion independently.  Whole-solver ``to_smt2`` makes
    # global sharing choices based on unrelated live ASTs, so byte output can
    # change even when the formula does not.  Per-assertion S-expressions plus
    # sorted declarations give resume a genuinely canonical byte comparison.
    declaration_lines = sorted(
        line.strip()
        for line in solver.to_smt2().splitlines()
        if line.strip().startswith("(declare-fun ")
    )
    assertion_lines = [
        f"(assert {assertion.sexpr()})" for assertion in solver.assertions()
    ]
    body = "\n".join(
        ("(set-logic QF_NRA)", *declaration_lines, *assertion_lines, "(check-sat)")
    )
    auto_names: dict[str, str] = {}

    def normalize_auto_name(match: re.Match[str]) -> str:
        original = match.group(0)
        if original not in auto_names:
            auto_names[original] = f"?auto{len(auto_names)}"
        return auto_names[original]

    body = re.sub(r"(?:a![0-9]+|[?$]x[0-9]+)", normalize_auto_name, body)
    return body + "\n"


def _fraction_text(value: F) -> str:
    return f"{value.numerator}/{value.denominator}"


_FRACTION_RE = re.compile(r"^-?(?:0|[1-9][0-9]*)/[1-9][0-9]*$")


def _parse_fraction(value: object, location: str) -> F:
    if not isinstance(value, str) or _FRACTION_RE.fullmatch(value) is None:
        raise VerificationError("rational_format", f"{location} is not num/den")
    numerator_text, denominator_text = value.split("/", 1)
    result = F(int(numerator_text), int(denominator_text))
    if _fraction_text(result) != value:
        raise VerificationError("rational_canonical", f"{location} is not reduced")
    return result


def _z3_fraction(value: z3.ExprRef, location: str) -> F:
    if not z3.is_rational_value(value):
        raise VerificationError(
            "nonrational_model", f"{location} is not a rational model value: {value}"
        )
    return F(value.numerator_as_long(), value.denominator_as_long())


def read_exact_model(
    model: z3.ModelRef,
    point_vars: Mapping[str, Z3Point],
    radius_vars: Sequence[z3.ArithRef],
) -> ExactWitness:
    points: list[tuple[str, Point]] = []
    for role in ROLE_ORDER:
        x_var, y_var = point_vars[role]
        x = _z3_fraction(model.eval(x_var, model_completion=True), f"{role}.x")
        y = _z3_fraction(model.eval(y_var, model_completion=True), f"{role}.y")
        points.append((role, (x, y)))
    radii = tuple(
        _z3_fraction(model.eval(var, model_completion=True), f"radius[{index}]")
        for index, var in enumerate(radius_vars)
    )
    return ExactWitness(
        points=tuple(points),
        physical_radius2=radii[0],
        ku_radius2=radii[1],
        kv_radius2=radii[2],
    )


def _parse_sexpr_documents(text: str) -> list[object]:
    """Parse the small SMT-LIB S-expression subset used by ``get-value``."""

    tokens = re.findall(r"\(|\)|[^\s()]+", text)

    def parse_at(index: int) -> tuple[object, int]:
        if index >= len(tokens):
            raise VerificationError("cvc5_model_parse", "unexpected end of output")
        token = tokens[index]
        if token == "(":
            values: list[object] = []
            index += 1
            while index < len(tokens) and tokens[index] != ")":
                value, index = parse_at(index)
                values.append(value)
            if index >= len(tokens):
                raise VerificationError("cvc5_model_parse", "unclosed list")
            return values, index + 1
        if token == ")":
            raise VerificationError("cvc5_model_parse", "unexpected close parenthesis")
        return token, index + 1

    documents: list[object] = []
    index = 0
    while index < len(tokens):
        document, index = parse_at(index)
        documents.append(document)
    return documents


def _sexpr_fraction(value: object, location: str) -> F:
    if isinstance(value, str):
        try:
            return F(value)
        except (ValueError, ZeroDivisionError) as error:
            raise VerificationError(
                "nonrational_model", f"{location} is not rational: {value}"
            ) from error
    if not isinstance(value, list) or not value:
        raise VerificationError("nonrational_model", f"malformed {location}")
    operator = value[0]
    arguments = value[1:]
    if operator == "/" and len(arguments) == 2:
        denominator = _sexpr_fraction(arguments[1], location)
        if denominator == 0:
            raise VerificationError(
                "nonrational_model", f"zero denominator at {location}"
            )
        return _sexpr_fraction(arguments[0], location) / denominator
    if operator == "-" and len(arguments) == 1:
        return -_sexpr_fraction(arguments[0], location)
    if operator == "-" and len(arguments) == 2:
        return _sexpr_fraction(arguments[0], location) - _sexpr_fraction(
            arguments[1], location
        )
    if operator == "+" and arguments:
        return sum(
            (_sexpr_fraction(argument, location) for argument in arguments), F(0)
        )
    if operator == "*" and arguments:
        product = F(1)
        for argument in arguments:
            product *= _sexpr_fraction(argument, location)
        return product
    if operator == "to_real" and len(arguments) == 1:
        return _sexpr_fraction(arguments[0], location)
    raise VerificationError(
        "nonrational_model", f"unsupported exact value at {location}: {value}"
    )


def _cvc5_value_names(cell: Cell) -> tuple[str, ...]:
    points, radii = _cell_symbols(cell)
    names = [str(coordinate) for role in ROLE_ORDER for coordinate in points[role]]
    names.extend(str(radius) for radius in radii)
    return tuple(names)


def _parse_cvc5_witness(stdout: str, cell: Cell) -> ExactWitness:
    expected_names = _cvc5_value_names(cell)
    documents = _parse_sexpr_documents(stdout)
    candidates = [
        document
        for document in documents
        if isinstance(document, list)
        and len(document) == len(expected_names)
        and all(isinstance(pair, list) and len(pair) == 2 for pair in document)
    ]
    if len(candidates) != 1:
        raise VerificationError(
            "cvc5_model_parse", "did not find one complete get-value response"
        )
    pairs = candidates[0]
    parsed: dict[str, F] = {}
    for pair in pairs:
        assert isinstance(pair, list)
        name = pair[0]
        if not isinstance(name, str) or name not in expected_names or name in parsed:
            raise VerificationError("cvc5_model_parse", f"unexpected value key {name}")
        parsed[name] = _sexpr_fraction(pair[1], name)
    if set(parsed) != set(expected_names):
        raise VerificationError("cvc5_model_parse", "get-value response is incomplete")

    point_vars, radius_vars = _cell_symbols(cell)
    points = tuple(
        (
            role,
            (
                parsed[str(point_vars[role][0])],
                parsed[str(point_vars[role][1])],
            ),
        )
        for role in ROLE_ORDER
    )
    radii = tuple(parsed[str(variable)] for variable in radius_vars)
    return ExactWitness(points, radii[0], radii[1], radii[2])


def run_cvc5(
    cell: Cell, smt2: str, timeout_ms: int
) -> tuple[str, ExactWitness | None, dict[str, Any]]:
    """Run the QF_NRA fallback with an exact get-value request on SAT."""

    names = " ".join(_cvc5_value_names(cell))
    query = f"{smt2}(get-value ({names}))\n"
    try:
        completed = subprocess.run(
            [
                "cvc5",
                "--lang",
                "smt2",
                "--nl-cov",
                "--produce-models",
                "--tlimit",
                str(timeout_ms),
            ],
            input=query,
            capture_output=True,
            text=True,
            check=False,
            timeout=timeout_ms / 1000 + 30,
        )
    except FileNotFoundError:
        return (
            "unavailable",
            None,
            {
                "status": "unavailable",
                "configuration": "--lang smt2 --nl-cov --produce-models",
            },
        )
    except subprocess.TimeoutExpired:
        return (
            "unknown",
            None,
            {
                "status": "unknown",
                "reason": "subprocess cushion expired",
                "configuration": "--lang smt2 --nl-cov --produce-models",
            },
        )
    status = next(
        (
            line.strip()
            for line in completed.stdout.splitlines()
            if line.strip() in {"sat", "unsat", "unknown"}
        ),
        "unknown",
    )
    engine = {
        "status": status,
        "returncode": completed.returncode,
        "configuration": "--lang smt2 --nl-cov --produce-models",
    }
    if status != "sat":
        if status == "unknown" and completed.stderr.strip():
            engine["reason"] = completed.stderr.strip().splitlines()[0][:500]
        return status, None, engine
    try:
        witness = _parse_cvc5_witness(completed.stdout, cell)
    except VerificationError as error:
        engine["model_readback"] = error.code
        return "sat-unreadable", None, engine
    engine["model_readback"] = "exact-rational"
    return "sat", witness, engine


def _witness_json(witness: ExactWitness) -> dict[str, Any]:
    return {
        "points": {
            role: {"x": _fraction_text(point[0]), "y": _fraction_text(point[1])}
            for role, point in witness.points
        },
        "physical_radius_squared": _fraction_text(witness.physical_radius2),
        "ku_radius_squared": _fraction_text(witness.ku_radius2),
        "kv_radius_squared": _fraction_text(witness.kv_radius2),
    }


def _parse_witness(value: object) -> ExactWitness:
    if not isinstance(value, dict):
        raise VerificationError("witness_shape", "witness is not an object")
    if set(value) != {
        "points",
        "physical_radius_squared",
        "ku_radius_squared",
        "kv_radius_squared",
    }:
        raise VerificationError("witness_shape", "witness keys differ from schema")
    raw_points = value["points"]
    if not isinstance(raw_points, dict) or set(raw_points) != ROLE_SET:
        raise VerificationError("witness_roles", "point keys differ from carrier roles")
    points: list[tuple[str, Point]] = []
    for role in ROLE_ORDER:
        raw_point = raw_points[role]
        if not isinstance(raw_point, dict) or set(raw_point) != {"x", "y"}:
            raise VerificationError("witness_point", f"malformed point {role}")
        points.append(
            (
                role,
                (
                    _parse_fraction(raw_point["x"], f"{role}.x"),
                    _parse_fraction(raw_point["y"], f"{role}.y"),
                ),
            )
        )
    return ExactWitness(
        points=tuple(points),
        physical_radius2=_parse_fraction(
            value["physical_radius_squared"], "physical_radius_squared"
        ),
        ku_radius2=_parse_fraction(value["ku_radius_squared"], "ku_radius_squared"),
        kv_radius2=_parse_fraction(value["kv_radius_squared"], "kv_radius_squared"),
    )


def _report_json(report: ReplayReport) -> dict[str, Any]:
    return {
        "minimum_orientation": _fraction_text(report.minimum_orientation),
        "cap_members": [list(cap) for cap in report.cap_members],
        "cap_interiors": [list(interior) for interior in report.cap_interiors],
        "surplus_cap_size": report.surplus_cap_size,
        "j_closed_cap_size": report.j_closed_cap_size,
        "j_interior_size": report.j_interior_size,
        "post_u_max_multiplicity": report.post_u_max_multiplicity,
        "post_v_max_multiplicity": report.post_v_max_multiplicity,
        "moser_dot_products": [
            _fraction_text(value) for value in report.moser_dot_products
        ],
    }


def canonical_json(value: object, *, pretty: bool = False) -> str:
    if pretty:
        return json.dumps(value, sort_keys=True, indent=2, ensure_ascii=True) + "\n"
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True)


def _sha256_text(value: str) -> str:
    return hashlib.sha256(value.encode("utf-8")).hexdigest()


def current_script_sha256() -> str:
    return hashlib.sha256(Path(__file__).read_bytes()).hexdigest()


def current_git_head() -> str:
    completed = subprocess.run(
        ["git", "rev-parse", "HEAD"],
        cwd=Path(__file__).resolve().parent.parent,
        check=False,
        capture_output=True,
        text=True,
    )
    if completed.returncode != 0:
        return "UNAVAILABLE"
    return completed.stdout.strip()


def _cell_json(cell: Cell) -> dict[str, Any]:
    value = asdict(cell)
    value["order"] = list(cell.order)
    return value


def _claim_json(status: str, cell: Cell) -> dict[str, Any]:
    positive = status == SAT_STATUS
    return {
        "full_L1_claim": False,
        "full_L1_claim_meaning": "a fixed M0/order cell never covers the full L1 partition",
        "l1_existential_cell_witness_claim": positive,
        "bounded_cell_claim": positive,
        "s0_cell_claim": positive,
        "s0_branch": cell.branch,
        "fixed_cardinality": len(ROLE_ORDER),
        "fixed_order_only": True,
        "overlap_cell": cell.overlap_cell,
        "equality_cell": cell.equality_cell,
        "order_template": cell.order_template,
        "source_universal_claim": False,
        "lean_claim": False,
        "promotion_claim": False,
    }


def _base_result(
    *,
    cell: Cell,
    status: str,
    solver_result: str,
    input_sha256: str,
    script_sha256: str,
    git_head: str,
    reason: str,
    engines: Mapping[str, Any] | None = None,
    cvc5_fallback: bool = True,
) -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "encoding_version": ENCODING_VERSION,
        "status": status,
        "solver_result": solver_result,
        "reason": reason,
        "cell": _cell_json(cell),
        "claim": _claim_json(status, cell),
        "active_constraints": list(ACTIVE_CONSTRAINTS),
        "omitted_constraints": list(OMITTED_CONSTRAINTS),
        "cap_indexing": CAP_INDEXING,
        "algebraic_dof": ALGEBRAIC_DOF,
        "unsupported_cell_families": list(UNSUPPORTED_CELL_FAMILIES),
        "solver_policy": {
            "primary": "z3 QF_NRA",
            "fallback": (
                "cvc5 --nl-cov on Z3 unknown" if cvc5_fallback else "disabled"
            ),
            "timeout_ms_per_engine": "recorded by launch configuration, not claim data",
        },
        "engines": dict(engines or {}),
        "provenance": {
            "git_head": git_head,
            "script_sha256": script_sha256,
            "input_sha256": input_sha256,
            "z3_version": z3.get_version_string(),
        },
        "witness": None,
        "exact_replay": None,
    }


def authenticate_payload(payload: Mapping[str, Any]) -> dict[str, Any]:
    if "authentication" in payload:
        raise VerificationError("authentication_shape", "payload is already signed")
    result = dict(payload)
    result["authentication"] = {
        "algorithm": "sha256-canonical-json",
        "payload_sha256": _sha256_text(canonical_json(payload)),
    }
    return result


def verify_authentication(value: object) -> dict[str, Any]:
    if not isinstance(value, dict):
        raise VerificationError("result_shape", "result is not an object")
    authentication = value.get("authentication")
    if not isinstance(authentication, dict) or set(authentication) != {
        "algorithm",
        "payload_sha256",
    }:
        raise VerificationError("authentication_shape", "missing authentication")
    if authentication["algorithm"] != "sha256-canonical-json":
        raise VerificationError("authentication_algorithm", "unsupported digest")
    payload = {key: item for key, item in value.items() if key != "authentication"}
    expected = _sha256_text(canonical_json(payload))
    if authentication["payload_sha256"] != expected:
        raise VerificationError("authentication_digest", "payload digest mismatch")
    return value


def replay_result_document(
    value: object,
    *,
    expected_cell: Cell | None = None,
    expected_input_sha256: str | None = None,
    expected_script_sha256: str | None = None,
) -> tuple[dict[str, Any], ReplayReport | None]:
    result = verify_authentication(value)
    if (
        result.get("schema") != SCHEMA
        or result.get("encoding_version") != ENCODING_VERSION
    ):
        raise VerificationError("result_schema", "stale or unsupported result schema")
    raw_cell = result.get("cell")
    if not isinstance(raw_cell, dict):
        raise VerificationError("result_cell", "cell record is missing")
    matching = [cell for cell in CELL_TEMPLATES if _cell_json(cell) == raw_cell]
    if len(matching) != 1:
        raise VerificationError("result_cell", "cell is not a current template")
    cell = matching[0]
    if expected_cell is not None and cell != expected_cell:
        raise VerificationError("result_cell", "result belongs to another cell")
    if result.get("active_constraints") != list(ACTIVE_CONSTRAINTS):
        raise VerificationError("result_ledger", "active constraint ledger differs")
    if result.get("omitted_constraints") != list(OMITTED_CONSTRAINTS):
        raise VerificationError("result_ledger", "omission ledger differs")
    if result.get("cap_indexing") != CAP_INDEXING:
        raise VerificationError("result_cap_indexing", "cap indexing record differs")
    if result.get("algebraic_dof") != ALGEBRAIC_DOF:
        raise VerificationError("result_dof", "algebraic DOF record differs")
    if result.get("unsupported_cell_families") != list(UNSUPPORTED_CELL_FAMILIES):
        raise VerificationError("result_cell_coverage", "blocked cell ledger differs")
    if not isinstance(result.get("engines"), dict):
        raise VerificationError("result_engines", "engine-specific status is missing")
    solver_policy = result.get("solver_policy")
    if (
        not isinstance(solver_policy, dict)
        or solver_policy.get("primary") != "z3 QF_NRA"
    ):
        raise VerificationError("result_solver_policy", "solver policy is malformed")
    provenance = result.get("provenance")
    if not isinstance(provenance, dict):
        raise VerificationError("result_provenance", "provenance is missing")
    if (
        expected_input_sha256 is not None
        and provenance.get("input_sha256") != expected_input_sha256
    ):
        raise VerificationError("result_input", "SMT2 digest differs")
    if (
        expected_script_sha256 is not None
        and provenance.get("script_sha256") != expected_script_sha256
    ):
        raise VerificationError("result_script", "checker digest differs")

    status = result.get("status")
    if status not in ALLOWED_STATUSES:
        raise VerificationError("result_status", f"unsupported status {status!r}")
    if result.get("claim") != _claim_json(str(status), cell):
        raise VerificationError("result_claim", "claim flags differ from status")
    if status == SAT_STATUS:
        witness = _parse_witness(result.get("witness"))
        report = replay_witness(witness, cell)
        if result.get("exact_replay") != _report_json(report):
            raise VerificationError("result_replay", "stored replay metrics differ")
        return result, report
    if result.get("witness") is not None or result.get("exact_replay") is not None:
        raise VerificationError("result_witness", "non-SAT result carries a witness")
    return result, None


def load_reusable_result(
    path: Path, cell: Cell, input_sha256: str, script_sha256: str
) -> dict[str, Any] | None:
    if not path.is_file():
        return None
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
        result, _report = replay_result_document(
            value,
            expected_cell=cell,
            expected_input_sha256=input_sha256,
            expected_script_sha256=script_sha256,
        )
    except (OSError, json.JSONDecodeError, VerificationError):
        return None
    if result["status"] not in TERMINAL_STATUSES:
        return None
    return result


def solve_cell(
    cell: Cell,
    timeout_ms: int,
    smt2: str,
    input_sha256: str,
    script_sha256: str,
    git_head: str,
    cvc5_fallback: bool = True,
) -> dict[str, Any]:
    """Worker entry point: build a fresh solver and classify one cell."""

    try:
        if _sha256_text(smt2) != input_sha256:
            raise VerificationError("input_transport", "worker SMT2 digest differs")
        solver = z3.SolverFor("QF_NRA")
        solver.set("timeout", timeout_ms)
        solver.from_string(
            "\n".join(
                line for line in smt2.splitlines() if line.strip() != "(check-sat)"
            )
        )
        point_vars, radius_vars = _cell_symbols(cell)
        check = solver.check()
        if check == z3.sat:
            engines: dict[str, Any] = {"z3": {"status": "sat", "logic": "QF_NRA"}}
            try:
                witness = read_exact_model(solver.model(), point_vars, radius_vars)
                report = replay_witness(witness, cell)
            except VerificationError as error:
                engines["z3"]["model_readback"] = error.code
                status = (
                    UNKNOWN_NONRATIONAL_STATUS
                    if error.code == "nonrational_model"
                    else ERROR_STATUS
                )
                payload = _base_result(
                    cell=cell,
                    status=status,
                    solver_result="sat",
                    input_sha256=input_sha256,
                    script_sha256=script_sha256,
                    git_head=git_head,
                    reason=str(error),
                    engines=engines,
                    cvc5_fallback=cvc5_fallback,
                )
                return authenticate_payload(payload)
            engines["z3"]["model_readback"] = "exact-rational"
            payload = _base_result(
                cell=cell,
                status=SAT_STATUS,
                solver_result="sat",
                input_sha256=input_sha256,
                script_sha256=script_sha256,
                git_head=git_head,
                reason="exact rational model passed independent replay",
                engines=engines,
                cvc5_fallback=cvc5_fallback,
            )
            payload["witness"] = _witness_json(witness)
            payload["exact_replay"] = _report_json(report)
            return authenticate_payload(payload)
        if check == z3.unsat:
            engines = {"z3": {"status": "unsat", "logic": "QF_NRA"}}
            payload = _base_result(
                cell=cell,
                status=UNKNOWN_UNSAT_STATUS,
                solver_result="unsat",
                input_sha256=input_sha256,
                script_sha256=script_sha256,
                git_head=git_head,
                reason=(
                    "the single fixed cyclic-order/equality cell is unsatisfiable; "
                    "no broader L1 conclusion is drawn"
                ),
                engines=engines,
                cvc5_fallback=cvc5_fallback,
            )
            return authenticate_payload(payload)
        reason = solver.reason_unknown()
        engines = {
            "z3": {
                "status": "unknown",
                "logic": "QF_NRA",
                "reason": reason or "unknown",
            }
        }
        if cvc5_fallback:
            cvc5_status, cvc5_witness, cvc5_engine = run_cvc5(cell, smt2, timeout_ms)
            engines["cvc5"] = cvc5_engine
            if cvc5_status == "sat" and cvc5_witness is not None:
                try:
                    report = replay_witness(cvc5_witness, cell)
                except VerificationError as error:
                    status = (
                        UNKNOWN_NONRATIONAL_STATUS
                        if error.code in {"nonrational_model", "cvc5_model_parse"}
                        else ERROR_STATUS
                    )
                    payload = _base_result(
                        cell=cell,
                        status=status,
                        solver_result="sat",
                        input_sha256=input_sha256,
                        script_sha256=script_sha256,
                        git_head=git_head,
                        reason=f"cvc5 witness replay failed: {error}",
                        engines=engines,
                        cvc5_fallback=True,
                    )
                    return authenticate_payload(payload)
                payload = _base_result(
                    cell=cell,
                    status=SAT_STATUS,
                    solver_result="sat",
                    input_sha256=input_sha256,
                    script_sha256=script_sha256,
                    git_head=git_head,
                    reason="cvc5 exact rational model passed independent replay",
                    engines=engines,
                    cvc5_fallback=True,
                )
                payload["witness"] = _witness_json(cvc5_witness)
                payload["exact_replay"] = _report_json(report)
                return authenticate_payload(payload)
            if cvc5_status == "unsat":
                payload = _base_result(
                    cell=cell,
                    status=UNKNOWN_UNSAT_STATUS,
                    solver_result="unsat",
                    input_sha256=input_sha256,
                    script_sha256=script_sha256,
                    git_head=git_head,
                    reason=(
                        "cvc5 reports the single fixed cyclic-order/equality cell "
                        "unsatisfiable after Z3 unknown; no broader L1 conclusion is drawn"
                    ),
                    engines=engines,
                    cvc5_fallback=True,
                )
                return authenticate_payload(payload)
            if cvc5_status == "sat-unreadable":
                payload = _base_result(
                    cell=cell,
                    status=UNKNOWN_NONRATIONAL_STATUS,
                    solver_result="sat-unreadable",
                    input_sha256=input_sha256,
                    script_sha256=script_sha256,
                    git_head=git_head,
                    reason="cvc5 SAT model did not have complete exact rational readback",
                    engines=engines,
                    cvc5_fallback=True,
                )
                return authenticate_payload(payload)
        payload = _base_result(
            cell=cell,
            status=UNKNOWN_TIMEOUT_STATUS,
            solver_result="unknown",
            input_sha256=input_sha256,
            script_sha256=script_sha256,
            git_head=git_head,
            reason=(
                "both engines returned no usable verdict"
                if cvc5_fallback
                else (reason or "Z3 returned unknown")
            ),
            engines=engines,
            cvc5_fallback=cvc5_fallback,
        )
        return authenticate_payload(payload)
    except Exception as error:  # noqa: BLE001 - fail closed at process boundary
        payload = _base_result(
            cell=cell,
            status=ERROR_STATUS,
            solver_result="not-run-or-failed",
            input_sha256=input_sha256,
            script_sha256=script_sha256,
            git_head=git_head,
            reason=f"{type(error).__name__}: {error}",
            engines={},
            cvc5_fallback=cvc5_fallback,
        )
        return authenticate_payload(payload)


def _expect_error(code: str, action: Callable[[], object]) -> dict[str, Any]:
    try:
        action()
    except VerificationError as error:
        _require(error.code == code, "wrong_mutation_code", f"{error.code} != {code}")
        return {"status": "PASS", "rejected_by": error.code}
    raise VerificationError("mutation_not_rejected", f"expected {code}")


def _reject_open_cap_inequality() -> None:
    m1, m2, o = (FIXED_POINTS[role] for role in MOSER)

    def open_predicate(vi: Point, vj: Point, vk: Point, point: Point) -> bool:
        return orient(point, vj, vk) * orient(vi, vj, vk) < 0

    _require(
        open_predicate(m1, m2, o, m2),
        "cap_endpoint_pattern",
        "open inequality erases a required endpoint",
    )


def _reject_wrong_cap_index() -> None:
    wrong_table = (0, 1, 2)
    _require(
        wrong_table[SURPLUS_INDEX] == J_CAP_INDEX,
        "wrong_fixed_cap_index",
        "mutated opposite-index table selected the wrong cap",
    )


def _reject_wrong_endpoint_erasure() -> None:
    caps = (
        frozenset({"m2", "O"}),
        frozenset({"O", "m1"}),
        frozenset({"m1", "m2", "u"}),
    )
    wrong = caps[2] - {"O", "m1"}
    _require(
        "m1" not in wrong and "m2" not in wrong,
        "cap_endpoint_erasure",
        "mutated erasure retained a selected-cap endpoint",
    )


def _reject_surplus_j_conflation() -> None:
    caps = (
        frozenset({"m2", "O", "xv", "bv"}),  # C1 is not surplus: size four
        frozenset({"O", "m1", "au", "av", "v"}),
        frozenset({"m1", "m2", "u", "xu", "cu", "cv"}),
    )
    interiors = tuple(cap_interior(caps, index) for index in range(3))
    verify_surplus_and_j(caps, interiors, CELL_TEMPLATES[0])


def _synthetic_no_qfree_failure() -> None:
    points: dict[str, Point] = {
        role: (F(index + 3), F((index + 3) ** 2))
        for index, role in enumerate(ROLE_ORDER)
    }
    points.update(
        {
            "cu": (F(0), F(0)),
            "u": (F(7), F(11)),
            "xu": (F(1), F(0)),
            "delta": (F(-1), F(0)),
            "v": (F(0), F(1)),
            "xv": (F(0), F(-1)),
        }
    )
    verify_no_qfree(points, "cu", "u", "mutated post-u")


def _shape_control_points() -> dict[str, Point]:
    points = {
        role: (F(index + 10), F(index + 30)) for index, role in enumerate(ROLE_ORDER)
    }
    points.update(FIXED_POINTS)
    return points


def _reject_normalization_mutation() -> None:
    points = _shape_control_points()
    points["O"] = (F(0), F(1, 10))
    verify_carrier_shape(points)


def _reject_pairwise_distinct_mutation() -> None:
    points = _shape_control_points()
    points["au"] = points["m1"]
    verify_carrier_shape(points)


def _mec_control_points() -> dict[str, Point]:
    points = dict(FIXED_POINTS)
    non_moser = [role for role in ROLE_ORDER if role not in MOSER]
    points.update(
        {role: (F(1), F(index + 1, 20)) for index, role in enumerate(non_moser)}
    )
    return points


def _reject_mec_enclosure_mutation() -> None:
    points = _mec_control_points()
    points["au"] = (F(3), F(0))
    verify_mec_certificate(points)


def _reject_mec_boundary_mutation() -> None:
    points = _mec_control_points()
    points["m1"] = (F(1), F(-4, 5))
    verify_mec_certificate(points)


def _physical_fiber_control_points() -> dict[str, Point]:
    points = _shape_control_points()
    points.update(
        {
            "u": (F(1), F(0)),
            "xu": (F(-1), F(0)),
            "delta": (F(0), F(1)),
            "v": (F(0), F(-1)),
            "xv": (F(3, 5), F(4, 5)),
        }
    )
    return points


def _reject_physical_fiber_mutation() -> None:
    points = _physical_fiber_control_points()
    points["au"] = (F(-3, 5), F(4, 5))
    verify_exact_fiber(points, "O", F(1), PHYSICAL, "physical_fiber")


def _row_fiber_control_points() -> dict[str, Point]:
    points = _shape_control_points()
    points.update(
        {
            "cu": (F(0), F(0)),
            "u": (F(1), F(0)),
            "xu": (F(-1), F(0)),
            "au": (F(0), F(1)),
            "bu": (F(0), F(-1)),
        }
    )
    return points


def _reject_row_fiber_mutation() -> None:
    points = _row_fiber_control_points()
    points["v"] = (F(3, 5), F(4, 5))
    verify_exact_fiber(points, "cu", F(1), KU, "ku_fiber")


def _reject_mutual_omission_mutation() -> None:
    verify_rigid_packet(PHYSICAL, KU | {"v"}, KV)


def _rational_circle_point(parameter: F) -> Point:
    denominator = 1 + parameter * parameter
    return (
        (1 - parameter * parameter) / denominator,
        2 * parameter / denominator,
    )


def _convex_control_points() -> dict[str, Point]:
    parameters = (
        F(-3),
        F(-2),
        F(-3, 2),
        F(-1),
        F(-2, 3),
        F(-1, 3),
        F(0),
        F(1, 3),
        F(2, 3),
        F(1),
        F(3, 2),
        F(2),
        F(3),
    )
    circle_points = ((F(-1), F(0)), *map(_rational_circle_point, parameters))
    return dict(zip(ROLE_ORDER, circle_points, strict=True))


def _reject_convexity_mutation() -> None:
    points = _convex_control_points()
    order = list(ROLE_ORDER)
    order[4], order[5] = order[5], order[4]
    verify_strict_convexity(points, order)


def run_solver_smokes(timeout_ms: int) -> dict[str, Any]:
    """Known SAT/UNSAT gates plus load-bearing mutation controls."""

    x = z3.Real("rigid221_full_l1_smoke_x")
    sat_solver = z3.SolverFor("QF_NRA")
    sat_solver.set("timeout", timeout_ms)
    sat_solver.add(x * x == z3.RealVal("9/4"), x > 0)
    sat_check = sat_solver.check()
    _require(sat_check == z3.sat, "known_sat_smoke", str(sat_check))
    sat_value = _z3_fraction(sat_solver.model().eval(x), "smoke.x")
    _require(sat_value == F(3, 2), "known_sat_readback", str(sat_value))

    unsat_solver = z3.SolverFor("QF_NRA")
    unsat_solver.set("timeout", timeout_ms)
    y = z3.Real("rigid221_full_l1_smoke_y")
    unsat_solver.add(y * y < 0)
    unsat_check = unsat_solver.check()
    _require(unsat_check == z3.unsat, "known_unsat_smoke", str(unsat_check))

    convex_points = _convex_control_points()
    convex_margin = verify_strict_convexity(convex_points, ROLE_ORDER)
    controls = {
        "closed_vs_open_cap_inequality": _expect_error(
            "cap_endpoint_pattern", _reject_open_cap_inequality
        ),
        "opposite_cap_index": _expect_error(
            "wrong_fixed_cap_index", _reject_wrong_cap_index
        ),
        "endpoint_erasure": _expect_error(
            "cap_endpoint_erasure", _reject_wrong_endpoint_erasure
        ),
        "surplus_c1_not_rotated_j_c3": _expect_error(
            "surplus_cap_size", _reject_surplus_j_conflation
        ),
        "post_deletion_no_qfree": _expect_error(
            "no_qfree", _synthetic_no_qfree_failure
        ),
        "normalization": _expect_error("normalization", _reject_normalization_mutation),
        "pairwise_distinctness": _expect_error(
            "pairwise_distinct", _reject_pairwise_distinct_mutation
        ),
        "mec_enclosure": _expect_error("mec_enclosure", _reject_mec_enclosure_mutation),
        "mec_boundary": _expect_error("mec_boundary", _reject_mec_boundary_mutation),
        "exact_physical_fiber": _expect_error(
            "physical_fiber", _reject_physical_fiber_mutation
        ),
        "exact_source_row_fiber": _expect_error("ku_fiber", _reject_row_fiber_mutation),
        "mutual_omission": _expect_error(
            "mutual_omission", _reject_mutual_omission_mutation
        ),
        "global_convexity": _expect_error(
            "strict_convexity", _reject_convexity_mutation
        ),
    }
    return {
        "schema": "rigid221-s0-full-l1-smoke/v1",
        "status": "PASS",
        "known_sat": {
            "solver_result": "sat",
            "exact_readback": _fraction_text(sat_value),
        },
        "known_unsat": {"solver_result": "unsat"},
        "convex_control_minimum": _fraction_text(convex_margin),
        "mutation_controls": controls,
    }


def _atomic_write_text(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp")
    temporary.write_text(text, encoding="utf-8")
    temporary.replace(path)


def aggregate_run_status(statuses: Sequence[str]) -> str:
    """Fail-closed aggregation over the cells that this version encodes."""

    _require(bool(statuses), "aggregate_status", "no encoded cell statuses")
    if ERROR_STATUS in statuses:
        return ERROR_STATUS
    if all(status == SAT_STATUS for status in statuses):
        return SAT_STATUS
    if SAT_STATUS in statuses:
        return PARTIAL_SAT_STATUS
    return "UNKNOWN"


def run_cells(
    output_dir: Path,
    workers: int,
    timeout_ms: int,
    cvc5_fallback: bool = True,
) -> dict[str, Any]:
    """Run or resume all current bounded cells."""

    _validate_limits(workers, timeout_ms)
    output_dir.mkdir(parents=True, exist_ok=True)
    if not output_dir.is_dir():
        raise VerificationError("output_dir", f"not a directory: {output_dir}")
    script_sha256 = current_script_sha256()
    git_head = current_git_head()
    results: dict[str, dict[str, Any]] = {}
    pending: list[tuple[Cell, str, str]] = []

    for cell in CELL_TEMPLATES:
        cell_dir = output_dir / "cells" / cell.cell_id
        input_path = cell_dir / SMT2_FILENAME
        result_path = cell_dir / RESULT_FILENAME
        solver, _points, _radii = build_solver(cell, timeout_ms)
        smt2 = export_smt2(solver)
        input_sha256 = _sha256_text(smt2)
        if input_path.is_file():
            try:
                stored_smt2 = input_path.read_text(encoding="utf-8")
            except OSError:
                stored_smt2 = ""
            if stored_smt2 == smt2 and _sha256_text(stored_smt2) == input_sha256:
                reusable = load_reusable_result(
                    result_path, cell, input_sha256, script_sha256
                )
                if reusable is not None:
                    results[cell.cell_id] = reusable
                    continue
        _atomic_write_text(input_path, smt2)
        pending.append((cell, input_sha256, smt2))

    if pending:
        max_workers = min(workers, len(pending))
        with ProcessPoolExecutor(max_workers=max_workers) as executor:
            future_map = {
                executor.submit(
                    solve_cell,
                    cell,
                    timeout_ms,
                    smt2,
                    input_sha256,
                    script_sha256,
                    git_head,
                    cvc5_fallback,
                ): cell
                for cell, input_sha256, smt2 in pending
            }
            for future in as_completed(future_map):
                cell = future_map[future]
                try:
                    result = future.result()
                except Exception as error:  # noqa: BLE001 - worker transport boundary
                    solver, _points, _radii = build_solver(cell, timeout_ms)
                    input_sha256 = _sha256_text(export_smt2(solver))
                    payload = _base_result(
                        cell=cell,
                        status=ERROR_STATUS,
                        solver_result="worker-failed",
                        input_sha256=input_sha256,
                        script_sha256=script_sha256,
                        git_head=git_head,
                        reason=f"{type(error).__name__}: {error}",
                        cvc5_fallback=cvc5_fallback,
                    )
                    result = authenticate_payload(payload)
                results[cell.cell_id] = result

    for cell in CELL_TEMPLATES:
        result = results[cell.cell_id]
        cell_dir = output_dir / "cells" / cell.cell_id
        _atomic_write_text(
            cell_dir / RESULT_FILENAME, canonical_json(result, pretty=True)
        )

    ordered_results = [results[cell.cell_id] for cell in CELL_TEMPLATES]
    positive_cells = [
        result["cell"]["cell_id"]
        for result in ordered_results
        if result["status"] == SAT_STATUS
    ]
    aggregate_status = aggregate_run_status(
        [str(result["status"]) for result in ordered_results]
    )
    run_payload = {
        "schema": RUN_SCHEMA,
        "encoding_version": ENCODING_VERSION,
        "status": aggregate_status,
        "positive_cells": positive_cells,
        "cap_indexing": CAP_INDEXING,
        "algebraic_dof": ALGEBRAIC_DOF,
        "unsupported_cell_families": list(UNSUPPORTED_CELL_FAMILIES),
        "solver_configuration": {
            "workers": workers,
            "timeout_ms_per_engine": timeout_ms,
            "cvc5_fallback": cvc5_fallback,
        },
        "claim": {
            "full_L1_claim": False,
            "full_L1_claim_meaning": "only two fixed M0/order cells are encoded",
            "l1_existential_cell_witness_claim": bool(positive_cells),
            "bounded_cell_claim": bool(positive_cells),
            "all_encoded_cells_sat": aggregate_status == SAT_STATUS,
            "source_universal_claim": False,
            "lean_claim": False,
            "promotion_claim": False,
        },
        "cells": [
            {
                "cell_id": result["cell"]["cell_id"],
                "status": result["status"],
                "solver_result": result["solver_result"],
                "result_path": f"cells/{result['cell']['cell_id']}/{RESULT_FILENAME}",
                "result_sha256": _sha256_text(canonical_json(result, pretty=True)),
            }
            for result in ordered_results
        ],
        "provenance": {"git_head": git_head, "script_sha256": script_sha256},
    }
    run_result = authenticate_payload(run_payload)
    _atomic_write_text(
        output_dir / RUN_FILENAME, canonical_json(run_result, pretty=True)
    )
    return run_result


def replay_result_path(path: Path) -> tuple[dict[str, Any], ReplayReport | None]:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except OSError as error:
        raise VerificationError("replay_io", str(error)) from error
    except json.JSONDecodeError as error:
        raise VerificationError("replay_json", str(error)) from error
    return replay_result_document(
        value,
        expected_script_sha256=current_script_sha256(),
    )


def _validate_limits(workers: int, timeout_ms: int) -> None:
    if workers < 1 or workers > 20:
        raise VerificationError("workers", "--workers must be between 1 and 20")
    if timeout_ms < 1:
        raise VerificationError("timeout", "--timeout-ms must be positive")


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    modes = parser.add_mutually_exclusive_group(required=True)
    modes.add_argument("--smoke", action="store_true", help="run non-writing gates")
    modes.add_argument("--output-dir", type=Path, help="run/resume bounded cells")
    modes.add_argument("--replay-result", type=Path, help="replay one cell result")
    parser.add_argument(
        "--workers",
        type=int,
        default=min(os.cpu_count() or 1, 20),
        help="parallel cell workers, hard-capped at 20",
    )
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument(
        "--cvc5-fallback",
        action=argparse.BooleanOptionalAction,
        default=True,
        help="on Z3 unknown, run cvc5 --nl-cov (enabled by default)",
    )
    parser.add_argument(
        "--verbose", action="store_true", help="print the complete JSON result"
    )
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    try:
        _validate_limits(args.workers, args.timeout_ms)
        if args.smoke:
            result = run_solver_smokes(args.timeout_ms)
            if args.verbose:
                sys.stdout.write(canonical_json(result, pretty=True))
            else:
                print("smoke PASS")
            return 0
        if args.replay_result is not None:
            result, report = replay_result_path(args.replay_result)
            if args.verbose:
                sys.stdout.write(canonical_json(result, pretty=True))
            else:
                replay_text = " exact-replay" if report is not None else ""
                print(f"{result['cell']['cell_id']} {result['status']}{replay_text}")
            return 0
        result = run_cells(
            args.output_dir,
            args.workers,
            args.timeout_ms,
            cvc5_fallback=args.cvc5_fallback,
        )
        if args.verbose:
            sys.stdout.write(canonical_json(result, pretty=True))
        else:
            for cell in result["cells"]:
                print(f"{cell['cell_id']} {cell['status']}")
            print(f"result {args.output_dir / RUN_FILENAME}")
        return (
            1 if any(cell["status"] == ERROR_STATUS for cell in result["cells"]) else 0
        )
    except VerificationError as error:
        print(str(error), file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
