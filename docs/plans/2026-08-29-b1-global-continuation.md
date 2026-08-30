# B1 equal-blocker continuation lane

Date: 2026-08-29

Target:
`Problem97.ATailFrontierLiveClosure.b1_globalGapOrClosedTerminal_of_counterexample`

Immediate consumer:
`Problem97.ATailFrontierLiveClosure.false_of_twoDeletionOutcome`

Publish root: `Problem97.erdos97_rhs`

## Authority and diagnosis

This lane follows revision 4 of
`docs/plans/2026-08-18-b-family-closure-plan.md` and §§16.5.I4–I12 of
`docs/erdos-97-descent-prose-proof-atomic.md`.

The old positive terminal is not supplied by the local B1 geometry.  Its first
two arms contradict the exact two-point carrier bisector, and its universal
overlap arm contradicts the source-clean small-overlap escape.

Git archaeology found no historical source closure.  Commit `95cac9ed`
introduced `b1_globalGapOrClosedTerminal_of_counterexample` with `sorry`; the
predecessor blocker-collision theorem was already open.  Reachable history,
reflogs, stashes, and the inspected dangling commits contain no non-`sorry`
body for either declaration.

A bounded project-index search at source revision `5413bd4f4` found no reusable
consumer for the exact five/six residual described below.

## Source-clean reduction

`EqualBlockerContinuation.lean` and `TwoDeletionCollision.lean` now formalize
the following producer and dispatch chain:

1. `B1PhysicalClassFiveSixNormalForm` retains the absence of a third distinct
   joint deletion, exact physical-class cardinality five or six, and equality
   of that class with the deleted pair union the two live-row slices.
2. `b1_third_actualBlocker_ne_common` proves that any third distinct joint
   deletion has an actual blocker distinct from the common blocker.
3. `b1_thirdJointDeletion_or_physicalClassFiveSixNormalForm` exhaustively
   produces either that third deletion or the retained five/six normal form.
4. `false_of_b1_distinctBlocker_jointDeletions` sends the third-deletion arm
   through the checked directed cross-omission and four-center split to the
   two existing B2/B3 terminal leaves.
5. `false_of_b1ThirdJointDeletionOrPhysicalClassFiveSixNormalForm` consumes the
   split, and `false_of_b1GlobalTransportContext` composes producer and
   consumer.
6. `b1_globalGapOrClosedTerminal_of_counterexample` is now a source-closed
   compatibility wrapper over that coordinator.

Only `false_of_b1PhysicalClassFiveSixNormalForm` is a new open declaration.

## Frontier measure

The refinement measure for the B1 component is

```text
(third-deletion status, physical-class cardinality ambiguity,
 live-row cover ambiguity, open B1 consumers).
```

At the old leaf the third-deletion status was unsplit, class cardinality was
only bounded below by five, and no exact cover was retained.  At the new leaf
there is no third distinct joint deletion, the class cardinality belongs to
`{5, 6}`, and the deleted-pair-plus-two-slices cover is an equality.  The number
of open B1 consumers remains one.  This is a strict decrease without claiming
that the global mathematical consumer has been proved.

## Remaining obligation

The honest global consumer is

```lean
theorem false_of_b1PhysicalClassFiveSixNormalForm
    (C : B1GlobalTransportContext ...)
    (hnormal : B1PhysicalClassFiveSixNormalForm C) : False
```

The forced finite patterns are exact.  At cardinality five the two live slices
have sizes `(1,2)`, `(2,1)`, or `(2,2)` with one shared mate in the last case.
At cardinality six they are disjoint two-point slices.  The sharp cap bound
places at least three or four class points, respectively, in the strict cap.

The bare cover is not a contradiction at the current equality and cyclic-order
interface.  In particular, the five-point shared-mate pattern satisfies every
available `SurplusCOMPGBank.btw_sep` conclusion.  The first missing order input
is a forced named nonalternating placement, or a complete six/seven-role order
matching an existing Kalmanson schema.  A valid proof must derive such an input
from the full counterexample context, or use a different global incidence or
well-founded blocker transition.

## Verification gates

```bash
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.EqualBlockerContinuation
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletionCollision
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletion.Coordinator
proof-blueprint refs --refresh
proof-blueprint spine
proof-blueprint axioms Problem97.erdos97_rhs
uv run python scripts/check_worktree_hygiene.py report --lane b1-global-continuation-20260829
```

All three targeted builds and the full 12,052-job repository build pass at
proof-blueprint build `e373ee042532`.
The producer reports only the three core axioms.  The old public target reports
`sorryAx` only through the new exact-five/six leaf, which is the sole B1 open
obligation shown by `proof-blueprint spine`.

The B1-only invocation of the registry's own `BlueprintBackend`, alias planner,
and factorization checker accepts the stable-ID migration and verifies the five
roles with zero violations.  The canonical all-project generator currently
refuses transactionally because of 83 pre-existing Rigid221 factorization
violations; it wrote none of its three generated files.  The independently
verified B1 registry and ID-assignment delta is therefore applied narrowly,
without modifying the unrelated Rigid221 entries.  Historical receipts remain
immutable.
