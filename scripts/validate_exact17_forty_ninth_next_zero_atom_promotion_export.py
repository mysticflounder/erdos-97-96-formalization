"""Fail-closed validator for the two direct zero-atom V49 successor child."""

from __future__ import annotations

import json
from pathlib import Path

import validate_exact17_weighted_successor_model_export as _base

ROOT = Path(__file__).resolve().parents[1]
PARENT_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-zero-promotion-20260817/"
    "export-v1/artifacts/exact17-forty-ninth-zero-atom-promotion.cnf"
)
CHILD_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-next-zero-atoms-20260817/"
    "export-v1/artifacts/exact17-forty-ninth-next-zero-atom-promotion.cnf"
)
LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthNextZeroAtomPromotion.lean"
)
LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthNextZeroAtomPromotionExport.lean"
)
PARENT_LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthZeroAtomPromotion.lean"
)
PARENT_LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthZeroAtomPromotionExport.lean"
)
SOURCE_BRIDGE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean"
)

SOURCE_COMMIT = "a89cb5ae0702861c9835c214e246144839425483"
PARENT_SOURCE_COMMIT = "13b32f12e0831045bfb96f77997f79ed5844f497"
SOURCE_BRIDGE_COMMIT = "f78cade13a875a2c6b4fdd9482c0d2c89c14624f"
LEAN_ROOT_SHA256 = "b09e4382e399ab31e3de5308934c8d497d3483c59a052d2ebc35137b7d3cda62"
SOURCE_BASELINE_SHA256 = LEAN_ROOT_SHA256
LEAN_EXPORT_SHA256 = "811b4c76370baf7508a6341112691efc2e6b811147bd7b5f1e3c9623c1e89911"
PARENT_LEAN_ROOT_SHA256 = (
    "adc0785e7b27e8aa05049e3b2ab08c85eea49eb1d4e27c9905c6f6bd0dd27a68"
)
PARENT_LEAN_EXPORT_SHA256 = (
    "40192df8308e622e99bf70b614652cc4b52167f92f1e79345d8253e431a5d1ca"
)
SOURCE_BRIDGE_SHA256 = (
    "7eae140b28dfed1c6765b29140f06846e150121d05e747179010a075f3e69e92"
)

PARENT_SHA256 = "5fcc67acd7dd0f1953e21679010c84e99f512b3c8cb563b4e20e478a5fe792ae"
PARENT_BYTES = 338_662_294
PARENT_CLAUSES = 7_198_684
CHILD_CLAUSES = 7_198_692
CHILD_BYTES = 338_662_690
CHILD_SHA256 = "7cc24ffd79fe716c4810610bd384900684bef59444f0ead711e193e399b2a919"
VARIABLES = 308
OCCURRENCES = 2
CLAUSES_PER_OCCURRENCE = 4
SUFFIX_CLAUSES = 8
EXPECTED_SUFFIX_SHA256 = (
    "0458b926c07cf65cf63add8e63f8923acdfd7af9a7cc2cd051913a50dc68290b"
)
VALIDATION_SCHEMA = "p97-exact17-forty-ninth-next-zero-atom-promotion-export-validation/v1"

_ORDERS = _base._ORDERS
ExportSpec = _base.ExportSpec
_open_regular_nofollow = _base._open_regular_nofollow
sha256_file = _base.sha256_file

_SUPPORTS = (
    (
        (6, 5), (6, 7), (7, 6), (7, 9), (9, 7),
        (9, 12), (12, 5), (12, 9), (15, 6), (15, 12),
    ),
    (
        (5, 9), (5, 12), (8, 5), (8, 7), (9, 7),
        (9, 12), (12, 5), (12, 9),
    ),
)


def _mine() -> dict[str, object]:
    return {"schema": "next-zero-atom-adapter-bank/v1", "status": "PASS", "occurrences": 2}


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
