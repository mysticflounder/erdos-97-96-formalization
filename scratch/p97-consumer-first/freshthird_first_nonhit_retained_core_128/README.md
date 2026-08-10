# FreshThird first-nonhit retained-core 128

This package runs the finite structural wave

`2 FreshThirdCapSourceNonHit × 4 FreshThirdCapSourceInteraction × 16 raw retained endpoint choices = 128`.

The common-endpoint omission predicate is reported as a derived conditional
tag. It is not asserted as universal ingress, so all 16 raw endpoint choices
are retained for every constructor pair. The encoding is QF_LIA and contains
only Boolean/integer structural guards. It makes no metric, Euclidean,
universal-lift, counterexample, or Lean-closure claim.

Run with the repository-managed environment:

```text
uv run python scratch/p97-consumer-first/freshthird_first_nonhit_retained_core_128/run_wave.py --smoke-only
uv run python scratch/p97-consumer-first/freshthird_first_nonhit_retained_core_128/run_wave.py
uv run python scratch/p97-consumer-first/freshthird_first_nonhit_retained_core_128/verify_readback.py
```

The runner requires both Z3 and cvc5 and fails closed on unavailable,
unknown, malformed, timeout, or disagreeing statuses.
