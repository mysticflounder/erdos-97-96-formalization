# FreshThird cyclic-order/Kalmanson route probe (2026-08-05)

## Verdict

The cyclic-order/Kalmanson route is not currently viable as a source-clean
consumer of the normalized `FreshThird` residual.  No parked Lean probe was
built: every direct application would require adding unproved boundary/order
or metric-adapter hypotheses, so such a probe would not be promotion-ready.

## Residual data audited

`FrontierLiveClosure.lean:12777-12797` defines
`FreshThirdNormalizedResidualRemainingCase`.  Its `equalCrossRowCenters`
constructor has two cross-row hits, equality of the two row centers, and two
`FreshThirdNonCanonicalInteraction`s.  The load-bearing theorem
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
(`FrontierLiveClosure.lean:12821-12828`) is still `by sorry`.

The noncanonical interaction packet (`FrontierLiveClosure.lean:11872-11934`)
has the following cap information.

* `distinctBlockersDifferentCaps` puts the two row centers in distinct
  `capInteriorByIndex` values and gives the exact two-source support overlap.
* `sameCapWithInternalFiberSource` puts both row centers in one
  `capInteriorByIndex` and gives only
  `Q.source₁ ∈ S.capByIndex capIndex ∨ Q.source₂ ∈ S.capByIndex capIndex`.
* `FreshThirdBlockerFiber` (`BlockerMultiplicityGeometry.lean:70-90`) itself
  has no cap membership for either source.

Thus no constructor supplies four boundary vertices, a cyclic order, or even
the required both-outside/both-inside classification for a common cap.

## Existing Kalmanson consumers

`CapCrossingKalmanson.dist_add_dist_lt_diagonal_sum_of_ccw`
(`CapCrossingKalmanson.lean:240-249`) requires a `ConvexIndep` carrier, an
injective boundary enumeration with exact image, CCW convexity, and strict
indices `ia < ib < ic < id`.  The nearest contradiction,
`false_of_two_selected_rows_shared_late_pair`
(`CapCrossingKalmanson.lean:427-454`), additionally requires two
`SelectedFourClass` rows and both late boundary points in both supports.  The
FreshThird shell/row fields do not produce these named boundary indices or
row equalities.

`FreshThirdOrderPartition.freshThird_pair_order_partition`
(`FreshThirdOrderPartition.lean:23-34`) is only an `omega` partition: it
assumes the pair is wholly inside or wholly outside the two-center interval.
It cannot derive that region hypothesis and does not handle the
one-inside/one-outside disjunction in `sameCapWithInternalFiberSource`.

`SurplusCapPacket.capInteriorByIndex_open_interval_of_global_indices`
(`SurplusM44Packet/Shard02.lean:291-302`) can place one cap-interior point
between that cap's own triangle endpoints, but requires a shared global
injective/image/CCW boundary and ordered support endpoints.  It supplies no
relative order between points from two different caps, and the FreshThird
sources are not known to be cap-interior points.

## Exact first missing bridge

To make this route source-clean, a producer must first establish a full
convex-boundary packet (injectivity, image, CCW orientation, and strict index
placement) for the two centers and both blocker sources.  It must also convert
the selected-shell radius equalities into chord-equidistance or
`SelectedFourClass` support equalities.  For the same-cap arm, the immediate
missing fact is stronger: one-inside/one-outside must be refined to a strict
cyclic cut/order (or to a new independent same-cap incidence contradiction).
The existing both-outside cap consumer cannot be weakened to this mixed case,
and the finite order partition cannot supply the geometric hypotheses.

Therefore the normalized residual remains open/on-spine with no
source-clean cyclic-order/Kalmanson consumer; further work belongs in a new
producer/adapter, not in a wrapper around the existing Kalmanson theorems.
