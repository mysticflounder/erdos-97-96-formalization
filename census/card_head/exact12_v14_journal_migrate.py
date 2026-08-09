"""Fail-closed migration of an integrity-checked exact-12 v14 journal.

This is process infrastructure only.  It does not establish finite or
universal proof closure: the current-source replay gate authenticates the
certificate, witness, and learned-clause payloads before publication.
Here ``authenticates`` means hash-chain, bound-job, source-manifest, and replay
integrity; it does not assert a signer identity or keyed provenance.
Publication is verified through retained descriptors and returns the expected
content digest.  A later consumer must reopen the path without following
symlinks and rehash that digest: no ordinary pathname can remain immutable
against a malicious same-UID process after this process returns.
"""

from __future__ import annotations

import argparse
import hashlib
import io
import json
import os
import stat
from collections.abc import Mapping
from pathlib import Path
from typing import Any, BinaryIO

from census.card_head.exact12_v14_bound_jobs import (
    build_bound_job,
    instantiate_validated_bound_job,
)
from census.card_head.exact12_v14_schedule import build_manifest, json_sha256
from census.card_head.exact12_v14_source_order_bank import (
    build_source_order_bank,
    build_source_order_bank_from_authenticated_sources,
)
from census.card_head.exact12_v14_structural_cegar import (
    DETECTOR_CONTRACT,
    RECORD_SCHEMA,
    _canonical_json_bytes,
    _detector_manifest,
    _json_object_without_duplicates,
    _sha256_json,
    replay_journal,
)


class JournalMigrationError(ValueError):
    """The source journal or its current-source migration is invalid."""


# Compatibility names for callers of the scratch helper being productionized.
RechainError = JournalMigrationError

_EXPECTED_FIELDS = frozenset(
    {
        "schema",
        "index",
        "parent_sha256",
        "job_sha256",
        "detector_contract_sha256",
        "cell_index",
        "detector_contract",
        "certificate_kind",
        "certificate_schema",
        "detector_stage",
        "certificate",
        "certificate_sha256",
        "source_order_bank_index",
        "learned_clause",
        "cube",
        "cube_sha256",
        "positive_variables",
        "assignment_sha256",
        "record_sha256",
    }
)
_REWRITTEN_FIELDS = frozenset(
    {"parent_sha256", "detector_contract_sha256", "record_sha256"}
)


def _strict_record(raw: bytes, line_number: int) -> dict[str, Any]:
    if not raw.endswith(b"\n"):
        raise JournalMigrationError(
            f"input line {line_number} is not newline terminated"
        )
    try:
        record = json.loads(
            raw,
            object_pairs_hook=_json_object_without_duplicates,
            parse_constant=lambda value: (_ for _ in ()).throw(
                ValueError(f"invalid JSON constant {value}")
            ),
        )
    except (json.JSONDecodeError, ValueError) as exc:
        raise JournalMigrationError(
            f"input line {line_number} is not strict JSON"
        ) from exc
    if not isinstance(record, Mapping):
        raise JournalMigrationError(f"input line {line_number} is not an object")
    return dict(record)


def _is_sha256(value: Any) -> bool:
    return (
        isinstance(value, str)
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    )


def _authenticate_source(
    source: BinaryIO,
    *,
    job_sha256: str,
    cell_index: int,
    snapshot: BinaryIO | None = None,
) -> tuple[int, str | None, str, str]:
    """Authenticate every old record before creating any candidate file."""

    count = 0
    parent = job_sha256
    detector_sha256: str | None = None
    source_digest = hashlib.sha256()
    source.seek(0)
    for line_number, raw in enumerate(source, 1):
        source_digest.update(raw)
        if snapshot is not None:
            snapshot.write(raw)
        record = _strict_record(raw, line_number)
        if set(record) != _EXPECTED_FIELDS:
            raise JournalMigrationError(
                f"input line {line_number} has unexpected fields"
            )
        body = dict(record)
        record_sha256 = body.pop("record_sha256")
        record_detector_sha256 = record["detector_contract_sha256"]
        if detector_sha256 is None:
            detector_sha256 = record_detector_sha256
        if (
            record["schema"] != RECORD_SCHEMA
            or isinstance(record["index"], bool)
            or not isinstance(record["index"], int)
            or record["index"] != count
            or record["parent_sha256"] != parent
            or record["job_sha256"] != job_sha256
            or record_detector_sha256 != detector_sha256
            or isinstance(record["cell_index"], bool)
            or not isinstance(record["cell_index"], int)
            or record["cell_index"] != cell_index
            or record["detector_contract"] != DETECTOR_CONTRACT
            or not _is_sha256(record["parent_sha256"])
            or not _is_sha256(record["job_sha256"])
            or not _is_sha256(record_detector_sha256)
            or not _is_sha256(record_sha256)
            or record_sha256 != _sha256_json(body)
        ):
            raise JournalMigrationError(
                f"input line {line_number} failed old-chain/job/cell/detector authentication"
            )
        parent = record_sha256
        count += 1
    if snapshot is not None:
        snapshot.flush()
        try:
            os.fsync(snapshot.fileno())
        except (AttributeError, OSError):
            # In-memory snapshots need no durability syscall.
            pass
        snapshot.seek(0)
    return count, detector_sha256, parent, source_digest.hexdigest()


def _required_open_primitives() -> tuple[int, int]:
    nofollow = getattr(os, "O_NOFOLLOW", 0)
    directory = getattr(os, "O_DIRECTORY", 0)
    if (
        nofollow == 0
        or directory == 0
        or os.open not in os.supports_dir_fd
        or os.stat not in os.supports_dir_fd
    ):
        raise JournalMigrationError(
            "platform lacks required descriptor-relative no-follow operations"
        )
    return nofollow, directory


def _open_directory(path: Path) -> int:
    """Open every component of an absolute directory path without symlinks."""

    nofollow, directory = _required_open_primitives()
    absolute = path.absolute()
    flags = os.O_RDONLY | nofollow | directory | getattr(os, "O_CLOEXEC", 0)
    descriptor: int | None = None
    try:
        descriptor = os.open(absolute.anchor, flags)
        for component in absolute.parts[1:]:
            next_descriptor = os.open(component, flags, dir_fd=descriptor)
            previous_descriptor = descriptor
            descriptor = next_descriptor
            try:
                os.close(previous_descriptor)
            except OSError:
                try:
                    os.close(previous_descriptor)
                except OSError:
                    pass
                raise
    except OSError as exc:
        if descriptor is not None:
            try:
                os.close(descriptor)
            except OSError:
                pass
        raise JournalMigrationError(
            f"directory path is not a symlink-free directory: {path}"
        ) from exc
    assert descriptor is not None
    try:
        info = os.fstat(descriptor)
    except OSError as exc:
        os.close(descriptor)
        raise JournalMigrationError(f"path is not a directory: {path}") from exc
    if not stat.S_ISDIR(info.st_mode):
        os.close(descriptor)
        raise JournalMigrationError(f"path is not a directory: {path}")
    return descriptor


def _open_regular_source(path: Path) -> BinaryIO:
    """Open one regular file beneath a symlink-free absolute path."""

    nofollow, _ = _required_open_primitives()
    parent_descriptor = _open_directory(path.parent)
    nonblock = getattr(os, "O_NONBLOCK", 0)
    if nonblock == 0:
        os.close(parent_descriptor)
        raise JournalMigrationError(
            "platform lacks required nonblocking source-open operation"
        )
    flags = os.O_RDONLY | nofollow | getattr(os, "O_CLOEXEC", 0) | nonblock
    descriptor: int | None = None
    try:
        descriptor = os.open(path.name, flags, dir_fd=parent_descriptor)
    except OSError as exc:
        raise JournalMigrationError(f"source is not a regular file: {path}") from exc
    finally:
        try:
            os.close(parent_descriptor)
        except OSError:
            pass
    try:
        assert descriptor is not None
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode):
            raise JournalMigrationError(f"source is not a regular file: {path}")
        handle = os.fdopen(descriptor, "rb")
        descriptor = None
        return handle
    finally:
        if descriptor is not None:
            try:
                os.close(descriptor)
            except OSError:
                pass


def _source_identity(source: BinaryIO) -> tuple[int, int]:
    info = os.fstat(source.fileno())
    if not stat.S_ISREG(info.st_mode):
        raise JournalMigrationError("opened source stopped being a regular file")
    return info.st_dev, info.st_ino


def _require_source_path_identity(path: Path, identity: tuple[int, int]) -> None:
    try:
        with _open_regular_source(path) as current:
            current_identity = _source_identity(current)
    except JournalMigrationError as exc:
        raise JournalMigrationError(
            "source journal path changed during migration"
        ) from exc
    if current_identity != identity:
        raise JournalMigrationError("source journal path changed during migration")


def _authenticated_source_bytes(
    repo_root: Path, manifest: list[dict[str, Any]]
) -> dict[str, bytes]:
    """Read once and retain exactly the source bytes admitted by *manifest*."""

    authenticated: dict[str, bytes] = {}
    for expected in manifest:
        if set(expected) != {"path", "bytes", "sha256"}:
            raise JournalMigrationError("source snapshot manifest is malformed")
        relative = expected["path"]
        if not isinstance(relative, str):
            raise JournalMigrationError("source snapshot path is malformed")
        relative_path = Path(relative)
        if (
            relative_path.is_absolute()
            or not relative_path.parts
            or any(part in {"", ".", ".."} for part in relative_path.parts)
        ):
            raise JournalMigrationError("source snapshot path escapes repository")
        with _open_regular_source(repo_root / relative_path) as source_handle:
            payload = source_handle.read()
        actual = {
            "path": relative,
            "bytes": len(payload),
            "sha256": hashlib.sha256(payload).hexdigest(),
        }
        if actual != expected:
            raise JournalMigrationError(
                f"authenticated source changed before replay snapshot: {relative}"
            )
        authenticated[relative] = payload
    return authenticated


def _manifest_from_authenticated_bytes(
    source_bytes: Mapping[str, bytes], manifest: list[dict[str, Any]]
) -> list[dict[str, Any]]:
    result: list[dict[str, Any]] = []
    for expected in manifest:
        relative = expected["path"]
        try:
            payload = source_bytes[relative]
        except KeyError as exc:
            raise JournalMigrationError(
                f"authenticated source bundle omitted: {relative}"
            ) from exc
        result.append(
            {
                "path": relative,
                "bytes": len(payload),
                "sha256": hashlib.sha256(payload).hexdigest(),
            }
        )
    return result


def _merge_source_manifests(
    *manifests: list[dict[str, Any]],
) -> list[dict[str, Any]]:
    by_path: dict[str, dict[str, Any]] = {}
    for manifest in manifests:
        for record in manifest:
            path = record.get("path")
            if not isinstance(path, str):
                raise JournalMigrationError("source manifest path is malformed")
            previous = by_path.setdefault(path, record)
            if previous != record:
                raise JournalMigrationError(
                    f"source manifests disagree on authenticated bytes: {path}"
                )
    return [by_path[path] for path in sorted(by_path)]


def _migrated_record(
    record: Mapping[str, Any], *, parent_sha256: str, detector_sha256: str
) -> dict[str, Any]:
    migrated = dict(record)
    migrated["parent_sha256"] = parent_sha256
    migrated["detector_contract_sha256"] = detector_sha256
    body = dict(migrated)
    body.pop("record_sha256")
    migrated["record_sha256"] = _sha256_json(body)
    if (
        set(migrated) != set(record)
        or {key for key in migrated if migrated[key] != record[key]} - _REWRITTEN_FIELDS
    ):
        raise JournalMigrationError(
            "migration changed certificate, witness, or clause data"
        )
    return migrated


def _refuse_existing_at(
    parent_descriptor: int, name: str, description: str, display_path: Path
) -> None:
    try:
        os.stat(name, dir_fd=parent_descriptor, follow_symlinks=False)
    except FileNotFoundError:
        return
    except OSError as exc:
        raise JournalMigrationError(
            f"could not authenticate destination name: {display_path}"
        ) from exc
    raise JournalMigrationError(
        f"refusing to overwrite an existing {description}: {display_path}"
    )


def _descriptor_digest(handle: BinaryIO) -> tuple[int, str]:
    handle.seek(0)
    digest = hashlib.sha256()
    byte_count = 0
    for chunk in iter(lambda: handle.read(1 << 20), b""):
        digest.update(chunk)
        byte_count += len(chunk)
    return byte_count, digest.hexdigest()


def _require_directory_path_identity(path: Path, identity: tuple[int, int]) -> None:
    descriptor = _open_directory(path)
    try:
        info = os.fstat(descriptor)
        if (info.st_dev, info.st_ino) != identity:
            raise JournalMigrationError(f"output parent changed identity: {path}")
    finally:
        os.close(descriptor)


def _require_output_identity_and_content(
    descriptor: int,
    parent_descriptor: int,
    name: str,
    *,
    expected_identity: tuple[int, int],
    expected_bytes: int,
    expected_sha256: str,
) -> None:
    try:
        path_info = os.stat(name, dir_fd=parent_descriptor, follow_symlinks=False)
        descriptor_info = os.fstat(descriptor)
    except OSError as exc:
        raise JournalMigrationError(
            "published journal identity is unavailable"
        ) from exc
    if (
        not stat.S_ISREG(path_info.st_mode)
        or not stat.S_ISREG(descriptor_info.st_mode)
        or (path_info.st_dev, path_info.st_ino) != expected_identity
        or (descriptor_info.st_dev, descriptor_info.st_ino) != expected_identity
    ):
        raise JournalMigrationError("published journal changed identity")
    os.lseek(descriptor, 0, os.SEEK_SET)
    digest = hashlib.sha256()
    byte_count = 0
    for chunk in iter(lambda: os.read(descriptor, 1 << 20), b""):
        digest.update(chunk)
        byte_count += len(chunk)
    if byte_count != expected_bytes or digest.hexdigest() != expected_sha256:
        raise JournalMigrationError("published journal bytes changed")


def _publish_without_overwrite(
    candidate: BinaryIO,
    output: Path,
    parent_descriptor: int,
    *,
    parent_identity: tuple[int, int],
    expected_bytes: int,
    expected_sha256: str,
) -> None:
    """Copy replayed bytes into one descriptor-bound, no-overwrite output."""

    nofollow, _ = _required_open_primitives()
    if output.name in {"", ".", ".."}:
        raise JournalMigrationError("output journal name is malformed")
    _require_directory_path_identity(output.parent, parent_identity)
    candidate_bytes, candidate_sha256 = _descriptor_digest(candidate)
    if candidate_bytes != expected_bytes or candidate_sha256 != expected_sha256:
        raise JournalMigrationError("candidate bytes changed after replay")
    flags = os.O_RDWR | os.O_CREAT | os.O_EXCL | nofollow | getattr(os, "O_CLOEXEC", 0)
    try:
        output_descriptor = os.open(output.name, flags, 0o600, dir_fd=parent_descriptor)
    except OSError as exc:
        raise JournalMigrationError(
            f"refusing to overwrite an existing output journal: {output}"
        ) from exc
    output_info = os.fstat(output_descriptor)
    output_identity = (output_info.st_dev, output_info.st_ino)
    try:
        candidate.seek(0)
        published_digest = hashlib.sha256()
        published_bytes = 0
        for chunk in iter(lambda: candidate.read(1 << 20), b""):
            published_digest.update(chunk)
            published_bytes += len(chunk)
            remaining = memoryview(chunk)
            while remaining:
                written = os.write(output_descriptor, remaining)
                if written <= 0:
                    raise OSError("short write while publishing journal")
                remaining = remaining[written:]
        if (
            published_bytes != expected_bytes
            or published_digest.hexdigest() != expected_sha256
        ):
            raise JournalMigrationError("candidate bytes changed during publication")
        os.fsync(output_descriptor)
        _require_output_identity_and_content(
            output_descriptor,
            parent_descriptor,
            output.name,
            expected_identity=output_identity,
            expected_bytes=expected_bytes,
            expected_sha256=expected_sha256,
        )
        os.fchmod(output_descriptor, 0o400)
        os.fsync(output_descriptor)
        os.fsync(parent_descriptor)
        _require_directory_path_identity(output.parent, parent_identity)
        _require_output_identity_and_content(
            output_descriptor,
            parent_descriptor,
            output.name,
            expected_identity=output_identity,
            expected_bytes=expected_bytes,
            expected_sha256=expected_sha256,
        )
    except Exception as exc:
        os.close(output_descriptor)
        raise JournalMigrationError(
            "journal publication failed and left an unverified output residue"
        ) from exc
    os.close(output_descriptor)


def migrate(
    repo_root: Path, source: Path, output: Path, cell_index: int
) -> dict[str, Any]:
    """Migrate *source* to *output* after complete current-source replay."""

    repo_root = repo_root.resolve()
    source = source.absolute()
    output = output.absolute()
    if isinstance(cell_index, bool) or not isinstance(cell_index, int):
        raise JournalMigrationError("cell index must be a plain integer")
    if source == output:
        raise JournalMigrationError("source and output paths must be distinct")
    output_parent_descriptor = _open_directory(output.parent)
    output_parent_info = os.fstat(output_parent_descriptor)
    output_parent_identity = (
        output_parent_info.st_dev,
        output_parent_info.st_ino,
    )
    try:
        _refuse_existing_at(
            output_parent_descriptor, output.name, "output journal", output
        )
        schedule = build_manifest(repo_root)
        job = build_bound_job(schedule, repo_root, cell_index)
        job_sha256 = json_sha256(job)
        materialized = instantiate_validated_bound_job(job, schedule, repo_root)
        detector_manifest = _detector_manifest(repo_root)
        proof_bank = build_source_order_bank(repo_root, materialized.instance)
        bank_detector_manifest = proof_bank.get("detector_manifest")
        lean_source_manifest = proof_bank.get("lean_source_manifest")
        if not isinstance(bank_detector_manifest, list) or not isinstance(
            lean_source_manifest, list
        ):
            raise JournalMigrationError(
                "proof-backed bank source manifest is malformed"
            )
        snapshot_manifest = _merge_source_manifests(
            detector_manifest,
            bank_detector_manifest,
            lean_source_manifest,
        )

        authenticated_sources = _authenticated_source_bytes(
            repo_root, snapshot_manifest
        )
        snapshot_detector_manifest = _manifest_from_authenticated_bytes(
            authenticated_sources, detector_manifest
        )
        if snapshot_detector_manifest != detector_manifest:
            raise JournalMigrationError("detector source snapshot drifted")
        snapshot_bank = build_source_order_bank_from_authenticated_sources(
            materialized.instance, authenticated_sources
        )
        if _canonical_json_bytes(snapshot_bank) != _canonical_json_bytes(proof_bank):
            raise JournalMigrationError("proof-backed bank snapshot drifted")
        detector_sha256 = _sha256_json(snapshot_detector_manifest)

        source_snapshot = io.BytesIO()
        with _open_regular_source(source) as source_handle:
            source_identity = _source_identity(source_handle)
            (
                record_count,
                old_detector_sha256,
                old_terminal_sha256,
                source_sha256,
            ) = _authenticate_source(
                source_handle,
                job_sha256=job_sha256,
                cell_index=cell_index,
                snapshot=source_snapshot,
            )
            if record_count == 0 or old_detector_sha256 is None:
                raise JournalMigrationError("source journal is empty")
            _require_source_path_identity(source, source_identity)

        source_snapshot_bytes = source_snapshot.getvalue()
        parent = job_sha256
        migrated_count = 0
        migration_source_digest = hashlib.sha256()
        candidate_digest = hashlib.sha256()
        candidate_buffer = io.BytesIO()
        for line_number, raw in enumerate(io.BytesIO(source_snapshot_bytes), 1):
            migration_source_digest.update(raw)
            record = _strict_record(raw, line_number)
            rewritten = _migrated_record(
                record,
                parent_sha256=parent,
                detector_sha256=detector_sha256,
            )
            parent = rewritten["record_sha256"]
            migrated_count += 1
            encoded = _canonical_json_bytes(rewritten) + b"\n"
            candidate_buffer.write(encoded)
            candidate_digest.update(encoded)
        if (
            migrated_count != record_count
            or migration_source_digest.hexdigest() != source_sha256
        ):
            raise JournalMigrationError(
                "authenticated source snapshot changed during migration"
            )
        candidate_payload = candidate_buffer.getvalue()
        candidate_byte_count = len(candidate_payload)
        candidate_sha256 = candidate_digest.hexdigest()

        replay_count, replay_parent, _ = replay_journal(
            None,
            materialized.instance,
            io.BytesIO(candidate_payload),
            job_sha256=job_sha256,
            detector_contract_sha256=detector_sha256,
            cell_index=cell_index,
            source_order_bank=snapshot_bank,
        )
        if replay_count != record_count or replay_parent != parent:
            raise JournalMigrationError(
                "current-source replay did not reproduce migrated chain"
            )
        _publish_without_overwrite(
            io.BytesIO(candidate_payload),
            output,
            output_parent_descriptor,
            parent_identity=output_parent_identity,
            expected_bytes=candidate_byte_count,
            expected_sha256=candidate_sha256,
        )
        _require_directory_path_identity(output.parent, output_parent_identity)
        with _open_regular_source(output) as published_handle:
            published_identity = _source_identity(published_handle)
            published_bytes, published_sha256 = _descriptor_digest(published_handle)
        _require_source_path_identity(output, published_identity)
        if (
            published_bytes != candidate_byte_count
            or published_sha256 != candidate_sha256
        ):
            raise JournalMigrationError(
                "published output failed secure-path receipt replay"
            )
        return {
            "records": record_count,
            "old_detector_contract_sha256": old_detector_sha256,
            "new_detector_contract_sha256": detector_sha256,
            "old_terminal_record_sha256": old_terminal_sha256,
            "new_terminal_record_sha256": parent,
            "output": str(output),
            "output_bytes": candidate_byte_count,
            "output_sha256": candidate_sha256,
            "output_parent_verified_at_publication": True,
            "current_source_replayed": True,
            "source_snapshot_replayed": True,
            "candidate_retired": True,
            "replay_inputs_in_memory": True,
        }
    except JournalMigrationError:
        raise
    except Exception as exc:
        raise JournalMigrationError(f"journal migration failed: {exc}") from exc
    finally:
        os.close(output_parent_descriptor)


rechain = migrate


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, required=True)
    parser.add_argument("--source", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--cell-index", type=int, required=True)
    args = parser.parse_args()
    try:
        result = rechain(args.repo_root, args.source, args.output, args.cell_index)
    except JournalMigrationError as exc:
        parser.exit(2, f"error: {exc}\n")
    print(json.dumps(result, sort_keys=True))


if __name__ == "__main__":
    main()
