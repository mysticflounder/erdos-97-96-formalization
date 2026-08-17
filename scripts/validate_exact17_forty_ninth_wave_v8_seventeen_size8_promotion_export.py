"""Fail-closed streaming validator for the V49 wave-v8 seventeen-support child."""

from __future__ import annotations

import hashlib
import itertools
import json
import os
from pathlib import Path

import validate_exact17_weighted_successor_model_export as _base

ROOT = Path(__file__).resolve().parents[1]
PARENT_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-wave-v7-two-size8-20260817/"
    "export-v1/artifacts/exact17-forty-ninth-wave-v7-two-size8-promotion.cnf"
)
CHILD_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-wave-v8-seventeen-size8-publication-20260817/"
    "export-v1/artifacts/exact17-forty-ninth-wave-v8-seventeen-size8-promotion.cnf"
)
MINE_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-wave-v7-two-size8-20260817/"
    "export-v1/events/v7-wave-mine.json"
)
LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8Promotion.lean"
)
LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthWaveV8SeventeenSize8PromotionExport.lean"
)
PARENT_LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthWaveV7TwoSize8Promotion.lean"
)
PARENT_LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthWaveV7TwoSize8PromotionExport.lean"
)
SOURCE_BRIDGE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean"
)

SOURCE_COMMIT = "0d83486b152f0a8ab403ce1b84abb1f6e1147026"
PARENT_SOURCE_COMMIT = "7f99cf04a1c06ec2d4003e6b42dfe5d2bdf3806a"
SOURCE_BRIDGE_COMMIT = "f78cade13a875a2c6b4fdd9482c0d2c89c14624f"
LEAN_ROOT_SHA256 = "e2f547c1f3b4bacd001f85bbccefd5bff2089d2548c8efa060ef5f4f20a9e835"
SOURCE_BASELINE_SHA256 = LEAN_ROOT_SHA256
LEAN_EXPORT_SHA256 = "8ecdc0ee9dd35f1bc961d7c0eae3a3e9e5966568b861bcdd3836272b9477437f"
PARENT_LEAN_ROOT_SHA256 = (
    "0427beaa114c7b9d0dde128611ef3cba8dd11b02130ef901e7888aab0f135b49"
)
PARENT_LEAN_EXPORT_SHA256 = (
    "a1797e8b9dcf9d840af7cdc69a5bf2444aabd9f9f5b1e89e3444aea1c709891b"
)
SOURCE_BRIDGE_SHA256 = (
    "7eae140b28dfed1c6765b29140f06846e150121d05e747179010a075f3e69e92"
)
MINE_SHA256 = "1a51f916ed4f6afdf7486865db2089fcab2c00e35a1ef5f8a180b6f5ce708c5e"
MINE_BYTES = 832_649

PARENT_SHA256 = "807acfafc9c0f0514bbf5d8c24e15df90d338df08041d151b3f6fcd2965b4ef1"
PARENT_BYTES = 338_666_458
PARENT_CLAUSES = 7_198_768
CHILD_SHA256 = "46b91a6e7013f75838109312604a45c244190bb2998f18f69e0dac4c36602d52"
CHILD_BYTES = 338_669_476
CHILD_CLAUSES = 7_198_836
VARIABLES = 308
OCCURRENCES = 17
CLAUSES_PER_OCCURRENCE = 4
SUFFIX_CLAUSES = 68
EXPECTED_SUFFIX_SHA256 = (
    "a0f9f92e6b07d0650f285114a437dc0659cddf65350a67081d9cbc88d62f0c9f"
)
VALIDATION_SCHEMA = (
    "p97-exact17-forty-ninth-wave-v8-seventeen-size8-promotion-export-validation/v1"
)
EXPECTED_PARENT_SUBSUMED_SUFFIX_INDICES = (
    3,
    5,
    7,
    13,
    15,
    18,
    22,
    25,
    29,
    31,
    33,
    35,
    37,
    39,
    41,
    43,
    45,
    47,
    49,
    50,
    51,
    53,
    55,
    57,
    59,
    61,
    62,
    63,
    65,
    66,
    67,
)
EXPECTED_PARENT_SUBSUMPTION_WITNESS_COUNTS = (
    1,
    1,
    1,
    1,
    1,
    2,
    2,
    1,
    3,
    1,
    2,
    1,
    1,
    1,
    1,
    2,
    3,
    2,
    2,
    2,
    1,
    5,
    3,
    6,
    3,
    2,
    1,
    2,
    2,
    1,
    2,
)
PARENT_SUBSUMED_SUFFIX_INDICES = EXPECTED_PARENT_SUBSUMED_SUFFIX_INDICES
PARENT_SUBSUMPTION_WITNESS_COUNTS = EXPECTED_PARENT_SUBSUMPTION_WITNESS_COUNTS

_SUPPORTS = (
    ((1, 0), (1, 9), (9, 3), (9, 11), (10, 0), (10, 11), (11, 3), (11, 9)),
    ((1, 2), (1, 9), (2, 1), (2, 9), (5, 1), (5, 16), (13, 2), (13, 16)),
    ((1, 2), (1, 9), (2, 1), (2, 9), (15, 2), (15, 14), (16, 1), (16, 14)),
    ((1, 2), (1, 9), (9, 3), (9, 11), (11, 3), (11, 9), (13, 2), (13, 11)),
    ((1, 6), (1, 9), (2, 9), (2, 15), (6, 3), (6, 15), (9, 3), (9, 6)),
    ((2, 5), (2, 9), (4, 5), (4, 11), (9, 3), (9, 11), (11, 3), (11, 9)),
    ((3, 2), (3, 10), (4, 2), (4, 11), (9, 3), (9, 11), (11, 3), (11, 10)),
    ((3, 4), (3, 10), (4, 11), (4, 14), (11, 10), (11, 14), (13, 4), (13, 11)),
    ((3, 4), (3, 10), (9, 3), (9, 11), (11, 3), (11, 10), (13, 4), (13, 11)),
    ((3, 10), (3, 13), (7, 0), (7, 3), (10, 0), (10, 13), (11, 3), (11, 10)),
    ((3, 10), (3, 13), (9, 3), (9, 11), (10, 11), (10, 13), (11, 3), (11, 10)),
    ((4, 2), (4, 14), (13, 2), (13, 16), (14, 10), (14, 16), (16, 10), (16, 14)),
    ((4, 11), (4, 14), (6, 3), (6, 4), (11, 3), (11, 14), (13, 4), (13, 11)),
    ((4, 11), (4, 14), (11, 10), (11, 14), (12, 8), (12, 11), (14, 8), (14, 10)),
    ((4, 11), (4, 14), (11, 10), (11, 14), (13, 11), (13, 16), (14, 10), (14, 16)),
    ((6, 3), (6, 15), (9, 3), (9, 12), (12, 8), (12, 15), (15, 8), (15, 12)),
    ((6, 4), (6, 15), (8, 4), (8, 12), (12, 8), (12, 15), (15, 8), (15, 12)),
)

ExportSpec = _base.ExportSpec
PRODUCTION_SPEC = ExportSpec(
    parent_sha256=PARENT_SHA256,
    parent_bytes=PARENT_BYTES,
    parent_clauses=PARENT_CLAUSES,
    child_sha256=CHILD_SHA256,
    child_bytes=CHILD_BYTES,
    child_clauses=CHILD_CLAUSES,
    variables=VARIABLES,
)
_open_regular_nofollow = _base._open_regular_nofollow
sha256_file = _base.sha256_file


def _mine() -> dict[str, object]:
    raw = MINE_PATH.read_bytes()
    if len(raw) != MINE_BYTES or hashlib.sha256(raw).hexdigest() != MINE_SHA256:
        raise ValueError("V6 wave mine identity drifted")
    mine = json.loads(raw)
    if (
        mine.get("schema") != "exact17-v49-v7-wave-mine/v1"
        or mine.get("status") != "SAT_WAVE_ONLY"
        or mine.get("model_sha256")
        != "192ceeba6c2366cbd49128da3ed4028dfd6f842b60b293f69e4140bb413fa299"
    ):
        raise ValueError("V6 wave mine provenance drifted")
    supports = tuple(
        tuple(tuple(pair) for pair in occurrence["support"])
        for occurrence in mine["occurrences"]
        if occurrence.get("size") == 8
    )
    if supports != _SUPPORTS or len(supports) != OCCURRENCES:
        raise ValueError("V8 size-8 support census drifted")
    return mine


def _clause_line(support, order: int, reverse: bool) -> bytes:
    return _base._clause_line(tuple(support), order, reverse)


def expected_suffix_lines():
    for support in _SUPPORTS:
        for order in range(2):
            for reverse in (False, True):
                yield _clause_line(support, order, reverse)


def _configure_base() -> None:
    for name in (
        "PARENT_PATH",
        "CHILD_PATH",
        "MINE_PATH",
        "LEAN_ROOT_PATH",
        "LEAN_EXPORT_PATH",
        "PARENT_LEAN_ROOT_PATH",
        "PARENT_LEAN_EXPORT_PATH",
        "SOURCE_BRIDGE_PATH",
        "SOURCE_COMMIT",
        "PARENT_SOURCE_COMMIT",
        "SOURCE_BRIDGE_COMMIT",
        "LEAN_ROOT_SHA256",
        "SOURCE_BASELINE_SHA256",
        "LEAN_EXPORT_SHA256",
        "PARENT_LEAN_ROOT_SHA256",
        "PARENT_LEAN_EXPORT_SHA256",
        "SOURCE_BRIDGE_SHA256",
        "MINE_SHA256",
        "PARENT_SHA256",
        "PARENT_BYTES",
        "PARENT_CLAUSES",
        "CHILD_CLAUSES",
        "CHILD_BYTES",
        "CHILD_SHA256",
        "VARIABLES",
        "OCCURRENCES",
        "CLAUSES_PER_OCCURRENCE",
        "SUFFIX_CLAUSES",
        "VALIDATION_SCHEMA",
    ):
        setattr(_base, name, globals()[name])
    _base._mine = _mine
    _base.expected_suffix_lines = expected_suffix_lines
    _base._SUPPORTS = _SUPPORTS


def _streaming_validate_export(
    parent_path: Path = PARENT_PATH,
    child_path: Path = CHILD_PATH,
    *,
    check_support: bool = True,
    spec: ExportSpec = PRODUCTION_SPEC,
) -> dict[str, object]:
    _configure_base()
    if check_support:
        for path, commit, digest, label in (
            (LEAN_ROOT_PATH, SOURCE_COMMIT, LEAN_ROOT_SHA256, "V8 Lean source"),
            (LEAN_EXPORT_PATH, SOURCE_COMMIT, LEAN_EXPORT_SHA256, "V8 Lean exporter"),
            (
                PARENT_LEAN_ROOT_PATH,
                PARENT_SOURCE_COMMIT,
                PARENT_LEAN_ROOT_SHA256,
                "V4 Lean source",
            ),
            (
                PARENT_LEAN_EXPORT_PATH,
                PARENT_SOURCE_COMMIT,
                PARENT_LEAN_EXPORT_SHA256,
                "V4 Lean exporter",
            ),
            (
                SOURCE_BRIDGE_PATH,
                SOURCE_BRIDGE_COMMIT,
                SOURCE_BRIDGE_SHA256,
                "weighted source bridge",
            ),
        ):
            _base._require_committed_source(path, commit, digest, label)
        _mine()
    suffix_lines = list(expected_suffix_lines())
    suffix_sets = [frozenset(map(int, line.split()[:-1])) for line in suffix_lines]
    subset_indices: dict[frozenset[int], list[int]] = {}
    for index, suffix in enumerate(suffix_sets):
        values = tuple(suffix)
        for size in range(1, len(values) + 1):
            for subset in itertools.combinations(values, size):
                subset_indices.setdefault(frozenset(subset), []).append(index)
    witnesses = [0] * len(suffix_lines)
    parent_digest = hashlib.sha256()
    child_digest = hashlib.sha256()
    suffix_digest = hashlib.sha256()
    parent_bytes = child_bytes = parent_body = suffix_count = 0
    with (
        _open_regular_nofollow(parent_path) as parent,
        _open_regular_nofollow(child_path) as child,
    ):
        parent_stat, child_stat = os.fstat(parent.fileno()), os.fstat(child.fileno())
        parent_header, child_header = parent.readline(), child.readline()
        if not parent_header or not child_header:
            raise ValueError("DIMACS header missing")
        parent_digest.update(parent_header)
        child_digest.update(child_header)
        parent_bytes += len(parent_header)
        child_bytes += len(child_header)
        _base._parse_header(parent_header, spec.parent_clauses)
        _base._parse_header(child_header, spec.child_clauses)
        while True:
            parent_line = parent.readline()
            if not parent_line:
                break
            child_line = child.readline()
            if child_line != parent_line:
                raise ValueError("parent prefix bytes drifted")
            parent_digest.update(parent_line)
            child_digest.update(child_line)
            parent_bytes += len(parent_line)
            child_bytes += len(child_line)
            parent_body += 1
            fields = parent_line.split()
            if not fields or fields[-1] != b"0":
                raise ValueError("malformed parent clause")
            for index in subset_indices.get(frozenset(map(int, fields[:-1])), ()):
                witnesses[index] += 1
        for expected in suffix_lines:
            actual = child.readline()
            if actual != expected:
                raise ValueError("V8 suffix drifted")
            child_digest.update(actual)
            suffix_digest.update(actual)
            child_bytes += len(actual)
            suffix_count += 1
        if child.readline():
            raise ValueError("child clause census drifted")
        parent_after, child_after = os.fstat(parent.fileno()), os.fstat(child.fileno())
    for before, after, label in (
        (parent_stat, parent_after, "parent"),
        (child_stat, child_after, "child"),
    ):
        if (
            before.st_dev,
            before.st_ino,
            before.st_size,
            before.st_mtime_ns,
            before.st_nlink,
        ) != (
            after.st_dev,
            after.st_ino,
            after.st_size,
            after.st_mtime_ns,
            after.st_nlink,
        ):
            raise ValueError(f"{label} changed during validation")
    if parent_body != spec.parent_clauses or suffix_count != SUFFIX_CLAUSES:
        raise ValueError("clause census drifted")
    parent_hash, child_hash = parent_digest.hexdigest(), child_digest.hexdigest()
    if (parent_bytes, parent_hash) != (spec.parent_bytes, spec.parent_sha256):
        raise ValueError("parent identity drifted")
    if spec.child_sha256 and (child_bytes, child_hash) != (
        spec.child_bytes,
        spec.child_sha256,
    ):
        raise ValueError("child identity drifted")
    indices = tuple(i for i, count in enumerate(witnesses) if count)
    census = {
        "complete": True,
        "parent_subsumed_suffix_clause_indices": indices,
        "parent_subsumed_suffix_clause_count": len(indices),
        "witness_counts": tuple(witnesses[i] for i in indices),
        "witness_total": sum(witnesses),
    }
    suffix = {
        "sha256": suffix_digest.hexdigest(),
        "bytes": child_bytes - parent_bytes + len(parent_header) - len(child_header),
        "clauses": SUFFIX_CLAUSES,
        "occurrences": OCCURRENCES,
        "clauses_per_occurrence": CLAUSES_PER_OCCURRENCE,
    }
    if suffix["sha256"] != EXPECTED_SUFFIX_SHA256:
        raise ValueError("V8 suffix digest drifted")
    if (
        indices != EXPECTED_PARENT_SUBSUMED_SUFFIX_INDICES
        or tuple(census["witness_counts"]) != EXPECTED_PARENT_SUBSUMPTION_WITNESS_COUNTS
    ):
        raise ValueError("V8 parent-subsumption census drifted")
    return {
        "schema": VALIDATION_SCHEMA,
        "status": "PASS",
        "parent": {
            "path": str(parent_path.resolve()),
            "sha256": parent_hash,
            "bytes": parent_bytes,
            "clauses": spec.parent_clauses,
        },
        "child": {
            "path": str(child_path.resolve()),
            "sha256": child_hash,
            "bytes": child_bytes,
            "clauses": spec.child_clauses,
        },
        "suffix": suffix,
        "parent_subsumption_census": census,
    }


def _validate_export(
    parent_path=PARENT_PATH,
    child_path=CHILD_PATH,
    *,
    check_support=True,
    spec=PRODUCTION_SPEC,
):
    return _streaming_validate_export(
        parent_path, child_path, check_support=check_support, spec=spec
    )


def validate_export(parent_path: Path = PARENT_PATH, child_path: Path = CHILD_PATH):
    return _validate_export(parent_path, child_path, check_support=True)


if __name__ == "__main__":
    print(json.dumps(validate_export(), indent=2, sort_keys=True))
