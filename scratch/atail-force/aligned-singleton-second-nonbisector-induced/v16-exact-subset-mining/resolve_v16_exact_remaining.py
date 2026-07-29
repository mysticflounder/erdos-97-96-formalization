#!/usr/bin/env python3
"""Resolve the three v16 five-class formulas still UNKNOWN after long replay."""

from __future__ import annotations

import importlib.util
import json
import sys
from fractions import Fraction
from pathlib import Path
from typing import Any, Sequence

import z3


HERE = Path(__file__).resolve().parent
LANE = HERE.parent
MINER_PATH = LANE / "exact_euclidean_subset_core_miner.py"
SOURCE_RESULT = HERE / "exact-4-5.json"
RESOLUTION_RESULT = HERE / "five-resolution.json"
Point = tuple[Fraction, Fraction]


def load_miner() -> Any:
    spec = importlib.util.spec_from_file_location("v16_exact_remaining", MINER_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {MINER_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def source_config(miner: Any, source: dict[str, Any]) -> Any:
    inputs = source["inputs"]
    actual = source["source_validation"]["actual_hashes"]
    return miner.SourceConfig(
        probe_result=Path(inputs["exact_probe_result"]),
        positive_smt2=Path(inputs["exact_positive_rows_smt2"]),
        cegar_result=Path(inputs["cegar_result"]),
        checkpoint=Path(inputs["checkpoint"]),
        cegar_script=Path(inputs["cegar_script"]),
        expected_probe_sha256=actual["exact_probe_result_sha256"],
        expected_positive_smt2_sha256=actual["exact_positive_rows_smt2_sha256"],
        expected_cegar_result_sha256=actual["cegar_result_sha256"],
        expected_checkpoint_sha256=actual["checkpoint_sha256"],
        expected_recorded_cegar_sha256=inputs["cegar_script_recorded_sha256"],
        expected_class_count=source["source_validation"]["alias_class_count"],
        expected_equation_count=source["source_validation"]["positive_equation_count"],
    )


def q(value: Fraction) -> z3.RatNumRef:
    return z3.Q(value.numerator, value.denominator)


def fraction_smt(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"(/ {value.numerator} {value.denominator})"


def fraction_json(value: Fraction) -> dict[str, int]:
    return {"numerator": value.numerator, "denominator": value.denominator}


def circle(parameter: Fraction) -> Point:
    denominator = 1 + parameter * parameter
    return (
        (1 - parameter * parameter) / denominator,
        2 * parameter / denominator,
    )


def sub(a: Point, b: Point) -> Point:
    return (a[0] - b[0], a[1] - b[1])


def dist2(a: Point, b: Point) -> Fraction:
    delta = sub(a, b)
    return delta[0] * delta[0] + delta[1] * delta[1]


def orient(points: Sequence[Point], a: int, b: int, c: int) -> Fraction:
    ab = sub(points[b], points[a])
    ac = sub(points[c], points[a])
    return ab[0] * ac[1] - ab[1] * ac[0]


def normalize_gauge(points: Sequence[Point]) -> tuple[Point, ...]:
    """Apply the orientation-preserving similarity taking p0 to 0 and p1 to 1."""
    origin = points[0]
    axis = sub(points[1], origin)
    norm2 = axis[0] * axis[0] + axis[1] * axis[1]
    return tuple(
        (
            (sub(point, origin)[0] * axis[0] + sub(point, origin)[1] * axis[1])
            / norm2,
            (
                axis[0] * sub(point, origin)[1]
                - axis[1] * sub(point, origin)[0]
            )
            / norm2,
        )
        for point in points
    )


def exact_rational_check(problem: Any, points: Sequence[Point]) -> dict[str, Any]:
    local = {global_index: index for index, global_index in enumerate(problem.subset)}
    equality_differences: dict[str, dict[str, int]] = {}
    failures: list[str] = []
    for equation in problem.equations:
        left = tuple(local[value] for value in equation.left_edge)
        right = tuple(local[value] for value in equation.right_edge)
        difference = dist2(points[left[0]], points[left[1]]) - dist2(
            points[right[0]], points[right[1]]
        )
        equality_differences[str(equation.source_index)] = fraction_json(difference)
        if difference:
            failures.append(f"source equality {equation.source_index}: {difference}")
    orientations = [
        orient(points, a, (a + 1) % len(points), c)
        for a in range(len(points))
        for c in range(len(points))
        if c not in (a, (a + 1) % len(points))
    ]
    distances = [
        dist2(points[a], points[b])
        for a in range(len(points))
        for b in range(a + 1, len(points))
    ]
    if min(orientations) <= 0:
        failures.append(f"minimum orientation: {min(orientations)}")
    if min(distances) <= 0:
        failures.append(f"minimum squared distance: {min(distances)}")
    return {
        "status": "PASS" if not failures else "FAIL",
        "failures": failures,
        "equality_differences": equality_differences,
        "minimum_orientation": fraction_json(min(orientations)),
        "minimum_squared_distance": fraction_json(min(distances)),
    }


def coordinate_smt2(base: str, points: Sequence[Point]) -> str:
    assertions = []
    for index, (x_value, y_value) in enumerate(points):
        assertions.append(f"(assert (= x_{index} {fraction_smt(x_value)}))")
        assertions.append(f"(assert (= y_{index} {fraction_smt(y_value)}))")
    return (
        base.rsplit("(check-sat)", 1)[0]
        + "\n"
        + "\n".join(assertions)
        + "\n(check-sat)\n"
    )


def radial_smt2(base: str, d: Point, u: Point, v: Point) -> str:
    assertions = [
        "(declare-fun radius () Real)",
        "(assert (> radius 0))",
        f"(assert (= x_3 {fraction_smt(d[0])}))",
        f"(assert (= y_3 {fraction_smt(d[1])}))",
        f"(assert (= x_2 (* radius {fraction_smt(u[0])})))",
        f"(assert (= y_2 (* radius {fraction_smt(u[1])})))",
        f"(assert (= x_4 (* radius {fraction_smt(v[0])})))",
        f"(assert (= y_4 (* radius {fraction_smt(v[1])})))",
    ]
    return (
        base.rsplit("(check-sat)", 1)[0]
        + "\n"
        + "\n".join(assertions)
        + "\n(check-sat)\n"
    )


def radial_z3_check(problem: Any, d: Point, u: Point, v: Point) -> dict[str, Any]:
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=30_000, random_seed=0)
    solver.add(*(record.expression for record in problem.records))
    radius = z3.Real("radius")
    solver.add(
        radius > 0,
        problem.x[3] == q(d[0]),
        problem.y[3] == q(d[1]),
        problem.x[2] == radius * q(u[0]),
        problem.y[2] == radius * q(u[1]),
        problem.x[4] == radius * q(v[0]),
        problem.y[4] == radius * q(v[1]),
    )
    verdict = solver.check()
    result: dict[str, Any] = {
        "status": str(verdict).upper(),
        "timeout_ms": 30_000,
        "fail_closed": True,
    }
    if verdict == z3.sat:
        model = solver.model()
        valid, failures = MINER.model_satisfies(model, problem.records)
        result["model_substitution_status"] = "PASS" if valid else "FAIL"
        result["model_substitution_failures"] = failures[:20]
        result["radius_exact_smt2"] = model.eval(radius).sexpr()
        result["coordinates"] = [
            {
                "local_vertex": index,
                "global_class": problem.subset[index],
                "x_exact_smt2": model.eval(
                    problem.x[index], model_completion=True
                ).sexpr(),
                "y_exact_smt2": model.eval(
                    problem.y[index], model_completion=True
                ).sexpr(),
            }
            for index in range(len(problem.subset))
        ]
    elif verdict == z3.unknown:
        result["reason_unknown"] = solver.reason_unknown()
    return result


MINER: Any


def main() -> int:
    global MINER
    MINER = load_miner()
    source = json.loads(SOURCE_RESULT.read_text())
    resolution = json.loads(RESOLUTION_RESULT.read_text())
    probe, equations, validation = MINER.validate_source(source_config(MINER, source))
    aliases = probe["target"]["alias_classes_in_order"]

    rational_subset = (3, 5, 9, 10, 11)
    rational_points: tuple[Point, ...] = (
        (Fraction(811, 485), Fraction(-964, 485)),
        (Fraction(1), Fraction(0)),
        (Fraction(3, 5), Fraction(4, 5)),
        (Fraction(0), Fraction(0)),
        (Fraction(3, 5), Fraction(-4, 5)),
    )
    radial_subsets = {(5, 7, 13, 14, 16), (5, 12, 13, 14, 16)}
    d, u, v = circle(Fraction(9, 2)), circle(Fraction(3, 10)), circle(Fraction(80))

    cases: list[dict[str, Any]] = []
    for row in resolution["cases"]:
        subset = tuple(row["subset"])
        if (
            row["long_z3"]["status"] == "SAT"
            and row["long_z3"].get("model_substitution_status") == "PASS"
        ):
            cases.append(
                {
                    "case_id": row["case_id"],
                    "subset": list(subset),
                    "aliases": row["aliases"],
                    "source_equation_indices": row["induced_source_equation_indices"],
                    "status": "SAT_EXACT_Z3_MODEL_SUBSTITUTION",
                    "exact_z3": row["long_z3"],
                    "independent_cvc5": row["long_cvc5"],
                }
            )
            continue

        induced = MINER.induced_equations(subset, equations)
        problem = MINER.build_problem(subset, induced)
        names = [record.name for record in problem.records]
        base = MINER.direct_smt2(problem, names)
        if subset == rational_subset:
            exact_check = exact_rational_check(problem, rational_points)
            gauge_points = normalize_gauge(rational_points)
            smt2 = coordinate_smt2(base, gauge_points)
            smt_path = HERE / f"five-q{'-'.join(map(str, subset))}-rational-pinned.smt2"
            smt_path.write_text(smt2)
            z3_replay = MINER.run_solver_file("z3", smt_path, 30_000)
            cvc5_replay = MINER.run_solver_file("cvc5", smt_path, 30_000)
            passed = (
                exact_check["status"] == "PASS"
                and z3_replay["status"] == "SAT"
                and cvc5_replay["status"] == "SAT"
            )
            cases.append(
                {
                    "case_id": row["case_id"],
                    "subset": list(subset),
                    "aliases": [aliases[index] for index in subset],
                    "source_equation_indices": [item.source_index for item in induced],
                    "status": (
                        "SAT_EXACT_RATIONAL_WITNESS"
                        if passed
                        else "UNKNOWN_FAIL_CLOSED"
                    ),
                    "exact_fraction_replay": exact_check,
                    "gauge_normalized_rational_coordinates": [
                        {
                            "local_vertex": index,
                            "x": fraction_json(point[0]),
                            "y": fraction_json(point[1]),
                        }
                        for index, point in enumerate(gauge_points)
                    ],
                    "z3_pinned_replay": z3_replay,
                    "cvc5_pinned_replay": cvc5_replay,
                    "pinned_smt2": str(smt_path),
                    "pinned_smt2_sha256": MINER.sha256(smt_path),
                }
            )
            continue

        if subset not in radial_subsets:
            raise RuntimeError(f"unexpected unresolved subset {subset}")
        smt2 = radial_smt2(base, d, u, v)
        smt_path = HERE / f"five-q{'-'.join(map(str, subset))}-radial-pinned.smt2"
        smt_path.write_text(smt2)
        z3_exact = radial_z3_check(problem, d, u, v)
        z3_replay = MINER.run_solver_file("z3", smt_path, 30_000)
        cvc5_replay = MINER.run_solver_file("cvc5", smt_path, 30_000)
        passed = (
            z3_exact["status"] == "SAT"
            and z3_exact.get("model_substitution_status") == "PASS"
            and z3_replay["status"] == "SAT"
            and cvc5_replay["status"] == "SAT"
        )
        cases.append(
            {
                "case_id": row["case_id"],
                "subset": list(subset),
                "aliases": [aliases[index] for index in subset],
                "source_equation_indices": [item.source_index for item in induced],
                "status": (
                    "SAT_EXACT_ALGEBRAIC_MODEL_SUBSTITUTION"
                    if passed
                    else "UNKNOWN_FAIL_CLOSED"
                ),
                "construction": {
                    "gauge": "p0=(0,0), p1=(1,0)",
                    "p3_unit_circle_parameter": fraction_json(Fraction(9, 2)),
                    "p2_direction_parameter": fraction_json(Fraction(3, 10)),
                    "p4_direction_parameter": fraction_json(Fraction(80)),
                    "common_radius": z3_exact.get("radius_exact_smt2"),
                },
                "z3_exact_model": z3_exact,
                "z3_pinned_replay": z3_replay,
                "cvc5_pinned_replay": cvc5_replay,
                "pinned_smt2": str(smt_path),
                "pinned_smt2_sha256": MINER.sha256(smt_path),
            }
        )

    status_counts = {
        status: sum(case["status"] == status for case in cases)
        for status in sorted({case["status"] for case in cases})
    }
    all_sat = all(case["status"].startswith("SAT_") for case in cases)
    payload = {
        "schema": "p97-v16-five-point-exact-resolution-v1",
        "source_result": str(SOURCE_RESULT),
        "source_result_sha256": MINER.sha256(SOURCE_RESULT),
        "long_resolution_result": str(RESOLUTION_RESULT),
        "long_resolution_result_sha256": MINER.sha256(RESOLUTION_RESULT),
        "source_validation": validation,
        "cases": cases,
        "resolved_case_status_counts": status_counts,
        "combined_exhaustive_census": {
            "four": {"SAT": 3876, "UNSAT": 0, "UNKNOWN": 0, "total": 3876},
            "five": {
                "SAT": 11628 if all_sat else 11618 + sum(
                    case["status"].startswith("SAT_") for case in cases
                ),
                "UNSAT": 0,
                "UNKNOWN": 0 if all_sat else sum(
                    case["status"] == "UNKNOWN_FAIL_CLOSED" for case in cases
                ),
                "total": 11628,
            },
        },
        "terminal_status": (
            "EXHAUSTIVE_FOUR_FIVE_ALL_SAT"
            if all_sat
            else "UNKNOWN_FAIL_CLOSED"
        ),
        "trust_scope": (
            "Exact rational or Z3 algebraic model substitution and pinned "
            "Z3/cvc5 replay for the induced positive-equality abstraction; "
            "not the full survivor and not Lean/kernel closure."
        ),
    }
    output = HERE / "five-exact-resolution.json"
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(output),
                "terminal_status": payload["terminal_status"],
                "resolved_case_status_counts": status_counts,
                "combined_exhaustive_census": payload["combined_exhaustive_census"],
            },
            sort_keys=True,
        )
    )
    return 0 if all_sat else 2


if __name__ == "__main__":
    raise SystemExit(main())
