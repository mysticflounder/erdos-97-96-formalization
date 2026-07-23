# Retained p5 exact-two curvature-clause adapter

Date: 2026-07-23

Status: **GENERIC SOURCE-SEMANTICS THEOREM KERNEL-CHECKED, WARNING-CLEAN.**

## Result

[`P5RetainedOuterArcMasks.lean`](P5RetainedOuterArcMasks.lean) defines
`P5CurvatureSource` from an actual injective CCW `Fin 11` boundary and a
`FaithfulCarrierPattern`.  `ofExactTwoBoundaryCore` is the direct ingress from
the p5 exact-two boundary packet.

For each boundary center, the file defines:

- `selectedRow`, the actual selected equal-radius class from the faithful
  pattern;
- `selectedRowSupport`, its exact four boundary positions;
- `RetainedOuterArc.start`, `turnCount`, and `turnMask` for the left and right
  outer arcs, matching the encoder's reversed-centered cyclic convention; and
- a proof that the mask sum is exactly the production
  `openWindowArcCurvature` of that actual selected row.

The generic clause-family theorem is:

```lean
Problem97.ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource
  .false_of_four_pairwiseDisjoint_retainedOuterArcMasks
```

It takes any four retained center/side arc variables and the six pairwise
mask-disjointness hypotheses, and concludes `False`.  The proof sums the four
strict quarter-turn inequalities over the disjoint masks and uses the
production `ShellCurvatureConstruction.edgeLift_full_turn` aggregate identity.
It is not a conditional `OriginalUniqueFourResidual` consumer and does not
assume an occurrence packet.

This theorem supplies the mathematical semantics needed for every
`direct_no_four_turn_disjoint_outer_arcs` clause.  A separate bulk
source-to-CNF checker may instantiate it for the clause table; no JSON or
solver artifact is trusted by this theorem.

## Theorem-bank preflight

The required current P97 bank inventories and indexed Lean corpus contain no
p5 exact-two turn-mask theorem.  The closest bank hit,
`u5_equilateral_outer_point_metric_incompatibility`, has unrelated
equilateral metric hypotheses.

The implementation reuses:

- `selectedFourClass_has_globalSelectedQuarterTurnArcs`;
- the production selected-row support ordering and transport; and
- `edgeLift_full_turn` from `ShellCurvatureAggregate`.

## Validation

Run:

```bash
bash scratch/atail-force/unique4-exact-two-source-bridge/Curvature/validate.sh
```

The replay acquires the shared Lake build lock, compiles the scratch dependency
and adapter with `-DwarningAsError=true`, and prints the checked axiom closure.
The final run exited zero.

The headline theorem and the exact support/mask bridge use exactly:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean file contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, `unsafe`, warning suppression, or heartbeat override.
