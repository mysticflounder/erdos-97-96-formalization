"""Run one PIQD successor wave through the mandatory theorem-search gate."""

from __future__ import annotations

from collections.abc import Sequence
from pathlib import Path
from typing import Protocol

from census.p97_search.phase3_piqd_postwave_gate import (
    PostwaveAuthorization,
    PostwaveGateError,
    load_postwave_authorization,
)


class TheoremGatedDiscoveryError(RuntimeError):
    """The theorem-search authorization cannot be safely consumed."""


class IncrementalDiscoveryRunner[ResultT](Protocol):
    """Narrow runner surface needed by the one-wave gate."""

    @property
    def exported_cnf_sha256(self) -> str: ...

    @property
    def session_id(self) -> str: ...

    @property
    def solve_count(self) -> int: ...

    @property
    def solver_sha256(self) -> str: ...

    def append_clauses(self, clauses: Sequence[Sequence[int]]) -> int: ...

    def close(self) -> None: ...

    def solve(
        self, *, timeout_ms: int | None = None, conflict_limit: int | None = None
    ) -> ResultT: ...


def _terminalize_failed_transition[ResultT](
    runner: IncrementalDiscoveryRunner[ResultT],
    *,
    message: str,
    cause: Exception | None = None,
) -> None:
    try:
        runner.close()
    except Exception as close_exc:
        raise TheoremGatedDiscoveryError(
            f"{message}; the session could not be terminalized"
        ) from close_exc
    error = TheoremGatedDiscoveryError(f"{message}; the session was terminalized")
    if cause is None:
        raise error
    raise error from cause


def _load_authorization(
    *, postwave_receipt: Path, repo_root: Path
) -> PostwaveAuthorization:
    try:
        authorization = load_postwave_authorization(
            postwave_receipt, repo_root=repo_root
        )
    except (OSError, PostwaveGateError) as exc:
        raise TheoremGatedDiscoveryError(
            "post-wave theorem-search receipt failed validation"
        ) from exc
    if not authorization.successor_authorized:
        raise TheoremGatedDiscoveryError(
            "post-wave review found no source-backed reusable theorem"
        )
    if authorization.successor_root_sha256 is None:
        raise TheoremGatedDiscoveryError(
            "post-wave authorization does not name a successor root"
        )
    return authorization


def _check_source_solve[ResultT](
    runner: IncrementalDiscoveryRunner[ResultT],
    authorization: PostwaveAuthorization,
) -> None:
    if runner.session_id != authorization.source_session_id:
        raise TheoremGatedDiscoveryError(
            "PIQD session does not match the authorized source solve"
        )
    if runner.solve_count != authorization.source_solve_index:
        raise TheoremGatedDiscoveryError(
            "PIQD solve frontier does not match the authorized source solve"
        )
    if runner.solver_sha256 != authorization.source_solver_sha256:
        raise TheoremGatedDiscoveryError(
            "PIQD solver binary does not match the authorized source solve"
        )


def run_authorized_successor[ResultT](
    runner: IncrementalDiscoveryRunner[ResultT],
    *,
    postwave_receipt: Path,
    repo_root: Path,
    timeout_ms: int | None = None,
    conflict_limit: int | None = None,
) -> tuple[PostwaveAuthorization, ResultT]:
    """Append and solve exactly one source-backed successor.

    The function deliberately exposes no unguarded solve path.  A reusable
    theorem receipt must bind the runner's current exported root, the exact
    admitted fragment, and the daemon export after append.  A negative review
    is terminal for this call.
    """

    authorization = _load_authorization(
        postwave_receipt=postwave_receipt, repo_root=repo_root
    )
    _check_source_solve(runner, authorization)
    if runner.exported_cnf_sha256 != authorization.input_root_sha256:
        raise TheoremGatedDiscoveryError(
            "PIQD frontier does not match the authorized input root"
        )

    clauses = authorization.admitted_clauses
    if not clauses:
        raise TheoremGatedDiscoveryError("authorization contains no admitted clauses")
    try:
        added = runner.append_clauses(clauses)
    except Exception as exc:  # noqa: BLE001 - runner is an external protocol boundary
        _terminalize_failed_transition(runner, message="PIQD append failed", cause=exc)
    if added != len(clauses):
        _terminalize_failed_transition(
            runner, message="PIQD did not append the complete authorized fragment"
        )
    if runner.exported_cnf_sha256 != authorization.successor_root_sha256:
        _terminalize_failed_transition(
            runner, message="PIQD export does not match the authorized successor root"
        )

    result = runner.solve(timeout_ms=timeout_ms, conflict_limit=conflict_limit)
    return authorization, result


def run_authorized_preappended_successor[ResultT](
    runner: IncrementalDiscoveryRunner[ResultT],
    *,
    postwave_receipt: Path,
    repo_root: Path,
    timeout_ms: int | None = None,
    conflict_limit: int | None = None,
) -> tuple[PostwaveAuthorization, ResultT]:
    """Solve one authorized successor whose fragment is already appended.

    This is the fail-closed recovery path for an append that completed before
    the theorem-gated controller took custody.  The receipt must identify the
    runner's exact session and latest solve, and the daemon export must already
    equal the authenticated successor root.  A repeated call after a solve is
    rejected by the solve-frontier check.
    """

    authorization = _load_authorization(
        postwave_receipt=postwave_receipt, repo_root=repo_root
    )
    _check_source_solve(runner, authorization)
    if runner.exported_cnf_sha256 != authorization.successor_root_sha256:
        raise TheoremGatedDiscoveryError(
            "PIQD frontier does not match the authorized preappended successor root"
        )
    result = runner.solve(timeout_ms=timeout_ms, conflict_limit=conflict_limit)
    return authorization, result


__all__ = [
    "IncrementalDiscoveryRunner",
    "TheoremGatedDiscoveryError",
    "run_authorized_preappended_successor",
    "run_authorized_successor",
]
