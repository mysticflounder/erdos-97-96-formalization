#!/usr/bin/env bash
set -u

lane="scratch/atail-force/aligned-singleton-second-nonbisector-induced"
out="${lane}/v14-branch-matrix"
script="${lane}/cegar.py"
source_checkpoint="${out}/local-critical-new.checkpoint.json"
continued_checkpoint="${out}/local-critical-new-resume-16384.checkpoint.json"
continued_result="${out}/local-critical-new-resume-16384.json"

if [[ -e "${continued_checkpoint}" || -e "${continued_result}" ]]; then
  printf '%s\n' "continuation artifacts already exist; refusing to overwrite" >&2
  exit 2
fi

cp "${source_checkpoint}" "${continued_checkpoint}"

uv run python "${script}" \
  --resume \
  --global-tier local \
  --escape-arm critical \
  --z-branch new \
  --outer-timeout-ms 60000 \
  --inner-timeout-ms 60000 \
  --wall-timeout-seconds 600 \
  --random-seed 0 \
  --max-iterations 256 \
  --max-cuts 16384 \
  --direct-cut-batch 256 \
  --core-shrink-checks 16 \
  --core-shrink-timeout-ms 5000 \
  --checkpoint-validation-timeout-ms 60000 \
  --checkpoint "${continued_checkpoint}" \
  --output "${continued_result}" \
  >"${out}/local-critical-new-resume-16384.stdout.log" \
  2>"${out}/local-critical-new-resume-16384.stderr.log"
printf '%s\n' "$?" >"${out}/local-critical-new-resume-16384.exit-code"
