# Cap-crossing / strict-Kalmanson bridge audit

Date: 2026-07-16

Scope: geometric bridge and source-interface audit. The bridge and direct
selected-row consumer have now been promoted to production Lean; no source
`sorry` is claimed closed.

## Result

The geometric part of the proposed route is **PROVEN** in
`lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean`:

1. four increasing vertices in a strictly convex CCW boundary enumeration
   have intersecting open diagonals;
2. both strict Kalmanson inequalities follow:

   ```text
   d(b,c) + d(a,d) < d(a,c) + d(b,d)
   d(a,b) + d(c,d) < d(a,c) + d(b,d);
   ```

3. the expected ordinal equal-distance corollaries follow; and
4. there is an immediate five-index contradiction consumer. On the boundary
   order `O < A < Y < E < C`, the three row equalities

   ```text
   d(Y,O) = d(Y,E)
   d(O,E) = d(O,C)
   d(A,C) = d(A,O)
   ```

   are inconsistent. The `O,A,Y,E` inequality gives `OA < AE`, while the
   `O,A,E,C` inequality gives `AE < AO`.

The last item is kernel-checked as
`false_of_five_ccw_three_shell_equalities`. It is a genuine consumer for any
bank pattern that supplies exactly those five ordered labels and three shell
equalities.

The generic cap-to-order bookkeeping is now checked in the sibling
`kalmanson-parent-order-adapter/`: two distinct strict first-opposite-cap
points yield one shared boundary and the two honest internal-order arms. The
fixed named terminal packet is still **NOT PRODUCED** by the live parent,
which lacks the finite `E/Y` placements, directed arm, and three selected-row
incidence pairs.

## Existing-bank preflight

Before proving the bridge, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries were also run for strict convex
quadrilateral crossing, Kalmanson inequalities, cyclic-order distance
comparisons, and four-point Radon/diagonal intersection.

No current theorem with the strict Kalmanson statement or a normalized
equivalent was found. The legacy archive does contain the
`N9FourPointRadon` / `N9FourPointChordCrossingScratch` reserve described in the
registry, but the current source already exposes a shorter source-clean route:

- `signedArea2_opposite_sign_openSegment_line_inter`;
- `convexHull_line_inter_eq_segment_of_extreme_pair`;
- `not_collinear_of_convexIndep_triple`;
- `hneg_of_ccw`;
- `mem_segment_iff_wbtw` and `Wbtw.dist_add_dist`; and
- `dist_lt_dist_add_dist_iff`.

The scratch proof composes those current theorems instead of importing the
legacy fixed-nine bridge. This avoids the legacy bridge's inherited
`native_decide` trust closure.

## Current cap-order interface audit

`Problem97.CapTriple` in `P97/Cap/Structure.lean` records the three closed cap
finsets, the endpoint/non-Moser membership pattern, and the signed-side
`arc_membership` invariant. It does **not** contain a global boundary
enumeration or index inequalities between cap blocks.

`Problem97.Census554.GeneralCarrierBridge.BoundaryIndexing` records a global
injective CCW enumeration, its image, and inverse indices for points of `A`.
It does **not** relate those indices to the three caps.

The lower-level ingredients needed for the adapter are present on
`SurplusCapPacket`:

- `exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices`;
- `capInteriorByIndex_open_interval_of_global_indices`;
- `capInteriorByIndex_open_reverse_interval_of_global_indices`;
- `capInteriorByIndex_open_complement_interval_of_global_indices`; and
- `capInteriorByIndex_open_reverse_complement_interval_of_global_indices`.

`PinnedHullOrder.lean` already demonstrates how to combine these ingredients
for selected branch-local labels. What is not currently packaged is a uniform
adapter for arbitrary distinct cap interiors, or the exact five-label packet
needed by the new three-row consumer.

## Exact remaining interface

The generic geometric bridge needs an adapter with this mathematical content:

```lean
-- schematic: exact names can follow the surrounding SurplusCapPacket API
theorem SurplusCapPacket.boundary_order_of_distinct_capInteriors
    (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    (hij : i ≠ j)
    (hx : x ∈ S.capInteriorByIndex i)
    (hy : y ∈ S.capInteriorByIndex j) :
    -- one orientation or its reversal
    BoundaryOrder4
      (S.oppositeVertexByIndex i)
      (S.oppositeVertexByIndex j) x y := ...
```

For implementation, `BoundaryOrder4` should export one shared injective CCW
enumeration plus explicit indices and either

```text
i(vi) < i(vj) < i(x) < i(y)
```

or its cyclicly reversed placement. This makes the orientation choice visible
and feeds the checked theorem without silently assuming the cap-chain order.
Because the current `convexHull_line_inter_eq_segment_of_extreme_pair` API uses
`Fin A.card`, either the adapter should export a cardinality-indexed boundary
enumeration or the production bridge should first generalize that extreme-pair
theorem to arbitrary `Fin n` enumerations.

For the immediate terminal consumer, the narrower and more useful adapter is:

```text
named cap memberships / branch order
  -> one shared boundary enumeration with O < A < Y < E < C.
```

Once that packet is available, the three shell equalities are the only metric
inputs to `false_of_five_ccw_three_shell_equalities`.

## What this does and does not establish

- **PROVEN IN PRODUCTION:** the crossing bridge, both strict linear
  inequalities, both displayed ordinal corollaries, the five-index three-row
  contradiction, and its actual `SelectedFourClass` support adapter.
- **EXACT STORED-PREFIX RESULT (separate audit):** the sibling
  `global-minimality-connectivity-audit/kalmanson-consumer/` replay rejects
  all 101 stored corrected shadows by ordinal closure, including the formerly
  bank-clean terminal shadow through this report's
  `false_of_five_ccw_three_shell_equalities` pattern.  That checkpoint is a
  CEGAR prefix, not exhaustive coverage.
- **NOT PROVEN:** a live producer of the exact `E/Y` placement and three
  selected rows, or coverage of every remaining parent branch by the
  five-index consumer.
- **INSUFFICIENT ALONE:** the pairwise disk-containment disjunction. The
  checked progress is the stronger strict-distance producer and one concrete
  consumer.

The sibling audit has now completed that theorem-discovery step.  Its
prefix-monotone continuation exhausts the corrected fixed fourteen-role
`PROFILE = (8,4,5)` surface, and every admissible singleton selected row at
`X`, `I`, or `F` is already inconsistent with the fixed `O/A/D/t1` packet.
This is not a theorem that every live parent instantiates that fixed surface.
Formalization should therefore target the missing source-indexed named-row
producer and a kernel-checkable coverage theorem, not another boundary-index
wrapper or selected-row/minimality abstraction.

## Validation

Focused production command, run from `lean/`:

```bash
lake-build Erdos9796Proof.P97.ATail.CapCrossingKalmanson
```

Result: success. Every displayed theorem reports exactly:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorry`, `admit`, `native_decide`, or unsafe axiom in the
production module. The original scratch path is now a smoke import of that
module.
