#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Discover and exactly replay a fixed distinct 12-role positive control.

This external finite harness deliberately assumes that the modeled carrier is
exactly twelve pairwise-distinct named roles.  It does not instantiate the S0
source context, an ambient L1 carrier, or any Lean promotion ingress.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import re
import subprocess
from collections import Counter
from collections.abc import Callable, Iterable, Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from functools import lru_cache
from math import gcd
from pathlib import Path
from typing import Any

import z3

F = Fraction
Point = tuple[F, F]

SCHEMA = "rigid221-fixed-distinct-12-role-positive-control/v2"
SAT_STATUS = "SAT_12_ROLE_POSITIVE_CONTROL_EXACT"
UNKNOWN_STATUS = "UNKNOWN"
BLOCKED_STATUS = "ENCODING_BLOCKED"
CLAIM_SCOPE = "FIXED_DISTINCT_12_ROLE_POSITIVE_CONTROL_ONLY"
LANE_BASE_HEAD = "55687ab3e1d47a0f8a5a3646031faf912e28ac80"
SOURCE_DECLARATION = (
    "Problem97.ATailFrontierLiveClosure."
    "false_of_exactFourMutualOmissionRigid221_minimalCore"
)
FINAL_CONSUMER = "Problem97.erdos97_rhs"
PRIOR_SEED_PATH = (
    "/tmp/rigid221-minimalcore-s0-direct-wedge-rejection-witness-2026-08-29.py"
)

# The prior nine-point witness, renamed to the coupled-row roles requested by
# this lane: source -> u, p2 -> delta, p1 -> v, p3 -> xv, c -> cu,
# q1 -> au, and q2 -> bu.
SEED_POINTS: dict[str, Point] = {
    "O": (F(0), F(0)),
    "u": (F(3, 5), F(-4, 5)),
    "xu": (F(3, 5), F(4, 5)),
    "delta": (F(33, 65), F(-56, 65)),
    "v": (F(8, 17), F(-15, 17)),
    "xv": (F(228, 397), F(325, 397)),
    "cu": (F(4, 5), F(0)),
    "au": (F(1, 25), F(-8, 25)),
    "bu": (F(12, 25), F(19, 25)),
}

CARRIER_ORDER = (
    "O",
    "au",
    "av",
    "v",
    "delta",
    "u",
    "cv",
    "cu",
    "xu",
    "xv",
    "bv",
    "bu",
)
PHYSICAL_NAMES = frozenset({"u", "xu", "delta", "v", "xv"})
KU_NAMES = frozenset({"u", "xu", "au", "bu"})
KV_NAMES = frozenset({"v", "xv", "av", "bv"})

ENCODED_FACTS = (
    "12 pairwise-distinct rational modeled points",
    "declared cyclic order is strictly convex by every edge/nonincident point",
    "complete within modeled 12-role carrier radius-1 class C={u,xu,delta,v,xv} centered at O",
    "complete within modeled 12-role carrier four-fiber Ku={u,xu,au,bu} centered at cu",
    "complete within modeled 12-role carrier four-fiber Kv={v,xv,av,bv} centered at cv",
    "cu and cv are carrier centers outside C and outside their own positive fibers",
    "mutual omissions v∉Ku and u∉Kv",
    "rigid disjoint 2+2+1 intersections with singleton delta",
    "cu≠cv, with cu outside C",
    "no positive-radius four-fiber at cu after deleting u",
    "no positive-radius four-fiber at cv after deleting v",
)

ASSUMPTIONS = (
    "the modeled carrier is exactly the 12 named roles O,au,av,v,delta,u,cv,cu,xu,xv,bv,bu",
    "all 12 modeled roles denote pairwise-distinct points",
    "therefore off-row support roles are disjoint and center-role identifications are excluded by assumption, not derived from the source context",
)

OMITTED_FACTS = (
    "any lift from the fixed modeled 12-role carrier to the ambient source carrier D.A",
    "ambient points outside the 12 modeled roles and their possible radius-fiber memberships",
    "Cap and cap-complete L1 geometry",
    "S0-I",
    "S0-N",
    "q/w roles and constraints",
    "ExactFourMutualOmissionSourceContext",
    "packet rows and SurplusCapPacket data",
    "ExactFourPostCardElevenRobustSurface",
)


class VerificationError(ValueError):
    """An exact finite check failed, with a stable mutation-test code."""

    def __init__(self, code: str, detail: str) -> None:
        super().__init__(f"{code}: {detail}")
        self.code = code
        self.detail = detail


@dataclass(frozen=True)
class Candidate:
    """A named rational carrier and its claimed counterclockwise order."""

    points: tuple[tuple[str, Point], ...]
    order: tuple[str, ...] = CARRIER_ORDER

    def point_map(self) -> dict[str, Point]:
        return dict(self.points)


@dataclass(frozen=True)
class VerificationReport:
    edge_minimum: F
    physical_radius_squared: F
    ku_radius_squared: F
    kv_radius_squared: F
    post_u_max_multiplicity: int
    post_v_max_multiplicity: int
    post_u_multiplicities: tuple[int, ...]
    post_v_multiplicities: tuple[int, ...]


@dataclass(frozen=True)
class SearchOutcome:
    candidate: Candidate | None
    attempted: int
    exact_survivors: int
    cv_x: F | None
    av_rotation: F | None
    bv_rotation: F | None


@dataclass(frozen=True)
class ExecutionBundle:
    result: dict[str, Any]
    smt2: str | None


def dist2(a: Point, b: Point) -> F:
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def orient(a: Point, b: Point, c: Point) -> F:
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def rational_rotation(center: Point, point: Point, parameter: F) -> Point:
    """Rotate ``point-center`` by the rational half-angle parameter."""

    x = point[0] - center[0]
    y = point[1] - center[1]
    denominator = 1 + parameter * parameter
    cosine_numerator = 1 - parameter * parameter
    sine_numerator = 2 * parameter
    return (
        center[0] + (cosine_numerator * x - sine_numerator * y) / denominator,
        center[1] + (sine_numerator * x + cosine_numerator * y) / denominator,
    )


BISECTOR_SLOPE = (SEED_POINTS["v"][1] + SEED_POINTS["xv"][1]) / (
    SEED_POINTS["v"][0] + SEED_POINTS["xv"][0]
)
assert BISECTOR_SLOPE == F(-5, 82)


def candidate_from_parameters(cv_x: F, av_rotation: F, bv_rotation: F) -> Candidate:
    """Construct a coupled row from one bisector and two circle parameters."""

    cv = (cv_x, BISECTOR_SLOPE * cv_x)
    av = rational_rotation(cv, SEED_POINTS["v"], av_rotation)
    bv = rational_rotation(cv, SEED_POINTS["v"], bv_rotation)
    points = dict(SEED_POINTS)
    points.update({"cv": cv, "av": av, "bv": bv})
    return Candidate(tuple((name, points[name]) for name in CARRIER_ORDER))


def known_candidate() -> Candidate:
    """The least-coordinate-denominator survivor of the replay grid."""

    return candidate_from_parameters(F(79, 100), F(-1, 4), F(-14, 5))


def replace_candidate(
    candidate: Candidate,
    updates: Mapping[str, Point] | None = None,
    order: Sequence[str] | None = None,
) -> Candidate:
    points = candidate.point_map()
    points.update(updates or {})
    return Candidate(
        tuple((name, points[name]) for name in CARRIER_ORDER),
        tuple(order) if order is not None else candidate.order,
    )


def _ordered_names(names: Iterable[str]) -> list[str]:
    selected = set(names)
    return [name for name in CARRIER_ORDER if name in selected]


def _fiber_names(
    points: Mapping[str, Point], center: str, radius2: F
) -> frozenset[str]:
    return frozenset(
        name
        for name, point in points.items()
        if dist2(points[center], point) == radius2
    )


def _positive_multiplicities(
    points: Mapping[str, Point], center: str, deleted: str
) -> tuple[int, ...]:
    counts = Counter(
        dist2(points[center], point)
        for name, point in points.items()
        if name != deleted and dist2(points[center], point) > 0
    )
    return tuple(sorted(counts.values(), reverse=True))


def _verify_complete_rows(
    points: Mapping[str, Point],
) -> tuple[F, frozenset[str], F, frozenset[str]]:
    ku_radius2 = dist2(points["cu"], points["u"])
    ku = _fiber_names(points, "cu", ku_radius2)
    if ku_radius2 <= 0 or ku != KU_NAMES:
        raise VerificationError("ku_complete", f"actual Ku is {_ordered_names(ku)}")

    kv_radius2 = dist2(points["cv"], points["v"])
    kv = _fiber_names(points, "cv", kv_radius2)
    if kv_radius2 <= 0 or kv != KV_NAMES:
        raise VerificationError("kv_complete", f"actual Kv is {_ordered_names(kv)}")
    return ku_radius2, ku, kv_radius2, kv


def _verify_center_exclusions(
    points: Mapping[str, Point],
    physical: frozenset[str],
    ku: frozenset[str],
    kv: frozenset[str],
) -> None:
    if not {"cu", "cv"}.issubset(points):
        raise VerificationError(
            "center_membership", "a declared center is absent from the modeled carrier"
        )
    if "cu" in physical or "cv" in physical or "cu" in ku or "cv" in kv:
        raise VerificationError(
            "center_exclusion",
            "a center lies in an excluded modeled physical/fiber class",
        )


def _verify_post_deletion(
    points: Mapping[str, Point], center: str, deleted: str, code: str
) -> tuple[int, ...]:
    multiplicities = _positive_multiplicities(points, center, deleted)
    if max(multiplicities, default=0) >= 4:
        raise VerificationError(
            code,
            f"{center} retains a positive four-fiber after deleting {deleted}",
        )
    return multiplicities


def verify_candidate(candidate: Candidate) -> VerificationReport:
    """Verify the fixed 12-role positive control with exact arithmetic only."""

    points = candidate.point_map()
    expected_roles = set(CARRIER_ORDER)
    if len(candidate.points) != len(CARRIER_ORDER) or set(points) != expected_roles:
        raise VerificationError(
            "carrier_roles", "carrier roles are not exactly the 12 declared roles"
        )
    if (
        len(candidate.order) != len(CARRIER_ORDER)
        or set(candidate.order) != expected_roles
    ):
        raise VerificationError(
            "carrier_order", "cyclic order is not a permutation of all roles"
        )
    if len(set(points.values())) != len(CARRIER_ORDER):
        raise VerificationError(
            "distinct", "two carrier roles have the same exact point"
        )

    edge_minima: list[F] = []
    for edge_index, left_name in enumerate(candidate.order):
        right_name = candidate.order[(edge_index + 1) % len(candidate.order)]
        values = [
            orient(points[left_name], points[right_name], points[other_name])
            for other_name in candidate.order
            if other_name not in {left_name, right_name}
        ]
        if not values or any(value <= 0 for value in values):
            raise VerificationError(
                "strict_convexity",
                f"edge {left_name}->{right_name} lacks a strict left margin",
            )
        edge_minima.append(min(values))

    physical = _fiber_names(points, "O", F(1))
    if physical != PHYSICAL_NAMES:
        raise VerificationError(
            "physical_class",
            f"actual O-radius-1 fiber is {_ordered_names(physical)}",
        )

    ku_radius2, ku, kv_radius2, kv = _verify_complete_rows(points)
    _verify_center_exclusions(points, physical, ku, kv)
    if "v" in ku or "u" in kv:
        raise VerificationError(
            "mutual_omissions", "u or v lies in the mutually omitted row"
        )

    iu = ku & physical
    iv = kv & physical
    if (
        iu != frozenset({"u", "xu"})
        or iv != frozenset({"v", "xv"})
        or not iu.isdisjoint(iv)
        or physical != iu | iv | {"delta"}
    ):
        raise VerificationError(
            "rigid_intersections", "the physical intersections are not 2+2+1"
        )

    if points["cu"] == points["cv"] or "cu" in physical:
        raise VerificationError("center_separation", "cu is not outside C or cu=cv")

    post_u = _verify_post_deletion(points, "cu", "u", "post_u_deletion")
    post_v = _verify_post_deletion(points, "cv", "v", "post_v_deletion")

    return VerificationReport(
        edge_minimum=min(edge_minima),
        physical_radius_squared=F(1),
        ku_radius_squared=ku_radius2,
        kv_radius_squared=kv_radius2,
        post_u_max_multiplicity=max(post_u, default=0),
        post_v_max_multiplicity=max(post_v, default=0),
        post_u_multiplicities=post_u,
        post_v_multiplicities=post_v,
    )


def _reduced_rationals(lo: F, hi: F, maximum_denominator: int) -> tuple[F, ...]:
    values: set[F] = set()
    for denominator in range(1, maximum_denominator + 1):
        minimum_numerator = -((-lo.numerator * denominator) // lo.denominator)
        maximum_numerator = (hi.numerator * denominator) // hi.denominator
        for numerator in range(minimum_numerator, maximum_numerator + 1):
            if gcd(abs(numerator), denominator) == 1:
                values.add(F(numerator, denominator))
    return tuple(sorted(values))


AV_ROTATION_GRID = _reduced_rationals(F(-3, 10), F(-1, 5), 16)
BV_ROTATION_GRID = _reduced_rationals(F(-3), F(-5, 2), 16)
CV_X_GRID = tuple(F(numerator, 1000) for numerator in range(789, 800))
assert len(AV_ROTATION_GRID) == 9
assert len(BV_ROTATION_GRID) == 41


def _candidate_complexity(
    candidate: Candidate, cv_x: F, av_rotation: F, bv_rotation: F
) -> tuple[Any, ...]:
    coordinates = [
        coordinate for _name, point in candidate.points for coordinate in point
    ]
    return (
        max(value.denominator for value in coordinates),
        sum(
            abs(value.numerator).bit_length() + value.denominator.bit_length()
            for value in coordinates
        ),
        cv_x,
        av_rotation,
        bv_rotation,
    )


@lru_cache(maxsize=1)
def bounded_grid_search() -> SearchOutcome:
    """Exhaust the small rational replay grid and select the simplest survivor."""

    attempted = 0
    survivors = 0
    best: tuple[tuple[Any, ...], Candidate, F, F, F] | None = None
    for cv_x, av_rotation, bv_rotation in itertools.product(
        CV_X_GRID, AV_ROTATION_GRID, BV_ROTATION_GRID
    ):
        attempted += 1
        candidate = candidate_from_parameters(cv_x, av_rotation, bv_rotation)
        try:
            verify_candidate(candidate)
        except VerificationError:
            continue
        survivors += 1
        key = _candidate_complexity(candidate, cv_x, av_rotation, bv_rotation)
        if best is None or key < best[0]:
            best = (key, candidate, cv_x, av_rotation, bv_rotation)

    if best is None:
        return SearchOutcome(None, attempted, survivors, None, None, None)
    return SearchOutcome(best[1], attempted, survivors, best[2], best[3], best[4])


def _z3_fraction(value: z3.ArithRef) -> F:
    simplified = z3.simplify(value)
    if not isinstance(simplified, z3.RatNumRef):
        raise VerificationError("z3_readback", f"non-rational model value {simplified}")
    return F(simplified.numerator_as_long(), simplified.denominator_as_long())


def _z3_dist2(
    a: tuple[z3.ArithRef, z3.ArithRef], b: tuple[z3.ArithRef, z3.ArithRef]
) -> z3.ArithRef:
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def _z3_orient(
    a: tuple[z3.ArithRef, z3.ArithRef],
    b: tuple[z3.ArithRef, z3.ArithRef],
    c: tuple[z3.ArithRef, z3.ArithRef],
) -> z3.ArithRef:
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def _z3_rational(value: F) -> z3.RatNumRef:
    return z3.RatVal(value.numerator, value.denominator)


def build_candidate_solver(
    candidate: Candidate, timeout_ms: int
) -> tuple[z3.Solver, dict[str, tuple[z3.ArithRef, z3.ArithRef]]]:
    """Build the source-auditable QF_NRA mirror of the exact verifier."""

    solver = z3.SolverFor("QF_NRA")
    solver.set("timeout", timeout_ms)
    variables = {
        name: (z3.Real(f"p_{name}_x"), z3.Real(f"p_{name}_y")) for name in CARRIER_ORDER
    }
    points = candidate.point_map()

    for name in CARRIER_ORDER:
        solver.add(variables[name][0] == _z3_rational(points[name][0]))
        solver.add(variables[name][1] == _z3_rational(points[name][1]))

    for left_name, right_name in itertools.combinations(CARRIER_ORDER, 2):
        solver.add(
            z3.Or(
                variables[left_name][0] != variables[right_name][0],
                variables[left_name][1] != variables[right_name][1],
            )
        )

    for edge_index, left_name in enumerate(candidate.order):
        right_name = candidate.order[(edge_index + 1) % len(candidate.order)]
        for other_name in candidate.order:
            if other_name not in {left_name, right_name}:
                solver.add(
                    _z3_orient(
                        variables[left_name],
                        variables[right_name],
                        variables[other_name],
                    )
                    > 0
                )

    physical_radius2 = _z3_rational(F(1))
    for name in CARRIER_ORDER:
        equation = _z3_dist2(variables["O"], variables[name]) == physical_radius2
        solver.add(equation if name in PHYSICAL_NAMES else z3.Not(equation))

    ku_radius2 = _z3_dist2(variables["cu"], variables["u"])
    kv_radius2 = _z3_dist2(variables["cv"], variables["v"])
    solver.add(ku_radius2 > 0, kv_radius2 > 0)
    for name in CARRIER_ORDER:
        ku_equation = _z3_dist2(variables["cu"], variables[name]) == ku_radius2
        kv_equation = _z3_dist2(variables["cv"], variables[name]) == kv_radius2
        solver.add(ku_equation if name in KU_NAMES else z3.Not(ku_equation))
        solver.add(kv_equation if name in KV_NAMES else z3.Not(kv_equation))

    solver.add(
        z3.Or(
            variables["cu"][0] != variables["cv"][0],
            variables["cu"][1] != variables["cv"][1],
        )
    )

    for center_name, deleted_name in (("cu", "u"), ("cv", "v")):
        remaining = [name for name in CARRIER_ORDER if name != deleted_name]
        for four_names in itertools.combinations(remaining, 4):
            radii = [
                _z3_dist2(variables[center_name], variables[name])
                for name in four_names
            ]
            solver.add(
                z3.Or(
                    radii[0] == 0,
                    radii[1] != radii[0],
                    radii[2] != radii[0],
                    radii[3] != radii[0],
                )
            )

    return solver, variables


def export_smt2(solver: z3.Solver) -> str:
    aliases: dict[str, str] = {}

    def canonical_alias(match: re.Match[str]) -> str:
        original = match.group(0)
        if original not in aliases:
            aliases[original] = f"?positive_control_{len(aliases):04d}"
        return aliases[original]

    lines = ["(set-logic QF_NRA)"]
    for name in CARRIER_ORDER:
        lines.append(f"(declare-fun p_{name}_x () Real)")
        lines.append(f"(declare-fun p_{name}_y () Real)")
    for assertion in solver.assertions():
        expression = re.sub(r"\?x[0-9]+", canonical_alias, assertion.sexpr())
        lines.append(f"(assert {expression})")
    lines.extend(("(check-sat)", "(get-model)"))
    return "\n".join(lines) + "\n"


def exact_model_readback(
    model: z3.ModelRef,
    variables: Mapping[str, tuple[z3.ArithRef, z3.ArithRef]],
) -> Candidate:
    points = []
    for name in CARRIER_ORDER:
        x = _z3_fraction(model.eval(variables[name][0], model_completion=True))
        y = _z3_fraction(model.eval(variables[name][1], model_completion=True))
        points.append((name, (x, y)))
    return Candidate(tuple(points))


def run_solver_smokes(timeout_ms: int) -> dict[str, Any]:
    """Run a hand-known SAT and a hand-known UNSAT QF_NRA instance."""

    sat_solver = z3.SolverFor("QF_NRA")
    sat_solver.set("timeout", timeout_ms)
    sat_x = z3.Real("known_sat_x")
    sat_solver.add(sat_x * sat_x == 1, sat_x > 0)
    sat_result = sat_solver.check()
    sat_readback = None
    if sat_result == z3.sat:
        sat_readback = _z3_fraction(
            sat_solver.model().eval(sat_x, model_completion=True)
        )

    unsat_solver = z3.SolverFor("QF_NRA")
    unsat_solver.set("timeout", timeout_ms)
    unsat_x = z3.Real("known_unsat_x")
    unsat_solver.add(unsat_x * unsat_x == 1, unsat_x == 0)
    unsat_result = unsat_solver.check()

    return {
        "known_sat": {
            "expected": "sat with x=1",
            "observed": str(sat_result),
            "exact_readback": _fraction_text(sat_readback)
            if sat_readback is not None
            else None,
            "passed": sat_result == z3.sat and sat_readback == 1,
        },
        "known_unsat": {
            "expected": "unsat",
            "observed": str(unsat_result),
            "passed": unsat_result == z3.unsat,
        },
    }


def mutation_checks() -> dict[str, Any]:
    """Require exact rejection of independent positive-control corruptions."""

    candidate = known_candidate()
    points = candidate.point_map()
    swapped_order = list(candidate.order)
    v_index = swapped_order.index("v")
    delta_index = swapped_order.index("delta")
    swapped_order[v_index], swapped_order[delta_index] = (
        swapped_order[delta_index],
        swapped_order[v_index],
    )
    ku_blocked = dict(points)
    for role, offset in zip(
        ("v", "delta", "cv", "xv"),
        ((F(1), F(0)), (F(0), F(1)), (F(-1), F(0)), (F(0), F(-1))),
        strict=True,
    ):
        ku_blocked[role] = (points["cu"][0] + offset[0], points["cu"][1] + offset[1])

    kv_blocked = dict(points)
    for role, offset in zip(
        ("u", "delta", "cu", "xu"),
        ((F(1), F(0)), (F(0), F(1)), (F(-1), F(0)), (F(0), F(-1))),
        strict=True,
    ):
        kv_blocked[role] = (points["cv"][0] + offset[0], points["cv"][1] + offset[1])

    contaminated = dict(points)
    contaminated["delta"] = rational_rotation(points["cu"], points["u"], F(1, 7))

    center_excluded = dict(points)
    center_excluded["cv"] = (F(-7, 25), F(24, 25))

    mutations: dict[str, tuple[Callable[[], Any], str]] = {
        "duplicate_point": (
            lambda: verify_candidate(replace_candidate(candidate, {"av": points["v"]})),
            "distinct",
        ),
        "cyclic_order_swap": (
            lambda: verify_candidate(replace_candidate(candidate, order=swapped_order)),
            "strict_convexity",
        ),
        "physical_radius_nudge": (
            lambda: verify_candidate(
                replace_candidate(
                    candidate,
                    {
                        "delta": (
                            points["delta"][0],
                            points["delta"][1] + F(1, 10**9),
                        )
                    },
                )
            ),
            "physical_class",
        ),
        "kv_radius_nudge": (
            lambda: verify_candidate(
                replace_candidate(
                    candidate,
                    {"bv": (points["bv"][0] + F(1, 10**9), points["bv"][1])},
                )
            ),
            "kv_complete",
        ),
        "off_row_fiber_contamination": (
            lambda: _verify_complete_rows(contaminated),
            "ku_complete",
        ),
        "mutual_omission_role_identification": (
            lambda: verify_candidate(replace_candidate(candidate, {"v": points["u"]})),
            "distinct",
        ),
        "center_role_identification": (
            lambda: verify_candidate(
                replace_candidate(candidate, {"cv": points["cu"]})
            ),
            "distinct",
        ),
        "center_physical_exclusion": (
            lambda: _verify_center_exclusions(
                center_excluded,
                _fiber_names(center_excluded, "O", F(1)),
                KU_NAMES,
                KV_NAMES,
            ),
            "center_exclusion",
        ),
        "ku_post_deletion_blocking": (
            lambda: _verify_post_deletion(ku_blocked, "cu", "u", "post_u_deletion"),
            "post_u_deletion",
        ),
        "kv_post_deletion_blocking": (
            lambda: _verify_post_deletion(kv_blocked, "cv", "v", "post_v_deletion"),
            "post_v_deletion",
        ),
    }
    result: dict[str, Any] = {}
    for name, (check, expected_code) in mutations.items():
        observed_code = None
        try:
            check()
        except VerificationError as exc:
            observed_code = exc.code
        result[name] = {
            "expected_rejection": expected_code,
            "observed_rejection": observed_code,
            "passed": observed_code == expected_code,
        }
    return result


def _fraction_text(value: F) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"{value.numerator}/{value.denominator}"


def _candidate_json(candidate: Candidate) -> dict[str, Any]:
    points = candidate.point_map()
    return {
        "carrier_cardinality": len(points),
        "cyclic_order": list(candidate.order),
        "points": {
            name: {
                "x": _fraction_text(points[name][0]),
                "y": _fraction_text(points[name][1]),
            }
            for name in CARRIER_ORDER
        },
        "physical_class": _ordered_names(PHYSICAL_NAMES),
        "Ku": _ordered_names(KU_NAMES),
        "Kv": _ordered_names(KV_NAMES),
    }


def _verification_json(report: VerificationReport) -> dict[str, Any]:
    return {
        "arithmetic": "fractions.Fraction; exact, no tolerance",
        "edge_nonincident_global_minimum": _fraction_text(report.edge_minimum),
        "physical_radius_squared": _fraction_text(report.physical_radius_squared),
        "Ku_radius_squared": _fraction_text(report.ku_radius_squared),
        "Kv_radius_squared": _fraction_text(report.kv_radius_squared),
        "post_u_deletion_max_positive_multiplicity": report.post_u_max_multiplicity,
        "post_v_deletion_max_positive_multiplicity": report.post_v_max_multiplicity,
        "post_u_deletion_positive_multiplicities": list(report.post_u_multiplicities),
        "post_v_deletion_positive_multiplicities": list(report.post_v_multiplicities),
    }


def _parse_fraction_text(value: Any, location: str) -> F:
    if (
        not isinstance(value, str)
        or re.fullmatch(r"-?(0|[1-9][0-9]*)(/[1-9][0-9]*)?", value) is None
    ):
        raise VerificationError(
            "replay_fraction", f"{location} is not a canonical rational string"
        )
    parsed = F(value)
    if _fraction_text(parsed) != value:
        raise VerificationError(
            "replay_fraction", f"{location} is not in canonical reduced form"
        )
    return parsed


def parse_serialized_result(document: Any) -> tuple[Candidate, VerificationReport]:
    """Parse one current positive-control result and rerun its exact checker."""

    if not isinstance(document, dict):
        raise VerificationError(
            "replay_document", "top-level JSON value is not an object"
        )
    if document.get("schema") != SCHEMA:
        raise VerificationError(
            "replay_schema", "result schema is stale or unsupported"
        )
    if document.get("status") != SAT_STATUS:
        raise VerificationError(
            "replay_status", "result does not carry the current positive status"
        )
    if document.get("claim_scope") != CLAIM_SCOPE:
        raise VerificationError("replay_scope", "result claim scope is stale or false")
    for flag in (
        "full_L1_claim",
        "s0_claim",
        "promotion_claim",
        "source_binding_claim",
    ):
        if document.get(flag) is not False:
            raise VerificationError("replay_scope", f"{flag} must be false")
    if document.get("encoded") != list(ENCODED_FACTS):
        raise VerificationError(
            "replay_ledger", "encoded ledger differs from this checker"
        )
    if document.get("assumptions") != list(ASSUMPTIONS):
        raise VerificationError(
            "replay_ledger", "assumptions ledger differs from this checker"
        )
    if document.get("omitted") != list(OMITTED_FACTS):
        raise VerificationError(
            "replay_ledger", "omitted ledger differs from this checker"
        )

    provenance = document.get("runtime_provenance")
    if (
        not isinstance(provenance, dict)
        or provenance.get("script_sha256") != _script_sha256()
    ):
        raise VerificationError(
            "replay_stale_script", "result was not emitted by these script bytes"
        )

    solver = document.get("solver")
    if (
        not isinstance(solver, dict)
        or solver.get("verdict") != "sat"
        or solver.get("exact_rational_readback") is not True
    ):
        raise VerificationError(
            "replay_status", "serialized solver status is absent or false"
        )

    witness = document.get("witness")
    expected_witness_keys = {
        "carrier_cardinality",
        "cyclic_order",
        "points",
        "physical_class",
        "Ku",
        "Kv",
    }
    if not isinstance(witness, dict) or set(witness) != expected_witness_keys:
        raise VerificationError("replay_witness", "witness fields are malformed")
    if (
        type(witness.get("carrier_cardinality")) is not int
        or witness["carrier_cardinality"] != 12
    ):
        raise VerificationError(
            "replay_witness", "carrier cardinality is not exactly 12"
        )
    if witness.get("cyclic_order") != list(CARRIER_ORDER):
        raise VerificationError(
            "replay_order", "serialized cyclic order is missing, extra, or stale"
        )

    serialized_points = witness.get("points")
    if not isinstance(serialized_points, dict) or set(serialized_points) != set(
        CARRIER_ORDER
    ):
        raise VerificationError(
            "replay_roles", "serialized point roles are missing or extra"
        )
    points: list[tuple[str, Point]] = []
    for name in CARRIER_ORDER:
        coordinates = serialized_points[name]
        if not isinstance(coordinates, dict) or set(coordinates) != {"x", "y"}:
            raise VerificationError(
                "replay_point", f"point {name} has malformed coordinates"
            )
        points.append(
            (
                name,
                (
                    _parse_fraction_text(coordinates["x"], f"{name}.x"),
                    _parse_fraction_text(coordinates["y"], f"{name}.y"),
                ),
            )
        )
    candidate = Candidate(tuple(points))
    report = verify_candidate(candidate)
    if witness != _candidate_json(candidate):
        raise VerificationError(
            "replay_witness", "serialized witness metadata is inconsistent"
        )
    if document.get("verification") != _verification_json(report):
        raise VerificationError(
            "replay_verification", "serialized exact verification is inconsistent"
        )
    return candidate, report


def run_replay_result(path: Path) -> dict[str, Any]:
    """Read and exactly replay one result JSON without writing any file."""

    try:
        document = json.loads(path.read_text(encoding="utf-8"))
        candidate, report = parse_serialized_result(document)
    except (OSError, UnicodeError, json.JSONDecodeError, VerificationError) as exc:
        result = _base_result(BLOCKED_STATUS)
        result.update(
            {
                "mode": "no-write-replay",
                "writes_files": False,
                "replayed": False,
                "reason": str(exc),
            }
        )
        return result

    result = _base_result(SAT_STATUS)
    result.update(
        {
            "mode": "no-write-replay",
            "writes_files": False,
            "replayed": True,
            "solver_reexecution": False,
            "witness": _candidate_json(candidate),
            "verification": _verification_json(report),
        }
    )
    return result


def _current_git_head() -> str:
    try:
        completed = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=Path(__file__).resolve().parents[1],
            check=False,
            capture_output=True,
            text=True,
            timeout=5,
        )
    except (OSError, subprocess.TimeoutExpired):
        return "unavailable"
    candidate = completed.stdout.strip()
    if completed.returncode == 0 and re.fullmatch(r"[0-9a-f]{40}", candidate):
        return candidate
    return "unavailable"


def _script_sha256() -> str:
    return hashlib.sha256(Path(__file__).read_bytes()).hexdigest()


def runtime_provenance() -> dict[str, Any]:
    git_head = _current_git_head()
    return {
        "git_head": git_head,
        "git_head_available": git_head != "unavailable",
        "script_sha256": _script_sha256(),
        "script_path": "scripts/rigid221_s0_l1.py",
        "authentication_claim": (
            "none: git HEAD identifies repository state but does not authenticate "
            "uncommitted script bytes; script_sha256 separately binds executed bytes"
        ),
    }


def _base_result(status: str) -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "status": status,
        "claim_scope": CLAIM_SCOPE,
        "full_L1_claim": False,
        "s0_claim": False,
        "promotion_claim": False,
        "evidence_boundary": (
            "fixed distinct 12-role positive control: external exact Fraction replay "
            "plus unchecked Z3 SMT verdict"
        ),
        "contextual_source_declaration": SOURCE_DECLARATION,
        "contextual_final_consumer": FINAL_CONSUMER,
        "source_binding_claim": False,
        "lane_base_head": LANE_BASE_HEAD,
        "runtime_provenance": runtime_provenance(),
        "encoded": list(ENCODED_FACTS),
        "assumptions": list(ASSUMPTIONS),
        "omitted": list(OMITTED_FACTS),
    }


def _solver_smoke_classification(smokes: Mapping[str, Mapping[str, Any]]) -> str:
    observations = [item.get("observed") for item in smokes.values()]
    if "unknown" in observations:
        return UNKNOWN_STATUS
    if all(item.get("passed") is True for item in smokes.values()):
        return SAT_STATUS
    return BLOCKED_STATUS


def _solver_check_candidate(
    candidate: Candidate, timeout_ms: int
) -> tuple[str, str | None, Candidate | None, str]:
    solver, variables = build_candidate_solver(candidate, timeout_ms)
    smt2 = export_smt2(solver)
    result = solver.check()
    if result == z3.unknown:
        return "unknown", solver.reason_unknown(), None, smt2
    if result == z3.unsat:
        return "unsat", None, None, smt2
    readback = exact_model_readback(solver.model(), variables)
    return "sat", None, readback, smt2


def run_discovery(timeout_ms: int = 5_000) -> ExecutionBundle:
    try:
        smokes = run_solver_smokes(timeout_ms)
    except VerificationError as exc:
        result = _base_result(BLOCKED_STATUS)
        result["reason"] = f"solver smoke exact-readback checker failed: {exc}"
        return ExecutionBundle(result, None)
    smoke_status = _solver_smoke_classification(smokes)
    if smoke_status != SAT_STATUS:
        result = _base_result(smoke_status)
        result["reason"] = (
            "known SAT/UNSAT QF_NRA smoke was inconclusive"
            if smoke_status == UNKNOWN_STATUS
            else "known SAT/UNSAT QF_NRA smoke contradicted its hand-known result"
        )
        result["solver_smokes"] = smokes
        return ExecutionBundle(result, None)

    search = bounded_grid_search()
    if search.candidate is None:
        result = _base_result(UNKNOWN_STATUS)
        result["reason"] = (
            "bounded rational grid has no exact positive-control survivor"
        )
        result["search"] = _search_json(search)
        result["solver_smokes"] = smokes
        return ExecutionBundle(result, None)

    try:
        report = verify_candidate(search.candidate)
    except VerificationError as exc:
        result = _base_result(BLOCKED_STATUS)
        result["reason"] = str(exc)
        result["search"] = _search_json(search)
        return ExecutionBundle(result, None)

    verdict, reason_unknown, readback, smt2 = _solver_check_candidate(
        search.candidate, timeout_ms
    )
    smt2_sha256 = hashlib.sha256(smt2.encode("utf-8")).hexdigest()
    if verdict == "unknown":
        result = _base_result(UNKNOWN_STATUS)
        result["reason"] = f"Z3 returned unknown: {reason_unknown}"
    elif verdict != "sat" or readback is None:
        result = _base_result(BLOCKED_STATUS)
        result["reason"] = "QF_NRA mirror rejected the exact Fraction survivor"
    else:
        try:
            readback_report = verify_candidate(readback)
        except VerificationError as exc:
            result = _base_result(BLOCKED_STATUS)
            result["reason"] = f"exact model readback failed: {exc}"
        else:
            if readback != search.candidate or readback_report != report:
                result = _base_result(BLOCKED_STATUS)
                result["reason"] = (
                    "exact Z3 readback differs from the selected Fraction witness"
                )
            else:
                result = _base_result(SAT_STATUS)
                result["witness"] = _candidate_json(search.candidate)
                result["verification"] = _verification_json(report)

    result["search"] = _search_json(search)
    result["solver_smokes"] = smokes
    result["solver"] = {
        "engine": "z3",
        "logic": "QF_NRA",
        "timeout_ms": timeout_ms,
        "verdict": verdict,
        "reason_unknown": reason_unknown,
        "smt2_sha256": smt2_sha256,
        "exact_rational_readback": readback is not None,
    }
    return ExecutionBundle(result, smt2)


def _search_json(search: SearchOutcome) -> dict[str, Any]:
    return {
        "method": "exhaustive bounded rational perpendicular-bisector/rotation grid",
        "cv_x_grid": {
            "first": _fraction_text(CV_X_GRID[0]),
            "last": _fraction_text(CV_X_GRID[-1]),
            "count": len(CV_X_GRID),
        },
        "rotation_max_denominator": 16,
        "av_rotation_interval": ["-3/10", "-1/5"],
        "bv_rotation_interval": ["-3", "-5/2"],
        "attempted": search.attempted,
        "exact_survivors": search.exact_survivors,
        "selection_rule": "minimum max coordinate denominator, then exact bit complexity",
        "selected_parameters": (
            {
                "cv_x": _fraction_text(search.cv_x),
                "av_rotation": _fraction_text(search.av_rotation),
                "bv_rotation": _fraction_text(search.bv_rotation),
            }
            if search.cv_x is not None
            and search.av_rotation is not None
            and search.bv_rotation is not None
            else None
        ),
    }


def run_smoke(timeout_ms: int = 5_000) -> dict[str, Any]:
    """Run all gates without creating a directory or writing any artifact."""

    try:
        solver_smokes = run_solver_smokes(timeout_ms)
        solver_smoke_status = _solver_smoke_classification(solver_smokes)
    except VerificationError as exc:
        solver_smokes = {}
        solver_smoke_status = BLOCKED_STATUS
        solver_smoke_error = str(exc)
    else:
        solver_smoke_error = None
    mutations = mutation_checks()
    exact_candidate_ok = True
    candidate_solver_ok = False
    candidate_error = None
    candidate_verdict = None
    candidate_reason_unknown = None
    try:
        candidate = known_candidate()
        verify_candidate(candidate)
        candidate_verdict, candidate_reason_unknown, readback, _smt2 = (
            _solver_check_candidate(candidate, timeout_ms)
        )
        candidate_solver_ok = candidate_verdict == "sat" and readback == candidate
        if candidate_verdict == "sat" and readback != candidate:
            candidate_error = "exact solver readback differs from the fixed candidate"
        elif candidate_verdict == "unsat":
            candidate_error = "solver rejected the exactly verified fixed candidate"
    except VerificationError as exc:
        exact_candidate_ok = False
        candidate_error = str(exc)

    actual_failure = (
        not exact_candidate_ok
        or solver_smoke_status == BLOCKED_STATUS
        or candidate_verdict == "unsat"
        or (candidate_verdict == "sat" and not candidate_solver_ok)
        or not all(item["passed"] for item in mutations.values())
    )
    inconclusive = (
        solver_smoke_status == UNKNOWN_STATUS or candidate_verdict == "unknown"
    )
    status = (
        BLOCKED_STATUS
        if actual_failure
        else UNKNOWN_STATUS
        if inconclusive
        else SAT_STATUS
    )
    result = _base_result(status)
    result.update(
        {
            "mode": "no-write-smoke",
            "writes_files": False,
            "known_candidate_exact": exact_candidate_ok,
            "candidate_qf_nra_sat_exact_readback": candidate_solver_ok,
            "candidate_solver_verdict": candidate_verdict,
            "candidate_reason_unknown": candidate_reason_unknown,
            "candidate_error": candidate_error,
            "solver_smoke_error": solver_smoke_error,
            "solver_smokes": solver_smokes,
            "mutation_checks": mutations,
        }
    )
    return result


def _json_text(value: Mapping[str, Any]) -> str:
    return json.dumps(value, indent=2, sort_keys=True) + "\n"


def write_bundle(output_dir: Path, bundle: ExecutionBundle) -> tuple[Path, Path | None]:
    output_dir.mkdir(parents=True, exist_ok=True)
    smt2_path = None
    if bundle.smt2 is not None:
        smt2_path = output_dir / "positive_control_query.smt2"
        smt2_path.write_text(bundle.smt2, encoding="utf-8")
    result_path = output_dir / "positive_control_result.json"
    result_path.write_text(_json_text(bundle.result), encoding="utf-8")
    return result_path, smt2_path


def parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    modes = parser.add_mutually_exclusive_group(required=True)
    modes.add_argument(
        "--smoke",
        action="store_true",
        help="run fixed-positive-control no-write smoke and mutation checks",
    )
    modes.add_argument(
        "--output-dir",
        type=Path,
        help="discover the positive control and write deterministic JSON/SMT2 here",
    )
    modes.add_argument(
        "--replay-result",
        type=Path,
        help="read and exactly replay one serialized result without writing",
    )
    parser.add_argument("--timeout-ms", type=int, default=5_000)
    args = parser.parse_args(argv)
    if args.timeout_ms <= 0:
        parser.error("--timeout-ms must be positive")
    return args


def _exit_code(status: str) -> int:
    if status == SAT_STATUS:
        return 0
    if status == UNKNOWN_STATUS:
        return 2
    return 1


def main(argv: Sequence[str] | None = None) -> int:
    args = parse_args(argv)
    if args.replay_result is not None:
        result = run_replay_result(args.replay_result)
        print(_json_text(result), end="")
        return _exit_code(result["status"])
    if args.smoke:
        result = run_smoke(args.timeout_ms)
        print(_json_text(result), end="")
        return _exit_code(result["status"])

    bundle = run_discovery(args.timeout_ms)
    result_path, smt2_path = write_bundle(args.output_dir, bundle)
    summary = {
        "status": bundle.result["status"],
        "result": result_path.name,
        "smt2": smt2_path.name if smt2_path is not None else None,
        "positive_control_found": bundle.result["status"] == SAT_STATUS,
    }
    print(json.dumps(summary, sort_keys=True))
    return _exit_code(bundle.result["status"])


if __name__ == "__main__":
    raise SystemExit(main())
