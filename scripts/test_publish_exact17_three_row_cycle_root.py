from __future__ import annotations

from pathlib import Path

import publish_exact17_three_row_cycle_root as publisher
import pytest


def _paths(tmp_path: Path) -> publisher.PublicationPaths:
    support = tmp_path / "support"
    support.mkdir()
    files = {}
    for name in ("parent", "validator", "metric", "root", "export", "parent_lean"):
        path = support / name
        path.write_bytes(name.encode())
        files[name] = path
    return publisher.PublicationPaths(
        parent=files["parent"],
        child=tmp_path / "package/child.cnf",
        receipt=tmp_path / "package/receipt.json",
        audit_report=tmp_path / "package/audit.json",
        coverage_ledger=tmp_path / "package/coverage.json",
        validator_script=files["validator"],
        lean_metric=files["metric"],
        lean_root=files["root"],
        lean_export=files["export"],
        parent_lean=files["parent_lean"],
    )


def _fake_validation(paths: publisher.PublicationPaths, child: Path) -> dict[str, object]:
    return {
        "schema": publisher.validator.VALIDATION_SCHEMA,
        "status": "PASS",
        "parent": {"path": str(paths.parent.resolve()), "sha256": "a" * 64, "bytes": 6, "clauses": publisher.validator.PARENT_CLAUSES},
        "child": {"path": str(child.resolve()), "sha256": "b" * 64, "bytes": 9, "clauses": publisher.validator.CHILD_CLAUSES},
        "suffix": {"sha256": publisher.validator.SUFFIX_SHA256, "bytes": publisher.validator.SUFFIX_BYTES, "clauses": publisher.validator.SUFFIX_CLAUSES},
    }


def test_publication_is_create_once_and_receipt_last(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    paths = _paths(tmp_path)
    monkeypatch.setattr(publisher, "_require_source_commit", lambda _paths: None)
    monkeypatch.setattr(publisher, "_run_lean", lambda output, _paths: output.write_bytes(b"candidate"))
    monkeypatch.setattr(
        publisher.validator,
        "validate_export",
        lambda _parent, child: _fake_validation(paths, child),
    )
    receipt = publisher.publish(paths)
    assert receipt["schema"] == publisher.RECEIPT_SCHEMA
    assert paths.child.read_bytes() == b"candidate"
    assert paths.audit_report.exists()
    assert paths.coverage_ledger.exists()
    assert paths.receipt.exists()
    with pytest.raises(FileExistsError):
        publisher.publish(paths)


def test_source_binding_fails_before_export(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    paths = _paths(tmp_path)
    monkeypatch.setattr(
        publisher,
        "_require_source_commit",
        lambda _paths: (_ for _ in ()).throw(ValueError("source drift")),
    )
    monkeypatch.setattr(
        publisher,
        "_run_lean",
        lambda *_args: pytest.fail("Lean must not run after source drift"),
    )
    with pytest.raises(ValueError, match="source drift"):
        publisher.publish(paths)


def test_validation_failure_publishes_nothing(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    paths = _paths(tmp_path)
    monkeypatch.setattr(publisher, "_require_source_commit", lambda _paths: None)
    monkeypatch.setattr(publisher, "_run_lean", lambda output, _paths: output.write_bytes(b"bad"))
    monkeypatch.setattr(
        publisher.validator,
        "validate_export",
        lambda *_args: (_ for _ in ()).throw(ValueError("bad export")),
    )
    with pytest.raises(ValueError, match="bad export"):
        publisher.publish(paths)
    assert not paths.child.exists()
    assert not paths.receipt.exists()
    assert not paths.audit_report.exists()
    assert not paths.coverage_ledger.exists()
