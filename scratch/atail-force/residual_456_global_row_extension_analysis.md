# `(4,5,6)` residual plus one global K4 row

Date: 2026-07-13

## Verdict

Adding one selected four-class at any one of the missing centers `4` through
`11` does **not** close the exact four-row residual with the current
kernel-backed core bank or equality-ideal oracle.

Every center has many locally admissible selected-row candidates that survive
the complete existing formalized-core scanner.  At every center, the first
tested scanner survivor has a proper normalized equality ideal according to
msolve in both variable orders.  Six of the eight are fully
`CROSSCHECKED_NONUNIT` by Singular plus both msolve orders; at centers `4` and
`5`, Singular times out while both msolve orders report `NONUNIT`.

This is a bounded negative result about a **single** additional global row.  It
does not construct a real convex extension, a full `FaithfulCarrierPattern`,
or a target-faithful live counterexample.

## Interface audited

The fixed exact critical rows are

```text
0 : {1,3,4,5}
1 : {0,2,5,6}
2 : {1,7,8,9}
3 : {0,7,10,11}
```

For each missing center, supports were enumerated with
`multi_center_census.cached_candidate_lists((4,5,6), PROVEN_ROWS)`.  The new
row was passed to the metric layer with `exact = false`, matching
`SelectedFourClass`/`FaithfulCarrierPattern`; only the four critical rows were
kept exact.

The formalized scan combined
`metric_realizability_probe._formalized_metric_core` with the production
`NestedEqualChordCore` matcher and enabled the extended and ordered banks.

## Complete one-row formalized-core census

| Center | Locally admissible | Duplicate-center kills | Exact-off-circle kills | Nested-chord kills | Formal survivors |
|---:|---:|---:|---:|---:|---:|
| 4 | 301 | 89 | 38 | 0 | 174 |
| 5 | 283 | 89 | 46 | 0 | 148 |
| 6 | 283 | 75 | 32 | 0 | 176 |
| 7 | 283 | 74 | 45 | 36 | 128 |
| 8 | 268 | 79 | 28 | 0 | 161 |
| 9 | 268 | 79 | 28 | 0 | 161 |
| 10 | 268 | 79 | 50 | 0 | 139 |
| 11 | 268 | 79 | 50 | 0 | 139 |

No center is even close to being exhausted by one reusable formalized core.
The only center at which the new nested equal-chord consumer contributes is
`7`, where it removes 36 candidates but leaves 128.

## Exact equality survivors

The following selected rows survive the formalized scan and have `NONUNIT`
results from msolve in both the forward and reverse coordinate-variable
orders:

| Center | Selected support | Full three-engine policy |
|---:|:---|:---|
| 4 | `{0,5,7,8}` | `TIMEOUT, NONUNIT, NONUNIT` |
| 5 | `{0,1,4,8}` | `TIMEOUT, NONUNIT, NONUNIT` |
| 6 | `{0,2,3,4}` | `NONUNIT, NONUNIT, NONUNIT` |
| 7 | `{0,1,4,8}` | `NONUNIT, NONUNIT, NONUNIT` |
| 8 | `{0,1,3,6}` | `NONUNIT, NONUNIT, NONUNIT` |
| 9 | `{0,1,3,6}` | `NONUNIT, NONUNIT, NONUNIT` |
| 10 | `{0,1,4,6}` | `NONUNIT, NONUNIT, NONUNIT` |
| 11 | `{0,1,4,6}` | `NONUNIT, NONUNIT, NONUNIT` |

Here the full-policy tuple is ordered as Singular, msolve-forward,
msolve-reverse.  `NONUNIT` is an exact-CAS proper-ideal result, but a proper
complex equality ideal does not imply a distinct real solution or the saved
strict convex order.

A one-start strict-convex SLSQP probe did not find a real witness for any of
these eight rows.  The attempts did not reach small equality residuals, so
this is optimizer failure/undecided, not evidence of real infeasibility.

## Theorem-bank preflight

Before considering a new Lean core, the required sibling/legacy registries
and indexed Lean corpora were searched for five-row selected-class, exact-row,
and one-additional-K4 contradictions.  The searches returned the existing
`FaithfulCarrierPattern` constructors, `GeometryBridge.ofGlobalK4`, cap/shell
cardinality material, and the already scanned metric cores.  No reusable
five-row theorem matching one of the survivors appeared.  Accordingly, this
analysis introduces no new Lean core.

## Consequence for closure

The global-K4 failure of the exact residual is load-bearing, but restoring it
one center at a time is too weak.  The next bounded test should be one of:

1. add two global rows jointly and search specifically for the four
   `GlobalNestedPairFields` memberships;
2. impose the common MEC disk inequality before expanding the row bank; or
3. add the cap/full-filter alignment encoded by `URowCapMultiplicityFields`.

The single-row census rules out spending proof effort on a theorem saying
that *every* selected row at one particular missing center is already killed
by the current reusable bank.

## Replay

The analysis driver is
`scratch/atail-force/residual_456_global_row_extension.py`.  The reported run
used:

```bash
UV_CACHE_DIR=/tmp/uv-cache PYTHONDONTWRITEBYTECODE=1 \
  uv run python scratch/atail-force/residual_456_global_row_extension.py \
  --starts 1 --candidate-budget 4
```

The candidate enumeration is exhaustive at each center.  Equality-oracle and
numerical work stops after the first two-order `NONUNIT` survivor, which was
the first scanner survivor in all eight cases.
