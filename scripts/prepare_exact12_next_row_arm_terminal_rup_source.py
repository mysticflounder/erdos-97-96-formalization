#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Prepare a hash-bound pure-RUP source from a next-row arm terminal cell.

The input must be a completed exact-12 next-row named-deletion-arm cell
workdir whose authenticated summary reports ``UNSAT_DRAT_VERIFIED`` under
schema ``p97_rigid221_exact12_next_row_named_deletion_arm_cell_run.v1``.
The adapter rechecks every referenced artifact, rematerializes the cell from
the current repository source and requires exact CNF-byte equality, verifies
the original wave proof with ``drat-trim`` as an untrusted precheck, produces
a fresh plain-mode CaDiCaL proof for the identical CNF, normalizes it to a
dense pure-RUP LRAT, and publishes the generic ``p97-pure-rup-source-v1``
manifest consumed by ``materialize_checkpointed_rup.py``.

Current-source semantics: the job's pinned source manifest may drift from the
current tree.  This adapter does not require pinned-byte equality; it instead
requires the current compiler to reproduce the exact CNF bytes, compiler
manifest, and clause delta, and it records the complete pinned-versus-current
drift table in the receipt.

This is certificate preparation for one finite cell only.  The closure plan
classifies the four 20260811-v2 terminal cells as direct consequences of the
compiled physical-cycle row; nothing here is aggregate coverage, a universal
lift, a terminal bank, or Lean closure.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import shutil
import subprocess
import sys
import tempfile
from collections.abc import Callable, Mapping
from pathlib import Path
from typing import Any

import materialize_checkpointed_rup as rup
import prepare_exact12_v14_terminal_rup_source as v14

RUN_SCHEMA = "p97_rigid221_exact12_next_row_named_deletion_arm_cell_run.v1"
JOB_SCHEMA = "p97_rigid221_exact12_next_row_named_deletion_arm_bound_job.v1"
RECEIPT_SCHEMA = "p97_rigid221_exact12_next_row_arm_terminal_rup_source.v1"
ARM_CELL_COUNT = 72
REQUIRED_ARTIFACTS = (
    ("job", "job.json"),
    ("clause_delta", "clause_delta.json"),
    ("discovery_cnf", "discovery.cnf"),
    ("terminal_cnf", "terminal.cnf"),
    ("proof", "terminal.drat"),
)

TerminalRupSourceError = v14.TerminalRupSourceError


def _pretty_json_sha256(value: Any) -> str:
    """Hash the producer's canonical pretty-printed JSON rendering."""

    return hashlib.sha256(v14._json_bytes(value)).hexdigest()


def _arm_modules(repo_root: Path) -> tuple[Any, Any, Any, Any]:
    """Load the canonical next-row arm builders from the selected tree."""

    repo_root = repo_root.resolve()
    root_text = str(repo_root)
    if root_text not in sys.path:
        sys.path.insert(0, root_text)
    try:
        from census.card_head import candidate_surface
        from census.card_head import exact12_next_row_arm_cell_run as arm_run
        from census.card_head import exact12_next_row_valuation as valuation
        from census.card_head import source_faithful_candidate_surface as surface
    except ImportError as exc:
        raise TerminalRupSourceError(
            "cannot load the canonical next-row arm source modules"
        ) from exc
    for module in (candidate_surface, surface, valuation, arm_run):
        module_file = getattr(module, "__file__", None)
        if module_file is None or not Path(module_file).resolve().is_relative_to(
            repo_root
        ):
            raise TerminalRupSourceError(
                "canonical next-row arm module was loaded outside the repository"
            )
    return candidate_surface, surface, valuation, arm_run


def _rematerialize_arm_cell(
    repo_root: Path, arm_cell_index: int
) -> tuple[Any, bytes, dict[str, Any]]:
    """Rebuild the compiled cell, CNF bytes, and job from current source."""

    candidate_surface, surface, valuation, arm_run = _arm_modules(repo_root)
    try:
        instance = surface.SourceFaithfulCoverInstance(
            candidate_surface.build_model(
                12, surface.SOURCE_FAITHFUL_PYTHON_PROFILE
            )
        )
        compiled = valuation.compile_arm_cell(
            instance, valuation.arm_cells()[arm_cell_index]
        )
        cnf_bytes = instance.dimacs().encode("ascii")
        rebuilt_job = arm_run._build_job(
            repo_root.resolve(), arm_cell_index, compiled, cnf_bytes
        )
    except (IndexError, KeyError, TypeError, ValueError) as exc:
        raise TerminalRupSourceError(
            "next-row arm cell failed canonical source rematerialization"
        ) from exc
    return compiled, cnf_bytes, rebuilt_job


def _source_drift_table(
    pinned: Any, current: Any
) -> list[dict[str, Any]]:
    """Record pinned-versus-current source bytes without requiring equality."""

    if (
        not isinstance(pinned, list)
        or not isinstance(current, list)
        or len(pinned) != len(current)
    ):
        raise TerminalRupSourceError("job source manifest shape drifted")
    table: list[dict[str, Any]] = []
    for pinned_entry, current_entry in zip(pinned, current):
        if (
            not isinstance(pinned_entry, Mapping)
            or not isinstance(current_entry, Mapping)
            or set(pinned_entry) != {"path", "bytes", "sha256"}
            or set(current_entry) != {"path", "bytes", "sha256"}
            or pinned_entry["path"] != current_entry["path"]
            or not v14._is_sha256(pinned_entry.get("sha256"))
            or not v14._is_sha256(current_entry.get("sha256"))
        ):
            raise TerminalRupSourceError("job source manifest entry is malformed")
        table.append(
            {
                "path": pinned_entry["path"],
                "pinned_sha256": pinned_entry["sha256"],
                "current_sha256": current_entry["sha256"],
                "identical": pinned_entry["sha256"] == current_entry["sha256"],
            }
        )
    return table


def validate_terminal_arm_run(
    workdir: Path,
    *,
    repo_root: Path,
) -> tuple[dict[str, Any], dict[str, Path], dict[str, Any], list[dict[str, Any]]]:
    """Authenticate one verified terminal arm cell against current source."""

    workdir = workdir.resolve()
    summary = v14._load_json_object(workdir / "summary.json", "terminal summary")
    if summary.get("schema") != RUN_SCHEMA:
        raise TerminalRupSourceError(
            f"unsupported next-row arm run schema: {summary.get('schema')!r}"
        )
    if (
        summary.get("job_schema") != JOB_SCHEMA
        or summary.get("status") != "UNSAT_DRAT_VERIFIED"
        or summary.get("discovery_verdict") != "UNSAT"
        or summary.get("terminal_verdict") != "UNSAT"
        or summary.get("terminal_proof_verified") is not True
        or summary.get("error") is not None
    ):
        raise TerminalRupSourceError("run is not a clean verified terminal UNSAT")
    artifacts = summary.get("artifacts")
    if not isinstance(artifacts, Mapping) or artifacts.get("model") is not None:
        raise TerminalRupSourceError(
            "terminal summary artifact ledger is malformed for the UNSAT path"
        )
    paths = {
        key: v14._validated_run_artifact(workdir, artifacts, key, name)
        for key, name in REQUIRED_ARTIFACTS
    }
    if paths["discovery_cnf"].read_bytes() != paths["terminal_cnf"].read_bytes():
        raise TerminalRupSourceError("discovery and terminal CNFs are not identical")

    job = v14._load_json_object(paths["job"], "bound job")
    arm_cell_index = summary.get("arm_cell_index")
    if (
        isinstance(arm_cell_index, bool)
        or not isinstance(arm_cell_index, int)
        or not 0 <= arm_cell_index < ARM_CELL_COUNT
        or job.get("schema") != JOB_SCHEMA
        or job.get("arm_cell_index") != arm_cell_index
        or summary.get("job_sha256") != _pretty_json_sha256(job)
        or summary.get("job_id") != job.get("job_id")
        or job.get("job_id")
        != _pretty_json_sha256(
            {key: value for key, value in job.items() if key != "job_id"}
        )
        or job.get("cnf", {}).get("sha256")
        != artifacts["discovery_cnf"].get("sha256")
    ):
        raise TerminalRupSourceError("terminal summary does not match its bound job")

    clause_delta = v14._load_json_object(paths["clause_delta"], "clause delta")
    if (
        clause_delta.get("job_id") != job.get("job_id")
        or clause_delta.get("arm_cell_index") != arm_cell_index
    ):
        raise TerminalRupSourceError("clause delta is not bound to the job")

    compiled, cnf_bytes, rebuilt_job = _rematerialize_arm_cell(
        repo_root, arm_cell_index
    )
    if cnf_bytes != paths["terminal_cnf"].read_bytes():
        raise TerminalRupSourceError(
            "terminal CNF differs from current-source rematerialization"
        )
    if (
        rebuilt_job.get("compiler_manifest") != job.get("compiler_manifest")
        or rebuilt_job.get("cnf") != job.get("cnf")
        or rebuilt_job.get("candidate_profile") != job.get("candidate_profile")
        or rebuilt_job.get("lean_ingress_theorem") != job.get("lean_ingress_theorem")
    ):
        raise TerminalRupSourceError(
            "bound job differs from current-source rematerialization"
        )
    if (
        clause_delta.get("clauses")
        != [list(clause) for clause in compiled.clause_delta]
        or clause_delta.get("named_deletion_clauses")
        != [list(clause) for clause in compiled.named_deletion_clause_delta]
        or clause_delta.get("base_clause_delta_sha256")
        != compiled.clause_delta_sha256
        or clause_delta.get("named_deletion_clause_delta_sha256")
        != compiled.named_deletion_clause_delta_sha256
        or summary.get("cell")
        != {
            "placement_index": compiled.cell.placement_index,
            "joint_deletion": compiled.cell.joint_deletion,
            "v": compiled.cell.v,
            "arm": compiled.cell.arm,
        }
    ):
        raise TerminalRupSourceError(
            "clause delta or cell differs from current-source rematerialization"
        )
    drift_table = _source_drift_table(
        job.get("sources"), rebuilt_job.get("sources")
    )
    return summary, paths, job, drift_table


def _run_checker(
    command_runner: Callable[..., subprocess.CompletedProcess[str]],
    command: list[str],
    timeout_seconds: int,
) -> tuple[subprocess.CompletedProcess[str], str]:
    checked = command_runner(
        command,
        capture_output=True,
        text=True,
        timeout=timeout_seconds,
    )
    output = checked.stdout
    if checked.stderr:
        if output and not output.endswith("\n"):
            output += "\n"
        output += checked.stderr
    return checked, output


def prepare_terminal_arm_rup_source(
    workdir: Path,
    output_dir: Path,
    *,
    repo_root: Path | None = None,
    cadical: str = "cadical",
    checker: str = "drat-trim",
    timeout_seconds: int = 20_000,
    command_runner: Callable[..., subprocess.CompletedProcess[str]] = subprocess.run,
) -> dict[str, Any]:
    """Publish a self-contained authenticated pure-RUP source directory."""

    if timeout_seconds <= 0:
        raise TerminalRupSourceError("timeout_seconds must be positive")
    if repo_root is None:
        repo_root = Path(__file__).resolve().parents[1]
    summary, source_paths, _job, drift_table = validate_terminal_arm_run(
        workdir, repo_root=repo_root
    )
    artifact_ledger = summary["artifacts"]
    output_dir = output_dir.resolve()
    if output_dir.exists():
        raise TerminalRupSourceError(f"refusing to overwrite output: {output_dir}")
    output_dir.parent.mkdir(parents=True, exist_ok=True)
    stage = Path(
        tempfile.mkdtemp(prefix=f".{output_dir.name}.stage-", dir=output_dir.parent)
    )
    try:
        copied_summary = stage / "summary.json"
        copied_summary.write_bytes(v14._json_bytes(summary))
        staged_paths: dict[str, Path] = {}
        for key, name in REQUIRED_ARTIFACTS:
            staged_path = stage / name
            shutil.copyfile(source_paths[key], staged_path)
            v14._validate_staged_artifact(staged_path, artifact_ledger[key], key)
            staged_paths[key] = staged_path
        copied_job = v14._load_json_object(staged_paths["job"], "staged bound job")
        if _pretty_json_sha256(copied_job) != summary.get("job_sha256"):
            raise TerminalRupSourceError("staged bound job drifted")
        copied_cnf = staged_paths["terminal_cnf"]
        if staged_paths["discovery_cnf"].read_bytes() != copied_cnf.read_bytes():
            raise TerminalRupSourceError("staged discovery and terminal CNFs differ")

        original_checked, original_output = _run_checker(
            command_runner,
            [checker, str(copied_cnf), str(staged_paths["proof"])],
            timeout_seconds,
        )
        original_transcript = stage / "drat-trim-original-output.txt"
        original_transcript.write_text(original_output, encoding="utf-8")
        if (
            original_checked.returncode != 0
            or "s VERIFIED" not in original_output.splitlines()
        ):
            raise TerminalRupSourceError(
                "original wave proof failed the drat-trim precheck "
                f"(exit {original_checked.returncode})"
            )

        plain_proof = stage / "plain.drat"
        solved, solver_output = _run_checker(
            command_runner,
            [cadical, "--plain", str(copied_cnf), str(plain_proof)],
            timeout_seconds,
        )
        solver_transcript = stage / "cadical-plain-output.txt"
        solver_transcript.write_text(solver_output, encoding="utf-8")
        if solved.returncode != 20:
            raise TerminalRupSourceError(
                "plain-mode CaDiCaL rerun did not report UNSAT "
                f"(exit {solved.returncode})"
            )
        if not plain_proof.is_file() or plain_proof.stat().st_size == 0:
            raise TerminalRupSourceError("plain-mode rerun emitted no proof")

        raw_lrat = stage / "drat-trim.lrat"
        normalized_lrat = stage / "normalized.lrat"
        fresh_checked, fresh_output = _run_checker(
            command_runner,
            [checker, str(copied_cnf), str(plain_proof), "-L", str(raw_lrat)],
            timeout_seconds,
        )
        fresh_transcript = stage / "drat-trim-output.txt"
        fresh_transcript.write_text(fresh_output, encoding="utf-8")
        if (
            fresh_checked.returncode != 0
            or "s VERIFIED" not in fresh_output.splitlines()
        ):
            raise TerminalRupSourceError(
                "fresh plain proof failed the drat-trim precheck "
                f"(exit {fresh_checked.returncode})"
            )
        if not raw_lrat.is_file() or raw_lrat.stat().st_size == 0:
            raise TerminalRupSourceError("drat-trim emitted no LRAT proof")
        counts = v14.normalize_dense_pure_rup(copied_cnf, raw_lrat, normalized_lrat)
        source_manifest = {
            "schema": rup.PURE_RUP_SOURCE_SCHEMA,
            "artifacts": {
                "cnf": rup.artifact_record(copied_cnf, relative_path=copied_cnf.name),
                "normalized_lrat": rup.artifact_record(
                    normalized_lrat, relative_path=normalized_lrat.name
                ),
            },
        }
        manifest_path = stage / "source-manifest.json"
        manifest_path.write_bytes(v14._json_bytes(source_manifest))
        # Re-enter through the generic strict loader before publication.
        rup.load_source_manifest(manifest_path)
        receipt_body = {
            "schema": RECEIPT_SCHEMA,
            "scope": (
                "one finite next-row named-deletion-arm cell; the closure plan "
                "records these terminals as direct consequences of the compiled "
                "physical-cycle row; certificate preparation only, not aggregate "
                "coverage, a universal lift, a terminal bank, or Lean closure"
            ),
            "run_schema": summary["schema"],
            "arm_cell_index": summary.get("arm_cell_index"),
            "cell": summary.get("cell"),
            "job_id": summary.get("job_id"),
            "job_sha256": summary.get("job_sha256"),
            "rematerialization": {
                "semantics": "current-source",
                "cnf_bytes_identical": True,
                "compiler_manifest_identical": True,
                "clause_delta_identical": True,
                "source_drift": drift_table,
            },
            "original_proof_precheck": {
                "command": checker,
                "exit_code": original_checked.returncode,
                "reported_verdict": "s VERIFIED",
                "epistemic_status": "UNTRUSTED_PRECHECK_ONLY",
            },
            "fresh_proof": {
                "command": f"{cadical} --plain",
                "exit_code": solved.returncode,
                "reported_verdict": "UNSAT",
                "provenance": (
                    "fresh plain-mode rerun by this postprocessor on the staged "
                    "identical CNF; not the wave's original proof"
                ),
            },
            "drat_trim_precheck": {
                "command": checker,
                "exit_code": fresh_checked.returncode,
                "reported_verdict": "s VERIFIED",
                "epistemic_status": (
                    "UNTRUSTED_PRECHECK_ONLY; LEAN COMPACT-RUP REPLAY REQUIRED"
                ),
            },
            "normalization": counts,
            "artifacts": {
                "summary": rup.artifact_record(
                    copied_summary, relative_path=copied_summary.name
                ),
                "job": rup.artifact_record(
                    staged_paths["job"], relative_path=staged_paths["job"].name
                ),
                "clause_delta": rup.artifact_record(
                    staged_paths["clause_delta"],
                    relative_path=staged_paths["clause_delta"].name,
                ),
                "discovery_cnf": rup.artifact_record(
                    staged_paths["discovery_cnf"],
                    relative_path=staged_paths["discovery_cnf"].name,
                ),
                "terminal_cnf": rup.artifact_record(
                    copied_cnf, relative_path=copied_cnf.name
                ),
                "original_drat": rup.artifact_record(
                    staged_paths["proof"], relative_path=staged_paths["proof"].name
                ),
                "plain_drat": rup.artifact_record(
                    plain_proof, relative_path=plain_proof.name
                ),
                "drat_trim_original_output": rup.artifact_record(
                    original_transcript, relative_path=original_transcript.name
                ),
                "cadical_plain_output": rup.artifact_record(
                    solver_transcript, relative_path=solver_transcript.name
                ),
                "drat_trim_output": rup.artifact_record(
                    fresh_transcript, relative_path=fresh_transcript.name
                ),
                "raw_lrat": rup.artifact_record(
                    raw_lrat, relative_path=raw_lrat.name
                ),
                "normalized_lrat": rup.artifact_record(
                    normalized_lrat, relative_path=normalized_lrat.name
                ),
                "source_manifest": rup.artifact_record(
                    manifest_path, relative_path=manifest_path.name
                ),
            },
        }
        receipt = {
            **receipt_body,
            "receipt_sha256": hashlib.sha256(
                json.dumps(
                    receipt_body, sort_keys=True, separators=(",", ":")
                ).encode()
            ).hexdigest(),
        }
        (stage / "receipt.json").write_bytes(v14._json_bytes(receipt))
        stage.rename(output_dir)
        return receipt
    except BaseException:
        shutil.rmtree(stage, ignore_errors=True)
        raise


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--repo-root", type=Path)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--drat-trim", default="drat-trim")
    parser.add_argument("--timeout-seconds", type=int, default=20_000)
    args = parser.parse_args(argv)
    try:
        receipt = prepare_terminal_arm_rup_source(
            args.workdir,
            args.output_dir,
            repo_root=args.repo_root,
            cadical=args.cadical,
            checker=args.drat_trim,
            timeout_seconds=args.timeout_seconds,
        )
    except (OSError, subprocess.SubprocessError, TerminalRupSourceError) as exc:
        parser.error(str(exc))
    print(json.dumps(receipt, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
