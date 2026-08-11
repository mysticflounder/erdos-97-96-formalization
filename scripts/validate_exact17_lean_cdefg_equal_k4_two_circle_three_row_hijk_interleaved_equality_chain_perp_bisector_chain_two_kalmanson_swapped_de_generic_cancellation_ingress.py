"""Fail-closed PIQD ingress for the exact-17 generic-cancellation child root."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import stat
from pathlib import Path
from types import ModuleType
from typing import Any

SCHEMA = "p97-exact17-lean-generic-cancellation-piqd-ingress/v1"
DAEMON_SHA256 = "0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360"
ROOT_SHA256 = "7def1009b154d3b846274821300bc68f6ddd43b651e11258506f19924773ccbc"
ROOT_BYTES = 291_568_096
VARIABLES = 308
ROOT_CLAUSES = 5_846_080
PARENT_CLAUSES = 5_846_076
NEW_CLAUSES = 4
PARENT_ROOT_SHA256 = "759507d020a02253e85b59ce12e344451bbe66889dce221884f1b2a6aa3fac28"
EXPECTED_SOURCE_PATHS = (
    (
        "lean/Erdos9796Proof/P97/ATail/"
        "BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleaved"
        "EqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellation.lean"
    ),
    (
        "lean/Erdos9796Proof/P97/ATail/"
        "BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleaved"
        "EqualityChainPerpBisectorChainTwoKalmansonSwappedDEGenericCancellationExport.lean"
    ),
)


def strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_json(path: Path) -> dict[str, Any]:
    value = json.loads(
        path.read_text(encoding="utf-8"), object_pairs_hook=strict_object
    )
    if not isinstance(value, dict):
        raise TypeError(f"expected a JSON object: {path}")
    return value


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def checked_path(repo: Path, relative: str) -> Path:
    path = repo / relative
    resolved = path.resolve(strict=True)
    resolved.relative_to(repo.resolve(strict=True))
    require(stat.S_ISREG(resolved.stat().st_mode), f"not a regular file: {relative}")
    require(not path.is_symlink(), f"symlink refused: {relative}")
    return resolved


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def check_hash(repo: Path, record: dict[str, Any]) -> Path:
    path = checked_path(repo, record["path"])
    require(sha256(path) == record["sha256"], f"SHA-256 drift: {record['path']}")
    return path


def check_named_hash(repo: Path, record: dict[str, Any], key: str) -> Path:
    return check_hash(repo, {"path": record[key], "sha256": record[f"{key}_sha256"]})


def load_module(path: Path, name: str) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise ValueError(f"cannot import validator: {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def parent_manifest(repo: Path, manifest: dict[str, Any]) -> dict[str, Any]:
    return load_json(check_named_hash(repo, manifest["parent_ingress"], "manifest"))


def lineage_path(repo: Path, manifest: dict[str, Any], kind: str) -> Path:
    for record in manifest["lineage"]:
        if record["kind"] == kind:
            return check_hash(repo, record)
    raise ValueError(f"missing lineage kind: {kind}")


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
    require(
        root_record["checked_generic_cancellation_clauses"] == NEW_CLAUSES,
        "wrong generic-cancellation count",
    )
    root = check_hash(repo, root_record)
    require(root.stat().st_size == ROOT_BYTES, "DIMACS size drift")

    parent_ingress = manifest["parent_ingress"]
    parent_manifest_path = check_named_hash(repo, parent_ingress, "manifest")
    parent_ingress_validator = check_named_hash(repo, parent_ingress, "validator")
    parent_report_path = check_named_hash(repo, parent_ingress, "report")
    # The historical parent validator pins two raw model JSON hashes that were
    # already stale in its original checkpoint.  Preserve and hash-pin that
    # validator/report as custody evidence, but bridge the serialization defect
    # below by exact full-model replay instead of pretending it is reproducible.
    require(parent_ingress_validator.is_file(), "missing parent ingress validator")
    parent_result = load_json(parent_report_path)
    require(parent_result["status"] == "PASS", "parent ingress did not pass")
    require(parent_result["dimacs_sha256"] == PARENT_ROOT_SHA256, "wrong parent root")
    require(parent_result["variables"] == VARIABLES, "parent variable mismatch")
    require(parent_result["clauses"] == PARENT_CLAUSES, "parent clause mismatch")

    swapped_de_manifest = load_json(parent_manifest_path)
    two_kalmanson_manifest = parent_manifest(repo, swapped_de_manifest)
    perp_manifest = parent_manifest(repo, two_kalmanson_manifest)
    equality_manifest = parent_manifest(repo, perp_manifest)
    interleaved_manifest = parent_manifest(repo, equality_manifest)
    hijk_manifest = parent_manifest(repo, interleaved_manifest)

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
    require(
        tuple(item["path"] for item in sources) == EXPECTED_SOURCE_PATHS,
        "wrong or reordered Lean source set",
    )
    for source in sources:
        check_hash(repo, source)

    validation = manifest["validation"]
    validator = check_named_hash(repo, validation, "script")
    migration_validator = check_named_hash(repo, validation, "migration_validator")
    migration_report = check_named_hash(repo, validation, "migration_report")
    migration_result = load_module(
        migration_validator, "exact17_model_serialization_custody_repair"
    ).validate(repo)
    require(
        migration_result == load_json(migration_report),
        "model serialization custody report drift",
    )
    require(migration_result["status"] == "PASS", "model custody repair failed")
    require(
        migration_result["complete_assignments_replayed"] is True,
        "model custody replay incomplete",
    )
    swapped_de_validator = check_named_hash(repo, validation, "parent_validator")
    two_kalmanson_validator = check_named_hash(
        repo, validation, "two_kalmanson_validator"
    )
    perp_validator = check_named_hash(repo, validation, "perp_bisector_validator")
    equality_validator = check_named_hash(repo, validation, "equality_chain_validator")
    interleaved_validator = check_named_hash(repo, validation, "interleaved_validator")
    hijk_validator = check_named_hash(repo, validation, "hijk_validator")
    three_row_validator = check_named_hash(repo, validation, "three_row_validator")
    two_circle_validator = check_named_hash(repo, validation, "two_circle_validator")
    equal_k4_validator = check_named_hash(repo, validation, "equal_k4_validator")
    cdefg_validator = check_named_hash(repo, validation, "cdefg_validator")
    hijk_model = check_named_hash(repo, validation, "hijk_model")
    interleaved_model = check_named_hash(repo, validation, "interleaved_model")
    equality_model = check_named_hash(repo, validation, "equality_chain_model")
    parent_model = check_named_hash(repo, validation, "parent_model")
    swapped_de_model = check_named_hash(repo, validation, "swapped_de_model")
    model = check_named_hash(repo, validation, "model")
    report = check_named_hash(repo, validation, "report")

    regenerated = load_module(validator, "exact17_generic_cancellation_export").validate(
        lineage_path(repo, hijk_manifest, "base"),
        lineage_path(repo, hijk_manifest, "cdefg"),
        lineage_path(repo, hijk_manifest, "equal_k4"),
        lineage_path(repo, hijk_manifest, "two_circle"),
        lineage_path(repo, hijk_manifest, "three_row"),
        check_hash(repo, hijk_manifest["dimacs"]),
        check_hash(repo, interleaved_manifest["dimacs"]),
        check_hash(repo, equality_manifest["dimacs"]),
        check_hash(repo, perp_manifest["dimacs"]),
        check_hash(repo, two_kalmanson_manifest["dimacs"]),
        check_hash(repo, swapped_de_manifest["dimacs"]),
        root,
        hijk_model,
        interleaved_model,
        equality_model,
        parent_model,
        swapped_de_model,
        model,
        swapped_de_validator,
        two_kalmanson_validator,
        perp_validator,
        equality_validator,
        interleaved_validator,
        hijk_validator,
        three_row_validator,
        two_circle_validator,
        equal_k4_validator,
        cdefg_validator,
    )
    require(regenerated == load_json(report), "semantic validation report drift")
    require(regenerated["variables"] == VARIABLES, "validator variable mismatch")
    require(regenerated["clauses"] == ROOT_CLAUSES, "validator clause mismatch")
    require(
        regenerated["generic_cancellation_clauses"] == NEW_CLAUSES,
        "validator suffix mismatch",
    )
    require(regenerated["parent_prefix_byte_identical"] is True, "prefix mismatch")
    require(regenerated["motivating_model_cut_clauses"], "model not cut")
    require(validation["parent_prefix_byte_identical"] is True, "prefix claim missing")
    require(
        validation["all_generic_cancellation_clauses_independently_regenerated"]
        is True,
        "regeneration claim missing",
    )
    require(validation["motivating_model_cut"] is True, "model-cut claim missing")

    piqd = manifest["piqd"]
    require(piqd["daemon_protocol_version"] == 1, "wrong PIQD protocol")
    require(piqd["daemon_sha256"] == DAEMON_SHA256, "unauthorized PIQD daemon")
    require(piqd["ingress"] == "raw-dimacs/v1", "wrong PIQD ingress")
    require(piqd["backend"] == "cadical", "wrong PIQD backend")
    require(piqd["solver_profile"] == "sat", "wrong solver profile")
    require(piqd["immutable_root_only"] is True, "mutable root forbidden")
    require(
        piqd["python_authored_successor_clause_allowed"] is False,
        "Python-authored successor clauses forbidden",
    )

    return {
        "schema": "p97-exact17-lean-generic-cancellation-piqd-ingress-validation/v1",
        "manifest_sha256": sha256(manifest_path),
        "dimacs_sha256": sha256(root),
        "dimacs_bytes": root.stat().st_size,
        "variables": VARIABLES,
        "clauses": ROOT_CLAUSES,
        "generic_cancellation_clauses": NEW_CLAUSES,
        "parent_ingress_status": parent_result["status"],
        "model_serialization_custody_status": migration_result["status"],
        "motivating_model_cut_clauses": regenerated["motivating_model_cut_clauses"],
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
