"""Fail-closed ingress validation for the exact-17 H--K PIQD root."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import stat
from pathlib import Path
from types import ModuleType
from typing import Any

SCHEMA = "p97-exact17-lean-cdefg-equal-k4-two-circle-three-row-hijk-piqd-ingress/v1"
DAEMON_SHA256 = "fd1cacee52677a555f8b3d24c6052c71022e4dfd6ccc9037f165d1d22ec384eb"
VARIABLES = 308
ROOT = (
    "a489fdf5ddbd1f0abd765592e4b016841b170aed7a20833318704e30171bb570",
    168_290_508,
    3_618_396,
)
LINEAGE = (
    ("three_row", "009b34264ddcb114a59410f3af61a46b04b831841ce6687104c1833d7441a9d4", 113_229_604, 2_430_300),
    ("two_circle", "2feebcbf67b377b2e198c34e4385adccf0e8a631051c6058855d72321ddf4746", 108_926_214, 2_306_540),
    ("equal_k4", "00e0e3e50e518833b782a1afbb686896365335d4cb15c993b3a6a25e31cc0aa6", 107_954_682, 2_268_460),
    ("cdefg", "763bb4774a4d148ca35a4d33ecce06c158a8f941c3e5fb272f534cb2b9637527", 104_887_967, 2_189_852),
    ("base", "d5ea7921014b2c1868c100f89a2dfbd906f9cdba28f282fcbad015d93b1dd425", 6_012_598, 209_692),
)
EXPECTED_COUNTS = {
    "base_prefix_clauses": 209_692,
    "checked_cdefg_clauses": 1_980_160,
    "checked_equal_k4_clauses": 78_608,
    "checked_two_circle_clauses": 38_080,
    "checked_three_row_clauses": 123_760,
    "checked_hijk_clauses": 1_188_096,
}
EXPECTED_SOURCE_PATHS = (
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceNormalForm.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnf.lean",
    "lean/Erdos9796Proof/P97/ATail/KalmansonFourEqualitySchemas.lean",
    "lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean",
    "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefg.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefgEqualK4.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRow.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkExport.lean",
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


def check_dimacs(
    repo: Path, record: dict[str, Any], expected: tuple[str, int, int]
) -> Path:
    expected_sha, expected_bytes, expected_clauses = expected
    require(record["sha256"] == expected_sha, "unauthorized DIMACS root")
    require(record["bytes"] == expected_bytes, "wrong DIMACS byte count")
    require(record["variables"] == VARIABLES, "wrong DIMACS variable count")
    require(record["clauses"] == expected_clauses, "wrong DIMACS clause count")
    path = check_hash(repo, record)
    require(path.stat().st_size == expected_bytes, "DIMACS size drift")
    return path


def load_validator(path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location("exact17_hijk_validator", path)
    if spec is None or spec.loader is None:
        raise ValueError(f"cannot import validator: {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def validation_file(repo: Path, validation: dict[str, Any], key: str) -> Path:
    return check_hash(
        repo,
        {"path": validation[key], "sha256": validation[f"{key}_sha256"]},
    )


def validate(repo: Path, manifest_path: Path) -> dict[str, Any]:
    manifest = load_json(manifest_path)
    require(manifest.get("schema") == SCHEMA, "wrong ingress schema")
    root_record = manifest["dimacs"]
    root = check_dimacs(repo, root_record, ROOT)
    for field, expected in EXPECTED_COUNTS.items():
        require(root_record[field] == expected, f"wrong {field}")

    lineage = manifest["lineage"]
    require(len(lineage) == len(LINEAGE), "wrong lineage length")
    checked_lineage: dict[str, Path] = {}
    for record, (kind, expected_sha, expected_bytes, expected_clauses) in zip(
        lineage, LINEAGE, strict=True
    ):
        require(record["kind"] == kind, f"wrong lineage kind: {kind}")
        checked_lineage[kind] = check_dimacs(
            repo, record, (expected_sha, expected_bytes, expected_clauses)
        )

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
    validator = validation_file(repo, validation, "script")
    parent_validator = validation_file(repo, validation, "parent_validator")
    grandparent_validator = validation_file(repo, validation, "grandparent_validator")
    ancestor_validator = validation_file(repo, validation, "ancestor_validator")
    root_validator = validation_file(repo, validation, "root_validator")
    report_path = check_hash(
        repo, {"path": validation["report"], "sha256": validation["report_sha256"]}
    )
    regenerated = load_validator(validator).validate(
        checked_lineage["base"],
        checked_lineage["cdefg"],
        checked_lineage["equal_k4"],
        checked_lineage["two_circle"],
        checked_lineage["three_row"],
        root,
        parent_validator,
        grandparent_validator,
        ancestor_validator,
        root_validator,
    )
    require(regenerated == load_json(report_path), "semantic validation report drift")
    require(regenerated["variables"] == VARIABLES, "validator variable mismatch")
    require(regenerated["clauses"] == ROOT[2], "validator clause mismatch")
    require(regenerated["parent_prefix_byte_identical"] is True, "prefix mismatch")
    require(regenerated["hijk_clauses"] == EXPECTED_COUNTS["checked_hijk_clauses"], "H--K mismatch")

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
        "schema": "p97-exact17-lean-hijk-piqd-ingress-validation/v1",
        "manifest_sha256": sha256(manifest_path),
        "dimacs_sha256": sha256(root),
        "dimacs_bytes": root.stat().st_size,
        "variables": VARIABLES,
        "clauses": ROOT[2],
        "hijk_clauses": EXPECTED_COUNTS["checked_hijk_clauses"],
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
