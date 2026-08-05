# FreshThird common-radius route audit (2026-08-05)

## Verdict

No source-clean FreshThird producer currently exists from the live normalized
residual hypotheses to a common-radius reciprocal-incidence packet consumed by
an earlier theorem.  The common-radius data are introduced by an upstream
retained/non-retained split; the normalized residual interfaces do not carry
that data, and the existing source-clean packets stop at cap/off-cap facts and
endpoint alternation.

## Live contracts

`FreshThirdNormalizedResidualRemainingCase` (in
`P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`) has exactly
three constructors:

* one source row is `FreshThirdCapSourceNonHit` and the other is an interaction;
* the symmetric case; or
* two `FreshThirdCrossRowHit`s, equality of the two source centers, and two
  noncanonical interactions.

Neither `TwoCapSourceThirdCanonicalRowSurface` nor
`FreshThirdBlockerFiber` contains a radius, a selected-class intersection
cardinality, or source membership in a common selected class.  In particular,
the equal-center constructor supplies no `CommonRadius...` witness.

The earlier equal-center consumer
`false_of_commonRadius_equalCenters_noncanonicalSameCap_packet` (in
`TwoSourceCanonicalSurface.lean`) requires
`C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface`, a source center in a
cap `capIndex ≠ oppIndex1`, and equal source centers.  A normalized residual
cannot construct this `C`: its fields include `commonRadius`,
`commonRadius_card`, `commonRadius_ne_radius`, `commonRadius_ne_ρ`, and
source membership in `SelectedClass ... commonRadius`, none of which are in the
residual hypotheses.

The only source-clean common-radius producer,
`exists_commonRadius_twoCapSourceThirdCanonicalRowSurface_packet_of_not_retained`,
requires the external hypothesis
`¬ FirstCapMultiPointRadiiRetained`.  A residual case does not provide this
hypothesis.  Calling `freshThird_canonical_consumerPacket` can produce a
`Nonempty CommonRadius...` before entering the residual, but no theorem
transports the original `Q` and its interaction proofs to the newly produced
surface (and the new surface need not have `.surface = C` definitionally).

## What the existing packets actually provide

`freshThird_commonRadius_distinctCaps_dual_packet` is source-clean and returns
canonical source-cap/different-fresh-cap equalities plus
`Q.source₁.1, Q.source₂.1 \notin` the canonical cap.  The endpoint producer
`freshThird_canonicalDifferentCap_endpointPlacement` then gives a boundary
indexing with exact endpoint placement and support facts.  The cyclic producer
`freshThird_canonicalSource_differentFreshCap_sharedPairCyclicPacket` gives the
shared-pair alternation (`between q1` iff `not between q2`).  These are producer
boundaries only: alternation is realizable and there is no existing theorem
turning it into a strict Kalmanson chain, a third-shell incidence packet, or a
reciprocal-incidence contradiction.  The non-hit constructors likewise carry
only blocker-center equality or deletion-survival; they have no radius/cap
bridge.

## Axiom audit (probe: `scratch/common_radius_axiom_probe_20260805.out`)

The common-radius producers and packets above depend only on
`propext`, `Classical.choice`, and `Quot.sound` (no `sorryAx`).  The normalized
residual closer
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`, its
common-radius wrapper, and the public FreshThird closers all report
`sorryAx`.  Thus the existing common-radius core is a consumer of the open
residual obligation, not a source-clean producer or closure.

## Exact missing contract

One of the following must be added before the requested route exists:

1. strengthen the residual target with a concrete
   `CommonRadiusTwoCapSourceThirdCanonicalRowSurface` and transport proofs for
   the same `Q`/source rows and interactions; or
2. prove a new source-clean bridge
   `(C, Q, interactions, normalized residual) ⇒` a common-radius surface,
   canonical source-cap/different fresh-cap placement, and endpoint facts,
   followed by either a strict order/Kalmanson chain or a checked
   third-shell/reciprocal-incidence packet accepted by a proved terminal.

No declaration implementing either bridge is present in the current imports.
