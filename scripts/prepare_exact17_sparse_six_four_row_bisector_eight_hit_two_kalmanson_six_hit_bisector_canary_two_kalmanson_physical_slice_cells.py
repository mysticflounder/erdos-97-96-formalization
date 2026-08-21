# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Prepare the exact-17 six-hit-bisector-canary-two-kalmanson physical-slice successor cells.

This command is preparation-only: it never contacts PIQD and never invokes a
SAT solver.  It delegates filesystem custody and streaming DIMACS construction
to the audited predecessor preparer while replacing every source, schema, and
root identity with the six-hit-bisector-canary-two-kalmanson successor identities.

The source pins identify the committed Lean package.  The production route is
intentionally fail-closed until a governed root and final preparer pins are
registered.  Before publishing any child, preparation exports the immediate
SixHitBisector parent and proves that the 32 exact successor clauses are genuinely
new, unsubsumed by the parent, and the exact suffix of the successor root.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import secrets
import stat
import subprocess
import sys
import threading
from collections.abc import Iterator, Sequence
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any

REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

import prepare_exact17_sparse_six_four_row_bisector_physical_slice_cells as accepted

from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    UNSAT_MEANS_OBSTRUCTION,
    canonical_json_bytes,
    sha256_bytes,
    validate_wave_manifest,
)

ROOT = REPO_ROOT
LANE_ID = "exact17-six-hit-bisector-canary-two-kalmanson-preparer-20260821"
RUN_ID = "physical-slice-cell-campaign-v1"
RUN_OWNER = "exact17-six-hit-bisector-canary-two-kalmanson-preparer"
BASE_HEAD = "d00c55e9b463aa2a6eb85e95f3ce9860c2171a0c"
STANDARD_ID = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._-]{0,127}$")

SOURCE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonPhysicalSliceCoverage.lean"
)
ROOT_SOURCE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmanson.lean"
)
EXPORTER_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonPhysicalSliceCellExport.lean"
)
ORIGINAL_PARENT_EXPORTER_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisectorPhysicalSliceCellExport.lean"
)
DELEGATED_PREPARER_PATH = (
    ROOT
    / "scripts/prepare_exact17_sparse_six_four_row_bisector_physical_slice_cells.py"
)
HARDENED_PREPARER_PATH = (
    ROOT / "scripts/prepare_exact17_sparse_six_physical_slice_cells.py"
)
VARIABLE_MAP_PATH = ROOT / "census/p97_search/waves/exact17/child40/variable-map.json"
CHECKPOINT_PATH = ROOT / f".codex/worktree-checkpoints/{LANE_ID}.json"
PREPARER_PATH = Path(__file__).resolve()
TEST_PATH = ROOT / (
    "scripts/test_prepare_exact17_sparse_six_four_row_bisector_"
    "eight_hit_two_kalmanson_six_hit_bisector_canary_two_kalmanson_physical_slice_cells.py"
)
PRODUCTION_CONFIG_RELATIVE = Path(
    "census/p97_search/waves/exact17/six-hit-bisector-canary-two-kalmanson-preparation-config.json"
)
PRODUCTION_CONFIG_PATH = ROOT / PRODUCTION_CONFIG_RELATIVE
PRODUCTION_CONFIG_SCHEMA = (
    "p97-exact17-six-hit-bisector-canary-two-kalmanson-preparation-config/v1"
)

# These globals are populated only while an authenticated external production
# config is retained.  Keeping them provisional in the checked-in code avoids
# the impossible cycle of embedding this file's own exact digest in itself.
EXPECTED_SOURCE_SHA256 = ""
EXPECTED_ROOT_SOURCE_SHA256 = ""
EXPECTED_EXPORTER_SHA256 = ""
EXPECTED_ORIGINAL_PARENT_EXPORTER_SHA256 = ""
EXPECTED_DELEGATED_PREPARER_SHA256 = ""
EXPECTED_DELEGATED_PREPARER_BYTES = 0
EXPECTED_HARDENED_PREPARER_SHA256 = ""
EXPECTED_HARDENED_PREPARER_BYTES = 0
DELEGATED_PREPARER_COMMIT = ""
HARDENED_PREPARER_COMMIT = ""
EXPECTED_VARIABLE_MAP_SHA256 = ""
EXPECTED_CHECKPOINT_SHA256 = ""
EXPECTED_CHECKPOINT_MANIFEST_SHA256 = ""
PINNED_SOURCE_COMMIT = ""
PRODUCTION_PINS_FINALIZED = False
REGISTERED_GENERATED_ROOT = ""

LEGAL_CENTERS = accepted.LEGAL_CENTERS
PHYSICAL_POINTS = accepted.PHYSICAL_POINTS
PARENT_VARIABLES = 308
PARENT_CLAUSES = 7_409_297
ORIGINAL_PARENT_CLAUSES = 7_409_265
CELL_CLAUSES = 7_409_303
CELL_COUNT = 76
DIRECT_SENTINELS = accepted.DIRECT_SENTINELS
SOURCE_THEOREM = (
    "Problem97."
    "ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonPhysicalSliceCoverage."
    "sourceAssign_sparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCell"
)
EXPECTED_CANARY_TWO_KALMANSON_SUFFIX: tuple[tuple[int, ...], ...] = (
    (-307, -11, -13, -113, -104, -179, -172, -26, -30),
    (-307, -243, -255, -226, -230, -70, -77, -138, -153),
    (-308, -11, -10, -113, -104, -179, -172, -26, -27),
    (-308, -243, -255, -226, -230, -70, -77, -138, -153),
    (-307, -143, -153, -160, -161, -136, -134, -280, -287),
    (-307, -31, -30, -65, -67, -268, -256, -220, -205),
    (-308, -143, -153, -211, -212, -136, -134, -280, -287),
    (-308, -31, -27, -65, -67, -265, -256, -169, -154),
    (-307, -146, -153, -136, -134, -280, -287, -61, -59),
    (-307, -21, -30, -268, -256, -220, -205, -157, -169),
    (-308, -149, -153, -136, -134, -280, -287, -64, -59),
    (-308, -21, -27, -265, -256, -169, -154, -208, -220),
    (-307, -161, -157, -136, -134, -280, -287, -85, -72),
    (-307, -67, -61, -268, -256, -220, -205, -183, -180),
    (-308, -212, -208, -136, -134, -280, -287, -85, -72),
    (-308, -67, -64, -265, -256, -169, -154, -180, -183),
    (-307, -161, -157, -46, -38, -267, -265, -61, -59),
    (-307, -67, -61, -40, -44, -125, -123, -157, -169),
    (-308, -212, -208, -46, -38, -267, -268, -64, -59),
    (-308, -67, -64, -40, -47, -125, -123, -208, -220),
    (-307, -176, -172, -136, -125, -280, -274, -60, -59, -26, -34),
    (-307, -80, -77, -268, -267, -220, -213, -155, -169, -138, -149),
    (-308, -176, -172, -136, -125, -280, -274, -60, -59, -26, -34),
    (-308, -80, -77, -265, -267, -169, -162, -206, -220, -138, -146),
    (-307, -161, -157, -131, -136, -267, -265, -61, -59, -85, -72),
    (-307, -67, -61, -261, -268, -125, -123, -157, -169, -183, -180),
    (-308, -212, -208, -131, -136, -267, -268, -64, -59, -85, -72),
    (-308, -67, -64, -261, -265, -125, -123, -208, -220, -180, -183),
    (
        -307,
        -161,
        -157,
        -131,
        -136,
        -38,
        -36,
        -267,
        -265,
        -280,
        -274,
        -60,
        -61,
        -26,
        -34,
    ),
    (
        -307,
        -67,
        -61,
        -261,
        -268,
        -44,
        -43,
        -125,
        -123,
        -220,
        -213,
        -155,
        -157,
        -138,
        -149,
    ),
    (
        -308,
        -212,
        -208,
        -131,
        -136,
        -38,
        -36,
        -267,
        -268,
        -280,
        -274,
        -60,
        -64,
        -26,
        -34,
    ),
    (
        -308,
        -67,
        -64,
        -261,
        -265,
        -47,
        -43,
        -125,
        -123,
        -169,
        -162,
        -206,
        -208,
        -138,
        -146,
    ),
)
CANARY_ACTIVE_CLAUSE = EXPECTED_CANARY_TWO_KALMANSON_SUFFIX[1]
ORDER_SHA256 = sha256_bytes(
    b"exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson-physical-slice-order-v1"
)
SCHEMA = (
    "p97-exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson-"
    "physical-slice-preparation/v1"
)
CAMPAIGN_SCHEMA = "p97-exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson-physical-slice-campaign/v1"
PRODUCER_SCHEMA = accepted.PRODUCER_SCHEMA
SOURCE_SCHEMA = accepted.SOURCE_SCHEMA
WAVE_SCHEMA = accepted.WAVE_SCHEMA
FINITE_SCHEMA = "p97-exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson-physical-slice/v1"
ROOT_PRODUCER_SCHEMA = "p97-exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson-root-producer/v1"

PreparationError = accepted.PreparationError
_CONFIGURATION_LOCK = threading.RLock()
_ACTIVE_SUPPORT = threading.local()
_ACTIVE_PRODUCTION = threading.local()


def _anchor(info: os.stat_result) -> tuple[int, int, int, int, int, int, int]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_nlink,
        info.st_mode,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _open_directory_nofollow(path: Path) -> int:
    absolute = Path(os.path.abspath(path))
    flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    descriptor = os.open(os.path.sep, flags)
    try:
        for component in absolute.parts[1:]:
            if component in {"", ".", ".."}:
                raise PreparationError(f"unsafe directory component: {path}")
            next_descriptor = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = next_descriptor
        before = os.fstat(descriptor)
        after = os.fstat(descriptor)
        if not stat.S_ISDIR(before.st_mode) or _anchor(before) != _anchor(after):
            raise PreparationError(f"directory identity is unstable: {path}")
        return descriptor
    except BaseException:
        os.close(descriptor)
        raise


def _read_fd_stable(descriptor: int, label: str) -> tuple[bytes, os.stat_result]:
    before = os.fstat(descriptor)
    if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
        raise PreparationError(f"{label} is not a single-link regular file")
    os.lseek(descriptor, 0, os.SEEK_SET)
    chunks: list[bytes] = []
    while True:
        block = os.read(descriptor, 1024 * 1024)
        if not block:
            break
        chunks.append(block)
    after = os.fstat(descriptor)
    if _anchor(before) != _anchor(after):
        raise PreparationError(f"{label} changed while reading")
    return b"".join(chunks), after


def _open_named_nofollow(path: Path, label: str) -> tuple[int, int]:
    parent_fd = _open_directory_nofollow(path.parent)
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    try:
        descriptor = os.open(path.name, flags, dir_fd=parent_fd)
        named = os.stat(path.name, dir_fd=parent_fd, follow_symlinks=False)
        opened = os.fstat(descriptor)
        if _anchor(named) != _anchor(opened):
            raise PreparationError(f"{label} pathname crossed inode custody")
        return descriptor, parent_fd
    except BaseException:
        os.close(parent_fd)
        raise


@dataclass
class _PinnedInput:
    label: str
    path: Path
    descriptor: int
    parent_descriptor: int
    identity: tuple[int, int, int, int, int, int, int]
    sha256: str

    @classmethod
    def capture(cls, path: Path, label: str, expected_sha256: str) -> _PinnedInput:
        descriptor, parent = _open_named_nofollow(path, label)
        try:
            payload, info = _read_fd_stable(descriptor, label)
            digest = sha256_bytes(payload)
            if digest != expected_sha256:
                raise PreparationError(f"{label} digest drifted")
            return cls(label, path, descriptor, parent, _anchor(info), digest)
        except BaseException:
            os.close(descriptor)
            os.close(parent)
            raise

    def verify(self) -> bytes:
        payload, info = _read_fd_stable(self.descriptor, self.label)
        named = os.stat(
            self.path.name,
            dir_fd=self.parent_descriptor,
            follow_symlinks=False,
        )
        if sha256_bytes(payload) != self.sha256:
            raise PreparationError(f"{self.label} content drifted")
        if _anchor(info) != self.identity or _anchor(named) != self.identity:
            raise PreparationError(f"{self.label} identity drifted")
        current, current_parent = _open_named_nofollow(self.path, self.label)
        try:
            if _anchor(os.fstat(current)) != self.identity:
                raise PreparationError(f"{self.label} resolved path identity drifted")
        finally:
            os.close(current)
            os.close(current_parent)
        return payload

    def verify_identity(self) -> os.stat_result:
        opened = os.fstat(self.descriptor)
        named = os.stat(
            self.path.name,
            dir_fd=self.parent_descriptor,
            follow_symlinks=False,
        )
        if _anchor(opened) != self.identity or _anchor(named) != self.identity:
            raise PreparationError(f"{self.label} identity drifted")
        return opened

    def close(self) -> None:
        os.close(self.descriptor)
        os.close(self.parent_descriptor)


class _SupportCustody:
    def __init__(self, entries: dict[str, _PinnedInput]):
        self.entries = entries

    @classmethod
    def capture(cls, files: dict[str, tuple[Path, str]]) -> _SupportCustody:
        entries: dict[str, _PinnedInput] = {}
        try:
            for label, (path, digest) in files.items():
                entries[label] = _PinnedInput.capture(path, label, digest)
            return cls(entries)
        except BaseException:
            for entry in entries.values():
                entry.close()
            raise

    def verify(self) -> None:
        for entry in self.entries.values():
            entry.verify()

    def close(self) -> None:
        for entry in self.entries.values():
            entry.close()


@contextmanager
def _retained_support(files: dict[str, tuple[Path, str]]) -> Iterator[_SupportCustody]:
    custody = _SupportCustody.capture(files)
    if getattr(_ACTIVE_SUPPORT, "custody", None) is not None:
        custody.close()
        raise PreparationError("nested support custody is forbidden")
    _ACTIVE_SUPPORT.custody = custody
    try:
        yield custody
    finally:
        _ACTIVE_SUPPORT.custody = None
        custody.close()


def _active_support() -> _SupportCustody | None:
    return getattr(_ACTIVE_SUPPORT, "custody", None)


def _verify_delegated_dependency_custody() -> None:
    custody = _active_support()
    if custody is None:
        return
    for label, expected_bytes in (
        ("delegated_preparer", EXPECTED_DELEGATED_PREPARER_BYTES),
        ("hardened_preparer", EXPECTED_HARDENED_PREPARER_BYTES),
    ):
        entry = custody.entries.get(label)
        if entry is None:
            raise PreparationError(f"retained {label} custody is absent")
        if len(entry.verify()) != expected_bytes:
            raise PreparationError(f"{label} byte count drifted")


def _delegated_call(function: Any, /, *args: Any, **kwargs: Any) -> Any:
    _verify_delegated_dependency_custody()
    try:
        return function(*args, **kwargs)
    finally:
        _verify_delegated_dependency_custody()


def _parent_header(line: bytes) -> tuple[int, int]:
    if not line.endswith(b"\n"):
        raise PreparationError("parent DIMACS header is unterminated")
    fields = line[:-1].split()
    if len(fields) != 4 or fields[:2] != [b"p", b"cnf"]:
        raise PreparationError("parent DIMACS header is not canonical")
    try:
        return int(fields[2]), int(fields[3])
    except ValueError as error:
        raise PreparationError("parent DIMACS counts are not integers") from error


def _validate_clause(line: bytes, variables: int) -> None:
    if not line.endswith(b"\n"):
        raise PreparationError("DIMACS body has an unterminated clause")
    try:
        values = tuple(int(token) for token in line[:-1].split())
    except ValueError as error:
        raise PreparationError("DIMACS body contains a non-integer token") from error
    if not values or values[-1] != 0:
        raise PreparationError("DIMACS clause lacks its zero terminator")
    if any(value == 0 or abs(value) > variables for value in values[:-1]):
        raise PreparationError("DIMACS literal is outside its variable range")


def _inode(info: os.stat_result) -> tuple[int, int]:
    return info.st_dev, info.st_ino


@dataclass
class _PublishedFile:
    path: Path
    descriptor: int
    parent_descriptor: int
    identity: tuple[int, int]

    @classmethod
    def capture(cls, path: Path, label: str) -> _PublishedFile:
        descriptor, parent = _open_named_nofollow(path, label)
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            os.close(descriptor)
            os.close(parent)
            raise PreparationError(f"{label} is not a single-link regular file")
        return cls(path, descriptor, parent, _inode(info))

    def verify(self, label: str, *, expected_nlink: int = 1) -> os.stat_result:
        opened = os.fstat(self.descriptor)
        named = os.stat(
            self.path.name,
            dir_fd=self.parent_descriptor,
            follow_symlinks=False,
        )
        if (
            not stat.S_ISREG(opened.st_mode)
            or opened.st_nlink != expected_nlink
            or _inode(opened) != self.identity
            or _inode(named) != self.identity
        ):
            raise PreparationError(f"{label} identity drifted")
        current, current_parent = _open_named_nofollow(self.path, label)
        try:
            if _inode(os.fstat(current)) != self.identity:
                raise PreparationError(f"{label} resolved path identity drifted")
        finally:
            os.close(current)
            os.close(current_parent)
        return opened

    def unlink(self, label: str, *, expected_nlink: int = 1) -> None:
        self.verify(label, expected_nlink=expected_nlink)
        os.unlink(self.path.name, dir_fd=self.parent_descriptor)
        os.fsync(self.parent_descriptor)

    def close(self) -> None:
        os.close(self.descriptor)
        os.close(self.parent_descriptor)


def _ensure_directory_under(root: Path, path: Path) -> int:
    root_absolute = root.resolve(strict=True)
    target = path.resolve(strict=False)
    try:
        relative = target.relative_to(root_absolute)
    except ValueError as error:
        raise PreparationError("governed directory escapes the run root") from error
    current = _open_directory_nofollow(root_absolute)
    flags = (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    try:
        for component in relative.parts:
            if component in {"", ".", ".."}:
                raise PreparationError("unsafe governed directory component")
            try:
                next_descriptor = os.open(component, flags, dir_fd=current)
            except FileNotFoundError:
                try:
                    os.mkdir(component, 0o700, dir_fd=current)
                except FileExistsError:
                    pass
                next_descriptor = os.open(component, flags, dir_fd=current)
            before = os.fstat(next_descriptor)
            after = os.fstat(next_descriptor)
            if not stat.S_ISDIR(before.st_mode) or _anchor(before) != _anchor(after):
                os.close(next_descriptor)
                raise PreparationError("governed directory identity drifted")
            os.close(current)
            current = next_descriptor
        return current
    except BaseException:
        os.close(current)
        raise


def _write_all(descriptor: int, payload: bytes) -> None:
    cursor = 0
    while cursor < len(payload):
        written = os.write(descriptor, payload[cursor:])
        if written <= 0:
            raise PreparationError("short custody write")
        cursor += written


def _secure_read_named(path: Path, label: str) -> bytes:
    descriptor, parent = _open_named_nofollow(path, label)
    try:
        payload, opened = _read_fd_stable(descriptor, label)
        named = os.stat(path.name, dir_fd=parent, follow_symlinks=False)
        if _anchor(opened) != _anchor(named):
            raise PreparationError(f"{label} pathname changed while reading")
        return payload
    finally:
        os.close(descriptor)
        os.close(parent)


def _secure_write_once(path: Path, payload: bytes) -> None:
    """Publish exact bytes without trusting an absent pathname."""
    if type(payload) is not bytes:
        raise PreparationError("write-once payload must be builtin bytes")
    parent = _open_directory_nofollow(path.parent)
    candidate = f".{path.name}.{secrets.token_hex(16)}.candidate"
    flags = (
        os.O_RDWR
        | os.O_CREAT
        | os.O_EXCL
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    descriptor: int | None = None
    try:
        try:
            existing = os.open(
                path.name,
                os.O_RDONLY
                | getattr(os, "O_CLOEXEC", 0)
                | getattr(os, "O_NOFOLLOW", 0),
                dir_fd=parent,
            )
        except FileNotFoundError:
            existing = None
        except OSError as error:
            raise PreparationError(
                f"existing write-once artifact is unsafe: {path}"
            ) from error
        if existing is not None:
            try:
                current, opened = _read_fd_stable(
                    existing, "existing write-once artifact"
                )
                named = os.stat(path.name, dir_fd=parent, follow_symlinks=False)
                if _anchor(opened) != _anchor(named) or current != payload:
                    raise PreparationError(f"write-once artifact differs: {path}")
                resolved, resolved_parent = _open_named_nofollow(
                    path, "existing write-once artifact"
                )
                try:
                    if _anchor(os.fstat(resolved)) != _anchor(opened):
                        raise PreparationError(
                            f"write-once resolved path differs: {path}"
                        )
                finally:
                    os.close(resolved)
                    os.close(resolved_parent)
                return
            finally:
                os.close(existing)
        descriptor = os.open(candidate, flags, 0o600, dir_fd=parent)
        _write_all(descriptor, payload)
        os.fsync(descriptor)
        candidate_info = os.fstat(descriptor)
        if not stat.S_ISREG(candidate_info.st_mode) or candidate_info.st_nlink != 1:
            raise PreparationError("write-once candidate custody failed")
        try:
            os.link(
                candidate,
                path.name,
                src_dir_fd=parent,
                dst_dir_fd=parent,
                follow_symlinks=False,
            )
        except FileExistsError as error:
            try:
                raced = os.open(
                    path.name,
                    os.O_RDONLY
                    | getattr(os, "O_CLOEXEC", 0)
                    | getattr(os, "O_NOFOLLOW", 0),
                    dir_fd=parent,
                )
                try:
                    current, opened = _read_fd_stable(
                        raced, "raced write-once artifact"
                    )
                    named = os.stat(path.name, dir_fd=parent, follow_symlinks=False)
                    if _anchor(opened) != _anchor(named) or current != payload:
                        raise PreparationError(f"concurrent artifact differs: {path}")
                    resolved, resolved_parent = _open_named_nofollow(
                        path, "raced write-once artifact"
                    )
                    try:
                        if _anchor(os.fstat(resolved)) != _anchor(opened):
                            raise PreparationError(
                                f"concurrent resolved artifact differs: {path}"
                            )
                    finally:
                        os.close(resolved)
                        os.close(resolved_parent)
                    return
                finally:
                    os.close(raced)
            except OSError as crossed:
                raise PreparationError(
                    f"concurrent artifact is unsafe: {path}"
                ) from crossed
            finally:
                try:
                    os.unlink(candidate, dir_fd=parent)
                except FileNotFoundError:
                    pass
            raise PreparationError(f"concurrent artifact differs: {path}") from error
        published = os.stat(path.name, dir_fd=parent, follow_symlinks=False)
        if _inode(published) != _inode(candidate_info) or published.st_nlink != 2:
            raise PreparationError("write-once publication crossed inode custody")
        os.unlink(candidate, dir_fd=parent)
        candidate = ""
        final = os.stat(path.name, dir_fd=parent, follow_symlinks=False)
        if _inode(final) != _inode(candidate_info) or final.st_nlink != 1:
            raise PreparationError("write-once final link identity drifted")
        resolved, resolved_parent = _open_named_nofollow(
            path, "published write-once artifact"
        )
        try:
            if _inode(os.fstat(resolved)) != _inode(final):
                raise PreparationError("write-once resolved path identity drifted")
        finally:
            os.close(resolved)
            os.close(resolved_parent)
        os.fsync(parent)
    finally:
        if descriptor is not None:
            os.close(descriptor)
        if candidate:
            try:
                os.unlink(candidate, dir_fd=parent)
            except FileNotFoundError:
                pass
        os.close(parent)


def _publish_private_export(
    output_path: Path,
    invoke: Any,
) -> _PublishedFile:
    """Run one exporter against a retained private workspace and publish once."""
    run_root = (ROOT / REGISTERED_GENERATED_ROOT).resolve(strict=True)
    expected_parent = run_root / "tmp"
    if output_path.resolve(strict=False).parent != expected_parent:
        raise PreparationError(
            "Lean export target is outside the governed tmp directory"
        )
    run_root_fd = _open_directory_nofollow(run_root)
    tmp_fd = os.open(
        "tmp",
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0),
        dir_fd=run_root_fd,
    )
    target_parent = os.dup(tmp_fd)
    workspace_name = f".lean-export-{secrets.token_hex(16)}"
    workspace_fd: int | None = None
    reserved_fd: int | None = None
    candidate = "lean-output.cnf"
    try:
        os.mkdir(workspace_name, 0o700, dir_fd=tmp_fd)
        workspace_fd = os.open(
            workspace_name,
            os.O_RDONLY
            | getattr(os, "O_CLOEXEC", 0)
            | getattr(os, "O_DIRECTORY", 0)
            | getattr(os, "O_NOFOLLOW", 0),
            dir_fd=tmp_fd,
        )
        workspace_info = os.fstat(workspace_fd)
        if (
            not stat.S_ISDIR(workspace_info.st_mode)
            or stat.S_IMODE(workspace_info.st_mode) != 0o700
        ):
            raise PreparationError("Lean export workspace is not private")
        reserved_fd = os.open(
            candidate,
            os.O_RDWR
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_CLOEXEC", 0)
            | getattr(os, "O_NOFOLLOW", 0),
            0o600,
            dir_fd=workspace_fd,
        )
        reserved_identity = _inode(os.fstat(reserved_fd))
        named_workspace = os.stat(workspace_name, dir_fd=tmp_fd, follow_symlinks=False)
        if _inode(named_workspace) != _inode(workspace_info):
            raise PreparationError("Lean export workspace pathname drifted")
        resolved_workspace = _open_directory_nofollow(expected_parent / workspace_name)
        try:
            if _inode(os.fstat(resolved_workspace)) != _inode(workspace_info):
                raise PreparationError("Lean export resolved workspace drifted")
        finally:
            os.close(resolved_workspace)
        bound_path = expected_parent / workspace_name / candidate
        invoke(bound_path, (workspace_fd,))
        named_workspace = os.stat(workspace_name, dir_fd=tmp_fd, follow_symlinks=False)
        if _inode(named_workspace) != _inode(workspace_info):
            raise PreparationError("Lean export workspace pathname drifted")
        resolved_workspace = _open_directory_nofollow(expected_parent / workspace_name)
        try:
            if _inode(os.fstat(resolved_workspace)) != _inode(workspace_info):
                raise PreparationError("Lean export resolved workspace drifted")
        finally:
            os.close(resolved_workspace)
        named = os.stat(candidate, dir_fd=workspace_fd, follow_symlinks=False)
        written = os.fstat(reserved_fd)
        if (
            not stat.S_ISREG(written.st_mode)
            or written.st_nlink != 1
            or _inode(written) != reserved_identity
            or _inode(named) != reserved_identity
        ):
            raise PreparationError("Lean export crossed its reserved inode")
        os.fsync(reserved_fd)
        try:
            os.link(
                candidate,
                output_path.name,
                src_dir_fd=workspace_fd,
                dst_dir_fd=target_parent,
                follow_symlinks=False,
            )
        except FileExistsError as error:
            raise PreparationError("Lean export target already exists") from error
        published = os.stat(
            output_path.name, dir_fd=target_parent, follow_symlinks=False
        )
        if _inode(published) != reserved_identity or published.st_nlink != 2:
            raise PreparationError("Lean export publication crossed inode custody")
        os.unlink(candidate, dir_fd=workspace_fd)
        candidate = ""
        os.fsync(target_parent)
        retained = os.open(
            output_path.name,
            os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0),
            dir_fd=target_parent,
        )
        final = os.fstat(retained)
        if _inode(final) != reserved_identity or final.st_nlink != 1:
            os.close(retained)
            raise PreparationError("Lean export retained identity drifted")
        retained_parent = os.dup(target_parent)
        result = _PublishedFile(
            output_path, retained, retained_parent, reserved_identity
        )
        try:
            result.verify("Lean export publication")
            return result
        except BaseException:
            result.close()
            raise
    finally:
        if reserved_fd is not None:
            os.close(reserved_fd)
        if workspace_fd is not None:
            if candidate:
                try:
                    os.unlink(candidate, dir_fd=workspace_fd)
                except FileNotFoundError:
                    pass
            os.close(workspace_fd)
        try:
            os.rmdir(workspace_name, dir_fd=tmp_fd)
        except FileNotFoundError:
            pass
        os.close(target_parent)
        os.close(tmp_fd)
        os.close(run_root_fd)


def _sha256_file(path: Path) -> str:
    return _delegated_call(accepted._sha256_file, path)


def _require_regular(path: Path, label: str) -> None:
    _delegated_call(accepted._require_regular, path, label)


def _repo_relative(root: Path, path: Path) -> str:
    return _delegated_call(accepted._repo_relative, root, path)


def category_id(center: int, category: str) -> str:
    _delegated_call(accepted.hardened.category_id, center, category)
    return f"four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson-next-center-{center:02d}-physical-{category}"


def next_center_variable(center: int) -> int:
    if type(center) is not int or center not in LEGAL_CENTERS:
        raise PreparationError(f"illegal next-center label: {center!r}")
    variable = 290 + center
    if not 1 <= variable <= PARENT_VARIABLES:
        raise PreparationError("next-center variable exceeds the variable map")
    return variable


def category_units(center: int, category: str) -> tuple[int, ...]:
    units = (next_center_variable(center),) + _delegated_call(
        accepted.hardened.category_units, center, category
    )
    if len(set(units)) != len(units):
        raise PreparationError("generated cell repeats a unit clause")
    return units


def cell_cnf_bytes(parent: bytes, center: int, category: str) -> bytes:
    first, separator, body = parent.partition(b"\n")
    if not separator:
        raise PreparationError("parent DIMACS header is missing")
    variables, clauses = _parent_header(first + separator)
    if (variables, clauses) != (PARENT_VARIABLES, PARENT_CLAUSES):
        raise PreparationError("cumulative-root dimensions drifted")
    units = category_units(center, category)
    suffix = b"".join(f"{unit} 0\n".encode("ascii") for unit in units)
    return f"p cnf {variables} {clauses + len(units)}\n".encode() + body + suffix


def run_lean_root_export(
    repo_root: Path, exporter_path: Path, output_path: Path
) -> _PublishedFile:
    lean_root = repo_root / "lean"
    relative = exporter_path.resolve().relative_to(lean_root.resolve())

    def invoke(bound_output: Path, pass_fds: tuple[int, ...]) -> None:
        try:
            subprocess.run(
                [
                    "lake",
                    "env",
                    "lean",
                    "--run",
                    str(relative),
                    "root",
                    str(bound_output),
                ],
                cwd=lean_root,
                check=True,
                pass_fds=pass_fds,
            )
        except (OSError, subprocess.CalledProcessError) as error:
            raise PreparationError("Lean cumulative-root export failed") from error

    return _publish_private_export(output_path, invoke)


def run_lean_export(
    repo_root: Path,
    exporter_path: Path,
    center: int,
    category: str,
    output_path: Path,
) -> _PublishedFile:
    lean_root = repo_root / "lean"
    relative = exporter_path.resolve().relative_to(lean_root.resolve())

    def invoke(bound_output: Path, pass_fds: tuple[int, ...]) -> None:
        try:
            subprocess.run(
                [
                    "lake",
                    "env",
                    "lean",
                    "--run",
                    str(relative),
                    str(center),
                    _delegated_call(accepted._export_category_text, category),
                    str(bound_output),
                ],
                cwd=lean_root,
                check=True,
                pass_fds=pass_fds,
            )
        except (OSError, subprocess.CalledProcessError) as error:
            raise PreparationError("Lean cell export failed") from error

    return _publish_private_export(output_path, invoke)


def _capture_export_result(result: Any, path: Path, label: str) -> _PublishedFile:
    if isinstance(result, _PublishedFile):
        if result.path.resolve(strict=False) != path.resolve(strict=False):
            result.close()
            raise PreparationError(f"{label} returned the wrong path")
        result.verify(label)
        return result
    if result is not None:
        raise PreparationError(f"{label} returned an unsupported custody object")
    return _PublishedFile.capture(path, label)


def _inspect_published_cnf(
    published: _PublishedFile,
    *,
    label: str,
    expected_variables: int,
    expected_clauses: int,
    expected_sha256: str | None = None,
    expected_bytes: int | None = None,
) -> dict[str, Any]:
    before = published.verify(label)
    digest = hashlib.sha256()
    size = 0
    count = 0
    duplicate = os.dup(published.descriptor)
    try:
        os.lseek(duplicate, 0, os.SEEK_SET)
        with os.fdopen(duplicate, "rb", closefd=True) as handle:
            duplicate = -1
            header = handle.readline()
            digest.update(header)
            size += len(header)
            variables, clauses = _parent_header(header)
            if (variables, clauses) != (expected_variables, expected_clauses):
                raise PreparationError(f"{label} DIMACS dimensions drifted")
            for line in handle:
                digest.update(line)
                size += len(line)
                _validate_clause(line, variables)
                count += 1
    finally:
        if duplicate >= 0:
            os.close(duplicate)
    after = published.verify(label)
    computed = digest.hexdigest()
    if _anchor(before) != _anchor(after) or count != expected_clauses:
        raise PreparationError(f"{label} changed while validating")
    if expected_sha256 is not None and computed != expected_sha256:
        raise PreparationError(f"{label} SHA-256 drifted")
    if expected_bytes is not None and size != expected_bytes:
        raise PreparationError(f"{label} byte count drifted")
    return {
        "sha256": computed,
        "bytes": size,
        "variables": variables,
        "clauses": count,
        "header": f"p cnf {variables} {clauses}",
    }


def _clause_tuple(
    line: bytes,
    variables: int,
    label: str,
    *,
    require_unique_literals: bool = True,
) -> tuple[int, ...]:
    """Parse one canonical line-bounded DIMACS clause."""
    _validate_clause(line, variables)
    try:
        fields = tuple(int(field) for field in line.split())
    except ValueError as error:
        raise PreparationError(f"{label} contains a non-integer literal") from error
    if not fields or fields[-1] != 0 or 0 in fields[:-1]:
        raise PreparationError(f"{label} is not one terminated DIMACS clause")
    clause = fields[:-1]
    if require_unique_literals and len(set(clause)) != len(clause):
        raise PreparationError(f"{label} repeats a literal")
    return clause


def validate_six_hit_bisector_canary_two_kalmanson_parent_novelty(
    original_parent: _PublishedFile,
    successor_root: _PublishedFile,
) -> dict[str, Any]:
    """Prove exact suffix identity and parent novelty before child publication."""
    original_before = original_parent.verify("immediate SixHitBisector parent")
    successor_before = successor_root.verify(
        "six-hit-bisector-canary-two-kalmanson successor root"
    )
    original_fd = os.dup(original_parent.descriptor)
    successor_fd = os.dup(successor_root.descriptor)
    exact_parent_multiplicity = [0] * len(EXPECTED_CANARY_TWO_KALMANSON_SUFFIX)
    parent_subsumer_count = [0] * len(EXPECTED_CANARY_TWO_KALMANSON_SUFFIX)
    successor_multiplicity = [0] * len(EXPECTED_CANARY_TWO_KALMANSON_SUFFIX)
    try:
        os.lseek(original_fd, 0, os.SEEK_SET)
        os.lseek(successor_fd, 0, os.SEEK_SET)
        with (
            os.fdopen(original_fd, "rb", closefd=True) as parent_handle,
            os.fdopen(successor_fd, "rb", closefd=True) as successor_handle,
        ):
            original_fd = -1
            successor_fd = -1
            parent_header = parent_handle.readline()
            successor_header = successor_handle.readline()
            if _parent_header(parent_header) != (
                PARENT_VARIABLES,
                ORIGINAL_PARENT_CLAUSES,
            ):
                raise PreparationError(
                    "immediate SixHitBisector parent dimensions drifted"
                )
            if _parent_header(successor_header) != (
                PARENT_VARIABLES,
                PARENT_CLAUSES,
            ):
                raise PreparationError(
                    "six-hit-bisector-canary-two-kalmanson successor dimensions drifted"
                )
            suffix_sets = tuple(
                set(clause) for clause in EXPECTED_CANARY_TWO_KALMANSON_SUFFIX
            )
            for index in range(ORIGINAL_PARENT_CLAUSES):
                parent_line = parent_handle.readline()
                successor_line = successor_handle.readline()
                if not parent_line or not successor_line:
                    raise PreparationError("parent or successor body ended early")
                if successor_line != parent_line:
                    raise PreparationError(
                        f"successor parent prefix drifted at clause {index}"
                    )
                clause = _clause_tuple(
                    parent_line,
                    PARENT_VARIABLES,
                    f"parent clause {index}",
                    require_unique_literals=False,
                )
                clause_set = set(clause)
                for suffix_index, suffix in enumerate(
                    EXPECTED_CANARY_TWO_KALMANSON_SUFFIX
                ):
                    if clause == suffix:
                        exact_parent_multiplicity[suffix_index] += 1
                        successor_multiplicity[suffix_index] += 1
                    if clause_set <= suffix_sets[suffix_index]:
                        parent_subsumer_count[suffix_index] += 1
            if parent_handle.readline():
                raise PreparationError(
                    "immediate SixHitBisector parent has trailing clauses"
                )
            observed_suffix: list[tuple[int, ...]] = []
            for suffix_index, expected in enumerate(
                EXPECTED_CANARY_TWO_KALMANSON_SUFFIX
            ):
                line = successor_handle.readline()
                if not line:
                    raise PreparationError(
                        "six-hit-bisector-canary-two-kalmanson successor suffix ended early"
                    )
                clause = _clause_tuple(
                    line,
                    PARENT_VARIABLES,
                    f"six-hit-bisector-canary-two-kalmanson suffix clause {suffix_index}",
                )
                observed_suffix.append(clause)
                for candidate_index, candidate in enumerate(
                    EXPECTED_CANARY_TWO_KALMANSON_SUFFIX
                ):
                    if clause == candidate:
                        successor_multiplicity[candidate_index] += 1
                if clause != expected:
                    raise PreparationError(
                        f"six-hit-bisector-canary-two-kalmanson successor suffix order/value drifted at {suffix_index}"
                    )
            if successor_handle.readline():
                raise PreparationError(
                    "six-hit-bisector-canary-two-kalmanson successor has trailing clauses"
                )
    finally:
        if original_fd >= 0:
            os.close(original_fd)
        if successor_fd >= 0:
            os.close(successor_fd)
    original_after = original_parent.verify("immediate SixHitBisector parent")
    successor_after = successor_root.verify(
        "six-hit-bisector-canary-two-kalmanson successor root"
    )
    if _anchor(original_before) != _anchor(original_after):
        raise PreparationError(
            "immediate SixHitBisector parent changed during novelty scan"
        )
    if _anchor(successor_before) != _anchor(successor_after):
        raise PreparationError(
            "six-hit-bisector-canary-two-kalmanson successor changed during novelty scan"
        )
    if any(exact_parent_multiplicity):
        raise PreparationError(
            "a six-hit-bisector-canary-two-kalmanson suffix clause already occurs in the parent"
        )
    if any(parent_subsumer_count):
        raise PreparationError(
            "a parent clause subsumes a six-hit-bisector-canary-two-kalmanson suffix clause"
        )
    if successor_multiplicity != [1] * len(EXPECTED_CANARY_TWO_KALMANSON_SUFFIX):
        raise PreparationError(
            "six-hit-bisector-canary-two-kalmanson suffix multiplicity is not exactly one"
        )
    if CANARY_ACTIVE_CLAUSE not in observed_suffix:
        raise PreparationError("canary active clause is absent from the suffix")
    return {
        "schema": "p97-exact17-six-hit-bisector-canary-two-kalmanson-parent-novelty/v1",
        "policy": {
            "parent_scan": "stream-all-original-parent-clauses",
            "exact_novelty": "ordered-literal-tuple multiplicity must be zero",
            "subsumption": "parent literal-set subset of suffix literal-set is forbidden",
            "successor_shape": "byte-exact parent body prefix plus exact ordered suffix",
            "child_multiplicity": "each exact suffix tuple occurs once in full successor",
            "canary_witness": "order-zero-reverse clause must occur in suffix",
        },
        "original_parent_clause_count_scanned": ORIGINAL_PARENT_CLAUSES,
        "suffix_clause_count": len(EXPECTED_CANARY_TWO_KALMANSON_SUFFIX),
        "suffix_clauses": [
            list(clause) for clause in EXPECTED_CANARY_TWO_KALMANSON_SUFFIX
        ],
        "exact_parent_multiplicity": exact_parent_multiplicity,
        "parent_subsumer_count": parent_subsumer_count,
        "successor_multiplicity": successor_multiplicity,
        "parent_body_exact_prefix": True,
        "suffix_exact_order": True,
        "canary_active_clause": list(CANARY_ACTIVE_CLAUSE),
        "canary_active_clause_present": True,
    }


def _published_files_equal(left: _PublishedFile, right: _PublishedFile) -> bool:
    left_info = left.verify("left comparison artifact")
    right_info = right.verify("right comparison artifact")
    if left_info.st_size != right_info.st_size:
        return False
    left_fd = os.dup(left.descriptor)
    right_fd = os.dup(right.descriptor)
    try:
        os.lseek(left_fd, 0, os.SEEK_SET)
        os.lseek(right_fd, 0, os.SEEK_SET)
        while True:
            first = os.read(left_fd, 1024 * 1024)
            second = os.read(right_fd, 1024 * 1024)
            if first != second:
                return False
            if not first:
                break
    finally:
        os.close(left_fd)
        os.close(right_fd)
    left.verify("left comparison artifact")
    right.verify("right comparison artifact")
    return True


def _publish_retained_link(source: _PublishedFile, destination: Path) -> _PublishedFile:
    source_info = source.verify("retained publication source")
    destination_parent = _open_directory_nofollow(destination.parent)
    try:
        try:
            os.link(
                source.path.name,
                destination.name,
                src_dir_fd=source.parent_descriptor,
                dst_dir_fd=destination_parent,
                follow_symlinks=False,
            )
        except FileExistsError as error:
            raise PreparationError(
                f"publication target already exists: {destination}"
            ) from error
        named = os.stat(
            destination.name, dir_fd=destination_parent, follow_symlinks=False
        )
        if _inode(named) != _inode(source_info) or named.st_nlink != 2:
            raise PreparationError("retained publication crossed inode custody")
        os.fsync(destination_parent)
        descriptor = os.open(
            destination.name,
            os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0),
            dir_fd=destination_parent,
        )
        return _PublishedFile(
            destination,
            descriptor,
            os.dup(destination_parent),
            _inode(source_info),
        )
    finally:
        os.close(destination_parent)


def _stream_cell_from_parent(
    run_root: Path,
    parent: _PublishedFile,
    output_path: Path,
    center: int,
    category: str,
    parent_metadata: dict[str, Any],
) -> dict[str, Any]:
    directory = output_path.parent
    directory_fd = _ensure_directory_under(run_root, directory)
    candidate = f".{output_path.name}.{secrets.token_hex(16)}.candidate"
    flags = (
        os.O_RDWR
        | os.O_CREAT
        | os.O_EXCL
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    descriptor: int | None = None
    try:
        descriptor = os.open(candidate, flags, 0o600, dir_fd=directory_fd)
        before = parent.verify("cumulative root")
        parent_fd = os.dup(parent.descriptor)
        digest = hashlib.sha256()
        size = 0
        try:
            os.lseek(parent_fd, 0, os.SEEK_SET)
            with os.fdopen(parent_fd, "rb", closefd=True) as source:
                parent_fd = -1
                header = source.readline()
                variables, clauses = _parent_header(header)
                if (variables, clauses) != (
                    parent_metadata["variables"],
                    parent_metadata["clauses"],
                ):
                    raise PreparationError("cumulative-root header changed")
                units = category_units(center, category)
                replacement = f"p cnf {variables} {clauses + len(units)}\n".encode()
                _write_all(descriptor, replacement)
                digest.update(replacement)
                size += len(replacement)
                while True:
                    block = source.read(1024 * 1024)
                    if not block:
                        break
                    _write_all(descriptor, block)
                    digest.update(block)
                    size += len(block)
                suffix = b"".join(f"{unit} 0\n".encode() for unit in units)
                _write_all(descriptor, suffix)
                digest.update(suffix)
                size += len(suffix)
        finally:
            if parent_fd >= 0:
                os.close(parent_fd)
        after = parent.verify("cumulative root")
        if _anchor(before) != _anchor(after):
            raise PreparationError("cumulative root changed during cell creation")
        os.fsync(descriptor)
        candidate_info = os.fstat(descriptor)
        if not stat.S_ISREG(candidate_info.st_mode) or candidate_info.st_nlink != 1:
            raise PreparationError("cell candidate custody failed")
        try:
            os.link(
                candidate,
                output_path.name,
                src_dir_fd=directory_fd,
                dst_dir_fd=directory_fd,
                follow_symlinks=False,
            )
        except FileExistsError as error:
            raise PreparationError(
                f"cell target already exists: {output_path}"
            ) from error
        published = os.stat(
            output_path.name, dir_fd=directory_fd, follow_symlinks=False
        )
        if _inode(published) != _inode(candidate_info) or published.st_nlink != 2:
            raise PreparationError("cell publication crossed inode custody")
        os.unlink(candidate, dir_fd=directory_fd)
        candidate = ""
        os.fsync(directory_fd)
        retained = _PinnedInput.capture(
            output_path, "generated cell", digest.hexdigest()
        )
        return {
            "path": output_path,
            "sha256": digest.hexdigest(),
            "bytes": size,
            "custody": retained,
        }
    finally:
        if descriptor is not None:
            os.close(descriptor)
        if candidate:
            try:
                os.unlink(candidate, dir_fd=directory_fd)
            except FileNotFoundError:
                pass
        os.close(directory_fd)


def _is_full_sha1(value: str) -> bool:
    return len(value) == 40 and all(c in "0123456789abcdef" for c in value)


def _require_exact_keys(value: Any, expected: set[str], label: str) -> dict[str, Any]:
    if not isinstance(value, dict) or set(value) != expected:
        raise PreparationError(f"{label} keys drifted")
    return value


def _require_string(value: Any, label: str) -> str:
    if not isinstance(value, str) or not value:
        raise PreparationError(f"{label} must be a nonempty string")
    return value


def _require_sha256(value: Any, label: str) -> str:
    result = _require_string(value, label)
    if len(result) != 64 or any(
        character not in "0123456789abcdef" for character in result
    ):
        raise PreparationError(f"{label} is not a full SHA-256")
    return result


def _require_positive_int(value: Any, label: str) -> int:
    if type(value) is not int or value <= 0:
        raise PreparationError(f"{label} must be a positive integer")
    return value


def _validate_artifact_pin(value: Any, label: str) -> dict[str, Any]:
    pin = _require_exact_keys(value, {"path", "sha256", "bytes"}, label)
    _require_string(pin["path"], f"{label}.path")
    _require_sha256(pin["sha256"], f"{label}.sha256")
    _require_positive_int(pin["bytes"], f"{label}.bytes")
    return pin


def _validate_production_config_payload(value: Any) -> dict[str, Any]:
    config = _require_exact_keys(
        value,
        {
            "schema",
            "lane_id",
            "base_head",
            "generated_root",
            "source_commit",
            "target_code",
            "support",
        },
        "production config",
    )
    if config["schema"] != PRODUCTION_CONFIG_SCHEMA:
        raise PreparationError("production config schema drifted")
    if config["lane_id"] != LANE_ID or config["base_head"] != BASE_HEAD:
        raise PreparationError("production config lane or base-head drifted")
    _require_string(config["generated_root"], "production config generated_root")
    source_commit = _require_string(
        config["source_commit"], "production config source_commit"
    )
    if not _is_full_sha1(source_commit):
        raise PreparationError("production config source_commit is not full")
    target = _require_exact_keys(
        config["target_code"], {"commit", "preparer", "test"}, "target_code"
    )
    target_commit = _require_string(target["commit"], "target_code.commit")
    if not _is_full_sha1(target_commit):
        raise PreparationError("target_code.commit is not full")
    _validate_artifact_pin(target["preparer"], "target_code.preparer")
    _validate_artifact_pin(target["test"], "target_code.test")
    support = _require_exact_keys(
        config["support"],
        {
            "source",
            "root_source",
            "exporter",
            "original_parent_exporter",
            "delegated_preparer",
            "hardened_preparer",
            "variable_map",
            "checkpoint",
        },
        "support",
    )
    for label in (
        "source",
        "root_source",
        "exporter",
        "original_parent_exporter",
        "variable_map",
    ):
        _validate_artifact_pin(support[label], f"support.{label}")
    for label in ("delegated_preparer", "hardened_preparer"):
        pin = _require_exact_keys(
            support[label], {"path", "sha256", "bytes", "commit"}, f"support.{label}"
        )
        _require_string(pin["path"], f"support.{label}.path")
        _require_sha256(pin["sha256"], f"support.{label}.sha256")
        _require_positive_int(pin["bytes"], f"support.{label}.bytes")
        commit = _require_string(pin["commit"], f"support.{label}.commit")
        if not _is_full_sha1(commit):
            raise PreparationError(f"support.{label}.commit is not full")
    checkpoint = _require_exact_keys(
        support["checkpoint"],
        {"path", "sha256", "bytes", "manifest_sha256"},
        "support.checkpoint",
    )
    _require_string(checkpoint["path"], "support.checkpoint.path")
    _require_sha256(checkpoint["sha256"], "support.checkpoint.sha256")
    _require_positive_int(checkpoint["bytes"], "support.checkpoint.bytes")
    _require_sha256(checkpoint["manifest_sha256"], "support.checkpoint.manifest_sha256")
    return config


def _read_committed_blob(repo_root: Path, commit: str, relative_path: str) -> bytes:
    if not _is_full_sha1(commit):
        raise PreparationError("committed blob pin is not a full commit")
    try:
        kind = subprocess.run(
            ["git", "cat-file", "-t", commit],
            cwd=repo_root,
            check=True,
            capture_output=True,
        )
        blob = subprocess.run(
            ["git", "show", f"{commit}:{relative_path}"],
            cwd=repo_root,
            check=True,
            capture_output=True,
        ).stdout
    except (OSError, subprocess.CalledProcessError) as error:
        raise PreparationError("committed blob is unavailable") from error
    if kind.stdout != b"commit\n":
        raise PreparationError("committed blob pin is not a commit")
    return blob


@dataclass
class _ProductionConfig:
    value: dict[str, Any]
    commit: str
    custody: _PinnedInput

    @property
    def sha256(self) -> str:
        return self.custody.sha256

    @property
    def bytes(self) -> int:
        return self.custody.identity[4]

    def verify(self) -> bytes:
        return self.custody.verify()

    def close(self) -> None:
        self.custody.close()

    def provenance(self, repo_root: Path) -> dict[str, Any]:
        return {
            "schema": PRODUCTION_CONFIG_SCHEMA,
            "path": _repo_relative(repo_root, self.custody.path),
            "commit": self.commit,
            "sha256": self.sha256,
            "bytes": self.bytes,
            "target_code": self.value["target_code"],
        }


def _load_production_config(
    repo_root: Path,
    config_path: Path,
    config_commit: str,
    committed_blob_reader: Any = _read_committed_blob,
) -> _ProductionConfig:
    expected_path = repo_root / PRODUCTION_CONFIG_RELATIVE
    if config_path.resolve(strict=False) != expected_path.resolve(strict=False):
        raise PreparationError("production config path is not the fixed governed path")
    if not _is_full_sha1(config_commit):
        raise PreparationError("production config commit is not full")
    committed = committed_blob_reader(
        repo_root, config_commit, PRODUCTION_CONFIG_RELATIVE.as_posix()
    )
    custody = _PinnedInput.capture(
        config_path, "production config", sha256_bytes(committed)
    )
    try:
        live = custody.verify()
        if live != committed:
            raise PreparationError("production config differs from committed blob")
        try:
            parsed = json.loads(live)
        except (UnicodeDecodeError, json.JSONDecodeError) as error:
            raise PreparationError("production config is not valid JSON") from error
        config = _validate_production_config_payload(parsed)
        if config_commit == config["target_code"]["commit"]:
            raise PreparationError(
                "production config and target code form a self-cycle"
            )
        if live != canonical_json_bytes(config):
            raise PreparationError("production config is not canonical JSON")
        return _ProductionConfig(config, config_commit, custody)
    except BaseException:
        custody.close()
        raise


def _active_production() -> _ProductionConfig:
    config = getattr(_ACTIVE_PRODUCTION, "config", None)
    if not isinstance(config, _ProductionConfig):
        raise PreparationError("authenticated production config is not active")
    config.verify()
    return config


def _run_id_from_generated_root(generated_root: str) -> str:
    candidate = PurePosixPath(generated_root)
    expected_parent = PurePosixPath("scratch", "runs", LANE_ID)
    if generated_root != candidate.as_posix() or candidate.parent != expected_parent:
        raise PreparationError(
            "production generated root must be scratch/runs/<lane_id>/<run_id>"
        )
    run_id = candidate.name
    if STANDARD_ID.fullmatch(run_id) is None:
        raise PreparationError("production run_id has invalid shape")
    return run_id


@contextmanager
def _configured_production(config: _ProductionConfig) -> Iterator[None]:
    config.verify()
    support = config.value["support"]
    generated_root = config.value["generated_root"]
    run_id = _run_id_from_generated_root(generated_root)
    replacements = {
        "RUN_ID": run_id,
        "EXPECTED_SOURCE_SHA256": support["source"]["sha256"],
        "EXPECTED_ROOT_SOURCE_SHA256": support["root_source"]["sha256"],
        "EXPECTED_EXPORTER_SHA256": support["exporter"]["sha256"],
        "EXPECTED_ORIGINAL_PARENT_EXPORTER_SHA256": support["original_parent_exporter"][
            "sha256"
        ],
        "EXPECTED_DELEGATED_PREPARER_SHA256": support["delegated_preparer"]["sha256"],
        "EXPECTED_DELEGATED_PREPARER_BYTES": support["delegated_preparer"]["bytes"],
        "EXPECTED_HARDENED_PREPARER_SHA256": support["hardened_preparer"]["sha256"],
        "EXPECTED_HARDENED_PREPARER_BYTES": support["hardened_preparer"]["bytes"],
        "DELEGATED_PREPARER_COMMIT": support["delegated_preparer"]["commit"],
        "HARDENED_PREPARER_COMMIT": support["hardened_preparer"]["commit"],
        "EXPECTED_VARIABLE_MAP_SHA256": support["variable_map"]["sha256"],
        "EXPECTED_CHECKPOINT_SHA256": support["checkpoint"]["sha256"],
        "EXPECTED_CHECKPOINT_MANIFEST_SHA256": support["checkpoint"]["manifest_sha256"],
        "PINNED_SOURCE_COMMIT": config.value["source_commit"],
        "PRODUCTION_PINS_FINALIZED": True,
        "REGISTERED_GENERATED_ROOT": generated_root,
    }
    names = tuple(replacements)
    previous = {name: globals()[name] for name in names}
    with _CONFIGURATION_LOCK:
        if getattr(_ACTIVE_PRODUCTION, "config", None) is not None:
            raise PreparationError("nested production config is forbidden")
        _ACTIVE_PRODUCTION.config = config
        try:
            globals().update(replacements)
            config.verify()
            yield
        finally:
            globals().update(previous)
            _ACTIVE_PRODUCTION.config = None


def verify_committed_target_blobs(
    repo_root: Path,
    config: _ProductionConfig,
    preparer_path: Path,
    test_path: Path,
    committed_blob_reader: Any = _read_committed_blob,
) -> None:
    target = config.value["target_code"]
    for role, path in (("preparer", preparer_path), ("test", test_path)):
        pin = target[role]
        relative = _repo_relative(repo_root, path)
        if pin["path"] != relative:
            raise PreparationError(f"target {role} path drifted")
        blob = committed_blob_reader(repo_root, target["commit"], relative)
        if len(blob) != pin["bytes"] or sha256_bytes(blob) != pin["sha256"]:
            raise PreparationError(f"target {role} committed blob drifted")


def verify_committed_dependency_blobs(
    repo_root: Path,
    delegated_preparer_path: Path,
    hardened_preparer_path: Path,
) -> None:
    """Authenticate both delegated Python blobs at their full commit pins."""
    specifications = (
        (
            delegated_preparer_path,
            DELEGATED_PREPARER_COMMIT,
            EXPECTED_DELEGATED_PREPARER_SHA256,
            EXPECTED_DELEGATED_PREPARER_BYTES,
        ),
        (
            hardened_preparer_path,
            HARDENED_PREPARER_COMMIT,
            EXPECTED_HARDENED_PREPARER_SHA256,
            EXPECTED_HARDENED_PREPARER_BYTES,
        ),
    )
    for path, commit, expected_sha256, expected_bytes in specifications:
        if not _is_full_sha1(commit):
            raise PreparationError("delegated dependency commit pin is provisional")
        try:
            relative = path.resolve(strict=True).relative_to(repo_root)
        except ValueError as error:
            raise PreparationError("delegated dependency escapes repository") from error
        try:
            kind = subprocess.run(
                ["git", "cat-file", "-t", commit],
                cwd=repo_root,
                check=True,
                capture_output=True,
            )
            blob = subprocess.run(
                ["git", "show", f"{commit}:{relative.as_posix()}"],
                cwd=repo_root,
                check=True,
                capture_output=True,
            ).stdout
        except (OSError, subprocess.CalledProcessError) as error:
            raise PreparationError(
                "delegated dependency commit blob unavailable"
            ) from error
        if kind.stdout != b"commit\n":
            raise PreparationError("delegated dependency pin is not a commit")
        if len(blob) != expected_bytes or sha256_bytes(blob) != expected_sha256:
            raise PreparationError("delegated dependency committed blob drifted")


def _require_production_configuration(
    repo_root: Path, output_root: Path, source_commit: str | None = None
) -> None:
    if not PRODUCTION_PINS_FINALIZED:
        raise PreparationError("production pins are provisional")
    if len(EXPECTED_CANARY_TWO_KALMANSON_SUFFIX) != 32:
        raise PreparationError(
            "six-hit-bisector-canary-two-kalmanson suffix cardinality drifted"
        )
    if any(
        not clause or len(set(clause)) != len(clause)
        for clause in EXPECTED_CANARY_TWO_KALMANSON_SUFFIX
    ):
        raise PreparationError(
            "six-hit-bisector-canary-two-kalmanson suffix repeats a literal"
        )
    if PARENT_CLAUSES != ORIGINAL_PARENT_CLAUSES + len(
        EXPECTED_CANARY_TWO_KALMANSON_SUFFIX
    ):
        raise PreparationError("successor root clause count is not parent plus suffix")
    if CELL_CLAUSES != PARENT_CLAUSES + 6:
        raise PreparationError("physical cell clause count is not root plus six units")
    if CANARY_ACTIVE_CLAUSE not in EXPECTED_CANARY_TWO_KALMANSON_SUFFIX:
        raise PreparationError("canary active clause is outside the suffix inventory")
    if not _is_full_sha1(PINNED_SOURCE_COMMIT):
        raise PreparationError("production source commit pin is provisional")
    if source_commit is not None and source_commit != PINNED_SOURCE_COMMIT:
        raise PreparationError(
            "requested source commit differs from the production pin"
        )
    if not REGISTERED_GENERATED_ROOT:
        raise PreparationError("production generated root is not registered")
    expected = (repo_root / REGISTERED_GENERATED_ROOT).resolve(strict=False)
    if output_root.resolve(strict=False) != expected:
        raise PreparationError("output root differs from the registered generated root")


def _validate_checkpoint(
    checkpoint: dict[str, Any],
    required_paths: set[str],
    required_durable_paths: set[str],
    generated_root: str,
) -> None:
    payload = dict(checkpoint)
    claimed_manifest = payload.pop("manifest_sha256", None)
    computed_manifest = sha256_bytes(canonical_json_bytes(payload))
    if (
        claimed_manifest != EXPECTED_CHECKPOINT_MANIFEST_SHA256
        or computed_manifest != EXPECTED_CHECKPOINT_MANIFEST_SHA256
    ):
        raise PreparationError("checkpoint self-hash drifted")
    if checkpoint.get("schema") != "worktree-lane-checkpoint/v1":
        raise PreparationError("checkpoint schema drifted")
    if checkpoint.get("lane_id") != LANE_ID or checkpoint.get("base_head") != BASE_HEAD:
        raise PreparationError("checkpoint lane or base-head drifted")
    owned = checkpoint.get("owned_paths")
    if not isinstance(owned, list) or not required_paths <= set(owned):
        raise PreparationError("checkpoint ownership does not cover the preparer")
    durable = checkpoint.get("durable_paths")
    if not isinstance(durable, list) or not required_durable_paths <= set(durable):
        raise PreparationError("checkpoint durability does not cover dependencies")
    generated = checkpoint.get("generated_roots")
    if not isinstance(generated, list) or generated_root not in generated:
        raise PreparationError("checkpoint does not register the output root")


def _support_files(
    *,
    source_path: Path,
    root_source_path: Path,
    exporter_path: Path,
    original_parent_exporter_path: Path,
    delegated_preparer_path: Path,
    hardened_preparer_path: Path,
    variable_map_path: Path,
    checkpoint_path: Path,
    preparer_path: Path,
    test_path: Path,
) -> dict[str, tuple[Path, str]]:
    production = _active_production()
    target = production.value["target_code"]
    return {
        "source": (source_path, EXPECTED_SOURCE_SHA256),
        "root_source": (root_source_path, EXPECTED_ROOT_SOURCE_SHA256),
        "exporter": (exporter_path, EXPECTED_EXPORTER_SHA256),
        "original_parent_exporter": (
            original_parent_exporter_path,
            EXPECTED_ORIGINAL_PARENT_EXPORTER_SHA256,
        ),
        "delegated_preparer": (
            delegated_preparer_path,
            EXPECTED_DELEGATED_PREPARER_SHA256,
        ),
        "hardened_preparer": (
            hardened_preparer_path,
            EXPECTED_HARDENED_PREPARER_SHA256,
        ),
        "variable_map": (variable_map_path, EXPECTED_VARIABLE_MAP_SHA256),
        "checkpoint": (checkpoint_path, EXPECTED_CHECKPOINT_SHA256),
        "preparer": (preparer_path, target["preparer"]["sha256"]),
        "test": (test_path, target["test"]["sha256"]),
        "production_config": (production.custody.path, production.sha256),
    }


def _validate_support(
    *,
    repo_root: Path,
    source_path: Path,
    root_source_path: Path,
    exporter_path: Path,
    original_parent_exporter_path: Path,
    delegated_preparer_path: Path,
    hardened_preparer_path: Path,
    variable_map_path: Path,
    checkpoint_path: Path,
    preparer_path: Path,
    test_path: Path,
    output_root: Path,
) -> dict[str, str]:
    production = _active_production()
    target = production.value["target_code"]
    support = production.value["support"]
    files = _support_files(
        source_path=source_path,
        root_source_path=root_source_path,
        exporter_path=exporter_path,
        original_parent_exporter_path=original_parent_exporter_path,
        delegated_preparer_path=delegated_preparer_path,
        hardened_preparer_path=hardened_preparer_path,
        variable_map_path=variable_map_path,
        checkpoint_path=checkpoint_path,
        preparer_path=preparer_path,
        test_path=test_path,
    )
    active = _active_support()
    temporary: _SupportCustody | None = None
    if active is None:
        temporary = _SupportCustody.capture(files)
        active = temporary
    try:
        if set(active.entries) != set(files):
            raise PreparationError("retained support set drifted")
        active.verify()
        _verify_delegated_dependency_custody()
        digests = {label: entry.sha256 for label, entry in active.entries.items()}
        checkpoint_payload = active.entries["checkpoint"].verify()
    finally:
        if temporary is not None:
            temporary.close()
    expected_paths = {
        "source": source_path,
        "root_source": root_source_path,
        "exporter": exporter_path,
        "original_parent_exporter": original_parent_exporter_path,
        "delegated_preparer": delegated_preparer_path,
        "hardened_preparer": hardened_preparer_path,
        "variable_map": variable_map_path,
        "checkpoint": checkpoint_path,
    }
    for label, path in expected_paths.items():
        pin = support[label]
        entry = active.entries[label]
        if pin["path"] != _repo_relative(repo_root, path):
            raise PreparationError(f"support.{label}.path drifted")
        if pin["bytes"] != entry.identity[4]:
            raise PreparationError(f"support.{label}.bytes drifted")
    for label, path in (("preparer", preparer_path), ("test", test_path)):
        pin = target[label]
        entry = active.entries[label]
        if pin["path"] != _repo_relative(repo_root, path):
            raise PreparationError(f"target_code.{label}.path drifted")
        if pin["bytes"] != entry.identity[4]:
            raise PreparationError(f"target_code.{label}.bytes drifted")
    preparer_relative = _repo_relative(repo_root, preparer_path)
    test_relative = _repo_relative(repo_root, test_path)
    try:
        checkpoint = json.loads(checkpoint_payload)
    except (UnicodeDecodeError, json.JSONDecodeError) as error:
        raise PreparationError("lane checkpoint is not valid JSON") from error
    if not isinstance(checkpoint, dict):
        raise PreparationError("lane checkpoint must be a JSON object")
    _validate_checkpoint(
        checkpoint,
        {
            preparer_relative,
            test_relative,
            PRODUCTION_CONFIG_RELATIVE.as_posix(),
        },
        {
            _repo_relative(repo_root, delegated_preparer_path),
            _repo_relative(repo_root, hardened_preparer_path),
        },
        _repo_relative(repo_root, output_root),
    )
    return digests


def _claims() -> dict[str, bool]:
    return _delegated_call(accepted._claims)


def _source_claims() -> dict[str, bool]:
    return _delegated_call(accepted._source_claims)


def build_delegated_dependency_manifest(
    repo_root: Path,
    delegated_preparer_path: Path,
    hardened_preparer_path: Path,
    digests: dict[str, str],
) -> dict[str, Any]:
    return {
        "schema": "p97-delegated-python-dependencies/v1",
        "custody_policy": (
            "retained nofollow descriptors; pre/post rehash around delegated phases"
        ),
        "dependencies": [
            {
                "role": "four-row physical-slice preparer",
                "path": _repo_relative(repo_root, delegated_preparer_path),
                "sha256": digests["delegated_preparer"],
                "bytes": EXPECTED_DELEGATED_PREPARER_BYTES,
                "commit": DELEGATED_PREPARER_COMMIT,
            },
            {
                "role": "hardened sparse-six physical-slice preparer",
                "path": _repo_relative(repo_root, hardened_preparer_path),
                "sha256": digests["hardened_preparer"],
                "bytes": EXPECTED_HARDENED_PREPARER_BYTES,
                "commit": HARDENED_PREPARER_COMMIT,
            },
        ],
    }


def build_production_config_manifest(repo_root: Path) -> dict[str, Any]:
    return _active_production().provenance(repo_root)


def build_producer(
    center: int,
    category: str,
    source_path: str,
    source_sha256: str,
    root_source_path: str,
    root_source_sha256: str,
    exporter_path: str,
    exporter_sha256: str,
    original_parent_exporter_path: str,
    original_parent_exporter_sha256: str,
    variable_map_sha256: str,
    parent_root_sha256: str,
    parent_producer_sha256: str,
    parent_novelty: dict[str, Any],
    delegated_dependencies: dict[str, Any],
    production_config: dict[str, Any],
) -> bytes:
    source = {
        "cardinality_scope": f"exactly 17 models in {category_id(center, category)}",
        "claims": _source_claims(),
        "finite_schema": FINITE_SCHEMA,
        "schema": SOURCE_SCHEMA,
        "source_id": category_id(center, category),
        "source_path": source_path,
        "source_sha256": source_sha256,
        "root_source_path": root_source_path,
        "root_source_sha256": root_source_sha256,
        "source_theorem": SOURCE_THEOREM,
        "delegated_dependencies": delegated_dependencies,
        "delegated_dependencies_sha256": sha256_bytes(
            canonical_json_bytes(delegated_dependencies)
        ),
        "production_config": production_config,
        "production_config_sha256": sha256_bytes(
            canonical_json_bytes(production_config)
        ),
    }
    return canonical_json_bytes(
        {
            "backend": "cadical",
            "claims": _claims(),
            "exporter_path": exporter_path,
            "exporter_sha256": exporter_sha256,
            "original_parent_exporter_path": original_parent_exporter_path,
            "original_parent_exporter_sha256": original_parent_exporter_sha256,
            "parent_producer_sha256": parent_producer_sha256,
            "parent_root_sha256": parent_root_sha256,
            "parent_novelty": parent_novelty,
            "parent_novelty_sha256": sha256_bytes(canonical_json_bytes(parent_novelty)),
            "delegated_dependencies": delegated_dependencies,
            "delegated_dependencies_sha256": sha256_bytes(
                canonical_json_bytes(delegated_dependencies)
            ),
            "production_config": production_config,
            "production_config_sha256": sha256_bytes(
                canonical_json_bytes(production_config)
            ),
            "producer_id": f"{category_id(center, category)}-{RUN_ID}",
            "producer_kind": "lean-exported-static-dimacs",
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
            "schema": PRODUCER_SCHEMA,
            "solver_profile": "unsat",
            "source_manifest": source,
            "source_manifest_sha256": sha256_bytes(canonical_json_bytes(source)),
            "variable_map_sha256": variable_map_sha256,
        }
    )


def build_root_producer(**kwargs: Any) -> bytes:
    return canonical_json_bytes(
        {
            "schema": ROOT_PRODUCER_SCHEMA,
            "run_id": RUN_ID,
            "producer_kind": "lean-exported-static-dimacs-root",
            "claims": {
                "exact17_closed": False,
                "proof_verified": False,
                "source_entitlement": False,
                "theorem_coverage": False,
                "lean_closure": False,
            },
            "root": {
                "sha256": kwargs["root_sha256"],
                "bytes": kwargs["root_bytes"],
                "variables": PARENT_VARIABLES,
                "clauses": PARENT_CLAUSES,
            },
            "source_path": kwargs["source_path"],
            "source_sha256": kwargs["source_sha256"],
            "root_source_path": kwargs["root_source_path"],
            "root_source_sha256": kwargs["root_source_sha256"],
            "exporter_path": kwargs["exporter_path"],
            "exporter_sha256": kwargs["exporter_sha256"],
            "original_parent_exporter_path": kwargs["original_parent_exporter_path"],
            "original_parent_exporter_sha256": kwargs[
                "original_parent_exporter_sha256"
            ],
            "parent_novelty": kwargs["parent_novelty"],
            "parent_novelty_sha256": sha256_bytes(
                canonical_json_bytes(kwargs["parent_novelty"])
            ),
            "delegated_dependencies": kwargs["delegated_dependencies"],
            "delegated_dependencies_sha256": sha256_bytes(
                canonical_json_bytes(kwargs["delegated_dependencies"])
            ),
            "production_config": kwargs["production_config"],
            "production_config_sha256": sha256_bytes(
                canonical_json_bytes(kwargs["production_config"])
            ),
            "checkpoint_path": kwargs["checkpoint_path"],
            "checkpoint_sha256": kwargs["checkpoint_sha256"],
            "variable_map_sha256": kwargs["variable_map_sha256"],
            "source_commit": kwargs["source_commit"],
        }
    )


def build_wave(
    center: int,
    category: str,
    cnf_sha256: str,
    producer_sha256: str,
    shard: int,
    source_sha256: str,
    variable_map_sha256: str,
) -> bytes:
    wave = {
        "schema": WAVE_SCHEMA,
        "wave_id": f"{category_id(center, category)}-{RUN_ID}",
        "iteration": 0,
        "parent_checkpoint_sha256": EXPECTED_CHECKPOINT_SHA256,
        "source": {
            "live_leaf": "Problem97.ATailFrontierLiveClosure.card_eq_seventeen_secondCapNine",
            "ingress_hypotheses_sha256": source_sha256,
            "finite_schema": FINITE_SCHEMA,
            "cardinality_scope": f"exactly 17 models in {category_id(center, category)}",
            "source_theorem": SOURCE_THEOREM,
        },
        "encoding": {
            "cnf_sha256": cnf_sha256,
            "variable_map_sha256": variable_map_sha256,
            "producer_manifest_sha256": producer_sha256,
            "num_variables": PARENT_VARIABLES,
            "num_clauses": CELL_CLAUSES,
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "unsat",
            "shard_id": shard,
            "shard_count": CELL_COUNT,
            "order_sha256": ORDER_SHA256,
            "seed": 97,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    validate_wave_manifest(wave)
    return canonical_json_bytes(wave)


def build_run_manifest(
    repo_root: Path,
    output_root: Path,
    digests: dict[str, str],
    *,
    source_path: Path,
    root_source_path: Path,
    exporter_path: Path,
    original_parent_exporter_path: Path,
    delegated_preparer_path: Path,
    hardened_preparer_path: Path,
    variable_map_path: Path,
    checkpoint_path: Path,
    preparer_path: Path,
    test_path: Path,
) -> bytes:
    source_digests = {
        _repo_relative(repo_root, source_path): digests["source"],
        _repo_relative(repo_root, root_source_path): digests["root_source"],
        _repo_relative(repo_root, exporter_path): digests["exporter"],
        _repo_relative(repo_root, original_parent_exporter_path): digests[
            "original_parent_exporter"
        ],
        _repo_relative(repo_root, delegated_preparer_path): digests[
            "delegated_preparer"
        ],
        _repo_relative(repo_root, hardened_preparer_path): digests["hardened_preparer"],
        _repo_relative(repo_root, checkpoint_path): digests["checkpoint"],
        _repo_relative(repo_root, preparer_path): digests["preparer"],
        _repo_relative(repo_root, test_path): digests["test"],
        PRODUCTION_CONFIG_RELATIVE.as_posix(): digests["production_config"],
    }
    run = {
        "schema": "worktree-run-manifest/v1",
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": _repo_relative(repo_root, output_root),
        "owner": RUN_OWNER,
        "base_head": BASE_HEAD,
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": source_digests,
        "input_digests": {
            _repo_relative(repo_root, variable_map_path): digests["variable_map"]
        },
        "created_utc": "2026-08-21T00:00:00Z",
    }
    run["manifest_sha256"] = sha256_bytes(canonical_json_bytes(run))
    return canonical_json_bytes(run)


def _validate_governed_skeleton(output: Path, manifest: bytes) -> None:
    root_fd = _open_directory_nofollow(output)
    try:
        if set(os.listdir(root_fd)) != {
            "artifacts",
            "events",
            "tmp",
            "run_manifest.json",
        }:
            raise PreparationError("governed run skeleton is not exact")
        for name in ("artifacts", "events", "tmp"):
            descriptor = os.open(
                name,
                os.O_RDONLY
                | getattr(os, "O_CLOEXEC", 0)
                | getattr(os, "O_DIRECTORY", 0)
                | getattr(os, "O_NOFOLLOW", 0),
                dir_fd=root_fd,
            )
            try:
                if os.listdir(descriptor):
                    raise PreparationError(f"governed {name} directory is not empty")
            finally:
                os.close(descriptor)
        if (
            _secure_read_named(output / "run_manifest.json", "governed run manifest")
            != manifest
        ):
            raise PreparationError("governed run manifest differs")
    finally:
        os.close(root_fd)


def _initialize_governed_skeleton(output: Path, manifest: bytes) -> None:
    parent = _open_directory_nofollow(output.parent)
    created_identity: tuple[int, int] | None = None
    root_fd: int | None = None
    try:
        try:
            os.mkdir(output.name, 0o700, dir_fd=parent)
        except FileExistsError as error:
            raise PreparationError("governed run root already exists") from error
        root_fd = os.open(
            output.name,
            os.O_RDONLY
            | getattr(os, "O_CLOEXEC", 0)
            | getattr(os, "O_DIRECTORY", 0)
            | getattr(os, "O_NOFOLLOW", 0),
            dir_fd=parent,
        )
        created_identity = _inode(os.fstat(root_fd))
        named = os.stat(output.name, dir_fd=parent, follow_symlinks=False)
        if _inode(named) != created_identity:
            raise PreparationError("governed run root crossed inode custody")
        for name in ("artifacts", "events", "tmp"):
            os.mkdir(name, 0o700, dir_fd=root_fd)
        descriptor = os.open(
            "run_manifest.json",
            os.O_WRONLY
            | os.O_CREAT
            | os.O_EXCL
            | getattr(os, "O_CLOEXEC", 0)
            | getattr(os, "O_NOFOLLOW", 0),
            0o600,
            dir_fd=root_fd,
        )
        try:
            _write_all(descriptor, manifest)
            os.fsync(descriptor)
        finally:
            os.close(descriptor)
        os.fsync(root_fd)
        os.fsync(parent)
    except BaseException:
        if root_fd is not None and created_identity is not None:
            try:
                named = os.stat(output.name, dir_fd=parent, follow_symlinks=False)
                if _inode(named) == created_identity:
                    for name in ("run_manifest.json", "artifacts", "events", "tmp"):
                        try:
                            if name == "run_manifest.json":
                                os.unlink(name, dir_fd=root_fd)
                            else:
                                os.rmdir(name, dir_fd=root_fd)
                        except FileNotFoundError:
                            pass
                    os.rmdir(output.name, dir_fd=parent)
            except OSError:
                pass
        raise
    finally:
        if root_fd is not None:
            os.close(root_fd)
        os.close(parent)


@contextmanager
def _production_session(
    repo_root: Path,
    production_config_path: Path,
    production_config_commit: str,
    config_blob_reader: Any,
) -> Iterator[_ProductionConfig]:
    config = _load_production_config(
        repo_root,
        production_config_path,
        production_config_commit,
        config_blob_reader,
    )
    try:
        with _configured_production(config):
            yield config
    finally:
        config.close()


def _preflight_authenticated(
    *,
    repo_root: Path,
    output_root: Path,
    source_path: Path,
    root_source_path: Path,
    exporter_path: Path,
    original_parent_exporter_path: Path,
    delegated_preparer_path: Path,
    hardened_preparer_path: Path,
    variable_map_path: Path,
    checkpoint_path: Path,
    preparer_path: Path,
    test_path: Path,
    commit_verifier: Any,
    dependency_commit_verifier: Any,
    target_commit_verifier: Any,
) -> dict[str, Any]:
    root = repo_root.resolve(strict=True)
    _require_production_configuration(root, output_root, PINNED_SOURCE_COMMIT)
    support_files = _support_files(
        source_path=source_path,
        root_source_path=root_source_path,
        exporter_path=exporter_path,
        original_parent_exporter_path=original_parent_exporter_path,
        delegated_preparer_path=delegated_preparer_path,
        hardened_preparer_path=hardened_preparer_path,
        variable_map_path=variable_map_path,
        checkpoint_path=checkpoint_path,
        preparer_path=preparer_path,
        test_path=test_path,
    )
    with _retained_support(support_files) as custody:
        digests = _validate_support(
            repo_root=root,
            source_path=source_path,
            root_source_path=root_source_path,
            exporter_path=exporter_path,
            original_parent_exporter_path=original_parent_exporter_path,
            delegated_preparer_path=delegated_preparer_path,
            hardened_preparer_path=hardened_preparer_path,
            variable_map_path=variable_map_path,
            checkpoint_path=checkpoint_path,
            preparer_path=preparer_path,
            test_path=test_path,
            output_root=output_root.resolve(strict=False),
        )
        custody.verify()
        commit_verifier(
            root,
            PINNED_SOURCE_COMMIT,
            (
                source_path,
                root_source_path,
                exporter_path,
                original_parent_exporter_path,
                delegated_preparer_path,
                hardened_preparer_path,
            ),
        )
        custody.verify()
        dependency_commit_verifier(
            root, delegated_preparer_path, hardened_preparer_path
        )
        custody.verify()
        target_commit_verifier(root, _active_production(), preparer_path, test_path)
        custody.verify()
        return {
            "status": "PRODUCTION_PREFLIGHT_OK",
            "run_id": RUN_ID,
            "source_commit": PINNED_SOURCE_COMMIT,
            "production_config": build_production_config_manifest(root),
            "support_sha256": digests,
        }


def _initialize_run_root_authenticated(
    *,
    output_root: Path,
    repo_root: Path = ROOT,
    source_path: Path = SOURCE_PATH,
    root_source_path: Path = ROOT_SOURCE_PATH,
    exporter_path: Path = EXPORTER_PATH,
    original_parent_exporter_path: Path = ORIGINAL_PARENT_EXPORTER_PATH,
    delegated_preparer_path: Path = DELEGATED_PREPARER_PATH,
    hardened_preparer_path: Path = HARDENED_PREPARER_PATH,
    variable_map_path: Path = VARIABLE_MAP_PATH,
    checkpoint_path: Path = CHECKPOINT_PATH,
    preparer_path: Path = PREPARER_PATH,
    test_path: Path = TEST_PATH,
) -> dict[str, Any]:
    root = repo_root.resolve(strict=True)
    _require_production_configuration(root, output_root)
    output = output_root.resolve(strict=False)
    digests = _validate_support(
        repo_root=root,
        source_path=source_path,
        root_source_path=root_source_path,
        exporter_path=exporter_path,
        original_parent_exporter_path=original_parent_exporter_path,
        delegated_preparer_path=delegated_preparer_path,
        hardened_preparer_path=hardened_preparer_path,
        variable_map_path=variable_map_path,
        checkpoint_path=checkpoint_path,
        preparer_path=preparer_path,
        test_path=test_path,
        output_root=output,
    )
    manifest = build_run_manifest(
        root,
        output,
        digests,
        source_path=source_path,
        root_source_path=root_source_path,
        exporter_path=exporter_path,
        original_parent_exporter_path=original_parent_exporter_path,
        delegated_preparer_path=delegated_preparer_path,
        hardened_preparer_path=hardened_preparer_path,
        variable_map_path=variable_map_path,
        checkpoint_path=checkpoint_path,
        preparer_path=preparer_path,
        test_path=test_path,
    )
    try:
        _validate_governed_skeleton(output, manifest)
        return {
            "status": "RUN_ROOT_ALREADY_INITIALIZED",
            "run_manifest": json.loads(manifest),
        }
    except FileNotFoundError:
        pass
    _initialize_governed_skeleton(output, manifest)
    _validate_governed_skeleton(output, manifest)
    return {"status": "RUN_ROOT_INITIALIZED", "run_manifest": json.loads(manifest)}


def _prepare_campaign_authenticated(
    *,
    source_commit: str,
    output_root: Path,
    repo_root: Path = ROOT,
    source_path: Path = SOURCE_PATH,
    root_source_path: Path = ROOT_SOURCE_PATH,
    exporter_path: Path = EXPORTER_PATH,
    original_parent_exporter_path: Path = ORIGINAL_PARENT_EXPORTER_PATH,
    delegated_preparer_path: Path = DELEGATED_PREPARER_PATH,
    hardened_preparer_path: Path = HARDENED_PREPARER_PATH,
    variable_map_path: Path = VARIABLE_MAP_PATH,
    checkpoint_path: Path = CHECKPOINT_PATH,
    preparer_path: Path = PREPARER_PATH,
    test_path: Path = TEST_PATH,
    lean_root_exporter: Any = run_lean_root_export,
    lean_exporter: Any = run_lean_export,
    commit_verifier: Any = accepted.verify_committed_support,
    dependency_commit_verifier: Any = verify_committed_dependency_blobs,
    target_commit_verifier: Any = verify_committed_target_blobs,
) -> dict[str, Any]:
    root = repo_root.resolve(strict=True)
    _require_production_configuration(root, output_root, source_commit)
    output = output_root.resolve(strict=False)
    support_files = _support_files(
        source_path=source_path,
        root_source_path=root_source_path,
        exporter_path=exporter_path,
        original_parent_exporter_path=original_parent_exporter_path,
        delegated_preparer_path=delegated_preparer_path,
        hardened_preparer_path=hardened_preparer_path,
        variable_map_path=variable_map_path,
        checkpoint_path=checkpoint_path,
        preparer_path=preparer_path,
        test_path=test_path,
    )
    with _retained_support(support_files) as custody:
        digests = _validate_support(
            repo_root=root,
            source_path=source_path,
            root_source_path=root_source_path,
            exporter_path=exporter_path,
            original_parent_exporter_path=original_parent_exporter_path,
            delegated_preparer_path=delegated_preparer_path,
            hardened_preparer_path=hardened_preparer_path,
            variable_map_path=variable_map_path,
            checkpoint_path=checkpoint_path,
            preparer_path=preparer_path,
            test_path=test_path,
            output_root=output,
        )
        delegated_dependencies = build_delegated_dependency_manifest(
            root, delegated_preparer_path, hardened_preparer_path, digests
        )
        production_config = build_production_config_manifest(root)
        run_manifest = build_run_manifest(
            root,
            output,
            digests,
            source_path=source_path,
            root_source_path=root_source_path,
            exporter_path=exporter_path,
            original_parent_exporter_path=original_parent_exporter_path,
            delegated_preparer_path=delegated_preparer_path,
            hardened_preparer_path=hardened_preparer_path,
            variable_map_path=variable_map_path,
            checkpoint_path=checkpoint_path,
            preparer_path=preparer_path,
            test_path=test_path,
        )
        try:
            _validate_governed_skeleton(output, run_manifest)
        except FileNotFoundError as error:
            raise PreparationError("governed run root is unavailable") from error
        _verify_delegated_dependency_custody()
        try:
            commit_verifier(
                root,
                source_commit,
                (
                    source_path,
                    root_source_path,
                    exporter_path,
                    original_parent_exporter_path,
                    delegated_preparer_path,
                    hardened_preparer_path,
                ),
            )
        finally:
            _verify_delegated_dependency_custody()
        try:
            dependency_commit_verifier(
                root, delegated_preparer_path, hardened_preparer_path
            )
        finally:
            _verify_delegated_dependency_custody()
        custody.verify()
        try:
            target_commit_verifier(root, _active_production(), preparer_path, test_path)
        finally:
            custody.verify()

        parent_root_path = output / "artifacts" / "cumulative-root.cnf"
        original_candidate_path = output / "tmp" / "original-four-row-parent.lean.cnf"
        root_candidate_path = output / "tmp" / "cumulative-root.lean.cnf"
        custody.verify()
        original_result = lean_root_exporter(
            root, original_parent_exporter_path, original_candidate_path
        )
        custody.verify()
        original_candidate = _capture_export_result(
            original_result,
            original_candidate_path,
            "immediate SixHitBisector parent export",
        )
        original_parent = _inspect_published_cnf(
            original_candidate,
            label="immediate SixHitBisector parent export",
            expected_variables=PARENT_VARIABLES,
            expected_clauses=ORIGINAL_PARENT_CLAUSES,
        )
        root_result = lean_root_exporter(root, exporter_path, root_candidate_path)
        custody.verify()
        root_candidate = _capture_export_result(
            root_result, root_candidate_path, "Lean cumulative-root export"
        )
        parent_root: _PublishedFile | None = None
        try:
            parent = _inspect_published_cnf(
                root_candidate,
                label="Lean cumulative-root export",
                expected_variables=PARENT_VARIABLES,
                expected_clauses=PARENT_CLAUSES,
            )
            parent_novelty = (
                validate_six_hit_bisector_canary_two_kalmanson_parent_novelty(
                    original_candidate, root_candidate
                )
            )
            parent_novelty.update(
                {
                    "original_parent_sha256": original_parent["sha256"],
                    "original_parent_bytes": original_parent["bytes"],
                    "successor_root_sha256": parent["sha256"],
                    "successor_root_bytes": parent["bytes"],
                }
            )
            original_candidate.unlink(
                "immediate SixHitBisector parent temporary export"
            )
            parent_root = _publish_retained_link(root_candidate, parent_root_path)
            root_candidate.unlink(
                "Lean cumulative-root temporary link", expected_nlink=2
            )
            parent_root.verify("published cumulative root")
        finally:
            original_candidate.close()
            root_candidate.close()
        if parent_root is None:
            raise PreparationError("cumulative root publication failed")
        cell_custodies: list[_PinnedInput] = []
        try:
            root_producer = build_root_producer(
                root_sha256=parent["sha256"],
                root_bytes=parent["bytes"],
                source_path=_repo_relative(root, source_path),
                source_sha256=digests["source"],
                root_source_path=_repo_relative(root, root_source_path),
                root_source_sha256=digests["root_source"],
                exporter_path=_repo_relative(root, exporter_path),
                exporter_sha256=digests["exporter"],
                original_parent_exporter_path=_repo_relative(
                    root, original_parent_exporter_path
                ),
                original_parent_exporter_sha256=digests["original_parent_exporter"],
                parent_novelty=parent_novelty,
                delegated_dependencies=delegated_dependencies,
                production_config=production_config,
                checkpoint_path=_repo_relative(root, checkpoint_path),
                checkpoint_sha256=digests["checkpoint"],
                variable_map_sha256=digests["variable_map"],
                source_commit=source_commit,
            )
            root_producer_path = output / "artifacts" / "root-producer-manifest.json"
            _secure_write_once(root_producer_path, root_producer)
            root_producer_sha256 = sha256_bytes(root_producer)
            cells_root_fd = _ensure_directory_under(
                output, output / "artifacts" / "cells"
            )
            os.close(cells_root_fd)
            cells: list[dict[str, Any]] = []
            direct_validated: list[str] = []
            shard = 0
            for center in LEGAL_CENTERS:
                categories = _delegated_call(
                    accepted.hardened._physical_categories, center
                )
                for category in categories:
                    identifier = category_id(center, category)
                    directory = output / "artifacts" / "cells" / identifier
                    directory_fd = _ensure_directory_under(output, directory)
                    os.close(directory_fd)
                    cnf_path = directory / f"{identifier}.cnf"
                    cnf = _stream_cell_from_parent(
                        output,
                        parent_root,
                        cnf_path,
                        center,
                        category,
                        parent,
                    )
                    cell_custody = cnf["custody"]
                    if not isinstance(cell_custody, _PinnedInput):
                        raise PreparationError("generated cell custody is absent")
                    cell_custodies.append(cell_custody)
                    is_direct_sentinel = (center, category) in DIRECT_SENTINELS
                    if is_direct_sentinel:
                        direct_path = output / "tmp" / f"{identifier}.lean.cnf"
                        custody.verify()
                        direct_result = lean_exporter(
                            root, exporter_path, center, category, direct_path
                        )
                        custody.verify()
                        direct = _capture_export_result(
                            direct_result, direct_path, "direct Lean cell export"
                        )
                        try:
                            _inspect_published_cnf(
                                direct,
                                label="direct Lean cell export",
                                expected_variables=PARENT_VARIABLES,
                                expected_clauses=CELL_CLAUSES,
                                expected_sha256=cnf["sha256"],
                                expected_bytes=cnf["bytes"],
                            )
                            generated_cell = _PublishedFile(
                                cell_custody.path,
                                os.dup(cell_custody.descriptor),
                                os.dup(cell_custody.parent_descriptor),
                                _inode(os.fstat(cell_custody.descriptor)),
                            )
                            try:
                                if not _published_files_equal(direct, generated_cell):
                                    raise PreparationError(
                                        "direct Lean cell bytes differ"
                                    )
                            finally:
                                generated_cell.close()
                            direct_validated.append(identifier)
                            direct.unlink("direct Lean cell export")
                        finally:
                            direct.close()
                    producer = build_producer(
                        center,
                        category,
                        _repo_relative(root, source_path),
                        digests["source"],
                        _repo_relative(root, root_source_path),
                        digests["root_source"],
                        _repo_relative(root, exporter_path),
                        digests["exporter"],
                        _repo_relative(root, original_parent_exporter_path),
                        digests["original_parent_exporter"],
                        digests["variable_map"],
                        parent["sha256"],
                        root_producer_sha256,
                        parent_novelty,
                        delegated_dependencies,
                        production_config,
                    )
                    producer_path = directory / "producer-manifest.json"
                    _secure_write_once(producer_path, producer)
                    wave = build_wave(
                        center,
                        category,
                        cnf["sha256"],
                        sha256_bytes(producer),
                        shard,
                        digests["source"],
                        digests["variable_map"],
                    )
                    wave_path = directory / "wave-manifest.json"
                    _secure_write_once(wave_path, wave)
                    cell_custody.verify()
                    cnf_ref = _delegated_call(
                        accepted._file_ref,
                        root,
                        cnf_path,
                        cnf["sha256"],
                        cnf["bytes"],
                    )
                    cell_custody.verify()
                    cells.append(
                        {
                            "cell_id": identifier,
                            "center": center,
                            "category": category,
                            "ordinal": shard,
                            "cnf": cnf_ref,
                            "producer_manifest": _delegated_call(
                                accepted._ref, root, producer_path, producer
                            ),
                            "wave_manifest": _delegated_call(
                                accepted._ref, root, wave_path, wave
                            ),
                            "direct_lean_bytes_validated": is_direct_sentinel,
                            "claims": _claims(),
                        }
                    )
                    shard += 1
            if shard != CELL_COUNT:
                raise PreparationError("source-total physical category count drifted")
            expected_sentinels = tuple(
                category_id(center, category) for center, category in DIRECT_SENTINELS
            )
            if tuple(direct_validated) != expected_sentinels:
                raise PreparationError("direct Lean sentinel coverage drifted")
            campaign = {
                "schema": CAMPAIGN_SCHEMA,
                "run_id": RUN_ID,
                "project": "erdos-97-96-formalization",
                "status": "PREPARED_LOCAL_ONLY",
                "claims": {
                    "exact17_closed": False,
                    "proof_verified": False,
                    "source_entitlement": False,
                    "theorem_coverage": False,
                    "universal_lift": False,
                },
                "source": {
                    "path": _repo_relative(root, source_path),
                    "sha256": digests["source"],
                    "root_source_path": _repo_relative(root, root_source_path),
                    "root_source_sha256": digests["root_source"],
                    "exporter_path": _repo_relative(root, exporter_path),
                    "exporter_sha256": digests["exporter"],
                    "original_parent_exporter_path": _repo_relative(
                        root, original_parent_exporter_path
                    ),
                    "original_parent_exporter_sha256": digests[
                        "original_parent_exporter"
                    ],
                    "variable_map_path": _repo_relative(root, variable_map_path),
                    "variable_map_sha256": digests["variable_map"],
                    "checkpoint_path": _repo_relative(root, checkpoint_path),
                    "checkpoint_sha256": digests["checkpoint"],
                    "source_commit": source_commit,
                    "parent_root_sha256": parent["sha256"],
                    "parent_producer_sha256": root_producer_sha256,
                    "parent_novelty": parent_novelty,
                    "parent_novelty_sha256": sha256_bytes(
                        canonical_json_bytes(parent_novelty)
                    ),
                    "delegated_dependencies": delegated_dependencies,
                    "delegated_dependencies_sha256": sha256_bytes(
                        canonical_json_bytes(delegated_dependencies)
                    ),
                    "production_config": production_config,
                    "production_config_sha256": sha256_bytes(
                        canonical_json_bytes(production_config)
                    ),
                },
                "cell_count": len(cells),
                "cells": cells,
            }
            campaign_bytes = canonical_json_bytes(campaign)
            campaign_path = output / "artifacts" / "campaign-manifest.json"
            _secure_write_once(campaign_path, campaign_bytes)
            report = {
                "schema": SCHEMA,
                "run_id": RUN_ID,
                "status": "PREPARED_LOCAL_ONLY",
                "production_run": False,
                "cell_count": len(cells),
                "direct_lean_cells_validated": len(direct_validated),
                "direct_lean_sentinels": direct_validated,
                "campaign_manifest": _delegated_call(
                    accepted._ref, root, campaign_path, campaign_bytes
                ),
                "parent_novelty": parent_novelty,
                "parent_novelty_sha256": sha256_bytes(
                    canonical_json_bytes(parent_novelty)
                ),
                "delegated_dependencies": delegated_dependencies,
                "delegated_dependencies_sha256": sha256_bytes(
                    canonical_json_bytes(delegated_dependencies)
                ),
                "production_config": production_config,
                "production_config_sha256": sha256_bytes(
                    canonical_json_bytes(production_config)
                ),
                "claims": campaign["claims"],
            }
            _secure_write_once(
                output / "artifacts" / "preparation-report.json",
                canonical_json_bytes(report),
            )
            custody.verify()
            for cell_custody in cell_custodies:
                cell_custody.verify()
            if (
                _secure_read_named(
                    output / "run_manifest.json", "governed run manifest"
                )
                != run_manifest
            ):
                raise PreparationError(
                    "governed run manifest changed during preparation"
                )
            return report
        finally:
            for cell_custody in reversed(cell_custodies):
                cell_custody.close()
            parent_root.close()


def preflight_configuration(
    *,
    production_config_path: Path,
    production_config_commit: str,
    output_root: Path,
    repo_root: Path = ROOT,
    source_path: Path = SOURCE_PATH,
    root_source_path: Path = ROOT_SOURCE_PATH,
    exporter_path: Path = EXPORTER_PATH,
    original_parent_exporter_path: Path = ORIGINAL_PARENT_EXPORTER_PATH,
    delegated_preparer_path: Path = DELEGATED_PREPARER_PATH,
    hardened_preparer_path: Path = HARDENED_PREPARER_PATH,
    variable_map_path: Path = VARIABLE_MAP_PATH,
    checkpoint_path: Path = CHECKPOINT_PATH,
    preparer_path: Path = PREPARER_PATH,
    test_path: Path = TEST_PATH,
    config_blob_reader: Any = _read_committed_blob,
    commit_verifier: Any = accepted.verify_committed_support,
    dependency_commit_verifier: Any = verify_committed_dependency_blobs,
    target_commit_verifier: Any = verify_committed_target_blobs,
) -> dict[str, Any]:
    root = repo_root.resolve(strict=True)
    with _production_session(
        root,
        production_config_path,
        production_config_commit,
        config_blob_reader,
    ):
        return _preflight_authenticated(
            repo_root=root,
            output_root=output_root,
            source_path=source_path,
            root_source_path=root_source_path,
            exporter_path=exporter_path,
            original_parent_exporter_path=original_parent_exporter_path,
            delegated_preparer_path=delegated_preparer_path,
            hardened_preparer_path=hardened_preparer_path,
            variable_map_path=variable_map_path,
            checkpoint_path=checkpoint_path,
            preparer_path=preparer_path,
            test_path=test_path,
            commit_verifier=commit_verifier,
            dependency_commit_verifier=dependency_commit_verifier,
            target_commit_verifier=target_commit_verifier,
        )


def initialize_run_root(
    *,
    production_config_path: Path,
    production_config_commit: str,
    output_root: Path,
    repo_root: Path = ROOT,
    source_path: Path = SOURCE_PATH,
    root_source_path: Path = ROOT_SOURCE_PATH,
    exporter_path: Path = EXPORTER_PATH,
    original_parent_exporter_path: Path = ORIGINAL_PARENT_EXPORTER_PATH,
    delegated_preparer_path: Path = DELEGATED_PREPARER_PATH,
    hardened_preparer_path: Path = HARDENED_PREPARER_PATH,
    variable_map_path: Path = VARIABLE_MAP_PATH,
    checkpoint_path: Path = CHECKPOINT_PATH,
    preparer_path: Path = PREPARER_PATH,
    test_path: Path = TEST_PATH,
    config_blob_reader: Any = _read_committed_blob,
    commit_verifier: Any = accepted.verify_committed_support,
    dependency_commit_verifier: Any = verify_committed_dependency_blobs,
    target_commit_verifier: Any = verify_committed_target_blobs,
) -> dict[str, Any]:
    root = repo_root.resolve(strict=True)
    with _production_session(
        root,
        production_config_path,
        production_config_commit,
        config_blob_reader,
    ):
        _preflight_authenticated(
            repo_root=root,
            output_root=output_root,
            source_path=source_path,
            root_source_path=root_source_path,
            exporter_path=exporter_path,
            original_parent_exporter_path=original_parent_exporter_path,
            delegated_preparer_path=delegated_preparer_path,
            hardened_preparer_path=hardened_preparer_path,
            variable_map_path=variable_map_path,
            checkpoint_path=checkpoint_path,
            preparer_path=preparer_path,
            test_path=test_path,
            commit_verifier=commit_verifier,
            dependency_commit_verifier=dependency_commit_verifier,
            target_commit_verifier=target_commit_verifier,
        )
        return _initialize_run_root_authenticated(
            output_root=output_root,
            repo_root=root,
            source_path=source_path,
            root_source_path=root_source_path,
            exporter_path=exporter_path,
            original_parent_exporter_path=original_parent_exporter_path,
            delegated_preparer_path=delegated_preparer_path,
            hardened_preparer_path=hardened_preparer_path,
            variable_map_path=variable_map_path,
            checkpoint_path=checkpoint_path,
            preparer_path=preparer_path,
            test_path=test_path,
        )


def prepare_campaign(
    *,
    production_config_path: Path,
    production_config_commit: str,
    source_commit: str,
    output_root: Path,
    repo_root: Path = ROOT,
    source_path: Path = SOURCE_PATH,
    root_source_path: Path = ROOT_SOURCE_PATH,
    exporter_path: Path = EXPORTER_PATH,
    original_parent_exporter_path: Path = ORIGINAL_PARENT_EXPORTER_PATH,
    delegated_preparer_path: Path = DELEGATED_PREPARER_PATH,
    hardened_preparer_path: Path = HARDENED_PREPARER_PATH,
    variable_map_path: Path = VARIABLE_MAP_PATH,
    checkpoint_path: Path = CHECKPOINT_PATH,
    preparer_path: Path = PREPARER_PATH,
    test_path: Path = TEST_PATH,
    lean_root_exporter: Any = run_lean_root_export,
    lean_exporter: Any = run_lean_export,
    config_blob_reader: Any = _read_committed_blob,
    commit_verifier: Any = accepted.verify_committed_support,
    dependency_commit_verifier: Any = verify_committed_dependency_blobs,
    target_commit_verifier: Any = verify_committed_target_blobs,
) -> dict[str, Any]:
    root = repo_root.resolve(strict=True)
    with _production_session(
        root,
        production_config_path,
        production_config_commit,
        config_blob_reader,
    ):
        return _prepare_campaign_authenticated(
            source_commit=source_commit,
            output_root=output_root,
            repo_root=root,
            source_path=source_path,
            root_source_path=root_source_path,
            exporter_path=exporter_path,
            original_parent_exporter_path=original_parent_exporter_path,
            delegated_preparer_path=delegated_preparer_path,
            hardened_preparer_path=hardened_preparer_path,
            variable_map_path=variable_map_path,
            checkpoint_path=checkpoint_path,
            preparer_path=preparer_path,
            test_path=test_path,
            lean_root_exporter=lean_root_exporter,
            lean_exporter=lean_exporter,
            commit_verifier=commit_verifier,
            dependency_commit_verifier=dependency_commit_verifier,
            target_commit_verifier=target_commit_verifier,
        )


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, required=True)
    parser.add_argument("--root-source", type=Path, required=True)
    parser.add_argument("--exporter", type=Path, required=True)
    parser.add_argument("--original-parent-exporter", type=Path, required=True)
    parser.add_argument("--checkpoint", type=Path, required=True)
    parser.add_argument("--production-config", type=Path, required=True)
    parser.add_argument("--production-config-commit", required=True)
    parser.add_argument("--source-commit")
    parser.add_argument("--initialize-run-root", action="store_true")
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--output-root", type=Path, required=True)
    args = parser.parse_args(argv)
    if args.initialize_run_root and args.preflight:
        parser.error("--initialize-run-root and --preflight are mutually exclusive")
    common = {
        "source_path": args.source,
        "root_source_path": args.root_source,
        "exporter_path": args.exporter,
        "original_parent_exporter_path": args.original_parent_exporter,
        "checkpoint_path": args.checkpoint,
        "production_config_path": args.production_config,
        "production_config_commit": args.production_config_commit,
        "output_root": args.output_root,
    }
    if args.preflight:
        result = preflight_configuration(**common)
    elif args.initialize_run_root:
        result = initialize_run_root(
            **common,
        )
    else:
        if args.source_commit is None:
            parser.error("--source-commit is required for preparation")
        result = prepare_campaign(
            source_commit=args.source_commit,
            **common,
        )
    print(json.dumps({"status": result["status"]}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
