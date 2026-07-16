# Generated-successor parent entry

Date: 2026-07-16

Status: **KERNEL-CHECKED ENTRY. LIVE-HEAVY REALLY PRODUCES TWO FULL-PARENT
SUCCESSORS; MIXED RETAINS ONE EXACT RESIDUAL FAMILY.**

Owned files:

- `GeneratedSuccessorParentEntry.lean`
- this report

No production Lean, project docs, blueprint state, protected file, or
unique-row artifact was changed.

## Result

Three source-clean theorems were checked.

### 1. The parent context reaches the exact origin-tagged coordinator

```lean
OriginalQOutsideMiddleParentContext.exists_originTaggedNormalForm
```

is a direct specialization of
`fullParent_extracts_dangerousRetainingOriginTaggedNormalForm`. It returns:

- the witnessed second cap `j`, with `j != i` and cap cardinality at least five;
- the concrete `LiveDangerousRetainingSystem W`;
- `q` in the CP-derived surplus cap;
- the positive first-apex radius and cardinality-four lower bound;
- the exact `CriticalPairFrontier` over `W.H`; and
- `OriginTaggedCurrentFirstApexFixedRadiusNormalForm` on that same frontier.

Thus the new `OriginalQOutsideMiddleParentContext` is not an unconnected
scratch contract. The existing full-parent theorem enters its exact dependent
coordinator surface.

### 2. Native anchored live-heavy constructs two full-parent surfaces

```lean
nonempty_successorParentSurfacePair_of_anchoredF2LiveHeavy
```

accepts exactly the data visible in the native anchored live-heavy callback:

- the parent-selected `j`, `W`, radius, and frontier;
- the fixed terminal and history source tied to `frontier.pair.q`;
- the coherent packet, anchored transition, row-external source, and its
  off-surplus proof;
- the live-center equality;
- the exact two-live F2 profile; and
- the source-faithful three-row chain.

It does **not** assume a generated profile or an outside-middle successor.
Instead it invokes the existing checked chain:

1. `anchoredProvenanceF2NormalForm`;
2. `nonempty_anchoredF2LiveHeavyReduction`;
3. `nonempty_originalQOffLiveGeneratedPair_of_liveHeavy`; and
4. `nonempty_outsideMiddleSuccessor_atX` and `...atY`.

The conclusion is stronger than mere inhabitation:

```lean
Nonempty
  (OriginalQOutsideMiddleSuccessorParentSurface Pctx ×
    OriginalQOutsideMiddleSuccessorParentSurface Pctx)
```

The two surfaces contain the actual generated rows and successors at the
named live-heavy centers `x` and `y` respectively.

### 3. Native anchored mixed has an exact trichotomy

```lean
false_or_nonempty_successorParentSurface_or_mixedConfinedResidual
```

also assumes no generated profile or successor. From the exact mixed F2
callback it constructs the named mixed witnesses and original-q generated row,
then applies the existing mixed confined classifier. Its conclusion is:

```lean
False ∨
  Nonempty (OriginalQOutsideMiddleSuccessorParentSurface Pctx) ∨
  ∃ named : NamedF2MixedWitnesses F2 boundary,
    Nonempty (MixedConfinedResidual named)
```

It would be incorrect to force the middle disjunct. The current mixed theorem
has three surviving `MixedConfinedResidual` constructors:

- physical q-critical / generated q-deleted;
- physical q-deleted / generated q-deleted; and
- physical q-deleted / generated q-critical.

Those are the exact remaining mixed bridge, not missing parent provenance.

## Projection audit

The old generic
`OriginTaggedRCommonDeletionEliminator` retypes the anchored packet through
`commonDeletionAtLiveCenter`. The anchored F2 reductions are indexed instead
by `alignedSharedRowPacket X hcenter`. Treating those separately constructed
dependent packets as definitionally equal would be invalid.

This problem has already been addressed by the checked
`NativeOriginTaggedRCommonDeletionEliminator` and
`NativeOriginTaggedCoordinatorEliminator` in
`r-anchored-f2-supportheavy-handler/AnchoredF2SupportHeavyHandler.lean`. Their
anchored callback retains `R`, `A`, `X`, `hXOff`, and classifies the native
`alignedSharedRowPacket` directly.

The two new branch-entry theorems have exactly the argument lists supplied by
that native callback:

- live-heavy receives `F2` and `SourceFaithfulF2ThreeRowChain`;
- mixed receives `F2` and `F2MixedOneLiveOneSupportBoundary`.

Therefore no new dependent-cast/provenance bridge is required. The current
coordinator can reach the entry theorem without projection loss, provided the
native eliminator is used.

## Exact remaining boundary

The status split is now sharper:

- **PROVEN:** the full parent theorem reaches the origin-tagged coordinator.
- **PROVEN:** an exact native anchored live-heavy callback creates two
  `OriginalQOutsideMiddleSuccessorParentSurface` values without any added
  producer assumption.
- **PROVEN:** an exact native anchored mixed callback creates a full-parent
  successor or closes immediately or reaches a named `MixedConfinedResidual`.
- **OPEN:** eliminate `MixedConfinedResidual` from full cap/MEC/order/common-map
  data, and prove direct `False` for the full-parent generated successor.
- **NOT CLAIMED:** unconditional construction of the surface from the whole
  parent branch, because original-unique, reciprocal, spent, unaligned, F1,
  support-heavy, F3, and mixed-residual outcomes are genuine separate arms.
- **NOT CLAIMED:** closure of a production `sorry`.

This is the strongest honest extractor: live-heavy is unconditional at its
exact branch boundary; mixed remains a checked trichotomy rather than gaining
an assumption whose sole purpose is to choose the successor arm.

## Validation

As with the predecessor scratch file, the Lean LSP cannot attach to a source
outside the Lake root. A focused single-file Lean check was run from `lean/`
against the existing scratch oleans:

```bash
env LEAN_PATH="/private/tmp/p97-r-f2-generated-successor-parent-oleans:/private/tmp/p97-r-f2-original-q-confined-terminal-oleans:/private/tmp/p97-r-f2-original-q-mixed-confined-oleans:/private/tmp/p97-r-f2-original-q-cap-escape-oleans:/private/tmp/p97-r-origin-tagged-coordinator-oleans:/private/tmp/p97-r-f2-original-q-outside-middle-oleans:/private/tmp/p97-r-f2-original-q-offlive-oleans:/private/tmp/p97-r-f2-original-q-source-extraction-oleans:/private/tmp/p97-r-f2-generated-escape-placement-oleans:/private/tmp/p97-r-f2-three-row-bank-deficits-oleans:/private/tmp/p97-r-f2-supportheavy-k4-split-oleans:/private/tmp/p97-r-f2-live-mixed-handler-root-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-root-failure-parent-lift:/private/tmp/p97-r-failure-parent-lift-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-live-common-deletion-current-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-r-reciprocal-swap-reduction-oleans:/private/tmp/p97-r-collapse-lean427-current-pb2jam3_:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-joint-transition-oleans:./.lake/build/lib/lean" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-generated-successor-parent-entry-oleans/GeneratedSuccessorParentEntry.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/generated-successor-parent-entry/GeneratedSuccessorParentEntry.lean
```

Exit status: `0`, with no Lean warnings. All three printed declarations close
under exactly:

```text
propext
Classical.choice
Quot.sound
```

The source contains no `sorry`, `admit`, declared `axiom`, `native_decide`, or
`unsafe` declaration. No full build, production wiring, blueprint refresh, or
publication gate was run.
