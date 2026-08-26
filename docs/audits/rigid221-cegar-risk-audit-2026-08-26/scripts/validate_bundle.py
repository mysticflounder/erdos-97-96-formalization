#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Authors: Adam McKenna
"""Validate the Rigid221 risk-audit bundle without invoking Lean or solvers."""

from __future__ import annotations

import csv
import hashlib
import json
import sys
from collections.abc import Iterable
from pathlib import Path
from typing import Any

SCRIPT = Path(__file__).resolve()
REPO = SCRIPT.parents[4]
BUNDLE = SCRIPT.parents[1]

REQUIRED = {
    "REPORT.md", "EXECUTIVE-SUMMARY.md", "README.md", "run_inventory.csv",
    "predicate_crosswalk.csv", "model_features.csv", "canonical_models.jsonl",
    "symmetry_and_canonicalization.md", "containment_extension_dag.csv",
    "refinement_effects.csv", "unsat_cores_or_ablations.jsonl",
    "survivor_family_history.md", "candidate_lemmas.md", "evidence_manifest.csv",
    "representative-models/README.md", "scripts/build_bundle.py",
    "scripts/validate_bundle.py", "SHA256SUMS",
}

CONSTRAINT_LEVELS = {
    "INCIDENCE_ONLY", "INCIDENCE_PLUS_ORDER", "SOURCE_FAITHFUL_FINITE",
    "METRIC_PARTIAL", "FULL_EUCLIDEAN_PACKET", "UNKNOWN_OR_UNAUDITED",
}

CROSSWALK_STATUSES = {
    "EXACT", "WEAKER_THAN_LEAN", "STRONGER_THAN_LEAN", "DERIVED_FROM_LEAN",
    "MISSING_FROM_ENCODING", "NO_CURRENT_LEAN_PRODUCER", "INCOMPARABLE", "UNAUDITED",
}


def fail(message: str) -> None:
    raise AssertionError(message)


def digest(path: Path) -> str:
    value = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            value.update(chunk)
    return value.hexdigest()


def csv_rows(name: str) -> list[dict[str, str]]:
    with (BUNDLE / name).open(encoding="utf-8", newline="") as handle:
        return list(csv.DictReader(handle))


def jsonl(name: str) -> list[dict[str, Any]]:
    result = []
    with (BUNDLE / name).open(encoding="utf-8") as handle:
        for number, line in enumerate(handle, start=1):
            try:
                value = json.loads(line)
            except json.JSONDecodeError as error:
                fail(f"{name}:{number}: {error}")
            if not isinstance(value, dict):
                fail(f"{name}:{number}: expected object")
            result.append(value)
    return result


def require_fields(rows: Iterable[dict[str, Any]], fields: set[str], label: str) -> None:
    for number, row in enumerate(rows, start=1):
        missing = fields - set(row)
        if missing:
            fail(f"{label} row {number} missing {sorted(missing)}")


def validate_files() -> None:
    actual = {
        path.relative_to(BUNDLE).as_posix()
        for path in BUNDLE.rglob("*") if path.is_file()
    }
    missing = REQUIRED - actual
    if missing:
        fail(f"required files missing: {sorted(missing)}")


def validate_models() -> tuple[list[dict[str, Any]], set[str]]:
    models = jsonl("canonical_models.jsonl")
    if len(models) != 255:
        fail(f"expected 255 canonical records, got {len(models)}")
    require_fields(
        models,
        {
            "schema", "model_id", "lane", "scope_n", "constraint_level",
            "semantic_level", "canonicalization_group", "provenance_paths",
            "provenance_sha256", "assignment", "full_source_faithful_model",
        },
        "canonical model",
    )
    ids = [model["model_id"] for model in models]
    if len(ids) != len(set(ids)):
        fail("canonical model IDs are not unique")
    for model in models:
        if model["schema"] != "rigid221-cegar-risk-audit.canonical-model.v1":
            fail(f"bad canonical schema: {model['model_id']}")
        if model["canonicalization_group"] != "IDENTITY_ON_ALL_STORED_LABELS":
            fail(f"non-identity canonicalization: {model['model_id']}")
        if model["full_source_faithful_model"] is not False:
            fail(f"record improperly promoted to full packet: {model['model_id']}")
        if model["constraint_level"] not in CONSTRAINT_LEVELS:
            fail(f"bad constraint level: {model['model_id']}")
        paths = model["provenance_paths"]
        hashes = model["provenance_sha256"]
        if len(paths) != len(hashes) or not paths:
            fail(f"bad provenance arrays: {model['model_id']}")
        for path_text, expected in zip(paths, hashes):
            path = REPO / path_text
            if not path.is_file() or digest(path) != expected:
                fail(f"bad model provenance hash: {model['model_id']} {path_text}")
        assignment = model["assignment"]
        carrier = assignment.get("carrier")
        rows = assignment.get("rows")
        if not isinstance(carrier, list) or len(carrier) != model["scope_n"]:
            fail(f"bad carrier: {model['model_id']}")
        if not isinstance(rows, list) or len(rows) != model["scope_n"]:
            fail(f"bad row count: {model['model_id']}")
        centers = [row.get("center") for row in rows]
        if sorted(centers) != list(range(model["scope_n"])):
            fail(f"bad row centers: {model['model_id']}")
        for row in rows:
            support = row.get("support")
            if not isinstance(support, list) or len(support) != 4:
                fail(f"bad support size: {model['model_id']} center={row.get('center')}")
            if len(support) != len(set(support)) or row["center"] in support:
                fail(f"bad support semantics: {model['model_id']} center={row['center']}")

    shadows = [model for model in models if model["semantic_level"] == "ROW_ORDER_SHADOW"]
    decoded = [
        model for model in models
        if model["semantic_level"] == "DECODED_BOOLEAN_ROW_ASSIGNMENT"
    ]
    if len(shadows) != 251 or sum(model["raw_artifact_multiplicity"] for model in shadows) != 286:
        fail("EX17 analysis census mismatch")
    if len(decoded) != 2 or any(model["scope_n"] != 17 for model in decoded):
        fail("decoded EX17 census mismatch")
    return models, set(ids)


def validate_tables(model_ids: set[str]) -> None:
    runs = csv_rows("run_inventory.csv")
    if len(runs) != 28:
        fail(f"expected 28 run rows, got {len(runs)}")
    require_fields(
        runs,
        {
            "run_id", "lane", "source_head", "artifact_path", "encoding_version",
            "solver_and_version", "scope_n", "cap_profile", "fixed_named_roles",
            "constraint_level", "SAT_UNSAT_UNKNOWN_TIMEOUT", "raw_model_count",
            "canonical_model_count", "proof_or_core_available", "seed", "timeout",
            "elapsed", "input_sha256", "output_sha256", "notes",
        },
        "run inventory",
    )
    bad_levels = {row["constraint_level"] for row in runs} - CONSTRAINT_LEVELS
    if bad_levels:
        fail(f"bad run constraint levels: {sorted(bad_levels)}")

    crosswalk = csv_rows("predicate_crosswalk.csv")
    if len(crosswalk) != 16:
        fail(f"expected 16 crosswalk rows, got {len(crosswalk)}")
    bad_statuses = {row["status"] for row in crosswalk} - CROSSWALK_STATUSES
    if bad_statuses:
        fail(f"bad crosswalk statuses: {sorted(bad_statuses)}")
    required_predicates = {
        "source_identity", "actual_blocker_provenance", "canonical_row_identity",
        "radius_equality_classes", "cap_location", "cyclic_order", "row_omissions",
        "prescribed_deletion", "deletion_survival", "center_not_in_support",
        "strict_convexity_general_position", "minimality_and_global_k4",
    }
    present = {row["predicate_id"] for row in crosswalk}
    if not required_predicates <= present:
        fail(f"crosswalk coverage missing: {sorted(required_predicates - present)}")

    features = csv_rows("model_features.csv")
    if len(features) != 255:
        fail(f"expected 255 feature rows, got {len(features)}")
    feature_ids = {row["model_id"] for row in features}
    if feature_ids != model_ids:
        fail("feature/model ID sets differ")

    dag = csv_rows("containment_extension_dag.csv")
    if len(dag) != 6:
        fail(f"expected 6 containment rows, got {len(dag)}")
    if any(row["full_packet_preserving"] != "NO" for row in dag):
        fail("unexpected full-packet containment edge")

    refinements = csv_rows("refinement_effects.csv")
    if len(refinements) != 10:
        fail(f"expected 10 refinement rows, got {len(refinements)}")

    unsat = jsonl("unsat_cores_or_ablations.jsonl")
    if len(unsat) != 4:
        fail(f"expected 4 UNSAT/ablation records, got {len(unsat)}")
    if any(row.get("schema") != "rigid221-cegar-risk-audit.unsat-or-ablation.v1" for row in unsat):
        fail("bad UNSAT/ablation schema")


def validate_evidence() -> None:
    rows = csv_rows("evidence_manifest.csv")
    if len(rows) < 300:
        fail(f"unexpectedly small evidence manifest: {len(rows)}")
    seen: set[str] = set()
    for row in rows:
        path_text = row["artifact_path"]
        if path_text in seen:
            fail(f"duplicate evidence path: {path_text}")
        seen.add(path_text)
        path = REPO / path_text
        if not path.is_file():
            fail(f"missing evidence path: {path_text}")
        if str(path.stat().st_size) != row["bytes"]:
            fail(f"evidence size mismatch: {path_text}")
        if digest(path) != row["sha256"]:
            fail(f"evidence hash mismatch: {path_text}")


def validate_narrative() -> None:
    executive = (BUNDLE / "EXECUTIVE-SUMMARY.md").read_text(encoding="utf-8")
    report = (BUNDLE / "REPORT.md").read_text(encoding="utf-8")
    for verdict in (
        "CROSS_CARDINALITY_EVIDENCE_INSUFFICIENT",
        "ENCODING_TOO_WEAK",
        "ONLY_RELAXED_SURVIVORS_FOUND",
    ):
        if verdict not in executive or verdict not in report:
            fail(f"missing verdict: {verdict}")
    if "SUPPORTS_SCALABLE_INVARIANT" in executive or "SUPPORTS_BOUNDED_OBSTRUCTION" in executive:
        fail("executive summary contains unsupported positive verdict")
    if report.count("## ") < 13:
        fail("report section count is unexpectedly small")


def validate_checksums() -> None:
    expected_paths = {
        path.relative_to(BUNDLE).as_posix()
        for path in BUNDLE.rglob("*")
        if path.is_file() and path.name != "SHA256SUMS"
    }
    recorded: dict[str, str] = {}
    with (BUNDLE / "SHA256SUMS").open(encoding="utf-8") as handle:
        for number, line in enumerate(handle, start=1):
            digest_text, separator, path_text = line.rstrip("\n").partition("  ")
            if not separator or len(digest_text) != 64:
                fail(f"bad SHA256SUMS line {number}")
            if path_text in recorded:
                fail(f"duplicate SHA256SUMS path: {path_text}")
            recorded[path_text] = digest_text
    if set(recorded) != expected_paths:
        fail(
            "SHA256SUMS path set mismatch: "
            f"missing={sorted(expected_paths - set(recorded))} "
            f"extra={sorted(set(recorded) - expected_paths)}"
        )
    for path_text, expected in recorded.items():
        if digest(BUNDLE / path_text) != expected:
            fail(f"bundle checksum mismatch: {path_text}")


def main() -> None:
    validate_files()
    _, model_ids = validate_models()
    validate_tables(model_ids)
    validate_evidence()
    validate_narrative()
    validate_checksums()
    print("PASS: 255 models, 28 waves, 16 predicates, 300+ evidence hashes, all bundle digests")


if __name__ == "__main__":
    try:
        main()
    except AssertionError as error:
        print(f"FAIL: {error}", file=sys.stderr)
        raise SystemExit(1)
