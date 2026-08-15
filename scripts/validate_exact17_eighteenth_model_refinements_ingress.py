"""Fail-closed PIQD ingress for the exact-17 nineteenth child."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

from validate_exact17_sixteenth_model_refinements_ingress import (
    check_hash,
    check_named_hash,
    checked_path,
    load_json,
    load_module,
    require,
    sha256,
)

SCHEMA = "p97-exact17-lean-eighteenth-model-refinements-piqd-ingress/v1"
DAEMON_SHA256 = "0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360"
ROOT_SHA256 = "534ae4fb643f76f5cdf7cecdd6ee984fb41da3dc76da202e082075d3d82c3db2"
PARENT_ROOT_SHA256 = "40497f4c54505f66071aa7006040843d16592136d64b0a0508d895b11860577a"
ROOT_BYTES = 291_571_750
VARIABLES = 308
ROOT_CLAUSES = 5_846_164
PARENT_CLAUSES = 5_846_160
NEW_CLAUSES = 4
EXPECTED_SOURCE_PATHS = (
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenEighteenthModelRefinements.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenEighteenthModelRefinementsExport.lean",
)


def validate(repo: Path, manifest_path: Path) -> dict[str, Any]:
    manifest = load_json(manifest_path)
    require(
        set(manifest)
        == {"schema", "dimacs", "parent_ingress", "lean", "validation", "piqd"},
        "wrong manifest fields",
    )
    require(manifest["schema"] == SCHEMA, "wrong ingress schema")

    root_record = manifest["dimacs"]
    require(root_record["sha256"] == ROOT_SHA256, "unauthorized DIMACS root")
    require(root_record["bytes"] == ROOT_BYTES, "wrong DIMACS byte count")
    require(root_record["variables"] == VARIABLES, "wrong variable count")
    require(root_record["clauses"] == ROOT_CLAUSES, "wrong clause count")
    require(root_record["parent_prefix_clauses"] == PARENT_CLAUSES, "wrong parent count")
    require(root_record["checked_new_clauses"] == NEW_CLAUSES, "wrong suffix count")
    root = check_hash(repo, root_record)
    require(root.stat().st_size == ROOT_BYTES, "DIMACS size drift")

    parent_ingress = manifest["parent_ingress"]
    parent_manifest_path = check_named_hash(repo, parent_ingress, "manifest")
    parent_validator = check_named_hash(repo, parent_ingress, "validator")
    parent_report_path = check_named_hash(repo, parent_ingress, "report")
    parent_result = load_module(
        parent_validator, "exact17_seventeenth_model_refinements_ingress"
    ).validate(repo, parent_manifest_path)
    require(parent_result == load_json(parent_report_path), "parent ingress report drift")
    require(parent_result["status"] == "PASS", "parent ingress did not pass")
    require(parent_result["dimacs_sha256"] == PARENT_ROOT_SHA256, "wrong parent root")

    parent_manifest = load_json(parent_manifest_path)
    parent_root = check_hash(repo, parent_manifest["dimacs"])

    lean = manifest["lean"]
    require(lean["toolchain"] == "leanprover/lean4:v4.27.0", "wrong Lean toolchain")
    require(
        sha256(checked_path(repo, "lean-toolchain")) == lean["toolchain_file_sha256"],
        "lean-toolchain drift",
    )
    require(
        sha256(checked_path(repo, "lean/lake-manifest.json"))
        == lean["lake_manifest_sha256"],
        "lake manifest drift",
    )
    sources = lean["source_files"]
    require(tuple(item["path"] for item in sources) == EXPECTED_SOURCE_PATHS, "wrong Lean source set")
    for source in sources:
        check_hash(repo, source)

    validation = manifest["validation"]
    validator = check_named_hash(repo, validation, "script")
    model = check_named_hash(repo, validation, "model")
    report = check_named_hash(repo, validation, "report")
    regenerated = load_module(
        validator, "exact17_eighteenth_model_refinements_export"
    ).validate(parent_root, root, model)
    require(regenerated == load_json(report), "semantic validation report drift")
    require(regenerated["variables"] == VARIABLES, "validator variable mismatch")
    require(regenerated["clauses"] == ROOT_CLAUSES, "validator clause mismatch")
    require(regenerated["new_clauses"] == NEW_CLAUSES, "validator suffix mismatch")
    require(regenerated["parent_prefix_byte_identical"] is True, "prefix mismatch")
    cuts = regenerated["motivating_model_cut_clauses"]
    require(bool(cuts), "motivating model was not cut")
    require(validation["parent_prefix_byte_identical"] is True, "prefix claim missing")
    require(
        validation["all_new_clauses_independently_regenerated"] is True,
        "regeneration claim missing",
    )
    require(
        validation["motivating_model_cut_by_cancellation_orbit"] is True,
        "model-cut claim missing",
    )

    piqd = manifest["piqd"]
    require(piqd["daemon_protocol_version"] == 1, "wrong PIQD protocol")
    require(piqd["daemon_sha256"] == DAEMON_SHA256, "unauthorized PIQD daemon")
    require(piqd["ingress"] == "raw-dimacs/v1", "wrong PIQD ingress")
    require(piqd["backend"] == "cadical", "wrong PIQD backend")
    require(piqd["solver_profile"] == "sat", "wrong solver profile")
    require(piqd["immutable_root_only"] is True, "mutable root forbidden")
    require(
        piqd["python_authored_successor_clause_allowed"] is False,
        "Python clauses forbidden",
    )

    return {
        "schema": "p97-exact17-lean-eighteenth-model-refinements-piqd-ingress-validation/v1",
        "manifest_sha256": sha256(manifest_path),
        "dimacs_sha256": sha256(root),
        "dimacs_bytes": root.stat().st_size,
        "variables": VARIABLES,
        "clauses": ROOT_CLAUSES,
        "new_clauses": NEW_CLAUSES,
        "parent_ingress_status": parent_result["status"],
        "motivating_model_cut_clauses": cuts,
        "piqd_daemon_sha256": DAEMON_SHA256,
        "status": "PASS",
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    payload = validate(args.repo.resolve(), args.manifest.resolve())
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.report is not None:
        args.report.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
