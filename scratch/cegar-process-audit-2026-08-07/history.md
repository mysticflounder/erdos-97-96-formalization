# CEGAR mining chronology/outcomes audit

Scope: `/Users/adam/projects/math-projects/erdos-97-96-formalization`, branch
`main`, inclusive 2026-07-25 through 2026-08-07. Evidence is committed history
and dated repo artifacts; this audit ran read-only with no builds, solver runs,
or git mutations. Shared proof-blueprint anchor:
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier`
(`docs/live-blueprint.md:72`; coordinator source at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Coordinator.lean:778`).

## Chronology

- **2026-07-25 — complete finite coverage and local producers.** Commits
  `4b05baf9`, `5641ec04`, and `0d76b444` updated
  `scratch/atail-force/mixed-law-family/REPORT.md`: every support-4 and
  support-5 equality/disequality pattern was decided, with no geometric
  content; n≥10/n≥15 remained a bank-completeness/open diagnostic. Commit
  `21dd883c` added sorry-free cap/radius lemmas in
  `lean/Erdos9796Proof/P97/ATail/{CapInteriorRadiusCounting,CapApexRadiusRigidity}.lean`.

- **2026-07-28 — empirical/infrastructure CEGAR, with a scope correction.**
  Commits `b328136d` and `9e8ed3d5` updated
  `census/frontier-packages/a_core/{encoding.py,RESULTS.md,out/*}`. Smoke and
  DRAT gates passed, but all eight verdict runs remained SAT. The result file
  states at `:38-43` that SAT is only a model of the incidence CNF. The
  closure plan (`docs/computational-closure-plan-2026-07-28.md:52-56`, later
  correction) records repair of an unsound hidden n≤24 scope using a GE25
  bucket; refreshed packages still SAT.

- **2026-07-29–30 — narrowing and producer routing.** `e7ce7f22` checkpointed
  the aligned-singleton metric frontier; `d6ba2478` recorded certificate-bank
  lift analysis in `docs/p97-certificate-bank-lift-analysis-2026-07-30.md`;
  `1453c714` reduced the aligned collision to a FreshThird fiber in
  `lean/Erdos9796Proof/P97/ATail/LocalizedCollisionMutualOmissionCycle.lean`
  and `FrontierLiveClosure.lean`. The induced metric runs were SAT/UNKNOWN
  diagnostics, not full-carrier or Euclidean closure.

- **2026-07-31 — empirical obstruction/budget-unknown.** Commit `db748265`
  landed the aligned-singleton/nonbisector CEGAR artifacts under
  `scratch/atail-force/aligned-singleton-second-nonbisector-{induced,cegar}/`.
  Local strict-Kalmanson survivors and QF_NRA timeouts did not establish a
  countermodel or theorem-level closure.

- **2026-08-01–02 — fixed-witness evidence, bank/consumer audits, and
  narrowing.** Commit `6843e61a` banked the Kalmanson family and commit
  `f952a7f0` recorded crossed-arm CEGAR results. A fixed v8 metric system had
  an externally replayed Farkas UNSAT, but no Lean proof or universal lift;
  later crossed-arm waves retained UNKNOWN/SAT outcomes. Commits `ee645208`,
  `56d9e06d`, and `d076eefc` audited FreshThird consumers/probes and an
  exact-fifteen S-profile bank; the missing source-to-consumer bridge remained
  open.

- **2026-08-03 — correction/supersession and budget-unknown.** Commits
  `a5dc3156`, `4e1370cc`, and `61d11be0` produced and then retired the v34
  retained-omission canary lineage. Its authenticated report,
  `scratch/retained-omission-e1/round5-general-cegar/V34-HARD-CANARY-TERMINAL.md:5-18,56-63`,
  records 12/12 UNKNOWN, 0 SAT, 0 terminal UNSAT, zero Boolean cuts, and
  retires v8–v34 tuning. v35 was a constrained successor requiring new
  source-entitled semantics, not closure.

- **2026-08-04 — infrastructure plus a checked obstruction.** Commit
  `942ba577` added Phase-3 scheduler/checkpoint/telemetry infrastructure and
  `fab07aee` documented its promotion contract. Commits `7aef68f8` and
  `f475e7a3` landed the R-branch capture audit. Its report
  `scratch/atail-force/capture-insufficiency/REPORT.md:5-42,119-124` gives a
  kernel-checked Fin 17 countermodel showing the capture packet is not
  producible from the 39 enumerated incidence fields; it explicitly shrinks
  no on-spine sorry.

- **2026-08-05–06 — sharding, residual narrowing, and finite producers.**
  `8316f3d2` paired FreshThird with a source-faithful cover; the route still
  lacked universal coverage. Sharding commits `896c7588` and the Rigid221
  split sequence were delivery/narrowing work. `0921623f` added exact-15
  BlockerV coverage ingress in
  `lean/Erdos9796Proof/P97/ATail/BlockerVExactFifteenFourRowCoverage.lean`;
  this is a finite/placement-scope producer, not a general anchor closure.

- **2026-08-07 — exact-scope residuals, schema banks, and diagnostic
  FreshThird continuation.** Commits `18018288` and `9548724d` closed named
  exact-15/16 BlockerV residuals; `2106a964` and `37771f43` banked Rigid221
  Kalmanson schemas. Commits `5be5e068` and `fdaad8f2` continued FreshThird
  source-faithful/resumable CEGAR. The coverage contract
  `scratch/p97-consumer-first/freshthird_source_encoder_coverage_contract_2026-08-07.md:19-27`
  says the sweep is diagnostic, omits all 15 blocker partitions and both
  deletion directions, and lacks source-role adapters. The call-6 artifact
  preserved a SAT survivor and a cvc5 timeout; no sorry was closed.

## Recurring failure patterns

1. **Solver status exceeded semantic scope.** A-core SAT was incidence-only
   (`census/frontier-packages/a_core/RESULTS.md:38-43`); the closure plan says
   even UNSAT without source producer, coverage, cardinality scope, replay,
   and consumer is diagnostic (`docs/computational-closure-plan-2026-07-28.md:24-43`).

2. **Missing source-faithful ingress recurred.** FreshThird lacks role,
   partition, per-row, and both erased-row coverage
   (`freshthird_source_encoder_coverage_contract_2026-08-07.md:19-27`). The
   R-branch countermodel shows that adding local motif cuts cannot derive the
   missing capture packet (`capture-insufficiency/REPORT.md:15-42`).

3. **Timeout/normalization tuning did not converge.** V34 records 12 UNKNOWN,
   zero learned cuts, and retires v8–v34 (`V34-HARD-CANARY-TERMINAL.md:5-18,56-63`).
   The 2026-08-07 resumable harness improved restartability, but its preserved
   metric replay still timed out and was not promoted.

4. **Finite evidence lacked a universal lift.** Support-4/5 coverage,
   fixed-witness Kalmanson certificates, and exact-15/16 BlockerV producers
   remain valid at their stated scopes; none supplies a general-cardinality
   and source-coverage lift into the live anchor.

## Conclusion

The interval produced real finite coverage, reusable local/kernel-checked
producers, exact-scope BlockerV consumers, and an R-branch incidence
countermodel. It did not close
`false_of_criticalPairFrontier`. FreshThird and retained-omission mining
provided narrowing and infrastructure, but solver SAT/UNSAT/UNKNOWN statuses
were not proof closure.

