"""Fail-closed validator for the unprovisioned exact-17 Child40 boundary."""

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
PARENT_CLAUSES = 5_847_388
NEW_CLAUSES: int | None = 196
CHILD_CLAUSES: int | None = 5_847_584
PARENT_SHA256 = "989348e8a0d2288df6a80f36e56ed4e5771ef250dc10f4d4aeeb991a571a8a8a"
MODEL_SHA256 = "66afb43a0b6f9d686a800239c616d006f0fed5c7d681bf6d2b5cd22dd8a501e1"
MODEL_JOB_ID = "68cfcaf6-1a90-466e-8fc3-d1c3ffc8e377"
MODEL_MANIFEST_SHA256 = "275a61b6febdc1ca5104ebe932919c24e2226f794e68b22caf02ffcbb076c83d"
MODEL_COMPLETION_IDENTITY = "6578714101b772740051c14bd0935b6e4830eb8a14b3febdb3c8b2c753a10f3f"
ATail = ROOT / "lean/Erdos9796Proof/P97/ATail"
LEAN_ROOT_PATH = str(ATail / "BlockerVExactSeventeenThirtyNinthModelRefinements.lean")
LEAN_EXPORT_PATH = str(ATail / "BlockerVExactSeventeenThirtyNinthModelRefinementsExport.lean")
PARENT_PATH = str(ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-ninth-root-thirty-eighth-model-refinements.cnf")
CHILD_PATH = str(ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-fortieth-root-thirty-ninth-model-refinements.cnf")
MODEL_PATH = str(ROOT / "scratch/exact17-lean-to-sat/piqd-child39-core1-custody-model.json")
RECEIPT_PATH = str(ROOT / "scratch/exact17-lean-to-sat/child40-export-receipt.json")
SPEC_SCHEMA = "p97-exact17-child40-export-spec/v1"

LEAN_ROOT_SHA256 = "76f993c6335f39e913f187be26118307025c58feb22e47f5e8284518625f107e"
LEAN_EXPORT_SHA256 = "e5634ee294b4ae348cf553ee186777d48a2e32ff2407ab1caa83547c08c0a632"
CHILD_SHA256: str | None = None
CHILD_BYTES: int | None = None
EXPECTED_MODEL_CUT_SUFFIX_INDICES = (7, 23, 39, 47, 67, 75, 79, 83, 87, 95, 99, 103, 107, 115, 119, 123, 127, 131, 135, 139, 143, 147, 151, 155, 159, 163, 167, 171, 175, 179, 183, 187, 191, 195)

# This byte order is copied from the authoritative Lean exporter output.
SUFFIX: tuple[Clause, ...] = (
    (-307, -214, -219, -95, -100),
    (-307, -276, -273, -191, -188),
    (-308, -166, -168, -98, -100),
    (-308, -276, -273, -191, -188),
    (-307, -9, -16, -281, -284, -80, -84),
    (-307, -240, -246, -206, -210, -176, -178),
    (-308, -9, -16, -281, -284, -80, -84),
    (-308, -240, -246, -155, -159, -176, -178),
    (-307, -13, -16, -79, -84, -96, -98),
    (-307, -255, -246, -175, -178, -192, -204),
    (-308, -10, -16, -79, -84, -96, -95),
    (-308, -255, -246, -175, -178, -192, -204),
    (-307, -13, -4, -180, -174, -95, -98),
    (-307, -255, -248, -72, -78, -191, -204),
    (-308, -10, -4, -183, -174, -98, -95),
    (-308, -255, -251, -72, -81, -191, -204),
    (-307, -16, -4, -169, -155, -242, -240),
    (-307, -246, -248, -59, -60, -10, -9),
    (-308, -16, -4, -220, -206, -242, -240),
    (-308, -246, -251, -59, -60, -13, -9),
    (-307, -113, -105, -267, -258, -80, -79),
    (-307, -226, -224, -125, -122, -176, -175),
    (-308, -113, -105, -267, -258, -80, -79),
    (-308, -226, -224, -125, -122, -176, -175),
    (-307, -113, -105, -96, -98, -234, -224),
    (-307, -226, -224, -192, -204, -119, -105),
    (-308, -113, -105, -96, -95, -231, -224),
    (-308, -226, -224, -192, -204, -119, -105),
    (-307, -143, -141, -160, -155, -56, -53),
    (-307, -31, -28, -65, -60, -164, -162),
    (-308, -143, -141, -211, -206, -56, -53),
    (-308, -31, -28, -65, -60, -215, -213),
    (-307, -146, -141, -95, -98, -234, -226),
    (-307, -21, -28, -191, -204, -119, -113),
    (-308, -149, -141, -98, -95, -231, -226),
    (-308, -21, -28, -191, -204, -119, -113),
    (-307, -141, -142, -125, -133, -56, -65),
    (-307, -28, -29, -267, -262, -164, -160),
    (-308, -141, -142, -125, -133, -56, -65),
    (-308, -28, -29, -267, -262, -215, -211),
    (-307, -201, -202, -214, -219, -44, -48),
    (-307, -92, -86, -276, -273, -38, -41),
    (-308, -201, -202, -166, -168, -47, -48),
    (-308, -92, -86, -276, -273, -38, -41),
    (-307, -187, -174, -272, -257, -242, -240),
    (-307, -81, -78, -132, -128, -10, -9),
    (-308, -187, -174, -272, -257, -242, -240),
    (-308, -78, -81, -129, -128, -13, -9),
    (-307, -216, -214, -80, -79, -96, -95),
    (-307, -278, -276, -176, -175, -192, -191),
    (-308, -165, -166, -80, -79, -96, -98),
    (-308, -278, -276, -176, -175, -192, -191),
    (-307, -216, -219, -69, -80, -18, -32),
    (-307, -278, -273, -185, -176, -151, -137),
    (-308, -165, -168, -69, -80, -18, -32),
    (-308, -278, -273, -185, -176, -151, -137),
    (-307, -216, -219, -80, -79, -96, -100),
    (-307, -278, -273, -176, -175, -192, -188),
    (-308, -165, -168, -80, -79, -96, -100),
    (-308, -278, -273, -176, -175, -192, -188),
    (-307, -214, -219, -35, -44, -18, -32),
    (-307, -276, -273, -49, -38, -151, -137),
    (-308, -166, -168, -35, -47, -18, -32),
    (-308, -276, -273, -49, -38, -151, -137),
    (-307, -130, -133, -35, -48, -69, -79),
    (-307, -260, -262, -49, -41, -185, -175),
    (-308, -130, -133, -35, -48, -69, -79),
    (-308, -260, -262, -49, -41, -185, -175),
    (-307, -35, -44, -69, -79, -96, -95),
    (-307, -49, -38, -185, -175, -192, -191),
    (-308, -35, -47, -69, -79, -96, -98),
    (-308, -49, -38, -185, -175, -192, -191),
    (-307, -267, -258, -279, -284, -228, -224),
    (-307, -125, -122, -218, -210, -116, -105),
    (-308, -267, -258, -279, -284, -228, -224),
    (-308, -125, -122, -167, -159, -116, -105),
    (-307, -18, -22, -228, -226, -239, -245),
    (-307, -151, -147, -116, -113, -15, -14),
    (-308, -18, -22, -228, -226, -239, -245),
    (-308, -151, -147, -116, -113, -15, -14),
    (-307, -16, -4, -187, -174, -272, -257, -67, -53),
    (-307, -246, -248, -81, -78, -132, -128, -161, -162),
    (-308, -16, -4, -187, -174, -272, -257, -67, -53),
    (-308, -246, -251, -78, -81, -129, -128, -212, -213),
    (-307, -201, -202, -53, -65, -18, -32, -239, -240),
    (-307, -92, -86, -162, -160, -151, -137, -15, -9),
    (-308, -201, -202, -53, -65, -18, -32, -239, -240),
    (-308, -92, -86, -213, -211, -151, -137, -15, -9),
    (-307, -216, -219, -267, -257, -18, -32, -239, -240),
    (-307, -278, -273, -125, -128, -151, -137, -15, -9),
    (-308, -165, -168, -267, -257, -18, -32, -239, -240),
    (-308, -278, -273, -125, -128, -151, -137, -15, -9),
    (-307, -272, -257, -67, -53, -69, -84, -18, -34),
    (-307, -132, -128, -161, -162, -185, -178, -151, -149),
    (-308, -272, -257, -67, -53, -69, -84, -18, -34),
    (-308, -129, -128, -212, -213, -185, -178, -151, -146),
    (-307, -113, -105, -198, -201, -35, -48, -228, -224, -239, -245),
    (-307, -226, -224, -90, -92, -49, -41, -116, -105, -15, -14),
    (-308, -113, -105, -198, -201, -35, -48, -228, -224, -239, -245),
    (-308, -226, -224, -90, -92, -49, -41, -116, -105, -15, -14),
    (-307, -113, -119, -143, -141, -279, -284, -80, -79, -34, -22),
    (-307, -226, -234, -31, -28, -218, -210, -176, -175, -149, -147),
    (-308, -113, -119, -143, -141, -279, -284, -80, -79, -34, -22),
    (-308, -226, -231, -31, -28, -167, -159, -176, -175, -146, -147),
    (-307, -105, -108, -125, -133, -35, -48, -228, -224, -239, -245),
    (-307, -224, -233, -267, -262, -49, -41, -116, -105, -15, -14),
    (-308, -105, -108, -125, -133, -35, -48, -228, -224, -239, -245),
    (-308, -224, -233, -267, -262, -49, -41, -116, -105, -15, -14),
    (-307, -201, -202, -207, -219, -44, -48, -95, -98, -234, -224),
    (-307, -92, -86, -275, -273, -38, -41, -191, -204, -119, -105),
    (-308, -201, -202, -156, -168, -47, -48, -98, -95, -231, -224),
    (-308, -92, -86, -275, -273, -38, -41, -191, -204, -119, -105),
    (-307, -9, -16, -281, -284, -80, -84),
    (-307, -240, -246, -206, -210, -176, -178),
    (-308, -9, -16, -281, -284, -80, -84),
    (-308, -240, -246, -155, -159, -176, -178),
    (-307, -10, -16, -79, -84, -96, -95),
    (-307, -242, -246, -175, -178, -192, -191),
    (-308, -13, -16, -79, -84, -96, -98),
    (-308, -242, -246, -175, -178, -192, -191),
    (-307, -16, -4, -220, -206, -242, -240),
    (-307, -246, -248, -280, -281, -10, -9),
    (-308, -16, -4, -169, -155, -242, -240),
    (-308, -246, -251, -280, -281, -13, -9),
    (-307, -113, -105, -267, -258, -80, -79),
    (-307, -226, -224, -125, -122, -176, -175),
    (-308, -113, -105, -267, -258, -80, -79),
    (-308, -226, -224, -125, -122, -176, -175),
    (-307, -113, -105, -96, -95, -231, -224),
    (-307, -226, -224, -192, -191, -106, -105),
    (-308, -113, -105, -96, -98, -234, -224),
    (-308, -226, -224, -192, -191, -106, -105),
    (-307, -143, -141, -211, -206, -56, -53),
    (-307, -31, -28, -286, -281, -164, -162),
    (-308, -143, -141, -160, -155, -56, -53),
    (-308, -31, -28, -286, -281, -215, -213),
    (-307, -141, -142, -125, -133, -56, -65),
    (-307, -28, -29, -267, -262, -164, -160),
    (-308, -141, -142, -125, -133, -56, -65),
    (-308, -28, -29, -267, -262, -215, -211),
    (-307, -187, -174, -272, -257, -242, -240),
    (-307, -81, -78, -132, -128, -10, -9),
    (-308, -187, -174, -272, -257, -242, -240),
    (-308, -78, -81, -129, -128, -13, -9),
    (-307, -165, -168, -69, -80, -18, -32),
    (-307, -57, -52, -185, -176, -151, -137),
    (-308, -216, -219, -69, -80, -18, -32),
    (-308, -57, -52, -185, -176, -151, -137),
    (-307, -165, -168, -80, -79, -96, -100),
    (-307, -57, -52, -176, -175, -192, -188),
    (-308, -216, -219, -80, -79, -96, -100),
    (-308, -57, -52, -176, -175, -192, -188),
    (-307, -130, -133, -35, -48, -69, -79),
    (-307, -260, -262, -49, -41, -185, -175),
    (-308, -130, -133, -35, -48, -69, -79),
    (-308, -260, -262, -49, -41, -185, -175),
    (-307, -35, -47, -69, -79, -96, -98),
    (-307, -49, -51, -185, -175, -192, -204),
    (-308, -35, -44, -69, -79, -96, -95),
    (-308, -49, -51, -185, -175, -192, -204),
    (-307, -267, -258, -279, -284, -228, -224),
    (-307, -125, -122, -218, -210, -116, -105),
    (-308, -267, -258, -279, -284, -228, -224),
    (-308, -125, -122, -167, -159, -116, -105),
    (-307, -18, -22, -228, -226, -239, -245),
    (-307, -151, -147, -116, -113, -15, -14),
    (-308, -18, -22, -228, -226, -239, -245),
    (-308, -151, -147, -116, -113, -15, -14),
    (-307, -16, -4, -187, -174, -272, -257, -67, -53),
    (-307, -246, -248, -81, -78, -132, -128, -161, -162),
    (-308, -16, -4, -187, -174, -272, -257, -67, -53),
    (-308, -246, -251, -78, -81, -129, -128, -212, -213),
    (-307, -201, -202, -53, -65, -18, -32, -239, -240),
    (-307, -92, -86, -162, -160, -151, -137, -15, -9),
    (-308, -201, -202, -53, -65, -18, -32, -239, -240),
    (-308, -92, -86, -213, -211, -151, -137, -15, -9),
    (-307, -165, -168, -267, -257, -18, -32, -239, -240),
    (-307, -57, -52, -125, -128, -151, -137, -15, -9),
    (-308, -216, -219, -267, -257, -18, -32, -239, -240),
    (-308, -57, -52, -125, -128, -151, -137, -15, -9),
    (-307, -272, -257, -67, -53, -69, -84, -18, -34),
    (-307, -132, -128, -161, -162, -185, -178, -151, -149),
    (-308, -272, -257, -67, -53, -69, -84, -18, -34),
    (-308, -129, -128, -212, -213, -185, -178, -151, -146),
    (-307, -113, -105, -198, -201, -35, -48, -228, -224, -239, -245),
    (-307, -226, -224, -90, -92, -49, -41, -116, -105, -15, -14),
    (-308, -113, -105, -198, -201, -35, -48, -228, -224, -239, -245),
    (-308, -226, -224, -90, -92, -49, -41, -116, -105, -15, -14),
    (-307, -113, -119, -143, -141, -279, -284, -80, -79, -34, -22),
    (-307, -226, -234, -31, -28, -218, -210, -176, -175, -149, -147),
    (-308, -113, -119, -143, -141, -279, -284, -80, -79, -34, -22),
    (-308, -226, -231, -31, -28, -167, -159, -176, -175, -146, -147),
    (-307, -105, -108, -125, -133, -35, -48, -228, -224, -239, -245),
    (-307, -224, -233, -267, -262, -49, -41, -116, -105, -15, -14),
    (-308, -105, -108, -125, -133, -35, -48, -228, -224, -239, -245),
    (-308, -224, -233, -267, -262, -49, -41, -116, -105, -15, -14),
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
    publication_state: str = "UNPROVISIONED"
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
        raise TypeError("authenticated child40 ExportSpec is required")
    if (spec.variables, spec.parent_clauses) != (VARIABLES, PARENT_CLAUSES):
        raise ValueError("child40 parent dimension contract drifted")
    if spec.parent_sha256 != PARENT_SHA256 or spec.model_sha256 != MODEL_SHA256:
        raise ValueError("child40 parent/model pin drifted")
    if spec.provisioned and CHILD_SHA256 is not None and (spec.child_sha256, spec.child_bytes) != (CHILD_SHA256, CHILD_BYTES):
        raise ValueError("child40 provisioned artifact pin drifted")
    if spec.new_clauses is None or len(SUFFIX) != spec.new_clauses:
        raise UnprovisionedError("Child40 Lean-owned suffix cardinality/order is not pinned")
    if spec.child_clauses != PARENT_CLAUSES + spec.new_clauses:
        raise ValueError("child40 child clause count drifted")
    if spec.publication_state not in {"PROVISIONED", "UNPROVISIONED"}:
        raise ValueError("invalid publication_state")
    expected = {"lean_root_path": LEAN_ROOT_PATH, "lean_export_path": LEAN_EXPORT_PATH, "parent_path": PARENT_PATH, "child_path": CHILD_PATH, "model_path": MODEL_PATH, "receipt_path": RECEIPT_PATH}
    for name, path in expected.items():
        if getattr(spec, name) != path or not os.path.isabs(path):
            raise ValueError(f"{name} is not the authenticated child40 path")
    if require_source_pins and any(getattr(spec, name) is None for name in ("lean_root_sha256", "lean_export_sha256")):
        raise UnprovisionedError("child40 source pins are incomplete")


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
        raise ValueError("child39 model SHA-256 does not match authenticated pin")
    payload = json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=strict_object)
    if payload.get("schema") != "p97-exact17-child39-piqd-model/v3" or payload.get("job_id") != MODEL_JOB_ID:
        raise ValueError("child39 custody model identity drifted")
    if payload.get("cnf_sha256") != PARENT_SHA256 or payload.get("manifest_sha256") != MODEL_MANIFEST_SHA256 or payload.get("completion_identity_hash") != MODEL_COMPLETION_IDENTITY:
        raise ValueError("child39 custody model provenance drifted")
    if payload.get("replay") != {"clauses_checked": PARENT_CLAUSES, "satisfies_all": True}:
        raise ValueError("child39 custody replay claim drifted")
    model = payload.get("model", {})
    assignment = model.get("assignment")
    if model.get("backend") != "cadical" or model.get("job_id") != MODEL_JOB_ID or model.get("num_assigned") != VARIABLES or model.get("result") != "SAT" or model.get("solver_profile") != "sat":
        raise ValueError("child39 model metadata drifted")
    if type(assignment) is not list or len(assignment) != VARIABLES or any(type(x) is not int or x == 0 or abs(x) > VARIABLES for x in assignment) or {abs(x) for x in assignment} != set(range(1, VARIABLES + 1)):
        raise ValueError("child39 assignment is not total")
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
        raise ValueError("child40 suffix does not have the authenticated motivating-model cut")
    return cut


def validate_export(parent_path: Path, child_path: Path, model_path: Path, *, spec: ExportSpec = PRODUCTION_SPEC) -> dict[str, Any]:
    validate_spec(spec, require_source_pins=True)
    if not spec.provisioned:
        raise UnprovisionedError("child40 export is UNPROVISIONED")
    validate_sources(spec)
    assignment = authenticated_model(model_path, spec)
    if sha256_file(parent_path) != spec.parent_sha256:
        raise ValueError("parent SHA-256 does not match authenticated Child39 pin")
    suffix_lines: list[bytes] = []
    with parent_path.open("rb") as parent, child_path.open("rb") as child:
        if _header(parent) != (VARIABLES, PARENT_CLAUSES) or _header(child) != (VARIABLES, CHILD_CLAUSES):
            raise ValueError("unexpected DIMACS header")
        for index in range(PARENT_CLAUSES):
            left, right = parent.readline(), child.readline()
            if not left or left != right:
                raise ValueError(f"parent-prefix mismatch at clause {index + 1}")
            parent_clause = _clause(left)
            if not clause_satisfied(parent_clause, assignment):
                raise ValueError("authenticated Child39 assignment does not satisfy parent CNF")
        if parent.readline():
            raise ValueError("parent file contains extra clauses")
        for index, expected in enumerate(SUFFIX, 1):
            line = child.readline()
            if not line or _clause(line) != expected:
                raise ValueError(f"child40 suffix mismatch at clause {index}")
            suffix_lines.append(line)
        if child.readline():
            raise ValueError("child file contains extra clauses")
    cut = require_motivating_model_cut(SUFFIX, assignment)
    digest = sha256_file(child_path)
    if digest != spec.child_sha256 or child_path.stat().st_size != spec.child_bytes:
        raise ValueError("child40 artifact pin drifted")
    return {"schema": "p97-exact17-child40-export-validation/v1", "status": "PASS", "publication_state": spec.publication_state, "parent": {"sha256": spec.parent_sha256, "clauses": PARENT_CLAUSES}, "child": {"sha256": digest, "bytes": child_path.stat().st_size, "variables": VARIABLES, "clauses": CHILD_CLAUSES}, "model": {"sha256": spec.model_sha256, "job_id": MODEL_JOB_ID, "parent_replay_exact": True}, "ordered_suffix_sha256": hashlib.sha256(b"".join(suffix_lines)).hexdigest(), "ordered_suffix_exact": True, "motivating_model_cut_suffix_indices": list(cut), "source_clause_families": ["thirtyNinthModelRefinementClauses"]}


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
