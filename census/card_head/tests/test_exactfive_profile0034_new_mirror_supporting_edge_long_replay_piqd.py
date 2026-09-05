from __future__ import annotations

from pathlib import Path

import pytest

from census.card_head import (
    exactfive_profile0034_new_mirror_supporting_edge_long_replay_piqd as subject,
)


def test_parent_is_authenticated_and_targets_preserve_query_bytes() -> None:
    prior = subject.authenticate_source_orders()
    assert prior["order_sha256"] == subject.EXPECTED_ORDER_SHA256
    for branch in subject.BRANCH_IDS:
        query = subject.prepare_query(subject.build_target_system("mirror", branch))
        root = subject.PARENT_ROOT / "artifacts" / query.key
        assert query.query.original_smt2 == (root / "original.smt2").read_bytes()
        assert query.query.journal_smt2 == (root / "journal.smt2").read_bytes()
        assert query.query.descriptor["solver_profile"]["solvers"] == ["cvc5"]
        assert query.query.descriptor["solver_profile"]["timeout_ms"] == 300_000


@pytest.mark.parametrize("bad", [0, -1, True, 1.5, 3_600_001])
def test_timeout_is_strictly_validated(bad: object) -> None:
    with pytest.raises(subject.Profile0034NewMirrorSupportingEdgeLongReplayError, match="timeout"):
        subject.prepare_query(subject.build_control_system("positive"), timeout_ms=bad)  # type: ignore[arg-type]


@pytest.mark.parametrize("server", ["file:///tmp/piqd", "http://user@localhost:7272", "http://localhost:7272/?q=1"])
def test_server_is_custodial_http_only(server: str) -> None:
    with pytest.raises(Exception, match="URL"):
        subject.run_diagnostic(server=server)


def test_verify_path_does_not_construct_transport(monkeypatch: pytest.MonkeyPatch) -> None:
    def fail(*_args, **_kwargs):
        raise AssertionError("transport must not be used by verify")

    monkeypatch.setattr(subject._base.adapter, "UrllibPiqdTransport", fail)
    monkeypatch.setattr(subject._base, "_validate_existing_run_root", lambda: (_ for _ in ()).throw(subject.Error("run root absent")))
    with pytest.raises(subject.Error, match="absent"):
        subject.verify_run()


def test_parent_mutation_fails_closed(monkeypatch: pytest.MonkeyPatch) -> None:
    original = subject._base._read_regular

    def corrupt(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
        payload = original(path, limit)
        if path == subject.PARENT_LAUNCH_PATH:
            return payload + b"\n"
        return payload

    monkeypatch.setattr(subject._base, "_read_regular", corrupt)
    with pytest.raises(subject.Error, match="bytes drifted"):
        subject.authenticate_source_orders()


@pytest.mark.parametrize(
    "relative",
    [
        "artifacts/control-positive/result.json",
        "artifacts/control-positive/source-manifest.json",
        "artifacts/control-negative/result.json",
        "artifacts/control-negative/source-manifest.json",
        "artifacts/mirror-radius-lt/result.json",
        "artifacts/mirror-radius-lt/source-manifest.json",
        "artifacts/mirror-radius-gt/result.json",
        "artifacts/mirror-radius-gt/source-manifest.json",
    ],
)
def test_every_parent_result_and_source_mutation_fails_closed(
    relative: str, monkeypatch: pytest.MonkeyPatch
) -> None:
    original = subject._base._read_regular
    target = subject.PARENT_ROOT / relative

    def corrupt(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
        payload = original(path, limit)
        return payload + b"\n" if path == target else payload

    monkeypatch.setattr(subject._base, "_read_regular", corrupt)
    with pytest.raises(subject.Error):
        subject.authenticate_source_orders()


def test_launch_resume_drift_is_rejected(tmp_path, monkeypatch: pytest.MonkeyPatch) -> None:
    root = tmp_path / "run"
    for child in ("events", "artifacts", "tmp"):
        (root / child).mkdir(parents=True)
    (root / "events" / "launch.json").write_text("{}", encoding="utf-8")
    monkeypatch.setattr(subject, "RUN_ROOT", root)
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", tmp_path)
    monkeypatch.setattr(subject._base, "ensure_run_root", lambda: (root, {"manifest_sha256": "manifest"}))
    with pytest.raises(subject.Error, match="launch"):
        subject.run_diagnostic(timeout_s=300)


def test_default_timeout_and_effective_deadline() -> None:
    assert subject.DEFAULT_TIMEOUT_S == 300.0
    assert subject._base.adapter.effective_deadline_ms(300_000) == 330_000


def test_launch_record_binds_owner_manifest_and_effective_deadline() -> None:
    with subject._base_scope():
        launch = subject._launch_record(
            {"manifest_sha256": "m", "base_head": "h"},
            "http://127.0.0.1:7272",
            300_000,
            2,
        )
    assert launch["owner"] == subject.RUN_OWNER
    assert launch["base_head"] == "h"
    assert launch["run_manifest_sha256"] == "m"
    assert launch["effective_deadline_ms"] == 330_000
    assert launch["launch_sha256"] == subject._self_hash(launch, "launch_sha256")


def test_import_and_call_leave_base_configuration_unchanged() -> None:
    assert subject._base.adapter.SOLVERS == ("z3", "cvc5")
    assert subject._base.DEFAULT_TIMEOUT_S == 60.0
    subject.authenticate_source_orders()
    assert subject._base.adapter.SOLVERS == ("z3", "cvc5")
    assert subject._base.DEFAULT_TIMEOUT_S == 60.0


def test_manifest_creation_and_revalidation_are_create_once(tmp_path, monkeypatch: pytest.MonkeyPatch) -> None:
    repository = tmp_path / "repo"
    root = repository / "scratch" / "runs" / "lane" / "run-0001"
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository)
    monkeypatch.setattr(subject, "RUN_ROOT", root)
    monkeypatch.setattr(subject, "CHECKPOINT_PATH", tmp_path / "checkpoint.json")
    monkeypatch.setattr(subject, "LANE_ID", "lane")
    monkeypatch.setattr(subject, "_expected_run_manifest", lambda created: {
        "schema": "worktree-run-manifest/v1", "lane_id": "lane", "run_id": "run-0001",
        "root": "scratch/runs/lane/run-0001", "owner": subject.RUN_OWNER,
        "base_head": "h", "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": {}, "input_digests": {}, "created_utc": created,
        "manifest_sha256": "m",
    })
    root, first = subject.ensure_run_root()
    assert all((root / part).is_dir() for part in ("artifacts", "events", "tmp"))
    assert subject.ensure_run_root()[1] == first


def test_manifest_creation_uses_real_checkpoint_and_source_input_digests(tmp_path, monkeypatch: pytest.MonkeyPatch) -> None:
    root = tmp_path / "long-run"
    checkpoint_path = tmp_path / "checkpoint.json"
    checkpoint = {
        "schema": "worktree-lane-checkpoint/v1",
        "lane_id": subject.LANE_ID,
        "owner": subject.RUN_OWNER,
        "base_head": "633fd4712614149e2b5d7cd5f68d5263519e8192",
        "owned_paths": subject._CHECKPOINT_OWNED_PATHS,
        "generated_roots": [f"scratch/runs/{subject.LANE_ID}/{subject.RUN_ID}"],
        "durable_paths": [],
        "created_utc": "2026-09-05T05:24:05Z",
    }
    checkpoint["manifest_sha256"] = subject._self_hash(checkpoint, "manifest_sha256")
    checkpoint_path.write_bytes(subject._json(checkpoint))
    monkeypatch.setattr(subject, "RUN_ROOT", root)
    monkeypatch.setattr(subject, "CHECKPOINT_PATH", checkpoint_path)
    monkeypatch.setattr(subject._base, "_check_registered_ancestors", lambda _root: None)
    actual_root, manifest = subject.ensure_run_root()
    assert actual_root == root
    assert manifest["base_head"] == checkpoint["base_head"]
    assert manifest["source_digests"]["census/card_head/exactfive_profile0034_new_mirror_supporting_edge_long_replay_piqd.py"] == subject._sha(subject._read_regular(Path(subject.__file__)))
    assert manifest["input_digests"]["scratch/runs/exactfive-profile0034-new-mirror-supporting-edge-qfnra-piqd-20260904/run-0001/events/launch.json"] == subject._sha(subject._read_regular(subject.PARENT_LAUNCH_PATH))
    assert subject.ensure_run_root()[1] == manifest
    stored = subject._strict_json((root / "run_manifest.json").read_bytes(), "run manifest")
    assert stored["manifest_sha256"] == subject._self_hash(stored, "manifest_sha256")


def test_run_diagnostic_completed_terminal_uses_long_verifier_and_no_transport(tmp_path, monkeypatch: pytest.MonkeyPatch) -> None:
    root = tmp_path / "run"
    (root / "events").mkdir(parents=True)
    (root / "artifacts").mkdir()
    (root / "tmp").mkdir()
    manifest = {"manifest_sha256": "m", "base_head": "h"}
    with subject._base_scope():
        launch = subject._launch_record(manifest, "http://127.0.0.1:7272", 300_000, 2)
    (root / "events" / "launch.json").write_bytes(subject._json(launch))
    (root / "events" / "terminal.json").write_text("{\"status\":\"TARGET_INCONCLUSIVE\"}", encoding="utf-8")
    monkeypatch.setattr(subject._base, "ensure_run_root", lambda: (root, manifest))
    monkeypatch.setattr(subject, "_verify_run_strict", lambda: {"offline": True})
    monkeypatch.setattr(subject._base.adapter, "UrllibPiqdTransport", lambda *_a, **_k: (_ for _ in ()).throw(AssertionError("transport")))
    assert subject.run_diagnostic(server="http://127.0.0.1:7272", timeout_s=300) == {"offline": True}


def test_main_verify_routes_to_long_verifier_without_transport(tmp_path, monkeypatch: pytest.MonkeyPatch) -> None:
    root = tmp_path / "run"
    (root / "events").mkdir(parents=True)
    (root / "artifacts").mkdir()
    (root / "tmp").mkdir()
    manifest = {"manifest_sha256": "m", "base_head": "h"}
    with subject._base_scope():
        launch = subject._launch_record(manifest, "http://127.0.0.1:7272", 300_000, 2)
    (root / "events" / "launch.json").write_bytes(subject._json(launch))
    (root / "events" / "terminal.json").write_text("{\"status\":\"TARGET_INCONCLUSIVE\"}", encoding="utf-8")
    monkeypatch.setattr(subject._base, "_validate_existing_run_root", lambda: (root, manifest))
    monkeypatch.setattr(subject, "_verify_run_strict", lambda: {"offline": True})
    monkeypatch.setattr(subject._base.adapter, "UrllibPiqdTransport", lambda *_a, **_k: (_ for _ in ()).throw(AssertionError("transport")))
    assert subject.main(["--verify"]) == 0


def test_long_facade_rejects_malformed_completed_terminal(tmp_path, monkeypatch: pytest.MonkeyPatch) -> None:
    root = tmp_path / "run"
    (root / "events").mkdir(parents=True)
    (root / "artifacts").mkdir()
    (root / "tmp").mkdir()
    manifest = {"manifest_sha256": "m", "base_head": "h"}
    with subject._base_scope():
        launch = subject._launch_record(manifest, "http://127.0.0.1:7272", 300_000, 2)
    (root / "events" / "launch.json").write_bytes(subject._json(launch))
    (root / "events" / "terminal.json").write_text("{}", encoding="utf-8")
    monkeypatch.setattr(subject._base, "_validate_existing_run_root", lambda: (root, manifest))
    with pytest.raises(subject._base.Profile0034NewMirrorSupportingEdgeError, match="terminal"):
        subject.verify_run()


def test_main_verify_rejects_malformed_strict_launch(tmp_path, monkeypatch: pytest.MonkeyPatch) -> None:
    root = tmp_path / "run"
    (root / "events").mkdir(parents=True)
    (root / "artifacts").mkdir()
    (root / "tmp").mkdir()
    manifest = {"manifest_sha256": "m", "base_head": "h"}
    with subject._base_scope():
        launch = subject._launch_record(manifest, "http://127.0.0.1:7272", 300_000, 2)
    launch["effective_deadline_ms"] = 329_000
    launch["launch_sha256"] = subject._self_hash(launch, "launch_sha256")
    (root / "events" / "launch.json").write_bytes(subject._json(launch))
    monkeypatch.setattr(subject._base, "_validate_existing_run_root", lambda: (root, manifest))
    assert subject.main(["--verify"]) == 1


def test_existing_tree_rejects_ancestor_symlink(tmp_path, monkeypatch: pytest.MonkeyPatch) -> None:
    repository = tmp_path / "repo"
    outside = tmp_path / "outside"
    repository.mkdir()
    outside.mkdir()
    (repository / "runs").symlink_to(outside, target_is_directory=True)
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository)
    monkeypatch.setattr(subject, "RUN_ROOT", repository / "runs" / "lane" / "run")
    with subject._base_scope(), pytest.raises(subject._base.Profile0034NewMirrorSupportingEdgeError, match="unsafe"):
        subject._base._validate_existing_run_root()


def test_existing_tree_rejects_partial_children(tmp_path, monkeypatch: pytest.MonkeyPatch) -> None:
    repository = tmp_path / "repo"
    root = repository / "runs" / "lane" / "run"
    (root / "artifacts").mkdir(parents=True)
    (root / "events").mkdir()
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository)
    monkeypatch.setattr(subject, "RUN_ROOT", root)
    with subject._base_scope(), pytest.raises(subject._base.Profile0034NewMirrorSupportingEdgeError, match="child"):
        subject._base._validate_existing_run_root()


def test_offline_resume_rejects_wrong_effective_deadline(tmp_path, monkeypatch: pytest.MonkeyPatch) -> None:
    root = tmp_path / "run"
    (root / "events").mkdir(parents=True)
    (root / "artifacts").mkdir()
    (root / "tmp").mkdir()
    manifest = {"manifest_sha256": "m", "base_head": "h"}
    launch = {
        "schema": subject.LAUNCH_SCHEMA, "lane_id": subject.LANE_ID, "run_id": subject.RUN_ID,
        "owner": subject.RUN_OWNER, "base_head": "h", "run_manifest_sha256": "m",
        "server": "http://127.0.0.1:7272", "timeout_ms": 300_000,
        "effective_deadline_ms": 329_000, "workers": 2,
    }
    launch["launch_sha256"] = subject._self_hash(launch, "launch_sha256")
    (root / "events" / "launch.json").write_bytes(subject._json(launch))
    monkeypatch.setattr(subject._base, "_validate_existing_run_root", lambda: (root, manifest))
    with pytest.raises(subject.Error, match="launch"):
        subject.verify_run()
