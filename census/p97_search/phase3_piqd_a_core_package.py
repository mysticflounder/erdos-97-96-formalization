"""Deterministic source package for the finite A-core ``base+P`` canary.

This producer imports the authenticated source encoder, reconstructs its
build-order CNF, and names the ten post-build DEL3 Sinz variables explicitly.
It never reads or requires the legacy SAT model.  The returned package is an
immutable byte payload for the additive PIQD adapter seam.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
import os
import re
import stat
import uuid
from dataclasses import dataclass
from pathlib import Path
from types import ModuleType
from typing import Any

SCHEMA = "p97-piqd-a-core-source-package/v1"
RETRY_SCHEMA = "p97-piqd-a-core-source-package/v2"
MAP_SCHEMA = "p97-a-core-variable-map/v2"
SOURCE_CONTRACT = "a-core-incidence/base+P-source-v2"
CLAUSE_FAMILY_CONTRACT = "a-core-incidence/base+P-clause-families-v2"
CASE = "base+P"
NUM_VARIABLES = 889
NUM_CLAUSES = 21_101
MAX_CAPTURE_BYTES = 16 * 1024 * 1024
SOURCE_NAMES = ("encoding.py", "run.py", "smoke.py", "RESULTS.md")
CLAUSE_FAMILIES = {"base": 21_074, "DEL2": 5, "C10": 1, "DEL3": 21}
_LOWER_SHA256 = re.compile(r"^[0-9a-f]{64}$")


class ACoreSourcePackageError(ValueError):
    """A source encoder package failed closed."""


def _canonical(value: Any) -> bytes:
    return json.dumps(
        value,
        sort_keys=True,
        separators=(",", ":"),
        ensure_ascii=False,
        allow_nan=False,
    ).encode("utf-8")


def _sha(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _retry_object(value: Any) -> dict[str, Any] | None:
    if value is None:
        return None
    expected = {"generation", "prior_job_id", "daemon_build_sha256"}
    if type(value) is not dict or set(value) != expected:
        raise ACoreSourcePackageError(
            "retry must be a builtin object with exactly the authenticated keys"
        )
    generation = value["generation"]
    prior_job_id = value["prior_job_id"]
    daemon_build_sha256 = value["daemon_build_sha256"]
    if type(generation) is not int or generation <= 0:
        raise ACoreSourcePackageError("retry generation must be a positive builtin int")
    if type(prior_job_id) is not str:
        raise ACoreSourcePackageError("retry prior_job_id must be a canonical UUID")
    try:
        canonical_job_id = str(uuid.UUID(prior_job_id))
    except (ValueError, AttributeError) as exc:
        raise ACoreSourcePackageError(
            "retry prior_job_id must be a canonical UUID"
        ) from exc
    if canonical_job_id != prior_job_id:
        raise ACoreSourcePackageError("retry prior_job_id must be a canonical UUID")
    if (
        type(daemon_build_sha256) is not str
        or _LOWER_SHA256.fullmatch(daemon_build_sha256) is None
    ):
        raise ACoreSourcePackageError(
            "retry daemon_build_sha256 must be exact lowercase 64-hex"
        )
    return {
        "daemon_build_sha256": daemon_build_sha256,
        "generation": generation,
        "prior_job_id": prior_job_id,
    }


def _file_signature(info: os.stat_result) -> tuple[int, ...]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_uid,
        info.st_gid,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _capture(path: Path) -> bytes:
    flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0)
    fd: int | None = None
    try:
        fd = os.open(path, flags)
        before = os.fstat(fd)
        if not stat.S_ISREG(before.st_mode) or before.st_size > MAX_CAPTURE_BYTES:
            raise ACoreSourcePackageError(f"source file is not bounded regular: {path}")
        chunks: list[bytes] = []
        total = 0
        while total <= MAX_CAPTURE_BYTES:
            chunk = os.read(fd, min(1024 * 1024, MAX_CAPTURE_BYTES + 1 - total))
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
        after = os.fstat(fd)
        data = b"".join(chunks)
        if (
            _file_signature(before) != _file_signature(after)
            or len(data) != before.st_size
        ):
            raise ACoreSourcePackageError(f"source changed during capture: {path}")
        return data
    except OSError as exc:
        raise ACoreSourcePackageError(f"cannot capture source: {path}") from exc
    finally:
        if fd is not None:
            os.close(fd)


def _load_encoder(path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(
        "p97_a_core_authenticated_encoding", path
    )
    if spec is None or spec.loader is None:
        raise ACoreSourcePackageError("cannot load authenticated A-core encoder")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


@dataclass(frozen=True, slots=True)
class SourcePackage:
    source_root: Path
    case: str
    source_bytes: dict[str, bytes]
    cnf: bytes
    variable_map: dict[str, Any]
    clause_families: dict[str, int]
    producer_manifest: bytes
    package_identity: str

    @property
    def num_variables(self) -> int:
        return NUM_VARIABLES

    @property
    def num_clauses(self) -> int:
        return NUM_CLAUSES

    @property
    def cnf_sha256(self) -> str:
        return _sha(self.cnf)


def build_source_package(
    source_root: Path | None = None,
    *,
    case: str = CASE,
    retry: dict[str, Any] | None = None,
) -> SourcePackage:
    """Rebuild the exact selected source/CNF/map package from live sources."""
    if case != CASE:
        raise ACoreSourcePackageError("only base+P is admissible")
    retry_object = _retry_object(retry)
    root = (
        Path(__file__).resolve().parents[2] / "census" / "frontier-packages" / "a_core"
        if source_root is None
        else source_root
    )
    if not isinstance(root, Path) or not root.is_absolute():
        raise ACoreSourcePackageError("source_root must be an absolute Path")
    try:
        root_stat = root.lstat()
    except OSError as exc:
        raise ACoreSourcePackageError("source_root is unavailable") from exc
    if stat.S_ISLNK(root_stat.st_mode) or not stat.S_ISDIR(root_stat.st_mode):
        raise ACoreSourcePackageError("source_root must be a real directory")
    source_bytes = {name: _capture(root / name) for name in SOURCE_NAMES}
    encoder = _load_encoder(root / "encoding.py")
    instance = encoder.ACoreEncoder()
    del3 = tuple(instance.build_del3_clauses())
    extras = tuple(instance.del2_clauses) + tuple(instance.c10_clauses) + del3
    cnf = encoder.RunInstance(instance, instance.base_clauses).dimacs(extras).encode()
    if instance.cnf.n_variables != NUM_VARIABLES:
        raise ACoreSourcePackageError("source encoder variable count drifted")
    if len(instance.base_clauses) + len(extras) != NUM_CLAUSES:
        raise ACoreSourcePackageError("source encoder clause count drifted")
    if dict(CLAUSE_FAMILIES) != {
        "base": len(instance.base_clauses),
        "DEL2": len(instance.del2_clauses),
        "C10": len(instance.c10_clauses),
        "DEL3": len(del3),
    }:
        raise ACoreSourcePackageError("source clause-family inventory drifted")
    named_ids = tuple(sorted(instance.by_var))
    if named_ids != tuple(
        index for index in range(1, NUM_VARIABLES + 1) if index in instance.by_var
    ):
        raise ACoreSourcePackageError("source variable IDs are not canonical")
    named = [instance.by_var[index] for index in named_ids]
    if len(named) != 432 or len(set(named)) != len(named):
        raise ACoreSourcePackageError("source named-variable build order drifted")
    variables = {
        str(index): instance.by_var.get(index, f"aux_{index}")
        for index in range(1, NUM_VARIABLES + 1)
    }
    if any(
        variables[str(index)] != f"aux_{index}"
        for index in range(1, NUM_VARIABLES + 1)
        if index not in instance.by_var
    ):
        raise ACoreSourcePackageError("auxiliary names are not stable")
    variable_map = {
        "case": case,
        "clause_family_contract": CLAUSE_FAMILY_CONTRACT,
        "clause_families": dict(CLAUSE_FAMILIES),
        "named_atoms": named,
        "num_clauses": NUM_CLAUSES,
        "num_variables": NUM_VARIABLES,
        "schema": MAP_SCHEMA,
        "source_contract": SOURCE_CONTRACT,
        "variables": variables,
    }
    variable_map_bytes = _canonical(variable_map)
    producer = {
        "case": case,
        "clause_family_contract": CLAUSE_FAMILY_CONTRACT,
        "clause_families": dict(CLAUSE_FAMILIES),
        "cnf_sha256": _sha(cnf),
        "num_clauses": NUM_CLAUSES,
        "num_variables": NUM_VARIABLES,
        "schema": SCHEMA if retry_object is None else RETRY_SCHEMA,
        "source_contract": SOURCE_CONTRACT,
        "source_hashes": {name: _sha(data) for name, data in source_bytes.items()},
        "variable_map_sha256": _sha(variable_map_bytes),
    }
    if retry_object is not None:
        producer["retry"] = retry_object
    producer_manifest = _canonical(producer)
    return SourcePackage(
        root,
        case,
        source_bytes,
        cnf,
        variable_map,
        dict(CLAUSE_FAMILIES),
        producer_manifest,
        _sha(producer_manifest + b"\n" + cnf),
    )


__all__ = [
    "CASE",
    "CLAUSE_FAMILIES",
    "CLAUSE_FAMILY_CONTRACT",
    "MAP_SCHEMA",
    "NUM_CLAUSES",
    "NUM_VARIABLES",
    "RETRY_SCHEMA",
    "SCHEMA",
    "SOURCE_CONTRACT",
    "ACoreSourcePackageError",
    "SourcePackage",
    "build_source_package",
]
