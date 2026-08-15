# FreshThird five-survivor named metric v4

This scratch lane is a finite exact-17 producer-discovery experiment.  It
extends the corrected alias-aware v2 ingress by two public closed-cap endpoint
facts: `C3` and `C4` lie in the first closed cap, while `Q0` and `Q1` lie
outside it.  The four endpoint/outside inequalities are consequently explicit.

The runner covers all eight tags (two orientations, two deleted Q points, and
two retained first-apex radii).  For each tag it obtains and independently
validates one structural survivor, then freezes that survivor and asks three
shared-coordinate feasibility questions:

1. convex/MEC/first-cap baseline;
2. baseline plus named equal-distance rows;
3. named rows plus exact off-support inequalities only for source-exact
   canonical shells and the actual blocker-image row.

The run is serial (one solver process at a time).  Z3 and cvc5 replay identical
SMT-LIB inputs.  Rational Z3 models are checked by a separate `Fraction`
validator.  Any Z3 UNSAT is minimized by group and atom and replayed with cvc5.
The deterministic stage bounds are 8 seconds for baseline, 12 seconds for
named rows, and 20 seconds for exact off-support.  A timeout is reported as
inconclusive, never as SAT or UNSAT.

The `FiveRowCircleIntersectionOrderCore` hard gate remains closed.  No complete
source map supplies all ten `EdgeClosure` premises or either complete
orientation packet, so none is encoded.  Crossed-three-row constructors are
also out of scope.

Run:

```bash
uv run python scratch/p97-consumer-first/freshthird_five_survivor_named_metric_v4/run_wave.py --smoke-only
uv run python scratch/p97-consumer-first/freshthird_five_survivor_named_metric_v4/run_wave.py
uv run python scratch/p97-consumer-first/freshthird_five_survivor_named_metric_v4/audit_cvc5_unsat.py
uv run python -m unittest discover -s scratch/p97-consumer-first/freshthird_five_survivor_named_metric_v4 -p 'test_*.py'
uvx ruff check scratch/p97-consumer-first/freshthird_five_survivor_named_metric_v4/run_wave.py scratch/p97-consumer-first/freshthird_five_survivor_named_metric_v4/audit_cvc5_unsat.py scratch/p97-consumer-first/freshthird_five_survivor_named_metric_v4/test_wave.py
```

This lane does not enumerate all survivors in a tag.  SAT classifies only the
frozen motif; UNSAT classifies only the emitted frozen motif and stage.  Neither
is a P97 counterexample, a universal theorem, or Lean closure.
