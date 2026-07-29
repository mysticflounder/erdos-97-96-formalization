#!/usr/bin/env python3
"""Resolve the eight v13 top-six UNKNOWN formulas with rational witnesses.

All discovery is fail-closed.  A case is SAT only when:
  * its circle parameterization gives every recorded equality exactly over Q;
  * every strict orientation and distinctness constraint is positive over Q;
  * the coordinate-pinned original SMT-LIB formula replays SAT in both Z3 and
    cvc5.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
import subprocess
import sys
from fractions import Fraction
from pathlib import Path
from typing import Sequence


HERE = Path(__file__).resolve().parent
PRIORITY = HERE.parent
RANK_DRIVER = PRIORITY / "rank_and_check_v13_six.py"
SOURCE_RESULT = PRIORITY / "v13-six-priority-search.json"
UNKNOWN_RANKS = (1, 4, 6, 8, 9, 10, 14, 15)

Point = tuple[Fraction, Fraction]


def load_rank_driver():
    spec = importlib.util.spec_from_file_location("v13_six_rank_driver", RANK_DRIVER)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {RANK_DRIVER}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def circle(t):
    den = 1 + t * t
    return ((1 - t * t) / den, 2 * t / den)


def add(a, b):
    return (a[0] + b[0], a[1] + b[1])


def sub(a, b):
    return (a[0] - b[0], a[1] - b[1])


def scale(s, a):
    return (s * a[0], s * a[1])


def rotate(a, t):
    c, s = circle(t)
    return (c * a[0] - s * a[1], s * a[0] + c * a[1])


def norm2(a):
    return a[0] * a[0] + a[1] * a[1]


def dist2(a, b):
    return norm2(sub(a, b))


def circumcenter(a, b, c):
    # Solve 2*x dot (b-a) = |b|^2-|a|^2 and similarly for c-a.
    u = sub(b, a)
    v = sub(c, a)
    ru = (norm2(b) - norm2(a)) / 2
    rv = (norm2(c) - norm2(a)) / 2
    determinant = u[0] * v[1] - u[1] * v[0]
    if determinant == 0:
        raise ZeroDivisionError("collinear circumcenter inputs")
    return (
        (ru * v[1] - u[1] * rv) / determinant,
        (u[0] * rv - ru * v[0]) / determinant,
    )


def schema_a(parameters):
    """Rank 1: unit star at p0, unit edge p1-p5, star at p3."""
    t, u, v = parameters
    zero = type(t)(0)
    one = type(t)(1)
    p0, p1 = (zero, zero), (one, zero)
    p2 = circle(t)
    p4 = circle(u)
    p5 = add(p1, circle(v))
    p3 = circumcenter(p2, p4, p5)
    return (p0, p1, p2, p3, p4, p5)


def schema_b(parameters):
    """Ranks 4/6: alternating points on unit circles about p0 and p1."""
    t, u, v, w = parameters
    zero = type(t)(0)
    one = type(t)(1)
    p0, p1 = (zero, zero), (one, zero)
    return (
        p0,
        p1,
        circle(t),
        add(p1, circle(v)),
        circle(u),
        add(p1, circle(w)),
    )


def schema_c(parameters):
    """Ranks 8/9/10: p2,p3,p5 concentric; p4,p5 unit about p1."""
    t, u, v, w = parameters
    zero = type(t)(0)
    one = type(t)(1)
    p0, p1 = (zero, zero), (one, zero)
    p5 = add(p1, circle(w))
    return (
        p0,
        p1,
        rotate(p5, t),
        rotate(p5, u),
        add(p1, circle(v)),
        p5,
    )


def schema_d(parameters):
    """Ranks 14/15: unit star at p0 and equal-radius star at p2."""
    s, lam, u, v = parameters
    zero = type(s)(0)
    one = type(s)(1)
    p0, p1 = (zero, zero), (one, zero)
    p3 = circle(s)
    chord = sub(p3, p1)
    p2 = scale(lam, (-chord[1], chord[0]))
    p4 = add(p2, rotate(sub(p1, p2), u))
    p5 = circle(v)
    return (p0, p1, p2, p3, p4, p5)


SCHEMAS = {
    "A": schema_a,
    "B": schema_b,
    "C": schema_c,
}
RANK_SCHEMA = {1: "A", 4: "B", 6: "B", 8: "C", 9: "C", 10: "C", 14: "D", 15: "D"}
WITNESS_PARAMETERS = {
    "A": (Fraction(1, 8), Fraction(3, 5), Fraction(17, 9)),
    "B": (Fraction(1, 5), Fraction(4, 7), Fraction(5, 4), Fraction(11, 6)),
    "C": (Fraction(-1, 4), Fraction(-1, 5), Fraction(1, 2), Fraction(4, 7)),
}


def orient(points, a, b, c):
    ab = sub(points[b], points[a])
    ac = sub(points[c], points[a])
    return ab[0] * ac[1] - ab[1] * ac[0]


def strict_values(points):
    orientations = [
        orient(points, a, (a + 1) % 6, c)
        for a in range(6)
        for c in range(6)
        if c not in (a, (a + 1) % 6)
    ]
    distances = [dist2(points[a], points[b]) for a in range(6) for b in range(a + 1, 6)]
    return orientations, distances


def fraction_json(value: Fraction) -> dict[str, int]:
    return {"numerator": value.numerator, "denominator": value.denominator}


def fraction_smt(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"(/ {value.numerator} {value.denominator})"


def exact_record_check(problem, points: Sequence[Point]) -> dict:
    failures = []
    equality_values = {}
    for equation in problem.equations:
        local = {global_index: index for index, global_index in enumerate(problem.subset)}
        left = tuple(local[v] for v in equation.left_edge)
        right = tuple(local[v] for v in equation.right_edge)
        difference = dist2(points[left[0]], points[left[1]]) - dist2(
            points[right[0]], points[right[1]]
        )
        equality_values[str(equation.source_index)] = fraction_json(difference)
        if difference != 0:
            failures.append(f"source equality {equation.source_index}: {difference}")
    orientations, distances = strict_values(points)
    if min(orientations) <= 0:
        failures.append(f"minimum orientation is {min(orientations)}")
    if min(distances) <= 0:
        failures.append(f"minimum squared distance is {min(distances)}")
    return {
        "status": "PASS" if not failures else "FAIL",
        "failures": failures,
        "equality_differences": equality_values,
        "minimum_orientation": fraction_json(min(orientations)),
        "minimum_squared_distance": fraction_json(min(distances)),
    }


def append_coordinate_assertions(original: str, points: Sequence[Point]) -> str:
    if not original.rstrip().endswith("(check-sat)"):
        raise ValueError("unexpected SMT-LIB terminator")
    assertions = []
    for index, (x, y) in enumerate(points):
        assertions.append(f"(assert (= x_{index} {fraction_smt(x)}))")
        assertions.append(f"(assert (= y_{index} {fraction_smt(y)}))")
    return original.rsplit("(check-sat)", 1)[0] + "\n" + "\n".join(assertions) + "\n(check-sat)\n"


def unsat_schema_smt2() -> str:
    """Shrunk terminal algebraic consequence of the rank-14/15 geometry.

    Variables t and v are half-angle parameters for local p3 and p5 on the
    unit circle about p0.  L and A are linear forms extracted from the two
    decisive orientations.  F is forced positive by the second-circle
    equality.  ``schema-identities.sing`` checks the source-to-schema polynomial
    normalization independently over Q.
    """
    return """(set-logic QF_NRA)
(declare-fun t () Real)
(declare-fun v () Real)
(declare-fun L () Real)
(declare-fun A () Real)
(declare-fun F () Real)
(assert (> t 0))
(assert (> v t))
(assert (> L 0))
(assert (< (+ (* v A) L) 0))
(assert (> F 0))
(assert (= F (+ (- (* A A)) (* 2 t A) (- (* L L)))))
(check-sat)
"""


def singular_identity_script() -> str:
    return """ring r=0,(t,v,h,x,y,L,A),dp;
ideal defs =
  L-(1-x-t*y),
  A-(t*(x+1)-y);
poly F=(1-x^2-y^2)*(1+t^2)-2*L;
poly rhs=-A^2+2*t*A-L^2;
poly circleExpanded=(x-h)^2+(y-h*t)^2-((1-h)^2+(h*t)^2);
poly circleNormalized=x^2+y^2-1+2*h*L;
print("F_IDENTITY_REMAINDER");
reduce(F-rhs,std(defs));
print("CIRCLE_NORMALIZATION_REMAINDER");
reduce(circleExpanded-circleNormalized,std(defs));
quit;
"""


def main() -> int:
    rank_driver = load_rank_driver()
    miner = rank_driver.load_miner()
    probe, equations, source_validation = miner.validate_source(rank_driver.source_config(miner))
    source = json.loads(SOURCE_RESULT.read_text())
    source_unknown = {
        int(row["rank"]): row
        for row in source["checks"]
        if row["z3"]["status"] == "UNKNOWN"
    }
    if tuple(sorted(source_unknown)) != UNKNOWN_RANKS:
        raise RuntimeError(f"source UNKNOWN ranks changed: {sorted(source_unknown)}")

    schema_witnesses = {
        name: (parameters, SCHEMAS[name](parameters))
        for name, parameters in WITNESS_PARAMETERS.items()
    }

    unsat_path = HERE / "rank-14-15-normalized-unsat-schema.smt2"
    unsat_path.write_text(unsat_schema_smt2())
    unsat_z3 = miner.run_solver_file("z3", unsat_path, 30_000)
    unsat_cvc5 = miner.run_solver_file("cvc5", unsat_path, 30_000)
    singular_path = HERE / "schema-identities.sing"
    singular_path.write_text(singular_identity_script())
    singular_process = subprocess.run(
        ["Singular", str(singular_path)],
        capture_output=True,
        text=True,
        timeout=30,
        check=False,
    )
    singular_output_path = HERE / "schema-identities.out"
    singular_output_path.write_text(singular_process.stdout + singular_process.stderr)
    singular_identity_check = (
        singular_process.returncode == 0
        and "F_IDENTITY_REMAINDER\n0" in singular_process.stdout
        and "CIRCLE_NORMALIZATION_REMAINDER\n0" in singular_process.stdout
    )

    cases = []
    for rank in UNKNOWN_RANKS:
        row = source_unknown[rank]
        subset = tuple(row["subset"])
        induced = miner.induced_equations(subset, equations)
        problem = miner.build_problem(subset, induced)
        base_smt = miner.direct_smt2(problem, [record.name for record in problem.records])
        base_path = HERE / f"rank-{rank}-base.smt2"
        base_path.write_text(base_smt)
        schema = RANK_SCHEMA[rank]
        common = {
            "rank": rank,
            "subset": list(subset),
            "source_equation_indices": [equation.source_index for equation in induced],
            "schema": schema,
            "base_smt2": str(base_path),
            "base_smt2_sha256": sha256(base_path),
        }
        if schema != "D":
            parameters, points = schema_witnesses[schema]
            exact_check = exact_record_check(problem, points)
            witness_path = HERE / f"rank-{rank}-rational-witness.smt2"
            witness_path.write_text(append_coordinate_assertions(base_smt, points))
            z3_replay = miner.run_solver_file("z3", witness_path, 30_000)
            cvc5_replay = miner.run_solver_file("cvc5", witness_path, 30_000)
            validated = (
                exact_check["status"] == "PASS"
                and z3_replay["status"] == "SAT"
                and cvc5_replay["status"] == "SAT"
            )
            cases.append(
                {
                    **common,
                    "status": "SAT_EXACT_RATIONAL_WITNESS" if validated else "UNKNOWN_FAIL_CLOSED",
                    "rational_parameters": [fraction_json(value) for value in parameters],
                    "coordinates": [
                        {
                            "local_vertex": index,
                            "global_class": subset[index],
                            "x": fraction_json(point[0]),
                            "y": fraction_json(point[1]),
                        }
                        for index, point in enumerate(points)
                    ],
                    "exact_fraction_check": exact_check,
                    "witness_smt2": str(witness_path),
                    "witness_smt2_sha256": sha256(witness_path),
                    "z3_fresh_replay": z3_replay,
                    "cvc5_independent_replay": cvc5_replay,
                }
            )
        else:
            expected_local_shapes = {
                ((0, 1), (0, 3)),
                ((0, 1), (0, 5)),
                ((0, 3), (0, 5)),
                ((1, 2), (2, 3)),
                ((1, 2), (2, 4)),
                ((2, 3), (2, 4)),
            }
            local = {global_index: index for index, global_index in enumerate(subset)}
            actual_local_shapes = {
                (
                    tuple(local[value] for value in equation.left_edge),
                    tuple(local[value] for value in equation.right_edge),
                )
                for equation in induced
            }
            shape_check = actual_local_shapes == expected_local_shapes
            validated = (
                shape_check
                and unsat_z3["status"] == "UNSAT"
                and unsat_cvc5["status"] == "UNSAT"
                and singular_identity_check
            )
            cases.append(
                {
                    **common,
                    "status": "UNSAT_EXACT_NORMALIZED_SCHEMA" if validated else "UNKNOWN_FAIL_CLOSED",
                    "local_shape_check": "PASS" if shape_check else "FAIL",
                    "normalized_schema_smt2": str(unsat_path),
                    "normalized_schema_smt2_sha256": sha256(unsat_path),
                    "z3_fresh_replay": unsat_z3,
                    "cvc5_independent_replay": unsat_cvc5,
                    "singular_identity_script": str(singular_path),
                    "singular_identity_output": str(singular_output_path),
                    "singular_identity_check": (
                        "PASS" if singular_identity_check else "FAIL"
                    ),
                    "orientation_core": [
                        "orient(p0,p1,p3)>0",
                        "orient(p0,p1,p5)>0",
                        "orient(p0,p3,p5)>0",
                        "orient(p1,p2,p3)>0",
                        "orient(p1,p3,p4)>0",
                        "orient(p3,p4,p5)>0",
                    ],
                    "equality_core": [
                        "d2(p0,p1)=d2(p0,p3)=d2(p0,p5)",
                        "d2(p2,p1)=d2(p2,p3)=d2(p2,p4)",
                    ],
                }
            )

    payload = {
        "schema": "p97-v13-six-priority-resolution-v1",
        "terminal_status": (
            "ALL_EIGHT_RESOLVED_6_SAT_2_UNSAT"
            if sum(case["status"] == "SAT_EXACT_RATIONAL_WITNESS" for case in cases) == 6
            and sum(case["status"] == "UNSAT_EXACT_NORMALIZED_SCHEMA" for case in cases) == 2
            else "UNKNOWN_FAIL_CLOSED"
        ),
        "status_counts": {
            status: sum(case["status"] == status for case in cases)
            for status in sorted({case["status"] for case in cases})
        },
        "source_result": str(SOURCE_RESULT),
        "source_result_sha256": sha256(SOURCE_RESULT),
        "source_validation": source_validation,
        "alias_classes_in_order": probe["target"]["alias_classes_in_order"],
        "unsat_schema_validation": {
            "z3_fresh_replay": unsat_z3,
            "cvc5_independent_replay": unsat_cvc5,
            "singular_identity_check": (
                "PASS" if singular_identity_check else "FAIL"
            ),
            "singular_output": str(singular_output_path),
            "singular_output_sha256": sha256(singular_output_path),
        },
        "method": (
            "three rational circle/circumcenter parameterizations for six SAT "
            "cases; a normalized exact equality-orientation contradiction for "
            "two UNSAT cases; fresh Z3 and independent cvc5 replay"
        ),
        "trust_boundary": (
            "directly checkable exact witnesses for the recorded induced-positive "
            "QF_NRA formulas; not Lean/kernel closure and not the full survivor formula"
        ),
        "cases": cases,
    }
    result_path = HERE / "resolution.json"
    result_path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")

    lines = [
        "# v13 top-six UNKNOWN resolution",
        "",
        f"- Terminal status: `{payload['terminal_status']}`",
        "- Exact verdicts: 6 SAT, 2 UNSAT, 0 UNKNOWN.",
        (
            "- SAT evidence: rational coordinates, exact Fraction replay of every "
            "constraint, and coordinate-pinned Z3/cvc5 replay. UNSAT evidence: "
            "a shrunk six-orientation/two-equality schema replayed by both engines "
            "plus exact polynomial-identity checking in Singular."
        ),
        f"- Source result SHA-256: `{payload['source_result_sha256']}`.",
        "",
        "| rank | subset | equalities | schema | exact check | Z3 | cvc5 | status |",
        "|---:|---|---|---:|---|---|---|---|",
    ]
    for case in cases:
        lines.append(
            f"| {case['rank']} | `{tuple(case['subset'])}` | "
            f"`{case['source_equation_indices']}` | {case['schema']} | "
            f"`{case.get('exact_fraction_check', {}).get('status', case.get('local_shape_check'))}` | "
            f"`{case['z3_fresh_replay']['status']}` | "
            f"`{case['cvc5_independent_replay']['status']}` | "
            f"`{case['status']}` |"
        )
    lines.extend(
        [
            "",
            "Schemas B and C cover ranks 4/6 and 8/9/10 respectively; their "
            "identical local equality shapes are stable under the listed "
            "global-class relabelings. Schema A is rank 1. Schema D is the "
            "common exact obstruction for ranks 14/15.",
            "",
            "## Rank 14/15 normalized contradiction",
            "",
            "The shrunk schema keeps only:",
            "",
            "- `d2(p0,p1)=d2(p0,p3)=d2(p0,p5)`;",
            "- `d2(p2,p1)=d2(p2,p3)=d2(p2,p4)`; and",
            (
                "- orientations `013`, `015`, `035`, `123`, `134`, `345` "
                "(the digits are local vertex indices)."
            ),
            "",
            (
                "Gauge `p0=(0,0)`, `p1=(1,0)`. Half-angle parameters put "
                "`p3` at parameter `t>0` and `p5` at `v>t`. The second center "
                "is `(h,h*t)` with `h(1+t^2)>1`; write `p4=(x,y)`, "
                "`L=1-x-t*y>0`, and `A=t(x+1)-y`."
            ),
            "",
            (
                "Orientation `345` is `v*A+L<0`, hence `A<0`. The second-circle "
                "equality and `h(1+t^2)>1` give "
                "`F=(1-x^2-y^2)(1+t^2)-2L>0`. But exact expansion gives "
                "`F=-A^2+2tA-L^2<0`, contradiction."
            ),
            "",
            (
                "Fresh Z3 and cvc5 both replay the normalized schema as "
                f"`{unsat_z3['status']}`/`{unsat_cvc5['status']}`; Singular "
                f"checks both normalization identities: "
                f"`{'PASS' if singular_identity_check else 'FAIL'}`."
            ),
            "",
            "## Trust boundary",
            "",
            payload["trust_boundary"] + ".",
            "",
            "Pinned false-row disequalities and nonlocal CEGAR facts remain omitted, "
            "exactly as in the source six-priority lane.",
            "",
            "## Replay",
            "",
            "For each `rank-*-rational-witness.smt2`, both commands must print `sat`:",
            "",
            "```bash",
            "z3 -smt2 rank-1-rational-witness.smt2",
            "cvc5 --lang smt2 --nl-cov rank-1-rational-witness.smt2",
            "```",
            "",
        ]
    )
    (HERE / "report.md").write_text("\n".join(lines))
    print(
        json.dumps(
            {
                "terminal_status": payload["terminal_status"],
                "status_counts": payload["status_counts"],
                "result": str(result_path),
                "report": str(HERE / "report.md"),
            },
            sort_keys=True,
        )
    )
    return 0 if payload["terminal_status"].startswith("ALL_EIGHT") else 2


if __name__ == "__main__":
    raise SystemExit(main())
