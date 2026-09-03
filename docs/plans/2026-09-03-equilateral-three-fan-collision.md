# Equilateral three-fan collision formalization

Date: 2026-09-03

Status: standalone Lean formalization kernel-checked.

## Target

Formalize the profile-1697 source-cell cancellation independently of its
conditional aliases. In normalized coordinates `B=(0,0)` and `O=(1,0)`, six
distance equalities force

```text
A=(1/2,r), S=(1/2,-r), Q=(3/2,r), 4*r^2-3=0, r>0.
```

The strict order signs select the displayed branches without dividing by
`r`. They then force `signedArea2 S O Q = 0`; a strict positive sign for that
triple is contradictory.

## Reuse preflight

The completed-wave candidate was searched once in the indexed Lean corpus.
`Problem97.Census554.false_of_sixPointHingeTailCore` was the nearest result,
but an exhaustive field match showed that its nine-edge metric pattern does
not fit the four source rows, even after granting the profile aliases. The
coordinate and orientation helpers in `EquilateralHingeCollisions.lean` and
`EquilateralApexOrientation.lean` remain reusable.

## Consumer boundary

The intended downstream location is the exact-grid subcase below
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`. The live
`HardSourceSwapExactGridRoles` packet does not currently expose the two source
memberships represented by profile aliases `p=s` and `c2=q`. Therefore the
standalone lemma is useful and source-independent, but importing it cannot yet
remove the broad admitted endpoint. No direct target wiring or closure claim is
authorized until those antecedents are proved.

## Lean result

`EquilateralThreeFanCollision.lean` now provides normalized and transported
forms of the area-zero conclusion, together with direct contradiction
corollaries when the final strict orientation is present. A focused
`lake env lean` check passes. The declarations use only the standard axioms
already present in their imported Euclidean geometry dependencies.
