"""Append and solve one theorem-authorized successor on a legacy PIQD session.

The exact-17 session predates the local-custody journal runner.  This adapter
therefore starts from the authenticated live snapshot contract, but unlike the
preappended recovery adapter it performs one ordinary clause append.  Its only
production entry point cold-validates the complete post-wave theorem lineage,
then consumes that already-validated token exactly once.

The result is discovery evidence only.  It is neither a proof certificate nor
a Lean closure claim.
"""

from __future__ import annotations

import argparse
import json
from collections.abc import Sequence
from pathlib import Path

from census.p97_search.phase3_piqd_incremental_discovery import (
    SESSION_KEYS,
    _check_clause,
)
from census.p97_search.phase3_piqd_postwave_gate import (
    ValidatedPostwaveReceipt,
    load_postwave_lineage,
)
from census.p97_search.phase3_piqd_preappended_snapshot import (
    PiqdPreappendedSnapshotError,
    PiqdPreappendedSnapshotRunner,
    RootIdentity,
    SnapshotSolveResult,
    _hex64,
    _integer,
    _root_identity,
    _strict_value,
)
from census.p97_search.phase3_piqd_theorem_gated_discovery import (
    run_validated_successor,
)

SCHEMA = "p97-piqd-legacy-snapshot-successor-v1"


class PiqdLegacySnapshotSuccessorError(PiqdPreappendedSnapshotError):
    """A legacy-session append transition could not be authenticated."""


class PiqdLegacySnapshotSuccessorRunner(PiqdPreappendedSnapshotRunner):
    """Own exactly one append/solve transition on an authenticated old session."""

    def __init__(
        self,
        base_url: str,
        session_id: str,
        input_root_path: Path,
        successor_root_path: Path,
        *,
        validated_receipt: ValidatedPostwaveReceipt,
        snapshot_path: Path,
        raw_response_path: Path,
        capture_path: Path,
        model_path: Path,
        transport=None,
        export_digest=None,
    ) -> None:
        authorization = validated_receipt.authorization
        input_root = _root_identity(Path(input_root_path).absolute())
        self.successor_root_path = Path(successor_root_path).absolute()
        self._successor_root = _root_identity(self.successor_root_path)
        if not authorization.successor_authorized:
            raise PiqdLegacySnapshotSuccessorError(
                "validated receipt does not authorize a successor"
            )
        if authorization.successor_root_sha256 is None:
            raise PiqdLegacySnapshotSuccessorError(
                "validated receipt does not name a successor root"
            )
        if (
            authorization.source_session_id != session_id
            or authorization.input_root_sha256 != input_root.sha256
            or authorization.successor_root_sha256 != self._successor_root.sha256
        ):
            raise PiqdLegacySnapshotSuccessorError(
                "validated receipt does not bind the requested legacy transition"
            )
        self._appended = False
        self._closed = False
        super().__init__(
            base_url,
            session_id,
            input_root_path,
            expected_solve_count=authorization.source_solve_index,
            expected_solver_sha256=authorization.source_solver_sha256,
            expected_pending_clauses=0,
            snapshot_path=snapshot_path,
            raw_response_path=raw_response_path,
            capture_path=capture_path,
            model_path=model_path,
            transport=transport,
            export_digest=export_digest,
            # The validated post-wave lineage already authenticates the source
            # solve.  Reparse only the current receipt schemas and root/export.
            authenticate_history=False,
        )
        self._input_root = input_root
        if self._root != self._input_root:
            raise PiqdLegacySnapshotSuccessorError(
                "authenticated input root changed during runner construction"
            )
        self._check_successor_shape(self._input_root, self._successor_root)

    @staticmethod
    def _check_successor_shape(
        input_root: RootIdentity, successor_root: RootIdentity
    ) -> None:
        if successor_root.variables != input_root.variables:
            raise PiqdLegacySnapshotSuccessorError(
                "successor changes the authenticated variable universe"
            )
        if successor_root.clauses <= input_root.clauses:
            raise PiqdLegacySnapshotSuccessorError(
                "successor must add at least one clause"
            )

    def append_clauses(self, clauses: Sequence[Sequence[int]]) -> int:
        if self._appended:
            raise PiqdLegacySnapshotSuccessorError(
                "legacy successor append is one-shot"
            )
        if self._closed:
            raise PiqdLegacySnapshotSuccessorError("legacy session is closed")
        if _root_identity(self.root_path) != self._input_root:
            raise PiqdLegacySnapshotSuccessorError("local input root changed")
        if _root_identity(self.successor_root_path) != self._successor_root:
            raise PiqdLegacySnapshotSuccessorError("local successor root changed")

        additions = tuple(
            _check_clause(clause, self._input_root.variables) for clause in clauses
        )
        expected_added = self._successor_root.clauses - self._input_root.clauses
        if len(additions) != expected_added or not additions:
            raise PiqdLegacySnapshotSuccessorError(
                "authorized fragment does not match successor clause delta"
            )

        response = self._json(
            "POST",
            f"/sessions/{self._session_id}/clauses",
            {"clauses": [list(clause) for clause in additions]},
        )
        if set(response) != {"added", "clauses", "max_var"}:
            raise PiqdLegacySnapshotSuccessorError(
                "PIQD clause response has an inexact schema"
            )
        added = _integer(response["added"], label="append.added", minimum=1)
        total = _integer(response["clauses"], label="append.clauses", minimum=1)
        max_var = _integer(response["max_var"], label="append.max_var", minimum=1)
        if (
            added != len(additions)
            or total != self._successor_root.clauses
            or max_var != self._successor_root.variables
        ):
            raise PiqdLegacySnapshotSuccessorError(
                "PIQD did not acknowledge the exact successor frontier"
            )

        self.root_path = self.successor_root_path
        self._root = self._successor_root
        self.expected_pending_clauses = len(additions)
        if (
            self._export_digest(f"{self.base_url}/sessions/{self._session_id}/cnf")
            != self._root.sha256
        ):
            raise PiqdLegacySnapshotSuccessorError(
                "PIQD export differs from the authorized successor root"
            )
        session, receipts = self._authenticate_present_snapshot()
        if receipts != self._receipts_before:
            raise PiqdLegacySnapshotSuccessorError(
                "PIQD receipt history changed during append"
            )
        self._session_before = session
        self._receipts_before = receipts
        self._appended = True
        return added

    def close(self) -> None:
        if self._closed:
            return
        response = self._request_any_status("DELETE", f"/sessions/{self._session_id}")
        if not 200 <= response.status < 300:
            raise PiqdLegacySnapshotSuccessorError(
                f"PIQD session close returned HTTP {response.status}"
            )
        try:
            payload = _strict_value(response.body, label="PIQD close response")
        except Exception as exc:
            raise PiqdLegacySnapshotSuccessorError(
                "PIQD close response is not strict JSON"
            ) from exc
        if (
            type(payload) is not dict
            or set(payload) - {"solver_stats"} != SESSION_KEYS
            or payload.get("id") != self._session_id
            or payload.get("lane") != "sat"
            or payload.get("state") != "closed"
            or _hex64(payload.get("solver_sha256"), label="close.solver_sha256")
            != self._solver_sha256
            or _integer(payload.get("solves"), label="close.solves")
            != self._solve_count
        ):
            raise PiqdLegacySnapshotSuccessorError(
                "PIQD close did not authenticate the closed session"
            )
        self._closed = True


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--session-id", required=True)
    parser.add_argument("--input-root", type=Path, required=True)
    parser.add_argument("--successor-root", type=Path, required=True)
    parser.add_argument("--snapshot", type=Path, required=True)
    parser.add_argument("--raw-response", type=Path, required=True)
    parser.add_argument("--capture", type=Path, required=True)
    parser.add_argument("--model", type=Path, required=True)
    parser.add_argument("--postwave-receipt", type=Path, required=True)
    parser.add_argument("--repo-root", type=Path, required=True)
    parser.add_argument("--timeout-ms", type=int)
    parser.add_argument("--conflict-limit", type=int)
    args = parser.parse_args()

    repo_root = args.repo_root.resolve(strict=True)
    validated_receipt = load_postwave_lineage(
        args.postwave_receipt, repo_root=repo_root
    ).latest
    authorization = validated_receipt.authorization
    runner = PiqdLegacySnapshotSuccessorRunner(
        args.base_url,
        args.session_id,
        args.input_root,
        args.successor_root,
        validated_receipt=validated_receipt,
        snapshot_path=args.snapshot,
        raw_response_path=args.raw_response,
        capture_path=args.capture,
        model_path=args.model,
    )
    authorization, result = run_validated_successor(
        runner,
        authorization=authorization,
        timeout_ms=args.timeout_ms,
        conflict_limit=args.conflict_limit,
    )
    print(
        json.dumps(
            {
                "schema": SCHEMA,
                "session_id": runner.session_id,
                "source_solve_index": authorization.source_solve_index,
                "solve_index": result.solve_index,
                "status": result.status,
                "root_sha256": result.root_sha256,
                "root_clauses": result.root_clauses,
                "proof_verified": False,
                "closure_claim": False,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())


__all__ = [
    "SCHEMA",
    "PiqdLegacySnapshotSuccessorError",
    "PiqdLegacySnapshotSuccessorRunner",
    "SnapshotSolveResult",
]
