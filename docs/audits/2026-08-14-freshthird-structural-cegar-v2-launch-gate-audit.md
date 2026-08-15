# FreshThird structural CEGAR v2 launch-gate audit — 2026-08-14

## Claim boundary

This audit establishes artifact and runner integrity only.  It does not establish
source satisfiability, source unsatisfiability, a `QueryContract`, or closure of a
Lean `sorry`.

The audited artifact is
`scratch/p97-consumer-first/freshthird_qfiber_three_carrier_structural_cegar_v2/wave-0001`.
Its terminal status is `BUDGET` in all four boundary cells.  Each terminal CNF is
SAT after twelve learned clauses, while each terminal model is rejected by the
full source replay on `source__pinned_source_theory` and has another valid
cap-alternation refinement.

## Historical artifact result

The historical artifact passes its stated bounded-discovery contract:

- the manifest is canonical and its 264-entry artifact inventory exactly matches
  the 264 non-manifest files (626,957,289 bytes total);
- source preflight and postflight both record HEAD `08a48e01`, aggregate SHA-256
  `0b4d5af721fcdea4317af26cbc1a500b7004baf1ea82dca551d62a331d47302b`, and
  content SHA-256
  `d2675aa417c5078fa309b27650d674bc63926adf941692a6edc0cc4b54dd470e`;
- all four terminal solver records are exact CaDiCaL `SAT` return code 10;
- all 48 parented cap-alternation certificates independently replay against the
  repository-bound Lean sources, and each terminal cut list equals its complete
  twelve-record parent chain;
- deterministic reconstruction of every CNF, variable map, model signature, and
  certificate history succeeds for all four cells.

The post-wave mine yields no new theorem.  The 48 cuts are repeated instances of
the existing `NoAlternatingCap` theorem: one `0101` pattern and eleven `1010`
patterns per cell, all for cap 1.  The twelve observed role quadruples are not a
source-total replacement for `NoAlternatingCap`.

## Runner defects found and repaired

The artifact happened to have matching preflight/postflight custody, but the v2
implementation admitted three unsafe future-run paths:

1. `verify_snapshot` compared only content identity, imports, and rebuild inputs.
   A stale snapshot could cross a commit or tracked/untracked status change when
   the transitive bytes were unchanged.
2. An injected solver callback could call `run_wave` without `repo_root`, bypassing
   source custody through the public Python API.
3. Terminal reuse checked the aggregate artifact inventory and last result only;
   it did not reconstruct intermediate CNFs or replay the learned certificate
   chain.

The repaired gate now:

- requires exact equality with the rebuilt snapshot, including repository HEAD,
  aggregate rows, Git blob/status metadata, and all compatibility fields;
- requires `repo_root` and pre/post source verification for every call, including
  injected test solvers;
- binds the postflight identity explicitly in terminal reuse;
- reconstructs each step's CNF from the source encoder and preceding cuts;
- reconstructs the variable map and model signature, validates all preceding
  cuts, and replays every admitted certificate with its exact parent;
- reruns semantic replay for every SAT history record and requires every
  admission and terminal status to follow from the exact solver status, replay
  result, and cut-admission result;
- reconstructs the non-clean source archive manifest from the snapshot rows and
  rehashes each archived source file;
- requires a `BUDGET` terminal to occur after exactly the configured number of
  cuts and to expose another falsified theorem-backed refinement;
- rejects certificate/history tampering even if an attacker regenerates the
  outer artifact inventory.

## Verification

The focused provenance and runner suite passes 14 tests.  Together with the
cap-alternation replay suite, the focused FreshThird gate passes 49 tests, and
Ruff is clean.  A direct replay of the historical wave through the new
cell-history validator succeeds for cells 0 through 3.

Because snapshots now bind the exact repository HEAD and status metadata, a
terminal run is intentionally not reusable from a later checkout merely because
its transitive source bytes still match.  Historical validation must use the
recorded source checkout and archived non-clean rows.

## Next computational target

Do not increase the twelve-cut budget or batch only the twelve observed
quadruples.  A successor needs a fresh schema with a source-total compact
encoding of cap no-alternation.  One suitable finite encoding assigns each role,
for each cap, one of three monotone phases and uses one orientation bit to say
whether the middle phase is inside or outside the cap.  Guarded monotonicity under
the existing strict `Before` relation represents empty, full, ordinary-interval,
and wrapping-interval cap words in quadratic rather than ordered-quadruple scale.
It still requires an independent finite equisatisfiability argument and
differential tests before a successor wave.
