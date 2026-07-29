#!/usr/bin/env bash
set -u

lane="scratch/atail-force/aligned-singleton-second-nonbisector-induced"
out="${lane}/v14-branch-matrix"
script="${lane}/cegar.py"

uv run python "${script}" \
  --global-tier local \
  --escape-arm critical \
  --z-branch new \
  --outer-timeout-ms 60000 \
  --inner-timeout-ms 60000 \
  --wall-timeout-seconds 600 \
  --max-iterations 256 \
  --max-cuts 4096 \
  --direct-cut-batch 256 \
  --core-shrink-checks 16 \
  --core-shrink-timeout-ms 5000 \
  --checkpoint-validation-timeout-ms 60000 \
  --checkpoint "${out}/local-critical-new.checkpoint.json" \
  --output "${out}/local-critical-new.json" \
  >"${out}/local-critical-new.stdout.log" \
  2>"${out}/local-critical-new.stderr.log" &
critical_new_pid=$!

uv run python "${script}" \
  --global-tier local \
  --escape-arm robust \
  --z-branch reuse-second \
  --outer-timeout-ms 60000 \
  --inner-timeout-ms 60000 \
  --wall-timeout-seconds 600 \
  --max-iterations 256 \
  --max-cuts 4096 \
  --direct-cut-batch 256 \
  --core-shrink-checks 16 \
  --core-shrink-timeout-ms 5000 \
  --checkpoint-validation-timeout-ms 60000 \
  --checkpoint "${out}/local-robust-reuse-second.checkpoint.json" \
  --output "${out}/local-robust-reuse-second.json" \
  >"${out}/local-robust-reuse-second.stdout.log" \
  2>"${out}/local-robust-reuse-second.stderr.log" &
robust_reuse_pid=$!

uv run python "${script}" \
  --global-tier local \
  --escape-arm robust \
  --z-branch new \
  --outer-timeout-ms 60000 \
  --inner-timeout-ms 60000 \
  --wall-timeout-seconds 600 \
  --max-iterations 256 \
  --max-cuts 4096 \
  --direct-cut-batch 256 \
  --core-shrink-checks 16 \
  --core-shrink-timeout-ms 5000 \
  --checkpoint-validation-timeout-ms 60000 \
  --checkpoint "${out}/local-robust-new.checkpoint.json" \
  --output "${out}/local-robust-new.json" \
  >"${out}/local-robust-new.stdout.log" \
  2>"${out}/local-robust-new.stderr.log" &
robust_new_pid=$!

wait "${critical_new_pid}"
printf '%s\n' "$?" >"${out}/local-critical-new.exit-code"
wait "${robust_reuse_pid}"
printf '%s\n' "$?" >"${out}/local-robust-reuse-second.exit-code"
wait "${robust_new_pid}"
printf '%s\n' "$?" >"${out}/local-robust-new.exit-code"
