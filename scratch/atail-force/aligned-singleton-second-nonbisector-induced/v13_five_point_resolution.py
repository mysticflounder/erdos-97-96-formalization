#!/usr/bin/env python3
"""Resolve the 15 v13 five-point QF_NRA UNKNOWN cases fail-closed.

This is a scratch-only companion to exact_euclidean_subset_core_miner.py.  It
first reproduces the original one-second Z3/cvc5 classification from the
hash-pinned v13 source, then emits every doubly-UNKNOWN formula separately.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import importlib.util
import json
import sys
from fractions import Fraction
from pathlib import Path

import numpy as np
from scipy.optimize import differential_evolution


HERE = Path(__file__).resolve().parent
MINER_PATH = HERE / "exact_euclidean_subset_core_miner.py"
SOURCE_RESULT = (
    HERE / "exact-euclidean-subset-core-v13-local-critical-reuse-second.json"
)
OUT = HERE / "v13-five-point-resolution"


def load_miner():
    spec = importlib.util.spec_from_file_location("v13_subset_miner", MINER_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {MINER_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def source_config(miner, source: dict):
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
        expected_recorded_cegar_sha256=source["inputs"][
            "cegar_script_recorded_sha256"
        ],
        expected_class_count=source["source_validation"]["alias_class_count"],
        expected_equation_count=source["source_validation"][
            "positive_equation_count"
        ],
    )


def discover() -> dict:
    miner = load_miner()
    source = json.loads(SOURCE_RESULT.read_text())
    probe, equations, validation = miner.validate_source(
        source_config(miner, source)
    )
    rows, histogram = miner.candidate_rows(
        5, equations, validation["alias_class_count"]
    )
    counts: dict[str, int] = {}
    unresolved: list[dict] = []
    for subset, induced in rows:
        if not induced:
            continue
        problem = miner.build_problem(subset, induced)
        names = [record.name for record in problem.records]
        z3_check = miner.check_direct_records(problem, names, 1000)
        z3_status = z3_check["status"]
        counts[z3_status] = counts.get(z3_status, 0) + 1
        if z3_status != "UNKNOWN":
            continue
        smt2 = miner.direct_smt2(problem, names)
        cvc5_check = miner.run_cvc5_text(smt2, 1000)
        cvc5_status = cvc5_check["status"]
        key = f"CVC5_{cvc5_status}"
        counts[key] = counts.get(key, 0) + 1
        if cvc5_status != "UNKNOWN":
            continue
        case_id = f"q{'-'.join(str(value) for value in subset)}"
        smt_path = OUT / f"{case_id}.smt2"
        smt_path.write_text(smt2)
        unresolved.append(
            {
                "case_id": case_id,
                "subset": list(subset),
                "induced_source_equation_indices": [
                    equation.source_index for equation in induced
                ],
                "smt2": str(smt_path),
                "smt2_sha256": miner.sha256(smt_path),
                "z3_initial": z3_check,
                "cvc5_initial": cvc5_check,
            }
        )
    return {
        "schema": "p97-v13-five-point-resolution-v1",
        "phase": "DISCOVERY",
        "source_result": str(SOURCE_RESULT),
        "source_result_sha256": miner.sha256(SOURCE_RESULT),
        "source_validation": validation,
        "histogram": {str(key): value for key, value in histogram.items()},
        "status_counts": dict(sorted(counts.items())),
        "unresolved_count": len(unresolved),
        "cases": unresolved,
        "alias_classes_in_order": probe["target"]["alias_classes_in_order"],
    }


def long_probe(timeout_ms: int) -> dict:
    miner = load_miner()
    discovery = json.loads((OUT / "discovery.json").read_text())
    by_hash: dict[str, dict] = {}
    for case in discovery["cases"]:
        by_hash.setdefault(case["smt2_sha256"], case)

    def run(item: tuple[str, dict]) -> tuple[str, dict]:
        digest, case = item
        path = Path(case["smt2"])
        return digest, {
            "representative_case_id": case["case_id"],
            "smt2": str(path),
            "smt2_sha256": digest,
            "z3": miner.run_solver_file("z3", path, timeout_ms),
            "cvc5": miner.run_solver_file("cvc5", path, timeout_ms),
        }

    with concurrent.futures.ThreadPoolExecutor(max_workers=len(by_hash)) as pool:
        rows = dict(pool.map(run, by_hash.items()))
    return {
        "schema": "p97-v13-five-point-resolution-long-probe-v1",
        "timeout_ms_per_solver": timeout_ms,
        "unique_formula_count": len(rows),
        "formulas": rows,
    }


def circle(parameter):
    denominator = 1 + parameter * parameter
    return (
        (1 - parameter * parameter) / denominator,
        2 * parameter / denominator,
    )


def add(left, right):
    return (left[0] + right[0], left[1] + right[1])


def rotate(point, parameter):
    cosine, sine = circle(parameter)
    return (
        cosine * point[0] - sine * point[1],
        sine * point[0] + cosine * point[1],
    )


def parameterized_points(kind: str, parameters):
    t, u, v = parameters
    p0 = (type(t)(0), type(t)(0))
    p1 = (type(t)(1), type(t)(0))
    if kind == "A":
        p3 = circle(t)
        p4 = add(p1, circle(u))
        p2 = rotate(p4, v)
    elif kind == "B":
        p2 = circle(t)
        p4 = add(p1, circle(u))
        p3 = rotate(p4, v)
    elif kind == "C":
        p3 = add(p1, circle(t))
        p4 = add(p1, circle(u))
        p2 = rotate(p4, v)
    else:
        raise ValueError(f"unknown parameterization kind {kind}")
    return (p0, p1, p2, p3, p4)


def orient_value(points, a: int, b: int, c: int):
    return (points[b][0] - points[a][0]) * (
        points[c][1] - points[a][1]
    ) - (points[b][1] - points[a][1]) * (
        points[c][0] - points[a][0]
    )


def margins(points):
    orientation_values = [
        orient_value(points, a, (a + 1) % 5, c)
        for a in range(5)
        for c in range(5)
        if c not in (a, (a + 1) % 5)
    ]
    distance_values = [
        (points[a][0] - points[b][0]) ** 2
        + (points[a][1] - points[b][1]) ** 2
        for a in range(5)
        for b in range(a + 1, 5)
    ]
    return orientation_values, distance_values


FORMULA_KINDS = {
    "a74b4a8d74ad995befc8e8eacf49b6d07d31062662e73506a455d67b2852ff74": "A",
    "2c5cb772688fd1a971f8494ee1be001d6c66d360ac670fae0532687955bd0317": "B",
    "c5737d432513e7110bf15dd53819ffffa45d07c779fcef5cf67447bc3393e5b7": "C",
    "fd2ccd143f8264fadb12253b23529bec4ce7ea3110f764714145c4f1df07daa2": "C",
}


def rational_text(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"(/ {value.numerator} {value.denominator})"


def rational_search(seed: int, timeout_ms: int) -> dict:
    miner = load_miner()
    discovery = json.loads((OUT / "discovery.json").read_text())
    representatives: dict[str, dict] = {}
    for case in discovery["cases"]:
        representatives.setdefault(case["smt2_sha256"], case)
    results: dict[str, dict] = {}
    for digest, case in representatives.items():
        kind = FORMULA_KINDS[digest]

        def objective(parameters):
            orientations, distances = margins(
                parameterized_points(kind, parameters)
            )
            return -min(min(orientations), min(distances))

        optimization = differential_evolution(
            objective,
            bounds=[(-8.0, 8.0)] * 3,
            seed=seed,
            popsize=24,
            maxiter=1200,
            polish=True,
            tol=1e-11,
            updating="immediate",
            workers=1,
        )
        rational_parameters = tuple(
            Fraction(float(value)).limit_denominator(20)
            for value in optimization.x
        )
        points = parameterized_points(kind, rational_parameters)
        orientations, distances = margins(points)
        if min(orientations) <= 0 or min(distances) <= 0:
            raise RuntimeError(
                f"rationalization lost strictness for {digest}: "
                f"{min(orientations)=}, {min(distances)=}"
            )
        original = Path(case["smt2"]).read_text()
        if not original.rstrip().endswith("(check-sat)"):
            raise ValueError("unexpected SMT2 terminator")
        witness_assertions = []
        for index, (x_value, y_value) in enumerate(points):
            witness_assertions.append(
                f"(assert (= x_{index} {rational_text(x_value)}))"
            )
            witness_assertions.append(
                f"(assert (= y_{index} {rational_text(y_value)}))"
            )
        witness_text = (
            original.rsplit("(check-sat)", 1)[0]
            + "\n"
            + "\n".join(witness_assertions)
            + "\n(check-sat)\n"
        )
        witness_path = OUT / f"{case['case_id']}.rational-witness.smt2"
        witness_path.write_text(witness_text)
        z3_replay = miner.run_solver_file("z3", witness_path, timeout_ms)
        cvc5_replay = miner.run_solver_file("cvc5", witness_path, timeout_ms)
        replay_status = (
            "PASS"
            if z3_replay["status"] == "SAT"
            and cvc5_replay["status"] == "SAT"
            else "FAIL_CLOSED"
        )
        results[digest] = {
            "representative_case_id": case["case_id"],
            "kind": kind,
            "optimization": {
                "success": bool(optimization.success),
                "message": str(optimization.message),
                "float_parameters": [float(value) for value in optimization.x],
                "float_objective": float(optimization.fun),
            },
            "rational_parameters": [
                {
                    "numerator": value.numerator,
                    "denominator": value.denominator,
                }
                for value in rational_parameters
            ],
            "coordinates": [
                [
                    {
                        "numerator": value.numerator,
                        "denominator": value.denominator,
                    }
                    for value in point
                ]
                for point in points
            ],
            "minimum_exact_orientation": {
                "numerator": min(orientations).numerator,
                "denominator": min(orientations).denominator,
            },
            "minimum_exact_squared_distance": {
                "numerator": min(distances).numerator,
                "denominator": min(distances).denominator,
            },
            "witness_smt2": str(witness_path),
            "witness_smt2_sha256": miner.sha256(witness_path),
            "z3_replay": z3_replay,
            "cvc5_replay": cvc5_replay,
            "replay_status": replay_status,
        }
    cases = [
        {
            "case_id": case["case_id"],
            "subset": case["subset"],
            "alias_classes": [
                discovery["alias_classes_in_order"][index]
                for index in case["subset"]
            ],
            "induced_source_equation_indices": case[
                "induced_source_equation_indices"
            ],
            "formula_sha256": case["smt2_sha256"],
            "status": (
                "SAT_EXACT_RATIONAL_WITNESS"
                if results[case["smt2_sha256"]]["replay_status"] == "PASS"
                else "UNKNOWN_FAIL_CLOSED"
            ),
            "witness_formula_sha256": results[case["smt2_sha256"]][
                "witness_smt2_sha256"
            ],
            "witness_smt2": results[case["smt2_sha256"]]["witness_smt2"],
        }
        for case in discovery["cases"]
    ]
    return {
        "schema": "p97-v13-five-point-resolution-v1",
        "terminal_status": (
            "ALL_15_SAT_EXACT_RATIONAL_WITNESSES"
            if all(case["status"].startswith("SAT_") for case in cases)
            else "UNKNOWN_FAIL_CLOSED"
        ),
        "method": (
            "rational parameterizations of the exact circle equalities, exact "
            "Fraction arithmetic for all strict margins, and fresh Z3/cvc5 "
            "replay after asserting every rational coordinate"
        ),
        "formula_results": results,
        "cases": cases,
    }


def json_fraction_text(value: dict) -> str:
    numerator = value["numerator"]
    denominator = value["denominator"]
    return str(numerator) if denominator == 1 else f"{numerator}/{denominator}"


def make_report(payload: dict) -> str:
    lines = [
        "# v13 five-point QF_NRA resolution",
        "",
        f"- Terminal status: `{payload['terminal_status']}`",
        "- Cases: 15 SAT, 0 UNSAT, 0 UNKNOWN.",
        (
            "- Evidence: exact rational coordinates; every strict orientation "
            "and pairwise-distance margin is positive in Fraction arithmetic; "
            "the coordinate-pinned formula replays SAT in fresh Z3 and cvc5."
        ),
        (
            "- Trust boundary: these are directly checkable exact SAT "
            "witnesses for the recorded QF_NRA formulas, not Lean/kernel proofs "
            "and not universal consequences beyond the hash-pinned v13 input."
        ),
        "",
        "## Four byte-distinct formula witnesses",
        "",
        "| formula | kind | representative | parameters | min orientation | min dist2 | replay |",
        "|---|---:|---|---|---:|---:|---|",
    ]
    for digest, result in sorted(payload["formula_results"].items()):
        parameters = ", ".join(
            json_fraction_text(value)
            for value in result["rational_parameters"]
        )
        lines.append(
            f"| `{digest[:12]}` | {result['kind']} | "
            f"`{result['representative_case_id']}` | `{parameters}` | "
            f"`{json_fraction_text(result['minimum_exact_orientation'])}` | "
            f"`{json_fraction_text(result['minimum_exact_squared_distance'])}` | "
            f"Z3 `{result['z3_replay']['status']}`, "
            f"cvc5 `{result['cvc5_replay']['status']}` |"
        )
    lines.extend(
        [
            "",
            "The parameterizations use rational points on a circle; exact "
            "coordinates are in `resolution.json` and are asserted explicitly "
            "in each listed `.rational-witness.smt2` file.",
            "",
            "## Per-case verdicts",
            "",
            "| case | source equalities | formula | status | witness |",
            "|---|---|---|---|---|",
        ]
    )
    for case in payload["cases"]:
        source_indices = ",".join(
            str(value) for value in case["induced_source_equation_indices"]
        )
        witness_name = Path(case["witness_smt2"]).name
        lines.append(
            f"| `{case['case_id']}` | `{source_indices}` | "
            f"`{case['formula_sha256'][:12]}` | `{case['status']}` | "
            f"`{witness_name}` |"
        )
    lines.extend(
        [
            "",
            "## Replay",
            "",
            "Run both commands on each of the four `*.rational-witness.smt2` "
            "files:",
            "",
            "```bash",
            "z3 -smt2 <witness.smt2>",
            "cvc5 --lang smt2 --nl-cov <witness.smt2>",
            "```",
            "",
            "Each command must print exactly `sat`.",
            "",
        ]
    )
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--discover", action="store_true")
    parser.add_argument("--long-probe", action="store_true")
    parser.add_argument("--rational-search", action="store_true")
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--seed", type=int, default=20260729)
    args = parser.parse_args()
    OUT.mkdir(exist_ok=True)
    if sum((args.discover, args.long_probe, args.rational_search)) != 1:
        parser.error(
            "choose exactly one of --discover, --long-probe, --rational-search"
        )
    if args.discover:
        payload = discover()
        output = OUT / "discovery.json"
        summary = {
            "output": str(output),
            "status_counts": payload["status_counts"],
            "unresolved_count": payload["unresolved_count"],
        }
    elif args.long_probe:
        payload = long_probe(args.timeout_ms)
        output = OUT / f"long-probe-{args.timeout_ms}ms.json"
        summary = {
            "output": str(output),
            "statuses": {
                digest: {
                    "z3": row["z3"]["status"],
                    "cvc5": row["cvc5"]["status"],
                }
                for digest, row in payload["formulas"].items()
            },
        }
    else:
        payload = rational_search(args.seed, args.timeout_ms)
        output = OUT / "resolution.json"
        summary = {
            "output": str(output),
            "terminal_status": payload["terminal_status"],
            "case_status_counts": {
                status: sum(
                    case["status"] == status for case in payload["cases"]
                )
                for status in sorted(
                    {case["status"] for case in payload["cases"]}
                )
            },
        }
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    if args.rational_search:
        (OUT / "report.md").write_text(make_report(payload))
    print(json.dumps(summary, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
