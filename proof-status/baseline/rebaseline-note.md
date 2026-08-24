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
