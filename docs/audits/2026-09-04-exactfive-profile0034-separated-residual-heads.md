# Exact-five profile 0034 separated residual heads

Date: 2026-09-04

## Governed context

- Lane: `exactfive-profile0034-separated-residual-heads-20260904`.
- Base commit: `a8c83dd98ee47ee7452ca8e06538dca9968098ea`.
- Lean root: `lean/`; toolchain: `leanprover/lean4:v4.27.0`.
- Source: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactFiveDistinctProfile0034SourceAdapter.lean`.
- Immediate consumer: `false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence` in `Rigid221Closure.lean`.

## Closed declaration

The adapter now proves
`RobustApexFourIncidenceContinuationPacket.exists_profile0034_separated_residual_heads`.
Under the two positive source memberships and the second-row membership, it
returns `p ∈ row₀` and `s ∈ row₁` with
`p ≠ s`, `p ≠ S.oppApex2`, and `s ≠ S.oppApex2`.

The proof first extracts two residual points in each of rows 0 and 1.  When
`S.oppApex2 ∈ row₀`, `threeFan_shared_support_restriction` makes any cross-row
equality be either `N.retained` or `S.oppApex2`; residual freshness and the
selected center avoidance rule out both.  When `S.oppApex2 ∉ row₀`, the proof
uses an explicit by-cases split over the two distinct row-1 residuals and
swaps to the row-0 residual `q` in the only two-forbidden-value cases.

No blocker/deleted identity, boundary order, or seven-role distinctness is
asserted here.  The remaining `U = deleted` split belongs to the boundary
consumer: its existing `hU` label is the blocker and its `hd` label is the
deleted point, so this adapter leaves that source distinction intact.

## Verification and trust

Focused check from `lean/`:

```text
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactFiveDistinctProfile0034SourceAdapter.lean
exit 0, no output
```

The declaration is a source helper and is not yet wired into the publication
spine.  Its proof uses only kernel-checked Lean and ordinary classical finite
set reasoning; no `sorry`, custom axiom, native reduction, or external
certificate is introduced.

## Worktree hygiene

The lane owns only this audit, the adapter source, and its checkpoint.  The
worktree contains unrelated foreign edits and untracked artifacts; none were
modified, staged, or cleaned by this lane.
