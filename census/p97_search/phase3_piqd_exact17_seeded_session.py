"""Qualify exact-17 DirectSix custody through one seeded PIQD SAT session.

This adapter is intentionally observational.  It authenticates the frozen
DirectSix package and its completed static PIQD canary, asks PIQD to seed a
fresh session from the exact canary job (or its exact CNF blob), checks the
reported formula dimensions, and closes the session without solving or adding
clauses.  It does not establish source entitlement, case coverage, a universal
lift, or theorem closure.
"""

from __future__ import annotations

import argparse
import json
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
    wave_manifest_sha256,
)
from census.p97_search.phase3_piqd_exact17_direct6_package import (
    PackageResult,
    build_direct6_root_refinement_package,
)
from census.p97_search.phase3_piqd_exact17_runner import (
    RunPacket,
    _capture_path,
    _write_immutable,
    validate_run_receipt,
)
from census.p97_search.phase3_piqd_statement_bank_runner import (
    JsonHttpResponse,
    JsonHttpTransport,
    StatementBankRunnerError,
    UrllibJsonTransport,
    _extract_create_candidate_session_id,
    _validate_data_root,
    _validate_session,
)

QUALIFICATION_SCHEMA = "p97-piqd-exact17-seeded-session-qualification/v1"
QUALIFICATION_STATUS = "OBSERVATIONAL_ONLY"
DEFAULT_SOLVER = "piqd-satworker-cadical-3.0.0"
DEFAULT_LABEL = "P97 exact17 DirectSix authenticated seeded-session qualification"
_FALSE_CLAIMS = {
    "source_semantics_checked": False,
    "source_entitlement": False,
    "complete_source_coverage": False,
    "aggregate_order_case_coverage": False,
    "universal_lift": False,
    "theorem_closure": False,
    "daemon_attestation": False,
}


class SeededSessionQualificationError(StatementBankRunnerError):
    """The static ingress or seeded-session exchange failed closed."""


@dataclass(frozen=True)
class SeededSessionQualification:
    """One closed session exchange and its immutable local receipt."""

    session_id: str
    receipt: Mapping[str, Any]
    receipt_path: Path


def _fail(message: str) -> None:
    raise SeededSessionQualificationError(message)


def _expect_response(
    transport: JsonHttpTransport,
    method: str,
    path: str,
    *,
    expected_status: int,
    body: Mapping[str, object] | None = None,
) -> object:
    """Require one PIQD response while retaining a bounded error explanation."""

    response = transport.request(method, path, body)
    if not isinstance(response, JsonHttpResponse):
        _fail("HTTP transport returned the wrong response type")
    if type(response.status) is not int or response.status != expected_status:
        try:
            explanation = json.dumps(
                response.body,
                ensure_ascii=True,
                sort_keys=True,
                separators=(",", ":"),
            )
        except (TypeError, ValueError):
            explanation = "<non-JSON response body>"
        _fail(
            f"{method} {path} returned HTTP {response.status}, expected "
            f"{expected_status}; body={explanation[:512]}"
        )
    return response.body


def _strict_static_receipt(
    receipt_path: Path, packet: RunPacket, journal_path: Path
) -> tuple[dict[str, Any], bytes]:
    raw = _capture_path(receipt_path, maximum_bytes=8 * 1024 * 1024)
    try:
        decoded = json.loads(raw)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise SeededSessionQualificationError(
            "static run receipt is not strict JSON"
        ) from exc
    if type(decoded) is not dict or canonical_json_bytes(decoded) + b"\n" != raw:
        _fail("static run receipt is not canonical JSON with one newline")
    validated = validate_run_receipt(
        receipt_path, packet=packet, journal_path=journal_path
    )
    if type(validated) is not dict or validated != decoded:
        _fail("static run receipt changed during validation")
    return decoded, raw


def _validate_static_ingress(
    receipt: Mapping[str, Any], package: PackageResult
) -> dict[str, Any]:
    if (
        receipt.get("terminal_status") != "completed"
        or receipt.get("terminal_result") != "SAT"
        or receipt.get("terminal_outcome") != "STRUCTURAL_SAT"
    ):
        _fail("static canary is not completed structural SAT")
    claims = receipt.get("claims")
    expected_static_claims = dict(_FALSE_CLAIMS)
    expected_static_claims.pop("daemon_attestation")
    if type(claims) is not dict or claims != expected_static_claims:
        _fail("static canary claims changed or overstate the result")
    job = receipt.get("job_identity")
    if type(job) is not dict:
        _fail("static canary has no concrete job identity")
    if (
        type(job.get("job_id")) is not str
        or not job["job_id"]
        or job.get("backend") != "cadical"
        or job.get("solver_profile") != "sat"
        or job.get("cnf_blob_hash") != package.aggregate_sha256
        or type(job.get("num_variables")) is not int
        or job["num_variables"] != package.num_variables
        or type(job.get("num_clauses")) is not int
        or job["num_clauses"] != package.num_clauses
    ):
        _fail("static canary job does not identify the exact package aggregate")
    return job


def qualify_seeded_session(
    packet: RunPacket,
    package: PackageResult,
    *,
    static_receipt_path: Path,
    static_journal_path: Path,
    output_receipt_path: Path,
    transport: JsonHttpTransport,
    piqd_data_root: str,
    solver: str = DEFAULT_SOLVER,
    label: str = DEFAULT_LABEL,
    seed_mode: str = "job",
) -> SeededSessionQualification:
    """Authenticate, seed, validate, close, and receipt one PIQD session."""

    if type(solver) is not str or not solver or type(label) is not str or not label:
        _fail("solver and label must be nonempty built-in strings")
    if type(seed_mode) is not str or seed_mode not in {"job", "blob"}:
        _fail("seed_mode must be exactly 'job' or 'blob'")
    configured_root = _validate_data_root(piqd_data_root)
    static_receipt, static_raw = _strict_static_receipt(
        static_receipt_path, packet, static_journal_path
    )
    job = _validate_static_ingress(static_receipt, package)
    package_document = package.as_dict()
    lane_manifest_sha256 = package_document.get("lane_manifest_sha256")
    if (
        type(lane_manifest_sha256) is not str
        or len(lane_manifest_sha256) != 64
        or any(
            character not in "0123456789abcdef" for character in lane_manifest_sha256
        )
    ):
        _fail("package result has no canonical lane-manifest digest")
    seed_field = "seed_from_job" if seed_mode == "job" else "seed_blob_hash"
    seed_value = job["job_id"] if seed_mode == "job" else package.aggregate_sha256
    create_body = {
        "solver": solver,
        "lane": "sat",
        "label": label,
        seed_field: seed_value,
    }

    candidate_id: str | None = None
    delete_attempted = False
    created: dict[str, Any] | None = None
    closed: dict[str, Any] | None = None
    primary_error: Exception | None = None
    try:
        created_raw = _expect_response(
            transport, "POST", "/sessions", expected_status=201, body=create_body
        )
        candidate_id = _extract_create_candidate_session_id(created_raw)
        created = _validate_session(
            created_raw,
            expected_id=candidate_id,
            expected_state="live",
            expected_solver=solver,
            expected_label=label,
            expected_clauses=package.num_clauses,
            expected_max_var=package.num_variables,
            expected_solves=0,
            expected_last_status=None,
            piqd_data_root=configured_root,
        )
        delete_attempted = True
        closed_raw = _expect_response(
            transport,
            "DELETE",
            f"/sessions/{candidate_id}",
            expected_status=200,
        )
        closed = _validate_session(
            closed_raw,
            expected_id=candidate_id,
            expected_state="closed",
            expected_solver=solver,
            expected_label=label,
            expected_clauses=package.num_clauses,
            expected_max_var=package.num_variables,
            expected_solves=0,
            expected_last_status=None,
            piqd_data_root=configured_root,
        )
    # The injected transport may raise an implementation-specific Exception;
    # custody still requires the cleanup path to run.
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
                if primary_error is None:
                    primary_error = cleanup_error
                else:
                    primary_error = SeededSessionQualificationError(
                        f"seeded session failed and cleanup also failed: {cleanup_error}"
                    )
    if primary_error is not None:
        if isinstance(primary_error, SeededSessionQualificationError):
            raise primary_error
        raise SeededSessionQualificationError(
            f"seeded session qualification failed: {primary_error}"
        ) from primary_error
    if candidate_id is None or created is None or closed is None:
        _fail(
            "seeded session exchange ended without canonical create and close records"
        )

    unsigned: dict[str, Any] = {
        "schema": QUALIFICATION_SCHEMA,
        "status": QUALIFICATION_STATUS,
        "packet_id": packet.packet_id,
        "package": {
            "package_result_sha256": package.sha256,
            "lane_manifest_sha256": lane_manifest_sha256,
            "aggregate_sha256": package.aggregate_sha256,
            "aggregate_byte_count": package.aggregate_byte_count,
            "num_variables": package.num_variables,
            "num_clauses": package.num_clauses,
            "wave_manifest_sha256": wave_manifest_sha256(packet.wave_manifest),
        },
        "static_canary": {
            "receipt_file_sha256": sha256_bytes(static_raw),
            "receipt_sha256": static_receipt["receipt_sha256"],
            "job_id": job["job_id"],
            "cnf_blob_hash": job["cnf_blob_hash"],
        },
        "seed": {"mode": seed_mode, "field": seed_field, "value": seed_value},
        "session": {"created": created, "closed": closed},
        "claims": dict(_FALSE_CLAIMS),
    }
    unsigned["qualification_sha256"] = sha256_json(unsigned)
    payload = canonical_json_bytes(unsigned) + b"\n"
    _write_immutable(output_receipt_path, payload)
    return SeededSessionQualification(
        session_id=candidate_id,
        receipt=unsigned,
        receipt_path=output_receipt_path,
    )


def qualify_from_manifest(
    *,
    manifest_path: Path,
    package_dir: Path,
    expected_manifest_sha256: str,
    repo_root: Path,
    static_receipt_path: Path,
    static_journal_path: Path,
    output_receipt_path: Path,
    transport: JsonHttpTransport,
    piqd_data_root: str,
    solver: str = DEFAULT_SOLVER,
    label: str = DEFAULT_LABEL,
    seed_mode: str = "job",
) -> SeededSessionQualification:
    packet, package = build_direct6_root_refinement_package(
        manifest_path,
        package_dir,
        expected_manifest_sha256=expected_manifest_sha256,
        repo_root=repo_root,
    )
    return qualify_seeded_session(
        packet,
        package,
        static_receipt_path=static_receipt_path,
        static_journal_path=static_journal_path,
        output_receipt_path=output_receipt_path,
        transport=transport,
        piqd_data_root=piqd_data_root,
        solver=solver,
        label=label,
        seed_mode=seed_mode,
    )


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--package-dir", type=Path, required=True)
    parser.add_argument("--expected-manifest-sha256", required=True)
    parser.add_argument("--repo-root", type=Path, required=True)
    parser.add_argument("--static-receipt", type=Path, required=True)
    parser.add_argument("--static-journal", type=Path, required=True)
    parser.add_argument("--output-receipt", type=Path, required=True)
    parser.add_argument("--piqd-data-root", required=True)
    parser.add_argument("--piqd-url", default="http://127.0.0.1:7272")
    parser.add_argument("--solver", default=DEFAULT_SOLVER)
    parser.add_argument("--label", default=DEFAULT_LABEL)
    parser.add_argument("--seed-mode", choices=("job", "blob"), default="job")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    result = qualify_from_manifest(
        manifest_path=args.manifest,
        package_dir=args.package_dir,
        expected_manifest_sha256=args.expected_manifest_sha256,
        repo_root=args.repo_root,
        static_receipt_path=args.static_receipt,
        static_journal_path=args.static_journal,
        output_receipt_path=args.output_receipt,
        transport=UrllibJsonTransport(args.piqd_url),
        piqd_data_root=args.piqd_data_root,
        solver=args.solver,
        label=args.label,
        seed_mode=args.seed_mode,
    )
    print(canonical_json_bytes(result.receipt).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
