# First-fiber terminal audit (2026-08-02)

Scope: source/consumer audit of `ATailFrontierLiveClosure.false_of_twoCapSources_freshOutsideFirstBlockerFiber` and its first-fiber five-center downstream branch.  No production Lean files were edited.

## Executive status

`false_of_twoCapSources_freshOutsideFirstBlockerFiber` (source line 8047) is a load-bearing `sorry`; there is no source-clean producer of `False` for its current interface.  Its swap-compatible second-fiber theorem is only an adapter: it swaps `P/Pρ` and calls this theorem, so it cannot close the first target independently.

The first-fiber five-center path is a checked coordinator, not a terminal proof.  The immediate leaves

* `false_of_capSource_firstFiber_outsidePairDeletionExactRows` (line 10915), and
* `false_of_capSource_firstFiber_crossedThreeRowExactSupports` (line 10958)

are both `by sorry`.  `false_of_capSource_firstFiber_collisionFiveCenterDeletion` (line 11004) only pattern-matches the four-arm residual and dispatches to those two leaves.  Consequently `false_of_twoCapSources_sameBlockerAllEndpointOmission` (line 11105) remains transitively open even though its packet construction is source-clean.

## Checked producer chain

From equal-blocker mutual cross-membership, the source-clean chain is:

1. `allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq` supplies all four collision-endpoint omissions.
2. `collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted` (around line 9765) invokes `ATailFirstFiberOverlapDescent.firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion` and returns either the cycle-aligned contradiction or `FirstFiberCollisionFiveCenterDeletionResidual`.
3. `collisionFiveCenterExactRows_of_deletionResidual` normalizes that residual to exact rows.
4. `firstFiberOutsidePair_fiveCenter_or_crossed` and its exact-row normalizers produce the four-way outside-pair residual.
5. `false_of_capSource_firstFiber_collisionFiveCenterDeletion` dispatches to the two open leaves above.

The source-clean producer therefore reaches the exact missing terminal interface, but does not prove it.

## Other live branches

`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual` (line 9740) is another open `sorry`.  The residual coordinator at line 11165 is source-clean only up to this normalized residual and the same-blocker terminal.  The distinct-cross-row arm in `false_of_twoCapSources_freshThirdBlockerFiber_core` is source-clean; the residual arm is not.

The one-sided route does not provide an independent terminal.  `sixCenterDeletionSurvivalPacket_of_oneSided` (line 11973) is a source-clean producer of a two-way `SixCenterDeletionSurvivalPacket`, but no consumer of that packet to `False` exists in the live file or the searched theorem-bank corpora.  The compatibility theorem `false_of_twoCapSources_oneSidedDeletionSurvival` (line 12124) instead constructs a `TwoCapSourceThirdCanonicalRowSurface` and calls the open first enlarged-fiber target, creating a direct cycle if used as its producer.  `false_of_twoCapSources_firstFiber` (line 12151) consequently remains a coordinator whose one-sided branch loops back to the open target.

## Exact missing bridges

1. **Deletion arms:** prove `False` from `FirstFiberOutsidePairExactRowsResidual` plus `FirstFiberCollisionFiveCenterExactRowsResidual`, retaining the named deleted endpoint and all four collision omissions.  Existing first-fiber sinks (`false_of_firstFiber_explicit_overlap_card_ge_three`, `false_of_firstFiber_bothOutsideHits_and_firstPairHit`, and `false_of_firstFiber_twoOutsideHits_of_capCenter`) require different positive-incidence hypotheses and do not consume this residual.
2. **Crossed arms:** prove `False` from the crossed three-row support residual.  The missing local bridge is an importable equality/shared-fourth-point theorem for the crossed rows (e.g. identifying the unnamed fourth support points); no such theorem was found in the indexed project or sibling theorem-bank corpora.  The existing support-intersection theorem for distinct blockers only gives `{source, source'}` and is not a crossed opposite-blocker consumer.
3. **Fresh-third residual:** prove the normalized fresh-third residual (`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`) or provide a checked terminal that consumes the retained third-fiber data.  The current `sameBlockerAllEndpointOmission` route reduces to (1) and (2), so proving only the coordinator does not close the target.
4. **One-sided branch:** add a terminal consumer for `SixCenterDeletionSurvivalPacket` (or a finite theorem-bank contradiction with matching hypotheses).  Until then, do not count the packet producer or the compatibility adapter as closure.

## Interface caveat at the open target

`TwoCapSourceThirdCanonicalRowSurface` (line 7941) exposes cap-cardinality, two distinct source vertices, and complete canonical-row witnesses.  It does **not** expose a common selected radius for the two sources.  Several source-clean mutual-cross-membership terminals require explicit `source_mem_radius`/`source'_mem_radius` hypotheses, so a proof of the open target must either derive a common-radius branch from the witness data or split to a different terminal.  The current target body is empty and no such derivation is present.

## Theorem-bank audit

The specified P97 theorem-bank registries and indexed Lean corpora contain related q-deleted K4 row producers, but no import-reachable consumer proving `False` from the cap-source first-fiber/five-center residual or from the one-sided six-center packet.  This is a relevance/consumer gap, not evidence of kernel closure.

## Source audit notes

`rg -n "sorry" FrontierLiveClosure.lean` shows the relevant active sorries at lines 8051, 9749, 10950, and 10993 (plus unrelated earlier obligations).  The neighboring constructors and coordinators are source-clean in the sense of containing no local `sorry`; transitive closure remains blocked by the listed leaves.

## Kernel-facing spot check

Using Lean 4.27 via `lake env lean scratch/first-fiber-axioms.lean` (the declarations are nested under `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`):

* the open target, the five-center coordinator, and both immediate leaves all report `sorryAx` in `#print axioms`;
* `sixCenterDeletionSurvivalPacket_of_oneSided`, `false_of_twoCapSources_mutualCrossMembership_distinctBlockers`, and `firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion` report only `propext`, `Classical.choice`, and `Quot.sound`.

This confirms the source audit's distinction between checked producers and the still-open terminal consumers.
