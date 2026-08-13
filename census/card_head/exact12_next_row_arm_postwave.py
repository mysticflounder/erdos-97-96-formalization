"""Authenticate and theorem-mine an exact-12 named-deletion arm wave.

The selected supports are replayed as ``exact=False`` metric rows.  Replayed
metric certificates are finite theorem-mining evidence only: this audit does
not provide aggregate arm coverage, a universal lift, or a Lean closure.
"""

from __future__ import annotations

import argparse
import json
import subprocess
from collections import Counter
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.global_confinement import cap_selected_nogood_certificate_probe as certs
from census.global_confinement import metric_realizability_probe as metric

from .candidate_surface import build_model
from .exact12_next_row_arm_cell_run import (
    JOB_SCHEMA,
    RUN_SCHEMA,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    _build_job,
    _json_sha256,
    cnf_assignment_satisfies,
)
from .exact12_next_row_arm_cell_run import SOURCE_PATHS as ARM_CELL_RUN_SOURCE_PATHS
from .exact12_next_row_postwave import (
    GENERIC_OBSTRUCTION_FAMILY,
    _artifact_record,
    _assert_directory,
    _cube_from_assignment,
    _decode_blockers,
    _decode_cube,
    _json_bytes,
    _mapping,
    _path_exists,
    _positive_assignment,
    _read_bytes,
    _read_json,
    _sha256_file,
    _sha256_value,
    _write_json,
)
from .exact12_next_row_valuation import (
    arm_cells,
    compile_arm_cell,
    decode_blockers,
    decode_distinguished_d,
    named_deletion_added_constraints_hold,
)
from .source_faithful_candidate_surface import SourceFaithfulCoverInstance

POSTWAVE_SCHEMA = "p97_rigid221_exact12_next_row_arm_postwave_theorem_search.v1"
ACCEPTED_STATUSES = frozenset({"SAT_WITNESS_REPLAYED", "UNSAT_DRAT_VERIFIED"})
SOURCE_PATHS = (
    "census/card_head/exact12_next_row_arm_postwave.py",
    "census/card_head/exact12_next_row_arm_cell_run.py",
    "census/card_head/exact12_next_row_postwave.py",
    "census/card_head/exact12_next_row_valuation.py",
    "census/global_confinement/metric_realizability_probe.py",
    "census/global_confinement/cap_selected_nogood_certificate_probe.py",
)


class Exact12NextRowArmPostwaveError(ValueError):
    """An arm-wave artifact or theorem-mining replay failed closed."""


@dataclass(frozen=True)
class ProofCheckResult:
    verified: bool
    returncode: int
    stdout: str


ProofChecker = Callable[[Path, Path, int], ProofCheckResult]


def _run_drat_trim(
    cnf_path: Path, proof_path: Path, timeout_s: int
) -> ProofCheckResult:
    try:
        checked = subprocess.run(
            ["drat-trim", str(cnf_path), str(proof_path)],
            capture_output=True,
            text=True,
            timeout=timeout_s,
            check=False,
        )
    except (OSError, subprocess.TimeoutExpired):
        return ProofCheckResult(False, -1, "")
    exact_verified_line = any(
        line.strip() == "s VERIFIED" for line in checked.stdout.splitlines()
    )
    return ProofCheckResult(exact_verified_line, checked.returncode, checked.stdout)


def _assert_private_directory(path: Path) -> None:
    try:
        _assert_directory(path, private=True)
    except ValueError as exc:
        raise Exact12NextRowArmPostwaveError(str(exc)) from exc


def _source_manifest(
    repo_root: Path, *, paths: tuple[str, ...] = SOURCE_PATHS
) -> list[dict[str, Any]]:
    result: list[dict[str, Any]] = []
    for relative in paths:
        path = repo_root / relative
        if not path.is_file():
            raise Exact12NextRowArmPostwaveError(
                f"required source is missing: {relative}"
            )
        result.append(
            {
                "path": relative,
                "bytes": path.stat().st_size,
                "sha256": _sha256_file(path),
            }
        )
    return result


def _cell_dir(wave_dir: Path, arm_cell_index: int) -> Path:
    _assert_private_directory(wave_dir)
    candidates = {
        wave_dir / f"cell-{arm_cell_index}",
        wave_dir / f"cell-{arm_cell_index:02d}",
        wave_dir / f"cell-{arm_cell_index:04d}",
    }
    existing = []
    for path in candidates:
        if not _path_exists(path):
            continue
        _assert_private_directory(path)
        existing.append(path)
    if len(existing) != 1:
        raise Exact12NextRowArmPostwaveError(
            f"arm cell {arm_cell_index} has {len(existing)} candidate directories"
        )
    return existing[0]


def _verify_artifact(
    cell_dir: Path,
    summary: dict[str, Any],
    *,
    key: str,
    filename: str,
    required: bool,
) -> Path | None:
    artifacts = _mapping(summary.get("artifacts"), label="artifacts")
    encoded = artifacts.get(key)
    path = cell_dir / filename
    if encoded is None:
        if required or _path_exists(path):
            raise Exact12NextRowArmPostwaveError(
                f"arm cell artifact {key} is missing or unreported"
            )
        return None
    if _mapping(encoded, label=f"artifact {key}").get("path") != filename:
        raise Exact12NextRowArmPostwaveError(
            f"arm cell artifact {key} failed authentication"
        )
    try:
        actual = _artifact_record(path, filename=filename)
    except ValueError as exc:
        raise Exact12NextRowArmPostwaveError(str(exc)) from exc
    if _mapping(encoded, label=f"artifact {key}") != actual:
        raise Exact12NextRowArmPostwaveError(
            f"arm cell artifact {key} failed authentication"
        )
    return path


def _reconstruct_arm_job(
    repo_root: Path, arm_cell_index: int
) -> tuple[dict[str, Any], bytes, SourceFaithfulCoverInstance, Any]:
    instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    compiled = compile_arm_cell(instance, arm_cells()[arm_cell_index])
    cnf_bytes = instance.dimacs().encode("ascii")
    job = _build_job(repo_root, arm_cell_index, compiled, cnf_bytes)
    payload = {
        **job,
        "sources": _source_manifest(repo_root, paths=ARM_CELL_RUN_SOURCE_PATHS),
    }
    return {**payload, "job_id": _sha256_value(payload)}, cnf_bytes, instance, compiled


def _expected_cell(cell: Any) -> dict[str, Any]:
    return {
        "placement_index": cell.placement_index,
        "joint_deletion": cell.joint_deletion,
        "v": cell.v,
        "arm": cell.arm,
    }


def _verify_job(
    cell_dir: Path,
    summary: dict[str, Any],
    *,
    arm_cell_index: int,
    repo_root: Path | None = None,
) -> dict[str, Any]:
    job_path = _verify_artifact(
        cell_dir, summary, key="job", filename="job.json", required=True
    )
    assert job_path is not None
    job_bytes = _read_bytes(job_path)
    job = _mapping(_read_json(job_path), label="job")
    if job_bytes != _json_bytes(job):
        raise Exact12NextRowArmPostwaveError(
            f"arm cell {arm_cell_index} job bytes are not canonical"
        )
    payload = {key: value for key, value in job.items() if key != "job_id"}
    if (
        job.get("schema") != JOB_SCHEMA
        or job.get("arm_cell_index") != arm_cell_index
        or job.get("job_id") != _json_sha256(payload)
        or summary.get("job_id") != job.get("job_id")
        or summary.get("job_sha256") != _json_sha256(job)
    ):
        raise Exact12NextRowArmPostwaveError(
            f"arm cell {arm_cell_index} job binding failed"
        )
    if repo_root is not None:
        reconstructed, _cnf_bytes, _instance, _compiled = _reconstruct_arm_job(
            repo_root, arm_cell_index
        )
        if job != reconstructed:
            raise Exact12NextRowArmPostwaveError(
                f"arm cell {arm_cell_index} job is not bound to the current source manifest"
            )
    return job


def _verify_terminal_proof(
    cnf_path: Path,
    proof_path: Path,
    *,
    checker_runner: ProofChecker,
) -> None:
    checked = checker_runner(cnf_path, proof_path, 600)
    exact_verified_line = any(
        line.strip() == "s VERIFIED" for line in checked.stdout.splitlines()
    )
    if not checked.verified or checked.returncode != 0 or not exact_verified_line:
        raise Exact12NextRowArmPostwaveError(
            "independent drat-trim replay did not report exact line 's VERIFIED'"
        )


def analyze_wave(
    repo_root: Path,
    wave_dir: Path,
    *,
    checker_runner: ProofChecker = _run_drat_trim,
) -> dict[str, Any]:
    """Authenticate all 72 arm cells and classify their SAT witnesses."""

    _assert_private_directory(wave_dir)
    schedule = arm_cells()
    if len(schedule) != 72:
        raise Exact12NextRowArmPostwaveError("arm schedule is not 72 cells")
    records: list[dict[str, Any]] = []
    status_counts: Counter[str] = Counter()
    stage_counts: Counter[str] = Counter()
    named_arm_counts: Counter[str] = Counter()
    placement_counts: Counter[int] = Counter()

    for arm_cell_index, cell in enumerate(schedule):
        cell_dir = _cell_dir(wave_dir, arm_cell_index)
        summary_path = cell_dir / "summary.json"
        summary = _mapping(_read_json(summary_path), label="summary")
        status = summary.get("status")
        if (
            summary.get("schema") != RUN_SCHEMA
            or summary.get("arm_cell_index") != arm_cell_index
            or summary.get("cell") != _expected_cell(cell)
            or status not in ACCEPTED_STATUSES
        ):
            raise Exact12NextRowArmPostwaveError(
                f"arm cell {arm_cell_index} summary contract failed"
            )
        job = _verify_job(
            cell_dir,
            summary,
            arm_cell_index=arm_cell_index,
            repo_root=repo_root,
        )
        job_bytes = _read_bytes(cell_dir / "job.json")
        clause_delta_path = _verify_artifact(
            cell_dir,
            summary,
            key="clause_delta",
            filename="clause_delta.json",
            required=True,
        )
        discovery_path = _verify_artifact(
            cell_dir,
            summary,
            key="discovery_cnf",
            filename="discovery.cnf",
            required=True,
        )
        assert clause_delta_path is not None and discovery_path is not None
        reconstructed_job, cnf_bytes, instance, compiled = _reconstruct_arm_job(
            repo_root, arm_cell_index
        )
        if (
            job != reconstructed_job
            or job_bytes != _json_bytes(reconstructed_job)
            or _read_bytes(discovery_path) != cnf_bytes
            or summary.get("job_id") != reconstructed_job["job_id"]
            or summary.get("job_sha256") != _json_sha256(reconstructed_job)
        ):
            raise Exact12NextRowArmPostwaveError(
                f"arm cell {arm_cell_index} job or exact CNF bytes failed authentication"
            )

        status_counts[status] += 1
        named_arm_counts[cell.arm] += 1
        placement_counts[cell.placement_index] += 1
        record: dict[str, Any] = {
            "arm_cell_index": arm_cell_index,
            "cell": _expected_cell(cell),
            "status": status,
            "job_id": summary.get("job_id"),
            "summary_sha256": _sha256_file(summary_path),
            "detection": None,
            "certificate": None,
            "certificate_sha256": None,
            "certificate_replayed": False,
            "general_lean_obstruction_family": None,
        }

        if status == "UNSAT_DRAT_VERIFIED":
            terminal_path = _verify_artifact(
                cell_dir,
                summary,
                key="terminal_cnf",
                filename="terminal.cnf",
                required=True,
            )
            proof_path = _verify_artifact(
                cell_dir,
                summary,
                key="proof",
                filename="terminal.drat",
                required=True,
            )
            _verify_artifact(
                cell_dir,
                summary,
                key="model",
                filename="model.json",
                required=False,
            )
            if (
                terminal_path is None
                or proof_path is None
                or _read_bytes(terminal_path) != cnf_bytes
                or summary.get("terminal_verdict") != "UNSAT"
                or summary.get("terminal_proof_verified") is not True
            ):
                raise Exact12NextRowArmPostwaveError(
                    f"arm cell {arm_cell_index} terminal proof custody failed"
                )
            _verify_terminal_proof(
                terminal_path,
                proof_path,
                checker_runner=checker_runner,
            )
            record["terminal_proof_independently_verified"] = True
            records.append(record)
            continue

        model_path = _verify_artifact(
            cell_dir,
            summary,
            key="model",
            filename="model.json",
            required=True,
        )
        _verify_artifact(
            cell_dir,
            summary,
            key="terminal_cnf",
            filename="terminal.cnf",
            required=False,
        )
        _verify_artifact(
            cell_dir,
            summary,
            key="proof",
            filename="terminal.drat",
            required=False,
        )
        assert model_path is not None
        model = _mapping(_read_json(model_path), label="model")
        if model.get("arm_cell_index") != arm_cell_index or model.get(
            "cell"
        ) != _expected_cell(cell):
            raise Exact12NextRowArmPostwaveError(
                f"arm cell {arm_cell_index} model binding failed"
            )
        cube = _decode_cube(model.get("cube"), cell_index=arm_cell_index)
        positive = _positive_assignment(model)
        if not cnf_assignment_satisfies(
            instance.cnf.clauses,
            positive,
            n_variables=instance.cnf.n_variables,
        ):
            raise Exact12NextRowArmPostwaveError(
                f"arm cell {arm_cell_index} positive assignment does not satisfy reconstructed CNF"
            )
        assigned_cube = _cube_from_assignment(instance, positive)
        if cube != assigned_cube:
            raise Exact12NextRowArmPostwaveError(
                f"arm cell {arm_cell_index} cube is not bound to positive assignment"
            )
        blockers = _decode_blockers(model.get("blockers"), cell_index=arm_cell_index)
        assigned_blockers = decode_blockers(positive, compiled.base.blocker_variables)
        if blockers != assigned_blockers:
            raise Exact12NextRowArmPostwaveError(
                f"arm cell {arm_cell_index} blockers are not bound to positive assignment"
            )
        d = model.get("distinguished_d")
        assigned_d = decode_distinguished_d(
            positive, compiled.base.distinguished_d_variables
        )
        if d != assigned_d:
            raise Exact12NextRowArmPostwaveError(
                f"arm cell {arm_cell_index} distinguished d is not bound to positive assignment"
            )
        if type(d) is not int or not named_deletion_added_constraints_hold(
            cell, cube, blockers, d
        ):
            raise Exact12NextRowArmPostwaveError(
                f"arm cell {arm_cell_index} source predicate failed replay"
            )

        metric_rows = tuple(
            metric.MetricRow(center, support, False)
            for center, support in sorted(cube.items())
        )
        detection = metric._formalized_metric_core(
            metric_rows,
            12,
            (),
            include_extended=True,
            include_ordered=False,
        )
        stage = "none"
        certificate = None
        if detection is not None:
            if (
                type(detection) is not dict
                or set(detection) != {"stage", "core"}
                or type(detection["stage"]) is not str
                or type(detection["core"]) is not dict
            ):
                raise Exact12NextRowArmPostwaveError(
                    f"arm cell {arm_cell_index} detector output is malformed"
                )
            certificate = certs._certificate_for_detection(metric_rows, 12, detection)
            if certs._validate_certificate(certificate, n=12) is not True:
                raise Exact12NextRowArmPostwaveError(
                    f"arm cell {arm_cell_index} metric certificate failed replay"
                )
            stage = detection["stage"]
        stage_counts[stage] += 1
        record.update(
            {
                "model_sha256": _sha256_file(model_path),
                "distinguished_d": d,
                "detection": detection,
                "certificate": certificate,
                "certificate_sha256": (
                    _sha256_value(certificate) if certificate is not None else None
                ),
                "certificate_replayed": certificate is not None,
                "general_lean_obstruction_family": (
                    GENERIC_OBSTRUCTION_FAMILY if certificate is not None else None
                ),
            }
        )
        records.append(record)

    return {
        "schema": POSTWAVE_SCHEMA,
        "status": "AUTHENTICATED_THEOREM_SEARCH_COMPLETE",
        "scope": (
            "72 finite exact-12 placement-by-named-deletion-arm cells; "
            "selected supports are exact=False metric rows; no aggregate "
            "coverage, universal lift, or Lean closure"
        ),
        "wave_dir": str(wave_dir.relative_to(repo_root)),
        "source_manifest": _source_manifest(repo_root),
        "aggregate": {
            "cells": len(records),
            "status_counts": dict(sorted(status_counts.items())),
            "sat_stage_counts": dict(sorted(stage_counts.items())),
            "named_arm_counts": dict(sorted(named_arm_counts.items())),
            "placement_counts": {
                str(key): value for key, value in sorted(placement_counts.items())
            },
            "certificates_replayed": sum(
                record["certificate_replayed"] for record in records
            ),
        },
        "records": records,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--wave-dir", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    repo_root = args.repo_root.resolve()
    wave_dir = args.wave_dir.resolve()
    output = args.output.resolve()
    try:
        result = analyze_wave(repo_root, wave_dir)
        _write_json(output, result)
    except (Exact12NextRowArmPostwaveError, OSError, ValueError) as exc:
        parser.error(str(exc))
    print(json.dumps(result["aggregate"], sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
