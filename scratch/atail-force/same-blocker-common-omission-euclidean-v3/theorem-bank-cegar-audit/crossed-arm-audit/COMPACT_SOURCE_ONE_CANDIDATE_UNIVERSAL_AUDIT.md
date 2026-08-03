# Compact source one-candidate universal audit

Date: 2026-08-01

## Verdict

**No new universal/general-`n` candidate.**  The one compact-representation
candidate produces only instances of registered theorem and structural
families.  It is exact fixed-`n` benchmark evidence, not a general theorem.

## Exact normalization

The legacy source checkpoint has 228,898 theorem keys and 9,082 structural
keys.  Compact import suppresses exactly:

- 38,707 `reversed_second` keys as exact rotated-`first` orbit duplicates;
- 6,195 subsumed selected-row keys: 3,973
  `six_sparse_two_selected_rows` and 2,222
  `five_kalmanson_three_selected_rows`.

Hence `38,707 + 6,195 = 44,902` suppressed keys and
`228,898 - 44,902 = 183,996` imported theorem keys.  No imported or newly
matched key was retired.  The candidate then adds 26 encoded theorem keys and
3 structural keys, giving exactly 184,022 theorem and 9,085 structural keys.

## Single-candidate classification

The three structural keys are existing `raw_btw_sep` instances:

`(1,6,14,16)`, `(1,13,3,14)`, and `(3,13,10,12)`.

The 27 theorem matches are:

| registered family | matches | encoded fresh |
|---|---:|---:|
| `convex_five_point_core` | 5 | 5 |
| `second` | 5 | 5 |
| `kalmanson_012_325_415` | 5 | 5 |
| `four_endpoint_centers_bisect_middle_pair` | 2 | 2 |
| `kalmanson_012_124_314` | 2 | 2 |
| `kalmanson_013_235_415` | 2 | 2 |
| `six_sparse_row_equalities` | 2 | 2 |
| `five_second_three_row_equalities` | 1 | 1 |
| `kalmanson_013_412_523` | 1 | 1 |
| `six_k2_three_row_triangle` | 1 | 1 |
| `six_sparse_two_selected_rows` | 1 | 0 (subsumed) |
| **total** | **27** | **26** |

No family is newly activated or unregistered, so no theorem registry/index
search was needed.

## Status and trust boundary

The compact artifact uses `critical_no_K4_representation = compact-pb` while
the imported legacy checkpoint records `triple-clauses`.  It stops deliberately
after one SAT candidate with `UNKNOWN_ITERATION_LIMIT` in 8,831 ms; this is not
an UNSAT result.  Its recorded scope is Boolean incidence/order at `n = 17`,
profile `(6,8,6)`.  It has no semantically replayed SAT witness, checked UNSAT
certificate, Lean kernel proof, universal-`n` claim, or Euclidean/QF_NRA and
full `CounterexampleData` geometry.

This audit made no code edit, build, solver/CEGAR run, kernel check, or commit.
