#!/usr/bin/env python3
"""Project a DRAT-trim guarded-CNF clause core to source assertions."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def clauses(path: Path) -> list[tuple[int, ...]]:
    result: list[tuple[int, ...]] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line or line.startswith("c") or line.startswith("p"):
            continue
        values = [int(value) for value in line.split()]
        if not values or values[-1] != 0:
            raise ValueError(f"unterminated clause in {path}: {line[:100]}")
        result.append(tuple(values[:-1]))
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--map", type=Path, required=True)
    parser.add_argument("--core-cnf", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    source_map = json.loads(args.map.read_text(encoding="utf-8"))
    marker_sources = source_map.get("marker_sources")
    if marker_sources is not None:
        marker_to_item = {
            int(item["marker_variable"]): {
                "index": int(item["source_index"]),
                "assertion": item["assertion"],
            }
            for item in marker_sources
        }
        if len(marker_to_item) != len(marker_sources):
            raise AssertionError("guarded-subset marker variables are not unique")
        compatibility_map = {
            int(variable): int(index)
            for index, variable in source_map["marker_variables"].items()
        }
        if {
            variable: item["index"] for variable, item in marker_to_item.items()
        } != compatibility_map:
            raise AssertionError("marker_sources and marker_variables disagree")
    else:
        assertions = source_map["source_assertions"]
        marker_to_item = {
            int(variable): {
                "index": int(index),
                "assertion": assertions[int(index)],
            }
            for index, variable in source_map["marker_variables"].items()
        }
    core_clauses = clauses(args.core_cnf)
    core_units = {clause[0] for clause in core_clauses if len(clause) == 1}
    selected_items = sorted(
        (
            marker_to_item[variable]
            for variable in core_units
            if variable in marker_to_item
        ),
        key=lambda item: item["index"],
    )
    if marker_sources is not None and not selected_items:
        raise AssertionError("trimmed guarded-subset core retained no marker units")
    source_indices = [item["index"] for item in selected_items]
    payload = {
        "schema": "p97-exact5-card13-all-one-source-core-v1",
        "epistemic_status": "EXTERNAL_DRAT_TRIM_SOURCE_CORE",
        "orbit": source_map["orbit"],
        "source_counts": source_map["source_counts"],
        "input_source_assertion_count": source_map.get(
            "full_source_assertion_count",
            source_map.get("source_assertion_count"),
        ),
        "input_selected_assertion_count": source_map.get(
            "selected_assertion_count",
            source_map.get("source_assertion_count"),
        ),
        "core_clause_count": len(core_clauses),
        "core_size": len(source_indices),
        "core": selected_items,
        "guarded_cnf_sha256": source_map["cnf_sha256"],
        "core_cnf_sha256": sha256(args.core_cnf),
        "canonical_qw": source_map.get("canonical_qw", False),
        "not_a_formal_proof": True,
    }
    args.output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "orbit": payload["orbit"],
        "input_source_assertion_count": payload["input_source_assertion_count"],
        "input_selected_assertion_count": payload[
            "input_selected_assertion_count"
        ],
        "core_clause_count": payload["core_clause_count"],
        "core_size": payload["core_size"],
        "output": str(args.output),
    }, indent=2, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
