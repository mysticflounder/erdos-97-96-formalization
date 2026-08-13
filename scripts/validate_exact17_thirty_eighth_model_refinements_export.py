"""Fail-closed validator for the unprovisioned exact-17 Child39 boundary."""

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
PARENT_CLAUSES = 5_847_276
NEW_CLAUSES: int | None = 112
CHILD_CLAUSES: int | None = 5_847_388
PARENT_SHA256 = "07b139089f2f9e11c03c8edfcdba58609a6f4c5be439e701888d975c182fe8d7"
MODEL_SHA256 = "6011d637ce337aacd0fe315b6e697333fb9a2b392083fd623a41b324c8f45ab6"
MODEL_JOB_ID = "aeaefb24-0f57-4b1f-9c62-644208e65977"
MODEL_MANIFEST_SHA256 = "6b74b75871940761fa346469b04c0ad17064a36b56766c5413c2ff6e048ad815"
MODEL_COMPLETION_IDENTITY = "8ff3e1da7572ea08eacdb063ac1136efe29aaaf261428905cfa49bc7e229fc4b"
ATail = ROOT / "lean/Erdos9796Proof/P97/ATail"
LEAN_ROOT_PATH = str(ATail / "BlockerVExactSeventeenThirtyEighthModelRefinements.lean")
LEAN_EXPORT_PATH = str(ATail / "BlockerVExactSeventeenThirtyEighthModelRefinementsExport.lean")
PARENT_PATH = str(ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-eighth-root-thirty-seventh-model-refinements.cnf")
CHILD_PATH = str(ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-ninth-root-thirty-eighth-model-refinements.cnf")
MODEL_PATH = str(ROOT / "scratch/exact17-lean-to-sat/piqd-child38-core1-custody-model.json")
RECEIPT_PATH = str(ROOT / "scratch/exact17-lean-to-sat/child39-export-receipt.json")
SPEC_SCHEMA = "p97-exact17-child39-export-spec/v1"

LEAN_ROOT_SHA256 = "61ed3d01276160838cc1047735eae35c8d69d022f6f9a4c84905a3781ccd7cd0"
LEAN_EXPORT_SHA256 = "b2f1552f4eb88677dffac24d60cab66556f86492cf8a4c6d085c48398759ffb7"
CHILD_SHA256 = "989348e8a0d2288df6a80f36e56ed4e5771ef250dc10f4d4aeeb991a571a8a8a"
CHILD_BYTES = 291_625_610
EXPECTED_MODEL_CUT_SUFFIX_INDICES = tuple(range(3, 112, 4))

# This byte order is copied from the authoritative Lean exporter output.
SUFFIX: tuple[Clause, ...] = (
    (-307, -9, -10, -281, -284, -233, -231), (-307, -240, -242, -206, -210, -108, -106),
    (-308, -9, -13, -281, -284, -233, -234), (-308, -240, -242, -155, -159, -108, -106),
    (-307, -10, -16, -62, -67, -96, -95), (-307, -242, -246, -158, -161, -192, -191),
    (-308, -13, -16, -62, -67, -96, -98), (-308, -242, -246, -209, -212, -192, -191),
    (-307, -16, -4, -154, -157, -52, -67), (-307, -246, -248, -66, -61, -168, -161),
    (-308, -16, -4, -205, -208, -52, -67), (-308, -246, -251, -66, -64, -219, -212),
    (-307, -16, -4, -157, -159, -135, -125), (-307, -246, -248, -61, -63, -263, -267),
    (-308, -16, -4, -208, -210, -135, -125), (-308, -246, -251, -64, -63, -263, -267),
    (-307, -16, -4, -157, -155, -220, -206), (-307, -246, -248, -61, -60, -280, -281),
    (-308, -16, -4, -208, -206, -169, -155), (-308, -246, -251, -64, -60, -280, -281),
    (-307, -113, -119, -96, -95, -231, -238), (-307, -226, -234, -192, -191, -106, -115),
    (-308, -113, -119, -96, -98, -234, -238), (-308, -226, -231, -192, -191, -106, -112),
    (-307, -113, -108, -143, -142, -58, -62), (-307, -226, -233, -31, -29, -167, -158),
    (-308, -113, -108, -143, -142, -58, -62), (-308, -226, -233, -31, -29, -218, -209),
    (-307, -105, -119, -187, -174, -71, -72), (-307, -224, -234, -81, -78, -173, -180),
    (-308, -105, -119, -187, -174, -71, -72), (-308, -224, -231, -78, -81, -173, -183),
    (-307, -119, -108, -187, -174, -157, -159), (-307, -234, -233, -81, -78, -61, -63),
    (-308, -119, -108, -187, -174, -208, -210), (-308, -231, -233, -78, -81, -64, -63),
    (-307, -119, -108, -159, -155, -272, -257), (-307, -234, -233, -63, -60, -132, -128),
    (-308, -119, -108, -210, -206, -272, -257), (-308, -231, -233, -63, -60, -129, -128),
    (-307, -143, -141, -35, -39, -52, -58), (-307, -31, -28, -49, -45, -168, -167),
    (-308, -143, -141, -35, -39, -52, -58), (-308, -31, -28, -49, -45, -219, -218),
    (-307, -143, -142, -154, -159, -52, -58), (-307, -31, -29, -66, -63, -168, -167),
    (-308, -143, -142, -205, -210, -52, -58), (-308, -31, -29, -66, -63, -219, -218),
    (-307, -143, -142, -159, -155, -211, -206), (-307, -31, -29, -63, -60, -286, -281),
    (-308, -143, -142, -210, -206, -160, -155), (-308, -31, -29, -63, -60, -286, -281),
    (-307, -149, -142, -183, -174, -157, -159), (-307, -34, -29, -85, -78, -61, -63),
    (-308, -146, -142, -180, -174, -208, -210), (-308, -34, -29, -85, -81, -64, -63),
    (-307, -141, -142, -154, -159, -35, -39), (-307, -28, -29, -66, -63, -49, -45),
    (-308, -141, -142, -205, -210, -35, -39), (-308, -28, -29, -66, -63, -49, -45),
    (-307, -141, -142, -157, -159, -21, -22), (-307, -28, -29, -61, -63, -146, -147),
    (-308, -141, -142, -208, -210, -21, -22), (-308, -28, -29, -64, -63, -149, -147),
    (-307, -196, -201, -281, -284, -250, -252), (-307, -87, -92, -206, -210, -6, -7),
    (-308, -196, -201, -281, -284, -250, -252), (-308, -87, -92, -155, -159, -6, -7),
    (-307, -196, -202, -279, -281, -24, -32), (-307, -87, -86, -218, -206, -150, -137),
    (-308, -196, -202, -279, -281, -24, -32), (-308, -87, -86, -167, -155, -150, -137),
    (-307, -187, -174, -157, -155, -272, -257), (-307, -81, -78, -61, -60, -132, -128),
    (-308, -187, -174, -208, -206, -272, -257), (-308, -78, -81, -64, -60, -129, -128),
    (-307, -154, -159, -125, -133, -69, -82), (-307, -66, -63, -267, -262, -185, -177),
    (-308, -205, -210, -125, -133, -69, -82), (-308, -66, -63, -267, -262, -185, -177),
    (-307, -159, -155, -125, -133, -240, -252), (-307, -63, -60, -267, -262, -9, -7),
    (-308, -210, -206, -125, -133, -240, -252), (-308, -63, -60, -267, -262, -9, -7),
    (-307, -220, -206, -135, -133, -240, -252), (-307, -280, -281, -263, -262, -9, -7),
    (-308, -169, -155, -135, -133, -240, -252), (-308, -280, -281, -263, -262, -9, -7),
    (-307, -130, -133, -52, -62, -69, -82), (-307, -260, -262, -168, -158, -185, -177),
    (-308, -130, -133, -52, -62, -69, -82), (-308, -260, -262, -219, -209, -185, -177),
    (-307, -35, -47, -52, -62, -96, -98), (-307, -49, -51, -168, -158, -192, -204),
    (-308, -35, -44, -52, -62, -96, -95), (-308, -49, -51, -219, -209, -192, -204),
    (-307, -35, -42, -279, -280, -52, -58), (-307, -49, -50, -218, -220, -168, -167),
    (-308, -35, -42, -279, -280, -52, -58), (-308, -49, -50, -167, -169, -219, -218),
    (-307, -35, -42, -284, -280, -239, -250), (-307, -49, -50, -210, -220, -15, -6),
    (-308, -35, -42, -284, -280, -239, -250), (-308, -49, -50, -159, -169, -15, -6),
    (-307, -35, -39, -69, -72, -21, -22), (-307, -49, -45, -185, -180, -146, -147),
    (-308, -35, -39, -69, -72, -21, -22), (-308, -49, -45, -185, -183, -149, -147),
    (-307, -279, -284, -52, -58, -239, -250), (-307, -218, -210, -168, -167, -15, -6),
    (-308, -279, -284, -52, -58, -239, -250), (-308, -167, -159, -219, -218, -15, -6),
)


class UnprovisionedError(ValueError):
    pass


@dataclass(frozen=True)
class ExportSpec:
    variables: int = VARIABLES
    parent_clauses: int = PARENT_CLAUSES
    new_clauses: int | None = NEW_CLAUSES
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
    def child_clauses(self) -> int | None:
        if self.new_clauses is None:
            return None
        return self.parent_clauses + self.new_clauses

    @property
    def provisioned(self) -> bool:
        return self.publication_state == "PROVISIONED" and self.new_clauses is not None and self.child_sha256 is not None and self.child_bytes is not None


PRODUCTION_SPEC = ExportSpec()


def validate_spec(spec: ExportSpec, *, require_source_pins: bool = False) -> None:
    if not isinstance(spec, ExportSpec) or spec.schema != SPEC_SCHEMA:
        raise TypeError("authenticated child39 ExportSpec is required")
    if (spec.variables, spec.parent_clauses) != (VARIABLES, PARENT_CLAUSES):
        raise ValueError("child39 parent dimension contract drifted")
    if spec.parent_sha256 != PARENT_SHA256 or spec.model_sha256 != MODEL_SHA256:
        raise ValueError("child39 parent/model pin drifted")
    if spec.provisioned and (spec.child_sha256, spec.child_bytes) != (CHILD_SHA256, CHILD_BYTES):
        raise ValueError("child39 provisioned artifact pin drifted")
    if spec.new_clauses is None or len(SUFFIX) != spec.new_clauses:
        raise UnprovisionedError("Child39 Lean-owned suffix cardinality/order is not pinned")
    if spec.child_clauses != PARENT_CLAUSES + spec.new_clauses:
        raise ValueError("child39 child clause count drifted")
    if spec.publication_state not in {"PROVISIONED", "UNPROVISIONED"}:
        raise ValueError("invalid publication_state")
    expected = {"lean_root_path": LEAN_ROOT_PATH, "lean_export_path": LEAN_EXPORT_PATH, "parent_path": PARENT_PATH, "child_path": CHILD_PATH, "model_path": MODEL_PATH, "receipt_path": RECEIPT_PATH}
    for name, path in expected.items():
        if getattr(spec, name) != path or not os.path.isabs(path):
            raise ValueError(f"{name} is not the authenticated child39 path")
    if require_source_pins and any(getattr(spec, name) is None for name in ("lean_root_sha256", "lean_export_sha256")):
        raise UnprovisionedError("child39 source pins are incomplete")


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


def _is_sha(value: object) -> bool:
    return isinstance(value, str) and len(value) == 64 and all(char in "0123456789abcdef" for char in value)


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
        raise ValueError("child38 model SHA-256 does not match authenticated pin")
    payload = json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=strict_object)
    if payload.get("schema") != "p97-exact17-child38-piqd-model/v3" or payload.get("job_id") != MODEL_JOB_ID:
        raise ValueError("child38 custody model identity drifted")
    if payload.get("cnf_sha256") != PARENT_SHA256 or payload.get("manifest_sha256") != MODEL_MANIFEST_SHA256 or payload.get("completion_identity_hash") != MODEL_COMPLETION_IDENTITY:
        raise ValueError("child38 custody model provenance drifted")
    if payload.get("replay") != {"clauses_checked": PARENT_CLAUSES, "satisfies_all": True}:
        raise ValueError("child38 custody replay claim drifted")
    model = payload.get("model", {})
    assignment = model.get("assignment")
    if model.get("backend") != "cadical" or model.get("job_id") != MODEL_JOB_ID or model.get("num_assigned") != VARIABLES or model.get("result") != "SAT" or model.get("solver_profile") != "sat":
        raise ValueError("child38 model metadata drifted")
    if type(assignment) is not list or len(assignment) != VARIABLES or any(type(x) is not int or x == 0 or abs(x) > VARIABLES for x in assignment) or {abs(x) for x in assignment} != set(range(1, VARIABLES + 1)):
        raise ValueError("child38 assignment is not total")
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
    cut = tuple(index for index, clause in enumerate(suffix, 1) if not clause_satisfied(clause, assignment))
    if cut != EXPECTED_MODEL_CUT_SUFFIX_INDICES:
        raise ValueError("child39 suffix does not have the authenticated motivating-model cut")
    return cut


def validate_export(parent_path: Path, child_path: Path, model_path: Path, *, spec: ExportSpec = PRODUCTION_SPEC) -> dict[str, Any]:
    validate_spec(spec, require_source_pins=True)
    if not spec.provisioned:
        raise UnprovisionedError("child39 export is UNPROVISIONED")
    validate_sources(spec)
    assignment = authenticated_model(model_path, spec)
    if sha256_file(parent_path) != spec.parent_sha256:
        raise ValueError("parent SHA-256 does not match authenticated Child38 pin")
    suffix_keys = {frozenset(clause) for clause in SUFFIX}
    suffix_lines: list[bytes] = []
    with parent_path.open("rb") as parent, child_path.open("rb") as child:
        if _header(parent) != (VARIABLES, PARENT_CLAUSES) or _header(child) != (VARIABLES, CHILD_CLAUSES):
            raise ValueError("unexpected DIMACS header")
        for index in range(PARENT_CLAUSES):
            left, right = parent.readline(), child.readline()
            if not left or left != right:
                raise ValueError(f"parent-prefix mismatch at clause {index + 1}")
            parent_clause = _clause(left)
            if frozenset(parent_clause) in suffix_keys:
                raise ValueError("semantic child39 suffix clause already occurs in parent")
            if not clause_satisfied(parent_clause, assignment):
                raise ValueError("authenticated Child38 assignment does not satisfy parent CNF")
        if parent.readline():
            raise ValueError("parent file contains extra clauses")
        for index, expected in enumerate(SUFFIX, 1):
            line = child.readline()
            if not line or _clause(line) != expected:
                raise ValueError(f"child39 suffix mismatch at clause {index}")
            suffix_lines.append(line)
        if child.readline():
            raise ValueError("child file contains extra clauses")
    cut = require_motivating_model_cut(SUFFIX, assignment)
    digest = sha256_file(child_path)
    if digest != spec.child_sha256 or child_path.stat().st_size != spec.child_bytes:
        raise ValueError("child39 artifact pin drifted")
    return {"schema": "p97-exact17-child39-export-validation/v1", "status": "PASS", "publication_state": spec.publication_state, "parent": {"sha256": spec.parent_sha256, "clauses": PARENT_CLAUSES}, "child": {"sha256": digest, "bytes": child_path.stat().st_size, "variables": VARIABLES, "clauses": CHILD_CLAUSES}, "model": {"sha256": spec.model_sha256, "job_id": MODEL_JOB_ID, "parent_replay_exact": True}, "ordered_suffix_sha256": hashlib.sha256(b"".join(suffix_lines)).hexdigest(), "ordered_suffix_exact": True, "motivating_model_cut_suffix_indices": list(cut), "source_clause_families": ["thirtyEighthModelRefinementClauses"]}


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
