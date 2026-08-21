# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under the Apache License 2.0.

from __future__ import annotations

import importlib.util
import json
from pathlib import Path

import pytest

SCRIPT = Path(__file__).with_name(
    "mine_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_"
    "six_hit_bisector_canary_two_kalmanson_model_refinements_sat_canary.py"
)
SPEC = importlib.util.spec_from_file_location("model_refinement_canary_mine", SCRIPT)
assert SPEC is not None and SPEC.loader is not None
mine = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(mine)


def authenticated_model() -> dict[str, object]:
    return json.loads(mine.MODEL_ARTIFACT.read_text())


def test_identity_pins_are_exact() -> None:
    assert mine.JOB_ID == "8481882c-48a5-4041-bd49-c82610631e17"
    assert mine.TERMINAL_RECORD_SHA256 == (
        "a9c399a82cef684e75abba9b5acbca459566956cb7aa2923e7cb954d3f6c0911"
    )
    assert mine.SEAL_SHA256 == (
        "abcedb190e2a527103d86c7feb6440ba21ba64d60e3ad4c067802cf574df3b4a"
    )
    assert mine.CNF_SHA256 == (
        "6fcb5669e16926406d64c96d9bfc85818216ed271c74fca35aa66b83d9520fd4"
    )
    assert mine.MODEL_SHA256 == (
        "c2a563d1d08e471694d46df7ffc081aec2f8139376113c99504465482b985ce8"
    )
    assert mine.CNF_CLAUSES == 7_409_301
    assert mine.CNF_BYTES == 346_275_390
    assert mine.SOURCE_CNF.stat().st_size == mine.CNF_BYTES


def test_checkpoint_contract_is_exact_and_self_owning() -> None:
    checkpoint = json.loads(mine.CHECKPOINT.read_text())
    mine.validate_checkpoint(checkpoint)
    assert checkpoint["owned_paths"] == [
        ".codex/worktree-checkpoints/exact17-six-hit-bisector-canary-two-kalmanson-model-refinements-mine-20260821.json",
        "scripts/mine_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_six_hit_bisector_canary_two_kalmanson_model_refinements_sat_canary.py",
        "scripts/test_mine_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_six_hit_bisector_canary_two_kalmanson_model_refinements_sat_canary.py",
    ]


def test_full_bank_and_retained_production_suffix_are_distinct() -> None:
    assert len(mine.CANARY_OCCURRENCE_SUPPORTS) == 4
    assert len(mine.ORIGINAL_BANK_ORBIT_CLAUSES) == 16
    assert len(set(mine.ORIGINAL_BANK_ORBIT_CLAUSES)) == 16
    assert mine.RETAINED_SUFFIX_INDICES == (0, 1, 2, 3, 4, 6, 8, 10, 12)
    assert mine.PARENT_SUBSUMED_SUFFIX_INDICES == (5, 7, 9, 11, 13, 14, 15)
    assert mine.RETAINED_SUFFIX_INDEX_SET.isdisjoint(
        mine.PARENT_SUBSUMED_SUFFIX_INDEX_SET
    )
    assert (
        mine.RETAINED_SUFFIX_INDEX_SET | mine.PARENT_SUBSUMED_SUFFIX_INDEX_SET
        == set(range(16))
    )
    assert mine.JUST_ADDED_ORBIT_CLAUSES == tuple(
        mine.ORIGINAL_BANK_ORBIT_CLAUSES[index]
        for index in mine.RETAINED_SUFFIX_INDICES
    )


def test_terminal_model_decodes_to_source_shape() -> None:
    values, decoded = mine.decode_model(authenticated_model())
    assert decoded["next_centers"] == [2]
    assert decoded["selected_order_index"] == 0
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


def test_replay_checks_every_clause_and_suffix_inventory() -> None:
    values, _decoded = mine.decode_model(authenticated_model())
    order_index, order = mine.selected_order_table(values)
    _summary, candidates = mine.build_candidates(values, order_index, order)
    replay = mine.replay_and_classify_cnf(
        mine.SOURCE_CNF.read_bytes(), values, candidates
    )
    assert replay["satisfies_all"] is True
    assert replay["clauses_checked"] == 7_409_301
    exact = replay[
        "original_canary_two_kalmanson_model_refinement_orbit_exact_multiplicities"
    ]
    assert exact == [
        1 if index in mine.RETAINED_SUFFIX_INDEX_SET else 0 for index in range(16)
    ]
    assert replay["parent_subsumed_original_suffix_indices"] == list(
        mine.PARENT_SUBSUMED_SUFFIX_INDICES
    )
    assert (
        replay[
            "just_added_canary_two_kalmanson_model_refinement_retained_suffix_multiplicities"
        ]
        == [1] * 9
    )


def test_terminal_journal_record_count_is_pinned() -> None:
    assert mine.mine.__globals__["JOURNAL_SHA256"] == mine.JOURNAL_SHA256
    with mine.prep.DescriptorCustody(mine.ROOT) as custody:
        manifests = mine._validate_manifests(custody)
        _model, journal, _artifacts = mine._validate_journal(custody, manifests["wave"])
    assert journal["seal"]["record_count"] == 23


def test_wave_only_mine_scans_existing_bank_and_new_candidates() -> None:
    values, _decoded = mine.decode_model(authenticated_model())
    order_index, order = mine.selected_order_table(values)
    summary, candidates = mine.build_candidates(values, order_index, order)
    assert summary["source_valid_candidate_count"] == len(candidates) == 62
    assert all(candidate["source_valid"] for candidate in candidates)
    assert all(candidate["lean_consumer"] for candidate in candidates)
    assert [candidate["stage"] for candidate in candidates].count(
        "equality-convex-two-kalmanson-cancellation"
    ) == 56
    assert [candidate["stage"] for candidate in candidates].count(
        "equality-duplicate-center"
    ) == 1
    assert [candidate["stage"] for candidate in candidates].count(
        "equality-perpendicular-bisector-convex"
    ) == 1
    assert summary["source_unentitled_formalized_stage_counts"] == {
        "equality-exact-off-circle": 1
    }
    assert all(
        candidate["stage"] != "equality-exact-off-circle" for candidate in candidates
    )


def test_main_fails_closed_when_output_already_exists(tmp_path: Path) -> None:
    output = tmp_path / "mine"
    output.mkdir()
    with pytest.raises(mine.MineError, match="already exists"):
        mine.mine(output_root=output)
