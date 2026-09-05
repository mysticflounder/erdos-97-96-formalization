"""Focused tests for the bounded exact-13 affine miner."""

from __future__ import annotations

import copy
import json
from pathlib import Path

import mine_exact13_affine_relations as subject
import pytest

ROOT = Path(__file__).resolve().parents[1]
REGRESSION = ROOT / "docs/audits/2026-09-05-wave6-live-transfer.json"


def test_wave6_regression_has_expected_rows_components_and_certificates() -> None:
    result = subject.mine(json.loads(REGRESSION.read_text()))
    assert result["row_count"] == 14
    assert result["equality_components"] == 36
    assert result["affine_relation_count"] == 8
    assert result["collision"]["support"] == [0, 2]
    assert len(result["collinearity"]["support"]) == 3
    assert subject.verify(result)


def test_rows_sharing_two_labels_do_not_merge_independent_radii() -> None:
    result = subject.mine(
        [
            {"center": 0, "support": [1, 2, 3, 4]},
            {"center": 5, "support": [1, 2, 6, 7]},
        ]
    )
    assert result["affine_relation_count"] == 0
    assert result["equality_components"] == 72


def test_collision_and_collinearity_are_exact_integer_combinations() -> None:
    result = subject.mine(json.loads(REGRESSION.read_text()))
    for name, size in (("collision", 2), ("collinearity", 3)):
        certificate = result[name]
        assert certificate["kind"] == name
        assert len(certificate["support"]) == size
        assert subject.verify_certificate(certificate, result["relations"], result["rows"])
        assert all(isinstance(value, int) for value in certificate["coefficients"])


def test_malformed_atoms_and_coefficients_are_rejected() -> None:
    result = subject.mine(json.loads(REGRESSION.read_text()))
    bad_atoms = copy.deepcopy(result)
    bad_atoms["relations"][0]["supporting_atoms"][0]["support"][0] = 12
    with pytest.raises(ValueError):
        subject.verify(bad_atoms)

    bad_coefficients = copy.deepcopy(result)
    bad_coefficients["collision"]["coefficients"][0] += 1
    with pytest.raises(ValueError):
        subject.verify(bad_coefficients)

    for field, replacement in (("relations", []), ("affine_relation_count", 0)):
        tampered = copy.deepcopy(result)
        tampered[field] = replacement
        with pytest.raises(ValueError):
            subject.verify(tampered)

    bad_cross_edges = copy.deepcopy(result)
    bad_cross_edges["relations"][0]["cross_edges"] = []
    with pytest.raises(ValueError):
        subject.verify(bad_cross_edges)


def test_no_relation_returns_honest_none_certificates() -> None:
    result = subject.mine(
        [
            {"id": "a", "center": 0, "support": [1, 2, 3, 4]},
            {"id": "b", "center": 5, "support": [6, 7, 8, 9]},
        ]
    )
    assert result["relations"] == []
    assert result["collision"] is None
    assert result["collinearity"] is None
    assert subject.verify(result)
