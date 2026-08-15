# Parameterized FreshThird adjacent-grid metric probe

## Outcome

An exact rational witness realizes the frozen direct-0 full geometry + grid-exact arm (members and nonmembers).  This is a realizable local counterexample motif at that stage, not a witness for the later row/slice/Kalmanson packet.

All 4/4 support-subsequence arms have exact rational witnesses.
The eight apex-centered member equalities are eliminated identically by the
rational circle parameterization, and every reported witness is rebuilt and
checked with exact `Fraction` arithmetic.

## ENCODED

- the frozen exact-17 signature from `results.json`;
- the full direct-0 MEC gauge, unit apex circle, disk containment, non-obtuse
  apex triangle, all 680 strict boundary determinants, and all exact cap signs;
- both disjoint four-point first-apex selected supports and their strict radius
  order, with the eight member equations true by construction and every
  first-apex nonmember exclusion checked exactly;
- positive named distances implicitly, since strict convexity makes all labels
  distinct.

## OMITTED

- both exact blocker-centered source rows;
- FreshThird singleton own-cap slices;
- the strict Kalmanson conclusion;
- unsampled incidence signatures, a producer for `SharedBoundaryRadialOrder`,
  any general-cardinality lift, and the P97 headline conclusion.

## Controls and trust boundary

- exact rational-circle identity smoke: pass;
- support projections: exact rational validation, 4/4 pass;
- full arm status: exact rational geometry+grid_exact witness;
- SciPy output is proposal generation only.  Numerical near-models are never
  classified SAT.  The positive verdict, if present, rests on source-auditable
  exact rational substitution rather than a floating-point tolerance.

Machine-readable parameters, margins, optimizer diagnostics, and the frozen
signature are in `parametric_results.json`.
