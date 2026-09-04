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
    "eb9d60d2541b8ce7ab646fc752afc9f74d0cca750ab30234efcfaef598ad63f6"
)
EXPECTED_COMPLETE_N11_BYTES = 3_160_394
EXPECTED_COMPLETE_N12_BYTES = 5_744_962


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
    for pattern in producer.complete_local_collapse_catalog():
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


def test_historical_142_record_subset_counts_do_not_select_membership() -> None:
    non_berge_count = 145_860 - 40 * math.comb(12, 6)
    assert non_berge_count == 108_900
    assert producer.solve_two_support_histogram(
        n=12, record_count=142, lifted_count=non_berge_count
    ) == (12, 130)

    assert Counter(
        pattern.support_size
        for pattern in producer.complete_local_collapse_catalog()
    ) == {4: 12, 5: 190}


def test_complete_local_base_has_pinned_n11_and_external_n12_identities() -> None:
    local11 = producer.complete_local_collapse_bank(11)
    berge11 = producer.complete_berge_bank(11)
    assert len(local11) == 91_740
    assert len(berge11) == 18_480
    assert not (set(local11) & set(berge11))
    bank11 = producer.complete_local_base_bank(11)
    assert len(bank11) == 110_220
    stream11 = producer.serialize_bank_p97monotone(11, bank11)
    assert len(stream11) == EXPECTED_COMPLETE_N11_BYTES
    assert (
        hashlib.sha256(stream11).hexdigest()
        == producer.COMPLETE_N11_P97MONOTONE_SHA256
    )

    local12 = producer.complete_local_collapse_bank(12)
    berge12 = producer.complete_berge_bank(12)
    assert len(local12) == 156_420
    assert len(berge12) == 36_960
    assert not (set(local12) & set(berge12))
    bank12 = producer.complete_local_base_bank(12)
    assert len(bank12) == 193_380
    stream12 = producer.serialize_bank_p97monotone(12, bank12)
    assert len(stream12) == EXPECTED_COMPLETE_N12_BYTES
    assert (
        hashlib.sha256(stream12).hexdigest()
        == producer.EXTERNAL_COMPLETE_N12_P97MONOTONE_SHA256
    )


def test_complete_bank_uses_increasing_subset_lifts_without_duplicates() -> None:
    catalog = producer.complete_local_collapse_catalog()
    bank5 = producer.complete_local_collapse_bank(5, catalog)
    assert len(bank5) == 12 * math.comb(5, 4) + 190 * math.comb(5, 5)
    assert len(bank5) == 250
    assert bank5 == producer.canonical_bank_clauses(bank5)

    bank11 = producer.complete_local_collapse_bank(11, catalog)
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
            "complete independently enumerated minimal local equality "
            "collapses; not the historical 142-record subset"
        ),
        "pattern_count": 202,
        "pattern_count_by_support": {"4": 12, "5": 190},
        "record": "header",
        "schema": producer.CATALOG_SCHEMA,
    }
    assert len(payload) == 41_163
    assert hashlib.sha256(payload).hexdigest() == EXPECTED_CATALOG_SHA256
    assert payload == producer.serialize_catalog(
        reversed(producer.complete_local_collapse_catalog())
    )


def test_jsonl_and_p97monotone_bank_formats_have_same_clause_order() -> None:
    clauses = producer.complete_local_collapse_bank(5)
    scrambled = tuple(reversed(clauses)) + (clauses[0],)
    jsonl = producer.serialize_bank_jsonl(5, scrambled)
    monotone = producer.serialize_bank_p97monotone(5, scrambled)

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
