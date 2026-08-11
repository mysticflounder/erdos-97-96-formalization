"""Fail-closed ingress validation for the exact-17 C--G + equal-K4 PIQD root."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import stat
from pathlib import Path
from types import ModuleType
from typing import Any

SCHEMA = "p97-exact17-lean-cdefg-equal-k4-piqd-ingress/v1"
ROOT_SHA256 = "00e0e3e50e518833b782a1afbb686896365335d4cb15c993b3a6a25e31cc0aa6"
ROOT_BYTES = 107_954_682
PARENT_SHA256 = "763bb4774a4d148ca35a4d33ecce06c158a8f941c3e5fb272f534cb2b9637527"
PARENT_BYTES = 104_887_967
BASE_SHA256 = "d5ea7921014b2c1868c100f89a2dfbd906f9cdba28f282fcbad015d93b1dd425"
BASE_BYTES = 6_012_598
DAEMON_SHA256 = "fd1cacee52677a555f8b3d24c6052c71022e4dfd6ccc9037f165d1d22ec384eb"
VARIABLES = 308
CLAUSES = 2_268_460
PARENT_CLAUSES = 2_189_852
BASE_CLAUSES = 209_692
CDEFG_CLAUSES = 1_980_160
EQUAL_K4_CLAUSES = 78_608
EXPECTED_SOURCE_PATHS = (
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceNormalForm.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnf.lean",
    "lean/Erdos9796Proof/P97/ATail/KalmansonFourEqualitySchemas.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefg.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefgEqualK4.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefgEqualK4Export.lean",
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


def load_validator(path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location("exact17_equal_k4_validator", path)
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
    require(dimacs["checked_equal_k4_clauses"] == EQUAL_K4_CLAUSES,
            "wrong equal-K4 count")
    child = check_hash(repo, dimacs)
    require(child.stat().st_size == ROOT_BYTES, "DIMACS size drift")

    parent_record = manifest["parent_dimacs"]
    require(parent_record["sha256"] == PARENT_SHA256, "unauthorized parent root")
    require(parent_record["bytes"] == PARENT_BYTES, "wrong parent byte count")
    require(parent_record["variables"] == VARIABLES, "wrong parent variable count")
    require(parent_record["clauses"] == PARENT_CLAUSES, "wrong parent clause count")
    parent = check_hash(repo, parent_record)
    require(parent.stat().st_size == PARENT_BYTES, "parent size drift")

    base_record = manifest["base_dimacs"]
    require(base_record["sha256"] == BASE_SHA256, "unauthorized base root")
    require(base_record["bytes"] == BASE_BYTES, "wrong base byte count")
    require(base_record["variables"] == VARIABLES, "wrong base variable count")
    require(base_record["clauses"] == BASE_CLAUSES, "wrong base clause count")
    base = check_hash(repo, base_record)
    require(base.stat().st_size == BASE_BYTES, "base size drift")

    lean = manifest["lean"]
    require(lean["toolchain"] == "leanprover/lean4:v4.27.0", "wrong Lean toolchain")
    require(sha256(checked_path(repo, "lean-toolchain")) == lean["toolchain_file_sha256"],
            "lean-toolchain drift")
    require(sha256(checked_path(repo, "lean/lake-manifest.json")) ==
            lean["lake_manifest_sha256"], "lake manifest drift")
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
    parent_validator = check_hash(repo, {
        "path": validation["parent_validator"],
        "sha256": validation["parent_validator_sha256"],
    })
    report_path = check_hash(repo, {
        "path": validation["report"],
        "sha256": validation["report_sha256"],
    })
    regenerated = load_validator(validator).validate(base, parent, child, parent_validator)
    require(regenerated == load_json(report_path), "semantic validation report drift")
    require(regenerated["variables"] == VARIABLES, "validator variable mismatch")
    require(regenerated["clauses"] == CLAUSES, "validator clause mismatch")
    require(regenerated["parent_prefix_byte_identical"] is True,
            "parent prefix is not byte-identical")
    require(regenerated["equal_k4_clauses"] == EQUAL_K4_CLAUSES,
            "validator equal-K4 mismatch")

    check_hash(repo, manifest["route_spec"])
    piqd = manifest["piqd"]
    require(piqd["daemon_protocol_version"] == 1, "wrong PIQD protocol")
    require(piqd["daemon_sha256"] == DAEMON_SHA256, "unauthorized PIQD daemon")
    require(piqd["ingress"] == "raw-dimacs/v1", "wrong PIQD ingress")
    require(piqd["backend"] == "cadical", "wrong PIQD backend")
    require(piqd["solver_profile"] == "sat", "wrong solver profile")
    require(piqd["immutable_root_only"] is True, "mutable root forbidden")
    require(piqd["python_authored_successor_clause_allowed"] is False,
            "Python-authored successor clauses forbidden")

    return {
        "schema": "p97-exact17-lean-cdefg-equal-k4-piqd-ingress-validation/v1",
        "manifest_sha256": sha256(manifest_path),
        "dimacs_sha256": sha256(child),
        "dimacs_bytes": child.stat().st_size,
        "variables": VARIABLES,
        "clauses": CLAUSES,
        "equal_k4_clauses": EQUAL_K4_CLAUSES,
        "piqd_daemon_sha256": DAEMON_SHA256,
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
