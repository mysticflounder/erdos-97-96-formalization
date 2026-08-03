# FreshThird v31 allowlist repair (2026-08-02)

Scope: scratch-only repair under
`scratch/retained-omission-e1/round5-general-cegar`. No production Lean or
theorem-bank files were edited.

## Failure audited

The v31 retry in `scratch/freshthird-cegar-v31-20260802.md` reached the v19
normalization lane and failed with:

```text
RuntimeError: frozen formula tracker allowlist mismatch:
missing=[], extra=['track_reverse_hit_two_center_sqdist_acute']
```

The new v31 encoding family correctly emits a tracked Boolean from
`v8.Encoding.make_solver`; the inherited v17 allowlist was simply not extended.

## Minimal fidelity-preserving repair

- `round5_cegar_v31.py:40,245-253`: import the shared v17 module and, only
  inside `_bound_v31_runtime`, bind
  `TRACKER_ALLOWLIST` to the inherited set union
  `{track_reverse_hit_two_center_sqdist_acute}`. The existing `finally` restore
  path restores the original object on normal and exceptional exits.
- `test_round5_cegar_v31.py:20,200-208`: add a focused regression test that
  checks the scoped union, exact tracker inventory from a v31 solver, and
  restoration after leaving the context.
- `schema_v31.json:37`: record the scoped tracker-allowlist contract.

This leaves the v31 semantic Boolean universe unchanged and does not modify the
frozen source summary, inherited v17 implementation, or production files.

## Focused gate

Command:

```text
uv run --project scratch/retained-omission-e1/round5-general-cegar --with pytest pytest -q scratch/retained-omission-e1/round5-general-cegar/test_round5_cegar_v31.py
```

Result: exit 0, `10 passed, 7 subtests passed in 100.38s`.

## Bounded authenticated retry canary

The authenticated v29 source summary was unchanged:

```text
scratch/retained-omission-e1/round5-general-cegar/artifacts-v29-c-full-nonapex-shell/20260802T210119.317640Z-retry-pid32065/summary.json
sha256 96bc41be3a625843ee5047df1ca08eaba49fa7d22d38f2471fb5ce9724c4a46d
```

Command (24 affected fresh cases, one worker, deliberately small budgets,
75-second wall bound):

```text
timeout 75s nice -n 15 uv run --project scratch/retained-omission-e1/round5-general-cegar python scratch/retained-omission-e1/round5-general-cegar/round5_cegar_v31.py retry --summary scratch/retained-omission-e1/round5-general-cegar/artifacts-v29-c-full-nonapex-shell/20260802T210119.317640Z-retry-pid32065/summary.json --semantic-bool-count 825 --workers 1 --timeout-ms 3000 --bool-timeout-ms 1000 --max-power-cuts 4 --max-power-candidates 1000 --max-bool-power-cuts 0 --max-bool-power-candidates 1 --max-assignments 1 --replay-timeout-ms 1000 --raw-probe-timeout-ms 0 --artifacts scratch/retained-omission-e1/round5-general-cegar/artifacts-v31-allowlist-repair-canary
```

Shell exit: `124` (wall timeout), not a solver terminal result. The run wrote
an authenticated invocation and the first case's assignment-journal record at:

```text
scratch/retained-omission-e1/round5-general-cegar/artifacts-v31-allowlist-repair-canary/20260803T041533.473037Z-retry-pid88456/
```

It produced no allowlist mismatch and no child `error` result before the bound;
the process was still working in the Boolean/normalization lane when stopped.
No `sat` or `unsat` claim is supported by this canary. The only log warning was
the multiprocessing resource-tracker semaphore cleanup after timeout, recorded
in `scratch/retained-omission-e1/round5-general-cegar/repair-logs/retry-canary.log`.

## Provenance after repair

The canary invocation records these current scratch-source hashes:

```text
round5_cegar_v31.py  d7d8b46b3803b1c0406f34e85bdbee779b280eec5bb508ead6c307aa35ee7ce7
schema_v31.json      5cd527f354f9da3665de55d687c7664ac1c1880504e25a7e4c0f461da10023e7
test_round5_cegar_v31.py cd2475a2e47377c91be6953297d89e2d5fdf98dcb3c20d1fdb640b09e8bb3175
```
