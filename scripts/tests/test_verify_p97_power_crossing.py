"""Mutation tests for the exact P97 power-crossing control."""

from __future__ import annotations

import copy
import json
from fractions import Fraction
from pathlib import Path

import pytest

from scripts.verify_p97_power_crossing import validate_control, verify_regular11

CERTIFICATE = Path(__file__).parents[2] / "certificates/p97_power_crossing_control.json"


def _certificate() -> dict:
    with CERTIFICATE.open(encoding="utf-8") as stream:
        return json.load(stream)


def test_regular11_has_distinct_centers_and_full_fibers() -> None:
    report = verify_regular11()
    assert report["ok"]
    assert report["center_table"] == [[7, 3, 10], [2, 9, 5], [8, 4, 0]]
    assert len(report["distinct_centers"]) == 9
    assert len(set(report["distinct_centers"])) == 9
    assert report["full_two_point_fibers"] is True
    assert report["incidence_subdivision"]["edges"] == 18


def test_positive_control() -> None:
    report = validate_control(_certificate())
    assert report["ok"]
    assert report["orientation_count"] == 560
    assert len(report["negative_witness_indices"]) >= 2
    assert all(value == Fraction(0) for value in report["power_identity_residuals"])


@pytest.mark.parametrize("mutation", ["coordinate", "float_coordinate", "cyclic_order", "support", "radius", "same_edge"])
def test_control_rejects_mutations(mutation: str) -> None:
    data = _certificate()
    mutated = copy.deepcopy(data)
    if mutation == "coordinate":
        mutated["points"][0][0] = "0"
    elif mutation == "float_coordinate":
        mutated["points"][0][0] = float(Fraction(mutated["points"][0][0]))
    elif mutation == "cyclic_order":
        mutated["ccw_order"][0], mutated["ccw_order"][1] = mutated["ccw_order"][1], mutated["ccw_order"][0]
    elif mutation == "support":
        original = mutated["rows"][0]["support"][0]
        replacement = next(i for i in range(16) if i not in mutated["rows"][0]["support"])
        mutated["rows"][0]["support"][0] = replacement if replacement != original else (original + 1) % 16
    elif mutation == "radius":
        mutated["rows"][0]["radius_sq"] = str(Fraction(mutated["rows"][0]["radius_sq"]) + 1)
    else:
        mutated["crossing_edges"] = [mutated["crossing_edges"][0], mutated["crossing_edges"][0]]
    with pytest.raises(ValueError):
        validate_control(mutated)
