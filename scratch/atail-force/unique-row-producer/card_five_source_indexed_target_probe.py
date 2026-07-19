#!/usr/bin/env python3
"""Source-indexed finite-shadow probe for the exact card-five producer.

This is theorem-discovery code, not a proof checker.  It strengthens the
earlier interior-pair search in two ways:

* every off-surplus member of the pinned five-point apex class receives its
  own exact deletion-critical shell row; and
* a complete assignment is accepted only when *every* off-surplus pair avoids
  all three requested producer outputs.

The three outputs are a choice-invariant surplus-cap critical shell containing
the pair, ``CardFiveCapOrMutualFields`` for the source-indexed rows, and the
coincident-blocker residual-member selected-class packet.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter
from dataclasses import dataclass
from functools import lru_cache
from pathlib import Path
from typing import Mapping, Sequence

from census.global_confinement import shadow
from census.global_confinement.critical_shell_probe import (
    critical_shell_choices,
    no_qfree_compatibility,
)
from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    _formalized_metric_core,
)
from census.multi_center import multi_center_census as mc


FIRST_APEX = 1
PROFILES = {
    "554": (5, 5, 4),
    "654": (6, 5, 4),
    "555": (5, 5, 5),
}
LOCAL_EXACT_QQ_NOGOODS = {
    "source-indexed-654-five-row": frozenset(
        {
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (9, (0, 2, 3, 4)),
            (10, (5, 6, 9, 11)),
            (11, (1, 4, 9, 10)),
        }
    ),
    "source-indexed-654-six-row-02": frozenset(
        {
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (8, (0, 2, 3, 4)),
            (9, (0, 5, 6, 8)),
            (10, (3, 6, 9, 11)),
            (11, (1, 4, 8, 10)),
        }
    ),
    "source-indexed-654-five-row-03": frozenset(
        {
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (8, (2, 6, 9, 11)),
            (10, (1, 3, 5, 8)),
            (11, (1, 4, 9, 10)),
        }
    ),
    "source-indexed-654-six-row-04": frozenset(
        {
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (8, (3, 6, 7, 9)),
            (9, (0, 2, 3, 5)),
            (10, (0, 1, 3, 4)),
            (11, (1, 5, 8, 10)),
        }
    ),
    "interior-bank-unit-core-654-02": frozenset(
        {
            (1, (0, 4, 7, 8, 9)),
            (3, (1, 5, 6, 7)),
            (7, (2, 6, 9, 11)),
            (8, (1, 3, 7, 9)),
            (9, (0, 2, 3, 4)),
            (11, (1, 4, 6, 10)),
        }
    ),
    "interior-bank-unit-core-654-05": frozenset(
        {
            (1, (0, 5, 7, 8, 9)),
            (5, (4, 6, 9, 11)),
            (7, (2, 5, 8, 11)),
            (8, (1, 3, 5, 9)),
            (11, (1, 6, 7, 10)),
        }
    ),
    "interior-bank-unit-core-654-06": frozenset(
        {
            (1, (0, 5, 7, 8, 9)),
            (5, (4, 6, 9, 11)),
            (7, (2, 6, 8, 11)),
            (8, (1, 3, 5, 9)),
            (11, (1, 6, 7, 10)),
        }
    ),
    "interior-bank-unit-core-654-08": frozenset(
        {
            (0, (1, 2, 3, 4)),
            (2, (0, 1, 10, 11)),
            (4, (3, 6, 7, 11)),
            (10, (0, 4, 6, 11)),
            (11, (1, 5, 6, 10)),
        }
    ),
    "real-infeasible-full-654-01": frozenset(
        {
            (0, (3, 5, 9, 10)),
            (1, (0, 4, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (3, (1, 5, 6, 7)),
            (4, (2, 3, 5, 8)),
            (5, (2, 4, 7, 11)),
            (6, (1, 4, 5, 8)),
            (7, (4, 6, 9, 10)),
            (8, (3, 7, 9, 11)),
            (9, (0, 2, 3, 4)),
            (10, (1, 2, 6, 9)),
            (11, (3, 6, 8, 10)),
        }
    ),
    "source-indexed-active-unit-kernel-654-07-08": frozenset(
        {
            (1, (0, 2, 8)),
            (2, (0, 1, 10, 11)),
            (8, (0, 2)),
            (10, (0, 1)),
            (11, (1, 8, 10)),
        }
    ),
    "source-indexed-unit-core-654-07": frozenset(
        {
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (8, (0, 2, 3, 4)),
            (10, (0, 1, 3, 6)),
            (11, (1, 4, 8, 10)),
        }
    ),
    "source-indexed-unit-core-654-08": frozenset(
        {
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (9, (0, 2, 3, 6)),
            (10, (0, 1, 3, 4)),
            (11, (1, 5, 9, 10)),
        }
    ),
    "source-indexed-unit-core-654-09": frozenset(
        {
            (0, (1, 2, 3, 4)),
            (2, (0, 1, 10, 11)),
            (8, (0, 3, 6, 9)),
            (9, (4, 6, 8, 10)),
            (10, (0, 1, 5, 8)),
            (11, (1, 6, 9, 10)),
        }
    ),
    "source-indexed-unit-core-654-10": frozenset(
        {
            (1, (0, 3, 7, 8, 9)),
            (3, (1, 4, 5, 9)),
            (7, (3, 6, 9, 10)),
            (9, (2, 5, 8, 10)),
            (10, (0, 5, 6, 11)),
            (11, (1, 5, 7, 10)),
        }
    ),
    "source-indexed-unit-core-654-11": frozenset(
        {
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (7, (2, 5, 9, 11)),
            (9, (0, 5, 6, 8)),
            (10, (3, 6, 7, 11)),
            (11, (1, 4, 8, 10)),
        }
    ),
    "source-indexed-unit-core-654-12": frozenset(
        {
            (0, (1, 3, 4, 6)),
            (3, (0, 1, 2, 11)),
            (9, (0, 3, 8, 10)),
            (10, (3, 5, 9, 11)),
            (11, (0, 1, 7, 9)),
        }
    ),
    "source-indexed-unit-core-654-13": frozenset(
        {
            (1, (0, 3, 6, 7)),
            (6, (1, 5, 7, 8)),
            (7, (0, 4, 8, 10)),
            (8, (1, 4, 7, 11)),
            (11, (1, 4, 6, 9)),
        }
    ),
    "source-indexed-unit-core-654-14": frozenset(
        {
            (0, (1, 2, 3, 4)),
            (2, (0, 1, 10, 11)),
            (3, (1, 5, 6, 9)),
            (4, (2, 3, 7, 10)),
            (5, (2, 4, 6, 11)),
            (6, (4, 5, 9, 10)),
        }
    ),
    "source-indexed-unit-core-654-15": frozenset(
        {
            (0, (1, 3, 4, 6)),
            (1, (2, 4, 7, 10)),
            (3, (0, 1, 2, 11)),
            (4, (2, 5, 7, 8)),
            (5, (3, 4, 7, 11)),
            (11, (0, 1, 7, 9)),
        }
    ),
    "source-indexed-unit-core-654-17": frozenset(
        {
            (0, (1, 3, 6, 9)),
            (1, (2, 4, 6, 10)),
            (2, (5, 8, 9, 10, 11)),
            (3, (0, 1, 2, 11)),
            (5, (0, 3, 4, 10)),
            (6, (3, 5, 7, 11)),
        }
    ),
    "source-indexed-unit-core-654-18": frozenset(
        {
            (0, (1, 2, 5, 10)),
            (1, (2, 4, 6, 8)),
            (2, (0, 7, 8, 9, 10)),
            (3, (0, 1, 6, 11)),
            (5, (3, 4, 6, 10)),
            (6, (2, 3, 8, 11)),
        }
    ),
    "source-indexed-unit-core-654-19": frozenset(
        {
            (0, (1, 6, 7, 11)),
            (5, (0, 1, 3, 9, 11)),
            (7, (5, 8, 10, 11)),
            (8, (3, 6, 7, 10)),
            (9, (1, 4, 8, 10)),
            (11, (0, 4, 9, 10)),
        }
    ),
    "source-indexed-unit-core-654-20": frozenset(
        {
            (0, (2, 3, 6, 8)),
            (1, (0, 3, 5, 7)),
            (4, (0, 1, 2, 3)),
            (5, (0, 4, 6, 10)),
            (6, (1, 4, 5, 9)),
            (7, (1, 6, 8, 10)),
        }
    ),
    "source-indexed-unit-core-654-21": frozenset(
        {
            (0, (1, 3, 5, 9)),
            (3, (0, 1, 2, 11)),
            (5, (3, 4, 8, 11)),
            (7, (1, 5, 6, 8)),
            (8, (3, 6, 9, 11)),
            (11, (1, 2, 6, 7)),
        }
    ),
    "source-indexed-unit-core-654-22": frozenset(
        {
            (1, (0, 4, 8, 10)),
            (2, (1, 3, 5, 8)),
            (3, (1, 4, 9, 11)),
            (4, (2, 6, 7, 9)),
            (7, (1, 2, 3, 4, 10)),
            (10, (0, 1, 6, 9)),
        }
    ),
    "source-indexed-unit-core-654-23": frozenset(
        {
            (0, (1, 2, 4, 9)),
            (1, (0, 4, 7, 10)),
            (2, (5, 8, 9, 10, 11)),
            (4, (2, 6, 7, 9)),
            (5, (1, 4, 7, 8)),
            (7, (0, 5, 6, 8)),
        }
    ),
    "source-indexed-unit-core-654-24": frozenset(
        {
            (0, (1, 2, 4, 5)),
            (1, (4, 7, 8, 9, 10)),
            (3, (1, 5, 6, 8)),
            (4, (0, 3, 6, 9)),
            (5, (3, 4, 7, 11)),
            (7, (0, 4, 6, 8)),
        }
    ),
    "source-indexed-unit-core-654-25": frozenset(
        {
            (1, (0, 6, 7, 8, 9)),
            (7, (3, 4, 6, 8)),
            (8, (2, 6, 9, 10)),
            (9, (0, 1, 5, 6)),
            (10, (1, 3, 8, 11)),
            (11, (1, 4, 7, 10)),
        }
    ),
    "source-indexed-unit-core-654-26": frozenset(
        {
            (0, (1, 2, 6, 8)),
            (1, (0, 3, 6, 7)),
            (2, (0, 5, 8, 10)),
            (4, (0, 1, 2, 3)),
            (5, (1, 4, 6, 11)),
            (6, (3, 5, 8, 11)),
        }
    ),
    "source-indexed-unit-core-654-27": frozenset(
        {
            (0, (1, 3, 6, 9)),
            (1, (4, 7, 8, 9, 10)),
            (3, (1, 5, 6, 8)),
            (4, (2, 3, 5, 10)),
            (5, (0, 4, 6, 7)),
            (9, (0, 3, 5, 7)),
        }
    ),
    "source-indexed-unit-core-654-29": frozenset(
        {
            (0, (1, 4, 10, 11)),
            (2, (0, 3, 4, 7)),
            (3, (4, 5, 8, 9)),
            (4, (1, 5, 7, 10)),
            (5, (0, 1, 2, 8, 11)),
            (11, (0, 3, 6, 8)),
        }
    ),
    "source-indexed-unit-core-654-30": frozenset(
        {
            (0, (3, 4, 6, 11)),
            (1, (0, 3, 7, 8)),
            (2, (0, 5, 8, 11)),
            (3, (2, 7, 9, 10, 11)),
            (4, (0, 1, 2, 3)),
            (8, (1, 4, 7, 10)),
        }
    ),
    "source-indexed-unit-core-654-31": frozenset(
        {
            (0, (1, 6, 9, 11)),
            (1, (2, 3, 7, 11)),
            (3, (0, 4, 6, 7)),
            (4, (0, 1, 8, 10, 11)),
            (11, (0, 3, 6, 10)),
        }
    ),
    "source-indexed-unit-core-654-33": frozenset(
        {
            (0, (1, 3, 5, 10)),
            (1, (0, 3, 4, 11)),
            (2, (0, 1, 5, 9)),
            (3, (2, 5, 8, 11)),
            (4, (2, 3, 6, 9)),
            (5, (1, 4, 6, 8)),
        }
    ),
    "source-indexed-unit-core-654-34": frozenset(
        {
            (0, (1, 4, 10, 11)),
            (1, (6, 7, 9, 11)),
            (2, (0, 3, 4, 7)),
            (4, (1, 5, 7, 10)),
            (5, (0, 1, 2, 8, 11)),
            (11, (0, 3, 8, 10)),
        }
    ),
    "source-indexed-unit-core-654-35": frozenset(
        {
            (0, (2, 6, 10, 11)),
            (1, (0, 2, 3, 7)),
            (2, (1, 4, 7, 10)),
            (3, (1, 5, 8, 11)),
            (4, (3, 5, 7, 10)),
            (5, (0, 1, 6, 10)),
        }
    ),
    "source-indexed-unit-core-654-28": frozenset(
        {
            (0, (3, 5, 7, 10)),
            (1, (0, 6, 7, 8, 9)),
            (2, (0, 4, 10, 11)),
            (3, (4, 5, 8, 11)),
            (4, (2, 3, 5, 9)),
            (5, (1, 2, 8, 10)),
            (9, (0, 1, 5, 6)),
        }
    ),
    "source-indexed-unit-core-654-36": frozenset(
        {
            (0, (1, 2, 7, 11)),
            (6, (1, 4, 5, 7)),
            (7, (1, 6, 8, 9)),
            (8, (2, 5, 7, 10)),
            (9, (1, 4, 8, 10)),
            (10, (4, 5, 6, 11)),
            (11, (0, 7, 8, 10)),
        }
    ),
    "source-indexed-unit-core-654-38": frozenset(
        {
            (0, (1, 2, 6, 8)),
            (4, (0, 1, 2, 3)),
            (6, (0, 4, 5, 8)),
            (7, (2, 5, 6, 10)),
            (8, (1, 4, 7, 9)),
            (9, (3, 4, 6, 7)),
        }
    ),
    "source-indexed-unit-core-654-39": frozenset(
        {
            (0, (1, 6, 8, 11)),
            (6, (1, 5, 8, 9)),
            (7, (4, 6, 8, 10)),
            (8, (4, 5, 7, 11)),
            (9, (2, 5, 8, 10)),
            (11, (0, 4, 7, 9)),
        }
    ),
    "source-indexed-unit-core-654-40": frozenset(
        {
            (1, (0, 5, 7, 8, 9)),
            (6, (2, 3, 5, 9)),
            (7, (2, 5, 8, 11)),
            (8, (6, 7, 9, 10)),
            (9, (1, 4, 5, 10)),
            (10, (0, 2, 3, 6)),
        }
    ),
    "source-indexed-unit-core-654-41": frozenset(
        {
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (8, (3, 6, 7, 9)),
            (9, (0, 2, 3, 4)),
            (10, (0, 1, 5, 6)),
            (11, (1, 3, 8, 10)),
        }
    ),
    "source-indexed-unit-core-654-42": frozenset(
        {
            (0, (1, 2, 7, 11)),
            (1, (0, 3, 5, 8)),
            (2, (3, 6, 7, 9)),
            (3, (0, 4, 9, 10, 11)),
            (4, (0, 1, 2, 3)),
            (6, (1, 4, 5, 7)),
        }
    ),
    "source-indexed-unit-core-654-43": frozenset(
        {
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (8, (6, 7, 9, 11)),
            (9, (0, 2, 3, 4)),
            (10, (0, 1, 5, 6)),
            (11, (1, 3, 7, 10)),
        }
    ),
    "source-indexed-unit-core-654-44": frozenset(
        {
            (0, (1, 2, 6, 8)),
            (1, (2, 5, 7, 9)),
            (2, (3, 5, 8, 11)),
            (3, (0, 6, 9, 10, 11)),
            (4, (0, 1, 2, 3)),
            (6, (0, 4, 5, 8)),
        }
    ),
    "source-indexed-unit-core-654-45": frozenset(
        {
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (8, (2, 6, 9, 11)),
            (10, (0, 1, 5, 6)),
            (11, (1, 3, 9, 10)),
        }
    ),
    "source-indexed-unit-core-654-46": frozenset(
        {
            (0, (1, 8, 9, 11)),
            (1, (0, 4, 6, 11)),
            (6, (4, 5, 8, 10)),
            (8, (4, 7, 9, 11)),
            (9, (1, 4, 5, 7)),
            (11, (2, 3, 6, 7)),
        }
    ),
    "source-indexed-unit-core-654-47": frozenset(
        {
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (8, (2, 4, 9, 11)),
            (9, (0, 2, 3, 6)),
            (10, (0, 1, 5, 6)),
            (11, (4, 5, 9, 10)),
        }
    ),
    "source-indexed-unit-core-654-47-alt": frozenset(
        {
            (0, (3, 4, 8, 10)),
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (4, (1, 3, 5, 7)),
            (5, (1, 4, 6, 8)),
            (7, (2, 5, 8, 10)),
        }
    ),
    "source-indexed-unit-core-654-48": frozenset(
        {
            (1, (0, 4, 7, 8, 9)),
            (3, (1, 5, 6, 7)),
            (7, (2, 6, 9, 11)),
            (8, (1, 3, 7, 9)),
            (9, (0, 3, 4, 5)),
            (11, (1, 4, 6, 10)),
        }
    ),
    "source-indexed-unit-core-654-49": frozenset(
        {
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (7, (2, 5, 8, 10)),
            (9, (0, 2, 3, 6)),
            (10, (0, 1, 5, 6)),
            (11, (4, 5, 9, 10)),
        }
    ),
    "source-indexed-unit-core-654-49-alt": frozenset(
        {
            (0, (3, 4, 7, 10)),
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (4, (1, 3, 5, 7)),
            (5, (1, 4, 6, 9)),
            (7, (2, 5, 8, 10)),
        }
    ),
    "source-indexed-unit-core-654-51": frozenset(
        {
            (3, (1, 4, 9, 11)),
            (4, (2, 3, 5, 11)),
            (6, (1, 4, 5, 7)),
            (7, (2, 6, 8, 11)),
            (8, (2, 3, 4, 9)),
            (9, (0, 4, 6, 7)),
            (11, (0, 1, 6, 9)),
        }
    ),
    "source-indexed-unit-core-654-53": frozenset(
        {
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (7, (2, 5, 8, 10)),
            (10, (0, 1, 5, 6)),
            (11, (4, 5, 7, 10)),
        }
    ),
    "source-indexed-unit-core-654-54": frozenset(
        {
            (0, (1, 3, 6, 9)),
            (1, (4, 7, 8, 9, 10)),
            (3, (1, 5, 6, 8)),
            (8, (0, 6, 7, 9)),
            (9, (2, 3, 8, 10)),
        }
    ),
    "source-indexed-unit-core-654-57": frozenset(
        {
            (0, (1, 3, 6, 9)),
            (1, (4, 7, 8, 9, 10)),
            (2, (0, 1, 10, 11)),
            (4, (2, 3, 9, 11)),
            (6, (2, 4, 5, 10)),
            (10, (0, 4, 6, 11)),
        }
    ),
    "source-indexed-unit-core-654-58": frozenset(
        {
            (0, (2, 3, 6, 11)),
            (1, (0, 3, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (3, (2, 4, 8, 11)),
            (11, (1, 6, 8, 10)),
        }
    ),
    "source-indexed-unit-core-654-59": frozenset(
        {
            (0, (1, 2, 3, 5)),
            (2, (0, 1, 10, 11)),
            (7, (2, 4, 8, 11)),
            (8, (0, 5, 6, 7)),
            (9, (2, 6, 8, 10)),
            (10, (0, 6, 9, 11)),
            (11, (0, 1, 4, 7)),
        }
    ),
    "source-indexed-unit-core-654-60": frozenset(
        {
            (0, (1, 2, 3, 5)),
            (2, (0, 1, 10, 11)),
            (3, (4, 5, 9, 11)),
            (5, (3, 4, 6, 10)),
            (6, (2, 3, 7, 11)),
            (10, (0, 6, 9, 11)),
        }
    ),
    "source-indexed-collision-full-654-12": frozenset(
        {
            (0, (3, 6, 9, 10)),
            (1, (5, 7, 8, 9, 11)),
            (2, (0, 1, 10, 11)),
            (3, (1, 4, 6, 7)),
            (4, (2, 3, 6, 8)),
            (5, (0, 3, 4, 7)),
            (6, (4, 5, 8, 10)),
            (7, (0, 5, 6, 9)),
            (8, (2, 7, 9, 10)),
            (9, (1, 2, 3, 5)),
            (10, (2, 4, 9, 11)),
            (11, (0, 1, 4, 8)),
        }
    ),
    "source-indexed-collision-core-654-09": frozenset(
        {
            (0, (3, 6, 9, 11)),
            (1, (4, 7, 8, 9, 10)),
            (2, (0, 1, 10, 11)),
            (4, (1, 3, 6, 8)),
            (6, (0, 3, 4, 9)),
            (9, (3, 5, 8, 10)),
            (10, (0, 2, 3, 7)),
            (11, (1, 2, 5, 9)),
        }
    ),
    "source-indexed-collision-core-654-12-post": frozenset(
        {
            (0, (3, 4, 8, 10)),
            (1, (5, 7, 8, 9, 11)),
            (2, (0, 1, 10, 11)),
            (8, (2, 7, 9, 10)),
            (10, (0, 1, 3, 7)),
            (11, (1, 4, 5, 10)),
        }
    ),
    "source-indexed-collision-core-654-03": frozenset(
        {
            (0, (3, 4, 7, 10)),
            (1, (0, 5, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (3, (1, 4, 6, 8)),
            (4, (2, 6, 7, 10)),
            (5, (4, 6, 9, 11)),
            (10, (0, 1, 3, 6)),
            (11, (1, 4, 9, 10)),
        }
    ),
    "source-indexed-collision-core-654-10-post": frozenset(
        {
            (0, (3, 5, 9, 10)),
            (1, (4, 7, 8, 9, 11)),
            (2, (0, 1, 10, 11)),
            (9, (2, 3, 8, 11)),
            (10, (0, 1, 3, 7)),
            (11, (1, 4, 5, 10)),
        }
    ),
}


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def card_five_candidates(frame: mc.Frame) -> tuple[frozenset[int], ...]:
    """Pinned five-point rows containing the three strict first-cap points."""

    interior = frozenset(frame.ints["O1"])
    require(len(interior) == 3, "the first opposite cap must have card five")
    return tuple(
        support
        for raw in itertools.combinations(
            (point for point in range(frame.n) if point != FIRST_APEX), 5
        )
        if interior <= (support := frozenset(raw))
        and mc.h1_moser_ok(frame, FIRST_APEX, support)
    )


def merged_metric_rows(
    rows: Sequence[shadow.ClassRow],
) -> tuple[MetricRow, ...]:
    """Deduplicate identical rows while retaining exactness provenance."""

    merged: dict[tuple[int, tuple[int, ...]], bool] = {}
    for row in rows:
        key = row.center, tuple(sorted(row.support))
        merged[key] = merged.get(key, False) or row.exact
    return tuple(
        MetricRow(center, support, exact)
        for (center, support), exact in sorted(merged.items())
    )


def local_exact_qq_nogood(
    rows: Sequence[MetricRow],
) -> str | None:
    """Match a replayed exact-QQ unit or real-infeasible row system."""

    keys = {(row.center, tuple(row.support)) for row in rows}
    return next(
        (name for name, core in LOCAL_EXACT_QQ_NOGOODS.items() if core <= keys),
        None,
    )


def has_exact_qq_core_up_to_relabeling(
    rows: Sequence[MetricRow],
    core: frozenset[tuple[int, tuple[int, ...]]],
) -> bool:
    """Recognize a certified row core under an injective point relabeling.

    A candidate support may contain the relabeled core support as a subset;
    its additional equal-radius equations only strengthen the certified
    contradiction.  The search first embeds the core's row centers and then
    solves the remaining support-point injection by smallest-domain DFS.
    """

    candidate_by_center: dict[int, tuple[frozenset[int], ...]] = {}
    mutable: dict[int, list[frozenset[int]]] = {}
    universe: set[int] = set()
    for row in rows:
        support = frozenset(row.support)
        mutable.setdefault(row.center, []).append(support)
        universe.add(row.center)
        universe.update(support)
    candidate_by_center = {
        center: tuple(supports) for center, supports in mutable.items()
    }

    pattern_support = {
        center: frozenset(support) for center, support in core
    }
    pattern_centers = tuple(
        sorted(
            pattern_support,
            key=lambda center: (
                -len(pattern_support[center]),
                -sum(
                    other in pattern_support[center]
                    for other in pattern_support
                ),
                center,
            ),
        )
    )
    pattern_points = set(pattern_support)
    for support in pattern_support.values():
        pattern_points.update(support)
    if len(pattern_points) > len(universe):
        return False

    center_image: dict[int, int] = {}
    selected_support: dict[int, frozenset[int]] = {}
    used_images: set[int] = set()

    def remaining_points_embed() -> bool:
        remaining = pattern_points - set(center_image)
        image = dict(center_image)
        used = set(used_images)

        def point_domain(point: int) -> set[int]:
            domain = set(universe) - used
            for center, support in pattern_support.items():
                if point in support:
                    domain.intersection_update(selected_support[center])
            return domain

        def assign_points(unassigned: set[int]) -> bool:
            if not unassigned:
                return True
            point = min(unassigned, key=lambda item: (len(point_domain(item)), item))
            domain = point_domain(point)
            if not domain:
                return False
            for target in sorted(domain):
                image[point] = target
                used.add(target)
                if assign_points(unassigned - {point}):
                    return True
                used.remove(target)
                del image[point]
            return False

        return assign_points(set(remaining))

    def assign_centers(index: int) -> bool:
        if index == len(pattern_centers):
            return remaining_points_embed()
        center = pattern_centers[index]
        required_size = len(pattern_support[center])
        for target_center, target_supports in candidate_by_center.items():
            if target_center in used_images:
                continue
            for target_support in target_supports:
                if len(target_support) < required_size:
                    continue
                compatible = True
                for assigned_center, assigned_target in center_image.items():
                    if (
                        assigned_center in pattern_support[center]
                        and assigned_target not in target_support
                    ):
                        compatible = False
                        break
                    if (
                        center in pattern_support[assigned_center]
                        and target_center not in selected_support[assigned_center]
                    ):
                        compatible = False
                        break
                if not compatible:
                    continue
                center_image[center] = target_center
                selected_support[center] = target_support
                used_images.add(target_center)
                if assign_centers(index + 1):
                    return True
                used_images.remove(target_center)
                del selected_support[center]
                del center_image[center]
        return False

    return assign_centers(0)


def has_source_indexed_654_core_up_to_relabeling(
    rows: Sequence[MetricRow],
) -> bool:
    """Recognize the certified ten-equality pattern under injective relabeling."""

    supports_by_center: dict[int, tuple[frozenset[int], ...]] = {}
    mutable: dict[int, list[frozenset[int]]] = {}
    for row in rows:
        mutable.setdefault(row.center, []).append(frozenset(row.support))
    supports_by_center = {
        center: tuple(supports) for center, supports in mutable.items()
    }

    # Pattern labels are A,B,C,D,E,F,G.  Its five circle centers are
    # B,C,E,F,G and its equality classes are:
    # B:{A,C,E}, C:{A,B,F,G}, E:{A,C}, F:{D,E,G}, G:{B,E,F}.
    for b, b_supports in supports_by_center.items():
        for b_support in b_supports:
            for a, c, e in itertools.permutations(b_support, 3):
                if len({a, b, c, e}) != 4:
                    continue
                for c_support in supports_by_center.get(c, ()):
                    if not {a, b} <= c_support:
                        continue
                    for f, g in itertools.permutations(c_support - {a, b}, 2):
                        used = {a, b, c, e, f, g}
                        if len(used) != 6:
                            continue
                        if not any(
                            {a, c} <= support
                            for support in supports_by_center.get(e, ())
                        ):
                            continue
                        if not any(
                            {b, e, f} <= support
                            for support in supports_by_center.get(g, ())
                        ):
                            continue
                        for f_support in supports_by_center.get(f, ()):
                            if not {e, g} <= f_support:
                                continue
                            if f_support - used:
                                return True
    return False


def has_source_indexed_654_02_core_up_to_relabeling(
    rows: Sequence[MetricRow],
) -> bool:
    """Recognize the second certified twelve-equality pattern up to labels."""

    mutable: dict[int, list[frozenset[int]]] = {}
    for row in rows:
        mutable.setdefault(row.center, []).append(frozenset(row.support))
    supports_by_center = {
        center: tuple(supports) for center, supports in mutable.items()
    }

    # Pattern labels are A,B,C,D,E,F,G,H.  Its equality classes are
    # B:{A,C,E,F}, C:{A,B,G,H}, E:{A,C}, F:{A,E},
    # G:{D,F,H}, and H:{B,E,G}.
    for b, b_supports in supports_by_center.items():
        for b_support in b_supports:
            for a, c, e, f in itertools.permutations(b_support, 4):
                if len({a, b, c, e, f}) != 5:
                    continue
                for c_support in supports_by_center.get(c, ()):
                    if not {a, b} <= c_support:
                        continue
                    for g, h in itertools.permutations(c_support - {a, b}, 2):
                        used = {a, b, c, e, f, g, h}
                        if len(used) != 7:
                            continue
                        if not any(
                            {a, c} <= support
                            for support in supports_by_center.get(e, ())
                        ):
                            continue
                        if not any(
                            {a, e} <= support
                            for support in supports_by_center.get(f, ())
                        ):
                            continue
                        if not any(
                            {b, e, g} <= support
                            for support in supports_by_center.get(h, ())
                        ):
                            continue
                        for g_support in supports_by_center.get(g, ()):
                            if not {f, h} <= g_support:
                                continue
                            if g_support - used:
                                return True
    return False


def pseudo_compatible(
    frame: mc.Frame,
    pseudo: shadow.ClassRow,
    row: shadow.ClassRow,
) -> bool:
    """Necessary circle/order constraints involving the five-point row."""

    if len(pseudo.support & row.support) > 2:
        return False
    if row.center in mc.MOSER_SET and not mc.q3.joint_ok(
        pseudo.center,
        pseudo.support,
        row.center,
        row.support,
        frame.caps_int,
    ):
        return False
    return shadow.cross_separation_ok(shadow.hull_order(frame), pseudo, row)


def pseudo_pair_bound_ok(
    pseudo: shadow.ClassRow,
    rows: Sequence[shadow.ClassRow],
) -> bool:
    """No pair in the apex row has three distinct bisector centers."""

    for q, w in itertools.combinations(sorted(pseudo.support), 2):
        centers = {
            row.center for row in rows if {q, w} <= row.support
        }
        centers.add(pseudo.center)
        if len(centers) > 2:
            return False
    return True


@dataclass(frozen=True)
class TargetHit:
    kind: str
    pair: tuple[int, int]
    data: Mapping[str, object]


def first_target_hit(
    frame: mc.Frame,
    pseudo: shadow.ClassRow,
    rows: Sequence[shadow.ClassRow],
) -> TargetHit | None:
    """Return the first accepted producer packet visible in a row prefix."""

    source_rows = {
        int(row.name.split(":", maxsplit=1)[1]): row
        for row in rows
        if row.name.startswith("shell:")
    }
    global_rows = {
        row.center: row for row in rows if row.name.startswith("global:")
    }
    sources = tuple(sorted(pseudo.support - frame.S))
    require(set(source_rows) <= set(sources), "source-row domain drifted")

    for q, w in itertools.combinations(sources, 2):
        # Choice-invariant output: any deletion-critical shell in the surplus
        # cap, at a non-apex center, containing the selected pair.
        for source, row in sorted(source_rows.items()):
            if (
                row.center in frame.S
                and row.center != FIRST_APEX
                and {q, w} <= row.support
            ):
                return TargetHit(
                    "ExistsSurplusPairCriticalBlocker",
                    (q, w),
                    {"source": source, "center": row.center},
                )

        q_row = source_rows.get(q)
        w_row = source_rows.get(w)
        if q_row is None or w_row is None:
            continue
        q_cross = w in q_row.support
        w_cross = q in w_row.support
        if q_row.center != w_row.center and (
            (q_cross and q_row.center in frame.S)
            or (w_cross and w_row.center in frame.S)
            or (q_cross and w_cross)
        ):
            return TargetHit(
                "CardFiveCapOrMutualFields",
                (q, w),
                {
                    "centers": [q_row.center, w_row.center],
                    "cross": [q_cross, w_cross],
                },
            )

        if q_row.center != w_row.center:
            continue
        require(
            q_row.support == w_row.support,
            "coincident deletion-critical rows did not share their support",
        )
        require(q_cross and w_cross, "coincident rows lost the common pair")
        residual = tuple(sorted(q_row.support - {q, w}))
        require(len(residual) == 2, "common four-shell lost its residual pair")
        for x in residual:
            if x == FIRST_APEX:
                # The residual-off-apex-circle theorem excludes this in the
                # live geometry.  Treating it as a target hit is conservative:
                # the pinned apex class itself contains q and w.
                return TargetHit(
                    "CoincidentBlockerResidualMember",
                    (q, w),
                    {"center": q_row.center, "residual": x, "row": "pinned"},
                )
            global_row = global_rows.get(x)
            if global_row is not None and {q, w} <= global_row.support:
                return TargetHit(
                    "CoincidentBlockerResidualMember",
                    (q, w),
                    {
                        "center": q_row.center,
                        "residual": x,
                        "row": global_row.name,
                    },
                )
    return None


def signature(pseudo: shadow.ClassRow, rows: Sequence[shadow.ClassRow]) -> str:
    payload = [
        [row.name, row.center, sorted(row.support), row.exact]
        for row in sorted((pseudo, *rows), key=lambda row: row.name)
    ]
    return hashlib.sha256(
        json.dumps(payload, separators=(",", ":")).encode("utf-8")
    ).hexdigest()


def run_target_smoke_checks() -> None:
    """Hand-check the three target recognizers, including partial prefixes."""

    frame = mc.build_frame(PROFILES["654"])
    pseudo = shadow.ClassRow(
        "pinned:first-apex-card-five",
        FIRST_APEX,
        frozenset({0, 2, 7, 8, 9}),
        exact=True,
    )

    surplus_hit = first_target_hit(
        frame,
        pseudo,
        (
            shadow.ClassRow(
                "shell:0", 3, frozenset({0, 7, 10, 11}), exact=True
            ),
        ),
    )
    require(
        surplus_hit is not None
        and surplus_hit.kind == "ExistsSurplusPairCriticalBlocker",
        "surplus-blocker target smoke check failed",
    )

    mutual_hit = first_target_hit(
        frame,
        pseudo,
        (
            shadow.ClassRow(
                "shell:0", 10, frozenset({0, 3, 4, 7}), exact=True
            ),
            shadow.ClassRow(
                "shell:7", 11, frozenset({0, 5, 6, 7}), exact=True
            ),
        ),
    )
    require(
        mutual_hit is not None
        and mutual_hit.kind == "CardFiveCapOrMutualFields",
        "mutual-incidence target smoke check failed",
    )

    residual_hit = first_target_hit(
        frame,
        pseudo,
        (
            shadow.ClassRow(
                "shell:0", 10, frozenset({0, 3, 4, 7}), exact=True
            ),
            shadow.ClassRow(
                "shell:7", 10, frozenset({0, 3, 4, 7}), exact=True
            ),
            shadow.ClassRow(
                "global:3", 3, frozenset({0, 7, 8, 9}), exact=False
            ),
        ),
    )
    require(
        residual_hit is not None
        and residual_hit.kind == "CoincidentBlockerResidualMember",
        "residual-member target smoke check failed",
    )

    require(
        first_target_hit(
            frame,
            pseudo,
            (
                shadow.ClassRow(
                    "shell:0", 10, frozenset({0, 3, 4, 5}), exact=True
                ),
            ),
        )
        is None,
        "negative partial-prefix target smoke check failed",
    )

    exact_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-654-five-row"]
        )
    )
    require(
        local_exact_qq_nogood(exact_core_rows)
        == "source-indexed-654-five-row",
        "local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(exact_core_rows[:-1]) is None,
        "local exact-QQ no-good negative smoke check failed",
    )
    require(
        has_source_indexed_654_core_up_to_relabeling(exact_core_rows),
        "isomorphic exact-QQ core positive smoke check failed",
    )
    require(
        not has_source_indexed_654_core_up_to_relabeling(exact_core_rows[:-1]),
        "isomorphic exact-QQ core negative smoke check failed",
    )
    second_exact_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-654-six-row-02"]
        )
    )
    require(
        local_exact_qq_nogood(second_exact_core_rows)
        == "source-indexed-654-six-row-02",
        "second local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(second_exact_core_rows[:-1]) is None,
        "second local exact-QQ no-good negative smoke check failed",
    )
    require(
        has_source_indexed_654_02_core_up_to_relabeling(second_exact_core_rows),
        "second isomorphic exact-QQ core positive smoke check failed",
    )
    require(
        not has_source_indexed_654_02_core_up_to_relabeling(
            second_exact_core_rows[:-1]
        ),
        "second isomorphic exact-QQ core negative smoke check failed",
    )
    third_exact_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-654-five-row-03"]
        )
    )
    require(
        local_exact_qq_nogood(third_exact_core_rows)
        == "source-indexed-654-five-row-03",
        "third local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(third_exact_core_rows[:-1]) is None,
        "third local exact-QQ no-good negative smoke check failed",
    )
    fourth_exact_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-654-six-row-04"]
        )
    )
    require(
        local_exact_qq_nogood(fourth_exact_core_rows)
        == "source-indexed-654-six-row-04",
        "fourth local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(fourth_exact_core_rows[:-1]) is None,
        "fourth local exact-QQ no-good negative smoke check failed",
    )
    second_interior_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["interior-bank-unit-core-654-02"]
        )
    )
    require(
        local_exact_qq_nogood(second_interior_unit_core_rows)
        == "interior-bank-unit-core-654-02",
        "second interior-bank unit no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(second_interior_unit_core_rows[:-1]) is None,
        "second interior-bank unit no-good negative smoke check failed",
    )
    fifth_exact_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["interior-bank-unit-core-654-05"]
        )
    )
    require(
        local_exact_qq_nogood(fifth_exact_core_rows)
        == "interior-bank-unit-core-654-05",
        "fifth local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(fifth_exact_core_rows[:-1]) is None,
        "fifth local exact-QQ no-good negative smoke check failed",
    )
    sixth_exact_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["interior-bank-unit-core-654-06"]
        )
    )
    require(
        local_exact_qq_nogood(sixth_exact_core_rows)
        == "interior-bank-unit-core-654-06",
        "sixth local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(sixth_exact_core_rows[:-1]) is None,
        "sixth local exact-QQ no-good negative smoke check failed",
    )
    eighth_interior_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["interior-bank-unit-core-654-08"]
        )
    )
    require(
        local_exact_qq_nogood(eighth_interior_unit_core_rows)
        == "interior-bank-unit-core-654-08",
        "eighth interior-bank unit no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(eighth_interior_unit_core_rows[:-1]) is None,
        "eighth interior-bank unit no-good negative smoke check failed",
    )
    real_infeasible_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["real-infeasible-full-654-01"]
        )
    )
    require(
        local_exact_qq_nogood(real_infeasible_rows)
        == "real-infeasible-full-654-01",
        "real-infeasible exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(real_infeasible_rows[:-1]) is None,
        "real-infeasible exact-QQ no-good negative smoke check failed",
    )
    shared_active_07_08_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS[
                "source-indexed-active-unit-kernel-654-07-08"
            ]
        )
    )
    require(
        local_exact_qq_nogood(shared_active_07_08_rows)
        == "source-indexed-active-unit-kernel-654-07-08",
        "shared 07/08 active-kernel positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(shared_active_07_08_rows[:-1]) is None,
        "shared 07/08 active-kernel negative smoke check failed",
    )
    seventh_exact_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-07"]
        )
    )
    require(
        local_exact_qq_nogood(seventh_exact_core_rows)
        == "source-indexed-unit-core-654-07",
        "seventh local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(seventh_exact_core_rows[:-1]) is None,
        "seventh local exact-QQ no-good negative smoke check failed",
    )
    eighth_exact_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-08"]
        )
    )
    require(
        local_exact_qq_nogood(eighth_exact_core_rows)
        == "source-indexed-unit-core-654-08",
        "eighth local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(eighth_exact_core_rows[:-1]) is None,
        "eighth local exact-QQ no-good negative smoke check failed",
    )
    ninth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-09"]
        )
    )
    require(
        local_exact_qq_nogood(ninth_unit_core_rows)
        == "source-indexed-unit-core-654-09",
        "ninth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(ninth_unit_core_rows[:-1]) is None,
        "ninth unit local exact-QQ no-good negative smoke check failed",
    )
    tenth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-10"]
        )
    )
    require(
        local_exact_qq_nogood(tenth_unit_core_rows)
        == "source-indexed-unit-core-654-10",
        "tenth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(tenth_unit_core_rows[:-1]) is None,
        "tenth unit local exact-QQ no-good negative smoke check failed",
    )
    eleventh_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-11"]
        )
    )
    require(
        local_exact_qq_nogood(eleventh_unit_core_rows)
        == "source-indexed-unit-core-654-11",
        "eleventh unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(eleventh_unit_core_rows[:-1]) is None,
        "eleventh unit local exact-QQ no-good negative smoke check failed",
    )
    twelfth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-12"]
        )
    )
    require(
        local_exact_qq_nogood(twelfth_unit_core_rows)
        == "source-indexed-unit-core-654-12",
        "twelfth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(twelfth_unit_core_rows[:-1]) is None,
        "twelfth unit local exact-QQ no-good negative smoke check failed",
    )
    thirteenth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-13"]
        )
    )
    require(
        local_exact_qq_nogood(thirteenth_unit_core_rows)
        == "source-indexed-unit-core-654-13",
        "thirteenth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(thirteenth_unit_core_rows[:-1]) is None,
        "thirteenth unit local exact-QQ no-good negative smoke check failed",
    )
    fourteenth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-14"]
        )
    )
    require(
        local_exact_qq_nogood(fourteenth_unit_core_rows)
        == "source-indexed-unit-core-654-14",
        "fourteenth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(fourteenth_unit_core_rows[:-1]) is None,
        "fourteenth unit local exact-QQ no-good negative smoke check failed",
    )
    fifteenth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-15"]
        )
    )
    require(
        local_exact_qq_nogood(fifteenth_unit_core_rows)
        == "source-indexed-unit-core-654-15",
        "fifteenth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(fifteenth_unit_core_rows[:-1]) is None,
        "fifteenth unit local exact-QQ no-good negative smoke check failed",
    )
    seventeenth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-17"]
        )
    )
    require(
        local_exact_qq_nogood(seventeenth_unit_core_rows)
        == "source-indexed-unit-core-654-17",
        "seventeenth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(seventeenth_unit_core_rows[:-1]) is None,
        "seventeenth unit local exact-QQ no-good negative smoke check failed",
    )
    eighteenth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-18"]
        )
    )
    require(
        local_exact_qq_nogood(eighteenth_unit_core_rows)
        == "source-indexed-unit-core-654-18",
        "eighteenth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(eighteenth_unit_core_rows[:-1]) is None,
        "eighteenth unit local exact-QQ no-good negative smoke check failed",
    )
    nineteenth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-19"]
        )
    )
    require(
        local_exact_qq_nogood(nineteenth_unit_core_rows)
        == "source-indexed-unit-core-654-19",
        "nineteenth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(nineteenth_unit_core_rows[:-1]) is None,
        "nineteenth unit local exact-QQ no-good negative smoke check failed",
    )
    twentieth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-20"]
        )
    )
    require(
        local_exact_qq_nogood(twentieth_unit_core_rows)
        == "source-indexed-unit-core-654-20",
        "twentieth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(twentieth_unit_core_rows[:-1]) is None,
        "twentieth unit local exact-QQ no-good negative smoke check failed",
    )
    twenty_first_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-21"]
        )
    )
    require(
        local_exact_qq_nogood(twenty_first_unit_core_rows)
        == "source-indexed-unit-core-654-21",
        "twenty-first unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(twenty_first_unit_core_rows[:-1]) is None,
        "twenty-first unit local exact-QQ no-good negative smoke check failed",
    )
    twenty_second_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-22"]
        )
    )
    require(
        local_exact_qq_nogood(twenty_second_unit_core_rows)
        == "source-indexed-unit-core-654-22",
        "twenty-second unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(twenty_second_unit_core_rows[:-1]) is None,
        "twenty-second unit local exact-QQ no-good negative smoke check failed",
    )
    twenty_third_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-23"]
        )
    )
    require(
        local_exact_qq_nogood(twenty_third_unit_core_rows)
        == "source-indexed-unit-core-654-23",
        "twenty-third unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(twenty_third_unit_core_rows[:-1]) is None,
        "twenty-third unit local exact-QQ no-good negative smoke check failed",
    )
    twenty_fourth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-24"]
        )
    )
    require(
        local_exact_qq_nogood(twenty_fourth_unit_core_rows)
        == "source-indexed-unit-core-654-24",
        "twenty-fourth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(twenty_fourth_unit_core_rows[:-1]) is None,
        "twenty-fourth unit local exact-QQ no-good negative smoke check failed",
    )
    twenty_fifth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-25"]
        )
    )
    require(
        local_exact_qq_nogood(twenty_fifth_unit_core_rows)
        == "source-indexed-unit-core-654-25",
        "twenty-fifth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(twenty_fifth_unit_core_rows[:-1]) is None,
        "twenty-fifth unit local exact-QQ no-good negative smoke check failed",
    )
    twenty_sixth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-26"]
        )
    )
    require(
        local_exact_qq_nogood(twenty_sixth_unit_core_rows)
        == "source-indexed-unit-core-654-26",
        "twenty-sixth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(twenty_sixth_unit_core_rows[:-1]) is None,
        "twenty-sixth unit local exact-QQ no-good negative smoke check failed",
    )
    twenty_seventh_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-27"]
        )
    )
    require(
        local_exact_qq_nogood(twenty_seventh_unit_core_rows)
        == "source-indexed-unit-core-654-27",
        "twenty-seventh unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(twenty_seventh_unit_core_rows[:-1]) is None,
        "twenty-seventh unit local exact-QQ no-good negative smoke check failed",
    )
    twenty_ninth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-29"]
        )
    )
    require(
        local_exact_qq_nogood(twenty_ninth_unit_core_rows)
        == "source-indexed-unit-core-654-29",
        "twenty-ninth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(twenty_ninth_unit_core_rows[:-1]) is None,
        "twenty-ninth unit local exact-QQ no-good negative smoke check failed",
    )
    thirtieth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-30"]
        )
    )
    require(
        local_exact_qq_nogood(thirtieth_unit_core_rows)
        == "source-indexed-unit-core-654-30",
        "thirtieth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(thirtieth_unit_core_rows[:-1]) is None,
        "thirtieth unit local exact-QQ no-good negative smoke check failed",
    )
    thirty_first_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-31"]
        )
    )
    require(
        local_exact_qq_nogood(thirty_first_unit_core_rows)
        == "source-indexed-unit-core-654-31",
        "thirty-first unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(thirty_first_unit_core_rows[:-1]) is None,
        "thirty-first unit local exact-QQ no-good negative smoke check failed",
    )
    thirty_third_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-33"]
        )
    )
    require(
        local_exact_qq_nogood(thirty_third_unit_core_rows)
        == "source-indexed-unit-core-654-33",
        "thirty-third unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(thirty_third_unit_core_rows[:-1]) is None,
        "thirty-third unit local exact-QQ no-good negative smoke check failed",
    )
    thirty_fourth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-34"]
        )
    )
    require(
        local_exact_qq_nogood(thirty_fourth_unit_core_rows)
        == "source-indexed-unit-core-654-34",
        "thirty-fourth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(thirty_fourth_unit_core_rows[:-1]) is None,
        "thirty-fourth unit local exact-QQ no-good negative smoke check failed",
    )
    thirty_fifth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-35"]
        )
    )
    require(
        local_exact_qq_nogood(thirty_fifth_unit_core_rows)
        == "source-indexed-unit-core-654-35",
        "thirty-fifth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(thirty_fifth_unit_core_rows[:-1]) is None,
        "thirty-fifth unit local exact-QQ no-good negative smoke check failed",
    )
    twenty_eighth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-28"]
        )
    )
    require(
        local_exact_qq_nogood(twenty_eighth_unit_core_rows)
        == "source-indexed-unit-core-654-28",
        "twenty-eighth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(twenty_eighth_unit_core_rows[:-1]) is None,
        "twenty-eighth unit local exact-QQ no-good negative smoke check failed",
    )
    thirty_sixth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-36"]
        )
    )
    require(
        local_exact_qq_nogood(thirty_sixth_unit_core_rows)
        == "source-indexed-unit-core-654-36",
        "thirty-sixth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(thirty_sixth_unit_core_rows[:-1]) is None,
        "thirty-sixth unit local exact-QQ no-good negative smoke check failed",
    )
    thirty_eighth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-38"]
        )
    )
    require(
        local_exact_qq_nogood(thirty_eighth_unit_core_rows)
        == "source-indexed-unit-core-654-38",
        "thirty-eighth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(thirty_eighth_unit_core_rows[:-1]) is None,
        "thirty-eighth unit local exact-QQ no-good negative smoke check failed",
    )
    thirty_ninth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-39"]
        )
    )
    require(
        local_exact_qq_nogood(thirty_ninth_unit_core_rows)
        == "source-indexed-unit-core-654-39",
        "thirty-ninth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(thirty_ninth_unit_core_rows[:-1]) is None,
        "thirty-ninth unit local exact-QQ no-good negative smoke check failed",
    )
    fortieth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-40"]
        )
    )
    require(
        local_exact_qq_nogood(fortieth_unit_core_rows)
        == "source-indexed-unit-core-654-40",
        "fortieth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(fortieth_unit_core_rows[:-1]) is None,
        "fortieth unit local exact-QQ no-good negative smoke check failed",
    )
    forty_first_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-41"]
        )
    )
    require(
        local_exact_qq_nogood(forty_first_unit_core_rows)
        == "source-indexed-unit-core-654-41",
        "forty-first unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(forty_first_unit_core_rows[:-1]) is None,
        "forty-first unit local exact-QQ no-good negative smoke check failed",
    )
    forty_second_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-42"]
        )
    )
    require(
        local_exact_qq_nogood(forty_second_unit_core_rows)
        == "source-indexed-unit-core-654-42",
        "forty-second unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(forty_second_unit_core_rows[:-1]) is None,
        "forty-second unit local exact-QQ no-good negative smoke check failed",
    )
    forty_third_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-43"]
        )
    )
    require(
        local_exact_qq_nogood(forty_third_unit_core_rows)
        == "source-indexed-unit-core-654-43",
        "forty-third unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(forty_third_unit_core_rows[:-1]) is None,
        "forty-third unit local exact-QQ no-good negative smoke check failed",
    )
    forty_fourth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-44"]
        )
    )
    require(
        local_exact_qq_nogood(forty_fourth_unit_core_rows)
        == "source-indexed-unit-core-654-44",
        "forty-fourth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(forty_fourth_unit_core_rows[:-1]) is None,
        "forty-fourth unit local exact-QQ no-good negative smoke check failed",
    )
    forty_fifth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-45"]
        )
    )
    require(
        local_exact_qq_nogood(forty_fifth_unit_core_rows)
        == "source-indexed-unit-core-654-45",
        "forty-fifth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(forty_fifth_unit_core_rows[:-1]) is None,
        "forty-fifth unit local exact-QQ no-good negative smoke check failed",
    )
    forty_sixth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-46"]
        )
    )
    require(
        local_exact_qq_nogood(forty_sixth_unit_core_rows)
        == "source-indexed-unit-core-654-46",
        "forty-sixth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(forty_sixth_unit_core_rows[:-1]) is None,
        "forty-sixth unit local exact-QQ no-good negative smoke check failed",
    )
    forty_seventh_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-47"]
        )
    )
    require(
        local_exact_qq_nogood(forty_seventh_unit_core_rows)
        == "source-indexed-unit-core-654-47",
        "forty-seventh unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(forty_seventh_unit_core_rows[:-1]) is None,
        "forty-seventh unit local exact-QQ no-good negative smoke check failed",
    )
    forty_seventh_alt_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-47-alt"]
        )
    )
    require(
        local_exact_qq_nogood(forty_seventh_alt_unit_core_rows)
        == "source-indexed-unit-core-654-47-alt",
        "forty-seventh alternate unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(forty_seventh_alt_unit_core_rows[:-1]) is None,
        "forty-seventh alternate unit local exact-QQ no-good negative smoke check failed",
    )
    forty_eighth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-48"]
        )
    )
    require(
        local_exact_qq_nogood(forty_eighth_unit_core_rows)
        == "source-indexed-unit-core-654-48",
        "forty-eighth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(forty_eighth_unit_core_rows[:-1]) is None,
        "forty-eighth unit local exact-QQ no-good negative smoke check failed",
    )
    forty_ninth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-49"]
        )
    )
    require(
        local_exact_qq_nogood(forty_ninth_unit_core_rows)
        == "source-indexed-unit-core-654-49",
        "forty-ninth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(forty_ninth_unit_core_rows[:-1]) is None,
        "forty-ninth unit local exact-QQ no-good negative smoke check failed",
    )
    forty_ninth_alt_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-49-alt"]
        )
    )
    require(
        local_exact_qq_nogood(forty_ninth_alt_unit_core_rows)
        == "source-indexed-unit-core-654-49-alt",
        "forty-ninth alternate unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(forty_ninth_alt_unit_core_rows[:-1]) is None,
        "forty-ninth alternate unit local exact-QQ no-good negative smoke check failed",
    )
    fifty_first_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-51"]
        )
    )
    require(
        local_exact_qq_nogood(fifty_first_unit_core_rows)
        == "source-indexed-unit-core-654-51",
        "fifty-first unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(fifty_first_unit_core_rows[:-1]) is None,
        "fifty-first unit local exact-QQ no-good negative smoke check failed",
    )
    fifty_third_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-53"]
        )
    )
    require(
        local_exact_qq_nogood(fifty_third_unit_core_rows)
        == "source-indexed-unit-core-654-53",
        "fifty-third unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(fifty_third_unit_core_rows[:-1]) is None,
        "fifty-third unit local exact-QQ no-good negative smoke check failed",
    )
    fifty_fourth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-54"]
        )
    )
    require(
        local_exact_qq_nogood(fifty_fourth_unit_core_rows)
        == "source-indexed-unit-core-654-54",
        "fifty-fourth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(fifty_fourth_unit_core_rows[:-1]) is None,
        "fifty-fourth unit local exact-QQ no-good negative smoke check failed",
    )
    fifty_seventh_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-57"]
        )
    )
    require(
        local_exact_qq_nogood(fifty_seventh_unit_core_rows)
        == "source-indexed-unit-core-654-57",
        "fifty-seventh unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(fifty_seventh_unit_core_rows[:-1]) is None,
        "fifty-seventh unit local exact-QQ no-good negative smoke check failed",
    )
    fifty_eighth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-58"]
        )
    )
    require(
        local_exact_qq_nogood(fifty_eighth_unit_core_rows)
        == "source-indexed-unit-core-654-58",
        "fifty-eighth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(fifty_eighth_unit_core_rows[:-1]) is None,
        "fifty-eighth unit local exact-QQ no-good negative smoke check failed",
    )
    fifty_ninth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-59"]
        )
    )
    require(
        local_exact_qq_nogood(fifty_ninth_unit_core_rows)
        == "source-indexed-unit-core-654-59",
        "fifty-ninth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(fifty_ninth_unit_core_rows[:-1]) is None,
        "fifty-ninth unit local exact-QQ no-good negative smoke check failed",
    )
    sixtieth_unit_core_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-60"]
        )
    )
    require(
        local_exact_qq_nogood(sixtieth_unit_core_rows)
        == "source-indexed-unit-core-654-60",
        "sixtieth unit local exact-QQ no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(sixtieth_unit_core_rows[:-1]) is None,
        "sixtieth unit local exact-QQ no-good negative smoke check failed",
    )
    twelfth_collision_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-collision-full-654-12"]
        )
    )
    require(
        local_exact_qq_nogood(twelfth_collision_rows)
        == "source-indexed-collision-full-654-12",
        "twelfth collision no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(twelfth_collision_rows[:-1]) is None,
        "twelfth collision no-good negative smoke check failed",
    )
    ninth_collision_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-collision-core-654-09"]
        )
    )
    require(
        local_exact_qq_nogood(ninth_collision_rows)
        == "source-indexed-collision-core-654-09",
        "ninth collision no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(ninth_collision_rows[:-1]) is None,
        "ninth collision no-good negative smoke check failed",
    )
    twelfth_post_collision_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS[
                "source-indexed-collision-core-654-12-post"
            ]
        )
    )
    require(
        local_exact_qq_nogood(twelfth_post_collision_rows)
        == "source-indexed-collision-core-654-12-post",
        "twelfth post-collision no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(twelfth_post_collision_rows[:-1]) is None,
        "twelfth post-collision no-good negative smoke check failed",
    )
    third_collision_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-collision-core-654-03"]
        )
    )
    require(
        local_exact_qq_nogood(third_collision_rows)
        == "source-indexed-collision-core-654-03",
        "third collision no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(third_collision_rows[:-1]) is None,
        "third collision no-good negative smoke check failed",
    )
    tenth_post_collision_rows = tuple(
        MetricRow(center, support, exact=False)
        for center, support in sorted(
            LOCAL_EXACT_QQ_NOGOODS[
                "source-indexed-collision-core-654-10-post"
            ]
        )
    )
    require(
        local_exact_qq_nogood(tenth_post_collision_rows)
        == "source-indexed-collision-core-654-10-post",
        "tenth post-collision no-good positive smoke check failed",
    )
    require(
        local_exact_qq_nogood(tenth_post_collision_rows[:-1]) is None,
        "tenth post-collision no-good negative smoke check failed",
    )
    for name, exact_core_rows in (
        ("source-indexed-654-five-row-03", third_exact_core_rows),
        ("source-indexed-654-six-row-04", fourth_exact_core_rows),
        ("interior-bank-unit-core-654-02", second_interior_unit_core_rows),
        ("interior-bank-unit-core-654-05", fifth_exact_core_rows),
        ("interior-bank-unit-core-654-06", sixth_exact_core_rows),
        ("interior-bank-unit-core-654-08", eighth_interior_unit_core_rows),
        (
            "source-indexed-active-unit-kernel-654-07-08",
            shared_active_07_08_rows,
        ),
        ("source-indexed-unit-core-654-07", seventh_exact_core_rows),
        ("source-indexed-unit-core-654-08", eighth_exact_core_rows),
        ("source-indexed-unit-core-654-09", ninth_unit_core_rows),
        ("source-indexed-unit-core-654-10", tenth_unit_core_rows),
        ("source-indexed-unit-core-654-11", eleventh_unit_core_rows),
        ("source-indexed-unit-core-654-12", twelfth_unit_core_rows),
        ("source-indexed-unit-core-654-13", thirteenth_unit_core_rows),
        ("source-indexed-unit-core-654-14", fourteenth_unit_core_rows),
        ("source-indexed-unit-core-654-15", fifteenth_unit_core_rows),
        ("source-indexed-unit-core-654-17", seventeenth_unit_core_rows),
        ("source-indexed-unit-core-654-18", eighteenth_unit_core_rows),
        ("source-indexed-unit-core-654-19", nineteenth_unit_core_rows),
        ("source-indexed-unit-core-654-20", twentieth_unit_core_rows),
        ("source-indexed-unit-core-654-21", twenty_first_unit_core_rows),
        ("source-indexed-unit-core-654-22", twenty_second_unit_core_rows),
        ("source-indexed-unit-core-654-23", twenty_third_unit_core_rows),
        ("source-indexed-unit-core-654-24", twenty_fourth_unit_core_rows),
        ("source-indexed-unit-core-654-25", twenty_fifth_unit_core_rows),
        ("source-indexed-unit-core-654-26", twenty_sixth_unit_core_rows),
        ("source-indexed-unit-core-654-27", twenty_seventh_unit_core_rows),
        ("source-indexed-unit-core-654-29", twenty_ninth_unit_core_rows),
        ("source-indexed-unit-core-654-30", thirtieth_unit_core_rows),
        ("source-indexed-unit-core-654-31", thirty_first_unit_core_rows),
        ("source-indexed-unit-core-654-33", thirty_third_unit_core_rows),
        ("source-indexed-unit-core-654-34", thirty_fourth_unit_core_rows),
        ("source-indexed-unit-core-654-35", thirty_fifth_unit_core_rows),
        ("source-indexed-unit-core-654-28", twenty_eighth_unit_core_rows),
        ("source-indexed-unit-core-654-36", thirty_sixth_unit_core_rows),
        ("source-indexed-unit-core-654-38", thirty_eighth_unit_core_rows),
        ("source-indexed-unit-core-654-39", thirty_ninth_unit_core_rows),
        ("source-indexed-unit-core-654-40", fortieth_unit_core_rows),
        ("source-indexed-unit-core-654-41", forty_first_unit_core_rows),
        ("source-indexed-unit-core-654-42", forty_second_unit_core_rows),
        ("source-indexed-unit-core-654-43", forty_third_unit_core_rows),
        ("source-indexed-unit-core-654-44", forty_fourth_unit_core_rows),
        ("source-indexed-unit-core-654-45", forty_fifth_unit_core_rows),
        ("source-indexed-unit-core-654-46", forty_sixth_unit_core_rows),
        ("source-indexed-unit-core-654-47", forty_seventh_unit_core_rows),
        (
            "source-indexed-unit-core-654-47-alt",
            forty_seventh_alt_unit_core_rows,
        ),
        ("source-indexed-unit-core-654-48", forty_eighth_unit_core_rows),
        ("source-indexed-unit-core-654-49", forty_ninth_unit_core_rows),
        ("source-indexed-unit-core-654-49-alt", forty_ninth_alt_unit_core_rows),
        ("source-indexed-unit-core-654-51", fifty_first_unit_core_rows),
        ("source-indexed-unit-core-654-53", fifty_third_unit_core_rows),
        ("source-indexed-unit-core-654-54", fifty_fourth_unit_core_rows),
        ("source-indexed-unit-core-654-57", fifty_seventh_unit_core_rows),
        ("source-indexed-unit-core-654-58", fifty_eighth_unit_core_rows),
        ("source-indexed-unit-core-654-59", fifty_ninth_unit_core_rows),
        ("source-indexed-unit-core-654-60", sixtieth_unit_core_rows),
        ("source-indexed-collision-core-654-09", ninth_collision_rows),
        (
            "source-indexed-collision-core-654-12-post",
            twelfth_post_collision_rows,
        ),
        ("source-indexed-collision-core-654-03", third_collision_rows),
        (
            "source-indexed-collision-core-654-10-post",
            tenth_post_collision_rows,
        ),
        ("source-indexed-collision-full-654-12", twelfth_collision_rows),
    ):
        core = LOCAL_EXACT_QQ_NOGOODS[name]
        relabel = {point: (5 * point + 1) % 12 for point in range(12)}
        relabeled_rows = tuple(
            MetricRow(
                relabel[center],
                tuple(sorted(relabel[point] for point in support)),
                exact=False,
            )
            for center, support in core
        )
        require(
            has_exact_qq_core_up_to_relabeling(exact_core_rows, core),
            f"generic isomorphic exact-QQ core positive smoke check failed: {name}",
        )
        require(
            has_exact_qq_core_up_to_relabeling(relabeled_rows, core),
            f"generic relabeled exact-QQ core smoke check failed: {name}",
        )
        require(
            not has_exact_qq_core_up_to_relabeling(exact_core_rows[:-1], core),
            f"generic isomorphic exact-QQ core negative smoke check failed: {name}",
        )


def solve_support(
    frame: mc.Frame,
    candidates: Mapping[int, Sequence[frozenset[int]]],
    support: frozenset[int],
    *,
    max_nodes: int,
) -> dict[str, object]:
    pseudo = shadow.ClassRow(
        "pinned:first-apex-card-five", FIRST_APEX, support, exact=True
    )
    sources = tuple(sorted(support - frame.S))
    require(len(sources) >= 4, "card five did not leave four off-surplus points")

    shell_rows = tuple(
        shadow.ChoiceRow(
            f"shell:{source}",
            tuple(
                choice
                for choice in critical_shell_choices(frame, candidates, source)
                if choice.center != FIRST_APEX
            ),
            exact=True,
        )
        for source in sources
    )
    global_rows = tuple(
        shadow.ChoiceRow(
            f"global:{center}",
            tuple(
                shadow.RowChoice(center, row_support)
                for row_support in candidates[center]
            ),
            exact=False,
        )
        for center in range(frame.n)
        if center != FIRST_APEX
    )
    source_by_row = {
        f"shell:{source}": source for source in sources
    }
    no_qfree = no_qfree_compatibility(source_by_row)
    rejected_prefixes: Counter[str] = Counter()
    rejected_complete_assignments: Counter[str] = Counter()
    retained: dict[str, object] = {}

    @lru_cache(maxsize=None)
    def prefix_metric_core_stage(
        metric_rows: tuple[MetricRow, ...],
    ) -> str | None:
        detection = _formalized_metric_core(
            metric_rows,
            frame.n,
            shadow.hull_order(frame),
            include_extended=False,
            include_ordered=False,
        )
        return None if detection is None else str(detection["stage"])

    def prefix_ok(rows: Sequence[shadow.ClassRow]) -> bool:
        if not all(pseudo_compatible(frame, pseudo, row) for row in rows):
            rejected_prefixes["pinned-row-compatibility"] += 1
            return False
        if not pseudo_pair_bound_ok(pseudo, rows):
            rejected_prefixes["pinned-pair-bound"] += 1
            return False
        hit = first_target_hit(frame, pseudo, rows)
        if hit is not None:
            rejected_prefixes[f"target:{hit.kind}"] += 1
            return False
        metric_rows = merged_metric_rows((pseudo, *rows))
        local_nogood = local_exact_qq_nogood(metric_rows)
        if local_nogood is not None:
            rejected_prefixes[f"exact-qq-local:{local_nogood}"] += 1
            return False
        stage = prefix_metric_core_stage(metric_rows)
        if stage is not None:
            rejected_prefixes[stage] += 1
            return False
        return True

    def complete_ok(rows: Sequence[shadow.ClassRow]) -> bool:
        metric_rows = merged_metric_rows((pseudo, *rows))
        detection = _formalized_metric_core(
            metric_rows,
            frame.n,
            shadow.hull_order(frame),
            include_extended=True,
            include_ordered=True,
        )
        if detection is not None:
            rejected_complete_assignments[str(detection["stage"])] += 1
            return False
        hit = first_target_hit(frame, pseudo, rows)
        if hit is not None:
            rejected_complete_assignments[f"target:{hit.kind}"] += 1
            return False
        if has_source_indexed_654_core_up_to_relabeling(metric_rows):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-654-isomorphic-five-row"
            ] += 1
            return False
        if has_source_indexed_654_02_core_up_to_relabeling(metric_rows):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-654-isomorphic-six-row-02"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-654-five-row-03"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-654-isomorphic-five-row-03"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-654-six-row-04"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-654-isomorphic-six-row-04"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["interior-bank-unit-core-654-02"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:interior-bank-isomorphic-unit-core-654-02"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["interior-bank-unit-core-654-05"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:interior-bank-isomorphic-unit-core-654-05"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["interior-bank-unit-core-654-06"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:interior-bank-isomorphic-unit-core-654-06"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["interior-bank-unit-core-654-08"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:interior-bank-isomorphic-unit-core-654-08"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS[
                "source-indexed-active-unit-kernel-654-07-08"
            ],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-active-kernel-654-07-08"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-07"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-07"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-08"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-08"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-09"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-09"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-10"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-10"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-11"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-11"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-12"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-12"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-13"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-13"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-14"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-14"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-15"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-15"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-17"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-17"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-18"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-18"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-19"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-19"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-20"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-20"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-21"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-21"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-22"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-22"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-23"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-23"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-24"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-24"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-25"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-25"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-26"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-26"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-27"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-27"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-29"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-29"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-30"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-30"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-31"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-31"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-33"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-33"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-34"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-34"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-35"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-35"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-28"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-28"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-36"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-36"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-38"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-38"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-39"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-39"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-40"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-40"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-41"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-41"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-42"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-42"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-43"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-43"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-44"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-44"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-45"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-45"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-46"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-46"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-47"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-47"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-47-alt"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-47-alt"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-48"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-48"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-49"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-49"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-49-alt"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-49-alt"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-51"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-51"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-53"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-53"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-54"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-54"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-57"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-57"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-58"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-58"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-59"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-59"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-unit-core-654-60"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-unit-core-654-60"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-collision-core-654-09"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-collision-core-654-09"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-collision-core-654-03"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-collision-core-654-03"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS[
                "source-indexed-collision-core-654-10-post"
            ],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-collision-core-654-10-post"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS[
                "source-indexed-collision-core-654-12-post"
            ],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-collision-core-654-12-post"
            ] += 1
            return False
        if has_exact_qq_core_up_to_relabeling(
            metric_rows,
            LOCAL_EXACT_QQ_NOGOODS["source-indexed-collision-full-654-12"],
        ):
            rejected_complete_assignments[
                "exact-qq-local:source-indexed-isomorphic-collision-full-654-12"
            ] += 1
            return False
        retained["rows"] = tuple(rows)
        return True

    result = shadow.solve_choice_rows(
        frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=(),
        choice_rows=(*shell_rows, *global_rows),
        max_nodes=max_nodes,
        want_assignment=True,
        extra_compatible=no_qfree,
        prefix_compatible=prefix_ok,
        complete_compatible=complete_ok,
    )
    report: dict[str, object] = {
        "support": sorted(support),
        "off_surplus_sources": list(sources),
        "status": result["status"],
        "nodes": result["nodes"],
        "max_nodes": max_nodes,
        "rejected_prefixes": dict(sorted(rejected_prefixes.items())),
        "rejected_complete_assignments": dict(
            sorted(rejected_complete_assignments.items())
        ),
        "prefix_metric_core_cache": {
            "hits": prefix_metric_core_stage.cache_info().hits,
            "misses": prefix_metric_core_stage.cache_info().misses,
            "size": prefix_metric_core_stage.cache_info().currsize,
        },
    }
    if result["status"] != "SAT":
        return report

    rows = retained["rows"]
    require(isinstance(rows, tuple), "SAT assignment was not retained")
    ok, reason = shadow.verify_assignment(
        frame,
        set(mc.PROVEN_ROWS),
        rows,
        extra_compatible=no_qfree,
    )
    require(ok, f"independent assignment replay failed: {reason}")
    require(
        all(pseudo_compatible(frame, pseudo, row) for row in rows),
        "pinned-row pairwise replay failed",
    )
    require(
        pseudo_pair_bound_ok(pseudo, rows),
        "pinned-row bisector-center replay failed",
    )
    require(first_target_hit(frame, pseudo, rows) is None, "target survived replay")
    require(
        _formalized_metric_core(
            merged_metric_rows((pseudo, *rows)),
            frame.n,
            shadow.hull_order(frame),
            include_extended=True,
            include_ordered=True,
        )
        is None,
        "formalized metric core survived replay",
    )
    report["assignment_signature_sha256"] = signature(pseudo, rows)
    report["rows"] = [
        {
            "name": row.name,
            "center": row.center,
            "support": sorted(row.support),
            "exact": row.exact,
        }
        for row in sorted(rows, key=lambda row: row.name)
    ]
    return report


def run(
    profile: tuple[int, int, int],
    *,
    max_nodes: int,
    support_offset: int,
    support_limit: int | None,
) -> dict[str, object]:
    frame, candidates = mc.cached_candidate_lists(profile, set(mc.PROVEN_ROWS))
    require(candidates is not None, "candidate bank is empty")
    reports = []
    all_supports = card_five_candidates(frame)
    supports = all_supports[support_offset:]
    if support_limit is not None:
        supports = supports[:support_limit]
    for support in supports:
        report = solve_support(frame, candidates, support, max_nodes=max_nodes)
        reports.append(report)
        if report["status"] == "SAT":
            break
    return {
        "schema": "p97-card-five-source-indexed-target-probe-v2",
        "profile": list(profile),
        "total_support_count": len(all_supports),
        "support_offset": support_offset,
        "supports_tried": len(reports),
        "reports": reports,
        "trust_boundary": (
            "finite cap/incidence/equality shadow; exact source rows are declared; "
            "the local exact-QQ cuts have exactly replayed algebraic certificates; "
            "selected unit cores have generated but unbuilt Lean sources; "
            "SAT is not a Euclidean realization and UNSAT is not a Lean theorem"
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--profile", choices=tuple(PROFILES), required=True)
    parser.add_argument("--max-nodes", type=int, default=500_000)
    parser.add_argument("--support-offset", type=int, default=0)
    parser.add_argument("--support-limit", type=int)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    require(args.max_nodes > 0, "--max-nodes must be positive")
    require(args.support_offset >= 0, "--support-offset must be nonnegative")
    require(
        args.support_limit is None or args.support_limit > 0,
        "--support-limit must be positive",
    )
    if args.check:
        run_target_smoke_checks()
    report = run(
        PROFILES[args.profile],
        max_nodes=args.max_nodes,
        support_offset=args.support_offset,
        support_limit=args.support_limit,
    )
    if args.check:
        require(report["reports"], "no card-five support was tested")
        require(
            all(row["status"] in {"SAT", "UNSAT", "INDETERMINATE"}
                for row in report["reports"]),
            "solver status drifted",
        )
    payload = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(payload, encoding="utf-8")
    print(payload, end="")


if __name__ == "__main__":
    main()
