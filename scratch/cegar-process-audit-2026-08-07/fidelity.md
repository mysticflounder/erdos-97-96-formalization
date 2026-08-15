# CEGAR source-fidelity and promotion audit (2026-07-25..2026-08-07)

Scope: read-only audit of CEGAR/MARCO mining, source-to-encoding fidelity,
certificate/replay, and promotion toward
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier`.
Status words below are `FIXED`, `DIAGNOSTIC`, or `OPEN`; no solver result is
treated as universal closure.

## Date boundary

The audit evidence is restricted to commits and artifacts dated 2026-07-25
through 2026-08-07.  A few FreshThird filenames contain `20260808` because
they were generated or named on Aug 8; those are explicitly labeled below as
post-window follow-up.  They corroborate an already visible fidelity pattern,
but are not counted as in-period closure evidence.

## Fixed incidents and controls

- **FIXED: hidden cardinality cap.** The A-core encoder formerly rejected
  every `(N1)` sum above 24, silently imposing `n ≤ 24` on leaves assuming only
  `12 ≤ D.A.card`.  It now has `0..24` plus `GE25`, with a concrete `n=32`
  overflow smoke (`G-OVERFLOW`).  This repairs encoding scope, not the Lean
  leaf.  Evidence: `docs/computational-closure-plan-2026-07-28.md:47-56`,
  commit `942ba577` (2026-08-04).

- **FIXED: schema/provenance mixing in projected v3.** The v3 launcher uses a
  fresh namespace, `--no-bootstrap`, source hashes, and authenticated prefix
  replay; resume is idempotent after `6da139bf`.  The migration contract
  forbids importing blocker-fiber facts, named deletion roles, or
  pinned-multiplicity upper bounds while `MetricRow.exact = false`.
  Evidence: `scratch/p97-distinct-distance-lane/phase3-v3-lane-migration-20260804.md:8-13,57-72`,
  commits `8e64fb23`, `6da139bf`, `c0edd429` (2026-08-04).

- **FIXED: two bank-provenance errors rejected.** The direct-role prototype was
  quarantined as `invalid-direct-core`; v6 rejected direct reuse of old numeric
  literals and re-encoded semantic membership keys in the new context.
  Equality-path memberships remain recorded paths, not inferred geometric
  role names.  Evidence: `docs/computational-closure-plan-2026-07-28.md:1086-1090`
  and the v5/v6 discussion following it; commit `25271543` (2026-08-03).

- **FIXED: replay accounting, not coverage.** The ordered-v4 37-record
  partition is hash-pinned and checked disjoint/exhaustive against the
  extracted record file; all records have Lean consumers and the targeted
  transitive axiom audit is standard-only.  This is learned-cut replay only:
  the run is `ITERATION_LIMIT`, not UNSAT.  Evidence:
  `docs/exact-twelve-rigid221-ordered-v4-replay-checkpoint-2026-08-08.md`,
  `scratch/rigid221-sourceheavy-anchor/audit_ordered_v4_lean_replay_manifest.py`,
  commit `9cddbaee` (2026-08-07).  The checkpoint filename is post-window,
  but the cited commit is in-window; it is counted only for its 2026-08-07
  replay state.

## Open fidelity or promotion patterns

- **OPEN: row-origin over-guarding.** Post-window follow-up artifact
  `scratch/p97-consumer-first/freshthird_row_origin_audit_20260808.md:13-53`
  (generated Aug 8; commit `5be5e068` is Aug 7) identifies that canonical
  blocker rows are individually source-entitled by the deletion fan and need
  no mutual/repeated-cap guard.  The current pair guard in
  `freshthird_cross_row_kalmanson_universal_20260808.py:89-108` skips every
  triple containing exactly one blocker and overrestricts triples of three
  blockers.  This is a coverage hole, not evidence omitted triples are
  impossible.  Treat this as post-window corroboration of an in-window
  FreshThird fidelity concern, not as 2026-08-08 solver evidence.

- **OPEN: source antecedent/provenance gap.** The live FreshThird theorem has
  independent `hrow` and `hrowAt ... DRow` inputs; the source audit reports no
  equality/provenance link between them.  The missing fan-to-consumer lift is
  therefore at the theorem boundary, not in another finite detector.
  Evidence: post-window `freshthird_row_origin_audit_20260808.md:5-11` and
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:3379-3440`.

- **DIAGNOSTIC only: structural/metric CEGAR.**
  `freshthird_two_level_cegar.py:84-208` freezes a complete finite structural
  signature and replays metric constraints unguarded, avoiding semantic
  relaxation conflation.  But fixed-structure UNSAT is only an SMT verdict:
  no archived proof certificate, independent replay contract, named Lean
  consumer, or finite-to-universal lift is present.  The full-fidelity driver
  says this explicitly at `freshthird_full_fidelity_cegar.py:629-635`.

- **DIAGNOSTIC only: branch/orbit coverage.** The resumable cross-row runner
  enumerates a configured matrix, but its recorded resume smoke processes only
  branch 2 and ends `sat_after_cut_budget`; the report says “no universal
  conclusion.”  No source theorem maps every selector/arm/placement to this
  matrix, and no symmetry/orbit lift is proved.  These named artifacts are
  post-window follow-up (`...20260808.py`, `...resume-smoke.results.md`) and
  are not counted as in-period results.

- **OPEN: finite-to-universal/cardinality lift.** The exact-12 replay
  consumers prove concrete learned cuts, while FreshThird and projected-v3
  lanes are bounded finite producers.  None supplies the general-cardinality
  theorem required by the five-part promotion contract.  The named shared
  consumer remains `false_of_criticalPairFrontier` in
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Coordinator.lean:778-805`;
  current FreshThird residual remains a `sorry`-bearing producer-to-consumer
  gap.

- **OPEN: MARCO/bank trust boundary.** SAT, relaxation-UNSAT, semantic-UNSAT,
  and UNKNOWN must remain distinct; only semantic-UNSAT may shrink/bank a
  geometric core.  Across the audited lanes, replay hashes and source-frozen
  schemas improve, but no complete wave manifest simultaneously records all
  case arms, source ingress, symmetry coverage, certificate replay, consumer,
  and general-cardinality lift.  Banked cuts therefore remain finite producer
  evidence, not closure.

## Bottom line

The strongest in-window state is authenticated finite replay plus several
source-level producers.  The recurring unresolved failure is promotion:
materialized-row guards, source antecedents, complete orbit/placement
coverage, certificate semantics, and the cardinality lift are not joined to
the shared `false_of_criticalPairFrontier` consumer.  No audited result in
2026-07-25..2026-08-07 closes that anchor.
