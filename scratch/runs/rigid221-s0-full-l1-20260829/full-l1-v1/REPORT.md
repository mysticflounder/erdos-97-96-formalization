# Rigid221 S0 bounded L1 M0 canary — running

The governed two-cell computation was launched at
`2026-08-30T06:28:16Z` and was observed live under launcher PID `92665`
(Python PID `92719`, terminal session `82463`).

This run tests only the two source-mapped, fourteen-role, all-distinct M0
fixed-order cells `M0-I-v1` and `M0-N-v1`. It is not an exhaustive L1
partition. Other M0 cyclic orders, M1/M2 overlap families, legal center and
auxiliary equalities, and Moser endpoint-identification cells remain
`ENCODING_BLOCKED`.

Launch command:

```text
uv run python scripts/rigid221_s0_full_l1.py --output-dir scratch/runs/rigid221-s0-full-l1-20260829/full-l1-v1/artifacts/primary --workers 20 --timeout-ms 600000
```

The runner accepted a twenty-worker ceiling, but only two encoded cells exist,
so effective cell-level parallelism is at most two. Z3 is primary; cvc5 with
`--nl-cov` is the fallback after a Z3 `unknown` or timeout. The worst expected
wall time is about 20–21 minutes if both backends consume their full timeout.

No mathematical verdict is recorded while the job is running. In particular,
`full_L1_claim`, exhaustive UNSAT, source-universal, Lean, and promotion claims
remain false.
