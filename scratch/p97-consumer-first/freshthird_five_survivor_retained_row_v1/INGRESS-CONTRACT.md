# Ingress and landing contract

## Live source ingress

The finite abstraction is intended to represent either deletion arm in
`FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual`:

```lean
FiveSurvivorExactRowsBoundary D H Q.source.1 Q.source.2
  (H.centerAt source.1 source.2)
  (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
  S.oppApex1 S.oppApex2 S.surplusApex
```

or the identical boundary with `Q.otherOutsidePoint` and its membership proof.
The retained-row cut is the source declaration
`fiveSurvivor_firstApexRow_eq_retained_and_deleted_not_mem` in
`TwoSourceClosure.lean`.  Its antecedents are the aligned
`FirstCapMultiPointRadiiRetained` surface and a
`FiveSurvivorExactRowsBoundary` with exact four-point rows.

The encoding retains only the following source-entitled row consequences:

* five exact four-point q-deleted rows, without representing their centers or
  any equality/distinctness relations among those centers;
* omission of the deleted point from every q-deleted row;
* the two retained classes have exact cardinality four, contain their
  corresponding source pair, are disjoint, and omit the cap-source pair;
* the selected first-apex row is one of those two retained classes;
* the aligned mutual shell row is the exact four-point row consisting of the
  two first-cap endpoints and the two outside points;
* the two selected source rows contain the mutual cap-source pair and omit
  the collision endpoint pairs.

The fixed integer `center0` through `center4` role labels in the generator are
not a center model and are not connected to row equalities.  Their syntactic
distinctness must not be read as a Lean consequence.  In particular, the live
boundary intentionally leaves pairwise distinctness of the five centers
unbundled.  No unproved geometric, order, or coverage assertion is encoded.

## Consumer status

The historical campaign named
`false_of_capSource_firstFiber_outsidePairDeletionExactRows` in
`TwoSourceFirstFiberCollision.lean`, followed by
`false_of_capSource_firstFiber_collisionFiveCenterDeletion`, as its intended
production consumer.  That route is not available from the live
distinct-blocker deletion branch: the terminal requires a common first-apex
radius or equal-blocker data that the branch does not supply.  The next
consumer must instead accept the five-row boundary with its permitted center
aliases and no common-radius/equal-blocker premise.

For a production landing, a finite certificate would need a source theorem
extracting this exact representation from the universal packet, an exact
replay theorem, and a general-cardinality lift.  None is present here.  The
current wave therefore cannot close either live `sorry`; it can only expose a
new finite cut or confirm that the retained-row cut alone leaves survivors.

## Scope

The run uses `N = 17` abstract carrier points, as a diagnostic exact-17
instance.  It has no transport to arbitrary `D.A.card`, no Euclidean
realizability theorem, and no cyclic-order/Kalmanson constraint.  Results are
SAT/UNSAT checks of this finite abstraction only.
