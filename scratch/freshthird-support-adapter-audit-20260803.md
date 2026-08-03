# FreshThird support/adapter audit (2026-08-03)

Scope: source-faithful adapters available at the normalized residual target
`ATailFrontierLiveClosure.false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`
(`FrontierLiveClosure.lean:9806`), with no production edits.

## Findings

### `CriticalFourShell.support_eq_radius`

This is directly usable whenever an interaction supplies shell membership.  A
`FreshThirdBlockerFiber Q` already gives
`Q.source₁.1 ∈ shell(Q.source₁)` and
`Q.source₂.1 ∈ shell(Q.source₁)`, so the fresh blocker center is on the
perpendicular bisector of the fresh pair.  `FreshThirdCrossRowHit` supplies
both analogous memberships for a cap-source row.  The existing theorem
`false_of_two_freshThirdCrossRowHits_distinctCenters` (lines 9502--9587)
is the concrete adapter: it applies `support_eq_radius` to the common,
first-hit, and second-hit centers and then invokes
`Dumitrescu.perpBisector_apex_bound`.

This terminal cannot be applied to the normalized residual as-is: the
three-center arm has already been removed.  The residual only permits
`firstNonHit`, `secondNonHit`, or `equalCrossRowCenters`; the latter has
center equality, not the strict distinct-center premise required by the
metric bound.  The equal-center/both-hit branch can instead use
`freshThirdEqualCenterExactFourRow_of_hits` (lines 9269--9385) and then the
existing collision-endpoint omission adapters (lines 9392--9494), but that
does not close the residual theorem.

### `FreshThirdCapSourceInteraction` fields

The constructors are positive data, not a terminal:

* `sameBlocker` carries center equality and selected-support equality, hence
  gives a direct row-identification adapter (and no new metric contradiction).
* `sourceRowOmission` carries one deleted fresh source, non-membership in the
  cap-source row, and `HasNEquidistantPointsAt 4` after deletion.  This feeds
  deletion/survival consumers, not `support_eq_radius` or an order theorem.
* `distinctBlockersDifferentCaps` carries both fresh-source memberships,
  exact two-point support overlap, two cap interiors, and unequal cap labels.
  No existing theorem in this module consumes this packet to a contradiction.
* `sameCapWithInternalFiberSource` has the same overlap data but only asserts
  that one fresh source lies in the common cap.  Therefore it cannot satisfy
  `FreshThirdSameCapCrossRowAlignment`, whose premise requires *both* fresh
  sources outside that cap.  The existing
  `false_of_freshThird_sameCapCrossRowAlignment` is consequently unavailable
  for this constructor.

The source-faithful normalizer
`nonempty_freshThirdCapSourceInteraction_of_noAlignment` (lines 9594--9674)
is the only producer of these interaction packets; it does not add hidden
radius/order facts.

### `FreshThirdOrderPartition`

`ATail/FreshThirdOrderPartition.lean:23` defines only the arithmetic theorem
`freshThird_pair_order_partition` for `cL cH i j : Fin n`, requiring an
explicit endpoint-order hypothesis and a region disjunction.  It is not
imported by `FrontierLiveClosure.lean`, has no geometric `FreshThird` fields,
and `rg` finds no caller beyond its own declaration.  The normalized packet
contains cap labels `Fin 3`, but no map from carrier points/centers to a
linearly ordered `Fin n` endpoint system and no proof of the theorem's
`hregion`; thus no source-faithful adapter to this order partition exists.

## Bottom line

`support_eq_radius` is an available local metric adapter and already powers
the distinct-three-center terminal, but that arm is excluded before the
normalized residual.  Equal-center rows reduce to exact-four support and
endpoint omission; omission rows reduce to deletion survival; distinct-cap
and same-cap/internal-source rows remain without an existing metric or order
consumer.  Closing line 9806 therefore still needs a new branch-specific
consumer (or a stronger producer), not a wrapper around
`support_eq_radius`, `FreshThirdOrderPartition`, or the current metric
terminal.
