# Exact-five profile 0034 seven-order coverage: postrun audit

Date: 2026-09-04

## Result

The successor PIQD run
`exactfive-profile0034-seven-order-coverage-piqd-r2-20260904/run-0001`
completed its bounded computation and passed independent postrun replay. All
212 selected parent profiles have verified terminal trees: 181 returned
`SAT/SAT`, 21 returned `SAT/UNKNOWN`, and 10 returned `UNSAT/UNSAT`. The run
contained 4,665 custody artifacts and completed in 297 seconds of wall time.

The positive and negative controls returned `SAT/SAT` and `UNSAT/UNSAT`.
All 202 profiles that were SAT in the parent remain SAT after excluding every
admissible direct and reversed seven-role cycle using `c1`, one of `p,q`, one
of `s,t`, `a`, `d`, `c2`, and `O`. Profile 0034 is SAT/SAT in this coverage
cell, so the order/equality abstraction does not force the target chain.

## Custody and replay

The predecessor run failed before any solver session or solver artifact was
created because its nested artifact category directories were absent. Its
failure evidence remains immutable. The successor run was independently
replayed with transport and query execution disabled and returned PASS for all
212 trees.

The successor custody hashes are:

| Record | SHA-256 |
|---|---|
| Run manifest | `d665a82dd12ae7be8d3ace2f2d1d524efac8d3eae0e43baf0d73edb31a6580cc` |
| Launch record | `b46743497e22c1f982673c6c6fc541b39603d12d4d733f069e02d59d40f3dcd2` |
| Terminal record | `c764c8db500b48262bd1aa1a109d9194f5c6599cc5b261af73c9bdf44d96ee81` |

The replay checked 214 source manifests, 856 snapshots, and all 4,665
custody files. It accepted 385 SAT semantic replays, including 383 coverage-
query replays. The compact machine-readable record is
`docs/computation/exactfive-profile0034-seven-order-coverage-20260904/run-0001-summary.json`.

## Witness orders

The profile-0034 SAT/SAT cell has these two authenticated witness orders:

```text
Z3:   U=c1 < p < a < s < d < c2 < q=e < O < y < x < v < t < u
cvc5: U=c1 < s < y < p < t < u < x < v < O < q=e < c2 < d < a
```

The false control claims remain false under the terminal replay. This result
tests only the abstract order/equality coverage layer; it does not establish
Lean source exhaustiveness, Euclidean realization, a theorem, promotion, or
closure.

## Completed-wave mine

The 10 dual-UNSAT profiles were already `UNSAT/UNKNOWN` in the parent. They
therefore provide no new universal theorem candidate. The only universal rank
fact extracted from the completed wave is the anchor `U` having rank zero.
The row-pair extraction work has already landed at commit `6964ca328`.

## Next boundary

The highest-value next bounded computation is a source-faithful planar
QF_NRA canary with fixed orders for the two profile-0034 witnesses above.
This should run before attempting Lean alias exhaustiveness. A surviving
planar cell would justify adding geometric constraints; an empty cell would
only refute that fixed-order realization and would not by itself close the
source branch.
