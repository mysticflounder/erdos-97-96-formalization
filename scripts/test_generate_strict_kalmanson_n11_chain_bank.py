"""Focused tests for the six-role equilateral-chain motif orbit generator."""

from __future__ import annotations

import hashlib
import io
import json
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import generate_strict_kalmanson_n11_chain_bank as mod

REPO_ROOT = Path(__file__).resolve().parents[1]
SURVIVOR = REPO_ROOT / "certificates/p97_strict_kalmanson_n11_survivor.json"


def test_canonical_motif_has_the_twelve_required_directed_atoms() -> None:
    expected = {
        ("A", "B"),
        ("A", "C"),
        ("A", "D"),
        ("B", "A"),
        ("B", "C"),
        ("B", "F"),
        ("C", "A"),
        ("C", "D"),
        ("C", "E"),
        ("E", "C"),
        ("E", "D"),
        ("E", "F"),
    }
    observed = {
        (mod.ROLE_NAMES[center], mod.ROLE_NAMES[member])
        for center, member in mod.MOTIF_ATOMS
    }
    assert observed == expected
    assert len(mod.MOTIF_ATOMS) == len(set(mod.MOTIF_ATOMS)) == 12
    assert mod.SEMANTIC_SOURCE_THEOREM == (
        "Problem97.false_of_realizes_three_equilateral_chain"
    )


def test_role_automorphism_group_is_trivial() -> None:
    assert mod.motif_automorphisms() == ((0, 1, 2, 3, 4, 5),)
    assert mod.has_trivial_role_automorphism()
    assert mod.has_injective_clause_orbit()


@pytest.mark.parametrize("n, expected", [(6, 720), (7, 5_040), (11, 332_640)])
def test_expected_orbit_size_is_ordered_injection_count(n: int, expected: int) -> None:
    assert mod.expected_orbit_size(n) == expected


def test_small_complete_orbit_has_no_duplicate_clauses() -> None:
    clauses = list(mod.iter_clauses(7))
    assert len(clauses) == mod.expected_orbit_size(7)
    assert len(set(clauses)) == len(clauses)
    assert all(len(clause) == len(set(clause)) == 12 for clause in clauses)


def test_clause_for_documented_embedding_has_expected_atoms() -> None:
    embedding = (0, 1, 2, 6, 4, 10)
    clause = mod.clause_for_embedding(embedding)
    assert set(clause) == {
        (0, 1),
        (0, 2),
        (0, 6),
        (1, 0),
        (1, 2),
        (1, 10),
        (2, 0),
        (2, 4),
        (2, 6),
        (4, 2),
        (4, 6),
        (4, 10),
    }
    assert clause == tuple(sorted(clause))


def test_serialized_stream_is_versioned_and_digest_matches_written_bytes() -> None:
    output = io.BytesIO()
    summary = mod.stream_orbit(6, output)
    payload = output.getvalue()
    header = json.loads(payload.splitlines()[0])
    assert header["schema"] == mod.SERIALIZATION_SCHEMA
    assert header["n"] == 6
    assert summary["clause_count"] == 720
    assert summary["distinct_clause_count"] == 720
    assert summary["stream_bytes"] == len(payload)
    assert summary["stream_sha256"] == hashlib.sha256(payload).hexdigest()
    assert summary["stream_sha256"] == (
        "e49efaaf3fd7c31ea71ea6da8da9f7b089bc1bc3724968bd5d047dcdddc4759e"
    )


def test_n11_stream_digest_and_count_are_pinned() -> None:
    summary = mod.stream_orbit(11)
    assert summary["clause_count"] == 332_640
    assert summary["atoms_per_clause"] == 12
    assert summary["stream_bytes"] == 37_649_201
    assert summary["stream_sha256"] == (
        "e78e8db92ff880df312af4bab2bb1d89aed9d43d3cd51e42af1687de743b8925"
    )


def test_survivor_contains_exactly_the_four_audited_ordered_copies() -> None:
    document = json.loads(SURVIVOR.read_text(encoding="utf-8"))
    assert mod.find_motif_embeddings(document["rows"]) == [
        (0, 1, 2, 6, 4, 10),
        (3, 5, 7, 9, 8, 10),
        (6, 4, 2, 0, 1, 10),
        (9, 8, 7, 3, 5, 10),
    ]


def test_embedding_validation_and_small_rows() -> None:
    with pytest.raises(ValueError, match="distinct"):
        mod.clause_for_embedding((0, 1, 2, 3, 4, 4))
    with pytest.raises(ValueError, match="at least 6"):
        mod.expected_orbit_size(5)
    assert mod.find_motif_embeddings([[], [], [], [], []]) == []
    with pytest.raises(ValueError, match="out-of-range"):
        mod.find_motif_embeddings([[6], [], [], [], [], []])
