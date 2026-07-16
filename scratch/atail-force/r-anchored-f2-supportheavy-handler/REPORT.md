# Anchored F2 support-heavy handler

Date: 2026-07-16

Status: **CHECKED-SCRATCH ELIMINATOR. NO PRODUCTION `sorry` IS CLOSED.**

This lane keeps the anchored origin on the provenance-bearing
`alignedSharedRowPacket` surface.  The generic coordinator transport
`commonDeletionAtLiveCenter` is deliberately not substituted for that packet:
the dependent live-system index makes that cast non-definitional.  The
intended checked surface is:

- a native anchored-origin classifier which reaches the F2 support-heavy
  handler without casting through the generic aligned packet;
- the exact global-K4 four-way generated-row split;
- routing of both mixed generated cases to cross-survival,
  non-equilateral, or equilateral residuals;
- replacement of the both-q-deleted generated case by its exact new
  common-deletion packet; and
- elimination of the both-q-critical metric residual using the already
  checked anchored cap-order contradiction.

The resulting motive-valued interface has eight callbacks:

1. repeated common deletion;
2. q-deleted/q-critical cross survival;
3. q-deleted/q-critical non-equilateral;
4. q-deleted/q-critical equilateral;
5. q-critical/q-deleted cross survival;
6. q-critical/q-deleted non-equilateral;
7. q-critical/q-deleted equilateral; and
8. both-q-critical cross survival.

It does not claim that any callback is already contradictory.  The ninth
candidate, the both-q-critical metric residual, is absent because the
existing anchored cap-order theorem eliminates it internally.

The file also provides `NativeOriginTaggedCoordinatorEliminator`, which keeps
reciprocal and spent origins on the existing generic packet classifier but
routes the anchored origin through `alignedSharedRowPacket`.  This is the
load-bearing interface for future anchored F2 handlers.

## Interface correction

`commonDeletionAtLiveCenter X.toSharedRowCommonDeletionPacket hcenter` and
`alignedSharedRowPacket X hcenter` encode the same ordinary row data, but
they are not definitionally interchangeable because their types retain
different dependent live-system indices.  The checked implementation does
not cast between them.  Instead it reclassifies the anchored origin directly
on the native source-faithful packet, while reciprocal and spent origins
continue through the generic coordinator.

## Validation

The file was checked directly with the repository-pinned Lean 4.27.0
toolchain and the current scratch olean chain:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-anchored-f2-supportheavy-handler-oleans:/private/tmp/p97-r-origin-tagged-coordinator-oleans:/private/tmp/p97-r-f2-generated-metric-sink-oleans:/private/tmp/p97-r-f2-anchored-supportheavy-coupling-oleans:/private/tmp/p97-r-f2-generated-escape-placement-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-supportheavy-deleted-cap-oleans:/private/tmp/p97-r-f2-three-row-bank-deficits-oleans:/private/tmp/p97-r-f2-supportheavy-k4-split-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-r-reciprocal-swap-reduction-oleans:/private/tmp/p97-r-collapse-lean427-current-pb2jam3_:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:$(lake env printenv LEAN_PATH)" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-anchored-f2-supportheavy-handler-oleans/AnchoredF2SupportHeavyHandler.olean \
  ../scratch/atail-force/r-anchored-f2-supportheavy-handler/AnchoredF2SupportHeavyHandler.lean
```

The command exits `0`.  Every printed endpoint depends only on:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean file contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe` declaration.  No full `lake-build`,
proof-blueprint refresh, or production wiring was run.
