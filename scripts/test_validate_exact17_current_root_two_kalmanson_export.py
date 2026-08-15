from __future__ import annotations

import hashlib
from pathlib import Path

import pytest
import validate_exact17_current_root_two_kalmanson_export as validator


def _tiny_export(tmp_path: Path) -> tuple[Path, Path, validator.ExportSpec]:
    suffix = b"".join(validator.expected_suffix_lines())
    parent_body = b"1 0\n"
    parent_bytes = b"p cnf 308 1\n" + parent_body
    child_bytes = (
        f"p cnf 308 {1 + validator.SUFFIX_CLAUSES}\n".encode() + parent_body + suffix
    )
    parent = tmp_path / "parent.cnf"
    child = tmp_path / "child.cnf"
    parent.write_bytes(parent_bytes)
    child.write_bytes(child_bytes)
    spec = validator.ExportSpec(
        parent_sha256=hashlib.sha256(parent_bytes).hexdigest(),
        parent_bytes=len(parent_bytes),
        parent_clauses=1,
        child_sha256=hashlib.sha256(child_bytes).hexdigest(),
        child_bytes=len(child_bytes),
        child_clauses=1 + validator.SUFFIX_CLAUSES,
        variables=validator.VARIABLES,
    )
    return parent, child, spec


def test_independent_suffix_identity_and_boundaries() -> None:
    lines = tuple(validator.expected_suffix_lines())
    suffix = b"".join(lines)
    assert len(lines) == validator.OCCURRENCES * validator.CLAUSES_PER_OCCURRENCE
    assert len(set(lines)) == validator.SUFFIX_CLAUSES
    assert lines[0] == b"-307 -142 -151 -89 -100 -225 -227 0\n"
    assert lines[-1] == (
        b"-308 -57 -67 -288 -280 -261 -259 -272 -268 -122 -131 "
        b"-208 -211 -195 -194 -153 -139 -115 -114 0\n"
    )
    assert len(suffix) == validator.SUFFIX_BYTES
    assert hashlib.sha256(suffix).hexdigest() == validator.SUFFIX_SHA256


def test_every_clause_has_guard_and_distinct_valid_literals() -> None:
    for line in validator.expected_suffix_lines():
        fields = tuple(int(item) for item in line.split())
        assert fields[-1] == 0
        literals = fields[:-1]
        assert literals[0] in (-307, -308)
        assert len(set(literals)) == len(literals)
        assert all(-validator.VARIABLES <= literal < 0 for literal in literals)


def test_tiny_export_accepts_exact_parent_body_and_suffix(tmp_path: Path) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    result = validator.validate_export(
        parent,
        child,
        check_support=False,
        spec=spec,
    )
    assert result["status"] == "PASS"
    assert result["suffix"]["clauses"] == validator.SUFFIX_CLAUSES


def test_reporting_uses_authenticated_fstat_not_path_stat(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    monkeypatch.setattr(
        Path,
        "stat",
        lambda *_args, **_kwargs: pytest.fail("path stat must not report identity"),
    )
    result = validator.validate_export(
        parent,
        child,
        check_support=False,
        spec=spec,
    )
    assert result["parent"]["bytes"] == spec.parent_bytes
    assert result["child"]["bytes"] == spec.child_bytes


@pytest.mark.parametrize("target", ["parent", "child"])
def test_malformed_header_is_rejected(tmp_path: Path, target: str) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    path = parent if target == "parent" else child
    data = path.read_bytes()
    path.write_bytes(b"p cnd" + data[5:])
    with pytest.raises(ValueError, match="DIMACS header drifted"):
        validator.validate_export(parent, child, check_support=False, spec=spec)


def test_source_pin_failure_precedes_cnf_open(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    monkeypatch.setattr(
        validator,
        "_require_support",
        lambda *_args: (_ for _ in ()).throw(ValueError("source pin drifted")),
    )
    with pytest.raises(ValueError, match="source pin drifted"):
        validator.validate_export(parent, child, check_support=True, spec=spec)


@pytest.mark.parametrize("target", ["parent", "suffix", "trailing"])
def test_tiny_export_rejects_byte_tampering(tmp_path: Path, target: str) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    if target == "parent":
        data = bytearray(child.read_bytes())
        body_offset = data.index(b"\n") + 1
        data[body_offset] = ord("2")
        child.write_bytes(data)
        match = "parent body prefix"
    elif target == "suffix":
        data = bytearray(child.read_bytes())
        first_suffix = data.index(b"\n", data.index(b"\n") + 1) + 1
        data[first_suffix + 6] = ord("3")
        child.write_bytes(data)
        match = "ordered suffix"
    else:
        child.write_bytes(child.read_bytes() + b"x")
        match = "extra bytes"
    with pytest.raises(ValueError, match=match):
        validator.validate_export(parent, child, check_support=False, spec=spec)


def test_component_symlink_is_rejected(tmp_path: Path) -> None:
    real = tmp_path / "real"
    real.mkdir()
    target = real / "source"
    target.write_bytes(b"source")
    redirect = tmp_path / "redirect"
    redirect.symlink_to(real, target_is_directory=True)
    with pytest.raises((OSError, ValueError)):
        validator.sha256_file(redirect / "source")


def test_direct_file_symlink_is_rejected(tmp_path: Path) -> None:
    target = tmp_path / "target"
    target.write_bytes(b"source")
    link = tmp_path / "link"
    link.symlink_to(target)
    with pytest.raises((OSError, ValueError)):
        validator.sha256_file(link)


def test_default_child_path_is_v2_package() -> None:
    assert validator.CHILD_PATH.parent.name.endswith("package-v2")
