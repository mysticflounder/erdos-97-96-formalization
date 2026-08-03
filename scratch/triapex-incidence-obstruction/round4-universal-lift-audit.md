# Round-4 universal-lift audit for the retained E1 core

## Result

The exact 15-point order census isolates a genuinely reusable geometric
consumer, but it does **not** yet supply the universal producer required by
`false_of_retainedOmission_triApexAllLarge_core`.

The minimum two-pattern cover is one instance of the following cap hinge.
Fix an indexed cap `i`, write `l = leftAdjacentIndex i` and
`r = rightAdjacentIndex i`, and let

* `x,y` lie in `capInteriorByIndex i`;
* `u,v` lie in `capInteriorByIndex l`;
* `w` lie in `capInteriorByIndex r`; and
* `e = oppositeVertexByIndex r`, the Moser endpoint between caps `i` and `l`.

Assume there are ambient full selected rows centered at `x`, `u`, and `y`
such that

```text
row(x) contains v,w
row(u) contains v,w,e
row(y) contains v,e.
```

Then the configuration is impossible.  In the literal shadow the assignment
is

```text
i = 0, x = 2, y = 1, u = 6, v = 7, w = 11, e = 14.
```

## Source-clean consumer shape

It is useful first to wrap the already checked Kalmanson theorem in an
enumeration-free occurrence predicate:

```lean
def SharedLatePairOccurrence (A : Finset ℝ²) : Prop :=
  ∃ a b c d,
    ConvexCyclicOrder A a b c d ∧
    ∃ ARow : SelectedFourClass A a,
    ∃ BRow : SelectedFourClass A b,
      c ∈ ARow.support ∧ d ∈ ARow.support ∧
      c ∈ BRow.support ∧ d ∈ BRow.support
```

Unpacking `ConvexCyclicOrder` feeds
`CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`
directly.  This wrapper is source-clean and contains no new mathematics.

The cap hinge above implies `SharedLatePairOccurrence`.  The only order case
split is the order of `u` and `v` inside cap `l`:

1. If `u` precedes `v`, the four points occur cyclically as `x,u,v,w`.
   Rows at `x` and `u` share the late pair `{v,w}`.
2. If `v` precedes `u`, the four points occur cyclically as `u,y,e,v` after
   changing the boundary cut.  Rows at `u` and `y` share the late pair
   `{e,v}`.

The required source interfaces already exist:

* `ConvexCyclicOrder` and cyclic-shift transport in
  `P97/ConvexCyclicOrder/Basic.lean`;
* the four strict cap-interior index exporters in
  `SurplusM44Packet/Shard02.lean`;
* `false_of_two_selected_rows_shared_late_pair` in
  `ATail/CapCrossingKalmanson.lean`; and
* `(H.selectedAt q hq).toSelectedFourClass` for a canonical full shell.

The last point is load-bearing: `CommonDeletionTwoCenterPacket.B₁/B₂` are
chosen four-subsets in a deleted carrier and cannot be substituted for the
ambient `SelectedFourClass` rows required by the Kalmanson consumer.

## Exact missing producer dichotomy

The narrowest useful next bridge is constructor-specific.  Schematically,
the paired arm should produce

```lean
Nonempty (AdjacentCapHingeOccurrence D S H) ∨
  CanonicalShellTwoDistinctRichCapsHit D S H G
```

and the reverse-hit arm should produce

```lean
Nonempty (AdjacentCapHingeOccurrence D S H) ∨
  ReverseShellOtherCapRichDoubleHit D S H G O
```

where the two right-hand predicates are exactly the hit-count statements in
`retained-core-producer-audit.md`.  Every disjunct has an existing checked
consumer:

* the hinge goes through the shared-late-pair Kalmanson theorem;
* the generic two-cap hit localizes the same blocker into two disjoint strict
  caps; and
* in the reverse arm the constructor already puts the reverse blocker in the
  first strict cap, so one other-cap rich double hit suffices.

This is a real narrowing of the mathematical search: no new terminal metric
lemma is needed after either producer is obtained.

## Why this is not yet a lift of the exact-15 census

The literal survivor supplies the three named full rows above, so exhaustive
cap-order enumeration proves that survivor impossible.  `Q` and `G`, however,
do not name those rows or force their incidences.  At general cardinality:

* `cap_card_ge_six` is only a lower bound, so rich slices need not exhaust a
  cap interior;
* `ApexRichClassStructure` supplies a six-class or two four-classes but no
  partition of the remaining cap points;
* the weak nonrobust-cover cardinal inequality carries no row incidence; and
* common-deletion rows are not ambient full-shell rows.

Consequently the cap hinge and the two cap-hit alternatives are still
**CONJECTURED producers**, not consequences currently derivable from the Lean
interfaces.  Promoting either as an additional `sorry` would only rename the
E1 core unless accompanied by a checked covering argument.  The safe landing
available now is the general cap-hinge consumer; the proof-closing work remains
the constructor-specific producer dichotomy above.
