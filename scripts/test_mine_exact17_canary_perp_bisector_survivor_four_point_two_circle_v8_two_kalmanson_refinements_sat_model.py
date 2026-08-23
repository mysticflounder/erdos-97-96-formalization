from __future__ import annotations

import copy

import mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_sat_model as miner
import pytest


def test_scanner_identity_is_self_consistent() -> None:
    identity = miner.build_scanner_identity(candidate_count=14)
    assert miner.validate_scanner_identity(identity, candidate_count=14) == identity
    assert identity["scanner_script_path"] == miner.MINER_RELATIVE
    assert identity["scanner_script_sha256"] == miner.scanner_script_identity()["sha256"]
    assert identity["scanner_script_bytes"] == miner.scanner_script_identity()["bytes"]


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
