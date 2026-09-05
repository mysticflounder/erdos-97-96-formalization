# cardGeThirteen source-route working checkpoint

Consult: `01M1KY4R7PK40KP3M985QX808W`

## Current verdict

Exact-card replay does not lift through a proper subcarrier: K4, cap/MEC, critical-shell, frontier, and minimality data are non-hereditary. A partial label map also cannot replay the full exact-card CNF because `k4_everywhere` and blocker-existence witnesses may leave the selected image.

The best genuinely general-cardinality route is instead a **bounded witness packet inside the unchanged ambient carrier**.

Let `c := S.oppApex2`, `X := firstRow.support`, `Y := secondRow.support`, and `U := X ∪ Y`. The target hypotheses prove `X.card=Y.card=4`, `Disjoint X Y`, hence `U.card=8`, with two distinct exact radii at `c`.

For every `q ∈ U`, retain its actual blocker `β(q) := H.blockerVertex q` and its full chosen critical shell `H.selectedAt q`. The union of `c`, the eight sources, their at most eight blocker centers, and the eight four-point shell supports has cardinality at most

`1 + 8 + 8 + 8*3 = 41`,

because each shell already contains its source. This is a labelled local witness, not a new `CounterexampleData`.

Source-entitled fields expected in the packet:

- two disjoint four-point `c`-rows of distinct positive radii;
- each source belongs to its chosen blocker row;
- each blocker differs from its source;
- `surface.secondApex_robust` plus `H.no_qfree_at` implies every blocker differs from `c`;
- sources with the same blocker lie in each other's selected shell; blocker fibers have cardinality at most four;
- distinct-center selected rows intersect in at most two points, and a shared pair yields the existing separated-pair boundary relation;
- one global `BoundaryIndexing D.A` from convex independence.

The proposed source theorem is an existence/packaging theorem, schematically:

```lean
theorem exists_twoRadiusEightSourceBlockerPacket
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : firstRow.radius ≠ secondRow.radius)
    (hdisjoint : Disjoint firstRow.support secondRow.support)
    ... :
    Nonempty (TwoRadiusEightSourceBlockerPacket D S H firstRow secondRow)
```

The first unresolved mathematical theorem is a local Euclidean/order terminal for this packet. It should be attacked by a bounded alias/order incidence census followed by exact Kalmanson/Farkas screening, while preserving the two distinguished same-center radii. Existing abstract cyclic row systems show that blocker nonfixedness, fiber bounds, pair-codegree, support connectivity, and boundary order alone are insufficient; the distinct-radius geometry and full selected-row equalities must remain in the packet.

## Cap-count branch check

The ordered-cap inequality alone does **not** bound all growth arms.

- `secondOpposite`: `surplus=5`, `opp1=4`, `opp2+6=n`. Applying `opp2+4 ≤ choose(6,2)` gives `n≤17`.
- `firstOpposite`: the family `(surplus,opp1,opp2)=(5,t,t)`, `n=2t+2`, satisfies the cap sum, lower bounds, and each ordered-cap inequality for arbitrarily large `t`.
- `surplus`: the family `(t,t,t)`, `n=3t-3`, satisfies the cap sum, lower bounds, and ordered-cap inequalities for arbitrarily large `t≥6`.

So cap counting is a useful exact-13--17 reduction only in the `secondOpposite` arm. Any claimed global `n≤32` bound needs an extra geometric antecedent and does not follow from the current arithmetic.

## Ranked direction

1. Prove/package the bounded eight-source blocker witness in the original carrier; run an exact source-faithful Kalmanson/curvature CEGAR on that fixed packet. This is the only current route that is uniform in `n` without a hereditary-K4 error.
2. Split and close the `secondOpposite` cap-growth arm separately using `n≤17` and exact finite certificates.
3. Use the mandatory first-apex/ingress rows as extra packet rows only if the eight-source packet has survivors; do not begin with a larger all-carrier solver encoding.
