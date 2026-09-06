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

The double-hit child also supplies a new source-owned row.  Every selected
four-class centered in the carrier omits a supporting-triangle vertex, while
the small double-hit circle omits all three supporting vertices.  Choosing a
vertex omitted by the retained blocker row therefore gives a source whose
canonical blocker differs from both physical apices, the retained blocker,
and the fresh blocker.  This is a fourth-center witness, not yet a terminal
contradiction.

For a one-hit row, `CriticalShellSystem.overrideAt` can install the fresh
blocker as the retained endpoint's canonical blocker.  The omitted endpoint's
blocker and every other blocker stay fixed.  The same ordered pair, chord
minimum, radius, and second-apex simultaneous-deletion witness can then be
rebuilt as a distinct-center exact-five residual over the new shell system.
Both endpoint orientations are represented in
`ExactFiveOneHitShellReselection.lean`.  This transition has no decreasing
measure: a separate no-return argument is still required, and the zero-hit
case cannot use this override.

## Validation

Lean LSP diagnostics are clean for the repaired producer, the source residual
split, the cap/cardinality physical consumers, and the supporting-triangle
source construction.  They are also clean for both one-hit reselection
orientations and their packaged transition witnesses.  A focused
`lake env lean` check of `Rigid221Closure.lean` exits successfully with only
the file's pre-existing sorry and style warnings.

## Remaining physical frontier

The live root now invokes `firstApexUniqueRadius_minimalResidualCases`, so the
minimum-pair producer is no longer dead code.  Its current branch consumers
project `.residual` immediately: this is sound, and is required on the common
adaptive branch, but the direct distinct coordinator still needs a
minimum-aware specialization before its physical endpoint can use the new
four-case transition theorem.

The current strict physical packet does not prove that both source endpoints
occur in the actual fresh row.  Minimum-pair custody therefore eliminates the
cap-five double-hit case but leaves one-hit and zero-hit omission cases.  The
double-hit branch now has its carrier-card lower bound and a fourth-center
supporting-triangle source.  Both one-hit orientations rebuild the same
minimum pair over an explicitly related shell system, but they do not decrease
the chord or radius.  A separate audit confirms that convexity plus their one
shared row point cannot exclude a two-step return; a sound no-return bridge
needs a second shared row point, a common outside pair, or explicit cap-order
or signed-area data.  The zero-hit alternative remains open.  The later
adaptive common-center reselection must remain on the ordinary residual type
unless it performs a fresh minimization.
