#!/usr/bin/env python3
"""Project a grouped guarded-CNF clause core to source assertion indices."""

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
            raise ValueError(f"unterminated clause: {line[:100]}")
        result.append(tuple(values[:-1]))
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--map", type=Path, required=True)
    parser.add_argument("--core-cnf", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    source_map = json.loads(args.map.read_text(encoding="utf-8"))
    marker_to_group = {
        int(variable): int(group)
        for group, variable in source_map["marker_variables"].items()
    }
    core_clauses = clauses(args.core_cnf)
    core_units = {clause[0] for clause in core_clauses if len(clause) == 1}
    selected_groups = sorted(
        marker_to_group[variable]
        for variable in core_units
        if variable in marker_to_group
    )
    groups = {
        int(index): list(map(int, indices))
        for index, indices in source_map["groups"].items()
    }
    source_indices = sorted({
        source_index
        for group in selected_groups
        for source_index in groups[group]
    })
    assertions = source_map["source_assertions"]
    payload = {
        "schema": "p97-exact5-card13-all-one-grouped-source-core-v1",
        "epistemic_status": "EXTERNAL_DRAT_TRIM_GROUPED_SOURCE_CORE",
        "orbit": source_map["orbit"],
        "source_counts": source_map["source_counts"],
        "input_source_assertion_count": source_map["source_assertion_count"],
        "input_group_count": len(groups),
        "selected_group_count": len(selected_groups),
        "selected_groups": selected_groups,
        "core_clause_count": len(core_clauses),
        "core_size": len(source_indices),
        "core": [
            {"index": index, "assertion": assertions[index]}
            for index in source_indices
        ],
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
        "selected_group_count": payload["selected_group_count"],
        "core_size": payload["core_size"],
        "output": str(args.output),
    }, indent=2, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
