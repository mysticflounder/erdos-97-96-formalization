# F2 support-heavy global-K4 split

## Scope

This scratch lane starts from the checked support-heavy reduction and the
actual `TwoLiveExactCoverSecondApexProfile`.  It:

1. names the two strict support-only witnesses `s,t`;
2. retains their membership in the actual middle row `C.B₂` and the original
   deleted-source selected shell `deletedCriticalSupport C`;
3. proves they are distinct points of the actual dangerous triple
   `(deletedCriticalSupport C).erase deleted`;
4. applies global K4 at both actual centers relative to the original deleted
   source; and
5. packages the exact four q-deleted/q-critical combinations.

No production file, closure document, protected file, other scratch lane, or
proof-blueprint state was changed.

## Theorem-bank preflight

Before adding the split, I checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- focused `nthdegree docs search --lean` queries for the global-K4
  q-deleted/q-critical split and the two-triple-center adjacency consumer.

The exact reusable producers are:

- `U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4`;
- `U5QCriticalTripleClass.exists_card_three_of_qCritical`;
- `U5QDeletedK4Class.inter_card_le_two`; and
- `nonempty_commonDeletionTwoCenterPacket`, whose implementation confirms the
  required packet fields.

For the both-q-critical arm, the exact current bank consumer is:

```text
U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility
```

with hypotheses:

```text
htriple : U5DangerousTriple D deleted blocker T
s ∈ T
t ∈ T
Kₛ : U5QCriticalTripleClass D deleted s Bₛ
Kₜ : U5QCriticalTripleClass D deleted t Bₜ
blocker ∈ Bₛ
blocker ∈ Bₜ
t ∈ Bₛ ∨ s ∈ Bₜ.
```

The first five items are available after the split.  The final three
incidences are not supplied by F2 cell membership or by global K4.

## Kernel-checked named witnesses

`NamedF2SupportHeavyWitnesses` retains:

```text
s,t ∈ supportOnlyCell C.B₂ live (deletedCriticalSupport C)
        ∩ strictSecondCap S
s ≠ t
s,t ∈ C.B₂
s,t ∈ deletedCriticalSupport C
s,t ∈ (deletedCriticalSupport C).erase deleted
s,t ∈ D.skeleton deleted
s,t ∈ D.A
card supportStrict = 2
card C.B₂ = 4
card (deletedCriticalSupport C) = 4.
```

The deletion-erased membership is source-faithful:

- support-only membership gives membership in
  `deletedCriticalSupport C`;
- membership in the actual q-deleted middle row proves the point is not
  `deleted`; and
- `Finset.mem_erase` then places it in the exact dangerous triple returned by
  `dangerousTriple_at_commonDeletion C`.

`F2SupportHeavyReduction.nonempty_namedWitnesses` proves this packet is
nonempty.

## Exact four-way global-K4 normal form

At each center, global K4 relative to `deleted` yields either:

```text
ExactQDeletedAt:
  B with U5QDeletedK4Class D deleted center B
  and card B = 4
```

or:

```text
ExactQCriticalAt:
  B with U5QCriticalTripleClass D deleted center B
  and card B = 3.
```

`F2SupportHeavyK4FourWay` packages exactly:

1. q-deleted at `s`, q-deleted at `t`;
2. q-deleted at `s`, q-critical at `t`;
3. q-critical at `s`, q-deleted at `t`; or
4. q-critical at `s`, q-critical at `t`.

Every branch retains the generated support finsets and their exact
cardinality equalities.  The original named-witness packet remains an
argument to the normal form, so the actual `C.B₂` and
`deletedCriticalSupport C` memberships are not discarded.

`NamedF2SupportHeavyWitnesses.nonempty_globalK4FourWay` proves the split.
`twoLiveExactCover_to_supportHeavyGlobalK4NormalForm` is the end-to-end
extraction from the original F2 support-heavy hypothesis.

## Both-q-deleted arm

This arm does construct a new same-deletion common-deletion packet:

```text
CommonDeletionTwoCenterPacket D W.H deleted s t.
```

The construction does not call a producer that could reselect different
supports.  Instead, `exactCommonDeletionPacket`:

- converts each chosen `U5QDeletedK4Class` into
  `HasNEquidistantPointsAt 4 (D.A.erase deleted)` at its center;
- uses the original critical system `W.H`;
- uses the actual source membership `C.q_mem_A`;
- uses the checked witness inequality `s ≠ t`;
- derives actual-blocker avoidance from deletion survival;
- installs the selected supports themselves as `B₁,B₂`; and
- obtains their overlap bound from
  `U5QDeletedK4Class.inter_card_le_two`.

`BothQDeletedCase.packet_B₁_eq` and `packet_B₂_eq` record:

```text
packet.B₁ = generated support at s
packet.B₂ = generated support at t.
```

Thus this is a genuine new common-deletion packet with the chosen rows and
cardinalities retained exactly.

It is not itself a contradiction.

## Both-q-critical arm

`BothQCriticalCase.AdjacentBankAntecedents` records exactly the still-missing
bank inputs:

```text
blocker ∈ support at s
blocker ∈ support at t
t ∈ support at s ∨ s ∈ support at t
```

where:

```text
blocker = W.H.centerAt deleted C.q_mem_A.
```

`BothQCriticalCase.false_of_adjacentBankAntecedents` is a kernel-checked
conditional consumer that applies
`two_triple_centers_adjacent_incompatibility` once those three facts are
supplied.

No one of those incidences is inferred in this lane.  In particular:

- membership of `s,t` in the original deleted critical shell says nothing
  about membership of the blocker in the newly generated q-critical supports;
- q-criticality says each generated support lies on the circle through
  `deleted`, not that it contains the original blocker; and
- distinct dangerous-triple membership does not imply mutual-center
  incidence.

## Epistemic status

Proven:

- exact named support-heavy witnesses in the original dangerous triple;
- the complete global-K4 four-combination split;
- exact generated row cardinalities;
- construction of a new same-deletion common-deletion packet in the
  both-q-deleted arm, preserving the selected supports; and
- a conditional both-q-critical contradiction with all missing incidences
  explicit.

Not proven:

- that any particular one of the four combinations must occur;
- that either mixed q-deleted/q-critical arm is contradictory;
- the three missing incidences in the both-q-critical arm; or
- an unconditional contradiction for the support-heavy branch.

Accordingly, this lane does not close a production `sorry`.

## Validation

The repository pins Lean `4.27.0`.  The deliberate single-file check was:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:$BASE_LEAN_PATH" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-supportheavy-k4-split-oleans/F2SupportHeavyK4Split.olean \
  ../scratch/atail-force/r-f2-supportheavy-k4-split/F2SupportHeavyK4Split.lean
```

It exited successfully.  Every printed theorem depends only on:

```text
propext
Classical.choice
Quot.sound
```

None depends on `sorryAx`.  No full `lake-build` was run.
