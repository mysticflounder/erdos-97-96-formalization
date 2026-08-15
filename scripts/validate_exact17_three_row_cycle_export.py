"""Independent streaming validator for the Lean-owned three-row-cycle root.

The validator does not import the Lean clause generator.  It reconstructs the
complete 891,072-clause suffix from the published finite definitions and checks
that the child is exactly the authenticated Child46 body followed by that
ordered suffix.
"""

from __future__ import annotations

import hashlib
import itertools
import os
import stat
from dataclasses import dataclass
from pathlib import Path
from typing import BinaryIO, Iterator

ROOT = Path(__file__).resolve().parents[1]
PARENT_PATH = ROOT / "scratch/exact17-lean-to-sat/exact17-child46-forty-sixth-model-refinements.cnf"
CHILD_PATH = ROOT / "scratch/exact17-three-row-cycle-package/exact17-three-row-cycle.cnf"
LEAN_METRIC_PATH = ROOT / "lean/Erdos9796Proof/P97/ATail/KalmansonThreeRowCycleSchemas.lean"
LEAN_ROOT_PATH = ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThreeRowCycleRefinements.lean"
LEAN_EXPORT_PATH = ROOT / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThreeRowCycleRefinementsExport.lean"

SOURCE_BASELINE_SHA256 = "763bb4774a4d148ca35a4d33ecce06c158a8f941c3e5fb272f534cb2b9637527"
SOURCE_COMMIT = "2de8f51f52ee4836756101bc613a504b4c2a52d7"
PARENT_SHA256 = "106a8f682212cb76281b01fb834f6244e6013767a1edad207c77179a187e75b2"
PARENT_BYTES = 291_706_884
PARENT_CLAUSES = 5_848_864
CHILD_SHA256 = "2870fa87246292872ef0668471b2dab8a708a7c1815e2223a385c2ecb8a8f869"
CHILD_BYTES = 322_685_712
CHILD_CLAUSES = 6_739_936
VARIABLES = 308
SUFFIX_SHA256 = "c932f71ac362cb00423ba9f60d9a8096807677cf4f30ff5905891c3c0db0fcc0"
SUFFIX_BYTES = 30_978_828
SUFFIX_CLAUSES = 891_072
LEAN_METRIC_SHA256 = "ebd61771db06ed6ff922120cc6106a8ad3fb425e560aeab5b1b14eb24933c30f"
LEAN_ROOT_SHA256 = "d377133da751ee94962c762bc28a6e953d9c9b00dd75cbe9992470660bc05786"
LEAN_EXPORT_SHA256 = "070fbd689f26e9df034336f94f1e8fc867945bf69973411f316481bca91db9f0"
VALIDATION_SCHEMA = "p97-exact17-three-row-cycle-export-validation/v1"

_ORDER_TABLES = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)


@dataclass(frozen=True)
class FileIdentity:
    sha256: str
    bytes: int


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def _open_regular_nofollow(path: Path) -> BinaryIO:
    flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0)
    descriptor = os.open(path, flags)
    info = os.fstat(descriptor)
    if not stat.S_ISREG(info.st_mode):
        os.close(descriptor)
        raise ValueError(f"not a regular file: {path}")
    return os.fdopen(descriptor, "rb", closefd=True)


def _require_support(path: Path, expected: str, label: str) -> None:
    if sha256_file(path) != expected:
        raise ValueError(f"{label} SHA-256 drifted")


def _hit_var(center: int, point: int) -> int:
    return 1 + center * 17 + point


def _placed(order: int, reverse: bool, cut: int, offset: int) -> int:
    position = (cut - offset if reverse else cut + offset) % 17
    return _ORDER_TABLES[order][position]


def _hits(kind: int, points: tuple[int, int, int, int, int, int]) -> tuple[tuple[int, int], ...]:
    a, b, c, d, e, f = points
    if kind == 0:
        return ((a, b), (a, c), (d, c), (d, f), (e, b), (e, f))
    if kind == 1:
        return ((a, b), (a, c), (e, b), (e, d), (f, c), (f, d))
    if kind == 2:
        return ((a, b), (a, d), (e, b), (e, c), (f, c), (f, d))
    raise AssertionError("unknown cycle kind")


def expected_suffix_lines() -> Iterator[bytes]:
    """Yield the exact Lean list order as canonical DIMACS lines."""

    for kind in range(3):
        for order in range(2):
            for reverse in (False, True):
                for cut in range(17):
                    for offsets in itertools.combinations(range(1, 17), 5):
                        placed = tuple(
                            _placed(order, reverse, cut, offset)
                            for offset in (0, *offsets)
                        )
                        literals = (-(307 + order),) + tuple(
                            -_hit_var(center, point)
                            for center, point in _hits(kind, placed)
                        )
                        yield (" ".join(map(str, literals)) + " 0\n").encode("ascii")


def validate_export(
    parent_path: Path = PARENT_PATH,
    child_path: Path = CHILD_PATH,
    *,
    check_support: bool = True,
) -> dict[str, object]:
    """Authenticate the parent prefix and independently replay the suffix."""

    if check_support:
        _require_support(LEAN_METRIC_PATH, LEAN_METRIC_SHA256, "Lean metric source")
        _require_support(LEAN_ROOT_PATH, LEAN_ROOT_SHA256, "Lean source adapter")
        _require_support(LEAN_EXPORT_PATH, LEAN_EXPORT_SHA256, "Lean exporter")

    parent_digest = hashlib.sha256()
    child_digest = hashlib.sha256()
    suffix_digest = hashlib.sha256()
    suffix_bytes = 0
    suffix_clauses = 0
    with _open_regular_nofollow(parent_path) as parent, _open_regular_nofollow(child_path) as child:
        parent_header = parent.readline()
        child_header = child.readline()
        if parent_header != f"p cnf {VARIABLES} {PARENT_CLAUSES}\n".encode():
            raise ValueError("Child46 parent DIMACS header drifted")
        if child_header != f"p cnf {VARIABLES} {CHILD_CLAUSES}\n".encode():
            raise ValueError("three-row-cycle DIMACS header drifted")
        parent_digest.update(parent_header)
        child_digest.update(child_header)

        while True:
            block = parent.read(1 << 20)
            if not block:
                break
            parent_digest.update(block)
            observed = child.read(len(block))
            if observed != block:
                raise ValueError("child does not preserve the exact Child46 body prefix")
            child_digest.update(observed)

        for expected in expected_suffix_lines():
            observed = child.readline()
            if observed != expected:
                raise ValueError(f"ordered suffix drifted at clause {suffix_clauses}")
            suffix_digest.update(observed)
            child_digest.update(observed)
            suffix_bytes += len(observed)
            suffix_clauses += 1
        if child.read(1):
            raise ValueError("child contains extra bytes after the expected suffix")

    parent_identity = FileIdentity(parent_digest.hexdigest(), parent_path.stat().st_size)
    child_identity = FileIdentity(child_digest.hexdigest(), child_path.stat().st_size)
    if parent_identity != FileIdentity(PARENT_SHA256, PARENT_BYTES):
        raise ValueError("Child46 parent identity drifted")
    if child_identity != FileIdentity(CHILD_SHA256, CHILD_BYTES):
        raise ValueError("three-row-cycle child identity drifted")
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
        "variables": VARIABLES,
        "parent": {
            "path": str(parent_path.resolve()),
            "sha256": parent_identity.sha256,
            "bytes": parent_identity.bytes,
            "clauses": PARENT_CLAUSES,
        },
        "child": {
            "path": str(child_path.resolve()),
            "sha256": child_identity.sha256,
            "bytes": child_identity.bytes,
            "clauses": CHILD_CLAUSES,
        },
        "suffix": {
            "sha256": suffix_digest.hexdigest(),
            "bytes": suffix_bytes,
            "clauses": suffix_clauses,
            "generator": "independent-python-cycle-generator/v1",
            "families": {
                "adjacent_adjacent": 297_024,
                "adjacent_inner_outer_left": 297_024,
                "adjacent_inner_outer_right": 297_024,
            },
        },
        "lean": {
            "metric_sha256": LEAN_METRIC_SHA256,
            "root_sha256": LEAN_ROOT_SHA256,
            "export_sha256": LEAN_EXPORT_SHA256,
        },
    }


__all__ = [
    "CHILD_BYTES",
    "CHILD_CLAUSES",
    "CHILD_PATH",
    "CHILD_SHA256",
    "LEAN_EXPORT_PATH",
    "LEAN_EXPORT_SHA256",
    "LEAN_METRIC_PATH",
    "LEAN_METRIC_SHA256",
    "LEAN_ROOT_PATH",
    "LEAN_ROOT_SHA256",
    "PARENT_BYTES",
    "PARENT_CLAUSES",
    "PARENT_PATH",
    "PARENT_SHA256",
    "SOURCE_BASELINE_SHA256",
    "SOURCE_COMMIT",
    "SUFFIX_BYTES",
    "SUFFIX_CLAUSES",
    "SUFFIX_SHA256",
    "VALIDATION_SCHEMA",
    "VARIABLES",
    "expected_suffix_lines",
    "sha256_file",
    "validate_export",
]
