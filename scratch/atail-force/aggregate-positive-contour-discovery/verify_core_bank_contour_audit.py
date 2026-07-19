#!/usr/bin/env python3
"""Independently replay the merged 263-core positive-contour census."""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter, defaultdict
from pathlib import Path


SCHEMA = "p97-atail-core-bank-positive-contour-replay-v2"
Edge = tuple[int, int]


def edge(left: int, right: int) -> Edge:
    if left == right:
        raise ValueError("distance loop")
    return (left, right) if left < right else (right, left)


def terms(name: str) -> dict[Edge, int]:
    fields = name.split("_")
    kind = fields[0]
    labels = tuple(map(int, fields[1:]))
    if kind == "row":
        center, left, right = labels
        return {edge(center, right): 1, edge(center, left): -1}
    if kind not in {"kal1", "kal2"} or len(labels) != 4:
        raise ValueError(f"unknown constraint {name}")
    a, b, c, d = labels
    if not a < b < c < d:
        raise ValueError(f"Kalmanson labels are not increasing: {name}")
    result = {edge(a, c): 1, edge(b, d): 1}
    negative = ((a, b), (c, d)) if kind == "kal1" else ((a, d), (b, c))
    for left, right in negative:
        item = edge(left, right)
        result[item] = result.get(item, 0) - 1
    return {item: value for item, value in result.items() if value}


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("audit", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    audit = json.loads(args.audit.read_text(encoding="utf-8"))
    bank_path = Path(audit["source_bank"])
    replay_path = Path(audit["source_replay"])
    if digest(bank_path) != audit["source_bank_sha256"]:
        raise ValueError("source bank hash mismatch")
    if digest(replay_path) != audit["source_replay_sha256"]:
        raise ValueError("source replay hash mismatch")
    bank = json.loads(bank_path.read_text(encoding="utf-8"))
    replay = json.loads(replay_path.read_text(encoding="utf-8"))
    if replay.get("status") != "VERIFIED":
        raise ValueError("source replay is not VERIFIED")
    if len(audit["records"]) != len(bank["schemas"]) or len(bank["schemas"]) != 263:
        raise ValueError("record count mismatch")

    exact: list[dict[str, object]] = []
    for index, (record, schema) in enumerate(
        zip(audit["records"], bank["schemas"], strict=True)
    ):
        if record["schema_index"] != index:
            raise ValueError(f"record {index} has wrong source index")
        contour = record.get("contour")
        if not isinstance(contour, dict) or not contour.get("exact_vector_cancellation"):
            continue
        source_core = set(schema["provenance"][0]["minimal_core"])
        active_labels = {
            int(label)
            for name in source_core
            for label in name.split("_")[1:]
        }
        residue: dict[Edge, int] = defaultdict(int)
        strict_count = 0
        strict_weight = 0
        row_count = 0
        row_centers: set[int] = set()
        for name, raw_multiplier in contour["multipliers"].items():
            multiplier = int(raw_multiplier)
            labels = tuple(map(int, name.split("_")[1:]))
            if not set(labels) <= active_labels:
                raise ValueError(f"record {index} uses an inactive label in {name}")
            if name.startswith("kal"):
                if multiplier <= 0:
                    raise ValueError(f"record {index} has nonpositive strict weight")
                strict_count += 1
                strict_weight += multiplier
            elif name.startswith("row_"):
                if name not in source_core:
                    raise ValueError(f"record {index} uses a row outside its source core")
                row_count += 1
                row_centers.add(labels[0])
            else:
                raise ValueError(f"record {index} has unknown multiplier {name}")
            for item, coefficient in terms(name).items():
                residue[item] += multiplier * coefficient
        residue = {item: value for item, value in residue.items() if value}
        if residue:
            raise ValueError(f"record {index} has nonzero residue {residue}")
        expected = (
            contour["strict_support_size"],
            contour["strict_weight"],
            contour["row_equality_support_size"],
            contour["row_center_count"],
        )
        actual = (strict_count, strict_weight, row_count, len(row_centers))
        if actual != expected:
            raise ValueError(f"record {index} metadata mismatch: {actual} != {expected}")
        if strict_count < 1:
            raise ValueError(f"record {index} has no strict Kalmanson support")
        exact.append(record)

    strict_histogram = Counter(
        record["contour"]["strict_support_size"] for record in exact
    )
    unit_count = sum(
        all(
            int(weight) == 1
            for name, weight in record["contour"]["multipliers"].items()
            if name.startswith("kal")
        )
        for record in exact
    )
    w33_indices = [
        record["schema_index"]
        for record in exact
        if record["contour"]["strict_support_size"] == 3
        and record["contour"]["row_center_count"] == 4
        and all(
            name.startswith("kal2_")
            for name in record["contour"]["multipliers"]
            if name.startswith("kal")
        )
    ]
    if len(exact) != audit["exact_positive_contour_count"]:
        raise ValueError("exact-positive count mismatch")
    if dict(sorted(strict_histogram.items())) != {
        int(key): value for key, value in audit["strict_support_histogram"].items()
    }:
        raise ValueError("strict-support histogram mismatch")
    if unit_count != audit["unit_strict_weight_count"]:
        raise ValueError("unit-weight count mismatch")
    if w33_indices != audit["w33_signature_schema_indices"]:
        raise ValueError("W(3,3) signature index mismatch")

    result = {
        "schema": SCHEMA,
        "status": "VERIFIED",
        "audit": str(args.audit),
        "audit_sha256": digest(args.audit),
        "source_replay_status": replay["status"],
        "record_count": len(audit["records"]),
        "exact_positive_contour_count": len(exact),
        "strict_support_histogram": dict(sorted(strict_histogram.items())),
        "unit_strict_weight_count": unit_count,
        "w33_signature_schema_indices": w33_indices,
        "all_used_rows_belong_to_source_cores": True,
        "all_used_labels_are_active": True,
        "all_integer_cancellations_zero": True,
    }
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
