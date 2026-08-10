# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Production PIQD discovery for one source-faithful five-omission shard.

PIQD supplies discovery observations only.  A PIQD UNSAT observation is handed
back to the legacy CEGAR coordinator, whose terminal branch performs the one
fresh identical-CNF local CaDiCaL run and DRAT-trim verification.  UNKNOWN,
transport errors, and custody failures never select a local discovery fallback.
"""

from __future__ import annotations

import argparse
import json
import os
import stat
import time
from collections.abc import Callable, Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.card_head.sat_encoding import CadicalResult
from census.card_head.source_faithful_five_omission_cegar import (
    DETECTOR_FILES,
    FORMULA_FILES,
    MAX_CNF_BYTES,
    MAX_JOURNAL_TOTAL_BYTES,
    FiveOmissionCegarError,
    _new_instance,
    run_five_omission_cegar,
)
from census.card_head.source_faithful_five_omission_shared_bank import (
    SharedFiveOmissionBankError,
)
from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from census.p97_search.phase3_piqd_driver import DriverPolicy
from census.p97_search.phase3_piqd_oracle import Transport
from census.p97_search.phase3_piqd_static_solver_runner import (
    CERTIFICATE_BLOCKER,
    PRODUCER_SCHEMA,
    SOURCE_SCHEMA,
    StaticPiqdRunnerError,
    StaticSolverResult,
    make_static_piqd_solver_runner,
)

ADAPTER_SCHEMA = "p97-piqd-source-faithful-five-omission/v1"
VARIABLE_MAP_SCHEMA = "p97-source-faithful-five-omission-variable-map/v1"
BUNDLE_SEAL_SCHEMA = "p97-piqd-source-faithful-five-omission-input-custody/v1"
RESULT_SCHEMA = "p97-piqd-source-faithful-five-omission-result/v1"
EVIDENCE_CLASSIFICATION = "FINITE_DELETED_LABEL_STRUCTURAL_CEGAR_DISCOVERY"
PIQD_PROJECT = "erdos-97-96-formalization/source-faithful-five-omission"
RESULT_FILENAME = "piqd-result.json"

_CLAIMS = {
    "aggregate_claim": False,
    "lean_closure": False,
    "piqd_proof_claim": False,
    "proof_claim": False,
    "source_entitlement": False,
    "theorem_claim": False,
    "theorem_coverage": False,
    "universal_claim": False,
    "universal_lift": False,
}
_STATIC_SOURCE_CLAIMS = {
    "source_entitlement": False,
    "theorem_coverage": False,
    "universal_lift": False,
    "lean_closure": False,
}
_STATIC_PRODUCER_CLAIMS = {
    **_STATIC_SOURCE_CLAIMS,
    "one_process": False,
    "one_core": False,
}
_MAX_SOURCE_BYTES = 16 * 1024 * 1024
_MAX_DESCRIPTOR_BYTES = 16 * 1024 * 1024


class FiveOmissionPiqdError(FiveOmissionCegarError):
    """PIQD configuration, input custody, or adapter output failed closed."""


@dataclass(frozen=True, slots=True)
class _Snapshot:
    role: str
    path: Path
    relative_path: str
    filename: str
    payload: bytes
    identity: tuple[int, int]


@dataclass(frozen=True, slots=True)
class FiveOmissionPiqdInputBundle:
    """Create-once bytes that bind one exact finite deleted-label lane."""

    directory: Path
    deleted_label: int
    descriptor_bytes: bytes
    descriptor_sha256: str
    variable_map_bytes: bytes
    variable_map_sha256: str
    source_manifest_bytes: bytes
    source_manifest_sha256: str
    producer_manifest_bytes: bytes
    producer_manifest_sha256: str
    bundle_id: str
    expected_files: Mapping[str, bytes]
    expected_identities: Mapping[str, tuple[int, int]]
    original_inputs: tuple[tuple[Path, bytes, int, tuple[int, int]], ...]


def _absolute(path: Path) -> Path:
    return Path(os.path.abspath(os.fspath(path)))


def _open_directory(path: Path, *, create: bool) -> int:
    """Open an absolute directory chain without following any component."""

    absolute = _absolute(path)
    if not absolute.parts or absolute.parts[0] != os.path.sep:
        raise FiveOmissionPiqdError("custody path must be absolute")
    nofollow = getattr(os, "O_NOFOLLOW", 0)
    if nofollow == 0:
        raise FiveOmissionPiqdError("platform lacks required no-follow opens")
    flags = os.O_RDONLY | os.O_DIRECTORY | nofollow | getattr(os, "O_CLOEXEC", 0)
    descriptor = os.open(os.path.sep, flags)
    try:
        for component in absolute.parts[1:]:
            if not component or component in {".", ".."}:
                raise FiveOmissionPiqdError("custody path has an unsafe component")
            if create:
                try:
                    os.mkdir(component, 0o700, dir_fd=descriptor)
                except FileExistsError:
                    pass
            try:
                child = os.open(component, flags, dir_fd=descriptor)
            except OSError as exc:
                raise FiveOmissionPiqdError(
                    f"cannot safely open custody directory component {component}"
                ) from exc
            os.close(descriptor)
            descriptor = child
        return descriptor
    except Exception:
        os.close(descriptor)
        raise


def _capture_file_at(
    directory_fd: int,
    name: str,
    *,
    maximum_bytes: int,
    allow_empty: bool = True,
) -> tuple[bytes, tuple[int, int]]:
    if type(name) is not str or not name or "/" in name or name in {".", ".."}:
        raise FiveOmissionPiqdError("custody filename is unsafe")
    nofollow = getattr(os, "O_NOFOLLOW", 0)
    flags = os.O_RDONLY | nofollow | getattr(os, "O_CLOEXEC", 0)
    try:
        descriptor = os.open(name, flags, dir_fd=directory_fd)
    except OSError as exc:
        raise FiveOmissionPiqdError(f"cannot safely open custody file {name}") from exc
    try:
        before = os.fstat(descriptor)
        linked = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        identity = (before.st_dev, before.st_ino)
        if (
            not stat.S_ISREG(before.st_mode)
            or before.st_nlink != 1
            or identity != (linked.st_dev, linked.st_ino)
        ):
            raise FiveOmissionPiqdError(f"{name} is not a safe regular file")
        if before.st_size < 0 or before.st_size > maximum_bytes:
            raise FiveOmissionPiqdError(f"{name} exceeds its custody byte bound")
        if not allow_empty and before.st_size == 0:
            raise FiveOmissionPiqdError(f"{name} is unexpectedly empty")
        chunks: list[bytes] = []
        remaining = before.st_size
        while remaining:
            chunk = os.read(descriptor, min(remaining, 1024 * 1024))
            if not chunk:
                raise FiveOmissionPiqdError(f"{name} was only partly read")
            chunks.append(chunk)
            remaining -= len(chunk)
        if os.read(descriptor, 1):
            raise FiveOmissionPiqdError(f"{name} grew during capture")
        after = os.fstat(descriptor)
        final_link = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        if (before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns) != (
            after.st_dev,
            after.st_ino,
            after.st_size,
            after.st_mtime_ns,
        ) or identity != (final_link.st_dev, final_link.st_ino):
            raise FiveOmissionPiqdError(f"{name} changed during capture")
        return b"".join(chunks), identity
    finally:
        os.close(descriptor)


def _capture_path(path: Path, *, maximum_bytes: int) -> tuple[bytes, tuple[int, int]]:
    absolute = _absolute(path)
    parent_fd = _open_directory(absolute.parent, create=False)
    try:
        return _capture_file_at(parent_fd, absolute.name, maximum_bytes=maximum_bytes)
    finally:
        os.close(parent_fd)


def _write_once_at(directory_fd: int, name: str, payload: bytes) -> tuple[int, int]:
    if type(payload) is not bytes:
        raise FiveOmissionPiqdError("custody payload must be exact bytes")
    flags = (
        os.O_WRONLY
        | os.O_CREAT
        | os.O_EXCL
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    try:
        descriptor = os.open(name, flags, 0o600, dir_fd=directory_fd)
    except OSError as exc:
        raise FiveOmissionPiqdError(f"cannot create custody file {name}") from exc
    try:
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise FiveOmissionPiqdError(f"short custody write for {name}")
            view = view[written:]
        os.fsync(descriptor)
    finally:
        os.close(descriptor)
    installed, identity = _capture_file_at(
        directory_fd,
        name,
        maximum_bytes=max(len(payload), 1),
    )
    if installed != payload:
        raise FiveOmissionPiqdError(f"installed custody file {name} changed")
    return identity


def _source_snapshots(repo_root: Path) -> tuple[_Snapshot, ...]:
    snapshots: list[_Snapshot] = []
    specifications = (
        *(("formula", path) for path in FORMULA_FILES),
        *(("detector", path) for path in DETECTOR_FILES),
        ("adapter", "census/card_head/source_faithful_five_omission_piqd.py"),
        ("static-runner", "census/p97_search/phase3_piqd_static_solver_runner.py"),
        ("wave-contract", "census/p97_search/phase3_cegar_wave.py"),
        ("piqd-replay", "census/p97_search/phase3_piqd_replay.py"),
        ("piqd-oracle", "census/p97_search/phase3_piqd_oracle.py"),
        ("piqd-driver", "census/p97_search/phase3_piqd_driver.py"),
        ("bound-jobs", "census/card_head/exact12_v14_bound_jobs.py"),
        ("cell-run", "census/card_head/exact12_v14_cell_run.py"),
        ("jobs", "census/card_head/exact12_v14_jobs.py"),
        ("ordered-coverage", "census/card_head/exact12_v14_ordered_coverage.py"),
        (
            "ordered-cut-adapter",
            "census/card_head/exact12_v14_ordered_cut_adapter.py",
        ),
        ("schedule", "census/card_head/exact12_v14_schedule.py"),
        (
            "source-order-bank",
            "census/card_head/exact12_v14_source_order_bank.py",
        ),
        ("valuation", "census/card_head/exact12_v14_valuation.py"),
    )
    for index, (role, relative) in enumerate(specifications):
        path = _absolute(repo_root / relative)
        payload, identity = _capture_path(path, maximum_bytes=_MAX_SOURCE_BYTES)
        suffix = Path(relative).suffix or ".bin"
        snapshots.append(
            _Snapshot(
                role=role,
                path=path,
                relative_path=relative,
                filename=f"source-{index:02d}-{role}{suffix}",
                payload=payload,
                identity=identity,
            )
        )
    return tuple(snapshots)


def _optional_snapshot(
    role: str,
    path: Path | None,
) -> tuple[dict[str, Any], _Snapshot | None]:
    if path is None:
        return (
            {
                "path": None,
                "present": False,
                "sha256": None,
                "size_bytes": None,
                "snapshot_file": None,
            },
            None,
        )
    if not isinstance(path, Path):
        raise FiveOmissionPiqdError(f"{role} path must be a pathlib.Path or None")
    absolute = _absolute(path)
    payload, identity = _capture_path(absolute, maximum_bytes=MAX_JOURNAL_TOTAL_BYTES)
    snapshot = _Snapshot(
        role=role,
        path=absolute,
        relative_path=str(absolute),
        filename=f"input-{role}.bin",
        payload=payload,
        identity=identity,
    )
    return (
        {
            "path": str(absolute),
            "present": True,
            "sha256": sha256_bytes(payload),
            "size_bytes": len(payload),
            "snapshot_file": snapshot.filename,
        },
        snapshot,
    )


def _variable_map(deleted_label: int) -> tuple[dict[str, Any], int, int]:
    instance = _new_instance(deleted_label)
    choices = [
        {
            "candidate": list(instance.candidates[center][candidate_index]),
            "candidate_index": candidate_index,
            "center": center,
            "variable": variable,
        }
        for (center, candidate_index), variable in instance.choice_variables.items()
    ]
    value = {
        "schema": VARIABLE_MAP_SCHEMA,
        "allocation": {
            "choice_variables": choices,
            "nonchoice_auxiliary_range": [
                len(instance.choice_variables) + 1,
                instance.base_n_variables,
            ],
            "deleted_variables": instance.deleted_variables,
            "blocker_variables": instance.blocker_variables,
            "center_variables": instance.center_variables,
            "five_omission_auxiliary_range": [
                max(instance.center_variables.values()) + 1,
                instance.five_omission_n_variables,
            ],
            "fixed_deleted_label_clause": [instance.deleted_variables[deleted_label]],
        },
        "deleted_label": deleted_label,
        "num_variables": instance.cnf.n_variables,
    }
    return value, instance.cnf.n_variables, len(instance.cnf.clauses)


def _manifests(
    *,
    deleted_label: int,
    descriptor_sha256: str,
    variable_map_sha256: str,
) -> tuple[bytes, bytes]:
    source = {
        "schema": SOURCE_SCHEMA,
        "source_id": (
            f"source-faithful-five-omission-deleted-{deleted_label}:{descriptor_sha256}"
        ),
        "source_path": "local-custody/adapter-descriptor.json",
        "source_sha256": descriptor_sha256,
        "finite_schema": ADAPTER_SCHEMA,
        "cardinality_scope": (
            f"one finite exact-12 deleted-label={deleted_label} structural CEGAR shard"
        ),
        "source_theorem": "NONE: finite discovery evidence only",
        "claims": _STATIC_SOURCE_CLAIMS,
    }
    source_bytes = canonical_json_bytes(source)
    producer = {
        "schema": PRODUCER_SCHEMA,
        "producer_id": "source-faithful-five-omission-static-dimacs-v1",
        "producer_kind": "static-dimacs",
        "source_manifest": source,
        "source_manifest_sha256": sha256_bytes(source_bytes),
        "variable_map_sha256": variable_map_sha256,
        "backend": "cadical",
        "solver_profile": "sat",
        "query_polarity": "UNSAT_MEANS_OBSTRUCTION",
        "claims": _STATIC_PRODUCER_CLAIMS,
    }
    return source_bytes, canonical_json_bytes(producer)


def _build_bundle(
    *,
    repo_root: Path,
    custody_root: Path,
    deleted_label: int,
    seed_journal: Path | None,
    shared_bank: Path | None,
) -> FiveOmissionPiqdInputBundle:
    if type(deleted_label) is not int or not 0 <= deleted_label < 12:
        raise FiveOmissionPiqdError("deleted label must be a builtin Fin 12 value")
    if not isinstance(repo_root, Path) or not isinstance(custody_root, Path):
        raise FiveOmissionPiqdError("repository and custody roots must be Paths")
    snapshots = _source_snapshots(repo_root)
    seed_descriptor, seed_snapshot = _optional_snapshot("seed-journal", seed_journal)
    bank_descriptor, bank_snapshot = _optional_snapshot("shared-bank", shared_bank)
    variable_map, num_variables, num_clauses = _variable_map(deleted_label)
    variable_map_bytes = canonical_json_bytes(variable_map)
    variable_map_sha256 = sha256_bytes(variable_map_bytes)
    descriptor = {
        "schema": ADAPTER_SCHEMA,
        "evidence_classification": EVIDENCE_CLASSIFICATION,
        "cardinality_scope": (
            f"one finite exact-12 deleted-label={deleted_label} structural CEGAR shard"
        ),
        "deleted_label": deleted_label,
        "formula_files": list(FORMULA_FILES),
        "detector_files": list(DETECTOR_FILES),
        "sources": [
            {
                "path": snapshot.relative_path,
                "role": snapshot.role,
                "sha256": sha256_bytes(snapshot.payload),
                "size_bytes": len(snapshot.payload),
                "snapshot_file": snapshot.filename,
            }
            for snapshot in snapshots
        ],
        "inputs": {
            "seed_journal": seed_descriptor,
            "shared_bank": bank_descriptor,
        },
        "base_formula": {
            "num_clauses": num_clauses,
            "num_variables": num_variables,
        },
        "variable_map": {
            "schema": VARIABLE_MAP_SCHEMA,
            "sha256": variable_map_sha256,
            "size_bytes": len(variable_map_bytes),
        },
        "certificate_blocker": CERTIFICATE_BLOCKER,
        "claims": _CLAIMS,
    }
    descriptor_bytes = canonical_json_bytes(descriptor)
    if len(descriptor_bytes) > _MAX_DESCRIPTOR_BYTES:
        raise FiveOmissionPiqdError("adapter descriptor exceeds its byte bound")
    descriptor_sha256 = sha256_bytes(descriptor_bytes)
    source_manifest, producer_manifest = _manifests(
        deleted_label=deleted_label,
        descriptor_sha256=descriptor_sha256,
        variable_map_sha256=variable_map_sha256,
    )
    files: dict[str, bytes] = {
        "adapter-descriptor.json": descriptor_bytes,
        "producer-manifest.json": producer_manifest,
        "source-manifest.json": source_manifest,
        "variable-map.json": variable_map_bytes,
        **{snapshot.filename: snapshot.payload for snapshot in snapshots},
    }
    optional_snapshots = tuple(
        snapshot for snapshot in (seed_snapshot, bank_snapshot) if snapshot is not None
    )
    files.update(
        {snapshot.filename: snapshot.payload for snapshot in optional_snapshots}
    )
    inventory = {
        name: {"sha256": sha256_bytes(payload), "size_bytes": len(payload)}
        for name, payload in sorted(files.items())
    }
    bundle_id = sha256_bytes(
        canonical_json_bytes({"schema": BUNDLE_SEAL_SCHEMA, "inventory": inventory})
    )
    files["bundle-seal.json"] = canonical_json_bytes(
        {"schema": BUNDLE_SEAL_SCHEMA, "bundle_id": bundle_id, "inventory": inventory}
    )

    root_fd = _open_directory(custody_root, create=True)
    directory_name = f"bundle-{bundle_id}"
    expected_identities: dict[str, tuple[int, int]] = {}
    try:
        try:
            os.mkdir(directory_name, 0o700, dir_fd=root_fd)
            fresh = True
        except FileExistsError:
            fresh = False
        flags = (
            os.O_RDONLY
            | os.O_DIRECTORY
            | getattr(os, "O_CLOEXEC", 0)
            | getattr(os, "O_NOFOLLOW", 0)
        )
        try:
            bundle_fd = os.open(directory_name, flags, dir_fd=root_fd)
        except OSError as exc:
            raise FiveOmissionPiqdError("input bundle directory is unsafe") from exc
        try:
            installed = os.fstat(bundle_fd)
            linked = os.stat(directory_name, dir_fd=root_fd, follow_symlinks=False)
            if (installed.st_dev, installed.st_ino) != (linked.st_dev, linked.st_ino):
                raise FiveOmissionPiqdError("input bundle directory was substituted")
            if fresh:
                for name, payload in sorted(files.items()):
                    _write_once_at(bundle_fd, name, payload)
                os.fsync(bundle_fd)
                os.fsync(root_fd)
            if set(os.listdir(bundle_fd)) != set(files):
                raise FiveOmissionPiqdError("input bundle inventory is crossed")
            for name, payload in files.items():
                captured, identity = _capture_file_at(
                    bundle_fd,
                    name,
                    maximum_bytes=max(len(payload), 1),
                )
                if captured != payload:
                    raise FiveOmissionPiqdError(f"input bundle changed: {name}")
                expected_identities[name] = identity
        finally:
            os.close(bundle_fd)
    finally:
        os.close(root_fd)

    original_inputs = tuple(
        (snapshot.path, snapshot.payload, _MAX_SOURCE_BYTES, snapshot.identity)
        for snapshot in snapshots
    ) + tuple(
        (
            snapshot.path,
            snapshot.payload,
            MAX_JOURNAL_TOTAL_BYTES,
            snapshot.identity,
        )
        for snapshot in optional_snapshots
    )
    return FiveOmissionPiqdInputBundle(
        directory=_absolute(custody_root) / directory_name,
        deleted_label=deleted_label,
        descriptor_bytes=descriptor_bytes,
        descriptor_sha256=descriptor_sha256,
        variable_map_bytes=variable_map_bytes,
        variable_map_sha256=variable_map_sha256,
        source_manifest_bytes=source_manifest,
        source_manifest_sha256=sha256_bytes(source_manifest),
        producer_manifest_bytes=producer_manifest,
        producer_manifest_sha256=sha256_bytes(producer_manifest),
        bundle_id=bundle_id,
        expected_files=files,
        expected_identities=expected_identities,
        original_inputs=original_inputs,
    )


def _verify_bundle(bundle: FiveOmissionPiqdInputBundle) -> None:
    directory_fd = _open_directory(bundle.directory, create=False)
    try:
        if set(os.listdir(directory_fd)) != set(bundle.expected_files):
            raise FiveOmissionPiqdError("input bundle inventory changed")
        for name, expected in bundle.expected_files.items():
            captured, identity = _capture_file_at(
                directory_fd,
                name,
                maximum_bytes=max(len(expected), 1),
            )
            if captured != expected or identity != bundle.expected_identities[name]:
                raise FiveOmissionPiqdError(f"input bundle custody changed: {name}")
    finally:
        os.close(directory_fd)
    for path, expected, maximum_bytes, expected_identity in bundle.original_inputs:
        captured, identity = _capture_path(path, maximum_bytes=maximum_bytes)
        if captured != expected or identity != expected_identity:
            raise FiveOmissionPiqdError(f"bound source or input changed: {path}")


def _validate_static_result(value: object, *, num_variables: int) -> StaticSolverResult:
    if type(value) is not StaticSolverResult:
        raise FiveOmissionPiqdError("PIQD returned a non-exact StaticSolverResult")
    if type(value.verdict) is not str or value.verdict not in {
        "SAT",
        "UNSAT",
        "UNKNOWN",
    }:
        raise FiveOmissionPiqdError("PIQD verdict is malformed")
    if type(value.assignment) is not dict:
        raise FiveOmissionPiqdError("PIQD assignment container is malformed")
    if type(value.returncode) is not int:
        raise FiveOmissionPiqdError("PIQD return code is not a builtin int")
    if type(value.stdout) is not str or type(value.stderr) is not str:
        raise FiveOmissionPiqdError("PIQD diagnostics are malformed")
    if any(type(key) is not int for key in value.assignment) or any(
        type(item) is not bool for item in value.assignment.values()
    ):
        raise FiveOmissionPiqdError("PIQD assignment uses non-builtin scalars")
    if value.verdict == "SAT":
        if value.returncode != 10 or set(value.assignment) != set(
            range(1, num_variables + 1)
        ):
            raise FiveOmissionPiqdError("PIQD SAT assignment is not exact and total")
    elif value.assignment:
        raise FiveOmissionPiqdError("non-SAT PIQD result carries an assignment")
    elif value.verdict == "UNSAT" and value.returncode != 20:
        raise FiveOmissionPiqdError("PIQD UNSAT return code is malformed")
    return value


class FiveOmissionPiqdDiscovery:
    """Exact static-runner result adapter for the legacy discovery seam."""

    def __init__(
        self,
        *,
        runner: Callable[[Path, int, Path | None], StaticSolverResult],
        bundle: FiveOmissionPiqdInputBundle,
    ) -> None:
        if not callable(runner):
            raise FiveOmissionPiqdError("PIQD runner must be callable")
        self.runner = runner
        self.bundle = bundle

    def __call__(
        self,
        cnf_path: Path,
        timeout_seconds: int,
        proof_path: Path | None,
    ) -> CadicalResult:
        if not isinstance(cnf_path, Path):
            raise FiveOmissionPiqdError("PIQD CNF path must be a Path")
        if type(timeout_seconds) is not int or timeout_seconds <= 0:
            raise FiveOmissionPiqdError("PIQD timeout must be a positive builtin int")
        if proof_path is not None:
            raise FiveOmissionPiqdError("PIQD discovery must receive proof_path=None")
        _verify_bundle(self.bundle)
        try:
            raw = self.runner(cnf_path, timeout_seconds, None)
        except FiveOmissionPiqdError:
            raise
        except Exception as exc:
            raise FiveOmissionPiqdError("PIQD discovery failed closed") from exc
        result = _validate_static_result(
            raw, num_variables=_new_instance(self.bundle.deleted_label).cnf.n_variables
        )
        _verify_bundle(self.bundle)
        diagnostic = (result.stdout + "\n" + result.stderr)[-1000:]
        if result.verdict == "SAT":
            positive = frozenset(
                variable for variable, selected in result.assignment.items() if selected
            )
            return CadicalResult("SAT", {}, 10, False, diagnostic, positive)
        if result.verdict == "UNSAT":
            return CadicalResult("UNSAT", None, 20, False, diagnostic)
        return CadicalResult("UNKNOWN", None, result.returncode, False, diagnostic)


def make_five_omission_piqd_discovery(
    *,
    repo_root: Path,
    base_url: str,
    journal_root: Path,
    deleted_label: int,
    seed_journal: Path | None = None,
    shared_bank: Path | None = None,
    transport: Transport | None = None,
    sleep: Callable[[float], None] = time.sleep,
) -> FiveOmissionPiqdDiscovery:
    """Create a source-bound, finite-only PIQD discovery adapter."""

    if type(base_url) is not str or not base_url.strip():
        raise FiveOmissionPiqdError("a nonempty PIQD base URL is required")
    if not isinstance(journal_root, Path):
        raise FiveOmissionPiqdError("PIQD journal root must be a Path")
    bundle = _build_bundle(
        repo_root=repo_root,
        custody_root=journal_root / "input-custody",
        deleted_label=deleted_label,
        seed_journal=seed_journal,
        shared_bank=shared_bank,
    )
    runner = make_static_piqd_solver_runner(
        base_url=base_url,
        journal_root=journal_root / "attempts",
        source_manifest=bundle.source_manifest_bytes,
        producer_manifest=bundle.producer_manifest_bytes,
        transport=transport,
        policy=DriverPolicy(project=PIQD_PROJECT, requested_core_limit=1),
        max_cnf_bytes=MAX_CNF_BYTES,
        sleep=sleep,
    )
    return FiveOmissionPiqdDiscovery(runner=runner, bundle=bundle)


def _write_result_once(workdir: Path, result: Mapping[str, Any]) -> Path:
    payload = canonical_json_bytes(result) + b"\n"
    directory_fd = _open_directory(_absolute(workdir), create=False)
    try:
        _write_once_at(directory_fd, RESULT_FILENAME, payload)
    finally:
        os.close(directory_fd)
    return _absolute(workdir) / RESULT_FILENAME


def _hold_file_at(
    directory_fd: int,
    name: str,
    *,
    maximum_bytes: int,
) -> tuple[int, bytes, tuple[int, int, int, int]]:
    """Capture one file while retaining the exact opened inode."""

    if type(name) is not str or not name or "/" in name or name in {".", ".."}:
        raise FiveOmissionPiqdError("custody filename is unsafe")
    flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0) | getattr(os, "O_CLOEXEC", 0)
    try:
        descriptor = os.open(name, flags, dir_fd=directory_fd)
    except OSError as exc:
        raise FiveOmissionPiqdError(f"cannot safely open custody file {name}") from exc
    try:
        before = os.fstat(descriptor)
        linked = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        identity = (
            before.st_dev,
            before.st_ino,
            before.st_size,
            before.st_mtime_ns,
        )
        if (
            not stat.S_ISREG(before.st_mode)
            or before.st_nlink != 1
            or identity[:2] != (linked.st_dev, linked.st_ino)
        ):
            raise FiveOmissionPiqdError(f"{name} is not a safe regular file")
        if before.st_size < 0 or before.st_size > maximum_bytes:
            raise FiveOmissionPiqdError(f"{name} exceeds its custody byte bound")
        chunks: list[bytes] = []
        remaining = before.st_size
        while remaining:
            chunk = os.read(descriptor, min(remaining, 1024 * 1024))
            if not chunk:
                raise FiveOmissionPiqdError(f"{name} was only partly read")
            chunks.append(chunk)
            remaining -= len(chunk)
        if os.read(descriptor, 1):
            raise FiveOmissionPiqdError(f"{name} grew during capture")
        payload = b"".join(chunks)
        _verify_held_file_at(directory_fd, name, descriptor, payload, identity)
        return descriptor, payload, identity
    except BaseException:
        os.close(descriptor)
        raise


def _verify_held_file_at(
    directory_fd: int,
    name: str,
    descriptor: int,
    expected: bytes,
    identity: tuple[int, int, int, int],
) -> None:
    """Recheck both a held inode and its no-follow directory entry."""

    before = os.fstat(descriptor)
    linked = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
    current_identity = (
        before.st_dev,
        before.st_ino,
        before.st_size,
        before.st_mtime_ns,
    )
    if (
        not stat.S_ISREG(before.st_mode)
        or before.st_nlink != 1
        or current_identity != identity
        or identity[:2] != (linked.st_dev, linked.st_ino)
    ):
        raise FiveOmissionPiqdError(f"held custody file {name} changed")
    os.lseek(descriptor, 0, os.SEEK_SET)
    chunks: list[bytes] = []
    remaining = len(expected)
    while remaining:
        chunk = os.read(descriptor, min(remaining, 1024 * 1024))
        if not chunk:
            raise FiveOmissionPiqdError(f"held custody file {name} was truncated")
        chunks.append(chunk)
        remaining -= len(chunk)
    if os.read(descriptor, 1) or b"".join(chunks) != expected:
        raise FiveOmissionPiqdError(f"held custody file {name} changed")
    after = os.fstat(descriptor)
    final_link = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
    if (
        after.st_dev,
        after.st_ino,
        after.st_size,
        after.st_mtime_ns,
    ) != identity or identity[:2] != (final_link.st_dev, final_link.st_ino):
        raise FiveOmissionPiqdError(f"held custody file {name} changed")


def _publish_result(
    workdir: Path,
    bundle: FiveOmissionPiqdInputBundle,
    deleted_label: int,
    summary: Mapping[str, Any],
) -> tuple[dict[str, Any], Path]:
    """Bind a stable legacy summary and publish one create-once sidecar."""

    directory_fd = _open_directory(_absolute(workdir), create=False)
    summary_fd = -1
    try:
        summary_fd, summary_bytes, summary_identity = _hold_file_at(
            directory_fd,
            "summary.json",
            maximum_bytes=_MAX_DESCRIPTOR_BYTES,
        )
        if (
            type(summary) is not dict
            or summary_bytes != canonical_json_bytes(summary) + b"\n"
        ):
            raise FiveOmissionPiqdError(
                "legacy summary artifact is not the exact returned summary"
            )
        result = {
            "schema": RESULT_SCHEMA,
            "evidence_classification": EVIDENCE_CLASSIFICATION,
            "deleted_label": deleted_label,
            "scope": (
                "one finite exact-12 deleted-label shard; PIQD supplies discovery "
                "observations and any terminal proof is a fresh local DRAT rerun"
            ),
            "status": summary["status"],
            "legacy_summary_sha256": sha256_bytes(summary_bytes),
            "input_bundle_id": bundle.bundle_id,
            "source_manifest_sha256": bundle.source_manifest_sha256,
            "producer_manifest_sha256": bundle.producer_manifest_sha256,
            "certificate_blocker": CERTIFICATE_BLOCKER,
            "piqd_proof_obtained": False,
            "claims": _CLAIMS,
        }
        result_payload = canonical_json_bytes(result) + b"\n"

        # This check deliberately occurs after the held summary capture.  The
        # held inode and pathname are then rechecked immediately around the
        # create-once install, closing the publication-boundary race.
        _verify_bundle(bundle)
        _verify_held_file_at(
            directory_fd,
            "summary.json",
            summary_fd,
            summary_bytes,
            summary_identity,
        )
        _write_once_at(directory_fd, RESULT_FILENAME, result_payload)
        os.fsync(directory_fd)
        _verify_held_file_at(
            directory_fd,
            "summary.json",
            summary_fd,
            summary_bytes,
            summary_identity,
        )
        _verify_bundle(bundle)
        return result, _absolute(workdir) / RESULT_FILENAME
    finally:
        if summary_fd >= 0:
            os.close(summary_fd)
        os.close(directory_fd)


def run_five_omission_piqd(
    repo_root: Path,
    workdir: Path,
    deleted_label: int,
    *,
    piqd_base_url: str,
    piqd_journal_root: Path,
    max_iterations: int = 100,
    timeout_seconds: int = 60,
    nice: int = 10,
    seed_journal: Path | None = None,
    shared_bank: Path | None = None,
    transport: Transport | None = None,
    sleep: Callable[[float], None] = time.sleep,
) -> dict[str, Any]:
    """Run one production PIQD-discovery shard and publish an additive sidecar."""

    discovery = make_five_omission_piqd_discovery(
        repo_root=repo_root,
        base_url=piqd_base_url,
        journal_root=piqd_journal_root,
        deleted_label=deleted_label,
        seed_journal=seed_journal,
        shared_bank=shared_bank,
        transport=transport,
        sleep=sleep,
    )
    summary = run_five_omission_cegar(
        repo_root,
        workdir,
        deleted_label,
        max_iterations=max_iterations,
        timeout_seconds=timeout_seconds,
        nice=nice,
        seed_journal=seed_journal,
        shared_bank=shared_bank,
        discovery_solver=discovery,
    )
    result, result_path = _publish_result(
        workdir, discovery.bundle, deleted_label, summary
    )
    return {
        "legacy_summary": summary,
        "piqd_result": result,
        "piqd_result_path": str(result_path),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--deleted-label", type=int, required=True)
    parser.add_argument("--piqd-base-url", required=True)
    parser.add_argument("--piqd-journal-root", type=Path, required=True)
    parser.add_argument("--max-iterations", type=int, default=100)
    parser.add_argument("--timeout-seconds", type=int, default=60)
    parser.add_argument("--nice", type=int, default=10)
    parser.add_argument("--seed-journal", type=Path)
    parser.add_argument("--shared-bank", type=Path)
    args = parser.parse_args()
    try:
        result = run_five_omission_piqd(
            args.repo_root,
            args.workdir,
            args.deleted_label,
            piqd_base_url=args.piqd_base_url,
            piqd_journal_root=args.piqd_journal_root,
            max_iterations=args.max_iterations,
            timeout_seconds=args.timeout_seconds,
            nice=args.nice,
            seed_journal=args.seed_journal,
            shared_bank=args.shared_bank,
        )
    except (
        FiveOmissionCegarError,
        SharedFiveOmissionBankError,
        StaticPiqdRunnerError,
        OSError,
    ) as exc:
        print(
            json.dumps({"status": "PIPELINE_ERROR", "error": str(exc)}, sort_keys=True)
        )
        return 2
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0 if result["legacy_summary"]["status"] == "UNSAT_DRAT_VERIFIED" else 1


if __name__ == "__main__":
    raise SystemExit(main())


__all__ = [
    "ADAPTER_SCHEMA",
    "BUNDLE_SEAL_SCHEMA",
    "EVIDENCE_CLASSIFICATION",
    "PIQD_PROJECT",
    "RESULT_SCHEMA",
    "VARIABLE_MAP_SCHEMA",
    "FiveOmissionPiqdDiscovery",
    "FiveOmissionPiqdError",
    "FiveOmissionPiqdInputBundle",
    "make_five_omission_piqd_discovery",
    "run_five_omission_piqd",
]
