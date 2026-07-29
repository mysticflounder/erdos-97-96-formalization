#!/usr/bin/env python3
"""Replay the normalized rational witnesses for v16 six ranks 1 and 2."""

from __future__ import annotations

import importlib.util
import json
import sys
from fractions import Fraction
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
HELPER = HERE / "resolve_v16_exact_remaining.py"
SOURCE = HERE / "exact-4-5.json"
SIX = HERE / "v16-six-priority-search-top24.json"
Point = tuple[Fraction, Fraction]


def load(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def add(a: Point, b: Point) -> Point:
    return a[0] + b[0], a[1] + b[1]


def rotate(a: Point, parameter: Fraction) -> Point:
    cosine, sine = helper.circle(parameter)
    return (
        cosine * a[0] - sine * a[1],
        sine * a[0] + cosine * a[1],
    )


helper: Any


def main() -> int:
    global helper
    helper = load(HELPER, "v16_six_rational_helper")
    miner = helper.load_miner()
    helper.MINER = miner
    source = json.loads(SOURCE.read_text())
    six = json.loads(SIX.read_text())
    probe, equations, validation = miner.validate_source(helper.source_config(miner, source))

    t, u, v = Fraction(3, 2), Fraction(-25, 16), Fraction(2)
    b, c = (Fraction(0), Fraction(0)), (Fraction(1), Fraction(0))
    e = helper.circle(t)
    d = (Fraction(1, 2), t / 2)
    f = helper.circle(v)
    a = add(e, rotate((c[0] - e[0], c[1] - e[1]), u))
    points = (a, b, c, d, e, f)
    gauge_points = helper.normalize_gauge(points)

    rows = {row["rank"]: row for row in six["checks"]}
    cases = []
    for rank in (1, 2):
        subset = tuple(rows[rank]["subset"])
        induced = miner.induced_equations(subset, equations)
        problem = miner.build_problem(subset, induced)
        exact = helper.exact_rational_check(problem, points)
        names = [record.name for record in problem.records]
        smt2 = helper.coordinate_smt2(miner.direct_smt2(problem, names), gauge_points)
        smt_path = HERE / f"six-rank-{rank}-rational-pinned.smt2"
        smt_path.write_text(smt2)
        z3_replay = miner.run_solver_file("z3", smt_path, 30_000)
        cvc5_replay = miner.run_solver_file("cvc5", smt_path, 30_000)
        passed = (
            exact["status"] == "PASS"
            and z3_replay["status"] == "SAT"
            and cvc5_replay["status"] == "SAT"
        )
        cases.append(
            {
                "rank": rank,
                "subset": list(subset),
                "aliases": [probe["target"]["alias_classes_in_order"][i] for i in subset],
                "source_equation_indices": rows[rank]["induced_source_equation_indices"],
                "status": "SAT_EXACT_RATIONAL_WITNESS" if passed else "UNKNOWN_FAIL_CLOSED",
                "parameters": {
                    "t": helper.fraction_json(t),
                    "u": helper.fraction_json(u),
                    "v": helper.fraction_json(v),
                },
                "exact_fraction_replay": exact,
                "gauge_normalized_coordinates": [
                    {
                        "local_vertex": i,
                        "global_class": subset[i],
                        "x": helper.fraction_json(point[0]),
                        "y": helper.fraction_json(point[1]),
                    }
                    for i, point in enumerate(gauge_points)
                ],
                "pinned_smt2": str(smt_path),
                "pinned_smt2_sha256": miner.sha256(smt_path),
                "z3_pinned_replay": z3_replay,
                "cvc5_pinned_replay": cvc5_replay,
            }
        )

    payload = {
        "schema": "p97-v16-six-rank1-rank2-exact-rational-resolution-v1",
        "source_validation": validation,
        "normalized_schema": {
            "ordered_roles": ["A", "B", "C", "D", "E", "F"],
            "equalities": ["AE=CE", "BC=BE=BF", "BD=CD=DE"],
            "parameterization": [
                "B=(0,0), C=(1,0)",
                "E=circle(t), D=(1/2,t/2), F=circle(v)",
                "A=E+R_u(C-E)",
            ],
        },
        "cases": cases,
        "terminal_status": (
            "ALL_TWO_SAT_EXACT_RATIONAL_WITNESSES"
            if all(case["status"].startswith("SAT_") for case in cases)
            else "UNKNOWN_FAIL_CLOSED"
        ),
        "trust_scope": (
            "Exact Fraction replay and coordinate-pinned Z3/cvc5 SAT evidence for "
            "the induced positive-equality abstraction; not the full CEGAR formula "
            "and not Lean/kernel closure."
        ),
    }
    output = HERE / "six-rank1-rank2-resolution.json"
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "terminal_status": payload["terminal_status"],
                "statuses": [case["status"] for case in cases],
                "output": str(output),
            },
            sort_keys=True,
        )
    )
    return 0 if payload["terminal_status"].startswith("ALL_TWO") else 2


if __name__ == "__main__":
    raise SystemExit(main())
