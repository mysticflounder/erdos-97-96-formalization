# Six-center ordered-boundary bridge audit

## Result

There is **no complete source-clean route in the live interfaces** from
`TwoSourceExactCollisionRowsTerminal` to an imported Kalmanson or six-point
Euclidean contradiction.  The boundary-enumeration side is already available;
the first missing bridge is a positive **named row-incidence/equality motif
producer**.

This is an interface/source audit, not a semantic impossibility theorem.  No
new Lean theorem was added, because the available packets do not state enough
positive incidence data to fill any imported consumer without a new
load-bearing lemma.

## Live producers audited

### `CapSourceThirdCanonicalRowSurface`

Exact declaration:

- `Problem97.ATailTwoCollisionGlobalProducer.CapSourceThirdCanonicalRowSurface`
  (`lean/Erdos9796Proof/P97/ATail/TwoCollisionGlobalProducer.lean:552`)
- checked producer:
  `Problem97.ATailTwoCollisionGlobalProducer.exists_capSource_thirdCanonicalRow_omits_each_collisionPair`

The surface gives a source in the first cap interior, freshness from the four
collision sources, separation of its center from the two collision blockers
and two opposite apices, an exact four selected support, and two
`CrossPairDeletionView`s.  The deletion views convert to omission of at least
one endpoint of each collision pair.  Thus the packet supplies negative or
disjunctive support information, not the three named support hits needed by a
six-point row consumer.

`#print axioms` of the producer reports only `propext`,
`Classical.choice`, and `Quot.sound`.

### `GeometricMultiplicityResidual`

Exact declaration:

- `Problem97.ATailBlockerMultiplicityGeometry.GeometricMultiplicityResidual`
  (`lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean:339`)
- checked producer:
  `Problem97.ATailBlockerMultiplicityGeometry.collisionCrossHit_or_geometricMultiplicity`

The residual is the disjunction of `FreshThirdBlockerFiber`,
`FreshOutsideFirstBlockerFiber`, and `FreshOutsideSecondBlockerFiber`.  These
branches give a repeated blocker/mutual pair or an enlarged known blocker
fiber, but no branch packages the required cyclic placement together with two
or three selected rows whose supports hit the other named centers in one of
the imported patterns.

`#print axioms` of the producer reports only the three core axioms above.

### Tri-apex residual `T`

Exact type:

- `Problem97.ATailFrontierLiveClosure.FrontierAllLargeCapsTriApexRobustResidual`
  (`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:6574`)

Its fields are rich-class structures at `oppApex1`, `oppApex2`, and
`surplusApex`, the non-robust-center cardinal bound, and the fact that no one
selected class contains all three apices.  These fields yield deletion
robustness and center separations used by the six-center producer, but they do
not choose boundary indices or assert pairwise support membership among the
six named centers.

### `SixCenterDeletionSurvivalPacket`

Exact declarations:

- `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.SixCenterDeletionSurvivalPacket`
  (`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9029`)
- `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.sixCenterDeletionSurvivalPacket_of_oneSided`
  (`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9042`)

The packet says that, after one deletion, each of six pairwise-distinct named
centers has *some* four equidistant carrier points.  It does not say that any
of those four-point supports contains another one of the six named centers.
That distinction is decisive: independent K4 existence at six centers cannot
instantiate a prescribed cross-center row motif.

The producer is source-clean: `#print axioms` reports only `propext`,
`Classical.choice`, and `Quot.sound`.  A repository-wide declaration search
finds no consumer of `SixCenterDeletionSurvivalPacket`; its only occurrences
are the abbreviation and this producer.  In particular,
`false_of_twoCapSources_oneSidedDeletionSurvival` currently returns to the open
`false_of_capSourceThirdCanonicalRowSurface` terminal instead of consuming the
packet.

## Imported consumers and their unmet hypotheses

All of the following checked consumers report only the three core axioms.

1. `Problem97.SixPointEuclideanObstruction.false_of_six_ccw_three_selected_rows`
   (`SixPointEuclideanObstruction.lean:843`) needs six strictly ordered CCW
   boundary vertices and selected rows centered at positions `0`, `2`, `3`
   with hits `{1,3,5}`, `{1,3,4}`, and `{0,1}`, respectively.  Equivalently,
   its metric kernel uses
   `d01=d05`, `d03=d05`, `d30=d31`, `d21=d24`, and `d23=d24`.

2. `Problem97.SixPointSparseEuclideanObstruction.false_of_six_ccw_two_selected_rows`
   (`SixPointSparseEuclideanObstruction.lean:436`) needs rows centered at
   positions `0` and `2` with hits `{1,3,5}` and `{1,3,4}`.  Its equalities are
   `d01=d03=d05` and `d21=d23=d24`.

3. `Problem97.CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_013_412_523`
   (`KalmansonThreeEqualitySchemas.lean:32`) needs
   `d01=d03`, `d41=d42`, and `d52=d53` in one six-vertex CCW order.
   The sibling schemas `..._012_325_415`,
   `false_of_five_ccw_three_shell_equalities_012_124_314`, and
   `..._013_235_415` likewise require three specifically placed shell
   equalities.  A representative five-point schema was also axiom-audited and
   is source-clean.

None of the audited live packets supplies one of these exact hit/equality
patterns, nor a finite classification proving that an arbitrary cyclic
sorting of its named centers lands in one of them.

## Boundary-order side is not the first gap

`Problem97.exists_isCcwConvexPolygon_of_convexIndep`
(`lean/Erdos9796Proof/P97/ConvexCyclicOrder/Construct.lean:1935`) provides an
injective complete CCW enumeration from convex independence and
non-collinearity, and its axiom report is core-only.  Existing cap-order lemmas
can place cap-interior points between appropriate triangle endpoints once
their global indices are chosen.  Consequently, constructing a boundary and
sorting six distinct named centers is routine compared with the missing row
data; sorting alone cannot create the necessary equalities.

## First missing bridge

The next useful result must be a positive producer, not a conditional
contradiction wrapper.  A suitable **PARKED-SPEC** shape is:

```lean
-- PARKED-SPEC: statement shape only, not promoted to a Lean obligation.
theorem exists_banked_ordered_row_motif_of_live_six_center_data
    (hcap : CapSourceThirdCanonicalRowSurface P Pρ)
    (hresidual : GeometricMultiplicityResidual P Pρ)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hsix : SixCenterDeletionSurvivalPacket ... ) :
    SixPointSparseSelectedRowMotif D.A ∨
      SixPointThreeSelectedRowMotif D.A ∨
      KalmansonThreeEqualityMotif D.A := by
  ...
```

The motif type must expose, in one common CCW enumeration:

- the exact five/six distinct carrier vertices and their strict index order;
- the selected rows (or direct distance equalities); and
- every named cross-row support membership required by the chosen checked
  consumer.

The genuinely first mathematical sublemma is therefore a **support-placement
classification**: show that the selected supports furnished by the cap,
collision, multiplicity, and deletion-survival data contain enough of the
other named centers to realize one banked motif.  If that classification is
false under the current packets, the live packet must first be strengthened
with the missing positive hit data.  A theorem that only constructs the CCW
enumeration would leave the proof frontier unchanged.

## Terminal status

- `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSourceThirdCanonicalRowSurface`
  remains the open load-bearing terminal; its axiom report contains
  `sorryAx` (besides the core axioms).
- The producer packets and imported geometric consumers audited above are
  source-clean.
- No complete bridge skeleton is supplied because the first missing theorem
  is substantive row-incidence mathematics, not Lean plumbing.

