"""Replay the frozen exact-17 DirectSix refinement chain through PIQD.

This is a custody adapter, not a proof.  It requires the daemon's seeded root
export and final refined export to be byte-identical to the authenticated local
formulas while checking every append counter.  It performs no SAT solve and
claims no source coverage, universal lift, or theorem closure.
"""

from __future__ import annotations

import argparse
import filecmp
import hashlib
import json
import math
import urllib.error
import urllib.parse
import urllib.request
import uuid
from collections.abc import Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Protocol

from census.p97_search.phase3_cegar_wave import sha256_json
from census.p97_search.phase3_piqd_exact17_refinement_chain import (
    FrozenRefinementChain,
    canonical_json_bytes,
    load_fragment_clauses,
    reconstruct_aggregate,
    validate_manifest,
)
from census.p97_search.phase3_piqd_exact17_runner import _write_immutable
from census.p97_search.phase3_piqd_exact17_seeded_session import _expect_response
from census.p97_search.phase3_piqd_statement_bank_runner import (
    JsonHttpTransport,
    StatementBankRunnerError,
    UrllibJsonTransport,
    _extract_create_candidate_session_id,
    _validate_data_root,
    _validate_session,
)

REPLAY_SCHEMA = "p97-piqd-exact17-refinement-session/v1"
REPLAY_STATUS = "OBSERVATIONAL_ONLY"
DEFAULT_SOLVER = "piqd-satworker-cadical-3.0.0"
DEFAULT_LABEL = "P97 exact17 DirectSix frozen refinement replay"
DEFAULT_BASE_URL = "http://127.0.0.1:7272"
DEFAULT_TIMEOUT_S = 900.0
MAX_APPEND_JSON_BYTES = 64 * 1024 * 1024
_READ_CHUNK_BYTES = 1024 * 1024
_ADD_KEYS = frozenset({"added", "clauses", "max_var"})
_FALSE_CLAIMS = {
    "solver_invoked": False,
    "source_semantics_checked": False,
    "source_entitlement": False,
    "complete_source_coverage": False,
    "aggregate_order_case_coverage": False,
    "universal_lift": False,
    "theorem_closure": False,
    "daemon_attestation": False,
}


class RefinementSessionError(StatementBankRunnerError):
    """The exact-17 refinement replay failed closed."""


@dataclass(frozen=True)
class DownloadResponse:
    status: int
    byte_count: int
    sha256: str


class DownloadTransport(Protocol):
    def download(
        self, method: str, path: str, destination: Path, *, byte_cap: int
    ) -> DownloadResponse: ...


class _NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        return None


class UrllibDownloadTransport:
    """Stream a PIQD response into a fresh local file with a hard size cap."""

    def __init__(
        self,
        base_url: str = DEFAULT_BASE_URL,
        *,
        request_timeout_s: float = DEFAULT_TIMEOUT_S,
    ) -> None:
        parsed = urllib.parse.urlsplit(base_url)
        if (
            parsed.scheme not in {"http", "https"}
            or not parsed.netloc
            or parsed.username is not None
            or parsed.password is not None
            or parsed.query
            or parsed.fragment
            or parsed.path not in {"", "/"}
        ):
            raise RefinementSessionError("base_url must be a bare HTTP(S) origin")
        if not math.isfinite(request_timeout_s) or request_timeout_s <= 0:
            raise RefinementSessionError("request timeout must be positive and finite")
        self._base_url = base_url.rstrip("/")
        self._request_timeout_s = request_timeout_s
        self._opener = urllib.request.build_opener(_NoRedirect())

    def download(
        self, method: str, path: str, destination: Path, *, byte_cap: int
    ) -> DownloadResponse:
        if method != "GET" or not path.startswith("/"):
            raise RefinementSessionError("invalid download request")
        if type(byte_cap) is not int or byte_cap <= 0:
            raise RefinementSessionError("download byte cap must be positive")
        request = urllib.request.Request(
            f"{self._base_url}{path}",
            headers={"Accept": "application/x-dimacs"},
            method=method,
        )
        response: Any
        try:
            response = self._opener.open(request, timeout=self._request_timeout_s)
        except urllib.error.HTTPError as exc:
            response = exc
        except (OSError, urllib.error.URLError) as exc:
            raise RefinementSessionError(f"PIQD download failed: {exc}") from exc

        digest = hashlib.sha256()
        total = 0
        try:
            status = response.status if hasattr(response, "status") else response.code
            with destination.open("xb") as stream:
                while True:
                    block = response.read(_READ_CHUNK_BYTES)
                    if not block:
                        break
                    total += len(block)
                    if total > byte_cap:
                        raise RefinementSessionError(
                            "PIQD download exceeded its byte cap"
                        )
                    stream.write(block)
                    digest.update(block)
        except Exception:
            destination.unlink(missing_ok=True)
            raise
        finally:
            response.close()
        return DownloadResponse(
            status=status, byte_count=total, sha256=digest.hexdigest()
        )


@dataclass(frozen=True)
class RefinementReplay:
    session_id: str
    receipt: Mapping[str, Any]
    receipt_path: Path


def _fail(message: str) -> None:
    raise RefinementSessionError(message)


def _canonical_job_id(value: str) -> str:
    try:
        parsed = uuid.UUID(value)
    except (AttributeError, ValueError) as exc:
        raise RefinementSessionError("root job id must be a UUID") from exc
    if str(parsed) != value:
        _fail("root job id must be a canonical lowercase UUID")
    return value


def _temporary_path(parent: Path, stem: str) -> Path:
    return parent / f".{stem}.{uuid.uuid4()}.tmp"


def _require_export(
    downloader: DownloadTransport,
    *,
    session_path: str,
    destination: Path,
    expected_path: Path,
    expected_bytes: int,
    expected_sha256: str,
) -> dict[str, Any]:
    response = downloader.download(
        "GET", f"{session_path}/cnf", destination, byte_cap=expected_bytes
    )
    if response.status != 200:
        _fail(f"GET {session_path}/cnf returned HTTP {response.status}, expected 200")
    if response.byte_count != expected_bytes or response.sha256 != expected_sha256:
        _fail("PIQD CNF export identity does not match the frozen formula")
    if not filecmp.cmp(destination, expected_path, shallow=False):
        _fail("PIQD CNF export is not byte-identical to the frozen formula")
    return {"byte_count": response.byte_count, "sha256": response.sha256}


def replay_refinement_session(
    chain: FrozenRefinementChain,
    *,
    root_job_id: str,
    output_receipt_path: Path,
    transport: JsonHttpTransport,
    downloader: DownloadTransport,
    piqd_data_root: str,
    solver: str = DEFAULT_SOLVER,
    label: str = DEFAULT_LABEL,
) -> RefinementReplay:
    """Seed, authenticate, append, export, close, and receipt the frozen chain."""

    job_id = _canonical_job_id(root_job_id)
    if type(solver) is not str or not solver or type(label) is not str or not label:
        _fail("solver and label must be nonempty strings")
    configured_root = _validate_data_root(piqd_data_root)
    output_receipt_path.parent.mkdir(parents=True, exist_ok=True)
    root_export = _temporary_path(output_receipt_path.parent, "root-export")
    final_export = _temporary_path(output_receipt_path.parent, "final-export")
    expected_aggregate = _temporary_path(
        output_receipt_path.parent, "expected-aggregate"
    )

    candidate_id: str | None = None
    delete_attempted = False
    created: dict[str, Any] | None = None
    closed: dict[str, Any] | None = None
    append_records: list[dict[str, Any]] = []
    root_export_record: dict[str, Any] | None = None
    final_export_record: dict[str, Any] | None = None
    primary_error: Exception | None = None
    try:
        created_raw = _expect_response(
            transport,
            "POST",
            "/sessions",
            expected_status=201,
            body={
                "solver": solver,
                "lane": "sat",
                "label": label,
                "seed_from_job": job_id,
            },
        )
        candidate_id = _extract_create_candidate_session_id(created_raw)
        created = _validate_session(
            created_raw,
            expected_id=candidate_id,
            expected_state="live",
            expected_solver=solver,
            expected_label=label,
            expected_clauses=chain.root_num_clauses,
            expected_max_var=chain.root_num_vars,
            expected_solves=0,
            expected_last_status=None,
            piqd_data_root=configured_root,
        )
        session_path = f"/sessions/{candidate_id}"
        root_export_record = _require_export(
            downloader,
            session_path=session_path,
            destination=root_export,
            expected_path=chain.root.path,
            expected_bytes=chain.root.byte_count,
            expected_sha256=chain.root.sha256,
        )

        cumulative_clauses = chain.root_num_clauses
        for refinement in chain.refinements:
            clauses = [
                list(clause)
                for clause in load_fragment_clauses(
                    refinement, max_var=chain.root_num_vars
                )
            ]
            body = {"clauses": clauses}
            payload = canonical_json_bytes(body)
            if len(payload) > MAX_APPEND_JSON_BYTES:
                _fail(f"refinement {refinement.ordinal} exceeds PIQD's JSON body limit")
            added_raw = _expect_response(
                transport,
                "POST",
                f"{session_path}/clauses",
                expected_status=200,
                body=body,
            )
            if type(added_raw) is not dict or set(added_raw) != _ADD_KEYS:
                _fail("add-clauses response has noncanonical keys")
            cumulative_clauses += refinement.clause_count
            expected = {
                "added": refinement.clause_count,
                "clauses": cumulative_clauses,
                "max_var": chain.root_num_vars,
            }
            if added_raw != expected:
                _fail(f"refinement {refinement.ordinal} append counters disagree")
            append_records.append(
                {
                    "ordinal": refinement.ordinal,
                    "kind": refinement.kind,
                    "fragment_path": refinement.fragment.label,
                    "fragment_sha256": refinement.fragment.sha256,
                    "fragment_clause_count": refinement.clause_count,
                    "request_byte_count": len(payload),
                    "request_sha256": hashlib.sha256(payload).hexdigest(),
                    "response": dict(added_raw),
                }
            )

        reconstruct_aggregate(chain, expected_aggregate)
        final_export_record = _require_export(
            downloader,
            session_path=session_path,
            destination=final_export,
            expected_path=expected_aggregate,
            expected_bytes=chain.aggregate_byte_count,
            expected_sha256=chain.aggregate_sha256,
        )
        delete_attempted = True
        closed_raw = _expect_response(
            transport, "DELETE", session_path, expected_status=200
        )
        closed = _validate_session(
            closed_raw,
            expected_id=candidate_id,
            expected_state="closed",
            expected_solver=solver,
            expected_label=label,
            expected_clauses=chain.aggregate_num_clauses,
            expected_max_var=chain.root_num_vars,
            expected_solves=0,
            expected_last_status=None,
            piqd_data_root=configured_root,
        )
    except Exception as exc:  # noqa: BLE001
        primary_error = exc
    finally:
        if candidate_id is not None and not delete_attempted:
            try:
                delete_attempted = True
                _expect_response(
                    transport,
                    "DELETE",
                    f"/sessions/{candidate_id}",
                    expected_status=200,
                )
            except Exception as cleanup_error:  # noqa: BLE001
                primary_error = RefinementSessionError(
                    f"refinement replay failed and cleanup also failed: {cleanup_error}"
                )
        for path in (root_export, final_export, expected_aggregate):
            path.unlink(missing_ok=True)

    if primary_error is not None:
        if isinstance(primary_error, RefinementSessionError):
            raise primary_error
        raise RefinementSessionError(
            f"refinement replay failed: {primary_error}"
        ) from primary_error
    if any(
        value is None
        for value in (
            candidate_id,
            created,
            closed,
            root_export_record,
            final_export_record,
        )
    ):
        _fail("refinement replay ended without complete session evidence")

    unsigned: dict[str, Any] = {
        "schema": REPLAY_SCHEMA,
        "status": REPLAY_STATUS,
        "chain": {
            "manifest_path": str(chain.manifest_path),
            "manifest_sha256": chain.manifest_sha256,
            "root_sha256": chain.root.sha256,
            "root_byte_count": chain.root.byte_count,
            "root_num_variables": chain.root_num_vars,
            "root_num_clauses": chain.root_num_clauses,
            "aggregate_sha256": chain.aggregate_sha256,
            "aggregate_byte_count": chain.aggregate_byte_count,
            "aggregate_num_clauses": chain.aggregate_num_clauses,
        },
        "root_job_id": job_id,
        "root_export": root_export_record,
        "appends": append_records,
        "final_export": final_export_record,
        "session": {"created": created, "closed": closed},
        "claims": dict(_FALSE_CLAIMS),
    }
    unsigned["replay_sha256"] = sha256_json(unsigned)
    payload = canonical_json_bytes(unsigned) + b"\n"
    try:
        _write_immutable(output_receipt_path, payload)
    except Exception as exc:
        raise RefinementSessionError(f"could not write replay receipt: {exc}") from exc
    return RefinementReplay(candidate_id, unsigned, output_receipt_path)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--root-job-id", required=True)
    parser.add_argument("--output-receipt", type=Path, required=True)
    parser.add_argument(
        "--repo", type=Path, default=Path(__file__).resolve().parents[2]
    )
    parser.add_argument("--base-url", default=DEFAULT_BASE_URL)
    parser.add_argument("--piqd-data-root", default=str(Path.home() / ".piqd"))
    parser.add_argument("--solver", default=DEFAULT_SOLVER)
    parser.add_argument("--label", default=DEFAULT_LABEL)
    args = parser.parse_args()

    chain = validate_manifest(args.manifest, repo=args.repo)
    json_transport = UrllibJsonTransport(
        args.base_url, request_timeout_s=DEFAULT_TIMEOUT_S
    )
    downloader = UrllibDownloadTransport(
        args.base_url, request_timeout_s=DEFAULT_TIMEOUT_S
    )
    result = replay_refinement_session(
        chain,
        root_job_id=args.root_job_id,
        output_receipt_path=args.output_receipt,
        transport=json_transport,
        downloader=downloader,
        piqd_data_root=args.piqd_data_root,
        solver=args.solver,
        label=args.label,
    )
    print(
        json.dumps(
            {
                "session_id": result.session_id,
                "receipt_path": str(result.receipt_path),
                "replay_sha256": result.receipt["replay_sha256"],
                "status": result.receipt["status"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
