#!/usr/bin/env bash
set -euo pipefail

project_root=/Users/adam/projects/math-projects/erdos-97-96-formalization
benchmark="$project_root/scratch/rigid221-sourceheavy-anchor/exact12-v14-wave-e5f1579d-source23-seeded-plus100-c0000-0011-r1/benchmark_static_duplicate_center_encoding.py"
wave_root="$project_root/scratch/rigid221-sourceheavy-anchor/exact12-v14-source31-static-all-cells-r2"
seed_root="$project_root/scratch/rigid221-sourceheavy-anchor/exact12-v14-source31-migrated-journals-r1"

if [[ -e "$wave_root" ]]; then
  echo "refusing to overwrite existing wave: $wave_root" >&2
  exit 1
fi
mkdir -p "$wave_root"

declare -a pids=()
for cell in {0..11}; do
  printf -v padded_cell '%04d' "$cell"
  seed="$seed_root/cell-$padded_cell/journal.jsonl"

  "$project_root/.venv/bin/python" "$benchmark" \
    --source-root "$project_root" \
    --cell "$cell" \
    --workdir "$wave_root/cell-$cell" \
    --seed-journal "$seed" \
    --include-base-equality-obstructions \
    --timeout-seconds 600 \
    --nice 10 \
    >"$wave_root/cell-$cell.log" 2>&1 &
  pids+=("$!")
done

status=0
for pid in "${pids[@]}"; do
  wait "$pid" || status=1
done
exit "$status"
