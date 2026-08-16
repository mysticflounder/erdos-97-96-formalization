from __future__ import annotations

import hashlib
from pathlib import Path

import pytest
import validate_exact17_weighted_successor_model_export as validator


def _tiny(tmp_path: Path) -> tuple[Path, Path, validator.ExportSpec]:
    suffix = b"".join(validator.expected_suffix_lines())
    parent_bytes = b"p cnf 308 1\n1 0\n"
    child_bytes = b"p cnf 308 53\n1 0\n" + suffix
    parent, child = tmp_path / "parent.cnf", tmp_path / "child.cnf"
    parent.write_bytes(parent_bytes)
    child.write_bytes(child_bytes)
    return (
        parent,
        child,
        validator.ExportSpec(
            parent_sha256=hashlib.sha256(parent_bytes).hexdigest(),
            parent_bytes=len(parent_bytes),
            parent_clauses=1,
            child_sha256=hashlib.sha256(child_bytes).hexdigest(),
            child_bytes=len(child_bytes),
            child_clauses=53,
        ),
    )


def test_suffix_is_thirteen_occurrences_times_four() -> None:
    lines = tuple(validator.expected_suffix_lines())
    suffix = b"".join(lines)
    assert len(lines) == 52
    assert len(suffix) == 2442
    assert (
        hashlib.sha256(suffix).hexdigest()
        == "805424c33bc448e1e8c78b084b7b0fab9f06ea74a527c2188dea1b9b68da50ee"
    )
    assert lines[0] == b"-307 -4 -2 -169 -157 -220 -206 0\n"


def test_tiny_export_accepts_exact_prefix_and_suffix(tmp_path: Path) -> None:
    parent, child, spec = _tiny(tmp_path)
    result = validator._validate_export(parent, child, check_support=False, spec=spec)
    assert result["status"] == "PASS"
    assert result["suffix"]["clauses"] == 52


@pytest.mark.parametrize("mutation", [b"p cnd", b"p cnf 307 53"])
def test_header_mutation_is_rejected(tmp_path: Path, mutation: bytes) -> None:
    parent, child, spec = _tiny(tmp_path)
    data = child.read_bytes()
    child.write_bytes(mutation + data[data.index(b"\n") :])
    with pytest.raises(ValueError, match="DIMACS header drifted"):
        validator._validate_export(parent, child, check_support=False, spec=spec)


def test_parent_prefix_mutation_is_rejected(tmp_path: Path) -> None:
    parent, child, spec = _tiny(tmp_path)
    child.write_bytes(child.read_bytes().replace(b"1 0\n", b"2 0\n", 1))
    with pytest.raises(ValueError, match="parent prefix"):
        validator._validate_export(parent, child, check_support=False, spec=spec)


def test_extra_clause_is_rejected(tmp_path: Path) -> None:
    parent, child, spec = _tiny(tmp_path)
    child.write_bytes(child.read_bytes() + b"-307 0\n")
    with pytest.raises(ValueError, match="header|prefix|suffix|census"):
        validator._validate_export(parent, child, check_support=False, spec=spec)


def test_mine_mutation_fails_closed(monkeypatch: pytest.MonkeyPatch) -> None:
    original = validator._SUPPORTS
    monkeypatch.setattr(validator, "_SUPPORTS", original[:-1])
    with pytest.raises(ValueError, match="occurrence census"):
        validator._mine()
