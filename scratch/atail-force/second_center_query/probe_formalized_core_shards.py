#!/usr/bin/env python3
"""Run the exact equality oracle on compact bank-clean shard survivors."""

from __future__ import annotations

import argparse
import json
import sys
from collections import Counter
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any, Mapping


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
for path in (str(ROOT), str(ORACLE_DIR)):
    if path not in sys.path:
        sys.path.insert(0, path)

import oracle  # noqa: E402
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
    _formalized_metric_core,
)


SCHEMA = "p97-atail-pair-second-center-formalized-core-shard-oracle-v1"


def _pseudo_case(survivor: Mapping[str, object]) -> dict[str, object]:
    records = [
        {
            "name": f"metric:{index}",
            "center": int(row["center"]),
            "support": [int(point) for point in row["support"]],
            "exact": bool(row["exact"]),
        }
        for index, row in enumerate(survivor["distinct_metric_rows"])
    ]
    return {
        "frame": {"n": int(survivor["frame"]["n"])},
        "profile": list(survivor["profile"]),
        "witness_sha256": str(survivor["witness_sha256"]),
        "rows": records,
    }


def _verdicts(report: Mapping[str, object]) -> dict[str, str]:
    return {
        "status": str(report["status"]),
        "singular_qq": str(report["singular_qq"]["verdict"]),
        "msolve_qq_forward_variables": str(
            report["msolve_qq_forward_variables"]["verdict"]
        ),
        "msolve_qq_reverse_variables": str(
            report["msolve_qq_reverse_variables"]["verdict"]
        ),
    }


def _summary(discovery: Mapping[str, object]) -> dict[str, object]:
    deletion = discovery["bounded_deletion"]
    summary: dict[str, object] = {
        "source_witness_sha256": discovery["source_witness_sha256"],
        "distinct_metric_row_count": discovery["distinct_metric_row_count"],
        "equality_count": discovery["equality_count"],
        "distinct_metric_rows_sha256": discovery["distinct_metric_rows_sha256"],
        "expanded_polynomial_sha256": discovery["expanded_polynomial_sha256"],
        "reported_status": discovery["reported_status"],
        "full_equality_ideal": _verdicts(discovery["full_equality_ideal"]),
    }
    if "retained_rows" in deletion:
        summary["bounded_deletion"] = {
            "strategy": deletion["strategy"],
            "initial_row_count": deletion["initial_row_count"],
            "retained_row_count": deletion["retained_row_count"],
            "retained_equality_count": deletion["retained_equality_count"],
            "complete": deletion["complete"],
            "confirmed_row_irredundant": deletion[
                "confirmed_row_irredundant"
            ],
            "retained_rows": deletion["retained_rows"],
            "retained_rows_sha256": oracle.canonical_sha256(
                deletion["retained_rows"]
            ),
            "attempts_sha256": oracle.canonical_sha256(deletion["attempts"]),
            "retained_core_crosscheck": _verdicts(
                deletion["retained_core_crosscheck"]
            ),
        }
    else:
        summary["bounded_deletion"] = deletion
    return summary


def probe_case(case: Mapping[str, object]) -> dict[str, object]:
    partition = case["partition"]
    survivor = case.get("survivor")
    if survivor is None:
        return {
            "shard_index": partition["shard_index"],
            "status": "NOT_RUN_NO_SURVIVOR",
        }
    n = int(survivor["frame"]["n"])
    order = tuple(int(point) for point in survivor["frame"]["cyclic_order"])
    rows = tuple(
        MetricRow(
            int(row["center"]),
            tuple(int(point) for point in row["support"]),
            bool(row["exact"]),
        )
        for row in survivor["distinct_metric_rows"]
    )
    detection = _formalized_metric_core(rows, n, order)
    if detection is not None:
        raise AssertionError(
            f"shard {partition['shard_index']} survivor contains bank core: {detection}"
        )
    discovery = oracle.discover_case(_pseudo_case(survivor))
    return {
        "shard_index": partition["shard_index"],
        "partition": partition,
        "formalized_metric_core": None,
        "metric_oracle": _summary(discovery),
    }


def document(checkpoint: Mapping[str, object], workers: int) -> dict[str, object]:
    smoke_gates = oracle.smoke_gates()
    results = []
    with ThreadPoolExecutor(max_workers=workers) as executor:
        futures = {
            executor.submit(probe_case, case): int(case["partition"]["shard_index"])
            for case in checkpoint["cases"]
        }
        for future in as_completed(futures):
            result = future.result()
            results.append(result)
            oracle_status = result.get("metric_oracle", {}).get(
                "reported_status", result.get("status", "UNKNOWN")
            )
            print(
                f"shard {futures[future] + 1}/{len(futures)}: {oracle_status}",
                file=sys.stderr,
                flush=True,
            )
    results.sort(key=lambda result: int(result["shard_index"]))
    status_counts = Counter(
        str(result.get("metric_oracle", {}).get("reported_status", result.get("status")))
        for result in results
    )
    core_size_counts = Counter(
        int(result["metric_oracle"]["bounded_deletion"]["retained_row_count"])
        for result in results
        if "retained_row_count" in result.get("metric_oracle", {}).get(
            "bounded_deletion", {}
        )
    )
    return {
        "schema": SCHEMA,
        "source_checkpoint_schema": checkpoint["schema"],
        "source_partition": checkpoint["partition"],
        "scope": {
            "placement_count": 1,
            "card_11_included": False,
            "formalized_metric_core_bank_clean": True,
            "trusted_exact_cas_computation": True,
            "nullstellensatz_certificate_replayed": False,
            "target_faithful": False,
            "producer_proved": False,
        },
        "smoke_gates": smoke_gates,
        "workers": workers,
        "reported_status_counts": dict(sorted(status_counts.items())),
        "retained_row_count_histogram": {
            str(size): count for size, count in sorted(core_size_counts.items())
        },
        "cases": results,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("checkpoint", type=Path)
    parser.add_argument("--workers", type=int, default=16)
    parser.add_argument("--compact-json", action="store_true")
    parser.add_argument(
        "--output",
        type=Path,
        help="atomically write the checkpoint here instead of stdout",
    )
    args = parser.parse_args()
    if not 1 <= args.workers <= 24:
        parser.error("--workers must be between 1 and 24")
    checkpoint = json.loads(args.checkpoint.read_text(encoding="utf-8"))
    result = document(checkpoint, min(args.workers, len(checkpoint["cases"])))
    rendered = json.dumps(
        result,
        indent=None if args.compact_json else 2,
        separators=(",", ":") if args.compact_json else None,
        sort_keys=True,
    )
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
