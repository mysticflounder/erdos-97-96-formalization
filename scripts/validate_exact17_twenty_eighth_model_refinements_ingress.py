"""Fail-closed PIQD ingress for the exact-17 twenty-ninth child."""

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

SCHEMA = "p97-exact17-lean-twenty-eighth-model-refinements-piqd-ingress/v1"
DAEMON_SHA256 = "aa47e2ff3000890d11da79296721f0f51c3a228d4ef8446af3c3d2a73d969107"
ROOT_SHA256 = "620ea5ad066edf6526d11eb51c4cff93284130f6fd27de46d8d0c2e5ff9c0c53"
ROOT_BYTES = 291_588_188
PARENT_ROOT_SHA256 = "86bbb7f4a8f78372e9df8ff830a6737475e44defd42a013d41885fe1966ab02c"
PARENT_MANIFEST_SHA256 = "1857b429d589e404ad7d9e871dd8a1b6b9d4d485ef46c08375a9f4ce7894a03c"
ROOT_PATH = (
    "scratch/exact17-lean-to-sat/"
    "exact17-twenty-ninth-root-twenty-eighth-model-refinements.cnf"
)
PARENT_ROOT_PATH = (
    "scratch/exact17-lean-to-sat/"
    "exact17-twenty-eighth-root-twenty-seventh-model-refinements.cnf"
)
PARENT_MANIFEST_PATH = (
    "scratch/exact17-lean-to-sat/"
    "piqd-ingress-manifest-twenty-seventh-model-refinements.json"
)
VARIABLES = 308
PARENT_CLAUSES = 5_846_288
NEW_CLAUSES = 256
ROOT_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES
EXPECTED_SOURCE_PATHS = (
    (
        "lean/Erdos9796Proof/P97/ATail/"
        "BlockerVExactSeventeenTwentyEighthModelRefinements.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/"
        "BlockerVExactSeventeenTwentyEighthModelRefinementsExport.lean"
    ),
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
    require(parent_manifest["dimacs"]["path"] == PARENT_ROOT_PATH, "parent path drift")
    require(
        parent_manifest["dimacs"]["sha256"] == PARENT_ROOT_SHA256,
        "parent root drift",
    )

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
    require(lean["targeted_module_build"] == "PASS", "targeted Lean build missing")
    require(lean["sorryAx"] is False, "sorryAx is forbidden")
    require(
        lean["public_clause_and_terminal_adapter_axioms"]
        == [
            "propext",
            "Classical.choice",
            "Lean.ofReduceBool",
            "Lean.trustCompiler",
            "Quot.sound",
        ],
        "unexpected Lean trust boundary",
    )

    validation = manifest["validation"]
    validator = check_named_hash(repo, validation, "script")
    report = check_named_hash(repo, validation, "report")
    model = check_named_hash(repo, validation, "model")
    analysis = check_named_hash(repo, validation, "analysis")
    generator = check_named_hash(repo, validation, "generator")
    ledger = check_named_hash(repo, validation, "ledger")
    regenerated = load_module(
        validator, "exact17_twenty_eighth_model_refinements_export"
    ).validate(parent_root, root, model, ledger, analysis)
    require(regenerated == load_json(report), "semantic validation report drift")
    require(
        regenerated["variables"] == VARIABLES and regenerated["clauses"] == ROOT_CLAUSES,
        "validator dimensions mismatch",
    )
    require(regenerated["new_clauses"] == NEW_CLAUSES, "validator suffix mismatch")
    require(regenerated["parent_prefix_byte_identical"] is True, "prefix mismatch")
    require(
        regenerated["all_serialized_certificates_replayed"] is True,
        "serialized certificate replay missing",
    )
    require(regenerated["minimal_occurrences"] == 64, "wrong occurrence count")
    cuts = regenerated["motivating_model_cut_occurrences"]
    require(len(cuts) == 64, "not every minimal occurrence cuts the motivating model")
    require(all(cuts.values()), "an occurrence has no model-cut clause")
    require(validation["parent_prefix_byte_identical"] is True, "prefix claim missing")
    require(
        validation["all_twenty_eighth_model_refinement_clauses_independently_regenerated"]
        is True,
        "regeneration claim missing",
    )
    require(
        validation["all_serialized_certificates_replayed"] is True,
        "certificate replay claim missing",
    )
    require(
        validation["all_minimal_occurrences_cut_the_motivating_model"] is True,
        "model-cut claim missing",
    )
    require(generator.is_file(), "generator disappeared")

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
        "schema": "p97-exact17-twenty-eighth-model-refinements-piqd-ingress-validation/v1",
        "manifest_sha256": sha256(manifest_path),
        "dimacs_sha256": sha256(root),
        "dimacs_bytes": root.stat().st_size,
        "variables": VARIABLES,
        "clauses": ROOT_CLAUSES,
        "new_clauses": NEW_CLAUSES,
        "parent_dimacs_sha256": sha256(parent_root),
        "minimal_occurrence_count": len(cuts),
        "all_serialized_certificates_replayed": True,
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
