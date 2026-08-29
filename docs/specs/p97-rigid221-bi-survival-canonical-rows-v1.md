# P97 Rigid221 bi-survival canonical rows (v1)

**Status: SOURCE CONSTRUCTION, CUSTODY, AND HYGIENE VALIDATED; GLOBAL BLUEPRINT CERTIFICATION PENDING.**

Date: 2026-08-28

Lane: `rigid221-bi-survival-canonical-rows-v1-20260828`

Lane base: `7cf1e60bde589fe27c246c0edbc7ad20e96d6db3`

## 1. Purpose

The live bi-survival leaf previously received two independently chosen
`CommonDeletionTwoCenterPacket` values, one after deleting `u` and one after deleting `xv`.
Although both packets use the same two critical-system centers, their interface did not state any
relation between the two deletion views.

This checkpoint adds `BiSurvivalCanonicalRows`. It retains both packets, identifies the two chosen
rows at each fixed center with the same canonical ambient critical shell, and records that both
deleted endpoints avoid both canonical shells. The live coordinator constructs this stronger value
before calling the existing bi-survival leaf.

The leaf still concludes `False` through its existing `sorry`. This checkpoint exposes a proved
source relation and narrows the consumer interface; it does not close the leaf.

## 2. Reuse preflight

The concrete theorem candidate is

```lean
Problem97.ATailCriticalPairFrontier.
  cross_deletion_survives_iff_not_mem_selected_support
```

from `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean`. Its forward direction sends K4
survival after deleting an endpoint to omission of that endpoint from the source blocker's chosen
exact critical shell. Applying it to both endpoints and both source blockers supplies four omission
facts.

The row-provenance steps reuse

```lean
firstRow_support_eq_criticalShell_of_center_eq
secondRow_support_eq_criticalShell_of_center_eq
```

from `PhysicalSecondApexCommonDeletion.lean`. At the live centers their center-equality arguments
are definitional, so each applies with `rfl`. These four applications identify the selected rows of
both common-deletion packets with the two source-indexed canonical shells.

The first missing antecedent after this checkpoint is not row construction or fixed-center row
alignment. It is a consumer theorem extracting a contradiction, an incidence/order consequence, or
a source-faithful bounded obstruction from the two canonical shells together with the remaining
Blocker-V hypotheses.

There is no import circularity. `BiSurvivalCanonicalRows.lean` imports the existing lower module
`PhysicalSecondApexCommonDeletion.lean`; it does not import `Rigid221SourceHeavy.lean`. The live
source-heavy module imports the new module in the forward direction.

## 3. Checked interface

For a critical system `H`, endpoints `u` and `xv`, and source vertices `source₁` and `source₂`,
`BiSurvivalCanonicalRows` contains:

- the `u`-deletion common-deletion packet;
- the `xv`-deletion common-deletion packet;
- four row-to-canonical-shell equalities;
- the two resulting fixed-center cross-deletion support equalities;
- omission of `u` from both canonical shells; and
- omission of `xv` from both canonical shells.

The fields `first_support_eq` and `second_support_eq` state directly that the two deletion views have
the same chosen support at each fixed center. Keeping them in the structure makes the relations part
of the on-spine consumer interface rather than off-spine convenience declarations.

`nonempty_biSurvivalCanonicalRows` constructs the interface from the previous rectangle input. It
uses only the packet fields and the three production declarations named above; it introduces no
solver, generated certificate, native computation, or new assumption.

## 4. Live wiring and frontier measure

Publish target:

```text
Problem97.erdos97_rhs
```

Anchored residual:

```text
Problem97.ATailFrontierLiveClosure.
  false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_
    card_ge_eighteen_biSurvival_commonDeletionRectangle
```

Immediate consumer: the `hprofileBoth` branch of
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_
vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_eighteen`.

Refine the existing lexicographic frontier measure with a fourth coordinate:

```text
(unclassified deletion profile,
 unresolved crossed-incidence complement,
 unresolved bi-survival comparison,
 fixed centers lacking certified cross-deletion canonical-row alignment)
```

On the bi-survival child the interface changes from `(0, 0, 1, 2)` to `(0, 0, 1, 0)`: both fixed
centers now have checked row alignment. Constructor fan-out remains one, and the same named leaf
remains on the publication spine. The first three coordinates are unchanged, so this is an ingress
and tractability checkpoint rather than closure of the bi-survival comparison.

## 5. Custody consequence

The live coordinator is in `Rigid221SourceHeavy.lean`. Fresh kernel mines preserve the labeled v3
tuple at 26 modules and the crossed v3 tuple at 27 modules; in both, only the final
`Rigid221SourceHeavy.lean` row differs from v2. Predicate coverage v5 binds those receipts while
preserving all 188 candidate rows and 38 source rows except for 37 custody-digest refreshes.
Historical v1/v2 custody and v1-v4 coverage artifacts remain immutable and replay at their pinned
source revisions.

## 6. Acceptance gates

Before this checkpoint is complete:

1. build `BiSurvivalCanonicalRows` and `Rigid221SourceHeavy` with `lake-build`;
2. confirm the new producer has no `sorryAx`, native, custom, or external-evidence dependency;
3. refresh the proof-blueprint index/call graph and confirm the strengthened leaf remains the single
   BI child on the publication spine;
4. re-mine and publish versioned Card18 custody/coverage evidence for the final source bytes;
5. run the governed Card18 regression runner; and
6. obtain an independent source, statement, import, trust, and frontier audit.

## 7. Current verification evidence

- `lake-build Erdos9796Proof.P97.ATail.BiSurvivalCanonicalRows` completed 8,096 jobs.
- `lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy` completed 10,875
  jobs after the final interface change.
- `lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18Aggregate` completed 10,888
  jobs.
- A current-fingerprint graph walk from `Problem97.erdos97_rhs` reaches both
  `BiSurvivalCanonicalRows` and `nonempty_biSurvivalCanonicalRows`, the immediate BI theorem, and
  its live caller. Every node in the 36-node caller subtree is fresh.
- Official proof-blueprint spine certification remains pending because 36 unrelated duplicate-name
  rows in pre-existing Exact17 scratch/export sources keep the global reference check stale. The
  source review does not treat the local graph walk as a substitute for that publication gate.
- The producer's literal axiom closure is exactly `propext`, `Classical.choice`, and `Quot.sound`.
- The strengthened BI leaf retains its prior `sorryAx`; no new open declaration was introduced.
- Independent adversarial review returned GO on source semantics and found no source amendment;
  its promotion result remains NO-GO until the global blueprint gate clears.
- The labeled and crossed dependency mines report unchanged 26- and 27-module tuples; the new lower
  module does not enter either tuple.
- The custody-v3 suite passes 121 tests, the complete coverage-v5 suite passes 10 tests, and Ruff
  passes on all new Python/test files.
- The governed Card18 runner passes: frozen v1-v4 replay reports 131 passed and 348 skipped; live
  v3/v5 reports 131 passed; the aggregate rebuild completes 10,888 jobs.
- Exact-path staged hygiene passes with no foreign staged path.
- `BiSurvivalCanonicalRows.lean` is 4,268 bytes with SHA-256
  `702cf6d717119f809258207cf3397ef3e4583155536df836b935a68b31d94af8`.
- The final `Rigid221SourceHeavy.lean` is 882,784 bytes with SHA-256
  `a4a906aa240101bad39424450e08f70161f8923d9d261f3892fad19685324c29`.
