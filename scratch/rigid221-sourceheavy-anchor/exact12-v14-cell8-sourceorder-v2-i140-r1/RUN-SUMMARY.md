# Exact-12 mixed-v3 cell-8 source-order canary

This fresh bounded canary tested source-order bank schema v2 against normalized
schedule cell 8.  It used detector contract
`6a65ee36bfa16027ae6a70ed727edc2c680af8f893aba11a6926d7eb0f73fa2b`,
started a new authenticated journal, and admitted 140 records:

- 134 `equality-duplicate-center`;
- 3 `equality-perpendicular-bisector-convex`;
- 2 `equality-three-triad-collision`; and
- 1 `source-order-positive-coverage`.

The source-order record occurs at zero-based journal offset 110 and carries the
new checked cell-8 clause `(-55,-313,-2134)`.  This is exactly the survivor at
which the earlier tagged-v3 cell-8 run stopped.  The new cut was therefore
admitted, and search continued for 29 additional records.

The run ended `ITERATION_LIMIT`, with SAT as its final discovery verdict and no
terminal proof.  The 140-record journal replayed successfully; its terminal
record hash is
`416c00efc90b889bce7e1c6c41a93afff5100ffe6fa184db8293ded90f5117a9`.

This validates one finite proof-backed refinement ingress.  It is not terminal
UNSAT, aggregate schedule coverage, a universal lift, or live Lean closure.
