#!/usr/bin/env python3
"""Probe exact dihedral images of weighted-Kalmanson row certificates."""

from __future__ import annotations

import argparse
from collections import Counter
import importlib.util
import json
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


export = load_module(
    "exact17_weighted_dihedral_probe_export",
    HERE / "export_source_faithful_boolean_cnf.py",
)
producer_bank = export.legacy.producer_bank


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left < right else (right, left)


def edge_multiset(
    pairs: tuple[tuple[int, int], tuple[int, int]],
) -> Counter[tuple[int, int]]:
    return Counter(edge(*pair) for pair in pairs)


def map_term(
    term: dict[str, Any],
    mapping: dict[int, int],
    position: dict[int, int],
) -> dict[str, Any]:
    original_quad = tuple(int(label) for label in term["quad"])
    original_left, original_right = producer_bank._kalmanson_edges(
        original_quad, str(term["form"])
    )
    mapped_left = Counter(
        edge(mapping[left], mapping[right]) for left, right in original_left
    )
    mapped_right = Counter(
        edge(mapping[left], mapping[right]) for left, right in original_right
    )
    mapped_quad = tuple(sorted((mapping[label] for label in original_quad), key=position.get))
    matches = []
    for form in ("adjacentSides", "innerOuter"):
        candidate_left, candidate_right = producer_bank._kalmanson_edges(
            mapped_quad, form
        )
        if (
            edge_multiset(candidate_left) == mapped_left
            and edge_multiset(candidate_right) == mapped_right
        ):
            matches.append(form)
    if len(matches) != 1:
        raise ValueError(
            f"dihedral term image has {len(matches)} Kalmanson forms: {term}"
        )
    return {
        "quad": list(mapped_quad),
        "form": matches[0],
        "weight": int(term["weight"]),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--certificate", type=Path, action="append", required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    variables = export.selected_variables()
    all_clauses: set[tuple[int, ...]] = set()
    records = []
    common_order: tuple[int, ...] | None = None
    for certificate_path in args.certificate:
        payload = json.loads(certificate_path.read_text())
        order = tuple(int(label) for label in payload["order"])
        if common_order is None:
            common_order = order
        elif order != common_order:
            raise ValueError("certificates use different cyclic orders")
        position = {label: index for index, label in enumerate(order)}
        rows_payload = payload["rows"]
        terms = payload["weighted_terms"]
        source_rows = export.legacy.rows_from_payload(rows_payload)
        source_record = producer_bank.certify_weighted_kalmanson_cancellation(
            source_rows, 17, order, terms
        )
        if source_record != payload["weighted_certificate"]:
            raise ValueError(f"source certificate drift: {certificate_path}")

        clauses: set[tuple[int, ...]] = set()
        orientation_counts: Counter[str] = Counter()
        for orientation in (1, -1):
            for shift in range(17):
                mapping = {
                    order[index]: order[(shift + orientation * index) % 17]
                    for index in range(17)
                }
                mapped_rows_payload = [
                    {
                        "center": mapping[int(row["center"])],
                        "support": sorted(mapping[int(point)] for point in row["support"]),
                        "exact": bool(row.get("exact", False)),
                    }
                    for row in rows_payload
                ]
                mapped_rows = export.legacy.rows_from_payload(mapped_rows_payload)
                mapped_terms = [map_term(term, mapping, position) for term in terms]
                producer_bank.certify_weighted_kalmanson_cancellation(
                    mapped_rows, 17, order, mapped_terms
                )
                clause = tuple(
                    sorted(
                        {
                            -variables[row.center, point]
                            for row in mapped_rows
                            for point in row.support
                        }
                    )
                )
                if not clause:
                    raise ValueError("dihedral image emitted an empty clause")
                clauses.add(clause)
                orientation_counts["rotation" if orientation == 1 else "reflection"] += 1
        all_clauses.update(clauses)
        row_vertices = {
            int(row["center"]) for row in rows_payload
        } | {
            int(point) for row in rows_payload for point in row["support"]
        }
        records.append(
            {
                "certificate": str(certificate_path),
                "source_row_count": len(rows_payload),
                "source_row_vertex_count": len(row_vertices),
                "checked_images": sum(orientation_counts.values()),
                "unique_clauses": len(clauses),
                "orientation_counts": dict(orientation_counts),
            }
        )

    report = {
        "schema": "p97-exact17-weighted-kalmanson-dihedral-probe-v1",
        "status": "PASS",
        "certificate_count": len(records),
        "checked_images": 34 * len(records),
        "unique_clauses": len(all_clauses),
        "records": records,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {key: report[key] for key in ("status", "certificate_count", "checked_images", "unique_clauses")},
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
