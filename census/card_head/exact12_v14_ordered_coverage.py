"""Replayable positive-incidence coverage of the 48 exact-12 source orders.

The source ingress supplies one boundary order, but does not choose which of
the 24 direct or 24 mirror orders it is.  A certificate from this module is a
row-pattern nogood only when every one of those 48 orders is covered by a
positive-incidence obstruction already represented by a Lean consumer.

The diagnostic detector is broader than the production proof-backed registry.
Only exact cubes whose replay has a checked `SourceOrderPositiveNogood` Lean
value may be admitted by CEGAR; the current registry contains the frozen V8
cube and the Lean-promoted mixed-v3 and mixed-v4 survivor cuts.  This module
does not prove schedule coverage, a universal lift, or closure of a live sorry.
"""

from __future__ import annotations

import copy
import hashlib
import itertools
import json
from collections.abc import Collection, Mapping, Sequence
from typing import Any

from census.global_confinement import (
    cap_selected_nogood_certificate_probe as certificates,
)
from census.global_confinement import metric_realizability_probe as metric

from .sat_encoding import CoverInstance

N = 12
SCHEMA = "p97_rigid221_exact12_source_order_positive_coverage.v3"
SOURCE_ORDER_THEOREM = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenRoleLabeling.exists_frozenBoundaryOrder_with_forced_secondCap"
)
COMMON_FIVE_THEOREM = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.false_of_convexFivePointCore"
)
KALMANSON_SOURCE_THEOREMS = (
    (
        "Problem97.CapCrossingKalmansonBridge."
        "complementary_dist_add_dist_lt_diagonal_sum_of_ccw"
    ),
    ("Problem97.CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw"),
)
SHARED_LATE_SOURCE_THEOREMS = (
    ("Problem97.CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw"),
)
LEAN_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "SourceOrderTerminalBankConsumer.SourceOrderPositiveNogood"
)
LEAN_TERMINAL_CONSUMER = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "SourceOrderTerminalBankConsumer.false_of_terminalSourceOrderPositiveBank"
)
FROZEN_V8_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "frozenV8PositiveNogood"
)
FROZEN_V8_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.sourceOrderCoverage_frozenV8"
)
FROZEN_V8_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221FrozenV8PositiveCut.lean"
)
FROZEN_V8_LEAN_SOURCE_BYTES = 10405
FROZEN_V8_LEAN_SOURCE_SHA256 = (
    "09a0034bbfc50c188abd4355a458e7b78222fdc923ea84b7f9c21d7a9b94459a"
)
FROZEN_V8_LEAN_COVERAGE_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221SourceOrderCoverage.lean"
)
FROZEN_V8_LEAN_COVERAGE_SOURCE_BYTES = 6545
FROZEN_V8_LEAN_COVERAGE_SOURCE_SHA256 = (
    "3353d47ab72e2fa044b6c168900e2ce55933cd65bb1b47278c19b7d6646a5d26"
)
FROZEN_V8_LEAN_CONSUMER_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221SourceOrderTerminalBankConsumer.lean"
)
FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES = 6885
FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256 = (
    "74d8689d33b912e85f71714d33eed843b58c4fdbd59251b934c3adb8832f0250"
)
MIXED_V3_CELL8_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV3Cell8PositiveNogood"
)
MIXED_V3_CELL8_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientation_core_0_9_2_3_1"
)
MIXED_V3_CELL8_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV3Cell8PositiveCut.lean"
)
MIXED_V3_CELL8_LEAN_SOURCE_BYTES = 3712
MIXED_V3_CELL8_LEAN_SOURCE_SHA256 = (
    "c6311578addcd9bee044ab9d5c607c74d684b66fcc64544545cfed7eb64c1e58"
)
MIXED_V3_CELL2_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV3Cell2PositiveNogood"
)
MIXED_V3_CELL2_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_core_2_6_4"
)
MIXED_V3_CELL2_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV3Cell2PositiveCut.lean"
)
MIXED_V3_CELL2_LEAN_SOURCE_BYTES = 4740
MIXED_V3_CELL2_LEAN_SOURCE_SHA256 = (
    "dcab6c32ec4e9cafd28e9d16d5d8f22303a3ccefca8b0a27d6dbde5ed1d68c1d"
)
MIXED_V3_CELL4_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV3Cell4PositiveNogood"
)
MIXED_V3_CELL4_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_core_0_4_8"
)
MIXED_V3_CELL4_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV3Cell4PositiveCut.lean"
)
MIXED_V3_CELL4_LEAN_SOURCE_BYTES = 7096
MIXED_V3_CELL4_LEAN_SOURCE_SHA256 = (
    "208efb47e9b80aed0d870ce6a12f9074035df26e67cecf7f564943206fa376ef"
)
MIXED_V3_CELL5_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV3Cell5PositiveNogood"
)
MIXED_V3_CELL5_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV3Cell5"
)
MIXED_V3_CELL5_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV3Cell5PositiveCut.lean"
)
MIXED_V3_CELL5_LEAN_SOURCE_BYTES = 5881
MIXED_V3_CELL5_LEAN_SOURCE_SHA256 = (
    "133b12bb6aba89e62b6eecd7d1937b753e03bb0b4005dc334155883c329095d8"
)
MIXED_V3_CELL7_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV3Cell7PositiveNogood"
)
MIXED_V3_CELL7_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV3Cell7"
)
MIXED_V3_CELL7_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV3Cell7PositiveCut.lean"
)
MIXED_V3_CELL7_LEAN_SOURCE_BYTES = 8376
MIXED_V3_CELL7_LEAN_SOURCE_SHA256 = (
    "087361deae14a17ac3b4fd63cd7ebb715a257539162ac021460ff3089aa01718"
)
MIXED_V4_CELL4_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV4Cell4PositiveNogood"
)
MIXED_V4_CELL4_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV4Cell4"
)
MIXED_V4_CELL4_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV4Cell4PositiveCut.lean"
)
MIXED_V4_CELL4_LEAN_SOURCE_BYTES = 8701
MIXED_V4_CELL4_LEAN_SOURCE_SHA256 = (
    "2c309210ee23484779ce5323162fcf7b551f3bd7b035c3ff87b2b6b83f9c750f"
)
MIXED_V4_CELL1_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV4Cell1PositiveNogood"
)
MIXED_V4_CELL1_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientation_core_11_0_3_6_2"
)
MIXED_V4_CELL1_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV4Cell1PositiveCut.lean"
)
MIXED_V4_CELL1_LEAN_SOURCE_BYTES = 3691
MIXED_V4_CELL1_LEAN_SOURCE_SHA256 = (
    "aef0fdd93f31fa17ffc4f37ecc2e199285c5c6d749b634c5d2662cb0f52f4bf8"
)
MIXED_V4_CELL1_SECOND_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV4Cell1SecondPositiveNogood"
)
MIXED_V4_CELL1_SECOND_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV4Cell1Second"
)
MIXED_V4_CELL1_SECOND_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV4Cell1SecondPositiveCut.lean"
)
MIXED_V4_CELL1_SECOND_LEAN_SOURCE_BYTES = 5484
MIXED_V4_CELL1_SECOND_LEAN_SOURCE_SHA256 = (
    "c68a2bae38e40a7eb1204a99bd2c42c47b04846c2029bddcea7d43ece3de2794"
)
MIXED_V4_CELL1_THIRD_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV4Cell1ThirdPositiveNogood"
)
MIXED_V4_CELL1_THIRD_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV4Cell1Third"
)
MIXED_V4_CELL1_THIRD_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV4Cell1ThirdPositiveCut.lean"
)
MIXED_V4_CELL1_THIRD_LEAN_SOURCE_BYTES = 5447
MIXED_V4_CELL1_THIRD_LEAN_SOURCE_SHA256 = (
    "6a26a86df175bb1242608f556690978c6f919e58a6ff849126bd1bed5e5eafb6"
)
MIXED_V4_CELL1_FOURTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV4Cell1FourthPositiveNogood"
)
MIXED_V4_CELL1_FOURTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientation_core_10_0_4_6_2"
)
MIXED_V4_CELL1_FOURTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV4Cell1FourthPositiveCut.lean"
)
MIXED_V4_CELL1_FOURTH_LEAN_SOURCE_BYTES = 3661
MIXED_V4_CELL1_FOURTH_LEAN_SOURCE_SHA256 = (
    "5a8293ac237bb8109207bfd3329be4e403edecb39a3126c55544e5c9ac60492f"
)
MIXED_V4_CELL10_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV4Cell10PositiveNogood"
)
MIXED_V4_CELL10_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV4Cell10"
)
MIXED_V4_CELL10_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV4Cell10PositiveCut.lean"
)
MIXED_V4_CELL10_LEAN_SOURCE_BYTES = 6428
MIXED_V4_CELL10_LEAN_SOURCE_SHA256 = (
    "2b886575c31d1d690ce451b2ef5da8df2b32bf041b46f08894c48c15ab82575c"
)
MIXED_V4_CELL10_SECOND_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV4Cell10SecondPositiveNogood"
)
MIXED_V4_CELL10_SECOND_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV4Cell10Second"
)
MIXED_V4_CELL10_SECOND_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV4Cell10SecondPositiveCut.lean"
)
MIXED_V4_CELL10_SECOND_LEAN_SOURCE_BYTES = 6265
MIXED_V4_CELL10_SECOND_LEAN_SOURCE_SHA256 = (
    "432bcd66bfdcc135210dd98fbf3ba19a5734b36080556e73a0ff64f3adafdfd0"
)
MIXED_V4_CELL2_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV4Cell2PositiveNogood"
)
MIXED_V4_CELL2_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientation_core_5_6_1_7_10"
)
MIXED_V4_CELL2_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV4Cell2PositiveCut.lean"
)
MIXED_V4_CELL2_LEAN_SOURCE_BYTES = 3938
MIXED_V4_CELL2_LEAN_SOURCE_SHA256 = (
    "1328013ad3e0993932cb974af2811c1e31153334babf6158ef317597a1d59ebb"
)
MIXED_V4_CELL2_SECOND_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV4Cell2SecondPositiveNogood"
)
MIXED_V4_CELL2_SECOND_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientation_core_2_4_8_5_1"
)
MIXED_V4_CELL2_SECOND_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV4Cell2SecondPositiveCut.lean"
)
MIXED_V4_CELL2_SECOND_LEAN_SOURCE_BYTES = 3551
MIXED_V4_CELL2_SECOND_LEAN_SOURCE_SHA256 = (
    "f2eaace5f6c41f621b6e8ff67293b1bcf69573792e4a109b4a64853eee498605"
)
MIXED_V4_CELL5_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV4Cell5PositiveNogood"
)
MIXED_V4_CELL5_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientation_core_3_0_1_5_10"
)
MIXED_V4_CELL5_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV4Cell5PositiveCut.lean"
)
MIXED_V4_CELL5_LEAN_SOURCE_BYTES = 3776
MIXED_V4_CELL5_LEAN_SOURCE_SHA256 = (
    "861bc3eeebb9ba658d9bda87d6870faceab12fb3479b277c091cb11e6aaeeeb2"
)
MIXED_V4_CELL8_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV4Cell8PositiveNogood"
)
MIXED_V4_CELL8_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientation_core_7_0_10_3_2"
)
MIXED_V4_CELL8_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV4Cell8PositiveCut.lean"
)
MIXED_V4_CELL8_LEAN_SOURCE_BYTES = 3795
MIXED_V4_CELL8_LEAN_SOURCE_SHA256 = (
    "b4da18ae85161e12fa695001f4f8d9f681762be6169cf7b5c71bd23bd96c0d9c"
)
MIXED_V4_CELL11_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV4Cell11PositiveNogood"
)
MIXED_V4_CELL11_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientation_core_1_7_6_11_9"
)
MIXED_V4_CELL11_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV4Cell11PositiveCut.lean"
)
MIXED_V4_CELL11_LEAN_SOURCE_BYTES = 4452
MIXED_V4_CELL11_LEAN_SOURCE_SHA256 = (
    "103aa7a5c8ff75ac31b033114d37be88e61758884bfaab35937256fa53dda187"
)
REQUIRED_SOURCE_HYPOTHESES = (
    "Realizes",
    "FrozenBoundaryOrder",
    "FrozenForcedSecondCapOrder",
    "ConvexIndep",
)

MembershipKey = tuple[tuple[int, tuple[int, ...]], ...]


class Exact12V14OrderedCoverageError(ValueError):
    """The cube or ordered-coverage certificate is malformed."""


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def source_boundary_orders() -> tuple[tuple[str, tuple[int, ...]], ...]:
    """Enumerate exactly the source-entitled 24 direct and 24 mirror orders."""

    direct = {
        (0, *second, 2, *surplus, 1, *first)
        for first in itertools.permutations((10, 11))
        for surplus in itertools.permutations((3, 4, 5))
        for second in ((6, 7, 8, 9), (9, 8, 7, 6))
    }
    mirror = {
        (0, *first, 1, *surplus, 2, *second)
        for first in itertools.permutations((10, 11))
        for surplus in itertools.permutations((3, 4, 5))
        for second in ((6, 7, 8, 9), (9, 8, 7, 6))
    }
    if len(direct) != 24 or len(mirror) != 24 or direct & mirror:
        raise AssertionError("source boundary-order universe is not 24 + 24")
    return tuple(
        [("direct", order) for order in sorted(direct)]
        + [("mirror", order) for order in sorted(mirror)]
    )


SOURCE_ORDERS = source_boundary_orders()
ORDER_UNIVERSE = [
    {"source_orientation": orientation, "order": list(order)}
    for orientation, order in SOURCE_ORDERS
]
ORDER_UNIVERSE_SHA256 = _sha256_json(ORDER_UNIVERSE)

FROZEN_V8_CUBE = {
    "0": [3, 5, 8, 10],
    "1": [0, 2, 6, 8],
    "2": [4, 8, 10, 11],
    "3": [1, 2, 9, 10],
    "4": [0, 1, 3, 9],
    "5": [0, 2, 7, 11],
    "6": [2, 3, 5, 11],
    "7": [1, 3, 6, 8],
    "8": [3, 4, 6, 9],
    "9": [2, 5, 7, 8],
    "10": [1, 5, 6, 7],
    "11": [1, 4, 5, 10],
}
FROZEN_V8_CUBE_SHA256 = _sha256_json(FROZEN_V8_CUBE)
FROZEN_V8_LEAN_CHOICES = [
    {"center": center, "support": list(FROZEN_V8_CUBE[str(center)])}
    for center in (0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11)
]
FROZEN_V8_LEAN_BINDING = {
    "cube_sha256": FROZEN_V8_CUBE_SHA256,
    "nogood_declaration": FROZEN_V8_LEAN_NOGOOD,
    "coverage_declaration": FROZEN_V8_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": FROZEN_V8_LEAN_CHOICES,
    "source_path": FROZEN_V8_LEAN_SOURCE,
    "source_bytes": FROZEN_V8_LEAN_SOURCE_BYTES,
    "source_sha256": FROZEN_V8_LEAN_SOURCE_SHA256,
    "coverage_source_path": FROZEN_V8_LEAN_COVERAGE_SOURCE,
    "coverage_source_bytes": FROZEN_V8_LEAN_COVERAGE_SOURCE_BYTES,
    "coverage_source_sha256": FROZEN_V8_LEAN_COVERAGE_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V3_CELL8_CUBE = {
    "0": [3, 4, 6, 10],
    "1": [0, 2, 6, 8],
    "2": [5, 6, 10, 11],
    "3": [1, 2, 9, 11],
    "4": [1, 2, 3, 5],
    "5": [0, 4, 7, 9],
    "6": [0, 4, 5, 11],
    "7": [1, 3, 6, 8],
    "8": [4, 5, 6, 9],
    "9": [0, 2, 7, 10],
    "10": [2, 3, 4, 8],
    "11": [3, 5, 7, 10],
}
MIXED_V3_CELL8_CUBE_SHA256 = _sha256_json(MIXED_V3_CELL8_CUBE)
MIXED_V3_CELL8_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V3_CELL8_CUBE[str(center)])}
    for center in (1, 3, 9)
]
MIXED_V3_CELL8_LEAN_BINDING = {
    "cube_sha256": MIXED_V3_CELL8_CUBE_SHA256,
    "nogood_declaration": MIXED_V3_CELL8_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V3_CELL8_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V3_CELL8_LEAN_CHOICES,
    "source_path": MIXED_V3_CELL8_LEAN_SOURCE,
    "source_bytes": MIXED_V3_CELL8_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V3_CELL8_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V3_CELL8_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V3_CELL8_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V3_CELL8_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V3_CELL2_CUBE = {
    "0": [3, 5, 7, 11],
    "1": [0, 2, 6, 8],
    "2": [4, 8, 10, 11],
    "3": [2, 6, 7, 11],
    "4": [0, 1, 3, 6],
    "5": [2, 3, 8, 11],
    "6": [0, 3, 9, 10],
    "7": [5, 6, 8, 10],
    "8": [5, 6, 9, 11],
    "9": [0, 2, 4, 7],
    "10": [0, 7, 8, 9],
    "11": [4, 6, 7, 10],
}
MIXED_V3_CELL2_CUBE_SHA256 = _sha256_json(MIXED_V3_CELL2_CUBE)
MIXED_V3_CELL2_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V3_CELL2_CUBE[str(center)])}
    for center in (1, 3, 4)
]
MIXED_V3_CELL2_LEAN_BINDING = {
    "cube_sha256": MIXED_V3_CELL2_CUBE_SHA256,
    "nogood_declaration": MIXED_V3_CELL2_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V3_CELL2_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V3_CELL2_LEAN_CHOICES,
    "source_path": MIXED_V3_CELL2_LEAN_SOURCE,
    "source_bytes": MIXED_V3_CELL2_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V3_CELL2_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V3_CELL2_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V3_CELL2_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V3_CELL2_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V3_CELL4_CUBE = {
    "0": [2, 3, 4, 11],
    "1": [0, 2, 6, 8],
    "2": [4, 7, 10, 11],
    "3": [2, 4, 8, 10],
    "4": [1, 5, 10, 11],
    "5": [0, 4, 6, 7],
    "6": [0, 2, 3, 5],
    "7": [1, 6, 8, 11],
    "8": [4, 5, 6, 9],
    "9": [0, 4, 5, 8],
    "10": [1, 3, 6, 9],
    "11": [0, 3, 7, 9],
}
MIXED_V3_CELL4_CUBE_SHA256 = _sha256_json(MIXED_V3_CELL4_CUBE)
MIXED_V3_CELL4_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V3_CELL4_CUBE[str(center)])}
    for center in (5, 6, 8, 9)
]
MIXED_V3_CELL4_LEAN_BINDING = {
    "cube_sha256": MIXED_V3_CELL4_CUBE_SHA256,
    "nogood_declaration": MIXED_V3_CELL4_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V3_CELL4_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V3_CELL4_LEAN_CHOICES,
    "source_path": MIXED_V3_CELL4_LEAN_SOURCE,
    "source_bytes": MIXED_V3_CELL4_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V3_CELL4_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V3_CELL4_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V3_CELL4_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V3_CELL4_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V3_CELL5_CUBE = {
    "0": [3, 4, 8, 11],
    "1": [0, 2, 6, 8],
    "2": [5, 7, 10, 11],
    "3": [0, 4, 5, 9],
    "4": [5, 8, 9, 11],
    "5": [0, 6, 7, 9],
    "6": [2, 4, 7, 10],
    "7": [1, 4, 6, 8],
    "8": [1, 6, 9, 11],
    "9": [0, 2, 10, 11],
    "10": [0, 5, 7, 8],
    "11": [2, 3, 7, 8],
}
MIXED_V3_CELL5_CUBE_SHA256 = _sha256_json(MIXED_V3_CELL5_CUBE)
MIXED_V3_CELL5_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V3_CELL5_CUBE[str(center)])}
    for center in (0, 2, 6, 7, 10)
]
MIXED_V3_CELL5_LEAN_BINDING = {
    "cube_sha256": MIXED_V3_CELL5_CUBE_SHA256,
    "nogood_declaration": MIXED_V3_CELL5_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V3_CELL5_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V3_CELL5_LEAN_CHOICES,
    "source_path": MIXED_V3_CELL5_LEAN_SOURCE,
    "source_bytes": MIXED_V3_CELL5_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V3_CELL5_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V3_CELL5_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V3_CELL5_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V3_CELL5_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V3_CELL7_CUBE = {
    "0": [3, 4, 5, 11],
    "1": [0, 2, 6, 8],
    "2": [3, 9, 10, 11],
    "3": [1, 2, 8, 11],
    "4": [0, 2, 7, 11],
    "5": [1, 2, 4, 7],
    "6": [0, 5, 9, 11],
    "7": [1, 3, 6, 8],
    "8": [4, 5, 6, 9],
    "9": [3, 4, 6, 7],
    "10": [0, 5, 7, 8],
    "11": [1, 4, 9, 10],
}
MIXED_V3_CELL7_CUBE_SHA256 = _sha256_json(MIXED_V3_CELL7_CUBE)
MIXED_V3_CELL7_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V3_CELL7_CUBE[str(center)])}
    for center in (0, 1, 4, 5, 11)
]
MIXED_V3_CELL7_LEAN_BINDING = {
    "cube_sha256": MIXED_V3_CELL7_CUBE_SHA256,
    "nogood_declaration": MIXED_V3_CELL7_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V3_CELL7_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V3_CELL7_LEAN_CHOICES,
    "source_path": MIXED_V3_CELL7_LEAN_SOURCE,
    "source_bytes": MIXED_V3_CELL7_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V3_CELL7_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V3_CELL7_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V3_CELL7_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V3_CELL7_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V4_CELL4_CUBE = {
    "0": [3, 4, 5, 9],
    "1": [0, 2, 6, 8],
    "2": [5, 7, 10, 11],
    "3": [2, 4, 8, 10],
    "4": [2, 3, 6, 11],
    "5": [0, 4, 6, 7],
    "6": [0, 2, 3, 10],
    "7": [1, 3, 6, 8],
    "8": [1, 4, 6, 9],
    "9": [4, 5, 8, 11],
    "10": [0, 5, 8, 9],
    "11": [0, 7, 9, 10],
}
MIXED_V4_CELL4_CUBE_SHA256 = _sha256_json(MIXED_V4_CELL4_CUBE)
MIXED_V4_CELL4_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V4_CELL4_CUBE[str(center)])}
    for center in (1, 3, 4, 7, 8)
]
MIXED_V4_CELL4_LEAN_BINDING = {
    "cube_sha256": MIXED_V4_CELL4_CUBE_SHA256,
    "nogood_declaration": MIXED_V4_CELL4_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V4_CELL4_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V4_CELL4_LEAN_CHOICES,
    "source_path": MIXED_V4_CELL4_LEAN_SOURCE,
    "source_bytes": MIXED_V4_CELL4_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V4_CELL4_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V4_CELL4_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V4_CELL4_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V4_CELL4_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V4_CELL1_CUBE = {
    "0": [3, 5, 8, 11],
    "1": [0, 2, 6, 8],
    "2": [3, 7, 10, 11],
    "3": [2, 4, 9, 10],
    "4": [0, 5, 7, 9],
    "5": [2, 4, 6, 7],
    "6": [0, 2, 3, 7],
    "7": [6, 8, 10, 11],
    "8": [4, 5, 6, 9],
    "9": [0, 5, 6, 10],
    "10": [1, 2, 3, 8],
    "11": [0, 3, 9, 10],
}
MIXED_V4_CELL1_CUBE_SHA256 = _sha256_json(MIXED_V4_CELL1_CUBE)
MIXED_V4_CELL1_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V4_CELL1_CUBE[str(center)])}
    for center in (0, 2, 6)
]
MIXED_V4_CELL1_LEAN_BINDING = {
    "cube_sha256": MIXED_V4_CELL1_CUBE_SHA256,
    "nogood_declaration": MIXED_V4_CELL1_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V4_CELL1_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V4_CELL1_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 11, "x": 0, "b": 3, "c": 6, "y": 2},
    "source_path": MIXED_V4_CELL1_LEAN_SOURCE,
    "source_bytes": MIXED_V4_CELL1_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V4_CELL1_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V4_CELL1_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V4_CELL1_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V4_CELL1_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V4_CELL1_SECOND_CUBE = {
    "0": [3, 5, 7, 11],
    "1": [0, 2, 6, 8],
    "2": [1, 7, 10, 11],
    "3": [0, 1, 7, 9],
    "4": [2, 3, 5, 9],
    "5": [2, 3, 8, 10],
    "6": [0, 2, 4, 5],
    "7": [1, 4, 6, 8],
    "8": [1, 3, 6, 9],
    "9": [2, 4, 10, 11],
    "10": [0, 3, 4, 6],
    "11": [1, 3, 4, 10],
}
MIXED_V4_CELL1_SECOND_CUBE_SHA256 = _sha256_json(MIXED_V4_CELL1_SECOND_CUBE)
MIXED_V4_CELL1_SECOND_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V4_CELL1_SECOND_CUBE[str(center)]),
    }
    for center in (2, 9, 11)
]
MIXED_V4_CELL1_SECOND_LEAN_BINDING = {
    "cube_sha256": MIXED_V4_CELL1_SECOND_CUBE_SHA256,
    "nogood_declaration": MIXED_V4_CELL1_SECOND_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V4_CELL1_SECOND_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V4_CELL1_SECOND_LEAN_CHOICES,
    "source_path": MIXED_V4_CELL1_SECOND_LEAN_SOURCE,
    "source_bytes": MIXED_V4_CELL1_SECOND_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V4_CELL1_SECOND_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V4_CELL1_SECOND_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V4_CELL1_SECOND_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V4_CELL1_SECOND_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V4_CELL1_THIRD_CUBE = {
    "0": [3, 4, 7, 11],
    "1": [0, 2, 6, 8],
    "2": [1, 7, 10, 11],
    "3": [0, 1, 4, 8],
    "4": [0, 2, 3, 10],
    "5": [0, 1, 3, 9],
    "6": [2, 7, 9, 10],
    "7": [4, 5, 6, 8],
    "8": [4, 6, 9, 11],
    "9": [2, 3, 5, 8],
    "10": [1, 3, 6, 7],
    "11": [0, 5, 7, 9],
}
MIXED_V4_CELL1_THIRD_CUBE_SHA256 = _sha256_json(MIXED_V4_CELL1_THIRD_CUBE)
MIXED_V4_CELL1_THIRD_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V4_CELL1_THIRD_CUBE[str(center)]),
    }
    for center in (2, 6, 10)
]
MIXED_V4_CELL1_THIRD_LEAN_BINDING = {
    "cube_sha256": MIXED_V4_CELL1_THIRD_CUBE_SHA256,
    "nogood_declaration": MIXED_V4_CELL1_THIRD_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V4_CELL1_THIRD_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V4_CELL1_THIRD_LEAN_CHOICES,
    "source_path": MIXED_V4_CELL1_THIRD_LEAN_SOURCE,
    "source_bytes": MIXED_V4_CELL1_THIRD_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V4_CELL1_THIRD_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V4_CELL1_THIRD_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V4_CELL1_THIRD_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V4_CELL1_THIRD_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V4_CELL1_FOURTH_CUBE = {
    "0": [2, 4, 5, 10],
    "1": [0, 2, 6, 8],
    "2": [4, 7, 10, 11],
    "3": [0, 8, 10, 11],
    "4": [3, 5, 9, 10],
    "5": [0, 1, 6, 11],
    "6": [0, 2, 4, 7],
    "7": [1, 3, 6, 8],
    "8": [4, 5, 6, 9],
    "9": [2, 3, 6, 11],
    "10": [1, 2, 5, 8],
    "11": [0, 7, 9, 10],
}
MIXED_V4_CELL1_FOURTH_CUBE_SHA256 = _sha256_json(MIXED_V4_CELL1_FOURTH_CUBE)
MIXED_V4_CELL1_FOURTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V4_CELL1_FOURTH_CUBE[str(center)]),
    }
    for center in (0, 2, 6)
]
MIXED_V4_CELL1_FOURTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V4_CELL1_FOURTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V4_CELL1_FOURTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V4_CELL1_FOURTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V4_CELL1_FOURTH_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 10, "x": 0, "b": 4, "c": 6, "y": 2},
    "source_path": MIXED_V4_CELL1_FOURTH_LEAN_SOURCE,
    "source_bytes": MIXED_V4_CELL1_FOURTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V4_CELL1_FOURTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V4_CELL1_FOURTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V4_CELL1_FOURTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V4_CELL1_FOURTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V4_CELL10_CUBE = {
    "0": [1, 3, 4, 6],
    "1": [0, 2, 6, 8],
    "2": [3, 7, 10, 11],
    "3": [0, 5, 9, 10],
    "4": [2, 3, 7, 8],
    "5": [0, 4, 6, 9],
    "6": [4, 7, 9, 11],
    "7": [1, 6, 8, 10],
    "8": [3, 5, 6, 9],
    "9": [0, 2, 7, 10],
    "10": [2, 5, 6, 11],
    "11": [1, 4, 7, 8],
}
MIXED_V4_CELL10_CUBE_SHA256 = _sha256_json(MIXED_V4_CELL10_CUBE)
MIXED_V4_CELL10_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V4_CELL10_CUBE[str(center)]),
    }
    for center in (3, 4, 5, 6, 8, 9)
]
MIXED_V4_CELL10_LEAN_BINDING = {
    "cube_sha256": MIXED_V4_CELL10_CUBE_SHA256,
    "nogood_declaration": MIXED_V4_CELL10_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V4_CELL10_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V4_CELL10_LEAN_CHOICES,
    "source_path": MIXED_V4_CELL10_LEAN_SOURCE,
    "source_bytes": MIXED_V4_CELL10_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V4_CELL10_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V4_CELL10_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V4_CELL10_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V4_CELL10_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V4_CELL10_SECOND_CUBE = {
    "0": [3, 4, 5, 8],
    "1": [0, 2, 6, 8],
    "2": [3, 7, 10, 11],
    "3": [0, 2, 7, 11],
    "4": [1, 2, 5, 7],
    "5": [0, 1, 6, 9],
    "6": [0, 3, 4, 9],
    "7": [1, 6, 8, 10],
    "8": [3, 5, 6, 9],
    "9": [2, 4, 8, 10],
    "10": [4, 5, 6, 7],
    "11": [0, 1, 4, 10],
}
MIXED_V4_CELL10_SECOND_CUBE_SHA256 = _sha256_json(MIXED_V4_CELL10_SECOND_CUBE)
MIXED_V4_CELL10_SECOND_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V4_CELL10_SECOND_CUBE[str(center)]),
    }
    for center in (0, 5, 6, 8, 9)
]
MIXED_V4_CELL10_SECOND_LEAN_BINDING = {
    "cube_sha256": MIXED_V4_CELL10_SECOND_CUBE_SHA256,
    "nogood_declaration": MIXED_V4_CELL10_SECOND_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V4_CELL10_SECOND_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V4_CELL10_SECOND_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 0, "x": 5, "b": 9, "c": 8, "y": 6},
        {"a": 8, "x": 0, "b": 4, "c": 6, "y": 9},
    ],
    "source_path": MIXED_V4_CELL10_SECOND_LEAN_SOURCE,
    "source_bytes": MIXED_V4_CELL10_SECOND_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V4_CELL10_SECOND_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V4_CELL10_SECOND_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V4_CELL10_SECOND_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V4_CELL10_SECOND_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V4_CELL2_CUBE = {
    "0": [3, 4, 7, 11],
    "1": [0, 2, 6, 8],
    "2": [5, 6, 10, 11],
    "3": [2, 5, 7, 8],
    "4": [3, 5, 8, 9],
    "5": [3, 9, 10, 11],
    "6": [0, 1, 5, 9],
    "7": [1, 6, 8, 10],
    "8": [4, 6, 9, 11],
    "9": [0, 2, 3, 10],
    "10": [1, 3, 4, 5],
    "11": [0, 4, 6, 7],
}
MIXED_V4_CELL2_CUBE_SHA256 = _sha256_json(MIXED_V4_CELL2_CUBE)
MIXED_V4_CELL2_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V4_CELL2_CUBE[str(center)])}
    for center in (6, 7, 10)
]
MIXED_V4_CELL2_LEAN_BINDING = {
    "cube_sha256": MIXED_V4_CELL2_CUBE_SHA256,
    "nogood_declaration": MIXED_V4_CELL2_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V4_CELL2_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V4_CELL2_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 5, "x": 6, "b": 1, "c": 7, "y": 10},
    "source_path": MIXED_V4_CELL2_LEAN_SOURCE,
    "source_bytes": MIXED_V4_CELL2_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V4_CELL2_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V4_CELL2_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V4_CELL2_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V4_CELL2_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V4_CELL2_SECOND_CUBE = {
    "0": [3, 4, 9, 11],
    "1": [0, 2, 6, 8],
    "2": [5, 9, 10, 11],
    "3": [0, 6, 7, 10],
    "4": [2, 3, 7, 8],
    "5": [1, 4, 8, 11],
    "6": [0, 2, 5, 10],
    "7": [4, 5, 6, 8],
    "8": [1, 3, 6, 9],
    "9": [1, 5, 6, 7],
    "10": [0, 1, 5, 9],
    "11": [7, 8, 9, 10],
}
MIXED_V4_CELL2_SECOND_CUBE_SHA256 = _sha256_json(MIXED_V4_CELL2_SECOND_CUBE)
MIXED_V4_CELL2_SECOND_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V4_CELL2_SECOND_CUBE[str(center)]),
    }
    for center in (1, 4, 5)
]
MIXED_V4_CELL2_SECOND_LEAN_BINDING = {
    "cube_sha256": MIXED_V4_CELL2_SECOND_CUBE_SHA256,
    "nogood_declaration": MIXED_V4_CELL2_SECOND_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V4_CELL2_SECOND_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V4_CELL2_SECOND_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 2, "x": 4, "b": 8, "c": 5, "y": 1},
    "source_path": MIXED_V4_CELL2_SECOND_LEAN_SOURCE,
    "source_bytes": MIXED_V4_CELL2_SECOND_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V4_CELL2_SECOND_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V4_CELL2_SECOND_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V4_CELL2_SECOND_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V4_CELL2_SECOND_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V4_CELL5_CUBE = {
    "0": [1, 3, 5, 7],
    "1": [0, 2, 6, 8],
    "2": [5, 9, 10, 11],
    "3": [2, 7, 9, 11],
    "4": [0, 3, 7, 9],
    "5": [0, 1, 10, 11],
    "6": [0, 2, 7, 10],
    "7": [1, 6, 8, 11],
    "8": [4, 5, 6, 9],
    "9": [3, 4, 5, 8],
    "10": [1, 3, 6, 9],
    "11": [1, 2, 8, 10],
}
MIXED_V4_CELL5_CUBE_SHA256 = _sha256_json(MIXED_V4_CELL5_CUBE)
MIXED_V4_CELL5_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V4_CELL5_CUBE[str(center)])}
    for center in (0, 5, 10)
]
MIXED_V4_CELL5_LEAN_BINDING = {
    "cube_sha256": MIXED_V4_CELL5_CUBE_SHA256,
    "nogood_declaration": MIXED_V4_CELL5_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V4_CELL5_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V4_CELL5_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 3, "x": 0, "b": 1, "c": 5, "y": 10},
    "source_path": MIXED_V4_CELL5_LEAN_SOURCE,
    "source_bytes": MIXED_V4_CELL5_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V4_CELL5_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V4_CELL5_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V4_CELL5_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V4_CELL5_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V4_CELL8_CUBE = {
    "0": [3, 5, 7, 10],
    "1": [0, 2, 6, 8],
    "2": [1, 7, 10, 11],
    "3": [0, 2, 10, 11],
    "4": [1, 2, 3, 10],
    "5": [2, 4, 6, 7],
    "6": [0, 3, 4, 9],
    "7": [1, 4, 6, 8],
    "8": [1, 3, 6, 9],
    "9": [2, 3, 4, 8],
    "10": [0, 3, 5, 6],
    "11": [0, 1, 4, 7],
}
MIXED_V4_CELL8_CUBE_SHA256 = _sha256_json(MIXED_V4_CELL8_CUBE)
MIXED_V4_CELL8_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V4_CELL8_CUBE[str(center)])}
    for center in (0, 2, 3)
]
MIXED_V4_CELL8_LEAN_BINDING = {
    "cube_sha256": MIXED_V4_CELL8_CUBE_SHA256,
    "nogood_declaration": MIXED_V4_CELL8_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V4_CELL8_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V4_CELL8_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 7, "x": 0, "b": 10, "c": 3, "y": 2},
    "source_path": MIXED_V4_CELL8_LEAN_SOURCE,
    "source_bytes": MIXED_V4_CELL8_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V4_CELL8_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V4_CELL8_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V4_CELL8_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V4_CELL8_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V4_CELL11_CUBE = {
    "0": [2, 3, 4, 11],
    "1": [0, 2, 6, 8],
    "2": [1, 8, 10, 11],
    "3": [0, 2, 7, 11],
    "4": [1, 2, 9, 10],
    "5": [2, 3, 7, 8],
    "6": [0, 4, 5, 7],
    "7": [1, 4, 6, 8],
    "8": [3, 6, 9, 10],
    "9": [0, 1, 5, 6],
    "10": [0, 4, 9, 11],
    "11": [4, 6, 7, 9],
}
MIXED_V4_CELL11_CUBE_SHA256 = _sha256_json(MIXED_V4_CELL11_CUBE)
MIXED_V4_CELL11_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V4_CELL11_CUBE[str(center)])}
    for center in (7, 9, 11)
]
MIXED_V4_CELL11_LEAN_BINDING = {
    "cube_sha256": MIXED_V4_CELL11_CUBE_SHA256,
    "nogood_declaration": MIXED_V4_CELL11_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V4_CELL11_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V4_CELL11_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 1, "x": 7, "b": 6, "c": 11, "y": 9},
    "source_path": MIXED_V4_CELL11_LEAN_SOURCE,
    "source_bytes": MIXED_V4_CELL11_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V4_CELL11_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V4_CELL11_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V4_CELL11_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V4_CELL11_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V5_CELL4_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV5Cell4PositiveNogood"
)
MIXED_V5_CELL4_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV5Cell4"
)
MIXED_V5_CELL4_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV5Cell4PositiveCut.lean"
)
MIXED_V5_CELL4_LEAN_SOURCE_BYTES = 5947
MIXED_V5_CELL4_LEAN_SOURCE_SHA256 = (
    "9c5b4d000a76c0c59983ea81ac08d90e3ec9a0abac8a59da08dd7a089572f6cd"
)
MIXED_V5_CELL4_CUBE = {
    "0": [3, 4, 5, 11],
    "1": [0, 2, 6, 8],
    "2": [3, 8, 10, 11],
    "3": [0, 8, 9, 10],
    "4": [0, 3, 7, 9],
    "5": [1, 3, 7, 10],
    "6": [2, 3, 5, 8],
    "7": [5, 6, 8, 11],
    "8": [4, 6, 9, 11],
    "9": [0, 2, 10, 11],
    "10": [1, 5, 6, 9],
    "11": [2, 4, 6, 10],
}
MIXED_V5_CELL4_CUBE_SHA256 = _sha256_json(MIXED_V5_CELL4_CUBE)
MIXED_V5_CELL4_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V5_CELL4_CUBE[str(center)])}
    for center in (0, 1, 2, 6, 9)
]
MIXED_V5_CELL4_LEAN_BINDING = {
    "cube_sha256": MIXED_V5_CELL4_CUBE_SHA256,
    "nogood_declaration": MIXED_V5_CELL4_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V5_CELL4_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V5_CELL4_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 3, "x": 2, "b": 8, "c": 1, "y": 6},
        {"a": 3, "x": 2, "b": 11, "c": 9, "y": 0},
    ],
    "source_path": MIXED_V5_CELL4_LEAN_SOURCE,
    "source_bytes": MIXED_V5_CELL4_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V5_CELL4_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V5_CELL4_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V5_CELL4_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V5_CELL4_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V5_CELL9_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV5Cell9PositiveNogood"
)
MIXED_V5_CELL9_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV5Cell9"
)
MIXED_V5_CELL9_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV5Cell9PositiveCut.lean"
)
MIXED_V5_CELL9_LEAN_SOURCE_BYTES = 9135
MIXED_V5_CELL9_LEAN_SOURCE_SHA256 = (
    "331e428f847b015863d759b7868676e4452bc0e8fa8fbbb53377cc44fdd32ec6"
)
MIXED_V5_CELL9_CUBE = {
    "0": [1, 3, 4, 7],
    "1": [0, 2, 6, 8],
    "2": [4, 6, 10, 11],
    "3": [1, 9, 10, 11],
    "4": [0, 5, 9, 11],
    "5": [2, 7, 8, 10],
    "6": [0, 2, 3, 5],
    "7": [1, 6, 8, 10],
    "8": [3, 4, 6, 9],
    "9": [1, 2, 5, 6],
    "10": [1, 4, 5, 8],
    "11": [3, 5, 8, 9],
}
MIXED_V5_CELL9_CUBE_SHA256 = _sha256_json(MIXED_V5_CELL9_CUBE)
MIXED_V5_CELL9_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V5_CELL9_CUBE[str(center)])}
    for center in (1, 3, 6, 9, 10)
]
MIXED_V5_CELL9_LEAN_BINDING = {
    "cube_sha256": MIXED_V5_CELL9_CUBE_SHA256,
    "nogood_declaration": MIXED_V5_CELL9_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V5_CELL9_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V5_CELL9_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 0, "x": 1, "b": 2, "c": 9, "y": 6},
        {"a": 5, "x": 9, "b": 1, "c": 3, "y": 10},
    ],
    "source_path": MIXED_V5_CELL9_LEAN_SOURCE,
    "source_bytes": MIXED_V5_CELL9_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V5_CELL9_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V5_CELL9_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V5_CELL9_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V5_CELL9_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V5_CELL0_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV5Cell0PositiveNogood"
)
MIXED_V5_CELL0_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV5Cell0"
)
MIXED_V5_CELL0_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV5Cell0PositiveCut.lean"
)
MIXED_V5_CELL0_LEAN_SOURCE_BYTES = 8383
MIXED_V5_CELL0_LEAN_SOURCE_SHA256 = (
    "35bd114b428c3d6e3f349443ba83cab627e83290c6a8291f86d56f30b3f22498"
)
MIXED_V5_CELL0_CUBE = {
    "0": [4, 5, 7, 10],
    "1": [0, 2, 6, 8],
    "2": [3, 8, 10, 11],
    "3": [2, 5, 6, 11],
    "4": [1, 2, 3, 8],
    "5": [0, 7, 9, 10],
    "6": [1, 2, 4, 9],
    "7": [4, 6, 8, 10],
    "8": [4, 5, 6, 9],
    "9": [3, 4, 7, 11],
    "10": [1, 3, 6, 9],
    "11": [0, 2, 3, 4],
}
MIXED_V5_CELL0_CUBE_SHA256 = _sha256_json(MIXED_V5_CELL0_CUBE)
MIXED_V5_CELL0_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V5_CELL0_CUBE[str(center)])}
    for center in (3, 4, 6, 9, 11)
]
MIXED_V5_CELL0_LEAN_BINDING = {
    "cube_sha256": MIXED_V5_CELL0_CUBE_SHA256,
    "nogood_declaration": MIXED_V5_CELL0_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V5_CELL0_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V5_CELL0_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 2, "x": 4, "b": 3, "c": 9, "y": 11},
        {"a": 4, "x": 6, "b": 2, "c": 3, "y": 11},
    ],
    "source_path": MIXED_V5_CELL0_LEAN_SOURCE,
    "source_bytes": MIXED_V5_CELL0_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V5_CELL0_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V5_CELL0_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V5_CELL0_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V5_CELL0_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V5_CELL3_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV5Cell3PositiveNogood"
)
MIXED_V5_CELL3_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV5Cell3"
)
MIXED_V5_CELL3_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV5Cell3PositiveCut.lean"
)
MIXED_V5_CELL3_LEAN_SOURCE_BYTES = 3593
MIXED_V5_CELL3_LEAN_SOURCE_SHA256 = (
    "bbfcd74889fe70e290acc3fcffe76d37488ba2ec51803f99a58e49229e722b0e"
)
MIXED_V5_CELL3_CUBE = {
    "0": [4, 5, 9, 11],
    "1": [0, 2, 6, 8],
    "2": [0, 3, 10, 11],
    "3": [1, 2, 5, 11],
    "4": [1, 2, 3, 7],
    "5": [0, 1, 7, 9],
    "6": [0, 3, 4, 9],
    "7": [1, 4, 6, 8],
    "8": [1, 3, 6, 9],
    "9": [0, 1, 5, 10],
    "10": [0, 2, 4, 5],
    "11": [2, 3, 4, 8],
}
MIXED_V5_CELL3_CUBE_SHA256 = _sha256_json(MIXED_V5_CELL3_CUBE)
MIXED_V5_CELL3_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V5_CELL3_CUBE[str(center)])}
    for center in (3, 4, 11)
]
MIXED_V5_CELL3_LEAN_BINDING = {
    "cube_sha256": MIXED_V5_CELL3_CUBE_SHA256,
    "nogood_declaration": MIXED_V5_CELL3_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V5_CELL3_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V5_CELL3_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 1, "x": 3, "b": 2, "c": 11, "y": 4},
    "source_path": MIXED_V5_CELL3_LEAN_SOURCE,
    "source_bytes": MIXED_V5_CELL3_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V5_CELL3_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V5_CELL3_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V5_CELL3_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V5_CELL3_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V5_CELL11_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV5Cell11PositiveNogood"
)
MIXED_V5_CELL11_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV5Cell11"
)
MIXED_V5_CELL11_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV5Cell11PositiveCut.lean"
)
MIXED_V5_CELL11_LEAN_SOURCE_BYTES = 6789
MIXED_V5_CELL11_LEAN_SOURCE_SHA256 = (
    "f12a1d2abdfa0fbd48f5077e5fbfe3c44a922e3ed657095a02f7d8739a2e20da"
)
MIXED_V5_CELL11_CUBE = {
    "0": [3, 5, 7, 11],
    "1": [0, 2, 6, 8],
    "2": [1, 7, 10, 11],
    "3": [0, 2, 7, 10],
    "4": [1, 2, 3, 5],
    "5": [2, 4, 6, 7],
    "6": [0, 3, 4, 9],
    "7": [1, 4, 6, 8],
    "8": [1, 3, 6, 9],
    "9": [0, 1, 4, 10],
    "10": [0, 1, 5, 9],
    "11": [2, 3, 4, 8],
}
MIXED_V5_CELL11_CUBE_SHA256 = _sha256_json(MIXED_V5_CELL11_CUBE)
MIXED_V5_CELL11_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V5_CELL11_CUBE[str(center)])}
    for center in (1, 3, 4, 8, 11)
]
MIXED_V5_CELL11_LEAN_BINDING = {
    "cube_sha256": MIXED_V5_CELL11_CUBE_SHA256,
    "nogood_declaration": MIXED_V5_CELL11_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V5_CELL11_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V5_CELL11_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 0, "x": 1, "b": 2, "c": 4, "y": 3},
        {"a": 1, "x": 4, "b": 3, "c": 11, "y": 8},
    ],
    "source_path": MIXED_V5_CELL11_LEAN_SOURCE,
    "source_bytes": MIXED_V5_CELL11_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V5_CELL11_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V5_CELL11_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V5_CELL11_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V5_CELL11_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V6_CELL9_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV6Cell9PositiveNogood"
)
MIXED_V6_CELL9_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell9"
)
MIXED_V6_CELL9_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV6Cell9PositiveCut.lean"
)
MIXED_V6_CELL9_LEAN_SOURCE_BYTES = 3523
MIXED_V6_CELL9_LEAN_SOURCE_SHA256 = (
    "109058a7fbfe9cf69b7c8beca08b57653d4c5dc93a332f0cfcffb9142e0b56bc"
)
MIXED_V6_CELL9_CUBE = {
    "0": [3, 5, 7, 10],
    "1": [0, 2, 6, 8],
    "2": [3, 6, 10, 11],
    "3": [2, 6, 9, 10],
    "4": [0, 2, 10, 11],
    "5": [3, 4, 8, 11],
    "6": [0, 1, 4, 10],
    "7": [1, 5, 6, 8],
    "8": [4, 5, 6, 9],
    "9": [1, 2, 8, 11],
    "10": [4, 7, 8, 9],
    "11": [0, 1, 5, 9],
}
MIXED_V6_CELL9_CUBE_SHA256 = _sha256_json(MIXED_V6_CELL9_CUBE)
MIXED_V6_CELL9_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V6_CELL9_CUBE[str(center)])}
    for center in (1, 4, 6)
]
MIXED_V6_CELL9_LEAN_BINDING = {
    "cube_sha256": MIXED_V6_CELL9_CUBE_SHA256,
    "nogood_declaration": MIXED_V6_CELL9_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V6_CELL9_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V6_CELL9_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 2, "x": 1, "b": 0, "c": 6, "y": 4},
    "source_path": MIXED_V6_CELL9_LEAN_SOURCE,
    "source_bytes": MIXED_V6_CELL9_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V6_CELL9_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V6_CELL9_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V6_CELL9_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V6_CELL9_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V6_CELL6_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV6Cell6PositiveNogood"
)
MIXED_V6_CELL6_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell6"
)
MIXED_V6_CELL6_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV6Cell6PositiveCut.lean"
)
MIXED_V6_CELL6_LEAN_SOURCE_BYTES = 4956
MIXED_V6_CELL6_LEAN_SOURCE_SHA256 = (
    "405d451b6d8911cf418e04bfdb7dbf36c408167605a17aaddcbc40653493e67a"
)
MIXED_V6_CELL6_CUBE = {
    "0": [1, 3, 4, 5],
    "1": [0, 2, 6, 8],
    "2": [0, 3, 10, 11],
    "3": [5, 7, 9, 10],
    "4": [2, 5, 8, 11],
    "5": [2, 6, 9, 10],
    "6": [0, 3, 7, 8],
    "7": [1, 5, 6, 8],
    "8": [4, 6, 9, 11],
    "9": [1, 2, 3, 7],
    "10": [0, 1, 9, 11],
    "11": [0, 2, 5, 7],
}
MIXED_V6_CELL6_CUBE_SHA256 = _sha256_json(MIXED_V6_CELL6_CUBE)
MIXED_V6_CELL6_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V6_CELL6_CUBE[str(center)])}
    for center in (6, 7, 8, 11)
]
MIXED_V6_CELL6_LEAN_BINDING = {
    "cube_sha256": MIXED_V6_CELL6_CUBE_SHA256,
    "nogood_declaration": MIXED_V6_CELL6_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V6_CELL6_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V6_CELL6_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 0, "x": 6, "b": 7, "c": 8, "y": 11},
    "source_path": MIXED_V6_CELL6_LEAN_SOURCE,
    "source_bytes": MIXED_V6_CELL6_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V6_CELL6_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V6_CELL6_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V6_CELL6_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V6_CELL6_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V6_CELL9_SECOND_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV6Cell9SecondPositiveNogood"
)
MIXED_V6_CELL9_SECOND_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell9Second"
)
MIXED_V6_CELL9_SECOND_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV6Cell9SecondPositiveCut.lean"
)
MIXED_V6_CELL9_SECOND_LEAN_SOURCE_BYTES = 4110
MIXED_V6_CELL9_SECOND_LEAN_SOURCE_SHA256 = (
    "1a7117be7c6580641f93117b7f7827e1f6c9723ea2a1f198c5ff2dfe3bb78bb0"
)
MIXED_V6_CELL9_SECOND_CUBE = {
    "0": [3, 4, 7, 11],
    "1": [0, 2, 6, 8],
    "2": [0, 1, 10, 11],
    "3": [2, 4, 6, 9],
    "4": [1, 2, 5, 8],
    "5": [0, 3, 7, 9],
    "6": [0, 2, 5, 7],
    "7": [1, 3, 6, 8],
    "8": [3, 5, 6, 9],
    "9": [1, 4, 5, 6],
    "10": [0, 1, 3, 4],
    "11": [4, 5, 7, 8],
}
MIXED_V6_CELL9_SECOND_CUBE_SHA256 = _sha256_json(MIXED_V6_CELL9_SECOND_CUBE)
MIXED_V6_CELL9_SECOND_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V6_CELL9_SECOND_CUBE[str(center)])}
    for center in (1, 2, 4, 10)
]
MIXED_V6_CELL9_SECOND_LEAN_BINDING = {
    "cube_sha256": MIXED_V6_CELL9_SECOND_CUBE_SHA256,
    "nogood_declaration": MIXED_V6_CELL9_SECOND_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V6_CELL9_SECOND_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V6_CELL9_SECOND_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 2, "x": 4, "b": 1, "c": 10, "y": 0},
    "source_path": MIXED_V6_CELL9_SECOND_LEAN_SOURCE,
    "source_bytes": MIXED_V6_CELL9_SECOND_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V6_CELL9_SECOND_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V6_CELL9_SECOND_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V6_CELL9_SECOND_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V6_CELL9_SECOND_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V6_CELL2_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV6Cell2PositiveNogood"
)
MIXED_V6_CELL2_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell2"
)
MIXED_V6_CELL2_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV6Cell2PositiveCut.lean"
)
MIXED_V6_CELL2_LEAN_SOURCE_BYTES = 4624
MIXED_V6_CELL2_LEAN_SOURCE_SHA256 = (
    "178b64dd14275b631c37e9393579465491605076bf40aa9b6f9dbf60f10dab3b"
)
MIXED_V6_CELL2_CUBE = {
    "0": [2, 3, 4, 11],
    "1": [0, 2, 6, 8],
    "2": [1, 8, 10, 11],
    "3": [0, 1, 4, 7],
    "4": [2, 5, 7, 8],
    "5": [0, 2, 3, 10],
    "6": [0, 1, 5, 9],
    "7": [1, 3, 6, 8],
    "8": [3, 5, 6, 9],
    "9": [1, 2, 7, 10],
    "10": [1, 3, 4, 5],
    "11": [4, 8, 9, 10],
}
MIXED_V6_CELL2_CUBE_SHA256 = _sha256_json(MIXED_V6_CELL2_CUBE)
MIXED_V6_CELL2_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V6_CELL2_CUBE[str(center)])}
    for center in (3, 6, 7)
]
MIXED_V6_CELL2_LEAN_BINDING = {
    "cube_sha256": MIXED_V6_CELL2_CUBE_SHA256,
    "nogood_declaration": MIXED_V6_CELL2_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V6_CELL2_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V6_CELL2_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 0, "x": 6, "b": 1, "c": 7, "y": 3},
    ],
    "source_path": MIXED_V6_CELL2_LEAN_SOURCE,
    "source_bytes": MIXED_V6_CELL2_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V6_CELL2_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V6_CELL2_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V6_CELL2_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V6_CELL2_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V6_CELL8_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV6Cell8PositiveNogood"
)
MIXED_V6_CELL8_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell8"
)
MIXED_V6_CELL8_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV6Cell8PositiveCut.lean"
)
MIXED_V6_CELL8_LEAN_SOURCE_BYTES = 3624
MIXED_V6_CELL8_LEAN_SOURCE_SHA256 = (
    "9912d0826ceba73baa2f8a59afe4da88a404bde23165516ad22be5a6a185ee0a"
)
MIXED_V6_CELL8_CUBE = {
    "0": [2, 4, 5, 11],
    "1": [0, 2, 6, 8],
    "2": [1, 7, 10, 11],
    "3": [1, 2, 4, 7],
    "4": [1, 2, 5, 8],
    "5": [2, 3, 6, 10],
    "6": [0, 2, 3, 11],
    "7": [1, 3, 6, 8],
    "8": [5, 6, 9, 11],
    "9": [0, 1, 3, 4],
    "10": [0, 1, 9, 11],
    "11": [3, 4, 5, 7],
}
MIXED_V6_CELL8_CUBE_SHA256 = _sha256_json(MIXED_V6_CELL8_CUBE)
MIXED_V6_CELL8_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V6_CELL8_CUBE[str(center)])}
    for center in (3, 4, 9)
]
MIXED_V6_CELL8_LEAN_BINDING = {
    "cube_sha256": MIXED_V6_CELL8_CUBE_SHA256,
    "nogood_declaration": MIXED_V6_CELL8_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V6_CELL8_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V6_CELL8_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 2, "x": 3, "b": 1, "c": 9, "y": 4},
    "source_path": MIXED_V6_CELL8_LEAN_SOURCE,
    "source_bytes": MIXED_V6_CELL8_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V6_CELL8_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V6_CELL8_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V6_CELL8_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V6_CELL8_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V6_CELL0_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV6Cell0PositiveNogood"
)
MIXED_V6_CELL0_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell0"
)
MIXED_V6_CELL0_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV6Cell0PositiveCut.lean"
)
MIXED_V6_CELL0_LEAN_SOURCE_BYTES = 4391
MIXED_V6_CELL0_LEAN_SOURCE_SHA256 = (
    "80aee2d22e98566aaa9cc228df9c618d4c9f06cf1771028b77c41099fc7738e3"
)
MIXED_V6_CELL0_CUBE = {
    "0": [1, 3, 4, 7],
    "1": [0, 2, 6, 8],
    "2": [0, 1, 10, 11],
    "3": [0, 5, 9, 10],
    "4": [3, 8, 9, 11],
    "5": [0, 1, 7, 9],
    "6": [0, 3, 7, 8],
    "7": [5, 6, 8, 10],
    "8": [4, 6, 9, 11],
    "9": [2, 4, 5, 8],
    "10": [0, 2, 3, 11],
    "11": [1, 3, 6, 9],
}
MIXED_V6_CELL0_CUBE_SHA256 = _sha256_json(MIXED_V6_CELL0_CUBE)
MIXED_V6_CELL0_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V6_CELL0_CUBE[str(center)])}
    for center in (0, 10, 11)
]
MIXED_V6_CELL0_LEAN_BINDING = {
    "cube_sha256": MIXED_V6_CELL0_CUBE_SHA256,
    "nogood_declaration": MIXED_V6_CELL0_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V6_CELL0_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V6_CELL0_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 1, "x": 0, "b": 3, "c": 10, "y": 11},
        {"a": 1, "x": 11, "b": 3, "c": 10, "y": 0},
    ],
    "source_path": MIXED_V6_CELL0_LEAN_SOURCE,
    "source_bytes": MIXED_V6_CELL0_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V6_CELL0_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V6_CELL0_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V6_CELL0_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V6_CELL0_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V6_CELL6_SECOND_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV6Cell6SecondPositiveNogood"
)
MIXED_V6_CELL6_SECOND_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell6Second"
)
MIXED_V6_CELL6_SECOND_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV6Cell6SecondPositiveCut.lean"
)
MIXED_V6_CELL6_SECOND_LEAN_SOURCE_BYTES = 6594
MIXED_V6_CELL6_SECOND_LEAN_SOURCE_SHA256 = (
    "7540e00b2df3b9aa01d87607f6bdb7ca6a61e9512020b39acd66cceb4b4c30ba"
)
MIXED_V6_CELL6_SECOND_CUBE = {
    "0": [3, 5, 8, 11],
    "1": [0, 2, 6, 8],
    "2": [0, 3, 10, 11],
    "3": [2, 6, 7, 10],
    "4": [1, 2, 8, 10],
    "5": [0, 2, 3, 4],
    "6": [1, 2, 4, 11],
    "7": [1, 3, 6, 8],
    "8": [5, 6, 9, 11],
    "9": [0, 1, 4, 7],
    "10": [0, 1, 9, 11],
    "11": [3, 4, 5, 7],
}
MIXED_V6_CELL6_SECOND_CUBE_SHA256 = _sha256_json(MIXED_V6_CELL6_SECOND_CUBE)
MIXED_V6_CELL6_SECOND_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V6_CELL6_SECOND_CUBE[str(center)])}
    for center in (1, 3, 4, 6, 7, 9)
]
MIXED_V6_CELL6_SECOND_LEAN_BINDING = {
    "cube_sha256": MIXED_V6_CELL6_SECOND_CUBE_SHA256,
    "nogood_declaration": MIXED_V6_CELL6_SECOND_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V6_CELL6_SECOND_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V6_CELL6_SECOND_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 1, "x": 2, "b": 6, "c": 3, "y": 7},
        {"a": 8, "x": 4, "b": 1, "c": 9, "y": 7},
    ],
    "source_path": MIXED_V6_CELL6_SECOND_LEAN_SOURCE,
    "source_bytes": MIXED_V6_CELL6_SECOND_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V6_CELL6_SECOND_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V6_CELL6_SECOND_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V6_CELL6_SECOND_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V6_CELL6_SECOND_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V6_CELL10_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV6Cell10PositiveNogood"
)
MIXED_V6_CELL10_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV6Cell10"
)
MIXED_V6_CELL10_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV6Cell10PositiveCut.lean"
)
MIXED_V6_CELL10_LEAN_SOURCE_BYTES = 3526
MIXED_V6_CELL10_LEAN_SOURCE_SHA256 = (
    "852fb4b18ad63f34ee1507e88afa33daaa585f265ac42a1a71addfe6978e2da4"
)
MIXED_V6_CELL10_CUBE = {
    "0": [2, 3, 4, 5],
    "1": [0, 2, 6, 8],
    "2": [3, 7, 10, 11],
    "3": [0, 5, 7, 9],
    "4": [2, 6, 7, 11],
    "5": [0, 2, 3, 10],
    "6": [0, 9, 10, 11],
    "7": [1, 4, 6, 8],
    "8": [1, 3, 6, 9],
    "9": [0, 1, 3, 11],
    "10": [2, 4, 8, 11],
    "11": [1, 2, 5, 10],
}
MIXED_V6_CELL10_CUBE_SHA256 = _sha256_json(MIXED_V6_CELL10_CUBE)
MIXED_V6_CELL10_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V6_CELL10_CUBE[str(center)])}
    for center in (1, 5, 11)
]
MIXED_V6_CELL10_LEAN_BINDING = {
    "cube_sha256": MIXED_V6_CELL10_CUBE_SHA256,
    "nogood_declaration": MIXED_V6_CELL10_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V6_CELL10_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V6_CELL10_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 0, "x": 1, "b": 2, "c": 11, "y": 5},
    ],
    "source_path": MIXED_V6_CELL10_LEAN_SOURCE,
    "source_bytes": MIXED_V6_CELL10_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V6_CELL10_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V6_CELL10_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V6_CELL10_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V6_CELL10_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8PositiveNogood"
)
MIXED_V7_CELL8_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8"
)
MIXED_V7_CELL8_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8PositiveCut.lean"
)
MIXED_V7_CELL8_LEAN_SOURCE_BYTES = 3657
MIXED_V7_CELL8_LEAN_SOURCE_SHA256 = (
    "02ebae2b57cc28239af73cfa20a4497faa2c6f6fca9931fee1fc68d7f14bced8"
)
MIXED_V7_CELL8_CUBE = {
    "0": [2, 3, 4, 11],
    "1": [0, 2, 6, 8],
    "2": [4, 7, 10, 11],
    "3": [1, 2, 9, 10],
    "4": [1, 5, 6, 11],
    "5": [0, 1, 7, 9],
    "6": [3, 5, 7, 11],
    "7": [1, 3, 6, 8],
    "8": [4, 5, 6, 9],
    "9": [0, 2, 3, 7],
    "10": [0, 1, 4, 5],
    "11": [1, 2, 7, 8],
}
MIXED_V7_CELL8_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_CUBE)
MIXED_V7_CELL8_LEAN_CHOICES = [
    {"center": center, "support": list(MIXED_V7_CELL8_CUBE[str(center)])}
    for center in (1, 3, 9)
]
MIXED_V7_CELL8_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 0, "x": 9, "b": 2, "c": 3, "y": 1},
    ],
    "source_path": MIXED_V7_CELL8_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_SECOND_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8SecondPositiveNogood"
)
MIXED_V7_CELL8_SECOND_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Second"
)
MIXED_V7_CELL8_SECOND_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8SecondPositiveCut.lean"
)
MIXED_V7_CELL8_SECOND_LEAN_SOURCE_BYTES = 7269
MIXED_V7_CELL8_SECOND_LEAN_SOURCE_SHA256 = (
    "e7fe292978785763e7afe5f1b04ecfe08d7dd91bc45faeefc1b062399bd473a5"
)
MIXED_V7_CELL8_SECOND_CUBE = {
    "0": [1, 3, 4, 6],
    "1": [0, 2, 6, 8],
    "2": [0, 5, 10, 11],
    "3": [1, 2, 9, 10],
    "4": [0, 3, 9, 11],
    "5": [2, 7, 8, 11],
    "6": [3, 4, 7, 11],
    "7": [1, 6, 8, 10],
    "8": [4, 6, 9, 11],
    "9": [2, 4, 5, 10],
    "10": [0, 1, 7, 8],
    "11": [0, 2, 3, 7],
}
MIXED_V7_CELL8_SECOND_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_SECOND_CUBE)
MIXED_V7_CELL8_SECOND_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_SECOND_CUBE[str(center)]),
    }
    for center in (0, 1, 7, 8, 10)
]
MIXED_V7_CELL8_SECOND_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_SECOND_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_SECOND_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_SECOND_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_SECOND_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 0, "x": 10, "b": 1, "c": 7, "y": 6},
        {"a": 4, "x": 0, "b": 6, "c": 1, "y": 8},
    ],
    "source_path": MIXED_V7_CELL8_SECOND_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_SECOND_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_SECOND_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_SECOND_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_SECOND_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_SECOND_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_THIRD_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8ThirdPositiveNogood"
)
MIXED_V7_CELL8_THIRD_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Third"
)
MIXED_V7_CELL8_THIRD_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8ThirdPositiveCut.lean"
)
MIXED_V7_CELL8_THIRD_LEAN_SOURCE_BYTES = 5415
MIXED_V7_CELL8_THIRD_LEAN_SOURCE_SHA256 = (
    "464162b69c8fd4adfcbd444d9cc77fa2cbf0bbe53554483d677d9e325dac1b6a"
)
MIXED_V7_CELL8_THIRD_CUBE = {
    "0": [1, 3, 4, 6],
    "1": [0, 2, 6, 8],
    "2": [0, 5, 10, 11],
    "3": [1, 2, 9, 10],
    "4": [0, 3, 9, 11],
    "5": [1, 3, 7, 10],
    "6": [2, 4, 8, 10],
    "7": [1, 6, 8, 11],
    "8": [5, 6, 9, 11],
    "9": [4, 5, 7, 10],
    "10": [0, 1, 7, 8],
    "11": [0, 2, 3, 7],
}
MIXED_V7_CELL8_THIRD_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_THIRD_CUBE)
MIXED_V7_CELL8_THIRD_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_THIRD_CUBE[str(center)]),
    }
    for center in (5, 9, 10)
]
MIXED_V7_CELL8_THIRD_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_THIRD_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_THIRD_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_THIRD_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_THIRD_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 1, "x": 10, "b": 7, "c": 9, "y": 5},
        {"a": 1, "x": 5, "b": 7, "c": 9, "y": 10},
    ],
    "source_path": MIXED_V7_CELL8_THIRD_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_THIRD_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_THIRD_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_THIRD_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_THIRD_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_THIRD_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_FOURTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8FourthPositiveNogood"
)
MIXED_V7_CELL8_FOURTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Fourth"
)
MIXED_V7_CELL8_FOURTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8FourthPositiveCut.lean"
)
MIXED_V7_CELL8_FOURTH_LEAN_SOURCE_BYTES = 9600
MIXED_V7_CELL8_FOURTH_LEAN_SOURCE_SHA256 = (
    "017a21c98d0b4870033cf907d2a7454faee7b07405050e97550405ad6d0ac76e"
)
MIXED_V7_CELL8_FOURTH_CUBE = {
    "0": [1, 3, 4, 6],
    "1": [0, 2, 6, 8],
    "2": [0, 5, 10, 11],
    "3": [1, 2, 9, 10],
    "4": [0, 3, 9, 11],
    "5": [3, 6, 7, 10],
    "6": [2, 4, 8, 10],
    "7": [1, 6, 8, 11],
    "8": [5, 6, 9, 11],
    "9": [4, 5, 7, 10],
    "10": [0, 1, 7, 8],
    "11": [0, 2, 3, 7],
}
MIXED_V7_CELL8_FOURTH_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_FOURTH_CUBE)
MIXED_V7_CELL8_FOURTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_FOURTH_CUBE[str(center)]),
    }
    for center in (1, 2, 3, 6, 7, 9)
]
MIXED_V7_CELL8_FOURTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_FOURTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_FOURTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_FOURTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_FOURTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 2, "x": 1, "b": 8, "c": 7, "y": 6},
        {"a": 5, "x": 2, "b": 10, "c": 3, "y": 9},
    ],
    "source_path": MIXED_V7_CELL8_FOURTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_FOURTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_FOURTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_FOURTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_FOURTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_FOURTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_FIFTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8FifthPositiveNogood"
)
MIXED_V7_CELL8_FIFTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Fifth"
)
MIXED_V7_CELL8_FIFTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8FifthPositiveCut.lean"
)
MIXED_V7_CELL8_FIFTH_LEAN_SOURCE_BYTES = 2792
MIXED_V7_CELL8_FIFTH_LEAN_SOURCE_SHA256 = (
    "41991def29b2a98d92c4541e0a4e71b493af65fb42a34a1dce6a95612ea07b58"
)
MIXED_V7_CELL8_FIFTH_CUBE = {
    "0": [2, 3, 5, 11],
    "1": [0, 2, 6, 8],
    "2": [1, 6, 10, 11],
    "3": [0, 1, 7, 9],
    "4": [0, 2, 7, 10],
    "5": [1, 4, 7, 8],
    "6": [1, 2, 3, 9],
    "7": [1, 3, 6, 8],
    "8": [4, 6, 9, 11],
    "9": [1, 2, 4, 11],
    "10": [2, 5, 7, 8],
    "11": [3, 5, 7, 10],
}
MIXED_V7_CELL8_FIFTH_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_FIFTH_CUBE)
MIXED_V7_CELL8_FIFTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_FIFTH_CUBE[str(center)]),
    }
    for center in (1, 4, 9)
]
MIXED_V7_CELL8_FIFTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_FIFTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_FIFTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_FIFTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_FIFTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 0, "x": 1, "b": 2, "c": 9, "y": 4},
    ],
    "source_path": MIXED_V7_CELL8_FIFTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_FIFTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_FIFTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_FIFTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_FIFTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_FIFTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_SIXTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8SixthPositiveNogood"
)
MIXED_V7_CELL8_SIXTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "false_of_mixedV7Cell8SixthPositiveRows"
)
MIXED_V7_CELL8_SIXTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8SixthPositiveCut.lean"
)
MIXED_V7_CELL8_SIXTH_LEAN_SOURCE_BYTES = 4005
MIXED_V7_CELL8_SIXTH_LEAN_SOURCE_SHA256 = (
    "4ecb0c345f2defcfaa5e7e2eb5682903e18e8806f3dfb70e7b61acd9bd9e22f6"
)
MIXED_V7_CELL8_SIXTH_CUBE = {
    "0": [3, 4, 8, 10],
    "1": [0, 2, 6, 8],
    "2": [0, 1, 10, 11],
    "3": [0, 4, 5, 9],
    "4": [2, 5, 7, 11],
    "5": [0, 1, 8, 9],
    "6": [1, 2, 3, 9],
    "7": [1, 3, 6, 8],
    "8": [3, 5, 6, 9],
    "9": [2, 4, 5, 8],
    "10": [7, 8, 9, 11],
    "11": [0, 2, 3, 7],
}
MIXED_V7_CELL8_SIXTH_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_SIXTH_CUBE)
MIXED_V7_CELL8_SIXTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_SIXTH_CUBE[str(center)]),
    }
    for center in (0, 3, 5, 8, 9)
]
MIXED_V7_CELL8_SIXTH_STRUCTURAL_DETECTION = {
    "stage": "equality-six-point-five-circle-collision-c",
    "core": {"o": 4, "a": 3, "b": 0, "c": 9, "e": 5, "f": 8},
}
MIXED_V7_CELL8_SIXTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_SIXTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_SIXTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_SIXTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_SIXTH_LEAN_CHOICES,
    "source_independent_structural_detection": (
        MIXED_V7_CELL8_SIXTH_STRUCTURAL_DETECTION
    ),
    "source_independent_structural_proof_sha256": (
        "f5ad85dadcd9a29cfb17ceda28e7581a990581f346b12ee766f56868a914d328"
    ),
    "source_independent_structural_nogood_sha256": (
        "85251ebf481551a70e048481fabb096e4b5214985d7142129d6088e4831b3798"
    ),
    "source_path": MIXED_V7_CELL8_SIXTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_SIXTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_SIXTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_SIXTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_SIXTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_SIXTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_SEVENTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8SeventhPositiveNogood"
)
MIXED_V7_CELL8_SEVENTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Seventh"
)
MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8SeventhPositiveCut.lean"
)
MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE_BYTES = 4008
MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE_SHA256 = (
    "629b8f4bfa4959fe4dd0f196137b6cbb60091729eff49c5ce57554f770874fac"
)
MIXED_V7_CELL8_SEVENTH_CUBE = {
    "0": [2, 3, 4, 11],
    "1": [0, 2, 6, 8],
    "2": [1, 6, 10, 11],
    "3": [1, 5, 8, 9],
    "4": [0, 2, 7, 10],
    "5": [0, 9, 10, 11],
    "6": [3, 4, 5, 10],
    "7": [1, 3, 6, 8],
    "8": [4, 6, 9, 11],
    "9": [0, 1, 4, 7],
    "10": [2, 3, 5, 8],
    "11": [2, 4, 5, 7],
}
MIXED_V7_CELL8_SEVENTH_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_SEVENTH_CUBE)
MIXED_V7_CELL8_SEVENTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_SEVENTH_CUBE[str(center)]),
    }
    for center in (4, 5, 6)
]
MIXED_V7_CELL8_SEVENTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_SEVENTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_SEVENTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_SEVENTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_SEVENTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 0, "x": 4, "b": 10, "c": 6, "y": 5},
    ],
    "source_path": MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_EIGHTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8EighthPositiveNogood"
)
MIXED_V7_CELL8_EIGHTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Eighth"
)
MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8EighthPositiveCut.lean"
)
MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE_BYTES = 6093
MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE_SHA256 = (
    "78786f3fb3cfbc630bf280d0ac96ec03ab2cbff56ffa44da704c345292f4d898"
)
MIXED_V7_CELL8_EIGHTH_CUBE = {
    "0": [2, 3, 4, 11],
    "1": [0, 2, 6, 8],
    "2": [1, 6, 10, 11],
    "3": [1, 5, 8, 9],
    "4": [0, 2, 7, 10],
    "5": [0, 9, 10, 11],
    "6": [0, 3, 5, 11],
    "7": [1, 3, 6, 8],
    "8": [4, 6, 9, 11],
    "9": [0, 1, 4, 7],
    "10": [2, 3, 5, 8],
    "11": [2, 4, 5, 7],
}
MIXED_V7_CELL8_EIGHTH_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_EIGHTH_CUBE)
MIXED_V7_CELL8_EIGHTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_EIGHTH_CUBE[str(center)]),
    }
    for center in (1, 2, 3, 5, 6, 10)
]
MIXED_V7_CELL8_EIGHTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_EIGHTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_EIGHTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_EIGHTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_EIGHTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 1, "x": 0, "b": 5, "c": 6, "y": 3},
        {"a": 1, "x": 3, "b": 5, "c": 6, "y": 0},
    ],
    "source_path": MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_NINTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8NinthPositiveNogood"
)
MIXED_V7_CELL8_NINTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Ninth"
)
MIXED_V7_CELL8_NINTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8NinthPositiveCut.lean"
)
MIXED_V7_CELL8_NINTH_LEAN_SOURCE_BYTES = 3704
MIXED_V7_CELL8_NINTH_LEAN_SOURCE_SHA256 = (
    "ebb35c707365dda19305f37d510631f313aa0b35d4e8da89a4a7494f9a7d84d9"
)
MIXED_V7_CELL8_NINTH_CUBE = {
    "0": [2, 3, 4, 11],
    "1": [0, 2, 6, 8],
    "2": [1, 7, 10, 11],
    "3": [4, 5, 6, 11],
    "4": [2, 7, 8, 11],
    "5": [1, 2, 3, 10],
    "6": [0, 1, 5, 11],
    "7": [1, 3, 6, 8],
    "8": [3, 6, 9, 11],
    "9": [0, 2, 4, 5],
    "10": [0, 1, 4, 9],
    "11": [5, 7, 8, 10],
}
MIXED_V7_CELL8_NINTH_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_NINTH_CUBE)
MIXED_V7_CELL8_NINTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_NINTH_CUBE[str(center)]),
    }
    for center in (1, 9, 10)
]
MIXED_V7_CELL8_NINTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_NINTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_NINTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_NINTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_NINTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 2, "x": 9, "b": 0, "c": 10, "y": 1},
    ],
    "source_path": MIXED_V7_CELL8_NINTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_NINTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_NINTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_NINTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_NINTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_NINTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_TENTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8TenthPositiveNogood"
)
MIXED_V7_CELL8_TENTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Tenth"
)
MIXED_V7_CELL8_TENTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8TenthPositiveCut.lean"
)
MIXED_V7_CELL8_TENTH_LEAN_SOURCE_BYTES = 2789
MIXED_V7_CELL8_TENTH_LEAN_SOURCE_SHA256 = (
    "c0a79e1cc5eed6c2fa340bd7af3d48f1be1d36cfcc82919587ac344e71ee1c2a"
)
MIXED_V7_CELL8_TENTH_CUBE = {
    "0": [2, 3, 4, 11],
    "1": [0, 2, 6, 8],
    "2": [1, 7, 10, 11],
    "3": [0, 6, 9, 11],
    "4": [2, 7, 8, 11],
    "5": [1, 2, 3, 10],
    "6": [0, 1, 5, 11],
    "7": [1, 3, 6, 8],
    "8": [3, 5, 6, 9],
    "9": [0, 2, 4, 7],
    "10": [0, 1, 4, 9],
    "11": [1, 4, 5, 7],
}
MIXED_V7_CELL8_TENTH_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_TENTH_CUBE)
MIXED_V7_CELL8_TENTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_TENTH_CUBE[str(center)]),
    }
    for center in (1, 9, 10)
]
MIXED_V7_CELL8_TENTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_TENTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_TENTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_TENTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_TENTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 2, "x": 9, "b": 0, "c": 10, "y": 1},
    ],
    "source_path": MIXED_V7_CELL8_TENTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_TENTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_TENTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_TENTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_TENTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_TENTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_ELEVENTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8EleventhPositiveNogood"
)
MIXED_V7_CELL8_ELEVENTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Eleventh"
)
MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8EleventhPositiveCut.lean"
)
MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE_BYTES = 2821
MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE_SHA256 = (
    "6e4a53ed464a5ff7d6dacb39a1513633f8cb3ae45eebb4b20a93a9f08e9c1488"
)
MIXED_V7_CELL8_ELEVENTH_CUBE = {
    "0": [2, 3, 4, 11],
    "1": [0, 2, 6, 8],
    "2": [3, 8, 10, 11],
    "3": [1, 6, 10, 11],
    "4": [2, 7, 8, 11],
    "5": [1, 2, 3, 10],
    "6": [0, 3, 4, 9],
    "7": [1, 3, 6, 8],
    "8": [4, 5, 6, 9],
    "9": [0, 2, 5, 7],
    "10": [0, 1, 7, 9],
    "11": [1, 5, 7, 8],
}
MIXED_V7_CELL8_ELEVENTH_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_ELEVENTH_CUBE)
MIXED_V7_CELL8_ELEVENTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_ELEVENTH_CUBE[str(center)]),
    }
    for center in (1, 9, 10)
]
MIXED_V7_CELL8_ELEVENTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_ELEVENTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_ELEVENTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_ELEVENTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_ELEVENTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 2, "x": 9, "b": 0, "c": 10, "y": 1},
    ],
    "source_path": MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_TWELFTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8TwelfthPositiveNogood"
)
MIXED_V7_CELL8_TWELFTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Twelfth"
)
MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8TwelfthPositiveCut.lean"
)
MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE_BYTES = 6236
MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE_SHA256 = (
    "37f28ad9fd847b1c261090ea9218dfd9806b57b1db86ad7da2c5b010b0f69b27"
)
MIXED_V7_CELL8_TWELFTH_CUBE = {
    "0": [1, 4, 5, 7],
    "1": [0, 2, 6, 8],
    "2": [0, 3, 10, 11],
    "3": [1, 6, 10, 11],
    "4": [2, 7, 8, 11],
    "5": [1, 2, 3, 10],
    "6": [0, 5, 9, 11],
    "7": [1, 3, 6, 8],
    "8": [3, 4, 6, 9],
    "9": [0, 4, 7, 8],
    "10": [3, 4, 5, 8],
    "11": [0, 2, 5, 7],
}
MIXED_V7_CELL8_TWELFTH_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_TWELFTH_CUBE)
MIXED_V7_CELL8_TWELFTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_TWELFTH_CUBE[str(center)]),
    }
    for center in (3, 5, 6, 10, 11)
]
MIXED_V7_CELL8_TWELFTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_TWELFTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_TWELFTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_TWELFTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_TWELFTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 0, "x": 11, "b": 5, "c": 3, "y": 6},
        {"a": 0, "x": 6, "b": 5, "c": 3, "y": 11},
    ],
    "source_path": MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_THIRTEENTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8ThirteenthPositiveNogood"
)
MIXED_V7_CELL8_THIRTEENTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Thirteenth"
)
MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8ThirteenthPositiveCut.lean"
)
MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE_BYTES = 2814
MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE_SHA256 = (
    "00808f26c902bd3c491e982475c4eddb24b6628f2f8ed6504c324392e2f5c3d6"
)
MIXED_V7_CELL8_THIRTEENTH_CUBE = {
    "0": [2, 3, 5, 11],
    "1": [0, 2, 6, 8],
    "2": [1, 6, 10, 11],
    "3": [4, 5, 7, 11],
    "4": [7, 8, 9, 10],
    "5": [0, 4, 9, 10],
    "6": [0, 2, 3, 4],
    "7": [3, 6, 8, 10],
    "8": [4, 5, 6, 9],
    "9": [2, 7, 10, 11],
    "10": [1, 3, 5, 8],
    "11": [2, 5, 7, 8],
}
MIXED_V7_CELL8_THIRTEENTH_CUBE_SHA256 = _sha256_json(
    MIXED_V7_CELL8_THIRTEENTH_CUBE
)
MIXED_V7_CELL8_THIRTEENTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_THIRTEENTH_CUBE[str(center)]),
    }
    for center in (0, 1, 6)
]
MIXED_V7_CELL8_THIRTEENTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_THIRTEENTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_THIRTEENTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_THIRTEENTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_THIRTEENTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 3, "x": 0, "b": 2, "c": 1, "y": 6},
    ],
    "source_path": MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_FOURTEENTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8FourteenthPositiveNogood"
)
MIXED_V7_CELL8_FOURTEENTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Fourteenth"
)
MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8FourteenthPositiveCut.lean"
)
MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE_BYTES = 2814
MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE_SHA256 = (
    "0df2806f84ee4503ec7d075d17e2df98e1ec44c2a0f9753fec0ac97bab981c94"
)
MIXED_V7_CELL8_FOURTEENTH_CUBE = {
    "0": [2, 3, 5, 11],
    "1": [0, 2, 6, 8],
    "2": [3, 9, 10, 11],
    "3": [4, 5, 7, 11],
    "4": [0, 1, 9, 11],
    "5": [1, 2, 4, 10],
    "6": [1, 2, 7, 8],
    "7": [3, 5, 6, 8],
    "8": [1, 4, 6, 9],
    "9": [0, 4, 5, 6],
    "10": [0, 2, 3, 4],
    "11": [0, 5, 7, 8],
}
MIXED_V7_CELL8_FOURTEENTH_CUBE_SHA256 = _sha256_json(
    MIXED_V7_CELL8_FOURTEENTH_CUBE
)
MIXED_V7_CELL8_FOURTEENTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_FOURTEENTH_CUBE[str(center)]),
    }
    for center in (0, 2, 10)
]
MIXED_V7_CELL8_FOURTEENTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_FOURTEENTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_FOURTEENTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_FOURTEENTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_FOURTEENTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 11, "x": 0, "b": 3, "c": 10, "y": 2},
    ],
    "source_path": MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_FIFTEENTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8FifteenthPositiveNogood"
)
MIXED_V7_CELL8_FIFTEENTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Fifteenth"
)
MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8FifteenthPositiveCut.lean"
)
MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE_BYTES = 3119
MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE_SHA256 = (
    "f57cf850e18d15b24baa342ae0f5308d0a4ffd6f9f13439964c987bc5b46fbf3"
)
MIXED_V7_CELL8_FIFTEENTH_CUBE = {
    "0": [3, 4, 9, 11],
    "1": [0, 2, 6, 8],
    "2": [0, 3, 10, 11],
    "3": [2, 4, 7, 8],
    "4": [0, 1, 5, 11],
    "5": [0, 1, 9, 10],
    "6": [0, 2, 3, 4],
    "7": [1, 4, 6, 8],
    "8": [3, 5, 6, 9],
    "9": [2, 5, 6, 11],
    "10": [1, 2, 9, 11],
    "11": [1, 3, 6, 7],
}
MIXED_V7_CELL8_FIFTEENTH_CUBE_SHA256 = _sha256_json(
    MIXED_V7_CELL8_FIFTEENTH_CUBE
)
MIXED_V7_CELL8_FIFTEENTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_FIFTEENTH_CUBE[str(center)]),
    }
    for center in (0, 2, 6)
]
MIXED_V7_CELL8_FIFTEENTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_FIFTEENTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_FIFTEENTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_FIFTEENTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_FIFTEENTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 11, "x": 0, "b": 3, "c": 6, "y": 2},
    ],
    "source_path": MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_SIXTEENTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8SixteenthPositiveNogood"
)
MIXED_V7_CELL8_SIXTEENTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Sixteenth"
)
MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8SixteenthPositiveCut.lean"
)
MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE_BYTES = 2813
MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE_SHA256 = (
    "74f14d0ec23a99a7a6a677866381e1b864425431b8b188ca4f66557bb4c3e811"
)
MIXED_V7_CELL8_SIXTEENTH_CUBE = {
    "0": [2, 3, 4, 11],
    "1": [0, 2, 6, 8],
    "2": [4, 7, 10, 11],
    "3": [1, 2, 4, 6],
    "4": [0, 6, 7, 11],
    "5": [0, 1, 3, 10],
    "6": [0, 2, 5, 7],
    "7": [1, 3, 6, 8],
    "8": [5, 6, 9, 11],
    "9": [2, 8, 10, 11],
    "10": [0, 1, 9, 11],
    "11": [3, 5, 7, 8],
}
MIXED_V7_CELL8_SIXTEENTH_CUBE_SHA256 = _sha256_json(
    MIXED_V7_CELL8_SIXTEENTH_CUBE
)
MIXED_V7_CELL8_SIXTEENTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_SIXTEENTH_CUBE[str(center)]),
    }
    for center in (1, 3, 6)
]
MIXED_V7_CELL8_SIXTEENTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_SIXTEENTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_SIXTEENTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_SIXTEENTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_SIXTEENTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 0, "x": 6, "b": 2, "c": 3, "y": 1},
    ],
    "source_path": MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_SEVENTEENTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8SeventeenthPositiveNogood"
)
MIXED_V7_CELL8_SEVENTEENTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Seventeenth"
)
MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8SeventeenthPositiveCut.lean"
)
MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE_BYTES = 6652
MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE_SHA256 = (
    "4363cc6c7a7255ecfe270f1271db32a34e7069c4076dfdfe4df82d2d52d2bb96"
)
MIXED_V7_CELL8_SEVENTEENTH_CUBE = {
    "0": [1, 3, 4, 8],
    "1": [0, 2, 6, 8],
    "2": [3, 6, 10, 11],
    "3": [4, 6, 7, 10],
    "4": [0, 7, 9, 10],
    "5": [2, 8, 10, 11],
    "6": [0, 2, 4, 5],
    "7": [1, 5, 6, 8],
    "8": [3, 4, 6, 9],
    "9": [1, 3, 5, 7],
    "10": [3, 5, 8, 9],
    "11": [1, 2, 4, 7],
}
MIXED_V7_CELL8_SEVENTEENTH_CUBE_SHA256 = _sha256_json(
    MIXED_V7_CELL8_SEVENTEENTH_CUBE
)
MIXED_V7_CELL8_SEVENTEENTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_SEVENTEENTH_CUBE[str(center)]),
    }
    for center in (1, 2, 5, 7, 8)
]
MIXED_V7_CELL8_SEVENTEENTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_SEVENTEENTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_SEVENTEENTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_SEVENTEENTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_SEVENTEENTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 3, "x": 2, "b": 6, "c": 1, "y": 8},
        {"a": 2, "x": 1, "b": 8, "c": 7, "y": 5},
    ],
    "source_path": MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_EIGHTEENTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8EighteenthPositiveNogood"
)
MIXED_V7_CELL8_EIGHTEENTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientationCoverage_mixedV7Cell8Eighteenth"
)
MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8EighteenthPositiveCut.lean"
)
MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE_BYTES = 8606
MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE_SHA256 = (
    "5fced4304c884da53e637b903add5253ce26aea173268f2b14b8d63d3658bd90"
)
MIXED_V7_CELL8_EIGHTEENTH_CUBE = {
    "0": [4, 5, 8, 11],
    "1": [0, 2, 6, 8],
    "2": [0, 3, 10, 11],
    "3": [1, 8, 9, 11],
    "4": [1, 2, 3, 8],
    "5": [1, 2, 7, 10],
    "6": [0, 2, 4, 7],
    "7": [3, 5, 6, 8],
    "8": [4, 6, 9, 11],
    "9": [2, 3, 6, 11],
    "10": [0, 1, 7, 9],
    "11": [3, 5, 7, 10],
}
MIXED_V7_CELL8_EIGHTEENTH_CUBE_SHA256 = _sha256_json(
    MIXED_V7_CELL8_EIGHTEENTH_CUBE
)
MIXED_V7_CELL8_EIGHTEENTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_EIGHTEENTH_CUBE[str(center)]),
    }
    for center in (3, 5, 7, 8, 9, 10, 11)
]
MIXED_V7_CELL8_EIGHTEENTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_EIGHTEENTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_EIGHTEENTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_EIGHTEENTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_EIGHTEENTH_LEAN_CHOICES,
    "preferred_common_five_cores": [
        {"a": 1, "x": 5, "b": 7, "c": 11, "y": 10},
        {"a": 6, "x": 7, "b": 3, "c": 11, "y": 9},
        {"a": 6, "x": 8, "b": 11, "c": 3, "y": 9},
    ],
    "source_path": MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_NINETEENTH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8NineteenthPositiveNogood"
)
MIXED_V7_CELL8_NINETEENTH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientation_core_0_10_1_3_9"
)
MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8NineteenthPositiveCut.lean"
)
MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE_BYTES = 4344
MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE_SHA256 = (
    "ebff5b867abf7e96294f0e92db6f853e8af6a178a44aed7fa4566e68787727f0"
)
MIXED_V7_CELL8_NINETEENTH_CUBE = {
    "0": [4, 5, 8, 11],
    "1": [0, 2, 6, 8],
    "2": [0, 3, 10, 11],
    "3": [1, 8, 9, 10],
    "4": [1, 2, 3, 8],
    "5": [1, 2, 7, 10],
    "6": [0, 2, 4, 7],
    "7": [3, 5, 6, 8],
    "8": [4, 6, 9, 11],
    "9": [0, 1, 3, 6],
    "10": [0, 1, 7, 9],
    "11": [3, 5, 7, 10],
}
MIXED_V7_CELL8_NINETEENTH_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_NINETEENTH_CUBE)
MIXED_V7_CELL8_NINETEENTH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_NINETEENTH_CUBE[str(center)]),
    }
    for center in (3, 9, 10)
]
MIXED_V7_CELL8_NINETEENTH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_NINETEENTH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_NINETEENTH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_NINETEENTH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_NINETEENTH_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 0, "x": 10, "b": 1, "c": 3, "y": 9},
    "source_path": MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_TWENTIETH_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8TwentiethPositiveNogood"
)
MIXED_V7_CELL8_TWENTIETH_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientation_core_7_4_0_6_5"
)
MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8TwentiethPositiveCut.lean"
)
MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE_BYTES = 4389
MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE_SHA256 = (
    "4c19358014e3d1b7c83852bdfa3593e914fae58902d0a3169907e548e389af7d"
)
MIXED_V7_CELL8_TWENTIETH_CUBE = {
    "0": [3, 4, 7, 11],
    "1": [0, 2, 6, 8],
    "2": [0, 3, 10, 11],
    "3": [5, 7, 9, 10],
    "4": [0, 1, 7, 9],
    "5": [0, 2, 3, 7],
    "6": [0, 4, 5, 10],
    "7": [1, 5, 6, 8],
    "8": [4, 6, 9, 11],
    "9": [1, 6, 7, 11],
    "10": [1, 2, 9, 11],
    "11": [2, 4, 7, 8],
}
MIXED_V7_CELL8_TWENTIETH_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_TWENTIETH_CUBE)
MIXED_V7_CELL8_TWENTIETH_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_TWENTIETH_CUBE[str(center)]),
    }
    for center in (4, 5, 6)
]
MIXED_V7_CELL8_TWENTIETH_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_TWENTIETH_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_TWENTIETH_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_TWENTIETH_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_TWENTIETH_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 7, "x": 4, "b": 0, "c": 6, "y": 5},
    "source_path": MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

MIXED_V7_CELL8_TWENTY_FIRST_LEAN_NOGOOD = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "mixedV7Cell8TwentyFirstPositiveNogood"
)
MIXED_V7_CELL8_TWENTY_FIRST_LEAN_COVERAGE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress."
    "FrozenBoundaryOrder.commonOrientation_core_1_3_2_0_4"
)
MIXED_V7_CELL8_TWENTY_FIRST_LEAN_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ExactTwelveRigid221MixedV7Cell8TwentyFirstPositiveCut.lean"
)
MIXED_V7_CELL8_TWENTY_FIRST_LEAN_SOURCE_BYTES = 3709
MIXED_V7_CELL8_TWENTY_FIRST_LEAN_SOURCE_SHA256 = (
    "af3ec71d8e571db8e3582577eea8610a81a9282980fe6230d297c83f07bc0215"
)
MIXED_V7_CELL8_TWENTY_FIRST_CUBE = {
    "0": [2, 3, 4, 11],
    "1": [0, 2, 6, 8],
    "2": [1, 7, 10, 11],
    "3": [1, 2, 4, 9],
    "4": [1, 2, 5, 8],
    "5": [0, 1, 3, 10],
    "6": [0, 2, 5, 7],
    "7": [1, 3, 6, 8],
    "8": [5, 6, 9, 11],
    "9": [0, 4, 5, 6],
    "10": [0, 1, 9, 11],
    "11": [3, 4, 5, 7],
}
MIXED_V7_CELL8_TWENTY_FIRST_CUBE_SHA256 = _sha256_json(MIXED_V7_CELL8_TWENTY_FIRST_CUBE)
MIXED_V7_CELL8_TWENTY_FIRST_LEAN_CHOICES = [
    {
        "center": center,
        "support": list(MIXED_V7_CELL8_TWENTY_FIRST_CUBE[str(center)]),
    }
    for center in (0, 3, 4)
]
MIXED_V7_CELL8_TWENTY_FIRST_LEAN_BINDING = {
    "cube_sha256": MIXED_V7_CELL8_TWENTY_FIRST_CUBE_SHA256,
    "nogood_declaration": MIXED_V7_CELL8_TWENTY_FIRST_LEAN_NOGOOD,
    "coverage_declaration": MIXED_V7_CELL8_TWENTY_FIRST_LEAN_COVERAGE,
    "terminal_consumer_declaration": LEAN_TERMINAL_CONSUMER,
    "choices": MIXED_V7_CELL8_TWENTY_FIRST_LEAN_CHOICES,
    "preferred_common_five_core": {"a": 1, "x": 3, "b": 2, "c": 0, "y": 4},
    "source_path": MIXED_V7_CELL8_TWENTY_FIRST_LEAN_SOURCE,
    "source_bytes": MIXED_V7_CELL8_TWENTY_FIRST_LEAN_SOURCE_BYTES,
    "source_sha256": MIXED_V7_CELL8_TWENTY_FIRST_LEAN_SOURCE_SHA256,
    "coverage_source_path": MIXED_V7_CELL8_TWENTY_FIRST_LEAN_SOURCE,
    "coverage_source_bytes": MIXED_V7_CELL8_TWENTY_FIRST_LEAN_SOURCE_BYTES,
    "coverage_source_sha256": MIXED_V7_CELL8_TWENTY_FIRST_LEAN_SOURCE_SHA256,
    "consumer_source_path": FROZEN_V8_LEAN_CONSUMER_SOURCE,
    "consumer_source_bytes": FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    "consumer_source_sha256": FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
}

# Bank indices are authenticated journal data.  Never reorder existing entries;
# append new proof-backed bindings so retained journals remain replayable.
PROOF_BACKED_CUBE_BINDINGS = (
    (FROZEN_V8_CUBE, FROZEN_V8_LEAN_BINDING, FROZEN_V8_LEAN_CHOICES),
    (
        MIXED_V3_CELL2_CUBE,
        MIXED_V3_CELL2_LEAN_BINDING,
        MIXED_V3_CELL2_LEAN_CHOICES,
    ),
    (
        MIXED_V3_CELL4_CUBE,
        MIXED_V3_CELL4_LEAN_BINDING,
        MIXED_V3_CELL4_LEAN_CHOICES,
    ),
    (
        MIXED_V3_CELL5_CUBE,
        MIXED_V3_CELL5_LEAN_BINDING,
        MIXED_V3_CELL5_LEAN_CHOICES,
    ),
    (
        MIXED_V3_CELL7_CUBE,
        MIXED_V3_CELL7_LEAN_BINDING,
        MIXED_V3_CELL7_LEAN_CHOICES,
    ),
    (
        MIXED_V3_CELL8_CUBE,
        MIXED_V3_CELL8_LEAN_BINDING,
        MIXED_V3_CELL8_LEAN_CHOICES,
    ),
    (
        MIXED_V4_CELL4_CUBE,
        MIXED_V4_CELL4_LEAN_BINDING,
        MIXED_V4_CELL4_LEAN_CHOICES,
    ),
    (
        MIXED_V4_CELL1_CUBE,
        MIXED_V4_CELL1_LEAN_BINDING,
        MIXED_V4_CELL1_LEAN_CHOICES,
    ),
    (
        MIXED_V4_CELL1_SECOND_CUBE,
        MIXED_V4_CELL1_SECOND_LEAN_BINDING,
        MIXED_V4_CELL1_SECOND_LEAN_CHOICES,
    ),
    (
        MIXED_V4_CELL1_THIRD_CUBE,
        MIXED_V4_CELL1_THIRD_LEAN_BINDING,
        MIXED_V4_CELL1_THIRD_LEAN_CHOICES,
    ),
    (
        MIXED_V4_CELL10_CUBE,
        MIXED_V4_CELL10_LEAN_BINDING,
        MIXED_V4_CELL10_LEAN_CHOICES,
    ),
    (
        MIXED_V4_CELL2_CUBE,
        MIXED_V4_CELL2_LEAN_BINDING,
        MIXED_V4_CELL2_LEAN_CHOICES,
    ),
    (
        MIXED_V4_CELL5_CUBE,
        MIXED_V4_CELL5_LEAN_BINDING,
        MIXED_V4_CELL5_LEAN_CHOICES,
    ),
    (
        MIXED_V4_CELL8_CUBE,
        MIXED_V4_CELL8_LEAN_BINDING,
        MIXED_V4_CELL8_LEAN_CHOICES,
    ),
    (
        MIXED_V4_CELL11_CUBE,
        MIXED_V4_CELL11_LEAN_BINDING,
        MIXED_V4_CELL11_LEAN_CHOICES,
    ),
    (
        MIXED_V4_CELL1_FOURTH_CUBE,
        MIXED_V4_CELL1_FOURTH_LEAN_BINDING,
        MIXED_V4_CELL1_FOURTH_LEAN_CHOICES,
    ),
    (
        MIXED_V4_CELL2_SECOND_CUBE,
        MIXED_V4_CELL2_SECOND_LEAN_BINDING,
        MIXED_V4_CELL2_SECOND_LEAN_CHOICES,
    ),
    (
        MIXED_V4_CELL10_SECOND_CUBE,
        MIXED_V4_CELL10_SECOND_LEAN_BINDING,
        MIXED_V4_CELL10_SECOND_LEAN_CHOICES,
    ),
    (
        MIXED_V5_CELL4_CUBE,
        MIXED_V5_CELL4_LEAN_BINDING,
        MIXED_V5_CELL4_LEAN_CHOICES,
    ),
    (
        MIXED_V5_CELL9_CUBE,
        MIXED_V5_CELL9_LEAN_BINDING,
        MIXED_V5_CELL9_LEAN_CHOICES,
    ),
    (
        MIXED_V5_CELL0_CUBE,
        MIXED_V5_CELL0_LEAN_BINDING,
        MIXED_V5_CELL0_LEAN_CHOICES,
    ),
    (
        MIXED_V5_CELL3_CUBE,
        MIXED_V5_CELL3_LEAN_BINDING,
        MIXED_V5_CELL3_LEAN_CHOICES,
    ),
    (
        MIXED_V5_CELL11_CUBE,
        MIXED_V5_CELL11_LEAN_BINDING,
        MIXED_V5_CELL11_LEAN_CHOICES,
    ),
    (
        MIXED_V6_CELL9_CUBE,
        MIXED_V6_CELL9_LEAN_BINDING,
        MIXED_V6_CELL9_LEAN_CHOICES,
    ),
    (
        MIXED_V6_CELL6_CUBE,
        MIXED_V6_CELL6_LEAN_BINDING,
        MIXED_V6_CELL6_LEAN_CHOICES,
    ),
    (
        MIXED_V6_CELL9_SECOND_CUBE,
        MIXED_V6_CELL9_SECOND_LEAN_BINDING,
        MIXED_V6_CELL9_SECOND_LEAN_CHOICES,
    ),
    (
        MIXED_V6_CELL2_CUBE,
        MIXED_V6_CELL2_LEAN_BINDING,
        MIXED_V6_CELL2_LEAN_CHOICES,
    ),
    (
        MIXED_V6_CELL8_CUBE,
        MIXED_V6_CELL8_LEAN_BINDING,
        MIXED_V6_CELL8_LEAN_CHOICES,
    ),
    (
        MIXED_V6_CELL0_CUBE,
        MIXED_V6_CELL0_LEAN_BINDING,
        MIXED_V6_CELL0_LEAN_CHOICES,
    ),
    (
        MIXED_V6_CELL6_SECOND_CUBE,
        MIXED_V6_CELL6_SECOND_LEAN_BINDING,
        MIXED_V6_CELL6_SECOND_LEAN_CHOICES,
    ),
    (
        MIXED_V6_CELL10_CUBE,
        MIXED_V6_CELL10_LEAN_BINDING,
        MIXED_V6_CELL10_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_CUBE,
        MIXED_V7_CELL8_LEAN_BINDING,
        MIXED_V7_CELL8_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_SECOND_CUBE,
        MIXED_V7_CELL8_SECOND_LEAN_BINDING,
        MIXED_V7_CELL8_SECOND_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_THIRD_CUBE,
        MIXED_V7_CELL8_THIRD_LEAN_BINDING,
        MIXED_V7_CELL8_THIRD_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_FOURTH_CUBE,
        MIXED_V7_CELL8_FOURTH_LEAN_BINDING,
        MIXED_V7_CELL8_FOURTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_FIFTH_CUBE,
        MIXED_V7_CELL8_FIFTH_LEAN_BINDING,
        MIXED_V7_CELL8_FIFTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_SIXTH_CUBE,
        MIXED_V7_CELL8_SIXTH_LEAN_BINDING,
        MIXED_V7_CELL8_SIXTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_SEVENTH_CUBE,
        MIXED_V7_CELL8_SEVENTH_LEAN_BINDING,
        MIXED_V7_CELL8_SEVENTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_EIGHTH_CUBE,
        MIXED_V7_CELL8_EIGHTH_LEAN_BINDING,
        MIXED_V7_CELL8_EIGHTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_NINTH_CUBE,
        MIXED_V7_CELL8_NINTH_LEAN_BINDING,
        MIXED_V7_CELL8_NINTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_TENTH_CUBE,
        MIXED_V7_CELL8_TENTH_LEAN_BINDING,
        MIXED_V7_CELL8_TENTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_ELEVENTH_CUBE,
        MIXED_V7_CELL8_ELEVENTH_LEAN_BINDING,
        MIXED_V7_CELL8_ELEVENTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_TWELFTH_CUBE,
        MIXED_V7_CELL8_TWELFTH_LEAN_BINDING,
        MIXED_V7_CELL8_TWELFTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_THIRTEENTH_CUBE,
        MIXED_V7_CELL8_THIRTEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_THIRTEENTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_FOURTEENTH_CUBE,
        MIXED_V7_CELL8_FOURTEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_FOURTEENTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_FIFTEENTH_CUBE,
        MIXED_V7_CELL8_FIFTEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_FIFTEENTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_SIXTEENTH_CUBE,
        MIXED_V7_CELL8_SIXTEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_SIXTEENTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_SEVENTEENTH_CUBE,
        MIXED_V7_CELL8_SEVENTEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_SEVENTEENTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_EIGHTEENTH_CUBE,
        MIXED_V7_CELL8_EIGHTEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_EIGHTEENTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_NINETEENTH_CUBE,
        MIXED_V7_CELL8_NINETEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_NINETEENTH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_TWENTIETH_CUBE,
        MIXED_V7_CELL8_TWENTIETH_LEAN_BINDING,
        MIXED_V7_CELL8_TWENTIETH_LEAN_CHOICES,
    ),
    (
        MIXED_V7_CELL8_TWENTY_FIRST_CUBE,
        MIXED_V7_CELL8_TWENTY_FIRST_LEAN_BINDING,
        MIXED_V7_CELL8_TWENTY_FIRST_LEAN_CHOICES,
    ),
)


def _proof_backed_binding(
    cube: Mapping[str, Sequence[int]],
) -> tuple[dict[str, Any], list[dict[str, Any]]] | None:
    for bound_cube, binding, choices in PROOF_BACKED_CUBE_BINDINGS:
        if cube == bound_cube:
            return binding, choices
    return None


def _cube_payload(
    cube: Mapping[int | str, Collection[int]],
) -> dict[str, list[int]]:
    if not isinstance(cube, Mapping):
        raise Exact12V14OrderedCoverageError("cube is not a mapping")
    integer_keys = set(range(N))
    string_keys = {str(center) for center in range(N)}
    if set(cube) == integer_keys:
        supports = (cube[center] for center in range(N))
    elif set(cube) == string_keys:
        supports = (cube[str(center)] for center in range(N))
    else:
        raise Exact12V14OrderedCoverageError(
            "cube must contain every exact-12 center exactly once"
        )
    payload: dict[str, list[int]] = {}
    for center, support in enumerate(supports):
        if isinstance(support, (str, bytes)):
            raise Exact12V14OrderedCoverageError("cube support is malformed")
        try:
            normalized = sorted(support)
        except TypeError as exc:
            raise Exact12V14OrderedCoverageError("cube support is malformed") from exc
        if len(normalized) != 4 or any(
            type(point) is not int or not 0 <= point < N for point in normalized
        ):
            raise Exact12V14OrderedCoverageError(
                "each selected support must be four distinct other labels"
            )
        if len(set(normalized)) != 4 or center in normalized:
            raise Exact12V14OrderedCoverageError(
                "each selected support must be four distinct other labels"
            )
        payload[str(center)] = normalized
    return payload


def _metric_rows(cube: Mapping[str, Sequence[int]]) -> tuple[metric.MetricRow, ...]:
    # False is essential: selected supports are not complete ambient fibres.
    return tuple(
        metric.MetricRow(center, tuple(cube[str(center)]), False) for center in range(N)
    )


def _cyclic_triple(order: Sequence[int], triple: Sequence[int]) -> bool:
    if len(order) != N or set(order) != set(range(N)) or len(set(triple)) != 3:
        return False
    positions = [order.index(label) for label in triple]
    return any(
        positions[(start + 0) % 3]
        < positions[(start + 1) % 3]
        < positions[(start + 2) % 3]
        for start in range(3)
    )


def _common_five_orientation(
    order: Sequence[int], core: Mapping[str, int]
) -> str | None:
    forward = _cyclic_triple(order, (core["a"], core["x"], core["b"])) and (
        _cyclic_triple(order, (core["b"], core["c"], core["y"]))
    )
    if forward:
        return "forward"
    reverse = _cyclic_triple(order, (core["a"], core["b"], core["x"])) and (
        _cyclic_triple(order, (core["b"], core["y"], core["c"]))
    )
    return "reverse" if reverse else None


def _common_five_point_cores(
    rows: Sequence[metric.MetricRow],
) -> tuple[dict[str, int], ...]:
    closure = metric._row_equality_closure(N, rows)
    roots, _circle_masks = metric._closure_circle_index(closure, N)
    cores: list[dict[str, int]] = []
    for a in range(N):
        for b in range(N):
            if b == a:
                continue
            bisectors = tuple(
                point
                for point in range(N)
                if point not in (a, b) and roots[point][a] == roots[point][b]
            )
            for x in bisectors:
                for y in bisectors:
                    if y == x:
                        continue
                    for c in range(N):
                        if c in (a, x, b, y):
                            continue
                        if roots[c][b] == roots[c][x] == roots[c][y]:
                            cores.append({"a": a, "x": x, "b": b, "c": c, "y": y})
    return tuple(cores)


def _closure_memberships(certificate: Mapping[str, Any]) -> MembershipKey:
    required: dict[int, set[int]] = {}
    paths = certificate.get("closure_paths")
    if not isinstance(paths, list):
        raise Exact12V14OrderedCoverageError("closure paths are malformed")
    for path in paths:
        if not isinstance(path, dict) or not isinstance(path.get("steps"), list):
            raise Exact12V14OrderedCoverageError("closure path is malformed")
        for step in path["steps"]:
            if step.get("kind") == "flip":
                continue
            if step.get("kind") != "row":
                raise Exact12V14OrderedCoverageError(
                    "closure path contains an unsupported step"
                )
            center = int(step["center"])
            required.setdefault(center, set()).update(
                (int(step["first"]), int(step["second"]))
            )
    key = tuple(
        (center, tuple(sorted(points))) for center, points in sorted(required.items())
    )
    if not key:
        raise Exact12V14OrderedCoverageError("closure proof used no row facts")
    return key


def _strict_kalmanson(
    rows: Mapping[int, metric.MetricRow], order: Sequence[int]
) -> tuple[dict[str, Any], MembershipKey] | None:
    """Match the fixed-position exact-12 Kalmanson wrapper, without rotation."""

    for io, ia, iy, ie, ic in itertools.combinations(range(N), 5):
        o, a, y, e, c = (int(order[i]) for i in (io, ia, iy, ie, ic))
        required: MembershipKey = (
            (a, tuple(sorted((c, o)))),
            (o, tuple(sorted((e, c)))),
            (y, tuple(sorted((o, e)))),
        )
        if all(set(points) <= set(rows[center].support) for center, points in required):
            detection = {
                "lean_source_theorems": list(KALMANSON_SOURCE_THEOREMS),
                "labels": {"o": o, "a": a, "y": y, "e": e, "c": c},
                "positions": {"o": io, "a": ia, "y": iy, "e": ie, "c": ic},
            }
            return detection, tuple(sorted(required))
    return None


def _shared_late_pair(
    rows: Mapping[int, metric.MetricRow], order: Sequence[int]
) -> tuple[dict[str, Any], MembershipKey] | None:
    for ia, ib, ic, id_ in itertools.combinations(range(N), 4):
        a, b, c, d = (int(order[i]) for i in (ia, ib, ic, id_))
        required: MembershipKey = (
            (a, tuple(sorted((c, d)))),
            (b, tuple(sorted((c, d)))),
        )
        if all(set(points) <= set(rows[center].support) for center, points in required):
            detection = {
                "lean_source_theorems": list(SHARED_LATE_SOURCE_THEOREMS),
                "labels": {"a": a, "b": b, "c": c, "d": d},
                "positions": {"a": ia, "b": ib, "c": ic, "d": id_},
            }
            return detection, tuple(sorted(required))
    return None


def _merge_memberships(keys: Sequence[MembershipKey]) -> MembershipKey:
    required: dict[int, set[int]] = {}
    for key in keys:
        for center, points in key:
            required.setdefault(center, set()).update(points)
    return tuple(
        (center, tuple(sorted(points))) for center, points in sorted(required.items())
    )


def _build_source_independent_structural_body(
    cube: Mapping[str, Sequence[int]],
    rows: Sequence[metric.MetricRow],
    binding: Mapping[str, Any],
) -> dict[str, Any]:
    """Replay one Lean-bound structural core uniformly over all source orders."""

    detection = binding.get("source_independent_structural_detection")
    if (
        not isinstance(detection, Mapping)
        or set(detection) != {"stage", "core"}
        or not isinstance(detection.get("stage"), str)
        or not isinstance(detection.get("core"), Mapping)
    ):
        raise Exact12V14OrderedCoverageError(
            "source-independent structural detection is malformed"
        )
    if (
        "preferred_common_five_core" in binding
        or "preferred_common_five_cores" in binding
    ):
        raise Exact12V14OrderedCoverageError(
            "source-independent binding also selects common-five cores"
        )
    certificate = certificates._certificate_for_detection(
        rows, N, copy.deepcopy(dict(detection))
    )
    if certificates._validate_certificate(certificate, n=N) is not True:
        raise Exact12V14OrderedCoverageError(
            "source-independent structural certificate failed equality replay"
        )
    proof_sha256 = certificate.get("proof_sha256")
    nogood_sha256 = certificate.get("nogood_sha256")
    if proof_sha256 != binding.get(
        "source_independent_structural_proof_sha256"
    ):
        raise Exact12V14OrderedCoverageError(
            "source-independent structural proof hash drifted"
        )
    if nogood_sha256 != binding.get(
        "source_independent_structural_nogood_sha256"
    ):
        raise Exact12V14OrderedCoverageError(
            "source-independent structural nogood hash drifted"
        )
    coverage_declaration = binding.get("coverage_declaration")
    if not isinstance(coverage_declaration, str) or not coverage_declaration:
        raise Exact12V14OrderedCoverageError(
            "source-independent structural Lean theorem is malformed"
        )
    key = _closure_memberships(certificate)
    coverage = [
        {
            "order_id": f"source-order-{index:02d}",
            "source_orientation": source_orientation,
            "order": list(order),
            "rule": "source-independent-structural-core",
            "lean_theorem": coverage_declaration,
            "detection": copy.deepcopy(dict(detection)),
            "closure_proof_sha256": proof_sha256,
            "structural_nogood_sha256": nogood_sha256,
        }
        for index, (source_orientation, order) in enumerate(SOURCE_ORDERS)
    ]
    return {
        "schema": SCHEMA,
        "scope": (
            "one exact-12 selected row pattern; one source-independent "
            "positive-incidence structural core replayed for all 48 "
            "source-entitled boundary orders; finite nogood, not universal closure"
        ),
        "source_order_theorem": SOURCE_ORDER_THEOREM,
        "lean_consumer": LEAN_CONSUMER,
        "required_source_hypotheses": list(REQUIRED_SOURCE_HYPOTHESES),
        "order_universe_sha256": ORDER_UNIVERSE_SHA256,
        "order_universe": ORDER_UNIVERSE,
        "cube": dict(cube),
        "closure_certificates": [certificate],
        "coverage": coverage,
        "selected_memberships": [
            {"center": center, "required": list(points)} for center, points in key
        ],
        "selected_rows": [
            {"center": center, "support": list(cube[str(center)]), "exact": False}
            for center, _points in key
        ],
        "generated_lean_nogood": copy.deepcopy(dict(binding)),
    }


def _build_body(cube: Mapping[str, Sequence[int]]) -> dict[str, Any] | None:
    rows = _metric_rows(cube)
    rows_by_center = {row.center: row for row in rows}
    cores = _common_five_point_cores(rows)
    proof_backed = _proof_backed_binding(cube)
    if proof_backed is not None:
        binding, _choices = proof_backed
        if "source_independent_structural_detection" in binding:
            return _build_source_independent_structural_body(cube, rows, binding)
        preferred = binding.get("preferred_common_five_core")
        preferred_many = binding.get("preferred_common_five_cores")
        if preferred is not None and preferred_many is not None:
            raise Exact12V14OrderedCoverageError(
                "generated binding has singular and plural preferred cores"
            )
        if preferred is not None or preferred_many is not None:
            raw_preferred = [preferred] if preferred is not None else preferred_many
            if not isinstance(raw_preferred, list) or not raw_preferred:
                raise Exact12V14OrderedCoverageError(
                    "preferred common-five cores are malformed"
                )
            core_keys = ("a", "x", "b", "c", "y")
            preferred_cores: list[dict[str, int]] = []
            for raw_core in raw_preferred:
                if (
                    not isinstance(raw_core, dict)
                    or set(raw_core) != set(core_keys)
                    or any(type(raw_core[key]) is not int for key in core_keys)
                ):
                    raise Exact12V14OrderedCoverageError(
                        "preferred common-five core is malformed"
                    )
                preferred_core = {key: raw_core[key] for key in core_keys}
                if preferred_core not in cores:
                    raise Exact12V14OrderedCoverageError(
                        "preferred common-five core does not replay"
                    )
                if preferred_core in preferred_cores:
                    raise Exact12V14OrderedCoverageError(
                        "preferred common-five core is duplicated"
                    )
                preferred_cores.append(preferred_core)
            cores = tuple(preferred_cores) + tuple(
                core for core in cores if core not in preferred_cores
            )
    closures: dict[str, dict[str, Any]] = {}
    membership_keys: list[MembershipKey] = []
    coverage: list[dict[str, Any]] = []

    for index, (source_orientation, order) in enumerate(SOURCE_ORDERS):
        prefix = {
            "order_id": f"source-order-{index:02d}",
            "source_orientation": source_orientation,
            "order": list(order),
        }
        common = next(
            (
                (core, orientation)
                for core in cores
                if (orientation := _common_five_orientation(order, core)) is not None
            ),
            None,
        )
        if common is not None:
            core, orientation = common
            stage = (
                "equality-convex-five-point"
                if orientation == "forward"
                else "equality-convex-five-point-reverse"
            )
            detection = {"stage": stage, "core": dict(core)}
            certificate = certificates._certificate_for_detection(rows, N, detection)
            if certificates._validate_certificate(certificate, n=N) is not True:
                raise Exact12V14OrderedCoverageError(
                    "common-five certificate failed equality replay"
                )
            proof_sha256 = certificate.get("proof_sha256")
            if not isinstance(proof_sha256, str):
                raise Exact12V14OrderedCoverageError(
                    "common-five certificate has no proof hash"
                )
            previous = closures.get(proof_sha256)
            if previous is not None and previous != certificate:
                raise Exact12V14OrderedCoverageError("closure proof-hash collision")
            closures[proof_sha256] = certificate
            key = _closure_memberships(certificate)
            membership_keys.append(key)
            coverage.append(
                {
                    **prefix,
                    "rule": "convex-five-point-common-orientation",
                    "lean_theorem": COMMON_FIVE_THEOREM,
                    "orientation": orientation,
                    "core": dict(core),
                    "closure_proof_sha256": proof_sha256,
                }
            )
            continue

        strict = _strict_kalmanson(rows_by_center, order)
        if strict is not None:
            detection, key = strict
            membership_keys.append(key)
            coverage.append(
                {**prefix, "rule": "selected-rows-kalmanson", "detection": detection}
            )
            continue

        shared = _shared_late_pair(rows_by_center, order)
        if shared is None:
            return None
        detection, key = shared
        membership_keys.append(key)
        coverage.append(
            {**prefix, "rule": "two-rows-shared-late-pair", "detection": detection}
        )

    merged = _merge_memberships(membership_keys)
    selected_rows = [
        {"center": center, "support": list(cube[str(center)]), "exact": False}
        for center, _points in merged
    ]
    body = {
        "schema": SCHEMA,
        "scope": (
            "one exact-12 selected row pattern; all 48 source-entitled boundary "
            "orders; positive incidence only; finite nogood, not universal closure"
        ),
        "source_order_theorem": SOURCE_ORDER_THEOREM,
        "lean_consumer": LEAN_CONSUMER,
        "required_source_hypotheses": list(REQUIRED_SOURCE_HYPOTHESES),
        "order_universe_sha256": ORDER_UNIVERSE_SHA256,
        "order_universe": ORDER_UNIVERSE,
        "cube": dict(cube),
        "closure_certificates": [closures[key] for key in sorted(closures)],
        "coverage": coverage,
        "selected_memberships": [
            {"center": center, "required": list(points)} for center, points in merged
        ],
        "selected_rows": selected_rows,
    }
    if proof_backed is not None:
        binding, _choices = proof_backed
        body["generated_lean_nogood"] = copy.deepcopy(binding)
    return body


def detect_ordered_coverage(
    cube: Mapping[int | str, Collection[int]],
) -> dict[str, Any] | None:
    """Return a certificate only when all 48 source orders are covered."""

    payload = _cube_payload(cube)
    body = _build_body(payload)
    if body is None:
        return None
    return {**body, "certificate_sha256": _sha256_json(body)}


def detect_proof_backed_ordered_coverage(
    cube: Mapping[int | str, Collection[int]],
) -> dict[str, Any] | None:
    """Return producer metadata only for an exact generated Lean nogood.

    Runtime source authentication belongs to ``exact12_v14_source_order_bank``.
    """

    certificate = detect_ordered_coverage(cube)
    if certificate is None or "generated_lean_nogood" not in certificate:
        return None
    return certificate


def replay_ordered_coverage(certificate: Mapping[str, Any]) -> MembershipKey:
    """Regenerate and compare every order, detector result, and equality proof."""

    if not isinstance(certificate, Mapping):
        raise Exact12V14OrderedCoverageError("certificate is not a mapping")
    cube = certificate.get("cube")
    if not isinstance(cube, Mapping):
        raise Exact12V14OrderedCoverageError("certificate cube is malformed")
    expected = detect_ordered_coverage(cube)
    if expected is None:
        raise Exact12V14OrderedCoverageError("certificate cube lacks 48-order coverage")
    if dict(certificate) != expected:
        raise Exact12V14OrderedCoverageError("ordered coverage failed exact replay")
    selected = expected["selected_memberships"]
    return tuple(
        (int(row["center"]), tuple(int(point) for point in row["required"]))
        for row in selected
    )


def learned_clause_for_ordered_coverage(
    instance: CoverInstance, certificate: Mapping[str, Any]
) -> tuple[int, ...]:
    """Compile a replayed positive-row nogood to selected-row choice literals."""

    key = replay_ordered_coverage(certificate)
    if instance.model.cardinality != N:
        raise Exact12V14OrderedCoverageError("ordered coverage requires cardinality 12")
    rows = certificate["cube"]
    literals: list[int] = []
    for center, _required in key:
        support = tuple(int(point) for point in rows[str(center)])
        try:
            candidate_index = instance.candidate_index(center, support)
            variable = instance.choice_variables[(center, candidate_index)]
        except (KeyError, ValueError) as exc:
            raise Exact12V14OrderedCoverageError(
                f"selected row {center} is outside the bound model"
            ) from exc
        literals.append(-variable)
    clause = tuple(literals)
    if not clause or len(clause) != len(set(clause)):
        raise Exact12V14OrderedCoverageError("ordered learned clause is malformed")
    return clause


def learned_clause_for_proof_backed_ordered_coverage(
    instance: CoverInstance, certificate: Mapping[str, Any]
) -> tuple[int, ...]:
    """Compile a clause only after exact replay of a generated Lean binding."""

    clause = learned_clause_for_ordered_coverage(instance, certificate)
    cube = certificate.get("cube")
    if not isinstance(cube, Mapping):
        raise Exact12V14OrderedCoverageError("ordered coverage cube is malformed")
    proof_backed = _proof_backed_binding(cube)
    if proof_backed is None:
        raise Exact12V14OrderedCoverageError(
            "ordered coverage has no generated Lean nogood binding"
        )
    binding, choices = proof_backed
    if certificate.get("generated_lean_nogood") != binding:
        raise Exact12V14OrderedCoverageError(
            "ordered coverage generated Lean nogood binding drifted"
        )
    expected_rows = [
        {"center": row["center"], "support": row["support"], "exact": False}
        for row in choices
    ]
    if certificate.get("selected_rows") != expected_rows:
        raise Exact12V14OrderedCoverageError(
            "ordered coverage rows differ from generated Lean choices"
        )
    if len(clause) != len(choices):
        raise Exact12V14OrderedCoverageError(
            "ordered learned clause differs from generated Lean choices"
        )
    return clause
