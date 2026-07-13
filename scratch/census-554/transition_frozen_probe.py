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
import perp_subsumption_cache as perp_cache  # noqa: E402
import perp_subsumption_cached_probe as cached_probe  # noqa: E402
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
}, {
    # Preservation source for the active bank-first oracle started on
    # 2026-07-11.  Transition still strictly replays every stored record.
    "probe": "770a3281d5566eba403352104a26c1a4433f0fc92e4211a8903fc6ff356f6e59",
    "profile": "11a2e0c4a8520c77d2eddf2da5907102f4c73050c5e5c8459caf8ad1d7a6e89b",
    "sat_cover": "68ff60a7ea5e9f1ce5455ee3575f8f45230bec1d193404d679b76aa8d7358b9c",
    "combinatorics": "7dbff611c58be4614f0496aba0c67e33be669155e1ea28f8a29ab23bf59b01e0",
    "closure_checkpoint": "cc53c2f4dc50d950187537a77347f5c40ce81ff1151fadf5987dd7d1a18752ce",
    "convex_structural_seeds": "b32d915189b196964563f1719157f3519691f3ff2e1f2d3ee17885b82bd1f766",
    "formalized_structural_oracle": "693259f73697a93dca9b22fae4e860ec217c4749bd66649158dc5136337c487e",
    "metric_structural_detectors": "d7a727f2130cc28f5d7c5d92af9e58a6e9f40179aa2490e5c0eab5b890e2382e",
    "separation_encoding": "7fcd0ec01d7c429e72749a18913ace06345d46f4c2506e0f192e8141de0cb98d",
}, {
    # Cached perpendicular-core successor launched on 2026-07-13. Its exact
    # runtime is an immutable source for the thirteen-family transition.
    "probe": "af976f294cb251b2a1c3795f2a9f9629f3f27faa09b287f60fb773a2a2004bc3",
    "profile": "11a2e0c4a8520c77d2eddf2da5907102f4c73050c5e5c8459caf8ad1d7a6e89b",
    "sat_cover": "68ff60a7ea5e9f1ce5455ee3575f8f45230bec1d193404d679b76aa8d7358b9c",
    "combinatorics": "7dbff611c58be4614f0496aba0c67e33be669155e1ea28f8a29ab23bf59b01e0",
    "closure_checkpoint": "cc53c2f4dc50d950187537a77347f5c40ce81ff1151fadf5987dd7d1a18752ce",
    "convex_structural_seeds": "b32d915189b196964563f1719157f3519691f3ff2e1f2d3ee17885b82bd1f766",
    "formalized_structural_oracle": "693259f73697a93dca9b22fae4e860ec217c4749bd66649158dc5136337c487e",
    "perp_bisector_template_seeds": "1145b21cb918c240e680302a1f99413f4e884a5ac59147490f9bebc3be794325",
    "metric_structural_detectors": "d7a727f2130cc28f5d7c5d92af9e58a6e9f40179aa2490e5c0eab5b890e2382e",
    "separation_encoding": "7fcd0ec01d7c429e72749a18913ace06345d46f4c2506e0f192e8141de0cb98d",
    "perp_subsumption_cached_probe": "0f208c9b1b92a46b29a3dd6d4db52aac4c6986bd6cff1ba9498748be26c9e751",
    "perp_subsumption_cache_code": "cb983b57d97ac4067b0fa930bad3401737a0278a9265d30176615c925ef4e4b0",
    "perp_subsumption_cache_artifact": "0a24950c5feeb41e4a214a7deebd69865e1eca662b08dcc5e338391e82b3b9ff",
    "perp_subsumption_policy": "7127956003c533beae75686aab86303a9c12ff3217b64383aa57e200aa1c445e",
},)

STRUCTURAL_ORACLE_AGGREGATE_SOURCE = (
    "lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean"
)


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
                    provenance = normalized.get("provenance")
                    if isinstance(provenance, Mapping):
                        provenance = dict(provenance)
                        # Each source record has already replayed against its
                        # snapshotted catalog. The target will replay it again
                        # after rebinding this catalog digest.
                        provenance.pop("oracle_contract_sha256", None)
                        normalized["provenance"] = provenance
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
        "schema", "ordering_policy", "build_status",
        "build_target", "axiom_audit_theorem", "expected_axioms",
        "trust",
    )
    if any(source_metadata.get(field) != target_metadata.get(field)
           for field in required_equal):
        raise TransitionError(
            "target formalized structural oracle drifts or downgrades "
            f"source {source}"
        )
    expected_axioms = source_metadata.get("expected_axioms")
    if (
        source_metadata.get("axiom_audit_result") != expected_axioms
        or target_metadata.get("axiom_audit_result") != expected_axioms
    ):
        raise TransitionError(
            "target structural oracle axiom evidence drifts or downgrades "
            f"source {source}"
        )

    source_eligible = set(source_metadata.get("eligible_family_ids", ()))
    target_eligible = set(target_metadata.get("eligible_family_ids", ()))
    source_families = source_eligible | set(
        source_metadata.get("ineligible_family_ids", ())
    )
    target_families = target_eligible | set(
        target_metadata.get("ineligible_family_ids", ())
    )
    if not source_families <= target_families or not (
        source_eligible <= target_eligible
    ):
        raise TransitionError(
            f"target structural oracle drops a source family: {source}"
        )

    def evidence_by_path(metadata, field):
        entries = metadata.get(field)
        if not isinstance(entries, list):
            raise TransitionError(
                f"structural oracle {field} evidence is malformed: {source}"
            )
        result = {}
        for entry in entries:
            if (
                not isinstance(entry, Mapping)
                or not isinstance(entry.get("path"), str)
                or not _is_sha256(entry.get("sha256"))
                or entry["path"] in result
            ):
                raise TransitionError(
                    f"structural oracle {field} evidence is malformed: {source}"
                )
            result[entry["path"]] = dict(entry)
        return result

    source_sources = evidence_by_path(source_metadata, "theorem_sources")
    target_sources = evidence_by_path(target_metadata, "theorem_sources")
    if not set(source_sources) <= set(target_sources):
        raise TransitionError(
            f"target structural oracle drops a theorem source: {source}"
        )
    for path, source_evidence in source_sources.items():
        target_evidence = target_sources[path]
        if path != STRUCTURAL_ORACLE_AGGREGATE_SOURCE and (
            source_evidence["sha256"] != target_evidence["sha256"]
        ):
            raise TransitionError(
                "target structural theorem evidence drifts or downgrades "
                f"source {source}: {path}"
            )

    source_artifacts = evidence_by_path(source_metadata, "build_artifacts")
    target_artifacts = evidence_by_path(target_metadata, "build_artifacts")
    if not set(source_artifacts) <= set(target_artifacts):
        raise TransitionError(
            f"target structural oracle drops a build artifact: {source}"
        )


def _retarget_structural_record_contract(
    record: Mapping[str, Any], target_catalog: Mapping[str, Any]
) -> tuple[dict[str, Any], bool]:
    """Bind a source-validated record to a monotone successor catalog."""

    rebuilt = dict(record)
    provenance = rebuilt.get("provenance")
    if not isinstance(provenance, Mapping):
        raise TransitionError("structural record has malformed provenance")
    provenance = dict(provenance)
    old_contract = provenance.get("oracle_contract_sha256")
    new_contract = target_catalog["contract_sha256"]
    provenance["oracle_contract_sha256"] = new_contract
    rebuilt["provenance"] = provenance
    return rebuilt, old_contract != new_contract


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
    reject_order_conditional: bool,
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
            source_prepare_formula = probe._prepare_formula
            source_cache_metadata = metadata.get("perp_subsumption_cache")
            if source_cache_metadata is not None:
                if (
                    not isinstance(source_cache_metadata, Mapping)
                    or not _is_sha256(source_cache_metadata.get("sha256"))
                    or not isinstance(
                        source_cache_metadata.get("runtime_contract"), Mapping
                    )
                ):
                    raise TransitionError(
                        "source replacement-cache metadata is malformed: "
                        f"{source}"
                    )

                def source_prepare_formula(*prepare_args, **prepare_kwargs):
                    return cached_probe._prepare_formula_with_cache_contract(
                        *prepare_args,
                        expected_cache_sha256=source_cache_metadata["sha256"],
                        expected_runtime_contract=(
                            source_cache_metadata["runtime_contract"]
                        ),
                        snapshot_workdir=source,
                        **prepare_kwargs,
                    )

            try:
                prepared = source_prepare_formula(
                    rows,
                    checkpoint,
                    () if structural_artifact is None
                    else structural_artifact.patterns,
                    structural_oracle_catalog,
                )
            except (CheckpointError, probe.ProbeError, KeyError, ValueError) as exc:
                raise TransitionError(
                    "source checkpoint provenance/replay failed: "
                    f"{source}: {exc}"
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
                    _pattern, cut_scope, _detections = (
                        probe._structural_checkpoint_info(
                            record, structural_oracle_catalog
                        )
                    )
                    if reject_order_conditional and (
                        cut_scope == "order-conditional"
                    ):
                        raise TransitionError(
                            "structural-first target cannot inherit an "
                            f"order-conditional checkpoint record: {source} "
                            f"seq={source_seq}"
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
    refinement_order: str,
    runtime_fingerprint: Mapping[str, str],
    perp_subsumption_cache_metadata: Mapping[str, Any] | None,
) -> dict[str, Any]:
    metadata = {
        "schema": probe.SCHEMA,
        "bank_sha256": _sha256_bytes(target_raw),
        "bank_rows": target_rows,
        "seed": seed,
        "created_utc": datetime.now(timezone.utc).isoformat(),
        "runtime_fingerprint": dict(runtime_fingerprint),
        "refinement_order": refinement_order,
        "perp_bisector_template_preseed": False,
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
    if perp_subsumption_cache_metadata is not None:
        metadata["perp_subsumption_cache"] = dict(
            perp_subsumption_cache_metadata
        )
    return metadata


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
    target_prepare_formula,
    perp_subsumption_cache_raw: bytes | None,
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
    if perp_subsumption_cache_raw is not None:
        probe._atomic_write_bytes(
            staging / perp_cache.SNAPSHOT,
            perp_subsumption_cache_raw,
        )
    probe._atomic_write_json(staging / "run_metadata.json", metadata)
    checkpoint = ClosureCheckpoint.create(
        staging / "checkpoint.sqlite3", metadata
    )
    try:
        instance, separation, _representatives, seen, seed_instances = (
            target_prepare_formula(
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
        structural_contract_rewrites = 0
        batch = []
        for record, _source_ordinal, _source_seq in union.records():
            if probe._is_structural_checkpoint_record(record):
                record, rewritten = _retarget_structural_record_contract(
                    record, structural_oracle_catalog
                )
                structural_contract_rewrites += int(rewritten)
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
        "refinement_order": metadata["refinement_order"],
        "perp_bisector_template_preseed": False,
        "seed_instances": seed_instances,
        "seed_inventory": seed_inventory,
        "convex_structural_seeds": metadata.get("convex_structural_seeds"),
        "formalized_structural_oracle": metadata.get(
            "formalized_structural_oracle"
        ),
        "perp_subsumption_cache": metadata.get("perp_subsumption_cache"),
        "source_checkpoint_records": metadata["migration_provenance"][
            "source_checkpoint_records"
        ],
        "union_dynamic_records": metadata["migration_provenance"][
        "union_dynamic_records"
        ],
        "imported_dynamic_records": imported,
        "target_seed_collisions": seed_collisions,
        "structural_contract_rewrites": structural_contract_rewrites,
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
    cache_path = getattr(args, "perp_subsumption_cache", None)
    if cache_path is None:
        target_prepare_formula = probe._prepare_formula
        target_runtime_fingerprint = probe._runtime_fingerprint()
        cache_raw = None
        cache_metadata = None
    else:
        cache_path = cache_path.resolve()
        try:
            cache_raw = cache_path.read_bytes()
        except OSError as exc:
            raise TransitionError(
                "target perpendicular-subsumption cache is absent"
            ) from exc
        try:
            cache_artifact, decoded_cache = perp_cache.load_pinned_cache(
                probe,
                cache_path,
                expected_sha256=cached_probe._EXPECTED_CACHE_SHA256,
                bank_rows=target_rows,
                bank_path=args.bank.resolve(),
            )
        except perp_cache.CacheError as exc:
            raise TransitionError(
                f"target perpendicular-subsumption cache is invalid: {exc}"
            ) from exc
        if len(decoded_cache) != cache_artifact["counts"][
            "targeted_source_rows"
        ]:
            raise TransitionError(
                "decoded perpendicular-subsumption cache count drifted"
            )
        cache_metadata = perp_cache.snapshot_metadata(
            cache_artifact,
            sha256=cached_probe._EXPECTED_CACHE_SHA256,
        )
        target_prepare_formula = cached_probe._prepare_formula
        target_runtime_fingerprint = cached_probe._runtime_fingerprint()
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
    refinement_order = getattr(
        args, "refinement_order", probe.DEFAULT_REFINEMENT_ORDER
    )
    if refinement_order not in probe.REFINEMENT_ORDERS:
        raise TransitionError(
            f"unknown target refinement order: {refinement_order}"
        )

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
                    reject_order_conditional=(
                        refinement_order == "structural-first"
                    ),
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
                refinement_order=refinement_order,
                runtime_fingerprint=target_runtime_fingerprint,
                perp_subsumption_cache_metadata=cache_metadata,
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
                target_prepare_formula=target_prepare_formula,
                perp_subsumption_cache_raw=cache_raw,
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
        "--refinement-order",
        choices=probe.REFINEMENT_ORDERS,
        default=probe.DEFAULT_REFINEMENT_ORDER,
        help=(
            "persist the target refinement scheduling policy; resumes must "
            "request the same value"
        ),
    )
    parser.add_argument(
        "--convex-structural-seeds",
        type=Path,
        help=(
            "validated theorem-backed convex structural seeds for the target; "
            "kept separate from the algebra bank"
        ),
    )
    parser.add_argument(
        "--perp-subsumption-cache",
        type=Path,
        help=(
            "digest-pinned targeted perpendicular-core cache to snapshot into "
            "the target; target resumes must use the cached probe"
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
