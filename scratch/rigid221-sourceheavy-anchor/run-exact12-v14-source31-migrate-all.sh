#!/usr/bin/env bash
set -euo pipefail

project_root=/Users/adam/projects/math-projects/erdos-97-96-formalization
migration_root="$project_root/scratch/rigid221-sourceheavy-anchor/exact12-v14-source31-migrated-journals-r1"

if [[ -e "$migration_root" ]]; then
  echo "refusing to overwrite existing migration: $migration_root" >&2
  exit 1
fi
mkdir -p "$migration_root"

pids=()
for cell in {0..11}; do
  printf -v padded_cell '%04d' "$cell"
  case "$cell" in
    6)
      source="$project_root/scratch/rigid221-sourceheavy-anchor/exact12-v14-source25-mixedv6-cell6-r1/journal.jsonl"
      ;;
    9)
      source="$project_root/scratch/rigid221-sourceheavy-anchor/exact12-v14-source24-mixedv6-cell9-r1/journal.jsonl"
      ;;
    *)
      source="$project_root/scratch/rigid221-sourceheavy-anchor/exact12-v14-source25-other-cells-r1/cell-$padded_cell/journal.jsonl"
      ;;
  esac

  cell_root="$migration_root/cell-$padded_cell"
  mkdir -p "$cell_root"
  (
    cd "$project_root"
    exec "$project_root/.venv/bin/python" -m \
      census.card_head.exact12_v14_journal_migrate \
      --repo-root "$project_root" \
      --source "$source" \
      --output "$cell_root/journal.jsonl" \
      --cell-index "$cell"
  ) >"$cell_root/migration-receipt.json" \
    2>"$cell_root/migration.log" &
  pids+=("$!")
done

status=0
for pid in "${pids[@]}"; do
  wait "$pid" || status=1
done
exit "$status"
