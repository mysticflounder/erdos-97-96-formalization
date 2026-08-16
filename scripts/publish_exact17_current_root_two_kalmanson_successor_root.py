"""Create-once publication of the Lean-owned current-root two-Kalmanson successor CNF."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import secrets
import stat
import subprocess
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import validate_exact17_current_root_two_kalmanson_successor_export as validator

ROOT = Path(__file__).resolve().parents[1]
PACKAGE_ROOT = ROOT / "scratch/exact17-current-root-two-kalmanson-successor-package-v2"
CHILD_PATH = validator.CHILD_PATH
RECEIPT_PATH = PACKAGE_ROOT / "export-receipt.json"
AUDIT_REPORT_PATH = PACKAGE_ROOT / "independent-audit-report.json"
COVERAGE_LEDGER_PATH = PACKAGE_ROOT / "coverage-ledger.json"
VALIDATOR_PATH = Path(validator.__file__).resolve()
PUBLISHER_PATH = Path(__file__).resolve()

VALIDATOR_SOURCE_COMMIT = "423d51453169495a498c33f612a1ced4f2ac8cbe"
VALIDATOR_SHA256 = "56f9a1ff15f15800486460a1f618708b9a6f7738dd7d6b13a9463a385942ee51"
VALIDATOR_BYTES = 31_201

RECEIPT_SCHEMA = (
    "p97-exact17-current-root-two-kalmanson-successor-immutable-export-receipt/v2"
)
COVERAGE_SCHEMA = "p97-exact17-current-root-two-kalmanson-successor-coverage-ledger/v2"
AUDIT_SCHEMA = "p97-exact17-current-root-two-kalmanson-successor-independent-audit/v1"


@dataclass(frozen=True)
class PublicationPaths:
    parent: Path = validator.PARENT_PATH
    child: Path = CHILD_PATH
    receipt: Path = RECEIPT_PATH
    audit_report: Path = AUDIT_REPORT_PATH
    coverage_ledger: Path = COVERAGE_LEDGER_PATH
    validator_script: Path = VALIDATOR_PATH
    publisher_script: Path = PUBLISHER_PATH
    lean_root: Path = validator.LEAN_ROOT_PATH
    lean_export: Path = validator.LEAN_EXPORT_PATH
    parent_lean_root: Path = validator.PARENT_LEAN_ROOT_PATH
    parent_lean_export: Path = validator.PARENT_LEAN_EXPORT_PATH


PRODUCTION_PATHS = PublicationPaths()


@dataclass(frozen=True)
class PublisherBaseline:
    source_commit: str
    sha256: str
    bytes: int


@dataclass
class CandidateReservation:
    workspace: Path
    candidate: Path
    parent_fd: int
    workspace_fd: int
    file_fd: int
    workspace_device: int
    workspace_inode: int
    device: int
    inode: int
    validated_sha256: str | None = None
    validated_bytes: int | None = None
    validated_mtime_ns: int | None = None
    candidate_unlinked: bool = False
    closed: bool = False


def canonical_json_bytes(value: object) -> bytes:
    return (
        json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":"))
        + "\n"
    ).encode()


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _artifact(path: Path) -> dict[str, object]:
    digest = hashlib.sha256()
    byte_count = 0
    with validator._open_regular_nofollow(path) as stream:
        before = os.fstat(stream.fileno())
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
            byte_count += len(block)
        after = os.fstat(stream.fileno())
    if (
        before.st_dev,
        before.st_ino,
        before.st_size,
        before.st_mtime_ns,
        before.st_nlink,
    ) != (
        after.st_dev,
        after.st_ino,
        after.st_size,
        after.st_mtime_ns,
        after.st_nlink,
    ):
        raise ValueError(f"artifact changed during hashing: {path}")
    return {
        "path": os.path.abspath(path),
        "sha256": digest.hexdigest(),
        "bytes": byte_count,
    }


def _latest_commit(paths: tuple[Path, ...]) -> str:
    relative = [str(path.relative_to(ROOT)) for path in paths]
    result = subprocess.run(
        ["git", "log", "-1", "--format=%H", "--", *relative],
        cwd=ROOT,
        check=True,
        capture_output=True,
        text=True,
    )
    return result.stdout.strip()


def _git_show(commit: str, path: Path) -> bytes:
    relative = path.relative_to(ROOT)
    result = subprocess.run(
        ["git", "show", f"{commit}:{relative}"],
        cwd=ROOT,
        check=True,
        capture_output=True,
    )
    return result.stdout


def _is_sha256(value: str) -> bool:
    return len(value) == 64 and all(
        character in "0123456789abcdef" for character in value
    )


def _require_publisher_provenance(
    paths: PublicationPaths, baseline: PublisherBaseline | None
) -> dict[str, object]:
    if baseline is None:
        raise ValueError("publisher committed-source provenance is required")
    if (
        len(baseline.source_commit) != 40
        or not all(
            character in "0123456789abcdef" for character in baseline.source_commit
        )
        or not _is_sha256(baseline.sha256)
        or baseline.bytes <= 0
    ):
        raise ValueError("publisher committed-source provenance is malformed")
    if _latest_commit((paths.publisher_script,)) != baseline.source_commit:
        raise ValueError("publisher source commit binding drifted")
    committed = _git_show(baseline.source_commit, paths.publisher_script)
    if (hashlib.sha256(committed).hexdigest(), len(committed)) != (
        baseline.sha256,
        baseline.bytes,
    ):
        raise ValueError("publisher committed baseline identity drifted")
    live = _artifact(paths.publisher_script)
    if (live["sha256"], live["bytes"]) != (baseline.sha256, baseline.bytes):
        raise ValueError("live publisher differs from committed baseline")
    return live


def _require_source_commit(paths: PublicationPaths) -> None:
    source_groups = (
        (
            validator.SOURCE_COMMIT,
            (paths.lean_root, paths.lean_export),
            "Lean source",
        ),
        (
            validator.PARENT_SOURCE_COMMIT,
            (paths.parent_lean_root, paths.parent_lean_export),
            "parent Lean source",
        ),
        (
            VALIDATOR_SOURCE_COMMIT,
            (paths.validator_script,),
            "independent validator",
        ),
    )
    for expected_commit, files, label in source_groups:
        if _latest_commit(files) != expected_commit:
            raise ValueError(f"{label} commit binding drifted")
    expected_hashes = {
        paths.lean_root: validator.LEAN_ROOT_SHA256,
        paths.lean_export: validator.LEAN_EXPORT_SHA256,
        paths.parent_lean_root: validator.PARENT_LEAN_ROOT_SHA256,
        paths.parent_lean_export: validator.PARENT_LEAN_EXPORT_SHA256,
        paths.validator_script: VALIDATOR_SHA256,
    }
    for path, expected in expected_hashes.items():
        if validator.sha256_file(path) != expected:
            raise ValueError(f"source/import hash drifted: {path}")
    validator_artifact = _artifact(paths.validator_script)
    if (
        validator_artifact["sha256"],
        validator_artifact["bytes"],
    ) != (VALIDATOR_SHA256, VALIDATOR_BYTES):
        raise ValueError("independent validator byte binding drifted")


def _run_lean(output: Path, paths: PublicationPaths) -> None:
    exporter = paths.lean_export.resolve().relative_to((ROOT / "lean").resolve())
    subprocess.run(
        ["lake", "env", "lean", "--run", str(exporter), str(output.resolve())],
        cwd=ROOT / "lean",
        check=True,
    )


def _open_directory_nofollow(path: Path, *, create: bool) -> int:
    absolute = Path(os.path.abspath(path))
    flags = (
        os.O_RDONLY
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
        | getattr(os, "O_CLOEXEC", 0)
    )
    descriptor = os.open(absolute.anchor, flags)
    try:
        for component in absolute.parts[1:]:
            try:
                child = os.open(component, flags, dir_fd=descriptor)
            except FileNotFoundError:
                if not create:
                    raise
                os.mkdir(component, 0o755, dir_fd=descriptor)
                os.fsync(descriptor)
                child = os.open(component, flags, dir_fd=descriptor)
            except OSError as error:
                raise ValueError(
                    f"publication path traverses a non-directory or symlink: {path}"
                ) from error
            named = os.stat(component, dir_fd=descriptor, follow_symlinks=False)
            opened = os.fstat(child)
            if (named.st_dev, named.st_ino) != (opened.st_dev, opened.st_ino):
                os.close(child)
                raise ValueError(f"publication path changed while opening: {path}")
            os.close(descriptor)
            descriptor = child
        return descriptor
    except BaseException:
        os.close(descriptor)
        raise


def _ensure_real_directory(path: Path) -> None:
    descriptor = _open_directory_nofollow(path, create=True)
    os.close(descriptor)


def _fsync_directory(path: Path) -> None:
    descriptor = _open_directory_nofollow(path, create=False)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _assert_absent(path: Path) -> None:
    parent = _open_directory_nofollow(path.parent, create=False)
    try:
        try:
            os.stat(path.name, dir_fd=parent, follow_symlinks=False)
        except FileNotFoundError:
            return
        raise FileExistsError(f"refusing to replace existing artifact: {path}")
    finally:
        os.close(parent)


def _write_exclusive_readonly(path: Path, data: bytes) -> tuple[int, int]:
    parent = _open_directory_nofollow(path.parent, create=True)
    descriptor: int | None = None
    created_identity: tuple[int, int] | None = None
    try:
        descriptor = os.open(
            path.name,
            os.O_WRONLY
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_NOFOLLOW", 0)
            | getattr(os, "O_CLOEXEC", 0),
            0o444,
            dir_fd=parent,
        )
        created = os.fstat(descriptor)
        if (
            not stat.S_ISREG(created.st_mode)
            or created.st_nlink != 1
            or created.st_uid != os.getuid()
        ):
            raise ValueError("exclusive artifact is not an owned regular file")
        created_identity = (created.st_dev, created.st_ino)
        offset = 0
        while offset < len(data):
            written = os.write(descriptor, data[offset:])
            if written <= 0:
                raise OSError("short write while publishing artifact")
            offset += written
        os.fsync(descriptor)
        os.close(descriptor)
        descriptor = None
        os.fsync(parent)
    except BaseException as error:
        if descriptor is not None:
            os.close(descriptor)
        if created_identity is not None:
            try:
                _remove_created(path, *created_identity)
            except (FileNotFoundError, OSError, ValueError) as cleanup_error:
                error.add_note(f"artifact rollback warning: {cleanup_error}")
        raise
    finally:
        os.close(parent)
    if created_identity is None:
        raise RuntimeError("exclusive artifact identity was not recorded")
    return created_identity


def _reserve_candidate(package_directory: Path) -> CandidateReservation:
    """Reserve one inode inside an unpredictable, mode-0700 private directory."""

    parent_fd = _open_directory_nofollow(package_directory, create=False)
    workspace_name = f".current-root-two-kalmanson-{secrets.token_hex(16)}"
    workspace_fd: int | None = None
    file_fd: int | None = None
    workspace_created = False
    try:
        os.mkdir(workspace_name, 0o700, dir_fd=parent_fd)
        workspace_created = True
        os.fsync(parent_fd)
        flags = (
            os.O_RDONLY
            | getattr(os, "O_DIRECTORY", 0)
            | getattr(os, "O_NOFOLLOW", 0)
            | getattr(os, "O_CLOEXEC", 0)
        )
        workspace_fd = os.open(workspace_name, flags, dir_fd=parent_fd)
        workspace_named = os.stat(
            workspace_name, dir_fd=parent_fd, follow_symlinks=False
        )
        workspace_opened = os.fstat(workspace_fd)
        if (
            not stat.S_ISDIR(workspace_opened.st_mode)
            or stat.S_IMODE(workspace_opened.st_mode) != 0o700
            or (workspace_named.st_dev, workspace_named.st_ino)
            != (workspace_opened.st_dev, workspace_opened.st_ino)
        ):
            raise ValueError(
                "candidate workspace is not the reserved private directory"
            )
        file_fd = os.open(
            "candidate.cnf",
            os.O_RDWR
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_NOFOLLOW", 0)
            | getattr(os, "O_CLOEXEC", 0),
            0o600,
            dir_fd=workspace_fd,
        )
        candidate = os.fstat(file_fd)
        if (
            not stat.S_ISREG(candidate.st_mode)
            or candidate.st_nlink != 1
            or candidate.st_uid != os.getuid()
        ):
            raise ValueError(
                "candidate reservation is not an exclusive owned regular file"
            )
        return CandidateReservation(
            workspace=package_directory / workspace_name,
            candidate=package_directory / workspace_name / "candidate.cnf",
            parent_fd=parent_fd,
            workspace_fd=workspace_fd,
            file_fd=file_fd,
            workspace_device=workspace_opened.st_dev,
            workspace_inode=workspace_opened.st_ino,
            device=candidate.st_dev,
            inode=candidate.st_ino,
        )
    except BaseException:
        if file_fd is not None:
            os.close(file_fd)
        if workspace_fd is not None:
            try:
                os.unlink("candidate.cnf", dir_fd=workspace_fd)
            except FileNotFoundError:
                pass
            os.close(workspace_fd)
        if workspace_created:
            try:
                os.rmdir(workspace_name, dir_fd=parent_fd)
                os.fsync(parent_fd)
            except OSError:
                pass
        os.close(parent_fd)
        raise


def _assert_candidate_inode_binding(
    reservation: CandidateReservation,
) -> os.stat_result:
    if reservation.closed or reservation.candidate_unlinked:
        raise ValueError("candidate reservation is no longer active")
    workspace_named = os.stat(
        reservation.workspace.name,
        dir_fd=reservation.parent_fd,
        follow_symlinks=False,
    )
    workspace_opened = os.fstat(reservation.workspace_fd)
    if (
        workspace_named.st_dev,
        workspace_named.st_ino,
        workspace_opened.st_dev,
        workspace_opened.st_ino,
    ) != (
        reservation.workspace_device,
        reservation.workspace_inode,
        reservation.workspace_device,
        reservation.workspace_inode,
    ):
        raise ValueError("candidate workspace binding changed")
    named = os.stat(
        reservation.candidate.name,
        dir_fd=reservation.workspace_fd,
        follow_symlinks=False,
    )
    opened = os.fstat(reservation.file_fd)
    if (
        not stat.S_ISREG(named.st_mode)
        or not stat.S_ISREG(opened.st_mode)
        or opened.st_nlink != 1
        or opened.st_uid != os.getuid()
        or (named.st_dev, named.st_ino) != (reservation.device, reservation.inode)
        or (opened.st_dev, opened.st_ino) != (reservation.device, reservation.inode)
    ):
        raise ValueError("candidate path no longer names the reserved inode")
    return opened


def _assert_candidate_binding(reservation: CandidateReservation) -> os.stat_result:
    opened = _assert_candidate_inode_binding(reservation)
    if reservation.validated_bytes is not None and (
        opened.st_size,
        opened.st_mtime_ns,
    ) != (reservation.validated_bytes, reservation.validated_mtime_ns):
        raise ValueError("validated candidate metadata changed")
    return opened


def _hash_reserved_candidate(
    reservation: CandidateReservation,
) -> tuple[str, int, os.stat_result]:
    before = _assert_candidate_binding(reservation)
    digest = hashlib.sha256()
    offset = 0
    while block := os.pread(reservation.file_fd, 1 << 20, offset):
        digest.update(block)
        offset += len(block)
    after = _assert_candidate_binding(reservation)
    if (
        before.st_dev,
        before.st_ino,
        before.st_size,
        before.st_mtime_ns,
    ) != (after.st_dev, after.st_ino, after.st_size, after.st_mtime_ns):
        raise ValueError("candidate changed during descriptor-bound hashing")
    return digest.hexdigest(), offset, after


def _bind_candidate_validation(
    reservation: CandidateReservation, validation: dict[str, object]
) -> None:
    child = validation.get("child")
    if not isinstance(child, dict):
        raise TypeError("validator returned a malformed candidate identity")
    digest, byte_count, info = _hash_reserved_candidate(reservation)
    if (digest, byte_count) != (child.get("sha256"), child.get("bytes")):
        raise ValueError("validator did not authenticate the reserved candidate inode")
    reservation.validated_sha256 = digest
    reservation.validated_bytes = byte_count
    reservation.validated_mtime_ns = info.st_mtime_ns


def _verify_validated_candidate(reservation: CandidateReservation) -> None:
    if reservation.validated_sha256 is None or reservation.validated_bytes is None:
        raise ValueError("candidate has no descriptor-bound validation")
    digest, byte_count, _info = _hash_reserved_candidate(reservation)
    if (digest, byte_count) != (
        reservation.validated_sha256,
        reservation.validated_bytes,
    ):
        raise ValueError("validated candidate content changed")


def _fsync_candidate(reservation: CandidateReservation) -> None:
    before = _assert_candidate_binding(reservation)
    os.fsync(reservation.file_fd)
    after = _assert_candidate_binding(reservation)
    if (
        before.st_dev,
        before.st_ino,
        before.st_size,
        before.st_mtime_ns,
    ) != (after.st_dev, after.st_ino, after.st_size, after.st_mtime_ns):
        raise ValueError("candidate changed while fsyncing")


def _publish_candidate(
    reservation: CandidateReservation, child: Path
) -> tuple[int, int]:
    _verify_validated_candidate(reservation)
    target_parent = _open_directory_nofollow(child.parent, create=False)
    linked = False
    try:
        os.chmod(
            reservation.candidate.name,
            0o444,
            dir_fd=reservation.workspace_fd,
            follow_symlinks=False,
        )
        os.link(
            reservation.candidate.name,
            child.name,
            src_dir_fd=reservation.workspace_fd,
            dst_dir_fd=target_parent,
            follow_symlinks=False,
        )
        linked = True
        os.unlink(reservation.candidate.name, dir_fd=reservation.workspace_fd)
        reservation.candidate_unlinked = True
        os.fsync(reservation.workspace_fd)
        os.fsync(target_parent)
        published = os.stat(child.name, dir_fd=target_parent, follow_symlinks=False)
        opened = os.fstat(reservation.file_fd)
        if (
            not stat.S_ISREG(published.st_mode)
            or published.st_nlink != 1
            or (published.st_dev, published.st_ino)
            != (reservation.device, reservation.inode)
            or (opened.st_dev, opened.st_ino) != (reservation.device, reservation.inode)
        ):
            raise ValueError("published child is not an exclusive regular file")
    except BaseException as error:
        if linked:
            try:
                _remove_created(
                    child,
                    reservation.device,
                    reservation.inode,
                    expected_nlinks=(1,) if reservation.candidate_unlinked else (2,),
                )
            except (FileNotFoundError, OSError, ValueError) as cleanup_error:
                error.add_note(f"candidate rollback warning: {cleanup_error}")
        raise
    finally:
        os.close(target_parent)
    return reservation.device, reservation.inode


def _close_reservation(reservation: CandidateReservation) -> None:
    if reservation.closed:
        return
    error: Exception | None = None
    try:
        if not reservation.candidate_unlinked:
            try:
                _assert_candidate_inode_binding(reservation)
                os.chmod(
                    reservation.candidate.name,
                    0o600,
                    dir_fd=reservation.workspace_fd,
                    follow_symlinks=False,
                )
                os.unlink(reservation.candidate.name, dir_fd=reservation.workspace_fd)
                os.fsync(reservation.workspace_fd)
                reservation.candidate_unlinked = True
            except FileNotFoundError:
                pass
    except (OSError, ValueError) as caught:
        error = caught
    finally:
        os.close(reservation.file_fd)
        os.close(reservation.workspace_fd)
        try:
            os.rmdir(reservation.workspace.name, dir_fd=reservation.parent_fd)
            os.fsync(reservation.parent_fd)
        except (OSError, ValueError) as caught:
            if error is None:
                error = caught
        os.close(reservation.parent_fd)
        reservation.closed = True
    if error is not None:
        raise error


def _remove_created(
    path: Path,
    expected_device: int,
    expected_inode: int,
    *,
    expected_nlinks: tuple[int, ...] = (1,),
) -> None:
    parent = _open_directory_nofollow(path.parent, create=False)
    try:
        try:
            info = os.stat(path.name, dir_fd=parent, follow_symlinks=False)
        except FileNotFoundError:
            return
        if (
            not stat.S_ISREG(info.st_mode)
            or info.st_uid != os.getuid()
            or (info.st_dev, info.st_ino) != (expected_device, expected_inode)
            or info.st_nlink not in expected_nlinks
        ):
            raise ValueError(f"refusing unsafe rollback of {path}")
        os.chmod(path.name, 0o644, dir_fd=parent, follow_symlinks=False)
        os.unlink(path.name, dir_fd=parent)
        os.fsync(parent)
    finally:
        os.close(parent)


def _validation(paths: PublicationPaths, child: Path) -> dict[str, object]:
    return validator._validate_export(
        paths.parent,
        child,
        check_support=True,
        spec=validator.PRODUCTION_SPEC,
    )


def coverage_ledger(
    validation: dict[str, object], baseline: PublisherBaseline
) -> dict[str, Any]:
    """Return the exact, canonical v2 theorem-coverage ledger."""

    return {
        "schema": COVERAGE_SCHEMA,
        "status": "PASS",
        "profile_id": "exact17-current-root-two-kalmanson-successor",
        "source": {
            "commit": validator.SOURCE_COMMIT,
            "baseline_sha256": validator.SOURCE_BASELINE_SHA256,
            "lean_root_sha256": validator.LEAN_ROOT_SHA256,
            "lean_export_sha256": validator.LEAN_EXPORT_SHA256,
            "theorem": (
                "Problem97."
                "ATailBlockerVExactSeventeenCurrentRootTwoKalmansonSuccessorRefinements."
                "sourceAssign_extendedCurrentRootTwoKalmansonSuccessorCnf"
            ),
            "terminal_adapter": (
                "Problem97."
                "ATailBlockerVExactSeventeenCurrentRootTwoKalmansonSuccessorRefinements."
                "false_of_sourceRealization_of_extendedCurrentRootTwoKalmansonSuccessorCnf_unsat"
            ),
        },
        "parent": {
            "source_commit": validator.PARENT_SOURCE_COMMIT,
            "sha256": validator.PARENT_SHA256,
            "bytes": validator.PARENT_BYTES,
            "clauses": validator.PARENT_CLAUSES,
        },
        "child": validation["child"],
        "enumeration": {
            "occurrences": validator.OCCURRENCES,
            "named_orders": 2,
            "orientations": 2,
            "clauses_per_occurrence": validator.CLAUSES_PER_OCCURRENCE,
            "clauses": validator.SUFFIX_CLAUSES,
            "ordered_suffix_sha256": validator.SUFFIX_SHA256,
        },
        "tooling": {
            "validator_source_commit": VALIDATOR_SOURCE_COMMIT,
            "validator_sha256": VALIDATOR_SHA256,
            "validator_bytes": VALIDATOR_BYTES,
            "publisher_source_commit": baseline.source_commit,
            "publisher_sha256": baseline.sha256,
            "publisher_bytes": baseline.bytes,
        },
        "claims": {
            "source_entitlement": True,
            "theorem_coverage": True,
            "exact17_closure": False,
            "lean_closure": False,
            "universal_lift": False,
        },
    }


def publish(
    paths: PublicationPaths = PRODUCTION_PATHS,
    publisher_baseline: PublisherBaseline | None = None,
) -> dict[str, Any]:
    """Run the direct Lean exporter, independently replay, and publish once."""

    publisher_binding = _require_publisher_provenance(paths, publisher_baseline)
    _require_source_commit(paths)
    outputs = (
        paths.child,
        paths.audit_report,
        paths.coverage_ledger,
        paths.receipt,
    )
    for directory in {path.parent for path in outputs}:
        _ensure_real_directory(directory)
    for path in outputs:
        _assert_absent(path)

    reservation: CandidateReservation | None = None
    published: list[tuple[Path, int, int]] = []
    try:
        reservation = _reserve_candidate(paths.child.parent)
        _assert_candidate_binding(reservation)
        _run_lean(reservation.candidate, paths)
        _assert_candidate_binding(reservation)
        candidate_validation = _validation(paths, reservation.candidate)
        _assert_candidate_binding(reservation)
        _bind_candidate_validation(reservation, candidate_validation)
        _fsync_candidate(reservation)
        _require_source_commit(paths)
        publisher_binding = _require_publisher_provenance(paths, publisher_baseline)
        child_identity = _publish_candidate(reservation, paths.child)
        published.append((paths.child, *child_identity))
        _close_reservation(reservation)

        final_validation = _validation(paths, paths.child)
        candidate_child = candidate_validation["child"]
        final_child = final_validation["child"]
        if not isinstance(candidate_child, dict) or not isinstance(final_child, dict):
            raise TypeError("validator returned a malformed child identity")
        identity_keys = ("sha256", "bytes", "clauses")
        if any(candidate_child[key] != final_child[key] for key in identity_keys):
            raise ValueError(
                "published child identity differs from validated candidate"
            )
        child_artifact = _artifact(paths.child)
        if (child_artifact["sha256"], child_artifact["bytes"]) != (
            final_child["sha256"],
            final_child["bytes"],
        ):
            raise ValueError("published child changed after final validation")
        publisher_binding = _require_publisher_provenance(paths, publisher_baseline)

        audit = {
            "schema": AUDIT_SCHEMA,
            "status": "PASS",
            "validator": _artifact(paths.validator_script),
            "validation": final_validation,
        }
        audit_identity = _write_exclusive_readonly(
            paths.audit_report, canonical_json_bytes(audit)
        )
        published.append((paths.audit_report, *audit_identity))

        ledger = coverage_ledger(final_validation, publisher_baseline)
        ledger_bytes = canonical_json_bytes(ledger)
        ledger_identity = _write_exclusive_readonly(paths.coverage_ledger, ledger_bytes)
        published.append((paths.coverage_ledger, *ledger_identity))

        receipt = {
            "schema": RECEIPT_SCHEMA,
            "status": "PASS",
            "publication_state": "PROVISIONED",
            "profile_id": "exact17-current-root-two-kalmanson-successor",
            "source_commit": validator.SOURCE_COMMIT,
            "source_baseline_sha256": validator.SOURCE_BASELINE_SHA256,
            "parent_source_commit": validator.PARENT_SOURCE_COMMIT,
            "validator_source_commit": VALIDATOR_SOURCE_COMMIT,
            "publisher_source_commit": publisher_baseline.source_commit,
            "parent": final_validation["parent"],
            "child": final_child,
            "ordered_suffix": final_validation["suffix"],
            "artifacts": {
                "parent_cnf": _artifact(paths.parent),
                "child_cnf": child_artifact,
                "lean_root": _artifact(paths.lean_root),
                "lean_export": _artifact(paths.lean_export),
                "publisher_script": publisher_binding,
                "independent_audit_script": _artifact(paths.validator_script),
                "independent_audit_report": _artifact(paths.audit_report),
                "coverage_ledger": _artifact(paths.coverage_ledger),
            },
            "source_imports": {
                "parent_lean_root": _artifact(paths.parent_lean_root),
                "parent_lean_export": _artifact(paths.parent_lean_export),
            },
            "coverage_ledger": {
                "schema": COVERAGE_SCHEMA,
                "sha256": _sha256_bytes(ledger_bytes),
            },
            "policy": {
                "direct_lean_export": True,
                "exact_parent_body_prefix": True,
                "independent_suffix_replay": True,
                "final_child_revalidated": True,
                "component_wise_nofollow": True,
                "candidate_reserved_inode": True,
                "candidate_private_workspace": True,
                "candidate_fsynced_after_validation": True,
                "publisher_committed_baseline": True,
                "create_once": True,
                "receipt_written_last": True,
                "solver_result_claimed": False,
            },
        }
        _write_exclusive_readonly(paths.receipt, canonical_json_bytes(receipt))
        return receipt
    except BaseException as error:
        cleanup_errors: list[Exception] = []
        if reservation is not None and not reservation.closed:
            try:
                _close_reservation(reservation)
            except (OSError, ValueError) as cleanup_error:
                cleanup_errors.append(cleanup_error)
        for path, device, inode in reversed(published):
            try:
                _remove_created(path, device, inode)
            except (OSError, ValueError) as cleanup_error:
                cleanup_errors.append(cleanup_error)
        for cleanup_error in cleanup_errors:
            error.add_note(f"publication rollback warning: {cleanup_error}")
        raise


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--publisher-source-commit", required=True)
    parser.add_argument("--publisher-sha256", required=True)
    parser.add_argument("--publisher-bytes", required=True, type=int)
    args = parser.parse_args(argv)
    baseline = PublisherBaseline(
        source_commit=args.publisher_source_commit,
        sha256=args.publisher_sha256,
        bytes=args.publisher_bytes,
    )
    print(json.dumps(publish(publisher_baseline=baseline), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
