# Fresh-third normalized-residual terminal audit (2026-08-02)

Scope: source-faithful theorem-bank and adapter audit for
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9806`.
No production Lean files were changed.  The theorem remains a load-bearing
`sorry`.

## Current obligation and checked residual shape

The terminal receives `C : TwoCapSourceThirdCanonicalRowSurface P Pρ`,
`Q : FreshThirdBlockerFiber P Pρ`, two interactions
`FreshThirdCapSourceInteraction P Pρ C.firstSource Q` /
`... C.secondSource Q`, and
`hresidual : FreshThirdNormalizedResidualCase P Pρ C Q`.  The surrounding
`include` supplies the live context
`hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T
hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP`.

`FreshThirdNormalizedResidualCase` has exactly three constructors
(`FrontierLiveClosure.lean:9203`):

* `firstNonHit` / `secondNonHit`, each carrying
  `FreshThirdCapSourceNonHit`; its `sourceRowOmission` payload is a deleted
  carrier vertex, equality to `Q.source₁` or `Q.source₂`, non-membership in
  the source selected support, and `HasNEquidistantPointsAt 4` after erase.
* `equalCrossRowCenters`, carrying hits for both rows and equality of their
  selected centers.

The distinct-cross-row arm is already closed by
`false_of_two_freshThirdCrossRowHits_distinctCenters` (the perpendicular
bisector three-center bound).  The remaining normalized residual has no
checked contradiction producer.

## Candidate APIs and adapter feasibility

| API (source) | Exact hypotheses / output | Matching residual arm | Feasibility and status |
|---|---|---|---|
| `ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support` (`P97/ATail/CriticalPairFrontier.lean:781`) | For `H : CriticalShellSystem A`, `q ∈ A`: `HasNEquidistantPointsAt 4 (A.erase w) (H.centerAt q hq) ↔ w ∉ (H.selectedAt q hq).toCriticalFourShell.support`. | `firstNonHit.sourceRowOmission` / `secondNonHit.sourceRowOmission`. | **Direct normalization only.** It converts the two payload fields into the same deletion-survival fact. It has no cap-card, Kalmanson, endpoint-order, or contradiction conclusion; cannot close either leaf. |
| `ATailThirdCenterCommonPair.frontierDeletionSurvival_or_actualBlocker_eq_knownCenter` (`P97/ATail/ThirdCenterCommonPair.lean`, around 300) | Requires a `SurvivorPairRelocationPacket P` (frontier pair `q,w`, marginal-class membership, deletion-survival/radius data), `hwSupport`, and `hqBlocker_ne_first`; concludes two deletion-survival alternatives or `center source = S.oppApex1` / `center source = center P.q`. | Source-row omission, if one could package it as a relocation packet. | **No adapter from current hypotheses.** `FreshThirdBlockerFiber` has fresh blocker points, but no retained `P` relocation pair, marginal membership, radius equalities, or first-apex blocker inequality. A producer of a new packet would be substantive proof work, not an adapter. |
| `ATailThirdCenterCommonPair.false_of_thirdActualCenter_selectedRow_contains_frontierPair` (same file) | Same `SurvivorPairRelocationPacket P`; a source selected row containing both frontier points; center inequalities versus first apex and `P.q`. | A non-hit row does contain `Q.source₁,Q.source₂` in the omission branch only as deleted candidates, not as a retained `P` pair. | **Not applicable.** Fresh-third has no `P.q/P.w` packet or required center inequalities. |
| `commonCollisionEndpointOmission_or_complementaryMembership` (`FrontierLiveClosure.lean:8469`) | For `FirstFiberCapSourceWitness` rows `source,source'`, returns either `CommonCollisionEndpointOmission` or complementary membership of both collision pairs in the two rows. | `equalCrossRowCenters` after exact-row support is derived. | **Partial only.** `commonCollisionEndpointOmission_of_equalCenterHits` applies the API and resolves the complementary branch via `false_of_equalBlockers_complementaryMembership` (`:8529`), leaving `CommonCollisionEndpointOmission`/endpoint omission. No terminal consumes this omission for a fresh-third packet. |
| `allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq` (`FrontierLiveClosure.lean:8418`) | Two `FirstFiberCapSourceWitness` rows, equal blocker vertices, and exact support-cap intersection `(selected support) ∩ cap = {source,source'}`; outputs `AllCollisionEndpointsOmitted`. | Equal-center hit branch only if it could be converted to first-fiber witness rows. | **Mismatched packet.** Fresh-third supplies exact four-point source rows, not shell∩cap equality or `FirstFiberCapSourceWitness`; no source-clean conversion is present. |
| `allCollisionEndpointsOmitted_of_equalCenterHits` (`FrontierLiveClosure.lean:9436`) | Both `FreshThirdCrossRowHit`s plus equal source centers; outputs `AllCollisionEndpointsOmitted` for the four collision endpoints. | `equalCrossRowCenters`. | **Positive but non-terminal.** This is the strongest checked consequence: exact four-row support and simultaneous endpoint omission. There is no theorem deriving `False` from it for `FreshThirdBlockerFiber`. |
| `collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted` (`FrontierLiveClosure.lean:9824`) | Requires `Q : FreshOutsideFirstBlockerFiber P Pρ`, `source,source'` and a `FirstFiberCapSourceWitness source`, plus `AllCollisionEndpointsOmitted`; outputs `FirstFiberCollisionFiveCenterDeletionResidual`. | Equal-center omission, in principle. | **Cannot adapt.** `FreshThirdBlockerFiber` and its source rows are different structures; no fields provide `FreshOutsideFirstBlockerFiber` or first-fiber source witnesses. A bridge would need a new producer and would still yield a residual, not `False`. |
| `ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary` (`P97/ATail/FiveCenterDeletionBoundary.lean:59,90`) | Five q-free exact-cardinality-four rows, unique actual-blocker/failure and five named centers; output is a positive `FiveSurvivorExactRowsBoundary`. | Deletion-survival leaves after repeated descent. | **Boundary certificate only.** It does not contradict the fresh-third residual; no theorem in the live spine consumes this boundary to `False`. |
| `ATailCardElevenUniqueFourCertificate.false_of_firstApexUniqueRadiusExactFourResidual` (wrapper at `FrontierLiveClosure.lean` near the card-11 ingress) | `FirstApexUniqueRadiusExactFourResidual` (minimal/no-M44/card > 9, first-apex selected class exactly 4, unique radius class, all radius deletions blocked, two interior points, bisector-center cap inclusion) plus `D.A.card = 11`. | Neither source-row omission nor equal-center hit. | **Hypotheses absent.** Fresh-third carries cap cardinality ≥ 8 and row/deletion data, but no card-11, first-apex exact-four/unique-radius package. |
| `CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_013_412_523` (`P97/ATail/KalmansonThreeEqualitySchemas.lean:32`) and sibling schemas | Requires finite carrier `A`, `ConvexIndep A`, injective enumeration `phi : Fin A.card → ℝ²` with image `A`, `IsCcwConvexPolygon phi`, six strictly ordered indices, and three specified shell-distance equalities (other schemas require 5–7 ordered points/equalities). | Equal-center exact-row arm. | **No local adapter.** `FreshThirdNormalizedResidualCase` has no boundary enumeration, injectivity/image/CCW order, or the required distance equalities. Exact four-point row support does not imply a Kalmanson pattern. |
| `KalmansonRadiusOrderReversal.false_of_seven_ccw_radius_order_reversal_equalities` / `KalmansonSixteenEqualitySchema.false_of_fourteen_ccw_sixteen_shell_equalities_global_core` | Convex/injective/CCW enumeration plus 7 ordered radius equalities, or 14 ordered vertices plus 16 global shell equalities. | Equal-center arm. | **Infeasible from packet.** Supplying these would require a new global embedding/order and metric-equality producer, not a theorem-bank adapter. |

## Conclusion

The source-clean status is **no terminal closure**.  The checked residual
producers reduce the problem to (i) deletion-survival facts for a non-hit row,
or (ii) an equal-center exact-four-row packet and `AllCollisionEndpointsOmitted`.
Every candidate contradiction API either has incompatible first-fiber/
relocation/cardinality hypotheses or is a positive boundary certificate.  The
refactor plan records the same frontier: “no existing source-clean producer”
for the fresh-third terminal and no embedding/order bridge for imported
Kalmanson or sparse-Euclidean contradictions
(`docs/false_of_capSourceThirdCanonicalRowSurface_refactor-plan-07-31-2026.md`,
§§ residual-terminal audit and exact-11/Kalmanson notes).

Therefore the `sorry` at `FrontierLiveClosure.lean:9814` should remain an
explicit active obligation; promoting any candidate above would overclaim
closure.  The first missing bridge is a new source-clean occurrence/embedding
or direct incidence contradiction for the normalized fresh-third residual.
