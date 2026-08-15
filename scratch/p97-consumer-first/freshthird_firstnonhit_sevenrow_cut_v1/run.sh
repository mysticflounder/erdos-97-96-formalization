#!/usr/bin/env bash
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$here/logs"
export UV_CACHE_DIR="$here/.uv-cache"

uv run python "$here/wave.py" --prepare
uv run python "$here/wave.py" --run

for case in retained common common_sameblocker; do
  z3 -smt2 -T:30 "$here/terminal_${case}.smt2" \
    >"$here/logs/terminal_${case}.z3.out" \
    2>"$here/logs/terminal_${case}.z3.err"
  cvc5 --lang smt2 --tlimit 30000 --produce-models \
    "$here/terminal_${case}.smt2" \
    >"$here/logs/terminal_${case}.cvc5.out" \
    2>"$here/logs/terminal_${case}.cvc5.err"
done

z3 -smt2 -T:30 "$here/control_unsat.smt2" \
  >"$here/logs/control_unsat.z3.out" \
  2>"$here/logs/control_unsat.z3.err"
cvc5 --lang smt2 --tlimit 30000 "$here/control_unsat.smt2" \
  >"$here/logs/control_unsat.cvc5.out" \
  2>"$here/logs/control_unsat.cvc5.err"

if z3 -smt2 "$here/control_malformed.smt2" \
    >"$here/logs/control_malformed.z3.out" \
    2>"$here/logs/control_malformed.z3.err"; then
  exit 21
fi
if cvc5 --lang smt2 "$here/control_malformed.smt2" \
    >"$here/logs/control_malformed.cvc5.out" \
    2>"$here/logs/control_malformed.cvc5.err"; then
  exit 22
fi

uv run python "$here/validate.py"

{
  z3 -version
  cvc5 --version | head -1
  uv --version
} >"$here/TOOL-VERSIONS.txt"

(
  cd "$here"
  shasum -a 256 \
    ../../../lean/Erdos9796Proof/P97/U1CarrierInjection.lean \
    ../../../lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean \
    ../../../lean/scratch/firstnonhit-sevenrow-lean/SevenRowObstruction.lean \
    ../freshthird_firstnonhit_global_blocker_quotient_v1/SOURCE-MAP.md \
    ../freshthird_firstnonhit_global_blocker_quotient_v1/case_retained.smt2 \
    ../freshthird_firstnonhit_global_blocker_quotient_v1/case_common.smt2 \
    ../freshthird_firstnonhit_global_blocker_quotient_v1/case_common_sameblocker.smt2 \
    > SOURCE-HASHES.txt
  shasum -a 256 \
    SOURCE-MAP.md CUT-ADMISSION.md RESULTS.md POSTRUN-THEOREM-MINE.md \
    wave.py validate.py run.sh SOURCE-GATE.json LAUNCH-MANIFEST.json \
    MANIFEST.json TERMINAL.json VALIDATION.json SURVIVOR.json TOOL-VERSIONS.txt \
    base_*.smt2 terminal_*.smt2 cuts_*.json iterations/*.json \
    control_*.smt2 logs/* SOURCE-HASHES.txt \
    > SHA256SUMS
)

echo "wave complete: $here"
