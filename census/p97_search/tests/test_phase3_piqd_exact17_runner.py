from __future__ import annotations

import os
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest

from census.p97_search.phase3_cegar_wave import (
    DISCOVERY_UNSAT,
    ERROR,
    STRUCTURAL_SAT,
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
)
from census.p97_search.phase3_piqd_driver import PiqdDriverError
from census.p97_search.phase3_piqd_exact17_runner import (
    ATTESTATION_BASIS,
    PACKAGE_FILES,
    Exact17RunnerError,
    ExpectedPackageIdentity,
    RunPacket,
    _parser,
    _snapshot_package,
    load_exact17_package,
    run_packet,
    validate_run_receipt,
)
from census.p97_search.phase3_piqd_oracle import (
    CheckedModel,
    HttpResponse,
    PiqdOracleError,
    PiqdRawDimacsClient,
    PreparedJob,
    raw_dimacs_identity,
)

SAT_CNF = b"p cnf 2 2\n1 0\n-1 2 0\n"
UNSAT_CNF = b"p cnf 1 2\n1 0\n-1 0\n"
_MISSING = object()


class _StringSubclass(str):
    pass


def digest(character: str) -> str:
    return character * 64


def _claims() -> dict[str, bool]:
    return {
        "exact_cnf_byte_identity": True,
        "exact_structural_cnf_byte_identity": True,
        "exact_upstream_manifest_byte_identity": True,
        "exact_validation_report_byte_identity": True,
        "complete_manifest_report_cross_binding": False,
        "current_executable_producer_byte_provenance": False,
        "full_variable_map_custody": False,
        "source_entitlement": False,
        "aggregate_order_case_coverage": False,
        "universal_lift": False,
        "theorem_closure": False,
        "daemon_attestation": False,
    }


def _write_package(
    root: Path,
    *,
    cnf: bytes = SAT_CNF,
    structural: bytes = b"p cnf 1 1\n1 0\n",
    transitive: bool = True,
    validation_status: str = "PASS",
) -> ExpectedPackageIdentity:
    root.mkdir()
    cnf_vars, cnf_clauses = (2, 2) if cnf == SAT_CNF else (1, 0)
    structural_vars, structural_clauses = 1, 1
    cnf_hash = sha256_bytes(cnf)
    structural_hash = sha256_bytes(structural)
    upstream = {
        "schema": "p97-rigid221-exact17-source-faithful-boolean-cnf-transitive-two-circle-candidate-v4",
        "scope": "fixture",
        "source_hashes": {},
        "transitive_two_circle": transitive,
        "cnf_sha256": cnf_hash,
        "variables": cnf_vars,
        "clauses": cnf_clauses,
    }
    upstream_bytes = canonical_json_bytes(upstream)
    upstream_hash = sha256_bytes(upstream_bytes)
    validation = {
        "schema": "p97-rigid221-exact17-source-cnf-crosscheck-v3",
        "status": validation_status,
        "candidate_cnf_sha256": cnf_hash,
        "candidate_manifest_sha256": upstream_hash,
        "structural_cnf_sha256": structural_hash,
        "candidate_exact_regeneration": "PASS",
        "cadical_model_roundtrip": "PASS",
    }
    validation_bytes = canonical_json_bytes(validation)
    validation_hash = sha256_bytes(validation_bytes)
    order = {
        "schema": "p97-phase3-piqd-exact17-order/v1",
        "semantic_status": "ONE_NORMALIZED_ORDER_ONLY",
        "scope": "fixture",
        "order_index": 0,
        "order": [0, 1],
        "anonymous_positions": [0, 1],
        "aggregate_order_case_coverage": False,
        "upstream_manifest_sha256": upstream_hash,
        "validation_report_sha256": validation_hash,
    }
    order_bytes = canonical_json_bytes(order)
    order_hash = sha256_bytes(order_bytes)
    variable_map = {
        "schema": "p97-phase3-piqd-variable-map/v1",
        "semantic_status": "PARTIAL_OPAQUE_VARIABLE_MAP",
        "scope": "fixture",
        "num_variables": cnf_vars,
        "named_variables": [],
        "opaque_variable_ranges": [[1, cnf_vars]],
        "coverage": {
            "named_variables": 0,
            "opaque_variables": cnf_vars,
            "full_variable_map_custody": False,
        },
        "source": {
            "upstream_manifest_sha256": upstream_hash,
            "current_executable_producer_byte_provenance": False,
        },
    }
    variable_bytes = canonical_json_bytes(variable_map)
    variable_hash = sha256_bytes(variable_bytes)
    ingress = {
        "schema": "p97-phase3-piqd-exact17-ingress/v1",
        "scope": "fixture",
        "cnf_sha256": cnf_hash,
        "structural_cnf_sha256": structural_hash,
        "upstream_manifest_sha256": upstream_hash,
        "validation_report_sha256": validation_hash,
        "order_sha256": order_hash,
    }
    ingress_bytes = canonical_json_bytes(ingress)
    ingress_hash = sha256_bytes(ingress_bytes)
    claims = _claims()
    artifacts = {
        "cnf": {"path": "discovery.cnf", "sha256": cnf_hash},
        "structural_cnf": {
            "path": "structural-roundtrip.cnf",
            "sha256": structural_hash,
        },
        "upstream_manifest": {
            "path": "upstream-manifest.json",
            "sha256": upstream_hash,
        },
        "validation_report": {
            "path": "validation-report.json",
            "sha256": validation_hash,
        },
        "ingress_identity": {
            "path": "ingress-identity.json",
            "sha256": ingress_hash,
        },
        "variable_map": {"path": "variable-map.json", "sha256": variable_hash},
        "order": {"path": "order.json", "sha256": order_hash},
    }
    producer = {
        "schema": "p97-phase3-piqd-producer/v1",
        "semantic_status": "FINITE_ARCHIVED_EXACT17_V12T_INGRESS",
        "scope": "fixture",
        "source": {"order_index": 0},
        "provenance": {
            "ingress_identity_sha256": ingress_hash,
            "claims": claims,
        },
        "artifacts": artifacts,
        "promotion": {
            "evidence_classification": "LOCAL_CERTIFICATE",
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    producer_bytes = canonical_json_bytes(producer)
    producer_hash = sha256_bytes(producer_bytes)
    wave = _wave(
        cnf=cnf,
        producer=producer_bytes,
        variable_map_hash=variable_hash,
        order_hash=order_hash,
        wave_id="p97-exact17-v12t-order0-canary",
    )
    wave_bytes = canonical_json_bytes(wave)
    result = {
        "schema": "p97-phase3-piqd-exact17-package-result/v1",
        "semantic_status": "FINITE_INGRESS_PACKET_READY",
        "scope": "fixture",
        "artifacts": {
            "cnf_sha256": cnf_hash,
            "structural_cnf_sha256": structural_hash,
            "upstream_manifest_sha256": upstream_hash,
            "validation_report_sha256": validation_hash,
            "ingress_identity_sha256": ingress_hash,
            "variable_map_sha256": variable_hash,
            "order_sha256": order_hash,
            "producer_manifest_sha256": producer_hash,
            "wave_manifest_sha256": sha256_bytes(wave_bytes),
        },
        "claims": claims,
    }
    files = {
        "discovery.cnf": cnf,
        "structural-roundtrip.cnf": structural,
        "upstream-manifest.json": upstream_bytes,
        "validation-report.json": validation_bytes,
        "ingress-identity.json": ingress_bytes,
        "variable-map.json": variable_bytes,
        "order.json": order_bytes,
        "producer-manifest.json": producer_bytes,
        "wave-manifest.json": wave_bytes,
        "package-result.json": canonical_json_bytes(result),
    }
    for name, payload in files.items():
        (root / name).write_bytes(payload)
    return ExpectedPackageIdentity(
        cnf_hash,
        len(cnf),
        cnf_vars,
        cnf_clauses,
        structural_hash,
        len(structural),
        structural_vars,
        structural_clauses,
        upstream_hash,
        validation_hash,
    )


def _wave(
    *,
    cnf: bytes,
    producer: bytes,
    variable_map_hash: str = digest("2"),
    order_hash: str = digest("3"),
    wave_id: str = "exact17-preflight",
) -> dict[str, Any]:
    header = cnf.splitlines()[0].split()
    return {
        "schema": "p97-cegar-wave/v1",
        "wave_id": wave_id,
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": "Problem97.test",
            "ingress_hypotheses_sha256": digest("1"),
            "finite_schema": "fixture/v1",
            "cardinality_scope": "one fixture",
            "source_theorem": "UNAUTHENTICATED_FIXTURE",
        },
        "encoding": {
            "cnf_sha256": sha256_bytes(cnf),
            "variable_map_sha256": variable_map_hash,
            "producer_manifest_sha256": sha256_bytes(producer),
            "num_variables": int(header[2]),
            "num_clauses": int(header[3]),
            "query_polarity": "UNSAT_MEANS_OBSTRUCTION",
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "sat",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": order_hash,
            "seed": 97,
        },
        "promotion": {
            "evidence_classification": "LOCAL_CERTIFICATE",
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }


def _packet(cnf: bytes) -> RunPacket:
    producer = canonical_json_bytes({"fixture": "known-result"})
    return RunPacket(
        packet_id="known-result-preflight",
        cnf=cnf,
        producer_manifest=producer,
        wave_manifest=_wave(cnf=cnf, producer=producer),
        package_hashes={
            "preflight.cnf": sha256_bytes(cnf),
            "producer.json": sha256_bytes(producer),
        },
        exact17_package=False,
    )


class FakeDaemon:
    def __init__(
        self,
        *,
        cnf: bytes,
        result: Any,
        assignment: tuple[int, ...] = (),
        existing: bool = False,
        status_id: str = "job-1",
        status_state: str = "completed",
        terminal_requested_core_limit: Any = 1,
        terminal_attested_solver_processes: Any = 1,
        terminal_attestation_basis: Any = ATTESTATION_BASIS,
        solver_log: Any = _MISSING,
        solver_log_sha256: Any = _MISSING,
    ) -> None:
        self.cnf = cnf
        self.result = result
        self.assignment = assignment
        self.existing = existing
        self.status_id = status_id
        self.status_state = status_state
        self.terminal_requested_core_limit = terminal_requested_core_limit
        self.terminal_attested_solver_processes = terminal_attested_solver_processes
        self.terminal_attestation_basis = terminal_attestation_basis
        self.solver_log = solver_log
        self.solver_log_sha256 = solver_log_sha256

    def prepare_cnf(self, **kwargs: Any) -> PreparedJob:
        assert type(kwargs["requested_core_limit"]) is int
        assert kwargs["requested_core_limit"] == 1
        wave = kwargs["wave_manifest"]
        cnf_hash = sha256_bytes(self.cnf)
        identity_hash = raw_dimacs_identity(
            backend="cadical",
            solver_profile="sat",
            cnf_sha256=cnf_hash,
            producer_manifest_sha256=sha256_bytes(kwargs["producer_manifest"]),
            requested_core_limit=kwargs["requested_core_limit"],
        )
        return SimpleNamespace(
            job_id="job-1",
            backend="cadical",
            solver_profile="sat",
            cnf_blob_hash=cnf_hash,
            identity_hash=identity_hash,
            num_vars=wave["encoding"]["num_variables"],
            num_clauses=wave["encoding"]["num_clauses"],
            existing=self.existing,
            requested_core_limit=kwargs["requested_core_limit"],
        )

    def confirm(self, job: PreparedJob, *, expected_cnf: bytes) -> str:
        assert expected_cnf == self.cnf
        return "confirmed"

    def status(self, job_id: str) -> dict[str, Any]:
        payload = {
            "id": self.status_id,
            "status": self.status_state,
        }
        if self.result is not _MISSING:
            payload["result"] = self.result
        for key, value in (
            ("requested_core_limit", self.terminal_requested_core_limit),
            (
                "attested_solver_processes",
                self.terminal_attested_solver_processes,
            ),
            ("attestation_basis", self.terminal_attestation_basis),
        ):
            if value is not _MISSING:
                payload[key] = value
        return payload

    def checked_model(self, job: PreparedJob, *, cnf: bytes) -> CheckedModel:
        body = canonical_json_bytes(
            {"job_id": job.job_id, "result": "SAT", "assignment": self.assignment}
        )
        return CheckedModel(self.assignment, sha256_bytes(body), body)

    def log(self, job: PreparedJob) -> tuple[bytes, str]:
        if isinstance(self.solver_log, Exception):
            raise self.solver_log
        payload = self.solver_log
        if payload is _MISSING:
            payload = f"s {self.result}\n".encode()
        digest = self.solver_log_sha256
        if digest is _MISSING:
            digest = sha256_bytes(payload)
        return payload, digest

    def proof(self, job: PreparedJob) -> tuple[bytes, str]:
        raise AssertionError("discovery UNSAT must not retrieve a proof")


def _run(tmp_path: Path, *, packet: RunPacket, daemon: FakeDaemon):
    return run_packet(
        packet,
        client=daemon,
        journal_path=tmp_path / "attempts.jsonl",
        receipt_path=tmp_path / "receipt.json",
        max_polls=1,
        poll_interval_s=0,
    )


def test_package_loads_and_binds_all_ten_artifacts(tmp_path: Path) -> None:
    package_dir = tmp_path / "package"
    expected = _write_package(package_dir)
    package = load_exact17_package(package_dir, _expected=expected)
    assert set(package.hashes) == set(PACKAGE_FILES)
    assert package.num_clauses == 2


def test_package_rejects_malformed_and_substituted_artifacts(tmp_path: Path) -> None:
    package_dir = tmp_path / "package"
    expected = _write_package(package_dir)
    (package_dir / "variable-map.json").write_bytes(b'{"x":1,"x":2}')
    with pytest.raises(Exact17RunnerError):
        load_exact17_package(package_dir, _expected=expected)

    (package_dir / "variable-map.json").unlink()
    (package_dir / "variable-map.json").symlink_to("order.json")
    with pytest.raises(Exact17RunnerError):
        load_exact17_package(package_dir, _expected=expected)


@pytest.mark.parametrize(
    ("kwargs", "match"),
    [
        ({"cnf": b"p cnf 1 0\n"}, "vacuous"),
        ({"transitive": False}, "nontransitive"),
        ({"validation_status": "FAIL"}, "not PASS"),
    ],
)
def test_package_rejects_non_gate_classifications(
    tmp_path: Path, kwargs: dict[str, Any], match: str
) -> None:
    package_dir = tmp_path / "package"
    expected = _write_package(package_dir, **kwargs)
    with pytest.raises(Exact17RunnerError, match=match):
        load_exact17_package(package_dir, _expected=expected)


def test_package_rejects_directory_symlink(tmp_path: Path) -> None:
    package_dir = tmp_path / "package"
    _write_package(package_dir)
    alias = tmp_path / "alias"
    alias.symlink_to(package_dir, target_is_directory=True)
    with pytest.raises(Exact17RunnerError, match="symlink"):
        _snapshot_package(alias)


def test_package_detects_deterministic_toctou(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    import census.p97_search.phase3_piqd_exact17_runner as runner

    package_dir = tmp_path / "package"
    _write_package(package_dir)
    original = runner._file_identity
    calls = 0

    def changed(info: os.stat_result) -> tuple[int, ...]:
        nonlocal calls
        calls += 1
        value = original(info)
        if calls == 3:
            return (*value[:-1], value[-1] + 1)
        return value

    monkeypatch.setattr(runner, "_file_identity", changed)
    with pytest.raises(Exact17RunnerError, match="substituted"):
        _snapshot_package(package_dir)


def test_known_sat_is_structural_only_after_complete_replay(tmp_path: Path) -> None:
    packet = _packet(SAT_CNF)
    run = _run(
        tmp_path,
        packet=packet,
        daemon=FakeDaemon(cnf=SAT_CNF, result="SAT", assignment=(1, 2)),
    )
    assert run.driver_result.outcome == STRUCTURAL_SAT
    assert run.receipt["terminal_outcome"] == STRUCTURAL_SAT
    assert not any(run.receipt["claims"].values())
    assert run.receipt["solver_process_attestation"] == {
        "requested_core_limit": 1,
        "prepared_requested_core_limit": 1,
        "terminal_requested_core_limit": 1,
        "terminal_attested_solver_processes": 1,
        "terminal_attestation_basis": ATTESTATION_BASIS,
        "solver_process_attestation_accepted": True,
        "no_solver_run_state_accepted": False,
        "os_thread_limit_attested": False,
        "os_cpuset_limit_attested": False,
        "os_core_enforcement_attested": False,
    }
    assert run.receipt["journal"]["terminal_status_raw_sha256"] is None
    assert run.receipt["journal"]["terminal_status_canonical_sha256"] is not None
    solver_log_sha256 = run.receipt["journal"]["terminal_solver_log_sha256"]
    assert solver_log_sha256 == sha256_bytes(b"s SAT\n")
    assert solver_log_sha256 in run.receipt["journal"]["artifact_sha256"]


@pytest.mark.parametrize(
    ("solver_log", "solver_log_sha256"),
    [
        (PiqdOracleError("solver log missing"), _MISSING),
        (b"", _MISSING),
        (b"s SAT\n", digest("tampered-solver-log")),
        (b"s SAT\n", True),
    ],
)
def test_completed_sat_without_authenticated_solver_log_has_no_receipt(
    tmp_path: Path,
    solver_log: Any,
    solver_log_sha256: Any,
) -> None:
    with pytest.raises(
        Exact17RunnerError,
        match="completed terminal record lacks a solver log artifact",
    ):
        _run(
            tmp_path,
            packet=_packet(SAT_CNF),
            daemon=FakeDaemon(
                cnf=SAT_CNF,
                result="SAT",
                assignment=(1, 2),
                solver_log=solver_log,
                solver_log_sha256=solver_log_sha256,
            ),
        )
    assert not (tmp_path / "receipt.json").exists()


def test_solver_log_receipt_and_artifact_tampering_fail_closed(tmp_path: Path) -> None:
    packet = _packet(SAT_CNF)
    run = _run(
        tmp_path,
        packet=packet,
        daemon=FakeDaemon(cnf=SAT_CNF, result="SAT", assignment=(1, 2)),
    )
    solver_log_sha256 = run.receipt["journal"]["terminal_solver_log_sha256"]

    receipt = dict(run.receipt)
    receipt["journal"] = {
        **receipt["journal"],
        "terminal_solver_log_sha256": digest("resigned-log-substitution"),
    }
    receipt.pop("receipt_sha256")
    receipt["receipt_sha256"] = sha256_json(receipt)
    run.receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")
    with pytest.raises(Exact17RunnerError, match="journal evidence"):
        validate_run_receipt(
            run.receipt_path,
            packet=packet,
            journal_path=tmp_path / "attempts.jsonl",
        )

    artifact = tmp_path / "attempts.jsonl.artifacts" / solver_log_sha256
    artifact.write_bytes(b"tampered solver log\n")
    with pytest.raises(PiqdDriverError, match="artifact hash mismatch"):
        validate_run_receipt(
            run.receipt_path,
            packet=packet,
            journal_path=tmp_path / "attempts.jsonl",
        )


def test_sat_receipt_uses_terminal_poll_not_later_model_checkpoint(
    tmp_path: Path,
) -> None:
    run = _run(
        tmp_path,
        packet=_packet(SAT_CNF),
        daemon=FakeDaemon(cnf=SAT_CNF, result="SAT", assignment=(1, 2)),
    )
    terminal_status = {
        "id": "job-1",
        "status": "completed",
        "result": "SAT",
        "requested_core_limit": 1,
        "attested_solver_processes": 1,
        "attestation_basis": ATTESTATION_BASIS,
    }
    assert run.receipt["terminal_status"] == "completed"
    assert run.receipt["terminal_result"] == "SAT"
    assert run.receipt["journal"]["terminal_status_canonical_sha256"] == sha256_json(
        terminal_status
    )
    assert run.receipt["journal"]["terminal_solver_log_sha256"] == sha256_bytes(
        b"s SAT\n"
    )
    assert run.receipt["journal"]["terminal_status_canonical_sha256"] != sha256_json(
        {"num_assigned": 2}
    )


@pytest.mark.parametrize(
    ("field", "value", "message"),
    [
        ("terminal_status", None, "terminal status/result"),
        ("terminal_status", "failed", "terminal status/result"),
        ("terminal_result", None, "terminal status/result"),
        ("terminal_result", "UNSAT", "terminal status/result"),
        (
            "terminal_status_canonical_sha256",
            digest("terminal-status-tamper"),
            "journal evidence",
        ),
    ],
)
def test_sat_receipt_rejects_resigned_terminal_poll_tampering(
    tmp_path: Path, field: str, value: Any, message: str
) -> None:
    packet = _packet(SAT_CNF)
    run = _run(
        tmp_path,
        packet=packet,
        daemon=FakeDaemon(cnf=SAT_CNF, result="SAT", assignment=(1, 2)),
    )
    receipt = dict(run.receipt)
    if field == "terminal_status_canonical_sha256":
        receipt["journal"] = {**receipt["journal"], field: value}
    else:
        receipt[field] = value
    receipt.pop("receipt_sha256")
    receipt["receipt_sha256"] = sha256_json(receipt)
    run.receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")
    with pytest.raises(Exact17RunnerError, match=message):
        validate_run_receipt(
            run.receipt_path,
            packet=packet,
            journal_path=tmp_path / "attempts.jsonl",
        )


def test_real_raw_client_contract_with_deterministic_transport(
    tmp_path: Path,
) -> None:
    packet = _packet(SAT_CNF)
    producer_hash = sha256_bytes(packet.producer_manifest)
    cnf_hash = sha256_bytes(SAT_CNF)
    identity_hash = raw_dimacs_identity(
        backend="cadical",
        solver_profile="sat",
        cnf_sha256=cnf_hash,
        producer_manifest_sha256=producer_hash,
        requested_core_limit=1,
    )
    calls: list[tuple[str, str]] = []

    def response(payload: dict[str, Any]) -> HttpResponse:
        return HttpResponse(200, canonical_json_bytes(payload), {})

    def transport(
        method: str,
        url: str,
        body: bytes | None,
        headers: dict[str, str],
    ) -> HttpResponse:
        calls.append((method, url))
        if method == "POST" and url.endswith("/jobs/prepare-cnf"):
            assert body is not None
            assert headers["Content-Type"].startswith("multipart/form-data")
            assert b'"requested_core_limit":1' in body
            return response(
                {
                    "job_id": "job-1",
                    "existing": False,
                    "cnf_blob_hash": cnf_hash,
                    "identity_hash": identity_hash,
                    "num_vars": 2,
                    "num_clauses": 2,
                    "requested_core_limit": 1,
                }
            )
        if method == "GET" and url.endswith("/jobs/job-1/cnf"):
            return HttpResponse(200, SAT_CNF, {})
        if method == "POST" and "/jobs/confirm?" in url:
            return response({"job_id": "job-1", "status": "confirmed"})
        if method == "GET" and url.endswith("/jobs/job-1"):
            return response(
                {
                    "id": "job-1",
                    "status": "completed",
                    "result": "SAT",
                    "requested_core_limit": 1,
                    "attested_solver_processes": 1,
                    "attestation_basis": ATTESTATION_BASIS,
                }
            )
        if method == "GET" and url.endswith("/jobs/job-1/model"):
            return response(
                {
                    "job_id": "job-1",
                    "result": "SAT",
                    "assignment": [1, 2],
                    "num_assigned": 2,
                }
            )
        if method == "GET" and "/jobs/job-1/log?" in url:
            log = b"s SATISFIABLE\n"
            return HttpResponse(200, log, {"X-Log-Size-Bytes": str(len(log))})
        raise AssertionError(f"unexpected fake transport request: {method} {url}")

    client = PiqdRawDimacsClient("http://piqd.invalid", transport=transport)
    run = _run(tmp_path, packet=packet, daemon=client)
    assert run.driver_result.outcome == STRUCTURAL_SAT
    assert len(calls) == 6


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("terminal_requested_core_limit", _MISSING),
        ("terminal_requested_core_limit", 2),
        ("terminal_requested_core_limit", None),
        ("terminal_requested_core_limit", 1.0),
        ("terminal_requested_core_limit", True),
        ("terminal_attested_solver_processes", _MISSING),
        ("terminal_attested_solver_processes", 2),
        ("terminal_attested_solver_processes", None),
        ("terminal_attested_solver_processes", 1.0),
        ("terminal_attested_solver_processes", True),
        ("terminal_attestation_basis", _MISSING),
        ("terminal_attestation_basis", "WRONG"),
        ("terminal_attestation_basis", None),
        ("terminal_attestation_basis", 1.0),
        ("terminal_attestation_basis", True),
    ],
)
def test_terminal_process_attestation_fails_closed_for_adversarial_values(
    tmp_path: Path, field: str, value: Any
) -> None:
    daemon_kwargs = {
        "cnf": SAT_CNF,
        "result": "SAT",
        "assignment": (1, 2),
        field: value,
    }
    run = _run(tmp_path, packet=_packet(SAT_CNF), daemon=FakeDaemon(**daemon_kwargs))
    assert run.driver_result.outcome == ERROR
    assert not run.receipt["solver_process_attestation"][
        "solver_process_attestation_accepted"
    ]


def test_completed_unknown_keeps_attestation_separate_from_outcome(
    tmp_path: Path,
) -> None:
    run = _run(
        tmp_path,
        packet=_packet(SAT_CNF),
        daemon=FakeDaemon(cnf=SAT_CNF, result="UNKNOWN"),
    )
    assert run.driver_result.outcome == ERROR
    assert run.receipt["terminal_status"] == "completed"
    assert run.receipt["terminal_result"] == "UNKNOWN"
    assert run.receipt["terminal_outcome"] == ERROR
    assert run.receipt["solver_process_attestation"][
        "solver_process_attestation_accepted"
    ]
    assert not run.receipt["solver_process_attestation"]["no_solver_run_state_accepted"]
    assert run.receipt["journal"]["terminal_status_canonical_sha256"] is not None
    assert run.receipt["journal"]["terminal_solver_log_sha256"] == sha256_bytes(
        b"s UNKNOWN\n"
    )


def test_failed_bounded_terminal_is_valid_no_solver_run_state(tmp_path: Path) -> None:
    run = _run(
        tmp_path,
        packet=_packet(SAT_CNF),
        daemon=FakeDaemon(
            cnf=SAT_CNF,
            result="UNKNOWN",
            status_state="failed",
            terminal_requested_core_limit=1,
            terminal_attested_solver_processes=None,
            terminal_attestation_basis=None,
        ),
    )
    assert run.driver_result.outcome == ERROR
    assert run.receipt["terminal_status"] == "failed"
    assert run.receipt["terminal_result"] == "UNKNOWN"
    attestation = run.receipt["solver_process_attestation"]
    assert not attestation["solver_process_attestation_accepted"]
    assert attestation["no_solver_run_state_accepted"]
    assert attestation["terminal_requested_core_limit"] == 1
    assert attestation["terminal_attested_solver_processes"] is None
    assert attestation["terminal_attestation_basis"] is None
    assert run.receipt["journal"]["terminal_status_canonical_sha256"] is not None
    assert run.receipt["journal"]["terminal_solver_log_sha256"] is None


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("status_state", _StringSubclass("failed")),
        ("result", _MISSING),
        ("result", None),
        ("result", "SAT"),
        ("result", _StringSubclass("UNKNOWN")),
        ("result", 1.0),
        ("result", True),
        ("terminal_requested_core_limit", _MISSING),
        ("terminal_requested_core_limit", None),
        ("terminal_requested_core_limit", 2),
        ("terminal_requested_core_limit", 1.0),
        ("terminal_requested_core_limit", True),
        ("terminal_attested_solver_processes", _MISSING),
        ("terminal_attested_solver_processes", 1),
        ("terminal_attestation_basis", _MISSING),
        ("terminal_attestation_basis", ATTESTATION_BASIS),
    ],
)
def test_failed_terminal_rejects_adversarial_no_solver_fields(
    tmp_path: Path, field: str, value: Any
) -> None:
    daemon_kwargs = {
        "cnf": SAT_CNF,
        "result": "UNKNOWN",
        "status_state": "failed",
        "terminal_requested_core_limit": 1,
        "terminal_attested_solver_processes": None,
        "terminal_attestation_basis": None,
        field: value,
    }
    run = _run(tmp_path, packet=_packet(SAT_CNF), daemon=FakeDaemon(**daemon_kwargs))
    assert run.driver_result.outcome == ERROR
    attestation = run.receipt["solver_process_attestation"]
    assert not attestation["solver_process_attestation_accepted"]
    assert not attestation["no_solver_run_state_accepted"]


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("prepared_requested_core_limit", True),
        ("terminal_requested_core_limit", 1.0),
        ("terminal_attested_solver_processes", True),
        ("terminal_attestation_basis", 1.0),
    ],
)
def test_receipt_rejects_resigned_attestation_type_substitutions(
    tmp_path: Path, field: str, value: Any
) -> None:
    packet = _packet(SAT_CNF)
    run = _run(
        tmp_path,
        packet=packet,
        daemon=FakeDaemon(cnf=SAT_CNF, result="SAT", assignment=(1, 2)),
    )
    receipt = dict(run.receipt)
    receipt["solver_process_attestation"] = {
        **receipt["solver_process_attestation"],
        field: value,
    }
    receipt.pop("receipt_sha256")
    receipt["receipt_sha256"] = sha256_json(receipt)
    run.receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")
    with pytest.raises(Exact17RunnerError, match="attestation"):
        validate_run_receipt(
            run.receipt_path,
            packet=packet,
            journal_path=tmp_path / "attempts.jsonl",
        )


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("job_id", 1),
        ("job_id", "job-2"),
        ("backend", True),
        ("backend", "kissat"),
        ("solver_profile", 1.0),
        ("cnf_blob_hash", True),
        ("cnf_blob_hash", digest("0")),
        ("identity_hash", digest("0")),
        ("num_variables", True),
        ("num_variables", 3),
        ("num_clauses", 2.0),
        ("existing", 0),
        ("existing", True),
        ("requested_core_limit", True),
        ("requested_core_limit", 1.0),
        ("requested_core_limit", 2),
        ("extra", "field"),
    ],
)
def test_receipt_rejects_resigned_job_identity_substitutions(
    tmp_path: Path, field: str, value: Any
) -> None:
    packet = _packet(SAT_CNF)
    run = _run(
        tmp_path,
        packet=packet,
        daemon=FakeDaemon(cnf=SAT_CNF, result="SAT", assignment=(1, 2)),
    )
    receipt = dict(run.receipt)
    job_identity = dict(receipt["job_identity"])
    job_identity[field] = value
    receipt["job_identity"] = job_identity
    receipt.pop("receipt_sha256")
    receipt["receipt_sha256"] = sha256_json(receipt)
    run.receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")
    with pytest.raises(Exact17RunnerError, match="job"):
        validate_run_receipt(
            run.receipt_path,
            packet=packet,
            journal_path=tmp_path / "attempts.jsonl",
        )


def test_cli_uses_project_daemon_port() -> None:
    assert _parser().parse_args(["package", "run"]).base_url == "http://127.0.0.1:7272"


@pytest.mark.parametrize(
    "failure",
    [PiqdDriverError("driver failure"), RecursionError("deep JSON")],
)
def test_cli_normalizes_bounded_runner_failures_to_exit_two(
    monkeypatch: pytest.MonkeyPatch,
    capsys: pytest.CaptureFixture[str],
    failure: Exception,
) -> None:
    import census.p97_search.phase3_piqd_exact17_runner as runner

    def fail(*args: Any, **kwargs: Any) -> None:
        raise failure

    monkeypatch.setattr(runner, "run_exact17", fail)
    assert runner.main(["package", "run"]) == 2
    assert "exact17 runner rejected input" in capsys.readouterr().err


def test_cli_does_not_swallow_unexpected_errors(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    import census.p97_search.phase3_piqd_exact17_runner as runner

    def fail(*args: Any, **kwargs: Any) -> None:
        raise ValueError("unexpected")

    monkeypatch.setattr(runner, "run_exact17", fail)
    with pytest.raises(ValueError, match="unexpected"):
        runner.main(["package", "run"])


def test_known_unsat_remains_discovery_without_replay(tmp_path: Path) -> None:
    packet = _packet(UNSAT_CNF)
    run = _run(
        tmp_path,
        packet=packet,
        daemon=FakeDaemon(cnf=UNSAT_CNF, result="UNSAT"),
    )
    assert run.driver_result.outcome == DISCOVERY_UNSAT
    assert run.receipt["terminal_outcome"] == DISCOVERY_UNSAT


@pytest.mark.parametrize("assignment", [(1,), (-1, 2)])
def test_partial_or_unsatisfying_model_fails_closed(
    tmp_path: Path, assignment: tuple[int, ...]
) -> None:
    packet = _packet(SAT_CNF)
    run = _run(
        tmp_path,
        packet=packet,
        daemon=FakeDaemon(cnf=SAT_CNF, result="SAT", assignment=assignment),
    )
    assert run.driver_result.outcome == ERROR


def test_existing_identity_is_accepted_and_durably_bound(tmp_path: Path) -> None:
    packet = _packet(SAT_CNF)
    run = _run(
        tmp_path,
        packet=packet,
        daemon=FakeDaemon(
            cnf=SAT_CNF,
            result="SAT",
            assignment=(1, 2),
            existing=True,
        ),
    )
    assert run.driver_result.outcome == STRUCTURAL_SAT
    assert run.receipt["job_identity"]["existing"] is True

    receipt = dict(run.receipt)
    receipt["job_identity"] = {**receipt["job_identity"], "existing": False}
    receipt.pop("receipt_sha256")
    receipt["receipt_sha256"] = sha256_json(receipt)
    run.receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")
    with pytest.raises(Exact17RunnerError, match="durable PREPARE"):
        validate_run_receipt(
            run.receipt_path,
            packet=packet,
            journal_path=tmp_path / "attempts.jsonl",
        )


def test_prepare_existing_flag_requires_a_builtin_boolean(tmp_path: Path) -> None:
    run = _run(
        tmp_path,
        packet=_packet(SAT_CNF),
        daemon=FakeDaemon(
            cnf=SAT_CNF,
            result="SAT",
            assignment=(1, 2),
            existing=1,
        ),
    )
    assert run.driver_result.outcome == ERROR
    assert all(value is None for value in run.receipt["job_identity"].values())


def test_stale_status_identity_fails_closed(tmp_path: Path) -> None:
    second = tmp_path / "stale"
    second.mkdir()

    run = _run(
        second,
        packet=_packet(SAT_CNF),
        daemon=FakeDaemon(
            cnf=SAT_CNF,
            result="SAT",
            assignment=(1, 2),
            status_id="old-job",
        ),
    )
    assert run.driver_result.outcome == ERROR


@pytest.mark.parametrize("tamper", ["outcome", "claim"])
def test_receipt_tampering_is_detected(tmp_path: Path, tamper: str) -> None:
    packet = _packet(SAT_CNF)
    run = _run(
        tmp_path,
        packet=packet,
        daemon=FakeDaemon(cnf=SAT_CNF, result="SAT", assignment=(1, 2)),
    )
    receipt = dict(run.receipt)
    if tamper == "outcome":
        receipt["terminal_outcome"] = DISCOVERY_UNSAT
    else:
        receipt["claims"] = {**receipt["claims"], "theorem_closure": True}
    receipt.pop("receipt_sha256")
    receipt["receipt_sha256"] = sha256_json(receipt)
    run.receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")
    with pytest.raises(Exact17RunnerError):
        validate_run_receipt(
            run.receipt_path,
            packet=packet,
            journal_path=tmp_path / "attempts.jsonl",
        )


def test_receipt_is_immutable_and_output_symlink_is_rejected(tmp_path: Path) -> None:
    packet = _packet(SAT_CNF)
    daemon = FakeDaemon(cnf=SAT_CNF, result="SAT", assignment=(1, 2))
    _run(tmp_path, packet=packet, daemon=daemon)
    with pytest.raises(Exact17RunnerError, match="associated path already exists"):
        _run(tmp_path, packet=packet, daemon=daemon)

    target = tmp_path / "target"
    target.mkdir()
    alias = tmp_path / "alias"
    alias.symlink_to(target, target_is_directory=True)
    with pytest.raises(Exact17RunnerError, match="symlink"):
        run_packet(
            packet,
            client=daemon,
            journal_path=alias / "attempts.jsonl",
            receipt_path=alias / "receipt.json",
            max_polls=1,
            poll_interval_s=0,
        )
