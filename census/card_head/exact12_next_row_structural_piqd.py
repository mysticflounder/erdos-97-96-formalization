"""PIQD discovery boundary for exact12 next-row structural CEGAR.

PIQD is observational only.  SAT models are replayed against the exact current
CNF; PIQD UNSAT returns to the structural coordinator, whose unchanged local
CaDiCaL/DRAT rerun remains the only terminal proof gate.
"""

from __future__ import annotations

import argparse
import json
import os
import stat
import time
from collections.abc import Callable, Mapping, Sequence
from pathlib import Path
from typing import Any
from urllib.parse import urlsplit

from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
)
from census.p97_search.phase3_piqd_driver import SEAL_SCHEMA, DriverPolicy
from census.p97_search.phase3_piqd_oracle import (
    Transport,
    raw_dimacs_identity,
    scan_dimacs,
)
from census.p97_search.phase3_piqd_static_solver_runner import (
    CERTIFICATE_BLOCKER,
    CUSTODY_SEAL_SCHEMA,
    PRODUCER_SCHEMA,
    RECEIPT_SCHEMA,
    SOURCE_SCHEMA,
    StaticPiqdRunnerError,
    StaticSolverResult,
    authenticate_static_manifests,
    make_static_piqd_solver_runner,
)

from .exact12_next_row_cell_run import JOB_SCHEMA, cnf_assignment_satisfies
from .exact12_next_row_structural_cegar import (
    DETECTOR_CONTRACT,
    DETECTOR_PATHS,
    SEQUENTIAL_MODE,
    StructuralDiscoveryRequest,
    run_structural_cegar,
)
from .sat_encoding import CadicalResult, solve_cadical

DESCRIPTOR_SCHEMA = "p97-exact12-next-row-structural-piqd-descriptor/v1"
PIQD_PROJECT = "p97-exact12-next-row-structural"
DEFAULT_PIQD_BASE_URL = "http://127.0.0.1:7272"
MAX_CNF_BYTES = 256 * 1024 * 1024
MAX_JSON_BYTES = 4 * 1024 * 1024
MAX_RECEIPT_BYTES = 1024 * 1024
MAX_JSON_DEPTH = 32
MAX_JSON_NODES = 100_000
_ATTEMPT_JOURNAL_NAME = "attempt.jsonl"
_ATTEMPT_LOCK_NAME = "attempt.jsonl.lock"
_ATTEMPT_ARTIFACT_DIRECTORY_NAME = "attempt.jsonl.artifacts"
_ATTEMPT_DRIVER_SEAL_NAME = "attempt.jsonl.seal.json"
_ATTEMPT_RECEIPT_NAME = "solver-receipt.json"
_ATTEMPT_CUSTODY_SEAL_NAME = "custody-seal.json"
_CUSTODY_RETRY_POLICY = "REMOVE_UNSEALED_RESERVED_ATTEMPT"
_FALSE_CLAIMS = {
    "source_entitlement": False,
    "theorem_coverage": False,
    "universal_lift": False,
    "lean_closure": False,
}
_RECEIPT_FALSE_CLAIMS = {**_FALSE_CLAIMS, "one_process": False, "one_core": False}
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
_JOB_IDENTITY_KEYS = {
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
}
_HEX = frozenset("0123456789abcdef")
_BUILTIN_PATH_TYPE = type(Path())
_DIRECTORY_FLAGS = (
    os.O_RDONLY
    | os.O_DIRECTORY
    | getattr(os, "O_CLOEXEC", 0)
    | getattr(os, "O_NOFOLLOW", 0)
)


class Exact12NextRowStructuralPiqdError(ValueError):
    """A structural descriptor, PIQD receipt, or exact-CNF replay failed."""


def _builtin_path(value: object, name: str) -> Path:
    if type(value) is not _BUILTIN_PATH_TYPE:
        raise Exact12NextRowStructuralPiqdError(f"{name} must be a builtin Path")
    return value


def _inode_anchor(info: os.stat_result) -> tuple[int, int, int]:
    return info.st_dev, info.st_ino, stat.S_IFMT(info.st_mode)


def _file_identity(info: os.stat_result) -> tuple[int, ...]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _absolute(path: Path) -> Path:
    return Path(os.path.abspath(os.fspath(path)))


def _open_directory_path(
    path: Path,
    *,
    create: bool,
    private_leaf: bool,
    name: str,
) -> tuple[int, Path, tuple[int, int, int]]:
    """Open one directory chain without following a component symlink."""

    absolute = _absolute(_builtin_path(path, name))
    descriptor = os.open("/", _DIRECTORY_FLAGS)
    try:
        for component in absolute.parts[1:]:
            if component in {"", ".", ".."}:
                raise Exact12NextRowStructuralPiqdError(
                    f"{name} contains an unsafe component"
                )
            try:
                child = os.open(component, _DIRECTORY_FLAGS, dir_fd=descriptor)
            except FileNotFoundError:
                if not create:
                    raise
                os.mkdir(component, 0o700, dir_fd=descriptor)
                os.fsync(descriptor)
                created = os.stat(component, dir_fd=descriptor, follow_symlinks=False)
                child = os.open(component, _DIRECTORY_FLAGS, dir_fd=descriptor)
                os.fchmod(child, 0o700)
                if _inode_anchor(created) != _inode_anchor(os.fstat(child)):
                    os.close(child)
                    raise Exact12NextRowStructuralPiqdError(
                        f"{name} was rebound during create-once reservation"
                    )
            os.close(descriptor)
            descriptor = child
        metadata = os.fstat(descriptor)
        if not stat.S_ISDIR(metadata.st_mode):
            raise Exact12NextRowStructuralPiqdError(f"{name} is not a directory")
        if private_leaf and stat.S_IMODE(metadata.st_mode) != 0o700:
            raise Exact12NextRowStructuralPiqdError(f"{name} must have exact mode 0700")
        return descriptor, absolute, _inode_anchor(metadata)
    except Exact12NextRowStructuralPiqdError:
        os.close(descriptor)
        raise
    except OSError as exc:
        os.close(descriptor)
        raise Exact12NextRowStructuralPiqdError(
            f"{name} is missing, unsafe, or contains a symlink"
        ) from exc


def _require_directory_path(
    path: Path, anchor: tuple[int, int, int], *, private_leaf: bool, name: str
) -> None:
    descriptor, _absolute_path, observed = _open_directory_path(
        path, create=False, private_leaf=private_leaf, name=name
    )
    try:
        if observed != anchor:
            raise Exact12NextRowStructuralPiqdError(f"{name} pathname was rebound")
    finally:
        os.close(descriptor)


def _open_child_directory(
    parent_fd: int, name: str, *, create: bool, private: bool
) -> tuple[int, tuple[int, int, int]]:
    if not name or Path(name).name != name or name in {".", ".."}:
        raise Exact12NextRowStructuralPiqdError("unsafe custody directory name")
    try:
        descriptor = os.open(name, _DIRECTORY_FLAGS, dir_fd=parent_fd)
    except FileNotFoundError:
        if not create:
            raise Exact12NextRowStructuralPiqdError(
                f"custody directory is missing: {name}"
            ) from None
        try:
            os.mkdir(name, 0o700, dir_fd=parent_fd)
            os.fsync(parent_fd)
        except OSError as exc:
            raise Exact12NextRowStructuralPiqdError(
                f"cannot reserve custody directory: {name}"
            ) from exc
        created = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
        try:
            descriptor = os.open(name, _DIRECTORY_FLAGS, dir_fd=parent_fd)
        except OSError as exc:
            raise Exact12NextRowStructuralPiqdError(
                f"cannot hold custody directory: {name}"
            ) from exc
        os.fchmod(descriptor, 0o700)
        if _inode_anchor(created) != _inode_anchor(os.fstat(descriptor)):
            os.close(descriptor)
            raise Exact12NextRowStructuralPiqdError(
                f"custody directory was rebound during reservation: {name}"
            )
    except OSError as exc:
        raise Exact12NextRowStructuralPiqdError(
            f"custody directory is unsafe: {name}"
        ) from exc
    metadata = os.fstat(descriptor)
    if not stat.S_ISDIR(metadata.st_mode) or (
        private and stat.S_IMODE(metadata.st_mode) != 0o700
    ):
        os.close(descriptor)
        raise Exact12NextRowStructuralPiqdError(
            f"custody directory must be a private directory: {name}"
        )
    return descriptor, _inode_anchor(metadata)


def _digest(value: object, name: str) -> str:
    if type(value) is not str or len(value) != 64 or any(c not in _HEX for c in value):
        raise Exact12NextRowStructuralPiqdError(f"{name} is not a sha256 digest")
    return value


def _same_builtin(value: object, expected: object, name: str) -> None:
    if type(value) is not type(expected) or value != expected:
        raise Exact12NextRowStructuralPiqdError(f"{name} is cross-bound")


def _optional_digest(value: object, name: str) -> str | None:
    if value is None:
        return None
    return _digest(value, name)


def _builtin_string(value: object, name: str, *, allow_empty: bool = False) -> str:
    if type(value) is not str or (not allow_empty and not value):
        raise Exact12NextRowStructuralPiqdError(f"{name} must be a builtin string")
    return value


def _reject_constant(value: str) -> None:
    raise ValueError(f"non-standard JSON constant: {value}")


def _reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, item in pairs:
        if key in value:
            raise ValueError(f"duplicate JSON key: {key}")
        value[key] = item
    return value


def _validate_json_tree(value: object) -> None:
    remaining = MAX_JSON_NODES
    stack: list[tuple[object, int]] = [(value, 0)]
    while stack:
        item, depth = stack.pop()
        remaining -= 1
        if remaining < 0 or depth > MAX_JSON_DEPTH:
            raise Exact12NextRowStructuralPiqdError(
                "JSON value exceeds its structural bound"
            )
        if type(item) is dict:
            for key, child in item.items():
                if type(key) is not str:
                    raise Exact12NextRowStructuralPiqdError(
                        "JSON object contains a non-builtin key"
                    )
                stack.append((child, depth + 1))
        elif type(item) is list:
            stack.extend((child, depth + 1) for child in item)
        elif item is not None and type(item) not in {str, int, float, bool}:
            raise Exact12NextRowStructuralPiqdError(
                "JSON value contains a non-builtin scalar or container"
            )


def _strict_json(raw: bytes, *, name: str) -> dict[str, Any]:
    if type(raw) is not bytes or not raw or len(raw) > MAX_JSON_BYTES:
        raise Exact12NextRowStructuralPiqdError(f"{name} has an invalid byte size")
    try:
        value = json.loads(
            raw,
            parse_constant=_reject_constant,
            object_pairs_hook=_reject_duplicates,
        )
    except (UnicodeDecodeError, ValueError) as exc:
        raise Exact12NextRowStructuralPiqdError(f"{name} is not strict JSON") from exc
    if type(value) is not dict:
        raise Exact12NextRowStructuralPiqdError(f"{name} must be a JSON object")
    _validate_json_tree(value)
    return value


def _capture_descriptor(
    descriptor: int, *, path: Path | str, maximum_bytes: int
) -> tuple[bytes, os.stat_result]:
    before = os.fstat(descriptor)
    if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
        raise Exact12NextRowStructuralPiqdError(
            f"file is not singly linked and regular: {path}"
        )
    chunks: list[bytes] = []
    size = 0
    while chunk := os.read(descriptor, min(1 << 20, maximum_bytes + 1 - size)):
        size += len(chunk)
        if size > maximum_bytes:
            raise Exact12NextRowStructuralPiqdError(f"file exceeds bound: {path}")
        chunks.append(chunk)
    after = os.fstat(descriptor)
    if _file_identity(before) != _file_identity(after) or size != before.st_size:
        raise Exact12NextRowStructuralPiqdError(f"file changed during capture: {path}")
    return b"".join(chunks), before


def _capture_regular_identity(
    path: Path, *, maximum_bytes: int
) -> tuple[bytes, os.stat_result]:
    path = _builtin_path(path, "custody file path")
    absolute = _absolute(path)
    parent_fd, parent_path, parent_anchor = _open_directory_path(
        absolute.parent,
        create=False,
        private_leaf=False,
        name="custody file parent",
    )
    try:
        payload, metadata = _capture_regular_at(
            parent_fd, absolute.name, maximum_bytes=maximum_bytes
        )
        named = os.stat(absolute.name, dir_fd=parent_fd, follow_symlinks=False)
        if _file_identity(named) != _file_identity(metadata):
            raise Exact12NextRowStructuralPiqdError(
                f"file pathname was substituted: {absolute}"
            )
        _require_directory_path(
            parent_path,
            parent_anchor,
            private_leaf=False,
            name="custody file parent",
        )
        return payload, metadata
    except OSError as exc:
        raise Exact12NextRowStructuralPiqdError(
            f"unsafe or missing file: {absolute}"
        ) from exc
    finally:
        os.close(parent_fd)


def _capture_regular(path: Path, *, maximum_bytes: int) -> bytes:
    return _capture_regular_identity(path, maximum_bytes=maximum_bytes)[0]


def _capture_regular_at(
    directory_fd: int, name: str, *, maximum_bytes: int
) -> tuple[bytes, os.stat_result]:
    if name in {"", ".", ".."} or Path(name).name != name:
        raise Exact12NextRowStructuralPiqdError("unsafe attempt-custody filename")
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    try:
        descriptor = os.open(name, flags, dir_fd=directory_fd)
    except OSError as exc:
        raise Exact12NextRowStructuralPiqdError(
            f"unsafe or missing attempt-custody file: {name}"
        ) from exc
    try:
        payload, metadata = _capture_descriptor(
            descriptor, path=name, maximum_bytes=maximum_bytes
        )
        named = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        if _file_identity(named) != _file_identity(metadata):
            raise Exact12NextRowStructuralPiqdError(
                f"attempt-custody file was substituted: {name}"
            )
        return payload, metadata
    finally:
        os.close(descriptor)


def _capture_repo_source(
    repo_root: Path, relative: str, *, maximum_bytes: int
) -> bytes:
    root_fd, root_path, root_anchor = _open_directory_path(
        _builtin_path(repo_root, "repository root"),
        create=False,
        private_leaf=False,
        name="repository root",
    )
    cursor_fd = root_fd
    cursor_anchor = root_anchor
    owned_cursor = False
    try:
        parts = Path(relative).parts
        if not parts:
            raise Exact12NextRowStructuralPiqdError(
                f"repository source path is unsafe: {relative}"
            )
        for part in parts[:-1]:
            child_fd, child_anchor = _open_child_directory(
                cursor_fd, part, create=False, private=False
            )
            if owned_cursor:
                os.close(cursor_fd)
            cursor_fd = child_fd
            cursor_anchor = child_anchor
            owned_cursor = True
        payload, _metadata = _capture_regular_at(
            cursor_fd, parts[-1], maximum_bytes=maximum_bytes
        )
        source_parent = root_path.joinpath(*parts[:-1])
        _require_directory_path(
            source_parent,
            cursor_anchor,
            private_leaf=False,
            name="repository source parent",
        )
        _require_directory_path(
            root_path,
            root_anchor,
            private_leaf=False,
            name="repository root",
        )
        return payload
    except (OSError, Exact12NextRowStructuralPiqdError) as exc:
        raise Exact12NextRowStructuralPiqdError(
            f"repository source path is unsafe or missing: {relative}"
        ) from exc
    finally:
        if owned_cursor:
            os.close(cursor_fd)
        os.close(root_fd)


def _verify_sources(
    repo_root: Path, sources: object, *, name: str
) -> list[dict[str, Any]]:
    if type(sources) is not list or not sources:
        raise Exact12NextRowStructuralPiqdError(f"{name} sources are malformed")
    normalized: list[dict[str, Any]] = []
    seen_paths: set[str] = set()
    for item in sources:
        if type(item) is not dict or set(item) != {"path", "bytes", "sha256"}:
            raise Exact12NextRowStructuralPiqdError(
                f"{name} source schema is malformed"
            )
        relative = item["path"]
        if (
            type(relative) is not str
            or not relative
            or Path(relative).is_absolute()
            or ".." in Path(relative).parts
            or relative in seen_paths
        ):
            raise Exact12NextRowStructuralPiqdError(f"{name} source path is unsafe")
        seen_paths.add(relative)
        size = item["bytes"]
        digest = _digest(item["sha256"], f"{name} source sha256")
        if type(size) is not int or size < 0:
            raise Exact12NextRowStructuralPiqdError(f"{name} source size is malformed")
        payload = _capture_repo_source(repo_root, relative, maximum_bytes=max(size, 1))
        if len(payload) != size or sha256_bytes(payload) != digest:
            raise Exact12NextRowStructuralPiqdError(f"{name} source identity changed")
        normalized.append(dict(item))
    return normalized


def _detector_sources(repo_root: Path) -> list[dict[str, Any]]:
    sources: list[dict[str, Any]] = []
    for relative in DETECTOR_PATHS:
        payload = _capture_repo_source(
            repo_root, relative, maximum_bytes=MAX_JSON_BYTES
        )
        sources.append(
            {"path": relative, "bytes": len(payload), "sha256": sha256_bytes(payload)}
        )
    return sources


def _validate_descriptor_object(
    descriptor: Mapping[str, Any], *, repo_root: Path, current_dimacs: bytes
) -> None:
    expected_keys = {
        "schema",
        "root_job",
        "root_job_sha256",
        "cell_index",
        "iteration",
        "local_iteration",
        "parent_record_sha256",
        "current_cnf",
        "detector",
        "sources_sha256",
        "query_polarity",
        "certificate_blocker",
        "claims",
    }
    if (
        set(descriptor) != expected_keys
        or descriptor.get("schema") != DESCRIPTOR_SCHEMA
    ):
        raise Exact12NextRowStructuralPiqdError(
            "structural descriptor schema is crossed"
        )
    job = descriptor["root_job"]
    if type(job) is not dict or job.get("schema") != JOB_SCHEMA:
        raise Exact12NextRowStructuralPiqdError("root structural job schema is crossed")
    job_id = _digest(job.get("job_id"), "root job_id")
    unsigned_job = dict(job)
    del unsigned_job["job_id"]
    if sha256_json(unsigned_job) != job_id:
        raise Exact12NextRowStructuralPiqdError("root job_id is not canonical")
    if descriptor["root_job_sha256"] != sha256_json(job):
        raise Exact12NextRowStructuralPiqdError("root job snapshot is cross-bound")
    if any(
        type(descriptor[key]) is not int or descriptor[key] < 0
        for key in ("cell_index", "iteration", "local_iteration")
    ):
        raise Exact12NextRowStructuralPiqdError(
            "structural descriptor indices are malformed"
        )
    _digest(descriptor["parent_record_sha256"], "parent journal sha256")
    root_cnf = job.get("cnf")
    if type(root_cnf) is not dict or set(root_cnf) != {
        "bytes",
        "sha256",
        "variables",
        "clauses",
    }:
        raise Exact12NextRowStructuralPiqdError("root CNF identity is malformed")
    _digest(root_cnf["sha256"], "root CNF sha256")
    if (
        type(root_cnf["bytes"]) is not int
        or root_cnf["bytes"] <= 0
        or type(root_cnf["variables"]) is not int
        or type(root_cnf["clauses"]) is not int
        or root_cnf["variables"] <= 0
        or root_cnf["clauses"] <= 0
    ):
        raise Exact12NextRowStructuralPiqdError("root CNF dimensions are malformed")
    sources = _verify_sources(repo_root, job.get("sources"), name="root job")
    if descriptor["sources_sha256"] != sha256_json(sources):
        raise Exact12NextRowStructuralPiqdError("root source manifest is cross-bound")
    detector = descriptor["detector"]
    if type(detector) is not dict or set(detector) != {"contract", "sha256", "sources"}:
        raise Exact12NextRowStructuralPiqdError("detector identity is malformed")
    detector_sources = _verify_sources(repo_root, detector["sources"], name="detector")
    expected_detector_sha = sha256_json(
        {"contract": DETECTOR_CONTRACT, "sources": detector_sources}
    )
    if (
        detector["contract"] != DETECTOR_CONTRACT
        or detector["sha256"] != expected_detector_sha
    ):
        raise Exact12NextRowStructuralPiqdError("detector contract is cross-bound")
    current = descriptor["current_cnf"]
    if type(current) is not dict or set(current) != {
        "sha256",
        "bytes",
        "num_variables",
        "num_clauses",
    }:
        raise Exact12NextRowStructuralPiqdError("current CNF identity is malformed")
    _digest(current["sha256"], "current CNF sha256")
    if (
        type(current["bytes"]) is not int
        or type(current["num_variables"]) is not int
        or type(current["num_clauses"]) is not int
        or current["bytes"] <= 0
        or current["num_variables"] <= 0
        or current["num_clauses"] <= 0
    ):
        raise Exact12NextRowStructuralPiqdError("current CNF dimensions are malformed")
    if (
        current["sha256"] != sha256_bytes(current_dimacs)
        or current["bytes"] != len(current_dimacs)
        or scan_dimacs(current_dimacs)
        != (current["num_variables"], current["num_clauses"])
    ):
        raise Exact12NextRowStructuralPiqdError("current CNF snapshot is cross-bound")
    if (
        root_cnf["variables"] != current["num_variables"]
        or root_cnf["clauses"] > current["num_clauses"]
    ):
        raise Exact12NextRowStructuralPiqdError("root and current CNFs are crossed")
    if descriptor["iteration"] == 0 and descriptor["parent_record_sha256"] != job_id:
        raise Exact12NextRowStructuralPiqdError(
            "iteration zero parent is not the root job"
        )
    if descriptor["iteration"] == 0 and root_cnf != {
        "bytes": current["bytes"],
        "sha256": current["sha256"],
        "variables": current["num_variables"],
        "clauses": current["num_clauses"],
    }:
        raise Exact12NextRowStructuralPiqdError(
            "iteration-zero current CNF differs from the root job"
        )
    if descriptor["query_polarity"] != "SAT_MEANS_COUNTEREXAMPLE":
        raise Exact12NextRowStructuralPiqdError("query polarity is crossed")
    if descriptor["certificate_blocker"] != CERTIFICATE_BLOCKER:
        raise Exact12NextRowStructuralPiqdError("certificate blocker is crossed")
    if descriptor["claims"] != _FALSE_CLAIMS:
        raise Exact12NextRowStructuralPiqdError(
            "descriptor claims are not finite-local"
        )


def build_discovery_descriptor(
    request: StructuralDiscoveryRequest, *, repo_root: Path
) -> dict[str, Any]:
    """Freeze the root job, live sources, journal parent, and current CNF."""

    if type(request) is not StructuralDiscoveryRequest:
        raise Exact12NextRowStructuralPiqdError(
            "PIQD factory requires an exact StructuralDiscoveryRequest"
        )
    if any(
        type(value) is not int or value < lower
        for value, lower in (
            (request.cell_index, 0),
            (request.iteration, 0),
            (request.local_iteration, 0),
            (request.num_variables, 1),
            (request.num_clauses, 1),
        )
    ):
        raise Exact12NextRowStructuralPiqdError(
            "query indices or dimensions are malformed"
        )
    if type(request.current_dimacs) is not bytes:
        raise Exact12NextRowStructuralPiqdError("current CNF must be exact bytes")
    if request.instance.dimacs().encode("ascii") != request.current_dimacs:
        raise Exact12NextRowStructuralPiqdError("current structural instance changed")
    job = dict(request.job)
    detector_sources = _detector_sources(repo_root)
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "root_job": job,
        "root_job_sha256": sha256_json(job),
        "cell_index": request.cell_index,
        "iteration": request.iteration,
        "local_iteration": request.local_iteration,
        "parent_record_sha256": _digest(
            request.parent_record_sha256, "parent journal sha256"
        ),
        "current_cnf": {
            "sha256": _digest(request.current_cnf_sha256, "current CNF sha256"),
            "bytes": len(request.current_dimacs),
            "num_variables": request.num_variables,
            "num_clauses": request.num_clauses,
        },
        "detector": {
            "contract": DETECTOR_CONTRACT,
            "sha256": _digest(
                request.detector_contract_sha256, "detector contract sha256"
            ),
            "sources": detector_sources,
        },
        "sources_sha256": sha256_json(job.get("sources")),
        "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        "certificate_blocker": CERTIFICATE_BLOCKER,
        "claims": dict(_FALSE_CLAIMS),
    }
    _validate_descriptor_object(
        descriptor, repo_root=repo_root, current_dimacs=request.current_dimacs
    )
    return descriptor


def _install_descriptor(
    root: Path, payload: bytes, digest: str
) -> tuple[Path, tuple[int, int, int], tuple[int, ...]]:
    root_fd, absolute_root, root_anchor = _open_directory_path(
        _builtin_path(root, "PIQD journal root"),
        create=True,
        private_leaf=True,
        name="PIQD journal root",
    )
    descriptors_fd: int | None = None
    descriptor: int | None = None
    created_anchor: tuple[int, int, int] | None = None
    filename = f"descriptor-{_digest(digest, 'descriptor sha256')}.json"
    flags = (
        os.O_WRONLY
        | os.O_CREAT
        | os.O_EXCL
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    try:
        descriptors_fd, descriptors_anchor = _open_child_directory(
            root_fd, "descriptors", create=True, private=True
        )
        try:
            descriptor = os.open(filename, flags, 0o600, dir_fd=descriptors_fd)
            created_anchor = _inode_anchor(os.fstat(descriptor))
        except FileExistsError:
            installed, installed_metadata = _capture_regular_at(
                descriptors_fd, filename, maximum_bytes=MAX_JSON_BYTES
            )
            if installed != payload:
                raise Exact12NextRowStructuralPiqdError(
                    "existing PIQD descriptor has crossed bytes"
                )
            if stat.S_IMODE(installed_metadata.st_mode) != 0o600:
                raise Exact12NextRowStructuralPiqdError(
                    "existing PIQD descriptor must have exact mode 0600"
                )
        if descriptor is not None:
            cursor = 0
            while cursor < len(payload):
                written = os.write(descriptor, payload[cursor:])
                if written <= 0:
                    raise Exact12NextRowStructuralPiqdError(
                        "short PIQD descriptor custody write"
                    )
                cursor += written
            os.fchmod(descriptor, 0o600)
            os.fsync(descriptor)
            os.close(descriptor)
            descriptor = None
            installed, installed_metadata = _capture_regular_at(
                descriptors_fd, filename, maximum_bytes=MAX_JSON_BYTES
            )
            if (
                installed != payload
                or created_anchor != _inode_anchor(installed_metadata)
                or stat.S_IMODE(installed_metadata.st_mode) != 0o600
            ):
                raise Exact12NextRowStructuralPiqdError(
                    "installed PIQD descriptor changed"
                )
        os.fsync(descriptors_fd)
        os.fsync(root_fd)
        named_descriptors = os.stat(
            "descriptors", dir_fd=root_fd, follow_symlinks=False
        )
        if _inode_anchor(named_descriptors) != descriptors_anchor:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD descriptor directory was rebound"
            )
        _require_directory_path(
            absolute_root,
            root_anchor,
            private_leaf=True,
            name="PIQD journal root",
        )
        return (
            absolute_root / "descriptors" / filename,
            root_anchor,
            _file_identity(installed_metadata),
        )
    except Exception as exc:
        # Keep a failed create-once publication as a reservation.  There is no
        # pathname unlink here: after any identity check an attacker could
        # replace the name before unlink observes it.
        if isinstance(exc, OSError):
            raise Exact12NextRowStructuralPiqdError(
                "cannot reserve PIQD descriptor custody file"
            ) from exc
        raise
    finally:
        if descriptor is not None:
            os.close(descriptor)
        if descriptors_fd is not None:
            os.close(descriptors_fd)
        os.close(root_fd)


def _persist_current_cnf(
    path: Path, expected: bytes
) -> tuple[Path, tuple[int, int, int], tuple[int, ...]]:
    path = _builtin_path(path, "discovery CNF path")
    if type(expected) is not bytes or not expected or len(expected) > MAX_CNF_BYTES:
        raise Exact12NextRowStructuralPiqdError("discovery CNF bytes are malformed")
    absolute = _absolute(path)
    parent_fd, parent_path, parent_anchor = _open_directory_path(
        absolute.parent,
        create=True,
        private_leaf=True,
        name="discovery CNF staging root",
    )
    create_flags = (
        os.O_WRONLY
        | os.O_CREAT
        | os.O_EXCL
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    existing_flags = os.O_RDWR | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    descriptor: int | None = None
    created_anchor: tuple[int, int, int] | None = None
    try:
        try:
            os.stat(absolute.name, dir_fd=parent_fd, follow_symlinks=False)
        except FileNotFoundError:
            try:
                descriptor = os.open(
                    absolute.name, create_flags, 0o600, dir_fd=parent_fd
                )
            except OSError as exc:
                raise Exact12NextRowStructuralPiqdError(
                    "discovery CNF create-once reservation lost or is unsafe"
                ) from exc
            created_anchor = _inode_anchor(os.fstat(descriptor))
        else:
            _previous, previous_metadata = _capture_regular_at(
                parent_fd, absolute.name, maximum_bytes=MAX_CNF_BYTES
            )
            if stat.S_IMODE(previous_metadata.st_mode) != 0o600:
                raise Exact12NextRowStructuralPiqdError(
                    "existing discovery CNF must have exact mode 0600"
                )
            descriptor = os.open(
                absolute.name, existing_flags, dir_fd=parent_fd
            )
            existing_metadata = os.fstat(descriptor)
            if _file_identity(existing_metadata) != _file_identity(previous_metadata):
                raise Exact12NextRowStructuralPiqdError(
                    "existing discovery CNF was rebound"
                )
        metadata = os.fstat(descriptor)
        if not stat.S_ISREG(metadata.st_mode) or metadata.st_nlink != 1:
            raise Exact12NextRowStructuralPiqdError(
                "discovery CNF is not private, singly linked, and regular"
            )
        if created_anchor is None:
            os.ftruncate(descriptor, 0)
            os.lseek(descriptor, 0, os.SEEK_SET)
        cursor = 0
        while cursor < len(expected):
            written = os.write(descriptor, expected[cursor:])
            if written <= 0:
                raise Exact12NextRowStructuralPiqdError("short discovery CNF write")
            cursor += written
        os.fchmod(descriptor, 0o600)
        os.fsync(descriptor)
        final_identity = _file_identity(os.fstat(descriptor))
        os.close(descriptor)
        descriptor = None
        installed, installed_metadata = _capture_regular_at(
            parent_fd, absolute.name, maximum_bytes=MAX_CNF_BYTES
        )
        if (
            installed != expected
            or _file_identity(installed_metadata) != final_identity
        ):
            raise Exact12NextRowStructuralPiqdError("persisted discovery CNF changed")
        os.fsync(parent_fd)
        _require_directory_path(
            parent_path,
            parent_anchor,
            private_leaf=True,
            name="discovery CNF staging root",
        )
        return parent_path, parent_anchor, final_identity
    finally:
        if descriptor is not None:
            os.close(descriptor)
        os.close(parent_fd)


def _capture_published_descriptor(journal_root: Path, descriptor_path: Path) -> bytes:
    absolute_descriptor = _absolute(
        _builtin_path(descriptor_path, "published descriptor path")
    )
    root_fd, absolute_root, root_anchor = _open_directory_path(
        _builtin_path(journal_root, "PIQD journal root"),
        create=False,
        private_leaf=True,
        name="PIQD journal root",
    )
    descriptors_fd: int | None = None
    try:
        expected_parent = absolute_root / "descriptors"
        if absolute_descriptor.parent != expected_parent:
            raise Exact12NextRowStructuralPiqdError(
                "published descriptor is outside its configured journal root"
            )
        descriptors_fd, descriptors_anchor = _open_child_directory(
            root_fd, "descriptors", create=False, private=True
        )
        payload, metadata = _capture_regular_at(
            descriptors_fd,
            absolute_descriptor.name,
            maximum_bytes=MAX_JSON_BYTES,
        )
        if stat.S_IMODE(metadata.st_mode) != 0o600:
            raise Exact12NextRowStructuralPiqdError(
                "published descriptor must have exact mode 0600"
            )
        expected_name = f"descriptor-{sha256_bytes(payload)}.json"
        if absolute_descriptor.name != expected_name:
            raise Exact12NextRowStructuralPiqdError(
                "published descriptor filename is not content-addressed"
            )
        named_descriptors = os.stat(
            "descriptors", dir_fd=root_fd, follow_symlinks=False
        )
        if _inode_anchor(named_descriptors) != descriptors_anchor:
            raise Exact12NextRowStructuralPiqdError(
                "published descriptor directory was rebound"
            )
        _require_directory_path(
            absolute_root,
            root_anchor,
            private_leaf=True,
            name="PIQD journal root",
        )
        return payload
    finally:
        if descriptors_fd is not None:
            os.close(descriptors_fd)
        os.close(root_fd)


def _manifests(
    descriptor: Mapping[str, Any], descriptor_sha256: str
) -> tuple[bytes, bytes]:
    source = {
        "schema": SOURCE_SCHEMA,
        "source_id": f"{DESCRIPTOR_SCHEMA}:{descriptor_sha256}",
        "source_path": f"descriptors/descriptor-{descriptor_sha256}.json",
        "source_sha256": descriptor_sha256,
        "finite_schema": JOB_SCHEMA,
        "cardinality_scope": (
            "exactly 12 points; one exact next-row structural schedule cell"
        ),
        "source_theorem": "NONE: finite PIQD discovery evidence only",
        "claims": dict(_FALSE_CLAIMS),
    }
    source_bytes = canonical_json_bytes(source)
    producer = {
        "schema": PRODUCER_SCHEMA,
        "producer_id": f"{PIQD_PROJECT}:{descriptor_sha256}",
        "producer_kind": "static-dimacs",
        "source_manifest": source,
        "source_manifest_sha256": sha256_bytes(source_bytes),
        "variable_map_sha256": sha256_json(descriptor["root_job"]["compiler_manifest"]),
        "backend": "cadical",
        "solver_profile": "sat",
        "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        "claims": {**_FALSE_CLAIMS, "one_process": False, "one_core": False},
    }
    producer_bytes = canonical_json_bytes(producer)
    authenticate_static_manifests(
        source_manifest=source_bytes, producer_manifest=producer_bytes
    )
    return source_bytes, producer_bytes


def _validate_static_result(value: object, *, num_variables: int) -> StaticSolverResult:
    if type(value) is not StaticSolverResult:
        raise Exact12NextRowStructuralPiqdError(
            "PIQD runner returned the wrong result type"
        )
    if value.verdict not in {"SAT", "UNSAT", "UNKNOWN"}:
        raise Exact12NextRowStructuralPiqdError("PIQD verdict is malformed")
    if (
        type(value.verdict) is not str
        or type(value.returncode) is not int
        or type(value.assignment) is not dict
        or type(value.stdout) is not str
        or type(value.stderr) is not str
    ):
        raise Exact12NextRowStructuralPiqdError(
            "PIQD runner result contains hostile builtin subclasses"
        )
    if value.verdict == "SAT":
        if (
            value.returncode != 10
            or set(value.assignment) != set(range(1, num_variables + 1))
            or any(type(selected) is not bool for selected in value.assignment.values())
        ):
            raise Exact12NextRowStructuralPiqdError("PIQD SAT assignment is not total")
    elif value.assignment:
        raise Exact12NextRowStructuralPiqdError("non-SAT PIQD result carries a model")
    elif value.verdict == "UNSAT" and value.returncode != 20:
        raise Exact12NextRowStructuralPiqdError("PIQD UNSAT return code is malformed")
    elif value.verdict == "UNKNOWN" and value.returncode != 1:
        raise Exact12NextRowStructuralPiqdError("PIQD UNKNOWN return code is malformed")
    return value


def _validate_receipt(
    raw: bytes,
    *,
    result: StaticSolverResult | None,
    descriptor: Mapping[str, Any],
    source_manifest_sha256: str,
    producer_manifest_sha256: str,
) -> dict[str, Any]:
    if type(raw) is not bytes or len(raw) > MAX_RECEIPT_BYTES:
        raise Exact12NextRowStructuralPiqdError(
            "PIQD solver receipt exceeds its byte bound"
        )
    if not raw.endswith(b"\n"):
        raise Exact12NextRowStructuralPiqdError("PIQD solver receipt lacks a newline")
    receipt = _strict_json(raw[:-1], name="PIQD solver receipt")
    if canonical_json_bytes(receipt) + b"\n" != raw:
        raise Exact12NextRowStructuralPiqdError("PIQD solver receipt is not canonical")
    if set(receipt) != _RECEIPT_KEYS:
        raise Exact12NextRowStructuralPiqdError(
            "PIQD solver receipt key schema is crossed"
        )
    if type(receipt["schema"]) is not str or receipt["schema"] != RECEIPT_SCHEMA:
        raise Exact12NextRowStructuralPiqdError("PIQD solver receipt schema is crossed")
    unsigned = dict(receipt)
    claimed_sha = _digest(unsigned.pop("receipt_sha256"), "receipt_sha256")
    if claimed_sha != sha256_json(unsigned):
        raise Exact12NextRowStructuralPiqdError("PIQD solver receipt hash is invalid")
    current = descriptor["current_cnf"]
    expected = {
        "cnf_sha256": current["sha256"],
        "num_variables": current["num_variables"],
        "num_clauses": current["num_clauses"],
        "source_manifest_sha256": source_manifest_sha256,
        "producer_manifest_sha256": producer_manifest_sha256,
        "certificate_blocker": CERTIFICATE_BLOCKER,
        "legacy_drat_proof_path_written": False,
        "proof_endpoint_called": False,
        "prepare_freshness_claimed": False,
        "custody_retry_policy": _CUSTODY_RETRY_POLICY,
    }
    if result is not None:
        expected.update(
            adapter_verdict=result.verdict, adapter_returncode=result.returncode
        )
    for key, value in expected.items():
        _same_builtin(receipt[key], value, f"PIQD solver receipt {key}")
    if type(receipt["claims"]) is not dict or set(receipt["claims"]) != set(
        _RECEIPT_FALSE_CLAIMS
    ):
        raise Exact12NextRowStructuralPiqdError(
            "PIQD solver receipt claims schema is crossed"
        )
    for claim, value in _RECEIPT_FALSE_CLAIMS.items():
        _same_builtin(receipt["claims"][claim], value, f"receipt claims.{claim}")
    verdict_pair = (receipt["adapter_verdict"], receipt["adapter_returncode"])
    if verdict_pair not in {("SAT", 10), ("UNSAT", 20), ("UNKNOWN", 1)}:
        raise Exact12NextRowStructuralPiqdError(
            "PIQD solver receipt verdict is malformed"
        )
    _builtin_string(receipt["outcome"], "PIQD solver receipt outcome")
    job_identity = receipt["job_identity"]
    if type(job_identity) is not dict or set(job_identity) != _JOB_IDENTITY_KEYS:
        raise Exact12NextRowStructuralPiqdError(
            "PIQD job receipt key schema is crossed"
        )
    expected_identity_hash = raw_dimacs_identity(
        backend="cadical",
        solver_profile="sat",
        cnf_sha256=current["sha256"],
        producer_manifest_sha256=producer_manifest_sha256,
        requested_core_limit=1,
    )
    for key, value in {
        "backend": "cadical",
        "solver_profile": "sat",
        "project": PIQD_PROJECT,
        "cnf_blob_hash": current["sha256"],
        "identity_hash": expected_identity_hash,
        "num_vars": current["num_variables"],
        "num_clauses": current["num_clauses"],
        "requested_core_limit": 1,
    }.items():
        _same_builtin(job_identity[key], value, f"PIQD job identity {key}")
    job_id = _builtin_string(job_identity["job_id"], "PIQD job identity job_id")
    _same_builtin(receipt["job_id"], job_id, "PIQD solver receipt job_id")
    if type(job_identity["existing"]) is not bool:
        raise Exact12NextRowStructuralPiqdError(
            "PIQD job identity existing flag is malformed"
        )
    for key in ("attempt", "journal_record_count"):
        if type(receipt[key]) is not int or receipt[key] < 0:
            raise Exact12NextRowStructuralPiqdError(
                f"PIQD solver receipt {key} is malformed"
            )
    if receipt["journal_record_count"] == 0:
        raise Exact12NextRowStructuralPiqdError(
            "PIQD solver receipt lacks a terminal journal record"
        )
    for key in ("attempt_directory", "journal", "receipt_path", "custody_seal_path"):
        _builtin_string(receipt[key], f"PIQD solver receipt {key}")
    for key in ("terminal_record_sha256", "seal_sha256"):
        _digest(receipt[key], f"PIQD solver receipt {key}")
    for key in (
        "terminal_status_canonical_sha256",
        "terminal_status_raw_sha256",
        "terminal_status_raw_artifact_sha256",
        "model_response_sha256",
    ):
        _optional_digest(receipt[key], f"PIQD solver receipt {key}")
    raw_size = receipt["terminal_status_raw_size"]
    if raw_size is not None and (type(raw_size) is not int or raw_size < 0):
        raise Exact12NextRowStructuralPiqdError(
            "PIQD solver receipt terminal_status_raw_size is malformed"
        )
    raw_attestation = (
        receipt["terminal_status_raw_sha256"],
        raw_size,
        receipt["terminal_status_raw_artifact_sha256"],
    )
    if any(value is None for value in raw_attestation) and any(
        value is not None for value in raw_attestation
    ):
        raise Exact12NextRowStructuralPiqdError(
            "PIQD solver receipt raw status attestation is partial"
        )
    _builtin_string(
        receipt["status_classification"], "PIQD solver receipt status_classification"
    )
    _builtin_string(
        receipt["status_detail"], "PIQD solver receipt status_detail", allow_empty=True
    )
    _builtin_string(
        receipt["terminal_status_identity_scope"],
        "PIQD solver receipt terminal_status_identity_scope",
    )
    terminal_status = receipt["terminal_status"]
    if terminal_status is not None and type(terminal_status) is not dict:
        raise Exact12NextRowStructuralPiqdError(
            "PIQD solver receipt terminal status is malformed"
        )
    exposed = receipt["terminal_status_exposed_identity_fields"]
    if type(exposed) is not list or any(type(field) is not str for field in exposed):
        raise Exact12NextRowStructuralPiqdError(
            "PIQD solver receipt exposed identity fields are malformed"
        )
    if terminal_status is None:
        if (
            receipt["terminal_status_canonical_sha256"] is not None
            or exposed
            or receipt["terminal_status_identity_scope"] != "NO_PARSED_TERMINAL_STATUS"
        ):
            raise Exact12NextRowStructuralPiqdError(
                "PIQD solver receipt absent terminal status is inconsistently attested"
            )
    elif terminal_status.get("id") != job_id or receipt[
        "terminal_status_canonical_sha256"
    ] != sha256_bytes(canonical_json_bytes(terminal_status)):
        raise Exact12NextRowStructuralPiqdError(
            "PIQD job terminal status is cross-bound"
        )
    if (
        receipt["failure_detail"] is not None
        and type(receipt["failure_detail"]) is not str
    ):
        raise Exact12NextRowStructuralPiqdError(
            "PIQD solver receipt failure detail is malformed"
        )
    trace = receipt["endpoint_trace"]
    if type(trace) is not list:
        raise Exact12NextRowStructuralPiqdError(
            "PIQD solver receipt endpoint trace is malformed"
        )
    for entry in trace:
        if type(entry) is not dict or set(entry) != {"method", "target"}:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD solver receipt endpoint entry is malformed"
            )
        _builtin_string(entry["method"], "PIQD endpoint method")
        target = _builtin_string(entry["target"], "PIQD endpoint target")
        try:
            parsed_target = urlsplit(target)
        except ValueError as exc:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD endpoint target is malformed"
            ) from exc
        if (
            parsed_target.scheme
            or parsed_target.netloc
            or parsed_target.fragment
            or not target.startswith("/")
            or target.startswith("//")
            or "%" in target
            or "\\" in target
            or any(ord(char) < 0x20 or ord(char) == 0x7F for char in target)
        ):
            raise Exact12NextRowStructuralPiqdError(
                "PIQD endpoint target is malformed or cross-origin"
            )
        endpoint_path = parsed_target.path
        if (
            not endpoint_path
            or endpoint_path.endswith("/")
            or any(part in {"", ".", ".."} for part in endpoint_path.split("/")[1:])
        ):
            raise Exact12NextRowStructuralPiqdError(
                "PIQD endpoint target has an unsafe path"
            )
        if endpoint_path == f"/jobs/{job_id}/proof":
            raise Exact12NextRowStructuralPiqdError(
                "PIQD solver receipt endpoint trace called the proof endpoint"
            )
        if (
            endpoint_path.startswith("/jobs/")
            and endpoint_path not in {"/jobs/prepare-cnf", "/jobs/confirm"}
            and endpoint_path.split("/", 3)[2] != job_id
        ):
            raise Exact12NextRowStructuralPiqdError(
                "PIQD solver receipt endpoint trace crosses jobs"
            )
    return receipt


class Exact12NextRowStructuralPiqdDiscovery:
    """One descriptor-bound observational PIQD discovery callback."""

    def __init__(
        self,
        *,
        request: StructuralDiscoveryRequest,
        repo_root: Path,
        descriptor: Mapping[str, Any],
        descriptor_path: Path,
        descriptor_bytes: bytes,
        journal_root: Path,
        journal_root_anchor: tuple[int, int, int],
        descriptor_identity: tuple[int, ...],
        source_manifest: bytes,
        producer_manifest: bytes,
        runner: Callable[[Path, int, Path | None], StaticSolverResult],
    ) -> None:
        self.request = request
        self.repo_root = repo_root
        self.descriptor = descriptor
        self.descriptor_path = descriptor_path
        self.descriptor_bytes = descriptor_bytes
        self.journal_root = journal_root
        self.journal_root_anchor = journal_root_anchor
        self.descriptor_identity = descriptor_identity
        self.source_manifest = source_manifest
        self.producer_manifest = producer_manifest
        self.runner = runner
        self.receipt: Mapping[str, Any] | None = None

    def _require_descriptor_custody(self) -> None:
        _require_directory_path(
            self.journal_root,
            self.journal_root_anchor,
            private_leaf=True,
            name="PIQD journal root",
        )
        payload, metadata = _capture_regular_identity(
            self.descriptor_path, maximum_bytes=MAX_JSON_BYTES
        )
        if (
            payload != self.descriptor_bytes
            or _file_identity(metadata) != self.descriptor_identity
        ):
            raise Exact12NextRowStructuralPiqdError("PIQD descriptor custody changed")

    def __call__(
        self,
        instance: object,
        cnf_path: Path,
        *,
        timeout_seconds: int,
        nice: int,
        proof_path: Path | None,
    ) -> CadicalResult:
        if instance is not self.request.instance:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD discovery instance is crossed"
            )
        _builtin_path(cnf_path, "PIQD CNF path")
        if type(timeout_seconds) is not int or timeout_seconds <= 0:
            raise Exact12NextRowStructuralPiqdError("PIQD timeout must be positive")
        if type(nice) is not int or not 1 <= nice <= 19:
            raise Exact12NextRowStructuralPiqdError("PIQD nice value is malformed")
        if proof_path is not None:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD discovery must receive proof_path=None"
            )
        current_descriptor = build_discovery_descriptor(
            self.request, repo_root=self.repo_root
        )
        if canonical_json_bytes(current_descriptor) + b"\n" != self.descriptor_bytes:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD request changed after descriptor publication"
            )
        self._require_descriptor_custody()
        staging_path, staging_anchor, cnf_identity = _persist_current_cnf(
            cnf_path, self.request.current_dimacs
        )
        try:
            raw_result = self.runner(cnf_path, timeout_seconds, None)
        except Exact12NextRowStructuralPiqdError:
            raise
        except Exception as exc:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD discovery failed closed"
            ) from exc
        result = _validate_static_result(
            raw_result, num_variables=self.request.num_variables
        )
        self.receipt = _validate_receipt(
            result.stdout.encode("utf-8"),
            result=result,
            descriptor=self.descriptor,
            source_manifest_sha256=sha256_bytes(self.source_manifest),
            producer_manifest_sha256=sha256_bytes(self.producer_manifest),
        )
        self._require_descriptor_custody()
        _require_directory_path(
            staging_path,
            staging_anchor,
            private_leaf=True,
            name="discovery CNF staging root",
        )
        installed_cnf, installed_cnf_metadata = _capture_regular_identity(
            cnf_path, maximum_bytes=MAX_CNF_BYTES
        )
        if (
            installed_cnf != self.request.current_dimacs
            or _file_identity(installed_cnf_metadata) != cnf_identity
        ):
            raise Exact12NextRowStructuralPiqdError("PIQD discovery CNF changed")
        diagnostic = (result.stdout + "\n" + result.stderr)[-1000:]
        if result.verdict == "UNSAT":
            return CadicalResult("UNSAT", None, 20, False, diagnostic)
        if result.verdict == "UNKNOWN":
            return CadicalResult("UNKNOWN", None, 1, False, diagnostic)
        positive = frozenset(
            variable for variable, selected in result.assignment.items() if selected
        )
        if not cnf_assignment_satisfies(
            self.request.instance.cnf.clauses,
            positive,
            n_variables=self.request.num_variables,
        ):
            raise Exact12NextRowStructuralPiqdError(
                "PIQD SAT model failed independent exact-CNF replay"
            )
        try:
            cube = self.request.instance.decode_model(positive)
        except Exception as exc:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD SAT model failed independent cube decoding"
            ) from exc
        return CadicalResult("SAT", cube, 10, False, diagnostic, positive)


class Exact12NextRowStructuralPiqdDiscoveryFactory:
    """Create a new authenticated static PIQD runner for every current CNF."""

    def __init__(
        self,
        *,
        repo_root: Path,
        base_url: str,
        journal_root: Path,
        transport: Transport | None = None,
        sleep: Callable[[float], None] = time.sleep,
    ) -> None:
        if type(base_url) is not str or not base_url.strip():
            raise Exact12NextRowStructuralPiqdError("a nonempty PIQD URL is required")
        self.repo_root = _absolute(_builtin_path(repo_root, "repository root"))
        self.base_url = base_url
        self.journal_root = _absolute(_builtin_path(journal_root, "PIQD journal root"))
        self.transport = transport
        self.sleep = sleep

    def __call__(
        self, request: StructuralDiscoveryRequest
    ) -> Exact12NextRowStructuralPiqdDiscovery:
        descriptor = build_discovery_descriptor(request, repo_root=self.repo_root)
        descriptor_bytes = canonical_json_bytes(descriptor) + b"\n"
        descriptor_sha256 = sha256_bytes(descriptor_bytes)
        (
            descriptor_path,
            journal_root_anchor,
            descriptor_identity,
        ) = _install_descriptor(self.journal_root, descriptor_bytes, descriptor_sha256)
        source_manifest, producer_manifest = _manifests(descriptor, descriptor_sha256)
        try:
            runner = make_static_piqd_solver_runner(
                base_url=self.base_url,
                journal_root=self.journal_root / "attempts",
                source_manifest=source_manifest,
                producer_manifest=producer_manifest,
                transport=self.transport,
                policy=DriverPolicy(project=PIQD_PROJECT, requested_core_limit=1),
                max_cnf_bytes=MAX_CNF_BYTES,
                sleep=self.sleep,
            )
        except StaticPiqdRunnerError as exc:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD static runner construction failed"
            ) from exc
        return Exact12NextRowStructuralPiqdDiscovery(
            request=request,
            repo_root=self.repo_root,
            descriptor=descriptor,
            descriptor_path=descriptor_path,
            descriptor_bytes=descriptor_bytes,
            journal_root=self.journal_root,
            journal_root_anchor=journal_root_anchor,
            descriptor_identity=descriptor_identity,
            source_manifest=source_manifest,
            producer_manifest=producer_manifest,
            runner=runner,
        )


def run_exact12_next_row_structural_piqd(
    repo_root: Path,
    workdir: Path,
    cell_index: int,
    *,
    piqd_base_url: str,
    piqd_journal_root: Path,
    max_iterations: int = 100,
    timeout_seconds: int = 60,
    nice: int = 10,
    seed_journal: Path | None = None,
    transport: Transport | None = None,
    sleep: Callable[[float], None] = time.sleep,
    workers: int = 1,
    parallel_mode: str = SEQUENTIAL_MODE,
    terminal_solver: Callable[..., CadicalResult] = solve_cadical,
) -> dict[str, Any]:
    """Run structural discovery sequentially through PIQD only."""

    if (
        type(repo_root) is not _BUILTIN_PATH_TYPE
        or type(workdir) is not _BUILTIN_PATH_TYPE
    ):
        raise Exact12NextRowStructuralPiqdError(
            "structural PIQD repository and work roots must be Paths"
        )
    if type(piqd_base_url) is not str or not piqd_base_url.strip():
        raise Exact12NextRowStructuralPiqdError(
            "structural PIQD discovery requires a nonempty URL"
        )
    if type(piqd_journal_root) is not _BUILTIN_PATH_TYPE:
        raise Exact12NextRowStructuralPiqdError(
            "structural PIQD journal root must be a Path"
        )
    if type(workers) is not int or workers != 1:
        raise Exact12NextRowStructuralPiqdError(
            "structural PIQD discovery requires exactly one worker"
        )
    if type(parallel_mode) is not str or parallel_mode != SEQUENTIAL_MODE:
        raise Exact12NextRowStructuralPiqdError(
            "structural PIQD discovery requires sequential scheduling"
        )
    factory = Exact12NextRowStructuralPiqdDiscoveryFactory(
        repo_root=repo_root,
        base_url=piqd_base_url,
        journal_root=piqd_journal_root,
        transport=transport,
        sleep=sleep,
    )
    return run_structural_cegar(
        repo_root,
        workdir,
        cell_index,
        max_iterations=max_iterations,
        timeout_seconds=timeout_seconds,
        nice=nice,
        seed_journal=seed_journal,
        solver=terminal_solver,
        discovery_solver_factory=factory,
    )


def _validate_attempt_custody(
    *,
    receipt: Mapping[str, Any],
    receipt_raw: bytes,
    receipt_path: Path,
    piqd_journal_root: Path,
    current_dimacs: bytes,
    source_manifest: bytes,
    producer_manifest: bytes,
) -> dict[str, Any]:
    """Independently revalidate the public static-runner custody inventory."""

    absolute_receipt = _absolute(_builtin_path(receipt_path, "PIQD receipt path"))
    root_fd, absolute_root, root_anchor = _open_directory_path(
        _builtin_path(piqd_journal_root, "PIQD journal root"),
        create=False,
        private_leaf=True,
        name="PIQD journal root",
    )
    attempts_fd: int | None = None
    attempt_fd: int | None = None
    artifact_fd: int | None = None
    attempt_name = f"attempt-{receipt['attempt']:08d}-{receipt['cnf_sha256'][:16]}"
    attempt_directory = absolute_root / "attempts" / attempt_name
    if absolute_receipt != attempt_directory / _ATTEMPT_RECEIPT_NAME:
        os.close(root_fd)
        raise Exact12NextRowStructuralPiqdError(
            "PIQD receipt is outside its configured journal root"
        )
    expected_paths = {
        "attempt_directory": str(attempt_directory),
        "journal": str(attempt_directory / _ATTEMPT_JOURNAL_NAME),
        "receipt_path": str(absolute_receipt),
        "custody_seal_path": str(attempt_directory / _ATTEMPT_CUSTODY_SEAL_NAME),
    }
    if any(receipt.get(key) != value for key, value in expected_paths.items()):
        os.close(root_fd)
        raise Exact12NextRowStructuralPiqdError(
            "PIQD receipt paths are not bound to the published attempt"
        )

    try:
        attempts_fd, attempts_anchor = _open_child_directory(
            root_fd, "attempts", create=False, private=True
        )
        attempt_fd, attempt_anchor = _open_child_directory(
            attempts_fd, attempt_name, create=False, private=True
        )
        attempt_metadata = os.fstat(attempt_fd)
        expected_entries = {
            _ATTEMPT_JOURNAL_NAME,
            _ATTEMPT_LOCK_NAME,
            _ATTEMPT_ARTIFACT_DIRECTORY_NAME,
            _ATTEMPT_DRIVER_SEAL_NAME,
            _ATTEMPT_RECEIPT_NAME,
            _ATTEMPT_CUSTODY_SEAL_NAME,
        }
        if set(os.listdir(attempt_fd)) != expected_entries:
            raise Exact12NextRowStructuralPiqdError(
                "sealed PIQD attempt contains unexpected entries"
            )
        installed_receipt, receipt_metadata = _capture_regular_at(
            attempt_fd, _ATTEMPT_RECEIPT_NAME, maximum_bytes=MAX_RECEIPT_BYTES
        )
        if stat.S_IMODE(receipt_metadata.st_mode) != 0o600:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD receipt must have exact mode 0600"
            )
        if installed_receipt != receipt_raw:
            raise Exact12NextRowStructuralPiqdError(
                "published PIQD receipt changed during custody validation"
            )
        seal_raw, seal_metadata = _capture_regular_at(
            attempt_fd, _ATTEMPT_CUSTODY_SEAL_NAME, maximum_bytes=MAX_JSON_BYTES
        )
        if stat.S_IMODE(seal_metadata.st_mode) != 0o600:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD custody seal must have exact mode 0600"
            )
        if not seal_raw.endswith(b"\n"):
            raise Exact12NextRowStructuralPiqdError("PIQD custody seal lacks a newline")
        seal = _strict_json(seal_raw[:-1], name="PIQD custody seal")
        if canonical_json_bytes(seal) + b"\n" != seal_raw:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD custody seal is not canonical"
            )
        expected_seal_keys = {
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
        }
        if set(seal) != expected_seal_keys or seal.get("schema") != CUSTODY_SEAL_SCHEMA:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD custody seal schema is crossed"
            )
        unsigned_seal = dict(seal)
        claimed_seal_sha256 = unsigned_seal.pop("custody_seal_sha256")
        if claimed_seal_sha256 != sha256_json(unsigned_seal):
            raise Exact12NextRowStructuralPiqdError("PIQD custody seal hash is invalid")
        expected_seal_values = {
            "attempt_directory_device": attempt_metadata.st_dev,
            "attempt_directory_inode": attempt_metadata.st_ino,
            "receipt_sha256": receipt["receipt_sha256"],
            "receipt_file_sha256": sha256_bytes(receipt_raw),
            "receipt_file_size": len(receipt_raw),
            "receipt_device": receipt_metadata.st_dev,
            "receipt_inode": receipt_metadata.st_ino,
            "retry_policy": _CUSTODY_RETRY_POLICY,
        }
        if any(seal.get(key) != value for key, value in expected_seal_values.items()):
            raise Exact12NextRowStructuralPiqdError(
                "PIQD custody seal is not bound to this attempt and receipt"
            )

        inventory = seal.get("inventory")
        expected_inventory_keys = {
            "journal_sha256",
            "journal_size",
            "journal_device",
            "journal_inode",
            "lock_device",
            "lock_inode",
            "driver_seal_sha256",
            "artifacts",
        }
        if type(inventory) is not dict or set(inventory) != expected_inventory_keys:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD custody inventory schema is crossed"
            )
        journal_raw, journal_metadata = _capture_regular_at(
            attempt_fd, _ATTEMPT_JOURNAL_NAME, maximum_bytes=MAX_CNF_BYTES
        )
        _lock_raw, lock_metadata = _capture_regular_at(
            attempt_fd, _ATTEMPT_LOCK_NAME, maximum_bytes=1
        )
        driver_seal_raw, driver_seal_metadata = _capture_regular_at(
            attempt_fd, _ATTEMPT_DRIVER_SEAL_NAME, maximum_bytes=MAX_JSON_BYTES
        )
        if any(
            stat.S_IMODE(metadata.st_mode) != 0o600
            for metadata in (journal_metadata, lock_metadata, driver_seal_metadata)
        ):
            raise Exact12NextRowStructuralPiqdError(
                "PIQD custody files must have exact mode 0600"
            )
        if not driver_seal_raw.endswith(b"\n"):
            raise Exact12NextRowStructuralPiqdError("PIQD driver seal lacks a newline")
        driver_seal = _strict_json(driver_seal_raw[:-1], name="PIQD driver seal")
        expected_driver_seal_keys = {
            "schema",
            "wave_manifest_sha256",
            "record_count",
            "terminal_attempt_sha256",
            "journal_sha256",
            "seal_sha256",
        }
        unsigned_driver_seal = dict(driver_seal)
        claimed_driver_seal_sha256 = unsigned_driver_seal.pop("seal_sha256", None)
        if (
            set(driver_seal) != expected_driver_seal_keys
            or driver_seal.get("schema") != SEAL_SCHEMA
            or claimed_driver_seal_sha256 != sha256_json(unsigned_driver_seal)
            or driver_seal.get("journal_sha256") != sha256_bytes(journal_raw)
            or driver_seal.get("record_count") != receipt.get("journal_record_count")
            or driver_seal.get("terminal_attempt_sha256")
            != receipt.get("terminal_record_sha256")
            or claimed_driver_seal_sha256 != receipt.get("seal_sha256")
        ):
            raise Exact12NextRowStructuralPiqdError(
                "PIQD driver seal is not bound to the receipt and journal"
            )
        expected_inventory_values = {
            "journal_sha256": sha256_bytes(journal_raw),
            "journal_size": len(journal_raw),
            "journal_device": journal_metadata.st_dev,
            "journal_inode": journal_metadata.st_ino,
            "lock_device": lock_metadata.st_dev,
            "lock_inode": lock_metadata.st_ino,
            "driver_seal_sha256": sha256_bytes(driver_seal_raw),
        }
        if any(
            inventory.get(key) != value
            for key, value in expected_inventory_values.items()
        ):
            raise Exact12NextRowStructuralPiqdError(
                "PIQD journal inventory is not bound to the published files"
            )

        try:
            artifact_fd = os.open(
                _ATTEMPT_ARTIFACT_DIRECTORY_NAME,
                _DIRECTORY_FLAGS,
                dir_fd=attempt_fd,
            )
        except OSError as exc:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD artifact directory is unsafe or missing"
            ) from exc
        artifact_directory_metadata = os.fstat(artifact_fd)
        if stat.S_IMODE(artifact_directory_metadata.st_mode) != 0o700:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD artifact directory must have exact mode 0700"
            )
        artifact_records = inventory["artifacts"]
        if type(artifact_records) is not list:
            raise Exact12NextRowStructuralPiqdError(
                "PIQD artifact inventory is malformed"
            )
        records_by_digest: dict[str, Mapping[str, Any]] = {}
        for record in artifact_records:
            if type(record) is not dict or set(record) != {
                "sha256",
                "size",
                "device",
                "inode",
            }:
                raise Exact12NextRowStructuralPiqdError(
                    "PIQD artifact inventory entry is malformed"
                )
            digest = _digest(record["sha256"], "PIQD artifact sha256")
            if digest in records_by_digest:
                raise Exact12NextRowStructuralPiqdError(
                    "PIQD artifact inventory contains a duplicate"
                )
            records_by_digest[digest] = record
        if set(os.listdir(artifact_fd)) != set(records_by_digest):
            raise Exact12NextRowStructuralPiqdError(
                "PIQD artifact directory and inventory are crossed"
            )
        captured_artifacts: dict[str, bytes] = {}
        captured_artifact_identities: dict[str, tuple[int, ...]] = {}
        for digest, record in records_by_digest.items():
            payload, metadata = _capture_regular_at(
                artifact_fd, digest, maximum_bytes=MAX_CNF_BYTES
            )
            expected_record = {
                "sha256": sha256_bytes(payload),
                "size": len(payload),
                "device": metadata.st_dev,
                "inode": metadata.st_ino,
            }
            if dict(record) != expected_record or digest != expected_record["sha256"]:
                raise Exact12NextRowStructuralPiqdError(
                    "PIQD artifact inventory identity is invalid"
                )
            if stat.S_IMODE(metadata.st_mode) != 0o600:
                raise Exact12NextRowStructuralPiqdError(
                    "PIQD artifact must have exact mode 0600"
                )
            captured_artifacts[digest] = payload
            captured_artifact_identities[digest] = _file_identity(metadata)
        required_artifacts = {
            sha256_bytes(current_dimacs): current_dimacs,
            sha256_bytes(source_manifest): source_manifest,
            sha256_bytes(producer_manifest): producer_manifest,
        }
        if any(
            captured_artifacts.get(digest) != payload
            for digest, payload in required_artifacts.items()
        ):
            raise Exact12NextRowStructuralPiqdError(
                "PIQD custody omits or crosses a required structural artifact"
            )

        final_files = {
            _ATTEMPT_RECEIPT_NAME: (receipt_raw, receipt_metadata),
            _ATTEMPT_CUSTODY_SEAL_NAME: (seal_raw, seal_metadata),
            _ATTEMPT_JOURNAL_NAME: (journal_raw, journal_metadata),
            _ATTEMPT_DRIVER_SEAL_NAME: (driver_seal_raw, driver_seal_metadata),
        }
        for name, (payload, metadata) in final_files.items():
            recaptured, recaptured_metadata = _capture_regular_at(
                attempt_fd,
                name,
                maximum_bytes=(
                    MAX_CNF_BYTES if name == _ATTEMPT_JOURNAL_NAME else MAX_JSON_BYTES
                ),
            )
            if recaptured != payload or _file_identity(
                recaptured_metadata
            ) != _file_identity(metadata):
                raise Exact12NextRowStructuralPiqdError(
                    f"PIQD custody file changed during final recapture: {name}"
                )
        for digest, payload in captured_artifacts.items():
            recaptured, metadata = _capture_regular_at(
                artifact_fd, digest, maximum_bytes=MAX_CNF_BYTES
            )
            if (
                recaptured != payload
                or _file_identity(metadata) != captured_artifact_identities[digest]
            ):
                raise Exact12NextRowStructuralPiqdError(
                    "PIQD artifact changed during final recapture"
                )
        if set(os.listdir(attempt_fd)) != expected_entries or set(
            os.listdir(artifact_fd)
        ) != set(records_by_digest):
            raise Exact12NextRowStructuralPiqdError(
                "PIQD custody directory changed during final recapture"
            )
        named_attempt = os.stat(attempt_name, dir_fd=attempts_fd, follow_symlinks=False)
        named_attempts = os.stat("attempts", dir_fd=root_fd, follow_symlinks=False)
        if (
            _inode_anchor(named_attempt) != attempt_anchor
            or _inode_anchor(named_attempts) != attempts_anchor
        ):
            raise Exact12NextRowStructuralPiqdError("PIQD attempt ancestry was rebound")
        _require_directory_path(
            absolute_root,
            root_anchor,
            private_leaf=True,
            name="PIQD journal root",
        )
        return seal
    finally:
        if artifact_fd is not None:
            os.close(artifact_fd)
        if attempt_fd is not None:
            os.close(attempt_fd)
        if attempts_fd is not None:
            os.close(attempts_fd)
        os.close(root_fd)


def validate_exact12_next_row_structural_piqd_artifacts(
    *,
    repo_root: Path,
    descriptor_path: Path,
    current_cnf_path: Path,
    receipt_path: Path,
    piqd_journal_root: Path,
) -> dict[str, Any]:
    """Offline-authenticate one descriptor/CNF/receipt/custody bundle."""

    descriptor_raw = _capture_published_descriptor(piqd_journal_root, descriptor_path)
    if not descriptor_raw.endswith(b"\n"):
        raise Exact12NextRowStructuralPiqdError("published descriptor lacks a newline")
    descriptor = _strict_json(descriptor_raw[:-1], name="published descriptor")
    if canonical_json_bytes(descriptor) + b"\n" != descriptor_raw:
        raise Exact12NextRowStructuralPiqdError("published descriptor is not canonical")
    current_dimacs = _capture_regular(current_cnf_path, maximum_bytes=MAX_CNF_BYTES)
    _validate_descriptor_object(
        descriptor,
        repo_root=_absolute(_builtin_path(repo_root, "repository root")),
        current_dimacs=current_dimacs,
    )
    descriptor_sha256 = sha256_bytes(descriptor_raw)
    source_manifest, producer_manifest = _manifests(descriptor, descriptor_sha256)
    receipt_raw = _capture_regular(receipt_path, maximum_bytes=MAX_RECEIPT_BYTES)
    receipt = _validate_receipt(
        receipt_raw,
        result=None,
        descriptor=descriptor,
        source_manifest_sha256=sha256_bytes(source_manifest),
        producer_manifest_sha256=sha256_bytes(producer_manifest),
    )
    custody_seal = _validate_attempt_custody(
        receipt=receipt,
        receipt_raw=receipt_raw,
        receipt_path=receipt_path,
        piqd_journal_root=piqd_journal_root,
        current_dimacs=current_dimacs,
        source_manifest=source_manifest,
        producer_manifest=producer_manifest,
    )
    return {
        "schema": "p97-exact12-next-row-structural-piqd-offline-validation/v1",
        "status": "VALIDATED_FINITE_LOCAL_DISCOVERY_ARTIFACTS",
        "descriptor_sha256": descriptor_sha256,
        "current_cnf_sha256": sha256_bytes(current_dimacs),
        "receipt_sha256": receipt["receipt_sha256"],
        "custody_seal_sha256": custody_seal["custody_seal_sha256"],
        "cell_index": descriptor["cell_index"],
        "iteration": descriptor["iteration"],
        "claims": dict(_FALSE_CLAIMS),
    }


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--descriptor", type=Path, required=True)
    parser.add_argument("--current-cnf", type=Path, required=True)
    parser.add_argument("--receipt", type=Path, required=True)
    parser.add_argument("--piqd-journal-root", type=Path, required=True)
    args = parser.parse_args(argv)
    try:
        result = validate_exact12_next_row_structural_piqd_artifacts(
            repo_root=args.repo_root,
            descriptor_path=args.descriptor,
            current_cnf_path=args.current_cnf,
            receipt_path=args.receipt,
            piqd_journal_root=args.piqd_journal_root,
        )
    except (Exact12NextRowStructuralPiqdError, StaticPiqdRunnerError, OSError) as exc:
        print(json.dumps({"status": "PIPELINE_ERROR", "error": str(exc)}))
        return 2
    print(json.dumps(result, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())


__all__ = [
    "DEFAULT_PIQD_BASE_URL",
    "DESCRIPTOR_SCHEMA",
    "PIQD_PROJECT",
    "Exact12NextRowStructuralPiqdDiscovery",
    "Exact12NextRowStructuralPiqdDiscoveryFactory",
    "Exact12NextRowStructuralPiqdError",
    "build_discovery_descriptor",
    "run_exact12_next_row_structural_piqd",
    "validate_exact12_next_row_structural_piqd_artifacts",
]
