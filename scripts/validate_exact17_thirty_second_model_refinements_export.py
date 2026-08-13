"""Validate the source-faithful exact-17 child33 DIMACS export.

The Lean definition ``extendedThirtySecondModelRefinementsCnf`` is authoritative:
this checker only authenticates its byte-identical child32 prefix and the eight
source-valid suffix clauses (four two-circle clauses followed by four canonical
Kalmanson clauses).  The convex-five diagnostic candidate is intentionally not
part of this contract.  The production spec pins the independently replayed
Lean rendering exactly.
"""

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
Hit = tuple[int, int]

ROOT = Path(__file__).resolve().parents[1]
VARIABLES = 308
PARENT_CLAUSES = 5_847_240
NEW_CLAUSES = 8
CHILD_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES
PARENT_SHA256 = "c325d3eedda8fe81e3d1c1d70645024f5b9ea8c36c20ca5cd1896f0934296a7d"
SPEC_SCHEMA = "p97-exact17-child33-export-spec/v2"
LEAN_ROOT_PATH = str(ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtySecondModelRefinements.lean")
LEAN_EXPORT_PATH = str(ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtySecondModelRefinementsExport.lean")
TWO_CIRCLE_PATH = str(ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtySecondTwoCircleRefinement.lean")
KALMANSON_PATH = str(ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtySecondKalmansonRefinement.lean")
PARENT_PATH = str(ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-second-root-thirty-first-model-refinements.cnf")
CHILD_PATH = str(ROOT / "scratch/exact17-lean-to-sat/exact17-thirty-third-root-thirty-second-model-refinements.cnf")
RECEIPT_PATH = str(ROOT / "scratch/exact17-lean-to-sat/child33-export-receipt.json")
NAMED_ORDER_VARIABLES = (307, 308)
ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
TWO_CIRCLE_MOTIF: tuple[Hit, ...] = (
    (15, 1), (15, 2), (1, 2), (1, 15), (9, 1), (9, 15),
)
KALMANSON_MOTIF: tuple[Hit, ...] = (
    (0, 13), (0, 16), (3, 15), (3, 16), (7, 13), (7, 15),
)


class UnprovisionedError(ValueError):
    """The candidate is structurally inspectable but not production-pinned."""


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
    two_circle_path: str = TWO_CIRCLE_PATH
    kalmanson_path: str = KALMANSON_PATH
    lean_root_sha256: str | None = None
    lean_export_sha256: str | None = None
    two_circle_sha256: str | None = None
    kalmanson_sha256: str | None = None
    parent_path: str = PARENT_PATH
    child_path: str = CHILD_PATH
    receipt_path: str = RECEIPT_PATH

    @property
    def child_clauses(self) -> int:
        return self.parent_clauses + self.new_clauses

    @property
    def provisioned(self) -> bool:
        return (
            self.publication_state == "PROVISIONED"
            and self.child_sha256 is not None
            and self.child_bytes is not None
        )

    @property
    def fully_authenticated(self) -> bool:
        return self.provisioned and all(
            value is not None
            for value in (
                self.lean_root_sha256,
                self.lean_export_sha256,
                self.two_circle_sha256,
                self.kalmanson_sha256,
            )
        )


PRODUCTION_SPEC = ExportSpec(
    variables=VARIABLES,
    parent_clauses=PARENT_CLAUSES,
    new_clauses=NEW_CLAUSES,
    parent_sha256=PARENT_SHA256,
    child_sha256="775eb42db7bdac52eb7e5609a1cf33111c953d26f4cee9c8d95bde3b468563b9",
    child_bytes=291_620_468,
    publication_state="PROVISIONED",
    lean_root_sha256="2aa046ed0b6948af9c65795229492f573b5816558352aaa6ccd813ed370f4805",
    lean_export_sha256="54aa51734320a3b424a828e7187bf93f176e655949addbb02892a1a4dce219da",
    two_circle_sha256="8f0b6821d34e78b3bb8ff3b9b3d0a72c7c7f4b8c0c3484e3a4456310dc463c63",
    kalmanson_sha256="44e5685bfeb425dd43eecea95aa93a7eb5a638591cbd925a41e914028cbfdd0f",
)


def validate_spec(spec: ExportSpec, *, require_source_pins: bool = False) -> None:
    """Reject malformed or unauthenticated export specifications."""
    if not all(hasattr(spec, name) for name in ("variables", "parent_clauses", "new_clauses", "parent_sha256", "publication_state")):
        raise TypeError("ExportSpec is required")
    if spec.schema != SPEC_SCHEMA:
        raise ValueError("unsupported child33 ExportSpec schema")
    for name in ("variables", "parent_clauses", "new_clauses"):
        value = getattr(spec, name)
        if type(value) is not int or value <= 0:
            raise TypeError(f"{name} must be a positive integer")
    for name in ("parent_sha256", "child_sha256"):
        value = getattr(spec, name)
        if value is not None and (type(value) is not str or len(value) != 64 or any(c not in "0123456789abcdef" for c in value)):
            raise TypeError(f"{name} must be a lowercase SHA-256 string or null")
    for name in ("child_bytes",):
        value = getattr(spec, name)
        if value is not None and (type(value) is not int or value <= 0):
            raise TypeError(f"{name} must be a positive integer or null")
    if spec.publication_state not in {"PROVISIONED", "UNPROVISIONED"}:
        raise ValueError("invalid publication_state")
    for name in ("lean_root_path", "lean_export_path", "two_circle_path", "kalmanson_path", "parent_path", "child_path", "receipt_path"):
        value = getattr(spec, name)
        if type(value) is not str or not os.path.isabs(value):
            raise TypeError(f"{name} must be an absolute path string")
    for name in ("lean_root_sha256", "lean_export_sha256", "two_circle_sha256", "kalmanson_sha256"):
        value = getattr(spec, name)
        if value is not None and (type(value) is not str or len(value) != 64 or any(c not in "0123456789abcdef" for c in value)):
            raise TypeError(f"{name} must be a lowercase SHA-256 string or null")
    if require_source_pins and not spec.fully_authenticated:
        raise UnprovisionedError("child33 source and child pins are incomplete")


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0)
    descriptor = os.open(path, flags)
    try:
        if not stat.S_ISREG(os.fstat(descriptor).st_mode):
            raise ValueError(f"not a regular file: {path}")
        with os.fdopen(descriptor, "rb", closefd=False) as handle:
            for block in iter(lambda: handle.read(1024 * 1024), b""):
                digest.update(block)
    finally:
        os.close(descriptor)
    return digest.hexdigest()


def strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _read_header(handle: BinaryIO, path: Path) -> tuple[int, int]:
    try:
        fields = handle.readline().decode("ascii").split()
    except UnicodeDecodeError as error:
        raise ValueError(f"non-ASCII DIMACS header: {path}") from error
    if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
        raise ValueError(f"malformed DIMACS header: {path}")
    try:
        return int(fields[2]), int(fields[3])
    except ValueError as error:
        raise ValueError(f"non-integer DIMACS header: {path}") from error


def _parse_clause(line: bytes, *, variables: int, context: str) -> Clause:
    try:
        fields = tuple(map(int, line.decode("ascii").split()))
    except (UnicodeDecodeError, ValueError) as error:
        raise ValueError(f"malformed DIMACS clause: {context}") from error
    if not fields or fields[-1] != 0:
        raise ValueError(f"missing clause terminator: {context}")
    if len(fields) == 1:
        raise ValueError(f"empty clause: {context}")
    clause = fields[:-1]
    if any(literal == 0 or abs(literal) > variables for literal in clause):
        raise ValueError(f"literal outside DIMACS range: {context}")
    return clause


def hit_var(center: int, point: int) -> int:
    return 1 + center * 17 + point


def expected_clause(
    order_index: int,
    order: tuple[int, ...],
    motif: tuple[Hit, ...],
    *,
    reverse: bool,
) -> Clause:
    def oriented_label(position: int) -> int:
        return order[16 - position] if reverse else order[position]

    return (
        -NAMED_ORDER_VARIABLES[order_index],
        *( -hit_var(oriented_label(center), oriented_label(point))
           for center, point in motif),
    )


def expected_suffix() -> tuple[Clause, ...]:
    clauses: list[Clause] = []
    for motif in (TWO_CIRCLE_MOTIF, KALMANSON_MOTIF):
        for order_index, order in enumerate(ORDERS):
            for reverse in (False, True):
                clauses.append(expected_clause(order_index, order, motif, reverse=reverse))
    return tuple(clauses)


def _suffix_digest(suffix_lines: list[bytes]) -> str:
    digest = hashlib.sha256()
    for line in suffix_lines:
        digest.update(line)
    return digest.hexdigest()


def _semantic_clause_key(clause: Clause) -> frozenset[int]:
    return frozenset(clause)


def validate_export(
    parent_path: Path,
    child_path: Path,
    *,
    spec: ExportSpec = PRODUCTION_SPEC,
    allow_unprovisioned: bool = False,
) -> dict[str, Any]:
    """Strictly validate the child prefix, ordered suffix, and immutable pins."""
    validate_spec(spec)
    if not spec.provisioned and not allow_unprovisioned:
        raise UnprovisionedError(
            "child33 export is UNPROVISIONED; live child SHA/byte pins are absent"
        )
    if not parent_path.is_file() or not child_path.is_file():
        raise FileNotFoundError("parent and child DIMACS files are required")
    parent_sha256 = sha256_file(parent_path)
    if parent_sha256 != spec.parent_sha256:
        raise ValueError("parent SHA-256 does not match the authenticated child32 pin")
    expected = expected_suffix()
    observed_suffix: list[bytes] = []
    parent_duplicate_literal_clauses = 0
    parent_duplicate_semantic_clauses = 0
    seen_parent: set[frozenset[int]] = set()
    seen_suffix: set[frozenset[int]] = set()
    with parent_path.open("rb") as parent, child_path.open("rb") as child:
        if _read_header(parent, parent_path) != (spec.variables, spec.parent_clauses):
            raise ValueError("unexpected parent DIMACS header")
        if _read_header(child, child_path) != (spec.variables, spec.child_clauses):
            raise ValueError("unexpected child DIMACS header")
        for index in range(spec.parent_clauses):
            parent_line = parent.readline()
            child_line = child.readline()
            if not parent_line or parent_line != child_line:
                raise ValueError(f"parent-prefix mismatch at clause {index + 1}")
            clause = _parse_clause(parent_line, variables=spec.variables, context=f"parent/{index + 1}")
            if len(set(clause)) != len(clause):
                parent_duplicate_literal_clauses += 1
            parent_key = _semantic_clause_key(clause)
            if parent_key in seen_parent:
                parent_duplicate_semantic_clauses += 1
            seen_parent.add(parent_key)
        if parent.readline():
            raise ValueError("parent file contains extra clauses")
        for index, expected_clause_value in enumerate(expected):
            line = child.readline()
            if not line:
                raise ValueError(f"truncated child33 suffix at clause {index + 1}")
            observed = _parse_clause(line, variables=spec.variables, context=f"suffix/{index + 1}")
            if observed != expected_clause_value:
                raise ValueError(
                    f"suffix mismatch at clause {index + 1}: {observed} != {expected_clause_value}"
                )
            observed_key = _semantic_clause_key(observed)
            if observed_key in seen_parent:
                raise ValueError(f"suffix duplicates a parent clause at {index + 1}")
            if observed_key in seen_suffix:
                raise ValueError(f"duplicate semantic suffix clause at {index + 1}")
            seen_suffix.add(observed_key)
            observed_suffix.append(line)
        if child.readline():
            raise ValueError("child file contains extra clauses")
    child_sha256 = sha256_file(child_path)
    child_bytes = child_path.stat().st_size
    if spec.child_sha256 is not None and child_sha256 != spec.child_sha256:
        raise ValueError("child SHA-256 does not match the authenticated pin")
    if spec.child_bytes is not None and child_bytes != spec.child_bytes:
        raise ValueError("child byte count does not match the authenticated pin")
    return {
        "schema": "p97-exact17-thirty-second-model-refinements-export-validation/v1",
        "status": "PASS" if spec.provisioned else "UNPROVISIONED",
        "publication_state": spec.publication_state,
        "parent": {"path": str(parent_path.resolve()), "sha256": parent_sha256, "clauses": spec.parent_clauses},
        "child": {"path": str(child_path.resolve()), "sha256": child_sha256, "bytes": child_bytes, "variables": spec.variables, "clauses": spec.child_clauses},
        "new_clauses": spec.new_clauses,
        "ordered_suffix_sha256": _suffix_digest(observed_suffix),
        "ordered_suffix_exact": True,
        "source_clause_families": ["child32TwoCircleClauses", "canonicalClauses"],
        "parent_duplicate_literal_clauses": parent_duplicate_literal_clauses,
        "parent_duplicate_semantic_clauses": parent_duplicate_semantic_clauses,
        "duplicate_clauses": 0,
    }


def _write_new_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("x", encoding="utf-8") as handle:
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
        handle.flush()
        os.fsync(handle.fileno())
    directory_fd = os.open(path.parent, os.O_RDONLY)
    try:
        os.fsync(directory_fd)
    finally:
        os.close(directory_fd)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--parent", type=Path, required=True)
    parser.add_argument("--child", type=Path, required=True)
    parser.add_argument("--report", type=Path)
    parser.add_argument("--inspect-unprovisioned", action="store_true")
    args = parser.parse_args()
    result = validate_export(
        args.parent.resolve(), args.child.resolve(),
        allow_unprovisioned=args.inspect_unprovisioned,
    )
    if args.report:
        _write_new_json(args.report.resolve(), result)
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
