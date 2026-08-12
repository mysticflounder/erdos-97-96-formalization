"""Fail-closed PIQD ingress for the exact-17 twenty-sixth child."""

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

SCHEMA = "p97-exact17-lean-twenty-fifth-model-refinements-piqd-ingress/v1"
DAEMON_SHA256 = "82187247e58c7b10773d56e190d795bf8f914150d818691c7d22f96f7264b396"
ROOT_SHA256 = "d238b81bfdc40c53c948c7655285e0b74203711e1b5cd013fb8d8c9ad1a642f5"
ROOT_BYTES = 291_576_766
PARENT_ROOT_SHA256 = "8cd560206d0e38a1d63e65925fe4027d2523bf8a4084a87456ce10d71986fa6a"
PARENT_MANIFEST_SHA256 = "6dfcf6113aa382493835372a879dd06f9bdc825c37d41b5a8848223da84c0e8b"
ROOT_PATH = (
    "scratch/exact17-lean-to-sat/"
    "exact17-twenty-sixth-root-twenty-fifth-model-refinements.cnf"
)
PARENT_ROOT_PATH = (
    "scratch/exact17-lean-to-sat/"
    "exact17-twenty-fifth-root-twenty-fourth-model-refinements.cnf"
)
PARENT_MANIFEST_PATH = (
    "scratch/exact17-lean-to-sat/"
    "piqd-ingress-manifest-twenty-fourth-model-refinements.json"
)
VARIABLES = 308
PARENT_CLAUSES = 5_846_252
NEW_CLAUSES = 20
ROOT_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES
EXPECTED_SOURCE_PATHS = (
    (
        "lean/Erdos9796Proof/P97/ATail/"
        "BlockerVExactSeventeenTwentyFifthModelRefinements.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/"
        "BlockerVExactSeventeenTwentyFifthModelRefinementsExport.lean"
    ),
)
EXPECTED_CUTS = {
    "bisector_one",
    "bisector_two",
    "convex_five",
    "cancellation",
    "perp_bisector",
}


def validate(repo: Path, manifest_path: Path) -> dict[str, Any]:
    manifest = load_json(manifest_path)
    require(
        set(manifest) == {"schema", "dimacs", "parent_ingress", "lean", "validation", "piqd"},
        "wrong manifest fields",
    )
    require(manifest["schema"] == SCHEMA, "wrong ingress schema")

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

    parent = manifest["parent_ingress"]
    require(parent["dimacs_path"] == PARENT_ROOT_PATH, "wrong parent DIMACS path")
    require(parent["dimacs_sha256"] == PARENT_ROOT_SHA256, "wrong parent DIMACS hash")
    require(parent["manifest"] == PARENT_MANIFEST_PATH, "wrong parent manifest path")
    require(parent["manifest_sha256"] == PARENT_MANIFEST_SHA256, "wrong parent manifest hash")
    require(parent["parent_prefix_byte_identical"] is True, "parent prefix claim missing")
    parent_root = checked_path(repo, parent["dimacs_path"])
    require(sha256(parent_root) == PARENT_ROOT_SHA256, "parent DIMACS drift")
    parent_manifest_path = checked_path(repo, parent["manifest"])
    require(sha256(parent_manifest_path) == PARENT_MANIFEST_SHA256, "parent manifest drift")
    parent_manifest = load_json(parent_manifest_path)
    require(parent_manifest["dimacs"]["path"] == PARENT_ROOT_PATH, "parent manifest path drift")
    require(
        parent_manifest["dimacs"]["sha256"] == PARENT_ROOT_SHA256,
        "parent manifest root drift",
    )

    lean = manifest["lean"]
    require(lean["toolchain"] == "leanprover/lean4:v4.27.0", "wrong Lean toolchain")
    require(
        sha256(checked_path(repo, "lean/lean-toolchain")) == lean["toolchain_file_sha256"],
        "lean-toolchain drift",
    )
    require(
        sha256(checked_path(repo, "lean/lake-manifest.json")) == lean["lake_manifest_sha256"],
        "lake manifest drift",
    )
    sources = lean["source_files"]
    require(
        tuple(item["path"] for item in sources) == EXPECTED_SOURCE_PATHS,
        "wrong Lean source set",
    )
    for source in sources:
        check_hash(repo, source)
    require(lean["targeted_module_build"] == "PASS", "targeted Lean build missing")
    require(lean["sorryAx"] is False, "sorryAx is forbidden")
    require(
        lean["public_clause_and_terminal_adapter_axioms"]
        == ["propext", "Classical.choice", "Lean.ofReduceBool", "Lean.trustCompiler", "Quot.sound"],
        "unexpected Lean trust boundary",
    )

    validation = manifest["validation"]
    validator = check_named_hash(repo, validation, "script")
    report = check_named_hash(repo, validation, "report")
    model = check_named_hash(repo, validation, "model")
    theorem_bank = check_named_hash(repo, validation, "theorem_bank")
    analysis = check_named_hash(repo, validation, "analysis")
    check_named_hash(repo, validation, "theorem_bank_miner")
    regenerated = load_module(
        validator, "exact17_twenty_fifth_model_refinements_export"
    ).validate(parent_root, root, model, theorem_bank, analysis)
    require(regenerated == load_json(report), "semantic validation report drift")
    require(
        regenerated["variables"] == VARIABLES and regenerated["clauses"] == ROOT_CLAUSES,
        "validator dimensions mismatch",
    )
    require(regenerated["new_clauses"] == NEW_CLAUSES, "validator suffix mismatch")
    require(regenerated["parent_prefix_byte_identical"] is True, "prefix mismatch")
    require(regenerated["canonical_hits_replayed"] is True, "canonical hits not replayed")
    cuts = regenerated["motivating_model_cut_clauses"]
    require(set(cuts) == EXPECTED_CUTS, "wrong motivating occurrence set")
    require(all(cuts[name] for name in EXPECTED_CUTS), "a motivating orbit does not cut")
    require(validation["parent_prefix_byte_identical"] is True, "prefix claim missing")
    require(
        validation["all_twenty_fifth_model_refinement_clauses_independently_regenerated"]
        is True,
        "regeneration claim missing",
    )
    require(validation["all_five_motivating_occurrences_cut"] is True, "model-cut claim missing")

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
        "schema": "p97-exact17-twenty-fifth-model-refinements-piqd-ingress-validation/v1",
        "manifest_sha256": sha256(manifest_path),
        "dimacs_sha256": sha256(root),
        "dimacs_bytes": root.stat().st_size,
        "variables": VARIABLES,
        "clauses": ROOT_CLAUSES,
        "new_clauses": NEW_CLAUSES,
        "parent_dimacs_sha256": sha256(parent_root),
        "motivating_model_cut_clauses": cuts,
        "canonical_hits_replayed": True,
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
