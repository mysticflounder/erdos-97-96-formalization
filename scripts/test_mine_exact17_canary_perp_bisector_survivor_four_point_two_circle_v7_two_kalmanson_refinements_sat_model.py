from __future__ import annotations

import mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_v7_two_kalmanson_refinements_sat_model as miner
import pytest
import run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v7_two_kalmanson_refinements_sat_portfolio as runner


def test_v7_miner_is_offline_and_bound_to_the_v7_runner() -> None:
    miner.validate_committed_dependencies()
    assert miner._BASE.runner is runner
    assert miner.MINER_VERSION == "7"
    assert "v7" in miner.MINER_NAME
    assert "v7" in miner.MINER_SCHEMA
    assert "v7" in miner.VERIFICATION_SCHEMA
    assert miner._BASE.NUM_VARIABLES == 308
    assert miner._BASE.NUM_CLAUSES == 7_409_816


def test_v7_miner_preserves_the_authenticated_scanner_inventory() -> None:
    assert miner.SOURCE_VALID_FAMILIES == (
        "formalized-core-bank",
        "perpendicular-bisector-equality-component",
        "two-kalmanson-cancellation",
    )
    assert miner.SCANNER_DEPENDENCIES
    assert miner._BASE.SCANNER_DEPENDENCIES is miner.SCANNER_DEPENDENCIES


def test_v7_miner_help_is_v7_owned(capsys: pytest.CaptureFixture[str]) -> None:
    assert miner.main(["--help"]) == 0
    rendered = capsys.readouterr().out
    for required in ("V7", "7,409,816", "308", "76"):
        assert required in rendered
    for stale in ("V5", "7,409,786"):
        assert stale not in rendered
