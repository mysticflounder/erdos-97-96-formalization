#!/usr/bin/env python3
"""Export a saved source core as a source-guarded DIMACS CNF.

The input is a source-core JSON whose ``core`` entries contain an original
source assertion index and its saved s-expression.  Each selected assertion
gets its own activation marker.  The marker remains free during bit-blasting;
one positive DIMACS unit per marker is appended only after the marker-safe
pipeline has finished.

Unlike the first full-source guarded exporter, this pipeline deliberately
omits ``propagate-values`` and ``solve-eqs``.  Those tactics can exploit free
activation variables and are therefore inappropriate before activation units
are appended.  The exporter fails closed if any marker disappears or if the
finished DIMACS does not contain exactly one positive unit for every marker.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re
import time
from typing import Any

import z3

import all_one_ordinal_rank as ordinal


SCHEMA = "p97-exact5-card13-all-one-guarded-source-subset-cnf-v1"
PIPELINE = (
    "simplify",
    "elim-term-ite",
    "lia2card",
    "card2bv",
    "bit-blast",
    "tseitin-cnf",
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def dimacs_clauses(lines: list[str]) -> list[tuple[int, ...]]:
    result: list[tuple[int, ...]] = []
    for line in lines:
        if not line or line.startswith("c") or line.startswith("p"):
            continue
        values = [int(value) for value in line.split()]
        if not values or values[-1] != 0:
            raise AssertionError(f"unterminated DIMACS clause: {line[:100]}")
        result.append(tuple(values[:-1]))
    return result


def _load_selected(
    core_path: Path,
    seed: int,
) -> tuple[dict[str, Any], object, dict[str, int], list[dict[str, Any]]]:
    saved = json.loads(core_path.read_text(encoding="utf-8"))
    orbit = saved.get("orbit")
    if orbit not in ordinal.ORBITS:
        raise ValueError(f"unsupported or missing orbit: {orbit!r}")
    raw_core = saved.get("core")
    if not isinstance(raw_core, list) or not raw_core:
        raise ValueError("saved source core must contain a nonempty core list")

    outer, _rank, counts = ordinal.build(orbit, seed, 0)
    assertions = list(outer.solver.assertions())
    selected: list[dict[str, Any]] = []
    seen_indices: set[int] = set()
    for position, item in enumerate(raw_core):
        if not isinstance(item, dict) or "index" not in item or "assertion" not in item:
            raise ValueError(f"malformed core entry at position {position}")
        index = int(item["index"])
        if not 0 <= index < len(assertions):
            raise IndexError(f"source assertion index out of range: {index}")
        if index in seen_indices:
            raise ValueError(f"duplicate source assertion index: {index}")
        seen_indices.add(index)
        assertion = assertions[index]
        assertion_sexpr = assertion.sexpr()
        if assertion_sexpr != item["assertion"]:
            raise AssertionError(f"source assertion drift at index {index}")
        selected.append({
            "position": position,
            "source_index": index,
            "assertion": assertion,
            "assertion_sexpr": assertion_sexpr,
        })
    return saved, outer, counts, selected


def export_guarded_subset(
    *,
    core_path: Path,
    seed: int,
    output_cnf: Path,
    output_map: Path,
) -> dict[str, Any]:
    started = time.monotonic()
    saved, _outer, counts, selected = _load_selected(core_path, seed)

    markers: list[z3.BoolRef] = []
    marker_names: list[str] = []
    goal = z3.Goal()
    for item in selected:
        marker_name = (
            f"source_subset_marker_{item['position']:05d}"
            f"_index_{item['source_index']:05d}"
        )
        marker = z3.Bool(marker_name)
        marker_names.append(marker_name)
        markers.append(marker)
        goal.add(z3.Implies(marker, item["assertion"]))

    transformed = z3.Then(*PIPELINE)(goal)
    if len(transformed) != 1:
        raise AssertionError(f"expected one CNF subgoal, got {len(transformed)}")
    raw_lines = transformed[0].dimacs(include_names=True).splitlines()
    header_indices = [
        index for index, line in enumerate(raw_lines) if line.startswith("p cnf ")
    ]
    if len(header_indices) != 1:
        raise AssertionError(f"expected one DIMACS header, got {len(header_indices)}")
    header_index = header_indices[0]
    _, _, raw_variables, raw_clauses = raw_lines[header_index].split()
    variable_count = int(raw_variables)
    clause_count_before_units = int(raw_clauses)
    clauses_before_units = dimacs_clauses(raw_lines)
    if len(clauses_before_units) != clause_count_before_units:
        raise AssertionError(
            "DIMACS clause mismatch before marker units: "
            f"header={clause_count_before_units}, actual={len(clauses_before_units)}"
        )

    marker_pattern = re.compile(
        r"c (\d+) source_subset_marker_(\d{5})_index_(\d{5})$"
    )
    marker_variables: dict[int, int] = {}
    marker_source_indices: dict[int, int] = {}
    for line in raw_lines:
        match = marker_pattern.fullmatch(line)
        if match:
            variable = int(match.group(1))
            position = int(match.group(2))
            source_index = int(match.group(3))
            if position in marker_variables:
                raise AssertionError(f"duplicate marker comment at position {position}")
            marker_variables[position] = variable
            marker_source_indices[position] = source_index

    expected_positions = set(range(len(selected)))
    if set(marker_variables) != expected_positions:
        missing = sorted(expected_positions - set(marker_variables))
        extra = sorted(set(marker_variables) - expected_positions)
        raise AssertionError(
            "marker map incomplete: "
            f"missing positions {missing[:20]}, extra positions {extra[:20]}"
        )
    if len(set(marker_variables.values())) != len(selected):
        raise AssertionError("DIMACS marker variables are not one-to-one")
    for item in selected:
        position = item["position"]
        if marker_source_indices[position] != item["source_index"]:
            raise AssertionError(f"marker/source mismatch at position {position}")

    units = [
        f"{marker_variables[position]} 0" for position in range(len(selected))
    ]
    final_clause_count = clause_count_before_units + len(units)
    raw_lines[header_index] = f"p cnf {variable_count} {final_clause_count}"
    final_lines = raw_lines[: header_index + 1] + units + raw_lines[header_index + 1 :]
    final_clauses = dimacs_clauses(final_lines)
    if len(final_clauses) != final_clause_count:
        raise AssertionError(
            "DIMACS clause mismatch after marker units: "
            f"header={final_clause_count}, actual={len(final_clauses)}"
        )
    for position in range(len(selected)):
        variable = marker_variables[position]
        positive_units = sum(clause == (variable,) for clause in final_clauses)
        negative_units = sum(clause == (-variable,) for clause in final_clauses)
        if positive_units != 1 or negative_units != 0:
            raise AssertionError(
                f"marker {position} unit audit failed: "
                f"positive={positive_units}, negative={negative_units}"
            )

    output_cnf.write_text("\n".join(final_lines) + "\n", encoding="utf-8")
    marker_sources = []
    for item, marker_name in zip(selected, marker_names, strict=True):
        position = item["position"]
        marker_sources.append({
            "position": position,
            "marker_name": marker_name,
            "marker_variable": marker_variables[position],
            "source_index": item["source_index"],
            "assertion": item["assertion_sexpr"],
        })

    payload: dict[str, Any] = {
        "schema": SCHEMA,
        "epistemic_status": "SOURCE_SUBSET_GUARDED_EXTERNAL_Z3_TACTIC_EXPORT",
        "orbit": saved["orbit"],
        "seed": seed,
        "source_counts": counts,
        "input_source_core_path": str(core_path),
        "input_source_core_sha256": sha256(core_path),
        "input_source_core_schema": saved.get("schema"),
        "full_source_assertion_count": len(_outer.solver.assertions()),
        "selected_assertion_count": len(selected),
        "selected_source_indices": [item["source_index"] for item in selected],
        "marker_variables": {
            str(item["source_index"]): marker_variables[item["position"]]
            for item in selected
        },
        "marker_sources": marker_sources,
        "marker_unit_policy": "exactly_one_positive_unit_per_selected_assertion",
        "marker_safe_pipeline": list(PIPELINE),
        "pipeline_omits": ["propagate-values", "solve-eqs"],
        "cnf_variable_count": variable_count,
        "cnf_clause_count_before_marker_units": clause_count_before_units,
        "cnf_clause_count": final_clause_count,
        "elapsed_seconds": time.monotonic() - started,
        "cnf_sha256": sha256(output_cnf),
        "canonical_qw": saved.get("canonical_qw", False),
        "not_a_formal_proof": True,
    }
    output_map.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    return payload


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--core", type=Path, required=True)
    parser.add_argument("--seed", type=int, default=17)
    parser.add_argument("--output-cnf", type=Path, required=True)
    parser.add_argument("--output-map", type=Path, required=True)
    args = parser.parse_args()
    payload = export_guarded_subset(
        core_path=args.core,
        seed=args.seed,
        output_cnf=args.output_cnf,
        output_map=args.output_map,
    )
    print(json.dumps({
        key: payload[key]
        for key in (
            "orbit",
            "selected_assertion_count",
            "cnf_variable_count",
            "cnf_clause_count",
            "elapsed_seconds",
            "cnf_sha256",
        )
    }, indent=2, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
