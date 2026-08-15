# FreshThird aligned retained direct-crossed exact-17 CEGAR round

This directory tests one exact-17 incidence proposal on one shared Euclidean
convex carrier. It is a diagnostic, not a Lean proof, a universal closure, or a
Problem 97 counterexample claim.

The round has three separate outcomes:

1. The original frozen assignment is **source-theoretically invalid**. It puts
   each canonical aligned source on a first-apex rich radius with another
   strict-cap point. Two independent three-clause cores reproduce that error.
2. After feeding back the source theorem and the stronger retained-radius
   coupling, the corrected exact-17 incidence abstraction is **SAT** in Z3 and
   cvc5 and passes its independent plain-Python verifier. Its first strict cap
   is exactly `P ∪ Pρ ∪ {C.firstSource, C.secondSource}`; the two cap endpoints
   complete the eight-point closed cap.
3. The corrected frozen assignment is **UNSAT** in both Z3 and cvc5 once the
   complete `named_rows_and_singletons` stage is added to the shared-coordinate
   packet. Earlier cvc5-only UNSAT results are not classified as joint results
   because Z3 timed out there. The 1,083-clause joint result is not minimized.

The broad direct-crossed incidence motif therefore survives the current cut,
but this corrected frozen realization does not. This says nothing about every
exact-17 assignment, other residual constructors, or general cardinality.

## Files

- `results.json`: canonical machine-readable round summary.
- `INGRESS-CONTRACT.md`: source-to-encoder contract and omissions.
- `RESULTS.md`: stage statuses, controls, and interpretation.
- `incidence_refine.py`: corrected incidence generator wrapper.
- `unified_metric.py`: staged shared-coordinate encoder and exact SAT replay.
- `refined_metric.py`: replay driver for the corrected assignment.
- `frozen_assignment_results.json`: detailed original-assignment rejection.
- `incidence_refinement_results.json`: corrected structural solve.
- `refined_metric_results.json`: corrected shared-coordinate staged solve.
- `generated/`: one-`check-sat` SMT artifacts and exported exact Z3 models.
- `logs/`: bounded solver and theorem-search logs.

## Reproduction

From this directory:

```bash
uv run python incidence_refine.py --timeout 60
uv run python refined_metric.py --timeout-ms 20000 --cvc5-timeout-ms 20000
uvx ruff check unified_metric.py incidence_refine.py refined_metric.py blocker_exactness_isolate.py tests
uv run python -m unittest discover -s tests -v
```

`blocker_exactness_isolate.py` is retained as a diagnostic helper. Its aborted
parallel run is not used in the verdict.
