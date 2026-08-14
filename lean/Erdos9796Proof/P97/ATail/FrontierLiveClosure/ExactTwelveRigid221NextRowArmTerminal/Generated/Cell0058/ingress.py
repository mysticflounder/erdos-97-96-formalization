#!/usr/bin/env python3
"""Deterministically ingress the verified next-row arm cell 58 compact replay.

The emitted manifest authenticates 8 Lean modules and 4 compact payloads for
one finite next-row named-deletion-arm terminal cell.  This ingress rewrites
only project module imports and the generic Lean namespace; payload bytes are
copied verbatim.  Certificate preparation for one finite cell only: no
aggregate coverage, universal lift, terminal bank, or Lean-closure claim.
"""

from __future__ import annotations

import copy
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import shutil
import tempfile
from typing import Any


SOURCE_PACKAGE_REL = Path(
    "scratch/rigid221-sourceheavy-anchor/"
    "exact12-next-row-arm-terminal-replay-20260813/cell-58/compact"
)
EXPECTED_PACKAGE_SHA256 = "33627b5d2fb72e0d9a8ae12fc03bf14ed8aeffb89f7dac6838cee7cd167b3032"
EXPECTED_COUNTS = {".lean": 8, ".cpf85": 2, ".cpa85": 2}
SOURCE_NAMESPACE = "CompactWindowedRupReplay"
TARGET_NAMESPACE = "ExactTwelveRigid221NextRowArmCell0058Replay"
MODULE_PREFIX = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
    "ExactTwelveRigid221NextRowArmTerminal.Generated."
    "Cell0058.CompactWindowedRupReplay"
)
MANIFEST_NAME = "compact-replay-manifest.json"


class IngressError(RuntimeError):
    """The authenticated source or production destination is malformed."""


def repo_root() -> Path:
    for candidate in Path(__file__).resolve().parents:
        if (candidate / "lean/lakefile.toml").is_file():
            return candidate
    raise IngressError("could not locate the repository root")


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(4 * 1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def compact_package_digest(manifest: dict[str, Any]) -> str:
    payload = copy.deepcopy(manifest)
    payload.pop("compact_replay_package_sha256", None)
    encoded = json.dumps(
        payload, separators=(",", ":"), sort_keys=True
    ).encode("utf-8")
    return hashlib.sha256(encoded).hexdigest()


def checked_relative_path(raw: object) -> Path:
    if not isinstance(raw, str):
        raise IngressError(f"manifest path is not a string: {raw!r}")
    posix = PurePosixPath(raw)
    if posix.is_absolute() or ".." in posix.parts:
        raise IngressError(f"unsafe manifest path: {raw!r}")
    return Path(*posix.parts)


def verify_record(source_dir: Path, record: dict[str, Any]) -> Path:
    relative = checked_relative_path(record.get("path"))
    source = source_dir / relative
    if not source.is_file():
        raise IngressError(f"missing source file: {relative}")
    expected_bytes = record.get("byte_count")
    if source.stat().st_size != expected_bytes:
        raise IngressError(f"byte-count drift: {relative}")
    if sha256(source) != record.get("sha256"):
        raise IngressError(f"SHA-256 drift: {relative}")
    return relative


def rewritten_lean(source: Path) -> bytes:
    text = source.read_text(encoding="utf-8")
    text = text.replace(
        f"import {SOURCE_NAMESPACE}.", f"import {MODULE_PREFIX}."
    )
    text = text.replace(
        f"namespace {SOURCE_NAMESPACE}", f"namespace {TARGET_NAMESPACE}"
    )
    text = text.replace(
        f"end {SOURCE_NAMESPACE}", f"end {TARGET_NAMESPACE}"
    )
    if any(
        marker in text
        for marker in (
            f"import {SOURCE_NAMESPACE}.",
            f"namespace {SOURCE_NAMESPACE}",
            f"end {SOURCE_NAMESPACE}",
        )
    ):
        raise IngressError(f"unrewritten generic namespace in {source}")
    return text.encode("utf-8")


def write_bytes_if_changed(destination: Path, payload: bytes) -> bool:
    if destination.is_file() and destination.read_bytes() == payload:
        return False
    destination.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(
        dir=destination.parent, prefix=f".{destination.name}.", delete=False
    ) as stream:
        temporary = Path(stream.name)
        stream.write(payload)
    os.replace(temporary, destination)
    return True


def copy_if_changed(
    source: Path, destination: Path, expected_sha256: str
) -> bool:
    if (
        destination.is_file()
        and destination.stat().st_size == source.stat().st_size
        and sha256(destination) == expected_sha256
    ):
        return False
    destination.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(
        dir=destination.parent, prefix=f".{destination.name}.", delete=False
    ) as stream:
        temporary = Path(stream.name)
        with source.open("rb") as source_stream:
            shutil.copyfileobj(source_stream, stream, 4 * 1024 * 1024)
    if sha256(temporary) != expected_sha256:
        temporary.unlink()
        raise IngressError(f"copied payload SHA-256 drift: {source}")
    os.replace(temporary, destination)
    return True


def records(
    manifest: dict[str, Any], key: str
) -> list[dict[str, Any]]:
    value = manifest.get(key)
    if not isinstance(value, list) or not all(
        isinstance(item, dict) for item in value
    ):
        raise IngressError(f"manifest {key!r} is not a record list")
    return value


def main() -> None:
    root = repo_root()
    source_dir = root / SOURCE_PACKAGE_REL
    destination_dir = Path(__file__).resolve().parent
    manifest_path = source_dir / MANIFEST_NAME
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))

    stated_digest = manifest.get("compact_replay_package_sha256")
    computed_digest = compact_package_digest(manifest)
    if stated_digest != EXPECTED_PACKAGE_SHA256:
        raise IngressError(f"unexpected package digest: {stated_digest!r}")
    if computed_digest != EXPECTED_PACKAGE_SHA256:
        raise IngressError(f"computed package digest drift: {computed_digest}")

    lean_records = records(manifest, "lean_sources")
    payload_records = records(manifest, "payloads")
    all_records = lean_records + payload_records
    relative_paths = [verify_record(source_dir, item) for item in all_records]
    if len(set(relative_paths)) != len(relative_paths):
        raise IngressError("duplicate manifest output path")

    counts = {
        extension: sum(path.suffix == extension for path in relative_paths)
        for extension in EXPECTED_COUNTS
    }
    if counts != EXPECTED_COUNTS:
        raise IngressError(f"unexpected payload counts: {counts!r}")
    if any(path.suffix not in EXPECTED_COUNTS for path in relative_paths):
        raise IngressError("manifest contains an unauthorized payload extension")
    source_payload_files = {
        path.relative_to(source_dir)
        for extension in EXPECTED_COUNTS
        for path in source_dir.rglob(f"*{extension}")
    }
    if source_payload_files != set(relative_paths):
        raise IngressError("source payload census differs from the manifest")

    changed = 0
    for relative in relative_paths[: len(lean_records)]:
        changed += write_bytes_if_changed(
            destination_dir / relative, rewritten_lean(source_dir / relative)
        )
    for record, relative in zip(
        payload_records, relative_paths[len(lean_records) :]
    ):
        changed += copy_if_changed(
            source_dir / relative,
            destination_dir / relative,
            str(record["sha256"]),
        )

    actual = {
        extension: sum(
            path.is_file() for path in destination_dir.rglob(f"*{extension}")
        )
        for extension in EXPECTED_COUNTS
    }
    if actual != EXPECTED_COUNTS:
        raise IngressError(f"production payload census drift: {actual!r}")
    allowed_destination_files = set(relative_paths) | {
        Path(__file__).resolve().relative_to(destination_dir)
    }
    actual_destination_files = {
        path.relative_to(destination_dir)
        for path in destination_dir.rglob("*")
        if path.is_file()
    }
    unexpected = sorted(actual_destination_files - allowed_destination_files)
    if unexpected:
        raise IngressError(f"unauthorized production files: {unexpected!r}")
    forbidden_compiled = [
        path
        for suffix in (".olean", ".ilean")
        for path in destination_dir.rglob(f"*{suffix}")
    ]
    if forbidden_compiled:
        raise IngressError(
            f"compiled artifacts entered production: {forbidden_compiled!r}"
        )

    print(
        json.dumps(
            {
                "changed_files": changed,
                "counts": actual,
                "package_sha256": EXPECTED_PACKAGE_SHA256,
                "source": str(SOURCE_PACKAGE_REL),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
