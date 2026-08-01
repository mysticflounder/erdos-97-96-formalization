#!/usr/bin/env python3
"""Build one authenticated canonical Phase-3 bootstrap bank.

Journal arguments have the form ``global=PATH`` or ``DEPTH:INDEX=PATH``.
Every source is authenticated with the production projected-static-v2 Phase-3
loaders.  Only structural, cap-order, and shared-pair dynamic records are
promoted; shard-local survivors, cube artifacts, terminal DRAT, and algebraic
learned envelopes are not inputs to this tool.
"""

from __future__ import annotations

import argparse
import contextlib
import gc
import json
import os
import sys
import tempfile
from collections import Counter
from collections.abc import Iterable, Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_structural_cegar as cegar

SCHEMA = "p97-phase3-canonical-bootstrap-bank-build-v1"
REUSABLE_DYNAMIC_ORIGINS = frozenset(
    {
        "solver",
        cegar.STRUCTURAL_PATH_ORIGIN,
        cegar.CAP_ORDER_ORIGIN,
        cegar.RHOMBUS_CAP_ORDER_ORIGIN,
        cegar.KALMANSON_CAP_ORDER_ORIGIN,
        cegar.SHARED_PAIR_SEPARATION_ORIGIN,
    }
)
CAP_SCHEMAS = (
    cegar.CAP_ORDER_CERTIFICATE_SCHEMA,
    cegar.RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA,
    cegar.KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA,
    cegar.SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA,
)
CAP_METADATA = {
    cegar.CAP_ORDER_CERTIFICATE_SCHEMA: (
        cegar.BOOTSTRAP_CAP_ORDER_ORIGIN,
        cegar.CAP_ORDER_STAGE,
    ),
    cegar.RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA: (
        cegar.BOOTSTRAP_RHOMBUS_CAP_ORDER_ORIGIN,
        cegar.RHOMBUS_CAP_ORDER_STAGE,
    ),
    cegar.KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA: (
        cegar.BOOTSTRAP_KALMANSON_CAP_ORDER_ORIGIN,
        cegar.KALMANSON_CAP_ORDER_STAGE,
    ),
    cegar.SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA: (
        cegar.BOOTSTRAP_SHARED_PAIR_SEPARATION_ORIGIN,
        cegar.SHARED_PAIR_SEPARATION_STAGE,
    ),
}


@dataclass(frozen=True)
class JournalSpec:
    path: Path
    shard_depth: int | None
    shard_index: int | None


def _parse_journal_spec(raw: str) -> JournalSpec:
    try:
        scope, raw_path = raw.split("=", 1)
    except ValueError as exc:
        raise argparse.ArgumentTypeError(
            "journal must be global=PATH or DEPTH:INDEX=PATH"
        ) from exc
    if not raw_path:
        raise argparse.ArgumentTypeError("journal path is empty")
    path = Path(raw_path).expanduser().resolve()
    if scope == "global":
        return JournalSpec(path, None, None)
    try:
        raw_depth, raw_index = scope.split(":", 1)
        depth = int(raw_depth)
        index = int(raw_index)
    except (ValueError, TypeError) as exc:
        raise argparse.ArgumentTypeError(
            "journal scope must be global or integer DEPTH:INDEX"
        ) from exc
    if depth < 1 or index < 0 or index >= 1 << depth:
        raise argparse.ArgumentTypeError(
            "journal shard must satisfy depth >= 1 and 0 <= index < 2^depth"
        )
    return JournalSpec(path, depth, index)


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--frozen-bank", type=Path, required=True)
    parser.add_argument(
        "--journal",
        type=_parse_journal_spec,
        action="append",
        required=True,
        help="repeat global=PATH or DEPTH:INDEX=PATH",
    )
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument(
        "--algebraic-bootstrap",
        type=Path,
        action="append",
        help="repeat to override the production default algebraic banks",
    )
    return parser.parse_args(argv)


def _write_jsonl_atomic(path: Path, records: Iterable[Mapping[str, Any]]) -> None:
    fd, temporary = tempfile.mkstemp(
        dir=str(path.parent), prefix=f".{path.name}-", suffix=".tmp"
    )
    try:
        with os.fdopen(fd, "wb") as handle:
            for record in records:
                handle.write(cegar._canonical_bytes(record))
                handle.write(b"\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
    except BaseException:
        with contextlib.suppress(OSError):
            os.remove(temporary)
        raise


def _projected_configuration(encoding: Any) -> dict[str, Any]:
    configuration = {
        "mode": encoding.mode,
        "artifact_schema": cegar._manifest_schema(encoding),
        "learned_record_schema": cegar._learned_schema(encoding),
        "survivor_record_schema": cegar._survivor_schema(encoding),
        "sat_encoding": encoding.configuration(),
    }
    if not cegar._projected_static_v2_from_configuration(
        configuration,
        where="canonical bootstrap bank builder",
    ):
        raise cegar.StructuralCegarError(
            "canonical bootstrap bank builder requires projected-static-v2"
        )
    if any(
        encoding.semantic_name(variable).startswith("b[")
        for variable in encoding.semantic_vars
    ):
        raise cegar.StructuralCegarError(
            "projected-static-v2 encoding unexpectedly exposes blocker atoms"
        )
    return configuration


def _cap_replay_and_clause(
    encoding: Any, certificate: Mapping[str, Any]
) -> tuple[str, dict[str, Any], tuple[int, ...]]:
    schema = certificate.get("schema")
    if schema == cegar.CAP_ORDER_CERTIFICATE_SCHEMA:
        replayed, _selected, _facts = cegar._replay_cap_order_certificate(
            certificate
        )
        clause = cegar._clause_for_cap_order_certificate(encoding, replayed)
    elif schema == cegar.RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA:
        replayed, _selected, _facts = (
            cegar._replay_rhombus_cap_order_certificate(certificate)
        )
        clause = cegar._clause_for_rhombus_cap_order_certificate(
            encoding, replayed
        )
    elif schema == cegar.KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA:
        replayed, _selected, _facts = (
            cegar._replay_kalmanson_cap_order_certificate(certificate)
        )
        clause = cegar._clause_for_kalmanson_cap_order_certificate(
            encoding, replayed
        )
    elif schema == cegar.SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA:
        replayed, _selected, _facts = (
            cegar._replay_shared_pair_separation_certificate(certificate)
        )
        clause = cegar._clause_for_shared_pair_separation_certificate(
            encoding, replayed
        )
    else:
        raise cegar.StructuralCegarError(
            f"unsupported cap-order certificate schema {schema!r}"
        )
    return str(schema), replayed, clause


def _candidate_sort_key(record: Mapping[str, Any]) -> tuple[bytes, bytes]:
    certificate = record.get("certificate")
    if not isinstance(certificate, Mapping):
        raise cegar.StructuralCegarError("reusable record lacks a certificate")
    return (
        str(certificate.get("schema", "")).encode(),
        cegar._canonical_bytes(certificate),
    )


def _canonical_preliminary_records(
    encoding: Any, candidates: Sequence[Mapping[str, Any]]
) -> tuple[list[dict[str, Any]], dict[str, int]]:
    learned_schema = _projected_configuration(encoding)[
        "learned_record_schema"
    ]
    structural_bank = cegar.certificates._NogoodBank()
    structural: list[tuple[dict[str, Any], tuple[int, ...], list[str]]] = []
    cap_by_schema: dict[
        str, dict[tuple[int, ...], dict[str, Any]]
    ] = {schema: {} for schema in CAP_SCHEMAS}
    counts: Counter[str] = Counter()

    for record in sorted(candidates, key=_candidate_sort_key):
        certificate = record.get("certificate")
        if not isinstance(certificate, Mapping):
            raise cegar.StructuralCegarError(
                "reusable record lacks a certificate"
            )
        if "schema" in certificate:
            schema, replayed, clause = _cap_replay_and_clause(
                encoding, certificate
            )
            current = cap_by_schema[schema].get(clause)
            if current is None:
                cap_by_schema[schema][clause] = replayed
                counts["cap_exact_clause_kept"] += 1
            else:
                counts["cap_exact_clause_duplicate"] += 1
                if cegar._canonical_bytes(replayed) < cegar._canonical_bytes(
                    current
                ):
                    cap_by_schema[schema][clause] = replayed
            continue

        replayed, selected = cegar._replay_certificate_json(certificate)
        key = cegar.certificates._rows_key(selected)
        _matched, superseded, added = structural_bank.add(key, replayed)
        if not added:
            counts["structural_row_redundant"] += 1
            continue
        clause = cegar._clause_for_structural_certificate(
            encoding, replayed, selected
        )
        structural.append(
            (
                replayed,
                clause,
                sorted(
                    cegar.certificates._nogood_sha256(old)
                    for old in superseded
                ),
            )
        )
        counts["structural_row_added"] += 1
        counts["structural_row_superseded"] += len(superseded)

    records: list[dict[str, Any]] = []
    previous: str | None = None
    for certificate, clause, superseded in structural:
        record = cegar._with_record_hash(
            {
                "schema": learned_schema,
                "index": len(records),
                "origin": cegar.BOOTSTRAP_STRUCTURAL_PATH_ORIGIN,
                "raw_sat_index": None,
                "assignment_sha256": None,
                "semantic_assignment": None,
                "stage": certificate["stage"],
                "certificate": certificate,
                "clause": list(clause),
                "clause_sha256": cegar._sha256_value(list(clause)),
                "superseded_nogood_sha256": superseded,
            },
            previous,
        )
        previous = record["record_sha256"]
        records.append(record)

    for schema in CAP_SCHEMAS:
        origin, stage = CAP_METADATA[schema]
        for clause in sorted(
            cap_by_schema[schema], key=lambda item: (len(item), item)
        ):
            certificate = cap_by_schema[schema][clause]
            record = cegar._with_record_hash(
                {
                    "schema": learned_schema,
                    "index": len(records),
                    "origin": origin,
                    "raw_sat_index": None,
                    "assignment_sha256": None,
                    "semantic_assignment": None,
                    "stage": stage,
                    "certificate": certificate,
                    "clause": list(clause),
                    "clause_sha256": cegar._sha256_value(list(clause)),
                    "superseded_nogood_sha256": [],
                },
                previous,
            )
            previous = record["record_sha256"]
            records.append(record)
    return records, dict(sorted(counts.items()))


def _input_sha256(path: Path) -> str:
    if not path.is_file():
        raise cegar.StructuralCegarError(f"missing input {path}")
    return cegar._sha256_file(path)


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    frozen = args.frozen_bank.expanduser().resolve()
    journals: list[JournalSpec] = args.journal
    out = args.out_dir.expanduser().resolve()
    if out.exists():
        raise SystemExit(f"refusing to reuse existing output directory: {out}")
    if len({journal.path for journal in journals}) != len(journals):
        raise SystemExit("duplicate journal path")
    if any(journal.path == frozen for journal in journals):
        raise SystemExit("frozen bank must not also be supplied as a journal")

    input_paths = [frozen, *(journal.path for journal in journals)]
    input_hashes = {str(path): _input_sha256(path) for path in input_paths}
    source_path = Path(cegar.__file__).resolve()
    builder_path = Path(__file__).resolve()
    source_sha256 = _input_sha256(source_path)
    builder_sha256 = _input_sha256(builder_path)
    dependency_sha256 = cegar._dependency_hashes()

    algebraic_directories = cegar._algebraic_directories(
        cegar.DEFAULT_ALGEBRAIC_BOOTSTRAPS
        if args.algebraic_bootstrap is None
        else tuple(path.expanduser().resolve() for path in args.algebraic_bootstrap)
    )
    algebraic_templates, algebraic_summary = cegar._load_algebraic_templates(
        algebraic_directories
    )
    encoding = cegar._phase3_encoding(projected_static_v2=True)
    projected_configuration = _projected_configuration(encoding)

    frozen_records, frozen_summary = cegar._bootstrap_certificates(
        encoding, frozen
    )
    candidates: list[dict[str, Any]] = list(frozen_records)
    journal_summaries: list[dict[str, Any]] = []
    for journal in journals:
        shard = (
            None
            if journal.shard_depth is None
            else cegar._shard_spec(
                encoding,
                depth=journal.shard_depth,
                index=journal.shard_index,
            )
        )
        shard_literals = (
            ()
            if shard is None
            else tuple(int(literal) for literal in shard["literals"])
        )
        records, _bank, _clauses = cegar._load_learned(
            journal.path,
            encoding,
            algebraic_templates,
            shard_literals,
        )
        origin_counts = Counter(str(record.get("origin")) for record in records)
        retained = [
            record
            for record in records
            if record.get("origin") in REUSABLE_DYNAMIC_ORIGINS
        ]
        retained_origin_counts = Counter(
            str(record.get("origin")) for record in retained
        )
        candidates.extend(retained)
        journal_summaries.append(
            {
                "path": str(journal.path),
                "sha256": input_hashes[str(journal.path)],
                "shard": shard,
                "authenticated_record_count": len(records),
                "origin_histogram": dict(sorted(origin_counts.items())),
                "retained_record_count": len(retained),
                "retained_origin_histogram": dict(
                    sorted(retained_origin_counts.items())
                ),
                "excluded_record_count": len(records) - len(retained),
            }
        )
        del records, _bank, _clauses, retained
        gc.collect()

    preliminary, merge_counts = _canonical_preliminary_records(
        encoding, candidates
    )
    del candidates
    gc.collect()

    out.mkdir(parents=True)
    preliminary_path = out / "preliminary-merged.jsonl"
    canonical_path = out / "learned-certificates.jsonl"
    manifest_path = out / "manifest.json"
    _write_jsonl_atomic(preliminary_path, preliminary)

    canonical, preliminary_replay_summary = cegar._bootstrap_certificates(
        encoding, preliminary_path
    )
    _write_jsonl_atomic(canonical_path, canonical)
    replayed, idempotence_summary = cegar._bootstrap_certificates(
        encoding, canonical_path
    )
    if replayed != canonical:
        raise cegar.StructuralCegarError(
            "canonical bank is not exactly idempotent under bootstrap replay"
        )

    changed_inputs: dict[str, dict[str, str]] = {}
    for path in input_paths:
        after = _input_sha256(path)
        before = input_hashes[str(path)]
        if after != before:
            changed_inputs[str(path)] = {"before": before, "after": after}
    if changed_inputs:
        raise cegar.StructuralCegarError(
            f"input changed during authenticated build: {changed_inputs}"
        )
    if _input_sha256(source_path) != source_sha256:
        raise cegar.StructuralCegarError(
            "production Phase-3 source changed during build"
        )
    if _input_sha256(builder_path) != builder_sha256:
        raise cegar.StructuralCegarError("builder source changed during build")
    after_dependency_sha256 = cegar._dependency_hashes()
    if after_dependency_sha256 != dependency_sha256:
        raise cegar.StructuralCegarError(
            "production Phase-3 dependencies changed during build"
        )

    unsigned_manifest = {
        "schema": SCHEMA,
        "created_at": datetime.now(UTC).isoformat(),
        "builder": {
            "path": str(builder_path),
            "sha256": builder_sha256,
        },
        "production_loader": {
            "path": str(source_path),
            "sha256": source_sha256,
            "dependency_sha256": dependency_sha256,
            "configuration": projected_configuration,
            "authentication_functions": [
                "_load_learned",
                "_bootstrap_certificates",
            ],
        },
        "frozen_bank": {
            "path": str(frozen),
            "sha256": input_hashes[str(frozen)],
            "loader_summary": frozen_summary,
            "returned_canonical_record_count": len(frozen_records),
        },
        "journals": journal_summaries,
        "algebraic_bootstraps": {
            "paths": [str(path) for path in algebraic_directories],
            "loader_summary": algebraic_summary,
        },
        "merge": {
            "candidate_record_count": len(frozen_records)
            + sum(
                int(summary["retained_record_count"])
                for summary in journal_summaries
            ),
            "preliminary_record_count": len(preliminary),
            "counts": merge_counts,
            "preliminary_bootstrap_replay_summary": (
                preliminary_replay_summary
            ),
            "canonical_record_count": len(canonical),
            "idempotence_replay_summary": idempotence_summary,
            "exact_idempotence": True,
        },
        "artifacts": {
            "preliminary": {
                "path": str(preliminary_path),
                "sha256": _input_sha256(preliminary_path),
                "record_chain_head_sha256": (
                    preliminary[-1]["record_sha256"] if preliminary else None
                ),
            },
            "canonical": {
                "path": str(canonical_path),
                "sha256": _input_sha256(canonical_path),
                "record_chain_head_sha256": (
                    canonical[-1]["record_sha256"] if canonical else None
                ),
            },
        },
        "exclusions": {
            "bootstrap_records_from_journals": (
                "replaced by the separately authenticated frozen source"
            ),
            "algebraic_learned_records": (
                "excluded from this bank; supplied by the configured typed "
                "algebraic bootstrap banks"
            ),
            "survivors_and_cube_or_terminal_artifacts": (
                "not learned-journal records and not globally reusable cuts"
            ),
            "blocker_atoms": (
                "absent from the projected-static-v2 semantic schema"
            ),
        },
        "trust_boundary": (
            "Python authenticates, replays, minimizes, and hash-chains the "
            "bank; this build is not Lean-kernel-checked"
        ),
    }
    manifest = {
        **unsigned_manifest,
        "manifest_sha256": cegar._sha256_value(unsigned_manifest),
    }
    cegar._atomic_json(manifest_path, manifest)
    print(
        json.dumps(
            {
                "out_dir": str(out),
                "canonical_record_count": len(canonical),
                "canonical_sha256": manifest["artifacts"]["canonical"][
                    "sha256"
                ],
                "record_chain_head_sha256": manifest["artifacts"][
                    "canonical"
                ]["record_chain_head_sha256"],
                "manifest_sha256": manifest["manifest_sha256"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
