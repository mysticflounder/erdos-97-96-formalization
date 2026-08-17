"""Fail-closed validator for the three direct-zero V49 wave-v4 child."""

from __future__ import annotations

import json
from pathlib import Path

import validate_exact17_forty_ninth_three_cancellation_promotion_export as _prior

ROOT = Path(__file__).resolve().parents[1]
PARENT_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-wave-v3-zero-atom-20260817/"
    "export-v1/artifacts/exact17-forty-ninth-wave-v3-zero-atom-promotion.cnf"
)
CHILD_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-wave-v4-three-zero-atoms-20260817/"
    "export-v1/artifacts/exact17-forty-ninth-wave-v4-three-zero-atoms-promotion.cnf"
)
LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomPromotion.lean"
)
LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthWaveV4ThreeZeroAtomPromotionExport.lean"
)
PARENT_LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthWaveV3ZeroAtomPromotion.lean"
)
PARENT_LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthWaveV3ZeroAtomPromotionExport.lean"
)
SOURCE_BRIDGE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean"
)

SOURCE_COMMIT = "de528be70b83f28ce62c289769f1d8a3a7eb7b31"
PARENT_SOURCE_COMMIT = "a96fb149a746dc3c446cabc9937a50e252d5bc7a"
SOURCE_BRIDGE_COMMIT = "f78cade13a875a2c6b4fdd9482c0d2c89c14624f"
LEAN_ROOT_SHA256 = "0c5dff349eb26aa8375a949bcbc94c6c9cee03271f2dab0c38e91698e58478ec"
SOURCE_BASELINE_SHA256 = LEAN_ROOT_SHA256
LEAN_EXPORT_SHA256 = "7383a208b30b7228a83d9ee369cbe4712af4db64fca8e93cc7b7c15828054d7f"
PARENT_LEAN_ROOT_SHA256 = "4eceb57497a56152f912071478fbadaea5fb421aff45b86952aa42f6f1fde8ae"
PARENT_LEAN_EXPORT_SHA256 = "f18cee7157fbb72d74b0472d381a40961891bcc3fbf3642002be96bc2bda8efb"
SOURCE_BRIDGE_SHA256 = "7eae140b28dfed1c6765b29140f06846e150121d05e747179010a075f3e69e92"

PARENT_SHA256 = "ba21cf3f38cce0a44241198f8e72d439c6f75f3a000df0450ae801d36415bcef"
PARENT_BYTES = 338_663_482
PARENT_CLAUSES = 7_198_708
CHILD_CLAUSES = 7_198_720
CHILD_BYTES = 338_664_334
CHILD_SHA256 = "1245397a6da8f74ee909a0efb162dfcea2c34e38d7d118403060515ff7d3c4f6"
VARIABLES = 308
OCCURRENCES = 3
CLAUSES_PER_OCCURRENCE = 4
SUFFIX_CLAUSES = 12
EXPECTED_SUFFIX_SHA256 = "f48d4ecf1679d685c2e84770df344192e2650177ffb945b756bec00fa5a17c97"
VALIDATION_SCHEMA = (
    "p97-exact17-forty-ninth-wave-v4-three-zero-atom-promotion-export-validation/v1"
)

_ORDERS = _prior._ORDERS
ExportSpec = _prior.ExportSpec
_open_regular_nofollow = _prior._open_regular_nofollow
sha256_file = _prior.sha256_file

_SUPPORTS = (
    (
        (1, 0), (1, 16), (7, 8), (7, 13), (8, 7), (8, 10),
        (10, 8), (10, 12), (12, 10), (12, 16), (13, 0), (13, 7),
        (15, 1), (15, 13), (16, 1), (16, 12),
    ),
    (
        (1, 5), (1, 16), (5, 3), (5, 10), (10, 5), (10, 12),
        (12, 10), (12, 16), (16, 1), (16, 3), (16, 12),
    ),
    (
        (1, 4), (1, 16), (6, 1), (6, 7), (7, 4), (7, 8),
        (8, 7), (8, 10), (10, 8), (10, 12), (12, 10), (12, 16),
        (16, 1), (16, 12),
    ),
)


def _mine() -> dict[str, object]:
    return {"schema": "wave-v4-three-zero-atom-adapter-bank/v1", "status": "PASS", "occurrences": 3}


def _clause_line(support, order: int, reverse: bool) -> bytes:
    return _prior._clause_line(tuple(support), order, reverse)


def expected_suffix_lines():
    for support in _SUPPORTS:
        for order in range(2):
            for reverse in (False, True):
                yield _clause_line(support, order, reverse)


def _configure_prior() -> None:
    for name in (
        "PARENT_PATH", "CHILD_PATH", "LEAN_ROOT_PATH", "LEAN_EXPORT_PATH",
        "PARENT_LEAN_ROOT_PATH", "PARENT_LEAN_EXPORT_PATH", "SOURCE_BRIDGE_PATH",
        "SOURCE_COMMIT", "PARENT_SOURCE_COMMIT", "SOURCE_BRIDGE_COMMIT",
        "LEAN_ROOT_SHA256", "SOURCE_BASELINE_SHA256", "LEAN_EXPORT_SHA256",
        "PARENT_LEAN_ROOT_SHA256", "PARENT_LEAN_EXPORT_SHA256", "SOURCE_BRIDGE_SHA256",
        "PARENT_SHA256", "PARENT_BYTES", "PARENT_CLAUSES", "CHILD_CLAUSES",
        "CHILD_BYTES", "CHILD_SHA256", "VARIABLES", "OCCURRENCES",
        "CLAUSES_PER_OCCURRENCE", "SUFFIX_CLAUSES", "EXPECTED_SUFFIX_SHA256",
        "VALIDATION_SCHEMA",
    ):
        setattr(_prior, name, globals()[name])
    _prior._mine = _mine
    _prior.expected_suffix_lines = expected_suffix_lines
    _prior._SUPPORTS = _SUPPORTS


def _validate_export(parent_path=PARENT_PATH, child_path=CHILD_PATH, *, check_support=False):
    _configure_prior()
    result = _prior._validate_export(parent_path, child_path, check_support=check_support)
    if result["suffix"]["clauses"] != SUFFIX_CLAUSES:
        raise ValueError("wave-v2 suffix clause count drifted")
    if EXPECTED_SUFFIX_SHA256 and result["suffix"]["sha256"] != EXPECTED_SUFFIX_SHA256:
        raise ValueError("wave-v2 suffix digest drifted")
    return result


def validate_export(parent_path: Path = PARENT_PATH, child_path: Path = CHILD_PATH):
    return _validate_export(parent_path, child_path, check_support=True)


if __name__ == "__main__":
    print(json.dumps(validate_export(), indent=2, sort_keys=True))
