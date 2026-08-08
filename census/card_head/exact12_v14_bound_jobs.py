"""Authenticated finite-CNF binding for one exact-12 normalized-v14 cell.

The v1 schedule jobs deliberately remain non-executable.  This module adds a
separate record that binds one of those jobs to the source-faithful candidate
surface, the reviewed finite predicate compiler, its independent replay
function, and the exact DIMACS bytes to be solved.

Execution of a bound job is suitable only for finite discovery.  A bound job
does not certify a solver result, authenticate a terminal proof, establish
aggregate 648-cell coverage, or close a Lean theorem.
"""

from __future__ import annotations

import hashlib
from collections.abc import Mapping
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any

from .candidate_surface import build_model
from .exact12_v14_jobs import build_job, validate_job
from .exact12_v14_schedule import Exact12V14Cell, cells, json_sha256
from .exact12_v14_valuation import (
    COMPILER_SCHEMA,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    CompiledExact12V14Cell,
    build_clause_delta_artifact,
    compile_cell,
    validate_clause_delta_artifact,
)
from .source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
    SourceFaithfulCoverInstance,
)

BOUND_JOB_SCHEMA = "p97_rigid221_exact12_full_v14_bound_job.v1"
SEMANTIC_STATUS = "FINITE_CNF_BOUND"
EXECUTION_STATUS = "FINITE_DISCOVERY_READY"

SCOPE = (
    "one authenticated finite normalized-v14 cell; execution may produce only "
    "finite discovery evidence; no certified terminal result, aggregate "
    "648-cell coverage, certificate replay, universal lift, or Lean closure"
)

CONTRACT_FILES: tuple[str, ...] = (
    "census/card_head/candidate_surface.py",
    "census/card_head/sat_encoding.py",
    "census/card_head/source_faithful_candidate_surface.py",
    "census/card_head/exact12_v14_schedule.py",
    "census/card_head/exact12_v14_jobs.py",
    "census/card_head/exact12_v14_valuation.py",
)


class Exact12V14BoundJobError(ValueError):
    """A bound job or one of its authenticated inputs is malformed."""


@dataclass(frozen=True)
class MaterializedExact12V14Cell:
    """The mutable CNF instance paired with immutable compiler metadata."""

    instance: SourceFaithfulCoverInstance
    compiled: CompiledExact12V14Cell


def _sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _contract_files(repo_root: Path) -> list[dict[str, Any]]:
    records: list[dict[str, Any]] = []
    for relative in CONTRACT_FILES:
        path = repo_root / relative
        if not path.is_file():
            raise Exact12V14BoundJobError(f"missing contract file: {relative}")
        records.append(
            {
                "path": relative,
                "bytes": path.stat().st_size,
                "sha256": _sha256_file(path),
            }
        )
    return records


def materialize_cell(cell_index: int) -> MaterializedExact12V14Cell:
    """Build the exact finite CNF for one canonical schedule cell."""

    if isinstance(cell_index, bool) or not isinstance(cell_index, int):
        raise Exact12V14BoundJobError("cell_index must be a plain integer")
    schedule_cells = cells()
    if not 0 <= cell_index < len(schedule_cells):
        raise Exact12V14BoundJobError(
            f"cell_index must lie in [0, {len(schedule_cells)})"
        )
    instance = SourceFaithfulCoverInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    compiled = compile_cell(instance, schedule_cells[cell_index])
    return MaterializedExact12V14Cell(instance, compiled)


def build_bound_job(
    schedule_manifest: Mapping[str, Any], repo_root: Path, cell_index: int
) -> dict[str, Any]:
    """Bind one canonical v1 job to exact compiler and DIMACS artifacts."""

    blocked_job = build_job(schedule_manifest, repo_root, cell_index)
    validate_job(blocked_job, schedule_manifest, repo_root)
    materialized = materialize_cell(cell_index)
    instance = materialized.instance
    compiled = materialized.compiled
    dimacs = instance.dimacs().encode("ascii")
    compiler_manifest = compiled.manifest()
    clause_delta_artifact = build_clause_delta_artifact(compiled, dimacs)
    contract_files = _contract_files(repo_root)
    dimacs_sha256 = _sha256_bytes(dimacs)
    return {
        "schema": BOUND_JOB_SCHEMA,
        "semantic_status": SEMANTIC_STATUS,
        "scope": SCOPE,
        "job_id": f"exact12-v14-{cell_index:04d}-{dimacs_sha256[:16]}",
        "cell_index": cell_index,
        "cell": asdict(cells()[cell_index]),
        "blocked_job_sha256": json_sha256(blocked_job),
        "source_to_cnf_contract": {
            "candidate_schema": SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
            "compiler_schema": COMPILER_SCHEMA,
            "compiler_symbol": "compile_cell",
            "independent_candidate_replay_symbol": "source_faithful_cube_ok",
            "independent_added_constraint_replay_symbol": "added_constraints_hold",
            "files": contract_files,
            "files_sha256": json_sha256(contract_files),
        },
        "compiler_manifest": compiler_manifest,
        "compiler_manifest_sha256": json_sha256(compiler_manifest),
        "clause_delta_artifact": clause_delta_artifact,
        "clause_delta_artifact_sha256": json_sha256(clause_delta_artifact),
        "cnf": {
            "encoding": "DIMACS",
            "bytes": len(dimacs),
            "n_variables": instance.cnf.n_variables,
            "n_clauses": len(instance.cnf.clauses),
            "sha256": dimacs_sha256,
        },
        "execution_gate": {
            "status": EXECUTION_STATUS,
            "allowed_outcomes": ["SAT", "UNKNOWN", "DISCOVERY_UNSAT"],
            "promotion": "FORBIDDEN_WITHOUT_TERMINAL_PROOF_AND_AGGREGATE_REPLAY",
        },
    }


def validate_bound_job(
    job: Mapping[str, Any],
    schedule_manifest: Mapping[str, Any],
    repo_root: Path,
) -> None:
    """Rebuild and compare every byte-bound field before finite execution."""

    if not isinstance(job, Mapping):
        raise Exact12V14BoundJobError("bound job must be a JSON object")
    if "cell_index" not in job:
        raise Exact12V14BoundJobError("bound job is missing cell_index")
    cell_index = job["cell_index"]
    if isinstance(cell_index, bool) or not isinstance(cell_index, int):
        raise Exact12V14BoundJobError("cell_index must be a plain integer")
    expected = build_bound_job(schedule_manifest, repo_root, cell_index)
    if dict(job) != expected:
        raise Exact12V14BoundJobError(
            "bound job differs from the current exact compiler/CNF binding"
        )


def instantiate_validated_bound_job(
    job: Mapping[str, Any],
    schedule_manifest: Mapping[str, Any],
    repo_root: Path,
) -> MaterializedExact12V14Cell:
    """Validate a record, then rebuild the instance supplied to the solver."""

    validate_bound_job(job, schedule_manifest, repo_root)
    materialized = materialize_cell(job["cell_index"])
    dimacs = materialized.instance.dimacs().encode("ascii")
    if _sha256_bytes(dimacs) != job["cnf"]["sha256"]:
        raise Exact12V14BoundJobError("rebuilt DIMACS does not match the bound job")
    try:
        validate_clause_delta_artifact(
            job["clause_delta_artifact"], materialized.compiled, dimacs
        )
    except (KeyError, TypeError, ValueError) as exc:
        raise Exact12V14BoundJobError(
            "bound job clause-delta artifact does not match rebuilt DIMACS"
        ) from exc
    return materialized


def bound_cell(job: Mapping[str, Any]) -> Exact12V14Cell:
    """Return the canonical cell named by a minimally well-typed record."""

    cell_index = job.get("cell_index")
    if isinstance(cell_index, bool) or not isinstance(cell_index, int):
        raise Exact12V14BoundJobError("cell_index must be a plain integer")
    schedule_cells = cells()
    if not 0 <= cell_index < len(schedule_cells):
        raise Exact12V14BoundJobError("cell_index is outside the schedule")
    return schedule_cells[cell_index]
