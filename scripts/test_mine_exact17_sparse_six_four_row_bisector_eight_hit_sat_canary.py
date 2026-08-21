from __future__ import annotations

import json
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from scripts import (
    mine_exact17_sparse_six_four_row_bisector_eight_hit_sat_canary as mine,
)

EXPECTED_REVERSE_BISECTOR_HITS = frozenset(
    {(3, 6), (3, 8), (6, 4), (6, 8), (8, 4), (8, 6)}
)
EXPECTED_REVERSE_BISECTOR_CLAUSES = frozenset(
    {
        frozenset({-308, -232, -223, -218, -206, -31, -28}),
        frozenset({-308, -143, -141, -111, -107, -60, -58}),
        frozenset({-307, -232, -223, -167, -155, -31, -28}),
        frozenset({-307, -143, -141, -111, -107, -60, -58}),
    }
)


def authenticated_model() -> dict:
    return json.loads(mine.MODEL_ARTIFACT.read_text())


def test_finalized_identity_is_pinned() -> None:
    assert mine.JOB_ID == "07e9d5ed-5856-4b17-8990-cd53fd360634"
    assert mine.CNF_SHA256 == (
        "c28a8b077eb4750be1f54606cc2345098a8af0aafd414ea404ae06f842c920d5"
    )
    assert mine.MODEL_SHA256 == (
        "49213232c5fafd9482eb3fe0f808896e95e529c32b96685f2e45f70d443bbb2a"
    )
    assert mine.CNF_CLAUSES == 7_409_267
    assert mine.CNF_BYTES == 346_273_811
    assert mine.SOURCE_CNF.stat().st_size == mine.CNF_BYTES


def test_checkpoint_contract_is_exact() -> None:
    checkpoint = json.loads(mine.CHECKPOINT.read_text())
    mine.validate_checkpoint(checkpoint)
    assert checkpoint["owned_paths"] == [
        "scripts/mine_exact17_sparse_six_four_row_bisector_eight_hit_sat_canary.py",
        "scripts/test_mine_exact17_sparse_six_four_row_bisector_eight_hit_sat_canary.py",
    ]


def test_actual_selector_chooses_order_zero() -> None:
    values, decoded = mine.decode_model(authenticated_model())
    order_index, order = mine.selected_order_table(values)
    assert order_index == 0
    assert order == mine.ORDER_ZERO
    assert decoded["selected_order"] == list(mine.ORDER_ZERO)


@pytest.mark.parametrize("left,right", [(False, False), (True, True)])
def test_selector_fails_closed_unless_one_hot(left: bool, right: bool) -> None:
    values = {307: left, 308: right}
    with pytest.raises(mine.MineError, match="one-hot"):
        mine.selected_order_table(values)


def test_selector_one_uses_the_second_table() -> None:
    assert mine.selected_order_table({307: False, 308: True}) == (
        1,
        mine.ORDER_ONE,
    )


def test_eight_hit_bank_orbit_is_exact() -> None:
    assert mine.JUST_ADDED_SUPPORT == frozenset(
        {
            (0, 1),
            (0, 3),
            (3, 9),
            (3, 16),
            (8, 3),
            (8, 16),
            (16, 1),
            (16, 9),
        }
    )
    assert mine.JUST_ADDED_CLAUSE_SETS == frozenset(
        {
            frozenset({-308, -252, -244, -93, -86, -40, -35, -14, -8}),
            frozenset({-308, -254, -245, -203, -202, -49, -46, -12, -7}),
            frozenset({-307, -252, -244, -93, -86, -40, -35, -14, -8}),
            frozenset({-307, -254, -245, -203, -202, -49, -46, -12, -7}),
        }
    )


def test_reverse_bisector_is_minimized_and_oriented_from_actual_selector() -> None:
    values, _decoded = mine.decode_model(authenticated_model())
    order_index, order = mine.selected_order_table(values)
    summary, candidates = mine.build_candidates(values, order_index, order)
    assert summary["formalized_diagnostic_count"] == 8
    matches = [
        candidate
        for candidate in candidates
        if candidate["stage"]
        == "equality-convex-four-point-two-circle-bisector-order-reverse"
    ]
    assert len(matches) == 1
    candidate = matches[0]
    assert frozenset(map(tuple, candidate["support"])) == EXPECTED_REVERSE_BISECTOR_HITS
    assert frozenset(map(frozenset, candidate["clauses"])) == (
        EXPECTED_REVERSE_BISECTOR_CLAUSES
    )
    assert [-307, -143, -141, -111, -107, -60, -58] in candidate["clauses"]


def test_minimized_reverse_bisector_needs_every_hit() -> None:
    values, _decoded = mine.decode_model(authenticated_model())
    _order_index, order = mine.selected_order_table(values)
    rows = tuple(
        mine.producer_bank.MetricRow(
            center,
            tuple(point for point in range(17) if values[1 + 17 * center + point]),
            True,
        )
        for center in range(17)
    )
    record = next(
        record
        for record in mine.producer_bank.scan_all_formalized_cores(rows, 17, order)
        if record["stage"]
        == "equality-convex-four-point-two-circle-bisector-order-reverse"
    )
    predicate = mine._core_predicate(record)
    assert predicate(mine._rows_from_hits(EXPECTED_REVERSE_BISECTOR_HITS))
    for hit in EXPECTED_REVERSE_BISECTOR_HITS:
        assert not predicate(
            mine._rows_from_hits(EXPECTED_REVERSE_BISECTOR_HITS - {hit})
        )


def test_candidate_clause_is_falsified_by_the_authenticated_model() -> None:
    values, _decoded = mine.decode_model(authenticated_model())
    clause = frozenset({-307, -143, -141, -111, -107, -60, -58})
    assert not any(values[abs(literal)] == (literal > 0) for literal in clause)
