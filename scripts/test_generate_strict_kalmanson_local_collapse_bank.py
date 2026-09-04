from __future__ import annotations

import hashlib
import importlib.util
import json
import math
import sys
from collections import Counter
from pathlib import Path

import pytest

SCRIPT = Path(__file__).with_name(
    "generate_strict_kalmanson_local_collapse_bank.py"
)
sys.path.insert(0, str(SCRIPT.parent))
SPEC = importlib.util.spec_from_file_location("strict_kalmanson_local_bank", SCRIPT)
assert SPEC is not None and SPEC.loader is not None
producer = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = producer
SPEC.loader.exec_module(producer)

EXPECTED_CATALOG_SHA256 = (
    "b197f71c170d35f42c3deb9e881561647b1d43e94c160005a78f2dfbb01053bb"
)
EXPECTED_COUNT_MATCHED_CATALOG_SHA256 = (
    "24f9e0a6a5a028bd058a37b26eca5f558a6ef53ef944dcb6ce20b4d932ae56d1"
)
EXPECTED_COUNT_MATCHED_N11_P97MONOTONE_SHA256 = (
    "42ee48f37d5fb3f0fb4b47289730071fa068db2358e52d61bad200df183fcef6"
)
EXPECTED_COUNT_MATCHED_N12_P97MONOTONE_SHA256 = (
    "c829492de992b5b91cdf409fd17077a10defa68910843a0806c84926342b536b"
)


def test_minimal_catalog_counts_and_profiles() -> None:
    four = producer.enumerate_minimal_local_collapses(4)
    five = producer.enumerate_minimal_local_collapses(5)

    assert len(four) == 12
    assert len(five) == 190
    assert Counter(pattern.width for pattern in four) == {4: 4, 6: 8}
    assert Counter(pattern.width for pattern in five) == {8: 90, 10: 60, 11: 40}
    assert Counter(pattern.row_profile for pattern in four) == {
        (2, 2): 4,
        (2, 2, 2): 8,
    }
    assert Counter(pattern.row_profile for pattern in five) == {
        (2, 2, 2, 2): 90,
        (2, 2, 2, 2, 2): 30,
        (3, 2, 2, 2, 2): 40,
        (4, 2, 2, 2): 30,
    }


def test_every_generated_pattern_has_exact_support_and_is_minimal() -> None:
    for pattern in producer.candidate_catalog():
        assert producer.clause_support(pattern.atoms) == tuple(
            range(pattern.support_size)
        )
        assert pattern.collapsed == producer.collapsed_comparisons(
            pattern.support_size, pattern.atoms
        )
        assert pattern.collapsed
        assert producer.is_minimal_local_collapse(
            pattern.support_size, pattern.atoms
        )


def test_reduced_four_role_enumeration_matches_all_directed_atom_subsets() -> None:
    atoms = producer._directed_atoms(4)
    unrestricted = set()
    for mask in range(1, 1 << len(atoms)):
        clause = tuple(atom for bit, atom in enumerate(atoms) if mask & (1 << bit))
        if producer.is_minimal_local_collapse(4, clause):
            unrestricted.add(clause)

    reduced = {
        pattern.atoms for pattern in producer.enumerate_minimal_local_collapses(4)
    }
    assert reduced == unrestricted


def test_wave5_aggregate_forces_12_four_and_130_five_under_stated_model() -> None:
    non_berge_count = 145_860 - 40 * math.comb(12, 6)
    assert non_berge_count == 108_900
    assert producer.solve_two_support_histogram(
        n=12, record_count=142, lifted_count=non_berge_count
    ) == (12, 130)

    five = producer.enumerate_minimal_local_collapses(5)
    assert len(five) - 130 == 60
    assert sum(pattern.width == 10 for pattern in five) == 60

    matched = producer.count_matched_wave5_catalog()
    assert Counter(pattern.support_size for pattern in matched) == {4: 12, 5: 130}
    assert 10 not in {pattern.width for pattern in matched}
    matched_bytes = producer.serialize_catalog(matched)
    assert len(matched_bytes) == 28_612
    assert (
        hashlib.sha256(matched_bytes).hexdigest()
        == EXPECTED_COUNT_MATCHED_CATALOG_SHA256
    )


def test_count_matched_base_reproduces_wave4_and_wave5_aggregate_counts() -> None:
    catalog = producer.count_matched_wave5_catalog()

    local11 = producer.candidate_local_bank(11, catalog)
    berge11 = producer.complete_berge_bank(11)
    assert len(local11) == 64_020
    assert len(berge11) == 18_480
    assert not (set(local11) & set(berge11))
    bank11 = producer.count_matched_wave5_base_bank(11)
    assert len(bank11) == 82_500
    stream11 = producer.serialize_bank_p97monotone(11, bank11)
    assert len(stream11) == 2_242_441
    assert (
        hashlib.sha256(stream11).hexdigest()
        == EXPECTED_COUNT_MATCHED_N11_P97MONOTONE_SHA256
    )

    local12 = producer.candidate_local_bank(12, catalog)
    berge12 = producer.complete_berge_bank(12)
    assert len(local12) == 108_900
    assert len(berge12) == 36_960
    assert not (set(local12) & set(berge12))
    bank12 = producer.count_matched_wave5_base_bank(12)
    assert len(bank12) == 145_860
    stream12 = producer.serialize_bank_p97monotone(12, bank12)
    assert len(stream12) == 4_103_362
    assert (
        hashlib.sha256(stream12).hexdigest()
        == EXPECTED_COUNT_MATCHED_N12_P97MONOTONE_SHA256
    )
    assert hashlib.sha256(stream12).hexdigest() != (
        "bbd9707afc4e0d6ae91ee58b9f1a660a99505378902986a60cf77b0e43cb22b0"
    )


def test_candidate_bank_uses_increasing_subset_lifts_without_duplicates() -> None:
    catalog = producer.candidate_catalog()
    bank5 = producer.candidate_local_bank(5, catalog)
    assert len(bank5) == 12 * math.comb(5, 4) + 190 * math.comb(5, 5)
    assert len(bank5) == 250
    assert bank5 == tuple(sorted(set(bank5)))

    bank11 = producer.candidate_local_bank(11, catalog)
    assert len(bank11) == 12 * math.comb(11, 4) + 190 * math.comb(11, 5)
    assert len(bank11) == 91_740


def test_catalog_serialization_is_canonical_and_digest_pinned() -> None:
    payload = producer.serialize_catalog()
    lines = payload.splitlines()
    header = json.loads(lines[0])

    assert payload.endswith(b"\n")
    assert len(lines) == 203
    assert header == {
        "atom": "directed selected membership [center,member]",
        "claim_scope": (
            "independently enumerated minimal local equality collapses; "
            "not the unavailable Wave-4 catalog"
        ),
        "pattern_count": 202,
        "pattern_count_by_support": {"4": 12, "5": 190},
        "record": "header",
        "schema": producer.CATALOG_SCHEMA,
    }
    assert len(payload) == 41_152
    assert hashlib.sha256(payload).hexdigest() == EXPECTED_CATALOG_SHA256
    assert payload == producer.serialize_catalog(reversed(producer.candidate_catalog()))


def test_jsonl_and_p97monotone_bank_formats_have_same_clause_order() -> None:
    clauses = producer.candidate_local_bank(5)
    jsonl = producer.serialize_bank_jsonl(5, clauses)
    monotone = producer.serialize_bank_p97monotone(5, clauses)

    json_records = [json.loads(line) for line in jsonl.splitlines()[1:]]
    monotone_ids = [
        tuple(map(int, line.split()[:-1])) for line in monotone.splitlines()[1:]
    ]
    assert len(json_records) == len(monotone_ids) == 250
    assert [
        tuple(tuple(atom) for atom in record["atoms"]) for record in json_records
    ] == list(clauses)
    assert monotone_ids == [
        producer.p97monotone_clause_ids(5, clause) for clause in clauses
    ]


def test_exclusive_output_refuses_overwrite(tmp_path: Path) -> None:
    output = tmp_path / "catalog.jsonl"
    payload = producer.serialize_catalog(producer.enumerate_minimal_local_collapses(4))
    producer._write_exclusive(output, payload)
    assert output.read_bytes() == payload
    with pytest.raises(FileExistsError):
        producer._write_exclusive(output, payload)


@pytest.mark.parametrize(
    ("role_count", "clause"),
    [
        (4, ((0, 0), (0, 1))),
        (4, ((0, 4), (0, 1))),
        (5, ((0, 1),)),
    ],
)
def test_invalid_or_noncollapsing_clauses_are_rejected(
    role_count: int, clause: tuple[tuple[int, int], ...]
) -> None:
    if any(center == member for center, member in clause) or any(
        max(atom) >= role_count for atom in clause
    ):
        with pytest.raises(ValueError):
            producer.is_minimal_local_collapse(role_count, clause)
    else:
        assert not producer.is_minimal_local_collapse(role_count, clause)
