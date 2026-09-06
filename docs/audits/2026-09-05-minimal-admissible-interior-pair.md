# Minimal admissible exact-five interior pair

The new module
`lean/Erdos9796Proof/P97/ATail/MinimalAdmissibleInteriorPair.lean`
packages the existing exact-five interior-pair producer with a finite
minimization step.  Its public result,
`nonempty_minimalAdmissibleInteriorPair`, returns the same
`ExactFiveInteriorCriticalPairFrontier` data together with the fact that its
first endpoint has minimal distance to `S.oppApex2` among all admissible
ordered interior pairs.

This is intentionally a producer, not a closure claim.  It supplies the
minimum needed by later consecutive-in-class and bisector-exclusion lemmas
without changing the existing residual type or its consumers.

Validation is pending the shared governed Lake build currently owned by the
exact-thirteen lane; no lockfile bypass was used.
