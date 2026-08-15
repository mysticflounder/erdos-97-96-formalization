# Results

Run date: 2026-08-09.  Z3 and cvc5 were each bounded to 30 seconds per
nonlinear query.  All arithmetic is exact QF_NRA; no floating-point tolerance
was used.

## Outcome

The refined finite ingress has four structurally SAT shared-order arms:
direct 0, direct 2, mirror 1, and mirror 3.  The other four orientation/linear-
order combinations are QF_LIA UNSAT in the corrected joint incidence/boundary
master.

For every structurally SAT arm, the complete 17-point geometry stage is Z3
SAT, and independent exact evaluation of every asserted geometry constraint
passes.  This includes the MEC gauge, non-obtuse apex triangle, all strict
cyclic-order determinants, exact cap classification, and all named squared-
distance links.

The next stage adds only the eight first-apex selected-class member equations
and the radius inequality supplied by the shared-order arm.  It does **not**
yet add nonmember exclusions, source rows, singleton slices, or the strict
Kalmanson conclusion.  All four instances are unresolved:

| arm | geometry (Z3) | member/order stage (Z3) | terminal cvc5 |
|---|---:|---:|---:|
| direct 0 | SAT, 14.138 s | unknown/timeout, 32.514 s | unknown |
| direct 2 | SAT, 25.076 s | unknown/timeout, 31.264 s | unknown |
| mirror 1 | SAT, 25.050 s | unknown/timeout, 31.265 s | unknown |
| mirror 3 | SAT, 25.113 s | unknown/timeout, 31.362 s | timeout |

Therefore this run finds neither an exact Euclidean realization of the whole
named packet nor a metric obstruction.  In particular, no `unknown` above is
reported as UNSAT.  The precise current frontier is already the conjunction
of full source-entitled 17-point cap/MEC geometry with the two four-member
concentric-circle supports and their supplied radial order.

The separate support-subsequence projection keeps only the first apex, the
two disjoint four-point supports, their inherited strict cyclic order, and the
radius inequality.  On separately sampled incidence signatures, both solvers
also return `unknown` in every structurally SAT arm at the same bound.  This
projection is a necessary condition for a full model; SAT would not lift, and
UNKNOWN proves nothing.

## CEGAR refinements and smallest artifact found

The first unrefined replay exposed an immediate two-equation contradiction in
three sampled signatures: a non-grid label was placed in both retained
supports while the two radii were unequal.  The predecessor encoded only
grid-hit disjointness.  This is not a metric obstruction to the live Lean
packet; exact `SelectedClass` semantics itself forbids overlap.  The refined
master now enforces support disjointness before freezing a signature.

The earlier predecessor boundary blocks also used a cap permutation different
from the live normalized packet.  Replaying those blocks with exact cap
geometry made the geometry stage UNSAT.  This too was an ingress artifact, not
a P97 obstruction.  The final run replaces those clauses with corrected live
blocks and obtains independently validated geometry SAT models in all four
surviving arms.

Thus the smallest contradictions found were useful CEGAR diagnostics—support
overlap versus unequal exact classes, and the stale boundary-cap permutation—
but both have been removed from the final source-audited encoding.  No honest
metric obstruction survives the refinements at the present solver bounds.

## Controls and validation

- Fixed rational strictly convex hexagon: Z3 SAT, cvc5 SAT.
- Collinear triple added to that hexagon: Z3 UNSAT, cvc5 UNSAT.
- Coordinate-linked squared distance forced negative: Z3 UNSAT, cvc5 UNSAT.
- Reversed strict turn: Z3 UNSAT, cvc5 UNSAT.
- Every full-stage Z3 SAT model: independent semantic evaluation passed.

Machine-readable details, complete sampled signatures, exact timings, and
omission lists are in `results.json`, `support_probe_results.json`, and the
emitted `.smt2` files.

## Interpretation

This is a bounded producer-side diagnostic.  It does not close FreshThird,
does not produce `SharedBoundaryRadialOrder`, does not establish a universal
exact-17 theorem, and does not lift to general cardinality.  A future exact
UNSAT result must be tied to the emitted source-entitled stage; a future SAT
result must still pass independent model validation and all later exact-class,
row, slice, and Kalmanson stages before it represents the whole encoded packet.
