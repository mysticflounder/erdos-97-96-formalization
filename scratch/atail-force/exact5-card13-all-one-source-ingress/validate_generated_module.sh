#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "usage: $0 LEAN_PATH OUTPUT_DIR SOURCE" >&2
  exit 2
fi

lean_path=$1
output_dir=$2
source_file=$3
module_name=$(basename "$source_file" .lean)

mkdir -p "$output_dir"
printf 'START %s\n' "$module_name"
lean_args=(
  lake env lean -DwarningAsError=true -R ..
  -o "$output_dir/$module_name.olean"
  -i "$output_dir/$module_name.ilean"
  "$source_file"
)

if [[ -n ${LEAN_TIMEOUT:-} ]]; then
  if LEAN_PATH="$lean_path" gtimeout "$LEAN_TIMEOUT" "${lean_args[@]}"; then
    printf 'OK %s\n' "$module_name"
  else
    status=$?
    printf 'FAIL %s status=%s\n' "$module_name" "$status"
    exit "$status"
  fi
elif LEAN_PATH="$lean_path" "${lean_args[@]}"; then
  printf 'OK %s\n' "$module_name"
else
  status=$?
  printf 'FAIL %s status=%s\n' "$module_name" "$status"
  exit "$status"
fi
