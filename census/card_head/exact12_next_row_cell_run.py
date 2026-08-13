"""Execute one authenticated exact-12 next-row-only-hit successor cell.

SAT discovery is accepted only after independent replay of the source-faithful
candidate surface, every successor constraint, and every emitted CNF clause.
A discovery UNSAT is accepted only after a fresh identical-CNF solve produces
a DRAT proof verified by the existing solver adapter.

Even ``UNSAT_DRAT_VERIFIED`` concerns one finite placement cell only.  It is
not aggregate placement coverage, a universal lift, or a Lean sorry closure.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import stat
from collections.abc import Callable, Collection
from pathlib import Path
from typing import Any

from .candidate_surface import build_model
from .exact12_next_row_valuation import (
    COMPILER_SCHEMA,
    LEAN_INGRESS_THEOREM,
    CompiledExact12NextRowCell,
    Exact12NextRowValuationError,
    added_constraints_hold,
    cells,
    compile_cell,
    decode_blockers,
    decode_distinguished_d,
)
from .sat_encoding import CadicalResult, EncodingError, solve_cadical
from .source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
    source_faithful_cube_ok,
)

RUN_SCHEMA = "p97_rigid221_exact12_next_row_only_hit_cell_run.v1"
JOB_SCHEMA = "p97_rigid221_exact12_next_row_only_hit_bound_job.v1"
SUCCESS_STATUSES = frozenset({"SAT_WITNESS_REPLAYED", "UNSAT_DRAT_VERIFIED"})

SOURCE_PATHS = (
    "census/card_head/source_faithful_candidate_surface.py",
    "census/card_head/exact12_next_row_valuation.py",
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NextRowJobSemantics.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221NormalizedNextRowOnlyHitIngress.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "ExactTwelveRigid221V14SourceJobBridge.lean"
    ),
)


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _json_bytes(value: Any) -> bytes:
    return (json.dumps(value, sort_keys=True, indent=2) + "\n").encode("utf-8")


def _json_sha256(value: Any) -> str:
    return hashlib.sha256(_json_bytes(value)).hexdigest()


def _write_bytes(path: Path, payload: bytes) -> None:
    temporary = path.with_name(f".{path.name}.tmp")
    temporary.write_bytes(payload)
    temporary.replace(path)


def _write_json(path: Path, value: Any) -> None:
    _write_bytes(path, _json_bytes(value))


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
        workdir.mkdir(parents=True, exist_ok=False, mode=0o700)
    except FileExistsError as exc:
        try:
            metadata = workdir.lstat()
        except OSError as stat_exc:
            raise EncodingError(
                f"cannot inspect existing workdir: {workdir}"
            ) from stat_exc
        if not stat.S_ISDIR(metadata.st_mode):
            raise EncodingError(f"workdir is not a directory: {workdir}") from exc
        if stat.S_IMODE(metadata.st_mode) != 0o700:
            raise EncodingError(
                f"existing workdir must have exact mode 0700: {workdir}"
            ) from exc
        stale = next(workdir.iterdir(), None)
        if stale is not None:
            raise EncodingError(
                f"workdir must be empty; found stale artifact: {stale.name}"
            ) from exc
    try:
        metadata = workdir.lstat()
    except OSError as exc:
        raise EncodingError(f"cannot inspect claimed workdir: {workdir}") from exc
    if not stat.S_ISDIR(metadata.st_mode) or stat.S_IMODE(metadata.st_mode) != 0o700:
        raise EncodingError(f"claimed workdir must have exact mode 0700: {workdir}")

    lock_path = workdir / ".exact12_next_row_cell_run.lock"
    try:
        lock_path.touch(mode=0o600, exist_ok=False)
        lock_path.chmod(0o600)
    except FileExistsError as exc:
        raise EncodingError(f"workdir is already claimed: {workdir}") from exc
    stale = next((path for path in workdir.iterdir() if path != lock_path), None)
    if stale is not None:
        lock_path.unlink()
        raise EncodingError(
            f"workdir must be empty; found stale artifact: {stale.name}"
        )
    return lock_path


def _source_manifest(repo_root: Path) -> list[dict[str, Any]]:
    artifacts: list[dict[str, Any]] = []
    for relative in SOURCE_PATHS:
        path = repo_root / relative
        if not path.is_file():
            raise EncodingError(f"required source is missing: {relative}")
        artifacts.append(
            {
                "path": relative,
                "bytes": path.stat().st_size,
                "sha256": _sha256_file(path),
            }
        )
    return artifacts


def _build_job(
    repo_root: Path,
    compiled: CompiledExact12NextRowCell,
    cnf_bytes: bytes,
) -> dict[str, Any]:
    payload = {
        "schema": JOB_SCHEMA,
        "scope": (
            "one finite next-row-only-hit placement cell; no aggregate coverage, "
            "universal lift, terminal bank, or Lean-closure claim"
        ),
        "compiler_schema": COMPILER_SCHEMA,
        "candidate_schema": SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
        "candidate_profile": list(SOURCE_FAITHFUL_PYTHON_PROFILE),
        "lean_ingress_theorem": LEAN_INGRESS_THEOREM,
        "compiler_manifest": compiled.manifest(),
        "cnf": {
            "bytes": len(cnf_bytes),
            "sha256": hashlib.sha256(cnf_bytes).hexdigest(),
            "variables": compiled.final_n_variables,
            "clauses": compiled.final_n_clauses,
        },
        "sources": _source_manifest(repo_root),
    }
    return {**payload, "job_id": _json_sha256(payload)}


def cnf_assignment_satisfies(
    clauses: Collection[Collection[int]],
    positive_variables: Collection[int],
    *,
    n_variables: int | None = None,
) -> bool:
    """Replay a total DIMACS assignment represented by its positive variables."""

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
    return all(
        any(
            (literal > 0 and literal in positive)
            or (literal < 0 and -literal not in positive)
            for literal in clause
        )
        for clause in clauses
    )


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
    """Materialize, solve, replay, and authenticate one finite successor cell."""

    if isinstance(cell_index, bool) or not isinstance(cell_index, int):
        raise EncodingError("cell_index must be a plain integer")
    schedule = cells()
    if not 0 <= cell_index < len(schedule):
        raise EncodingError(f"cell_index must lie in [0, {len(schedule) - 1}]")
    if timeout_seconds <= 0:
        raise EncodingError("timeout_seconds must be positive")
    if not 1 <= nice <= 19:
        raise EncodingError("nice must lie in [1, 19]")

    lock_path = _claim_empty_workdir(workdir)
    try:
        instance = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        compiled = compile_cell(instance, schedule[cell_index])
        cnf_bytes = instance.dimacs().encode("ascii")
        job = _build_job(repo_root, compiled, cnf_bytes)
        clause_delta = {
            "schema": "p97_rigid221_exact12_next_row_only_hit_clause_delta.v1",
            "job_id": job["job_id"],
            "clauses": [list(clause) for clause in compiled.clause_delta],
            "sha256": compiled.clause_delta_sha256,
        }

        job_path = workdir / "job.json"
        clause_delta_path = workdir / "clause_delta.json"
        discovery_cnf_path = workdir / "discovery.cnf"
        terminal_cnf_path = workdir / "terminal.cnf"
        proof_path = workdir / "terminal.drat"
        model_path = workdir / "model.json"
        _write_json(job_path, job)
        _write_json(clause_delta_path, clause_delta)
        _write_bytes(discovery_cnf_path, cnf_bytes)

        discovery = solver(
            instance,
            discovery_cnf_path,
            timeout_seconds=timeout_seconds,
            nice=nice,
            proof_path=None,
        )
        terminal: CadicalResult | None = None
        candidate_replayed = False
        added_constraints_replayed = False
        exact_cnf_replayed = False
        model_replayed = False
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
                    d = decode_distinguished_d(
                        positive, compiled.distinguished_d_variables
                    )
                    candidate_replayed = source_faithful_cube_ok(instance.model, cube)
                    added_constraints_replayed = added_constraints_hold(
                        compiled.cell, cube, blockers, d
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
                            "cube": {
                                str(center): row for center, row in sorted(cube.items())
                            },
                            "blockers": {
                                str(source): center
                                for source, center in sorted(blockers.items())
                            },
                            "distinguished_d": d,
                            "positive_variables": sorted(positive),
                            "replay": {
                                "candidate": candidate_replayed,
                                "added_constraints": added_constraints_replayed,
                                "exact_cnf": exact_cnf_replayed,
                            },
                        },
                    )
                except (Exact12NextRowValuationError, EncodingError, ValueError) as exc:
                    error = f"SAT replay failed: {exc}"
                if model_replayed:
                    status = "SAT_WITNESS_REPLAYED"
                else:
                    status = "SAT_REPLAY_FAILED"
                    error = error or "SAT model failed an independent replay gate"
        elif discovery.verdict == "UNSAT":
            _write_bytes(terminal_cnf_path, cnf_bytes)
            terminal = solver(
                instance,
                terminal_cnf_path,
                timeout_seconds=timeout_seconds,
                nice=nice,
                proof_path=proof_path,
            )
            terminal_matches = (
                terminal_cnf_path.is_file()
                and _sha256_file(terminal_cnf_path) == job["cnf"]["sha256"]
            )
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
            "clause_delta": _artifact(clause_delta_path),
            "discovery_cnf": _artifact(discovery_cnf_path),
            "model": _artifact(model_path),
            "terminal_cnf": _artifact(terminal_cnf_path),
            "proof": _artifact(proof_path),
        }
        required_ok = (
            artifacts["job"] is not None
            and artifacts["job"]["sha256"] == _json_sha256(job)
            and artifacts["clause_delta"] is not None
            and artifacts["clause_delta"]["sha256"] == _json_sha256(clause_delta)
            and artifacts["discovery_cnf"] is not None
            and artifacts["discovery_cnf"]["sha256"] == job["cnf"]["sha256"]
        )
        if not required_ok:
            status = "ARTIFACT_ERROR"
            error = "required job, clause delta, or discovery CNF failed authentication"

        summary = {
            "schema": RUN_SCHEMA,
            "scope": (
                "one finite next-row-only-hit placement cell; no aggregate "
                "coverage, universal lift, terminal bank, or Lean-closure claim"
            ),
            "job_schema": JOB_SCHEMA,
            "job_id": job["job_id"],
            "job_sha256": _json_sha256(job),
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
