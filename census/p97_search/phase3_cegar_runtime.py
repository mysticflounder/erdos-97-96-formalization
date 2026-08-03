"""Shared runtime boundaries for successor Phase-3 CEGAR drivers.

This module owns effects, not mathematical acceptance.  In particular, a
``VERIFIED`` terminal publication only reports that the injected checker
accepted the emitted proof; the coordinator still chooses the run status and
publishes the authenticated manifest.
"""

from __future__ import annotations

import contextlib
import hashlib
import os
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


class DirectorySync(Protocol):
    def __call__(self, path: Path) -> None: ...


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
    and only then moves and checks the nonempty DRAT artifact.
    """

    checker_runner: CheckerRunner
    atomic_writer: AtomicWriter
    proof_solver: SolverBackend | None = None

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

        # The proof-producing rerun must consume exactly the bytes that the
        # coordinator authenticated as the terminal formula.  This check is
        # intentionally at the terminal boundary, outside the hot discovery
        # loop, and makes a changed writer fail closed before any proof is
        # accepted.
        try:
            terminal_bytes = terminal_path.read_bytes()
        except OSError as exc:
            return TerminalPublication(
                "TERMINAL_CNF_DRIFT",
                proof_error=f"terminal CNF could not be reread: {exc}",
            )
        if terminal_bytes != cnf_bytes:
            return TerminalPublication(
                "TERMINAL_CNF_DRIFT",
                proof_error="terminal CNF bytes differ from the frozen input",
            )

        if self.proof_solver is not None:
            with contextlib.suppress(FileNotFoundError):
                proof_tmp.unlink()
            try:
                proof_result = self.proof_solver(
                    terminal_path, timeout_s, proof_tmp
                )
            except Exception as exc:  # noqa: BLE001
                with contextlib.suppress(FileNotFoundError):
                    proof_tmp.unlink()
                return TerminalPublication(
                    "PROOF_SOLVER_EXCEPTION",
                    proof_error=f"{type(exc).__name__}: {exc}",
                )
            if proof_result.verdict != "UNSAT":
                with contextlib.suppress(FileNotFoundError):
                    proof_tmp.unlink()
                return TerminalPublication(
                    "PROOF_SOLVER_NOT_UNSAT",
                    proof_error=(
                        "fresh proof-producing solver returned "
                        f"{proof_result.verdict!r} "
                        f"(returncode={proof_result.returncode})"
                    ),
                )

        if not proof_tmp.is_file() or proof_tmp.stat().st_size == 0:
            return TerminalPublication("MISSING_DRAT")

        os.replace(proof_tmp, proof_path)
        try:
            checked = self.checker_runner(terminal_path, proof_path, timeout_s)
        except Exception as exc:  # noqa: BLE001
            return TerminalPublication("CHECKER_EXCEPTION", str(exc))

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
