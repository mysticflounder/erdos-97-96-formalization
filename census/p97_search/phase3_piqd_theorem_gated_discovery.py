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


__all__ = [
    "IncrementalDiscoveryRunner",
    "TheoremGatedDiscoveryError",
    "run_authorized_successor",
]
