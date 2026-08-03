# n=17 generic fresh-third CEGAR model design

Date: 2026-08-02
Scope: design only; no Lean build, solver run, or production edit.

## Target and finite carrier

Use a 17-point carrier `V` with three named Moser apices and fourteen
non-apices.  For the `(6,8,6)` cyclic specialization, reserve the first
strict-cap interior for

```text
p1,p2, r1,r2, q1,q2
```

and use four anonymous interior points in each other cap.  Keep the cyclic
positions as variables (a permutation of `0..16`) subject only to the chosen
cap block order; within-block order remains free.  The `(6,8,6)` profile is a
finite ambient specialization, not a field of the Lean fresh-third packets.

## Variables

* `pos[v] : Int`, a permutation of `0..16` (ambient convex/Kalmanson layer).
* `d[v,w] : Real`, symmetric squared distances, with `d[v,v]=0`, positivity
  off the diagonal, and optional strict triangle/Kalmanson constraints.
* `E[c,x,y] : Bool` (or the definitional equality `d[c,x]=d[c,y]`) for
  equal-distance classes.  If Booleanized, impose symmetry/transitivity and
  the Euclidean incidence cuts as separate, labelled consequences.
* `m[c,p] : Bool`, selected-shell support.  Every selected critical row has
  cardinality four and is tied by an iff to one radius/equality class; do not
  use only lower-bound membership.
* `b[s,c] : Bool`, the critical blocker map: exactly one blocker `c != s` per
  source, with `m[c,s]`; add the post-deletion no-four-class condition for the
  selected blocker row.
* Cap membership `cap[i,p]` and strict-interior membership
  `capInterior[i,p]`, with the cyclic three-cap incidence and cap-cardinality
  sums.  Assert the indexed cap has card `>= 8`; for the concrete `(6,8,6)`
  lane its card is exactly eight and its interior is the six named points.
* Named collision/source aliases `p1,p2,r1,r2,q1,q2` and their carrier
  distinctness.  `p1,p2` and `r1,r2` are retained collision pairs; `q1,q2`
  are the fresh fiber pair.
* `C.firstSource`, `C.secondSource` (carrier indices), with a distinctness bit
  and one complete `CapSourceThirdCanonicalRowWitness` packet per source:
  strict-cap interior, freshness from all four collision endpoints, center
  inequalities against both retained blockers and both named apices, own-row
  support/cardinality, and two `CrossPairDeletionView` survival bits.
* `Q.source1`, `Q.source2` (the fresh fiber pair) and fields for
  `sources_ne`, blocker equality, blocker inequalities against both retained
  blockers, all eight endpoint inequalities, and mutual shell membership.
* For each `(source,Q)`, an interaction tag in
  `{sameBlocker, sourceRowOmission, distinctBlockersDifferentCaps,
  sameCapWithInternalFiberSource}`.  The tag guards the constructor-specific
  fields below.
* For each C source, `crossHit : Bool` abbreviating center inequality plus both
  `Q`-source memberships in that source row.  Add a normalized-residual tag in
  `{firstNonHit, secondNonHit, equalCrossRowCenters}`; the last tag requires
  both hits and equality of the two C-source centers.

## Constructor-guarded constraints

`sameBlocker` requires source-center equality with `Q.source1` and complete
selected-support equality.  `sourceRowOmission` names `deleted = Q.source1` or
`Q.source2`, requires that point not in the source row, and carries a positive
four-point class after deleting it.  The two distinct-center constructors both
require the two Q points in the source row and exact support overlap
`support(source) ∩ support(Q.source1) = {Q.source1,Q.source2}`.  They then differ
only in cap data: distinct indexed cap variables versus one shared cap and the
assertion that at least one Q point lies in that cap.

For the normalized packet, `firstNonHit`/`secondNonHit` must carry the positive
`sameBlocker` or `sourceRowOmission` data for the corresponding source; the
distinct-center tags are logically cross-row hits and cannot witness non-hit.
`equalCrossRowCenters` carries both hit packets plus the center equality.

## Constraints to remove from the current strong-arm base

The following must not be unconditional in the generic model:

1. `_complete_apex_class` for each of the p, r, and q pairs (exactly the named
   pair in the first-apex radius class, with all other first-cap points
   excluded).  The live interfaces expose named memberships/support facts, not
   complete first-apex classes.
2. `distinct_first_apex_radii` (all three p/r/q radius disequalities).  The
   live strong branch permits a common q radius and imposes no pairwise
   disequality against the retained radii.
3. The q-only `q_shell_exact_cap_intersection` and universal
   `all_four_endpoint_omissions` clauses, unless the optional
   `sameBlockerAllEndpointOmission` arm is selected.  Generic `FreshThirdBlockerFiber`
   does not include q's exact cap intersection or the strong arm's universal
   endpoint omission as primitive fields.
4. The p-shell `Q_first_shell_exact_cap_intersection` and the existential
   outside-source alias, unless explicitly modelling
   `FreshOutsideFirstBlockerFiber`; they are not generic Q fields.
5. The `five_center_deletion_arm_selector` and its five fixed center rows.  It
   is a downstream `FirstFiberCollisionFiveCenterDeletionResidual`, not part of
   `FreshThirdCapSourceInteraction` or `FreshThirdNormalizedResidualCase`.
6. Any `canonical_common_omission_witness` label.  It is provenance only; the
   live strong packet has universal endpoint omission, while the generic packet
   has no such witness field.

Retain the cap-card `>=8`, named source/blocker distinctness, exact support and
deletion semantics, and ambient metric constraints only as separately labelled
assumptions.  A SAT/UNSAT result for this finite model remains bounded external
evidence; it is not a proof of the arbitrary-carrier Lean terminal.
