#!/usr/bin/env python3
"""Audit the compact metric-schema bank under the full cyclic boundary action.

The historical transporter uses increasing embeddings plus one reflection, but
the Lean consumers and convex-polygon hypotheses are cyclic.  This checker
rotates every compressed schema before embedding, independently replays each
rotated incidence pattern against the full strict Kalmanson system, and tests
whether new cyclic applications subsume checkpoint cuts.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter
from pathlib import Path

import z3


N = 14


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def edge(left: int, right: int) -> tuple[int, int]:
    return tuple(sorted((left, right)))


def dist(
    table: dict[tuple[int, int], z3.ArithRef], left: int, right: int
) -> z3.ArithRef:
    if left == right:
        return z3.RealVal(0)
    return table[edge(left, right)]


def rotate_schema(
    vertex_count: int,
    schema: tuple[tuple[int, int], ...],
    sign: int,
    shift: int,
) -> tuple[tuple[int, int], ...]:
    return tuple(sorted(
        (
            (sign * center + shift) % vertex_count,
            (sign * point + shift) % vertex_count,
        )
        for center, point in schema
    ))


def exact_full_kalmanson_unsat(
    vertex_count: int, schema: tuple[tuple[int, int], ...]
) -> bool:
    table = {
        (left, right): z3.Real(f"d_{left}_{right}")
        for left, right in itertools.combinations(range(vertex_count), 2)
    }
    solver = z3.Solver()
    for a, b, c, d in itertools.combinations(range(vertex_count), 4):
        diagonal = dist(table, a, c) + dist(table, b, d)
        solver.add(
            diagonal >= dist(table, a, b) + dist(table, c, d) + 1,
            diagonal >= dist(table, a, d) + dist(table, b, c) + 1,
        )
    rows: dict[int, list[int]] = {}
    for center, point in schema:
        rows.setdefault(center, []).append(point)
    for center, support in rows.items():
        reference = support[0]
        for point in support[1:]:
            solver.add(dist(table, center, point) == dist(table, center, reference))
    status = solver.check()
    if status == z3.unknown:
        raise AssertionError(f"exact replay returned unknown: {solver.reason_unknown()}")
    return status == z3.unsat


def application_bits(
    vertex_count: int,
    schema: tuple[tuple[int, int], ...],
) -> set[int]:
    applications: set[int] = set()
    for embedding in itertools.combinations(range(N), vertex_count):
        bits = 0
        for center, point in schema:
            bits |= 1 << (N * embedding[center] + embedding[point])
        applications.add(bits)
    return applications


def cut_bits(cut: dict[str, object]) -> int:
    result = 0
    for center, point in cut["required_memberships"]:  # type: ignore[misc]
        result |= 1 << (N * int(center) + int(point))
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bank", type=Path, required=True)
    parser.add_argument("--checkpoint", type=Path, action="append", default=[])
    parser.add_argument("--max-vertices", type=int, default=8)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--output-bank", type=Path)
    args = parser.parse_args()

    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    linear_schemas: set[tuple[int, tuple[tuple[int, int], ...]]] = set()
    cyclic_schemas: set[tuple[int, tuple[tuple[int, int], ...]]] = set()
    cyclic_sources: dict[
        tuple[int, tuple[tuple[int, int], ...]],
        list[dict[str, int]],
    ] = {}
    for schema_index, record in enumerate(bank["schemas"]):
        vertex_count = int(record["core_vertex_count"])
        if vertex_count > args.max_vertices:
            continue
        schema = tuple(sorted(tuple(pair) for pair in record["order_schema"]))
        linear_schemas.add((vertex_count, schema))
        linear_schemas.add((
            vertex_count,
            rotate_schema(vertex_count, schema, -1, vertex_count - 1),
        ))
        for sign in (1, -1):
            for shift in range(vertex_count):
                key = (
                    vertex_count,
                    rotate_schema(vertex_count, schema, sign, shift),
                )
                cyclic_schemas.add(key)
                cyclic_sources.setdefault(key, []).append({
                    "source_schema_index": schema_index,
                    "sign": sign,
                    "shift": shift,
                })

    invalid = [
        {"core_vertex_count": vertex_count, "order_schema": schema}
        for vertex_count, schema in sorted(cyclic_schemas)
        if not exact_full_kalmanson_unsat(vertex_count, schema)
    ]
    if invalid:
        raise AssertionError(f"cyclic schema failed exact replay: {invalid[:3]}")

    linear_applications: set[int] = set()
    for vertex_count, schema in linear_schemas:
        linear_applications.update(application_bits(vertex_count, schema))
    cyclic_applications: set[int] = set()
    for vertex_count, schema in cyclic_schemas:
        cyclic_applications.update(application_bits(vertex_count, schema))
    new_cyclic_applications = cyclic_applications - linear_applications

    checkpoint_results = []
    for path in args.checkpoint:
        cuts = [
            json.loads(line)
            for line in path.read_text(encoding="utf-8").splitlines()
            if line
        ]
        records = []
        for cut in cuts:
            bits = cut_bits(cut)
            linear_hit = any(
                application & bits == application
                for application in linear_applications
            )
            cyclic_hit = any(
                application & bits == application
                for application in cyclic_applications
            )
            new_cyclic_hit = any(
                application & bits == application
                for application in new_cyclic_applications
            )
            records.append({
                "cut_id": cut["id"],
                "conditioned_shell": cut.get("conditioned_shell") is not None,
                "required_membership_count": len(cut["required_memberships"]),
                "linear_application_subsumes_cut": linear_hit,
                "cyclic_application_subsumes_cut": cyclic_hit,
                "new_cyclic_application_subsumes_cut": new_cyclic_hit,
            })
        checkpoint_results.append({
            "path": str(path),
            "sha256": sha256(path),
            "cut_count": len(cuts),
            "linear_subsumed_count": sum(
                record["linear_application_subsumes_cut"] for record in records
            ),
            "cyclic_subsumed_count": sum(
                record["cyclic_application_subsumes_cut"] for record in records
            ),
            "new_cyclic_subsumed_count": sum(
                record["new_cyclic_application_subsumes_cut"] for record in records
            ),
            "cyclic_subsumed_histogram": dict(sorted(Counter(
                record["required_membership_count"]
                for record in records
                if record["cyclic_application_subsumes_cut"]
            ).items())),
            "records": records,
        })

    payload = {
        "schema": "p97-exact6-cyclic-schema-coverage-audit-v1",
        "epistemic_status": "EXACT_QF_LRA_SCHEMA_AUDIT_NOT_LIVE_LEAN_CLOSURE",
        "bank": {
            "path": str(args.bank),
            "sha256": sha256(args.bank),
            "max_vertices": args.max_vertices,
        },
        "linear_schema_count": len(linear_schemas),
        "cyclic_dihedral_schema_count": len(cyclic_schemas),
        "all_cyclic_schemas_exact_full_kalmanson_unsat": True,
        "linear_application_count": len(linear_applications),
        "cyclic_dihedral_application_count": len(cyclic_applications),
        "new_cyclic_dihedral_application_count": len(new_cyclic_applications),
        "checkpoints": checkpoint_results,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    output_bank_sha256 = None
    if args.output_bank is not None:
        records = []
        for key in sorted(cyclic_schemas):
            vertex_count, schema = key
            reflected = rotate_schema(vertex_count, schema, -1, vertex_count - 1)
            per_record_applications = application_bits(vertex_count, schema)
            per_record_applications.update(application_bits(vertex_count, reflected))
            records.append({
                "core_vertex_count": vertex_count,
                "order_schema": [list(pair) for pair in schema],
                "complete_application_count": len(per_record_applications),
                "provenance": [{
                    "cyclic_closure_bank": str(args.bank),
                    "cyclic_closure_bank_sha256": sha256(args.bank),
                    "source_transforms": cyclic_sources[key],
                    "exact_full_kalmanson_unsat_replayed": True,
                    "generalization": (
                        "cyclic order embeddings and order reversal"
                    ),
                }],
            })
        closed_bank = dict(bank)
        closed_bank["sources"] = [
            *bank.get("sources", []),
            {"path": str(args.bank), "sha256": sha256(args.bank)},
        ]
        closed_bank["schemas"] = records
        closed_bank["unique_schema_count"] = len(records)
        closed_bank["compact_schema_count_k_le_8"] = len(records)
        closed_bank["cyclic_closure"] = {
            "schema": "p97-exact6-cyclic-compact-schema-closure-v1",
            "epistemic_status": (
                "EXACT_QF_LRA_SCHEMA_BANK_NOT_LIVE_LEAN_CLOSURE"
            ),
            "source_schema_count": len(bank["schemas"]),
            "closed_schema_count": len(records),
            "application_count": len(cyclic_applications),
            "new_application_count": len(new_cyclic_applications),
            "all_schemas_exact_full_kalmanson_unsat_replayed": True,
        }
        args.output_bank.parent.mkdir(parents=True, exist_ok=True)
        args.output_bank.write_text(
            json.dumps(closed_bank, indent=2, sort_keys=True) + "\n"
        )
        output_bank_sha256 = sha256(args.output_bank)
    print(json.dumps({
        "status": "CYCLIC_SCHEMA_COVERAGE_AUDIT_COMPLETE",
        "linear_schema_count": len(linear_schemas),
        "cyclic_dihedral_schema_count": len(cyclic_schemas),
        "linear_application_count": len(linear_applications),
        "cyclic_dihedral_application_count": len(cyclic_applications),
        "new_cyclic_dihedral_application_count": len(new_cyclic_applications),
        "checkpoint_summaries": [
            {
                key: value for key, value in checkpoint.items()
                if key != "records"
            }
            for checkpoint in checkpoint_results
        ],
        "output": str(args.output),
        "output_sha256": sha256(args.output),
        "output_bank": None if args.output_bank is None else str(args.output_bank),
        "output_bank_sha256": output_bank_sha256,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
