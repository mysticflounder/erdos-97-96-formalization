# Cut admission ledger

The v1 round admits no speculative cuts.

| Encoded clause | Lean source status |
|---|---|
| Exact first/common/opposite supports | field of `FirstFiberCrossedThreeRowExactSupports` |
| Cross-pair endpoint disjointness | live hypothesis `hpairsDisjoint` |
| All four source endpoints lie in the first-cap interior | live hypothesis `hfrontierInteriorEq` |
| Both source rows have cardinality four and reciprocal incidence | `CapSourceThirdCanonicalRowWitness` plus `TwoCapSourcesMutualCrossMembership` |
| Twelve common endpoint deletion-arm pairs | `FreshThirdAlignedCommonDeletionCorePairPacket` |
| Nonshared fourth-blocker avoidance | `sharedFourth_or_crossBlockers_avoid_namedRows` |
| Shared or nine saturation arms | `sharedFourth_or_selectedRowOmissionSaturation` |
| Source-blocker cap blocks and separation | `FreshThirdAlignedMutualBlockerBoundaryPacket` |
| Fourth-blocker cap interval | `exists_blockerCenter_capIndex_and_boundaryPosition` |
| Equal actual blockers imply equal selected supports | `ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq` |
| Optional two-row shared-late-pair exclusion | `CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair` |
| Optional four-row chained-late-pair exclusion | `CapCrossingKalmansonBridge.false_of_four_selected_rows_chained_late_pair` |

Not admitted: blanket point distinctness beyond the stated support and source-
pair hypotheses, fixed ambient cardinality, cyclic
positions for anonymous row fillers, invented positive incidence, Kalmanson
inequalities, full minimal-deletion-core semantics, or any theorem imported
from an off-spine scratch/attic module.
