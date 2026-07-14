#!/usr/bin/env bash
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.

# Build the thirty-two restartable P2 two-chunk certificates in at most four
# eight-target waves. Each unit hoists its two deleted-label domain lists
# across two support chunks; half-pair and old chunk declarations are
# proof-only aggregators or projections.

set -euo pipefail

BATCH_SIZE="${P2_BUILD_BATCH_SIZE:-8}"
if ! [[ "$BATCH_SIZE" =~ ^[1-8]$ ]]; then
  echo "P2_BUILD_BATCH_SIZE must be an integer from 1 through 8" >&2
  exit 2
fi

targets=()
for center in 7 8 9 10; do
  for pair in A B; do
    for half in First Second; do
      for part in Part1 Part2; do
        targets+=(
          "Erdos9796Proof.P97.ErasedCertificate.P2Placement${center}${pair}${half}${part}Native"
        )
      done
    done
  done
done

total="${#targets[@]}"
for ((offset = 0; offset < total; offset += BATCH_SIZE)); do
  batch=("${targets[@]:offset:BATCH_SIZE}")
  batch_no=$((offset / BATCH_SIZE + 1))
  batch_count=$(((total + BATCH_SIZE - 1) / BATCH_SIZE))
  printf 'P2 certificate batch %d/%d (%d two-chunk certificates)\n' \
    "$batch_no" "$batch_count" "${#batch[@]}"
  LAKE_BUILD_NO_REFRESH=1 lake-build "${batch[@]}"
done

LAKE_BUILD_NO_REFRESH=1 \
  lake-build Erdos9796Proof.P97.ErasedCertificate.P2Closure
