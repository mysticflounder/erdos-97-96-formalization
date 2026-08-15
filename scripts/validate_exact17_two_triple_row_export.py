"""Independent validator for the exact-17 two-triple-row Lean export.

The checked suffix is the complete orbit of the obstruction
``B : A,C,D`` and ``F : A,D,E`` over both named orders, both orientations,
all cuts, and all increasing five-offset choices.  This module deliberately
does not import the Lean clause generator.
"""

from __future__ import annotations

import hashlib
import itertools
import os
import stat
from collections.abc import Iterator
from dataclasses import dataclass
from pathlib import Path
from typing import BinaryIO

ROOT = Path(__file__).resolve().parents[1]
PARENT_PATH = ROOT / "scratch/exact17-three-row-cycle-successor-20260814/root.cnf"
CHILD_PATH = ROOT / "scratch/exact17-two-triple-row-package/exact17-two-triple-row.cnf"
LEAN_ROOT_PATH = ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenTwoTripleRowRefinements.lean"
LEAN_EXPORT_PATH = ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenTwoTripleRowRefinementsExport.lean"
PARENT_LEAN_ROOT_PATH = ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThreeRowCycleRefinements.lean"
PARENT_LEAN_EXPORT_PATH = ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThreeRowCycleRefinementsExport.lean"

SOURCE_COMMIT = "ace544b63df7b7b928d1d063da3099ab55be7dc0"
PARENT_SOURCE_COMMIT = "2de8f51f52ee4836756101bc613a504b4c2a52d7"
LEAN_ROOT_SHA256 = "fcb9d23650ae8941cbc8d8d43ec42cd8785488d8fe5213ed24abdad90821d5cd"
LEAN_EXPORT_SHA256 = "4e73d420e09047481b97c87ed420e030638316c80fb2f1aa7576ffc10e9ade5e"
# Compatibility name used by the earlier governed export validators: this
# root is itself the newly committed source baseline.
SOURCE_BASELINE_SHA256 = LEAN_ROOT_SHA256
PARENT_LEAN_ROOT_SHA256 = "d377133da751ee94962c762bc28a6e953d9c9b00dd75cbe9992470660bc05786"
PARENT_LEAN_EXPORT_SHA256 = "070fbd689f26e9df034336f94f1e8fc867945bf69973411f316481bca91db9f0"
PARENT_SHA256 = "2870fa87246292872ef0668471b2dab8a708a7c1815e2223a385c2ecb8a8f869"
PARENT_BYTES = 322_685_712
PARENT_CLAUSES = 6_739_936
CHILD_SHA256 = "e9cc97f4e0c6d954902717ecb98e25a772bd54c1199a3bff0190ae2941e5ed51"
CHILD_BYTES = 333_016_856
CHILD_CLAUSES = 7_036_960
VARIABLES = 308
SUFFIX_SHA256 = "a5b098d8a298f6ea9d9d741a1c7a2eea43bef0bda1a24fdf8c92257523fde87f"
SUFFIX_BYTES = 10_331_144
SUFFIX_CLAUSES = 297_024
CLAUSES_PER_FAMILY = 297_024
VALIDATION_SCHEMA = "p97-exact17-two-triple-row-export-validation/v1"

_ORDER_TABLES = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)


@dataclass(frozen=True)
class FileIdentity:
    sha256: str
    bytes: int


def _open_regular_nofollow(path: Path) -> BinaryIO:
    descriptor = os.open(path, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0))
    info = os.fstat(descriptor)
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
        os.close(descriptor)
        raise ValueError(f"not an exclusive regular file: {path}")
    return os.fdopen(descriptor, "rb", closefd=True)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with _open_regular_nofollow(path) as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def _require_support(path: Path, expected: str, label: str) -> None:
    if sha256_file(path) != expected:
        raise ValueError(f"{label} SHA-256 drifted")


def _hit_var(center: int, point: int) -> int:
    value = 1 + center * 17 + point
    if not 1 <= value <= VARIABLES:
        raise ValueError("generated literal is outside the DIMACS variable range")
    return value


def _placed(order: int, reverse: bool, cut: int, offset: int) -> int:
    position = (cut - offset if reverse else cut + offset) % 17
    return _ORDER_TABLES[order][position]


def _hits(points: tuple[int, int, int, int, int, int]) -> tuple[tuple[int, int], ...]:
    """Return the exact ``B:{A,C,D}, F:{A,D,E}`` six-hit pattern."""

    a, b, c, d, e, f = points
    return ((b, a), (b, c), (b, d), (f, a), (f, d), (f, e))


def _clause_key(order: int, points: tuple[int, int, int, int, int, int]) -> tuple[int, ...]:
    return (-(307 + order),) + tuple(-_hit_var(center, point) for center, point in _hits(points))


def expected_suffix_lines() -> Iterator[bytes]:
    """Yield the exact Lean ``namedOrders × directions × labels × choices`` order."""

    for order in range(2):
        for reverse in (False, True):
            for cut in range(17):
                for offsets in reversed(tuple(itertools.combinations(range(1, 17), 5))):
                    points = tuple(_placed(order, reverse, cut, offset) for offset in (0, *offsets))
                    literals = _clause_key(order, points)
                    yield (" ".join(map(str, literals)) + " 0\n").encode("ascii")


def validate_export(
    parent_path: Path = PARENT_PATH,
    child_path: Path = CHILD_PATH,
    *,
    check_support: bool = True,
) -> dict[str, object]:
    """Authenticate the parent prefix and replay every suffix clause."""

    if check_support:
        _require_support(LEAN_ROOT_PATH, LEAN_ROOT_SHA256, "Lean refinement source")
        _require_support(LEAN_EXPORT_PATH, LEAN_EXPORT_SHA256, "Lean exporter")
        _require_support(PARENT_LEAN_ROOT_PATH, PARENT_LEAN_ROOT_SHA256, "parent Lean source")
        _require_support(PARENT_LEAN_EXPORT_PATH, PARENT_LEAN_EXPORT_SHA256, "parent Lean exporter")

    parent_digest = hashlib.sha256()
    child_digest = hashlib.sha256()
    suffix_digest = hashlib.sha256()
    suffix_bytes = 0
    suffix_clauses = 0
    seen: set[tuple[int, ...]] = set()
    with _open_regular_nofollow(parent_path) as parent, _open_regular_nofollow(child_path) as child:
        parent_header = parent.readline()
        child_header = child.readline()
        if parent_header != f"p cnf {VARIABLES} {PARENT_CLAUSES}\n".encode():
            raise ValueError("three-row-cycle parent DIMACS header drifted")
        if child_header != f"p cnf {VARIABLES} {CHILD_CLAUSES}\n".encode():
            raise ValueError("two-triple-row DIMACS header drifted")
        parent_digest.update(parent_header)
        child_digest.update(child_header)
        while True:
            block = parent.read(1 << 20)
            if not block:
                break
            parent_digest.update(block)
            observed = child.read(len(block))
            if observed != block:
                raise ValueError("child does not preserve the exact parent body prefix")
            child_digest.update(observed)
        for expected in expected_suffix_lines():
            observed = child.readline()
            if observed != expected:
                raise ValueError(f"ordered suffix drifted at clause {suffix_clauses}")
            fields = observed.decode("ascii").split()
            key = tuple(int(item) for item in fields[:-1])
            if len(key) != 7 or len(set(key)) != len(key):
                raise ValueError(f"duplicate or malformed literals at suffix clause {suffix_clauses}")
            if key in seen:
                raise ValueError(f"duplicate suffix clause at index {suffix_clauses}")
            seen.add(key)
            suffix_digest.update(observed)
            child_digest.update(observed)
            suffix_bytes += len(observed)
            suffix_clauses += 1
        if child.read(1):
            raise ValueError("child contains extra bytes after the expected suffix")

    parent_identity = FileIdentity(parent_digest.hexdigest(), parent_path.stat().st_size)
    child_identity = FileIdentity(child_digest.hexdigest(), child_path.stat().st_size)
    if parent_identity != FileIdentity(PARENT_SHA256, PARENT_BYTES):
        raise ValueError("parent root identity drifted")
    if child_identity != FileIdentity(CHILD_SHA256, CHILD_BYTES):
        raise ValueError("two-triple-row child identity drifted")
    if (suffix_digest.hexdigest(), suffix_bytes, suffix_clauses) != (
        SUFFIX_SHA256,
        SUFFIX_BYTES,
        SUFFIX_CLAUSES,
    ):
        raise ValueError("independently regenerated suffix identity drifted")
    return {
        "schema": VALIDATION_SCHEMA,
        "status": "PASS",
        "source_baseline_sha256": SOURCE_BASELINE_SHA256,
        "source_commit": SOURCE_COMMIT,
        "parent_source_commit": PARENT_SOURCE_COMMIT,
        "variables": VARIABLES,
        "parent": {"path": str(parent_path.resolve()), "sha256": parent_identity.sha256, "bytes": parent_identity.bytes, "clauses": PARENT_CLAUSES},
        "child": {"path": str(child_path.resolve()), "sha256": child_identity.sha256, "bytes": child_identity.bytes, "clauses": CHILD_CLAUSES},
        "suffix": {
            "sha256": suffix_digest.hexdigest(), "bytes": suffix_bytes, "clauses": suffix_clauses,
            "generator": "independent-python-two-triple-row-generator/v1",
            "semantics": "B:{A,C,D}, F:{A,D,E}",
            "families": {"two_triple_row": CLAUSES_PER_FAMILY},
            "named_orders": 2, "directions": 2, "cuts": 17, "five_offset_choices": 4368,
        },
        "lean": {"root_sha256": LEAN_ROOT_SHA256, "export_sha256": LEAN_EXPORT_SHA256},
    }


__all__ = [
    "CHILD_BYTES",
    "CHILD_CLAUSES",
    "CHILD_PATH",
    "CHILD_SHA256",
    "CLAUSES_PER_FAMILY",
    "LEAN_EXPORT_PATH",
    "LEAN_EXPORT_SHA256",
    "LEAN_ROOT_PATH",
    "LEAN_ROOT_SHA256",
    "PARENT_BYTES",
    "PARENT_CLAUSES",
    "PARENT_LEAN_EXPORT_PATH",
    "PARENT_LEAN_EXPORT_SHA256",
    "PARENT_LEAN_ROOT_PATH",
    "PARENT_LEAN_ROOT_SHA256",
    "PARENT_PATH",
    "PARENT_SHA256",
    "PARENT_SOURCE_COMMIT",
    "SOURCE_BASELINE_SHA256",
    "SOURCE_COMMIT",
    "SUFFIX_BYTES",
    "SUFFIX_CLAUSES",
    "SUFFIX_SHA256",
    "VALIDATION_SCHEMA",
    "VARIABLES",
    "_hits",
    "expected_suffix_lines",
    "sha256_file",
    "validate_export",
]
