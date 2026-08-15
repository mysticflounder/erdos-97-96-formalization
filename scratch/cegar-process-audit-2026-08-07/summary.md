# P97 CEGAR mining process audit — 2026-08-07

## Scope and verdict

This is a read-only review of CEGAR/MARCO work from 2026-07-25 through
2026-08-07, using committed history, dated artifacts, the canonical closure
plans, and the live proof-blueprint anchor
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier`.

**Verdict: NARROWING + INFRASTRUCTURE, not closure.** The period produced
useful finite coverage, checked local theorem producers, exact-scope consumers,
authenticated replay/checkpoint controls, and countermodels that retired weak
abstractions. It did not produce a universal source-level producer, coverage
lift, and checked consumer that closes the anchor.

The common failures are mainly contract-boundary failures, not raw solver
weakness. Solver timeouts matter, but the largest repeated losses came from
encoding the wrong or incomplete source surface, resuming or replaying without
enough lifecycle guarantees, and mining finite results without a promotion
path.

## Recurring failure patterns

### 1. Source-to-encoding fidelity drift

This recurred across independent lanes:

- A-core silently imposed an `n <= 24` scope until the `GE25` overflow repair.
- The first crossed-arm search omitted canonical rows and later dropped two
  source-proved negative memberships.
- Projected-v3/direct-core work mixed role names or old numeric literals across
  schemas before those imports were quarantined.
- FreshThird still lacks exhaustive source aliases, all blocker partitions,
  both deletion directions, per-row witnesses, and a complete row-origin/guard
  account.

The effect is worse than a weak abstraction: a solver can spend hours proving
facts about a model that is not the live Lean premise. Earlier SAT/UNSAT
results then become historical evidence for a superseded schema rather than
cumulative progress.

**Remedy.** Make a source-surface contract mandatory before launch. For every
encoded row/fact, record object, Lean origin theorem/input, finite
representation, guard, cardinality scope, and permitted schema arms. Add small
positive and negative fixtures for aliases, guards, overflow, selector/orbit
coverage, and schema migration. A changed contract creates a new immutable
schema identity; old verdicts cannot be inherited automatically.

### 2. Solver verdicts are too coarse for mathematical meaning

The audited runners repeatedly produce four materially different outcomes:

1. semantic UNSAT under a source-complete finite contract;
2. relaxation UNSAT in a weaker or differently scoped model;
3. SAT of an abstraction, which is not a geometric counterexample; and
4. UNKNOWN, timeout, cancellation, iteration limit, or replay failure.

Historical v4 metric UNSAT, A-core incidence SAT, FreshThird SAT survivors,
QF_LRA/QF_NRA timeouts, and v34's twelve UNKNOWN cases demonstrate why a bare
`SAT|UNSAT|UNKNOWN` field is insufficient. Most current runners correctly avoid
claiming closure, but the classification still lives in prose and lane-local
logic.

**Remedy.** Introduce one project-wide typed outcome schema and make the
promotion tool consume it. Anything except independently replayed semantic
UNSAT remains non-bankable for geometric elimination. Every non-promotable
result should name the first missing contract field instead of only reporting
models blocked or runtime.

### 3. Checkpoint, retry, and replay lifecycle defects

Concrete incidents included:

- a real v8/v6 checkpoint rejected by the v9 production wrapper although the
  helper-only migration test passed;
- V18 losing all per-iteration state because durable writes occurred only
  after the loop;
- a stale `RUNNING` manifest after interruption;
- an exact-17 standalone replayer using one hard-coded cyclic order for 21
  artifacts; and
- resume reconstruction consuming minutes before useful mining began.

The project now has strong Phase-3 authenticated journals, hash chains,
idempotent resume checks, deterministic shard publication, and fresh terminal
proof replay. Those controls are not yet the common runtime for every scratch
lane.

**Remedy.** Standardize on append-before-advance iteration journals, atomic
checkpoints, immutable attempts, real outer-wrapper resume tests, explicit
worker leases, and separate restore/startup and mining budgets. Long encoder or
normalization phases must checkpoint before their first potentially fatal
operation. Minimization uses a fresh solver per trial; a second implementation
replays the minimized core and exact model/order. Any disagreement becomes
UNKNOWN.

### 4. Finite mining is disconnected from promotion

Support-4/5 coverage, exact-12/exact-15/exact-16 results, fixed-witness metric
cores, and projected-static/FreshThird banks are useful at their stated scope.
They do not supply the general-cardinality or source-coverage lift needed by
the live consumer. The 2026-08-05 `ingress_contract` gate is the right first
control: records without live leaf, source theorem/hash, schema/cardinality,
producer, lift, and consumer remain `LOCAL_CERTIFICATE` with
`promotion_eligible = false`.

**Remedy.** Turn that first control into a single wave publication gate. A
publishable wave must bind:

- live leaf and proof-blueprint anchor;
- source theorem and ingress hash;
- frozen schema, cardinality, row-origin, and case/orbit coverage;
- immutable journal, exact input/output hashes, and result taxonomy;
- independent SAT/model or UNSAT/certificate replay;
- cut-admission theorem and schema arm;
- named Lean producer, lift, terminal consumer, and no-`sorryAx` axiom audit.

Missing any field yields a local certificate, never a promoted theorem-bank
record.

### 5. Repeated detector tuning has weak stopping rules

Retained-omission accumulated dozens of rounds; v8--v34 tuning was eventually
retired after authenticated UNKNOWN-heavy runs; crossed-arm resumes learned
hundreds of thousands of instances of existing theorem families without a new
universal statement. This is useful narrowing, but it is a poor default loop.

**Remedy.** End every wave with a mandatory generalization and indexed
theorem-bank review. Do not launch another wave on the same schema after a
budget that produces only UNKNOWN, repeated clauses, or local certificates
unless the next wave changes a source hypothesis, oracle semantics, coverage
contract, or named universal producer target. Record the stop reason in the
manifest.

## How piqd can help

The lowest-risk fit is a thin Python adapter that keeps P97's outer CEGAR loop
canonical and uses piqd as a durable exact oracle.

### Useful now

- `prepare-cnf` stores exact DIMACS bytes content-addressed and binds the job
  identity to backend/profile, CNF hash, and producer-manifest hash.
- SAT models can be fetched for independent producer-side validation.
- terminal CaDiCaL UNSAT can be replayed into DRAT/LRAT artifacts over the
  byte-identical CNF.
- the live daemon has transactional multi-worker claiming, crash recovery,
  progress telemetry, and durable SAT/SMT session journals.
- profile-sensitive identity naturally separates discovery and certification
  jobs.

### Boundaries that piqd does not solve

- Manifest bytes are opaque to piqd; it cannot prove source fidelity,
  row-origin soundness, case coverage, or a universal Lean lift.
- Resetting an UNKNOWN job for retry does not preserve the scientific history
  as immutable attempt records.
- Raw DIMACS is a static oracle, not an incremental CEGAR failed-assumption or
  learned-clause API.
- Existing SAT/SMT sessions are useful infrastructure but do not supply the
  P97 cut-admission and promotion semantics.
- A solver's UNSAT remains non-publishable if proof replay or independent
  checking fails, even if piqd retains the discovery verdict.
- Arbitrary P97 QF_LRA/QF_NRA scripts need an exact raw-SMT contract or must
  remain producer-side diagnostics.

### Integration sequence

1. **P0:** add a P97 `piqd` static-oracle adapter. Submit exact CNF plus a
   manifest containing run/iteration/parent checkpoint, source and variable-map
   hashes, schema/cardinality, shard/order/seed, query polarity, solver profile,
   and intended result class. Keep the P97 journal authoritative.
2. **P1:** add immutable adapter-side attempts and the project-wide outcome
   taxonomy. Independently validate every SAT model and require checked
   DRAT/LRAT before an UNSAT enters a publication candidate.
3. **P2:** use piqd sessions only after profiling demonstrates that static
   handoff dominates runtime. Export the terminal exact CNF back through the
   static certification lane.
4. **P3:** add exact raw-SMT2 ingestion only if the metric workloads justify
   it; keep UNKNOWN and non-certificate results diagnostic.

The first acceptance gate should test byte-identical dedup, manifest/profile
identity separation, immutable UNKNOWN retries, crash/resume, independent SAT
model checking, certified-vs-discovery UNSAT, fail-closed missing blobs, shard
identity, and rejection of manifests missing source/lift/consumer evidence.

## Highest-leverage next move

Before launching another large mining wave, define and test
`p97-cegar-wave/v1`: the source-surface contract, typed outcome record,
immutable attempt journal, and publication gate described above. Then route one
existing static exact-CNF lane through a thin piqd adapter as the reference
implementation. Do not begin by moving the outer CEGAR loop or the QF_NRA
metric oracle into piqd.

## Evidence reports

- `history.md` — dated chronology and mathematical outcome classification.
- `mechanics.md` — checkpoint, replay, MARCO, and runtime audit.
- `fidelity.md` — source-ingress, coverage, certificate, and promotion audit.
- `piqd.md` — current piqd capability matrix and integration acceptance tests.

No solver, build, production edit, commit, or push was performed for this
audit.
