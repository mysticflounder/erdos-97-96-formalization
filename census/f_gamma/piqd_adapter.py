"""PIQD onboarding for the base F-Gamma finite SAT abstraction.

Only the satisfiable base query is routed through PIQD.  The two geometric
smoke gates remain on the local CaDiCaL + DRAT verification path in
``encoding.run_smoke``.  PIQD UNSAT is observational, and every non-SAT
outcome fails closed without a local fallback.
"""

from __future__ import annotations

import json
import os
import stat
import time
from collections.abc import Callable, Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.card_head.sat_encoding import CadicalResult, EncodingError
from census.f_gamma.encoding import FIRST_FIBER, TRACKED_POINTS, FGammaInstance
from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    STRUCTURAL_SAT,
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
    validate_attempt_journal,
    validate_wave_manifest,
    wave_manifest_sha256,
)
from census.p97_search.phase3_piqd_driver import EVENT_SCHEMA, SEAL_SCHEMA, DriverPolicy
from census.p97_search.phase3_piqd_oracle import Transport, raw_dimacs_identity
from census.p97_search.phase3_piqd_static_solver_runner import (
    ATTESTED_SOLVER_RESULT,
    PRODUCER_SCHEMA,
    RECEIPT_SCHEMA,
    SOURCE_SCHEMA,
    StaticSolverResult,
    make_static_piqd_solver_runner,
)

ADAPTER_SCHEMA = "p97-piqd-f-gamma-adapter/v1"
VARIABLE_MAP_SCHEMA = "p97-f-gamma-variable-map/v1"
BUNDLE_SEAL_SCHEMA = "p97-f-gamma-piqd-input-custody/v1"
EVIDENCE_CLASSIFICATION = "SAT_FINITE_ABSTRACTION"
PIQD_PROJECT = "erdos-97-96-formalization/f-gamma-base"

_CLAIMS = {
    "aggregate_claim": False,
    "counterexample_claim": False,
    "independent_third_party_readback": False,
    "lean_closure": False,
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
_MAX_INPUT_BYTES = 4 * 1024 * 1024
_MAX_RECEIPT_BYTES = 1024 * 1024
_MAX_JOURNAL_BYTES = 64 * 1024 * 1024
_MAX_ARTIFACT_BYTES = 64 * 1024 * 1024
_MAX_JSON_DEPTH = 32
_MAX_JSON_NODES = 100_000
_HEX = frozenset("0123456789abcdef")
_CUSTODY_SEAL_SCHEMA = "p97-piqd-static-attempt-custody-seal/v1"
_CUSTODY_RETRY_POLICY = "REMOVE_UNSEALED_RESERVED_ATTEMPT"
_CERTIFICATE_BLOCKER = "CERT-001"
_ATTEMPT_ENTRIES = {
    "attempt.jsonl",
    "attempt.jsonl.lock",
    "attempt.jsonl.artifacts",
    "attempt.jsonl.seal.json",
    "solver-receipt.json",
    "custody-seal.json",
}
_RECEIPT_KEYS = {
    "schema",
    "attempt",
    "attempt_directory",
    "journal",
    "receipt_path",
    "custody_seal_path",
    "job_id",
    "job_identity",
    "prepare_freshness_claimed",
    "outcome",
    "adapter_verdict",
    "adapter_returncode",
    "cnf_sha256",
    "num_variables",
    "num_clauses",
    "source_manifest_sha256",
    "producer_manifest_sha256",
    "terminal_record_sha256",
    "journal_record_count",
    "seal_sha256",
    "status_classification",
    "status_detail",
    "terminal_status",
    "terminal_status_canonical_sha256",
    "terminal_status_raw_sha256",
    "terminal_status_raw_size",
    "terminal_status_raw_artifact_sha256",
    "terminal_status_identity_scope",
    "terminal_status_exposed_identity_fields",
    "model_response_sha256",
    "endpoint_trace",
    "failure_detail",
    "custody_retry_policy",
    "legacy_drat_proof_path_written",
    "proof_endpoint_called",
    "certificate_blocker",
    "claims",
    "receipt_sha256",
}


class FGammaPiqdAdapterError(EncodingError):
    """The F-Gamma PIQD discovery or its local custody failed closed."""


@dataclass(frozen=True, slots=True)
class FGammaPiqdInputBundle:
    """Exact bytes retained locally and transitively bound into PIQD identity."""

    directory: Path
    descriptor_bytes: bytes
    descriptor_sha256: str
    variable_map_bytes: bytes
    variable_map_sha256: str
    source_manifest_bytes: bytes
    source_manifest_sha256: str
    producer_manifest_bytes: bytes
    producer_manifest_sha256: str
    cnf_bytes: bytes
    cnf_sha256: str
    num_variables: int
    num_clauses: int
    bundle_id: str
    expected_files: Mapping[str, bytes]
    expected_identities: Mapping[str, tuple[int, int]]

    @property
    def variable_map_path(self) -> Path:
        return self.directory / "variable-map.json"

    @property
    def descriptor_path(self) -> Path:
        return self.directory / "adapter-descriptor.json"


@dataclass(frozen=True, slots=True)
class _SourceSnapshot:
    role: str
    path: str
    filename: str
    payload: bytes


def _digest(value: object, name: str) -> str:
    if (
        type(value) is not str
        or len(value) != 64
        or any(character not in _HEX for character in value)
    ):
        raise FGammaPiqdAdapterError(f"{name} is not a lowercase SHA-256 digest")
    return value


def _open_directory(path: Path, *, create: bool) -> int:
    """Open an absolute directory chain without following any component."""

    absolute = Path(os.path.abspath(os.fspath(path)))
    parts = absolute.parts
    if not parts or parts[0] != os.path.sep:
        raise FGammaPiqdAdapterError("custody path must be absolute")
    flags = (
        os.O_RDONLY
        | os.O_DIRECTORY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    descriptor = os.open(os.path.sep, flags)
    try:
        for component in parts[1:]:
            if not component or component in {".", ".."}:
                raise FGammaPiqdAdapterError("custody path has an unsafe component")
            if create:
                try:
                    os.mkdir(component, 0o700, dir_fd=descriptor)
                except FileExistsError:
                    pass
            try:
                child = os.open(component, flags, dir_fd=descriptor)
            except OSError as exc:
                raise FGammaPiqdAdapterError(
                    f"cannot open custody directory component {component!r}"
                ) from exc
            info = os.fstat(child)
            link_info = os.stat(component, dir_fd=descriptor, follow_symlinks=False)
            if not stat.S_ISDIR(info.st_mode) or (
                info.st_dev,
                info.st_ino,
            ) != (link_info.st_dev, link_info.st_ino):
                os.close(child)
                raise FGammaPiqdAdapterError("custody directory was substituted")
            os.close(descriptor)
            descriptor = child
        return descriptor
    except Exception:
        os.close(descriptor)
        raise


def _open_child_directory(directory_fd: int, name: str) -> int:
    if not name or name in {".", ".."} or os.path.sep in name:
        raise FGammaPiqdAdapterError("invalid custody directory component")
    flags = (
        os.O_RDONLY
        | os.O_DIRECTORY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    try:
        descriptor = os.open(name, flags, dir_fd=directory_fd)
    except OSError as exc:
        raise FGammaPiqdAdapterError(
            f"cannot safely open custody directory {name}"
        ) from exc
    info = os.fstat(descriptor)
    link_info = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
    if not stat.S_ISDIR(info.st_mode) or (info.st_dev, info.st_ino) != (
        link_info.st_dev,
        link_info.st_ino,
    ):
        os.close(descriptor)
        raise FGammaPiqdAdapterError(f"{name} has an unsafe custody identity")
    return descriptor


def _require_held_directory(directory_fd: int, name: str, held_fd: int) -> None:
    held = os.fstat(held_fd)
    current = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
    if (
        not stat.S_ISDIR(held.st_mode)
        or not stat.S_ISDIR(current.st_mode)
        or (held.st_dev, held.st_ino) != (current.st_dev, current.st_ino)
    ):
        raise FGammaPiqdAdapterError(f"custody directory {name} was substituted")


def _capture_file_at(
    directory_fd: int,
    name: str,
    *,
    maximum_bytes: int = _MAX_INPUT_BYTES,
    allow_empty: bool = True,
) -> bytes:
    if not name or "/" in name or name in {".", ".."}:
        raise FGammaPiqdAdapterError("unsafe custody filename")
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    try:
        descriptor = os.open(name, flags, dir_fd=directory_fd)
    except OSError as exc:
        raise FGammaPiqdAdapterError(f"cannot safely open custody file {name}") from exc
    try:
        before = os.fstat(descriptor)
        link_info = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise FGammaPiqdAdapterError(f"{name} is not a singly linked regular file")
        if before.st_size < 0 or before.st_size > maximum_bytes:
            raise FGammaPiqdAdapterError(f"{name} exceeds its custody byte bound")
        if not allow_empty and before.st_size == 0:
            raise FGammaPiqdAdapterError(f"{name} is unexpectedly empty")
        chunks: list[bytes] = []
        remaining = before.st_size
        while remaining:
            chunk = os.read(descriptor, min(remaining, 1024 * 1024))
            if not chunk:
                raise FGammaPiqdAdapterError(f"{name} was only partly read")
            chunks.append(chunk)
            remaining -= len(chunk)
        if os.read(descriptor, 1):
            raise FGammaPiqdAdapterError(f"{name} grew during capture")
        after = os.fstat(descriptor)
        final_link_info = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        identity = (before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns)
        if identity != (after.st_dev, after.st_ino, after.st_size, after.st_mtime_ns):
            raise FGammaPiqdAdapterError(f"{name} changed during capture")
        expected_link = (before.st_dev, before.st_ino)
        if expected_link != (link_info.st_dev, link_info.st_ino) or expected_link != (
            final_link_info.st_dev,
            final_link_info.st_ino,
        ):
            raise FGammaPiqdAdapterError(f"{name} pathname was substituted")
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _capture_path(path: Path) -> bytes:
    parent_fd = _open_directory(path.parent, create=False)
    try:
        return _capture_file_at(parent_fd, path.name)
    finally:
        os.close(parent_fd)


def _file_identity_at(directory_fd: int, name: str) -> tuple[int, int]:
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    try:
        descriptor = os.open(name, flags, dir_fd=directory_fd)
    except OSError as exc:
        raise FGammaPiqdAdapterError(
            f"cannot safely identify custody file {name}"
        ) from exc
    try:
        info = os.fstat(descriptor)
        link_info = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        identity = (info.st_dev, info.st_ino)
        if (
            not stat.S_ISREG(info.st_mode)
            or info.st_nlink != 1
            or identity != (link_info.st_dev, link_info.st_ino)
        ):
            raise FGammaPiqdAdapterError(f"{name} has an unsafe custody identity")
        return identity
    finally:
        os.close(descriptor)


def _write_once_at(directory_fd: int, name: str, payload: bytes) -> None:
    flags = (
        os.O_WRONLY
        | os.O_CREAT
        | os.O_EXCL
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    descriptor = os.open(name, flags, 0o600, dir_fd=directory_fd)
    try:
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise FGammaPiqdAdapterError(f"short custody write for {name}")
            view = view[written:]
        os.fsync(descriptor)
    finally:
        os.close(descriptor)
    if _capture_file_at(directory_fd, name) != payload:
        raise FGammaPiqdAdapterError(f"installed custody file {name} changed")


def _source_snapshots() -> tuple[_SourceSnapshot, ...]:
    root = Path(__file__).resolve().parents[2]
    specifications = (
        ("f-gamma-encoding", "census/f_gamma/encoding.py", "source-00-encoding.py"),
        ("shared-cnf", "census/card_head/sat_encoding.py", "source-01-sat-encoding.py"),
        (
            "f-gamma-piqd-adapter",
            "census/f_gamma/piqd_adapter.py",
            "source-02-piqd-adapter.py",
        ),
        (
            "static-piqd-runner",
            "census/p97_search/phase3_piqd_static_solver_runner.py",
            "source-03-static-runner.py",
        ),
        (
            "raw-dimacs-client",
            "census/p97_search/phase3_piqd_oracle.py",
            "source-04-piqd-oracle.py",
        ),
        (
            "piqd-attempt-driver",
            "census/p97_search/phase3_piqd_driver.py",
            "source-05-piqd-driver.py",
        ),
        (
            "canonical-json-and-journal-validation",
            "census/p97_search/phase3_cegar_wave.py",
            "source-06-cegar-wave.py",
        ),
    )
    return tuple(
        _SourceSnapshot(role, path, filename, _capture_path(root / path))
        for role, path, filename in specifications
    )


def _variable_map(instance: FGammaInstance) -> dict[str, Any]:
    variables: list[dict[str, Any]] = []
    for row in (instance.first_row, instance.cap_source_row):
        for point in TRACKED_POINTS:
            variables.append(
                {
                    "center": row.center,
                    "kind": "selected-support-membership",
                    "point": point,
                    "row_id": row.row_id,
                    "variable": instance.variable(row, point),
                }
            )
    variables.append(
        {
            "kind": "cap-source-center-in-first-cap",
            "semantic_name": "c(g) in first cap",
            "variable": instance.cap_source_center_in_first_cap,
        }
    )
    next_variable = instance.cap_source_center_in_first_cap + 1
    for prefix_index, point in enumerate(FIRST_FIBER):
        prefix = list(FIRST_FIBER[: prefix_index + 1])
        for threshold in (1, 2):
            variables.append(
                {
                    "kind": "sinz-prefix-counter",
                    "prefix_points": prefix,
                    "row_id": instance.cap_source_row.row_id,
                    "threshold": threshold,
                    "trigger_point": point,
                    "variable": next_variable,
                }
            )
            next_variable += 1
    if [entry["variable"] for entry in variables] != list(
        range(1, instance.cnf.n_variables + 1)
    ):
        raise FGammaPiqdAdapterError("canonical variable allocation is not total")
    return {
        "schema": VARIABLE_MAP_SCHEMA,
        "allocation": variables,
        "num_variables": instance.cnf.n_variables,
    }


def _manifests(
    *, descriptor_sha256: str, variable_map_sha256: str
) -> tuple[bytes, bytes]:
    source = {
        "schema": SOURCE_SCHEMA,
        "source_id": f"f-gamma-base-descriptor:{descriptor_sha256}",
        "source_path": "local-custody/adapter-descriptor.json",
        "source_sha256": descriptor_sha256,
        "finite_schema": ADAPTER_SCHEMA,
        "cardinality_scope": "one deterministic 23-variable F-Gamma base CNF",
        "source_theorem": "NONE: SAT_FINITE_ABSTRACTION only",
        "claims": _STATIC_SOURCE_CLAIMS,
    }
    source_bytes = canonical_json_bytes(source)
    producer = {
        "schema": PRODUCER_SCHEMA,
        "producer_id": "f-gamma-base-static-dimacs-v1",
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


def _build_bundle(custody_root: Path) -> FGammaPiqdInputBundle:
    instance = FGammaInstance()
    cnf_bytes = instance.dimacs().encode("ascii")
    variable_map_bytes = canonical_json_bytes(_variable_map(instance))
    variable_map_sha256 = sha256_bytes(variable_map_bytes)
    snapshots = _source_snapshots()
    descriptor = {
        "schema": ADAPTER_SCHEMA,
        "evidence_classification": EVIDENCE_CLASSIFICATION,
        "cnf": {
            "num_clauses": instance.base_n_clauses,
            "num_variables": instance.base_n_variables,
            "sha256": sha256_bytes(cnf_bytes),
            "size_bytes": len(cnf_bytes),
        },
        "producer": {
            "allocation_order": [
                "K(s1) memberships in TRACKED_POINTS order",
                "K(g) memberships in TRACKED_POINTS order",
                "optional c(g)-in-first-cap premise",
                "Sinz counters by FIRST_FIBER prefix then threshold 1,2",
            ],
            "command": [
                "census.f_gamma.encoding:FGammaInstance()",
                "FGammaInstance.dimacs(extra_clauses=())",
                "encode(ascii)",
            ],
        },
        "sources": [
            {
                "path": snapshot.path,
                "role": snapshot.role,
                "sha256": sha256_bytes(snapshot.payload),
                "size_bytes": len(snapshot.payload),
                "snapshot_file": snapshot.filename,
            }
            for snapshot in snapshots
        ],
        "variable_map": {
            "schema": VARIABLE_MAP_SCHEMA,
            "sha256": variable_map_sha256,
            "size_bytes": len(variable_map_bytes),
        },
        "claims": _CLAIMS,
    }
    descriptor_bytes = canonical_json_bytes(descriptor)
    descriptor_sha256 = sha256_bytes(descriptor_bytes)
    source_manifest, producer_manifest = _manifests(
        descriptor_sha256=descriptor_sha256,
        variable_map_sha256=variable_map_sha256,
    )
    files: dict[str, bytes] = {
        "adapter-descriptor.json": descriptor_bytes,
        "base.cnf": cnf_bytes,
        "producer-manifest.json": producer_manifest,
        "source-manifest.json": source_manifest,
        "variable-map.json": variable_map_bytes,
        **{snapshot.filename: snapshot.payload for snapshot in snapshots},
    }
    inventory = {
        name: {"sha256": sha256_bytes(payload), "size_bytes": len(payload)}
        for name, payload in sorted(files.items())
    }
    bundle_id = sha256_bytes(
        canonical_json_bytes({"schema": BUNDLE_SEAL_SCHEMA, "inventory": inventory})
    )
    seal = {
        "schema": BUNDLE_SEAL_SCHEMA,
        "bundle_id": bundle_id,
        "inventory": inventory,
    }
    files["bundle-seal.json"] = canonical_json_bytes(seal)

    expected_identities: dict[str, tuple[int, int]] = {}
    root_fd = _open_directory(custody_root, create=True)
    directory_name = f"bundle-{bundle_id}"
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
            raise FGammaPiqdAdapterError("input bundle directory is unsafe") from exc
        try:
            bundle_info = os.fstat(bundle_fd)
            bundle_link_info = os.stat(
                directory_name, dir_fd=root_fd, follow_symlinks=False
            )
            if (bundle_info.st_dev, bundle_info.st_ino) != (
                bundle_link_info.st_dev,
                bundle_link_info.st_ino,
            ):
                raise FGammaPiqdAdapterError("input bundle directory was substituted")
            if fresh:
                for name, payload in sorted(files.items()):
                    _write_once_at(bundle_fd, name, payload)
                os.fsync(bundle_fd)
                os.fsync(root_fd)
            if set(os.listdir(bundle_fd)) != set(files):
                raise FGammaPiqdAdapterError(
                    "input bundle has missing or untracked entries"
                )
            for name, payload in files.items():
                if _capture_file_at(bundle_fd, name) != payload:
                    raise FGammaPiqdAdapterError(f"custody mismatch for {name}")
                expected_identities[name] = _file_identity_at(bundle_fd, name)
        finally:
            os.close(bundle_fd)
    finally:
        os.close(root_fd)

    return FGammaPiqdInputBundle(
        directory=Path(os.path.abspath(custody_root)) / directory_name,
        descriptor_bytes=descriptor_bytes,
        descriptor_sha256=descriptor_sha256,
        variable_map_bytes=variable_map_bytes,
        variable_map_sha256=variable_map_sha256,
        source_manifest_bytes=source_manifest,
        source_manifest_sha256=sha256_bytes(source_manifest),
        producer_manifest_bytes=producer_manifest,
        producer_manifest_sha256=sha256_bytes(producer_manifest),
        cnf_bytes=cnf_bytes,
        cnf_sha256=sha256_bytes(cnf_bytes),
        num_variables=instance.base_n_variables,
        num_clauses=instance.base_n_clauses,
        bundle_id=bundle_id,
        expected_files=files,
        expected_identities=expected_identities,
    )


def _verify_bundle(bundle: FGammaPiqdInputBundle) -> None:
    directory_fd = _open_directory(bundle.directory, create=False)
    try:
        if set(os.listdir(directory_fd)) != set(bundle.expected_files):
            raise FGammaPiqdAdapterError("custody bundle inventory changed")
        for name, expected in bundle.expected_files.items():
            if _capture_file_at(directory_fd, name) != expected:
                raise FGammaPiqdAdapterError(f"custody bundle changed: {name}")
            if (
                _file_identity_at(directory_fd, name)
                != bundle.expected_identities[name]
            ):
                raise FGammaPiqdAdapterError(f"custody bundle identity changed: {name}")
    finally:
        os.close(directory_fd)


def _install_exact_query(path: Path, payload: bytes) -> None:
    parent_fd = _open_directory(path.parent, create=False)
    try:
        try:
            _write_once_at(parent_fd, path.name, payload)
        except FileExistsError:
            if _capture_file_at(parent_fd, path.name) != payload:
                raise FGammaPiqdAdapterError("existing F-Gamma query CNF is crossed")
    finally:
        os.close(parent_fd)


def _bounded_json_shape(value: Any, label: str) -> None:
    pending = [(value, 0)]
    nodes = 0
    while pending:
        item, depth = pending.pop()
        nodes += 1
        if nodes > _MAX_JSON_NODES or depth > _MAX_JSON_DEPTH:
            raise FGammaPiqdAdapterError(f"{label} exceeds its JSON shape bound")
        if type(item) is dict:
            pending.extend((key, depth + 1) for key in item)
            pending.extend((child, depth + 1) for child in item.values())
        elif type(item) is list:
            pending.extend((child, depth + 1) for child in item)
        elif type(item) not in {str, int, float, bool, type(None)}:
            raise FGammaPiqdAdapterError(f"{label} contains a non-JSON builtin")


def _strict_json_object(
    raw: bytes,
    label: str,
    *,
    maximum_bytes: int = _MAX_RECEIPT_BYTES,
    require_canonical: bool = True,
) -> dict[str, Any]:
    if type(raw) is not bytes or len(raw) > maximum_bytes:
        raise FGammaPiqdAdapterError(f"{label} exceeds its byte bound")

    def pairs_hook(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        value: dict[str, Any] = {}
        for key, item in pairs:
            if key in value:
                raise ValueError(f"duplicate JSON key: {key}")
            value[key] = item
        return value

    def reject_constant(value: str) -> None:
        raise ValueError(f"non-finite JSON value: {value}")

    try:
        value = json.loads(
            raw,
            object_pairs_hook=pairs_hook,
            parse_constant=reject_constant,
        )
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
        OverflowError,
    ) as exc:
        raise FGammaPiqdAdapterError(f"{label} is malformed") from exc
    _bounded_json_shape(value, label)
    if type(value) is not dict:
        raise FGammaPiqdAdapterError(f"{label} is not a JSON object")
    if require_canonical and canonical_json_bytes(value) != raw:
        raise FGammaPiqdAdapterError(f"{label} is not a canonical JSON object")
    return value


def _strict_receipt(stdout: str) -> tuple[dict[str, Any], bytes]:
    if type(stdout) is not str or not stdout.endswith("\n") or stdout.endswith("\n\n"):
        raise FGammaPiqdAdapterError("PIQD SAT lacks a canonical solver receipt")
    try:
        receipt_bytes = stdout.encode("utf-8")
    except UnicodeEncodeError as exc:
        raise FGammaPiqdAdapterError("PIQD solver receipt is malformed") from exc
    if len(receipt_bytes) > _MAX_RECEIPT_BYTES:
        raise FGammaPiqdAdapterError("PIQD solver receipt exceeds its byte bound")
    raw = receipt_bytes[:-1]
    return _strict_json_object(raw, "PIQD solver receipt"), receipt_bytes


def _exact_keys(value: object, expected: set[str], label: str) -> dict[str, Any]:
    if type(value) is not dict or set(value) != expected:
        raise FGammaPiqdAdapterError(f"{label} has crossed keys")
    return value


def _exact_scalar(value: object, expected: object, label: str) -> None:
    if type(value) is not type(expected) or value != expected:
        raise FGammaPiqdAdapterError(f"PIQD receipt crossed {label}")


def _wave_manifest(bundle: FGammaPiqdInputBundle, attempt: int) -> dict[str, Any]:
    source = _strict_json_object(bundle.source_manifest_bytes, "source manifest")
    producer = _strict_json_object(bundle.producer_manifest_bytes, "producer manifest")
    manifest = {
        "schema": "p97-cegar-wave/v1",
        "wave_id": f"static-{bundle.cnf_sha256[:32]}-{attempt:08d}",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": source["source_id"],
            "ingress_hypotheses_sha256": source["source_sha256"],
            "finite_schema": source["finite_schema"],
            "cardinality_scope": source["cardinality_scope"],
            "source_theorem": source["source_theorem"],
        },
        "encoding": {
            "cnf_sha256": bundle.cnf_sha256,
            "variable_map_sha256": producer["variable_map_sha256"],
            "producer_manifest_sha256": bundle.producer_manifest_sha256,
            "num_variables": bundle.num_variables,
            "num_clauses": bundle.num_clauses,
            "query_polarity": producer["query_polarity"],
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "sat",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": sha256_bytes(
                canonical_json_bytes(
                    {
                        "cnf_sha256": bundle.cnf_sha256,
                        "producer_manifest_sha256": bundle.producer_manifest_sha256,
                    }
                )
            ),
            "seed": 97,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    try:
        validate_wave_manifest(manifest)
    except (TypeError, ValueError) as exc:
        raise FGammaPiqdAdapterError("local PIQD wave manifest is invalid") from exc
    return manifest


def _validate_endpoint_trace(receipt: Mapping[str, Any], job_id: str) -> None:
    trace = receipt["endpoint_trace"]
    if type(trace) is not list or not trace:
        raise FGammaPiqdAdapterError("PIQD receipt has a malformed endpoint trace")
    stages: list[int] = []
    counts = {"prepare": 0, "cnf": 0, "confirm": 0, "status": 0, "model": 0, "log": 0}
    for entry in trace:
        entry = _exact_keys(entry, {"method", "target"}, "endpoint trace entry")
        method = entry["method"]
        target = entry["target"]
        if type(method) is not str or type(target) is not str:
            raise FGammaPiqdAdapterError("PIQD endpoint trace has non-string fields")
        if method == "POST" and target == "/jobs/prepare-cnf":
            stage = 0
            counts["prepare"] += 1
        elif method == "GET" and target == f"/jobs/{job_id}/cnf":
            stage = 1
            counts["cnf"] += 1
        elif method == "POST" and target == f"/jobs/confirm?job_id={job_id}":
            stage = 2
            counts["confirm"] += 1
        elif method == "GET" and target == f"/jobs/{job_id}":
            stage = 3
            counts["status"] += 1
        elif method == "GET" and target == f"/jobs/{job_id}/model":
            stage = 4
            counts["model"] += 1
        elif method == "GET" and target.startswith(f"/jobs/{job_id}/log?"):
            query = target.removeprefix(f"/jobs/{job_id}/log?")
            parts = query.split("&")
            if (
                len(parts) != 2
                or parts[1] != "max=1048576"
                or not parts[0].startswith("from=")
            ):
                raise FGammaPiqdAdapterError(
                    "PIQD receipt has a malformed log endpoint"
                )
            offset = parts[0].removeprefix("from=")
            if not offset.isascii() or not offset.isdigit():
                raise FGammaPiqdAdapterError("PIQD receipt has a malformed log offset")
            stage = 5
            counts["log"] += 1
        else:
            raise FGammaPiqdAdapterError("PIQD receipt contains an unexpected endpoint")
        stages.append(stage)
    if stages != sorted(stages):
        raise FGammaPiqdAdapterError("PIQD receipt endpoint stages are crossed")
    if any(counts[name] != 1 for name in ("prepare", "cnf", "confirm")) or any(
        counts[name] < 1 for name in ("status", "model", "log")
    ):
        raise FGammaPiqdAdapterError("PIQD receipt lacks an exact same-job trace")


def _validate_terminal_status(
    receipt: Mapping[str, Any], job: Mapping[str, Any]
) -> None:
    status = receipt["terminal_status"]
    if type(status) is not dict:
        raise FGammaPiqdAdapterError("PIQD receipt lacks a terminal status object")
    expected = {
        "id": job["job_id"],
        "status": "completed",
        "result": "SAT",
        "requested_core_limit": 1,
        "attested_solver_processes": 1,
        "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
    }
    for field, value in expected.items():
        _exact_scalar(status.get(field), value, f"terminal_status.{field}")
    progress = status.get("progress")
    if (
        type(progress) is not dict
        or type(progress.get("solver_started")) is not bool
        or not progress["solver_started"]
    ):
        raise FGammaPiqdAdapterError(
            "PIQD terminal status lacks solver-start attestation"
        )
    exposed = receipt["terminal_status_exposed_identity_fields"]
    if type(exposed) is not list or any(type(field) is not str for field in exposed):
        raise FGammaPiqdAdapterError(
            "PIQD receipt has malformed exposed identity fields"
        )
    allowed = {"backend", "solver_profile", "project", "identity_hash", "cnf_blob_hash"}
    if exposed != sorted(set(exposed)) or any(
        field not in allowed for field in exposed
    ):
        raise FGammaPiqdAdapterError("PIQD receipt has crossed exposed identity fields")
    for field in exposed:
        _exact_scalar(status.get(field), job[field], f"terminal_status.{field}")
    scope = "EXPOSED_FIELDS_BOUND" if exposed else "JOB_ID_ONLY"
    _exact_scalar(
        receipt["terminal_status_identity_scope"],
        scope,
        "terminal status identity scope",
    )


def _validate_receipt_shape(
    receipt: Mapping[str, Any], bundle: FGammaPiqdInputBundle
) -> dict[str, Any]:
    receipt = _exact_keys(receipt, _RECEIPT_KEYS, "PIQD solver receipt")
    unsigned = dict(receipt)
    recorded_receipt_hash = unsigned.pop("receipt_sha256")
    if _digest(recorded_receipt_hash, "receipt_sha256") != sha256_json(unsigned):
        raise FGammaPiqdAdapterError("PIQD receipt self-hash is crossed")
    expected_scalars = {
        "schema": RECEIPT_SCHEMA,
        "prepare_freshness_claimed": False,
        "adapter_verdict": "SAT",
        "adapter_returncode": 10,
        "cnf_sha256": bundle.cnf_sha256,
        "num_variables": bundle.num_variables,
        "num_clauses": bundle.num_clauses,
        "source_manifest_sha256": bundle.source_manifest_sha256,
        "producer_manifest_sha256": bundle.producer_manifest_sha256,
        "status_classification": ATTESTED_SOLVER_RESULT,
        "status_detail": "one solver process returned SAT",
        "outcome": STRUCTURAL_SAT,
        "failure_detail": None,
        "custody_retry_policy": _CUSTODY_RETRY_POLICY,
        "proof_endpoint_called": False,
        "legacy_drat_proof_path_written": False,
        "certificate_blocker": _CERTIFICATE_BLOCKER,
    }
    for field, expected in expected_scalars.items():
        _exact_scalar(receipt[field], expected, field)
    _exact_keys(receipt["claims"], set(_STATIC_PRODUCER_CLAIMS), "receipt claims")
    for field, expected in _STATIC_PRODUCER_CLAIMS.items():
        _exact_scalar(receipt["claims"][field], expected, f"claims.{field}")
    job = _exact_keys(
        receipt["job_identity"],
        {
            "job_id",
            "backend",
            "solver_profile",
            "project",
            "cnf_blob_hash",
            "identity_hash",
            "num_vars",
            "num_clauses",
            "existing",
            "requested_core_limit",
        },
        "PIQD job identity",
    )
    expected_identity = raw_dimacs_identity(
        backend="cadical",
        solver_profile="sat",
        cnf_sha256=bundle.cnf_sha256,
        producer_manifest_sha256=bundle.producer_manifest_sha256,
        requested_core_limit=1,
    )
    expected_job = {
        "backend": "cadical",
        "solver_profile": "sat",
        "project": PIQD_PROJECT,
        "cnf_blob_hash": bundle.cnf_sha256,
        "identity_hash": expected_identity,
        "num_vars": bundle.num_variables,
        "num_clauses": bundle.num_clauses,
        "requested_core_limit": 1,
    }
    for field, expected in expected_job.items():
        _exact_scalar(job[field], expected, f"job_identity.{field}")
    if type(job["job_id"]) is not str or not job["job_id"]:
        raise FGammaPiqdAdapterError("PIQD SAT lacks a builtin job id")
    if type(job["existing"]) is not bool:
        raise FGammaPiqdAdapterError("PIQD job existing flag is malformed")
    _exact_scalar(receipt["job_id"], job["job_id"], "job_id")
    for field in (
        "terminal_record_sha256",
        "seal_sha256",
        "terminal_status_canonical_sha256",
        "terminal_status_raw_sha256",
        "terminal_status_raw_artifact_sha256",
        "model_response_sha256",
    ):
        _digest(receipt[field], field)
    for field in ("attempt", "journal_record_count", "terminal_status_raw_size"):
        if type(receipt[field]) is not int or receipt[field] < 0:
            raise FGammaPiqdAdapterError(f"PIQD receipt has malformed {field}")
    if receipt["journal_record_count"] == 0 or receipt["terminal_status_raw_size"] == 0:
        raise FGammaPiqdAdapterError("PIQD receipt has empty terminal custody")
    for field in ("attempt_directory", "journal", "receipt_path", "custody_seal_path"):
        if type(receipt[field]) is not str or not receipt[field]:
            raise FGammaPiqdAdapterError(f"PIQD receipt has malformed {field}")
    _validate_terminal_status(receipt, job)
    _validate_endpoint_trace(receipt, job["job_id"])
    return job


def _validate_artifact_inventory(
    artifact_fd: int, inventory: object
) -> dict[str, bytes]:
    if type(inventory) is not list:
        raise FGammaPiqdAdapterError("PIQD custody artifact inventory is malformed")
    actual_names = sorted(os.listdir(artifact_fd))
    artifacts: dict[str, bytes] = {}
    recorded_names: list[str] = []
    for entry_value in inventory:
        entry = _exact_keys(
            entry_value,
            {"sha256", "size", "device", "inode"},
            "artifact inventory entry",
        )
        digest = _digest(entry["sha256"], "artifact inventory digest")
        recorded_names.append(digest)
        for field in ("size", "device", "inode"):
            if type(entry[field]) is not int or entry[field] < 0:
                raise FGammaPiqdAdapterError(
                    f"artifact inventory has malformed {field}"
                )
        payload = _capture_file_at(
            artifact_fd, digest, maximum_bytes=_MAX_ARTIFACT_BYTES
        )
        if sha256_bytes(payload) != digest or len(payload) != entry["size"]:
            raise FGammaPiqdAdapterError("PIQD custody artifact digest is crossed")
        if _file_identity_at(artifact_fd, digest) != (entry["device"], entry["inode"]):
            raise FGammaPiqdAdapterError("PIQD custody artifact identity is crossed")
        artifacts[digest] = payload
    if recorded_names != sorted(set(recorded_names)) or recorded_names != actual_names:
        raise FGammaPiqdAdapterError("PIQD custody artifact inventory is crossed")
    return artifacts


def _parse_journal(raw: bytes) -> list[dict[str, Any]]:
    if not raw.endswith(b"\n"):
        raise FGammaPiqdAdapterError("PIQD journal is not newline terminated")
    lines = raw[:-1].split(b"\n")
    if not lines or any(not line for line in lines):
        raise FGammaPiqdAdapterError("PIQD journal has an empty record")
    return [
        _strict_json_object(
            line,
            f"PIQD journal record {index}",
            maximum_bytes=_MAX_JOURNAL_BYTES,
        )
        for index, line in enumerate(lines)
    ]


def _assignment_from_model(
    payload: bytes, *, job_id: str, num_variables: int
) -> dict[int, bool]:
    model = _strict_json_object(
        payload,
        "PIQD model response",
        maximum_bytes=_MAX_ARTIFACT_BYTES,
        require_canonical=False,
    )
    _exact_scalar(model.get("job_id"), job_id, "model job_id")
    _exact_scalar(model.get("result"), "SAT", "model result")
    _exact_scalar(model.get("num_assigned"), num_variables, "model num_assigned")
    literals = model.get("assignment")
    if type(literals) is not list or len(literals) != num_variables:
        raise FGammaPiqdAdapterError("PIQD model artifact is not total")
    assignment: dict[int, bool] = {}
    for literal in literals:
        if type(literal) is not int or literal == 0 or abs(literal) > num_variables:
            raise FGammaPiqdAdapterError("PIQD model artifact has a malformed literal")
        variable = abs(literal)
        if variable in assignment:
            raise FGammaPiqdAdapterError("PIQD model artifact repeats a variable")
        assignment[variable] = literal > 0
    if set(assignment) != set(range(1, num_variables + 1)):
        raise FGammaPiqdAdapterError("PIQD model artifact is not exact and total")
    return assignment


def _validate_attempt_custody(
    *,
    receipt: Mapping[str, Any],
    receipt_bytes: bytes,
    bundle: FGammaPiqdInputBundle,
    attempt_root: Path,
    observed_assignment: Mapping[int, bool],
) -> None:
    job = _validate_receipt_shape(receipt, bundle)
    attempt = receipt["attempt"]
    attempt_name = f"attempt-{attempt:08d}-{bundle.cnf_sha256[:16]}"
    absolute_root = Path(os.path.abspath(os.fspath(attempt_root)))
    attempt_path = absolute_root / attempt_name
    expected_paths = {
        "attempt_directory": str(attempt_path),
        "journal": str(attempt_path / "attempt.jsonl"),
        "receipt_path": str(attempt_path / "solver-receipt.json"),
        "custody_seal_path": str(attempt_path / "custody-seal.json"),
    }
    for field, expected in expected_paths.items():
        _exact_scalar(receipt[field], expected, field)

    root_fd = _open_directory(absolute_root, create=False)
    attempt_fd = -1
    artifact_fd = -1
    try:
        attempt_fd = _open_child_directory(root_fd, attempt_name)
        if set(os.listdir(attempt_fd)) != _ATTEMPT_ENTRIES:
            raise FGammaPiqdAdapterError("PIQD attempt directory inventory is crossed")
        attempt_info = os.fstat(attempt_fd)
        installed_receipt = _capture_file_at(
            attempt_fd, "solver-receipt.json", maximum_bytes=_MAX_RECEIPT_BYTES
        )
        if installed_receipt != receipt_bytes:
            raise FGammaPiqdAdapterError(
                "PIQD stdout receipt crossed its installed file"
            )
        receipt_identity = _file_identity_at(attempt_fd, "solver-receipt.json")
        custody_raw = _capture_file_at(
            attempt_fd, "custody-seal.json", maximum_bytes=_MAX_RECEIPT_BYTES
        )
        if not custody_raw.endswith(b"\n"):
            raise FGammaPiqdAdapterError(
                "PIQD custody seal lacks its canonical newline"
            )
        custody = _strict_json_object(custody_raw[:-1], "PIQD custody seal")
        custody = _exact_keys(
            custody,
            {
                "schema",
                "attempt_directory_device",
                "attempt_directory_inode",
                "receipt_sha256",
                "receipt_file_sha256",
                "receipt_file_size",
                "receipt_device",
                "receipt_inode",
                "inventory",
                "retry_policy",
                "custody_seal_sha256",
            },
            "PIQD custody seal",
        )
        unsigned_custody = dict(custody)
        custody_hash = unsigned_custody.pop("custody_seal_sha256")
        if _digest(custody_hash, "custody_seal_sha256") != sha256_json(
            unsigned_custody
        ):
            raise FGammaPiqdAdapterError("PIQD custody seal self-hash is crossed")
        custody_expected = {
            "schema": _CUSTODY_SEAL_SCHEMA,
            "attempt_directory_device": attempt_info.st_dev,
            "attempt_directory_inode": attempt_info.st_ino,
            "receipt_sha256": receipt["receipt_sha256"],
            "receipt_file_sha256": sha256_bytes(receipt_bytes),
            "receipt_file_size": len(receipt_bytes),
            "receipt_device": receipt_identity[0],
            "receipt_inode": receipt_identity[1],
            "retry_policy": _CUSTODY_RETRY_POLICY,
        }
        for field, expected in custody_expected.items():
            _exact_scalar(custody[field], expected, f"custody.{field}")

        inventory = _exact_keys(
            custody["inventory"],
            {
                "journal_sha256",
                "journal_size",
                "journal_device",
                "journal_inode",
                "lock_device",
                "lock_inode",
                "driver_seal_sha256",
                "artifacts",
            },
            "PIQD custody inventory",
        )
        journal_raw = _capture_file_at(
            attempt_fd,
            "attempt.jsonl",
            maximum_bytes=_MAX_JOURNAL_BYTES,
            allow_empty=False,
        )
        lock_raw = _capture_file_at(attempt_fd, "attempt.jsonl.lock", maximum_bytes=1)
        if lock_raw:
            raise FGammaPiqdAdapterError("PIQD attempt lock is not empty")
        journal_identity = _file_identity_at(attempt_fd, "attempt.jsonl")
        lock_identity = _file_identity_at(attempt_fd, "attempt.jsonl.lock")
        inventory_expected = {
            "journal_sha256": sha256_bytes(journal_raw),
            "journal_size": len(journal_raw),
            "journal_device": journal_identity[0],
            "journal_inode": journal_identity[1],
            "lock_device": lock_identity[0],
            "lock_inode": lock_identity[1],
        }
        for field, expected in inventory_expected.items():
            _exact_scalar(inventory[field], expected, f"inventory.{field}")

        driver_seal_raw = _capture_file_at(
            attempt_fd, "attempt.jsonl.seal.json", maximum_bytes=_MAX_RECEIPT_BYTES
        )
        if not driver_seal_raw.endswith(b"\n"):
            raise FGammaPiqdAdapterError("PIQD driver seal lacks its canonical newline")
        _exact_scalar(
            inventory["driver_seal_sha256"],
            sha256_bytes(driver_seal_raw),
            "inventory.driver_seal_sha256",
        )
        driver_seal = _strict_json_object(driver_seal_raw[:-1], "PIQD driver seal")
        driver_seal = _exact_keys(
            driver_seal,
            {
                "schema",
                "wave_manifest_sha256",
                "record_count",
                "terminal_attempt_sha256",
                "journal_sha256",
                "seal_sha256",
            },
            "PIQD driver seal",
        )
        unsigned_driver = dict(driver_seal)
        driver_hash = unsigned_driver.pop("seal_sha256")
        if _digest(driver_hash, "driver seal") != sha256_json(unsigned_driver):
            raise FGammaPiqdAdapterError("PIQD driver seal self-hash is crossed")
        manifest = _wave_manifest(bundle, attempt)
        driver_expected = {
            "schema": SEAL_SCHEMA,
            "wave_manifest_sha256": wave_manifest_sha256(manifest),
            "record_count": receipt["journal_record_count"],
            "terminal_attempt_sha256": receipt["terminal_record_sha256"],
            "journal_sha256": sha256_bytes(journal_raw),
            "seal_sha256": receipt["seal_sha256"],
        }
        for field, expected in driver_expected.items():
            _exact_scalar(driver_seal[field], expected, f"driver_seal.{field}")
        records = _parse_journal(journal_raw)
        try:
            validate_attempt_journal(
                records,
                manifest=manifest,
                expected_record_count=receipt["journal_record_count"],
                expected_terminal_sha256=receipt["terminal_record_sha256"],
            )
        except (TypeError, ValueError) as exc:
            raise FGammaPiqdAdapterError(
                "PIQD attempt journal validation failed"
            ) from exc

        artifact_fd = _open_child_directory(attempt_fd, "attempt.jsonl.artifacts")
        artifacts = _validate_artifact_inventory(artifact_fd, inventory["artifacts"])
        terminal = records[-1]
        _exact_scalar(terminal.get("outcome"), STRUCTURAL_SAT, "terminal outcome")
        terminal_artifacts = terminal.get("artifacts")
        if type(terminal_artifacts) is not dict:
            raise FGammaPiqdAdapterError("PIQD terminal record lacks artifacts")
        for field in (
            "cnf_sha256",
            "model_sha256",
            "solver_log_sha256",
            "checkpoint_sha256",
        ):
            _digest(terminal_artifacts.get(field), f"terminal {field}")
        _exact_scalar(
            terminal_artifacts["cnf_sha256"], bundle.cnf_sha256, "terminal CNF"
        )
        _exact_scalar(
            terminal_artifacts["model_sha256"],
            receipt["model_response_sha256"],
            "terminal model",
        )
        required_artifacts = {
            terminal_artifacts["cnf_sha256"],
            terminal_artifacts["model_sha256"],
            terminal_artifacts["solver_log_sha256"],
            terminal_artifacts["checkpoint_sha256"],
            receipt["terminal_status_raw_artifact_sha256"],
        }
        if not required_artifacts <= set(artifacts):
            raise FGammaPiqdAdapterError("PIQD terminal artifact custody is incomplete")
        if artifacts[bundle.cnf_sha256] != bundle.cnf_bytes:
            raise FGammaPiqdAdapterError("PIQD terminal CNF artifact is crossed")
        model_assignment = _assignment_from_model(
            artifacts[receipt["model_response_sha256"]],
            job_id=job["job_id"],
            num_variables=bundle.num_variables,
        )
        if model_assignment != observed_assignment:
            raise FGammaPiqdAdapterError(
                "PIQD model artifact crossed runner assignment"
            )
        status_raw = artifacts[receipt["terminal_status_raw_artifact_sha256"]]
        if (
            len(status_raw) != receipt["terminal_status_raw_size"]
            or sha256_bytes(status_raw) != receipt["terminal_status_raw_sha256"]
            or receipt["terminal_status_raw_artifact_sha256"]
            != receipt["terminal_status_raw_sha256"]
        ):
            raise FGammaPiqdAdapterError("PIQD terminal status raw custody is crossed")
        status_payload = _strict_json_object(
            status_raw,
            "PIQD terminal raw status",
            maximum_bytes=_MAX_ARTIFACT_BYTES,
            require_canonical=False,
        )
        if status_payload != receipt["terminal_status"]:
            raise FGammaPiqdAdapterError("PIQD terminal raw status crossed receipt")
        if (
            sha256_bytes(canonical_json_bytes(status_payload))
            != receipt["terminal_status_canonical_sha256"]
        ):
            raise FGammaPiqdAdapterError(
                "PIQD terminal canonical status hash is crossed"
            )
        event = _strict_json_object(
            artifacts[terminal_artifacts["checkpoint_sha256"]],
            "PIQD terminal event",
            maximum_bytes=_MAX_ARTIFACT_BYTES,
        )
        event = _exact_keys(
            event,
            {
                "schema",
                "phase",
                "disposition",
                "retry_index",
                "poll_index",
                "job_id",
                "status",
                "result",
                "detail",
                "response",
            },
            "PIQD terminal event",
        )
        event_expected = {
            "schema": EVENT_SCHEMA,
            "phase": "MODEL",
            "disposition": "SUCCESS",
            "job_id": job["job_id"],
            "status": "completed",
            "result": "SAT",
            "poll_index": None,
            "detail": (
                "complete assignment independently satisfies submitted CNF; "
                "solver log archived"
            ),
        }
        for field, expected in event_expected.items():
            _exact_scalar(event.get(field), expected, f"terminal event {field}")
        if type(event["retry_index"]) is not int or event["retry_index"] < 0:
            raise FGammaPiqdAdapterError("PIQD terminal event retry index is malformed")
        response = event.get("response")
        response = _exact_keys(
            response, {"num_assigned"}, "PIQD terminal event response"
        )
        _exact_scalar(
            response.get("num_assigned"),
            bundle.num_variables,
            "terminal event num_assigned",
        )
        control_files = {
            "solver-receipt.json": (receipt_bytes, _MAX_RECEIPT_BYTES),
            "custody-seal.json": (custody_raw, _MAX_RECEIPT_BYTES),
            "attempt.jsonl": (journal_raw, _MAX_JOURNAL_BYTES),
            "attempt.jsonl.seal.json": (driver_seal_raw, _MAX_RECEIPT_BYTES),
            "attempt.jsonl.lock": (b"", 1),
        }
        for name, (expected, maximum) in control_files.items():
            if _capture_file_at(attempt_fd, name, maximum_bytes=maximum) != expected:
                raise FGammaPiqdAdapterError(
                    f"PIQD custody changed during validation: {name}"
                )
        if set(os.listdir(artifact_fd)) != set(artifacts):
            raise FGammaPiqdAdapterError(
                "PIQD artifact inventory changed during validation"
            )
        for digest, expected in artifacts.items():
            if (
                _capture_file_at(artifact_fd, digest, maximum_bytes=_MAX_ARTIFACT_BYTES)
                != expected
            ):
                raise FGammaPiqdAdapterError("PIQD artifact changed during validation")
        _require_held_directory(attempt_fd, "attempt.jsonl.artifacts", artifact_fd)
        _require_held_directory(root_fd, attempt_name, attempt_fd)
        current_root_fd = _open_directory(absolute_root, create=False)
        try:
            current = os.fstat(current_root_fd)
            held = os.fstat(root_fd)
            if (current.st_dev, current.st_ino) != (held.st_dev, held.st_ino):
                raise FGammaPiqdAdapterError(
                    "configured PIQD attempt root was substituted"
                )
        finally:
            os.close(current_root_fd)
    finally:
        if artifact_fd >= 0:
            os.close(artifact_fd)
        if attempt_fd >= 0:
            os.close(attempt_fd)
        os.close(root_fd)


def _decode_canonical_map(
    instance: FGammaInstance,
    variable_map_bytes: bytes,
    assignment: Mapping[int, bool],
) -> dict[str, list[str]]:
    variable_map = _strict_json_object(variable_map_bytes, "canonical variable map")
    if variable_map != _variable_map(instance):
        raise FGammaPiqdAdapterError("variable map does not match this F-Gamma encoder")
    decoded = {instance.first_row.row_id: [], instance.cap_source_row.row_id: []}
    for entry in variable_map["allocation"]:
        if (
            entry["kind"] == "selected-support-membership"
            and assignment[entry["variable"]]
        ):
            decoded[entry["row_id"]].append(entry["point"])
    return decoded


def _validate_runner_result(value: object) -> StaticSolverResult:
    if type(value) is not StaticSolverResult:
        raise FGammaPiqdAdapterError(
            "PIQD runner returned a non-exact StaticSolverResult"
        )
    if type(value.verdict) is not str or value.verdict not in {
        "SAT",
        "UNSAT",
        "UNKNOWN",
    }:
        raise FGammaPiqdAdapterError("PIQD runner verdict is malformed")
    if type(value.assignment) is not dict:
        raise FGammaPiqdAdapterError("PIQD runner assignment container is malformed")
    if type(value.returncode) is not int:
        raise FGammaPiqdAdapterError("PIQD runner return code is malformed")
    if type(value.stdout) is not str or type(value.stderr) is not str:
        raise FGammaPiqdAdapterError("PIQD runner diagnostics are malformed")
    return value


class FGammaPiqdBaseDiscovery:
    """Callable injected into ``encoding.run_smoke(base_discovery=...)``."""

    def __init__(
        self,
        *,
        runner: Callable[[Path, int, Path | None], StaticSolverResult],
        bundle: FGammaPiqdInputBundle,
        attempt_root: Path,
    ) -> None:
        self.runner = runner
        self.bundle = bundle
        self.attempt_root = Path(os.path.abspath(os.fspath(attempt_root)))

    def __call__(
        self, instance: FGammaInstance, cnf_path: Path, timeout_seconds: int
    ) -> CadicalResult:
        if type(instance) is not FGammaInstance:
            raise FGammaPiqdAdapterError(
                "PIQD adapter requires an exact FGammaInstance"
            )
        if type(timeout_seconds) is not int or timeout_seconds <= 0:
            raise FGammaPiqdAdapterError("PIQD timeout must be a positive builtin int")
        _verify_bundle(self.bundle)
        cnf = instance.dimacs().encode("ascii")
        if cnf != self.bundle.cnf_bytes:
            raise FGammaPiqdAdapterError("current F-Gamma base CNF crossed custody")
        _install_exact_query(cnf_path, cnf)
        try:
            runner_result = self.runner(cnf_path, timeout_seconds, None)
        except FGammaPiqdAdapterError:
            raise
        except Exception as exc:
            raise FGammaPiqdAdapterError(
                "PIQD runner raised an unexpected exception"
            ) from exc
        observed = _validate_runner_result(runner_result)
        _verify_bundle(self.bundle)
        if observed.verdict != "SAT":
            detail = observed.stderr[-1000:]
            raise FGammaPiqdAdapterError(
                f"PIQD F-Gamma base discovery failed closed with {observed.verdict}: "
                f"{detail}"
            )
        if observed.returncode != 10:
            raise FGammaPiqdAdapterError("PIQD SAT result has a malformed boundary")
        assignment = observed.assignment
        if (
            any(type(variable) is not int for variable in assignment)
            or set(assignment) != set(range(1, instance.cnf.n_variables + 1))
            or any(type(value) is not bool for value in assignment.values())
        ):
            raise FGammaPiqdAdapterError("PIQD SAT assignment is not exact and total")
        receipt, receipt_bytes = _strict_receipt(observed.stdout)
        _validate_attempt_custody(
            receipt=receipt,
            receipt_bytes=receipt_bytes,
            bundle=self.bundle,
            attempt_root=self.attempt_root,
            observed_assignment=assignment,
        )
        positive = frozenset(
            variable for variable, value in assignment.items() if value
        )
        if not instance.validates_total_assignment(positive):
            raise FGammaPiqdAdapterError("PIQD SAT model fails FGammaInstance replay")
        decoded = _decode_canonical_map(
            instance, self.bundle.variable_map_bytes, assignment
        )
        if decoded != instance.decode_model(positive):
            raise FGammaPiqdAdapterError("canonical map decode crossed encoder decode")
        return CadicalResult(
            verdict="SAT",
            cube=decoded,  # type: ignore[arg-type]
            returncode=10,
            proof_verified=False,
            stdout_tail=observed.stdout[-1000:],
            positive_variables=positive,
        )


def make_f_gamma_piqd_base_discovery(
    *,
    base_url: str,
    journal_root: Path,
    transport: Transport | None = None,
    sleep: Callable[[float], None] = time.sleep,
) -> FGammaPiqdBaseDiscovery:
    """Build one additive, base-only static PIQD discovery boundary."""

    bundle = _build_bundle(journal_root / "input-custody")
    runner = make_static_piqd_solver_runner(
        base_url=base_url,
        journal_root=journal_root / "attempts",
        source_manifest=bundle.source_manifest_bytes,
        producer_manifest=bundle.producer_manifest_bytes,
        transport=transport,
        policy=DriverPolicy(project=PIQD_PROJECT, requested_core_limit=1),
        sleep=sleep,
    )
    return FGammaPiqdBaseDiscovery(
        runner=runner,
        bundle=bundle,
        attempt_root=journal_root / "attempts",
    )


__all__ = [
    "ADAPTER_SCHEMA",
    "BUNDLE_SEAL_SCHEMA",
    "EVIDENCE_CLASSIFICATION",
    "PIQD_PROJECT",
    "VARIABLE_MAP_SCHEMA",
    "FGammaPiqdAdapterError",
    "FGammaPiqdBaseDiscovery",
    "FGammaPiqdInputBundle",
    "make_f_gamma_piqd_base_discovery",
]
