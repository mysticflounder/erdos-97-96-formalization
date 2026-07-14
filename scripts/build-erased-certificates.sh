#!/usr/bin/env bash
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.

# Rebuild the native ERASE certificate bank in restartable eight-target waves.
# Each P2/P4-S target certifies two support chunks through the hoisted
# evaluator; half-pair, pair, and public chunk declarations are proof-only
# aggregators or projections.

set -euo pipefail

BATCH_SIZE="${ERASE_BUILD_BATCH_SIZE:-8}"
if ! [[ "$BATCH_SIZE" =~ ^[1-8]$ ]]; then
  echo "ERASE_BUILD_BATCH_SIZE must be an integer from 1 through 8" >&2
  exit 2
fi

build_batches() {
  local label="$1"
  shift
  local targets=("$@")
  local total="${#targets[@]}"
  local batch_count=$(((total + BATCH_SIZE - 1) / BATCH_SIZE))

  for ((offset = 0; offset < total; offset += BATCH_SIZE)); do
    local batch=("${targets[@]:offset:BATCH_SIZE}")
    local batch_no=$((offset / BATCH_SIZE + 1))
    printf '%s certificate batch %d/%d (%d targets)\n' \
      "$label" "$batch_no" "$batch_count" "${#batch[@]}"
    LAKE_BUILD_NO_REFRESH=1 lake-build "${batch[@]}"
  done
}

p2_targets=()
for center in 7 8 9 10; do
  for pair in A B; do
    for half in First Second; do
      for part in Part1 Part2; do
        p2_targets+=(
          "Erdos9796Proof.P97.ErasedCertificate.P2Placement${center}${pair}${half}${part}Native"
        )
      done
    done
  done
done

p4s_targets=()
for center in 3 4 5 6; do
  for pair in A B; do
    for half in First Second; do
      for part in Part1 Part2; do
        p4s_targets+=(
          "Erdos9796Proof.P97.ErasedCertificate.P4SPlacement${center}${pair}${half}${part}Native"
        )
      done
    done
  done
done

build_batches P2 "${p2_targets[@]}"
build_batches P4-S "${p4s_targets[@]}"

LAKE_BUILD_NO_REFRESH=1 \
  lake-build Erdos9796Proof.P97.ErasedCertificate.P4UPlacements
LAKE_BUILD_NO_REFRESH=1 \
  lake-build Erdos9796Proof.P97.ErasedCertificate
