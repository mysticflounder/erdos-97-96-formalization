# B1 normal-form Wave 7: Stage-A near-survivor order cell

Date: 2026-08-31

## Objective

Wave 7 tests the first new metric cell exposed by Wave 5 rather than repeating
the already-complete arbitrary-cardinality named-order census.  It fixes the
near-survivor cyclic order

```text
A,d1,cR,cL,Bc,d2,u0,Bu,uR,uL,u1,vL,vR,v0,Bv,v1
```

and releases the common and both live completed rows.  The parameterization
keeps the six physical points on one circle about `A`; each blocker lies on
the perpendicular bisector of its endpoint pair; and each row's two completion
supports lie on that row's exact metric circle.  A rotation gauge fixes the
`u1` stereographic parameter to zero.

## Claim boundary

The numerical objective tests the signed distance of every other named point
from every directed edge in the fixed cyclic order, together with strict
physical-parameter ordering and blocker-scale guards.  A positive minimum
margin is only a numerical SAT candidate and must be rationalized and replayed
exactly.  Failure to find such a margin is `UNKNOWN`, never `UNSAT`.

This wave deliberately omits cap/MEC data, deletion-survival provenance,
card-five aliases, and any assertion that the named roles exhaust the ambient
carrier.  It is a metric Stage-A diagnostic, not a Lean proof or an exact-12
terminal.

## Relationship to the global ingress

`B1LiveSharedPairNonalternationIngress.lean` now supplies the checked
arbitrary-cardinality consumer boundary: one global `BoundaryIndexing` plus a
same-arc bit for whichever live slice has cardinality two closes the B1
five/six normal-form leaf.  Wave 7 does not assume that bit.  It asks whether
the first untested three-completed-row order cell has a robust metric survivor;
the answer determines whether the next refinement is rational replay or a
different source-provenance family.

## Result

The governed four-seed run completed with
`claim_status = UNKNOWN`.  It used seeds `9705`, `9711`, `9723`, and `9737`,
600 generations per seed, and population multiplier 18.  No run produced a
positive fixed-order convex margin:

| seed | minimum margin |
| ---: | ---: |
| 9705 | -0.3060926236410948 |
| 9711 | -0.04620695120742889 |
| 9723 | -0.478020121297619 |
| 9737 | -0.47877511454601446 |

The best run repeats the Wave 5 boundary collapse.  Its six physical
stereographic parameters lie between `-0.01658` and `0.00736`, while its three
blocker scales are `0.50434`, `0.50918`, and `0.50463`.  The first violated
edge constraints are `cR -> cL | v1` at `-0.04621`, `v0 -> Bv | cR` at
`-0.04389`, and `cR -> cL | Bv` at `-0.04357`.  This is bounded numerical
evidence only; it does not establish that the order cell is impossible.

The retained result SHA-256 is
`56b6259d02919a4551143e47b72dadd93b106aba6a291f72f79a147dbb8c1e41`.
The executed-source SHA-256 is
`6c009cd31080a25252b55be4e6b85f0230f16048b03af9c02ce2660284fb8ff4`.
The run-manifest self hash is
`3b2835c219531bd6817d3008236d58050850d720ffa262de8119e4b0730ec0d1`;
its raw file SHA-256 is
`70b9a4f4527fc8162ca9bc333886c15c85c030cd59dd77ab1b827a0f6aab275b`.
Checksum replay passes.

## Post-wave theorem mine

The current-wave mine records `NO_NEW_PATTERN`.  Wave 7 tested a new cyclic
order cell but reproduced the already-recorded collapse toward coincident
physical parameters and blocker scale one-half.  It produced no robust
survivor, certificate, or materially changed source-level theorem key, so no
new Lean-corpus search was triggered.

The canonical receipt has internal hash
`58dae5365ceb6171d4ed73fa0fd5a6db4775765dff4291b683f5a69f7881dcf4`.
Receipt verification passes, and the campaign scan over Waves 1 through 7
reports `PASS`; Wave 7 is the current-gate receipt while Waves 1 through 6
remain historical non-authorizing records.
