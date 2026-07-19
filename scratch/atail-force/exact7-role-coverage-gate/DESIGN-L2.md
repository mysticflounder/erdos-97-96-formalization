# L2 design: unused-critical-row dimension (stub, 2026-07-19)

Status: PROVENANCE GROUNDED, encoding not yet designed.  Written at
context wrap; next session starts here.

## Why this dimension is sound for the exact-seven branch

`S.oppCap2` is the closed physical cap `{EA, W, s0, b0, s1, b1, s2}`
(card 7 in this branch, so `6 ≤ S.oppCap2.card` holds outright), and
`nonempty_largeCapUniqueFiveUnusedCriticalRow`
(LargeCapUniqueFive.lean:227) is UNCONDITIONAL given the profile +
shell system — every survivor configuration carries the structure.
Adding it to the census is a sound refinement, not a case split.

## Production facts to encode (all proven)

From `LargeCapUniqueFiveUnusedPoint` (LargeCapUniqueFive.lean:107):
- unused point `u ∈ S.oppCap2` with `u ∉ class(O)` (the exact-five
  class at `oppApex2 = O`).  Censal candidates: `{EA, W, b0, b1}`
  minus whatever the e-pattern places in the class — s0/s1/s2 are
  class members, and class(O) excludes are already in the schemas.
- `class(O) ∩ physical-interior` has card ≥ 3
  (`radiusClass_capInterior_card_ge_three`) — already implicit in the
  fixture ({s0,s1,s2}); assert it when e-extras land physically.

From `LargeCapUniqueFiveUnusedCriticalRow` (LargeCapUniqueFive.lean:204):
- critical row = `CriticalSelectedFourClass D.A u c` with center
  `c = H.centerAt u ≠ O`, `c ∈ D.A`, support ∋ u — a 4-point
  co-radial class at an UNLOCALIZED center (encode c as a floating
  point constrained `c ≠ O`, row = 4 schema points incl. u equidistant
  from c; row members ∈ D.A).
- `actualUnusedRow_physicalInterior_inter_card_le_one`
  (LargeCapUniqueFiveLowHit.lean:46): row support ∩ physical interior
  has card ≤ 1 — the discrete tooth (≥3 class points interior vs ≤1 on
  the row forces ≥2 class points off the row; production consumes this
  as `TwoCommonDeletionSources`, LargeCapUniqueFiveLowHit.lean:142).

## Encoding sketch (to be validated with smoke gates)

1. New floating center `uc` (no placement, only `uc ≠ O` as a point
   disequality — check encoder support for point-inequality between a
   floating point and a named point).
2. `row_eqs` entry `{name: "unu", center: "uc", members: [u, m1, m2,
   m3]}` with u enumerated over the sound candidate set per schema
   (respecting the e-pattern) and m1-m3 fresh or identified per the
   L1-style landing enumeration; support ∩ physical-interior ≤ 1 =
   at most one member placed at an interior site (budget filter at
   enumeration, as in L1a/L1b).
3. Cross with the 324 hard-core survivors first (they take zero
   L1-row damage; any kill here is new coverage).

## Open questions for the design pass

- Semantics of "minus extra-carrying endpoints" (NEXT-STEPS memory):
  reconcile with e-landing sites in ENCODER_FACTS.md before fixing the
  u-candidate set.
- Whether `centerAt u ∈ D.A` should localize `uc` to a block (it IS a
  carrier point — check whether boundary-order membership constrains
  it; putting it in the boundary order may be required for soundness
  of the convex-position constraints).
- Whether the TwoCommonDeletionSources consequence adds censal
  content beyond the ≤1 row-interior budget (read
  LargeCapUniqueFiveLowHit.lean:142-220 fully).
