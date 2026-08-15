# FreshThird five-survivor named metric v3

Scratch-only producer-discovery lane for the two five-row deletion arms of
`FreshThirdAlignedDistinctBlockerFirstCapResidual`.

This lane is deliberately narrower than a closure attempt:

- it reuses the corrected exact-17 alias-aware finite ingress from v2;
- it adds only source-traced shared-coordinate geometry and named row-circle
  equations;
- it does **not** encode `FiveRowCircleIntersectionOrderCore`, because no
  complete source-entitled role map exists;
- it makes no universal, counterexample, or Lean-closure claim.

Run the deterministic ingress controls and the first source-faithful metric
probe with:

```bash
uv run python scratch/p97-consumer-first/freshthird_five_survivor_named_metric_v3/run_named_metric.py
uv run python -m unittest discover \
  -s scratch/p97-consumer-first/freshthird_five_survivor_named_metric_v3 \
  -p 'test_*.py'
```

See `SOURCE-MAP.md`, `CORE-MAP-AUDIT.md`, and `RESULTS.md` for scope.

