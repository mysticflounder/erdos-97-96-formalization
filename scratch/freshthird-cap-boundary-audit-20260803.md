# FreshThird equal-center same-cap boundary audit (2026-08-03)

## Question

Can the residual `FreshThirdNonCanonicalInteraction.sameCapWithInternalFiberSource`
branch upgrade a Q source from `capByIndex capIndex` to
`capInteriorByIndex capIndex` using freshness, blocker inequalities, or shell
support?

## Relevant definitions and producers

* `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean` (around lines 466--480)
  defines `capByIndex`; `capInteriorByIndex` is the corresponding cap after
  erasing its two indexed Moser outer vertices.
* `lean/Erdos9796Proof/P97/SurplusM44Packet/Shard01.lean` (around 1365)
  proves the exact upgrade
  `mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer`: closed-cap membership
  plus inequality to both `leftOuterVertexByIndex i` and
  `rightOuterVertexByIndex i` implies interior membership.
* `Shard02.lean` (around 183) has
  `capInteriorByIndex_ne_of_mem_of_mem_ne`, a strict-interior distinctness
  lemma.  It is useful for comparing *centers* in different indexed interiors,
  not for upgrading a Q source.
* `ATail/BlockerMultiplicityGeometry.lean` (around 70):
  `FreshThirdBlockerFiber` gives equal blocker centers, source/freshness
  inequalities, and mutual shell support.  It has no field excluding Q
  sources from Moser vertices or indexed outer endpoints.
* `ATail/FrontierLiveClosure.lean` (around 9227, 10318, 10415, 10533):
  `CapSourceThirdCanonicalRowWitness` puts the C sources in strict interior
  `oppIndex1`; `exists_blockerCenter_mem_capInteriorByIndex` puts the chosen
  blocker center in some strict interior; the equal-center
  `sameCapWithInternalFiberSource` interactions store only
  `Q.source_i.1 ∈ capByIndex capIndex` (one of the two Q points), not Q-source
  interior.  The noncanonical constructor additionally assumes
  `capIndex ≠ S.oppIndex1`.

## What the existing hypotheses do (and do not) prove

Freshness excludes Q sources from the named P/Pρ source points.  Blocker
inequalities compare blocker centers with those sources and apices.  The shell
membership and `overlap_eq = {Q.source₁,Q.source₂}` provide row-incidence and
cardinality information.  None of these statements excludes a Q source from
`leftOuterVertexByIndex capIndex` or `rightOuterVertexByIndex capIndex` (nor from
an arbitrary Moser triangle vertex).  `centerAt_ne_source` only separates a
blocker center from its own source and does not imply an endpoint inequality for
another point.

The available case split
`mem_triangle_verts_or_exists_capInteriorByIndex_of_mem` can classify a point as
a Moser triangle vertex or as interior to *some* cap.  It does not rule out the
triangle-vertex case, force that cap to be the current `capIndex`, or remove the
two indexed outer endpoints.  A search of the current P97 corpus found no
FreshThird/support theorem supplying this missing exclusion.

## Conclusion

There is no sound direct promotion of the noncanonical same-cap branch with the
current API.  The canonical equal-center terminal closes only when
`capIndex = oppIndex1`; the residual `capIndex ≠ oppIndex1` branch is therefore
genuinely unresolved, not an artefact of a missing `simpa`/membership lemma.

To enable an upgrade, one must first prove (for the selected Q source)

```lean
Q.source_i.1 ≠ S.leftOuterVertexByIndex capIndex
Q.source_i.1 ≠ S.rightOuterVertexByIndex capIndex
```

and then apply `mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer`.  Plausible
bridges are (A) add these endpoint inequalities (or a stronger “Q source is not
any Moser triangle vertex” field) to the FreshThird interaction, (B) prove them
from new shell/apex geometry, or (C) handle the endpoint-equality cases via a
new metric/shell contradiction.  No such bridge is currently present.

