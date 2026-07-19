#!/usr/bin/env python3
"""Exact QF_NRA probes for the surviving period-three all-reverse leaves.

This is a decision-design harness, not a proof.  It consumes the exhaustive
Kalmanson quotient and emits one polynomial coordinate system for a fixed
cyclic order.  Every solver call is bounded and every non-verdict is recorded
as UNKNOWN.
"""

from __future__ import annotations

import argparse
from collections import Counter
from dataclasses import dataclass
from fractions import Fraction
import json
from pathlib import Path
import re
import subprocess
from typing import Iterable

import z3


HERE = Path(__file__).resolve().parent
KALMANSON_RESULTS = HERE.parent / "cycle-three-rows-kalmanson" / "results.json"
ROW_ROLES = (("x0", "y0"), ("x1", "y1"), ("x2", "y2"))
ROW_SOURCES = (("q0", "q1"), ("q1", "q2"), ("q2", "q0"))
PHYSICAL_SUPPORT = {"left", "q0", "q1", "q2", "right"}
REPRESENTATIVES = ("k5_0384", "k6_1584")


Point = tuple[z3.ArithRef, z3.ArithRef]


def safe_name(name: str) -> str:
    return re.sub(r"[^A-Za-z0-9_]", "_", name)


def sq(value: z3.ArithRef) -> z3.ArithRef:
    return value * value


def sqdist(first: Point, second: Point) -> z3.ArithRef:
    return sq(first[0] - second[0]) + sq(first[1] - second[1])


def cross(first: Point, second: Point, third: Point) -> z3.ArithRef:
    return ((second[0] - first[0]) * (third[1] - first[1])
            - (second[1] - first[1]) * (third[0] - first[0]))


@dataclass(frozen=True)
class LiveCase:
    key: str
    order: tuple[str, ...]
    left_blocks: tuple[tuple[str, ...], ...]
    right_blocks: tuple[tuple[str, ...], ...]

    @property
    def blocks(self) -> tuple[tuple[str, ...], ...]:
        return self.left_blocks + self.right_blocks

    @property
    def target_for_role(self) -> dict[str, str]:
        return {
            role: "t_" + "_".join(block)
            for block in self.blocks
            for role in block
        }

    @property
    def target_count(self) -> int:
        return len(self.blocks)


def load_live_cases() -> dict[str, LiveCase]:
    payload = json.loads(KALMANSON_RESULTS.read_text())
    records = [
        record
        for record in payload["cases"]
        if record["ordinal"]["status"] == "SAT_NOT_REFUTED_ORDINAL"
    ]
    assert Counter(
        record["ordinal"]["actual_outside_target_count"] for record in records
    ) == {5: 360, 6: 630}
    result = {
        record["case"]: LiveCase(
            key=record["case"],
            order=tuple(record["cyclic_order"]),
            left_blocks=tuple(tuple(block) for block in record["left_blocks"]),
            right_blocks=tuple(tuple(block) for block in record["right_blocks"]),
        )
        for record in records
    }
    for case in result.values():
        if case.target_count == 5:
            shared = [block for block in case.blocks if len(block) == 2]
            assert len(shared) == 1
            assert {role[1] for role in shared[0]} == {"0", "1"}
    return result


@dataclass
class ExactSystem:
    case: LiveCase
    solver: z3.Solver
    variables: dict[str, z3.ArithRef]
    points: dict[str, Point]
    blocks: dict[str, list[z3.BoolRef]]

    @property
    def constraints(self) -> list[z3.BoolRef]:
        return [constraint for values in self.blocks.values() for constraint in values]

    @property
    def equality_count(self) -> int:
        return sum(
            len(self.blocks[name])
            for name in (
                "tangent_parameterization_equalities",
                "blocker_parameterization_equalities",
                "row_target_equalities",
                "mec_parameterization_equalities",
            )
        )

    @property
    def generic_equality_dimension(self) -> int:
        # Every equality in the four listed blocks defines a fresh coordinate
        # or cuts one target coordinate.  Hence these equations are
        # generically independent on their declared nondegenerate domain.
        return len(self.variables) - self.equality_count

    def smt2(self) -> str:
        # z3 4.16 emits ``(check-sat)`` here despite older API references
        # saying otherwise.  Normalize explicitly so cvc5 sees exactly one
        # query and, critically, sees the QF_NRA logic before any command.
        lines = [
            line
            for line in self.solver.to_smt2().splitlines()
            if line.strip() != "(check-sat)"
        ]
        return "(set-logic QF_NRA)\n" + "\n".join(lines) + "\n(check-sat)\n"

    def counts(self) -> dict[str, object]:
        return {
            "case": self.case.key,
            "point_count": len(self.points),
            "actual_outside_target_count": self.case.target_count,
            "variable_count": len(self.variables),
            "generically_independent_equality_count": self.equality_count,
            "generic_equality_dimension": self.generic_equality_dimension,
            "constraint_count": len(self.constraints),
            "constraint_blocks": {name: len(values) for name, values in self.blocks.items()},
        }


class Builder:
    def __init__(self, case: LiveCase) -> None:
        self.case = case
        self.variables: dict[str, z3.ArithRef] = {}
        self.points: dict[str, Point] = {
            "o": (z3.RealVal(0), z3.RealVal(0)),
            "left": (z3.RealVal(1), z3.RealVal(0)),
        }
        self.blocks: dict[str, list[z3.BoolRef]] = {}

    def var(self, name: str) -> z3.ArithRef:
        assert name not in self.variables
        value = z3.Real(name)
        self.variables[name] = value
        return value

    def point(self, name: str) -> Point:
        key = safe_name(name)
        value = (self.var(f"{key}__x"), self.var(f"{key}__y"))
        self.points[name] = value
        return value

    def add(self, block: str, *constraints: z3.BoolRef) -> None:
        self.blocks.setdefault(block, []).extend(constraints)

    def tangent_point(self, name: str, tangent: z3.ArithRef) -> Point:
        point = self.point(name)
        denominator = 1 + sq(tangent)
        self.add(
            "tangent_parameterization_equalities",
            denominator * point[0] == 1 - sq(tangent),
            denominator * point[1] == 2 * tangent,
        )
        return point

    def build(self) -> ExactSystem:
        tangents = {name: self.var(f"t__{name}") for name in ("q0", "q1", "q2", "right")}
        for name, tangent in tangents.items():
            self.tangent_point(name, tangent)
        self.add(
            "source_order_and_nonobtuse",
            tangents["q0"] > 0,
            tangents["q1"] > tangents["q0"],
            tangents["q2"] > tangents["q1"],
            tangents["right"] > tangents["q2"],
            tangents["right"] <= 1,
            self.points["right"][1] > 0,
        )

        for row, (first, second) in enumerate(ROW_SOURCES):
            multiplier = self.var(f"lambda__{row}")
            center = self.point(f"c{row}")
            self.add(
                "blocker_parameterization_equalities",
                center[0] == multiplier * (self.points[first][0] + self.points[second][0]),
                center[1] == multiplier * (self.points[first][1] + self.points[second][1]),
            )

        target_names = tuple("t_" + "_".join(block) for block in self.case.blocks)
        for name in target_names:
            self.point(name)

        target_for_role = self.case.target_for_role
        for row, (first, _second) in enumerate(ROW_SOURCES):
            center = self.points[f"c{row}"]
            radius_sq = sqdist(center, self.points[first])
            for role in ROW_ROLES[row]:
                self.add(
                    "row_target_equalities",
                    sqdist(center, self.points[target_for_role[role]]) == radius_sq,
                )

        mec_center = (self.var("mec__x"), self.var("mec__y"))
        mec_radius_sq = self.var("mec__radius_sq")
        right = self.points["right"]
        self.add(
            "mec_parameterization_equalities",
            2 * mec_center[0] == 1,
            2 * right[1] * mec_center[1] == 1 - right[0],
            mec_radius_sq == sq(mec_center[0]) + sq(mec_center[1]),
        )

        # A fixed cyclic order means every other vertex lies strictly to the
        # left of every directed boundary edge.  This is stronger and safer
        # than checking only consecutive triples.
        order = self.case.order
        assert set(order) == set(self.points)
        for index, first_name in enumerate(order):
            second_name = order[(index + 1) % len(order)]
            for name in order:
                if name in (first_name, second_name):
                    continue
                self.add(
                    "fixed_strict_convex_order",
                    cross(self.points[first_name], self.points[second_name], self.points[name]) > 0,
                )

        left, chord_right = self.points["left"], self.points["right"]
        for name in ("o", *target_names):
            self.add("opposite_cap_side", cross(left, chord_right, self.points[name]) > 0)
        for name in ("q0", "c0", "c2", "q1", "c1", "q2"):
            self.add("physical_cap_side", cross(left, chord_right, self.points[name]) < 0)

        for name, point in self.points.items():
            if name in ("o", "left", "right"):
                continue
            self.add("mec_containment", sqdist(mec_center, point) <= mec_radius_sq)

        names = tuple(self.points)
        for first_index, first_name in enumerate(names):
            for second_name in names[:first_index]:
                self.add(
                    "pairwise_distinct",
                    sqdist(self.points[first_name], self.points[second_name]) > 0,
                )

        for name, point in self.points.items():
            if name == "o" or name in PHYSICAL_SUPPORT:
                continue
            radial_gap = sqdist(self.points["o"], point) - 1
            self.add("physical_exact_class_named_exclusions", sq(radial_gap) > 0)

        for row, (first, second) in enumerate(ROW_SOURCES):
            center_name = f"c{row}"
            center = self.points[center_name]
            support = {
                first,
                second,
                target_for_role[ROW_ROLES[row][0]],
                target_for_role[ROW_ROLES[row][1]],
            }
            radius_sq = sqdist(center, self.points[first])
            for name, point in self.points.items():
                if name == center_name or name in support:
                    continue
                radial_gap = sqdist(center, point) - radius_sq
                self.add("row_exact_class_named_exclusions", sq(radial_gap) > 0)

        solver = z3.SolverFor("QF_NRA")
        solver.add(*[constraint for values in self.blocks.values() for constraint in values])
        return ExactSystem(self.case, solver, self.variables, self.points, self.blocks)


def rational_value(value: z3.ArithRef) -> Fraction | None:
    simplified = z3.simplify(value)
    if not z3.is_rational_value(simplified):
        return None
    return Fraction(simplified.numerator_as_long(), simplified.denominator_as_long())


def probe_z3(system: ExactSystem, timeout_ms: int) -> dict[str, object]:
    solver = system.solver
    solver.set("timeout", timeout_ms)
    status = solver.check()
    if status == z3.unknown:
        return {"status": "UNKNOWN", "reason": solver.reason_unknown()}
    if status == z3.unsat:
        return {"status": "UNSAT_UNCERTIFIED_EXTERNAL_SOLVER"}

    model = solver.model()
    substitutions = []
    rational_model: dict[str, str] = {}
    all_rational = True
    for name, variable in system.variables.items():
        value = model.eval(variable, model_completion=True)
        rational = rational_value(value)
        if rational is None:
            all_rational = False
            continue
        rational_model[name] = str(rational)
        substitutions.append((variable, z3.RealVal(f"{rational.numerator}/{rational.denominator}")))
    exact_replay = False
    if all_rational:
        exact_replay = all(
            z3.is_true(z3.simplify(z3.substitute(constraint, *substitutions)))
            for constraint in system.constraints
        )
    return {
        "status": (
            "SAT_EXACT_RATIONAL_Z3_SUBSTITUTION_REPLAY"
            if exact_replay
            else "SAT_CANDIDATE_NO_INDEPENDENT_EXACT_REPLAY"
        ),
        "all_model_values_rational": all_rational,
        "same_engine_exact_substitution_replay": exact_replay,
        "rational_model": rational_model if exact_replay else {},
    }


def parse_solver_status(output: str) -> str:
    for line in output.splitlines():
        value = line.strip()
        if value in ("sat", "unsat", "unknown"):
            return value
    return "no-verdict"


def probe_cvc5(smt2: str, timeout_ms: int) -> dict[str, object]:
    try:
        process = subprocess.run(
            [
                "cvc5",
                "--lang", "smt2",
                "--nl-cov",
                "--tlimit", str(timeout_ms),
            ],
            input=smt2,
            capture_output=True,
            text=True,
            timeout=timeout_ms / 1000 + 20,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return {"status": "UNKNOWN_SUBPROCESS_TIMEOUT"}
    status = parse_solver_status(process.stdout)
    label = {
        "sat": "SAT_CANDIDATE_NO_EXPORTED_MODEL",
        "unsat": "UNSAT_UNCERTIFIED_EXTERNAL_SOLVER",
        "unknown": "UNKNOWN",
        "no-verdict": "UNKNOWN_NO_VERDICT",
    }[status]
    return {
        "status": label,
        "returncode": process.returncode,
        "stdout_tail": process.stdout[-1000:],
        "stderr_tail": process.stderr[-1000:],
    }


def smoke_tests(timeout_ms: int) -> dict[str, object]:
    # Tangent-half-angle parameterization: t = 1/2 gives (3/5, 4/5).
    t, x, y = z3.Reals("smoke_t smoke_x smoke_y")
    denominator = 1 + t * t
    sat_solver = z3.SolverFor("QF_NRA")
    sat_solver.set("timeout", timeout_ms)
    sat_solver.add(
        t == z3.RealVal("1/2"),
        denominator * x == 1 - t * t,
        denominator * y == 2 * t,
        x == z3.RealVal("3/5"),
        y == z3.RealVal("4/5"),
        x * x + y * y == 1,
    )
    assert sat_solver.check() == z3.sat

    unsat_solver = z3.SolverFor("QF_NRA")
    unsat_solver.set("timeout", timeout_ms)
    unsat_solver.add(*sat_solver.assertions(), x == 0)
    assert unsat_solver.check() == z3.unsat

    square = {
        "a": (z3.RealVal(0), z3.RealVal(0)),
        "b": (z3.RealVal(1), z3.RealVal(0)),
        "c": (z3.RealVal(1), z3.RealVal(1)),
        "d": (z3.RealVal(0), z3.RealVal(1)),
    }
    order = ("a", "b", "c", "d")
    assert all(
        z3.is_true(z3.simplify(cross(square[first], square[order[(index + 1) % 4]], square[name]) > 0))
        for index, first in enumerate(order)
        for name in order
        if name not in (first, order[(index + 1) % 4])
    )

    cvc5_sat = """(set-logic QF_NRA)
(declare-fun x () Real)
(assert (= (* x x) 1))
(assert (> x 0))
(check-sat)
"""
    cvc5_unsat = """(set-logic QF_NRA)
(declare-fun x () Real)
(assert (> x 0))
(assert (<= x 0))
(check-sat)
"""
    sat_result = probe_cvc5(cvc5_sat, timeout_ms)
    unsat_result = probe_cvc5(cvc5_unsat, timeout_ms)
    assert sat_result["status"] == "SAT_CANDIDATE_NO_EXPORTED_MODEL", sat_result
    assert unsat_result["status"] == "UNSAT_UNCERTIFIED_EXTERNAL_SOLVER", unsat_result
    return {
        "z3_tangent_sat": "PASS",
        "z3_tangent_inconsistent_unsat": "PASS",
        "exact_square_orientation": "PASS",
        "cvc5_qf_nra_sat": "PASS",
        "cvc5_qf_nra_unsat": "PASS",
    }


def run(case_keys: Iterable[str], timeout_ms: int, output: Path) -> dict[str, object]:
    cases = load_live_cases()
    smoke = smoke_tests(timeout_ms)
    records = []
    for case_key in case_keys:
        system = Builder(cases[case_key]).build()
        smt2 = system.smt2()
        smt_path = HERE / f"{case_key}.smt2"
        smt_path.write_text(smt2)
        records.append({
            **system.counts(),
            "cyclic_order": list(system.case.order),
            "smt2": smt_path.name,
            "z3": probe_z3(system, timeout_ms),
            "cvc5": probe_cvc5(smt2, timeout_ms),
        })
    payload = {
        "schema": "period3-all-reverse-fixed-order-qf-nra-v1",
        "epistemic_status": "BOUNDED_EXTERNAL_EXACT_ARITHMETIC_PROBES_NOT_PROOF",
        "reduction_boundary": {
            "status": "CONDITIONAL_ON_SOURCE_OPEN_SHARED_BOUNDARY_ORDER_PACKET",
            "available": (
                "per-row ReverseRowCyclicRoles from K + hperiod + hreverse"
            ),
            "missing": (
                "one anchored chiral common-boundary order simultaneously transporting "
                "the three row-role packets"
            ),
            "consequence": (
                "the 990 fixed orders exhaust the finite abstraction only after that "
                "shared-order packet is produced"
            ),
        },
        "timeout_ms_per_engine_per_case": timeout_ms,
        "finite_normal_form": {
            "five_target_fixed_orders": 360,
            "six_target_fixed_orders": 630,
            "total_fixed_orders": 990,
            "five_target_shared_rows": [0, 1],
        },
        "smoke_tests": smoke,
        "records": records,
    }
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    return payload


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--case", action="append", choices=tuple(load_live_cases()))
    parser.add_argument("--timeout-ms", type=int, default=3000)
    parser.add_argument("--output", type=Path, default=HERE / "PROBES.json")
    args = parser.parse_args()
    payload = run(args.case or REPRESENTATIVES, args.timeout_ms, args.output)
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
