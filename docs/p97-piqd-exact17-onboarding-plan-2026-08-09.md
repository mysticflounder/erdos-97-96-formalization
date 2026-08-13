# P97 PIQD exact-17 onboarding plan

Date: 2026-08-09

## Route supersession — 2026-08-11

This document records successful PIQD custody, solver, model-replay, and lazy
refinement onboarding. Those results remain valid finite transport evidence.
They are no longer the production closure route for the exact-17 cap-nine
leaf.

The active route is specified in
`docs/specs/p97-exact17-cap9-lean-to-sat-route-v1.md`:

```text
Lean hypotheses -> proved finite normal form -> checked SAT export
  -> PIQD/certificate -> aggregate all-placement Lean consumer.
```

PIQD onboarding begins at a Lean-owned immutable DIMACS boundary, not from a
separately authored Python CNF. The current v12t/v19/Wave63 artifacts remain
regression and theorem-discovery inputs. They do not provide source entitlement
or a proof of the live theorem, and no further lazy wave from that root is a
production step.

The checked candidate production root now exists. Lean proves that every
extracted `SourceRealization` satisfies the 209,692-clause Boolean base and all
1,980,160 source-authenticated C--G clauses. The extension covers both
source-forced named orders, both cyclic directions, every cut, and every
increasing six- or seven-point offset choice. The Lean exporter materialized
`scratch/exact17-lean-to-sat/extended-cdefg.cnf` with header
`p cnf 308 2189852`, 104,887,967 bytes, and SHA-256
`763bb4774a4d148ca35a4d33ecce06c158a8f941c3e5fb272f534cb2b9637527`.
The independent report
`scratch/exact17-lean-to-sat/extended-cdefg-validation.json` verifies the
byte-identical base prefix and independently regenerates all ten family/order
blocks.

The semantic bridge and terminal landing contract contain no `sorryAx`; they
currently include `Lean.trustCompiler` because scoped `native_decide` proves
the finite coverage regressions. A new PIQD session may be provisioned only
from the exact hash above with an immutable ingress manifest. `SAT` returns to
Lean theorem discovery before any child root is generated. `UNSAT` still needs
terminal proof custody and replay, a Lean theorem `extendedCnf_unsat`, and its
aggregate composition with the exact-cover extractor. The frozen Wave63 chain
must not be resumed as the source of truth.

That production cycle has now been exercised through nine Lean-owned child
roots: complete `EqualK4`, two-circle shared-pair, five-point three-row
Kalmanson, H--K, interleaved three-row Kalmanson, equality-chain, and
perpendicular-bisector equality-chain, and two-Kalmanson equality-chain
families, followed by the swapped-`D`/`E` unordered-center generalization.  The
first eight children were
recursively validated, provisioned with immutable manifests, and returned
`SAT`.  The seventh has 4,756,988 clauses, SHA-256
`38db47b94b1f259feeb427a48850a94c58adf300deea0b37302a39435676e76a`,
under immutable PIQD job `925a0469-313e-4cbe-bdf5-3046b9786df1`; exact replay
and the mandatory five-record theorem-bank scan succeeded.  This is
authenticated theorem-guided refinement, not a terminal certificate or
Lean-leaf closure.  Future SAT
theorem-search reports must bind the decoded-model hash and replay the exact
canonical core; the older family-level H--K minimization report is rejected.

The first new exact record from that scan is now a source-clean theorem rather
than a model-specific cut.  `TwoCircleEqualityChainSchemas.lean` banks its
increasing, decreasing, and cyclic forms; the targeted build is green and the
four declarations use only `propext`, `Classical.choice`, and `Quot.sound`.
Its full 297,024-clause orbit is therefore already part of the authenticated
sixth child.  The successor theorem is
`PerpBisectorEqualityChainSchemas.lean`: two direct equal-radius witnesses and
one equality chain force three distinct carrier points onto a single
perpendicular bisector.  Its 544,544-clause orbit has been generated in Lean
and independently validated.  The resulting 4,756,988-clause child has
SHA-256
`38db47b94b1f259feeb427a48850a94c58adf300deea0b37302a39435676e76a`
under immutable PIQD job `925a0469-313e-4cbe-bdf5-3046b9786df1`.  That job
returned `SAT` after 345
seconds; exact replay checked all 4,756,988 clauses and the mandatory scan
retained five exact records.  The first genuinely new record is banked as
`TwoKalmansonEqualityChainSchemas`; Lean generated its complete 544,544-clause
orbit and independent recursive validation passed.  The resulting eighth child
has 5,301,532 clauses and SHA-256
`ae29c7b97602f2e6ff6c746badb13ee8abad13afec3b005da0e6c632d5e1f7fd`
under immutable PIQD job `66c24b72-2b13-45d0-b00c-ef44115a1c88`; it returned
`SAT`, and exact replay plus the mandatory scan passed.  The ninth Lean-owned
root has 5,846,076 clauses, 291,567,840 bytes, and SHA-256
`759507d020a02253e85b59ce12e344451bbe66889dce221884f1b2a6aa3fac28`.
Its recursive export and rebound fail-closed ingress validation pass.  Immutable
PIQD job `090c5be4-e747-40a3-ad96-baba17d9aace` returned `SAT`; exact replay
checked all 5,846,076 clauses against the complete 308-variable model.  The
mandatory general-theorem scan produced six replayed hits and no unreplayed
proposal.  Five hits are already represented by smaller banked obstructions.
The remaining hit is an exact instance of the cardinality-generic,
source-clean two-Kalmanson cancellation consumer.  No tenth successor is
authorized until Lean generates the complete finite orbit for that instance and
a `SourceRealization` bridge connects the exact-17 source packet to it.  PIQD
maintainer build
`0cfc9577656fa3aef143a9fe7e5577d938dba9fd39f3b7118ed91735c97fc360`
raises the shared raw prepare/blob/session-seed limit from 256 MiB to 384 MiB
and is now the live daemon identity.  The exact-scale SAT capacity preflight,
rebound byte-identical ingress replay, and preconfirmation custody gates passed.
At 291,567,840 bytes the root has about
106 MiB of headroom
under the new cap.  Its 308 variables are far below the unchanged one-million
variable limit, so no `max_var` adjustment is needed.  This terminal `SAT`
result closes neither the exact-17 cap-nine leaf nor a production `sorry`; it
selects the next Lean-owned refinement theorem.

The capacity canary was deliberately SAT and therefore did **not** exercise
CaDiCaL's UNSAT-only binary-DRAT emission, proof-blob storage, proof readback,
or independent replay.  It also used solver profile `sat`, which is folded into
the immutable job identity.  That profile controls only the discovery solve;
on a future terminal `UNSAT`, PIQD performs a second full solve with `--unsat`
to mint the DRAT.  Such a verdict remains preliminary for proof promotion until
the submitted-to-certificate clause map, non-null proof custody, and independent
proof replay all pass.  A proof-pipeline failure does not change PIQD's `UNSAT`
verdict and must not trigger an unaudited retry or a new successor identity.

The disposable capacity artifact is ready at
`scratch/exact17-lean-to-sat/piqd-large-cnf-capacity-preflight.cnf`.  It has the
same 308 variables, 5,846,076 clauses, and 291,567,840 bytes as the ninth root,
but is immediately satisfiable by `x1 = true`; its SHA-256 is
`b795edd93a4a222232e2b8128f6e2596eb153b9fd182788b93e0ef7a4f97e5a5`.
Independent full-stream validation and a local CaDiCaL parse/solve passed.  It
traversed PIQD under immutable job
`0e28e34e-385d-4b66-b2f9-9ae90c12b1fb`, which returned `SAT` in 2.216 seconds;
the final report is valid, exact custody identity and the complete model passed,
and the capacity gate is closed.  The
fail-closed two-phase runner is
`scripts/run_piqd_large_cnf_capacity_preflight.py`: `start` pins daemon and
worker identities and exercises prepare/custody/session/solve/receipt/confirm;
`finalize` separately requires terminal `SAT`, rehashes custody, and checks the
complete model.  It deliberately does not poll, and records phase timings for
the PIQD maintainer's capacity audit.  It also binds PIQD solver profile `sat`,
checks receipt hashes against the canonical headerless session journal, and
checks session exports against the original full DIMACS.

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

The stateful refinement lane has now also completed two live, source-connected
append/re-solve rounds from the frozen 4,254,176-clause aggregate.  The two
admitted batches contain 120 and 86 clauses; the final 4,254,382-clause formula
remains SAT.  The full receipt is summarized in
`scratch/p97-exact17-piqd-fresh-aggregate-solve-v1/RESULTS.md`.  This validates
the finite CEGAR transport, not exact-17 coverage or a production-leaf closure.

One proof-publication gap remains outside that SAT transport.  PIQD's current
certificate preparation detautologizes the submitted CNF and can therefore
renumber input clauses.  A terminal LRAT handoff must consume an explicit
session-clause-to-certificate-clause map, including dropped entries; it must
not infer certificate IDs from session positions.  The exact-17 append gate
already rejects tautological and repeated-literal learned cuts, so this does not
invalidate the completed SAT refinements.

## Historical onboarding objective

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

The first stateful exact-17 refinement replay is also complete. PIQD session
`0e9760fd-aff7-46c9-9630-79f2b5fd1f67` was seeded from the exact frozen root,
then accepted all eight ordered Rank-Four DirectSix fragments. Its initial
export matched the 4,118,501-clause root byte-for-byte, and its final export
matched the 4,254,176-clause aggregate byte-for-byte at SHA-256
`2aa85c2368c3f271caebe47c4a6b861cc7e64d177cd349e58697a724c4b43605`.
The session was closed after zero solves. The observational receipt is
`scratch/p97-exact17-direct6-piqd-refinement-replay-v1/replay.json`; the full
contract and qualification record are in
`docs/specs/p97-piqd-exact17-refinement-session-v1.md`.

This closes the first large stateful custody/replay gate.

The first production-shaped CEGAR transition is now also qualified.  A fresh
session, `b6715bff-6e85-48ea-988d-b7e081e69298`, exported the authenticated
4,254,176-clause aggregate byte-for-byte and produced a complete SAT model.
The source-faithful analyzer replayed all root clauses and source predicates,
then found the already banked two-Kalmanson cancellation consumer.  The new
clause-admission gate checked the proposed clauses against the complete root,
the captured model, and every earlier receipt before allowing PIQD to append
them.

Two same-session refinement rounds admitted 120 and 86 clauses.  Their ordered
digests are respectively
`47bdfd2a8db63a35e06d377c59dce0b58ff005721a3be989af6b9fc2fab1189d`
and
`f1c8baa53e0fffd4a23017ff1f3d00e4c08312f8d96e6da6ae602ab7aeb03bc4`.
The final 4,254,382-clause export has SHA-256
`cf1787a45bb8d0e7b434cf2f733581b08b8a83baebbba22d7efae3aad8cf74bd`
and was byte-compared with the root plus the two receipt batches.  The second
refinement first exhausted a 50,000-conflict canary, then returned SAT without
that diagnostic limit in 5,629 ms.  Its total model was independently replayed
against all 4,254,382 clauses and the source semantics.

The exact gate is specified in
`docs/specs/p97-piqd-clause-admission-v1.md`, and the finite run ledger is
`scratch/p97-exact17-piqd-fresh-aggregate-solve-v1/RESULTS.md`.  This is a
working, source-connected PIQD CEGAR loop, not exact-17 coverage, universal
lift, a proof-producing UNSAT handoff, or closure of a Lean `sorry`.  The
latest model still contains a bank hit, so the next production action is
another checked refinement rather than a closure claim.

A third authenticated session has continued that refinement loop.  Session
`667fd23e-3588-4e02-b555-44f806c8c6ac` reconstructed the exact
4,254,382-clause endpoint above, then admitted two more source-backed
two-Kalmanson batches containing 118 and 858 clauses.  The clause-admission
gate checked all 976 clauses as model-violated, novel, and covered by
`false_of_twoKalmansonLabelCancellationData`.  The resulting 4,255,358-clause
export has SHA-256
`8bf247e1cf12283aca6e4e5f520cd90eccecd146ba295781da743308322e04ab`.

PIQD returned SAT after each refinement, and all three total models passed
source-semantic replay.  The last model still contains another theorem-bank
hit, so this is further branch contraction and theorem-bank reuse, not
exact-17 closure.  The session was frozen and closed to permit deployment of
PIQD's proof-certificate clause-map endpoint.  The detailed finite ledger is
`scratch/p97-exact17-piqd-refinement-round3-v1/RESULTS.md`.

The mandatory post-wave general-theorem search is now complete for all three
models. Direct scans of the previously named short motifs were negative, but
forced exact linear replay found three previously unseen dihedral support
signatures. Each is a positive weighted Kalmanson cancellation accepted by
the existing cardinality-generic kernel-clean consumer
`false_of_weightedKalmansonCancellationData_of_check`; two use unit weights,
while the ten-point instance uses one coefficient of two. None occurs among
24,256 historical tracked supports. The replayable evidence is
`scratch/p97-exact17-piqd-refinement-round3-v1/postwave-theorem-search.json`.
This is reusable theorem-bank expansion and supplies the next static cuts; it
does not establish exact-17 coverage or close a production `sorry`.

Those static cuts are now live in PIQD.  The three certificates compiled to
102 checked dihedral clauses and seeded session
`4876f14c-554d-4cce-9f1a-fb9a15f5dc53` at 4,255,460 clauses.  Seven subsequent
source-faithful SAT models all hit the existing generic two-Kalmanson equality
closure theorem.  PIQD admitted seven authenticated orbit batches totaling
3,029 further clauses, leaving the live session SAT at 4,258,489 clauses.
This confirms that the theorem-search output is feeding the stateful CEGAR
loop correctly.  It is not yet a terminal exact-17 result or a universal
lifting theorem.

The next wave stopped after eight further authenticated SAT models, before
launching any successor solve.  Its mandatory general-theorem search found
eight new cardinality-independent unit-weight Kalmanson cancellation
instances.  They are distinct from one another and from the 24,256 historical
tracked supports, but they use the existing kernel-clean generic Lean
consumer rather than introducing a new theorem family.  The deterministic
search result is
`scratch/p97-exact17-piqd-refinement-round3-v1/postwave-theorem-search-wave2/postwave-theorem-search.json`.

The eight exact-17 dihedral orbits contain 272 candidate clauses.  A complete
novelty scan against the 4,255,460-clause normalized root and the 3,289 clauses
in the eight-receipt refinement chain found 46 already subsumed images and 226
novel clauses.  Those 226 clauses were admitted to PIQD, moving live session
`4876f14c-554d-4cce-9f1a-fb9a15f5dc53` from 4,258,749 to 4,258,975 clauses.
The resulting normalized formula has SHA-256
`e41f2fdfa3b05b3f7dc3a66260344ecd277758fbefb46180f4bf05f1649a7759`.
The compiler manifest and PIQD admission receipt are respectively
`postwave-wave2-weighted-orbits.manifest.json` and
`postwave-wave2-piqd-admission.json` in the same scratch directory.

This establishes the production cadence for this lane: every bounded CEGAR
wave must stop at its sealed boundary, run the general-theorem search and
historical deduplication, bank every accepted generic instance through a named
Lean consumer, and only then begin a successor wave.  A bank hit or a static
clause admission is branch contraction; it is not exact-cardinality coverage,
a universal lift, or a production `sorry` closure.

The following eight-model wave has now passed the same gate.  All eight models
were source-verified, had a static theorem-bank hit, and independently replayed
as exact-linear `UNSAT`.  The global search found eight unit-weight Kalmanson
cancellation instances: seven support signatures were absent from the 24,256
historical records and one occurred once.  Every instance is accepted by the
existing cardinality-generic Lean consumer
`false_of_weightedKalmansonCancellationData_of_check`; no new theorem family
was required.

Their 272 exact-17 dihedral images were checked against the complete formula
chain.  Forty-three were already subsumed and 229 were novel.  The novel
clauses were admitted under `wave3-piqd-admission.json`, moving live session
`4876f14c-554d-4cce-9f1a-fb9a15f5dc53` to 4,267,673 clauses.  The normalized
formula `postwave-wave3-base.cnf` has SHA-256
`2014454229278675eed61af89c3a4c6cad1b02829c8070f2ab66b549cbf8c1a8`.
Exact-17 remains SAT/open: this is another completed theorem-search and banking
checkpoint, not finite coverage, a universal lift, or a production `sorry`
closure.

Wave 4 has now completed the same mandatory boundary.  Eight additional SAT
models passed source replay and exact linear replay, adding 8,031 authenticated
model-specific clauses.  Before any wave 5 solve, the global theorem search
scanned 24,256 prior canonical supports across both historical exact-17 banks.
All eight new supports were novel.  Six are unit cancellations and two require
positive non-unit weights, but every instance is already covered by the
cardinality-generic Lean consumer
`false_of_weightedKalmansonCancellationData_of_check`.  This is new reusable
theorem-bank data, not a new theorem family.

The eight orbit expansions contained 272 checked candidates.  Forty-two were
subsumed by the complete formula chain and 230 were novel.  PIQD admitted those
230 clauses, leaving live session
`4876f14c-554d-4cce-9f1a-fb9a15f5dc53` at 4,275,934 clauses.  The normalized
root `postwave-wave4-base.cnf` has SHA-256
`9fe6583cebeee38fc4874781a08ca9c8cc35b86590ba4889302511171bdab417`.
Exact-17 and the production `sorry` remain open.

Wave 5 repeated the gate before any further solve.  Eight source-verified SAT
models all replayed as exact-linear contradictions and supplied 4,079
model-specific clauses.  The mandatory search over the same 24,256 historical
supports found eight new cardinality-independent weighted-Kalmanson instances.
Seven use unit weights; one thirteen-point instance uses a larger positive
combination over 35 strict inequalities.  The existing generic Lean consumer
accepts all eight, so this is theorem-bank instance growth rather than a new
theorem family.

The 272 orbit candidates reduced to 225 novel clauses after 47 complete-chain
subsumptions.  PIQD admitted those clauses and now agrees with normalized root
`postwave-wave5-base.cnf`: 74,813 variables, 4,280,238 clauses, SHA-256
`3de22b62ce5cff1b406718d86ae2c059f81b9c21d601379774add89cf33978b6`.
The manifest remains explicit that exact-17 coverage, exact-17 closure, and
production `sorry` closure are false.

Wave 6 has also completed the mandatory boundary.  Eight further SAT models
passed source replay and exact-linear contradiction checking.  Their
model-specific orbit batches added 5,860 clauses.  The theorem search compared
their minimized supports with 24,256 historical records and found all eight
novel: seven unit cancellations and one twelve-point weighted cancellation.
Every instance is accepted by the existing cardinality-generic Lean consumer;
this remains theorem-instance growth, not a new theorem family.

The 272 orbit candidates reduced to 235 novel clauses after 37 complete-chain
subsumptions.  PIQD admitted those clauses and agrees with normalized root
`postwave-wave6-base.cnf`: 74,813 variables, 4,286,333 clauses, SHA-256
`8d63c8058da1959bce5cb5e86b5459314386c23f6168eed53cd227ea58627ed5`.
The next solver wave remains gated on analysis of the accumulated wave data for
a stronger recurring theorem or motif.  Exact-17 and the production `sorry`
remain open.

The accumulated-data canary and its next two successors have now completed
that stronger gate.  A deterministic audit of 43 source-verified historical
models found 1,025 exact two-Kalmanson witnesses and 528 cyclic motifs.  No
single motif covered every historical model, so the resulting thirteen-motif
family is diagnostic rather than a finite coverage theorem.  Each motif is,
however, an instance of the existing cardinality-generic Lean theorem
`false_of_twoKalmansonCancellationData_of_check`.

Starting from the 4,286,333-clause wave-6 root, the first fresh PIQD model hit
motifs 0 and 8.  Their two complete dihedral orbits contributed 297,024 novel
clauses.  The next authenticated model hit motif 3, and the following model
hit motif 1; each contributed another 148,512 novel clauses.  Every model was
total, independently checked against its complete DIMACS root, replayed
through the source semantics, and rejected by exact linear arithmetic.  A
fresh Lean axiom audit of the shared consumer reported only `propext`,
`Classical.choice`, and `Quot.sound`, with neither `sorryAx` nor compiler
trust.

The next frozen root is
`scratch/p97-exact17-piqd-wave6-canary-v1/postgate-wave8-motif1.cnf`:
74,813 variables, 4,880,381 clauses, SHA-256
`8547bd6b3675e7db0dc7088bdba19ba28ec9851f7f0616c518d87b1870616250`.
The detailed receipts and theorem-gate reports are in the same scratch
directory.  This confirms the mandatory cadence: authenticate, search the
accumulated data for a general theorem, verify or bank its Lean consumer, and
only then refine.  Exact-17, universal coverage, and the production `sorry`
remain open.

### Lazy-lane status after Wave53

The active exact-17 session is
`66835651-f5f2-4034-8de7-f047524fa305`.  Its Wave53 solve returned a total SAT
model at solve index 48 for the 5,895,215-clause root with SHA-256
`ad26e1202787b0b5ce9bc0923b1b7406edecbc15c70584a299b156da9ad43aa9`.
The preappended controller took 155.5 seconds end-to-end after encountering a
detached session, while PIQD reported only 130 ms inside CaDiCaL.  The
difference is root rehydration and custody overhead, so the 5.9-million-clause
formula is already expensive even when the incremental solve is cheap.  The
complete static accumulated family missed the model, while the source-backed
theorem bank and exact linear replay both rejected it.

The mandatory general-theorem search found several direct fixed-order
consumers in the existing Lean bank.  The smallest is the five-point theorem
`Problem97.FivePointEuclideanObstruction.false_of_five_ccw_two_selected_rows`.
Its source remains axiom-clean apart from `propext`, `Classical.choice`, and
`Quot.sound`.  The resulting successor adds only the witnessed five-literal
clause `[-123, -125, -252, -248, -246]`; it deliberately does not add the
148,512-clause generic orbit.

The successor root has 5,895,216 clauses and SHA-256
`140c27618f8d12528cefd52a943caa3d254406163f461731f713a775f9a351b5`.
At this checkpoint it is authenticated but has not yet been appended to the
live PIQD session.  The next operation is therefore exactly one receipt-gated
`add` followed by export/hash comparison; only then may Wave54 run.  No second
daemon should be launched against the current data directory before the
running daemon is deliberately restarted onto the fixed startup-order binary.

### Lazy-lane status after Wave62

Waves 54--62 continued the receipt-gated one-model cadence without expanding
whole dihedral orbits.  The current live PIQD session remains
`66835651-f5f2-4034-8de7-f047524fa305`; Wave62 advanced it from solve 56 to
solve 57 on the authenticated 74,813-variable, 5,895,224-clause root with
SHA-256 `cb1fa32e6b9892aea7f200df4a710884b1d463a0db0f9defa9a1b92e658e31c4`.
PIQD returned a total SAT model in 1,107 ms.  Independent root replay and the
source-semantic gate passed, the accumulated motif family missed, and exact
linear replay found an existing generic two-Kalmanson bank hit.  This is still
an open exact-17 branch, not closure.

The mandatory post-wave search checked the current model, the complete
canonical theorem-bank registry, and the indexed Lean corpus.  It found no new
theorem family.  A direct theorem-shape scan found two instances of the
existing cardinality-generic consumer
`Problem97.FivePointEuclideanObstruction.false_of_five_ccw_two_selected_rows`
and no instance of the second-five-point, circle-isosceles, or sparse-six-point
consumers.  Only the first witnessed occurrence, on cyclic points
`[11, 7, 16, 4, 1]`, is authorized.  It compiles to the single five-literal
clause `[-123, -114, -268, -264, -261]`; no symmetry orbit is added.

The authenticated successor root is
`scratch/p97-exact17-piqd-wave6-canary-v1/postgate-wave62-five-point-direct-witness.cnf`:
5,895,225 clauses, SHA-256
`bb2303a1eb9d9a5c52b01e70b01875b7816c034464017215a760560451c7fcb8`.
The complete lineage gate is
`wave62-postwave-theorem-search.receipt.json` in the same directory.  At this
checkpoint that successor is authorized offline but has not been appended to
the live session.  Wave63 may perform exactly that authenticated append and
one successor solve, after which the mandatory theorem search repeats.  The
5.9-million-clause total is inherited infrastructure; Wave62 learned one
clause, not millions.  Neither exact-17, full P97, nor a production `sorry` is
closed by this checkpoint.

### Lazy-lane status after Wave63

Wave63 appended the authenticated Wave62 successor to PIQD session
`66835651-f5f2-4034-8de7-f047524fa305` and advanced solve 57 to solve 58.  Its
input root had 74,813 variables and 5,895,225 clauses, with SHA-256
`bb2303a1eb9d9a5c52b01e70b01875b7816c034464017215a760560451c7fcb8`.
PIQD returned SAT in 15,705 ms.  Independent model replay passed; the static
theorem bank found two hits, the accumulated-family gate found one hit, and
exact linear replay rejected the model.  This remains discovery evidence, not
an exact-17 or universal closure.

The mandatory general-theorem search found five occurrences of the existing
direct five-point consumer and no occurrence of the second-five-point,
circle-isosceles, or sparse-six-point consumers.  It found no new theorem
family.  Only one witnessed direct-five occurrence, on cyclic points
`[9, 7, 16, 4, 5]`, was admitted.  It contributes the single clause
`[-121, -118, -266, -264, -261]`; no symmetry orbit was added.

The authenticated successor root is
`scratch/p97-exact17-piqd-wave6-canary-v1/postgate-wave63-five-point-direct-witness.cnf`:
5,895,226 clauses, SHA-256
`759daee28221a72ff3faf295f881c57665d7c53f6df44d9382dade2467c3130f`.
The complete lineage gate is
`wave63-postwave-theorem-search.receipt.json` in the same directory.  Receipt
validation and receipt writing now use a non-blocking per-receipt lockfile, so
duplicate full-lineage replays fail immediately instead of consuming a second
validator process.  No Wave64 solve has been launched; the lane is paused.
Neither exact-17, full P97, nor a production `sorry` is closed by this
checkpoint.

## Child-32 exact-root qualification — 2026-08-12

The current production route is no longer the legacy Wave64 root described
above. The exact child-32 root is Lean-owned through a 336-clause refinement
suffix over the authenticated child-31 prefix. It has 308 variables, 5,847,240
clauses, CNF SHA-256
`c325d3eedda8fe81e3d1c1d70645024f5b9ea8c36c20ca5cd1896f0934296a7d`,
and ingress-manifest SHA-256
`f5da5c5bb0c5cbb7f1f95dd3230aef848ae62623330e9fecb5c62d9b66cba82e`.

The onboarding gate now covers strict publication and recursive ingress,
immutable export custody, live daemon/solver identity, exact CNF retrieval,
SAT-model replay, and synthetic compact-LRAT retrieval plus independent Lean
checker replay. Seventy-one adversarial tests and the targeted Lean exporter
build pass. Production child 32 is now prepared as job
`2506986e-0445-465f-9b05-eff6bb9a5983` but remains unconfirmed. The runner has
been corrected to treat job status—not prepare response—as authoritative for
manifest hashes, and an explicit known-job recovery path revalidates intent,
status, and both stored inputs before direct job-ID confirmation. General
recovery remains fail-closed when neither a job ID nor an identity lookup is
available.
