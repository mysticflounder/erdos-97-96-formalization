from __future__ import annotations

import pytest
import run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v7_two_kalmanson_refinements_sat_portfolio as runner


def test_v7_runner_identity_and_execution_contract() -> None:
    runner.validate_committed_dependencies()
    assert runner.PRODUCTION_PINS_FINALIZED is False
    assert runner.SOURCE_CELL_IDENTITIES == {}
    assert runner.PRODUCTION_CELL_IDENTITIES == {}
    assert (runner.NUM_VARIABLES, runner.ROOT_NUM_CLAUSES, runner.NUM_CLAUSES) == (
        308,
        7_409_810,
        7_409_816,
    )
    assert runner.CELL_COUNT == 76
    assert runner.REQUESTED_CORE_LIMIT == 1
    assert runner.MAX_ACTIVE_JOBS == 12
    assert runner.SOLVE_TIMEOUT_S == 3_600
    assert runner.REPLAY_TIMEOUT_S == 3_600


def test_v7_runner_fails_before_filesystem_or_piqd_without_frozen_pins() -> None:
    with pytest.raises(runner.PortfolioRunnerError, match="identities are provisional"):
        runner._require_production_pins()
    with pytest.raises(runner.PortfolioRunnerError, match="identities are provisional"):
        runner.static_check()
    assert not runner.OUTPUT_ROOT.exists()


def test_v7_runner_owns_every_source_and_output_identity() -> None:
    assert runner.CANARY_SOURCE_CELL_ID.startswith(
        "canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-"
    )
    assert runner.CANARY_PORTFOLIO_CELL_ID == (
        f"{runner.CANARY_SOURCE_CELL_ID}-{runner.PORTFOLIO_CELL_SUFFIX}"
    )
    labels = (
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
    assert all("v7" in label.lower() for label in labels)
    assert runner.EXPECTED_SOURCE_PATH.endswith(
        "V7TwoKalmansonRefinementsPhysicalSliceCoverage.lean"
    )
    assert runner.EXPECTED_ROOT_SOURCE_PATH.endswith(
        "V7TwoKalmansonRefinements.lean"
    )
    assert runner.SOURCE_RUN_ROOT == runner.ROOT / runner.SOURCE_RUN_ROOT_RELATIVE


def test_v7_campaign_cell_validator_rejects_the_inherited_v6_suffix() -> None:
    source_id = runner.CANARY_SOURCE_CELL_ID
    ref = {"path": "scratch/input", "sha256": "0" * 64, "bytes": 1}
    cell = {
        "portfolio_cell_id": f"{source_id}-{runner.PORTFOLIO_CELL_SUFFIX}",
        "source_cell_id": source_id,
        "center": 2,
        "category": "none",
        "ordinal": 0,
        "source_cnf": ref,
        "producer_manifest": ref,
        "wave_manifest": ref,
        "expected_identity_hash": "1" * 64,
    }
    assert runner._validate_cell(cell, 0) == cell
    drifted = {
        **cell,
        "portfolio_cell_id": f"{source_id}-canary-two-kalmanson-v6-sat-profile-v1",
    }
    with pytest.raises(runner.PortfolioRunnerError, match="V7 source cell"):
        runner._validate_cell(drifted, 0)


def test_v7_runner_help_never_describes_the_v5_portfolio(
    capsys: pytest.CaptureFixture[str],
) -> None:
    assert runner.main(["--help"]) == 0
    rendered = capsys.readouterr().out
    for required in ("V7", "7,409,810", "7,409,816", "308", "76"):
        assert required in rendered
    for stale in ("V5", "7,409,780", "7,409,786"):
        assert stale not in rendered
