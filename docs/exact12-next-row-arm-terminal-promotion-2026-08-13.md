# Exact-12 next-row arm terminal promotion (2026-08-13, in progress)

Owner: Terminal Custodian session.  Convo claims #6232/#6237; Twelvefold
Refiner cleared ownership in #6235.  Status: implementation in progress;
nothing below is a promoted certificate yet.

## Goal

Promote the four `UNSAT_DRAT_VERIFIED` cells (52, 58, 65, 71) of the
untracked wave
`scratch/rigid221-sourceheavy-anchor/exact12-next-row-arm-direct-wave-20260811-v2`
(schema `p97_rigid221_exact12_next_row_named_deletion_arm_cell_run.v1`) to
kernel-checked Lean `DimacsUnsatisfiable` facts.  The closure plan
(`docs/computational-closure-plan-2026-07-28.md`, "Historical 72-cell
direct-wave checkpoint") records these cells as direct consequences of the
compiled physical-cycle row: finite facts only, never a universal producer,
no aggregate coverage, no leaf closure.  This promotion validates the
terminal ingress pipeline end to end and produces the lane's first checked
terminal certificates.

## Validated feasibility facts (probe, 2026-08-13)

- The wave proofs verify under `drat-trim` but hold 395 RAT lemmas in core;
  the compact ingress is pure-RUP, so promotion requires a fresh
  `cadical --plain` rerun on the identical CNF.  For cell 52 that rerun is
  UNSAT in 0.08 s with a 14 KB proof and 0 RAT lemmas (7 additions, 101 core
  clauses).
- All four cells rematerialize byte-identically from the current tree
  (CNF bytes, compiler manifest, `cnf` record).  Only the job-pinned source
  hashes drifted (`exact12_next_row_cell_run.py`,
  `ExactTwelveRigid221NextRowJobSemantics.lean`), so promotion uses
  current-source semantics and records the drift table in its receipt.
- The full pipeline ran green on cell 52: dense pure-RUP normalization
  (`normalize_dense_pure_rup`), `materialize_checkpointed_rup.py
  --second-shard-first-addition 369330`, `materialize_windowed_rup.py`,
  `emit_compact_windowed_rup_replay_package.py` (2 windows, 8 Lean files,
  3.8 MB), and `lake build` of the generated `Compose` in 7.4 s, giving
  `startUnsatisfiable : Unsatisfiable (PosFin 42730) (formulaOfCompact
  Checkpoint.C0000.text)`.
- Per-cell endpoint: `TerminalRupIngress.dimacsUnsatisfiable_of_formula rfl
  Cell00NN.startUnsatisfiable` yields `DimacsUnsatisfiable
  (signedClausesOfFormula (formulaOfCompact ...))` with no new native steps.
  The DIMACS-byte identity binds at the artifact layer (package manifests and
  receipt), not by an in-Lean reflection; the in-Lean arm-suffix reflection
  remains the arm-static lane's obligation.

## Pipeline state

- `scripts/prepare_exact12_next_row_arm_terminal_rup_source.py` is written
  and untested: fail-closed validation of a terminal arm cell, staging,
  original-proof `drat-trim` precheck, fresh `cadical --plain` rerun, dense
  pure-RUP normalization, `p97-pure-rup-source-v1` manifest, receipt schema
  `p97_rigid221_exact12_next_row_arm_terminal_rup_source.v1`.
- Tests are not yet written.  Probe artifacts live in the session scratchpad
  and in untracked probe paths `lean/Erdos9796Proof/P97/Scratch/
  NextRowArmCell52Probe/` and `lean/data/`; both probe paths must be removed
  when production placement lands under
  `.../FrontierLiveClosure/ExactTwelveRigid221NextRowArmTerminal/Generated/`.

## Remaining steps

1. Tests for the postprocessor; Ruff; run on all four cells.
2. Materialize and emit the four replay packages into the production
   `Generated/` placement (payload `data/` stays inside each package root).
3. Write the four endpoint modules, build, and audit axiom closures
   (`Lean.ofReduceBool` expected from window checks; no `sorryAx`).
4. Update this doc and the closure plan direct-wave section, remove probe
   paths, commit each checkpoint, and post the convo completion.
