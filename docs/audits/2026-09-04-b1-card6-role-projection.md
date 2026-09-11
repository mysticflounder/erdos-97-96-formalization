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

## Historical validation and handoff (2026-09-04)

The exact source retained in that historical lane state had SHA-256
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

## 2026-09-10 build repair

Lane `b1-role-projection-whnf-repair-20260910` repaired the deterministic
heartbeat failure without changing the statement of
`orderedProjectedBoundaryIndexing_boundary`.  The failure came from reducible
type checking unfolding `roleCarrier` and `orderedRoleEmbedding` while Lean
reconciled the dependent boundary index type.  The repair makes those two large
definitions irreducible only while elaborating the compatibility theorem and
uses the resulting direct reflexivity proof.  The theorem's old
three-million-heartbeat override is no longer needed; the surrounding
projection-data definition and all public signatures are unchanged.

The retained source has SHA-256
`7722b201f0697aca76fe356c9c92307c0ceb6d4170823438a040817d110c0658`
and 865 lines.  A direct single-file Lean check passes under the default
heartbeat limit.  The governed target build also passes:

```text
Built Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CardSixRoleProjectionIngress (5.8s)
Build completed successfully (11755 jobs).
lake-build: lake build exited 0
```

The build log is
`lean/.lake/lake-build-logs/12655-1789094438673666000.log`.  It was run with
`LAKE_BUILD_NO_REFRESH=1` to preserve a pre-existing foreign modification to
`docs/live-blueprint.md`, so this repair makes no refreshed spine or publication
claim.  It introduces no `sorry`, `admit`, custom axiom, native computation, or
external-evidence boundary.  A separate post-build `#print axioms` probe on the
named theorem reports exactly `propext`, `Classical.choice`, and `Quot.sound`.
