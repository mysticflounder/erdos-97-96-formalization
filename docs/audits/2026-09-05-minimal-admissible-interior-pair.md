# Minimal admissible exact-five interior pair

The new module
`lean/Erdos9796Proof/P97/ATail/MinimalAdmissibleInteriorPair.lean`
packages the existing exact-five interior-pair producer with a finite
minimization step.  Its public result,
`nonempty_minimalAdmissibleInteriorPair`, returns the same
`ExactFiveInteriorCriticalPairFrontier` data together with the fact that its
endpoint distance `dist q w` is minimal among all admissible ordered interior
pairs.  An earlier version minimized the first endpoint's distance to
`S.oppApex2`; that score was corrected because it cannot support the required
shorter-subchord contradiction.

This remains a producer, not a global closure claim.  The same module now
proves the metric consecutiveness result, selected-class bisector exclusion,
and uniqueness of the carrier bisector in the first-cap-cardinality-five
branch.  The physical radius-drop module consumes the final result for an
actual fresh-row double hit, conditional on an explicit equality identifying
the residual source pair with this minimum pair.

Lean LSP diagnostics are clean for both the producer and its physical
consumer.  Validation by the shared governed Lake build remains pending its
current lock owner; no lockfile bypass was used.

The minimum property is not attached to the ordinary residual type.  In
particular, the adaptive common-center reselection does not inherit it without
a fresh minimization proof.
