"""Durably run and semantically replay the pinned exact-17 v19 package."""

from __future__ import annotations

import argparse
import hashlib
import os
import secrets
import shutil
import stat
import tempfile
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Protocol

from census.p97_search import phase3_piqd_exact17_semantic as semantic
from census.p97_search.phase3_cegar_wave import STRUCTURAL_SAT
from census.p97_search.phase3_piqd_driver import (
    DriverPolicy,
    DriverResult,
    DurableAttemptJournal,
    PiqdCegarDriver,
    PiqdDriverError,
)
from census.p97_search.phase3_piqd_exact17_package import _emit
from census.p97_search.phase3_piqd_exact17_runner import (
    Exact17RunnerError,
    RunPacket,
    _capture_file,
    _make_receipt,
    _open_directory_nofollow,
    _StrictBoundIdentityClient,
    _validate_run_packet,
    validate_run_receipt,
)
from census.p97_search.phase3_piqd_exact17_v19_package import (
    PACKAGE_FILES,
    PINNED_CLAUSES,
    PINNED_VARIABLES,
    WAVE_ID,
    PackageResult,
    validate_package_files,
)
from census.p97_search.phase3_piqd_oracle import CheckedModel, PreparedJob

RUN_RESULT_SCHEMA = "p97-phase3-piqd-exact17-v19-run-result/v1"
MAX_JSON_BYTES = 512 * 1024 * 1024
MAX_CNF_BYTES = 256 * 1024 * 1024
MAX_LOG_BYTES = 64 * 1024 * 1024
MAX_JOURNAL_BYTES = 64 * 1024 * 1024
MAX_SEAL_BYTES = 1024 * 1024
MAX_RECEIPT_BYTES = 8 * 1024 * 1024
MAX_RUN_OUTPUT_ENTRIES = 256
GENERIC_JOURNAL = "attempts.jsonl"
GENERIC_RECEIPT = "generic-run-receipt.json"
GENERIC_ARTIFACT_DIRECTORY = f"{GENERIC_JOURNAL}.artifacts"
GENERIC_LOCK = f"{GENERIC_JOURNAL}.lock"
RUN_BASE_ARTIFACTS = frozenset(
    {
        GENERIC_JOURNAL,
        f"{GENERIC_JOURNAL}.seal.json",
        GENERIC_RECEIPT,
        "model-response.json",
        "solver.log",
        "decoded-semantic-object.json",
        "semantic-evidence.json",
        "semantic-receipt.json",
    }
)
JOB_IDENTITY_KEYS = frozenset(
    {
        "job_id",
        "backend",
        "solver_profile",
        "cnf_blob_hash",
        "identity_hash",
        "num_variables",
        "num_clauses",
        "existing",
        "requested_core_limit",
    }
)


class Exact17V19RunnerError(RuntimeError):
    """A durable v19 run failed closed."""


class _Client(Protocol):
    def prepare_cnf(self, **kwargs: Any) -> PreparedJob: ...

    def confirm(self, job: PreparedJob, *, expected_cnf: bytes) -> str: ...

    def status(self, job_id: str) -> Mapping[str, Any]: ...

    def checked_model(self, job: PreparedJob, *, cnf: bytes) -> CheckedModel: ...

    def log(self, job: PreparedJob) -> tuple[bytes, str]: ...

    def proof(self, job: PreparedJob) -> tuple[bytes, str]: ...


@dataclass(frozen=True)
class V19Run:
    driver_result: DriverResult
    output_dir: Path
    result: Mapping[str, Any]
    semantic_receipt: Mapping[str, Any]


@dataclass(frozen=True)
class _CapabilityRun:
    driver_result: DriverResult
    receipt: Mapping[str, Any]


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise Exact17V19RunnerError(message)


def _bounded_gate_detail(exc: BaseException) -> str:
    """Return a single-line diagnostic without echoing an untrusted payload."""

    detail = " ".join(str(exc).split()) or type(exc).__name__
    return detail[:240]


def _claims() -> dict[str, bool]:
    return {
        "finite_source_custody": True,
        "finite_semantic_replay": True,
        "structural_sat": True,
        "aggregate_order_case_coverage": False,
        "universal_lift": False,
        "theorem_closure": False,
        "lean_checked": False,
    }


def _identity(info: os.stat_result) -> tuple[int, ...]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _open_child_directory(parent_fd: int, name: str) -> int:
    _require(
        type(name) is str and name not in {"", ".", ".."} and "/" not in name,
        "unsafe child directory name",
    )
    nofollow = getattr(os, "O_NOFOLLOW", None)
    directory = getattr(os, "O_DIRECTORY", None)
    _require(
        nofollow is not None and directory is not None,
        "platform lacks required no-follow directory flags",
    )
    try:
        return os.open(
            name,
            os.O_RDONLY | directory | nofollow,
            dir_fd=parent_fd,
        )
    except OSError as exc:
        raise Exact17V19RunnerError(
            f"cannot safely open child directory {name}"
        ) from exc


def _open_or_create_directory_nofollow(path: Path) -> int:
    """Open a directory path, creating only below authenticated ancestors."""

    absolute = Path(os.path.abspath(path))
    nofollow = getattr(os, "O_NOFOLLOW", None)
    directory = getattr(os, "O_DIRECTORY", None)
    _require(
        nofollow is not None and directory is not None,
        "platform lacks required no-follow directory flags",
    )
    descriptor = os.open("/", os.O_RDONLY | directory)
    try:
        for component in absolute.parts[1:]:
            _require(
                component not in {"", ".", ".."} and "/" not in component,
                "run output parent has an unsafe component",
            )
            try:
                child = os.open(
                    component,
                    os.O_RDONLY | directory | nofollow,
                    dir_fd=descriptor,
                )
            except FileNotFoundError:
                try:
                    os.mkdir(component, mode=0o700, dir_fd=descriptor)
                    os.fsync(descriptor)
                except FileExistsError:
                    pass
                child = os.open(
                    component,
                    os.O_RDONLY | directory | nofollow,
                    dir_fd=descriptor,
                )
            os.close(descriptor)
            descriptor = child
        return descriptor
    except OSError as exc:
        os.close(descriptor)
        raise Exact17V19RunnerError(
            "run output parent is unsafe or cannot be created"
        ) from exc
    except Exception:
        os.close(descriptor)
        raise


def _journal_artifact_digests(
    journal: DurableAttemptJournal, package: PackageResult
) -> set[str]:
    digests = {
        package.wave["encoding"]["cnf_sha256"],
        package.wave["encoding"]["producer_manifest_sha256"],
    }
    for record in journal.records:
        artifacts = record.get("artifacts")
        _require(type(artifacts) is dict, "journal artifact map changed")
        digests.update(digest for digest in artifacts.values() if type(digest) is str)
    _require(bool(digests), "journal artifact set is empty")
    for digest in digests:
        _require(
            len(digest) == 64
            and all(character in "0123456789abcdef" for character in digest),
            "journal artifact set contains an invalid digest",
        )
    return digests


def _capture_generic_tree(
    staging: Path | None = None,
    *,
    staging_fd: int | None = None,
    expected_artifacts: set[str] | None = None,
    include_receipt: bool = True,
) -> tuple[dict[str, bytes], dict[str, bytes]]:
    """Capture the generic durable tree through one stable no-follow root."""

    _require(
        (staging is None) != (staging_fd is None),
        "generic capture requires exactly one staging root",
    )
    descriptor = (
        _open_directory_nofollow(staging) if staging_fd is None else os.dup(staging_fd)
    )
    artifact_fd: int | None = None
    try:
        before = os.fstat(descriptor)
        base_identities: dict[str, tuple[int, ...]] = {}

        def capture_base(name: str, maximum_bytes: int) -> bytes:
            pathname_before = os.stat(name, dir_fd=descriptor, follow_symlinks=False)
            raw = _capture_file(descriptor, name, maximum_bytes=maximum_bytes)
            pathname_after = os.stat(name, dir_fd=descriptor, follow_symlinks=False)
            _require(
                _identity(pathname_before) == _identity(pathname_after),
                f"generic staging artifact changed while captured: {name}",
            )
            base_identities[name] = _identity(pathname_after)
            return raw

        expected_top = {
            GENERIC_JOURNAL,
            f"{GENERIC_JOURNAL}.seal.json",
            GENERIC_ARTIFACT_DIRECTORY,
            GENERIC_LOCK,
        }
        if include_receipt:
            expected_top.add(GENERIC_RECEIPT)
        _require(
            set(os.listdir(descriptor)) == expected_top,
            "generic staging file set changed",
        )
        lock_info = os.stat(GENERIC_LOCK, dir_fd=descriptor, follow_symlinks=False)
        _require(
            stat.S_ISREG(lock_info.st_mode)
            and lock_info.st_nlink == 1
            and lock_info.st_size == 0,
            "generic journal lock changed",
        )
        base_identities[GENERIC_LOCK] = _identity(lock_info)
        base: dict[str, bytes] = {
            GENERIC_JOURNAL: capture_base(
                GENERIC_JOURNAL,
                MAX_JOURNAL_BYTES,
            ),
            f"{GENERIC_JOURNAL}.seal.json": capture_base(
                f"{GENERIC_JOURNAL}.seal.json",
                MAX_SEAL_BYTES,
            ),
        }
        if include_receipt:
            base[GENERIC_RECEIPT] = capture_base(
                GENERIC_RECEIPT,
                MAX_RECEIPT_BYTES,
            )
        artifact_fd = _open_child_directory(descriptor, GENERIC_ARTIFACT_DIRECTORY)
        artifact_before = os.fstat(artifact_fd)
        artifact_names = set(os.listdir(artifact_fd))
        _require(
            len(artifact_names) <= MAX_RUN_OUTPUT_ENTRIES,
            "generic journal archive contains too many entries",
        )
        _require(
            all(
                type(digest) is str
                and len(digest) == 64
                and all(character in "0123456789abcdef" for character in digest)
                for digest in artifact_names
            ),
            "generic journal archive contains an invalid name",
        )
        if expected_artifacts is None:
            expected_artifacts = artifact_names
        _require(
            artifact_names == expected_artifacts,
            "generic journal archive file set changed",
        )
        archived: dict[str, bytes] = {}
        archive_identities: dict[str, tuple[int, ...]] = {}
        for digest in sorted(expected_artifacts):
            pathname_before = os.stat(
                digest,
                dir_fd=artifact_fd,
                follow_symlinks=False,
            )
            archived[digest] = _capture_file(
                artifact_fd,
                digest,
                maximum_bytes=MAX_CNF_BYTES,
            )
            pathname_after = os.stat(
                digest,
                dir_fd=artifact_fd,
                follow_symlinks=False,
            )
            _require(
                _identity(pathname_before) == _identity(pathname_after),
                "generic journal artifact changed while captured",
            )
            archive_identities[digest] = _identity(pathname_after)
        for digest, raw in archived.items():
            _require(_sha(raw) == digest, "journal artifact bytes changed")
        _require(
            _identity(artifact_before) == _identity(os.fstat(artifact_fd))
            and set(os.listdir(artifact_fd)) == expected_artifacts,
            "generic journal archive changed while read",
        )
        _require(
            all(
                _identity(os.stat(digest, dir_fd=artifact_fd, follow_symlinks=False))
                == identity
                for digest, identity in archive_identities.items()
            ),
            "generic journal artifact changed after capture",
        )
        _require(
            _identity(before) == _identity(os.fstat(descriptor))
            and set(os.listdir(descriptor)) == expected_top,
            "generic staging directory changed while read",
        )
        _require(
            all(
                _identity(os.stat(name, dir_fd=descriptor, follow_symlinks=False))
                == identity
                for name, identity in base_identities.items()
            ),
            "generic staging artifact changed after capture",
        )
        return base, archived
    finally:
        if artifact_fd is not None:
            os.close(artifact_fd)
        os.close(descriptor)


def _authenticate_generic_snapshot(
    generic_files: Mapping[str, bytes],
    archived: Mapping[str, bytes],
    *,
    package: PackageResult,
) -> tuple[Mapping[str, Any], DurableAttemptJournal]:
    """Authenticate already-bounded bytes through the generic validator."""

    validation_parent = Path(tempfile.gettempdir()).resolve(strict=True)
    validation_parent_fd = _open_directory_nofollow(validation_parent)
    os.close(validation_parent_fd)
    validation_stage = Path(
        tempfile.mkdtemp(prefix=".exact17-v19-auth-", dir=validation_parent)
    )
    try:
        artifact_dir = validation_stage / GENERIC_ARTIFACT_DIRECTORY
        artifact_dir.mkdir(mode=0o700)
        for digest, raw in archived.items():
            (artifact_dir / digest).write_bytes(raw)
        (validation_stage / GENERIC_JOURNAL).write_bytes(generic_files[GENERIC_JOURNAL])
        (validation_stage / f"{GENERIC_JOURNAL}.seal.json").write_bytes(
            generic_files[f"{GENERIC_JOURNAL}.seal.json"]
        )
        (validation_stage / GENERIC_RECEIPT).write_bytes(generic_files[GENERIC_RECEIPT])
        receipt = validate_run_receipt(
            validation_stage / GENERIC_RECEIPT,
            packet=packet_from_package(package),
            journal_path=validation_stage / GENERIC_JOURNAL,
        )
        journal = DurableAttemptJournal(
            validation_stage / GENERIC_JOURNAL,
            manifest=package.wave,
        )
        return receipt, journal
    finally:
        shutil.rmtree(validation_stage)


def _capture_directory(directory: Path, expected: set[str]) -> dict[str, bytes]:
    descriptor = _open_directory_nofollow(directory)
    try:
        entries = set(os.listdir(descriptor))
        _require(entries == expected, f"directory file set changed: {sorted(entries)}")
        files: dict[str, bytes] = {}
        for name in sorted(expected):
            limit = MAX_CNF_BYTES if name == "discovery.cnf" else MAX_JSON_BYTES
            files[name] = _capture_file(descriptor, name, maximum_bytes=limit)
        _require(
            set(os.listdir(descriptor)) == expected, "directory changed while read"
        )
        return files
    finally:
        os.close(descriptor)


def load_package(package_dir: Path) -> PackageResult:
    files = _capture_directory(package_dir, set(PACKAGE_FILES))
    bundle = validate_package_files(files)
    generated = {
        "source-bundle.json",
        "variable-map.json",
        "semantic-package.json",
        "producer-manifest.json",
        "wave-manifest.json",
        "package-result.json",
    }
    documents = {name: semantic.load_strict_json(files[name]) for name in generated}
    return PackageResult(
        output_dir=package_dir,
        files=files,
        hashes={name: _sha(raw) for name, raw in files.items()},
        documents=documents,
        source_bundle=bundle,
    )


def packet_from_package(package: PackageResult) -> RunPacket:
    validate_package_files(package.files)
    return RunPacket(
        packet_id=WAVE_ID,
        cnf=package.cnf,
        producer_manifest=package.producer_bytes,
        wave_manifest=package.wave,
        package_hashes=package.hashes,
        exact17_package=False,
    )


def _strict_model_payload(
    raw: bytes,
    *,
    job_id: str,
    require_canonical: bool,
) -> dict[str, Any]:
    payload = semantic.load_strict_json(raw, require_canonical=require_canonical)
    _require(
        set(payload) == {"job_id", "result", "num_assigned", "assignment"},
        "model response keys changed",
    )
    _require(
        type(payload["job_id"]) is str and payload["job_id"] == job_id,
        "model job id changed",
    )
    _require(
        type(payload["result"]) is str and payload["result"] == "SAT",
        "model result is not SAT",
    )
    assignment = payload["assignment"]
    _require(type(assignment) is list, "model assignment must be a builtin list")
    _require(
        type(payload["num_assigned"]) is int
        and payload["num_assigned"] == PINNED_VARIABLES
        and len(assignment) == PINNED_VARIABLES,
        "model assignment is incomplete",
    )
    _require(
        all(type(value) is int for value in assignment),
        "model literals must be builtin integers",
    )
    return payload


def _strict_model(
    raw: bytes,
    *,
    job_id: str,
    require_canonical: bool = False,
) -> list[int]:
    """Validate a daemon or published model and return its total assignment."""

    payload = _strict_model_payload(
        raw,
        job_id=job_id,
        require_canonical=require_canonical,
    )
    return payload["assignment"]


def _artifact_bytes(staging: Path, digest: Any, *, maximum_bytes: int) -> bytes:
    _require(
        type(digest) is str
        and len(digest) == 64
        and all(character in "0123456789abcdef" for character in digest),
        "journal artifact digest is invalid",
    )
    staging_fd = _open_directory_nofollow(staging)
    descriptor: int | None = None
    try:
        before = os.fstat(staging_fd)
        descriptor = _open_child_directory(staging_fd, GENERIC_ARTIFACT_DIRECTORY)
        raw = _capture_file(descriptor, digest, maximum_bytes=maximum_bytes)
        _require(
            _identity(before) == _identity(os.fstat(staging_fd)),
            "generic staging directory changed while reading an artifact",
        )
    finally:
        if descriptor is not None:
            os.close(descriptor)
        os.close(staging_fd)
    _require(_sha(raw) == digest, "journal artifact hash mismatch")
    return raw


def _generic_outputs(
    staging: Path,
    package: PackageResult,
    authenticated_generic_receipt: Mapping[str, Any],
    *,
    staging_fd: int | None = None,
) -> tuple[dict[str, bytes], Mapping[str, Any]]:
    generic_files, archived = _capture_generic_tree(
        staging if staging_fd is None else None,
        staging_fd=staging_fd,
    )
    receipt, journal = _authenticate_generic_snapshot(
        generic_files,
        archived,
        package=package,
    )
    _require(
        receipt == authenticated_generic_receipt,
        "captured generic receipt differs from issued capability receipt",
    )
    _require(bool(journal.records), "generic journal is empty")
    terminal = journal.records[-1]
    _require(
        terminal["outcome"] == STRUCTURAL_SAT, "terminal outcome is not structural SAT"
    )
    expected_artifacts = _journal_artifact_digests(journal, package)
    _require(
        set(archived) == expected_artifacts,
        "generic journal archive file set changed",
    )
    artifacts = terminal["artifacts"]
    model_digest = artifacts.get("model_sha256")
    log_digest = artifacts.get("solver_log_sha256")
    _require(model_digest in archived, "model artifact is not in the exact archive")
    _require(log_digest in archived, "solver log is not in the exact archive")
    model_raw = archived[model_digest]
    log_raw = archived[log_digest]
    _require(bool(log_raw), "archived solver log is empty")

    receipt_raw = generic_files[GENERIC_RECEIPT]
    _require(
        receipt_raw.endswith(b"\n") and not receipt_raw.endswith(b"\n\n"),
        "generic receipt newline framing changed",
    )
    captured_receipt = semantic.load_strict_json(receipt_raw[:-1])
    _require(
        captured_receipt == receipt,
        "captured generic receipt differs from authenticated receipt",
    )
    job_identity = receipt.get("job_identity")
    _require(type(job_identity) is dict, "generic receipt job identity changed")
    job_id = job_identity.get("job_id")
    _require(type(job_id) is str and bool(job_id), "generic receipt lacks job id")
    model_payload = _strict_model_payload(
        model_raw,
        job_id=job_id,
        require_canonical=False,
    )
    assignment = model_payload["assignment"]
    published_model = semantic.canonical_json(model_payload)

    replay = semantic.replay_source_semantics(
        package_bytes=package.files["semantic-package.json"],
        cnf_bytes=package.cnf,
        model=assignment,
        source_bundle=package.source_bundle,
        variable_map_bytes=package.files["variable-map.json"],
    )
    decoded = semantic.canonical_json(replay["decoded"])
    evidence = semantic.canonical_json(replay["semantic_evidence"])
    semantic_receipt = semantic.issue_semantic_receipt(
        package_bytes=package.files["semantic-package.json"],
        cnf_bytes=package.cnf,
        model=assignment,
        source_bundle=package.source_bundle,
        variable_map_bytes=package.files["variable-map.json"],
    )
    validated_receipt = semantic.validate_semantic_receipt(
        semantic_receipt,
        package_bytes=package.files["semantic-package.json"],
        cnf_bytes=package.cnf,
        model=assignment,
        source_bundle=package.source_bundle,
        variable_map_bytes=package.files["variable-map.json"],
    )

    output: dict[str, bytes] = {
        GENERIC_JOURNAL: generic_files[GENERIC_JOURNAL],
        f"{GENERIC_JOURNAL}.seal.json": generic_files[f"{GENERIC_JOURNAL}.seal.json"],
        GENERIC_RECEIPT: receipt_raw,
        "model-response.json": published_model,
        "solver.log": log_raw,
        "decoded-semantic-object.json": decoded,
        "semantic-evidence.json": evidence,
        "semantic-receipt.json": semantic_receipt,
    }
    for digest, raw in archived.items():
        output[f"journal-artifact-{digest}"] = raw
    _require(
        f"journal-artifact-{model_digest}" in output, "model artifact was not persisted"
    )
    _require(
        f"journal-artifact-{log_digest}" in output, "log artifact was not persisted"
    )
    return output, validated_receipt


def _make_result(
    files: Mapping[str, bytes], package: PackageResult, generic: Mapping[str, Any]
) -> bytes:
    artifacts = {name: _sha(raw) for name, raw in sorted(files.items())}
    job_identity = _validate_result_job_identity(generic.get("job_identity"))
    return semantic.canonical_json(
        {
            "schema": RUN_RESULT_SCHEMA,
            "wave_id": WAVE_ID,
            "package_artifact_sha256": dict(sorted(package.hashes.items())),
            "job_identity": job_identity,
            "piqd_existing_dedupe": job_identity["existing"],
            "artifacts": artifacts,
            "claims": _claims(),
        }
    )


def _validate_result_job_identity(value: Any) -> Mapping[str, Any]:
    _require(type(value) is dict, "run job identity must be a builtin object")
    _require(set(value) == JOB_IDENTITY_KEYS, "run job identity keys changed")
    for field, expected in (("backend", "cadical"), ("solver_profile", "sat")):
        _require(
            type(value[field]) is str and value[field] == expected,
            f"run job {field} changed",
        )
    _require(
        type(value["job_id"]) is str and bool(value["job_id"]),
        "run job id must be a nonempty builtin string",
    )
    for field in ("cnf_blob_hash", "identity_hash"):
        digest = value[field]
        _require(
            type(digest) is str
            and len(digest) == 64
            and all(character in "0123456789abcdef" for character in digest),
            f"run job {field} is not a lowercase SHA-256 digest",
        )
    _require(
        type(value["num_variables"]) is int
        and value["num_variables"] == PINNED_VARIABLES
        and type(value["num_clauses"]) is int
        and value["num_clauses"] == PINNED_CLAUSES,
        "run job dimensions changed",
    )
    _require(
        type(value["existing"]) is bool,
        "run job existing must be a builtin Boolean",
    )
    _require(
        type(value["requested_core_limit"]) is int
        and value["requested_core_limit"] == 1,
        "run job requested core limit changed",
    )
    return value


def _is_archive_name(name: Any) -> bool:
    prefix = "journal-artifact-"
    if type(name) is not str or not name.startswith(prefix):
        return False
    digest = name.removeprefix(prefix)
    return len(digest) == 64 and all(
        character in "0123456789abcdef" for character in digest
    )


def validate_run_output(
    output_dir: Path, *, package: PackageResult
) -> Mapping[str, Any]:
    descriptor = _open_directory_nofollow(output_dir)
    try:
        directory_before = os.fstat(descriptor)
        captured_identities: dict[str, tuple[int, ...]] = {}

        def capture_output(name: str, maximum_bytes: int) -> bytes:
            pathname_before = os.stat(name, dir_fd=descriptor, follow_symlinks=False)
            raw = _capture_file(descriptor, name, maximum_bytes=maximum_bytes)
            pathname_after = os.stat(name, dir_fd=descriptor, follow_symlinks=False)
            _require(
                _identity(pathname_before) == _identity(pathname_after),
                f"run artifact changed while captured: {name}",
            )
            captured_identities[name] = _identity(pathname_after)
            return raw

        names = set(os.listdir(descriptor))
        _require(
            len(names) <= MAX_RUN_OUTPUT_ENTRIES,
            "run output contains too many entries",
        )
        _require("run-result.json" in names, "run result is missing")
        result_raw = capture_output("run-result.json", MAX_JSON_BYTES)
        result = semantic.load_strict_json(result_raw)
        _require(
            set(result)
            == {
                "schema",
                "wave_id",
                "package_artifact_sha256",
                "job_identity",
                "piqd_existing_dedupe",
                "artifacts",
                "claims",
            },
            "run result keys changed",
        )
        _require(result.get("schema") == RUN_RESULT_SCHEMA, "run result schema changed")
        _require(result.get("wave_id") == WAVE_ID, "run result wave changed")
        _require(result.get("claims") == _claims(), "run result claims changed")
        _require(
            result.get("package_artifact_sha256")
            == dict(sorted(package.hashes.items())),
            "run result package binding changed",
        )
        _require(
            type(result.get("piqd_existing_dedupe")) is bool,
            "PIQD dedupe flag must be a builtin Boolean",
        )
        bindings = result.get("artifacts")
        _require(
            type(bindings) is dict, "run artifact bindings must be a builtin object"
        )
        _require(
            len(bindings) <= MAX_RUN_OUTPUT_ENTRIES - 1,
            "run artifact map contains too many entries",
        )
        _require(
            names == set(bindings) | {"run-result.json"}, "run output file set changed"
        )
        _require(
            RUN_BASE_ARTIFACTS <= set(bindings),
            "run output is missing a required artifact",
        )
        captured: dict[str, bytes] = {}
        for name, digest in bindings.items():
            _require(
                name in RUN_BASE_ARTIFACTS or _is_archive_name(name),
                "run artifact is outside the fixed allowlist",
            )
            _require(
                type(digest) is str
                and len(digest) == 64
                and all(character in "0123456789abcdef" for character in digest),
                "run artifact binding is not a lowercase SHA-256 digest",
            )
            limit = MAX_LOG_BYTES if name == "solver.log" else MAX_CNF_BYTES
            raw = capture_output(name, limit)
            _require(
                _sha(raw) == digest,
                f"run artifact changed: {name}",
            )
            captured[name] = raw
        prefix = "journal-artifact-"
        archived = {
            name.removeprefix(prefix): raw
            for name, raw in captured.items()
            if name.startswith(prefix)
        }
        authenticated_receipt, authenticated_journal = _authenticate_generic_snapshot(
            captured,
            archived,
            package=package,
        )
        expected_archives = _journal_artifact_digests(
            authenticated_journal,
            package,
        )
        expected_bindings = RUN_BASE_ARTIFACTS | {
            f"journal-artifact-{digest}" for digest in expected_archives
        }
        _require(
            set(bindings) == expected_bindings,
            "run artifact set does not match the authenticated journal",
        )
        job_identity = _validate_result_job_identity(result.get("job_identity"))
        authenticated_identity = authenticated_receipt.get("job_identity")
        _require(
            job_identity == authenticated_identity,
            "run job identity differs from the authenticated generic receipt",
        )
        _require(
            result["piqd_existing_dedupe"] is authenticated_identity["existing"],
            "PIQD dedupe flag differs from the authenticated generic receipt",
        )
        _require(bool(authenticated_journal.records), "authenticated journal is empty")
        terminal = authenticated_journal.records[-1]
        terminal_artifacts = terminal.get("artifacts")
        _require(
            type(terminal_artifacts) is dict,
            "terminal journal artifacts must be a builtin object",
        )
        raw_model_digest = terminal_artifacts.get("model_sha256")
        _require(
            type(raw_model_digest) is str
            and len(raw_model_digest) == 64
            and all(character in "0123456789abcdef" for character in raw_model_digest),
            "terminal model digest is invalid",
        )
        model_archive = f"journal-artifact-{raw_model_digest}"
        log_archive = f"journal-artifact-{_sha(captured['solver.log'])}"
        _require(
            model_archive in expected_bindings,
            "raw downloaded model is missing from the authenticated journal archive",
        )
        _require(
            log_archive in expected_bindings
            and captured["solver.log"] == captured[log_archive],
            "solver log differs from journal archive",
        )
        raw_model = _strict_model_payload(
            captured[model_archive],
            job_id=authenticated_identity["job_id"],
            require_canonical=False,
        )
        published_model = _strict_model_payload(
            captured["model-response.json"],
            job_id=authenticated_identity["job_id"],
            require_canonical=True,
        )
        _require(
            published_model == raw_model
            and captured["model-response.json"] == semantic.canonical_json(raw_model),
            "published model response differs from authenticated raw model",
        )
        assignment = published_model["assignment"]
        replay = semantic.replay_source_semantics(
            package_bytes=package.files["semantic-package.json"],
            cnf_bytes=package.cnf,
            model=assignment,
            source_bundle=package.source_bundle,
            variable_map_bytes=package.files["variable-map.json"],
        )
        _require(
            captured["decoded-semantic-object.json"]
            == semantic.canonical_json(replay["decoded"]),
            "decoded semantic object changed",
        )
        _require(
            captured["semantic-evidence.json"]
            == semantic.canonical_json(replay["semantic_evidence"]),
            "semantic evidence changed",
        )
        semantic_receipt = semantic.validate_semantic_receipt(
            captured["semantic-receipt.json"],
            package_bytes=package.files["semantic-package.json"],
            cnf_bytes=package.cnf,
            model=assignment,
            source_bundle=package.source_bundle,
            variable_map_bytes=package.files["variable-map.json"],
        )
        _require(
            semantic_receipt["claims"] == semantic.false_claims(),
            "semantic receipt claims changed",
        )
        _require(
            _identity(directory_before) == _identity(os.fstat(descriptor))
            and set(os.listdir(descriptor)) == names,
            "run output directory changed while validating",
        )
        _require(
            all(
                _identity(os.stat(name, dir_fd=descriptor, follow_symlinks=False))
                == identity
                for name, identity in captured_identities.items()
            ),
            "run output artifact changed after capture",
        )
        return result
    finally:
        os.close(descriptor)


def _directory_anchor(info: os.stat_result) -> tuple[int, int, int]:
    return info.st_dev, info.st_ino, stat.S_IFMT(info.st_mode)


def _descriptor_rooted_directory(descriptor: int) -> Path:
    """Return a rename-stable path for a held directory capability.

    macOS exposes the volume/inode namespace through ``/.vol``. Unlike
    ``/dev/fd``, it supports descendant lookup, and unlike an ordinary path it
    remains bound to the directory inode across ancestor renames. The virtual
    device component is not independently traversable, so authenticate the
    complete volfs path in one no-follow open.
    """

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
        raise Exact17V19RunnerError(
            "platform lacks a no-follow descendant-capable directory path"
        ) from exc
    try:
        _require(
            _directory_anchor(os.fstat(capability_fd)) == anchor,
            "descriptor-rooted directory identity mismatch",
        )
    finally:
        os.close(capability_fd)
    return candidate


def _write_immutable_at(
    directory_fd: int,
    name: str,
    payload: bytes,
    *,
    maximum_bytes: int,
) -> None:
    """Install one immutable regular file below an authenticated directory fd."""

    _require(
        name not in {"", ".", ".."} and "/" not in name,
        "unsafe immutable file name",
    )
    nofollow = getattr(os, "O_NOFOLLOW", None)
    _require(nofollow is not None, "platform lacks required no-follow file flags")
    _require(len(payload) <= maximum_bytes, "immutable payload exceeds its bound")
    descriptor: int | None = None
    try:
        descriptor = os.open(
            name,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | nofollow,
            0o600,
            dir_fd=directory_fd,
        )
        offset = 0
        while offset < len(payload):
            written = os.write(descriptor, payload[offset:])
            _require(written > 0, "immutable file write made no progress")
            offset += written
        os.fsync(descriptor)
    except OSError as exc:
        raise Exact17V19RunnerError("immutable staging write failed") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
    os.fsync(directory_fd)
    _require(
        _capture_file(directory_fd, name, maximum_bytes=maximum_bytes) == payload,
        "immutable staging bytes changed after installation",
    )


def _receipt_from_bounded_snapshot(
    *,
    packet: RunPacket,
    result: DriverResult,
    strict_client: _StrictBoundIdentityClient,
    generic_files: Mapping[str, bytes],
    archived: Mapping[str, bytes],
) -> Mapping[str, Any]:
    """Issue the generic receipt from a bounded, private reconstruction."""

    validation_parent = Path(tempfile.gettempdir()).resolve(strict=True)
    validation_parent_fd = _open_directory_nofollow(validation_parent)
    os.close(validation_parent_fd)
    validation_stage = Path(
        tempfile.mkdtemp(prefix=".exact17-v19-receipt-", dir=validation_parent)
    )
    try:
        artifact_dir = validation_stage / GENERIC_ARTIFACT_DIRECTORY
        artifact_dir.mkdir(mode=0o700)
        for digest, raw in archived.items():
            (artifact_dir / digest).write_bytes(raw)
        journal_path = validation_stage / GENERIC_JOURNAL
        journal_path.write_bytes(generic_files[GENERIC_JOURNAL])
        (validation_stage / f"{GENERIC_JOURNAL}.seal.json").write_bytes(
            generic_files[f"{GENERIC_JOURNAL}.seal.json"]
        )
        journal = DurableAttemptJournal(journal_path, manifest=packet.wave_manifest)
        return _make_receipt(
            packet=packet,
            result=result,
            journal=journal,
            strict_client=strict_client,
        )
    finally:
        shutil.rmtree(validation_stage)


def _run_packet_capability(
    packet: RunPacket,
    *,
    client: _Client,
    staging: Path,
    staging_fd: int,
    max_polls: int,
    poll_interval_s: float,
) -> _CapabilityRun:
    """Run the generic driver with journal writes rooted at a held capability.

    The frozen generic ``run_packet`` reopens ordinary parent pathnames. Its
    validation and receipt formats are retained, but the v19 adapter performs
    the driver lifecycle here so every durable write resolves below the held
    staging inode even if the caller-visible ancestor is renamed.
    """

    _validate_run_packet(packet)
    _require(not os.listdir(staging_fd), "reserved staging directory is not empty")
    _require(
        _directory_anchor(os.fstat(staging_fd))
        == _directory_anchor(os.stat(staging, follow_symlinks=False)),
        "descriptor-rooted staging identity mismatch",
    )
    strict_client = _StrictBoundIdentityClient(client)
    policy = DriverPolicy(
        max_prepare_attempts=1,
        max_confirm_attempts=1,
        max_polls=max_polls,
        max_result_attempts=1,
        poll_interval_s=poll_interval_s,
        solver_timeout_s=900,
        march_timeout_s=900,
        project="erdos-97-96-formalization",
        requested_core_limit=1,
    )
    journal = DurableAttemptJournal(
        staging / GENERIC_JOURNAL,
        manifest=packet.wave_manifest,
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
    generic_files, archived = _capture_generic_tree(
        staging_fd=staging_fd,
        include_receipt=False,
    )
    receipt = _receipt_from_bounded_snapshot(
        packet=packet,
        result=result,
        strict_client=strict_client,
        generic_files=generic_files,
        archived=archived,
    )
    _write_immutable_at(
        staging_fd,
        GENERIC_RECEIPT,
        semantic.canonical_json(receipt) + b"\n",
        maximum_bytes=MAX_RECEIPT_BYTES,
    )
    return _CapabilityRun(result, receipt)


def _reserve_child_directory_at(parent_fd: int, name: str) -> tuple[int, int, int]:
    _require(
        name not in {"", ".", ".."} and "/" not in name,
        "unsafe reserved directory name",
    )
    child_fd: int | None = None
    created_anchor: tuple[int, int, int] | None = None
    try:
        os.mkdir(name, mode=0o700, dir_fd=parent_fd)
        created_anchor = _directory_anchor(
            os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
        )
        child_fd = _open_child_directory(parent_fd, name)
        info = os.fstat(child_fd)
        _require(not os.listdir(child_fd), "reserved run output is not empty")
        os.fsync(parent_fd)
        return _directory_anchor(info)
    except Exception:
        if created_anchor is not None:
            try:
                current = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
                if _directory_anchor(current) == created_anchor:
                    os.rmdir(name, dir_fd=parent_fd)
                    os.fsync(parent_fd)
            except OSError:
                pass
        raise
    finally:
        if child_fd is not None:
            os.close(child_fd)


def _reserve_output_directory(
    output_dir: Path, *, authenticated_parent_fd: int | None = None
) -> tuple[int, int, int]:
    owns_parent_fd = authenticated_parent_fd is None
    parent_fd = (
        _open_directory_nofollow(output_dir.parent)
        if authenticated_parent_fd is None
        else authenticated_parent_fd
    )
    try:
        return _reserve_child_directory_at(parent_fd, output_dir.name)
    except FileExistsError as exc:
        raise Exact17V19RunnerError("run output already exists") from exc
    finally:
        if owns_parent_fd:
            os.close(parent_fd)


def _reserve_staging_directory(
    authenticated_parent_fd: int,
) -> tuple[str, tuple[int, int, int]]:
    for _attempt in range(128):
        name = f".exact17-v19-stage-{secrets.token_hex(16)}"
        try:
            return name, _reserve_child_directory_at(authenticated_parent_fd, name)
        except FileExistsError:
            continue
    raise Exact17V19RunnerError("cannot reserve a unique staging directory")


def _require_directory_binding(
    path: Path, anchor: tuple[int, int, int], *, source: str
) -> None:
    try:
        descriptor = _open_directory_nofollow(path)
    except Exact17RunnerError as exc:
        raise Exact17V19RunnerError(f"{source} pathname changed") from exc
    try:
        _require(
            _directory_anchor(os.fstat(descriptor)) == anchor,
            f"{source} pathname changed",
        )
    finally:
        os.close(descriptor)


def _clear_owned_directory(descriptor: int) -> bool:
    for name in sorted(os.listdir(descriptor)):
        if name in {"", ".", ".."} or "/" in name:
            return False
        try:
            info = os.stat(name, dir_fd=descriptor, follow_symlinks=False)
        except OSError:
            return False
        if stat.S_ISREG(info.st_mode) and info.st_nlink == 1:
            try:
                os.unlink(name, dir_fd=descriptor)
            except OSError:
                return False
            continue
        if not stat.S_ISDIR(info.st_mode):
            return False
        child_fd: int | None = None
        try:
            child_fd = _open_child_directory(descriptor, name)
            anchor = _directory_anchor(os.fstat(child_fd))
            if not _clear_owned_directory(child_fd):
                return False
            pathname = os.stat(name, dir_fd=descriptor, follow_symlinks=False)
            if _directory_anchor(pathname) != anchor or os.listdir(child_fd):
                return False
            os.close(child_fd)
            child_fd = None
            os.rmdir(name, dir_fd=descriptor)
        except (Exact17V19RunnerError, OSError):
            return False
        finally:
            if child_fd is not None:
                os.close(child_fd)
    return not os.listdir(descriptor)


def _cleanup_reserved_tree_at(
    parent_fd: int, name: str, *, anchor: tuple[int, int, int]
) -> bool:
    child_fd: int | None = None
    try:
        child_fd = _open_child_directory(parent_fd, name)
        if _directory_anchor(os.fstat(child_fd)) != anchor:
            return False
        if not _clear_owned_directory(child_fd):
            return False
        pathname = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
        if _directory_anchor(pathname) != anchor:
            return False
        os.close(child_fd)
        child_fd = None
        os.rmdir(name, dir_fd=parent_fd)
        os.fsync(parent_fd)
        return True
    except (Exact17V19RunnerError, OSError):
        return False
    finally:
        if child_fd is not None:
            os.close(child_fd)


def _cleanup_reserved_output(
    output_dir: Path,
    *,
    anchor: tuple[int, int, int],
    expected_names: set[str],
    authenticated_parent_fd: int | None = None,
) -> bool:
    """Remove only the still-owned partial output; preserve any hostile change."""

    owns_parent_fd = authenticated_parent_fd is None
    parent_fd: int | None = authenticated_parent_fd
    child_fd: int | None = None
    try:
        if parent_fd is None:
            parent_fd = _open_directory_nofollow(output_dir.parent)
        child_fd = _open_child_directory(parent_fd, output_dir.name)
        if _directory_anchor(os.fstat(child_fd)) != anchor:
            return False
        names = set(os.listdir(child_fd))
        if not names <= expected_names:
            return False
        for name in names:
            info = os.stat(name, dir_fd=child_fd, follow_symlinks=False)
            if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
                return False
        pathname = os.stat(output_dir.name, dir_fd=parent_fd, follow_symlinks=False)
        if _directory_anchor(pathname) != anchor:
            return False
        for name in sorted(names):
            os.unlink(name, dir_fd=child_fd)
        if os.listdir(child_fd) or _directory_anchor(os.fstat(child_fd)) != anchor:
            return False
        pathname = os.stat(output_dir.name, dir_fd=parent_fd, follow_symlinks=False)
        if _directory_anchor(pathname) != anchor:
            return False
        os.close(child_fd)
        child_fd = None
        os.rmdir(output_dir.name, dir_fd=parent_fd)
        os.fsync(parent_fd)
        return True
    except (Exact17V19RunnerError, Exact17RunnerError, OSError):
        return False
    finally:
        if child_fd is not None:
            os.close(child_fd)
        if owns_parent_fd and parent_fd is not None:
            os.close(parent_fd)


def _install_run_output(
    output_dir: Path,
    files: Mapping[str, bytes],
    *,
    package: PackageResult,
    authenticated_parent_fd: int | None = None,
    parent_anchor: tuple[int, int, int] | None = None,
) -> Mapping[str, Any]:
    if authenticated_parent_fd is not None:
        _require(
            parent_anchor is not None
            and _directory_anchor(os.fstat(authenticated_parent_fd)) == parent_anchor,
            "authenticated run output parent changed",
        )
        _require_directory_binding(
            output_dir.parent,
            parent_anchor,
            source="authenticated run output parent",
        )
    anchor = _reserve_output_directory(
        output_dir, authenticated_parent_fd=authenticated_parent_fd
    )
    try:
        _require_directory_binding(output_dir, anchor, source="reserved run output")
        _emit(output_dir, files)
        return validate_run_output(output_dir, package=package)
    except Exception as exc:
        if not _cleanup_reserved_output(
            output_dir,
            anchor=anchor,
            expected_names=set(files),
            authenticated_parent_fd=authenticated_parent_fd,
        ):
            raise Exact17V19RunnerError(
                "run output failed validation and changed ownership; cleanup refused"
            ) from exc
        if isinstance(exc, Exact17V19RunnerError):
            raise
        raise Exact17V19RunnerError("run output installation failed") from exc


def run_exact17_v19(
    package_dir: Path,
    *,
    client: _Client,
    output_dir: Path,
    max_polls: int = 300,
    poll_interval_s: float = 2.0,
) -> V19Run:
    """Run once, replay the exact archived SAT model, then install evidence."""

    package = load_package(package_dir)
    _require(
        not output_dir.exists() and not output_dir.is_symlink(),
        "run output already exists",
    )
    output_parent = output_dir.parent
    parent_fd = _open_or_create_directory_nofollow(output_parent)
    parent_anchor = _directory_anchor(os.fstat(parent_fd))
    staging_name: str | None = None
    staging_anchor: tuple[int, int, int] | None = None
    staging_fd: int | None = None
    try:
        staging_name, staging_anchor = _reserve_staging_directory(parent_fd)
        staging_fd = _open_child_directory(parent_fd, staging_name)
        _require(
            _directory_anchor(os.fstat(staging_fd)) == staging_anchor,
            "reserved staging descriptor identity mismatch",
        )
        staging = _descriptor_rooted_directory(staging_fd)
        _require_directory_binding(
            output_parent,
            parent_anchor,
            source="authenticated run output parent",
        )
        generic = _run_packet_capability(
            packet_from_package(package),
            client=client,
            staging=staging,
            staging_fd=staging_fd,
            max_polls=max_polls,
            poll_interval_s=poll_interval_s,
        )
        _require(
            generic.driver_result.outcome == STRUCTURAL_SAT,
            "PIQD did not return structural SAT",
        )
        files, semantic_receipt = _generic_outputs(
            staging,
            package,
            generic.receipt,
            staging_fd=staging_fd,
        )
        files["run-result.json"] = _make_result(files, package, generic.receipt)
        result = _install_run_output(
            output_dir,
            files,
            package=package,
            authenticated_parent_fd=parent_fd,
            parent_anchor=parent_anchor,
        )
        return V19Run(generic.driver_result, output_dir, result, semantic_receipt)
    except KeyError as exc:
        raise Exact17V19RunnerError(
            f"custody gate is missing a required field: {_bounded_gate_detail(exc)}"
        ) from exc
    except semantic.SemanticCustodyError as exc:
        raise Exact17V19RunnerError(
            f"semantic custody gate rejected: {_bounded_gate_detail(exc)}"
        ) from exc
    except OSError as exc:
        raise Exact17V19RunnerError(
            "filesystem custody gate rejected "
            f"({type(exc).__name__}): {_bounded_gate_detail(exc)}"
        ) from exc
    finally:
        if staging_fd is not None:
            os.close(staging_fd)
        cleanup_ok = (
            staging_name is None
            or staging_anchor is None
            or _cleanup_reserved_tree_at(
                parent_fd,
                staging_name,
                anchor=staging_anchor,
            )
        )
        os.close(parent_fd)
        if not cleanup_ok:
            raise Exact17V19RunnerError(
                "staging directory changed ownership; cleanup refused"
            )


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("package_dir", type=Path)
    parser.add_argument("output_dir", type=Path)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    from census.p97_search.phase3_piqd_oracle import PiqdRawDimacsClient

    args = _parser().parse_args(argv)
    try:
        run_exact17_v19(
            args.package_dir,
            client=PiqdRawDimacsClient(base_url=args.base_url),
            output_dir=args.output_dir,
        )
    except (Exact17V19RunnerError, PiqdDriverError) as exc:
        print(f"exact17-v19 runner rejected: {_bounded_gate_detail(exc)}")
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
