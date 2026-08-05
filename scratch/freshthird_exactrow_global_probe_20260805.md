# FreshThird exact-row/global probe (2026-08-05)

Target audited:
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`.

## Result

`OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER`.  The theorem remains a literal
load-bearing `sorry`; no existing declaration closes either
`FreshThirdCapSourceNonHit` arm or the equal-center/noncanonical arm.

## Import-reachable declarations checked

* `FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit` is source-clean,
  but only converts a failed cross-row hit to
  `FreshThirdCapSourceNonHit`; it proves no contradiction.
* `freshThirdEqualCenterExactFourRow_of_hits` is source-clean and produces the
  exact support row `{firstSource, secondSource, source₁, source₂}` from two
  hits plus equal centers.  Its downstream source-clean producers
  `commonCollisionEndpointOmission_of_equalCenterHits` and
  `allCollisionEndpointsOmitted_of_equalCenterHits` likewise only produce
  omission/incidence packets.
* `false_of_freshThirdEqualCenter_sameCapOppIndex` consumes the exact-row data
  only with canonical `capIndex = S.oppIndex1`; the residual's
  `FreshThirdNonCanonicalInteraction` explicitly excludes that arm.
* `false_of_equalBlockers_complementaryMembership` can consume the equal-center
  rows only after a complementary-membership disjunction is proved.  The
  residual packet has no such membership premise.
* `false_of_two_freshThirdCrossRowHits_distinctCenters` closes the distinct
  center arm, which is already discharged before the target.  The residual
  equal-center arm cannot use it.
* `false_of_twoCapSources_mutualCrossMembership_distinctBlockers` and the
  `sameBlockerAllEndpointOmission` terminals require additional common-radius,
  reciprocal-incidence, `FreshOutsideFirstBlockerFiber`, or exact-deletion-row
  fields absent from the normalized `C`/`Q` packet.  The latter is also
  `sorryAx`-tainted in this source.

For `firstNonHit`/`secondNonHit`, `sameBlocker` yields equal selected supports
and `sourceRowOmission` yields deletion survival/non-membership, but no
import-reachable consumer turns either into `False`.  Existing cap-intersection
and deletion lemmas are one-sided bounds only.

## Registry/corpus check

The mandatory theorem-bank registries (`p97_rvol_general_n_mining`, legacy
`erdos97_legacy_general_n_mining`, and `erdos_general_theorem_p97_mining`)
contain no `FreshThird`, `FreshThirdCapSourceNonHit`, or normalized-residual
declaration.  `nthdegree docs search --lean` returned only the current
`FrontierLiveClosure` definitions/producers (plus unrelated general results);
no external import-reachable consumer was found.

An axiom print of the relevant module confirms the distinction: the target
depends on `sorryAx`, while
`FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit`,
`freshThirdEqualCenterExactFourRow_of_hits`,
`allCollisionEndpointsOmitted_of_equalCenterHits`,
`false_of_freshThirdEqualCenter_sameCapOppIndex`, and
`false_of_two_freshThirdCrossRowHits_distinctCenters` depend only on
`propext`, `Classical.choice`, and `Quot.sound`.

## First missing bridge

The next source-faithful producer must add either (i) a contradiction for
same-blocker/source-row omission, (ii) complementary/ordered-cap incidence for
the equal-center noncanonical interactions, or (iii) the common-radius and
mutual-incidence data needed by a generic two-cap terminal.  Combining the
existing exact-row/omission producers does not close the active leaf.
