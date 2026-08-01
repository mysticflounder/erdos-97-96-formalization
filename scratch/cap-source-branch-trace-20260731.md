# Cap-source residual branch trace (2026-07-31)

## Conclusion

There is no currently available source-clean/core-only replacement for
`false_of_capSourceThirdCanonicalRowSurface`.  Every complete route from an
arbitrary `CapSourceThirdCanonicalRowSurface` plus an arbitrary arm of
`GeometricMultiplicityResidual` still reaches that theorem (or the other open
`false_of_crossBlockerCoincidence`).  The existing source-clean lemmas close
only strict sub-branches with additional incidence hypotheses.

## Branch map

* `FreshThirdBlockerFiber`: `false_of_capSource_freshThirdBlockerFiber`
  (lines 7598--7608) calls the central theorem with `(Or.inl hthird)`.
  The positive same-cap alignment branch is genuinely closed by
  `false_of_freshThird_sameCapCrossRowAlignment` (7521--7570), but its
  complement `false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow`
  (7578--7592) calls the central theorem with `(Or.inl <| ⟨Q⟩)`.

* `FreshOutsideFirstBlockerFiber`:
  `false_of_capSource_freshOutsideFirstBlockerFiber` (11135--11166) splits
  aligned/non-aligned radii.  The aligned route eventually calls the central
  theorem through `false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`.
  The non-aligned route calls `false_of_twoCapSources_firstFiber` (9220--9259).
  Inside that split, the equal-blocker/complementary-membership arm and the
  distinct-blocker mutual-cross-membership arm are source-clean; common
  omission and one-sided deletion call the central theorem (directly or via
  `false_of_twoCapSources_oneSidedDeletionSurvival`, 9193--9214).

* `FreshOutsideSecondBlockerFiber`: the swap adapter
  `false_of_capSource_freshOutsideSecondBlockerFiber` (11169--11188) reduces to
  the preceding first-fiber route, so it has the same central dependency.

## Source-clean proof terms that are actually usable

* `false_of_equalBlockers_complementaryMembership` (7903--8060), consumed at
  9247--9249.  It derives a six-point subset of an exact-four support.
* `false_of_twoCapSources_mutualCrossMembership_distinctBlockers`
  (9007--9023), consumed at 9250--9254.  It uses
  `blocker_centers_eq_of_secondRadius_mutual_cross_membership` to contradict
  unequal blockers.
* `false_of_freshThird_sameCapCrossRowAlignment` (7521--7570), but only with
  its explicit positive alignment hypothesis.
* `secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber` (7751--7784), an
  auxiliary inequality; it is not a terminal contradiction by itself.
* Imported `ATailFirstFiberOverlapDescent.false_of_firstFiber_explicit_overlap_card_ge_three`,
  `false_of_firstFiber_bothOutsideHits_and_firstPairHit`, and
  `false_of_firstFiber_twoOutsideHits_of_capCenter` are source-clean terminals,
  but the current cap-source/fiber data do not provide their extra overlap or
  hit hypotheses.

## Axiom probe

`#print axioms` (via `scratch/cap_source_axiom_probe.lean`) reports only
`propext`, `Classical.choice`, and `Quot.sound` for the two mutual-cross
source-clean terminals above and for the positive FreshThird alignment theorem.
`false_of_twoCapSources_firstFiber` and
`false_of_capSourceThirdCanonicalRowSurface` both report `sorryAx`.

## Required new work

To replace the central call, one must prove both missing FreshThird negative
alignment and FreshOutside common-omission/one-sided-deletion arms from the
cap-source surface (or add a stronger producer supplying one of the imported
overlap/hit hypotheses). No existing proof term in this file supplies that
bridge.
