from __future__ import annotations

import copy
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.global_confinement.metric_realizability_probe import MetricRow
from census.p97_search import phase3_ordered_metric_rules as ordered

ROWS = (
    MetricRow(3, (4, 6, 9, 10), False),
    MetricRow(4, (0, 3, 6, 7), False),
    MetricRow(7, (2, 4, 5, 11), False),
    MetricRow(11, (3, 5, 7, 10), False),
)
ORDER = (0, 10, 11, 1, 3, 4, 5, 6, 7, 2, 8, 9)
ROTATED_ORDER = ORDER[1:] + ORDER[:1]
UNCOVERED_ORDER = (7, 11, 0, 8, 5, 6, 3, 10, 4, 1, 9, 2)
KALMANSON_ROWS = (
    MetricRow(5, (0, 1, 4, 9), False),
    MetricRow(6, (0, 2, 4, 8), False),
    MetricRow(7, (0, 2, 6, 9), False),
    MetricRow(9, (0, 4, 5, 6), False),
)
KALMANSON_ORDERS = (
    ("order-00", (0, 8, 9, 1, 3, 4, 5, 2, 6, 7)),
    ("order-01", (0, 8, 9, 1, 3, 4, 5, 2, 7, 6)),
)


def test_direction_metadata_names_exact_lean_consumers() -> None:
    forward = ordered.detect_convex_rhombus(ROWS, 12, ORDER, orientation="forward")
    reverse = ordered.detect_convex_rhombus(ROWS, 12, ORDER, orientation="reverse")

    assert forward is not None
    assert forward["stage"] == ordered.FORWARD_STAGE
    assert forward["signed_area_case"] == "negative"
    assert forward["lean_theorem"].endswith("false_of_core_of_neg")
    assert reverse is not None
    assert reverse["stage"] == ordered.REVERSE_STAGE
    assert reverse["signed_area_case"] == "positive"
    assert reverse["lean_theorem"].endswith("false_of_core")


def test_record_is_deterministic_and_replays_every_compatible_order() -> None:
    orders = (("rotated", ROTATED_ORDER), ("canonical", ORDER))

    record = ordered.build_convex_rhombus_order_record(ROWS, 12, orders)
    reordered = ordered.build_convex_rhombus_order_record(
        ROWS, 12, tuple(reversed(orders))
    )

    assert record is not None
    assert record == reordered
    assert record["compatible_order_count"] == 2
    assert [entry["order_id"] for entry in record["order_coverage"]] == [
        "canonical",
        "rotated",
    ]
    assert len(record["closure_certificates"]) == 1
    assert {entry["lean_theorem"] for entry in record["order_coverage"]} == {
        "Problem97.Census554.ConvexRhombusCore.false_of_core_of_neg"
    }
    assert ordered.replay_convex_rhombus_order_record(ROWS, 12, orders, record)


def test_record_requires_exhaustive_coverage_and_rejects_mutation() -> None:
    assert (
        ordered.build_convex_rhombus_order_record(
            ROWS,
            12,
            (("covered", ORDER), ("uncovered", UNCOVERED_ORDER)),
        )
        is None
    )
    record = ordered.build_convex_rhombus_order_record(ROWS, 12, (("covered", ORDER),))
    assert record is not None
    mutated = copy.deepcopy(record)
    mutated["order_coverage"][0]["lean_theorem"] = (
        "Problem97.Census554.ConvexRhombusCore.false_of_core"
    )
    mutated["order_coverage_sha256"] = ordered._sha256_json(mutated["order_coverage"])
    with pytest.raises(
        ordered.OrderedMetricRuleError,
        match="lean_theorem metadata mismatch",
    ):
        ordered.replay_convex_rhombus_order_record(
            ROWS, 12, (("covered", ORDER),), mutated
        )


def test_kalmanson_record_replays_order_specific_roles_under_one_row_union() -> None:
    minimized = ordered.minimize_selected_row_kalmanson_rows(
        KALMANSON_ROWS, 10, KALMANSON_ORDERS
    )

    assert minimized is not None
    selected, metadata = minimized
    assert selected == KALMANSON_ROWS
    assert metadata["retained_row_count"] == 4
    record = ordered.build_selected_row_kalmanson_order_record(
        selected, 10, KALMANSON_ORDERS
    )
    assert record is not None
    assert record["lean_theorem"] == (
        "Problem97.CapCrossingKalmansonBridge."
        "false_of_selected_rows_in_five_ccw_order"
    )
    assert {
        tuple(entry["row_centers"][role] for role in ordered.KALMANSON_ROW_ROLES)
        for entry in record["order_coverage"]
    } == {(9, 6, 7), (7, 9, 5)}
    assert {
        tuple(entry["core"][role] for role in ordered.KALMANSON_CORE_ROLES)
        for entry in record["order_coverage"]
    } == {
        (6, 7, 9, 4, 2),
        (9, 5, 7, 6, 0),
    }
    assert ordered.replay_selected_row_kalmanson_order_record(
        selected, 10, tuple(reversed(KALMANSON_ORDERS)), record
    )


def test_kalmanson_order_position_index_matches_direct_detector() -> None:
    index = ordered.KalmansonOrderPositionIndex.from_rows(
        KALMANSON_ROWS, 10
    )
    for row_mask, rows in (
        ((1 << len(KALMANSON_ROWS)) - 1, KALMANSON_ROWS),
        ((1 << (len(KALMANSON_ROWS) - 1)) - 1, KALMANSON_ROWS[:-1]),
    ):
        for _order_id, order in KALMANSON_ORDERS:
            assert index.detect(row_mask, order) == (
                ordered.detect_selected_row_kalmanson(rows, 10, order)
            )


def test_kalmanson_record_fails_if_union_omits_an_order_specific_row() -> None:
    assert (
        ordered.build_selected_row_kalmanson_order_record(
            KALMANSON_ROWS[:-1], 10, KALMANSON_ORDERS
        )
        is None
    )
