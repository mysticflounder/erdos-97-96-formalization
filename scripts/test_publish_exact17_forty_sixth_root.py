from __future__ import annotations

from pathlib import Path

import publish_exact17_forty_sixth_root as publisher
import pytest


def _paths(tmp_path: Path) -> publisher.PublicationPaths:
    return publisher.PublicationPaths(
        child=tmp_path / "child.cnf",
        receipt=tmp_path / "receipt.json",
    )


def _fake_export(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(
        publisher, "_run_lean", lambda output: output.write_bytes(b"candidate")
    )
    monkeypatch.setattr(
        publisher,
        "_validate_candidate",
        lambda _paths, _candidate: {
            "schema": publisher.VALIDATION_SCHEMA,
            "status": "PASS",
            "ordered_suffix_sha256": "05b1b92d77d56be54fee3ccc0c09cb66b31453dffb2b97dc3f99bbda37eb47ea",
            "parent_sha256": publisher.PARENT_SHA256,
            "child_sha256": publisher.CHILD_SHA256,
            "parent_bytes": publisher.PARENT_BYTES,
            "child_bytes": publisher.CHILD_BYTES,
            "variables": publisher.VARIABLES,
            "parent_clauses": publisher.PARENT_CLAUSES,
            "new_clauses": publisher.validator.NEW_CLAUSES,
            "child_clauses": publisher.CHILD_CLAUSES,
            "parent_subsumed_suffix_indices": list(
                publisher.validator.PARENT_SUBSUMED_SUFFIX_INDICES
            ),
            "authenticated_model_cut_suffix_indices": list(
                publisher.validator.AUTHENTICATED_MODEL_CUT_SUFFIX_INDICES
            ),
            "cell_model_rejections": [{} for _ in range(13)],
        },
    )
    monkeypatch.setattr(publisher, "_record_path", lambda path: str(path))


def test_publish_is_create_once_and_retains_full_validation(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _fake_export(monkeypatch)
    payload = publisher.publish(paths)
    assert paths.child.exists()
    assert paths.receipt.exists()
    assert payload["schema"] == "p97-exact17-child46-immutable-export-receipt/v1"
    assert (
        payload["validation"]["ordered_suffix_sha256"]
        == "05b1b92d77d56be54fee3ccc0c09cb66b31453dffb2b97dc3f99bbda37eb47ea"
    )
    with pytest.raises(FileExistsError, match="existing FortySixth root"):
        publisher.publish(paths)


def test_existing_receipt_fails_before_export(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    paths.receipt.write_text("existing\n", encoding="utf-8")
    monkeypatch.setattr(
        publisher, "_run_lean", lambda _output: pytest.fail("export must not run")
    )
    with pytest.raises(FileExistsError, match="existing FortySixth receipt"):
        publisher.publish(paths)


def test_validation_failure_does_not_publish(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    monkeypatch.setattr(
        publisher, "_run_lean", lambda output: output.write_bytes(b"mutated")
    )
    monkeypatch.setattr(
        publisher,
        "_validate_candidate",
        lambda *_args: (_ for _ in ()).throw(ValueError("candidate mutation")),
    )
    with pytest.raises(ValueError, match="candidate mutation"):
        publisher.publish(paths)
    assert not paths.child.exists()
    assert not paths.receipt.exists()


def test_receipt_interruption_cleans_only_owned_child(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _fake_export(monkeypatch)
    monkeypatch.setattr(
        publisher,
        "_publish_receipt",
        lambda *_args: (_ for _ in ()).throw(RuntimeError("interrupted")),
    )
    with pytest.raises(RuntimeError, match="interrupted"):
        publisher.publish(paths)
    assert not paths.child.exists()
    assert not paths.receipt.exists()


def test_symlinked_publication_ancestor_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    real = tmp_path / "real"
    real.mkdir()
    alias = tmp_path / "alias"
    alias.symlink_to(real, target_is_directory=True)
    paths = publisher.PublicationPaths(
        child=alias / "child.cnf", receipt=alias / "receipt.json"
    )
    monkeypatch.setattr(
        publisher, "_run_lean", lambda _output: pytest.fail("export must not run")
    )
    with pytest.raises(OSError):
        publisher.publish(paths)
