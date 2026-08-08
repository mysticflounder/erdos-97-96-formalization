# piqd adoption gaps for P97 SAT and CEGAR work

Date: 2026-08-08

Status: implementation and migration plan. This document makes no mathematical
closure claim.

## Executive decision

piqd is ready to be the persistent oracle for a static, fully materialized CNF:
it stores the exact submitted bytes, deduplicates jobs, runs a bounded solver,
persists status and artifacts, returns SAT models, and can produce a CaDiCaL
proof artifact for independent Lean replay.

It is not yet the default path for most P97 SAT or CEGAR work. Current searches
still invoke Z3, CaDiCaL, cvc5, or an IPASIR CaDiCaL instance directly. The
existing P97 piqd driver and the exact-12 source-bound canary prove that the
required trust boundary works for a real producer artifact, but they remain a
one-job integration rather than a general campaign service.

The intended division of responsibility is:

```text
P97 owns                              piqd owns
-----------------------------------   ----------------------------------
source theorem and finite ingress     exact submitted solver bytes
encoder and variable map              immutable job identity
CEGAR refinement order                bounded solver execution
attempt journal and resume policy     persistent job state
source-semantic SAT validation        raw model, log, and proof artifacts
Lean proof replay and theorem lift    content-addressed storage
producer/lift/consumer promotion      queueing and deduplication
```

“Most SAT/CEGAR work through piqd” should mean:

1. every production static CNF solve is submitted as an authenticated piqd job;
2. every CEGAR iteration that needs a fresh nonincremental SAT call submits its
   materialized CNF through piqd;
3. SAT and UNSAT artifacts return through one checked P97 adapter; and
4. direct subprocess solves remain only for explicitly documented exceptions,
   principally incremental IPASIR and nonlinear SMT/realizability stages.

It should not mean moving mathematical source validation, CEGAR policy, Lean
promotion, or every incremental solver call into the daemon.

## Current verified surface

| Capability | Current status | Evidence or limitation |
| --- | --- | --- |
| Raw DIMACS ingestion | Ready | `POST /jobs/prepare-cnf` preserves and hashes the exact bytes. |
| CaDiCaL static SAT/UNSAT | Ready | Live daemon smoke completed on the installed `piqd` binary. |
| Exact CNF retrieval and binding | Ready | The P97 client rejects job/CNF/hash disagreement. |
| SAT model checking | Ready at CNF level | The P97 client independently checks that a complete returned assignment satisfies the submitted CNF. Source-semantic decoding remains workflow-specific. |
| UNSAT proof production | Ready for CaDiCaL | piqd replays terminal UNSAT with binary DRAT and converts it to LRAT. |
| Independent Lean LRAT replay | Ready for the current P97 adapter | Certification binds the job, CNF, backend/profile, proof, checker, exact replay command, and receipt. |
| Durable P97 attempt journal | Ready for one-job waves | Retries and responses are append-only, hash chained, archived, and sealed. |
| High-throughput campaign scheduling | Not ready | The daemon runner is single-threaded and the P97 driver handles one job invocation at a time. |
| Incremental CEGAR solving | Not provided | The current raw-job API accepts a complete CNF per job; it does not expose an IPASIR-style incremental session. |
| Nonlinear SMT/Euclidean validation | Not integrated | Current Z3/cvc5 realizability lanes remain separate from the raw-DIMACS adapter. |
| General P97 workflow adoption | Partial | One exact-12 normalized-v14 cell has completed source-semantic replay; exact-17 and older Phase-3 workers still include direct local solver paths. |

The focused oracle/package/driver/replay test matrix currently passes 88 tests.
The exact-12 normalized-v14 cell-0 live replay produced the accepted
source-semantic receipt
`80dbbd70a6542d81248d2f85277c4bb5af296d8af23a30f95031e093c4182914`.
The larger Phase-3 regression reported 421 tests and 2 subtests. The live
synthetic UNSAT smoke produced an LRAT artifact accepted by the pinned Lean
replayer. These results validate one real SAT ingress/replay path and the
control plane; they do not validate every P97 encoder, establish campaign
coverage, or close a P97 theorem.

## Required gaps

### G1. Extract a reusable project-side oracle API and package adapter

The current implementation is named and packaged as
`phase3_piqd_{oracle,driver,replay}.py`. Its core is useful outside Phase 3, but
campaigns do not yet have a stable shared interface.

Required work:

- define a canonical on-disk job package containing the exact CNF, canonical
  producer manifest, variable-map artifact, candidate-order artifact, wave
  manifest, and all hashes needed to bind those files together;
- add fail-closed adapters from the existing generator-specific schemas into
  that package, validating declared hashes against the actual artifact bytes;
- send the producer manifest as the exact byte string that was hashed. piqd
  hashes the request bytes as received and does not canonicalize parsed JSON,
  so an HTTP layer must not reserialize a manifest object after hashing it;
- require the adapter to classify exactly which formula is being submitted —
  for example the base formula, a cube, a cell, a checkpoint formula, or a
  terminal formula — so a successful solve cannot be attributed to the wrong
  logical scope;
- require an explicit solver profile on every production submission; an empty
  raw-DIMACS profile currently selects the SAT configuration and is not an
  acceptable implicit choice for an expected-UNSAT wave;
- expose a reusable `RawCnfJob`, `RawCnfResult`, and durable attempt-journal API;
- accept the immutable package without Phase-3-specific assumptions;
- retain the actual variable-map and candidate-order artifacts for audit and
  semantic replay. The current driver binds them by hash but does not otherwise
  consume their contents;
- retain the existing fail-closed result vocabulary and receipt validation;
- provide a library entry point in addition to the one-shot CLI; and
- migrate the existing Phase-3 driver onto that shared implementation without
  weakening its current tests.

Status: partially complete. The exact-12 normalized-v14 cell-0 artifact has now
been packaged, submitted, and semantically replayed end to end. That closes the
first-real-producer canary, including source-file, compiler-manifest, CNF,
variable-map, cell/order, model, and source-predicate checks.

Remaining acceptance condition: extract the exact-12 implementation from the
Phase-3-named modules into a stable producer-neutral library, then make
exact-cardinality, projected-static, and one other P97 CNF producer call that
library without copying lifecycle code. The 88-test focused matrix must remain
green. Until this reuse exists, the project has a demonstrated production
canary but not a general P97 package adapter.

Owner: P97 integration.

### G2. Add a batch campaign controller

Submitting one CLI process per cell or shard does not replace the existing
24-worker SAT campaigns. P97 needs a controller above piqd that can prepare,
confirm, reconcile, and collect many immutable jobs.

Required work:

- materialize a campaign manifest containing the ordered cell/shard universe;
- bound the number of prepared, confirmed, and active jobs;
- reconcile already-existing jobs after restart without duplicating attempts;
- preserve one append-only attempt history per logical cell;
- aggregate terminal outcomes without treating a partial campaign as coverage;
- support cancellation and a clean checkpoint that leaves confirmed jobs
  recoverable; and
- emit a coverage manifest binding every expected cell to one authenticated
  terminal result.

Acceptance condition: a multi-cell known SAT/UNSAT/UNKNOWN fixture survives a
controller crash and restart, produces no duplicate logical attempts, and
refuses to claim coverage when any expected cell is missing or nonterminal.

Owner: P97 integration.

### G3. Make daemon throughput configurable and safe

piqd currently has one runner task. This serializes independent confirmed jobs,
so routing a 16- or 24-shard campaign through it would reduce throughput even
though job custody improves.

Required work in piqd:

- make job claiming safe for multiple runner tasks;
- add a configurable worker/core budget;
- prevent oversubscription when a backend such as `march_cu` uses internal
  parallelism;
- add project or priority fairness so a long campaign cannot starve small
  proof/replay jobs;
- propagate cancellation to the solver process; and
- retain crash recovery without allowing two workers to own one job.

Acceptance condition: a concurrent integration test runs distinct jobs in
parallel, proves at-most-one active owner per job, respects the configured core
budget, and recovers running jobs exactly once after daemon restart.

Owner: piqd.

### G4. Define a retry identity for raw `UNKNOWN` and `failed` jobs

Raw-DIMACS jobs are immutable and content-addressed. Re-preparing the same raw
identity after `UNKNOWN` or daemon `failed` returns the existing terminal job;
there is no reset/requeue operation. A longer timeout, new seed, or fresh solver
attempt must therefore become a deliberately distinct identity.

Required work:

- choose either a daemon-supported attempt generation or a P97 producer-
  manifest nonce with explicit semantics;
- bind changed timeout, seed, backend, and solver profile into the new attempt;
- preserve the prior terminal job and journal record;
- prevent a retry from masquerading as a replay of the original execution; and
- document which parameter changes create a new solver identity.

Acceptance condition: a forced-UNKNOWN raw job can be retried under a new,
auditable identity while both attempts remain retrievable and the old receipt
cannot certify the new attempt.

Owner: joint piqd/P97 contract.

### G5. Add a CEGAR iteration adapter

piqd can solve each static query, but it does not decide how a SAT model becomes
a learned clause or how that clause changes the next query. Each CEGAR driver
currently owns this logic in its own format.

Required work:

- define a workflow hook that decodes a checked DIMACS model using the bound
  variable map;
- re-evaluate the model against the source-level finite predicates;
- classify it as a valid survivor, an encoder defect, or a refinement witness;
- produce the next immutable CNF plus a parent-attempt hash;
- journal the learned cut with its theorem/provenance class; and
- ensure a restart resumes from the last authenticated refinement, not merely
  from the latest piqd job.

Acceptance condition: a small three-iteration fixture performs
SAT → refinement → SAT → refinement → certified UNSAT, then reproduces the same
chain after restart with every child bound to its parent.

Owner: P97 integration, with one adapter per finite schema.

### G6. Separate static-oracle migration from incremental solving

The projected-static code has an IPASIR CaDiCaL path that keeps one clause
database alive across many assumptions. Turning every assumption query into a
new HTTP job would discard that advantage and create many large duplicate
blobs.

Required decision:

- keep incremental IPASIR as an explicit local exception and submit only
  checkpoints, disputed models, and terminal CNFs to piqd; or
- add a separately specified incremental-session API to piqd with durable base
  CNF identity, assumption sets, session recovery, and result artifacts.

The recommended first implementation is the explicit exception. It obtains
piqd custody for publication-relevant artifacts without delaying adoption on a
new stateful protocol.

Acceptance condition: every result promoted from an incremental run has a
materialized terminal CNF submitted through piqd and checked through the normal
artifact path, while ordinary exploratory assumption calls are labeled local.

Owner: P97 policy now; piqd only if an incremental API is later authorized.

### G7. Standardize source-semantic SAT validation

The shared client proves only that the returned assignment satisfies the exact
CNF. That does not prove that the encoder included every source hypothesis or
that the variable map decodes to the intended finite object.

Required work:

- define a validator receipt schema binding source theorem, finite schema,
  encoder revision, variable map, CNF, model, and decoded object;
- require positive and negative semantic smoke fixtures for each migrated
  encoder;
- rerun source predicates on decoded SAT models where practical;
- distinguish structural SAT, metric SAT, Euclidean realization, and solver
  UNKNOWN; and
- refuse CEGAR learning from a model whose semantic validation is absent or
  stale.

Acceptance condition: tampering with the source hash, variable map, decoded
object, or validator revision invalidates the receipt, and a known encoder
omission is caught by the negative fixture.

Owner: each P97 encoder, enforced by the shared P97 adapter.

### G8. Finish backend-specific artifact support

The strongest current certification path is CaDiCaL. Other paths have narrower
support:

- `march_cu` does not expose one compact proof through the current P97 adapter;
  per-cube proof manifests need retrieval, checking, aggregation, and Lean
  ingress;
- `kissat` is named in the backend vocabulary but is not wired into the piqd
  runner; and
- P97 cvc5/Z3 nonlinear checks have no equivalent authenticated adapter.

Required work should be demand driven. CaDiCaL is sufficient for the first
migration wave. `march_cu` proof aggregation is the next useful backend feature
for large certified UNSAT campaigns. Nonlinear SMT should retain a distinct
result class even after artifact custody is added.

Acceptance condition for `march_cu`: every cube is covered exactly once, every
UNSAT cube proof is independently checked, any SAT cube has an independently
checked global model, and the aggregate receipt binds the partition and all
children.

Owner: joint piqd/P97 backend adapters.

### G9. Add operational observability and retention policy

The live daemon persists jobs and recovers interrupted running work, but broad
adoption needs routine operational answers without inspecting SQLite or process
tables manually.

Required work:

- a health endpoint exposing daemon identity, installed solver identities,
  queue depth, active workers, and disk usage;
- per-project queue and outcome summaries;
- structured metrics for solve time, queue time, retries, UNKNOWN, failures,
  proof generation, and artifact download/replay;
- a launch/service policy for automatic restart;
- a content-addressed export/backup procedure for publication artifacts; and
- a retention or garbage-collection policy for nonpublication logs and models,
  while preserving immutable jobs referenced by sealed receipts.

Acceptance condition: the campaign controller can fail closed on daemon or
solver identity drift and can report queue/worker/disk pressure before launch.

Owner: piqd operations plus P97 dashboard integration.

### G10. Close the remaining daemon defect without blocking raw adoption

`PIQD-ENC-001` is a lookup/insert race for concurrent identical requests to
the encoder endpoint `POST /jobs/prepare`. The current P97 route exclusively
uses raw `POST /jobs/prepare-cnf`, whose corresponding race is fixed in the
installed release. Therefore this defect should be repaired, but it is not a
blocker for P97 raw-DIMACS migration.

Acceptance condition: concurrent identical encoder prepares all return the
same immutable job identity without HTTP 500, backed by a barrier regression
test.

Owner: piqd.

## Recommended migration order

### Stage 0 — preserve the proven boundary

- Keep the existing Phase-3 piqd driver and 88-test focused matrix green.
- Keep independent SAT-model checking and Lean LRAT replay mandatory.
- Keep `DISCOVERY_UNSAT` distinct from `CERTIFIED_UNSAT`.
- Do not treat a piqd receipt as source-semantic validation or theorem closure.

### Stage 1 — migrate static CaDiCaL jobs

Implement G1, G2, G4, and the minimum part of G7. Then migrate:

1. exact-cardinality terminal CNFs;
2. source-faithful static CEGAR iterations;
3. Phase-3 nonincremental structural queries; and
4. certificate-bank proof replays.

This stage should cover most direct `cadical` subprocess custody without
changing the mathematical search algorithms.

### Stage 2 — recover production throughput

Implement G3 and G9. Run canaries before a full campaign:

- one known SAT job;
- one known certified UNSAT job;
- one forced UNKNOWN job;
- concurrent duplicate submissions;
- daemon restart during a solve; and
- a mixed short/long queue under the production core budget.

Only after these pass should the 16- or 24-shard campaigns be routed entirely
through one daemon.

### Stage 3 — connect complete CEGAR loops

Implement G5 and the policy in G6. A CEGAR coordinator remains in P97, but every
nonincremental oracle query and every publication-relevant terminal CNF goes
through piqd.

### Stage 4 — add backend breadth where it pays

Implement `march_cu` proof aggregation first. Add Kissat or nonlinear SMT
custody only when a named production lane has a measured need and an exact
consumer contract.

## Workflow migration matrix

| Workflow | Desired piqd role | Migration status | Blocking gaps |
| --- | --- | --- | --- |
| Exact-cardinality static CNF banks | Full job custody, model check, UNSAT proof replay | Exact-12 cell-0 canary passed; broad migration remains open | G1, G2, G7 |
| Exact-17 source-faithful CEGAR | Static query and terminal-artifact oracle | Current active loop is local | G1, G5, G7; G3 before a large wave |
| Phase-3 projected-static nonincremental mode | Full static oracle | Prototype driver exists | G1, G2, G5 |
| Phase-3 IPASIR incremental mode | Terminal/checkpoint custody only | Explicit local exception | G6 |
| `march_cu` cube-and-conquer | Scheduling plus aggregate proof custody | Incomplete certification adapter | G3, G8 |
| Metric/Euclidean Z3 and cvc5 checks | Artifact custody only, with separate semantics | Not integrated | G7, G8 |
| Lean certificate replay | Independent P97 authority consuming piqd artifacts | Ready for CaDiCaL LRAT | Preserve Stage-0 gates |

## Definition of done

The project may say that piqd handles most SAT/CEGAR work when all of the
following are true:

- no production static CaDiCaL workflow invokes the solver directly unless it
  is listed as a temporary exception;
- the shared adapter, rather than workflow-local HTTP/subprocess code, owns job
  preparation, confirmation, reconciliation, model/proof retrieval, and
  receipts;
- multi-job throughput is comparable to the current local worker campaigns and
  respects the core budget;
- UNKNOWN, daemon failure, poll timeout, and retry generations remain distinct;
- every migrated encoder has source-semantic SAT fixtures and a bound variable
  map;
- every promoted UNSAT result has independent proof checking and Lean replay;
- CEGAR parent/child/refinement history survives restart and is authenticated;
- dashboards expose queue, worker, failure, and disk state; and
- the documented incremental and nonlinear exceptions are the only remaining
  direct solver paths.

Even after this definition is met, piqd results remain finite solver evidence.
A P97 theorem closes only when the finite result has the required source
producer, coverage or lift, direct Lean consumer, and transitive axiom audit.

## Related documents

- [`audits/p97-cegar-process-audit-2026-08-08.md`](audits/p97-cegar-process-audit-2026-08-08.md)
- [`audits/piqd-integration-bugs-2026-08-07.md`](audits/piqd-integration-bugs-2026-08-07.md)
- [`computational-closure-plan-2026-07-28.md`](computational-closure-plan-2026-07-28.md)
