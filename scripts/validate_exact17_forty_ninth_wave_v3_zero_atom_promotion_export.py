"""Fail-closed validator for the direct-zero V49 wave-v3 child."""

from __future__ import annotations

import json
from pathlib import Path

import validate_exact17_forty_ninth_three_cancellation_promotion_export as _prior

ROOT = Path(__file__).resolve().parents[1]
PARENT_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-wave-v2-zero-atom-20260817/"
    "export-v1/artifacts/exact17-forty-ninth-wave-v2-zero-atom-promotion.cnf"
)
CHILD_PATH = ROOT / (
    "scratch/runs/exact17-forty-ninth-wave-v3-zero-atom-20260817/"
    "export-v1/artifacts/exact17-forty-ninth-wave-v3-zero-atom-promotion.cnf"
)
LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthWaveV3ZeroAtomPromotion.lean"
)
LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthWaveV3ZeroAtomPromotionExport.lean"
)
PARENT_LEAN_ROOT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthWaveV2ZeroAtomPromotion.lean"
)
PARENT_LEAN_EXPORT_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenFortyNinthWaveV2ZeroAtomPromotionExport.lean"
)
SOURCE_BRIDGE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenWeightedKalmansonSourceBridge.lean"
)

SOURCE_COMMIT = "a96fb149a746dc3c446cabc9937a50e252d5bc7a"
PARENT_SOURCE_COMMIT = "e5fb0c4407596f30ec7d20ff61e42b55ffae9b74"
SOURCE_BRIDGE_COMMIT = "f78cade13a875a2c6b4fdd9482c0d2c89c14624f"
LEAN_ROOT_SHA256 = "4eceb57497a56152f912071478fbadaea5fb421aff45b86952aa42f6f1fde8ae"
SOURCE_BASELINE_SHA256 = LEAN_ROOT_SHA256
LEAN_EXPORT_SHA256 = "f18cee7157fbb72d74b0472d381a40961891bcc3fbf3642002be96bc2bda8efb"
PARENT_LEAN_ROOT_SHA256 = "05577ca1edc089d0c9cfe07c822654ca13dc6230d22cc8902470df6089dec24c"
PARENT_LEAN_EXPORT_SHA256 = "93ad81f1a094c373dc825e40c3d23ec6b26248d352416ce38c0cc73935b59487"
SOURCE_BRIDGE_SHA256 = "7eae140b28dfed1c6765b29140f06846e150121d05e747179010a075f3e69e92"

PARENT_SHA256 = "d755688f5d95d3ca4301c89da14a704db97cf493b9488dbb38c85a7e4131b04b"
PARENT_BYTES = 338_663_216
PARENT_CLAUSES = 7_198_704
CHILD_CLAUSES = 7_198_708
CHILD_BYTES = 338_663_482
CHILD_SHA256 = "ba21cf3f38cce0a44241198f8e72d439c6f75f3a000df0450ae801d36415bcef"
VARIABLES = 308
OCCURRENCES = 1
CLAUSES_PER_OCCURRENCE = 4
SUFFIX_CLAUSES = 4
EXPECTED_SUFFIX_SHA256 = "2f77b016e1d4350dd74875504e6549cdb270ea5804004b4e2ed9be0e61ae7e00"
VALIDATION_SCHEMA = (
    "p97-exact17-forty-ninth-wave-v3-zero-atom-promotion-export-validation/v1"
)

_ORDERS = _prior._ORDERS
ExportSpec = _prior.ExportSpec
_open_regular_nofollow = _prior._open_regular_nofollow
sha256_file = _prior.sha256_file

_SUPPORTS = (
    (
        (7, 8),
        (7, 13),
        (8, 7),
        (8, 10),
        (10, 8),
        (10, 12),
        (12, 10),
        (12, 13),
        (12, 16),
        (13, 0),
        (13, 7),
        (16, 0),
        (16, 12),
    ),
)


def _mine() -> dict[str, object]:
    return {"schema": "wave-v3-zero-atom-adapter-bank/v1", "status": "PASS", "occurrences": 1}


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
