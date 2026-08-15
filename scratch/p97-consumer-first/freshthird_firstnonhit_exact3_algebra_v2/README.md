# FreshThird FirstNonHit exact-three algebra probe v2

This is a Class-C instrument-change successor to
`freshthird_firstnonhit_exact3_metric_canary_v1`. It decides whether the
byte-equivalent 13-row equal-distance packet, after the same sound gauge
`p0=(0,0), p1=(1,0)`, is empty over the complex numbers.

The probe expands the 39 quadratic equal-distance equations explicitly and
adds the four gauge equations. It deliberately omits all distinctness and
positivity inequalities. Therefore:

- a cross-engine unit-ideal result eliminates the larger complex equality
  variety, hence also every real pairwise-distinct realization of this fixed
  packet;
- a non-unit ideal is not a real witness and does not even establish a real
  point;
- a timeout, parse failure, nonzero return code, or engine disagreement is
  `UNKNOWN`.

The driver is frozen one-shot. It creates `RUN_ONCE.guard` before any generated
input or solver call and refuses to overwrite any output. Inspect
`manifest.prelaunch.json`, then run exactly once:

```bash
uv run python \
  scratch/p97-consumer-first/freshthird_firstnonhit_exact3_algebra_v2/run_probe.py
```

This finite algebra result is not a P97 counterexample, universal theorem,
finite-to-universal lift, Lean theorem, or proof-spine closure.
