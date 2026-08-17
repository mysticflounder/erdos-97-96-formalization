"""Fail-closed validator for the four-occurrence V49 zero-atom child."""

from __future__ import annotations

import json
from pathlib import Path

import validate_exact17_weighted_successor_model_export as _base

ROOT = Path(__file__).resolve().parents[1]
PARENT_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-publication-20260816/"
    "export-v1/artifacts/exact17-forty-ninth-model-refinements.cnf"
)
CHILD_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-zero-promotion-20260817/"
    "export-v1/artifacts/exact17-forty-ninth-zero-atom-promotion.cnf"
)
LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthZeroAtomPromotion.lean"
)
LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthZeroAtomPromotionExport.lean"
)
PARENT_LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthModelRefinements.lean"
)
PARENT_LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthModelRefinementsExport.lean"
)
SOURCE_BRIDGE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean"
)

SOURCE_COMMIT = "13b32f12e0831045bfb96f77997f79ed5844f497"
PARENT_SOURCE_COMMIT = "a85c515c39ee81b2b8ea4ca5736e6f87e22715f1"
SOURCE_BRIDGE_COMMIT = "f78cade13a875a2c6b4fdd9482c0d2c89c14624f"
LEAN_ROOT_SHA256 = "adc0785e7b27e8aa05049e3b2ab08c85eea49eb1d4e27c9905c6f6bd0dd27a68"
SOURCE_BASELINE_SHA256 = LEAN_ROOT_SHA256
LEAN_EXPORT_SHA256 = "40192df8308e622e99bf70b614652cc4b52167f92f1e79345d8253e431a5d1ca"
PARENT_LEAN_ROOT_SHA256 = (
    "2eeff7f73493c30fd6c10336b995cf92bbe5ce05c8d037a83774158dbe8e9996"
)
PARENT_LEAN_EXPORT_SHA256 = (
    "a2e9c0e4a37807d31bf214fbf410eba1e3ace65c41261838f0f309598116239a"
)
SOURCE_BRIDGE_SHA256 = (
    "7eae140b28dfed1c6765b29140f06846e150121d05e747179010a075f3e69e92"
)

PARENT_SHA256 = "5b95f49958ec25f6d893bc27af748d93e93073256763b81842c7d16f23d7a4c5"
PARENT_BYTES = 338_661_334
PARENT_CLAUSES = 7_198_668
CHILD_CLAUSES = 7_198_684
CHILD_BYTES = 338_662_294
CHILD_SHA256 = "5fcc67acd7dd0f1953e21679010c84e99f512b3c8cb563b4e20e478a5fe792ae"
VARIABLES = 308
OCCURRENCES = 4
CLAUSES_PER_OCCURRENCE = 4
SUFFIX_CLAUSES = 16
EXPECTED_SUFFIX_SHA256 = (
    "427516f639e0a4ffdb830833c6131c65d0e2cf2300a08dc7f6ba069283216f68"
)
VALIDATION_SCHEMA = "p97-exact17-forty-ninth-zero-atom-promotion-export-validation/v1"

_ORDERS = _base._ORDERS
ExportSpec = _base.ExportSpec

_SUPPORTS = (
    (
        (0, 1),
        (0, 9),
        (1, 0),
        (1, 8),
        (2, 1),
        (2, 10),
        (9, 0),
        (9, 10),
        (10, 8),
        (10, 9),
    ),
    (
        (0, 1),
        (0, 9),
        (1, 0),
        (1, 13),
        (4, 9),
        (4, 13),
        (9, 0),
        (9, 2),
        (13, 1),
        (13, 4),
        (14, 2),
        (14, 4),
    ),
    (
        (0, 1),
        (0, 9),
        (1, 0),
        (1, 13),
        (4, 6),
        (4, 13),
        (8, 4),
        (8, 9),
        (9, 0),
        (9, 6),
        (13, 1),
        (13, 4),
    ),
    (
        (0, 1),
        (0, 9),
        (1, 0),
        (1, 13),
        (4, 9),
        (4, 13),
        (8, 4),
        (8, 6),
        (9, 0),
        (9, 6),
        (13, 1),
        (13, 4),
    ),
)


def _mine() -> dict[str, object]:
    return {"schema": "zero-atom-adapter-bank/v1", "status": "PASS", "occurrences": 4}


def _clause_line(support, order: int, reverse: bool) -> bytes:
    return _base._clause_line(tuple(support), order, reverse)


def expected_suffix_lines():
    for support in _SUPPORTS:
        for order in range(2):
            for reverse in (False, True):
                yield _clause_line(support, order, reverse)


def _validate_export(
    parent_path=PARENT_PATH, child_path=CHILD_PATH, *, check_support=False
):
    for name in (
        "PARENT_PATH",
        "CHILD_PATH",
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
    spec = ExportSpec(
        parent_sha256=PARENT_SHA256,
        parent_bytes=PARENT_BYTES,
        parent_clauses=PARENT_CLAUSES,
        child_sha256=CHILD_SHA256,
        child_bytes=CHILD_BYTES,
        child_clauses=CHILD_CLAUSES,
        variables=VARIABLES,
    )
    result = _base._validate_export(
        parent_path, child_path, check_support=check_support, spec=spec
    )
    if result["suffix"]["clauses"] != SUFFIX_CLAUSES:
        raise ValueError("zero-atom suffix clause count drifted")
    if result["suffix"]["sha256"] != EXPECTED_SUFFIX_SHA256:
        raise ValueError("zero-atom suffix digest drifted")
    return result


def validate_export(parent_path: Path = PARENT_PATH, child_path: Path = CHILD_PATH):
    return _validate_export(parent_path, child_path, check_support=True)


if __name__ == "__main__":
    print(json.dumps(validate_export(), indent=2, sort_keys=True))
