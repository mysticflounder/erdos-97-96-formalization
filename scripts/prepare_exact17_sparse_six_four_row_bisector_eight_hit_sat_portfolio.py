# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
"""Fresh true-EightHit exact-17 SAT-profile portfolio preparation.

The hardened two-Kalmanson portfolio implementation is evaluated with a
fresh EightHit identity surface.  The source campaign is intentionally not
materialized yet, so repository production remains fail-closed until the
listed campaign, manifest, preparer, checkpoint, and six-cell identity pins
are supplied by the governed production run.
"""

from __future__ import annotations

from pathlib import Path

_BASE = Path(__file__).with_name(
    "prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py"
)
_TEXT = _BASE.read_text(encoding="utf-8")
_REPLACEMENTS = (
    (
        "prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_physical_slice_cells.py",
        "prepare_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_physical_slice_cells.py",
    ),
    (
        "two_kalmanson_physical_slice_cells.py",
        "eight_hit_two_kalmanson_physical_slice_cells.py",
    ),
    (
        "exact17-sparse-six-four-row-bisector-two-kalmanson-sat-portfolio-20260820",
        "exact17-eight-hit-sat-portfolio-20260821",
    ),
    (
        "sat-profile-portfolio-v1",
        "eight-hit-sat-profile-portfolio-v1",
    ),
    ("exact17-two-kalmanson-sat-portfolio", "exact17-eight-hit-sat-portfolio"),
    (
        "ba6113a21f65ce3885d904773210e836f35cc7c3",
        "7097f6541bea6bc667b27786f2d57673610c59fc",
    ),
    ("preparer-20260820", "preparer-20260821"),
    (
        "scratch/runs/exact17-sparse-six-four-row-bisector-two-kalmanson-preparer-20260820/physical-slice-cell-campaign-v1",
        "scratch/runs/exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-preparer-20260821/physical-slice-cell-campaign-v1",
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

# Production inputs are deliberately absent.  Empty values mean “not yet
# authenticated”, not invented stand-ins; require_production_pins_finalized
# rejects repository execution before any path is opened or output is made.
PRODUCTION_PINS_FINALIZED = False
SOURCE_CAMPAIGN_SHA256 = ""
SOURCE_CAMPAIGN_BYTES = 0
SOURCE_RUN_MANIFEST_SHA256 = ""
SOURCE_RUN_MANIFEST_BYTES = 0
SOURCE_PREPARER_COMMIT = ""
SOURCE_PREPARER_SHA256 = ""
SOURCE_PREPARER_BYTES = 0
CHECKPOINT_SHA256 = ""
CHECKPOINT_BYTES = 0
PRODUCTION_CELL_IDENTITIES = {}
FINALIZATION_REQUIRED = (
    "SOURCE_CAMPAIGN_SHA256 and SOURCE_CAMPAIGN_BYTES",
    "SOURCE_RUN_MANIFEST_SHA256 and SOURCE_RUN_MANIFEST_BYTES",
    "SOURCE_PREPARER_COMMIT, SOURCE_PREPARER_SHA256, SOURCE_PREPARER_BYTES",
    "CHECKPOINT_SHA256 and CHECKPOINT_BYTES",
    "PRODUCTION_CELL_IDENTITIES[none,unique-06,...,unique-10]",
)
