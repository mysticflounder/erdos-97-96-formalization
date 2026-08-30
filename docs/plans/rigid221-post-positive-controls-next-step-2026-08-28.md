# [HISTORICAL / SUPERSEDED] Rigid221 recommendation after v1 positive controls

**Date:** 2026-08-28  
**Superseded:** 2026-08-29

This memo records the 2026-08-28 recommendation. Current source already contains the canonical-row interface described by the original memo, so claims that canonical coherence is missing are obsolete.

## 1. Current v1 result

**PROVEN:** `Rigid221Card18PositiveControls.lean` kernel-checks finite-CNF positive controls for the BI, U, and XV arms. The declarations `bi_v1_armCnf_sat`, `u_v1_armCnf_sat`, and `xv_v1_armCnf_sat` use the existing `armCnf_sat_iff` theorem.

These are finite-CNF positive controls, not geometric source realizations. They do not close any Rigid221 source branch. The unchanged v1 formulas remain satisfiable; DIMACS serialization and external solver work therefore remain closed.

Retain v1 as:

- a checked positive control;
- a regression fixture for future encoders;
- a seed population for CEGAR refinements; and
- evidence that a future finite projection must add a source-entitled consequence.

That consequence may come from a newly projected theorem already present in current source; it need not be a newly declared theorem.

## 2. Current canonical-row status

The former “missing canonical coherence” claim is superseded. Current source already provides:

- `BiSurvivalCanonicalRows` and `nonempty_biSurvivalCanonicalRows` in `lean/Erdos9796Proof/P97/ATail/BiSurvivalCanonicalRows.lean`;
- `ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support` in `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean`; and
- `firstRow_support_eq_criticalShell_of_center_eq` and `secondRow_support_eq_criticalShell_of_center_eq` in `lean/Erdos9796Proof/P97/ATail/PhysicalSecondApexCommonDeletion.lean`.

`BiSurvivalCanonicalRows` retains both common-deletion packets, identifies each fixed-center row with its source-indexed critical shell, records the two cross-view support equalities, and records the four endpoint omissions. `Rigid221SourceHeavy.lean` already accepts this value through its `_hcanonicalRows` argument.

The specialized theorem `qDeletedRow_at_actualBlocker_eq_canonicalSupport` also exists in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean`. Moving or re-exporting it into a lower acyclic module remains an optional layering cleanup, not a missing mathematical prerequisite.

## 3. Remaining proposed coherence

A double-delete statement of the form

```lean
HasNEquidistantPointsAt 4 ((A.erase z).erase w) center ↔
  z ∉ canonicalSupport ∧ w ∉ canonicalSupport
```

is **PROPOSED / UNFORMALIZED**. The reverse direction has existing deletion-survival ingredients, but no combined checked theorem currently supplies the equivalence. Do not claim that it is available or that a current consumer requires it.

Before formalizing it:

1. identify an exact current consumer;
2. record which conclusion the consumer cannot derive from `BiSurvivalCanonicalRows` and the existing one-delete equivalence;
3. prove only the weakest source-level statement that closes that gap; and
4. keep any optional import-layer extraction separate from the mathematical claim.

## 4. Current consumer and branch status

The previously proposed `pentagonOffClassBlocker_biSurvival_canonicalRectangle` is not the live closure step. The current BI consumer accepts `_hcanonicalRows` as an interface/compatibility value but does not use it to derive the contradiction. The A3 deleted-row off-class residual and A4 unsplit `Q` residual have since been closed directly.

The live source-heavy frontier has moved to the remaining exact-twelve and off-class sibling leaves. A consumer audit is still useful, but it must begin from those current leaves rather than from the superseded rectangle plan. For each candidate consumer record:

```text
available now
derivable from existing canonical rows
still missing
false without an additional hypothesis
```

Do not introduce another broad packet structure unless a named current consumer needs it.

## 5. Custody and publication

The positive-control theorem and custody state are separate facts. A custody mismatch does not refute the Lean theorem; it means the frozen manifest no longer authenticates the current source bytes. Do not edit historical hashes in place.

Use this sequence:

1. choose and freeze the current accepted source head;
2. mint a new versioned Card18 custody/coverage package against those exact bytes;
3. preserve all prior custody packages as immutable historical objects;
4. rerun semantic, trust, source-hash, predicate-coverage, and runner gates; and
5. publish only the new accepted version.

## 6. DIMACS reopening gate

DIMACS remains closed until all of the following hold:

1. a source-entitled theorem or newly projected existing theorem strengthens at least one arm beyond v1;
2. the source-to-finite projection is checked;
3. v2 excludes at least one explicit v1 positive-control model;
4. the v2 formula correspondence is proved;
5. the current custody package is accepted; and
6. an in-Lean witness/ablation check shows the external solver question is nontrivial.

## 7. Updated priority

1. Refresh and publish versioned Card18 custody for the current source bytes.
2. Work the current exact-twelve leaves in `Rigid221SourceHeavy.lean`, including `..._exactTwelve_interiorDeletion_physicalRadius_commonDeletion_missingIncidence` and `..._exactTwelve_interiorDeletion_physicalRadius_nextRowOnlyHit`.
3. Work the remaining off-class leaves, including `..._uDeletion_fixedPhysicalPair_outsideThreeRows` and `..._threeCenterDeletion_xv_missingIncidence`.
4. Audit whether existing canonical-row consumers expose a precise missing incidence.
5. Formalize double-deletion coherence only if that audit identifies a concrete consumer.
6. Build v2 only from the resulting source-entitled consequence.
7. Reconsider DIMACS only after v2 passes the reopening gates above.
