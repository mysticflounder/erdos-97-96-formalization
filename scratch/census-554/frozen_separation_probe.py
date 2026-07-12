#!/usr/bin/env python3
"""Frozen-bank, resumable motif-plus-separation SAT probe.

The authoritative ``bank.jsonl`` is opened read-only and copied into a unique
run directory.  All subsequent work uses that immutable snapshot.  This CLI
never acquires a census lease or bank transaction lock, imports
``frontier_add``, or writes beneath the live bank directory except for its own
new run directory.

SAT witnesses are independently checked against both ``cube_ok`` and every
selected direct/mirror order from ``separation_encoding``.  An UNSAT response
is only a candidate: the exact persisted CNF is solved again with a DRAT proof
and accepted only after ``drat-trim`` reports verification.
"""

from __future__ import annotations

import argparse
from contextlib import contextmanager
import errno
import fcntl
import hashlib
import json
import os
import secrets
import signal
import subprocess
import sys
import time
import uuid
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Iterable, Mapping


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parent.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(REPO_ROOT))

import census554_lib as profile  # noqa: E402
import sat_cover  # noqa: E402
from census.census_554 import combinatorics  # noqa: E402
from census.census_554 import closure_checkpoint  # noqa: E402
from census.census_554 import convex_structural_seeds  # noqa: E402
from census.census_554 import formalized_structural_oracle  # noqa: E402
from census.census_554 import separation_encoding  # noqa: E402
from census.census_554.closure_checkpoint import (  # noqa: E402
    CheckpointError,
    ClosureCheckpoint,
)


SCHEMA = "census554_frozen_separation_probe.v1"
MAX_CADICAL_SEED = 2_000_000_000
TERMINAL_STATUSES = frozenset({"combined-frontier", "UNSAT-verified"})
WORKDIR_LOCK = ".frozen_separation_probe.lock"
STRUCTURAL_SEED_SNAPSHOT = "convex_structural_seeds.json"
STRUCTURAL_SOURCE_SNAPSHOT = "convex_structural_source_result.json"
STRUCTURAL_THEOREM_SNAPSHOT = "convex_structural_theorem_source.lean"
STRUCTURAL_ORACLE_SNAPSHOT = "formalized_structural_oracle.json"
STRUCTURAL_ORACLE_SOURCE_DIR = "formalized_structural_theorem_sources"
STRUCTURAL_ORACLE_BUILD_DIR = "formalized_structural_build_artifacts"
_STOP_SIGNAL: int | None = None


class ProbeError(RuntimeError):
    pass


class ProbeInterrupted(RuntimeError):
    pass


@dataclass(frozen=True)
class CommandResult:
    returncode: int | None
    stdout: str
    stderr: str
    timed_out: bool


def _signal_handler(signum, _frame):
    global _STOP_SIGNAL
    _STOP_SIGNAL = signum


def _check_stop() -> None:
    if _STOP_SIGNAL is not None:
        raise ProbeInterrupted(f"received signal {_STOP_SIGNAL}")


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _fsync_dir(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _atomic_write_bytes(path: Path, data: bytes) -> None:
    """Durably replace a file, restricted by callers to the run directory."""

    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(
        f".{path.name}.tmp-{os.getpid()}-{uuid.uuid4().hex}"
    )
    try:
        with open(temporary, "xb") as handle:
            handle.write(data)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
        _fsync_dir(path.parent)
    finally:
        try:
            temporary.unlink()
        except FileNotFoundError:
            pass


def _atomic_write_json(path: Path, value: Any) -> None:
    encoded = (
        json.dumps(value, sort_keys=True, indent=2).encode("utf-8") + b"\n"
    )
    _atomic_write_bytes(path, encoded)


def read_frozen_bank(path: Path) -> tuple[list[dict[str, Any]], bytes]:
    """Read one complete bank inode without opening or touching lock files.

    Bank publication uses atomic replacement, so an already-open read-only
    descriptor remains a consistent old or new generation even if a writer
    commits concurrently.
    """

    with open(path, "rb") as handle:
        raw = handle.read()
    if raw and not raw.endswith(b"\n"):
        raise ProbeError(f"bank snapshot has a torn final row: {path}")
    rows = []
    for line_number, line in enumerate(raw.splitlines(), 1):
        if not line.strip():
            raise ProbeError(f"blank bank row at {path}:{line_number}")
        try:
            row = json.loads(line)
        except json.JSONDecodeError as exc:
            raise ProbeError(f"invalid bank row at {path}:{line_number}: {exc}") from exc
        if not isinstance(row, dict) or not isinstance(row.get("pattern"), dict):
            raise ProbeError(f"malformed bank row at {path}:{line_number}")
        rows.append(row)
    return rows, raw


def _native_pattern(pattern: Mapping[int | str, Iterable[int]]):
    return {
        int(center): frozenset(int(member) for member in members)
        for center, members in pattern.items()
    }


def _json_pattern(pattern: Mapping[int, Iterable[int]]):
    return {
        str(center): sorted(int(member) for member in members)
        for center, members in sorted(pattern.items())
    }


def _row_sha256(row: Mapping[str, Any]) -> str:
    encoded = json.dumps(row, sort_keys=True, separators=(",", ":")).encode()
    return _sha256_bytes(encoded)


def _compose_maps(*maps: Mapping[int, int]) -> dict[int, int]:
    result = dict(maps[0])
    for next_map in maps[1:]:
        result = {source: next_map[target] for source, target in result.items()}
    return result


def _motif_json(key):
    return [[center, list(members)] for center, members in key]


def _order_json(order: separation_encoding.BoundaryOrder) -> dict[str, Any]:
    return {
        "orientation": order.orientation,
        "python_internal_index": order.internal_index,
        "labels": list(order.labels),
        "row_scope": separation_encoding.DIRECT_ROW_SCOPE,
    }


def _runtime_fingerprint() -> dict[str, str]:
    paths = {
        "probe": Path(__file__).resolve(),
        "profile": Path(profile.__file__).resolve(),
        "sat_cover": Path(sat_cover.__file__).resolve(),
        "combinatorics": Path(combinatorics.__file__).resolve(),
        "closure_checkpoint": Path(closure_checkpoint.__file__).resolve(),
        "convex_structural_seeds": Path(
            convex_structural_seeds.__file__
        ).resolve(),
        "formalized_structural_oracle": Path(
            formalized_structural_oracle.__file__
        ).resolve(),
        "metric_structural_detectors": Path(
            formalized_structural_oracle.metric.__file__
        ).resolve(),
        "separation_encoding": Path(separation_encoding.__file__).resolve(),
    }
    return {name: _sha256_file(path) for name, path in paths.items()}


def _read_structural_seed_artifact(path: Path):
    """Validate an external theorem-backed seed artifact before snapshotting."""

    try:
        artifact, raw = convex_structural_seeds.read_seed_artifact(path)
    except Exception as exc:
        raise ProbeError(
            f"convex structural seed artifact is invalid: {path}: {exc}"
        ) from exc
    _require_seedable_structural_artifact(artifact, source=path)
    return artifact, raw


def _require_seedable_structural_artifact(artifact, *, source: Path) -> None:
    if artifact.theorem_build_status != "passed":
        raise ProbeError(
            "convex structural seeds require passed theorem-build evidence: "
            f"{source}"
        )


def _structural_seed_metadata(artifact, raw: bytes) -> dict[str, Any]:
    orbit_bytes = json.dumps(
        artifact.profile_orbit_keys,
        sort_keys=True,
        separators=(",", ":"),
        allow_nan=False,
    ).encode("utf-8")
    return {
        "schema": artifact.schema,
        "snapshot": STRUCTURAL_SEED_SNAPSHOT,
        "source_result_snapshot": STRUCTURAL_SOURCE_SNAPSHOT,
        "theorem_source_snapshot": STRUCTURAL_THEOREM_SNAPSHOT,
        "sha256": _sha256_bytes(raw),
        "artifact_records": artifact.record_count,
        "validated_profile_orbit_patterns": len(artifact.patterns),
        "profile_orbit_sha256": _sha256_bytes(orbit_bytes),
        "theorem_ids": list(artifact.theorem_ids),
        "source_result_sha256": artifact.source_result_sha256,
        "theorem_source_sha256": _sha256_bytes(
            artifact.theorem_source_bytes
        ),
        "theorem_build_status": artifact.theorem_build_status,
        "theorem_contract_sha256": artifact.theorem_contract_sha256,
        "trust": (
            "theorem-backed convex-realization exclusions; separate from "
            "the algebra/Nullstellensatz bank"
        ),
    }


def _load_structural_seed_snapshot(
    workdir: Path, metadata: Mapping[str, Any]
):
    """Load only the persisted seed bytes and revalidate every certificate."""

    seed_metadata = metadata.get("convex_structural_seeds")
    snapshot = workdir / STRUCTURAL_SEED_SNAPSHOT
    source_snapshot = workdir / STRUCTURAL_SOURCE_SNAPSHOT
    theorem_snapshot = workdir / STRUCTURAL_THEOREM_SNAPSHOT
    if seed_metadata is None:
        if (
            snapshot.exists()
            or source_snapshot.exists()
            or theorem_snapshot.exists()
        ):
            raise ProbeError(
                "structural seed/source snapshot exists without run metadata"
            )
        return None
    if not isinstance(seed_metadata, dict):
        raise ProbeError("convex structural seed metadata is malformed")
    try:
        raw = snapshot.read_bytes()
    except OSError as exc:
        raise ProbeError("convex structural seed snapshot is absent") from exc
    if _sha256_bytes(raw) != seed_metadata.get("sha256"):
        raise ProbeError("convex structural seed snapshot hash mismatch")
    try:
        source_raw = source_snapshot.read_bytes()
    except OSError as exc:
        raise ProbeError(
            "convex structural source-result snapshot is absent"
        ) from exc
    if _sha256_bytes(source_raw) != seed_metadata.get("source_result_sha256"):
        raise ProbeError(
            "convex structural source-result snapshot hash mismatch"
        )
    try:
        theorem_raw = theorem_snapshot.read_bytes()
    except OSError as exc:
        raise ProbeError(
            "convex structural theorem-source snapshot is absent"
        ) from exc
    if _sha256_bytes(theorem_raw) != seed_metadata.get("theorem_source_sha256"):
        raise ProbeError(
            "convex structural theorem-source snapshot hash mismatch"
        )
    try:
        artifact = convex_structural_seeds.validate_seed_artifact_bytes(
            raw,
            source_path=snapshot,
            source_result_override=source_raw,
            theorem_source_override=theorem_raw,
        )
    except Exception as exc:
        raise ProbeError(
            f"convex structural seed snapshot failed validation: {exc}"
        ) from exc
    _require_seedable_structural_artifact(artifact, source=snapshot)
    expected = _structural_seed_metadata(artifact, raw)
    if seed_metadata != expected:
        raise ProbeError("convex structural seed metadata disagrees with snapshot")
    return artifact


def _structural_oracle_metadata(
    catalog: Mapping[str, Any], raw: bytes,
) -> dict[str, Any]:
    sources = [
        {
            "path": source,
            "sha256": sha256,
            "snapshot": str(Path(STRUCTURAL_ORACLE_SOURCE_DIR) / source),
        }
        for source, sha256 in sorted(catalog["theorem_sources"].items())
    ]
    build_artifacts = [
        {
            "path": artifact,
            "sha256": sha256,
            "snapshot": str(Path(STRUCTURAL_ORACLE_BUILD_DIR) / artifact),
        }
        for artifact, sha256 in sorted(catalog["build_artifacts"].items())
    ]
    return {
        "schema": catalog["schema"],
        "snapshot": STRUCTURAL_ORACLE_SNAPSHOT,
        "sha256": _sha256_bytes(raw),
        "contract_sha256": catalog["contract_sha256"],
        "ordering_policy": catalog["ordering_policy"],
        "build_status": catalog["build"]["status"],
        "build_target": catalog["build"]["target"],
        "axiom_audit_theorem": catalog["build"]["axiom_audit_theorem"],
        "expected_axioms": list(catalog["build"]["expected_axioms"]),
        "axiom_audit_result": list(catalog["build"]["axiom_audit_result"]),
        "validated_utc": catalog["build"]["validated_utc"],
        "proof_blueprint_build_fingerprint": catalog["build"][
            "proof_blueprint_build_fingerprint"
        ],
        "eligible_family_ids": list(catalog["eligible_family_ids"]),
        "ineligible_family_ids": list(catalog["ineligible_family_ids"]),
        "theorem_sources": sources,
        "build_artifacts": build_artifacts,
        "trust": catalog["trust"],
    }


def _prepare_structural_oracle_snapshot():
    """Validate the live theorem catalog before a new run snapshots it."""

    try:
        catalog = formalized_structural_oracle.catalog_manifest()
        formalized_structural_oracle.validate_catalog_manifest(
            catalog, require_passed=True
        )
    except Exception as exc:
        raise ProbeError(f"formalized structural oracle is not seedable: {exc}") from exc
    raw = formalized_structural_oracle.catalog_bytes()
    source_bytes = {
        source: (REPO_ROOT / source).read_bytes()
        for source in catalog["theorem_sources"]
    }
    source_bytes.update({
        artifact: (REPO_ROOT / artifact).read_bytes()
        for artifact in catalog["build_artifacts"]
    })
    for source, expected in catalog["theorem_sources"].items():
        if _sha256_bytes(source_bytes[source]) != expected:
            raise ProbeError(f"formalized structural theorem source drifted: {source}")
    return catalog, raw, source_bytes, _structural_oracle_metadata(catalog, raw)


def _write_structural_oracle_snapshot(
    workdir: Path, raw: bytes, source_bytes: Mapping[str, bytes],
) -> None:
    _atomic_write_bytes(workdir / STRUCTURAL_ORACLE_SNAPSHOT, raw)
    for source, source_raw in sorted(source_bytes.items()):
        snapshot_root = (
            STRUCTURAL_ORACLE_BUILD_DIR
            if source in formalized_structural_oracle.BUILD_ARTIFACT_SHA256
            else STRUCTURAL_ORACLE_SOURCE_DIR
        )
        _atomic_write_bytes(
            workdir / snapshot_root / source, source_raw
        )


def _load_structural_oracle_snapshot(
    workdir: Path, metadata: Mapping[str, Any], *,
    require_current_catalog: bool = True,
) -> dict[str, Any] | None:
    oracle_metadata = metadata.get("formalized_structural_oracle")
    snapshot = workdir / STRUCTURAL_ORACLE_SNAPSHOT
    source_root = workdir / STRUCTURAL_ORACLE_SOURCE_DIR
    build_root = workdir / STRUCTURAL_ORACLE_BUILD_DIR
    if oracle_metadata is None:
        if snapshot.exists() or source_root.exists() or build_root.exists():
            raise ProbeError("structural oracle snapshot exists without metadata")
        return None
    if not isinstance(oracle_metadata, dict):
        raise ProbeError("formalized structural oracle metadata is malformed")
    try:
        raw = snapshot.read_bytes()
        catalog = json.loads(raw)
    except (OSError, json.JSONDecodeError) as exc:
        raise ProbeError("formalized structural oracle snapshot is invalid") from exc
    if _sha256_bytes(raw) != oracle_metadata.get("sha256"):
        raise ProbeError("formalized structural oracle snapshot hash mismatch")
    canonical = (
        json.dumps(catalog, sort_keys=True, indent=2, allow_nan=False).encode("utf-8")
        + b"\n"
    )
    if raw != canonical:
        raise ProbeError("formalized structural oracle snapshot is not canonical")
    source_bytes = {}
    for source in oracle_metadata["theorem_sources"]:
        path = workdir / source["snapshot"]
        try:
            source_raw = path.read_bytes()
        except OSError as exc:
            raise ProbeError(
                f"formalized structural theorem snapshot is absent: {source['path']}"
            ) from exc
        if _sha256_bytes(source_raw) != source["sha256"]:
            raise ProbeError(
                f"formalized structural theorem snapshot drifted: {source['path']}"
            )
        source_bytes[source["path"]] = source_raw
    build_artifact_bytes = {}
    for artifact in oracle_metadata["build_artifacts"]:
        path = workdir / artifact["snapshot"]
        try:
            artifact_raw = path.read_bytes()
        except OSError as exc:
            raise ProbeError(
                f"formalized structural build snapshot is absent: {artifact['path']}"
            ) from exc
        if _sha256_bytes(artifact_raw) != artifact["sha256"]:
            raise ProbeError(
                f"formalized structural build snapshot drifted: {artifact['path']}"
            )
        build_artifact_bytes[artifact["path"]] = artifact_raw
    try:
        formalized_structural_oracle.validate_catalog_snapshot(
            catalog,
            source_bytes=source_bytes,
            build_artifact_bytes=build_artifact_bytes,
            require_passed=True,
        )
        if require_current_catalog:
            formalized_structural_oracle.validate_catalog_manifest(
                catalog, require_passed=True
            )
    except Exception as exc:
        raise ProbeError(f"formalized structural oracle catalog failed replay: {exc}") from exc
    expected_metadata = _structural_oracle_metadata(catalog, raw)
    if oracle_metadata != expected_metadata:
        raise ProbeError("formalized structural oracle metadata disagrees with snapshot")
    return catalog


def _new_workdir(root: Path) -> Path:
    root.mkdir(parents=True, exist_ok=True)
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    for _ in range(100):
        candidate = root / f"run-{stamp}-{os.getpid()}-{secrets.token_hex(4)}"
        try:
            candidate.mkdir()
            _fsync_dir(root)
            return candidate
        except FileExistsError:
            continue
    raise ProbeError("could not allocate a unique run directory")


@contextmanager
def _exclusive_workdir_lock(workdir: Path):
    """Hold one nonblocking process lock for the entire run invocation."""

    lock_path = workdir / WORKDIR_LOCK
    try:
        descriptor = os.open(lock_path, os.O_RDWR | os.O_CREAT, 0o600)
    except OSError as exc:
        raise ProbeError(f"could not open workdir lock {lock_path}: {exc}") from exc
    try:
        try:
            fcntl.flock(descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except OSError as exc:
            if exc.errno in (errno.EACCES, errno.EAGAIN):
                raise ProbeError(
                    f"another probe invocation already holds {lock_path}"
                ) from exc
            raise ProbeError(f"could not lock workdir {lock_path}: {exc}") from exc
        try:
            yield
        finally:
            fcntl.flock(descriptor, fcntl.LOCK_UN)
    finally:
        os.close(descriptor)


def _solver_seed(run_seed: int, iteration: int, purpose: str) -> int:
    raw = hashlib.sha256(f"{run_seed}:{iteration}:{purpose}".encode()).digest()
    return 1 + int.from_bytes(raw[:8], "big") % MAX_CADICAL_SEED


def _terminate_process(process: subprocess.Popen) -> None:
    if process.poll() is not None:
        return
    process.terminate()
    try:
        process.wait(timeout=5)
    except subprocess.TimeoutExpired:
        process.kill()
        process.wait()


def _run_command(
    command: list[str], *, stdout_path: Path, stderr_path: Path, timeout: float
) -> CommandResult:
    if timeout <= 0:
        return CommandResult(None, "", "", True)
    with open(stdout_path, "w", encoding="utf-8") as stdout_handle, open(
        stderr_path, "w", encoding="utf-8"
    ) as stderr_handle:
        try:
            process = subprocess.Popen(
                command, stdout=stdout_handle, stderr=stderr_handle, text=True
            )
        except OSError as exc:
            raise ProbeError(f"could not run {command[0]}: {exc}") from exc
        deadline = time.monotonic() + timeout
        timed_out = False
        try:
            while process.poll() is None:
                if _STOP_SIGNAL is not None:
                    _terminate_process(process)
                    raise ProbeInterrupted(f"received signal {_STOP_SIGNAL}")
                if time.monotonic() >= deadline:
                    timed_out = True
                    _terminate_process(process)
                    break
                time.sleep(0.2)
        except BaseException:
            _terminate_process(process)
            raise
    # A signal can arrive after the child's final poll but before its output is
    # consumed.  Treat that race exactly like a signal observed in the loop.
    _check_stop()
    stdout = stdout_path.read_text(encoding="utf-8")
    stderr = stderr_path.read_text(encoding="utf-8")
    _check_stop()
    return CommandResult(process.returncode, stdout, stderr, timed_out)


def _positive_variables(output: str) -> set[int]:
    positive = set()
    for line in output.splitlines():
        if not line.startswith("v "):
            continue
        for token in line[2:].split():
            literal = int(token)
            if literal > 0:
                positive.add(literal)
    return positive


def _decode_and_validate_model(instance, encoding, output: str):
    positive = _positive_variables(output)
    cube = {}
    for center in range(profile.N):
        chosen = [
            index for index in range(len(instance.cand[center]))
            if instance.x[(center, index)] in positive
        ]
        if len(chosen) != 1:
            raise ProbeError(
                f"SAT model selects {len(chosen)} candidates at center {center}"
            )
        cube[center] = sorted(instance.cand[center][chosen[0]])
    if not profile.cube_ok(cube):
        raise ProbeError("SAT model fails independent cube_ok validation")
    selected = encoding.selected_orders(positive)
    if not selected:
        raise ProbeError("SAT model selects no separation order")
    invalid = [
        order for order in selected
        if not separation_encoding.validate_cube_order(
            cube, order, scope=separation_encoding.DIRECT_ROW_SCOPE
        )
    ]
    if invalid:
        raise ProbeError(
            f"SAT model has {len(invalid)} independently invalid selected order(s)"
        )
    return cube, selected


def _source_rows(bank_rows):
    sources = []
    representatives = {}
    for row in bank_rows:
        pattern = _native_pattern(row["pattern"])
        key, source_to_key = combinatorics.unlabeled_key_with_map(pattern)
        source = {
            "row": row,
            "row_sha256": _row_sha256(row),
            "pattern": pattern,
            "key": key,
            "source_to_key": source_to_key,
        }
        sources.append(source)
    for source in sorted(
        sources,
        key=lambda item: (str(item["row"].get("pid")), item["row_sha256"]),
    ):
        representatives.setdefault(
            source["key"], (source, source["source_to_key"])
        )
    return sources, representatives


def _source_lookup(sources) -> dict[tuple[Any, str], list[dict[str, Any]]]:
    lookup: dict[tuple[Any, str], list[dict[str, Any]]] = {}
    for source in sources:
        identity = (source["row"].get("pid"), source["row_sha256"])
        lookup.setdefault(identity, []).append(source)
    return lookup


def _validate_checkpoint_provenance(
    stored: Mapping[str, Any],
    source_lookup: Mapping[tuple[Any, str], list[dict[str, Any]]],
):
    """Rederive one dynamic record from its exact frozen-bank source row."""

    provenance = stored.get("provenance")
    required = {
        "source_pid",
        "source_row_sha256",
        "canonical_motif",
        "support_injection",
        "embedding_kind",
    }
    if not isinstance(provenance, dict) or set(provenance) != required:
        raise ProbeError("checkpoint provenance has an unexpected schema")
    if provenance["embedding_kind"] != "motif_embedding_autos":
        raise ProbeError("checkpoint provenance has the wrong embedding kind")

    identity = (
        provenance["source_pid"],
        provenance["source_row_sha256"],
    )
    matches = source_lookup.get(identity, ())
    if len(matches) != 1:
        raise ProbeError(
            "checkpoint provenance does not identify one unique frozen-bank row"
        )
    source = matches[0]
    if provenance["canonical_motif"] != _motif_json(source["key"]):
        raise ProbeError("checkpoint canonical motif does not match its source row")

    raw_injection = provenance["support_injection"]
    if not isinstance(raw_injection, list):
        raise ProbeError("checkpoint support injection is not a list")
    injection: dict[int, int] = {}
    targets = set()
    for pair in raw_injection:
        if not isinstance(pair, list) or len(pair) != 2:
            raise ProbeError("checkpoint support injection has a malformed pair")
        source_point, target_point = pair
        if (
            not isinstance(source_point, int)
            or isinstance(source_point, bool)
            or not isinstance(target_point, int)
            or isinstance(target_point, bool)
        ):
            raise ProbeError("checkpoint support injection is not integer-valued")
        if source_point in injection:
            raise ProbeError("checkpoint support injection repeats a source point")
        if target_point in targets:
            raise ProbeError("checkpoint support injection is not injective")
        if not 0 <= target_point < profile.N:
            raise ProbeError("checkpoint support injection target is out of range")
        injection[source_point] = target_point
        targets.add(target_point)

    source_support = set(combinatorics.support(source["pattern"]))
    if set(injection) != source_support:
        raise ProbeError("checkpoint support injection is not exact on source support")
    try:
        stored_pattern = _native_pattern(stored["pattern"])
    except (KeyError, TypeError, ValueError) as exc:
        raise ProbeError("checkpoint pattern is malformed") from exc
    if _json_pattern(stored_pattern) != stored["pattern"]:
        raise ProbeError("checkpoint pattern is not in canonical JSON form")
    mapped = combinatorics.apply_mapping(source["pattern"], injection)
    if combinatorics.serialize_pattern(mapped) != combinatorics.serialize_pattern(
        stored_pattern
    ):
        raise ProbeError("checkpoint support map does not produce its stored pattern")
    if combinatorics.unlabeled_key(stored_pattern) != source["key"]:
        raise ProbeError("checkpoint stored pattern has the wrong canonical motif")
    return stored_pattern


def _is_structural_checkpoint_record(stored: Mapping[str, Any]) -> bool:
    provenance = stored.get("provenance")
    return (
        isinstance(provenance, Mapping)
        and provenance.get("source_kind") == "formalized_structural_core"
    )


def _order_key(order: separation_encoding.BoundaryOrder) -> tuple[Any, ...]:
    return (order.orientation, order.internal_index, order.labels)


def _recorded_clauses(stored: Mapping[str, Any]) -> list[list[int]]:
    clause = stored.get("clause")
    if (
        not isinstance(clause, list)
        or any(not isinstance(literal, int) or isinstance(literal, bool)
               for literal in clause)
    ):
        raise ProbeError("checkpoint primary clause is malformed")
    additional = stored.get("additional_clauses", [])
    if not isinstance(additional, list):
        raise ProbeError("checkpoint additional clauses are malformed")
    clauses = [clause]
    for extra in additional:
        if (
            not isinstance(extra, list)
            or any(not isinstance(literal, int) or isinstance(literal, bool)
                   for literal in extra)
        ):
            raise ProbeError("checkpoint additional clause is malformed")
        clauses.append(extra)
    return clauses


def _structural_checkpoint_info(
    stored: Mapping[str, Any], catalog: Mapping[str, Any] | None,
) -> tuple[dict[int, frozenset[int]], str, tuple[dict[str, Any], ...]]:
    if catalog is None:
        raise ProbeError("structural checkpoint record has no snapshotted oracle")
    provenance = stored.get("provenance")
    required = {
        "source_kind", "embedding_kind", "oracle_schema",
        "oracle_contract_sha256", "cut_scope", "source_pattern",
        "support_map", "detections",
    }
    if not isinstance(provenance, dict) or set(provenance) != required:
        raise ProbeError("structural checkpoint provenance has an unexpected schema")
    if provenance["source_kind"] != "formalized_structural_core" or (
        provenance["embedding_kind"] != "formalized_core_profile_orbit_v1"
    ):
        raise ProbeError("structural checkpoint record has the wrong source kind")
    if provenance["oracle_schema"] != catalog["schema"] or (
        provenance["oracle_contract_sha256"] != catalog["contract_sha256"]
    ):
        raise ProbeError("structural checkpoint theorem contract drifted")
    try:
        pattern = formalized_structural_oracle.normalize_pattern(stored["pattern"])
        source_pattern = formalized_structural_oracle.normalize_pattern(
            provenance["source_pattern"]
        )
    except (KeyError, TypeError, ValueError) as exc:
        raise ProbeError("structural checkpoint pattern is malformed") from exc
    if _json_pattern(pattern) != stored["pattern"] or (
        _json_pattern(source_pattern) != provenance["source_pattern"]
    ):
        raise ProbeError("structural checkpoint pattern is not canonical JSON")
    raw_map = provenance["support_map"]
    if not isinstance(raw_map, list):
        raise ProbeError("structural checkpoint support map is malformed")
    support_map = {}
    targets = set()
    for pair in raw_map:
        if (
            not isinstance(pair, list) or len(pair) != 2
            or any(not isinstance(value, int) or isinstance(value, bool)
                   for value in pair)
        ):
            raise ProbeError("structural checkpoint support map has a bad pair")
        source, target = pair
        if source in support_map or target in targets:
            raise ProbeError("structural checkpoint support map is not injective")
        support_map[source] = target
        targets.add(target)
    if set(support_map) != set(combinatorics.support(source_pattern)):
        raise ProbeError("structural checkpoint support map is not total")
    mapped = combinatorics.apply_mapping(source_pattern, support_map)
    if combinatorics.serialize_pattern(mapped) != combinatorics.serialize_pattern(pattern):
        raise ProbeError("structural checkpoint support map does not produce pattern")

    raw_detections = provenance["detections"]
    if not isinstance(raw_detections, list) or not raw_detections:
        raise ProbeError("structural checkpoint has no theorem detections")
    detections = []
    try:
        for detection in raw_detections:
            detections.append(
                formalized_structural_oracle.validate_detection(pattern, detection)
            )
    except Exception as exc:
        raise ProbeError(f"structural checkpoint detection failed replay: {exc}") from exc
    cut_scope = provenance["cut_scope"]
    ordered = [detection["order"] is not None for detection in detections]
    if cut_scope == "unconditional":
        if len(detections) != 1 or ordered != [False]:
            raise ProbeError("unconditional structural cut is not unordered")
    elif cut_scope in ("order-conditional", "all-valid-orders"):
        if not all(ordered):
            raise ProbeError("ordered structural cut contains an unordered detection")
        try:
            formalized_structural_oracle.normalize_pattern(
                pattern, require_full_cube=True
            )
        except Exception as exc:
            raise ProbeError("ordered structural cut is not a full cube") from exc
        detection_orders = [
            formalized_structural_oracle.order_from_record(detection["order"])
            for detection in detections
        ]
        detection_keys = {_order_key(order) for order in detection_orders}
        if len(detection_keys) != len(detection_orders):
            raise ProbeError("ordered structural cut repeats an order")
        valid_keys = {
            _order_key(order) for order in separation_encoding.valid_orders(pattern)
        }
        if not detection_keys <= valid_keys:
            raise ProbeError("ordered structural cut names an inadmissible order")
        if cut_scope == "all-valid-orders" and detection_keys != valid_keys:
            raise ProbeError("all-order structural cut does not cover every valid order")
        if cut_scope == "order-conditional" and detection_keys == valid_keys:
            raise ProbeError("conditional structural cut should be all-order")
    else:
        raise ProbeError("structural checkpoint has an unknown cut scope")
    return pattern, cut_scope, tuple(detections)


def _add_structural_clauses(
    instance, separation, pattern: Mapping[int, Iterable[int]],
    cut_scope: str, detections: Sequence[Mapping[str, Any]],
) -> list[list[int]]:
    if cut_scope in ("unconditional", "all-valid-orders"):
        return [instance.add_pattern_instance(pattern)]
    base = [-instance.y_var(center, members)
            for center, members in sorted(pattern.items())]
    clauses = []
    for detection in detections:
        order = formalized_structural_oracle.order_from_record(detection["order"])
        selector = separation.order_to_selector[order]
        clause = [*base, -selector]
        instance.excl.append(clause)
        clauses.append(clause)
    return clauses


def _record_with_clauses(
    record: Mapping[str, Any], clauses: Sequence[Sequence[int]],
) -> dict[str, Any]:
    if not clauses:
        raise ProbeError("checkpoint record cannot have an empty clause bundle")
    rebuilt = dict(record)
    rebuilt["clause"] = list(clauses[0])
    if len(clauses) > 1:
        rebuilt["additional_clauses"] = [list(clause) for clause in clauses[1:]]
    else:
        rebuilt.pop("additional_clauses", None)
    return rebuilt


def _replay_checkpoint_record(
    instance, separation, stored: Mapping[str, Any], source_lookup,
    catalog: Mapping[str, Any] | None,
) -> tuple[dict[int, frozenset[int]], bool, frozenset[tuple[Any, ...]]]:
    if _is_structural_checkpoint_record(stored):
        pattern, cut_scope, detections = _structural_checkpoint_info(stored, catalog)
        clauses = _add_structural_clauses(
            instance, separation, pattern, cut_scope, detections
        )
        if clauses != _recorded_clauses(stored):
            raise ProbeError("structural checkpoint clause replay drifted")
        ordered_keys = frozenset(
            _order_key(formalized_structural_oracle.order_from_record(d["order"]))
            for d in detections if d["order"] is not None
        )
        return pattern, cut_scope != "order-conditional", ordered_keys
    pattern = _validate_checkpoint_provenance(stored, source_lookup)
    clause = instance.add_pattern_instance(pattern)
    if [clause] != _recorded_clauses(stored):
        raise ProbeError("checkpoint clause replay drifted from insertion order")
    return pattern, True, frozenset()


def _prepare_formula(
    bank_rows,
    checkpoint: ClosureCheckpoint,
    structural_patterns: Iterable[Mapping[int, Iterable[int]]] = (),
    structural_oracle_catalog: Mapping[str, Any] | None = None,
):
    """Rebuild the exact ordered hard-clause surface.

    Algebra-bank profile orbits are seeded first.  Independently validated
    convex-structural profile-orbit records follow, and only then is the ordered
    dynamic checkpoint replayed.  The two seed classes intentionally share
    the SAT exclusion mechanism but never share provenance or trust labels.
    """

    instance = sat_cover.CoverInstance()
    separation = separation_encoding.add_separation_encoding(
        instance, scope=separation_encoding.DIRECT_ROW_SCOPE
    )
    sources, representatives = _source_rows(bank_rows)
    source_lookup = _source_lookup(sources)
    seen = set()
    unconditional_seen = set()
    ordered_seen: dict[tuple, set[tuple[Any, ...]]] = {}

    for source_index, source in enumerate(sources):
        if source_index % 100 == 0:
            _check_stop()
        for image, _source_to_image in combinatorics.orbit_with_maps(
            source["pattern"]
        ):
            serialized = combinatorics.serialize_pattern(image)
            if serialized in seen:
                continue
            instance.add_pattern_instance(image)
            seen.add(serialized)
            unconditional_seen.add(serialized)
    algebra_seed_instances = len(seen)

    structural_patterns = tuple(structural_patterns)
    structural_seed_instances = 0
    for pattern_index, raw_pattern in enumerate(structural_patterns):
        try:
            pattern = _native_pattern(raw_pattern)
        except (TypeError, ValueError) as exc:
            raise ProbeError(
                f"structural seed pattern {pattern_index} is malformed"
            ) from exc
        # ValidatedArtifact.patterns is already the complete, deduplicated,
        # deterministic fixed-profile orbit.  Re-expanding it here would blur
        # artifact-record counts and its exact clause order.
        serialized = combinatorics.serialize_pattern(pattern)
        if serialized in seen:
            continue
        instance.add_pattern_instance(pattern)
        seen.add(serialized)
        unconditional_seen.add(serialized)
        structural_seed_instances += 1
    seed_instances = len(seen)
    instance.seed_inventory = {
        "algebra_bank": {
            "rows": len(bank_rows),
            "profile_orbit_instances": algebra_seed_instances,
            "trust": "frozen certified algebra/Nullstellensatz motif bank",
        },
        "convex_structural": {
            "validated_profile_orbit_patterns": len(structural_patterns),
            "profile_orbit_instances": structural_seed_instances,
            "trust": (
                "separately validated theorem-backed convex-realization "
                "exclusions; not algebra-bank deadness"
            ),
        },
    }

    dynamic_algebra_records = 0
    dynamic_structural_records = 0
    for stored in checkpoint.records():
        _check_stop()
        if _is_structural_checkpoint_record(stored):
            pre_pattern, _pre_scope, _pre_detections = _structural_checkpoint_info(
                stored, structural_oracle_catalog
            )
        else:
            pre_pattern = _validate_checkpoint_provenance(stored, source_lookup)
        serialized = combinatorics.serialize_pattern(pre_pattern)
        if serialized in seen:
            raise ProbeError("checkpoint replays a duplicate seeded instance")
        pattern, unconditional, ordered_keys = _replay_checkpoint_record(
            instance,
            separation,
            stored,
            source_lookup,
            structural_oracle_catalog,
        )
        if combinatorics.serialize_pattern(pattern) != serialized:
            raise ProbeError("checkpoint validation/replay pattern drifted")
        seen.add(serialized)
        if unconditional:
            unconditional_seen.add(serialized)
        else:
            ordered_seen[serialized] = set(ordered_keys)
        if _is_structural_checkpoint_record(stored):
            dynamic_structural_records += 1
        else:
            dynamic_algebra_records += 1

    instance.unconditional_seen = unconditional_seen
    instance.ordered_seen = ordered_seen
    instance.dynamic_inventory = {
        "algebra_bank": dynamic_algebra_records,
        "formalized_structural_oracle": dynamic_structural_records,
    }

    return instance, separation, representatives, seen, seed_instances


def _add_lazy_embeddings(
    instance, representatives, seen, cube
) -> list[dict[str, Any]]:
    frozen_cube = {
        center: frozenset(members) for center, members in cube.items()
    }
    found = {}
    for key_index, key in enumerate(sorted(representatives)):
        if key_index % 25 == 0:
            _check_stop()
        for serialized, key_to_embedding in (
            combinatorics.embed_into_cube_with_maps(key, frozen_cube).items()
        ):
            if serialized not in seen:
                found.setdefault(serialized, (key, key_to_embedding))

    records = []
    for serialized in sorted(found):
        key, key_to_embedding = found[serialized]
        source, source_to_key = representatives[key]
        embedded = {
            center: frozenset(members) for center, members in serialized
        }
        for image, embedding_to_image in combinatorics.orbit_with_maps(embedded):
            image_serialized = combinatorics.serialize_pattern(image)
            if image_serialized in seen:
                continue
            source_to_image = _compose_maps(
                source_to_key, key_to_embedding, embedding_to_image
            )
            injection = [
                [point, source_to_image[point]] for point in sorted(source_to_image)
            ]
            if len({target for _, target in injection}) != len(injection):
                raise ProbeError("non-injective lazy-embedding provenance")
            clause = instance.add_pattern_instance(image)
            records.append({
                "pattern": _json_pattern(image),
                "clause": clause,
                "provenance": {
                    "source_pid": source["row"].get("pid"),
                    "source_row_sha256": source["row_sha256"],
                    "canonical_motif": _motif_json(key),
                    "support_injection": injection,
                    "embedding_kind": "motif_embedding_autos",
                },
            })
            seen.add(image_serialized)
    return records


def _structural_record_provenance(
    *, catalog: Mapping[str, Any], cut_scope: str,
    source_pattern: Mapping[int, Iterable[int]], support_map,
    detections: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    return {
        "source_kind": "formalized_structural_core",
        "embedding_kind": "formalized_core_profile_orbit_v1",
        "oracle_schema": catalog["schema"],
        "oracle_contract_sha256": catalog["contract_sha256"],
        "cut_scope": cut_scope,
        "source_pattern": _json_pattern(source_pattern),
        "support_map": [list(pair) for pair in support_map],
        "detections": [dict(detection) for detection in detections],
    }


def _commit_structural_orbit(
    instance, separation, seen, catalog, *, source_pattern, cut_scope, orbit,
) -> list[dict[str, Any]]:
    records = []
    for item in orbit:
        _check_stop()
        pattern = _native_pattern(item["pattern"])
        serialized = combinatorics.serialize_pattern(pattern)
        if serialized in seen:
            continue
        detections = (
            [item["detection"]]
            if "detection" in item
            else list(item["detections"])
        )
        provisional = {
            "pattern": _json_pattern(pattern),
            "clause": [],
            "provenance": _structural_record_provenance(
                catalog=catalog,
                cut_scope=cut_scope,
                source_pattern=source_pattern,
                support_map=item["support_map"],
                detections=detections,
            ),
        }
        checked_pattern, checked_scope, checked_detections = (
            _structural_checkpoint_info(provisional, catalog)
        )
        clauses = _add_structural_clauses(
            instance, separation, checked_pattern, checked_scope, checked_detections
        )
        record = _record_with_clauses(provisional, clauses)
        records.append(record)
        seen.add(serialized)
        if cut_scope == "order-conditional":
            instance.ordered_seen[serialized] = {
                _order_key(
                    formalized_structural_oracle.order_from_record(
                        detection["order"]
                    )
                )
                for detection in detections
            }
        else:
            instance.unconditional_seen.add(serialized)
    return records


def _add_formalized_structural_refinements(
    instance, separation, seen, cube, selected_orders,
    catalog: Mapping[str, Any] | None,
) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    if catalog is None:
        raise ProbeError("formalized structural oracle is absent from this run")
    try:
        scan = formalized_structural_oracle.scan_structural_cores(cube)
    except Exception as exc:
        raise ProbeError(f"formalized structural scan failed: {exc}") from exc
    if not scan.exhaustive:
        raise ProbeError("formalized structural scan was not exhaustive")
    if scan.unordered_detection is not None:
        stage = scan.unordered_detection["stage"]
        orbit = formalized_structural_oracle.profile_orbit_unordered(
            scan.pattern, stage
        )
        records = _commit_structural_orbit(
            instance,
            separation,
            seen,
            catalog,
            source_pattern=scan.pattern,
            cut_scope="unconditional",
            orbit=orbit,
        )
        if not records:
            raise ProbeError("detected unordered structural core was already encoded")
        return records, {
            "status": "refined",
            "cut_scope": "unconditional",
            "stage": stage,
            "core": scan.unordered_detection["core"],
            "minimal_rows": len(scan.pattern),
            "minimal_incidences": sum(len(row) for row in scan.pattern.values()),
            "profile_orbit_records": len(records),
        }

    killed_by_key = {
        _order_key(formalized_structural_oracle.order_from_record(d["order"])): d
        for d in scan.ordered_detections
    }
    selected_keys = {_order_key(order) for order in selected_orders}
    selected_killed = sorted(selected_keys & set(killed_by_key))
    if not selected_killed:
        return [], {
            "status": "no-applicable-core",
            "valid_orders": len(scan.valid_orders),
            "ordered_orders_killed": len(killed_by_key),
            "selected_orders": len(selected_orders),
        }
    all_valid = len(killed_by_key) == len(scan.valid_orders)
    cut_scope = "all-valid-orders" if all_valid else "order-conditional"
    detections = [killed_by_key[key] for key in sorted(killed_by_key)]
    orbit = formalized_structural_oracle.profile_orbit_ordered(
        scan.pattern, detections
    )
    records = _commit_structural_orbit(
        instance,
        separation,
        seen,
        catalog,
        source_pattern=scan.pattern,
        cut_scope=cut_scope,
        orbit=orbit,
    )
    if not records:
        raise ProbeError("detected ordered structural core was already encoded")
    return records, {
        "status": "refined",
        "cut_scope": cut_scope,
        "stages": sorted({detection["stage"] for detection in detections}),
        "valid_orders": len(scan.valid_orders),
        "ordered_orders_killed": len(detections),
        "selected_orders_killed": len(selected_killed),
        "profile_orbit_records": len(records),
    }


def _assert_no_seen_exclusion(
    cube, seen, selected_orders: Sequence[separation_encoding.BoundaryOrder] = (),
    ordered_seen: Mapping[tuple, Iterable[tuple[Any, ...]]] | None = None,
) -> None:
    """Directly reject a cube containing an already-encoded applicable cut."""

    frozen_cube = {
        int(center): frozenset(int(member) for member in members)
        for center, members in cube.items()
    }
    for serialized in seen:
        if all(
            center in frozen_cube
            and all(member in frozen_cube[center] for member in members)
            for center, members in serialized
        ):
            raise ProbeError(
                "SAT model contains an already-seen exclusion pattern: "
                f"{serialized!r}"
            )
    if ordered_seen:
        selected_keys = {_order_key(order) for order in selected_orders}
        for serialized, killed_orders in ordered_seen.items():
            if not selected_keys & set(killed_orders):
                continue
            if all(
                center in frozen_cube
                and all(member in frozen_cube[center] for member in members)
                for center, members in serialized
            ):
                raise ProbeError(
                    "SAT model selects an already-excluded structural order: "
                    f"{serialized!r}"
                )


def _base_payload(
    *, status: str, workdir: Path, metadata: Mapping[str, Any], args,
    iteration: int, instance_count: int, seed_instances: int,
    invocation_started: float, extra: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    invocation_elapsed = time.monotonic() - invocation_started
    cumulative_elapsed = float(metadata.get("elapsed_s", 0.0)) + invocation_elapsed
    payload = {
        "schema": SCHEMA,
        "status": status,
        "workdir": str(workdir),
        "bank_sha256": metadata["bank_sha256"],
        "bank_rows": metadata["bank_rows"],
        "seed": metadata["seed"],
        "caps": {
            "wall_seconds": args.wall_seconds,
            "max_iterations": args.max_iterations,
            "solver_timeout": args.solver_timeout,
            "proof_timeout": args.proof_timeout,
        },
        "iteration": iteration,
        "instances": instance_count,
        "seed_instances": seed_instances,
        "formula_sources": metadata.get("formula_sources", {
            "algebra_bank": {
                "rows": metadata["bank_rows"],
                "sha256": metadata["bank_sha256"],
            },
            "convex_structural": None,
        }),
        "timings": {
            "invocation_elapsed_s": round(invocation_elapsed, 3),
            "cumulative_elapsed_s": cumulative_elapsed,
        },
        "updated_utc": datetime.now(timezone.utc).isoformat(),
    }
    if extra:
        payload.update(extra)
    return payload


def _persist_status(
    checkpoint: ClosureCheckpoint,
    workdir: Path,
    payload: Mapping[str, Any],
    *,
    records: Iterable[Mapping[str, Any]] = (),
    result: bool = False,
) -> None:
    if str(payload["status"]) in TERMINAL_STATUSES:
        raise ProbeError("terminal statuses require result-first publication")
    checkpoint.append_batch(
        records,
        iteration=int(payload["iteration"]),
        elapsed_seconds=float(payload["timings"]["cumulative_elapsed_s"]),
        status=str(payload["status"]),
    )
    _atomic_write_json(workdir / "progress.json", payload)
    if result:
        _atomic_write_json(workdir / "result.json", payload)


def _persist_terminal(
    checkpoint: ClosureCheckpoint,
    workdir: Path,
    payload: Mapping[str, Any],
    *,
    aliases: Iterable[str] = (),
) -> None:
    """Publish durable result artifacts before committing terminal DB state."""

    status = str(payload["status"])
    if status not in TERMINAL_STATUSES:
        raise ProbeError("nonterminal status passed to terminal publisher")
    _atomic_write_json(workdir / "result.json", payload)
    for name in aliases:
        if name == "result.json" or Path(name).name != name:
            raise ProbeError(f"invalid terminal artifact alias: {name}")
        _atomic_write_json(workdir / name, payload)
    checkpoint.append_batch(
        [],
        iteration=int(payload["iteration"]),
        elapsed_seconds=float(payload["timings"]["cumulative_elapsed_s"]),
        status=status,
    )
    _atomic_write_json(workdir / "progress.json", payload)


def _remaining(invocation_started: float, wall_seconds: float) -> float:
    return wall_seconds - (time.monotonic() - invocation_started)


def _clear_previous_result(workdir: Path) -> None:
    removed = False
    for name in ("result.json", "combined_frontier.json"):
        try:
            (workdir / name).unlink()
            removed = True
        except FileNotFoundError:
            pass
    if removed:
        _fsync_dir(workdir)


def _proof_check(
    workdir: Path, args, run_seed: int, iteration: int,
    invocation_started: float,
) -> tuple[bool, dict[str, Any]]:
    final_cnf = workdir / "unsat_candidate.cnf"
    drat = workdir / "unsat_candidate.drat"
    try:
        drat.unlink()
    except FileNotFoundError:
        pass
    timeout = min(args.proof_timeout, _remaining(invocation_started, args.wall_seconds))
    if timeout <= 0:
        return False, {"proof_status": "wall budget exhausted before DRAT rerun"}
    proof_seed = _solver_seed(run_seed, iteration, "proof")
    solved = _run_command(
        [
            args.cadical,
            "-q",
            f"--seed={proof_seed}",
            str(final_cnf),
            str(drat),
        ],
        stdout_path=workdir / "proof_solver.stdout",
        stderr_path=workdir / "proof_solver.stderr",
        timeout=timeout,
    )
    if solved.timed_out:
        return False, {"proof_status": "proof-producing rerun timed out"}
    if solved.returncode != 20 or "s UNSATISFIABLE" not in solved.stdout:
        raise ProbeError(
            "persisted UNSAT candidate did not re-solve UNSAT "
            f"(exit {solved.returncode})"
        )
    if not drat.is_file() or drat.stat().st_size == 0:
        raise ProbeError("proof-producing rerun emitted no DRAT proof")

    timeout = min(args.proof_timeout, _remaining(invocation_started, args.wall_seconds))
    if timeout <= 0:
        return False, {"proof_status": "wall budget exhausted before drat-trim"}
    checked = _run_command(
        [args.drat_trim, str(final_cnf), str(drat)],
        stdout_path=workdir / "drat_trim.stdout",
        stderr_path=workdir / "drat_trim.stderr",
        timeout=timeout,
    )
    checker_output = checked.stdout + "\n" + checked.stderr
    if checked.timed_out:
        return False, {"proof_status": "drat-trim timed out"}
    if checked.returncode != 0 or "s VERIFIED" not in checker_output:
        raise ProbeError(f"drat-trim did not verify proof (exit {checked.returncode})")
    return True, {
        "proof_status": "DRAT verified",
        "proof_seed": proof_seed,
        "cnf_sha256": _sha256_file(final_cnf),
        "drat_sha256": _sha256_file(drat),
        "checker": args.drat_trim,
    }


def _execute(
    workdir: Path,
    checkpoint: ClosureCheckpoint,
    metadata: Mapping[str, Any],
    args,
    bank_rows: list[dict[str, Any]],
    structural_artifact,
    invocation_started: float,
    structural_oracle_catalog: Mapping[str, Any] | None = None,
) -> int:
    if structural_oracle_catalog is None:
        structural_oracle_catalog = metadata.get("_structural_oracle_catalog")
    instance, separation, representatives, seen, seed_instances = _prepare_formula(
        bank_rows,
        checkpoint,
        () if structural_artifact is None else structural_artifact.patterns,
        structural_oracle_catalog,
    )
    seed_inventory = getattr(instance, "seed_inventory", {
        "algebra_bank": {
            "rows": len(bank_rows),
            "profile_orbit_instances": seed_instances,
            "trust": "frozen certified algebra/Nullstellensatz motif bank",
        },
        "convex_structural": {
            "validated_profile_orbit_patterns": 0,
            "profile_orbit_instances": 0,
            "trust": (
                "separately validated theorem-backed convex-realization "
                "exclusions; not algebra-bank deadness"
            ),
        },
    })
    structural_metadata = metadata.get("convex_structural_seeds")
    oracle_metadata = metadata.get("formalized_structural_oracle")
    metadata = {
        **metadata,
        "formula_sources": {
            "algebra_bank": {
                **seed_inventory["algebra_bank"],
                "sha256": metadata["bank_sha256"],
            },
            "convex_structural": (
                None
                if structural_metadata is None
                else {
                    **seed_inventory["convex_structural"],
                    **structural_metadata,
                }
            ),
            "formalized_structural_oracle": oracle_metadata,
        },
    }
    start_iteration = checkpoint.progress().iteration + 1
    initial = _base_payload(
        status="SAT-progress",
        workdir=workdir,
        metadata=metadata,
        args=args,
        iteration=start_iteration - 1,
        instance_count=len(seen),
        seed_instances=seed_instances,
        invocation_started=invocation_started,
        extra={"phase": "resumed" if start_iteration > 1 else "initialized"},
    )
    _persist_status(checkpoint, workdir, initial)

    for iteration in range(start_iteration, args.max_iterations + 1):
        _check_stop()
        remaining = _remaining(invocation_started, args.wall_seconds)
        if remaining <= 0:
            payload = _base_payload(
                status="budget", workdir=workdir, metadata=metadata, args=args,
                iteration=iteration - 1, instance_count=len(seen),
                seed_instances=seed_instances, invocation_started=invocation_started,
                extra={"reason": "wall cap reached"},
            )
            _persist_status(checkpoint, workdir, payload, result=True)
            print(json.dumps(payload, sort_keys=True), flush=True)
            return 2

        dimacs = instance.dimacs().encode("ascii")
        current_cnf = workdir / "current.cnf"
        _atomic_write_bytes(current_cnf, dimacs)
        cadical_seed = _solver_seed(int(metadata["seed"]), iteration, "search")
        solved = _run_command(
            [args.cadical, "-q", f"--seed={cadical_seed}", str(current_cnf)],
            stdout_path=workdir / "search_solver.stdout",
            stderr_path=workdir / "search_solver.stderr",
            timeout=min(args.solver_timeout, remaining),
        )
        if solved.timed_out:
            payload = _base_payload(
                status="budget", workdir=workdir, metadata=metadata, args=args,
                iteration=iteration - 1, instance_count=len(seen),
                seed_instances=seed_instances, invocation_started=invocation_started,
                extra={
                    "reason": "search solver timeout",
                    "cadical_seed": cadical_seed,
                    "solver_iteration": iteration,
                },
            )
            _persist_status(checkpoint, workdir, payload, result=True)
            print(json.dumps(payload, sort_keys=True), flush=True)
            return 2

        if solved.returncode == 20 and "s UNSATISFIABLE" in solved.stdout:
            final_cnf = workdir / "unsat_candidate.cnf"
            _atomic_write_bytes(final_cnf, dimacs)
            candidate = _base_payload(
                status="UNSAT-candidate", workdir=workdir, metadata=metadata,
                args=args, iteration=iteration - 1, instance_count=len(seen),
                seed_instances=seed_instances, invocation_started=invocation_started,
                extra={
                    "solver_iteration": iteration,
                    "cadical_seed": cadical_seed,
                    "cnf_sha256": _sha256_file(final_cnf),
                    "trust": (
                        "candidate only; DRAT verification pending; hard "
                        "clauses combine separately identified algebra-bank "
                        "and formalized structural sources"
                    ),
                },
            )
            _persist_status(checkpoint, workdir, candidate)
            verified, proof = _proof_check(
                workdir, args, int(metadata["seed"]), iteration, invocation_started
            )
            if not verified:
                payload = _base_payload(
                    status="budget", workdir=workdir, metadata=metadata, args=args,
                    iteration=iteration - 1, instance_count=len(seen),
                    seed_instances=seed_instances,
                    invocation_started=invocation_started,
                    extra={
                        **proof,
                        "unsat_candidate": True,
                        "solver_iteration": iteration,
                    },
                )
                _persist_status(checkpoint, workdir, payload, result=True)
                print(json.dumps(payload, sort_keys=True), flush=True)
                return 2
            payload = _base_payload(
                status="UNSAT-verified", workdir=workdir, metadata=metadata,
                args=args, iteration=iteration, instance_count=len(seen),
                seed_instances=seed_instances, invocation_started=invocation_started,
                extra={
                    **proof,
                    "cadical_seed": cadical_seed,
                    "trust": (
                        "exact CNF re-solved and DRAT checked; mathematical claim "
                        "still depends separately on the frozen algebra bank, "
                        "the convex structural seeds, formalized structural "
                        "oracle catalog, "
                        "and the separation encoding"
                    ),
                },
            )
            _persist_terminal(checkpoint, workdir, payload)
            print(json.dumps(payload, sort_keys=True), flush=True)
            return 0

        if solved.returncode != 10 or "s SATISFIABLE" not in solved.stdout:
            raise ProbeError(
                f"CaDiCaL returned neither SAT nor UNSAT (exit {solved.returncode})"
            )

        cube, selected_orders = _decode_and_validate_model(
            instance, separation, solved.stdout
        )
        _assert_no_seen_exclusion(
            cube,
            instance.unconditional_seen,
            selected_orders,
            instance.ordered_seen,
        )
        algebra_records = _add_lazy_embeddings(
            instance, representatives, seen, cube
        )
        structural_records = []
        if algebra_records:
            structural_summary = {"status": "not-run-bank-refinement"}
        else:
            structural_records, structural_summary = (
                _add_formalized_structural_refinements(
                    instance,
                    separation,
                    seen,
                    cube,
                    selected_orders,
                    structural_oracle_catalog,
                )
            )
        records = [*algebra_records, *structural_records]
        if not records:
            payload = _base_payload(
                status="combined-frontier", workdir=workdir, metadata=metadata,
                args=args, iteration=iteration, instance_count=len(seen),
                seed_instances=seed_instances, invocation_started=invocation_started,
                extra={
                    "cadical_seed": cadical_seed,
                    "cube": {str(center): cube[center] for center in sorted(cube)},
                    "selected_orders": [_order_json(order) for order in selected_orders],
                    "independent_cube_ok": True,
                    "independent_selected_orders_valid": True,
                    "formalized_structural_scan": structural_summary,
                },
            )
            _persist_terminal(
                checkpoint,
                workdir,
                payload,
                aliases=("combined_frontier.json",),
            )
            print(json.dumps(payload, sort_keys=True), flush=True)
            return 0

        payload = _base_payload(
            status="SAT-progress", workdir=workdir, metadata=metadata, args=args,
            iteration=iteration, instance_count=len(seen),
            seed_instances=seed_instances, invocation_started=invocation_started,
            extra={
                "cadical_seed": cadical_seed,
                "new_instances": len(records),
                "new_algebra_instances": len(algebra_records),
                "new_structural_instances": len(structural_records),
                "formalized_structural_scan": structural_summary,
                "selected_orders_checked": len(selected_orders),
            },
        )
        _persist_status(checkpoint, workdir, payload, records=records)
        print(
            f"[iter {iteration}] +{len(records)} lazy instances "
            f"(algebra={len(algebra_records)}, structural={len(structural_records)}); "
            f"total={len(seen)} elapsed={payload['timings']['invocation_elapsed_s']:.1f}s",
            flush=True,
        )

    payload = _base_payload(
        status="budget", workdir=workdir, metadata=metadata, args=args,
        iteration=args.max_iterations, instance_count=len(seen),
        seed_instances=seed_instances, invocation_started=invocation_started,
        extra={"reason": "iteration cap reached"},
    )
    _persist_status(checkpoint, workdir, payload, result=True)
    print(json.dumps(payload, sort_keys=True), flush=True)
    return 2


def _snapshot_rows(path: Path) -> list[dict[str, Any]]:
    rows = []
    raw = path.read_bytes()
    if raw and not raw.endswith(b"\n"):
        raise ProbeError("stored bank snapshot is torn")
    for line_number, line in enumerate(raw.splitlines(), 1):
        try:
            row = json.loads(line)
        except json.JSONDecodeError as exc:
            raise ProbeError(
                f"stored bank snapshot row {line_number} is invalid"
            ) from exc
        if not isinstance(row, dict) or not isinstance(row.get("pattern"), dict):
            raise ProbeError("stored bank snapshot has a malformed row")
        rows.append(row)
    return rows


def _run(args) -> int:
    if args.resume:
        workdir = args.resume.resolve()
        if not workdir.is_dir():
            raise ProbeError(f"resume directory does not exist: {workdir}")
    else:
        workdir = _new_workdir(args.work_root.resolve())
    with _exclusive_workdir_lock(workdir):
        return _run_locked(args, workdir)


def _run_locked(args, workdir: Path) -> int:
    if args.resume:
        if getattr(args, "convex_structural_seeds", None) is not None:
            raise ProbeError(
                "--convex-structural-seeds cannot replace a resumed snapshot"
            )
        try:
            metadata = json.loads(
                (workdir / "run_metadata.json").read_text(encoding="utf-8")
            )
        except (FileNotFoundError, json.JSONDecodeError) as exc:
            raise ProbeError("resume metadata is absent or malformed") from exc
        checkpoint = ClosureCheckpoint.open(
            workdir / "checkpoint.sqlite3", metadata
        )
        terminal_status = checkpoint.progress().status
        if terminal_status in TERMINAL_STATUSES:
            checkpoint.close()
            raise ProbeError(
                f"run already has terminal status {terminal_status}; "
                "refusing resume"
            )
        snapshot = workdir / "bank_snapshot.jsonl"
        if _sha256_file(snapshot) != metadata.get("bank_sha256"):
            checkpoint.close()
            raise ProbeError("stored bank snapshot hash mismatch")
        if metadata.get("runtime_fingerprint") != _runtime_fingerprint():
            checkpoint.close()
            raise ProbeError("runtime source changed; ordered checkpoint replay refused")
        if args.seed is not None and args.seed != metadata["seed"]:
            checkpoint.close()
            raise ProbeError("--seed does not match resumed run")
        try:
            structural_artifact = _load_structural_seed_snapshot(
                workdir, metadata
            )
            structural_oracle_catalog = _load_structural_oracle_snapshot(
                workdir, metadata
            )
        except Exception:
            checkpoint.close()
            raise
    else:
        bank_rows, bank_raw = read_frozen_bank(args.bank.resolve())
        snapshot = workdir / "bank_snapshot.jsonl"
        _atomic_write_bytes(snapshot, bank_raw)
        structural_path = getattr(args, "convex_structural_seeds", None)
        if structural_path is None:
            structural_artifact = None
            structural_metadata = None
        else:
            structural_artifact, structural_raw = (
                _read_structural_seed_artifact(structural_path.resolve())
            )
            _atomic_write_bytes(
                workdir / STRUCTURAL_SEED_SNAPSHOT, structural_raw
            )
            _atomic_write_bytes(
                workdir / STRUCTURAL_SOURCE_SNAPSHOT,
                structural_artifact.source_result_bytes,
            )
            _atomic_write_bytes(
                workdir / STRUCTURAL_THEOREM_SNAPSHOT,
                structural_artifact.theorem_source_bytes,
            )
            structural_metadata = _structural_seed_metadata(
                structural_artifact, structural_raw
            )
        (
            structural_oracle_catalog,
            structural_oracle_raw,
            structural_oracle_sources,
            structural_oracle_metadata,
        ) = _prepare_structural_oracle_snapshot()
        _write_structural_oracle_snapshot(
            workdir, structural_oracle_raw, structural_oracle_sources
        )
        seed = args.seed if args.seed is not None else secrets.randbelow(
            MAX_CADICAL_SEED + 1
        )
        metadata = {
            "schema": SCHEMA,
            "bank_sha256": _sha256_bytes(bank_raw),
            "bank_rows": len(bank_rows),
            "seed": seed,
            "created_utc": datetime.now(timezone.utc).isoformat(),
            "runtime_fingerprint": _runtime_fingerprint(),
            "convex_structural_seeds": structural_metadata,
            "formalized_structural_oracle": structural_oracle_metadata,
        }
        _atomic_write_json(workdir / "run_metadata.json", metadata)
        checkpoint = ClosureCheckpoint.create(
            workdir / "checkpoint.sqlite3", metadata
        )

    # Parse the persisted bytes, never the live bank path, from this point on.
    bank_rows = _snapshot_rows(workdir / "bank_snapshot.jsonl")
    if len(bank_rows) != int(metadata["bank_rows"]):
        checkpoint.close()
        raise ProbeError("stored bank snapshot row count mismatch")
    execution_metadata = {
        **metadata,
        "elapsed_s": checkpoint.progress().elapsed_seconds,
        "_structural_oracle_catalog": structural_oracle_catalog,
    }
    invocation_started = time.monotonic()
    try:
        _clear_previous_result(workdir)
        return _execute(
            workdir,
            checkpoint,
            execution_metadata,
            args,
            bank_rows,
            structural_artifact,
            invocation_started,
        )
    except ProbeInterrupted as exc:
        prior = checkpoint.progress()
        cumulative_elapsed = max(
            prior.elapsed_seconds,
            float(execution_metadata["elapsed_s"])
            + (time.monotonic() - invocation_started),
        )
        payload = {
            "schema": SCHEMA,
            "status": "interrupted",
            "workdir": str(workdir),
            "bank_sha256": metadata["bank_sha256"],
            "convex_structural_seeds": metadata.get(
                "convex_structural_seeds"
            ),
            "formalized_structural_oracle": metadata.get(
                "formalized_structural_oracle"
            ),
            "seed": metadata["seed"],
            "iteration": prior.iteration,
            "signal": _STOP_SIGNAL,
            "message": str(exc),
            "elapsed_s": round(cumulative_elapsed, 3),
            "updated_utc": datetime.now(timezone.utc).isoformat(),
        }
        checkpoint.append_batch(
            [],
            iteration=prior.iteration,
            elapsed_seconds=cumulative_elapsed,
            status="interrupted",
        )
        _atomic_write_json(workdir / "progress.json", payload)
        return 128 + (_STOP_SIGNAL or signal.SIGINT)
    finally:
        checkpoint.close()


def _parse_args(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bank", type=Path, default=HERE / "bank.jsonl")
    parser.add_argument(
        "--work-root", type=Path, default=HERE / "separation_probe_runs"
    )
    parser.add_argument("--resume", type=Path)
    parser.add_argument("--seed", type=int)
    parser.add_argument(
        "--convex-structural-seeds",
        type=Path,
        help=(
            "validated theorem-backed convex structural seed artifact; "
            "snapshotted separately from the algebra bank"
        ),
    )
    parser.add_argument("--wall-seconds", type=float, default=14_400)
    parser.add_argument("--max-iterations", type=int, default=5_000)
    parser.add_argument("--solver-timeout", type=float, default=3_600)
    parser.add_argument("--proof-timeout", type=float, default=14_400)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--drat-trim", default="drat-trim")
    args = parser.parse_args(argv)
    if args.wall_seconds <= 0 or args.max_iterations <= 0:
        parser.error("wall and iteration caps must be positive")
    if args.solver_timeout <= 0 or args.proof_timeout <= 0:
        parser.error("solver and proof timeouts must be positive")
    if args.seed is not None and not 0 <= args.seed <= MAX_CADICAL_SEED:
        parser.error(f"seed must be in 0..{MAX_CADICAL_SEED}")
    return args


def main(argv=None) -> int:
    global _STOP_SIGNAL
    _STOP_SIGNAL = None
    args = _parse_args(argv)
    previous_int = signal.signal(signal.SIGINT, _signal_handler)
    previous_term = signal.signal(signal.SIGTERM, _signal_handler)
    try:
        return _run(args)
    except (ProbeError, CheckpointError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr, flush=True)
        return 1
    finally:
        signal.signal(signal.SIGINT, previous_int)
        signal.signal(signal.SIGTERM, previous_term)


if __name__ == "__main__":
    raise SystemExit(main())
