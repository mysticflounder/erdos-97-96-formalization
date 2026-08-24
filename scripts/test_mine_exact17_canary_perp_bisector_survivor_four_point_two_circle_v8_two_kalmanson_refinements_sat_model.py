from __future__ import annotations

import copy
import importlib

import mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_sat_model as miner
import pytest


def test_scanner_identity_is_self_consistent() -> None:
    identity = miner.build_scanner_identity(candidate_count=14)
    assert miner.validate_scanner_identity(identity, candidate_count=14) == identity
    assert identity["scanner_script_path"] == miner.MINER_RELATIVE
    assert (
        identity["scanner_script_sha256"] == miner.scanner_script_identity()["sha256"]
    )
    assert identity["scanner_script_bytes"] == miner.scanner_script_identity()["bytes"]


def test_inherited_scanner_is_configured_for_exact_v8_cell() -> None:
    base = miner._PARENT._BASE
    assert base.NUM_POINTS == 17
    assert base.NUM_VARIABLES == miner.preparer.VARIABLES == 308
    assert base.NUM_CLAUSES == miner.preparer.CELL_CLAUSES == 7_409_845
    miner._validate_inherited_packet_contract()


def test_v8_runner_base_exposes_complete_miner_surface() -> None:
    runner = importlib.import_module(
        "run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_"
        "v8_two_kalmanson_refinements_sat_portfolio"
    )
    base = miner._runner_base_for_v8(runner)
    assert all(hasattr(base, name) for name in miner.REQUIRED_RUNNER_SURFACE)
    assert base.NUM_CLAUSES == miner.preparer.CELL_CLAUSES


def test_v8_runner_base_rejects_dimension_drift(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    runner = importlib.import_module(
        "run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_"
        "v8_two_kalmanson_refinements_sat_portfolio"
    )
    monkeypatch.setattr(runner, "NUM_CLAUSES", runner.NUM_CLAUSES - 1)
    with pytest.raises(miner.V8MinerIdentityError, match="runner dimensions drifted"):
        miner._runner_base_for_v8(runner)


def test_candidate_count_is_exact() -> None:
    identity = miner.build_scanner_identity(candidate_count=14)
    with pytest.raises(miner.V8MinerIdentityError, match="candidate_count"):
        miner.validate_scanner_identity(identity, candidate_count=13)


def test_candidate_family_inventory_is_exact() -> None:
    with pytest.raises(miner.V8MinerIdentityError, match="family inventory"):
        miner.build_scanner_identity(
            candidate_count=0,
            candidate_families=miner.SOURCE_VALID_FAMILIES[:-1],
        )


def test_scanner_dependency_inventory_is_exact() -> None:
    dependencies = copy.deepcopy(miner.SCANNER_DEPENDENCIES)
    dependencies.pop(next(iter(dependencies)))
    with pytest.raises(miner.V8MinerIdentityError, match="dependency inventory"):
        miner.build_scanner_identity(
            candidate_count=0, scanner_dependencies=dependencies
        )


def test_runner_owned_receipt_schemas_are_complete() -> None:
    identity = miner.build_scanner_identity(candidate_count=0)
    assert identity["runner_receipt_schemas"] == {
        "acceptance": miner.ACCEPTANCE_SCHEMA,
        "candidate": miner.WAVE_MINE_CANDIDATE_SCHEMA,
        "candidate_ledger": miner.WAVE_MINE_LEDGER_SCHEMA,
        "mine": miner.WAVE_MINE_SCHEMA,
        "sat_replay": miner.SAT_REPLAY_SCHEMA,
        "verification": miner.VERIFICATION_SCHEMA,
    }


def test_unknown_identity_key_is_rejected() -> None:
    identity = miner.build_scanner_identity(candidate_count=0)
    identity["legacy_v7_alias"] = True
    with pytest.raises(miner.V8MinerIdentityError, match="keys drifted"):
        miner.validate_scanner_identity(identity, candidate_count=0)


def test_cli_help_is_offline_and_available(capsys: pytest.CaptureFixture[str]) -> None:
    assert miner.main(["--help"]) == 0
    assert "V8" in capsys.readouterr().out
