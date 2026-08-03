# FreshThird normalized-remaining adapter audit (2026-08-03)

Target: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` (`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`, around lines 11324--11330).

Conclusion: no non-circular, source-clean route closes the target with the current `C`/`Q` interface.  The theorem remains a load-bearing `sorry`.

## Reachability and theorem-bank checks

- A scratch import probe (`scratch/freshthird_probe.lean`) resolves the target and nearby declarations.  `#print axioms` for the target reports `sorryAx` (alongside the standard `propext`, `Classical.choice`, and `Quot.sound`).
- `nthdegree docs search --lean` for `false_of_twoCapSources_mutualCrossMembership_distinctBlockers` and the FreshThird residual found no theorem-bank consumer for this residual case.
- `false_of_twoCapSources_mutualCrossMembership_distinctBlockers` is declared later in the same file (around line 13720), so it is not forward-reachable at the target.  Its interface additionally needs one `commonRadius`, both source vertices in `SelectedClass D.A S.oppApex1 commonRadius`, mutual C-row incidence, and distinct blocker centers.  `CapSourceThirdCanonicalRowWitness` supplies strict-cap/own-row data and deletion-survival views, not a common radius; non-hit residual branches supply no reciprocal C-row incidence; the equal-center branch has equal (not distinct) blocker centers.
- `false_of_twoCapSources_of_blockers_off_firstCap` (around line 13455) is `private` and later than the target.  The later complementary-membership adapter (around line 13580) requires `FirstFiberCapSourceWitness` and complementary P-endpoint memberships, whereas `C` carries `CapSourceThirdCanonicalRowWitness` with `CrossPairDeletionView` omissions.  These are not type-compatible substitutions.
- `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two` is import-reachable, but applies only to the canonical equal-center/same-cap `oppIndex1` slice; that branch is already consumed by `false_of_freshThirdEqualCenter_sameCapOppIndex`.  Residual noncanonical interactions have distinct caps or same-cap index `≠ S.oppIndex1`, and no shared three-point cap slice is exposed.

## Residual branch ledger

1. `firstNonHit`: `FreshThirdCapSourceNonHit` is either `sameBlocker` or one-sided `sourceRowOmission`, followed by an arbitrary second interaction.  Neither gives reciprocal C-source support/common-radius data, and no exact-four consumer accepts this packet.
2. `secondNonHit`: symmetric obstruction.
3. `equalCrossRowCenters`: `freshThirdEqualCenterExactFourRow_of_hits` can produce exact four-point rows, but the residual interactions explicitly exclude the canonical `oppIndex1` cap.  Distinct-cap interactions have no common cap; same-cap-internal interactions expose only one Q endpoint as a cap member.  The equal blocker centers also defeat the distinct-blocker mutual-membership theorem.

The first missing invariant is therefore a producer enforcing common first-apex radius plus mutual C-source support (and, where needed, distinct blockers), or a new branch-specific cross-cap/metric terminal.  Existing adapters are either incompatible, private/later, or already cover the removed canonical branch.
