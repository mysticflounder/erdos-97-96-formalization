# P97 PIQD exact-17 onboarding plan

Date: 2026-08-09

## Current status

Gate 1 passed on the live v12t archive.  The package canary is preserved at
`scratch/p97-piqd-exact17-package-canary-2026-08-09-v1`.  It reproduces the
selected CNF hash and also snapshots the validation structural roundtrip CNF
at 4,160,204 bytes, 285 variables, 145,975 clauses, and SHA-256
`884029ff0a06830273a71c650e70e1fa6530a088fabd04d8d83884c56bcdaf98`.
The canonical producer- and wave-manifest hashes are respectively
`bf9f1914c1663719e23ecf02f1d295f93e4400db16a98c09dffcd68541c31963`
and `621c44d9cda0465b0f3eb2e2304469348e336996fddbf9e1995506737fe23514`.

The independent Gate-1 review found no remaining reproducible package-ingress
issue.  Gate 2 then closed receipt/job-identity rebinding, strict live-response
parsing, exact model-completeness, and terminal solver-log custody gaps.  The
fresh live known-SAT and known-UNSAT preflights pass through the same driver and
receipt path.  Raw DIMACS preflight and model replay use streaming scans rather
than materializing all clauses.

The daemon maintainer added an optional positive `requested_core_limit` to
`/jobs/prepare-cnf`, folded it into bounded raw-DIMACS job identities, and
added terminal `attested_solver_processes` and `attestation_basis` fields.  The
live daemon now serves installed build
`835c456052c080ccefca409d9ad4961d10b7416f695a9f4bf5f677eae811fc90`.
Exact17 will request one and require the terminal basis
`SINGLE_PROCESS_NO_PARALLEL_FLAG`.  This attests one solver process and no
parallelism option; it is not an OS-thread, cpuset, or physical-core guarantee.

Gate 3 completed one actual v12t solver job, preserved at
`scratch/p97-piqd-exact17-run-2026-08-09-v2`.  PIQD job
`ae19fa84-9b7b-40bd-b2bd-2741e3f93b51` returned `SAT`; the adapter independently
replayed the total 74,813-variable assignment against all 2,504,349 clauses and
classified it only as `STRUCTURAL_SAT`.  The final receipt SHA-256 is
`167aa32cc6ac653ab3e9b66fa5cb6b3f459ca1021979bc7bc362e626a792bb3d`.
It binds model SHA-256
`a61d411ebd409144224ec9bad615a58c6542096e66fcbd75ce85193e72116117`
and complete solver-log SHA-256
`bf37085e57d613178bb2c03dc700f0af4c0dfecc2430e338f799b01242ca52ea`.
The final adapter replay reused this exact content identity; `existing = true`
there records deduplication and did not launch a second solver job.

PIQD-MODEL-001 is fixed, deployed, and live-verified in upstream commit
`be8ef96`.  `/model` and `/lean-model` now return HTTP 409 when the assignment
recovered from the daemon's last-1-MiB log window is incomplete relative to the
stored CNF header.  The serving daemon and the P97 adapter independently accept
this exact17 model as complete at 74,813/74,813.  Wider lanes retain the P97
exact-cardinality guard as defense in depth and can recover a complete model
through the paginated `/log` route.

The source-semantic checkpoint now uses a fresh current-source successor at
`scratch/rigid221-blockerv-exact17-20260806/source-faithful-cap9-direct-cnf-v19-piqd-source-entitled-20260809`.
Its exact manifest and CNF SHA-256 values are respectively
`19fe9d3ee8e24e9bdcefc2a0dfb62c81e484d784d3ff37fe5b291d8d7081d63a`
and `ebca3272a22c945a235a3f1141c1646f1a9780f39eefec6164f57e48bbe84c7c`;
the CNF has 74,813 variables and 2,875,629 clauses.  The canonical
runner-recorded provenance sidecar has SHA-256
`0d6aa93747da652a0fbb4517c1193fb643ef6e01bcaa978589fc133aded45378`.
It records the observed command and runtime but is not an execution
attestation.

The semantic adapter is deliberately artifact-specific.  It pins the exact
v19 manifest, CNF, dimensions, scope, and complete clause, learned-record, and
cut-admission inventories.  It captures nine current producer sources and 45
manifest inputs, reconstructs the complete variable map, checks every CNF
clause against the total archived assignment, and independently replays all ten
pinned finite source predicates.  The source-bundle SHA-256 is
`4c7b7446894d812c5d160c7274546cfe51978bfa9b2d64c5da1776ed4f2cb5dd`,
and the semantic receipt self-hash is
`ca03ec14e8d6a4299ac4d42c97b50f69c835b1e8df2efa55729732044ecddd1f`.
This is finite source-semantic evidence only: aggregate coverage, universal
lift, theorem closure, and Lean checking remain false.

## Objective

Onboard one existing exact-17 cap-nine static DIMACS artifact into PIQD as a
single-solver-process diagnostic job with `requested_core_limit=1`.  The first
run is an infrastructure and custody canary.  It does not close the finite
exact-17 target, the parent Rigid221 leaf, or Problem 97, and it does not claim
OS-level core enforcement.

The first candidate is the corrected v12t artifact:

- CNF: `scratch/rigid221-blockerv-exact17-20260806/source-faithful-cap9-direct-cnf-v12t-exact-all-cores-44/o0-p0-1.cnf`;
- CNF SHA-256: `62de9fb9e20d13ff256f59aa20d5044f55bc17f9adbce8204564d486adfc75fb`;
- byte count: `95,933,857`;
- dimensions: `74,813` variables and `2,504,349` clauses;
- upstream manifest SHA-256:
  `940bd8aa727f144973840c5fa69ea968a5942a8be4ef695acb25eb7224c86572`;
- validation report SHA-256:
  `ee7bbde2ce02fce6c3e2ced5e3ea26075b747e528e9b439b2fd26e057b3907bd`;
- validation status: `PASS`; and
- historical result: 24 independently checked CaDiCaL `SAT` models.

The nearby `v12` directory is a diagnostic export that omitted the required
transitive-two-circle family.  The corrected `v14b` all-history successor is
also independently validated and is a legitimate later candidate, but it is
larger (2,653,460 clauses) and has only four fresh archived SAT-model checks.
It is deferred until the adapter is established on v12t's smaller candidate
and broader 24-model cross-check corpus.  The `v15` export has a `PASS`
validation report, but is still inadmissible for this gate: it is the
non-transitive candidate-v2 shape with only 285 variables.  The onboarding
adapter must reject the incomplete v12 and non-transitive v15 shapes; it must
not misclassify the deferred v14b successor as malformed.

## Trust boundary

The upstream v12t manifest authenticates the CNF, finite order, dimensions,
clause-family counts, source hashes, and one bank artifact.  Its independent
validation report binds the candidate CNF and manifest and records exact
regeneration, source-model, structural-clause, theorem-bank, and CaDiCaL-model
checks.  The package independently snapshots the structural roundtrip CNF.
The report does not cross-validate every manifest leaf, so the package emits a
complete coverage inventory and sets
`complete_manifest_report_cross_binding = false`; the remaining leaves are
authenticated only by the exact pinned manifest bytes.

It does not archive the historical producer command, repository commit, full
variable map, or the exact source bytes named only by the recorded source
hashes.  Several current scratch producers have since changed.  Therefore the
first PIQD package must state all of the following explicitly:

- exact CNF, upstream-manifest, and validation-report byte identity: true;
- current executable producer-byte provenance: false;
- full variable-map custody: false;
- source entitlement: false;
- aggregate order/case coverage: false;
- universal lift: false;
- theorem closure: false; and
- daemon attestation: false unless a separately authenticated daemon contract
  is later added.

A PIQD `SAT` result proves only that a returned total assignment satisfies the
exact archived DIMACS.  It becomes source-semantic evidence only after a
lane-owned decoder and validator replay the assignment against an authenticated
source contract.  A PIQD `UNSAT` result remains `DISCOVERY_UNSAT` until the
proof artifact is independently checked and replayed through the existing Lean
certificate ingress.

The proof-blueprint anchor remains
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier`.  This work
is off-spine infrastructure and must not move the anchor.

## Work plan and acceptance gates

### 1. Freeze the ingress packet

Status: complete and independently reviewed.

Implement a strict exact17 package adapter in new P97 integration files.  It
must read the CNF, upstream manifest, and validation report through no-follow
regular-file snapshots; reject duplicate-key or non-finite JSON; recompute all
raw hashes and DIMACS dimensions; and bind the normalized order and scope.

The adapter will emit canonical:

- an exact17 producer manifest;
- an explicitly partial/opaque variable-map record;
- a `p97-cegar-wave/v1` one-job manifest; and
- a package result whose claims are the trust-boundary values above.

Acceptance gate: deterministic byte-for-byte output and adversarial rejection
of hash, dimension, order, status, schema, source-hash, path, symlink, and
time-of-check/time-of-use tampering.  It must reject the incomplete v12 and v15
artifacts.

### 2. Validate the PIQD boundary on tiny known results

Status: complete.  Known-result preflights and the shared one-process boundary
are covered by the existing exact17 runner and focused tests.

Reuse the producer-neutral `PiqdRawDimacsClient` and durable one-job driver.
Before uploading the 95.9 MB candidate, run one tiny known-SAT and one tiny
known-UNSAT fixture through the same package and receipt path.  Confirm exact
stored CNF bytes, status interpretation, total-model DIMACS replay, solver log
custody, and bounded-process attestation.  The UNSAT fixture is intentionally
classified as `DISCOVERY_UNSAT`: this gate does not retrieve, validate, or
promote a proof artifact.

Acceptance gate: both known-result fixtures pass without modifying the daemon.
Any daemon defect is posted immediately to the shared nthdegree conversation
and added to `docs/audits/piqd-integration-bugs-2026-08-07.md`.  P97 adapter
defects are posted to the conversation but are not mislabeled as daemon bugs.

### 3. Run one bounded exact17 canary

Status: complete for the pinned source-entitled v19 successor.

Submit exactly one v19 job to the live daemon using CaDiCaL's SAT-oriented
profile.  Request a core limit of one; require terminal attestation of one
solver process with no parallelism flag; use one seed, no portfolio, and no
concurrent wave.  Do not restate that process-topology evidence as OS-core or
thread enforcement.  Archive the PIQD job identity, confirmed CNF hash,
immutable producer manifest, terminal status, complete solver log, and either
the total model or a discovery-only UNSAT result.  A separate authenticated
proof-replay gate would be required before any UNSAT result could be promoted.

The raw-DIMACS client now streams clause validation during preflight and model
replay.  Its built-in HTTP transport sends an exact-length segmented multipart
body, so it does not construct a second assembled 95.9 MB request body; custom
test transports retain the legacy byte-body interface.  This is a memory-copy
mitigation, not a file-backed upload path or an OS-level RSS guarantee.

Acceptance gate: the prepared job identity and every downloaded artifact are
content-addressed and revalidated from the archived bytes.  A timeout or
`UNKNOWN` is a valid diagnostic result and is not retried automatically.

Live result: PIQD job `b32f0b26-5044-4f46-9d8e-239d15583a8a` completed `SAT`
in 4,914 ms for CNF
`ebca3272a22c945a235a3f1141c1646f1a9780f39eefec6164f57e48bbe84c7c`.
The request and terminal record both attest one solver process with
`SINGLE_PROCESS_NO_PARALLEL_FLAG`; they do not attest an OS CPU set or thread
limit.  A corrected `existing=true` retry archived and revalidated the same
job without a second solve.

### 4. Guard against vacuous SAT and stale semantics

Status: complete for the pinned v19 finite packet.

For `SAT`, require a complete assignment for all 74,813 variables and replay it
against every DIMACS clause.  Then run the lane-owned source-model analyzer only
from authenticated snapshots.  Refuse semantic promotion if the decoder,
validator, source hashes, order, or model hash do not match the package.

Also reject a vacuous or weakened candidate before submission: zero clauses,
dimension drift, missing required clause blocks, `transitive_two_circle !=
true`, a non-`PASS` validation report, or any candidate that is not the exact
manifest-bound CNF.

Acceptance gate: positive SAT fixture, deliberately weakened/vacuous fixture,
partial-model fixture, and stale-validator fixture all produce the expected
fail-closed classifications.

The live total assignment has 74,813 literals.  The durable v19 output replays
it against all 2,875,629 clauses and the authenticated source predicates.  The
raw daemon model remains archived under SHA-256
`310ad7e8367661fb354307570a3140f234936f03a03894fda18d093e40ef1226`;
the separately published canonical model hashes to
`be142b2a84f9b311365d066b410fcb5d74b913e143d6d5de2cfaf46656307f4a`.

### 5. Handle an unexpected UNSAT result

Status: not triggered; the live v19 result was `SAT`.

Fetch the exact CaDiCaL proof and solver log.  Independently run proof checking
against the archived CNF, normalize the checked proof for the existing replay
pipeline, and bind all hashes in a replay receipt.  Do not claim
`CERTIFIED_UNSAT` unless the independent replay succeeds.

Acceptance gate: proof mutation, CNF substitution, missing proof, checker
failure, or replay drift all prevent certification.  Lean ingress, finite-case
coverage, and any source-to-production consumer remain separate later gates.

### 6. Audit and checkpoint

Status: complete.  The live artifacts passed fresh local validation and an
independent read-only audit.  The audit revalidated the full 2,875,629-clause
model replay and all ten authenticated source predicates without rerunning the
solver.

Run the focused exact17 package tests plus the existing PIQD oracle, driver,
and replay suites with one test worker.  Run Ruff check/format and a diff check.
Post the exact hashes, classifications, resource use, and any defects to the
nthdegree conversation.  Commit only the owned onboarding files at the next
checkpoint; do not sweep up the shared dirty worktree.

## Immediate implementation slice

The package loader, corrected live-run receipt adapter, known-result live
preflights, one-process v12t structural canary, and fresh-v19 source-semantic
custody gate are complete.  The final one-worker oracle, driver, structural
package/runner, semantic, and v19 package/runner suite passes 337 tests; Ruff
check and format-check are clean.  Independent adversarial and live-artifact
reviews found no remaining issue after the adapter was narrowed to the exact
v19 artifact and noncanonical Base64, metadata-substitution, parent-path
replacement, and raw-versus-canonical model cases were made fail-closed.  No
Lean declaration or proof-blueprint anchor moved.

The durable pinned-v19 PIQD run is complete.  Its package is
`scratch/p97-piqd-exact17-v19-package-2026-08-09-v1`; its validated output is
`scratch/p97-piqd-exact17-v19-run-2026-08-09-v1`.  The exact job, raw and
canonical model bytes, solver log, package, journal seal, semantic evidence,
and semantic receipt all rebind.  The run result records finite source custody,
finite semantic replay, and structural SAT only.  Aggregate coverage,
universal lift, theorem closure, and Lean checking remain false and are later
gates.
