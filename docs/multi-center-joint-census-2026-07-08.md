<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Multi-center joint census results (2026-07-08)

Scope: `docs/multi-center-joint-census-spec-2026-07-07.md`, L2 GLOBAL
surface under the PROVEN cuts. This note records the completed
empirical sweep through `n = 28`, which is sufficient for the spec's
`STABILIZED-EMPIRICAL` label. A supplementary extension run for
`n = 29..32` is in flight under
`census/multi_center/sweeps/l2_global_proven_n29_32.json` and is not
used for the verdict below.

## Verdict

**STABILIZED-EMPIRICAL.**

The project-level L2 GLOBAL / PROVEN class inventory stabilizes by
`n = 25`: the cumulative inventory through `n = 24` has `3375` classes,
and `n = 25, 26, 27, 28` each realize exactly that same inventory with
`0` fresh classes. Every tested LOCAL class is GLOBAL-realizable in the
completed range: `533,761 / 533,761 SAT`, `0 UNSAT`, `0 INDETERMINATE`.

## Per-n table

| n | L2 LOCAL | L2 GLOBAL | fresh GLOBAL | cumulative GLOBAL | SAT cells | UNSAT | INDET | DFS nodes |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 12 | 619 | 619 | 619 | 619 | 700 | 0 | 0 | 397,993 |
| 13 | 1150 | 1150 | 531 | 1150 | 1,736 | 0 | 0 | 1,549,535 |
| 14 | 1759 | 1759 | 609 | 1759 | 3,311 | 0 | 0 | 4,570,307 |
| 15 | 2333 | 2333 | 574 | 2333 | 5,476 | 0 | 0 | 11,048,054 |
| 16 | 2613 | 2613 | 280 | 2613 | 8,171 | 0 | 0 | 24,381,275 |
| 17 | 2935 | 2935 | 322 | 2935 | 11,456 | 0 | 0 | 48,257,057 |
| 18 | 3182 | 3182 | 247 | 3182 | 15,286 | 0 | 0 | 86,998,269 |
| 19 | 3213 | 3213 | 31 | 3213 | 19,691 | 0 | 0 | 143,385,137 |
| 20 | 3291 | 3291 | 78 | 3291 | 24,641 | 0 | 0 | 236,386,113 |
| 21 | 3360 | 3360 | 69 | 3360 | 30,181 | 0 | 0 | 375,445,745 |
| 22 | 3360 | 3360 | 0 | 3360 | 36,251 | 0 | 0 | 574,883,663 |
| 23 | 3369 | 3369 | 9 | 3369 | 42,911 | 0 | 0 | 855,806,285 |
| 24 | 3375 | 3375 | 6 | 3375 | 50,116 | 0 | 0 | 1,232,474,553 |
| 25 | 3375 | 3375 | 0 | 3375 | 57,896 | 0 | 0 | 1,690,868,064 |
| 26 | 3375 | 3375 | 0 | 3375 | 66,221 | 0 | 0 | 2,356,657,465 |
| 27 | 3375 | 3375 | 0 | 3375 | 75,136 | 0 | 0 | 3,244,409,704 |
| 28 | 3375 | 3375 | 0 | 3375 | 84,581 | 0 | 0 | 4,355,073,653 |

The decisive stabilization window is `n = 25..28`: fresh GLOBAL count
`0, 0, 0, 0`, with no INDETERMINATE cells.

Also, throughout the entire swept range, the realized inventory is
empirically monotone: each row's `L2 GLOBAL` count equals that row's
cumulative GLOBAL count, so no previously seen class disappears later in
the table.

The table is a project-level recomputation from the actual `class_key`
inventory, not the per-artifact `fresh_*`/`cumulative_*` fields. Those
fields reset when a range sweep is restarted, so the canonical readout is
`uv run python census/multi_center/analyze_sweeps.py`.

For the active erased-pin leaf, use
`uv run python census/multi_center/frontier_report.py`.  It preserves the
same inventory readout, checks whether either pending `n28_32` or `n29_32`
extension artifact has landed, and records that the completed multi-center
data does not supply the producer facts required by
`Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`.

## Interpretation

The data supports two strong empirical statements.

First, the live D-shape is not a hidden GLOBAL obstruction layer: in the
completed range, `LOCAL = GLOBAL` at L2 under the PROVEN cuts. Every
locally admissible triple-support incidence class extends to a full
assignment.

Second, the >2-center coupling surface appears finite: the cumulative
inventory reaches `3375` classes by `n = 24` and does not grow on the
next four swept values of `n`.

This does **not** prove eventual constancy. The correct theorem targets
suggested by the data are:

1. a completion theorem `LOCAL_L2_PROVEN => GLOBAL`;
2. a persistence theorem `class present at n => class present at n+1`;
3. then a monotone carry-forward theorem upgrading
   `STABILIZED-EMPIRICAL` to `STABILIZED-PROVEN`.

## Artifacts

- Primary sweep artifacts:
  `census/multi_center/sweeps/l2_global_proven_n12_30.json`,
  `l2_global_proven_n21_30.json`,
  `l2_global_proven_n22.json`,
  `l2_global_proven_n23.json`,
  `l2_global_proven_n24.json`,
  `l2_global_proven_n25.json`,
  `l2_global_proven_n26.json`,
  `l2_global_proven_n27.json`,
  `l2_global_proven_n28.json`.
- Engine + state:
  `census/multi_center/multi_center_census.py`,
  `census/multi_center/analyze_sweeps.py`,
  `census/multi_center/frontier_report.py`,
  `census/multi_center/STATE.md`.

## Pending

The spec's CONJECTURED-tier appendix has not been run yet. The verdict in
this note is therefore the PROVEN-tier headline only.
