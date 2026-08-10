from __future__ import annotations

import json
import os
import urllib.parse
from collections.abc import Callable
from pathlib import Path
from typing import Any

import pytest

import census.p97_search.phase3_piqd_static_solver_runner as static_runner
from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    MultipartBody,
    raw_dimacs_identity,
    scan_dimacs,
)
from census.p97_search.phase3_piqd_static_solver_runner import (
    ATTESTED_SOLVER_RESULT,
    DEPLOYMENT_NO_SOLVER,
    INVALID_STATUS_ATTESTATION,
    PRODUCER_SCHEMA,
    SOLVER_UNKNOWN,
    SOURCE_SCHEMA,
    StaticPiqdRunnerError,
    authenticate_static_manifests,
    make_static_piqd_solver_runner,
)

CNF = b"c exact fixture\np cnf 3 2\n1 -2 0\n2 3 0\n"
SOURCE_CLAIMS = {
    "source_entitlement": False,
    "theorem_coverage": False,
    "universal_lift": False,
    "lean_closure": False,
}
PRODUCER_CLAIMS = {
    **SOURCE_CLAIMS,
    "one_process": False,
    "one_core": False,
}


def _manifests() -> tuple[bytes, bytes]:
    source = {
        "schema": SOURCE_SCHEMA,
        "source_id": "p97-static-fixture",
        "source_path": "census/p97_search/sat_generate.py",
        "source_sha256": "a" * 64,
        "finite_schema": "p97-static-fixture/v1",
        "cardinality_scope": "one finite static CNF",
        "source_theorem": "Problem97.staticFixture",
        "claims": SOURCE_CLAIMS,
    }
    source_bytes = canonical_json_bytes(source)
    producer = {
        "schema": PRODUCER_SCHEMA,
        "producer_id": "fixture-producer",
        "producer_kind": "static-dimacs",
        "source_manifest": source,
        "source_manifest_sha256": sha256_bytes(source_bytes),
        "variable_map_sha256": "b" * 64,
        "backend": "cadical",
        "solver_profile": "sat",
        "query_polarity": "UNSAT_MEANS_OBSTRUCTION",
        "claims": PRODUCER_CLAIMS,
    }
    return source_bytes, canonical_json_bytes(producer)


class FakeCurrentPiqd:
    def __init__(
        self,
        *,
        cnf: bytes,
        producer: bytes,
        result: str,
        assignment: list[object] | None = None,
        existing: bool = False,
        confirm_conflict: bool = False,
    ) -> None:
        self.cnf = cnf
        self.producer = producer
        self.result = result
        self.assignment = assignment
        self.existing = existing
        self.confirm_conflict = confirm_conflict
        self.job_id = "static-job-001"
        self.status_job_id = self.job_id
        self.stored_cnf = cnf
        self.calls: list[tuple[str, str]] = []
        self.prepare_body: bytes | MultipartBody | None = None
        self.raw_status_body: bytes | None = None
        self.hook: Callable[[str, str], None] | None = None
        self.fail_at: tuple[str, str] | None = None
        self.status_payload: dict[str, Any] = {
            "status": "completed",
            "result": self.result,
            "requested_core_limit": 1,
            "progress": {"solver_started": True},
            "attested_solver_processes": 1,
            "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
        }

    @staticmethod
    def _json(value: dict[str, Any]) -> HttpResponse:
        return HttpResponse(
            200,
            canonical_json_bytes(value),
            {"Content-Type": "application/json"},
        )

    def __call__(
        self,
        method: str,
        url: str,
        body: bytes | MultipartBody | None,
        _headers: object,
    ) -> HttpResponse:
        parsed = urllib.parse.urlsplit(url)
        path = parsed.path + (f"?{parsed.query}" if parsed.query else "")
        self.calls.append((method, path))
        if self.hook is not None:
            self.hook(method, path)
        if self.fail_at == (method, path):
            raise OSError("injected transport failure")
        cnf_hash = sha256_bytes(self.cnf)
        producer_hash = sha256_bytes(self.producer)
        identity = raw_dimacs_identity(
            backend="cadical",
            solver_profile="sat",
            cnf_sha256=cnf_hash,
            producer_manifest_sha256=producer_hash,
            requested_core_limit=1,
        )
        if method == "POST" and path == "/jobs/prepare-cnf":
            self.prepare_body = body
            assert isinstance(body, bytes)
            assert self.cnf in body
            assert self.producer in body
            num_vars, num_clauses = scan_dimacs(self.cnf)
            return self._json(
                {
                    "job_id": self.job_id,
                    "cnf_blob_hash": cnf_hash,
                    "identity_hash": identity,
                    "num_vars": num_vars,
                    "num_clauses": num_clauses,
                    "preview": "",
                    "existing": self.existing,
                    "requested_core_limit": 1,
                }
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/cnf":
            return HttpResponse(
                200,
                self.stored_cnf,
                {"Content-Type": "application/octet-stream"},
            )
        if method == "POST" and path == f"/jobs/confirm?job_id={self.job_id}":
            if self.confirm_conflict:
                return HttpResponse(
                    409,
                    canonical_json_bytes({"error": "already completed"}),
                    {"Content-Type": "application/json"},
                )
            return self._json({"job_id": self.job_id, "status": "confirmed"})
        if method == "GET" and path == f"/jobs/{self.job_id}":
            payload = dict(self.status_payload)
            payload["id"] = self.status_job_id
            if self.raw_status_body is not None:
                return HttpResponse(
                    200,
                    self.raw_status_body,
                    {"Content-Type": "application/json"},
                )
            return self._json(payload)
        if method == "GET" and path == f"/jobs/{self.job_id}/model":
            assignment = self.assignment if self.assignment is not None else []
            return self._json(
                {
                    "job_id": self.job_id,
                    "result": "SAT",
                    "num_assigned": len(assignment),
                    "assignment": assignment,
                }
            )
        if method == "GET" and path.startswith(f"/jobs/{self.job_id}/log?"):
            log = f"s {self.result}\n".encode()
            return HttpResponse(
                200,
                log,
                {
                    "Content-Type": "text/plain; charset=utf-8",
                    "X-Log-Size-Bytes": str(len(log)),
                },
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/proof":
            raise AssertionError("observational UNSAT must not fetch a proof")
        raise AssertionError((method, path))


def _runner(tmp_path: Path, api: FakeCurrentPiqd):
    source, producer = _manifests()
    return make_static_piqd_solver_runner(
        base_url="http://piqd.invalid",
        journal_root=tmp_path / "journals",
        source_manifest=source,
        producer_manifest=producer,
        transport=api,
        sleep=lambda _seconds: None,
    )


def _write_cnf(tmp_path: Path, payload: bytes = CNF) -> Path:
    path = tmp_path / "query.cnf"
    path.write_bytes(payload)
    return path


def _attempt_directories(tmp_path: Path) -> list[Path]:
    root = tmp_path / "journals"
    return [] if not root.exists() else sorted(root.glob("attempt-*"))


def _assert_published_custody(receipt: dict[str, Any]) -> dict[str, Any]:
    receipt_path = Path(receipt["receipt_path"])
    receipt_bytes = receipt_path.read_bytes()
    assert receipt_bytes == canonical_json_bytes(receipt) + b"\n"
    unsigned_receipt = dict(receipt)
    claimed_receipt_hash = unsigned_receipt.pop("receipt_sha256")
    assert claimed_receipt_hash == sha256_bytes(canonical_json_bytes(unsigned_receipt))

    custody_path = Path(receipt["custody_seal_path"])
    custody = json.loads(custody_path.read_bytes())
    unsigned_custody = dict(custody)
    claimed_custody_hash = unsigned_custody.pop("custody_seal_sha256")
    assert claimed_custody_hash == sha256_bytes(canonical_json_bytes(unsigned_custody))
    assert custody["receipt_sha256"] == receipt["receipt_sha256"]
    assert custody["receipt_file_sha256"] == sha256_bytes(receipt_bytes)
    return custody


def test_sat_uses_current_client_driver_and_replays_exact_total_model(
    tmp_path: Path,
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    proof_path = tmp_path / "legacy.drat"

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 17, proof_path)

    assert result.verdict == "SAT"
    assert result.returncode == 10
    assert result.assignment == {1: True, 2: True, 3: True}
    assert not proof_path.exists()
    receipt = json.loads(result.stdout)
    assert receipt["job_id"] == api.job_id
    assert receipt["cnf_sha256"] == sha256_bytes(CNF)
    assert (receipt["num_variables"], receipt["num_clauses"]) == (3, 2)
    assert receipt["legacy_drat_proof_path_written"] is False
    assert receipt["status_classification"] == ATTESTED_SOLVER_RESULT
    journal = Path(receipt["journal"])
    assert journal.is_file()
    assert journal.with_name("attempt.jsonl.seal.json").is_file()
    artifacts = journal.with_name("attempt.jsonl.artifacts")
    assert (artifacts / sha256_bytes(CNF)).read_bytes() == CNF
    assert (artifacts / sha256_bytes(producer)).read_bytes() == producer
    source, _producer = _manifests()
    assert (artifacts / sha256_bytes(source)).read_bytes() == source
    custody = _assert_published_custody(receipt)
    assert sha256_bytes(source) in {
        artifact["sha256"] for artifact in custody["inventory"]["artifacts"]
    }
    assert api.calls == [
        ("POST", "/jobs/prepare-cnf"),
        ("GET", f"/jobs/{api.job_id}/cnf"),
        ("POST", f"/jobs/confirm?job_id={api.job_id}"),
        ("GET", f"/jobs/{api.job_id}"),
        ("GET", f"/jobs/{api.job_id}/model"),
        ("GET", f"/jobs/{api.job_id}/log?from=0&max=1048576"),
    ]


def test_prepare_existing_true_reuses_exact_terminal_sat_without_freshness_claim(
    tmp_path: Path,
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
        existing=True,
        confirm_conflict=True,
    )

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "SAT"
    receipt = json.loads(result.stdout)
    assert receipt["job_identity"]["existing"] is True
    assert receipt["prepare_freshness_claimed"] is False
    assert api.calls == [
        ("POST", "/jobs/prepare-cnf"),
        ("GET", f"/jobs/{api.job_id}/cnf"),
        ("POST", f"/jobs/confirm?job_id={api.job_id}"),
        ("GET", f"/jobs/{api.job_id}"),
        ("GET", f"/jobs/{api.job_id}"),
        ("GET", f"/jobs/{api.job_id}/model"),
        ("GET", f"/jobs/{api.job_id}/log?from=0&max=1048576"),
    ]


@pytest.mark.parametrize(
    "assignment",
    [
        [1, 2],
        [1, 1, 3],
        [1, 2, 4],
        [True, 2, 3],
        [-1, 2, -3],
    ],
)
def test_sat_malformed_partial_duplicate_range_bool_or_false_model_fails_closed(
    tmp_path: Path, assignment: list[object]
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=assignment,
    )

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    assert result.assignment == {}
    assert "failed closed" in result.stderr


def test_solver_started_unknown_is_distinct_and_fetches_only_log(
    tmp_path: Path,
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(cnf=CNF, producer=producer, result="UNKNOWN")

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    assert result.returncode == 1
    receipt = json.loads(result.stdout)
    assert receipt["outcome"] == "ERROR"
    assert receipt["job_id"] == api.job_id
    assert receipt["status_classification"] == SOLVER_UNKNOWN
    assert receipt["terminal_status"]["progress"]["solver_started"] is True
    assert "SOLVER_UNKNOWN" in result.stderr
    assert api.calls == [
        ("POST", "/jobs/prepare-cnf"),
        ("GET", f"/jobs/{api.job_id}/cnf"),
        ("POST", f"/jobs/confirm?job_id={api.job_id}"),
        ("GET", f"/jobs/{api.job_id}"),
        ("GET", f"/jobs/{api.job_id}/log?from=0&max=1048576"),
    ]


def test_prepare_existing_unknown_is_not_reset_or_treated_as_fresh(
    tmp_path: Path,
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="UNKNOWN",
        existing=True,
        confirm_conflict=True,
    )

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    assert "SOLVER_UNKNOWN" in result.stderr
    receipt = json.loads(result.stdout)
    assert receipt["job_identity"]["existing"] is True
    assert receipt["prepare_freshness_claimed"] is False
    assert receipt["status_classification"] == SOLVER_UNKNOWN
    assert api.calls == [
        ("POST", "/jobs/prepare-cnf"),
        ("GET", f"/jobs/{api.job_id}/cnf"),
        ("POST", f"/jobs/confirm?job_id={api.job_id}"),
        ("GET", f"/jobs/{api.job_id}"),
        ("GET", f"/jobs/{api.job_id}"),
        ("GET", f"/jobs/{api.job_id}/log?from=0&max=1048576"),
    ]


@pytest.mark.parametrize("status", ["completed", "failed"])
@pytest.mark.parametrize("requested_core_limit", [None, 1])
def test_unknown_with_exact_no_solver_attestation_is_deployment_failure(
    tmp_path: Path, status: str, requested_core_limit: int | None
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(cnf=CNF, producer=producer, result="UNKNOWN")
    api.status_payload.update(
        {
            "status": status,
            "requested_core_limit": requested_core_limit,
            "progress": {"solver_started": False},
            "attested_solver_processes": 0,
            "attestation_basis": "SOLVER_DID_NOT_START",
        }
    )

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    assert result.returncode == 1
    receipt = json.loads(result.stdout)
    assert receipt["status_classification"] == DEPLOYMENT_NO_SOLVER
    assert receipt["terminal_status"]["progress"]["solver_started"] is False
    assert receipt["terminal_status"]["attestation_basis"] == "SOLVER_DID_NOT_START"
    assert receipt["terminal_status"]["attested_solver_processes"] == 0
    assert "DEPLOYMENT_NO_SOLVER" in result.stderr
    expected_calls = [
        ("POST", "/jobs/prepare-cnf"),
        ("GET", f"/jobs/{api.job_id}/cnf"),
        ("POST", f"/jobs/confirm?job_id={api.job_id}"),
        ("GET", f"/jobs/{api.job_id}"),
    ]
    if status == "completed":
        # The shared driver archives a diagnostic log for every completed
        # UNKNOWN. The adapter still classifies from the attestation pair.
        expected_calls.append(("GET", f"/jobs/{api.job_id}/log?from=0&max=1048576"))
    assert api.calls == expected_calls


@pytest.mark.parametrize(
    "missing",
    [
        "requested_core_limit",
        "progress",
        "progress.solver_started",
        "attested_solver_processes",
        "attestation_basis",
    ],
)
def test_missing_status_attestation_fields_fail_closed(
    tmp_path: Path, missing: str
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(cnf=CNF, producer=producer, result="UNKNOWN")
    if missing == "progress.solver_started":
        api.status_payload["progress"] = {}
    else:
        del api.status_payload[missing]

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    assert json.loads(result.stdout)["status_classification"] == (
        INVALID_STATUS_ATTESTATION
    )
    assert not any(path.endswith("/proof") for _, path in api.calls)


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("requested_core_limit", None),
        ("requested_core_limit", True),
        ("requested_core_limit", 1.0),
        ("requested_core_limit", -1),
        ("requested_core_limit", 0),
        ("requested_core_limit", 2),
        ("progress", {"solver_started": 1}),
        ("progress", {"solver_started": 1.0}),
        ("attested_solver_processes", True),
        ("attested_solver_processes", 1.0),
        ("attested_solver_processes", -1),
        ("attested_solver_processes", 0),
        ("attested_solver_processes", 2),
        ("attestation_basis", "SOLVER_DID_NOT_START"),
    ],
)
def test_malformed_or_wrong_status_attestation_fails_closed(
    tmp_path: Path, field: str, value: object
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(cnf=CNF, producer=producer, result="UNKNOWN")
    api.status_payload[field] = value

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    assert json.loads(result.stdout)["status_classification"] == (
        INVALID_STATUS_ATTESTATION
    )
    assert not any(path.endswith("/proof") for _, path in api.calls)


@pytest.mark.parametrize("result", ["SAT", "UNSAT", "UNKNOWN"])
def test_rehashed_started_status_core_substitution_fails_closed(
    tmp_path: Path, result: str
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result=result,
        assignment=[1, 2, 3] if result == "SAT" else None,
    )
    substituted = {
        **api.status_payload,
        "id": api.job_id,
        "requested_core_limit": 2,
    }
    raw = canonical_json_bytes(substituted)
    api.raw_status_body = raw

    observed = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert observed.verdict == "UNKNOWN"
    receipt = json.loads(observed.stdout)
    assert receipt["status_classification"] == INVALID_STATUS_ATTESTATION
    assert receipt["terminal_status"] == substituted
    assert receipt["terminal_status_raw_sha256"] == sha256_bytes(raw)
    assert receipt["terminal_status_canonical_sha256"] == sha256_bytes(raw)
    _assert_published_custody(receipt)
    assert not any(path.endswith("/proof") for _, path in api.calls)


def test_unsat_is_observational_and_never_writes_legacy_drat(tmp_path: Path) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(cnf=CNF, producer=producer, result="UNSAT")
    proof_path = tmp_path / "legacy.drat"

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, proof_path)

    assert result.verdict == "UNSAT"
    assert result.returncode == 20
    assert result.assignment == {}
    assert not proof_path.exists()
    assert "CERT-001" in result.stderr
    assert "No legacy DRAT proof was written" in result.stderr
    receipt = json.loads(result.stdout)
    assert receipt["outcome"] == "DISCOVERY_UNSAT"
    assert receipt["certificate_blocker"] == "CERT-001"
    assert receipt["status_classification"] == ATTESTED_SOLVER_RESULT
    assert all(receipt["claims"][claim] is False for claim in receipt["claims"])
    assert api.calls == [
        ("POST", "/jobs/prepare-cnf"),
        ("GET", f"/jobs/{api.job_id}/cnf"),
        ("POST", f"/jobs/confirm?job_id={api.job_id}"),
        ("GET", f"/jobs/{api.job_id}"),
        ("GET", f"/jobs/{api.job_id}/log?from=0&max=1048576"),
    ]


@pytest.mark.parametrize(
    ("cnf", "assignment"),
    [
        (b"p cnf 0 0\n", []),
        (b"p cnf 1 0\n", [1]),
    ],
)
def test_clause_free_dimacs_fails_preflight_without_reservation_or_transport(
    tmp_path: Path,
    cnf: bytes,
    assignment: list[object],
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=cnf,
        producer=producer,
        result="SAT",
        assignment=assignment,
    )

    observed = _runner(tmp_path, api)(_write_cnf(tmp_path, cnf), 5, None)

    assert observed.verdict == "UNKNOWN"
    assert observed.assignment == {}
    assert observed.stdout == ""
    assert "PIQD-VAC-001" in observed.stderr
    assert "no job was prepared" in observed.stderr
    assert api.calls == []
    assert _attempt_directories(tmp_path) == []


def test_zero_variable_empty_clause_remains_a_distinct_wave_contract_blocker(
    tmp_path: Path,
) -> None:
    cnf = b"p cnf 0 1\n0\n"
    _source, producer = _manifests()
    api = FakeCurrentPiqd(cnf=cnf, producer=producer, result="UNSAT")

    observed = _runner(tmp_path, api)(_write_cnf(tmp_path, cnf), 5, None)

    assert observed.verdict == "UNKNOWN"
    assert "PIQD-VAC-001" not in observed.stderr
    assert "manifest.encoding.num_variables must be positive" in observed.stderr
    assert "reservation removed" in observed.stderr
    assert api.calls == []
    assert _attempt_directories(tmp_path) == []


def test_positive_variable_empty_clause_is_not_misclassified_as_clause_free(
    tmp_path: Path,
) -> None:
    cnf = b"p cnf 1 1\n0\n"
    _source, producer = _manifests()
    api = FakeCurrentPiqd(cnf=cnf, producer=producer, result="UNSAT")

    observed = _runner(tmp_path, api)(_write_cnf(tmp_path, cnf), 5, None)

    assert observed.verdict == "UNSAT"
    receipt = json.loads(observed.stdout)
    assert receipt["num_variables"] == 1
    assert receipt["num_clauses"] == 1
    assert receipt["certificate_blocker"] == "CERT-001"
    assert api.calls[0] == ("POST", "/jobs/prepare-cnf")
    assert not any(path.endswith("/proof") for _, path in api.calls)


def test_terminal_status_authenticates_raw_bytes_then_canonicalizes(
    tmp_path: Path,
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    payload = {**api.status_payload, "id": api.job_id}
    raw = json.dumps(payload, indent=2).encode("utf-8")
    assert raw != canonical_json_bytes(payload)
    api.raw_status_body = raw

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "SAT"
    receipt = json.loads(result.stdout)
    assert receipt["terminal_status"] == payload
    assert receipt["terminal_status_raw_sha256"] == sha256_bytes(raw)
    assert receipt["terminal_status_canonical_sha256"] == sha256_bytes(
        canonical_json_bytes(payload)
    )
    assert (
        receipt["terminal_status_raw_sha256"]
        != (receipt["terminal_status_canonical_sha256"])
    )
    raw_artifact = (
        Path(receipt["journal"]).with_name("attempt.jsonl.artifacts")
        / receipt["terminal_status_raw_artifact_sha256"]
    )
    assert raw_artifact.read_bytes() == raw
    assert receipt["terminal_status_identity_scope"] == "JOB_ID_ONLY"
    _assert_published_custody(receipt)


@pytest.mark.parametrize("shape", ["oversize", "deep"])
def test_terminal_status_response_bounds_fail_closed_and_are_sealed(
    tmp_path: Path, shape: str
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(cnf=CNF, producer=producer, result="UNKNOWN")
    if shape == "oversize":
        api.raw_status_body = b"{" + b" " * (1024 * 1024) + b"}"
    else:
        value: dict[str, Any] = {}
        cursor = value
        for _ in range(34):
            child: dict[str, Any] = {}
            cursor["child"] = child
            cursor = child
        api.raw_status_body = canonical_json_bytes(value)

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    receipt = json.loads(result.stdout)
    assert receipt["outcome"] == "ERROR"
    assert receipt["terminal_status"] is None
    assert receipt["terminal_status_raw_sha256"] is None
    assert "bound" in receipt["failure_detail"]
    _assert_published_custody(receipt)
    assert not any(path.endswith("/proof") for _, path in api.calls)


def test_terminal_status_binds_every_identity_field_when_exposed(
    tmp_path: Path,
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    api.status_payload.update(
        {
            "backend": "cadical",
            "solver_profile": "sat",
            "project": "erdos-97-96-formalization",
            "cnf_blob_hash": sha256_bytes(CNF),
            "identity_hash": raw_dimacs_identity(
                backend="cadical",
                solver_profile="sat",
                cnf_sha256=sha256_bytes(CNF),
                producer_manifest_sha256=sha256_bytes(producer),
                requested_core_limit=1,
            ),
        }
    )

    receipt = json.loads(_runner(tmp_path, api)(_write_cnf(tmp_path), 5, None).stdout)

    assert receipt["terminal_status_identity_scope"] == "EXPOSED_FIELDS_BOUND"
    assert receipt["terminal_status_exposed_identity_fields"] == [
        "backend",
        "cnf_blob_hash",
        "identity_hash",
        "project",
        "solver_profile",
    ]


@pytest.mark.parametrize(
    ("field", "crossed"),
    [
        ("backend", "kissat"),
        ("solver_profile", "proof"),
        ("project", "other-project"),
        ("cnf_blob_hash", "c" * 64),
        ("identity_hash", "d" * 64),
    ],
)
def test_crossed_exposed_status_identity_is_archived_but_fails_closed(
    tmp_path: Path, field: str, crossed: str
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(cnf=CNF, producer=producer, result="UNKNOWN")
    api.status_payload[field] = crossed

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    receipt = json.loads(result.stdout)
    assert receipt["status_classification"] == INVALID_STATUS_ATTESTATION
    assert receipt["terminal_status"] is None
    assert receipt["terminal_status_raw_sha256"] is not None
    assert field in result.stderr
    assert not any(path.endswith("/proof") for _, path in api.calls)


@pytest.mark.parametrize(
    ("updates", "expected"),
    [
        ({"status": "failed"}, SOLVER_UNKNOWN),
        (
            {
                "status": "completed",
                "result": "SAT",
                "progress": {"solver_started": False},
                "attested_solver_processes": 0,
                "attestation_basis": "SOLVER_DID_NOT_START",
            },
            INVALID_STATUS_ATTESTATION,
        ),
        (
            {
                "status": "failed",
                "result": "UNSAT",
                "progress": {"solver_started": False},
                "attested_solver_processes": 0,
                "attestation_basis": "SOLVER_DID_NOT_START",
            },
            INVALID_STATUS_ATTESTATION,
        ),
        (
            {
                "status": "completed",
                "result": "UNKNOWN",
                "progress": {"solver_started": True},
                "attested_solver_processes": 0,
                "attestation_basis": "SOLVER_DID_NOT_START",
            },
            INVALID_STATUS_ATTESTATION,
        ),
    ],
)
def test_terminal_lifecycle_result_attestation_matrix(
    tmp_path: Path, updates: dict[str, Any], expected: str
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(cnf=CNF, producer=producer, result="UNKNOWN")
    api.status_payload.update(updates)

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    assert json.loads(result.stdout)["status_classification"] == expected
    assert not any(path.endswith("/proof") for _, path in api.calls)


def test_transport_failure_is_sealed_with_canonical_failure_receipt(
    tmp_path: Path,
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(cnf=CNF, producer=producer, result="UNKNOWN")
    api.fail_at = ("POST", "/jobs/prepare-cnf")

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    receipt = json.loads(result.stdout)
    assert "injected transport failure" in receipt["failure_detail"]
    assert receipt["outcome"] == "ERROR"
    assert Path(receipt["journal"]).with_name("attempt.jsonl.seal.json").is_file()
    _assert_published_custody(receipt)
    assert len(_attempt_directories(tmp_path)) == 1


@pytest.mark.parametrize(
    ("target_kind", "replacement_kind"),
    [
        ("journal", "symlink"),
        ("lock", "symlink"),
        ("driver_seal", "symlink"),
        ("artifact", "symlink"),
        ("artifact", "regular"),
    ],
)
def test_custody_rejects_symlink_or_inode_replacement_and_cleans_reservation(
    tmp_path: Path, target_kind: str, replacement_kind: str
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    outside = tmp_path / "outside"
    outside.write_bytes(b"outside sentinel")

    def attack(method: str, path: str) -> None:
        should_attack = (target_kind != "driver_seal" and method == "POST") or (
            target_kind == "driver_seal"
            and method == "GET"
            and path == f"/jobs/{api.job_id}"
        )
        if not should_attack:
            return
        api.hook = None
        [attempt] = _attempt_directories(tmp_path)
        targets = {
            "journal": attempt / "attempt.jsonl",
            "lock": attempt / "attempt.jsonl.lock",
            "driver_seal": attempt / "attempt.jsonl.seal.json",
            "artifact": attempt / "attempt.jsonl.artifacts" / sha256_bytes(CNF),
        }
        target = targets[target_kind]
        target.unlink(missing_ok=True)
        if replacement_kind == "symlink":
            target.symlink_to(outside)
        else:
            target.write_bytes(CNF)

    api.hook = attack

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    assert result.stdout == ""
    assert "reservation removed" in result.stderr
    assert outside.read_bytes() == b"outside sentinel"
    assert _attempt_directories(tmp_path) == []
    assert not any(path.endswith("/proof") for _, path in api.calls)


def test_restart_uses_new_create_once_attempt_and_preserves_first_receipt(
    tmp_path: Path,
) -> None:
    _source, producer = _manifests()
    cnf_path = _write_cnf(tmp_path)
    first_api = FakeCurrentPiqd(
        cnf=CNF, producer=producer, result="SAT", assignment=[1, 2, 3]
    )
    second_api = FakeCurrentPiqd(
        cnf=CNF, producer=producer, result="SAT", assignment=[1, 2, 3]
    )

    first = json.loads(_runner(tmp_path, first_api)(cnf_path, 5, None).stdout)
    first_receipt = Path(first["receipt_path"]).read_bytes()
    second = json.loads(_runner(tmp_path, second_api)(cnf_path, 5, None).stdout)

    assert first["attempt"] != second["attempt"]
    assert first["receipt_path"] != second["receipt_path"]
    assert Path(first["receipt_path"]).read_bytes() == first_receipt
    _assert_published_custody(first)
    _assert_published_custody(second)
    assert len(_attempt_directories(tmp_path)) == 2


@pytest.mark.parametrize("name", ["solver-receipt.json", "custody-seal.json"])
def test_preplaced_output_symlink_cannot_be_followed_or_overwritten(
    tmp_path: Path, name: str
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    outside = tmp_path / "output-sentinel"
    outside.write_bytes(b"do not overwrite")

    def attack(method: str, path: str) -> None:
        if method != "GET" or path != f"/jobs/{api.job_id}":
            return
        api.hook = None
        [attempt] = _attempt_directories(tmp_path)
        (attempt / name).symlink_to(outside)

    api.hook = attack

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    assert result.stdout == ""
    assert "reservation removed" in result.stderr
    assert outside.read_bytes() == b"do not overwrite"
    assert _attempt_directories(tmp_path) == []


def test_crossed_status_job_is_rejected(tmp_path: Path) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    api.status_job_id = "crossed-job"

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    assert "wrong job id" in result.stderr


def test_tampered_stored_cnf_is_rejected(tmp_path: Path) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    api.stored_cnf = CNF.replace(b"2 3 0", b"-2 3 0")

    result = _runner(tmp_path, api)(_write_cnf(tmp_path), 5, None)

    assert result.verdict == "UNKNOWN"
    assert "exact submitted CNF" in result.stderr


def test_repeated_same_cnf_gets_distinct_create_once_journals(tmp_path: Path) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    runner = _runner(tmp_path, api)
    cnf_path = _write_cnf(tmp_path)

    first = json.loads(runner(cnf_path, 5, None).stdout)
    second = json.loads(runner(cnf_path, 5, None).stdout)

    assert first["journal"] != second["journal"]
    assert Path(first["journal"]).is_file()
    assert Path(second["journal"]).is_file()


def test_manifest_authentication_rejects_noncanonical_crossed_and_claims() -> None:
    source, producer = _manifests()
    with pytest.raises(StaticPiqdRunnerError, match="canonical JSON"):
        authenticate_static_manifests(
            source_manifest=source + b"\n", producer_manifest=producer
        )

    crossed = json.loads(producer)
    crossed["source_manifest_sha256"] = "c" * 64
    with pytest.raises(StaticPiqdRunnerError, match="does not bind"):
        authenticate_static_manifests(
            source_manifest=source,
            producer_manifest=canonical_json_bytes(crossed),
        )

    promoted = json.loads(producer)
    promoted["claims"]["theorem_coverage"] = True
    with pytest.raises(StaticPiqdRunnerError, match="must be false"):
        authenticate_static_manifests(
            source_manifest=source,
            producer_manifest=canonical_json_bytes(promoted),
        )


def test_cnf_snapshot_is_bounded_and_no_follow(tmp_path: Path) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    source = _write_cnf(tmp_path)
    link = tmp_path / "linked.cnf"
    link.symlink_to(source)
    runner = _runner(tmp_path, api)

    with pytest.raises(StaticPiqdRunnerError, match="without following links"):
        runner(link, 5, None)

    source_manifest, producer_manifest = _manifests()
    bounded = make_static_piqd_solver_runner(
        base_url="http://piqd.invalid",
        journal_root=tmp_path / "bounded-journals",
        source_manifest=source_manifest,
        producer_manifest=producer_manifest,
        transport=api,
        max_cnf_bytes=len(CNF) - 1,
        sleep=lambda _seconds: None,
    )
    with pytest.raises(StaticPiqdRunnerError, match="byte bound"):
        bounded(source, 5, None)


def test_cnf_snapshot_rejects_intermediate_symlink(tmp_path: Path) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    real_parent = tmp_path / "real-input"
    real_parent.mkdir()
    (real_parent / "query.cnf").write_bytes(CNF)
    linked_parent = tmp_path / "linked-input"
    linked_parent.symlink_to(real_parent, target_is_directory=True)

    with pytest.raises(StaticPiqdRunnerError, match="parent component"):
        _runner(tmp_path, api)(linked_parent / "query.cnf", 5, None)

    assert api.calls == []


def test_cnf_snapshot_rejects_hardlinked_input(tmp_path: Path) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    source = _write_cnf(tmp_path)
    os.link(source, tmp_path / "second-name.cnf")

    with pytest.raises(StaticPiqdRunnerError, match="link count one"):
        _runner(tmp_path, api)(source, 5, None)

    assert api.calls == []


def test_cnf_snapshot_rejects_hardlink_added_during_read(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    source = _write_cnf(tmp_path)
    runner = _runner(tmp_path, api)
    original_read = static_runner.os.read
    linked = False

    def add_hardlink(descriptor: int, size: int) -> bytes:
        nonlocal linked
        if not linked:
            linked = True
            os.link(source, tmp_path / "second-name.cnf")
        return original_read(descriptor, size)

    monkeypatch.setattr(static_runner.os, "read", add_hardlink)

    with pytest.raises(StaticPiqdRunnerError, match="changed while.*snapshotted"):
        runner(source, 5, None)

    assert api.calls == []
    assert _attempt_directories(tmp_path) == []


@pytest.mark.parametrize("replacement", ["directory", "symlink"])
def test_cnf_snapshot_rejects_parent_rename_or_repoint_during_read(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    replacement: str,
) -> None:
    _source, producer = _manifests()
    api = FakeCurrentPiqd(
        cnf=CNF,
        producer=producer,
        result="SAT",
        assignment=[1, 2, 3],
    )
    input_parent = tmp_path / "input-parent"
    input_parent.mkdir()
    cnf_path = input_parent / "query.cnf"
    cnf_path.write_bytes(CNF)
    moved_parent = tmp_path / "moved-parent"
    runner = _runner(tmp_path, api)
    original_read = static_runner.os.read
    repointed = False

    def rename_parent(descriptor: int, size: int) -> bytes:
        nonlocal repointed
        if not repointed:
            repointed = True
            input_parent.rename(moved_parent)
            if replacement == "directory":
                input_parent.mkdir()
                (input_parent / "query.cnf").write_bytes(CNF)
            else:
                input_parent.symlink_to(moved_parent, target_is_directory=True)
        return original_read(descriptor, size)

    monkeypatch.setattr(static_runner.os, "read", rename_parent)

    with pytest.raises(
        StaticPiqdRunnerError,
        match="parent component changed or was repointed",
    ):
        runner(cnf_path, 5, None)

    assert api.calls == []
    assert _attempt_directories(tmp_path) == []
