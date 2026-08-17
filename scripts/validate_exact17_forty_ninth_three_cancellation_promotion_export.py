"""Fail-closed validator for the two eight-hit V49 cancellation child."""

from __future__ import annotations

import json
from pathlib import Path

import validate_exact17_weighted_successor_model_export as _base

ROOT = Path(__file__).resolve().parents[1]
PARENT_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-next-zero-atoms-20260817/"
    "export-v1/artifacts/exact17-forty-ninth-next-zero-atom-promotion.cnf"
)
CHILD_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-three-cancellations-20260817/"
    "export-v1/artifacts/exact17-forty-ninth-three-cancellation-promotion.cnf"
)
LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthThreeCancellationPromotion.lean"
)
LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthThreeCancellationPromotionExport.lean"
)
PARENT_LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthNextZeroAtomPromotion.lean"
)
PARENT_LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthNextZeroAtomPromotionExport.lean"
)
SOURCE_BRIDGE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean"
)

SOURCE_COMMIT = "f375c42f25da1c9b7ab50558a705bf8d9c837178"
PARENT_SOURCE_COMMIT = "a89cb5ae0702861c9835c214e246144839425483"
SOURCE_BRIDGE_COMMIT = "f78cade13a875a2c6b4fdd9482c0d2c89c14624f"
LEAN_ROOT_SHA256 = "30e503abde6ba75d6d157da39addd3c9560c68311c3b0290078e9fa405031326"
SOURCE_BASELINE_SHA256 = LEAN_ROOT_SHA256
LEAN_EXPORT_SHA256 = "f9550ec6492c69614f130bf195ac6ccb3d7bee113f3e77fbaa40e2dc8ba73231"
PARENT_LEAN_ROOT_SHA256 = (
    "b09e4382e399ab31e3de5308934c8d497d3483c59a052d2ebc35137b7d3cda62"
)
PARENT_LEAN_EXPORT_SHA256 = (
    "811b4c76370baf7508a6341112691efc2e6b811147bd7b5f1e3c9623c1e89911"
)
SOURCE_BRIDGE_SHA256 = (
    "7eae140b28dfed1c6765b29140f06846e150121d05e747179010a075f3e69e92"
)

PARENT_SHA256 = "7cc24ffd79fe716c4810610bd384900684bef59444f0ead711e193e399b2a919"
PARENT_BYTES = 338_662_690
PARENT_CLAUSES = 7_198_692
CHILD_CLAUSES = 7_198_700
CHILD_BYTES = 338_663_036
CHILD_SHA256 = "fea9fd22ad6b487edc4c22627ab4d7553f6590842bd83e2141a29336716cd338"
VARIABLES = 308
OCCURRENCES = 2
CLAUSES_PER_OCCURRENCE = 4
SUFFIX_CLAUSES = 8
EXPECTED_SUFFIX_SHA256 = (
    "9aac36feaf5d933655044dcc72a754c3bfb9847d2d2af0019b848eb934b94dd0"
)
VALIDATION_SCHEMA = (
    "p97-exact17-forty-ninth-three-cancellation-promotion-export-validation/v1"
)

_ORDERS = _base._ORDERS
ExportSpec = _base.ExportSpec
_open_regular_nofollow = _base._open_regular_nofollow
sha256_file = _base.sha256_file

_SUPPORTS = (
    (
        (0, 13),
        (0, 15),
        (3, 14),
        (3, 15),
        (13, 0),
        (13, 14),
        (16, 0),
        (16, 13),
    ),
    (
        (5, 7),
        (5, 9),
        (7, 0),
        (7, 10),
        (8, 9),
        (8, 10),
        (9, 0),
        (9, 7),
    ),
)


def _mine() -> dict[str, object]:
    return {
        "schema": "three-cancellation-adapter-bank/v1",
        "status": "PASS",
        "occurrences": 2,
    }


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
