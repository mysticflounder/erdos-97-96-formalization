# Exact-12 mixed-v4 twelve-cell wave

This bounded diagnostic wave ran the committed `ec013bfd` mixed-v4 CEGAR
dispatcher over normalized schedule cells 0 through 11, with at most 400
refinements per cell, a 60-second solver timeout, and twelve concurrent workers.
All journals were fresh; no mixed-v3 records were seeded into the v4 hash chains.

All twelve journals replayed successfully, and every final candidate replayed
against the exact CNF plus the accumulated constraints.  The wave admitted
4,662 cuts in total:

- 4,529 `equality-duplicate-center`;
- 60 `equality-equilateral-bisector-collision`;
- 41 `equality-perpendicular-bisector-convex`;
- 16 `equality-three-triad-collision`;
- 8 `equality-equal-k4`;
- 5 `source-order-positive-coverage`;
- 1 `equality-eight-point-five-circle-collision`;
- 1 `equality-seven-point-six-circle-collision`; and
- 1 `equality-seven-point-twin-four-circle-collision`.

The broadened source-order adapter reproduced all five independently mined
late-survivor cuts through authenticated certificate replay:

| Cell | Journal index | Bank index | Learned clause | Record SHA-256 |
| ---: | ---: | ---: | --- | --- |
| 2 | 208 | 1 | `(-55, -410, -498)` | `e3240453966054582cc62b250925a42808d50d8245ae00bcd4ba37dc0f256400` |
| 4 | 257 | 2 | `(-896, -1170, -2053, -2162)` | `02ef199b111623393b8e304ad06a15cf038db831a83c14aa012b5edef264618b` |
| 5 | 229 | 3 | `(-35, -172, -1363, -1620, -2493)` | `4433b53d7aa1d74af19b848898a442fdda5af430334ec3f960908349d9fe7f87` |
| 7 | 270 | 4 | `(-29, -55, -546, -939, -2894)` | `bee97b8c9b7a2542745f21989f2a20e8d26f9a2ce76a53c7bc9a4b206e6f29c7` |
| 8 | 110 | 5 | `(-55, -313, -2134)` | `2bdfe23b3431525834b5774ccdb84c9112d82c5ae5770f1a2684680b274e9427` |

Cells 0, 1, 2, 3, 5, 6, 7, 8, 9, 10, and 11 reached the 400-iteration
limit.  Cell 4 admitted its source-order cut and then exposed a new
`STRUCTURALLY_UNRESOLVED` survivor at record 262.  Its saved survivor has
SHA-256
`15e7be554ec876f7622a8ec9543ed6c58c77952a2cb3e89805c414d91fca5a28`;
the summary and journal hashes are respectively
`a4cd1f5a1266b9476c4692941bda9fb65ca09f4b568f45b46c4978f48d41f58f`
and
`02fb60f43b3412e97e549b064d82568e4bb1e3d8206a81a825e6b3a781c34bd7`.

No cell reached `UNSAT_DRAT_VERIFIED`.  This wave validates the mixed-v4
positive-match dispatch and supplies one new finite survivor for predicate
mining.  It does not provide a terminal cell proof, aggregate schedule
coverage, a universal lift, or a live Lean theorem closure.  The justified
next step is to classify the new cell-4 survivor against source-entitled
detector families before increasing the iteration cap.

The sibling `...-r1` directory is an inert failed launch: its cell directories
were pre-created even though the runner requires each workdir not to exist.
Every r1 worker exited at argument validation before creating a journal.  The
results above are exclusively from the corrected `...-r2` launch.

## Post-wave predicate triage

Subsequent analysis of the saved cell-4 survivor found 48-of-48 source-order
coverage by two convex-five-point cores:

- `(a,x,b,c,y) = (2,1,6,8,4)`, using selected rows centered at `1`, `4`, and
  `8`; and
- `(a,x,b,c,y) = (2,1,8,7,3)`, using selected rows centered at `1`, `3`, and
  `7`.

Together the corresponding Lean-backed nogood uses the five selected rows at
centers `1,3,4,7,8` and compiles to learned clause
`(-55, -387, -703, -1605, -1935)`.  This predicate was mined after the run and
was not present in its detector contract.  It therefore requires a fresh
follow-up journal and does not upgrade any status reported above.
