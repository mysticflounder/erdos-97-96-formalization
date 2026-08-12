"""Fail-closed PIQD ingress for the exact-17 twentieth child.

The successor root and daemon digest are intentionally placeholders until the
export is authenticated.  The main agent must replace only those marked
fields after export; all parent, source, and semantic checks remain live.
"""

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

SCHEMA = "p97-exact17-lean-twentieth-model-refinements-piqd-ingress/v1"
# MAIN AGENT FILL AFTER EXPORT: authenticated daemon digest.
DAEMON_SHA256 = "fa66c08a9f341bb03ce1c39d32737f6b5bb91efe31d6a55f86f903caf207383c"
# MAIN AGENT FILL AFTER EXPORT: successor root digest and byte count.
ROOT_SHA256 = "bc42cd2756d6b3d84c5eb265762bc346a893dbdbc01bbe8ac5dbcb2f53f89720"
ROOT_BYTES: int | None = 291_573_600
PARENT_ROOT_SHA256 = "e719b8c17edf85e089d859fbc1ab8aaa43d8a6e9514f32eb4a76842a665dd3ce"
ROOT_PATH = "scratch/exact17-lean-to-sat/exact17-twenty-first-root-twentieth-model-refinements.cnf"
PARENT_INGRESS_PATH = "scratch/exact17-lean-to-sat/piqd-ingress-manifest-nineteenth-model-refinements.json"
VARIABLES = 308
PARENT_CLAUSES = 5_846_188
NEW_CLAUSES = 12
ROOT_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES
EXPECTED_SOURCE_PATHS = (
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenTwentiethModelRefinements.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenTwentiethModelRefinementsExport.lean",
)


def validate(repo: Path, manifest_path: Path) -> dict[str, Any]:
    manifest = load_json(manifest_path)
    require(set(manifest) == {"schema", "dimacs", "parent_ingress", "lean", "validation", "piqd"},
            "wrong manifest fields")
    require(manifest["schema"] == SCHEMA, "wrong ingress schema")
    require(ROOT_BYTES is not None and not ROOT_SHA256.startswith("__FILL_"),
            "ROOT_SHA256/ROOT_BYTES are placeholders: fill after export")

    root_record = manifest["dimacs"]
    require(root_record["path"] == ROOT_PATH, "wrong DIMACS root path")
    require(root_record["sha256"] == ROOT_SHA256, "unauthorized DIMACS root")
    require(root_record["bytes"] == ROOT_BYTES, "wrong DIMACS byte count")
    require(root_record["variables"] == VARIABLES, "wrong variable count")
    require(root_record["clauses"] == ROOT_CLAUSES, "wrong clause count")
    require(root_record["parent_prefix_clauses"] == PARENT_CLAUSES, "wrong parent count")
    require(root_record["checked_new_clauses"] == NEW_CLAUSES, "wrong suffix count")
    root = check_hash(repo, root_record)
    require(root.stat().st_size == ROOT_BYTES, "DIMACS size drift")

    parent_ingress = manifest["parent_ingress"]
    require(parent_ingress["manifest"] == PARENT_INGRESS_PATH, "wrong parent ingress path")
    parent_manifest_path = check_named_hash(repo, parent_ingress, "manifest")
    parent_validator = check_named_hash(repo, parent_ingress, "validator")
    parent_report_path = check_named_hash(repo, parent_ingress, "report")
    parent_result = load_module(parent_validator, "exact17_nineteenth_model_refinements_ingress").validate(
        repo, parent_manifest_path
    )
    require(parent_result == load_json(parent_report_path), "parent ingress report drift")
    require(parent_result["status"] == "PASS", "parent ingress did not pass")
    require(parent_result["dimacs_sha256"] == PARENT_ROOT_SHA256, "wrong parent root")
    parent_manifest = load_json(parent_manifest_path)
    parent_root = check_hash(repo, parent_manifest["dimacs"])

    lean = manifest["lean"]
    require(lean["toolchain"] == "leanprover/lean4:v4.27.0", "wrong Lean toolchain")
    require(sha256(checked_path(repo, "lean-toolchain")) == lean["toolchain_file_sha256"], "lean-toolchain drift")
    require(sha256(checked_path(repo, "lean/lake-manifest.json")) == lean["lake_manifest_sha256"], "lake manifest drift")
    sources = lean["source_files"]
    require(tuple(item["path"] for item in sources) == EXPECTED_SOURCE_PATHS, "wrong Lean source set")
    for source in sources:
        check_hash(repo, source)

    validation = manifest["validation"]
    validator = check_named_hash(repo, validation, "script")
    model = check_named_hash(repo, validation, "model")
    report = check_named_hash(repo, validation, "report")
    regenerated = load_module(validator, "exact17_twentieth_model_refinements_export").validate(
        parent_root, root, model
    )
    require(regenerated == load_json(report), "semantic validation report drift")
    require(regenerated["variables"] == VARIABLES and regenerated["clauses"] == ROOT_CLAUSES,
            "validator dimensions mismatch")
    require(regenerated["new_clauses"] == NEW_CLAUSES, "validator suffix mismatch")
    require(regenerated["parent_prefix_byte_identical"] is True, "prefix mismatch")
    cuts = regenerated["motivating_model_cut_clauses"]
    require(all(cuts.get(name) for name in ("bisector", "convex_five", "cancellation")),
            "not every twentieth motif cuts the authenticated model")
    require(all(regenerated["canonical_records_rejected"].values()),
            "not all four canonical records were rejected")
    require(validation["parent_prefix_byte_identical"] is True, "prefix claim missing")
    require(validation["all_new_clauses_independently_regenerated"] is True, "regeneration claim missing")
    require(validation["motivating_model_cut_by_all_three_orbits"] is True, "model-cut claim missing")
    require(validation["all_four_canonical_records_rejected"] is True, "canonical rejection claim missing")

    piqd = manifest["piqd"]
    require(piqd["daemon_protocol_version"] == 1, "wrong PIQD protocol")
    require(piqd["daemon_sha256"] == DAEMON_SHA256, "unauthorized PIQD daemon")
    require(piqd["ingress"] == "raw-dimacs/v1", "wrong PIQD ingress")
    require(piqd["backend"] == "cadical", "wrong PIQD backend")
    require(piqd["solver_profile"] == "sat", "wrong solver profile")
    require(piqd["immutable_root_only"] is True, "mutable root forbidden")
    require(piqd["python_authored_successor_clause_allowed"] is False, "Python clauses forbidden")
    return {
        "schema": "p97-exact17-twentieth-model-refinements-piqd-ingress-validation/v1",
        "manifest_sha256": sha256(manifest_path), "dimacs_sha256": sha256(root),
        "dimacs_bytes": root.stat().st_size, "variables": VARIABLES,
        "clauses": ROOT_CLAUSES, "new_clauses": NEW_CLAUSES,
        "parent_ingress_status": parent_result["status"],
        "motivating_model_cut_clauses": cuts,
        "canonical_records_rejected": regenerated["canonical_records_rejected"],
        "piqd_daemon_sha256": DAEMON_SHA256, "status": "PASS",
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
