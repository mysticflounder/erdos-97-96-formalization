# Rigid221 S0 C3 source-row betweenness

**Date:** 2026-08-31

**Lane:** `rigid221-s0-c3-betweenness-20260831`

**Base:** `3d8902584d0b26baf91c7e0336a27de48644fb62`

**Status:** independently kernel-verified source consequence; downstream and
off-spine

## Result

The source-row-heavy blocker-`v` context determines more than blocker cap
membership.  The new theorem

```text
Problem97.ATailFrontierLiveClosure.
  exists_sourceRow_partner_with_blocker_index_strictly_between
```

in `Rigid221SourceRowCapBetweenness.lean` takes exactly the live context `P`,
the blocker identity, and `sourceRowInteriorCount = 2`.  It produces a point
`partner` with all of the following facts:

- `partner` is the unique point other than `source` in the source-shell support
  intersected with the physical `SelectedClass`;
- source and partner are both in the strict physical second-cap interior;
- `dist blocker source = dist blocker partner`; and
- in an indexed `CGN.StrictCapBlockData` presentation of that cap, the blocker
  index lies strictly between the source and partner indices, in one of the two
  possible endpoint orders.

This is a source-entitled theorem.  It assumes no fixed coordinates, cyclic
order cell, solver result, or neighboring-cap condition.

The same module also proves

```text
Problem97.ATailFrontierLiveClosure.
  exists_oppositeRow_partner_with_other_classification
```

from `P` alone.  It names the unique point other than `P.v.1` in the
opposite-row support/physical-class intersection and proves the exhaustive
classification

```text
P.other.1 = deleted ∨ P.other.1 = P.v.1 ∨ P.other.1 = oppositePartner.
```

In particular, equality `P.other.1 = P.v.1` is allowed by the current live
interface; only equality with the source is excluded there.

The exact-row boundary is now recorded by

```text
dist_sourceBlocker_other_ne_dist_sourceBlocker_source
dist_v_other_ne_dist_v_source_of_sourceBlocker_eq_v
```

The first theorem needs only `P`: because `other` is an ambient carrier point
outside the complete source shell, it cannot have the source-shell radius.
The second rewrites the actual blocker as `v` and concludes

```text
dist P.v.1 P.other.1 ≠ dist P.v.1 P.source.1.
```

Finally,

```text
blockerV_sourceRowHeavy_deletedInterior_or_otherEqV_or_oppositeRowHeavy
```

turns the opposite-row classification into the source-faithful trichotomy

```text
deleted ∈ secondCapInterior
  ∨ other = v
  ∨ (oppositeRowInteriorCount = 2 ∧ 6 ≤ secondCap.card).
```

The cardinality conclusion uses the supporting lemma
`secondCap_card_ge_six_of_both_rigid_rows_heavy`: two disjoint two-point rigid
traces in the strict cap contribute four points, while the closed cap adds its
two Moser endpoints.

The deleted-point branch has the same cardinality consequence: its two heavy
source-row points, `v`, and `deleted` are four distinct strict-cap points.  The
public corollary

```text
blockerV_sourceRowHeavy_otherEqV_or_secondCap_card_ge_six
```

therefore reduces the full classification to

```text
other = v ∨ 6 ≤ secondCap.card.
```

In particular, an exact five-point second cap forces `other = v`.
This final specialization is exposed as
`blockerV_sourceRowHeavy_other_eq_v_of_secondCap_card_eq_five`.
Using the live lower bound `5 ≤ secondCap.card`, the dispatcher

```text
blockerV_sourceRowHeavy_exactFiveOtherEqV_or_secondCap_card_ge_six
```

packages the exhaustive split

```text
(secondCap.card = 5 ∧ other = v) ∨ 6 ≤ secondCap.card.
```

## Proof decomposition

Let `K` be the source critical four-shell, `C` the physical selected class, and
`I = K.support ∩ C`.

1. `globalDeletion.rigid` gives `I.card = 2`.
2. `sourceRowInteriorCount = 2`, together with intersection containment, gives
   `I ∩ capInterior = I`.
3. `P.huSource`, `K.q_mem_support`, and `P.huClass` put the source in `I`.
   The second member is therefore a distinct partner, and the two-element
   equality proves its stated uniqueness.
4. `K.support_eq_radius`, rewritten through the blocker identity, gives equal
   blocker distances to source and partner.
5. The existing theorem
   `blockerV_sourceRowHeavy_v_mem_secondCapInterior` supplies blocker strict-cap
   membership.
6. `capByIndex_cgn4g_strictCapBlockData` assigns cap indices to all three
   points.  `centerAt_ne_source`, `center_not_mem_support`, and partner
   distinctness make those indices pairwise distinct.
7. `CGN.index_strictly_between_of_equidistant` gives strict betweenness in each
   of the two possible source/partner orders.

The bounded theorem-bank preflight found
`CGN.index_strictly_between_of_equidistant` as the exact terminal producer; no
existing declaration packages the live Rigid221 source-row extraction.

For the opposite-row classification, `globalDeletion.rigid` gives a
two-element opposite trace and the `2+2+1` physical-class cover.  The context's
`other_not_mem_source_row`, transported through `P.huSource`, eliminates the
source-row arm of that cover.  The two-point opposite trace leaves exactly the
blocker point or its unique partner, in addition to the distinguished deleted
point.

Exact-shell completeness also turns `other_not_mem_source_row` into a strict
distance inequality: membership in the ambient carrier plus equality with the
source radius would put `other` back in the source support.  If `other` is the
opposite-row partner, its inherited strict-cap membership and the already
proved strict-cap membership of `v` exhaust the two-point opposite trace.
Combining that trace with the disjoint heavy source trace forces the stated
six-point closed-cap lower bound.

## Source and custody boundary

`Rigid221Placement.lean` is pinned by existing Rigid221 custody source
manifests.  This lane therefore does not edit it.  The theorem is placed in a
new downstream module importing `Rigid221Placement`; existing frozen manifests
and their pinned digest for that file remain unchanged.  Any future bank or
on-spine consumer that imports the new module must be re-mined and refrozen in
the normal way.

The theorem is not a contradiction.  The current live packet has no cap/order
placement for `delta` or the two off-physical-class source-shell points, and no
independent cross-row metric or incidence relation that would force an
incompatible betweenness.

An earlier source trace proposed

```text
dist P.v.1 P.other.1 = dist P.v.1 P.source.1
```

as the first missing candidate.  This audit now corrects that claim: the exact
source shell proves the negation of this equality in every classification
case.  It is therefore not a valid target producer.  The remaining frontier
must instead supply a genuinely independent relation, such as a source-entitled
C3/order placement for `delta`, a reciprocal cross-row membership, or another
shell point whose equidistance does not assert that `other` lies on the source
row.

The sharpened structural frontier is now the dichotomy `other = v` versus a
closed second cap of cardinality at least six.  The field `P.hclassFive` is an
exact cardinality statement about the physical radius class, not about this
cap, so it does not eliminate the large-cap arm.  Closing the leaf therefore
requires either a genuine cap upper bound, a large-cap consumer valid for the
blocker-`v`/source-heavy interface, or an independent exclusion of `other = v`.

A bounded consumer audit found no existing adapter for the large-cap arm.
Despite their names, the current `secondOppositeLarge` source-heavy theorems in
`Rigid221SourceHeavy.lean` take
`ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket`, whose source
blocker is an opposite-row partner `xv` with `xv ≠ v`.  The live branch has the
literal equality `sourceBlocker = v`; constructing that packet would therefore
already be contradictory, not an interface conversion.  The large-cap arm
needs a new source-entitled packet/consumer specialized to the literal
blocker-`v` geometry.

An attempted coordinate model for local consistency passed the radius and cap
half-plane checks but failed convex position: two proposed shell points were
strict interior points and two claimed boundary edges crossed.  It therefore
does not establish consistency of the full convex packet.  No consistency or
impossibility claim is made here beyond the proved Lean theorem.

## Independent verification

An independent read-only verifier rebuilt the module with

```text
LAKE_BUILD_NO_REFRESH=1 lake-build \
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceRowCapBetweenness
```

The build completed successfully with 10861 jobs and no warning in the new
module.  The verifier independently checked the cardinality/uniqueness proof,
cap inclusions, distance rewrite, index distinctness, both orientations of the
CGN betweenness theorem, and the opposite-row cover classification.  It
confirmed that the latter takes only `P` and intentionally permits
`other = v`.

After the metric boundary and cap-cardinality dispatchers were added, the same
governed build completed again with 10861 jobs and no warning in the modified
module.  Separate read-only audits checked the exact-row distance inequality,
both four-point strict-cap cardinality arguments, all three classification
branches, the `other = v ∨ cap.card ≥ 6` reduction, and the exact-five/large-cap
dispatcher.  The proof index mined all ten declarations and 37 dependency
edges, with zero edges into axioms.  Its nonzero global report status remains
the repository's pre-existing duplicate-name diagnostics, not a finding about
this module.

Literal kernel inspection reports exactly

```text
propext, Classical.choice, Quot.sound
```

with no `sorryAx`, custom axiom, native/runtime reduction, external
implementation, or solver evidence for any of the ten public theorems.  All
ten are registered as deliberate off-spine compatibility or infrastructure
results.  The module is not yet imported by a consumer, so the publication
spine remains unchanged.
