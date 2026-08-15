#!/usr/bin/env python3
"""Replay the generic checked two-Kalmanson consumer over mined exact-17 cores.

The input ledger identifies authenticated journal records whose exact QF_LRA
systems were UNSAT.  This replay asks the production producer-bank matcher
whether each record admits the smaller, ordinary-Lean cancellation certificate.
It snapshots and hashes every journal it reads; it does not mutate the live,
source-frozen CEGAR workers or their journals.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(ROOT))

from census.atail_force import producer_bank  # noqa: E402


ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
DEFAULT_INPUT = HERE / "tracked-supports-minboth-all.json"
DEFAULT_OUTPUT = HERE / "two-kalmanson-consumer-replay.json"


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical_sha256(value: Any) -> str:
    encoded = json.dumps(
        value, sort_keys=True, separators=(",", ":")
    ).encode()
    return sha256(encoded)


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
            # A live writer may leave one trailing partial line in the snapshot.
            break
        records[int(record["iteration"])] = record
        parsed_lines += 1
    return records, {
        "path": str(path),
        "sha256": sha256(raw),
        "bytes": len(raw),
        "parsed_lines": parsed_lines,
    }


def file_evidence(path: Path) -> dict[str, Any]:
    raw = path.read_bytes()
    return {"path": str(path), "sha256": sha256(raw), "bytes": len(raw)}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, default=DEFAULT_INPUT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()

    ledger_raw = args.input.read_bytes()
    ledger = json.loads(ledger_raw)
    journal_paths = sorted({Path(item["journal"]) for item in ledger["results"]})
    journal_records: dict[Path, dict[int, dict[str, Any]]] = {}
    snapshots = []
    for path in journal_paths:
        records, evidence = snapshot_journal(path)
        journal_records[path] = records
        snapshots.append(evidence)

    results = []
    for item in ledger["results"]:
        journal = Path(item["journal"])
        iteration = int(item["iteration"])
        record = journal_records[journal].get(iteration)
        if record is None:
            raise RuntimeError(f"missing {journal} iteration {iteration}")
        if record.get("classification") != "linear_unsat":
            raise RuntimeError(
                f"unexpected classification at {journal}:{iteration}: "
                f"{record.get('classification')!r}"
            )
        rows = tuple(
            producer_bank.MetricRow(
                int(row["center"]),
                tuple(int(point) for point in row["support"]),
                exact=bool(row.get("exact", False)),
            )
            for row in record["learned_rows"]
        )
        core = producer_bank._two_kalmanson_cancellation_core(rows, 17, ORDER)
        results.append(
            {
                "journal": str(journal),
                "iteration": iteration,
                "record_sha256": canonical_sha256(record),
                "matched": core is not None,
                "core": core,
            }
        )

    matched = sum(item["matched"] for item in results)
    status_counts = Counter(
        "matched" if item["matched"] else "unmatched" for item in results
    )
    producer_source = Path(producer_bank.__file__).resolve()
    lean_source = ROOT / (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "GenericRowNogoodCertificate.lean"
    )
    payload = {
        "status": "complete",
        "scope": "exact-17 mined linear_unsat journal records",
        "records": len(results),
        "matched": matched,
        "status_counts": dict(status_counts),
        "consumer": producer_bank._TWO_KALMANSON_CANCELLATION_CONSUMER,
        "input": {
            "path": str(args.input),
            "sha256": sha256(ledger_raw),
            "bytes": len(ledger_raw),
        },
        "sources": [file_evidence(producer_source), file_evidence(lean_source)],
        "journal_snapshots": snapshots,
        "results": results,
        "proof_status": (
            "Each matched core has a kernel-checked generic Lean consumer; "
            "this replay is not finite coverage of exact 17."
        ),
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "records": len(results),
                "matched": matched,
                "status_counts": dict(status_counts),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
