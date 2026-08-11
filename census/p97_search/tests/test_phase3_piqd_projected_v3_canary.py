from __future__ import annotations

import hashlib
import importlib.util
import json
import os
import sys
from pathlib import Path
from types import ModuleType
from typing import Any

import pytest

from census.p97_search import phase3_piqd_incremental_v3 as incremental_v3
from census.p97_search import phase3_piqd_projected_v3_qualification as qualification
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    PreparedJob,
    raw_dimacs_identity,
)

REPOSITORY_ROOT = Path(__file__).resolve().parents[3]
LAUNCHER_PATH = REPOSITORY_ROOT / "scripts/run-p97-piqd-projected-v3-canary.py"
JOB_ID = "12345678-1234-4234-8234-123456789abc"
DESCRIPTOR_ROOT = "2" * 64
TEST_BASE = b"p cnf 1194 1\n-91 0\n"
TEST_CURRENT = b"p cnf 1194 2\n-91 0\n1 0\n"


def _load_launcher() -> ModuleType:
    spec = importlib.util.spec_from_file_location(
        "p97_projected_v3_canary", LAUNCHER_PATH
    )
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


canary = _load_launcher()


def _config(tmp_path: Path) -> Any:
    return canary.CanaryConfig(
        repository_root=REPOSITORY_ROOT,
        historical_shard_root=tmp_path / "historical",
        historical_projector=tmp_path / "projector.py",
        historical_prefix_bank=tmp_path / "prefix.py",
        historical_sat_generate=tmp_path / "sat_generate.py",
        output_dir=tmp_path / "qualification",
    )


def _authenticated(config: Any) -> Any:
    return canary.AuthenticatedInputs(
        base_path=config.historical_shard_root / "base.cnf",
        current_path=config.historical_shard_root / ".solver.cnf",
        base=TEST_BASE,
        current=TEST_CURRENT,
        historical_sources={
            path: config.historical_projector
            for path in qualification.PRODUCTION_SOURCE_BUNDLE
        },
    )


class Harness:
    def __init__(
        self,
        config: Any,
        *,
        existing: bool = False,
        first_verdict: str = "SAT",
        close_error: bool = False,
        assignment: dict[int, bool] | None = None,
        never_complete: bool = False,
    ) -> None:
        self.config = config
        self.existing = existing
        self.first_verdict = first_verdict
        self.close_error = close_error
        self.assignment = assignment or {
            variable: variable != 91
            for variable in range(1, qualification.PRODUCTION_VARIABLES + 1)
        }
        self.never_complete = never_complete
        self.status_calls = 0
        self.calls: list[str] = []
        self.contract: Any | None = None

    def authenticate(self, config: Any) -> Any:
        assert config is self.config
        self.calls.append("authenticate")
        return _authenticated(config)

    def http_transport(
        self,
        _method: str,
        _url: str,
        _body: Any,
        _headers: Any,
    ) -> HttpResponse:
        raise AssertionError("the injected offline clients must not use HTTP")

    def client_factory(self, base_url: str, **kwargs: Any) -> Any:
        self.calls.append("client")
        assert base_url == canary.DEFAULT_DAEMON_URL
        assert kwargs["segmented_multipart"] is True
        assert isinstance(kwargs["transport"], canary.DaemonTransport)
        harness = self

        class Client:
            def prepare_cnf(self, **prepare_kwargs: Any) -> PreparedJob:
                harness.calls.append("prepare_cnf")
                assert prepare_kwargs["wave_manifest"] == canary.WAVE_MANIFEST
                assert prepare_kwargs["cnf"] == TEST_BASE
                assert (
                    prepare_kwargs["producer_manifest"]
                    == canary.PRODUCER_MANIFEST_BYTES
                )
                assert prepare_kwargs["requested_core_limit"] == 1
                return PreparedJob(
                    JOB_ID,
                    "cadical",
                    "sat",
                    qualification.PRODUCTION_BASE_SHA256,
                    qualification.PRODUCTION_RAW_DIMACS_IDENTITY,
                    qualification.PRODUCTION_VARIABLES,
                    qualification.PRODUCTION_BASE_CLAUSES,
                    harness.existing,
                    1,
                )

            def verify_stored_cnf(self, job: PreparedJob, expected_cnf: bytes) -> str:
                harness.calls.append("verify")
                assert job.job_id == JOB_ID and expected_cnf == TEST_BASE
                return qualification.PRODUCTION_BASE_SHA256

            def confirm(self, job: PreparedJob, *, expected_cnf: bytes) -> str:
                harness.calls.append("confirm")
                assert job.job_id == JOB_ID and expected_cnf == TEST_BASE
                return "confirmed"

            def status(self, job_id: str) -> dict[str, Any]:
                harness.calls.append("status")
                assert job_id == JOB_ID
                harness.status_calls += 1
                state = (
                    "running"
                    if harness.never_complete or harness.status_calls == 1
                    else "completed"
                )
                return {
                    "id": JOB_ID,
                    "status": state,
                    "result": "SAT" if state == "completed" else None,
                }

        return Client()

    def prepare(self, **kwargs: Any) -> Any:
        self.calls.append("prepare_qualification")
        assert kwargs["repository_commit"] == qualification.PRODUCTION_REPOSITORY_COMMIT
        assert kwargs["producer_job"].job_id == JOB_ID
        assert kwargs["solver_name"] == canary.SOLVER_NAME
        assert kwargs["source_manifest"] == canary.SOURCE_MANIFEST_BYTES
        assert kwargs["producer_manifest"] == canary.PRODUCER_MANIFEST_BYTES
        root = kwargs["output_dir"]
        os.mkdir(root, 0o700)
        (root / "base.cnf").write_bytes(TEST_BASE)
        (root / ".solver.cnf").write_bytes(TEST_CURRENT)
        os.chmod(root / "base.cnf", 0o600)
        os.chmod(root / ".solver.cnf", 0o600)
        qualified_transport = qualification.QualificationTransport(
            self.http_transport,
            root=root,
            solver_name=canary.SOLVER_NAME,
            solver_sha256="1" * 64,
            solver_signature="test-signature",
            descriptor_root=DESCRIPTOR_ROOT,
        )
        self.contract = qualification.QualificationContract(
            directory=root,
            solver_name=canary.SOLVER_NAME,
            solver_sha256="1" * 64,
            solver_signature="test-signature",
            identity_evidence_path=root / qualification.IDENTITY_NAME,
            transport=qualified_transport,
            production=True,
            _source_inputs=(),
            _base_input_path=kwargs["base_cnf_path"],
            _current_input_path=kwargs["current_cnf_path"],
            _base_sha256=qualification.PRODUCTION_BASE_SHA256,
            _current_sha256=qualification.PRODUCTION_CURRENT_SHA256,
        )
        return self.contract

    def runner_factory(self, **kwargs: Any) -> Any:
        self.calls.append("runner_factory")
        assert self.contract is not None
        assert kwargs["custody_root"] == self.contract.directory
        assert kwargs["producer_job_id"] == JOB_ID
        assert kwargs["expected_solver_sha256"] == self.contract.solver_sha256
        assert kwargs["expected_solver_signature"] == self.contract.solver_signature
        assert kwargs["transport"] is self.contract.transport
        harness = self

        class Runner:
            solves = 0

            def __call__(
                self, cnf_path: Path, timeout_s: int, proof_path: Path | None
            ) -> incremental_v3.LegacyDiscoveryResult:
                self.solves += 1
                harness.calls.append(f"solve-{self.solves}")
                assert timeout_s == canary.TIMEOUT_SECONDS and proof_path is None
                payload = cnf_path.read_bytes()
                if self.solves == 1:
                    assert payload == TEST_CURRENT
                    return incremental_v3.LegacyDiscoveryResult(
                        harness.first_verdict,
                        harness.assignment if harness.first_verdict == "SAT" else {},
                        10 if harness.first_verdict == "SAT" else 0,
                    )
                assert payload == b"p cnf 1194 3\n-91 0\n1 0\n91 0\n"
                variables, clauses = canary.incremental.parse_dimacs(payload)
                assert variables == qualification.PRODUCTION_VARIABLES
                assert clauses[-1] == qualification.PRODUCTION_CANARY_CLAUSE
                return incremental_v3.LegacyDiscoveryResult("UNSAT", {}, 20)

            def close(self) -> None:
                harness.calls.append("close")
                if harness.close_error:
                    raise canary.CanaryError("synthetic close failure")

        return Runner()

    def finalize(self, contract: Any) -> dict[str, Any]:
        self.calls.append("finalize")
        assert contract is self.contract
        return {"schema": qualification.SCHEMA, "sealed": True}

    def validate(self, directory: Path) -> dict[str, Any]:
        self.calls.append("validate")
        assert self.contract is not None and directory == self.contract.directory
        return {"schema": qualification.SCHEMA, "valid": True}

    def run(self) -> dict[str, Any]:
        return canary.run_canary(
            self.config,
            http_transport=self.http_transport,
            authenticate=self.authenticate,
            client_factory=self.client_factory,
            prepare=self.prepare,
            runner_factory=self.runner_factory,
            finalize=self.finalize,
            validate=self.validate,
            sleep=lambda seconds: self.calls.append(f"sleep-{seconds:g}"),
        )


def test_embedded_canonical_artifacts_match_live_harness_hashes() -> None:
    assert canary.SOLVER_NAME == "piqd-satworker-cadical-3.0.0"
    assert (
        qualification.PRODUCTION_SOLVER_SHA256
        == "0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965"
    )
    assert qualification.PRODUCTION_SOLVER_SIGNATURE == "cadical-3.0.0"
    expected = {
        "SOURCE_MANIFEST_BYTES": (
            631,
            "986e1204d820061c5173604ec5ced25beed6a3e94ea69935283ee8a1e9ba8628",
        ),
        "PRODUCER_MANIFEST_BYTES": (
            1203,
            "74ddf30ef786b9102b34fda4ecf6ed48ea1334ce877a063f54dfaa238197cded",
        ),
        "VARIABLE_MAP_BYTES": (
            802,
            "e5f7801c91152dd27a201c7014ae801b8036551e770092ae9419f03321c81802",
        ),
        "VARIABLE_MAP_DESCRIPTOR_BYTES": (
            224,
            "fd59dcaa0f2dabb93504050ff1544d8463c0633de5f67427213d38c9c9eca854",
        ),
        "WAVE_MANIFEST_BYTES": (
            1205,
            "abdf66bb69b726a4d75870d0c8ea442bb17a6cc4b5cb3b34761a7ec07a10ba00",
        ),
    }
    for name, (length, digest) in expected.items():
        payload = getattr(canary, name)
        assert len(payload) == length
        assert hashlib.sha256(payload).hexdigest() == digest
    assert canary.VARIABLE_MAP[0] == [0, 1, 1]
    assert canary.VARIABLE_MAP[-1] == [9, 8, 90]
    assert (
        raw_dimacs_identity(
            backend="cadical",
            solver_profile="sat",
            cnf_sha256=qualification.PRODUCTION_BASE_SHA256,
            producer_manifest_sha256=qualification.PRODUCTION_PRODUCER_MANIFEST_SHA256,
            requested_core_limit=1,
        )
        == qualification.PRODUCTION_RAW_DIMACS_IDENTITY
    )


def test_canary_exact_call_order_and_terminal_frontier(tmp_path: Path) -> None:
    harness = Harness(_config(tmp_path))
    result = harness.run()
    assert harness.calls == [
        "authenticate",
        "client",
        "prepare_cnf",
        "verify",
        "confirm",
        "status",
        "sleep-5",
        "status",
        "prepare_qualification",
        "runner_factory",
        "solve-1",
        "solve-2",
        "close",
        "finalize",
        "validate",
    ]
    assert result["status"] == "qualified"
    assert result["producer_job_existing"] is False
    assert result["producer_job_custody"] == "fresh"
    assert result["proof_verified"] is False
    assert result["local_drat_required"] is True


def test_canary_accepts_authenticated_reused_producer_job(tmp_path: Path) -> None:
    config = _config(tmp_path)
    harness = Harness(config, existing=True)
    result = harness.run()
    assert result["producer_job_existing"] is True
    assert result["producer_job_custody"] == "reused"
    assert "verify" in harness.calls
    assert harness.calls.index("verify") < harness.calls.index("prepare_qualification")


def test_canary_rejects_non_bool_existing_before_custody(tmp_path: Path) -> None:
    config = _config(tmp_path)
    harness = Harness(config, existing=1)  # type: ignore[arg-type]
    with pytest.raises(canary.CanaryError, match="builtin bool"):
        harness.run()
    assert harness.calls == ["authenticate", "client", "prepare_cnf"]
    assert not config.output_dir.exists()


def test_canary_waits_for_completed_producer_attestation_and_is_bounded(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(canary, "PRODUCER_STATUS_POLLS", 2)
    config = _config(tmp_path)
    harness = Harness(config, never_complete=True)
    with pytest.raises(canary.CanaryError, match="bounded poll"):
        harness.run()
    assert harness.calls[-3:] == ["status", "sleep-5", "status"]
    assert "prepare_qualification" not in harness.calls
    assert not config.output_dir.exists()


def test_unknown_preserves_artifacts_and_closes_without_finalize(
    tmp_path: Path,
) -> None:
    config = _config(tmp_path)
    harness = Harness(config, first_verdict="UNKNOWN")
    with pytest.raises(
        canary.CanaryError, match="historical frontier returned UNKNOWN"
    ):
        harness.run()
    assert harness.calls[-2:] == ["solve-1", "close"]
    assert "finalize" not in harness.calls and "validate" not in harness.calls
    assert config.output_dir.exists()
    assert (config.output_dir / ".solver.cnf").read_bytes() == TEST_CURRENT


def test_nonmodel_sat_closes_without_extending_or_finalizing(tmp_path: Path) -> None:
    config = _config(tmp_path)
    harness = Harness(config, assignment={1: True})
    with pytest.raises(canary.CanaryError, match="not one total model"):
        harness.run()
    assert harness.calls[-2:] == ["solve-1", "close"]
    assert "solve-2" not in harness.calls and "finalize" not in harness.calls
    assert (config.output_dir / ".solver.cnf").read_bytes() == TEST_CURRENT


def test_close_failure_is_close_once_and_blocks_finalization(tmp_path: Path) -> None:
    config = _config(tmp_path)
    harness = Harness(config, close_error=True)
    with pytest.raises(canary.CanaryError, match="synthetic close failure"):
        harness.run()
    assert harness.calls.count("close") == 1
    assert "finalize" not in harness.calls and "validate" not in harness.calls
    terminal = (config.output_dir / ".solver.cnf").read_bytes()
    assert canary.incremental.parse_dimacs(terminal)[1][-1] == (91,)


def test_daemon_transport_origin_pins_relative_and_absolute_urls() -> None:
    calls: list[tuple[str, str]] = []

    def inner(method: str, url: str, _body: Any, _headers: Any) -> HttpResponse:
        calls.append((method, url))
        return HttpResponse(200, b"{}", {})

    transport = canary.DaemonTransport("http://127.0.0.1:7272/", inner)
    assert transport("GET", "/version", None, {}).status == 200
    assert transport("POST", "http://127.0.0.1:7272/sessions", b"{}", {}).status == 200
    with pytest.raises(canary.CanaryError, match="escaped"):
        transport("GET", "http://127.0.0.1:7273/version", None, {})
    assert calls == [
        ("GET", "http://127.0.0.1:7272/version"),
        ("POST", "http://127.0.0.1:7272/sessions"),
    ]


def test_main_returns_two_only_for_expected_adapter_error(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    def fail(_config: Any) -> dict[str, Any]:
        raise canary.CanaryError("expected adapter failure")

    monkeypatch.setattr(canary, "run_canary", fail)
    arguments = [
        "--repo-root",
        str(REPOSITORY_ROOT),
        "--historical-shard-root",
        str(tmp_path / "historical"),
        "--historical-projector",
        str(tmp_path / "projector.py"),
        "--historical-prefix-bank",
        str(tmp_path / "prefix.py"),
        "--historical-sat-generate",
        str(tmp_path / "sat_generate.py"),
        "--output-dir",
        str(tmp_path / "qualification"),
    ]
    assert canary.main(arguments) == 2
    output = json.loads(capsys.readouterr().out)
    assert output["status"] == "error"
    assert output["artifacts_preserved"] is False

    Path(arguments[-1]).mkdir()
    assert canary.main(arguments) == 2
    output = json.loads(capsys.readouterr().out)
    assert output["artifacts_preserved"] is True

    def crash(_config: Any) -> dict[str, Any]:
        raise RuntimeError("unexpected implementation failure")

    monkeypatch.setattr(canary, "run_canary", crash)
    with pytest.raises(RuntimeError, match="unexpected implementation failure"):
        canary.main(arguments)
