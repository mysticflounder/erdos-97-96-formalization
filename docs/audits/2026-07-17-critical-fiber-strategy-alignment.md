# A-TAIL critical-fiber strategy alignment audit

Date: 2026-07-17

Status: **ROUTE CORRECTED; SOURCE-PROVENANCE GATE INSTALLED; NO PRODUCTION
`sorry` CLOSED.**

## Decision

Keep `false_of_twoLargeCaps_commonCriticalMap` as the final parent assembler,
called before LIVE-Q/C construction. Replace the anonymous row producer and
the arbitrary-fiber direct contradiction by the geometry-sensitive
common-deletion arm producer

```lean
nonempty_criticalFiberClosingCore
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (CriticalFiberClosingCore R)
```

from one concrete `FrontierCommonDeletionParentResidual F`.

The output contains a geometry-selected
`P : FrontierCommonDeletionCriticalFiber R`. Its `ordered` constructor reaches
the exact source-indexed Kalmanson core; its `sameCap` constructor reaches the
exact collision-pair cap-uniqueness core. A terminal adapter is load-bearing
only if the chosen fiber and its source provenance remain visible in its
statement and proof. `false_of_criticalFiberClosingCore` is the immediate
consumer.

Production `ATail/FirstApexCriticalFiber.lean` now supplies exactly this
typed predecessor through `nonempty_frontierCommonDeletionCriticalFiber`.
Production `ATail/FirstApexCriticalFiberRow.lean` then supplies the exact
`BothOff`/`RowHit` split as `Outcome P`, indexed by that same predecessor.
Both source-critical facts therefore remain available on both branches. This
fixed-fiber split is diagnostic and nonterminal; it does not justify closure
for every preselected `P`.
Production `ATail/CriticalFiberClosingCore.lean` now defines the exact
existential contract and proves `false_of_criticalFiberClosingCore`; its four
axiom checks contain only `propext`, `Classical.choice`, and `Quot.sound`.

## Why the old target was rejected

The checked six-role Kalmanson theorem is mathematically valid, but its proof
uses only three selected-shell equalities.  It does not use that `C,K` are
distinct sources mapped to `A`, or that deletion of each source destroys K4
at `A`.  The arbitrary outside-pair extraction from the common `A`-shell also
works for every selected four-shell.  These are conditional consumers, not
evidence that the forced blocker-fiber collision advances the parent proof.

Six source-faithful audits establish the corrected boundary:

- `scratch/atail-force/robust-orow-collision-hit/` proves an exact
  `bothOff ∨ rowHit` split.  A checked `Fin 12` regression realizes `bothOff`
  with the total fixed-point-free critical map, exact support locking,
  first-apex robustness, and row-closure minimality.  The hit arm still lacks
  the cross row and cyclic order.
- `scratch/atail-force/collision-outside-pair-blockers/` proves that the
  collision-faithful cap split yields only common-blocker pinning, an
  outside-cap cross-bisector, or mutual omission.  It does not produce a
  same-cap second center.
- `scratch/atail-force/cross-row-mining-manifest/` rejects raw anonymous
  `O/A/X` mining.  Its corrected coverage object retains `C,K -> A`, both
  `no_qfree` facts, a critical source `J`, `X = centerAt J`, the actual exact
  `J`-shell, the cross incidence, and the cyclic order.  Pinned replay finds a
  source-indexed cross-row embedding in 75 of 101 witnesses and no accepted
  terminal shape in 26; this is not a coverage theorem.
- `scratch/atail-force/critical-fiber-consumer-match/` defines the exact
  existential `CriticalFiberClosingCore R` and kernel-checks the immediate
  contradiction for both allowed constructors.
- `scratch/atail-force/critical-fiber-both-off-cap-localization/` proves the
  full endpoint/interior cap localization of a fixed `BothOff P`; its strong
  shell counts still do not match an existing consumer.
- `scratch/atail-force/critical-fiber-minimal-deletion/` constructs literal
  singleton stutters at the old common blocker, including when the deletion
  universe is the full common shell.

## Active next theorem

Prove `nonempty_criticalFiberClosingCore R`, choosing the fiber only after
using full Euclidean convexity, cap partition, MEC,
frontier-radius, minimality, and no-`IsM44` hypotheses. Do not weaken it to an
arbitrary selected row or strengthen it to contradiction for every `P`.

If the Kalmanson route survives that localization, the packet must retain a
critical source `J` and use the actual `J`-critical shell for the cross
incidence.  If the same-cap route survives, its repeated pair must be the
collision source pair `C,K` itself and its second center must be source
realized.

No broad computation is authorized until the encoding manifest contains the
complete source map above, an immediate checked consumer, and an ablation
test showing that removal of either collision-source criticality or `J`'s
critical provenance invalidates the claimed coverage.

The fixed-fiber residual audits are negative but load-bearing for scoping.
`BothOff` cap localization gives strong endpoint/interior shell counts with no
matching consumer. Global minimal deletion can stutter at the old common
blocker with either singleton collision source, even over the whole common
shell. These routes do not replace the existential closing-core producer.

## Synchronized documents

This decision is reflected in:

- `docs/closure-plan-full-spec-2026-07-09.md`;
- `docs/closure-matrix-2026-07-09.md`;
- `docs/atail-force-producer-plan-2026-07-13.md`; and
- `docs/97-rvol-full-prose-proof-2026-07-13.md`.

Historical audits and external prompts remain historical artifacts and are
not rewritten as current plans.
