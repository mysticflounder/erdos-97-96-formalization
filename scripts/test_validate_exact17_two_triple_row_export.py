from __future__ import annotations

import hashlib
from pathlib import Path

import pytest
import validate_exact17_two_triple_row_export as validator


def test_independent_suffix_identity() -> None:
    digest = hashlib.sha256()
    byte_count = 0
    clause_count = 0
    first = last = None
    for line in validator.expected_suffix_lines():
        first = first or line
        last = line
        digest.update(line)
        byte_count += len(line)
        clause_count += 1
    assert first == b"-307 -69 -74 -70 -239 -240 -252 0\n"
    assert last == b"-308 -236 -223 -227 -66 -57 -56 0\n"
    assert digest.hexdigest() == validator.SUFFIX_SHA256
    assert byte_count == validator.SUFFIX_BYTES
    assert clause_count == validator.SUFFIX_CLAUSES


def test_two_triple_semantics_and_no_duplicates() -> None:
    assert validator._hits((0, 1, 2, 3, 4, 5)) == (
        (1, 0), (1, 2), (1, 3), (5, 0), (5, 3), (5, 4)
    )
    clauses = {line for line in validator.expected_suffix_lines()}
    assert len(clauses) == validator.SUFFIX_CLAUSES


def test_support_paths_reject_symlinks(tmp_path: Path) -> None:
    target = tmp_path / "target"
    target.write_bytes(b"source")
    link = tmp_path / "link"
    link.symlink_to(target)
    with pytest.raises((OSError, ValueError)):
        validator.sha256_file(link)


def test_default_child_path_is_v2_package() -> None:
    assert validator.CHILD_PATH.parent.name == "exact17-two-triple-row-package-v2"
