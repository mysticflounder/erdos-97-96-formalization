# Fishburn–Reeds 1992 — extraction notes (2026-07-28)

Source: P. C. Fishburn, J. A. Reeds, "Unit distances between vertices of
a convex polygon," Comput. Geom.: Theory Appl. 2 (1992) 81–91. Paper on
file locally (Adam's upload 2026-07-28); NOT committed — public repo,
paywalled PDF. Transcription below verified numerically
(orchestrator `fr_check.py`, session scratchpad): all 15 edges satisfy
|d²−1| < 4·10⁻¹², degrees all 3, adjacency slopes match Table 1 col 3.

## What the paper proves (scope precision)

- Theorem 1: there is a convex n-gon with a CUT {A,B} (convex hulls of
  A and B disjoint) such that every a ∈ A has ≥3 unit-distance partners
  in B and vice versa; the smallest n for this CUT property is 20.
- The 20-gon therefore witnesses "every vertex has ≥3 others at the
  SAME unit distance" in convex position. IMPORTANT: n = 20 minimality
  is proven for the CUT version only (the paper calls it "a slightly
  restricted version"); minimality for the unrestricted uniform-distance
  property is NOT claimed.
- Intro also records Danzer's 9-gon (threefold symmetry, distances vary
  by vertex) as the k = 3 non-uniform example — consistent with our
  independently verified 9-point control.

## The 20-gon (numerical, 10+ places; mirror-symmetric)

B-side vertices (i_B = (x_i, y_i)); A-side i_A = (−x_i, y_i). Values are
1000·x and 1000·y (Table 1):

| i | 1000x | 1000y |
|---|---|---|
| 1 | 469.633821777 | −92.982777730 |
| 2 | 471.414237018 | −89.969229800 |
| 3 | 473.126180256 | −87.048665472 |
| 4 | 520.000000000 | 30.000000000 |
| 5 | 520.996246864 | 33.000000000 |
| 6 | 522.000000000 | 36.100000000 |
| 7 | 429.872125856 | 342.595442083 |
| 8 | 429.224646090 | 344.599064292 |
| 9 | 428.539574537 | 346.658610393 |
| 10 | 390.440922261 | 417.185267785 |

Unit-distance edges (i_A, j_B) AND (j_A, i_B) (matrix symmetric), 15
unordered pairs: {1,10},{2,10},{3,10},{1,9},{4,9},{5,9},{2,5},{3,4},
{1,6},{3,7},{5,7},{6,7},{2,8},{4,8},{6,8} — exactly 3 per index.

The coordinates are NUMERICAL (not closed-form): the paper reduces the
15 equations (x_i + x_j)² + (y_j − y_i)² = 1 to a 5-equation "D system"
in the y-gaps γ₁..γ₉ with 4 degrees of freedom, fixes γ₃..γ₆ from
Table 1, and proves a solution exists near γ₇⁰ = 0.002003622209 by a
sign change / continuity (IVT) argument. So exact certification of this
configuration is OPEN WORK, and a natural realization-arm validation
target: seed the D system with Table 1, certify an exact (interval /
algebraic) solution — published ground truth for our pipeline.

## Census-relevant combinatorics (Section 3)

Cut matrices (0-1 matrix of unit incidences across a convex cut) avoid
four forbidden pattern families P1–P4 (Fig. 4): P1 = 2×2 all-ones
(no K_{2,2}), P2 = 5-cell, P3 = 6-cell, P4 = 2k-cell staircases.
Lemma 2 + Table 2 (max 1's g(α,β) in pattern-feasible matrices) give
Theorem 3: pattern-feasible with ≥3 per row/column ⇒ α+β ≥ 20.

- These are candidate CENSUS PRUNING RULES for same-distance cut
  structures (k-general in spirit; stated for unit distance across a
  convex cut). CAVEAT: Lemma 1 (P1–P4 forbidden) is asserted in the
  paper WITH PROOF OMITTED ("straightforward case-by-case") — admission
  into our rule bank requires proving it ourselves. Not admitted.
- Open in the paper: whether every pattern-feasible matrix is a cut
  matrix; the M_k construction would give f(n) ≍ n log n and refute the
  Erdős–Moser linear conjecture (their Conjecture 1/2 discussion).
