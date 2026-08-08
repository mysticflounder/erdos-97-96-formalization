"""Run the frozen exact-12 Rigid221 source-safe SAT contract.

This is an artifact runner, not a stronger encoding.  It always constructs
``SourceFaithfulCoverInstance`` and records the candidate schema and the exact
CNF hash alongside the solver verdict.  SAT models are replayed through the
independent semantic cube validator; UNSAT is accepted only after the existing
``solve_cadical`` path verifies the requested DRAT proof.  The semantic status
is deliberately separate from the raw solver verdict.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections.abc import Callable, Collection, Mapping
from pathlib import Path
from typing import Any

from .candidate_surface import build_model
from .sat_encoding import CadicalResult, EncodingError, solve_cadical
from .source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
    SOURCE_FAITHFUL_EXCLUDED_RULES,
    SOURCE_FAITHFUL_INCLUDED_RULES,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SOURCE_FAITHFUL_SCOPE,
    SourceFaithfulCoverInstance,
    source_faithful_cube_ok,
)

SOURCE_FAITHFUL_RUN_SCHEMA = "p97_rigid221_exact12_source_safe_run.v2"
SOURCE_FAITHFUL_SUCCESS_STATUSES = frozenset(
    {"SAT_WITNESS", "UNSAT_DRAT_VERIFIED"}
)


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _write_json(path: Path, value: Any) -> None:
    temporary = path.with_name(f".{path.name}.tmp")
    temporary.write_text(
        json.dumps(value, sort_keys=True, indent=2) + "\n", encoding="utf-8"
    )
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
    """Require an empty run directory and claim it against concurrent runs."""

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

    lock_path = workdir / ".source_faithful_run.lock"
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


def _append_error(current: str | None, extra: str) -> str:
    return extra if current is None else f"{current}; {extra}"


def cnf_assignment_satisfies(
    clauses: Collection[Collection[int]],
    positive_variables: Collection[int],
    *,
    n_variables: int,
) -> bool:
    """Replay a complete DIMACS assignment represented by its true variables.

    The absent variables in this representation are false.  The replay still
    rejects malformed or out-of-range true-variable identifiers before it
    evaluates any clause.
    """

    try:
        positive = frozenset(positive_variables)
    except (TypeError, ValueError):
        return False
    if (
        isinstance(n_variables, bool)
        or not isinstance(n_variables, int)
        or n_variables < 0
    ):
        return False
    if any(
        isinstance(variable, bool)
        or not isinstance(variable, int)
        or not 1 <= variable <= n_variables
        for variable in positive
    ):
        return False
    return all(
        any(
            (literal > 0 and literal in positive)
            or (literal < 0 and -literal not in positive)
            for literal in clause
        )
        for clause in clauses
    )


def _cubes_match(
    expected: Mapping[int, Collection[int]],
    reported: Mapping[int, Collection[int]],
) -> bool:
    """Compare decoded and reported cubes while preserving row multiplicity."""

    try:
        normalized_expected = {
            center: tuple(sorted(candidate))
            for center, candidate in expected.items()
        }
        normalized_reported = {
            center: tuple(sorted(candidate))
            for center, candidate in reported.items()
        }
    except (AttributeError, TypeError, ValueError):
        return False
    return normalized_expected == normalized_reported


def run_source_faithful(
    workdir: Path,
    *,
    timeout_seconds: int = 60,
    nice: int = 10,
    solver: Callable[..., CadicalResult] = solve_cadical,
) -> dict[str, Any]:
    """Persist and solve the frozen source-safe CNF, then write a run record."""

    lock_path = _claim_empty_workdir(workdir)
    try:
        model = build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        instance = SourceFaithfulCoverInstance(model)
        cnf_path = workdir / "base.cnf"
        proof_path = workdir / "base.drat"
        model_path = workdir / "model.json"

        # Persist the exact input before entering the solver/proof pipeline so
        # even an exception has an authenticated CNF artifact.
        cnf_path.write_text(instance.dimacs(), encoding="utf-8")
        expected_cnf_sha256 = _sha256_file(cnf_path)

        result: CadicalResult | None = None
        pipeline_error: str | None = None
        try:
            result = solver(
                instance,
                cnf_path,
                timeout_seconds=timeout_seconds,
                nice=nice,
                proof_path=proof_path,
            )
        except (EncodingError, OSError) as exc:
            pipeline_error = str(exc)

        cnf_artifact = _artifact(cnf_path)
        proof_artifact = _artifact(proof_path)
        model_artifact: dict[str, Any] | None = None
        cube_replayed = False
        solver_verdict = result.verdict if result is not None else None
        returncode = result.returncode if result is not None else None
        proof_verified = result.proof_verified if result is not None else False
        solver_stdout_tail = result.stdout_tail if result is not None else None

        if result is None:
            status = "PIPELINE_ERROR"
            detail = "solver or DRAT verification failed before returning a result"
            error = pipeline_error or "solver returned no result"
        elif result.verdict == "SAT":
            replay_error: str | None = None
            if result.positive_variables is None:
                replay_error = "SAT result did not contain positive variables"
            elif result.cube is None:
                replay_error = "SAT result did not contain a decoded cube"
            else:
                try:
                    assignment_replayed = cnf_assignment_satisfies(
                        instance.clauses_with(),
                        result.positive_variables,
                        n_variables=instance.cnf.n_variables,
                    )
                    if not assignment_replayed:
                        replay_error = (
                            "SAT positive-variable assignment failed CNF replay"
                        )
                    else:
                        decoded_cube = instance.decode_model(
                            result.positive_variables
                        )
                        if not _cubes_match(decoded_cube, result.cube):
                            replay_error = (
                                "SAT positive-variable assignment disagrees with "
                                "the decoded cube"
                            )
                        else:
                            cube_replayed = source_faithful_cube_ok(
                                model, result.cube
                            )
                except (AttributeError, IndexError, KeyError, TypeError, ValueError) as exc:
                    replay_error = f"SAT replay raised: {exc}"
                if not cube_replayed and replay_error is None:
                    replay_error = "SAT cube failed independent semantic replay"

            if cube_replayed:
                _write_json(
                    model_path,
                    {
                        "schema": SOURCE_FAITHFUL_RUN_SCHEMA,
                        "candidate_schema": SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
                        "cube": result.cube,
                        "positive_variables": sorted(result.positive_variables),
                        "cube_replayed": True,
                    },
                )
                model_artifact = _artifact(model_path)
                status = "SAT_WITNESS"
                detail = "SAT cube passed independent semantic replay"
                error = None
            else:
                status = "SAT_MALFORMED"
                detail = "SAT was rejected by the semantic witness boundary"
                error = replay_error
        elif result.verdict == "UNSAT":
            if result.proof_verified and proof_artifact is not None:
                status = "UNSAT_DRAT_VERIFIED"
                detail = "UNSAT proof passed DRAT verification"
                error = None
            else:
                status = "UNSAT_UNVERIFIED"
                detail = "UNSAT was not accepted without a persisted verified proof"
                error = "proof_verified is false"
                if result.proof_verified:
                    error = "proof_verified is true but the proof artifact is missing"
        elif result.verdict == "TIMEOUT":
            status = "TIMEOUT"
            detail = "solver did not complete within the configured timeout"
            error = None
        elif result.verdict == "UNKNOWN":
            status = "UNKNOWN"
            detail = "solver completed without a SAT or UNSAT verdict"
            error = None
        else:
            status = "UNKNOWN"
            detail = "solver returned an unsupported verdict"
            error = f"unsupported solver verdict: {result.verdict!r}"

        if (
            cnf_artifact is None
            or cnf_artifact["sha256"] != expected_cnf_sha256
        ):
            error = _append_error(
                error, "persisted CNF is missing or differs from the frozen instance"
            )
            if status in SOURCE_FAITHFUL_SUCCESS_STATUSES:
                status = "ARTIFACT_ERROR"
                detail = "a success verdict lacked the authenticated frozen CNF"

        candidate_counts = {
            str(center): len(instance.candidates[center])
            for center in range(model.cardinality)
        }
        summary = {
            "schema": SOURCE_FAITHFUL_RUN_SCHEMA,
            "candidate_schema": SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
            "scope": SOURCE_FAITHFUL_SCOPE,
            "included_rules": list(SOURCE_FAITHFUL_INCLUDED_RULES),
            "excluded_rules": list(SOURCE_FAITHFUL_EXCLUDED_RULES),
            "cardinality": 12,
            "python_profile": list(SOURCE_FAITHFUL_PYTHON_PROFILE),
            "status": status,
            "solver_verdict": solver_verdict,
            "returncode": returncode,
            "proof_verified": proof_verified,
            "cube_replayed": cube_replayed,
            "timeout_seconds": timeout_seconds,
            "nice": nice,
            "counts": {
                "base_variables": instance.base_n_variables,
                "base_clauses": instance.base_n_clauses,
                "c2_nand_clauses": instance.n_c2_clauses,
                "candidate_classes_total": sum(candidate_counts.values()),
                "candidate_classes_by_center": candidate_counts,
            },
            "hashes": {
                "cnf_sha256": cnf_artifact["sha256"] if cnf_artifact else None,
                "model_sha256": model_artifact["sha256"] if model_artifact else None,
                "proof_sha256": proof_artifact["sha256"] if proof_artifact else None,
            },
            "artifacts": {
                "cnf": cnf_artifact,
                "model": model_artifact,
                "proof": proof_artifact,
            },
            "detail": detail,
            "error": error,
            "solver_stdout_tail": solver_stdout_tail,
        }
        _write_json(workdir / "summary.json", summary)
        return summary
    finally:
        lock_path.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--timeout-seconds", type=int, default=60)
    parser.add_argument("--nice", type=int, default=10)
    args = parser.parse_args()
    try:
        summary = run_source_faithful(
            args.workdir,
            timeout_seconds=args.timeout_seconds,
            nice=args.nice,
        )
    except (EncodingError, OSError) as exc:
        parser.error(str(exc))
    print(json.dumps(summary, sort_keys=True, indent=2))
    return 0 if summary["status"] in SOURCE_FAITHFUL_SUCCESS_STATUSES else 2


if __name__ == "__main__":
    raise SystemExit(main())
