# Lean 4.33 regression candidates from recent repair commits

Date: 2026-09-09

Source revision: `81cc9953a499ad7ff730e5c8cc919140c2f3c3df`

Method: static source and Git-diff inspection only. No Lean, Lake, test, or build command was run.

These are candidates, not confirmed compiler errors. The ranking compares the current source with
the before/after forms in the initial migration repair `275c90653`, the subsequent 23 repair waves
through `81cc9953a`, and `521c00127`. Files already changed by those repair commits were excluded
from the literal-clone scan. Dependency sources under `lean/.lake/` and experimental files under
`lean/scratch/` were also excluded.

## Highest-confidence candidates

All entries in this section retain the same broad `simp` or `simpa` forms that failed repeatedly in
recent commits. The recurring repair is to use `simp only` on the named `SurplusCapPacket`
projections and the case equation, then finish with `exact` or `<;> rfl`. Nested `Fin` selectors may
also need `Fin.val_zero`, `Fin.val_one`, and `Fin.val_two`.

- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/FirstFiberAcyclicFaithfulIngress.lean`
  - lines 94-96: `oppApex1` membership, three broad `simpa` branches.
  - lines 101-103: `oppApex2` membership, three broad `simpa` branches.
  - lines 109-111: `surplusApex` membership, three broad `simpa` branches.
  - These are literal clones of forms removed in waves 13, 15, 19, and 20.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/GoodMutualOmissionDeletionOutcome.lean`
  - lines 99-101: three `oppApex2` membership branches.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Card18LabeledProjection.lean`
  - lines 65-67: three `oppApex2` membership branches.
- `lean/Erdos9796Proof/P97/ATail/LargeCapUniqueFiveLowHit.lean`
  - lines 39-41: three `oppApex2` membership branches.
- `lean/Erdos9796Proof/P97/ATail/RobustLargeRadiusReduction.lean`
  - lines 38-40: three `oppApex2` membership branches.
- `lean/Erdos9796Proof/P97/ATail/BiApexRobustCapBounds.lean`
  - line 75: the third branch still uses broad `simpa`; the first two branches already use the
    repaired `simpa only` form.
- `lean/Erdos9796Proof/P97/FiniteN10.lean`
  - lines 81-106: five `interval_cases` bridges use full `simp` over `capByIndex`, `oppIndex1`,
    `oppIndex2`, and `oppositeVertexByIndex`.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/FirstNonHitCommonRadiusReducedFinitePayload.lean`
  - lines 316-335: three `oppositeVertexByIndex` bridges after `interval_cases`.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/FirstNonHitCommonRadiusFinitePayload.lean`
  - lines 130-137: `firstApex_point_eq_oppApex1` ends with full `simp` after `interval_cases`.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/FirstNonHitCommonRadiusInteractionIngress.lean`
  - lines 102-108: local `oppApex1 = oppositeVertexByIndex oppIndex1` bridge.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/FirstNonHitCompleteFiniteSourceTheory.lean`
  - lines 164-179: indexed apex/cap bridges retain full `simp`.
  - lines 198-201: `capByIndex`/`surplusCap` transfer retains broad `simpa`.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/FirstNonHitCompleteFiniteSourceTheoryContext.lean`
  - line 76: another full-`simp` `oppositeVertexByIndex` bridge.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/FirstNonHitSourceTotalFiniteAssignment.lean`
  - lines 387-401: indexed source/apex bridges after `interval_cases`.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/FirstNonHitFiniteBlockerFiber.lean`
  - lines 136-138: three broad `oppApex2` membership branches.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactFiveDistinctProfile0034SourceAdapter.lean`
  - line 254: full `simp` over `oppositeVertexByIndex`.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1TwoOmittedInteriorPeers.lean`
  - lines 42-46: full `simp` over `oppApex2`, `oppositeVertexByIndex`, and `oppIndex2`.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceRowCapBetweenness.lean`
  - lines 584-586: full `simp` proving `capByIndex oppIndex2 = oppCap2`.

## Medium-confidence candidates

These match other concrete migration repairs, but the surrounding goals may be simple enough that
the old form still elaborates.

- `lean/Erdos9796Proof/P97/ATail/ExactFiveDistinctSecondApexSourceSwap.lean`
  - lines 159-162: two `simpa only [hdeleted] using ...` terms. Wave 3 repaired the same shape by
    rewriting with `rw [hdeleted]` and then using the hypothesis directly.
- `lean/Erdos9796Proof/P97/ATail/CapInteriorRadiusCounting.lean`
  - line 71: `simpa [T] using hcard`. The initial migration repaired this shape by stating the
    unfolded filter-cardinality goal explicitly and applying `hcard`.
- `lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/UniqueRowProducer/card_five_interior_bisector_localization.lean`
  - line 215: `simpa [T] using hcard`.
- `lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/UniqueRowProducer/card_five_interior_survivor_pair.lean`
  - line 74: `simpa [T] using hcard`.
- `lean/Erdos9796Proof/P97/U1OppositeCapLowerBounds.lean`
  - lines 188, 274, and 360: `simpa [T] using hTcard`.
- `lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/Unique4AlignedP5Occurrence/AlignedP5NativeCoverage.lean`
  - line 231: `simpa [allKilled, hprefix, hsort] using hallFalse`.
- `lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/Unique4AlignedP5Occurrence/AlignedP5MirrorNativeCoverage.lean`
  - line 231: the same `allKilled` form. The initial migration replaced this with `simp only` and
    `exact hallFalse`.
- `lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/ExactFiveCommonShellV7/G3SourceCenterSliceLedger.lean`
  - lines 228-233: a finite bound proof uses broad `simp` before `omega`. Waves 3 and 4 stabilized
    this family by naming `choice.isLt`, simplifying only that fact and the goal, then calling
    `omega`.
- `lean/Erdos9796Proof/P97/ATail/FrontierCommonDeletionEscape.lean`
  - line 72: broad `simpa` over `surplusCap`.
- `lean/Erdos9796Proof/P97/ATail/FrontierCommonDeletionSurplusEscape.lean`
  - lines 166, 168, and 170: three broad `surplusCap` transfers.
- `lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean`
  - lines 2239, 2242, and 2245: broad `simpa` over `surplusCap` and `surplusApex`.

## Generated and algebraic candidates

These reflect less frequent recent fixes and should be checked after the projection/simplifier
sites above.

- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Card18ArmCnf.lean`
  - lines 396-403: five large generated-CNF length proofs use full `simp`. The initial migration
    replaced similar ground evaluation with abstract append/map/all length lemmas to avoid
    simplifier timeouts.
- `lean/Erdos9796Proof/P97/ATail/FiveSelectedRowsThreeK2Cycle.lean`
  - lines 54, 59, 64, 69, and 74: `simpa only [dist_comm] using ...`. The initial migration removed
    the same unnecessary simplification at a related carrier-row proof and used the term directly.
- `lean/Erdos9796Proof/P97/ATail/FirstApexInteriorPairCirclePower.lean`
  - lines 402-405 and 592-595: coordinate-polynomial tactic sites without an immediately preceding
    `beta_reduce at *`.
- `lean/Erdos9796Proof/P97/ATail/CrossedArmQ1G7Producer.lean`
  - lines 71 and 85: `grobner` after unfolding polynomial definitions, without `beta_reduce at *`.
  - This is lower confidence because the inputs may already be scalar polynomial variables.
- `lean/Erdos9796Proof/P97/ATail/CrossedArmSevenPointEuclideanObstruction.lean`
  - line 42 and the later coordinate `grobner` block near line 431: no immediate `beta_reduce at *`.
  - This is also lower confidence.

## Residual propositional normalization sites

Recent wave 14 needed `tauto` after `ext` and `simp` left a pure permutation of disjunctions. The
following sites have the same outer shape; only inspect them if a narrowed diagnostic reports a
remaining propositional goal:

- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceClosure.lean`, lines 522-526.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean`, lines 495-499.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean`, lines 96-100.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`, lines 298-302.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/FirstApexInteriorPairCirclePower.lean`, lines
  292-296.
- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/FirstFiberRoleCoverage.lean`, lines 108-112.

The first four files above were themselves repaired during recent waves, so their remaining
propositional sites are lower priority than the untouched files in the first two sections.

## Repair patterns used by the recent commits

1. Replace broad dependent projection simplification with `simp only [...]` and then `exact` or
   `<;> rfl`.
2. For nested `Fin` matches, include `Fin.val_zero`, `Fin.val_one`, and `Fin.val_two` explicitly.
3. If `simpa [...] using h` is only unfolding a local definition, rewrite the hypothesis or goal
   first and then use `exact h`.
4. Preserve `choice.isLt` as a named fact; simplify that fact rather than simplifying the `Fin`
   value itself before `omega`.
5. Add `Function.comp_def` when `List.map_map` leaves a function-composition expression.
6. For generated Boolean arrays, prove one `Array.all = true` fact and transport it with
   `Array.all_eq_true_iff_forall_mem` rather than asking `native_decide` to synthesize a bounded
   dependent function directly.
7. Use `beta_reduce at *` before algebraic tactics when coordinate lambdas remain in hypotheses.

Do not apply these replacements mechanically. Several neighboring broad `simpa` calls survived
successful 4.33 checks; the list records likely next diagnostics, not a source-wide rewrite plan.
