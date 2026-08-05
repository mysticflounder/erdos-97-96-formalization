# FreshThird non-hit theorem-bank audit (2026-08-03)

## Target and verdict

Target: the live obligation
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:11324`, specifically
the `FreshThirdNormalizedResidualRemainingCase.firstNonHit` and
`.secondNonHit` constructors (with `sourceRowOmission` data).

Verdict: **OPEN / ON-SPINE / NO IMPORT-REACHABLE SOURCE-CLEAN CONSUMER FOUND**.
The theorem is still `by sorry`; no source-clean producer in the indexed
corpora or the three theorem-bank registries matches its packet.

## Exact residual interface

`FreshThirdCapSourceNonHit` (`FrontierLiveClosure.lean:10463--10479`) has only:

* `sameBlocker(center_eq, support_eq)`, or
* `sourceRowOmission(deleted, deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂,
  deleted_not_mem : deleted.1 ∉ selectedAt(source).toCriticalFourShell.support,
  deletion_survives : HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
  (H.centerAt source))`.

The remaining packet (`:11280--11308`) pairs this non-hit on one source with
an arbitrary interaction on the other (`firstNonHit data secondInteraction`,
or the symmetric `secondNonHit firstInteraction data`).  The parent residual
router (`:11337--11425`) simply dispatches these constructors to the open
remaining theorem.

The local `false_of_omission` proof in the parent router (`:11346--11357`)
only derives contradiction when the *same source* also has a
`FreshThirdCrossRowHit`; it uses `deleted_eq` to contradict the hit's support
membership.  A `firstNonHit`/`secondNonHit` branch has no such hit, so this
does not close `sourceRowOmission`.

## Candidate audit

The indexed Lean searches (`nthdegree docs search --lean`) for
`FreshThirdNormalizedResidualRemainingCase`, `FreshThirdCapSourceNonHit`,
`FreshThird ... non-hit source row omission`, and
`cross deletion survives iff not mem selected support` returned only the
current declarations and generic conversion/producer lemmas:

* `cross_deletion_survives_iff_not_mem_selected_support`
  (`CriticalPairFrontier.lean:781`) is an iff converting omission to deletion
  survival; it gives no contradiction.
* `mutualCrossMembership_or_oneSidedDeletionSurvival`
  (`FrontierLiveClosure.lean:10017`) gives either reciprocal support
  membership or one-sided survival; it is a disjunction, not a terminal.
* `false_of_twoCapSources_oneSidedDeletionSurvival`
  (`FrontierLiveClosure.lean:13892`) requires the different packet
  `FreshOutsideFirstBlockerFiber`, two `FirstFiberCapSourceWitness` values,
  a common `SelectedClass ... commonRadius`, and one-sided survival.  None of
  these (especially `FreshOutside...` or a common radius) is present in a
  `FreshThirdBlockerFiber` non-hit branch.
* `exists_two_firstFiber_deletions_fourCenters_survive` is likewise for
  `FreshOutsideFirstBlockerFiber` and is a survival producer, not a terminal.
* Exact-four/common-deletion-square and finite cap-intersection lemmas in
  `FrontierLiveClosure.lean` require stronger support/intersection packets
  absent from `firstNonHit`/`secondNonHit`.

No indexed declaration supplies the missing bridge from one source-row
omission plus the other source's interaction to a contradiction.

## Theorem-bank registry audit

Literal and structural scans of
`certificates/p97_rvol_general_n_mining.json`,
`certificates/erdos97_legacy_general_n_mining.json`, and
`certificates/erdos_general_theorem_p97_mining.json` found zero entries
matching `FreshThird`, `sourceRowOmission`, `NonHit`, `CrossRow`,
`DeletionSurvival`, or `normalized_residual`.  Their markdown censuses contain
no matching declaration either.  The broad U5/U1 candidates in those banks
have incompatible hypotheses and are not import-reachable consumers of this
packet.

## Circularity / first missing bridge

`false_of_twoCapSources_freshThirdBlockerFiber_core` (around `:12977`) calls
the residual router and therefore depends downstream on this open theorem;
the compatibility adapter `false_of_capSource_freshThirdBlockerFiber`
(`:13048`) is consequently cyclic, not a producer.  The immediate missing
bridge is a source-clean lemma that strengthens one-sided omission with the
other source's interaction (or derives a shared radius/reciprocal incidence
packet) before invoking a terminal.  Until that bridge exists,
`firstNonHit` and `secondNonHit` remain live obligations.

Previous audit `docs/p97-fresh-third-normalized-residual-consumer-audit-2026-08-02.md`
and the FreshThird checkpoints in `docs/closure-matrix-2026-07-09.md`
concur: no source-clean consumer was known for either non-hit branch.

No production files were changed; this is a read-only audit.
