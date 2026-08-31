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

## Source and custody boundary

`Rigid221Placement.lean` is pinned by existing Rigid221 custody source
manifests.  This lane therefore does not edit it.  The theorem is placed in a
new downstream module importing `Rigid221Placement`; existing frozen manifests
and their pinned digest for that file remain unchanged.  Any future bank or
on-spine consumer that imports the new module must be re-mined and refrozen in
the normal way.

The theorem is not a contradiction.  The current live packet has no cap/order
placement for `delta` or the two off-physical-class source-shell points, and no
second row-distance equality that would force an incompatible betweenness.
The first concrete missing candidate recorded by the source trace is

```text
dist P.v.1 P.other.1 = dist P.v.1 P.source.1
```

or an equivalent second `v`-centered constraint.  A separate candidate would
be a source-entitled C3/order placement for `delta` or another shell point.

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
cap inclusions, distance rewrite, index distinctness, and both orientations of
the CGN betweenness theorem.

Literal kernel inspection reports exactly

```text
propext, Classical.choice, Quot.sound
```

with no `sorryAx`, custom axiom, native/runtime reduction, external
implementation, or solver evidence.  The module is not yet imported by a
consumer, so the publication spine remains unchanged.
