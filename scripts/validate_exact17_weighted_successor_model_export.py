"""Independent, fail-closed validator for the authenticated FortyEighth export."""

from __future__ import annotations

import hashlib
import json
import os
import stat
import subprocess
from collections.abc import Iterator
from dataclasses import dataclass
from pathlib import Path
from typing import BinaryIO

ROOT = Path(__file__).resolve().parents[1]
PARENT_PATH = (
    ROOT
    / "scratch/runs/exact17-weighted-kalmanson-successor-publication-20260816/export-v1/artifacts/exact17-weighted-kalmanson-successor.cnf"
)
CHILD_PATH = (
    ROOT
    / "scratch/runs/exact17-weighted-successor-model-publication-20260816/export-v1/artifacts/exact17-weighted-successor-model.cnf"
)
MINE_PATH = (
    ROOT / "scratch/exact17-weighted-kalmanson-successor-model-mine-20260816.json"
)
LEAN_ROOT_PATH = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortyEighthModelRefinements.lean"
)
LEAN_EXPORT_PATH = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortyEighthModelRefinementsExport.lean"
)
PARENT_LEAN_ROOT_PATH = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortySeventhModelRefinements.lean"
)
PARENT_LEAN_EXPORT_PATH = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortySeventhModelRefinementsExport.lean"
)
SOURCE_BRIDGE_PATH = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean"
)

SOURCE_COMMIT = "f9bc60a3b7f3350ea4aa00b150eb0d26c4e06025"
PARENT_SOURCE_COMMIT = "d08c0f31c8b10b5869a960d0afd40990f5cc47e6"
SOURCE_BRIDGE_COMMIT = "f78cade13a875a2c6b4fdd9482c0d2c89c14624f"
LEAN_ROOT_SHA256 = "892af2212af847a57a27349867d939b8c8cfab7e1b4e9fc1123751bfa6fc92fb"
SOURCE_BASELINE_SHA256 = LEAN_ROOT_SHA256
LEAN_EXPORT_SHA256 = "be94b2db36158e575793a44672aaacfd5dee8af03eb1e2c79f592761e43dc860"
PARENT_LEAN_ROOT_SHA256 = (
    "aac1d391be1c3ce9e3ec5acf93e1492620d414e3e943cc98ed451e534a755789"
)
PARENT_LEAN_EXPORT_SHA256 = (
    "5e861d23ca6f77fd7245b68d1bcf8cb6135930fd1eb98a0aa44e4c6fae4f8da6"
)
SOURCE_BRIDGE_SHA256 = (
    "7eae140b28dfed1c6765b29140f06846e150121d05e747179010a075f3e69e92"
)
MINE_SHA256 = "b1bfe11046d863870647d329f4076e9ccab6b68cbafae92db264ab3fb9087e75"
PARENT_SHA256 = "44572a136c005d62de9c85b3b6fcf01336362bb3a50e5437d786f770a5cecdc6"
PARENT_BYTES = 338_646_156
PARENT_CLAUSES = 7_198_420
CHILD_CLAUSES = 7_198_472
VARIABLES = 308
OCCURRENCES = 13
CLAUSES_PER_OCCURRENCE = 4
SUFFIX_CLAUSES = 52
PARENT_SUBSUMED_SUFFIX_INDICES = (
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    21,
    23,
    25,
    27,
    28,
    29,
    31,
    32,
    33,
    35,
    36,
    41,
    43,
    45,
    47,
    49,
    51,
)
PARENT_SUBSUMPTION_WITNESS_COUNTS = (
    1,
    1,
    1,
    1,
    3,
    2,
    2,
    2,
    3,
    2,
    2,
    2,
    1,
    1,
    1,
    1,
    1,
    3,
    1,
    3,
    1,
    2,
    1,
    1,
    1,
    1,
    2,
    1,
    3,
    1,
    2,
    1,
    1,
    2,
    2,
    1,
    1,
)
VALIDATION_SCHEMA = "p97-exact17-weighted-successor-model-export-validation/v1"

_ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
_SUPPORTS = (
    ((0, 11), (0, 14), (5, 9), (5, 11), (6, 9), (6, 14)),
    ((5, 3), (5, 9), (6, 1), (6, 9), (16, 1), (16, 3)),
    ((5, 3), (5, 9), (6, 9), (6, 14), (13, 3), (13, 14)),
    ((6, 7), (6, 9), (7, 5), (7, 9), (10, 5), (10, 7)),
    ((9, 5), (9, 6), (12, 6), (12, 8), (14, 5), (14, 8)),
    ((7, 8), (7, 12), (8, 7), (8, 12), (10, 5), (10, 7), (14, 5), (14, 8)),
    (
        (0, 11),
        (0, 14),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 8),
        (8, 7),
        (8, 11),
        (14, 5),
        (14, 8),
    ),
    (
        (2, 6),
        (2, 13),
        (6, 9),
        (6, 14),
        (9, 5),
        (9, 6),
        (10, 5),
        (10, 13),
        (13, 9),
        (13, 14),
    ),
    (
        (2, 6),
        (2, 13),
        (6, 9),
        (6, 14),
        (9, 6),
        (9, 16),
        (11, 13),
        (11, 16),
        (13, 9),
        (13, 14),
    ),
    (
        (4, 6),
        (4, 11),
        (5, 9),
        (5, 11),
        (6, 1),
        (6, 9),
        (9, 5),
        (9, 6),
        (14, 1),
        (14, 5),
    ),
    (
        (5, 9),
        (5, 11),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 8),
        (8, 7),
        (8, 11),
        (14, 5),
        (14, 8),
    ),
    (
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 8),
        (7, 12),
        (8, 7),
        (8, 12),
        (12, 8),
        (12, 14),
        (14, 5),
        (14, 8),
    ),
    (
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 8),
        (7, 9),
        (7, 12),
        (8, 7),
        (8, 12),
        (9, 5),
        (9, 6),
        (12, 6),
        (12, 8),
    ),
)


@dataclass(frozen=True)
class ExportSpec:
    parent_sha256: str = PARENT_SHA256
    parent_bytes: int = PARENT_BYTES
    parent_clauses: int = PARENT_CLAUSES
    child_sha256: str = ""
    child_bytes: int = 0
    child_clauses: int = CHILD_CLAUSES
    variables: int = VARIABLES


PRODUCTION_SPEC = ExportSpec()


def _open_directory_nofollow(path: Path) -> int:
    absolute = Path(os.path.abspath(path))
    flags = (
        os.O_RDONLY
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
        | getattr(os, "O_CLOEXEC", 0)
    )
    descriptor = os.open(absolute.anchor, flags)
    try:
        for component in absolute.parts[1:]:
            child = os.open(component, flags, dir_fd=descriptor)
            named, opened = (
                os.stat(component, dir_fd=descriptor, follow_symlinks=False),
                os.fstat(child),
            )
            if (named.st_dev, named.st_ino) != (opened.st_dev, opened.st_ino):
                os.close(child)
                raise ValueError(f"path component changed: {path}")
            os.close(descriptor)
            descriptor = child
        return descriptor
    except BaseException:
        os.close(descriptor)
        raise


def _open_regular_nofollow(path: Path) -> BinaryIO:
    parent = _open_directory_nofollow(path.parent)
    descriptor: int | None = None
    try:
        descriptor = os.open(
            path.name,
            os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0) | getattr(os, "O_CLOEXEC", 0),
            dir_fd=parent,
        )
        opened, named = (
            os.fstat(descriptor),
            os.stat(path.name, dir_fd=parent, follow_symlinks=False),
        )
        if (
            not stat.S_ISREG(opened.st_mode)
            or opened.st_nlink != 1
            or (named.st_dev, named.st_ino) != (opened.st_dev, opened.st_ino)
        ):
            raise ValueError(f"not an exclusive regular file: {path}")
        stream = os.fdopen(descriptor, "rb", closefd=True)
        descriptor = None
        return stream
    finally:
        if descriptor is not None:
            os.close(descriptor)
        os.close(parent)


def _read_bytes(path: Path) -> bytes:
    with _open_regular_nofollow(path) as stream:
        return stream.read()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with _open_regular_nofollow(path) as stream:
        before = os.fstat(stream.fileno())
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
        after = os.fstat(stream.fileno())
    if (
        before.st_dev,
        before.st_ino,
        before.st_size,
        before.st_mtime_ns,
        before.st_nlink,
    ) != (after.st_dev, after.st_ino, after.st_size, after.st_mtime_ns, after.st_nlink):
        raise ValueError(f"file changed during hashing: {path}")
    return digest.hexdigest()


def _git_show(commit: str, path: Path) -> bytes:
    try:
        return subprocess.run(
            ["git", "show", f"{commit}:{path.relative_to(ROOT)}"],
            cwd=ROOT,
            check=True,
            capture_output=True,
        ).stdout
    except (subprocess.CalledProcessError, ValueError) as error:
        raise ValueError(f"committed source unavailable: {path}") from error


def _require_committed_source(
    path: Path, commit: str, expected: str, label: str
) -> None:
    if (
        hashlib.sha256(_git_show(commit, path)).hexdigest() != expected
        or sha256_file(path) != expected
    ):
        raise ValueError(f"{label} bytes drifted")


def _mine() -> dict[str, object]:
    raw = _read_bytes(MINE_PATH)
    if hashlib.sha256(raw).hexdigest() != MINE_SHA256:
        raise ValueError("authenticated mine hash drifted")
    mine = json.loads(raw)
    if (
        mine.get("schema") != "exact17-weighted-kalmanson-successor-model-mine/v1"
        or mine.get("status") != "PASS"
    ):
        raise ValueError("mine schema/status drifted")
    root = mine["provenance"]["root"]
    if root != {
        "sha256": PARENT_SHA256,
        "bytes": PARENT_BYTES,
        "variables": VARIABLES,
        "clauses": PARENT_CLAUSES,
    }:
        raise ValueError("mine parent root binding drifted")
    supports = tuple(
        tuple(tuple(pair) for pair in row["support"])
        for row in mine["producer_scan"]["new_minimal_motif_supports"]
    )
    if supports != _SUPPORTS or len(supports) != OCCURRENCES:
        raise ValueError("mine occurrence census drifted")
    if (
        mine["conclusion"]["new_source_valid_occurrences"] != OCCURRENCES
        or mine["conclusion"]["new_source_valid_occurrence_clauses_if_banked"]
        != SUFFIX_CLAUSES
    ):
        raise ValueError("mine occurrence count drifted")
    return mine


def _hit_var(center: int, point: int) -> int:
    value = 1 + center * 17 + point
    if not 1 <= value <= VARIABLES:
        raise ValueError("literal outside variable range")
    return value


def _oriented(order: int, reverse: bool, label: int) -> int:
    return _ORDERS[order][16 - label if reverse else label]


def _clause_line(
    support: tuple[tuple[int, int], ...], order: int, reverse: bool
) -> bytes:
    literals = [-(307 + order)] + [
        -_hit_var(_oriented(order, reverse, c), _oriented(order, reverse, p))
        for c, p in support
    ]
    return (" ".join(map(str, literals)) + " 0\n").encode("ascii")


def expected_suffix_lines() -> Iterator[bytes]:
    for support in _SUPPORTS:
        for order in range(2):
            for reverse in (False, True):
                yield _clause_line(support, order, reverse)


def _parent_subsumption_census(
    parent_body: list[bytes], suffix_lines: list[bytes]
) -> dict[str, object]:
    witnesses = [0] * len(suffix_lines)
    suffix_sets = [frozenset(map(int, line.split()[:-1])) for line in suffix_lines]
    for line in parent_body:
        fields = line.split()
        if not fields or fields[-1] != b"0":
            raise ValueError("malformed parent clause")
        clause = frozenset(map(int, fields[:-1]))
        for index, suffix in enumerate(suffix_sets):
            if clause <= suffix:
                witnesses[index] += 1
    indices = tuple(i for i, count in enumerate(witnesses) if count)
    return {
        "complete": True,
        "parent_subsumed_suffix_clause_indices": indices,
        "parent_subsumed_suffix_clause_count": len(indices),
        "witness_counts": tuple(witnesses[i] for i in indices),
        "witness_total": sum(witnesses),
    }


def _parse_header(line: bytes, clauses: int) -> None:
    if line.decode("ascii").split() != ["p", "cnf", str(VARIABLES), str(clauses)]:
        raise ValueError("DIMACS header drifted")


def _validate_export(
    parent_path: Path = PARENT_PATH,
    child_path: Path = CHILD_PATH,
    *,
    check_support: bool,
    spec: ExportSpec,
) -> dict[str, object]:
    if check_support:
        _require_committed_source(
            LEAN_ROOT_PATH, SOURCE_COMMIT, LEAN_ROOT_SHA256, "FortyEighth Lean source"
        )
        _require_committed_source(
            LEAN_EXPORT_PATH,
            SOURCE_COMMIT,
            LEAN_EXPORT_SHA256,
            "FortyEighth Lean exporter",
        )
        _require_committed_source(
            PARENT_LEAN_ROOT_PATH,
            PARENT_SOURCE_COMMIT,
            PARENT_LEAN_ROOT_SHA256,
            "FortySeventh Lean source",
        )
        _require_committed_source(
            PARENT_LEAN_EXPORT_PATH,
            PARENT_SOURCE_COMMIT,
            PARENT_LEAN_EXPORT_SHA256,
            "FortySeventh Lean exporter",
        )
        _require_committed_source(
            SOURCE_BRIDGE_PATH,
            SOURCE_BRIDGE_COMMIT,
            SOURCE_BRIDGE_SHA256,
            "weighted source bridge",
        )
        _mine()
    parent, child = _read_bytes(parent_path), _read_bytes(child_path)
    if (
        len(parent) != spec.parent_bytes
        or hashlib.sha256(parent).hexdigest() != spec.parent_sha256
    ):
        raise ValueError("parent identity drifted")
    suffix_lines = list(expected_suffix_lines())
    _parse_header(parent.splitlines(keepends=True)[0], spec.parent_clauses)
    _parse_header(child.splitlines(keepends=True)[0], spec.child_clauses)
    parent_body, child_lines = (
        parent.splitlines(keepends=True)[1:],
        child.splitlines(keepends=True),
    )
    if child_lines[1 : 1 + spec.parent_clauses] != parent_body:
        raise ValueError("parent prefix bytes drifted")
    suffix = b"".join(child_lines[1 + spec.parent_clauses :])
    if suffix != b"".join(suffix_lines):
        raise ValueError("weighted successor suffix drifted")
    if (
        len(child_lines) != 1 + spec.child_clauses
        or len(suffix_lines) != SUFFIX_CLAUSES
    ):
        raise ValueError("clause census drifted")
    for line in suffix_lines:
        fields = line.split()
        if fields[-1] != b"0" or len(set(map(int, fields[:-1]))) != len(fields[:-1]):
            raise ValueError("malformed successor clause")
    digest = hashlib.sha256(child).hexdigest()
    if spec.child_bytes and len(child) != spec.child_bytes:
        raise ValueError("child byte count drifted")
    if spec.child_sha256 and digest != spec.child_sha256:
        raise ValueError("child hash drifted")
    return {
        "schema": VALIDATION_SCHEMA,
        "status": "PASS",
        "parent": {
            "path": str(parent_path.resolve()),
            "sha256": spec.parent_sha256,
            "bytes": len(parent),
            "clauses": spec.parent_clauses,
        },
        "child": {
            "path": str(child_path.resolve()),
            "sha256": digest,
            "bytes": len(child),
            "clauses": spec.child_clauses,
        },
        "suffix": {
            "sha256": hashlib.sha256(suffix).hexdigest(),
            "bytes": len(suffix),
            "clauses": SUFFIX_CLAUSES,
            "occurrences": OCCURRENCES,
            "clauses_per_occurrence": CLAUSES_PER_OCCURRENCE,
        },
        "parent_subsumption_census": _parent_subsumption_census(
            parent_body, suffix_lines
        ),
    }


def validate_export(
    parent_path: Path = PARENT_PATH, child_path: Path = CHILD_PATH
) -> dict[str, object]:
    return _validate_export(
        parent_path, child_path, check_support=True, spec=PRODUCTION_SPEC
    )


if __name__ == "__main__":
    print(json.dumps(validate_export(), indent=2, sort_keys=True))
