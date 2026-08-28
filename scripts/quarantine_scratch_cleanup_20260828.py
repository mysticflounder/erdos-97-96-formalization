"""Move a narrow, authenticated scratch cleanup set to NFS quarantine."""

from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import json
import os
import re
import stat
import subprocess
from pathlib import Path, PurePosixPath
from typing import Any

REPO = Path(__file__).resolve().parents[1]
SCRATCH = REPO / "scratch"
RECEIPT = REPO / "certificates/scratch_worktree_cleanup_quarantine_20260828_v1.json"
EXPECTED_BASE_HEAD = "7cf1e60bde589fe27c246c0edbc7ad20e96d6db3"
EXPECTED_FROZEN_RECEIPT_SHA256 = (
    "396096ed7b7b873961dfd4471ad020decaa94748af0dadec57f436bc322aa4f6"
)
EXPECTED_CANDIDATE_SET_SHA256 = (
    "15a51986c64528e5b6206f8568e01d95b3f8cf8c277b35e28981768f25af6214"
)
DESTINATION = Path("/opt/nfs/erdos-97-96-formalization-scratch-quarantine-20260828")
TARGET_ROOTS = (
    "scratch/.audit-quarantine",
    "scratch/quarantine",
    "scratch/v5-debug",
    "scratch/v6-debug",
    "scratch/v7-debug",
)
PROTECTED_ROOT_FILES = {
    "scratch/exact17-forty-ninth-v8-validation.json",
    "scratch/exact17-forty-ninth-v9-publish-output.json",
    "scratch/exact17-forty-ninth-v9-validation.json",
}
ROOT_FILE_PATTERN = re.compile(
    r"(?:hygiene|dry-run|snapshot|recall|status|audit|validation|output|static|trace)",
    re.IGNORECASE,
)
ROOT_FILE_SUFFIXES = {".json", ".log", ".out", ".txt"}
COPY_BLOCK_BYTES = 8 * 1024 * 1024
ALLOWED_REFERENCE_PATHS = {
    "certificates/scratch_worktree_cleanup_quarantine_20260828_v1.json",
    "docs/audits/2026-08-28-scratch-worktree-cleanup.md",
    "proof-status/baseline/dirty-files.txt",
    "scratch/runs/exact17-sparse-six-nextcenter-split-20260820/cell-campaign-v1/artifacts/hygiene-report.json",
    "scratch/runs/exact17-sparse-six-nextcenter-split-20260820/cell-campaign-v1/artifacts/staged-hygiene-report.json",
    "scratch/runs/freshthird-u3-source-ingress-20260819/run-0001/artifacts/hygiene-report.json",
    "scripts/quarantine_scratch_cleanup_20260828.py",
}


class CleanupError(RuntimeError):
    pass


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


def candidate_set_hash(records: list[dict[str, Any]]) -> str:
    return hashlib.sha256(canonical_bytes(records)).hexdigest()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(COPY_BLOCK_BYTES), b""):
            digest.update(block)
    return digest.hexdigest()


def write_json_atomic(path: Path, value: dict[str, Any], *, replace: bool) -> None:
    temporary = path.with_name(path.name + ".tmp")
    if os.path.lexists(temporary):
        raise CleanupError(f"temporary output exists: {temporary}")
    if os.path.lexists(path):
        info = path.lstat()
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise CleanupError(f"unsafe existing output: {path}")
        if not replace:
            raise CleanupError(f"refusing to overwrite: {path}")
    payload = canonical_bytes(value) + b"\n"
    with temporary.open("xb") as handle:
        handle.write(payload)
        handle.flush()
        os.fsync(handle.fileno())
    os.replace(temporary, path)
    fsync_directory(path.parent)


def validate_relative(relative: str) -> None:
    pure = PurePosixPath(relative)
    if (
        not relative
        or pure.is_absolute()
        or ".." in pure.parts
        or not relative.startswith("scratch/")
    ):
        raise CleanupError(f"unsafe path: {relative!r}")
    if any(char in relative for char in "\t\r\n"):
        raise CleanupError(f"unsupported path characters: {relative!r}")


def git_output(*args: str) -> bytes:
    return subprocess.run(
        ["git", *args], cwd=REPO, check=True, stdout=subprocess.PIPE
    ).stdout


def tracked_paths() -> set[str]:
    return {
        item.decode()
        for item in git_output("ls-files", "-z", "--", "scratch").split(b"\0")
        if item
    }


def untracked_root_files() -> list[str]:
    rows = git_output(
        "ls-files", "--others", "--exclude-standard", "-z", "--", "scratch"
    )
    candidates: list[str] = []
    for raw in rows.split(b"\0"):
        if not raw:
            continue
        relative = raw.decode()
        pure = PurePosixPath(relative)
        if len(pure.parts) != 2 or relative in PROTECTED_ROOT_FILES:
            continue
        if (
            pure.suffix.lower() in ROOT_FILE_SUFFIXES
            and ROOT_FILE_PATTERN.search(pure.name)
        ):
            candidates.append(relative)
    return sorted(candidates)


def walk_target(root_relative: str) -> list[str]:
    root = REPO / root_relative
    if not root.is_dir() or root.is_symlink():
        raise CleanupError(f"target root is missing or unsafe: {root_relative}")
    rows: list[str] = []
    for directory, dirnames, filenames in os.walk(root, followlinks=False):
        base = Path(directory)
        for name in dirnames:
            child = base / name
            info = child.lstat()
            if not stat.S_ISDIR(info.st_mode) or stat.S_ISLNK(info.st_mode):
                raise CleanupError(f"unsafe directory entry: {child}")
            if info.st_dev != SCRATCH.lstat().st_dev:
                raise CleanupError(f"nested mount/device boundary: {child}")
        for name in filenames:
            child = base / name
            info = child.lstat()
            if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
                raise CleanupError(f"unsafe file entry: {child}")
            rows.append(child.relative_to(REPO).as_posix())
    return sorted(rows)


def candidate_paths() -> list[str]:
    rows = untracked_root_files()
    for root in TARGET_ROOTS:
        rows.extend(walk_target(root))
    rows = sorted(rows)
    if len(rows) != len(set(rows)):
        raise CleanupError("duplicate candidate path")
    tracked = tracked_paths()
    overlap = sorted(tracked.intersection(rows))
    if overlap:
        raise CleanupError(f"tracked candidate overlap: {overlap[:10]}")
    return rows


def path_record(relative: str) -> dict[str, Any]:
    validate_relative(relative)
    path = REPO / relative
    info = path.lstat()
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
        raise CleanupError(f"candidate is not a unique regular file: {relative}")
    if info.st_dev != SCRATCH.lstat().st_dev:
        raise CleanupError(f"candidate crosses scratch device: {relative}")
    return {
        "allocated_bytes": info.st_blocks * 512,
        "device": info.st_dev,
        "gid": info.st_gid,
        "inode": info.st_ino,
        "mode": info.st_mode,
        "mtime_ns": info.st_mtime_ns,
        "path": relative,
        "sha256": sha256_file(path),
        "size": info.st_size,
        "uid": info.st_uid,
    }


def totals(records: list[dict[str, Any]]) -> dict[str, int]:
    return {
        "allocated_bytes": sum(record["allocated_bytes"] for record in records),
        "files": len(records),
        "logical_bytes": sum(record["size"] for record in records),
    }


def current_head() -> str:
    return git_output("rev-parse", "HEAD").decode().strip()


def base_is_ancestor() -> bool:
    return (
        subprocess.run(
            ["git", "merge-base", "--is-ancestor", EXPECTED_BASE_HEAD, "HEAD"],
            cwd=REPO,
            check=False,
        ).returncode
        == 0
    )


def plan() -> None:
    if RECEIPT.exists():
        raise CleanupError(f"receipt already exists: {RECEIPT}")
    records = [path_record(relative) for relative in candidate_paths()]
    receipt: dict[str, Any] = {
        "base_head": EXPECTED_BASE_HEAD,
        "candidate_roots": list(TARGET_ROOTS),
        "candidates": records,
        "created_utc": utc_now(),
        "destination": str(DESTINATION),
        "execution": None,
        "lane_id": "scratch-worktree-cleanup-20260828",
        "protected_root_files": sorted(PROTECTED_ROOT_FILES),
        "schema": "scratch-worktree-cleanup-quarantine/v1",
        "status": "FROZEN",
        "totals": totals(records),
    }
    receipt["receipt_sha256"] = self_hash(receipt)
    write_json_atomic(RECEIPT, receipt, replace=False)
    print(json.dumps({"status": "FROZEN", **receipt["totals"]}, sort_keys=True))


def load_receipt() -> dict[str, Any]:
    value = json.loads(read_regular_bytes(RECEIPT).decode())
    if value.get("schema") != "scratch-worktree-cleanup-quarantine/v1":
        raise CleanupError("wrong receipt schema")
    if value.get("receipt_sha256") != self_hash(value):
        raise CleanupError("receipt self-hash mismatch")
    if value.get("base_head") != EXPECTED_BASE_HEAD:
        raise CleanupError("wrong receipt base head")
    if value.get("destination") != str(DESTINATION):
        raise CleanupError("wrong receipt destination")
    if candidate_set_hash(value.get("candidates", [])) != EXPECTED_CANDIDATE_SET_SHA256:
        raise CleanupError("receipt candidate set does not match the reviewed plan")
    if value.get("status") == "FROZEN":
        if value["receipt_sha256"] != EXPECTED_FROZEN_RECEIPT_SHA256:
            raise CleanupError("frozen receipt does not match the reviewed plan")
    elif value.get("frozen_receipt_sha256") != EXPECTED_FROZEN_RECEIPT_SHA256:
        raise CleanupError("execution receipt lost its frozen-plan binding")
    return value


def stat_matches(path: Path, record: dict[str, Any]) -> bool:
    info = path.lstat()
    return (
        stat.S_ISREG(info.st_mode)
        and info.st_nlink == 1
        and info.st_dev == record["device"]
        and info.st_ino == record["inode"]
        and info.st_mode == record["mode"]
        and info.st_size == record["size"]
        and info.st_mtime_ns == record["mtime_ns"]
    )


def fsync_directory(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def fsync_directory_fd(descriptor: int) -> None:
    os.fsync(descriptor)


def read_regular_bytes(path: Path) -> bytes:
    info = path.lstat()
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
        raise CleanupError(f"unsafe file: {path}")
    descriptor = os.open(path, os.O_RDONLY | os.O_NOFOLLOW)
    try:
        opened = os.fstat(descriptor)
        if opened.st_dev != info.st_dev or opened.st_ino != info.st_ino:
            raise CleanupError(f"file identity changed while opening: {path}")
        chunks: list[bytes] = []
        while block := os.read(descriptor, COPY_BLOCK_BYTES):
            chunks.append(block)
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def verified_regular_file(path: Path, expected_sha256: str) -> bool:
    try:
        info = path.lstat()
    except FileNotFoundError:
        return False
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
        return False
    descriptor = os.open(path, os.O_RDONLY | os.O_NOFOLLOW)
    try:
        opened = os.fstat(descriptor)
        if (
            opened.st_dev != info.st_dev
            or opened.st_ino != info.st_ino
            or opened.st_nlink != 1
        ):
            return False
        digest = hashlib.sha256()
        while block := os.read(descriptor, COPY_BLOCK_BYTES):
            digest.update(block)
        return digest.hexdigest() == expected_sha256
    finally:
        os.close(descriptor)


def verify_destination_parent(path: Path) -> None:
    destination_info = DESTINATION.lstat()
    if not stat.S_ISDIR(destination_info.st_mode) or stat.S_ISLNK(
        destination_info.st_mode
    ):
        raise CleanupError(f"unsafe destination root: {DESTINATION}")
    relative = path.relative_to(DESTINATION)
    current = DESTINATION
    for part in relative.parts:
        current /= part
        if os.path.lexists(current):
            info = current.lstat()
            if not stat.S_ISDIR(info.st_mode) or stat.S_ISLNK(info.st_mode):
                raise CleanupError(f"unsafe destination directory: {current}")
        else:
            current.mkdir()
            info = current.lstat()
            if not stat.S_ISDIR(info.st_mode) or stat.S_ISLNK(info.st_mode):
                raise CleanupError(f"unsafe created destination directory: {current}")
        fsync_directory(current)
        fsync_directory(current.parent)


def ensure_destination_root() -> None:
    if os.path.lexists(DESTINATION):
        info = DESTINATION.lstat()
        if not stat.S_ISDIR(info.st_mode) or stat.S_ISLNK(info.st_mode):
            raise CleanupError(f"unsafe destination root: {DESTINATION}")
        fsync_directory(DESTINATION)
        fsync_directory(DESTINATION.parent)
        return
    DESTINATION.mkdir(parents=True)
    info = DESTINATION.lstat()
    if not stat.S_ISDIR(info.st_mode) or stat.S_ISLNK(info.st_mode):
        raise CleanupError(f"unsafe created destination root: {DESTINATION}")
    fsync_directory(DESTINATION)
    fsync_directory(DESTINATION.parent)


def hash_open_file(handle: Any) -> str:
    digest = hashlib.sha256()
    handle.seek(0)
    for block in iter(lambda: handle.read(COPY_BLOCK_BYTES), b""):
        digest.update(block)
    return digest.hexdigest()


def tracked_reference_hits(records: list[dict[str, Any]]) -> list[str]:
    patterns = ("\n".join(record["path"] for record in records) + "\n").encode()
    result = subprocess.run(
        ["git", "grep", "-l", "-F", "-f", "-", "--", "."],
        cwd=REPO,
        input=patterns,
        capture_output=True,
        check=False,
    )
    if result.returncode not in {0, 1}:
        raise CleanupError(f"tracked reference scan failed: {result.stderr.decode()}")
    return sorted(
        path
        for path in result.stdout.decode().splitlines()
        if path not in ALLOWED_REFERENCE_PATHS
    )


def untracked_reference_hits(records: list[dict[str, Any]]) -> list[str]:
    candidate_paths_set = {record["path"] for record in records}
    needles = sorted(candidate_paths_set | set(TARGET_ROOTS), key=len, reverse=True)
    pattern = re.compile(b"|".join(re.escape(item.encode()) for item in needles))
    rows = git_output("ls-files", "--others", "--exclude-standard", "-z")
    hits: list[str] = []
    governance_roots = {
        ".codex",
        "census",
        "certificates",
        "docs",
        "lean",
        "proof-status",
        "scripts",
    }
    text_suffixes = {".lean", ".md", ".py", ".sh", ".toml", ".txt", ".yaml", ".yml"}
    governed_json_terms = {
        "audit",
        "catalog",
        "checkpoint",
        "index",
        "manifest",
        "plan",
        "receipt",
        "report",
        "status",
    }
    for raw in rows.split(b"\0"):
        if not raw:
            continue
        relative = raw.decode()
        if (
            relative in candidate_paths_set
            or relative in ALLOWED_REFERENCE_PATHS
        ):
            continue
        pure = PurePosixPath(relative)
        name_lower = pure.name.lower()
        should_scan = (
            pure.suffix.lower() in text_suffixes
            or pure.parts[0] in governance_roots
            or (
                pure.suffix.lower() == ".json"
                and any(term in name_lower for term in governed_json_terms)
            )
        )
        if not should_scan:
            continue
        path = REPO / relative
        try:
            info = path.lstat()
        except FileNotFoundError:
            continue
        if (
            not stat.S_ISREG(info.st_mode)
            or info.st_nlink != 1
            or info.st_size > 32 * 1024 * 1024
        ):
            continue
        if pattern.search(read_regular_bytes(path)):
            hits.append(relative)
            if len(hits) >= 20:
                break
    return sorted(hits)


def active_open_files(records: list[dict[str, Any]]) -> list[str]:
    paths = [
        str(REPO / record["path"])
        for record in records
        if os.path.lexists(REPO / record["path"])
    ]
    if not paths:
        return []
    result = subprocess.run(
        ["lsof", "-n", "-P", "--", *paths],
        cwd=REPO,
        capture_output=True,
        check=False,
    )
    if result.returncode not in {0, 1}:
        raise CleanupError(f"open-file scan failed: {result.stderr.decode()}")
    return result.stdout.decode().splitlines()


def open_source_parent(relative: str) -> tuple[int, str]:
    validate_relative(relative)
    parts = PurePosixPath(relative).parts
    descriptor = os.open(REPO, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        for part in parts[:-1]:
            child = os.open(
                part,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=descriptor,
            )
            os.close(descriptor)
            descriptor = child
        return descriptor, parts[-1]
    except BaseException:
        os.close(descriptor)
        raise


def copy_verify_unlink(record: dict[str, Any]) -> str:
    relative = record["path"]
    validate_relative(relative)
    destination = DESTINATION / relative
    verify_destination_parent(destination.parent)
    temporary = destination.with_name(destination.name + ".partial")
    if os.path.lexists(temporary):
        raise CleanupError(f"partial destination exists: {temporary}")
    parent_descriptor, source_name = open_source_parent(relative)
    try:
        try:
            source_descriptor = os.open(
                source_name,
                os.O_RDONLY | os.O_NOFOLLOW,
                dir_fd=parent_descriptor,
            )
        except FileNotFoundError:
            if not verified_regular_file(destination, record["sha256"]):
                raise CleanupError(
                    f"source absent without verified destination: {relative}"
                )
            return "already_moved"
        with os.fdopen(source_descriptor, "rb") as source_handle:
            opened_info = os.fstat(source_handle.fileno())
            if (
                not stat.S_ISREG(opened_info.st_mode)
                or opened_info.st_nlink != 1
                or opened_info.st_dev != record["device"]
                or opened_info.st_ino != record["inode"]
                or opened_info.st_mode != record["mode"]
                or opened_info.st_size != record["size"]
                or opened_info.st_mtime_ns != record["mtime_ns"]
            ):
                raise CleanupError(f"opened source identity drift: {relative}")
            if os.path.lexists(destination):
                if not verified_regular_file(destination, record["sha256"]):
                    raise CleanupError(f"destination collision: {destination}")
            else:
                digest = hashlib.sha256()
                destination_descriptor = os.open(
                    temporary,
                    os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
                    0o600,
                )
                out = os.fdopen(destination_descriptor, "wb")
                try:
                    source_handle.seek(0)
                    for block in iter(
                        lambda: source_handle.read(COPY_BLOCK_BYTES), b""
                    ):
                        digest.update(block)
                        out.write(block)
                    out.flush()
                    os.fsync(out.fileno())
                finally:
                    out.close()
                if digest.hexdigest() != record["sha256"]:
                    temporary.unlink(missing_ok=True)
                    raise CleanupError(
                        f"source content drift while copying: {relative}"
                    )
                os.chmod(temporary, stat.S_IMODE(record["mode"]))
                os.utime(temporary, ns=(record["mtime_ns"], record["mtime_ns"]))
                if not verified_regular_file(temporary, record["sha256"]):
                    temporary.unlink(missing_ok=True)
                    raise CleanupError(
                        f"destination verification failed: {relative}"
                    )
                os.replace(temporary, destination)
                fsync_directory(destination.parent)
            if not verified_regular_file(destination, record["sha256"]):
                raise CleanupError(f"final destination verification failed: {relative}")
            fsync_directory(destination.parent)
            if hash_open_file(source_handle) != record["sha256"]:
                raise CleanupError(f"source changed before unlink: {relative}")
            name_info = os.stat(
                source_name,
                dir_fd=parent_descriptor,
                follow_symlinks=False,
            )
            if (
                not stat.S_ISREG(name_info.st_mode)
                or name_info.st_nlink != 1
                or name_info.st_dev != opened_info.st_dev
                or name_info.st_ino != opened_info.st_ino
                or name_info.st_mode != opened_info.st_mode
                or name_info.st_size != opened_info.st_size
                or name_info.st_mtime_ns != opened_info.st_mtime_ns
            ):
                raise CleanupError(f"source name changed before unlink: {relative}")
            os.unlink(source_name, dir_fd=parent_descriptor)
            fsync_directory_fd(parent_descriptor)
        return "moved"
    finally:
        os.close(parent_descriptor)


def destination_receipt_path() -> Path:
    return DESTINATION / "_manifest/scratch_worktree_cleanup_quarantine_20260828_v1.json"


def execute() -> None:
    receipt = load_receipt()
    if receipt.get("status") == "COMPLETE":
        publish_destination_receipt(receipt)
        print(json.dumps({"status": "COMPLETE_RECEIPT_REPUBLISHED"}, sort_keys=True))
        return
    if receipt.get("status") not in {"FROZEN", "PARTIAL"}:
        raise CleanupError(f"receipt status is not executable: {receipt.get('status')}")
    if not base_is_ancestor():
        raise CleanupError("cleanup base is not an ancestor of current HEAD")
    tracked_overlap = sorted(
        tracked_paths().intersection(record["path"] for record in receipt["candidates"])
    )
    if tracked_overlap:
        raise CleanupError(f"candidate became tracked: {tracked_overlap[:10]}")
    if receipt["status"] == "FROZEN" and candidate_paths() != [
        record["path"] for record in receipt["candidates"]
    ]:
        raise CleanupError("candidate predicate changed after freeze")
    reference_hits = tracked_reference_hits(receipt["candidates"])
    if reference_hits:
        raise CleanupError(f"unexpected tracked references: {reference_hits[:20]}")
    untracked_hits = untracked_reference_hits(receipt["candidates"])
    if untracked_hits:
        raise CleanupError(f"unexpected untracked references: {untracked_hits[:20]}")
    open_files = active_open_files(receipt["candidates"])
    if open_files:
        raise CleanupError(f"candidate files are open: {open_files[:20]}")
    ensure_destination_root()
    moved = already_moved = 0
    errors: list[dict[str, str]] = []
    for record in receipt["candidates"]:
        try:
            result = copy_verify_unlink(record)
            moved += result == "moved"
            already_moved += result == "already_moved"
        except (CleanupError, OSError) as error:
            errors.append({"error": str(error), "path": record["path"]})
            break
    missing_destinations = [
        record["path"]
        for record in receipt["candidates"]
        if not verified_regular_file(
            DESTINATION / record["path"], record["sha256"]
        )
    ]
    remaining_sources = [
        record["path"]
        for record in receipt["candidates"]
        if os.path.lexists(REPO / record["path"])
    ]
    complete = not errors and not missing_destinations and not remaining_sources
    updated = {
        **{key: value for key, value in receipt.items() if key != "receipt_sha256"},
        "execution": {
            "already_moved": already_moved,
            "completed_utc": utc_now() if complete else None,
            "errors": errors,
            "execution_head": current_head(),
            "missing_destination_count": len(missing_destinations),
            "moved": moved,
            "open_file_scan": "PASS_NO_OPEN_CANDIDATES",
            "reference_scan": "PASS_ONLY_ALLOWED_TRACKED_AND_UNTRACKED_REFERENCES",
            "remaining_source_count": len(remaining_sources),
        },
        "frozen_receipt_sha256": EXPECTED_FROZEN_RECEIPT_SHA256,
        "status": "COMPLETE" if complete else "PARTIAL",
    }
    updated["receipt_sha256"] = self_hash(updated)
    write_json_atomic(RECEIPT, updated, replace=True)
    if complete:
        publish_destination_receipt(updated)
    print(
        json.dumps(
            {
                "already_moved": already_moved,
                "errors": len(errors),
                "moved": moved,
                "status": updated["status"],
            },
            sort_keys=True,
        )
    )
    if not complete:
        raise CleanupError("quarantine move incomplete; inspect receipt")


def publish_destination_receipt(receipt: dict[str, Any]) -> None:
    destination_receipt = destination_receipt_path()
    verify_destination_parent(destination_receipt.parent)
    payload = canonical_bytes(receipt) + b"\n"
    if os.path.lexists(destination_receipt):
        if read_regular_bytes(destination_receipt) != payload:
            raise CleanupError("destination receipt collision")
        return
    temporary = destination_receipt.with_name(destination_receipt.name + ".partial")
    with temporary.open("xb") as handle:
        handle.write(payload)
        handle.flush()
        os.fsync(handle.fileno())
    os.replace(temporary, destination_receipt)
    fsync_directory(destination_receipt.parent)
    if read_regular_bytes(destination_receipt) != payload:
        raise CleanupError("destination receipt verification failed")


def verify() -> None:
    receipt = load_receipt()
    if receipt.get("status") != "COMPLETE":
        raise CleanupError("cleanup receipt is not complete")
    failures: list[str] = []
    for record in receipt["candidates"]:
        if os.path.lexists(REPO / record["path"]):
            failures.append(f"source-present:{record['path']}")
        destination = DESTINATION / record["path"]
        if not verified_regular_file(destination, record["sha256"]):
            failures.append(f"destination-invalid:{record['path']}")
        if len(failures) >= 20:
            break
    destination_receipt = destination_receipt_path()
    try:
        receipts_match = read_regular_bytes(destination_receipt) == read_regular_bytes(
            RECEIPT
        )
    except (CleanupError, FileNotFoundError):
        receipts_match = False
    if not receipts_match:
        failures.append("destination-receipt-mismatch")
    if failures:
        raise CleanupError(f"verification failures: {failures}")
    print(json.dumps({"status": "VERIFIED", **receipt["totals"]}, sort_keys=True))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("command", choices=("plan", "execute", "verify"))
    args = parser.parse_args()
    if args.command == "plan":
        plan()
    elif args.command == "execute":
        execute()
    else:
        verify()


if __name__ == "__main__":
    try:
        main()
    except CleanupError as error:
        print(f"ERROR: {error}")
        raise SystemExit(1)
