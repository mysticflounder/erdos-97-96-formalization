# Corrected FreshThird core source map

This map is for the frozen corrected exact-17 assignment only. It records a
theorem-discovery cut, not a Lean theorem or a universal P97 conclusion.

## Exact surviving constraints

Write

```text
R(p) = (x_13 - x_p)^2 + (y_13 - y_p)^2.
```

The deletion-minimal core consists of exactly these two constraints:

| Clause | Encoder stage | Licensed source meaning | Frozen-instance formula |
|---|---|---|---|
| `k4_equal_13_10` | `k4_witness_equalities` | `D.K4` gives a four-witness common-radius row at center/first apex `13`. The frozen support is `{0,4,10,15}`, with base `0 = c_first`. | `R(10) = R(0)` |
| `singleton_excludes_c_first_10` | `named_rows_and_singletons` | `firstApexRadius_eq_singleton_of_aligned` says the `c_first = 0` radius slice in the strict first-cap interior is the singleton `{0}`. Since `10` is a distinct strict first-cap point, it is excluded. | `R(10) != R(0)` |

The first cap is `{0,1,7,9,10,12,14,16}` and its two other apices are
`14,16`, so `10` is indeed in its strict interior. The two formulas are direct
syntactic opposites after simplification. They are the only direct-opposite
pair among all 1,083 formulas in the canonical terminal query.

No convex-order, cap-geometry, selected-support, rich-class, full-rich-class,
or blocker-exactness clause survives clause minimization.

## Source-local named packets

For a semantically grouped replay, the exact two clauses are embedded in:

- `first_apex_k4_row_packet` (4 clauses): positivity and the three non-base
  equalities for the K4 row at center `13`;
- `aligned_c_first_singleton_packet` (6 clauses): positivity and the five
  strict-first-cap exclusions for `c_first = 0`.

Their union is UNSAT in Z3 and cvc5. Either packet alone is SAT in both, so
this is deletion-minimal at the named-packet level as well.

## Candidate reusable cut

The computational result suggests an incidence-level preflight rule:

> In the aligned singleton branch, any first-apex K4 row containing
> `c_first` must omit every other strict-first-cap point.

This is a direct consumer of the aligned singleton theorem, not a new metric
obstruction. It should be imposed before proposing K4 supports. For this
assignment, the forbidden co-occurrence is `c_first = 0` with point `10` in
`point_k4_rows[13]`.

This rejects one abstract exact-17 candidate. It is not a P97 counterexample;
it is a counterexample to the completeness of the incidence proposal's
preflight constraints.
