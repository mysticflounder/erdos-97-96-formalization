# FreshThird post-four-row SAT: source-entitlement audit

Date: 2026-08-07  
Run: `freshthird_all_selected_row_pair_cut_round.results.txt`

## Verdict

The latest successor is structural `SAT` (96 inherited + 36 additional
`selectedFourClass_shared_pair_separated` cuts); its metric phase is `UNKNOWN`
after 120 s and `final_exact_result=sat` extracts no contradiction.  The
representative has all four blocker-cap labels equal to `2`, with blocker-row
patterns `1000,0100,0010,1001`.  The finite aliases and row/cap profile are
not source identities.

There is no sound one-line cut that separates this witness from the complete
`SourceFaithfulSelectedFourDeletionFan` semantics.  The witness falls exactly
into the branch that the current encoder omits: a repeated-cap pair of
distinct canonical blockers, with both source points outside that cap, must
have a cross-deletion survivor.  That survivor is permitted by the source
theorem, not forbidden by it.  Therefore the smallest source-entitled
strengthening is a semantic **branch extension**, not a contradiction cut:
represent the crossed deletion(s) and their `HasNEquidistantPointsAt 4`
certificates, then pass them to a consumer.  Until such a consumer exists, the
SAT witness is an under-encoded survivor rather than a countermodel to the
complete fan.

## Encoder atom -> source entitlement

| Encoder atom | Source-level meaning / status at `false_of_freshThird_pinnedEndpoint_outsideSeedResidual` |
|---|---|
| `blocker_cap[z,k]` | `SourceFaithfulSelectedFourDeletionFan` supplies `∃ blockerCap, H.centerAt w ... ∈ S.capInteriorByIndex blockerCap` for each row point, via `sourceFaithfulDeletionFan_of_triApexAllLargeContext`; it is not a direct theorem argument. |
| `source_cap[z,k]` | `z.1 ∈ S.capByIndex blockerCap`, used by `exists_repeatedBlockerCap_pair_outcome`; only `hsource₁OutsideFirst`/`hsource₂OutsideFirst` give named outside facts at ingress. Arbitrary per-row cap bits are unsupported labels. |
| `contains[z,j]` | Membership of row point `w_j` in `(H.selectedAt w_z ...).toCriticalFourShell.support`; the fan gives equal-support or intersection-cardinality ≤ 2, but a Boolean matrix needs an explicit support enumeration/transport lemma. |
| `b_z = b_w` | The collision disjunct `H.centerAt z.1 z.2 = H.centerAt w.1 w.2` in `exists_repeatedBlockerCap_pair_outcome` and `nonrobustCenter_or_exists_sameCap_blockerCollision_or_crossDeletion`. |
| `same cap` | The existential pair and common `blockerCap` from `exists_distinct_support_points_with_same_blockerCap Row hfan`; the saved `2222` assignment for all four blockers is stronger than this theorem. |
| `z,w outside cap` | Negations of `z.1 ∈ S.capByIndex blockerCap` and `w.1 ∈ ...`; these are premises to `crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair`, not universally available for every encoder row. |
| `cross_z_survives` | Exact source conclusion `HasNEquidistantPointsAt 4 (D.A.erase w.1) (H.centerAt z.1 z.2)`. |
| `cross_w_survives` | Exact source conclusion `HasNEquidistantPointsAt 4 (D.A.erase z.1) (H.centerAt w.1 w.2)`. |

The current Python encoder has no atom or support object for either crossed
`HasNEquidistantPointsAt` survivor.  Its cap/containment clauses therefore
cannot replay the final disjunction of `exists_repeatedBlockerCap_pair_outcome`.

## Recommended next step

Do not add a fixed-`n` bound, distinctness axiom, or Euclidean metric clause.
Add a bounded source-faithful cross-survivor record for the repeated-cap pair
(survivor center plus an exact four-point selected row after the opposite
deletion), and prove its extraction/lift from
`crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair`.  Then seek
an existing terminal consumer for that survivor.  If no consumer is found,
this round remains diagnostic and closes no sorry.
