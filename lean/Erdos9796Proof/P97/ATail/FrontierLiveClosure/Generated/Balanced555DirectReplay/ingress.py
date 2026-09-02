#!/usr/bin/env python3
"""Deterministically ingress the authenticated balanced-555 compact replay.

The emitter writes a generic ``CompactWindowedRupReplay`` package.  This
ingress authenticates the package manifest and every packaged file, rewrites
only the Lean module prefix and namespace, and copies the compact data below
this destination's ``data`` directory.  Source CNFs, LRAT streams, tools, and
compiled Lean artifacts are provenance only and are never copied.
"""

from __future__ import annotations

import copy
import hashlib
import json
import os
import re
import shutil
import tempfile
from pathlib import Path, PurePosixPath
from typing import Any

SOURCE_PACKAGE_REL = Path(
    "scratch/runs/balanced555-finite-closure-20260902/run-0001/"
    "artifacts/direct/replay-package-generic"
)
VERIFIED_OLEANS_REL = Path("(none: oleans are built in place by lake-build)")
EXPECTED_PACKAGE_SHA256 = (
    "b83f6e91f056d7ce81ed5c00375e7473359536aa78ac2c38220da06d2b967e67"
)
EXPECTED_COUNTS = {".lean": 158, ".cpf85": 77, ".cpa85": 77}
SOURCE_NAMESPACE = "CompactWindowedRupReplay"
TARGET_NAMESPACE = "Balanced555DirectReplay"
MODULE_PREFIX = (
    "Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated."
    "Balanced555DirectReplay.CompactWindowedRupReplay"
)
MANIFEST_NAME = "compact-replay-manifest.json"
SHA256_RE = re.compile(r"^[0-9a-f]{64}$")


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
    if not isinstance(raw, str) or not raw or "\x00" in raw or "\\" in raw:
        raise IngressError(f"unsafe manifest path: {raw!r}")
    posix = PurePosixPath(raw)
    if posix.is_absolute() or "." in posix.parts or ".." in posix.parts:
        raise IngressError(f"unsafe manifest path: {raw!r}")
    return Path(*posix.parts)


def _digest(value: object, field: str) -> str:
    if not isinstance(value, str) or SHA256_RE.fullmatch(value) is None:
        raise IngressError(f"manifest {field} is not a SHA-256 digest")
    return value


def _byte_count(value: object, field: str) -> int:
    if type(value) is not int or value < 0:
        raise IngressError(f"manifest {field} is not a nonnegative byte count")
    return value


def verify_record(source_dir: Path, record: dict[str, Any]) -> Path:
    relative = checked_relative_path(record.get("path"))
    source = source_dir / relative
    if source.is_symlink() or not source.is_file():
        raise IngressError(f"missing or symlinked source file: {relative}")
    expected_bytes = _byte_count(record.get("byte_count"), f"{relative}.byte_count")
    expected_sha = _digest(record.get("sha256"), f"{relative}.sha256")
    if source.stat().st_size != expected_bytes:
        raise IngressError(f"byte-count drift: {relative}")
    if sha256(source) != expected_sha:
        raise IngressError(f"SHA-256 drift: {relative}")
    return relative


def rewritten_lean(source: Path) -> bytes:
    try:
        text = source.read_text(encoding="utf-8")
    except (OSError, UnicodeError) as error:
        raise IngressError(f"cannot read Lean source: {source}") from error
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


def _atomic_payload(destination: Path, write: Any) -> None:
    destination.parent.mkdir(parents=True, exist_ok=True)
    temporary: Path | None = None
    try:
        with tempfile.NamedTemporaryFile(
            dir=destination.parent, prefix=f".{destination.name}.", delete=False
        ) as stream:
            temporary = Path(stream.name)
            write(stream)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, destination)
        temporary = None
    finally:
        if temporary is not None:
            temporary.unlink(missing_ok=True)


def write_bytes_if_changed(destination: Path, payload: bytes) -> bool:
    if destination.is_symlink():
        raise IngressError(f"symlinked production path: {destination}")
    if destination.is_file() and destination.read_bytes() == payload:
        return False

    def write(stream: Any) -> None:
        stream.write(payload)

    _atomic_payload(destination, write)
    return True


def copy_if_changed(
    source: Path, destination: Path, expected_sha256: str
) -> bool:
    if destination.is_symlink():
        raise IngressError(f"symlinked production path: {destination}")
    if (
        destination.is_file()
        and destination.stat().st_size == source.stat().st_size
        and sha256(destination) == expected_sha256
    ):
        return False

    def write(stream: Any) -> None:
        with source.open("rb") as source_stream:
            shutil.copyfileobj(source_stream, stream, 4 * 1024 * 1024)
        stream.flush()
        if sha256(Path(stream.name)) != expected_sha256:
            raise IngressError(f"copied payload SHA-256 drift: {source}")

    _atomic_payload(destination, write)
    return True


def records(manifest: dict[str, Any], key: str) -> list[dict[str, Any]]:
    value = manifest.get(key)
    if not isinstance(value, list) or not all(
        isinstance(item, dict) for item in value
    ):
        raise IngressError(f"manifest {key!r} is not a record list")
    return value


def _all_files(root: Path) -> set[Path]:
    if root.is_symlink() or (root.exists() and not root.is_dir()):
        raise IngressError(f"production path is not a directory: {root}")
    if not root.exists():
        return set()
    files: set[Path] = set()
    for path in root.rglob("*"):
        if path.is_symlink():
            raise IngressError(f"symlink in package tree: {path}")
        if path.is_file():
            files.add(path.relative_to(root))
    return files


def _verify_manifest_links(
    manifest: dict[str, Any], payload_records: list[dict[str, Any]]
) -> None:
    objects = manifest.get("objects")
    if not isinstance(objects, list) or not all(isinstance(item, dict) for item in objects):
        raise IngressError("manifest objects are not a record list")
    if len(objects) != len(payload_records):
        raise IngressError("object/payload record count drift")
    payload_by_path: dict[Path, dict[str, Any]] = {}
    for item in payload_records:
        path = checked_relative_path(item.get("path"))
        if path in payload_by_path:
            raise IngressError("duplicate manifest output path")
        payload_by_path[path] = item
    if len(payload_by_path) != len(payload_records):
        raise IngressError("duplicate manifest output path")
    identities: set[str] = set()
    emitted_paths: set[Path] = set()
    for item in objects:
        identity = item.get("identity")
        if not isinstance(identity, str) or not identity or identity in identities:
            raise IngressError("invalid or duplicate object identity")
        identities.add(identity)
        if item.get("kind") not in {"formula", "actions"}:
            raise IngressError("unauthorized object kind")
        emitted = item.get("emitted")
        source = item.get("source")
        if not isinstance(emitted, dict) or not isinstance(source, dict):
            raise IngressError("malformed object record")
        emitted_path = checked_relative_path(emitted.get("path"))
        emitted_paths.add(emitted_path)
        payload = payload_by_path.get(emitted_path)
        if payload is None or payload.get("kind") != item["kind"]:
            raise IngressError("object emitted path is absent from payloads")
        for field in (
            "byte_count",
            "sha256",
            "binary_byte_count",
            "binary_sha256",
            "semantic_sha256",
        ):
            if field in emitted:
                if field.endswith("byte_count"):
                    _byte_count(emitted[field], f"object.{field}")
                else:
                    _digest(emitted[field], f"object.{field}")
                if emitted.get(field) != payload.get(field):
                    raise IngressError(f"object/payload {field} drift")
        checked_relative_path(source.get("path"))
        _byte_count(source.get("byte_count"), "object.source.byte_count")
        _digest(source.get("sha256"), "object.source.sha256")
    if emitted_paths != set(payload_by_path):
        raise IngressError("object emitted census differs from payloads")

    layout = manifest.get("replay_layout")
    if not isinstance(layout, dict):
        raise IngressError("manifest replay layout is malformed")
    checkpoints = layout.get("checkpoints")
    shards = layout.get("shards")
    if not isinstance(checkpoints, list) or not isinstance(shards, dict):
        raise IngressError("manifest replay layout is malformed")
    layout_paths: set[Path] = set()
    for checkpoint in checkpoints:
        if not isinstance(checkpoint, dict) or type(checkpoint.get("index")) is not int:
            raise IngressError("malformed checkpoint layout record")
        path = checked_relative_path(checkpoint.get("payload_path"))
        if path.suffix != ".cpf85" or path in layout_paths:
            raise IngressError("invalid checkpoint payload layout")
        layout_paths.add(path)
    for shard_name in ("shard_1", "shard_2"):
        shard = shards.get(shard_name)
        if not isinstance(shard, list):
            raise IngressError("manifest shard layout is malformed")
        for window in shard:
            if not isinstance(window, dict) or type(window.get("index")) is not int:
                raise IngressError("malformed shard layout record")
            path = checked_relative_path(window.get("action_payload_path"))
            if path.suffix != ".cpa85" or path in layout_paths:
                raise IngressError("invalid action payload layout")
            layout_paths.add(path)
    if layout_paths != set(payload_by_path):
        raise IngressError("replay layout census differs from payloads")


def _load_manifest(path: Path) -> dict[str, Any]:
    try:
        if path.is_symlink() or not path.is_file():
            raise IngressError("missing or symlinked compact replay manifest")
        value = json.loads(path.read_text(encoding="utf-8"))
    except IngressError:
        raise
    except (OSError, UnicodeError, json.JSONDecodeError) as error:
        raise IngressError("cannot parse compact replay manifest") from error
    if not isinstance(value, dict):
        raise IngressError("compact replay manifest is not an object")
    return value


def main() -> None:
    root = repo_root()
    source_dir = root / SOURCE_PACKAGE_REL
    destination_dir = Path(__file__).resolve().parent
    manifest = _load_manifest(source_dir / MANIFEST_NAME)

    stated_digest = manifest.get("compact_replay_package_sha256")
    computed_digest = compact_package_digest(manifest)
    if stated_digest != EXPECTED_PACKAGE_SHA256:
        raise IngressError(f"unexpected package digest: {stated_digest!r}")
    if computed_digest != EXPECTED_PACKAGE_SHA256:
        raise IngressError(f"computed package digest drift: {computed_digest}")
    if manifest.get("schema") != "p97-windowed-rup-compact-lean-replay-v2":
        raise IngressError("unexpected compact replay manifest schema")
    lean_metadata = manifest.get("lean")
    if not isinstance(lean_metadata, dict) or lean_metadata != {
        "module_prefix": SOURCE_NAMESPACE,
        "namespace": SOURCE_NAMESPACE,
        "source_root": SOURCE_NAMESPACE,
    }:
        raise IngressError("unexpected generic Lean package metadata")

    lean_records = records(manifest, "lean_sources")
    payload_records = records(manifest, "payloads")
    all_records = lean_records + payload_records
    if len(lean_records) != EXPECTED_COUNTS[".lean"] or len(payload_records) != 154:
        raise IngressError("unexpected manifest record counts")
    relative_paths = [verify_record(source_dir, item) for item in all_records]
    if len(set(relative_paths)) != len(relative_paths):
        raise IngressError("duplicate manifest output path")
    counts = {
        extension: sum(path.suffix == extension for path in relative_paths)
        for extension in EXPECTED_COUNTS
    }
    if counts != EXPECTED_COUNTS:
        raise IngressError(f"unexpected payload counts: {counts!r}")
    for relative in relative_paths[: len(lean_records)]:
        if relative.parts[0] != SOURCE_NAMESPACE or relative.suffix != ".lean":
            raise IngressError("Lean record escapes the generic source root")
    for relative in relative_paths[len(lean_records) :]:
        if relative.parts[:1] != ("data",) or relative.suffix not in {".cpf85", ".cpa85"}:
            raise IngressError("manifest contains an unauthorized payload path")
    _verify_manifest_links(manifest, payload_records)

    source_files = _all_files(source_dir)
    if source_files != set(relative_paths) | {Path(MANIFEST_NAME)}:
        raise IngressError("source file census differs from the manifest")
    if any(path.suffix in {".olean", ".ilean"} for path in source_files):
        raise IngressError("compiled artifacts entered the source package")

    allowed_destination_files = set(relative_paths) | {
        Path(__file__).resolve().relative_to(destination_dir)
    }
    actual_destination_files = _all_files(destination_dir)
    unexpected = sorted(actual_destination_files - allowed_destination_files)
    if unexpected:
        raise IngressError(f"unauthorized production files: {unexpected!r}")
    if any(path.suffix in {".olean", ".ilean"} for path in actual_destination_files):
        raise IngressError("compiled artifacts entered production")

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

    actual_destination_files = _all_files(destination_dir)
    unexpected = sorted(actual_destination_files - allowed_destination_files)
    if unexpected:
        raise IngressError(f"unauthorized production files: {unexpected!r}")
    actual = {
        extension: sum(path.suffix == extension for path in actual_destination_files)
        for extension in EXPECTED_COUNTS
    }
    if actual != EXPECTED_COUNTS:
        raise IngressError(f"production payload census drift: {actual!r}")

    print(
        json.dumps(
            {
                "changed_files": changed,
                "counts": actual,
                "package_sha256": EXPECTED_PACKAGE_SHA256,
                "source": str(SOURCE_PACKAGE_REL),
                "verified_oleans_not_copied": str(VERIFIED_OLEANS_REL),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
