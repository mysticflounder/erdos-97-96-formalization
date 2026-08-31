"""Formula-scoped positive controls for the Rigid221 C3 two-row relation.

This bounded QF_NRA package retains the fixed Moser coordinates, one physical
five-circle, the literal source-blocker ``v`` row, and the ``cv`` row.  Exact
rational witnesses make the resulting relation satisfiable in both strict
midpoint-turn directions.

It is NOT a source realization and NOT an S0 proof.  In particular, it does
not establish a complete carrier, source coverage, or any omitted incidence
and deletion facts.  A local Z3 verdict is therefore formula-scoped evidence
only; the exact ``Fraction`` replay independently checks the supplied positive
controls.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any

import z3

Point = tuple[Fraction, Fraction]
Z3Point = tuple[z3.ArithRef, z3.ArithRef]

# Every emitted constraint follows these tuples, never an unordered collection.
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
    "cv",
    "av",
    "bv",
)
ROLE_SET = frozenset(ROLE_ORDER)
FIXED_ROLE_ORDER = ("O", "m1", "m2")
PHYSICAL = ("u", "xu", "delta", "v", "xv")
KU = ("u", "xu", "au", "bu")
KV = ("v", "xv", "av", "bv")
C3_NEGATIVE = ("u", "xu", "v")
C3_POSITIVE = ("delta", "xv")

MEC_CENTER: Point = (Fraction(1), Fraction(0))
MEC_RADIUS2 = Fraction(1)
FIXED_POINTS: dict[str, Point] = {
    "O": (Fraction(0), Fraction(0)),
    "m1": (Fraction(8, 5), Fraction(-4, 5)),
    "m2": (Fraction(8, 5), Fraction(4, 5)),
}
PHYSICAL_RADIUS2 = Fraction(289, 100)
KU_RADIUS2 = Fraction(289, 1625)
KV_RADIUS2 = Fraction(221, 400)
REFERENCE_RADIUS_VALUES = (PHYSICAL_RADIUS2, KU_RADIUS2, KV_RADIUS2)
RESULT_SCHEMA = "rigid221-s0-c3-two-row-relational-probe/v1"


class VerificationError(ValueError):
    """An exact positive control or formula-emission invariant failed."""


@dataclass(frozen=True)
class RelationalCell:
    """One strict orientation of the literal-blocker midpoint relation."""

    name: str
    turn_sign: int


FORWARD = RelationalCell("forward", 1)
REVERSE = RelationalCell("reverse", -1)
CELLS = (FORWARD, REVERSE)
_CELL_BY_NAME = {cell.name: cell for cell in CELLS}


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise VerificationError(message)


def _fraction_text(value: Fraction) -> str:
    return f"{value.numerator}/{value.denominator}"


def dist2(left: Point, right: Point) -> Fraction:
    dx = left[0] - right[0]
    dy = left[1] - right[1]
    return dx * dx + dy * dy


def orient(first: Point, second: Point, third: Point) -> Fraction:
    return (
        (second[0] - first[0]) * (third[1] - first[1])
        - (second[1] - first[1]) * (third[0] - first[0])
    )


def radius_fiber(
    points: Mapping[str, Point], center: str, radius2: Fraction
) -> tuple[str, ...]:
    """Return the named-carrier fiber in canonical role order."""

    return tuple(
        role for role in ROLE_ORDER if dist2(points[center], points[role]) == radius2
    )


def _verify_exact_fiber(
    points: Mapping[str, Point],
    center: str,
    radius2: Fraction,
    expected: tuple[str, ...],
    label: str,
) -> None:
    actual = radius_fiber(points, center, radius2)
    _require(actual == expected, f"{label}: expected {expected}, got {actual}")


def reference_points(cell: RelationalCell) -> dict[str, Point]:
    """Return one exact 13-role relational positive-control witness."""

    lower = (Fraction(1071, 650), Fraction(-136, 325))
    upper = (Fraction(1071, 650), Fraction(136, 325))
    if cell.turn_sign > 0:
        u, xu = lower, upper
        au = (Fraction(1139, 650), Fraction(-136, 325))
        bu = (Fraction(833, 650), Fraction(-17, 325))
    else:
        u, xu = upper, lower
        au = (Fraction(1139, 650), Fraction(136, 325))
        bu = (Fraction(833, 650), Fraction(17, 325))
    values: dict[str, Point] = {
        **FIXED_POINTS,
        "u": u,
        "xu": xu,
        "delta": (Fraction(3, 2), Fraction(-4, 5)),
        "v": (Fraction(17, 10), Fraction(0)),
        "xv": (Fraction(3, 2), Fraction(4, 5)),
        "au": au,
        "bu": bu,
        "cv": (Fraction(1), Fraction(1, 4)),
        "av": (Fraction(3, 10), Fraction(0)),
        "bv": (Fraction(5, 4), Fraction(-9, 20)),
    }
    return {role: values[role] for role in ROLE_ORDER}


def replay_reference_witness(cell: RelationalCell) -> dict[str, Any]:
    """Replay every active relation exactly over ``Fraction`` coordinates."""

    points = reference_points(cell)
    _require(tuple(points) == ROLE_ORDER, "reference witness roles are missing or reordered")
    _require(set(points) == ROLE_SET, "reference roles differ from the named carrier")
    _require(len(set(points.values())) == len(ROLE_ORDER), "named roles are not pairwise distinct")
    for role in FIXED_ROLE_ORDER:
        _require(points[role] == FIXED_POINTS[role], f"wrong fixed coordinate for {role}")

    _require(PHYSICAL_RADIUS2 > 0, "physical radius is not positive")
    _require(KU_RADIUS2 > 0, "literal blocker-v radius is not positive")
    _require(KV_RADIUS2 > 0, "cv radius is not positive")
    _verify_exact_fiber(points, "O", PHYSICAL_RADIUS2, PHYSICAL, "O physical fiber")
    _verify_exact_fiber(points, "v", KU_RADIUS2, KU, "v literal-blocker fiber")
    _verify_exact_fiber(points, "cv", KV_RADIUS2, KV, "cv row fiber")

    for role in ROLE_ORDER:
        _require(
            dist2(MEC_CENTER, points[role]) <= MEC_RADIUS2,
            f"{role} lies outside the fixed MEC disk",
        )

    c3_orientation = orient(points["O"], points["m1"], points["m2"])
    _require(c3_orientation != 0, "fixed Moser C3 orientation is zero")
    for role in C3_NEGATIVE:
        product = orient(points[role], points["m1"], points["m2"]) * c3_orientation
        _require(product < 0, f"{role} is not strictly on the actual C3 side")
    for role in C3_POSITIVE:
        product = orient(points[role], points["m1"], points["m2"]) * c3_orientation
        _require(product > 0, f"{role} is not strictly off the actual C3 side")

    midpoint_distance2 = dist2(points["v"], points["u"])
    _require(
        midpoint_distance2 == dist2(points["v"], points["xu"]),
        "literal blocker does not bisect the source pair",
    )
    first_turn = orient(points["O"], points["u"], points["v"])
    second_turn = orient(points["O"], points["v"], points["xu"])
    if cell.turn_sign > 0:
        _require(first_turn > 0 and second_turn > 0, "forward midpoint turns are not strict")
    else:
        _require(first_turn < 0 and second_turn < 0, "reverse midpoint turns are not strict")

    return {
        "cell": cell.name,
        "physical_radius2": _fraction_text(PHYSICAL_RADIUS2),
        "ku_radius2": _fraction_text(KU_RADIUS2),
        "kv_radius2": _fraction_text(KV_RADIUS2),
        "physical_fiber": list(radius_fiber(points, "O", PHYSICAL_RADIUS2)),
        "ku_fiber": list(radius_fiber(points, "v", KU_RADIUS2)),
        "kv_fiber": list(radius_fiber(points, "cv", KV_RADIUS2)),
        "c3_orientation": _fraction_text(c3_orientation),
        "first_turn": _fraction_text(first_turn),
        "second_turn": _fraction_text(second_turn),
        "midpoint_distance2": _fraction_text(midpoint_distance2),
    }


def _z3_rat(value: Fraction) -> z3.RatNumRef:
    return z3.RealVal(f"{value.numerator}/{value.denominator}")


def _z3_dist2(left: Z3Point, right: Z3Point) -> z3.ArithRef:
    # Multiplication is intentionally explicit: exponentiation serializes as
    # ``^`` and is not part of the durable flat QF_NRA spelling used here.
    dx = left[0] - right[0]
    dy = left[1] - right[1]
    return dx * dx + dy * dy


def _z3_orient(first: Z3Point, second: Z3Point, third: Z3Point) -> z3.ArithRef:
    return (
        (second[0] - first[0]) * (third[1] - first[1])
        - (second[1] - first[1]) * (third[0] - first[0])
    )


def _symbols(
    cell: RelationalCell,
) -> tuple[dict[str, Z3Point], tuple[z3.ArithRef, z3.ArithRef, z3.ArithRef]]:
    prefix = f"c3_two_row_relational_{cell.name}"
    points = {
        role: (z3.Real(f"{prefix}__{role}_x"), z3.Real(f"{prefix}__{role}_y"))
        for role in ROLE_ORDER
    }
    radii = (
        z3.Real(f"{prefix}__physical_radius2"),
        z3.Real(f"{prefix}__ku_radius2"),
        z3.Real(f"{prefix}__kv_radius2"),
    )
    return points, radii


def _add_exact_fiber(
    solver: z3.Solver,
    points: Mapping[str, Z3Point],
    center: str,
    radius2: z3.ArithRef,
    expected: tuple[str, ...],
) -> None:
    """Require precisely ``expected`` among the 13 named roles at this radius."""

    for role in ROLE_ORDER:
        equality = _z3_dist2(points[center], points[role]) == radius2
        solver.add(equality if role in expected else z3.Not(equality))


def _add_reference_witness(solver: z3.Solver, cell: RelationalCell) -> None:
    """Bind the formula to its exact positive control for a SAT smoke gate."""

    points, radii = _symbols(cell)
    reference = reference_points(cell)
    for role in ROLE_ORDER:
        point = reference[role]
        solver.add(points[role][0] == _z3_rat(point[0]))
        solver.add(points[role][1] == _z3_rat(point[1]))
    for radius, value in zip(radii, REFERENCE_RADIUS_VALUES, strict=True):
        solver.add(radius == _z3_rat(value))


def build_solver(cell: RelationalCell, timeout_ms: int) -> z3.Solver:
    """Build one bounded QF_NRA two-row relational positive-control cell."""

    if timeout_ms <= 0:
        raise ValueError("timeout_ms must be positive")
    solver = z3.SolverFor("QF_NRA")
    solver.set("timeout", timeout_ms)
    points, (physical_radius2, ku_radius2, kv_radius2) = _symbols(cell)
    solver.add(physical_radius2 > 0, ku_radius2 > 0, kv_radius2 > 0)

    for role in FIXED_ROLE_ORDER:
        point = FIXED_POINTS[role]
        solver.add(points[role][0] == _z3_rat(point[0]))
        solver.add(points[role][1] == _z3_rat(point[1]))
    for left, right in combinations(ROLE_ORDER, 2):
        solver.add(
            z3.Or(points[left][0] != points[right][0], points[left][1] != points[right][1])
        )

    _add_exact_fiber(solver, points, "O", physical_radius2, PHYSICAL)
    _add_exact_fiber(solver, points, "v", ku_radius2, KU)
    _add_exact_fiber(solver, points, "cv", kv_radius2, KV)
    mec_center = (_z3_rat(MEC_CENTER[0]), _z3_rat(MEC_CENTER[1]))
    for role in ROLE_ORDER:
        solver.add(_z3_dist2(mec_center, points[role]) <= _z3_rat(MEC_RADIUS2))

    c3_orientation = _z3_orient(points["O"], points["m1"], points["m2"])
    for role in C3_NEGATIVE:
        solver.add(_z3_orient(points[role], points["m1"], points["m2"]) * c3_orientation < 0)
    for role in C3_POSITIVE:
        solver.add(_z3_orient(points[role], points["m1"], points["m2"]) * c3_orientation > 0)

    solver.add(_z3_dist2(points["v"], points["u"]) == _z3_dist2(points["v"], points["xu"]))
    first_turn = _z3_orient(points["O"], points["u"], points["v"])
    second_turn = _z3_orient(points["O"], points["v"], points["xu"])
    if cell.turn_sign > 0:
        solver.add(first_turn > 0, second_turn > 0)
    else:
        solver.add(first_turn < 0, second_turn < 0)
    return solver


def export_smt2(
    cell: RelationalCell,
    timeout_ms: int = 120000,
    *,
    include_check_sat: bool = True,
) -> str:
    """Return deterministic flat QF_NRA bytes for one relational cell."""

    solver = build_solver(cell, timeout_ms)
    declarations = sorted(
        line.strip()
        for line in solver.to_smt2().splitlines()
        if line.strip().startswith("(declare-fun ")
    )
    assertions = [f"(assert {assertion.sexpr()})" for assertion in solver.assertions()]
    commands = ["(set-logic QF_NRA)", *declarations, *assertions]
    if include_check_sat:
        commands.append("(check-sat)")
    return "\n".join(commands) + "\n"


def direct_solve(cell: RelationalCell, timeout_ms: int) -> dict[str, Any]:
    """Run local Z3; replay the fixed exact positive control on SAT."""

    solver = build_solver(cell, timeout_ms)
    result = solver.check()
    if result == z3.sat:
        return {"status": "SAT", "reference_witness": replay_reference_witness(cell)}
    if result == z3.unsat:
        return {"status": "UNSAT"}
    return {"status": "UNKNOWN", "reason": solver.reason_unknown()}


def run_smoke(timeout_ms: int) -> dict[str, Any]:
    """Check replay, serialization, parser round-trip, and false mutations."""

    cells: list[dict[str, Any]] = []
    for cell in CELLS:
        witness = replay_reference_witness(cell)
        formula = export_smt2(cell, timeout_ms)
        session_formula = export_smt2(cell, timeout_ms, include_check_sat=False)
        _require(formula == f"{session_formula}(check-sat)\n", "SMT2 query prefix changed")
        _require("(^ " not in formula, "SMT2 exporter emitted exponentiation")
        _require(
            all(token not in formula for token in ("pbeq", "pbge", "pble")),
            "SMT2 exporter emitted a pseudo-Boolean operator",
        )
        parsed = z3.parse_smt2_string(formula)
        _require(
            len(parsed) == len(build_solver(cell, timeout_ms).assertions()),
            "SMT2 parser lost assertions",
        )
        # A 1 ms caller smoke budget is enough for serialization but can expire
        # during Z3's fixed preprocessing before it evaluates a fully bound
        # rational model.  Keep this known-instance gate bounded and stable.
        bound_reference = build_solver(cell, max(timeout_ms, 100))
        _add_reference_witness(bound_reference, cell)
        _require(
            bound_reference.check() == z3.sat,
            "exact reference witness does not satisfy the emitted formula",
        )
        contradictory = build_solver(cell, timeout_ms)
        contradictory.add(z3.BoolVal(False))
        _require(contradictory.check() == z3.unsat, "false mutation did not return UNSAT")
        cells.append(
            {
                "cell": cell.name,
                "assertions": len(build_solver(cell, timeout_ms).assertions()),
                "formula_sha256": hashlib.sha256(formula.encode("utf-8")).hexdigest(),
                "reference_witness": witness,
            }
        )
    return {"schema": RESULT_SCHEMA, "status": "SMOKE_OK", "cells": cells}


def _canonical_json(value: Any, *, pretty: bool) -> str:
    if pretty:
        return json.dumps(value, indent=2, sort_keys=True) + "\n"
    return json.dumps(value, separators=(",", ":"), sort_keys=True) + "\n"


def _atomic_write(path: Path, contents: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile("w", encoding="utf-8", dir=path.parent, delete=False) as handle:
        handle.write(contents)
        temporary = Path(handle.name)
    os.replace(temporary, path)


def _selected_cells(name: str) -> tuple[RelationalCell, ...]:
    if name == "all":
        return CELLS
    return (_CELL_BY_NAME[name],)


def _document(
    cell: RelationalCell, timeout_ms: int, direct: bool
) -> tuple[str, str, dict[str, Any]]:
    formula = export_smt2(cell, timeout_ms)
    session_formula = export_smt2(cell, timeout_ms, include_check_sat=False)
    document: dict[str, Any] = {
        "schema": RESULT_SCHEMA,
        "scope": "formula-scoped bounded relational positive-control; NOT a source realization or S0 proof",
        "cell": cell.name,
        "formula_sha256": hashlib.sha256(formula.encode("utf-8")).hexdigest(),
        "formula_bytes": len(formula.encode("utf-8")),
        "session_formula_sha256": hashlib.sha256(session_formula.encode("utf-8")).hexdigest(),
        "session_formula_bytes": len(session_formula.encode("utf-8")),
        "assertions": len(build_solver(cell, timeout_ms).assertions()),
        "reference_witness": replay_reference_witness(cell),
        "omitted_source_facts": [
            "complete-carrier realization",
            "source coverage",
            "unmodeled incidence relations",
            "deletion-multiplicity obligations",
        ],
    }
    if direct:
        document["direct_z3"] = direct_solve(cell, timeout_ms)
    return formula, session_formula, document


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cell", choices=("forward", "reverse", "all"), default="all")
    parser.add_argument("--output-root", type=Path)
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
        if args.output_root is not None or args.direct_solve:
            raise SystemExit("--smoke cannot be combined with output or direct-solve options")
        if args.verbose:
            print(_canonical_json(run_smoke(args.timeout_ms), pretty=True), end="")
        else:
            run_smoke(args.timeout_ms)
        return 0
    if args.output_root is None:
        raise SystemExit("supply --smoke or --output-root")
    if args.output_root.exists() and any(args.output_root.iterdir()):
        raise SystemExit("--output-root must be empty")

    summaries: list[dict[str, Any]] = []
    for cell in _selected_cells(args.cell):
        formula, session_formula, document = _document(cell, args.timeout_ms, args.direct_solve)
        _atomic_write(args.output_root / f"{cell.name}.smt2", formula)
        _atomic_write(args.output_root / f"{cell.name}.session.smt2", session_formula)
        _atomic_write(args.output_root / f"{cell.name}.json", _canonical_json(document, pretty=True))
        summaries.append(
            {
                "cell": cell.name,
                "assertions": document["assertions"],
                "formula_sha256": document["formula_sha256"],
                "status": document.get("direct_z3", {}).get("status", "EMITTED"),
            }
        )
    if args.verbose:
        print(_canonical_json({"schema": RESULT_SCHEMA, "cells": summaries}, pretty=True), end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
