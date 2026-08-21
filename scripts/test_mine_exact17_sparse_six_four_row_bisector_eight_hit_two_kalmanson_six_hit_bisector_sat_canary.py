# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under the Apache License 2.0.

from __future__ import annotations

import importlib.util
import json
from pathlib import Path

import pytest

SCRIPT = Path(__file__).with_name(
    "mine_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_"
    "six_hit_bisector_sat_canary.py"
)
SPEC = importlib.util.spec_from_file_location("six_hit_bisector_canary_mine", SCRIPT)
assert SPEC is not None and SPEC.loader is not None
mine = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(mine)


def authenticated_model() -> dict[str, object]:
    return json.loads(mine.MODEL_ARTIFACT.read_text())


def test_identity_pins_are_exact() -> None:
    assert mine.JOB_ID == "d757efae-3b3b-4507-99dc-937b7f84d4c2"
    assert mine.TERMINAL_RECORD_SHA256 == (
        "f6c684f54b096619c251ff8ebd9f81a03c37feb6dc241e6abc60ce476100bdcd"
    )
    assert mine.SEAL_SHA256 == (
        "149122371306f3dfe9230b1f9a96e10f884ca521e4c4c1fd5b84a1be005a60ea"
    )
    assert mine.CNF_SHA256 == (
        "ce4be279f8eb07d941631e015f3dd629567270dee108e79757bed4a43b79ff3a"
    )
    assert mine.MODEL_SHA256 == (
        "37a57fbc600ec68a77b1477790fa6846289c226db6d36f2416b1d4e316154a1f"
    )
    assert mine.CNF_CLAUSES == 7_409_271
    assert mine.CNF_BYTES == 346_273_951
    assert mine.SOURCE_CNF.stat().st_size == mine.CNF_BYTES


def test_checkpoint_contract_is_exact() -> None:
    checkpoint = json.loads(mine.CHECKPOINT.read_text())
    mine.validate_checkpoint(checkpoint)
    assert checkpoint["owned_paths"] == [
        "scripts/mine_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_six_hit_bisector_sat_canary.py",
        "scripts/test_mine_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_six_hit_bisector_sat_canary.py",
    ]


def test_six_hit_bank_orbit_is_exact() -> None:
    assert mine.JUST_ADDED_SUPPORT == frozenset(
        {(5, 14), (5, 15), (14, 4), (14, 15), (15, 14), (15, 4)}
    )
    assert mine.JUST_ADDED_CLAUSE_SETS == frozenset(
        {
            frozenset({-307, -155, -167, -28, -31, -223, -232}),
            frozenset({-307, -60, -58, -141, -143, -111, -107}),
            frozenset({-308, -206, -218, -28, -31, -223, -232}),
            frozenset({-308, -60, -58, -141, -143, -111, -107}),
        }
    )


def test_terminal_model_decodes_to_source_shape() -> None:
    values, decoded = mine.decode_model(authenticated_model())
    assert decoded["next_centers"] == [2]
    assert decoded["selected_order_index"] in (0, 1)
    assert all(len(support) == 4 for support in decoded["rows"].values())
    assert len(values) == mine.VARIABLES


@pytest.mark.parametrize("left,right", [(False, False), (True, True)])
def test_selector_fails_closed_unless_one_hot(left: bool, right: bool) -> None:
    with pytest.raises(mine.MineError, match="one-hot"):
        mine.selected_order_table({307: left, 308: right})


def test_custody_authenticates_terminal() -> None:
    with mine.prep.DescriptorCustody(mine.ROOT) as custody:
        checkpoint_sha = mine._validate_checkpoint(custody)
        portfolio = mine._validate_portfolio_source(custody)
        manifests = mine._validate_manifests(custody)
        model, journal, artifacts = mine._validate_journal(custody, manifests["wave"])
        assert checkpoint_sha == mine.CHECKPOINT_SHA256
        assert portfolio["run_manifest_sha256"] == mine.PORTFOLIO_RUN_SHA256
        assert manifests["result"] == mine.CANARY_RESULT_SHA256
        assert journal["journal"] == mine.JOURNAL_SHA256
        assert model["job_id"] == mine.JOB_ID
        assert artifacts["model"] == mine.MODEL_SHA256


def test_replay_checks_every_clause() -> None:
    values, _decoded = mine.decode_model(authenticated_model())
    order_index, order = mine.selected_order_table(values)
    _summary, candidates = mine.build_candidates(values, order_index, order)
    replay = mine.replay_and_classify_cnf(
        mine.SOURCE_CNF.read_bytes(), values, candidates
    )
    assert replay["satisfies_all"] is True
    assert replay["clauses_checked"] == 7_409_271
    assert replay["just_added_six_hit_bisector_orbit_multiplicities"] == [1, 1, 1, 1]


def test_terminal_journal_record_count_is_pinned() -> None:
    assert mine.mine.__globals__["JOURNAL_SHA256"] == mine.JOURNAL_SHA256
    source = mine.mine.__code__
    assert source is not None
    with mine.prep.DescriptorCustody(mine.ROOT) as custody:
        manifests = mine._validate_manifests(custody)
        _model, journal, _artifacts = mine._validate_journal(custody, manifests["wave"])
    assert journal["seal"]["record_count"] == 10


def test_wave_only_mine_finds_eight_existing_theorem_occurrences() -> None:
    values, _decoded = mine.decode_model(authenticated_model())
    order_index, order = mine.selected_order_table(values)
    summary, candidates = mine.build_candidates(values, order_index, order)
    assert summary["source_valid_candidate_count"] == 8
    assert {candidate["stage"] for candidate in candidates} == {
        "equality-convex-two-kalmanson-cancellation"
    }
    assert all(candidate["source_valid"] for candidate in candidates)
    assert all(
        candidate["validation"]
        == {"lean_occurrence_check": True, "paired_forward_reverse_replay": True}
        for candidate in candidates
    )
    assert candidates[0]["support"] == [
        [0, 4],
        [0, 6],
        [1, 4],
        [1, 14],
        [4, 2],
        [4, 14],
        [14, 2],
        [14, 6],
    ]


def test_main_fails_closed_when_output_already_exists(tmp_path: Path) -> None:
    output = tmp_path / "mine"
    output.mkdir()
    with pytest.raises(mine.MineError, match="already exists"):
        mine.mine(output_root=output)
