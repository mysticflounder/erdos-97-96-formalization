# Live adapter audit for the front-before-isosceles schema

Date: 2026-07-17

## Result

The source-valid Lean adapter is complete in `LiveFrontSchemaAdapter.lean`.
It consumes the existing production theorems

```text
Problem97.Census554.FivePointCircleIsoscelesOrderCore.false_of_core
Problem97.Census554.FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw
```

and does not reprove the five-point geometry.

Two interfaces are checked:

```lean
false_of_orderedFrontSchemaEmbedding
false_of_canonicalFrontSchemaEmbedding
```

The first uses the human cyclic role order `W,F,P,X,Z`. The second is the
exact reflection-canonical form stored by the outer schema bank. For five
increasing boundary roles `v0,...,v4`, its row memberships are

```text
v0-v1, v0-v2, v4-v0, v4-v1, v4-v3.
```

The second theorem maps these back to the human roles by

```text
(W,F,P,X,Z) = (v4,v3,v2,v1,v0).
```

It explicitly derives the reversed-order side signs and the proper diagonal
crossing. Thus the reflection-canonical bank representation is not being
silently treated as the forward CCW representation.

## Exact live-surface field map

For a live
`WholeCarrierBiApexKalmansonSurfaceAudit.WholeCarrierBiApexKalmansonSurface W`,
the theorem applies with:

```text
A                   := D.A
hA                  := D.convex
rows                := W.rows
boundary            := W.indexing.boundary
boundary_injective  := W.indexing.boundary_injective
boundary_image      := W.indexing.boundary_image
boundary_ccw        := W.indexing.boundary_ccw
```

The schema occurrence supplies only five boundary indices, their carrier
labels, point-identification equalities, strict index order, and the five row
memberships. No blocker-map, exact-row, minimality, common-deletion, cap-size,
or cardinality hypothesis is used by the adapter.

A downstream wrapper importing both scratch surfaces has the following
proof shape:

```lean
theorem false_of_liveSurface_frontSchema
    (W : WholeCarrierBiApexKalmansonSurface R)
    (schema : CanonicalFrontSchemaEmbedding
      (Census554.GeneralCarrierBridge.rowPattern W.rows)
      W.indexing.boundary) : False :=
  false_of_canonicalFrontSchemaEmbedding
    D.convex W.rows
    W.indexing.boundary_injective
    W.indexing.boundary_image
    W.indexing.boundary_ccw
    schema
```

The current whole-carrier surface is itself scratch-only and its path contains
hyphens, so the wrapper above belongs at the eventual common promotion site.
This is a module-placement issue, not a missing mathematical antecedent.

## Remaining producer

The adapter closes one concrete schema occurrence. It does **not** prove that
every live whole-carrier surface contains such an occurrence. The only
remaining antecedent at this boundary is therefore a coverage producer:

```text
live whole-carrier surface
  -> canonical front-schema embedding (or another already-checked bank core)
```

The outer SAT result can establish finite coverage inside its encoded model,
but it is not by itself a Lean theorem connecting an arbitrary live surface to
this embedding. Consequently this scratch result advances the consumer side;
it does not yet close a source `sorry`.

## Circularity audit

There is no dependency cycle:

- the adapter imports only production Census554 geometry and the general
  carrier row bridge;
- neither production five-point theorem imports the A-TAIL live parent,
  `WholeCarrierBiApexKalmansonSurface`, or the K-A target;
- the adapter does not invoke
  `DoubleApexOffSurplusSharedRadiusPair`, a LIVE-Q/C theorem, or any theorem
  whose proof depends on those declarations;
- a production wrapper can be placed strictly downstream of the promoted
  whole-carrier extraction and the existing five-point bridge.

## Validation

The file was elaborated directly, without a Lake build and without importing
the user-owned `ConvexCyclicOrder/ShellCurvature.lean` lane:

```text
lake env lean \
  ../scratch/atail-force/front-before-isosceles/live-adapter-audit/LiveFrontSchemaAdapter.lean
```

Both public axiom queries report exactly:

```text
propext, Classical.choice, Quot.sound
```

The file contains no `sorry`, `admit`, or custom `axiom` declaration.

