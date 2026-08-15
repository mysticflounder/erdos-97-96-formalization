#!/usr/bin/env python3
"""Run source-verified lazy direct-label two-Kalmanson refinement.

Every SAT assignment is checked against both the current DIMACS and the source
Z3 model before any cut is admitted.  The appender instantiates the general
Lean two-Kalmanson label theorem, and an independent validator replays the cut,
the authenticated base prefix, and satisfaction of every base clause.

BOOLEAN_UNSAT_CANDIDATE is a finite solver result only.  It still requires a
proof certificate and Lean ingress before it closes the exact-17 leaf.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
import time
from pathlib import Path
from typing import Any

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
APPENDER = HERE / "append_violated_two_kalmanson_label_cuts.py"
VALIDATOR = HERE / "validate_lazy_two_kalmanson_label_cnf.py"
ANALYZER = HERE / "analyze_source_faithful_boolean_model.py"
SOURCE_FILES = (
    Path(__file__).resolve(),
    APPENDER,
    VALIDATOR,
    HERE / "append_all_two_kalmanson_label_cuts.py",
    HERE / "append_weighted_kalmanson_cuts.py",
    ANALYZER,
    HERE / "export_source_faithful_boolean_cnf.py",
    HERE / "exact17_source_faithful_cegar.py",
    HERE / "exact17_fullcover_cegar.py",
    HERE / "exact17_kalmanson.py",
    HERE / "export_exact17_boolean_cnf.py",
    HERE / "exact17_two_rows_shared_late_pair.py",
    HERE / "exact17_committed_direct_row_consumers.py",
    REPO / "census/atail_force/producer_bank.py",
    REPO / "lean/Erdos9796Proof/P97/ATail/TwoKalmansonLabelCut.lean",
    REPO
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "GenericRowNogoodCertificate.lean",
    REPO / "lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean",
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def source_hashes() -> dict[str, str]:
    return {str(path.relative_to(REPO)): sha256(path) for path in SOURCE_FILES}


def require_source_freeze(expected: dict[str, str]) -> None:
    actual = source_hashes()
    if actual != expected:
        changed = sorted(
            path
            for path in set(expected) | set(actual)
            if expected.get(path) != actual.get(path)
        )
        raise RuntimeError(f"source freeze violation: {changed}")


def resolve_repo_path(raw: str) -> Path:
    path = Path(raw)
    return path if path.is_absolute() else REPO / path


def atomic_json(path: Path, value: Any) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")
    os.replace(temporary, path)


def run_logged(command: list[str], output: Path) -> tuple[int, float]:
    started = time.monotonic()
    with output.open("wb") as handle:
        result = subprocess.run(
            command,
            cwd=REPO,
            stdout=handle,
            stderr=subprocess.STDOUT,
            check=False,
        )
    return result.returncode, time.monotonic() - started


def require_success(command: list[str], output: Path, label: str) -> float:
    code, elapsed = run_logged(command, output)
    if code != 0:
        raise RuntimeError(f"{label} failed with exit code {code}: {output}")
    return elapsed


def terminalize(summary: dict[str, Any], path: Path, status: str, record: dict) -> int:
    record["outcome"] = status
    summary["iterations"].append(record)
    summary.pop("active_iteration", None)
    summary["status"] = status
    summary["terminal_manifest"] = record["input_manifest"]
    summary["terminal_manifest_sha256"] = record["input_manifest_sha256"]
    summary["terminal_cnf_sha256"] = record["input_cnf_sha256"]
    atomic_json(path, summary)
    print(
        json.dumps(
            {
                "completed_refinements": summary.get("completed_refinements", 0),
                "status": status,
                "terminal_cnf_sha256": summary["terminal_cnf_sha256"],
                "terminal_manifest": summary["terminal_manifest"],
            },
            sort_keys=True,
        )
    )
    return 0


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base-manifest", type=Path, required=True)
    parser.add_argument("--output-root", type=Path, required=True)
    parser.add_argument("--seed-start", type=int, default=1)
    parser.add_argument("--max-iterations", type=int, default=16)
    parser.add_argument("--nice", type=int, default=10)
    parser.add_argument("--cadical", type=Path, default=Path("/Users/adam/bin/cadical"))
    parser.add_argument("--uv", type=Path, default=Path("uv"))
    args = parser.parse_args()

    if args.seed_start <= 0 or args.max_iterations <= 0:
        raise ValueError("seed and iteration counts must be positive")
    output_root = args.output_root.resolve()
    output_root.mkdir(parents=True, exist_ok=False)
    summary_path = output_root / "summary.json"
    current_manifest_path = args.base_manifest.resolve()
    initial_manifest = json.loads(current_manifest_path.read_text())
    initial_cnf = resolve_repo_path(initial_manifest["cnf"])
    if sha256(initial_cnf) != initial_manifest.get("cnf_sha256"):
        raise ValueError("initial CNF hash mismatch")
    order_index = int(initial_manifest["order_index"])
    positions = tuple(int(value) for value in initial_manifest["anonymous_positions"])
    if len(positions) != 2:
        raise ValueError("base manifest must contain two anonymous positions")

    frozen_sources = source_hashes()
    cadical = args.cadical.resolve()
    cadical_sha = sha256(cadical)
    uv = str(args.uv)
    summary: dict[str, Any] = {
        "schema": "p97-rigid221-exact17-lazy-two-kalmanson-label-loop-v1",
        "status": "RUNNING",
        "initial_base_manifest": str(current_manifest_path.relative_to(REPO)),
        "initial_base_manifest_sha256": sha256(current_manifest_path),
        "initial_base_cnf_sha256": initial_manifest["cnf_sha256"],
        "order_index": order_index,
        "anonymous_positions": list(positions),
        "seed_start": args.seed_start,
        "max_iterations": args.max_iterations,
        "source_hashes": frozen_sources,
        "cadical": str(cadical),
        "cadical_sha256": cadical_sha,
        "iterations": [],
        "completed_refinements": 0,
    }
    atomic_json(summary_path, summary)

    for iteration in range(args.max_iterations):
        require_source_freeze(frozen_sources)
        if sha256(cadical) != cadical_sha:
            raise RuntimeError("CaDiCaL binary changed during run")
        seed = args.seed_start + iteration
        stage = output_root / f"iteration-{iteration:04d}-seed-{seed}"
        stage.mkdir()
        manifest = json.loads(current_manifest_path.read_text())
        cnf = resolve_repo_path(manifest["cnf"])
        if sha256(cnf) != manifest.get("cnf_sha256"):
            raise ValueError(f"iteration {iteration}: input CNF hash mismatch")
        record: dict[str, Any] = {
            "iteration": iteration,
            "seed": seed,
            "input_manifest": str(current_manifest_path.relative_to(REPO)),
            "input_manifest_sha256": sha256(current_manifest_path),
            "input_cnf": str(cnf.relative_to(REPO)),
            "input_cnf_sha256": manifest["cnf_sha256"],
        }
        summary["active_iteration"] = record
        atomic_json(summary_path, summary)

        solver_log = stage / "cadical.log"
        solver_code, solver_elapsed = run_logged(
            [
                "nice",
                "-n",
                str(args.nice),
                str(cadical),
                f"--seed={seed}",
                str(cnf),
            ],
            solver_log,
        )
        record.update(
            {
                "solver_exit_code": solver_code,
                "solver_elapsed_seconds": solver_elapsed,
                "solver_log": str(solver_log.relative_to(REPO)),
                "solver_log_sha256": sha256(solver_log),
            }
        )
        atomic_json(summary_path, summary)
        if solver_code == 20:
            return terminalize(summary, summary_path, "BOOLEAN_UNSAT_CANDIDATE", record)
        if solver_code != 10:
            summary["status"] = "ERROR"
            atomic_json(summary_path, summary)
            raise RuntimeError(f"CaDiCaL exited {solver_code}: {solver_log}")

        analysis = stage / "analysis.json"
        analysis_stdout = stage / "analysis.stdout"
        analysis_elapsed = require_success(
            [
                uv,
                "run",
                "--with",
                "z3-solver",
                "python",
                str(ANALYZER),
                "--order",
                str(order_index),
                "--positions",
                ",".join(str(value) for value in positions),
                "--cnf",
                str(cnf),
                "--cadical-log",
                str(solver_log),
                "--output",
                str(analysis),
            ],
            analysis_stdout,
            "source/model analysis",
        )
        analysis_record = json.loads(analysis.read_text())
        for key in (
            "cnf_assignment_verified",
            "source_z3_assignment_verified",
            "source_independent_model_checker_verified",
        ):
            if analysis_record.get(key) is not True:
                raise ValueError(f"source/model analysis did not verify {key}")
        record.update(
            {
                "analysis": str(analysis.relative_to(REPO)),
                "analysis_sha256": sha256(analysis),
                "analysis_elapsed_seconds": analysis_elapsed,
                "bank_hit_count": len(analysis_record.get("bank_hits", [])),
                "linear_status": analysis_record.get("linear_status"),
            }
        )
        atomic_json(summary_path, summary)
        require_source_freeze(frozen_sources)

        derived = stage / "derived"
        derived.mkdir()
        derived_cnf = derived / "o0-p0-1.cnf"
        derived_manifest = derived / "o0-p0-1.manifest.json"
        append_stdout = stage / "append.stdout"
        append_code, append_elapsed = run_logged(
            [
                uv,
                "run",
                "--with",
                "z3-solver",
                "python",
                str(APPENDER),
                "--base-manifest",
                str(current_manifest_path),
                "--sat-model",
                str(solver_log),
                "--output",
                str(derived_cnf),
                "--manifest",
                str(derived_manifest),
            ],
            append_stdout,
        )
        record["append_elapsed_seconds"] = append_elapsed
        if append_code == 3:
            record["append_stdout"] = str(append_stdout.relative_to(REPO))
            return terminalize(summary, summary_path, "NO_DIRECT_TWO_K", record)
        if append_code != 0:
            summary["status"] = "ERROR"
            atomic_json(summary_path, summary)
            raise RuntimeError(f"lazy appender exited {append_code}: {append_stdout}")

        validation = derived / "o0-p0-1.validation.json"
        validation_stdout = stage / "validation.stdout"
        validation_elapsed = require_success(
            [
                uv,
                "run",
                "--with",
                "z3-solver",
                "python",
                str(VALIDATOR),
                "--manifest",
                str(derived_manifest),
                "--output",
                str(validation),
            ],
            validation_stdout,
            "independent derived-CNF validation",
        )
        require_source_freeze(frozen_sources)
        validation_record = json.loads(validation.read_text())
        if validation_record.get("status") != "PASS":
            raise ValueError("independent validation did not return PASS")
        if validation_record.get("base_model_satisfies_cnf") is not True:
            raise ValueError("independent validation did not verify the base model")
        derived_record = json.loads(derived_manifest.read_text())
        dimensions = derived_record["lazy_two_kalmanson_label_dimensions"]
        record.update(
            {
                "outcome": "REFINED",
                "appended_clauses": dimensions["appended_clauses"],
                "cancelling_inequality_pairs": dimensions[
                    "cancelling_inequality_pairs"
                ],
                "validation": str(validation.relative_to(REPO)),
                "validation_sha256": sha256(validation),
                "validation_elapsed_seconds": validation_elapsed,
                "output_manifest": str(derived_manifest.relative_to(REPO)),
                "output_manifest_sha256": sha256(derived_manifest),
                "output_cnf": str(derived_cnf.relative_to(REPO)),
                "output_cnf_sha256": derived_record["cnf_sha256"],
                "output_clause_count": derived_record["clauses"],
            }
        )
        summary["iterations"].append(record)
        summary.pop("active_iteration", None)
        summary["completed_refinements"] = len(summary["iterations"])
        summary["current_manifest"] = record["output_manifest"]
        atomic_json(summary_path, summary)
        current_manifest_path = derived_manifest

    summary["status"] = "ITERATION_LIMIT"
    summary["terminal_manifest"] = str(current_manifest_path.relative_to(REPO))
    summary["terminal_manifest_sha256"] = sha256(current_manifest_path)
    terminal_manifest = json.loads(current_manifest_path.read_text())
    summary["terminal_cnf_sha256"] = terminal_manifest["cnf_sha256"]
    atomic_json(summary_path, summary)
    print(
        json.dumps(
            {
                "completed_refinements": summary["completed_refinements"],
                "status": summary["status"],
                "terminal_cnf_sha256": summary["terminal_cnf_sha256"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
