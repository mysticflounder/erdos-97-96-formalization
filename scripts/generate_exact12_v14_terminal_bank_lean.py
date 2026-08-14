#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Materialize a typed Lean bank from an authenticated exact-12 v14 packet.

The source packet must have been published by
``prepare_exact12_v14_terminal_rup_source.py``.  This generator independently
checks the packet receipt, its complete artifact ledger, the tagged journal
chain, and the typed terminal-bank manifest.  Structural entries are rebuilt
as checked ``DuplicateCenterNogood`` values and adapted to the common
``SourceOrderPositiveNogood`` type.  Lean-backed source-order entries retain
their authenticated named theorem bindings.

The generated shards materialize the finite bank only.  They do not prove the
terminal DIMACS equality, replay the compact RUP proof in Lean, establish
aggregate cell coverage, provide a universal lift, or close a live theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import shutil
import tempfile
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

import materialize_checkpointed_rup as rup
import prepare_exact12_v14_terminal_rup_source as terminal

from census.p97_search import export_generic_duplicate_center_bank as duplicate

EXPORT_SCHEMA = "p97_rigid221_exact12_typed_terminal_bank_lean.v1"
DEFAULT_NAMESPACE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "GeneratedTerminalBank"
)
COORDINATOR_STEM = "TerminalBank"
SHARD_DIRECTORY = "TerminalBankShards"
QUALIFIED_NAME = re.compile(r"[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*")
RECEIPT_REQUIRED_ARTIFACTS = frozenset(
    {"summary", "job", "journal", "terminal_bank_manifest"}
)


class TerminalBankGenerationError(ValueError):
    """An authenticated packet or generated-bank contract was malformed."""


def _strict_json_object(path: Path, label: str) -> dict[str, Any]:
    try:
        value = json.loads(
            path.read_text(encoding="utf-8"),
            object_pairs_hook=terminal._reject_duplicate_keys,
            parse_constant=terminal._reject_json_constant,
        )
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise TerminalBankGenerationError(
            f"cannot read strict {label}: {path}"
        ) from exc
    if not isinstance(value, dict):
        raise TerminalBankGenerationError(f"{label} is not a JSON object")
    return value


def _canonical_json_sha256(value: Any) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")
    ).hexdigest()


def _artifact_path(source_dir: Path, record: object, label: str) -> Path:
    try:
        rup.validate_source_artifact_record(record, label=label)
    except (KeyError, TypeError, ValueError, rup.MaterializationError) as exc:
        raise TerminalBankGenerationError(f"malformed {label} artifact record") from exc
    assert isinstance(record, dict)
    source_root = source_dir.resolve()
    path = (source_root / record["path"]).resolve()
    try:
        path.relative_to(source_root)
    except ValueError as exc:
        raise TerminalBankGenerationError(
            f"{label} resolves outside the packet"
        ) from exc
    try:
        rup.validate_expected_artifact(path, record, label=label)
    except (KeyError, OSError, ValueError, rup.MaterializationError) as exc:
        raise TerminalBankGenerationError(f"{label} artifact drift") from exc
    return path


def _validate_receipt(source_dir: Path) -> tuple[dict[str, Any], dict[str, Path]]:
    receipt = _strict_json_object(source_dir / "receipt.json", "packet receipt")
    recorded_digest = receipt.get("receipt_sha256")
    body = dict(receipt)
    body.pop("receipt_sha256", None)
    if (
        receipt.get("schema") != terminal.RECEIPT_SCHEMA
        or not terminal._is_sha256(recorded_digest)
        or recorded_digest != _canonical_json_sha256(body)
    ):
        raise TerminalBankGenerationError("packet receipt authentication failed")
    artifacts = receipt.get("artifacts")
    if not isinstance(artifacts, dict) or not RECEIPT_REQUIRED_ARTIFACTS <= set(
        artifacts
    ):
        raise TerminalBankGenerationError(
            "packet receipt lacks terminal-bank source artifacts"
        )
    paths = {
        name: _artifact_path(source_dir, record, f"receipt {name}")
        for name, record in artifacts.items()
    }
    detector_records = receipt.get("detector_contract_files")
    if not isinstance(detector_records, list) or not detector_records:
        raise TerminalBankGenerationError(
            "packet receipt lacks detector-contract artifacts"
        )
    for index, record in enumerate(detector_records):
        _artifact_path(source_dir, record, f"receipt detector contract {index}")
    return receipt, paths


def _journal_records(path: Path) -> list[dict[str, Any]]:
    records: list[dict[str, Any]] = []
    with path.open("rb") as handle:
        for line_number, raw_line in enumerate(handle, 1):
            if not raw_line.endswith(b"\n") or b"\r" in raw_line:
                raise TerminalBankGenerationError(
                    f"journal line {line_number} is not canonical JSONL"
                )
            try:
                record = json.loads(
                    raw_line,
                    object_pairs_hook=terminal._reject_duplicate_keys,
                    parse_constant=terminal._reject_json_constant,
                )
            except (UnicodeError, json.JSONDecodeError) as exc:
                raise TerminalBankGenerationError(
                    f"journal line {line_number} is not strict JSON"
                ) from exc
            if not isinstance(record, dict):
                raise TerminalBankGenerationError(
                    f"journal line {line_number} is not an object"
                )
            records.append(record)
    return records


def _load_authenticated_packet(
    source_dir: Path, repo_root: Path
) -> tuple[
    dict[str, Any],
    dict[str, Any],
    list[dict[str, Any]],
    dict[str, Any],
    dict[str, Any],
]:
    source_dir = source_dir.resolve()
    receipt, paths = _validate_receipt(source_dir)
    summary = _strict_json_object(paths["summary"], "staged run summary")
    job = _strict_json_object(paths["job"], "staged bound job")
    manifest = _strict_json_object(
        paths["terminal_bank_manifest"], "typed terminal-bank manifest"
    )
    if (
        summary.get("schema") != terminal.STRUCTURAL_RUN_SCHEMA
        or summary.get("status") != "UNSAT_DRAT_VERIFIED"
        or summary.get("terminal_proof_verified") is not True
        or summary.get("journal_replayed") is not True
        or isinstance(summary.get("records"), bool)
        or not isinstance(summary.get("records"), int)
        or summary["records"] <= 0
        or not terminal._is_sha256(summary.get("terminal_record_sha256"))
    ):
        raise TerminalBankGenerationError(
            "packet is not a terminal authenticated structural-v3 run"
        )
    if (
        receipt.get("run_schema") != summary["schema"]
        or receipt.get("cell_index") != summary.get("cell_index")
        or receipt.get("job_sha256") != summary.get("job_sha256")
        or receipt.get("terminal_record_sha256")
        != summary.get("terminal_record_sha256")
        or job.get("schema") != terminal.BOUND_JOB_SCHEMA
        or job.get("cell_index") != summary.get("cell_index")
        or _canonical_json_sha256(job) != summary.get("job_sha256")
    ):
        raise TerminalBankGenerationError("packet run/job/receipt binding drifted")
    detector_manifest = summary.get("detector_contract_manifest")
    receipt_detector_manifest = receipt.get("detector_contract_files")
    if not isinstance(detector_manifest, list) or receipt_detector_manifest != [
        {
            "path": f"detector-contract/{entry.get('path')}",
            "byte_count": entry.get("bytes"),
            "sha256": entry.get("sha256"),
        }
        for entry in detector_manifest
    ]:
        raise TerminalBankGenerationError(
            "packet detector-contract manifest binding drifted"
        )
    expected_manifest = terminal._authenticate_structural_journal(
        paths["journal"],
        summary=summary,
        expected_detector_manifest=detector_manifest,
    )[1]
    if manifest != expected_manifest:
        raise TerminalBankGenerationError(
            "typed terminal-bank manifest differs from authenticated journal"
        )
    receipt_bank = receipt.get("terminal_bank")
    if (
        not isinstance(receipt_bank, dict)
        or receipt_bank.get("schema") != manifest.get("schema")
        or receipt_bank.get("entries") != len(manifest.get("entries", []))
        or receipt_bank.get("manifest_sha256") != manifest.get("manifest_sha256")
        or receipt_bank.get("lean_terminal_consumer")
        != manifest.get("lean_terminal_consumer")
    ):
        raise TerminalBankGenerationError("receipt terminal-bank binding drifted")
    records = _journal_records(paths["journal"])
    if len(records) != summary["records"]:
        raise TerminalBankGenerationError("journal record count drifted")
    _validate_entries(repo_root, summary, manifest, records)
    return receipt, summary, records, manifest, job


def _source_module(path_text: str) -> str:
    path = Path(path_text)
    if (
        path.is_absolute()
        or ".." in path.parts
        or len(path.parts) < 2
        or path.parts[0] != "lean"
        or path.suffix != ".lean"
    ):
        raise TerminalBankGenerationError(
            f"named source-order Lean path is not canonical: {path_text!r}"
        )
    module = ".".join(path.with_suffix("").parts[1:])
    if QUALIFIED_NAME.fullmatch(module) is None:
        raise TerminalBankGenerationError(
            f"named source-order Lean module is malformed: {module!r}"
        )
    return module


def _validate_source_file(
    repo_root: Path, binding: Mapping[str, Any], prefix: str
) -> str:
    path_key = f"{prefix}source_path"
    bytes_key = f"{prefix}source_bytes"
    digest_key = f"{prefix}source_sha256"
    path_text = binding.get(path_key)
    byte_count = binding.get(bytes_key)
    digest = binding.get(digest_key)
    if (
        not isinstance(path_text, str)
        or isinstance(byte_count, bool)
        or not isinstance(byte_count, int)
        or byte_count < 0
        or not terminal._is_sha256(digest)
    ):
        raise TerminalBankGenerationError("named source-order binding is malformed")
    module = _source_module(path_text)
    path = (repo_root.resolve() / path_text).resolve()
    try:
        path.relative_to(repo_root.resolve())
    except ValueError as exc:
        raise TerminalBankGenerationError(
            "named source-order source escapes repo"
        ) from exc
    if (
        not path.is_file()
        or path.stat().st_size != byte_count
        or rup.sha256(path) != digest
    ):
        raise TerminalBankGenerationError(
            f"named source-order Lean source drifted: {path_text}"
        )
    return module


def _normalized_choices(
    value: object, label: str, *, allow_exact: bool = False
) -> list[dict[str, Any]]:
    if not isinstance(value, list) or not value:
        raise TerminalBankGenerationError(f"{label} choices are malformed")
    choices: list[dict[str, Any]] = []
    for choice in value:
        expected_keys = {"center", "support", "exact"} if allow_exact else {
            "center",
            "support",
        }
        if not isinstance(choice, dict) or set(choice) != expected_keys:
            raise TerminalBankGenerationError(f"{label} choice is malformed")
        if allow_exact and not isinstance(choice["exact"], bool):
            raise TerminalBankGenerationError(f"{label} choice is malformed")
        center = choice["center"]
        support = choice["support"]
        if (
            isinstance(center, bool)
            or not isinstance(center, int)
            or not 0 <= center < 12
            or not isinstance(support, list)
            or any(
                isinstance(point, bool)
                or not isinstance(point, int)
                or not 0 <= point < 12
                for point in support
            )
            or support != sorted(set(support))
            or center in support
        ):
            raise TerminalBankGenerationError(f"{label} choice is malformed")
        choices.append({"center": center, "support": support})
    return choices


def _entry_choices_and_imports(
    repo_root: Path,
    entry: Mapping[str, Any],
    record: Mapping[str, Any],
) -> tuple[list[dict[str, Any]], set[str]]:
    ingress = entry.get("lean_ingress")
    if not isinstance(ingress, Mapping):
        raise TerminalBankGenerationError("terminal-bank Lean ingress is malformed")
    if entry.get("certificate_kind") == terminal.STRUCTURAL_CERTIFICATE_KIND:
        if (
            ingress.get("kind") != "checked_duplicate_center_adapter"
            or ingress.get("adapter_declaration")
            != terminal.LEAN_DUPLICATE_CENTER_ADAPTER
        ):
            raise TerminalBankGenerationError("structural Lean adapter drifted")
        certificate = record.get("certificate")
        if not isinstance(certificate, Mapping):
            raise TerminalBankGenerationError("structural certificate is malformed")
        return (
            _normalized_choices(
                certificate.get("rows"), "structural", allow_exact=True
            ),
            set(),
        )
    if entry.get("certificate_kind") == terminal.SOURCE_ORDER_CERTIFICATE_KIND:
        if ingress.get("kind") != "named_source_order_positive_nogood":
            raise TerminalBankGenerationError("source-order Lean ingress drifted")
        binding = ingress.get("binding")
        if not isinstance(binding, Mapping):
            raise TerminalBankGenerationError("source-order Lean binding is malformed")
        declaration = binding.get("nogood_declaration")
        if (
            not isinstance(declaration, str)
            or QUALIFIED_NAME.fullmatch(declaration) is None
        ):
            raise TerminalBankGenerationError(
                "source-order nogood declaration is malformed"
            )
        modules = {
            _validate_source_file(repo_root, binding, ""),
            _validate_source_file(repo_root, binding, "coverage_"),
            _validate_source_file(repo_root, binding, "consumer_"),
        }
        return _normalized_choices(binding.get("choices"), "source-order"), modules
    raise TerminalBankGenerationError("terminal-bank entry has unknown family")


def _compiled_clause(instance: Any, choices: Sequence[Mapping[str, Any]]) -> list[int]:
    clause: list[int] = []
    try:
        for choice in choices:
            center = choice["center"]
            support = choice["support"]
            candidate = instance.candidate_index(center, support)
            clause.append(-instance.choice_variables[(center, candidate)])
    except (KeyError, TypeError, ValueError) as exc:
        raise TerminalBankGenerationError(
            "terminal-bank choice is absent from the canonical encoder"
        ) from exc
    return clause


def _validate_entries(
    repo_root: Path,
    summary: Mapping[str, Any],
    manifest: Mapping[str, Any],
    records: Sequence[Mapping[str, Any]],
) -> None:
    entries = manifest.get("entries")
    if not isinstance(entries, list) or len(entries) != len(records):
        raise TerminalBankGenerationError("terminal-bank entry count drifted")
    try:
        _, bound_jobs, _, _, _ = terminal._exact12_source_modules(repo_root)
        instance = bound_jobs.materialize_cell(summary["cell_index"]).instance
    except Exception as exc:
        raise TerminalBankGenerationError(
            "cannot rebuild the canonical exact-12 cell encoder"
        ) from exc
    for index, (entry, record) in enumerate(zip(entries, records, strict=True)):
        if (
            not isinstance(entry, dict)
            or entry.get("index") != index
            or record.get("index") != index
            or entry.get("journal_record_sha256") != record.get("record_sha256")
            or entry.get("certificate_sha256") != record.get("certificate_sha256")
            or entry.get("learned_clause") != record.get("learned_clause")
        ):
            raise TerminalBankGenerationError(
                f"terminal-bank entry {index} differs from its journal record"
            )
        choices, _imports = _entry_choices_and_imports(repo_root, entry, record)
        if _compiled_clause(instance, choices) != entry.get("learned_clause"):
            raise TerminalBankGenerationError(
                f"terminal-bank entry {index} clause/choice recompilation failed"
            )


def _entry_lean(
    index: int,
    entry: Mapping[str, Any],
    record: Mapping[str, Any],
) -> str:
    if entry["certificate_kind"] == terminal.STRUCTURAL_CERTIFICATE_KIND:
        declaration = duplicate._record_lean(index, dict(record), membership_core=False)
        return (
            declaration
            + f"\ndef cut{index} : SourceOrderPositiveNogood :=\n"
            + "  SourceOrderPositiveNogood.ofDuplicateCenter\n"
            + f"    record{index} (by native_decide)\n"
        )
    binding = entry["lean_ingress"]["binding"]
    return (
        f"/-- Journal record {index}; authenticated named source-order cut. -/\n"
        f"def cut{index} : SourceOrderPositiveNogood :=\n"
        f"  {binding['nogood_declaration']}\n"
    )


def _render_sources(
    *,
    source_dir: Path,
    repo_root: Path,
    receipt: Mapping[str, Any],
    records: Sequence[Mapping[str, Any]],
    manifest: Mapping[str, Any],
    namespace: str,
    module_prefix: str,
    records_per_shard: int,
) -> tuple[str, list[tuple[str, str, str]]]:
    if QUALIFIED_NAME.fullmatch(namespace) is None:
        raise TerminalBankGenerationError(f"invalid Lean namespace: {namespace!r}")
    if QUALIFIED_NAME.fullmatch(module_prefix) is None:
        raise TerminalBankGenerationError(
            f"invalid Lean module prefix: {module_prefix!r}"
        )
    if records_per_shard <= 0:
        raise TerminalBankGenerationError("records-per-shard must be positive")
    entries = manifest["entries"]
    imports = {
        (
            "Erdos9796Proof.P97.ATail.FrontierLiveClosure."
            "ExactTwelveRigid221TerminalRupIngress"
        )
    }
    for entry, record in zip(entries, records, strict=True):
        _choices, entry_imports = _entry_choices_and_imports(repo_root, entry, record)
        imports.update(entry_imports)
    groups = [
        list(range(start, min(start + records_per_shard, len(records))))
        for start in range(0, len(records), records_per_shard)
    ]
    width = max(3, len(str(len(groups))))
    shards: list[tuple[str, str, str]] = []
    for shard_number, indices in enumerate(groups, 1):
        stem = f"Part_{shard_number:0{width}d}"
        shard_module = f"{module_prefix}Shards.{stem}"
        shard_namespace = f"{namespace}Shards.{stem}"
        declarations = "\n".join(
            _entry_lean(index, entries[index], records[index]) for index in indices
        )
        cuts = ", ".join(f"cut{index}" for index in indices)
        source = f"""{chr(10).join(f"import {module}" for module in sorted(imports))}

/-!
Generated from authenticated exact-12 terminal packet: {source_dir.as_posix()}
Receipt SHA-256: {receipt["receipt_sha256"]}
Terminal-bank manifest SHA-256: {manifest["manifest_sha256"]}
Global record interval: {indices[0]}..{indices[-1]}

This shard materializes proof-carrying cuts only.  It is not an UNSAT,
aggregate-coverage, universal-lift, or live-theorem closure proof.
-/

namespace {shard_namespace}

open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.SourceOrderTerminalBankConsumer

abbrev Label := Fin 12

{declarations}
def bank : List SourceOrderPositiveNogood :=
  [{cuts}]

end {shard_namespace}
"""
        shards.append((shard_module, shard_namespace, source))
    coordinator_imports = "\n".join(
        f"import {module}" for module, _shard_namespace, _source in shards
    )
    bank_expression = " ++ ".join(
        f"{shard_namespace}.bank" for _module, shard_namespace, _source in shards
    )
    coordinator = f"""{coordinator_imports}

/-!
Generated typed terminal-bank coordinator from {source_dir.as_posix()}
Receipt SHA-256: {receipt["receipt_sha256"]}
Terminal-bank manifest SHA-256: {manifest["manifest_sha256"]}
Entries: {len(records)}

This module materializes the finite typed bank only.  Terminal compact-RUP
replay, exact DIMACS equality, aggregate coverage, the universal lift, and
live-theorem closure remain separate obligations.
-/

namespace {namespace}

open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.SourceOrderTerminalBankConsumer

def bank : List SourceOrderPositiveNogood :=
  {bank_expression}

theorem bank_length : bank.length = {len(records)} := by
  native_decide

end {namespace}
"""
    return coordinator, shards


def _text_record(path: str, source: str) -> dict[str, Any]:
    payload = source.encode("utf-8")
    return {
        "path": path,
        "byte_count": len(payload),
        "sha256": hashlib.sha256(payload).hexdigest(),
    }


def _validate_output_module_layout(output_dir: Path, module_prefix: str) -> None:
    """Require generated paths to agree with their importable Lean modules."""

    if QUALIFIED_NAME.fullmatch(module_prefix) is None:
        raise TerminalBankGenerationError(
            f"invalid Lean module prefix: {module_prefix!r}"
        )
    module_parts = tuple(module_prefix.split("."))
    if len(module_parts) < 2 or module_parts[-1] != COORDINATOR_STEM:
        raise TerminalBankGenerationError(
            f"module prefix must end in .{COORDINATOR_STEM}: {module_prefix!r}"
        )
    expected_output_suffix = module_parts[:-1]
    if tuple(output_dir.parts[-len(expected_output_suffix) :]) != expected_output_suffix:
        expected = Path(*expected_output_suffix)
        raise TerminalBankGenerationError(
            f"output directory {output_dir} does not match module prefix; "
            f"expected suffix {expected}"
        )


def materialize_terminal_bank(
    source_dir: Path,
    output_dir: Path,
    *,
    repo_root: Path,
    namespace: str = DEFAULT_NAMESPACE,
    module_prefix: str,
    records_per_shard: int = 25,
) -> dict[str, Any]:
    """Authenticate one terminal packet and atomically publish Lean shards."""

    source_dir = source_dir.resolve()
    repo_root = repo_root.resolve()
    output_dir = output_dir.resolve()
    _validate_output_module_layout(output_dir, module_prefix)
    if output_dir.exists():
        raise TerminalBankGenerationError(f"refusing to replace output: {output_dir}")
    receipt, summary, records, terminal_manifest, _job = _load_authenticated_packet(
        source_dir, repo_root
    )
    coordinator, shards = _render_sources(
        source_dir=source_dir,
        repo_root=repo_root,
        receipt=receipt,
        records=records,
        manifest=terminal_manifest,
        namespace=namespace,
        module_prefix=module_prefix,
        records_per_shard=records_per_shard,
    )
    output_dir.parent.mkdir(parents=True, exist_ok=True)
    stage = Path(
        tempfile.mkdtemp(prefix=f".{output_dir.name}.stage-", dir=output_dir.parent)
    )
    try:
        coordinator_path = stage / f"{COORDINATOR_STEM}.lean"
        coordinator_path.write_text(coordinator, encoding="utf-8")
        shard_dir = stage / SHARD_DIRECTORY
        shard_dir.mkdir()
        shard_records = []
        for module, shard_namespace, source in shards:
            stem = module.rsplit(".", 1)[-1]
            relative = f"{SHARD_DIRECTORY}/{stem}.lean"
            (stage / relative).write_text(source, encoding="utf-8")
            shard_records.append(
                {
                    "module": module,
                    "namespace": shard_namespace,
                    **_text_record(relative, source),
                }
            )
        body = {
            "schema": EXPORT_SCHEMA,
            "scope": (
                "authenticated finite typed Lean bank materialization only; not "
                "terminal RUP replay, aggregate coverage, universal lift, or closure"
            ),
            "source": {
                "packet": source_dir.as_posix(),
                "receipt_sha256": receipt["receipt_sha256"],
                "journal_sha256": receipt["artifacts"]["journal"]["sha256"],
                "terminal_bank_manifest_sha256": terminal_manifest["manifest_sha256"],
                "cell_index": summary["cell_index"],
                "records": len(records),
            },
            "namespace": namespace,
            "module_prefix": module_prefix,
            "records_per_shard": records_per_shard,
            "coordinator": {
                "module": module_prefix,
                **_text_record(f"{COORDINATOR_STEM}.lean", coordinator),
            },
            "shards": shard_records,
            "claims": {
                "typed_bank_materialized": True,
                "terminal_rup_replayed_in_lean": False,
                "aggregate_cell_coverage": False,
                "universal_lift": False,
                "live_theorem_closure": False,
            },
        }
        export_manifest = {
            **body,
            "export_sha256": _canonical_json_sha256(body),
        }
        (stage / "manifest.json").write_text(
            json.dumps(export_manifest, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        stage.rename(output_dir)
        return export_manifest
    except BaseException:
        shutil.rmtree(stage, ignore_errors=True)
        raise


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-dir", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--repo-root", type=Path, required=True)
    parser.add_argument("--namespace", default=DEFAULT_NAMESPACE)
    parser.add_argument("--module-prefix", required=True)
    parser.add_argument("--records-per-shard", type=int, default=25)
    args = parser.parse_args(argv)
    try:
        manifest = materialize_terminal_bank(
            args.source_dir,
            args.output_dir,
            repo_root=args.repo_root,
            namespace=args.namespace,
            module_prefix=args.module_prefix,
            records_per_shard=args.records_per_shard,
        )
    except (OSError, TerminalBankGenerationError) as exc:
        parser.error(str(exc))
    print(json.dumps(manifest, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
