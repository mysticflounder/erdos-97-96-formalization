# FreshThird FirstNonHit — cap-eight blocker-cycle wave

This is the one corrected bounded wave requested for the sharp
`cap-card = 8 × common-radius × sameBlocker` branch.  It is diagnostic
computation only: it is not a P97 countermodel, a finite-to-universal lift, a
Lean proof, or closure of the FirstNonHit `sorry`.

The source-clean ingress in
`lean/scratch/freshthird-firstnonhit-cap-eight/CapInteriorSix.lean` identifies
the strict cap interior with six named vertices: the two retained pairs and
the canonical third-source pair.  The finite gate enumerates all six-point
pair partitions modulo reversal, then all aliases of the Q blocker and the
two retained-pair actual blockers allowed by the source inequalities.  It
keeps an alias only when each same-cap equidistant center is strictly between
its own pair in cap order.  The surviving aliases are checked by a
gauge-fixed pair-radius/rational-direction QF_NRA model with the common apex
at zero,
three pair equalities, three blocker pair equalities, and pairwise-distinct
common radii.

The wave used 12 solver workers and a five-second per-query limit.  `UNKNOWN`
includes either solver timeout; it is never promoted to `UNSAT`.

The prior unit-circle/cocircular encoding was not source-entitled and is
explicitly retracted; its UNSAT counts are not evidence.
