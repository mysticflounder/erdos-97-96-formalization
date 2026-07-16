# Current producer-bank bi-apex continuation refresh

Status: complete; pinned checks pass.

## Purpose

The cap-bound checkpoint in
`../biapex-continuation-shadow-audit/selected_row_own_cap_bound_refresh_1m_retry_checkpoint.json`
was produced before the current `census/atail_force/producer_bank.py` matcher
surface.  This lane keeps that file immutable and reruns every one of its 23
fixed `(5,5,5)` domain slices.  No saved survivor is reused.

The hard complete-leaf gate calls
`producer_bank.scan_all_formalized_cores`; the established metric-core prefix
gate, the proved selected-row own-cap cuts, and the older equilateral-hinge
leaf check remain active.  The checkpoint pins the source artifact and every
local source consumed by the run.

## Required bank preflight

The general-n registries and indexed Lean corpora were searched before the
rerun.  They recover the known bounded contradiction consumers, including the
U1 two-large-cap obstruction, but no theorem that bypasses the missing K-A
producer.  This regeneration is therefore synchronization/theorem-discovery
work, not a replacement proof.

Before solving, the broader gate was replayed on all 11 SAT witnesses in the
old checkpoint.  The smoke test passed its pinned regression split:

- rejected as stale: zero-based shards `10, 12, 13, 15, 21`;
- accepted by every current gate: `0, 1, 2, 3, 16, 20`.

The new run nevertheless reruns both sets.  Acceptance of an old witness is
not used as a reuse shortcut.

## Result

The independently regenerated 100,000-node split is:

- `SAT`: 10 shards (`0, 1, 2, 3, 10, 12, 13, 15, 16, 20`);
- `INDETERMINATE`: 13 shards (`4, 5, 6, 7, 8, 9, 11, 14, 17, 18, 19, 21, 22`);
- `UNSAT`: 0 shards;
- errors: 0;
- stored DFS nodes: `1,838,367`;
- complete leaves sent through the broader bank: `27,535`.

The old stale witnesses at `10, 12, 13, 15` were rejected, but the rerun found
later bank-clean SAT witnesses in those slices.  Old shard `21` had required a
one-million-node retry; under the current bank its fresh 100,000-node slice is
indeterminate.  Consequently the current exact bounded conclusion remains
`SAT_FINITE_SHADOW_ONLY`, not an all-shard exclusion.

Every fresh SAT survivor was replayed after solving against the full current
producer bank, the legacy equilateral-hinge check, and every proved cap cut;
all 10 passed.  The analyzer also injects one cap-bound-violating mutation per
SAT witness; all 10 mutations were detected.  Together with the pinned stale
dirty/clean split above, these are the gate-regression checks.

## All strict-pair grids

The 10 fresh SAT survivors contain 12 strict-pair grids (shard `20` contributes
three; every other survivor contributes one).  The exhaustive grid audit has:

- deficit histogram: `{1: 12}`;
- direct outside-pair terminals: `0`;
- every existential best deficit: `1`;
- every universal worst deficit: `1`.

Thus the synchronized bank changes individual forward/reverse grid patterns
but does not change the robust empirical signal: every fresh grid is exactly
one continuation-row membership short of the outside-pair terminal.  This is
the same missing K-A ingredient, not a closure.

Forward-grid patterns are four identity alternations, two swap alternations,
five one-edge grids, and one same-column grid.  Reverse-grid patterns are one
identity alternation, four swap alternations, five one-edge grids, one
same-column grid, and one empty grid.  The second-pair cross relation is mutual
once and one-way in the other 11 grids.  The complete per-grid records are in
`current_producer_bank_grid_analysis.json`.

No selective high-budget retry was launched: the broader gate already visited
27,535 complete leaves, and raising one of 13 capped slices cannot make the
aggregate decisive while the other 12 remain indeterminate.  Such a retry is
not cheap closure work.

## Pinned artifacts and replay

- refresh checkpoint SHA-256:
  `02a3a92b6241d42841bdbbacfe35005e55b0cd609ce981ab381945c98eba8a66`;
- all-grid analysis SHA-256:
  `c0ad7b01207516719f80f9f996c70d0a5b1b2d24e859cf22db04012f32e7d5ce`;
- immutable comparison checkpoint SHA-256:
  `ad2400da59782d38d0952a9c31ae448bd30f86a110239bcca4687b538bc09fe9`.

Replay from the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/biapex-continuation-current-bank-refresh/refresh.py \
  --smoke-source
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/biapex-continuation-current-bank-refresh/refresh.py \
  --workers 12 --max-nodes 100000
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/biapex-continuation-current-bank-refresh/analyze.py \
  --check --output
```

## Rigor boundary

Even a complete all-UNSAT result would be exact only within one fixed-label,
card-12 `(5,5,5)` finite-incidence placement.  A SAT record is not a Euclidean
realization; an indeterminate record is only a node-cap outcome.  This lane
does not cover card 11 or arbitrary cardinality and does not itself prove or
refute the live K-A producer.
