# Origin-aware aligned two-off-live handler

Date: 2026-07-16

Status: **CHECKED-SCRATCH REDUCTION. THE PRESCRIBED-PAIR ARM NOW REACHES THE
EXISTING SWAPPED `FA-UNIQ4` FRONTIER; THE CLASSIFIED SUCCESSOR ARM REMAINS.
NO PRODUCTION `sorry` IS CLOSED.**

## Scope

This lane owns only:

- `scratch/atail-force/r-two-off-live-handler/RTwoOffLiveHandler.lean`;
- this report.

It does not edit production Lean, proof-blueprint state, closure docs,
SurplusM44, `SevenPointTwinFourCircleCollision.lean`, or the user-owned
unique-row lane. No full `lake-build` was run.

## Required preflight

Before introducing the scratch reduction, the lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- the indexed Lean corpora with focused `nthdegree docs search --lean`
  queries for common deletion, prescribed critical pairs, same-center radius
  transport, alternate radii, and exact second-center consumers.

The closest reusable declarations were:

- `sameCenter_radius_eq_or_support_disjoint`;
- `five_le_selectedClass_of_selectedFourClass_and_extra`;
- `exists_selectedFourClass_at_radius_of_four_le_selectedClass`;
- the common-deletion prescribed-pair installation lemmas; and
- `secondApexCritical_reorients_to_firstApexUniqueFour`.

No banked theorem consumes the entire aligned parent surface as `False`.
However, the prescribed-pair arm does have an immediate existing consumer:
one of its second-apex critical shells is already sufficient to build the
swapped `FA-UNIQ4` frontier. The only new residual after that routing is the
fresh successor arm.

## The interface loss

`successor_or_secondCenterAlignment_of_two_off_live_sources` constructs its
second-center pair from two points in

```text
((B1 union B2) \ deletedCriticalSupport) \ live.
```

The exported `AlignedPrescribedCriticalPair C 1` stores neither point's
nonmembership in `live`. The aligned eliminator therefore receives a
continuation whose pair arm has already forgotten facts used in its own
construction.

That loss matters. Since `commonDeletion_firstRow_eq_liveBase` proves
`C.B1 = live`, every such off-live source belongs to `C.B2`. The generic pair
type also does not retain that source role explicitly.

## Checked corrected output

The scratch file reconstructs the split directly from `htwo` and proves:

### 1. Source roles

`OffLiveSecondRowFreshSource.ofFresh` retains:

- the original `FreshCriticalSource`;
- source nonmembership in the live dangerous row; and
- source membership in the retained second row `C.B2`.

### 2. Fresh successor shape

`OffLiveCommonDeletionSuccessor.ofPacket` does not present a fresh
common-deletion packet as progress by itself. It records the exact
second-center radius split:

```text
same radius
  -> the deleted source is a fifth ambient point on that radius

different radius
  -> the old and new selected second-row supports are disjoint.
```

The checked type is `SuccessorSecondApexShape`. No recursion measure,
well-foundedness claim, or anonymous successor packet is asserted.

Both radius arms then collapse to one stronger geometric normal form:

```lean
FullyDeletionRobustAt D S.oppApex2
```

- In the same-radius arm, deleting any carrier point removes at most one
  member of an ambient class of cardinality at least five.
- In the alternate-radius arm, the two support-disjoint selected four-rows
  guarantee that deleting any carrier point leaves at least one entire row.

This is checked by
`OffLiveCommonDeletionSuccessor.secondApexFullyDeletionRobust`.

Consequently the exact one-field successor consumer is:

```lean
HasCriticalDeletionAt D S.oppApex2
```

meaning that at least one carrier source really destroys K4 at the physical
second apex. `false_of_offLiveCommonDeletionSuccessor_and_criticalDeletion`
then closes either radius arm. Equivalently, a successor proves that the
physical second apex is absent from the image of every legal fixed
`CriticalShellSystem`; this is recorded by
`FullyDeletionRobustAt.centerAt_ne`.

### 3. Second-center critical-pair shape

`OffLiveSecondCenterCriticalPair` retains:

- the existing `AlignedPrescribedCriticalPair C 1`;
- both off-live facts; and
- both memberships in `C.B2`.

Two further checked consumers sharpen this arm:

- `installedLiveSystem` proves that installing both prescribed second-center
  shells preserves the complete `LiveDangerousRetainingSystem`, including the
  exact live selected supports, not only the center labels;
- `secondCenterExactUniqueRadius` proves that `C.B2` is the full ambient
  radius class of cardinality four and that every K4-capable radius at the
  second center is equal to that radius.

Thus this arm is now an exact unique-card-four second-center terminal coupled
to the retained shared critical map.

More importantly,
`reorients_to_swappedFirstApexUniqueFour` applies the existing
`secondApexCritical_reorients_to_firstApexUniqueFour` theorem to either
prescribed shell. The pair arm is therefore consumed immediately and is not a
new closure obligation.

### 4. Exact origin preservation

`nonempty_originAwareTwoOffLiveHandlerOutcome` matches the aligned
eliminator's `twoOffLive` handler signature, retains the exact
`RCommonDeletionOrigin`, and reconstructs the stronger result from `htwo`.
The already-produced lossy continuation is accepted only for signature
compatibility.

The result therefore remains origin-indexed across anchored, reciprocal, and
spent packets.

`nonempty_originAwareTwoOffLiveReducedOutcome` performs the immediate pair
consumption. Its checked output is exactly:

```text
origin-tagged, radius-classified fresh successor
or
existing swapped first-apex unique-four frontier.
```

`originAwareTwoOffLive_goal_of_criticalDeletion_and_swapped` is the smallest
complete motive-valued handler now checked in this lane. It needs only:

- one `HasCriticalDeletionAt D S.oppApex2` producer for the successor; and
- the coordinator's already-required swapped-frontier handler.

## Why this is not yet `False`

After the existing swapped-frontier consumer is applied, both exact successor
shapes have been absorbed into the same fully deletion-robust second-apex
terminal.

### Same-radius successor

The ambient second-apex class has cardinality at least five, so every single
deletion preserves a K4 witness there.

### Alternate-radius successor

The new second-apex support is disjoint from `C.B2`, so every single deletion
leaves one of the two exact selected rows intact.

### Prescribed critical pair

This is no longer a residual. The existing swap theorem constructs its own
source-current frontier from the prescribed second-apex critical shell, so it
does not require the aligned pair's two sources to be off-surplus or to carry
old-first-apex double survival.

## Exact next producer

The next theorem should prove the one source-current field:

```lean
exists_secondApex_criticalDeletion :
  HasCriticalDeletionAt D S.oppApex2
```

No current theorem-bank declaration supplies this uniformly from the retained
origin, cap, MEC, and shared critical-map fields. The fixed-map version of the
same missing fact is a source whose chosen blocker is `S.oppApex2`; the
successor proves that no such source can exist.

The prescribed-pair branch should now be wired directly to the coordinator's
already-existing swapped-frontier handler rather than mined further.

## Validation

The file was checked directly with the repository-pinned Lean 4.27.0
toolchain. The final focused command was:

```bash
env LEAN_PATH="/private/tmp/p97-r-two-off-live-handler-oleans:/private/tmp/p97-r-origin-tagged-coordinator-oleans:/private/tmp/p97-r-f2-second-apex-radius-transport-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-root-failure-parent-lift:/private/tmp/p97-r-failure-parent-lift-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-r-reciprocal-swap-reduction-oleans:/private/tmp/p97-r-collapse-lean427-current-pb2jam3_:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-three-row-metric-oleans" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-two-off-live-handler-oleans/RTwoOffLiveHandler.olean \
  ../scratch/atail-force/r-two-off-live-handler/RTwoOffLiveHandler.lean
```

Exit status: `0`, with no Lean warnings from the owned source.

All sixteen printed declarations depend only on:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean source contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe` declaration.
