# FreshThird metric/order consumer search (2026-08-03)

## Scope

Searched the live P97 Lean tree and the indexed Lean corpus for a source-clean
metric, cyclic-order, or Kalmanson theorem that consumes the normalized
`FreshThird` residual, in particular the noncanonical `sameCapWithInternalFiberSource`
arm (one of `Q.source₁,Q.source₂` in the common cap) and the
`equalCrossRowCenters` arm.

## Live residual packet

`FrontierLiveClosure.lean` defines
`FreshThirdNormalizedResidualCase` with `firstNonHit`, `secondNonHit`, and
`equalCrossRowCenters` (two `FreshThirdCrossRowHit`s plus equality of the two
source-row centers).  The unresolved normalized consumer
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` is still
`by sorry`.  The noncanonical interaction packet records either
`distinctBlockersDifferentCaps` or `sameCapWithInternalFiberSource`; the latter
records an exact two-point shell overlap and only
`Q.source₁ ∈ S.capByIndex capIndex ∨ Q.source₂ ∈ S.capByIndex capIndex`, with
`capIndex ≠ S.oppIndex1`.

The existing equal-center terminal
`false_of_freshThirdEqualCenter_sameCapOppIndex` takes both cross-row hits,
center equality, both source-support memberships, common-center cap
membership, one fiber-source cap membership, and
`capIndex = S.oppIndex1`.  It is an incidence/cardinality terminal for the
canonical opposite cap; it does not cover the noncanonical branch.

## Candidate metric/order consumers

### `TwoCenterBisectorParity.lean`

The four terminals

```text
false_of_two_centers_equidistant_pair_after
false_of_two_centers_equidistant_pair_enclosed
false_of_two_centers_equidistant_pair_split
false_of_two_centers_equidistant_pair_before
```

all require `hA : ConvexIndep A`, an injective boundary
`phi : Fin A.card → ℝ²`, `Finset.univ.image phi = A`, a CCW convex polygon,
one of four strict index orders for the chord endpoints and two centers, and
two equal-distance equations from those centers to the same chord.  They
conclude `False` by a strict Kalmanson inequality.  FreshThird has neither a
boundary indexing/order packet nor a theorem converting its shell equalities
to these endpoint/center roles.  `FreshThirdOrderPartition.freshThird_pair_order_partition`
is only an `omega` partition and assumes a region hypothesis; it does not
derive that hypothesis and does not cover one-inside/one-outside.

### `CapSelectedRowCounting.outsidePair_unique_capCenter`

```text
outsidePair_unique_capCenter
  (hconv : ConvexIndep A) (Hord : CGN.StrictCapOrder A L)
  (hmem : ∀ t, L.points t ∈ A) (hrs : r < s)
  (haA : a ∈ A) (hbA : b ∈ A)
  (haOutside : a ∉ univ.image L.points)
  (hbOutside : b ∉ univ.image L.points)
  (hab : a ≠ b)
  (hra : dist (L.points r) a = dist (L.points r) b)
  (hsa : dist (L.points s) a = dist (L.points s) b) : False
```

This is the closest cap-local metric consumer, but it explicitly requires
*both* support points outside the ordered cap image.  The FreshThird
noncanonical packet supplies only one-inside/one-outside as a disjunction, so
the existing adapter cannot be promoted.

The source-valid scratch/legacy variant
`ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair`
has the same obstruction: two distinct cap centers, two distinct carrier
points, and both `haOff`/`hbOff` outside the same `S.capByIndex k` are required.

### `OrdinalKalmansonCycle.lean`

`SelectedRowOrdinalComparison` has two constructors, each requiring a full
four-index strict order, a `SelectedFourClass` row, two support memberships,
and named distance equalities.  `value_lt` turns each step into a strict
comparison; `value_lt_of_transGen`, `false_of_transGen_cycle`, and
`false_of_two_cycle` consume a directed cycle.  FreshThird supplies no
`ConvexIndep` boundary indexing, four-index cyclic order, or named ordinal
edge/equality, so no direct consumer is available.

### `RetainedCollisionDifferentPairConsumer.lean`

`OrderedDifferentPairCrossHit` and its alternate order are the nearest
complete Kalmanson packets.  They require a `RetainedRadiusCollision`, a
first-apex row point, `J_mem_A`, `K_mem_J_shell`, and a six-role boundary with
injective/image/CCW data and explicit order (`O < J < C < A < X < K`, or
`O < C < J < X < A < K`).  Their `.false` theorem combines three row/fiber
equalities with two complementary Kalmanson inequalities.  This module is
marked compatibility-only/banked and the required first-apex radius and
six-role incidence do not occur in FreshThird.

### Endpoint/five-role Kalmanson banks

`EndpointFreshFiveRoleKalmanson` has order-specific equal-center consumers,
but only after explicit five/six-role placement.  The closure audit records
that strict five-point Kalmanson eliminates only a proper subset of dihedral
orders (four of twelve remain feasible from equalities alone), so it cannot be
treated as a global FreshThird contradiction.

## Exact missing bridge

No source-clean `False` consumer matching the normalized FreshThird
noncanonical/equal-center packet was found.  A promoting theorem would have to
provide, at minimum:

1. a full convex-boundary index/injectivity/image/CCW packet and a strict order
   placing both centers and both blocker sources;
2. a producer translating the two shell/row radius equalities into the
   corresponding chord-equidistance or selected-row Kalmanson equalities;
3. cap-order data that classifies the two sources relative to one common cap;
4. for the one-inside/one-outside arm, a new theorem converting that mixed
   incidence into a strict Kalmanson cut/order (or a stronger incidence packet,
   e.g. common selected-class radius plus reciprocal row membership).

The existing outside-pair theorem cannot be weakened from both-outside to the
mixed case, and the existing finite order partition cannot supply the missing
geometric region/order hypothesis.  Thus the first missing bridge is a
one-inside/one-outside incidence-to-order/metric producer (or an independent
same-cap incidence contradiction), not another consumer wrapper.

