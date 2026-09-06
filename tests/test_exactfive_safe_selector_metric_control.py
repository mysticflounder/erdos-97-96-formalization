# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Regression checks for the explicitly nonplanar metric control."""

from fractions import Fraction

import pytest

from scripts import check_exactfive_safe_selector_metric_control as control
from scripts.check_exactfive_safe_selector_metric_control import distance_matrix, verify


def test_exact_control_and_explicit_geometric_rejection():
    result = verify()
    assert result["proper_nonempty_subsets_checked"] == 8190
    assert result["actual_sources_checked"] == 13
    assert result["fresh"] == [8, 9, 10]
    assert result["safe_selector_in_marked_relaxation"] is False
    assert result["source_radius_drop_holds"] is False
    assert result["planar_source_realized"] is False
    violation = result["ptolemy_violation"]
    assert Fraction(violation["left"]) > Fraction(violation["right"])


def test_asymmetry_is_rejected():
    matrix = [list(row) for row in distance_matrix()]
    matrix[0][1] += Fraction(1, 100)
    with pytest.raises(AssertionError, match="symmetry"):
        verify(matrix)


def test_triangle_failure_is_rejected():
    matrix = [list(row) for row in distance_matrix()]
    matrix[0][1] = matrix[1][0] = Fraction(10)
    with pytest.raises(AssertionError, match="triangle inequality"):
        verify(matrix)


def test_nonminimal_metric_is_rejected():
    matrix = [[Fraction(i != j) for j in range(13)] for i in range(13)]
    with pytest.raises(AssertionError, match="metric cardinal minimality"):
        verify(matrix)


def test_invalid_actual_center_is_rejected(monkeypatch):
    monkeypatch.setattr(control, "H", (0, *control.H[1:]))
    with pytest.raises(AssertionError, match="actual center membership"):
        verify()
