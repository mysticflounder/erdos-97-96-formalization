"""Fail-closed ingress validation for the exact-17 interleaved PIQD root."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import stat
from pathlib import Path
from types import ModuleType
from typing import Any

SCHEMA = "p97-exact17-lean-hijk-interleaved-piqd-ingress/v1"
DAEMON_SHA256 = "fd1cacee52677a555f8b3d24c6052c71022e4dfd6ccc9037f165d1d22ec384eb"
ROOT_SHA256 = "db8f493b4a8312efcf99d0e3e198537233b83dbb6cc5f4dad6f1423e22d90bd9"
ROOT_BYTES = 178_619_218
VARIABLES = 308
ROOT_CLAUSES = 3_915_420
PARENT_CLAUSES = 3_618_396
INTERLEAVED_CLAUSES = 297_024
PARENT_ROOT_SHA256 = "a489fdf5ddbd1f0abd765592e4b016841b170aed7a20833318704e30171bb570"
EXPECTED_SOURCE_PATHS = (
    "lean/Erdos9796Proof/P97/ATail/KalmansonThreeEqualitySchemas.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleaved.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedExport.lean",
)


def strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_json(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=strict_object)
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
    return check_hash(
        repo,
        {"path": record[key], "sha256": record[f"{key}_sha256"]},
    )


def load_module(path: Path, name: str) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise ValueError(f"cannot import validator: {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def lineage_path(repo: Path, parent_manifest: dict[str, Any], kind: str) -> Path:
    for record in parent_manifest["lineage"]:
        if record["kind"] == kind:
            return check_hash(repo, record)
    raise ValueError(f"missing parent lineage kind: {kind}")


def validate(repo: Path, manifest_path: Path) -> dict[str, Any]:
    manifest = load_json(manifest_path)
    require(set(manifest) == {"schema", "dimacs", "parent_ingress", "lean", "validation", "piqd"}, "wrong manifest fields")
    require(manifest["schema"] == SCHEMA, "wrong ingress schema")

    root_record = manifest["dimacs"]
    require(root_record["sha256"] == ROOT_SHA256, "unauthorized DIMACS root")
    require(root_record["bytes"] == ROOT_BYTES, "wrong DIMACS byte count")
    require(root_record["variables"] == VARIABLES, "wrong DIMACS variable count")
    require(root_record["clauses"] == ROOT_CLAUSES, "wrong DIMACS clause count")
    require(root_record["parent_prefix_clauses"] == PARENT_CLAUSES, "wrong parent count")
    require(root_record["checked_interleaved_clauses"] == INTERLEAVED_CLAUSES, "wrong interleaved count")
    root = check_hash(repo, root_record)
    require(root.stat().st_size == ROOT_BYTES, "DIMACS size drift")

    parent_ingress = manifest["parent_ingress"]
    parent_manifest_path = check_named_hash(repo, parent_ingress, "manifest")
    parent_validator_path = check_named_hash(repo, parent_ingress, "validator")
    parent_report_path = check_named_hash(repo, parent_ingress, "report")
    parent_result = load_module(parent_validator_path, "exact17_parent_ingress").validate(
        repo, parent_manifest_path
    )
    require(parent_result == load_json(parent_report_path), "parent ingress report drift")
    require(parent_result["status"] == "PASS", "parent ingress did not pass")
    require(parent_result["dimacs_sha256"] == PARENT_ROOT_SHA256, "wrong parent root")
    parent_manifest = load_json(parent_manifest_path)

    lean = manifest["lean"]
    require(lean["toolchain"] == "leanprover/lean4:v4.27.0", "wrong Lean toolchain")
    require(sha256(checked_path(repo, "lean-toolchain")) == lean["toolchain_file_sha256"], "lean-toolchain drift")
    require(sha256(checked_path(repo, "lean/lake-manifest.json")) == lean["lake_manifest_sha256"], "lake manifest drift")
    sources = lean["source_files"]
    require(tuple(item["path"] for item in sources) == EXPECTED_SOURCE_PATHS, "wrong or reordered Lean source set")
    for source in sources:
        check_hash(repo, source)

    validation = manifest["validation"]
    validator = check_named_hash(repo, validation, "script")
    hijk_validator = check_named_hash(repo, validation, "parent_validator")
    three_row_validator = check_named_hash(repo, validation, "grandparent_validator")
    two_circle_validator = check_named_hash(repo, validation, "ancestor_validator")
    equal_k4_validator = check_named_hash(repo, validation, "root_validator")
    cdefg_validator = check_named_hash(repo, validation, "base_validator")
    model = check_named_hash(repo, validation, "model")
    report = check_named_hash(repo, validation, "report")
    regenerated = load_module(validator, "exact17_interleaved_export").validate(
        lineage_path(repo, parent_manifest, "base"),
        lineage_path(repo, parent_manifest, "cdefg"),
        lineage_path(repo, parent_manifest, "equal_k4"),
        lineage_path(repo, parent_manifest, "two_circle"),
        lineage_path(repo, parent_manifest, "three_row"),
        check_hash(repo, parent_manifest["dimacs"]),
        root,
        model,
        hijk_validator,
        three_row_validator,
        two_circle_validator,
        equal_k4_validator,
        cdefg_validator,
    )
    require(regenerated == load_json(report), "semantic validation report drift")
    require(regenerated["variables"] == VARIABLES, "validator variable mismatch")
    require(regenerated["clauses"] == ROOT_CLAUSES, "validator clause mismatch")
    require(regenerated["interleaved_clauses"] == INTERLEAVED_CLAUSES, "validator interleaved mismatch")
    require(regenerated["parent_prefix_byte_identical"] is True, "prefix mismatch")
    require(isinstance(regenerated["motivating_model_cut_clause"], int), "model not cut")
    require(validation["parent_prefix_byte_identical"] is True, "manifest prefix claim missing")
    require(validation["all_interleaved_clauses_independently_regenerated"] is True, "regeneration claim missing")
    require(validation["motivating_model_cut"] is True, "model-cut claim missing")

    piqd = manifest["piqd"]
    require(piqd["daemon_protocol_version"] == 1, "wrong PIQD protocol")
    require(piqd["daemon_sha256"] == DAEMON_SHA256, "unauthorized PIQD daemon")
    require(piqd["ingress"] == "raw-dimacs/v1", "wrong PIQD ingress")
    require(piqd["backend"] == "cadical", "wrong PIQD backend")
    require(piqd["solver_profile"] == "sat", "wrong solver profile")
    require(piqd["immutable_root_only"] is True, "mutable root forbidden")
    require(piqd["python_authored_successor_clause_allowed"] is False, "Python-authored successor clauses forbidden")

    return {
        "schema": "p97-exact17-lean-hijk-interleaved-piqd-ingress-validation/v1",
        "manifest_sha256": sha256(manifest_path),
        "dimacs_sha256": sha256(root),
        "dimacs_bytes": root.stat().st_size,
        "variables": VARIABLES,
        "clauses": ROOT_CLAUSES,
        "interleaved_clauses": INTERLEAVED_CLAUSES,
        "parent_ingress_status": parent_result["status"],
        "motivating_model_cut_clause": regenerated["motivating_model_cut_clause"],
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
