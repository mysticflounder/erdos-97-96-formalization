# Fresh-third normalized residual branch trace (2026-08-03)

Target: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`.

## Residual-remaining constructors

`FreshThirdNormalizedResidualRemainingCase` is declared at lines 11282--11302.

* `firstNonHit` (11285--11288):
  `data : FreshThirdCapSourceNonHit C.firstSource Q` and a full
  `secondInteraction : FreshThirdCapSourceInteraction C.secondSource Q`.
* `secondNonHit` (11289--11292): the symmetric packet (full first interaction,
  non-hit data for the second source).
* `equalCrossRowCenters` (11293--11302): two `FreshThirdCrossRowHit`s,
  `centers_eq`, and two `FreshThirdNonCanonicalInteraction`s.

`FreshThirdCapSourceNonHit` (10463--10488) has exactly two constructors:
`sameBlocker` (center/support equality) and `sourceRowOmission` (a deleted
fresh endpoint, omission from that row, and one-point deletion survival).
`FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit` (10491--10502)
is a source-clean normalizer into those two constructors.  The producer
`freshThirdNormalizedResidualCase_of_crossRowResidual` (10586--10607)
creates the first/second-non-hit or equal-center arm; it is not a contradiction.

## Existing source-clean consumers by branch

### `firstNonHit`

No source-clean `False` consumer exists.  `sameBlocker` and
`sourceRowOmission` are only positive packets.  The local
`false_of_omission` helper in `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`
(11348--11360) needs a *positive* `FreshThirdCrossRowHit`, which the first
non-hit data explicitly lacks.  Existing deletion/support equivalences merely
restate `deleted_not_mem`/`deletion_survives`; they do not consume this packet.
The second interaction's four constructors likewise have no direct terminal
for this mixed packet.
The superficially related first-fiber terminals require a
`FreshOutsideFirstBlockerFiber` plus common-radius, mutual-cross-membership,
and all-four-endpoint-omission fields; moreover their immediate leaves are
still `sorry` (`false_of_capSource_firstFiber_outsidePairDeletionExactRows`,
12699--12734, and `false_of_capSource_firstFiber_crossedThreeRowExactSupports`,
12742--12777).  They cannot be used as a source-clean ingress for this `Q`.

### `secondNonHit`

Exactly symmetric: no source-clean `False` consumer.  Swapping arguments does
not add a producer; the branch remains the same one-sided deletion/equal-blocker
residual.

### `equalCrossRowCenters`

The positive hit packet has several source-clean producers/partial consumers:

* `freshThirdEqualCenterExactFourRow_of_hits` (10636--10759) gives exact
  four-point supports.
* `false_of_freshThirdEqualCenter_sameCapOppIndex` (10761--10882) closes a
  same-cap interaction when its cap index is `S.oppIndex1`; this is invoked via
  `closeCanonicalFirst` at 11391--11403.
* `commonCollisionEndpointOmission_of_equalCenterHits` (10884--10926) and
  `allCollisionEndpointsOmitted_of_equalCenterHits` (10928--10992) are positive
  endpoint-omission producers, not terminals for a `FreshThirdBlockerFiber`.
* `false_of_two_freshThirdCrossRowHits_distinctCenters` (10994--11084) closes
  the *distinct*-center arm, so it does not apply under `centers_eq`.

Before the narrowed residual is built, same-blocker and source-row-omission
interaction constructors are discharged directly by the hit hypotheses and
`false_of_omission` (11404--11421).  The remaining four products are:

1. distinct-caps × distinct-caps (11422--11440),
2. distinct-caps × noncanonical same-cap (11440--11467),
3. noncanonical same-cap × distinct-caps (11480--11502),
4. noncanonical same-cap × noncanonical same-cap (11502--11530),

where each same-cap index is explicitly `≠ S.oppIndex1`.  All four currently
recurse to `false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
(11326--11333), whose body is the sole `sorry`.

## Smallest non-circular closure target

The smallest honest next leaf is one constructor product, e.g. a direct

`false_of_freshThirdEqualCenter_distinctCaps_pair`

theorem taking `C`, `Q`, both cross-row hits, `centers_eq`, and the two
`FreshThirdNonCanonicalInteraction.distinctBlockersDifferentCaps` payloads.
Its proof must be a new source-faithful geometric two-cap/equal-center
uniqueness argument (using the payload cap-interior memberships, overlap
equalities, and `centers_eq`); it must not call
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` or the
parent normalized-residual theorem.  The consumer is one direct pattern arm in
the residual theorem at 11422--11440.  This would close exactly one of the four
equal-center products without widening the interface or introducing a wrapper
cycle.  No analogous source-clean producer currently exists for either
one-sided non-hit branch; treating `hremaining <;> simp_all` as closure would be
exploratory only and still leave `sorryAx`.
