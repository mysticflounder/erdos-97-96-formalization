# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.

from __future__ import annotations

import itertools
import json
import sys
from fractions import Fraction
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))
import audit_aligned_p5_apex_metric as apex_metric
import audit_aligned_p5_row_requirements as subject

APEX_REPORT = Path(__file__).resolve().parents[1] / "docs/audits/2026-09-06-native-card11-aligned-p5-apex-metric.json"


@pytest.fixture(scope="module")
def clauses() -> list[tuple[int, ...]]:
    return subject.read_formula()


def row_clause(center: int) -> tuple[int, ...]:
    return tuple(1 + 11 * center + point for point in range(11) if point != center)[:7]


def four_row_model(dropped: set[int] | None = None) -> list[int]:
    dropped = dropped or set()
    true_literals: list[int] = []
    for center in range(11):
        if center in dropped:
            continue
        points = [point for point in range(11) if point != center][:4]
        true_literals.extend(1 + 11 * center + point for point in points)
    return true_literals


def test_real_formula_has_120_distinct_at_least_four_clauses_per_center(clauses) -> None:
    counts = {center: 0 for center in range(11)}
    for clause in clauses:
        center = subject.row_requirement(clause)
        if center is not None:
            counts[center] += 1
    assert counts == {center: 120 for center in range(11)}
    subject.validate_requirements(clauses)

    expected = {
        center: {
            tuple(1 + 11 * center + point for point in points)
            for points in itertools.combinations(
                [point for point in range(11) if point != center], 7
            )
        }
        for center in range(11)
    }
    actual = {
        center: {
            tuple(sorted(clause))
            for clause in clauses
            if subject.row_requirement(clause) == center
        }
        for center in range(11)
    }
    assert actual == expected


def test_requirement_validation_rejects_a_missing_clause(clauses) -> None:
    index = next(i for i, clause in enumerate(clauses) if subject.row_requirement(clause) == 0)
    with pytest.raises(ValueError, match="row 0"):
        subject.validate_requirements(clauses[:index] + clauses[index + 1 :])


def test_guard_adds_only_the_center_activation_literal() -> None:
    row = row_clause(3)
    ordinary = (122, -200)
    guarded = subject.guarded_formula([row, ordinary])
    assert guarded[0] == (-(subject.NUM_VARS + 4), *row)
    assert guarded[1] == ordinary


def test_guard_rejects_a_row_clause_that_mentions_its_center() -> None:
    malformed = tuple(1 + 11 * 2 + point for point in range(7))
    with pytest.raises(ValueError, match="malformed row-existence clause"):
        subject.row_requirement(malformed)


def test_saved_sat_report_replays_model_and_decoded_rows() -> None:
    clauses = [row_clause(0), (2,)]
    dropped = [0]
    true_literals = [2, *four_row_model({0})]
    rows = subject.validate_model(clauses, dropped, true_literals)
    report = {
        "schema": subject.SCHEMA,
        "input_sha256": subject.CNF_SHA256,
        "queries": [
            {
                "status": "SAT",
                "dropped_centers": dropped,
                "true_literals": true_literals,
                "rows": rows,
            }
        ],
    }
    assert subject.check_report(report, clauses) == 1

    report["queries"][0]["rows"] = rows[:-1]
    with pytest.raises(ValueError, match="decoded row report mismatch"):
        subject.check_report(report, clauses)


def test_saved_report_rejects_unknown_status() -> None:
    report = {
        "schema": subject.SCHEMA,
        "input_sha256": subject.CNF_SHA256,
        "queries": [{"status": "MALFORMED"}],
    }
    with pytest.raises(ValueError, match="status"):
        subject.check_report(report, [])


def test_saved_report_rejects_empty_query_list() -> None:
    report = {
        "schema": subject.SCHEMA,
        "input_sha256": subject.CNF_SHA256,
        "queries": [],
    }
    with pytest.raises(ValueError, match="queries"):
        subject.check_report(report, [])


def test_apex_metric_parser_preserves_exact_rationals() -> None:
    names = ["d_0_1", "r_0"]
    values = apex_metric.parse_values("((d_0_1 (/ 7 3)) (r_0 (- (/ 5 2))))", names)
    assert values == {"d_0_1": Fraction(7, 3), "r_0": Fraction(-5, 2)}

    with pytest.raises(ValueError, match="malformed value list"):
        apex_metric.parse_values("((d_0_1 1))", names)


def test_corrupted_apex_metric_kalmanson_gap_is_rejected() -> None:
    report = json.loads(APEX_REPORT.read_text())
    values = {name: Fraction(value) for name, value in report["values"].items()}
    values[apex_metric.edge(0, 1)] += Fraction(1, 100)
    with pytest.raises(ValueError, match="Kalmanson gap failed"):
        apex_metric.replay(values)


def test_saved_perturbed_model_replays_radius_classes_and_ptolemy() -> None:
    report = json.loads(APEX_REPORT.read_text())
    perturbed = report["perturbed"]
    values = {name: Fraction(value) for name, value in perturbed["values"].items()}

    assert apex_metric.replay(values, Fraction(0)) == perturbed["replay"]
    assert apex_metric.replay_radius_constraints(values) == perturbed["radius_constraints"]
    assert apex_metric.ptolemy_failure(values) == perturbed["ptolemy_failure"]

    base = {name: Fraction(value) for name, value in report["values"].items()}
    assert values[apex_metric.edge(0, 4)] == base[apex_metric.edge(0, 4)] + Fraction(1, 100)
    assert values[apex_metric.edge(8, 10)] == base[apex_metric.edge(8, 10)] + Fraction(1, 100)
