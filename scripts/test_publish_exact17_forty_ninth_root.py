from __future__ import annotations

from pathlib import Path

import publish_exact17_forty_ninth_root as publisher
import pytest


def test_publication_requires_publisher_commit_before_export(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = publisher.PublicationPaths(
        parent=publisher.validator.PARENT_PATH,
        child=tmp_path / "child.cnf",
        receipt=tmp_path / "receipt.json",
        audit_report=tmp_path / "audit.json",
        coverage_ledger=tmp_path / "ledger.json",
        validator_script=publisher.VALIDATOR_PATH,
        publisher_script=publisher.PUBLISHER_PATH,
        lean_root=publisher.validator.LEAN_ROOT_PATH,
        lean_export=publisher.validator.LEAN_EXPORT_PATH,
        parent_lean_root=publisher.validator.PARENT_LEAN_ROOT_PATH,
        parent_lean_export=publisher.validator.PARENT_LEAN_EXPORT_PATH,
        source_bridge=publisher.validator.SOURCE_BRIDGE_PATH,
    )
    monkeypatch.setattr(
        publisher, "_run_lean", lambda *_args: pytest.fail("Lean export must not run")
    )
    with pytest.raises(ValueError, match="committed-source provenance"):
        publisher.publish(paths)
    assert not paths.child.exists()
    assert not paths.receipt.exists()


def test_existing_output_is_not_replaced(tmp_path: Path) -> None:
    output = tmp_path / "child.cnf"
    output.write_bytes(b"existing")
    paths = publisher.PublicationPaths(
        parent=publisher.validator.PARENT_PATH,
        child=output,
        receipt=tmp_path / "receipt.json",
        audit_report=tmp_path / "audit.json",
        coverage_ledger=tmp_path / "ledger.json",
        validator_script=publisher.VALIDATOR_PATH,
        publisher_script=publisher.PUBLISHER_PATH,
        lean_root=publisher.validator.LEAN_ROOT_PATH,
        lean_export=publisher.validator.LEAN_EXPORT_PATH,
        parent_lean_root=publisher.validator.PARENT_LEAN_ROOT_PATH,
        parent_lean_export=publisher.validator.PARENT_LEAN_EXPORT_PATH,
        source_bridge=publisher.validator.SOURCE_BRIDGE_PATH,
    )
    with pytest.raises(ValueError, match="committed-source provenance"):
        publisher.publish(paths)
    assert output.read_bytes() == b"existing"
