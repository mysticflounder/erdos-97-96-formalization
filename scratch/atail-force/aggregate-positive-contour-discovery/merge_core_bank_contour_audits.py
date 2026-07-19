#!/usr/bin/env python3
"""Merge bounded contour-audit shards, preferring later per-core reruns."""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from pathlib import Path


SCHEMA = "p97-atail-core-bank-small-positive-contour-merged-v1"


def is_exact(record: dict[str, object]) -> bool:
    contour = record.get("contour")
    return (
        isinstance(contour, dict)
        and contour.get("exact_vector_cancellation") is True
    )


def strict_terms(record: dict[str, object]) -> list[tuple[str, int]]:
    contour = record["contour"]
    assert isinstance(contour, dict)
    multipliers = contour["multipliers"]
    assert isinstance(multipliers, dict)
    return [
        (name.split("_", 1)[0], int(weight))
        for name, weight in multipliers.items()
        if name.startswith("kal")
    ]


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("inputs", nargs="+", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--expected-count", type=int, default=263)
    args = parser.parse_args()

    records: dict[int, dict[str, object]] = {}
    sources: list[dict[str, object]] = []
    source_banks: set[str] = set()
    source_replays: set[str] = set()
    for path in args.inputs:
        payload = json.loads(path.read_text(encoding="utf-8"))
        source_banks.add(payload["source_bank"])
        source_replays.add(payload["source_replay"])
        sources.append(
            {
                "source_index_start": payload["source_index_start"],
                "source_index_stop": payload["source_index_stop"],
                "max_strict_support": payload["max_strict_support"],
            }
        )
        for record in payload["records"]:
            records[int(record["schema_index"])] = record
    expected = set(range(args.expected_count))
    if set(records) != expected:
        raise ValueError(
            f"merged indices differ from expected: missing={sorted(expected - set(records))}, "
            f"extra={sorted(set(records) - expected)}"
        )
    if len(source_banks) != 1 or len(source_replays) != 1:
        raise ValueError("input shards do not share one source bank and replay")
    source_bank = Path(next(iter(source_banks)))
    source_replay = Path(next(iter(source_replays)))

    ordered = [records[index] for index in range(args.expected_count)]
    exact = [record for record in ordered if is_exact(record)]
    unresolved = [record for record in ordered if not is_exact(record)]
    strict_histogram = Counter(
        int(record["contour"]["strict_support_size"]) for record in exact
    )
    row_histogram = Counter(
        int(record["contour"]["row_equality_support_size"]) for record in exact
    )
    center_histogram = Counter(
        int(record["contour"]["row_center_count"]) for record in exact
    )
    search_status_histogram = Counter(
        (
            record["contour"].get("search_status", "EXACT_POSITIVE_CONTOUR")
            if isinstance(record.get("contour"), dict)
            else "LEGACY_BOUNDED_NO_RESULT"
        )
        for record in unresolved
    )
    unit_weight_count = sum(
        all(weight == 1 for _, weight in strict_terms(record)) for record in exact
    )
    three_cell_four_center = [
        record
        for record in exact
        if record["contour"]["strict_support_size"] == 3
        and record["contour"]["row_center_count"] == 4
    ]
    w33_signature = [
        record
        for record in three_cell_four_center
        if all(kind == "kal2" for kind, _ in strict_terms(record))
    ]
    payload = {
        "schema": SCHEMA,
        "epistemic_status": (
            "EXACT_POSITIVE_CERTIFICATES; NEGATIVE SEARCH STATUSES ARE EXTERNAL_BOUNDED"
        ),
        "source_core_count": args.expected_count,
        "source_bank": str(source_bank),
        "source_bank_sha256": hashlib.sha256(source_bank.read_bytes()).hexdigest(),
        "source_replay": str(source_replay),
        "source_replay_sha256": hashlib.sha256(source_replay.read_bytes()).hexdigest(),
        "exact_positive_contour_count": len(exact),
        "bounded_unresolved_count": len(unresolved),
        "strict_support_histogram": dict(sorted(strict_histogram.items())),
        "row_equality_support_histogram": dict(sorted(row_histogram.items())),
        "row_center_histogram": dict(sorted(center_histogram.items())),
        "bounded_unresolved_status_histogram": dict(
            sorted(search_status_histogram.items())
        ),
        "unit_strict_weight_count": unit_weight_count,
        "nonunit_strict_weight_count": len(exact) - unit_weight_count,
        "three_cell_four_center_count": len(three_cell_four_center),
        "w33_three_k2_four_center_signature_count": len(w33_signature),
        "w33_signature_schema_indices": [
            record["schema_index"] for record in w33_signature
        ],
        "unresolved_schema_indices": [
            record["schema_index"] for record in unresolved
        ],
        "sources": sources,
        "records": ordered,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        json.dumps(
            {key: value for key, value in payload.items() if key not in {"records", "sources"}},
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
