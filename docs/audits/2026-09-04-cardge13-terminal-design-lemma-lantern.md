# CardGeThirteen terminal design audit

Status: PROVEN source audit / CONJECTURED future adapter

Lane: `cardge13-terminal-design-lemma-lantern-20260904`

Base source head: `0832ec5611b6b8b96f3d7a939a9657f148e310fe`

Scope: read-only design audit requested in conversation message #10612.  No
production Lean source or build artifacts were changed.

## Target leaf and current hypotheses

The open leaf is
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`
at `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean:1251`.
Its complete public input is:

```text
R : OriginalUniqueFourResidual F
_hcard : 12 < D.A.card
surface : ExactFourPostCardElevenRobustSurface R
rho otherRadius : ℝ
firstRow secondRow : SelectedFourClass D.A S.oppApex2
_hradii : otherRadius ≠ rho
_hnoFive : ∀ r, 0 < r → (SelectedClass D.A S.oppApex2 r).card < 5
_hfirstRadius : firstRow.radius = rho
_hsecondRadius : secondRow.radius = otherRadius
_hdisjoint : Disjoint firstRow.support secondRow.support
```

The body is still `by sorry`; the wrapper immediately below dispatches to this
leaf in the `12 < D.A.card` branch.  The checked normal-form producer at
`ExactFourRobustCapExpansion.lean:1098` additionally exposes positivity,
exact cardinality four for both radius classes, and two strict-second-cap
members for each class, but the wrapper discards the latter two cap bounds.

## Reuse preflight

The one bounded current-corpus search for each concrete candidate was run at
the indexed source revision `0832ec561`.

1. `Problem97.Census554.GeneralCarrierBridge.false_of_three_selected_rows_singleton_intersections_increasing`
   was found in
   `ATail/ThreeSelectedRowsSingletonIntersectionAdapter.lean:27`.
2. `Problem97.CapCrossingKalmansonBridge.false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_adjacent_cyclicShift`
   and its decreasing companion were found in
   `ATail/KalmansonThreeRowCycleSchemas.lean:185` and `:225`.
   The same file also has left and right inner/outer variants at `:265` and
   `:345`.

No search result supplies the missing source-to-boundary incidence adapter.

## What the common-deletion packet actually supplies

`GoodMutualOmissionDeletionOutcome.commonFrontierDeletion`,
`ATail/FrontierLiveClosure/GoodMutualOmissionDeletionOutcome.lean:70`, stores:

* a common omitted frontier point `d`, with `d = F.pair.q ∨ d = F.pair.w`;
* omission of `d` from the two actual blocker rows and from a selected row at
  `S.oppApex2`; and
* `ThreeCenterCommonDeletionExactRows` at the two distinct actual blocker
  centers and `S.oppApex2`.

The network proves the first two centers are distinct and that the selected
rows are source-valid.  The three-row structure at
`ATail/ThreeCenterCommonDeletion.lean:51` retains carrier membership,
pairwise center distinctness, and `U5QDeletedK4Class` rows.  Its rows only have
`4 ≤ support.card`, common positive radius, and support in the deleted
skeleton.  It does not record exact support intersections, a boundary order,
or any cross-row membership.

The actual selected rows can still be recovered from the network definitions:
`goodMutualOmissionSRow N`, `goodMutualOmissionTRow N`, and the explicit
`secondApexRow` are `SelectedFourClass` values.  The `threeCenter` projection
alone is weaker because it forgets the selected-row card-equality packaging.

## Candidate A: singleton-intersection adapter

The source-clean theorem at
`ATail/ThreeSelectedRowsSingletonIntersectionAdapter.lean:27` requires a
`BoundaryIndexing A`, five strict index inequalities

```text
a < b < c < d < e < f
```

and three exact four-classes centered at `a`, `d`, and `e`, together with

```text
RowA.support ∩ RowD.support = {pointOf c}
RowA.support ∩ RowE.support = {pointOf b}
RowD.support ∩ RowE.support = {pointOf f}.
```

It derives the six required distance equalities and calls the generic
six-point Kalmanson bridge.  Thus it can consume a future packet only if that
packet exports all three singleton equalities and the five-order witness.
The present packet's three overlap bounds (`≤ 2`) are insufficient: they do
not give nonempty intersections, singleton cardinality, or the locations of
the intersection points.

## Candidate B: weakest currently reusable metric consumer

The adjacent/adjacent increasing consumer at
`ATail/KalmansonThreeRowCycleSchemas.lean:185` requires a cyclic boundary
window and only six positive membership facts:

```text
a < b < c < d < e < f
ARow : SelectedFourClass carrier (boundary (a + cut))
DRow : SelectedFourClass carrier (boundary (d + cut))
ERow : SelectedFourClass carrier (boundary (e + cut))
b ∈ ARow.support   c ∈ ARow.support
c ∈ DRow.support   f ∈ DRow.support
b ∈ ERow.support   f ∈ ERow.support.
```

The theorem has a decreasing-index companion, and left/right inner-outer
cycles if the six memberships have one of those two alternate patterns.  It
also requires an injective, image-covering, CCW boundary
`Fin carrier.card → ℝ²`.  A `BoundaryIndexing` has an arbitrary `n`, so a
wrapper must first transport its enumeration to `Fin D.A.card`; the singleton
adapter already contains this cardinality transport.

For the common-frontier rows, a Lean-ready source-faithful refinement should
therefore export one of the following, with the row centers instantiated by
the two actual blockers and `S.oppApex2`:

```text
cut : Fin D.A.card
a b c d e f : Fin D.A.card
hab : a < b   hbc : b < c   hcd : c < d
hde : d < e   hef : e < f
ARow DRow ERow : SelectedFourClass D.A (boundary (a + cut)), ...
hbA hcA hcD hfD hbE hfE : the six memberships above
```

plus the boundary injectivity, image, and CCW facts.  The corresponding
decreasing packet reverses all five inequalities.  This is the weakest
source-faithful metric input among the two searched candidates: exact
singleton intersections are not needed.

The two alternate increasing patterns are:

```text
left:  ARow hits {b,c}; ERow hits {b,d}; FRow hits {c,d}
right: ARow hits {b,d}; ERow hits {b,c}; FRow hits {c,d}.
```

Each needs the same five-order witness and its named six memberships.  A
packet should expose a tagged disjunction of these three patterns if the
geometric classifier does not choose one pattern canonically.

## Selected-row identification at the physical second apex

The existing two-radius data does identify the two named rows as the full
radius classes, by a short finite-cardinality argument:

```text
firstRow.support = SelectedClass D.A S.oppApex2 rho
secondRow.support = SelectedClass D.A S.oppApex2 otherRadius.
```

For the first equality, support membership gives inclusion into the selected
class using `support_subset_A` and `support_eq_radius`; `support_card = 4`
and `_hnoFive rho` give the reverse inclusion by equal finite cardinalities.
The second equality is identical.  This explains precisely what `_hnoFive`
does provide.

It does **not** identify the `secondApexRow` stored by the common-deletion
outcome with either named row.  That row is an arbitrary positive-radius
`SelectedFourClass D.A S.oppApex2` omitting `d`.  `_hnoFive` permits any number
of distinct four-point radius classes, so a third radius class is not excluded.
The common packet needs one of these additional source-faithful hypotheses:

```text
secondApexRow.radius = rho ∨ secondApexRow.radius = otherRadius
```

or the stronger global two-radius classification

```text
∀ r, 0 < r → (SelectedClass D.A S.oppApex2 r).card = 4 →
  r = rho ∨ r = otherRadius.
```

Alternatively it may carry direct support equality to `firstRow` or
`secondRow`.  Distinct radii and disjoint supports alone do not supply this
identification.

## Exact insufficiency of the current route

Even after adding the forthcoming finite-fiber result (two good sources with
distinct actual blockers and a common omitted `q` or `w`), the route has only:

* three distinct centers;
* three source-valid common-deletion rows;
* four-or-more support points per deleted row;
* the own-source memberships and cross-source nonmemberships already present
  in `GoodMutualOmissionTwoDeletionNetwork`; and
* one arbitrary physical-second-apex row.

It has no theorem forcing any of the six cross-row memberships required by
Candidate B, and no theorem forcing the three singleton intersections required
by Candidate A.  Pairwise overlap `≤ 2` cannot be sharpened to the needed
incidence without a new geometric argument.  In particular, the two named
second-apex rows are not a substitute for the two actual-blocker rows: the
current hypotheses do not connect their supports or radii.

Therefore no `False` consumer is derivable from the current target signature
plus the forthcoming distinct-blocker/common-deletion packet alone.  The first
genuinely missing geometric antecedent is a source-faithful six-point cyclic
incidence/order packet of Candidate B type (or the strictly stronger exact
singleton-intersection packet of Candidate A), together with the physical
second-apex row identification if the proof intends to use `firstRow` and
`secondRow`.

## Addendum #10650: preserve the two-radius branch

The private helper at
`ExactFourRobustCapExpansion.lean:1224`,
`exists_goodOutsideSource_of_twoDistinctRadii`, proves the useful finite-fiber
fact: from the two positive radius classes and distinct radii it obtains a
`chosenRadius` and a good source in that class whose actual blocker is not
`S.oppApex2`.  Its result type existentially quantifies `chosenRadius` without
retaining `chosenRadius = rho ∨ chosenRadius = otherRadius`.  The proof body
case-splits on exactly those two classes, but the public theorem at `:1326`
forgets that case split as well.

Thus the first typed adapter is a target-specific exported refinement with a
retained disjunction, for example:

```text
∃ source,
  (source.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
   source ∈ goodOutsideSources R ∧
   (lateFirstApexSystem R).centerAt source.1 source.2 ≠ S.oppApex2) ∨
  (source.1 ∈ SelectedClass D.A S.oppApex2 otherRadius ∧
   source ∈ goodOutsideSources R ∧
   (lateFirstApexSystem R).centerAt source.1 source.2 ≠ S.oppApex2).
```

The wrapper must either refactor the private helper to return this stronger
type or duplicate its finite-fiber proof; a wrapper around the current public
existential cannot recover the lost radius branch.  The two `4 ≤` hypotheses
needed by the helper are source-derived from `firstRow` and `secondRow` by
support inclusion into their respective `SelectedClass` values and
`support_card = 4`.  The no-five hypothesis then upgrades each class to exact
cardinality four and gives support equality for the two named rows.

One anchored source with this retained disjunction plus the new seven-source
common-deletion pair is still not sufficient for `False`.  The anchored source
is not guaranteed to be one of the pair's two sources, and its actual blocker
is not identified with either pair blocker.  Even if it is one of them, the
available own-source memberships and cross-source nonmemberships provide fewer
than the six cross-row memberships required by Candidate B.  The packet also
does not identify its physical-second-apex row with `firstRow` or `secondRow`.

The next required typed object must therefore combine the anchored branch with
the pair, recording at least: source identity or a proved relation between the
anchored source and one pair source; the actual blocker/row-center identities;
the selected second-apex row identity; a six-label cyclic order (with an
orientation tag); and one of Candidate B's three six-membership patterns (or
Candidate A's three exact singleton intersections).  Without this combined
packet, the exported branch disjunction is necessary bookkeeping but does not
close the terminal.

## Recommended import direction

Keep the future adapter below `Rigid221Closure`: a new source-neutral module
may import `GoodMutualOmissionDeletionOutcome`,
`Census554.GeneralCarrierBridge`, and
`ATail.KalmansonThreeRowCycleSchemas`, but must not import
`FrontierLiveClosure.Rigid221Closure` or call its sorry-backed leaf.  The
eventual production consumer can import that source-neutral adapter from the
leaf's owning module once the new incidence/order packet is proved.

No current theorem supplies the missing packet, and no source edit is
recommended until its exact fields are fixed.
