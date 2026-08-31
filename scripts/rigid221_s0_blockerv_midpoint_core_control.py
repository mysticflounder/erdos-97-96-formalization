"""Small positive controls for the first Rigid221 blocker-``v`` midpoint edge.

The live source packet proves that the literal blocker lies strictly between
the two source-row physical points in the strict second cap.  This module
keeps only that first edge, the physical five-circle, the fixed Moser cap, and
the MEC disk.  Exact rational witnesses show that this smaller package is
consistent in both cap-order directions.

It is deliberately not a source realization: opposite-row/next-blocker
incidence, full row data, deletion multiplicity, and a complete carrier are
outside its boundary.  Its purpose is to prevent a false closure from only the
first midpoint relation and to pin the next missing source producer.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from collections.abc import Sequence
from dataclasses import dataclass
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any

import z3

Point = tuple[Fraction, Fraction]
Z3Point = tuple[z3.ArithRef, z3.ArithRef]

ROLE_ORDER = ("O", "m1", "m2", "u", "xu", "delta", "v", "xv")
# This is deliberately an ordered tuple: emitted assertions and their hash must
# not depend on Python's per-process hash seed.
PHYSICAL = ("u", "xu", "delta", "v", "xv")
EXPECTED_C3 = frozenset({"m1", "m2", "u", "xu", "v"})
MEC_CENTER: Point = (Fraction(1), Fraction(0))
MEC_RADIUS2 = Fraction(1)
FIXED_POINTS: dict[str, Point] = {
    "O": (Fraction(0), Fraction(0)),
    "m1": (Fraction(8, 5), Fraction(-4, 5)),
    "m2": (Fraction(8, 5), Fraction(4, 5)),
}
RESULT_SCHEMA = "rigid221-s0-blockerv-midpoint-core-control/v1"


class VerificationError(ValueError):
    """An exact reference witness or emission invariant failed."""


@dataclass(frozen=True)
class MidpointCell:
    """One orientation of the source-entitled midpoint relation."""

    name: str
    turn_sign: int


FORWARD = MidpointCell("forward", 1)
REVERSE = MidpointCell("reverse", -1)
CELLS = (FORWARD, REVERSE)
_CELL_BY_NAME = {cell.name: cell for cell in CELLS}


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise VerificationError(message)


def _fraction_text(value: Fraction) -> str:
    return f"{value.numerator}/{value.denominator}"


def dist2(left: Point, right: Point) -> Fraction:
    return (left[0] - right[0]) ** 2 + (left[1] - right[1]) ** 2


def orient(first: Point, second: Point, third: Point) -> Fraction:
    return (
        (second[0] - first[0]) * (third[1] - first[1])
        - (second[1] - first[1]) * (third[0] - first[0])
    )


def on_arc_opposite(apex: Point, endpoint1: Point, endpoint2: Point, point: Point) -> bool:
    return orient(point, endpoint1, endpoint2) * orient(apex, endpoint1, endpoint2) <= 0


def reference_points(cell: MidpointCell) -> dict[str, Point]:
    """Return the exact positive-control realization for one cap direction."""

    points: dict[str, Point] = {
        **FIXED_POINTS,
        "v": (Fraction(17, 10), Fraction(0)),
        "delta": (Fraction(3, 2), Fraction(-4, 5)),
        "xv": (Fraction(3, 2), Fraction(4, 5)),
    }
    lower = (Fraction(1071, 650), Fraction(-136, 325))
    upper = (Fraction(1071, 650), Fraction(136, 325))
    if cell.turn_sign > 0:
        points["u"], points["xu"] = lower, upper
    else:
        points["u"], points["xu"] = upper, lower
    return points


def replay_reference_witness(cell: MidpointCell) -> dict[str, Any]:
    """Replay the reduced contract with exact ``Fraction`` arithmetic."""

    points = reference_points(cell)
    _require(set(points) == set(ROLE_ORDER), "reference roles differ from the core")
    _require(len(set(points.values())) == len(ROLE_ORDER), "reference roles are not distinct")
    for role, expected in FIXED_POINTS.items():
        _require(points[role] == expected, f"wrong fixed coordinate for {role}")

    radius_values = {dist2(points["O"], points[role]) for role in PHYSICAL}
    _require(len(radius_values) == 1, "physical roles do not share one O-radius")
    radius2 = next(iter(radius_values))
    _require(radius2 > 0, "physical O-radius is not positive")
    for role in ROLE_ORDER:
        _require(
            dist2(MEC_CENTER, points[role]) <= MEC_RADIUS2,
            f"{role} lies outside the fixed MEC disk",
        )
    c3_members = frozenset(
        role
        for role in ROLE_ORDER
        if on_arc_opposite(points["O"], points["m1"], points["m2"], points[role])
    )
    _require(c3_members == EXPECTED_C3, "C3 membership differs from the reduced contract")
    _require(
        dist2(points["v"], points["u"]) == dist2(points["v"], points["xu"]),
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
        "physical_radius2": _fraction_text(radius2),
        "c3_members": sorted(c3_members),
        "first_turn": _fraction_text(first_turn),
        "second_turn": _fraction_text(second_turn),
        "midpoint_distance2": _fraction_text(dist2(points["v"], points["u"])),
    }


def _z3_rat(value: Fraction) -> z3.RatNumRef:
    return z3.RealVal(f"{value.numerator}/{value.denominator}")


def _z3_dist2(left: Z3Point, right: Z3Point) -> z3.ArithRef:
    # ``(** 2)`` serializes as ``^`` with a real exponent in this Z3 build;
    # PiQD's SMT worker correctly rejects that non-portable spelling.  Keep
    # QF_NRA multiplication explicit in the durable SMT-LIB bytes.
    dx = left[0] - right[0]
    dy = left[1] - right[1]
    return dx * dx + dy * dy


def _z3_orient(first: Z3Point, second: Z3Point, third: Z3Point) -> z3.ArithRef:
    return (
        (second[0] - first[0]) * (third[1] - first[1])
        - (second[1] - first[1]) * (third[0] - first[0])
    )


def _symbols(cell: MidpointCell) -> tuple[dict[str, Z3Point], z3.ArithRef]:
    prefix = f"blockerv_midpoint_core_{cell.name}"
    points = {
        role: (z3.Real(f"{prefix}__{role}_x"), z3.Real(f"{prefix}__{role}_y"))
        for role in ROLE_ORDER
    }
    return points, z3.Real(f"{prefix}__rho2")


def build_solver(cell: MidpointCell, timeout_ms: int) -> z3.Solver:
    """Build the small QF_NRA midpoint package for one orientation direction."""

    if timeout_ms <= 0:
        raise ValueError("timeout_ms must be positive")
    solver = z3.SolverFor("QF_NRA")
    solver.set("timeout", timeout_ms)
    points, rho2 = _symbols(cell)
    solver.add(rho2 > 0)
    for role, point in FIXED_POINTS.items():
        solver.add(points[role][0] == _z3_rat(point[0]))
        solver.add(points[role][1] == _z3_rat(point[1]))
    for left, right in combinations(ROLE_ORDER, 2):
        solver.add(z3.Or(points[left][0] != points[right][0], points[left][1] != points[right][1]))
    for role in PHYSICAL:
        solver.add(_z3_dist2(points["O"], points[role]) == rho2)
    for role in ROLE_ORDER:
        solver.add(
            _z3_dist2((_z3_rat(MEC_CENTER[0]), _z3_rat(MEC_CENTER[1])), points[role])
            <= _z3_rat(MEC_RADIUS2)
        )

    c3_orientation = _z3_orient(points["O"], points["m1"], points["m2"])
    for role in ("u", "v", "xu"):
        solver.add(_z3_orient(points[role], points["m1"], points["m2"]) * c3_orientation <= 0)
    for role in ("delta", "xv"):
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
    cell: MidpointCell,
    timeout_ms: int = 120000,
    *,
    include_check_sat: bool = True,
) -> str:
    """Return deterministic flat QF_NRA bytes for one reduced midpoint core."""

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


def direct_solve(cell: MidpointCell, timeout_ms: int) -> dict[str, Any]:
    """Run a local SAT check; the exact witness is replayed independently."""

    result = build_solver(cell, timeout_ms).check()
    if result == z3.sat:
        return {"status": "SAT", "reference_witness": replay_reference_witness(cell)}
    if result == z3.unsat:
        return {"status": "UNSAT"}
    return {"status": "UNKNOWN"}


def run_smoke(timeout_ms: int) -> dict[str, Any]:
    """Check exact witnesses, serialization, and a known contradictory mutation."""

    cells: list[dict[str, Any]] = []
    for cell in CELLS:
        witness = replay_reference_witness(cell)
        formula = export_smt2(cell, timeout_ms)
        session_formula = export_smt2(cell, timeout_ms, include_check_sat=False)
        _require(formula == f"{session_formula}(check-sat)\n", "SMT2 query prefix changed")
        _require(
            all(token not in formula for token in ("pbeq", "pbge", "pble")),
            "SMT2 exporter emitted a pseudo-Boolean operator",
        )
        parsed = z3.parse_smt2_string(formula)
        _require(len(parsed) == len(build_solver(cell, timeout_ms).assertions()), "SMT2 parser lost assertions")
        contradictory = build_solver(cell, timeout_ms)
        contradictory.add(z3.BoolVal(False))
        _require(contradictory.check() == z3.unsat, "contradictory mutation did not return UNSAT")
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


def _selected_cells(name: str) -> tuple[MidpointCell, ...]:
    if name == "all":
        return CELLS
    return (_CELL_BY_NAME[name],)


def _document(cell: MidpointCell, timeout_ms: int, direct: bool) -> tuple[str, str, dict[str, Any]]:
    formula = export_smt2(cell, timeout_ms)
    session_formula = export_smt2(cell, timeout_ms, include_check_sat=False)
    document: dict[str, Any] = {
        "schema": RESULT_SCHEMA,
        "scope": "reduced-source-faithful-midpoint-positive-control",
        "cell": cell.name,
        "formula_sha256": hashlib.sha256(formula.encode("utf-8")).hexdigest(),
        "formula_bytes": len(formula.encode("utf-8")),
        "session_formula_sha256": hashlib.sha256(session_formula.encode("utf-8")).hexdigest(),
        "session_formula_bytes": len(session_formula.encode("utf-8")),
        "assertions": len(build_solver(cell, timeout_ms).assertions()),
        "reference_witness": replay_reference_witness(cell),
        "excluded_source_edges": ["opposite-row", "next-blocker", "deletion-multiplicity"],
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
