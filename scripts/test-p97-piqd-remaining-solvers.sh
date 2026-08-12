#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

# Keep the remaining-solver onboarding gate sequential. Each lane-local runner
# applies the same one-worker/thread caps and uses fake transports only.
./scripts/test-p97-piqd-atail-geometry.sh
./scripts/test-p97-piqd-exact12-next-row-arm-static.sh
./scripts/test-p97-piqd-global-metric-core-miner.sh
./scripts/test-p97-phase3-survivor-metric-piqd.sh
./scripts/test-p97-a-core-metric-piqd.sh
./scripts/test-p97-piqd-pinned-generalm.sh
./scripts/test-p97-piqd-rigid221-pentagon.sh
./scripts/test-p97-piqd-certified-frontier-all.sh
