#!/usr/bin/env python3
"""Authenticated four-valued runner for the 16-case Schema-11 matrix."""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import freshthird_schema11_pinned_seed_probe as probe  # noqa: E402


OUT_DEFAULT = HERE / "artifacts-schema-v11"
CONTRACT = HERE / "schema-v11-contract.md"
SCRIPT = HERE / "freshthird_schema11_pinned_seed_probe.py"
SEMANTIC_DEPENDENCIES = (
    HERE / "freshthird_schema10_direct_negation_probe.py",
    HERE / "freshthird_dynamic_endpoint_deletion_probe.py",
    HERE / "freshthird_schema9_coherent_shared_pair_probe.py",
    HERE / "n17_freshthird_incidence_probe.py",
)


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def case_manifest() -> list[tuple[str, int, str]]:
    return [
        (mapping, arm, query)
        for mapping in ("q1-outside", "q2-outside")
        for arm in (1, 2, 3, 4)
        for query in ("canonical-survives", "other-survives")
    ]


def authenticated_inputs() -> tuple[Path, ...]:
    return (Path(__file__).resolve(), SCRIPT, CONTRACT, *SEMANTIC_DEPENDENCIES)


def case_args(mapping: str, arm: int, query: str, timeout_ms: int):
    return probe._args(
        endpoint_mapping=mapping,
        order_arm=arm,
        query=query,
        timeout_ms=timeout_ms,
    )


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Run exactly the audited 16-case Schema-11 matrix."
    )
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--out-dir", type=Path, default=OUT_DEFAULT)
    args = parser.parse_args()

    check = probe.self_check()
    if check.get("status") != "PASS":
        parser.error("Schema 11 self-check failed; refusing production matrix")

    args.out_dir.mkdir(parents=True, exist_ok=True)
    provenance = {
        "runner_sha256": file_sha256(Path(__file__).resolve()),
        "probe_sha256": file_sha256(SCRIPT),
        "contract_sha256": file_sha256(CONTRACT),
        "semantic_dependency_sha256": {
            path.name: file_sha256(path) for path in SEMANTIC_DEPENDENCIES
        },
        "python_version": sys.version,
        "z3_version": probe.z3.get_version_string(),
    }
    records: list[dict[str, object]] = []
    for mapping, arm, query in case_manifest():
        started = time.monotonic()
        artifact_name = f"schema-v11-{mapping}-arm{arm}-{query}.json"
        record: dict[str, object] = {
            "schema_version": probe.SCHEMA_VERSION,
            "case": {
                "endpoint_mapping": mapping,
                "order_arm": arm,
                "query": query,
            },
            "timeout_ms": args.timeout_ms,
            "artifact": artifact_name,
            **provenance,
        }
        try:
            result = probe.run_one(case_args(mapping, arm, query, args.timeout_ms))
            status = str(result.get("status", "ERROR")).upper()
            if status not in {"SAT", "UNSAT", "UNKNOWN"}:
                status = "ERROR"
            record.update(result)
            record["status"] = status
        except Exception as exc:
            record.update(
                {
                    "status": "ERROR",
                    "error_type": type(exc).__name__,
                    "error": str(exc),
                }
            )
        record["elapsed_seconds"] = round(time.monotonic() - started, 6)
        path = args.out_dir / artifact_name
        path.write_text(json.dumps(record, indent=2, sort_keys=True) + "\n")
        record["artifact_sha256"] = file_sha256(path)
        records.append(record)
        print(
            json.dumps(
                {
                    "artifact": artifact_name,
                    "status": record["status"],
                    "elapsed_seconds": record["elapsed_seconds"],
                },
                sort_keys=True,
            ),
            flush=True,
        )

    status_counts = {
        status: sum(record.get("status") == status for record in records)
        for status in ("SAT", "UNSAT", "UNKNOWN", "ERROR")
    }
    summary = {
        "schema_version": probe.SCHEMA_VERSION,
        "n": 17,
        "case_count": len(records),
        "expected_case_count": 16,
        "matrix_dimensions": {
            "endpoint_mappings": 2,
            "order_arms": 4,
            "deletion_queries": 2,
        },
        "status_counts": status_counts,
        "timeout_ms": args.timeout_ms,
        "self_check": check,
        "artifacts": [
            {
                "name": record["artifact"],
                "sha256": record["artifact_sha256"],
                "status": record["status"],
            }
            for record in records
        ],
        **provenance,
        "trust_boundary": (
            "bounded exact-incidence evidence with proved pinned-seed ingress; "
            "no Euclidean realization, arbitrary-cardinality lift, or Lean closure"
        ),
    }
    summary_path = args.out_dir / "schema-v11-summary.json"
    summary_path.write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "summary": str(summary_path),
                "case_count": len(records),
                "status_counts": status_counts,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
