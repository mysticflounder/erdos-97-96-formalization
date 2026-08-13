"""Validate the Lean-owned exact-17 Child37 DIMACS boundary."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
from dataclasses import dataclass
from pathlib import Path
from typing import Any, BinaryIO

Clause = tuple[int, ...]
ROOT = Path(__file__).resolve().parents[1]
VARIABLES = 308
PARENT_CLAUSES = 5_847_264
NEW_CLAUSES = 4
CHILD_CLAUSES = 5_847_268
CHILD_SHA256 = "98f58d8cf71feb1201f30956e762f3a5b22acfe09f350070dfa7f83bed8640b3"
CHILD_BYTES = 291_621_474
PARENT_SHA256 = "e2236eaa12b10117c0540b2ea545f177e5070b6d96a0ac96668a733fe501eae5"
MODEL_SHA256 = "1a6aacbd6a0d9049af1ad578efd69d23f3e71be982624cb418488785366e7dd0"
MODEL_ASSIGNMENT_SHA256 = "e42efb4b0526e98af2c1dae7614710d10f8a7592e7e80c7cd9967af0c15d73d8"
MODEL_JOB_ID = "acc2df0f-b219-46d7-9d3b-a926fc2465a3"
MODEL_MANIFEST_SHA256 = "65a4a829a6d17629afc72aeb51bc1acdec21e8d7c474f909ed9cbbf0ecc55dea"
MODEL_COMPLETION_IDENTITY = "688ec6aa91d750b45b89c96061dd4355bfe7bbcc25e56a70571d64b88e529e58"
LEAN_ROOT_SHA256 = "f92dc54ba64350a004bd8fa9a60aa9fe645bbc01c96b2655b21cf1735830c1b7"
LEAN_EXPORT_SHA256 = "64fcdd40d2b8ba0edf75117971564581ab3cd7e0380ba10f9f8bee083fe22a52"
SPEC_SCHEMA = "p97-exact17-child37-export-spec/v1"
ATail = ROOT / "lean/Erdos9796Proof/P97/ATail"
LEAN_ROOT_PATH = str(ATail / "BlockerVExactSeventeenThirtySixthModelRefinements.lean")
LEAN_EXPORT_PATH = str(ATail / "BlockerVExactSeventeenThirtySixthModelRefinementsExport.lean")
PARENT_PATH = str(ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-sixth-root-thirty-fifth-model-refinements.cnf")
CHILD_PATH = str(ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-seventh-root-thirty-sixth-model-refinements.cnf")
MODEL_PATH = str(ROOT / "scratch/exact17-lean-to-sat/piqd-child36-core1-custody-model.json")
RECEIPT_PATH = str(ROOT / "scratch/exact17-lean-to-sat/child37-export-receipt.json")

SUFFIX: tuple[Clause, ...] = (
    (-307, -9, -3, -281, -284, -267, -258),
    (-307, -240, -241, -206, -210, -125, -122),
    (-308, -9, -3, -281, -284, -267, -258),
    (-308, -240, -241, -155, -159, -125, -122),
)


class UnprovisionedError(ValueError):
    pass


@dataclass(frozen=True)
class ExportSpec:
    variables: int = VARIABLES
    parent_clauses: int = PARENT_CLAUSES
    new_clauses: int = NEW_CLAUSES
    parent_sha256: str = PARENT_SHA256
    child_sha256: str | None = CHILD_SHA256
    child_bytes: int | None = CHILD_BYTES
    model_sha256: str = MODEL_SHA256
    publication_state: str = "PROVISIONED"
    schema: str = SPEC_SCHEMA
    lean_root_path: str = LEAN_ROOT_PATH
    lean_export_path: str = LEAN_EXPORT_PATH
    parent_path: str = PARENT_PATH
    child_path: str = CHILD_PATH
    model_path: str = MODEL_PATH
    receipt_path: str = RECEIPT_PATH
    lean_root_sha256: str | None = LEAN_ROOT_SHA256
    lean_export_sha256: str | None = LEAN_EXPORT_SHA256

    @property
    def child_clauses(self) -> int:
        return self.parent_clauses + self.new_clauses

    @property
    def provisioned(self) -> bool:
        return self.publication_state == "PROVISIONED" and self.child_sha256 is not None and self.child_bytes is not None


PRODUCTION_SPEC = ExportSpec()


def _is_sha(value: object) -> bool:
    return type(value) is str and len(value) == 64 and all(c in "0123456789abcdef" for c in value)


def validate_spec(spec: ExportSpec, *, require_source_pins: bool = False) -> None:
    if not isinstance(spec, ExportSpec) or spec.schema != SPEC_SCHEMA:
        raise TypeError("authenticated child37 ExportSpec is required")
    if (spec.variables, spec.parent_clauses, spec.new_clauses) != (VARIABLES, PARENT_CLAUSES, NEW_CLAUSES):
        raise ValueError("child37 dimension contract drifted")
    if spec.parent_sha256 != PARENT_SHA256 or spec.model_sha256 != MODEL_SHA256:
        raise ValueError("child37 parent/model pin drifted")
    if spec.provisioned and CHILD_SHA256 is not None and (spec.child_sha256, spec.child_bytes) != (CHILD_SHA256, CHILD_BYTES):
        raise ValueError("child37 provisioned artifact pin drifted")
    for name in ("parent_sha256", "model_sha256"):
        if not _is_sha(getattr(spec, name)):
            raise TypeError(f"{name} must be a lowercase SHA-256")
    for name in ("child_sha256", "lean_root_sha256", "lean_export_sha256"):
        value = getattr(spec, name)
        if value is not None and not _is_sha(value):
            raise TypeError(f"{name} must be a lowercase SHA-256 or null")
    if spec.publication_state not in {"PROVISIONED", "UNPROVISIONED"}:
        raise ValueError("invalid publication_state")
    expected = {"lean_root_path": LEAN_ROOT_PATH, "lean_export_path": LEAN_EXPORT_PATH, "parent_path": PARENT_PATH, "child_path": CHILD_PATH, "model_path": MODEL_PATH, "receipt_path": RECEIPT_PATH}
    for name, path in expected.items():
        if getattr(spec, name) != path or not os.path.isabs(path):
            raise ValueError(f"{name} is not the authenticated child37 path")
    if require_source_pins and any(getattr(spec, name) is None for name in ("lean_root_sha256", "lean_export_sha256")):
        raise UnprovisionedError("child37 source pins are incomplete")


def sha256_file(path: Path) -> str:
    before = os.lstat(path)
    descriptor = os.open(path, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0))
    try:
        opened = os.fstat(descriptor)
        identity = lambda x: (x.st_dev, x.st_ino, x.st_mode, x.st_nlink, x.st_size, x.st_mtime_ns, x.st_ctime_ns)
        if not stat.S_ISREG(opened.st_mode) or identity(before) != identity(opened):
            raise ValueError(f"not a stable regular file: {path}")
        digest = hashlib.sha256()
        while block := os.read(descriptor, 1024 * 1024):
            digest.update(block)
        if identity(opened) != identity(os.fstat(descriptor)) or identity(opened) != identity(os.lstat(path)):
            raise ValueError(f"file changed while hashing: {path}")
        return digest.hexdigest()
    finally:
        os.close(descriptor)


def validate_sources(spec: ExportSpec = PRODUCTION_SPEC) -> None:
    validate_spec(spec, require_source_pins=True)
    for path, expected in ((Path(spec.lean_root_path), spec.lean_root_sha256), (Path(spec.lean_export_path), spec.lean_export_sha256)):
        if expected is None or sha256_file(path) != expected:
            raise ValueError(f"authenticated Lean source drifted: {path}")


def strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def authenticated_model(path: Path, spec: ExportSpec = PRODUCTION_SPEC) -> dict[int, bool]:
    if sha256_file(path) != spec.model_sha256:
        raise ValueError("child36 model SHA-256 does not match authenticated pin")
    payload = json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=strict_object)
    if payload.get("schema") != "p97-exact17-child36-piqd-model/v3" or payload.get("job_id") != MODEL_JOB_ID:
        raise ValueError("child36 custody model identity drifted")
    if payload.get("cnf_sha256") != PARENT_SHA256 or payload.get("manifest_sha256") != MODEL_MANIFEST_SHA256 or payload.get("completion_identity_hash") != MODEL_COMPLETION_IDENTITY:
        raise ValueError("child36 custody model provenance drifted")
    replay = payload.get("replay", {})
    if replay != {"clauses_checked": PARENT_CLAUSES, "satisfies_all": True}:
        raise ValueError("child36 custody replay claim drifted")
    model = payload.get("model", {})
    assignment = model.get("assignment")
    if model.get("backend") != "cadical" or model.get("job_id") != MODEL_JOB_ID or model.get("num_assigned") != VARIABLES or model.get("result") != "SAT" or model.get("solver_profile") != "sat":
        raise ValueError("child36 model metadata drifted")
    if type(assignment) is not list or len(assignment) != VARIABLES or any(type(x) is not int or x == 0 or abs(x) > VARIABLES for x in assignment) or {abs(x) for x in assignment} != set(range(1, VARIABLES + 1)):
        raise ValueError("child36 assignment is not total")
    if model.get("model_sha256") not in (None, MODEL_ASSIGNMENT_SHA256):
        raise ValueError("child36 assignment hash drifted")
    return {abs(x): x > 0 for x in assignment}


def _header(handle: BinaryIO) -> tuple[int, int]:
    fields = handle.readline().decode("ascii").split()
    if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
        raise ValueError("malformed DIMACS header")
    return int(fields[2]), int(fields[3])


def _clause(line: bytes) -> Clause:
    values = tuple(map(int, line.decode("ascii").split()))
    if len(values) < 2 or values[-1] != 0 or any(x == 0 or abs(x) > VARIABLES for x in values[:-1]):
        raise ValueError("malformed DIMACS clause")
    return values[:-1]


def clause_satisfied(clause: Clause, assignment: dict[int, bool]) -> bool:
    return any(assignment[abs(x)] == (x > 0) for x in clause)


def require_motivating_model_cut(suffix: tuple[Clause, ...], assignment: dict[int, bool]) -> tuple[int, ...]:
    cut = tuple(i for i, clause in enumerate(suffix, 1) if not clause_satisfied(clause, assignment))
    if not cut:
        raise ValueError("child37 suffix does not reject authenticated child36 assignment")
    return cut


def validate_export(parent_path: Path, child_path: Path, model_path: Path, *, spec: ExportSpec = PRODUCTION_SPEC, allow_unprovisioned: bool = False) -> dict[str, Any]:
    validate_spec(spec)
    if not spec.provisioned and not allow_unprovisioned:
        raise UnprovisionedError("child37 export is UNPROVISIONED")
    validate_sources(spec)
    assignment = authenticated_model(model_path, spec)
    if sha256_file(parent_path) != spec.parent_sha256:
        raise ValueError("parent SHA-256 does not match authenticated child36 pin")
    suffix_keys = {frozenset(x) for x in SUFFIX}
    if len(suffix_keys) != NEW_CLAUSES:
        raise ValueError("duplicate semantic child37 suffix")
    suffix_lines: list[bytes] = []
    with parent_path.open("rb") as parent, child_path.open("rb") as child:
        if _header(parent) != (VARIABLES, PARENT_CLAUSES) or _header(child) != (VARIABLES, CHILD_CLAUSES):
            raise ValueError("unexpected DIMACS header")
        for index in range(PARENT_CLAUSES):
            left, right = parent.readline(), child.readline()
            if not left or left != right:
                raise ValueError(f"parent-prefix mismatch at clause {index + 1}")
            if frozenset(_clause(left)) in suffix_keys:
                raise ValueError("semantic child37 suffix clause already occurs in parent")
            if not clause_satisfied(_clause(left), assignment):
                raise ValueError("authenticated child36 assignment does not satisfy parent CNF")
        if parent.readline():
            raise ValueError("parent file contains extra clauses")
        for index, expected in enumerate(SUFFIX):
            line = child.readline()
            if not line or _clause(line) != expected:
                raise ValueError(f"child37 suffix mismatch at clause {index + 1}")
            suffix_lines.append(line)
        if child.readline():
            raise ValueError("child file contains extra clauses")
    cut = require_motivating_model_cut(SUFFIX, assignment)
    digest = sha256_file(child_path)
    if spec.child_sha256 is not None and digest != spec.child_sha256:
        raise ValueError("child SHA-256 does not match authenticated pin")
    if spec.child_bytes is not None and child_path.stat().st_size != spec.child_bytes:
        raise ValueError("child byte count does not match authenticated pin")
    return {"schema": "p97-exact17-child37-export-validation/v1", "status": "PASS" if spec.provisioned else "UNPROVISIONED", "publication_state": spec.publication_state, "parent": {"sha256": spec.parent_sha256, "clauses": PARENT_CLAUSES}, "child": {"sha256": digest, "bytes": child_path.stat().st_size, "variables": VARIABLES, "clauses": CHILD_CLAUSES}, "model": {"sha256": spec.model_sha256, "job_id": MODEL_JOB_ID, "parent_replay_exact": True}, "ordered_suffix_sha256": hashlib.sha256(b"".join(suffix_lines)).hexdigest(), "ordered_suffix_exact": True, "motivating_model_cut_suffix_indices": list(cut), "source_clause_families": ["child36SixHitCancellationClauses"]}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--parent", type=Path, default=Path(PARENT_PATH))
    parser.add_argument("--child", type=Path, default=Path(CHILD_PATH))
    parser.add_argument("--model", type=Path, default=Path(MODEL_PATH))
    args = parser.parse_args()
    print(json.dumps(validate_export(args.parent, args.child, args.model), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
