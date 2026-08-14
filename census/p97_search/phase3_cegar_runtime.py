"""Shared runtime boundaries for successor Phase-3 CEGAR drivers.

This module owns effects, not mathematical acceptance.  In particular, a
``VERIFIED`` terminal publication only reports that the injected checker
accepted the emitted proof; the coordinator still chooses the run status and
publishes the authenticated manifest.
"""

from __future__ import annotations

import ctypes
import errno
import hashlib
import os
import stat
import sys
from collections import Counter
from collections.abc import Mapping, Sequence
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Literal, Protocol


class SolverResultLike(Protocol):
    verdict: str
    assignment: Mapping[int, bool]
    returncode: int
    stdout: str
    stderr: str


class SolverBackend(Protocol):
    def __call__(
        self,
        cnf_path: Path,
        timeout_s: int,
        proof_path: Path | None,
    ) -> SolverResultLike: ...


class CheckerResultLike(Protocol):
    verified: bool
    returncode: int
    stdout: str
    stderr: str


class CheckerRunner(Protocol):
    def __call__(
        self,
        cnf_path: Path,
        proof_path: Path,
        timeout_s: int,
    ) -> CheckerResultLike: ...


class AtomicWriter(Protocol):
    def __call__(self, path: Path, data: bytes) -> None: ...


class ProofPublisher(Protocol):
    def __call__(self, source: Path, destination: Path) -> None: ...


class DirectorySync(Protocol):
    def __call__(self, path: Path) -> None: ...


class ExactFileCaptureError(ValueError):
    """A bounded no-follow regular-file capture could not be authenticated."""


@dataclass(frozen=True)
class ExactFileCapture:
    """Stable identity and exact content digest for one captured file."""

    device: int
    inode: int
    byte_count: int
    link_count: int
    sha256: str
    data: bytes | None

    def same_identity_and_content(self, other: ExactFileCapture) -> bool:
        return (
            self.device,
            self.inode,
            self.byte_count,
            self.link_count,
            self.sha256,
        ) == (
            other.device,
            other.inode,
            other.byte_count,
            other.link_count,
            other.sha256,
        )


def _file_identity(info: os.stat_result) -> tuple[int, ...]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _inode_anchor(info: os.stat_result) -> tuple[int, int, int]:
    return info.st_dev, info.st_ino, stat.S_IFMT(info.st_mode)


def _directory_identity(info: os.stat_result) -> tuple[int, int, int]:
    """Return directory identity without mutable entry-list metadata."""

    return info.st_dev, info.st_ino, info.st_mode


def capture_exact_regular_file(
    path: Path,
    *,
    max_bytes: int,
    require_nonempty: bool = False,
    require_single_link: bool = False,
    keep_bytes: bool = True,
    label: str = "file",
) -> ExactFileCapture:
    """Capture a bounded regular file through a held absolute no-follow chain.

    Every parent directory and the final component is opened without following
    links and revalidated before the held descriptors are released.  This
    detects substitution during capture; callers that span an external action
    must capture again afterward and compare the returned identity and digest.
    """

    if type(max_bytes) is not int or max_bytes < 0:
        raise ExactFileCaptureError("max_bytes must be a nonnegative integer")
    if not hasattr(os, "O_NOFOLLOW"):
        raise ExactFileCaptureError("this platform lacks no-follow file opens")
    absolute = Path(os.path.abspath(os.fspath(path)))
    parts = absolute.parts
    if not parts or parts[0] != os.path.sep or len(parts) == 1:
        raise ExactFileCaptureError(
            f"{label} path must name a file below the filesystem root"
        )

    directory_flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_DIRECTORY", 0)
        | os.O_NOFOLLOW
    )
    file_flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NONBLOCK", 0)
        | os.O_NOFOLLOW
    )
    directory_descriptors: list[int] = []
    directory_chain: list[tuple[int, str, int, os.stat_result]] = []
    descriptor: int | None = None
    try:
        root_descriptor = os.open(os.path.sep, directory_flags)
        directory_descriptors.append(root_descriptor)
        root_before = os.fstat(root_descriptor)
        if not stat.S_ISDIR(root_before.st_mode):
            raise ExactFileCaptureError("filesystem root is not a directory")

        parent_descriptor = root_descriptor
        for component in parts[1:-1]:
            child_descriptor = os.open(
                component, directory_flags, dir_fd=parent_descriptor
            )
            directory_descriptors.append(child_descriptor)
            child_before = os.fstat(child_descriptor)
            if not stat.S_ISDIR(child_before.st_mode):
                raise ExactFileCaptureError(
                    f"every {label} parent component must be a directory"
                )
            named_child = os.stat(
                component, dir_fd=parent_descriptor, follow_symlinks=False
            )
            if _directory_identity(named_child) != _directory_identity(
                child_before
            ):
                raise ExactFileCaptureError(
                    f"{label} parent changed while it was being opened"
                )
            directory_chain.append(
                (parent_descriptor, component, child_descriptor, child_before)
            )
            parent_descriptor = child_descriptor

        descriptor = os.open(parts[-1], file_flags, dir_fd=parent_descriptor)
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode):
            raise ExactFileCaptureError(f"{label} must be a regular file")
        if require_single_link and before.st_nlink != 1:
            raise ExactFileCaptureError(f"{label} must have link count one")
        if require_nonempty and before.st_size == 0:
            raise ExactFileCaptureError(f"{label} must be nonempty")
        if before.st_size > max_bytes:
            raise ExactFileCaptureError(
                f"{label} exceeds the {max_bytes}-byte capture bound"
            )
        named_before = os.stat(
            parts[-1], dir_fd=parent_descriptor, follow_symlinks=False
        )
        if _file_identity(named_before) != _file_identity(before):
            raise ExactFileCaptureError(
                f"{label} changed while it was being opened"
            )

        chunks: list[bytes] | None = [] if keep_bytes else None
        digest = hashlib.sha256()
        byte_count = 0
        remaining = max_bytes + 1
        while remaining:
            chunk = os.read(descriptor, min(1 << 20, remaining))
            if not chunk:
                break
            digest.update(chunk)
            byte_count += len(chunk)
            if chunks is not None:
                chunks.append(chunk)
            remaining -= len(chunk)
        if byte_count > max_bytes:
            raise ExactFileCaptureError(
                f"{label} exceeds the {max_bytes}-byte capture bound"
            )
        after = os.fstat(descriptor)
        if (
            _file_identity(before) != _file_identity(after)
            or byte_count != before.st_size
            or (require_single_link and after.st_nlink != 1)
        ):
            raise ExactFileCaptureError(
                f"{label} changed while it was being captured"
            )

        root_after = os.fstat(root_descriptor)
        named_root = os.stat(os.path.sep, follow_symlinks=False)
        if _directory_identity(root_before) != _directory_identity(
            root_after
        ) or (
            _directory_identity(named_root) != _directory_identity(root_after)
        ):
            raise ExactFileCaptureError(
                f"{label} filesystem root changed during capture"
            )
        for held_parent, component, held_child, child_before in directory_chain:
            child_after = os.fstat(held_child)
            named_child = os.stat(
                component, dir_fd=held_parent, follow_symlinks=False
            )
            if _directory_identity(child_before) != _directory_identity(
                child_after
            ) or (
                _directory_identity(named_child)
                != _directory_identity(child_after)
            ):
                raise ExactFileCaptureError(
                    f"{label} parent changed or was repointed during capture"
                )

        final_after = os.fstat(descriptor)
        named_after = os.stat(
            parts[-1], dir_fd=parent_descriptor, follow_symlinks=False
        )
        if (
            _file_identity(after) != _file_identity(final_after)
            or _file_identity(named_after) != _file_identity(final_after)
            or (require_single_link and final_after.st_nlink != 1)
        ):
            raise ExactFileCaptureError(
                f"{label} changed or was repointed during final revalidation"
            )
        return ExactFileCapture(
            device=final_after.st_dev,
            inode=final_after.st_ino,
            byte_count=byte_count,
            link_count=final_after.st_nlink,
            sha256=digest.hexdigest(),
            data=None if chunks is None else b"".join(chunks),
        )
    except ExactFileCaptureError:
        raise
    except OSError as exc:
        raise ExactFileCaptureError(f"cannot capture {label}: {exc}") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        for directory_descriptor in reversed(directory_descriptors):
            os.close(directory_descriptor)


class AtomicNoReplaceError(RuntimeError):
    """A proof path could not be published with native no-replace semantics."""


def _rename_noreplace_at(root_fd: int, source: str, destination: str) -> None:
    """Use the platform's atomic same-directory no-replace rename primitive."""

    libc = ctypes.CDLL(None, use_errno=True)
    source_bytes = os.fsencode(source)
    destination_bytes = os.fsencode(destination)
    if sys.platform == "darwin" and hasattr(libc, "renameatx_np"):
        renameatx_np = libc.renameatx_np
        renameatx_np.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        renameatx_np.restype = ctypes.c_int
        result = renameatx_np(
            root_fd,
            source_bytes,
            root_fd,
            destination_bytes,
            0x4,  # RENAME_EXCL
        )
    elif sys.platform.startswith("linux") and hasattr(libc, "renameat2"):
        renameat2 = libc.renameat2
        renameat2.argtypes = [
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_int,
            ctypes.c_char_p,
            ctypes.c_uint,
        ]
        renameat2.restype = ctypes.c_int
        result = renameat2(
            root_fd,
            source_bytes,
            root_fd,
            destination_bytes,
            0x1,  # RENAME_NOREPLACE
        )
    else:
        raise AtomicNoReplaceError(
            "platform lacks atomic no-replace proof publication"
        )
    if result == 0:
        return
    error = ctypes.get_errno()
    if error in {errno.EEXIST, errno.ENOTEMPTY}:
        raise FileExistsError(
            error,
            "proof destination already exists",
            destination,
        )
    if error == errno.ENOENT:
        raise FileNotFoundError(error, os.strerror(error), source)
    raise AtomicNoReplaceError(
        f"cannot atomically publish proof: {os.strerror(error)}"
    )


def atomic_rename_noreplace(source: Path, destination: Path) -> None:
    """Atomically rename one regular file without replacing any destination.

    Both names must be in the same directory.  A held no-follow descriptor for
    that directory anchors the native operation, and the destination inode is
    required to be the source inode afterward.  Linux ``renameat2`` and macOS
    ``renameatx_np`` are the supported platform seams.
    """

    if not hasattr(os, "O_NOFOLLOW"):
        raise AtomicNoReplaceError("this platform lacks no-follow directory opens")
    source_absolute = Path(os.path.abspath(os.fspath(source)))
    destination_absolute = Path(os.path.abspath(os.fspath(destination)))
    if source_absolute.parent != destination_absolute.parent:
        raise AtomicNoReplaceError(
            "atomic proof publication requires one common directory"
        )
    flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_DIRECTORY", 0)
        | os.O_NOFOLLOW
    )
    try:
        parent_fd = os.open(source_absolute.parent, flags)
    except OSError as exc:
        raise AtomicNoReplaceError(
            f"cannot open proof output directory without following it: {exc}"
        ) from exc
    try:
        source_before = os.stat(
            source_absolute.name,
            dir_fd=parent_fd,
            follow_symlinks=False,
        )
        if not stat.S_ISREG(source_before.st_mode):
            raise AtomicNoReplaceError("proof source must be a regular file")
        _rename_noreplace_at(
            parent_fd,
            source_absolute.name,
            destination_absolute.name,
        )
        destination_after = os.stat(
            destination_absolute.name,
            dir_fd=parent_fd,
            follow_symlinks=False,
        )
        if _inode_anchor(source_before) != _inode_anchor(destination_after):
            raise AtomicNoReplaceError(
                "proof inode changed during atomic no-replace publication"
            )
    except AtomicNoReplaceError:
        raise
    except (FileExistsError, FileNotFoundError):
        raise
    except OSError as exc:
        raise AtomicNoReplaceError(
            f"cannot atomically publish proof: {exc}"
        ) from exc
    finally:
        os.close(parent_fd)


def manifest_generation_name(generation: int) -> str:
    if type(generation) is not int or generation <= 0:
        raise RunLedgerError("manifest generation must be a positive integer")
    return f"manifest.g{generation:08d}.json"


@dataclass(frozen=True)
class ManifestGenerationPublisher:
    """Publish one authenticated manifest generation as a two-file commit.

    The generation file is made durable before the manifest pointer is
    replaced.  A restart accepts only the generation named by the current
    pointer, so an interruption leaves either the previous committed pointer
    or a fully written next pointer; an orphan generation is never implicitly
    selected as a repair.
    """

    atomic_writer: AtomicWriter
    sync_directory: DirectorySync

    def publish(
        self,
        *,
        out: Path,
        manifest_path: Path,
        generation: int,
        data: bytes,
    ) -> Path:
        generation_path = out / manifest_generation_name(generation)
        if generation_path.exists():
            if generation_path.read_bytes() != data:
                raise RunLedgerError(
                    f"manifest generation collision: {generation_path}"
                )
        else:
            self.atomic_writer(generation_path, data)
        self.sync_directory(out)
        self.atomic_writer(manifest_path, data)
        self.sync_directory(out)
        return generation_path


@dataclass
class JournalScan:
    """Rolling byte identity collected during one streaming journal read."""

    byte_count: int = 0
    _digest: Any = field(default_factory=hashlib.sha256, repr=False)

    def observe(self, raw: bytes) -> None:
        self.byte_count += len(raw)
        self._digest.update(raw)

    def digest_copy(self) -> Any:
        return self._digest.copy()

    @property
    def sha256(self) -> str:
        return self._digest.copy().hexdigest()


@dataclass(frozen=True)
class LearnedStreamSnapshot:
    """Comparable shadow identity for the learned-certificate journal."""

    record_count: int
    byte_count: int
    terminal_record_sha256: str | None
    file_sha256: str
    origin_counts: tuple[tuple[str, int], ...]
    stage_counts: tuple[tuple[str, int], ...]
    clauses: frozenset[tuple[int, ...]]


class RunLedgerError(ValueError):
    """The shadow ledger disagrees with an authenticated journal transition."""


@dataclass(frozen=True)
class StreamSnapshot:
    """Byte and hash identity for one authenticated JSONL stream."""

    record_count: int
    byte_count: int
    terminal_record_sha256: str | None
    file_sha256: str

    def as_dict(self) -> dict[str, Any]:
        return {
            "record_count": self.record_count,
            "byte_count": self.byte_count,
            "terminal_record_sha256": self.terminal_record_sha256,
            "file_sha256": self.file_sha256,
        }


@dataclass
class JsonlRunLedger:
    """Generic authenticated shadow state for a hash-chained JSONL stream.

    Semantic validation remains with the stream-specific replay loader.  This
    ledger owns the cross-publication identity: bytes, record count, and hash
    chain head.  It is deliberately updated only after the caller's append has
    flushed and fsynced the record.
    """

    stream_name: str
    record_count: int
    byte_count: int
    terminal_record_sha256: str | None
    _digest: Any = field(repr=False)

    @staticmethod
    def _record_hash(record: Mapping[str, Any], *, stream_name: str) -> str:
        value = record.get("record_sha256")
        if not isinstance(value, str):
            raise RunLedgerError(
                f"{stream_name} record has invalid record_sha256"
            )
        return value

    @classmethod
    def from_authenticated_records(
        cls,
        records: Sequence[Mapping[str, Any]],
        scan: JournalScan,
        *,
        stream_name: str,
    ) -> JsonlRunLedger:
        terminal: str | None = None
        for record in records:
            if record.get("previous_record_sha256") != terminal:
                raise RunLedgerError(
                    f"{stream_name} authenticated chain head drift"
                )
            terminal = cls._record_hash(record, stream_name=stream_name)
        return cls(
            stream_name=stream_name,
            record_count=len(records),
            byte_count=scan.byte_count,
            terminal_record_sha256=terminal,
            _digest=scan.digest_copy(),
        )

    def observe_durable_append(
        self,
        record: Mapping[str, Any],
        serialized: bytes,
    ) -> None:
        if record.get("previous_record_sha256") != self.terminal_record_sha256:
            raise RunLedgerError(
                f"{self.stream_name} durable append chain-head drift"
            )
        terminal = self._record_hash(record, stream_name=self.stream_name)

        # Do not mutate any committed field until all append-local validation
        # has succeeded.  The caller invokes this only after durable fsync.
        self._digest.update(serialized)
        self.byte_count += len(serialized)
        self.record_count += 1
        self.terminal_record_sha256 = terminal

    def snapshot(self) -> StreamSnapshot:
        return StreamSnapshot(
            record_count=self.record_count,
            byte_count=self.byte_count,
            terminal_record_sha256=self.terminal_record_sha256,
            file_sha256=self._digest.copy().hexdigest(),
        )


@dataclass
class LearnedRunLedger:
    """In-memory shadow state for the learned-certificate stream.

    The coordinator supplies bytes only after its durable append returns.  The
    ledger is diagnostic in the current schema: publication still performs an
    independent full recount and rejects any disagreement.
    """

    record_count: int
    byte_count: int
    terminal_record_sha256: str | None
    origin_counts: Counter[str]
    stage_counts: Counter[str]
    clauses: set[tuple[int, ...]]
    _digest: Any = field(repr=False)

    @staticmethod
    def _clause(record: Mapping[str, Any]) -> tuple[int, ...]:
        raw = record.get("clause")
        if not isinstance(raw, (list, tuple)) or any(
            type(literal) is not int for literal in raw
        ):
            raise RunLedgerError("learned record has a non-canonical clause")
        return tuple(raw)

    @staticmethod
    def _required_text(record: Mapping[str, Any], key: str) -> str:
        value = record.get(key)
        if not isinstance(value, str):
            raise RunLedgerError(f"learned record has invalid {key}")
        return value

    @classmethod
    def from_authenticated_records(
        cls,
        records: Sequence[Mapping[str, Any]],
        scan: JournalScan,
    ) -> LearnedRunLedger:
        origins: Counter[str] = Counter()
        stages: Counter[str] = Counter()
        clauses: set[tuple[int, ...]] = set()
        terminal: str | None = None
        for index, record in enumerate(records):
            if record.get("index") != index:
                raise RunLedgerError("authenticated learned indices are not dense")
            previous = record.get("previous_record_sha256")
            if previous != terminal:
                raise RunLedgerError("authenticated learned chain head drift")
            terminal = cls._required_text(record, "record_sha256")
            origins[cls._required_text(record, "origin")] += 1
            stages[cls._required_text(record, "stage")] += 1
            clauses.add(cls._clause(record))
        return cls(
            record_count=len(records),
            byte_count=scan.byte_count,
            terminal_record_sha256=terminal,
            origin_counts=origins,
            stage_counts=stages,
            clauses=clauses,
            _digest=scan.digest_copy(),
        )

    def observe_durable_append(
        self,
        record: Mapping[str, Any],
        serialized: bytes,
    ) -> None:
        if record.get("index") != self.record_count:
            raise RunLedgerError("durable learned append index drift")
        if record.get("previous_record_sha256") != self.terminal_record_sha256:
            raise RunLedgerError("durable learned append chain-head drift")
        terminal = self._required_text(record, "record_sha256")
        origin = self._required_text(record, "origin")
        stage = self._required_text(record, "stage")
        clause = self._clause(record)

        self._digest.update(serialized)
        self.byte_count += len(serialized)
        self.record_count += 1
        self.terminal_record_sha256 = terminal
        self.origin_counts[origin] += 1
        self.stage_counts[stage] += 1
        self.clauses.add(clause)

    def snapshot(self) -> LearnedStreamSnapshot:
        return LearnedStreamSnapshot(
            record_count=self.record_count,
            byte_count=self.byte_count,
            terminal_record_sha256=self.terminal_record_sha256,
            file_sha256=self._digest.copy().hexdigest(),
            origin_counts=tuple(sorted(self.origin_counts.items())),
            stage_counts=tuple(sorted(self.stage_counts.items())),
            clauses=frozenset(self.clauses),
        )


MAX_TERMINAL_PROOF_BYTES = 8 * 1024 * 1024 * 1024


TerminalOutcome = Literal[
    "VERIFIED",
    "TERMINAL_CNF_DRIFT",
    "PROOF_SOLVER_EXCEPTION",
    "PROOF_SOLVER_NOT_UNSAT",
    "MISSING_DRAT",
    "CHECKER_EXCEPTION",
    "DRAT_REJECTED",
]


@dataclass(frozen=True)
class TerminalPublication:
    outcome: TerminalOutcome
    checker_error: str | None = None
    proof_error: str | None = None


class TerminalPublisher(Protocol):
    def publish(
        self,
        *,
        out: Path,
        cnf_bytes: bytes,
        proof_tmp: Path,
        timeout_s: int,
    ) -> TerminalPublication: ...


@dataclass(frozen=True)
class FilesystemTerminalPublisher:
    """Produce, publish, and externally check one terminal CNF/DRAT pair.

    Discovery is deliberately separate from this boundary.  The publisher
    writes the exact terminal CNF, optionally runs a fresh proof-producing
    solver on that path, rejects any terminal-CNF drift or non-UNSAT result,
    and only then moves and checks the nonempty DRAT artifact.  The output
    directory remains a trusted same-user boundary; these checks detect
    accidental/concurrent substitution but are not a hostile-filesystem
    sandbox.
    """

    checker_runner: CheckerRunner
    atomic_writer: AtomicWriter
    proof_solver: SolverBackend | None = None
    proof_publisher: ProofPublisher = atomic_rename_noreplace

    def publish(
        self,
        *,
        out: Path,
        cnf_bytes: bytes,
        proof_tmp: Path,
        timeout_s: int,
    ) -> TerminalPublication:
        terminal_path = out / "terminal.cnf"
        proof_path = out / "terminal.drat"
        self.atomic_writer(terminal_path, cnf_bytes)

        try:
            frozen_terminal = capture_exact_regular_file(
                terminal_path,
                max_bytes=len(cnf_bytes),
                require_single_link=True,
                label="terminal CNF",
            )
        except ExactFileCaptureError as exc:
            return TerminalPublication(
                "TERMINAL_CNF_DRIFT",
                proof_error=str(exc),
            )
        if frozen_terminal.data != cnf_bytes:
            return TerminalPublication(
                "TERMINAL_CNF_DRIFT",
                proof_error="terminal CNF bytes differ from the frozen input",
            )

        if proof_path.exists() or proof_path.is_symlink():
            return TerminalPublication(
                "MISSING_DRAT",
                proof_error="terminal DRAT destination already exists",
            )
        if self.proof_solver is not None:
            if proof_tmp.exists() or proof_tmp.is_symlink():
                return TerminalPublication(
                    "MISSING_DRAT",
                    proof_error="proof temporary path already exists",
                )
            try:
                proof_result = self.proof_solver(
                    terminal_path, timeout_s, proof_tmp
                )
            except Exception as exc:  # noqa: BLE001
                return TerminalPublication(
                    "PROOF_SOLVER_EXCEPTION",
                    proof_error=f"{type(exc).__name__}: {exc}",
                )
            terminal_error = self._terminal_drift(
                terminal_path, frozen_terminal, len(cnf_bytes)
            )
            if terminal_error is not None:
                return terminal_error
            if proof_result.verdict != "UNSAT":
                return TerminalPublication(
                    "PROOF_SOLVER_NOT_UNSAT",
                    proof_error=(
                        "fresh proof-producing solver returned "
                        f"{proof_result.verdict!r} "
                        f"(returncode={proof_result.returncode})"
                    ),
                )

        try:
            proof_named = os.lstat(proof_tmp)
        except FileNotFoundError:
            return TerminalPublication("MISSING_DRAT")
        if stat.S_ISREG(proof_named.st_mode) and proof_named.st_size == 0:
            return TerminalPublication("MISSING_DRAT")
        try:
            frozen_proof = capture_exact_regular_file(
                proof_tmp,
                max_bytes=MAX_TERMINAL_PROOF_BYTES,
                require_nonempty=True,
                require_single_link=True,
                keep_bytes=False,
                label="proof temporary file",
            )
        except ExactFileCaptureError as exc:
            return TerminalPublication("MISSING_DRAT", proof_error=str(exc))

        try:
            self.proof_publisher(proof_tmp, proof_path)
        except (AtomicNoReplaceError, FileExistsError, FileNotFoundError) as exc:
            return TerminalPublication(
                "MISSING_DRAT",
                proof_error=f"atomic proof publication failed: {exc}",
            )
        try:
            published_proof = capture_exact_regular_file(
                proof_path,
                max_bytes=MAX_TERMINAL_PROOF_BYTES,
                require_nonempty=True,
                require_single_link=True,
                keep_bytes=False,
                label="terminal DRAT",
            )
        except ExactFileCaptureError as exc:
            return TerminalPublication("MISSING_DRAT", proof_error=str(exc))
        if not frozen_proof.same_identity_and_content(published_proof):
            return TerminalPublication(
                "MISSING_DRAT",
                proof_error="terminal DRAT identity changed during publication",
            )

        checked: CheckerResultLike | None = None
        checker_error: Exception | None = None
        try:
            checked = self.checker_runner(terminal_path, proof_path, timeout_s)
        except Exception as exc:  # noqa: BLE001
            checker_error = exc

        terminal_error = self._terminal_drift(
            terminal_path, frozen_terminal, len(cnf_bytes)
        )
        if terminal_error is not None:
            return terminal_error
        try:
            checked_proof = capture_exact_regular_file(
                proof_path,
                max_bytes=MAX_TERMINAL_PROOF_BYTES,
                require_nonempty=True,
                require_single_link=True,
                keep_bytes=False,
                label="terminal DRAT",
            )
        except ExactFileCaptureError as exc:
            return TerminalPublication("MISSING_DRAT", proof_error=str(exc))
        if not published_proof.same_identity_and_content(checked_proof):
            return TerminalPublication(
                "MISSING_DRAT",
                proof_error="terminal DRAT changed while it was being checked",
            )
        if checker_error is not None:
            return TerminalPublication("CHECKER_EXCEPTION", str(checker_error))
        assert checked is not None

        self.atomic_writer(
            out / "terminal.drat.check",
            (
                checked.stdout
                + ("\nSTDERR\n" + checked.stderr if checked.stderr else "")
            ).encode(),
        )
        if checked.verified is not True:
            return TerminalPublication("DRAT_REJECTED")
        return TerminalPublication("VERIFIED")

    @staticmethod
    def _terminal_drift(
        path: Path,
        frozen: ExactFileCapture,
        byte_count: int,
    ) -> TerminalPublication | None:
        try:
            current = capture_exact_regular_file(
                path,
                max_bytes=byte_count,
                require_single_link=True,
                label="terminal CNF",
            )
        except ExactFileCaptureError as exc:
            return TerminalPublication("TERMINAL_CNF_DRIFT", proof_error=str(exc))
        if not frozen.same_identity_and_content(current):
            return TerminalPublication(
                "TERMINAL_CNF_DRIFT",
                proof_error="terminal CNF identity or bytes changed",
            )
        return None
