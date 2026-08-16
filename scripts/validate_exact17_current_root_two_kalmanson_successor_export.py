"""Independent validator for the exact-17 current-root two-Kalmanson successor export.

The checked suffix consists of the four named-order/orientation clauses for
each of the 81 source-valid successor cancellation supports.  The support table is
intentionally serialized here rather than imported from the Lean generator.
"""

from __future__ import annotations

import hashlib
import os
import stat
import subprocess
from collections.abc import Iterator
from dataclasses import dataclass
from pathlib import Path
from typing import BinaryIO

ROOT = Path(__file__).resolve().parents[1]
PARENT_PATH = (
    ROOT
    / "scratch/exact17-current-root-two-kalmanson-package-v2/exact17-current-root-two-kalmanson.cnf"
)
CHILD_PATH = (
    ROOT / "scratch/exact17-current-root-two-kalmanson-successor-package-v2/"
    "exact17-current-root-two-kalmanson-successor.cnf"
)
LEAN_ROOT_PATH = (
    ROOT / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCurrentRootTwoKalmansonSuccessorRefinements.lean"
)
LEAN_EXPORT_PATH = (
    ROOT / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCurrentRootTwoKalmansonSuccessorRefinementsExport.lean"
)
PARENT_LEAN_ROOT_PATH = (
    ROOT / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCurrentRootTwoKalmansonRefinements.lean"
)
PARENT_LEAN_EXPORT_PATH = (
    ROOT / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCurrentRootTwoKalmansonRefinementsExport.lean"
)

SOURCE_COMMIT = "057ea2af8df5755c7130f23f52c35907d49ae5a"
PARENT_SOURCE_COMMIT = "23f5e08d7ee09324732da6ee86e187588c6b143d"
LEAN_ROOT_SHA256 = "0fb8317d17a0085334f7a2885361c0ea51da52ec1e2c8cfc857dfb641d2c1638"
LEAN_EXPORT_SHA256 = "eb4c9e5e2878079ed5d60e096fefb5d198e6b663e4c7098bcbd03eefb9bbf033"
SOURCE_BASELINE_SHA256 = LEAN_ROOT_SHA256
PARENT_LEAN_ROOT_SHA256 = (
    "d42fcede4889e7c4b536c5653cf024318268e113f408085a0232f95800827cd3"
)
PARENT_LEAN_EXPORT_SHA256 = (
    "2aa26cb3a07a8b85bf2a8c391dd19098861fdf84cc5e93d35ac2f85f5784371c"
)
PARENT_SHA256 = "7787c58442a276f0247efec8d1a3bec3df34aeb47b5896c54c9cbd9d08978698"
PARENT_BYTES = 333_029_088
PARENT_CLAUSES = 7_037_176
CHILD_SHA256 = "747a02220bb7d69cc293e15da5643e30797c4ea6de6b43bcf2756f2722401a3c"
CHILD_BYTES = 333050318
CHILD_CLAUSES = 7_037_500
VARIABLES = 308
SUFFIX_SHA256 = "3efdf6dd0fc1a7c1ddcf318b960a00e02698957f431a5eacc8a70a93b7577aad"
SUFFIX_BYTES = 21230
SUFFIX_CLAUSES = 324
OCCURRENCES = 81
CLAUSES_PER_OCCURRENCE = 4
VALIDATION_SCHEMA = (
    "p97-exact17-current-root-two-kalmanson-successor-export-validation/v1"
)

_ORDER_TABLES = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)

_SUPPORTS: tuple[tuple[tuple[int, int], ...], ...] = (
    ((1, 4), (1, 11), (2, 1), (2, 11), (11, 1), (11, 4)),
    ((3, 10), (3, 15), (11, 1), (11, 15), (15, 1), (15, 10)),
    ((4, 13), (4, 16), (13, 10), (13, 16), (15, 10), (15, 13)),
    ((5, 3), (5, 7), (7, 3), (7, 6), (9, 6), (9, 7)),
    ((5, 3), (5, 8), (7, 3), (7, 5), (10, 5), (10, 8)),
    ((9, 13), (9, 15), (12, 10), (12, 15), (15, 10), (15, 13)),
    ((0, 4), (0, 5), (5, 3), (5, 7), (7, 3), (7, 5), (8, 4), (8, 7)),
    ((5, 3), (5, 7), (7, 3), (7, 5), (8, 7), (8, 12), (10, 5), (10, 12)),
    ((5, 8), (5, 10), (7, 5), (7, 11), (10, 5), (10, 8), (13, 10), (13, 11)),
    ((5, 8), (5, 10), (8, 9), (8, 12), (10, 8), (10, 12), (12, 9), (12, 10)),
    ((8, 9), (8, 12), (10, 8), (10, 12), (11, 8), (11, 15), (12, 9), (12, 15)),
    ((10, 12), (10, 16), (12, 3), (12, 10), (13, 10), (13, 16), (16, 3), (16, 12)),
    ((10, 12), (10, 16), (13, 10), (13, 16), (15, 0), (15, 10), (16, 0), (16, 12)),
    (
        (0, 2),
        (0, 4),
        (1, 4),
        (1, 11),
        (2, 1),
        (2, 11),
        (3, 2),
        (3, 15),
        (11, 1),
        (11, 15),
    ),
    (
        (0, 2),
        (0, 4),
        (1, 4),
        (1, 11),
        (2, 1),
        (2, 11),
        (11, 1),
        (11, 8),
        (14, 2),
        (14, 8),
    ),
    (
        (0, 4),
        (0, 5),
        (5, 8),
        (5, 10),
        (8, 4),
        (8, 9),
        (10, 5),
        (10, 8),
        (12, 9),
        (12, 10),
    ),
    ((0, 4), (0, 5), (6, 7), (6, 9), (7, 5), (7, 6), (8, 4), (8, 9), (9, 6), (9, 7)),
    (
        (2, 6),
        (2, 12),
        (5, 3),
        (5, 10),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (12, 3),
        (12, 10),
    ),
    (
        (2, 11),
        (2, 12),
        (6, 7),
        (6, 9),
        (7, 6),
        (7, 11),
        (8, 9),
        (8, 12),
        (9, 6),
        (9, 7),
    ),
    (
        (3, 10),
        (3, 15),
        (7, 3),
        (7, 5),
        (10, 5),
        (10, 12),
        (12, 10),
        (12, 15),
        (16, 3),
        (16, 12),
    ),
    (
        (4, 6),
        (4, 13),
        (6, 9),
        (6, 14),
        (9, 6),
        (9, 13),
        (12, 9),
        (12, 10),
        (13, 10),
        (13, 14),
    ),
    (
        (5, 3),
        (5, 10),
        (6, 7),
        (6, 9),
        (7, 3),
        (7, 6),
        (9, 6),
        (9, 7),
        (12, 9),
        (12, 10),
    ),
    (
        (5, 7),
        (5, 10),
        (7, 5),
        (7, 11),
        (8, 7),
        (8, 12),
        (10, 5),
        (10, 12),
        (13, 10),
        (13, 11),
    ),
    (
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (8, 9),
        (8, 12),
        (9, 6),
        (9, 7),
        (10, 5),
        (10, 12),
    ),
    (
        (6, 7),
        (6, 9),
        (7, 6),
        (7, 11),
        (9, 6),
        (9, 7),
        (12, 9),
        (12, 10),
        (13, 10),
        (13, 11),
    ),
    (
        (0, 2),
        (0, 13),
        (6, 9),
        (6, 14),
        (9, 6),
        (9, 13),
        (12, 9),
        (12, 10),
        (13, 10),
        (13, 14),
        (14, 2),
        (14, 6),
    ),
    (
        (0, 4),
        (0, 5),
        (3, 4),
        (3, 15),
        (5, 3),
        (5, 10),
        (10, 5),
        (10, 12),
        (12, 10),
        (12, 15),
        (16, 3),
        (16, 12),
    ),
    (
        (0, 4),
        (0, 5),
        (5, 7),
        (5, 8),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (8, 4),
        (8, 9),
        (14, 6),
        (14, 8),
    ),
    (
        (0, 5),
        (0, 13),
        (5, 3),
        (5, 7),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (9, 6),
        (9, 13),
        (12, 3),
        (12, 9),
    ),
    (
        (2, 1),
        (2, 12),
        (5, 7),
        (5, 10),
        (6, 1),
        (6, 7),
        (7, 3),
        (7, 5),
        (10, 5),
        (10, 12),
        (12, 3),
        (12, 10),
    ),
    (
        (2, 6),
        (2, 12),
        (5, 7),
        (5, 10),
        (6, 1),
        (6, 7),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (15, 1),
        (15, 10),
    ),
    (
        (2, 6),
        (2, 12),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (13, 10),
        (13, 14),
    ),
    (
        (2, 11),
        (2, 12),
        (5, 7),
        (5, 10),
        (7, 5),
        (7, 11),
        (9, 7),
        (9, 15),
        (10, 5),
        (10, 12),
        (12, 10),
        (12, 15),
    ),
    (
        (2, 11),
        (2, 12),
        (5, 8),
        (5, 10),
        (7, 5),
        (7, 11),
        (10, 5),
        (10, 12),
        (11, 8),
        (11, 15),
        (12, 10),
        (12, 15),
    ),
    (
        (5, 7),
        (5, 8),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (8, 9),
        (8, 12),
        (10, 5),
        (10, 12),
        (14, 6),
        (14, 8),
    ),
    (
        (5, 7),
        (5, 8),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (14, 6),
        (14, 8),
        (16, 12),
        (16, 14),
    ),
    (
        (5, 7),
        (5, 8),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 16),
        (13, 14),
        (13, 16),
        (14, 6),
        (14, 8),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 9),
        (7, 3),
        (7, 5),
        (8, 9),
        (8, 12),
        (10, 5),
        (10, 12),
        (12, 3),
        (12, 10),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 3),
        (7, 5),
        (10, 5),
        (10, 12),
        (12, 3),
        (12, 10),
        (16, 12),
        (16, 14),
    ),
    (
        (5, 7),
        (5, 10),
        (7, 5),
        (7, 11),
        (8, 4),
        (8, 7),
        (10, 5),
        (10, 8),
        (11, 4),
        (11, 8),
        (13, 10),
        (13, 11),
    ),
    (
        (5, 7),
        (5, 10),
        (7, 5),
        (7, 11),
        (9, 7),
        (9, 13),
        (10, 5),
        (10, 16),
        (13, 11),
        (13, 16),
        (15, 10),
        (15, 13),
    ),
    (
        (5, 7),
        (5, 10),
        (7, 5),
        (7, 11),
        (9, 7),
        (9, 15),
        (10, 5),
        (10, 8),
        (11, 8),
        (11, 15),
        (13, 10),
        (13, 11),
    ),
    (
        (6, 9),
        (6, 14),
        (9, 6),
        (9, 13),
        (12, 9),
        (12, 10),
        (13, 10),
        (13, 14),
        (14, 0),
        (14, 6),
        (15, 0),
        (15, 13),
    ),
    (
        (0, 4),
        (0, 5),
        (5, 7),
        (5, 8),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (8, 4),
        (8, 9),
        (9, 6),
        (9, 15),
        (11, 8),
        (11, 15),
    ),
    (
        (0, 4),
        (0, 5),
        (5, 7),
        (5, 8),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (8, 4),
        (8, 12),
        (14, 6),
        (14, 8),
        (16, 12),
        (16, 14),
    ),
    (
        (1, 4),
        (1, 14),
        (3, 4),
        (3, 10),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 8),
        (14, 6),
        (14, 8),
    ),
    (
        (1, 11),
        (1, 14),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 8),
        (13, 10),
        (13, 11),
        (14, 6),
        (14, 8),
    ),
    (
        (2, 1),
        (2, 12),
        (5, 7),
        (5, 10),
        (6, 1),
        (6, 7),
        (7, 5),
        (7, 6),
        (9, 6),
        (9, 15),
        (10, 5),
        (10, 12),
        (12, 10),
        (12, 15),
    ),
    (
        (2, 6),
        (2, 11),
        (5, 7),
        (5, 10),
        (6, 1),
        (6, 7),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 8),
        (11, 1),
        (11, 8),
        (13, 10),
        (13, 11),
    ),
    (
        (2, 6),
        (2, 12),
        (5, 7),
        (5, 10),
        (6, 1),
        (6, 7),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (11, 1),
        (11, 15),
        (12, 10),
        (12, 15),
    ),
    (
        (2, 11),
        (2, 12),
        (5, 7),
        (5, 10),
        (7, 5),
        (7, 11),
        (8, 4),
        (8, 7),
        (10, 5),
        (10, 12),
        (11, 4),
        (11, 15),
        (12, 10),
        (12, 15),
    ),
    (
        (3, 4),
        (3, 10),
        (4, 6),
        (4, 16),
        (5, 7),
        (5, 10),
        (6, 1),
        (6, 7),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 16),
        (11, 1),
        (11, 4),
    ),
    (
        (3, 4),
        (3, 10),
        (4, 6),
        (4, 16),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (8, 4),
        (8, 9),
        (10, 5),
        (10, 16),
    ),
    (
        (3, 4),
        (3, 15),
        (5, 7),
        (5, 10),
        (7, 3),
        (7, 5),
        (8, 4),
        (8, 7),
        (10, 5),
        (10, 12),
        (12, 10),
        (12, 15),
        (16, 3),
        (16, 12),
    ),
    (
        (4, 6),
        (4, 13),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 16),
        (13, 14),
        (13, 16),
        (15, 10),
        (15, 13),
    ),
    (
        (4, 13),
        (4, 16),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (9, 6),
        (9, 13),
        (10, 5),
        (10, 16),
        (12, 9),
        (12, 10),
    ),
    (
        (5, 7),
        (5, 8),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (8, 9),
        (8, 12),
        (9, 6),
        (9, 15),
        (10, 5),
        (10, 12),
        (11, 8),
        (11, 15),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (8, 7),
        (8, 12),
        (9, 6),
        (9, 7),
        (10, 5),
        (10, 12),
        (12, 9),
        (12, 10),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (8, 9),
        (8, 12),
        (9, 6),
        (9, 15),
        (10, 5),
        (10, 12),
        (12, 10),
        (12, 15),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (9, 6),
        (9, 15),
        (10, 5),
        (10, 12),
        (12, 10),
        (12, 15),
        (16, 12),
        (16, 14),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (13, 10),
        (13, 14),
        (14, 0),
        (14, 6),
        (16, 0),
        (16, 12),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (14, 0),
        (14, 6),
        (15, 0),
        (15, 10),
        (16, 12),
        (16, 14),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 16),
        (13, 14),
        (13, 16),
        (14, 0),
        (14, 6),
        (15, 0),
        (15, 10),
    ),
    (
        (0, 2),
        (0, 13),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 16),
        (13, 14),
        (13, 16),
        (14, 2),
        (14, 6),
        (15, 10),
        (15, 13),
    ),
    (
        (1, 4),
        (1, 14),
        (3, 4),
        (3, 10),
        (4, 2),
        (4, 16),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 16),
        (14, 2),
        (14, 6),
    ),
    (
        (2, 1),
        (2, 12),
        (3, 2),
        (3, 15),
        (5, 7),
        (5, 10),
        (6, 1),
        (6, 7),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (12, 10),
        (12, 15),
        (14, 2),
        (14, 6),
    ),
    (
        (2, 1),
        (2, 12),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (9, 6),
        (9, 15),
        (10, 5),
        (10, 12),
        (11, 1),
        (11, 15),
        (12, 9),
        (12, 10),
    ),
    (
        (3, 2),
        (3, 15),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (12, 10),
        (12, 15),
        (14, 2),
        (14, 6),
        (16, 12),
        (16, 14),
    ),
    (
        (4, 2),
        (4, 16),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (13, 10),
        (13, 16),
        (14, 2),
        (14, 6),
        (16, 12),
        (16, 14),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (8, 4),
        (8, 12),
        (9, 6),
        (9, 15),
        (10, 5),
        (10, 12),
        (11, 4),
        (11, 15),
        (12, 9),
        (12, 10),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (8, 9),
        (8, 12),
        (10, 5),
        (10, 12),
        (11, 8),
        (11, 15),
        (12, 10),
        (12, 15),
        (14, 6),
        (14, 8),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (9, 6),
        (9, 13),
        (10, 5),
        (10, 8),
        (11, 8),
        (11, 15),
        (12, 9),
        (12, 15),
        (15, 10),
        (15, 13),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (9, 6),
        (9, 13),
        (10, 5),
        (10, 12),
        (12, 9),
        (12, 10),
        (15, 0),
        (15, 13),
        (16, 0),
        (16, 12),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 9),
        (7, 5),
        (7, 6),
        (9, 6),
        (9, 15),
        (10, 5),
        (10, 12),
        (12, 3),
        (12, 9),
        (12, 10),
        (12, 15),
        (16, 3),
        (16, 12),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 8),
        (10, 12),
        (10, 16),
        (13, 10),
        (13, 16),
        (14, 6),
        (14, 8),
        (16, 12),
        (16, 14),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (11, 8),
        (11, 15),
        (12, 10),
        (12, 15),
        (14, 6),
        (14, 8),
        (16, 12),
        (16, 14),
    ),
    (
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (12, 3),
        (12, 10),
        (14, 0),
        (14, 6),
        (16, 0),
        (16, 3),
        (16, 12),
        (16, 14),
    ),
    (
        (1, 11),
        (1, 14),
        (2, 11),
        (2, 12),
        (3, 2),
        (3, 15),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (12, 10),
        (12, 15),
        (14, 2),
        (14, 6),
    ),
    (
        (1, 11),
        (1, 14),
        (2, 11),
        (2, 12),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (11, 8),
        (11, 15),
        (12, 10),
        (12, 15),
        (14, 6),
        (14, 8),
    ),
    (
        (1, 11),
        (1, 14),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 8),
        (11, 1),
        (11, 8),
        (13, 10),
        (13, 11),
        (14, 0),
        (14, 6),
        (15, 0),
        (15, 1),
    ),
    (
        (1, 11),
        (1, 14),
        (2, 11),
        (2, 12),
        (5, 7),
        (5, 10),
        (6, 7),
        (6, 14),
        (7, 5),
        (7, 6),
        (10, 5),
        (10, 12),
        (11, 1),
        (11, 15),
        (12, 10),
        (12, 15),
        (14, 0),
        (14, 6),
        (15, 0),
        (15, 1),
    ),
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
            named = os.stat(component, dir_fd=descriptor, follow_symlinks=False)
            opened = os.fstat(child)
            if (named.st_dev, named.st_ino) != (opened.st_dev, opened.st_ino):
                os.close(child)
                raise ValueError(f"path component changed while opening {path}")
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
        opened = os.fstat(descriptor)
        named = os.stat(path.name, dir_fd=parent, follow_symlinks=False)
        if not stat.S_ISREG(opened.st_mode) or opened.st_nlink != 1:
            raise ValueError(f"not an exclusive regular file: {path}")
        if (named.st_dev, named.st_ino) != (opened.st_dev, opened.st_ino):
            raise ValueError(f"file changed while opening: {path}")
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
    ) != (
        after.st_dev,
        after.st_ino,
        after.st_size,
        after.st_mtime_ns,
        after.st_nlink,
    ):
        raise ValueError(f"file changed during hashing: {path}")
    return digest.hexdigest()


def _git_show(commit: str, path: Path) -> bytes:
    relative = path.relative_to(ROOT)
    try:
        result = subprocess.run(
            ["git", "show", f"{commit}:{relative}"],
            cwd=ROOT,
            check=True,
            capture_output=True,
        )
    except (subprocess.CalledProcessError, ValueError) as error:
        raise ValueError(f"committed {path} is unavailable at {commit}") from error
    return result.stdout


def _require_committed_source(
    path: Path, commit: str, expected: str, label: str
) -> None:
    if len(commit) != 40 or any(
        character not in "0123456789abcdef" for character in commit
    ):
        raise ValueError(f"{label} commit pin is malformed")
    committed = _git_show(commit, path)
    identity = (hashlib.sha256(committed).hexdigest(), len(committed))
    with _open_regular_nofollow(path) as stream:
        live_size = os.fstat(stream.fileno()).st_size
    if identity != (expected, live_size):
        raise ValueError(f"{label} committed bytes drifted")
    if sha256_file(path) != expected:
        raise ValueError(f"{label} live bytes drifted")


def _hit_var(center: int, point: int) -> int:
    value = 1 + center * 17 + point
    if not 1 <= value <= VARIABLES:
        raise ValueError("generated literal is outside the DIMACS variable range")
    return value


def _oriented_label(order: int, reverse: bool, label: int) -> int:
    position = 16 - label if reverse else label
    return _ORDER_TABLES[order][position]


def _clause_line(
    support: tuple[tuple[int, int], ...], order: int, reverse: bool
) -> bytes:
    literals = [-(307 + order)]
    literals.extend(
        -_hit_var(
            _oriented_label(order, reverse, center),
            _oriented_label(order, reverse, point),
        )
        for center, point in support
    )
    return (" ".join(map(str, literals)) + " 0\n").encode("ascii")


def expected_suffix_lines() -> Iterator[bytes]:
    """Yield the exact Lean occurrence × named-order × orientation order."""

    for support in _SUPPORTS:
        for order in range(2):
            for reverse in (False, True):
                yield _clause_line(support, order, reverse)


def _validate_export(
    parent_path: Path = PARENT_PATH,
    child_path: Path = CHILD_PATH,
    *,
    check_support: bool,
    spec: ExportSpec,
) -> dict[str, object]:
    """Authenticate the parent body prefix and replay every suffix clause."""

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

    parent_digest = hashlib.sha256()
    child_digest = hashlib.sha256()
    suffix_digest = hashlib.sha256()
    suffix_bytes = 0
    suffix_clauses = 0
    seen: set[bytes] = set()
    with (
        _open_regular_nofollow(parent_path) as parent,
        _open_regular_nofollow(child_path) as child,
    ):
        parent_before = os.fstat(parent.fileno())
        child_before = os.fstat(child.fileno())
        parent_header = parent.readline()
        child_header = child.readline()
        if parent_header != f"p cnf {spec.variables} {spec.parent_clauses}\n".encode():
            raise ValueError("two-triple-row parent DIMACS header drifted")
        if child_header != f"p cnf {spec.variables} {spec.child_clauses}\n".encode():
            raise ValueError("current-root two-Kalmanson DIMACS header drifted")
        parent_digest.update(parent_header)
        child_digest.update(child_header)
        while block := parent.read(1 << 20):
            parent_digest.update(block)
            observed = child.read(len(block))
            if observed != block:
                raise ValueError("child does not preserve the exact parent body prefix")
            child_digest.update(observed)
        for expected in expected_suffix_lines():
            observed = child.readline()
            if observed != expected:
                raise ValueError(f"ordered suffix drifted at clause {suffix_clauses}")
            if observed in seen:
                raise ValueError(f"duplicate suffix clause at index {suffix_clauses}")
            seen.add(observed)
            suffix_digest.update(observed)
            child_digest.update(observed)
            suffix_bytes += len(observed)
            suffix_clauses += 1
        if child.read(1):
            raise ValueError("child contains extra bytes after the expected suffix")

        parent_after = os.fstat(parent.fileno())
        child_after = os.fstat(child.fileno())

    for label, before, after in (
        ("parent", parent_before, parent_after),
        ("child", child_before, child_after),
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

    parent_identity = (parent_digest.hexdigest(), parent_before.st_size)
    child_identity = (child_digest.hexdigest(), child_before.st_size)
    if parent_identity != (spec.parent_sha256, spec.parent_bytes):
        raise ValueError("parent root identity drifted")
    if child_identity != (spec.child_sha256, spec.child_bytes):
        raise ValueError("current-root two-Kalmanson child identity drifted")
    suffix_identity = (suffix_digest.hexdigest(), suffix_bytes, suffix_clauses)
    if suffix_identity != (SUFFIX_SHA256, SUFFIX_BYTES, SUFFIX_CLAUSES):
        raise ValueError("independently regenerated suffix identity drifted")
    return {
        "schema": VALIDATION_SCHEMA,
        "status": "PASS",
        "source_baseline_sha256": SOURCE_BASELINE_SHA256,
        "source_commit": SOURCE_COMMIT,
        "parent_source_commit": PARENT_SOURCE_COMMIT,
        "variables": spec.variables,
        "parent": {
            "path": os.path.abspath(parent_path),
            "sha256": parent_identity[0],
            "bytes": parent_identity[1],
            "clauses": spec.parent_clauses,
        },
        "child": {
            "path": os.path.abspath(child_path),
            "sha256": child_identity[0],
            "bytes": child_identity[1],
            "clauses": spec.child_clauses,
        },
        "suffix": {
            "sha256": suffix_identity[0],
            "bytes": suffix_identity[1],
            "clauses": suffix_identity[2],
            "generator": "independent-python-current-root-two-kalmanson-successor-generator/v1",
            "semantics": "81 checked two-Kalmanson successor cancellation supports",
            "occurrences": OCCURRENCES,
            "named_orders": 2,
            "orientations": 2,
            "clauses_per_occurrence": CLAUSES_PER_OCCURRENCE,
        },
        "lean": {
            "root_sha256": LEAN_ROOT_SHA256,
            "export_sha256": LEAN_EXPORT_SHA256,
        },
    }


def validate_export(
    parent_path: Path = PARENT_PATH, child_path: Path = CHILD_PATH
) -> dict[str, object]:
    """Validate only the authenticated production export profile."""

    return _validate_export(
        parent_path,
        child_path,
        check_support=True,
        spec=PRODUCTION_SPEC,
    )


__all__ = [
    "CHILD_BYTES",
    "CHILD_CLAUSES",
    "CHILD_PATH",
    "CHILD_SHA256",
    "CLAUSES_PER_OCCURRENCE",
    "LEAN_EXPORT_PATH",
    "LEAN_EXPORT_SHA256",
    "LEAN_ROOT_PATH",
    "LEAN_ROOT_SHA256",
    "OCCURRENCES",
    "PARENT_BYTES",
    "PARENT_CLAUSES",
    "PARENT_LEAN_EXPORT_PATH",
    "PARENT_LEAN_EXPORT_SHA256",
    "PARENT_LEAN_ROOT_PATH",
    "PARENT_LEAN_ROOT_SHA256",
    "PARENT_PATH",
    "PARENT_SHA256",
    "PARENT_SOURCE_COMMIT",
    "PRODUCTION_SPEC",
    "SOURCE_BASELINE_SHA256",
    "SOURCE_COMMIT",
    "SUFFIX_BYTES",
    "SUFFIX_CLAUSES",
    "SUFFIX_SHA256",
    "VALIDATION_SCHEMA",
    "VARIABLES",
    "ExportSpec",
    "expected_suffix_lines",
    "sha256_file",
    "validate_export",
]
