# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under the Apache 2.0 license as described in the file LICENSE.
"""Authenticate and exhaustively theorem-mine one exact-17 SAT cell.

The miner is offline: it reads a sealed portfolio cell, independently replays
its total assignment against every DIMACS clause, and enumerates the complete
registered source-valid family inventory.  It never contacts PIQD.  Output is
content-addressed and conforms to the acceptance schemas consumed by the
gated survivor FourPointTwoCircle-refinement portfolio runner.

Only positive selected-row incidences are treated as source facts.  In
particular, a selected four-set is not promoted to a full shell and the
``equality-exact-off-circle`` diagnostic is deliberately excluded.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib
import io
import json
import os
import stat
import sys
from collections import Counter
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from scripts import (
    run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_refinements_sat_portfolio as runner,
)

MINER_NAME = (
    "exact17-survivor-four-point-two-circle-refinements-source-valid-theorem-miner"
)
MINER_SCHEMA = "p97-exact17-survivor-four-point-two-circle-refinements-source-valid-theorem-miner/v2"
MINER_VERSION = "2"
VERIFICATION_SCHEMA = "p97-exact17-survivor-four-point-two-circle-refinements-source-valid-theorem-mine-verification/v1"
MINER_RELATIVE = (
    "scripts/mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_"
    "refinements_sat_canary.py"
)
SOURCE_VALID_FAMILIES = (
    "formalized-core-bank",
    "perpendicular-bisector-equality-component",
    "two-kalmanson-cancellation",
)
SCANNER_MODULE_NAMES = (
    "census.atail_force.producer_bank",
    "census.global_confinement.metric_realizability_probe",
    "scripts.generate_exact17_twenty_eighth_all_cancellation_refinements",
)
SCANNER_DEPENDENCIES: dict[str, dict[str, str | int]] = {
    "census/__init__.py": {
        "sha256": "02eba4836774788afdcbf87dd97629237b137a369b8053390d42a186aab08bcd",
        "bytes": 61,
    },
    "census/atail_force/__init__.py": {
        "sha256": "e73227524a5d820b5d22df4c7c7561e21d3aa67447a83cef1d83b5736b157e9e",
        "bytes": 59,
    },
    "census/atail_force/producer_bank.py": {
        "sha256": "dfe980db8def77430e917bbb55b16ecc4d977d72fa26f8218782ce3608ef1f3a",
        "bytes": 76_691,
    },
    "census/global_confinement/metric_realizability_probe.py": {
        "sha256": "1e0292737b94380bc6af535700c13cd91c48e1834abbaf336692da9f2bff2c4c",
        "bytes": 113_113,
    },
    "census/global_confinement/__init__.py": {
        "sha256": "3ae4f60e1678a8b4d158cf6d201e7a18e557c5aaa16b960a2c79aa29f7c6ea9e",
        "bytes": 247,
    },
    "census/global_confinement/equality_ideal_probe.py": {
        "sha256": "083dea6e5cc16aa304aabd9a25590966f5f973786c57164e5582970cc47ee198",
        "bytes": 35_941,
    },
    "census/global_confinement/piqd_singular_backend.py": {
        "sha256": "1c35180303e09db2192cd2934eb562f74412a67f37e0fda808484da84098ca11",
        "bytes": 41_788,
    },
    "census/global_confinement/shadow.py": {
        "sha256": "a9ab1452444cd4e79d7a4ea6fc291a1522394cad3a841c4bb439fcf67da82e62",
        "bytes": 15_921,
    },
    "census/multi_center/__init__.py": {
        "sha256": "ce92824d12576bf7b286fbff777da90d152d09c6a5b2ac47e96523b71dee33b5",
        "bytes": 54,
    },
    "census/multi_center/multi_center_census.py": {
        "sha256": "3c0b9cc574cbc2e2ae66cb6eae8710d51b578cf9732acda867d220d1ed0ab679",
        "bytes": 29_596,
    },
    "census/candidate_d_probe/q2_token.py": {
        "sha256": "71016fc8212a386ae09e76af6920d72b064327c6e6e73ed7b51954f106fc4f48",
        "bytes": 5_803,
    },
    "census/q3_two_center/q3_token.py": {
        "sha256": "795a9be85cc72c8f065e7764017daf8ef03733bfac32320579968f5aa27d163e",
        "bytes": 5_837,
    },
    "scripts/generate_exact17_twenty_eighth_all_cancellation_refinements.py": {
        "sha256": "9b318552be20475748b03ea428f27b4b197ed9721f5fa4af04999eda7633b986",
        "bytes": 26_760,
    },
    "scratch/atail-force/common_system_metric_probe.py": {
        "sha256": "18b1a91a3326b975c8baa16f82e7c692fafd5b979450bb305d4c31895cde1334",
        "bytes": 61_358,
    },
    "scratch/atail-force/second_center_metric_cegar/cegar.py": {
        "sha256": "400a7a19dc1ea665f96f5a23f0902c169c19908c1d06cf01e36293e8b0456b78",
        "bytes": 34_056,
    },
    "scratch/atail-force/second_center_metric_cegar/validator.py": {
        "sha256": "42a4bd2e053a1f5733dc570979e596448876717753b8e52c47e2b15d31fb918e",
        "bytes": 5_362,
    },
    "scratch/atail-force/second_center_metric_oracle/oracle.py": {
        "sha256": "b708722ce49f9d0f165facf20a911161815ce8018c5fc3760bf872dad6977a09",
        "bytes": 21_843,
    },
    "scratch/atail-force/second_center_query/query.py": {
        "sha256": "f0a90838a7cbd5166e58c78ac1c0c7252fb1fbd7c744dce575820e24b92dee52",
        "bytes": 10_479,
    },
    "scratch/atail-force/second_center_query/validator.py": {
        "sha256": "789c886835d01b500eeadc7bf2e32fda7a47ef2cb93e8125a9d9e8e9f98290f0",
        "bytes": 8_625,
    },
    "lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean": {
        "sha256": "6ba98c66d785a891e400d45fe7b66503ccdf431dbec995ab2dc9f184ef8ed2c9",
        "bytes": 43_413,
    },
    "lean/Erdos9796Proof/P97/ATail/KalmansonFourEqualitySchemas.lean": {
        "sha256": "72d39c2c9a1ab32ad4cd9d9bd25b5367da0fa20e123c1aa29cb0bc8c54d319e4",
        "bytes": 124_059,
    },
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "GenericRowNogoodCertificate.lean"
    ): {
        "sha256": "7abfcb6e3d0982dc504a29b3771cb634873d995724fd8c87f4811e412b39e84d",
        "bytes": 42_287,
    },
    (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
        "GenericPerpBisectorNogoodCertificate.lean"
    ): {
        "sha256": "e555bd6513c7fcdc54d9334957ba78f7c3da4a9b0a77d0f5f87e095d305fe21a",
        "bytes": 2_757,
    },
    "lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean": {
        "sha256": "357953198533077fb9a268c14e83e8318961a2d3ae10766e80c1debb96b53d79",
        "bytes": 20_971,
    },
    "lean/Erdos9796Proof/P97/Census554/ConvexFivePointCore.lean": {
        "sha256": "298ed086af97a18e73a29352a34691394b9b3790597af75e7d859b1080b578eb",
        "bytes": 8_340,
    },
    "lean/Erdos9796Proof/P97/Census554/ConvexRhombusCore.lean": {
        "sha256": "eb31b3cf6b7294aff42f4a56cb16ae70b765e5bff2a883ef2ac37e41aec91047",
        "bytes": 14_458,
    },
    "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean": {
        "sha256": "be6fd1fb7fa204966ed21bcb9ad4af783d2176d94e5f53b6a8ca23b7a668d187",
        "bytes": 15_758,
    },
    "lean/Erdos9796Proof/P97/Census554/FiveRowCircleIntersectionOrderCore.lean": {
        "sha256": "a10d2d269b127e0bbd1530bd130905a7e1a42974483b628ec9eaea814fe7998e",
        "bytes": 5_545,
    },
    "lean/Erdos9796Proof/P97/Census554/FourPointTwoCircleBisectorOrderCore.lean": {
        "sha256": "138fa060b2463be7865f8c0ce6fc747a448357b08a416e6ddeb6916e003de19f",
        "bytes": 3_711,
    },
    "lean/Erdos9796Proof/P97/Census554/MECStraddlingRowCore.lean": {
        "sha256": "2240e23f16267ab501460647c29d072f1a0a866b664995cafe0b9e073019bdea",
        "bytes": 17_049,
    },
    "lean/Erdos9796Proof/P97/Census554/NestedEqualChordCore.lean": {
        "sha256": "15113000cfa72743a85e0ee519d8aaf7341b807a352b4ae04e3b8d8898526762",
        "bytes": 9_640,
    },
    "lean/Erdos9796Proof/P97/Census554/SixPointCircleChainOrderCore.lean": {
        "sha256": "749567c809af7b325bfb4d87d9cda19538e3d9ddcce13cf5683882091afa6096",
        "bytes": 16_543,
    },
    "lean/Erdos9796Proof/P97/Census554/SixPointNestedCenterOrderCore.lean": {
        "sha256": "189b51cb3eb0396626ae3be56d61850d30f07d7a96834586e07818efe88018d9",
        "bytes": 12_949,
    },
    "lean/Erdos9796Proof/P97/Census554/SixPointTwoCircleArcOvertakeOrderCore.lean": {
        "sha256": "6ec3f2860bd72940af5b0ea796e9e3249b642dac433fb3dcb54220933eb4acd1",
        "bytes": 18_343,
    },
    "lean/Erdos9796Proof/P97/Census554/SixPointTwoCircleOrderCore.lean": {
        "sha256": "85f90dc926eb211cf1d88014840e1a67b584a8b692d8c7a5f0e99290fca21378",
        "bytes": 21_371,
    },
}

# Every stage which the current authenticated producer/common-system bank can
# return.  A future bank stage is rejected until its source assumptions and
# Lean consumer are reviewed here.  Exact-off-circle and the two-Kalmanson
# duplicate are recognized below but deliberately not promoted as formalized
# core candidates.
APPROVED_FORMALIZED_STAGES = frozenset(
    {
        "equality-duplicate-center",
        "equality-exact-off-circle",
        "equality-perpendicular-bisector-convex",
        "equality-equal-k4",
        "equality-equilateral-bisector-collision",
        "equality-three-triad-collision",
        "equality-surplus-source-collision",
        "equality-six-row-anchor-collision",
        "equality-six-point-two-pair-collision",
        "equality-six-point-five-circle-collision-a",
        "equality-six-point-five-circle-collision-b",
        "equality-six-point-five-circle-collision-c",
        "equality-seven-point-five-circle-collision",
        "equality-eight-point-five-circle-collision",
        "equality-six-point-circle-chain-collision",
        "equality-seven-point-six-circle-collision",
        "equality-seven-point-six-circle-collision-b",
        "equality-seven-point-twin-four-circle-collision",
        "equality-seven-point-orbit-collision",
        "equality-seven-point-circle-network-collision",
        "equality-convex-two-kalmanson-cancellation",
        "equality-convex-five-point-three-selected-row-kalmanson",
        "equality-convex-seven-point-four-selected-row-kalmanson-c",
        "equality-convex-seven-point-four-selected-row-kalmanson-c-reverse",
        "equality-convex-seven-point-four-selected-row-kalmanson-f",
        "equality-convex-seven-point-four-selected-row-kalmanson-f-reverse",
        "equality-convex-seven-point-four-selected-row-kalmanson-l",
        "equality-convex-seven-point-four-selected-row-kalmanson-l-reverse",
        "equality-convex-eight-point-five-selected-row-kalmanson-m",
        "equality-convex-eight-point-five-selected-row-kalmanson-m-reverse",
        "equality-convex-six-point-four-selected-row-kalmanson-d",
        "equality-convex-six-point-four-selected-row-kalmanson-d-reverse",
        "equality-convex-six-point-four-selected-row-kalmanson-e",
        "equality-convex-six-point-four-selected-row-kalmanson-e-reverse",
        "equality-convex-six-point-four-selected-row-kalmanson-g",
        "equality-convex-six-point-four-selected-row-kalmanson-g-reverse",
        "equality-convex-six-point-four-selected-row-kalmanson-k",
        "equality-convex-six-point-four-selected-row-kalmanson-k-reverse",
        "equality-convex-five-point",
        "equality-convex-five-point-reverse",
        "equality-convex-rhombus-equilateral",
        "equality-convex-rhombus-equilateral-reverse",
        "equality-convex-eight-point-five-row-circle-intersection-order",
        "equality-convex-eight-point-five-row-circle-intersection-order-reverse",
        "equality-convex-nested-equal-chords",
        "equality-convex-six-point-two-circle-arc-overtake-order",
        "equality-convex-six-point-two-circle-arc-overtake-order-reverse",
        "equality-convex-six-point-nested-center-order",
        "equality-convex-six-point-nested-center-order-reverse",
        "equality-convex-six-point-two-circle-order",
        "equality-convex-six-point-two-circle-order-reverse",
        "equality-convex-six-point-circle-chain-order",
        "equality-convex-six-point-circle-chain-order-reverse",
        "equality-convex-four-point-two-circle-bisector-order",
        "equality-convex-four-point-two-circle-bisector-order-reverse",
    }
)
APPROVED_LEAN_CONSUMERS = frozenset(
    {
        (
            "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
            "false_of_twoKalmansonCancellationData_of_check"
        ),
        (
            "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
            "false_of_weightedKalmansonCancellationData_of_check"
        ),
        (
            "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
            "nonempty_perpBisectorCore_of_positiveCheck"
        ),
        "Problem97.CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order",
        "Problem97.Census554.ConvexFivePointCore.false_of_core",
        "Problem97.Census554.ConvexFivePointCore.false_of_core_of_neg",
        "Problem97.Census554.ConvexRhombusCore.false_of_core",
        "Problem97.Census554.ConvexRhombusCore.false_of_core_of_neg",
        "Problem97.Census554.EqualityCore.false_of_fivePointHingeCycleCore",
        "Problem97.Census554.EqualityCore.false_of_sevenPointHingeClosedTailCore",
        "Problem97.Census554.EqualityCore.false_of_sixPointHingeDoubleSpokeCore",
        "Problem97.Census554.EqualityCore.false_of_sixPointHingeTailCore",
        "Problem97.Census554.FiveRowCircleIntersectionOrderCore.false_of_core",
        "Problem97.Census554.FiveRowCircleIntersectionOrderCore.false_of_core_of_neg",
        "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core",
        "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_neg",
        "Problem97.Census554.MECStraddlingRowCore.false_of_core",
        "Problem97.Census554.MECStraddlingRowCore.false_of_core_of_neg",
        "Problem97.Census554.NestedEqualChordCore.false_of_core",
        "Problem97.Census554.SixPointCircleChainOrderCore.false_of_core",
        "Problem97.Census554.SixPointCircleChainOrderCore.false_of_core_of_neg",
        "Problem97.Census554.SixPointNestedCenterOrderCore.false_of_core",
        "Problem97.Census554.SixPointNestedCenterOrderCore.false_of_core_of_neg",
        "Problem97.Census554.SixPointTwoCircleArcOvertakeOrderCore.false_of_core",
        "Problem97.Census554.SixPointTwoCircleArcOvertakeOrderCore.false_of_core_of_neg",
        "Problem97.Census554.SixPointTwoCircleOrderCore.false_of_core",
        "Problem97.Census554.SixPointTwoCircleOrderCore.false_of_core_of_neg",
        "Problem97.Census554.false_of_metricCoreAlternative",
    }
    | {
        "Problem97.CapCrossingKalmansonBridge."
        f"false_of_{rows}_selected_rows_in_{points}_ccw_order_{schema}{suffix}"
        for rows, points, schema in (
            ("four", "seven", "C"),
            ("four", "six", "D"),
            ("four", "six", "E"),
            ("four", "seven", "F"),
            ("four", "six", "G"),
            ("four", "six", "K"),
            ("four", "seven", "L"),
            ("five", "eight", "M"),
        )
        for suffix in ("", "_of_decreasing")
    }
)
NUM_POINTS = 17
NUM_VARIABLES = 308
NUM_CLAUSES = 7_409_522
ORDER_TABLES = {
    0: (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    1: (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
}
NAMED_ORDER_VARIABLES = {0: 307, 1: 308}
MAX_JSON_BYTES = 32 << 20
MAX_CNF_BYTES = 512 << 20
RECEIPT_NAMES = (
    "candidate-ledger.json",
    "sat-replay-receipt.json",
    "mine-receipt.json",
    "canary-acceptance.json",
)


class MineError(ValueError):
    """An authenticated input or theorem-mine invariant failed closed."""


@dataclass(frozen=True)
class ScannerModules:
    """Scanner code loaded only after its source inventory is authenticated."""

    producer_bank: Any
    validate_complete_perpendicular_bisector_certificate: Any
    lean_occurrence_check: Any
    path_hits: Any
    project_record_for_lean: Any
    reflected: Any
    dependency_inventory: Mapping[str, Mapping[str, str | int]]


_AUTHENTICATED_SCANNER_MODULES: ScannerModules | None = None


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise MineError(message)


def _unique(pairs: list[tuple[str, Any]], label: str) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"{label} contains duplicate key {key!r}")
        result[key] = value
    return result


def strict_json(raw: bytes, label: str, *, canonical: bool = True) -> dict[str, Any]:
    try:
        value = json.loads(
            raw,
            object_pairs_hook=lambda pairs: _unique(pairs, label),
            parse_constant=lambda value: (_ for _ in ()).throw(ValueError(value)),
        )
    except (UnicodeDecodeError, ValueError, RecursionError) as exc:
        raise MineError(f"{label} is not strict JSON") from exc
    _require(type(value) is dict, f"{label} is not a JSON object")
    if canonical:
        _require(canonical_json_bytes(value) == raw, f"{label} is not canonical JSON")
    return value


def _read_private(path: Path, maximum: int, label: str) -> bytes:
    try:
        info = path.lstat()
        _require(stat.S_ISREG(info.st_mode), f"{label} is not a regular file")
        _require(info.st_nlink == 1, f"{label} has multiple hard links")
        _require(info.st_mode & 0o022 == 0, f"{label} is group/world writable")
        descriptor = os.open(path, os.O_RDONLY | os.O_NOFOLLOW)
        try:
            opened = os.fstat(descriptor)
            _require(
                (opened.st_dev, opened.st_ino) == (info.st_dev, info.st_ino),
                f"{label} changed during descriptor acquisition",
            )
            chunks: list[bytes] = []
            size = 0
            while True:
                chunk = os.read(descriptor, min(1 << 20, maximum + 1 - size))
                if not chunk:
                    break
                chunks.append(chunk)
                size += len(chunk)
                _require(size <= maximum, f"{label} exceeds byte bound")
            final = os.fstat(descriptor)
            _require(
                (final.st_dev, final.st_ino, final.st_size)
                == (opened.st_dev, opened.st_ino, opened.st_size),
                f"{label} changed during read",
            )
            return b"".join(chunks)
        finally:
            os.close(descriptor)
    except OSError as exc:
        raise MineError(f"cannot read {label}: {path}") from exc


def authenticate_scanner_dependencies(root: Path) -> dict[str, dict[str, str | int]]:
    """Re-read every proof-critical scanner/consumer dependency by digest."""

    observed: dict[str, dict[str, str | int]] = {}
    for relative, expected in sorted(SCANNER_DEPENDENCIES.items()):
        raw = _read_private(root / relative, int(expected["bytes"]), relative)
        actual = {"sha256": sha256_bytes(raw), "bytes": len(raw)}
        _require(actual == expected, f"proof-critical dependency drifted: {relative}")
        observed[relative] = actual
    return observed


def load_scanner_modules(root: Path) -> ScannerModules:
    """Authenticate scanner bytes before importing or executing scanner code."""

    global _AUTHENTICATED_SCANNER_MODULES
    inventory = authenticate_scanner_dependencies(root)
    if _AUTHENTICATED_SCANNER_MODULES is None:
        already_loaded = sorted(
            name for name in SCANNER_MODULE_NAMES if name in sys.modules
        )
        _require(
            not already_loaded,
            "proof-critical scanner imported before source preflight: "
            + ", ".join(already_loaded),
        )
        producer = importlib.import_module(SCANNER_MODULE_NAMES[0])
        metric = importlib.import_module(SCANNER_MODULE_NAMES[1])
        renderer = importlib.import_module(SCANNER_MODULE_NAMES[2])
        _AUTHENTICATED_SCANNER_MODULES = ScannerModules(
            producer_bank=producer,
            validate_complete_perpendicular_bisector_certificate=(
                metric.validate_complete_perpendicular_bisector_certificate
            ),
            lean_occurrence_check=renderer.lean_occurrence_check,
            path_hits=renderer.path_hits,
            project_record_for_lean=renderer.project_record_for_lean,
            reflected=renderer.reflected,
            dependency_inventory=inventory,
        )
    else:
        _require(
            dict(_AUTHENTICATED_SCANNER_MODULES.dependency_inventory) == inventory,
            "loaded scanner dependency inventory drifted",
        )
    return _AUTHENTICATED_SCANNER_MODULES


def _relative(root: Path, path: Path) -> str:
    root = Path(os.path.abspath(root))
    path = Path(os.path.abspath(path))
    try:
        value = PurePosixPath(path.relative_to(root).as_posix())
    except ValueError as exc:
        raise MineError(f"output escapes repository root: {path}") from exc
    _require(
        value.parts and all(part not in {"", ".", ".."} for part in value.parts),
        "unsafe repository-relative path",
    )
    return value.as_posix()


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    unsigned = dict(value)
    unsigned.pop(field, None)
    return sha256_bytes(canonical_json_bytes(unsigned))


def _file_ref(root: Path, path: Path, raw: bytes) -> dict[str, Any]:
    return {
        "path": _relative(root, path),
        "sha256": sha256_bytes(raw),
        "bytes": len(raw),
    }


def validate_output_dir(run_root: Path, output_dir: Path) -> None:
    """Require the real, non-symlink runner artifact directory exactly."""

    expected = run_root / "artifacts"
    _require(
        Path(os.path.abspath(output_dir)) == Path(os.path.abspath(expected)),
        "receipt output must be the runner artifact directory",
    )
    try:
        info = output_dir.lstat()
        _require(stat.S_ISDIR(info.st_mode), "receipt output is not a directory")
        _require(info.st_mode & 0o022 == 0, "receipt output is group/world writable")
        _require(
            output_dir.resolve(strict=True) == expected.resolve(strict=True),
            "receipt output resolves outside the runner artifact directory",
        )
    except OSError as exc:
        raise MineError("receipt output directory is unavailable") from exc


def _write_once(path: Path, raw: bytes) -> None:
    _require(path.name not in {"", ".", ".."}, "unsafe output filename")
    parent_info = path.parent.lstat()
    _require(stat.S_ISDIR(parent_info.st_mode), "output parent is not a directory")
    _require(parent_info.st_mode & 0o022 == 0, "output parent is group/world writable")
    parent_fd = os.open(path.parent, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        opened_parent = os.fstat(parent_fd)
        _require(
            (opened_parent.st_dev, opened_parent.st_ino)
            == (parent_info.st_dev, parent_info.st_ino),
            "output parent changed during descriptor acquisition",
        )
        try:
            descriptor = os.open(
                path.name,
                os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
                0o600,
                dir_fd=parent_fd,
            )
        except FileExistsError:
            descriptor = os.open(
                path.name, os.O_RDONLY | os.O_NOFOLLOW, dir_fd=parent_fd
            )
            try:
                info = os.fstat(descriptor)
                _require(
                    stat.S_ISREG(info.st_mode)
                    and info.st_nlink == 1
                    and info.st_mode & 0o022 == 0,
                    "existing output custody is unsafe",
                )
                existing = bytearray()
                while len(existing) <= len(raw):
                    chunk = os.read(descriptor, len(raw) + 1 - len(existing))
                    if not chunk:
                        break
                    existing.extend(chunk)
                _require(bytes(existing) == raw, f"existing output differs: {path}")
            finally:
                os.close(descriptor)
            return
        try:
            view = memoryview(raw)
            while view:
                count = os.write(descriptor, view)
                _require(count > 0, f"short output write: {path}")
                view = view[count:]
            os.fsync(descriptor)
        finally:
            os.close(descriptor)
        # Make the create-once directory entry durable before a later phase
        # treats the receipt as accepted custody.
        os.fsync(parent_fd)
    finally:
        os.close(parent_fd)


@dataclass(frozen=True)
class AuthenticatedInputs:
    root: Path
    run_root: Path
    campaign_sha256: str
    run_manifest_sha256: str
    cell: dict[str, Any]
    terminal: dict[str, Any]
    cnf: bytes
    producer_raw: bytes
    wave_raw: bytes
    model_raw: bytes
    model: dict[str, Any]


def authenticate_inputs(
    *, root: Path, run_root: Path, portfolio_cell_id: str
) -> AuthenticatedInputs:
    """Authenticate campaign, cell, sealed SAT terminal, and all input bytes."""

    _require(
        portfolio_cell_id == runner.CANARY_PORTFOLIO_CELL_ID,
        "this receipt layout is canary-only",
    )
    try:
        authoritative_root = runner.OUTPUT_ROOT.resolve(strict=True)
        supplied_root = run_root.resolve(strict=True)
    except OSError as exc:
        raise MineError("portfolio run root is unavailable") from exc
    _require(
        supplied_root == authoritative_root,
        "portfolio run root is not the runner-owned production root",
    )
    # This is the authoritative production ingress: it enforces finalized
    # pins and reauthenticates campaign/run support plus all 76 cell identity
    # triples.  Calling validate_campaign_payload alone would admit a forged,
    # self-rehashed campaign.
    checked = runner.static_check(root=root, run_root=run_root)
    matches = [
        cell
        for cell in checked["cells"]
        if cell["portfolio_cell_id"] == portfolio_cell_id
    ]
    _require(len(matches) == 1, "portfolio cell is missing or duplicated")
    cell = matches[0]
    cnf, producer_raw, _wave = runner._load_cell_inputs(root, cell)
    wave_raw = _read_private(
        root / cell["wave_manifest"]["path"], 4 << 20, "wave manifest"
    )
    _require(
        sha256_bytes(wave_raw) == cell["wave_manifest"]["sha256"],
        "wave manifest changed after authenticated load",
    )
    terminal = runner._terminal_cell(root, run_root, cell)
    _require(terminal["outcome"] == runner.STRUCTURAL_SAT, "terminal is not SAT")
    model_digest = terminal["artifacts"].get("model_sha256")
    _require(type(model_digest) is str, "SAT terminal model digest is missing")
    model_raw = runner._artifact_bytes(
        run_root,
        portfolio_cell_id,
        model_digest,
        "SAT model",
        MAX_JSON_BYTES,
    )
    _require(sha256_bytes(model_raw) == model_digest, "SAT model digest drifted")
    # PIQD model artifacts are hash-authenticated but not required to use the
    # repository's canonical JSON serializer (historical artifacts include a
    # trailing newline).  Strict duplicate-key/NaN rejection still applies.
    model = strict_json(model_raw, "SAT model", canonical=False)
    _require(
        model.get("result") == "SAT" and model.get("job_id") == terminal["job_id"],
        "SAT model terminal binding drifted",
    )
    # Re-read the producer after the terminal audit; no mutable path may be
    # trusted across the potentially long CNF replay.
    producer_again = _read_private(
        root / cell["producer_manifest"]["path"], 4 << 20, "producer manifest"
    )
    _require(producer_again == producer_raw, "producer changed during authentication")
    return AuthenticatedInputs(
        root=root,
        run_root=run_root,
        campaign_sha256=checked["campaign_sha256"],
        run_manifest_sha256=checked["run_manifest_sha256"],
        cell=cell,
        terminal=terminal,
        cnf=cnf,
        producer_raw=producer_raw,
        wave_raw=wave_raw,
        model_raw=model_raw,
        model=model,
    )


def decode_model(
    scanner: ScannerModules, model: Mapping[str, Any], *, expected_center: int
) -> tuple[dict[int, bool], dict[str, Any], tuple[Any, ...]]:
    literals = model.get("assignment")
    _require(
        type(literals) is list
        and model.get("num_assigned") == NUM_VARIABLES
        and len(literals) == NUM_VARIABLES,
        "SAT assignment is incomplete",
    )
    values: dict[int, bool] = {}
    for literal in literals:
        _require(
            type(literal) is int
            and literal != 0
            and abs(literal) <= NUM_VARIABLES
            and abs(literal) not in values,
            "SAT assignment literal is malformed or duplicated",
        )
        values[abs(literal)] = literal > 0
    _require(
        set(values) == set(range(1, NUM_VARIABLES + 1)),
        "SAT assignment is not total",
    )
    rows = tuple(
        scanner.producer_bank.MetricRow(
            center,
            tuple(
                point
                for point in range(NUM_POINTS)
                if values[1 + NUM_POINTS * center + point]
            ),
            False,
        )
        for center in range(NUM_POINTS)
    )
    _require(
        all(len(row.support) == 4 and row.center not in row.support for row in rows),
        "decoded selected rows are not exact-four off-center subsets",
    )
    next_centers = [center for center in range(NUM_POINTS) if values[290 + center]]
    _require(next_centers == [expected_center], "nextCenter selector drifted")
    named_orders = [
        index for index, variable in NAMED_ORDER_VARIABLES.items() if values[variable]
    ]
    _require(named_orders in ([0], [1]), "NamedOrder selector is not one-hot")
    order_index = named_orders[0]
    order = ORDER_TABLES[order_index]
    decoded = {
        "rows": {str(row.center): list(row.support) for row in rows},
        "nextCenter": expected_center,
        "NamedOrder": order_index,
        "order": list(order),
        "assignment_sha256": sha256_bytes(" ".join(map(str, literals)).encode()),
    }
    return values, decoded, rows


def replay_dimacs(cnf: bytes, values: Mapping[int, bool]) -> dict[str, Any]:
    """Stream every clause and independently evaluate the total assignment."""

    header: tuple[int, int] | None = None
    pending: list[int] = []
    checked = 0
    for line_number, raw in enumerate(io.BytesIO(cnf), 1):
        try:
            fields = raw.decode("ascii").strip().split()
        except UnicodeDecodeError as exc:
            raise MineError(f"non-ASCII DIMACS at line {line_number}") from exc
        if not fields or fields[0] == "c":
            continue
        if fields[0] == "p":
            _require(
                header is None and fields[:2] == ["p", "cnf"] and len(fields) == 4,
                f"invalid DIMACS header at line {line_number}",
            )
            header = (int(fields[2]), int(fields[3]))
            continue
        _require(header is not None, "DIMACS clause precedes header")
        for token in fields:
            literal = int(token)
            if literal:
                _require(
                    0 < abs(literal) <= NUM_VARIABLES,
                    "DIMACS literal is outside the variable map",
                )
                pending.append(literal)
                continue
            checked += 1
            _require(
                pending and any(values[abs(lit)] == (lit > 0) for lit in pending),
                f"SAT assignment falsifies DIMACS clause {checked}",
            )
            pending.clear()
    _require(not pending, "DIMACS ends with an unterminated clause")
    _require(
        header == (NUM_VARIABLES, NUM_CLAUSES) and checked == NUM_CLAUSES,
        "DIMACS dimensions or replay count drifted",
    )
    return {
        "num_variables": NUM_VARIABLES,
        "clauses_checked": checked,
        "all_clauses_satisfied": True,
        "cnf_sha256": hashlib.sha256(cnf).hexdigest(),
    }


def _candidate(
    *,
    family: str,
    lean_consumer: str,
    support: Sequence[Any],
    payload: Mapping[str, Any],
) -> dict[str, Any]:
    _require(family in SOURCE_VALID_FAMILIES, "unknown candidate family")
    _require(
        lean_consumer in APPROVED_LEAN_CONSUMERS,
        f"unreviewed or unbanked Lean consumer: {lean_consumer}",
    )
    canonical_support = sorted(
        {canonical_json_bytes(item): item for item in support}.values(),
        key=canonical_json_bytes,
    )
    record: dict[str, Any] = {
        "schema": runner.WAVE_MINE_CANDIDATE_SCHEMA,
        "family": family,
        "source_valid": True,
        "lean_consumer": lean_consumer,
        "support": canonical_support,
        "payload": dict(payload),
    }
    identity = runner._candidate_id(record)
    record["candidate_id"] = identity
    record["record_sha256"] = _self_hash(record, "record_sha256")
    return record


def enumerate_candidates(
    scanner: ScannerModules, rows: tuple[Any, ...], order: tuple[int, ...]
) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    """Exhaust all three registered source-valid theorem families."""

    reverse_order = tuple(reversed(order))
    forward = scanner.producer_bank.enumerate_two_kalmanson_cancellations(
        rows, NUM_POINTS, order, max_cores=100_000
    )
    reverse = scanner.producer_bank.enumerate_two_kalmanson_cancellations(
        rows, NUM_POINTS, reverse_order, max_cores=100_000
    )
    forward_by_support = {scanner.path_hits(record): record for record in forward}
    reverse_by_support = {scanner.path_hits(record): record for record in reverse}
    minimal_forward = sorted(
        (
            hits
            for hits in forward_by_support
            if not any(other < hits for other in forward_by_support)
        ),
        key=lambda hits: (len(hits), sorted(hits)),
    )
    minimal_reverse = sorted(
        (
            hits
            for hits in reverse_by_support
            if not any(other < hits for other in reverse_by_support)
        ),
        key=lambda hits: (len(hits), sorted(hits)),
    )
    # A Lean occurrence need not use the same path support in both boundary
    # orientations.  Its forward choices must be covered by ``hits`` and its
    # reverse choices by ``Fin.rev hits``.  Pair every minimal certificate and
    # retain the inclusion-minimal unions that satisfy exactly that contract.
    paired_by_occurrence: dict[
        frozenset[tuple[int, int]],
        tuple[frozenset[tuple[int, int]], frozenset[tuple[int, int]]],
    ] = {}
    paired_key: dict[frozenset[tuple[int, int]], tuple[Any, ...]] = {}
    for forward_hits in minimal_forward:
        for reverse_hits in minimal_reverse:
            occurrence_hits = forward_hits | scanner.reflected(reverse_hits)
            key = (
                len(forward_hits) + len(reverse_hits),
                tuple(sorted(forward_hits)),
                tuple(sorted(reverse_hits)),
            )
            if occurrence_hits not in paired_key or key < paired_key[occurrence_hits]:
                paired_key[occurrence_hits] = key
                paired_by_occurrence[occurrence_hits] = (
                    forward_hits,
                    reverse_hits,
                )
    minimal_occurrences = sorted(
        (
            hits
            for hits in paired_by_occurrence
            if not any(other < hits for other in paired_by_occurrence)
        ),
        key=lambda hits: (len(hits), sorted(hits)),
    )
    position = {label: index for index, label in enumerate(order)}
    positive_hits = frozenset(
        (position[row.center], position[point]) for row in rows for point in row.support
    )
    candidates: list[dict[str, Any]] = []
    paired = 0
    for hits in minimal_occurrences:
        _require(
            hits <= positive_hits,
            "two-Kalmanson occurrence is not positive in the SAT model",
        )
        forward_hits, reverse_hits = paired_by_occurrence[hits]
        reverse_record = reverse_by_support[reverse_hits]
        forward_source = scanner.project_record_for_lean(
            forward_by_support[forward_hits], forward_hits, order, rows
        )
        reverse_source = scanner.project_record_for_lean(
            reverse_record, reverse_hits, reverse_order, rows
        )
        _require(
            scanner.lean_occurrence_check(
                hits,
                forward_source,
                reverse_source,
                rows=rows,
                forward_order=order,
                reverse_order=reverse_order,
            ),
            "two-Kalmanson source occurrence did not replay",
        )
        paired += 1
        candidates.append(
            _candidate(
                family="two-kalmanson-cancellation",
                lean_consumer=(
                    "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
                    "false_of_twoKalmansonCancellationData_of_check"
                ),
                support=[list(hit) for hit in sorted(hits)],
                payload={
                    "forward": forward_source,
                    "reverse": reverse_source,
                    "paired_forward_reverse_replay": True,
                    "occurrence_union_cover": True,
                    "forward_path_support": [list(hit) for hit in sorted(forward_hits)],
                    "reverse_path_support": [list(hit) for hit in sorted(reverse_hits)],
                },
            )
        )

    formalized = scanner.producer_bank.scan_all_formalized_cores(
        rows, NUM_POINTS, order
    )
    excluded: Counter[str] = Counter()
    for record in formalized:
        stage = str(record["stage"])
        _require(
            stage in APPROVED_FORMALIZED_STAGES,
            f"unreviewed formalized-core stage: {stage}",
        )
        if stage in {
            "equality-convex-two-kalmanson-cancellation",
            "equality-exact-off-circle",
        }:
            excluded[stage] += 1
            continue
        # The formalized producer bank has grown beyond the older finite set
        # of handwritten minimizers.  Retaining every positive selected-row
        # atom is conservative, source-clean, and complete: the canonical bank
        # record itself identifies the theorem pattern, while this support
        # witnesses that the record was found in this exact assignment.
        hits = frozenset((row.center, point) for row in rows for point in row.support)
        candidates.append(
            _candidate(
                family="formalized-core-bank",
                lean_consumer=str(record["lean_consumer"]),
                support=[list(hit) for hit in sorted(hits)],
                payload={
                    "canonical_bank_record": record,
                    "full_selected_row_support_replay": True,
                },
            )
        )

    component = scanner.producer_bank.complete_perpendicular_bisector_certificate(
        rows, NUM_POINTS, order
    )
    replay_component = {
        key: value
        for key, value in component.items()
        if key not in {"lean_consumer", "order"}
    }
    _require(
        component.get("status") == "COMPLETE"
        and component.get("complete") is True
        and scanner.validate_complete_perpendicular_bisector_certificate(
            rows, NUM_POINTS, replay_component
        ),
        "complete equality-component certificate failed replay",
    )
    for occurrence in component["candidates"]:
        atoms: set[tuple[int, int]] = set()
        for witness in occurrence["witnesses"]:
            for step in witness["path"]["steps"]:
                if step["kind"] == "row":
                    atoms.add((step["center"], step["first"]))
                    atoms.add((step["center"], step["second"]))
        _require(atoms, "perpendicular-bisector candidate has no positive-row path")
        candidates.append(
            _candidate(
                family="perpendicular-bisector-equality-component",
                lean_consumer=str(component["lean_consumer"]),
                support=[list(atom) for atom in sorted(atoms)],
                payload={"occurrence": occurrence, "complete_scan": True},
            )
        )

    unique = {candidate["candidate_id"]: candidate for candidate in candidates}
    _require(len(unique) == len(candidates), "duplicate candidate identity was mined")
    ordered = [unique[key] for key in sorted(unique)]
    inventory = {
        "two-kalmanson-cancellation": paired,
        "formalized-core-bank": sum(
            candidate["family"] == "formalized-core-bank" for candidate in ordered
        ),
        "perpendicular-bisector-equality-component": len(component["candidates"]),
    }
    return ordered, {
        "family_candidate_counts": dict(sorted(inventory.items())),
        "formalized_stage_counts": dict(
            sorted(Counter(str(record["stage"]) for record in formalized).items())
        ),
        "excluded_diagnostic_stage_counts": dict(sorted(excluded.items())),
        "complete_equality_component_counts": component["counts"],
        "two_kalmanson_pairing_counts": {
            "forward_record_count": len(forward),
            "reverse_record_count": len(reverse),
            "minimal_forward_support_count": len(minimal_forward),
            "minimal_reverse_support_count": len(minimal_reverse),
            "paired_union_count": len(paired_by_occurrence),
            "minimal_paired_union_count": len(minimal_occurrences),
        },
    }


def validate_candidate_records(candidates: Sequence[Any]) -> None:
    """Validate the exact runner-owned candidate schema and content hashes."""

    runner._validate_candidate_records(candidates, SOURCE_VALID_FAMILIES)


def build_candidate_ledger(
    *,
    inputs: AuthenticatedInputs,
    decoded: Mapping[str, Any],
    scanner: ScannerModules,
    rows: tuple[Any, ...],
    scanner_sha256: str,
    dependency_inventory: Mapping[str, Mapping[str, str | int]],
) -> dict[str, Any]:
    producer = strict_json(inputs.producer_raw, "producer manifest")
    variable_map_sha256 = producer.get("variable_map_sha256")
    _require(
        type(variable_map_sha256) is str and len(variable_map_sha256) == 64,
        "producer variable-map digest is missing",
    )
    candidates, inventory = enumerate_candidates(scanner, rows, tuple(decoded["order"]))
    validate_candidate_records(candidates)
    _require(
        dict(dependency_inventory) == SCANNER_DEPENDENCIES,
        "scanner dependency inventory is not authenticated",
    )
    ledger: dict[str, Any] = {
        "schema": runner.WAVE_MINE_LEDGER_SCHEMA,
        "status": "COMPLETE",
        "portfolio_cell_id": inputs.cell["portfolio_cell_id"],
        "job_id": inputs.terminal["job_id"],
        "model_sha256": sha256_bytes(inputs.model_raw),
        "cnf_sha256": sha256_bytes(inputs.cnf),
        "producer_manifest_sha256": sha256_bytes(inputs.producer_raw),
        "wave_manifest_sha256": sha256_bytes(inputs.wave_raw),
        "variable_map_sha256": variable_map_sha256,
        "source_valid_only": True,
        "scan_complete": True,
        "candidates_examined": len(candidates),
        "complete_no_candidates": not candidates,
        "scanner": {
            "name": MINER_NAME,
            "schema": MINER_SCHEMA,
            "version": MINER_VERSION,
            "source_path": MINER_RELATIVE,
            "source_sha256": scanner_sha256,
        },
        "scanner_dependencies": {
            key: dict(value) for key, value in sorted(dependency_inventory.items())
        },
        "source_valid_family_inventory": list(SOURCE_VALID_FAMILIES),
        "family_inventory": inventory,
        "decoded_selectors": dict(decoded),
        "candidates": candidates,
    }
    ledger["manifest_sha256"] = _self_hash(ledger, "manifest_sha256")
    return ledger


def validate_candidate_ledger(
    ledger: Mapping[str, Any],
    *,
    inputs: AuthenticatedInputs,
    decoded: Mapping[str, Any],
    scanner: ScannerModules,
    rows: tuple[Any, ...],
    scanner_sha256: str,
    dependency_inventory: Mapping[str, Mapping[str, str | int]],
) -> None:
    """Recompute the full scan, rejecting omissions, insertions, or reordering."""

    expected = build_candidate_ledger(
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256=scanner_sha256,
        dependency_inventory=dependency_inventory,
    )
    _require(dict(ledger) == expected, "candidate ledger is not the complete scan")


def build_receipts(
    *,
    inputs: AuthenticatedInputs,
    replay: Mapping[str, Any],
    ledger: Mapping[str, Any],
    output_dir: Path,
) -> dict[str, bytes]:
    """Build runner-compatible replay, mine, ledger, and acceptance bytes."""

    producer = strict_json(inputs.producer_raw, "producer manifest")
    variable_map_sha256 = producer["variable_map_sha256"]
    ledger_raw = canonical_json_bytes(dict(ledger))
    ledger_path = output_dir / "candidate-ledger.json"
    replay_receipt = {
        "schema": runner.SAT_REPLAY_SCHEMA,
        "status": "PASS",
        "portfolio_cell_id": inputs.cell["portfolio_cell_id"],
        "job_id": inputs.terminal["job_id"],
        "cnf_sha256": sha256_bytes(inputs.cnf),
        "producer_manifest_sha256": sha256_bytes(inputs.producer_raw),
        "wave_manifest_sha256": sha256_bytes(inputs.wave_raw),
        "variable_map_sha256": variable_map_sha256,
        "num_variables": replay["num_variables"],
        "clauses_checked": replay["clauses_checked"],
        "all_clauses_satisfied": replay["all_clauses_satisfied"],
        "model_sha256": sha256_bytes(inputs.model_raw),
    }
    replay_raw = canonical_json_bytes(replay_receipt)
    replay_path = output_dir / "sat-replay-receipt.json"
    mine_receipt = {
        "schema": runner.WAVE_MINE_SCHEMA,
        "status": "ACCEPTED",
        "portfolio_cell_id": inputs.cell["portfolio_cell_id"],
        "job_id": inputs.terminal["job_id"],
        "model_sha256": sha256_bytes(inputs.model_raw),
        "source_valid_only": True,
        "complete_equality_component_checked": True,
        "candidate_ledger_sha256": sha256_bytes(ledger_raw),
        "candidate_ledger": _file_ref(inputs.root, ledger_path, ledger_raw),
        "candidates_examined": ledger["candidates_examined"],
        "scan_complete": True,
        "complete_no_candidates": ledger["complete_no_candidates"],
        "models_mined": 1,
    }
    mine_raw = canonical_json_bytes(mine_receipt)
    mine_path = output_dir / "mine-receipt.json"
    evidence = {
        "independent_sat_replay": _file_ref(inputs.root, replay_path, replay_raw),
        "wave_only_mine": _file_ref(inputs.root, mine_path, mine_raw),
        "independent_unsat_replay": None,
    }
    acceptance: dict[str, Any] = {
        "schema": runner.ACCEPTANCE_SCHEMA,
        "status": "ACCEPTED",
        "campaign_sha256": inputs.campaign_sha256,
        "run_manifest_sha256": inputs.run_manifest_sha256,
        **{key: inputs.terminal[key] for key in runner._TERMINAL_RESULT_KEYS},
        "evidence": evidence,
    }
    acceptance["manifest_sha256"] = _self_hash(acceptance, "manifest_sha256")
    return {
        "candidate-ledger.json": ledger_raw,
        "sat-replay-receipt.json": replay_raw,
        "mine-receipt.json": mine_raw,
        "canary-acceptance.json": canonical_json_bytes(acceptance),
    }


def mine(
    *, root: Path, run_root: Path, portfolio_cell_id: str, output_dir: Path
) -> dict[str, Any]:
    """Authenticate, replay, exhaust the bank, and write create-once receipts."""

    _require(
        portfolio_cell_id == runner.CANARY_PORTFOLIO_CELL_ID,
        "this receipt layout is canary-only",
    )
    validate_output_dir(run_root, output_dir)
    inputs = authenticate_inputs(
        root=root, run_root=run_root, portfolio_cell_id=portfolio_cell_id
    )
    scanner = load_scanner_modules(root)
    values, decoded, rows = decode_model(
        scanner, inputs.model, expected_center=int(inputs.cell["center"])
    )
    replay = replay_dimacs(inputs.cnf, values)
    scanner_raw = _read_private(root / MINER_RELATIVE, 2 << 20, "miner source")
    scanner_sha256 = sha256_bytes(scanner_raw)
    dependency_inventory = scanner.dependency_inventory
    ledger = build_candidate_ledger(
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256=scanner_sha256,
        dependency_inventory=dependency_inventory,
    )
    validate_candidate_ledger(
        ledger,
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256=scanner_sha256,
        dependency_inventory=dependency_inventory,
    )
    receipts = build_receipts(
        inputs=inputs, replay=replay, ledger=ledger, output_dir=output_dir
    )
    for name in RECEIPT_NAMES:
        _write_once(output_dir / name, receipts[name])
    return {
        "status": "PASS",
        "portfolio_cell_id": portfolio_cell_id,
        "model_sha256": sha256_bytes(inputs.model_raw),
        "cnf_sha256": replay["cnf_sha256"],
        "clauses_checked": replay["clauses_checked"],
        "candidate_count": ledger["candidates_examined"],
        "outputs": {
            name: {"sha256": sha256_bytes(raw), "bytes": len(raw)}
            for name, raw in sorted(receipts.items())
        },
    }


def verify_existing(
    *, root: Path, run_root: Path, portfolio_cell_id: str, output_dir: Path
) -> dict[str, Any]:
    """Purely recompute and byte-verify all persisted canary mine receipts."""

    _require(
        portfolio_cell_id == runner.CANARY_PORTFOLIO_CELL_ID,
        "this receipt layout is canary-only",
    )
    validate_output_dir(run_root, output_dir)
    inputs = authenticate_inputs(
        root=root, run_root=run_root, portfolio_cell_id=portfolio_cell_id
    )
    scanner = load_scanner_modules(root)
    values, decoded, rows = decode_model(
        scanner, inputs.model, expected_center=int(inputs.cell["center"])
    )
    replay = replay_dimacs(inputs.cnf, values)
    scanner_raw = _read_private(root / MINER_RELATIVE, 2 << 20, "miner source")
    scanner_sha256 = sha256_bytes(scanner_raw)
    ledger = build_candidate_ledger(
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256=scanner_sha256,
        dependency_inventory=scanner.dependency_inventory,
    )
    validate_candidate_ledger(
        ledger,
        inputs=inputs,
        decoded=decoded,
        scanner=scanner,
        rows=rows,
        scanner_sha256=scanner_sha256,
        dependency_inventory=scanner.dependency_inventory,
    )
    expected = build_receipts(
        inputs=inputs, replay=replay, ledger=ledger, output_dir=output_dir
    )
    observed_hashes: dict[str, str] = {}
    for name in RECEIPT_NAMES:
        observed = _read_private(output_dir / name, MAX_JSON_BYTES, name)
        _require(observed == expected[name], f"persisted {name} drifted")
        observed_hashes[name] = sha256_bytes(observed)
    return {
        "schema": VERIFICATION_SCHEMA,
        "status": "PASS",
        "portfolio_cell_id": portfolio_cell_id,
        "campaign_sha256": inputs.campaign_sha256,
        "run_manifest_sha256": inputs.run_manifest_sha256,
        "model_sha256": sha256_bytes(inputs.model_raw),
        "cnf_sha256": sha256_bytes(inputs.cnf),
        "candidate_ledger_sha256": observed_hashes["candidate-ledger.json"],
        "scanner_dependencies_sha256": sha256_bytes(
            canonical_json_bytes(ledger["scanner_dependencies"])
        ),
        "family_inventory_sha256": sha256_bytes(
            canonical_json_bytes(ledger["family_inventory"])
        ),
        "decoded_selectors_sha256": sha256_bytes(
            canonical_json_bytes(ledger["decoded_selectors"])
        ),
        "receipt_sha256s": observed_hashes,
    }


def _emit_canonical_result(result: Mapping[str, Any]) -> None:
    """Emit the exact compact bytes accepted by the runner's strict parser."""

    sys.stdout.buffer.write(canonical_json_bytes(dict(result)))
    sys.stdout.buffer.flush()


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run-root", type=Path, required=True)
    parser.add_argument("--cell-id", required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--verify-existing", action="store_true")
    args = parser.parse_args(argv)
    try:
        action = verify_existing if args.verify_existing else mine
        result = action(
            root=ROOT,
            run_root=args.run_root,
            portfolio_cell_id=args.cell_id,
            output_dir=args.output_dir,
        )
    except (MineError, runner.PortfolioRunnerError, OSError, ValueError) as exc:
        print(
            f"canary perp-bisector survivor FourPointTwoCircle SAT mine rejected: {exc}",
            file=sys.stderr,
        )
        return 1
    _emit_canonical_result(result)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
