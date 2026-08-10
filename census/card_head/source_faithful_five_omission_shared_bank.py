"""Strict shared structural-cut bank for exact-12 five-omission shards.

The bank contains only independently replayable metric certificates and their
exact selected-row clauses.  Source-run hashes are provenance; soundness comes
from rechecking every certificate and recompiling every clause against the
target shard before installation.

Loading a bank does not prove terminal UNSAT, all-shard coverage, a universal
lift, or closure of a live Lean theorem.
"""

from __future__ import annotations

import hashlib
import json
import os
import stat
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from .exact12_v14_structural_cegar import (
    STRUCTURAL_CERTIFICATE_SCHEMA,
    learned_clause_for_certificate,
    validate_structural_certificate,
)
from .sat_encoding import CoverInstance

SHARED_BANK_SCHEMA = "p97_exact12_five_omission_shared_structural_bank.v2"
SHARED_BANK_SCOPE = (
    "Replayable exact-12 structural cuts shared across deleted-label shards; "
    "not terminal UNSAT, universal lift, or live Lean closure"
)
EXPECTED_RUN_SCHEMA = "p97_rigid221_exact12_five_omission_structural_cegar_run.v2"
EXPECTED_RECORD_SCHEMA = "p97_rigid221_exact12_five_omission_structural_cut.v2"
SUPPORTED_STAGES = frozenset(
    {
        "equality-duplicate-center",
        "equality-equilateral-bisector-collision",
    }
)
MAX_SHARED_BANK_BYTES = 128 * 1024 * 1024
MAX_SHARED_BANK_RECORDS = 100_000

DOCUMENT_BODY_KEYS = frozenset(
    {
        "schema",
        "scope",
        "source_run_count",
        "source_contract",
        "source_runs",
        "record_count",
        "bootstrap_clause_list_sha256",
        "records",
    }
)
DOCUMENT_KEYS = DOCUMENT_BODY_KEYS | {"document_sha256"}
SOURCE_RUN_KEYS = frozenset(
    {
        "deleted_label",
        "record_count",
        "status",
        "base_formula_sha256",
        "current_formula_sha256",
        "summary_sha256",
        "summary_bytes",
        "journal_sha256",
        "journal_bytes",
        "terminal_record_sha256",
    }
)
SOURCE_CONTRACT_KEYS = frozenset(
    {
        "run_schema",
        "record_schema",
        "certificate_schema",
        "formula_contract_sha256",
        "detector_contract_sha256",
        "tool_contract_sha256",
    }
)
OCCURRENCE_KEYS = frozenset({"deleted_label", "record_index", "record_sha256"})
BANK_RECORD_KEYS = frozenset(
    {
        "index",
        "detector_stage",
        "certificate_schema",
        "certificate",
        "certificate_sha256",
        "learned_clause",
        "learned_clause_sha256",
        "occurrences",
    }
)


class SharedFiveOmissionBankError(ValueError):
    """The shared structural bank failed strict authentication or replay."""


@dataclass(frozen=True)
class AuthenticatedSharedFiveOmissionBank:
    """A stable bank whose certificates were replayed against one target."""

    path: Path
    artifact_sha256: str
    artifact_bytes: int
    document_sha256: str
    source_runs: tuple[dict[str, Any], ...]
    records: tuple[dict[str, Any], ...]
    clauses: tuple[tuple[int, ...], ...]


def _reject_json_constant(value: str) -> Any:
    raise ValueError(f"non-finite JSON constant is forbidden: {value}")


def _object_without_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("utf-8")


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def _is_sha256(value: Any) -> bool:
    return (
        isinstance(value, str)
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    )


def _strict_positive_int(value: Any, *, field: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or value <= 0:
        raise SharedFiveOmissionBankError(f"{field} must be a positive integer")
    return value


def _strict_nonnegative_int(value: Any, *, field: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or value < 0:
        raise SharedFiveOmissionBankError(f"{field} must be a nonnegative integer")
    return value


def _strict_sha256(value: Any, *, field: str) -> str:
    if not _is_sha256(value):
        raise SharedFiveOmissionBankError(f"{field} is not a SHA-256 digest")
    return value


def _read_regular_bytes_no_follow(path: Path) -> bytes:
    nofollow = getattr(os, "O_NOFOLLOW", None)
    if nofollow is None:
        raise SharedFiveOmissionBankError("platform lacks no-follow file reads")
    flags = os.O_RDONLY | nofollow | getattr(os, "O_CLOEXEC", 0)
    try:
        descriptor = os.open(path, flags)
    except OSError as exc:
        raise SharedFiveOmissionBankError(
            "shared bank cannot be opened safely"
        ) from exc
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode):
            raise SharedFiveOmissionBankError("shared bank is not a regular file")
        if info.st_size > MAX_SHARED_BANK_BYTES:
            raise SharedFiveOmissionBankError("shared bank exceeds its size bound")
        chunks: list[bytes] = []
        total = 0
        while total <= MAX_SHARED_BANK_BYTES:
            chunk = os.read(
                descriptor, min(1024 * 1024, MAX_SHARED_BANK_BYTES + 1 - total)
            )
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
        payload = b"".join(chunks)
        if len(payload) > MAX_SHARED_BANK_BYTES:
            raise SharedFiveOmissionBankError("shared bank exceeds its size bound")
        return payload
    finally:
        os.close(descriptor)


def write_new_shared_bank(path: Path, document: Mapping[str, Any]) -> None:
    """Durably create one canonical bank without replacing an existing file."""

    path.parent.mkdir(parents=True, exist_ok=True)
    payload = _canonical_json_bytes(document) + b"\n"
    nofollow = getattr(os, "O_NOFOLLOW", None)
    if nofollow is None:
        raise SharedFiveOmissionBankError("platform lacks no-follow file creation")
    flags = (
        os.O_WRONLY | os.O_CREAT | os.O_EXCL | nofollow | getattr(os, "O_CLOEXEC", 0)
    )
    descriptor = os.open(path, flags, 0o600)
    try:
        with os.fdopen(descriptor, "wb", closefd=False) as handle:
            handle.write(payload)
            handle.flush()
            os.fsync(handle.fileno())
    finally:
        os.close(descriptor)
    directory_descriptor = os.open(
        path.parent, os.O_RDONLY | getattr(os, "O_CLOEXEC", 0)
    )
    try:
        os.fsync(directory_descriptor)
    finally:
        os.close(directory_descriptor)
    if _read_regular_bytes_no_follow(path) != payload:
        raise SharedFiveOmissionBankError("shared bank failed exact write read-back")


def _source_run_payload(run: Any) -> dict[str, Any]:
    deleted_label = _strict_nonnegative_int(
        run.deleted_label, field="source deleted_label"
    )
    if deleted_label >= 12:
        raise SharedFiveOmissionBankError("source deleted_label is outside Fin 12")
    summary_artifact = run.summary_artifact
    journal_artifact = run.journal_artifact
    if not isinstance(summary_artifact, Mapping) or not isinstance(
        journal_artifact, Mapping
    ):
        raise SharedFiveOmissionBankError("source artifact metadata is malformed")
    terminal = run.terminal_record_sha256
    if terminal is not None and not _is_sha256(terminal):
        raise SharedFiveOmissionBankError("source terminal record hash is malformed")
    summary = run.summary
    if not isinstance(summary, Mapping):
        raise SharedFiveOmissionBankError("source run summary is malformed")
    status = summary.get("status")
    if status not in {"ITERATION_LIMIT", "UNSAT"}:
        raise SharedFiveOmissionBankError("source run status is not bankable")
    return {
        "deleted_label": deleted_label,
        "record_count": len(run.records),
        "status": status,
        "base_formula_sha256": _strict_sha256(
            summary.get("base_formula_sha256"), field="source base formula hash"
        ),
        "current_formula_sha256": _strict_sha256(
            summary.get("current_formula_sha256"), field="source current formula hash"
        ),
        "summary_sha256": _strict_sha256(
            summary_artifact.get("sha256"), field="source summary_sha256"
        ),
        "summary_bytes": _strict_positive_int(
            summary_artifact.get("bytes"), field="source summary_bytes"
        ),
        "journal_sha256": _strict_sha256(
            journal_artifact.get("sha256"), field="source journal_sha256"
        ),
        "journal_bytes": _strict_positive_int(
            journal_artifact.get("bytes"), field="source journal_bytes"
        ),
        "terminal_record_sha256": terminal,
    }


def _fixed_deleted_label(instance: CoverInstance) -> int:
    deleted_variables = getattr(instance, "deleted_variables", None)
    if not isinstance(deleted_variables, dict) or set(deleted_variables) != set(
        range(12)
    ):
        raise SharedFiveOmissionBankError(
            "shared bank target lacks the exact Fin 12 deleted selector"
        )
    fixed = tuple(
        label
        for label, variable in deleted_variables.items()
        if (variable,) in instance.cnf.clauses
    )
    if len(fixed) != 1:
        raise SharedFiveOmissionBankError(
            "shared bank target must fix exactly one deleted label"
        )
    return fixed[0]


def build_shared_bank_document(
    runs: Sequence[Any], target_instances: Sequence[CoverInstance]
) -> dict[str, Any]:
    """Deduplicate authenticated run records into one replayable document."""

    if not runs:
        raise SharedFiveOmissionBankError("at least one authenticated run is required")
    source_runs = tuple(_source_run_payload(run) for run in runs)
    labels = tuple(source["deleted_label"] for source in source_runs)
    if set(labels) != set(range(12)) or len(labels) != 12:
        raise SharedFiveOmissionBankError(
            "shared bank requires exactly one source run for every Fin 12 label"
        )
    target_labels = tuple(
        _fixed_deleted_label(instance) for instance in target_instances
    )
    if len(target_instances) != 12 or set(target_labels) != set(range(12)):
        raise SharedFiveOmissionBankError(
            "shared bank portability requires exactly one target per Fin 12 label"
        )

    summaries = tuple(run.summary for run in runs)
    contract_fields = (
        "schema",
        "formula_contract_sha256",
        "detector_contract_sha256",
        "tool_contract_sha256",
    )
    contracts = {
        field: {summary.get(field) for summary in summaries}
        for field in contract_fields
    }
    if any(len(values) != 1 for values in contracts.values()):
        raise SharedFiveOmissionBankError("source run contracts disagree")
    run_schema = next(iter(contracts["schema"]))
    if run_schema != EXPECTED_RUN_SCHEMA:
        raise SharedFiveOmissionBankError("source run schema is unsupported")
    source_contract = {
        "run_schema": run_schema,
        "record_schema": EXPECTED_RECORD_SCHEMA,
        "certificate_schema": STRUCTURAL_CERTIFICATE_SCHEMA,
        "formula_contract_sha256": _strict_sha256(
            next(iter(contracts["formula_contract_sha256"])),
            field="source formula contract",
        ),
        "detector_contract_sha256": _strict_sha256(
            next(iter(contracts["detector_contract_sha256"])),
            field="source detector contract",
        ),
        "tool_contract_sha256": _strict_sha256(
            next(iter(contracts["tool_contract_sha256"])),
            field="source tool contract",
        ),
    }

    selected: dict[tuple[int, ...], list[dict[str, Any]]] = {}
    certificates: dict[tuple[int, ...], dict[str, Any]] = {}
    source_locators: set[tuple[int, int]] = set()
    for run in runs:
        for expected_index, raw_record in enumerate(run.records):
            if not isinstance(raw_record, Mapping):
                raise SharedFiveOmissionBankError("source record is not an object")
            stage = raw_record.get("detector_stage")
            certificate = raw_record.get("certificate")
            if stage not in SUPPORTED_STAGES:
                raise SharedFiveOmissionBankError(
                    f"unsupported source detector stage: {stage}"
                )
            if (
                raw_record.get("schema") != EXPECTED_RECORD_SCHEMA
                or not isinstance(certificate, Mapping)
                or raw_record.get("certificate_schema") != STRUCTURAL_CERTIFICATE_SCHEMA
                or certificate.get("stage") != stage
                or not validate_structural_certificate(certificate, n=12)
            ):
                raise SharedFiveOmissionBankError("source certificate failed replay")
            certificate_payload = dict(certificate)
            certificate_sha256 = _sha256_json(certificate_payload)
            if raw_record.get("certificate_sha256") != certificate_sha256:
                raise SharedFiveOmissionBankError("source certificate hash drifted")
            clauses = tuple(
                learned_clause_for_certificate(instance, certificate)
                for instance in target_instances
            )
            if len(set(clauses)) != 1:
                raise SharedFiveOmissionBankError(
                    "source learned clause is not portable across all shards"
                )
            clause = clauses[0]
            if raw_record.get("learned_clause") != list(clause):
                raise SharedFiveOmissionBankError("source learned clause failed replay")
            source_index = _strict_nonnegative_int(
                raw_record.get("index"), field="source record index"
            )
            source_locator = (run.deleted_label, source_index)
            if (
                source_index != expected_index
                or source_locator in source_locators
                or raw_record.get("deleted_label") != run.deleted_label
                or raw_record.get("base_formula_sha256")
                != run.summary.get("base_formula_sha256")
                or raw_record.get("formula_contract_sha256")
                != source_contract["formula_contract_sha256"]
                or raw_record.get("detector_contract_sha256")
                != source_contract["detector_contract_sha256"]
            ):
                raise SharedFiveOmissionBankError(
                    "source record custody does not match its authenticated run"
                )
            source_locators.add(source_locator)
            source_record_sha256 = _strict_sha256(
                raw_record.get("record_sha256"), field="source record_sha256"
            )
            record_body = dict(raw_record)
            record_body.pop("record_sha256", None)
            if source_record_sha256 != _sha256_json(record_body):
                raise SharedFiveOmissionBankError("source record hash drifted")
            occurrence = {
                "deleted_label": run.deleted_label,
                "record_index": source_index,
                "record_sha256": source_record_sha256,
            }
            selected.setdefault(clause, []).append(occurrence)
            current = certificates.get(clause)
            if current is None or certificate_sha256 < current["certificate_sha256"]:
                certificates[clause] = {
                    "detector_stage": stage,
                    "certificate": certificate_payload,
                    "certificate_sha256": certificate_sha256,
                }

    records: list[dict[str, Any]] = []
    for index, clause in enumerate(sorted(selected)):
        certificate_entry = certificates[clause]
        records.append(
            {
                "index": index,
                "detector_stage": certificate_entry["detector_stage"],
                "certificate_schema": STRUCTURAL_CERTIFICATE_SCHEMA,
                "certificate": certificate_entry["certificate"],
                "certificate_sha256": certificate_entry["certificate_sha256"],
                "learned_clause": list(clause),
                "learned_clause_sha256": _sha256_json(list(clause)),
                "occurrences": sorted(
                    selected[clause],
                    key=lambda occurrence: (
                        occurrence["deleted_label"],
                        occurrence["record_index"],
                        occurrence["record_sha256"],
                    ),
                ),
            }
        )
    if not records:
        raise SharedFiveOmissionBankError("authenticated runs supplied no cuts")
    body = {
        "schema": SHARED_BANK_SCHEMA,
        "scope": SHARED_BANK_SCOPE,
        "source_run_count": len(source_runs),
        "source_contract": source_contract,
        "source_runs": sorted(source_runs, key=lambda source: source["deleted_label"]),
        "record_count": len(records),
        "bootstrap_clause_list_sha256": _sha256_json(
            [record["learned_clause"] for record in records]
        ),
        "records": records,
    }
    return {**body, "document_sha256": _sha256_json(body)}


def load_shared_bank(
    path: Path, target_instance: CoverInstance
) -> AuthenticatedSharedFiveOmissionBank:
    """Strictly authenticate and replay a shared bank for one target shard."""

    payload = _read_regular_bytes_no_follow(path)
    if not payload.endswith(b"\n"):
        raise SharedFiveOmissionBankError("shared bank is truncated")
    try:
        document = json.loads(
            payload,
            object_pairs_hook=_object_without_duplicates,
            parse_constant=_reject_json_constant,
        )
    except (UnicodeDecodeError, ValueError) as exc:
        raise SharedFiveOmissionBankError("shared bank is not strict JSON") from exc
    if not isinstance(document, dict) or set(document) != DOCUMENT_KEYS:
        raise SharedFiveOmissionBankError("shared bank document shape changed")
    if payload != _canonical_json_bytes(document) + b"\n":
        raise SharedFiveOmissionBankError("shared bank is not canonically serialized")
    body = dict(document)
    document_sha256 = body.pop("document_sha256")
    if (
        set(body) != DOCUMENT_BODY_KEYS
        or document.get("schema") != SHARED_BANK_SCHEMA
        or document.get("scope") != SHARED_BANK_SCOPE
        or not _is_sha256(document_sha256)
        or document_sha256 != _sha256_json(body)
    ):
        raise SharedFiveOmissionBankError("shared bank contract or digest failed")

    source_contract = document.get("source_contract")
    if (
        not isinstance(source_contract, dict)
        or set(source_contract) != SOURCE_CONTRACT_KEYS
        or source_contract.get("run_schema") != EXPECTED_RUN_SCHEMA
        or source_contract.get("record_schema") != EXPECTED_RECORD_SCHEMA
        or source_contract.get("certificate_schema") != STRUCTURAL_CERTIFICATE_SCHEMA
    ):
        raise SharedFiveOmissionBankError("shared bank source contract is malformed")
    for field in (
        "formula_contract_sha256",
        "detector_contract_sha256",
        "tool_contract_sha256",
    ):
        _strict_sha256(source_contract.get(field), field=f"bank {field}")

    raw_sources = document.get("source_runs")
    source_count = document.get("source_run_count")
    if (
        not isinstance(raw_sources, list)
        or isinstance(source_count, bool)
        or not isinstance(source_count, int)
        or source_count != len(raw_sources)
        or source_count != 12
    ):
        raise SharedFiveOmissionBankError("shared bank source table is malformed")
    sources: list[dict[str, Any]] = []
    source_labels: set[int] = set()
    for source in raw_sources:
        if not isinstance(source, dict) or set(source) != SOURCE_RUN_KEYS:
            raise SharedFiveOmissionBankError("shared bank source entry changed shape")
        label = _strict_nonnegative_int(
            source.get("deleted_label"), field="bank source deleted_label"
        )
        if label >= 12 or label in source_labels:
            raise SharedFiveOmissionBankError("bank source labels are invalid")
        source_labels.add(label)
        _strict_nonnegative_int(source.get("record_count"), field="bank source records")
        if source.get("status") not in {"ITERATION_LIMIT", "UNSAT"}:
            raise SharedFiveOmissionBankError("bank source status is unsupported")
        _strict_sha256(
            source.get("base_formula_sha256"), field="bank base formula hash"
        )
        _strict_sha256(
            source.get("current_formula_sha256"), field="bank current formula hash"
        )
        _strict_sha256(source.get("summary_sha256"), field="bank summary_sha256")
        _strict_positive_int(source.get("summary_bytes"), field="bank summary_bytes")
        _strict_sha256(source.get("journal_sha256"), field="bank journal_sha256")
        _strict_positive_int(source.get("journal_bytes"), field="bank journal_bytes")
        terminal = source.get("terminal_record_sha256")
        if terminal is not None and not _is_sha256(terminal):
            raise SharedFiveOmissionBankError("bank terminal record hash is malformed")
        sources.append(source)
    if source_labels != set(range(12)) or [
        source["deleted_label"] for source in sources
    ] != list(range(12)):
        raise SharedFiveOmissionBankError("bank must cover all Fin 12 source labels")

    raw_records = document.get("records")
    record_count = document.get("record_count")
    if (
        not isinstance(raw_records, list)
        or isinstance(record_count, bool)
        or not isinstance(record_count, int)
        or record_count != len(raw_records)
        or not 0 < record_count <= MAX_SHARED_BANK_RECORDS
    ):
        raise SharedFiveOmissionBankError("shared bank record table is malformed")
    records: list[dict[str, Any]] = []
    clauses: list[tuple[int, ...]] = []
    seen: set[tuple[int, ...]] = set()
    for index, record in enumerate(raw_records):
        if not isinstance(record, dict) or set(record) != BANK_RECORD_KEYS:
            raise SharedFiveOmissionBankError("shared bank record shape changed")
        stage = record.get("detector_stage")
        certificate = record.get("certificate")
        if (
            record.get("index") != index
            or stage not in SUPPORTED_STAGES
            or record.get("certificate_schema") != STRUCTURAL_CERTIFICATE_SCHEMA
            or not isinstance(certificate, Mapping)
            or certificate.get("stage") != stage
            or record.get("certificate_sha256") != _sha256_json(certificate)
            or not validate_structural_certificate(certificate, n=12)
        ):
            raise SharedFiveOmissionBankError(
                f"shared bank record {index} certificate failed replay"
            )
        clause = learned_clause_for_certificate(target_instance, certificate)
        if (
            record.get("learned_clause") != list(clause)
            or record.get("learned_clause_sha256") != _sha256_json(list(clause))
            or clause in seen
        ):
            raise SharedFiveOmissionBankError(
                f"shared bank record {index} learned clause failed replay"
            )
        occurrences = record.get("occurrences")
        if not isinstance(occurrences, list) or not occurrences:
            raise SharedFiveOmissionBankError("record occurrence list is malformed")
        normalized_occurrences: list[tuple[int, int, str]] = []
        source_by_label = {source["deleted_label"]: source for source in sources}
        for occurrence in occurrences:
            if not isinstance(occurrence, dict) or set(occurrence) != OCCURRENCE_KEYS:
                raise SharedFiveOmissionBankError("record occurrence shape changed")
            occurrence_label = _strict_nonnegative_int(
                occurrence.get("deleted_label"), field="occurrence source label"
            )
            if occurrence_label not in source_labels:
                raise SharedFiveOmissionBankError(
                    "record occurrence refers to an absent source run"
                )
            occurrence_index = _strict_nonnegative_int(
                occurrence.get("record_index"), field="occurrence source index"
            )
            if occurrence_index >= source_by_label[occurrence_label]["record_count"]:
                raise SharedFiveOmissionBankError(
                    "record occurrence index exceeds its source journal"
                )
            occurrence_sha256 = _strict_sha256(
                occurrence.get("record_sha256"), field="occurrence source hash"
            )
            normalized_occurrences.append(
                (occurrence_label, occurrence_index, occurrence_sha256)
            )
        if normalized_occurrences != sorted(set(normalized_occurrences)):
            raise SharedFiveOmissionBankError(
                "record occurrences are duplicated or noncanonical"
            )
        seen.add(clause)
        clauses.append(clause)
        records.append(record)

    if document.get("bootstrap_clause_list_sha256") != _sha256_json(
        [list(clause) for clause in clauses]
    ):
        raise SharedFiveOmissionBankError("bootstrap clause-list digest failed")

    return AuthenticatedSharedFiveOmissionBank(
        path=path.resolve(),
        artifact_sha256=hashlib.sha256(payload).hexdigest(),
        artifact_bytes=len(payload),
        document_sha256=document_sha256,
        source_runs=tuple(sources),
        records=tuple(records),
        clauses=tuple(clauses),
    )
