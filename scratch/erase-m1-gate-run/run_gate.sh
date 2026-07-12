#!/bin/bash
# ERASE M1 eval gate — detached runner (survives agent/session churn).
# Verdict + progress: scratch/erase-m1-gate-run/progress.log
# Full stdout/stderr:  scratch/erase-m1-gate-run/gate_stdout.log
cd /Users/adam/projects/math-projects/erdos-97-96-formalization/lean || exit 1
export ERASE_M1_PROGRESS_FILE=/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/erase-m1-gate-run/progress.log
lake env lean Erdos9796Proof/P97/ErasedCertificate/ErasedNativeEvalGate.lean
echo "EXIT=$?" >> "$ERASE_M1_PROGRESS_FILE"
