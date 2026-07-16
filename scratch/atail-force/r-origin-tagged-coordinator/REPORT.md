# Origin-tagged R coordinator

Date: 2026-07-16

Status: **CHECKED-SCRATCH INTERFACE. NO R BRANCH OR PRODUCTION `sorry` IS
CLOSED.**

## Scope

This lane owns only:

- `scratch/atail-force/r-origin-tagged-coordinator/OriginTaggedCoordinator.lean`;
- this report.

It does not edit production Lean, `docs/live-blueprint.md`, SurplusM44,
`SevenPointTwinFourCircleCollision.lean`, `CriticalPairFrontier.lean`, or the
user-owned unique-row lane.

The branch-coverage audit had already completed the required theorem-bank and
indexed-corpus preflight. This file introduces no new finite-pattern or metric
contradiction; it preserves source provenance and exposes the existing checked
classifiers without strengthening them.

## Why the existing resolved type is not invertible

There is no sound adapter

```text
ResolvedCurrentFirstApexFixedRadiusNormalForm F
  -> origin-tagged normal form
```

from the current proposition alone.

Its reciprocal common-deletion arm retains only `R`, `z`, and a generic
packet. It has already erased:

- `X : ReciprocalDirectedCrossResidual R`;
- `z ∈ R.reciprocalDeletedRow.support`;
- `z` outside the fixed class and retained source row;
- `z ∈ T.carrier`;
- exact retained-row equality after the two deletions;
- retained-row radius uniqueness; and
- the directed-cross sign.

Its spent arm retains only existential `deleted`, `center₁`, and a packet. It
has already erased:

- the frontier `F` as the packet's source;
- `E : FrontierRadiusSpentAtEntry F`;
- `deleted = F.pair.q`; and
- `center₁ = S.oppApex1`.

The new coordinator therefore rebuilds from the chosen source-current
frontier before either projection occurs. The parent-facing adapter invokes
the existing dangerous-retaining current-normal-form theorem to obtain the
actual `LiveDangerousRetainingSystem`, radius, and frontier, then re-enters
through that frontier rather than attempting to invert `_hcurrent`.

## Exact origin tags

`RCommonDeletionOrigin` is dependently indexed by the deleted source, first
center, and exact packet. Its constructors retain:

- `anchored`: `T`, `P`, `P.x = F.pair.q`, `R`,
  `A : AnchoredSourceCriticalTransition R`,
  `X : RowExternalCommonDeletionSource A`, `X.point ∉ S.surplusCap`, and
  exactly `X.toSharedRowCommonDeletionPacket`;
- `reciprocal`: `T`, `P`, `P.x = F.pair.q`, `R`,
  `X : ReciprocalDirectedCrossResidual R`, and
  `G : ReciprocalCommonDeletionContinuation X`;
- `spent`: `E : FrontierRadiusSpentAtEntry F` and exactly a packet with
  deleted source `F.pair.q`, first center `S.oppApex1`, and second center
  `S.oppApex2`.

`ReciprocalCommonDeletionContinuation` retains every field of
`exists_fresh_commonDeletion_or_secondApexCritical` before the final split.
Only its actual common-deletion arm is tagged. The prescribed critical arm is
still routed to `SwappedFirstApexUniqueFourFrontier`.

The source-current producers are:

```lean
reciprocalCommonDeletionContinuation_or_swappedFirstApexUniqueFour
CriticalPairFrontier.originTaggedCurrentFirstApexFixedRadiusNormalForm
fullParent_extracts_dangerousRetainingOriginTaggedNormalForm
```

`OriginTaggedCurrentFirstApexFixedRadiusNormalForm` also retains
`q ∈ S.surplusCap` and keeps the original unique-radius and swapped-unique-four
dependencies explicit.

## Branch-complete checked surface

For an exact packet, `rCommonDeletionBranch` first splits:

```text
firstCenter != p
firstCenter = p
```

The aligned packet is retyped by equality only; its rows and radius witnesses
are not reselected.

`alignedRCommonDeletionBranch` then exposes:

1. the positive two-off-live branch, with the exact successor-or-second-center
   aligned-pair output;
2. F1, with the second-apex cap profile;
3. F2 live-heavy, with `SourceFaithfulF2ThreeRowChain`;
4. F2 support-heavy, with `F2SupportHeavyReduction`;
5. F2 mixed, with `F2MixedOneLiveOneSupportBoundary`; or
6. F3, with the second-apex cap profile.

The motive-valued contracts are:

```lean
AlignedRCommonDeletionEliminator
RCommonDeletionEliminator
OriginTaggedRCommonDeletionEliminator
OriginTaggedCoordinatorEliminator
```

Their checked `eliminate` theorems require a handler for every displayed
branch. They do not provide any handler. In particular, setting the motive to
`False` remains an open producer obligation for every unclosed branch.

This shape prevents an anchored aligned support-heavy result from being
mistaken for an eliminator of reciprocal, spent, unaligned, F1, F2
live-heavy/mixed, F3, or two-off-live-positive branches.

## Validation

The file was checked directly from `lean/` with the repository-pinned
toolchain:

```text
Lean 4.27.0
```

The final command used current direct-import oleans, including the
post-source rebuild of `FailureProfilesParentLift.olean`:

```bash
env LEAN_PATH="/private/tmp/p97-r-origin-tagged-coordinator-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-root-failure-parent-lift:/private/tmp/p97-r-failure-parent-lift-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-r-reciprocal-swap-reduction-oleans:/private/tmp/p97-r-collapse-lean427-current-pb2jam3_:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-joint-transition-oleans" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-origin-tagged-coordinator-oleans/OriginTaggedCoordinator.olean \
  ../scratch/atail-force/r-origin-tagged-coordinator/OriginTaggedCoordinator.lean
```

Exit status: `0`, with no Lean warnings.

All nine printed declarations depend only on:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean source contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe` declaration. `git diff --check` is clean.

No full `lake-build`, proof-blueprint refresh, production wiring, or
publication gate was run.
