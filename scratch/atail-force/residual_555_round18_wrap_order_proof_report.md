# Round-18 `(5,5,5)` wrap-order proof report

## Verdict

**PROVEN.**  The equality closure in the round-18 residual is incompatible
with cyclic order `O,Y,A,D,E,C`.  The generic metric theorem, its positive and
reflected `EdgeClosure` consumers, and the arbitrary-cardinality
`FaithfulCarrierPattern`/`BoundaryIndexing` adapter all elaborate without
`sorry`.  Every printed endpoint axiom set is exactly
`propext`, `Classical.choice`, and `Quot.sound`.

This closes the metric consumer for the pinned residual.  It does not by
itself prove that every live ATAIL carrier produces this five-row pattern.

## Theorem-bank preflight

Before deriving the obstruction, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed searches covered the phrases `six point circle chain cyclic order O Y
A D E C equal distances`, `equilateral circle intersection signedArea2 wrap
order`, name pattern `*circle*order*`, and signature fragment `signedArea2`.
They found the existing `SixPointCircleChainOrderCore` for order
`O,A,D,E,C,Y` and the distinct `SixPointTwoCircleOrderCore`, but no existing
consumer for the wrap order.  The new proof therefore reuses the established
normalization and equality-core APIs without duplicating an already-bankable
result.

## Exact scalar reduction

Normalize `O=(0,0)` and `A=(1,0)`.  The signs `OAC`, `OAE`, and `OAD` select

```text
C = (1/2,h),       h^2 = 3/4,  h > 0,
E = (h,1/2),
D = (t(1/2+h), t(h-1/2)),
t^2 = 1/2,         t > 0.
```

Write `Y=(r,g)`.  The sign `OYA>0` is exactly `g<0`.  The two final circle
equations reduce to

```text
f = r^2 + g^2 - 2*h*r - g + 2*h - 1 = 0,
k = r^2 + g^2 - r - 2*h*g + 2*t - 1 = 0.
```

Together with `h^2=3/4` and `t^2=1/2`, kernel-checked polynomial elimination
gives

```text
P = -4*g^2
    + (8*h*t + 4*t - 4)*g
    + (12*h*t - 8*h + 6*t - 5) = 0.
```

All three summands are strictly negative:

1. `-4*g^2 < 0` because `g<0`.
2. `8*h*t+4*t-4 > 0` follows from `h>1/2` and `t>1/2`, so its product with
   `g` is negative.
3. For the constant term, both `4*h*(3*t-2)` and `5-6*t` are positive.  The
   exact identity

   ```text
   (5-6*t)^2 - (4*h*(3*t-2))^2 = 84*t - 59
   ```

   and `t>59/84` imply
   `4*h*(3*t-2) < 5-6*t`, which is precisely
   `12*h*t-8*h+6*t-5 < 0`.

The earlier polynomial recorded in
`residual_555_round18_wrap_order_analysis.md` is also an ideal consequence of
the same four equations, but the displayed `P` has the cleaner sign proof and
is the relation formalized here.

## Generic API

`six_point_circle_chain_wrap_order_core.lean` defines:

- `Problem97.Census554.SixPointCircleChainWrapOrderCore.metric_orientation_incompatibility`;
- `Problem97.Census554.SixPointCircleChainWrapOrderCore.Core`, an abbreviation
  of the existing eight-field circle-chain equality core;
- `Problem97.Census554.SixPointCircleChainWrapOrderCore.false_of_core`; and
- `Problem97.Census554.SixPointCircleChainWrapOrderCore.false_of_core_of_neg`.

The reflected consumer transports both the row realization and all four signs
through `reflectXAxis`; it is not a duplicated scalar proof.

## Round-18 general-carrier adapter

`residual_555_round18_general_carrier_adapter.lean` uses

```text
(O,Y,A,D,E,C) = (0,9,1,3,4,2)
```

inside the saved hull order

```text
(0,9,10,11,1,3,4,5,2,6,7,8).
```

Its five rows supply exactly the eight generic closures:

- row `0:{1,2,3,4}` supplies `OA=OC=OD=OE`;
- row `1:{0,2,6,7}` supplies `OA=AC` after edge reversal;
- row `3:{1,4,5,6}` supplies `DA=DE`;
- row `4:{1,2,9,11}` supplies `EA=EC=EY`; and
- row `2:{3,8,9,10}` supplies `CD=CY`.

The cyclic-subsequence proof extracts `OAC`, `OAE`, `OAD`, and `OYA`.
`BoundaryIndexing` exposes these with the repository's negative signed-area
convention, so the adapter intentionally calls `false_of_core_of_neg`.

## Validation

Because both files are scratch modules outside the Lake library import tree,
the repository's documented narrow direct-Lean exception was used with the
standard 16 GiB memory cap.  From `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/six_point_circle_chain_wrap_order_core.lean

lake env lean -M 16384 -R ../scratch/atail-force \
  -o ../scratch/atail-force/six_point_circle_chain_wrap_order_core.olean \
  -i ../scratch/atail-force/six_point_circle_chain_wrap_order_core.ilean \
  ../scratch/atail-force/six_point_circle_chain_wrap_order_core.lean

BASE_LEAN_PATH="$(lake env printenv LEAN_PATH)"
lake env env \
  LEAN_PATH="../scratch/atail-force:${BASE_LEAN_PATH}" \
  lean -M 16384 \
  ../scratch/atail-force/residual_555_round18_general_carrier_adapter.lean
```

Results:

- core clean rerun: exit `0`, no warnings;
- adapter elaboration: exit `0`, no warnings;
- textual scan of both `.lean` files: no `sorry`, `admit`, or declared
  `axiom`;
- `normalized_wrap_order_incompatible`: exactly
  `[propext, Classical.choice, Quot.sound]`;
- `metric_orientation_incompatibility`: the same;
- `false_of_core`: the same;
- `false_of_core_of_neg`: the same;
- `FiveRowSupportData.toCore`: the same; and
- `false_of_five_rows_and_cyclic_subsequence`: the same.

The temporary `.olean` and `.ilean` used to validate the out-of-tree import
were removed after the adapter check.  No shared Lean source or closure document
was edited by this lane.
