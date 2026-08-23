from __future__ import annotations

import pytest
import run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v7_two_kalmanson_refinements_sat_portfolio as runner

IDENTITY_AUDIT_RELATIVE = (
    "scratch/runs/exact17-v7-checkpoint-alias-fix-20260823/identity-freeze-v1/"
    "derived-runner-identities.json"
)


def test_v7_runner_identity_and_execution_contract() -> None:
    runner.validate_committed_dependencies()
    assert runner.PRODUCTION_PINS_FINALIZED is True
    assert len(runner.SOURCE_CELL_IDENTITIES) == 76
    assert len(runner.PRODUCTION_CELL_IDENTITIES) == 76
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
    assert runner.BASE_HEAD == "b5e58d40590b8749979cded525d76f602ae321ea"
    assert runner.EXPECTED_SOURCE_LANE_ID == (
        "exact17-v7-two-kalmanson-successor-preparer-v3-20260823"
    )
    assert runner.EXPECTED_SOURCE_RUN_ID == "preparation-v3"
    assert runner.SOURCE_RUN_ROOT_RELATIVE == (
        "scratch/runs/exact17-v7-two-kalmanson-successor-preparer-v3-20260823/"
        "preparation-v3"
    )
    assert runner.SOURCE_PREPARATION_CONFIG_RELATIVE.endswith(
        "v7-two-kalmanson-preparation-config-v3.json"
    )
    assert runner.EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA.endswith(
        "v3-preparation-config/v1"
    )


def test_v7_frozen_source_support_and_identity_pins_are_exact() -> None:
    assert (runner.SOURCE_CAMPAIGN_SHA256, runner.SOURCE_CAMPAIGN_BYTES) == (
        "bf034f55631fa7d33f3aa4d9a81b46e87b922a94b5b7a1fa3f5c53b8de45c001",
        121_958,
    )
    assert (runner.SOURCE_RUN_MANIFEST_SHA256, runner.SOURCE_RUN_MANIFEST_BYTES) == (
        "4deb8f23ac7e63567083e7b5021a609ad56cc6d83be4d28aaa4ac56d8ecb7cfa",
        2_532,
    )
    assert runner.SOURCE_PREPARER_COMMIT == (
        "1fe86e292b6d112ee98052c443b92ca4b84354ca"
    )
    assert (runner.SOURCE_PREPARER_SHA256, runner.SOURCE_PREPARER_BYTES) == (
        "e134b37a4ead69df76598574881e2b45c2ef59046e024c82d4e82427a5885bc9",
        25_281,
    )
    assert (runner.CHECKPOINT_SHA256, runner.CHECKPOINT_BYTES) == (
        "55955ffd36f40cb961fba23c48ad20e5f9e8c804e118cc20d55ba0b072bc80f8",
        1_342,
    )
    assert (
        runner.RUNNER_CODE_CHECKPOINT_SHA256,
        runner.RUNNER_CODE_CHECKPOINT_BYTES,
    ) == (
        "469e914c7505a1088a4ae9a4d88bca69f8a4674f13e49530e41593ff342999c9",
        2_394,
    )
    assert (runner.MINER_SHA256, runner.MINER_BYTES) == (
        "b6e0fe8faefe6cea424d4a8d6a7f5fdd7344c66a8ff6cd7e08df2e93a9abeadd",
        3_837,
    )
    assert runner.sha256_bytes(
        runner.canonical_json_bytes(runner.SOURCE_CELL_IDENTITIES)
    ) == runner.SOURCE_CELL_IDENTITIES_SHA256 == (
        "b492050a28756b28fa78f533287b77ce6b6d41b266bc770d36c428de1327547c"
    )
    assert runner.sha256_bytes(
        runner.canonical_json_bytes(runner.PRODUCTION_CELL_IDENTITIES)
    ) == runner.PRODUCTION_CELL_IDENTITIES_SHA256 == (
        "0d52e944a3c145f37765db2954f5f930586502e1e961a59b3863d95dbe45b153"
    )
    runner._require_production_pins()
    support = runner._authenticate_runner_support()
    assert support[runner.CHECKPOINT_RELATIVE] == runner.CHECKPOINT_SHA256
    assert support[runner.RUNNER_CODE_CHECKPOINT_RELATIVE] == (
        runner.RUNNER_CODE_CHECKPOINT_SHA256
    )
    assert support[runner.MINER_RELATIVE] == runner.MINER_SHA256


def test_v7_retained_identity_audit_matches_the_frozen_tables() -> None:
    raw = (runner.ROOT / IDENTITY_AUDIT_RELATIVE).read_bytes()
    assert len(raw) == 74_906
    assert runner.sha256_bytes(raw) == (
        "58cdbce660c4f09280b4ec5e35d539b69da57f65cd5ec4bd42f109208fab15c0"
    )
    audit = runner._strict_repo_json(raw, "retained V7 identity audit")
    assert audit["source_cell_identities"] == runner.SOURCE_CELL_IDENTITIES
    assert audit["production_cell_identities"] == runner.PRODUCTION_CELL_IDENTITIES
    assert audit["source_table_sha256"] == runner.SOURCE_CELL_IDENTITIES_SHA256
    assert (
        audit["production_table_sha256"]
        == runner.PRODUCTION_CELL_IDENTITIES_SHA256
    )
    assert audit["cell_count"] == len(audit["source_cell_identities"]) == 76
    assert len(audit["production_cell_identities"]) == 76


def test_v7_checkpoint_roles_are_distinct_and_separately_validated() -> None:
    assert runner.CHECKPOINT_RELATIVE != runner.RUNNER_CODE_CHECKPOINT_RELATIVE
    assert runner._BASE.CHECKPOINT_RELATIVE == runner.CHECKPOINT_RELATIVE
    assert (
        runner._BASE.RUNNER_CODE_CHECKPOINT_RELATIVE
        == runner.RUNNER_CODE_CHECKPOINT_RELATIVE
    )
    production = runner._strict_repo_json(
        (runner.ROOT / runner.CHECKPOINT_RELATIVE).read_bytes(),
        "V7 production checkpoint",
    )
    runner_code = runner._strict_repo_json(
        (runner.ROOT / runner.RUNNER_CODE_CHECKPOINT_RELATIVE).read_bytes(),
        "V7 runner-code checkpoint",
    )
    runner._validate_production_checkpoint_payload(production)
    assert production["lane_id"] == runner.LANE_ID
    assert production["owned_paths"] == [runner.CHECKPOINT_RELATIVE]
    assert runner_code["lane_id"] == runner.RUNNER_CODE_CHECKPOINT_LANE_ID
    assert runner_code["lane_id"] != production["lane_id"]

    with pytest.raises(
        runner.PortfolioRunnerError,
        match="production checkpoint contract drifted",
    ):
        runner._validate_production_checkpoint_payload(runner_code)


def test_v7_checkpoint_path_alias_fails_closed(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        runner,
        "CHECKPOINT_RELATIVE",
        runner.RUNNER_CODE_CHECKPOINT_RELATIVE,
    )
    with pytest.raises(runner.PortfolioRunnerError, match="checkpoint paths alias"):
        runner._validate_checkpoint_roles()


def test_v7_runner_fails_before_filesystem_or_piqd_if_freeze_flag_drifts(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(runner._BASE, "PRODUCTION_PINS_FINALIZED", False)
    with pytest.raises(runner.PortfolioRunnerError, match="identities are provisional"):
        runner._require_production_pins()
    with pytest.raises(runner.PortfolioRunnerError, match="identities are provisional"):
        runner.static_check()
    assert not runner.OUTPUT_ROOT.exists()


def test_v7_table_and_support_tamper_fail_closed(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    with monkeypatch.context() as scoped:
        tampered = dict(runner.SOURCE_CELL_IDENTITIES)
        first = next(iter(tampered))
        tampered[first] = {
            **tampered[first],
            "cnf_bytes": tampered[first]["cnf_bytes"] + 1,
        }
        scoped.setattr(runner._BASE, "SOURCE_CELL_IDENTITIES", tampered)
        with pytest.raises(runner.PortfolioRunnerError, match="identity table digest"):
            runner._require_production_pins()

    with monkeypatch.context() as scoped:
        scoped.setattr(runner._BASE, "CHECKPOINT_SHA256", "0" * 64)
        with pytest.raises(runner.PortfolioRunnerError, match="support pin drifted"):
            runner._authenticate_runner_support()


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
