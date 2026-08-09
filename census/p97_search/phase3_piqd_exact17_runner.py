"""Strict PIQD gate-2 runner for the authenticated exact-17 ingress packet.

This module deliberately produces observational evidence only.  In particular,
the selected packet has no source-variable semantics and its single-order result
cannot imply aggregate coverage or theorem closure.
"""

from __future__ import annotations

import argparse
import json
import os
import stat
import sys
from collections.abc import Mapping, Sequence
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
    PiqdDriverError,
)
from census.p97_search.phase3_piqd_oracle import (
    CheckedModel,
    PiqdOracleError,
    PreparedJob,
    raw_dimacs_identity,
    scan_dimacs,
)

RUN_RECEIPT_SCHEMA = "p97-phase3-piqd-exact17-run-receipt/v1"
SOURCE_SEMANTICS = "UNAVAILABLE_OPAQUE_VARIABLE_MAP"
WAVE_ID = "p97-exact17-v12t-order0-canary"
REQUESTED_CORE_LIMIT = 1
ATTESTED_SOLVER_PROCESSES = 1
ATTESTATION_BASIS = "SINGLE_PROCESS_NO_PARALLEL_FLAG"

PACKAGE_FILES = (
    "discovery.cnf",
    "structural-roundtrip.cnf",
    "upstream-manifest.json",
    "validation-report.json",
    "ingress-identity.json",
    "variable-map.json",
    "order.json",
    "producer-manifest.json",
    "wave-manifest.json",
    "package-result.json",
)
_CANONICAL_JSON_FILES = frozenset(
    {
        "ingress-identity.json",
        "variable-map.json",
        "order.json",
        "producer-manifest.json",
        "wave-manifest.json",
        "package-result.json",
    }
)
_JSON_FILES = frozenset(name for name in PACKAGE_FILES if name.endswith(".json"))
_MAXIMUM_BYTES = {
    "discovery.cnf": 256 * 1024 * 1024,
    "structural-roundtrip.cnf": 256 * 1024 * 1024,
    **{name: 8 * 1024 * 1024 for name in _JSON_FILES},
}
_HEX = frozenset("0123456789abcdef")


class Exact17RunnerError(RuntimeError):
    """The package, run, or receipt failed a strict gate."""


@dataclass(frozen=True)
class ExpectedPackageIdentity:
    cnf_sha256: str
    cnf_bytes: int
    num_variables: int
    num_clauses: int
    structural_cnf_sha256: str
    structural_cnf_bytes: int
    structural_num_variables: int
    structural_num_clauses: int
    upstream_manifest_sha256: str
    validation_report_sha256: str


SELECTED_V12T = ExpectedPackageIdentity(
    cnf_sha256="62de9fb9e20d13ff256f59aa20d5044f55bc17f9adbce8204564d486adfc75fb",
    cnf_bytes=95_933_857,
    num_variables=74_813,
    num_clauses=2_504_349,
    structural_cnf_sha256="884029ff0a06830273a71c650e70e1fa6530a088fabd04d8d83884c56bcdaf98",
    structural_cnf_bytes=4_160_204,
    structural_num_variables=285,
    structural_num_clauses=145_975,
    upstream_manifest_sha256="940bd8aa727f144973840c5fa69ea968a5942a8be4ef695acb25eb7224c86572",
    validation_report_sha256="ee7bbde2ce02fce6c3e2ced5e3ea26075b747e528e9b439b2fd26e057b3907bd",
)


@dataclass(frozen=True)
class Exact17Package:
    directory: Path
    files: Mapping[str, bytes]
    hashes: Mapping[str, str]
    documents: Mapping[str, Mapping[str, Any]]
    num_variables: int
    num_clauses: int

    @property
    def cnf(self) -> bytes:
        return self.files["discovery.cnf"]

    @property
    def producer_bytes(self) -> bytes:
        return self.files["producer-manifest.json"]

    @property
    def wave(self) -> Mapping[str, Any]:
        return self.documents["wave-manifest.json"]


@dataclass(frozen=True)
class RunPacket:
    packet_id: str
    cnf: bytes
    producer_manifest: bytes
    wave_manifest: Mapping[str, Any]
    package_hashes: Mapping[str, str]
    exact17_package: bool


@dataclass(frozen=True)
class Exact17Run:
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


def _strict_json(raw: bytes, *, source: str) -> Mapping[str, Any]:
    def duplicate_pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate object key {key!r}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw,
            object_pairs_hook=duplicate_pairs,
            parse_constant=lambda value: (_ for _ in ()).throw(
                ValueError(f"non-finite JSON value {value}")
            ),
        )
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
    ) as exc:
        raise Exact17RunnerError(f"{source} is not strict JSON") from exc
    if not isinstance(value, Mapping):
        raise Exact17RunnerError(f"{source} must contain one JSON object")
    return dict(value)


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
    descriptor = os.open("/", os.O_RDONLY | os.O_DIRECTORY)
    try:
        for component in absolute.parts[1:]:
            if component in {"", ".", ".."}:
                raise Exact17RunnerError("package path has an unsafe component")
            child = os.open(
                component,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=descriptor,
            )
            os.close(descriptor)
            descriptor = child
        return descriptor
    except OSError as exc:
        os.close(descriptor)
        raise Exact17RunnerError(
            "package directory is missing, unsafe, or a symlink"
        ) from exc
    except Exception:
        os.close(descriptor)
        raise


def _capture_file(
    directory_fd: int,
    name: str,
    *,
    maximum_bytes: int | None = None,
) -> bytes:
    flags = os.O_RDONLY | os.O_NONBLOCK | os.O_NOFOLLOW
    try:
        descriptor = os.open(name, flags, dir_fd=directory_fd)
    except OSError as exc:
        raise Exact17RunnerError(f"cannot safely open package artifact {name}") from exc
    try:
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode) or before.st_nlink != 1:
            raise Exact17RunnerError(
                f"package artifact {name} is not a private regular file"
            )
        limit = maximum_bytes if maximum_bytes is not None else _MAXIMUM_BYTES[name]
        if before.st_size <= 0 or before.st_size > limit:
            raise Exact17RunnerError(f"package artifact {name} has a forbidden size")
        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(descriptor, min(1024 * 1024, limit + 1 - total))
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
            if total > limit:
                raise Exact17RunnerError(
                    f"package artifact {name} exceeds its size bound"
                )
        after = os.fstat(descriptor)
        pathname = os.stat(name, dir_fd=directory_fd, follow_symlinks=False)
        if _file_identity(before) != _file_identity(after):
            raise Exact17RunnerError(f"package artifact {name} changed while read")
        if _file_identity(after) != _file_identity(pathname):
            raise Exact17RunnerError(
                f"package artifact {name} was substituted while read"
            )
        payload = b"".join(chunks)
        if len(payload) != after.st_size:
            raise Exact17RunnerError(f"package artifact {name} was only partly read")
        return payload
    finally:
        os.close(descriptor)


def _snapshot_package(path: Path) -> dict[str, bytes]:
    directory_fd = _open_directory_nofollow(path)
    try:
        before = os.fstat(directory_fd)
        names = os.listdir(directory_fd)
        if set(names) != set(PACKAGE_FILES) or len(names) != len(PACKAGE_FILES):
            raise Exact17RunnerError(
                "package must contain exactly the ten v1 artifacts"
            )
        files = {name: _capture_file(directory_fd, name) for name in PACKAGE_FILES}
        if set(os.listdir(directory_fd)) != set(PACKAGE_FILES):
            raise Exact17RunnerError("package directory changed while read")
        after = os.fstat(directory_fd)
        if _file_identity(before) != _file_identity(after):
            raise Exact17RunnerError("package directory changed while read")
        return files
    finally:
        os.close(directory_fd)


def _require(value: bool, detail: str) -> None:
    if not value:
        raise Exact17RunnerError(detail)


def _digest(value: Any, label: str) -> str:
    _require(
        isinstance(value, str) and len(value) == 64 and set(value).issubset(_HEX),
        f"{label} is not a lowercase SHA-256 digest",
    )
    return str(value)


def _at(value: Any, *keys: str) -> Any:
    current = value
    for key in keys:
        if not isinstance(current, Mapping) or key not in current:
            raise Exact17RunnerError(f"missing cross-binding {'.'.join(keys)}")
        current = current[key]
    return current


def load_exact17_package(
    package_dir: Path,
    *,
    _expected: ExpectedPackageIdentity = SELECTED_V12T,
) -> Exact17Package:
    """Capture and authenticate an exact-17 package without following links."""

    files = _snapshot_package(package_dir)
    hashes = {name: sha256_bytes(payload) for name, payload in files.items()}
    documents = {name: _strict_json(files[name], source=name) for name in _JSON_FILES}
    for name in _CANONICAL_JSON_FILES:
        _require(
            canonical_json_bytes(documents[name]) == files[name],
            f"{name} is not canonical JSON",
        )

    num_variables, num_clauses = scan_dimacs(files["discovery.cnf"])
    structural_vars, structural_clauses = scan_dimacs(files["structural-roundtrip.cnf"])
    _require(num_variables > 0 and num_clauses > 0, "discovery CNF is vacuous")
    _require(
        structural_vars > 0 and structural_clauses > 0,
        "structural roundtrip CNF is vacuous",
    )
    _require(
        (
            hashes["discovery.cnf"],
            len(files["discovery.cnf"]),
            num_variables,
            num_clauses,
        )
        == (
            _expected.cnf_sha256,
            _expected.cnf_bytes,
            _expected.num_variables,
            _expected.num_clauses,
        ),
        "discovery CNF is not the selected exact identity",
    )
    _require(
        (
            hashes["structural-roundtrip.cnf"],
            len(files["structural-roundtrip.cnf"]),
            structural_vars,
            structural_clauses,
        )
        == (
            _expected.structural_cnf_sha256,
            _expected.structural_cnf_bytes,
            _expected.structural_num_variables,
            _expected.structural_num_clauses,
        ),
        "structural CNF is not the selected exact identity",
    )
    _require(
        hashes["upstream-manifest.json"] == _expected.upstream_manifest_sha256,
        "upstream manifest is not the selected exact identity",
    )
    _require(
        hashes["validation-report.json"] == _expected.validation_report_sha256,
        "validation report is not the selected exact identity",
    )

    upstream = documents["upstream-manifest.json"]
    validation = documents["validation-report.json"]
    ingress = documents["ingress-identity.json"]
    variable_map = documents["variable-map.json"]
    order = documents["order.json"]
    producer = documents["producer-manifest.json"]
    wave = documents["wave-manifest.json"]
    result = documents["package-result.json"]

    _require(
        upstream.get("schema")
        == "p97-rigid221-exact17-source-faithful-boolean-cnf-transitive-two-circle-candidate-v4",
        "wrong upstream schema",
    )
    _require(
        upstream.get("transitive_two_circle") is True, "upstream gate is nontransitive"
    )
    _require(
        upstream.get("cnf_sha256") == hashes["discovery.cnf"],
        "upstream CNF hash mismatch",
    )
    _require(
        upstream.get("variables") == num_variables, "upstream variable count mismatch"
    )
    _require(upstream.get("clauses") == num_clauses, "upstream clause count mismatch")
    _require(validation.get("status") == "PASS", "validation gate is not PASS")
    _require(
        validation.get("candidate_cnf_sha256") == hashes["discovery.cnf"],
        "validation CNF mismatch",
    )
    _require(
        validation.get("candidate_manifest_sha256") == hashes["upstream-manifest.json"],
        "validation manifest mismatch",
    )
    _require(
        validation.get("structural_cnf_sha256") == hashes["structural-roundtrip.cnf"],
        "validation structural CNF mismatch",
    )
    _require(
        validation.get("candidate_exact_regeneration") == "PASS",
        "exact regeneration gate is not PASS",
    )
    _require(
        validation.get("cadical_model_roundtrip") == "PASS",
        "structural roundtrip gate is not PASS",
    )

    _require(
        ingress.get("schema") == "p97-phase3-piqd-exact17-ingress/v1",
        "wrong ingress schema",
    )
    for field, name in {
        "cnf_sha256": "discovery.cnf",
        "structural_cnf_sha256": "structural-roundtrip.cnf",
        "upstream_manifest_sha256": "upstream-manifest.json",
        "validation_report_sha256": "validation-report.json",
        "order_sha256": "order.json",
    }.items():
        _require(ingress.get(field) == hashes[name], f"ingress {field} mismatch")
    _require(
        order.get("schema") == "p97-phase3-piqd-exact17-order/v1", "wrong order schema"
    )
    _require(order.get("order_index") == 0, "runner accepts only order zero")
    _require(
        order.get("aggregate_order_case_coverage") is False,
        "order makes an aggregate coverage claim",
    )
    _require(
        variable_map.get("schema") == "p97-phase3-piqd-variable-map/v1",
        "wrong variable-map schema",
    )
    _require(
        variable_map.get("semantic_status") == "PARTIAL_OPAQUE_VARIABLE_MAP",
        "variable map is not explicitly opaque",
    )
    _require(
        variable_map.get("num_variables") == num_variables,
        "variable-map count mismatch",
    )
    _require(
        _at(variable_map, "coverage", "full_variable_map_custody") is False,
        "variable map claims full custody",
    )

    _require(
        producer.get("schema") == "p97-phase3-piqd-producer/v1", "wrong producer schema"
    )
    claims = _at(producer, "provenance", "claims")
    for field in (
        "complete_manifest_report_cross_binding",
        "current_executable_producer_byte_provenance",
        "full_variable_map_custody",
        "source_entitlement",
        "aggregate_order_case_coverage",
        "universal_lift",
        "theorem_closure",
        "daemon_attestation",
    ):
        _require(_at(claims, field) is False, f"producer claim {field} must be false")
    artifact_bindings = _at(producer, "artifacts")
    for field, name in {
        "cnf": "discovery.cnf",
        "structural_cnf": "structural-roundtrip.cnf",
        "upstream_manifest": "upstream-manifest.json",
        "validation_report": "validation-report.json",
        "ingress_identity": "ingress-identity.json",
        "variable_map": "variable-map.json",
        "order": "order.json",
    }.items():
        _require(
            _at(artifact_bindings, field, "sha256") == hashes[name],
            f"producer {field} hash mismatch",
        )

    try:
        validate_wave_manifest(wave)
    except Exception as exc:
        raise Exact17RunnerError("wave manifest failed its contract") from exc
    execution = _at(wave, "execution")
    _require(wave.get("wave_id") == WAVE_ID, "wrong exact17 wave id")
    _require(execution.get("backend") == "cadical", "runner requires cadical")
    _require(execution.get("solver_profile") == "sat", "runner requires sat profile")
    _require(
        execution.get("shard_id") == 0 and execution.get("shard_count") == 1,
        "runner requires shard 0/1",
    )
    _require(execution.get("seed") == 97, "runner requires seed 97")
    encoding = _at(wave, "encoding")
    for field, expected_value in {
        "cnf_sha256": hashes["discovery.cnf"],
        "variable_map_sha256": hashes["variable-map.json"],
        "producer_manifest_sha256": hashes["producer-manifest.json"],
        "num_variables": num_variables,
        "num_clauses": num_clauses,
    }.items():
        _require(
            encoding.get(field) == expected_value, f"wave encoding {field} mismatch"
        )
    _require(
        execution.get("order_sha256") == hashes["order.json"], "wave order mismatch"
    )

    _require(
        result.get("schema") == "p97-phase3-piqd-exact17-package-result/v1",
        "wrong package-result schema",
    )
    result_artifacts = _at(result, "artifacts")
    result_names = {
        "cnf_sha256": "discovery.cnf",
        "structural_cnf_sha256": "structural-roundtrip.cnf",
        "upstream_manifest_sha256": "upstream-manifest.json",
        "validation_report_sha256": "validation-report.json",
        "ingress_identity_sha256": "ingress-identity.json",
        "variable_map_sha256": "variable-map.json",
        "order_sha256": "order.json",
        "producer_manifest_sha256": "producer-manifest.json",
        "wave_manifest_sha256": "wave-manifest.json",
    }
    for field, name in result_names.items():
        _require(
            result_artifacts.get(field) == hashes[name],
            f"package-result {field} mismatch",
        )
    _require(_at(result, "claims") == claims, "package and producer claims disagree")

    return Exact17Package(
        directory=Path(os.path.abspath(package_dir)),
        files=files,
        hashes=hashes,
        documents=documents,
        num_variables=num_variables,
        num_clauses=num_clauses,
    )


class _StrictBoundIdentityClient:
    """One-job proxy adding checks that the generic driver cannot express."""

    def __init__(self, delegate: _PiqdClient) -> None:
        self.delegate = delegate
        self.observed_job: PreparedJob | None = None
        self._confirmed = False
        self.terminal_status: Mapping[str, Any] | None = None
        self.terminal_attestation_accepted = False
        self.terminal_no_solver_state_accepted = False

    def prepare_cnf(self, **kwargs: Any) -> PreparedJob:
        if self.observed_job is not None:
            raise PiqdOracleError("exact17 runner permits only one prepared job")
        requested_limit = kwargs.get("requested_core_limit")
        if type(requested_limit) is not int or requested_limit != REQUESTED_CORE_LIMIT:
            raise PiqdOracleError(
                "exact17 driver did not request requested_core_limit=1"
            )
        job = self.delegate.prepare_cnf(**kwargs)
        self.observed_job = job
        if type(job.existing) is not bool:
            raise PiqdOracleError(
                "PIQD prepare response has a non-Boolean existing flag"
            )
        if job.backend != "cadical" or job.solver_profile != "sat":
            raise PiqdOracleError("PIQD prepared the wrong backend or profile")
        prepared_limit = getattr(job, "requested_core_limit", None)
        if type(prepared_limit) is not int or prepared_limit != REQUESTED_CORE_LIMIT:
            raise PiqdOracleError(
                "PIQD prepare response did not attest requested_core_limit=1"
            )
        return job

    def _same_job(self, job: PreparedJob) -> None:
        if self.observed_job is None or job != self.observed_job:
            raise PiqdOracleError("PIQD operation refers to an unbound job")

    def confirm(self, job: PreparedJob, *, expected_cnf: bytes) -> str:
        self._same_job(job)
        state = self.delegate.confirm(job, expected_cnf=expected_cnf)
        if state not in {"confirmed", "running", "completed", "failed"}:
            raise PiqdOracleError("PIQD returned an invalid confirm state")
        self._confirmed = state != "failed"
        return state

    def status(self, job_id: str) -> Mapping[str, Any]:
        if self.observed_job is None or job_id != self.observed_job.job_id:
            raise PiqdOracleError("PIQD status requested for an unbound job")
        payload = self.delegate.status(job_id)
        if payload.get("id") != job_id:
            raise PiqdOracleError("PIQD returned a stale or foreign status response")
        state = payload.get("status")
        if self._confirmed and state == "prepared":
            raise PiqdOracleError("PIQD status regressed to stale prepared state")
        if state in {"completed", "failed"}:
            self.terminal_status = dict(payload)
        if state == "completed":
            requested_limit = payload.get("requested_core_limit")
            solver_processes = payload.get("attested_solver_processes")
            basis = payload.get("attestation_basis")
            if (
                type(requested_limit) is not int
                or requested_limit != REQUESTED_CORE_LIMIT
            ):
                raise PiqdOracleError(
                    "PIQD terminal status lacks requested_core_limit=1"
                )
            if (
                type(solver_processes) is not int
                or solver_processes != ATTESTED_SOLVER_PROCESSES
            ):
                raise PiqdOracleError(
                    "PIQD terminal status lacks attested_solver_processes=1"
                )
            if type(basis) is not str or basis != ATTESTATION_BASIS:
                raise PiqdOracleError(
                    f"PIQD terminal status lacks attestation_basis={ATTESTATION_BASIS}"
                )
            self.terminal_attestation_accepted = True
        elif state == "failed":
            result = payload.get("result")
            requested_limit = payload.get("requested_core_limit")
            if type(state) is not str:
                raise PiqdOracleError("PIQD failed status is not a built-in string")
            if type(result) is not str or result != "UNKNOWN":
                raise PiqdOracleError(
                    "PIQD failed no-solver status lacks result=UNKNOWN"
                )
            if (
                "requested_core_limit" not in payload
                or type(requested_limit) is not int
                or requested_limit != REQUESTED_CORE_LIMIT
            ):
                raise PiqdOracleError(
                    "PIQD failed no-solver status lacks requested_core_limit=1"
                )
            null_fields = ("attested_solver_processes", "attestation_basis")
            if any(
                field not in payload or payload[field] is not None
                for field in null_fields
            ):
                raise PiqdOracleError(
                    "PIQD failed status lacks the exact null no-solver attestation"
                )
            self.terminal_no_solver_state_accepted = True
        return payload

    def checked_model(self, job: PreparedJob, *, cnf: bytes) -> CheckedModel:
        self._same_job(job)
        checked = self.delegate.checked_model(job, cnf=cnf)
        scan_dimacs(cnf, assignment=checked.assignment)
        _require(
            sha256_bytes(checked.response_body) == checked.response_sha256,
            "model response hash mismatch",
        )
        return checked

    def log(self, job: PreparedJob) -> tuple[bytes, str]:
        self._same_job(job)
        payload, digest = self.delegate.log(job)
        if type(payload) is not bytes or not payload:
            raise PiqdOracleError(
                "PIQD solver log is not a nonempty built-in bytes value"
            )
        if (
            type(digest) is not str
            or len(digest) != 64
            or any(char not in _HEX for char in digest)
        ):
            raise PiqdOracleError(
                "PIQD solver log hash is not a lowercase SHA-256 digest"
            )
        if sha256_bytes(payload) != digest:
            raise PiqdOracleError("PIQD solver log hash mismatch")
        return payload, digest

    def proof(self, job: PreparedJob) -> tuple[bytes, str]:
        self._same_job(job)
        return self.delegate.proof(job)


def _validate_run_packet(packet: RunPacket) -> None:
    try:
        validate_wave_manifest(packet.wave_manifest)
    except Exception as exc:
        raise Exact17RunnerError("run packet has an invalid wave manifest") from exc
    variables, clauses = scan_dimacs(packet.cnf)
    _require(variables > 0 and clauses > 0, "run packet CNF is vacuous")
    encoding = packet.wave_manifest["encoding"]
    execution = packet.wave_manifest["execution"]
    _require(
        encoding["cnf_sha256"] == sha256_bytes(packet.cnf),
        "run packet CNF hash mismatch",
    )
    _require(
        encoding["producer_manifest_sha256"] == sha256_bytes(packet.producer_manifest),
        "run packet producer hash mismatch",
    )
    _require(
        encoding["num_variables"] == variables and encoding["num_clauses"] == clauses,
        "run packet DIMACS dimensions mismatch",
    )
    _require(
        execution["backend"] == "cadical" and execution["solver_profile"] == "sat",
        "run packet requires cadical/sat",
    )
    _require(
        execution["shard_id"] == 0 and execution["shard_count"] == 1,
        "run packet requires shard 0/1",
    )
    _require(execution["seed"] == 97, "run packet requires seed 97")
    _require(bool(packet.package_hashes), "run packet package hash set is empty")
    for name, digest in packet.package_hashes.items():
        _require(isinstance(name, str) and bool(name), "empty package artifact name")
        _digest(digest, f"package hash {name}")


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


def _process_attestation(
    strict_client: _StrictBoundIdentityClient,
) -> Mapping[str, Any]:
    status = strict_client.terminal_status or {}
    return {
        "requested_core_limit": REQUESTED_CORE_LIMIT,
        "prepared_requested_core_limit": (
            getattr(strict_client.observed_job, "requested_core_limit", None)
            if strict_client.observed_job is not None
            else None
        ),
        "terminal_requested_core_limit": status.get("requested_core_limit"),
        "terminal_attested_solver_processes": status.get("attested_solver_processes"),
        "terminal_attestation_basis": status.get("attestation_basis"),
        "solver_process_attestation_accepted": (
            strict_client.terminal_attestation_accepted
        ),
        "no_solver_run_state_accepted": (
            strict_client.terminal_no_solver_state_accepted
        ),
        "os_thread_limit_attested": False,
        "os_cpuset_limit_attested": False,
        "os_core_enforcement_attested": False,
    }


def _capture_path(path: Path, *, maximum_bytes: int) -> bytes:
    parent_fd = _open_directory_nofollow(path.parent)
    try:
        return _capture_file(
            parent_fd,
            path.name,
            maximum_bytes=maximum_bytes,
        )
    finally:
        os.close(parent_fd)


def _journal_evidence(journal: DurableAttemptJournal) -> Mapping[str, Any]:
    journal_raw = _capture_path(journal.path, maximum_bytes=64 * 1024 * 1024)
    seal_raw = _capture_path(journal.seal_path, maximum_bytes=1024 * 1024)
    seal = _strict_json(seal_raw.rstrip(b"\n"), source="journal seal")
    _require(
        canonical_json_bytes(seal) + b"\n" == seal_raw, "journal seal is not canonical"
    )
    terminal = journal.records[-1]
    artifact_hashes = sorted(
        {
            digest
            for record in journal.records
            for digest in record["artifacts"].values()
            if isinstance(digest, str)
        }
    )
    artifact_fd = _open_directory_nofollow(journal.artifact_dir)
    try:
        artifact_payloads: dict[str, bytes] = {}
        for digest in artifact_hashes:
            payload = _capture_file(
                artifact_fd,
                digest,
                maximum_bytes=256 * 1024 * 1024,
            )
            _require(sha256_bytes(payload) == digest, "journal artifact hash mismatch")
            artifact_payloads[digest] = payload
    finally:
        os.close(artifact_fd)
    events: list[Mapping[str, Any]] = []
    for record in journal.records:
        checkpoint = record["artifacts"]["checkpoint_sha256"]
        event = _strict_json(artifact_payloads[checkpoint], source="journal event")
        events.append(event)
    starts = [
        event
        for event in events
        if event.get("phase") == "DRIVER_START"
        and event.get("disposition") == "SUCCESS"
        and isinstance(event.get("response"), Mapping)
    ]
    _require(len(starts) == 1, "journal lacks one durable driver policy")
    requested_core_limit = starts[0]["response"].get("requested_core_limit")
    prepares = [
        event
        for event in events
        if event.get("phase") == "PREPARE"
        and event.get("disposition") == "SUCCESS"
        and isinstance(event.get("response"), Mapping)
    ]
    _require(len(prepares) <= 1, "journal contains multiple successful prepares")
    prepared_identity: Mapping[str, Any] = _null_job_identity()
    if prepares:
        prepared = prepares[0]
        response = prepared["response"]
        prepared_identity = {
            "job_id": prepared.get("job_id"),
            "backend": response.get("backend"),
            "solver_profile": response.get("solver_profile"),
            "cnf_blob_hash": response.get("cnf_blob_hash"),
            "identity_hash": response.get("identity_hash"),
            "num_variables": response.get("num_vars"),
            "num_clauses": response.get("num_clauses"),
            "existing": response.get("existing"),
            "requested_core_limit": requested_core_limit,
        }
    terminal_status_events = [
        event
        for event in events
        if event.get("phase") in {"POLL", "SOLVER_UNKNOWN", "DAEMON_FAILED"}
        and event.get("status") in {"completed", "failed"}
        and isinstance(event.get("response"), Mapping)
        and event["response"].get("status") in {"completed", "failed"}
    ]
    _require(
        len(terminal_status_events) <= 1,
        "journal contains multiple terminal status responses",
    )
    status: Mapping[str, Any] | None = None
    if terminal_status_events:
        terminal_event = terminal_status_events[0]
        response = terminal_event["response"]
        _require(
            response.get("status") == terminal_event.get("status")
            and response.get("result") == terminal_event.get("result"),
            "terminal event envelope and status response disagree",
        )
        status = response
    terminal_solver_log = terminal["artifacts"]["solver_log_sha256"]
    if status is not None and status.get("status") == "completed":
        _require(
            type(terminal_solver_log) is str
            and terminal_solver_log in artifact_payloads,
            "completed terminal record lacks a solver log artifact",
        )
        _require(
            bool(artifact_payloads[terminal_solver_log]),
            "completed terminal solver log artifact is empty",
        )
    elif status is not None and status.get("status") == "failed":
        _require(
            terminal_solver_log is None,
            "failed no-solver terminal record unexpectedly binds a solver log",
        )
    return {
        "journal_sha256": sha256_bytes(journal_raw),
        "journal_record_count": len(journal.records),
        "terminal_record_sha256": terminal["record_sha256"],
        "seal_sha256": seal["seal_sha256"],
        "seal_file_sha256": sha256_bytes(seal_raw),
        "artifact_sha256": artifact_hashes,
        "prepared_job_identity": prepared_identity,
        "terminal_status_canonical_sha256": (
            sha256_json(status) if status is not None else None
        ),
        "terminal_lifecycle_status": (
            status.get("status") if status is not None else None
        ),
        "terminal_solver_result": (
            status.get("result") if status is not None else None
        ),
        "terminal_solver_log_sha256": terminal_solver_log,
        "terminal_status_raw_sha256": None,
        "terminal_status_raw_available": False,
    }


def _make_receipt(
    *,
    packet: RunPacket,
    result: DriverResult,
    journal: DurableAttemptJournal,
    strict_client: _StrictBoundIdentityClient,
) -> dict[str, Any]:
    _require(
        result.outcome in {STRUCTURAL_SAT, DISCOVERY_UNSAT, ERROR},
        "unexpected exact17 terminal outcome",
    )
    evidence = _journal_evidence(journal)
    _require(
        evidence["terminal_record_sha256"] == result.terminal_record_sha256,
        "driver terminal hash disagrees with journal",
    )
    _require(
        evidence["seal_sha256"] == result.seal_sha256,
        "driver seal hash disagrees with journal",
    )
    unsigned: dict[str, Any] = {
        "schema": RUN_RECEIPT_SCHEMA,
        "packet_id": packet.packet_id,
        "wave_manifest_sha256": wave_manifest_sha256(packet.wave_manifest),
        "package_artifact_sha256": dict(sorted(packet.package_hashes.items())),
        "package_identity_sha256": sha256_json(
            dict(sorted(packet.package_hashes.items()))
        ),
        "job_identity": evidence["prepared_job_identity"],
        "terminal_status": evidence["terminal_lifecycle_status"],
        "terminal_result": evidence["terminal_solver_result"],
        "terminal_outcome": result.outcome,
        "journal": evidence,
        "solver_process_attestation": _process_attestation(strict_client),
        "source_semantics": SOURCE_SEMANTICS,
        "claims": {
            "source_semantics_checked": False,
            "source_entitlement": False,
            "complete_source_coverage": False,
            "aggregate_order_case_coverage": False,
            "universal_lift": False,
            "theorem_closure": False,
        },
    }
    unsigned["receipt_sha256"] = sha256_json(unsigned)
    return unsigned


def _write_immutable(path: Path, payload: bytes) -> None:
    parent_fd = _open_directory_nofollow(path.parent)
    try:
        flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW
        try:
            descriptor = os.open(path.name, flags, 0o600, dir_fd=parent_fd)
        except OSError as exc:
            raise Exact17RunnerError(
                "receipt path already exists or is unsafe"
            ) from exc
        try:
            offset = 0
            while offset < len(payload):
                written = os.write(descriptor, payload[offset:])
                if written <= 0:
                    raise Exact17RunnerError("short receipt write")
                offset += written
            os.fsync(descriptor)
        finally:
            os.close(descriptor)
        os.fsync(parent_fd)
        snapshot = _capture_file(
            parent_fd,
            path.name,
            maximum_bytes=8 * 1024 * 1024,
        )
        _require(snapshot == payload, "installed receipt bytes changed")
    finally:
        os.close(parent_fd)


def validate_run_receipt(
    receipt_path: Path,
    *,
    packet: RunPacket,
    journal_path: Path,
) -> Mapping[str, Any]:
    """Re-authenticate a receipt and all durable journal bindings."""

    _validate_run_packet(packet)
    raw = _capture_path(receipt_path, maximum_bytes=8 * 1024 * 1024)
    receipt = _strict_json(raw.rstrip(b"\n"), source="run receipt")
    _require(
        canonical_json_bytes(receipt) + b"\n" == raw, "run receipt is not canonical"
    )
    unsigned = dict(receipt)
    recorded = unsigned.pop("receipt_sha256", None)
    _require(recorded == sha256_json(unsigned), "run receipt self-hash mismatch")
    expected_receipt_keys = {
        "schema",
        "packet_id",
        "wave_manifest_sha256",
        "package_artifact_sha256",
        "package_identity_sha256",
        "job_identity",
        "terminal_status",
        "terminal_result",
        "terminal_outcome",
        "journal",
        "solver_process_attestation",
        "source_semantics",
        "claims",
        "receipt_sha256",
    }
    _require(set(receipt) == expected_receipt_keys, "run receipt keys changed")
    _require(receipt.get("schema") == RUN_RECEIPT_SCHEMA, "wrong run receipt schema")
    _require(receipt.get("packet_id") == packet.packet_id, "receipt packet id mismatch")
    _require(
        receipt.get("wave_manifest_sha256")
        == wave_manifest_sha256(packet.wave_manifest),
        "receipt wave mismatch",
    )
    _require(
        receipt.get("package_artifact_sha256")
        == dict(sorted(packet.package_hashes.items())),
        "receipt package hash mismatch",
    )
    _require(
        receipt.get("package_identity_sha256")
        == sha256_json(dict(sorted(packet.package_hashes.items()))),
        "receipt package identity mismatch",
    )
    job_identity = _at(receipt, "job_identity")
    _require(type(job_identity) is dict, "receipt job identity is not an object")
    expected_job_keys = set(_null_job_identity())
    _require(
        set(job_identity) == expected_job_keys, "receipt job identity keys changed"
    )
    if all(value is None for value in job_identity.values()):
        pass
    else:
        _require(
            type(job_identity["job_id"]) is str and bool(job_identity["job_id"]),
            "receipt job id is not a nonempty built-in string",
        )
        _require(
            job_identity["backend"] == "cadical"
            and type(job_identity["backend"]) is str
            and job_identity["solver_profile"] == "sat"
            and type(job_identity["solver_profile"]) is str,
            "receipt job backend/profile mismatch",
        )
        for field in ("cnf_blob_hash", "identity_hash"):
            value = job_identity[field]
            _require(
                type(value) is str and len(value) == 64 and set(value).issubset(_HEX),
                f"receipt job {field} is not a lowercase SHA-256 digest",
            )
        variables, clauses = scan_dimacs(packet.cnf)
        _require(
            type(job_identity["num_variables"]) is int
            and job_identity["num_variables"] == variables
            and type(job_identity["num_clauses"]) is int
            and job_identity["num_clauses"] == clauses,
            "receipt job dimensions mismatch",
        )
        _require(
            type(job_identity["existing"]) is bool,
            "receipt job existing flag is not a built-in Boolean",
        )
        _require(
            type(job_identity["requested_core_limit"]) is int
            and job_identity["requested_core_limit"] == REQUESTED_CORE_LIMIT,
            "receipt job requested core limit mismatch",
        )
        expected_identity = raw_dimacs_identity(
            backend="cadical",
            solver_profile="sat",
            cnf_sha256=sha256_bytes(packet.cnf),
            producer_manifest_sha256=sha256_bytes(packet.producer_manifest),
            requested_core_limit=REQUESTED_CORE_LIMIT,
        )
        _require(
            job_identity["cnf_blob_hash"] == sha256_bytes(packet.cnf)
            and job_identity["identity_hash"] == expected_identity,
            "receipt job hashes do not bind the run packet",
        )
    claims = _at(receipt, "claims")
    _require(
        set(claims)
        == {
            "source_semantics_checked",
            "source_entitlement",
            "complete_source_coverage",
            "aggregate_order_case_coverage",
            "universal_lift",
            "theorem_closure",
        },
        "receipt claim keys changed",
    )
    _require(
        all(value is False for value in claims.values()),
        "receipt contains a positive proof claim",
    )
    attestation = _at(receipt, "solver_process_attestation")
    _require(
        set(attestation)
        == {
            "requested_core_limit",
            "prepared_requested_core_limit",
            "terminal_requested_core_limit",
            "terminal_attested_solver_processes",
            "terminal_attestation_basis",
            "solver_process_attestation_accepted",
            "no_solver_run_state_accepted",
            "os_thread_limit_attested",
            "os_cpuset_limit_attested",
            "os_core_enforcement_attested",
        },
        "receipt process-attestation keys changed",
    )
    _require(
        type(attestation["requested_core_limit"]) is int
        and attestation["requested_core_limit"] == REQUESTED_CORE_LIMIT
        and attestation["os_thread_limit_attested"] is False
        and attestation["os_cpuset_limit_attested"] is False
        and attestation["os_core_enforcement_attested"] is False,
        "receipt overstates process-attestation scope",
    )
    if attestation["solver_process_attestation_accepted"] is True:
        _require(
            type(attestation["prepared_requested_core_limit"]) is int
            and attestation["prepared_requested_core_limit"] == REQUESTED_CORE_LIMIT
            and type(attestation["terminal_requested_core_limit"]) is int
            and attestation["terminal_requested_core_limit"] == REQUESTED_CORE_LIMIT
            and type(attestation["terminal_attested_solver_processes"]) is int
            and attestation["terminal_attested_solver_processes"]
            == ATTESTED_SOLVER_PROCESSES
            and type(attestation["terminal_attestation_basis"]) is str
            and attestation["terminal_attestation_basis"] == ATTESTATION_BASIS
            and attestation["no_solver_run_state_accepted"] is False,
            "receipt accepted an invalid solver-process attestation",
        )
    else:
        _require(
            attestation["solver_process_attestation_accepted"] is False,
            "receipt process-attestation acceptance is not Boolean",
        )
    if attestation["no_solver_run_state_accepted"] is True:
        _require(
            attestation["solver_process_attestation_accepted"] is False
            and type(receipt.get("terminal_status")) is str
            and receipt.get("terminal_status") == "failed"
            and type(receipt.get("terminal_result")) is str
            and receipt.get("terminal_result") == "UNKNOWN"
            and type(attestation["prepared_requested_core_limit"]) is int
            and attestation["prepared_requested_core_limit"] == REQUESTED_CORE_LIMIT
            and type(attestation["terminal_requested_core_limit"]) is int
            and attestation["terminal_requested_core_limit"] == REQUESTED_CORE_LIMIT
            and attestation["terminal_attested_solver_processes"] is None
            and attestation["terminal_attestation_basis"] is None,
            "receipt accepted an invalid no-solver-run state",
        )
    else:
        _require(
            attestation["no_solver_run_state_accepted"] is False,
            "receipt no-solver-run acceptance is not Boolean",
        )
    _require(
        receipt.get("source_semantics") == SOURCE_SEMANTICS,
        "receipt source semantics changed",
    )
    journal = DurableAttemptJournal(journal_path, manifest=packet.wave_manifest)
    journal_evidence = _at(receipt, "journal")
    _require(
        journal_evidence == _journal_evidence(journal),
        "receipt journal evidence mismatch",
    )
    _require(
        job_identity == journal_evidence["prepared_job_identity"],
        "receipt job identity does not match durable PREPARE evidence",
    )
    _require(
        receipt.get("terminal_status") == journal_evidence["terminal_lifecycle_status"]
        and receipt.get("terminal_result")
        == journal_evidence["terminal_solver_result"],
        "receipt terminal status/result mismatch",
    )
    _require(
        receipt.get("terminal_outcome") == journal.records[-1]["outcome"],
        "receipt outcome mismatch",
    )
    return receipt


def run_packet(
    packet: RunPacket,
    *,
    client: _PiqdClient,
    journal_path: Path,
    receipt_path: Path,
    max_polls: int = 300,
    poll_interval_s: float = 2.0,
    solver_timeout_s: int = 900,
    march_timeout_s: int = 900,
) -> Exact17Run:
    """Shared strict path for exact17 and tiny known-result preflight packets."""

    _validate_run_packet(packet)
    _require(journal_path.name not in {"", ".", ".."}, "invalid journal filename")
    _require(receipt_path.name not in {"", ".", ".."}, "invalid receipt filename")
    _require(
        journal_path.parent == receipt_path.parent,
        "journal and receipt must share one run directory",
    )
    _require(
        os.path.abspath(journal_path) != os.path.abspath(receipt_path),
        "journal and receipt paths must be distinct",
    )
    parent_fd = _open_directory_nofollow(journal_path.parent)
    os.close(parent_fd)
    reserved = (
        journal_path,
        journal_path.with_name(f"{journal_path.name}.artifacts"),
        journal_path.with_name(f"{journal_path.name}.seal.json"),
        journal_path.with_name(f"{journal_path.name}.lock"),
        receipt_path,
    )
    _require(
        not any(path.exists() or path.is_symlink() for path in reserved),
        "journal, receipt, or associated path already exists",
    )
    strict_client = _StrictBoundIdentityClient(client)
    policy = DriverPolicy(
        max_prepare_attempts=1,
        max_confirm_attempts=1,
        max_polls=max_polls,
        max_result_attempts=1,
        poll_interval_s=poll_interval_s,
        solver_timeout_s=solver_timeout_s,
        march_timeout_s=march_timeout_s,
        project="erdos-97-96-formalization",
        requested_core_limit=REQUESTED_CORE_LIMIT,
    )
    journal = DurableAttemptJournal(journal_path, manifest=packet.wave_manifest)
    driver = PiqdCegarDriver(
        client=strict_client,
        journal=journal,
        policy=policy,
        proof_replayer=None,
        sleep=lambda _seconds: (
            None if poll_interval_s == 0 else __import__("time").sleep(_seconds)
        ),
    )
    result = driver.run(
        wave_manifest=packet.wave_manifest,
        cnf=packet.cnf,
        producer_manifest=packet.producer_manifest,
    )
    reopened = DurableAttemptJournal(journal_path, manifest=packet.wave_manifest)
    receipt = _make_receipt(
        packet=packet,
        result=result,
        journal=reopened,
        strict_client=strict_client,
    )
    _write_immutable(receipt_path, canonical_json_bytes(receipt) + b"\n")
    validated = validate_run_receipt(
        receipt_path,
        packet=packet,
        journal_path=journal_path,
    )
    return Exact17Run(result, validated, receipt_path)


def packet_from_exact17(package: Exact17Package) -> RunPacket:
    return RunPacket(
        packet_id=WAVE_ID,
        cnf=package.cnf,
        producer_manifest=package.producer_bytes,
        wave_manifest=package.wave,
        package_hashes=package.hashes,
        exact17_package=True,
    )


def run_exact17(
    package_dir: Path,
    *,
    client: _PiqdClient,
    journal_path: Path,
    receipt_path: Path,
    max_polls: int = 300,
    poll_interval_s: float = 2.0,
) -> Exact17Run:
    package = load_exact17_package(package_dir)
    return run_packet(
        packet_from_exact17(package),
        client=client,
        journal_path=journal_path,
        receipt_path=receipt_path,
        max_polls=max_polls,
        poll_interval_s=poll_interval_s,
    )


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("package_dir", type=Path)
    parser.add_argument("run_dir", type=Path)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    from census.p97_search.phase3_piqd_oracle import PiqdRawDimacsClient

    args = _parser().parse_args(argv)
    try:
        result = run_exact17(
            args.package_dir,
            client=PiqdRawDimacsClient(base_url=args.base_url),
            journal_path=args.run_dir / "exact17-attempts.jsonl",
            receipt_path=args.run_dir / "exact17-run-receipt.json",
        )
    except (
        Exact17RunnerError,
        PiqdDriverError,
        PiqdOracleError,
        RecursionError,
    ) as exc:
        print(f"exact17 runner rejected input: {exc}", file=sys.stderr)
        return 2
    print(canonical_json_bytes(result.receipt).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
