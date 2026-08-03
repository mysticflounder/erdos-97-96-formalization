# FreshThird combinatorial bridge audit (2026-08-03)

Target: `Erdos9796Proof.P97.ATail.FrontierLiveClosure`
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
(source lines 11324--11334).  It is still a single load-bearing `sorry`; its
interface is

```lean
theorem false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hremaining :
      FreshThirdTwoCapSourceObstruction.FreshThirdNormalizedResidualRemainingCase
        P Pρ C Q) : False
```

## Exact residual data

`FreshThirdNormalizedResidualRemainingCase` (lines 11280--11306) has three
constructors:

* `firstNonHit (data : FreshThirdCapSourceNonHit C.firstSource Q)
  (secondInteraction : FreshThirdCapSourceInteraction C.secondSource Q)`;
* `secondNonHit (firstInteraction : FreshThirdCapSourceInteraction
  C.firstSource Q) (data : FreshThirdCapSourceNonHit C.secondSource Q)`;
* `equalCrossRowCenters` with both `FreshThirdCrossRowHit`s, equal source
  centers, and two `FreshThirdNonCanonicalInteraction`s.

`FreshThirdCapSourceNonHit` (10375--10401) is only:

* `sameBlocker`: source center equals `Q.source₁` blocker center and the two
  selected supports are equal; or
* `sourceRowOmission`: one deleted `Q.source₁`/`Q.source₂` is absent from the
  source's exact-four support, together with
  `HasNEquidistantPointsAt 4 (D.A.erase deleted.1) sourceCenter`.

`FreshThirdBlockerFiber` (BlockerMultiplicityGeometry.lean:70--105) supplies
the equal blocker of `Q.source₁`,`Q.source₂`, their mutual-shell incidences,
freshness from all four collision sources, and no cap-membership or radius
relation beyond those fields.

`CapSourceThirdCanonicalRowWitness` (FrontierLiveClosure.lean:9214--9246)
adds: `8 ≤ (S.capByIndex S.oppIndex1).card`, source in strict opposite-cap
interior and outside both collision pairs, source center distinct from both
collision blockers/apices, source in an exact-four support (`support.card = 4`),
and two `CrossPairDeletionView`s.

## Existing source-clean consumers/producers checked

* `cross_deletion_survives_iff_not_mem_selected_support` (CriticalPairFrontier.lean:781--785):
  `HasNEquidistantPointsAt 4 (A.erase w) (H.centerAt q hq) ↔
   w ∉ selectedAt q ... .support`.  Thus `sourceRowOmission` merely converts
  to support non-membership; it does not create a second row hit.
* `CrossPairDeletionView.omits` (TwoCollisionGlobalProducer.lean:540--545)
  gives an OR omission of the two collision endpoints.  It says nothing about
  `Q.source₁`/`Q.source₂` unless an additional incidence theorem is supplied.
* `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`
  (CapSelectedRowCounting.lean:278--300) bounds a selected-four/support
  intersection with any indexed cap by `≤ 2`.  The existing terminal
  `false_of_freshThirdEqualCenter_sameCapOppIndex` (FrontierLiveClosure.lean:
  10759--10873) uses this only for equal-center + same-cap + `capIndex =
  S.oppIndex1`, where three explicit points force a contradiction.
* `false_of_two_freshThirdCrossRowHits_distinctCenters` (10884--10963) is
  source-clean, but requires **both** cross-row hits and distinct centers;
  it cannot consume either non-hit constructor.
* `nonempty_freshThirdCapSourceInteraction_of_noAlignment` (10993--11168)
  proves the four interaction constructors, but does not rule out
  `sameBlocker` or `sourceRowOmission`.

Indexed search (`nthdegree docs search --lean`) found no import-reachable
theorem consuming `FreshThirdCapSourceNonHit`, `firstNonHit`, or
`secondNonHit`; only the target theorem and its recursive caller occur.  Local
`rg` likewise found no noncanonical equal-center bridge outside this file.

## Why the requested combinatorial bridge is currently insufficient

Exact-four support/cardinality plus `8 ≤ cap.card` and the two deletion views
provide at most four support slots and two collision-endpoint omissions.  In a
`firstNonHit` branch, one fresh source may simply be absent (with deletion
survival), while the other interaction can be `sameBlocker`, distinct-cap, or
noncanonical same-cap.  `FreshThirdBlockerFiber` does not force either absent
source back into the cap-source support.  The `≤ 2` cap-intersection bound only
closes the canonical opposite-cap equal-center arm; distinct caps and
non-`oppIndex1` same-cap interactions have no cardinality contradiction.

**Conclusion:** no source-clean derivation or upgrade to an existing terminal
is available from the listed ingredients.  The first missing bridge is a new
equal-center/noncanonical incidence or boundary theorem (and, separately, a
non-hit/source-row-omission bridge).  Treat `firstNonHit`/`secondNonHit` as
open; do not promote the target to closure.
