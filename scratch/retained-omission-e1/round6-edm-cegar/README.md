# Round 6: four-point EDM CEGAR smoke

This lane extends the frozen round-5 schema-v3 exact-`n = 15` target runner
with the balanced four-point conditional-negative-type inequalities for
squared Euclidean distances.  It is target-specific external solver evidence,
not a Lean proof and not a general-`n` search.

The wrapper refuses to run if the round-5 base runner no longer has SHA-256
`451aae82966ddea02fa81da2d656415cf4e942e9ba7b2eefc96c915f7d62e857`.
Every invocation records the live base-runner, base-schema, base-lock,
overlay-schema, and wrapper hashes.

For a four-set partitioned as positive pair `{p0,p1}` and negative pair
`{n0,n1}`, the added inequality is

```text
s(p0,p1) + s(n0,n1)
  <= s(p0,n0) + s(p0,n1) + s(p1,n0) + s(p1,n1).
```

It is `b^T S b <= 0` for `b = (+1,+1,-1,-1)`, after cancelling a factor of
two.  For actual points it follows from
`b^T S b = -2 * ||sum_i b_i x_i||^2`.  There are three partitions per
four-subset, hence `3 * C(15,4) = 4095` added linear inequalities.

The schema-v3 implication
`d(c,x) = d(c,y) -> s(c,x) = s(c,y)` is retained.  The encoding deliberately
does **not** assert the nonlinear relation `s = d^2`; actual Euclidean points
still map into the relaxation by assigning each independent `s` variable its
true squared distance.

Run the structural self-test and then the two fixed DDD probes with:

```bash
uv run --project scratch/retained-omission-e1/round5-general-cegar \
  python scratch/retained-omission-e1/round6-edm-cegar/round6_edm_cegar.py \
  self-test

uv run --project scratch/retained-omission-e1/round5-general-cegar \
  python scratch/retained-omission-e1/round6-edm-cegar/round6_edm_cegar.py \
  smokes --workers 2 --timeout-ms 300000
```

The runner rejects more than two workers for this two-case command, configures
each Z3 instance with one thread, and caps every case at 300 seconds.
