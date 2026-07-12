#!/usr/bin/env python3
"""Create one resumable frozen probe from stopped probe checkpoints.

The transition is monotone and read-only with respect to every input.  It
freezes a target bank, strictly replays each stopped source checkpoint through
``frozen_separation_probe``, takes the ordered union of its dynamic exclusion
records, and rebuilds their clauses after the target bank and separation
encoding.  The finished directory is published by one directory rename, so an
ordinary ``frozen_separation_probe.py --resume`` never sees a partial import.

Source order is the order of repeated ``--source`` arguments; record order is
the checkpoint's SQLite ``seq`` order.  The first occurrence of a canonical
JSON pattern wins.  A dynamic pattern already seeded by the target bank is
omitted because the ordinary probe rejects seeded/checkpoint duplication.
"""

from __future__ import annotations

import argparse
from collections import Counter
from contextlib import contextmanager, ExitStack
from dataclasses import asdict, dataclass
from datetime import datetime, timezone
import errno
import fcntl
import hashlib
import json
import os
from pathlib import Path
import secrets
import shutil
import sqlite3
import sys
from typing import Any, Iterable, Mapping


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parent.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(REPO_ROOT))

import frozen_separation_probe as probe  # noqa: E402
from census.census_554.closure_checkpoint import (  # noqa: E402
    CheckpointError,
    ClosureCheckpoint,
)


SCHEMA = "census554_frozen_separation_transition.v1"
UNION_SCHEMA = "census554_frozen_separation_transition_union.v1"
IMPORT_BATCH = 2_000
LEGACY_RUNTIME_FINGERPRINTS = ({
    "probe": "94365f1a0bcd368023b7e54feb869c3b65b3439ac846fa0a92ffc466339d25ed",
    "profile": "11a2e0c4a8520c77d2eddf2da5907102f4c73050c5e5c8459caf8ad1d7a6e89b",
    "sat_cover": "68ff60a7ea5e9f1ce5455ee3575f8f45230bec1d193404d679b76aa8d7358b9c",
    "combinatorics": "7dbff611c58be4614f0496aba0c67e33be669155e1ea28f8a29ab23bf59b01e0",
    "closure_checkpoint": "cc53c2f4dc50d950187537a77347f5c40ce81ff1151fadf5987dd7d1a18752ce",
    "separation_encoding": "7fcd0ec01d7c429e72749a18913ace06345d46f4c2506e0f192e8141de0cb98d",
}, {
    "probe": "758ffa77f06fedccc53f011f96d52abd1f35fb44023c282d0ecd98a49d954dd4",
    "profile": "11a2e0c4a8520c77d2eddf2da5907102f4c73050c5e5c8459caf8ad1d7a6e89b",
    "sat_cover": "68ff60a7ea5e9f1ce5455ee3575f8f45230bec1d193404d679b76aa8d7358b9c",
    "combinatorics": "7dbff611c58be4614f0496aba0c67e33be669155e1ea28f8a29ab23bf59b01e0",
    "closure_checkpoint": "cc53c2f4dc50d950187537a77347f5c40ce81ff1151fadf5987dd7d1a18752ce",
    "convex_structural_seeds": "b32d915189b196964563f1719157f3519691f3ff2e1f2d3ee17885b82bd1f766",
    "separation_encoding": "7fcd0ec01d7c429e72749a18913ace06345d46f4c2506e0f192e8141de0cb98d",
},)


class TransitionError(RuntimeError):
    pass


def _canonical_json(value: Any) -> str:
    try:
        return json.dumps(
            value, sort_keys=True, separators=(",", ":"), allow_nan=False
        )
    except (TypeError, ValueError) as exc:
        raise TransitionError("value is not canonical-JSON compatible") from exc


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _is_sha256(value: Any) -> bool:
    return (
        isinstance(value, str)
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    )


def _validate_run_metadata(metadata: Any, *, source: Path) -> dict[str, Any]:
    if not isinstance(metadata, dict):
        raise TransitionError(f"source metadata is not an object: {source}")
    if metadata.get("schema") != probe.SCHEMA:
        raise TransitionError(f"source metadata has the wrong schema: {source}")
    if not _is_sha256(metadata.get("bank_sha256")):
        raise TransitionError(f"source metadata has an invalid bank hash: {source}")
    rows = metadata.get("bank_rows")
    if not isinstance(rows, int) or isinstance(rows, bool) or rows < 0:
        raise TransitionError(f"source metadata has an invalid bank row count: {source}")
    seed = metadata.get("seed")
    if (
        not isinstance(seed, int)
        or isinstance(seed, bool)
        or not 0 <= seed <= probe.MAX_CADICAL_SEED
    ):
        raise TransitionError(f"source metadata has an invalid seed: {source}")
    if not isinstance(metadata.get("created_utc"), str):
        raise TransitionError(f"source metadata has no creation time: {source}")
    runtime_fingerprint = metadata.get("runtime_fingerprint")
    if (
        runtime_fingerprint != probe._runtime_fingerprint()
        and runtime_fingerprint not in LEGACY_RUNTIME_FINGERPRINTS
    ):
        raise TransitionError(
            f"source runtime fingerprint is stale or tampered: {source}"
        )
    return metadata


def _load_source_metadata(source: Path) -> tuple[dict[str, Any], str]:
    path = source / "run_metadata.json"
    try:
        raw = path.read_bytes()
        metadata = json.loads(raw)
    except (FileNotFoundError, json.JSONDecodeError) as exc:
        raise TransitionError(f"source metadata is absent or malformed: {source}") from exc
    return _validate_run_metadata(metadata, source=source), _sha256_bytes(raw)


def _bank_row_digests(
    rows: list[dict[str, Any]], raw: bytes
) -> tuple[tuple[str, str], ...]:
    lines = raw.splitlines(keepends=True)
    if len(lines) != len(rows):
        raise TransitionError("bank byte rows and parsed rows disagree")
    return tuple(
        (probe._row_sha256(row), _sha256_bytes(line))
        for row, line in zip(rows, lines)
    )


def _require_digest_subset(
    source_digests: Iterable[tuple[str, str]],
    target_digests: Iterable[tuple[str, str]],
    *,
    source: Path,
) -> None:
    source_counts = Counter(source_digests)
    target_counts = Counter(target_digests)
    missing = source_counts - target_counts
    if missing:
        digest, count = next(iter(missing.items()))
        raise TransitionError(
            "source bank is not an exact digest-preserving subset of the "
            f"target bank ({source}; missing {digest!r} x{count})"
        )


@contextmanager
def _stopped_source_lock(source: Path):
    """Prove a source is not running without creating or changing its lock."""

    lock_path = source / probe.WORKDIR_LOCK
    if not lock_path.is_file():
        raise TransitionError(f"source has no probe lock file: {source}")
    descriptor = os.open(lock_path, os.O_RDONLY)
    try:
        try:
            fcntl.flock(descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except OSError as exc:
            if exc.errno in (errno.EACCES, errno.EAGAIN):
                raise TransitionError(f"source probe is still running: {source}") from exc
            raise
        try:
            yield
        finally:
            fcntl.flock(descriptor, fcntl.LOCK_UN)
    finally:
        os.close(descriptor)


class _OrderedUnion:
    """Disk-backed first-occurrence union in source/seq insertion order."""

    def __init__(self, path: Path) -> None:
        self.path = path
        self.connection = sqlite3.connect(path)
        self.connection.execute("PRAGMA journal_mode=DELETE")
        self.connection.execute("PRAGMA synchronous=FULL")
        with self.connection:
            self.connection.executescript(
                """
                CREATE TABLE metadata (
                  singleton INTEGER PRIMARY KEY CHECK (singleton = 1),
                  schema TEXT NOT NULL
                );
                INSERT INTO metadata(singleton, schema)
                  VALUES (1, 'census554_frozen_separation_transition_union.v1');
                CREATE TABLE records (
                  union_seq INTEGER PRIMARY KEY AUTOINCREMENT,
                  pattern_key TEXT NOT NULL UNIQUE,
                  record_json TEXT NOT NULL,
                  source_ordinal INTEGER NOT NULL,
                  source_seq INTEGER NOT NULL
                );
                """
            )

    def add(
        self,
        record: Mapping[str, Any],
        *,
        source_ordinal: int,
        source_seq: int,
    ) -> bool:
        pattern_key = _canonical_json(record.get("pattern"))
        record_json = _canonical_json(dict(record))
        old = self.connection.execute(
            "SELECT record_json FROM records WHERE pattern_key = ?",
            (pattern_key,),
        ).fetchone()
        if old is not None:
            old_record = json.loads(old[0])
            old_structural = probe._is_structural_checkpoint_record(old_record)
            new_structural = probe._is_structural_checkpoint_record(record)
            if old_structural != new_structural:
                raise TransitionError(
                    "same pattern has mixed algebra/structural provenance"
                )
            if old_structural and new_structural:
                def semantic(value):
                    normalized = dict(value)
                    normalized.pop("clause", None)
                    normalized.pop("additional_clauses", None)
                    return _canonical_json(normalized)

                if semantic(old_record) != semantic(record):
                    raise TransitionError(
                        "same structural pattern has conflicting theorem/order provenance"
                    )
            return False
        before = self.connection.total_changes
        self.connection.execute(
            """INSERT INTO records(
                 pattern_key, record_json, source_ordinal, source_seq
               ) VALUES (?, ?, ?, ?)""",
            (pattern_key, record_json, source_ordinal, source_seq),
        )
        return self.connection.total_changes != before

    def commit(self) -> None:
        self.connection.commit()

    def count(self) -> int:
        return int(self.connection.execute("SELECT COUNT(*) FROM records").fetchone()[0])

    def records(self):
        cursor = self.connection.execute(
            """SELECT record_json, source_ordinal, source_seq
               FROM records ORDER BY union_seq"""
        )
        for record_json, source_ordinal, source_seq in cursor:
            record = json.loads(record_json)
            if not isinstance(record, dict):
                raise TransitionError("union spool contains a non-object record")
            yield record, int(source_ordinal), int(source_seq)

    def close(self) -> None:
        self.connection.close()


@dataclass(frozen=True)
class SourceManifest:
    ordinal: int
    run: str
    created_utc: str
    seed: int
    metadata_sha256: str
    bank_sha256: str
    bank_rows: int
    checkpoint_artifact_sha256: dict[str, str]
    checkpoint_records: int
    checkpoint_record_stream_sha256: str
    checkpoint_iteration: int
    checkpoint_elapsed_seconds: float
    checkpoint_status: str
    terminal_result_sha256: str | None
    terminal_alias_sha256: dict[str, str]
    union_new_records: int
    convex_structural_seeds: dict[str, Any] | None
    convex_structural_profile_orbits: int
    convex_structural_profile_orbit_sha256: str
    formalized_structural_oracle: dict[str, Any] | None


def _structural_orbit_keys(artifact) -> frozenset[tuple]:
    """Canonical static clauses implied by a validated structural artifact."""

    if artifact is None:
        return frozenset()
    keys = frozenset(artifact.profile_orbit_keys)
    if keys != frozenset(
        probe.combinatorics.serialize_pattern(pattern)
        for pattern in artifact.patterns
    ):
        raise TransitionError(
            "validated structural pattern/orbit identity surface drifted"
        )
    return keys


def _orbit_key_digest(keys: Iterable[tuple]) -> str:
    digest = hashlib.sha256()
    for key in sorted(keys):
        encoded = _canonical_json(key).encode("utf-8")
        digest.update(len(encoded).to_bytes(8, "big"))
        digest.update(encoded)
    return digest.hexdigest()


def _require_structural_seed_preservation(
    *,
    source: Path,
    source_seed_metadata: Mapping[str, Any] | None,
    source_orbits: frozenset[tuple],
    target_seed_metadata: Mapping[str, Any] | None,
    target_orbits: frozenset[tuple],
    target_theorem_ids: frozenset[str],
) -> None:
    source_theorem_ids = (
        frozenset()
        if source_seed_metadata is None
        else frozenset(source_seed_metadata["theorem_ids"])
    )
    if (
        not source_orbits <= target_orbits
        or not source_theorem_ids <= target_theorem_ids
    ):
        raise TransitionError(
            "target convex structural seeds are not a semantic "
            f"superset of source {source}"
        )
    if source_seed_metadata is None:
        return
    if target_seed_metadata is None:
        raise TransitionError("target structural theorem evidence is absent")
    evidence_fields = (
        "theorem_build_status",
        "theorem_source_sha256",
        "theorem_contract_sha256",
    )
    if any(
        source_seed_metadata.get(field) != target_seed_metadata.get(field)
        for field in evidence_fields
    ):
        raise TransitionError(
            "target convex structural theorem evidence drifts or downgrades "
            f"source {source}"
        )


def _require_structural_oracle_preservation(
    *, source: Path,
    source_metadata: Mapping[str, Any] | None,
    target_metadata: Mapping[str, Any],
) -> None:
    if source_metadata is None:
        return
    required_equal = (
        "schema", "contract_sha256", "ordering_policy", "build_status",
        "build_target", "axiom_audit_theorem", "expected_axioms",
        "theorem_sources",
    )
    if any(source_metadata.get(field) != target_metadata.get(field)
           for field in required_equal):
        raise TransitionError(
            "target formalized structural oracle drifts or downgrades "
            f"source {source}"
        )
    if not set(source_metadata.get("eligible_family_ids", ())) <= set(
        target_metadata.get("eligible_family_ids", ())
    ):
        raise TransitionError(
            f"target structural oracle drops a source family: {source}"
        )


def _artifact_hashes(source: Path) -> dict[str, str]:
    result = {}
    for name in (
        "checkpoint.sqlite3",
        "checkpoint.sqlite3-wal",
        "checkpoint.sqlite3-shm",
    ):
        path = source / name
        if path.is_file():
            result[name] = _sha256_file(path)
    return result


def _verify_artifact_hashes(
    source: Path, expected: Mapping[str, str]
) -> None:
    current = _artifact_hashes(source)
    if current != dict(expected):
        raise TransitionError(
            f"source checkpoint artifacts changed while locked: {source}"
        )


def _copy_checkpoint_artifacts(
    source: Path, destination: Path
) -> dict[str, str]:
    """Freeze SQLite plus its crash-recovery sidecars without opening them."""

    expected = _artifact_hashes(source)
    if "checkpoint.sqlite3" not in expected:
        raise TransitionError(f"source checkpoint is absent: {source}")
    destination.mkdir()
    try:
        for name, digest in expected.items():
            source_path = source / name
            destination_path = destination / name
            with open(source_path, "rb") as source_handle, open(
                destination_path, "xb"
            ) as destination_handle:
                shutil.copyfileobj(source_handle, destination_handle, 1 << 20)
                destination_handle.flush()
                os.fsync(destination_handle.fileno())
            if _sha256_file(destination_path) != digest:
                raise TransitionError(
                    f"private checkpoint copy hash mismatch: {source_path}"
                )
        probe._fsync_dir(destination)
        # A non-cooperating writer could ignore the workdir lock.  Detect it
        # before any copied database is trusted.
        _verify_artifact_hashes(source, expected)
        return expected
    except Exception:
        _remove_private_checkpoint(destination)
        raise


def _remove_private_checkpoint(directory: Path) -> None:
    """Remove only a transition-owned private SQLite-copy directory."""

    if not directory.exists():
        return
    for child in directory.iterdir():
        if child.is_dir() and not child.is_symlink():
            raise TransitionError(
                f"unexpected directory in private checkpoint copy: {child}"
            )
        child.unlink()
    directory.rmdir()
    probe._fsync_dir(directory.parent)


def _terminal_hashes(
    source: Path, metadata: Mapping[str, Any], progress
) -> tuple[str | None, dict[str, str]]:
    """Validate and hash a terminal result without promoting its conclusion."""

    if progress.status not in probe.TERMINAL_STATUSES:
        return None, {}
    result_path = source / "result.json"
    try:
        raw = result_path.read_bytes()
        result = json.loads(raw)
    except (FileNotFoundError, json.JSONDecodeError) as exc:
        raise TransitionError(
            f"terminal source has no valid result artifact: {source}"
        ) from exc
    if not isinstance(result, dict):
        raise TransitionError(f"terminal source result is not an object: {source}")
    expected = {
        "status": progress.status,
        "iteration": progress.iteration,
        "bank_sha256": metadata["bank_sha256"],
        "seed": metadata["seed"],
    }
    for key, value in expected.items():
        if result.get(key) != value:
            raise TransitionError(
                f"terminal source result disagrees on {key}: {source}"
            )
    aliases = {}
    if progress.status == "combined-frontier":
        alias = source / "combined_frontier.json"
        try:
            alias_raw = alias.read_bytes()
        except FileNotFoundError as exc:
            raise TransitionError(
                f"combined-frontier source has no alias artifact: {source}"
            ) from exc
        if alias_raw != raw:
            raise TransitionError(
                f"combined-frontier alias differs from result: {source}"
            )
        aliases[alias.name] = _sha256_bytes(alias_raw)
    return _sha256_bytes(raw), aliases


def _scan_source(
    source: Path,
    *,
    ordinal: int,
    target_digests: tuple[tuple[str, str], ...],
    union: _OrderedUnion,
    staging: Path,
) -> tuple[SourceManifest, frozenset[tuple]]:
    metadata, metadata_sha256 = _load_source_metadata(source)
    snapshot = source / "bank_snapshot.jsonl"
    try:
        rows, raw = probe.read_frozen_bank(snapshot)
    except (OSError, probe.ProbeError) as exc:
        raise TransitionError(f"source bank snapshot is invalid: {source}") from exc
    if _sha256_bytes(raw) != metadata["bank_sha256"]:
        raise TransitionError(f"source bank snapshot hash mismatch: {source}")
    if len(rows) != metadata["bank_rows"]:
        raise TransitionError(f"source bank snapshot row count mismatch: {source}")
    try:
        structural_artifact = probe._load_structural_seed_snapshot(
            source, metadata
        )
        structural_oracle_catalog = probe._load_structural_oracle_snapshot(
            source, metadata, require_current_catalog=False
        )
    except probe.ProbeError as exc:
        raise TransitionError(
            f"source structural snapshot is invalid: {source}"
        ) from exc
    _require_digest_subset(
        _bank_row_digests(rows, raw), target_digests, source=source
    )

    private = staging / f".source-{ordinal:04d}-checkpoint-copy"
    artifact_hashes = _copy_checkpoint_artifacts(source, private)
    checkpoint = None
    try:
        try:
            checkpoint = ClosureCheckpoint.open(
                private / "checkpoint.sqlite3", metadata
            )
        except CheckpointError as exc:
            raise TransitionError(f"source checkpoint is invalid: {source}") from exc
        try:
            progress = checkpoint.progress()
            terminal_result_sha256, terminal_alias_sha256 = _terminal_hashes(
                source, metadata, progress
            )
            # This is the probe's strict source-row, support-injection, and
            # insertion-order clause replay.  Do not accept merely parseable
            # checkpoint JSON here.
            try:
                prepared = probe._prepare_formula(
                    rows,
                    checkpoint,
                    () if structural_artifact is None
                    else structural_artifact.patterns,
                    structural_oracle_catalog,
                )
            except (CheckpointError, probe.ProbeError, KeyError, ValueError) as exc:
                raise TransitionError(
                    f"source checkpoint provenance/replay failed: {source}"
                ) from exc
            del prepared

            sources, _ = probe._source_rows(rows)
            source_lookup = probe._source_lookup(sources)
            record_digest = hashlib.sha256()
            record_count = 0
            inserted = 0
            for source_seq, record in enumerate(checkpoint.records(), 1):
                # Reuse the exact validator while obtaining the canonical
                # pattern for the ordered union.  _prepare_formula above has
                # independently checked the stored clause as well.
                if probe._is_structural_checkpoint_record(record):
                    probe._structural_checkpoint_info(
                        record, structural_oracle_catalog
                    )
                else:
                    probe._validate_checkpoint_provenance(record, source_lookup)
                encoded = _canonical_json(record).encode("utf-8")
                record_digest.update(len(encoded).to_bytes(8, "big"))
                record_digest.update(encoded)
                if union.add(
                    record,
                    source_ordinal=ordinal,
                    source_seq=source_seq,
                ):
                    inserted += 1
                record_count += 1
            if record_count != progress.instance_count:
                raise TransitionError(
                    f"private checkpoint count disagrees with progress: {source}"
                )
            union.commit()
        finally:
            if checkpoint is not None:
                checkpoint.close()
        _verify_artifact_hashes(source, artifact_hashes)
    finally:
        _remove_private_checkpoint(private)

    structural_orbit_keys = _structural_orbit_keys(structural_artifact)
    return SourceManifest(
        ordinal=ordinal,
        run=str(source),
        created_utc=str(metadata["created_utc"]),
        seed=int(metadata["seed"]),
        metadata_sha256=metadata_sha256,
        bank_sha256=str(metadata["bank_sha256"]),
        bank_rows=int(metadata["bank_rows"]),
        checkpoint_artifact_sha256=artifact_hashes,
        checkpoint_records=record_count,
        checkpoint_record_stream_sha256=record_digest.hexdigest(),
        checkpoint_iteration=progress.iteration,
        checkpoint_elapsed_seconds=progress.elapsed_seconds,
        checkpoint_status=progress.status,
        terminal_result_sha256=terminal_result_sha256,
        terminal_alias_sha256=terminal_alias_sha256,
        union_new_records=inserted,
        convex_structural_seeds=metadata.get("convex_structural_seeds"),
        convex_structural_profile_orbits=len(structural_orbit_keys),
        convex_structural_profile_orbit_sha256=_orbit_key_digest(
            structural_orbit_keys
        ),
        formalized_structural_oracle=metadata.get(
            "formalized_structural_oracle"
        ),
    ), structural_orbit_keys


def _allocate_paths(
    *, work_root: Path, output: Path | None
) -> tuple[Path, Path]:
    if output is not None:
        final = output.resolve()
        final.parent.mkdir(parents=True, exist_ok=True)
        if final.exists():
            raise TransitionError(f"output already exists: {final}")
    else:
        root = work_root.resolve()
        root.mkdir(parents=True, exist_ok=True)
        stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
        final = root / (
            f"run-{stamp}-{os.getpid()}-{secrets.token_hex(4)}"
        )
    staging = final.with_name(f".{final.name}.transition-{secrets.token_hex(4)}")
    try:
        staging.mkdir()
    except FileExistsError as exc:
        raise TransitionError(f"transition staging path exists: {staging}") from exc
    probe._fsync_dir(staging.parent)
    return final, staging


def _target_metadata(
    *,
    target_raw: bytes,
    target_rows: int,
    seed: int,
    sources: list[SourceManifest],
    union_records: int,
    structural_metadata: Mapping[str, Any] | None,
    structural_oracle_metadata: Mapping[str, Any],
) -> dict[str, Any]:
    return {
        "schema": probe.SCHEMA,
        "bank_sha256": _sha256_bytes(target_raw),
        "bank_rows": target_rows,
        "seed": seed,
        "created_utc": datetime.now(timezone.utc).isoformat(),
        "runtime_fingerprint": probe._runtime_fingerprint(),
        "convex_structural_seeds": (
            None if structural_metadata is None else dict(structural_metadata)
        ),
        "formalized_structural_oracle": dict(structural_oracle_metadata),
        "migration_provenance": {
            "schema": SCHEMA,
            "transition_utility_sha256": _sha256_file(Path(__file__).resolve()),
            "source_order": "command-line order, then checkpoint seq",
            "deduplication": "first canonical JSON pattern wins",
            "source_runs": [asdict(source) for source in sources],
            "source_checkpoint_records": sum(
                source.checkpoint_records for source in sources
            ),
            "union_dynamic_records": union_records,
        },
    }


def _publish_target(
    *,
    final: Path,
    staging: Path,
    target_rows: list[dict[str, Any]],
    target_raw: bytes,
    metadata: Mapping[str, Any],
    union: _OrderedUnion,
    structural_artifact,
    structural_raw: bytes | None,
    structural_source_raw: bytes | None,
    structural_theorem_raw: bytes | None,
    structural_oracle_catalog: Mapping[str, Any],
    structural_oracle_raw: bytes,
    structural_oracle_sources: Mapping[str, bytes],
) -> dict[str, Any]:
    probe._atomic_write_bytes(staging / "bank_snapshot.jsonl", target_raw)
    if structural_raw is not None:
        probe._atomic_write_bytes(
            staging / probe.STRUCTURAL_SEED_SNAPSHOT, structural_raw
        )
        if structural_source_raw is None:
            raise TransitionError("structural source-result bytes are absent")
        probe._atomic_write_bytes(
            staging / probe.STRUCTURAL_SOURCE_SNAPSHOT,
            structural_source_raw,
        )
        if structural_theorem_raw is None:
            raise TransitionError("structural theorem-source bytes are absent")
        probe._atomic_write_bytes(
            staging / probe.STRUCTURAL_THEOREM_SNAPSHOT,
            structural_theorem_raw,
        )
    probe._write_structural_oracle_snapshot(
        staging, structural_oracle_raw, structural_oracle_sources
    )
    probe._atomic_write_json(staging / "run_metadata.json", metadata)
    checkpoint = ClosureCheckpoint.create(
        staging / "checkpoint.sqlite3", metadata
    )
    try:
        instance, separation, _representatives, seen, seed_instances = (
            probe._prepare_formula(
                target_rows,
                checkpoint,
                () if structural_artifact is None
                else structural_artifact.patterns,
                structural_oracle_catalog,
            )
        )
        seed_inventory = instance.seed_inventory
        target_sources, _ = probe._source_rows(target_rows)
        target_lookup = probe._source_lookup(target_sources)
        imported = 0
        seed_collisions = 0
        batch = []
        for record, _source_ordinal, _source_seq in union.records():
            if probe._is_structural_checkpoint_record(record):
                pattern, cut_scope, detections = probe._structural_checkpoint_info(
                    record, structural_oracle_catalog
                )
            else:
                pattern = probe._validate_checkpoint_provenance(
                    record, target_lookup
                )
                cut_scope = "unconditional"
                detections = ()
            serialized = probe.combinatorics.serialize_pattern(pattern)
            if serialized in seen:
                seed_collisions += 1
                continue
            if probe._is_structural_checkpoint_record(record):
                clauses = probe._add_structural_clauses(
                    instance, separation, pattern, cut_scope, detections
                )
                rebuilt = probe._record_with_clauses(record, clauses)
                if cut_scope == "order-conditional":
                    instance.ordered_seen[serialized] = {
                        probe._order_key(
                            probe.formalized_structural_oracle.order_from_record(
                                detection["order"]
                            )
                        )
                        for detection in detections
                    }
                else:
                    instance.unconditional_seen.add(serialized)
            else:
                rebuilt = dict(record)
                rebuilt["clause"] = instance.add_pattern_instance(pattern)
                instance.unconditional_seen.add(serialized)
            batch.append(rebuilt)
            seen.add(serialized)
            imported += 1
            if len(batch) >= IMPORT_BATCH:
                checkpoint.append_batch(
                    batch,
                    iteration=0,
                    elapsed_seconds=0.0,
                    status="initialized",
                )
                batch.clear()
        checkpoint.append_batch(
            batch,
            iteration=0,
            elapsed_seconds=0.0,
            status="initialized",
        )
        if checkpoint.progress().instance_count != imported:
            raise TransitionError("target checkpoint import count drifted")
    finally:
        checkpoint.close()

    manifest = {
        "schema": SCHEMA,
        "status": "ready-for-resume",
        "workdir": str(final),
        "bank_sha256": metadata["bank_sha256"],
        "bank_rows": metadata["bank_rows"],
        "seed": metadata["seed"],
        "seed_instances": seed_instances,
        "seed_inventory": seed_inventory,
        "convex_structural_seeds": metadata.get("convex_structural_seeds"),
        "formalized_structural_oracle": metadata.get(
            "formalized_structural_oracle"
        ),
        "source_checkpoint_records": metadata["migration_provenance"][
            "source_checkpoint_records"
        ],
        "union_dynamic_records": metadata["migration_provenance"][
            "union_dynamic_records"
        ],
        "imported_dynamic_records": imported,
        "target_seed_collisions": seed_collisions,
        "instances": len(seen),
        "iteration": 0,
        "updated_utc": datetime.now(timezone.utc).isoformat(),
    }
    progress = {
        **manifest,
        "schema": probe.SCHEMA,
        "status": "initialized",
        "migration_schema": SCHEMA,
    }
    probe._atomic_write_json(staging / "migration_manifest.json", manifest)
    probe._atomic_write_json(staging / "progress.json", progress)
    descriptor = os.open(
        staging / probe.WORKDIR_LOCK, os.O_RDWR | os.O_CREAT | os.O_EXCL, 0o600
    )
    os.close(descriptor)
    probe._fsync_dir(staging)
    if final.exists():
        raise TransitionError(f"output appeared during transition: {final}")
    os.replace(staging, final)
    probe._fsync_dir(final.parent)
    return manifest


def transition(args) -> tuple[Path, dict[str, Any]]:
    sources = [path.resolve() for path in args.source]
    if not sources:
        raise TransitionError("at least one source run is required")
    if len(set(sources)) != len(sources):
        raise TransitionError("the same source run was supplied more than once")
    for source in sources:
        if not source.is_dir():
            raise TransitionError(f"source run does not exist: {source}")

    target_rows, target_raw = probe.read_frozen_bank(args.bank.resolve())
    target_digests = _bank_row_digests(target_rows, target_raw)
    structural_path = getattr(args, "convex_structural_seeds", None)
    if structural_path is None:
        structural_artifact = None
        structural_raw = None
        structural_source_raw = None
        structural_theorem_raw = None
        structural_metadata = None
    else:
        structural_artifact, structural_raw = (
            probe._read_structural_seed_artifact(structural_path.resolve())
        )
        structural_metadata = probe._structural_seed_metadata(
            structural_artifact, structural_raw
        )
        structural_source_raw = structural_artifact.source_result_bytes
        structural_theorem_raw = structural_artifact.theorem_source_bytes
    target_structural_orbits = _structural_orbit_keys(structural_artifact)
    target_theorem_ids = (
        frozenset() if structural_artifact is None
        else frozenset(structural_artifact.theorem_ids)
    )
    (
        structural_oracle_catalog,
        structural_oracle_raw,
        structural_oracle_sources,
        structural_oracle_metadata,
    ) = probe._prepare_structural_oracle_snapshot()
    seed = args.seed
    if seed is None:
        seed = secrets.randbelow(probe.MAX_CADICAL_SEED + 1)

    final, staging = _allocate_paths(
        work_root=args.work_root, output=args.output
    )
    # Acquire the complete lock set before inspecting the first source, and
    # retain it until publication and temporary-spool cleanup both finish.
    # A source therefore cannot be resumed after it was scanned while a later
    # source or the target is still being processed.
    with ExitStack() as source_locks:
        for source in sources:
            source_locks.enter_context(_stopped_source_lock(source))
        union = _OrderedUnion(staging / "migration_union.sqlite3")
        try:
            manifests = []
            for ordinal, source in enumerate(sources):
                source_manifest, source_structural_orbits = _scan_source(
                    source,
                    ordinal=ordinal,
                    target_digests=target_digests,
                    union=union,
                    staging=staging,
                )
                _require_structural_seed_preservation(
                    source=source,
                    source_seed_metadata=(
                        source_manifest.convex_structural_seeds
                    ),
                    source_orbits=source_structural_orbits,
                    target_seed_metadata=structural_metadata,
                    target_orbits=target_structural_orbits,
                    target_theorem_ids=target_theorem_ids,
                )
                _require_structural_oracle_preservation(
                    source=source,
                    source_metadata=(
                        source_manifest.formalized_structural_oracle
                    ),
                    target_metadata=structural_oracle_metadata,
                )
                manifests.append(source_manifest)
            metadata = _target_metadata(
                target_raw=target_raw,
                target_rows=len(target_rows),
                seed=seed,
                sources=manifests,
                union_records=union.count(),
                structural_metadata=structural_metadata,
                structural_oracle_metadata=structural_oracle_metadata,
            )
            manifest = _publish_target(
                final=final,
                staging=staging,
                target_rows=target_rows,
                target_raw=target_raw,
                metadata=metadata,
                union=union,
                structural_artifact=structural_artifact,
                structural_raw=structural_raw,
                structural_source_raw=structural_source_raw,
                structural_theorem_raw=structural_theorem_raw,
                structural_oracle_catalog=structural_oracle_catalog,
                structural_oracle_raw=structural_oracle_raw,
                structural_oracle_sources=structural_oracle_sources,
            )
        finally:
            union.close()
        # The spool is inside staging during construction, then inside final
        # after publication.  It is not part of the resume surface.
        spool = final / "migration_union.sqlite3"
        if spool.exists():
            spool.unlink()
            probe._fsync_dir(final)
        for source, source_manifest in zip(sources, manifests):
            _verify_artifact_hashes(
                source, source_manifest.checkpoint_artifact_sha256
            )
    return final, manifest


def _parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bank", type=Path, default=HERE / "bank.jsonl")
    parser.add_argument(
        "--source", type=Path, action="append", required=True,
        help="stopped frozen-probe run directory; repeat in desired union order",
    )
    parser.add_argument(
        "--work-root", type=Path, default=HERE / "separation_probe_runs"
    )
    parser.add_argument("--output", type=Path)
    parser.add_argument("--seed", type=int)
    parser.add_argument(
        "--convex-structural-seeds",
        type=Path,
        help=(
            "validated theorem-backed convex structural seeds for the target; "
            "kept separate from the algebra bank"
        ),
    )
    args = parser.parse_args(argv)
    if args.seed is not None and not 0 <= args.seed <= probe.MAX_CADICAL_SEED:
        parser.error(f"seed must be in 0..{probe.MAX_CADICAL_SEED}")
    return args


def main(argv=None) -> int:
    args = _parse_args(argv)
    try:
        workdir, manifest = transition(args)
    except (OSError, sqlite3.Error, CheckpointError, probe.ProbeError, TransitionError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr, flush=True)
        return 1
    print(json.dumps({**manifest, "workdir": str(workdir)}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
