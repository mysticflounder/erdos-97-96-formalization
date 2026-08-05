# FreshThird shared-cap side audit (2026-08-03)

## Verdict

No current Lean lemma forces the reciprocal FreshThird sources
`Q.source₁` and `Q.source₂` to be both inside, or both outside, a shared
noncanonical cap when the two blocker centers are distinct and both lie in
that cap.  The strongest FreshThird-specific relation is one-sided:
at least one source is inside.  The both-outside branch is already
contradicted when the source row contains both sources.

## Exact source-clean results

* `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9391-9404`
  defines `FreshThirdSameCapCrossRowAlignment`: one cap contains the
  FreshThird blocker center and a distinct source-row center, while both
  sources are outside the cap and both lie in the source row support.
* `FrontierLiveClosure.lean:9411-9460`,
  `false_of_freshThird_sameCapCrossRowAlignment`, proves that alignment is
  `False` via `selectedFourClass_outside_overlap_card_le_one`.  Thus, with
  distinct centers in one cap and both source-row memberships, “both outside”
  is impossible.
* `FrontierLiveClosure.lean:10557-10580`, constructor
  `FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource`, carries
  only
  `Q.source₁.1 ∈ S.capByIndex capIndex ∨
   Q.source₂.1 ∈ S.capByIndex capIndex`,
  together with `capIndex ≠ S.oppIndex1`; it does not carry both-inside data.
  Its producer first rules out the cross-row alignment above, explaining why
  the surviving positive statement is exactly “at least one inside.”
* `lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:278-300`,
  `selectedFourClass_inter_capByIndex_card_le_two`, only bounds the cardinality
  of one selected class’s support intersected with a cap by `≤ 2`.  It gives no
  parity or source-pair conclusion.

## Near misses that do not instantiate

* `lean/Erdos9796Proof/P97/ATail/RetainedCollisionCapLocalization.lean:155-168`,
  `source₁_mem_cap_or_source₂_mem_cap_of_centers_mem_cap`, proves the same
  “at least one inside” disjunction, but only for
  `RetainedRadiusCollision` and with the first apex in that cap.  A
  `FreshThirdBlockerFiber` has neither the required type nor the first-apex
  field.
* `RetainedCollisionCapLocalization.lean:269-304`,
  `actualRow_center_eq_commonBlocker_of_sameCap_outside_sources`, is a retained
  collision theorem; it concludes center equality from both-outside sources,
  not both-inside.
* `lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/UniqueRowProducer/card_five_cross_blocker_localization.lean:68-95`,
  `false_of_two_cap_centers_equidistant_outside_pair`, has the right geometric
  polarity only for an outside pair and is not a FreshThird interface theorem.

Finally, `FreshThirdBlockerFiber` itself
(`.../ATail/BlockerMultiplicityGeometry.lean:70-110`) stores source, freshness,
and reciprocal-shell fields, but no cap-interior witness for either source.
Those witness terms are existentially erased by the construction, so canonical
source-cap facts cannot be recovered at the noncanonical interaction site.

