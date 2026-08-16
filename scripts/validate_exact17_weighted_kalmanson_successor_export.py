"""Fail-closed independent validator for the exact-17 weighted-Kalmanson export."""

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
    ROOT / "scratch/exact17-small-role-cycle-package-v2/exact17-small-role-cycle.cnf"
)
CHILD_PATH = (
    ROOT
    / "scratch/runs/exact17-weighted-kalmanson-successor-publication-20260816/export-v1/artifacts/exact17-weighted-kalmanson-successor.cnf"
)
OCCURRENCE_PATH = (
    ROOT / "scratch/exact17-weighted-kalmanson-current-model-occurrences.json"
)
LEAN_ROOT_PATH = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortySeventhModelRefinements.lean"
)
LEAN_EXPORT_PATH = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortySeventhModelRefinementsExport.lean"
)
PARENT_LEAN_ROOT_PATH = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSmallRoleCycleRefinements.lean"
)
PARENT_LEAN_EXPORT_PATH = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSmallRoleCycleRefinementsExport.lean"
)
SOURCE_BRIDGE_PATH = (
    ROOT
    / "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean"
)

SOURCE_COMMIT = "d08c0f31c8b10b5869a960d0afd40990f5cc47e6"
PARENT_SOURCE_COMMIT = "ed21c25f8c9780d702a19cc7a604e445d594c4f8"
LEAN_ROOT_SHA256 = "aac1d391be1c3ce9e3ec5acf93e1492620d414e3e943cc98ed451e534a755789"
LEAN_EXPORT_SHA256 = "5e861d23ca6f77fd7245b68d1bcf8cb6135930fd1eb98a0aa44e4c6fae4f8da6"
SOURCE_BASELINE_SHA256 = LEAN_ROOT_SHA256
PARENT_LEAN_ROOT_SHA256 = (
    "3c7e053d0cc4f33bff804b80900cdf7d309ca4b340d50e2402f63430f4a1e68d"
)
PARENT_LEAN_EXPORT_SHA256 = (
    "6216598203f0cd96d380b1391368b1a366400610d8b2a7f79edc39c7b337a8b6"
)
SOURCE_BRIDGE_SHA256 = (
    "7eae140b28dfed1c6765b29140f06846e150121d05e747179010a075f3e69e92"
)
OCCURRENCE_SHA256 = "f74c1d59bd287fbadba88dcb5fa179034acbab50464b97fbde99db9aa373a499"
PARENT_SHA256 = "4c47a61712cd4c1d465ea7984189e938b5a2422553adc3e962b7209ee285430d"
PARENT_BYTES = 338_644_740
PARENT_CLAUSES = 7_198_388
CHILD_SHA256 = "44572a136c005d62de9c85b3b6fcf01336362bb3a50e5437d786f770a5cecdc6"
CHILD_BYTES = 338_646_156
CHILD_CLAUSES = 7_198_420
VARIABLES = 308
OCCURRENCES = 8
CLAUSES_PER_OCCURRENCE = 4
SUFFIX_CLAUSES = 32
PARENT_SUBSUMED_SUFFIX_INDICES = (1, 3, 4, 5, 7, 8, 12, 25, 27, 29, 31)
PARENT_SUBSUMPTION_WITNESS_COUNTS = (1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1)
VALIDATION_SCHEMA = "p97-exact17-weighted-kalmanson-successor-export-validation/v1"
_ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
_EXPECTED_ATOMS = (
    (420, 3867),
    (199, 785),
    (1199,),
    (3476, 4509),
    (3477,),
    (3805, 3825),
    (3093, 4377),
    (3932, 3867),
)
_EXPECTED_HITS = (
    ((0, 3), (0, 5), (7, 8), (7, 12), (8, 3), (8, 12), (12, 5), (12, 8)),
    ((0, 5), (0, 15), (5, 0), (5, 15), (13, 0), (13, 1), (14, 1), (14, 5)),
    ((1, 10), (1, 14), (2, 6), (2, 10), (6, 1), (6, 14), (14, 1), (14, 6)),
    ((4, 6), (4, 11), (8, 10), (8, 11), (9, 4), (9, 10), (11, 4), (11, 6)),
    ((6, 7), (6, 9), (7, 6), (7, 9), (9, 4), (9, 7), (11, 4), (11, 6)),
    ((6, 7), (6, 9), (7, 6), (7, 9), (9, 5), (9, 7), (14, 5), (14, 6)),
    ((7, 8), (7, 12), (8, 3), (8, 12), (10, 3), (10, 7), (13, 7), (13, 8)),
    ((7, 8), (7, 12), (8, 10), (8, 12), (9, 5), (9, 10), (12, 5), (12, 8)),
)


@dataclass(frozen=True)
class ExportSpec:
    parent_sha256: str = PARENT_SHA256
    parent_bytes: int = PARENT_BYTES
    parent_clauses: int = PARENT_CLAUSES
    child_sha256: str = CHILD_SHA256
    child_bytes: int = CHILD_BYTES
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


def _read_bytes(path: Path) -> bytes:
    with _open_regular_nofollow(path) as stream:
        return stream.read()


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
    committed = _git_show(commit, path)
    if (
        hashlib.sha256(committed).hexdigest() != expected
        or sha256_file(path) != expected
    ):
        raise ValueError(f"{label} bytes drifted")


def _hit_var(center: int, point: int) -> int:
    value = 1 + center * 17 + point
    if not 1 <= value <= VARIABLES:
        raise ValueError("literal outside variable range")
    return value


def _oriented(order: int, reverse: bool, label: int) -> int:
    return _ORDERS[order][16 - label if reverse else label]


def _clause_line(hits: tuple[tuple[int, int], ...], order: int, reverse: bool) -> bytes:
    literals = [-(307 + order)] + [
        -_hit_var(_oriented(order, reverse, c), _oriented(order, reverse, p))
        for c, p in hits
    ]
    return (" ".join(map(str, literals)) + " 0\n").encode("ascii")


def _ledger() -> dict[str, object]:
    raw = _read_bytes(OCCURRENCE_PATH)
    if hashlib.sha256(raw).hexdigest() != OCCURRENCE_SHA256:
        raise ValueError("occurrence ledger hash drifted")
    value = json.loads(raw)
    if (
        not isinstance(value, dict)
        or value.get("schema")
        != "exact17-weighted-kalmanson-current-model-occurrences/v1"
    ):
        raise ValueError("occurrence ledger schema drifted")
    occurrences = value.get("occurrences")
    if not isinstance(occurrences, list) or len(occurrences) != OCCURRENCES:
        raise ValueError("occurrence census drifted")
    for index, record in enumerate(occurrences):
        if (
            not isinstance(record, dict)
            or tuple(record.get("atom_indices", ())) != _EXPECTED_ATOMS[index]
            or tuple(tuple(x) for x in record.get("hits", ())) != _EXPECTED_HITS[index]
        ):
            raise ValueError(f"occurrence record {index} drifted")
    if (
        value.get("root_sha256") != PARENT_SHA256
        or value.get("root_clauses") != PARENT_CLAUSES
    ):
        raise ValueError("occurrence root binding drifted")
    return value


def expected_suffix_lines() -> Iterator[bytes]:
    records = _ledger()["occurrences"]
    assert isinstance(records, list)
    for record in records:
        hits = tuple(tuple(pair) for pair in record["hits"])
        for order in range(2):
            for reverse in (False, True):
                yield _clause_line(hits, order, reverse)


def _parent_subsumption_census(
    parent_body: list[bytes], suffix_lines: list[bytes]
) -> dict[str, object]:
    witnesses = [0] * len(suffix_lines)
    suffix_sets = [frozenset(map(int, line.split()[:-1])) for line in suffix_lines]
    for line in parent_body:
        fields = line.split()
        if not fields or fields[-1] != b"0":
            raise ValueError("malformed parent clause")
        parent_clause = frozenset(map(int, fields[:-1]))
        for index, suffix_clause in enumerate(suffix_sets):
            if parent_clause <= suffix_clause:
                witnesses[index] += 1
    indices = tuple(index for index, count in enumerate(witnesses) if count)
    return {
        "complete": True,
        "parent_subsumed_suffix_clause_indices": indices,
        "parent_subsumed_suffix_clause_count": len(indices),
        "witness_counts": tuple(witnesses[index] for index in indices),
        "witness_total": sum(witnesses),
    }


def _parse_header(line: bytes, expected_clauses: int) -> None:
    fields = line.decode("ascii").split()
    if fields != ["p", "cnf", str(VARIABLES), str(expected_clauses)]:
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
            LEAN_ROOT_PATH, SOURCE_COMMIT, LEAN_ROOT_SHA256, "Lean refinement source"
        )
        _require_committed_source(
            LEAN_EXPORT_PATH, SOURCE_COMMIT, LEAN_EXPORT_SHA256, "Lean exporter"
        )
        _require_committed_source(
            PARENT_LEAN_ROOT_PATH,
            PARENT_SOURCE_COMMIT,
            PARENT_LEAN_ROOT_SHA256,
            "parent Lean source",
        )
        _require_committed_source(
            PARENT_LEAN_EXPORT_PATH,
            PARENT_SOURCE_COMMIT,
            PARENT_LEAN_EXPORT_SHA256,
            "parent Lean exporter",
        )
        _require_committed_source(
            SOURCE_BRIDGE_PATH,
            SOURCE_COMMIT,
            SOURCE_BRIDGE_SHA256,
            "weighted-Kalmanson source bridge",
        )
        _ledger()
    parent = _read_bytes(parent_path)
    child = _read_bytes(child_path)
    if (
        spec.parent_bytes != len(parent)
        or hashlib.sha256(parent).hexdigest() != spec.parent_sha256
    ):
        raise ValueError("parent identity drifted")
    expected_suffix = b"".join(expected_suffix_lines())
    _parse_header(parent.splitlines(keepends=True)[0], spec.parent_clauses)
    _parse_header(child.splitlines(keepends=True)[0], spec.child_clauses)
    parent_body = parent.splitlines(keepends=True)[1:]
    child_lines = child.splitlines(keepends=True)
    if child_lines[1 : 1 + spec.parent_clauses] != parent_body:
        raise ValueError("parent prefix bytes drifted")
    suffix = b"".join(child_lines[1 + spec.parent_clauses :])
    if suffix != expected_suffix:
        raise ValueError("weighted suffix clauses drifted")
    if (
        len(child_lines) != 1 + spec.child_clauses
        or len(suffix.splitlines()) != SUFFIX_CLAUSES
    ):
        raise ValueError("clause census drifted")
    digest = hashlib.sha256(child).hexdigest()
    if spec.child_bytes and len(child) != spec.child_bytes:
        raise ValueError("child byte count drifted")
    if spec.child_sha256 and digest != spec.child_sha256:
        raise ValueError("child hash drifted")
    if any(
        len(set(map(int, line.split()[:-1]))) != len(line.split()[:-1])
        or line.split()[-1] != b"0"
        for line in suffix.splitlines()
    ):
        raise ValueError("malformed successor clause")
    census = _parent_subsumption_census(parent_body, list(expected_suffix_lines()))
    if check_support and (
        census["parent_subsumed_suffix_clause_indices"]
        != PARENT_SUBSUMED_SUFFIX_INDICES
        or census["witness_counts"] != PARENT_SUBSUMPTION_WITNESS_COUNTS
    ):
        raise ValueError("parent-subsumption census drifted")
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
        "parent_subsumption_census": census,
    }


def validate_export(
    parent_path: Path = PARENT_PATH, child_path: Path = CHILD_PATH
) -> dict[str, object]:
    return _validate_export(
        parent_path, child_path, check_support=True, spec=PRODUCTION_SPEC
    )


if __name__ == "__main__":
    print(json.dumps(validate_export(), indent=2, sort_keys=True))
