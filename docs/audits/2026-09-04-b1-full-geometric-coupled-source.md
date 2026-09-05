# B1 full-geometric coupled-source audit

Date: 2026-09-04  
Lane: `luna-swarm-radial-otter-b1-full-geometric-coupled-source-20260904`  
Assignment: nthdegree #11813, follow-up #11837

## Result

The source-clean residual is now formalized in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1FullGeometricCoupledSource.lean`.
The theorem `nonempty_b1FullGeometricCoupledSourceResidual` retains the full
producer data before the historical source-context projection:

* `D.convex` (`ConvexIndep D.A`), the robust exact-four surface, and the
  `B1EscapeRowProvenanceStar` boundary/cap-block witness;
* a strict second-cap source outside the first-apex fiber with the surviving
  `q`- or `w`-deletion witness;
* an omitted strict-cap peer and its distinct actual blocker;
* the mutually omitted `u,v` pair, all source/row membership and omission
  facts, and a checked `u/v` joint deletion;
* the actual late-row cardinality bounds, the explicit identity split, and the
  exact-five `second same-u/v joint deletion ∨ rigid 2+2` split.

The module has no `sorry`, `axiom`, native/external evidence, or open-leaf
imports.  A direct Lean check passed.  `#print axioms` on the producer reports
only `[propext, Classical.choice, Quot.sound]`.

## Branch analysis retained from #11837

Write `row x` for the actual late selected support at `x`.
`exists_mutuallyOmittedSecondClassPair` in
`ExactFourRobustCapExpansion.lean:935` supplies

`v ∉ row u`, `u ∉ row v`, `source ∈ row u`, `v ∉ row source`, and
`u = source ∨ u ∉ row source`.

The separate omitted-peer producer at `ExactFourRobustCapExpansion.lean:831`
supplies `other ≠ source`, `other ∉ row source`, class/interior membership,
and a distinct source/other blocker.  The residual records the following
exhaustive cases instead of erasing these identities.

| branch | retained row facts |
| --- | --- |
| `u = source` and `other ∉ row v` | `other ∉ row u` and `other ∉ row v`; this is a directed cross-row omission. |
| `u = source` and `other ∈ row v` | `row v` contains its own `v` and `other`, while `source=u ∉ row v`; the row bound is retained, so this is not silently discarded. |
| `u ≠ source`, `other = u` | `u=other ∉ row source`, `v ∉ row u`, and `other=u ∉ row v`. |
| `u ≠ source`, `other = v` | `v=other ∉ row source`, `v ∉ row u`, and `u ∉ row v`; no false claim that `v ∉ row v` is made. |
| `u ≠ source`, `other ≠ u`, `other ≠ v` | `u,v,other ∉ row source`, together with `v ∉ row u` and `u ∉ row v`. |

For every row the residual also retains
`(row x ∩ SelectedClass).card ≤ 2`, from
`actualLateRow_secondClass_card_le_two`.  At exact class cardinality five,
`exactFourMutualOmissionJointDeletion_exactFive_strongSplit` in
`JointDeletion/ExactFiveSplit.lean:151` is retained as a dependent field:
either a second joint deletion with the same `u,v`, or the disjoint `2+2`
partition of the four non-deleted class points.  Thus the `row v` case in the
`u=source` arm and all `other=u/v/distinct` cases remain available to a later
directed-omission consumer.

## What is still missing

The explicit residual label
`B1FullGeometricFirstMissingPremise C` is definitionally the weakest
consumer antecedent, `B1WinningLiveSliceSameBoundaryArc C`, defined at
`B1WinningLiveSliceIngress.lean:249`.  The stronger symmetric
`B1LiveSlicesSameBoundaryArc C` (`B1LiveSharedPairNonalternationIngress.lean:149`)
would imply it after the five/six normal form, but is not the first missing
premise.

The current checked boundary theorem
`B1EscapeRowProvenanceStar.secondCapInterior_boundaryOrderConvex`
(`B1WinningSliceOrderOutcome.lean:45`) and
`liveRowBlocker_btw_of_two_points` (`...:615`) give cap convexity and linear
between-ness of the row blocker.  They do not put both live endpoints on one
side of the cyclic cut from the apex to that blocker.  The same-arc premise is
exactly what the downstream source-clean contradiction consumes through
`false_of_b1WinningLiveSliceSameBoundaryArc` in
`B1WinningLiveSliceIngress.lean` (around line 292), which then feeds the
normal-form wrapper at `B1LiveSharedPairNonalternationIngress.lean:173`.

Therefore this lane yields the requested source-rich residual, not a false
global contradiction: the first genuinely unproved geometric premise after
the branch/exact-five split is the weakest winning-live-slice same-boundary-arc
cut-side statement.  No terminal consumer/leaf theorem from `Rigid221Closure`
or `Coordinator` is imported; the transitive dependency cone does include the
foundational `UniqueFourLateChoiceTerminal` definitions used by the physical
consumer.

## Verification note

`lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1FullGeometricCoupledSource`
built the target successfully (10871 jobs).  The wrapper's best-effort
proof-blueprint resynchronization then reported an unrelated stale private
declaration from `B1CardSixRoleProjectionIngress` absent from its imported
environment; it did not invalidate the successful target build.
