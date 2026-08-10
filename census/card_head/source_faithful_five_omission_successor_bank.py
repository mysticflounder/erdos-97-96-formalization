"""Layered successor bank for exact-12 five-omission structural cuts.

The frozen v2 shared bank remains an independently authenticated bootstrap
layer.  This module packages replayable certificates from twelve authenticated
v3 local journals as a second layer and exposes their union only as a derived
clause projection.

The source-journal hashes recorded here are provenance.  Soundness of an
installed cut comes from replaying its embedded metric certificate against the
target exact-12 shard.  This package is not terminal UNSAT, all-shard coverage,
a universal lift, or closure of a live Lean theorem.
"""

from __future__ import annotations

import argparse
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
from .source_faithful_five_omission_cegar import (
    RECORD_SCHEMA,
    RUN_SCHEMA,
    _new_instance,
)
from .source_faithful_five_omission_lean_export import (
    AuthenticatedFiveOmissionRun,
    load_authenticated_run,
)
from .source_faithful_five_omission_shared_bank import (
    SHARED_BANK_SCHEMA,
    AuthenticatedSharedFiveOmissionBank,
    load_shared_bank,
)

SUCCESSOR_SCHEMA = "p97_exact12_five_omission_structural_successor.v1"
SUCCESSOR_SCOPE = (
    "Frozen v2 bootstrap plus replayable structural cuts from twelve "
    "authenticated v3 local journals; not terminal UNSAT, universal lift, "
    "or live Lean closure"
)
SUPPORTED_LOCAL_STAGES = frozenset(
    {
        "equality-duplicate-center",
        "equality-equilateral-bisector-collision",
        "equality-equal-k4",
    }
)
MAX_SUCCESSOR_BYTES = 128 * 1024 * 1024
MAX_LOCAL_RECORDS = 100_000

BOOTSTRAP_KEYS = frozenset(
    {
        "schema",
        "artifact_sha256",
        "artifact_bytes",
        "document_sha256",
        "record_count",
        "clause_list_sha256",
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
        "bootstrap_document_sha256",
    }
)
SOURCE_RUN_KEYS = frozenset(
    {
        "deleted_label",
        "record_count",
        "status",
        "raw_base_formula_sha256",
        "base_formula_sha256",
        "current_formula_sha256",
        "summary_sha256",
        "summary_bytes",
        "journal_sha256",
        "journal_bytes",
        "terminal_record_sha256",
    }
)
OCCURRENCE_KEYS = frozenset({"deleted_label", "record_index", "record_sha256"})
LOCAL_RECORD_KEYS = frozenset(
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
DOCUMENT_BODY_KEYS = frozenset(
    {
        "schema",
        "scope",
        "bootstrap",
        "source_contract",
        "local_source_run_count",
        "local_source_runs",
        "common_local_clause_sequence_sha256",
        "common_local_stage_sequence_sha256",
        "common_local_certificate_sequence_sha256",
        "full_record_sequence_identical",
        "local_record_count",
        "local_clause_list_sha256",
        "local_records",
        "derived_clause_count",
        "derived_clause_list_sha256",
    }
)
DOCUMENT_KEYS = DOCUMENT_BODY_KEYS | {"document_sha256"}


class FiveOmissionSuccessorBankError(ValueError):
    """The layered successor failed strict authentication or replay."""


@dataclass(frozen=True)
class AuthenticatedFiveOmissionSuccessorBank:
    """One stable bootstrap/local package replayed against a target shard."""

    path: Path
    artifact_sha256: str
    artifact_bytes: int
    document_sha256: str
    bootstrap: AuthenticatedSharedFiveOmissionBank
    source_contract: dict[str, Any]
    source_runs: tuple[dict[str, Any], ...]
    local_records: tuple[dict[str, Any], ...]
    local_clauses: tuple[tuple[int, ...], ...]
    derived_clauses: tuple[tuple[int, ...], ...]
    local_clause_list_sha256: str
    derived_clause_list_sha256: str


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


def _strict_sha256(value: Any, *, field: str) -> str:
    if not _is_sha256(value):
        raise FiveOmissionSuccessorBankError(f"{field} is not a SHA-256 digest")
    return value


def _strict_nonnegative_int(value: Any, *, field: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or value < 0:
        raise FiveOmissionSuccessorBankError(f"{field} is not nonnegative")
    return value


def _strict_positive_int(value: Any, *, field: str) -> int:
    result = _strict_nonnegative_int(value, field=field)
    if result == 0:
        raise FiveOmissionSuccessorBankError(f"{field} is not positive")
    return result


def _read_regular_bytes_no_follow(path: Path) -> bytes:
    nofollow = getattr(os, "O_NOFOLLOW", None)
    if nofollow is None:
        raise FiveOmissionSuccessorBankError("platform lacks no-follow file reads")
    flags = os.O_RDONLY | nofollow | getattr(os, "O_CLOEXEC", 0)
    try:
        descriptor = os.open(path, flags)
    except OSError as exc:
        raise FiveOmissionSuccessorBankError(
            "successor bank cannot be opened safely"
        ) from exc
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode):
            raise FiveOmissionSuccessorBankError(
                "successor bank is not a regular file"
            )
        if info.st_size > MAX_SUCCESSOR_BYTES:
            raise FiveOmissionSuccessorBankError(
                "successor bank exceeds its size bound"
            )
        chunks: list[bytes] = []
        total = 0
        while total <= MAX_SUCCESSOR_BYTES:
            chunk = os.read(
                descriptor, min(1024 * 1024, MAX_SUCCESSOR_BYTES + 1 - total)
            )
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
        payload = b"".join(chunks)
        if len(payload) > MAX_SUCCESSOR_BYTES:
            raise FiveOmissionSuccessorBankError(
                "successor bank exceeds its size bound"
            )
        return payload
    finally:
        os.close(descriptor)


def write_new_successor_bank(path: Path, document: Mapping[str, Any]) -> None:
    """Durably create one canonical successor without replacing a file."""

    path.parent.mkdir(parents=True, exist_ok=True)
    payload = _canonical_json_bytes(document) + b"\n"
    if len(payload) > MAX_SUCCESSOR_BYTES:
        raise FiveOmissionSuccessorBankError("successor bank exceeds its size bound")
    nofollow = getattr(os, "O_NOFOLLOW", None)
    if nofollow is None:
        raise FiveOmissionSuccessorBankError("platform lacks no-follow file writes")
    flags = (
        os.O_WRONLY
        | os.O_CREAT
        | os.O_EXCL
        | nofollow
        | getattr(os, "O_CLOEXEC", 0)
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
        raise FiveOmissionSuccessorBankError(
            "successor bank failed exact write read-back"
        )


def _bootstrap_payload(
    banks: Sequence[AuthenticatedSharedFiveOmissionBank],
) -> dict[str, Any]:
    if len(banks) != 12:
        raise FiveOmissionSuccessorBankError(
            "successor requires twelve authenticated bootstrap replays"
        )
    first = banks[0]
    identity = (
        first.artifact_sha256,
        first.artifact_bytes,
        first.document_sha256,
        first.bootstrap_clause_list_sha256,
        first.clauses,
    )
    if any(
        (
            bank.artifact_sha256,
            bank.artifact_bytes,
            bank.document_sha256,
            bank.bootstrap_clause_list_sha256,
            bank.clauses,
        )
        != identity
        for bank in banks[1:]
    ):
        raise FiveOmissionSuccessorBankError(
            "bootstrap bank replay differs across target shards"
        )
    return {
        "schema": SHARED_BANK_SCHEMA,
        "artifact_sha256": first.artifact_sha256,
        "artifact_bytes": first.artifact_bytes,
        "document_sha256": first.document_sha256,
        "record_count": len(first.records),
        "clause_list_sha256": first.bootstrap_clause_list_sha256,
    }


def _source_contract(
    runs: Sequence[AuthenticatedFiveOmissionRun],
    bootstrap_document_sha256: str,
) -> dict[str, Any]:
    first = runs[0].summary
    contract = {
        "run_schema": RUN_SCHEMA,
        "record_schema": RECORD_SCHEMA,
        "certificate_schema": STRUCTURAL_CERTIFICATE_SCHEMA,
        "formula_contract_sha256": _strict_sha256(
            first.get("formula_contract_sha256"), field="formula contract hash"
        ),
        "detector_contract_sha256": _strict_sha256(
            first.get("detector_contract_sha256"), field="detector contract hash"
        ),
        "tool_contract_sha256": _strict_sha256(
            first.get("tool_contract_sha256"), field="tool contract hash"
        ),
        "bootstrap_document_sha256": bootstrap_document_sha256,
    }
    for run in runs:
        summary = run.summary
        shared = summary.get("shared_bank")
        if (
            summary.get("schema") != RUN_SCHEMA
            or summary.get("formula_contract_sha256")
            != contract["formula_contract_sha256"]
            or summary.get("detector_contract_sha256")
            != contract["detector_contract_sha256"]
            or summary.get("tool_contract_sha256")
            != contract["tool_contract_sha256"]
            or not isinstance(shared, Mapping)
            or shared.get("enabled") is not True
            or shared.get("schema") != SHARED_BANK_SCHEMA
            or shared.get("document_sha256") != bootstrap_document_sha256
        ):
            raise FiveOmissionSuccessorBankError(
                "local run contract or bootstrap binding disagrees"
            )
    return contract


def _source_run_payload(run: AuthenticatedFiveOmissionRun) -> dict[str, Any]:
    label = _strict_nonnegative_int(run.deleted_label, field="deleted label")
    if label >= 12:
        raise FiveOmissionSuccessorBankError("deleted label is outside Fin 12")
    summary = run.summary
    status = summary.get("status")
    if status not in {"ITERATION_LIMIT", "UNSAT"}:
        raise FiveOmissionSuccessorBankError("local run status is not bankable")
    terminal = run.terminal_record_sha256
    if terminal is not None and not _is_sha256(terminal):
        raise FiveOmissionSuccessorBankError("local terminal chain hash is malformed")
    return {
        "deleted_label": label,
        "record_count": len(run.records),
        "status": status,
        "raw_base_formula_sha256": _strict_sha256(
            summary.get("raw_base_formula_sha256"), field="raw base formula hash"
        ),
        "base_formula_sha256": _strict_sha256(
            summary.get("base_formula_sha256"), field="base formula hash"
        ),
        "current_formula_sha256": _strict_sha256(
            summary.get("current_formula_sha256"), field="current formula hash"
        ),
        "summary_sha256": _strict_sha256(
            run.summary_artifact.get("sha256"), field="summary artifact hash"
        ),
        "summary_bytes": _strict_positive_int(
            run.summary_artifact.get("bytes"), field="summary artifact bytes"
        ),
        "journal_sha256": _strict_sha256(
            run.journal_artifact.get("sha256"), field="journal artifact hash"
        ),
        "journal_bytes": _strict_positive_int(
            run.journal_artifact.get("bytes"), field="journal artifact bytes"
        ),
        "terminal_record_sha256": terminal,
    }


def build_successor_document(
    bootstrap_banks: Sequence[AuthenticatedSharedFiveOmissionBank],
    runs: Sequence[AuthenticatedFiveOmissionRun],
    target_instances: Sequence[CoverInstance],
) -> dict[str, Any]:
    """Build a compact local-cut layer from authenticated v3 journal snapshots."""

    if len(runs) != 12 or len(target_instances) != 12:
        raise FiveOmissionSuccessorBankError(
            "successor requires exactly twelve local runs and targets"
        )
    labels = [run.deleted_label for run in runs]
    if labels != list(range(12)):
        raise FiveOmissionSuccessorBankError(
            "local runs must be ordered by every Fin 12 deleted label"
        )
    bootstrap = _bootstrap_payload(bootstrap_banks)
    contract = _source_contract(runs, bootstrap["document_sha256"])
    source_runs = [_source_run_payload(run) for run in runs]
    bootstrap_clauses = set(bootstrap_banks[0].clauses)

    clause_sequences = tuple(
        tuple(tuple(record["learned_clause"]) for record in run.records)
        for run in runs
    )
    stage_sequences = tuple(
        tuple(record["detector_stage"] for record in run.records) for run in runs
    )
    certificate_sequences = tuple(
        tuple(record["certificate"] for record in run.records) for run in runs
    )
    if (
        any(sequence != clause_sequences[0] for sequence in clause_sequences[1:])
        or any(sequence != stage_sequences[0] for sequence in stage_sequences[1:])
        or any(
            sequence != certificate_sequences[0]
            for sequence in certificate_sequences[1:]
        )
    ):
        raise FiveOmissionSuccessorBankError(
            "local clause, stage, or certificate sequences disagree across shards"
        )
    full_record_sequence_identical = len(
        {source["journal_sha256"] for source in source_runs}
    ) == 1

    occurrences: dict[tuple[int, ...], list[dict[str, Any]]] = {}
    certificates: dict[tuple[int, ...], dict[str, Any]] = {}
    for run in runs:
        for expected_index, raw_record in enumerate(run.records):
            index = _strict_nonnegative_int(
                raw_record.get("index"), field="local record index"
            )
            stage = raw_record.get("detector_stage")
            certificate = raw_record.get("certificate")
            certificate_sha256 = _strict_sha256(
                raw_record.get("certificate_sha256"),
                field="local certificate hash",
            )
            record_sha256 = _strict_sha256(
                raw_record.get("record_sha256"), field="local record hash"
            )
            record_body = dict(raw_record)
            record_body.pop("record_sha256", None)
            if (
                index != expected_index
                or raw_record.get("schema") != RECORD_SCHEMA
                or raw_record.get("deleted_label") != run.deleted_label
                or raw_record.get("certificate_schema")
                != STRUCTURAL_CERTIFICATE_SCHEMA
                or stage not in SUPPORTED_LOCAL_STAGES
                or not isinstance(certificate, Mapping)
                or certificate.get("stage") != stage
                or certificate_sha256 != _sha256_json(certificate)
                or record_sha256 != _sha256_json(record_body)
                or not validate_structural_certificate(certificate, n=12)
            ):
                raise FiveOmissionSuccessorBankError(
                    "local record certificate or custody failed"
                )
            clauses = tuple(
                learned_clause_for_certificate(instance, certificate)
                for instance in target_instances
            )
            if len(set(clauses)) != 1:
                raise FiveOmissionSuccessorBankError(
                    "local certificate is not portable across all shards"
                )
            clause = clauses[0]
            if raw_record.get("learned_clause") != list(clause):
                raise FiveOmissionSuccessorBankError(
                    "local learned clause failed certificate replay"
                )
            if clause in bootstrap_clauses:
                raise FiveOmissionSuccessorBankError(
                    "local learned clause overlaps the frozen bootstrap"
                )
            occurrence = {
                "deleted_label": run.deleted_label,
                "record_index": index,
                "record_sha256": record_sha256,
            }
            occurrences.setdefault(clause, []).append(occurrence)
            current = certificates.get(clause)
            if current is None or certificate_sha256 < current["certificate_sha256"]:
                certificates[clause] = {
                    "detector_stage": stage,
                    "certificate": dict(certificate),
                    "certificate_sha256": certificate_sha256,
                }

    local_records: list[dict[str, Any]] = []
    for index, clause in enumerate(sorted(occurrences)):
        occurrence_list = sorted(
            occurrences[clause],
            key=lambda item: (
                item["deleted_label"],
                item["record_index"],
                item["record_sha256"],
            ),
        )
        if [item["deleted_label"] for item in occurrence_list] != list(range(12)):
            raise FiveOmissionSuccessorBankError(
                "every local clause must occur once in every deleted-label journal"
            )
        selected = certificates[clause]
        local_records.append(
            {
                "index": index,
                "detector_stage": selected["detector_stage"],
                "certificate_schema": STRUCTURAL_CERTIFICATE_SCHEMA,
                "certificate": selected["certificate"],
                "certificate_sha256": selected["certificate_sha256"],
                "learned_clause": list(clause),
                "learned_clause_sha256": _sha256_json(list(clause)),
                "occurrences": occurrence_list,
            }
        )
    if not local_records or len(local_records) > MAX_LOCAL_RECORDS:
        raise FiveOmissionSuccessorBankError("local cut layer has an invalid size")

    local_clause_lists = [record["learned_clause"] for record in local_records]
    derived_clause_lists = [list(clause) for clause in bootstrap_banks[0].clauses]
    derived_clause_lists.extend(local_clause_lists)
    body = {
        "schema": SUCCESSOR_SCHEMA,
        "scope": SUCCESSOR_SCOPE,
        "bootstrap": bootstrap,
        "source_contract": contract,
        "local_source_run_count": len(source_runs),
        "local_source_runs": source_runs,
        "common_local_clause_sequence_sha256": _sha256_json(
            [list(clause) for clause in clause_sequences[0]]
        ),
        "common_local_stage_sequence_sha256": _sha256_json(stage_sequences[0]),
        "common_local_certificate_sequence_sha256": _sha256_json(
            certificate_sequences[0]
        ),
        "full_record_sequence_identical": full_record_sequence_identical,
        "local_record_count": len(local_records),
        "local_clause_list_sha256": _sha256_json(local_clause_lists),
        "local_records": local_records,
        "derived_clause_count": len(derived_clause_lists),
        "derived_clause_list_sha256": _sha256_json(derived_clause_lists),
    }
    return {**body, "document_sha256": _sha256_json(body)}


def build_successor_from_paths(
    repo_root: Path, bootstrap_path: Path, wave_root: Path
) -> dict[str, Any]:
    """Authenticate all source artifacts before constructing the compact package."""

    repo_root = repo_root.resolve()
    bootstrap_path = bootstrap_path.resolve()
    wave_root = wave_root.resolve()
    targets = tuple(_new_instance(label) for label in range(12))
    bootstrap_banks = tuple(
        load_shared_bank(bootstrap_path, target) for target in targets
    )
    runs = tuple(
        load_authenticated_run(repo_root, wave_root / f"deleted-{label}", label)
        for label in range(12)
    )
    return build_successor_document(bootstrap_banks, runs, targets)


def _validate_bootstrap_descriptor(
    descriptor: Any, bank: AuthenticatedSharedFiveOmissionBank
) -> None:
    if not isinstance(descriptor, dict) or set(descriptor) != BOOTSTRAP_KEYS:
        raise FiveOmissionSuccessorBankError("bootstrap descriptor changed shape")
    expected = {
        "schema": SHARED_BANK_SCHEMA,
        "artifact_sha256": bank.artifact_sha256,
        "artifact_bytes": bank.artifact_bytes,
        "document_sha256": bank.document_sha256,
        "record_count": len(bank.records),
        "clause_list_sha256": bank.bootstrap_clause_list_sha256,
    }
    if descriptor != expected:
        raise FiveOmissionSuccessorBankError(
            "bootstrap descriptor disagrees with the authenticated v2 bank"
        )


def load_successor_bank(
    path: Path,
    bootstrap_path: Path,
    target_instance: CoverInstance,
) -> AuthenticatedFiveOmissionSuccessorBank:
    """Authenticate both layers and replay every local cut on one target shard."""

    payload = _read_regular_bytes_no_follow(path)
    if not payload.endswith(b"\n"):
        raise FiveOmissionSuccessorBankError("successor bank is truncated")
    try:
        document = json.loads(
            payload,
            object_pairs_hook=_object_without_duplicates,
            parse_constant=_reject_json_constant,
        )
    except (UnicodeDecodeError, ValueError) as exc:
        raise FiveOmissionSuccessorBankError(
            "successor bank is not strict JSON"
        ) from exc
    if not isinstance(document, dict) or set(document) != DOCUMENT_KEYS:
        raise FiveOmissionSuccessorBankError("successor document shape changed")
    if payload != _canonical_json_bytes(document) + b"\n":
        raise FiveOmissionSuccessorBankError(
            "successor bank is not canonically serialized"
        )
    body = dict(document)
    document_sha256 = body.pop("document_sha256")
    if (
        set(body) != DOCUMENT_BODY_KEYS
        or document.get("schema") != SUCCESSOR_SCHEMA
        or document.get("scope") != SUCCESSOR_SCOPE
        or not _is_sha256(document_sha256)
        or document_sha256 != _sha256_json(body)
    ):
        raise FiveOmissionSuccessorBankError(
            "successor contract or document digest failed"
        )

    bootstrap = load_shared_bank(bootstrap_path, target_instance)
    _validate_bootstrap_descriptor(document.get("bootstrap"), bootstrap)
    contract = document.get("source_contract")
    if (
        not isinstance(contract, dict)
        or set(contract) != SOURCE_CONTRACT_KEYS
        or contract.get("run_schema") != RUN_SCHEMA
        or contract.get("record_schema") != RECORD_SCHEMA
        or contract.get("certificate_schema") != STRUCTURAL_CERTIFICATE_SCHEMA
        or contract.get("bootstrap_document_sha256") != bootstrap.document_sha256
    ):
        raise FiveOmissionSuccessorBankError("successor source contract is malformed")
    for field in (
        "formula_contract_sha256",
        "detector_contract_sha256",
        "tool_contract_sha256",
    ):
        _strict_sha256(contract.get(field), field=field)

    raw_sources = document.get("local_source_runs")
    source_count = document.get("local_source_run_count")
    if (
        not isinstance(raw_sources, list)
        or source_count != 12
        or len(raw_sources) != 12
    ):
        raise FiveOmissionSuccessorBankError("local source table is malformed")
    sources: list[dict[str, Any]] = []
    source_by_label: dict[int, dict[str, Any]] = {}
    for expected_label, source in enumerate(raw_sources):
        if not isinstance(source, dict) or set(source) != SOURCE_RUN_KEYS:
            raise FiveOmissionSuccessorBankError("local source entry changed shape")
        label = _strict_nonnegative_int(
            source.get("deleted_label"), field="source deleted label"
        )
        if label != expected_label:
            raise FiveOmissionSuccessorBankError(
                "local source labels are not canonical Fin 12"
            )
        _strict_nonnegative_int(source.get("record_count"), field="source records")
        if source.get("status") not in {"ITERATION_LIMIT", "UNSAT"}:
            raise FiveOmissionSuccessorBankError("source status is unsupported")
        for field in (
            "raw_base_formula_sha256",
            "base_formula_sha256",
            "current_formula_sha256",
            "summary_sha256",
            "journal_sha256",
        ):
            _strict_sha256(source.get(field), field=field)
        _strict_positive_int(source.get("summary_bytes"), field="summary bytes")
        _strict_positive_int(source.get("journal_bytes"), field="journal bytes")
        terminal = source.get("terminal_record_sha256")
        if terminal is not None and not _is_sha256(terminal):
            raise FiveOmissionSuccessorBankError(
                "source terminal chain hash is malformed"
            )
        sources.append(source)
        source_by_label[label] = source

    raw_records = document.get("local_records")
    record_count = document.get("local_record_count")
    if (
        not isinstance(raw_records, list)
        or isinstance(record_count, bool)
        or not isinstance(record_count, int)
        or record_count != len(raw_records)
        or not 0 < record_count <= MAX_LOCAL_RECORDS
    ):
        raise FiveOmissionSuccessorBankError("local record table is malformed")
    local_records: list[dict[str, Any]] = []
    local_clauses: list[tuple[int, ...]] = []
    seen: set[tuple[int, ...]] = set(bootstrap.clauses)
    for expected_index, record in enumerate(raw_records):
        if not isinstance(record, dict) or set(record) != LOCAL_RECORD_KEYS:
            raise FiveOmissionSuccessorBankError("local record changed shape")
        stage = record.get("detector_stage")
        certificate = record.get("certificate")
        if (
            record.get("index") != expected_index
            or stage not in SUPPORTED_LOCAL_STAGES
            or record.get("certificate_schema") != STRUCTURAL_CERTIFICATE_SCHEMA
            or not isinstance(certificate, Mapping)
            or certificate.get("stage") != stage
            or record.get("certificate_sha256") != _sha256_json(certificate)
            or not validate_structural_certificate(certificate, n=12)
        ):
            raise FiveOmissionSuccessorBankError(
                "local certificate failed replay or canonical indexing"
            )
        clause = learned_clause_for_certificate(target_instance, certificate)
        if (
            record.get("learned_clause") != list(clause)
            or record.get("learned_clause_sha256") != _sha256_json(list(clause))
            or clause in seen
        ):
            raise FiveOmissionSuccessorBankError(
                "local learned clause failed replay, uniqueness, or layer separation"
            )
        raw_occurrences = record.get("occurrences")
        if not isinstance(raw_occurrences, list) or len(raw_occurrences) != 12:
            raise FiveOmissionSuccessorBankError(
                "local record lacks twelve source occurrences"
            )
        normalized: list[tuple[int, int, str]] = []
        for occurrence in raw_occurrences:
            if not isinstance(occurrence, dict) or set(occurrence) != OCCURRENCE_KEYS:
                raise FiveOmissionSuccessorBankError(
                    "local occurrence changed shape"
                )
            label = _strict_nonnegative_int(
                occurrence.get("deleted_label"), field="occurrence deleted label"
            )
            index = _strict_nonnegative_int(
                occurrence.get("record_index"), field="occurrence record index"
            )
            record_sha256 = _strict_sha256(
                occurrence.get("record_sha256"), field="occurrence record hash"
            )
            if label not in source_by_label or index >= source_by_label[label]["record_count"]:
                raise FiveOmissionSuccessorBankError(
                    "local occurrence exceeds its source journal"
                )
            normalized.append((label, index, record_sha256))
        if normalized != sorted(set(normalized)) or [x[0] for x in normalized] != list(
            range(12)
        ):
            raise FiveOmissionSuccessorBankError(
                "local occurrences are duplicated or noncanonical"
            )
        seen.add(clause)
        local_clauses.append(clause)
        local_records.append(record)

    local_clause_lists = [list(clause) for clause in local_clauses]
    if document.get("local_clause_list_sha256") != _sha256_json(local_clause_lists):
        raise FiveOmissionSuccessorBankError("local clause-list digest failed")
    source_order = sorted(
        zip(local_records, local_clauses, strict=True),
        key=lambda pair: next(
            occurrence["record_index"]
            for occurrence in pair[0]["occurrences"]
            if occurrence["deleted_label"] == 0
        ),
    )
    common_clause_sequence = [list(pair[1]) for pair in source_order]
    common_stage_sequence = [pair[0]["detector_stage"] for pair in source_order]
    common_certificate_sequence = [pair[0]["certificate"] for pair in source_order]
    if (
        document.get("common_local_clause_sequence_sha256")
        != _sha256_json(common_clause_sequence)
        or document.get("common_local_stage_sequence_sha256")
        != _sha256_json(common_stage_sequence)
        or document.get("common_local_certificate_sequence_sha256")
        != _sha256_json(common_certificate_sequence)
    ):
        raise FiveOmissionSuccessorBankError(
            "common local source-sequence digest failed"
        )
    full_record_sequence_identical = len(
        {source["journal_sha256"] for source in sources}
    ) == 1
    if (
        document.get("full_record_sequence_identical")
        != full_record_sequence_identical
    ):
        raise FiveOmissionSuccessorBankError(
            "full-record sequence identity flag disagrees with journal digests"
        )
    derived_clauses = bootstrap.clauses + tuple(local_clauses)
    if (
        document.get("derived_clause_count") != len(derived_clauses)
        or document.get("derived_clause_list_sha256")
        != _sha256_json([list(clause) for clause in derived_clauses])
    ):
        raise FiveOmissionSuccessorBankError("derived clause projection failed")

    return AuthenticatedFiveOmissionSuccessorBank(
        path=path.resolve(),
        artifact_sha256=hashlib.sha256(payload).hexdigest(),
        artifact_bytes=len(payload),
        document_sha256=document_sha256,
        bootstrap=bootstrap,
        source_contract=dict(contract),
        source_runs=tuple(sources),
        local_records=tuple(local_records),
        local_clauses=tuple(local_clauses),
        derived_clauses=derived_clauses,
        local_clause_list_sha256=document["local_clause_list_sha256"],
        derived_clause_list_sha256=document["derived_clause_list_sha256"],
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--bootstrap-bank", type=Path, required=True)
    parser.add_argument("--wave-root", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()

    document = build_successor_from_paths(
        args.repo_root, args.bootstrap_bank, args.wave_root
    )
    write_new_successor_bank(args.out, document)
    authenticated = load_successor_bank(
        args.out, args.bootstrap_bank, _new_instance(0)
    )
    print(
        json.dumps(
            {
                "artifact_sha256": authenticated.artifact_sha256,
                "artifact_bytes": authenticated.artifact_bytes,
                "document_sha256": authenticated.document_sha256,
                "bootstrap_records": len(authenticated.bootstrap.records),
                "local_records": len(authenticated.local_records),
                "derived_clauses": len(authenticated.derived_clauses),
                "local_clause_list_sha256": authenticated.local_clause_list_sha256,
                "derived_clause_list_sha256": authenticated.derived_clause_list_sha256,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
