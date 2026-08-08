# piqd adoption gaps for P97 SAT and CEGAR work

Date: 2026-08-08

Status: implementation and migration plan. This document makes no mathematical
closure claim.

## Executive decision

piqd is ready to be the persistent oracle for a static, fully materialized CNF:
it stores the exact submitted bytes, deduplicates jobs, runs a bounded solver,
persists status and artifacts, returns SAT models, and attempts to produce a
CaDiCaL proof artifact for independent Lean replay. A solver-level `UNSAT`
remains uncertified when that second proof-production pass fails.

The current daemon also has configurable concurrent workers and persistent SAT
and SMT sessions. Those capabilities are implemented in piqd, but the P97
campaign code has not yet production-qualified or adopted them. The remaining
work is therefore mostly at the project/daemon contract boundary rather than a
need to invent a new solver service.

It is not yet the default path for most P97 SAT or CEGAR work. Current searches
still invoke Z3, CaDiCaL, cvc5, or an IPASIR CaDiCaL instance directly. The
existing P97 piqd driver, exact-12 source-bound canary, and authenticated
three-record stop/pivot controller prove that the required trust boundary works
for a real producer artifact. They remain a sequential, exact-12-specific
integration rather than a general campaign service: the controller deliberately
sets `MAX_IN_FLIGHT = 1` and denies aggregate coverage, source entitlement, and
theorem closure.

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

1. every production static CNF solve is submitted as a content-addressed,
   artifact-bound piqd job;
2. every CEGAR iteration uses either a bound piqd session or a freshly
   materialized immutable piqd job;
3. every static SAT assignment is treated as log-derived data: the adapter
   must require a complete assignment and retain the exact source log;
4. SAT and UNSAT artifacts return through one checked P97 adapter; and
5. direct subprocess solves remain only for explicitly documented backend or
   exploratory exceptions.

It should not mean moving mathematical source validation, CEGAR policy, Lean
promotion, or theorem lifting into the daemon.

Here “authenticated” means hash-bound local byte custody and a replayable
provenance chain. It does not mean authenticated submitter identity,
authorization, or source-theorem entitlement; piqd treats the producer manifest
as opaque caller-supplied bytes.

This plan is scoped to the current local-only deployment. piqd accepts remote
HTTP clients, but it does not presently supply authenticated submitter
identities, transport security, a remote worker registry, a multi-host
scheduler, or authorization for the shutdown route. In particular, any client
that can reach the current unauthenticated `POST /shutdown` endpoint can stop
the daemon. Loopback binding contains that risk in the present deployment;
these controls are required before treating an idle remote machine as part of
one trusted daemon pool. They do not block migrating the local P97 solver work
described here.

## Current verified surface

This surface was re-audited on 2026-08-08 against the installed `piqd` binary
and the current Rust source checkout. `piqd --help` exposes `--max-workers`;
its default is the host's detected parallelism, which is 32 on this machine,
not a fixed daemon constant. P97 production launches must pass
`--max-workers 24` explicitly to preserve the local solver-core budget. The
source contains both atomic multi-worker job claiming and persistent
`/sessions` APIs. Older piqd skill text describing the daemon as single-threaded
is stale.

| Capability | Current status | Evidence or limitation |
| --- | --- | --- |
| Raw DIMACS ingestion | Ready within its current envelope | `POST /jobs/prepare-cnf` preserves and hashes exact bytes up to 256 MiB. It accepts CaDiCaL, Kissat, and `march_cu`, but currently validates every backend's profile string against the CaDiCaL profile vocabulary. |
| CaDiCaL static SAT/UNSAT | Ready | Live daemon smoke completed on the installed `piqd` binary. |
| Kissat static discovery | Implemented but unavailable on the current host | The runner can dispatch Kissat and parse a SAT model, but the executable is absent from the live solver inventory and there is no proof-artifact path accepted for promoted UNSAT. |
| Exact CNF retrieval and binding | Ready | The P97 client rejects job/CNF/hash disagreement. |
| SAT model checking | Ready at CNF level | Static assignments are reparsed from retained solver-log `v` lines, not stored as dedicated model blobs. The P97 client requires a complete returned assignment and checks it against the submitted CNF; source-semantic decoding remains workflow-specific. |
| UNSAT proof production | Implemented for CaDiCaL; promotion must fail closed when absent | piqd attempts binary-DRAT replay and LRAT conversion after terminal UNSAT. Proof generation can fail while the job remains solver-level `UNSAT`; then `/proof` returns 404 and P97 must retain `DISCOVERY_UNSAT`. |
| Independent Lean LRAT replay | Ready for the current P97 adapter | Certification binds the job, CNF, backend/profile, proof, checker, exact replay command, and receipt. |
| Durable P97 attempt journal | Ready for one-job waves | Retries and responses are append-only, hash chained, archived, and sealed. |
| Concurrent static solving | Implemented in piqd; not production-qualified for P97 | `--max-workers` starts independent worker loops and atomic claims prevent duplicate ownership. P97 still lacks resource weights, production concurrency canaries, and a general batch controller. |
| Stateful SAT/SMT sessions | Implemented in piqd; not integrated with P97 | SAT sessions support durable clause append, assumptions, model/core results, restart recovery, and terminal CNF handoff. Z3/cvc5 sessions persist assertions and textual results. No public session-cancel route is exposed. |
| Nonlinear SMT/Euclidean validation | Daemon custody exists; P97 validation is absent | The session API can run Z3/cvc5, but P97 has no source-semantic receipt, exact replay classification, or promotion contract for these results. |
| General P97 workflow adoption | Partial | One exact-12 normalized-v14 cell has completed source-semantic replay; exact-17 and older Phase-3 workers still include direct local solver paths. |

The live daemon snapshot used for this audit is piqd `0.1.0`, protocol 1,
binary SHA-256
`476585dd8e11c93dd1d03c5ec9d4b9e52735eae9fdda0895f60508f7d20ea865`.
With `GET /jobs?limit=1000`, it reports 247 retained jobs: 240 completed and
seven prepared, with no running jobs. It has no live sessions. This proves that
the service is operational; it does not measure production throughput because
the active exact-17 workers still run outside piqd.

The live `/solvers` inventory currently exposes only CaDiCaL session workers.
Source support for another backend does not establish executable availability
on this host. The raw endpoint also rejects a CNF above 256 MiB (with a 272 MiB
multipart-body ceiling), so each migration must preflight the materialized
artifact size rather than assume that every large exact-17 or Phase-3 formula
can be submitted unchanged.

The current oracle/package/driver/campaign/replay test matrix
passes 120 tests. The piqd Rust library has 160 passing tests with two ignored,
and the piqc library has 80 passing tests. The campaign hardening checkpointed
at `6fcf51e4`
adds descriptor-relative no-follow snapshots, transitive artifact binding,
locked idempotent admission, malformed-input rejection, threshold monotonicity,
and replay-after-mutation tests. G11 is therefore a durable repository
capability rather than an uncommitted working-tree claim.
The exact-12 normalized-v14 cell-0 live replay produced the accepted
source-semantic receipt
`80dbbd70a6542d81248d2f85277c4bb5af296d8af23a30f95031e093c4182914`.
The larger Phase-3 regression reported 421 tests and 2 subtests. The live
synthetic UNSAT smoke produced an LRAT artifact accepted by the pinned Lean
replayer. These results validate one real SAT ingress/replay path and the
control plane; they do not validate every P97 encoder, establish campaign
coverage, or close a P97 theorem.

A newer P97 working-tree follow-on upgrades the campaign/result schemas and
source classifier to v2, snapshots every declared detector source exactly once,
and restricts learned clauses to variables supported by the authenticated
positive assignment witness. Its focused piqd matrix reports 143 passing tests.
Those changes are useful partial progress on G5 and G7, but they are not counted
as a durable capability here until they are committed and the existing v1
campaign artifacts are explicitly regenerated.

The practical critical path is:

1. finish the producer-neutral package/client and production batch controller
   (G1–G2), preserving the now-tested G11 custody boundary;
2. authenticate the CEGAR refinement and source-semantic validation layers
   (G5–G7);
3. production-qualify the concurrency already present in piqd (G3, G9); and
4. migrate static CaDiCaL first, then the CEGAR lanes that can use the existing
   session API.

G4, G8, and G10 are narrower contract/backend issues. They matter, but they do
not justify delaying the first broad static-CaDiCaL migration.

## Required gaps

### G1. Extract a reusable project-side oracle API and package adapter

The current implementation is named and packaged as
`phase3_piqd_{oracle,driver,package,replay}.py`. Its core is useful outside
Phase 3, but the package format remains Phase-3/exact-12-schema-specific and
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
- preflight the raw-CNF size limit and either shard an artifact above 256 MiB
  with authenticated coverage or record it as a direct-solver exception; and
- migrate the existing Phase-3 driver onto that shared implementation without
  weakening its current tests.

Status: partially complete. The exact-12 normalized-v14 cell-0 artifact has now
been packaged, submitted, and semantically replayed end to end. That closes the
first-real-producer canary, including source-file, compiler-manifest, CNF,
variable-map, cell/order, model, and source-predicate checks.

Remaining acceptance condition: extract the exact-12 implementation from the
Phase-3-named modules into a stable producer-neutral library, then make
exact-cardinality, projected-static, and one other P97 CNF producer call that
library without copying lifecycle code. The 120-test focused matrix must remain
green. Until this reuse exists, the project has a demonstrated production
canary but not a general P97 package adapter.

Owner: P97 integration.

### G2. Add a batch campaign controller

Submitting one CLI process per cell or shard does not replace the existing
24-worker SAT campaigns. P97 needs a controller above piqd that can prepare,
confirm, reconcile, and collect many immutable jobs.

`phase3_piqd_campaign.py` is a useful authenticated stop/pivot controller. Its
three-record canary survives exact-byte snapshot replay, concurrent admission,
and idempotent retry, and fails closed on malformed or relabeled artifacts. It
still sets `MAX_IN_FLIGHT = 1`, explicitly denies aggregate coverage, and is not
a scheduler. It should be the starting regression surface, not be mistaken for
production batch adoption.

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

### G3. Production-qualify daemon concurrency and resource accounting

The basic concurrency mechanism is already implemented: piqd starts a
configurable number of independent worker loops, and `claim_next_confirmed`
uses an immediate SQLite transaction so one confirmed job is claimed once.
What remains is proving that this mechanism safely replaces the existing P97
worker launchers under realistic load. Scheduling is currently one global FIFO
queue with no priorities, weights, campaign groups, or per-job resource
isolation.

Required work:

- launch the daemon under an explicit P97 ceiling of at most 24 total solver
  cores;
- prevent oversubscription when a backend such as `march_cu` uses internal
  parallelism;
- add project or priority fairness so a long campaign cannot starve small
  proof/replay jobs;
- add cancellation for queued/running static jobs with defined artifact state;
- test mixed short/long workloads, duplicate submissions, and restart recovery;
  and
- measure wall time against the current local 16- and 24-worker campaigns.

Acceptance condition: 24 independent single-core jobs run concurrently without
duplicate claims, a weighted backend cannot exceed the total core budget, short
proof jobs are not starved by a long campaign, and interrupted jobs recover
exactly once after daemon restart.

Owner: joint piqd operations/P97 integration.

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

Status: partially complete in the current working tree. The v2 source
classifier binds an exact detector-source snapshot and rejects learned clauses
whose variables are absent from the authenticated positive witness. It does not
yet provide a producer-neutral parent/child CNF chain, restartable multi-step
refinement, or certified terminal handoff.

Owner: P97 integration, with one adapter per finite schema.

### G6. Integrate the existing stateful session API

piqd already provides persistent SAT and SMT sessions. SAT sessions support
incremental clause append, assumptions, timeout/conflict limits, model or
assumption-core results, a durable clause journal, restart recovery pinned to
the solver binary/protocol, and `piqc session handoff` to materialize the exact
terminal CNF through the static proof path. SMT sessions persist Z3/cvc5
assertions and textual results. P97 currently uses none of this through a
shared authenticated adapter.

Required P97 work:

- add a session client and receipt binding the base source package, variable
  map, solver binary/protocol identity, and ordered refinement journal;
- append clauses with checked counts/hashes and record the source theorem or
  model defect justifying each learned cut;
- bind every solve's assumptions and resource limits to its result;
- either expose a public session-cancel operation with an auditable terminal
  state or specify that timeout/process restart is the only supported
  interruption path; SAT has an internal cancel frame, but neither it nor SMT
  cancellation is available through the current HTTP API;
- add a restart fixture that resumes the same authenticated session;
- independently validate SAT models and distinguish SMT evidence from exact
  certificates; and
- hand terminal SAT/UNSAT checkpoints to the immutable static path so promoted
  UNSAT results still receive independent proof checking and Lean replay.

Local IPASIR may remain as a measured temporary exception when its performance
is materially better, but it is no longer the only available incremental
architecture.

Acceptance condition: a three-iteration
SAT → refine → SAT → refine → terminal UNSAT fixture survives a
daemon restart, and session handoff produces a certified static result bound to
the complete refinement chain.

Owner: P97 integration, with piqd fixes only if the live session contract proves
insufficient.

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

Status: one exact-12 classifier has a source-bound v2 implementation in the
current working tree. General adoption still requires a shared receipt schema
and positive/negative semantic fixtures for every migrated producer family.

Owner: each P97 encoder, enforced by the shared P97 adapter.

### G8. Finish backend-specific artifact support

The strongest current certification path is CaDiCaL. Other paths have narrower
support:

- `march_cu` does not expose one compact proof through the current P97 adapter;
  per-cube proof manifests need retrieval, checking, aggregation, and Lean
  ingress;
- Kissat is wired into the static runner for proof-free discovery, but it is
  absent from the current host's live solver inventory and has no proof
  artifact or P97-certified UNSAT path; and
- piqd can hold cvc5/Z3 sessions, but P97 has no authenticated source-semantic
  adapter, exact-certificate route, or theorem-promotion classification for
  their results.

The raw endpoint also applies CaDiCaL's solver-profile vocabulary to all three
accepted DIMACS backends. Default profiles are usable, but backend-specific
profile contracts must be separated before production Kissat or `march_cu`
campaigns rely on identity-level profile claims.

Required work should be demand driven. CaDiCaL is sufficient for the first
migration wave. `march_cu` proof aggregation is the next useful backend feature
for large certified UNSAT campaigns. Nonlinear SMT should retain a distinct
result class even after artifact custody is added.

Acceptance condition for `march_cu`: every cube is covered exactly once, every
UNSAT cube proof is independently checked, any SAT cube has an independently
checked global model, and the aggregate receipt binds the partition and all
children.

Owner: joint piqd/P97 backend adapters.

### G9. Complete operational observability and retention policy

The live daemon already exposes version, solver, job, and session listing
endpoints, persists jobs, and recovers interrupted work. Broad adoption still
needs aggregate operational answers without inspecting SQLite or process tables
manually.

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

### G11. Campaign admission and cross-artifact provenance — checkpointed

The checkpointed controller uses descriptor-relative no-follow
snapshots for package, model, journal, classifier, and receipt inputs. It checks
the transitive binding from the predeclared cell through the exact piqd job and
CNF to the validated model and classifier, locks admission, makes the stop
threshold monotone, and leaves idempotent replay byte-for-byte unchanged.

The preserved three-record canary reaches `PIVOT_REQUIRED` with
`aggregate_coverage`, `source_entitlement`, and `theorem_closure` all false.
Adversarial tests cover mutation after snapshot, malformed hashes, symlinks,
duplicate and divergent concurrent admission, and result repair. An independent
read-only audit found no remaining medium-or-higher custody defect.

The uncommitted v2 follow-on strengthens source custody and learned-clause
support, but intentionally invalidates v1 campaign manifests, records, and
results. That migration must be checkpointed together with an explicit artifact
regeneration note; it does not reopen the already-checkpointed v1 custody
finding. The existing campaign-canary snapshots are still v1 and are rejected
by the v2 validator, so a fresh v2 canary and corrected process-audit hashes are
required before describing the v2 path as accepted.

Remaining action: keep the 120-test boundary green. Generalizing this
controller into a scheduler and a coverage authority belongs to G1–G2; it is
not a remaining G11 soundness task.

Owner: P97 integration.

## Minimum implementation that reaches "most"

The project does not need every gap below closed before making a useful
majority-adoption claim. The smallest implementation set is:

| Deliverable | Gaps consumed | Workloads unlocked | Acceptance gate |
| --- | --- | --- | --- |
| Producer-neutral immutable-CNF package/client | G1, minimum G7 | Exact-cardinality banks, exact-17 static queries, projected-static Phase 3, certificate replay | Three independent producer families use one library and each has positive and negative semantic fixtures. |
| Restartable bounded multi-job controller | G2, G4 | Existing 16/24-shard static waves | A mixed SAT/UNSAT/UNKNOWN campaign restarts without duplicate logical attempts and emits authenticated complete-or-incomplete coverage. |
| Authenticated CEGAR refinement adapter | G5, G7 | Exact-12/exact-17 source-faithful CEGAR and Phase-3 nonincremental CEGAR | Parent CNF, checked model, learned cut, child CNF, source validation, and resume checkpoint form one replayable hash chain. |
| Production concurrency canary and minimal telemetry | minimum G3, G9 | Replacement of direct local worker launchers | A 24-single-core mixed queue respects the total core budget, survives restart, does not starve short proof jobs, and exposes queue/worker/disk pressure. |

Together these cover the direct-CaDiCaL-heavy majority: exact-cardinality
banks, the static portions of exact-17, Phase-3 projected-static work, and
publication certificate replay. They do not require immediate migration of:

- local IPASIR incremental discovery, provided its terminal CNF is handed to
  the static piqd proof path;
- Z3/cvc5 metric screening, which remains explicitly noncertifying;
- `march_cu` aggregate proof custody; or
- Kissat discovery/proof support.

Those are named second-wave exceptions, not blockers to the initial "most"
claim.

## Recommended migration order

### Stage 0 — preserve the proven boundary

- Keep the existing Phase-3 piqd driver and 120-test focused matrix green.
- Preserve G11's authenticated custody boundary, while continuing to describe
  the bounded controller as stop/pivot control rather than a production
  scheduler or coverage authority.
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

### Stage 2 — production-qualify throughput

Finish G3 and G9. Run canaries before a full campaign:

- one known SAT job;
- one known certified UNSAT job;
- one forced UNKNOWN job;
- concurrent duplicate submissions;
- daemon restart during a solve; and
- a mixed short/long queue under the production core budget.

Only after these pass should the 16- or 24-shard campaigns be routed entirely
through one daemon.

### Stage 3 — connect complete CEGAR loops

Implement G5 and integrate G6. A CEGAR coordinator remains in P97, while
suitable incremental loops use piqd sessions and static loops use immutable
jobs. Every publication-relevant terminal CNF goes through the static proof
path.

### Stage 4 — add backend breadth where it pays

Implement `march_cu` proof aggregation first. Add a Kissat proof-certification
route or broader nonlinear SMT custody only when a named production lane has a
measured need and an exact consumer contract.

## Workflow migration matrix

| Workflow | Desired piqd role | Migration status | Blocking gaps |
| --- | --- | --- | --- |
| Exact-cardinality static CNF banks | Full job custody, model check, UNSAT proof replay | Exact-12 cell-0 canary passed; broad migration remains open | G1, G2, G7 |
| Exact-17 source-faithful CEGAR | Static query and terminal-artifact oracle | Current active loop is local | G1, G2, G5, G7; production-qualify G3 before a large wave |
| Phase-3 projected-static nonincremental mode | Full static oracle | Prototype driver exists | G1, G2, G5 |
| Phase-3 IPASIR incremental mode | piqd SAT session, or measured local exception; terminal handoff always uses the static proof path | Daemon capability exists; P97 session adapter is absent | G5, G6, G7 |
| `march_cu` cube-and-conquer | Scheduling plus aggregate proof custody | Incomplete certification adapter | G3, G8 |
| Metric/Euclidean Z3 and cvc5 checks | Stateful custody with explicitly non-certificate semantics | piqd session lane exists; P97 adapter is absent | G6, G7, G8 |
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
- every migrated raw formula is within the daemon's admitted size envelope, or
  has an authenticated sharding or direct-solver exception record;
- every promoted UNSAT result has independent proof checking and Lean replay;
- CEGAR parent/child/refinement history survives restart and is authenticated;
- dashboards expose queue, worker, failure, and disk state; and
- suitable incremental work uses authenticated piqd sessions and terminal
  static handoff; and
- any remaining direct incremental, backend-specific, or nonlinear solver paths
  are named, measured exceptions with an explicit promotion boundary.

Even after this definition is met, piqd results remain finite solver evidence.
A P97 theorem closes only when the finite result has the required source
producer, coverage or lift, direct Lean consumer, and transitive axiom audit.

## Related documents

- [`audits/p97-cegar-process-audit-2026-08-08.md`](audits/p97-cegar-process-audit-2026-08-08.md)
- [`audits/piqd-integration-bugs-2026-08-07.md`](audits/piqd-integration-bugs-2026-08-07.md)
- [`computational-closure-plan-2026-07-28.md`](computational-closure-plan-2026-07-28.md)
