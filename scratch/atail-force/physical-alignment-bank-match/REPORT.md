# Physical-alignment theorem-bank audit

Date: 2026-07-16

## Question

The audit began by asking whether an existing theorem bank or indexed Lean
declaration could either

1. identify the actual blocker centers produced by
   `exists_sourceFaithful_commonDeletionTwoCenterPacket_of_card_ge_fourteen`
   with the physical centers `p` and `S.oppApex2`; or
2. directly refute the resulting source-faithful
   `CommonDeletionTwoCenterPacket` without those identifications?

## Result

No pre-existing declaration found in the required theorem-bank registries or
in the indexed Lean corpus supplied either implication.  However, a concurrent
local route correction no longer needs actual-blocker equality for the second
physical role:

```lean
exists_sourceFaithful_secondApexCommonDeletionPacket_of_card_ge_fourteen
```

uses the two distinct actual blockers together with `P.q_survives` and
`P.w_survives` to produce a common-deletion packet whose second center is
definitionally `S.oppApex2`.  Thus **the second-center physical alignment is
closed**.  The checked uniform consumer in
`../common-deletion-uniform-consumer/` also shows that first-center alignment
with `p` is unnecessary: an arbitrary distinct first center reduces directly
to robust `S.oppApex2` or swapped `FA-UNIQ4`.

The strongest consequence available for free is **source-row alignment**:
an exact q-deleted row centered at a retained source's actual blocker is the
chosen critical shell of that source.  This consequence has been
kernel-checked in `PhysicalAlignmentBankMatch.lean`.  It does not identify the
retained arbitrary first blocker with the live center `p`, and it does not
close a source `sorry` by itself.

## Registries and indexed corpus checked

The audit inspected:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- the indexed Lean corpus through targeted `nthdegree docs search --lean`
  queries for actual blockers, critical deletion, common-deletion packets,
  source-indexed rows, cross-survival, and two-center consumers.

The archive registries themselves record the same structural limitation: the
banked declarations are contradiction consumers after named incidences have
been established; they are not geometric incidence or placement producers.
The legacy archives contain local algebra/Radon material rather than critical
map or blocker-placement theorems.

One apparent positive in the `p97-rvol` JSON inventory is not independent:
`RVOL.P97.U1LargeCapRouteBTail.DoubleApexOffSurplusSharedRadiusPair` merely
`simpa`s the canonical theorem whose source still contains `sorry`.  It is
therefore not proof evidence for this route.

## Exact reusable implications

### Critical-shell support alignment

`Problem97.CriticalShellSystem.selectedFourClass_support_eq_shell`, in
`lean/Erdos9796Proof/P97/U1CarrierInjection.lean`, states:

```lean
theorem selectedFourClass_support_eq_shell
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A)
    (K : SelectedFourClass A (H.centerAt q hq)) :
    K.support = (H.selectedAt q hq).toCriticalFourShell.support
```

Implication direction: an arbitrary ambient exact selected four-class at a
source's actual blocker is forced to be that source's chosen critical support.
It does not determine where the blocker center lies.

### Cross-survival support alignment

`Problem97.ATailCriticalPairFrontier.cross_survival_unique_radius_and_exact_support`,
in `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean`, turns K4
survival after a prescribed deletion at `H.centerAt q` into uniqueness of the
critical radius and equality of the erased selected support with
`H.selectedAt q`.  Again the conclusion aligns a row with its source, not the
blocker with `p` or an opposite apex.

### Faithful-carrier support alignment

`Problem97.Census554.GeneralCarrierBridge.blocker_row_support_eq_shell`, in
`lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean`, states that the
globally selected faithful-carrier row at the blocker label of `q` equals
`H.selectedAt q`.  It gives no physical placement of the blocker and the
general carrier bridge has no complete obstruction classifier consuming the
present packet.

### Nonterminal common-deletion expansion

`Problem97.ATailCommonDeletionCriticalExpansionScratch.commonDeletion_successor_or_alignedCriticalPair`,
in `scratch/atail-force/common-deletion-consumer/CommonDeletionCriticalExpansion.lean`,
has the implication

```text
common-deletion packet
  -> fresh-source successor common-deletion packet
     or prescribed critical alignment at one of the same arbitrary centers.
```

This is nonterminal: its finite abstraction admits periodic successor cycles.
It does not identify an arbitrary blocker with `p`.  Physical alignment of the
second center is now supplied separately by the theorem below.

### Physical second-apex packet (concurrent route correction)

`Problem97.ATailSurvivalCoverBankMatchScratch.exists_sourceFaithful_secondApexCommonDeletionPacket_of_card_ge_fourteen`,
in `scratch/atail-force/survival-cover-bank-match/SurvivalCoverBankMatch.lean`,
has the conclusion

```lean
∃ deleted, ∃ hdeleted : deleted ∈ D.A,
  ∃ source : CriticalShellSystem.CarrierVertex D.A,
    (deleted = P.q ∨ deleted = P.w) ∧
    source ∈ Finset.univ \ qBlockerFiber P ∧
    H.centerAt source.1 source.2 ≠ S.oppApex2 ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted)
      (H.centerAt source.1 source.2) ∧
    Nonempty (CommonDeletionTwoCenterPacket D H deleted
      (H.centerAt source.1 source.2) S.oppApex2)
```

Implication direction: the card-at-least-fourteen survival cover plus the two
distinct blocker centers yields one arbitrary source-faithful first center and
the physical second apex as the second center.  This is a proved producer, not
an assumed alignment.

The downstream theorem
`Problem97.ATailCommonDeletionUniformConsumerScratch.physicalSecondApex_commonDeletion_robust_or_swappedUniqueFour`
uniformly maps such a packet to

```text
FullyDeletionRobustAt D S.oppApex2
  or SwappedFirstApexUniqueFourFrontier D S H.
```

This removes the generic successor cycle, but the two endpoint contradictions
are still mathematical consumers rather than closed consequences.

### Existing physical-center consumer

`Problem97.ATailRUnalignedHandlerScratch.false_of_unalignedCommonCapLiveMultiplicity`,
in `scratch/atail-force/r-unaligned-handler/UnalignedHandler.lean`, does prove
`False`, but only after the second center is already `S.oppApex2` and a
same-cap/common-pair multiplicity packet has been supplied.  The corrected
producer now supplies the physical second center; the same-cap/common-pair
multiplicity remains absent.

## Kernel-checked strengthening

`PhysicalAlignmentBankMatch.lean` proves:

- `qDeletedRow_support_eq_selectedAt_of_actualBlocker`;
- `source_mem_qDeletedRow_of_actualBlocker`; and
- `nonempty_actualBlockerSourceIndexedCommonDeletion_of_card_ge_fourteen`.

The aggregate theorem strengthens the card-at-least-fourteen producer by
retaining:

- the two actual source vertices;
- equality of each exact row with that source's chosen critical support;
- membership of each source in its corresponding row;
- distinctness of the sources and their centers;
- separation of each source from the common deleted frontier point; and
- a source-indexed `U5QCriticalTripleClass` exported from each row.

Focused verification from `lean/`:

```bash
env LEAN_PATH=/private/tmp/p97-root-survival-cover-bank-verify:/private/tmp/p97-anchored-double-deletion-oleans:/private/tmp/p97-joint-transition-oleans \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-physical-alignment-bank-match.olean \
  ../scratch/atail-force/physical-alignment-bank-match/PhysicalAlignmentBankMatch.lean
```

The command exits successfully.  `#print axioms` reports only:

```text
propext, Classical.choice, Quot.sound
```

The scratch directory has no `sorry`, `admit`, `axiom`, `native_decide`, or
`unsafe` declaration.

## Why this still does not match the U5 bank

The two exported U5 critical triples have different deleted-source parameters:
one is indexed by `source₁`, the other by `source₂`.  Existing U5
incompatibility consumers instead fix one common `q`, require a
`U5DangerousTriple D q p T`, and then require several q-critical/q-deleted
rows together with named cross-incidences.

For example,
`Problem97.U5QCriticalTripleClass.rank_two_mixed_short_incompatibility` and
`Problem97.U5QCriticalTripleClass.mutual_no_p_exact_center_incompatibility`
both require a common dangerous base and multiple explicit support
memberships.  None of those hypotheses follows from the present two-row
packet.

## Remaining boundary after the route correction

A closing theorem needs neither blocker equality with `S.oppApex2` nor
first-center equality with `p`.  The exact remaining outputs are:

- `FullyDeletionRobustAt D S.oppApex2`; and
- `SwappedFirstApexUniqueFourFrontier D S H`.

The second is the protected swapped FA-UNIQ4 theorem.  The first is the sole
new robust physical-second-apex consumer.  The theorem-bank audit therefore
rules out a missing alignment adapter as the current bottleneck.
