from __future__ import annotations

import json
import os
from pathlib import Path

import pytest

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
    STATIC_CNF,
    STATIC_CNF_PIQD_ADAPTER,
    STATIC_CNF_PIQD_ADAPTER_SCHEMA,
    STATIC_CNF_SEMANTIC_VALIDATOR,
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


def _make_engine(tmp_path: Path, monkeypatch: pytest.MonkeyPatch, verdict: str):
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
        ),
        output,
        api,
        calls,
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
    assert output.is_file()
    # The public validator must not consume or mutate the returned envelope.
    before = dict(accepted.envelope)
    checked = engine.validate_static_cnf_engine_output(output)
    assert accepted.envelope == before
    assert checked == before
    assert api.calls


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
