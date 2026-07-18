# Interrupted nonnegative-CEGAR recovery

Status: **the earlier transient SAT did not reproduce**.  No exact `ALIVE`
artifact was recovered, so the `d -> d + 1` translation and full-triangle
replay are not applicable.

The authoritative replay is `replay_old_sequence.py --recompute-metric-each`
at the log-preserved crash boundaries:

- `sharesFirstAtSource`: first 721 local cuts; all 721 regenerated exact
  antecedents match the recorded clauses; the next leaf is exact nonnegative-K
  `UNSAT`.
- `sharesFirstAtTarget`: first 719 local cuts; all 719 regenerated exact
  antecedents match the recorded clauses; the next leaf is exact nonnegative-K
  `UNSAT`.

Artifacts:

- `sharesFirstAtSource.original-boundary.json`
  SHA-256 `f516dd91202757240850323819888c6acbc5a8cb5307293af4ae5ca392e1f676`
- `sharesFirstAtTarget.original-boundary.json`
  SHA-256 `4c9409cc1fe185a832864a1e817483fcb54d46a0f7ca74ab94feb6a5d67eb128`

Representative command (replace orbit, cut prefix, local bank, and output for
the target replay):

```bash
uv --cache-dir .uv-cache run python \
  scratch/atail-force/exact6-integrated-milp/recovery-agent/replay_old_sequence.py \
  --orbit sharesFirstAtSource \
  --global-bank scratch/atail-force/exact6-integrated-milp/global-cuts-1000.jsonl \
  --local-bank scratch/atail-force/exact6-integrated-milp/cegar-global-1000/sharesFirstAtSource/cuts.jsonl \
  --cut-prefix 721 \
  --recompute-metric-each \
  --seed scratch/atail-force/exact6-integrated-milp/continuationOrder.kalmanson-only.fixed-leaf-dual.json \
  --seed scratch/atail-force/exact6-integrated-milp/reverseContinuationOrder.kalmanson-only.fixed-leaf-dual.json \
  --seed scratch/atail-force/exact6-integrated-milp/sharesFirstAtSource.kalmanson-only.fixed-leaf-dual.json \
  --seed scratch/atail-force/exact6-integrated-milp/sharesFirstAtTarget.kalmanson-only.fixed-leaf-dual.json \
  --seed scratch/atail-force/exact6-integrated-milp/sharesSecondAtSource.kalmanson-only.fixed-leaf-dual.json \
  --seed scratch/atail-force/exact6-integrated-milp/sharesSecondAtTarget.kalmanson-only.fixed-leaf-dual.json \
  --seed scratch/atail-force/exact6-integrated-milp/fourDistinct.kalmanson-only.fixed-leaf-dual.json \
  --output scratch/atail-force/exact6-integrated-milp/recovery-agent/sharesFirstAtSource.original-boundary.json
```

The earlier `*.recovered.json` files used check/add replay only after another
process had extended the historical banks to 722/720 cuts.  The
`*.faithful-replay.json` files recomputed the metric oracle but also included
those new trailing cuts, hence their single clause mismatch.  The
`*.original-boundary.json` files pin the original 721/719 prefixes and have
zero mismatches; use only those for the recovery conclusion.

This is exact evidence about the current finite linear encoding, not a Lean
closure theorem and not a Euclidean/MEC result.
