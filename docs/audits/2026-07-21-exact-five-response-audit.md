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
- every surviving asymmetric two-hit row has a forced geometric normal
  form: its blocker is the other mutual endpoint, its closed physical-cap
  intersection is exactly its source plus the third physical point, and its
  remaining support is an exact two-point outside pair; and
- that outside pair is immediately contradictory if it is co-radial from
  the first physical apex, by the existing ordered-cap center-uniqueness
  theorem;
- if an initially both-one-hit pair is not already the fully symmetric
  case, any two-hit physical row can be reoriented with one endpoint of the
  original pair to produce the same asymmetric normal form; and
- consequently the only residual without a named asymmetric outside pair is
  `AllPhysicalActualCriticalRowsOneHit`: every one of the three physical
  source rows hits the physical set only at its own source.  Distinct
  physical sources then mutually omit one another and have pairwise distinct
  actual blocker centers.

The resulting one-hit disjunction is stored as `M.oneHit` in the live
mutual-parent packet.

The production proof never identifies a selected four-row with the complete
five-point ambient class and never reassigns the fixed critical system.

## Remaining surface

The remaining local classification is now binary:

1. an asymmetric pair supplies a named exact two-point outside-cap pair; or
2. all three physical actual-critical rows are one-hit.

The asymmetric arm needs an occurrence theorem placing its named outside
pair on a first-apex radius, or a complete alternative `IsM44` packet.  The
all-three-one-hit arm cannot close through a physical-source blocker
collision: the blocker map is injective on those three sources.  It needs a
genuinely global same-cap shared-pair / `CriticalFiberClosingCore` occurrence,
or a complete alternative `IsM44` packet.

The cap-six low-hit/common-deletion normal form does not apply here.  Its
producer requires `6 ≤ S.oppCap2.card`, while this branch has the exact
identity `S.oppCap2.card = 5`; the available six-point bound is on the other
cap.  The retained endpoint-row dichotomy also does not mention the
asymmetric normal form's outside pair.

The surviving occurrence surface is genuinely global.  Existing strict-convex
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
| Asymmetric two-hit outside-pair normal form | **PROVEN IN PRODUCTION LEAN** |
| First-apex co-radial terminal for the asymmetric outside pair | **PROVEN IN PRODUCTION LEAN** |
| Global split: named asymmetric normal form or all three rows one-hit | **PROVEN IN PRODUCTION LEAN** |
| Pairwise omission and blocker-center injectivity on the all-three-one-hit arm | **PROVEN IN PRODUCTION LEAN** |
| Asymmetric outside-pair occurrence | **OPEN** |
| All-three-one-hit `CriticalFiberClosingCore` or alternative-`IsM44` occurrence | **OPEN** |
| Live exact-five mutual-parent theorem | **OPEN** |
