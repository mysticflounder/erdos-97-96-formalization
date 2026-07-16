#!/usr/bin/env python3
"""Exact fixed-shadow audit for the second-apex joint-fiber terminal.

This is theorem-discovery infrastructure, not a producer proof.  It reads the
pinned, current-bank-clean card-12 continuation-shadow refresh and asks two
separate questions:

* do its selected-row equalities already imply the desired second-apex edge
  equality by transitive closure; and
* are the complete selected-row equality systems algebraically realizable?

Every algebraic verdict is required to agree in Singular over QQ and msolve
in both declared variable orders.  Unknown answers remain unknown.  Compact
core enumeration is intentionally left to the separate MARCO lane.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from itertools import combinations
from pathlib import Path
from types import ModuleType
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE_DIR = HERE.parent / "biapex-continuation-shadow-audit"
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
SOURCE = SOURCE_DIR / (
    "selected_row_own_cap_bound_refresh_1m_retry_checkpoint.json"
)
OUTPUT = HERE / "checkpoint.json"

EXPECTED_SOURCE_SHA256 = (
    "ad2400da59782d38d0952a9c31ae448bd30f86a110239bcca4687b538bc09fe9"
)
SCHEMA = "p97-atail-second-apex-joint-fiber-audit-v1"
PER_SOLVER_TIMEOUT_SECONDS = 6.0
BANK_SCAN_INPUTS = (
    ROOT / "census/atail_force/producer_bank.py",
    ROOT / "census/global_confinement/metric_realizability_probe.py",
    ROOT / "scratch/atail-force/common_system_metric_probe.py",
)

for path in (ROOT, ORACLE_DIR, SOURCE_DIR):
    text = str(path)
    if text not in sys.path:
        sys.path.insert(0, text)

import oracle as metric_oracle  # noqa: E402
from census.atail_force import producer_bank  # noqa: E402
from census.global_confinement import metric_realizability_probe as metric  # noqa: E402


def load_continuation_analysis() -> ModuleType:
    source_path = SOURCE_DIR / "analyze.py"
    spec = importlib.util.spec_from_file_location(
        "p97_biapex_continuation_shadow_analysis", source_path
    )
    if spec is None or spec.loader is None:
        raise ImportError(f"cannot load {source_path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


continuation_analysis = load_continuation_analysis()


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    encoded = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def encode_row(row: metric.MetricRow) -> str:
    return f"{row.center}:" + ",".join(str(point) for point in row.support)


def rows_of(case: Mapping[str, object]) -> tuple[metric.MetricRow, ...]:
    survivor = case["survivor"]
    return tuple(
        metric.MetricRow(
            int(record["center"]),
            tuple(int(point) for point in record["support"]),
            exact=bool(record["exact"]),
        )
        for record in survivor["distinct_metric_rows"]
    )


def crosscheck(rows: Sequence[metric.MetricRow]) -> dict[str, Any]:
    variables = tuple(str(value) for value in metric_oracle.variable_symbols(12))
    polynomials = metric_oracle.serialized_system(12, rows)
    singular = metric_oracle.run_singular(
        variables, polynomials, timeout_s=PER_SOLVER_TIMEOUT_SECONDS
    )
    msolve_forward = metric_oracle.run_msolve(
        variables, polynomials, timeout_s=PER_SOLVER_TIMEOUT_SECONDS
    )
    msolve_reverse = metric_oracle.run_msolve(
        tuple(reversed(variables)),
        polynomials,
        timeout_s=PER_SOLVER_TIMEOUT_SECONDS,
    )
    verdicts = [
        singular.verdict,
        msolve_forward.verdict,
        msolve_reverse.verdict,
    ]
    agreed = len(set(verdicts)) == 1 and verdicts[0] in {"UNIT", "NONUNIT"}
    return {
        "status": f"CROSSCHECKED_{verdicts[0]}" if agreed else "UNKNOWN_FAIL_CLOSED",
        "verdicts_singular_msolve_forward_reverse": verdicts,
        "polynomial_count": len(polynomials),
        "polynomial_sha256": canonical_sha256(list(polynomials)),
    }


def target_closure_records(
    rows: Sequence[metric.MetricRow], first_candidates: Sequence[int]
) -> list[dict[str, Any]]:
    closure = metric._row_equality_closure(12, rows)
    records = []
    for a, b in combinations(first_candidates, 2):
        left = metric._edge(2, a)
        right = metric._edge(2, b)
        records.append(
            {
                "first_strict_pair": [a, b],
                "target_edges": [list(left), list(right)],
                "target_in_transitive_row_equality_closure": (
                    closure.find(left) == closure.find(right)
                ),
            }
        )
    return records


def analyze_sat_case(case: Mapping[str, object]) -> dict[str, Any]:
    shard = int(case["partition"]["shard_index"])
    survivor = case["survivor"]
    rows = rows_of(case)
    if len(rows) != 12 or {row.center for row in rows} != set(range(12)):
        raise AssertionError(f"shard {shard}: expected one exact row per center")
    if not all(row.exact for row in rows):
        raise AssertionError(f"shard {shard}: non-exact row")

    continuation = continuation_analysis.analyze_case(dict(case))
    first_candidates = continuation["first_strict_o1_candidates"]
    closure_records = target_closure_records(rows, first_candidates)
    order = tuple(int(value) for value in survivor["frame"]["cyclic_order"])
    bank_matches = producer_bank.scan_all_formalized_cores(rows, 12, order)
    return {
        "shard_index": shard,
        "witness_sha256": survivor["witness_sha256"],
        "cyclic_order": list(order),
        "metric_rows": [encode_row(row) for row in rows],
        "metric_rows_sha256": canonical_sha256([encode_row(row) for row in rows]),
        "first_strict_candidates": first_candidates,
        "target_closure_records": closure_records,
        "target_equality_closure_hit_count": sum(
            int(item["target_in_transitive_row_equality_closure"])
            for item in closure_records
        ),
        "formalized_bank_match_count": len(bank_matches),
        "formalized_bank_matches": list(bank_matches),
        "full_equality_ideal": crosscheck(rows),
    }


def build_document(*, workers: int) -> dict[str, Any]:
    digest = file_sha256(SOURCE)
    if digest != EXPECTED_SOURCE_SHA256:
        raise AssertionError("pinned continuation-shadow checkpoint hash drift")
    source = json.loads(SOURCE.read_text(encoding="utf-8"))
    sat_cases = [case for case in source["cases"] if case.get("survivor") is not None]
    statuses: dict[str, int] = {}
    for case in source["cases"]:
        status = str(case["solver"]["raw_status"])
        statuses[status] = statuses.get(status, 0) + 1

    results = []
    with ThreadPoolExecutor(max_workers=workers) as executor:
        future_to_shard = {
            executor.submit(analyze_sat_case, case): int(
                case["partition"]["shard_index"]
            )
            for case in sat_cases
        }
        for future in as_completed(future_to_shard):
            results.append(future.result())
    results.sort(key=lambda item: item["shard_index"])

    closure_record_count = sum(len(case["target_closure_records"]) for case in results)
    closure_hit_count = sum(case["target_equality_closure_hit_count"] for case in results)
    full_unit_count = sum(
        case["full_equality_ideal"]["status"] == "CROSSCHECKED_UNIT"
        for case in results
    )
    bank_clean_cases = [
        case for case in results if case["formalized_bank_match_count"] == 0
    ]
    bank_dirty_cases = [
        case for case in results if case["formalized_bank_match_count"] != 0
    ]
    bank_clean_unit_count = sum(
        case["full_equality_ideal"]["status"] == "CROSSCHECKED_UNIT"
        for case in bank_clean_cases
    )
    match_stage_counts: dict[str, int] = {}
    for case in bank_dirty_cases:
        for match in case["formalized_bank_matches"]:
            stage = str(match["stage"])
            match_stage_counts[stage] = match_stage_counts.get(stage, 0) + 1
    return {
        "schema": SCHEMA,
        "status": (
            "CROSSCHECKED_FIXED_SHADOW_ALGEBRAIC_OBSTRUCTION"
            if full_unit_count == len(results)
            else "UNKNOWN_FAIL_CLOSED"
        ),
        "source": {
            "path": str(SOURCE.relative_to(ROOT)),
            "sha256": digest,
            "status_counts": dict(sorted(statuses.items())),
            "sat_survivor_count": len(results),
            "bank_sync_qualification": (
                "cap-bound plus the refresh driver's older matcher subset; "
                "not synchronized against the current complete producer bank"
            ),
        },
        "configuration": {
            "workers": workers,
            "per_solver_timeout_seconds": PER_SOLVER_TIMEOUT_SECONDS,
            "exact_engines": ["Singular_over_QQ", "msolve_forward", "msolve_reverse"],
        },
        "bank_scan_inputs": {
            str(path.relative_to(ROOT)): file_sha256(path)
            for path in BANK_SCAN_INPUTS
        },
        "summary": {
            "target_pair_record_count": closure_record_count,
            "target_equality_transitive_closure_hit_count": closure_hit_count,
            "full_equality_ideal_crosschecked_unit_count": full_unit_count,
            "formalized_bank_match_count": sum(
                case["formalized_bank_match_count"] for case in results
            ),
            "current_bank_dirty_survivor_count": len(results) - len(bank_clean_cases),
            "current_bank_clean_survivor_count": len(bank_clean_cases),
            "current_bank_dirty_shard_ids": [
                case["shard_index"] for case in bank_dirty_cases
            ],
            "current_bank_clean_shard_ids": [
                case["shard_index"] for case in bank_clean_cases
            ],
            "current_bank_match_stage_multiplicities": dict(
                sorted(match_stage_counts.items())
            ),
            "current_bank_clean_full_ideal_crosschecked_unit_count": (
                bank_clean_unit_count
            ),
        },
        "scope": {
            "fixed_label_card_12_single_placement_partition_only": True,
            "node_capped_shards_remain_indeterminate": statuses.get("INDETERMINATE", 0) > 0,
            "unit_ideal_excludes_normalized_complex_and_real_coordinates": True,
            "exact_cas_output_not_independently_certificate_replayed": True,
            "not_a_lean_producer": True,
            "not_uniform_in_carrier_cardinality": True,
            "source_checkpoint_not_current_complete_bank_synchronized": True,
            "unknown_is_fail_closed": True,
        },
        "cases": results,
    }


def strip_runtime_configuration(document: Mapping[str, object]) -> dict[str, Any]:
    result = json.loads(json.dumps(document))
    result["configuration"].pop("workers", None)
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--workers", type=int, default=4)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    document = build_document(workers=args.workers)
    if args.check:
        stored = json.loads(OUTPUT.read_text(encoding="utf-8"))
        if strip_runtime_configuration(stored) != strip_runtime_configuration(document):
            raise AssertionError("joint-fiber audit checkpoint drift")
        print(json.dumps(document["summary"], sort_keys=True))
        return

    OUTPUT.write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(document["summary"], sort_keys=True))


if __name__ == "__main__":
    main()
