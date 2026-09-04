#!/usr/bin/env bash
# Build the off-spine tri-apex cyclic-exclusion chain.
#
# The nine modules of this chain are outside the import closure of the public
# `Erdos9796Proof` root, so a green default build is no evidence about them.
# This target is the explicit coverage required by the lean-usage validation
# closeout rule ("build any active unimported module explicitly or add it to a
# real aggregate/CI target").
#
# It proves only that the modules elaborate together.  It establishes no
# consumer reachability and carries no promotion claim.  See
# docs/plans/2026-09-01-d1-triapex-paired-common-deletion-closure-plan.md
# sections 62-82.
set -euo pipefail

LAKE_BUILD_NO_REFRESH=1 lake-build \
  Erdos9796Proof.P97.ATail.TriApexCyclicExclusionAggregate
