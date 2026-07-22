#!/usr/bin/env python3
"""Run the corrected n=11 outer with source-indexed U5 signed-schema cuts.

This is a bounded finite CEGAR driver.  A SAT table is matched against all
translated class schemas.  One normalized schema orbit is then added to the
CNF, preferring the smallest active-role pattern.  The run stops fail-closed
on a solver timeout, on its schema budget, on verified bank-clean SAT, or on
UNSAT.  It never promotes an n=11 verdict to arbitrary carrier cardinality.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import sys
import time
from pathlib import Path
from typing import Any


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def schema_key(record: dict[str, Any]) -> tuple[Any, ...]:
    return (
        int(record["role_count"]),
        tuple(tuple(map(int, atom)) for atom in record["positive_memberships"]),
        tuple(tuple(map(int, atom)) for atom in record["negative_memberships"]),
    )


def add_schema_orbit(cnf, member, n: int, record: dict[str, Any]) -> int:
    k, positive, negative = schema_key(record)
    if k > n:
        return 0
    count = 0
    for mapping in itertools.permutations(range(n), k):
        clause = [
            -member[mapping[center], mapping[point]]
            for center, point in positive
        ]
        clause.extend(
            member[mapping[center], mapping[point]]
            for center, point in negative
        )
        cnf.add("general_n_u5_signed_schema_cut", clause)
        count += 1
    return count


def choose_cut(match_payload: dict[str, Any], already: set[int]) -> int | None:
    candidates = [
        item for item in match_payload["matches"] if int(item["schema_index"]) not in already
    ]
    if not candidates:
        return None
    chosen = min(
        candidates,
        key=lambda item: (
            int(item["role_count"]),
            len(item["positive_memberships"]) + len(item["negative_memberships"]),
            int(item["schema_index"]),
        ),
    )
    return int(chosen["schema_index"])


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base-encoder", required=True, type=Path)
    parser.add_argument("--base-bank", required=True, type=Path)
    parser.add_argument("--catalog", required=True, type=Path)
    parser.add_argument("--matcher", required=True, type=Path)
    parser.add_argument("--run-dir", required=True, type=Path)
    parser.add_argument("--max-new-schemas", type=int, default=12)
    parser.add_argument("--timeout-seconds", type=int, default=600)
    parser.add_argument("--seed-schema-index", action="append", type=int, default=[])
    parser.add_argument(
        "--emit-drat",
        action="store_true",
        help="write a DRAT proof (use only when rerunning a final UNSAT instance)",
    )
    parser.add_argument(
        "--retain-cnf",
        action="store_true",
        help="retain generated DIMACS after the run (off by default)",
    )
    parser.add_argument("--cadical", default="cadical")
    args = parser.parse_args()

    if args.max_new_schemas <= 0 or args.timeout_seconds <= 0:
        parser.error("budgets must be positive")
    base = load_module("u5_schema_base_encoder", args.base_encoder)
    matcher = load_module("u5_schema_matcher", args.matcher)
    catalog = json.loads(args.catalog.read_text(encoding="utf-8"))
    records = catalog["schemas"]
    selected: list[int] = []
    for index in args.seed_schema_index:
        if not 0 <= index < len(records):
            parser.error(f"seed schema index out of range: {index}")
        if index not in selected:
            selected.append(index)

    args.run_dir.mkdir(parents=True, exist_ok=True)
    iterations: list[dict[str, Any]] = []
    started = time.monotonic()
    terminal = "NEW_SCHEMA_LIMIT"

    for iteration in range(args.max_new_schemas + 1):
        cnf, metadata = base.encode(11, 1, args.base_bank)
        member = {
            (center, point): cnf.ids[f"m_{center}_{point}"]
            for center in range(11)
            for point in range(11)
        }
        embedding_counts: dict[str, int] = {}
        for index in selected:
            embedding_counts[str(index)] = add_schema_orbit(cnf, member, 11, records[index])
        metadata.update(
            {
                "u5_catalog": str(args.catalog),
                "u5_catalog_digest": catalog["catalog_digest"],
                "u5_selected_schema_indices": selected,
                "u5_schema_embedding_counts": embedding_counts,
                "u5_schema_embedding_count": sum(embedding_counts.values()),
                "variable_count": len(cnf.names) - 1,
                "clause_count": len(cnf.clauses),
                "clause_block_counts": dict(sorted(cnf.block_counts.items())),
            }
        )

        stem = args.run_dir / f"iteration_{iteration:03d}"
        cnf_path = stem.with_suffix(".cnf")
        proof_path = stem.with_suffix(".drat") if args.emit_drat else None
        result_path = stem.with_suffix(".result.json")
        log_path = stem.with_suffix(".cadical.log")
        match_path = stem.with_suffix(".match.json")
        cnf.write_dimacs(cnf_path, metadata)
        try:
            solver_result, stdout, stderr = base.solve(
                cnf, cnf_path, metadata, proof_path, args.timeout_seconds, args.cadical
            )
        except BaseException:
            # An interrupted discovery run has no epistemic result.  Do not
            # strand a large DIMACS or partial proof as if it were evidence.
            if not args.retain_cnf:
                cnf_path.unlink(missing_ok=True)
            if proof_path is not None:
                proof_path.unlink(missing_ok=True)
            raise
        if proof_path is not None and solver_result["solver_status"] != "UNSAT":
            proof_path.unlink(missing_ok=True)
            proof_path = None
        result = {**metadata, "cnf_path": str(cnf_path), **solver_result}
        result_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
        log_path.write_text(stdout + stderr, encoding="utf-8")

        record: dict[str, Any] = {
            "iteration": iteration,
            "selected_schema_indices": list(selected),
            "schema_embedding_count": sum(embedding_counts.values()),
            "clause_count": len(cnf.clauses),
            "solver_status": solver_result["solver_status"],
            "solver_elapsed_seconds": solver_result["solver_elapsed_seconds"],
            "result": str(result_path),
            "cnf": str(cnf_path),
            "proof": str(proof_path) if proof_path is not None else None,
            "solver_log": str(log_path),
        }
        iterations.append(record)

        if solver_result["solver_status"] == "UNSAT":
            terminal = "UNSAT"
            break
        if solver_result["solver_status"] != "SAT":
            terminal = "OUTER_UNKNOWN"
            break

        rows = {
            int(center): set(map(int, support))
            for center, support in result["rows"].items()
        }
        matches: list[dict[str, Any]] = []
        for index, schema in enumerate(records):
            k, positive, negative = schema_key(schema)
            found = next(matcher.embeddings(rows, k, positive, negative), None)
            if found is not None:
                matches.append(
                    {
                        "schema_index": index,
                        "role_count": k,
                        "positive_memberships": [list(atom) for atom in positive],
                        "negative_memberships": [list(atom) for atom in negative],
                        "embedding": list(found),
                        "consumers": [item["fq_name"] for item in schema["consumers"]],
                    }
                )
        match_payload = {
            "schema": "p97-general-n-u5-signed-row-schema-match-v1",
            "status": "BANK_MATCH" if matches else "NO_BANK_MATCH",
            "source": str(result_path),
            "catalog": str(args.catalog),
            "matched_schema_count": len(matches),
            "matches": matches,
        }
        match_path.write_text(
            json.dumps(match_payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        record["match"] = str(match_path)
        record["matched_schema_count"] = len(matches)

        if not matches:
            terminal = "SAT_BANK_CLEAN"
            break
        next_index = choose_cut(match_payload, set(selected))
        if next_index is None:
            raise RuntimeError("SAT model violates an already-installed schema cut")
        record["next_schema_index"] = next_index
        selected.append(next_index)
    else:
        terminal = "NEW_SCHEMA_LIMIT"

    if not args.retain_cnf:
        for record in iterations:
            Path(record["cnf"]).unlink(missing_ok=True)
            record["cnf_retained"] = False
            result_file = Path(record["result"])
            saved_result = json.loads(result_file.read_text(encoding="utf-8"))
            saved_result["cnf_retained"] = False
            result_file.write_text(
                json.dumps(saved_result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
            )

    manifest = {
        "schema": "p97-general-n-u5-n11-schema-cegar-v1",
        "epistemic_status": "EXACT_WITHIN_CORRECTED_N11_STRUCTURAL_OUTER",
        "claim_scope": (
            "Finite n=11 selected-row/blocker/Kalmanson outer only; not arbitrary-cardinality "
            "coverage and not a live-parent Lean theorem."
        ),
        "terminal_status": terminal,
        "n": 11,
        "second_apex": 1,
        "base_encoder": str(args.base_encoder),
        "base_bank": str(args.base_bank),
        "catalog": str(args.catalog),
        "catalog_schema_count": len(records),
        "emit_drat": args.emit_drat,
        "retain_cnf": args.retain_cnf,
        "selected_schema_indices": selected,
        "selected_schema_count": len(selected),
        "iterations": iterations,
        "elapsed_seconds": time.monotonic() - started,
    }
    manifest_path = args.run_dir / "manifest.json"
    manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(
        json.dumps(
            {
                "terminal_status": terminal,
                "selected_schema_count": len(selected),
                "iterations": len(iterations),
                "manifest": str(manifest_path),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
