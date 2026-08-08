"""Execute one authenticated exact-12 normalized-v14 finite cell.

The runner separates SAT discovery from terminal proof production.  SAT models
are checked against every CNF clause, the source-faithful candidate validator,
and the independent normalized-v14 predicate replay.  A discovery UNSAT is
accepted only after a fresh identical-CNF run produces a DRAT proof verified by
the existing solver adapter.

Even ``UNSAT_DRAT_VERIFIED`` is only a terminal result for one finite cell.  It
does not establish aggregate 648-cell coverage, a universal lift, or Lean
closure.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections.abc import Callable, Collection
from pathlib import Path
from typing import Any

from .exact12_v14_bound_jobs import (
    BOUND_JOB_SCHEMA,
    build_bound_job,
    instantiate_validated_bound_job,
)
from .exact12_v14_schedule import build_manifest, json_sha256
from .exact12_v14_valuation import (
    added_constraints_hold,
    decode_blockers,
    validate_clause_delta_artifact,
)
from .sat_encoding import CadicalResult, EncodingError, solve_cadical
from .source_faithful_candidate_surface import source_faithful_cube_ok

RUN_SCHEMA = "p97_rigid221_exact12_full_v14_cell_run.v1"
SUCCESS_STATUSES = frozenset({"SAT_WITNESS_REPLAYED", "UNSAT_DRAT_VERIFIED"})


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _json_bytes(value: Any) -> bytes:
    return (json.dumps(value, sort_keys=True, indent=2) + "\n").encode("utf-8")


def _write_json(path: Path, value: Any) -> None:
    temporary = path.with_name(f".{path.name}.tmp")
    temporary.write_bytes(_json_bytes(value))
    temporary.replace(path)


def _artifact(path: Path) -> dict[str, Any] | None:
    if not path.is_file():
        return None
    return {
        "path": path.name,
        "bytes": path.stat().st_size,
        "sha256": _sha256_file(path),
    }


def _claim_empty_workdir(workdir: Path) -> Path:
    try:
        workdir.mkdir(parents=True, exist_ok=False)
    except FileExistsError as exc:
        if not workdir.is_dir():
            raise EncodingError(f"workdir is not a directory: {workdir}") from exc
        stale = next(workdir.iterdir(), None)
        if stale is not None:
            raise EncodingError(
                f"workdir must be empty; found stale artifact: {stale.name}"
            ) from exc

    lock_path = workdir / ".exact12_v14_cell_run.lock"
    try:
        lock_path.touch(exist_ok=False)
    except FileExistsError as exc:
        raise EncodingError(f"workdir is already claimed: {workdir}") from exc
    stale = next((path for path in workdir.iterdir() if path != lock_path), None)
    if stale is not None:
        lock_path.unlink()
        raise EncodingError(
            f"workdir must be empty; found stale artifact: {stale.name}"
        )
    return lock_path


def cnf_assignment_satisfies(
    clauses: Collection[Collection[int]],
    positive_variables: Collection[int],
    *,
    n_variables: int | None = None,
) -> bool:
    """Replay a DIMACS assignment represented by its positive variables."""

    positive = frozenset(positive_variables)
    if n_variables is not None and (
        isinstance(n_variables, bool)
        or not isinstance(n_variables, int)
        or n_variables < 0
    ):
        return False
    if any(
        isinstance(variable, bool) or not isinstance(variable, int) or variable <= 0
        for variable in positive
    ):
        return False
    if n_variables is not None and any(variable > n_variables for variable in positive):
        return False
    for clause in clauses:
        if not any(
            (literal > 0 and literal in positive)
            or (literal < 0 and -literal not in positive)
            for literal in clause
        ):
            return False
    return True


def _status_from_nonterminal(result: CadicalResult) -> tuple[str, str | None]:
    if result.verdict == "TIMEOUT":
        return "TIMEOUT", None
    if result.verdict == "UNKNOWN":
        return "UNKNOWN", None
    return "PIPELINE_ERROR", f"unsupported discovery verdict: {result.verdict!r}"


def run_cell(
    repo_root: Path,
    workdir: Path,
    cell_index: int,
    *,
    timeout_seconds: int = 60,
    nice: int = 10,
    solver: Callable[..., CadicalResult] = solve_cadical,
) -> dict[str, Any]:
    """Materialize, solve, replay, and authenticate one finite schedule cell."""

    if timeout_seconds <= 0:
        raise EncodingError("timeout_seconds must be positive")
    if not 1 <= nice <= 19:
        raise EncodingError("nice must lie in [1, 19]")

    lock_path = _claim_empty_workdir(workdir)
    try:
        schedule_manifest = build_manifest(repo_root)
        job = build_bound_job(schedule_manifest, repo_root, cell_index)
        materialized = instantiate_validated_bound_job(
            job, schedule_manifest, repo_root
        )
        instance = materialized.instance
        compiled = materialized.compiled

        job_path = workdir / "job.json"
        clause_delta_path = workdir / "clause_delta.json"
        discovery_cnf_path = workdir / "discovery.cnf"
        terminal_cnf_path = workdir / "terminal.cnf"
        proof_path = workdir / "terminal.drat"
        model_path = workdir / "model.json"
        clause_delta_artifact = job.get("clause_delta_artifact")
        if clause_delta_artifact is None and job.get("schema") == BOUND_JOB_SCHEMA:
            raise EncodingError("bound job is missing its clause-delta artifact")
        _write_json(job_path, job)
        if clause_delta_artifact is not None:
            _write_json(clause_delta_path, clause_delta_artifact)
        expected_job_file_sha256 = hashlib.sha256(_json_bytes(job)).hexdigest()
        discovery_cnf_path.write_text(instance.dimacs(), encoding="ascii")
        discovery_cnf_sha256 = _sha256_file(discovery_cnf_path)
        if discovery_cnf_sha256 != job["cnf"]["sha256"]:
            raise EncodingError("persisted discovery CNF differs from the bound job")
        if clause_delta_artifact is not None:
            try:
                validate_clause_delta_artifact(
                    clause_delta_artifact,
                    compiled,
                    discovery_cnf_path.read_bytes(),
                )
            except (KeyError, TypeError, ValueError) as exc:
                raise EncodingError(
                    "persisted clause-delta artifact differs from discovery CNF"
                ) from exc

        discovery = solver(
            instance,
            discovery_cnf_path,
            timeout_seconds=timeout_seconds,
            nice=nice,
            proof_path=None,
        )
        terminal: CadicalResult | None = None
        model_replayed = False
        candidate_replayed = False
        added_constraints_replayed = False
        exact_cnf_replayed = False
        error: str | None = None

        if discovery.verdict == "SAT":
            positive = discovery.positive_variables
            cube = discovery.cube
            if positive is None or cube is None:
                status = "PIPELINE_ERROR"
                error = "SAT result omitted positive variables or decoded cube"
            else:
                try:
                    blockers = decode_blockers(positive, compiled.blocker_variables)
                    candidate_replayed = source_faithful_cube_ok(instance.model, cube)
                    added_constraints_replayed = added_constraints_hold(
                        compiled.cell, cube, blockers
                    )
                    exact_cnf_replayed = cnf_assignment_satisfies(
                        instance.cnf.clauses,
                        positive,
                        n_variables=instance.cnf.n_variables,
                    )
                    model_replayed = (
                        candidate_replayed
                        and added_constraints_replayed
                        and exact_cnf_replayed
                    )
                    _write_json(
                        model_path,
                        {
                            "cell_index": cell_index,
                            "cube": {str(center): row for center, row in cube.items()},
                            "blockers": {
                                str(source): center
                                for source, center in sorted(blockers.items())
                            },
                            "positive_variables": sorted(positive),
                            "replay": {
                                "candidate": candidate_replayed,
                                "added_constraints": added_constraints_replayed,
                                "exact_cnf": exact_cnf_replayed,
                            },
                        },
                    )
                except (EncodingError, ValueError, TypeError) as exc:
                    error = f"SAT replay failed: {exc}"
                if model_replayed:
                    status = "SAT_WITNESS_REPLAYED"
                else:
                    status = "SAT_REPLAY_FAILED"
                    error = error or "SAT model failed an independent replay gate"
        elif discovery.verdict == "UNSAT":
            terminal_cnf_path.write_text(instance.dimacs(), encoding="ascii")
            terminal = solver(
                instance,
                terminal_cnf_path,
                timeout_seconds=timeout_seconds,
                nice=nice,
                proof_path=proof_path,
            )
            terminal_matches = _sha256_file(terminal_cnf_path) == discovery_cnf_sha256
            if (
                terminal.verdict == "UNSAT"
                and terminal.proof_verified
                and proof_path.is_file()
                and terminal_matches
            ):
                status = "UNSAT_DRAT_VERIFIED"
            else:
                status = "DISCOVERY_UNSAT_UNVERIFIED"
                error = (
                    "fresh terminal run did not reproduce a verified identical-CNF "
                    "UNSAT result"
                )
        else:
            status, error = _status_from_nonterminal(discovery)

        artifacts = {
            "job": _artifact(job_path),
            "clause_delta": (
                _artifact(clause_delta_path)
                if clause_delta_artifact is not None
                else None
            ),
            "discovery_cnf": _artifact(discovery_cnf_path),
            "model": _artifact(model_path),
            "terminal_cnf": _artifact(terminal_cnf_path),
            "proof": _artifact(proof_path),
        }
        if (
            artifacts["job"] is None
            or artifacts["job"]["sha256"] != expected_job_file_sha256
            or (
                clause_delta_artifact is not None
                and (
                    artifacts["clause_delta"] is None
                    or artifacts["clause_delta"]["sha256"]
                    != hashlib.sha256(_json_bytes(clause_delta_artifact)).hexdigest()
                )
            )
            or artifacts["discovery_cnf"] is None
            or artifacts["discovery_cnf"]["sha256"] != job["cnf"]["sha256"]
        ):
            status = "ARTIFACT_ERROR"
            error = "required job or discovery CNF artifact failed authentication"

        summary = {
            "schema": RUN_SCHEMA,
            "scope": (
                "one finite normalized-v14 cell only; no aggregate coverage, "
                "universal lift, or Lean-closure claim"
            ),
            "bound_job_schema": BOUND_JOB_SCHEMA,
            "job_id": job["job_id"],
            "job_sha256": json_sha256(job),
            "cell_index": cell_index,
            "status": status,
            "discovery_verdict": discovery.verdict,
            "terminal_verdict": terminal.verdict if terminal else None,
            "terminal_proof_verified": terminal.proof_verified if terminal else False,
            "replay": {
                "model": model_replayed,
                "candidate": candidate_replayed,
                "added_constraints": added_constraints_replayed,
                "exact_cnf": exact_cnf_replayed,
            },
            "timeout_seconds": timeout_seconds,
            "nice": nice,
            "artifacts": artifacts,
            "error": error,
            "discovery_stdout_tail": discovery.stdout_tail,
            "terminal_stdout_tail": terminal.stdout_tail if terminal else None,
        }
        _write_json(workdir / "summary.json", summary)
        return summary
    finally:
        lock_path.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--cell-index", type=int, required=True)
    parser.add_argument("--timeout-seconds", type=int, default=60)
    parser.add_argument("--nice", type=int, default=10)
    args = parser.parse_args()
    try:
        summary = run_cell(
            args.repo_root.resolve(),
            args.workdir,
            args.cell_index,
            timeout_seconds=args.timeout_seconds,
            nice=args.nice,
        )
    except (EncodingError, OSError, ValueError) as exc:
        parser.error(str(exc))
    print(json.dumps(summary, sort_keys=True, indent=2))
    return 0 if summary["status"] in SUCCESS_STATUSES else 2


if __name__ == "__main__":
    raise SystemExit(main())
