# Original-q generated-row criticality bridge

Date: 2026-07-16

Status: **MECHANICAL BRIDGE KERNEL-CHECKED; THE MISSING PRODUCER IS NOW
EXACTLY PRESCRIBED DELETION CRITICALITY OR ACTUAL BLOCKER ALIGNMENT AT THE
GENERATED CENTER.**

## Scope

This lane owns only:

- `OriginalQCriticalityBridge.lean`; and
- this report.

It changes no production Lean, closure document, proof-blueprint state,
protected file, or unique-row lane.

## Theorem-bank preflight

Before writing the bridge, I checked the required current and sibling
theorem-bank registries and ran focused indexed Lean searches for:

- prescribed-deletion criticality to selected-support membership;
- q-deleted support membership;
- blocker-center alignment; and
- raw q-critical/full-shell conversion.

The reusable generic bridge is already kernel-checked in
`global-k4-extension/BlockerAlignment.lean`:

```text
source_mem_selected_support_of_prescribed_deletion_criticality
```

The production source also provides:

```text
CriticalShellSystem.no_qfree_at
U5QCriticalTripleClass.exists_card_three_of_qCritical
U5QCriticalTripleClass.exists_criticalFourShell_of_qCritical
```

The scratch implementation specializes these declarations to the exact F2
generated-row constructors.  It does not postulate a new incidence.

## Kernel-checked bridges

### Q-deleted

```text
not K4 at center after deleting source
  -> source belongs to the exact q-deleted generated support
```

is proved by

```text
qDeleted_source_mem_support_of_prescribed_deletion_criticality.
```

The retained critical map gives the immediate provenance adapter:

```text
H.centerAt(source) = center
  -> source belongs to the q-deleted generated support.
```

This is

```text
qDeleted_source_mem_support_of_blocker_alignment.
```

### Q-critical

The q-critical triple is first completed to the selected four-row

```text
insert deleted tripleSupport.
```

Prescribed deletion criticality puts `source` in this full support.  When
`source != deleted`, it therefore lies in the stored surviving triple:

```text
qCritical_source_mem_support_of_prescribed_deletion_criticality
qCritical_source_mem_support_of_blocker_alignment.
```

### Uniform exact generated row

For either constructor:

```text
not K4 at center after deleting source
  -> source = deleted or source belongs to generated.support.
```

With `source != deleted`, this becomes a direct generated-support membership.
The corresponding declarations are:

```text
generated_source_eq_deleted_or_mem_support_of_prescribed_deletion_criticality
generated_source_mem_support_of_prescribed_deletion_criticality
generated_source_mem_support_of_blocker_alignment.
```

The two `..._of_profile_...` adapters take the current
`OriginalQGeneratedCenterProfile` directly.  They show that the F2 packet
already retains every other required field:

```text
q in D.A
generated center != q
source != q
exact generated row at that center.
```

Only the prescribed deletion failure or the equivalent actual-map blocker
alignment remains.

## Raw q-critical retention

The existing `OriginalQDeletionSplit` changes the raw 4A branch into an
exact `U5QCriticalTripleClass` and discards the raw witness.  That is enough
to form a selected four-row, but not enough to invoke APIs that require the
full exact radius filter.

`RawQCriticalPayload` retains:

```text
the raw 4A alternative
an ExactQCriticalAt triple
a CriticalFourShell on the full ambient radius class.
```

`OriginalQDeletionSplitWithRaw` is the corresponding strengthened split.
`originalQDeletionSplitWithRaw_of_globalK4` constructs it directly, and
`OriginalQGeneratedCenterProfile.deletionSplitWithRaw` proves that the
current F2 profile has enough source data to recover it.  The forgetting
theorem

```text
OriginalQDeletionSplitWithRaw.toOriginalQDeletionSplit
```

shows that this is a strict information-preserving refinement of the current
interface, not a changed mathematical case split.

## Intended boundary

For either exact generated constructor, the missing mathematical antecedent
is now explicit:

```text
not K4 at generated center after deleting source
```

or, equivalently as sufficient retained provenance:

```text
CriticalShellSystem.centerAt(source) = generated center.
```

Either antecedent mechanically forces the directed support membership.  The
current F2 source profile supplies neither antecedent.

The q-critical split is also strengthened without changing its mathematics:
the raw 4A alternative is retained together with both its exact triple and
its exact full critical shell.  This prevents later consumers from having to
reconstruct full-filter exactness from a weakened triple-only packet.

## Route consequence

This bridge does not close the F2 branch by itself.  It proves that a proposed
named support hit should no longer be stated as an unexplained incidence.
The source-faithful producer statement is one of:

```text
not HasNEquidistantPointsAt 4 (D.A.erase source) generatedCenter
```

or

```text
W.H.centerAt source hsource = generatedCenter.
```

Once either fact is proved for a branch-relevant source, the support hit is
automatic and selection-independent, including in the arbitrarily trimmed
q-deleted constructor.  Conversely, no current F2 field proves either fact,
so the bridge does not overstate the existing packet.

## Validation

The focused repository-pinned Lean check was:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-f2-original-q-source-extraction-oleans:/private/tmp/p97-r-f2-generated-escape-placement-oleans:/private/tmp/p97-r-f2-three-row-bank-deficits-oleans:/private/tmp/p97-r-f2-supportheavy-k4-split-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-f2-live-mixed-handler-root-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:./.lake/build/lib/lean" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-original-q-criticality-bridge-oleans/OriginalQCriticalityBridge.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/criticality-bridge/OriginalQCriticalityBridge.lean
```

It exited successfully.  Every printed declaration depends only on:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, `sorry`, `admit`, declared axiom, or `native_decide`
in this lane.  No full `lake-build` was run.
