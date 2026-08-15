# Results

Status: `EMPIRICAL / DIAGNOSTIC`, dual-solver replay completed.

| case | Z3 | cvc5 | purpose |
|---|---|---|---|
| `main_nonalias` | SAT | SAT | nonalias exact-shell named-row escape |
| `alias_c0_q0` | SAT | SAT | alias arm retained |
| `allowed_two_b_fiber` | SAT | SAT | two canonical-cap sources in `b` fiber allowed |
| `regression_ui_notK_no_bfiber` | SAT | SAT | `ui ∉ K` does not imply blocker `b` |
| `malformed_c0_eq_c1` | UNSAT | UNSAT | rejects C-source duplicate |
| `malformed_duplicate_ui` | UNSAT | UNSAT | rejects duplicate witnesses |
| `malformed_third_intersection` | UNSAT | UNSAT | rejects third `K ∩ Cap` point |
| `malformed_three_b_fiber` | UNSAT | UNSAT | rejects three distinct cap sources in fiber `b` |

Independent readback validation passes for all four SAT models and status
agreement holds for all eight cases (`tests/test_wave.py`). Each SMT artifact
contains one check-sat. The SAT nonalias model uses an escape row with only two
points in `K`; this is the expected named-row escape mechanism. The alias model
is also SAT, so alias handling does not supply a cut.

No cardinality-independent cut emerged. The missing universal cut is a
producer/lift theorem showing that every relevant distinct-from-`b` selected
row is one of the asserted named rows (or otherwise forces an additional
source-faithful incidence with `K`). The current packet supplies neither that
coverage theorem nor a metric/order contradiction.

The UNSAT controls certify only their malformed finite clauses; they do not
certify the Lean theorem or the universal blocker-fiber producer.
