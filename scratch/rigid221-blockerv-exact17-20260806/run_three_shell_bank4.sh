#!/usr/bin/env bash
set -euo pipefail

for seed in {0..23}; do
  uv run python \
    scratch/rigid221-blockerv-exact17-20260806/exact17_fullcover_cegar.py \
    --models 24 \
    --timeout-ms 30000 \
    --forbid-kalmanson \
    --forbid-two-circle-bisector \
    --forbid-three-shell-bank \
    --learn-bank-clauses \
    --learn-linear-clauses \
    --initial-patterns-glob \
      'scratch/rigid221-blockerv-exact17-20260806/three-shell-bank3-shard-*.json' \
    --seed "${seed}" \
    > "scratch/rigid221-blockerv-exact17-20260806/three-shell-bank4-shard-${seed}.json" &
done

wait
