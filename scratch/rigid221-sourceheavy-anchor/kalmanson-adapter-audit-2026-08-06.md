# Pentagon-off-class Kalmanson adapter audit

Date: 2026-08-06  
Scope: bounded read-only audit of the live leaf, `scratch/PentagonOffClassProducerProbe.lean`, the 2026-08-05 response, `CapCrossingKalmanson.lean`, and `FivePointCircleIsoscelesOrder{Core,Bridge}.lean`. No production file was edited by this audit.

## Verdict

**The exact C5 traces do not close the leaf through either existing bridge.** The strongest four-point labeling has the required cap order but is missing an equality that is in fact refuted by the exact cap trace. The natural physical-circle/shared-bisector labelings have the two required equalities, but the forced cap order puts centers and endpoints in alternating cyclic order; the Kalmanson consumers require the two centers to be adjacent in the induced cyclic quadruple. The unique fully anchored five-point row labeling also has the wrong cyclic order.

Thus this is an **obstruction audit**, not a proof of the live theorem. The response document's crossed-fan/global-row consumer remains the relevant missing mathematics.

## Source facts actually available

Write

```text
O = S.oppApex2,  d = deleted,
c = centerAt(xv),
b_s = centerAt(s) for s in {u,xu,d,v,xv}.
```

The probe proves:

- `b_u = xv` and `b_xv = c`;
- the physical cycle traces
  `row(u):{u,xu}`, `row(xu):{xu,d}`, `row(d):{d,v}`,
  `row(v):{v,xv}`, `row(xv):{xv,u}` after intersection with the exact physical class;
- the five `b_s` are injective;
- `row(xv) ∩ oppCap2 = {u,xv}`;
- the only carrier bisectors of `{xv,u}` are `{c,O}`; and
- for local indices on the second cap,
  `u < c < xv < xu`, or the complete reversal.

The last order follows from the two metric equalities

```text
xv bisects {u,xu},       c bisects {u,xv}.
```

These are producers (`PentagonOffClassProducerProbe.lean:243,299,353,2033,2256`), not consumers of the live `sorry`.

## Four-point Kalmanson instantiations

Both Kalmanson statements require four increasing vertices of one global CCW boundary enumeration. Up to reversal/cyclic cut, the endpoint theorem requires a grouped order

```text
center_1, endpoint_1, endpoint_2, center_2,
```

and the middle theorem requires

```text
endpoint_1, center_1, center_2, endpoint_2.
```

Equivalently, the two centers must be adjacent in the induced cyclic order, and both must bisect the same endpoint pair.

| Candidate | Required data | Result |
|---|---|---|
| Middle centers on the forced quadruple: `(ia,ib,ic,id)=(u,c,xv,xu)` (or the reversal) | `c` and `xv` both bisect `{u,xu}` | **Refuted.** `xv` does bisect `{u,xu}`. But `row(xv) ∩ oppCap2={u,xv}` and `xu∈oppCap2`; exactness of `CriticalFourShell` gives `dist c xu != row(xv).radius = dist c u`. Hence the `c` equality required by `false_of_four_ccw_middle_centers_bisect_endpoint_pair` is false. |
| Endpoint centers on the same forced quadruple | `u` and `xu` both bisect `{c,xv}` | **Not produced.** Neither equality follows from a C5 trace or blocker identity. |
| Shared physical edge `{u,xu}`, centers `{O,xv}` | Example endpoint labels `(O,u,xu,xv)`, or middle labels `(u,O,xv,xu)`, with a suitable global cut | **Cyclic order refuted.** Since `O` is outside its opposite cap and `u < xv < xu` in that contiguous cap block, the induced order is `O,u,xv,xu` (or reversal): centers `O,xv` alternate with endpoints `u,xu`. |
| Shared physical edge `{xv,u}`, centers `{O,c}` | Example endpoint labels `(O,u,xv,c)`, or middle labels `(u,O,c,xv)` | **Cyclic order refuted.** The induced order is `O,u,c,xv` (or reversal), again alternating centers and endpoints because `u < c < xv`. |
| Edges `{xu,d}`, `{d,v}`, `{v,xv}`, with centers respectively `{O,b_xu}`, `{O,b_d}`, `{O,b_v}` | The equalities are available: `O` and `b_s` bisect that row's physical edge | **Open but unsupported.** No source hypothesis locates `b_xu`, `b_d`, or `b_v` in global cyclic order. Exact missing hypothesis: global indices fitting either `b_s < p < q < O` (endpoint schema) or `p < b_s < O < q` (middle schema), modulo reversal/cyclic cut and swapping `p,q`. Blocker injectivity supplies no such location. |

This enumerates all direct physical-edge shared-bisector uses: `O` bisects every physical edge, while each actual blocker `b_s` bisects its row edge. The only two blocker positions fixed by the forced second-cap order are precisely the two cases whose required grouped order is false.

## Five-point selected-row instantiations

For `false_of_two_selected_rows_of_ccw`, the rows must be centered at the first and last boundary vertices `W,Z`; `WRow` must contain `F,X,Z`, and `ZRow` must contain `P,X` in order

```text
W < F < P < X < Z.
```

Among the five physical traces, there is one fully anchored pairing:

```text
W    = c,                 WRow = row(xv),
Z    = xv = b_u,          ZRow = row(u),
X    = u,                 P = xu.
```

It is unique because `b_u=xv` is the only known blocker that is itself a physical vertex; the only physical row containing `xv` and sharing a physical point with `row(u)` is `row(xv)`, with shared point `u`. The third required `WRow` point `F` must be outside the second cap, since `row(xv) ∩ oppCap2={u,xv}`.

This application is **refuted by order before choosing `F`**. Its required cyclic subsequence is

```text
c, xu, u, xv,
```

whereas the forced cap order gives, starting at `c`,

```text
c, xv, xu, u
```

or its reversal `c,u,xu,xv`; neither is the required subsequence.

All other plausible uses must replace a named role by outside-support data. Concretely they need at least one of:

- a common outside point `t ∈ row(xv).support ∩ row(u).support` to use as `X`;
- an outside member of `row(u)` to use as `P`; or
- another blocker-center membership `b_j ∈ row(i).support` to create `Z ∈ WRow` for a different row pair;

together with five explicit global indices satisfying `W<F<P<X<Z`. None of those positive incidences or order packets follows from the exact C5 traces, the blocker injectivity theorem, or the live leaf's hypotheses.

## Lean adapter gap versus mathematical gap

There is also a smaller API gap, but filling it would only formalize the negative order checks above:

- the forced-order probe uses the forgetful `capByIndex_cgn4g_capData`;
- `capByIndex_cgn4g_strictCapBlockData` retains `BoundaryCapBlock.idx`, `idx_strict`, and `points_eq`, but `StrictCapBlockData` does **not** retain `Function.Injective phi` or `IsCcwConvexPolygon phi`;
- its global domain is `Fin n`, while the two equality-only consumers are stated over `Fin carrier.card`.

An adapter would therefore need the retained block plus `phi` injectivity/CCW (and either `n=carrier.card` transport or cardinality-generic Kalmanson statements). That adapter cannot create the missing shared equality, outside-support incidences, or blocker positions.

## Exact conclusion

No application of
`false_of_four_ccw_endpoint_centers_bisect_middle_pair`,
`false_of_four_ccw_middle_centers_bisect_endpoint_pair`, or
`false_of_two_selected_rows_of_ccw`
is currently derivable from the live leaf. For the two fully ordered four-point candidates and the unique fully anchored five-point candidate, the required hypothesis is not merely absent: it is contradicted by the forced second-cap order or exact row trace. The unresolved hypotheses are the global positions of `b_xu,b_d,b_v` and new positive outside-support/cross-row incidences, exactly the kind of global crossed-fan producer/consumer identified in the response document.
