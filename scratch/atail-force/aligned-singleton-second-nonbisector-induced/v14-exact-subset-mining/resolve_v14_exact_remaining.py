#!/usr/bin/env python3
"""Resolve the v14 five-class and top-six timeout formulas exactly.

SAT verdicts require Fraction-arithmetic replay plus coordinate-pinned Z3 and
cvc5 replay.  The repeated rank-4/5 six-class schema is reduced to a
three-orientation QF_NRA contradiction; Singular checks the exact
source-parameterization polynomial identities.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
import subprocess
import sys
from fractions import Fraction
from pathlib import Path
from typing import Any, Sequence


HERE = Path(__file__).resolve().parent
LANE = HERE.parent
MINER_PATH = LANE / "exact_euclidean_subset_core_miner.py"
SOURCE_RESULT = HERE / "exact-4-5.json"
SIX_RESULT = HERE / "v14-six-priority-search-top24.json"

Point = tuple[Fraction, Fraction]


def load_miner() -> Any:
    spec = importlib.util.spec_from_file_location("v14_exact_resolution_miner", MINER_PATH)
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


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def circle(t: Fraction) -> Point:
    denominator = 1 + t * t
    return ((1 - t * t) / denominator, 2 * t / denominator)


def add(a: Point, b: Point) -> Point:
    return (a[0] + b[0], a[1] + b[1])


def sub(a: Point, b: Point) -> Point:
    return (a[0] - b[0], a[1] - b[1])


def scale(s: Fraction, a: Point) -> Point:
    return (s * a[0], s * a[1])


def rotate(a: Point, t: Fraction) -> Point:
    cosine, sine = circle(t)
    return (
        cosine * a[0] - sine * a[1],
        sine * a[0] + cosine * a[1],
    )


def norm2(a: Point) -> Fraction:
    return a[0] * a[0] + a[1] * a[1]


def dist2(a: Point, b: Point) -> Fraction:
    return norm2(sub(a, b))


def orient(points: Sequence[Point], a: int, b: int, c: int) -> Fraction:
    ab = sub(points[b], points[a])
    ac = sub(points[c], points[a])
    return ab[0] * ac[1] - ab[1] * ac[0]


def strict_values(points: Sequence[Point]) -> tuple[list[Fraction], list[Fraction]]:
    n = len(points)
    orientations = [
        orient(points, a, (a + 1) % n, c)
        for a in range(n)
        for c in range(n)
        if c not in (a, (a + 1) % n)
    ]
    distances = [
        dist2(points[a], points[b])
        for a in range(n)
        for b in range(a + 1, n)
    ]
    return orientations, distances


def five_schema() -> tuple[tuple[Fraction, ...], tuple[Point, ...]]:
    """d01=d13=d14 and d02=d04, in strict five-point order."""
    t, u, v = Fraction(9, 19), Fraction(16, 19), Fraction(-5, 18)
    p0, p1 = (Fraction(0), Fraction(0)), (Fraction(1), Fraction(0))
    p3 = add(p1, circle(t))
    p4 = add(p1, circle(u))
    p2 = rotate(p4, v)
    return (t, u, v), (p0, p1, p2, p3, p4)


def rank2_schema() -> tuple[tuple[Fraction, ...], tuple[Point, ...]]:
    """The rank-2 six schema via two rational circle constructions."""
    t, u, v = Fraction(3, 2), Fraction(21, 8), Fraction(-3, 2)
    p0, p1 = (Fraction(0), Fraction(0)), (Fraction(1), Fraction(0))
    p3, p4 = circle(t), circle(u)
    perpendicular = (-p3[1], p3[0])
    direction = sub(p4, p1)
    denominator = perpendicular[0] * direction[0] + perpendicular[1] * direction[1]
    lam = -(
        (p3[0] / 2) * direction[0] + (p3[1] / 2) * direction[1]
    ) / denominator
    p2 = add(scale(Fraction(1, 2), p3), scale(lam, perpendicular))
    p5 = add(p2, rotate(sub(p1, p2), v))
    return (t, u, v, lam), (p0, p1, p2, p3, p4, p5)


def fraction_json(value: Fraction) -> dict[str, int]:
    return {"numerator": value.numerator, "denominator": value.denominator}


def fraction_smt(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"(/ {value.numerator} {value.denominator})"


def exact_record_check(problem: Any, points: Sequence[Point]) -> dict[str, Any]:
    local = {global_index: index for index, global_index in enumerate(problem.subset)}
    differences = {}
    failures = []
    for equation in problem.equations:
        left = tuple(local[value] for value in equation.left_edge)
        right = tuple(local[value] for value in equation.right_edge)
        difference = dist2(points[left[0]], points[left[1]]) - dist2(
            points[right[0]], points[right[1]]
        )
        differences[str(equation.source_index)] = fraction_json(difference)
        if difference:
            failures.append(f"source equality {equation.source_index}: {difference}")
    orientations, distances = strict_values(points)
    if min(orientations) <= 0:
        failures.append(f"minimum orientation: {min(orientations)}")
    if min(distances) <= 0:
        failures.append(f"minimum squared distance: {min(distances)}")
    return {
        "status": "PASS" if not failures else "FAIL",
        "failures": failures,
        "equality_differences": differences,
        "minimum_orientation": fraction_json(min(orientations)),
        "minimum_squared_distance": fraction_json(min(distances)),
    }


def append_coordinates(smt2: str, points: Sequence[Point]) -> str:
    if not smt2.rstrip().endswith("(check-sat)"):
        raise ValueError("unexpected SMT-LIB terminator")
    assertions = []
    for index, (x, y) in enumerate(points):
        assertions.append(f"(assert (= x_{index} {fraction_smt(x)}))")
        assertions.append(f"(assert (= y_{index} {fraction_smt(y)}))")
    return (
        smt2.rsplit("(check-sat)", 1)[0]
        + "\n"
        + "\n".join(assertions)
        + "\n(check-sat)\n"
    )


def normalized_unsat_smt2() -> str:
    return """(set-logic QF_NRA)
(declare-fun t () Real)
(declare-fun v () Real)
(declare-fun u () Real)
(define-fun Q () Real (- (* t u) 1))
(define-fun P () Real (+ (* t u) (* t v) (- (* u v)) 1))
(define-fun R () Real (+ (* t u v) (- t) u v))
(define-fun A () Real (+ (* t v) (- t) v 1))
(define-fun B () Real (+ (* t v) t (- v) 1))
(assert (> t 0))
(assert (> v t))
(assert (> (* 2 t Q P) 0))
(assert (> (* P R) 0))
(assert (> (* (- t v) A B) 0))
(check-sat)
"""


def five_normalized_unsat_smt2() -> str:
    return """(set-logic QF_NRA)
(declare-fun t () Real)
(declare-fun u () Real)
(declare-fun v () Real)
(assert (> t 0))
(assert (> (* -8 v (- t u) (- t v)) 0))
(assert (> (* -4 (- t u)) 0))
(assert (> (* -8 v) 0))
(check-sat)
"""


def singular_script() -> str:
    return """ring r=0,(t,v,u),dp;
poly D3=1+t2;
poly X3=1-t2;
poly Y3=2t;
poly D5=1+v2;
poly X5=1-v2;
poly Y5=2v;
poly D4=2*(1+t*v);
poly X4=1-t*v;
poly Y4=t+v;
poly Du=1+u2;
poly D2=D4*Du;
poly X2=2u*(u*X4+Y4);
poly Y2=2u*(u*Y4-X4);
poly Q=t*u-1;
poly P=t*u+t*v-u*v+1;
poly R=t*u*v-t+u+v;
poly A=t*v-t+v+1;
poly B=t*v+t-v+1;
poly raw231=(X3*D2-X2*D3)*(-Y2)-(Y3*D2-Y2*D3)*(D2-X2);
poly raw342=(X4*D3-X3*D4)*(Y2*D3-Y3*D2)
             -(Y4*D3-Y3*D4)*(X2*D3-X3*D2);
poly raw453=(X5*D4-X4*D5)*(Y3*D4-Y4*D3)
             -(Y5*D4-Y4*D5)*(X3*D4-X4*D3);
print("ORIENT_231_FACTORIZATION");
reduce(raw231-8t*Du*(t*v+1)*Q*P,std(0));
print("ORIENT_342_FACTORIZATION");
reduce(raw342-2*D3^2*P*R,std(0));
print("ORIENT_453_FACTORIZATION");
reduce(raw453-4*(t-v)*(t*v+1)*A*B,std(0));
print("A_POSITIVE_DECOMPOSITION");
reduce(A-((v-t)*(t+1)+(t2+1)),std(0));
print("ROOT_ORDER_IDENTITY");
reduce((t2*v+2t-v)-((t+1)*B-(t2+1)),std(0));
poly antiX2=2*X4;
poly antiY2=2*Y4;
poly antiD2=D4;
poly antiRaw342=(X4*D3-X3*D4)*(antiY2*D3-Y3*antiD2)
                   -(Y4*D3-Y3*D4)*(antiX2*D3-X3*antiD2);
print("SIX_ANTIPODAL_ORIENT_342");
reduce(antiRaw342-2*(t-v)*D3^2*(t*v+1),std(0));
poly fD2=1+t2;
poly fX2=2;
poly fY2=2t;
poly fD4=1+u2;
poly fX4=2;
poly fY4=2u;
poly fDv=1+v2;
poly fD3=fD4*fDv;
poly fX3=(1-v2)*fX4-2v*fY4;
poly fY3=2v*fX4+(1-v2)*fY4;
poly fraw120=fY2;
poly fraw342=(fX4*fD3-fX3*fD4)*(fY2*fD3-fY3*fD2)
              -(fY4*fD3-fY3*fD4)*(fX2*fD3-fX3*fD2);
poly fraw402=(-fX4)*(fY2*fD4-fY4*fD2)
              -(-fY4)*(fX2*fD4-fX4*fD2);
poly fraw403=(-fX4)*(fY3*fD4-fY4*fD3)
              -(-fY4)*(fX3*fD4-fX4*fD3);
print("FIVE_ORIENT_120_FACTORIZATION");
reduce(fraw120-2t,std(0));
print("FIVE_ORIENT_342_FACTORIZATION");
reduce(fraw342+8v*(t-u)*(t-v)*fD4^2*fDv,std(0));
print("FIVE_ORIENT_402_FACTORIZATION");
reduce(fraw402+4*(t-u)*fD4,std(0));
print("FIVE_ORIENT_403_FACTORIZATION");
reduce(fraw403+8v*fD4^2,std(0));
print("FIVE_ANTIPODAL_ORIENT_403");
reduce((-fX4)*((-fY4)*fD4-fY4*fD4)
       -(-fY4)*((-fX4)*fD4-fX4*fD4),std(0));
quit;
"""


def coordinates_json(subset: Sequence[int], points: Sequence[Point]) -> list[dict[str, Any]]:
    return [
        {
            "local_vertex": index,
            "global_class": subset[index],
            "x": fraction_json(point[0]),
            "y": fraction_json(point[1]),
        }
        for index, point in enumerate(points)
    ]


def main() -> int:
    miner = load_miner()
    source = json.loads(SOURCE_RESULT.read_text())
    probe, equations, validation = miner.validate_source(source_config(miner, source))
    aliases = probe["target"]["alias_classes_in_order"]
    five_source = json.loads((HERE / "five-resolution.json").read_text())
    six_source = json.loads(SIX_RESULT.read_text())

    five_unsat_path = HERE / "five-q1-4-14-15-16-normalized-unsat-schema.smt2"
    five_unsat_path.write_text(five_normalized_unsat_smt2())
    five_unsat_z3 = miner.run_solver_file("z3", five_unsat_path, 30_000)
    five_unsat_cvc5 = miner.run_solver_file("cvc5", five_unsat_path, 30_000)
    unsat_path = HERE / "six-rank-4-5-normalized-unsat-schema.smt2"
    unsat_path.write_text(normalized_unsat_smt2())
    unsat_z3 = miner.run_solver_file("z3", unsat_path, 30_000)
    unsat_cvc5 = miner.run_solver_file("cvc5", unsat_path, 30_000)
    singular_path = HERE / "normalized-schema-identities.sing"
    singular_path.write_text(singular_script())
    singular_process = subprocess.run(
        ["Singular", str(singular_path)],
        capture_output=True,
        text=True,
        timeout=30,
        check=False,
    )
    singular_output = HERE / "normalized-schema-identities.out"
    singular_output.write_text(singular_process.stdout + singular_process.stderr)
    labels = (
        "ORIENT_231_FACTORIZATION",
        "ORIENT_342_FACTORIZATION",
        "ORIENT_453_FACTORIZATION",
        "A_POSITIVE_DECOMPOSITION",
        "ROOT_ORDER_IDENTITY",
        "SIX_ANTIPODAL_ORIENT_342",
        "FIVE_ORIENT_120_FACTORIZATION",
        "FIVE_ORIENT_342_FACTORIZATION",
        "FIVE_ORIENT_402_FACTORIZATION",
        "FIVE_ORIENT_403_FACTORIZATION",
        "FIVE_ANTIPODAL_ORIENT_403",
    )
    singular_pass = (
        singular_process.returncode == 0
        and all(f"{label}\n0" in singular_process.stdout for label in labels)
    )

    five_parameters, five_points = five_schema()
    five_cases = []
    for row in five_source["cases"]:
        subset = tuple(row["subset"])
        induced = miner.induced_equations(subset, equations)
        problem = miner.build_problem(subset, induced)
        base = miner.direct_smt2(problem, [record.name for record in problem.records])
        if subset == (1, 4, 14, 15, 16):
            local = {value: index for index, value in enumerate(subset)}
            actual_shape = {
                (
                    tuple(local[value] for value in equation.left_edge),
                    tuple(local[value] for value in equation.right_edge),
                )
                for equation in induced
            }
            expected_shape = {
                ((0, 1), (1, 2)),
                ((0, 3), (0, 4)),
                ((1, 2), (1, 4)),
            }
            shape_pass = actual_shape == expected_shape
            passed = (
                shape_pass
                and five_unsat_z3["status"] == "UNSAT"
                and five_unsat_cvc5["status"] == "UNSAT"
                and singular_pass
            )
            five_cases.append(
                {
                    "case_id": row["case_id"],
                    "subset": list(subset),
                    "aliases": [aliases[index] for index in subset],
                    "source_equation_indices": [q.source_index for q in induced],
                    "status": (
                        "UNSAT_EXACT_NORMALIZED_SCHEMA"
                        if passed
                        else "UNKNOWN_FAIL_CLOSED"
                    ),
                    "local_shape_check": "PASS" if shape_pass else "FAIL",
                    "orientation_core": [
                        "orient(p1,p2,p0)>0",
                        "orient(p3,p4,p2)>0",
                        "orient(p4,p0,p2)>0",
                        "orient(p4,p0,p3)>0",
                    ],
                    "parameterization_completeness": (
                        "PASS: the only omitted half-angle rotation is "
                        "p3=-p4, which makes orient(p4,p0,p3)=0."
                    ),
                    "normalized_schema_smt2": str(five_unsat_path),
                    "normalized_schema_smt2_sha256": sha256(five_unsat_path),
                    "z3_fresh_replay": five_unsat_z3,
                    "cvc5_independent_replay": five_unsat_cvc5,
                    "singular_identity_check": "PASS" if singular_pass else "FAIL",
                    "singular_identity_script": str(singular_path),
                    "singular_identity_output": str(singular_output),
                }
            )
            continue
        check = exact_record_check(problem, five_points)
        path = HERE / f"five-{row['case_id']}.rational-witness.smt2"
        path.write_text(append_coordinates(base, five_points))
        z3_replay = miner.run_solver_file("z3", path, 30_000)
        cvc5_replay = miner.run_solver_file("cvc5", path, 30_000)
        passed = (
            check["status"] == "PASS"
            and z3_replay["status"] == "SAT"
            and cvc5_replay["status"] == "SAT"
        )
        five_cases.append(
            {
                "case_id": row["case_id"],
                "subset": list(subset),
                "aliases": [aliases[index] for index in subset],
                "source_equation_indices": [q.source_index for q in induced],
                "status": "SAT_EXACT_RATIONAL_WITNESS" if passed else "UNKNOWN_FAIL_CLOSED",
                "rational_parameters": [fraction_json(value) for value in five_parameters],
                "coordinates": coordinates_json(subset, five_points),
                "exact_fraction_check": check,
                "witness_smt2": str(path),
                "witness_smt2_sha256": sha256(path),
                "z3_fresh_replay": z3_replay,
                "cvc5_independent_replay": cvc5_replay,
            }
        )

    unresolved = {
        int(row["rank"]): row
        for row in six_source["checks"]
        if row["terminal_status"] == "CVC5_UNKNOWN"
    }
    if set(unresolved) != {2, 4, 5}:
        raise RuntimeError(f"unexpected unresolved six ranks: {sorted(unresolved)}")

    rank2_parameters, rank2_points = rank2_schema()
    six_cases = []
    row = unresolved[2]
    subset = tuple(row["subset"])
    induced = miner.induced_equations(subset, equations)
    problem = miner.build_problem(subset, induced)
    base = miner.direct_smt2(problem, [record.name for record in problem.records])
    check = exact_record_check(problem, rank2_points)
    path = HERE / "six-rank-2.rational-witness.smt2"
    path.write_text(append_coordinates(base, rank2_points))
    z3_replay = miner.run_solver_file("z3", path, 30_000)
    cvc5_replay = miner.run_solver_file("cvc5", path, 30_000)
    passed = (
        check["status"] == "PASS"
        and z3_replay["status"] == "SAT"
        and cvc5_replay["status"] == "SAT"
    )
    six_cases.append(
        {
            "rank": 2,
            "subset": list(subset),
            "aliases": [aliases[index] for index in subset],
            "source_equation_indices": [q.source_index for q in induced],
            "status": "SAT_EXACT_RATIONAL_WITNESS" if passed else "UNKNOWN_FAIL_CLOSED",
            "rational_parameters": [fraction_json(value) for value in rank2_parameters],
            "coordinates": coordinates_json(subset, rank2_points),
            "exact_fraction_check": check,
            "witness_smt2": str(path),
            "witness_smt2_sha256": sha256(path),
            "z3_fresh_replay": z3_replay,
            "cvc5_independent_replay": cvc5_replay,
        }
    )

    expected_shape = {
        ((0, 1), (0, 3)),
        ((0, 1), (0, 5)),
        ((0, 3), (0, 5)),
        ((0, 4), (2, 4)),
        ((0, 4), (3, 4)),
        ((0, 4), (4, 5)),
        ((2, 4), (3, 4)),
        ((2, 4), (4, 5)),
        ((3, 4), (4, 5)),
    }
    for rank in (4, 5):
        row = unresolved[rank]
        subset = tuple(row["subset"])
        induced = miner.induced_equations(subset, equations)
        local = {value: index for index, value in enumerate(subset)}
        actual_shape = {
            (
                tuple(local[value] for value in equation.left_edge),
                tuple(local[value] for value in equation.right_edge),
            )
            for equation in induced
        }
        shape_pass = actual_shape == expected_shape
        passed = (
            shape_pass
            and unsat_z3["status"] == "UNSAT"
            and unsat_cvc5["status"] == "UNSAT"
            and singular_pass
        )
        six_cases.append(
            {
                "rank": rank,
                "subset": list(subset),
                "aliases": [aliases[index] for index in subset],
                "source_equation_indices": [q.source_index for q in induced],
                "status": "UNSAT_EXACT_NORMALIZED_SCHEMA" if passed else "UNKNOWN_FAIL_CLOSED",
                "local_shape_check": "PASS" if shape_pass else "FAIL",
                "orientation_core": [
                    "orient(p2,p3,p1)>0",
                    "orient(p3,p4,p2)>0",
                    "orient(p4,p5,p3)>0",
                ],
                "parameterization_completeness": (
                    "PASS: p3 and p5 have finite positive half-angle parameters; "
                    "the omitted p2=2*p4 rotation makes "
                    "orient(p3,p4,p2)<0 because t<v."
                ),
                "normalized_schema_smt2": str(unsat_path),
                "normalized_schema_smt2_sha256": sha256(unsat_path),
                "z3_fresh_replay": unsat_z3,
                "cvc5_independent_replay": unsat_cvc5,
                "singular_identity_check": "PASS" if singular_pass else "FAIL",
                "singular_identity_script": str(singular_path),
                "singular_identity_output": str(singular_output),
            }
        )

    payload = {
        "schema": "p97-v14-exact-timeout-resolution-v1",
        "terminal_status": (
            "ALL_RESOLVED_3_SAT_3_UNSAT"
            if all(case["status"] != "UNKNOWN_FAIL_CLOSED" for case in five_cases + six_cases)
            else "UNKNOWN_FAIL_CLOSED"
        ),
        "source_result": str(SOURCE_RESULT),
        "source_result_sha256": sha256(SOURCE_RESULT),
        "six_source_result": str(SIX_RESULT),
        "six_source_result_sha256": sha256(SIX_RESULT),
        "source_validation": validation,
        "five_cases": five_cases,
        "six_cases": six_cases,
        "five_normalized_unsat_validation": {
            "z3_fresh_replay": five_unsat_z3,
            "cvc5_independent_replay": five_unsat_cvc5,
            "singular_identity_check": "PASS" if singular_pass else "FAIL",
        },
        "normalized_unsat_validation": {
            "z3_fresh_replay": unsat_z3,
            "cvc5_independent_replay": unsat_cvc5,
            "singular_identity_check": "PASS" if singular_pass else "FAIL",
            "singular_output_sha256": sha256(singular_output),
        },
        "trust_boundary": (
            "Exact rational witnesses and an exact normalized QF_NRA schema for "
            "hash-pinned induced-positive subsets only; not the full survivor, "
            "not a sufficient geometric realization, and not Lean/kernel closure."
        ),
    }
    output = HERE / "exact-timeout-resolution.json"
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(output),
                "terminal_status": payload["terminal_status"],
                "five_statuses": [case["status"] for case in five_cases],
                "six_statuses": {
                    str(case["rank"]): case["status"] for case in six_cases
                },
            },
            sort_keys=True,
        )
    )
    return 0 if payload["terminal_status"].startswith("ALL_RESOLVED") else 2


if __name__ == "__main__":
    raise SystemExit(main())
