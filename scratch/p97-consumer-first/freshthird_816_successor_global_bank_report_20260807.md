# FreshThird 816-motif / weakened fixed-successor global theorem-bank pass (2026-08-07)

## Round artifact

The completed 816-motif round is recorded in:

- `scratch/p97-consumer-first/freshthird_metric_linear_relaxation_v3_emit.log`
- `scratch/p97-consumer-first/freshthird_metric_linear_relaxation_v3_z3.log`
- `scratch/p97-consumer-first/freshthird_metric_linear_relaxation_v3_dual_input.json`
- `scratch/p97-consumer-first/freshthird_metric_linear_relaxation_v3_dual.json`

The first two logs report `four_row_motif_witnesses=816`, `representatives=28`, 96 row-shared-pair cuts, 36 named row-pair cuts, and the fixed structural survivor aliases `f1/w2`, `qBetween/drowCenter`, `f2/pinnedCenter`, `c2/w1`; blocker rows are one-hot (`1000,0100,0010,0001`). The weakened exact-support-disequality-omitted packet is SAT (`z3`, 5.406 s), while the full fixed-row dual report is `NO_DUAL_FOUND_BY_HIGHS` and explicitly theorem-discovery-only. The ten-role cut pattern is

`x < qOutside < freshCenter < pinnedCenter < w[k] < b[j] < w[j] < b[i] < b[k] < w[i]`,

with `x` in shells `i,j` and `pinnedCenter,w[i]` in shell `k`.

## Search coverage

Agentic all-corpus searches (all configured Lean corpora) are saved as:

- `freshthird_816_successor_bank_agentic_1.txt` (exact 816/10-role motif)
- `freshthird_816_successor_bank_agentic_2.txt` (cap/row-count, repeated-cap, mutual-omission)
- `freshthird_816_successor_bank_agentic_3.txt` (strict order and weighted cancellation)

Verified `nthdegree docs show --lean` excerpts are saved in `freshthird_816_show_<HANDLE>.txt`.

The four canonical P97 registries named by `AGENTS.md` were searched directly. They contain no declaration matching this exact FreshThird successor motif; their Kalmanson entries are generic bank descriptions only.

## Reusable declarations found

### Exact source/cap/row producers and successor consumers

- `SourceFaithfulSelectedFourDeletionFan` and `sourceFaithfulDeletionFan_of_triApexAllLargeContext` (`TriApexEndpointRetainedOmission.lean:988,1017`) — cardinality-independent source-level fan: every selected-row point has a cap-localized blocking actual blocker and either equal-support/non-robust or distinct-center/row-intersection-at-most-two.
- `exists_distinct_support_points_with_same_blockerCap` (`TriApexEndpointRetainedOmission.lean:1050`) — four-row pigeonhole yields two distinct sources with blockers in one strict cap.
- `exists_repeatedBlockerCap_pair_outcome` — same-cap pair split: coincident blockers, source in closed cap, or one cross-deletion survives.
- `nonrobustCenter_or_exists_sameCap_blockerCollision_or_crossDeletion` (`TriApexEndpointRetainedOmission.lean:1406`) — carrier-centered universal split.
- `exists_distinct_physicalInterior_not_mem_actualCriticalSupport` and `exists_distinct_physicalInterior_survives_actualBlocker` (`LargeCapUniqueFivePhysicalOmissionSuccessor.lean:117,157`) — cap-cardinality (`at least 3` physical points vs support intersection `<=2`) gives a distinct omitted successor and cross-deletion survival.
- `successor_not_mem_actualCriticalSupport`, `successor_deletion_survives_actualBlocker`, `successor_actualBlockers_ne`, `successor_actualCriticalSupport_inter_card_le_two`, and `period_le_five` (`LargeCapUniqueFivePhysicalOmissionCycle.lean:326–386`) — exact-five physical successor/cycle consumer; applies to an exact-five physical cap class, not the FreshThird 28-representative fixed table.
- `PhysicalActualCriticalMutualOmissionEdge.reverse_deletion_survives_actualBlocker` and `nonempty_mutualOmissionEdge_or_all_reverseMembership` (same file:423,443) — mutual-omission successor split.
- `sameCapCount_le_one` (`P97/N8/N8kDistribution.lean:799`), `orderedCap_selected_support_inter_card_eq_of_six_five`, `selectedFourClass_inter_capByIndex_card_le_two`, `selectedFourClass_inter_orderedCap_first_card_le_one`, `..._last_card_le_one` (`CapSelectedRowCounting.lean:192,234,278,305,496`) — generic cap/row-count bounds and equality census. These are producers for the weakened successor profile, not a direct ten-role metric consumer.
- `false_of_weightedKalmansonCancellationData_of_check` (`GenericRowNogoodCertificate.lean:720`) — cardinality-generic weighted strict-Kalmanson cancellation consumer. It is the closest generic metric consumer, but the FreshThird successor's ten-role shell/row pattern has no existing adapter to its `RowPattern`/`WeightedKalmansonCancellationData` certificate.
- `FreshThirdFivePointKalmansonOrder`, `freshThird_canonicalDifferentCap_fivePointKalmansonOrder` — order producers only; require deletion-row equalities for contradiction.
- `false_of_freshThird_four_order_arms` and `false_of_freshThird_canonicalDifferentCap_of_endpointDeletionObstructions` — cardinality-free Kalmanson consumers, but their four-arm/four-endpoint-deletion equality packets do not match the weakened successor's ten-role shell partition.

## Classification / gap

No exact bank hit exists for the 816-motif followed by the SAT weakened fixed successor. Existing bank content splits into (i) cap-count and actual-blocker successor producers, (ii) mutual-omission/cross-deletion consumers, and (iii) generic Kalmanson cancellation. The first missing bridge is a source-faithful adapter that converts the ten-role shell memberships and successor deletion rows into the positive weighted-Kalmanson cancellation certificate (or a direct cardinality-free theorem). SAT of the weakened QF_LRA packet and `NO_DUAL_FOUND_BY_HIGHS` are diagnostic/theorem-discovery evidence only; neither is a universal Euclidean closure.
