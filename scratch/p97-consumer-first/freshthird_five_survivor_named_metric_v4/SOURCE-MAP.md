# Source map and ingress contract

## Exact finite scope

The carrier has exactly 17 slots.  The eight tags are the Cartesian product of
the two source orientations, the two choices of deleted Q point, and the two
choices of retained first-apex radius.  One validated structural survivor is
selected per tag; there is no claim that these eight frozen motifs cover every
survivor admitted by `FiveSurvivorExactRowsBoundary`.

The corrected v2 ingress supplies genuine center variables, the actual deleted
blocker, canonical B0/B1 rows, retained B2, independent B3/B4 witnesses,
source-entitled center inequalities, row-center omission, and exact blocker
alias support equality.  V4 does not impose center/support injectivity.

## New universal structural cuts

Role mapping:

- `C2 = S.oppApex1`;
- `C3 = S.oppApex2`;
- `C4 = S.surplusApex`;
- `Q0 = Q.source.1` and `Q1 = Q.otherOutsidePoint`, up to the tag orientation.

Public endpoint facts:

- `ATailApexRichClassStructure.oppositeVertexByIndex_oppIndex2` identifies
  `S.oppApex2` with the indexed opposite vertex at `S.oppIndex2`.
- `ATailApexRichClassStructure.oppositeVertexByIndex_surplusIdx` identifies
  `S.surplusApex` with the indexed opposite vertex at `S.surplusIdx`.
- `Problem97.ATailUniqueRowProducerScratch.oppositeVertexByIndex_mem_capByIndex_of_ne`
  puts either indexed opposite vertex into the closed cap at a distinct index.
- The guards are `S.oppIndex1_ne_oppIndex2` and
  `S.surplusIdx_ne_oppIndex1` from the public `SurplusM44Packet` endpoint API.

Thus `C3,C4` lie in `S.capByIndex S.oppIndex1`.  The same facts can be read via
the public left/right endpoint membership and endpoint-identification API in
`SurplusM44Packet/Shard01.lean`.

`FreshOutsideFirstBlockerFiber.source_not_mem_firstCap` and
`FreshOutsideFirstBlockerFiber.otherOutsidePoint_not_mem_firstCap` put `Q0,Q1`
outside that cap.  Contradiction with membership gives all four inequalities
`C3 != Q0`, `C3 != Q1`, `C4 != Q0`, and `C4 != Q1`.

The exact encoded atoms are:

```text
Cap[C3]
Cap[C4]
C3 != Q0
C3 != Q1
C4 != Q0
C4 != Q1
```

`Cap[Q0] = false` and `Cap[Q1] = false` were already present in v2 and remain
independently validated in v4.

## Metric stages

- `baseline`: a gauge, distinct physical carrier coordinates, separating-line
  witnesses for strict convex position, the minimum-enclosing-circle boundary
  roles `C2,C3,C4`, the resulting nonobtuse boundary triangle, and the exact
  first closed-cap half-plane membership pattern.
- `named_rows`: baseline plus equal-distance equations for PRow, PRhoRow,
  S0Row, S1Row, R, Rh, B3, B4, and DBRow, with distinct R/Rh radii.
- `exact_offsupport`: named rows plus off-support inequalities for PRow,
  PRhoRow, S0Row, S1Row, and DBRow only.  No exactness is invented for B3,
  B4, R, or Rh.

Every stage uses the same 97 real variables emitted by v3.  Constraint counts
are recorded per tag/stage in `results.json`, because the number of row-support
equations depends on the frozen survivor.

## Explicit omissions and hard gate

There is no complete `FiveRowCircleIntersectionOrderCore` role map.  In
particular, the live boundary does not supply all ten `EdgeClosure` premises or
all six premises of either orientation.  None is fabricated or encoded.

Also omitted are crossed-three-row constructors, anonymous carrier-wide K4
rows, exhaustive survivor coverage within a tag, a general-cardinality ingress,
and a universal lift.  The output is producer-discovery evidence only.

