from __future__ import annotations

import copy
import hashlib
import unittest
from pathlib import Path

from census.card_head.exact12_v14_bound_jobs import materialize_cell
from census.card_head.exact12_v14_ordered_coverage import (
    FROZEN_V8_CUBE,
    FROZEN_V8_CUBE_SHA256,
    FROZEN_V8_LEAN_BINDING,
    FROZEN_V8_LEAN_CHOICES,
    FROZEN_V8_LEAN_CONSUMER_SOURCE,
    FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
    FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
    FROZEN_V8_LEAN_COVERAGE_SOURCE,
    FROZEN_V8_LEAN_COVERAGE_SOURCE_BYTES,
    FROZEN_V8_LEAN_COVERAGE_SOURCE_SHA256,
    FROZEN_V8_LEAN_SOURCE,
    FROZEN_V8_LEAN_SOURCE_BYTES,
    FROZEN_V8_LEAN_SOURCE_SHA256,
    LEAN_CONSUMER,
    LEAN_TERMINAL_CONSUMER,
    MIXED_V3_CELL2_CUBE,
    MIXED_V3_CELL2_LEAN_BINDING,
    MIXED_V3_CELL2_LEAN_CHOICES,
    MIXED_V3_CELL2_LEAN_SOURCE,
    MIXED_V3_CELL2_LEAN_SOURCE_BYTES,
    MIXED_V3_CELL2_LEAN_SOURCE_SHA256,
    MIXED_V3_CELL4_CUBE,
    MIXED_V3_CELL4_LEAN_BINDING,
    MIXED_V3_CELL4_LEAN_CHOICES,
    MIXED_V3_CELL4_LEAN_SOURCE,
    MIXED_V3_CELL4_LEAN_SOURCE_BYTES,
    MIXED_V3_CELL4_LEAN_SOURCE_SHA256,
    MIXED_V3_CELL5_CUBE,
    MIXED_V3_CELL5_LEAN_BINDING,
    MIXED_V3_CELL5_LEAN_CHOICES,
    MIXED_V3_CELL5_LEAN_SOURCE,
    MIXED_V3_CELL5_LEAN_SOURCE_BYTES,
    MIXED_V3_CELL5_LEAN_SOURCE_SHA256,
    MIXED_V3_CELL7_CUBE,
    MIXED_V3_CELL7_LEAN_BINDING,
    MIXED_V3_CELL7_LEAN_CHOICES,
    MIXED_V3_CELL7_LEAN_SOURCE,
    MIXED_V3_CELL7_LEAN_SOURCE_BYTES,
    MIXED_V3_CELL7_LEAN_SOURCE_SHA256,
    MIXED_V3_CELL8_CUBE,
    MIXED_V3_CELL8_LEAN_BINDING,
    MIXED_V3_CELL8_LEAN_CHOICES,
    MIXED_V3_CELL8_LEAN_SOURCE,
    MIXED_V3_CELL8_LEAN_SOURCE_BYTES,
    MIXED_V3_CELL8_LEAN_SOURCE_SHA256,
    MIXED_V4_CELL1_CUBE,
    MIXED_V4_CELL1_FOURTH_CUBE,
    MIXED_V4_CELL1_FOURTH_LEAN_BINDING,
    MIXED_V4_CELL1_FOURTH_LEAN_CHOICES,
    MIXED_V4_CELL1_FOURTH_LEAN_SOURCE,
    MIXED_V4_CELL1_FOURTH_LEAN_SOURCE_BYTES,
    MIXED_V4_CELL1_FOURTH_LEAN_SOURCE_SHA256,
    MIXED_V4_CELL1_LEAN_BINDING,
    MIXED_V4_CELL1_LEAN_CHOICES,
    MIXED_V4_CELL1_LEAN_SOURCE,
    MIXED_V4_CELL1_LEAN_SOURCE_BYTES,
    MIXED_V4_CELL1_LEAN_SOURCE_SHA256,
    MIXED_V4_CELL1_THIRD_CUBE,
    MIXED_V4_CELL1_THIRD_LEAN_BINDING,
    MIXED_V4_CELL1_THIRD_LEAN_CHOICES,
    MIXED_V4_CELL1_THIRD_LEAN_SOURCE,
    MIXED_V4_CELL1_THIRD_LEAN_SOURCE_BYTES,
    MIXED_V4_CELL1_THIRD_LEAN_SOURCE_SHA256,
    MIXED_V4_CELL2_CUBE,
    MIXED_V4_CELL2_LEAN_BINDING,
    MIXED_V4_CELL2_LEAN_CHOICES,
    MIXED_V4_CELL2_LEAN_SOURCE,
    MIXED_V4_CELL2_LEAN_SOURCE_BYTES,
    MIXED_V4_CELL2_LEAN_SOURCE_SHA256,
    MIXED_V4_CELL2_SECOND_CUBE,
    MIXED_V4_CELL2_SECOND_LEAN_BINDING,
    MIXED_V4_CELL2_SECOND_LEAN_CHOICES,
    MIXED_V4_CELL2_SECOND_LEAN_SOURCE,
    MIXED_V4_CELL2_SECOND_LEAN_SOURCE_BYTES,
    MIXED_V4_CELL2_SECOND_LEAN_SOURCE_SHA256,
    MIXED_V4_CELL4_CUBE,
    MIXED_V4_CELL4_LEAN_BINDING,
    MIXED_V4_CELL4_LEAN_CHOICES,
    MIXED_V4_CELL4_LEAN_SOURCE,
    MIXED_V4_CELL4_LEAN_SOURCE_BYTES,
    MIXED_V4_CELL4_LEAN_SOURCE_SHA256,
    MIXED_V4_CELL5_CUBE,
    MIXED_V4_CELL5_LEAN_BINDING,
    MIXED_V4_CELL5_LEAN_CHOICES,
    MIXED_V4_CELL5_LEAN_SOURCE,
    MIXED_V4_CELL5_LEAN_SOURCE_BYTES,
    MIXED_V4_CELL5_LEAN_SOURCE_SHA256,
    MIXED_V4_CELL8_CUBE,
    MIXED_V4_CELL8_LEAN_BINDING,
    MIXED_V4_CELL8_LEAN_CHOICES,
    MIXED_V4_CELL8_LEAN_SOURCE,
    MIXED_V4_CELL8_LEAN_SOURCE_BYTES,
    MIXED_V4_CELL8_LEAN_SOURCE_SHA256,
    MIXED_V4_CELL10_CUBE,
    MIXED_V4_CELL10_LEAN_BINDING,
    MIXED_V4_CELL10_LEAN_CHOICES,
    MIXED_V4_CELL10_LEAN_SOURCE,
    MIXED_V4_CELL10_LEAN_SOURCE_BYTES,
    MIXED_V4_CELL10_LEAN_SOURCE_SHA256,
    MIXED_V4_CELL10_SECOND_CUBE,
    MIXED_V4_CELL10_SECOND_LEAN_BINDING,
    MIXED_V4_CELL10_SECOND_LEAN_CHOICES,
    MIXED_V4_CELL10_SECOND_LEAN_SOURCE,
    MIXED_V4_CELL10_SECOND_LEAN_SOURCE_BYTES,
    MIXED_V4_CELL10_SECOND_LEAN_SOURCE_SHA256,
    MIXED_V4_CELL11_CUBE,
    MIXED_V4_CELL11_LEAN_BINDING,
    MIXED_V4_CELL11_LEAN_CHOICES,
    MIXED_V4_CELL11_LEAN_SOURCE,
    MIXED_V4_CELL11_LEAN_SOURCE_BYTES,
    MIXED_V4_CELL11_LEAN_SOURCE_SHA256,
    MIXED_V5_CELL0_CUBE,
    MIXED_V5_CELL0_LEAN_BINDING,
    MIXED_V5_CELL0_LEAN_CHOICES,
    MIXED_V5_CELL0_LEAN_SOURCE,
    MIXED_V5_CELL0_LEAN_SOURCE_BYTES,
    MIXED_V5_CELL0_LEAN_SOURCE_SHA256,
    MIXED_V5_CELL3_CUBE,
    MIXED_V5_CELL3_LEAN_BINDING,
    MIXED_V5_CELL3_LEAN_CHOICES,
    MIXED_V5_CELL3_LEAN_SOURCE,
    MIXED_V5_CELL3_LEAN_SOURCE_BYTES,
    MIXED_V5_CELL3_LEAN_SOURCE_SHA256,
    MIXED_V5_CELL4_CUBE,
    MIXED_V5_CELL4_LEAN_BINDING,
    MIXED_V5_CELL4_LEAN_CHOICES,
    MIXED_V5_CELL4_LEAN_SOURCE,
    MIXED_V5_CELL4_LEAN_SOURCE_BYTES,
    MIXED_V5_CELL4_LEAN_SOURCE_SHA256,
    MIXED_V5_CELL9_CUBE,
    MIXED_V5_CELL9_LEAN_BINDING,
    MIXED_V5_CELL9_LEAN_CHOICES,
    MIXED_V5_CELL9_LEAN_SOURCE,
    MIXED_V5_CELL9_LEAN_SOURCE_BYTES,
    MIXED_V5_CELL9_LEAN_SOURCE_SHA256,
    MIXED_V5_CELL11_CUBE,
    MIXED_V5_CELL11_LEAN_BINDING,
    MIXED_V5_CELL11_LEAN_CHOICES,
    MIXED_V5_CELL11_LEAN_SOURCE,
    MIXED_V5_CELL11_LEAN_SOURCE_BYTES,
    MIXED_V5_CELL11_LEAN_SOURCE_SHA256,
    MIXED_V6_CELL0_CUBE,
    MIXED_V6_CELL0_LEAN_BINDING,
    MIXED_V6_CELL0_LEAN_CHOICES,
    MIXED_V6_CELL0_LEAN_SOURCE,
    MIXED_V6_CELL0_LEAN_SOURCE_BYTES,
    MIXED_V6_CELL0_LEAN_SOURCE_SHA256,
    MIXED_V6_CELL2_CUBE,
    MIXED_V6_CELL2_LEAN_BINDING,
    MIXED_V6_CELL2_LEAN_CHOICES,
    MIXED_V6_CELL2_LEAN_SOURCE,
    MIXED_V6_CELL2_LEAN_SOURCE_BYTES,
    MIXED_V6_CELL2_LEAN_SOURCE_SHA256,
    MIXED_V6_CELL6_CUBE,
    MIXED_V6_CELL6_LEAN_BINDING,
    MIXED_V6_CELL6_LEAN_CHOICES,
    MIXED_V6_CELL6_LEAN_SOURCE,
    MIXED_V6_CELL6_LEAN_SOURCE_BYTES,
    MIXED_V6_CELL6_LEAN_SOURCE_SHA256,
    MIXED_V6_CELL6_SECOND_CUBE,
    MIXED_V6_CELL6_SECOND_LEAN_BINDING,
    MIXED_V6_CELL6_SECOND_LEAN_CHOICES,
    MIXED_V6_CELL6_SECOND_LEAN_SOURCE,
    MIXED_V6_CELL6_SECOND_LEAN_SOURCE_BYTES,
    MIXED_V6_CELL6_SECOND_LEAN_SOURCE_SHA256,
    MIXED_V6_CELL8_CUBE,
    MIXED_V6_CELL8_LEAN_BINDING,
    MIXED_V6_CELL8_LEAN_CHOICES,
    MIXED_V6_CELL8_LEAN_SOURCE,
    MIXED_V6_CELL8_LEAN_SOURCE_BYTES,
    MIXED_V6_CELL8_LEAN_SOURCE_SHA256,
    MIXED_V6_CELL9_CUBE,
    MIXED_V6_CELL9_LEAN_BINDING,
    MIXED_V6_CELL9_LEAN_CHOICES,
    MIXED_V6_CELL9_LEAN_SOURCE,
    MIXED_V6_CELL9_LEAN_SOURCE_BYTES,
    MIXED_V6_CELL9_LEAN_SOURCE_SHA256,
    MIXED_V6_CELL9_SECOND_CUBE,
    MIXED_V6_CELL9_SECOND_LEAN_BINDING,
    MIXED_V6_CELL9_SECOND_LEAN_CHOICES,
    MIXED_V6_CELL9_SECOND_LEAN_SOURCE,
    MIXED_V6_CELL9_SECOND_LEAN_SOURCE_BYTES,
    MIXED_V6_CELL9_SECOND_LEAN_SOURCE_SHA256,
    MIXED_V6_CELL10_CUBE,
    MIXED_V6_CELL10_LEAN_BINDING,
    MIXED_V6_CELL10_LEAN_CHOICES,
    MIXED_V6_CELL10_LEAN_SOURCE,
    MIXED_V6_CELL10_LEAN_SOURCE_BYTES,
    MIXED_V6_CELL10_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_CUBE,
    MIXED_V7_CELL8_EIGHTEENTH_CUBE,
    MIXED_V7_CELL8_EIGHTEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_EIGHTEENTH_LEAN_CHOICES,
    MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE,
    MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_EIGHTH_CUBE,
    MIXED_V7_CELL8_EIGHTH_LEAN_BINDING,
    MIXED_V7_CELL8_EIGHTH_LEAN_CHOICES,
    MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE,
    MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_ELEVENTH_CUBE,
    MIXED_V7_CELL8_ELEVENTH_LEAN_BINDING,
    MIXED_V7_CELL8_ELEVENTH_LEAN_CHOICES,
    MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE,
    MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_FIFTEENTH_CUBE,
    MIXED_V7_CELL8_FIFTEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_FIFTEENTH_LEAN_CHOICES,
    MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE,
    MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_FIFTH_CUBE,
    MIXED_V7_CELL8_FIFTH_LEAN_BINDING,
    MIXED_V7_CELL8_FIFTH_LEAN_CHOICES,
    MIXED_V7_CELL8_FIFTH_LEAN_SOURCE,
    MIXED_V7_CELL8_FIFTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_FIFTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_FOURTEENTH_CUBE,
    MIXED_V7_CELL8_FOURTEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_FOURTEENTH_LEAN_CHOICES,
    MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE,
    MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_FOURTH_CUBE,
    MIXED_V7_CELL8_FOURTH_LEAN_BINDING,
    MIXED_V7_CELL8_FOURTH_LEAN_CHOICES,
    MIXED_V7_CELL8_FOURTH_LEAN_SOURCE,
    MIXED_V7_CELL8_FOURTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_FOURTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_LEAN_BINDING,
    MIXED_V7_CELL8_LEAN_CHOICES,
    MIXED_V7_CELL8_LEAN_SOURCE,
    MIXED_V7_CELL8_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_NINETEENTH_CUBE,
    MIXED_V7_CELL8_NINETEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_NINETEENTH_LEAN_CHOICES,
    MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE,
    MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_NINTH_CUBE,
    MIXED_V7_CELL8_NINTH_LEAN_BINDING,
    MIXED_V7_CELL8_NINTH_LEAN_CHOICES,
    MIXED_V7_CELL8_NINTH_LEAN_SOURCE,
    MIXED_V7_CELL8_NINTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_NINTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_SECOND_CUBE,
    MIXED_V7_CELL8_SECOND_LEAN_BINDING,
    MIXED_V7_CELL8_SECOND_LEAN_CHOICES,
    MIXED_V7_CELL8_SECOND_LEAN_SOURCE,
    MIXED_V7_CELL8_SECOND_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_SECOND_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_SEVENTEENTH_CUBE,
    MIXED_V7_CELL8_SEVENTEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_SEVENTEENTH_LEAN_CHOICES,
    MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE,
    MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_SEVENTH_CUBE,
    MIXED_V7_CELL8_SEVENTH_LEAN_BINDING,
    MIXED_V7_CELL8_SEVENTH_LEAN_CHOICES,
    MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE,
    MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_SIXTEENTH_CUBE,
    MIXED_V7_CELL8_SIXTEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_SIXTEENTH_LEAN_CHOICES,
    MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE,
    MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_SIXTH_CUBE,
    MIXED_V7_CELL8_SIXTH_LEAN_BINDING,
    MIXED_V7_CELL8_SIXTH_LEAN_CHOICES,
    MIXED_V7_CELL8_SIXTH_LEAN_SOURCE,
    MIXED_V7_CELL8_SIXTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_SIXTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_TENTH_CUBE,
    MIXED_V7_CELL8_TENTH_LEAN_BINDING,
    MIXED_V7_CELL8_TENTH_LEAN_CHOICES,
    MIXED_V7_CELL8_TENTH_LEAN_SOURCE,
    MIXED_V7_CELL8_TENTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_TENTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_THIRD_CUBE,
    MIXED_V7_CELL8_THIRD_LEAN_BINDING,
    MIXED_V7_CELL8_THIRD_LEAN_CHOICES,
    MIXED_V7_CELL8_THIRD_LEAN_SOURCE,
    MIXED_V7_CELL8_THIRD_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_THIRD_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_THIRTEENTH_CUBE,
    MIXED_V7_CELL8_THIRTEENTH_LEAN_BINDING,
    MIXED_V7_CELL8_THIRTEENTH_LEAN_CHOICES,
    MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE,
    MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_TWELFTH_CUBE,
    MIXED_V7_CELL8_TWELFTH_LEAN_BINDING,
    MIXED_V7_CELL8_TWELFTH_LEAN_CHOICES,
    MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE,
    MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE_SHA256,
    MIXED_V7_CELL8_TWENTIETH_CUBE,
    MIXED_V7_CELL8_TWENTIETH_LEAN_BINDING,
    MIXED_V7_CELL8_TWENTIETH_LEAN_CHOICES,
    MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE,
    MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE_BYTES,
    MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE_SHA256,
    ORDER_UNIVERSE_SHA256,
    REQUIRED_SOURCE_HYPOTHESES,
    SOURCE_ORDERS,
    Exact12V14OrderedCoverageError,
    detect_ordered_coverage,
    detect_proof_backed_ordered_coverage,
    learned_clause_for_proof_backed_ordered_coverage,
    replay_ordered_coverage,
)

FROZEN_CUBE = {int(center): support for center, support in FROZEN_V8_CUBE.items()}
MIXED_CASES = (
    (
        2,
        MIXED_V3_CELL2_CUBE,
        MIXED_V3_CELL2_LEAN_BINDING,
        MIXED_V3_CELL2_LEAN_CHOICES,
        MIXED_V3_CELL2_LEAN_SOURCE,
        MIXED_V3_CELL2_LEAN_SOURCE_BYTES,
        MIXED_V3_CELL2_LEAN_SOURCE_SHA256,
        (-55, -410, -498),
    ),
    (
        4,
        MIXED_V3_CELL4_CUBE,
        MIXED_V3_CELL4_LEAN_BINDING,
        MIXED_V3_CELL4_LEAN_CHOICES,
        MIXED_V3_CELL4_LEAN_SOURCE,
        MIXED_V3_CELL4_LEAN_SOURCE_BYTES,
        MIXED_V3_CELL4_LEAN_SOURCE_SHA256,
        (-896, -1170, -2053, -2162),
    ),
    (
        5,
        MIXED_V3_CELL5_CUBE,
        MIXED_V3_CELL5_LEAN_BINDING,
        MIXED_V3_CELL5_LEAN_CHOICES,
        MIXED_V3_CELL5_LEAN_SOURCE,
        MIXED_V3_CELL5_LEAN_SOURCE_BYTES,
        MIXED_V3_CELL5_LEAN_SOURCE_SHA256,
        (-35, -172, -1363, -1620, -2493),
    ),
    (
        7,
        MIXED_V3_CELL7_CUBE,
        MIXED_V3_CELL7_LEAN_BINDING,
        MIXED_V3_CELL7_LEAN_CHOICES,
        MIXED_V3_CELL7_LEAN_SOURCE,
        MIXED_V3_CELL7_LEAN_SOURCE_BYTES,
        MIXED_V3_CELL7_LEAN_SOURCE_SHA256,
        (-29, -55, -546, -939, -2894),
    ),
    (
        8,
        MIXED_V3_CELL8_CUBE,
        MIXED_V3_CELL8_LEAN_BINDING,
        MIXED_V3_CELL8_LEAN_CHOICES,
        MIXED_V3_CELL8_LEAN_SOURCE,
        MIXED_V3_CELL8_LEAN_SOURCE_BYTES,
        MIXED_V3_CELL8_LEAN_SOURCE_SHA256,
        (-55, -313, -2134),
    ),
    (
        "v4-cell-4",
        MIXED_V4_CELL4_CUBE,
        MIXED_V4_CELL4_LEAN_BINDING,
        MIXED_V4_CELL4_LEAN_CHOICES,
        MIXED_V4_CELL4_LEAN_SOURCE,
        MIXED_V4_CELL4_LEAN_SOURCE_BYTES,
        MIXED_V4_CELL4_LEAN_SOURCE_SHA256,
        (-55, -387, -703, -1605, -1935),
    ),
    (
        "v4-cell-1",
        MIXED_V4_CELL1_CUBE,
        MIXED_V4_CELL1_LEAN_BINDING,
        MIXED_V4_CELL1_LEAN_CHOICES,
        MIXED_V4_CELL1_LEAN_SOURCE,
        MIXED_V4_CELL1_LEAN_SOURCE_BYTES,
        MIXED_V4_CELL1_LEAN_SOURCE_SHA256,
        (-43, -164, -1171),
    ),
    (
        "v4-cell-1-third",
        MIXED_V4_CELL1_THIRD_CUBE,
        MIXED_V4_CELL1_THIRD_LEAN_BINDING,
        MIXED_V4_CELL1_THIRD_LEAN_CHOICES,
        MIXED_V4_CELL1_THIRD_LEAN_SOURCE,
        MIXED_V4_CELL1_THIRD_LEAN_SOURCE_BYTES,
        MIXED_V4_CELL1_THIRD_LEAN_SOURCE_SHA256,
        (-160, -1383, -2548),
    ),
    (
        "v4-cell-1-fourth",
        MIXED_V4_CELL1_FOURTH_CUBE,
        MIXED_V4_CELL1_FOURTH_LEAN_BINDING,
        MIXED_V4_CELL1_FOURTH_LEAN_CHOICES,
        MIXED_V4_CELL1_FOURTH_LEAN_SOURCE,
        MIXED_V4_CELL1_FOURTH_LEAN_SOURCE_BYTES,
        MIXED_V4_CELL1_FOURTH_LEAN_SOURCE_SHA256,
        (-22, -168, -1177),
    ),
    (
        "v4-cell-10",
        MIXED_V4_CELL10_CUBE,
        MIXED_V4_CELL10_LEAN_BINDING,
        MIXED_V4_CELL10_LEAN_CHOICES,
        MIXED_V4_CELL10_LEAN_SOURCE,
        MIXED_V4_CELL10_LEAN_SOURCE_BYTES,
        MIXED_V4_CELL10_LEAN_SOURCE_SHA256,
        (-264, -704, -898, -1437, -2034, -2134),
    ),
    (
        "v4-cell-10-second",
        MIXED_V4_CELL10_SECOND_CUBE,
        MIXED_V4_CELL10_SECOND_LEAN_BINDING,
        MIXED_V4_CELL10_SECOND_LEAN_CHOICES,
        MIXED_V4_CELL10_SECOND_LEAN_SOURCE,
        MIXED_V4_CELL10_SECOND_LEAN_SOURCE_BYTES,
        MIXED_V4_CELL10_SECOND_LEAN_SOURCE_SHA256,
        (-26, -834, -1200, -2034, -2310),
    ),
    (
        "v4-cell-2",
        MIXED_V4_CELL2_CUBE,
        MIXED_V4_CELL2_LEAN_BINDING,
        MIXED_V4_CELL2_LEAN_CHOICES,
        MIXED_V4_CELL2_LEAN_SOURCE,
        MIXED_V4_CELL2_LEAN_SOURCE_BYTES,
        MIXED_V4_CELL2_LEAN_SOURCE_SHA256,
        (-1156, -1640, -2537),
    ),
    (
        "v4-cell-2-second",
        MIXED_V4_CELL2_SECOND_CUBE,
        MIXED_V4_CELL2_SECOND_LEAN_BINDING,
        MIXED_V4_CELL2_SECOND_LEAN_CHOICES,
        MIXED_V4_CELL2_SECOND_LEAN_SOURCE,
        MIXED_V4_CELL2_SECOND_LEAN_SOURCE_BYTES,
        MIXED_V4_CELL2_SECOND_LEAN_SOURCE_SHA256,
        (-55, -704, -991),
    ),
    (
        "v4-cell-5",
        MIXED_V4_CELL5_CUBE,
        MIXED_V4_CELL5_LEAN_BINDING,
        MIXED_V4_CELL5_LEAN_CHOICES,
        MIXED_V4_CELL5_LEAN_SOURCE,
        MIXED_V4_CELL5_LEAN_SOURCE_BYTES,
        MIXED_V4_CELL5_LEAN_SOURCE_SHA256,
        (-10, -846, -2550),
    ),
    (
        "v4-cell-8",
        MIXED_V4_CELL8_CUBE,
        MIXED_V4_CELL8_LEAN_BINDING,
        MIXED_V4_CELL8_LEAN_CHOICES,
        MIXED_V4_CELL8_LEAN_SOURCE,
        MIXED_V4_CELL8_LEAN_SOURCE_BYTES,
        MIXED_V4_CELL8_LEAN_SOURCE_SHA256,
        (-40, -160, -230),
    ),
    (
        "v4-cell-11",
        MIXED_V4_CELL11_CUBE,
        MIXED_V4_CELL11_LEAN_BINDING,
        MIXED_V4_CELL11_LEAN_CHOICES,
        MIXED_V4_CELL11_LEAN_SOURCE,
        MIXED_V4_CELL11_LEAN_SOURCE_BYTES,
        MIXED_V4_CELL11_LEAN_SOURCE_SHA256,
        (-1620, -2096, -3017),
    ),
    (
        "v5-cell-4",
        MIXED_V5_CELL4_CUBE,
        MIXED_V5_CELL4_LEAN_BINDING,
        MIXED_V5_CELL4_LEAN_CHOICES,
        MIXED_V5_CELL4_LEAN_SOURCE,
        MIXED_V5_CELL4_LEAN_SOURCE_BYTES,
        MIXED_V5_CELL4_LEAN_SOURCE_SHA256,
        (-29, -55, -165, -1342, -2138),
    ),
    (
        "v5-cell-9",
        MIXED_V5_CELL9_CUBE,
        MIXED_V5_CELL9_LEAN_BINDING,
        MIXED_V5_CELL9_LEAN_CHOICES,
        MIXED_V5_CELL9_LEAN_SOURCE,
        MIXED_V5_CELL9_LEAN_SOURCE_BYTES,
        MIXED_V5_CELL9_LEAN_SOURCE_SHA256,
        (-55, -370, -1170, -2207, -2560),
    ),
    (
        "v5-cell-0",
        MIXED_V5_CELL0_CUBE,
        MIXED_V5_CELL0_LEAN_BINDING,
        MIXED_V5_CELL0_LEAN_CHOICES,
        MIXED_V5_CELL0_LEAN_SOURCE,
        MIXED_V5_CELL0_LEAN_SOURCE_BYTES,
        MIXED_V5_CELL0_LEAN_SOURCE_SHA256,
        (-396, -612, -1262, -2343, -2747),
    ),
    (
        "v5-cell-3",
        MIXED_V5_CELL3_CUBE,
        MIXED_V5_CELL3_LEAN_BINDING,
        MIXED_V5_CELL3_LEAN_CHOICES,
        MIXED_V5_CELL3_LEAN_SOURCE,
        MIXED_V5_CELL3_LEAN_SOURCE_BYTES,
        MIXED_V5_CELL3_LEAN_SOURCE_SHA256,
        (-299, -611, -2918),
    ),
    (
        "v5-cell-11",
        MIXED_V5_CELL11_CUBE,
        MIXED_V5_CELL11_LEAN_BINDING,
        MIXED_V5_CELL11_LEAN_CHOICES,
        MIXED_V5_CELL11_LEAN_SOURCE,
        MIXED_V5_CELL11_LEAN_SOURCE_BYTES,
        MIXED_V5_CELL11_LEAN_SOURCE_SHA256,
        (-55, -223, -609, -1920, -2918),
    ),
    (
        "v6-cell-9",
        MIXED_V6_CELL9_CUBE,
        MIXED_V6_CELL9_LEAN_BINDING,
        MIXED_V6_CELL9_LEAN_CHOICES,
        MIXED_V6_CELL9_LEAN_SOURCE,
        MIXED_V6_CELL9_LEAN_SOURCE_BYTES,
        MIXED_V6_CELL9_LEAN_SOURCE_SHA256,
        (-55, -552, -1152),
    ),
    (
        "v6-cell-6",
        MIXED_V6_CELL6_CUBE,
        MIXED_V6_CELL6_LEAN_BINDING,
        MIXED_V6_CELL6_LEAN_CHOICES,
        MIXED_V6_CELL6_LEAN_SOURCE,
        MIXED_V6_CELL6_LEAN_SOURCE_BYTES,
        MIXED_V6_CELL6_LEAN_SOURCE_SHA256,
        (-1208, -1630, -2065, -2761),
    ),
    (
        "v6-cell-9-second",
        MIXED_V6_CELL9_SECOND_CUBE,
        MIXED_V6_CELL9_SECOND_LEAN_BINDING,
        MIXED_V6_CELL9_SECOND_LEAN_CHOICES,
        MIXED_V6_CELL9_SECOND_LEAN_SOURCE,
        MIXED_V6_CELL9_SECOND_LEAN_SOURCE_BYTES,
        MIXED_V6_CELL9_SECOND_LEAN_SOURCE_SHA256,
        (-55, -155, -618, -2397),
    ),
    (
        "v6-cell-2",
        MIXED_V6_CELL2_CUBE,
        MIXED_V6_CELL2_LEAN_BINDING,
        MIXED_V6_CELL2_LEAN_CHOICES,
        MIXED_V6_CELL2_LEAN_SOURCE,
        MIXED_V6_CELL2_LEAN_SOURCE_BYTES,
        MIXED_V6_CELL2_LEAN_SOURCE_SHA256,
        (-177, -1156, -1605),
    ),
    (
        "v6-cell-8",
        MIXED_V6_CELL8_CUBE,
        MIXED_V6_CELL8_LEAN_BINDING,
        MIXED_V6_CELL8_LEAN_CHOICES,
        MIXED_V6_CELL8_LEAN_SOURCE,
        MIXED_V6_CELL8_LEAN_SOURCE_BYTES,
        MIXED_V6_CELL8_LEAN_SOURCE_SHA256,
        (-289, -618, -2083),
    ),
    (
        "v6-cell-0",
        MIXED_V6_CELL0_CUBE,
        MIXED_V6_CELL0_LEAN_BINDING,
        MIXED_V6_CELL0_LEAN_CHOICES,
        MIXED_V6_CELL0_LEAN_SOURCE,
        MIXED_V6_CELL0_LEAN_SOURCE_BYTES,
        MIXED_V6_CELL0_LEAN_SOURCE_SHA256,
        (-6, -2431, -2872),
    ),
    (
        "v6-cell-6-second",
        MIXED_V6_CELL6_SECOND_CUBE,
        MIXED_V6_CELL6_SECOND_LEAN_BINDING,
        MIXED_V6_CELL6_SECOND_LEAN_CHOICES,
        MIXED_V6_CELL6_SECOND_LEAN_SOURCE,
        MIXED_V6_CELL6_SECOND_LEAN_SOURCE_BYTES,
        MIXED_V6_CELL6_SECOND_LEAN_SOURCE_SHA256,
        (-55, -409, -632, -1264, -1605, -2092),
    ),
    (
        "v6-cell-10",
        MIXED_V6_CELL10_CUBE,
        MIXED_V6_CELL10_LEAN_BINDING,
        MIXED_V6_CELL10_LEAN_CHOICES,
        MIXED_V6_CELL10_LEAN_SOURCE,
        MIXED_V6_CELL10_LEAN_SOURCE_BYTES,
        MIXED_V6_CELL10_LEAN_SOURCE_SHA256,
        (-55, -852, -2848),
    ),
    (
        "v7-cell-8",
        MIXED_V7_CELL8_CUBE,
        MIXED_V7_CELL8_LEAN_BINDING,
        MIXED_V7_CELL8_LEAN_CHOICES,
        MIXED_V7_CELL8_LEAN_SOURCE,
        MIXED_V7_CELL8_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_LEAN_SOURCE_SHA256,
        (-55, -312, -2114),
    ),
    (
        "v7-cell-8-second",
        MIXED_V7_CELL8_SECOND_CUBE,
        MIXED_V7_CELL8_SECOND_LEAN_BINDING,
        MIXED_V7_CELL8_SECOND_LEAN_CHOICES,
        MIXED_V7_CELL8_SECOND_LEAN_SOURCE,
        MIXED_V7_CELL8_SECOND_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_SECOND_LEAN_SOURCE_SHA256,
        (-5, -55, -1640, -2065, -2419),
    ),
    (
        "v7-cell-8-third",
        MIXED_V7_CELL8_THIRD_CUBE,
        MIXED_V7_CELL8_THIRD_LEAN_BINDING,
        MIXED_V7_CELL8_THIRD_LEAN_CHOICES,
        MIXED_V7_CELL8_THIRD_LEAN_SOURCE,
        MIXED_V7_CELL8_THIRD_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_THIRD_LEAN_SOURCE_SHA256,
        (-972, -2371, -2419),
    ),
    (
        "v7-cell-8-fourth",
        MIXED_V7_CELL8_FOURTH_CUBE,
        MIXED_V7_CELL8_FOURTH_LEAN_BINDING,
        MIXED_V7_CELL8_FOURTH_LEAN_CHOICES,
        MIXED_V7_CELL8_FOURTH_LEAN_SOURCE,
        MIXED_V7_CELL8_FOURTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_FOURTH_LEAN_SOURCE_SHA256,
        (-55, -158, -312, -1366, -1641, -2371),
    ),
    (
        "v7-cell-8-fifth",
        MIXED_V7_CELL8_FIFTH_CUBE,
        MIXED_V7_CELL8_FIFTH_LEAN_BINDING,
        MIXED_V7_CELL8_FIFTH_LEAN_CHOICES,
        MIXED_V7_CELL8_FIFTH_LEAN_SOURCE,
        MIXED_V7_CELL8_FIFTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_FIFTH_LEAN_SOURCE_SHA256,
        (-55, -545, -2206),
    ),
    (
        "v7-cell-8-sixth",
        MIXED_V7_CELL8_SIXTH_CUBE,
        MIXED_V7_CELL8_SIXTH_LEAN_BINDING,
        MIXED_V7_CELL8_SIXTH_LEAN_CHOICES,
        MIXED_V7_CELL8_SIXTH_LEAN_SOURCE,
        MIXED_V7_CELL8_SIXTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_SIXTH_LEAN_SOURCE_SHA256,
        (-34, -234, -841, -2034, -2300),
    ),
    (
        "v7-cell-8-seventh",
        MIXED_V7_CELL8_SEVENTH_CUBE,
        MIXED_V7_CELL8_SEVENTH_LEAN_BINDING,
        MIXED_V7_CELL8_SEVENTH_LEAN_CHOICES,
        MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE,
        MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_SEVENTH_LEAN_SOURCE_SHA256,
        (-545, -930, -1393),
    ),
    (
        "v7-cell-8-eighth",
        MIXED_V7_CELL8_EIGHTH_CUBE,
        MIXED_V7_CELL8_EIGHTH_LEAN_BINDING,
        MIXED_V7_CELL8_EIGHTH_LEAN_CHOICES,
        MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE,
        MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_EIGHTH_LEAN_SOURCE_SHA256,
        (-55, -159, -345, -930, -1207, -2601),
    ),
    (
        "v7-cell-8-ninth",
        MIXED_V7_CELL8_NINTH_CUBE,
        MIXED_V7_CELL8_NINTH_LEAN_BINDING,
        MIXED_V7_CELL8_NINTH_LEAN_CHOICES,
        MIXED_V7_CELL8_NINTH_LEAN_SOURCE,
        MIXED_V7_CELL8_NINTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_NINTH_LEAN_SOURCE_SHA256,
        (-55, -2118, -2408),
    ),
    (
        "v7-cell-8-tenth",
        MIXED_V7_CELL8_TENTH_CUBE,
        MIXED_V7_CELL8_TENTH_LEAN_BINDING,
        MIXED_V7_CELL8_TENTH_LEAN_CHOICES,
        MIXED_V7_CELL8_TENTH_LEAN_SOURCE,
        MIXED_V7_CELL8_TENTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_TENTH_LEAN_SOURCE_SHA256,
        (-55, -2120, -2408),
    ),
    (
        "v7-cell-8-eleventh",
        MIXED_V7_CELL8_ELEVENTH_CUBE,
        MIXED_V7_CELL8_ELEVENTH_LEAN_BINDING,
        MIXED_V7_CELL8_ELEVENTH_LEAN_CHOICES,
        MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE,
        MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_ELEVENTH_LEAN_SOURCE_SHA256,
        (-55, -2125, -2420),
    ),
    (
        "v7-cell-8-twelfth",
        MIXED_V7_CELL8_TWELFTH_CUBE,
        MIXED_V7_CELL8_TWELFTH_LEAN_BINDING,
        MIXED_V7_CELL8_TWELFTH_LEAN_CHOICES,
        MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE,
        MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_TWELFTH_LEAN_SOURCE_SHA256,
        (-360, -936, -1241, -2651, -2761),
    ),
    (
        "v7-cell-8-thirteenth",
        MIXED_V7_CELL8_THIRTEENTH_CUBE,
        MIXED_V7_CELL8_THIRTEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_THIRTEENTH_LEAN_CHOICES,
        MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE,
        MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_THIRTEENTH_LEAN_SOURCE_SHA256,
        (-21, -55, -1169),
    ),
    (
        "v7-cell-8-fourteenth",
        MIXED_V7_CELL8_FOURTEENTH_CUBE,
        MIXED_V7_CELL8_FOURTEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_FOURTEENTH_LEAN_CHOICES,
        MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE,
        MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_FOURTEENTH_LEAN_SOURCE_SHA256,
        (-21, -166, -2425),
    ),
    (
        "v7-cell-8-fifteenth",
        MIXED_V7_CELL8_FIFTEENTH_CUBE,
        MIXED_V7_CELL8_FIFTEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_FIFTEENTH_LEAN_CHOICES,
        MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE,
        MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_FIFTEENTH_LEAN_SOURCE_SHA256,
        (-37, -156, -1169),
    ),
    (
        "v7-cell-8-sixteenth",
        MIXED_V7_CELL8_SIXTEENTH_CUBE,
        MIXED_V7_CELL8_SIXTEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_SIXTEENTH_LEAN_CHOICES,
        MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE,
        MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_SIXTEENTH_LEAN_SOURCE_SHA256,
        (-55, -288, -1182),
    ),
    (
        "v7-cell-8-seventeenth",
        MIXED_V7_CELL8_SEVENTEENTH_CUBE,
        MIXED_V7_CELL8_SEVENTEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_SEVENTEENTH_LEAN_CHOICES,
        MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE,
        MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_SEVENTEENTH_LEAN_SOURCE_SHA256,
        (-55, -163, -1069, -1630, -2024),
    ),
    (
        "v7-cell-8-eighteenth",
        MIXED_V7_CELL8_EIGHTEENTH_CUBE,
        MIXED_V7_CELL8_EIGHTEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_EIGHTEENTH_LEAN_CHOICES,
        MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE,
        MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_EIGHTEENTH_LEAN_SOURCE_SHA256,
        (-368, -951, -1719, -2065, -2291, -2420, -2992),
    ),
    (
        "v7-cell-8-nineteenth",
        MIXED_V7_CELL8_NINETEENTH_CUBE,
        MIXED_V7_CELL8_NINETEENTH_LEAN_BINDING,
        MIXED_V7_CELL8_NINETEENTH_LEAN_CHOICES,
        MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE,
        MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_NINETEENTH_LEAN_SOURCE_SHA256,
        (-367, -2085, -2420),
    ),
    (
        "v7-cell-8-twentieth",
        MIXED_V7_CELL8_TWENTIETH_CUBE,
        MIXED_V7_CELL8_TWENTIETH_LEAN_BINDING,
        MIXED_V7_CELL8_TWENTIETH_LEAN_CHOICES,
        MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE,
        MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE_BYTES,
        MIXED_V7_CELL8_TWENTIETH_LEAN_SOURCE_SHA256,
        (-516, -849, -1221),
    ),
)
REPO_ROOT = Path(__file__).resolve().parents[3]


class Exact12V14OrderedCoverageTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.certificate = detect_ordered_coverage(FROZEN_CUBE)
        if cls.certificate is None:
            raise AssertionError("frozen positive-incidence witness lost coverage")

    def test_source_order_universe_is_exactly_24_plus_24(self) -> None:
        orientations = [orientation for orientation, _order in SOURCE_ORDERS]
        orders = [order for _orientation, order in SOURCE_ORDERS]

        self.assertEqual(len(SOURCE_ORDERS), 48)
        self.assertEqual(orientations.count("direct"), 24)
        self.assertEqual(orientations.count("mirror"), 24)
        self.assertEqual(len(set(orders)), 48)
        self.assertTrue(all(order[0] == 0 for order in orders))
        self.assertEqual(
            ORDER_UNIVERSE_SHA256,
            "ebc15a5e85c908f3d248e8fc364bef053c4d14e7afe92049d4d34d1dd767cd30",
        )

    def test_every_order_satisfies_the_lean_block_and_forced_predicates(self) -> None:
        for orientation, order in SOURCE_ORDERS:
            position = {label: index for index, label in enumerate(order)}
            forced = (
                position[6] < position[7] < position[8] < position[9]
                or position[9] < position[8] < position[7] < position[6]
            )
            self.assertTrue(forced)
            if orientation == "direct":
                self.assertLess(position[0], position[2])
                self.assertLess(position[2], position[1])
                self.assertTrue(
                    all(position[0] < position[x] < position[2] for x in range(6, 10))
                )
                self.assertTrue(
                    all(position[2] < position[x] < position[1] for x in range(3, 6))
                )
                self.assertTrue(all(position[1] < position[x] for x in (10, 11)))
            else:
                self.assertEqual(orientation, "mirror")
                self.assertLess(position[0], position[1])
                self.assertLess(position[1], position[2])
                self.assertTrue(
                    all(position[0] < position[x] < position[1] for x in (10, 11))
                )
                self.assertTrue(
                    all(position[1] < position[x] < position[2] for x in range(3, 6))
                )
                self.assertTrue(all(position[2] < position[x] for x in range(6, 10)))

    def test_frozen_witness_covers_every_order_with_positive_consumers(self) -> None:
        counts: dict[str, int] = {}
        for entry in self.certificate["coverage"]:
            rule = entry["rule"]
            counts[rule] = counts.get(rule, 0) + 1

        self.assertEqual(len(self.certificate["coverage"]), 48)
        self.assertEqual(
            counts,
            {
                "convex-five-point-common-orientation": 24,
                "selected-rows-kalmanson": 15,
                "two-rows-shared-late-pair": 9,
            },
        )
        self.assertTrue(
            all(row["exact"] is False for row in self.certificate["selected_rows"])
        )

    def test_certificate_roundtrips_and_memberships_are_present(self) -> None:
        key = replay_ordered_coverage(self.certificate)
        self.assertEqual(self.certificate["lean_consumer"], LEAN_CONSUMER)
        self.assertEqual(
            self.certificate["required_source_hypotheses"],
            list(REQUIRED_SOURCE_HYPOTHESES),
        )
        self.assertEqual(len(key), 11)
        self.assertEqual(
            self.certificate["generated_lean_nogood"], FROZEN_V8_LEAN_BINDING
        )
        self.assertEqual(
            self.certificate["generated_lean_nogood"]["cube_sha256"],
            FROZEN_V8_CUBE_SHA256,
        )
        self.assertEqual(
            self.certificate["generated_lean_nogood"]["choices"],
            FROZEN_V8_LEAN_CHOICES,
        )
        self.assertEqual(
            self.certificate["generated_lean_nogood"]["terminal_consumer_declaration"],
            LEAN_TERMINAL_CONSUMER,
        )
        self.assertEqual(
            [
                {"center": row["center"], "support": row["support"]}
                for row in self.certificate["selected_rows"]
            ],
            FROZEN_V8_LEAN_CHOICES,
        )
        for center, required in key:
            self.assertLessEqual(set(required), set(FROZEN_CUBE[center]))

    def test_generated_lean_binding_authenticates_current_sources(self) -> None:
        for relative, byte_count, digest in (
            (
                FROZEN_V8_LEAN_SOURCE,
                FROZEN_V8_LEAN_SOURCE_BYTES,
                FROZEN_V8_LEAN_SOURCE_SHA256,
            ),
            (
                FROZEN_V8_LEAN_COVERAGE_SOURCE,
                FROZEN_V8_LEAN_COVERAGE_SOURCE_BYTES,
                FROZEN_V8_LEAN_COVERAGE_SOURCE_SHA256,
            ),
            (
                FROZEN_V8_LEAN_CONSUMER_SOURCE,
                FROZEN_V8_LEAN_CONSUMER_SOURCE_BYTES,
                FROZEN_V8_LEAN_CONSUMER_SOURCE_SHA256,
            ),
        ):
            source = (REPO_ROOT / relative).read_bytes()
            self.assertEqual(len(source), byte_count)
            self.assertEqual(hashlib.sha256(source).hexdigest(), digest)

    def test_mixed_survivors_have_proof_backed_positive_cuts(self) -> None:
        instance = materialize_cell(0).instance
        for (
            cell,
            cube,
            binding,
            choices,
            source_path,
            source_bytes,
            source_sha256,
            expected_clause,
        ) in MIXED_CASES:
            with self.subTest(cell=cell):
                certificate = detect_proof_backed_ordered_coverage(cube)
                self.assertIsNotNone(certificate)
                assert certificate is not None
                self.assertEqual(certificate["generated_lean_nogood"], binding)
                self.assertEqual(
                    certificate["selected_rows"],
                    [
                        {
                            "center": row["center"],
                            "support": row["support"],
                            "exact": False,
                        }
                        for row in choices
                    ],
                )
                self.assertEqual(len(certificate["coverage"]), 48)
                expected_rule = (
                    "source-independent-structural-core"
                    if "source_independent_structural_detection" in binding
                    else "convex-five-point-common-orientation"
                )
                self.assertEqual(
                    {entry["rule"] for entry in certificate["coverage"]},
                    {expected_rule},
                )
                if cell == "v4-cell-1":
                    preferred = binding["preferred_common_five_core"]
                    self.assertEqual(
                        {
                            tuple(sorted(entry["core"].items()))
                            for entry in certificate["coverage"]
                        },
                        {tuple(sorted(preferred.items()))},
                    )
                    self.assertEqual(
                        [
                            sum(
                                entry["orientation"] == orientation
                                for entry in certificate["coverage"]
                            )
                            for orientation in ("forward", "reverse")
                        ],
                        [24, 24],
                    )
                if "preferred_common_five_cores" in binding:
                    preferred_many = binding["preferred_common_five_cores"]
                    self.assertEqual(
                        {
                            tuple(sorted(entry["core"].items()))
                            for entry in certificate["coverage"]
                        },
                        {
                            tuple(sorted(preferred.items()))
                            for preferred in preferred_many
                        },
                    )
                    expected_counts = (
                        [24, 12, 12]
                        if cell == "v7-cell-8-eighteenth"
                        else [
                            len(certificate["coverage"]) // len(preferred_many)
                            for _preferred in preferred_many
                        ]
                    )
                    self.assertEqual(
                        [
                            sum(
                                entry["core"] == preferred
                                for entry in certificate["coverage"]
                            )
                            for preferred in preferred_many
                        ],
                        expected_counts,
                    )
                clause = learned_clause_for_proof_backed_ordered_coverage(
                    instance, certificate
                )
                self.assertEqual(clause, expected_clause)
                source = (REPO_ROOT / source_path).read_bytes()
                self.assertEqual(len(source), source_bytes)
                self.assertEqual(hashlib.sha256(source).hexdigest(), source_sha256)

    def test_learned_clause_uses_bound_selected_rows_and_is_falsified(self) -> None:
        instance = materialize_cell(0).instance
        clause = learned_clause_for_proof_backed_ordered_coverage(
            instance, self.certificate
        )
        key = replay_ordered_coverage(self.certificate)
        selected = {
            instance.choice_variables[
                (center, instance.candidate_index(center, FROZEN_CUBE[center]))
            ]
            for center, _required in key
        }

        self.assertEqual(len(clause), len(key))
        self.assertTrue(all(-literal in selected for literal in clause))

    def test_unbound_coverage_remains_diagnostic_only(self) -> None:
        unbound = copy.deepcopy(FROZEN_CUBE)
        unbound[6] = [0, 1, 4, 8]
        diagnostic = detect_ordered_coverage(unbound)

        self.assertIsNotNone(diagnostic)
        self.assertNotIn("generated_lean_nogood", diagnostic)
        self.assertIsNone(detect_proof_backed_ordered_coverage(unbound))
        with self.assertRaisesRegex(
            Exact12V14OrderedCoverageError, "no generated Lean nogood"
        ):
            learned_clause_for_proof_backed_ordered_coverage(
                materialize_cell(0).instance, diagnostic
            )

    def test_certificate_binding_does_not_alias_module_constant(self) -> None:
        mutated = detect_proof_backed_ordered_coverage(FROZEN_CUBE)
        self.assertIsNotNone(mutated)
        mutated["generated_lean_nogood"]["choices"].pop()
        self.assertEqual(len(FROZEN_V8_LEAN_BINDING["choices"]), 11)

    def test_replay_rejects_order_coverage_and_closure_tampering(self) -> None:
        mutations = []

        order = copy.deepcopy(self.certificate)
        order["coverage"][0]["order"][1:3] = reversed(
            order["coverage"][0]["order"][1:3]
        )
        mutations.append(order)

        coverage = copy.deepcopy(self.certificate)
        coverage["coverage"].pop()
        mutations.append(coverage)

        closure = copy.deepcopy(self.certificate)
        closure["closure_certificates"][0]["proof_sha256"] = "0" * 64
        mutations.append(closure)

        row = copy.deepcopy(self.certificate)
        row["selected_rows"][0]["exact"] = True
        mutations.append(row)

        binding = copy.deepcopy(self.certificate)
        binding["generated_lean_nogood"]["source_sha256"] = "0" * 64
        mutations.append(binding)

        for index, mutation in enumerate(mutations):
            with (
                self.subTest(mutation=index),
                self.assertRaisesRegex(Exact12V14OrderedCoverageError, "exact replay"),
            ):
                replay_ordered_coverage(mutation)

    def test_malformed_cube_is_rejected_before_detection(self) -> None:
        malformed = copy.deepcopy(FROZEN_CUBE)
        malformed[0] = [0, 3, 5, 8]
        with self.assertRaisesRegex(
            Exact12V14OrderedCoverageError, "four distinct other labels"
        ):
            detect_ordered_coverage(malformed)

        unhashable = copy.deepcopy(FROZEN_CUBE)
        unhashable[0] = [[3], [5], [8], [10]]
        with self.assertRaisesRegex(
            Exact12V14OrderedCoverageError, "four distinct other labels"
        ):
            detect_ordered_coverage(unhashable)


if __name__ == "__main__":
    unittest.main()
