from __future__ import annotations

import hashlib
import os
from pathlib import Path
from typing import Self

import pytest
import validate_exact17_current_root_two_kalmanson_successor_export as validator


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
    assert lines[0] == b"-307 -113 -106 -143 -140 -58 -62 0\n"
    assert lines[-1] == (
        b"-308 -234 -230 -30 -28 -67 -61 -288 -281 -259 -272 -157 -164 -218 -211 "
        b"-180 -177 -151 -153 -117 -116 0\n"
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
    result = validator._validate_export(
        parent,
        child,
        check_support=False,
        spec=spec,
    )
    assert result["status"] == "PASS"
    assert result["suffix"]["clauses"] == validator.SUFFIX_CLAUSES


def test_public_validator_rejects_test_only_bypasses(tmp_path: Path) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    with pytest.raises(TypeError):
        validator.validate_export(parent, child, check_support=False)  # type: ignore[call-arg]
    with pytest.raises(TypeError):
        validator.validate_export(parent, child, spec=spec)  # type: ignore[call-arg]


def test_reporting_uses_authenticated_fstat_not_path_stat(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    monkeypatch.setattr(
        Path,
        "stat",
        lambda *_args, **_kwargs: pytest.fail("path stat must not report identity"),
    )
    result = validator._validate_export(
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
        validator._validate_export(parent, child, check_support=False, spec=spec)


def test_source_pin_failure_precedes_cnf_open(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    monkeypatch.setattr(
        validator,
        "_require_committed_source",
        lambda *_args: (_ for _ in ()).throw(ValueError("source pin drifted")),
    )
    with pytest.raises(ValueError, match="source pin drifted"):
        validator._validate_export(parent, child, check_support=True, spec=spec)


def test_production_source_pin_is_full_length() -> None:
    assert len(validator.SOURCE_COMMIT) == 40


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
        validator._validate_export(parent, child, check_support=False, spec=spec)


def test_missing_committed_source_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    target = tmp_path / "source"
    target.write_bytes(b"live")
    monkeypatch.setattr(
        validator,
        "_git_show",
        lambda *_args: (_ for _ in ()).throw(ValueError("missing commit")),
    )
    with pytest.raises(ValueError, match="missing commit"):
        validator._require_committed_source(
            target, "f" * 40, hashlib.sha256(b"live").hexdigest(), "source"
        )


@pytest.mark.parametrize("commit", ["not-a-commit", "f" * 39])
def test_fake_or_truncated_commit_pin_is_rejected(tmp_path: Path, commit: str) -> None:
    target = tmp_path / "source"
    target.write_bytes(b"live")
    with pytest.raises(ValueError, match="commit pin is malformed"):
        validator._require_committed_source(
            target, commit, hashlib.sha256(b"live").hexdigest(), "source"
        )


def test_git_show_content_mismatch_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    target = tmp_path / "source"
    target.write_bytes(b"live")
    monkeypatch.setattr(validator, "_git_show", lambda *_args: b"committed")
    with pytest.raises(ValueError, match="committed bytes drifted"):
        validator._require_committed_source(
            target, "a" * 40, hashlib.sha256(b"live").hexdigest(), "source"
        )


def test_hardlink_addition_during_validation_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    alias = tmp_path / "child-hardlink"
    original_open = validator._open_regular_nofollow

    class LinkAddingStream:
        def __init__(self, stream: object) -> None:
            self.stream = stream
            self.added = False

        def __enter__(self) -> Self:
            self.stream.__enter__()  # type: ignore[attr-defined]
            return self

        def __exit__(self, *args: object) -> None:
            self.stream.__exit__(*args)  # type: ignore[attr-defined]

        def fileno(self) -> int:
            return self.stream.fileno()  # type: ignore[attr-defined]

        def readline(self, *args: object) -> bytes:
            value = self.stream.readline(*args)  # type: ignore[attr-defined]
            if not self.added:
                os.link(child, alias)
                self.added = True
            return value

        def read(self, *args: object) -> bytes:
            return self.stream.read(*args)  # type: ignore[attr-defined]

    def open_with_link(path: Path) -> object:
        stream = original_open(path)
        return LinkAddingStream(stream) if path == child else stream

    monkeypatch.setattr(validator, "_open_regular_nofollow", open_with_link)
    try:
        with pytest.raises(ValueError, match="child changed during validation"):
            validator._validate_export(parent, child, check_support=False, spec=spec)
    finally:
        if alias.exists():
            alias.unlink()


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
