"""Validate the Lean-owned exact-17 child35 DIMACS boundary."""

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
PARENT_CLAUSES = 5_847_256
NEW_CLAUSES = 4
CHILD_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES
PARENT_SHA256 = "ea8311540af709cf991c932c38e52f9767227cf55781508f2791b1dc42c4a819"
SPEC_SCHEMA = "p97-exact17-child35-export-spec/v1"
LEAN_ROOT_PATH = str(ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtyFourthModelRefinements.lean")
LEAN_EXPORT_PATH = str(ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtyFourthModelRefinementsExport.lean")
KALMANSON_PATH = str(ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtyThirdKalmansonRefinement.lean")
PERPENDICULAR_BISECTOR_PATH = str(ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtyFourthPerpendicularBisectorRefinement.lean")
PARENT_PATH = str(ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-fourth-root-thirty-third-model-refinements.cnf")
CHILD_PATH = str(ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-fifth-root-thirty-fourth-model-refinements.cnf")
RECEIPT_PATH = str(ROOT / "scratch/exact17-lean-to-sat/child35-export-receipt.json")
SUFFIX: tuple[Clause, ...] = (
    (-307, -114, -108, -198, -192, -193, -97, -96, -90),
    (-307, -227, -233, -90, -96, -97, -193, -192, -198),
    (-308, -114, -108, -198, -192, -193, -97, -96, -90),
    (-308, -227, -233, -90, -96, -97, -193, -192, -198),
)


class UnprovisionedError(ValueError):
    """The boundary is structurally inspectable but not production-pinned."""


@dataclass(frozen=True)
class ExportSpec:
    variables: int
    parent_clauses: int
    new_clauses: int
    parent_sha256: str
    child_sha256: str | None
    child_bytes: int | None
    publication_state: str
    schema: str = SPEC_SCHEMA
    lean_root_path: str = LEAN_ROOT_PATH
    lean_export_path: str = LEAN_EXPORT_PATH
    kalmanson_path: str = KALMANSON_PATH
    perpendicular_bisector_path: str = PERPENDICULAR_BISECTOR_PATH
    lean_root_sha256: str | None = None
    lean_export_sha256: str | None = None
    kalmanson_sha256: str | None = None
    perpendicular_bisector_sha256: str | None = None
    parent_path: str = PARENT_PATH
    child_path: str = CHILD_PATH
    receipt_path: str = RECEIPT_PATH

    @property
    def child_clauses(self) -> int:
        return self.parent_clauses + self.new_clauses

    @property
    def provisioned(self) -> bool:
        return self.publication_state == "PROVISIONED" and self.child_sha256 is not None and self.child_bytes is not None

    @property
    def fully_authenticated(self) -> bool:
        return self.provisioned and all(
            x is not None
            for x in (
                self.lean_root_sha256,
                self.lean_export_sha256,
                self.kalmanson_sha256,
                self.perpendicular_bisector_sha256,
            )
        )


PRODUCTION_SPEC = ExportSpec(
    variables=VARIABLES,
    parent_clauses=PARENT_CLAUSES,
    new_clauses=NEW_CLAUSES,
    parent_sha256=PARENT_SHA256,
    child_sha256="0ce510af7c5c653719cb2d1250c8577e9c48d244605182bfe8b91112c538787f",
    child_bytes=291_621_156,
    publication_state="PROVISIONED",
    lean_root_sha256="461a58e852d49849b3c4e8c1616e07307b95bb1b294dec5776ea85d8e5094ca5",
    lean_export_sha256="ef97f6190632b2f90113da403e0a6971d8d14be894f5c33eafa3d0d7228b69db",
    kalmanson_sha256="67b30f9a4718b1749229ef223482d43f130dc85264b062b29d8d35d2ebfba03d",
    perpendicular_bisector_sha256="dfc440da5753ecb0051cc4a9245ae27366a1dce55577c9e8171d692cd0966052",
)


def _sha(value: object, name: str) -> None:
    if value is not None and (type(value) is not str or len(value) != 64 or any(c not in "0123456789abcdef" for c in value)):
        raise TypeError(f"{name} must be a lowercase SHA-256 string or null")


def validate_spec(spec: ExportSpec, *, require_source_pins: bool = False) -> None:
    if not isinstance(spec, ExportSpec):
        raise TypeError("ExportSpec is required")
    if spec.schema != SPEC_SCHEMA:
        raise ValueError("unsupported child35 ExportSpec schema")
    for name in ("variables", "parent_clauses", "new_clauses"):
        if type(getattr(spec, name)) is not int or getattr(spec, name) <= 0:
            raise TypeError(f"{name} must be a positive integer")
    if spec.variables != VARIABLES or spec.parent_clauses != PARENT_CLAUSES or spec.new_clauses != NEW_CLAUSES:
        raise ValueError("child35 clause-count contract drifted")
    _sha(spec.parent_sha256, "parent_sha256")
    if spec.parent_sha256 != PARENT_SHA256:
        raise ValueError("child35 parent SHA-256 pin drifted")
    _sha(spec.child_sha256, "child_sha256")
    for name in ("lean_root_sha256", "lean_export_sha256", "kalmanson_sha256", "perpendicular_bisector_sha256"):
        _sha(getattr(spec, name), name)
    if spec.publication_state not in {"PROVISIONED", "UNPROVISIONED"}:
        raise ValueError("invalid publication_state")
    if spec.child_bytes is not None and (type(spec.child_bytes) is not int or spec.child_bytes <= 0):
        raise TypeError("child_bytes must be a positive integer or null")
    for name in ("lean_root_path", "lean_export_path", "kalmanson_path", "perpendicular_bisector_path", "parent_path", "child_path", "receipt_path"):
        value = getattr(spec, name)
        if type(value) is not str or not os.path.isabs(value):
            raise TypeError(f"{name} must be an absolute path string")
    expected_paths = {
        "lean_root_path": LEAN_ROOT_PATH,
        "lean_export_path": LEAN_EXPORT_PATH,
        "kalmanson_path": KALMANSON_PATH,
        "perpendicular_bisector_path": PERPENDICULAR_BISECTOR_PATH,
        "parent_path": PARENT_PATH,
        "child_path": CHILD_PATH,
        "receipt_path": RECEIPT_PATH,
    }
    for name, expected in expected_paths.items():
        if getattr(spec, name) != expected:
            raise ValueError(f"{name} is not the authenticated child35 path")
    if require_source_pins and not spec.fully_authenticated:
        raise UnprovisionedError("child35 source and child pins are incomplete")


def sha256_file(path: Path) -> str:
    before_path = os.lstat(path)
    descriptor = os.open(path, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0))
    try:
        before = os.fstat(descriptor)
        if not stat.S_ISREG(before.st_mode):
            raise ValueError(f"not a regular file: {path}")
        identity = lambda x: (x.st_dev, x.st_ino, x.st_mode, x.st_nlink, x.st_size, x.st_mtime_ns, x.st_ctime_ns)
        if identity(before_path) != identity(before):
            raise ValueError(f"{path} changed while opening")
        digest = hashlib.sha256()
        while block := os.read(descriptor, 1024 * 1024):
            digest.update(block)
        after = os.fstat(descriptor)
        after_path = os.lstat(path)
        if identity(before) != identity(after) or identity(before) != identity(after_path):
            raise ValueError(f"{path} changed while hashing")
        return digest.hexdigest()
    finally:
        os.close(descriptor)


def strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _header(handle: BinaryIO, path: Path) -> tuple[int, int]:
    fields = handle.readline().decode("ascii").split()
    if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
        raise ValueError(f"malformed DIMACS header: {path}")
    return int(fields[2]), int(fields[3])


def _clause(line: bytes, context: str) -> Clause:
    fields = tuple(map(int, line.decode("ascii").split()))
    if len(fields) < 2 or fields[-1] != 0 or any(x == 0 or abs(x) > VARIABLES for x in fields[:-1]):
        raise ValueError(f"malformed DIMACS clause: {context}")
    return fields[:-1]


def _suffix_digest(lines: list[bytes]) -> str:
    return hashlib.sha256(b"".join(lines)).hexdigest()


def validate_export(parent_path: Path, child_path: Path, *, spec: ExportSpec = PRODUCTION_SPEC, allow_unprovisioned: bool = False) -> dict[str, Any]:
    validate_spec(spec)
    if not spec.provisioned and not allow_unprovisioned:
        raise UnprovisionedError("child35 export is UNPROVISIONED; live child pins are absent")
    if not parent_path.is_file() or not child_path.is_file():
        raise FileNotFoundError("parent and child DIMACS files are required")
    if sha256_file(parent_path) != spec.parent_sha256:
        raise ValueError("parent SHA-256 does not match authenticated child34 pin")
    suffix_keys = {frozenset(clause) for clause in SUFFIX}
    if len(suffix_keys) != len(SUFFIX):
        raise ValueError("duplicate semantic clause in configured suffix")
    suffix_lines: list[bytes] = []
    with parent_path.open("rb") as parent, child_path.open("rb") as child:
        if _header(parent, parent_path) != (spec.variables, spec.parent_clauses) or _header(child, child_path) != (spec.variables, spec.child_clauses):
            raise ValueError("unexpected DIMACS header")
        for index in range(spec.parent_clauses):
            left, right = parent.readline(), child.readline()
            if not left or left != right:
                raise ValueError(f"parent-prefix mismatch at clause {index + 1}")
            clause = _clause(left, f"parent/{index + 1}")
            if frozenset(clause) in suffix_keys:
                raise ValueError("semantic suffix clause already occurs in parent")
        if parent.readline():
            raise ValueError("parent file contains extra clauses")
        suffix_seen: set[frozenset[int]] = set()
        for index, expected in enumerate(SUFFIX):
            line = child.readline()
            if not line or _clause(line, f"suffix/{index + 1}") != expected:
                raise ValueError(f"child35 suffix mismatch at clause {index + 1}")
            key = frozenset(expected)
            if key in suffix_seen:
                raise ValueError("duplicate semantic suffix clause")
            suffix_seen.add(key)
            suffix_lines.append(line)
        if child.readline():
            raise ValueError("child file contains extra clauses")
    child_sha256 = sha256_file(child_path)
    child_bytes = child_path.stat().st_size
    if spec.child_sha256 is not None and child_sha256 != spec.child_sha256:
        raise ValueError("child SHA-256 does not match authenticated pin")
    if spec.child_bytes is not None and child_bytes != spec.child_bytes:
        raise ValueError("child byte count does not match authenticated pin")
    return {
        "schema": "p97-exact17-child35-export-validation/v1",
        "status": "PASS" if spec.provisioned else "UNPROVISIONED",
        "publication_state": spec.publication_state,
        "parent": {"path": str(parent_path.resolve()), "sha256": spec.parent_sha256, "clauses": spec.parent_clauses},
        "child": {"path": str(child_path.resolve()), "sha256": child_sha256, "bytes": child_bytes, "variables": spec.variables, "clauses": spec.child_clauses},
        "new_clauses": spec.new_clauses,
        "ordered_suffix_sha256": _suffix_digest(suffix_lines),
        "ordered_suffix_exact": True,
        "source_clause_families": ["child34PerpBisectorClauses"],
        "duplicate_new_clauses": 0,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--parent", type=Path, required=True)
    parser.add_argument("--child", type=Path, required=True)
    parser.add_argument("--inspect-unprovisioned", action="store_true")
    args = parser.parse_args()
    print(json.dumps(validate_export(args.parent.resolve(), args.child.resolve(), allow_unprovisioned=args.inspect_unprovisioned), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
