#!/usr/bin/env bash
set -euo pipefail

for seed in {0..23}; do
  uv run python \
    scratch/rigid221-blockerv-exact17-20260806/exact17_fullcover_cegar.py \
    --models 24 \
    --timeout-ms 30000 \
    --forbid-kalmanson \
    --forbid-two-circle-bisector \
    --forbid-three-shell-301-415-205 \
    --learn-bank-clauses \
    --learn-linear-clauses \
    --initial-patterns-glob \
      'scratch/rigid221-blockerv-exact17-20260806/direct1-shard-*.json' \
    --initial-patterns \
      scratch/rigid221-blockerv-exact17-20260806/linear-core-smoke.json \
    --seed "${seed}" \
    > "scratch/rigid221-blockerv-exact17-20260806/three-shell1-shard-${seed}.json" &
done

wait
