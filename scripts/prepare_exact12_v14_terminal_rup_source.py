#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Prepare a hash-bound pure-RUP source from an exact-12 terminal run.

The input must be a completed exact-12 v14 cell or structural-CEGAR workdir
whose authenticated summary reports ``UNSAT_DRAT_VERIFIED``.  The adapter
rechecks every referenced artifact, reruns ``drat-trim`` to emit LRAT, rejects
RAT hints, renumbers additions densely, and publishes the generic
``p97-pure-rup-source-v1`` manifest consumed by
``materialize_checkpointed_rup.py``.

This is certificate preparation, not all-cell coverage or Lean closure.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import subprocess
import sys
import tempfile
from collections.abc import Callable, Mapping, Sequence
from pathlib import Path
from typing import Any

import materialize_checkpointed_rup as rup

CELL_RUN_SCHEMA = "p97_rigid221_exact12_full_v14_cell_run.v1"
STRUCTURAL_RUN_SCHEMA = "p97_rigid221_exact12_full_v14_structural_cegar_run.v3"
RUN_SCHEMAS = frozenset({CELL_RUN_SCHEMA, STRUCTURAL_RUN_SCHEMA})
RECEIPT_SCHEMA = "p97_rigid221_exact12_terminal_rup_source.v1"
BOUND_JOB_SCHEMA = "p97_rigid221_exact12_full_v14_bound_job.v1"
STRUCTURAL_RECORD_SCHEMA = "p97_rigid221_exact12_full_v14_tagged_cut.v3"
STRUCTURAL_CERTIFICATE_KIND = "structural_metric_core"
STRUCTURAL_CERTIFICATE_SCHEMA = "p97_phase3_structural_certificate_payload.v1"
SOURCE_ORDER_CERTIFICATE_KIND = "source_order_positive_coverage"
SOURCE_ORDER_CERTIFICATE_SCHEMA = (
    "p97_rigid221_exact12_source_order_positive_coverage.v3"
)
SOURCE_ORDER_DETECTOR_STAGE = "source-order-positive-coverage"
STRUCTURAL_DETECTOR_CONTRACT = (
    "tagged structural replay or exact Lean-backed source-order bank replay"
)
LEAN_TERMINAL_STAGES = frozenset({"equality-duplicate-center"})
TERMINAL_BANK_MANIFEST_SCHEMA = (
    "p97_rigid221_exact12_source_order_terminal_bank_manifest.v1"
)
LEAN_TERMINAL_BANK_TYPE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "SourceOrderTerminalBankConsumer.SourceOrderPositiveNogood"
)
LEAN_TERMINAL_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "false_of_checkedCompactSourceOrderTerminal"
)
LEAN_DUPLICATE_CENTER_ADAPTER = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "SourceOrderTerminalBankConsumer.SourceOrderPositiveNogood.ofDuplicateCenter"
)
STRUCTURAL_DETECTOR_FILES = (
    "census/card_head/exact12_v14_structural_cegar.py",
    "census/card_head/exact12_v14_ordered_cut_adapter.py",
    "census/card_head/exact12_v14_ordered_coverage.py",
    "census/card_head/exact12_v14_source_order_bank.py",
    "census/card_head/sat_encoding.py",
    "census/global_confinement/metric_realizability_probe.py",
    "census/global_confinement/cap_selected_nogood_certificate_probe.py",
    "census/p97_search/phase3_classification_context.py",
    "census/p97_search/phase3_order_universe.py",
)
SCHEDULE_CELL_COUNT = 648
STRUCTURAL_RECORD_FIELDS = frozenset(
    {
        "schema",
        "index",
        "parent_sha256",
        "job_sha256",
        "detector_contract_sha256",
        "cell_index",
        "detector_contract",
        "certificate_kind",
        "certificate_schema",
        "detector_stage",
        "certificate",
        "certificate_sha256",
        "learned_clause",
        "cube",
        "cube_sha256",
        "positive_variables",
        "assignment_sha256",
        "record_sha256",
    }
)


class TerminalRupSourceError(ValueError):
    """A terminal run or derived LRAT artifact failed a publication gate."""


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    answer: dict[str, Any] = {}
    for key, value in pairs:
        if key in answer:
            raise TerminalRupSourceError(f"duplicate JSON key: {key!r}")
        answer[key] = value
    return answer


def _reject_json_constant(value: str) -> Any:
    raise TerminalRupSourceError(f"non-finite JSON constant: {value}")


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _json_bytes(value: Any) -> bytes:
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode("utf-8")


def _canonical_json_sha256(value: Any) -> str:
    encoded = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def _is_sha256(value: Any) -> bool:
    return (
        isinstance(value, str)
        and len(value) == 64
        and all(character in "0123456789abcdef" for character in value)
    )


def _load_json_object(path: Path, description: str) -> dict[str, Any]:
    try:
        value = json.loads(
            path.read_text(encoding="utf-8"),
            object_pairs_hook=_reject_duplicate_keys,
            parse_constant=_reject_json_constant,
        )
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise TerminalRupSourceError(
            f"cannot read strict {description}: {path}"
        ) from exc
    if not isinstance(value, dict):
        raise TerminalRupSourceError(f"{description} is not a JSON object")
    return value


def _load_summary(path: Path) -> dict[str, Any]:
    return _load_json_object(path, "terminal summary")


def _expected_detector_manifest(
    repo_root: Path,
) -> tuple[list[dict[str, Any]], dict[str, Path]]:
    repo_root = repo_root.resolve()
    manifest: list[dict[str, Any]] = []
    paths: dict[str, Path] = {}
    for relative in STRUCTURAL_DETECTOR_FILES:
        path = repo_root / relative
        if path.is_symlink() or not path.is_file():
            raise TerminalRupSourceError(f"missing regular detector source: {relative}")
        manifest.append(
            {
                "path": relative,
                "bytes": path.stat().st_size,
                "sha256": _sha256(path),
            }
        )
        paths[relative] = path
    return manifest, paths


def _canonical_cube_payload(value: Any) -> dict[str, list[int]]:
    if not isinstance(value, dict) or set(value) != {
        str(center) for center in range(12)
    }:
        raise TerminalRupSourceError(
            "journal cube must contain every center exactly once"
        )
    payload: dict[str, list[int]] = {}
    for center in range(12):
        support = value[str(center)]
        if not isinstance(support, list):
            raise TerminalRupSourceError("journal cube support is malformed")
        if (
            any(isinstance(point, bool) or not isinstance(point, int) for point in support)
            or support != sorted(support)
            or len(support) != len(set(support))
            or any(not 0 <= point < 12 or point == center for point in support)
        ):
            raise TerminalRupSourceError("journal cube support is not canonical")
        payload[str(center)] = support
    return payload


def _canonical_positive_variables(value: Any) -> list[int]:
    if (
        not isinstance(value, list)
        or any(
            isinstance(variable, bool)
            or not isinstance(variable, int)
            or variable <= 0
            for variable in value
        )
        or value != sorted(value)
        or len(value) != len(set(value))
    ):
        raise TerminalRupSourceError(
            "journal positive-variable assignment is not canonical"
        )
    return value


def _validated_run_artifact(
    workdir: Path,
    artifacts: Mapping[str, Any],
    key: str,
    expected_name: str,
    *,
    allow_empty: bool = False,
) -> Path:
    record = artifacts.get(key)
    if not isinstance(record, dict) or set(record) != {"path", "bytes", "sha256"}:
        raise TerminalRupSourceError(f"malformed terminal artifact record: {key}")
    if record.get("path") != expected_name:
        raise TerminalRupSourceError(f"unexpected terminal artifact path for {key}")
    byte_count = record.get("bytes")
    digest = record.get("sha256")
    if (
        isinstance(byte_count, bool)
        or not isinstance(byte_count, int)
        or byte_count < (0 if allow_empty else 1)
        or not _is_sha256(digest)
    ):
        raise TerminalRupSourceError(f"malformed terminal artifact metadata: {key}")
    path = workdir / expected_name
    if (
        path.is_symlink()
        or not path.is_file()
        or path.stat().st_size != byte_count
        or _sha256(path) != digest
    ):
        raise TerminalRupSourceError(f"terminal artifact drift: {key}")
    return path


def _validate_staged_artifact(
    path: Path,
    record: Mapping[str, Any],
    key: str,
) -> None:
    """Reject source mutation between validation and staged publication."""

    if (
        not path.is_file()
        or path.stat().st_size != record.get("bytes")
        or _sha256(path) != record.get("sha256")
    ):
        raise TerminalRupSourceError(f"staged terminal artifact drift: {key}")


def _authenticate_structural_journal(
    journal_path: Path | None,
    *,
    summary: Mapping[str, Any],
    expected_detector_manifest: Sequence[Mapping[str, Any]],
) -> tuple[list[tuple[int, ...]], dict[str, Any]]:
    """Authenticate a tagged journal and describe its typed Lean bank ingress."""

    records = summary.get("records")
    if isinstance(records, bool) or not isinstance(records, int) or records < 0:
        raise TerminalRupSourceError("structural terminal record count is malformed")
    job_sha256 = summary.get("job_sha256")
    detector_manifest = summary.get("detector_contract_manifest")
    detector_sha256 = summary.get("detector_contract_sha256")
    cell_index = summary.get("cell_index")
    if (
        not _is_sha256(job_sha256)
        or not isinstance(detector_manifest, list)
        or detector_manifest != list(expected_detector_manifest)
        or not _is_sha256(detector_sha256)
        or detector_sha256 != _canonical_json_sha256(detector_manifest)
        or isinstance(cell_index, bool)
        or not isinstance(cell_index, int)
    ):
        raise TerminalRupSourceError("structural detector contract is malformed")
    terminal_record = summary.get("terminal_record_sha256")
    if records == 0:
        if terminal_record is not None:
            raise TerminalRupSourceError(
                "empty structural journal has a terminal record digest"
            )
        if journal_path is not None and journal_path.stat().st_size != 0:
            raise TerminalRupSourceError("empty structural journal is not empty")
        return [], _terminal_bank_manifest([])
    if journal_path is None or not journal_path.is_file():
        raise TerminalRupSourceError("structural terminal journal is missing")

    parent = job_sha256
    count = 0
    learned_clauses: list[tuple[int, ...]] = []
    terminal_bank_entries: list[dict[str, Any]] = []
    with journal_path.open("rb") as handle:
        for line_number, raw_line in enumerate(handle, 1):
            if not raw_line.endswith(b"\n") or b"\r" in raw_line:
                raise TerminalRupSourceError(
                    f"journal line {line_number} is not LF-terminated JSON"
                )
            try:
                record = json.loads(
                    raw_line,
                    object_pairs_hook=_reject_duplicate_keys,
                    parse_constant=_reject_json_constant,
                )
            except (UnicodeError, json.JSONDecodeError) as exc:
                raise TerminalRupSourceError(
                    f"journal line {line_number} is not strict JSON"
                ) from exc
            if not isinstance(record, dict) or set(record) != STRUCTURAL_RECORD_FIELDS:
                raise TerminalRupSourceError(
                    f"journal line {line_number} is malformed"
                )
            body = dict(record)
            record_sha256 = body.pop("record_sha256")
            certificate = record.get("certificate")
            cube = _canonical_cube_payload(record.get("cube"))
            positive_variables = _canonical_positive_variables(
                record.get("positive_variables")
            )
            if (
                record.get("schema") != STRUCTURAL_RECORD_SCHEMA
                or isinstance(record.get("index"), bool)
                or record.get("index") != count
                or record.get("parent_sha256") != parent
                or record.get("job_sha256") != job_sha256
                or record.get("detector_contract_sha256") != detector_sha256
                or isinstance(record.get("cell_index"), bool)
                or record.get("cell_index") != cell_index
                or record.get("detector_contract") != STRUCTURAL_DETECTOR_CONTRACT
                or not isinstance(certificate, dict)
                or not isinstance(record.get("certificate_kind"), str)
                or not isinstance(record.get("certificate_schema"), str)
                or not isinstance(record.get("detector_stage"), str)
                or record.get("certificate_sha256")
                != _canonical_json_sha256(certificate)
                or record.get("cube_sha256") != _canonical_json_sha256(cube)
                or record.get("assignment_sha256")
                != _canonical_json_sha256(positive_variables)
                or not isinstance(record.get("learned_clause"), list)
                or not _is_sha256(record_sha256)
                or record_sha256 != _canonical_json_sha256(body)
            ):
                raise TerminalRupSourceError(
                    f"journal line {line_number} failed chain authentication"
                )
            certificate_kind = record["certificate_kind"]
            certificate_schema = record["certificate_schema"]
            detector_stage = record["detector_stage"]
            if (
                certificate_kind == STRUCTURAL_CERTIFICATE_KIND
                and certificate_schema == STRUCTURAL_CERTIFICATE_SCHEMA
                and detector_stage in LEAN_TERMINAL_STAGES
                and detector_stage == certificate.get("stage")
            ):
                lean_ingress = {
                    "kind": "checked_duplicate_center_adapter",
                    "adapter_declaration": LEAN_DUPLICATE_CENTER_ADAPTER,
                }
            elif (
                certificate_kind == SOURCE_ORDER_CERTIFICATE_KIND
                and certificate_schema == SOURCE_ORDER_CERTIFICATE_SCHEMA
                and detector_stage == SOURCE_ORDER_DETECTOR_STAGE
            ):
                generated_lean_nogood = certificate.get("generated_lean_nogood")
                if not isinstance(generated_lean_nogood, dict) or not isinstance(
                    generated_lean_nogood.get("nogood_declaration"), str
                ):
                    raise TerminalRupSourceError(
                        "source-order terminal certificate lacks its named Lean binding"
                    )
                lean_ingress = {
                    "kind": "named_source_order_positive_nogood",
                    "binding": generated_lean_nogood,
                    "binding_sha256": _canonical_json_sha256(generated_lean_nogood),
                }
            else:
                raise TerminalRupSourceError(
                    "tagged terminal journal contains a certificate family or stage "
                    "without a typed Lean terminal-bank ingress: "
                    f"{certificate_kind!r}/{certificate_schema!r}/{detector_stage!r}"
                )
            learned_clause = record["learned_clause"]
            if (
                any(
                    isinstance(literal, bool)
                    or not isinstance(literal, int)
                    or literal == 0
                    for literal in learned_clause
                )
                or len(learned_clause) != len(set(learned_clause))
            ):
                raise TerminalRupSourceError(
                    f"journal line {line_number} has a malformed learned clause"
                )
            for digest_field in (
                "certificate_sha256",
                "cube_sha256",
                "assignment_sha256",
            ):
                if not _is_sha256(record.get(digest_field)):
                    raise TerminalRupSourceError(
                        f"journal line {line_number} has malformed {digest_field}"
                    )
            parent = record_sha256
            learned_clauses.append(tuple(learned_clause))
            terminal_bank_entries.append(
                {
                    "index": count,
                    "journal_record_sha256": record_sha256,
                    "certificate_kind": certificate_kind,
                    "certificate_schema": certificate_schema,
                    "detector_stage": detector_stage,
                    "certificate_sha256": record["certificate_sha256"],
                    "learned_clause": learned_clause,
                    "learned_clause_sha256": _canonical_json_sha256(learned_clause),
                    "lean_ingress": lean_ingress,
                }
            )
            count += 1
    if count != records or terminal_record != parent:
        raise TerminalRupSourceError(
            "structural terminal record count or chain head drifted"
        )
    return learned_clauses, _terminal_bank_manifest(terminal_bank_entries)


def _terminal_bank_manifest(entries: Sequence[Mapping[str, Any]]) -> dict[str, Any]:
    body = {
        "schema": TERMINAL_BANK_MANIFEST_SCHEMA,
        "lean_bank_type": LEAN_TERMINAL_BANK_TYPE,
        "lean_terminal_consumer": LEAN_TERMINAL_CONSUMER,
        "entries": [dict(entry) for entry in entries],
        "scope": (
            "typed finite exact-12 cell bank ingress only; not aggregate coverage, "
            "a universal lift, or live theorem closure"
        ),
    }
    return {**body, "manifest_sha256": _canonical_json_sha256(body)}


def _exact12_source_modules(repo_root: Path) -> tuple[Any, Any, Any]:
    """Load the canonical exact-12 builders from the selected source tree."""

    repo_root = repo_root.resolve()
    root_text = str(repo_root)
    if root_text not in sys.path:
        sys.path.insert(0, root_text)
    try:
        from census.card_head import exact12_v14_bound_jobs as bound_jobs
        from census.card_head import exact12_v14_schedule as schedule
        from census.card_head import exact12_v14_structural_cegar as structural
    except ImportError as exc:
        raise TerminalRupSourceError(
            "cannot load the canonical exact-12 source modules"
        ) from exc
    for module in (schedule, bound_jobs, structural):
        module_file = getattr(module, "__file__", None)
        if module_file is None or not Path(module_file).resolve().is_relative_to(repo_root):
            raise TerminalRupSourceError(
                "canonical exact-12 module was loaded outside the selected repository"
            )
    return schedule, bound_jobs, structural


def _canonical_materialization(repo_root: Path, job: Mapping[str, Any]) -> Any:
    """Rebuild and validate the bound job without trusting run metadata."""

    schedule, bound_jobs, _ = _exact12_source_modules(repo_root)
    try:
        manifest = schedule.build_manifest(repo_root.resolve())
        return bound_jobs.instantiate_validated_bound_job(
            job, manifest, repo_root.resolve()
        )
    except (KeyError, OSError, TypeError, ValueError) as exc:
        raise TerminalRupSourceError(
            "bound job failed canonical source rebuild"
        ) from exc


def _semantic_replay_structural_journal(
    repo_root: Path,
    instance: Any,
    journal_path: Path,
    *,
    summary: Mapping[str, Any],
) -> frozenset[tuple[int, ...]]:
    """Derive and install every journal cut through the detector replay."""

    _, _, structural = _exact12_source_modules(repo_root)
    try:
        count, terminal_record, replayed = structural.replay_journal(
            repo_root,
            instance,
            journal_path,
            job_sha256=summary["job_sha256"],
            detector_contract_sha256=summary["detector_contract_sha256"],
            cell_index=summary["cell_index"],
        )
    except (KeyError, OSError, TypeError, ValueError) as exc:
        raise TerminalRupSourceError(
            "structural journal failed semantic certificate replay"
        ) from exc
    if (
        count != summary.get("records")
        or terminal_record != summary.get("terminal_record_sha256")
    ):
        raise TerminalRupSourceError(
            "semantic journal replay record count or chain head drifted"
        )
    return replayed


def _validate_formula_against_canonical_source(
    discovery_cnf: Path,
    terminal_cnf: Path,
    *,
    repo_root: Path,
    summary: Mapping[str, Any],
    job: Mapping[str, Any],
    journal_path: Path | None,
    expected_detector_manifest: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    """Require exact bytes from a source rebuild plus semantic cut replay."""

    learned_clauses: list[tuple[int, ...]] = []
    terminal_bank_manifest = _terminal_bank_manifest([])
    if summary.get("schema") == STRUCTURAL_RUN_SCHEMA:
        learned_clauses, terminal_bank_manifest = _authenticate_structural_journal(
            journal_path,
            summary=summary,
            expected_detector_manifest=expected_detector_manifest,
        )
    materialized = _canonical_materialization(repo_root, job)
    instance = materialized.instance
    if learned_clauses:
        if journal_path is None:
            raise TerminalRupSourceError("structural terminal journal is missing")
        replayed = _semantic_replay_structural_journal(
            repo_root, instance, journal_path, summary=summary
        )
        if len(replayed) != len(learned_clauses) or replayed != frozenset(
            learned_clauses
        ):
            raise TerminalRupSourceError(
                "semantic journal replay learned-clause set drifted"
            )
    try:
        expected = instance.dimacs().encode("ascii")
        discovery_bytes = discovery_cnf.read_bytes()
        terminal_bytes = terminal_cnf.read_bytes()
    except (OSError, UnicodeError, UnicodeEncodeError) as exc:
        raise TerminalRupSourceError(
            "cannot render or read the canonical terminal formula"
        ) from exc
    if discovery_bytes != expected:
        raise TerminalRupSourceError(
            "discovery CNF differs from canonical source rebuild and journal replay"
        )
    if terminal_bytes != expected:
        raise TerminalRupSourceError(
            "terminal CNF differs from canonical source rebuild and journal replay"
        )
    return terminal_bank_manifest


def validate_terminal_run(
    workdir: Path,
    *,
    repo_root: Path,
) -> tuple[dict[str, Any], dict[str, Path], dict[str, Path], dict[str, Any]]:
    """Authenticate one completed exact-12 terminal run and its proof files."""

    workdir = workdir.resolve()
    summary_path = workdir / "summary.json"
    summary = _load_summary(summary_path)
    schema = summary.get("schema")
    if schema not in RUN_SCHEMAS:
        raise TerminalRupSourceError(f"unsupported exact-12 run schema: {schema!r}")
    if (
        summary.get("status") != "UNSAT_DRAT_VERIFIED"
        or summary.get("discovery_verdict") != "UNSAT"
        or summary.get("terminal_verdict") != "UNSAT"
        or summary.get("terminal_proof_verified") is not True
        or summary.get("error") is not None
    ):
        raise TerminalRupSourceError("run is not a clean verified terminal UNSAT")
    if (
        schema == STRUCTURAL_RUN_SCHEMA
        and summary.get("journal_replayed") is not True
    ):
        raise TerminalRupSourceError("structural terminal journal did not replay")
    artifacts = summary.get("artifacts")
    if not isinstance(artifacts, Mapping):
        raise TerminalRupSourceError("terminal summary has no artifact ledger")
    paths = {
        "discovery_cnf": _validated_run_artifact(
            workdir, artifacts, "discovery_cnf", "discovery.cnf"
        ),
        "terminal_cnf": _validated_run_artifact(
            workdir, artifacts, "terminal_cnf", "terminal.cnf"
        ),
        "proof": _validated_run_artifact(workdir, artifacts, "proof", "terminal.drat"),
        "job": _validated_run_artifact(workdir, artifacts, "job", "job.json"),
    }
    if paths["discovery_cnf"].read_bytes() != paths["terminal_cnf"].read_bytes():
        raise TerminalRupSourceError("discovery and terminal CNFs are not identical")
    job = _load_json_object(paths["job"], "bound job")
    cell_index = summary.get("cell_index")
    if (
        isinstance(cell_index, bool)
        or not isinstance(cell_index, int)
        or not 0 <= cell_index < SCHEDULE_CELL_COUNT
        or job.get("schema") != BOUND_JOB_SCHEMA
        or job.get("cell_index") != cell_index
        or summary.get("job_sha256") != _canonical_json_sha256(job)
    ):
        raise TerminalRupSourceError("terminal summary does not match its bound job")
    if schema == CELL_RUN_SCHEMA:
        if artifacts.get("clause_delta") is None:
            raise TerminalRupSourceError("cell run omitted its clause-delta artifact")
        paths["clause_delta"] = _validated_run_artifact(
            workdir, artifacts, "clause_delta", "clause_delta.json"
        )
        clause_delta = _load_json_object(paths["clause_delta"], "clause delta")
        if (
            clause_delta != job.get("clause_delta_artifact")
            or not isinstance(job.get("cnf"), dict)
            or job["cnf"].get("sha256")
            != artifacts["discovery_cnf"].get("sha256")
        ):
            raise TerminalRupSourceError(
                "cell formula artifacts do not match the bound job"
            )
    detector_paths: dict[str, Path] = {}
    detector_manifest: list[dict[str, Any]] = []
    journal_path: Path | None = None
    if schema == STRUCTURAL_RUN_SCHEMA:
        detector_manifest, detector_paths = _expected_detector_manifest(repo_root)
        if artifacts.get("journal") is not None:
            journal_path = _validated_run_artifact(
                workdir,
                artifacts,
                "journal",
                "journal.jsonl",
                allow_empty=True,
            )
            paths["journal"] = journal_path
    terminal_bank_manifest = _validate_formula_against_canonical_source(
        paths["discovery_cnf"],
        paths["terminal_cnf"],
        repo_root=repo_root,
        summary=summary,
        job=job,
        journal_path=journal_path,
        expected_detector_manifest=detector_manifest,
    )
    return summary, paths, detector_paths, terminal_bank_manifest


def normalize_dense_pure_rup(
    cnf_path: Path,
    raw_lrat_path: Path,
    output_path: Path,
) -> dict[str, int]:
    """Renumber a strict pure-RUP LRAT stream to dense append identifiers."""

    cnf = rup.parse_dimacs(cnf_path)
    base_count = len(cnf.clauses)
    id_map = {clause_id: clause_id for clause_id in range(1, base_count + 1)}
    active = set(id_map)
    additions = 0
    deletions = 0
    deleted_ids = 0
    hints_count = 0
    terminal_empty = False

    if output_path.exists():
        raise TerminalRupSourceError(f"refusing to overwrite: {output_path}")
    with raw_lrat_path.open("rb") as source, output_path.open("xb") as output:
        for line_number, raw_line in enumerate(source, 1):
            if terminal_empty:
                raise TerminalRupSourceError("LRAT action follows the empty clause")
            if not raw_line.endswith(b"\n") or b"\r" in raw_line:
                raise TerminalRupSourceError(
                    f"raw LRAT line {line_number} is not LF-terminated ASCII"
                )
            try:
                fields = raw_line.decode("ascii").split()
            except UnicodeDecodeError as exc:
                raise TerminalRupSourceError(
                    f"raw LRAT line {line_number} is not ASCII"
                ) from exc
            if len(fields) < 2:
                raise TerminalRupSourceError(f"malformed raw LRAT line {line_number}")
            try:
                if fields[1] == "d":
                    _action_id, old_deleted = rup.parse_deletion(
                        fields, line_number=line_number
                    )
                    if len(set(old_deleted)) != len(old_deleted):
                        raise TerminalRupSourceError(
                            f"duplicate deletion id on LRAT line {line_number}"
                        )
                    if any(clause_id not in active for clause_id in old_deleted):
                        raise TerminalRupSourceError(
                            f"deletion references inactive clause on LRAT line {line_number}"
                        )
                    new_deleted = [id_map[clause_id] for clause_id in old_deleted]
                    for clause_id in old_deleted:
                        active.remove(clause_id)
                    rendered = rup.format_deletion(new_deleted)
                    deletions += 1
                    deleted_ids += len(old_deleted)
                else:
                    old_id, clause, old_hints = rup.parse_addition(
                        fields,
                        line_number=line_number,
                        variable_count=cnf.variable_count,
                    )
                    if old_id in id_map or old_id <= base_count:
                        raise TerminalRupSourceError(
                            f"reused addition id on LRAT line {line_number}"
                        )
                    if any(hint not in active for hint in old_hints):
                        raise TerminalRupSourceError(
                            f"RUP hint references inactive clause on LRAT line {line_number}"
                        )
                    new_id = base_count + additions + 1
                    new_hints = [id_map[hint] for hint in old_hints]
                    id_map[old_id] = new_id
                    active.add(old_id)
                    rendered = rup.format_addition(new_id, clause, new_hints)
                    additions += 1
                    hints_count += len(old_hints)
                    terminal_empty = not clause
            except rup.MaterializationError as exc:
                raise TerminalRupSourceError(str(exc)) from exc
            output.write(rendered.encode("ascii") + b"\n")
        output.flush()
        os.fsync(output.fileno())
    if additions == 0 or not terminal_empty:
        raise TerminalRupSourceError("LRAT stream has no terminal empty-clause addition")
    return {
        "base_clauses": base_count,
        "additions": additions,
        "deletions": deletions,
        "deleted_ids": deleted_ids,
        "hints": hints_count,
    }


def prepare_terminal_rup_source(
    workdir: Path,
    output_dir: Path,
    *,
    repo_root: Path | None = None,
    checker: str = "drat-trim",
    timeout_seconds: int = 20_000,
    command_runner: Callable[..., subprocess.CompletedProcess[str]] = subprocess.run,
) -> dict[str, Any]:
    """Publish a self-contained authenticated pure-RUP source directory."""

    if timeout_seconds <= 0:
        raise TerminalRupSourceError("timeout_seconds must be positive")
    if repo_root is None:
        repo_root = Path(__file__).resolve().parents[1]
    summary, source_paths, detector_paths, terminal_bank_manifest = (
        validate_terminal_run(workdir, repo_root=repo_root)
    )
    artifact_ledger = summary["artifacts"]
    output_dir = output_dir.resolve()
    if output_dir.exists():
        raise TerminalRupSourceError(f"refusing to overwrite output: {output_dir}")
    output_dir.parent.mkdir(parents=True, exist_ok=True)
    stage = Path(tempfile.mkdtemp(prefix=f".{output_dir.name}.stage-", dir=output_dir.parent))
    try:
        copied_summary = stage / "summary.json"
        copied_summary.write_bytes(_json_bytes(summary))
        staged_names = {
            "job": "job.json",
            "clause_delta": "clause_delta.json",
            "discovery_cnf": "discovery.cnf",
            "terminal_cnf": "terminal.cnf",
            "proof": "terminal.drat",
            "journal": "journal.jsonl",
        }
        staged_paths: dict[str, Path] = {}
        for key, source_path in source_paths.items():
            staged_path = stage / staged_names[key]
            shutil.copyfile(source_path, staged_path)
            _validate_staged_artifact(staged_path, artifact_ledger[key], key)
            staged_paths[key] = staged_path

        staged_detector_paths: list[Path] = []
        detector_manifest = summary.get("detector_contract_manifest", [])
        for entry in detector_manifest:
            relative = entry["path"]
            staged_path = stage / "detector-contract" / relative
            staged_path.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(detector_paths[relative], staged_path)
            _validate_staged_artifact(staged_path, entry, f"detector:{relative}")
            staged_detector_paths.append(staged_path)

        copied_job = _load_json_object(staged_paths["job"], "staged bound job")
        if (
            copied_job.get("schema") != BOUND_JOB_SCHEMA
            or copied_job.get("cell_index") != summary.get("cell_index")
            or _canonical_json_sha256(copied_job) != summary.get("job_sha256")
        ):
            raise TerminalRupSourceError("staged bound job drifted")
        if "clause_delta" in staged_paths and (
            _load_json_object(staged_paths["clause_delta"], "staged clause delta")
            != copied_job.get("clause_delta_artifact")
        ):
            raise TerminalRupSourceError("staged clause delta drifted from bound job")
        copied_cnf = staged_paths["terminal_cnf"]
        copied_drat = staged_paths["proof"]
        if staged_paths["discovery_cnf"].read_bytes() != copied_cnf.read_bytes():
            raise TerminalRupSourceError("staged discovery and terminal CNFs differ")
        staged_terminal_bank_manifest = _validate_formula_against_canonical_source(
            staged_paths["discovery_cnf"],
            copied_cnf,
            repo_root=repo_root,
            summary=summary,
            job=copied_job,
            journal_path=staged_paths.get("journal"),
            expected_detector_manifest=detector_manifest,
        )
        if staged_terminal_bank_manifest != terminal_bank_manifest:
            raise TerminalRupSourceError("staged typed terminal-bank manifest drifted")
        terminal_bank_manifest_path = stage / "terminal-bank-manifest.json"
        terminal_bank_manifest_path.write_bytes(
            _json_bytes(staged_terminal_bank_manifest)
        )

        raw_lrat = stage / "drat-trim.lrat"
        normalized_lrat = stage / "normalized.lrat"
        checked = command_runner(
            [checker, str(copied_cnf), str(copied_drat), "-L", str(raw_lrat)],
            capture_output=True,
            text=True,
            timeout=timeout_seconds,
        )
        checker_output = checked.stdout
        if checked.stderr:
            if checker_output and not checker_output.endswith("\n"):
                checker_output += "\n"
            checker_output += checked.stderr
        checker_transcript = stage / "drat-trim-output.txt"
        checker_transcript.write_text(checker_output, encoding="utf-8")
        if checked.returncode != 0 or "s VERIFIED" not in checker_output.splitlines():
            raise TerminalRupSourceError(
                f"drat-trim did not report exact verified verdict (exit {checked.returncode})"
            )
        if not raw_lrat.is_file() or raw_lrat.stat().st_size == 0:
            raise TerminalRupSourceError("drat-trim emitted no LRAT proof")
        counts = normalize_dense_pure_rup(copied_cnf, raw_lrat, normalized_lrat)
        source_manifest = {
            "schema": rup.PURE_RUP_SOURCE_SCHEMA,
            "artifacts": {
                "cnf": rup.artifact_record(copied_cnf, relative_path=copied_cnf.name),
                "normalized_lrat": rup.artifact_record(
                    normalized_lrat, relative_path=normalized_lrat.name
                ),
            },
        }
        manifest_path = stage / "source-manifest.json"
        manifest_path.write_bytes(_json_bytes(source_manifest))
        # Re-enter through the generic strict loader before publication.
        rup.load_source_manifest(manifest_path)
        receipt_body = {
            "schema": RECEIPT_SCHEMA,
            "scope": (
                "one finite exact-12 cell only; certificate preparation, not "
                "aggregate coverage, universal lift, or Lean closure"
            ),
            "run_schema": summary["schema"],
            "cell_index": summary.get("cell_index"),
            "job_sha256": summary.get("job_sha256"),
            "terminal_record_sha256": summary.get("terminal_record_sha256"),
            "terminal_bank": {
                "schema": staged_terminal_bank_manifest["schema"],
                "entries": len(staged_terminal_bank_manifest["entries"]),
                "manifest_sha256": staged_terminal_bank_manifest["manifest_sha256"],
                "lean_terminal_consumer": staged_terminal_bank_manifest[
                    "lean_terminal_consumer"
                ],
            },
            "drat_trim_precheck": {
                "command": checker,
                "exit_code": checked.returncode,
                "reported_verdict": "s VERIFIED",
                "epistemic_status": (
                    "UNTRUSTED_PRECHECK_ONLY; LEAN COMPACT-RUP REPLAY REQUIRED"
                ),
            },
            "normalization": counts,
            "detector_contract_files": [
                rup.artifact_record(
                    path, relative_path=str(path.relative_to(stage))
                )
                for path in staged_detector_paths
            ],
            "artifacts": {
                "summary": rup.artifact_record(copied_summary, relative_path=copied_summary.name),
                "job": rup.artifact_record(
                    staged_paths["job"], relative_path=staged_paths["job"].name
                ),
                "discovery_cnf": rup.artifact_record(
                    staged_paths["discovery_cnf"],
                    relative_path=staged_paths["discovery_cnf"].name,
                ),
                "terminal_cnf": rup.artifact_record(copied_cnf, relative_path=copied_cnf.name),
                "terminal_drat": rup.artifact_record(copied_drat, relative_path=copied_drat.name),
                **(
                    {
                        "clause_delta": rup.artifact_record(
                            staged_paths["clause_delta"],
                            relative_path=staged_paths["clause_delta"].name,
                        )
                    }
                    if "clause_delta" in staged_paths
                    else {}
                ),
                **(
                    {
                        "journal": rup.artifact_record(
                            staged_paths["journal"],
                            relative_path=staged_paths["journal"].name,
                        )
                    }
                    if "journal" in staged_paths
                    else {}
                ),
                "drat_trim_output": rup.artifact_record(
                    checker_transcript, relative_path=checker_transcript.name
                ),
                "raw_lrat": rup.artifact_record(raw_lrat, relative_path=raw_lrat.name),
                "normalized_lrat": rup.artifact_record(
                    normalized_lrat, relative_path=normalized_lrat.name
                ),
                "source_manifest": rup.artifact_record(
                    manifest_path, relative_path=manifest_path.name
                ),
                "terminal_bank_manifest": rup.artifact_record(
                    terminal_bank_manifest_path,
                    relative_path=terminal_bank_manifest_path.name,
                ),
            },
        }
        receipt = {
            **receipt_body,
            "receipt_sha256": hashlib.sha256(
                json.dumps(receipt_body, sort_keys=True, separators=(",", ":")).encode()
            ).hexdigest(),
        }
        (stage / "receipt.json").write_bytes(_json_bytes(receipt))
        stage.rename(output_dir)
        return receipt
    except BaseException:
        shutil.rmtree(stage, ignore_errors=True)
        raise


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--repo-root", type=Path)
    parser.add_argument("--drat-trim", default="drat-trim")
    parser.add_argument("--timeout-seconds", type=int, default=20_000)
    args = parser.parse_args(argv)
    try:
        receipt = prepare_terminal_rup_source(
            args.workdir,
            args.output_dir,
            repo_root=args.repo_root,
            checker=args.drat_trim,
            timeout_seconds=args.timeout_seconds,
        )
    except (OSError, subprocess.SubprocessError, TerminalRupSourceError) as exc:
        parser.error(str(exc))
    print(json.dumps(receipt, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
