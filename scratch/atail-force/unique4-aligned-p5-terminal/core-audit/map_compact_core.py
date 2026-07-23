#!/usr/bin/env python3
"""Map the checked compact DRAT core back to encoder blocks and row schemas."""

from __future__ import annotations

import collections
import itertools
import json
from pathlib import Path
from typing import Any

import run_family_ablation as ABLATION


HERE = Path(__file__).resolve().parent
CNF_PATH = HERE / "aligned_p5_compact.cnf"
CORE_PATH = HERE / "aligned_p5_compact.core.cnf"
OUTPUT_PATH = HERE / "aligned_p5_compact.core-map.json"
KEEP_SCHEMAS = (1, 4, 6, 9)
BASE_OMISSIONS = (
    "aligned_pair+pair_minimality+single_minimality+curvature+"
    "seeded_kalmanson+bank_planar+bank_u5+critical_system"
)


def parse_dimacs(path: Path) -> tuple[int, list[tuple[int, ...]]]:
    variables = -1
    clauses: list[tuple[int, ...]] = []
    for line in path.read_text(encoding="ascii").splitlines():
        if not line or line.startswith("c"):
            continue
        if line.startswith("p "):
            _p, kind, variable_text, clause_text = line.split()
            if kind != "cnf":
                raise ValueError(line)
            variables = int(variable_text)
            expected = int(clause_text)
            continue
        literals = tuple(map(int, line.split()))
        if not literals or literals[-1] != 0:
            raise ValueError(line)
        clauses.append(literals[:-1])
    if variables < 0 or len(clauses) != expected:
        raise ValueError((variables, len(clauses), expected))
    return variables, clauses


def prefix(name: str) -> str:
    if name.startswith("m_"):
        return "selected_row_membership"
    if name.startswith("eq_"):
        return "complete_radius_equality"
    if name.startswith("class_"):
        return "first_apex_exact_class"
    if name.startswith("retained_"):
        return "retained_frontier_pair"
    if name.startswith("interior_"):
        return "strict_cap_pair"
    if name.startswith("second_deleted_"):
        return "second_apex_deletion_row"
    return name.split("_", 1)[0]


def main() -> int:
    filtered_bank, delete_bank = ABLATION.filtered_kalmanson_bank(
        "keep-" + ",".join(map(str, KEEP_SCHEMAS)), HERE
    )
    try:
        cnf, _metadata, clause_blocks = ABLATION.build_formula(filtered_bank)
    finally:
        if delete_bank:
            filtered_bank.unlink()

    omit = ABLATION.omit_predicate(BASE_OMISSIONS)
    kept = [
        (clause, block)
        for clause, block in zip(cnf.clauses, clause_blocks, strict=True)
        if not omit(block)
    ]
    compact_variables, compact_clauses = parse_dimacs(CNF_PATH)
    if compact_variables != len(cnf.names) - 1:
        raise AssertionError((compact_variables, len(cnf.names) - 1))
    if compact_clauses != [clause for clause, _block in kept]:
        raise AssertionError("reconstructed compact formula does not match stored CNF")

    _core_variables, core_clauses = parse_dimacs(CORE_PATH)
    source_blocks: dict[tuple[int, ...], set[str]] = collections.defaultdict(set)
    for clause, block in kept:
        source_blocks[tuple(sorted(clause))].add(block)

    bank_payload = json.loads(
        ABLATION.DRIVER.BASE.DIRECT.KALMANSON_BANK.read_text(encoding="utf-8")
    )
    schema_clauses: dict[tuple[int, ...], list[dict[str, Any]]] = (
        collections.defaultdict(list)
    )
    for schema_index in KEEP_SCHEMAS:
        record = bank_payload["schemas"][schema_index]
        role_count = int(record["core_vertex_count"])
        forward = tuple(tuple(map(int, pair)) for pair in record["order_schema"])
        reflected = tuple(
            sorted(
                (role_count - 1 - center, role_count - 1 - point)
                for center, point in forward
            )
        )
        for targets in itertools.combinations(range(11), role_count):
            for orientation, schema in (("forward", forward), ("reflected", reflected)):
                transformed = tuple(
                    sorted(
                        (targets[center], targets[point])
                        for center, point in schema
                    )
                )
                clause = tuple(
                    sorted(-cnf.ids[f"m_{center}_{point}"] for center, point in transformed)
                )
                schema_clauses[clause].append(
                    {
                        "schema_index": schema_index,
                        "lean_consumer": record["lean_consumer"],
                        "orientation": orientation,
                        "boundary_vertices": list(targets),
                        "row_memberships": [list(pair) for pair in transformed],
                    }
                )

    block_counts: collections.Counter[str] = collections.Counter()
    variable_prefix_counts: collections.Counter[str] = collections.Counter()
    unmatched: list[list[int]] = []
    kalmanson_core: list[dict[str, Any]] = []
    for clause in core_clauses:
        canonical = tuple(sorted(clause))
        blocks = source_blocks.get(canonical)
        if not blocks:
            unmatched.append(list(clause))
            continue
        for block in blocks:
            block_counts[block] += 1
        for literal in clause:
            variable_prefix_counts[prefix(cnf.names[abs(literal)])] += 1
        if "verified_kalmanson_order_schema_cut" in blocks:
            matches = schema_clauses.get(canonical, [])
            kalmanson_core.append(
                {
                    "clause": list(clause),
                    "named_literals": [
                        ("not " if literal < 0 else "") + cnf.names[abs(literal)]
                        for literal in clause
                    ],
                    "schema_matches": matches,
                }
            )

    schema_counts: collections.Counter[int] = collections.Counter()
    for clause in kalmanson_core:
        for match in clause["schema_matches"]:
            schema_counts[match["schema_index"]] += 1

    payload = {
        "schema": "p97-aligned-p5-compact-drat-core-map-v1",
        "epistemic_status": "EXACT MAP OF DRAT-TRIM CORE TO THE GENERATED CNF",
        "compact_formula_clause_count": len(compact_clauses),
        "drat_trim_core_clause_count": len(core_clauses),
        "matched_core_clause_count": len(core_clauses) - len(unmatched),
        "unmatched_core_clause_count": len(unmatched),
        "block_counts": dict(sorted(block_counts.items())),
        "literal_occurrence_counts_by_variable_family": dict(
            sorted(variable_prefix_counts.items())
        ),
        "kalmanson_core_clause_count": len(kalmanson_core),
        "kalmanson_core_clause_count_by_schema": {
            str(index): count for index, count in sorted(schema_counts.items())
        },
        "kalmanson_core_clauses": kalmanson_core,
        "kept_kalmanson_schema_indices": list(KEEP_SCHEMAS),
        "claim_limit": (
            "Core membership is exact for the checked CNF proof.  It does not "
            "prove source-to-CNF faithfulness or a Lean occurrence theorem."
        ),
    }
    OUTPUT_PATH.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                key: payload[key]
                for key in (
                    "compact_formula_clause_count",
                    "drat_trim_core_clause_count",
                    "matched_core_clause_count",
                    "unmatched_core_clause_count",
                    "block_counts",
                    "kalmanson_core_clause_count",
                    "kalmanson_core_clause_count_by_schema",
                )
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
