#!/usr/bin/env python3
"""Schema-v7 target probe: v6 plus global three-point center uniqueness.

For every triple of distinct carrier points, at most one carrier centre can be
equidistant from all three.  This is the existing Lean consequence of convex
independence and
``Problem97.eq_of_equidistant_three_noncollinear``.  The wrapper intentionally
uses unsquared distance equalities: they are the predicates whose Euclidean
interpretation is preserved by the frozen relaxation.
"""

from __future__ import annotations

import itertools
import sys
from pathlib import Path

import z3

HERE = Path(__file__).resolve().parent
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_VERSION = 7
V6_DIR = HERE.parent / "round6-full-multiplicity"
if str(V6_DIR) not in sys.path:
    sys.path.insert(0, str(V6_DIR))

import run_full_multiplicity_caplocal as v6


class FullMultiplicityTripleCenterEncoding(
    v6.FullMultiplicityCapLocalizationEncoding
):
    """Add the global carrier-triple equidistant-centre capacity one."""

    def _build(self) -> None:
        super()._build()
        self._build_triple_center_multiplicity()

    def _build_triple_center_multiplicity(self) -> None:
        base = v6.v5.v4.base
        for a, b, c in itertools.combinations(base.POINTS, 3):
            equidistant_centers = [
                z3.And(
                    self.d(center, a) == self.d(center, b),
                    self.d(center, a) == self.d(center, c),
                )
                for center in base.POINTS
            ]
            self.add(
                "triple_center_multiplicity",
                base.at_most(equidistant_centers, 1),
            )


# The v6 runner executes cases in ProcessPoolExecutor workers.  These
# overrides must therefore be installed at module import time, not only in
# ``main``: workers otherwise retain v6's provenance and encoding class.
v6.HERE = HERE
v6.SCRIPT_PATH = SCRIPT_PATH
v6.SCHEMA_VERSION = SCHEMA_VERSION
v6.FullMultiplicityCapLocalizationEncoding = FullMultiplicityTripleCenterEncoding


def main() -> int:
    """Reuse the audited v6 runner with v7 provenance and encoding class."""
    v6.HERE = HERE
    v6.SCRIPT_PATH = SCRIPT_PATH
    v6.SCHEMA_VERSION = SCHEMA_VERSION
    v6.FullMultiplicityCapLocalizationEncoding = FullMultiplicityTripleCenterEncoding
    return v6.main()


if __name__ == "__main__":
    raise SystemExit(main())
