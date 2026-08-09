# Exact-12 mixed-v3 twelve-cell wave

This bounded diagnostic wave ran the committed `cb329a7e` tagged-v3 CEGAR
dispatcher over normalized schedule cells 0 through 11, with at most 400
refinements per cell and twelve concurrent workers.

All twelve per-cell journals replayed successfully.  The wave admitted 3,875
cuts in total:

- 3,777 `equality-duplicate-center`;
- 48 `equality-equilateral-bisector-collision`;
- 29 `equality-perpendicular-bisector-convex`;
- 11 `equality-three-triad-collision`;
- 7 `equality-equal-k4`;
- 1 `equality-eight-point-five-circle-collision`;
- 1 `equality-seven-point-six-circle-collision`; and
- 1 `equality-seven-point-twin-four-circle-collision`.

Cells 2, 4, 5, 7, and 8 ended `STRUCTURALLY_UNRESOLVED`, with respectively
209, 257, 229, 270, and 110 records.  Cells 0, 1, 3, 6, 9, 10, and 11 reached
the 400-iteration limit.  No source-order cut was admitted.  No cell reached
`UNSAT_DRAT_VERIFIED`.

This artifact is authenticated finite survivor data only.  It does not provide
a terminal proof, aggregate schedule coverage, a universal lift, or a live
Lean theorem closure.  The next justified use is source-entitled predicate and
certificate mining over the five saved survivor cubes and the seven retained
iteration-limit journals.

The subsequent source-order audit found 48-of-48 convex-five-point coverage for
all five terminal survivors.  The production stage had admitted zero such cuts
because its checked registry contained only the unrelated frozen-V8 cube.  The
cell-8 certificate has since been promoted to the source-clean Lean value
`mixedV3Cell8PositiveNogood` and source-order bank schema v2 clause
`(-55,-313,-2134)`.  The remaining four certificates are still diagnostic.

Because that promotion changes the detector manifest, this v3 journal remains
read-only mining evidence.  A new canary or wave must start a fresh authenticated
journal under the new contract; records from this directory must not be spliced
into its hash chain.
