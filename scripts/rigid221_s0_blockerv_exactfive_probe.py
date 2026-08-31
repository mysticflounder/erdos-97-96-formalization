"""Bounded PiQD input for the literal-blocker-``v`` exact-five branch.

This program serializes one fixed-order QF_NRA discovery cell.  It does not
claim source coverage: the Moser normalization, the selected cyclic order,
and pairwise-distinct modeled roles are explicit fixed-cell controls.  The
source-mapped part records the rigid physical five-class, both exact rows,
literal source-blocker identity, source-row heaviness, and the exact-five
second-cap branch.

The emitted formula is deliberately flat SMT-LIB2 so that
``rigid221_s0_common_core_piqd.py`` can send its exact bytes to a fresh PiQD
SMT session.  A local exact-Fraction replay is provided for a SAT readback;
an SMT result by itself remains formula-scoped discovery evidence.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from collections import Counter
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any

import z3

Point = tuple[Fraction, Fraction]
Z3Point = tuple[z3.ArithRef, z3.ArithRef]

ROLE_ORDER = (
    "O",
    "m1",
    "m2",
    "u",
    "xu",
    "delta",
    "v",
    "xv",
    "au",
    "bu",
    "av",
    "bv",
    "cv",
)
ROLE_SET = frozenset(ROLE_ORDER)
MOSER = ("m1", "m2", "O")
PHYSICAL = frozenset({"u", "xu", "delta", "v", "xv"})
SOURCE_ROW = frozenset({"u", "xu", "au", "bu"})
OPPOSITE_ROW = frozenset({"v", "xv", "av", "bv"})
EXACT_J = frozenset({"u", "xu", "v"})

# The `cu = v` identification removes the separate source-center role.  The
# three exact J interior points occur between the Moser endpoints m1 and m2.
ORDER = (
    "O",
    "au",
    "av",
    "delta",
    "m1",
    "v",
    "u",
    "xu",
    "m2",
    "xv",
    "bv",
    "bu",
    "cv",
)

FIXED_POINTS: dict[str, Point] = {
    "O": (Fraction(0), Fraction(0)),
    "m1": (Fraction(8, 5), Fraction(-4, 5)),
    "m2": (Fraction(8, 5), Fraction(4, 5)),
}
MEC_CENTER: Point = (Fraction(1), Fraction(0))
MEC_RADIUS2 = Fraction(1)
SURPLUS_CAP_INDEX = 0
J_CAP_INDEX = 2
RESULT_SCHEMA = "rigid221-s0-blockerv-exactfive-probe/v1"


class VerificationError(ValueError):
    """An exact SAT-model replay or fixed-cell invariant failed."""


@dataclass(frozen=True)
class ExactWitness:
    points: tuple[tuple[str, Point], ...]
    physical_radius2: Fraction
    source_radius2: Fraction
    opposite_radius2: Fraction

    def point_map(self) -> dict[str, Point]:
        return dict(self.points)


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise VerificationError(message)


def dist2(left: Point, right: Point) -> Fraction:
    return (left[0] - right[0]) ** 2 + (left[1] - right[1]) ** 2


def orient(first: Point, second: Point, third: Point) -> Fraction:
    return (
        (second[0] - first[0]) * (third[1] - first[1])
        - (second[1] - first[1]) * (third[0] - first[0])
    )


def dot(left: Point, right: Point) -> Fraction:
    return left[0] * right[0] + left[1] * right[1]


def sub(left: Point, right: Point) -> Point:
    return (left[0] - right[0], left[1] - right[1])


def on_arc_opposite(apex: Point, endpoint1: Point, endpoint2: Point, point: Point) -> bool:
    return orient(point, endpoint1, endpoint2) * orient(apex, endpoint1, endpoint2) <= 0


def cap_arm(role: str) -> int:
    """Return the closed cap determined by the fixed cyclic-order arc."""

    if role not in ROLE_SET - set(MOSER):
        raise VerificationError(f"cap arm requested for non-carrier role {role!r}")
    positions = {name: index for index, name in enumerate(ORDER)}
    _require(
        positions["O"] == 0 and positions["O"] < positions["m1"] < positions["m2"],
        "fixed order does not realize the Moser arc normalization",
    )
    position = positions[role]
    if positions["O"] < position < positions["m1"]:
        return 1
    if positions["m1"] < position < positions["m2"]:
        return 2
    return 0


def derive_caps(points: Mapping[str, Point]) -> tuple[frozenset[str], ...]:
    v1, v2, v3 = (points[role] for role in MOSER)
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
    return caps[index] - set(endpoints[index])


def _fiber(points: Mapping[str, Point], center: str, radius2: Fraction) -> frozenset[str]:
    return frozenset(role for role in ROLE_ORDER if dist2(points[center], points[role]) == radius2)


def _verify_exact_fiber(
    points: Mapping[str, Point],
    center: str,
    radius2: Fraction,
    expected: frozenset[str],
    label: str,
) -> None:
    actual = _fiber(points, center, radius2)
    _require(actual == expected, f"{label}: expected {sorted(expected)}, got {sorted(actual)}")


def _verify_no_qfree(points: Mapping[str, Point], center: str, deleted: str, label: str) -> int:
    multiplicities = Counter(
        dist2(points[center], points[role])
        for role in ROLE_ORDER
        if role != deleted and dist2(points[center], points[role]) > 0
    )
    maximum = max(multiplicities.values(), default=0)
    _require(maximum <= 3, f"{label}: positive multiplicity {maximum}")
    return maximum


def replay_witness(witness: ExactWitness) -> dict[str, Any]:
    """Check every active fixed-cell predicate over exact rationals."""

    names = tuple(name for name, _point in witness.points)
    _require(names == ROLE_ORDER, "witness roles are missing or reordered")
    points = witness.point_map()
    _require(set(points) == ROLE_SET, "witness roles differ from the probe carrier")
    _require(len(set(points.values())) == len(ROLE_ORDER), "modeled roles are not pairwise distinct")
    for role, expected in FIXED_POINTS.items():
        _require(points[role] == expected, f"wrong fixed coordinate for {role}")

    _require(witness.physical_radius2 > 0, "physical radius is not positive")
    _require(witness.source_radius2 > 0, "source-row radius is not positive")
    _require(witness.opposite_radius2 > 0, "opposite-row radius is not positive")
    _verify_exact_fiber(points, "O", witness.physical_radius2, PHYSICAL, "physical fiber")
    _verify_exact_fiber(points, "v", witness.source_radius2, SOURCE_ROW, "literal blocker-v source row")
    _verify_exact_fiber(points, "cv", witness.opposite_radius2, OPPOSITE_ROW, "opposite row")
    _require("v" not in SOURCE_ROW and "u" not in OPPOSITE_ROW, "mutual omission failed")
    _require(SOURCE_ROW & PHYSICAL == {"u", "xu"}, "source rigid trace failed")
    _require(OPPOSITE_ROW & PHYSICAL == {"v", "xv"}, "opposite rigid trace failed")
    _require(
        PHYSICAL == (SOURCE_ROW & PHYSICAL) | (OPPOSITE_ROW & PHYSICAL) | {"delta"},
        "rigid 2+2+1 cover failed",
    )
    _require(points["v"] != points["O"], "literal blocker equals physical apex")
    _require(points["cv"] != points["O"], "opposite center equals physical apex")

    for role in ROLE_ORDER:
        _require(dist2(MEC_CENTER, points[role]) <= MEC_RADIUS2, f"{role} outside MEC disk")
    for role in MOSER:
        _require(dist2(MEC_CENTER, points[role]) == MEC_RADIUS2, f"{role} misses MEC boundary")
    m1, m2, o = (points[role] for role in MOSER)
    dots = (
        dot(sub(m2, m1), sub(o, m1)),
        dot(sub(o, m2), sub(m1, m2)),
        dot(sub(m1, o), sub(m2, o)),
    )
    _require(all(value >= 0 for value in dots), "Moser triangle is not non-obtuse")

    orientations: list[Fraction] = []
    for index, first in enumerate(ORDER):
        second = ORDER[(index + 1) % len(ORDER)]
        for third in ORDER:
            if third in {first, second}:
                continue
            value = orient(points[first], points[second], points[third])
            _require(value > 0, f"nonpositive cyclic turn {first}->{second} at {third}")
            orientations.append(value)

    caps = derive_caps(points)
    for role in ROLE_ORDER:
        if role in MOSER:
            continue
        memberships = [role in cap for cap in caps]
        _require(sum(memberships) == 1, f"{role} belongs to {sum(memberships)} caps")
        _require(role in caps[cap_arm(role)], f"{role} misses its order cap")
    interiors = tuple(cap_interior(caps, index) for index in range(3))
    _require(len(caps[SURPLUS_CAP_INDEX]) > 4, "surplus cap has at most four points")
    _require(caps[J_CAP_INDEX] == {"m1", "m2", *EXACT_J}, "closed J cap is not exact-five")
    _require(interiors[J_CAP_INDEX] == EXACT_J, "strict J interior is not {u,xu,v}")

    post_source = _verify_no_qfree(points, "v", "u", "post-source/v")
    post_opposite = _verify_no_qfree(points, "cv", "v", "post-opposite/cv")
    return {
        "j_closed_cap": tuple(role for role in ROLE_ORDER if role in caps[J_CAP_INDEX]),
        "j_interior": tuple(role for role in ROLE_ORDER if role in interiors[J_CAP_INDEX]),
        "minimum_orientation": _fraction_text(min(orientations)),
        "moser_dot_products": [_fraction_text(value) for value in dots],
        "post_source_max_multiplicity": post_source,
        "post_opposite_max_multiplicity": post_opposite,
        "surplus_cap_size": len(caps[SURPLUS_CAP_INDEX]),
    }


def _z3_rat(value: Fraction) -> z3.RatNumRef:
    return z3.RealVal(f"{value.numerator}/{value.denominator}")


def _z3_dist2(left: Z3Point, right: Z3Point) -> z3.ArithRef:
    dx = left[0] - right[0]
    dy = left[1] - right[1]
    return dx * dx + dy * dy


def _z3_orient(first: Z3Point, second: Z3Point, third: Z3Point) -> z3.ArithRef:
    return (second[0] - first[0]) * (third[1] - first[1]) - (
        second[1] - first[1]
    ) * (third[0] - first[0])


def _z3_dot(left: Z3Point, right: Z3Point) -> z3.ArithRef:
    return left[0] * right[0] + left[1] * right[1]


def _z3_sub(left: Z3Point, right: Z3Point) -> Z3Point:
    return (left[0] - right[0], left[1] - right[1])


def _z3_on_arc(apex: Z3Point, endpoint1: Z3Point, endpoint2: Z3Point, point: Z3Point) -> z3.BoolRef:
    return _z3_orient(point, endpoint1, endpoint2) * _z3_orient(apex, endpoint1, endpoint2) <= 0


def _symbols() -> tuple[dict[str, Z3Point], tuple[z3.ArithRef, z3.ArithRef, z3.ArithRef]]:
    points = {
        role: (z3.Real(f"blockerv_exactfive__{role}_x"), z3.Real(f"blockerv_exactfive__{role}_y"))
        for role in ROLE_ORDER
    }
    radii = (
        z3.Real("blockerv_exactfive__rho2"),
        z3.Real("blockerv_exactfive__source_radius2"),
        z3.Real("blockerv_exactfive__opposite_radius2"),
    )
    return points, radii


def _add_exact_fiber(
    solver: z3.Solver,
    points: Mapping[str, Z3Point],
    center: str,
    radius2: z3.ArithRef,
    expected: frozenset[str],
) -> None:
    for role in ROLE_ORDER:
        equality = _z3_dist2(points[center], points[role]) == radius2
        solver.add(equality if role in expected else z3.Not(equality))


def _add_cap_constraints(solver: z3.Solver, points: Mapping[str, Z3Point]) -> None:
    v1, v2, v3 = (points[role] for role in MOSER)
    triples = ((v1, v2, v3), (v2, v3, v1), (v3, v1, v2))
    membership = {
        (index, role): _z3_on_arc(apex, endpoint1, endpoint2, points[role])
        for index, (apex, endpoint1, endpoint2) in enumerate(triples)
        for role in ROLE_ORDER
    }
    endpoint_patterns = (
        (("m1", False), ("m2", True), ("O", True)),
        (("m1", True), ("m2", False), ("O", True)),
        (("m1", True), ("m2", True), ("O", False)),
    )
    for index, pattern in enumerate(endpoint_patterns):
        for role, expected in pattern:
            solver.add(membership[index, role] if expected else z3.Not(membership[index, role]))
    for role in ROLE_ORDER:
        if role in MOSER:
            continue
        arms = tuple(membership[index, role] for index in range(3))
        solver.add(z3.Or(*arms))
        for left, right in combinations(arms, 2):
            solver.add(z3.Or(z3.Not(left), z3.Not(right)))
        solver.add(membership[cap_arm(role), role])
    for role in ROLE_ORDER:
        expected = role in {"m1", "m2", *EXACT_J}
        solver.add(membership[J_CAP_INDEX, role] if expected else z3.Not(membership[J_CAP_INDEX, role]))


def _add_no_qfree(solver: z3.Solver, points: Mapping[str, Z3Point], center: str, deleted: str) -> None:
    remaining = [role for role in ROLE_ORDER if role not in {center, deleted}]
    for four in combinations(remaining, 4):
        distances = [_z3_dist2(points[center], points[role]) for role in four]
        solver.add(z3.Or(distances[0] <= 0, *(distance != distances[0] for distance in distances[1:])))


def build_solver(timeout_ms: int) -> z3.Solver:
    """Build the fixed 13-role literal-blocker-``v`` exact-five formula."""

    if timeout_ms <= 0:
        raise ValueError("timeout_ms must be positive")
    solver = z3.SolverFor("QF_NRA")
    solver.set("timeout", timeout_ms)
    points, (rho2, source_radius2, opposite_radius2) = _symbols()
    solver.add(rho2 > 0, source_radius2 > 0, opposite_radius2 > 0)
    for role, point in FIXED_POINTS.items():
        solver.add(points[role][0] == _z3_rat(point[0]))
        solver.add(points[role][1] == _z3_rat(point[1]))
    for left, right in combinations(ROLE_ORDER, 2):
        solver.add(z3.Or(points[left][0] != points[right][0], points[left][1] != points[right][1]))

    _add_exact_fiber(solver, points, "O", rho2, PHYSICAL)
    _add_exact_fiber(solver, points, "v", source_radius2, SOURCE_ROW)
    _add_exact_fiber(solver, points, "cv", opposite_radius2, OPPOSITE_ROW)
    for role in ROLE_ORDER:
        solver.add(_z3_dist2((_z3_rat(MEC_CENTER[0]), _z3_rat(MEC_CENTER[1])), points[role]) <= _z3_rat(MEC_RADIUS2))
    for role in MOSER:
        solver.add(_z3_dist2((_z3_rat(MEC_CENTER[0]), _z3_rat(MEC_CENTER[1])), points[role]) == _z3_rat(MEC_RADIUS2))
    m1, m2, o = (points[role] for role in MOSER)
    solver.add(_z3_dot(_z3_sub(m2, m1), _z3_sub(o, m1)) >= 0)
    solver.add(_z3_dot(_z3_sub(o, m2), _z3_sub(m1, m2)) >= 0)
    solver.add(_z3_dot(_z3_sub(m1, o), _z3_sub(m2, o)) >= 0)
    for index, first in enumerate(ORDER):
        second = ORDER[(index + 1) % len(ORDER)]
        for other in ORDER:
            if other not in {first, second}:
                solver.add(_z3_orient(points[first], points[second], points[other]) > 0)
    _add_cap_constraints(solver, points)
    _add_no_qfree(solver, points, "v", "u")
    _add_no_qfree(solver, points, "cv", "v")
    return solver


def export_smt2(timeout_ms: int = 120000, *, include_check_sat: bool = True) -> str:
    """Return deterministic flat QF_NRA bytes, optionally with the query command."""

    solver = build_solver(timeout_ms)
    declaration_lines = sorted(
        line.strip()
        for line in solver.to_smt2().splitlines()
        if line.strip().startswith("(declare-fun ")
    )
    assertions = [f"(assert {assertion.sexpr()})" for assertion in solver.assertions()]
    commands = ["(set-logic QF_NRA)", *declaration_lines, *assertions]
    if include_check_sat:
        commands.append("(check-sat)")
    return "\n".join(commands) + "\n"


def _fraction_text(value: Fraction) -> str:
    return f"{value.numerator}/{value.denominator}"


def _model_fraction(value: z3.ExprRef, label: str) -> Fraction:
    if not z3.is_rational_value(value):
        raise VerificationError(f"{label} is not rational: {value}")
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def read_exact_model(model: z3.ModelRef) -> ExactWitness:
    points, radii = _symbols()
    exact_points: list[tuple[str, Point]] = []
    for role in ROLE_ORDER:
        x = _model_fraction(model.eval(points[role][0], model_completion=True), f"{role}.x")
        y = _model_fraction(model.eval(points[role][1], model_completion=True), f"{role}.y")
        exact_points.append((role, (x, y)))
    values = tuple(
        _model_fraction(model.eval(radius, model_completion=True), f"radius[{index}]")
        for index, radius in enumerate(radii)
    )
    return ExactWitness(tuple(exact_points), values[0], values[1], values[2])


def direct_solve(timeout_ms: int) -> dict[str, Any]:
    """Independently solve with local Z3 and exactly replay a SAT witness."""

    solver = build_solver(timeout_ms)
    result = solver.check()
    if result == z3.sat:
        witness = read_exact_model(solver.model())
        report = replay_witness(witness)
        return {
            "status": "SAT",
            "report": report,
            "witness": {
                "points": {
                    role: [_fraction_text(point[0]), _fraction_text(point[1])]
                    for role, point in witness.points
                },
                "physical_radius2": _fraction_text(witness.physical_radius2),
                "source_radius2": _fraction_text(witness.source_radius2),
                "opposite_radius2": _fraction_text(witness.opposite_radius2),
            },
        }
    if result == z3.unsat:
        return {"status": "UNSAT"}
    return {"status": "UNKNOWN", "reason": solver.reason_unknown()}


def run_smoke(timeout_ms: int) -> dict[str, Any]:
    """Validate deterministic serialization and a known contradictory mutation."""

    formula = export_smt2(timeout_ms)
    session_formula = export_smt2(timeout_ms, include_check_sat=False)
    _require(
        formula == f"{session_formula}(check-sat)\n",
        "session SMT2 differs from the queried SMT2 prefix",
    )
    _require("(check-sat)" not in session_formula, "session SMT2 contains a query")
    _require(
        all(token not in formula for token in ("pbeq", "pbge", "pble")),
        "SMT2 exporter emitted a pseudo-Boolean operator",
    )
    parsed = z3.parse_smt2_string(formula)
    _require(len(parsed) == len(build_solver(timeout_ms).assertions()), "SMT2 parser lost assertions")
    contradictory = build_solver(timeout_ms)
    contradictory.add(z3.BoolVal(False))
    _require(contradictory.check() == z3.unsat, "known contradictory mutation did not return UNSAT")
    _require(cap_arm("v") == J_CAP_INDEX, "v does not occupy the J arm")
    _require(
        {role for role in ROLE_ORDER if role not in MOSER and cap_arm(role) == J_CAP_INDEX}
        == EXACT_J,
        "J arm differs from exact branch",
    )
    return {
        "assertions": len(build_solver(timeout_ms).assertions()),
        "formula_sha256": hashlib.sha256(formula.encode("utf-8")).hexdigest(),
        "status": "SMOKE_OK",
    }


def _canonical_json(value: Mapping[str, Any], *, pretty: bool) -> str:
    return json.dumps(value, indent=2 if pretty else None, sort_keys=True) + "\n"


def _atomic_write(path: Path, contents: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile("w", encoding="utf-8", dir=path.parent, delete=False) as handle:
        handle.write(contents)
        temporary = Path(handle.name)
    os.replace(temporary, path)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-smt2", type=Path)
    parser.add_argument("--output-session-smt2", type=Path)
    parser.add_argument("--output-json", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=120000)
    parser.add_argument("--smoke", action="store_true")
    parser.add_argument("--direct-solve", action="store_true")
    parser.add_argument("--verbose", action="store_true")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    if args.timeout_ms <= 0:
        raise SystemExit("--timeout-ms must be positive")
    if args.smoke:
        if (
            args.output_smt2 is not None
            or args.output_session_smt2 is not None
            or args.output_json is not None
            or args.direct_solve
        ):
            raise SystemExit("--smoke cannot be combined with output or direct-solve options")
        print(_canonical_json(run_smoke(args.timeout_ms), pretty=args.verbose), end="")
        return 0
    if (args.output_smt2 is None) != (args.output_json is None):
        raise SystemExit("--output-smt2 and --output-json must be supplied together")
    if args.output_session_smt2 is not None and args.output_smt2 is None:
        raise SystemExit("--output-session-smt2 requires both primary output paths")
    if args.output_smt2 is None:
        raise SystemExit("supply --smoke or both output paths")
    formula = export_smt2(args.timeout_ms)
    document: dict[str, Any] = {
        "schema": RESULT_SCHEMA,
        "scope": "bounded-fixed-order-formula",
        "formula_sha256": hashlib.sha256(formula.encode("utf-8")).hexdigest(),
        "formula_bytes": len(formula.encode("utf-8")),
        "assertions": len(build_solver(args.timeout_ms).assertions()),
        "literal_source_blocker": "v",
        "exact_j_interior": sorted(EXACT_J),
    }
    if args.direct_solve:
        document["direct_z3"] = direct_solve(args.timeout_ms)
    _atomic_write(args.output_smt2, formula)
    if args.output_session_smt2 is not None:
        session_formula = export_smt2(args.timeout_ms, include_check_sat=False)
        document["session_formula_sha256"] = hashlib.sha256(session_formula.encode("utf-8")).hexdigest()
        document["session_formula_bytes"] = len(session_formula.encode("utf-8"))
        _atomic_write(args.output_session_smt2, session_formula)
    _atomic_write(args.output_json, _canonical_json(document, pretty=True))
    summary = {
        "assertions": document["assertions"],
        "formula_sha256": document["formula_sha256"],
        "status": document.get("direct_z3", {}).get("status", "EMITTED"),
    }
    print(_canonical_json(summary, pretty=args.verbose), end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
