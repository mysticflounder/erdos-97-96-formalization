# Exact-17 cap-composition ingress contract

This file fixes the ingress *before* the v2 theorem-discovery run.  The model
is a bounded abstraction of a live paired input
`C : TwoCapSourceThirdCanonicalRowSurface P Pρ` together with one assumed
`TwoCapSourcesSixCenterSourceProvenanceBoundary Q C.firstSource C.secondSource`
at `D.A.card = 17`.  The boundary abbreviation alone does not contain the
cap-source witness fields; they enter through `C`.  The model is not a producer
for the boundary and not a Euclidean realization.

## Encoded source-entitled fields

| Finite clause | Exact Lean origin |
|---|---|
| the normalized carrier has 17 physical points | diagnostic hypothesis `D.A.card = 17` used by `twoCapSourceSurface_exact_seventeen_cap_profile`, `TwoSourceClosure.lean:171` |
| the three closed caps have sizes `(8,6,6)`, with the first cap at `S.oppIndex1` | `twoCapSourceSurface_exact_seventeen_cap_profile`, `TwoSourceClosure.lean:171-180` |
| the three named Moser apices have the exact closed-cap membership pattern: each is omitted from its opposite cap and belongs to the other two | `CapTriple.v1_notin_C1` through `v3_notin_C3`, `Cap/Structure.lean:172-189`, transported through `SurplusCapPacket.capByIndex`; named/indexed apex identifications are `oppositeVertexByIndex_oppIndex1`, `oppositeVertexByIndex_oppIndex2`, and `oppositeVertexByIndex_surplusIdx`, `ATail/ApexRichClassStructure.lean:159-188` |
| every non-Moser carrier point belongs to exactly one closed cap | `CapTriple.nonmoser_in_one`, `Cap/Structure.lean:190-194` |
| both oriented cap sources are in the strict interior of the first cap and are distinct | `TwoCapSourceThirdCanonicalRowSurface.sources_ne` and its two `CapSourceThirdCanonicalRowWitness` fields, `TwoSourceCanonicalSurface.lean:112-148` |
| strict first-cap membership excludes both endpoint apices; the opposite apex is already absent from the closed cap | definition `SurplusCapPacket.capInteriorByIndex`, `Cap/PartitionFromMEC.lean:495-501`, plus the exact apex pattern above; its cardinality relation is `capInteriorByIndex_card_add_two`, `ATail/CapApexRadiusRigidity.lean:29-43` |
| B3 and B4 meet each retained pair `{p1,p2}` and `{rho1,rho2}` in at most one point | proved theorem `SixSurvivorExactRowsBoundary.physicalRows_inter_retainedPairs_card_le_one`, `TwoSourceClosure.lean:1540-1564` |

The prior incidence contract remains in force: carrier-wide exact-four
canonical shells, actual blocker centers in the carrier and omitted from their
own source shell, the proved blocker-fiber bound, physical circle aliasing,
six exact deleted rows with six distinct centers, and exact B0/B1/B5
provenance.  The fixed point indices are symmetry normalization only:
`deleted=0`, the six boundary centers are `1..6`, and the three apices are
centers `3,4,5`.  Integer-valued roles otherwise retain physical aliasing.

## Explicit omissions

- No coordinates, distances, radii, convexity, circular order, boundary
  indexing, arc orientation, or Euclidean realizability.
- No particular cap index is assigned to either cap-source blocker.  Carrier
  composition says each non-Moser blocker is in exactly one cap, but
  `exists_blockerCenter_capIndex_and_boundaryPosition` additionally requires
  a `BoundaryIndexing` and a direct/mirror boundary-block premise, neither of
  which follows from the six-row boundary alone.
- `TriApexAllLargeContext.apex_rich` is not collapsed to extra anonymous K4
  rows.  Its conclusion is existential over physical radii (`>=6` on one
  radius, or two distinct radii each `>=4`); the present row language cannot
  preserve those alternatives without adding a radius-class universe.
- No `U5DangerousTriple` or adjacency graph is encoded.  Its Lean structure
  requires a named three-point noncollinear set in `(D.skeleton q).erase p`
  with all three points at radius `dist p q`
  (`U5GlobalIncidenceBasic.lean:30-40`).  Neither
  `TwoCapSourcesSixCenterSourceProvenanceBoundary` nor the retained-pair cut
  produces that packet.  The exact missing ingress is a source-clean theorem
  producing `U3FixedTriplePacket`/`U5DangerousTriple` (and, for adjacency
  queries, the corresponding selected-class adjacency data) from this live
  FreshThird boundary.
- No n=17 result is promoted to general n.  The run is theorem discovery only.

## Independent controls fixed in advance

The run retains the four original malformed-row controls and adds:

1. wrong first-cap cardinality (`7` or `9` instead of `8`);
2. a non-Moser point in zero or two caps;
3. a cap source outside the first strict cap;
4. an apex in its opposite cap;
5. B3 or B4 containing both endpoints of either retained pair.

Each control directly negates an encoded source clause and is replayed as a
small independent Z3/cvc5 formula.
