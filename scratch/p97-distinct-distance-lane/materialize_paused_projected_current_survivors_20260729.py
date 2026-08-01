#!/usr/bin/env python3
"""Materialize an immutable current-source snapshot from the paused old journal.

This is a fail-closed reclassification of one pinned 163-record survivor
journal.  It is not a continuation of the old search and does not establish
exhaustive or terminal Phase-3 coverage.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import sys
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_structural_cegar as structural  # noqa: E402
from census.p97_search import phase3_survivor_metric_driver as metric_driver  # noqa: E402

SOURCE_DIR = (
    ROOT
    / "scratch/p97-distinct-distance-lane"
    / "phase3_structural_cegar_projected_sequential_global_v2_20260729"
)
SOURCE_PATH = SOURCE_DIR / "survivors.jsonl"
OUTPUT_DIR = (
    ROOT
    / "scratch/p97-distinct-distance-lane"
    / "paused_projected_current_source_survivors_162_20260729"
)

PINNED_SOURCE_COUNT = 163
PINNED_SOURCE_SHA256 = (
    "2945c37c3cabcb55cf59044db95ac6189cb5bfb3daf8bd9e6e5d6040dda47972"
)
PINNED_SOURCE_CHAIN_HEAD_SHA256 = (
    "17802f871c31c8cace373014a6842c19e417931f1cf7efb7da01ec3ac77ee012"
)
PINNED_EXCLUDED_ROWS_SHA256 = (
    "d6db6d91d18e0e8ca9efe6941711375be4f3849d21adc4bcfc6c6806afd5ed5e"
)
PINNED_EXCLUDED_ASSIGNMENT_SHA256 = (
    "b94b7af57711da12c4f0f55b01c16717a6185d4538687b4e42969cb5a6f0d1b5"
)
PINNED_EXCLUDED_TEMPLATE_NAME = (
    "system-01-d6db6d91d18e-real-distinctness"
)
OUTPUT_COUNT = 162
OUTPUT_TRUST = (
    "order-independent detector returned none; not Euclidean or P97-realizable"
)


class MaterializationError(RuntimeError):
    """A pinned-input, current-replay, or immutable-publication failure."""


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, allow_nan=False, separators=(",", ":"), sort_keys=True
    ).encode("utf-8")


def _sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def _sha256_value(value: Any) -> str:
    return _sha256_bytes(_canonical_bytes(value))


def _sha256_file(path: Path) -> str:
    return _sha256_bytes(path.read_bytes())


def _dependency_hashes() -> dict[str, str]:
    """Hash every current detector dependency plus metric-ingress dependencies."""

    hashes = structural._dependency_hashes()
    for relative in metric_driver.SOURCE_DEPENDENCIES:
        hashes[relative] = _sha256_file(ROOT / relative)
    hashes[
        str(Path(metric_driver.__file__).resolve().relative_to(ROOT))
    ] = _sha256_file(Path(metric_driver.__file__).resolve())
    return dict(sorted(hashes.items()))


def _template_artifact_hashes() -> dict[str, str]:
    hashes: dict[str, str] = {}
    for directory in structural.DEFAULT_ALGEBRAIC_BOOTSTRAPS:
        resolved = directory.resolve()
        if not resolved.is_dir():
            raise MaterializationError(
                f"missing current algebraic template bank: {resolved}"
            )
        for path in sorted(candidate for candidate in resolved.rglob("*") if candidate.is_file()):
            hashes[str(path.relative_to(ROOT))] = _sha256_file(path)
    return hashes


def _validate_source_record(
    record: Mapping[str, Any],
    *,
    source_index: int,
    previous_record_sha256: str | None,
    encoding: Any,
) -> tuple[Mapping[int, bool], Any, tuple[Any, ...]]:
    where = f"{SOURCE_PATH}:{source_index + 1}"
    structural._validate_record_hash(
        record, previous_record_sha256, where=where
    )
    if (
        record.get("schema") != structural.SURVIVOR_SCHEMA
        or record.get("index") != source_index
        or record.get("classification") != "STRUCTURALLY_UNRESOLVED"
    ):
        raise MaterializationError(f"{where}: source survivor identity mismatch")
    if type(record.get("raw_sat_index")) is not int or record["raw_sat_index"] < 0:
        raise MaterializationError(f"{where}: invalid raw SAT index")

    assignment = encoding.assignment_from_record(record)
    decoded = encoding.decode(assignment)
    encoding.validate(decoded, assignment)
    semantic = encoding.semantic_record(assignment)
    rows = structural._metric_rows(decoded)
    rows_json = [row.as_dict() for row in rows]
    blocking_clause = list(encoding.blocking_clause(assignment))
    structural._clause_false(blocking_clause, assignment)
    if (
        record.get("semantic_assignment") != semantic
        or record.get("assignment_sha256")
        != structural._assignment_hash(encoding, assignment)
        or record.get("metric_rows") != rows_json
        or record.get("metric_rows_sha256") != _sha256_value(rows_json)
        or record.get("blocking_clause") != blocking_clause
    ):
        raise MaterializationError(f"{where}: assignment/row provenance drift")
    return assignment, decoded, rows


def _structural_no_hit(decoded: Any, rows: Sequence[Any]) -> dict[str, Any]:
    checks = {
        "order_independent": structural._detection(rows),
        "five_point_cap_order": structural._cap_order_certificate(decoded, rows),
        "rhombus_cap_order": structural._rhombus_cap_order_certificate(decoded, rows),
        "kalmanson_cap_order": structural._kalmanson_cap_order_certificate(
            decoded, rows
        ),
    }
    hits = [name for name, result in checks.items() if result is not None]
    if hits:
        raise MaterializationError(
            "old survivor is detected by current structural/cap-order logic: "
            + ", ".join(hits)
        )
    return {name: None for name in checks}


def _output_record(
    *,
    output_index: int,
    source_record: Mapping[str, Any],
    assignment: Mapping[int, bool],
    rows: Sequence[Any],
    encoding: Any,
    previous_record_sha256: str | None,
) -> dict[str, Any]:
    rows_json = [row.as_dict() for row in rows]
    unsigned = {
        "schema": structural.SURVIVOR_SCHEMA,
        "index": output_index,
        "raw_sat_index": int(source_record["raw_sat_index"]),
        "classification": "STRUCTURALLY_UNRESOLVED",
        "semantic_assignment": encoding.semantic_record(assignment),
        "assignment_sha256": structural._assignment_hash(encoding, assignment),
        "metric_rows": rows_json,
        "metric_rows_sha256": _sha256_value(rows_json),
        "blocking_clause": list(encoding.blocking_clause(assignment)),
        "trust": OUTPUT_TRUST,
    }
    return structural._with_record_hash(unsigned, previous_record_sha256)


def _write_exclusive(path: Path, data: bytes) -> None:
    descriptor = os.open(path, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o444)
    try:
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(data)
            handle.flush()
            os.fsync(handle.fileno())
    except BaseException:
        try:
            path.unlink()
        except OSError:
            pass
        raise


def _strict_manifest(path: Path) -> dict[str, Any]:
    manifest = metric_driver._strict_json(path)
    claimed = manifest.get("manifest_sha256")
    unsigned = dict(manifest)
    unsigned.pop("manifest_sha256", None)
    if claimed != _sha256_value(unsigned):
        raise MaterializationError("live manifest canonical hash does not replay")
    return manifest


def verify_existing() -> dict[str, Any]:
    """Verify the published snapshot without changing it."""

    manifest = _strict_manifest(OUTPUT_DIR / "live-manifest.json")
    artifacts = manifest.get("artifact_hashes")
    if not isinstance(artifacts, dict):
        raise MaterializationError("live manifest lacks artifact hashes")
    for name, expected in artifacts.items():
        if (
            not isinstance(name, str)
            or not isinstance(expected, str)
            or _sha256_file(OUTPUT_DIR / name) != expected
        ):
            raise MaterializationError(f"artifact hash mismatch: {name!r}")
    metric_driver.load_source(
        OUTPUT_DIR, expected_count=OUTPUT_COUNT, running_snapshot=True
    )
    return manifest


def materialize() -> dict[str, Any]:
    """Replay pinned old records and atomically publish the current-source subset."""

    if OUTPUT_DIR.exists():
        raise MaterializationError(
            f"refusing to overwrite immutable output directory: {OUTPUT_DIR}"
        )
    source_bytes = SOURCE_PATH.read_bytes()
    if _sha256_bytes(source_bytes) != PINNED_SOURCE_SHA256:
        raise MaterializationError("paused source survivor file hash mismatch")
    source_records = metric_driver._strict_jsonl(SOURCE_PATH)
    if len(source_records) != PINNED_SOURCE_COUNT:
        raise MaterializationError("paused source survivor count mismatch")
    if source_records[-1].get("record_sha256") != PINNED_SOURCE_CHAIN_HEAD_SHA256:
        raise MaterializationError("paused source chain head mismatch")

    initial_dependencies = _dependency_hashes()
    initial_template_artifacts = _template_artifact_hashes()
    templates, template_summary = structural._load_algebraic_templates(
        structural.DEFAULT_ALGEBRAIC_BOOTSTRAPS
    )

    encoding = structural.sat.SatEncoding(
        structural.CELL, cap=True, blocker=True
    )
    output_records: list[dict[str, Any]] = []
    retained_source_indices: list[int] = []
    exclusion: dict[str, Any] | None = None
    previous_source: str | None = None
    previous_output: str | None = None
    raw_sat_indices: set[int] = set()

    for source_index, source_record in enumerate(source_records):
        assignment, decoded, rows = _validate_source_record(
            source_record,
            source_index=source_index,
            previous_record_sha256=previous_source,
            encoding=encoding,
        )
        previous_source = str(source_record["record_sha256"])
        raw_sat_index = int(source_record["raw_sat_index"])
        if raw_sat_index in raw_sat_indices:
            raise MaterializationError("paused source repeats a raw SAT index")
        raw_sat_indices.add(raw_sat_index)
        _structural_no_hit(decoded, rows)
        match = structural._find_algebraic_match(
            encoding, assignment, templates
        )
        if match is not None:
            template, permutation, mapped = match
            if exclusion is not None:
                raise MaterializationError("more than one current algebraic hit")
            exclusion = {
                "source_index": source_index,
                "raw_sat_index": raw_sat_index,
                "source_record_sha256": source_record["record_sha256"],
                "assignment_sha256": source_record["assignment_sha256"],
                "metric_rows_sha256": source_record["metric_rows_sha256"],
                "certificate_kind": template["certificate_kind"],
                "template_name": template["name"],
                "template_sha256": template["template_sha256"],
                "permutation": list(permutation),
                "mapped_antecedent_memberships": [
                    list(pair) for pair in mapped
                ],
                "classification": "CURRENT_ALGEBRAIC_TEMPLATE_HIT_EXCLUDED",
            }
            continue

        output_index = len(output_records)
        output_record = _output_record(
            output_index=output_index,
            source_record=source_record,
            assignment=assignment,
            rows=rows,
            encoding=encoding,
            previous_record_sha256=previous_output,
        )
        output_records.append(output_record)
        retained_source_indices.append(source_index)
        previous_output = str(output_record["record_sha256"])

    if len(output_records) != OUTPUT_COUNT or exclusion is None:
        raise MaterializationError(
            "current reclassification did not produce exactly 162 survivors "
            "and one algebraic exclusion"
        )
    if (
        exclusion["source_index"] != 0
        or exclusion["assignment_sha256"] != PINNED_EXCLUDED_ASSIGNMENT_SHA256
        or exclusion["metric_rows_sha256"] != PINNED_EXCLUDED_ROWS_SHA256
        or exclusion["template_name"] != PINNED_EXCLUDED_TEMPLATE_NAME
        or exclusion["certificate_kind"]
        != structural.REAL_DISTINCTNESS_CONTRADICTION_KIND
    ):
        raise MaterializationError("the unique current algebraic hit is not pinned")

    final_dependencies = _dependency_hashes()
    final_template_artifacts = _template_artifact_hashes()
    if initial_dependencies != final_dependencies:
        raise MaterializationError("current detector dependencies changed during replay")
    if initial_template_artifacts != final_template_artifacts:
        raise MaterializationError("current algebraic templates changed during replay")
    if SOURCE_PATH.read_bytes() != source_bytes:
        raise MaterializationError("paused source journal changed during replay")

    survivors_bytes = b"".join(
        _canonical_bytes(record) + b"\n" for record in output_records
    )
    provenance_unsigned = {
        "schema": "p97-phase3-current-source-reclassification-v1",
        "source": {
            "directory": str(SOURCE_DIR.resolve()),
            "survivors_count": PINNED_SOURCE_COUNT,
            "survivors_sha256": PINNED_SOURCE_SHA256,
            "record_chain_head_sha256": PINNED_SOURCE_CHAIN_HEAD_SHA256,
        },
        "retained_source_indices": retained_source_indices,
        "excluded": exclusion,
        "current_structural_checks": {
            "order_independent": "NO_HIT_FOR_ALL_163",
            "five_point_cap_order": "NO_HIT_FOR_ALL_163",
            "rhombus_cap_order": "NO_HIT_FOR_ALL_163",
            "kalmanson_cap_order": "NO_HIT_FOR_ALL_163",
        },
        "current_algebraic_templates": template_summary,
        "current_algebraic_template_artifact_sha256": initial_template_artifacts,
        "current_dependency_sha256": initial_dependencies,
        "result": {
            "retained_count": len(output_records),
            "excluded_count": 1,
            "output_record_chain_head_sha256": previous_output,
        },
        "trust": {
            "scope": (
                "partial reclassification of one pinned paused journal only; "
                "not an exhaustive continuation or terminal search result"
            ),
            "structural_no_hit": (
                "current bounded detectors returned none; incompleteness means "
                "this is not a geometric existence claim"
            ),
            "algebraic_exclusion": (
                "current replayed real-distinctness certificate excludes one "
                "row system assuming Problem 97 pairwise distinct points; not "
                "Lean or kernel-checked closure"
            ),
            "lean": "NOT_LANDED",
        },
    }
    provenance = {
        **provenance_unsigned,
        "provenance_sha256": _sha256_value(provenance_unsigned),
    }
    provenance_bytes = json.dumps(
        provenance, indent=2, sort_keys=True, allow_nan=False
    ).encode() + b"\n"

    dependency_for_ingress = {
        relative: initial_dependencies[relative]
        for relative in metric_driver.SOURCE_DEPENDENCIES
    }
    unsigned_manifest = {
        "schema": structural.SCHEMA,
        "status": "RUNNING",
        "configuration": {
            "cell": {
                "k": structural.CELL.k,
                "n": structural.CELL.n,
                "profile": list(structural.CELL.profile),
                "exact": structural.CELL.exact,
            },
            "mode": "cap+blocker-annotated",
            "dependency_sha256": dependency_for_ingress,
            "snapshot_scope": (
                "immutable current-source partial reclassification of the "
                "pinned paused projected journal"
            ),
        },
        "counts": {
            "source_paused_survivor_count": PINNED_SOURCE_COUNT,
            "current_algebraic_excluded_count": 1,
            "structural_survivor_count": len(output_records),
            "unclassified_raw_sat_count": None,
        },
        "artifact_hashes": {
            "survivors.jsonl": _sha256_bytes(survivors_bytes),
            "reclassification-provenance.json": _sha256_bytes(provenance_bytes),
        },
        "record_chain_head_sha256": previous_output,
        "reclassification": {
            "source_survivors_sha256": PINNED_SOURCE_SHA256,
            "source_record_chain_head_sha256": PINNED_SOURCE_CHAIN_HEAD_SHA256,
            "provenance_sha256": provenance["provenance_sha256"],
            "excluded": exclusion,
        },
        "result_claim": (
            "exactly 162 records from the pinned 163-record paused journal "
            "remain unmatched by the current structural/cap-order detectors "
            "and current algebraic templates; this is partial reclassification, "
            "not exhaustive Phase-3 coverage and not terminal"
        ),
        "trust_boundary": provenance["trust"],
    }
    manifest = {
        **unsigned_manifest,
        "manifest_sha256": _sha256_value(unsigned_manifest),
    }
    manifest_bytes = json.dumps(
        manifest, indent=2, sort_keys=True, allow_nan=False
    ).encode() + b"\n"

    staging = OUTPUT_DIR.with_name(f".{OUTPUT_DIR.name}.building-{os.getpid()}")
    if staging.exists():
        raise MaterializationError(f"staging directory already exists: {staging}")
    staging.mkdir(mode=0o555)
    try:
        _write_exclusive(staging / "survivors.jsonl", survivors_bytes)
        _write_exclusive(
            staging / "reclassification-provenance.json", provenance_bytes
        )
        _write_exclusive(staging / "live-manifest.json", manifest_bytes)
        os.replace(staging, OUTPUT_DIR)
    except BaseException:
        # Leave any failed staging directory intact for forensic inspection.
        raise

    return verify_existing()


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--verify-existing",
        action="store_true",
        help="verify the immutable published snapshot without writing",
    )
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    try:
        manifest = verify_existing() if args.verify_existing else materialize()
    except (OSError, ValueError, structural.StructuralCegarError, MaterializationError) as exc:
        print(f"current-source snapshot materializer failed: {exc}")
        return 2
    print(
        json.dumps(
            {
                "output": str(OUTPUT_DIR),
                "survivor_count": manifest["counts"]["structural_survivor_count"],
                "survivors_sha256": manifest["artifact_hashes"]["survivors.jsonl"],
                "record_chain_head_sha256": manifest[
                    "record_chain_head_sha256"
                ],
                "manifest_sha256": manifest["manifest_sha256"],
                "status": manifest["status"],
                "scope": manifest["configuration"]["snapshot_scope"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
