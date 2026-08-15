#!/usr/bin/env python3
"""Replay checked weighted-Kalmanson certificates over the remaining cores.

Z3 supplied the primitive positive integer weights in the classification
ledger.  The production bank does not trust that solve: it reconstructs the
terms, checks exact multiset cancellation modulo the learned row equalities,
and emits one primitive equality path for every repeated edge occurrence.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path
from typing import Any

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(ROOT))

from census.atail_force import producer_bank  # noqa: E402


ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
DEFAULT_CLASSIFICATION = HERE / "unmatched-linear-classification.json"
DEFAULT_SUPPORTS = HERE / "tracked-supports-minboth-all.json"
DEFAULT_OUTPUT = HERE / "weighted-kalmanson-consumer-replay.json"


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical_sha256(value: Any) -> str:
    encoded = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return sha256(encoded)


def file_evidence(path: Path) -> dict[str, Any]:
    raw = path.read_bytes()
    return {"path": str(path), "sha256": sha256(raw), "bytes": len(raw)}


def snapshot_journal(path: Path) -> tuple[dict[int, dict[str, Any]], dict[str, Any]]:
    raw = path.read_bytes()
    records: dict[int, dict[str, Any]] = {}
    parsed_lines = 0
    for raw_line in raw.splitlines():
        if not raw_line.strip():
            continue
        try:
            record = json.loads(raw_line)
        except json.JSONDecodeError:
            break
        records[int(record["iteration"])] = record
        parsed_lines += 1
    return records, {
        "path": str(path),
        "sha256": sha256(raw),
        "bytes": len(raw),
        "parsed_lines": parsed_lines,
    }


def term_from_atom(
    atom: list[Any], used_points: list[int], weight: int
) -> dict[str, Any]:
    if atom[0] not in {"k1", "k2"}:
        raise ValueError(f"non-Kalmanson inequality in weighted replay: {atom!r}")
    local_quad = sorted(
        {point for side in atom[1:] for edge in side for point in edge}
    )
    if len(local_quad) != 4:
        raise ValueError(f"Kalmanson atom does not use four points: {atom!r}")
    return {
        "quad": [used_points[index] for index in local_quad],
        "form": "adjacentSides" if atom[0] == "k1" else "innerOuter",
        "weight": weight,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--classification", type=Path, default=DEFAULT_CLASSIFICATION
    )
    parser.add_argument("--supports", type=Path, default=DEFAULT_SUPPORTS)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()

    classification_raw = args.classification.read_bytes()
    supports_raw = args.supports.read_bytes()
    classification = json.loads(classification_raw)
    supports = json.loads(supports_raw)
    support_by_key = {
        (item["journal"], int(item["iteration"])): item
        for item in supports["results"]
    }

    journal_paths = sorted(
        {Path(item["journal"]) for item in classification["results"]}
    )
    journal_records: dict[Path, dict[int, dict[str, Any]]] = {}
    snapshots = []
    for path in journal_paths:
        records, evidence = snapshot_journal(path)
        journal_records[path] = records
        snapshots.append(evidence)

    results = []
    for item in classification["results"]:
        journal = Path(item["journal"])
        iteration = int(item["iteration"])
        if not item["pure_kalmanson"] or not item["positive_rational_cancellation"]:
            raise RuntimeError(f"unsupported classified core at {journal}:{iteration}")
        weights = item["weights"]
        if weights is None:
            raise RuntimeError(f"missing weights at {journal}:{iteration}")
        support = support_by_key.get((str(journal), iteration))
        if support is None:
            raise RuntimeError(f"missing support at {journal}:{iteration}")
        inequalities = [atom for atom in support["atoms"] if atom[0] != "eq"]
        if len(inequalities) != len(weights):
            raise RuntimeError(f"weight/inequality mismatch at {journal}:{iteration}")
        terms = [
            term_from_atom(atom, support["used_points"], int(weight))
            for atom, weight in zip(inequalities, weights, strict=True)
        ]

        record = journal_records[journal].get(iteration)
        if record is None or record.get("classification") != "linear_unsat":
            raise RuntimeError(
                f"missing linear_unsat journal record at {journal}:{iteration}"
            )
        rows = tuple(
            producer_bank.MetricRow(
                int(row["center"]),
                tuple(int(point) for point in row["support"]),
                exact=bool(row.get("exact", False)),
            )
            for row in record["learned_rows"]
        )
        certificate = producer_bank.certify_weighted_kalmanson_cancellation(
            rows, 17, ORDER, terms
        )
        results.append(
            {
                "journal": str(journal),
                "iteration": iteration,
                "record_sha256": canonical_sha256(record),
                "support_sha256": canonical_sha256(support),
                "weights": weights,
                "certificate": certificate,
            }
        )

    producer_source = Path(producer_bank.__file__).resolve()
    lean_source = ROOT / (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "GenericRowNogoodCertificate.lean"
    )
    payload = {
        "status": "complete",
        "scope": "exact-17 two-Kalmanson-unmatched linear_unsat journal records",
        "records": len(results),
        "matched": len(results),
        "consumer": producer_bank._WEIGHTED_KALMANSON_CANCELLATION_CONSUMER,
        "inputs": [
            {
                "path": str(args.classification),
                "sha256": sha256(classification_raw),
                "bytes": len(classification_raw),
            },
            {
                "path": str(args.supports),
                "sha256": sha256(supports_raw),
                "bytes": len(supports_raw),
            },
        ],
        "sources": [file_evidence(producer_source), file_evidence(lean_source)],
        "journal_snapshots": snapshots,
        "results": results,
        "proof_status": (
            "Every record passed the exact production checker and names the "
            "kernel-checked cardinality-generic Lean consumer. This replay is "
            "not finite coverage of exact 17."
        ),
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "records": len(results),
                "matched": len(results),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
