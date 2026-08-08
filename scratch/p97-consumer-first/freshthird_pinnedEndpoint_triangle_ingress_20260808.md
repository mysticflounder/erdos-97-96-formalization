# FreshThird pinned-endpoint branch-1 triangle ingress (2026-08-08)

## Target and first missing datum

The live anchor is `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_freshThird_pinnedEndpoint_outsideSeedResidual`, in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:3365-3474`.  Its proof reaches

```lean
rcases exists_escaping_sourceFaithfulRow_of_endpoint_split DRow hterminal
  with ⟨Row, hrowEscape, hfan⟩                         -- 3465-3467
have hfanOutcome :=
  nonrobustCenter_or_exists_sameCap_blockerCollision_or_crossDeletionRow
    hcenterA Row hfan                                  -- 3468-3470
have hmutualOutcome :=
  nonrobustCenter_or_exists_mutualCrossDeletionRows_of_sourceFaithfulFan
    Row hfan                                            -- 3471-3473
sorry                                                   -- 3474
```

`hfan` is only a pointwise fan: for each `w ∈ Row.support` it supplies a cap, a blocker center, deletion blocking, and either equal-center/nonrobust or distinct-center/cardinality-≤2 (`SourceFaithfulSelectedFourDeletionFan`, `TriApexEndpointRetainedOmission.lean:988-1014`).  The row normalizations retain:

* `hfanOutcome` (`TwoSourceFreshThirdResidual.lean:3272-3308`): either nonrobust, or `z,w ∈ Row.support`, `z ≠ w`, common blocker cap, and (equal blocker centers) or a selected row `K` avoiding the opposite source.
* `hmutualOutcome` (`TwoSourceFreshThirdResidual.lean:3322-3355`): either nonrobust, or `z,w ∈ Row.support`, `z ≠ w`, each source absent from the other source's critical shell, selected rows `Kz/Kw` avoiding the opposite source, and distinct blocker centers.

Neither outcome supplies a *positive* two-incidence package for `Kz/Kw` (or even a canonical choice of `Row3/Row5` in every disjunct), nor any six ordered boundary indices for the support witnesses.  In particular the first unavailable datum is the universal producer

```text
one branch of hfanOutcome × hmutualOutcome
  ⟹ i0 < i1 < i2 < i3 < i4 < i5,
     Row3 : SelectedFourClass D.A (B.boundary i3),
     Row4 : SelectedFourClass D.A (B.boundary i4),
     Row5 : SelectedFourClass D.A (B.boundary i5),
     six positive support memberships in one triangle orientation.
```

The missing positive memberships are not recoverable from the available omission facts (`w ∉ Kz.support`, `z ∉ Kw.support`); those are negative incidences and point in the opposite direction.  The off-endpoint arm of `hterminal` also permits `Row` at an arbitrary `center`, so `Row` cannot be identified with a fixed source row.  Thus there is no source-level `Row3/Row4/Row5` mapping before this producer.

## Exact Kalmanson consumers

All four consumers are in `lean/Erdos9796Proof/P97/ATail/KalmansonThreeEqualitySchemas.lean` and require the same boundary infrastructure (`ConvexIndep carrier`, injective/image/CCW boundary, and `i0 < i1 < i2 < i3 < i4 < i5`):

* `false_of_center_first_two_k2_three_selected_rows_triangle` (`:1213-1252`): rows at `i0,i1,i2`; memberships `(i3,i5)` in `Row0`, `(i4,i5)` in `Row1`, `(i3,i4)` in `Row2`.
* `false_of_center_first_two_k2_three_selected_rows_triangle_reflected` (`:1255-1294`): rows at `i0,i1,i2`; memberships `(i4,i5)`, `(i3,i4)`, `(i3,i5)` respectively.
* `false_of_support_first_two_k2_three_selected_rows_triangle` (`:1297-1339`): rows at `i3,i4,i5`; memberships `(i0,i2)` in `Row3`, `(i1,i2)` in `Row4`, `(i0,i1)` in `Row5`.
* `false_of_support_first_two_k2_three_selected_rows_triangle_reflected` (`:1342-1384`): rows at `i3,i4,i5`; memberships `(i1,i2)`, `(i0,i1)`, `(i0,i2)` respectively.

The target's natural `Row4 = Row` idea would require two *positive* members of `Row.support` to become the two middle indices, but `hfan` gives only existential source points and `hrowEscape` gives one escaping point.  `Kz/Kw` from the outcome are rows at blocker centers, yet only opposite-source *non-membership* is exposed; no second positive member is exposed.  Consequently none of the four six-membership schemas is callable from the live hypotheses.

## What `B` does and does not provide

`BoundaryIndexing` is defined at `lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean:62-70`.  It supplies `boundary`, `indexOf`, `boundary_injective`, `boundary_image`, `boundary_ccw`, `index_injective`, and `point_eq : boundary (indexOf label) = label.1`.  The target adds `hnames` (`TwoSourceFreshThirdResidual.lean:3375-3380`) identifying `qOutside/qBetween` with the two `Q` source indices; `hrow`/`hrowAt` (`:3381-3441`) supply one of four five-index order arms and the endpoint row's cap split.  These facts are enough to transport named carrier points to `B.boundary (B.indexOf ...)` and to discharge the consumer's injective/image/CCW arguments.

They do **not** order `B.indexOf z`, `B.indexOf w`, `B.indexOf (H.centerAt z)`, or `B.indexOf (H.centerAt w)` relative to the five indices in `hrow`; no sixth strictly ordered index chain is present.  An adapter/producer must therefore choose the six indices, prove their strict order, and prove all six positive incidences before any reflected or center-first variant can be selected.

## Smallest new universal producer statement

Add a cardinality-independent producer over the non-nonrobust branches of `hfanOutcome` and `hmutualOutcome` that returns a finite disjunction of the four schemas above.  Each arm should return:

1. `i0 < i1 < i2 < i3 < i4 < i5 : Fin B.n`;
2. explicit `Row3/Row4/Row5` (or `Row0/Row1/Row2`) at the corresponding `B.boundary` indices;
3. the exact six positive support memberships for that orientation; and
4. equalities identifying every chosen index with `B.indexOf` of the hfan source/blocker/witness labels (using `B.point_eq`).

The existing `B.boundary_injective`, `B.boundary_image`, and `B.boundary_ccw` are the complete adapter needed by the Kalmanson consumers; the missing producer is the ordered six-index/positive-incidence lift, not another geometric consumer.

Status: source audit; no production Lean edited; branch-1 closure remains **unproved** until this producer is supplied.
