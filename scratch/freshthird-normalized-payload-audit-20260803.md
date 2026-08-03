# FreshThird normalized residual payload audit (2026-08-03)

Scope: inspect `CapSourceThirdCanonicalRowSurface`,
`TwoCapSourceThirdCanonicalRowSurface`, `FreshThirdCapSourceInteraction`,
`FreshThirdCapSourceNonHit`, and `FreshThirdNormalizedResidualCase` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean` for a source-faithful
terminal bridge. No production Lean files were changed.

## Live payload

- `CapSourceThirdCanonicalRowSurface` is defined in
  `TwoCollisionGlobalProducer.lean:552-577`: cap cardinality `>= 8`, one source
  in `oppIndex1` cap interior and outside the four collision endpoints, center
  inequalities against the two collision blockers and two named apices, exact
  support membership/cardinality, and two collision-pair deletion views.
- `TwoCapSourceThirdCanonicalRowSurface` (`FrontierLiveClosure.lean:8572-8580`)
  adds two distinct such source witnesses, but no common radius, source-source
  mutual support incidence, or relation between their actual blockers.
- `FreshThirdCapSourceNonHit` (`9782-9801`) has only:
  `sameBlocker(center_eq, support_eq)`, or
  `sourceRowOmission(deleted = Q.source1/source2, deleted_not_mem,
  deletion_survives)`.  The omission constructor carries no center inequality,
  cap placement, second-endpoint membership, or source-source relation.
- `FreshThirdNormalizedResidualCase` (`9834-9846`) packages either non-hit arm
  or the equal-center two-hit arm.  The load-bearing theorem at `10562-10571`
  receives both original interactions and the residual case, but no coherence
  equation linking each `data` packet to the corresponding interaction.

## Existing candidate bridges and first missing premises

1. `false_of_twoCapSources_oneSidedDeletionSurvival` (`12946-12967`) is the
   closest deletion terminal, but it requires a
   `FreshOutsideFirstBlockerFiber P Pρ`, common `SelectedClass ... commonRadius`
   membership for both sources, and the first-fiber blocker/source-shell packet.
   A normalized `FreshThirdBlockerFiber` plus one omitted fresh endpoint does
   not provide any of these; `C` has no common-radius field.
2. `false_of_twoCapSources_mutualCrossMembership_distinctBlockers`
   (`12760` onward), `false_of_twoCapSources_complementaryMembership`
   (`12620`), and the private `false_of_twoCapSources_of_blockers_off_firstCap`
   (`12495`) require mutual cross-membership between the two cap-source rows and
   blocker/cap hypotheses.  `FreshThirdCapSourceNonHit` only talks about `Q`
   endpoints in one source row, so it cannot supply source-source mutuality.
3. `ThirdCenterCommonPair.frontierDeletionSurvival_or_actualBlocker_eq_knownCenter`
   (`ThirdCenterCommonPair.lean:227`) converts a pair of deletion outcomes into
   survival/alignment alternatives.  It does not contradict the one-sided
   survival carried by `sourceRowOmission`; the required *two blocked
   deletions* are absent.
4. `false_of_freshThirdEqualCenter_sameCapOppIndex` (`10025-101xx`) and
   `false_of_two_freshThirdCrossRowHits_distinctCenters` (`10258-10343`) require
   both positive `FreshThirdCrossRowHit` proofs.  A non-hit arm explicitly lacks
   at least one endpoint membership.
5. `false_of_freshThird_sameCapCrossRowAlignment` (`8730-8779`) requires both
   `Q.source1` and `Q.source2` in the same cap-source support and outside their
   common cap.  `sourceRowOmission` gives the opposite (one endpoint omitted)
   and no cap placement.

`ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq` and
`cross_deletion_survives_iff_not_mem_selected_support` only reproduce the
`sameBlocker` support equality or the `sourceRowOmission` survival/omission;
they are normalization bridges, not contradictions.

## Payload verdict

No source-faithful terminal/import-only bridge closes `firstNonHit` or
`secondNonHit` from the current payload. The first missing mathematical bridge
would have to strengthen the non-hit packet with at least one of:

- a common first-apex radius plus conversion to a `FreshOutsideFirstBlockerFiber`
  (to use the one-sided-deletion terminal);
- both fresh-endpoint deletions blocked (or a two-source deletion descent), plus
  source-source mutual incidence and blocker/cap placement; or
- positive cross-row membership for both fresh endpoints (to use an existing
  equal-center/distinct-center terminal).

Additionally, the normalized residual theorem's separate `firstInteraction` /
`secondInteraction` arguments are not definitionally tied to the `data` fields;
any proof relying on constructor coherence must first establish it by a
constructor case split. Mixed constructors are often contradictory, but the
sameBlocker/sameBlocker and sourceRowOmission/sourceRowOmission cases remain
consistent and unresolved.
