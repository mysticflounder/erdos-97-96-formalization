# Exact-12 next-row arm terminal promotion (2026-08-13, complete)

Owner: Terminal Custodian session.  Convo claims #6232/#6237; Twelvefold
Refiner cleared ownership in #6235; ColdStore scratch exclusions in #6254.
Status: COMPLETE.  The four cells are kernel-checked finite
`DimacsUnsatisfiable` facts; see "Result" below.

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

- `scripts/prepare_exact12_next_row_arm_terminal_rup_source.py` is done:
  fail-closed validation of a terminal arm cell, staging, original-proof
  `drat-trim` precheck, fresh `cadical --plain` rerun, dense pure-RUP
  normalization, `p97-pure-rup-source-v1` manifest, receipt schema
  `p97_rigid221_exact12_next_row_arm_terminal_rup_source.v1`.  The job
  binding uses the producer's pretty-printed JSON hash (`_json_bytes`,
  indent 2) and also rechecks the `job_id` self-hash.
- `scripts/test_prepare_exact12_next_row_arm_terminal_rup_source.py` passes
  (8 tests): the class fixture reruns the real producer on arm cell 52; the
  happy path runs the full postprocessor with real CaDiCaL and drat-trim;
  the fail-closed tests prove tampered inputs (status, artifact bytes,
  self-consistent CNF+job rehash, clause delta) are rejected before any
  checker runs and that nothing is published on failure.
- All four cells published pure-RUP sources under
  `scratch/rigid221-sourceheavy-anchor/
  exact12-next-row-arm-terminal-rup-sources-20260813/cell-{52,58,65,71}/`
  (7 additions each over the 369326-clause base; receipts record drift in
  exactly the two known pinned sources).
- Production placement follows the audited Unique4 precedent
  (`.../CardElevenUniqueFourCertificate/Generated/ExactFiveCommonShellV7G3Replay/`):
  emit with the generic `CompactWindowedRupReplay` namespace and module
  prefix, then a per-package `ingress.py` verifies the emitted manifest
  digest, rewrites imports to the deep production prefix, renames the
  namespace, and installs modules plus `data/` inside the package root, so
  payload include paths stay `../../data/...`.
- Probe artifacts live in the session scratchpad and in untracked probe
  paths `lean/Erdos9796Proof/P97/Scratch/NextRowArmCell52Probe/` and
  `lean/data/`; both probe paths must be removed when production placement
  lands under
  `.../FrontierLiveClosure/ExactTwelveRigid221NextRowArmTerminal/Generated/`.

## Result (2026-08-13)

All steps are complete.

1. Postprocessor and 8-test suite committed (`30474f27`); Ruff clean; all
   four cells published authenticated pure-RUP sources under
   `scratch/rigid221-sourceheavy-anchor/
   exact12-next-row-arm-terminal-rup-sources-20260813/cell-{52,58,65,71}/`
   (7 additions each over the 369326-clause base; fresh `cadical --plain`
   exit 20; drift confined to the two known pinned sources).
2. Checkpointed (`--second-shard-first-addition 369330`), windowed, and
   compact packages emitted per cell under
   `.../exact12-next-row-arm-terminal-replay-20260813/cell-NN/{checkpointed,
   windowed,compact}` with the generic `CompactWindowedRupReplay` namespace;
   package digests: cell 52 `f51b9204…`, cell 58 `33627b5d…`, cell 65
   `bd3340fb…`, cell 71 `1f943e3e…` (full digests in each committed
   `ingress.py`).
3. Production installation follows the Unique4 precedent: per-package
   `ingress.py` under `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/
   ExactTwelveRigid221NextRowArmTerminal/Generated/Cell00NN/` verifies the
   emitted manifest digest, rewrites imports to the deep module prefix,
   renames the namespace to `ExactTwelveRigid221NextRowArmCell00NNReplay`,
   and installs 8 Lean modules plus `data/` (2 formulas, 2 actions) inside
   the package root.
4. Endpoint modules `.../ExactTwelveRigid221NextRowArmTerminal/Cell00NN.lean`
   prove
   `Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.
   NextRowArmTerminal.cell00NN_dimacsUnsatisfiable :
   DimacsUnsatisfiable (signedClausesOfFormula (formulaOfCompact (n := 42731)
   Checkpoint.C0000.text))` via
   `TerminalRupIngress.dimacsUnsatisfiable_of_formula rfl
   <ns>.startUnsatisfiable`.  `lake build` is green for all four; axiom
   closure for each endpoint is exactly `propext, Classical.choice,
   Quot.sound, Lean.ofReduceBool, Lean.trustCompiler` with no `sorryAx`.
5. Probe paths `lean/Erdos9796Proof/P97/Scratch/NextRowArmCell52Probe/` and
   `lean/data/` are removed.  The closure plan direct-wave section records
   the promotion.

Scope: these are the same four tautological finite facts the closure plan
describes — direct consequences of the compiled physical-cycle row.  The
promotion validates the terminal ingress pipeline end to end and adds no
aggregate coverage, universal producer, terminal bank, or leaf closure.

The scratch provenance dirs named above and the wave dir must stay excluded
from cleanup while the committed `ingress.py` files reference them
(ColdStore ack #6254).
