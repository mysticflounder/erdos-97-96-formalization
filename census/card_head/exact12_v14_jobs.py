"""Fail-closed job contract for the exact-12 normalized-v14 schedule.

The schedule coordinates name branches of checked Lean disjunctions.  They are
not, by themselves, a valuation of SAT literals.  This module authenticates
individual jobs and the complete 648-job set while refusing solver execution
until a separate source-to-CNF valuation contract has been implemented and
reviewed.
"""

from __future__ import annotations

from collections.abc import Mapping
from dataclasses import asdict
from pathlib import Path
from typing import Any

from .exact12_v14_schedule import (
    FROZEN_SCHEDULE_SHA256,
    Exact12V14Cell,
    Exact12V14ScheduleError,
    build_manifest,
    cells,
    json_sha256,
    validate_manifest,
)

JOB_SCHEMA = "p97_rigid221_exact12_full_v14_job.v1"
JOB_SET_SCHEMA = "p97_rigid221_exact12_full_v14_job_set.v1"
SEMANTIC_STATUS = "SOURCE_TO_CNF_UNVERIFIED"
EXECUTION_STATUS = "BLOCKED"

SCOPE = (
    "authenticated case coordinates only; a job does not assert that its arm "
    "or distinguished-d coordinate holds independently, and it carries no "
    "SAT, coverage, UNSAT, certificate-replay, or Lean-closure claim"
)

REQUIRED_SOURCE_TO_CNF_EVIDENCE: tuple[str, ...] = (
    "source predicates mapped to exact SAT variables and literal polarities",
    "the six-arm and distinguished-d disjunctions preserved as aggregate cases",
    "compiler source and variable-map artifacts authenticated by SHA-256",
    "SAT models and terminal UNSAT proofs independently replayed",
)


class Exact12V14JobError(ValueError):
    """A job is malformed or lacks authority for solver execution."""


def _require_plain_int(value: Any, description: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int):
        raise Exact12V14JobError(f"{description} must be an integer")
    return value


def _validated_schedule_manifest(
    schedule_manifest: Mapping[str, Any], repo_root: Path
) -> dict[str, Any]:
    if not isinstance(schedule_manifest, Mapping):
        raise Exact12V14JobError("schedule manifest must be a JSON object")
    candidate = dict(schedule_manifest)
    try:
        validate_manifest(candidate, repo_root)
    except Exact12V14ScheduleError as exc:
        raise Exact12V14JobError("schedule manifest is not valid") from exc
    return candidate


def _cell_at(cell_index: Any) -> Exact12V14Cell:
    index = _require_plain_int(cell_index, "cell_index")
    schedule_cells = cells()
    if index < 0 or index >= len(schedule_cells):
        raise Exact12V14JobError(f"cell_index must lie in [0, {len(schedule_cells)})")
    return schedule_cells[index]


def build_job(
    schedule_manifest: Mapping[str, Any], repo_root: Path, cell_index: int
) -> dict[str, Any]:
    """Build one authenticated, deliberately non-executable cell job."""

    manifest = _validated_schedule_manifest(schedule_manifest, repo_root)
    cell = _cell_at(cell_index)
    return {
        "schema": JOB_SCHEMA,
        "semantic_status": SEMANTIC_STATUS,
        "scope": SCOPE,
        "schedule_manifest_sha256": json_sha256(manifest),
        "schedule_sha256": FROZEN_SCHEDULE_SHA256,
        "source_contract_sha256": json_sha256(manifest["source_contract"]),
        "cell_index": cell_index,
        "cell": asdict(cell),
        "execution_gate": {
            "status": EXECUTION_STATUS,
            "reason": "no reviewed source-to-CNF valuation contract is bound",
            "required_evidence": list(REQUIRED_SOURCE_TO_CNF_EVIDENCE),
        },
    }


def validate_job(
    job: Mapping[str, Any], schedule_manifest: Mapping[str, Any], repo_root: Path
) -> None:
    """Fail closed unless ``job`` is the canonical current cell descriptor."""

    if not isinstance(job, Mapping):
        raise Exact12V14JobError("job must be a JSON object")
    required = {
        "schema",
        "semantic_status",
        "scope",
        "schedule_manifest_sha256",
        "schedule_sha256",
        "source_contract_sha256",
        "cell_index",
        "cell",
        "execution_gate",
    }
    if set(job) != required:
        raise Exact12V14JobError("job fields differ from the frozen schema")
    index = _require_plain_int(job["cell_index"], "cell_index")
    expected = build_job(schedule_manifest, repo_root, index)
    if dict(job) != expected:
        raise Exact12V14JobError("job differs from the canonical cell descriptor")


def assert_execution_ready(
    job: Mapping[str, Any], schedule_manifest: Mapping[str, Any], repo_root: Path
) -> None:
    """Reject execution until a future schema binds reviewed CNF semantics."""

    validate_job(job, schedule_manifest, repo_root)
    raise Exact12V14JobError(
        "solver execution is blocked: source-to-CNF valuation is unverified"
    )


def build_job_set(
    schedule_manifest: Mapping[str, Any], repo_root: Path
) -> dict[str, Any]:
    """Authenticate the canonical complete set of 648 blocked jobs."""

    manifest = _validated_schedule_manifest(schedule_manifest, repo_root)
    entries = [
        {
            "cell_index": index,
            "job_sha256": json_sha256(build_job(manifest, repo_root, index)),
        }
        for index in range(len(cells()))
    ]
    return {
        "schema": JOB_SET_SCHEMA,
        "semantic_status": SEMANTIC_STATUS,
        "scope": SCOPE,
        "schedule_manifest_sha256": json_sha256(manifest),
        "schedule_sha256": FROZEN_SCHEDULE_SHA256,
        "job_count": len(entries),
        "jobs": entries,
    }


def validate_job_set(
    job_set: Mapping[str, Any],
    schedule_manifest: Mapping[str, Any],
    repo_root: Path,
) -> None:
    """Reject missing, duplicated, reordered, or tampered job-set entries."""

    if not isinstance(job_set, Mapping):
        raise Exact12V14JobError("job set must be a JSON object")
    required = {
        "schema",
        "semantic_status",
        "scope",
        "schedule_manifest_sha256",
        "schedule_sha256",
        "job_count",
        "jobs",
    }
    if set(job_set) != required:
        raise Exact12V14JobError("job-set fields differ from the frozen schema")
    count = _require_plain_int(job_set["job_count"], "job_count")
    if count != len(cells()):
        raise Exact12V14JobError("job set does not contain all schedule cells")
    expected = build_job_set(schedule_manifest, repo_root)
    if dict(job_set) != expected:
        raise Exact12V14JobError("job set differs from the canonical complete set")


def current_job_set(repo_root: Path) -> dict[str, Any]:
    """Build the complete blocked job set against the current Lean sources."""

    manifest = build_manifest(repo_root)
    return build_job_set(manifest, repo_root)
