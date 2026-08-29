"""Crash-safe, authenticated archive-and-unlink cleanup for ``scratch/runs``.

The 2026-08-24 cleanup program is only the seed for the candidate predicate.
This program never imports or executes it.  Candidates are frozen first, then
streamed into a path-preserving tar.zst archive, independently verified, and
only then unlinked using descriptor-bound operations.
"""

from __future__ import annotations

import argparse
import dataclasses
import datetime as dt
import fcntl
import hashlib
import io
import json
import os
import re
import shutil
import stat
import subprocess
import sys
import tarfile
from collections.abc import Iterable, Iterator
from pathlib import Path, PurePosixPath
from typing import Any, BinaryIO

REPO = Path(__file__).resolve().parents[1]
SCRIPT = Path(__file__).resolve()
SCRIPT_REL = SCRIPT.relative_to(REPO).as_posix()
CHECKPOINT_REL = ".codex/worktree-checkpoints/scratch-runs-quarantine-20260828.json"
SCRATCH_RUNS_REL = "scratch/runs"
SCRATCH_RUNS = REPO / SCRATCH_RUNS_REL
LANE_ROOT_REL = "scratch/runs/scratch-runs-quarantine-20260828/archive-v1"
LANE_ROOT = REPO / LANE_ROOT_REL
OLD_CLEANUP_REL = "scratch/runs/scratch-runs-cleanup-20260824/cleanup-v1"
CHECKPOINT = REPO / CHECKPOINT_REL
RUN_MANIFEST = LANE_ROOT / "run_manifest.json"
PLAN = LANE_ROOT / "archive-plan.json"
CANDIDATES = LANE_ROOT / "candidate-plan.jsonl"
PRESERVATION = LANE_ROOT / "preservation-plan.jsonl"
LOCAL_CONTENT = LANE_ROOT / "candidate-content.jsonl"
PARENT_FSYNC_WAL = LANE_ROOT / "parent-fsync-wal.json"
LOCAL_RECEIPT = REPO / "certificates/scratch_runs_quarantine_20260828_v1.json"
LOCK = LANE_ROOT / "tmp/archive.lock"
CHECKPOINT_LOCK_REPAIR_WAL = LANE_ROOT / "tmp/checkpoint-lock-repair-wal.json"

DESTINATION = Path(
    "/opt/nfs/erdos-97-96-formalization-scratch-runs-quarantine-20260828"
)
ARCHIVE = DESTINATION / "scratch-runs-candidates.tar.zst"
DEST_CONTENT = DESTINATION / "candidate-content.jsonl"
DEST_PLAN = DESTINATION / PLAN.name
DEST_PRESERVATION = DESTINATION / PRESERVATION.name
DEST_CANDIDATES = DESTINATION / CANDIDATES.name
DEST_RECEIPT = DESTINATION / "archive-receipt.json"

SCHEMA_PLAN = "scratch-runs-quarantine-plan/v1"
SCHEMA_RECEIPT = "scratch-runs-quarantine-receipt/v1"
MANIFEST_BASENAMES = frozenset({"run_manifest.json", "run-manifest.json"})
OUTPUT_CLASSES = frozenset({"artifacts", "events", "tmp"})
AMBIGUOUS_SUFFIXES = frozenset({".drat", ".lrat", ".lean", ".md"})
COPY_BLOCK = 8 * 1024 * 1024
PROGRESS_FILES = 10_000
ZSTD_LONG_WINDOW = "--long=31"
# Supported textual reference syntax is deliberately explicit:
#   * literal ``scratch/runs/...`` in a raw token or single/double quotes;
#   * JSON's optional slash-escaped spelling ``scratch\/runs\/...``;
#   * common closing/sentence punctuation after an exact path.
# Both the untrimmed token and a punctuation-trimmed token are tested so a
# real filename ending in punctuation is never hidden by normalization.
REFERENCE_RE = re.compile(rb"scratch/runs/[^\x00\r\n\t\"'` <>]+")
ESCAPED_REFERENCE_RE = re.compile(
    rb"scratch\\/runs\\/[^\x00\r\n\t\"'` <>]+"
)
QUOTED_REFERENCE_RES = (
    re.compile(rb'"(scratch/runs/[^"\x00\r\n]+)"'),
    re.compile(rb"'(scratch/runs/[^'\x00\r\n]+)'"),
    re.compile(rb'"(scratch\\/runs\\/[^"\x00\r\n]+)"'),
    re.compile(rb"'(scratch\\/runs\\/[^'\x00\r\n]+)'"),
)
REFERENCE_TRAILING = b",;:)]}.!?"

# Exact whole-root preservation decision supplied for this cleanup wave.
PROTECTED_TOP_LEVEL_NAMES = frozenset(
    {
        "exact12-rigid221-all-order-common-five",
        "exact17-canary-perp-bisector-refinement-sat-portfolio-20260821",
        "exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-sat-portfolio-v4-20260822",
        "exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-sat-portfolio-v5-20260822",
        "exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-sat-portfolio-v6-20260823",
        "exact17-canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-refinements-sat-portfolio-v7-20260823",
        "exact17-canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-sat-portfolio-v8-20260823",
        "exact17-canary-perp-bisector-survivor-refinements-sat-portfolio-20260822",
        "exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-portfolio-20260822",
        "exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-portfolio-v2-20260822",
        "exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-portfolio-v3-20260822",
        "exact17-cocircular-pentagon-order-20260819",
        "exact17-current-root-two-kalmanson-piqd",
        "exact17-current-root-two-kalmanson-successor-piqd",
        "exact17-direct-convexfive-fullbank-20260820",
        "exact17-eight-hit-sat-portfolio-20260821",
        "exact17-forty-ninth-piqd-20260816",
        "exact17-six-hit-bisector-canary-two-kalmanson-model-refinements-sat-portfolio-20260821",
        "exact17-six-hit-bisector-canary-two-kalmanson-sat-portfolio-20260821",
        "exact17-six-hit-bisector-sat-portfolio-20260821",
        "exact17-small-role-cycle-piqd-20260816",
        "exact17-sparse-six-four-row-bisector-20260820",
        "exact17-sparse-six-four-row-bisector-sat-portfolio-20260820",
        "exact17-sparse-six-four-row-bisector-two-kalmanson-sat-portfolio-20260820",
        "exact17-sparse-six-nextcenter-split-20260820",
        "exact17-two-triple-row-piqd",
        "exact17-weighted-kalmanson-successor-piqd-20260816",
        "exact17-weighted-successor-model-piqd-20260816",
        "freshthird-firstnonhit-live-retained-v1",
        "p97-prose-synthesis-20260822",
        "firstnonhit-all-large-caps-v4",
        "firstnonhit-cap-endpoint-v3",
        "firstnonhit-common-only-v7",
        "firstnonhit-common-payload-v6",
        "firstnonhit-complete-cnf-v2",
        "firstnonhit-overlap-v5",
    }
)

# Narrower prototype protections remain in force even where they are subroots.
PROTECTED_PREFIXES = (
    "scratch/runs/exact12-rigid221-center-exchange-canary-v13",
    "scratch/runs/exact17-v8-two-kalmanson-successor-preparer-20260823",
    "scratch/runs/exact17-v8-identity-freeze-20260823/identity-freeze-v1",
    "scratch/runs/exact17-v8-portfolio-prepared-audit-20260823/prepared-audit-v1",
    "scratch/runs/exact17-v8-refrozen-identity-freeze-20260824/identity-freeze-v1",
    "scratch/runs/exact17-v8-canary-diagnostic-mine-20260824/canary-a785104c",
    "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-sat-portfolio-v8-refrozen-20260824/sat-profile-portfolio-v8-refrozen",
    "scratch/runs/freshthird-common-sixpacket-v8-20260819",
    LANE_ROOT_REL,
    OLD_CLEANUP_REL,
)

PROVENANCE_PREFIXES = (
    "scratch/runs/exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-preparer-20260821/physical-slice-cell-campaign-v1",
    "scratch/runs/exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-preparer-20260821/physical-slice-cell-campaign-v2",
    "scratch/runs/exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-preparer-20260821/physical-slice-cell-campaign-v3",
    "scratch/runs/exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-preparer-20260821/physical-slice-cell-campaign-v4",
    "scratch/runs/exact17-sparse-six-four-row-bisector-two-kalmanson-preparer-20260820/physical-slice-cell-campaign-v1.stale-pre-repair-20260821T0607Z",
    "scratch/runs/exact17-sparse-six-nextcenter-split-20260820/physical-slice-full-campaign-v1/tmp/quarantine/superseded-physical-slice-campaign-v1",
    "scratch/runs/freshthird-source-complete-static-v4/canary-20260815-0001",
    "scratch/runs/freshthird-source-complete-static-v4/canary-20260815-0002",
    "scratch/runs/freshthird-source-complete-static-v4/canary-20260819-0001",
    "scratch/runs/freshthird-source-total-static-v3/canary-20260815-0001",
    "scratch/runs/triapex-d8-finite-query-20260821/run-0001",
)


class ArchiveError(RuntimeError):
    """A safety or authentication condition failed."""


def zstd_encode_command(executable: str) -> list[str]:
    return [executable, "-T0", "-3", ZSTD_LONG_WINDOW, "-q", "-c"]


def zstd_decode_command(executable: str, archive: Path) -> list[str]:
    # The decoder must explicitly opt into the same bounded 2 GiB window that
    # the encoder may emit; zstd's default decoder ceiling is only 128 MiB.
    return [executable, "-q", ZSTD_LONG_WINDOW, "-dc", str(archive)]


@dataclasses.dataclass(frozen=True, slots=True)
class Record:
    path: str
    device: int
    inode: int
    mode: int
    uid: int
    gid: int
    size: int
    allocated: int
    mtime_ns: int
    label: str
    sha256: str | None

    @classmethod
    def from_stat(
        cls,
        path: str,
        info: os.stat_result,
        label: str,
        sha256: str | None = None,
    ) -> Record:
        return cls(
            path=path,
            device=info.st_dev,
            inode=info.st_ino,
            mode=info.st_mode,
            uid=info.st_uid,
            gid=info.st_gid,
            size=info.st_size,
            allocated=info.st_blocks * 512,
            mtime_ns=info.st_mtime_ns,
            label=label,
            sha256=sha256,
        )

    def as_dict(self) -> dict[str, Any]:
        return dataclasses.asdict(self)

    @classmethod
    def decode(cls, value: dict[str, Any]) -> Record:
        expected = {field.name for field in dataclasses.fields(cls)}
        if set(value) != expected:
            raise ArchiveError("record fields do not match schema")
        return cls(**value)


def utc_now() -> str:
    return dt.datetime.now(dt.UTC).replace(microsecond=0).isoformat().replace(
        "+00:00", "Z"
    )


def canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode()


def self_hash(value: dict[str, Any]) -> str:
    body = {key: item for key, item in value.items() if key != "receipt_sha256"}
    return hashlib.sha256(canonical_bytes(body)).hexdigest()


def verify_manifest_self_hash(value: dict[str, Any], field: str, label: str) -> None:
    claimed = value.get(field)
    expected = hashlib.sha256(
        canonical_bytes({key: item for key, item in value.items() if key != field})
    ).hexdigest()
    if claimed != expected:
        raise ArchiveError(f"{label} self-hash mismatch")


def validate_checkpoint(value: dict[str, Any]) -> None:
    if value.get("schema") != "worktree-lane-checkpoint/v1":
        raise ArchiveError("lane checkpoint schema mismatch")
    if value.get("lane_id") != "scratch-runs-quarantine-20260828":
        raise ArchiveError("lane checkpoint lane_id mismatch")
    base_head = value.get("base_head")
    if not isinstance(base_head, str) or re.fullmatch(r"[0-9a-f]{40}", base_head) is None:
        raise ArchiveError("lane checkpoint base_head is invalid")
    list_fields = ("owned_paths", "durable_paths", "generated_roots")
    for field in list_fields:
        rows = value.get(field)
        if not isinstance(rows, list) or not all(isinstance(row, str) for row in rows):
            raise ArchiveError(f"lane checkpoint field is invalid: {field}")
    required_owned = {CHECKPOINT_REL, SCRIPT_REL}
    if not required_owned.issubset(value["owned_paths"]):
        raise ArchiveError("lane checkpoint does not own checkpoint and mover")
    run_manifest_relative = RUN_MANIFEST.relative_to(REPO).as_posix()
    if run_manifest_relative not in value["durable_paths"]:
        raise ArchiveError("lane checkpoint does not retain the run manifest")
    if LANE_ROOT_REL not in value["generated_roots"]:
        raise ArchiveError("lane checkpoint does not register the generated root")


def fsync_directory(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def ensure_directory(path: Path) -> None:
    if os.path.lexists(path):
        info = path.lstat()
        if not stat.S_ISDIR(info.st_mode) or stat.S_ISLNK(info.st_mode):
            raise ArchiveError(f"unsafe directory: {path}")
        fsync_directory(path)
        if path.parent != path:
            fsync_directory(path.parent)
        return
    parent = path.parent
    ensure_directory(parent)
    path.mkdir()
    fsync_directory(path)
    fsync_directory(parent)


def safe_regular(path: Path) -> os.stat_result:
    info = path.lstat()
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
        raise ArchiveError(f"not a unique regular file: {path}")
    return info


def atomic_bytes(path: Path, payload: bytes, *, replace: bool) -> None:
    ensure_directory(path.parent)
    temporary = path.with_name(path.name + ".tmp")
    if os.path.lexists(temporary):
        safe_regular(temporary)
        temporary.unlink()
        fsync_directory(path.parent)
    if os.path.lexists(path):
        safe_regular(path)
        if not replace:
            raise ArchiveError(f"refusing to replace: {path}")
    descriptor = os.open(
        temporary,
        os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
        0o600,
    )
    try:
        with os.fdopen(descriptor, "wb", closefd=False) as handle:
            handle.write(payload)
            handle.flush()
            os.fsync(handle.fileno())
    finally:
        os.close(descriptor)
    os.replace(temporary, path)
    fsync_directory(path.parent)


def atomic_json(path: Path, value: dict[str, Any], *, replace: bool) -> None:
    atomic_bytes(path, canonical_bytes(value) + b"\n", replace=replace)


def validate_relative(path: str) -> None:
    pure = PurePosixPath(path)
    if (
        not path
        or pure.is_absolute()
        or ".." in pure.parts
        or not (path == SCRATCH_RUNS_REL or path.startswith(SCRATCH_RUNS_REL + "/"))
    ):
        raise ArchiveError(f"unsafe scratch/runs path: {path!r}")
    if any(character in path for character in "\x00\t\r\n\"'\\"):
        raise ArchiveError(f"unsupported path characters: {path!r}")


def is_under(path: str, prefix: str) -> bool:
    return path == prefix or path.startswith(prefix + "/")


def top_level_root(path: str) -> str:
    parts = PurePosixPath(path).parts
    if len(parts) < 3:
        raise ArchiveError(f"file is not below a run root: {path}")
    return "/".join(parts[:3])


def hash_file(path: Path) -> str:
    named = safe_regular(path)
    descriptor = os.open(path, os.O_RDONLY | os.O_NOFOLLOW)
    digest = hashlib.sha256()
    try:
        before = os.fstat(descriptor)
        if identity(named) != identity(before):
            raise ArchiveError(f"file changed before hashing: {path}")
        for block in iter(lambda: os.read(descriptor, COPY_BLOCK), b""):
            digest.update(block)
        after = os.fstat(descriptor)
        if identity(before) != identity(after):
            raise ArchiveError(f"file changed while hashing: {path}")
    finally:
        os.close(descriptor)
    return digest.hexdigest()


def read_regular_bytes(path: Path) -> bytes:
    named = safe_regular(path)
    descriptor = os.open(path, os.O_RDONLY | os.O_NOFOLLOW)
    blocks: list[bytes] = []
    try:
        before = os.fstat(descriptor)
        if identity(named) != identity(before):
            raise ArchiveError(f"file changed before reading: {path}")
        while block := os.read(descriptor, COPY_BLOCK):
            blocks.append(block)
        after = os.fstat(descriptor)
        if identity(before) != identity(after):
            raise ArchiveError(f"file changed while reading: {path}")
    finally:
        os.close(descriptor)
    return b"".join(blocks)


def identity(info: os.stat_result) -> tuple[int, int, int, int, int, int]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
    )


def write_records(path: Path, rows: list[Record]) -> None:
    payload = b"".join(canonical_bytes(row.as_dict()) + b"\n" for row in rows)
    atomic_bytes(path, payload, replace=False)


def read_records(path: Path) -> list[Record]:
    rows = [
        Record.decode(json.loads(line))
        for line in read_regular_bytes(path).splitlines()
        if line
    ]
    if rows != sorted(rows, key=lambda row: row.path):
        raise ArchiveError(f"records are not path-sorted: {path}")
    if len(rows) != len({row.path for row in rows}):
        raise ArchiveError(f"duplicate record path: {path}")
    return rows


def git_paths(*arguments: str) -> list[str]:
    result = subprocess.run(
        ["git", *arguments], cwd=REPO, check=True, stdout=subprocess.PIPE
    )
    return [item.decode() for item in result.stdout.split(b"\0") if item]


def tracked_paths() -> set[str]:
    return set(git_paths("ls-files", "-z", "--", SCRATCH_RUNS_REL))


def durable_prefixes() -> set[str]:
    prefixes: set[str] = set()
    checkpoint_root = REPO / ".codex/worktree-checkpoints"
    for checkpoint in sorted(checkpoint_root.glob("*.json")):
        value = json.loads(read_regular_bytes(checkpoint))
        rows = value.get("durable_paths", [])
        if not isinstance(rows, list) or not all(isinstance(row, str) for row in rows):
            raise ArchiveError(f"invalid durable_paths: {checkpoint}")
        for row in rows:
            if is_under(row, SCRATCH_RUNS_REL):
                validate_relative(row)
                prefixes.add(row)
    return prefixes


def walk_files() -> Iterator[tuple[str, os.stat_result]]:
    root_info = SCRATCH_RUNS.lstat()
    if not stat.S_ISDIR(root_info.st_mode) or stat.S_ISLNK(root_info.st_mode):
        raise ArchiveError("scratch/runs is not a safe directory")
    for directory, dirnames, filenames in os.walk(SCRATCH_RUNS, followlinks=False):
        base = Path(directory)
        for name in dirnames:
            info = (base / name).lstat()
            if (
                not stat.S_ISDIR(info.st_mode)
                or stat.S_ISLNK(info.st_mode)
                or info.st_dev != root_info.st_dev
            ):
                raise ArchiveError(f"unsafe directory entry: {base / name}")
        for name in filenames:
            child = base / name
            info = child.lstat()
            if (
                not stat.S_ISREG(info.st_mode)
                or info.st_nlink != 1
                or info.st_dev != root_info.st_dev
            ):
                raise ArchiveError(f"unsafe file entry: {child}")
            relative = child.relative_to(REPO).as_posix()
            validate_relative(relative)
            yield relative, info


def is_ambiguous(path: str) -> bool:
    pure = PurePosixPath(path)
    basename = pure.name.lower()
    return (
        pure.suffix.lower() in AMBIGUOUS_SUFFIXES
        or "report" in basename
        or "receipt" in basename
    )


def is_runtime_evidence(path: str) -> bool:
    pure = PurePosixPath(path)
    basename = pure.name.lower()
    parts = {part.lower() for part in pure.parts}
    return (
        pure.suffix.lower() in {".lock", ".pid"}
        or basename in {"lock", "execution.lock", "run-state", "run_state"}
        or any(token in basename for token in ("launch", "terminal", "run-state", "run_state"))
        or bool(parts & {"locks", "launch", "launches", "terminal", "run-state", "run_state"})
    )


def registered_output(path: str, run_roots: set[str]) -> bool:
    parts = PurePosixPath(path).parts
    for index, part in enumerate(parts):
        if part in OUTPUT_CLASSES and "/".join(parts[:index]) in run_roots:
            return True
    return False


def census() -> tuple[list[Record], list[Record], dict[str, int]]:
    tracked = tracked_paths()
    durable = durable_prefixes()
    all_files = list(walk_files())
    manifests = {
        path for path, _info in all_files if PurePosixPath(path).name in MANIFEST_BASENAMES
    }
    run_roots = {str(PurePosixPath(path).parent) for path in manifests}
    candidates: list[Record] = []
    preservation: list[Record] = []
    counters: dict[str, int] = {}
    for path, info in all_files:
        label: str | None = None
        top_name = PurePosixPath(top_level_root(path)).name
        if top_name in PROTECTED_TOP_LEVEL_NAMES:
            label = "protected-root"
        elif any(is_under(path, prefix) for prefix in PROTECTED_PREFIXES):
            label = "protected-prefix"
        elif path in tracked:
            label = "tracked"
        elif any(is_under(path, prefix) for prefix in durable):
            label = "durable"
        elif path in manifests:
            label = "manifest"
        elif any(is_under(path, prefix) for prefix in PROVENANCE_PREFIXES):
            label = "provenance"
        elif is_runtime_evidence(path):
            label = "runtime-evidence"
        elif is_ambiguous(path):
            label = "ambiguous"
        if label is not None:
            preservation.append(Record.from_stat(path, info, label))
            counters[label] = counters.get(label, 0) + 1
            continue
        label = "registered" if registered_output(path, run_roots) else "orphan"
        candidates.append(Record.from_stat(path, info, label))
        counters[label] = counters.get(label, 0) + 1
    candidates.sort(key=lambda row: row.path)
    preservation.sort(key=lambda row: row.path)
    if len(candidates) != len({row.path for row in candidates}):
        raise ArchiveError("duplicate candidate path")
    if {row.path for row in candidates} & {row.path for row in preservation}:
        raise ArchiveError("candidate/preservation overlap")
    return candidates, preservation, counters


def freeze_candidate_hashes(rows: list[Record]) -> list[Record]:
    frozen: list[Record] = []
    for index, row in enumerate(rows, 1):
        path = REPO / row.path
        before = path.lstat()
        if not record_matches(row, before):
            raise ArchiveError(f"candidate changed before freeze hash: {row.path}")
        digest = hash_file(path)
        after = path.lstat()
        if not record_matches(row, after):
            raise ArchiveError(f"candidate changed during freeze hash: {row.path}")
        frozen.append(dataclasses.replace(row, sha256=digest))
        if index % PROGRESS_FILES == 0:
            print(json.dumps({"hashed_candidates": index}), flush=True)
    return frozen


def metadata_equal(left: Record, right: Record) -> bool:
    return dataclasses.replace(left, sha256=None) == dataclasses.replace(
        right, sha256=None
    )


def totals(rows: Iterable[Record]) -> dict[str, int]:
    materialized = list(rows)
    return {
        "files": len(materialized),
        "logical_bytes": sum(row.size for row in materialized),
        "allocated_bytes": sum(row.allocated for row in materialized),
    }


def current_head() -> str:
    result = subprocess.run(
        ["git", "rev-parse", "HEAD"], cwd=REPO, check=True, stdout=subprocess.PIPE
    )
    return result.stdout.decode().strip()


def require_ancestor(older: str, newer: str, label: str) -> None:
    result = subprocess.run(
        ["git", "merge-base", "--is-ancestor", older, newer],
        cwd=REPO,
        check=False,
    )
    if result.returncode != 0:
        raise ArchiveError(f"required Git ancestry does not hold ({label}): {older} -> {newer}")


def update_run_manifest(
    checkpoint_value: dict[str, Any],
    candidate_sha256: str,
    preservation_sha256: str,
) -> str:
    value = json.loads(read_regular_bytes(RUN_MANIFEST))
    if value.get("schema") != "worktree-run-manifest/v1":
        raise ArchiveError("run manifest schema mismatch")
    verify_manifest_self_hash(value, "manifest_sha256", "run manifest")
    if value.get("base_head") != checkpoint_value.get("base_head"):
        raise ArchiveError("run manifest/checkpoint base_head mismatch")
    input_digests = value.get("input_digests")
    source_digests = value.get("source_digests")
    if not isinstance(input_digests, dict) or not isinstance(source_digests, dict):
        raise ArchiveError("run manifest digest maps are invalid")
    value["input_digests"] = {
        **input_digests,
        CANDIDATES.relative_to(REPO).as_posix(): candidate_sha256,
        PRESERVATION.relative_to(REPO).as_posix(): preservation_sha256,
    }
    value["source_digests"] = {
        **source_digests,
        CHECKPOINT.relative_to(REPO).as_posix(): hash_file(CHECKPOINT),
        SCRIPT_REL: hash_file(SCRIPT),
    }
    value["manifest_sha256"] = hashlib.sha256(
        canonical_bytes(
            {key: item for key, item in value.items() if key != "manifest_sha256"}
        )
    ).hexdigest()
    atomic_json(RUN_MANIFEST, value, replace=True)
    return hash_file(RUN_MANIFEST)


def freeze() -> None:
    if not CHECKPOINT.is_file() or not RUN_MANIFEST.is_file():
        raise ArchiveError("lane checkpoint and run manifest must exist first")
    if os.path.lexists(PLAN):
        _plan, candidates, _preservation = load_plan()
        print(json.dumps({"status": "ALREADY_FROZEN", **totals(candidates)}, sort_keys=True))
        return
    # PLAN is the commit record.  Manifests without it are an interrupted,
    # unpublished freeze and are safe to regenerate from a fresh census.
    for incomplete in (CANDIDATES, PRESERVATION):
        if os.path.lexists(incomplete):
            safe_regular(incomplete)
            incomplete.unlink()
            fsync_directory(incomplete.parent)
    candidates, preservation, counters = census()
    candidates, preservation, counters, closure_iterations = reference_closure(
        candidates, preservation, counters
    )
    candidates = freeze_candidate_hashes(candidates)
    write_records(CANDIDATES, candidates)
    write_records(PRESERVATION, preservation)
    checkpoint_value = json.loads(read_regular_bytes(CHECKPOINT))
    verify_manifest_self_hash(checkpoint_value, "manifest_sha256", "lane checkpoint")
    validate_checkpoint(checkpoint_value)
    candidate_sha256 = hash_file(CANDIDATES)
    preservation_sha256 = hash_file(PRESERVATION)
    run_manifest_sha256 = update_run_manifest(
        checkpoint_value, candidate_sha256, preservation_sha256
    )
    freeze_head = current_head()
    base_head = checkpoint_value["base_head"]
    require_ancestor(base_head, freeze_head, "checkpoint base to freeze head")
    value: dict[str, Any] = {
        "base_head": base_head,
        "candidate_manifest_sha256": candidate_sha256,
        "candidate_totals": totals(candidates),
        "census_counters": counters,
        "checkpoint_sha256": hash_file(CHECKPOINT),
        "created_utc": utc_now(),
        "destination": str(DESTINATION),
        "freeze_head": freeze_head,
        "lane_id": "scratch-runs-quarantine-20260828",
        "mover_script_sha256": hash_file(SCRIPT),
        "preservation_manifest_sha256": preservation_sha256,
        "preservation_totals": totals(preservation),
        "reference_closure_iterations": closure_iterations,
        "protected_top_level_roots": sorted(
            f"scratch/runs/{name}" for name in PROTECTED_TOP_LEVEL_NAMES
        ),
        "run_manifest_sha256": run_manifest_sha256,
        "schema": SCHEMA_PLAN,
    }
    value["plan_sha256"] = self_hash({**value, "receipt_sha256": ""})
    atomic_json(PLAN, value, replace=False)
    receipt = new_receipt(value, "FROZEN")
    publish_receipt(receipt)
    print(json.dumps({"status": "FROZEN", **value["candidate_totals"]}, sort_keys=True))


def load_plan() -> tuple[dict[str, Any], list[Record], list[Record]]:
    value = json.loads(read_regular_bytes(PLAN))
    if value.get("schema") != SCHEMA_PLAN:
        raise ArchiveError("plan schema mismatch")
    claimed = value.get("plan_sha256")
    body = {key: item for key, item in value.items() if key != "plan_sha256"}
    expected = self_hash({**body, "receipt_sha256": ""})
    if claimed != expected:
        raise ArchiveError("plan self-hash mismatch")
    candidates = read_records(CANDIDATES)
    preservation = read_records(PRESERVATION)
    if hash_file(CANDIDATES) != value["candidate_manifest_sha256"]:
        raise ArchiveError("candidate plan hash mismatch")
    if hash_file(PRESERVATION) != value["preservation_manifest_sha256"]:
        raise ArchiveError("preservation plan hash mismatch")
    if totals(candidates) != value["candidate_totals"]:
        raise ArchiveError("candidate totals mismatch")
    if totals(preservation) != value["preservation_totals"]:
        raise ArchiveError("preservation totals mismatch")
    provenance = {
        "checkpoint_sha256": hash_file(CHECKPOINT),
        "mover_script_sha256": hash_file(SCRIPT),
        "run_manifest_sha256": hash_file(RUN_MANIFEST),
    }
    for field, expected_hash in provenance.items():
        if value.get(field) != expected_hash:
            raise ArchiveError(f"frozen plan provenance mismatch: {field}")
    checkpoint_value = json.loads(read_regular_bytes(CHECKPOINT))
    verify_manifest_self_hash(checkpoint_value, "manifest_sha256", "lane checkpoint")
    validate_checkpoint(checkpoint_value)
    verify_manifest_self_hash(
        json.loads(read_regular_bytes(RUN_MANIFEST)),
        "manifest_sha256",
        "run manifest",
    )
    current = current_head()
    require_ancestor(value["base_head"], value["freeze_head"], "base to freeze head")
    require_ancestor(value["base_head"], current, "base to current head")
    require_ancestor(value["freeze_head"], current, "freeze to current head")
    return value, candidates, preservation


def new_receipt(plan: dict[str, Any], status_value: str, **extra: Any) -> dict[str, Any]:
    value: dict[str, Any] = {
        "archive": str(ARCHIVE),
        "candidate_manifest_sha256": plan["candidate_manifest_sha256"],
        "candidate_totals": plan["candidate_totals"],
        "lane_id": plan["lane_id"],
        "plan_sha256": plan["plan_sha256"],
        "schema": SCHEMA_RECEIPT,
        "status": status_value,
        "updated_utc": utc_now(),
        **extra,
    }
    value["receipt_sha256"] = self_hash(value)
    return value


def wal_self_hash(value: dict[str, Any]) -> str:
    return hashlib.sha256(
        canonical_bytes({key: item for key, item in value.items() if key != "wal_sha256"})
    ).hexdigest()


def load_or_create_parent_wal(plan: dict[str, Any], parents: set[str]) -> set[str]:
    if os.path.lexists(PARENT_FSYNC_WAL):
        value = json.loads(read_regular_bytes(PARENT_FSYNC_WAL))
        if (
            value.get("schema") != "scratch-runs-parent-fsync-wal/v1"
            or value.get("wal_sha256") != wal_self_hash(value)
            or value.get("plan_sha256") != plan["plan_sha256"]
        ):
            raise ArchiveError("parent fsync WAL authentication failed")
        stored = value.get("parents")
        if not isinstance(stored, list) or not all(
            isinstance(parent, str) for parent in stored
        ):
            raise ArchiveError("parent fsync WAL parents are invalid")
        for parent in stored:
            validate_relative(parent)
        parents.update(stored)
    if not parents:
        return parents
    value = {
        "created_utc": utc_now(),
        "parents": sorted(parents),
        "plan_sha256": plan["plan_sha256"],
        "schema": "scratch-runs-parent-fsync-wal/v1",
    }
    value["wal_sha256"] = wal_self_hash(value)
    atomic_json(
        PARENT_FSYNC_WAL,
        value,
        replace=os.path.lexists(PARENT_FSYNC_WAL),
    )
    return parents


def clear_parent_wal() -> None:
    if not os.path.lexists(PARENT_FSYNC_WAL):
        return
    safe_regular(PARENT_FSYNC_WAL)
    PARENT_FSYNC_WAL.unlink()
    fsync_directory(PARENT_FSYNC_WAL.parent)


def publish_receipt(value: dict[str, Any]) -> None:
    if value.get("receipt_sha256") != self_hash(value):
        raise ArchiveError("refusing to publish invalid receipt")
    atomic_json(LOCAL_RECEIPT, value, replace=os.path.lexists(LOCAL_RECEIPT))
    if os.path.lexists(DESTINATION):
        atomic_json(DEST_RECEIPT, value, replace=os.path.lexists(DEST_RECEIPT))


def load_receipt(plan: dict[str, Any]) -> dict[str, Any]:
    value = json.loads(read_regular_bytes(LOCAL_RECEIPT))
    if value.get("schema") != SCHEMA_RECEIPT or value.get("receipt_sha256") != self_hash(value):
        raise ArchiveError("local receipt authentication failed")
    bindings = {
        "candidate_manifest_sha256": plan["candidate_manifest_sha256"],
        "candidate_totals": plan["candidate_totals"],
        "lane_id": plan["lane_id"],
        "plan_sha256": plan["plan_sha256"],
    }
    for field, expected in bindings.items():
        if value.get(field) != expected:
            raise ArchiveError(f"receipt does not bind current plan field: {field}")
    return value


def record_matches(row: Record, info: os.stat_result) -> bool:
    return (
        row.device,
        row.inode,
        row.mode,
        row.uid,
        row.gid,
        row.size,
        row.mtime_ns,
    ) == (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_uid,
        info.st_gid,
        info.st_size,
        info.st_mtime_ns,
    ) and info.st_nlink == 1


def preserved_files_present(rows: list[Record]) -> None:
    missing: list[str] = []
    unsafe: list[str] = []
    for row in rows:
        path = REPO / row.path
        if not os.path.lexists(path):
            missing.append(row.path)
            continue
        info = path.lstat()
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            unsafe.append(row.path)
    if missing or unsafe:
        raise ArchiveError(
            f"preservation failure: missing={missing[:5]} unsafe={unsafe[:5]}"
        )


def extract_references(payload: bytes, candidates: set[str]) -> set[str]:
    hits: set[str] = set()
    raw_values = [match.group() for match in REFERENCE_RE.finditer(payload)]
    raw_values.extend(match.group() for match in ESCAPED_REFERENCE_RE.finditer(payload))
    for pattern in QUOTED_REFERENCE_RES:
        raw_values.extend(match.group(1) for match in pattern.finditer(payload))
    for raw_value in raw_values:
        for raw in {raw_value, raw_value.rstrip(REFERENCE_TRAILING)}:
            normalized = raw.replace(b"\\/", b"/")
            try:
                value = normalized.decode("utf-8")
            except UnicodeDecodeError:
                continue
            if value in candidates:
                hits.add(value)
    return hits


def lexical_symlink_hits(
    source: Path,
    link_text: str,
    candidates: set[str],
) -> tuple[set[str], Path | None]:
    """Classify link text and its target lexically, without resolving links."""
    hits = extract_references(os.fsencode(link_text), candidates)
    target_text = os.fspath(link_text)
    if os.path.isabs(target_text):
        normalized = os.path.normpath(target_text)
    else:
        normalized = os.path.normpath(os.path.join(os.fspath(source.parent), target_text))
    repo_text = os.path.normpath(os.fspath(REPO))
    try:
        inside_repo = os.path.commonpath((repo_text, normalized)) == repo_text
    except ValueError:
        inside_repo = False
    if not inside_repo:
        return hits, None
    relative = os.path.relpath(normalized, repo_text).replace(os.sep, "/")
    if relative in candidates:
        hits.add(relative)
    return hits, Path(normalized)


def validate_lexical_target_components(
    target: Path,
    source: Path,
    link_text: str,
) -> None:
    """Validate every in-repo target component without following symlinks."""
    try:
        relative = target.relative_to(REPO)
    except ValueError as error:
        raise ArchiveError(
            f"lexical symlink target escaped repository: {source} -> {link_text}"
        ) from error
    descriptor = os.open(REPO, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        parts = relative.parts
        for index, part in enumerate(parts):
            final = index == len(parts) - 1
            try:
                named = os.stat(part, dir_fd=descriptor, follow_symlinks=False)
            except FileNotFoundError as error:
                raise ArchiveError(
                    f"broken in-repo symlink target: {source} -> {link_text}"
                ) from error
            except OSError as error:
                raise ArchiveError(
                    f"in-repo symlink component cannot be classified: "
                    f"{source} -> {link_text}"
                ) from error
            if stat.S_ISLNK(named.st_mode):
                position = "final" if final else "intermediate"
                raise ArchiveError(
                    f"{position} in-repo symlink component is not followed: "
                    f"{source} -> {link_text}"
                )
            if not final and not stat.S_ISDIR(named.st_mode):
                raise ArchiveError(
                    f"unsafe non-directory symlink component: {source} -> {link_text}"
                )
            if final and not (
                stat.S_ISDIR(named.st_mode)
                or (stat.S_ISREG(named.st_mode) and named.st_nlink == 1)
            ):
                raise ArchiveError(
                    f"unsafe final symlink target type: {source} -> {link_text}"
                )
            flags = os.O_RDONLY | os.O_NOFOLLOW
            if stat.S_ISDIR(named.st_mode):
                flags |= os.O_DIRECTORY
            try:
                opened_fd = os.open(part, flags, dir_fd=descriptor)
            except OSError as error:
                raise ArchiveError(
                    f"in-repo symlink component changed while opening: "
                    f"{source} -> {link_text}"
                ) from error
            opened = os.fstat(opened_fd)
            if identity(named) != identity(opened):
                os.close(opened_fd)
                raise ArchiveError(
                    f"in-repo symlink component identity changed: "
                    f"{source} -> {link_text}"
                )
            os.close(descriptor)
            descriptor = opened_fd
    finally:
        os.close(descriptor)


def scan_symlink_reference(path: Path, candidates: set[str]) -> set[str]:
    try:
        link_text = os.readlink(path)
    except OSError as error:
        raise ArchiveError(f"cannot read symlink reference source: {path}") from error
    hits, lexical_target = lexical_symlink_hits(path, link_text, candidates)
    if lexical_target is None:
        return hits
    validate_lexical_target_components(lexical_target, path, link_text)
    return hits


def scan_reference_file(path: Path, candidates: set[str], overlap: int) -> set[str]:
    named = safe_regular(path)
    descriptor = os.open(path, os.O_RDONLY | os.O_NOFOLLOW)
    hits: set[str] = set()
    tail = b""
    try:
        before = os.fstat(descriptor)
        if identity(named) != identity(before):
            raise ArchiveError(f"reference input changed before scan: {path}")
        while block := os.read(descriptor, COPY_BLOCK):
            payload = tail + block
            hits.update(extract_references(payload, candidates))
            tail = payload[-overlap:]
        after = os.fstat(descriptor)
        if identity(before) != identity(after):
            raise ArchiveError(f"reference input changed while scanned: {path}")
    finally:
        os.close(descriptor)
    return hits


def reference_source_excluded(relative: str, candidates: set[str]) -> bool:
    if relative in candidates:
        return True
    # Cleanup provenance under this authenticated, tool-owned lane records the
    # candidate set itself; it is not a live consumer.  Its plan/manifests and
    # receipts remain protected by their independent hashes and provenance
    # checks.  No other run root is excluded from reference closure.
    if is_under(relative, LANE_ROOT_REL):
        return True
    return relative == LOCAL_RECEIPT.relative_to(REPO).as_posix()


def exact_reference_hits(candidates: list[Record]) -> dict[str, list[str]]:
    candidate_paths = {row.path for row in candidates}
    if not candidate_paths:
        return {}
    paths = set(git_paths("ls-files", "-z"))
    paths.update(git_paths("ls-files", "--others", "--exclude-standard", "-z"))
    # Ignored scratch evidence can still consume an artifact.  Include it even
    # though ordinary status output suppresses it; candidates themselves are
    # removed from the scan below.
    paths.update(git_paths("ls-files", "--others", "-z", "--", SCRATCH_RUNS_REL))
    hits: dict[str, list[str]] = {}
    overlap = max((len(path.encode()) for path in candidate_paths), default=0) + 64
    for relative in sorted(paths):
        if reference_source_excluded(relative, candidate_paths):
            continue
        path = REPO / relative
        try:
            info = path.lstat()
        except FileNotFoundError:
            continue
        if stat.S_ISLNK(info.st_mode):
            found = scan_symlink_reference(path, candidate_paths)
        elif stat.S_ISREG(info.st_mode) and info.st_nlink == 1:
            found = scan_reference_file(path, candidate_paths, overlap)
        else:
            continue
        for target in found:
            hits.setdefault(target, []).append(relative)
    return hits


def fresh_reference_check(candidates: list[Record]) -> None:
    hits = exact_reference_hits(candidates)
    if hits:
        sample = [(path, consumers[:3]) for path, consumers in sorted(hits.items())[:10]]
        raise ArchiveError(f"candidate references remain: {sample}")


def reference_closure(
    candidates: list[Record],
    preservation: list[Record],
    counters: dict[str, int],
) -> tuple[list[Record], list[Record], dict[str, int], int]:
    remaining = {row.path: row for row in candidates}
    retained = list(preservation)
    updated_counters = dict(counters)
    iterations = 0
    while remaining:
        hits = exact_reference_hits(sorted(remaining.values(), key=lambda row: row.path))
        promoted_paths = sorted(hits)
        if not promoted_paths:
            break
        iterations += 1
        for path in promoted_paths:
            row = remaining.pop(path)
            previous = updated_counters.get(row.label, 0)
            if previous <= 0:
                raise ArchiveError(f"candidate counter underflow: {row.label}")
            updated_counters[row.label] = previous - 1
            updated_counters["referenced"] = updated_counters.get("referenced", 0) + 1
            retained.append(dataclasses.replace(row, label="referenced", sha256=None))
        print(
            json.dumps(
                {
                    "reference_closure_iteration": iterations,
                    "promoted_files": len(promoted_paths),
                    "remaining_candidates": len(remaining),
                },
                sort_keys=True,
            ),
            flush=True,
        )
    result = sorted(remaining.values(), key=lambda row: row.path)
    retained.sort(key=lambda row: row.path)
    if {row.path for row in result} & {row.path for row in retained}:
        raise ArchiveError("reference closure candidate/preservation overlap")
    if sum(updated_counters.values()) != len(result) + len(retained):
        raise ArchiveError("reference closure counters do not cover the frozen census")
    referenced_count = sum(row.label == "referenced" for row in retained)
    if updated_counters.get("referenced", 0) != referenced_count:
        raise ArchiveError("reference closure referenced counter mismatch")
    return result, retained, updated_counters, iterations


def fresh_writer_check(candidates: list[Record]) -> None:
    candidate_paths = {row.path for row in candidates}
    candidate_parents = {
        str(parent)
        for row in candidates
        for parent in PurePosixPath(row.path).parents
        if is_under(str(parent), SCRATCH_RUNS_REL)
    }
    result = subprocess.run(
        ["lsof", "-Fn", "+D", str(SCRATCH_RUNS)],
        check=False,
        capture_output=True,
    )
    if result.returncode not in {0, 1} or (result.returncode == 1 and result.stderr):
        raise ArchiveError(f"lsof failed: {result.stderr.decode(errors='replace')[:500]}")
    open_hits: set[str] = set()
    prefix = str(REPO) + "/"
    for line in result.stdout.splitlines():
        if not line.startswith(b"n"):
            continue
        name = line[1:].decode(errors="replace")
        if name.startswith(prefix):
            relative = name[len(prefix) :]
            if relative in candidate_paths or relative in candidate_parents:
                open_hits.add(relative)
    if open_hits:
        raise ArchiveError(f"open candidate paths: {sorted(open_hits)[:10]}")
    processes = subprocess.run(
        ["ps", "-axo", "pid=,command="], check=True, stdout=subprocess.PIPE
    ).stdout.decode(errors="replace")
    process_hits = extract_references(processes.encode(), candidate_paths)
    if process_hits:
        raise ArchiveError(f"process command references candidates: {sorted(process_hits)[:10]}")


def preflight(candidates: list[Record], preservation: list[Record], *, allow_missing: bool) -> list[Record]:
    preserved_files_present(preservation)
    current_candidates, _current_preservation, _counters = census()
    frozen_by_path = {row.path: row for row in candidates}
    referenced_paths = {
        row.path for row in preservation if row.label == "referenced"
    }
    current_by_path = {row.path: row for row in current_candidates}
    unexpected = sorted(
        set(current_by_path) - set(frozen_by_path) - referenced_paths
    )
    if unexpected:
        raise ArchiveError(f"unexpected new mechanical candidates: {unexpected[:10]}")
    reclassified: list[str] = []
    classification_drift: list[str] = []
    for row in candidates:
        current = current_by_path.get(row.path)
        if current is None:
            if os.path.lexists(REPO / row.path):
                reclassified.append(row.path)
            elif not allow_missing:
                reclassified.append(row.path + " (missing)")
            continue
        if not metadata_equal(current, row):
            classification_drift.append(row.path)
    if reclassified or classification_drift:
        raise ArchiveError(
            "frozen candidate census drift: "
            f"reclassified={reclassified[:10]} metadata={classification_drift[:10]}"
        )
    remaining: list[Record] = []
    changed: list[str] = []
    for row in candidates:
        path = REPO / row.path
        if not os.path.lexists(path):
            if not allow_missing:
                changed.append(row.path + " (missing)")
            continue
        info = path.lstat()
        if not record_matches(row, info):
            changed.append(row.path)
        else:
            remaining.append(row)
    if changed:
        raise ArchiveError(f"candidate identity drift: {changed[:10]}")
    fresh_reference_check(candidates)
    fresh_writer_check(remaining)
    return remaining


def open_parent(relative: str) -> tuple[int, str]:
    validate_relative(relative)
    parts = PurePosixPath(relative).parts
    return open_directory("/".join(parts[:-1])), parts[-1]


def open_directory(relative: str) -> int:
    validate_relative(relative)
    parts = PurePosixPath(relative).parts
    descriptor = os.open(REPO, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        for part in parts:
            child = os.open(
                part,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=descriptor,
            )
            os.close(descriptor)
            descriptor = child
        return descriptor
    except BaseException:
        os.close(descriptor)
        raise


class HashingReader(io.RawIOBase):
    def __init__(self, descriptor: int, size: int) -> None:
        self.descriptor = descriptor
        self.remaining = size
        self.digest = hashlib.sha256()

    def readable(self) -> bool:
        return True

    def read(self, size: int = -1) -> bytes:
        if self.remaining == 0:
            return b""
        amount = self.remaining if size < 0 else min(size, self.remaining)
        block = os.read(self.descriptor, amount)
        if not block:
            raise ArchiveError("source truncated while archiving")
        self.remaining -= len(block)
        self.digest.update(block)
        return block


def content_line(row: Record, digest: str) -> bytes:
    if row.sha256 is None or digest != row.sha256:
        raise ArchiveError(f"streamed candidate hash differs from frozen plan: {row.path}")
    return canonical_bytes(
        {"path": row.path, "sha256": row.sha256, "size": row.size}
    ) + b"\n"


def build_archive(candidates: list[Record]) -> None:
    ensure_directory(DESTINATION)
    archive_tmp = ARCHIVE.with_name(ARCHIVE.name + ".tmp")
    content_tmp = LOCAL_CONTENT.with_name(LOCAL_CONTENT.name + ".tmp")
    for temporary in (archive_tmp, content_tmp):
        if os.path.lexists(temporary):
            safe_regular(temporary)
            temporary.unlink()
            fsync_directory(temporary.parent)
    zstd = shutil.which("zstd")
    if zstd is None:
        raise ArchiveError("zstd is not installed")
    version = subprocess.run(
        [zstd, "--version"], check=True, stdout=subprocess.PIPE
    ).stdout.decode(errors="replace")
    if "1.5.7" not in version:
        raise ArchiveError(f"expected zstd 1.5.7, got: {version.strip()}")
    archive_descriptor = os.open(
        archive_tmp,
        os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
        0o600,
    )
    with os.fdopen(archive_descriptor, "wb") as archive_handle:
        process = subprocess.Popen(
            zstd_encode_command(zstd),
            stdin=subprocess.PIPE,
            stdout=archive_handle,
        )
        if process.stdin is None:
            raise ArchiveError("zstd stdin is unavailable")
        try:
            with content_tmp.open("xb") as content_handle:
                with tarfile.open(fileobj=process.stdin, mode="w|", format=tarfile.PAX_FORMAT) as archive:
                    for index, row in enumerate(candidates, 1):
                        parent_fd, basename = open_parent(row.path)
                        descriptor = -1
                        try:
                            descriptor = os.open(
                                basename,
                                os.O_RDONLY | os.O_NOFOLLOW,
                                dir_fd=parent_fd,
                            )
                            before = os.fstat(descriptor)
                            if not record_matches(row, before):
                                raise ArchiveError(f"candidate changed: {row.path}")
                            reader = HashingReader(descriptor, row.size)
                            member = tarfile.TarInfo(row.path)
                            member.size = row.size
                            member.mode = stat.S_IMODE(row.mode)
                            member.uid = row.uid
                            member.gid = row.gid
                            member.mtime = row.mtime_ns // 1_000_000_000
                            member.uname = ""
                            member.gname = ""
                            archive.addfile(member, reader)
                            if reader.remaining:
                                raise ArchiveError(
                                    f"archive read incomplete: {row.path}"
                                )
                            after = os.fstat(descriptor)
                            if identity(before) != identity(after):
                                raise ArchiveError(
                                    f"candidate changed while read: {row.path}"
                                )
                            streamed_sha256 = reader.digest.hexdigest()
                            content_handle.write(content_line(row, streamed_sha256))
                        finally:
                            if descriptor >= 0:
                                os.close(descriptor)
                            os.close(parent_fd)
                        if index % PROGRESS_FILES == 0:
                            print(json.dumps({"archived_files": index}), flush=True)
                process.stdin.close()
                content_handle.flush()
                os.fsync(content_handle.fileno())
            returncode = process.wait()
            if returncode != 0:
                raise ArchiveError(f"zstd exited with status {returncode}")
            archive_handle.flush()
            os.fsync(archive_handle.fileno())
        except BaseException:
            if process.stdin and not process.stdin.closed:
                process.stdin.close()
            process.wait()
            raise
    safe_regular(archive_tmp)
    os.replace(archive_tmp, ARCHIVE)
    fsync_directory(DESTINATION)
    os.replace(content_tmp, LOCAL_CONTENT)
    fsync_directory(LANE_ROOT)


def copy_atomic(source: Path, destination: Path) -> None:
    safe_regular(source)
    temporary = destination.with_name(destination.name + ".tmp")
    if os.path.lexists(temporary):
        safe_regular(temporary)
        temporary.unlink()
        fsync_directory(destination.parent)
    if os.path.lexists(destination):
        safe_regular(destination)
        if hash_file(source) != hash_file(destination):
            raise ArchiveError(f"published file differs: {destination}")
        return
    source_fd = os.open(source, os.O_RDONLY | os.O_NOFOLLOW)
    destination_fd = os.open(
        temporary, os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW, 0o600
    )
    try:
        while block := os.read(source_fd, COPY_BLOCK):
            view = memoryview(block)
            while view:
                written = os.write(destination_fd, view)
                view = view[written:]
        os.fsync(destination_fd)
    finally:
        os.close(source_fd)
        os.close(destination_fd)
    if hash_file(source) != hash_file(temporary):
        raise ArchiveError(f"copy verification failed: {destination}")
    os.replace(temporary, destination)
    fsync_directory(destination.parent)


def read_content(path: Path) -> list[dict[str, Any]]:
    rows = [json.loads(line) for line in read_regular_bytes(path).splitlines() if line]
    required = {"path", "sha256", "size"}
    if any(set(row) != required for row in rows):
        raise ArchiveError(f"content manifest schema mismatch: {path}")
    paths = [row["path"] for row in rows]
    if paths != sorted(paths) or len(paths) != len(set(paths)):
        raise ArchiveError(f"content manifest order/uniqueness failure: {path}")
    for path_value in paths:
        validate_relative(path_value)
    return rows


def verify_archive(candidates: list[Record]) -> dict[str, Any]:
    safe_regular(ARCHIVE)
    compressed_before = hash_file(ARCHIVE)
    expected = read_content(DEST_CONTENT)
    if [row["path"] for row in expected] != [row.path for row in candidates]:
        raise ArchiveError("archive content manifest does not match candidate plan")
    zstd = shutil.which("zstd")
    if zstd is None:
        raise ArchiveError("zstd is not installed")
    process = subprocess.Popen(
        zstd_decode_command(zstd, ARCHIVE), stdout=subprocess.PIPE
    )
    if process.stdout is None:
        raise ArchiveError("zstd stdout is unavailable")
    count = 0
    try:
        with tarfile.open(fileobj=process.stdout, mode="r|*") as archive:
            for count, (member, wanted, source) in enumerate(
                zip(archive, expected, candidates, strict=True), 1
            ):
                validate_relative(member.name)
                if not member.isreg() or member.name != wanted["path"]:
                    raise ArchiveError(f"unexpected archive member: {member.name}")
                if member.size != wanted["size"] or member.size != source.size:
                    raise ArchiveError(f"archive member size mismatch: {member.name}")
                if source.sha256 is None or wanted["sha256"] != source.sha256:
                    raise ArchiveError(f"frozen content hash mismatch: {member.name}")
                extracted = archive.extractfile(member)
                if extracted is None:
                    raise ArchiveError(f"cannot stream archive member: {member.name}")
                digest = hashlib.sha256()
                size = 0
                while block := extracted.read(COPY_BLOCK):
                    digest.update(block)
                    size += len(block)
                if size != member.size or digest.hexdigest() != wanted["sha256"]:
                    raise ArchiveError(f"archive member hash mismatch: {member.name}")
                if count % PROGRESS_FILES == 0:
                    print(json.dumps({"verified_files": count}), flush=True)
        returncode = process.wait()
        if returncode != 0:
            raise ArchiveError(f"zstd verification exited with status {returncode}")
    except BaseException:
        process.kill()
        process.wait()
        raise
    if count != len(candidates):
        raise ArchiveError(f"archive member count mismatch: {count} != {len(candidates)}")
    compressed_after = hash_file(ARCHIVE)
    if compressed_before != compressed_after:
        raise ArchiveError("compressed archive changed during stream verification")
    archive_info = safe_regular(ARCHIVE)
    return {
        "archive_bytes": archive_info.st_size,
        "archive_sha256": compressed_after,
        "candidate_content_sha256": hash_file(DEST_CONTENT),
        "verified_files": count,
    }


def archive_command() -> None:
    plan, candidates, preservation = load_plan()
    preflight(candidates, preservation, allow_missing=False)
    ensure_directory(DESTINATION)
    if not os.path.lexists(ARCHIVE) or not os.path.lexists(LOCAL_CONTENT):
        build_archive(candidates)
    copy_atomic(LOCAL_CONTENT, DEST_CONTENT)
    copy_atomic(PLAN, DEST_PLAN)
    copy_atomic(CANDIDATES, DEST_CANDIDATES)
    copy_atomic(PRESERVATION, DEST_PRESERVATION)
    verification = verify_archive(candidates)
    receipt = new_receipt(
        plan,
        "ARCHIVE_VERIFIED",
        archive_verification=verification,
        archive_verified_utc=utc_now(),
        removed_totals={"files": 0, "logical_bytes": 0, "allocated_bytes": 0},
    )
    publish_receipt(receipt)
    print(json.dumps({"status": "ARCHIVE_VERIFIED", **verification}, sort_keys=True))


def unlink_authenticated_at(parent_fd: int, basename: str, row: Record) -> None:
    descriptor = -1
    try:
        descriptor = os.open(basename, os.O_RDONLY | os.O_NOFOLLOW, dir_fd=parent_fd)
        opened = os.fstat(descriptor)
        named = os.stat(basename, dir_fd=parent_fd, follow_symlinks=False)
        if not record_matches(row, opened) or identity(opened) != identity(named):
            raise ArchiveError(f"candidate changed before unlink: {row.path}")
        os.unlink(basename, dir_fd=parent_fd)
    finally:
        if descriptor >= 0:
            os.close(descriptor)


def execute() -> None:
    plan, candidates, preservation = load_plan()
    receipt = load_receipt(plan)
    if receipt.get("status") not in {"ARCHIVE_VERIFIED", "PARTIAL", "COMPLETE"}:
        raise ArchiveError("archive must be independently verified before execute")
    verification = verify_archive(candidates)
    if verification != receipt.get("archive_verification"):
        raise ArchiveError("archive verification differs from receipt")
    remaining = preflight(candidates, preservation, allow_missing=True)
    prior_pending = receipt.get("pending_parent_fsync", [])
    if not isinstance(prior_pending, list) or not all(
        isinstance(parent, str) for parent in prior_pending
    ):
        raise ArchiveError("receipt pending_parent_fsync is invalid")
    groups: dict[str, list[Record]] = {}
    for row in remaining:
        parent = str(PurePosixPath(row.path).parent)
        groups.setdefault(parent, []).append(row)
    for parent in prior_pending:
        validate_relative(parent)
        groups.setdefault(parent, [])
    wal_parents = load_or_create_parent_wal(plan, set(groups))
    for parent in wal_parents:
        groups.setdefault(parent, [])
    removed_now: list[Record] = []
    errors: list[dict[str, str]] = []
    pending_parent_fsync: set[str] = set()
    attempted = 0
    for parent, rows in sorted(groups.items()):
        try:
            parent_fd = open_directory(parent)
        except (ArchiveError, OSError) as error:
            errors.append({"path": parent, "error": f"open parent: {error}"})
            pending_parent_fsync.add(parent)
            continue
        try:
            for row in rows:
                attempted += 1
                try:
                    unlink_authenticated_at(
                        parent_fd, PurePosixPath(row.path).name, row
                    )
                    removed_now.append(row)
                except (ArchiveError, OSError) as error:
                    errors.append({"path": row.path, "error": str(error)})
                if attempted % PROGRESS_FILES == 0:
                    print(
                        json.dumps(
                            {"unlinked_files": attempted, "errors": len(errors)}
                        ),
                        flush=True,
                    )
            try:
                os.fsync(parent_fd)
            except OSError as error:
                errors.append({"path": parent, "error": f"parent fsync: {error}"})
                pending_parent_fsync.add(parent)
        finally:
            os.close(parent_fd)
    still_present = [row for row in candidates if os.path.lexists(REPO / row.path)]
    removed_all = [row for row in candidates if not os.path.lexists(REPO / row.path)]
    status_value = (
        "COMPLETE"
        if not errors and not still_present and not pending_parent_fsync
        else "PARTIAL"
    )
    updated = new_receipt(
        plan,
        status_value,
        archive_verification=verification,
        archive_verified_utc=receipt.get("archive_verified_utc"),
        completed_utc=utc_now() if status_value == "COMPLETE" else None,
        errors=errors[:100],
        pending_parent_fsync=sorted(pending_parent_fsync),
        removed_totals=totals(removed_all),
        still_present_count=len(still_present),
        still_present_sample=[row.path for row in still_present[:100]],
    )
    publish_receipt(updated)
    if status_value == "COMPLETE":
        clear_parent_wal()
    print(json.dumps({"status": status_value, **totals(removed_now)}, sort_keys=True))
    if status_value != "COMPLETE":
        raise ArchiveError("unlink pass incomplete; resume execute after resolving errors")


def verify_command() -> None:
    plan, candidates, preservation = load_plan()
    receipt = load_receipt(plan)
    if receipt.get("status") != "COMPLETE":
        raise ArchiveError("receipt is not COMPLETE")
    if os.path.lexists(PARENT_FSYNC_WAL):
        raise ArchiveError("parent fsync WAL remains; resume execute before verify")
    verification = verify_archive(candidates)
    if verification != receipt.get("archive_verification"):
        raise ArchiveError("archive verification differs from COMPLETE receipt")
    present = [row.path for row in candidates if os.path.lexists(REPO / row.path)]
    if present:
        raise ArchiveError(f"candidate files reappeared: {present[:10]}")
    preserved_files_present(preservation)
    if not os.path.lexists(DEST_RECEIPT):
        raise ArchiveError("NFS receipt is missing")
    destination_receipt = json.loads(read_regular_bytes(DEST_RECEIPT))
    if destination_receipt != receipt or destination_receipt.get("receipt_sha256") != self_hash(destination_receipt):
        raise ArchiveError("local/NFS receipt mismatch")
    for local, remote in (
        (PLAN, DEST_PLAN),
        (CANDIDATES, DEST_CANDIDATES),
        (PRESERVATION, DEST_PRESERVATION),
        (LOCAL_CONTENT, DEST_CONTENT),
    ):
        if hash_file(local) != hash_file(remote):
            raise ArchiveError(f"local/NFS manifest mismatch: {remote}")
    print(json.dumps({"status": "VERIFIED_COMPLETE", **receipt["removed_totals"]}, sort_keys=True))


def acquire_lock() -> BinaryIO:
    ensure_directory(LOCK.parent)
    if os.path.lexists(LOCK):
        safe_regular(LOCK)
    descriptor = os.open(
        LOCK, os.O_RDWR | os.O_CREAT | os.O_NOFOLLOW, 0o600
    )
    opened = os.fstat(descriptor)
    named = LOCK.lstat()
    if identity(opened) != identity(named):
        os.close(descriptor)
        raise ArchiveError("archive lock changed while opening")
    handle = os.fdopen(descriptor, "a+b")
    try:
        fcntl.flock(handle.fileno(), fcntl.LOCK_EX | fcntl.LOCK_NB)
    except OSError as error:
        handle.close()
        raise ArchiveError("another scratch/runs mover holds the lock") from error
    return handle


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("command", choices=("freeze", "archive", "execute", "verify"))
    arguments = parser.parse_args()
    if os.path.lexists(CHECKPOINT_LOCK_REPAIR_WAL):
        raise ArchiveError(
            "checkpoint/lock manifest-chain repair is active; resume its repair helper"
        )
    lock_handle = acquire_lock()
    try:
        if arguments.command == "freeze":
            freeze()
        elif arguments.command == "archive":
            archive_command()
        elif arguments.command == "execute":
            execute()
        else:
            verify_command()
    finally:
        lock_handle.close()


if __name__ == "__main__":
    try:
        main()
    except (ArchiveError, OSError, subprocess.SubprocessError, tarfile.TarError) as error:
        print(f"ERROR: {error}", file=sys.stderr)
        raise SystemExit(1)
