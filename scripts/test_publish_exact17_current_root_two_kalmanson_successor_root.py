from __future__ import annotations

import hashlib
import json
import os
from dataclasses import replace
from pathlib import Path

import publish_exact17_current_root_two_kalmanson_successor_root as publisher
import pytest


def _paths(tmp_path: Path) -> publisher.PublicationPaths:
    support = tmp_path / "support"
    support.mkdir()
    files: dict[str, Path] = {}
    for name in (
        "parent",
        "validator",
        "publisher",
        "root",
        "export",
        "parent_root",
        "parent_export",
    ):
        path = support / name
        path.write_bytes(name.encode())
        files[name] = path
    package = tmp_path / "package"
    return publisher.PublicationPaths(
        parent=files["parent"],
        child=package / "child.cnf",
        receipt=package / "receipt.json",
        audit_report=package / "audit.json",
        coverage_ledger=package / "coverage.json",
        validator_script=files["validator"],
        publisher_script=files["publisher"],
        lean_root=files["root"],
        lean_export=files["export"],
        parent_lean_root=files["parent_root"],
        parent_lean_export=files["parent_export"],
    )


def _fake_validation(
    paths: publisher.PublicationPaths, child: Path
) -> dict[str, object]:
    return {
        "schema": publisher.validator.VALIDATION_SCHEMA,
        "status": "PASS",
        "parent": {
            "path": str(paths.parent.resolve()),
            "sha256": hashlib.sha256(b"parent").hexdigest(),
            "bytes": 6,
            "clauses": publisher.validator.PARENT_CLAUSES,
        },
        "child": {
            "path": str(child.resolve()),
            "sha256": hashlib.sha256(b"candidate").hexdigest(),
            "bytes": 9,
            "clauses": publisher.validator.CHILD_CLAUSES,
        },
        "suffix": {
            "sha256": publisher.validator.SUFFIX_SHA256,
            "bytes": publisher.validator.SUFFIX_BYTES,
            "clauses": publisher.validator.SUFFIX_CLAUSES,
        },
    }


def _baseline(paths: publisher.PublicationPaths) -> publisher.PublisherBaseline:
    data = paths.publisher_script.read_bytes()
    return publisher.PublisherBaseline(
        source_commit="a" * 40,
        sha256=hashlib.sha256(data).hexdigest(),
        bytes=len(data),
    )


def _permit_provenance(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(
        publisher,
        "_require_publisher_provenance",
        lambda paths, _baseline: publisher._artifact(paths.publisher_script),
    )


def _prepare_success(
    paths: publisher.PublicationPaths, monkeypatch: pytest.MonkeyPatch
) -> None:
    _permit_provenance(monkeypatch)
    monkeypatch.setattr(publisher, "_require_source_commit", lambda _paths: None)
    monkeypatch.setattr(
        publisher,
        "_run_lean",
        lambda output, _paths: output.write_bytes(b"candidate"),
    )
    monkeypatch.setattr(
        publisher,
        "_validation",
        lambda _paths, child: _fake_validation(paths, child),
    )


def test_publication_is_create_once_and_receipt_last(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _prepare_success(paths, monkeypatch)
    order: list[Path] = []
    original_write = publisher._write_exclusive_readonly

    def write(path: Path, data: bytes) -> tuple[int, int]:
        identity = original_write(path, data)
        order.append(path)
        return identity

    monkeypatch.setattr(publisher, "_write_exclusive_readonly", write)
    receipt = publisher.publish(paths, _baseline(paths))
    assert order == [paths.audit_report, paths.coverage_ledger, paths.receipt]
    assert receipt["schema"] == publisher.RECEIPT_SCHEMA
    assert paths.child.read_bytes() == b"candidate"
    assert receipt["child"]["path"] == str(paths.child.resolve())
    assert receipt["policy"]["final_child_revalidated"] is True
    assert receipt["policy"]["receipt_written_last"] is True
    assert ".current-root-two-kalmanson-" not in paths.receipt.read_text()
    with pytest.raises(FileExistsError):
        publisher.publish(paths, _baseline(paths))


def test_ledger_v2_pins_sources_validator_and_publisher(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _prepare_success(paths, monkeypatch)
    publisher.publish(paths, _baseline(paths))
    ledger = json.loads(paths.coverage_ledger.read_text())
    receipt = json.loads(paths.receipt.read_text())
    assert ledger["schema"] == publisher.COVERAGE_SCHEMA
    assert ledger["enumeration"] == {
        "clauses": 324,
        "clauses_per_occurrence": 4,
        "named_orders": 2,
        "occurrences": 81,
        "ordered_suffix_sha256": publisher.validator.SUFFIX_SHA256,
        "orientations": 2,
    }
    assert ledger["source"]["commit"] == publisher.validator.SOURCE_COMMIT
    assert ledger["tooling"]["validator_source_commit"] == (
        publisher.VALIDATOR_SOURCE_COMMIT
    )
    assert ledger["tooling"]["validator_sha256"] == publisher.VALIDATOR_SHA256
    assert ledger["tooling"]["validator_bytes"] == publisher.VALIDATOR_BYTES
    assert (
        ledger["tooling"]["publisher_source_commit"] == _baseline(paths).source_commit
    )
    assert (
        ledger["tooling"]["publisher_sha256"]
        == hashlib.sha256(b"publisher").hexdigest()
    )
    assert ledger["tooling"]["publisher_bytes"] == len(b"publisher")
    assert (
        receipt["coverage_ledger"]["sha256"]
        == hashlib.sha256(paths.coverage_ledger.read_bytes()).hexdigest()
    )


def test_validator_provenance_pins_match_committed_and_live_source() -> None:
    assert publisher._latest_commit((publisher.VALIDATOR_PATH,)) == (
        publisher.VALIDATOR_SOURCE_COMMIT
    )
    committed = publisher._git_show(
        publisher.VALIDATOR_SOURCE_COMMIT, publisher.VALIDATOR_PATH
    )
    assert (hashlib.sha256(committed).hexdigest(), len(committed)) == (
        publisher.VALIDATOR_SHA256,
        publisher.VALIDATOR_BYTES,
    )
    live = publisher._artifact(publisher.VALIDATOR_PATH)
    assert (live["sha256"], live["bytes"]) == (
        publisher.VALIDATOR_SHA256,
        publisher.VALIDATOR_BYTES,
    )


def test_source_binding_fails_before_export(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _permit_provenance(monkeypatch)
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
        publisher.publish(paths, _baseline(paths))


def test_candidate_validation_failure_publishes_nothing(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _permit_provenance(monkeypatch)
    monkeypatch.setattr(publisher, "_require_source_commit", lambda _paths: None)
    monkeypatch.setattr(
        publisher,
        "_run_lean",
        lambda output, _paths: output.write_bytes(b"bad"),
    )
    monkeypatch.setattr(
        publisher,
        "_validation",
        lambda *_args: (_ for _ in ()).throw(ValueError("bad export")),
    )
    with pytest.raises(ValueError, match="bad export"):
        publisher.publish(paths, _baseline(paths))
    assert not any(
        path.exists()
        for path in (
            paths.child,
            paths.audit_report,
            paths.coverage_ledger,
            paths.receipt,
        )
    )


def test_final_validation_failure_rolls_back_child(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _permit_provenance(monkeypatch)
    monkeypatch.setattr(publisher, "_require_source_commit", lambda _paths: None)
    monkeypatch.setattr(
        publisher,
        "_run_lean",
        lambda output, _paths: output.write_bytes(b"candidate"),
    )
    calls = 0

    def validate(_paths: publisher.PublicationPaths, child: Path) -> dict[str, object]:
        nonlocal calls
        calls += 1
        if calls == 2:
            raise ValueError("final replay failed")
        return _fake_validation(paths, child)

    monkeypatch.setattr(publisher, "_validation", validate)
    with pytest.raises(ValueError, match="final replay failed"):
        publisher.publish(paths, _baseline(paths))
    assert not paths.child.exists()
    assert not paths.audit_report.exists()
    assert not paths.coverage_ledger.exists()
    assert not paths.receipt.exists()


def test_metadata_write_failure_rolls_back_all_prior_artifacts(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _prepare_success(paths, monkeypatch)
    original_write = publisher._write_exclusive_readonly

    def write(path: Path, data: bytes) -> tuple[int, int] | None:
        if path == paths.coverage_ledger:
            raise OSError("ledger fsync failed")
        return original_write(path, data)

    monkeypatch.setattr(publisher, "_write_exclusive_readonly", write)
    with pytest.raises(OSError, match="ledger fsync failed"):
        publisher.publish(paths, _baseline(paths))
    assert not any(
        path.exists()
        for path in (
            paths.child,
            paths.audit_report,
            paths.coverage_ledger,
            paths.receipt,
        )
    )


def test_preexisting_output_fails_before_export(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _permit_provenance(monkeypatch)
    paths.child.parent.mkdir()
    paths.receipt.write_bytes(b"existing")
    monkeypatch.setattr(publisher, "_require_source_commit", lambda _paths: None)
    monkeypatch.setattr(
        publisher,
        "_run_lean",
        lambda *_args: pytest.fail("Lean must not run after no-overwrite failure"),
    )
    with pytest.raises(FileExistsError):
        publisher.publish(paths, _baseline(paths))


def test_symlinked_package_directory_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _permit_provenance(monkeypatch)
    real_package = tmp_path / "real-package"
    real_package.mkdir()
    paths.child.parent.symlink_to(real_package, target_is_directory=True)
    monkeypatch.setattr(publisher, "_require_source_commit", lambda _paths: None)
    monkeypatch.setattr(
        publisher,
        "_run_lean",
        lambda *_args: pytest.fail("Lean must not run through symlink"),
    )
    with pytest.raises(ValueError, match="non-directory or symlink"):
        publisher.publish(paths, _baseline(paths))


def test_intermediate_symlink_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _permit_provenance(monkeypatch)
    real_package = tmp_path / "real-intermediate"
    real_package.mkdir()
    redirect = tmp_path / "redirect"
    redirect.symlink_to(real_package, target_is_directory=True)
    package = redirect / "nested"
    paths = replace(
        paths,
        child=package / "child.cnf",
        receipt=package / "receipt.json",
        audit_report=package / "audit.json",
        coverage_ledger=package / "coverage.json",
    )
    monkeypatch.setattr(publisher, "_require_source_commit", lambda _paths: None)
    monkeypatch.setattr(
        publisher,
        "_run_lean",
        lambda *_args: pytest.fail("Lean must not follow intermediate symlink"),
    )
    with pytest.raises(ValueError, match="non-directory or symlink"):
        publisher.publish(paths, _baseline(paths))


def test_hardlinked_candidate_is_rejected(tmp_path: Path) -> None:
    reservation = publisher._reserve_candidate(tmp_path)
    child = tmp_path / "child"
    alias = tmp_path / "alias"
    reservation.candidate.write_bytes(b"candidate")
    publisher._bind_candidate_validation(
        reservation,
        {
            "child": {
                "sha256": hashlib.sha256(b"candidate").hexdigest(),
                "bytes": len(b"candidate"),
            }
        },
    )
    os.link(reservation.candidate, alias)
    try:
        with pytest.raises(ValueError, match="reserved inode"):
            publisher._publish_candidate(reservation, child)
        assert reservation.candidate.exists() and alias.exists() and not child.exists()
    finally:
        alias.unlink()
        publisher._close_reservation(reservation)


def test_artifact_rejects_hardlink_added_during_hash(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    artifact = tmp_path / "artifact"
    alias = tmp_path / "artifact-alias"
    artifact.write_bytes(b"payload")
    real_sha256 = publisher.hashlib.sha256

    class HashingDigest:
        def __init__(self) -> None:
            self.inner = real_sha256()

        def update(self, data: bytes) -> None:
            self.inner.update(data)
            if not alias.exists():
                os.link(artifact, alias)

        def hexdigest(self) -> str:
            return self.inner.hexdigest()

    monkeypatch.setattr(publisher.hashlib, "sha256", HashingDigest)
    try:
        with pytest.raises(ValueError, match="artifact changed during hashing"):
            publisher._artifact(artifact)
    finally:
        alias.unlink()


def test_exclusive_write_refuses_existing_symlink(tmp_path: Path) -> None:
    target = tmp_path / "target"
    target.write_bytes(b"preserve")
    output = tmp_path / "output"
    output.symlink_to(target)
    with pytest.raises(FileExistsError):
        publisher._write_exclusive_readonly(output, b"replace")
    assert target.read_bytes() == b"preserve"
    assert output.is_symlink()


def test_exclusive_write_does_not_remove_existing_file(tmp_path: Path) -> None:
    output = tmp_path / "output"
    output.write_bytes(b"preserve")
    with pytest.raises(FileExistsError):
        publisher._write_exclusive_readonly(output, b"replace")
    assert output.read_bytes() == b"preserve"


def test_partial_metadata_write_is_removed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output = tmp_path / "output"
    monkeypatch.setattr(
        publisher.os,
        "write",
        lambda *_args: (_ for _ in ()).throw(OSError("write failed")),
    )
    with pytest.raises(OSError, match="write failed"):
        publisher._write_exclusive_readonly(output, b"payload")
    assert not output.exists()


def test_candidate_publish_fsync_failure_removes_linked_child(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    reservation = publisher._reserve_candidate(tmp_path)
    child = tmp_path / "child"
    reservation.candidate.write_bytes(b"candidate")
    publisher._bind_candidate_validation(
        reservation,
        {
            "child": {
                "sha256": hashlib.sha256(b"candidate").hexdigest(),
                "bytes": len(b"candidate"),
            }
        },
    )
    real_fsync = publisher.os.fsync
    calls = 0

    def fsync(descriptor: int) -> None:
        nonlocal calls
        calls += 1
        if calls == 1:
            raise OSError("fsync failed")
        real_fsync(descriptor)

    monkeypatch.setattr(publisher.os, "fsync", fsync)
    try:
        with pytest.raises(OSError, match="fsync failed"):
            publisher._publish_candidate(reservation, child)
        assert not child.exists()
    finally:
        publisher._close_reservation(reservation)


def test_candidate_rollback_leaves_same_owner_replacement_untouched(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    reservation = publisher._reserve_candidate(tmp_path)
    child = tmp_path / "child"
    reservation.candidate.write_bytes(b"candidate")
    publisher._bind_candidate_validation(
        reservation,
        {
            "child": {
                "sha256": hashlib.sha256(b"candidate").hexdigest(),
                "bytes": len(b"candidate"),
            }
        },
    )
    real_fsync = publisher.os.fsync
    calls = 0

    def fsync(descriptor: int) -> None:
        nonlocal calls
        calls += 1
        if calls == 1:
            child.unlink()
            child.write_bytes(b"replacement")
            raise OSError("fsync failed")
        real_fsync(descriptor)

    monkeypatch.setattr(publisher.os, "fsync", fsync)
    try:
        with pytest.raises(OSError, match="fsync failed") as caught:
            publisher._publish_candidate(reservation, child)
        assert child.read_bytes() == b"replacement"
        assert any(
            "candidate rollback warning" in note for note in caught.value.__notes__
        )
    finally:
        child.unlink()
        publisher._close_reservation(reservation)


def test_candidate_rollback_rejects_added_hardlink(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    reservation = publisher._reserve_candidate(tmp_path)
    child = tmp_path / "child"
    alias = tmp_path / "child-alias"
    reservation.candidate.write_bytes(b"candidate")
    publisher._bind_candidate_validation(
        reservation,
        {
            "child": {
                "sha256": hashlib.sha256(b"candidate").hexdigest(),
                "bytes": len(b"candidate"),
            }
        },
    )
    real_fsync = publisher.os.fsync
    calls = 0

    def fsync(descriptor: int) -> None:
        nonlocal calls
        calls += 1
        if calls == 1:
            os.link(child, alias)
            raise OSError("fsync failed")
        real_fsync(descriptor)

    monkeypatch.setattr(publisher.os, "fsync", fsync)
    try:
        with pytest.raises(OSError, match="fsync failed") as caught:
            publisher._publish_candidate(reservation, child)
        assert child.exists() and alias.exists()
        assert any(
            "candidate rollback warning" in note for note in caught.value.__notes__
        )
    finally:
        alias.unlink()
        child.unlink()
        publisher._close_reservation(reservation)


def test_missing_publisher_provenance_fails_before_other_work(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    monkeypatch.setattr(
        publisher,
        "_require_source_commit",
        lambda *_args: pytest.fail("source checks must follow publisher provenance"),
    )
    monkeypatch.setattr(
        publisher,
        "_run_lean",
        lambda *_args: pytest.fail("Lean must not run without publisher provenance"),
    )
    with pytest.raises(ValueError, match="committed-source provenance is required"):
        publisher.publish(paths)


def test_mutated_publisher_fails_committed_baseline(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    committed = paths.publisher_script.read_bytes()
    baseline = _baseline(paths)
    monkeypatch.setattr(
        publisher,
        "_latest_commit",
        lambda _paths: baseline.source_commit,
    )
    monkeypatch.setattr(
        publisher,
        "_git_show",
        lambda _commit, _path: committed,
    )
    paths.publisher_script.write_bytes(committed + b"mutated")
    with pytest.raises(ValueError, match="live publisher differs"):
        publisher._require_publisher_provenance(paths, baseline)


def test_missing_committed_publisher_bytes_are_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    monkeypatch.setattr(
        publisher,
        "_latest_commit",
        lambda _paths: baseline.source_commit,
    )
    monkeypatch.setattr(publisher, "_git_show", lambda *_args: b"")
    with pytest.raises(ValueError, match="committed baseline identity drifted"):
        publisher._require_publisher_provenance(paths, baseline)


def test_preexisting_candidate_workspace_is_not_reused(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    workspace = tmp_path / ".current-root-two-kalmanson-fixed"
    workspace.mkdir()
    sentinel = workspace / "sentinel"
    sentinel.write_bytes(b"preserve")
    monkeypatch.setattr(publisher.secrets, "token_hex", lambda _count: "fixed")
    with pytest.raises(FileExistsError):
        publisher._reserve_candidate(tmp_path)
    assert sentinel.read_bytes() == b"preserve"


def test_racing_candidate_path_is_rejected(tmp_path: Path) -> None:
    reservation = publisher._reserve_candidate(tmp_path)
    target = tmp_path / "target"
    target.write_bytes(b"preserve")
    reservation.candidate.unlink()
    reservation.candidate.symlink_to(target)
    try:
        with pytest.raises(ValueError, match="reserved inode"):
            publisher._assert_candidate_binding(reservation)
        assert target.read_bytes() == b"preserve"
    finally:
        reservation.candidate.unlink()
        publisher._close_reservation(reservation)


def test_validator_identity_must_match_reserved_inode(tmp_path: Path) -> None:
    reservation = publisher._reserve_candidate(tmp_path)
    reservation.candidate.write_bytes(b"candidate")
    try:
        with pytest.raises(ValueError, match="reserved candidate inode"):
            publisher._bind_candidate_validation(
                reservation,
                {"child": {"sha256": "0" * 64, "bytes": len(b"candidate")}},
            )
    finally:
        publisher._close_reservation(reservation)


def test_candidate_mutation_after_validation_is_rejected(tmp_path: Path) -> None:
    reservation = publisher._reserve_candidate(tmp_path)
    child = tmp_path / "child"
    reservation.candidate.write_bytes(b"candidate")
    publisher._bind_candidate_validation(
        reservation,
        {
            "child": {
                "sha256": hashlib.sha256(b"candidate").hexdigest(),
                "bytes": len(b"candidate"),
            }
        },
    )
    reservation.candidate.write_bytes(b"tampered!")
    try:
        with pytest.raises(ValueError, match="validated candidate"):
            publisher._publish_candidate(reservation, child)
        assert not child.exists()
    finally:
        publisher._close_reservation(reservation)


def test_candidate_fsync_occurs_after_validation_before_publication(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    _prepare_success(paths, monkeypatch)
    events: list[str] = []
    fake_validation = publisher._validation
    fsync_candidate = publisher._fsync_candidate
    publish_candidate = publisher._publish_candidate

    def validate(
        checked_paths: publisher.PublicationPaths, child: Path
    ) -> dict[str, object]:
        events.append("validate")
        return fake_validation(checked_paths, child)

    def fsync(reservation: publisher.CandidateReservation) -> None:
        assert events == ["validate"]
        fsync_candidate(reservation)
        events.append("fsync")

    def publish_reserved(
        reservation: publisher.CandidateReservation, child: Path
    ) -> tuple[int, int]:
        assert events[-1] == "fsync"
        identity = publish_candidate(reservation, child)
        events.append("publish")
        return identity

    monkeypatch.setattr(publisher, "_validation", validate)
    monkeypatch.setattr(publisher, "_fsync_candidate", fsync)
    monkeypatch.setattr(publisher, "_publish_candidate", publish_reserved)
    publisher.publish(paths, _baseline(paths))
    assert events == ["validate", "fsync", "publish", "validate"]
