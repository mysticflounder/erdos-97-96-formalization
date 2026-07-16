#!/usr/bin/env python3
"""Replay and bank confirmed UNIT frontiers from two deletion orders.

An immutable seed preserves the forward-order smallest confirmed UNIT subset
per clean survivor, while the reverse-order MARCO checkpoint retains the
corresponding reverse candidates.  This driver unions those candidates,
deduplicates equal row sets, and independently replays every candidate with
both msolve variable orders plus a bounded Singular char-0 portfolio (forward
declaration first, then reverse).
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
FORWARD_SEED = HERE / "forward_frontier_seed.json"
REVERSE_CHECKPOINT = HERE / "checkpoint.json"
OUTPUT = HERE / "frontier_checkpoint.json"
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import mine  # noqa: E402
from census.atail_force import producer_bank  # noqa: E402
from census.global_confinement.metric_realizability_probe import MetricRow  # noqa: E402


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def row_from_record(record: Mapping[str, object]) -> MetricRow:
    return MetricRow(
        int(record["center"]),
        tuple(int(point) for point in record["support"]),
        bool(record.get("exact", True)),
    )


def replay_unit(rows: Sequence[MetricRow], timeout_s: float) -> dict[str, Any]:
    variables = tuple(str(value) for value in mine.metric_oracle.variable_symbols(12))
    polynomials = mine.metric_oracle.serialized_system(12, rows)
    msolve_forward = mine.metric_oracle.run_msolve(
        variables, polynomials, timeout_s=timeout_s
    )
    msolve_reverse = mine.metric_oracle.run_msolve(
        tuple(reversed(variables)), polynomials, timeout_s=timeout_s
    )
    singular_forward = mine.metric_oracle.run_singular(
        variables, polynomials, timeout_s=timeout_s
    )
    singular_reverse = None
    singular_used = "slimgb-forward-variable-order"
    if singular_forward.verdict != "UNIT":
        singular_reverse = mine.metric_oracle.run_singular(
            tuple(reversed(variables)), polynomials, timeout_s=timeout_s
        )
        singular_used = "slimgb-reverse-variable-order"
        singular = singular_reverse
    else:
        singular = singular_forward
    verdicts = (
        singular.verdict,
        msolve_forward.verdict,
        msolve_reverse.verdict,
    )
    if verdicts != ("UNIT", "UNIT", "UNIT"):
        raise RuntimeError(f"frontier replay did not cross-check UNIT: {verdicts}")
    return {
        "status": "CROSSCHECKED_UNIT",
        "singular_algorithm_used": singular_used,
        "singular_forward": mine.result_summary(singular_forward),
        "singular_reverse": (
            mine.result_summary(singular_reverse)
            if singular_reverse is not None
            else {"verdict": "NOT_RUN_FORWARD_SUCCEEDED"}
        ),
        "msolve_forward": mine.result_summary(msolve_forward),
        "msolve_reverse": mine.result_summary(msolve_reverse),
        "expanded_polynomial_count": len(polynomials),
        "expanded_polynomial_sha256": mine.canonical_sha256(list(polynomials)),
    }


def build_document(timeout_s: float) -> dict[str, Any]:
    forward = json.loads(FORWARD_SEED.read_text(encoding="utf-8"))
    reverse = json.loads(REVERSE_CHECKPOINT.read_text(encoding="utf-8"))
    if forward["schema"] != "p97-atail-fresh-continuation-forward-frontier-seed-v1":
        raise RuntimeError("unexpected forward seed schema")
    if forward["provenance"]["fresh_shadow_sha256"] != mine.SOURCE_SHA256:
        raise RuntimeError("forward seed does not name the pinned fresh shadow")
    if reverse["schema"] != "p97-atail-fresh-continuation-marco-v1":
        raise RuntimeError("unexpected reverse checkpoint schema")

    candidates: dict[tuple[int, tuple[str, ...]], dict[str, Any]] = {}
    reverse_cases = {int(case["shard_index"]): case for case in reverse["cases"]}
    for record in forward["candidates"]:
        shard = int(record["shard_index"])
        universe = {
            mine.row_key(row_from_record(row)): row_from_record(row)
            for row in reverse_cases[shard]["rows"]
        }
        keys = tuple(str(value) for value in record["row_keys"])
        if any(key not in universe for key in keys):
            raise RuntimeError(f"forward seed row missing from shard {shard}")
        rows = tuple(universe[key] for key in keys)
        candidates[(shard, keys)] = {
            "shard_index": shard,
            "row_keys": keys,
            "rows": rows,
            "discovered_by": ["forward-deletion-order"],
        }

    for shard, case in reverse_cases.items():
        if not case["current_formalized_bank_clean"]:
            continue
        unit_records = [
            record
            for record in case["oracle_records"]
            if record["status"] == "CROSSCHECKED_UNIT"
        ]
        chosen = min(unit_records, key=lambda record: (record["row_count"], record["rows"]))
        universe = {
            mine.row_key(row_from_record(record)): row_from_record(record)
            for record in case["rows"]
        }
        keys = tuple(chosen["rows"])
        key = (shard, keys)
        if key in candidates:
            candidates[key]["discovered_by"].append("reverse-deletion-order")
        else:
            candidates[key] = {
                "shard_index": shard,
                "row_keys": keys,
                "rows": tuple(universe[value] for value in keys),
                "discovered_by": ["reverse-deletion-order"],
            }

    output = []
    for candidate in sorted(
        candidates.values(),
        key=lambda item: (item["shard_index"], len(item["rows"]), item["row_keys"]),
    ):
        shard = candidate["shard_index"]
        case = reverse_cases[shard]
        rows = candidate["rows"]
        order = tuple(int(value) for value in case["cyclic_order"])
        matches = producer_bank.scan_all_formalized_cores(rows, 12, order)
        centers = {row.center for row in rows}
        coverage = []
        for grid_index, grid in enumerate(case["strict_pair_grids"]):
            named = set(int(value) for value in grid["named_centers"])
            coverage.append(
                {
                    "grid_index": grid_index,
                    "frontier_centers_inside_named_six": centers <= named,
                    "named_center_rows_used": sorted(centers & named),
                    "unnamed_center_rows_used": sorted(centers - named),
                }
            )
        output.append(
            {
                "shard_index": shard,
                "discovered_by": candidate["discovered_by"],
                "row_keys": list(candidate["row_keys"]),
                "row_count": len(rows),
                "rows": [mine.row_dict(row) for row in rows],
                "minimality_status": "NOT_ESTABLISHED",
                "crosscheck": replay_unit(rows, timeout_s),
                "current_formalized_bank_match_count": len(matches),
                "current_formalized_bank_matches": list(matches),
                "grid_center_coverage": coverage,
                "immediate_k_a_consumer": False,
            }
        )

    return {
        "schema": "p97-atail-fresh-continuation-unit-frontier-bank-v1",
        "sources": {
            "forward_seed": str(FORWARD_SEED.relative_to(ROOT)),
            "forward_seed_sha256": file_sha256(FORWARD_SEED),
            "forward_original_analysis_sha256": forward["provenance"][
                "original_analysis_checkpoint_sha256"
            ],
            "reverse_checkpoint": str(REVERSE_CHECKPOINT.relative_to(ROOT)),
            "reverse_checkpoint_sha256": file_sha256(REVERSE_CHECKPOINT),
            "fresh_shadow_sha256": mine.SOURCE_SHA256,
        },
        "driver_sha256": file_sha256(Path(__file__)),
        "mine_driver_sha256": file_sha256(HERE / "mine.py"),
        "solver_versions": mine.solver_versions(),
        "configuration": {
            "per_solver_timeout_seconds": timeout_s,
            "singular_portfolio": [
                "slimgb-forward-variable-order",
                "slimgb-reverse-variable-order-on-forward-failure",
            ],
            "msolve_orders": ["forward", "reverse"],
        },
        "summary": {
            "confirmed_unit_frontier_count": len(output),
            "shard_count": len({record["shard_index"] for record in output}),
            "frontier_count_by_shard": {
                str(shard): sum(record["shard_index"] == shard for record in output)
                for shard in sorted({record["shard_index"] for record in output})
            },
            "smallest_row_count_by_shard": {
                str(shard): min(
                    record["row_count"]
                    for record in output
                    if record["shard_index"] == shard
                )
                for shard in sorted({record["shard_index"] for record in output})
            },
            "current_formalized_bank_match_count": sum(
                record["current_formalized_bank_match_count"] for record in output
            ),
            "inside_named_six_count": sum(
                any(
                    item["frontier_centers_inside_named_six"]
                    for item in record["grid_center_coverage"]
                )
                for record in output
            ),
            "immediate_k_a_consumer_count": 0,
        },
        "frontiers": output,
        "scope": {
            "every_frontier_crosschecked_unit_in_three_exact_computations": True,
            "deletion_minimality_established": False,
            "fixed_shadow_only": True,
            "uniform_producer_proved": False,
            "lean_theorem_proved": False,
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--per-solver-timeout-seconds", type=float, default=30.0)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    document = build_document(args.per_solver_timeout_seconds)
    if args.check:
        saved = json.loads(OUTPUT.read_text(encoding="utf-8"))
        if document != saved:
            raise AssertionError("UNIT frontier checkpoint drift")
    else:
        OUTPUT.write_text(
            json.dumps(document, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    print(json.dumps(document["summary"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
