# P97 ATAIL global-bridge search (2026-07-31)

## Scope

Inspected `FrontierLiveClosure.lean` and the imported ATAIL producer/geometry
modules around `TwoSourceExactCollisionRowsTerminal`.  The requested bridge
was a source-clean theorem of the form

```
CapSourceThirdCanonicalRowSurface P Pρ ∧ GeometricMultiplicityResidual P Pρ → False
CrossBlockerCoincidence P Pρ ∧ GeometricMultiplicityResidual P Pρ → False
```

while retaining the live exact-four, tri-apex `T`, no-M44/minimality,
deletion-robustness, and mutual-omission hypotheses.

## Live terminal leaves (not closed)

* `FrontierLiveClosure.lean:7452-7456`,
  `TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`
  takes `hcoincidence : CrossBlockerCoincidence P Pρ` and
  `hresidual : GeometricMultiplicityResidual P Pρ`, with the surrounding
  section carrying `hρne`, two exact-four rows/equations, tri-apex `T`,
  disjoint source pairs, distinct blockers, and the two opposite localized
  mutual-omission cycles.  Body is `sorry`.
* `FrontierLiveClosure.lean:7491-7495`,
  `TwoSourceExactCollisionRowsTerminal.false_of_capSourceThirdCanonicalRowSurface`
  takes `hcapSource : CapSourceThirdCanonicalRowSurface P Pρ` and the same
  residual and ambient hypotheses.  Body is `sorry`.

The comments explicitly say these are the load-bearing global exclusions: the
four cross-blocker equality arms and the three residual arms still need a proof
using retained minimality/no-M44/tri-apex/two-cycle data.

## What the imported producers actually establish

* `TwoCollisionGlobalProducer.lean:480-492` defines
  `CrossBlockerCoincidence` as the four displayed center/source equalities.
* `TwoCollisionGlobalProducer.lean:552-577` defines
  `CapSourceThirdCanonicalRowSurface`: cap cardinality at least eight,
  an interior source outside both collision pairs, center inequalities,
  selected four-shell support/cardinality four, and two cross-pair deletion
  views.
* `TwoCollisionGlobalProducer.lean:614-636` (`TwoCollisionGlobalSplit` and
  `exists_capSource_thirdCanonicalRow_omits_each_collisionPair`) is a
  source-clean producer of the cap-source-or-four-equalities split.  It does
  not prove `False`.
* `BlockerMultiplicityGeometry.lean:339-356` defines
  `GeometricMultiplicityResidual` as nonemptiness of one of three fresh or
  outside blocker fibers.  `:356-383`,
  `collisionCrossHit_or_geometricMultiplicity`, only normalizes a finite
  blocker-multiplicity disjunction to `CollisionCrossHit ∨ residual`; it has
  no tri-apex/minimality/no-M44 input and is not a contradiction theorem.

## Circular coordinator path

`FrontierLiveClosure.lean:11210+`,
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`,
constructs the global cap split and the residual, then dispatches the residual
branch directly to the two `TwoSourceExactCollisionRowsTerminal` leaves
(`:11345-11373`).  Thus this producer is circular with respect to either
requested bridge.  Its cap-cross normal-form sister
`exists_three_hit_of_two_collisionRows_capCross_normalForm` (`:11391+`) is
downstream of the same call and is not an independent closure route.

The compatibility wrappers immediately below the cap-source leaf
(`false_of_capSource_*`, around `:7578+` and later adapters) simply package a
fresh-third/fresh-outside residual arm and call the leaf.  They add no global
proof.  `false_of_twoCapSources_mutualCrossMembership_distinctBlockers`
(`:9007-9023`) is source-clean but only handles a stronger common-radius
mutual-cross-membership witness and equal blocker centers; it does not consume
either requested packet.

## Six-center packet

`FrontierLiveClosure.lean:9029-9034` defines
`SixCenterDeletionSurvivalPacket` (five-center survival, a surviving exact-four
row after one deletion, and six distinct centers).  The source-clean producer
`sixCenterDeletionSurvivalPacket_of_oneSided` (`:9042-9057`) consumes two
`FirstFiberCapSourceWitness` values plus one-sided deletion survival and uses
the three apex-rich fields of `T` to build the packet.  A search found no
source-clean theorem consuming this packet to derive `False`; it is only a
certificate/producer.  The first missing bridge would be from this six-center
survival data to ordered six-point boundary indices and exact row equalities.

## Imported geometric endpoints (potential only)

The imported Kalmanson/six-point files are source-clean contradiction
consumers, but require explicit ordered-boundary data and exact equalities not
present in either packet:

* `CapCrossingKalmanson.lean:341,380,427,462,493,523` (five/four-point CCW
  endpoint and selected-row equality contradictions).
* `KalmansonThreeEqualitySchemas.lean:32,68,110,143` (five/six-point CCW
  shell-equality schemas).
* `SixPointEuclideanObstruction.lean:513,769,843` and
  `SixPointSparseEuclideanObstruction.lean:398,436` (six-point CCW row and
  orientation incompatibilities).

None accepts `P`, `Pρ`, `T`, `CrossBlockerCoincidence`,
`CapSourceThirdCanonicalRowSurface`, or `GeometricMultiplicityResidual`
directly.  No imported producer was found that extracts the required ordered
boundary/equality hypotheses from those objects.

## Verdict

No non-circular source-clean global lemma currently connects either requested
packet plus `GeometricMultiplicityResidual` to `False`.  The only direct
consumers are the two active `sorry` leaves at `:7452` and `:7491`; all
cap-source adapters and the three-hit coordinator call them.  The outer
all-low-hit/tri-apex route is also not an alternative bridge: its checked
wrappers eventually depend on the separate load-bearing
`false_of_retainedInteriorDirectedOmission_and_all_low_hits` obligation.

The concrete next proof obligation is therefore a genuinely new global
producer/consumer bridge (likely extracting a six-point CCW/equality or a
minimality/no-M44 contradiction) before any imported Kalmanson or six-point
endpoint can discharge either leaf.
