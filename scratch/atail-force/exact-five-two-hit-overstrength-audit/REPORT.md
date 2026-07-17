# Exact-five two-hit overstrength audit

Date: 2026-07-17

## Verdict

The proposed positive producer

```lean
Nonempty (LargeCapUniqueFiveTwoHitCriticalRow D S profile)
```

is the wrong primary object.  It is already contradiction-strength: production
`false_of_largeCapUniqueFiveTwoHitCriticalRow` consumes exactly that packet and
proves `False` from the exact-five cap geometry.  Asking the full parent to
produce it does not decompose the exact-five branch; it restates the branch
contradiction as a positive incidence.

The sound, unconditional complement is now kernel-checked in
`scratch/atail-force/exact-five-two-hit-producer-attempt/ExactFiveTwoHitProducerAttempt.lean`:

```lean
nonempty_twoCommonDeletionSources_of_largeCapUniqueFive
  (H : CriticalShellSystem D.A)
  (hcap : 6 <= S.oppCap2.card)
  (profile : LargeCapUniqueFiveSecondApexRadius D S) :
  Nonempty (LargeCapUniqueFiveTwoCommonDeletionSources D S H profile)
```

It proves that the unused source's actual retained row meets the physical
exact-five strict-cap class in at most one point.  Since the physical class has
at least three strict-cap points, two distinct points avoid that row.  Deleting
either point preserves K4 both at the unused source's blocker and at the
physical second apex, hence gives two origin-tagged
`CommonDeletionTwoCenterPacket`s at the same pair of centers.

Fresh direct elaboration of that scratch file succeeded.  Its five printed
endpoints close under exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx` dependency.

## Exact theorem chain

The checked chain is:

1. `unusedCriticalRow_support_eq_selectedAt` proves that the row stored by
   `LargeCapUniqueFiveUnusedCriticalRow` and `H.selectedAt` have the same full
   support.
2. `physicalInterior_inter_unusedCriticalSupport_card_le_one` converts the
   production two-hit terminal into the sharp upper bound on the actual row.
3. `nonempty_twoCommonDeletionSources_of_unusedCriticalRow` subtracts that
   at-most-one intersection from the at-least-three physical strict-cap set.
4. `cross_deletion_survives_iff_not_mem_selected_support` turns both omissions
   into deletion survival at the actual blocker.
5. The exact five-point physical class survives either deletion at
   `S.oppApex2`.
6. `nonempty_commonDeletionTwoCenterPacket` packages both source-faithful
   common deletions.

This uses no extra minimality hypothesis beyond the retained
`CriticalShellSystem` already produced from parent minimality/no-removability.

## Critical-row coherence audit

At the start of this audit, `LargeCapUniqueFiveUnusedCriticalRow.criticalRow`
was indexed by `H.centerAt ...` but the structure stored no explicit equality
to `H.selectedAt ...`.  Support equality was nevertheless provable because
both rows were full exact shells at the same center and both contained the
unused source.

That API gap was fixed concurrently in production.  The current structure now
contains

```lean
criticalRow_eq_selectedAt :
  criticalRow = H.selectedAt unused.point source_mem_A
```

and its constructor fills the field with `rfl`.  The scratch theorem
`unusedCriticalRow_support_eq_selectedAt` remains a checked compatibility
lemma, but a promoted continuation should use the new equality directly.  The
current production interface therefore has no remaining selector/coherence
ambiguity at this row.

## Selector versus existential-row distinction

The older 33-point exact Euclidean regression proves only that a fixed arbitrary
`CriticalShellSystem` selector need not choose a two-hit row.  The same
nonconvex carrier admits another legal two-hit choice.  It is not a live
convex/MEC/no-`IsM44` counterexample.

On the live exact-five cap surface the production terminal is stronger: **no**
deletion-critical row through the unused source can carry two physical
strict-cap hits, regardless of selector.  Thus changing from "the retained
row" to "there exists some critical row" does not repair the producer.  The
existential two-hit remains contradiction-strength; the guaranteed mathematical
output is the low-hit/two-common-deletion complement.

## Existing-consumer audit

The two same-center common-deletion packets do not immediately close a
production `sorry`.

- `physicalSecondApex_commonDeletion_robust_or_swappedUniqueFour` consumes
  either one packet and returns `FullyDeletionRobustAt D S.oppApex2` or the
  protected swapped `FA-UNIQ4` frontier.
- Here the exact five-point physical class already proves
  `FullyDeletionRobustAt D S.oppApex2` via
  `fullyDeletionRobustAt_of_five_le_selectedClass`, so this projection is not
  progress.
- After identifying the first packet's physical-apex row with the exact-five
  class minus the first source and its blocker row with the retained row, the
  second packet supplies a concrete `SecondRowCommonDeletionSuccessor` of the
  first.  Its checked consumer again yields physical-second-apex robustness,
  which is redundant on this arm.
- `CommonDeletionCriticalExpansion` and
  `CommonDeletionSuccessorCycle` are explicitly nonterminal.  Their exact
  24-vertex finite regression permits a genuine successor cycle in the
  geometry-free abstraction.

Therefore the extra value of the two-source packet is its provenance: two
named distinct physical strict-cap sources, the common actual blocker, the
physical radius, both support omissions, and the two packets.  A successful
consumer must use those retained cap/radius/origin fields to prove nonreturn,
a strict rank move, a protected unique-row handoff, or `False`.  Projecting it
to anonymous common deletion or bare robustness loses all new information.

## Bank preflight

The required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` found the production exact-five modules,
the existing U5 incidence consumers, and the standalone
`u1TwoLargeCapObstruction`, but no theorem consuming only this two-source
low-hit packet.  The banked terminals still require extra named
cross-incidences, cap placement, or metric equalities.

## Strategy correction

Retire the exact-five positive two-hit as an open producer.  Keep
`false_of_largeCapUniqueFiveTwoHitCriticalRow` as a regression/terminal for any
branch that independently supplies those incidences.

The primary exact-five object should be the checked, origin-tagged
`LargeCapUniqueFiveTwoCommonDeletionSources`.  Merge this arm into the same
provenance-aware common-deletion/progress consumer used by the robust parent.
The parent assembler then needs:

1. one consumer of the origin-tagged robust/common-deletion surface, including
   this exact-five two-source specialization; and
2. the protected original/swapped unique-four/five arms.

This is a real reduction: it replaces an impossible positive incidence target
with an unconditional kernel-checked continuation and leaves one explicit
consumer gap.
