"""Create-once publication of the validated exact-17 small-role-cycle root."""

from __future__ import annotations

import argparse
import copy
import ctypes
import errno
import hashlib
import json
import os
import secrets
import stat
import subprocess
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

import validate_exact17_small_role_cycle_export as validator

ROOT = Path(__file__).resolve().parents[1]
PACKAGE_ROOT = ROOT / "scratch/exact17-small-role-cycle-package-v2"
CHILD_PATH = PACKAGE_ROOT / "exact17-small-role-cycle.cnf"
RECEIPT_PATH = PACKAGE_ROOT / "export-receipt.json"
AUDIT_REPORT_PATH = PACKAGE_ROOT / "independent-audit-report.json"
COVERAGE_LEDGER_PATH = PACKAGE_ROOT / "coverage-ledger.json"
VALIDATOR_PATH = Path(validator.__file__).resolve()
PUBLISHER_PATH = Path(__file__).resolve()

VALIDATOR_SOURCE_COMMIT = "fef0b6d8e62ff78466e18f93069fef102bb6efc1"
VALIDATOR_SHA256 = "d30660888cb713f2a0744039146197da5c38639c5cdcdfafa0bda772b82ed836"
VALIDATOR_BYTES = 36_158
LEAN_ROOT_BYTES = 20_762
LEAN_EXPORT_BYTES = 1_262
KALMANSON_HELPER_BYTES = 19_361
PARENT_LEAN_ROOT_BYTES = 146_300
PARENT_LEAN_EXPORT_BYTES = 1_362
LEAN_MEMORY_LIMIT = "-M32768"

RECEIPT_SCHEMA = "p97-exact17-small-role-cycle-immutable-export-receipt/v2"
COVERAGE_SCHEMA = "p97-exact17-small-role-cycle-coverage-ledger/v2"
AUDIT_SCHEMA = "p97-exact17-small-role-cycle-independent-audit/v1"


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
    kalmanson_helper: Path = validator.KALMANSON_HELPER_PATH
    parent_lean_root: Path = validator.PARENT_LEAN_ROOT_PATH
    parent_lean_export: Path = validator.PARENT_LEAN_EXPORT_PATH
    parent_model: Path = validator.PARENT_MODEL_PATH
    parent_model_receipt: Path = validator.PARENT_MODEL_RECEIPT_PATH


PRODUCTION_PATHS = PublicationPaths()


@dataclass(frozen=True)
class PublisherBaseline:
    source_commit: str
    sha256: str
    bytes: int


@dataclass
class PackageRoot:
    path: Path
    parent_fd: int
    directory_fd: int
    parent_device: int
    parent_inode: int
    device: int
    inode: int
    closed: bool = False


@dataclass
class PublishedArtifact:
    path: Path
    fd: int
    device: int
    inode: int
    size: int
    mtime_ns: int
    staged_name: str = ""
    closed: bool = False


@dataclass
class StagedReceipt:
    path: Path
    parent_name: str
    fd: int
    device: int
    inode: int
    size: int
    mtime_ns: int
    committed: bool = False
    closed: bool = False


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
    fsynced: bool = False
    public_linked: bool = False
    staged_artifacts: list[PublishedArtifact] = field(default_factory=list)
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
        before = validator._state(stream)
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
            byte_count += len(block)
        after = validator._state(stream)
    if before != after:
        raise ValueError(f"artifact changed during hashing: {path}")
    return {
        "path": os.path.abspath(path),
        "sha256": digest.hexdigest(),
        "bytes": byte_count,
    }


def _known_artifact(path: Path, sha256: str, byte_count: int) -> dict[str, object]:
    return {
        "path": os.path.abspath(path),
        "sha256": sha256,
        "bytes": byte_count,
    }


def _require_pinned_artifact(
    path: Path, sha256: str, byte_count: int, label: str
) -> None:
    observed = _artifact(path)
    if (observed["sha256"], observed["bytes"]) != (sha256, byte_count):
        raise ValueError(f"{label} identity drifted")


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


def _is_lower_hex(value: str, length: int) -> bool:
    return len(value) == length and all(
        character in "0123456789abcdef" for character in value
    )


def _require_publisher_provenance(
    paths: PublicationPaths, baseline: PublisherBaseline | None
) -> dict[str, object]:
    if baseline is None:
        raise ValueError("publisher committed-source provenance is required")
    if (
        not _is_lower_hex(baseline.source_commit, 40)
        or not _is_lower_hex(baseline.sha256, 64)
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
            (paths.lean_root, paths.lean_export, paths.kalmanson_helper),
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

    expected_identities = {
        paths.lean_root: (validator.LEAN_ROOT_SHA256, LEAN_ROOT_BYTES),
        paths.lean_export: (validator.LEAN_EXPORT_SHA256, LEAN_EXPORT_BYTES),
        paths.kalmanson_helper: (
            validator.KALMANSON_HELPER_SHA256,
            KALMANSON_HELPER_BYTES,
        ),
        paths.parent_lean_root: (
            validator.PARENT_LEAN_ROOT_SHA256,
            PARENT_LEAN_ROOT_BYTES,
        ),
        paths.parent_lean_export: (
            validator.PARENT_LEAN_EXPORT_SHA256,
            PARENT_LEAN_EXPORT_BYTES,
        ),
        paths.validator_script: (VALIDATOR_SHA256, VALIDATOR_BYTES),
    }
    for path, (expected_sha256, expected_bytes) in expected_identities.items():
        _require_pinned_artifact(
            path, expected_sha256, expected_bytes, f"source/import {path}"
        )

    committed_validator = _git_show(VALIDATOR_SOURCE_COMMIT, paths.validator_script)
    committed_identity = (
        hashlib.sha256(committed_validator).hexdigest(),
        len(committed_validator),
    )
    if committed_identity != (VALIDATOR_SHA256, VALIDATOR_BYTES):
        raise ValueError("committed validator identity drifted")
    live_validator = _artifact(paths.validator_script)
    if (live_validator["sha256"], live_validator["bytes"]) != (
        VALIDATOR_SHA256,
        VALIDATOR_BYTES,
    ):
        raise ValueError("live validator identity drifted")


def _pinned_input_records(
    paths: PublicationPaths, baseline: PublisherBaseline
) -> tuple[dict[str, dict[str, object]], dict[str, dict[str, object]]]:
    artifacts = {
        "parent_cnf": _known_artifact(
            paths.parent, validator.PARENT_SHA256, validator.PARENT_BYTES
        ),
        "lean_root": _known_artifact(
            paths.lean_root, validator.LEAN_ROOT_SHA256, LEAN_ROOT_BYTES
        ),
        "lean_export": _known_artifact(
            paths.lean_export, validator.LEAN_EXPORT_SHA256, LEAN_EXPORT_BYTES
        ),
        "kalmanson_helper": _known_artifact(
            paths.kalmanson_helper,
            validator.KALMANSON_HELPER_SHA256,
            KALMANSON_HELPER_BYTES,
        ),
        "parent_model": _known_artifact(
            paths.parent_model,
            validator.PARENT_MODEL_SHA256,
            validator.PARENT_MODEL_BYTES,
        ),
        "parent_model_receipt": _known_artifact(
            paths.parent_model_receipt,
            validator.PARENT_MODEL_RECEIPT_SHA256,
            validator.PARENT_MODEL_RECEIPT_BYTES,
        ),
        "publisher_script": _known_artifact(
            paths.publisher_script, baseline.sha256, baseline.bytes
        ),
        "independent_audit_script": _known_artifact(
            paths.validator_script, VALIDATOR_SHA256, VALIDATOR_BYTES
        ),
    }
    source_imports = {
        "parent_lean_root": _known_artifact(
            paths.parent_lean_root,
            validator.PARENT_LEAN_ROOT_SHA256,
            PARENT_LEAN_ROOT_BYTES,
        ),
        "parent_lean_export": _known_artifact(
            paths.parent_lean_export,
            validator.PARENT_LEAN_EXPORT_SHA256,
            PARENT_LEAN_EXPORT_BYTES,
        ),
    }
    return artifacts, source_imports


def _require_final_inputs(paths: PublicationPaths, baseline: PublisherBaseline) -> None:
    """Reauthenticate every mutable input used by PASS metadata."""

    _require_source_commit(paths)
    _require_publisher_provenance(paths, baseline)
    for path, sha256, byte_count, label in (
        (
            paths.parent,
            validator.PARENT_SHA256,
            validator.PARENT_BYTES,
            "parent CNF",
        ),
        (
            paths.parent_model,
            validator.PARENT_MODEL_SHA256,
            validator.PARENT_MODEL_BYTES,
            "parent SAT model",
        ),
        (
            paths.parent_model_receipt,
            validator.PARENT_MODEL_RECEIPT_SHA256,
            validator.PARENT_MODEL_RECEIPT_BYTES,
            "parent SAT model receipt",
        ),
    ):
        _require_pinned_artifact(path, sha256, byte_count, label)


def _expected_redundancy() -> dict[str, object]:
    return {
        "parent_subsuming_clauses": 276,
        "parent_subsumed_suffix_clauses": 64_097,
        "nonredundant_suffix_clauses": 96_791,
        "shortest_parent_length_distribution": {
            "1": 62_537,
            "2": 1_416,
            "7": 144,
        },
        "family_shortest_parent_length_distribution": [
            {"family": "five", "length": 1, "count": 48_519},
            {"family": "five", "length": 2, "count": 1_056},
            {"family": "five", "length": 7, "count": 101},
            {"family": "four", "length": 1, "count": 14_018},
            {"family": "four", "length": 2, "count": 360},
            {"family": "four", "length": 7, "count": 43},
        ],
        "parent_exact_duplicate_suffix_clauses": 204,
        "witness_serialization": (
            "ASCII `<suffix_index> <minimal-length-then-first-parent-index>\\n`, "
            "suffix index ascending"
        ),
        "witness_rows": 64_097,
        "witness_bytes": 850_436,
        "witness_sha256": validator.REDUNDANCY_WITNESS_SHA256,
    }


def _expected_validation(paths: PublicationPaths, child: Path) -> dict[str, object]:
    return {
        "schema": validator.VALIDATION_SCHEMA,
        "status": "PASS",
        "source_baseline_sha256": validator.SOURCE_BASELINE_SHA256,
        "source_commit": validator.SOURCE_COMMIT,
        "parent_source_commit": validator.PARENT_SOURCE_COMMIT,
        "variables": validator.VARIABLES,
        "parent": {
            "path": os.path.abspath(paths.parent),
            "sha256": validator.PARENT_SHA256,
            "bytes": validator.PARENT_BYTES,
            "clauses": validator.PARENT_CLAUSES,
        },
        "child": {
            "path": os.path.abspath(child),
            "sha256": validator.CHILD_SHA256,
            "bytes": validator.CHILD_BYTES,
            "clauses": validator.CHILD_CLAUSES,
        },
        "suffix": {
            "sha256": validator.SUFFIX_SHA256,
            "bytes": validator.SUFFIX_BYTES,
            "clauses": validator.SUFFIX_CLAUSES,
            "generator": "independent-python-exact17-small-role-cycle-generator/v1",
            "five_role_clauses": validator.FIVE_ROLE_CLAUSES,
            "four_role_clauses": validator.FOUR_ROLE_CLAUSES,
            "five_role_offset_choices": validator.FIVE_ROLE_OFFSET_CHOICES,
            "four_role_offset_choices": validator.FOUR_ROLE_OFFSET_CHOICES,
            "named_orders": 2,
            "directions": 2,
            "cuts": 17,
            "semantic_duplicates": 0,
            "redundancy": _expected_redundancy(),
        },
        "parent_model": {
            "path": os.path.abspath(paths.parent_model),
            "sha256": validator.PARENT_MODEL_SHA256,
            "bytes": validator.PARENT_MODEL_BYTES,
            "receipt_path": os.path.abspath(paths.parent_model_receipt),
            "receipt_sha256": validator.PARENT_MODEL_RECEIPT_SHA256,
            "receipt_bytes": validator.PARENT_MODEL_RECEIPT_BYTES,
            "independently_satisfies_parent": True,
            "falsified_nonredundant_suffix_indices": list(
                validator.MODEL_FALSIFIED_NONREDUNDANT_INDICES
            ),
        },
        "lean": {
            "root_sha256": validator.LEAN_ROOT_SHA256,
            "export_sha256": validator.LEAN_EXPORT_SHA256,
            "kalmanson_helper_sha256": validator.KALMANSON_HELPER_SHA256,
        },
        "parent_lean": {
            "root_sha256": validator.PARENT_LEAN_ROOT_SHA256,
            "export_sha256": validator.PARENT_LEAN_EXPORT_SHA256,
        },
    }


def _require_exact_validation_result(
    validation: dict[str, object], paths: PublicationPaths, child: Path
) -> None:
    if validation != _expected_validation(paths, child):
        raise ValueError("independent validation result drifted")


def _validation(paths: PublicationPaths, child: Path) -> dict[str, object]:
    result = validator._validate_export(
        paths.parent,
        child,
        check_support=True,
        spec=validator.PRODUCTION_SPEC,
    )
    _require_exact_validation_result(result, paths, child)
    return result


def _run_lean(output: Path, paths: PublicationPaths) -> None:
    exporter = paths.lean_export.resolve().relative_to((ROOT / "lean").resolve())
    subprocess.run(
        [
            "lake",
            "env",
            "lean",
            LEAN_MEMORY_LIMIT,
            "--run",
            str(exporter),
            str(output.resolve()),
        ],
        cwd=ROOT / "lean",
        check=True,
    )


def _required_open_flag(name: str) -> int:
    value = getattr(os, name, None)
    if type(value) is not int or value == 0:
        raise ValueError(f"required open flag {name} is unavailable")
    return value


def _directory_flags() -> int:
    return (
        os.O_RDONLY
        | _required_open_flag("O_DIRECTORY")
        | _required_open_flag("O_NOFOLLOW")
        | _required_open_flag("O_CLOEXEC")
    )


def _open_directory_nofollow(path: Path, *, create: bool) -> int:
    absolute = Path(os.path.abspath(path))
    flags = _directory_flags()
    descriptor = os.open(absolute.anchor, flags)
    try:
        for component in absolute.parts[1:]:
            child: int | None = None
            try:
                try:
                    child = os.open(component, flags, dir_fd=descriptor)
                except FileNotFoundError:
                    if not create:
                        raise
                    os.mkdir(component, 0o755, dir_fd=descriptor)
                    os.fsync(descriptor)
                    child = os.open(component, flags, dir_fd=descriptor)
                named = os.stat(component, dir_fd=descriptor, follow_symlinks=False)
                opened = os.fstat(child)
                if not stat.S_ISDIR(opened.st_mode) or (named.st_dev, named.st_ino) != (
                    opened.st_dev,
                    opened.st_ino,
                ):
                    raise ValueError(f"publication path changed while opening: {path}")
                os.close(descriptor)
                descriptor = child
                child = None
            except BaseException:
                if child is not None:
                    os.close(child)
                raise
        return descriptor
    except BaseException:
        os.close(descriptor)
        raise


def _open_package_root(path: Path) -> PackageRoot:
    absolute = Path(os.path.abspath(path))
    parent_fd = _open_directory_nofollow(absolute.parent, create=True)
    directory_fd: int | None = None
    try:
        try:
            os.mkdir(absolute.name, 0o755, dir_fd=parent_fd)
            os.fsync(parent_fd)
        except FileExistsError:
            pass
        directory_fd = os.open(absolute.name, _directory_flags(), dir_fd=parent_fd)
        named = os.stat(absolute.name, dir_fd=parent_fd, follow_symlinks=False)
        opened = os.fstat(directory_fd)
        if (
            not stat.S_ISDIR(named.st_mode)
            or not stat.S_ISDIR(opened.st_mode)
            or opened.st_uid != os.getuid()
            or (named.st_dev, named.st_ino) != (opened.st_dev, opened.st_ino)
        ):
            raise ValueError("package root is not a stable owned directory")
        parent_opened = os.fstat(parent_fd)
        return PackageRoot(
            path=absolute,
            parent_fd=parent_fd,
            directory_fd=directory_fd,
            parent_device=parent_opened.st_dev,
            parent_inode=parent_opened.st_ino,
            device=opened.st_dev,
            inode=opened.st_ino,
        )
    except BaseException:
        if directory_fd is not None:
            os.close(directory_fd)
        os.close(parent_fd)
        raise


def _assert_package_ancestor(package: PackageRoot) -> os.stat_result:
    if package.closed:
        raise ValueError("package root descriptor is closed")
    reopened_fd = _open_directory_nofollow(package.path.parent, create=False)
    try:
        reopened = os.fstat(reopened_fd)
        retained = os.fstat(package.parent_fd)
        if (
            not stat.S_ISDIR(reopened.st_mode)
            or not stat.S_ISDIR(retained.st_mode)
            or (
                reopened.st_dev,
                reopened.st_ino,
                retained.st_dev,
                retained.st_ino,
            )
            != (
                package.parent_device,
                package.parent_inode,
                package.parent_device,
                package.parent_inode,
            )
        ):
            raise ValueError("package ancestor binding changed")
        return retained
    finally:
        os.close(reopened_fd)


def _assert_package_root(package: PackageRoot) -> os.stat_result:
    _assert_package_ancestor(package)
    named = os.stat(package.path.name, dir_fd=package.parent_fd, follow_symlinks=False)
    opened = os.fstat(package.directory_fd)
    if (
        not stat.S_ISDIR(named.st_mode)
        or not stat.S_ISDIR(opened.st_mode)
        or opened.st_uid != os.getuid()
        or (named.st_dev, named.st_ino, opened.st_dev, opened.st_ino)
        != (package.device, package.inode, package.device, package.inode)
    ):
        raise ValueError("package root binding changed")
    _assert_package_ancestor(package)
    return opened


def _close_package_root(package: PackageRoot) -> None:
    if package.closed:
        return
    os.close(package.directory_fd)
    os.close(package.parent_fd)
    package.closed = True


def _require_output_path(package: PackageRoot, path: Path) -> None:
    if Path(os.path.abspath(path.parent)) != package.path:
        raise ValueError(f"output is outside the retained package root: {path}")


def _assert_absent(package: PackageRoot, path: Path) -> None:
    _assert_package_root(package)
    _require_output_path(package, path)
    try:
        os.stat(path.name, dir_fd=package.directory_fd, follow_symlinks=False)
    except FileNotFoundError:
        return
    raise FileExistsError(f"refusing to replace existing artifact: {path}")


def _assert_package_layout(package: PackageRoot, expected: set[str]) -> None:
    _assert_package_root(package)
    actual = set(os.listdir(package.directory_fd))
    _assert_package_root(package)
    if actual != expected:
        raise ValueError(
            f"package directory entries drifted: expected {sorted(expected)}, "
            f"found {sorted(actual)}"
        )
    _assert_package_root(package)


def _rename_exclusive(
    source_fd: int, source_name: str, target_fd: int, target_name: str
) -> None:
    """Atomically commit a staged name without ever replacing a target."""

    library = ctypes.CDLL(None, use_errno=True)
    source = os.fsencode(source_name)
    target = os.fsencode(target_name)
    function = getattr(library, "renameatx_np", None)
    flag = 0x00000004  # Darwin RENAME_EXCL.
    if function is None:
        function = getattr(library, "renameat2", None)
        flag = 0x00000001  # Linux RENAME_NOREPLACE.
    if function is None:
        raise ValueError("atomic exclusive rename is unavailable")
    function.argtypes = [
        ctypes.c_int,
        ctypes.c_char_p,
        ctypes.c_int,
        ctypes.c_char_p,
        ctypes.c_uint,
    ]
    function.restype = ctypes.c_int
    if function(source_fd, source, target_fd, target, flag) != 0:
        error_number = ctypes.get_errno()
        if error_number in (errno.EEXIST, errno.ENOTEMPTY):
            raise FileExistsError(error_number, os.strerror(error_number), target_name)
        raise OSError(error_number, os.strerror(error_number), target_name)


def _reserve_candidate(package: PackageRoot) -> CandidateReservation:
    """Reserve one inode in a sibling private staging directory."""

    _assert_package_root(package)
    parent_fd = package.parent_fd
    workspace_name = f".{package.path.name}-stage-{secrets.token_hex(16)}"
    workspace_fd: int | None = None
    file_fd: int | None = None
    try:
        os.mkdir(workspace_name, 0o700, dir_fd=parent_fd)
        os.fsync(parent_fd)
        workspace_fd = os.open(workspace_name, _directory_flags(), dir_fd=parent_fd)
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
            | _required_open_flag("O_NOFOLLOW")
            | _required_open_flag("O_CLOEXEC"),
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
            workspace=package.path.parent / workspace_name,
            candidate=package.path.parent / workspace_name / "candidate.cnf",
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
            os.close(workspace_fd)
        # A same-user attacker can swap any pathname between inspection and
        # unlink/rmdir.  Leave failed private staging state in place rather
        # than risk deleting a replacement inode.
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
        not stat.S_ISDIR(workspace_named.st_mode)
        or not stat.S_ISDIR(workspace_opened.st_mode)
        or stat.S_IMODE(workspace_opened.st_mode) != 0o700
        or (
            workspace_named.st_dev,
            workspace_named.st_ino,
            workspace_opened.st_dev,
            workspace_opened.st_ino,
        )
        != (
            reservation.workspace_device,
            reservation.workspace_inode,
            reservation.workspace_device,
            reservation.workspace_inode,
        )
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
    reservation.fsynced = False


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
    reservation.fsynced = True


def _assert_published_binding(
    package: PackageRoot, artifact: PublishedArtifact
) -> os.stat_result:
    _assert_package_root(package)
    _require_output_path(package, artifact.path)
    named = os.stat(
        artifact.path.name, dir_fd=package.directory_fd, follow_symlinks=False
    )
    opened = os.fstat(artifact.fd)
    identity = (artifact.device, artifact.inode, artifact.size, artifact.mtime_ns)
    if (
        not stat.S_ISREG(named.st_mode)
        or not stat.S_ISREG(opened.st_mode)
        or opened.st_uid != os.getuid()
        or opened.st_nlink != 1
        or (named.st_dev, named.st_ino) != (artifact.device, artifact.inode)
        or (opened.st_dev, opened.st_ino, opened.st_size, opened.st_mtime_ns)
        != identity
    ):
        raise ValueError(f"published artifact binding changed: {artifact.path}")
    _assert_package_root(package)
    return opened


def _publish_candidate(
    package: PackageRoot, reservation: CandidateReservation, child: Path
) -> PublishedArtifact:
    if not reservation.fsynced:
        raise ValueError("validated candidate was not fsynced before publication")
    _verify_validated_candidate(reservation)
    _assert_package_root(package)
    _assert_absent(package, child)
    os.fchmod(reservation.file_fd, 0o444)
    _fsync_candidate(reservation)
    _rename_exclusive(
        reservation.workspace_fd,
        reservation.candidate.name,
        package.directory_fd,
        child.name,
    )
    reservation.candidate_unlinked = True
    reservation.public_linked = True
    os.fsync(reservation.workspace_fd)
    os.fsync(package.directory_fd)
    opened = os.fstat(reservation.file_fd)
    artifact = PublishedArtifact(
        path=child,
        fd=os.dup(reservation.file_fd),
        device=opened.st_dev,
        inode=opened.st_ino,
        size=opened.st_size,
        mtime_ns=opened.st_mtime_ns,
        staged_name=reservation.candidate.name,
    )
    try:
        _assert_published_binding(package, artifact)
    except BaseException:
        os.close(artifact.fd)
        artifact.closed = True
        raise
    return artifact


def _write_exclusive_readonly(
    package: PackageRoot,
    reservation: CandidateReservation,
    path: Path,
    data: bytes,
) -> PublishedArtifact:
    _assert_package_root(package)
    _assert_candidate_workspace(reservation)
    _assert_absent(package, path)
    staged_name = f"metadata-{secrets.token_hex(16)}"
    descriptor = os.open(
        staged_name,
        os.O_RDWR
        | os.O_CREAT
        | os.O_EXCL
        | _required_open_flag("O_NOFOLLOW")
        | _required_open_flag("O_CLOEXEC"),
        0o600,
        dir_fd=reservation.workspace_fd,
    )
    try:
        created = os.fstat(descriptor)
        if (
            not stat.S_ISREG(created.st_mode)
            or created.st_nlink != 1
            or created.st_uid != os.getuid()
        ):
            raise ValueError("staged artifact is not an owned regular file")
        offset = 0
        while offset < len(data):
            written = os.write(descriptor, data[offset:])
            if written <= 0:
                raise OSError("short write while staging artifact")
            offset += written
        os.fchmod(descriptor, 0o444)
        os.fsync(descriptor)
        before = os.fstat(descriptor)
        _rename_exclusive(
            reservation.workspace_fd,
            staged_name,
            package.directory_fd,
            path.name,
        )
        os.fsync(reservation.workspace_fd)
        os.fsync(package.directory_fd)
        artifact = PublishedArtifact(
            path=path,
            fd=descriptor,
            device=before.st_dev,
            inode=before.st_ino,
            size=before.st_size,
            mtime_ns=before.st_mtime_ns,
            staged_name=staged_name,
        )
        _assert_published_binding(package, artifact)
        reservation.staged_artifacts.append(artifact)
        return artifact
    except BaseException:
        os.close(descriptor)
        raise


def _assert_staged_receipt(
    package: PackageRoot, staged: StagedReceipt
) -> os.stat_result:
    _assert_package_root(package)
    if staged.closed or staged.committed:
        raise ValueError("receipt staging descriptor is no longer active")
    named = os.stat(staged.parent_name, dir_fd=package.parent_fd, follow_symlinks=False)
    opened = os.fstat(staged.fd)
    if (
        not stat.S_ISREG(named.st_mode)
        or not stat.S_ISREG(opened.st_mode)
        or opened.st_uid != os.getuid()
        or opened.st_nlink != 1
        or (named.st_dev, named.st_ino) != (staged.device, staged.inode)
        or (opened.st_dev, opened.st_ino, opened.st_size, opened.st_mtime_ns)
        != (staged.device, staged.inode, staged.size, staged.mtime_ns)
    ):
        raise ValueError("staged receipt binding changed")
    _assert_package_root(package)
    return opened


def _stage_receipt(
    package: PackageRoot,
    reservation: CandidateReservation,
    path: Path,
    data: bytes,
) -> StagedReceipt:
    """Fsync receipt bytes, then move them out before workspace close."""

    _assert_package_root(package)
    _assert_candidate_workspace(reservation)
    _assert_absent(package, path)
    workspace_name = f"receipt-{secrets.token_hex(16)}"
    parent_name = f".{package.path.name}-receipt-{secrets.token_hex(16)}"
    descriptor = os.open(
        workspace_name,
        os.O_RDWR
        | os.O_CREAT
        | os.O_EXCL
        | _required_open_flag("O_NOFOLLOW")
        | _required_open_flag("O_CLOEXEC"),
        0o600,
        dir_fd=reservation.workspace_fd,
    )
    try:
        created = os.fstat(descriptor)
        if (
            not stat.S_ISREG(created.st_mode)
            or created.st_nlink != 1
            or created.st_uid != os.getuid()
        ):
            raise ValueError("staged receipt is not an owned regular file")
        offset = 0
        while offset < len(data):
            written = os.write(descriptor, data[offset:])
            if written <= 0:
                raise OSError("short write while staging receipt")
            offset += written
        os.fchmod(descriptor, 0o444)
        os.fsync(descriptor)
        before = os.fstat(descriptor)
        _rename_exclusive(
            reservation.workspace_fd,
            workspace_name,
            package.parent_fd,
            parent_name,
        )
        os.fsync(reservation.workspace_fd)
        os.fsync(package.parent_fd)
        staged = StagedReceipt(
            path=path,
            parent_name=parent_name,
            fd=descriptor,
            device=before.st_dev,
            inode=before.st_ino,
            size=before.st_size,
            mtime_ns=before.st_mtime_ns,
        )
        _assert_staged_receipt(package, staged)
        return staged
    except BaseException:
        os.close(descriptor)
        raise


def _commit_staged_receipt(
    package: PackageRoot, staged: StagedReceipt
) -> PublishedArtifact:
    """Commit receipt last; only fd binding and allowlist checks follow."""

    _assert_staged_receipt(package, staged)
    _assert_absent(package, staged.path)
    _rename_exclusive(
        package.parent_fd,
        staged.parent_name,
        package.directory_fd,
        staged.path.name,
    )
    staged.committed = True
    try:
        os.fsync(package.parent_fd)
        os.fsync(package.directory_fd)
        artifact = PublishedArtifact(
            path=staged.path,
            fd=staged.fd,
            device=staged.device,
            inode=staged.inode,
            size=staged.size,
            mtime_ns=staged.mtime_ns,
            staged_name=staged.parent_name,
        )
        _assert_published_binding(package, artifact)
    except BaseException:
        os.close(staged.fd)
        staged.closed = True
        raise
    return artifact


def _close_staged_receipt(staged: StagedReceipt | None) -> None:
    if staged is not None and not staged.committed and not staged.closed:
        os.close(staged.fd)
        staged.closed = True


def _assert_candidate_workspace(
    reservation: CandidateReservation,
) -> os.stat_result:
    named = os.stat(
        reservation.workspace.name,
        dir_fd=reservation.parent_fd,
        follow_symlinks=False,
    )
    opened = os.fstat(reservation.workspace_fd)
    if (
        not stat.S_ISDIR(named.st_mode)
        or not stat.S_ISDIR(opened.st_mode)
        or stat.S_IMODE(opened.st_mode) != 0o700
        or (named.st_dev, named.st_ino, opened.st_dev, opened.st_ino)
        != (
            reservation.workspace_device,
            reservation.workspace_inode,
            reservation.workspace_device,
            reservation.workspace_inode,
        )
    ):
        raise ValueError("candidate workspace binding changed")
    return opened


def _close_reservation(reservation: CandidateReservation) -> None:
    """Close a verified empty workspace without pathname deletion.

    POSIX has no portable rmdir-by-fd.  The unpredictable empty mode-0700
    directory is deliberately retained: rmdir after a stat check could remove
    a same-user replacement inode.
    """

    if reservation.closed:
        return
    error: Exception | None = None
    try:
        _assert_candidate_workspace(reservation)
        if os.listdir(reservation.workspace_fd):
            raise ValueError("candidate workspace is not empty at close")
        os.fsync(reservation.workspace_fd)
        _assert_candidate_workspace(reservation)
    except (OSError, ValueError) as caught:
        error = caught
    finally:
        os.close(reservation.file_fd)
        os.close(reservation.workspace_fd)
        reservation.closed = True
    if error is not None:
        raise error


def coverage_ledger(
    validation: dict[str, object], baseline: PublisherBaseline
) -> dict[str, Any]:
    """Return the canonical theorem-coverage and redundancy ledger."""

    suffix = validation["suffix"]
    parent_model = validation["parent_model"]
    if not isinstance(suffix, dict) or not isinstance(parent_model, dict):
        raise TypeError("validated metadata has the wrong shape")
    return {
        "schema": COVERAGE_SCHEMA,
        "status": "PASS",
        "profile_id": "exact17-small-role-cycle",
        "source": {
            "commit": validator.SOURCE_COMMIT,
            "baseline_sha256": validator.SOURCE_BASELINE_SHA256,
            "lean_root_sha256": validator.LEAN_ROOT_SHA256,
            "lean_export_sha256": validator.LEAN_EXPORT_SHA256,
            "kalmanson_helper_sha256": validator.KALMANSON_HELPER_SHA256,
            "theorem": (
                "Problem97."
                "ATailBlockerVExactSeventeenSmallRoleCycleRefinements."
                "sourceAssign_extendedSmallRoleCycleCnf"
            ),
            "terminal_adapter": (
                "Problem97."
                "ATailBlockerVExactSeventeenSmallRoleCycleRefinements."
                "false_of_sourceRealization_of_extendedSmallRoleCycleCnf_unsat"
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
            "five_role_offset_choices": validator.FIVE_ROLE_OFFSET_CHOICES,
            "four_role_offset_choices": validator.FOUR_ROLE_OFFSET_CHOICES,
            "five_role_clauses": validator.FIVE_ROLE_CLAUSES,
            "four_role_clauses": validator.FOUR_ROLE_CLAUSES,
            "clauses": validator.SUFFIX_CLAUSES,
            "bytes": validator.SUFFIX_BYTES,
            "ordered_suffix_sha256": validator.SUFFIX_SHA256,
            "named_orders": 2,
            "directions": 2,
            "cuts": 17,
        },
        "redundancy": suffix["redundancy"],
        "parent_model_cuts": {
            "model_sha256": parent_model["sha256"],
            "model_receipt_sha256": parent_model["receipt_sha256"],
            "falsified_nonredundant_suffix_indices": parent_model[
                "falsified_nonredundant_suffix_indices"
            ],
        },
        "lean_export": {
            "memory_limit": LEAN_MEMORY_LIMIT,
            "direct_export": True,
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
            "parent_model_cut_count": 7,
            "exact17_closure": False,
            "lean_closure": False,
            "universal_lift": False,
        },
    }


def _artifact_from_published(
    package: PackageRoot, artifact: PublishedArtifact
) -> dict[str, object]:
    before = _assert_published_binding(package, artifact)
    digest = hashlib.sha256()
    offset = 0
    while block := os.pread(artifact.fd, 1 << 20, offset):
        digest.update(block)
        offset += len(block)
    after = _assert_published_binding(package, artifact)
    if (
        before.st_dev,
        before.st_ino,
        before.st_size,
        before.st_mtime_ns,
    ) != (after.st_dev, after.st_ino, after.st_size, after.st_mtime_ns):
        raise ValueError(f"published artifact changed while hashing: {artifact.path}")
    return {
        "path": os.path.abspath(artifact.path),
        "sha256": digest.hexdigest(),
        "bytes": offset,
    }


def _assert_all_published(
    package: PackageRoot, artifacts: list[PublishedArtifact]
) -> None:
    for artifact in artifacts:
        _assert_published_binding(package, artifact)


def _close_published(artifacts: list[PublishedArtifact]) -> None:
    for artifact in artifacts:
        if not artifact.closed:
            os.close(artifact.fd)
            artifact.closed = True


def publish(
    paths: PublicationPaths = PRODUCTION_PATHS,
    publisher_baseline: PublisherBaseline | None = None,
) -> dict[str, Any]:
    """Run the direct Lean exporter, independently validate, and publish once."""

    _require_publisher_provenance(paths, publisher_baseline)
    if publisher_baseline is None:
        raise AssertionError("publisher baseline unexpectedly absent")
    _require_source_commit(paths)
    pinned_artifacts, pinned_source_imports = _pinned_input_records(
        paths, publisher_baseline
    )
    outputs = (
        paths.child,
        paths.audit_report,
        paths.coverage_ledger,
        paths.receipt,
    )
    output_parents = {Path(os.path.abspath(path.parent)) for path in outputs}
    if len(output_parents) != 1:
        raise ValueError("all publication outputs must share one package root")
    package = _open_package_root(next(iter(output_parents)))
    reservation: CandidateReservation | None = None
    staged_receipt: StagedReceipt | None = None
    published: list[PublishedArtifact] = []
    try:
        for path in outputs:
            _assert_absent(package, path)
        _assert_package_layout(package, set())

        reservation = _reserve_candidate(package)
        _assert_candidate_binding(reservation)
        _run_lean(reservation.candidate, paths)
        _assert_candidate_binding(reservation)
        candidate_validation = _validation(paths, reservation.candidate)
        _assert_candidate_binding(reservation)
        _bind_candidate_validation(reservation, candidate_validation)
        _fsync_candidate(reservation)
        _require_source_commit(paths)
        _require_publisher_provenance(paths, publisher_baseline)
        # Replay immediately before the exclusive commit.  After the commit,
        # the retained descriptor and package-directory descriptor authenticate
        # that these exact validated bytes are the public child; no pathname is
        # reopened through a potentially rebound package root.
        precommit_validation = _validation(paths, reservation.candidate)
        _assert_candidate_binding(reservation)
        _bind_candidate_validation(reservation, precommit_validation)
        _fsync_candidate(reservation)
        if candidate_validation != precommit_validation:
            raise ValueError("candidate validation changed before publication")

        child_published = _publish_candidate(package, reservation, paths.child)
        published.append(child_published)
        _assert_package_layout(package, {paths.child.name})

        final_validation = copy.deepcopy(precommit_validation)
        final_candidate_child = final_validation.get("child")
        if not isinstance(final_candidate_child, dict):
            raise TypeError("validator returned a malformed child identity")
        final_candidate_child["path"] = os.path.abspath(paths.child)
        candidate_child = candidate_validation["child"]
        final_child = final_validation["child"]
        if not isinstance(candidate_child, dict) or not isinstance(final_child, dict):
            raise TypeError("validator returned a malformed child identity")
        identity_keys = ("sha256", "bytes", "clauses")
        if any(candidate_child[key] != final_child[key] for key in identity_keys):
            raise ValueError(
                "published child identity differs from validated candidate"
            )
        child_artifact = _artifact_from_published(package, child_published)
        if (child_artifact["sha256"], child_artifact["bytes"]) != (
            final_child["sha256"],
            final_child["bytes"],
        ):
            raise ValueError("published child changed after final validation")
        _require_source_commit(paths)
        _require_publisher_provenance(paths, publisher_baseline)

        audit = {
            "schema": AUDIT_SCHEMA,
            "status": "PASS",
            "validator": _known_artifact(
                paths.validator_script, VALIDATOR_SHA256, VALIDATOR_BYTES
            ),
            "validation": final_validation,
        }
        audit_published = _write_exclusive_readonly(
            package,
            reservation,
            paths.audit_report,
            canonical_json_bytes(audit),
        )
        published.append(audit_published)
        _assert_all_published(package, published)

        ledger = coverage_ledger(final_validation, publisher_baseline)
        ledger_bytes = canonical_json_bytes(ledger)
        ledger_published = _write_exclusive_readonly(
            package, reservation, paths.coverage_ledger, ledger_bytes
        )
        published.append(ledger_published)
        _assert_all_published(package, published)

        receipt = {
            "schema": RECEIPT_SCHEMA,
            "status": "PASS",
            "publication_state": "PROVISIONED",
            "profile_id": "exact17-small-role-cycle",
            "source_commit": validator.SOURCE_COMMIT,
            "source_baseline_sha256": validator.SOURCE_BASELINE_SHA256,
            "parent_source_commit": validator.PARENT_SOURCE_COMMIT,
            "validator_source_commit": VALIDATOR_SOURCE_COMMIT,
            "publisher_source_commit": publisher_baseline.source_commit,
            "parent": final_validation["parent"],
            "child": final_child,
            "ordered_suffix": final_validation["suffix"],
            "parent_model": final_validation["parent_model"],
            "ingress_policy": {
                "receipt_alone_sufficient": False,
                "directory_enumeration": "retained-fd-exact-allowlist",
                "required_package_entries": sorted(path.name for path in outputs),
            },
            "artifacts": {
                **pinned_artifacts,
                "child_cnf": child_artifact,
                "independent_audit_report": _artifact_from_published(
                    package, audit_published
                ),
                "coverage_ledger": _artifact_from_published(package, ledger_published),
            },
            "source_imports": pinned_source_imports,
            "coverage_ledger": {
                "schema": COVERAGE_SCHEMA,
                "sha256": _sha256_bytes(ledger_bytes),
            },
            "lean_export": {
                "memory_limit": LEAN_MEMORY_LIMIT,
                "command_shape": "lake env lean -M32768 --run <exporter> <output>",
            },
            "policy": {
                "direct_lean_export": True,
                "exact_parent_body_prefix": True,
                "independent_suffix_replay": True,
                "exact_redundancy_census": True,
                "authenticated_parent_model_cuts": True,
                "final_child_revalidated": True,
                "component_wise_nofollow": True,
                "candidate_reserved_inode": True,
                "candidate_private_workspace": True,
                "candidate_fsynced_before_exclusive_commit": True,
                "atomic_exclusive_commit": True,
                "unsafe_pathname_rollback": False,
                "publisher_committed_baseline": True,
                "validator_committed_baseline": True,
                "create_once": True,
                "receipt_written_last": True,
                "ingress_requires_exact_package_allowlist": True,
                "receipt_is_not_standalone_ingress_authority": True,
                "new_solver_result_claimed": False,
            },
        }
        pre_receipt = {
            paths.child.name,
            paths.audit_report.name,
            paths.coverage_ledger.name,
        }
        _assert_all_published(package, published)
        _assert_package_layout(package, pre_receipt)
        _require_final_inputs(paths, publisher_baseline)
        staged_receipt = _stage_receipt(
            package, reservation, paths.receipt, canonical_json_bytes(receipt)
        )
        _assert_staged_receipt(package, staged_receipt)
        _close_reservation(reservation)
        _assert_staged_receipt(package, staged_receipt)
        _assert_all_published(package, published)
        _assert_package_layout(package, pre_receipt)
        _require_final_inputs(paths, publisher_baseline)
        receipt_published = _commit_staged_receipt(package, staged_receipt)
        published.append(receipt_published)
        _require_final_inputs(paths, publisher_baseline)
        _assert_all_published(package, published)
        _assert_package_layout(package, pre_receipt | {paths.receipt.name})
        return receipt
    except BaseException as error:
        cleanup_errors: list[Exception] = []
        if reservation is not None and not reservation.closed:
            try:
                _close_reservation(reservation)
            except (OSError, ValueError) as cleanup_error:
                cleanup_errors.append(cleanup_error)
        for cleanup_error in cleanup_errors:
            error.add_note(f"safe staging close warning: {cleanup_error}")
        raise
    finally:
        _close_staged_receipt(staged_receipt)
        _close_published(published)
        _close_package_root(package)


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
