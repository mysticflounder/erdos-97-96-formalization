# FreshThird cross-deletion global theorem-bank audit (2026-08-07)

## Scope and trust boundary

`freshthird_cross_deletion_cegar_20260807.results.txt` records 576 structural branches (all SAT) and one exact-rational QF_LRA replay that is UNSAT (`metric.smt2`, 22 occupied ranks, 19,700 metric assertions).  The replay is a finite diagnostic; no contradiction cut was promoted and no Lean closure is claimed.  The independent `cvc5` replay is also `unsat` (outputs in the adjacent `.cvc5.out/.err` files).  No unsat-core artifact was emitted.

## Global search/bank result

The required agentic search (`nthdegree docs search --lean --agentic`) was attempted twice, but the service returned the `gpt-5.3-codex-spark` usage-limit error and produced no result.  A plain `--lean` fallback indexed all eight configured Lean corpora; outputs are in `freshthird_cross_deletion_global_plain_20260807.txt`.  The required registries were also searched:

* `docs/general-n-certificate-bank-mining-2026-07-09.md` lists general-cardinality Kalmanson consumers (three 3-shell and four 4-shell schemas), plus finite exact-15/16 banks, but no FreshThird cross-deletion adapter.
* `certificates/p97_rvol_general_n_mining.{md,json}`, `certificates/erdos97_legacy_general_n_mining.{md,json}`, and `certificates/erdos_general_theorem_p97_mining.{md,json}` contain broad U5/general-n and bounded-local consumers; no exact FreshThird/cross-deletion theorem is named or stated.

Thus there is no exact bank entry that consumes the CEGAR packet (one cross survivor plus an independent mutual pair with both directions and four support slots per direction).

## Exact source-level candidates (verified signatures)

The closest import-reachable, general-cardinality metric consumers are in `lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean`:

* `Problem97.CapCrossingKalmansonBridge.false_of_four_ccw_endpoint_centers_bisect_middle_pair` (around lines 504–527): `Fin n` injective CCW boundary, four ordered indices, two endpoint-centered equal-radius equations, concludes `False`.
* `...false_of_four_ccw_middle_centers_bisect_endpoint_pair` (around lines 535–561): the dual two middle-center equalities, concludes `False`.
* `...false_of_four_ccw_late_centers_bisect_early_pair` (around lines 563–605): late-center/early-pair equalities, concludes `False`.
* `...false_of_freshThird_four_order_arms` (around lines 670–727): exact FreshThird four-order-arm consumer; takes a convex-independent carrier, injective CCW `Fin n` boundary, and one of four explicit strict order/equality disjuncts, concludes `False`.  A source probe (`freshthird_cross_deletion_signature_probe.lean/.out`) confirms the signature and `#print axioms` reports only `[propext, Classical.choice, Quot.sound]`.

Related producers/adapters are not closures: `CriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support` maps deletion survival to selected-support omission; `FrontierLiveClosure/FreshThirdCrossDeletionRows.crossDeletion_survivors_to_erasedRows` packages two erased `SelectedFourClass` rows; and `RetainedMatchingGeometricReduction.blocker_centers_eq_of_mutual_cross_membership` (plus the `Rigid221SourceHeavy` analog) derives equality of blocker centers from a same-pair mutual-cross hypothesis.  None consumes the full independent-pair CEGAR packet.

## Smallest missing bridge

The diagnostic survivor has rank order `qOutside < freshCenter < qBetween < sourceCenter < canonicalSource`; its aliases identify `qOutside` with `pinnedCenter` and `qBetween` with `drowCenter`, while cross/mutual support slots remain anonymous rank selectors.  No current theorem:

1. couples the independent mutual pair to the cap-synchronized cross pair;
2. maps the selected/erased survivor rows to named boundary indices in one common CCW order; or
3. derives the two exact equal-radius equations required by any `false_of_four_ccw_*` theorem (or by `false_of_freshThird_four_order_arms`).

The minimal source-level work is therefore a universal survivor-to-Kalmanson adapter proving those identifications/order facts and exporting the two equalities.  Until that bridge is supplied, the QF_LRA UNSAT is only finite empirical evidence and no imported general-cardinality theorem closes FreshThird cross-deletion.

