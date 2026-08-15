# FreshThird FirstNonHit exact-three metric canary v1

This is one bounded diagnostic QF_NRA feasibility test for the supplied exact-17,
exact-three FirstNonHit incidence survivor. It encodes exactly the 13 selected
four-point row equidistance packets, a sound similarity gauge, and exact pairwise
point distinctness. It does not enumerate orders or structural signatures.

The verdict is restricted to the fixed finite packet. It is not a P97
counterexample, a universal theorem, a finite-to-universal lift, or a Lean
closure result.

Run only after checking `manifest.prelaunch.json`:

```bash
uv run --with z3-solver python \
  scratch/p97-consumer-first/freshthird_firstnonhit_exact3_metric_canary_v1/run_canary.py
```
