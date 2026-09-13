# Finite-nine counting shapes

This packet publishes five theorem/proof pairs for the finite-nine counting
interface:

- a finite equidistant neighbour set contributes at least its number of
  unordered pairs at the chosen apex;
- five equidistant neighbours contribute at least ten local pairs;
- a four-point equidistant class together with an extra pair not contained in
  that class
  contributes at least seven local pairs; and
- each of those two local configurations gives a total count of at least
  fifty-five in a nine-point set with four equidistant witnesses at every
  point.

The packet reuses the counting definitions and the accepted theorem
`Problem97.fifty_five_le_iCount_of_card_nine_K4_of_iCountAt_ge_seven`.
It contains no definitions and records no mission milestone. Its results give
later finite-nine shape arguments a compact way to turn either local shape
into the lower-count threshold that must be compared with the finite-nine
upper-count bound.

The counting method follows Adrian Dumitrescu's 2006 paper *On Distinct
Distances from a Vertex of a Convex Polygon*. The Lean formalization and these
Prove2Me proofs are by Adam McKenna and are released under Apache-2.0.

Validate and apply from the repository root:

```bash
uv run python prove2me/tools/prove2me_submit.py validate \
  prove2me/submissions/finite-nine-counting-shapes/plan.toml
uv run python prove2me/tools/prove2me_submit.py apply \
  prove2me/submissions/finite-nine-counting-shapes/plan.toml
```

The Lean source declarations are in
`Erdos9796Proof/P97/IsoscelesCount.lean` at the source commit recorded in
`plan.toml`.
