"""Tests for the source-backed strict-Kalmanson known-clause census."""

from __future__ import annotations

import hashlib
import json
import math
import subprocess
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import generate_strict_kalmanson_known_clause_census as mod

REPO_ROOT = Path(__file__).resolve().parents[1]


def test_classifier_evidence_digest_is_pinned() -> None:
    raw = (REPO_ROOT / mod.THREE_SHELL_CLASSIFICATION_JSON).read_bytes()
    assert len(raw) == mod.THREE_SHELL_CLASSIFICATION_JSON_BYTES == 7_337
    expected = "7a8bd4b51649a54c76d049e7edb7e8c77beeab575c3f7d31f0dbf328a702909f"
    assert mod.THREE_SHELL_CLASSIFICATION_JSON_SHA256 == expected
    assert hashlib.sha256(raw).hexdigest() == expected


def test_schema_inventory_is_the_40_non_duplicate_mixed_arity_theorems() -> None:
    schemas = mod.parse_three_equality_schemas()
    assert len(schemas) == 40
    assert {arity: sum(schema.arity == arity for schema in schemas) for arity in (4, 5, 6)} == {
        4: 4,
        5: 17,
        6: 19,
    }
    assert all(not schema.name.endswith("_cyclicShift") for schema in schemas)
    assert len({schema.name for schema in schemas}) == 40
    assert all(schema.atoms == tuple(sorted(set(schema.atoms))) for schema in schemas)


@pytest.mark.parametrize("n, expected", [(10, 9_114), (11, 17_952)])
def test_three_equality_instantiation_counts(n: int, expected: int) -> None:
    clauses = mod.three_equality_clauses(n)
    assert len(clauses) == expected
    assert len(set(clauses)) == expected


def test_complete_berge_has_40_classifier_authenticated_full_support_patterns() -> None:
    derived = mod.complete_berge_patterns()
    classified = mod.classification_complete_berge_patterns()
    assert derived == classified
    assert len(derived) == 40
    assert all(
        {label for equality in pattern for label in equality} == set(range(6))
        for pattern in derived
    )
    assert all(len(pattern) == 3 for pattern in derived)


def test_complete_berge_has_eight_cyclic_orbits() -> None:
    orbits = mod.complete_berge_rotation_orbits()
    assert len(orbits) == 8
    assert sorted(map(len, orbits)) == [2, 2, 6, 6, 6, 6, 6, 6]
    assert set().union(*(set(orbit) for orbit in orbits)) == set(
        mod.complete_berge_patterns()
    )


@pytest.mark.parametrize("n, expected", [(10, 8_400), (11, 18_480)])
def test_complete_berge_instantiation_counts(n: int, expected: int) -> None:
    clauses = mod.complete_berge_clauses(n)
    assert len(clauses) == expected == 40 * math.comb(n, 6)
    assert len(set(clauses)) == expected


@pytest.mark.parametrize("n, expected", [(10, 3_990), (11, 8_778)])
def test_complete_berge_overlap_with_broader_mixed_arity_family(
    n: int, expected: int
) -> None:
    mixed = set(mod.three_equality_clauses(n))
    berge = set(mod.complete_berge_clauses(n))
    assert len(mixed & berge) == expected == 19 * math.comb(n, 6)


@pytest.mark.parametrize("n, expected", [(10, 840), (11, 1_320)])
def test_shared_pair_patterns_and_counts(n: int, expected: int) -> None:
    assert mod.SHARED_PAIR_PATTERNS == (
        ((0, 2), (0, 3), (1, 2), (1, 3)),
        ((0, 1), (0, 2), (3, 1), (3, 2)),
        ((1, 0), (1, 3), (2, 0), (2, 3)),
        ((2, 0), (2, 1), (3, 0), (3, 1)),
    )
    assert len(mod.SHARED_PAIR_THEOREMS) == len(mod.SHARED_PAIR_PATTERNS) == 4
    clauses = mod.shared_pair_clauses(n)
    assert len(clauses) == expected == 4 * math.comb(n, 4)
    assert len(set(clauses)) == expected


@pytest.mark.parametrize(
    "n,r,atom_count",
    [(10, 2, 18), (10, 3, 16), (11, 2, 20), (11, 3, 18)],
)
def test_complementary_arc_atom_sizes_and_dihedral_slices(
    n: int, r: int, atom_count: int
) -> None:
    template = mod.complementary_arc_template(n, r)
    orbit = mod.complementary_arc_orbit(n, r)
    assert len(template) == atom_count
    assert len(orbit["rotations"]) == len(set(orbit["rotations"])) == n
    assert len(orbit["reflections"]) == len(set(orbit["reflections"])) == n
    assert len(set(orbit["rotations"] + orbit["reflections"])) == 2 * n


@pytest.mark.parametrize("n, expected", [(10, 40), (11, 44)])
def test_complementary_arc_total_counts(n: int, expected: int) -> None:
    clauses = mod.complementary_arc_clauses(n)
    assert len(clauses) == len(set(clauses)) == expected


@pytest.mark.parametrize(
    "n,schema_count,berge_count,shared_count,arc_count,union_count,overlap_count",
    [
        (10, 9_114, 8_400, 840, 40, 14_404, 3_990),
        (11, 17_952, 18_480, 1_320, 44, 29_018, 8_778),
    ],
)
def test_census_counts_and_cross_family_overlap(
    n: int,
    schema_count: int,
    berge_count: int,
    shared_count: int,
    arc_count: int,
    union_count: int,
    overlap_count: int,
) -> None:
    census = mod.build_census(n)
    families = census["families"]
    assert families["three_equality_schemas"]["raw_count"] == schema_count
    assert families["complete_berge"]["raw_count"] == berge_count
    assert families["complete_berge"]["rotation_orbit_count"] == 8
    assert sorted(families["complete_berge"]["rotation_orbit_sizes"]) == [
        2,
        2,
        6,
        6,
        6,
        6,
        6,
        6,
    ]
    assert families["shared_pair_nonalternation"]["raw_count"] == shared_count
    assert families["complementary_arc"]["raw_count"] == arc_count
    assert census["union"]["distinct_count"] == union_count
    assert census["union"]["known_overlap_count"] == overlap_count
    pairwise = census["union"]["pairwise_overlap_counts"]
    assert pairwise["three_equality_schemas__complete_berge"] == overlap_count
    assert {
        count
        for pair, count in pairwise.items()
        if pair != "three_equality_schemas__complete_berge"
    } == {0}


def test_n11_gap_is_arithmetic_only_and_provenance_warning_is_explicit() -> None:
    census = mod.build_census(11)
    comparison = census["announced_n11_base_comparison"]
    assert comparison["announced_count"] == 42_504
    assert comparison["known_union_count"] == 29_018
    assert comparison["arithmetic_difference"] == 13_486
    assert "arithmetic comparison only" in comparison["claim_scope"]
    assert "NOT authenticated" in census["missing_base_provenance"]
    assert "not labelled complete Berge" in census["families"]["three_equality_schemas"][
        "claim_scope"
    ]
    berge = census["families"]["complete_berge"]
    assert berge["classification_document_path"] == str(
        mod.THREE_SHELL_CLASSIFICATION_DOC
    )
    assert berge["classification_json_path"] == str(mod.THREE_SHELL_CLASSIFICATION_JSON)
    assert "primitive producer encoding" in berge["claim_scope"]


@pytest.mark.parametrize(
    "n,berge_count,shared_count,arc_count,total",
    [(10, 8_400, 840, 40, 9_280), (11, 18_480, 1_320, 44, 19_844)],
)
def test_announced_baseline_semantic_reconstruction_ledger(
    n: int,
    berge_count: int,
    shared_count: int,
    arc_count: int,
    total: int,
) -> None:
    ledger = mod.build_census(n)["announced_baseline_semantic_reconstruction"]
    assert ledger["family_distinct_counts"] == {
        "complete_berge": berge_count,
        "shared_pair_nonalternation": shared_count,
        "complementary_arc": arc_count,
    }
    assert ledger["raw_count"] == ledger["distinct_count"] == total
    assert ledger["known_overlap_count"] == 0
    assert "original primitive encoding" in ledger["claim_scope"]
    assert "reflected-arc Lean transport" in ledger["claim_scope"]
    if n == 11:
        assert ledger["announced_count"] == 42_504
        assert ledger["arithmetic_remainder"] == 22_660
    else:
        assert "announced_count" not in ledger
        assert "arithmetic_remainder" not in ledger


def test_retained_n11_survivor_matches_no_known_clause() -> None:
    rows = json.loads(
        (REPO_ROOT / mod.RETAINED_N11_SURVIVOR).read_text(encoding="utf-8")
    )["rows"]
    all_known = set(mod.three_equality_clauses(11))
    all_known.update(mod.complete_berge_clauses(11))
    all_known.update(mod.shared_pair_clauses(11))
    all_known.update(mod.complementary_arc_clauses(11))
    assert mod.matched_clauses(all_known, rows) == []
    assert mod.build_census(11)["retained_survivor"]["matched_known_clause_count"] == 0


def test_cli_defaults_to_n11_and_emits_only_one_json_document() -> None:
    completed = subprocess.run(
        [sys.executable, str(REPO_ROOT / "scripts/generate_strict_kalmanson_known_clause_census.py")],
        cwd=REPO_ROOT,
        check=True,
        capture_output=True,
        text=True,
    )
    payload = json.loads(completed.stdout)
    assert payload["schema"] == mod.SCHEMA_VERSION
    assert payload["n"] == 11
    assert payload["union"]["distinct_count"] == 29_018
    assert payload["union"]["claim_scope"].startswith("expanded distinct union")
    baseline = payload["announced_baseline_semantic_reconstruction"]
    assert baseline["distinct_count"] == 19_844
    assert baseline["arithmetic_remainder"] == 22_660
    assert payload["families"]["complete_berge"]["pattern_count"] == 40
    assert payload["retained_survivor"]["matched_known_clause_count"] == 0
    assert len(completed.stdout.splitlines()) == 1
    assert "inventory" not in completed.stdout
    assert "patterns_by_role" not in completed.stdout
    assert "template_atoms" not in completed.stdout
    assert completed.stderr == ""
