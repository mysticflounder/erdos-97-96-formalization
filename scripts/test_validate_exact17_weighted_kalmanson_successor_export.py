from __future__ import annotations

import hashlib
from pathlib import Path

import pytest
import validate_exact17_weighted_kalmanson_successor_export as validator


def _tiny(tmp_path: Path) -> tuple[Path, Path, validator.ExportSpec]:
    suffix = b"".join(validator.expected_suffix_lines())
    parent = tmp_path / "parent.cnf"
    child = tmp_path / "child.cnf"
    parent_bytes = b"p cnf 308 1\n1 0\n"
    child_bytes = b"p cnf 308 33\n1 0\n" + suffix
    parent.write_bytes(parent_bytes)
    child.write_bytes(child_bytes)
    spec = validator.ExportSpec(
        parent_sha256=hashlib.sha256(parent_bytes).hexdigest(),
        parent_bytes=len(parent_bytes),
        parent_clauses=1,
        child_sha256=hashlib.sha256(child_bytes).hexdigest(),
        child_bytes=len(child_bytes),
        child_clauses=33,
    )
    return parent, child, spec


def test_suffix_is_exactly_eight_records_times_four() -> None:
    lines = tuple(validator.expected_suffix_lines())
    assert len(lines) == 32
    assert len(b"".join(lines)) == 1416
    assert (
        hashlib.sha256(b"".join(lines)).hexdigest()
        == "1ea57b87282c5cf8e59519eca4652be57d9eaa408c862c9e7f50a75ac075d72d"
    )
    assert lines[0] == b"-307 -12 -10 -122 -124 -46 -39 -78 -71 0\n"


def test_tiny_export_accepts_exact_prefix_and_suffix(tmp_path: Path) -> None:
    parent, child, spec = _tiny(tmp_path)
    result = validator._validate_export(parent, child, check_support=False, spec=spec)
    assert result["status"] == "PASS"
    assert result["suffix"]["clauses"] == 32


@pytest.mark.parametrize("mutation", [b"p cnd", b"p cnf 307 33"])
def test_header_mutation_is_rejected(tmp_path: Path, mutation: bytes) -> None:
    parent, child, spec = _tiny(tmp_path)
    data = child.read_bytes()
    child.write_bytes(mutation + data[data.index(b"\n") :])
    with pytest.raises(ValueError, match="DIMACS header drifted"):
        validator._validate_export(parent, child, check_support=False, spec=spec)


def test_parent_prefix_mutation_is_rejected(tmp_path: Path) -> None:
    parent, child, spec = _tiny(tmp_path)
    data = child.read_bytes().replace(b"1 0\n", b"2 0\n", 1)
    child.write_bytes(data)
    with pytest.raises(ValueError, match="parent prefix"):
        validator._validate_export(parent, child, check_support=False, spec=spec)


def test_extra_clause_is_rejected(tmp_path: Path) -> None:
    parent, child, spec = _tiny(tmp_path)
    child.write_bytes(child.read_bytes() + b"-307 0\n")
    with pytest.raises(ValueError, match="header|prefix|suffix|census"):
        validator._validate_export(parent, child, check_support=False, spec=spec)


def test_ledger_atom_record_mutation_fails_closed(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    original = validator._EXPECTED_ATOMS
    monkeypatch.setattr(validator, "_EXPECTED_ATOMS", ((421, 3867),) + original[1:])
    with pytest.raises(ValueError, match="occurrence record 0"):
        validator._ledger()
