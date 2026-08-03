# FreshThird equal-center / two-circle probe (2026-08-03)

Scope: `P97/TwoCircleCrossing.lean` versus the live normalized residual at
`ATail/FrontierLiveClosure.lean:9203-9817`.

## What the equal-center packet actually gives

`FreshThirdEqualCenterExactFourRow` (around lines 9247-9264), produced by
`freshThirdEqualCenterExactFourRow_of_hits` (9270-9434), gives

* `centers_eq` for the two cap-source rows;
* `capCenter_ne_freshCenter`;
* both selected supports equal to the same exact four-point set
  `{C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1}`.

`allCollisionEndpointsOmitted_of_equalCenterHits` (9507-9590) then derives
`AllCollisionEndpointsOmitted` for the four `P/Pρ` collision endpoints.  This
is finite support/omission data only; it supplies no new circle distinctness,
orientation, or boundary-order hypotheses.

## Two-circle check

`TwoCircleCrossing.lean` exposes
`two_circle_noncollinear_common_point_elim` (lines 58-67), whose required
inputs are two *distinct* `Sphere ℝ²` values, two distinct common endpoints,
membership of all four endpoints in both spheres, a third point in both, and
`signedArea2 endpoint₁ endpoint₂ q ≠ 0`.  The equal-center exact-four rows do
not provide this shape.  In fact `centers_eq` plus the support equalities (and
`support_eq_radius`) identifies the two row radii as equal, so the natural
spheres are the same sphere, not distinct.  No non-collinear third point is
distinguished either: all four named points lie on the one common row.

Therefore no existing declaration in `TwoCircleCrossing.lean` can be applied
to derive `False`.  The first missing two-circle hypothesis would be
`(⟨rowCenter₁,rowRadius₁⟩ : Sphere ℝ²) ≠ ⟨rowCenter₂,rowRadius₂⟩`; this is
incompatible with the equal-center branch unless a different pair of circles
and a new incidence/orientation bridge is produced.

## Existing metric consumers

The nearby checked metric leaf
`false_of_two_freshThirdCrossRowHits_distinctCenters` (around lines
9597-9680) derives `False` from the three points on the perpendicular
bisector of `Q.source₁,Q.source₂`.  Its decisive input is
`hcentersNe : center(firstSource) ≠ center(secondSource)`, exactly the
negation of the equal-center residual arm.  Thus it cannot consume this
packet either.

The all-omission terminal
`false_of_twoCapSources_sameBlockerAllEndpointOmission` (around
11156-11290) is for the *first-fiber* shape and requires, in addition to
`AllCollisionEndpointsOmitted`, a `FreshOutsideFirstBlockerFiber Q`, common
selected-radius membership for both sources, full
`FirstFiberCapSourceWitness`s, mutual cross-membership, blocker equality,
`blocker_mem_capInterior`, and the exact shell/cap intersection
`support ∩ cap = {source,source'}`.  The normalized equal-center packet has a
`FreshThirdBlockerFiber` (blocker distinct from both collision blockers), not
that first-fiber `Q`, and does not supply this shell-intersection packet.

## Conclusion / first live gap

Equal-center exact-four/all-endpoint-omission data is not a direct geometric
contradiction and cannot be routed to the existing two-circle or checked
metric theorem.  The first missing bridge is a producer that converts this
`FreshThirdBlockerFiber` equal-center packet into either:

1. a genuinely **distinct-circle + non-collinear common-point** ledger (for
   `two_circle_noncollinear_common_point_elim`), or
2. a **distinct-center** bisector triple (the hypothesis rejected by the
   equal-center branch), or
3. the separate first-fiber deletion/shell-intersection packet consumed by
   the all-omission terminal.

Absent one of those bridges, the residual remains exactly the load-bearing
`sorry` at `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`
(around line 9806); no existing theorem closes it.
