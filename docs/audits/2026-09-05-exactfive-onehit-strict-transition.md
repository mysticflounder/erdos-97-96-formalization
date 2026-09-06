# Exact-five one-hit strict-transition audit

Date: 2026-09-05

## Scope

This checkpoint refines the one-hit shell reselection from commit
`777c0ba74`.  That construction can reinstall the blocker already selected at
the retained endpoint, so the bare reselection witness is not by itself a
progress step.

## Reuse preflight

The project-indexed Lean corpus was searched once for the concrete candidate
“a source point lies in another source's selected support, hence their actual
blocker centers differ.”  The index snapshot was source revision `3b06e75ee`.
No theorem establishes that claim, and it is not valid without another
hypothesis.  The closest reusable declarations are
`selectedSupports_eq_of_actualBlockers_eq`,
`blocker_centers_ne_of_not_mem_other_selected_support`, and the shared-blocker
case analysis in `TriApexEndpointRetainedOmission.lean`.

The immediate intended consumer is a future post-override no-return theorem.
The first missing antecedent remains either a contextual source-exhaustion
bound for the old blocker fiber or enough distinct old-fiber sources to exceed
`actualBlockerFiber_card_le_four`.  Calling the same physical eliminator after
reselection would be circular because no chord, radius, or finite-state rank
has decreased.

## Formal refinement

`StrictQOmittedWHitReselection` and `StrictWOmittedQHitReselection` extend the
two existing orientation packages with the assertion that the installed fresh
blocker differs from the retained endpoint's previous blocker.

The two new split theorems expose exhaustive alternatives:

- the fresh blocker is the retained endpoint's old blocker; or
- the corresponding strict reselection package is nonempty.

The shared-blocker branch is intentionally retained as a separate obligation.
The strict branch supplies exactly the inequality required to state a
nontrivial no-return condition, but does not claim such a condition.

## Negative controls

Existing fiber bounds do not close the strict branch.  The current hypotheses
force only the retained endpoint into its old blocker fiber; a hypothetical
return source supplies a second element, while the available upper bound is
four.  Separately, convexity and one common row point impose no radius or
crossing order between consecutive rows.  A sound closure must use additional
global critical-shell, source-exhaustion, cap-order, signed-area, or second
shared-point data.

## Validation

A bounded luna-swarm source review passed: both endpoint orientations and all
four declaration docstrings are correct, and no progress or no-return claim is
overstated.  The governed coordinator retry captured the final frozen source
before starting and rebuilt
`ExactFiveOneHitShellReselection.olean` successfully: the source timestamp is
2026-09-05 19:51:56 -0700 and the resulting `.olean` timestamp is
2026-09-05 20:11:09 -0700.  That broader build later failed in a downstream
`Rigid221Closure.lean` coordinator call, not in this module; this checkpoint
therefore claims module-level Lean validation, not a successful aggregate
Rigid build.
