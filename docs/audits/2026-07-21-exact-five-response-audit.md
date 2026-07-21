# Exact-five response audit

Date: 2026-07-21

## Current live status

The exact-five profile theorem no longer contains a direct `sorry`.  It
reduces to the one live consumer:

```lean
false_of_frontierBiApexRobustExactFiveMutualParentResidual
```

`proof-blueprint` places the exact-five anchor on that declaration.  The
other two live frontier sorries are the original unique-radius arm and the
large-opposite-caps robust arm.

## Production results

`ATail/ParentExactFiveSecondCap.lean` is kernel-checked and source-clean.  It
proves:

- the retained second row lies in the unique ambient five-class;
- at least two of its points are strict physical-cap points;
- the retained first row has at most one strict physical-cap point;
- a physical point exists in the second row but outside the first;
- the strict physical set has exactly three points;
- the global all-reverse omission arm is impossible, since its period-three
  shared-cap-order straddles require at least five strict-cap positions;
- the complementary arbitrary mutual-omission pair is therefore
  unconditional; and
- its endpoints satisfy the sharp retained-row dichotomy stored in
  `FrontierBiApexRobustExactFiveMutualParentResidual`;
- two physical hits in an actual critical row localize its blocker to the
  three-point physical set; and
- the two mutual rows cannot both have two physical hits.  Otherwise their
  blockers swap the mutual endpoints, forcing the physical triple to be
  equilateral and hence non-obtuse, contrary to convex/MEC independence.

The resulting one-hit disjunction is stored as `M.oneHit` in the live
mutual-parent packet.

The production proof never identifies a selected four-row with the complete
five-point ambient class and never reassigns the fixed critical system.

## Remaining surface

Let `a,b` be the mutual endpoints and `c` the third physical vertex.  The
actual rows sourced at `a,b` contain their own source and omit the other
endpoint.  The remaining local cases are:

1. both rows hit only their own source in the physical set;
2. the `a` row also hits `c`, while the `b` row is one-hit; or
3. the mirror asymmetric case.

The double-two-hit pattern is closed in production Lean by
`PhysicalActualCriticalMutualOmissionPair.source_hit_eq_one_or_target_hit_eq_one`.
Thus the packet itself certifies that at least one mutual row is one-hit.

The surviving one-hit surface is genuinely global.  Existing strict-convex
MEC regressions realize the one-row geometry, and a stronger regression with
a total critical system still avoids the missing shared incidence; neither
is a full counterexample because global all-center K4 is absent.  A closer
must visibly use global K4 coupled to the named mutual/parent rows,
`R.minimal`, or construct a complete alternative `IsM44` packet for
`R.noM44`.

## Epistemic status

| Claim | Status |
|---|---|
| Parent-row bridge | **PROVEN IN PRODUCTION LEAN** |
| Exact-five physical set has cardinality three | **PROVEN IN PRODUCTION LEAN** |
| Exact-five all-reverse arm is impossible | **PROVEN IN PRODUCTION LEAN** |
| Exact-five profile reduces to full-parent mutual omission | **PROVEN IN PRODUCTION LEAN** |
| Mutual endpoint retained-row dichotomy | **PROVEN IN PRODUCTION LEAN** |
| Double-two-hit mutual branch contradiction | **PROVEN IN PRODUCTION LEAN** |
| At least one mutual row is one-hit (`M.oneHit`) | **PROVEN IN PRODUCTION LEAN** |
| Both-one-hit and asymmetric one-hit cases | **OPEN** |
| Live exact-five mutual-parent theorem | **OPEN** |
