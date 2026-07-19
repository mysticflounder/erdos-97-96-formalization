# Full-parent co-radial cardinality split

Date: 2026-07-19

Status: **CORRECTED DISPATCHER KERNEL-CHECKED. THE EXACT-SIX
ALL-REVERSE LEAF IS CLOSED IN PRODUCTION, SO THE MISSING CO-RADIAL OCCURRENCE
IS REQUIRED ONLY WHEN THE SECOND PHYSICAL CAP HAS CARDINALITY AT LEAST SEVEN.**

## Route correction

The minimal existing terminal is

```lean
FirstApexCoRadialTransitionReversePairOccurrence A
```

for

```lean
A : FullParentExactFiveAllReverseData L profile continuation.
```

It asks only for one transition reverse outside pair whose two members are
equidistant from `S.oppApex1`.  Production already proves distinctness,
outside-pair membership, and the immediate contradiction once that equality
is supplied.

The occurrence must not be demanded on exact card six.  Production theorem

```lean
false_of_fullParentExactFiveAllReverseData_of_secondCap_card_eq_six
```

already closes that leaf directly.  The scratch theorem

```lean
false_of_fullParentExactFiveAllReverseData_of_geSevenOccurrence
```

therefore splits on `S.oppCap2.card = 6`, uses the production contradiction
there, and invokes the occurrence producer only under
`7 <= S.oppCap2.card`.  The sibling dispatcher keeps the independent
`FullParentExactFiveMutualData -> False` input explicit.

## Ownership boundary

Session `019f720d` owns the exact-seven boundary/interior shell geometry.
This lane does not duplicate that work.  After the exact-seven leaf is
resolved, the aggregate target owned here is the same occurrence on the
card-at-least-eight surface, retaining the complete `R`/`B`/`L` parent,
global `D.K4`, the common critical system, `D.Minimal`, and `noM44`.

`OrderedCrossRowCore` remains a fallback consumer only.  It requires an
anonymous critical-fiber alignment, an additional cross-row incidence, a
first-apex row equality, and a six-role cyclic order.  The direct co-radial
terminal needs only the one equality that is actually missing.

## Epistemic boundary

- Exact-six direct contradiction: **PROVEN in production**.
- Correct `= 6` / `>= 7` dispatcher: **KERNEL-CHECKED SCRATCH**.
- Exact-seven occurrence/direct contradiction: **owned by another session**.
- Card-at-least-eight aggregate occurrence: **OPEN**.
- Mutual-omission sibling consumer: **OPEN and independent**.

## Validation

The focused Lean check completed successfully with warnings treated as
errors.  Both axiom queries report exactly:

```text
propext, Classical.choice, Quot.sound
```

The source contains no `sorry`, `admit`, declared axiom, `unsafe`, or
`native_decide` escape hatch.
