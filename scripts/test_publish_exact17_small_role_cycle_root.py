from __future__ import annotations

import copy
import hashlib
import os
import stat
from pathlib import Path

import publish_exact17_small_role_cycle_root as publisher
import pytest

PAYLOAD = b"p cnf 3 1\n1 -2 0\n"


def _paths(tmp_path: Path) -> publisher.PublicationPaths:
    support = tmp_path / "support"
    package = tmp_path / "package"
    support.mkdir()
    files = {
        "parent": b"parent",
        "validator": b"validator",
        "publisher": b"publisher",
        "lean-root": b"lean root",
        "lean-export": b"lean export",
        "helper": b"helper",
        "parent-root": b"parent root",
        "parent-export": b"parent export",
        "model": b"model",
        "model-receipt": b"model receipt",
    }
    for name, data in files.items():
        (support / name).write_bytes(data)
    return publisher.PublicationPaths(
        parent=support / "parent",
        child=package / "exact17-small-role-cycle.cnf",
        receipt=package / "export-receipt.json",
        audit_report=package / "independent-audit-report.json",
        coverage_ledger=package / "coverage-ledger.json",
        validator_script=support / "validator",
        publisher_script=support / "publisher",
        lean_root=support / "lean-root",
        lean_export=support / "lean-export",
        kalmanson_helper=support / "helper",
        parent_lean_root=support / "parent-root",
        parent_lean_export=support / "parent-export",
        parent_model=support / "model",
        parent_model_receipt=support / "model-receipt",
    )


def _baseline(paths: publisher.PublicationPaths) -> publisher.PublisherBaseline:
    data = paths.publisher_script.read_bytes()
    return publisher.PublisherBaseline(
        source_commit="a" * 40,
        sha256=hashlib.sha256(data).hexdigest(),
        bytes=len(data),
    )


def _fake_validation(
    paths: publisher.PublicationPaths, child: Path
) -> dict[str, object]:
    result = copy.deepcopy(publisher._expected_validation(paths, child))
    result["child"] = {
        "path": os.path.abspath(child),
        "sha256": hashlib.sha256(PAYLOAD).hexdigest(),
        "bytes": len(PAYLOAD),
        "clauses": 1,
    }
    return result


def _permit_provenance(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        publisher,
        "_require_publisher_provenance",
        lambda paths, _baseline: publisher._artifact(paths.publisher_script),
    )
    monkeypatch.setattr(publisher, "_require_source_commit", lambda _paths: None)
    monkeypatch.setattr(
        publisher, "_require_final_inputs", lambda _paths, _baseline: None
    )


def _prepare_success(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    _permit_provenance(monkeypatch)
    monkeypatch.setattr(
        publisher,
        "_run_lean",
        lambda output, _paths: output.write_bytes(PAYLOAD),
    )
    monkeypatch.setattr(
        publisher,
        "_validation",
        lambda paths, child: _fake_validation(paths, child),
    )


def test_production_validator_pin_is_the_committed_handoff() -> None:
    assert publisher.VALIDATOR_SOURCE_COMMIT == (
        "fef0b6d8e62ff78466e18f93069fef102bb6efc1"
    )
    assert publisher.VALIDATOR_SHA256 == (
        "d30660888cb713f2a0744039146197da5c38639c5cdcdfafa0bda772b82ed836"
    )
    assert publisher.VALIDATOR_BYTES == 36_158


def test_lean_export_command_has_required_memory_limit(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    observed: dict[str, object] = {}

    def fake_run(command: list[str], **kwargs: object) -> None:
        observed["command"] = command
        observed["kwargs"] = kwargs

    monkeypatch.setattr(publisher.subprocess, "run", fake_run)
    output = tmp_path / "candidate.cnf"
    publisher._run_lean(output, publisher.PRODUCTION_PATHS)
    command = observed["command"]
    assert isinstance(command, list)
    assert command[:5] == ["lake", "env", "lean", "-M32768", "--run"]
    assert command[-1] == str(output.resolve())
    assert observed["kwargs"] == {
        "cwd": publisher.ROOT / "lean",
        "check": True,
    }


def test_source_commit_check_uses_log_show_and_live_validator_bytes(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    paths = publisher.PRODUCTION_PATHS
    latest_calls: list[tuple[Path, ...]] = []
    show_calls: list[tuple[str, Path]] = []

    def fake_latest(files: tuple[Path, ...]) -> str:
        latest_calls.append(files)
        if files == (paths.validator_script,):
            return publisher.VALIDATOR_SOURCE_COMMIT
        if files == (paths.parent_lean_root, paths.parent_lean_export):
            return publisher.validator.PARENT_SOURCE_COMMIT
        return publisher.validator.SOURCE_COMMIT

    def fake_show(commit: str, path: Path) -> bytes:
        show_calls.append((commit, path))
        return path.read_bytes()

    monkeypatch.setattr(publisher, "_latest_commit", fake_latest)
    monkeypatch.setattr(publisher, "_git_show", fake_show)
    publisher._require_source_commit(paths)
    assert (paths.validator_script,) in latest_calls
    assert (
        publisher.VALIDATOR_SOURCE_COMMIT,
        paths.validator_script,
    ) in show_calls


def test_committed_validator_byte_mismatch_is_rejected(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    paths = publisher.PRODUCTION_PATHS

    def fake_latest(files: tuple[Path, ...]) -> str:
        if files == (paths.validator_script,):
            return publisher.VALIDATOR_SOURCE_COMMIT
        if files == (paths.parent_lean_root, paths.parent_lean_export):
            return publisher.validator.PARENT_SOURCE_COMMIT
        return publisher.validator.SOURCE_COMMIT

    monkeypatch.setattr(publisher, "_latest_commit", fake_latest)
    monkeypatch.setattr(publisher, "_git_show", lambda *_args: b"wrong")
    with pytest.raises(ValueError, match="committed validator identity drifted"):
        publisher._require_source_commit(paths)


def test_validator_commit_binding_mismatch_is_rejected(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    paths = publisher.PRODUCTION_PATHS

    def fake_latest(files: tuple[Path, ...]) -> str:
        if files == (paths.validator_script,):
            return "0" * 40
        if files == (paths.parent_lean_root, paths.parent_lean_export):
            return publisher.validator.PARENT_SOURCE_COMMIT
        return publisher.validator.SOURCE_COMMIT

    monkeypatch.setattr(publisher, "_latest_commit", fake_latest)
    with pytest.raises(ValueError, match="validator commit binding drifted"):
        publisher._require_source_commit(paths)


def test_publisher_provenance_requires_log_show_and_live_identity(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    monkeypatch.setattr(
        publisher, "_latest_commit", lambda _paths: baseline.source_commit
    )
    monkeypatch.setattr(
        publisher,
        "_git_show",
        lambda commit, path: (
            path.read_bytes() if commit == baseline.source_commit else b""
        ),
    )
    assert publisher._require_publisher_provenance(paths, baseline) == (
        publisher._artifact(paths.publisher_script)
    )


@pytest.mark.parametrize(
    "baseline",
    [
        None,
        publisher.PublisherBaseline("bad", "0" * 64, 1),
        publisher.PublisherBaseline("0" * 40, "bad", 1),
        publisher.PublisherBaseline("0" * 40, "0" * 64, 0),
    ],
)
def test_malformed_publisher_provenance_is_rejected(
    tmp_path: Path,
    baseline: publisher.PublisherBaseline | None,
) -> None:
    with pytest.raises(ValueError, match="publisher committed-source provenance"):
        publisher._require_publisher_provenance(_paths(tmp_path), baseline)


def test_exact_validation_result_accepts_only_complete_profile(tmp_path: Path) -> None:
    paths = _paths(tmp_path)
    expected = publisher._expected_validation(paths, paths.child)
    publisher._require_exact_validation_result(expected, paths, paths.child)
    mutated = copy.deepcopy(expected)
    mutated["suffix"]["redundancy"]["witness_rows"] += 1
    with pytest.raises(ValueError, match="validation result drifted"):
        publisher._require_exact_validation_result(mutated, paths, paths.child)
    mutated = copy.deepcopy(expected)
    mutated["parent_model"]["falsified_nonredundant_suffix_indices"] = [87_731]
    with pytest.raises(ValueError, match="validation result drifted"):
        publisher._require_exact_validation_result(mutated, paths, paths.child)


def test_final_input_gate_detects_real_parent_model_mutation(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    monkeypatch.setattr(publisher, "_require_source_commit", lambda _paths: None)
    monkeypatch.setattr(publisher, "_require_publisher_provenance", lambda *_args: {})
    for prefix, path in (
        ("PARENT", paths.parent),
        ("PARENT_MODEL", paths.parent_model),
        ("PARENT_MODEL_RECEIPT", paths.parent_model_receipt),
    ):
        data = path.read_bytes()
        monkeypatch.setattr(
            publisher.validator, f"{prefix}_SHA256", hashlib.sha256(data).hexdigest()
        )
        monkeypatch.setattr(publisher.validator, f"{prefix}_BYTES", len(data))
    publisher._require_final_inputs(paths, baseline)
    paths.parent_model.write_bytes(b"mutated")
    with pytest.raises(ValueError, match="parent SAT model identity drifted"):
        publisher._require_final_inputs(paths, baseline)


def test_coverage_ledger_records_redundancy_model_cuts_and_memory_limit(
    tmp_path: Path,
) -> None:
    paths = _paths(tmp_path)
    validation = publisher._expected_validation(paths, paths.child)
    ledger = publisher.coverage_ledger(validation, _baseline(paths))
    assert ledger["redundancy"] == publisher._expected_redundancy()
    assert ledger["parent_model_cuts"]["falsified_nonredundant_suffix_indices"] == list(
        publisher.validator.MODEL_FALSIFIED_NONREDUNDANT_INDICES
    )
    assert ledger["lean_export"] == {
        "memory_limit": "-M32768",
        "direct_export": True,
    }
    assert ledger["claims"]["parent_model_cut_count"] == 7


def test_publication_is_create_once_and_receipt_last(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    writes: list[Path] = []
    original_write = publisher._write_exclusive_readonly
    original_stage_receipt = publisher._stage_receipt

    def recording_write(
        package: publisher.PackageRoot,
        reservation: publisher.CandidateReservation,
        path: Path,
        data: bytes,
    ) -> publisher.PublishedArtifact:
        writes.append(path)
        return original_write(package, reservation, path, data)

    monkeypatch.setattr(publisher, "_write_exclusive_readonly", recording_write)

    def recording_receipt(
        package: publisher.PackageRoot,
        reservation: publisher.CandidateReservation,
        path: Path,
        data: bytes,
    ) -> publisher.StagedReceipt:
        writes.append(path)
        return original_stage_receipt(package, reservation, path, data)

    monkeypatch.setattr(publisher, "_stage_receipt", recording_receipt)
    receipt = publisher.publish(paths, baseline)
    assert writes == [paths.audit_report, paths.coverage_ledger, paths.receipt]
    assert receipt["ordered_suffix"]["redundancy"] == (publisher._expected_redundancy())
    assert receipt["parent_model"]["falsified_nonredundant_suffix_indices"] == (
        list(publisher.validator.MODEL_FALSIFIED_NONREDUNDANT_INDICES)
    )
    assert receipt["lean_export"]["memory_limit"] == "-M32768"
    assert receipt["policy"]["ingress_requires_exact_package_allowlist"] is True
    assert receipt["policy"]["receipt_is_not_standalone_ingress_authority"] is True
    assert receipt["ingress_policy"] == {
        "receipt_alone_sufficient": False,
        "directory_enumeration": "retained-fd-exact-allowlist",
        "required_package_entries": sorted(
            [
                paths.child.name,
                paths.audit_report.name,
                paths.coverage_ledger.name,
                paths.receipt.name,
            ]
        ),
    }
    pinned_artifacts, pinned_imports = publisher._pinned_input_records(paths, baseline)
    for key, identity in pinned_artifacts.items():
        assert receipt["artifacts"][key] == identity
    assert receipt["source_imports"] == pinned_imports
    assert paths.child.read_bytes() == PAYLOAD
    assert stat.S_IMODE(paths.child.stat().st_mode) == 0o444
    assert {path.name for path in paths.child.parent.iterdir()} == {
        paths.child.name,
        paths.audit_report.name,
        paths.coverage_ledger.name,
        paths.receipt.name,
    }
    staging = list(tmp_path.glob(".package-stage-*"))
    assert len(staging) == 1
    assert stat.S_IMODE(staging[0].stat().st_mode) == 0o700
    assert not any(staging[0].iterdir())
    with pytest.raises(FileExistsError, match="refusing to replace"):
        publisher.publish(paths, baseline)


def test_candidate_workspace_is_private_and_file_is_exclusive(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _permit_provenance(monkeypatch)

    def inspect_and_write(output: Path, _paths: publisher.PublicationPaths) -> None:
        assert stat.S_IMODE(output.parent.stat().st_mode) == 0o700
        assert stat.S_IMODE(output.stat().st_mode) == 0o600
        assert output.stat().st_nlink == 1
        output.write_bytes(PAYLOAD)

    monkeypatch.setattr(publisher, "_run_lean", inspect_and_write)
    monkeypatch.setattr(
        publisher,
        "_validation",
        lambda current, child: _fake_validation(current, child),
    )
    publisher.publish(paths, baseline)


def test_workspace_is_closed_before_receipt_commit(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    original_close = publisher._close_reservation
    original_commit = publisher._commit_staged_receipt
    workspace_closed = False

    def recording_close(reservation: publisher.CandidateReservation) -> None:
        nonlocal workspace_closed
        original_close(reservation)
        workspace_closed = reservation.closed

    def checked_commit(
        package: publisher.PackageRoot, staged: publisher.StagedReceipt
    ) -> publisher.PublishedArtifact:
        assert workspace_closed
        assert not paths.receipt.exists()
        return original_commit(package, staged)

    monkeypatch.setattr(publisher, "_close_reservation", recording_close)
    monkeypatch.setattr(publisher, "_commit_staged_receipt", checked_commit)
    publisher.publish(paths, baseline)
    assert workspace_closed


def test_parent_mutation_during_receipt_staging_prevents_receipt_commit(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    expected_parent = paths.parent.read_bytes()
    original_stage = publisher._stage_receipt

    def final_inputs(
        current: publisher.PublicationPaths,
        _baseline: publisher.PublisherBaseline,
    ) -> None:
        if current.parent.read_bytes() != expected_parent:
            raise ValueError("parent CNF identity drifted")

    def mutate_after_stage(
        package: publisher.PackageRoot,
        reservation: publisher.CandidateReservation,
        path: Path,
        data: bytes,
    ) -> publisher.StagedReceipt:
        staged = original_stage(package, reservation, path, data)
        paths.parent.write_bytes(b"mutated parent")
        return staged

    monkeypatch.setattr(publisher, "_require_final_inputs", final_inputs)
    monkeypatch.setattr(publisher, "_stage_receipt", mutate_after_stage)
    with pytest.raises(ValueError, match="parent CNF identity drifted"):
        publisher.publish(paths, baseline)
    assert not paths.receipt.exists()


def test_model_mutation_during_receipt_commit_is_rejected_after_commit(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    expected_model = paths.parent_model.read_bytes()
    original_commit = publisher._commit_staged_receipt

    def final_inputs(
        current: publisher.PublicationPaths,
        _baseline: publisher.PublisherBaseline,
    ) -> None:
        if current.parent_model.read_bytes() != expected_model:
            raise ValueError("parent SAT model identity drifted")

    def mutate_after_commit(
        package: publisher.PackageRoot, staged: publisher.StagedReceipt
    ) -> publisher.PublishedArtifact:
        artifact = original_commit(package, staged)
        paths.parent_model.write_bytes(b"mutated model")
        return artifact

    monkeypatch.setattr(publisher, "_require_final_inputs", final_inputs)
    monkeypatch.setattr(publisher, "_commit_staged_receipt", mutate_after_commit)
    with pytest.raises(ValueError, match="parent SAT model identity drifted"):
        publisher.publish(paths, baseline)
    assert paths.receipt.exists()


@pytest.mark.parametrize("failure_path", ["audit", "ledger", "receipt"])
def test_metadata_failure_leaves_safe_partial_state_without_receipt(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, failure_path: str
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    target = {
        "audit": paths.audit_report,
        "ledger": paths.coverage_ledger,
        "receipt": paths.receipt,
    }[failure_path]
    original_write = publisher._write_exclusive_readonly

    def failing_write(
        package: publisher.PackageRoot,
        reservation: publisher.CandidateReservation,
        path: Path,
        data: bytes,
    ) -> publisher.PublishedArtifact:
        if path == target:
            raise OSError(f"injected {failure_path} failure")
        return original_write(package, reservation, path, data)

    monkeypatch.setattr(publisher, "_write_exclusive_readonly", failing_write)
    if failure_path == "receipt":

        def failing_receipt(
            _package: publisher.PackageRoot,
            _reservation: publisher.CandidateReservation,
            _path: Path,
            _data: bytes,
        ) -> publisher.StagedReceipt:
            raise OSError("injected receipt failure")

        monkeypatch.setattr(publisher, "_stage_receipt", failing_receipt)
    with pytest.raises(OSError, match="injected"):
        publisher.publish(paths, baseline)
    assert paths.child.exists()
    assert not paths.receipt.exists()
    expected_existing = {
        "audit": set(),
        "ledger": {paths.audit_report},
        "receipt": {paths.audit_report, paths.coverage_ledger},
    }[failure_path]
    for path in (paths.audit_report, paths.coverage_ledger):
        assert path.exists() is (path in expected_existing)


@pytest.mark.parametrize("existing", ["child", "audit", "ledger", "receipt"])
def test_existing_output_is_never_overwritten(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, existing: str
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    target = {
        "child": paths.child,
        "audit": paths.audit_report,
        "ledger": paths.coverage_ledger,
        "receipt": paths.receipt,
    }[existing]
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(b"foreign")
    with pytest.raises(FileExistsError, match="refusing to replace"):
        publisher.publish(paths, baseline)
    assert target.read_bytes() == b"foreign"


def test_symlinked_publication_directory_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    real = tmp_path / "real-package"
    real.mkdir()
    paths.child.parent.symlink_to(real, target_is_directory=True)
    _prepare_success(monkeypatch)
    with pytest.raises((OSError, ValueError)):
        publisher.publish(paths, _baseline(paths))
    assert not any(real.iterdir())


def test_output_symlink_is_not_replaced(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    target = tmp_path / "foreign"
    target.write_bytes(b"foreign")
    paths.child.parent.mkdir()
    paths.child.symlink_to(target)
    _prepare_success(monkeypatch)
    with pytest.raises(FileExistsError, match="refusing to replace"):
        publisher.publish(paths, _baseline(paths))
    assert target.read_bytes() == b"foreign"


def test_link_race_does_not_overwrite_or_rollback_foreign_file(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    original_publish = publisher._publish_candidate

    def raced_publish(
        package: publisher.PackageRoot,
        reservation: publisher.CandidateReservation,
        child: Path,
    ) -> publisher.PublishedArtifact:
        child.write_bytes(b"racer")
        return original_publish(package, reservation, child)

    monkeypatch.setattr(publisher, "_publish_candidate", raced_publish)
    with pytest.raises(FileExistsError):
        publisher.publish(paths, baseline)
    assert paths.child.read_bytes() == b"racer"


def test_candidate_mutation_after_validation_is_rejected_and_rolled_back(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    original_bind = publisher._bind_candidate_validation

    def mutate_after_binding(
        reservation: publisher.CandidateReservation,
        validation: dict[str, object],
    ) -> None:
        original_bind(reservation, validation)
        reservation.candidate.write_bytes(PAYLOAD + b"mutation")

    monkeypatch.setattr(publisher, "_bind_candidate_validation", mutate_after_binding)
    with pytest.raises(ValueError, match="validated candidate metadata changed"):
        publisher.publish(paths, baseline)
    assert not paths.child.exists()


def test_candidate_inode_swap_after_validation_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    original_bind = publisher._bind_candidate_validation

    def swap_after_binding(
        reservation: publisher.CandidateReservation,
        validation: dict[str, object],
    ) -> None:
        original_bind(reservation, validation)
        reservation.candidate.unlink()
        reservation.candidate.write_bytes(PAYLOAD)

    monkeypatch.setattr(publisher, "_bind_candidate_validation", swap_after_binding)
    with pytest.raises(ValueError, match="reserved inode"):
        publisher.publish(paths, baseline)
    assert not paths.child.exists()


def test_publication_requires_fsync_before_link(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    original_publish = publisher._publish_candidate

    def assert_fsynced(
        package: publisher.PackageRoot,
        reservation: publisher.CandidateReservation,
        child: Path,
    ) -> publisher.PublishedArtifact:
        assert reservation.fsynced is True
        return original_publish(package, reservation, child)

    monkeypatch.setattr(publisher, "_publish_candidate", assert_fsynced)
    publisher.publish(paths, baseline)


def test_missing_fsync_is_fail_closed_before_link(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    monkeypatch.setattr(publisher, "_fsync_candidate", lambda _reservation: None)
    with pytest.raises(ValueError, match="not fsynced"):
        publisher.publish(paths, baseline)
    assert not paths.child.exists()


def test_source_and_publisher_provenance_are_rechecked(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    source_checks = 0
    publisher_checks = 0

    def source_check(_paths: publisher.PublicationPaths) -> None:
        nonlocal source_checks
        source_checks += 1

    def publisher_check(
        current: publisher.PublicationPaths,
        _baseline: publisher.PublisherBaseline | None,
    ) -> dict[str, object]:
        nonlocal publisher_checks
        publisher_checks += 1
        return publisher._artifact(current.publisher_script)

    monkeypatch.setattr(publisher, "_require_source_commit", source_check)
    monkeypatch.setattr(publisher, "_require_publisher_provenance", publisher_check)

    def final_check(
        current: publisher.PublicationPaths,
        current_baseline: publisher.PublisherBaseline,
    ) -> None:
        source_check(current)
        publisher_check(current, current_baseline)

    monkeypatch.setattr(publisher, "_require_final_inputs", final_check)
    monkeypatch.setattr(
        publisher,
        "_run_lean",
        lambda output, _paths: output.write_bytes(PAYLOAD),
    )
    monkeypatch.setattr(
        publisher,
        "_validation",
        lambda current, child: _fake_validation(current, child),
    )
    publisher.publish(paths, baseline)
    assert source_checks == 6
    assert publisher_checks == 6


def test_precommit_validation_drift_prevents_public_child(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _permit_provenance(monkeypatch)
    monkeypatch.setattr(
        publisher,
        "_run_lean",
        lambda output, _paths: output.write_bytes(PAYLOAD),
    )
    calls = 0

    def drifting_validation(
        current: publisher.PublicationPaths, child: Path
    ) -> dict[str, object]:
        nonlocal calls
        calls += 1
        result = _fake_validation(current, child)
        if calls == 2:
            result["child"]["clauses"] = 2
        return result

    monkeypatch.setattr(publisher, "_validation", drifting_validation)
    with pytest.raises(ValueError, match="candidate validation changed"):
        publisher.publish(paths, baseline)
    assert not paths.child.exists()


def test_partial_metadata_write_never_becomes_public(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    package_path = tmp_path / "package"
    target = package_path / "metadata.json"
    package = publisher._open_package_root(package_path)
    reservation = publisher._reserve_candidate(package)
    original_write = os.write
    calls = 0

    def partial_then_fail(descriptor: int, data: bytes) -> int:
        nonlocal calls
        calls += 1
        if calls == 1:
            return original_write(descriptor, data[: max(1, len(data) // 2)])
        raise OSError("injected partial write failure")

    monkeypatch.setattr(os, "write", partial_then_fail)
    try:
        with pytest.raises(OSError, match="partial write"):
            publisher._write_exclusive_readonly(
                package, reservation, target, b"x" * 100
            )
        assert not target.exists()
    finally:
        with pytest.raises(ValueError, match="workspace is not empty"):
            publisher._close_reservation(reservation)
        publisher._close_package_root(package)


def test_end_to_end_partial_metadata_residue_is_private_and_receipt_absent(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    original_write = os.write
    calls = 0

    def partial_then_fail(descriptor: int, data: bytes) -> int:
        nonlocal calls
        calls += 1
        if calls == 1:
            return original_write(descriptor, data[: max(1, len(data) // 2)])
        raise OSError("injected partial metadata write")

    monkeypatch.setattr(os, "write", partial_then_fail)
    with pytest.raises(OSError, match="partial metadata"):
        publisher.publish(paths, baseline)
    assert {entry.name for entry in paths.child.parent.iterdir()} == {paths.child.name}
    assert not paths.receipt.exists()
    staging = list(tmp_path.glob(".package-stage-*"))
    assert len(staging) == 1
    assert stat.S_IMODE(staging[0].stat().st_mode) == 0o700
    residue = list(staging[0].iterdir())
    assert len(residue) == 1
    assert residue[0].name.startswith("metadata-")
    assert len(residue[0].name) == len("metadata-") + 32


def test_no_pathname_rollback_primitive_exists() -> None:
    assert not hasattr(publisher, "_remove_created")


def test_swapped_public_child_is_never_deleted_during_failure(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    original_write = publisher._write_exclusive_readonly

    def swap_child_after_audit(
        package: publisher.PackageRoot,
        reservation: publisher.CandidateReservation,
        path: Path,
        data: bytes,
    ) -> publisher.PublishedArtifact:
        artifact = original_write(package, reservation, path, data)
        if path == paths.audit_report:
            paths.child.unlink()
            paths.child.write_bytes(b"foreign replacement")
        return artifact

    monkeypatch.setattr(publisher, "_write_exclusive_readonly", swap_child_after_audit)
    with pytest.raises(ValueError, match="published artifact binding changed"):
        publisher.publish(paths, baseline)
    assert paths.child.read_bytes() == b"foreign replacement"
    assert not paths.receipt.exists()


def test_replaced_metadata_binding_cannot_yield_receipt(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    original_write = publisher._write_exclusive_readonly

    def replace_audit_after_commit(
        package: publisher.PackageRoot,
        reservation: publisher.CandidateReservation,
        path: Path,
        data: bytes,
    ) -> publisher.PublishedArtifact:
        artifact = original_write(package, reservation, path, data)
        if path == paths.audit_report:
            paths.audit_report.unlink()
            paths.audit_report.write_bytes(b"foreign audit")
        return artifact

    monkeypatch.setattr(
        publisher, "_write_exclusive_readonly", replace_audit_after_commit
    )
    with pytest.raises(ValueError, match="published artifact binding changed"):
        publisher.publish(paths, baseline)
    assert paths.audit_report.read_bytes() == b"foreign audit"
    assert not paths.receipt.exists()


def test_workspace_swap_is_not_removed_at_reservation_close(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    original_close = publisher._close_reservation
    swapped = False

    def swap_then_close(reservation: publisher.CandidateReservation) -> None:
        nonlocal swapped
        if not swapped and reservation.public_linked:
            swapped = True
            retained = reservation.workspace.with_name(
                reservation.workspace.name + "-old"
            )
            reservation.workspace.rename(retained)
            reservation.workspace.mkdir(mode=0o700)
        original_close(reservation)

    monkeypatch.setattr(publisher, "_close_reservation", swap_then_close)
    with pytest.raises(ValueError, match="workspace binding changed"):
        publisher.publish(paths, baseline)
    assert swapped
    assert not paths.receipt.exists()
    reservation_dirs = list(tmp_path.glob(".package-stage-*"))
    assert reservation_dirs
    assert all(path.is_dir() for path in reservation_dirs)


def test_package_root_rebinding_is_rejected_via_retained_descriptor(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    original_write = publisher._write_exclusive_readonly
    original_package = tmp_path / "original-package"

    def rebind_after_audit(
        package: publisher.PackageRoot,
        reservation: publisher.CandidateReservation,
        path: Path,
        data: bytes,
    ) -> publisher.PublishedArtifact:
        artifact = original_write(package, reservation, path, data)
        if path == paths.audit_report:
            paths.child.parent.rename(original_package)
            paths.child.parent.mkdir()
        return artifact

    monkeypatch.setattr(publisher, "_write_exclusive_readonly", rebind_after_audit)
    with pytest.raises(ValueError, match="package root binding changed"):
        publisher.publish(paths, baseline)
    assert not paths.receipt.exists()
    assert (original_package / paths.child.name).exists()


def test_package_root_rebinding_during_precommit_validation_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _permit_provenance(monkeypatch)
    monkeypatch.setattr(
        publisher,
        "_run_lean",
        lambda output, _paths: output.write_bytes(PAYLOAD),
    )
    calls = 0
    retained_package = tmp_path / "retained-package"

    def rebind_during_validation(
        current: publisher.PublicationPaths, child: Path
    ) -> dict[str, object]:
        nonlocal calls
        calls += 1
        result = _fake_validation(current, child)
        if calls == 2:
            paths.child.parent.rename(retained_package)
            paths.child.parent.mkdir()
        return result

    monkeypatch.setattr(publisher, "_validation", rebind_during_validation)
    with pytest.raises(ValueError, match="package root binding changed"):
        publisher.publish(paths, baseline)
    assert not paths.child.exists()
    assert not paths.receipt.exists()


def test_package_ancestor_rename_and_replacement_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    original_stage = publisher._stage_receipt
    retained_ancestor = tmp_path.with_name(tmp_path.name + "-retained")

    def replace_ancestor_after_stage(
        package: publisher.PackageRoot,
        reservation: publisher.CandidateReservation,
        path: Path,
        data: bytes,
    ) -> publisher.StagedReceipt:
        staged = original_stage(package, reservation, path, data)
        tmp_path.rename(retained_ancestor)
        tmp_path.mkdir()
        return staged

    monkeypatch.setattr(publisher, "_stage_receipt", replace_ancestor_after_stage)
    with pytest.raises(ValueError, match="package ancestor binding changed"):
        publisher.publish(paths, baseline)
    assert not paths.receipt.exists()
    assert not (retained_ancestor / "package" / paths.receipt.name).exists()


@pytest.mark.parametrize("stage", ["before", "after"])
def test_receipt_allowlist_rejects_intruder(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, stage: str
) -> None:
    paths = _paths(tmp_path)
    baseline = _baseline(paths)
    _prepare_success(monkeypatch)
    original_layout = publisher._assert_package_layout
    injected = False

    def inject_at_layout(package: publisher.PackageRoot, expected: set[str]) -> None:
        nonlocal injected
        wanted_count = 3 if stage == "before" else 4
        if not injected and len(expected) == wanted_count:
            descriptor = os.open(
                "intruder",
                os.O_WRONLY | os.O_CREAT | os.O_EXCL,
                0o600,
                dir_fd=package.directory_fd,
            )
            os.close(descriptor)
            injected = True
        original_layout(package, expected)

    monkeypatch.setattr(publisher, "_assert_package_layout", inject_at_layout)
    with pytest.raises(ValueError, match="package directory entries drifted"):
        publisher.publish(paths, baseline)
    assert injected
    assert (paths.child.parent / "intruder").exists()
    assert paths.receipt.exists() is (stage == "after")


@pytest.mark.parametrize("flag", ["O_NOFOLLOW", "O_DIRECTORY", "O_CLOEXEC"])
def test_missing_security_open_flag_is_fail_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, flag: str
) -> None:
    monkeypatch.setattr(os, flag, 0)
    monkeypatch.setattr(
        os,
        "open",
        lambda *_args, **_kwargs: pytest.fail("opened without required flag"),
    )
    with pytest.raises(ValueError, match=f"required open flag {flag}"):
        publisher._open_directory_nofollow(tmp_path, create=False)


@pytest.mark.parametrize("failure", ["stat", "fstat"])
def test_component_metadata_failure_does_not_leak_fds(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, failure: str
) -> None:
    leaf = tmp_path / "leaf"
    leaf.mkdir()
    original_open = os.open
    original_stat = os.stat
    original_fstat = os.fstat
    leaf_fds: set[int] = set()

    def tracked_open(path: object, *args: object, **kwargs: object) -> int:
        descriptor = original_open(path, *args, **kwargs)  # type: ignore[arg-type]
        if path == leaf.name:
            leaf_fds.add(descriptor)
        return descriptor

    def injected_stat(path: object, *args: object, **kwargs: object) -> os.stat_result:
        if failure == "stat" and path == leaf.name:
            raise OSError("injected component stat failure")
        return original_stat(path, *args, **kwargs)  # type: ignore[arg-type]

    def injected_fstat(descriptor: int) -> os.stat_result:
        if failure == "fstat" and descriptor in leaf_fds:
            raise OSError("injected component fstat failure")
        return original_fstat(descriptor)

    monkeypatch.setattr(os, "open", tracked_open)
    monkeypatch.setattr(os, "stat", injected_stat)
    monkeypatch.setattr(os, "fstat", injected_fstat)
    for _attempt in range(8):
        leaf_fds.clear()
        before = len(os.listdir("/dev/fd"))
        with pytest.raises(OSError, match="injected component"):
            publisher._open_directory_nofollow(leaf, create=False)
        assert len(os.listdir("/dev/fd")) == before


def test_publisher_baseline_failure_precedes_directory_creation(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    monkeypatch.setattr(
        publisher,
        "_require_publisher_provenance",
        lambda *_args: (_ for _ in ()).throw(ValueError("baseline drifted")),
    )
    monkeypatch.setattr(
        publisher,
        "_open_package_root",
        lambda _path: pytest.fail("created directory before provenance"),
    )
    with pytest.raises(ValueError, match="baseline drifted"):
        publisher.publish(paths, _baseline(paths))


def test_source_failure_precedes_directory_creation(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    paths = _paths(tmp_path)
    monkeypatch.setattr(
        publisher,
        "_require_publisher_provenance",
        lambda current, _baseline: publisher._artifact(current.publisher_script),
    )
    monkeypatch.setattr(
        publisher,
        "_require_source_commit",
        lambda _paths: (_ for _ in ()).throw(ValueError("source drifted")),
    )
    monkeypatch.setattr(
        publisher,
        "_open_package_root",
        lambda _path: pytest.fail("created directory before source pins"),
    )
    with pytest.raises(ValueError, match="source drifted"):
        publisher.publish(paths, _baseline(paths))


def test_canonical_json_is_stable_and_newline_terminated() -> None:
    assert publisher.canonical_json_bytes({"b": 2, "a": 1}) == b'{"a":1,"b":2}\n'
