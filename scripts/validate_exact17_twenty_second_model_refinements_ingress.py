"""Fail-closed PIQD ingress for the exact-17 twenty-third child."""

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

SCHEMA = "p97-exact17-lean-twenty-second-model-refinements-piqd-ingress/v1"
DAEMON_SHA256 = "82187247e58c7b10773d56e190d795bf8f914150d818691c7d22f96f7264b396"
ROOT_SHA256 = "e88c12f36d113e8bbbe1484b27cbfa6f997a679f46d8b22e356f79d339f08827"
ROOT_BYTES = 291_574_848
PARENT_ROOT_SHA256 = "dc44614e28c907d5c61b29e58cc6f6188e52a2504e119efa37157a81a56f7edb"
ROOT_PATH = (
    "scratch/exact17-lean-to-sat/"
    "exact17-twenty-third-root-twenty-second-model-refinements.cnf"
)
PARENT_INGRESS_PATH = (
    "scratch/exact17-lean-to-sat/"
    "piqd-ingress-manifest-twenty-first-model-refinements.json"
)
VARIABLES = 308
PARENT_CLAUSES = 5_846_208
NEW_CLAUSES = 20
ROOT_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES
EXPECTED_SOURCE_PATHS = (
    (
        "lean/Erdos9796Proof/P97/ATail/"
        "BlockerVExactSeventeenTwentySecondModelRefinements.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/"
        "BlockerVExactSeventeenTwentySecondModelRefinementsExport.lean"
    ),
)
EXPECTED_ORBITS = (
    "bisector",
    "convex_five",
    "kalmanson_l",
    "cancellation",
    "duplicate_center",
)


def validate(repo: Path, manifest_path: Path) -> dict[str, Any]:
    manifest = load_json(manifest_path)
    require(
        set(manifest)
        == {
            "schema",
            "dimacs",
            "parent_ingress",
            "lean",
            "model_provenance",
            "validation",
            "piqd",
        },
        "wrong manifest fields",
    )
    require(manifest["schema"] == SCHEMA, "wrong ingress schema")

    root_record = manifest["dimacs"]
    require(root_record["path"] == ROOT_PATH, "wrong DIMACS root path")
    require(root_record["sha256"] == ROOT_SHA256, "unauthorized DIMACS root")
    require(root_record["bytes"] == ROOT_BYTES, "wrong DIMACS byte count")
    require(root_record["variables"] == VARIABLES, "wrong variable count")
    require(root_record["clauses"] == ROOT_CLAUSES, "wrong clause count")
    require(
        root_record["parent_prefix_clauses"] == PARENT_CLAUSES,
        "wrong parent count",
    )
    require(root_record["checked_new_clauses"] == NEW_CLAUSES, "wrong suffix count")
    root = check_hash(repo, root_record)
    require(root.stat().st_size == ROOT_BYTES, "DIMACS size drift")

    parent_ingress = manifest["parent_ingress"]
    require(
        parent_ingress["manifest"] == PARENT_INGRESS_PATH,
        "wrong parent ingress path",
    )
    parent_manifest_path = check_named_hash(repo, parent_ingress, "manifest")
    parent_validator = check_named_hash(repo, parent_ingress, "validator")
    parent_report_path = check_named_hash(repo, parent_ingress, "report")
    parent_result = load_module(
        parent_validator, "exact17_twenty_first_model_refinements_ingress"
    ).validate(repo, parent_manifest_path)
    require(parent_result == load_json(parent_report_path), "parent ingress report drift")
    require(parent_result["status"] == "PASS", "parent ingress did not pass")
    require(parent_result["dimacs_sha256"] == PARENT_ROOT_SHA256, "wrong parent root")
    parent_manifest = load_json(parent_manifest_path)
    parent_root = check_hash(repo, parent_manifest["dimacs"])

    lean = manifest["lean"]
    require(lean["toolchain"] == "leanprover/lean4:v4.27.0", "wrong Lean toolchain")
    require(
        sha256(checked_path(repo, "lean/lean-toolchain"))
        == lean["toolchain_file_sha256"],
        "lean-toolchain drift",
    )
    require(
        sha256(checked_path(repo, "lean/lake-manifest.json"))
        == lean["lake_manifest_sha256"],
        "lake manifest drift",
    )
    sources = lean["source_files"]
    require(
        tuple(item["path"] for item in sources) == EXPECTED_SOURCE_PATHS,
        "wrong Lean source set",
    )
    for source in sources:
        check_hash(repo, source)

    provenance = manifest["model_provenance"]
    ingress_manifest_path = check_named_hash(repo, provenance, "ingress_manifest")
    final_path = check_named_hash(repo, provenance, "final")
    parent_model_manifest = load_json(ingress_manifest_path)
    final = load_json(final_path)
    require(
        parent_model_manifest["dimacs"]["sha256"] == PARENT_ROOT_SHA256,
        "model ingress manifest names wrong parent root",
    )
    require(
        parent_model_manifest["piqd"]["daemon_sha256"] == DAEMON_SHA256,
        "model ingress manifest names wrong daemon",
    )
    require(final["job_id"] == provenance["job_id"], "job identity drift")
    require(final["result"] == "SAT", "PIQD result is not SAT")
    require(final["root"]["sha256"] == PARENT_ROOT_SHA256, "result names wrong root")
    require(
        final["model_sha256"] == provenance["model_sha256"],
        "model identity drift",
    )

    validation = manifest["validation"]
    validator = check_named_hash(repo, validation, "script")
    model = check_named_hash(repo, validation, "model")
    require(
        validation["model_sha256"] == provenance["model_sha256"],
        "validation does not use the authenticated model",
    )
    analysis = check_named_hash(repo, validation, "analysis")
    theorem_bank = check_named_hash(repo, validation, "theorem_bank")
    report = check_named_hash(repo, validation, "report")
    regenerated = load_module(
        validator, "exact17_twenty_second_model_refinements_export"
    ).validate(parent_root, root, model, theorem_bank, analysis)
    require(regenerated == load_json(report), "semantic validation report drift")
    require(
        regenerated["variables"] == VARIABLES
        and regenerated["clauses"] == ROOT_CLAUSES,
        "validator dimensions mismatch",
    )
    require(regenerated["new_clauses"] == NEW_CLAUSES, "validator suffix mismatch")
    require(regenerated["parent_prefix_byte_identical"] is True, "prefix mismatch")
    cuts = regenerated["motivating_model_cut_clauses"]
    require(
        all(cuts.get(name) for name in EXPECTED_ORBITS),
        "not every occurrence orbit cuts the authenticated model",
    )
    require(
        regenerated["all_six_canonical_hits_replayed"] is True,
        "not all six canonical hits were replayed",
    )
    require(validation["parent_prefix_byte_identical"] is True, "prefix claim missing")
    require(
        validation["all_new_clauses_independently_regenerated"] is True,
        "regeneration claim missing",
    )
    require(
        validation["motivating_model_cut_by_all_five_orbits"] is True,
        "model-cut claim missing",
    )
    require(
        validation["all_six_canonical_hits_replayed"] is True,
        "canonical replay claim missing",
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
        "schema": (
            "p97-exact17-twenty-second-model-refinements-"
            "piqd-ingress-validation/v1"
        ),
        "manifest_sha256": sha256(manifest_path),
        "dimacs_sha256": sha256(root),
        "dimacs_bytes": root.stat().st_size,
        "variables": VARIABLES,
        "clauses": ROOT_CLAUSES,
        "new_clauses": NEW_CLAUSES,
        "parent_ingress_status": parent_result["status"],
        "motivating_model_cut_clauses": cuts,
        "all_six_canonical_hits_replayed": True,
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
