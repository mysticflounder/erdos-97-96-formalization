# Fresh-third residual: metric/order bridge audit (2026-08-03)

Target: `FrontierLiveClosure.lean:11324`,
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`.
The target is still a load-bearing `sorry`.  Its remaining packet has
`firstNonHit`, `secondNonHit`, and `equalCrossRowCenters`; the last constructor
has distinct centers syntactically identified by an equality, with each
`FreshThirdNonCanonicalInteraction` either distinct-cap or same-cap with
`capIndex ≠ S.oppIndex1`.  In the same-cap branch the only fiber incidence is
`Q.source₁ ∈ cap ∨ Q.source₂ ∈ cap` (one-inside/one-outside is therefore
possible); no boundary index or cyclic order is present.

## Nearest source-clean consumers

All declarations below have source bodies without `sorry`; this is a
source-clean audit, not a fresh kernel/axiom audit.

| declaration (file:line) | required bridge | fit to current residual |
|---|---|---|
| `Problem97.CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair` (`CapCrossingKalmanson.lean:427`) | A strictly convex CCW boundary, four indices `ia < ib < ic < id`, and rows at `ia, ib` both containing the late pair `ic,id`. | Closest direct selected-row consumer: the two exact-four rows contain the same `Q.source₁,Q.source₂` pair.  The residual has no four-point linear/cyclic order placing the two `C` centers before that pair (or any equivalent cut), so no application.  `CapCrossingKalmanson` is import-reachable through `KalmansonThreeEqualitySchemas`/`FrontierLiveClosure`. |
| `...false_of_four_ccw_endpoint_centers_bisect_middle_pair` (`CapCrossingKalmanson.lean:462`) | Four ordered boundary points `ia < ib < ic < id`; endpoint rows at `ia,id` each equidistant from middle pair `ib,ic`. | Could consume if an order producer gives `C.first < Q₁ < Q₂ < C.second` (up to a cyclic cut) and exact row equalities.  No such order is carried. |
| `...false_of_four_ccw_middle_centers_bisect_endpoint_pair` (`CapCrossingKalmanson.lean:493`) and selected-row adapter `...false_of_two_selected_middle_rows_shared_endpoint_pair` (`:523`) | Four ordered points; middle rows at `ib,ic` each equidistant from endpoint pair `ia,id`. | Could consume if `Q₁ < C.first < C.second < Q₂` (up to cut).  Again the missing datum is order, not a metric rewrite. |
| `Problem97.false_of_two_centers_equidistant_pair_after/enclosed/split/before` (`TwoCenterBisectorParity.lean:53,74,112,134`) | Same two-center/equidistant-pair equalities with one of four explicit boundary arrangements. | Mathematically the right one-inside/one-outside metric shape, but this module is **not import-reachable** from `FrontierLiveClosure` (only imported by `...IndexedSource/CyclicAlternationCore.lean`).  It still needs an order producer and an explicit import if promoted. |
| `Problem97.ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair` (`card_five_cross_blocker_localization.lean:68`) | Both centers and the cap apex lie in one indexed cap; both carrier points are **outside** that cap; both centers bisect the pair. | Wrong polarity for the live same-cap constructor: it only proves `Q.source₁ ∈ cap ∨ Q.source₂ ∈ cap`, so one source may be inside.  The declaration is also outside the Frontier import closure. |

The five-/six-point schemas (`FivePointEuclideanObstruction.lean`,
`KalmansonThreeEqualitySchemas.lean`, `EndpointFreshFiveRoleKalmanson.lean`)
require an explicit 5/6-point CCW placement and three or more equalities;
the residual exposes only four support points and two equal-row equalities.
`KalmansonRadiusOrderReversal` requires seven ordered points and 3--4 rows,
and `OrdinalKalmansonCycle` is not imported and needs an ordinal comparison
cycle.  Neither is a direct consumer.

## Verdict / first missing bridge

There is no current source-clean theorem that directly closes
`FreshThirdNormalizedResidualRemainingCase`, in particular not the
noncanonical same-cap one-inside/one-outside arm.  The nearest executable
route is a producer of a cyclic/linear order for
`(C.firstCenter, C.secondCenter, Q.source₁, Q.source₂)` plus the corresponding
row equalities, after which one of the four-point Kalmanson/bisector terminals
above applies.  The alternative is a genuinely new metric theorem handling
one source inside and one outside a common cap, or a producer strengthening
the branch to common-radius/reciprocal-incidence hypotheses.  The current
adapter packet alone is diagnostic and must not be promoted as closure.

