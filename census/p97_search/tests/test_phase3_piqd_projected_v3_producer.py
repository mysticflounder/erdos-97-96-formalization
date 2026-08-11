from __future__ import annotations

import json
import os
from pathlib import Path

import pytest

from census.p97_search import phase3_piqd_projected_v3_producer as producer
from census.p97_search import phase3_piqd_projected_v3_provisioning as provisioning
from census.p97_search.phase3_cegar_wave import canonical_json_bytes
from census.p97_search.phase3_piqd_oracle import HttpResponse


def _response(body: bytes = b"{}") -> HttpResponse:
    return HttpResponse(200, body, {"Content-Type": "application/json"})


def test_confirm_409_is_opaque_and_never_reused_as_200() -> None:
    job_id = "00000000-0000-4000-8000-0000000000ab"
    opaque = b"daemon says already confirmed; not JSON"
    producer._check_confirm_evidence(opaque, http_status=409, job_id=job_id)
    with pytest.raises(producer.ProducerError):
        producer._check_confirm_evidence(opaque, http_status=200, job_id=job_id)
    with pytest.raises(producer.ProducerError, match="empty"):
        producer._check_confirm_evidence(b"", http_status=409, job_id=job_id)


def test_recording_transport_preserves_409_status_and_never_reconfirms(
    tmp_path: Path,
) -> None:
    output = tmp_path / "out"
    output.mkdir(mode=0o700)
    custody = producer._Custody(output, resume=True)
    try:
        calls: list[str] = []

        def fake(method: str, url: str, body: object, headers: object) -> HttpResponse:
            calls.append(method)
            return HttpResponse(409, b"opaque-409", {})

        transport = producer._RecordingTransport(fake, custody)
        transport("POST", "http://daemon/jobs/confirm?job_id=x", None, {})
        assert transport.confirm_response_status == 409
        assert custody.read("confirm-response.raw") == b"opaque-409"
        with pytest.raises(producer.ProducerError, match="more than once"):
            transport("POST", "http://daemon/jobs/confirm?job_id=x", None, {})
        assert calls == ["POST"]
    finally:
        custody.close()


def test_recording_transport_preserves_raw_response_and_rejects_second_confirm(
    tmp_path: Path,
) -> None:
    output = tmp_path / "out"
    output.mkdir(mode=0o700)
    custody = producer._Custody(output, resume=True)
    try:
        calls: list[str] = []

        def fake(method: str, url: str, body: object, headers: object) -> HttpResponse:
            calls.append(method)
            return _response(b'{"status":"confirmed"}')

        transport = producer._RecordingTransport(fake, custody)
        transport("POST", "http://daemon/jobs/confirm?job_id=x", None, {})
        assert custody.read("confirm-response.raw") == b'{"status":"confirmed"}'
        with pytest.raises(producer.ProducerError, match="more than once"):
            transport("POST", "http://daemon/jobs/confirm?job_id=x", None, {})
        assert calls == ["POST"]
    finally:
        custody.close()


def test_custody_rejects_symlink_and_hardlink(tmp_path: Path) -> None:
    output = tmp_path / "out"
    output.mkdir(mode=0o700)
    custody = producer._Custody(output, resume=True)
    try:
        (output / "link").symlink_to(output / "target")
        with pytest.raises(producer.ProducerError):
            custody.write("link", b"x")
        producer._write_new(output / "original", b"x")
        os.link(output / "original", output / "alias")
        with pytest.raises(producer.ProducerError, match="unsafe identity or mode"):
            custody.read("original")
    finally:
        custody.close()


def test_custody_rejects_artifact_mode_and_owner_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output = tmp_path / "out"
    output.mkdir(mode=0o700)
    producer._write_new(output / "artifact.raw", b"x")
    custody = producer._Custody(output, resume=True)
    try:
        os.chmod(output / "artifact.raw", 0o644)
        with pytest.raises(producer.ProducerError, match="unsafe identity or mode"):
            custody.read("artifact.raw")
        os.chmod(output / "artifact.raw", 0o600)
        actual_uid = os.getuid()
        monkeypatch.setattr(producer.os, "getuid", lambda: actual_uid + 1)
        custody._revalidate = lambda: None
        with pytest.raises(producer.ProducerError, match="unsafe identity or mode"):
            custody.read("artifact.raw")
    finally:
        monkeypatch.undo()
        custody.close()


def test_fresh_custody_revalidates_directory_mode_before_reads(tmp_path: Path) -> None:
    output = tmp_path / "out"
    custody = producer._Custody(output, resume=False)
    try:
        os.chmod(output, 0o755)
        with pytest.raises(producer.ProducerError, match="mode"):
            custody.read("missing")
        os.chmod(output, 0o700)
    finally:
        custody.close()


def test_offline_check_requires_self_hash_and_raw_custody(tmp_path: Path) -> None:
    output = tmp_path / "out"
    output.mkdir(mode=0o700)
    for name in producer.RAW_NAMES.values():
        producer._write_new(output / name, b"{}")
    unsigned = {
        "schema": producer.SCHEMA,
        "job_id": "00000000-0000-4000-8000-000000000001",
        "requested_core_limit": 1,
        "poll_count": 1,
        "poll_interval_s": 0,
        "cnf_blob_sha256": "0" * 64,
        "raw_dimacs_identity": "0" * 64,
        "producer_manifest_sha256": "0" * 64,
        "static_artifact_sha256": {},
        "prepared_artifact_sha256": "0" * 64,
        "prepare_response_sha256": "0" * 64,
        "cnf_response_sha256": "0" * 64,
        "confirm_intent_sha256": "0" * 64,
        "confirm_state_sha256": "0" * 64,
        "confirm_response_status": 200,
        "status_files": [],
        "confirm_response_sha256": "0" * 64,
        "status_response_sha256s": [],
        "terminal_status_sha256": "0" * 64,
        "daemon_version_sha256": "0" * 64,
        "solver_registry_sha256": "0" * 64,
        "solver_name": "",
        "attested_solver_processes": 1,
        "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
        "claims": dict(producer.CLAIMS),
    }
    result = {
        **unsigned,
        "result_sha256": producer._sha(canonical_json_bytes(unsigned)),
    }
    producer._write_new(output / "producer-result.json", canonical_json_bytes(result))
    with pytest.raises(producer.ProducerError, match="bundle identity|base.cnf"):
        producer.check_projected_v3_output(output)
    result["claims"] = {**producer.CLAIMS, "proof_verified": True}
    (output / "producer-result.json").unlink()
    producer._write_new(output / "producer-result.json", canonical_json_bytes(result))
    with pytest.raises(producer.ProducerError, match="self-hash"):
        producer.check_projected_v3_output(output)


def test_policy_is_one_bounded_sequential_lane() -> None:
    assert producer.ProducerPolicy(1, 0).max_polls == 1
    with pytest.raises(producer.ProducerError):
        producer.ProducerPolicy(0, 0)


def test_confirm_state_requires_exact_schema_and_authenticated_job() -> None:
    job_id = "00000000-0000-4000-8000-0000000000ab"
    with pytest.raises(producer.ProducerError, match="schema"):
        producer._check_confirm_state(
            {
                "schema": producer.CONFIRM_INTENT_SCHEMA,
                "job_id": job_id,
                "state": "confirmed",
            },
            job_id=job_id,
        )
    with pytest.raises(producer.ProducerError, match="UUID"):
        producer._check_confirm_state(
            {
                "schema": producer.CONFIRM_STATE_SCHEMA,
                "job_id": job_id.upper(),
                "state": "confirmed",
                "confirm_http_status": 200,
            },
            job_id=job_id,
        )
    producer._check_confirm_state(
        {
            "schema": producer.CONFIRM_STATE_SCHEMA,
            "job_id": job_id,
            "state": "confirmed",
            "confirm_http_status": 409,
        },
        job_id=job_id,
    )


def test_prepare_rejects_noncanonical_uuid_and_core_type() -> None:
    bundle = provisioning.build_current_unsharded_projected_v3_bundle()
    preview = bundle.base_cnf[
        : producer.qualification.PRODUCTION_V3_PREPARE_PREVIEW_BYTES
    ].decode("utf-8", errors="replace")
    value = {
        "job_id": "00000000-0000-4000-8000-0000000000ab".upper(),
        "existing": False,
        "cnf_blob_hash": bundle.base_cnf_sha256,
        "identity_hash": bundle.raw_dimacs_identity,
        "num_vars": bundle.num_variables,
        "num_clauses": bundle.num_clauses,
        "preview": preview,
        "requested_core_limit": 1,
    }
    with pytest.raises(producer.ProducerError, match="UUID"):
        producer._check_prepare(value, bundle=bundle)
    value["job_id"] = "00000000-0000-4000-8000-0000000000ab"
    value["requested_core_limit"] = True
    with pytest.raises(producer.ProducerError, match="one-core"):
        producer._check_prepare(value, bundle=bundle)


def test_status_custody_rejects_gaps_and_malformed_names(tmp_path: Path) -> None:
    output = tmp_path / "out"
    output.mkdir(mode=0o700)
    custody = producer._Custody(output, resume=True)
    try:
        producer._write_new(output / "status-001.raw", b"{}")
        with pytest.raises(producer.ProducerError, match="contiguous"):
            producer._status_names(custody)
        (output / "status-001.raw").unlink()
        producer._write_new(output / "status-nope.raw", b"{}")
        with pytest.raises(producer.ProducerError, match="invalid filename"):
            producer._status_names(custody)
    finally:
        custody.close()


@pytest.mark.parametrize("failure_mode", ("pre-transport", "pre-response"))
@pytest.mark.parametrize(
    "present, expected_missing",
    (
        (
            None,
            (producer.RAW_NAMES["prepare"], producer.provisioning.PREPARED_JOB_NAME),
        ),
        (producer.provisioning.PREPARED_JOB_NAME, (producer.RAW_NAMES["prepare"],)),
        (producer.RAW_NAMES["prepare"], (producer.provisioning.PREPARED_JOB_NAME,)),
    ),
)
def test_resume_refuses_incomplete_pre_prepare_custody(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    failure_mode: str,
    present: str | None,
    expected_missing: tuple[str, ...],
) -> None:
    output = tmp_path / "out"
    calls: list[str] = []

    class FailingClient:
        def __init__(
            self, base_url: str, *, transport: object, segmented_multipart: bool
        ) -> None:
            self.base_url = base_url
            self.transport = transport

        def prepare_cnf(self, **kwargs: object) -> producer.PreparedJob:
            if failure_mode == "pre-transport":
                raise producer.PiqdOracleError("local preflight failed")
            try:
                self.transport("POST", f"{self.base_url}/jobs/prepare-cnf", None, {})
            except OSError as exc:
                raise producer.PiqdOracleError(
                    "transport failed before response"
                ) from exc
            raise AssertionError("the failing transport unexpectedly returned")

    def failing_transport(
        method: str, url: str, body: object, headers: object
    ) -> HttpResponse:
        calls.append(method)
        raise OSError("transport unavailable")

    monkeypatch.setattr(producer, "PiqdRawDimacsClient", FailingClient)
    with pytest.raises(
        producer.ProducerError, match="prepare failed after raw custody"
    ):
        producer.produce_projected_v3(
            output_dir=output,
            base_url="http://daemon",
            transport=failing_transport,
            policy=producer.ProducerPolicy(max_polls=1, poll_interval_s=0),
        )

    static_before = {
        name: (output / name).read_bytes() for name in producer.STATIC_NAMES
    }
    assert {path.name for path in output.iterdir()} == set(producer.STATIC_NAMES)
    if present is not None:
        producer._write_new(output / present, b"{}")
    calls_before_resume = len(calls)
    with pytest.raises(
        producer.ProducerError,
        match="incomplete pre-prepare custody is not resumable.*fresh absent output",
    ) as error:
        producer.produce_projected_v3(
            output_dir=output,
            base_url="http://daemon",
            transport=failing_transport,
            policy=producer.ProducerPolicy(max_polls=1, poll_interval_s=0),
            resume=True,
        )
    for name in expected_missing:
        assert name in str(error.value)
    assert len(calls) == calls_before_resume
    assert {
        name: (output / name).read_bytes() for name in producer.STATIC_NAMES
    } == static_before


def test_static_custody_detects_tampered_wave_artifact(tmp_path: Path) -> None:
    bundle = provisioning.build_current_unsharded_projected_v3_bundle()
    output = tmp_path / "out"
    output.mkdir(mode=0o700)
    artifacts = {
        provisioning.BASE_CNF_NAME: bundle.base_cnf,
        provisioning.VARIABLE_MAP_NAME: bundle.variable_map,
        provisioning.SOURCE_BUNDLE_NAME: bundle.source_bundle,
        provisioning.ENCODING_CONFIGURATION_NAME: bundle.encoding_configuration,
        provisioning.SOURCE_MANIFEST_NAME: bundle.source_manifest,
        provisioning.PRODUCER_MANIFEST_NAME: bundle.producer_manifest,
        provisioning.WAVE_MANIFEST_NAME: canonical_json_bytes(
            provisioning.build_current_unsharded_projected_v3_wave_manifest(bundle)
        ),
    }
    for name, raw in artifacts.items():
        producer._write_new(output / name, raw)
    custody = producer._Custody(output, resume=True)
    try:
        producer._validate_static_custody(custody, bundle=bundle)
        (output / provisioning.WAVE_MANIFEST_NAME).unlink()
        producer._write_new(output / provisioning.WAVE_MANIFEST_NAME, b"{}")
        with pytest.raises(producer.ProducerError, match="wave"):
            producer._validate_static_custody(custody, bundle=bundle)
    finally:
        custody.close()


def test_digest_numeric_and_existing_job_guards_are_strict() -> None:
    class DigestSubclass(str):
        pass

    with pytest.raises(producer.ProducerError):
        producer._digest("A" * 64, "digest")
    with pytest.raises(producer.ProducerError):
        producer._digest(DigestSubclass("0" * 64), "digest")
    with pytest.raises(producer.ProducerError, match="unsupported JSON"):
        producer._canonical_json(b'{"value":Infinity}', "nonfinite control")
    with pytest.raises(producer.ProducerError):
        producer.ProducerPolicy(1, float("nan"))
    with pytest.raises(producer.ProducerError):
        producer.ProducerPolicy(1, float("inf"))
    bundle = provisioning.build_current_unsharded_projected_v3_bundle()
    preview = bundle.base_cnf[
        : producer.qualification.PRODUCTION_V3_PREPARE_PREVIEW_BYTES
    ].decode("utf-8", errors="replace")
    value = {
        "job_id": "00000000-0000-4000-8000-000000000001",
        "existing": True,
        "cnf_blob_hash": bundle.base_cnf_sha256,
        "identity_hash": bundle.raw_dimacs_identity,
        "num_vars": bundle.num_variables,
        "num_clauses": bundle.num_clauses,
        "preview": preview,
        "requested_core_limit": 1,
    }
    with pytest.raises(producer.ProducerError, match="existing"):
        producer._check_prepare(value, bundle=bundle)
    with pytest.raises(producer.ProducerError):
        producer.ProducerPolicy(1, True)
    with pytest.raises(producer.ProducerError):
        producer.ProducerPolicy(1, float("-inf"))


def test_daemon_prepare_json_preserves_wire_order_without_canonicalizing() -> None:
    raw = (
        b'{"job_id":"00000000-0000-4000-8000-000000000001",'
        b'"cnf_blob_hash":"' + b"0" * 64 + b'",'
        b'"identity_hash":"' + b"1" * 64 + b'",'
        b'"num_vars":3,"num_clauses":2,"preview":"p cnf 3 2\\n",'
        b'"existing":false,"requested_core_limit":1}'
    )
    assert raw != canonical_json_bytes(json.loads(raw))
    value = producer._daemon_json(raw, "prepare response")
    assert list(value) == [
        "job_id",
        "cnf_blob_hash",
        "identity_hash",
        "num_vars",
        "num_clauses",
        "preview",
        "existing",
        "requested_core_limit",
    ]

    with pytest.raises(producer.ProducerError, match="valid JSON"):
        producer._daemon_json(raw[:-1], "prepare response")
    with pytest.raises(producer.ProducerError, match="valid JSON"):
        producer._daemon_json(
            raw.replace(b'"existing":false', b'"existing":false,"existing":false'),
            "prepare response",
        )


@pytest.mark.parametrize(
    ("field", "replacement"),
    [("existing", "1"), ("requested_core_limit", "1.0"), ("num_vars", "true")],
)
def test_prepare_schema_rejects_noncanonical_value_types(
    field: str, replacement: str
) -> None:
    bundle = provisioning.build_current_unsharded_projected_v3_bundle()
    preview = bundle.base_cnf[
        : producer.qualification.PRODUCTION_V3_PREPARE_PREVIEW_BYTES
    ].decode("utf-8", errors="replace")
    values = {
        "job_id": "00000000-0000-4000-8000-000000000001",
        "cnf_blob_hash": bundle.base_cnf_sha256,
        "identity_hash": bundle.raw_dimacs_identity,
        "num_vars": bundle.num_variables,
        "num_clauses": bundle.num_clauses,
        "preview": preview,
        "existing": False,
        "requested_core_limit": 1,
    }
    raw = json.dumps(values, separators=(",", ":"))
    raw = raw.replace(
        f'"{field}":{json.dumps(values[field])}',
        f'"{field}":{replacement}',
    ).encode()
    with pytest.raises(producer.ProducerError):
        producer._check_prepare(
            producer._daemon_json(raw, "prepare response"), bundle=bundle
        )


def test_inventory_rejects_unexpected_control_entries(tmp_path: Path) -> None:
    output = tmp_path / "out"
    output.mkdir(mode=0o700)
    producer._write_new(output / "unexpected.json", b"{}")
    custody = producer._Custody(output, resume=True)
    try:
        with pytest.raises(producer.ProducerError, match="unexpected"):
            producer._validate_inventory(custody)
    finally:
        custody.close()


def test_intermediate_status_schema_and_custody_are_checked() -> None:
    bundle = provisioning.build_current_unsharded_projected_v3_bundle()
    job_id = "00000000-0000-4000-8000-000000000001"
    prepared = {"backend": "cadical"}
    status = {
        "id": job_id,
        "status": "running",
        "result": None,
        "backend": "cadical",
        "project": "erdos-97-96-formalization",
        "timeout_s": 900,
        "march_timeout_s": 900,
        "wall_ms": 10,
        "wall_human": "10ms",
        "running_for_s": 1,
        "created_at": 1,
        "confirmed_at": 2,
        "started_at": 3,
        "completed_at": 3,
        "model_blob_hash": None,
        "requested_core_limit": 1,
        "attested_solver_processes": 1,
        "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
        "cnf_blob_hash": bundle.base_cnf_sha256,
        "identity_hash": bundle.raw_dimacs_identity,
        "producer_manifest_hash": bundle.producer_manifest_sha256,
    }
    producer._check_lifecycle_status(
        status, job_id=job_id, prepared=prepared, bundle=bundle
    )
    status["status"] = "confirmed"
    producer._check_lifecycle_status(
        status, job_id=job_id, prepared=prepared, bundle=bundle
    )
    status["result"] = "SAT"
    with pytest.raises(producer.ProducerError, match="nonterminal"):
        producer._check_lifecycle_status(
            status, job_id=job_id, prepared=prepared, bundle=bundle
        )
    status["result"] = None
    status["status"] = "running"
    status["identity_hash"] = status["identity_hash"].upper()
    with pytest.raises(producer.ProducerError, match="digest"):
        producer._check_lifecycle_status(
            status, job_id=job_id, prepared=prepared, bundle=bundle
        )
    status["identity_hash"] = bundle.raw_dimacs_identity
    status["unexpected"] = 1
    with pytest.raises(producer.ProducerError, match="schema"):
        producer._check_lifecycle_status(
            status, job_id=job_id, prepared=prepared, bundle=bundle
        )


def test_status_sequence_binds_order_count_and_intermediate_raw_bodies(
    tmp_path: Path,
) -> None:
    bundle = provisioning.build_current_unsharded_projected_v3_bundle()
    job_id = "00000000-0000-4000-8000-000000000001"
    prepared = {"backend": "cadical"}

    def status(
        state: str, result: str | None, *, running_for_s: int | None
    ) -> dict[str, object]:
        return {
            "id": job_id,
            "status": state,
            "result": result,
            "backend": "cadical",
            "project": "erdos-97-96-formalization",
            "timeout_s": 900,
            "march_timeout_s": 900,
            "wall_ms": 10,
            "wall_human": "10ms",
            "running_for_s": running_for_s,
            "created_at": 1,
            "confirmed_at": 2,
            "started_at": 3,
            "completed_at": 3,
            "model_blob_hash": None,
            "requested_core_limit": 1,
            "attested_solver_processes": 1,
            "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
            "cnf_blob_hash": bundle.base_cnf_sha256,
            "identity_hash": bundle.raw_dimacs_identity,
            "producer_manifest_hash": bundle.producer_manifest_sha256,
        }

    output = tmp_path / "out"
    output.mkdir(mode=0o700)
    producer._write_new(
        output / "status-000.raw",
        canonical_json_bytes(status("running", None, running_for_s=1)),
    )
    producer._write_new(
        output / "status-001.raw",
        canonical_json_bytes(status("completed", "SAT", running_for_s=None)),
    )
    custody = producer._Custody(output, resume=True)
    try:
        names, terminal = producer._check_status_sequence(
            custody, job_id=job_id, prepared=prepared, bundle=bundle
        )
        assert names == ["status-000.raw", "status-001.raw"]
        assert terminal["status"] == "completed"
        assert terminal["result"] == "SAT"

        raw = status("running", None, running_for_s=1)
        raw["requested_core_limit"] = 2
        (output / "status-000.raw").unlink()
        producer._write_new(output / "status-000.raw", canonical_json_bytes(raw))
        with pytest.raises(producer.ProducerError, match="one-core"):
            producer._check_status_sequence(
                custody, job_id=job_id, prepared=prepared, bundle=bundle
            )
        (output / "status-000.raw").unlink()
        producer._write_new(
            output / "status-000.raw",
            canonical_json_bytes(status("running", None, running_for_s=1)),
        )
        (output / "status-001.raw").unlink()
        producer._write_new(
            output / "status-002.raw",
            canonical_json_bytes(status("completed", "SAT", running_for_s=None)),
        )
        with pytest.raises(producer.ProducerError, match="contiguous"):
            producer._check_status_sequence(
                custody, job_id=job_id, prepared=prepared, bundle=bundle
            )
    finally:
        custody.close()


def test_producer_path_records_confirmed_before_terminal_completion(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    bundle = provisioning.build_current_unsharded_projected_v3_bundle()
    job_id = "00000000-0000-4000-8000-000000000002"
    preview = bundle.base_cnf[
        : producer.qualification.PRODUCTION_V3_PREPARE_PREVIEW_BYTES
    ].decode("utf-8", errors="replace")
    prepared = producer.PreparedJob(
        job_id,
        "cadical",
        "sat",
        bundle.base_cnf_sha256,
        bundle.raw_dimacs_identity,
        bundle.num_variables,
        bundle.num_clauses,
        False,
        1,
    )

    def lifecycle(state: str, result: str | None) -> dict[str, object]:
        return {
            "id": job_id,
            "status": state,
            "result": result,
            "backend": "cadical",
            "project": "erdos-97-96-formalization",
            "timeout_s": 900,
            "march_timeout_s": 900,
            "wall_ms": 10,
            "wall_human": "10ms",
            "running_for_s": None,
            "created_at": 1,
            "confirmed_at": 2,
            "started_at": 3,
            "completed_at": 3,
            "model_blob_hash": None,
            "requested_core_limit": 1,
            "attested_solver_processes": 1,
            "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
            "cnf_blob_hash": bundle.base_cnf_sha256,
            "identity_hash": bundle.raw_dimacs_identity,
            "producer_manifest_hash": bundle.producer_manifest_sha256,
        }

    status_bodies = [
        canonical_json_bytes(lifecycle("confirmed", None)),
        canonical_json_bytes(lifecycle("completed", "SAT")),
    ]
    profile = provisioning.PRODUCTION_V3_PROFILE
    daemon = {
        "name": "piqd",
        "version": "test",
        "protocol_version": 1,
        "sha256": "0" * 64,
    }
    version = {"daemon": daemon, "limits": {"max_var": 1_000_000}}
    solver = {
        "lane": profile.solver_lane,
        "name": profile.solver_name,
        "path": "/opt/piqd/solver",
        "protocol_version": 1,
        "sha256": profile.solver_sha256,
        "solver": profile.solver_backend,
        "solver_signature": profile.solver_signature,
        "solver_source": "test",
        "solver_version": "test",
        "usable": True,
        "worker": "test-worker",
        "worker_version": "test",
    }
    registry = {"daemon": daemon, "solver_dir": "/opt/piqd", "solvers": [solver]}
    prepare_response = {
        "job_id": job_id,
        "cnf_blob_hash": bundle.base_cnf_sha256,
        "identity_hash": bundle.raw_dimacs_identity,
        "num_vars": bundle.num_variables,
        "num_clauses": bundle.num_clauses,
        "preview": preview,
        "existing": False,
        "requested_core_limit": 1,
    }
    prepare_raw = json.dumps(prepare_response, separators=(",", ":")).encode()
    assert prepare_raw != canonical_json_bytes(prepare_response)

    def inner(method: str, url: str, body: object, headers: object) -> HttpResponse:
        path = url.split("http://daemon", 1)[-1].split("?", 1)[0]
        if method == "POST" and path == "/jobs/prepare-cnf":
            return _response(prepare_raw)
        if method == "GET" and path == f"/jobs/{job_id}/cnf":
            return _response(bundle.base_cnf)
        if method == "POST" and path == "/jobs/confirm":
            return _response(
                canonical_json_bytes({"job_id": job_id, "status": "confirmed"})
            )
        if method == "GET" and path == f"/jobs/{job_id}":
            return _response(status_bodies.pop(0))
        if method == "GET" and path == "/version":
            return _response(canonical_json_bytes(version))
        if method == "GET" and path == "/solvers":
            return _response(canonical_json_bytes(registry))
        raise AssertionError(f"unexpected fake request: {method} {url}")

    class FakeClient:
        def __init__(
            self, base_url: str, *, transport: object, segmented_multipart: bool
        ) -> None:
            self.base_url = base_url
            self.transport = transport

        def prepare_cnf(self, **kwargs: object) -> producer.PreparedJob:
            self.transport("POST", f"{self.base_url}/jobs/prepare-cnf", None, {})
            return prepared

        def verify_stored_cnf(
            self, job: producer.PreparedJob, expected_cnf: bytes
        ) -> str:
            response = self.transport(
                "GET", f"{self.base_url}/jobs/{job.job_id}/cnf", None, {}
            )
            assert response.body == expected_cnf
            return producer._sha(response.body)

        def confirm(self, job: producer.PreparedJob, *, expected_cnf: bytes) -> str:
            response = self.transport(
                "GET", f"{self.base_url}/jobs/{job.job_id}/cnf", None, {}
            )
            assert response.body == expected_cnf
            self.transport(
                "POST", f"{self.base_url}/jobs/confirm?job_id={job.job_id}", None, {}
            )
            return "confirmed"

        def status(self, requested_job_id: str) -> dict[str, object]:
            response = self.transport(
                "GET", f"{self.base_url}/jobs/{requested_job_id}", None, {}
            )
            return json.loads(response.body)

    monkeypatch.setattr(producer, "PiqdRawDimacsClient", FakeClient)
    result = producer.produce_projected_v3(
        output_dir=tmp_path / "out",
        base_url="http://daemon",
        transport=inner,
        policy=producer.ProducerPolicy(max_polls=2, poll_interval_s=0),
    )
    assert result.polls == 2
    assert result.job_id == job_id
    assert (
        json.loads((tmp_path / "out" / "status-000.raw").read_bytes())["status"]
        == "confirmed"
    )
    assert (
        json.loads((tmp_path / "out" / "status-001.raw").read_bytes())["status"]
        == "completed"
    )
    checked = producer.check_projected_v3_output(tmp_path / "out")
    assert checked["poll_count"] == 2
