# Equal-blocker full-parent gate — initial checkpoint

Date: 2026-07-19

## Decision

`NOT_RUN`.  The first active target is the exact full-parent implication

```lean
M : FullParentExactFiveMutualData L profile
Q : FullParentMutualEqualBlockerShell M
⊢ False
```

The gate manifest and checker are now in place, but no complete parent model
has been encoded.  This is intentional: the existing equal-blocker reports
are all retained-subsystem regressions and do not contain enough information
to decide the implication.

## Required ledger

The manifest requires the complete `D`/`S`/`H`/`F0`/`R`/`B`/`L` packet,
source-faithful equal-blocker provenance, strict convex order, MEC/cap
geometry, complete exact-radius filters, all-center K4, every
`H.no_qfree_at`, minimality, global `noM44`, both cap-six bounds, and the
deletion/restoration fields.  A decisive status is rejected unless all of
these fields are present.

## Current evidence

The four cited reports remain `RELAXATION_ONLY`:

* `global-mutual-equal-blocker-terminal` identifies the missing
  source-faithful same-cap or ordered-row producer.
* `critical-fiber-closing-core-samecap` identifies `ParentSameCapRoute` as
  the exact same-cap antecedent and supplies a projection-level regression.
* `critical-fiber-closing-core-ordered` records the missing support-membership
  and cyclic-order fields for the ordered terminal.
* `global-mutual-third-source-producer` shows that a third row is not forced
  by the current finite projection.

No source `sorry` is closed by this checkpoint.  The next allowed result is a
substitution-checked full-parent witness, a checked UNSAT certificate for
this exact branch, or an explicit `UNKNOWN`/timeout outcome.

Validation:

```text
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/equal-blocker-full-parent-gate/check_manifest.py \
  --manifest scratch/atail-force/equal-blocker-full-parent-gate/manifest.json
=> status NOT_RUN; all parent ledger fields missing (fail-closed)
```
