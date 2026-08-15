#!/usr/bin/env bash
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$here/logs"
python3 "$here/generate.py"
for case in retained common common_sameblocker; do
  z3 -smt2 -T:60 "$here/case_${case}.smt2" >"$here/logs/${case}.z3.out" 2>"$here/logs/${case}.z3.err"
  cvc5 --lang smt2 --tlimit 60000 --produce-models "$here/case_${case}.smt2" >"$here/logs/${case}.cvc5.out" 2>"$here/logs/${case}.cvc5.err"
  python3 "$here/validate.py" "$case" z3 >"$here/logs/${case}.z3.validate"
  python3 "$here/validate.py" "$case" cvc5 >"$here/logs/${case}.cvc5.validate"
done
for solver in z3 cvc5; do
  if [[ "$solver" == z3 ]]; then
    z3 -smt2 "$here/control_unsat.smt2" >"$here/logs/control_unsat.z3.out" 2>"$here/logs/control_unsat.z3.err"
    if z3 -smt2 "$here/control_malformed.smt2" >"$here/logs/control_malformed.z3.out" 2>"$here/logs/control_malformed.z3.err"; then exit 21; fi
  else
    cvc5 --lang smt2 "$here/control_unsat.smt2" >"$here/logs/control_unsat.cvc5.out" 2>"$here/logs/control_unsat.cvc5.err"
    if cvc5 --lang smt2 "$here/control_malformed.smt2" >"$here/logs/control_malformed.cvc5.out" 2>"$here/logs/control_malformed.cvc5.err"; then exit 22; fi
  fi
done
grep -qx unsat "$here/logs/control_unsat.z3.out"
grep -qx unsat "$here/logs/control_unsat.cvc5.out"
python3 "$here/validate_survivor.py" >"$here/logs/survivor.validate"
(cd "$here" && shasum -a 256 \
  ../../../lean/Erdos9796Proof/P97/U1CarrierInjection.lean \
  ../../../lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean \
  ../../../lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean \
  ../../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean \
  ../../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean \
  ../../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean \
  ../../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean \
  ../../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean > SOURCE-HASHES.txt)
(cd "$here" && shasum -a 256 SOURCE-MAP.md RESULTS.md SURVIVOR.json generate.py validate.py validate_survivor.py run.sh case_*.smt2 control_*.smt2 logs/* SOURCE-HASHES.txt > SHA256SUMS)
{
  printf '{\n  "wave": "freshthird_firstnonhit_global_blocker_quotient_v1",\n'
  printf '  "cases": ["retained", "common", "common_sameblocker"],\n'
  printf '  "logic": "QF_LIA",\n  "ambient_cardinality_bound": null,\n'
  printf '  "z3": "4.17.0",\n  "cvc5": "1.3.3",\n'
  printf '  "result": {"cases": "sat", "contradiction_control": "unsat", "malformed_control": "rejected", "semantic_survivor": "validated"}\n}\n'
} >"$here/MANIFEST.json"
(cd "$here" && shasum -a 256 MANIFEST.json >> SHA256SUMS)
