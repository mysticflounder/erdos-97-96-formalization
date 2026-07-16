# R/F2 original-q generated-row checkpoint

Date: 2026-07-16

Status: **CHECKED SCRATCH REDUCTION; NO PRODUCTION `sorry` CLOSED.**

## Route correction

The live-heavy/mixed F2 callbacks must be expanded at a named dangerous
center using deletion of the **original live source `q`**.  The concrete
critical system's source-`q` row remains centered at `p`; it cannot be
renamed into a new row centered at `x` or `y`.

The earlier target

```text
p in G.support or otherCenter in G.support or coherentSource in G.support
```

is not the correct uniform producer.  Exact local algebraic models in
`shape-audit/REPORT.md` avoid all three hits.  The checked route retains the
full generated row and classifies deletion/survival instead.

## Checked Lean surface

- `source-extraction/OriginalQSourceExtraction.lean` obtains the actual
  source-`q` row and exact q-deleted/q-critical splits at the named
  live-heavy and mixed centers from the common `CriticalShellSystem`.
- `OriginalQOffLiveDeficit.lean` proves that every such generated row has at
  least two support points outside the full live row
  `{q,t1,t2,t3}`.
- `criticality-bridge/OriginalQCriticalityBridge.lean` proves the
  choice-invariant adapters from prescribed deletion failure or actual
  blocker alignment to full-radius/source membership, and retains the raw
  q-critical shell instead of discarding it.
- `OriginalQContinuationClassifier.lean` places the two live-heavy generated
  rows in the existing pair classifier, yielding the two cross-survival arms
  or its exact `MetricResidual`.
- `cap-escape/OriginalQCapEscape.lean` proves that a live-heavy generated row
  is immediately contradictory or has a support point outside both the live
  row and `oppCap2`.
- `OriginalQOutsideMiddleSplit.lean` proves the source-faithful finite split:
  either an off-live generated point lies outside the retained middle row
  and constructs a new `CommonDeletionTwoCenterPacket`, or both named
  support-only points lie in the generated support.

The outside-middle successor keeps:

```text
original source q
generated center
exact generated row
chosen generated support point
off-live and off-middle proofs
old and new common-deletion packets
```

It is not routed through the incompatible old two-off-live handler.

## Exact remaining boundary

The generic split is a reduction, not closure.  For live-heavy,
`confined-terminal/OriginalQConfinedTerminal.lean` now eliminates the
both-hit arm at both named centers.  Thus each checked live-heavy generated
row unconditionally yields a genuine outside-middle successor.

That new common-deletion packet needs a generated-source origin with either:

1. an immediate cap/MEC/order/global-critical-map consumer; or
2. a genuine monotone measure.

The existing finite successor-cycle regression forbids a geometry-free
recursive termination claim.

Mixed remains split by its physical and generated q-critical/q-deleted
constructors.  `cap-escape/OriginalQMixedConfined.lean` closes the
physical/generated q-critical cell and every physical-q-deleted cell with
the third middle-row live hit.  It retains exactly three honest
two-common-point residuals: physical-q-critical/generated-q-deleted, and the
two physical-q-deleted constructors with the third live hit omitted.

## Validation

From `lean/`, the new outside-middle split was checked with the repository
toolchain and the focused scratch olean cache:

```bash
env LEAN_PATH="/private/tmp/p97-r-f2-original-q-offlive-oleans:/private/tmp/p97-r-f2-original-q-source-extraction-oleans:/private/tmp/p97-r-f2-generated-escape-placement-oleans:/private/tmp/p97-r-f2-three-row-bank-deficits-oleans:/private/tmp/p97-r-f2-supportheavy-k4-split-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-f2-live-mixed-handler-root-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-live-common-deletion-current-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:./.lake/build/lib/lean" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-original-q-outside-middle-oleans/OriginalQOutsideMiddleSplit.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/OriginalQOutsideMiddleSplit.lean
```

The check exited successfully.  Every printed declaration depends only on:

```text
propext
Classical.choice
Quot.sound
```

No full `lake-build` was run.
