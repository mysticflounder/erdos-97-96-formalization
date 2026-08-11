"""Fail-closed ingress validation for the frozen exact-17 C--G PIQD root."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import stat
from pathlib import Path
from types import ModuleType
from typing import Any

SCHEMA = "p97-exact17-lean-cdefg-piqd-ingress/v1"
ROOT_SHA256 = "763bb4774a4d148ca35a4d33ecce06c158a8f941c3e5fb272f534cb2b9637527"
ROOT_BYTES = 104_887_967
VARIABLES = 308
CLAUSES = 2_189_852
BASE_CLAUSES = 209_692
CDEFG_CLAUSES = 1_980_160
EXPECTED_SOURCE_PATHS = (
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceNormalForm.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnf.lean",
    "lean/Erdos9796Proof/P97/ATail/KalmansonFourEqualitySchemas.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefg.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefgExport.lean",
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean",
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
    mode = resolved.stat().st_mode
    require(stat.S_ISREG(mode), f"not a regular file: {relative}")
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
    observed = sha256(path)
    require(observed == record["sha256"], f"SHA-256 drift: {record['path']}")
    return path


def load_validator(path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location("exact17_cdefg_validator", path)
    if spec is None or spec.loader is None:
        raise ValueError(f"cannot import validator: {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def validate(repo: Path, manifest_path: Path) -> dict[str, Any]:
    manifest = load_json(manifest_path)
    require(manifest.get("schema") == SCHEMA, "wrong ingress schema")

    dimacs = manifest["dimacs"]
    require(dimacs["sha256"] == ROOT_SHA256, "unauthorized DIMACS root")
    require(dimacs["bytes"] == ROOT_BYTES, "wrong DIMACS byte count")
    require(dimacs["variables"] == VARIABLES, "wrong DIMACS variable count")
    require(dimacs["clauses"] == CLAUSES, "wrong DIMACS clause count")
    require(dimacs["base_prefix_clauses"] == BASE_CLAUSES, "wrong base prefix")
    require(dimacs["checked_cdefg_clauses"] == CDEFG_CLAUSES, "wrong C--G count")
    extended = check_hash(repo, dimacs)
    require(extended.stat().st_size == ROOT_BYTES, "DIMACS size drift")

    base_record = manifest["base_dimacs"]
    require(base_record["variables"] == VARIABLES, "wrong base variable count")
    require(base_record["clauses"] == BASE_CLAUSES, "wrong base clause count")
    base = check_hash(repo, base_record)

    lean = manifest["lean"]
    require(lean["toolchain"] == "leanprover/lean4:v4.27.0", "wrong Lean toolchain")
    toolchain = checked_path(repo, "lean-toolchain")
    lake_manifest = checked_path(repo, "lean/lake-manifest.json")
    require(sha256(toolchain) == lean["toolchain_file_sha256"], "lean-toolchain drift")
    require(sha256(lake_manifest) == lean["lake_manifest_sha256"], "lake manifest drift")
    sources = lean["source_files"]
    require(tuple(item["path"] for item in sources) == EXPECTED_SOURCE_PATHS,
            "wrong or reordered Lean source set")
    for source in sources:
        check_hash(repo, source)

    validation = manifest["validation"]
    validator = check_hash(repo, {
        "path": validation["script"],
        "sha256": validation["script_sha256"],
    })
    report_path = check_hash(repo, {
        "path": validation["report"],
        "sha256": validation["report_sha256"],
    })
    regenerated = load_validator(validator).validate(base, extended)
    require(regenerated == load_json(report_path), "semantic validation report drift")
    require(regenerated["variables"] == VARIABLES, "validator variable mismatch")
    require(regenerated["clauses"] == CLAUSES, "validator clause mismatch")
    require(len(regenerated["families"]) == 10, "validator family-block mismatch")

    route = manifest["route_spec"]
    check_hash(repo, route)
    policy = manifest["piqd_policy"]
    require(policy["ingress"] == "raw-dimacs/v1", "wrong PIQD ingress")
    require(policy["backend"] == "cadical", "wrong PIQD backend")
    require(policy["solver_profile"] == "sat", "wrong solver profile")
    require(policy["immutable_root_only"] is True, "mutable root forbidden")
    require(policy["python_authored_successor_clause_allowed"] is False,
            "Python-authored successor clauses forbidden")

    return {
        "schema": "p97-exact17-lean-cdefg-piqd-ingress-validation/v1",
        "manifest_sha256": sha256(manifest_path),
        "dimacs_sha256": sha256(extended),
        "dimacs_bytes": extended.stat().st_size,
        "variables": VARIABLES,
        "clauses": CLAUSES,
        "semantic_family_blocks": len(regenerated["families"]),
        "status": "PASS",
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    args = parser.parse_args()
    payload = validate(args.repo.resolve(), args.manifest.resolve())
    print(json.dumps(payload, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
