# FreshThird crossed shared-fourth convex cap-block probe

## Question

The shared-fourth arm of `FirstFiberCrossedThreeRowExactSupports` supplies
three exact selected-row equalities on six named roles.  In the
first-cap branch of `FreshThirdAlignedDistinctBlockerFirstCapResidual`, the
three row centers lie in the first cap interior while the three named support
points lie outside that cap.  Does this cap-block placement, together with the
two source-proved cross-distance sign splits, force a Kalmanson contradiction?

## Finite projection

The v2 strict-Kalmanson filter left six order/sign arms after restricting the
cyclic order to a contiguous block of the three row centers.  `probe.py`
rechecks those six arms in actual Euclidean coordinates.  For each arm it
requires:

- every ordered triple in the proposed six-point order to have positive
  orientation, so the points form a strict convex hexagon in that order;
- the three exact selected-row distance equalities; and
- the two source-proved cross-distance inequalities with the selected sign
  pattern.

The first two boundary points are normalized to `(0, 0)` and `(1, 0)`.

## Result

All six arms are `SAT` in Z3.  One returned model is rational and was checked
by direct `Fraction` substitution against all 25 emitted constraints:

```text
order = firstCenter, commonCenter, oppositeOutside, sharedFourth,
        commonOutside, oppositeCenter
signs = 00

firstCenter     = (0, 0)
commonCenter    = (1, 0)
oppositeCenter  = (-3/4, 1/4)
commonOutside   = (-1, 1)
oppositeOutside = (1, 1)
sharedFourth    = (0, 2)
```

The other five models are solver SAT results but were not promoted to exact
rational witnesses.  One exact rational witness is enough to refute the
projected implication.

## Trust and scope

This is theorem-discovery evidence only.  It is not a full model of the Lean
source packet, a bounded-obstruction theorem, a universal lift, or a Lean
closure.  It shows specifically that the three crossed-row equalities, the two
cross-distance sign splits, strict convexity, and the contiguous three-center
cap block do **not** imply the desired contradiction.  Any next computation
must add a newly proved global source clause, such as collision-source
provenance, blocker-map saturation, or another carrier-wide K4 consequence;
enlarging the same local Kalmanson projection is not justified.

Run from the repository root with:

```bash
uv run python scratch/p97-consumer-first/freshthird_crossed_shared_fourth_v3_convex_cap_block/probe.py
```

Machine-readable output is in `results.json`.
