#!/usr/bin/env python3
"""Replay the full formalized metric-core prefilter on a CEGAR witness."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import sys


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[4]
sys.path.insert(0, str(ROOT))

from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    _formalized_metric_core,
)


DEFAULT_WITNESS = (
    HERE
    / "source-at-common-full-metric-bank-v7-shared-fourth-resume-120s-600s"
    / "witness.json"
)


def exact_rows_from_partition(payload: dict[str, object]) -> tuple[list[str], list[MetricRow]]:
    order = payload["existential_cyclic_order"]
    radius_classes = payload["radius_classes"]
    if not isinstance(order, list) or not all(isinstance(point, str) for point in order):
        raise ValueError("witness cyclic order is not a list of labels")
    if len(set(order)) != len(order):
        raise ValueError("witness cyclic order has duplicate labels")
    if not isinstance(radius_classes, dict) or set(radius_classes) != set(order):
        raise ValueError("radius partition centers do not match the carrier")

    index = {point: position for position, point in enumerate(order)}
    rows: list[MetricRow] = []
    for center in order:
        classes = radius_classes[center]
        if not isinstance(classes, list):
            raise ValueError(f"radius partition at {center} is not a list")
        flattened: list[str] = []
        for support in classes:
            if not isinstance(support, list) or not support:
                raise ValueError(f"radius class at {center} is empty or malformed")
            if not all(isinstance(point, str) for point in support):
                raise ValueError(f"radius class at {center} has a non-label member")
            flattened.extend(support)
            rows.append(
                MetricRow(
                    center=index[center],
                    support=tuple(index[point] for point in support),
                    exact=True,
                )
            )
        expected = set(order) - {center}
        if len(flattened) != len(expected) or set(flattened) != expected:
            raise ValueError(f"radius classes at {center} are not a partition")
    return order, rows


def replay(witness: Path) -> dict[str, object]:
    resolved = witness.resolve()
    payload = json.loads(resolved.read_text(encoding="utf-8"))
    order, rows = exact_rows_from_partition(payload)
    core = _formalized_metric_core(
        rows,
        len(order),
        tuple(range(len(order))),
        include_extended=True,
        include_ordered=True,
    )
    return {
        "schema": "crossed-arm-formalized-metric-core-replay-v1",
        "status": "KILLED" if core is not None else "SURVIVES",
        "witness": str(resolved),
        "witness_sha256": hashlib.sha256(resolved.read_bytes()).hexdigest(),
        "carrier_size": len(order),
        "exact_radius_row_count": len(rows),
        "cyclic_order": order,
        "formalized_metric_core": core,
        "trust_note": (
            "Finite Python replay of production-aligned metric-core matchers "
            "against the complete serialized radius partition; not a Lean proof."
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--witness", type=Path, default=DEFAULT_WITNESS)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = replay(args.witness)
    output = args.output or args.witness.parent / "formalized-metric-core-replay.json"
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "status": result["status"],
                "stage": (result["formalized_metric_core"] or {}).get("stage"),
                "exact_radius_row_count": result["exact_radius_row_count"],
                "output": str(output.resolve()),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
