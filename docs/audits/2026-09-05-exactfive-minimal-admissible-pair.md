# Exact-five minimum admissible interior pair

## Scope

This lane repairs and extends the standalone minimum-distance source selector
in `MinimalAdmissibleInteriorPair.lean`.  It does not yet replace the ordinary
exact-five residual producer, does not transfer the property across a later
reselection, and does not treat a radius drop as a renewal argument.

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

## Validation

Lean LSP diagnostics are clean for the repaired producer and the physical
consumer.  The shared governed Lake build remains deferred to its lock owner.

## Remaining source bridge

The next step is to make the original exact-five case split retain the minimum
wrapper, while leaving the later adaptive common-center reselection on the
ordinary residual type unless it performs a fresh minimization.
