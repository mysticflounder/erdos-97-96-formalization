<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Ordered-placement extension scan

Generated `2026-07-10T19:28:59.413647+00:00`.

This exhausts every ordered pair of distinct surplus-interior labels at
each scanned cardinality. It tests only full-center extension of the
fixed pin plus marked dangerous exact row. It does not repeat the audit
survival/confinement scan, encode coordinates, or encode the
source-indexed critical-shell system.

Row-type filter: `(0, 0, 2, 2)`, `(0, 2, 0, 2)`.

`SAT` is an incidence witness, not a Euclidean realization. `UNSAT` is
scoped to the declared shadow. Any node-capped search is reported as
`INDETERMINATE`.

## Summary

| n | ordered placements | dangerous SAT | UNSAT | INDETERMINATE | zero-extension types |
|---:|---:|---:|---:|---:|---|
| 13 | 30 | 0 | 1800 | 0 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |

Types with zero extension at every scanned cardinality and placement: `(0, 0, 2, 2)`, `(0, 2, 0, 2)`

## Placements

| n | source -> q | dangerous SAT/total | zero-extension types |
|---:|---|---:|---|
| 13 | 3 -> 4 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 3 -> 5 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 3 -> 6 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 3 -> 7 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 3 -> 8 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 4 -> 3 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 4 -> 5 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 4 -> 6 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 4 -> 7 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 4 -> 8 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 5 -> 3 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 5 -> 4 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 5 -> 6 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 5 -> 7 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 5 -> 8 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 6 -> 3 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 6 -> 4 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 6 -> 5 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 6 -> 7 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 6 -> 8 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 7 -> 3 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 7 -> 4 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 7 -> 5 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 7 -> 6 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 7 -> 8 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 8 -> 3 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 8 -> 4 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 8 -> 5 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 8 -> 6 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
| 13 | 8 -> 7 | 0/60 | `(0, 0, 2, 2)`, `(0, 2, 0, 2)` |
