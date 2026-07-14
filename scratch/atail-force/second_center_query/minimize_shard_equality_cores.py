#!/usr/bin/env python3
"""Minimize cross-checked shard row cores at equality granularity in parallel.

The shard oracle checkpoint contains UNIT subsets of whole circle rows.  This
driver feeds a selected retained-row size into the stricter equality minimizer
and preserves the shard provenance.  Each equality deletion still requires an
msolve UNIT proposal followed by an independent Singular UNIT confirmation.

The result remains a fixed-placement, target-unfaithful computational shadow;
it is intended for discovering small theorem motifs, not for claiming closure.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any, Mapping


HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import formalized_core_equality_minimizer as minimizer  # noqa: E402


SCHEMA = "p97-atail-formalized-core-shard-equality-minimization-v1"


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def selected_cases(
    checkpoint: Mapping[str, object], retained_row_count: int
) -> tuple[dict[str, Any], ...]:
    cases: list[dict[str, Any]] = []
    for record in checkpoint["cases"]:
        shard_record = dict(record)
        oracle_record = shard_record.get("metric_oracle")
        if not isinstance(oracle_record, Mapping):
            continue
        deletion = oracle_record.get("bounded_deletion")
        if not isinstance(deletion, Mapping):
            continue
        if int(deletion.get("retained_row_count", -1)) != retained_row_count:
            continue
        if (
            deletion.get("retained_core_crosscheck", {}).get("status")
            != "CROSSCHECKED_UNIT"
        ):
            continue
        rows = deletion.get("retained_rows")
        if not isinstance(rows, list):
            continue
        cases.append(
            {
                "shard_index": int(shard_record["shard_index"]),
                "n": 12,
                "source_witness_sha256": oracle_record["source_witness_sha256"],
                "rows": rows,
                "input_row_deletion_complete": bool(deletion.get("complete")),
                "input_row_irredundant": bool(
                    deletion.get("confirmed_row_irredundant")
                ),
                "input_rows_sha256": canonical_sha256(rows),
            }
        )
    return tuple(sorted(cases, key=lambda case: case["shard_index"]))


def run_case(case: Mapping[str, object]) -> dict[str, Any]:
    return {
        "shard_index": case["shard_index"],
        "source_witness_sha256": case["source_witness_sha256"],
        "input_rows": case["rows"],
        "input_rows_sha256": case["input_rows_sha256"],
        "input_row_deletion_complete": case["input_row_deletion_complete"],
        "input_row_irredundant": case["input_row_irredundant"],
        "minimization": minimizer.minimize(case),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("checkpoint", type=Path)
    parser.add_argument("--retained-row-count", type=int, default=6)
    parser.add_argument("--workers", type=int, default=9)
    parser.add_argument("--call-timeout-seconds", type=float, default=12.0)
    parser.add_argument("--wall-budget-seconds", type=float, default=240.0)
    parser.add_argument(
        "--output",
        type=Path,
        help="atomically write the checkpoint here instead of stdout",
    )
    args = parser.parse_args()

    if args.workers < 1:
        parser.error("--workers must be positive")
    if args.call_timeout_seconds <= 0 or args.wall_budget_seconds <= 0:
        parser.error("timeout and wall budget must be positive")

    minimizer.CALL_TIMEOUT_S = args.call_timeout_seconds
    minimizer.WALL_BUDGET_S = args.wall_budget_seconds
    raw = args.checkpoint.read_bytes()
    checkpoint = json.loads(raw)
    cases = selected_cases(checkpoint, args.retained_row_count)
    if not cases:
        parser.error("checkpoint has no matching cross-checked UNIT row cores")

    results: list[dict[str, Any]] = []
    with ThreadPoolExecutor(max_workers=min(args.workers, len(cases))) as executor:
        future_cases = {executor.submit(run_case, case): case for case in cases}
        for future in as_completed(future_cases):
            case = future_cases[future]
            try:
                result = future.result()
            except Exception as error:  # fail closed and preserve the shard
                result = {
                    "shard_index": case["shard_index"],
                    "source_witness_sha256": case["source_witness_sha256"],
                    "input_rows": case["rows"],
                    "input_rows_sha256": case["input_rows_sha256"],
                    "status": "UNDECIDED_DRIVER_EXCEPTION",
                    "detail": f"{type(error).__name__}: {error}",
                }
            results.append(result)
            minimization = result.get("minimization", {})
            print(
                "shard"
                f" {case['shard_index']}: {minimization.get('status', result.get('status'))}"
                f" retained={minimization.get('retained_equality_count', '?')}",
                file=sys.stderr,
                flush=True,
            )

    results.sort(key=lambda result: int(result["shard_index"]))
    statuses = {
        str(result.get("minimization", {}).get("status", result.get("status")))
        for result in results
    }
    document = {
        "schema": SCHEMA,
        "scope": {
            "target_faithful": False,
            "fixed_placement_only": True,
            "card_11_included": False,
            "formalized_metric_core_bank_clean": True,
            "trusted_exact_cas_computation": True,
            "nullstellensatz_certificate_replayed": False,
            "producer_proved": False,
        },
        "source_checkpoint": str(args.checkpoint),
        "source_checkpoint_sha256": hashlib.sha256(raw).hexdigest(),
        "selection": {
            "retained_row_count": args.retained_row_count,
            "case_count": len(cases),
        },
        "configuration": {
            "workers": min(args.workers, len(cases)),
            "call_timeout_seconds": args.call_timeout_seconds,
            "wall_budget_seconds_per_case": args.wall_budget_seconds,
        },
        "aggregate_status": (
            "ALL_CROSSCHECKED_UNIT_EQUALITY_SUBSYSTEMS"
            if statuses == {"CROSSCHECKED_UNIT_EQUALITY_SUBSYSTEM"}
            else "PARTIAL_OR_UNDECIDED"
        ),
        "cases": results,
    }
    rendered = json.dumps(document, indent=2, sort_keys=True)
    if args.output is None:
        print(rendered)
    else:
        temporary = args.output.with_suffix(args.output.suffix + ".tmp")
        temporary.write_text(rendered + "\n")
        temporary.replace(args.output)
        print(f"wrote {args.output}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
