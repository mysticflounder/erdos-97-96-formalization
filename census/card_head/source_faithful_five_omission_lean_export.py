"""Export one authenticated five-omission journal to a Lean nogood bank.

This adapter accepts only the source-faithful v2 run/journal schemas.  It
recomputes the live formula, detector, and tool contracts, replays the complete
journal from an immutable snapshot, checks the resulting CNF hash and the
record-relevant summary fields against that snapshot, and only then delegates
record rendering to the generic certificate exporter.  Discovery/terminal
solver artifacts in the same summary are outside this record-validity adapter;
terminal proof ingress authenticates those separately.

The generated bank proves record validity only.  It is not a terminal UNSAT,
all-shard coverage, universal lift, or live-theorem closure certificate.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from dataclasses import dataclass
from pathlib import Path
from typing import Any, BinaryIO

from census.p97_search import export_generic_duplicate_center_bank as generic

from .source_faithful_five_omission import SOURCE_FAITHFUL_FIVE_OMISSION_SCHEMA
from .source_faithful_five_omission_cegar import (
    DETECTOR_FILES,
    FORMULA_FILES,
    RECORD_KEYS,
    RUN_SCHEMA,
    FiveOmissionCegarError,
    _json_object_without_duplicates,
    _new_instance,
    _read_regular_bytes_no_follow,
    _regular_unlinked_snapshot,
    _reject_json_constant,
    _sha256_json,
    _source_manifest,
    _tool_manifest,
    _write_regular_bytes,
    replay_journal,
)

SUMMARY_KEYS = frozenset(
    {
        "artifacts",
        "base_clause_count",
        "base_formula_sha256",
        "current_clause_count",
        "current_formula_sha256",
        "deleted_label",
        "detector_contract_sha256",
        "detector_source_manifest",
        "discovery_verdict",
        "error",
        "finite_instance_schema",
        "formula_contract_sha256",
        "formula_source_manifest",
        "journal_replayed",
        "max_iterations",
        "n_variables",
        "records",
        "replay",
        "schema",
        "scope",
        "selector_variables",
        "source_manifests_rechecked",
        "status",
        "terminal_proof_verified",
        "terminal_record_sha256",
        "terminal_verdict",
        "timeout_seconds",
        "tool_contract_sha256",
        "tool_execution_assumption",
        "tool_manifest",
        "tools_rechecked",
    }
)
MAX_SUMMARY_BYTES = 8 * 1024 * 1024
ARTIFACT_KEYS = frozenset(
    {"journal", "discovery_cnf", "terminal_cnf", "proof", "survivor"}
)


@dataclass(frozen=True)
class AuthenticatedFiveOmissionRun:
    """One stable, fully replayed source-faithful v2 run snapshot."""

    workdir: Path
    deleted_label: int
    summary: dict[str, Any]
    summary_artifact: dict[str, Any]
    journal_artifact: dict[str, Any]
    records: tuple[dict[str, Any], ...]
    terminal_record_sha256: str | None


def _strict_json_object(payload: bytes, *, source: Path) -> dict[str, Any]:
    if not payload.endswith(b"\n"):
        raise FiveOmissionCegarError(f"artifact is truncated: {source}")
    try:
        value = json.loads(
            payload,
            object_pairs_hook=_json_object_without_duplicates,
            parse_constant=_reject_json_constant,
        )
    except (UnicodeDecodeError, ValueError) as exc:
        raise FiveOmissionCegarError(f"artifact is not strict JSON: {source}") from exc
    if not isinstance(value, dict):
        raise FiveOmissionCegarError(f"artifact is not a JSON object: {source}")
    return value


def _records_from_replayed_snapshot(stream: BinaryIO) -> tuple[dict[str, Any], ...]:
    stream.seek(0)
    records: list[dict[str, Any]] = []
    for line_number, raw_line in enumerate(stream, 1):
        try:
            record = json.loads(
                raw_line,
                object_pairs_hook=_json_object_without_duplicates,
                parse_constant=_reject_json_constant,
            )
        except (UnicodeDecodeError, ValueError) as exc:
            raise FiveOmissionCegarError(
                f"replayed journal line {line_number} is not strict JSON"
            ) from exc
        if not isinstance(record, dict) or set(record) != RECORD_KEYS:
            raise FiveOmissionCegarError(
                f"replayed journal line {line_number} changed shape"
            )
        records.append(record)
    return tuple(records)


def load_authenticated_run(
    repo_root: Path, workdir: Path, deleted_label: int
) -> AuthenticatedFiveOmissionRun:
    """Authenticate a stable v2 run and return its exact replayed records."""

    repo_root = repo_root.resolve()
    workdir = workdir.resolve()
    summary_path = workdir / "summary.json"
    journal_path = workdir / "journal.jsonl"

    summary_bytes, summary_artifact = _read_regular_bytes_no_follow(
        summary_path, maximum_bytes=MAX_SUMMARY_BYTES
    )
    summary = _strict_json_object(summary_bytes, source=summary_path)
    if set(summary) != SUMMARY_KEYS or summary.get("schema") != RUN_SCHEMA:
        raise FiveOmissionCegarError("run summary schema or key set is unsupported")
    if summary.get("deleted_label") != deleted_label:
        raise FiveOmissionCegarError("run summary deleted-label mismatch")

    formula_manifest = _source_manifest(repo_root, FORMULA_FILES)
    detector_manifest = _source_manifest(repo_root, DETECTOR_FILES)
    formula_contract_sha256 = _sha256_json(formula_manifest)
    detector_contract_sha256 = _sha256_json(detector_manifest)
    instance = _new_instance(deleted_label)
    base_clause_count = len(instance.cnf.clauses)
    base_formula_sha256 = hashlib.sha256(
        instance.dimacs().encode("utf-8")
    ).hexdigest()

    with _regular_unlinked_snapshot(journal_path) as (snapshot, journal_artifact):
        count, terminal_record_sha256, _learned_clauses = replay_journal(
            instance,
            snapshot,
            base_formula_sha256=base_formula_sha256,
            formula_contract_sha256=formula_contract_sha256,
            detector_contract_sha256=detector_contract_sha256,
            deleted_label=deleted_label,
        )
        records = _records_from_replayed_snapshot(snapshot)

    expected_terminal = terminal_record_sha256 if count else None
    current_formula_sha256 = hashlib.sha256(
        instance.dimacs().encode("utf-8")
    ).hexdigest()
    tool_manifest = _tool_manifest()
    expected_selectors = {
        "deleted": list(instance.deleted_variables.values()),
        "blocker": list(instance.blocker_variables.values()),
        "centers": list(instance.center_variables.values()),
    }
    artifacts = summary.get("artifacts")
    if not isinstance(artifacts, dict) or set(artifacts) != ARTIFACT_KEYS:
        raise FiveOmissionCegarError("run summary artifact table is malformed")
    checks = (
        summary.get("finite_instance_schema")
        == SOURCE_FAITHFUL_FIVE_OMISSION_SCHEMA,
        summary.get("base_formula_sha256") == base_formula_sha256,
        summary.get("formula_source_manifest") == formula_manifest,
        summary.get("formula_contract_sha256") == formula_contract_sha256,
        summary.get("detector_source_manifest") == detector_manifest,
        summary.get("detector_contract_sha256") == detector_contract_sha256,
        summary.get("tool_manifest") == tool_manifest,
        summary.get("tool_contract_sha256") == _sha256_json(tool_manifest),
        summary.get("n_variables") == instance.cnf.n_variables,
        summary.get("base_clause_count") == base_clause_count,
        summary.get("current_clause_count") == base_clause_count + count,
        summary.get("current_formula_sha256") == current_formula_sha256,
        summary.get("selector_variables") == expected_selectors,
        summary.get("records") == count == len(records),
        summary.get("terminal_record_sha256") == expected_terminal,
        artifacts.get("journal") == journal_artifact,
        summary.get("journal_replayed") is True,
        summary.get("source_manifests_rechecked") is True,
        summary.get("tools_rechecked") is True,
    )
    if not all(checks):
        raise FiveOmissionCegarError(
            "run summary disagrees with the authenticated journal snapshot"
        )

    return AuthenticatedFiveOmissionRun(
        workdir=workdir,
        deleted_label=deleted_label,
        summary=summary,
        summary_artifact=summary_artifact,
        journal_artifact=journal_artifact,
        records=records,
        terminal_record_sha256=expected_terminal,
    )


def select_duplicate_center_membership_records(
    run: AuthenticatedFiveOmissionRun, limit: int | None = None
) -> list[dict[str, Any]]:
    """Select first representatives of duplicate-center membership cores."""

    if limit is not None and limit <= 0:
        raise ValueError("limit must be positive")
    selected: list[dict[str, Any]] = []
    seen: set[tuple[tuple[int, tuple[int, ...]], ...]] = set()
    for source_record in run.records:
        if source_record["detector_stage"] != generic.STAGE:
            continue
        record = dict(source_record)
        record["iteration"] = source_record["index"]
        key = generic._membership_key(record["certificate"])
        if key in seen:
            continue
        seen.add(key)
        # Validate the exact payload before retaining it, not only while rendering.
        generic._record_lean(len(selected), record, membership_core=True)
        selected.append(record)
        if limit is not None and len(selected) >= limit:
            break
    if not selected:
        raise FiveOmissionCegarError(
            "authenticated journal contains no duplicate-center records"
        )
    return selected


def _write_new(path: Path, source: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    _write_regular_bytes(path, source.encode("utf-8"), create=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--workdir", type=Path, required=True)
    parser.add_argument("--deleted-label", type=int, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--limit", type=int)
    parser.add_argument("--chunk-size", type=int, default=100)
    parser.add_argument(
        "--namespace",
        default=(
            "Problem97.ATailFrontierLiveClosure."
            "ExactTwelveFiveOmissionDuplicateCenterBank"
        ),
    )
    parser.add_argument("--records-per-module", type=int)
    parser.add_argument("--shard-module-prefix")
    parser.add_argument("--manifest", type=Path)
    args = parser.parse_args()

    if args.limit is not None and args.limit <= 0:
        parser.error("--limit must be positive")
    if args.chunk_size <= 0:
        parser.error("--chunk-size must be positive")
    if args.records_per_module is not None:
        if args.records_per_module <= 0:
            parser.error("--records-per-module must be positive")
        if not args.shard_module_prefix:
            parser.error("--records-per-module requires --shard-module-prefix")
    elif args.shard_module_prefix:
        parser.error("--shard-module-prefix requires --records-per-module")
    if args.manifest is not None and args.records_per_module is None:
        parser.error("--manifest requires --records-per-module")

    run = load_authenticated_run(args.repo_root, args.workdir, args.deleted_label)
    records = select_duplicate_center_membership_records(run, args.limit)
    journal_path = run.workdir / "journal.jsonl"
    journal_digest = run.journal_artifact["sha256"]
    shards: list[tuple[str, str, str]] = []
    if args.records_per_module is None:
        coordinator = generic._render(
            journal_path,
            records,
            args.namespace,
            args.chunk_size,
            membership_core=True,
            journal_digest=journal_digest,
        )
    else:
        coordinator, shards = generic._render_module_shards(
            journal_path,
            records,
            args.namespace,
            args.shard_module_prefix,
            args.records_per_module,
            journal_digest=journal_digest,
        )

    if shards:
        shard_directory = args.out.parent / f"{args.out.stem}Shards"
        shard_directory.mkdir(parents=True, exist_ok=True)
        for module, _namespace, source in shards:
            _write_new(shard_directory / f"{module.rsplit('.', 1)[-1]}.lean", source)
    _write_new(args.out, coordinator)

    if args.manifest is not None:
        assert args.records_per_module is not None
        assert args.shard_module_prefix is not None
        manifest = generic._manifest_document(
            journal=journal_path,
            journal_digest=journal_digest,
            journal_size=run.journal_artifact["bytes"],
            out=args.out,
            coordinator=coordinator,
            records=records,
            namespace=args.namespace,
            module_prefix=args.shard_module_prefix,
            records_per_module=args.records_per_module,
            shards=shards,
        )
        manifest["schema"] = (
            "p97_source_faithful_five_omission_duplicate_center_export.v1"
        )
        manifest["source"].update(
            {
                "run_summary": (run.workdir / "summary.json").as_posix(),
                "run_summary_sha256": run.summary_artifact["sha256"],
                "deleted_label": run.deleted_label,
                "authenticated_record_count": len(run.records),
                "terminal_record_sha256": run.terminal_record_sha256,
                "base_formula_sha256": run.summary["base_formula_sha256"],
                "formula_contract_sha256": run.summary[
                    "formula_contract_sha256"
                ],
                "detector_contract_sha256": run.summary[
                    "detector_contract_sha256"
                ],
            }
        )
        args.manifest.parent.mkdir(parents=True, exist_ok=True)
        _write_regular_bytes(
            args.manifest,
            json.dumps(manifest, indent=2, sort_keys=True).encode("utf-8") + b"\n",
            create=True,
        )

    print(
        f"wrote {args.out} with {len(records)} authenticated distinct "
        f"duplicate-center membership cores from {len(run.records)} records"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
