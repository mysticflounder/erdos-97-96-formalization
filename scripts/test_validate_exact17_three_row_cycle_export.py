from __future__ import annotations

import hashlib

import validate_exact17_three_row_cycle_export as validator


def test_independent_suffix_identity() -> None:
    digest = hashlib.sha256()
    byte_count = 0
    clause_count = 0
    first = None
    last = None
    for line in validator.expected_suffix_lines():
        if first is None:
            first = line
        last = line
        digest.update(line)
        byte_count += len(line)
        clause_count += 1
    assert first == b"-307 -5 -6 -23 -32 -226 -236 0\n"
    assert last == b"-308 -252 -244 -82 -70 -53 -57 0\n"
    assert digest.hexdigest() == validator.SUFFIX_SHA256
    assert byte_count == validator.SUFFIX_BYTES
    assert clause_count == validator.SUFFIX_CLAUSES


def test_three_cycle_families_are_distinct() -> None:
    points = (0, 1, 2, 3, 4, 5)
    assert validator._hits(0, points) == (
        (0, 1),
        (0, 2),
        (3, 2),
        (3, 5),
        (4, 1),
        (4, 5),
    )
    assert validator._hits(1, points) == (
        (0, 1),
        (0, 2),
        (4, 1),
        (4, 3),
        (5, 2),
        (5, 3),
    )
    assert validator._hits(2, points) == (
        (0, 1),
        (0, 3),
        (4, 1),
        (4, 2),
        (5, 2),
        (5, 3),
    )
