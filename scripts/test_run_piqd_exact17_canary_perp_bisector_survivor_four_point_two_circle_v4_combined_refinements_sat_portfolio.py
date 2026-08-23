from __future__ import annotations

import fcntl
import os
from pathlib import Path

import prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v4_combined_refinements_physical_slice_cells as preparer
import pytest
import run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v4_combined_refinements_sat_portfolio as runner


def test_combined_v5_identity_and_execution_contract() -> None:
    assert runner.PRODUCTION_PINS_FINALIZED is True
    assert len(runner.SOURCE_CELL_IDENTITIES) == 76
    assert len(runner.PRODUCTION_CELL_IDENTITIES) == 76
    assert runner.NUM_VARIABLES == 308
    assert runner.ROOT_NUM_CLAUSES == 7_409_760
    assert runner.NUM_CLAUSES == 7_409_766
    assert runner.CELL_COUNT == 76
    assert runner.CANARY_SOURCE_CELL_ID.endswith(
        "combined-refinements-next-center-02-physical-none"
    )
    assert runner.CANARY_PORTFOLIO_CELL_ID.endswith(
        "combined-refinements-next-center-02-physical-none-combined-v5-sat-profile-v1"
    )
    assert runner.REQUESTED_CORE_LIMIT == 1
    assert runner.MAX_ACTIVE_JOBS == 12
    assert runner.SOLVE_TIMEOUT_S == 3_600
    assert runner.REPLAY_TIMEOUT_S == 3_600
    assert runner.RUN_ID == "sat-profile-portfolio-v5"
    assert runner.RUN_OWNER.endswith("sat-portfolio-v5")
    assert "combined-v5" in runner.PROJECT


def test_every_combined_v5_lane_label_is_fresh() -> None:
    output_labels = (
        runner.PROJECT,
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
        runner.CANARY_PORTFOLIO_CELL_ID,
    )
    assert len(output_labels) == len(set(output_labels))
    assert all("combined-v5" in label for label in output_labels)
    assert runner.RUN_MANIFEST_SCHEMA == "worktree-run-manifest/v1"


def test_real_staged_source_config_binds_ingress_contract() -> None:
    config_path = runner.ROOT / runner.SOURCE_PREPARATION_CONFIG_RELATIVE
    assert config_path == runner.ROOT / (
        "census/p97_search/waves/exact17/"
        "canary-perp-bisector-survivor-four-point-two-circle-v4-combined-"
        "refinements-preparation-config.json"
    )
    config = runner._strict_repo_json(
        config_path.read_bytes(), "staged source production config"
    )
    assert config["schema"] == runner.EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA
    assert config["schema"] == preparer.PRODUCTION_CONFIG_SCHEMA
    assert config["generated_root"] == runner.SOURCE_RUN_ROOT_RELATIVE
    assert config["generated_root"] == (
        f"scratch/runs/{preparer.LANE_ID}/{preparer.RUN_ID}"
    )
    assert config["lane_id"] == runner.EXPECTED_SOURCE_LANE_ID == preparer.LANE_ID
    assert config["base_head"] == runner.EXPECTED_SOURCE_BASE_HEAD
    assert preparer.RUN_ID == runner.EXPECTED_SOURCE_RUN_ID
    assert config["target_code"]["preparer"]["path"] == (
        runner.EXPECTED_SOURCE_PREPARER_RELATIVE
    )
    assert runner.SOURCE_CAMPAIGN_SCHEMA == preparer.CAMPAIGN_SCHEMA
    assert runner.EXPECTED_FINITE_SCHEMA == preparer.FINITE_SCHEMA

    runner._require_source_production_config(
        {
            "path": runner.SOURCE_PREPARATION_CONFIG_RELATIVE,
            "schema": config["schema"],
            "target_code": config["target_code"],
        },
        source_preparer_commit=config["target_code"]["commit"],
        label="staged source production config",
    )
    assert runner.CANARY_SOURCE_CELL_ID == preparer.category_id(2, "none")
    assert runner.CANARY_PORTFOLIO_CELL_ID == (
        f"{runner.CANARY_SOURCE_CELL_ID}-combined-v5-sat-profile-v1"
    )


def test_real_staged_source_run_manifest_binds_ingress_identity() -> None:
    manifest_path = runner.ROOT / runner.SOURCE_RUN_ROOT_RELATIVE / "run_manifest.json"
    manifest = runner._strict_repo_json(
        manifest_path.read_bytes(), "staged source run manifest"
    )
    runner._require_source_run_contract(manifest)
    assert manifest["lane_id"] == runner.EXPECTED_SOURCE_LANE_ID
    assert manifest["run_id"] == runner.EXPECTED_SOURCE_RUN_ID
    assert manifest["base_head"] == runner.EXPECTED_SOURCE_BASE_HEAD

    campaign_contract = {
        "schema": runner.SOURCE_CAMPAIGN_SCHEMA,
        "run_id": runner.EXPECTED_SOURCE_RUN_ID,
        "status": "PREPARED_LOCAL_ONLY",
        "cell_count": runner.CELL_COUNT,
    }
    runner._require_source_campaign_contract(campaign_contract)

    for field, replacement in (
        ("lane_id", "foreign-lane"),
        ("run_id", "preparation-v5"),
        ("base_head", "0" * 40),
    ):
        drifted = dict(manifest)
        drifted[field] = replacement
        with pytest.raises(runner.PortfolioRunnerError, match="source run custody"):
            runner._require_source_run_contract(drifted)

    drifted_campaign = dict(campaign_contract)
    drifted_campaign["run_id"] = "preparation-v5"
    with pytest.raises(runner.PortfolioRunnerError, match="source campaign contract"):
        runner._require_source_campaign_contract(drifted_campaign)


def test_frozen_pins_and_identity_tables_are_exact() -> None:
    assert (runner.SOURCE_CAMPAIGN_SHA256, runner.SOURCE_CAMPAIGN_BYTES) == (
        "e2adff5b6e136a96b9de3764619b4e25e39f3d21c52e78dd8da5ab21914a65a5",
        129_390,
    )
    assert (
        runner.SOURCE_RUN_MANIFEST_SHA256,
        runner.SOURCE_RUN_MANIFEST_BYTES,
    ) == (
        "7afd441a9674a9cf101bcffb6d2f580ec67c98bea449b896da395a15b0e3bd74",
        2_635,
    )
    assert runner.SOURCE_PREPARER_COMMIT == (
        "d6add9c98563e3858eec70e919547f8264eb4871"
    )
    assert (runner.SOURCE_PREPARER_SHA256, runner.SOURCE_PREPARER_BYTES) == (
        "887d0b0ca1b4971f3d17750d09744911cecaf2ca04c83ba68782790ce4674b61",
        121_692,
    )
    assert (runner.CHECKPOINT_SHA256, runner.CHECKPOINT_BYTES) == (
        "18bb9de2a6a9d5c4feb2566e6be945da0d49e1c9758dfcc7cd2eaddb0a974a6b",
        1_321,
    )
    assert (
        runner.RUNNER_CODE_CHECKPOINT_SHA256,
        runner.RUNNER_CODE_CHECKPOINT_BYTES,
    ) == (
        "16e252a56d3026ff45f6ba62e54fff5e44ad40ca081c6b3b9778b08b7e6c8f12",
        949,
    )
    assert (runner.MINER_SHA256, runner.MINER_BYTES) == (
        "d074010dd81be4553cc2b04f90121391f6d8b483aebd9686a11814044f15cbda",
        53_608,
    )
    assert runner.sha256_bytes(
        runner.canonical_json_bytes(runner.SOURCE_CELL_IDENTITIES)
    ) == runner.SOURCE_CELL_IDENTITIES_SHA256 == (
        "4870d07e6643216844a6334ee88d5a512aa3f66db24fd59b0685bae94aafee1b"
    )
    assert runner.sha256_bytes(
        runner.canonical_json_bytes(runner.PRODUCTION_CELL_IDENTITIES)
    ) == runner.PRODUCTION_CELL_IDENTITIES_SHA256 == (
        "d8debb01c7b353eafdf9b938c1a34cbcf02f53cae1fc164bfb2af3d7180aa003"
    )
    runner._require_production_pins()
    support = runner._authenticate_runner_support()
    assert support[runner.CHECKPOINT_RELATIVE] == runner.CHECKPOINT_SHA256
    assert support[runner.MINER_RELATIVE] == runner.MINER_SHA256


def test_frozen_identity_and_support_tamper_fail_closed(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    original_source = runner.SOURCE_CELL_IDENTITIES
    source = dict(original_source)
    first = next(iter(source))
    source[first] = {**source[first], "cnf_bytes": source[first]["cnf_bytes"] + 1}
    monkeypatch.setattr(runner, "SOURCE_CELL_IDENTITIES", source)
    with pytest.raises(runner.PortfolioRunnerError, match="identity table digest"):
        runner._require_production_pins()

    monkeypatch.setattr(runner, "SOURCE_CELL_IDENTITIES", original_source)
    monkeypatch.setattr(runner, "CHECKPOINT_SHA256", "0" * 64)
    with pytest.raises(runner.PortfolioRunnerError, match="support pin drifted"):
        runner._authenticate_runner_support()


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
