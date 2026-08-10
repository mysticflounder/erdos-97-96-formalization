"""Authenticated structural CEGAR for exact-12 five-omission shards.

Each shard fixes the deleted label in the finite same-labeling boundary CNF.
SAT assignments are replayed against the complete current formula, decoded as
both source-safe cubes and five-omission witnesses, and then classified only
by independently replayed order-independent metric-core certificates.  A
discovery UNSAT is terminal only after a fresh identical-CNF DRAT run verifies.

Even all twelve terminal shards would establish only finite CNF coverage until
the generated certificate bank and universal Lean producer/consumer chain are
checked.  This runner does not itself close a live theorem.
"""

from __future__ import annotations

import argparse
import copy
import hashlib
import json
import os
import shutil
import stat
import subprocess
import tempfile
from collections.abc import Collection, Iterator, Mapping
from contextlib import contextmanager
from pathlib import Path
from typing import Any, BinaryIO

from .candidate_surface import build_model
from .exact12_v14_cell_run import cnf_assignment_satisfies
from .exact12_v14_structural_cegar import (
    STRUCTURAL_CERTIFICATE_SCHEMA,
    _canonical_cube_payload,
    _canonical_json_bytes,
    _canonical_positive_variables,
    _json_object_without_duplicates,
    _reject_json_constant,
    _sha256_json,
    detect_structural_certificate,
    learned_clause_for_certificate,
    validate_structural_certificate,
)
from .sat_encoding import CadicalResult, EncodingError
from .source_faithful_candidate_surface import SOURCE_FAITHFUL_PYTHON_PROFILE
from .source_faithful_five_omission import (
    SOURCE_FAITHFUL_FIVE_OMISSION_SCHEMA,
    FiveOmissionWitness,
    SourceFaithfulFiveOmissionInstance,
)
from .source_faithful_five_omission_shared_bank import (
    SHARED_BANK_SCHEMA,
    AuthenticatedSharedFiveOmissionBank,
    load_shared_bank,
)

LEGACY_RUN_SCHEMA = "p97_rigid221_exact12_five_omission_structural_cegar_run.v2"
LEGACY_RECORD_SCHEMA = "p97_rigid221_exact12_five_omission_structural_cut.v2"
RUN_SCHEMA = "p97_rigid221_exact12_five_omission_structural_cegar_run.v3"
RECORD_SCHEMA = "p97_rigid221_exact12_five_omission_structural_cut.v3"
DETECTOR_CONTRACT = "replayed order-independent MetricCoreAlternative certificate"
MAX_JOURNAL_LINE_BYTES = 8 * 1024 * 1024
MAX_JOURNAL_TOTAL_BYTES = 1024 * 1024 * 1024
MAX_JOURNAL_RECORDS = 100_000
MAX_CNF_BYTES = 512 * 1024 * 1024

RECORD_BODY_KEYS = frozenset(
    {
        "schema",
        "index",
        "parent_sha256",
        "raw_base_formula_sha256",
        "base_formula_sha256",
        "shared_bank_document_sha256",
        "formula_contract_sha256",
        "detector_contract",
        "detector_contract_sha256",
        "deleted_label",
        "detector_stage",
        "certificate_schema",
        "certificate",
        "certificate_sha256",
        "learned_clause",
        "cube",
        "cube_sha256",
        "boundary",
        "boundary_sha256",
        "positive_variables",
        "assignment_sha256",
    }
)
RECORD_KEYS = RECORD_BODY_KEYS | {"record_sha256"}

FORMULA_FILES = (
    "census/card_head/candidate_surface.py",
    "census/card_head/profiles.py",
    "census/card_head/run_manifest.py",
    "census/card_head/sat_encoding.py",
    "census/card_head/source_faithful_candidate_surface.py",
    "census/card_head/source_faithful_five_omission.py",
    "census/card_head/source_faithful_five_omission_shared_bank.py",
    "census/card_head/source_faithful_five_omission_cegar.py",
)
DETECTOR_FILES = (
    "census/card_head/exact12_v14_structural_cegar.py",
    "census/global_confinement/metric_realizability_probe.py",
    "census/global_confinement/cap_selected_nogood_certificate_probe.py",
    "census/p97_search/phase3_classification_context.py",
    "census/p97_search/phase3_order_universe.py",
    "census/global_confinement/critical_shell_probe.py",
    "census/global_confinement/direct_cap_selected_metric_core_probe.py",
    "census/global_confinement/probe.py",
    "census/global_confinement/shadow.py",
    "census/global_confinement/surplus_source_metric_core_probe.py",
    "census/multi_center/multi_center_census.py",
)


class FiveOmissionCegarError(ValueError):
    """The finite shard, journal, certificate, or artifact is malformed."""


def _open_regular_no_follow(path: Path) -> BinaryIO:
    """Open one regular file while rejecting a final-component symlink."""

    nofollow = getattr(os, "O_NOFOLLOW", 0)
    nonblock = getattr(os, "O_NONBLOCK", 0)
    if nofollow == 0 or nonblock == 0:
        raise FiveOmissionCegarError("platform lacks required no-follow file opens")
    flags = os.O_RDONLY | nofollow | nonblock | getattr(os, "O_CLOEXEC", 0)
    try:
        descriptor = os.open(path, flags)
    except OSError as exc:
        raise FiveOmissionCegarError(f"missing regular file: {path}") from exc
    try:
        if not stat.S_ISREG(os.fstat(descriptor).st_mode):
            raise FiveOmissionCegarError(f"missing regular file: {path}")
        handle = os.fdopen(descriptor, "rb")
        descriptor = -1
        return handle
    finally:
        if descriptor >= 0:
            os.close(descriptor)


def _source_record(repo_root: Path, relative: str) -> dict[str, Any]:
    relative_path = Path(relative)
    if relative_path.is_absolute() or ".." in relative_path.parts:
        raise FiveOmissionCegarError("source manifest path is unsafe")
    path = repo_root / relative_path
    digest = hashlib.sha256()
    byte_count = 0
    with _open_regular_no_follow(path) as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
            byte_count += len(chunk)
    return {
        "path": relative,
        "bytes": byte_count,
        "sha256": digest.hexdigest(),
    }


def _source_manifest(
    repo_root: Path, relative_paths: tuple[str, ...]
) -> list[dict[str, Any]]:
    return [_source_record(repo_root, relative) for relative in relative_paths]


def _artifact_no_follow(path: Path) -> dict[str, Any] | None:
    """Hash one regular artifact through the descriptor that was validated."""

    try:
        handle = _open_regular_no_follow(path)
    except FiveOmissionCegarError:
        try:
            os.lstat(path)
        except FileNotFoundError:
            return None
        raise
    digest = hashlib.sha256()
    byte_count = 0
    with handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
            byte_count += len(chunk)
    return {"path": path.name, "bytes": byte_count, "sha256": digest.hexdigest()}


def _read_regular_bytes_no_follow(
    path: Path, *, maximum_bytes: int
) -> tuple[bytes, dict[str, Any]]:
    """Read the bytes from the same regular descriptor that was validated."""

    with _open_regular_no_follow(path) as handle:
        payload = handle.read(maximum_bytes + 1)
    if len(payload) > maximum_bytes:
        raise FiveOmissionCegarError(f"regular file exceeds the size bound: {path}")
    return payload, {
        "path": path.name,
        "bytes": len(payload),
        "sha256": hashlib.sha256(payload).hexdigest(),
    }


@contextmanager
def _regular_unlinked_snapshot(
    path: Path,
) -> Iterator[tuple[BinaryIO, dict[str, Any]]]:
    """Snapshot a validated regular file into an unlinked verifier input."""

    # Ownership remains with this generator until its context exits.
    snapshot = tempfile.TemporaryFile(mode="w+b")  # noqa: SIM115
    digest = hashlib.sha256()
    byte_count = 0
    try:
        with _open_regular_no_follow(path) as source:
            for chunk in iter(lambda: source.read(1 << 20), b""):
                snapshot.write(chunk)
                digest.update(chunk)
                byte_count += len(chunk)
        snapshot.flush()
        snapshot.seek(0)
        yield (
            snapshot,
            {
                "path": path.name,
                "bytes": byte_count,
                "sha256": digest.hexdigest(),
            },
        )
    finally:
        snapshot.close()


def _write_regular_bytes(path: Path, payload: bytes, *, create: bool) -> dict[str, Any]:
    """Persist exact bytes without following or replacing the target."""

    nofollow = getattr(os, "O_NOFOLLOW", 0)
    if nofollow == 0:
        raise FiveOmissionCegarError("platform lacks required no-follow file writes")
    flags = os.O_WRONLY | nofollow | getattr(os, "O_CLOEXEC", 0)
    flags |= os.O_CREAT | os.O_EXCL if create else os.O_TRUNC
    try:
        descriptor = os.open(path, flags, 0o600)
    except OSError as exc:
        raise FiveOmissionCegarError(
            f"artifact write target is unsafe: {path}"
        ) from exc
    try:
        if not stat.S_ISREG(os.fstat(descriptor).st_mode):
            raise FiveOmissionCegarError(f"artifact target is not regular: {path}")
        with os.fdopen(descriptor, "wb") as handle:
            descriptor = -1
            handle.write(payload)
            handle.flush()
            os.fsync(handle.fileno())
    finally:
        if descriptor >= 0:
            os.close(descriptor)
    artifact = _artifact_no_follow(path)
    expected_sha256 = hashlib.sha256(payload).hexdigest()
    if artifact is None or artifact != {
        "path": path.name,
        "bytes": len(payload),
        "sha256": expected_sha256,
    }:
        raise FiveOmissionCegarError(f"persisted artifact drifted: {path}")
    return artifact


def _write_json(path: Path, value: Any) -> None:
    _write_regular_bytes(path, _canonical_json_bytes(value) + b"\n", create=True)


def _copy_regular_exclusive(source: Path, destination: Path) -> None:
    nofollow = getattr(os, "O_NOFOLLOW", 0)
    if nofollow == 0:
        raise FiveOmissionCegarError("platform lacks required no-follow file writes")
    with _open_regular_no_follow(source) as source_handle:
        flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL | nofollow
        flags |= getattr(os, "O_CLOEXEC", 0)
        try:
            descriptor = os.open(destination, flags, 0o600)
        except OSError as exc:
            raise FiveOmissionCegarError("seed journal destination is unsafe") from exc
        try:
            if not stat.S_ISREG(os.fstat(descriptor).st_mode):
                raise FiveOmissionCegarError("seed journal destination is not regular")
            with os.fdopen(descriptor, "wb") as destination_handle:
                descriptor = -1
                shutil.copyfileobj(source_handle, destination_handle)
                destination_handle.flush()
                os.fsync(destination_handle.fileno())
        finally:
            if descriptor >= 0:
                os.close(descriptor)


def _tool_record(name: str) -> dict[str, Any]:
    found = shutil.which(name)
    if found is None:
        raise FiveOmissionCegarError(f"required executable is unavailable: {name}")
    path = Path(found).resolve(strict=True)
    artifact = _artifact_no_follow(path)
    if artifact is None:
        raise FiveOmissionCegarError(f"required executable disappeared: {name}")
    return {
        "name": name,
        "executable_path": str(path),
        "bytes": artifact["bytes"],
        "sha256": artifact["sha256"],
    }


def _tool_manifest() -> list[dict[str, Any]]:
    return [_tool_record(name) for name in ("nice", "cadical", "drat-trim")]


def _verify_tool_manifest(
    tool_manifest: list[dict[str, Any]], names: Collection[str]
) -> None:
    """Fail closed if a recorded executable path no longer has recorded bytes."""

    for name in names:
        matches = [record for record in tool_manifest if record.get("name") == name]
        if len(matches) != 1:
            raise FiveOmissionCegarError(f"tool manifest is missing {name}")
        record = matches[0]
        path = record.get("executable_path")
        if not isinstance(path, str):
            raise FiveOmissionCegarError(f"tool manifest is missing {name}")
        artifact = _artifact_no_follow(Path(path))
        if (
            artifact is None
            or artifact["bytes"] != record.get("bytes")
            or artifact["sha256"] != record.get("sha256")
        ):
            raise FiveOmissionCegarError(f"recorded executable drifted: {name}")


def _claim_workdir(workdir: Path) -> Path:
    try:
        workdir.mkdir(mode=0o700, parents=False, exist_ok=False)
    except FileExistsError as exc:
        raise FiveOmissionCegarError(
            f"workdir must not already exist: {workdir}"
        ) from exc
    workdir.chmod(0o700)
    lock = workdir / ".source_faithful_five_omission_cegar.lock"
    _write_regular_bytes(lock, b"", create=True)
    return lock


def _tool_path(tool_manifest: list[dict[str, Any]], name: str) -> str:
    matches = [record for record in tool_manifest if record.get("name") == name]
    if len(matches) != 1 or not isinstance(matches[0].get("executable_path"), str):
        raise FiveOmissionCegarError(f"tool manifest is missing {name}")
    return matches[0]["executable_path"]


def _solve_persisted_cadical(
    instance: SourceFaithfulFiveOmissionInstance,
    cnf_path: Path,
    expected_cnf_sha256: str,
    *,
    timeout_seconds: int,
    nice: int,
    tool_manifest: list[dict[str, Any]],
    proof_path: Path | None = None,
) -> CadicalResult:
    """Solve descriptor-validated CNF bytes and replay terminal DRAT exactly."""

    cnf_bytes, before = _read_regular_bytes_no_follow(
        cnf_path, maximum_bytes=MAX_CNF_BYTES
    )
    if before["sha256"] != expected_cnf_sha256:
        raise FiveOmissionCegarError("solver CNF differs from the current formula")
    _verify_tool_manifest(tool_manifest, ("nice", "cadical"))
    command = [
        _tool_path(tool_manifest, "nice"),
        "-n",
        str(nice),
        _tool_path(tool_manifest, "cadical"),
        "-q",
        "-t",
        str(timeout_seconds),
        "-",
    ]
    if proof_path is not None:
        try:
            os.lstat(proof_path)
        except FileNotFoundError:
            pass
        else:
            raise FiveOmissionCegarError("terminal proof target already exists")
        command.append(str(proof_path))
    try:
        completed = subprocess.run(
            command,
            input=cnf_bytes,
            capture_output=True,
            timeout=timeout_seconds + 30,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return CadicalResult("TIMEOUT", None, None, False, "subprocess timeout")

    _verify_tool_manifest(tool_manifest, ("nice", "cadical"))
    after = _artifact_no_follow(cnf_path)
    if after != before:
        raise FiveOmissionCegarError("solver CNF changed while CaDiCaL was running")
    stdout = completed.stdout.decode("utf-8", errors="replace")
    stderr = completed.stderr.decode("utf-8", errors="replace")
    output = stdout + "\n" + stderr
    tail = output[-1000:]
    if completed.returncode == 10:
        positive: set[int] = set()
        try:
            for line in stdout.splitlines():
                if line.startswith("v "):
                    literals = tuple(int(token) for token in line[2:].split())
                    positive.update(literal for literal in literals if literal > 0)
        except ValueError:
            return CadicalResult(
                "UNKNOWN",
                None,
                completed.returncode,
                False,
                tail + "\nmalformed SAT assignment",
            )
        return CadicalResult(
            "SAT",
            instance.decode_model(positive),
            completed.returncode,
            False,
            tail,
            frozenset(positive),
        )
    if completed.returncode != 20:
        return CadicalResult("UNKNOWN", None, completed.returncode, False, tail)
    if proof_path is None:
        return CadicalResult("UNSAT", None, completed.returncode, False, tail)

    with _regular_unlinked_snapshot(proof_path) as (proof_snapshot, proof_before):
        if proof_before["bytes"] == 0:
            return CadicalResult("UNSAT", None, completed.returncode, False, tail)
        with tempfile.TemporaryFile(mode="w+b") as cnf_snapshot:
            cnf_snapshot.write(cnf_bytes)
            cnf_snapshot.flush()
            cnf_snapshot.seek(0)
            _verify_tool_manifest(tool_manifest, ("nice", "drat-trim"))
            try:
                checked = subprocess.run(
                    [
                        _tool_path(tool_manifest, "nice"),
                        "-n",
                        str(nice),
                        _tool_path(tool_manifest, "drat-trim"),
                        f"/dev/fd/{cnf_snapshot.fileno()}",
                        f"/dev/fd/{proof_snapshot.fileno()}",
                    ],
                    pass_fds=(cnf_snapshot.fileno(), proof_snapshot.fileno()),
                    capture_output=True,
                    text=True,
                    timeout=timeout_seconds + 30,
                    check=False,
                )
            except subprocess.TimeoutExpired:
                return CadicalResult("UNSAT", None, completed.returncode, False, tail)
            _verify_tool_manifest(tool_manifest, ("nice", "drat-trim"))
    proof_after = _artifact_no_follow(proof_path)
    final_cnf = _artifact_no_follow(cnf_path)
    proof_output = checked.stdout + "\n" + checked.stderr
    proof_verified = (
        checked.returncode == 0
        and any(line.strip() == "s VERIFIED" for line in proof_output.splitlines())
        and proof_after == proof_before
        and final_cnf == before
    )
    return CadicalResult("UNSAT", None, completed.returncode, proof_verified, tail)


def _boundary_payload(witness: FiveOmissionWitness) -> dict[str, Any]:
    return {
        "deleted": witness.deleted,
        "blocker": witness.blocker,
        "centers": list(witness.centers),
    }


def _strict_boundary_payload(value: Any) -> dict[str, Any]:
    if not isinstance(value, Mapping) or set(value) != {
        "deleted",
        "blocker",
        "centers",
    }:
        raise FiveOmissionCegarError("journal boundary witness is malformed")
    deleted = value.get("deleted")
    blocker = value.get("blocker")
    centers = value.get("centers")
    if (
        isinstance(deleted, bool)
        or not isinstance(deleted, int)
        or isinstance(blocker, bool)
        or not isinstance(blocker, int)
        or not isinstance(centers, list)
        or len(centers) != 5
        or any(
            isinstance(center, bool) or not isinstance(center, int)
            for center in centers
        )
        or centers != sorted(centers)
        or len(set(centers)) != 5
    ):
        raise FiveOmissionCegarError("journal boundary witness is malformed")
    return {"deleted": deleted, "blocker": blocker, "centers": centers}


def _record_body(
    *,
    index: int,
    parent_sha256: str,
    raw_base_formula_sha256: str,
    base_formula_sha256: str,
    shared_bank_document_sha256: str | None,
    formula_contract_sha256: str,
    detector_contract_sha256: str,
    deleted_label: int,
    cube: Mapping[int | str, Collection[int]],
    witness: FiveOmissionWitness,
    positive_variables: Collection[int],
    certificate: Mapping[str, Any],
    learned_clause: tuple[int, ...],
) -> dict[str, Any]:
    cube_payload = _canonical_cube_payload(cube)
    boundary_payload = _boundary_payload(witness)
    assignment_payload = _canonical_positive_variables(positive_variables)
    certificate_payload = copy.deepcopy(dict(certificate))
    return {
        "schema": RECORD_SCHEMA,
        "index": index,
        "parent_sha256": parent_sha256,
        "raw_base_formula_sha256": raw_base_formula_sha256,
        "base_formula_sha256": base_formula_sha256,
        "shared_bank_document_sha256": shared_bank_document_sha256,
        "formula_contract_sha256": formula_contract_sha256,
        "detector_contract": DETECTOR_CONTRACT,
        "detector_contract_sha256": detector_contract_sha256,
        "deleted_label": deleted_label,
        "detector_stage": certificate_payload.get("stage"),
        "certificate_schema": STRUCTURAL_CERTIFICATE_SCHEMA,
        "certificate": certificate_payload,
        "certificate_sha256": _sha256_json(certificate_payload),
        "learned_clause": list(learned_clause),
        "cube": cube_payload,
        "cube_sha256": _sha256_json(cube_payload),
        "boundary": boundary_payload,
        "boundary_sha256": _sha256_json(boundary_payload),
        "positive_variables": assignment_payload,
        "assignment_sha256": _sha256_json(assignment_payload),
    }


def _make_record(**kwargs: Any) -> dict[str, Any]:
    body = _record_body(**kwargs)
    return {**body, "record_sha256": _sha256_json(body)}


def _append_record(path: Path, record: Mapping[str, Any]) -> None:
    payload = _canonical_json_bytes(record) + b"\n"
    nofollow = getattr(os, "O_NOFOLLOW", 0)
    if nofollow == 0:
        raise FiveOmissionCegarError("platform lacks required no-follow journal append")
    flags = os.O_WRONLY | os.O_APPEND | nofollow | getattr(os, "O_CLOEXEC", 0)
    try:
        descriptor = os.open(path, flags)
    except OSError as exc:
        raise FiveOmissionCegarError("journal append target is unsafe") from exc
    if not stat.S_ISREG(os.fstat(descriptor).st_mode):
        os.close(descriptor)
        raise FiveOmissionCegarError("journal append target is not regular")
    with os.fdopen(descriptor, "ab") as handle:
        handle.write(payload)
        handle.flush()
        os.fsync(handle.fileno())


def _open_journal(path: Path | BinaryIO) -> tuple[BinaryIO, bool]:
    if isinstance(path, Path):
        return _open_regular_no_follow(path), True
    return path, False


def _is_sha256(value: Any) -> bool:
    return (
        isinstance(value, str)
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    )


def replay_journal(
    instance: SourceFaithfulFiveOmissionInstance,
    journal_path: Path | BinaryIO,
    *,
    raw_base_formula_sha256: str,
    base_formula_sha256: str,
    shared_bank_document_sha256: str | None,
    bootstrap_clauses: Collection[tuple[int, ...]] = (),
    formula_contract_sha256: str,
    detector_contract_sha256: str,
    deleted_label: int,
) -> tuple[int, str, frozenset[tuple[int, ...]]]:
    """Authenticate and replay every structural cut before installing it."""

    recomputed_base_sha256 = hashlib.sha256(
        instance.dimacs().encode("utf-8")
    ).hexdigest()
    if (
        not _is_sha256(raw_base_formula_sha256)
        or not _is_sha256(base_formula_sha256)
        or not _is_sha256(formula_contract_sha256)
        or not _is_sha256(detector_contract_sha256)
        or (
            shared_bank_document_sha256 is not None
            and not _is_sha256(shared_bank_document_sha256)
        )
        or base_formula_sha256 != recomputed_base_sha256
    ):
        raise FiveOmissionCegarError("journal replay contract is malformed or stale")

    handle, should_close = _open_journal(journal_path)
    count = 0
    parent = ""
    bootstrap = tuple(bootstrap_clauses)
    seen: set[tuple[int, ...]] = set(bootstrap)
    if len(seen) != len(bootstrap):
        raise FiveOmissionCegarError("bootstrap clause list contains duplicates")
    pending: list[tuple[int, ...]] = []
    base_clauses = tuple(instance.cnf.clauses)
    if not seen.issubset(set(base_clauses)):
        raise FiveOmissionCegarError(
            "bootstrap clause list is not installed in the effective base formula"
        )
    total_bytes = 0
    try:
        for line_number, raw_line in enumerate(handle, 1):
            total_bytes += len(raw_line)
            if total_bytes > MAX_JOURNAL_TOTAL_BYTES:
                raise FiveOmissionCegarError("journal exceeds the total size bound")
            if count >= MAX_JOURNAL_RECORDS:
                raise FiveOmissionCegarError("journal exceeds the record-count bound")
            if len(raw_line) > MAX_JOURNAL_LINE_BYTES:
                raise FiveOmissionCegarError(
                    f"journal line {line_number} exceeds the size bound"
                )
            if not raw_line.endswith(b"\n"):
                raise FiveOmissionCegarError(f"journal line {line_number} is truncated")
            try:
                record = json.loads(
                    raw_line,
                    object_pairs_hook=_json_object_without_duplicates,
                    parse_constant=_reject_json_constant,
                )
            except (UnicodeDecodeError, ValueError) as exc:
                raise FiveOmissionCegarError(
                    f"journal line {line_number} is not strict JSON"
                ) from exc
            if not isinstance(record, dict) or set(record) != RECORD_KEYS:
                raise FiveOmissionCegarError(f"journal line {line_number} is malformed")
            body = dict(record)
            record_sha256 = body.pop("record_sha256")
            if (
                set(body) != RECORD_BODY_KEYS
                or not _is_sha256(record_sha256)
                or record.get("schema") != RECORD_SCHEMA
                or record.get("index") != count
                or record.get("parent_sha256") != parent
                or record.get("raw_base_formula_sha256")
                != raw_base_formula_sha256
                or record.get("base_formula_sha256") != base_formula_sha256
                or record.get("shared_bank_document_sha256")
                != shared_bank_document_sha256
                or record.get("formula_contract_sha256") != formula_contract_sha256
                or record.get("detector_contract") != DETECTOR_CONTRACT
                or record.get("detector_contract_sha256") != detector_contract_sha256
                or record.get("deleted_label") != deleted_label
                or record_sha256 != _sha256_json(body)
            ):
                raise FiveOmissionCegarError(
                    f"journal line {line_number} failed chain authentication"
                )

            certificate = record.get("certificate")
            if (
                not isinstance(certificate, Mapping)
                or record.get("certificate_schema") != STRUCTURAL_CERTIFICATE_SCHEMA
                or record.get("detector_stage") != certificate.get("stage")
                or record.get("certificate_sha256") != _sha256_json(certificate)
                or not validate_structural_certificate(certificate, n=12)
            ):
                raise FiveOmissionCegarError(
                    f"journal line {line_number} has an invalid certificate"
                )

            clause = learned_clause_for_certificate(instance, certificate)
            if record.get("learned_clause") != list(clause) or clause in seen or not clause:
                raise FiveOmissionCegarError(
                    f"journal line {line_number} learned clause failed replay"
                )

            cube = _canonical_cube_payload(record.get("cube"))
            boundary = _strict_boundary_payload(record.get("boundary"))
            positive = _canonical_positive_variables(
                record.get("positive_variables"),
                n_variables=instance.cnf.n_variables,
            )
            if (
                record.get("cube") != cube
                or record.get("cube_sha256") != _sha256_json(cube)
                or record.get("boundary") != boundary
                or record.get("boundary_sha256") != _sha256_json(boundary)
                or record.get("positive_variables") != positive
                or record.get("assignment_sha256") != _sha256_json(positive)
            ):
                raise FiveOmissionCegarError(
                    f"journal line {line_number} witness hash drifted"
                )
            decoded_cube, decoded_boundary = instance.decode_model_and_boundary(
                positive
            )
            if (
                _canonical_cube_payload(decoded_cube) != cube
                or _boundary_payload(decoded_boundary) != boundary
                or decoded_boundary.deleted != deleted_label
                or not cnf_assignment_satisfies(
                    base_clauses + tuple(pending),
                    frozenset(positive),
                    n_variables=instance.cnf.n_variables,
                )
            ):
                raise FiveOmissionCegarError(
                    f"journal line {line_number} failed exact witness replay"
                )

            if any(literal >= 0 or -literal not in positive for literal in clause):
                raise FiveOmissionCegarError(
                    f"journal line {line_number} learned clause failed replay"
                )
            pending.append(clause)
            seen.add(clause)
            parent = record_sha256
            count += 1
    finally:
        if should_close:
            handle.close()

    for clause in pending:
        instance.cnf.add_clause(clause)
    return count, parent, frozenset(seen)


def _nonterminal_status(result: CadicalResult) -> str:
    if result.verdict in {"TIMEOUT", "UNKNOWN"}:
        return result.verdict
    return "PIPELINE_ERROR"


def _validate_deleted_label(deleted_label: int) -> None:
    if (
        isinstance(deleted_label, bool)
        or not isinstance(deleted_label, int)
        or not 0 <= deleted_label < 12
    ):
        raise FiveOmissionCegarError("deleted label must lie in Fin 12")


def _new_instance(deleted_label: int) -> SourceFaithfulFiveOmissionInstance:
    _validate_deleted_label(deleted_label)
    instance = SourceFaithfulFiveOmissionInstance(
        build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
    )
    instance.cnf.add_clause((instance.deleted_variables[deleted_label],))
    return instance


def _install_shared_bank(
    instance: SourceFaithfulFiveOmissionInstance,
    bank_path: Path | None,
) -> AuthenticatedSharedFiveOmissionBank | None:
    """Replay and install one stable bank, rejecting redundant base clauses."""

    if bank_path is None:
        return None
    bank = load_shared_bank(bank_path, target_instance=instance)
    existing = set(instance.cnf.clauses)
    for clause in bank.clauses:
        if clause in existing:
            raise FiveOmissionCegarError(
                "shared-bank clause is already present in the raw shard formula"
            )
        instance.cnf.add_clause(clause)
        existing.add(clause)
    return bank


def _shared_bank_summary(
    bank: AuthenticatedSharedFiveOmissionBank | None,
) -> dict[str, Any]:
    if bank is None:
        return {
            "enabled": False,
            "schema": None,
            "artifact_sha256": None,
            "artifact_bytes": None,
            "document_sha256": None,
            "bootstrap_clause_list_sha256": None,
            "record_count": 0,
            "source_run_count": 0,
            "source_contract": None,
        }
    return {
        "enabled": True,
        "schema": SHARED_BANK_SCHEMA,
        "artifact_sha256": bank.artifact_sha256,
        "artifact_bytes": bank.artifact_bytes,
        "document_sha256": bank.document_sha256,
        "bootstrap_clause_list_sha256": bank.bootstrap_clause_list_sha256,
        "record_count": len(bank.records),
        "source_run_count": len(bank.source_runs),
        "source_contract": bank.source_contract,
    }


def _journal_replay_matches(
    audit_instance: SourceFaithfulFiveOmissionInstance,
    *,
    audit_count: int,
    audit_parent: str,
    audit_seen: Collection[tuple[int, ...]],
    record_count: int,
    parent_sha256: str,
    seen_clauses: Collection[tuple[int, ...]],
    current_formula_sha256: str,
) -> bool:
    """Check the complete replay state, including reconstructed CNF bytes."""

    replayed_formula_sha256 = hashlib.sha256(
        audit_instance.dimacs().encode("utf-8")
    ).hexdigest()
    return (
        audit_count == record_count
        and audit_parent == parent_sha256
        and frozenset(audit_seen) == frozenset(seen_clauses)
        and replayed_formula_sha256 == current_formula_sha256
    )


def run_five_omission_cegar(
    repo_root: Path,
    workdir: Path,
    deleted_label: int,
    *,
    max_iterations: int = 100,
    timeout_seconds: int = 60,
    nice: int = 10,
    seed_journal: Path | None = None,
    shared_bank: Path | None = None,
) -> dict[str, Any]:
    """Run one replay-gated deleted-label shard."""

    if (
        isinstance(max_iterations, bool)
        or not isinstance(max_iterations, int)
        or max_iterations <= 0
        or isinstance(timeout_seconds, bool)
        or not isinstance(timeout_seconds, int)
        or timeout_seconds <= 0
        or isinstance(nice, bool)
        or not isinstance(nice, int)
        or not 1 <= nice <= 19
    ):
        raise FiveOmissionCegarError("invalid iteration, timeout, or nice value")

    _validate_deleted_label(deleted_label)
    repo_root = repo_root.resolve()
    workdir = workdir.resolve()
    if not workdir.parent.is_dir():
        raise FiveOmissionCegarError("workdir parent must already exist")
    lock = _claim_workdir(workdir)
    try:
        formula_manifest = _source_manifest(repo_root, FORMULA_FILES)
        detector_manifest = _source_manifest(repo_root, DETECTOR_FILES)
        formula_contract_sha256 = _sha256_json(formula_manifest)
        detector_contract_sha256 = _sha256_json(detector_manifest)
        tool_manifest = _tool_manifest()
        tool_contract_sha256 = _sha256_json(tool_manifest)
        instance = _new_instance(deleted_label)
        raw_base_clause_count = len(instance.cnf.clauses)
        raw_base_formula_sha256 = hashlib.sha256(
            instance.dimacs().encode("utf-8")
        ).hexdigest()
        bank_path: Path | None = None
        if shared_bank is not None:
            bank_path = workdir / "shared-bank.json"
            _copy_regular_exclusive(shared_bank, bank_path)
        bank = _install_shared_bank(instance, bank_path)
        bootstrap_clauses = bank.clauses if bank is not None else ()
        shared_bank_document_sha256 = (
            bank.document_sha256 if bank is not None else None
        )
        base_clause_count = len(instance.cnf.clauses)
        base_formula_sha256 = hashlib.sha256(
            instance.dimacs().encode("utf-8")
        ).hexdigest()

        journal_path = workdir / "journal.jsonl"
        if seed_journal is None:
            _write_regular_bytes(journal_path, b"", create=True)
        else:
            _copy_regular_exclusive(seed_journal, journal_path)

        record_count, parent_sha256, replayed = replay_journal(
            instance,
            journal_path,
            raw_base_formula_sha256=raw_base_formula_sha256,
            base_formula_sha256=base_formula_sha256,
            shared_bank_document_sha256=shared_bank_document_sha256,
            bootstrap_clauses=bootstrap_clauses,
            formula_contract_sha256=formula_contract_sha256,
            detector_contract_sha256=detector_contract_sha256,
            deleted_label=deleted_label,
        )
        seen_clauses = set(replayed)
        status = "ITERATION_LIMIT"
        error: str | None = None
        discovery: CadicalResult | None = None
        terminal: CadicalResult | None = None
        replay: dict[str, bool] | None = None
        current_formula_sha256 = base_formula_sha256

        for local_iteration in range(max_iterations):
            discovery_path = workdir / "discovery.cnf"
            current_dimacs = instance.dimacs().encode("utf-8")
            current_formula_sha256 = hashlib.sha256(current_dimacs).hexdigest()
            _write_regular_bytes(
                discovery_path,
                current_dimacs,
                create=local_iteration == 0,
            )
            discovery = _solve_persisted_cadical(
                instance,
                discovery_path,
                current_formula_sha256,
                timeout_seconds=timeout_seconds,
                nice=nice,
                tool_manifest=tool_manifest,
            )
            if discovery.verdict == "UNSAT":
                terminal_path = workdir / "terminal.cnf"
                proof_path = workdir / "terminal.drat"
                try:
                    _write_regular_bytes(terminal_path, current_dimacs, create=True)
                    terminal = _solve_persisted_cadical(
                        instance,
                        terminal_path,
                        current_formula_sha256,
                        timeout_seconds=timeout_seconds,
                        nice=nice,
                        tool_manifest=tool_manifest,
                        proof_path=proof_path,
                    )
                except (FiveOmissionCegarError, OSError) as exc:
                    status = "DISCOVERY_UNSAT_UNVERIFIED"
                    error = f"terminal custody or proof rerun failed: {exc}"
                    break
                discovery_artifact = _artifact_no_follow(discovery_path)
                terminal_artifact = _artifact_no_follow(terminal_path)
                if (
                    terminal.verdict == "UNSAT"
                    and terminal.proof_verified
                    and _artifact_no_follow(proof_path) is not None
                    and discovery_artifact is not None
                    and terminal_artifact is not None
                    and discovery_artifact["bytes"] == terminal_artifact["bytes"]
                    and discovery_artifact["sha256"]
                    == terminal_artifact["sha256"]
                    == current_formula_sha256
                ):
                    status = "UNSAT_DRAT_VERIFIED"
                else:
                    status = "DISCOVERY_UNSAT_UNVERIFIED"
                    error = "fresh identical-CNF terminal proof rerun failed"
                break
            if discovery.verdict != "SAT":
                status = _nonterminal_status(discovery)
                break
            if discovery.cube is None or discovery.positive_variables is None:
                status = "PIPELINE_ERROR"
                error = "SAT result omitted cube or positive assignment"
                break

            positive = discovery.positive_variables
            try:
                cube, boundary = instance.decode_model_and_boundary(positive)
            except EncodingError as exc:
                status = "SAT_REPLAY_FAILED"
                error = str(exc)
                break
            replay = {
                "same_labeling_boundary": boundary.deleted == deleted_label,
                "exact_cnf": cnf_assignment_satisfies(
                    instance.cnf.clauses,
                    positive,
                    n_variables=instance.cnf.n_variables,
                ),
            }
            if not all(replay.values()):
                status = "SAT_REPLAY_FAILED"
                error = "SAT assignment failed boundary or exact-CNF replay"
                break

            certificate = detect_structural_certificate(cube, n=12)
            if certificate is None:
                status = "STRUCTURALLY_UNRESOLVED"
                _write_json(
                    workdir / "survivor.json",
                    {
                        "deleted_label": deleted_label,
                        "local_iteration": local_iteration,
                        "cube": _canonical_cube_payload(cube),
                        "boundary": _boundary_payload(boundary),
                        "replay": replay,
                    },
                )
                break
            clause = learned_clause_for_certificate(instance, certificate)
            if clause in seen_clauses:
                status = "DETECTOR_REPEAT"
                error = "detector repeated a replayed learned clause"
                break
            record = _make_record(
                index=record_count,
                parent_sha256=parent_sha256,
                raw_base_formula_sha256=raw_base_formula_sha256,
                base_formula_sha256=base_formula_sha256,
                shared_bank_document_sha256=shared_bank_document_sha256,
                formula_contract_sha256=formula_contract_sha256,
                detector_contract_sha256=detector_contract_sha256,
                deleted_label=deleted_label,
                cube=cube,
                witness=boundary,
                positive_variables=positive,
                certificate=certificate,
                learned_clause=clause,
            )
            _append_record(journal_path, record)
            instance.cnf.add_clause(clause)
            seen_clauses.add(clause)
            parent_sha256 = record["record_sha256"]
            record_count += 1

        # A SAT iteration appends its learned clause after the discovery CNF is
        # materialized.  At an iteration limit, bind the summary to the fully
        # replayable post-journal formula rather than the stale pre-cut solve.
        current_formula_sha256 = hashlib.sha256(
            instance.dimacs().encode("utf-8")
        ).hexdigest()

        audit_instance = _new_instance(deleted_label)
        if hashlib.sha256(audit_instance.dimacs().encode("utf-8")).hexdigest() != (
            raw_base_formula_sha256
        ):
            raise FiveOmissionCegarError("raw shard formula changed before final replay")
        audit_bank = _install_shared_bank(audit_instance, bank_path)
        audit_bootstrap_clauses = audit_bank.clauses if audit_bank is not None else ()
        if (
            (audit_bank.document_sha256 if audit_bank is not None else None)
            != shared_bank_document_sha256
            or audit_bootstrap_clauses != bootstrap_clauses
        ):
            raise FiveOmissionCegarError("shared bank changed before final replay")
        audit_count, audit_parent, audit_seen = replay_journal(
            audit_instance,
            journal_path,
            raw_base_formula_sha256=raw_base_formula_sha256,
            base_formula_sha256=base_formula_sha256,
            shared_bank_document_sha256=shared_bank_document_sha256,
            bootstrap_clauses=audit_bootstrap_clauses,
            formula_contract_sha256=formula_contract_sha256,
            detector_contract_sha256=detector_contract_sha256,
            deleted_label=deleted_label,
        )
        journal_replayed = _journal_replay_matches(
            audit_instance,
            audit_count=audit_count,
            audit_parent=audit_parent,
            audit_seen=audit_seen,
            record_count=record_count,
            parent_sha256=parent_sha256,
            seen_clauses=seen_clauses,
            current_formula_sha256=current_formula_sha256,
        )
        try:
            source_manifests_rechecked = (
                _source_manifest(repo_root, FORMULA_FILES) == formula_manifest
                and _source_manifest(repo_root, DETECTOR_FILES) == detector_manifest
            )
        except FiveOmissionCegarError:
            source_manifests_rechecked = False
        tools_rechecked = True
        try:
            _verify_tool_manifest(tool_manifest, ("nice", "cadical", "drat-trim"))
        except FiveOmissionCegarError:
            tools_rechecked = False
        artifacts = {
            "journal": _artifact_no_follow(journal_path),
            "shared_bank": _artifact_no_follow(bank_path) if bank_path else None,
            "discovery_cnf": _artifact_no_follow(workdir / "discovery.cnf"),
            "terminal_cnf": _artifact_no_follow(workdir / "terminal.cnf"),
            "proof": _artifact_no_follow(workdir / "terminal.drat"),
            "survivor": _artifact_no_follow(workdir / "survivor.json"),
        }
        if not journal_replayed:
            status = "ARTIFACT_REPLAY_FAILED"
            error = "complete structural journal failed replay"
        if not source_manifests_rechecked or not tools_rechecked:
            status = "ARTIFACT_REPLAY_FAILED"
            error = "source or tool manifest drifted during the run"
        summary = {
            "schema": RUN_SCHEMA,
            "scope": (
                "one finite exact-12 deleted-label shard under replayed "
                "order-independent structural CEGAR; no all-shard coverage, "
                "universal lift, or Lean closure"
            ),
            "finite_instance_schema": SOURCE_FAITHFUL_FIVE_OMISSION_SCHEMA,
            "deleted_label": deleted_label,
            "raw_base_formula_sha256": raw_base_formula_sha256,
            "base_formula_sha256": base_formula_sha256,
            "current_formula_sha256": current_formula_sha256,
            "n_variables": instance.cnf.n_variables,
            "raw_base_clause_count": raw_base_clause_count,
            "base_clause_count": base_clause_count,
            "current_clause_count": len(instance.cnf.clauses),
            "shared_bank": _shared_bank_summary(bank),
            "selector_variables": {
                "deleted": list(instance.deleted_variables.values()),
                "blocker": list(instance.blocker_variables.values()),
                "centers": list(instance.center_variables.values()),
            },
            "formula_source_manifest": formula_manifest,
            "formula_contract_sha256": formula_contract_sha256,
            "detector_source_manifest": detector_manifest,
            "detector_contract_sha256": detector_contract_sha256,
            "tool_manifest": tool_manifest,
            "tool_contract_sha256": tool_contract_sha256,
            "tool_execution_assumption": (
                "recorded executable bytes are checked before and after each call; "
                "adversarial same-user swap-and-restore is outside this runner's "
                "trust boundary"
            ),
            "status": status,
            "records": record_count,
            "terminal_record_sha256": parent_sha256 if record_count else None,
            "discovery_verdict": discovery.verdict if discovery else None,
            "terminal_verdict": terminal.verdict if terminal else None,
            "terminal_proof_verified": terminal.proof_verified if terminal else False,
            "replay": replay,
            "journal_replayed": journal_replayed,
            "source_manifests_rechecked": source_manifests_rechecked,
            "tools_rechecked": tools_rechecked,
            "max_iterations": max_iterations,
            "timeout_seconds": timeout_seconds,
            "artifacts": artifacts,
            "error": error,
        }
        _write_json(workdir / "summary.json", summary)
        return summary
    finally:
        lock.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--deleted-label", type=int, required=True)
    parser.add_argument("--max-iterations", type=int, default=100)
    parser.add_argument("--timeout-seconds", type=int, default=60)
    parser.add_argument("--nice", type=int, default=10)
    parser.add_argument("--seed-journal", type=Path)
    parser.add_argument("--shared-bank", type=Path)
    args = parser.parse_args()
    try:
        summary = run_five_omission_cegar(
            args.repo_root,
            args.workdir,
            args.deleted_label,
            max_iterations=args.max_iterations,
            timeout_seconds=args.timeout_seconds,
            nice=args.nice,
            seed_journal=args.seed_journal,
            shared_bank=args.shared_bank,
        )
    except (FiveOmissionCegarError, EncodingError, OSError, ValueError) as exc:
        print(json.dumps({"status": "PIPELINE_ERROR", "error": str(exc)}))
        return 2
    print(json.dumps(summary, sort_keys=True))
    return 0 if summary["status"] == "UNSAT_DRAT_VERIFIED" else 1


if __name__ == "__main__":
    raise SystemExit(main())
