"""Tests for the strict-Kalmanson n=11 remainder audit."""

from __future__ import annotations

import audit_strict_kalmanson_n11_remainder as audit


def test_arithmetic_fingerprint_is_exact_but_unclaimed() -> None:
    payload = audit.build_audit()
    fingerprint = payload["arithmetic_fingerprint"]

    assert payload["reconstructed_baseline_count"] == 19_844
    assert payload["announced_minus_reconstructed_baseline"] == 22_660
    assert payload["current_known_union_count"] == 29_018
    assert payload["announced_minus_current"] == 13_486
    assert fingerprint["combination_count_11_choose_5"] == 462
    assert fingerprint["combination_count_11_choose_6"] == 462
    assert fingerprint["reconstructed_remainder"] == 22_660
    assert "identity only" in fingerprint["status"]


def test_four_equality_selected_row_orbits() -> None:
    payload = audit.build_audit()
    family = payload["four_equality_selected_rows"]
    records = {record["name"]: record for record in family["schemas"]}

    assert {name: record["pattern_count"] for name, record in records.items()} == {
        "C": 14,
        "D": 12,
        "E": 12,
        "F": 14,
        "G": 12,
        "H": 12,
        "I": 6,
        "J": 12,
        "K": 12,
        "L": 2,
        "M": 2,
    }
    assert family["distinct_clause_count"] == 46_266
    assert family["exact_current_overlap_count"] == 0
    assert family["family_block_count_sums_matching_expanded_difference"] == []


def test_four_role_k2_scope_is_split() -> None:
    payload = audit.build_audit()["four_role_k2"]

    assert payload["direct_clause_count"] == 330
    assert payload["direct_exact_current_overlap_count"] == 0
    assert payload["full_dihedral_pattern_count"] == 8
    assert payload["full_dihedral_clause_count"] == 2_640
    assert payload["full_dihedral_exact_current_overlap_count"] == 660
    assert "bookkeeping" in payload["full_dihedral_status"]
