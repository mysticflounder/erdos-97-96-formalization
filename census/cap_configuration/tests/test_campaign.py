from __future__ import annotations

import os
import socket
import subprocess
import sys
import threading
import uuid
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import pytest

import census.cap_configuration.campaign as campaign_module
from census.cap_configuration.campaign import (
    AUTHORIZATION_CONSUMPTION_SCHEMA,
    AUTHORIZATION_SCHEMA,
    RESOURCE_ATTESTATION_SCHEMA,
    CapConfigurationCampaignError,
    _load_if_present,
    _open_repo,
    _publish_exact,
    build_wave_authorization,
    campaign_status,
    plan_campaign,
    run_campaign,
)
from census.cap_configuration.schema import (
    canonical_json_bytes,
    parse_stored_json_bytes,
    raw_sha256,
    stored_json_bytes,
    structured_hash,
)
from census.cap_configuration.universe import build_fixture_bundle
from census.cap_configuration.validate import validate_campaign

HEAD = "a" * 40
PLAN_TIME = "2026-08-27T04:00:00Z"
LATER_TIME = "2026-08-27T04:05:00Z"
LANE = "cap-fixture-test"


@dataclass(frozen=True)
class PreparedFixture:
    repo: Path
    manifest_path: str
    authorization_path: str
    run_root: str
    plan: dict[str, Any]


def _write(repo: Path, relative: str, payload: bytes) -> None:
    path = repo / relative
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(payload)


def _checkpoint(repo: Path, run_root: str) -> tuple[str, dict[str, Any]]:
    path = f".codex/worktree-checkpoints/{LANE}.json"
    body = {
        "base_head": HEAD,
        "created_utc": PLAN_TIME,
        "durable_paths": [],
        "generated_roots": [run_root],
        "lane_id": LANE,
        "owned_paths": [path],
        "owner": "FixtureOperator",
        "schema": "worktree-lane-checkpoint/v1",
    }
    value = {**body, "manifest_sha256": raw_sha256(canonical_json_bytes(body))}
    _write(repo, path, stored_json_bytes(value))
    return path, value


def prepare_fixture(tmp_path: Path, *, run_id: str = "run-001") -> PreparedFixture:
    repo = tmp_path / "repo"
    repo.mkdir()
    source_payloads = {
        "census/cap_configuration/symmetry.py": b"fixture symmetry source\n",
        "census/cap_configuration/universe.py": b"fixture universe source\n",
        "census/cap_configuration/validate.py": b"fixture validator source\n",
    }
    for path, payload in source_payloads.items():
        _write(repo, path, payload)
    generator = [
        {"path": path, "raw_sha256": raw_sha256(source_payloads[path])}
        for path in (
            "census/cap_configuration/symmetry.py",
            "census/cap_configuration/universe.py",
        )
    ]
    validator = [
        {"path": path, "raw_sha256": raw_sha256(source_payloads[path])}
        for path in (
            "census/cap_configuration/universe.py",
            "census/cap_configuration/validate.py",
        )
    ]
    bundle = build_fixture_bundle(
        repository_revision=HEAD,
        generator_source_manifest=generator,
        validator_source_manifest=validator,
        publication={"created_utc": PLAN_TIME, "metadata": {"operator": "test"}},
    )
    manifest_path = "inputs/cap/manifest.json"
    for logical, payload in bundle.stored_files().items():
        _write(repo, f"inputs/cap/{logical}", payload)

    run_root = f"scratch/runs/{LANE}/{run_id}"
    checkpoint_path, checkpoint = _checkpoint(repo, run_root)
    active_plan_path = "docs/plans/fixture-active.md"
    supervisor_path = "controls/fixture-supervisor.json"
    telemetry_path = "controls/fixture-telemetry.json"
    _write(repo, active_plan_path, b"fixture-only active plan\n")
    _write(repo, supervisor_path, b'{"fixture_only":true}\n')
    _write(repo, telemetry_path, b'{"sink":"test-memory"}\n')
    piqd = {
        "daemon_identity": "fake-daemon/v1",
        "profile": "none",
        "profile_identity": "fake-profile/v1",
        "solver": "none",
        "solver_identity": "producer-neutral-offline-fixture/v1",
    }
    resources = {
        "cpu_seconds": 0,
        "disk_bytes": 1_000_000,
        "max_processes": 1,
        "memory_bytes": 0,
        "supervisor_config_path": supervisor_path,
        "supervisor_config_raw_sha256": raw_sha256(
            (repo / supervisor_path).read_bytes()
        ),
        "supervisor_identity": "fixture-one-process-boundary/v1",
        "supervisor_qualified": False,
        "telemetry_identity": "fixture-memory-telemetry/v1",
        "telemetry_policy_path": telemetry_path,
        "telemetry_policy_raw_sha256": raw_sha256((repo / telemetry_path).read_bytes()),
        "tier": "fixture",
        "wall_seconds": 0,
    }
    authorization = build_wave_authorization(
        manifest=bundle.manifest,
        run_root=run_root,
        run_kind="fixture_canary",
        active_plan={
            "path": active_plan_path,
            "raw_sha256": raw_sha256((repo / active_plan_path).read_bytes()),
        },
        authorizing_checkpoint={
            "base_head": checkpoint["base_head"],
            "path": checkpoint_path,
            "raw_sha256": raw_sha256((repo / checkpoint_path).read_bytes()),
        },
        piqd=piqd,
        resource_envelope=resources,
        issued_utc="2026-08-27T03:00:00Z",
        expires_utc="2026-08-28T03:00:00Z",
        issuer="FixtureAuthority",
    )
    authorization_path = "inputs/fixture-authorization.json"
    _write(repo, authorization_path, stored_json_bytes(authorization))
    plan = plan_campaign(
        manifest_path,
        run_root,
        authorization_path,
        repo_root=repo,
        now_utc=PLAN_TIME,
        observed_head=HEAD,
    )
    return PreparedFixture(repo, manifest_path, authorization_path, run_root, plan)


def fake_attestor(
    *, plan: dict[str, Any], base_url: str, transport: object
) -> dict[str, Any]:
    assert base_url == "memory://piqd"
    assert transport is not None
    resources = plan["resource_envelope"]
    return {
        "observed_piqd": plan["piqd"],
        "production_memory_ceiling_claimed": False,
        "resource_envelope": resources,
        "schema": RESOURCE_ATTESTATION_SCHEMA,
        "status": "PASSED",
        "supervisor_config_raw_sha256": resources["supervisor_config_raw_sha256"],
        "supervisor_identity": resources["supervisor_identity"],
        "telemetry_identity": resources["telemetry_identity"],
        "telemetry_policy_raw_sha256": resources["telemetry_policy_raw_sha256"],
    }


class FakeAdapter:
    def __init__(self) -> None:
        self.calls: list[tuple[str, str, str | None]] = []

    def __call__(self, **kwargs: Any) -> dict[str, Any]:
        cell = parse_stored_json_bytes(kwargs["cell_bytes"])
        control = cell["metric_choices"]["control"]
        self.calls.append(
            (cell["cell_id"], kwargs["request_id"], kwargs["resume_policy"])
        )
        session_id = str(
            uuid.uuid5(uuid.NAMESPACE_URL, f"cap-fixture-session/{cell['cell_id']}")
        )
        if control == "SAT":
            return {
                "classification": "SAT_SEMANTICALLY_REPLAYED",
                "session_id": session_id,
                "values": "((x 0) (y 1))",
            }
        if control == "UNSAT":
            return {
                "classification": "UNSAT_DISCOVERY_ONLY",
                "session_id": session_id,
            }
        return {
            "classification": "INCONCLUSIVE_UNKNOWN",
            "session_id": session_id,
        }


class ReusingSessionAdapter(FakeAdapter):
    def __init__(self) -> None:
        super().__init__()
        self.first_session_id: str | None = None
        self.reuse_retained_session = False

    def __call__(self, **kwargs: Any) -> dict[str, Any]:
        result = super().__call__(**kwargs)
        session_id = result["session_id"]
        assert isinstance(session_id, str)
        if self.first_session_id is None:
            self.first_session_id = session_id
        elif self.reuse_retained_session:
            assert self.first_session_id in kwargs["used_session_ids"]
            result["session_id"] = self.first_session_id
        return result


def execute_fixture(
    prepared: PreparedFixture,
    adapter: FakeAdapter,
    *,
    now_utc: str = PLAN_TIME,
    crash_after: str | None = None,
) -> dict[str, Any]:
    return run_campaign(
        prepared.manifest_path,
        prepared.run_root,
        prepared.authorization_path,
        "memory://piqd",
        repo_root=prepared.repo,
        transport=object(),
        adapter=adapter,
        resource_attestor=fake_attestor,
        now_utc=now_utc,
        crash_after=crash_after,
    )


def test_plan_is_zero_network_and_publishes_governed_run_manifest(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    def forbidden_socket(*args: object, **kwargs: object) -> None:
        raise AssertionError("plan attempted network access")

    monkeypatch.setattr(socket, "socket", forbidden_socket)
    prepared = prepare_fixture(tmp_path)
    run_manifest = parse_stored_json_bytes(
        (prepared.repo / prepared.run_root / "run_manifest.json").read_bytes()
    )
    assert run_manifest["schema"] == "worktree-run-manifest/v1"
    assert run_manifest["root"] == prepared.run_root
    assert run_manifest["base_head"] == HEAD
    assert prepared.plan["universe"] == {
        "canonical_cell_count": 3,
        "orbit_count": 3,
        "orbit_ledger_sha256": prepared.plan["universe"]["orbit_ledger_sha256"],
        "raw_cell_count": 6,
    }


@pytest.mark.parametrize("attack", ["symlink", "hardlink"])
def test_plan_rejects_linked_manifest(tmp_path: Path, attack: str) -> None:
    prepared = prepare_fixture(tmp_path, run_id="seed")
    attacked_run = f"scratch/runs/{LANE}/attacked"
    checkpoint_path = prepared.repo / f".codex/worktree-checkpoints/{LANE}.json"
    checkpoint = parse_stored_json_bytes(checkpoint_path.read_bytes())
    checkpoint["generated_roots"].append(attacked_run)
    unsigned = {
        key: value for key, value in checkpoint.items() if key != "manifest_sha256"
    }
    checkpoint["manifest_sha256"] = raw_sha256(canonical_json_bytes(unsigned))
    checkpoint_path.write_bytes(stored_json_bytes(checkpoint))
    original = prepared.repo / prepared.manifest_path
    attacked = prepared.repo / "inputs/attacked-manifest.json"
    if attack == "symlink":
        attacked.symlink_to(original)
    else:
        os.link(original, attacked)
    with pytest.raises(
        CapConfigurationCampaignError, match="unique regular file|cannot safely read"
    ):
        plan_campaign(
            "inputs/attacked-manifest.json",
            attacked_run,
            prepared.authorization_path,
            repo_root=prepared.repo,
            now_utc=PLAN_TIME,
            observed_head=HEAD,
        )


def test_atomic_publication_never_exposes_partial_final_name(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    root = tmp_path / "atomic"
    root.mkdir()
    root_fd = _open_repo(root)
    started = threading.Event()
    release = threading.Event()
    original = campaign_module._write_all

    def slow_write(descriptor: int, payload: bytes) -> None:
        midpoint = len(payload) // 2
        original(descriptor, payload[:midpoint])
        started.set()
        assert release.wait(timeout=5)
        original(descriptor, payload[midpoint:])

    monkeypatch.setattr(campaign_module, "_write_all", slow_write)
    error: list[Exception] = []

    def publish() -> None:
        try:
            _publish_exact(root_fd, "record.json", b"0123456789")
        except Exception as exc:  # noqa: BLE001 - surface thread failure
            error.append(exc)

    thread = threading.Thread(target=publish)
    thread.start()
    assert started.wait(timeout=5)
    assert not (root / "record.json").exists()
    assert _load_if_present(root_fd, "record.json") is None
    release.set()
    thread.join(timeout=5)
    os.close(root_fd)
    assert not error
    assert (root / "record.json").read_bytes() == b"0123456789"


def test_source_snapshot_uses_first_authenticated_read_without_reopen(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    calls: dict[str, int] = {}
    original = campaign_module._read_regular_at

    def counted(root_fd: int, relative: str, **kwargs: Any):
        calls[relative] = calls.get(relative, 0) + 1
        return original(root_fd, relative, **kwargs)

    monkeypatch.setattr(campaign_module, "_read_regular_at", counted)
    prepared = prepare_fixture(tmp_path)
    for path in (
        "census/cap_configuration/symmetry.py",
        "census/cap_configuration/universe.py",
        "census/cap_configuration/validate.py",
    ):
        assert calls[path] == 1
        retained = prepared.repo / prepared.run_root / "artifacts/snapshots/repo" / path
        assert retained.read_bytes() == (prepared.repo / path).read_bytes()


def test_conflicting_duplicate_authorization_reference_is_rejected(
    tmp_path: Path,
) -> None:
    prepared = prepare_fixture(tmp_path, run_id="seed")
    attacked_run = f"scratch/runs/{LANE}/conflict"
    checkpoint_path = prepared.repo / f".codex/worktree-checkpoints/{LANE}.json"
    checkpoint = parse_stored_json_bytes(checkpoint_path.read_bytes())
    checkpoint["generated_roots"].append(attacked_run)
    unsigned_checkpoint = {
        key: value for key, value in checkpoint.items() if key != "manifest_sha256"
    }
    checkpoint["manifest_sha256"] = raw_sha256(
        canonical_json_bytes(unsigned_checkpoint)
    )
    checkpoint_path.write_bytes(stored_json_bytes(checkpoint))
    authorization = parse_stored_json_bytes(
        (prepared.repo / prepared.authorization_path).read_bytes()
    )
    authorization["identity"]["run_root"] = attacked_run
    authorization["identity"]["authorizing_checkpoint"]["raw_sha256"] = raw_sha256(
        checkpoint_path.read_bytes()
    )
    authorization["identity"]["resource_envelope"]["supervisor_config_path"] = (
        authorization["identity"]["active_plan"]["path"]
    )
    body = {
        key: value
        for key, value in authorization.items()
        if key != "authorization_sha256"
    }
    authorization["authorization_sha256"] = structured_hash(AUTHORIZATION_SCHEMA, body)
    attacked_auth = "inputs/conflicting-authorization.json"
    _write(prepared.repo, attacked_auth, stored_json_bytes(authorization))
    with pytest.raises(CapConfigurationCampaignError, match="conflicting hashes"):
        plan_campaign(
            prepared.manifest_path,
            attacked_run,
            attacked_auth,
            repo_root=prepared.repo,
            now_utc=PLAN_TIME,
            observed_head=HEAD,
        )


@pytest.mark.parametrize("parent", [{"schema": "foreign"}, "parent", [], 1, True])
def test_fixture_authorization_rejects_non_null_parent(
    tmp_path: Path, parent: object
) -> None:
    prepared = prepare_fixture(tmp_path, run_id="parent")
    authorization = parse_stored_json_bytes(
        (prepared.repo / prepared.authorization_path).read_bytes()
    )
    authorization["identity"]["parent"] = parent
    body = {
        key: value
        for key, value in authorization.items()
        if key != "authorization_sha256"
    }
    authorization["authorization_sha256"] = structured_hash(AUTHORIZATION_SCHEMA, body)
    attacked_auth = "inputs/non-null-parent-authorization.json"
    _write(prepared.repo, attacked_auth, stored_json_bytes(authorization))
    with pytest.raises(CapConfigurationCampaignError, match="cannot carry a parent"):
        plan_campaign(
            prepared.manifest_path,
            prepared.run_root,
            attacked_auth,
            repo_root=prepared.repo,
            now_utc=PLAN_TIME,
            observed_head=HEAD,
        )


def test_crossed_retained_consumption_is_rejected_on_resume(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    execute_fixture(prepared, FakeAdapter())
    consumption_path = (
        prepared.repo / prepared.run_root / "events/authorization-consumption.json"
    )
    consumption = parse_stored_json_bytes(consumption_path.read_bytes())
    second_admission = next(
        path
        for path in (prepared.repo / prepared.run_root / "events/attempts").glob(
            "*/000000/admission.json"
        )
        if parse_stored_json_bytes(path.read_bytes())["identity"]["cell_id"]
        != prepared.plan["ordered_cell_ids"][0]
    )
    consumption["attempt_id"] = parse_stored_json_bytes(second_admission.read_bytes())[
        "attempt_id"
    ]
    body = {
        key: value
        for key, value in consumption.items()
        if key != "authorization_consumption_sha256"
    }
    consumption["authorization_consumption_sha256"] = structured_hash(
        AUTHORIZATION_CONSUMPTION_SCHEMA, body
    )
    consumption_path.write_bytes(stored_json_bytes(consumption))
    with pytest.raises(
        CapConfigurationCampaignError, match="authorization consumption"
    ):
        run_campaign(
            prepared.manifest_path,
            prepared.run_root,
            prepared.authorization_path,
            "memory://piqd",
            repo_root=prepared.repo,
            transport=object(),
            adapter=FakeAdapter(),
            resource_attestor=fake_attestor,
            now_utc=LATER_TIME,
        )


def test_fake_mixed_campaign_is_complete_and_idempotent(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    adapter = FakeAdapter()
    coverage = execute_fixture(prepared, adapter)
    assert coverage["coverage_status"] == "COMPLETE"
    assert coverage["classification_counts"] == {
        "INCONCLUSIVE_UNKNOWN": 1,
        "SAT_SEMANTICALLY_REPLAYED": 1,
        "UNSAT_DISCOVERY_ONLY": 1,
    }
    first_consumption = (
        prepared.repo / prepared.run_root / "events/authorization-consumption.json"
    ).read_bytes()
    second = execute_fixture(prepared, adapter, now_utc=LATER_TIME)
    assert second == coverage
    assert len(adapter.calls) == 3
    assert (
        prepared.repo / prepared.run_root / "events/authorization-consumption.json"
    ).read_bytes() == first_consumption


@pytest.mark.parametrize(
    "boundary",
    [
        "resource_attestation",
        "admission",
        "request_intent",
        "adapter_call",
        "adapter_result",
        "outcome",
        "cell_result",
        "coverage",
    ],
)
def test_crash_restart_uses_same_identity_and_later_clock(
    tmp_path: Path, boundary: str
) -> None:
    prepared = prepare_fixture(tmp_path)
    adapter = FakeAdapter()
    with pytest.raises(RuntimeError, match="injected crash"):
        execute_fixture(prepared, adapter, crash_after=boundary)
    coverage = execute_fixture(prepared, adapter, now_utc=LATER_TIME)
    assert coverage["coverage_status"] == "COMPLETE"
    assert len({request_id for _, request_id, _ in adapter.calls}) == 3
    assert len(adapter.calls) == (4 if boundary == "adapter_call" else 3)
    report = validate_campaign(
        prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
    )
    assert report.coverage_status == "COMPLETE"
    assert report.observations == ()


def test_restart_rejects_session_reuse_across_cells_without_promotion(
    tmp_path: Path,
) -> None:
    prepared = prepare_fixture(tmp_path)
    adapter = ReusingSessionAdapter()
    with pytest.raises(RuntimeError, match="injected crash"):
        execute_fixture(prepared, adapter, crash_after="cell_result")
    adapter.reuse_retained_session = True
    coverage = execute_fixture(prepared, adapter, now_utc=LATER_TIME)
    assert coverage["coverage_status"] == "INCOMPLETE"
    assert coverage["diagnostic_coverage"] is False
    assert len(coverage["failed_cells"]) == 1
    assert len(coverage["missing_cells"]) == 1
    adapter_results = list(
        (prepared.repo / prepared.run_root / "events/attempts").glob(
            "*/000000/adapter-result.json"
        )
    )
    assert len(adapter_results) == 1
    report = validate_campaign(
        prepared.manifest_path, prepared.run_root, repo_root=prepared.repo
    )
    assert report.coverage_status == "INCOMPLETE"
    assert report.diagnostic_coverage is False


@pytest.mark.parametrize(
    ("mutation", "expected_exception"),
    [
        (
            lambda result: result.update(session_id="not-a-uuid"),
            "CapConfigurationCampaignError",
        ),
        (
            lambda result: result.update(solver="none"),
            "CapConfigurationCampaignError",
        ),
    ],
)
def test_fixture_adapter_rejects_malformed_identity_or_extra_fields(
    tmp_path: Path,
    mutation: Any,
    expected_exception: str,
) -> None:
    class MalformedAdapter(FakeAdapter):
        def __call__(self, **kwargs: Any) -> dict[str, Any]:
            result = super().__call__(**kwargs)
            mutation(result)
            return result

    prepared = prepare_fixture(tmp_path)
    coverage = execute_fixture(prepared, MalformedAdapter())
    assert coverage["coverage_status"] == "INCOMPLETE"
    assert coverage["diagnostic_coverage"] is False
    assert len(coverage["failed_cells"]) == 1
    failure = next(
        (prepared.repo / prepared.run_root / "events/attempts").glob(
            "*/000000/stages/000002-adapter-failure.json"
        )
    )
    stage = parse_stored_json_bytes(failure.read_bytes())
    assert stage["payload"]["exception"] == expected_exception
    assert not list(
        (prepared.repo / prepared.run_root / "events/attempts").glob(
            "*/000000/adapter-result.json"
        )
    )


def test_unqualified_cli_run_blocks_before_adapter_or_network(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    with pytest.raises(CapConfigurationCampaignError) as caught:
        run_campaign(
            prepared.manifest_path,
            prepared.run_root,
            prepared.authorization_path,
            "http://127.0.0.1:1",
            repo_root=prepared.repo,
            transport=object(),
            now_utc=PLAN_TIME,
        )
    assert caught.value.code == "BLOCKED_RESOURCE_BOUNDARY"
    assert not (prepared.repo / prepared.run_root / "events/attempts").exists()


def test_status_is_read_only_and_makes_no_claim(tmp_path: Path) -> None:
    prepared = prepare_fixture(tmp_path)
    before = sorted(
        path.relative_to(prepared.repo) for path in prepared.repo.rglob("*")
    )
    status = campaign_status(prepared.run_root, repo_root=prepared.repo)
    after = sorted(path.relative_to(prepared.repo) for path in prepared.repo.rglob("*"))
    assert before == after
    assert status["validated"] is False
    assert status["mathematical_claim"] is None
    assert status["coverage_status"] == "UNVALIDATED_OBSERVED_NONE"


def test_cli_help_exposes_exact_command_surface() -> None:
    campaign = subprocess.run(
        [sys.executable, "-m", "census.cap_configuration.campaign", "--help"],
        check=False,
        capture_output=True,
        text=True,
    )
    validator = subprocess.run(
        [sys.executable, "-m", "census.cap_configuration.validate", "--help"],
        check=False,
        capture_output=True,
        text=True,
    )
    assert campaign.returncode == validator.returncode == 0
    assert "{plan,run,status}" in campaign.stdout
    assert "manifest" in validator.stdout and "run_root" in validator.stdout
