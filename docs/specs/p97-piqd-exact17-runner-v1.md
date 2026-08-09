# P97 PIQD Exact-17 Runner v1

Status: gate-2 finite discovery runner. This contract does not establish a
source theorem, aggregate case coverage, a universal lift, or theorem closure.

Implementation:
`census/p97_search/phase3_piqd_exact17_runner.py`.

## Accepted ingress

The runner accepts exactly the frozen corrected-v12t order-zero package. The
package directory must contain exactly these ten private regular files (link
count one), with no substitutions or additional entries:

1. `discovery.cnf`
2. `structural-roundtrip.cnf`
3. `upstream-manifest.json`
4. `validation-report.json`
5. `ingress-identity.json`
6. `variable-map.json`
7. `order.json`
8. `producer-manifest.json`
9. `wave-manifest.json`
10. `package-result.json`

Directory components and files are opened with `O_NOFOLLOW`. Each artifact is
bounded (256 MiB for either CNF and 8 MiB for JSON), must remain the same regular
file for the complete read, and is retained as one immutable byte snapshot.
The reader compares descriptor identity before and after the read and compares
the final descriptor identity with the pathname identity. It also rechecks the
directory identity and exact entry set. Symlinks, hard links, FIFOs, devices,
oversized files, directory mutation, and file replacement fail closed.

The selected byte identities are pinned as follows:

| artifact | SHA-256 | bytes | variables | clauses |
|---|---|---:|---:|---:|
| `discovery.cnf` | `62de9fb9e20d13ff256f59aa20d5044f55bc17f9adbce8204564d486adfc75fb` | 95,933,857 | 74,813 | 2,504,349 |
| `structural-roundtrip.cnf` | `884029ff0a06830273a71c650e70e1fa6530a088fabd04d8d83884c56bcdaf98` | 4,160,204 | 285 | 145,975 |

The frozen upstream manifest hash is
`940bd8aa727f144973840c5fa69ea968a5942a8be4ef695acb25eb7224c86572`;
the frozen validation-report hash is
`ee7bbde2ce02fce6c3e2ced5e3ea26075b747e528e9b439b2fd26e057b3907bd`.

All JSON is parsed strictly: duplicate keys, non-finite constants, malformed
UTF-8/JSON, non-object roots, and excessive recursion are rejected. The six
runner-generated records (`ingress-identity`, `variable-map`, `order`,
`producer-manifest`, `wave-manifest`, and `package-result`) must be canonical
JSON bytes. The two upstream historical records are pinned byte-for-byte but
are not rewritten or incorrectly claimed to have canonical historical
serialization.

The loader then checks all hash and dimension links among the ten artifacts.
It additionally requires:

- both CNFs have positive variable and clause counts;
- the upstream v4 record has `transitive_two_circle=true`;
- validation, exact regeneration, and structural model roundtrip are `PASS`;
- order index is zero and aggregate-order coverage is false;
- the variable map remains `PARTIAL_OPAQUE_VARIABLE_MAP` with no full custody;
- every unavailable provenance, source, coverage, lift, theorem, and daemon
  claim remains false; and
- the wave is `cadical/sat`, shard `0/1`, seed `97`, with the exact canary wave
  identity and matching CNF, producer, variable-map, order, and dimensions.

## Execution policy

The production entry point supplies a `PiqdRawDimacsClient`; tests supply a
deterministic fake daemon through the same client protocol. Both flow through
one internal `run_packet` path, which is also used for tiny known-SAT and
nonempty-clause known-UNSAT preflight packets.

The path constructs `DurableAttemptJournal` and `PiqdCegarDriver` directly. Its
fixed limits are:

- one prepare attempt;
- one confirm attempt;
- one terminal-result artifact attempt;
- one synchronous in-flight job;
- `cadical` backend with `sat` solver profile;
- shard zero of one and seed 97; and
- `requested_core_limit=1` in the prepared request.

The raw-DIMACS client must include that exact built-in integer in prepare
metadata, require the prepare response to echo it, and bind it into the
raw-DIMACS identity. Only a terminal `completed` status carries non-null
solver-process attestation, and it is accepted only when it
contains the exact built-in values
`requested_core_limit=1`, `attested_solver_processes=1`, and
`attestation_basis="SINGLE_PROCESS_NO_PARALLEL_FLAG"`. Missing, null, wrong,
Boolean, or floating-point substitutions fail closed. This requirement is
independent of solver verdict: a timeout is `completed` with result `UNKNOWN`
and must carry the same exact process attestation.

A terminal `failed` status is the distinct pre-solver, blob-missing path. It
must carry exact built-in `status="failed"`, exact built-in
`result="UNKNOWN"`, and exact built-in integer `requested_core_limit=1`.
Because no solver was spawned, `attested_solver_processes` and
`attestation_basis` must both be present and exactly null. This is accepted as
a valid no-solver-run observation while `solver_process_attestation_accepted`
remains false. A missing, wrong, Boolean, floating-point, or wrongly non-null
member fails closed.

This is narrowly a solver-process attestation: the daemon reports one solver
process and that it did not supply a parallelism flag. It is not an attestation
of the solver's OS thread count, a cgroup or cpuset restriction, affinity, a
physical-core limit, or any other OS-level core enforcement. The receipt names
these distinctions explicitly and keeps each OS-enforcement claim false.

A strict client proxy accepts `PreparedJob.existing` only as an exact built-in
Boolean. Either value is informational deduplication evidence, not an outcome
or freshness gate. The exact value is recorded in and rebound from the durable
PREPARE event, while the CNF hash, raw-DIMACS identity, dimensions, backend,
profile, job ID, and requested limit remain exact. The proxy also binds every
operation to the one prepared job, rejects stale/foreign status identities and
a post-confirm regression to `prepared`, rechecks retrieved artifact hashes,
and independently streams every SAT assignment through every submitted clause.
The assignment must be total, unique, in range, and satisfying.

Every `completed` solver result must also bind the daemon's complete paginated
solver log. The generic P97 driver retrieves and content-addresses the log after
a SAT assignment has passed independent clause replay and before it appends the
terminal `STRUCTURAL_SAT` record; that record binds both `model_sha256` and
`solver_log_sha256`. The already-existing UNSAT path continues to archive the
log before either `DISCOVERY_UNSAT` or proof replay. Completed `UNKNOWN` and a
completed SAT whose model is rejected also archive the log before their
terminal `ERROR` records. A missing, empty, non-bytes, malformed-hash, or
hash-mismatched log prevents a completed exact17 run receipt. The distinct
pre-solver `failed` state neither fetches nor binds a solver log.

Consequently:

- SAT becomes `STRUCTURAL_SAT` only after complete clause replay and durable
  solver-log archival;
- a partial, duplicated, out-of-range, or unsatisfying assignment becomes
  `ERROR`;
- UNSAT remains `DISCOVERY_UNSAT`, because this gate deliberately has no
  independent proof replayer; and
- completed `UNKNOWN` retains its log and terminal result/status observation,
  while failed no-solver retains its distinct null-log state; both driver
  outcomes are `ERROR`; and
- stale status, protocol mismatch, timeout, daemon failure, and malformed
  result paths fail closed as `ERROR`. An exactly rebound existing identity is
  accepted and classified solely by its terminal result.

Neither `STRUCTURAL_SAT` nor `DISCOVERY_UNSAT` is a source-level or Lean result.

## Immutable observational receipt

The receipt schema is `p97-phase3-piqd-exact17-run-receipt/v1`. It is canonical
JSON with a trailing newline, installed with `O_CREAT|O_EXCL|O_NOFOLLOW` in an
already-existing no-follow run directory, fsynced, and read back through a
bounded regular-file snapshot. Existing receipt and journal paths are rejected.

The self-authenticated receipt binds:

- the exact hash of every package artifact and their aggregate identity;
- the wave-manifest hash;
- prepared job ID, backend/profile, CNF blob hash, raw-DIMACS identity hash,
  dimensions, and `existing` flag;
- terminal lifecycle status, solver result, and distinct driver outcome;
- journal byte hash, record count, terminal record hash, seal hash, seal-file
  hash, and every journal artifact hash;
- the terminal record's exact `solver_log_sha256`: a nonempty authenticated
  artifact for every `completed` status and exactly null for the bounded
  pre-solver `failed` state;
- a canonical hash of the decoded response object from the unique terminal
  status-bearing `POLL`, `SOLVER_UNKNOWN`, or `DAEMON_FAILED` checkpoint, when
  observed;
- the prepared and terminal requested limit, terminal solver-process count,
  terminal attestation basis, and acceptance of that exact process-level
  attestation or of the exact bounded failed no-solver state, while explicitly
  denying OS thread, cpuset, and core-enforcement attestation;
- `source_semantics=UNAVAILABLE_OPAQUE_VARIABLE_MAP`; and
- false source-semantics, source-entitlement, complete-coverage,
  aggregate-order, universal-lift, and theorem-closure claims.

The `job_identity` object has an exact field schema and built-in scalar types.
For a successful prepare it must match the durable PREPARE event, while its
requested limit is cross-bound to the durable DRIVER_START policy. The CNF
hash, dimensions, backend/profile, and raw-DIMACS identity are also recomputed
from the run packet. If no successful PREPARE event was durably recorded, every
job-identity field is null; an in-memory observation rejected before PREPARE
journaling is not promoted into the receipt.

`PiqdRawDimacsClient.status` returns a decoded mapping and the durable journal
records that mapping in a successful terminal `POLL`, or in the terminal
`SOLVER_UNKNOWN`/`DAEMON_FAILED` error checkpoint. It does not expose or
journal the raw HTTP GET body. The receipt therefore preserves the terminal
status mapping's canonical hash when available, while setting
`terminal_status_raw_sha256=null` and
`terminal_status_raw_available=false`. It must not substitute a hash of an
unstable serialization or fabricate a raw-response hash. Later terminal result
checkpoints have different response schemas: in particular, a successful SAT
`MODEL` event carries only its model-replay summary. Such an event must never
shadow the earlier terminal `POLL` response or supply the receipt's top-level
terminal lifecycle status/result.

Receipt validation recomputes its self-hash, package and wave bindings, false
claims, solver-process attestation with exact built-in types, journal byte hash,
journal chain/seal, terminal record, terminal solver-log artifact, and terminal
outcome. A completed record with no log, an empty log, a changed log artifact,
or a re-signed log-digest substitution fails closed. Re-signing a changed
outcome, attestation, or positive claim is still rejected because it disagrees
with durable evidence or this contract.

## Concurrency and filesystem boundary

The runner is single-job and uses one caller-owned run directory. The package
and receipt readers defend against link and replacement attacks. The generic
journal implementation remains responsible for its own lock, append, artifact,
and seal durability. Callers must not let an untrusted process rename or replace
the run directory during execution; the current journal API is path-based and
does not accept a pre-opened directory descriptor.

## Test gate

Run with one pytest process:

```bash
PYTHONPATH=. uv run --with pytest pytest -q \
  census/p97_search/tests/test_phase3_piqd_exact17_runner.py
```

The deterministic suite covers the ten-artifact cross-binding, malformed JSON,
artifact substitution, symlink and simulated TOCTOU rejection, vacuous and
zero-clause packets, nontransitive and non-`PASS` gates, known SAT, known UNSAT,
authenticated existing-identity acceptance and tamper rejection, partial and
unsatisfying models, stale status, immutable output paths, all
missing/wrong/null/float/Boolean terminal-attestation shapes, completed
`UNKNOWN` with a valid process attestation, failed exact
`UNKNOWN`/request-one/null-attestation no-solver state, failed scalar and
presence substitutions, and outcome/claim/attestation/job-identity receipt
tampering, including re-signed scalar-type substitutions. A live-shaped SAT
sequence also proves that the completed/SAT `POLL` response and canonical hash
survive the later `MODEL` replay checkpoint and that the terminal record binds
the archived SAT solver log. Missing, empty, malformed, hash-mismatched,
artifact-tampered, and re-signed log substitutions are rejected. The CLI
defaults to the project daemon endpoint at `http://127.0.0.1:7272`; expected
runner, oracle, driver, and recursion failures normalize to exit code 2, while
unexpected exceptions propagate. The suite does not start PIQD, run a solver,
invoke Lean, or make a network request.
