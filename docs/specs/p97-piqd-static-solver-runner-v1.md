# P97 PIQD static SolverRunner adapter v1

Status: #4398/#4402/#4427/#4443 fake-transport hardening implemented; production
discovery wiring and live execution remain blocked until the maintainer posts a
repaired deployment. No live raw job was used for this version.

This boundary adapts one already-materialized static DIMACS file to the existing
`SolverRunner(Path, timeout_s, proof_path)` injection point used by
`census/p97_search/sat_generate.py` and
`census/p97_search/phase3_structural_cegar.py`. It does not modify either
caller. It is producer-neutral: a `sat_generate` package or a frontier/static
structural package supplies the same two canonical manifests and exact CNF
file.

The implementation is
`census/p97_search/phase3_piqd_static_solver_runner.py`. The public construction
seam is:

```python
runner = make_static_piqd_solver_runner(
    base_url=...,
    journal_root=...,
    source_manifest=canonical_source_bytes,
    producer_manifest=canonical_producer_bytes,
    transport=...,  # omitted for the production HTTP transport
)

result = runner(cnf_path, timeout_s, legacy_drat_path)
```

`StaticSolverResult` deliberately has the same five fields as the legacy
result (`verdict`, `assignment`, `returncode`, `stdout`, and `stderr`) without
importing a script-oriented legacy module. Both existing callers consume this
structural interface.

## Authenticated request identity

The adapter accepts only canonical, bounded, duplicate-free JSON. JSON depth is
bounded at 16, node count at 512, and each manifest at 64 KiB. Unknown keys,
boolean-as-integer substitutions, noncanonical bytes, non-lowercase hashes, and
true promotion/resource claims are rejected before transport.

The source manifest schema is `p97-piqd-static-source/v1`. It has exact fields:

- `source_id`, `source_path`, and declared `source_sha256`;
- `finite_schema`, `cardinality_scope`, and `source_theorem`; and
- `claims`, with `source_entitlement`, `theorem_coverage`, `universal_lift`, and
  `lean_closure` all exactly `false`.

The adapter authenticates the source declaration; it does not infer that the
declaration is entitled to a theorem. In particular, `source_theorem` is an
identity label needed by the current wave schema, not a proof claim.

The producer manifest schema is `p97-piqd-static-producer/v1`. It has exact
fields:

- `producer_id` and `producer_kind = "static-dimacs"`;
- the complete source manifest plus its exact SHA-256;
- `variable_map_sha256`;
- `backend = "cadical"`, `solver_profile = "sat"`, and an explicit query
  polarity; and
- all source claims plus `one_process` and `one_core`, again exactly `false`.

The exact canonical source bytes, exact canonical producer bytes, and exact CNF
bytes are each separately stored as content-addressed attempt artifacts.
Embedding the complete source object in the producer bytes also binds the
source declaration transitively. The producer hash is then bound into both the
wave manifest and PIQD raw identity.

The CNF path is made absolute lexically and captured from a held filesystem-root
descriptor. Every parent component is opened with `O_DIRECTORY|O_NOFOLLOW` and
held through the read and final checks; each named parent is compared with its
held device/inode and its descriptor metadata is checked for changes. The final
component is opened relative to the held parent with `O_NOFOLLOW|O_NONBLOCK`,
must be a regular file with link count exactly one, is bounded (1 GiB by
default), and is read only from that held descriptor. Its full device, inode,
mode, link-count, size, modification-time, and change-time identity is checked
before and after the read and against the final named component. Parent rename,
repoint, intermediate/final symlink, hardlink, file replacement, and mutation
therefore fail before transport. The adapter parses the exact bytes locally
before any request. Its wave identity records the exact SHA-256, variable count,
clause count, variable-map hash, producer hash, backend/profile, query polarity,
and one-shard ordering hash. `PiqdRawDimacsClient.prepare_cnf` independently
checks the same bytes, dimensions, producer hash, and raw PIQD identity.

## Current PIQD lifecycle

Each call creates the configured journal-root components with no-follow
directory opens, then reserves a new create-once attempt directory beneath a
held root descriptor. The adapter holds descriptors for that directory, its
journal, lock, and artifact directory through the entire run. Every read and
write is relative to those held descriptors; regular files must have link count
one, and device/inode identities are rechecked against the named components.
Repeated identical CNFs therefore do not reopen or overwrite a sealed attempt.

The descriptor-rooted `DurableAttemptJournal` implementation archives the
exact source manifest, producer manifest, CNF, raw responses, and driver event
artifacts; hash-chains the records; and creates the driver seal once. The
adapter then creates `solver-receipt.json` and `custody-seal.json` with
`O_EXCL|O_NOFOLLOW`, rereads the exact installed bytes, revalidates every held
inode and artifact, rejects unexpected attempt-directory entries, and fsyncs
the files and directories. The custody seal binds the attempt directory
device/inode, receipt content and file hashes, journal/lock identities, driver
seal, and a complete content-addressed artifact inventory.

The explicit post-reservation retry policy is
`REMOVE_UNSEALED_RESERVED_ATTEMPT`. Driver, oracle, and OS failures that leave
the descriptor custody intact are represented by a canonical terminal ERROR
record, driver seal, solver receipt, and custody seal. If a failure prevents
canonical publication—for example a journal, lock, seal, artifact, receipt, or
custody-seal substitution—the adapter removes only that freshly reserved
attempt through held descriptors and returns fail-closed UNKNOWN. It never
reopens or resumes a prior attempt. If it cannot prove either publication or
clean removal, it raises instead of presenting an ambiguous artifact.

`PiqdCegarDriver` and `PiqdRawDimacsClient` execute the current API, not an
adapter-specific response protocol:

The exact endpoint set is:

1. `POST /jobs/prepare-cnf`: the sole pre-job request. It returns HTTP 200 JSON
   and is accepted only when the returned job ID, exact CNF hash and dimensions,
   producer-derived raw identity, requested core limit, and `existing` type
   match the request. `existing=true` means only that the exact raw identity was
   already present. Unlike the general `/jobs/prepare` path, the current raw
   endpoint does not reset an existing terminal UNKNOWN job: it returns that job
   with `existing=true`, and confirm can reconcile HTTP 409 by reading its
   terminal status. Both `existing` values are observations, not freshness
   attestations.
2. `GET /jobs/{job_id}/cnf`: HTTP 200 binary exact-byte readback before confirm.
3. `POST /jobs/confirm?job_id={job_id}`: HTTP 200 JSON naming that same job and
   `confirmed`; HTTP 409 permits one same-job status read for idempotent recovery.
4. bounded `GET /jobs/{job_id}`: HTTP 200 JSON status polling. The response must
   name the exact prepared job. The exact raw terminal bytes are archived and
   hashed before a separate canonical object/hash is placed in the receipt and
   durable driver event.
5. SAT only, `GET /jobs/{job_id}/model`: HTTP 200 JSON whose raw bytes are hashed
   by `CheckedModel`, whose job/result metadata match, and whose total signed
   assignment is independently replayed.
6. `completed` terminal results only, paginated
   `GET /jobs/{job_id}/log?from={offset}&max=1048576`: HTTP 200 pages with a
   stable `X-Log-Size-Bytes`; the assembled bytes and hash are journaled.

There is no `/progress` endpoint. `progress.solver_started` is a required field
inside the job-status JSON. There is no clause-map or Lean endpoint in this
static discovery adapter. Because `proof_replayer=None`, it never calls
`GET /jobs/{job_id}/proof`; the recording boundary rejects such a call as a
contract violation.

The transport wrapper itself enforces this endpoint allowlist before invoking
either the injected fake or production HTTP transport. Every successful
response has exactly one expected media type. Prepare, confirm, and status JSON
are each capped at 1 MiB; stored CNF at the configured CNF cap; model JSON and
the complete paginated log at 64 MiB; each log page at 1 MiB. JSON is
duplicate-free, rejects non-finite constants, and is bounded at depth 32 and
4,000,000 nodes. The production transport reads at most cap plus one byte.
Thus even malformed and unsuccessful response bodies pass through the same
endpoint-specific byte bound.

Every PIQD blob read is post-prepare and component-wise scoped to the exact
`PreparedJob`.
Confirm/CNF, model, and log accept that complete prepared-job value; status
accepts only its exact job ID. The adapter rejects a crossed job before handing
the blob to the driver. A `failed` no-solver lifecycle reads no model, log, or
proof. Under the daemon's current `completed`/UNKNOWN no-solver spelling, the
shared driver may archive the diagnostic spawn-failure log before the adapter
applies the exact attestation classification; that log is never solver-result
evidence.

The canary requests `requested_core_limit = 1`. That request is neither a
one-core nor one-process attestation, so both claims remain false. Nice level,
CPU affinity, memory limits, and process topology are not represented or
promoted by this adapter.

The `stdout` receipt is canonical JSON and binds job ID, exact CNF hash and
dimensions, source and producer hashes, journal path, terminal record, record
count, seal, the complete terminal status object and canonical SHA-256, exact
raw terminal-status byte hash/size/artifact hash, the endpoint trace, and a
status classification. `prepare_freshness_claimed` is always exactly `false`;
the separate `job_identity.existing` field preserves the raw endpoint's actual
dedup observation. Raw JSON need not be canonical: it is authenticated as
received, then parsed and canonicalized separately for the local receipt.
Transport/protocol failures and PIQD `UNKNOWN`/`ERROR` outcomes return legacy
`UNKNOWN` and an empty assignment.

The current status contract always exposes `id`, which is strictly compared to
the prepared job. If a response also exposes `backend`, `solver_profile`,
`project`, `identity_hash`, or `cnf_blob_hash`, every exposed field is strictly
bound to the prepared request and listed in the receipt. Otherwise the receipt
honestly records `terminal_status_identity_scope = "JOB_ID_ONLY"`; the adapter
does not claim that fields absent from the current endpoint were authenticated.

Result text alone is never treated as evidence that a solver ran. Classification
uses only the run-written attestation pair. Exactly one attested process with
`attestation_basis = "SINGLE_PROCESS_NO_PARALLEL_FLAG"` makes SAT or UNSAT an
`ATTESTED_SOLVER_RESULT`; UNKNOWN with the same pair is the distinct fail-closed
`SOLVER_UNKNOWN` classification.

Zero attested processes with
`attestation_basis = "SOLVER_DID_NOT_START"` is
`DEPLOYMENT_NO_SOLVER`, not a solver outcome. This rule deliberately does not
branch on whether the lifecycle spelling is `completed` or `failed`.
`requested_core_limit` is caller-supplied request metadata, never attestation;
the adapter records it and accepts the current null-or-positive-integer shape
without using its value to classify the run. `progress.solver_started` is also
recorded and type-checked but not promoted over the exact attestation pair.
Missing fields, invalid lifecycle/result shapes, attestation disagreement,
negative or multiple process counts, wrong strings or counts, and bool/float
substitutions for integer fields fail closed as `INVALID_STATUS_ATTESTATION`.

Current PIQD raw ingress intentionally rejects every zero-clause formula under
`PIQD-VAC-001`. After exact local DIMACS parsing and before reserving an attempt,
the adapter therefore rejects `num_clauses == 0` independently of the variable
count. Both `p cnf 0 0` and positive-variable `p cnf 1 0` return fail-closed
UNKNOWN without a reservation or endpoint request. This is not an SAT/UNSAT
observation.

An empty clause is distinct from a clause-free formula: `p cnf 1 1` followed by
`0` has one clause and is allowed to reach the current fake-transport contract,
where UNSAT remains observational under CERT-001. Valid zero-variable DIMACS
still exposes a separate PIQD shared-contract feature/bug requiring maintainer
resolution. `validate_wave_manifest` requires a positive variable count, so
honest zero-variable empty-clause UNSAT (`p cnf 0 1` followed by `0`) fails
closed before transport; its already-created local reservation is cleanly
removed. The adapter does not falsify dimensions or bypass either contract.

## SAT replay

For PIQD `STRUCTURAL_SAT`, the recording client requires that the driver's
checked model and prepared job share the terminal job ID. The assignment must
contain exactly one nonzero signed literal for every variable, with no bool,
duplicate, or out-of-range value. The adapter then replays that exact signed
assignment against the exact local CNF bytes and returns a total
`Mapping[int, bool]` only after every clause is satisfied.

This is finite source discovery evidence. The legacy caller remains responsible
for its producer-specific decode and semantic validation. No source
entitlement, theorem coverage, universal lift, or Lean closure follows.

## UNSAT and the legacy DRAT path

With `proof_replayer=None`, the current driver records `DISCOVERY_UNSAT`, the
exact CNF/producer artifacts, and the terminal solver log. It intentionally does
not request `/proof`.

The adapter returns observational `UNSAT` so the legacy caller can see the
solver outcome, but it never creates, truncates, renames, or writes the supplied
`proof_path`. The receipt records
`legacy_drat_proof_path_written = false`, and stderr names `CERT-001`.
Consequently the existing `sat_generate` and structural-CEGAR terminal paths
cannot accept this as their required DRAT artifact; their existing missing-proof
checks remain the promotion guard.

Compact PIQD proof/LRAT bytes must never be placed at a legacy `.drat` path.
Until CERT-001 supplies authenticated source-to-proof/clause-map/replay linkage,
PIQD static UNSAT remains observational and cannot establish a theorem.

## Focused fake-transport canary

The test suite is
`census/p97_search/tests/test_phase3_piqd_static_solver_runner.py`. It uses the
real Python client, driver, and durable journal around one fake HTTP transport;
it starts no daemon, solver, or Lean process. It covers:

- exact multipart CNF/producer submission and exact stored-CNF readback;
- `prepare-cnf existing=true` terminal SAT reuse, terminal UNKNOWN/no-reset
  behavior, HTTP 409 same-job reconciliation, and an explicit false freshness
  claim;
- total SAT model replay and independent receipt/custody-seal/artifact hashes;
- partial, duplicate, out-of-range, bool-integer, and clause-false models;
- exact no-solver versus solver-started UNKNOWN classification;
- completed/failed lifecycle/result/attestation combinations and null/positive
  request metadata;
- missing, crossed, negative, wrong, bool, and float status-attestation
  rejection;
- exact raw-versus-canonical terminal status custody, exposed request-identity
  binding, and bounded oversized/deep status rejection;
- crossed status job ID and tampered stored CNF;
- observational UNSAT with no proof endpoint and no legacy DRAT file;
- zero- and positive-variable clause-free preflight with zero transport, plus
  the distinct positive-variable empty-clause observational UNSAT path;
- strict source/producer crossing and claim rejection;
- bounded, rooted component-wise no-follow CNF snapshots, including parent
  rename/repoint, intermediate/final symlink, and pre-open or during-read
  hardlink attacks; and
- descriptor/inode rejection for journal, lock, driver-seal, artifact, receipt,
  and custody-seal symlink or replacement attacks;
- canonical failure sealing, explicit unsealed-reservation cleanup, and no
  symlink-target mutation; and
- restart behavior with distinct create-once attempts and immutable prior
  receipts.

Run it with exactly one pytest worker:

```bash
PYTHONPATH=. uv run --with pytest --with pytest-xdist \
  pytest -q -n 1 \
  census/p97_search/tests/test_phase3_piqd_static_solver_runner.py
```

The recommended next one-lane canary is a single SAT-discovery invocation from
one `sat_generate` exact package, injected only through `solver_runner=runner`
and capped at one returned model. It should first compare the adapter's locally
replayed total assignment with the caller's existing decode/semantic replay.
An UNSAT result in that canary must remain diagnostic because no DRAT path is
written. Frontier-package onboarding should follow only after this single-lane
SAT custody check.

Proof-blueprint session `019fdf9c` is unchanged, open, and off-spine. This
adapter closes no proof-blueprint leaf and makes no theorem-coverage or closure
claim.
