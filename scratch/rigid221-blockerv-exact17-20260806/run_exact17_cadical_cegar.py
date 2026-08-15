#!/usr/bin/env python3
"""Run the exact-17 Boolean/theorem-bank CEGAR loop with CaDiCaL.

CaDiCaL proposes complete Boolean row systems.  Every SAT assignment is
rechecked against the emitted CNF, then rejected only by an already-formalized
metric core or by the exact-rational linear replay.  A SAT linear replay is a
terminal survivor, not a P97 counterexample.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
from pathlib import Path

import exact17_fullcover_cegar as cegar
import export_exact17_boolean_cnf as exporter
from analyze_exact17_boolean_model import (
    clause_satisfied,
    parse_cadical_model,
    rows_from_assignment,
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def pattern_clause(
    pattern: tuple[cegar.MetricRow, ...],
    var: dict[tuple[int, int], int],
) -> exporter.Clause:
    return tuple(
        -var[row.center, point]
        for row in pattern
        for point in row.support
    )


def pattern_key(pattern: tuple[cegar.MetricRow, ...]) -> str:
    return json.dumps(
        cegar.row_payload(pattern), sort_keys=True, separators=(",", ":")
    )


def write_checkpoint(path: Path, payload: dict) -> None:
    temporary = path.with_suffix(path.suffix + ".new")
    with temporary.open("w") as handle:
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
    temporary.replace(path)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--work-dir", type=Path, required=True)
    parser.add_argument("--initial-patterns-glob")
    parser.add_argument("--max-iterations", type=int, default=1_000)
    parser.add_argument("--solver-timeout-seconds", type=int, default=600)
    parser.add_argument("--metric-timeout-ms", type=int, default=30_000)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--drat-trim", default="drat-trim")
    args = parser.parse_args()

    args.work_dir.mkdir(parents=True, exist_ok=True)
    cnf_path = args.work_dir / "current.cnf"
    log_path = args.work_dir / "current-cadical.log"
    drat_path = args.work_dir / "terminal.drat"
    checkpoint_path = args.work_dir / "checkpoint.json"
    journal_path = args.work_dir / "journal.jsonl"

    var = exporter.variable_map()
    initial_patterns = exporter.load_initial_patterns(args.initial_patterns_glob)
    base_clauses, clause_blocks = exporter.build_clauses(var, initial_patterns)
    learned_patterns: list[tuple[cegar.MetricRow, ...]] = []
    known_patterns = {pattern_key(pattern) for pattern in initial_patterns}
    records: list[dict] = []
    terminal = "iteration_limit"

    for iteration in range(args.max_iterations):
        learned_clauses = [pattern_clause(pattern, var) for pattern in learned_patterns]
        clauses = base_clauses + learned_clauses
        cnf_sha = exporter.write_dimacs(cnf_path, len(var), clauses)
        with log_path.open("w") as log_handle:
            result = subprocess.run(
                [
                    args.cadical,
                    f"--seed={args.seed}",
                    "--shuffle=true",
                    "-t",
                    str(args.solver_timeout_seconds),
                    str(cnf_path),
                    str(drat_path),
                ],
                stdout=log_handle,
                stderr=subprocess.STDOUT,
                check=False,
                timeout=args.solver_timeout_seconds + 30,
            )

        record: dict = {
            "iteration": iteration,
            "clause_count": len(clauses),
            "cnf_sha256": cnf_sha,
            "solver_exit_code": result.returncode,
        }
        if result.returncode == 20:
            verify = subprocess.run(
                [args.drat_trim, str(cnf_path), str(drat_path)],
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                check=False,
                text=True,
                timeout=args.solver_timeout_seconds + 30,
            )
            record.update({
                "classification": "boolean_unsat",
                "drat_sha256": sha256(drat_path),
                "drat_trim_exit_code": verify.returncode,
                "drat_trim_tail": verify.stdout.splitlines()[-12:],
            })
            if verify.returncode != 0 or "VERIFIED" not in verify.stdout:
                raise RuntimeError("drat-trim did not verify terminal UNSAT proof")
            records.append(record)
            terminal = "authenticated_boolean_unsat"
            break
        if result.returncode != 10:
            record["classification"] = "solver_nonterminal"
            records.append(record)
            terminal = "solver_nonterminal"
            break

        assignment = parse_cadical_model(log_path, len(var))
        violated = [
            index for index, clause in enumerate(clauses)
            if not clause_satisfied(clause, assignment)
        ]
        if violated:
            raise RuntimeError(f"CaDiCaL model violates clauses {violated[:20]}")
        rows = rows_from_assignment(assignment, var)
        bank_hits = cegar.producer_bank.scan_all_formalized_cores(
            rows, 17, cegar.ORDER
        )
        record["rows"] = cegar.row_payload(rows)
        record["bank_hit_count"] = len(bank_hits)

        if bank_hits:
            minimized = cegar.minimize_bank_witness(rows, bank_hits[0])
            key = pattern_key(minimized)
            clause = pattern_clause(minimized, var)
            if key in known_patterns:
                raise RuntimeError("bank minimizer returned an already-learned pattern")
            if clause_satisfied(clause, assignment):
                raise RuntimeError("bank clause does not reject its proposing model")
            known_patterns.add(key)
            learned_patterns.append(minimized)
            record.update({
                "classification": "bank_rejected",
                "bank_hit": bank_hits[0],
                "learned_rows": cegar.row_payload(minimized),
            })
        else:
            verdict, linear_core = cegar.linear_replay_core(
                rows, args.metric_timeout_ms
            )
            record["linear_verdict"] = verdict
            if verdict == "unsat":
                assert linear_core is not None
                key = pattern_key(linear_core)
                clause = pattern_clause(linear_core, var)
                if key in known_patterns:
                    raise RuntimeError("linear replay returned an already-learned core")
                if clause_satisfied(clause, assignment):
                    raise RuntimeError("linear clause does not reject its proposing model")
                known_patterns.add(key)
                learned_patterns.append(linear_core)
                record.update({
                    "classification": "linear_unsat",
                    "learned_rows": cegar.row_payload(linear_core),
                })
            else:
                record["classification"] = f"linear_{verdict}_survivor"
                records.append(record)
                terminal = record["classification"]
                break

        records.append(record)
        with journal_path.open("a") as handle:
            handle.write(json.dumps(record, sort_keys=True) + "\n")
        write_checkpoint(checkpoint_path, {
            "schema": "rigid221-exact17-cadical-cegar/v1",
            "terminal": "running",
            "clause_blocks": clause_blocks,
            "initial_pattern_count": len(initial_patterns),
            "learned_pattern_count": len(learned_patterns),
            "learned_patterns": [
                cegar.row_payload(pattern) for pattern in learned_patterns
            ],
            "seed": args.seed,
            "records": records,
        })
        print(json.dumps({
            "iteration": iteration,
            "classification": record["classification"],
            "bank_stage": (
                record.get("bank_hit", {}).get("stage")
            ),
            "learned_pattern_count": len(learned_patterns),
        }, sort_keys=True), flush=True)

    payload = {
        "schema": "rigid221-exact17-cadical-cegar/v1",
        "terminal": terminal,
        "clause_blocks": clause_blocks,
        "initial_pattern_count": len(initial_patterns),
        "learned_pattern_count": len(learned_patterns),
        "learned_patterns": [
            cegar.row_payload(pattern) for pattern in learned_patterns
        ],
        "seed": args.seed,
        "records": records,
        "terminal_cnf": str(cnf_path),
        "terminal_cnf_sha256": sha256(cnf_path),
    }
    write_checkpoint(checkpoint_path, payload)
    print(json.dumps({
        "terminal": terminal,
        "iterations": len(records),
        "learned_pattern_count": len(learned_patterns),
        "checkpoint": str(checkpoint_path),
    }, sort_keys=True))
    return 0 if terminal not in {"solver_nonterminal", "iteration_limit"} else 2


if __name__ == "__main__":
    raise SystemExit(main())
