# Card-12 frontier/common-deletion alignment report

## Result

The existing five-point/common-deletion successor cannot be aligned with
`false_of_frontierCommonDeletionPhysicalSecondApex` on either the original
exact-four frontier or its canonical late-first-apex rebase.

The obstruction is kernel-level, not merely a theorem-search miss:

- `OriginalUniqueFourResidual F` fixes the selected first-apex class to have
  cardinality exactly four and makes every ambient first-apex K4 use that same
  radius.
- Deleting `F.pair.q` and `F.pair.w`, both members of that class, therefore
  leaves fewer than four members at the first-apex radius.
- `FrontierCommonDeletionParentResidual F` requires the opposite witness in
  `common.firstApexDouble`.

`FrontierCommonDeletionAlignmentObstruction.lean` proves:

1. `firstApexDouble_blocked_of_originalUniqueFour`;
2. `no_same_frontier_commonDeletionParentResidual`; and
3. `no_late_frontier_commonDeletionParentResidual`.

The directory is a standalone local Lake package pinned to Lean 4.27 and
depending on the worktree's `lean/` package. This lets the scratch theorem be
checked with the global `lake-build` wrapper without placing validation modules
inside the production Lean tree.

Validation command:

```text
LAKE_BUILD_NO_REFRESH=1 lake-build \
  +FrontierCommonDeletionAlignmentObstruction
```

Result: `Build completed successfully (8762 jobs).` The final build log is
`lake-build-final.log`. LSP `lean_verify` reports only Lean's standard
`propext`, `Classical.choice`, and `Quot.sound` axioms for both the direct
blocker and the late-rebased-frontier theorem; the source contains no
`sorry`, `admit`, or declared axiom.

## Additional role mismatches

The five-point/common-deletion residual supplies
`CommonDeletionTwoCenterPacket D H deleted center S.oppApex2` with arbitrary
`deleted` and arbitrary first `center`. The physical-second-apex terminal
requires a packet whose deletion point is the target frontier's `pair.q` and
whose first center is exactly `S.oppApex1`.

Consequently a route through a genuinely fresh frontier would need, at minimum:

- a new critical-pair frontier whose `pair.q` is the local `deleted`;
- identification of the local first center with `S.oppApex1`;
- a positive four-point witness after deleting that frontier's `q,w` at
  `S.oppApex1`; and
- the existing common-deletion packet transported across those equalities.

None of the five-point reduction fields or
`SecondRowCommonDeletionSuccessor` fields produces the first three items.
For the original or late-rebased exact-four frontier, the third item is
provably false by the accompanying Lean theorem.

## Bank/consumer search

The required theorem-bank registries and indexed Lean corpus were searched
before this proof. No field-compatible terminal for an arbitrary-center
`CommonDeletionTwoCenterPacket` was found. The retained-matching normalization
that fixes the first center to `S.oppApex1` already assumes a
`FrontierCommonDeletionParentResidual`, so it cannot construct the missing
parent residual without circularity.

## Minimal missing statement

For a fresh-frontier approach, the minimal genuinely new producer is an
aligned fresh frontier carrying:

```lean
Nonempty (FrontierCommonDeletionParentResidual Ffresh)
```

together with equalities transporting the local successor packet to
`Ffresh.pair.q`, `S.oppApex1`, and `S.oppApex2`. This is not derivable from the
current five-point/common-deletion fields. Specializing `Ffresh` to the
original frontier or `lateFirstApexFrontier R` is inconsistent with
`OriginalUniqueFourResidual`.
