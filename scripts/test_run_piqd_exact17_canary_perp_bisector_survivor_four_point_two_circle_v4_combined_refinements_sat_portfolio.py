from __future__ import annotations

import fcntl
import os
from pathlib import Path
from typing import Any

import pytest
import run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v4_combined_refinements_sat_portfolio as runner


def test_combined_v5_identity_and_execution_contract() -> None:
    assert runner.PRODUCTION_PINS_FINALIZED is False
    assert runner.SOURCE_CELL_IDENTITIES == {}
    assert runner.PRODUCTION_CELL_IDENTITIES == {}
    assert runner.NUM_VARIABLES == 308
    assert runner.ROOT_NUM_CLAUSES == 7_409_760
    assert runner.NUM_CLAUSES == 7_409_766
    assert runner.CELL_COUNT == 76
    assert runner.CANARY_SOURCE_CELL_ID.endswith(
        "combined-v5-next-center-02-physical-none"
    )
    assert runner.CANARY_PORTFOLIO_CELL_ID.endswith(
        "combined-v5-next-center-02-physical-none-combined-v5-sat-profile-v1"
    )
    assert runner.REQUESTED_CORE_LIMIT == 1
    assert runner.MAX_ACTIVE_JOBS == 12
    assert runner.SOLVE_TIMEOUT_S == 3_600
    assert runner.REPLAY_TIMEOUT_S == 3_600
    assert runner.RUN_ID == "sat-profile-portfolio-v5"
    assert runner.RUN_OWNER.endswith("sat-portfolio-v5")
    assert "combined-v5" in runner.PROJECT


def test_every_combined_v5_lane_label_is_fresh() -> None:
    labels = (
        runner.PROJECT,
        runner.SOURCE_CAMPAIGN_SCHEMA,
        runner.CAMPAIGN_SCHEMA,
        runner.LAUNCH_SCHEMA,
        runner.RESULT_SCHEMA,
        runner.ACCEPTANCE_SCHEMA,
        runner.SAT_REPLAY_SCHEMA,
        runner.UNSAT_REPLAY_SCHEMA,
        runner.WAVE_MINE_SCHEMA,
        runner.WAVE_MINE_LEDGER_SCHEMA,
        runner.WAVE_MINE_CANDIDATE_SCHEMA,
        runner.MINE_VERIFICATION_SCHEMA,
        runner.IDENTITY_DERIVATION_SCHEMA,
        runner.MINER_NAME,
        runner.MINER_SCHEMA,
        runner.EXPECTED_FINITE_SCHEMA,
        runner.EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA,
        runner.CANARY_SOURCE_CELL_ID,
        runner.CANARY_PORTFOLIO_CELL_ID,
    )
    assert len(labels) == len(set(labels))
    assert all("combined-v5" in label for label in labels)
    assert runner.RUN_MANIFEST_SCHEMA == "worktree-run-manifest/v1"


def test_unfrozen_pins_are_explicitly_blank() -> None:
    for name in (
        "SOURCE_CAMPAIGN_SHA256",
        "SOURCE_RUN_MANIFEST_SHA256",
        "SOURCE_PREPARER_COMMIT",
        "SOURCE_PREPARER_SHA256",
        "CHECKPOINT_SHA256",
        "RUNNER_CODE_CHECKPOINT_SHA256",
        "MINER_SHA256",
    ):
        assert getattr(runner, name) == ""
    for name in (
        "SOURCE_CAMPAIGN_BYTES",
        "SOURCE_RUN_MANIFEST_BYTES",
        "SOURCE_PREPARER_BYTES",
        "CHECKPOINT_BYTES",
        "RUNNER_CODE_CHECKPOINT_BYTES",
        "MINER_BYTES",
    ):
        assert getattr(runner, name) == 0
    with pytest.raises(runner.PortfolioRunnerError, match="provisional"):
        runner._require_production_pins()


def test_public_mutating_and_piqd_routes_fail_before_contact_or_files(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    contacted = False

    def forbidden(*args: Any, **kwargs: Any) -> Any:
        nonlocal contacted
        del args, kwargs
        contacted = True
        raise AssertionError("unfrozen runner must not contact PIQD")

    monkeypatch.setattr(runner, "PiqdRawDimacsClient", forbidden)
    monkeypatch.setattr(runner._legacy, "live_identity", forbidden)
    for action in (
        lambda: runner.prepare_portfolio(output_root=tmp_path / "prepared"),
        lambda: runner.static_check(root=tmp_path, run_root=tmp_path / "run"),
        lambda: runner.start_canary(
            base_url="http://127.0.0.1:7272", root=tmp_path, run_root=tmp_path / "run"
        ),
        lambda: runner.start_rest(
            base_url="http://127.0.0.1:7272", root=tmp_path, run_root=tmp_path / "run"
        ),
    ):
        with pytest.raises(runner.PortfolioRunnerError, match="provisional"):
            action()
    assert contacted is False
    assert list(tmp_path.iterdir()) == []


def test_internal_confirm_accept_and_process_routes_fail_before_freeze(
    tmp_path: Path,
) -> None:
    calls = (
        lambda: runner._live_daemon_attestation("http://127.0.0.1:7272"),
        lambda: runner._reserve_cell(tmp_path, "cell"),
        lambda: runner._phase_lock(tmp_path, "canary", b"launch"),
        lambda: runner._write_once_or_validate(tmp_path / "x", b"x", "x"),
        lambda: runner._confirm_and_refresh(object(), object(), b"p cnf 0 0\n"),
        lambda: runner._fresh_run_cell(
            tmp_path, tmp_path, {}, "http://127.0.0.1:7272"
        ),
        lambda: runner._fresh_run_cell_under_lock(
            tmp_path,
            tmp_path,
            "cell",
            b"p cnf 0 0\n",
            b"{}",
            {},
            "http://127.0.0.1:7272",
        ),
        lambda: runner._resume_run_cell(
            tmp_path, tmp_path, {}, "http://127.0.0.1:7272"
        ),
        lambda: runner._bounded_run(
            [],
            root=tmp_path,
            run_root=tmp_path,
            base_url="http://127.0.0.1:7272",
            capacity_root=tmp_path / "capacity",
        ),
        lambda: runner._execute_phase(
            phase="rest",
            root=tmp_path,
            run_root=tmp_path,
            base_url="http://127.0.0.1:7272",
        ),
        lambda: runner._validate_acceptance(tmp_path, tmp_path, {}),
        lambda: runner._verify_existing_mine(
            root=tmp_path,
            run_root=tmp_path,
            canary={},
            terminal={},
            campaign_sha256="0" * 64,
            run_manifest_sha256="1" * 64,
            ledger={},
            receipt_raws={},
        ),
    )
    for call in calls:
        with pytest.raises(runner.PortfolioRunnerError, match="provisional"):
            call()
    assert list(tmp_path.iterdir()) == []


def test_cli_start_confirm_and_accept_surfaces_remain_unavailable(
    capsys: pytest.CaptureFixture[str],
) -> None:
    for command in ("prepare", "static-check", "start-canary", "start-rest"):
        assert runner.main([command, "--base-url", "http://127.0.0.1:7272"]) == 2
        assert "provisional" in capsys.readouterr().err
    with pytest.raises(runner.PortfolioRunnerError, match="ungated launch"):
        runner.start(base_url="http://127.0.0.1:7272")


def test_create_once_write_and_phase_lock_recovery_reject_tamper(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(runner, "_require_production_pins", lambda: None)
    payload = b"authenticated\n"
    path = tmp_path / "artifact.json"
    runner._write_once_or_validate(path, payload, "artifact")
    runner._write_once_or_validate(path, payload, "artifact")
    path.write_bytes(b"tampered\n")
    with pytest.raises(runner.PortfolioRunnerError, match="conflicts"):
        runner._write_once_or_validate(path, payload, "artifact")

    run_root = tmp_path / "run"
    first = runner._phase_lock(run_root, "canary", b"launch")
    fcntl.flock(first, fcntl.LOCK_UN)
    os.close(first)
    second = runner._phase_lock(run_root, "canary", b"launch")
    fcntl.flock(second, fcntl.LOCK_UN)
    os.close(second)
    lock, _, _ = runner._phase_paths(run_root, "canary")
    parsed = runner._strict_json(lock.read_bytes(), "phase lock")
    assert parsed["manifest_sha256"] == runner._self_hash(parsed)
    lock.write_bytes(b"tampered")
    with pytest.raises(runner.PortfolioRunnerError, match="conflicts"):
        runner._phase_lock(run_root, "canary", b"launch")


def test_runner_does_not_import_prior_fourpoint_v4_lane() -> None:
    source = Path(runner.__file__).read_text()
    assert (
        "run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_"
        "refinements_sat_portfolio" not in source
    )
    assert "sat-portfolio-v4-20260822" not in source
