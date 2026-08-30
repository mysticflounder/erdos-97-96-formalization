# Baseline re-anchor — 2026-08-23

Original capture: base_head 222809b9. During Phase 0 the shared worktree advanced
through four foreign commits (d3f7c2bd, b77524c5, e72fa308, f3063069). The Phase 0
gate (proof-status/phase0-gate.json) failed only its mechanical check 7: the
generated module ExactTwelveRigid221PhysicalClassCell6PositiveCuts.lean was added
by foreign commit e72fa308 after capture. It contains no sorry; the gate's live
re-export confirmed the 28+6 obligation roster is IDENTICAL at f3063069.

Decision (main session): re-anchor base-head.txt, dirty-files.txt,
module-hashes.txt, and the spine/off-spine exports at f3063069. The obligation
roster did not change; this is a head-anchor refresh, not a content change. The
lane checkpoint base_head (222809b9) still records where the lane branched.

Known method limit recorded by the gate: dirty-list comparison across a moved
HEAD is not a sound isolation test in this shared worktree. Later phase gates
compare refactor-target module hashes and the obligation roster instead.

## Live-roster re-anchor — 2026-08-30

The live registry was intentionally re-anchored at
`eb6a12039aba1e3c4cc48baa9f1299337fc6a2ac` after the Rigid221 and B1 source
closures. Three obsolete Rigid221 factorization records were retired:

- `P97-R221-CARDEIGHTEEN`;
- `P97-R221-SECONDCAPNINE`; and
- `P97-R221-VROWBLOCKEROFFCLASS`.

The B1 roster slot also moved from the now source-clean
`Problem97.ATailFrontierLiveClosure.b1_globalGapOrClosedTerminal_of_counterexample`
to its open global consumer,
`Problem97.ATailFrontierLiveClosure.false_of_b1PhysicalClassFiveSixNormalForm`.
The resulting live roster has 25 reachable and 6 off-spine declarations, down
from 28 reachable and 6 off-spine at the preceding baseline.

Only `spine-sorry.json`, `offspine-sorry.json`, and `base-head.txt` were
re-captured. The separately reviewed `axioms.txt` consumer-trust authority was
not changed. Strict fresh generation and the baseline-backed replay both
reported 31/31 reviewed rows and 25/25 factorized reachable leaves. The replay
reproduced the fresh generated files byte-for-byte:

- `obligations.json`: `d506460efb99a7a1c72c512ea32891eb95d975adba5d07f541d272b15e2c410c`;
- `id-assignments.json`: `f6538051f21e7f1b6b4d665b27791ab300b43a1ec6a9fb8b109e02dcc988d7e3`;
- `frontier-table.generated.md`: `871b0b26f300b219ca76b8e1e5e4e7b4c2fc7e1cc9b83ba3ca52e187bf1ace96`.

The canonical `check --require-factorized R221` receipt is
`scratch/runs/registry-generator-unblock-20260830/verification-v1/registry-check-20260830T151205Z.json`;
it records verdict `pass`. The complete obligation-registry generator test set
passed 143 tests.
