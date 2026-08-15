#!/usr/bin/env python3
"""Run authenticated lazy global-Kalmanson refinement for exact-17 cap nine.

Each SAT assignment is independently checked against the source model and the
complete strict-Kalmanson linear system.  A linear contradiction is minimized,
replayed as an exact weighted certificate, translated to one Boolean row
nogood, and appended to the authenticated CNF without rebuilding the base.

The loop stops fail-closed on anything other than:

* CaDiCaL SAT followed by an exact linear-UNSAT certificate; or
* CaDiCaL UNSAT, which is only a finite SAT result and still needs its separate
  proof-certificate / Lean ingress before it can count as closure.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import time
from typing import Any


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
SOURCE_FILES = (
    HERE / "run_lazy_global_kalmanson_loop.py",
    HERE / "analyze_source_faithful_boolean_model.py",
    HERE / "extract_strict_linear_certificate.py",
    HERE / "append_weighted_kalmanson_cuts.py",
    HERE / "validate_lazy_weighted_cnf.py",
    HERE / "append_weighted_kalmanson_dihedral_orbits.py",
    HERE / "validate_weighted_kalmanson_dihedral_cnf.py",
    HERE / "export_source_faithful_boolean_cnf.py",
    HERE / "exact17_source_faithful_cegar.py",
    HERE / "exact17_fullcover_cegar.py",
    HERE / "exact17_kalmanson.py",
    HERE / "export_exact17_boolean_cnf.py",
    HERE / "exact17_two_rows_shared_late_pair.py",
    HERE / "exact17_committed_direct_row_consumers.py",
    REPO / "census/atail_force/producer_bank.py",
    REPO / "lean/Erdos9796Proof/P97/ATail/KalmansonFourEqualitySchemas.lean",
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def atomic_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")
    os.replace(temporary, path)


def resolve_repo_path(raw: str) -> Path:
    path = Path(raw)
    return path if path.is_absolute() else REPO / path


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


def print_terminal_summary(summary: dict[str, Any]) -> None:
    fields = (
        "schema",
        "status",
        "completed_refinements",
        "terminal_manifest",
        "terminal_manifest_sha256",
        "terminal_cnf_sha256",
    )
    print(json.dumps({key: summary.get(key) for key in fields}, sort_keys=True))


def run_logged(command: list[str], output: Path) -> tuple[int, float]:
    output.parent.mkdir(parents=True, exist_ok=True)
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
    returncode, elapsed = run_logged(command, output)
    if returncode != 0:
        raise RuntimeError(f"{label} failed with exit code {returncode}: {output}")
    return elapsed


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base-manifest", type=Path, required=True)
    parser.add_argument("--output-root", type=Path, required=True)
    parser.add_argument("--seed-start", type=int, default=1)
    parser.add_argument("--max-iterations", type=int, default=100)
    parser.add_argument("--nice", type=int, default=10)
    parser.add_argument(
        "--dihedral-orbit",
        action="store_true",
        help="append and independently replay all 34 dihedral images of each certificate",
    )
    parser.add_argument("--cadical", type=Path, default=Path("/Users/adam/bin/cadical"))
    parser.add_argument("--uv", type=Path, default=Path("uv"))
    args = parser.parse_args()

    if args.max_iterations <= 0:
        raise ValueError("--max-iterations must be positive")
    if args.seed_start <= 0:
        raise ValueError("--seed-start must be positive")

    output_root = args.output_root.resolve()
    output_root.mkdir(parents=True, exist_ok=False)
    summary_path = output_root / "summary.json"
    base_manifest_path = args.base_manifest.resolve()
    base_manifest = json.loads(base_manifest_path.read_text())
    order_index = int(base_manifest["order_index"])
    positions = tuple(int(value) for value in base_manifest["anonymous_positions"])
    if len(positions) != 2:
        raise ValueError("base manifest must contain two anonymous positions")
    if base_manifest.get("learned_replay") != "verified":
        raise ValueError("base manifest does not authenticate learned replay")
    base_cnf = resolve_repo_path(base_manifest["cnf"])
    if sha256(base_cnf) != base_manifest.get("cnf_sha256"):
        raise ValueError("base CNF hash mismatch")
    frozen_sources = source_hashes()
    cadical = args.cadical.resolve()
    frozen_cadical_sha256 = sha256(cadical)

    summary: dict[str, Any] = {
        "schema": "p97-rigid221-exact17-lazy-global-kalmanson-loop-v1",
        "status": "RUNNING",
        "initial_base_manifest": str(base_manifest_path.relative_to(REPO)),
        "initial_base_manifest_sha256": sha256(base_manifest_path),
        "initial_base_cnf_sha256": base_manifest["cnf_sha256"],
        "order_index": order_index,
        "anonymous_positions": list(positions),
        "seed_start": args.seed_start,
        "max_iterations": args.max_iterations,
        "dihedral_orbit": args.dihedral_orbit,
        "source_hashes": frozen_sources,
        "cadical": str(cadical),
        "cadical_sha256": frozen_cadical_sha256,
        "iterations": [],
    }
    atomic_json(summary_path, summary)

    current_manifest_path = base_manifest_path
    uv = str(args.uv)
    for iteration_index in range(args.max_iterations):
        require_source_freeze(frozen_sources)
        if sha256(cadical) != frozen_cadical_sha256:
            raise RuntimeError("CaDiCaL binary changed during run")
        seed = args.seed_start + iteration_index
        stage = output_root / f"iteration-{iteration_index:04d}-seed-{seed}"
        stage.mkdir()
        manifest = json.loads(current_manifest_path.read_text())
        cnf = resolve_repo_path(manifest["cnf"])
        if sha256(cnf) != manifest.get("cnf_sha256"):
            raise ValueError(f"iteration {iteration_index}: input CNF hash mismatch")

        record: dict[str, Any] = {
            "iteration": iteration_index,
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
            record["outcome"] = "BOOLEAN_UNSAT_CANDIDATE"
            summary["iterations"].append(record)
            summary.pop("active_iteration", None)
            summary["status"] = "BOOLEAN_UNSAT_CANDIDATE"
            summary["terminal_manifest"] = record["input_manifest"]
            summary["terminal_manifest_sha256"] = record["input_manifest_sha256"]
            summary["terminal_cnf_sha256"] = record["input_cnf_sha256"]
            atomic_json(summary_path, summary)
            print_terminal_summary(summary)
            return 0
        if solver_code != 10:
            record["outcome"] = "SOLVER_ERROR"
            summary["status"] = "ERROR"
            atomic_json(summary_path, summary)
            raise RuntimeError(f"CaDiCaL exited {solver_code}: {solver_log}")

        analysis = stage / "analysis.json"
        analysis_stdout = stage / "analysis.stdout"
        analysis_elapsed = require_success(
            [
                uv,
                "run",
                "python",
                str(HERE / "analyze_source_faithful_boolean_model.py"),
                "--order",
                str(order_index),
                "--positions",
                ",".join(str(value) for value in positions),
                "--cnf",
                str(cnf),
                "--cadical-log",
                str(solver_log),
                "--always-linear-replay",
                "--output",
                str(analysis),
            ],
            analysis_stdout,
            "source/model/global-LRA analysis",
        )
        analysis_record = json.loads(analysis.read_text())
        require_source_freeze(frozen_sources)
        linear_status = analysis_record.get("linear_status")
        record.update(
            {
                "analysis": str(analysis.relative_to(REPO)),
                "analysis_sha256": sha256(analysis),
                "analysis_elapsed_seconds": analysis_elapsed,
                "linear_status": linear_status,
            }
        )
        atomic_json(summary_path, summary)
        if linear_status != "unsat":
            record["outcome"] = f"LINEAR_{str(linear_status).upper()}"
            summary["iterations"].append(record)
            summary.pop("active_iteration", None)
            summary["status"] = record["outcome"]
            summary["terminal_manifest"] = record["input_manifest"]
            summary["terminal_manifest_sha256"] = record["input_manifest_sha256"]
            summary["terminal_cnf_sha256"] = record["input_cnf_sha256"]
            atomic_json(summary_path, summary)
            print_terminal_summary(summary)
            return 0

        certificate = stage / "certificate.json"
        certificate_stdout = stage / "certificate.stdout"
        certificate_elapsed = require_success(
            [
                uv,
                "run",
                "python",
                str(HERE / "extract_strict_linear_certificate.py"),
                "--order",
                str(order_index),
                "--positions",
                ",".join(str(value) for value in positions),
                "--cegar-report",
                str(analysis),
                "--output",
                str(certificate),
            ],
            certificate_stdout,
            "exact weighted-certificate extraction",
        )
        certificate_record = json.loads(certificate.read_text())
        require_source_freeze(frozen_sources)
        if certificate_record.get("verdict") != "unsat":
            raise ValueError("exact certificate extractor did not return unsat")

        derived = stage / "derived"
        derived.mkdir()
        derived_cnf = derived / "o0-p0-1.cnf"
        derived_manifest = derived / "o0-p0-1.manifest.json"
        append_stdout = stage / "append.stdout"
        append_script = (
            "append_weighted_kalmanson_dihedral_orbits.py"
            if args.dihedral_orbit
            else "append_weighted_kalmanson_cuts.py"
        )
        validation_script = (
            "validate_weighted_kalmanson_dihedral_cnf.py"
            if args.dihedral_orbit
            else "validate_lazy_weighted_cnf.py"
        )
        append_elapsed = require_success(
            [
                uv,
                "run",
                "python",
                str(HERE / append_script),
                "--base-manifest",
                str(current_manifest_path),
                "--weighted-certificate",
                str(certificate),
                "--output",
                str(derived_cnf),
                "--manifest",
                str(derived_manifest),
            ],
            append_stdout,
            "weighted-certificate CNF ingress",
        )
        validation = derived / "o0-p0-1.validation.json"
        validation_stdout = stage / "validation.stdout"
        validation_elapsed = require_success(
            [
                uv,
                "run",
                "python",
                str(HERE / validation_script),
                "--manifest",
                str(derived_manifest),
                "--output",
                str(validation),
            ],
            validation_stdout,
            "independent derived-CNF validation",
        )
        validation_record = json.loads(validation.read_text())
        require_source_freeze(frozen_sources)
        if validation_record.get("status") != "PASS":
            raise ValueError("derived-CNF validation did not return PASS")

        derived_record = json.loads(derived_manifest.read_text())
        record.update(
            {
                "outcome": "REFINED",
                "certificate": str(certificate.relative_to(REPO)),
                "certificate_sha256": sha256(certificate),
                "certificate_elapsed_seconds": certificate_elapsed,
                "minimal_assumption_count": certificate_record.get(
                    "minimal_assumption_count"
                ),
                "row_count": len(certificate_record.get("rows", [])),
                "weighted_term_count": len(
                    certificate_record.get("weighted_terms", [])
                ),
                "append_elapsed_seconds": append_elapsed,
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
    print_terminal_summary(summary)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
