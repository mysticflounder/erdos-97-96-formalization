# P97 PIQD exact-12 source54 cell-8 runner v1

Status: implemented finite-computation boundary; off the Lean proof spine.

Receipt schema: `p97-piqd-exact12-source54-cell8-run/v1`.

The runner submits only the frozen exact-12 source54, normalized cell-8
package to PIQD.  It does not promote a solver result to a source theorem.  The
proof-blueprint session remains `019fdf9c`, anchored at
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier`; that anchor
is unchanged, open, and this runner is off-spine maintenance.  The boundary
implements the decisions recorded in nthdegree convo audits `#4221`, `#4222`,
and the adapter-hardening audit `#4234`.

## Inputs and fixed identity

`load_package()` is the only package ingress.  Its no-follow, bounded,
cross-file-stable loader validates the package index, canonical JSON, complete
variable map, producer manifest, package wave, source-order bank, and every
artifact hash before the runner constructs a packet.  The runner then performs
its own deep checks against the captured bytes: exact index and artifact
records, exact variable IDs and roles, exact bank and registry-prefix digests,
all 54 entry/cube/clause/source bindings, producer provenance, order data, and
presence of every learned clause in the fixed CNF.  It does not trust a shallow
loaded mapping, a bank length, or a self-digest alone.

The accepted DIMACS identity is fixed:

- bytes: `17,227,349`;
- SHA-256: `47c6275c143c4e99d10d0c73488629e5b9c3046599a7d31d750192ae17c770d4`;
- variables: `44,855`, with total map IDs exactly `1..44855`;
- clauses: `732,131`;
- normalized cell: `8` of `648`;
- archived source-order cuts: `54`.

Zero-variable or zero-clause inputs, malformed DIMACS, dimension/hash drift,
nonzero clause-anomaly counters, map drift, positive producer claims, or a
source-cut count other than 54 fail before a daemon request.

The clause-anomaly record is checked field-by-field: `clauses_scanned` must be
the exact pinned clause count `732131`, while `tautological_clauses`,
`repeated_literal_clauses`, and `empty_clauses` must each be the built-in
integer zero.  Boolean and floating-point lookalikes are rejected.  Package
inventory validation likewise requires the seven indexed artifacts plus the
self-describing `package-index.json`; neither a missing index nor a re-signed
extra or reordered artifact is accepted.

The package wave is immutable discovery custody.  It intentionally records
`piqd-raw-dimacs` and a runner-supplied solver policy.  The runner derives a
separate execution wave that changes only the backend/profile to
`cadical`/`sat`; cell, shard count, order digest, and seed remain bound.  The
receipt authenticates both the package-wave file SHA-256 and the derived
execution-wave canonical SHA-256.

Producer identity has two deliberately different digests:

- `producer_manifest_file_sha256` hashes the complete archived file;
- `producer_manifest_canonical_body_sha256` hashes canonical JSON after
  omitting the producer's entire `identity` field (or the legacy internal
  self-digest field when present).

The runner validates the producer's internal body assertion and records both
digests.  It never substitutes one for the other.

The source-order bank has another deliberately separate identity.  Its
canonical body SHA-256 is pinned to
`4fe83285d1336a8aaa21906cfa460893ab2eb8fa8b3f2318c98fd0f7cfc0dbd9`.
Package ingestion live-calls the strict 54-entry bank validator and requires
this digest to equal the producer's
`compiler_replay.source_order_bank_sha256`.  Every terminal receipt, including
`UNSAT` and daemon `failed`, records `source_order_bank_identity` with the
canonical body digest, the independently pinned package-file SHA-256
`fa138c495c1f425e18a57cfb5e916eabdbe87dffb1e4e21d7488ce8eda399d4b`,
and the producer replay digest.  The first and third values must agree exactly;
the package-file hash remains a distinct hash of the complete archived JSON
file.

## PIQD lifecycle and serial attestation

The runner composes the generic `PiqdRawDimacsClient`,
`DurableAttemptJournal`, and `PiqdCegarDriver`.  Its driver policy fixes:

- one prepare attempt;
- one confirm attempt;
- one result retrieval attempt;
- `requested_core_limit=1`.

The wrapper checks the prepare echo against the exact job ID, backend, profile,
CNF blob hash, raw identity hash, dimensions, Boolean `existing` field, and
requested core limit.  Confirm, status, model, log, and proof operations must
refer to that same prepared job.  A status response with a foreign ID or a
post-confirm regression to `prepared` fails closed.

A `completed` terminal response is accepted only with exactly:

```text
requested_core_limit = 1
attested_solver_processes = 1
attestation_basis = SINGLE_PROCESS_NO_PARALLEL_FLAG
```

The current daemon `failed` contract is accepted only as `result=UNKNOWN`,
`requested_core_limit=1`, and explicit null values for both
`attested_solver_processes` and `attestation_basis`.  A failed no-solver state
must not have model or solver-log artifacts.

This attestation is deliberately narrow.  Every receipt says false for OS
affinity, OS thread limits, cpuset limits, and OS core enforcement.  It does
not infer those properties from the requested limit or process count.

## SAT validation

SAT remains `STRUCTURAL_SAT`, not proof closure.  Before a receipt exists, the
runner requires and authenticates:

1. the PIQD model response body;
2. a nonempty solver log;
3. the complete hash-chained journal, seal, and content-addressed artifacts;
4. exactly one signed literal for every DIMACS variable, with no duplicate,
   missing, zero, or out-of-range variable;
5. independent satisfaction of every DIMACS clause;
6. decoding through the complete source54 variable map to exactly one base
   choice at each of the 12 centers;
7. replay of the source-faithful and normalized cell-8 semantic gates against
   an independently reconstructed checkpoint whose CNF bytes match the
   package.

PIQD's successful `GET /model` response separately reports a recovered count
equal to the CNF variable count.  That is an agreeing daemon-side opinion, not
the runner's completeness authority: the runner re-enumerates the returned
assignment at its own boundary and independently requires the exact set
`1..44855` before scanning clause satisfaction.  No inference is made from
full solver-log parsing, which does not provide that completeness guarantee.

The receipt binds the archived model-response digest to this semantic replay,
records the decoded base cube and its canonical digest, and records the
variable-map digest.  Any model, clause, decode, or semantic mismatch prevents
receipt creation.

Completed `UNSAT` is discovery evidence because no proof replayer is attached;
completed `UNKNOWN` is a terminal diagnostic.  Both require a nonempty
authenticated solver log.  Neither is theorem closure.

## Receipt custody and claims

The run-directory descriptor is opened without following any path component
and held across reservation, the complete generic driver lifecycle, journal
reopening, receipt installation, validation, and failure cleanup.  Generic
`DurableAttemptJournal` operations use a descendant-capable path derived from
that held directory inode, so an ancestor rename cannot redirect journal or
artifact writes.  Before success the caller-visible directory pathname must
still resolve to the held inode.  On failure, cleanup addresses only the five
reserved output names through that descriptor and refuses symlinks,
hard-linked files, malformed artifact names, or substituted directories.

The journal, seal, artifacts, and receipt are re-opened without following
symlinks.  Reads compare descriptor and pathname identities before and after
capture.  The receipt is canonical JSON, self-hashed with `receipt_sha256`,
created with `O_EXCL`, fsynced, and read back before it is returned.  Existing
run paths, links, hard-linked evidence, substitutions, partial reads, journal
tampering, seal tampering, artifact tampering, and receipt tampering fail
closed.

The generic client currently exposes the decoded terminal status object, not
its raw HTTP response bytes.  Therefore the receipt records a canonical status
hash, `terminal_status_raw_available=false`, and
`terminal_status_raw_sha256=null`.

Every receipt fixes the following claims to false:

- source entitlement;
- aggregate cell coverage;
- complete source coverage;
- universal lift;
- theorem closure;
- Lean checked;
- Lean closure.

These remain false even after complete SAT semantic replay.

## Invocation and verification

The run directory must already exist and be empty of the reserved journal,
artifact, seal, lock, and receipt paths.

```bash
PYTHONPATH=. uv run python \
  -m census.p97_search.phase3_piqd_exact12_source54_runner \
  PATH_TO_PACKAGE REPO_ROOT PATH_TO_EMPTY_RUN_DIR
```

The focused fake-client suite is intentionally single-process:

```bash
PYTHONPATH=. uv run --with pytest pytest -p no:xdist \
  census/p97_search/tests/test_phase3_piqd_exact12_source54_runner.py -q

uv run --with ruff ruff check \
  census/p97_search/phase3_piqd_exact12_source54_runner.py \
  census/p97_search/tests/test_phase3_piqd_exact12_source54_runner.py
```

The 28 focused tests cover valid SAT, `UNSAT`, and failed states; live strict
bank-validator use; source-bank receipt binding and substitution; package-wave
and execution-wave separation; producer digest separation; single-attempt
behavior; complete-model and every-clause rejection; foreign status IDs;
attestation type/value tamper; vacuous CNF; missing logs; create-once receipts;
self-hash tamper; producer body-digest tamper; and run-directory substitution
with descriptor-owned cleanup.  The suite also covers the package-index
self-entry and exact clause-scan count/type contract.  It does not start a live
daemon, solver, or Lean process.

## Observed one-core canary (2026-08-09)

One live run against PIQD commit `55c47a8` used the persistent package above
and `requested_core_limit=1`.  Job
`6d4c000c-9a56-471a-bc05-5a4a25d4692e` completed `SAT`; the terminal response
attested one solver process with basis `SINGLE_PROCESS_NO_PARALLEL_FLAG`.
Independent receipt reload—not merely the runner CLI—re-authenticated the
package, sealed journal, artifacts, model response, and receipt, and replayed a
complete assignment over all 44,855 variables.  Every one of the 732,131
clauses and both source-faithful semantic gates passed.

The durable evidence is preserved under
`scratch/p97-piqd-exact12-source54-run-canary-2026-08-09-v2/` with receipt
SHA-256 `a09654d31af49cfe35c547e77bfaf7372b7f96393e2a68b161bdbd6b21fe4e6e`
and journal SHA-256
`69485d3ccfe206bbecd7089c516c227eb2a493ce759eff017e0a7e9056b5b359`.
The run is finite local SAT evidence only: all seven source-entitlement,
coverage, universal-lift, theorem, and Lean claims remain false, and the
proof-blueprint anchor is unchanged.
