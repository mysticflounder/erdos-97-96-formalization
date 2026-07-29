#!/usr/bin/env python3
"""Validate and deletion-test the v15 five-class direct constraint core."""

from __future__ import annotations

import importlib.util
import json
import sys
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
LANE = HERE.parent
MINER_PATH = LANE / "exact_euclidean_subset_core_miner.py"
SOURCE_RESULT = HERE / "exact-4-5.json"
SUBSET = (4, 6, 9, 10, 15)
CORE_NAMES = (
    "orient_0_1_3",
    "orient_0_1_4",
    "orient_1_2_3",
    "orient_2_3_4",
    "orient_3_4_0",
    "eq_source_18",
    "eq_source_19",
    "eq_source_36",
)
GAUGE_NAMES = ("gauge_x_0", "gauge_y_0", "gauge_x_1", "gauge_y_1")


def load_miner() -> Any:
    spec = importlib.util.spec_from_file_location("v15_core_miner", MINER_PATH)
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


def main() -> int:
    miner = load_miner()
    source = json.loads(SOURCE_RESULT.read_text())
    probe, equations, validation = miner.validate_source(source_config(miner, source))
    induced = miner.induced_equations(SUBSET, equations)
    problem = miner.build_problem(SUBSET, induced)
    selected = list(GAUGE_NAMES + CORE_NAMES)
    smt2_path = HERE / "five-q4-6-9-10-15-minimal-direct-core.smt2"
    smt2_path.write_text(miner.direct_smt2(problem, selected))
    normalized_path = HERE / "five-q4-6-9-10-15-normalized-unsat-schema.smt2"
    identities_path = HERE / "five-q4-6-9-10-15-identities.sing"
    identities_output_path = HERE / "five-q4-6-9-10-15-identities.out"
    deletion_trials = []
    for omitted in CORE_NAMES:
        names = [
            name for name in selected
            if name != omitted
        ]
        check = miner.check_direct_records(problem, names, 10_000)
        deletion_trials.append({"omitted": omitted, "check": check})
    payload = {
        "schema": "p97-v15-five-point-direct-core-validation-v1",
        "source_validation": validation,
        "subset": list(SUBSET),
        "aliases": [
            probe["target"]["alias_classes_in_order"][index] for index in SUBSET
        ],
        "selected_record_names": selected,
        "selected_records": [
            problem.record_by_name[name].as_json() for name in selected
        ],
        "smt2": str(smt2_path),
        "smt2_sha256": miner.sha256(smt2_path),
        "direct_z3_replay": miner.run_solver_file("z3", smt2_path, 2_000),
        "direct_cvc5_replay": miner.run_solver_file("cvc5", smt2_path, 2_000),
        "normalized_smt2": str(normalized_path),
        "normalized_smt2_sha256": miner.sha256(normalized_path),
        "normalized_z3_replay": miner.run_solver_file("z3", normalized_path, 30_000),
        "normalized_cvc5_replay": miner.run_solver_file(
            "cvc5", normalized_path, 30_000
        ),
        "singular_identities": str(identities_path),
        "singular_identities_sha256": miner.sha256(identities_path),
        "singular_output": str(identities_output_path),
        "singular_output_sha256": miner.sha256(identities_output_path),
        "deletion_trials": deletion_trials,
    }
    payload["terminal_status"] = (
        "DELETION_MINIMAL_EXACT_NORMALIZED_UNSAT"
        if payload["normalized_z3_replay"]["status"] == "UNSAT"
        and payload["normalized_cvc5_replay"]["status"] == "UNSAT"
        and all(
            trial["check"]["status"] == "SAT"
            and trial["check"].get("model_substitution_status") == "PASS"
            for trial in deletion_trials
        )
        else "UNKNOWN_FAIL_CLOSED"
    )
    output = HERE / "five-minimal-core-validation.json"
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "output": str(output),
        "terminal_status": payload["terminal_status"],
        "direct_z3": payload["direct_z3_replay"]["status"],
        "direct_cvc5": payload["direct_cvc5_replay"]["status"],
        "normalized_z3": payload["normalized_z3_replay"]["status"],
        "normalized_cvc5": payload["normalized_cvc5_replay"]["status"],
        "deletions": {
            trial["omitted"]: trial["check"]["status"]
            for trial in deletion_trials
        },
    }, sort_keys=True))
    return 0 if payload["terminal_status"] == (
        "DELETION_MINIMAL_EXACT_NORMALIZED_UNSAT"
    ) else 2


if __name__ == "__main__":
    raise SystemExit(main())
