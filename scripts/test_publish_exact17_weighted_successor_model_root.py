from __future__ import annotations

import hashlib
from pathlib import Path

import publish_exact17_weighted_successor_model_root as publisher
import pytest


def _paths(tmp_path: Path) -> publisher.PublicationPaths:
    package = tmp_path / "export-v1"
    artifacts = package / "artifacts"
    artifacts.mkdir(parents=True)
    parent = artifacts / "parent.cnf"
    parent.write_bytes(b"parent")
    return publisher.PublicationPaths(
        parent=parent,
        child=artifacts / "child.cnf",
        receipt=package / "receipt.json",
        audit_report=package / "audit.json",
        coverage_ledger=package / "ledger.json",
        validator_script=Path(publisher.__file__),
        publisher_script=Path(publisher.__file__),
        lean_root=parent,
        lean_export=parent,
        parent_lean_root=parent,
        parent_lean_export=parent,
    )


def _fake_validation(
    paths: publisher.PublicationPaths, child: Path
) -> dict[str, object]:
    data = child.read_bytes()
    return {
        "schema": "test",
        "status": "PASS",
        "parent": {},
        "child": {
            "path": str(child.resolve()),
            "sha256": hashlib.sha256(data).hexdigest(),
            "bytes": len(data),
            "clauses": 53,
        },
        "suffix": {"clauses": 52},
    }


def _permit(monkeypatch: pytest.MonkeyPatch, paths: publisher.PublicationPaths) -> None:
    monkeypatch.setattr(
        publisher,
        "_require_publisher_provenance",
        lambda *_: {"sha256": "x", "bytes": 1},
    )
    monkeypatch.setattr(publisher, "_require_source_commit", lambda *_: None)
    monkeypatch.setattr(
        publisher, "_run_lean", lambda output, _paths: output.write_bytes(b"candidate")
    )
    monkeypatch.setattr(
        publisher, "_validation", lambda _paths, child: _fake_validation(paths, child)
    )


def test_publication_writes_receipt_last_and_is_create_once(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _permit(monkeypatch, paths)
    order: list[Path] = []
    original = publisher._write_exclusive_readonly
    monkeypatch.setattr(
        publisher,
        "_write_exclusive_readonly",
        lambda path, data: order.append(path) or original(path, data),
    )
    baseline = publisher.PublisherBaseline("a" * 40, "b" * 64, 1)
    result = publisher.publish(paths, baseline)
    assert result["status"] == "PASS"
    assert order[-1] == paths.receipt
    with pytest.raises(FileExistsError):
        publisher.publish(paths, baseline)


def test_validation_failure_publishes_nothing(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _permit(monkeypatch, paths)
    monkeypatch.setattr(
        publisher,
        "_validation",
        lambda *_: (_ for _ in ()).throw(ValueError("bad suffix")),
    )
    with pytest.raises(ValueError, match="bad suffix"):
        publisher.publish(paths, publisher.PublisherBaseline("a" * 40, "b" * 64, 1))
    assert not paths.child.exists()
    assert not paths.receipt.exists()
    assert not paths.coverage_ledger.exists()


def test_coverage_ledger_binds_weighted_profile() -> None:
    validation = {"child": {"sha256": "a", "bytes": 1, "clauses": 33}}
    ledger = publisher.coverage_ledger(
        validation, publisher.PublisherBaseline("a" * 40, "b" * 64, 1)
    )
    assert ledger["profile_id"] == "exact17-weighted-successor-model"
    assert ledger["enumeration"]["clauses"] == 52
