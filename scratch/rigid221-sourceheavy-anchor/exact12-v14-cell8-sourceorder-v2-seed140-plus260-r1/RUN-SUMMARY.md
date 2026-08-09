# Exact-12 mixed-v3 cell-8 continuation to 400 records

This run copied and replayed the 140-record source-order-bank-v2 cell-8 canary,
then admitted 260 additional refinements under the same detector contract
`6a65ee36bfa16027ae6a70ed727edc2c680af8f893aba11a6926d7eb0f73fa2b`.
The resulting 400-record journal contains:

- 386 `equality-duplicate-center`;
- 7 `equality-perpendicular-bisector-convex`;
- 4 `equality-equilateral-bisector-collision`;
- 2 `equality-three-triad-collision`; and
- 1 `source-order-positive-coverage`.

The retained source-order record is the checked clause
`(-55,-313,-2134)`.  The full journal replayed successfully and has terminal
record hash
`ae6205ef62a600ec2b08c24ea358fede6418cd59307c5c9221cf599d81550bab`.

The run ended `ITERATION_LIMIT` with SAT as the discovery verdict.  It produced
no terminal CNF/DRAT proof.  This is authenticated one-cell search progress,
not finite UNSAT, aggregate schedule coverage, a universal lift, or live Lean
closure.
