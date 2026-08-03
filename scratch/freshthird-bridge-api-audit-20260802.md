# FreshThird normalized-residual bridge API audit (2026-08-02)

## Conclusion

**HARD NEGATIVE (current compiled/source APIs):** no non-circular source-faithful
bridge closes
`Problem97.ATailFrontierLiveClosure.false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`.
The smallest honest next target is the three-part adapter already named in the
refactor plan: (1) support extraction, (2) radius transfer, (3) finite boundary
order/region partition, followed by a new metric terminal or a stronger producer.

## Live obligation and data gap

The target is at `FrontierLiveClosure.lean:9806-9814` and consumes
`C : TwoCapSourceThirdCanonicalRowSurface`, `Q : FreshThirdBlockerFiber`, two
`FreshThirdCapSourceInteraction` packets, and
`FreshThirdNormalizedResidualCase`.  The residual has exactly three arms
(`FrontierLiveClosure.lean:9170-9205`): `firstNonHit`, `secondNonHit`, and
`equalCrossRowCenters`.  The non-hit packet supplies only same-blocker/support
equality or one source-row omission plus `HasNEquidistantPointsAt 4` after one
deletion.  The equal-center packet supplies two cross-row hits and equality of
the two cap-source centers; the checked helper
`freshThirdEqualCenterExactFourRow_of_hits` strengthens this to two equal
four-point supports, and
`commonCollisionEndpointOmission_of_equalCenterHits` yields common omission
of all four collision endpoints.  None includes the cap membership/outside-cap,
common-radius, first-apex order, or finite boundary-index data required by the
existing metric consumers.

## Existing candidates checked

* `false_of_two_freshThirdCrossRowHits_distinctCenters`
  (`FrontierLiveClosure.lean:9502-9587`) is checked, but consumes the *strictly
  distinct* two-center arm, which `FreshThirdNormalizedResidualCase` has already
  removed.  Applying it to an equal-center residual is impossible.
* `false_of_freshThird_sameCapCrossRowAlignment`
  (`FrontierLiveClosure.lean:8099-8148`) requires both centers in one indexed cap,
  both fresh sources outside that cap, and both fresh sources in the source row.
  `FreshThirdBlockerFiber` has none of the cap/outside-cap facts; the
  `sameCapWithInternalFiberSource` interaction has the opposite one-source-in-cap
  shape.  The same-blocker/non-hit arm also does not imply fresh sources are
  off-cap.
* `false_of_twoCapSources_oneSidedDeletionSurvival`
  (`FrontierLiveClosure.lean:12190-12211`) consumes
  `FreshOutsideFirstBlockerFiber`, two same-first-fiber cap-source witnesses,
  common first-apex radius, and a two-source deletion packet.  A FreshThird
  packet plus one `sourceRowOmission` does not provide that interface, and no
  checked conversion exists.
* `false_of_twoCapSources_complementaryMembership` and
  `false_of_twoCapSources_mutualCrossMembership_distinctBlockers`
  (`FrontierLiveClosure.lean:11864-12020`) require two
  `FirstFiberCapSourceWitness` rows, mutual cross-membership, and first-apex
  radius/cap provenance.  The normalized FreshThird interactions do not expose
  those hypotheses.
* `false_of_twoCapSources_sameBlockerAllEndpointOmission`
  (`FrontierLiveClosure.lean:11171-11224`) consumes the distinct stronger
  constructor `sameBlockerAllEndpointOmission` with a
  `FreshOutsideFirstBlockerFiber`; it cannot consume the normalized FreshThird
  constructor without an unproved/circular conversion.
* `FreshThirdOrderPartition.freshThird_pair_order_partition` is a compiled
  finite arithmetic producer only (`ATail/FreshThirdOrderPartition.lean:16-31`).
  It needs an index-center ordering and a same-inside/same-outside region
  hypothesis; the live `FreshThirdBlockerFiber` supplies neither region nor
  boundary enumeration.  It is also not imported by `FrontierLiveClosure.lean`.
* `CapCrossingKalmanson`/`KalmansonThreeEqualitySchemas`/`SixPointEuclideanObstruction`
  provide metric terminals only after explicit CCW boundary orders and row
  equalities.  No source API derives those from this residual packet.

## Bank/index evidence

Searched the six required P97 theorem-bank registries named by `AGENTS.md`
(`p97_rvol_general_n_mining`, legacy `erdos97`, `erdos_general_theorem`, and
the general-n census) for `FreshThird`, `sourceRowOmission`,
`normalized-residual`, and cap-source interaction terms: no candidate terminal
or adapter was listed.  Ran indexed search once with
`nthdegree docs search --lean "FreshThirdNormalizedResidualCase cap-source interaction terminal contradiction"`;
the only relevant hits were the live normalization theorem, the checked
distinct-center terminal, and unrelated first-fiber/cap consumers.  This agrees
with the plan's explicit search result (`docs/false_of_capSourceThirdCanonicalRowSurface_refactor-plan-07-31-2026.md:1896-1902`)
and the prior residual audit (`docs/p97-fresh-third-normalized-residual-consumer-audit-2026-08-02.md:12-30`).

Therefore any direct call to an existing terminal would either fail its
hypotheses or re-enter the open normalized-residual theorem.  Promotion needs a
new source-faithful support/radius/order bridge (or a new terminal), not a
wrapper or theorem-bank alias.
