# Math Skeptic Audit: guarded mutual return chord

**Target**: the three new chord modules, the guarded consumer and dispatch in
`Rigid221Closure.lean`, and the corresponding update to plan §3c.
**Date**: 2026-09-12
**Verdict**: CERTIFIED
**Claims audited**: 4

## Summary

Certification covers the four conditional claims below, not unconditional
exact-five closure, a refutation of the physical route, or the trust of the
headline theorem. Each named new theorem and the new private root consumer
has a checked transitive axiom list containing only `propext`,
`Classical.choice`, and `Quot.sound`.

The live initially distinct dispatch consumes the contradiction only when
both interior endpoints hit the fresh row, there are at least four
strict-interior anchors, and both mutual incidences hold. It retains the
original minimum-pair source equality. Other outcomes retain the prior
physical admission. The four literal sorries in the live file are unchanged.

Base revision: `251428aacb7da3954d2f251caa3fb6ddc13acf7f`.
Lane: `exactfive-mutual-short-chord-20260912`.
Independent reviewer Parfit accepted the bounded semantic/API integration;
the main agent separately checked the exact theorem axiom closures.

## Findings

### F1: Four anchors supply a short admissible minimum chord

- **Location**: `MinimumAdmissibleInteriorChord.lean:214`.
- **Quote**: "With at least four strict-interior anchors and a fully deletion robust second apex, the minimum admissible chord is no longer than the first-apex radius."
- **Stated label**: PROVEN, Lean-formalized.
- **Evidence present**: `Problem97.FirstApexExactFiveInteriorFrontier.MinimalAdmissibleInteriorPair.dist_le_radius_of_four_le_interior_card`, line 218.
- **Actual label**: PROVEN, Lean-formalized under the explicit hypotheses.
- **Verdict**: OK.
- **Reason**: A fixed rich second-apex radius class meets the interior anchors
  at most once, by distinct second-apex distances. Three anchors outside that
  class have a short pair by the nonobtuse cone and planar Gram determinant.
  Both deletions preserve the fixed class. The source minimum therefore has
  no larger chord. The abstract minimum-pair API does not itself enforce an
  exact-five cardinality; this theorem does not infer that cardinality from
  the API's name and is valid in its stated, broader setting.

### F2: The normalized mutual configuration is contradictory

- **Location**: `ExactFiveMutualReturnChord.lean:177`.
- **Quote**: "The normalized mutual-return configuration is impossible when `h ≥ √3`."
- **Stated label**: PROVEN, Lean-formalized.
- **Evidence present**: `Problem97.ExactFiveMutualReturnChord.normalized_mutual_return_false`, line 190.
- **Actual label**: PROVEN, Lean-formalized with all displayed coordinate and geometric guards.
- **Verdict**: OK.
- **Reason**: The two circle equations determine the two equilateral
  placements. For the upper placement, a nonpositive coefficient would put
  the endpoint in the convex hull of other carrier points; a positive
  coefficient contradicts the affine cap separator. The lower placement is
  a convex combination of the first apex and the two endpoints. The theorem
  explicitly requires the affine chart, its injectivity, the separator,
  membership, distinctness, and scalar inequalities.

### F3: Actual source geometry supplies the normalized guards

- **Location**: `MutualSelectedRowChord.lean:350`.
- **Quote**: "Two mutually incident selected rows, one containing both strict-interior endpoints, force their chord to exceed the first-apex radius."
- **Stated label**: PROVEN, Lean-formalized.
- **Evidence present**: `Problem97.MutualSelectedRowChord.radius_lt_dist_of_mutual_selectedRows`, line 353.
- **Actual label**: PROVEN, Lean-formalized under the stated selected-row hypotheses.
- **Verdict**: OK.
- **Reason**: Both mutual incidences supply the equal radii. The source
  nonpositive inner product excludes either endpoint alias for the return
  blocker. The selected-row cap intersection bound then puts that blocker
  outside the first cap. Convex independence and radius drop place the two
  bisector centers on opposite sides of the endpoint chord. The similarity
  frame, signed-area separator, and metric bounds discharge every hypothesis
  of F2. No minimum-pair or four-anchor assumption is needed for this strict
  long-chord inequality.

### F4: The original minimum pair reaches the guarded live consumer

- **Location**: `Rigid221Closure.lean:1754` and `:1855`.
- **Quote**: "A minimum source chord contradicts mutual selected rows only under the explicit four-anchor guard. Neither mutual incidence is inferred here."
- **Stated label**: PROVEN, Lean-formalized conditional integration.
- **Evidence present**: private `Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_mutualDoubleHit_fourInterior`, line 1756, and its live dispatch call.
- **Actual label**: PROVEN, Lean-formalized conditional integration.
- **Verdict**: OK.
- **Reason**: `Rmin.source_eq` rewrites the minimum theorem onto the original
  residual endpoints. `N.orientation` supplies the old row's retained
  endpoint; the reversed orientation swaps the endpoints and restores the
  distance with `dist_comm`. The both-hit payload and all three additional
  guards are passed explicitly. Failed guards, one-hit, and zero-hit outcomes
  retain the original fallback. Public theorem signatures are unchanged.

## Weasel words and scope conflation

No unsupported proof shortcut or stronger unguarded claim was found in the
audited additions. In particular, closed-cap cardinality at least six is not
used to infer four strict-interior anchors. Neither mutual incidence follows
from the both-hit condition alone. The three-anchor, missing-hit, non-mutual,
and separate common-center cases remain outside this exclusion.

The original 2026-09-06 source note is historical. The dated plan update
distinguishes its paper result from this checked Lean integration.

## Lean sorry graph and validation

- Targeted `lake-build` invocations compiled only the two new geometric/chord
  targets and then the selected-row adapter, with `LAKE_BUILD_NO_REFRESH=1`.
  Both commands exited zero. Existing dependency diagnostics were replayed.
- Focused `lake env lean -M 16384 Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean`
  exited zero. Live LSP checking reported no errors; existing warnings remain.
- Declaration-level `lean_verify` returned exactly the three standard axioms
  for all four named claims above, with no warnings. Their transitive
  dependency lists contain no `sorryAx`, native-computation axiom, or custom axiom.
- The broader `false_of_originalFrontierUniqueRadiusArm` still has 3961 axiom
  names: the three standard axioms, `sorryAx`, and 3957 names containing
  `_native.`. This matches the prior audit, not a fresh certification of those
  external computations.
- The four unchanged literal sorries are now at lines 120, 453, 1384, and
  1709 of `Rigid221Closure.lean`. The broad physical leaf remains admitted.
- `git diff --check` passed. No full-project build or headline publication
  gate is claimed, and no solver/certificate artifact was produced.
- The read-only lane report found zero checkpoint issues. It also reported
  unrelated workspace artifacts; none were altered or staged. The exact-path
  staged hygiene check passed.

## Upgrade drift

The plan's upgrade from paper-only geometry to Lean-formalized conditional
integration is supported by the new proofs, explicit consumer, and checks in
this same change. The full route has not been upgraded to closed or refuted.

## Audited source bytes

SHA-256, before the scoped commit:

```text
MinimumAdmissibleInteriorChord.lean aa6f5cb006241ea98a62e2952a57207a21cb45ab803f8a8dc5e498f8cbf5ded3
ExactFiveMutualReturnChord.lean e666e46eb51c1c865599f0d7e0aaf31fd6ce25ce523e03e0721b90e48aa3dd0a
MutualSelectedRowChord.lean b4de6f2467c8d8431d8358cd1b682396db85ed8de0a93e229a9163842ad7f48f
FrontierLiveClosure/Rigid221Closure.lean 524af0e52080dd14443896fabae605d3b9099712b36e265c9f96455504622f04
```

## Required before broader certification

Close the remaining physical and common-center obligations with their own
source-faithful consumers, then repeat the project's trust and publication
gates. This report does not certify unconditional Erdős 97 closure.
