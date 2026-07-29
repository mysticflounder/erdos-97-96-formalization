#!/usr/bin/env python3
"""Reproduce and resolve every doubly-UNKNOWN v14 five-class formula."""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
from pathlib import Path
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
LANE = HERE.parent
MINER_PATH = LANE / "exact_euclidean_subset_core_miner.py"
SOURCE_RESULT = HERE / "exact-4-5.json"


def load_miner() -> Any:
    spec = importlib.util.spec_from_file_location("v14_five_miner", MINER_PATH)
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


def exact_z3_model(miner: Any, problem: Any, timeout_ms: int) -> dict[str, Any]:
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms, random_seed=0)
    solver.add(*(record.expression for record in problem.records))
    verdict = solver.check()
    result: dict[str, Any] = {
        "status": str(verdict).upper(),
        "timeout_ms": timeout_ms,
        "fail_closed": True,
    }
    if verdict == z3.sat:
        model = solver.model()
        valid, failures = miner.model_satisfies(model, problem.records)
        result["model_substitution_status"] = "PASS" if valid else "FAIL"
        result["model_substitution_failures"] = failures[:20]
        result["coordinates"] = [
            {
                "local_vertex": index,
                "global_class": problem.subset[index],
                "x_exact_smt2": model.eval(problem.x[index], model_completion=True).sexpr(),
                "y_exact_smt2": model.eval(problem.y[index], model_completion=True).sexpr(),
            }
            for index in range(len(problem.subset))
        ]
        if not valid:
            result["status"] = "ERROR_INVALID_MODEL"
    elif verdict == z3.unknown:
        result["reason_unknown"] = solver.reason_unknown()
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--initial-ms", type=int, default=1000)
    parser.add_argument("--long-ms", type=int, default=30000)
    args = parser.parse_args()
    miner = load_miner()
    source = json.loads(SOURCE_RESULT.read_text())
    probe, equations, validation = miner.validate_source(source_config(miner, source))
    rows, histogram = miner.candidate_rows(5, equations, validation["alias_class_count"])
    counts: dict[str, int] = {}
    cases: list[dict[str, Any]] = []
    for subset, induced in rows:
        if not induced:
            continue
        problem = miner.build_problem(subset, induced)
        names = [record.name for record in problem.records]
        initial_z3 = miner.check_direct_records(problem, names, args.initial_ms)
        counts[initial_z3["status"]] = counts.get(initial_z3["status"], 0) + 1
        if initial_z3["status"] != "UNKNOWN":
            continue
        smt2 = miner.direct_smt2(problem, names)
        initial_cvc5 = miner.run_cvc5_text(smt2, args.initial_ms)
        cvc_key = f"CVC5_{initial_cvc5['status']}"
        counts[cvc_key] = counts.get(cvc_key, 0) + 1
        if initial_cvc5["status"] != "UNKNOWN":
            continue
        case_id = "q" + "-".join(str(value) for value in subset)
        smt_path = HERE / f"five-{case_id}.smt2"
        smt_path.write_text(smt2)
        long_z3 = exact_z3_model(miner, problem, args.long_ms)
        long_cvc5 = miner.run_solver_file("cvc5", smt_path, args.long_ms)
        status = (
            "SAT_EXACT_SUBSTITUTION_AND_CVC5"
            if long_z3["status"] == "SAT"
            and long_z3.get("model_substitution_status") == "PASS"
            and long_cvc5["status"] == "SAT"
            else (
                "UNSAT_Z3_CVC5_REPLAY"
                if long_z3["status"] == "UNSAT" and long_cvc5["status"] == "UNSAT"
                else "UNKNOWN_FAIL_CLOSED"
            )
        )
        cases.append(
            {
                "case_id": case_id,
                "subset": list(subset),
                "aliases": [probe["target"]["alias_classes_in_order"][i] for i in subset],
                "induced_source_equation_indices": [
                    equation.source_index for equation in induced
                ],
                "smt2": str(smt_path),
                "smt2_sha256": miner.sha256(smt_path),
                "initial_z3": initial_z3,
                "initial_cvc5": initial_cvc5,
                "long_z3": long_z3,
                "long_cvc5": long_cvc5,
                "terminal_status": status,
            }
        )
    payload = {
        "schema": "p97-v14-five-point-resolution-v1",
        "source_result": str(SOURCE_RESULT),
        "source_result_sha256": miner.sha256(SOURCE_RESULT),
        "source_validation": validation,
        "histogram": {str(key): value for key, value in histogram.items()},
        "initial_status_counts": dict(sorted(counts.items())),
        "doubly_unknown_initial_count": len(cases),
        "cases": cases,
        "terminal_status_counts": {
            status: sum(case["terminal_status"] == status for case in cases)
            for status in sorted({case["terminal_status"] for case in cases})
        },
    }
    output = HERE / "five-resolution.json"
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(output),
                "doubly_unknown_initial_count": len(cases),
                "terminal_status_counts": payload["terminal_status_counts"],
            },
            sort_keys=True,
        )
    )
    return 0 if all(case["terminal_status"] != "UNKNOWN_FAIL_CLOSED" for case in cases) else 2


if __name__ == "__main__":
    raise SystemExit(main())
