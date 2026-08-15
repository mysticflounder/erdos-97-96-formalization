# FreshThird post-core cut v2

This directory contains one bounded exact-17 CEGAR round for the aligned,
mutual, **direct-crossed** FreshThird constructor.  It starts from the completed
metric-core minimization in `../core_minimization/` and feeds the discovered
source-clean singleton constraint back into incidence selection before any
coordinate solving.

The refinement is generic in the two aligned canonical sources.  For each of
`c_first` and `c_second`, a chosen first-apex K4 support that contains that
source is forbidden from containing any other strict-first-cap point.  The old
assignment is retained only as a negative validator control: its first-apex
support `{0,4,10,15}` contained `c_first = 0` and the distinct strict-cap point
`10`.

## Reproduction

From the repository root:

```bash
uv run python scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_core_cut_v2/incidence_round.py --timeout 120
uv run python scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_core_cut_v2/metric_round.py --timeout-ms 30000 --cvc5-timeout-ms 30000
uv run python scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_core_cut_v2/verify.py
uv run python -m unittest discover -s scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_core_cut_v2/tests
uvx ruff check scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_core_cut_v2
```

Every SMT artifact has exactly one `check-sat`.  Incidence is checked by Z3,
cvc5, internal Z3 model extraction, and the parent deterministic assignment
validator extended with the new cut.  Metric SAT models are replayed by exact
Z3 substitution and, when rational, a separate `Fraction` evaluator.

## Scope

This is a diagnostic for one exact-17 incidence proposal in one crossed
orientation.  It does not cover the reversed crossed arm, the two deletion
arms, all exact-17 assignments, any other cardinality, or the universal live
Lean residual.  It therefore establishes neither a P97 counterexample nor a
Lean closure, regardless of the solver outcome.

See `INGRESS-CONTRACT.md` for the source ledger and `RESULTS.md` for the actual
round result.
