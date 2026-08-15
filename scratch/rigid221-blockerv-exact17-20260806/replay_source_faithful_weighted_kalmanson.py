#!/usr/bin/env python3
"""Replay source-faithful exact-17 cores through the weighted Lean consumer.

The tracked-support miner records a minimal exact linear contradiction for
each theorem-bank miss.  This script computes positive integer cancellation
weights, then asks the production certificate bank to reconstruct every
distance equality and check the cancellation exactly.  The cyclic order is
read from each source-faithful audit record; it is never hard-coded.

This authenticates a cardinality-generic metric nogood.  It does not prove
finite exact-17 coverage or the source-to-finite ingress theorem.
"""

from __future__ import annotations

import argparse
import glob
import hashlib
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
sys.path.insert(0, str(REPO))
sys.path.insert(0, str(HERE))

from census.atail_force import producer_bank  # noqa: E402
from classify_unmatched_linear_supports import classify  # noqa: E402
from replay_weighted_kalmanson_consumer import term_from_atom  # noqa: E402


SCHEMA = "p97-rigid221-exact17-source-faithful-weighted-kalmanson-replay-v1"
AUDIT_SCHEMA = "p97-rigid221-exact17-source-faithful-core-bank-audit-v1"


def sha256(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def canonical_sha256(value: Any) -> str:
    raw = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return sha256(raw)


def file_evidence(path: Path) -> dict[str, Any]:
    raw = path.read_bytes()
    return {"path": str(path), "sha256": sha256(raw), "bytes": len(raw)}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--supports", action="append", type=Path)
    parser.add_argument("--supports-glob", action="append")
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    support_paths = sorted(
        {
            *(args.supports or []),
            *(
                Path(path)
                for pattern in (args.supports_glob or [])
                for path in glob.glob(pattern)
            ),
        }
    )
    if not support_paths:
        parser.error("at least one --supports or --supports-glob is required")
    support_inputs = [file_evidence(path) for path in support_paths]
    audit_cache: dict[Path, tuple[dict[str, Any], dict[str, Any]]] = {}
    results: list[dict[str, Any]] = []
    status_counts: Counter[str] = Counter()
    input_records = 0

    for supports_path in support_paths:
        supports = json.loads(supports_path.read_bytes())
        input_records += len(supports["results"])
        for support in supports["results"]:
            if support.get("status") != "unsat":
                status_counts[f"support-{support.get('status')}"] += 1
                continue

            audit_path = Path(support["journal"])
            if not audit_path.is_absolute():
                audit_path = REPO / audit_path
            if audit_path not in audit_cache:
                raw = audit_path.read_bytes()
                audit = json.loads(raw)
                if audit.get("schema") != AUDIT_SCHEMA:
                    raise ValueError(f"unsupported audit schema: {audit_path}")
                audit_cache[audit_path] = (
                    audit,
                    {
                        "path": str(audit_path),
                        "sha256": sha256(raw),
                        "bytes": len(raw),
                    },
                )
            audit = audit_cache[audit_path][0]
            index = int(support["iteration"])
            record = audit["records"][index]
            preexisting_bank_hit = bool(record.get("hits"))

            classification = classify(support)
            if not classification["pure_kalmanson"]:
                status_counts["non-kalmanson"] += 1
                continue
            if not classification["positive_rational_cancellation"]:
                status_counts["no-positive-cancellation"] += 1
                continue
            weights = classification["weights"]
            if weights is None:
                raise AssertionError("positive cancellation without weights")
            inequalities = [atom for atom in support["atoms"] if atom[0] != "eq"]
            if len(inequalities) != len(weights):
                raise ValueError(f"weight mismatch: {audit_path}:{index}")
            terms = [
                term_from_atom(atom, support["used_points"], int(weight))
                for atom, weight in zip(inequalities, weights, strict=True)
            ]
            rows = tuple(
                producer_bank.MetricRow(
                    int(row["center"]),
                    tuple(int(point) for point in row["support"]),
                    exact=bool(row.get("exact", False)),
                )
                for row in record["rows"]
            )
            order = tuple(int(point) for point in record["order"])
            certificate = producer_bank.certify_weighted_kalmanson_cancellation(
                rows, 17, order, terms
            )
            status_counts["certified"] += 1
            results.append(
                {
                    "audit": str(audit_path),
                    "record_index": index,
                    "record_sha256": canonical_sha256(record),
                    "support_sha256": canonical_sha256(support),
                    "order": list(order),
                    "rows": record["rows"],
                    "unit_cancellation": classification["unit_cancellation"],
                    "weights": weights,
                    "terms": terms,
                    "certificate": certificate,
                    "preexisting_bank_hit": preexisting_bank_hit,
                }
            )

    producer_source = Path(producer_bank.__file__).resolve()
    lean_source = REPO / (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "GenericRowNogoodCertificate.lean"
    )
    payload = {
        "schema": SCHEMA,
        "status": "complete",
        "support_inputs": support_inputs,
        "audit_snapshots": [item[1] for item in audit_cache.values()],
        "sources": [file_evidence(producer_source), file_evidence(lean_source)],
        "consumer": producer_bank._WEIGHTED_KALMANSON_CANCELLATION_CONSUMER,
        "input_records": input_records,
        "status_counts": dict(sorted(status_counts.items())),
        "certified": len(results),
        "results": results,
        "proof_status": (
            "Every certified record passed exact production reconstruction and "
            "names a kernel-checked cardinality-generic Lean consumer. This is "
            "not exact-17 finite coverage or source-to-finite ingress."
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "input_records": payload["input_records"],
                "certified": payload["certified"],
                "status_counts": payload["status_counts"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
