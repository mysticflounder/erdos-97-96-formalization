# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
"""Run the governed true-EightHit six-cell SAT-profile portfolio.

This is the fresh identity surface for the hardened portfolio driver.  It
retains canary-then-rest ordering, fresh-only PIQD submission, descriptor and
nofollow custody, one core per cell, and full UNSAT replay.  The imported
preparation lane is provisional until the production campaign is materialized.
"""

from __future__ import annotations

from pathlib import Path

_BASE = Path(__file__).with_name(
    "run_piqd_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py"
)
_TEXT = _BASE.read_text(encoding="utf-8")
_REPLACEMENTS = (
    (
        "prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio",
        "prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio",
    ),
    (
        "exact17-sparse-six-four-row-bisector-two-kalmanson-sat-portfolio-20260820",
        "exact17-eight-hit-sat-portfolio-20260821",
    ),
    (
        "sat-profile-portfolio-v1",
        "eight-hit-sat-profile-portfolio-v1",
    ),
    (
        "sparse-six-four-row-bisector-two-kalmanson",
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson",
    ),
    (
        "four-row-bisector-two-kalmanson-next",
        "four-row-bisector-eight-hit-two-kalmanson-next",
    ),
    (
        "scripts/prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
        "scripts/prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
    ),
    (
        "scripts/run_piqd_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
        "scripts/run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
    ),
    (
        "scripts/test_prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
        "scripts/test_prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
    ),
    (
        "scripts/test_run_piqd_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
        "scripts/test_run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
    ),
)
for _old, _new in _REPLACEMENTS:
    _TEXT = _TEXT.replace(_old, _new)
exec(compile(_TEXT, str(_BASE), "exec"), globals(), globals())  # noqa: S102
