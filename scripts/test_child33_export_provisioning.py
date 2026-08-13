"""Focused tests for the source-valid child33 export/provisioning boundary."""

from __future__ import annotations

import hashlib
import importlib.util
import os
import sys
from dataclasses import replace
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))


def _load(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


validator = _load(
    "child33_validator",
    ROOT / "scripts/validate_exact17_thirty_second_model_refinements_export.py",
)
exporter = _load(
    "child33_exporter",
    ROOT / "scripts/export_exact17_thirty_third_root.py",
)


def _fixture(tmp_path: Path):
    parent = tmp_path / "parent.cnf"
    parent.write_bytes(b"p cnf 308 2\n1 0\n2 0\n")
    suffix = b"".join(
        (" ".join(map(str, clause)) + " 0\n").encode("ascii")
        for clause in validator.expected_suffix()
    )
    child = tmp_path / "child.cnf"
    child.write_bytes(b"p cnf 308 10\n1 0\n2 0\n" + suffix)
    parent_sha = hashlib.sha256(parent.read_bytes()).hexdigest()
    child_bytes = child.stat().st_size
    child_sha = hashlib.sha256(child.read_bytes()).hexdigest()
    lean_root = tmp_path / "model.lean"
    lean_export = tmp_path / "export.lean"
    two_circle = tmp_path / "two-circle.lean"
    kalmanson = tmp_path / "kalmanson.lean"
    lean_root.write_text("root", encoding="utf-8")
    lean_export.write_text("export", encoding="utf-8")
    two_circle.write_text("two-circle", encoding="utf-8")
    kalmanson.write_text("kalmanson", encoding="utf-8")
    spec = validator.ExportSpec(
        variables=308,
        parent_clauses=2,
        new_clauses=8,
        parent_sha256=parent_sha,
        child_sha256=child_sha,
        child_bytes=child_bytes,
        publication_state="PROVISIONED",
        lean_root_path=str(lean_root),
        lean_export_path=str(lean_export),
        two_circle_path=str(two_circle),
        kalmanson_path=str(kalmanson),
        lean_root_sha256=hashlib.sha256(lean_root.read_bytes()).hexdigest(),
        lean_export_sha256=hashlib.sha256(lean_export.read_bytes()).hexdigest(),
        two_circle_sha256=hashlib.sha256(two_circle.read_bytes()).hexdigest(),
        kalmanson_sha256=hashlib.sha256(kalmanson.read_bytes()).hexdigest(),
        parent_path=str(parent),
        child_path=str(tmp_path / "published.cnf"),
        receipt_path=str(tmp_path / "receipt.json"),
    )
    return parent, child, spec, (lean_root, lean_export, two_circle, kalmanson)


def test_exact_parent_prefix_and_source_suffix(tmp_path: Path) -> None:
    parent, child, spec, _ = _fixture(tmp_path)
    result = validator.validate_export(parent, child, spec=spec)
    assert result["status"] == "PASS"
    assert result["child"]["clauses"] == 10
    assert result["new_clauses"] == 8
    assert result["ordered_suffix_exact"] is True
    assert result["source_clause_families"] == [
        "child32TwoCircleClauses",
        "canonicalClauses",
    ]


def test_unprovisioned_spec_fails_closed(tmp_path: Path) -> None:
    parent, child, fixture_spec, _ = _fixture(tmp_path)
    unprovisioned = replace(fixture_spec, child_sha256=None, child_bytes=None, publication_state="UNPROVISIONED")
    with pytest.raises(validator.UnprovisionedError):
        validator.validate_export(parent, child, spec=unprovisioned)
    with pytest.raises(exporter.UnprovisionedError):
        exporter.export_child33(spec=unprovisioned)


def test_suffix_reordering_is_rejected(tmp_path: Path) -> None:
    parent, child, spec, _ = _fixture(tmp_path)
    lines = child.read_bytes().splitlines(keepends=True)
    lines[-1], lines[-2] = lines[-2], lines[-1]
    child.write_bytes(b"".join(lines))
    with pytest.raises(ValueError, match="suffix mismatch"):
        validator.validate_export(parent, child, spec=spec)


def test_inherited_parent_semantic_duplicate_is_reported(tmp_path: Path) -> None:
    parent = tmp_path / "parent.cnf"
    parent.write_bytes(b"p cnf 308 2\n1 2 0\n2 1 0\n")
    suffix = b"".join(
        (" ".join(map(str, clause)) + " 0\n").encode("ascii")
        for clause in validator.expected_suffix()
    )
    child = tmp_path / "child.cnf"
    child.write_bytes(b"p cnf 308 10\n1 2 0\n2 1 0\n" + suffix)
    spec = validator.ExportSpec(
        variables=308,
        parent_clauses=2,
        new_clauses=8,
        parent_sha256=hashlib.sha256(parent.read_bytes()).hexdigest(),
        child_sha256=hashlib.sha256(child.read_bytes()).hexdigest(),
        child_bytes=child.stat().st_size,
        publication_state="PROVISIONED",
    )
    result = validator.validate_export(parent, child, spec=spec)
    assert result["parent_duplicate_semantic_clauses"] == 1


def test_exporter_hard_links_and_never_overwrites(tmp_path: Path) -> None:
    parent, fixture_child, spec, source_paths = _fixture(tmp_path)
    lean_root, lean_export, two_circle, kalmanson = source_paths
    child = tmp_path / "published.cnf"
    receipt = tmp_path / "receipt.json"

    def fake_lean(_source: Path, candidate: Path) -> None:
        candidate.write_bytes(fixture_child.read_bytes())

    paths = exporter.ExportPaths(
        parent=parent,
        lean_root=lean_root,
        lean_export=lean_export,
        child=child,
        receipt=receipt,
        two_circle=two_circle,
        kalmanson=kalmanson,
    )
    result = exporter.export_child33(paths, spec=spec, lean_runner=fake_lean)
    assert result["status"] == "PASS"
    assert child.exists() and receipt.exists()
    assert child.stat().st_ino != fixture_child.stat().st_ino
    assert child.read_bytes() == fixture_child.read_bytes()
    with pytest.raises(FileExistsError):
        exporter.export_child33(paths, spec=spec, lean_runner=fake_lean)


def test_link_verification_rejects_symlink(tmp_path: Path) -> None:
    _, candidate, spec, _ = _fixture(tmp_path)
    child = tmp_path / "child-link.cnf"
    child.symlink_to(candidate)
    expected = {"child": {"bytes": spec.child_bytes, "sha256": spec.child_sha256}}
    with pytest.raises(RuntimeError, match="not a regular file"):
        exporter._verify_linked_child(candidate, child, expected)


def test_export_rejects_wrong_module_and_source_symlink(tmp_path: Path) -> None:
    parent, fixture_child, spec, source_paths = _fixture(tmp_path)
    lean_root, lean_export, two_circle, kalmanson = source_paths
    paths = exporter.ExportPaths(parent, lean_root, lean_export, tmp_path / "published.cnf", tmp_path / "receipt.json", two_circle, kalmanson)
    wrong = tmp_path / "wrong.lean"
    wrong.write_text("wrong", encoding="utf-8")
    with pytest.raises(ValueError, match="two_circle path"):
        exporter.export_child33(paths, spec=replace(spec, two_circle_path=str(wrong)), lean_runner=lambda _s, c: c.write_bytes(fixture_child.read_bytes()))
    two_circle.unlink()
    two_circle.symlink_to(wrong)
    with pytest.raises(OSError):
        exporter.export_child33(paths, spec=spec, lean_runner=lambda _s, c: c.write_bytes(fixture_child.read_bytes()))


def test_export_rejects_input_mutation_and_child_path_swap(tmp_path: Path) -> None:
    parent, fixture_child, spec, source_paths = _fixture(tmp_path)
    lean_root, lean_export, two_circle, kalmanson = source_paths
    child = tmp_path / "published.cnf"
    receipt = tmp_path / "receipt.json"
    paths = exporter.ExportPaths(parent, lean_root, lean_export, child, receipt, two_circle, kalmanson)
    parent_original = parent.read_bytes()

    def mutate_source(_source: Path, candidate: Path) -> None:
        candidate.write_bytes(fixture_child.read_bytes())
        parent.write_bytes(parent.read_bytes() + b"x")

    with pytest.raises(RuntimeError, match="input changed"):
        exporter.export_child33(paths, spec=spec, lean_runner=mutate_source)
    assert not child.exists() and not receipt.exists()
    parent.write_bytes(parent_original)

    def swap_child() -> None:
        child.unlink()
        child.symlink_to(fixture_child)

    with pytest.raises((RuntimeError, OSError)):
        exporter.export_child33(paths, spec=spec, lean_runner=lambda _s, c: c.write_bytes(fixture_child.read_bytes()), before_receipt=swap_child)
    assert not receipt.exists()


def test_candidate_symlink_and_post_validation_mutation_are_rejected(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    parent, fixture_child, spec, source_paths = _fixture(tmp_path)
    lean_root, lean_export, two_circle, kalmanson = source_paths
    child = tmp_path / "published.cnf"
    receipt = tmp_path / "receipt.json"
    paths = exporter.ExportPaths(parent, lean_root, lean_export, child, receipt, two_circle, kalmanson)

    def candidate_swap(_source: Path, candidate: Path) -> None:
        candidate.symlink_to(fixture_child)

    with pytest.raises(RuntimeError, match="no DIMACS candidate"):
        exporter.export_child33(paths, spec=spec, lean_runner=candidate_swap)
    assert not child.exists() and not receipt.exists()

    original_validate = exporter.validate_export
    calls = 0
    def mutate_after_first_validation(parent_path: Path, child_path: Path, *, spec: object) -> dict[str, object]:
        nonlocal calls
        result = original_validate(parent_path, child_path, spec=spec)
        calls += 1
        if calls == 1:
            child_path.write_bytes(child_path.read_bytes() + b"mutation")
        return result
    monkeypatch.setattr(exporter, "validate_export", mutate_after_first_validation)
    with pytest.raises(ValueError, match="header|SHA-256|extra"):
        exporter.export_child33(paths, spec=spec, lean_runner=lambda _s, c: c.write_bytes(fixture_child.read_bytes()))
    assert not child.exists() and not receipt.exists()


def test_hardlink_extra_link_and_receipt_failure_roll_back_and_retry(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    parent, fixture_child, spec, source_paths = _fixture(tmp_path)
    lean_root, lean_export, two_circle, kalmanson = source_paths
    child = tmp_path / "published.cnf"
    receipt = tmp_path / "receipt.json"
    paths = exporter.ExportPaths(parent, lean_root, lean_export, child, receipt, two_circle, kalmanson)

    def extra_link(_source: Path, candidate: Path) -> None:
        candidate.write_bytes(fixture_child.read_bytes())
        os.link(candidate, tmp_path / "extra-link", follow_symlinks=False)

    with pytest.raises(RuntimeError, match="link count"):
        exporter.export_child33(paths, spec=spec, lean_runner=extra_link)
    (tmp_path / "extra-link").unlink()
    assert not child.exists() and not receipt.exists()

    original_json = exporter._immutable_json
    def fail_after_partial(path: Path, payload: dict[str, object]) -> None:
        path.write_text("{", encoding="utf-8")
        raise OSError("injected receipt write failure")
    monkeypatch.setattr(exporter, "_immutable_json", fail_after_partial)
    with pytest.raises(OSError, match="receipt write failure"):
        exporter.export_child33(paths, spec=spec, lean_runner=lambda _s, c: c.write_bytes(fixture_child.read_bytes()))
    assert not child.exists() and not receipt.exists()
    monkeypatch.setattr(exporter, "_immutable_json", original_json)
    result = exporter.export_child33(paths, spec=spec, lean_runner=lambda _s, c: c.write_bytes(fixture_child.read_bytes()))
    assert result["status"] == "PASS" and child.exists() and receipt.exists()


@pytest.mark.parametrize("phase", ["open", "file-fsync", "dir-fsync"])
def test_receipt_failure_phases_are_transactional_and_retryable(tmp_path: Path, phase: str, monkeypatch: pytest.MonkeyPatch) -> None:
    parent, fixture_child, spec, source_paths = _fixture(tmp_path)
    lean_root, lean_export, two_circle, kalmanson = source_paths
    child = tmp_path / "published.cnf"
    receipt = tmp_path / "receipt.json"
    paths = exporter.ExportPaths(parent, lean_root, lean_export, child, receipt, two_circle, kalmanson)
    original_json = exporter._immutable_json
    original_fsync = exporter.os.fsync
    if phase == "open":
        def fail_open(_path: Path, _payload: dict[str, object]) -> None:
            raise OSError("injected receipt open failure")
        monkeypatch.setattr(exporter, "_immutable_json", fail_open)
    else:
        calls = 0
        def fail_fsync(fd: int) -> None:
            nonlocal calls
            calls += 1
            if calls == (2 if phase == "file-fsync" else 3):
                raise OSError(f"injected receipt {phase} failure")
            original_fsync(fd)
        monkeypatch.setattr(exporter.os, "fsync", fail_fsync)
    with pytest.raises(OSError, match="receipt"):
        exporter.export_child33(paths, spec=spec, lean_runner=lambda _s, c: c.write_bytes(fixture_child.read_bytes()))
    assert not child.exists() and not receipt.exists()
    monkeypatch.setattr(exporter, "_immutable_json", original_json)
    monkeypatch.setattr(exporter.os, "fsync", original_fsync)
    assert exporter.export_child33(paths, spec=spec, lean_runner=lambda _s, c: c.write_bytes(fixture_child.read_bytes()))["status"] == "PASS"
