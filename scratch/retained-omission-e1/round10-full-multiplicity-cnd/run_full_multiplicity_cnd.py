#!/usr/bin/env python3
"""Schema-v10 fresh-arm probe: full shells, triple capacity, and EDM CND.

This composes the target-specific v7 equality-shell relaxation with the
dimension-free four-point balanced Schoenberg inequalities for squared
Euclidean distances.  The earlier standalone CND experiment did not include
the v4 full-shell, v5 fresh square-separation, v6 cap-localization, or v7
carrier-triple constraints.  This runner is staged for a later ablation after
the v9 strict-between probe, so a new result remains attributable.
"""

from __future__ import annotations

import itertools
import sys
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_VERSION = 10
V7_DIR = HERE.parent / "round7-triple-center-multiplicity"
if str(V7_DIR) not in sys.path:
    sys.path.insert(0, str(V7_DIR))

import run_full_multiplicity_triple_center as v7


class FullMultiplicityCNDEncoding(v7.FullMultiplicityTripleCenterEncoding):
    """Add the three balanced four-point CND inequalities per quadruple."""

    def _build(self) -> None:
        super()._build()
        self._build_four_point_schoenberg_balanced_cnd()

    def _build_four_point_schoenberg_balanced_cnd(self) -> None:
        base = v7.v6.v5.v4.base
        for a, b, c, d in itertools.combinations(base.POINTS, 4):
            for positive, negative in (((a, b), (c, d)),
                                       ((a, c), (b, d)),
                                       ((a, d), (b, c))):
                p0, p1 = positive
                n0, n1 = negative
                self.add(
                    "four_point_schoenberg_balanced_cnd",
                    self.s(p0, p1) + self.s(n0, n1)
                    <= self.s(p0, n0) + self.s(p0, n1)
                    + self.s(p1, n0) + self.s(p1, n1),
                )


def main() -> int:
    """Reuse the v7 fresh-only runner with v10 provenance and CND cuts."""
    v7.HERE = HERE
    v7.SCRIPT_PATH = SCRIPT_PATH
    v7.SCHEMA_VERSION = SCHEMA_VERSION
    v7.FullMultiplicityTripleCenterEncoding = FullMultiplicityCNDEncoding
    return v7.main()


if __name__ == "__main__":
    raise SystemExit(main())
