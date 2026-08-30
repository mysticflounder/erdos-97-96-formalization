"""Archive exactly the superseded FreshThird U3 probe payloads to NFS.

The script is deliberately one-shot and narrowly scoped.  It refuses tracked
or symlinked input, freezes individual file hashes, verifies the compressed
archive by streaming every member, and only then removes the exact roots.
"""

from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import json
import os
import shutil
import stat
import subprocess
import tarfile
from pathlib import Path, PurePosixPath
from typing import Any

REPO = Path(__file__).resolve().parents[2]
ATTIC = Path(__file__).resolve().parent
NFS_ROOT = Path(
    "/opt/nfs/erdos-97-96-formalization-freshthird-u3-superseded-20260829"
)
ARCHIVE = NFS_ROOT / "freshthird-u3-superseded-payload.tar.gz"
PATH_LIST = ATTIC / "nfs-paths.txt"
CHECKSUMS = ATTIC / "nfs-sha256.txt"
RECEIPT = ATTIC / "nfs-archive.json"
SOURCE_ROOTS = (
    "scratch/freshthird-coherent-producer-20260817.md",
    "scratch/runs/freshthird-coherent-cap-labels-20260817",
    "scratch/runs/freshthird-fan-consumer-20260819",
)
BLOCK = 8 * 1024 * 1024


class ArchiveError(RuntimeError):
    pass


def utc_now() -> str:
    return dt.datetime.now(dt.UTC).replace(microsecond=0).isoformat().replace(
        "+00:00", "Z"
    )


def canonical(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def self_hash(value: dict[str, Any]) -> str:
    return hashlib.sha256(
        canonical({key: item for key, item in value.items() if key != "receipt_sha256"})
    ).hexdigest()


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(BLOCK), b""):
            digest.update(block)
    return digest.hexdigest()


def fsync_directory(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def atomic_write(path: Path, payload: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + ".partial")
    if temporary.exists():
        raise ArchiveError(f"stale temporary file: {temporary}")
    with temporary.open("xb") as handle:
        handle.write(payload)
        handle.flush()
        os.fsync(handle.fileno())
    os.replace(temporary, path)
    fsync_directory(path.parent)


def repo_relative(path: Path) -> str:
    relative = path.relative_to(REPO).as_posix()
    pure = PurePosixPath(relative)
    if not relative.startswith("scratch/") or pure.is_absolute() or ".." in pure.parts:
        raise ArchiveError(f"unsafe source path: {relative}")
    return relative


def tracked_paths() -> set[str]:
    output = subprocess.run(
        ["git", "ls-files", "-z", "--", *SOURCE_ROOTS],
        cwd=REPO,
        check=True,
        stdout=subprocess.PIPE,
    ).stdout
    return {item.decode() for item in output.split(b"\0") if item}


def source_files() -> list[Path]:
    tracked = tracked_paths()
    if tracked:
        raise ArchiveError(f"refusing tracked sources: {sorted(tracked)}")
    files: list[Path] = []
    for raw_root in SOURCE_ROOTS:
        root = REPO / raw_root
        if root.is_symlink() or not root.exists():
            raise ArchiveError(f"source root missing or symlinked: {raw_root}")
        if root.is_file():
            files.append(root)
            continue
        for candidate in sorted(root.rglob("*")):
            if candidate.is_symlink():
                raise ArchiveError(f"refusing symlinked source: {candidate}")
            if candidate.is_file():
                files.append(candidate)
    if not files:
        raise ArchiveError("no source files found")
    return files


def records(files: list[Path]) -> list[dict[str, Any]]:
    values: list[dict[str, Any]] = []
    for path in files:
        info = path.stat(follow_symlinks=False)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise ArchiveError(f"source is not a unique regular file: {path}")
        values.append(
            {
                "path": repo_relative(path),
                "sha256": sha256(path),
                "size": info.st_size,
            }
        )
    return values


def manifest_bytes(rows: list[dict[str, Any]]) -> tuple[bytes, bytes]:
    paths = "".join(f"{row['path']}\n" for row in rows).encode()
    checksums = "".join(
        f"{row['sha256']}  {row['path']}\n" for row in rows
    ).encode()
    return paths, checksums


def write_archive(rows: list[dict[str, Any]]) -> None:
    NFS_ROOT.mkdir(parents=True, exist_ok=True)
    if ARCHIVE.exists():
        raise ArchiveError(f"archive already exists: {ARCHIVE}")
    temporary = ARCHIVE.with_name(ARCHIVE.name + ".partial")
    if temporary.exists():
        raise ArchiveError(f"archive temporary already exists: {temporary}")
    with tarfile.open(temporary, "w:gz", compresslevel=6) as archive:
        for row in rows:
            archive.add(REPO / row["path"], arcname=row["path"], recursive=False)
    expected = {row["path"]: row for row in rows}
    verified: set[str] = set()
    with tarfile.open(temporary, "r:gz") as archive:
        for member in archive:
            if not member.isfile() or member.name not in expected:
                raise ArchiveError(f"unexpected archive member: {member.name}")
            if member.size != expected[member.name]["size"]:
                raise ArchiveError(f"archive size mismatch: {member.name}")
            content = archive.extractfile(member)
            if content is None:
                raise ArchiveError(f"unreadable archive member: {member.name}")
            digest = hashlib.sha256()
            while block := content.read(BLOCK):
                digest.update(block)
            if digest.hexdigest() != expected[member.name]["sha256"]:
                raise ArchiveError(f"archive digest mismatch: {member.name}")
            verified.add(member.name)
    if verified != set(expected):
        raise ArchiveError("archive is missing source members")
    os.replace(temporary, ARCHIVE)
    fsync_directory(NFS_ROOT)


def sources_still_match(rows: list[dict[str, Any]]) -> None:
    for row in rows:
        path = REPO / row["path"]
        if not path.is_file() or sha256(path) != row["sha256"]:
            raise ArchiveError(f"source changed after archive: {row['path']}")


def remove_source_roots() -> None:
    for raw_root in SOURCE_ROOTS:
        root = REPO / raw_root
        if root.is_file():
            root.unlink()
            fsync_directory(root.parent)
        elif root.is_dir():
            shutil.rmtree(root)
            fsync_directory(root.parent)
        else:
            raise ArchiveError(f"source vanished before removal: {raw_root}")


def execute() -> None:
    if RECEIPT.exists():
        value = json.loads(RECEIPT.read_bytes())
        if value.get("status") == "COMPLETE" and value.get("receipt_sha256") == self_hash(value):
            print(json.dumps({"status": "ALREADY_COMPLETE"}, sort_keys=True))
            return
        raise ArchiveError(f"refusing existing non-complete receipt: {RECEIPT}")
    files = source_files()
    frozen = records(files)
    path_bytes, checksum_bytes = manifest_bytes(frozen)
    atomic_write(PATH_LIST, path_bytes)
    atomic_write(CHECKSUMS, checksum_bytes)
    write_archive(frozen)
    sources_still_match(frozen)
    remove_source_roots()
    remaining = [row["path"] for row in frozen if (REPO / row["path"]).exists()]
    if remaining:
        raise ArchiveError(f"local source removal incomplete: {remaining[:5]}")
    value: dict[str, Any] = {
        "schema": "freshthird-superseded-archive/v1",
        "lane_id": "freshthird-u3-superseded-archive-20260829",
        "base_head": subprocess.run(
            ["git", "rev-parse", "HEAD"], cwd=REPO, check=True, stdout=subprocess.PIPE
        ).stdout.decode().strip(),
        "created_utc": utc_now(),
        "source": {
            "roots": list(SOURCE_ROOTS),
            "path_list": PATH_LIST.relative_to(REPO).as_posix(),
            "path_list_sha256": sha256(PATH_LIST),
            "checksum_manifest": CHECKSUMS.relative_to(REPO).as_posix(),
            "checksum_manifest_sha256": sha256(CHECKSUMS),
            "file_count": len(frozen),
            "total_bytes": sum(row["size"] for row in frozen),
        },
        "archive": {
            "path": str(ARCHIVE),
            "format": "tar+gzip",
            "sha256": sha256(ARCHIVE),
            "bytes": ARCHIVE.stat().st_size,
            "verified_files": len(frozen),
        },
        "removal": {"local_sources_remaining": 0, "completed_utc": utc_now()},
        "status": "COMPLETE",
    }
    value["receipt_sha256"] = self_hash(value)
    atomic_write(RECEIPT, canonical(value) + b"\n")
    print(
        json.dumps(
            {
                "archive_bytes": value["archive"]["bytes"],
                "files": len(frozen),
                "status": value["status"],
                "total_bytes": value["source"]["total_bytes"],
            },
            sort_keys=True,
        )
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("command", choices=("execute",))
    args = parser.parse_args()
    if args.command == "execute":
        execute()


if __name__ == "__main__":
    main()
