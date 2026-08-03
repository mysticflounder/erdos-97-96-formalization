# Retained directed-omission / all-large audit (2026-07-31)

Scope: source-only audit of `FrontierLiveClosure.lean`; no production edits were
made by this audit.  The file is concurrently modified in the worktree by the
refactor lane, so declaration locations below refer to the current source.

## Current source shape

The former open leaf
`false_of_retainedInteriorDirectedOmission_and_all_low_hits` is now a
compatibility wrapper (declaration around line 6929).  The refactor inserts:

* `RetainedOmissionAllLargeNormalForm` (around 6758), with two constructors:
  paired common deletion, or localized reverse hit plus a fresh common
  deletion;
* `nonempty_retainedOmissionAllLargeNormalForm` (around 6804), whose body
  composes the checked producers
  `nonempty_retainedInteriorCommonDeletion`,
  `nonempty_orientedRetainedCommonDeletion`,
  `nonempty_retainedReverseCouplingOutcome`, and
  `exists_fresh_firstCap_commonDeletion_of_reverseHit`;
* `TriApexAllLargeContext` (around 6831) and the checked residual adapter
  `triApexAllLargeContext_of_residuals` (around 6879); and
* the new core
  `false_of_retainedOmission_triApexAllLarge_core` (around 6917), whose body
  is still exactly `by sorry` (around 6926).

The wrapper constructs the normal form and flattened context, then calls only
the new core.  Thus the refactor removes the direct `sorry` from the public
wrapper but does not close the mathematical obligation: the core is the sole
remaining positive geometric `sorry` in this lane.

## Axiom/compile probe

Probe file: `scratch/retained_directed_omission_probe_20260731.lean`.

Before the concurrent source refactor, compiling with

```text
cd lean && lake env lean ../scratch/retained_directed_omission_probe_20260731.lean
```

reported:

* `false_of_retainedInteriorDirectedOmission_and_all_low_hits`:
  `[propext, sorryAx, Classical.choice, Quot.sound]`;
* `false_of_frontierAllLargeCapsTriApex_all_low_hits` and its source-clean
  wrappers: `sorryAx` transitively, because they call that leaf;
* the two collision-to-directed-omission producers:
  `[propext, Classical.choice, Quot.sound]` (no `sorryAx`).

After the source refactor, the same probe against the existing imported
`.olean` reports the new core/producer/context names as unknown identifiers.
This is a stale-`.olean` issue, not a source error: the modified module has not
yet been rebuilt.  No claim of kernel closure is made here.

## Dependency and closure verdict

The normal-form and residual-adapter bodies are syntactically acyclic and use
checked upstream producers.  They can be treated as source-clean pending a
fresh module build.  The core has no implemented proof and necessarily carries
`sorryAx`; all later consumers that appear source-clean remain transitively
dependent on this core through the compatibility wrapper.  No theorem-bank or
imported source-clean theorem found in the surrounding ATail modules derives
`False` from either normal-form constructor plus the tri-apex context.

The missing bridge is global geometry/minimality: combine either (i) paired
common deletions or (ii) reverse-hit/fresh-third common deletion with all three
rich apex structures, cap-card bounds, unique-four coverage, and the
no-center-covers-all-apices condition to obtain a concrete impossible metric
configuration.  Existing cardinality/localization lemmas only produce the
normal-form packet; they do not close it.

Direct consumers of the compatibility wrapper in the current source are at
lines 12248, 12359, 12419, 12427, and 12486 (the exact-four/two-radius
collision and related coordinator branches).  The tri-apex coordinator
`false_of_frontierAllLargeCapsTriApex_all_low_hits` consumes the old wrapper
through its collision/omission split.  These consumers therefore inherit the
core's `sorryAx`; they are not independent closures or root calls.

Therefore the current obligation **cannot be proved without a new geometric
producer**.  The refactor is a useful narrowing and appears acyclic, but it is
not kernel-checked closure until the core is implemented and the module is
rebuilt.
