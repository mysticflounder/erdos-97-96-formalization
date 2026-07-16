#!/usr/bin/env python3
"""Retry shard 21 of the current-bank/cap-bound refresh at one million nodes."""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import refresh  # noqa: E402


SOURCE = HERE / "selected_row_own_cap_bound_refresh_checkpoint.json"
OUTPUT = HERE / "selected_row_own_cap_bound_refresh_1m_retry_checkpoint.json"
EXPECTED_SOURCE_SHA256 = (
    "3648bc9408b9557cc6a1adb10cfd21a7bf75bdf4d5ac2489d417b68b07412b74"
)
SHARD_INDEX = 21
MAX_NODES = 1_000_000


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def aggregate_status(cases: list[dict]) -> tuple[str, Counter[str]]:
    statuses = Counter(
        str(case["solver"]["raw_status"])
        for case in cases
        if "error" not in case
    )
    if statuses == Counter({"UNSAT": len(cases)}):
        return "UNSAT_FIXED_PLACEMENT_FINITE_SHADOW", statuses
    if statuses["SAT"]:
        return "SAT_FINITE_SHADOW_ONLY", statuses
    return "INDETERMINATE", statuses


def retry(source: dict, source_digest: str) -> dict:
    if source["schema"] != refresh.SCHEMA:
        raise ValueError("unexpected 100k refresh schema")
    for relative, expected in source["input_file_sha256"].items():
        actual = sha256(ROOT / relative)
        if actual != expected:
            raise ValueError(
                f"input drift at {relative}: expected {expected}, got {actual}"
            )
    partition = source["partition"]
    result = refresh.run_shard(
        shard_index=SHARD_INDEX,
        shard_count=int(partition["shard_count"]),
        max_nodes=MAX_NODES,
        shard_row=str(partition["row"]),
    )
    if "error" in result:
        raise RuntimeError(result["error"])
    replacement = refresh.minimal_case(result)
    if refresh.survivor_detection(replacement) is not None:
        raise AssertionError("high-budget survivor violates the current bank")

    cases = [dict(case) for case in source["cases"]]
    cases[SHARD_INDEX] = replacement
    if any(
        int(case["partition"]["shard_index"]) != index
        for index, case in enumerate(cases)
    ):
        raise ValueError("source cases are not in shard-index order")
    status, statuses = aggregate_status(cases)
    output = {
        **source,
        "aggregate_status": status,
        "high_budget_retry": {
            "source_checkpoint": str(SOURCE.relative_to(ROOT)),
            "source_checkpoint_sha256": source_digest,
            "driver": str(Path(__file__).resolve().relative_to(ROOT)),
            "driver_sha256": sha256(Path(__file__).resolve()),
            "shard_index": SHARD_INDEX,
            "max_nodes": MAX_NODES,
            "raw_status": replacement["solver"]["raw_status"],
            "nodes": replacement["solver"]["nodes"],
            "replay": (
                ".venv/bin/python scratch/atail-force/"
                "biapex-continuation-shadow-audit/retry_shard.py"
            ),
        },
        "solver": {
            **source["solver"],
            "status_counts": dict(sorted(statuses.items())),
            "stored_total_nodes": sum(
                int(case["solver"]["nodes"])
                for case in cases
                if "error" not in case
            ),
            "high_budget_retry_shard": SHARD_INDEX,
            "high_budget_retry_max_nodes": MAX_NODES,
        },
        "cases": cases,
    }
    return output


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=SOURCE)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    args = parser.parse_args()
    raw = args.source.read_bytes()
    digest = hashlib.sha256(raw).hexdigest()
    if digest != EXPECTED_SOURCE_SHA256:
        raise SystemExit(
            f"100k refresh drift: expected {EXPECTED_SOURCE_SHA256}, got {digest}"
        )
    rendered = json.dumps(retry(json.loads(raw), digest), indent=2, sort_keys=True)
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered + "\n")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
