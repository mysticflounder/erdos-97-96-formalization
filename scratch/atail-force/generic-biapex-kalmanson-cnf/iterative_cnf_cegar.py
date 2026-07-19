#!/usr/bin/env python3
"""Sequential fail-closed CNF/full-LRA CEGAR with atomic checkpoints."""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
import time
from datetime import datetime, timezone
from pathlib import Path


HERE = Path(__file__).resolve().parent
SEARCH = HERE.parent / "generic-biapex-kalmanson-search"
EXACT_OUTER = HERE / "exact_outer_cnf.py"
VERIFY_OUTER = HERE / "verify_outer_result.py"
FULL_LRA = HERE / "full_lra_fixed_check.py"
VERIFY_FARKAS = HERE / "verify_farkas_core.py"
MERGE_BANK = SEARCH / "merge_schema_bank.py"


def utc_now() -> str:
    return datetime.now(timezone.utc).isoformat()


def atomic_json(path: Path, payload: dict[str, object]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temporary.replace(path)


def load_json(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def remaining_seconds(deadline: float) -> float:
    return deadline - time.monotonic()


def run_command(
    command: list[str],
    *,
    timeout_seconds: float,
    log_path: Path,
) -> subprocess.CompletedProcess[str]:
    started = time.monotonic()
    completed = subprocess.run(
        command,
        capture_output=True,
        text=True,
        timeout=max(1.0, timeout_seconds),
        check=False,
    )
    log_path.write_text(
        json.dumps(
            {
                "command": command,
                "returncode": completed.returncode,
                "elapsed_seconds": time.monotonic() - started,
            },
            sort_keys=True,
        )
        + "\n--- stdout ---\n"
        + completed.stdout
        + "\n--- stderr ---\n"
        + completed.stderr,
        encoding="utf-8",
    )
    return completed


def bank_key(record: dict[str, object]) -> tuple[int, tuple[tuple[int, int], ...]]:
    return (
        int(record["core_vertex_count"]),
        tuple(tuple(int(x) for x in pair) for pair in record["order_schema"]),
    )


def terminate(
    manifest_path: Path,
    manifest: dict[str, object],
    status: str,
    reason: str | None = None,
) -> None:
    manifest["terminal_status"] = status
    manifest["current_stage"] = "TERMINAL"
    manifest["finished_at"] = utc_now()
    if reason is not None:
        manifest["terminal_reason"] = reason
    atomic_json(manifest_path, manifest)
    print(json.dumps({"terminal_status": status, "reason": reason}, sort_keys=True), flush=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--initial-bank", required=True, type=Path)
    parser.add_argument("--run-dir", required=True, type=Path)
    parser.add_argument("--n", type=int, default=11)
    parser.add_argument("--second-apex", type=int, default=1)
    parser.add_argument("--wall-seconds", type=float, default=900.0)
    parser.add_argument("--max-new-schemas", type=int, default=30)
    parser.add_argument("--outer-timeout-seconds", type=int, default=300)
    parser.add_argument("--metric-timeout-ms", type=int, default=60_000)
    args = parser.parse_args()
    if args.wall_seconds <= 0 or args.max_new_schemas <= 0:
        parser.error("budgets must be positive")
    if not 0 < args.second_apex < args.n:
        parser.error("invalid second apex")

    args.run_dir.mkdir(parents=True, exist_ok=True)
    manifest_path = args.run_dir / "manifest.json"
    lock_path = args.run_dir / ".driver.lock"
    try:
        lock_fd = os.open(lock_path, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o644)
    except FileExistsError:
        print(json.dumps({"terminal_status": "LOCKED", "lock": str(lock_path)}), flush=True)
        return 2
    os.write(lock_fd, f"pid={os.getpid()} started={utc_now()}\n".encode())
    os.close(lock_fd)

    started = time.monotonic()
    deadline = started + args.wall_seconds
    initial_bank = load_json(args.initial_bank)
    if initial_bank.get("schema") != "p97-whole-carrier-kalmanson-transported-schema-bank-v1":
        raise ValueError("unexpected initial bank schema")
    manifest: dict[str, object] = {
        "schema": "p97-direct-cnf-full-lra-cegar-manifest-v1",
        "epistemic_status": "BOUNDED_EXACT_SOLVER_CEGAR_NOT_LEAN_PROOF",
        "started_at": utc_now(),
        "initial_bank": str(args.initial_bank),
        "initial_schema_count": int(initial_bank["schema_count"]),
        "current_bank": str(args.initial_bank),
        "current_schema_count": int(initial_bank["schema_count"]),
        "new_schema_count": 0,
        "n": args.n,
        "second_apex": args.second_apex,
        "wall_seconds": args.wall_seconds,
        "max_new_schemas": args.max_new_schemas,
        "outer_timeout_seconds": args.outer_timeout_seconds,
        "metric_timeout_ms": args.metric_timeout_ms,
        "terminal_status": "RUNNING",
        "current_stage": "INITIALIZED",
        "iterations": [],
    }
    atomic_json(manifest_path, manifest)

    try:
        for iteration_number in range(1, args.max_new_schemas + 1):
            if remaining_seconds(deadline) <= 5:
                terminate(manifest_path, manifest, "WALL_BUDGET", "budget before outer solve")
                return 0
            stem = f"iteration_{iteration_number:03d}"
            iteration: dict[str, object] = {
                "iteration": iteration_number,
                "started_at": utc_now(),
                "input_bank": manifest["current_bank"],
                "input_schema_count": manifest["current_schema_count"],
                "status": "RUNNING",
            }
            manifest["iterations"].append(iteration)
            manifest["current_stage"] = f"{stem}:OUTER"
            atomic_json(manifest_path, manifest)

            cnf_path = args.run_dir / f"{stem}.cnf"
            outer_result_path = args.run_dir / f"{stem}.outer.json"
            outer_solver_log = args.run_dir / f"{stem}.cadical.log"
            proof_path = args.run_dir / f"{stem}.drat"
            outer_driver_log = args.run_dir / f"{stem}.outer_driver.log"
            outer_limit = max(1, min(args.outer_timeout_seconds, int(remaining_seconds(deadline) - 5)))
            outer_command = [
                sys.executable,
                str(EXACT_OUTER),
                "--n",
                str(args.n),
                "--second-apex",
                str(args.second_apex),
                "--preload-bank",
                str(manifest["current_bank"]),
                "--cnf",
                str(cnf_path),
                "--result",
                str(outer_result_path),
                "--solver-log",
                str(outer_solver_log),
                "--proof",
                str(proof_path),
                "--timeout-seconds",
                str(outer_limit),
            ]
            try:
                outer_process = run_command(
                    outer_command,
                    timeout_seconds=min(remaining_seconds(deadline), outer_limit + 35),
                    log_path=outer_driver_log,
                )
            except subprocess.TimeoutExpired:
                iteration["status"] = "OUTER_SUBPROCESS_TIMEOUT"
                terminate(manifest_path, manifest, "OUTER_UNKNOWN", "outer subprocess timeout")
                return 0
            if outer_process.returncode != 0 or not outer_result_path.exists():
                iteration["status"] = "OUTER_DRIVER_FAILURE"
                terminate(
                    manifest_path,
                    manifest,
                    "VERIFICATION_FAILURE",
                    f"outer driver return code {outer_process.returncode}",
                )
                return 0
            outer = load_json(outer_result_path)
            iteration.update(
                {
                    "outer_result": str(outer_result_path),
                    "outer_status": outer.get("solver_status"),
                    "outer_elapsed_seconds": outer.get("solver_elapsed_seconds"),
                    "outer_variable_count": outer.get("variable_count"),
                    "outer_clause_count": outer.get("clause_count"),
                }
            )
            atomic_json(manifest_path, manifest)

            if outer.get("solver_status") == "UNSAT":
                manifest["current_stage"] = f"{stem}:DRAT_VERIFY"
                atomic_json(manifest_path, manifest)
                drat_log = args.run_dir / f"{stem}.drat_trim.log"
                try:
                    drat = run_command(
                        ["drat-trim", str(cnf_path), str(proof_path)],
                        timeout_seconds=max(1, remaining_seconds(deadline)),
                        log_path=drat_log,
                    )
                except subprocess.TimeoutExpired:
                    iteration["status"] = "DRAT_TIMEOUT"
                    terminate(manifest_path, manifest, "WALL_BUDGET", "DRAT verification timeout")
                    return 0
                verified = drat.returncode == 0 and "s VERIFIED" in drat.stdout
                iteration.update({"drat_log": str(drat_log), "drat_verified": verified})
                if not verified:
                    iteration["status"] = "DRAT_FAILURE"
                    terminate(manifest_path, manifest, "VERIFICATION_FAILURE", "outer UNSAT DRAT failed")
                    return 0
                iteration["status"] = "OUTER_UNSAT_CERTIFIED"
                iteration["finished_at"] = utc_now()
                terminate(manifest_path, manifest, "OUTER_UNSAT_CERTIFIED")
                return 0
            if outer.get("solver_status") != "SAT":
                iteration["status"] = "OUTER_UNKNOWN"
                terminate(
                    manifest_path,
                    manifest,
                    "OUTER_UNKNOWN",
                    f"CaDiCaL status {outer.get('solver_status')}",
                )
                return 0

            # Independent semantic expansion of every structural constraint
            # and every schema embedding.
            manifest["current_stage"] = f"{stem}:SEMANTIC_VERIFY"
            atomic_json(manifest_path, manifest)
            outer_verify_path = args.run_dir / f"{stem}.outer.verify.json"
            outer_verify_log = args.run_dir / f"{stem}.outer_verify.log"
            verify_process = run_command(
                [
                    sys.executable,
                    str(VERIFY_OUTER),
                    str(outer_result_path),
                    str(manifest["current_bank"]),
                    "--output",
                    str(outer_verify_path),
                ],
                timeout_seconds=max(1, remaining_seconds(deadline)),
                log_path=outer_verify_log,
            )
            if verify_process.returncode != 0 or not outer_verify_path.exists():
                iteration["status"] = "SEMANTIC_VERIFY_FAILURE"
                terminate(manifest_path, manifest, "VERIFICATION_FAILURE", "outer semantic replay failed")
                return 0
            outer_verification = load_json(outer_verify_path)
            if outer_verification.get("status") != "VERIFIED_SAT":
                iteration["status"] = "SEMANTIC_VERIFY_BAD_STATUS"
                terminate(manifest_path, manifest, "VERIFICATION_FAILURE", "unexpected semantic status")
                return 0
            iteration["outer_verification"] = str(outer_verify_path)
            atomic_json(manifest_path, manifest)

            # Exact rational LRA check of every metric/Kalmanson/row equality.
            if remaining_seconds(deadline) <= 5:
                iteration["status"] = "WALL_BUDGET_BEFORE_LRA"
                terminate(manifest_path, manifest, "WALL_BUDGET", "budget before full LRA")
                return 0
            manifest["current_stage"] = f"{stem}:FULL_LRA"
            atomic_json(manifest_path, manifest)
            lra_path = args.run_dir / f"{stem}.full_lra.json"
            lra_log = args.run_dir / f"{stem}.full_lra.log"
            lra_wall = max(1, min(300, int(remaining_seconds(deadline) - 5)))
            lra_process = run_command(
                [
                    sys.executable,
                    str(FULL_LRA),
                    str(outer_result_path),
                    "--timeout-ms",
                    str(min(args.metric_timeout_ms, lra_wall * 1000)),
                    "--wall-seconds",
                    str(lra_wall),
                    "--output",
                    str(lra_path),
                ],
                timeout_seconds=min(remaining_seconds(deadline), lra_wall + 10),
                log_path=lra_log,
            )
            if lra_process.returncode != 0 or not lra_path.exists():
                iteration["status"] = "FULL_LRA_DRIVER_FAILURE"
                terminate(manifest_path, manifest, "VERIFICATION_FAILURE", "full-LRA driver failed")
                return 0
            lra = load_json(lra_path)
            iteration.update(
                {
                    "full_lra_result": str(lra_path),
                    "full_lra_status": lra.get("status"),
                    "full_lra_elapsed_seconds": lra.get("elapsed_seconds"),
                }
            )
            atomic_json(manifest_path, manifest)
            if lra.get("status") == "SAT_VERIFIED_FULL_KALMANSON_METRIC":
                iteration["status"] = "FULL_LRA_SAT_VERIFIED"
                iteration["finished_at"] = utc_now()
                terminate(manifest_path, manifest, "FULL_LRA_SAT_VERIFIED")
                return 0
            if lra.get("status") != "UNSAT_FULL_LRA_FIXED_ROWS":
                iteration["status"] = "FULL_LRA_UNKNOWN"
                terminate(
                    manifest_path,
                    manifest,
                    "FULL_LRA_UNKNOWN",
                    str(lra.get("reason", lra.get("status"))),
                )
                return 0

            # Independently reconstruct, deletion-check, dualize, and exactly
            # replay the rational Farkas identity before accepting a cut.
            manifest["current_stage"] = f"{stem}:FARKAS_VERIFY"
            atomic_json(manifest_path, manifest)
            farkas_path = args.run_dir / f"{stem}.farkas.verify.json"
            farkas_log = args.run_dir / f"{stem}.farkas_verify.log"
            farkas_process = run_command(
                [
                    sys.executable,
                    str(VERIFY_FARKAS),
                    str(lra_path),
                    "--output",
                    str(farkas_path),
                ],
                timeout_seconds=max(1, remaining_seconds(deadline)),
                log_path=farkas_log,
            )
            if farkas_process.returncode != 0 or not farkas_path.exists():
                iteration["status"] = "FARKAS_VERIFY_FAILURE"
                terminate(manifest_path, manifest, "VERIFICATION_FAILURE", "Farkas replay failed")
                return 0
            farkas = load_json(farkas_path)
            if farkas.get("status") != "VERIFIED_EXACT_FARKAS_CORE":
                iteration["status"] = "FARKAS_VERIFY_BAD_STATUS"
                terminate(manifest_path, manifest, "VERIFICATION_FAILURE", "unexpected Farkas status")
                return 0
            iteration.update(
                {
                    "farkas_verification": str(farkas_path),
                    "metric_core_constraint_count": farkas.get("constraint_count"),
                    "farkas_deletion_minimal": farkas.get("deletion_minimal"),
                }
            )

            refinement = lra["refinements"][0]
            new_key = (
                len(refinement["complete_core_vertices"]),
                tuple(tuple(int(x) for x in pair) for pair in refinement["order_schema"]),
            )
            current_bank_path = Path(str(manifest["current_bank"]))
            current_bank = load_json(current_bank_path)
            existing_keys = {bank_key(record) for record in current_bank["schemas"]}
            if new_key in existing_keys:
                iteration.update(
                    {
                        "status": "DUPLICATE_SCHEMA",
                        "new_schema_key": [new_key[0], [list(item) for item in new_key[1]]],
                        "finished_at": utc_now(),
                    }
                )
                terminate(manifest_path, manifest, "DUPLICATE_SCHEMA", "verified core maps to existing cut")
                return 0

            manifest["current_stage"] = f"{stem}:BANK_MERGE"
            atomic_json(manifest_path, manifest)
            next_bank = args.run_dir / f"bank_{iteration_number:03d}.json"
            merge_log = args.run_dir / f"{stem}.merge.log"
            merge_process = run_command(
                [
                    sys.executable,
                    str(MERGE_BANK),
                    str(current_bank_path),
                    str(lra_path),
                    "--output",
                    str(next_bank),
                ],
                timeout_seconds=max(1, remaining_seconds(deadline)),
                log_path=merge_log,
            )
            if merge_process.returncode != 0 or not next_bank.exists():
                iteration["status"] = "BANK_MERGE_FAILURE"
                terminate(manifest_path, manifest, "VERIFICATION_FAILURE", "bank merge failed")
                return 0
            merged = load_json(next_bank)
            merged_keys = {bank_key(record) for record in merged["schemas"]}
            if int(merged["schema_count"]) != int(current_bank["schema_count"]) + 1 or new_key not in merged_keys:
                iteration["status"] = "BANK_POSTCONDITION_FAILURE"
                terminate(manifest_path, manifest, "VERIFICATION_FAILURE", "bank merge postcondition failed")
                return 0
            manifest["current_bank"] = str(next_bank)
            manifest["current_schema_count"] = int(merged["schema_count"])
            manifest["new_schema_count"] = int(manifest["new_schema_count"]) + 1
            iteration.update(
                {
                    "status": "VERIFIED_SCHEMA_BANKED",
                    "new_schema_key": [new_key[0], [list(item) for item in new_key[1]]],
                    "output_bank": str(next_bank),
                    "output_schema_count": int(merged["schema_count"]),
                    "finished_at": utc_now(),
                }
            )
            manifest["current_stage"] = f"{stem}:CHECKPOINTED"
            atomic_json(manifest_path, manifest)
            print(
                json.dumps(
                    {
                        "iteration": iteration_number,
                        "status": iteration["status"],
                        "schema_count": merged["schema_count"],
                        "outer_seconds": iteration["outer_elapsed_seconds"],
                        "lra_seconds": iteration["full_lra_elapsed_seconds"],
                    },
                    sort_keys=True,
                ),
                flush=True,
            )

        terminate(manifest_path, manifest, "NEW_SCHEMA_LIMIT")
        return 0
    except subprocess.TimeoutExpired as error:
        terminate(manifest_path, manifest, "WALL_BUDGET", f"subprocess timeout: {error.cmd}")
        return 0
    except Exception as error:
        terminate(manifest_path, manifest, "VERIFICATION_FAILURE", f"{type(error).__name__}: {error}")
        raise
    finally:
        try:
            lock_path.unlink()
        except FileNotFoundError:
            pass


if __name__ == "__main__":
    raise SystemExit(main())
