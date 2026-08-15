# FreshThird post-rich cut v3

This directory contains one bounded exact-17 CEGAR round for the aligned,
mutual, **direct-crossed** FreshThird constructor.  It treats
`../post_core_cut_v2/` as a frozen read-only predecessor and feeds the exact-six
rich-support theorem discovered from its minimized metric core back into
incidence selection before any coordinate solving.

The v2 aligned singleton/K4 cut remains active.  The new cut is generic over all
three cap indices and conditional on exact cap cardinality six.  In D44, the
opposite-apex selected K4 support restricted to the strict cap must equal one
of the two rich slices.  In S6, that projected support must be contained in the
single rich slice and contain at least two points.  The lower bound follows
because the selected support has four points in a six-point rich class and at
most two points of that class lie outside the strict cap.  The distinction
matters: the solver stores cap-interior
slices, not the full rich classes, so it never equates a four-point support
with a two-point D44 slice.

## Reproduction

From the repository root:

```bash
uv run python scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_rich_cut_v3/incidence_round.py --timeout 120
uv run python scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_rich_cut_v3/metric_round.py --timeout-ms 30000 --cvc5-timeout-ms 30000
uv run python scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_rich_cut_v3/verify.py
uv run python -m unittest discover -s scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_rich_cut_v3/tests
uvx ruff check scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_rich_cut_v3
```

Every SMT artifact has exactly one `check-sat`.  Incidence is checked by Z3,
cvc5, internal Z3 model extraction, and independent deterministic validation.
The v2 crossing assignment is retained as a malformed control.  Metric SAT
models are replayed by exact Z3 substitution and, when rational, a separate
`Fraction` evaluator.

## Scope

This is a diagnostic for one exact-17 incidence proposal in one crossed
orientation.  It does not cover the reversed crossed arm, the two deletion
arms, all exact-17 assignments, any other cardinality, or the universal live
Lean residual.  It therefore establishes neither a P97 counterexample nor a
Lean closure, regardless of the solver outcome.

See `INGRESS-CONTRACT.md` for the source ledger and `RESULTS.md` for the actual
round result.

## Recorded outcome

The incidence query is SAT in Z3 and cvc5, and its one extracted survivor
passes independent validation.  Both nonfirst exact-six caps take D44.  In the
shared-coordinate packet, the first external-Z3-plus-cvc5 UNSAT stage is
`blocker_exactness` with 1070 clauses.  Earlier `geometry_core` and
`cap_classification` Z3py SAT models pass exact substitution and independent
`Fraction` replay.  This rules out only the recorded frozen assignment; it is
not exact-17 coverage or universal closure.
