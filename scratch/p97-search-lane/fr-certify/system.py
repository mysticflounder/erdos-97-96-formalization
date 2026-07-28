"""
system.py -- FR 20-gon polynomial system, chart, and Table-1 data.

UNTRUSTED -- used only by producer.py. The checker (krawczyk.py) does
NOT import this module: it re-derives its own independent copy of the
Table-1 rationals, edge list, and chart, per SPEC.md Sec 3.4
("Independence rule").

Source: scratch/p97-search-lane/fishburn-reeds-notes.md
  - Table 1 (B-side vertices, 1000*x / 1000*y), lines 29-40.
  - 15-pair unit-distance edge list, line 44.
Fishburn, Reeds, "Unit distances between vertices of a convex
polygon," Comput. Geom.: Theory Appl. 2 (1992) 81-91.

Chart (SPEC.md Sec 1) -- fixes the 5-dimensional solution freedom
(1 translation + the paper's 4 DOF): y1 := 0 (a seed-only translation
gauge fix -- x-translation is already pinned by the built-in mirror
symmetry, so only the y-translation remains free); gamma_3..gamma_6
(:= y_{i+1} - y_i) fixed to the Table-1 differences, eliminating
y4, y5, y6, y7 (all affine in y3). Free unknowns, in this order:
  x1..x10, y2, y3, y8, y9, y10   (15 unknowns for 15 equations E_ij).
"""
from __future__ import annotations

from fractions import Fraction

import mpmath as mp

# --- Table 1 (verbatim transcription, "1000*x", "1000*y" strings),
# i = 1..10. This is the PRODUCER's copy; krawczyk.py transcribes its
# own copy independently. ---
TABLE1_1000 = {
    1: ("469.633821777", "-92.982777730"),
    2: ("471.414237018", "-89.969229800"),
    3: ("473.126180256", "-87.048665472"),
    4: ("520.000000000", "30.000000000"),
    5: ("520.996246864", "33.000000000"),
    6: ("522.000000000", "36.100000000"),
    7: ("429.872125856", "342.595442083"),
    8: ("429.224646090", "344.599064292"),
    9: ("428.539574537", "346.658610393"),
    10: ("390.440922261", "417.185267785"),
}

# 15-pair unit-distance edge list (i_A, j_B) & mirror (j_A, i_B); i<j.
EDGE_LIST = [
    (1, 10), (2, 10), (3, 10), (1, 9), (4, 9), (5, 9), (2, 5), (3, 4),
    (1, 6), (3, 7), (5, 7), (6, 7), (2, 8), (4, 8), (6, 8),
]

TABLE1_X = {i: Fraction(sx) / 1000 for i, (sx, sy) in TABLE1_1000.items()}
TABLE1_Y_RAW = {i: Fraction(sy) / 1000 for i, (sx, sy) in TABLE1_1000.items()}

GAMMA3 = TABLE1_Y_RAW[4] - TABLE1_Y_RAW[3]
GAMMA4 = TABLE1_Y_RAW[5] - TABLE1_Y_RAW[4]
GAMMA5 = TABLE1_Y_RAW[6] - TABLE1_Y_RAW[5]
GAMMA6 = TABLE1_Y_RAW[7] - TABLE1_Y_RAW[6]

FREE_VAR_NAMES = [
    "x1", "x2", "x3", "x4", "x5", "x6", "x7", "x8", "x9", "x10",
    "y2", "y3", "y8", "y9", "y10",
]
N = 15

# COORD_X[i] = (var_index, const)         x_i = v[var_index] + const  (const == 0 always)
COORD_X = {i: (i - 1, Fraction(0)) for i in range(1, 11)}

# COORD_Y[i] = (var_index_or_None, const) y_i = v[var_index] + const, or const alone if var_index is None
COORD_Y = {
    1: (None, Fraction(0)),
    2: (10, Fraction(0)),
    3: (11, Fraction(0)),
    4: (11, GAMMA3),
    5: (11, GAMMA3 + GAMMA4),
    6: (11, GAMMA3 + GAMMA4 + GAMMA5),
    7: (11, GAMMA3 + GAMMA4 + GAMMA5 + GAMMA6),
    8: (12, Fraction(0)),
    9: (13, Fraction(0)),
    10: (14, Fraction(0)),
}


def _frac_to_mpf(fr: Fraction) -> mp.mpf:
    return mp.mpf(fr.numerator) / mp.mpf(fr.denominator)


def seed_vector_mpf():
    """Table-1 seed for the 15 free unknowns as mpf, y-shifted so that
    the seed's y1 becomes exactly 0 (SPEC.md Sec 1: 'y1 = 0
    (translation: shift all Table-1 y's by -y1 for the seed)')."""
    y_shift = TABLE1_Y_RAW[1]
    v = [None] * N
    for i in range(1, 11):
        v[i - 1] = _frac_to_mpf(TABLE1_X[i])
    v[10] = _frac_to_mpf(TABLE1_Y_RAW[2] - y_shift)   # y2
    v[11] = _frac_to_mpf(TABLE1_Y_RAW[3] - y_shift)   # y3
    v[12] = _frac_to_mpf(TABLE1_Y_RAW[8] - y_shift)   # y8
    v[13] = _frac_to_mpf(TABLE1_Y_RAW[9] - y_shift)   # y9
    v[14] = _frac_to_mpf(TABLE1_Y_RAW[10] - y_shift)  # y10
    return v


def reconstruct_coords_mpf(v):
    """v: length-15 list of mpf. Returns (x: {1..10: mpf}, y: {1..10: mpf})."""
    x = {}
    y = {}
    for i in range(1, 11):
        xvar, xconst = COORD_X[i]
        x[i] = v[xvar] + _frac_to_mpf(xconst)
        yvar, yconst = COORD_Y[i]
        ybase = v[yvar] if yvar is not None else mp.mpf(0)
        y[i] = ybase + _frac_to_mpf(yconst)
    return x, y
