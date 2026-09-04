# Math Skeptic Audit: ThreeEquilateralZigzag

**Target**:

- `lean/Erdos9796Proof/P97/ATail/ThreeEquilateralZigzag.lean`

**Date**: 2026-09-03

**Lane base**: `7bea392c3cdaba14ec88e588241fce9ca99fb070`

**Verdict**: CERTIFIED for the two conditional declarations; NEEDS WORK for
consumer reachability

**Claims audited**: 2

## Summary

The module gives the requested five-point signed-area kernel by reusing the
existing source-clean three-fan collision theorem under an exact permutation
of roles. It also gives a generic row-pattern adapter: ten positive
memberships provide the three equilateral metric packets, and vanishing signed
area contradicts convex independence of the carrier.

Focused and governed Lean checks pass. The target contains no `sorry`, custom
axiom, native computation, solver call, or external-evidence dependency. No
n=11 finite-search completeness or UNSAT statement is made.

## Reuse preflight

- **Candidate**:
  `Problem97.Census554.EqualityCore.threeFan_signedArea2_eq_zero_of_distinct`.
- **Source**:
  `lean/Erdos9796Proof/P97/Census554/EquilateralThreeFanCollision.lean:212`.
- **Indexed source revision**: `0832ec561`; the lane began from shared HEAD
  `7bea392c3cdaba14ec88e588241fce9ca99fb070`.
- **Immediate consumer**:
  `Problem97.ATailThreeEquilateralZigzag.three_equilateral_zigzag_signedArea2_eq_zero`.
- **Role map**: the three-fan roles `(B,O,A,S,Q)` are instantiated as
  `(A,C,E,B,D)`.
- **First missing antecedent**: none for the conditional kernel. The eventual
  n=11 consumer must still produce the ten positive row memberships and the
  three carrier memberships used by the adapter.

## Findings

### F1: Five-point signed-area kernel

- **Location**: `ThreeEquilateralZigzag.lean:27`.
- **Declaration**:
  `Problem97.ATailThreeEquilateralZigzag.three_equilateral_zigzag_signedArea2_eq_zero`.
- **Actual label**: PROVEN — Lean-formalized under its explicit hypotheses.
- **Verdict**: OK.
- **Reason**: the mapped three-fan premises are exactly the three displayed
  equilateral triangles. The sole derived relation, `dist C B = dist C E`,
  follows by distance symmetry and the `ABC`/`ACE` packets. The distinct-apex
  premises map to `B ≠ E` and `A ≠ D`.

### F2: Ten-membership row adapter

- **Location**: `ThreeEquilateralZigzag.lean:55`.
- **Declaration**:
  `Problem97.ATailThreeEquilateralZigzag.false_of_realizes_three_equilateral_zigzag`.
- **Actual label**: PROVEN — Lean-formalized under its explicit hypotheses.
- **Verdict**: OK.
- **Reason**: `EqualityCore.Realizes.equidist` converts the membership groups
  of sizes `3,2,3,2` into the six distance equalities consumed by F1. The
  realization's injectivity transports the six required label inequalities
  to point inequalities. The zero signed area gives collinearity of the three
  terminal points, which `ConvexIndep.not_three_collinear` rejects.

## Trust audit

- Focused check:
  `lake env lean -M 16384 Erdos9796Proof/P97/ATail/ThreeEquilateralZigzag.lean`
  exits successfully.
- Governed check:
  `lake-build Erdos9796Proof.P97.ATail.ThreeEquilateralZigzag` completes
  successfully with 8060 jobs.
- Direct axiom probes for both public declarations report only
  `[propext, Classical.choice, Quot.sound]`.
- The theorem-rooted `proof-blueprint spine` for the row adapter reports 0 open
  nodes among 23 dependencies and kernel completion under the approved core
  axiom set.
- The target scan found no `sorry`, `admit`, custom `axiom`, `native_decide`,
  `unsafe`, `implemented_by`, `extern`, solver, or external-evidence mechanism.
- Imports are acyclic. The imported source-clean dependency chain already
  supplies the public signed-area-to-line bridge; no source-heavy frontier
  module is imported.

## Weasel words

None found.

## Scope conflation

None in the declarations. Both results are conditional and make no claim that
the n=11 finite survivor supplies their inputs.

## Required before consumer promotion

1. Produce the ten positive row memberships and the three terminal carrier
   memberships from the intended n=11 survivor packet.
2. Add a named downstream consumer.
3. Run the governed build, direct axiom probes, and the normal ingress checks
   for that consumer.
