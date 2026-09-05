# Exact-card-13 source-order four-circle countermodel

**Date:** 2026-09-04  
**Target:** `false_of_cardGeThirteenUncoveredThreeCenterPacket`

## Advance over the first exact model

This fully rational 13-point model retains the same exact four rows, tight cover, two named A₂ radii, local two-source blocker failure, and opposite deletion views, but it also realizes the source-compatible cyclic block count:

```text
A₂
< two points
< left cap endpoint
< five candidate oppIndex2-interior points
< right cap endpoint
< three points
< A₂.
```

The exact CCW order is

```text
O < x2 < x1 < l2 < z < l1 < k2 < b1 < k1
  < b0 < k3 < l0 < x0.
```

Taking proposed triangle vertices

```text
A₂ = O,
left endpoint = l2,
right endpoint = b0,
```

the open endpoint interval is exactly

```text
z, l1, k2, b1, k1,
```

with A₂-class profile `L,L,K,K,K`; the complementary arc is split by `O` into blocks of three and two. Thus the earlier `4+1 versus 3+2` order mismatch has been removed exactly.

The four exact supports remain

```text
C0@b0 = {O,l0,l1,x0}
C1@b1 = {b0,l2,x1,x2}
K@O   = {b1,k1,k2,k3}
L@O   = {z,l0,l1,l2}.
```

They satisfy

```text
A = {z} ⊔ C0 ⊔ C1 ⊔ K,
K ∩ L = ∅,
|C0∩L|=2,
|C1∩L|=1,
A2=O∈C0,
b0∈C1,
b1∈K.
```

All four are complete distance classes in the 13-point carrier.  The local actual-blocker failure semantics are exact for sources `l0` at `b0` and `l2` at `b1`: deleting the source lowers the largest blocker-centered distance multiplicity from four to three.  The model also has opposite named-A₂ deletion views, with `z` omitted by `C0,C1,K` and `d=k3` omitted by `C0,C1,L`.

## First surviving source mismatch

The circle through the proposed triangle vertices `O,l2,b0` does not contain the carrier. Exactly the points

```text
l0, x0, k3
```

lie outside it.

Therefore the first explicitly witnessed failure is now the true MEC/Moser disk layer, not cyclic cap-block cardinality, selected-row geometry, or the local actual-blocker semantics of the two chosen sources.

## Claim boundary

This is still not a `SurplusCapPacket` or `CounterexampleData` realization. It does show that the following data remain jointly feasible:

- exact-card-13 tight cover;
- four exact selected rows;
- two distinct A₂ radii and no A₂ five-class;
- strict convexity;
- source-compatible `5 | 3 | 2` boundary block count;
- local actual-blocker failure for the two selected good sources;
- two distinct deletion views using opposite named A₂ rows.

The next plausible terminal must use the MEC disk/triangle equations, global K4 at the other centers, frontier provenance, or global minimality.

Local exact verifier SHA-256:

```text
c98a3896432bc1a423455a6a712632a4f9f8c4c8d1ed48cf54c1d9f1d32d54b9
```

Local archive SHA-256:

```text
405b86be8630e0ae1b194992c69d42afb13a58c28e4935706d0a344f80375d0d
```

The verifier uses only Python `Fraction` arithmetic and checks every row equality, exact support, convex edge-side inequality, deletion multiplicity, block count, and the exact set of points outside the proposed Moser circle.