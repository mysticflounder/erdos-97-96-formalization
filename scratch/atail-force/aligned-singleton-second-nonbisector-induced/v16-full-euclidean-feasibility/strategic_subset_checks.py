#!/usr/bin/env python3
"""Exact QF_NRA checks for selected induced subsystems of the frozen v16 survivor."""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
import time
from pathlib import Path


HERE = Path(__file__).resolve().parent
PARENT = HERE.parent
MINER = PARENT / "exact_euclidean_subset_core_miner.py"
SYSTEM = HERE / "positive-system.json"


def load_miner():
    spec = importlib.util.spec_from_file_location("exact_subset_miner", MINER)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {MINER}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def parse_subset(text: str) -> tuple[int, ...]:
    result = tuple(sorted({int(part) for part in text.split(",")}))
    if len(result) < 3:
        raise argparse.ArgumentTypeError("subset needs at least three vertices")
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--subset", type=parse_subset, required=True)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--label", required=True)
    args = parser.parse_args()

    miner = load_miner()
    raw = json.loads(SYSTEM.read_text())
    equations = miner.normalize_equations(
        raw["equations"],
        expected_class_count=19,
        expected_equation_count=38,
    )
    induced = miner.induced_equations(args.subset, equations)
    problem = miner.build_problem(args.subset, induced)
    record_names = [record.name for record in problem.records]
    smt2 = miner.direct_smt2(problem, record_names)
    smt2_path = HERE / f"{args.label}.smt2"
    smt2_path.write_text(smt2)

    started = time.monotonic()
    z3_result = miner.check_tracked(problem, args.timeout_ms)
    cvc5_result = miner.run_cvc5_text(smt2, args.timeout_ms)
    result = {
        "schema": "v16-strategic-subset-check-v1",
        "epistemic_status": (
            "VALIDATED_UNSAT"
            if z3_result["status"] == cvc5_result["status"] == "UNSAT"
            else "EXACT_SAT"
            if z3_result["status"] == "SAT"
            and z3_result.get("model_substitution_status") == "PASS"
            else "UNKNOWN_FAIL_CLOSED"
        ),
        "subset": list(args.subset),
        "induced_equations": [equation.as_json() for equation in induced],
        "constraint_counts": problem.counts(),
        "z3": z3_result,
        "cvc5": cvc5_result,
        "elapsed_seconds": time.monotonic() - started,
        "smt2": str(smt2_path),
        "trust_scope": (
            "QF_NRA solver classification only; not CEGAR or Lean closure. "
            "UNSAT requires agreement of Z3 and cvc5. SAT requires exact model "
            "substitution and still witnesses only this induced subsystem."
        ),
    }
    output_path = HERE / f"{args.label}.json"
    output_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(output_path),
                "subset": result["subset"],
                "equation_count": len(induced),
                "z3": z3_result["status"],
                "cvc5": cvc5_result["status"],
                "epistemic_status": result["epistemic_status"],
                "elapsed_seconds": result["elapsed_seconds"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
