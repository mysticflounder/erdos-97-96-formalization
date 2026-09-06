# Exact-five minimum admissible interior pair

## Scope

This lane repairs and extends the standalone minimum-distance source selector
in `MinimalAdmissibleInteriorPair.lean`, and adds a source case split that keeps
the selected minimum pair attached to its exact-five residual.  It does not
transfer the property across a later reselection and does not treat a radius
drop as a renewal argument.

## Reuse preflight

The indexed Lean corpus was searched for a minimum admissible interior-pair
producer and its consecutiveness and bisector consequences.  No existing
minimum producer was found.  The nearest reusable declarations were
`interior_pair_bisector_center_not_mem_surplusCap`,
`coincident_blocker_no_third_bisector_center`,
`ExactFiveInteriorCriticalPairFrontier.ofInteriorPair`, and
`FirstApexUniqueRadiusResidual.retainedPair_doubleDeletion_obstructsFirstApex`.

## Intended consumer

The committed predecessor minimized the distance from the second apex to the
first endpoint.  That score cannot support the required shortening argument.
The repaired producer minimizes the chord length `dist q w` itself.

With full deletion robustness at the second physical apex, chord minimality
rules out a selected-class point that is strictly closer to both endpoints.
The cap nonacute inequality then excludes a carrier bisector center from the
first selected class.  If the first closed cap has five points, every
strict-interior cap point lies in that class, so no second carrier bisector
center exists.

`false_of_actualFreshBlocker_doubleHit_of_minimalPair_capFive` is the first
physical consumer.  It requires an explicit equality between the minimum pair
and the residual's source pair, so the theorem cannot be misapplied after an
arbitrary adaptive reselection.

`firstApexUniqueRadius_exactFive_minimalResidualCases` now constructs the
minimum pair before the distinct/common obstruction-center split and returns a
wrapper carrying that source equality.  The full
`firstApexUniqueRadius_minimalResidualCases` preserves the exact-four arm and
uses these wrappers only on the source exact-five arms.  The common wrapper's
documentation explicitly forbids transferring its equality to a pair selected
later by the adaptive common-center branch.

`actualFreshBlocker_omits_source_of_capFive` consumes the distinct wrapper.  In
the cap-five case it refines the remaining physical branch to the statement
that the actual fresh row omits at least one endpoint of the minimum source
pair.

The same argument now handles the larger-cap alternative without a fixed
carrier size.  An exact-five first-apex class gives at least five points in the
first opposite cap.  If an actual fresh row contains both minimum-pair
endpoints, the cap-five contradiction upgrades that bound to six.  Second-apex
full deletion robustness gives five points in the second opposite cap, and the
three-cap partition with the surplus cap then yields `13 ≤ D.A.card`.
Consequently every such fresh row satisfies the source-faithful trichotomy:
carrier cardinality at least thirteen, first endpoint omitted, or second
endpoint omitted.

## Validation

Lean LSP diagnostics are clean for the repaired producer, the source residual
split, and the physical consumers.  The shared governed Lake build remains
deferred to its lock owner.

## Remaining physical frontier

The wrapper is not yet threaded through the live distinct coordinator.  More
importantly, the current strict physical packet does not prove that both source
endpoints occur in the actual fresh row.  Thus minimum-pair custody eliminates
the cap-five double-hit case but leaves one-hit and zero-hit omission cases.
The double-hit branch now has its advertised carrier-card lower bound and can
feed the exact-13 closure lanes once custody is threaded through the live
coordinator.  The endpoint-omission alternatives remain the mathematical
frontier.  The later adaptive common-center reselection must remain on the
ordinary residual type unless it performs a fresh minimization.
