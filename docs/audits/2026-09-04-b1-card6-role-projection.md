# B1 card-six role-projection ingress

Lane: `luna-swarm-slice-ingress-b1-card6-role-projection-20260904`  
Owner: `luna-swarm-slice-ingress`  
Base head: `03a496ae4f023bd2e0ffdfd5474c6b279665dea5`

## Theorem-bank preflight

The bounded Lean-corpus query was:

```text
finite image carrier convex independence noncollinearity BoundaryIndexing role projection alias transport positive rows card-six same boundary arc bad target cell
```

The only directly reusable boundary candidate was
`Problem97.Census554.GeneralCarrierBridge.exists_boundaryIndexing`, returned
as handle `HMD12G`.  Its exact antecedents are
`ConvexIndep A` and `¬ Collinear ℝ (A : Set ℝ²)`.  The immediate consumer is
`projectedBoundaryIndexing`; the first antecedent is supplied by
`Problem97.ConvexIndep.mono`, and the second by
`ConvexIndep.not_collinear_of_card_ge_three` after the six physical role
values are embedded in the projected carrier.  No indexed theorem supplied a
role-image row transport or a target-cell transport, so those statements are
proved in this module from the source row choices.

The corpus freshness footer identified source revision `fd3c5e852`; this was
older than the lane base.  The declarations and imports were checked against
the working tree at the pinned base before reuse.

## Exported source-facing declarations

`B1CardSixRoleProjectionIngress.lean` defines:

- `roleCarrier`, the image of the explicit sixteen-tag `roleUniverse`;
- `roleCarrier_subset_A`, `roleCarrier_convexIndep`, cardinality at most 16,
  and the source-backed lower bound of six;
- `roleCarrier_not_collinear` and `projectedBoundaryIndexing`;
- `projectedRoleLabel`, `projectedRoleIndex`, and
  `projectedRoleIndex_alias_preserved`;
- `projectedRowMembers`, `projectedRowCenter`, `projectedRowAnchor`,
  `projectedRowAnchor_mem`, and `projectedRow_positive` for all four row tags;
- `ReflectedBoundaryChart`, `reflectedBoundaryChart`, and
  `normalizedReflectedBoundary`.  Reflection reverses signed area while
  retaining the index map, and `sameBoundaryArc_reflected_iff` transports the
  linear-cut predicate through the reflected point set.  The public
  `normSim_signedArea_pos` and `normalizedReflectedBoundary_positive` lemmas
  then preserve the native positive orientation after gauge normalization.

The card-six target is represented by `cardSixUSameBoundaryArc` and
`cardSixVSameBoundaryArc`.  `cardSix_badTargetCell` proves, for every ambient
boundary indexing, the negation of their conjunction.  This is the strength
provided by the source theorem
`false_of_b1PhysicalClassFiveSixNormalForm_of_liveSlicesSameBoundaryArc`; no
separate negation of the `u` or `v` alternative is asserted.

## Validation and handoff

The exact source currently retained in this lane has SHA-256
`0dcf44e69697862f980155bdc55368893872bbd9c660c4de4d07adde7a726144` and 822
lines.  A focused `lake env lean` check reaches the compatibility declaration
`orderedProjectedBoundaryIndexing_boundary` and then hits Lean's deterministic
`isDefEq` heartbeat timeout.  The earlier green check predates the attempted
ordered-projection compatibility section and must not be reused as evidence for
the current bytes.

The corrected direct raw-index chain is being integrated in the separate
governed module `B1CardSixRawOrderIngress.lean` by
`luna-swarm-proofforge` under monitor assignment #11019.  This lane has made no
solver or PIQD launch and has not promoted a target theorem.  Its old ambient
`cardSix_badTargetCell` remains source-level infrastructure only; it is not the
corrected finite raw target.

No source `sorry`, `admit`, `axiom`, `unsafe`, `native_decide`, `implemented_by`,
or `extern` marker was added.  The role-projection file remains uncommitted and
owned here for historical ingress traceability; no replacement module imports
it.

The owner-scoped hygiene report currently has `issues: 0`; its overall
`blocking: true` status is caused by the shared worktree's pre-existing foreign
dirty and durable-untracked paths, not by this lane's declared source or
manifest scope.
