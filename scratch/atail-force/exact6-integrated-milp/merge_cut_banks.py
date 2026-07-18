#!/usr/bin/env python3
"""Merge exact CEGAR JSONL banks by their Boolean nogood semantics."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

from exact_cegar import verify_exact_cut


def record_sha256(record: dict[str, object]) -> str:
    encoded = json.dumps(record, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def key(record: dict[str, object]):
    memberships = tuple(sorted(tuple(item) for item in record["required_memberships"]))
    shell = record.get("conditioned_shell")
    return memberships, None if shell is None else tuple(shell)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("inputs", nargs="+", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--manifest", required=True, type=Path)
    args = parser.parse_args()
    if args.output.exists() or args.manifest.exists():
        raise SystemExit("refusing to overwrite merged-bank artifacts")

    unique: dict[object, dict[str, object]] = {}
    provenance: dict[object, list[dict[str, object]]] = {}
    input_records = 0
    for path in args.inputs:
        for line in path.read_text(encoding="utf-8").splitlines():
            if not line:
                continue
            record = json.loads(line)
            verify_exact_cut(record)
            input_records += 1
            semantic_key = key(record)
            provenance.setdefault(semantic_key, []).append({
                "source_path": str(path),
                "source_cut_id": record["id"],
                "source_record_sha256": record_sha256(record),
            })
            unique.setdefault(semantic_key, record)

    output_records = []
    with args.output.open("x", encoding="utf-8") as handle:
        for index, semantic_key in enumerate(sorted(unique, key=str), start=1):
            source = unique[semantic_key]
            merged = {
                **source,
                "id": f"global-cut-{index:05d}",
                "provenance": provenance[semantic_key],
            }
            verify_exact_cut(merged)
            output_records.append(merged)
            handle.write(json.dumps(merged, sort_keys=True) + "\n")
    manifest = {
        "schema": "p97-exact6-integrated-global-cut-bank-manifest-v1",
        "epistemic_status": "EXACT_VECTOR_CANCELLATION_BANK_NOT_LIVE_LEAN_CLOSURE",
        "inputs": [
            {
                "path": str(path),
                "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
                "records": sum(bool(line) for line in path.read_text(encoding="utf-8").splitlines()),
            }
            for path in args.inputs
        ],
        "input_record_count": input_records,
        "unique_record_count": len(output_records),
        "duplicate_record_count": input_records - len(output_records),
        "output": str(args.output),
        "output_sha256": hashlib.sha256(args.output.read_bytes()).hexdigest(),
    }
    args.manifest.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(json.dumps(manifest, sort_keys=True))


if __name__ == "__main__":
    main()
