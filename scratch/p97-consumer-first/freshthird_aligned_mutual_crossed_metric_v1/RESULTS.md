# Results

## Verdict

| Object | Exact status | Meaning |
|---|---|---|
| Original frozen incidence assignment | source-invalid; two minimized dual-solver three-clause contradictions | Rejected by the aligned singleton/multi-point-radius theorem and missing exact-rich coupling |
| Corrected incidence abstraction | Z3 SAT; cvc5 SAT; internal Z3 SAT; Python validation PASS | The direct-crossed incidence motif survives |
| Corrected frozen shared-coordinate packet | Z3 UNSAT; cvc5 UNSAT at `named_rows_and_singletons` | This one corrected exact-17 assignment has no encoded Euclidean realization |
| Universal or Lean closure | NONE | Other assignments, arms, cardinalities, and a lift remain uncovered |
| P97 counterexample | NONE | No complete source-faithful Euclidean model was produced |

The corrected assignment uses first-apex D44 slices `{7,9}` and `{10,12}`,
which are exactly Pρ and P respectively. Its first strict cap is exactly
`{7,9} ∪ {10,12} ∪ {0,1}`, where `{0,1}` are the two C sources; adding endpoint
apices `{14,16}` gives the complete eight-point closed cap. All three rich
apices choose D44.

## Corrected metric stages

| Stage | Clauses | Z3 | cvc5 | Exact SAT replay |
|---|---:|---|---|---|
| row equalities preflight | 136 | timeout | timeout | not run |
| geometry core | 705 | SAT | unknown | substitution PASS; Fraction PASS |
| cap classification | 756 | SAT | unknown | substitution PASS; Fraction PASS |
| K4 witness equalities | 824 | timeout | unknown | not run |
| selected support equalities | 892 | timeout | unknown | not run |
| exact rich radius pattern | 921 | timeout | UNSAT | not a joint verdict |
| full rich classes | 927 | timeout | UNSAT | not a joint verdict |
| blocker-image exactness | 1,070 | timeout | UNSAT | not a joint verdict |
| named rows and singleton slices | 1,083 | **UNSAT** | **UNSAT** | first joint UNSAT stage |

The joint core is not minimized. The 13 clauses newly introduced by the final
stage, and therefore the mandatory next theorem-bank search keys, are:

```text
singleton_positive_c_first
singleton_excludes_c_first_1
singleton_excludes_c_first_7
singleton_excludes_c_first_9
singleton_excludes_c_first_10
singleton_excludes_c_first_12
singleton_positive_c_second
singleton_excludes_c_second_0
singleton_excludes_c_second_7
singleton_excludes_c_second_9
singleton_excludes_c_second_10
singleton_excludes_c_second_12
canonical_source_radii_distinct
```

This list is the stage delta, not a minimized core. Any theorem mined from it
must be source-audited against the cumulative 1,070 earlier clauses.

## Controls

Each malformed control was rejected by both solvers:

- `refined_malformed_reversed_boundary`
- `refined_malformed_break_k4_equality`
- `refined_malformed_equal_rich_radii`
- `refined_malformed_break_singleton`

Every generated SMT artifact used in the verdict contains exactly one
`check-sat`. cvc5 was invoked independently with model checking enabled; Z3 SAT
models were replayed exactly rather than accepted numerically.

## Interpretation for the motif

The adjacent-grid/direct-crossed idea remains an incidence-level motif because
the corrected finite incidence generator is satisfiable. The original frozen
placement and the corrected frozen placement are both refuted for different
reasons. Therefore this round neither establishes a counterexample pattern nor
rules out the broader motif. The next justified move is theorem mining against
the 13-clause final-stage delta, followed by a source-level general producer;
it is not another claim of exact-17 or universal closure.
