"""Strict PIQD runner for the exact-12, source54, normalized cell-8 package.

The receipt emitted here is finite computational evidence.  Even a validated
SAT model supplies neither source entitlement nor theorem or Lean closure.
"""

from __future__ import annotations

import json
import os
import stat
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Protocol

from census.p97_search.phase3_cegar_wave import (
    DISCOVERY_UNSAT,
    ERROR,
    STRUCTURAL_SAT,
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
    validate_wave_manifest,
    wave_manifest_sha256,
)
from census.p97_search.phase3_piqd_driver import (
    DriverPolicy,
    DriverResult,
    DurableAttemptJournal,
    PiqdCegarDriver,
)
from census.p97_search.phase3_piqd_exact12_source54_package import (
    CELL_INDEX,
    CNF_BYTES,
    CNF_SHA256,
    INDEX_SCHEMA,
    JOB_SHA256,
    NUM_CLAUSES,
    NUM_VARIABLES,
    ORDER_SCHEMA,
    PACKAGE_SCHEMA,
    PRODUCER_SCHEMA,
    SOURCE54_BINDINGS_SHA256,
    SOURCE_ORDER_CUTS,
    TERMINAL_RECORD_SHA256,
    VARIABLE_MAP_SCHEMA,
    LoadedPackage,
    decode_and_validate_model,
    load_package,
    reconstruct_checkpoint,
    validate_total_variable_map,
)
from census.p97_search.phase3_piqd_exact12_source54_package import (
    SOURCE54_BANK_BODY_SHA256 as PACKAGE_SOURCE54_BANK_BODY_SHA256,
)
from census.p97_search.phase3_piqd_oracle import (
    CheckedModel,
    PiqdOracleError,
    PreparedJob,
    raw_dimacs_identity,
    scan_dimacs,
)

RUN_RECEIPT_SCHEMA = "p97-piqd-exact12-source54-cell8-run/v1"
SOURCE54_BANK_BODY_SHA256 = (
    "4fe83285d1336a8aaa21906cfa460893ab2eb8fa8b3f2318c98fd0f7cfc0dbd9"
)
SOURCE54_BANK_FILE_SHA256 = (
    "fa138c495c1f425e18a57cfb5e916eabdbe87dffb1e4e21d7488ce8eda399d4b"
)
REQUESTED_CORE_LIMIT = 1
ATTESTED_SOLVER_PROCESSES = 1
ATTESTATION_BASIS = "SINGLE_PROCESS_NO_PARALLEL_FLAG"
_HEX = frozenset("0123456789abcdef")
_MAX_ARTIFACT_BYTES = 64 * 1024 * 1024
_PACKAGE_FILES = (
    "discovery.cnf",
    "bound-job.json",
    "source-order-bank.json",
    "variable-map.json",
    "order.json",
    "producer-manifest.json",
    "wave-manifest.json",
)
_SOURCE_BANK_SCHEMA = "p97_rigid221_exact12_source_order_positive_bank.v3"
_SOURCE_BANK_FIELDS = {
    "schema",
    "detector_contract",
    "detector_manifest",
    "detector_manifest_sha256",
    "lean_source_manifest",
    "entries",
    "claims",
    "bank_sha256",
}
_SOURCE_BANK_ENTRY_FIELDS = {
    "index",
    "certificate_kind",
    "certificate_schema",
    "certificate",
    "certificate_sha256",
    "learned_clause",
    "learned_clause_sha256",
    "witness_cube",
    "witness_cube_sha256",
    "witness_positive_variables",
    "witness_positive_variables_sha256",
    "lean_choice_variables",
    "lean_choice_variables_sha256",
    "generated_lean_nogood",
}
_SOURCE_BANK_CLAIMS = {
    "lean_cut_source_pinned": True,
    "terminal_unsat": False,
    "aggregate_cell_coverage": False,
    "universal_lift": False,
    "live_theorem_closure": False,
}


class Source54RunnerError(RuntimeError):
    """A source54 package, daemon response, journal, or receipt failed closed."""


@dataclass(frozen=True)
class RunPacket:
    packet_id: str
    cnf: bytes
    producer_manifest: bytes
    package_wave_manifest: bytes
    wave_manifest: Mapping[str, Any]
    variable_map: Mapping[str, Any]
    package_artifact_sha256: Mapping[str, str]
    producer_manifest_file_sha256: str
    producer_manifest_canonical_body_sha256: str
    source_order_bank_sha256: str
    source54_package: bool = True


@dataclass(frozen=True)
class Source54Run:
    driver_result: DriverResult
    receipt: Mapping[str, Any]
    receipt_path: Path


class _PiqdClient(Protocol):
    def prepare_cnf(self, **kwargs: Any) -> PreparedJob: ...

    def confirm(self, job: PreparedJob, *, expected_cnf: bytes) -> str: ...

    def status(self, job_id: str) -> Mapping[str, Any]: ...

    def checked_model(self, job: PreparedJob, *, cnf: bytes) -> CheckedModel: ...

    def log(self, job: PreparedJob) -> tuple[bytes, str]: ...

    def proof(self, job: PreparedJob) -> tuple[bytes, str]: ...


def _require(condition: bool, detail: str) -> None:
    if not condition:
        raise Source54RunnerError(detail)


def _digest(value: Any, detail: str) -> str:
    _require(
        type(value) is str and len(value) == 64 and set(value).issubset(_HEX),
        detail,
    )
    return value


def _strict_json(payload: bytes, *, source: str) -> Mapping[str, Any]:
    def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in items:
            if key in result:
                raise ValueError(f"duplicate key {key!r}")
            result[key] = value
        return result

    try:
        value = json.loads(
            payload,
            object_pairs_hook=pairs,
            parse_constant=lambda item: (_ for _ in ()).throw(
                ValueError(f"non-finite constant {item}")
            ),
        )
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
    ) as exc:
        raise Source54RunnerError(f"{source} is not strict JSON") from exc
    _require(type(value) is dict, f"{source} must contain one JSON object")
    return value


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


def _open_directory_nofollow(path: Path) -> int:
    absolute = Path(os.path.abspath(path))
    if len(absolute.parts) >= 4 and absolute.parts[:2] == ("/", ".vol"):
        _require(
            all(component not in {"", ".", ".."} for component in absolute.parts[2:]),
            "path contains an unsafe component",
        )
        try:
            return os.open(
                absolute,
                os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_NOFOLLOW", 0),
            )
        except OSError as exc:
            raise Source54RunnerError(
                "descriptor-rooted directory is missing or unsafe"
            ) from exc
    descriptor = os.open("/", os.O_RDONLY | os.O_DIRECTORY)
    try:
        for component in absolute.parts[1:]:
            if component in {"", ".", ".."}:
                raise Source54RunnerError("path contains an unsafe component")
            child = os.open(
                component,
                os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_NOFOLLOW", 0),
                dir_fd=descriptor,
            )
            os.close(descriptor)
            descriptor = child
        return descriptor
    except OSError as exc:
        os.close(descriptor)
        raise Source54RunnerError("directory is missing, unsafe, or a symlink") from exc
    except Exception:
        os.close(descriptor)
        raise


def _directory_anchor(info: os.stat_result) -> tuple[int, int, int]:
    return info.st_dev, info.st_ino, stat.S_IFMT(info.st_mode)


def _descriptor_rooted_directory(descriptor: int) -> Path:
    """Return a descendant-capable path bound to one held directory inode."""

    anchor = _directory_anchor(os.fstat(descriptor))
    candidate = Path("/.vol") / str(anchor[0]) / str(anchor[1])
    nofollow = getattr(os, "O_NOFOLLOW", None)
    directory = getattr(os, "O_DIRECTORY", None)
    _require(
        nofollow is not None and directory is not None,
        "platform lacks required no-follow directory flags",
    )
    try:
        capability_fd = os.open(candidate, os.O_RDONLY | directory | nofollow)
    except OSError as exc:
        raise Source54RunnerError(
            "platform lacks a no-follow descendant-capable directory path"
        ) from exc
    try:
        _require(
            _directory_anchor(os.fstat(capability_fd)) == anchor,
            "descriptor-rooted run directory identity mismatch",
        )
    finally:
        os.close(capability_fd)
    return candidate


def _require_directory_binding(path: Path, anchor: tuple[int, int, int]) -> None:
    descriptor = _open_directory_nofollow(path)
    try:
        _require(
            _directory_anchor(os.fstat(descriptor)) == anchor,
            "run directory pathname changed",
        )
    finally:
        os.close(descriptor)


def _entry_exists_at(directory_fd: int, name: str) -> bool:
    try:
        os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
    except FileNotFoundError:
        return False
    return True


def _capture_file(directory_fd: int, name: str, *, maximum_bytes: int) -> bytes:
    _require(name not in {"", ".", ".."} and Path(name).name == name, "unsafe filename")
    try:
        descriptor = os.open(
            name,
            os.O_RDONLY | os.O_NONBLOCK | getattr(os, "O_NOFOLLOW", 0),
            dir_fd=directory_fd,
        )
    except OSError as exc:
        raise Source54RunnerError(f"cannot safely open {name}") from exc
    try:
        before = os.fstat(descriptor)
        _require(
            stat.S_ISREG(before.st_mode) and before.st_nlink == 1,
            f"{name} is not a private regular file",
        )
        _require(0 < before.st_size <= maximum_bytes, f"{name} has a forbidden size")
        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(descriptor, min(1024 * 1024, maximum_bytes + 1 - total))
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
            _require(total <= maximum_bytes, f"{name} exceeds its size bound")
        after = os.fstat(descriptor)
        pathname = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        _require(
            _file_identity(before) == _file_identity(after),
            f"{name} changed while read",
        )
        _require(
            _file_identity(after) == _file_identity(pathname), f"{name} was substituted"
        )
        payload = b"".join(chunks)
        _require(len(payload) == after.st_size, f"{name} was only partly read")
        return payload
    finally:
        os.close(descriptor)


def _capture_path(path: Path, *, maximum_bytes: int) -> bytes:
    parent_fd = _open_directory_nofollow(path.parent)
    try:
        return _capture_file(parent_fd, path.name, maximum_bytes=maximum_bytes)
    finally:
        os.close(parent_fd)


def _write_immutable(path: Path, payload: bytes) -> None:
    parent_fd = _open_directory_nofollow(path.parent)
    try:
        try:
            descriptor = os.open(
                path.name,
                os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0),
                0o600,
                dir_fd=parent_fd,
            )
        except OSError as exc:
            raise Source54RunnerError(
                "receipt path already exists or is unsafe"
            ) from exc
        try:
            offset = 0
            while offset < len(payload):
                written = os.write(descriptor, payload[offset:])
                _require(written > 0, "short receipt write")
                offset += written
            os.fsync(descriptor)
        finally:
            os.close(descriptor)
        os.fsync(parent_fd)
        _require(
            _capture_file(parent_fd, path.name, maximum_bytes=8 * 1024 * 1024)
            == payload,
            "installed receipt bytes changed",
        )
    finally:
        os.close(parent_fd)


def _write_immutable_at(directory_fd: int, name: str, payload: bytes) -> None:
    """Install a create-once receipt below one authenticated directory fd."""

    _require(name not in {"", ".", ".."} and Path(name).name == name, "unsafe filename")
    descriptor: int | None = None
    try:
        descriptor = os.open(
            name,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0),
            0o600,
            dir_fd=directory_fd,
        )
        offset = 0
        while offset < len(payload):
            written = os.write(descriptor, payload[offset:])
            _require(written > 0, "short receipt write")
            offset += written
        os.fsync(descriptor)
    except OSError as exc:
        raise Source54RunnerError("receipt path already exists or is unsafe") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
    os.fsync(directory_fd)
    _require(
        _capture_file(directory_fd, name, maximum_bytes=8 * 1024 * 1024) == payload,
        "installed receipt bytes changed",
    )


def _cleanup_reserved_outputs(directory_fd: int, names: Sequence[str]) -> bool:
    """Remove only private runner outputs below the still-held directory fd."""

    regular: list[str] = []
    artifact: tuple[str, int, tuple[int, int, int], list[str]] | None = None
    try:
        for name in names:
            try:
                info = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
            except FileNotFoundError:
                continue
            if name.endswith(".artifacts"):
                if not stat.S_ISDIR(info.st_mode):
                    return False
                child_fd = os.open(
                    name,
                    os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_NOFOLLOW", 0),
                    dir_fd=directory_fd,
                )
                entries = sorted(os.listdir(child_fd))
                for entry in entries:
                    child = os.stat(entry, dir_fd=child_fd, follow_symlinks=False)
                    if (
                        len(entry) != 64
                        or not set(entry).issubset(_HEX)
                        or not stat.S_ISREG(child.st_mode)
                        or child.st_nlink != 1
                    ):
                        os.close(child_fd)
                        return False
                artifact = (name, child_fd, _directory_anchor(info), entries)
            elif not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
                return False
            else:
                regular.append(name)
        if artifact is not None:
            name, child_fd, anchor, entries = artifact
            for entry in entries:
                os.unlink(entry, dir_fd=child_fd)
            pathname = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
            if os.listdir(child_fd) or _directory_anchor(pathname) != anchor:
                os.close(child_fd)
                return False
            os.close(child_fd)
            artifact = None
            os.rmdir(name, dir_fd=directory_fd)
        for name in regular:
            os.unlink(name, dir_fd=directory_fd)
        os.fsync(directory_fd)
        return True
    except OSError:
        return False
    finally:
        if artifact is not None:
            os.close(artifact[1])


def _producer_body_digest(manifest: Mapping[str, Any]) -> tuple[str, str | None]:
    """Return the canonical body digest and its internal assertion, if present."""

    body = dict(manifest)
    asserted: str | None = None
    if "manifest_sha256" in body:
        asserted = body.pop("manifest_sha256")
    elif type(body.get("identity")) is dict:
        identity = body.pop("identity")
        _require(
            set(identity) == {"canonical_body_sha256"},
            "producer identity fields drifted",
        )
        asserted = identity["canonical_body_sha256"]
    digest = sha256_json(body)
    if asserted is not None:
        _require(asserted == digest, "producer canonical-body digest mismatch")
    return digest, asserted


def _canonical_object(payload: bytes, *, source: str) -> Mapping[str, Any]:
    value = _strict_json(payload, source=source)
    _require(canonical_json_bytes(value) == payload, f"{source} is not canonical JSON")
    return value


def _source_manifest_records(
    value: Any, *, source: str
) -> dict[str, Mapping[str, Any]]:
    _require(type(value) is list and bool(value), f"{source} is malformed")
    result: dict[str, Mapping[str, Any]] = {}
    for record in value:
        _require(
            type(record) is dict
            and set(record) == {"path", "bytes", "sha256"}
            and type(record["path"]) is str
            and bool(record["path"])
            and type(record["bytes"]) is int
            and record["bytes"] >= 0,
            f"{source} record is malformed",
        )
        digest = _digest(record["sha256"], f"{source} digest is malformed")
        _require(record["path"] not in result, f"{source} repeats a path")
        result[record["path"]] = {**record, "sha256": digest}
    return result


def _validate_source_bank(bank: Mapping[str, Any]) -> tuple[str, list[dict[str, Any]]]:
    """Authenticate every source54 entry and its producer-facing provenance."""

    _require(set(bank) == _SOURCE_BANK_FIELDS, "source-order bank fields drifted")
    body = dict(bank)
    asserted = body.pop("bank_sha256")
    digest = sha256_json(body)
    _require(
        bank["schema"] == _SOURCE_BANK_SCHEMA
        and bank["claims"] == _SOURCE_BANK_CLAIMS
        and _digest(asserted, "source-order bank digest is malformed") == digest,
        "source-order bank schema, claims, or self-digest drifted",
    )
    _require(
        bank["detector_manifest_sha256"] == sha256_json(bank["detector_manifest"]),
        "source-order detector manifest digest drifted",
    )
    _source_manifest_records(bank["detector_manifest"], source="detector manifest")
    lean_sources = _source_manifest_records(
        bank["lean_source_manifest"], source="Lean source manifest"
    )
    entries = bank["entries"]
    _require(
        type(entries) is list and len(entries) == SOURCE_ORDER_CUTS,
        "package does not contain exactly 54 source-order cuts",
    )
    seen_clauses: set[str] = set()
    provenance: list[dict[str, Any]] = []
    registry_material: list[list[Any]] = []
    for expected_index, entry in enumerate(entries):
        _require(
            type(entry) is dict and set(entry) == _SOURCE_BANK_ENTRY_FIELDS,
            "source-order bank entry fields drifted",
        )
        clause = entry["learned_clause"]
        positive = entry["witness_positive_variables"]
        choices = entry["lean_choice_variables"]
        cube = entry["witness_cube"]
        binding = entry["generated_lean_nogood"]
        _require(
            type(entry["index"]) is int
            and entry["index"] == expected_index
            and entry["certificate_kind"] == "source_order_positive_coverage"
            and type(entry["certificate_schema"]) is str
            and bool(entry["certificate_schema"])
            and type(entry["certificate"]) is dict
            and entry["certificate_sha256"] == sha256_json(entry["certificate"]),
            "source-order certificate identity drifted",
        )
        _require(
            type(clause) is list
            and bool(clause)
            and all(type(literal) is int and literal < 0 for literal in clause)
            and len(set(clause)) == len(clause)
            and entry["learned_clause_sha256"] == sha256_json(clause),
            "source-order learned clause is malformed",
        )
        _require(
            type(positive) is list
            and all(
                type(variable) is int and 1 <= variable <= NUM_VARIABLES
                for variable in positive
            )
            and len(set(positive)) == len(positive)
            and entry["witness_positive_variables_sha256"] == sha256_json(positive)
            and type(choices) is list
            and bool(choices)
            and all(type(variable) is int for variable in choices)
            and len(set(choices)) == len(choices)
            and choices == [-literal for literal in clause]
            and set(choices).issubset(positive)
            and entry["lean_choice_variables_sha256"] == sha256_json(choices),
            "source-order witness variables do not bind the learned clause",
        )
        _require(
            type(cube) is dict
            and set(cube) == {str(center) for center in range(12)}
            and all(
                type(support) is list
                and len(support) == 4
                and all(type(point) is int and 0 <= point < 12 for point in support)
                and len(set(support)) == 4
                and center not in support
                for center, support in (
                    (int(key), value) for key, value in cube.items()
                )
            )
            and entry["witness_cube_sha256"] == sha256_json(cube),
            "source-order witness cube is malformed",
        )
        _require(type(binding) is dict, "generated Lean nogood binding is malformed")
        _require(
            binding.get("cube_sha256") == entry["witness_cube_sha256"]
            and type(binding.get("choices")) is list
            and all(
                type(choice) is dict
                and set(choice) == {"center", "support"}
                and type(choice["center"]) is int
                and 0 <= choice["center"] < 12
                and choice["support"] == cube[str(choice["center"])]
                for choice in binding["choices"]
            ),
            "generated Lean nogood does not bind the witness cube",
        )
        for prefix in ("", "coverage_", "consumer_"):
            path = binding.get(f"{prefix}source_path")
            _require(
                type(path) is str
                and path in lean_sources
                and binding.get(f"{prefix}source_bytes") == lean_sources[path]["bytes"]
                and binding.get(f"{prefix}source_sha256")
                == lean_sources[path]["sha256"],
                "generated Lean nogood source binding drifted",
            )
        clause_digest = entry["learned_clause_sha256"]
        _require(clause_digest not in seen_clauses, "source-order clause is duplicated")
        seen_clauses.add(clause_digest)
        provenance.append(
            {
                "canonical_clause": clause,
                "canonical_clause_sha256": clause_digest,
                "lean_source_sha256": binding["source_sha256"],
                "binding": "canonical_clause_content_sha256",
                "certificate_position_binding": False,
            }
        )
        registry_material.append([cube, binding, binding["choices"]])
    _require(
        digest == SOURCE54_BANK_BODY_SHA256
        and sha256_json(registry_material) == SOURCE54_BINDINGS_SHA256,
        "source-order bank is not the pinned source54 registry prefix",
    )
    return digest, provenance


def _require_source_clauses_in_cnf(
    cnf: bytes, clauses: Sequence[Sequence[int]]
) -> None:
    pending = {tuple(clause) for clause in clauses}
    current: list[int] = []
    for raw_line in cnf.splitlines():
        stripped = raw_line.strip()
        if not stripped or stripped.startswith((b"c", b"p")):
            continue
        for token in stripped.split():
            literal = int(token)
            if literal == 0:
                pending.discard(tuple(current))
                current.clear()
            else:
                current.append(literal)
    _require(not pending, "source-order learned clauses are absent from the fixed CNF")


def _validate_total_map_boundary(
    variable_map: Mapping[str, Any], variable_map_bytes: bytes
) -> None:
    _require(
        set(variable_map) == {"schema", "coverage", "num_variables", "entries"}
        and variable_map["schema"] == VARIABLE_MAP_SCHEMA
        and variable_map["coverage"] == "COMPLETE_TOTAL_1_TO_44855"
        and type(variable_map["num_variables"]) is int
        and variable_map["num_variables"] == NUM_VARIABLES
        and canonical_json_bytes(dict(variable_map)) == variable_map_bytes,
        "source54 total variable-map identity or canonical bytes drifted",
    )
    entries = variable_map["entries"]
    _require(
        type(entries) is list and len(entries) == NUM_VARIABLES,
        "source54 total variable-map is incomplete",
    )
    for expected_variable, entry in enumerate(entries, 1):
        _require(
            type(entry) is dict
            and type(entry.get("variable")) is int
            and entry["variable"] == expected_variable
            and type(entry.get("kind")) is str
            and bool(entry["kind"]),
            "source54 total variable-map has a gap, duplicate, or malformed role",
        )
    validate_total_variable_map(variable_map)


def _validate_package_inventory(package: LoadedPackage) -> dict[str, str]:
    index = package.index
    _require(
        set(index)
        == {"schema", "package_schema", "create_once", "artifacts", "artifacts_sha256"}
        and index["schema"] == INDEX_SCHEMA
        and index["package_schema"] == PACKAGE_SCHEMA
        and index["create_once"] is True
        and set(package.artifacts) == {*_PACKAGE_FILES, "package-index.json"},
        "source54 package index or artifact set drifted",
    )
    records = index["artifacts"]
    _require(
        type(records) is list
        and len(records) == len(_PACKAGE_FILES)
        and sha256_json(records) == index["artifacts_sha256"],
        "source54 package artifact inventory is malformed",
    )
    result: dict[str, str] = {}
    for expected_name, record in zip(_PACKAGE_FILES, records, strict=True):
        payload = package.artifacts[expected_name]
        _require(
            type(record) is dict
            and set(record) == {"name", "bytes", "file_sha256"}
            and record["name"] == expected_name
            and type(record["bytes"]) is int
            and record["bytes"] == len(payload)
            and record["file_sha256"] == sha256_bytes(payload),
            "source54 package artifact record drifted",
        )
        result[expected_name] = _digest(
            record["file_sha256"], "source54 package artifact digest is malformed"
        )
    result["package-index.json"] = sha256_bytes(canonical_json_bytes(dict(index)))
    return result


def _validate_clause_anomaly_scan(value: object) -> None:
    expected = {
        "clauses_scanned": NUM_CLAUSES,
        "tautological_clauses": 0,
        "repeated_literal_clauses": 0,
        "empty_clauses": 0,
    }
    _require(
        type(value) is dict
        and set(value) == set(expected)
        and all(
            type(value[key]) is int and value[key] == count
            for key, count in expected.items()
        ),
        "source54 clause anomaly scan is absent or nonzero",
    )


def _derive_execution_wave(package_wave: Mapping[str, Any]) -> dict[str, Any]:
    execution = dict(package_wave["execution"])
    execution.update({"backend": "cadical", "solver_profile": "sat"})
    run_wave = {**dict(package_wave), "execution": execution}
    try:
        validate_wave_manifest(run_wave)
    except Exception as exc:
        raise Source54RunnerError("derived execution wave is invalid") from exc
    return run_wave


def packet_from_package(package: LoadedPackage) -> RunPacket:
    """Recheck the fixed package and derive its daemon execution manifest."""

    package_hashes = _validate_package_inventory(package)
    _require(
        PACKAGE_SOURCE54_BANK_BODY_SHA256 == SOURCE54_BANK_BODY_SHA256
        and package_hashes.get("source-order-bank.json") == SOURCE54_BANK_FILE_SHA256,
        "package source-order bank identity disagrees with the runner pin",
    )
    cnf = package.artifacts["discovery.cnf"]
    producer_bytes = package.artifacts["producer-manifest.json"]
    package_wave_bytes = package.artifacts["wave-manifest.json"]
    variable_map_bytes = package.artifacts["variable-map.json"]
    producer = _canonical_object(producer_bytes, source="producer-manifest.json")
    package_wave = _canonical_object(package_wave_bytes, source="wave-manifest.json")
    variable_map = _canonical_object(variable_map_bytes, source="variable-map.json")
    source_bank = _canonical_object(
        package.artifacts["source-order-bank.json"], source="source-order-bank.json"
    )
    order = _canonical_object(package.artifacts["order.json"], source="order.json")
    bound_job = _canonical_object(
        package.artifacts["bound-job.json"], source="bound-job.json"
    )
    _require(
        canonical_json_bytes(dict(package.producer_manifest)) == producer_bytes
        and canonical_json_bytes(dict(package.wave_manifest)) == package_wave_bytes
        and canonical_json_bytes(dict(package.variable_map)) == variable_map_bytes,
        "loaded package mappings do not equal the authenticated artifact bytes",
    )
    variables, clauses = scan_dimacs(cnf)
    _require(
        (len(cnf), sha256_bytes(cnf), variables, clauses)
        == (CNF_BYTES, CNF_SHA256, NUM_VARIABLES, NUM_CLAUSES),
        "source54 DIMACS identity or dimensions drifted",
    )
    _validate_total_map_boundary(variable_map, variable_map_bytes)
    _require(
        bound_job.get("cell_index") == CELL_INDEX
        and sha256_json(bound_job) == JOB_SHA256,
        "source54 bound-job identity drifted",
    )
    bank_digest, source_provenance = _validate_source_bank(source_bank)
    _require_source_clauses_in_cnf(
        cnf, [entry["learned_clause"] for entry in source_bank["entries"]]
    )
    expected_pairs = [
        [left, right] for left in range(12) for right in range(left + 1, 12)
    ]
    _require(
        set(order)
        == {
            "schema",
            "cell_index",
            "cell_source_insertion_order",
            "c4_pair_order",
            "relation_edge_order",
            "source_order_bank_sha256",
            "journal_terminal_record_sha256",
        }
        and order["schema"] == ORDER_SCHEMA
        and order["cell_index"] == CELL_INDEX
        and order["cell_source_insertion_order"] == [6, 9, 0, 2, 8]
        and order["c4_pair_order"] == expected_pairs
        and order["relation_edge_order"] == expected_pairs
        and order["source_order_bank_sha256"] == bank_digest
        and order["journal_terminal_record_sha256"] == TERMINAL_RECORD_SHA256,
        "source54 order manifest drifted",
    )
    _require(
        set(producer)
        == {
            "schema",
            "semantic_status",
            "scope",
            "claims",
            "cnf",
            "variable_map",
            "order",
            "inputs",
            "compiler_replay",
            "source_cut_provenance",
            "clause_anomaly_scan",
            "runner_boundary",
            "identity",
        }
        and producer["schema"] == PRODUCER_SCHEMA
        and producer["semantic_status"] == "FINITE_LOCAL_CHECKPOINT_ONLY"
        and producer["scope"]
        == {
            "cardinality": 12,
            "normalized_v14_cell": CELL_INDEX,
            "source_order_cut_count": SOURCE_ORDER_CUTS,
            "future_checkpoint_capable_helpers": True,
            "v1_acceptance": "PINNED_SOURCE54_ONLY",
        },
        "source54 producer scope drifted",
    )
    expected_claims = {
        "source_entitlement": False,
        "sat": False,
        "unsat": False,
        "proof": False,
        "universal": False,
        "aggregate_cell_coverage": False,
        "lean_closure": False,
        "solver_receipt": False,
    }
    _require(producer["claims"] == expected_claims, "source54 producer claims drifted")
    _require(
        producer["cnf"]
        == {
            "path_in_package": "discovery.cnf",
            "bytes": CNF_BYTES,
            "sha256": CNF_SHA256,
            "num_variables": NUM_VARIABLES,
            "num_clauses": NUM_CLAUSES,
            "byte_identical_reconstruction": True,
        }
        and producer["variable_map"]
        == {
            "path_in_package": "variable-map.json",
            "sha256": sha256_bytes(variable_map_bytes),
            "coverage": "COMPLETE_TOTAL_1_TO_44855",
        }
        and producer["order"]
        == {
            "path_in_package": "order.json",
            "sha256": sha256_bytes(package.artifacts["order.json"]),
        },
        "source54 producer artifact identity drifted",
    )
    inputs = producer["inputs"]
    _require(
        type(inputs) is dict
        and set(inputs) == {"capture", "inventory", "inventory_sha256"}
        and inputs["capture"] == "component-wise no-follow bounded cross-file-stable"
        and inputs["inventory_sha256"] == sha256_json(inputs["inventory"]),
        "source54 producer input inventory drifted",
    )
    _source_manifest_records(inputs["inventory"], source="producer input inventory")
    replay = producer["compiler_replay"]
    _require(
        type(replay) is dict
        and replay.get("bound_job_sha256") == JOB_SHA256
        and replay.get("source_order_bank_sha256") == bank_digest
        and type(replay.get("source_order_bank_entries")) is int
        and replay["source_order_bank_entries"] == SOURCE_ORDER_CUTS
        and replay.get("journal_terminal_record_sha256") == TERMINAL_RECORD_SHA256,
        "source54 compiler replay or bank registry binding drifted",
    )
    provenance = producer["source_cut_provenance"]
    _require(
        provenance
        == {
            "binding_key": "canonical_clause_content_sha256",
            "certificate_clause_position_used": False,
            "cuts": source_provenance,
            "cuts_sha256": sha256_json(source_provenance),
        },
        "source54 producer clause provenance does not exactly match the bank",
    )
    boundary = producer["runner_boundary"]
    _require(
        type(boundary) is dict
        and boundary.get("raw_dimacs_compatible") is True
        and boundary.get("piqd_client") == "PiqdRawDimacsClient"
        and boundary.get("requested_core_enforcement") == "RUNNER_RESPONSIBILITY"
        and boundary.get("run_packet_json_safe") is True,
        "source54 producer runner boundary drifted",
    )
    _validate_clause_anomaly_scan(producer.get("clause_anomaly_scan"))
    body_digest, asserted = _producer_body_digest(producer)
    _require(asserted is not None, "producer lacks its canonical-body digest")
    producer_file_digest = sha256_bytes(producer_bytes)
    try:
        validate_wave_manifest(package_wave)
    except Exception as exc:
        raise Source54RunnerError("package custody wave is invalid") from exc
    _require(
        package_wave["source"]["finite_schema"] == PRODUCER_SCHEMA
        and package_wave["source"]["cardinality_scope"]
        == "exactly 12; normalized v14 cell 8 only"
        and package_wave["source"]["source_theorem"] == "NONE_SOURCE_ENTITLEMENT_FALSE"
        and package_wave["encoding"]
        == {
            "cnf_sha256": CNF_SHA256,
            "variable_map_sha256": sha256_bytes(variable_map_bytes),
            "producer_manifest_sha256": producer_file_digest,
            "num_variables": NUM_VARIABLES,
            "num_clauses": NUM_CLAUSES,
            "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        }
        and package_wave["execution"]
        == {
            "backend": "piqd-raw-dimacs",
            "solver_profile": "runner-supplied; package makes no solver receipt",
            "shard_id": CELL_INDEX,
            "shard_count": 648,
            "order_sha256": sha256_json(order),
            "seed": 97,
        },
        "source54 package custody wave or cross-bindings drifted",
    )
    run_wave = _derive_execution_wave(package_wave)
    return RunPacket(
        packet_id=run_wave["wave_id"],
        cnf=cnf,
        producer_manifest=producer_bytes,
        package_wave_manifest=package_wave_bytes,
        wave_manifest=run_wave,
        variable_map=variable_map,
        package_artifact_sha256=package_hashes,
        producer_manifest_file_sha256=producer_file_digest,
        producer_manifest_canonical_body_sha256=body_digest,
        source_order_bank_sha256=bank_digest,
    )


def _validate_packet(packet: RunPacket) -> None:
    try:
        variables, clauses = scan_dimacs(packet.cnf)
    except PiqdOracleError as exc:
        raise Source54RunnerError("run packet CNF is malformed") from exc
    _require(variables > 0 and clauses > 0, "run packet CNF is vacuous")
    try:
        validate_wave_manifest(packet.wave_manifest)
    except Exception as exc:
        raise Source54RunnerError("run packet wave is invalid") from exc
    encoding = packet.wave_manifest["encoding"]
    execution = packet.wave_manifest["execution"]
    _require(
        (
            encoding["cnf_sha256"],
            encoding["producer_manifest_sha256"],
            encoding["num_variables"],
            encoding["num_clauses"],
        )
        == (
            sha256_bytes(packet.cnf),
            sha256_bytes(packet.producer_manifest),
            variables,
            clauses,
        ),
        "run packet encoding does not bind its bytes and dimensions",
    )
    _require(
        execution["backend"] == "cadical" and execution["solver_profile"] == "sat",
        "run packet requires cadical/sat",
    )
    _require(execution["seed"] == 97, "run packet requires seed 97")
    _require(bool(packet.package_artifact_sha256), "package hash inventory is empty")
    for name, digest in packet.package_artifact_sha256.items():
        _require(type(name) is str and bool(name), "package artifact name is empty")
        _digest(digest, f"package artifact {name} has an invalid digest")
    _require(
        sha256_bytes(packet.producer_manifest) == packet.producer_manifest_file_sha256,
        "producer file digest mismatch",
    )
    producer = _strict_json(packet.producer_manifest, source="producer manifest")
    body_digest, _ = _producer_body_digest(producer)
    _require(
        body_digest == packet.producer_manifest_canonical_body_sha256,
        "producer canonical-body digest mismatch",
    )
    replay = producer.get("compiler_replay")
    _require(
        type(replay) is dict
        and _digest(
            packet.source_order_bank_sha256,
            "run packet source-order bank digest is malformed",
        )
        == replay.get("source_order_bank_sha256"),
        "run packet and producer source-order bank identity disagree",
    )
    if packet.source54_package:
        _require(
            (variables, clauses, len(packet.cnf), sha256_bytes(packet.cnf))
            == (NUM_VARIABLES, NUM_CLAUSES, CNF_BYTES, CNF_SHA256),
            "run packet is not the fixed source54 CNF",
        )
        _require(
            execution["shard_id"] == CELL_INDEX and execution["shard_count"] == 648,
            "run packet is not cell 8 of 648",
        )
        _require(
            type(replay) is dict
            and packet.source_order_bank_sha256 == SOURCE54_BANK_BODY_SHA256
            and replay.get("source_order_bank_sha256")
            == packet.source_order_bank_sha256
            and packet.package_artifact_sha256.get("source-order-bank.json")
            == SOURCE54_BANK_FILE_SHA256,
            "run packet does not bind the pinned package and producer source bank",
        )
        validate_total_variable_map(packet.variable_map)


def _validate_complete_assignment(cnf: bytes, assignment: Sequence[int]) -> None:
    """Independently require a total signed assignment, then scan every clause."""

    num_variables, _num_clauses = scan_dimacs(cnf)
    if type(assignment) not in {tuple, list} or len(assignment) != num_variables:
        raise PiqdOracleError(
            "runner requires exactly one model literal for every DIMACS variable"
        )
    seen = bytearray(num_variables + 1)
    for literal in assignment:
        if type(literal) is not int or literal == 0:
            raise PiqdOracleError("runner model literal is not a nonzero integer")
        variable = abs(literal)
        if variable > num_variables:
            raise PiqdOracleError("runner model literal is outside the DIMACS range")
        if seen[variable]:
            raise PiqdOracleError("runner model assigns a DIMACS variable twice")
        seen[variable] = 1
    if any(flag == 0 for flag in seen[1:]):
        raise PiqdOracleError("runner model omits a DIMACS variable")
    scan_dimacs(cnf, assignment=assignment)


class _StrictBoundIdentityClient:
    """Bind every PIQD operation to one raw-DIMACS identity."""

    def __init__(self, delegate: _PiqdClient) -> None:
        self.delegate = delegate
        self.observed_job: PreparedJob | None = None
        self.confirmed = False
        self.terminal_status: Mapping[str, Any] | None = None
        self.terminal_attestation_accepted = False
        self.failed_no_solver_accepted = False
        self.checked_assignment: tuple[int, ...] | None = None
        self.model_response_sha256: str | None = None
        self.prepare_calls = 0
        self.confirm_calls = 0
        self.model_calls = 0
        self.log_calls = 0

    def prepare_cnf(self, **kwargs: Any) -> PreparedJob:
        self.prepare_calls += 1
        if self.prepare_calls != 1:
            raise PiqdOracleError("source54 runner permits exactly one prepare attempt")
        if set(kwargs) != {
            "wave_manifest",
            "cnf",
            "producer_manifest",
            "timeout_s",
            "march_timeout_s",
            "project",
            "requested_core_limit",
        }:
            raise PiqdOracleError("driver prepare fields drifted")
        requested = kwargs.get("requested_core_limit")
        if (
            type(requested) is not int
            or requested != REQUESTED_CORE_LIMIT
            or type(kwargs["wave_manifest"]) is not dict
            or type(kwargs["cnf"]) is not bytes
            or type(kwargs["producer_manifest"]) is not bytes
            or type(kwargs["timeout_s"]) not in {int, float}
            or type(kwargs["march_timeout_s"]) not in {int, float}
            or type(kwargs["project"]) is not str
            or not kwargs["project"]
        ):
            raise PiqdOracleError("driver did not request requested_core_limit=1")
        job = self.delegate.prepare_cnf(**kwargs)
        if not isinstance(job, PreparedJob):
            raise PiqdOracleError("PIQD prepare response has the wrong type")
        self.observed_job = job
        wave = kwargs["wave_manifest"]
        cnf = kwargs["cnf"]
        producer = kwargs["producer_manifest"]
        expected_identity = raw_dimacs_identity(
            backend="cadical",
            solver_profile="sat",
            cnf_sha256=sha256_bytes(cnf),
            producer_manifest_sha256=sha256_bytes(producer),
            requested_core_limit=REQUESTED_CORE_LIMIT,
        )
        if (
            type(job.existing) is not bool
            or job.backend != "cadical"
            or job.solver_profile != "sat"
            or job.cnf_blob_hash != sha256_bytes(cnf)
            or job.identity_hash != expected_identity
            or type(job.num_vars) is not int
            or job.num_vars != wave["encoding"]["num_variables"]
            or type(job.num_clauses) is not int
            or job.num_clauses != wave["encoding"]["num_clauses"]
            or type(getattr(job, "requested_core_limit", None)) is not int
            or job.requested_core_limit != REQUESTED_CORE_LIMIT
            or type(job.job_id) is not str
            or not job.job_id
        ):
            raise PiqdOracleError("PIQD prepare response does not match the bound job")
        return job

    def _same_job(self, job: PreparedJob) -> None:
        if self.observed_job is None or job != self.observed_job:
            raise PiqdOracleError("PIQD operation refers to an unbound job")

    def confirm(self, job: PreparedJob, *, expected_cnf: bytes) -> str:
        self._same_job(job)
        self.confirm_calls += 1
        if self.confirm_calls != 1:
            raise PiqdOracleError("source54 runner permits exactly one confirm attempt")
        state = self.delegate.confirm(job, expected_cnf=expected_cnf)
        if type(state) is not str or state not in {
            "confirmed",
            "running",
            "completed",
            "failed",
        }:
            raise PiqdOracleError("PIQD returned an invalid confirm state")
        self.confirmed = state != "failed"
        return state

    def status(self, job_id: str) -> Mapping[str, Any]:
        if self.observed_job is None or job_id != self.observed_job.job_id:
            raise PiqdOracleError("PIQD status requested for an unbound job")
        payload = self.delegate.status(job_id)
        if (
            type(payload) is not dict
            or type(payload.get("id")) is not str
            or payload.get("id") != job_id
        ):
            raise PiqdOracleError("PIQD returned a stale or foreign status response")
        state = payload.get("status")
        if type(state) is not str:
            raise PiqdOracleError("PIQD status state has the wrong type")
        if self.confirmed and state == "prepared":
            raise PiqdOracleError("PIQD status regressed to prepared")
        if state in {"completed", "failed"}:
            self.terminal_status = dict(payload)
        if state == "completed":
            if (
                type(payload.get("result")) is not str
                or payload["result"] not in {"SAT", "UNSAT", "UNKNOWN"}
                or type(payload.get("requested_core_limit")) is not int
                or payload["requested_core_limit"] != REQUESTED_CORE_LIMIT
                or type(payload.get("attested_solver_processes")) is not int
                or payload["attested_solver_processes"] != ATTESTED_SOLVER_PROCESSES
                or type(payload.get("attestation_basis")) is not str
                or payload["attestation_basis"] != ATTESTATION_BASIS
            ):
                raise PiqdOracleError(
                    "PIQD completed status has invalid serial attestation"
                )
            self.terminal_attestation_accepted = True
        elif state == "failed":
            if (
                payload.get("result") != "UNKNOWN"
                or type(payload.get("result")) is not str
                or type(payload.get("requested_core_limit")) is not int
                or payload["requested_core_limit"] != REQUESTED_CORE_LIMIT
                or "attested_solver_processes" not in payload
                or payload["attested_solver_processes"] is not None
                or "attestation_basis" not in payload
                or payload["attestation_basis"] is not None
            ):
                raise PiqdOracleError(
                    "PIQD failed status violates the no-solver contract"
                )
            self.failed_no_solver_accepted = True
        return payload

    def checked_model(self, job: PreparedJob, *, cnf: bytes) -> CheckedModel:
        self._same_job(job)
        self.model_calls += 1
        if self.model_calls != 1:
            raise PiqdOracleError("source54 runner permits exactly one model result")
        checked = self.delegate.checked_model(job, cnf=cnf)
        if (
            type(checked.assignment) is not tuple
            or type(checked.response_body) is not bytes
            or type(checked.response_sha256) is not str
        ):
            raise PiqdOracleError("PIQD model response types are malformed")
        _validate_complete_assignment(cnf, checked.assignment)
        if sha256_bytes(checked.response_body) != checked.response_sha256:
            raise PiqdOracleError("PIQD model response hash mismatch")
        self.checked_assignment = tuple(checked.assignment)
        self.model_response_sha256 = checked.response_sha256
        return checked

    def log(self, job: PreparedJob) -> tuple[bytes, str]:
        self._same_job(job)
        self.log_calls += 1
        if self.log_calls != 1:
            raise PiqdOracleError(
                "source54 runner permits exactly one solver-log result"
            )
        payload, digest = self.delegate.log(job)
        if type(payload) is not bytes or not payload:
            raise PiqdOracleError("PIQD solver log is not nonempty bytes")
        if (
            type(digest) is not str
            or len(digest) != 64
            or not set(digest).issubset(_HEX)
        ):
            raise PiqdOracleError("PIQD solver log digest is invalid")
        if digest != sha256_bytes(payload):
            raise PiqdOracleError("PIQD solver log hash mismatch")
        return payload, digest

    def proof(self, job: PreparedJob) -> tuple[bytes, str]:
        self._same_job(job)
        return self.delegate.proof(job)


def _null_job_identity() -> dict[str, None]:
    return {
        "job_id": None,
        "backend": None,
        "solver_profile": None,
        "cnf_blob_hash": None,
        "identity_hash": None,
        "num_variables": None,
        "num_clauses": None,
        "existing": None,
        "requested_core_limit": None,
    }


def _journal_evidence(journal: DurableAttemptJournal) -> Mapping[str, Any]:
    journal_raw = _capture_path(journal.path, maximum_bytes=64 * 1024 * 1024)
    seal_raw = _capture_path(journal.seal_path, maximum_bytes=1024 * 1024)
    seal = _strict_json(seal_raw.rstrip(b"\n"), source="journal seal")
    _require(
        canonical_json_bytes(seal) + b"\n" == seal_raw, "journal seal is not canonical"
    )
    artifact_hashes = sorted(
        {
            digest
            for record in journal.records
            for digest in record["artifacts"].values()
            if type(digest) is str
        }
    )
    artifact_fd = _open_directory_nofollow(journal.artifact_dir)
    try:
        payloads = {
            digest: _capture_file(
                artifact_fd, digest, maximum_bytes=_MAX_ARTIFACT_BYTES
            )
            for digest in artifact_hashes
        }
    finally:
        os.close(artifact_fd)
    for digest, payload in payloads.items():
        _require(sha256_bytes(payload) == digest, "journal artifact hash mismatch")
    events = [
        _strict_json(
            payloads[record["artifacts"]["checkpoint_sha256"]], source="journal event"
        )
        for record in journal.records
    ]
    starts = [event for event in events if event.get("phase") == "DRIVER_START"]
    _require(len(starts) == 1, "journal does not contain one driver start")
    policy = starts[0].get("response")
    _require(
        type(policy) is dict
        and policy.get("max_prepare_attempts") == 1
        and policy.get("max_confirm_attempts") == 1
        and policy.get("max_result_attempts") == 1
        and policy.get("requested_core_limit") == REQUESTED_CORE_LIMIT,
        "journal does not bind the strict serial policy",
    )
    prepares = [
        event
        for event in events
        if event.get("phase") == "PREPARE" and event.get("disposition") == "SUCCESS"
    ]
    confirms = [
        event
        for event in events
        if event.get("phase") == "CONFIRM" and event.get("disposition") == "SUCCESS"
    ]
    _require(
        len(prepares) == 1 and len(confirms) == 1,
        "journal lacks one prepare and confirm",
    )
    prepared = prepares[0]
    response = prepared.get("response")
    _require(type(response) is dict, "journal PREPARE response is absent")
    job_identity = {
        "job_id": prepared.get("job_id"),
        "backend": response.get("backend"),
        "solver_profile": response.get("solver_profile"),
        "cnf_blob_hash": response.get("cnf_blob_hash"),
        "identity_hash": response.get("identity_hash"),
        "num_variables": response.get("num_vars"),
        "num_clauses": response.get("num_clauses"),
        "existing": response.get("existing"),
        "requested_core_limit": policy["requested_core_limit"],
    }
    terminal_events = [
        event
        for event in events
        if event.get("phase") in {"POLL", "SOLVER_UNKNOWN", "DAEMON_FAILED"}
        and event.get("status") in {"completed", "failed"}
        and type(event.get("response")) is dict
    ]
    _require(len(terminal_events) == 1, "journal lacks one terminal status response")
    status = terminal_events[0]["response"]
    _require(
        status.get("status") == terminal_events[0].get("status")
        and status.get("result") == terminal_events[0].get("result"),
        "terminal status envelope mismatch",
    )
    terminal = journal.records[-1]
    model_digest = terminal["artifacts"]["model_sha256"]
    log_digest = terminal["artifacts"]["solver_log_sha256"]
    if status["status"] == "completed":
        _require(
            type(log_digest) is str and bool(payloads[log_digest]),
            "completed run lacks solver log",
        )
        if status["result"] == "SAT":
            _require(
                type(model_digest) is str and model_digest in payloads,
                "SAT run lacks model artifact",
            )
    else:
        _require(
            model_digest is None and log_digest is None,
            "failed run has solver artifacts",
        )
    return {
        "journal_sha256": sha256_bytes(journal_raw),
        "journal_record_count": len(journal.records),
        "terminal_record_sha256": terminal["record_sha256"],
        "seal_sha256": seal["seal_sha256"],
        "seal_file_sha256": sha256_bytes(seal_raw),
        "artifact_sha256": artifact_hashes,
        "prepared_job_identity": job_identity,
        "terminal_status_canonical_sha256": sha256_json(status),
        "terminal_status_raw_available": False,
        "terminal_status_raw_sha256": None,
        "terminal_lifecycle_status": status["status"],
        "terminal_solver_result": status["result"],
        "terminal_model_sha256": model_digest,
        "terminal_solver_log_sha256": log_digest,
    }


def _attestation(client: _StrictBoundIdentityClient) -> Mapping[str, Any]:
    status = client.terminal_status or {}
    return {
        "requested_core_limit": REQUESTED_CORE_LIMIT,
        "prepared_requested_core_limit": (
            getattr(client.observed_job, "requested_core_limit", None)
            if client.observed_job is not None
            else None
        ),
        "terminal_requested_core_limit": status.get("requested_core_limit"),
        "terminal_attested_solver_processes": status.get("attested_solver_processes"),
        "terminal_attestation_basis": status.get("attestation_basis"),
        "solver_process_attestation_accepted": client.terminal_attestation_accepted,
        "no_solver_run_state_accepted": client.failed_no_solver_accepted,
        "os_affinity_attested": False,
        "os_thread_limit_attested": False,
        "os_cpuset_limit_attested": False,
        "os_core_enforcement_attested": False,
    }


def _semantic_evidence(
    *,
    packet: RunPacket,
    result: DriverResult,
    client: _StrictBoundIdentityClient,
    validator: Callable[[tuple[int, ...]], Mapping[str, Sequence[int]]],
) -> Mapping[str, Any]:
    variable_map_sha256 = sha256_bytes(canonical_json_bytes(dict(packet.variable_map)))
    if result.outcome != STRUCTURAL_SAT:
        return {
            "performed": False,
            "model_response_sha256": None,
            "variable_map_sha256": variable_map_sha256,
            "base_cube": None,
            "base_cube_sha256": None,
            "complete_total_assignment": False,
            "every_clause_satisfied": False,
            "one_choice_per_center": False,
            "source_faithful_gate": False,
            "cell8_semantic_gate": False,
        }
    _require(
        client.checked_assignment is not None, "SAT outcome lacks a checked assignment"
    )
    _validate_complete_assignment(packet.cnf, client.checked_assignment)
    validated_cube = validator(client.checked_assignment)
    _require(
        type(validated_cube) is dict, "semantic validator returned a non-object cube"
    )
    cube = {str(key): list(value) for key, value in validated_cube.items()}
    if packet.source54_package:
        positive = {literal for literal in client.checked_assignment if literal > 0}
        selected: dict[str, list[list[int]]] = {str(center): [] for center in range(12)}
        for entry in packet.variable_map["entries"]:
            if entry["kind"] == "choice" and entry["variable"] in positive:
                _require(
                    type(entry.get("center")) is int
                    and 0 <= entry["center"] < 12
                    and type(entry.get("support")) is list,
                    "selected base-choice variable has a malformed role",
                )
                selected[str(entry["center"])].append(list(entry["support"]))
        _require(
            set(cube) == {str(index) for index in range(12)}
            and all(len(rows) == 1 for rows in selected.values())
            and cube == {center: rows[0] for center, rows in selected.items()},
            "model does not decode to exactly one authenticated base choice per center",
        )
    cube_digest = sha256_json(cube)
    return {
        "performed": True,
        "model_response_sha256": client.model_response_sha256,
        "variable_map_sha256": variable_map_sha256,
        "base_cube": cube,
        "base_cube_sha256": cube_digest,
        "complete_total_assignment": True,
        "every_clause_satisfied": True,
        "one_choice_per_center": True,
        "source_faithful_gate": True,
        "cell8_semantic_gate": True,
    }


_FALSE_CLAIMS = {
    "source_entitlement": False,
    "aggregate_cell_coverage": False,
    "complete_source_coverage": False,
    "universal_lift": False,
    "theorem_closure": False,
    "lean_checked": False,
    "lean_closure": False,
}


def _source_bank_receipt_identity(packet: RunPacket) -> Mapping[str, Any]:
    producer = _strict_json(packet.producer_manifest, source="producer manifest")
    replay = producer.get("compiler_replay")
    producer_digest = (
        replay.get("source_order_bank_sha256") if type(replay) is dict else None
    )
    identity = {
        "canonical_body_sha256": packet.source_order_bank_sha256,
        "package_file_sha256": packet.package_artifact_sha256.get(
            "source-order-bank.json"
        ),
        "producer_compiler_replay_sha256": producer_digest,
    }
    if packet.source54_package:
        _require(
            identity["canonical_body_sha256"] == SOURCE54_BANK_BODY_SHA256
            and identity["producer_compiler_replay_sha256"]
            == identity["canonical_body_sha256"]
            and _digest(
                identity["package_file_sha256"],
                "source-order bank package-file digest is malformed",
            )
            == SOURCE54_BANK_FILE_SHA256,
            "receipt source-order bank identity is not triply bound",
        )
    return identity


def _make_receipt(
    *,
    packet: RunPacket,
    result: DriverResult,
    journal: DurableAttemptJournal,
    client: _StrictBoundIdentityClient,
    semantic: Mapping[str, Any],
) -> dict[str, Any]:
    _require(
        result.outcome in {STRUCTURAL_SAT, DISCOVERY_UNSAT, ERROR},
        "unexpected driver outcome",
    )
    evidence = _journal_evidence(journal)
    _require(
        evidence["terminal_record_sha256"] == result.terminal_record_sha256
        and evidence["seal_sha256"] == result.seal_sha256,
        "driver result disagrees with the durable journal",
    )
    _require(
        semantic["model_response_sha256"] == evidence["terminal_model_sha256"],
        "semantic replay does not bind the archived model",
    ) if result.outcome == STRUCTURAL_SAT else None
    unsigned: dict[str, Any] = {
        "schema": RUN_RECEIPT_SCHEMA,
        "packet_id": packet.packet_id,
        "package_artifact_sha256": dict(sorted(packet.package_artifact_sha256.items())),
        "package_identity_sha256": sha256_json(
            dict(sorted(packet.package_artifact_sha256.items()))
        ),
        "package_wave_manifest_file_sha256": sha256_bytes(packet.package_wave_manifest),
        "execution_wave_manifest_sha256": wave_manifest_sha256(packet.wave_manifest),
        "producer_manifest_file_sha256": packet.producer_manifest_file_sha256,
        "producer_manifest_canonical_body_sha256": packet.producer_manifest_canonical_body_sha256,
        "source_order_bank_identity": _source_bank_receipt_identity(packet),
        "job_identity": evidence["prepared_job_identity"],
        "terminal_status": evidence["terminal_lifecycle_status"],
        "terminal_result": evidence["terminal_solver_result"],
        "terminal_outcome": result.outcome,
        "journal": evidence,
        "solver_process_attestation": _attestation(client),
        "sat_semantic_replay": dict(semantic),
        "claims": dict(_FALSE_CLAIMS),
    }
    unsigned["receipt_sha256"] = sha256_json(unsigned)
    return unsigned


def validate_run_receipt(
    receipt_path: Path, *, packet: RunPacket, journal_path: Path
) -> Mapping[str, Any]:
    """Re-authenticate the immutable receipt and its journal/artifact closure."""

    _validate_packet(packet)
    raw = _capture_path(receipt_path, maximum_bytes=8 * 1024 * 1024)
    receipt = _strict_json(raw.rstrip(b"\n"), source="run receipt")
    _require(
        canonical_json_bytes(receipt) + b"\n" == raw, "run receipt is not canonical"
    )
    unsigned = dict(receipt)
    recorded = unsigned.pop("receipt_sha256", None)
    _require(recorded == sha256_json(unsigned), "run receipt self-hash mismatch")
    _require(
        set(receipt)
        == {
            "schema",
            "packet_id",
            "package_artifact_sha256",
            "package_identity_sha256",
            "package_wave_manifest_file_sha256",
            "execution_wave_manifest_sha256",
            "producer_manifest_file_sha256",
            "producer_manifest_canonical_body_sha256",
            "source_order_bank_identity",
            "job_identity",
            "terminal_status",
            "terminal_result",
            "terminal_outcome",
            "journal",
            "solver_process_attestation",
            "sat_semantic_replay",
            "claims",
            "receipt_sha256",
        },
        "run receipt fields drifted",
    )
    _require(receipt["schema"] == RUN_RECEIPT_SCHEMA, "wrong run receipt schema")
    _require(receipt["packet_id"] == packet.packet_id, "receipt packet mismatch")
    inventory = dict(sorted(packet.package_artifact_sha256.items()))
    _require(
        receipt["package_artifact_sha256"] == inventory
        and receipt["package_identity_sha256"] == sha256_json(inventory),
        "receipt package identity mismatch",
    )
    _require(
        receipt["package_wave_manifest_file_sha256"]
        == sha256_bytes(packet.package_wave_manifest)
        and receipt["execution_wave_manifest_sha256"]
        == wave_manifest_sha256(packet.wave_manifest)
        and receipt["producer_manifest_file_sha256"]
        == packet.producer_manifest_file_sha256
        and receipt["producer_manifest_canonical_body_sha256"]
        == packet.producer_manifest_canonical_body_sha256,
        "receipt manifest digest mismatch",
    )
    _require(
        receipt["source_order_bank_identity"] == _source_bank_receipt_identity(packet),
        "receipt source-order bank identity mismatch",
    )
    _require(
        receipt["claims"] == _FALSE_CLAIMS, "receipt contains a positive closure claim"
    )
    job = receipt["job_identity"]
    _require(
        type(job) is dict and set(job) == set(_null_job_identity()),
        "job identity fields drifted",
    )
    expected_identity = raw_dimacs_identity(
        backend="cadical",
        solver_profile="sat",
        cnf_sha256=sha256_bytes(packet.cnf),
        producer_manifest_sha256=sha256_bytes(packet.producer_manifest),
        requested_core_limit=REQUESTED_CORE_LIMIT,
    )
    variables, clauses = scan_dimacs(packet.cnf)
    _require(
        job
        == {
            "job_id": job["job_id"],
            "backend": "cadical",
            "solver_profile": "sat",
            "cnf_blob_hash": sha256_bytes(packet.cnf),
            "identity_hash": expected_identity,
            "num_variables": variables,
            "num_clauses": clauses,
            "existing": job["existing"],
            "requested_core_limit": REQUESTED_CORE_LIMIT,
        }
        and type(job["job_id"]) is str
        and bool(job["job_id"])
        and type(job["existing"]) is bool,
        "receipt job identity is not the bound PIQD job",
    )
    attestation = receipt["solver_process_attestation"]
    _require(
        type(attestation) is dict
        and set(attestation)
        == {
            "requested_core_limit",
            "prepared_requested_core_limit",
            "terminal_requested_core_limit",
            "terminal_attested_solver_processes",
            "terminal_attestation_basis",
            "solver_process_attestation_accepted",
            "no_solver_run_state_accepted",
            "os_affinity_attested",
            "os_thread_limit_attested",
            "os_cpuset_limit_attested",
            "os_core_enforcement_attested",
        }
        and attestation["requested_core_limit"] == REQUESTED_CORE_LIMIT
        and attestation["prepared_requested_core_limit"] == REQUESTED_CORE_LIMIT
        and attestation["os_affinity_attested"] is False
        and attestation["os_thread_limit_attested"] is False
        and attestation["os_cpuset_limit_attested"] is False
        and attestation["os_core_enforcement_attested"] is False,
        "receipt overstates process/core enforcement",
    )
    if receipt["terminal_status"] == "completed":
        _require(
            attestation["solver_process_attestation_accepted"] is True
            and attestation["no_solver_run_state_accepted"] is False
            and attestation["terminal_requested_core_limit"] == REQUESTED_CORE_LIMIT
            and attestation["terminal_attested_solver_processes"]
            == ATTESTED_SOLVER_PROCESSES
            and attestation["terminal_attestation_basis"] == ATTESTATION_BASIS,
            "completed receipt has invalid serial attestation",
        )
    elif receipt["terminal_status"] == "failed":
        _require(
            receipt["terminal_result"] == "UNKNOWN"
            and attestation["solver_process_attestation_accepted"] is False
            and attestation["no_solver_run_state_accepted"] is True
            and attestation["terminal_requested_core_limit"] == REQUESTED_CORE_LIMIT
            and attestation["terminal_attested_solver_processes"] is None
            and attestation["terminal_attestation_basis"] is None,
            "failed receipt violates current no-solver contract",
        )
    else:
        raise Source54RunnerError("receipt lacks a terminal daemon status")
    journal = DurableAttemptJournal(journal_path, manifest=packet.wave_manifest)
    evidence = _journal_evidence(journal)
    _require(receipt["journal"] == evidence, "receipt journal evidence mismatch")
    _require(job == evidence["prepared_job_identity"], "receipt job/journal mismatch")
    _require(
        receipt["terminal_status"] == evidence["terminal_lifecycle_status"]
        and receipt["terminal_result"] == evidence["terminal_solver_result"]
        and receipt["terminal_outcome"] == journal.records[-1]["outcome"],
        "receipt terminal result mismatch",
    )
    semantic = receipt["sat_semantic_replay"]
    _require(
        type(semantic) is dict
        and set(semantic)
        == {
            "performed",
            "model_response_sha256",
            "variable_map_sha256",
            "base_cube",
            "base_cube_sha256",
            "complete_total_assignment",
            "every_clause_satisfied",
            "one_choice_per_center",
            "source_faithful_gate",
            "cell8_semantic_gate",
        }
        and semantic["variable_map_sha256"]
        == sha256_bytes(canonical_json_bytes(dict(packet.variable_map))),
        "semantic replay fields or variable-map binding drifted",
    )
    if receipt["terminal_outcome"] == STRUCTURAL_SAT:
        _require(
            receipt["terminal_status"] == "completed"
            and receipt["terminal_result"] == "SAT"
            and semantic["performed"] is True
            and semantic["complete_total_assignment"] is True
            and semantic["every_clause_satisfied"] is True
            and semantic["one_choice_per_center"] is True
            and semantic["source_faithful_gate"] is True
            and semantic["cell8_semantic_gate"] is True
            and semantic["model_response_sha256"] == evidence["terminal_model_sha256"]
            and semantic["base_cube_sha256"] == sha256_json(semantic["base_cube"]),
            "SAT receipt lacks complete semantic replay",
        )
    else:
        _require(
            semantic["performed"] is False
            and semantic["model_response_sha256"] is None
            and semantic["base_cube"] is None,
            "non-SAT receipt contains SAT semantic evidence",
        )
    expected_outcome = {
        ("completed", "SAT"): STRUCTURAL_SAT,
        ("completed", "UNSAT"): DISCOVERY_UNSAT,
        ("completed", "UNKNOWN"): ERROR,
        ("failed", "UNKNOWN"): ERROR,
    }.get((receipt["terminal_status"], receipt["terminal_result"]))
    _require(
        expected_outcome == receipt["terminal_outcome"],
        "terminal daemon result and driver outcome disagree",
    )
    return receipt


def _run_packet(
    packet: RunPacket,
    *,
    client: _PiqdClient,
    journal_path: Path,
    receipt_path: Path,
    semantic_validator: Callable[[tuple[int, ...]], Mapping[str, Sequence[int]]],
    max_polls: int = 300,
    poll_interval_s: float = 2.0,
    solver_timeout_s: int = 900,
    march_timeout_s: int = 900,
) -> Source54Run:
    _validate_packet(packet)
    _require(
        journal_path.parent == receipt_path.parent,
        "journal and receipt need one run directory",
    )
    _require(
        os.path.abspath(journal_path) != os.path.abspath(receipt_path),
        "journal and receipt paths coincide",
    )
    parent_fd = _open_directory_nofollow(journal_path.parent)
    reserved_owned = False
    reserved_names = (
        journal_path.name,
        f"{journal_path.name}.artifacts",
        f"{journal_path.name}.seal.json",
        f"{journal_path.name}.lock",
        receipt_path.name,
    )
    try:
        _require(
            all(
                name not in {"", ".", ".."} and Path(name).name == name
                for name in reserved_names
            )
            and len(set(reserved_names)) == len(reserved_names),
            "run output names are unsafe or collide",
        )
        parent_anchor = _directory_anchor(os.fstat(parent_fd))
        capability_root = _descriptor_rooted_directory(parent_fd)
        _require_directory_binding(journal_path.parent, parent_anchor)
        _require(
            not any(_entry_exists_at(parent_fd, name) for name in reserved_names),
            "run paths are not create-once",
        )
        reserved_owned = True
        capability_journal = capability_root / journal_path.name
        capability_receipt = capability_root / receipt_path.name
        strict_client = _StrictBoundIdentityClient(client)
        policy = DriverPolicy(
            max_prepare_attempts=1,
            max_confirm_attempts=1,
            max_result_attempts=1,
            max_polls=max_polls,
            poll_interval_s=poll_interval_s,
            solver_timeout_s=solver_timeout_s,
            march_timeout_s=march_timeout_s,
            project="erdos-97-96-formalization",
            requested_core_limit=REQUESTED_CORE_LIMIT,
        )
        journal = DurableAttemptJournal(
            capability_journal, manifest=packet.wave_manifest
        )
        driver = PiqdCegarDriver(
            client=strict_client,
            journal=journal,
            policy=policy,
            proof_replayer=None,
            sleep=lambda seconds: (
                None if poll_interval_s == 0 else __import__("time").sleep(seconds)
            ),
        )
        result = driver.run(
            wave_manifest=packet.wave_manifest,
            cnf=packet.cnf,
            producer_manifest=packet.producer_manifest,
        )
        reopened = DurableAttemptJournal(
            capability_journal, manifest=packet.wave_manifest
        )
        semantic = _semantic_evidence(
            packet=packet,
            result=result,
            client=strict_client,
            validator=semantic_validator,
        )
        receipt = _make_receipt(
            packet=packet,
            result=result,
            journal=reopened,
            client=strict_client,
            semantic=semantic,
        )
        _write_immutable_at(
            parent_fd, receipt_path.name, canonical_json_bytes(receipt) + b"\n"
        )
        validated = validate_run_receipt(
            capability_receipt,
            packet=packet,
            journal_path=capability_journal,
        )
        _require_directory_binding(journal_path.parent, parent_anchor)
        return Source54Run(result, validated, receipt_path)
    except Exception as exc:
        if reserved_owned and not _cleanup_reserved_outputs(parent_fd, reserved_names):
            raise Source54RunnerError(
                "run failed and descriptor-owned output cleanup was refused"
            ) from exc
        raise
    finally:
        os.close(parent_fd)


def run_source54(
    package_dir: Path,
    *,
    repo_root: Path,
    client: _PiqdClient,
    journal_path: Path,
    receipt_path: Path,
    max_polls: int = 300,
    poll_interval_s: float = 2.0,
) -> Source54Run:
    """Run the fully validated package and replay any SAT model semantically."""

    packet = packet_from_package(load_package(package_dir))
    rebuilt = None

    def validate(assignment: tuple[int, ...]) -> Mapping[str, Sequence[int]]:
        nonlocal rebuilt
        if rebuilt is None:
            rebuilt = reconstruct_checkpoint(repo_root)
            _require(
                rebuilt.cnf_bytes == packet.cnf, "reconstructed source54 CNF drifted"
            )
        return decode_and_validate_model(rebuilt, packet.variable_map, assignment)

    return _run_packet(
        packet,
        client=client,
        journal_path=journal_path,
        receipt_path=receipt_path,
        semantic_validator=validate,
        max_polls=max_polls,
        poll_interval_s=poll_interval_s,
    )


def main(argv: Sequence[str] | None = None) -> int:
    import argparse

    from census.p97_search.phase3_piqd_oracle import PiqdRawDimacsClient

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("package_dir", type=Path)
    parser.add_argument("repo_root", type=Path)
    parser.add_argument("run_dir", type=Path)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    args = parser.parse_args(argv)
    try:
        run = run_source54(
            args.package_dir,
            repo_root=args.repo_root,
            client=PiqdRawDimacsClient(args.base_url),
            journal_path=args.run_dir / "attempts.jsonl",
            receipt_path=args.run_dir / "receipt.json",
        )
    except (Source54RunnerError, PiqdOracleError) as exc:
        print(f"source54 runner failed closed: {exc}")
        return 2
    print(json.dumps(run.receipt, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
