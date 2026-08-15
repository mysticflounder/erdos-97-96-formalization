# CEGAR/MARCO mechanics audit (2026-07-25--2026-08-07)

Read-only audit of the dated CEGAR/MARCO guidance, current Phase-3 runtime,
MARCO producer, tests, and retained v17--v19 artifacts.  The proof-blueprint
anchor `Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier` is
not treated as closed by any computational artifact below.

## Guards that are now working

- `census/atail_force/producer_mus.py` uses a fixed atom order, deterministic
  maximal-map seeds, canonical subset caching, explicit oracle/map/core
  budgets, and `UNKNOWN_FAIL_CLOSED`; UNKNOWN never adds a blocking clause.
  Its tests cover UNKNOWN, oracle budget, duplicate universes, and multiple
  cores (`tests/test_producer_mus.py`).
- Phase-3 journal/checkpoint tests reject non-dense indices, broken hash chains,
  prefix/suffix tampering, configuration changes, torn JSONL tails, and
  checkpoint-envelope tampering (`phase3_journal_checkpoint.py` and its tests).
  Loader caches are accelerators only: source bytes/chain, configuration,
  loader hash, record table, and cache payload changes miss or fail closed
  (`phase3_loader_cache.py`, `tests/test_phase3_loader_cache.py`).
- Terminal publication freezes and rereads the exact CNF, invokes a fresh
  proof-producing solver, requires UNSAT plus nonempty DRAT, and then checks
  the proof. SAT, UNKNOWN, CNF drift, missing proof, and checker exceptions
  are rejected (`tests/test_phase3_cegar_runtime.py`).
- Resume idempotence and deterministic publication are exercised: a completed
  manifest is replayed without a solver call or generation change; count drift
  is rejected; cube results commit in cube-index order and stale SAT results
  are independently rechecked. Fixed-shard coverage rejects gaps, duplicates,
  mixed schemas, bad provenance, and DRAT failure.
- The successor adaptive-wave path has explicit `RUNNING`, `BUDGET`,
  `EXCEPTION`, `UNKNOWN`, and `COMPLETE` states, authenticated `next_leaf_index`,
  and crash-resume tests that rerun only the uncommitted leaf
  (`tests/test_phase3_adaptive_cubing.py`). This is successor-only; the fixed
  cube-batch driver is unchanged.

## Concrete failures and remedies

1. **Wrong-order independent replay (2026-08-07).** The standalone
   `replay_linear_unknown.py` inherited one cyclic order instead of binding
   each artifact's stored order. Its report for 21 `METRIC_UNKNOWN` witnesses
   was withdrawn. The production runner was unaffected; the replayer now
   requires a valid `Fin 17` permutation and fails closed, but all 21 witnesses
   still require corrected replay (`scratch/rigid221-blockerv-exact17-20260806/SOURCE-FAITHFUL-CORE-BANK-AUDIT-2026-08-07.md:16-23`).

2. **Resume schema compatibility bug (2026-07-31 plan, fixed).** The v9
   production wrapper rejected a genuine v8/v6 checkpoint although its low-
   level migration self-check passed. `restore_learned_cuts` was widened to
   the current pair plus immediate predecessors, and a real file-based
   regression was added; the resumed run then authenticated 203,687 cuts
   (`docs/false_of_capSourceThirdCanonicalRowSurface_refactor-plan-07-31-2026.md:1001-1006`).

3. **Interrupted runs lost all iteration state (2026-08-02).** V18 wrote
   assignment/trace/result artifacts only after the CEGAR loop exited. An
   interruption during normalized-formula hashing left only invocation metadata
   and an empty case directory, so the artifact was correctly declared NO-GO,
   not a resumable checkpoint (`scratch/retained-omission-e1/round5-general-cegar/V18-INTERRUPTED-GLOBAL-THEOREM-BANK.md:5-16,95-103`).
   The V18/V19 continuation design remedies this with immutable per-assignment
   journals, cumulative hashes, pinned source digests, replayed blockers, and
   pending-tail continuation; it remains an orchestrator, not proof closure.

4. **Stale RUNNING publication after interruption (2026-07-29).** A projected
   sequential run was left `RUNNING` until a process-table audit established
   that no process owned it; it was then corrected to `INTERRUPTED`, with no
   terminal DRAT claim (`census/p97_search/PHASE3-RESULTS.md:148`). Current
   cube artifacts have stale-result rechecks and deterministic coordinator
   order, but there is still no explicit process lease/lock preventing two
   drivers from concurrently resuming one directory.

5. **Bounded solver stops recur and are correctly nonterminal.** The v9
   tranches ended `UNKNOWN_TIMEOUT` / `UNKNOWN_FAIL_CLOSED` on timeout or
   cancellation, while resume reconstruction was costly; exact-expression
   memoization reduced one restore from roughly four minutes to 79 seconds,
   and longer windows are recommended (`docs/false_of_capSourceThirdCanonicalRowSurface_refactor-plan-07-31-2026.md:1007-1018,1020-1024`).
   These are operational progress records, never `UNSAT` or Lean closure.

## Open systemic defects / boundaries

- The MARCO API exposes only `SAT|UNSAT|UNKNOWN`. It cannot itself distinguish
  semantic-UNSAT (bankable) from relaxation-UNSAT, SAT-abstraction, or other
  non-bankable verdicts. That four-way trust classification and the universal
  lift must remain in the caller/consumer boundary.
- `MarcoEnumerator` accepts an opaque oracle and performs deterministic
  shrink/grow, but does not enforce a fresh solver per minimizer trial or an
  independent replay of a minimized core. Those are required audit properties,
  not invariants of this class; the current tests do not cover them.
- Current fixed-cube scheduling authenticates exact partitions and ignores
  worker completion order, but lacks a durable worker lease/ownership protocol.
  Stale-result rechecks mitigate races after completion; they do not prevent
  concurrent drivers or revive-safe process-tree ownership.
- Historical production wrappers still show a checkpointing hazard: if an
  encoder or pre-loop phase is externally killed before its first durable
  iteration checkpoint, there is no resumable offset. Use bounded diagnostics
  or checkpoint encoder work before long runs.
- Discovery/publication remain deliberately separate. A finite CNF/SMT result,
  cache hit, shard coverage result, or authenticated resume proves only the
  pinned abstraction; source-complete coverage, theorem-bank admission,
  independent replay, Lean ingress, and transitive axiom audit remain separate
  obligations. In the 2026-08-07 exact-17 report, source-to-finite coverage and
  the second cyclic-order family were explicitly still open.

