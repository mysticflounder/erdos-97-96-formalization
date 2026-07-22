# Exact-five card-thirteen same-radius dispatcher

Status: **source-clean direct dispatcher, kernel checked**.

`ExactFiveCard13SameRadiusDispatcher.lean` proves

```lean
false_of_exactFive_card13_sameRadius_of_allOneOrbitClosers
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hsame : first.doubleRadius = radius)
    (closers : CanonicalAllOneCard13OrbitClosers Q profile) :
    False
```

The dispatcher obtains `ExactFiveGlobalCoverStarOutcome Q profile` and:

- sends `spoke₁TwoHit` to
  `false_of_exactFive_card13_sameRadius_spoke₁`;
- sends `spoke₂TwoHit` to
  `false_of_exactFive_card13_sameRadius_spoke₂`; and
- turns `allRowsOneHit` into
  `CanonicalAllOneCard13SourceIngress Q profile star hall`, then dispatches
  its exact `left`, `middle`, or `right` orbit payload to the corresponding
  persisted source-orbit certificate closure.

`CanonicalAllOneCard13OrbitClosers Q profile` contains exactly three fields:

```lean
left   : CanonicalAlignedCoverFamilies T 1 2 3 → False
middle : CanonicalAlignedCoverFamilies T 2 1 3 → False
right  : CanonicalAlignedCoverFamilies T 3 1 2 → False
```

Each field is polymorphic over the source-faithful card-thirteen frame,
global-cover star, one-hit proof, first-apex packet, and semantic row table.
No row, blocker map, or boundary role is reselected by the dispatcher.

The concrete definition

```lean
canonicalAllOneCard13OrbitClosers Q profile
```

instantiates those fields with:

```lean
false_of_leftAllOneSourceOrbit
false_of_middleAllOneSourceOrbit
false_of_rightAllOneSourceOrbit
```

This yields two direct terminals:

```lean
false_of_exactFive_card13_allRowsOneHit
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile)
    (hcard : D.A.card = 13) :
    False

false_of_exactFive_card13_sameRadius
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hsame : first.doubleRadius = radius) :
    False
```

The second theorem closes the complete exact-five, exact-card-thirteen,
same-first-apex-radius branch: the all-one outcome uses the three persisted
orbit certificates and the two asymmetric outcomes use the existing spoke
terminals.

Validation used Lean 4.27 with warnings as errors against freshly rebuilt
artifacts for the direct pass-five verifier/ingress/coordinator, all 342
all-one source chunks, and all three final source-orbit closures. The axiom
closure of all three dispatcher theorems printed above is exactly:

```text
[propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound]
```

There is no `sorryAx`.
