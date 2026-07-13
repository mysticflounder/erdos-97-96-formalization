#!/usr/bin/env bash
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.

# Build the expensive P2 native certificate leaves with a hard upper bound on
# simultaneously eligible leaf targets. Lake's jobs setting is advisory, so
# the target list itself provides the reliable bound. Cached leaves make this
# script safe to restart after an interruption.

set -euo pipefail

BATCH_SIZE="${P2_BUILD_BATCH_SIZE:-8}"
if ! [[ "$BATCH_SIZE" =~ ^[1-8]$ ]]; then
  echo "P2_BUILD_BATCH_SIZE must be an integer from 1 through 8" >&2
  exit 2
fi

PREFIX="Erdos9796Proof.P97.ErasedCertificate.P2Placement"
targets=()
# Keep equal chunk indices together. Measured chunk costs vary more than their
# support counts, so this avoids making every batch wait on the same slow tail.
for chunk in 0 1 2 3 4 5 6 7; do
  for center in 7 8 9 10; do
    for deleted in 3 4 5 6; do
      targets+=("${PREFIX}${center}D${deleted}C${chunk}")
    done
  done
done

total="${#targets[@]}"
for ((offset = 0; offset < total; offset += BATCH_SIZE)); do
  batch=("${targets[@]:offset:BATCH_SIZE}")
  batch_no=$((offset / BATCH_SIZE + 1))
  batch_count=$(((total + BATCH_SIZE - 1) / BATCH_SIZE))
  printf 'P2 certificate batch %d/%d (%d leaves)\n' \
    "$batch_no" "$batch_count" "${#batch[@]}"
  LAKE_BUILD_NO_REFRESH=1 lake-build "${batch[@]}"
done

lake-build Erdos9796Proof.P97.ErasedCertificate.P2Closure
