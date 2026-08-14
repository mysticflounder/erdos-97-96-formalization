from __future__ import annotations

import json
import os
from copy import deepcopy
from pathlib import Path

import pytest

import census.p97_search.phase3_cegar_wave_control as wave_control
import census.p97_search.phase3_cegar_wave_engine as engine
from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    UNSAT_MEANS_OBSTRUCTION,
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
    wave_manifest_sha256,
)
from census.p97_search.phase3_cegar_wave_control import (
    CONTROL_SCHEMA,
    CONTROL_SCHEMA_V2,
    EXECUTION_REGISTRY_SCHEMA,
    STATIC_CNF,
    STATIC_CNF_EXECUTION_CAPABILITIES,
    STATIC_CNF_EXECUTION_MODE,
    STATIC_CNF_PIQD_ADAPTER,
    STATIC_CNF_PIQD_ADAPTER_SCHEMA,
    STATIC_CNF_PIQD_ADAPTER_SCHEMA_V2,
    STATIC_CNF_SEMANTIC_VALIDATOR,
    STATIC_CNF_SEMANTIC_VALIDATOR_V2,
    STATIC_CNF_V2_REGISTRY_REVISION,
    load_wave_control,
)
from census.p97_search.phase3_piqd_driver import DriverPolicy
from census.p97_search.phase3_piqd_oracle import MultipartBody
from census.p97_search.phase3_piqd_static_solver_runner import (
    PRODUCER_SCHEMA,
    SOURCE_SCHEMA,
    StaticPiqdRunnerError,
    StaticSolverResult,
    make_static_piqd_solver_runner,
)


def _write(root: Path, relative: str, raw: bytes) -> dict[str, object]:
    path = root / relative
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(raw)
    return {"path": relative, "sha256": sha256_bytes(raw), "max_bytes": 1 << 20}


def _custody_inventory_fixture(
    tmp_path: Path,
    payloads: dict[str, bytes],
) -> tuple[Path, int, dict[str, object], bytes]:
    attempt = tmp_path / "attempt"
    artifacts = attempt / "attempt.jsonl.artifacts"
    artifacts.mkdir(parents=True)
    (attempt / "attempt.jsonl").write_bytes(b"journal\n")
    (attempt / "attempt.jsonl.lock").write_bytes(b"")
    seal_raw = b"seal"
    (attempt / "attempt.jsonl.seal.json").write_bytes(seal_raw)
    rows: list[dict[str, object]] = []
    for digest, payload in payloads.items():
        path = artifacts / digest
        path.write_bytes(payload)
        info = path.stat()
        rows.append(
            {
                "sha256": digest,
                "size": info.st_size,
                "device": info.st_dev,
                "inode": info.st_ino,
            }
        )
    journal = (attempt / "attempt.jsonl").stat()
    lock = (attempt / "attempt.jsonl.lock").stat()
    inventory = {
        "journal_sha256": sha256_bytes(b"journal\n"),
        "journal_size": journal.st_size,
        "journal_device": journal.st_dev,
        "journal_inode": journal.st_ino,
        "lock_device": lock.st_dev,
        "lock_inode": lock.st_ino,
        "driver_seal_sha256": sha256_bytes(seal_raw),
        "artifacts": rows,
    }
    attempt_fd = os.open(attempt, engine._DIRECTORY_FLAGS)
    return attempt, attempt_fd, inventory, seal_raw


def _verify_inventory_fixture(
    tmp_path: Path,
    payloads: dict[str, bytes],
    *,
    expected_cnf_sha256: str,
    max_cnf_bytes: int,
) -> None:
    attempt, attempt_fd, inventory, seal_raw = _custody_inventory_fixture(
        tmp_path, payloads
    )
    try:
        engine._verify_custody_inventory(
            attempt,
            attempt_fd,
            inventory,
            seal_raw=seal_raw,
            expected_cnf_sha256=expected_cnf_sha256,
            max_cnf_bytes=max_cnf_bytes,
        )
    finally:
        os.close(attempt_fd)


def test_custody_inventory_allows_authenticated_large_cnf_within_registered_cap(
    tmp_path: Path,
) -> None:
    payload = b"c" * ((64 << 20) + 1)
    digest = sha256_bytes(payload)
    _verify_inventory_fixture(
        tmp_path,
        {digest: payload},
        expected_cnf_sha256=digest,
        max_cnf_bytes=len(payload),
    )


def test_custody_inventory_keeps_64mib_bound_for_non_cnf_artifacts(
    tmp_path: Path,
) -> None:
    cnf = b"cnf"
    oversized = b"x" * ((64 << 20) + 1)
    cnf_digest = sha256_bytes(cnf)
    oversized_digest = sha256_bytes(oversized)
    with pytest.raises(engine.StaticCnfEngineError, match="byte bound"):
        _verify_inventory_fixture(
            tmp_path,
            {oversized_digest: oversized, cnf_digest: cnf},
            expected_cnf_sha256=cnf_digest,
            max_cnf_bytes=512 << 20,
        )


@pytest.mark.parametrize("crossed", [False, True], ids=["missing", "crossed"])
def test_custody_inventory_requires_exactly_one_authenticated_cnf(
    tmp_path: Path, crossed: bool
) -> None:
    payload = b"not-the-cnf"
    actual_digest = sha256_bytes(payload)
    expected_digest = sha256_bytes(b"expected-cnf")
    attempt, attempt_fd, inventory, seal_raw = _custody_inventory_fixture(
        tmp_path, {actual_digest: payload}
    )
    if crossed:
        inventory["artifacts"][0]["sha256"] = expected_digest
    try:
        with pytest.raises(engine.StaticCnfEngineError, match="exactly once|exact"):
            engine._verify_custody_inventory(
                attempt,
                attempt_fd,
                inventory,
                seal_raw=seal_raw,
                expected_cnf_sha256=expected_digest,
                max_cnf_bytes=512 << 20,
            )
    finally:
        os.close(attempt_fd)


def test_custody_inventory_rejects_authenticated_cnf_over_registered_cap(
    tmp_path: Path,
) -> None:
    payload = b"cnf-too-large"
    digest = sha256_bytes(payload)
    with pytest.raises(engine.StaticCnfEngineError, match="byte bound"):
        _verify_inventory_fixture(
            tmp_path,
            {digest: payload},
            expected_cnf_sha256=digest,
            max_cnf_bytes=len(payload) - 1,
        )


def _fixture_control(tmp_path: Path) -> tuple[object, Path, bytes, bytes]:
    cnf = b"c fixture\np cnf 3 2\n1 -2 0\n2 3 0\n"
    variable_map = canonical_json_bytes({"1": "x", "2": "y", "3": "z"})
    source = {
        "schema": SOURCE_SCHEMA,
        "source_id": "p97-static-engine-fixture",
        "source_path": "census/p97_search/sat_generate.py",
        "source_sha256": "a" * 64,
        "finite_schema": "p97-static-engine-fixture/v1",
        "cardinality_scope": "one finite static CNF",
        "source_theorem": "Problem97.staticEngineFixture",
        "claims": {
            "source_entitlement": False,
            "theorem_coverage": False,
            "universal_lift": False,
            "lean_closure": False,
        },
    }
    source_raw = canonical_json_bytes(source)
    producer = {
        "schema": PRODUCER_SCHEMA,
        "producer_id": "static-engine-fixture-producer",
        "producer_kind": "static-dimacs",
        "source_manifest": source,
        "source_manifest_sha256": sha256_bytes(source_raw),
        "variable_map_sha256": sha256_bytes(variable_map),
        "backend": "cadical",
        "solver_profile": "sat",
        "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        "claims": {
            **source["claims"],
            "one_process": False,
            "one_core": False,
        },
    }
    producer_raw = canonical_json_bytes(producer)
    manifest = {
        "schema": "p97-cegar-wave/v1",
        "wave_id": "static-engine-fixture-wave",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": source["source_id"],
            "ingress_hypotheses_sha256": source["source_sha256"],
            "finite_schema": source["finite_schema"],
            "cardinality_scope": source["cardinality_scope"],
            "source_theorem": source["source_theorem"],
        },
        "encoding": {
            "cnf_sha256": sha256_bytes(cnf),
            "variable_map_sha256": sha256_bytes(variable_map),
            "producer_manifest_sha256": sha256_bytes(producer_raw),
            "num_variables": 3,
            "num_clauses": 2,
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "sat",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": sha256_bytes(b"engine-fixture-order"),
            "seed": 97,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    manifest_raw = canonical_json_bytes(manifest)
    references = {
        "cnf": _write(tmp_path, "package/input.cnf", cnf),
        "producer_manifest": _write(tmp_path, "package/producer.json", producer_raw),
        "variable_map": _write(tmp_path, "package/variable-map.json", variable_map),
        "wave_manifest": _write(tmp_path, "package/wave.json", manifest_raw),
    }
    assert references["wave_manifest"]["sha256"] == wave_manifest_sha256(manifest)
    control_raw = canonical_json_bytes(
        {
            "schema": CONTROL_SCHEMA,
            "wave_kind": STATIC_CNF,
            "adapter_id": STATIC_CNF_PIQD_ADAPTER,
            "adapter_schema": STATIC_CNF_PIQD_ADAPTER_SCHEMA,
            "wave_manifest": references["wave_manifest"],
            "package": references,
            "driver_policy": DriverPolicy(requested_core_limit=1).as_dict(),
            "semantic_validator": STATIC_CNF_SEMANTIC_VALIDATOR,
        }
    )
    # The control package has exactly three package references; wave_manifest
    # is a sibling top-level reference.
    control = dict(json.loads(control_raw))
    control["package"] = {
        key: value for key, value in references.items() if key != "wave_manifest"
    }
    control_raw = canonical_json_bytes(control)
    return load_wave_control(control_raw), tmp_path, cnf, producer_raw


def _fixture_v2_control(
    tmp_path: Path,
) -> tuple[object, Path, bytes, bytes, dict[str, object]]:
    """Build a v2 control from the checked semantic-profile test fixture."""
    from census.p97_search.tests.test_cegar_wave_semantic_profiles import _fixture

    semantic_root = tmp_path / "semantic"
    semantic_root.mkdir(parents=True)
    profile_raw, captures, profile = _fixture(semantic_root)
    profile_path = semantic_root / "profile.json"
    profile_path.write_bytes(profile_raw)

    control, package_root, _old_cnf, _old_producer = _fixture_control(tmp_path)
    package = package_root / "package"
    cnf = captures["child_cnf"].data
    assert cnf is not None
    (package / "input.cnf").write_bytes(cnf)
    producer = json.loads((package / "producer.json").read_bytes())
    producer["query_polarity"] = profile["control"]["query_polarity"]
    producer_raw = canonical_json_bytes(producer)
    (package / "producer.json").write_bytes(producer_raw)
    manifest = json.loads((package / "wave.json").read_bytes())
    manifest["encoding"].update(
        {
            "cnf_sha256": sha256_bytes(cnf),
            "producer_manifest_sha256": sha256_bytes(producer_raw),
            "num_clauses": profile["control"]["clauses"],
            "query_polarity": profile["control"]["query_polarity"],
        }
    )
    manifest_raw = canonical_json_bytes(manifest)
    (package / "wave.json").write_bytes(manifest_raw)

    def reference(path: Path, raw: bytes, maximum: int = 1 << 20) -> dict[str, object]:
        return {
            "path": os.path.relpath(path, package_root),
            "sha256": sha256_bytes(raw),
            "max_bytes": maximum,
        }

    value = deepcopy(control.value)
    value.update(
        {
            "schema": CONTROL_SCHEMA_V2,
            "adapter_schema": STATIC_CNF_PIQD_ADAPTER_SCHEMA_V2,
            "semantic_validator": STATIC_CNF_SEMANTIC_VALIDATOR_V2,
            "wave_manifest": reference(package / "wave.json", manifest_raw),
            "semantic_profile": reference(profile_path, profile_raw),
            "semantic_artifacts": {
                role: reference(captured.path, captured.data)
                for role, captured in sorted(captures.items())
            },
        }
    )
    value["package"] = {
        "cnf": reference(package / "input.cnf", cnf, 512 << 20),
        "producer_manifest": reference(package / "producer.json", producer_raw),
        "variable_map": value["package"]["variable_map"],
    }
    control_raw = canonical_json_bytes(value)
    return load_wave_control(control_raw), package_root, cnf, producer_raw, profile


def test_v2_binding_reuses_identical_cnf_semantic_artifact(tmp_path: Path) -> None:
    control, package_root, _cnf, _producer, _profile = _fixture_v2_control(tmp_path)
    value = deepcopy(control.value)
    value["package"]["cnf"] = value["semantic_artifacts"]["child_cnf"]
    shared_control = load_wave_control(canonical_json_bytes(value))

    binding = wave_control.bind_static_cnf(shared_control, package_root)
    child_capture = dict(binding.semantic_artifacts)["child_cnf"]

    assert child_capture.data is binding.cnf


class _FakePiqd:
    """Small current-API transport used only to exercise the engine boundary."""

    def __init__(self, cnf: bytes, producer: bytes, result: str) -> None:
        self.cnf, self.producer, self.result = cnf, producer, result
        self.job_id = "engine-fixture-job"
        self.calls: list[tuple[str, str]] = []
        self.fail_first = False

    @staticmethod
    def _json(value: dict[str, object]):
        from census.p97_search.phase3_piqd_oracle import HttpResponse

        return HttpResponse(
            200, canonical_json_bytes(value), {"Content-Type": "application/json"}
        )

    def __call__(self, method: str, url: str, body: object, _headers: object):
        from urllib.parse import urlsplit

        from census.p97_search.phase3_piqd_oracle import (
            HttpResponse,
            raw_dimacs_identity,
            scan_dimacs,
        )

        parsed = urlsplit(url)
        path = parsed.path + (f"?{parsed.query}" if parsed.query else "")
        self.calls.append((method, path))
        if self.fail_first and len(self.calls) == 1:
            raise OSError("fixture transport loss")
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
            assert isinstance(body, (bytes, bytearray, MultipartBody))
            variables, clauses = scan_dimacs(self.cnf)
            return self._json(
                {
                    "job_id": self.job_id,
                    "cnf_blob_hash": cnf_hash,
                    "identity_hash": identity,
                    "num_vars": variables,
                    "num_clauses": clauses,
                    "preview": "",
                    "existing": False,
                    "requested_core_limit": 1,
                }
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/cnf":
            return HttpResponse(
                200, self.cnf, {"Content-Type": "application/octet-stream"}
            )
        if method == "POST" and path == f"/jobs/confirm?job_id={self.job_id}":
            return self._json({"job_id": self.job_id, "status": "confirmed"})
        if method == "GET" and path == f"/jobs/{self.job_id}":
            return self._json(
                {
                    "id": self.job_id,
                    "status": "completed",
                    "result": self.result,
                    "requested_core_limit": 1,
                    "progress": {"solver_started": True},
                    "attested_solver_processes": 1,
                    "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
                }
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/model":
            return self._json(
                {
                    "job_id": self.job_id,
                    "result": "SAT",
                    "num_assigned": 3,
                    "assignment": [1, 2, 3],
                }
            )
        if method == "GET" and path.startswith(f"/jobs/{self.job_id}/log?"):
            raw = f"s {self.result}\n".encode()
            return HttpResponse(
                200,
                raw,
                {"Content-Type": "text/plain", "X-Log-Size-Bytes": str(len(raw))},
            )
        raise AssertionError((method, path))


def _make_engine(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    verdict: str,
    *,
    execution_registration: dict[str, object] | None = None,
):
    control, package_root, cnf, producer = _fixture_control(tmp_path)
    journal_root = tmp_path / "journals"
    journal_root.mkdir()
    output_parent = tmp_path / "published"
    output_parent.mkdir()
    output = output_parent / "engine.json"
    api = _FakePiqd(cnf, producer, verdict)
    calls: list[object] = []

    def factory(**kwargs):
        calls.append(kwargs)
        kwargs.pop("transport", None)
        return make_static_piqd_solver_runner(
            **kwargs, transport=api, sleep=lambda _seconds: None
        )

    monkeypatch.setattr(engine, "make_static_piqd_solver_runner", factory)
    return (
        engine.StaticCnfWaveEngine(
            control=control,
            package_root=package_root,
            output_path=output,
            base_url="http://piqd.fixture",
            journal_root=journal_root,
            execution_registration=execution_registration,
        ),
        output,
        api,
        calls,
    )


def _v2_registration() -> dict[str, object]:
    return {
        "schema": EXECUTION_REGISTRY_SCHEMA,
        "registry_revision": STATIC_CNF_V2_REGISTRY_REVISION,
        "registration": {
            "wave_kind": STATIC_CNF,
            "adapter_id": STATIC_CNF_PIQD_ADAPTER,
            "adapter_schema": STATIC_CNF_PIQD_ADAPTER_SCHEMA_V2,
            "registry_revision": STATIC_CNF_V2_REGISTRY_REVISION,
            "engine_schema": "p97-cegar-static-cnf-engine/v2",
            "semantic_validator": STATIC_CNF_SEMANTIC_VALIDATOR_V2,
            "execution_mode": STATIC_CNF_EXECUTION_MODE,
            "capabilities": list(STATIC_CNF_EXECUTION_CAPABILITIES),
            "permits_campaign": False,
            "permits_export": False,
            "permits_diagnostic_mining": False,
            "permits_terminal_proof": False,
        },
    }


def _make_v2_engine(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    verdict: str,
):
    control, package_root, cnf, producer, profile = _fixture_v2_control(tmp_path)
    journal_root = tmp_path / "journals"
    journal_root.mkdir()
    output_parent = tmp_path / "published"
    output_parent.mkdir()
    output = output_parent / "engine-v2.json"
    api = _FakePiqd(cnf, producer, verdict)
    calls: list[object] = []
    execution_registration = _v2_registration()

    def factory(**kwargs):
        calls.append(kwargs)
        kwargs.pop("transport", None)
        return make_static_piqd_solver_runner(
            **kwargs, transport=api, sleep=lambda _seconds: None
        )

    monkeypatch.setattr(engine, "make_static_piqd_solver_runner", factory)
    return (
        engine.StaticCnfWaveEngine(
            control=control,
            package_root=package_root,
            output_path=output,
            base_url="http://piqd.fixture",
            journal_root=journal_root,
            execution_registration=execution_registration,
        ),
        output,
        api,
        calls,
        profile,
    )


def test_result_type_and_closed_classification() -> None:
    sat = StaticSolverResult("SAT", {1: True}, 10)
    engine._result_type_check(sat)
    assert (
        engine._classification(
            sat, {"adapter_verdict": "SAT", "outcome": "STRUCTURAL_SAT"}
        )
        == engine.SAT_OBSERVED
    )
    unsat = StaticSolverResult("UNSAT", {}, 20)
    assert (
        engine._classification(
            unsat, {"adapter_verdict": "UNSAT", "outcome": "DISCOVERY_UNSAT"}
        )
        == engine.UNSAT_OBSERVED_DISCOVERY_ONLY
    )
    assert (
        engine._classification(
            StaticSolverResult("UNKNOWN", {}, 1),
            {"adapter_verdict": "UNKNOWN", "outcome": "ERROR"},
        )
        == engine.INDETERMINATE
    )


def test_result_type_rejects_subclass_and_non_boolean_assignment() -> None:
    class ChildResult(StaticSolverResult):
        pass

    with pytest.raises(engine.StaticCnfEngineError, match="wrong result type"):
        engine._result_type_check(ChildResult("SAT", {1: True}, 10))
    with pytest.raises(engine.StaticCnfEngineError, match="invalid field types"):
        engine._result_type_check(StaticSolverResult("SAT", {1: 1}, 10))


def test_offline_validator_rejects_tampered_or_crossed_envelope(tmp_path: Path) -> None:
    # The validator must fail before any transport/runner is reachable when the
    # outer binding is crossed or its self-hash is stale.
    envelope = {
        "schema": engine.ENGINE_SCHEMA,
        "wave_kind": "STATIC_CNF",
        "claims": {name: False for name in engine._CLAIMS},
        "receipt": {},
    }
    path = tmp_path / "engine.json"
    path.write_bytes(
        canonical_json_bytes({**envelope, "envelope_sha256": sha256_json(envelope)})
        + b"\n"
    )
    with pytest.raises(engine.StaticCnfEngineError, match="receipt schema"):
        engine.validate_static_cnf_engine_output(path)
    crossed = dict(envelope)
    crossed["wave_kind"] = "CAMPAIGN"
    path.write_bytes(
        canonical_json_bytes({**crossed, "envelope_sha256": sha256_json(crossed)})
        + b"\n"
    )
    with pytest.raises(engine.StaticCnfEngineError, match="unsafe claims"):
        engine.validate_static_cnf_engine_output(path)


def test_transport_and_baseexception_are_not_retried() -> None:
    calls: list[str] = []

    def transport_failure() -> StaticSolverResult:
        calls.append("transport")
        raise OSError("transport failure")

    with pytest.raises(OSError):
        transport_failure()
    assert calls == ["transport"]

    class Fatal(BaseException):
        pass

    def fatal_runner() -> StaticSolverResult:
        calls.append("fatal")
        raise Fatal()

    with pytest.raises(Fatal):
        fatal_runner()
    assert calls == ["transport", "fatal"]


def test_literal_none_proof_boundary() -> None:
    # The public run signature makes proof_path keyword-only and rejects any
    # non-None value before binding or invoking a runner.
    assert "proof_path" in engine.StaticCnfWaveEngine.run.__annotations__
    assert engine.STATIC_CNF == "STATIC_CNF"


@pytest.mark.parametrize(
    ("verdict", "classification"),
    [
        ("SAT", engine.SAT_OBSERVED),
        ("UNSAT", engine.UNSAT_OBSERVED_DISCOVERY_ONLY),
        ("UNKNOWN", engine.INDETERMINATE),
    ],
)
def test_run_uses_one_static_call_and_returns_offline_accepted_envelope(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    verdict: str,
    classification: str,
) -> None:
    wave_engine, output, api, factories = _make_engine(tmp_path, monkeypatch, verdict)
    accepted = wave_engine.run(timeout_s=7, proof_path=None)

    assert accepted.classification == classification
    assert len(factories) == 1
    assert accepted.envelope["envelope_sha256"]
    assert accepted.envelope["claims"] == {name: False for name in engine._CLAIMS}
    assert "execution_registry" not in accepted.envelope
    assert output.is_file()
    # The public validator must not consume or mutate the returned envelope.
    before = dict(accepted.envelope)
    checked = engine.validate_static_cnf_engine_output(output)
    assert accepted.envelope == before
    assert checked == before
    assert api.calls


def test_v1_envelope_shape_is_frozen_and_rejects_reserved_profile(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    wave_engine, output, _api, _factories = _make_engine(tmp_path, monkeypatch, "SAT")
    accepted = wave_engine.run(timeout_s=7, proof_path=None)
    envelope = accepted.envelope

    assert set(envelope) == {
        "schema",
        "wave_kind",
        "adapter",
        "control",
        "wave_manifest",
        "package",
        "resource_policy",
        "result",
        "receipt",
        "custody_seal",
        "driver_seal",
        "journal",
        "attempt_entries",
        "attempt_inventory",
        "claims",
        "envelope_sha256",
    }
    assert envelope["schema"] == engine.ENGINE_SCHEMA
    assert "semantic_profile" not in envelope
    assert output.read_bytes() == canonical_json_bytes(envelope) + b"\n"

    for field, value in (
        (
            "semantic_profile",
            {"schema": "p97-static-cnf-semantic-profile/v1", "sha256": "0" * 64},
        ),
        ("semantic_artifacts", []),
        ("execution_manifest", {}),
    ):
        profiled = deepcopy(envelope)
        profiled[field] = value
        unsigned = {
            key: value for key, value in profiled.items() if key != "envelope_sha256"
        }
        profiled["envelope_sha256"] = sha256_json(unsigned)
        output.write_bytes(canonical_json_bytes(profiled) + b"\n")
        with pytest.raises(engine.StaticCnfEngineError):
            engine.validate_static_cnf_engine_output(output)


def test_v2_run_binds_input_and_execution_manifests_and_semantic_inventory(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    wave_engine, output, api, factories, profile = _make_v2_engine(
        tmp_path, monkeypatch, "SAT"
    )
    accepted = wave_engine.run(timeout_s=7, proof_path=None)
    envelope = accepted.envelope

    assert envelope["schema"] == "p97-cegar-static-cnf-engine/v2"
    bound_manifest = json.loads(
        (wave_engine.package_root / wave_engine.control.manifest.path).read_bytes()
    )
    assert envelope["wave_manifest"] == {
        "sha256": wave_engine.control.manifest.sha256,
        "manifest": bound_manifest,
    }
    execution = envelope["execution_manifest"]
    assert execution["manifest"] != bound_manifest
    assert execution["sha256"] == wave_manifest_sha256(execution["manifest"])

    expected_profile_metadata = {
        key: profile[key]
        for key in ("schema", "profile_id", "validator", "classification", "cleanup")
    }
    assert envelope["semantic_profile"] == {
        "sha256": sha256_bytes(canonical_json_bytes(profile)),
        "metadata": expected_profile_metadata,
    }
    expected_artifacts = [
        {
            "role": role,
            "sha256": reference.sha256,
            "bytes": len((wave_engine.package_root / reference.path).read_bytes()),
        }
        for role, reference in wave_engine.control.semantic_artifacts
    ]
    assert envelope["semantic_artifacts"] == expected_artifacts
    assert len(factories) == 1
    assert api.calls
    assert output.read_bytes() == canonical_json_bytes(envelope) + b"\n"
    assert engine.validate_static_cnf_engine_output(output) == envelope


def test_v2_constructor_requires_authenticated_execution_registration(
    tmp_path: Path,
) -> None:
    control, package_root, _cnf, _producer, _profile = _fixture_v2_control(tmp_path)
    with pytest.raises(engine.StaticCnfEngineError, match="registry is required"):
        engine.StaticCnfWaveEngine(
            control=control,
            package_root=package_root,
            output_path=tmp_path / "result.json",
            base_url="http://piqd.fixture",
            journal_root=tmp_path / "journals",
        )


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("schema", "p97-cegar-execution-registry/v2"),
        ("registry_revision", "2026-08-14.2"),
        ("execution_mode", "one-shot"),
        ("capabilities", ["check", "run"]),
    ],
)
def test_v2_constructor_requires_exact_code_defined_registration(
    field: str, value: object, tmp_path: Path
) -> None:
    control, package_root, _cnf, _producer, _profile = _fixture_v2_control(tmp_path)
    registration = _v2_registration()
    inner = registration["registration"]
    assert type(inner) is dict
    if field in {"schema", "registry_revision"}:
        registration[field] = value
        if field == "registry_revision":
            inner[field] = value
    else:
        inner[field] = value
    with pytest.raises(engine.StaticCnfEngineError, match="code-defined"):
        engine.StaticCnfWaveEngine(
            control=control,
            package_root=package_root,
            output_path=tmp_path / "result.json",
            base_url="http://piqd.fixture",
            journal_root=tmp_path / "journals",
            execution_registration=registration,
        )


def test_v2_offline_validator_rejects_manifest_and_semantic_crossings(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    wave_engine, output, _api, _factories, _profile = _make_v2_engine(
        tmp_path, monkeypatch, "UNKNOWN"
    )
    envelope = wave_engine.run(timeout_s=7, proof_path=None).envelope

    def write_tampered(value: dict[str, object]) -> None:
        unsigned = {
            key: item for key, item in value.items() if key != "envelope_sha256"
        }
        value["envelope_sha256"] = sha256_json(unsigned)
        output.write_bytes(canonical_json_bytes(value) + b"\n")

    missing_execution = deepcopy(envelope)
    del missing_execution["execution_manifest"]
    write_tampered(missing_execution)
    with pytest.raises(engine.StaticCnfEngineError):
        engine.validate_static_cnf_engine_output(output)

    extra_execution = deepcopy(envelope)
    extra_execution["execution_manifest"]["extra"] = False
    write_tampered(extra_execution)
    with pytest.raises(engine.StaticCnfEngineError):
        engine.validate_static_cnf_engine_output(output)

    crossed_execution = deepcopy(envelope)
    crossed_execution["execution_manifest"]["sha256"] = envelope["wave_manifest"][
        "sha256"
    ]
    write_tampered(crossed_execution)
    with pytest.raises(engine.StaticCnfEngineError):
        engine.validate_static_cnf_engine_output(output)

    missing_metadata = deepcopy(envelope)
    del missing_metadata["semantic_profile"]["metadata"]
    write_tampered(missing_metadata)
    with pytest.raises(engine.StaticCnfEngineError):
        engine.validate_static_cnf_engine_output(output)

    extra_metadata = deepcopy(envelope)
    extra_metadata["semantic_profile"]["metadata"]["extra"] = False
    write_tampered(extra_metadata)
    with pytest.raises(engine.StaticCnfEngineError):
        engine.validate_static_cnf_engine_output(output)

    crossed_metadata = deepcopy(envelope)
    crossed_metadata["semantic_profile"]["metadata"]["profile_id"] = "crossed"
    write_tampered(crossed_metadata)
    with pytest.raises(engine.StaticCnfEngineError):
        engine.validate_static_cnf_engine_output(output)


def test_registered_run_seals_and_validates_execution_identity(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    registration = {
        "schema": "p97-cegar-wave-execution-registry/v1",
        "registry_revision": "static-cnf-v1",
        "registration": {
            "wave_kind": "STATIC_CNF",
            "adapter_id": STATIC_CNF_PIQD_ADAPTER,
            "adapter_schema": STATIC_CNF_PIQD_ADAPTER_SCHEMA,
            "registry_revision": "static-cnf-v1",
            "engine_schema": engine.ENGINE_SCHEMA,
            "semantic_validator": engine.STATIC_CNF_SEMANTIC_VALIDATOR,
            "execution_mode": "ONE_SHOT",
            "capabilities": ["STATIC_CNF"],
            "permits_campaign": False,
            "permits_export": False,
            "permits_diagnostic_mining": False,
            "permits_terminal_proof": False,
        },
    }
    wave_engine, output, _api, _factories = _make_engine(
        tmp_path,
        monkeypatch,
        "SAT",
        execution_registration=registration,
    )
    accepted = wave_engine.run(timeout_s=7, proof_path=None)

    assert accepted.envelope["execution_registry"] == registration
    assert engine.validate_static_cnf_engine_output(output) == accepted.envelope

    tampered = dict(accepted.envelope)
    crossed = json.loads(json.dumps(registration))
    crossed["registration"]["semantic_validator"] = "crossed"
    tampered["execution_registry"] = crossed
    unsigned = {
        key: value for key, value in tampered.items() if key != "envelope_sha256"
    }
    tampered["envelope_sha256"] = sha256_json(unsigned)
    output.write_bytes(canonical_json_bytes(tampered) + b"\n")
    with pytest.raises(engine.StaticCnfEngineError, match="crossed"):
        engine.validate_static_cnf_engine_output(output)


def test_run_rejects_response_loss_without_retry_or_publication(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    wave_engine, output, api, _factories = _make_engine(
        tmp_path, monkeypatch, "UNKNOWN"
    )
    runner_calls: list[tuple[Path, int, None]] = []

    def response_loss(**kwargs):
        kwargs.pop("transport", None)
        runner = make_static_piqd_solver_runner(
            **kwargs, transport=api, sleep=lambda _seconds: None
        )

        def invoke(cnf_path: Path, timeout_s: int, proof_path: None):
            runner_calls.append((cnf_path, timeout_s, proof_path))
            result = runner(cnf_path, timeout_s, proof_path)
            return StaticSolverResult(
                result.verdict,
                dict(result.assignment),
                result.returncode,
                "",
                result.stderr,
            )

        return invoke

    monkeypatch.setattr(engine, "make_static_piqd_solver_runner", response_loss)
    with pytest.raises(engine.StaticCnfEngineError, match="receipt"):
        wave_engine.run(proof_path=None)
    assert len(runner_calls) == 1
    assert not output.exists()


def test_run_rejects_post_write_normal_parent_rebind_without_accepting_foreign_copy(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    wave_engine, output, _api, _factories = _make_engine(tmp_path, monkeypatch, "SAT")
    parent = output.parent
    original_write = engine._write_once_at
    foreign: list[bytes] = []

    def write_then_rebind(parent_fd: int, name: str, raw: bytes):
        identity = original_write(parent_fd, name, raw)
        foreign.append(raw)
        held = tmp_path / "published-held"
        parent.rename(held)
        parent.mkdir()
        (parent / name).write_bytes(raw)
        return identity

    monkeypatch.setattr(engine, "_write_once_at", write_then_rebind)
    with pytest.raises(engine.StaticCnfEngineError, match="parent changed"):
        wave_engine.run(proof_path=None)
    assert foreign
    assert (parent / output.name).read_bytes() == foreign[0]
    assert (tmp_path / "published-held" / output.name).is_file()


def test_run_runner_baseexception_is_one_call_and_closes_output_descriptor(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    wave_engine, output, _api, _factories = _make_engine(tmp_path, monkeypatch, "SAT")
    runner_calls: list[tuple[Path, int, None]] = []
    opened: list[int] = []

    class Fatal(BaseException):
        pass

    def fatal_factory(**_kwargs):
        def invoke(cnf_path: Path, timeout_s: int, proof_path: None):
            runner_calls.append((cnf_path, timeout_s, proof_path))
            raise Fatal()

        return invoke

    original_open = engine._open_directory_chain

    def tracked_open(path: Path, *, label: str) -> int:
        descriptor = original_open(path, label=label)
        opened.append(descriptor)
        return descriptor

    monkeypatch.setattr(engine, "make_static_piqd_solver_runner", fatal_factory)
    monkeypatch.setattr(engine, "_open_directory_chain", tracked_open)
    with pytest.raises(Fatal):
        wave_engine.run(proof_path=None)
    assert len(runner_calls) == 1
    assert runner_calls[0][2] is None
    assert not output.exists()
    assert opened
    for descriptor in opened:
        with pytest.raises(OSError):
            os.fstat(descriptor)


def test_run_rejects_crossed_receipt_path_and_preserves_sentinel(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    wave_engine, output, api, _factories = _make_engine(tmp_path, monkeypatch, "SAT")
    outside = tmp_path / "outside.json"
    outside.write_bytes(b"sentinel")

    def crossed(**kwargs):
        kwargs.pop("transport", None)
        runner = make_static_piqd_solver_runner(
            **kwargs, transport=api, sleep=lambda _seconds: None
        )

        def invoke(cnf_path: Path, timeout_s: int, proof_path: None):
            result = runner(cnf_path, timeout_s, proof_path)
            receipt = json.loads(result.stdout)
            receipt["custody_seal_path"] = str(outside)
            unsigned = {
                key: value for key, value in receipt.items() if key != "receipt_sha256"
            }
            receipt["receipt_sha256"] = sha256_json(unsigned)
            raw = canonical_json_bytes(receipt) + b"\n"
            Path(receipt["receipt_path"]).write_bytes(raw)
            return StaticSolverResult(
                result.verdict,
                dict(result.assignment),
                result.returncode,
                raw.decode(),
                result.stderr,
            )

        return invoke

    monkeypatch.setattr(engine, "make_static_piqd_solver_runner", crossed)
    with pytest.raises(engine.StaticCnfEngineError, match="cross"):
        wave_engine.run(proof_path=None)
    assert outside.read_bytes() == b"sentinel"
    assert not output.exists()


def test_run_seals_transport_failure_as_indeterminate_without_retry(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    wave_engine, output, api, factories = _make_engine(tmp_path, monkeypatch, "UNKNOWN")
    api.fail_first = True

    accepted = wave_engine.run(proof_path=None)

    assert accepted.classification == engine.INDETERMINATE
    assert output.is_file()
    assert len(factories) == 1


def test_output_parent_is_held_across_rebind_and_never_mkdirs(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    control, package_root, _cnf, _producer = _fixture_control(tmp_path)
    journal_root = tmp_path / "journals"
    journal_root.mkdir()
    parent = tmp_path / "published"
    parent.mkdir()
    output = parent / "engine.json"
    outside = tmp_path / "outside"
    outside.mkdir()
    sentinel = outside / "sentinel"
    sentinel.write_bytes(b"protected")
    api = _FakePiqd(b"", b"", "UNKNOWN")
    rebound = False

    def rebind(**kwargs):
        nonlocal rebound
        if not rebound:
            rebound = True
            moved = tmp_path / "published-held"
            parent.rename(moved)
            parent.symlink_to(outside, target_is_directory=True)
        kwargs.pop("transport", None)
        return make_static_piqd_solver_runner(
            **kwargs, transport=api, sleep=lambda _seconds: None
        )

    monkeypatch.setattr(engine, "make_static_piqd_solver_runner", rebind)
    wave_engine = engine.StaticCnfWaveEngine(
        control=control,
        package_root=package_root,
        output_path=output,
        base_url="http://piqd.fixture",
        journal_root=journal_root,
    )
    with pytest.raises((engine.StaticCnfEngineError, StaticPiqdRunnerError, OSError)):
        wave_engine.run(proof_path=None)
    assert sentinel.read_bytes() == b"protected"
    assert not output.exists()
    assert not (outside / "engine.json").exists()


def test_exact_native_paths_and_baseexception_cleanup(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    control, package_root, _cnf, _producer = _fixture_control(tmp_path)
    parent = tmp_path / "published"
    parent.mkdir()
    journal_root = tmp_path / "journals"
    journal_root.mkdir()

    class HostilePath(type(Path())):
        pass

    with pytest.raises(engine.StaticCnfEngineError, match="native"):
        engine.StaticCnfWaveEngine(
            control=control,
            package_root=HostilePath(package_root),
            output_path=parent / "engine.json",
            base_url="http://fixture",
            journal_root=journal_root,
        )
    with pytest.raises(engine.StaticCnfEngineError, match="must be absolute"):
        engine.StaticCnfWaveEngine(
            control=control,
            package_root=Path("relative-package"),
            output_path=parent / "engine.json",
            base_url="http://fixture",
            journal_root=journal_root,
        )
    with pytest.raises(engine.StaticCnfEngineError, match="nonempty"):
        engine.StaticCnfWaveEngine(
            control=control,
            package_root=package_root,
            output_path=parent / "engine.json",
            base_url=" ",
            journal_root=journal_root,
        )

    descriptor = engine._open_directory_chain(parent, label="test")

    class Fatal(BaseException):
        pass

    original_write = os.write

    def fail_write(_fd: int, _data: object) -> int:
        raise Fatal()

    monkeypatch.setattr(os, "write", fail_write)
    try:
        with pytest.raises(Fatal):
            engine._write_once_at(descriptor, "engine.json", b"{}")
    finally:
        monkeypatch.setattr(os, "write", original_write)
        os.close(descriptor)
    assert not (parent / "engine.json").exists()


def test_missing_output_parent_is_not_created(tmp_path: Path) -> None:
    control, package_root, _cnf, _producer = _fixture_control(tmp_path)
    missing = tmp_path / "not-created" / "engine.json"
    with pytest.raises(engine.StaticCnfEngineError, match="hold output"):
        engine.StaticCnfWaveEngine(
            control=control,
            package_root=package_root,
            output_path=missing,
            base_url="http://fixture",
            journal_root=tmp_path / "journals",
        ).run(proof_path=None)
    assert not missing.parent.exists()
