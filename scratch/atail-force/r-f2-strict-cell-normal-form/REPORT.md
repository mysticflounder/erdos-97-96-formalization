# Complete F2 strict-cell normal form

## Result

`F2StrictCellNormalForm.lean` combines the three checked strict-cell outcomes
of the actual F2 packet:

1. live-heavy: `SourceFaithfulF2ThreeRowChain`;
2. support-heavy: `F2SupportHeavyReduction`; or
3. mixed: `F2MixedOneLiveOneSupportBoundary`.

The wrapper deliberately retains both:

```text
q ∈ S.surplusCap
TwoLiveExactCoverSecondApexProfile ... S C
```

in every branch. This prevents the reduced cap payloads from replacing or
forgetting the underlying exact `2 live-only + 2 support-only` row, actual
deleted-source critical shell, and global-K4 continuation field.

## Meaning

The two heavy branches each force one actual outer-row center into strict
`oppCap2` and prove that outer row has exactly two `oppCap2` hits:

- live-heavy: the retained live center and live row;
- support-heavy: the actual deleted-source blocker and retained selected
  critical shell.

The mixed branch has exactly one strict point from each outer row and no
two-point outer-center pair. No branch is declared contradictory.

This is the complete F2 branch interface for subsequent role/metric matching.
It is not a generic common-deletion replacement and does not erase the
anchored, reciprocal, or spent origin of the parent packet.

## Preflight and validation

The theorem-bank preflight is recorded in the imported live-heavy,
support-heavy, and direct-U5 audit reports and covers all registries required
by `AGENTS.md` plus focused `nthdegree docs search --lean` queries.

The deliberate repository-pinned Lean 4.27 single-file check exited `0` and
produced:

```text
/private/tmp/p97-r-f2-strict-cell-normal-form-oleans/
  F2StrictCellNormalForm.olean
```

`resolvedF2StrictCellNormalForm` depends only on:

```text
propext, Classical.choice, Quot.sound
```

It does not depend on `sorryAx`. No full `lake-build` was run.

No production file, closure document, protected file, or proof-blueprint
state was changed.
