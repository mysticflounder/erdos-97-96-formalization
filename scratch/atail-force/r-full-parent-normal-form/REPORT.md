# Full-parent fixed-radius normal form

Date: 2026-07-16

Status: **kernel-checked scratch connector; no production `sorry` closed**.

## Result

`FullParentFixedRadiusNormalForm.lean` connects the complete live K-A parent
telescope to the current fixed-single-radius R DAG without returning to the
older source-faithful-orbit endpoint.

At a chosen `CriticalPairFrontier F`, the theorem

```lean
CriticalPairFrontier.currentFirstApexFixedRadiusNormalForm
```

returns exactly one of:

1. the protected `FA-UNIQ4` / `FA-UNIQ5` unique-radius arm;
2. `CoherentFixedSingleRadiusContinuation F`, carrying the original frontier
   source together with either
   `AnchoredSourceCriticalTransition` or
   `ReciprocalDirectedCrossResidual`; or
3. a `CommonDeletionTwoCenterPacket` from the radius-spent-at-entry arm.

The coherent output retains the complete
`CoherentRCommonDeletionPacket`, not merely a projected incidence. Therefore
the anchored branch still has its fresh-source and exact-row provenance, and
the reciprocal branch still supports
`exists_fresh_commonDeletion_or_secondApexCritical` from
`ReciprocalDirectedCrossGlobalBoundary.lean`.

The full-parent theorem

```lean
fullParent_extracts_currentFirstApexFixedRadiusNormalForm
```

retains the exact live parent telescope, including the named source rows,
non-opposite-exact hypothesis, no-`M44`, no-removability, fixed/live row
packets, and the concrete supplied `Hcritical`. Its result also preserves:

- the chosen second-large-cap index `j`, with `j ≠ i` and cap cardinality at
  least five;
- the chosen positive first-apex radius and its card-at-least-four class; and
- the concrete frontier indexed by the same `Hcritical`.

This makes the remaining boundary explicit. The connector itself does not
use the global live-row, MEC, no-removability, or no-`M44` geometry to refute
the local outputs. A closing theorem must visibly consume those retained
parent fields on:

- the anchored source-critical transition;
- the reciprocal directed-cross/global-continuation packet; or
- the still-nonterminal common-deletion continuation.

The protected unique-radius lane remains separate.

## Search preflight

This change proves no new finite-pattern or local metric contradiction; it
only composes already checked source theorems. A focused indexed-corpus search
for a full-parent fixed-radius unique/coherent/spent connector found no
stronger reusable declaration. The nearest hits were existing opposite-
endpoint and double-deletion normal forms.

## Validation

The new module was compiled from `lean/` against the current isolated R-DAG
olean chain:

```text
env LEAN_PATH=/tmp/p97-r-orbit-entry-oleans lake env lean -R .. -M 16384 \
  -o /tmp/p97-r-orbit-entry-oleans/FullParentFixedRadiusNormalForm.olean \
  ../scratch/atail-force/r-full-parent-normal-form/FullParentFixedRadiusNormalForm.lean
```

The command exited `0`. Both printed theorems depend only on:

```text
propext, Classical.choice, Quot.sound
```

The file contains no `sorry`, `admit`, custom `axiom`, `native_decide`, or
`unsafe` declaration. `git diff --check` passes. No full Lake build was run.
