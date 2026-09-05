# CardGeThirteen exact-13 batched seed loader

Date: 2026-09-05

## Defect and repair

The cumulative seed loader previously read only an iteration-level `cut`.
The iterative batch runner records its clauses inside
`new_conflicts[*].cut`, so all 9,421 clauses from the first batched wave were
silently omitted when that event was supplied as a later seed.

`iteration_cuts` now validates and returns both legacy singleton cuts and the
batched representation.  Exact string deduplication and per-source occurrence
counts remain unchanged.  A focused regression test covers two batched
iterations, including a repeated clause.

## Validation

The focused loader tests pass and Ruff is clean.  Loading the full cell-0 event
chain now reports source occurrence counts
`250, 1000, 3000, 317, 500, 9421, 648` and 14,895 unique clauses.  Before this
repair, the iterative event contributed zero clauses.

This is a replay/custody correction.  It changes no mathematical claim and
does not convert any formula-scoped result into a source or Lean theorem.
