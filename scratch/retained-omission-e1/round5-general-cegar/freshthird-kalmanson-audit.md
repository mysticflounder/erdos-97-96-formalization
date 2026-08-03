# FreshThird cyclic/Kalmanson audit (2026-08-02)

## Live fields checked

`FrontierLiveClosure.lean:7913-7940` gives
`CapSourceThirdCanonicalRowWitness`: each cap-source is in the indexed cap,
outside both collision pairs, has a blocker center distinct from the two named
blockers/apices, and its complete critical shell has cardinality four with both
cross-pair deletion views.  `BlockerMultiplicityGeometry.lean:70-105` gives
`FreshThirdBlockerFiber`: two distinct fresh sources, one common blocker, and
mutual shell membership.  The interaction split is at
`FrontierLiveClosure.lean:9061-9118`; the normalized residual is
`firstNonHit | secondNonHit | equalCrossRowCenters`
(`:9201-9215`).

## Recommended bounded metric consumer

Use only the `equalCrossRowCenters` arm after
`freshThirdEqualCenterExactFourRow_of_hits` (`FrontierLiveClosure.lean:9269-9377`).
Let `c` be the common blocker center of `C.firstSource/C.secondSource` and `q`
the blocker center of `Q.source₁`; let `u = Q.source₁.1`, `v = Q.source₂.1`.
The exact row at `c` contains `{C.firstSource.1,C.secondSource.1,u,v}`;
the `Q.source₁` row contains `u,v` by `q_mem_support` and
`source₂_mem_source₁_shell`.  Add a *conditional* order witness:

```lean
def FreshThirdKalmansonOrder (C Q) : Prop :=
  ConvexCyclicOrder D.A c q u v
```

(`ConvexCyclicOrder` is the existential CCW boundary order in
`P97/ConvexCyclicOrder/Basic.lean:48-58`; unpack it to obtain the `Fin` indices.)
Together with `E.capCenter_ne_freshCenter`, `u ≠ v`, and center-not-in-support,
the order gives `c < q < u < v` on one CCW enumeration.  Convert both critical
rows with `.toCriticalFourShell.toSelectedFourClass` and invoke
`CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`
(`P97/ATail/CapCrossingKalmanson.lean:427-455`) on the shared late pair `u,v`.
This is a four-point Kalmanson consumer and does not add any exact-apex,
pairwise-radius, q-shell-intersection, or five-center-deletion assumptions.

For the n=17 external probe, the analogous optional cut belongs beside the
residual encoding at `n17_freshthird_incidence_probe.py:275-281`: introduce a
permutation/order variable only for `(c,q,u,v)` and forbid the guarded pattern
`equal_centers ∧ cross_hit[q1] ∧ cross_hit[q2] ∧ c<q<u<v` when both rows contain
`u,v`.  This mirrors the existing generic cut at
`same-blocker-common-omission-euclidean-v3/incidence_cegar.py:518-533` and
the full separator at `:535-574`, but should remain an opt-in refinement (not
base SAT).

## Soundness limits / pitfalls

* `ConvexCyclicOrder D.A c q u v` is **not** supplied by the FreshThird
  packets.  It must be proved or carried as a separate adapter; cap membership
  alone does not establish this order.  The Kalmanson theorem is compatible
  only with the two orientations having the centers consecutive before the
  shared pair (`c,q,u,v` or `q,c,v,u`); an interleaving cyclic order is a real
  non-hit for this consumer, not something to relabel away.
* `H.centerAt` is a point of `D.A` only through
  `H.blockerVertex`; the adapter must use those subtype values as `c,q`.
  Do not equate source vertices with their blocker centers.
* The `firstNonHit`/`secondNonHit` arms have no shared pair in the source row;
  this Kalmanson cut does not touch them.  The existing
  `false_of_two_freshThirdCrossRowHits_distinctCenters` already eliminates two
  distinct cross-row hits by the perpendicular-bisector cardinal bound, so the
  proposed cut is specifically for the equal-center both-hit residual.
* External Z3 order/equality cuts are diagnostic only.  They do not establish
  a Lean/KQF geometric theorem or universal-n closure.
