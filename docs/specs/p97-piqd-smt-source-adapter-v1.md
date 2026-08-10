# P97 producer-neutral PIQD SMT source adapter v1

Status: implemented diagnostic adapter. This is an off-spine interface spec, not
a proof claim.

Implementation:
`census/p97_search/phase3_piqd_smt_source_adapter.py`.

## Purpose and boundary

The adapter lets a producer submit one source-semantic SMT query to PIQD without
making PIQD understand that producer's domain. It preserves the exact original
SMT-LIB2 bytes, derives the exact state-command journal PIQD accepts, runs one
fresh Z3 session and then one fresh cvc5 session, and binds each solve response
to the corresponding journal export and durable PIQD receipt.

PIQD supplies solver execution and byte-level receipts. The producer supplies
the semantic input, registries, and a verifier that interprets the returned SAT
model and `get-value` text in the producer's own semantics. Neither component
silently supplies the other's missing meaning.

The adapter always emits these claims as exact JSON `false` values:

```json
{
  "source_entitlement": false,
  "theorem": false,
  "universal": false,
  "lean": false,
  "euclidean": false
}
```

Hashes establish custody of captured bytes. They do not establish that the
declared producer was entitled to those bytes. A finite SMT result is not a
theorem, a universal result, a Lean proof, or a Euclidean-geometric result.

## Input packet

All paths are normalized POSIX paths relative to one descriptor root. The
descriptor has schema `p97-piqd-source-semantic-query/v1` and exactly these
keys:

```json
{
  "schema": "p97-piqd-source-semantic-query/v1",
  "producer": {"id": "producer-id", "version": "producer-version"},
  "semantic_verifier": {"id": "verifier-id", "version": "verifier-version"},
  "stage_id": "producer-stage-id",
  "query_id": "producer-query-id",
  "sources": [
    {"path": "relative/source", "bytes": 123, "sha256": "lowercase-sha256"}
  ],
  "semantic_input": {},
  "semantic_sha256": "sha256-of-canonical-semantic-input",
  "original_smt2": {
    "path": "relative/query.smt2",
    "bytes": 456,
    "sha256": "lowercase-sha256"
  },
  "variables": [
    {"id": "producer-variable-id", "term": "exact-smt-term", "sort": "Int"}
  ],
  "named_atoms": [
    {"id": "producer-atom-id", "assumption_term": "exact-smt-term"}
  ],
  "solve": {
    "assumption_ids": ["producer-atom-id"],
    "readback_variable_ids": ["producer-variable-id"],
    "include_model": true
  },
  "solver_profile": {
    "schema": "piqd-smt-sequential-z3-cvc5/v1",
    "solvers": ["z3", "cvc5"],
    "timeout_ms": 60000
  }
}
```

The following rules are normative:

- `sources` is nonempty, path-sorted, and has no duplicate path.
- `variables` and `named_atoms` are uniquely ID-sorted. SMT terms are unique
  within their registry.
- Assumption and readback IDs are unique and registered. At least one readback
  variable is required, because v1 requires a SAT `get-value` replay.
- `include_model` is the exact JSON Boolean `true`.
- The only solver order is fresh Z3 followed by fresh cvc5. Execution is
  sequential, so at most one solver process can exist through this adapter at a
  time. Solver arguments remain daemon-owned. In particular, v1 does not claim
  or request cvc5 `--nl-cov`.
- `semantic_sha256` is over canonical UTF-8 JSON with sorted object keys, no
  insignificant whitespace, and unescaped non-ASCII text.
- Every declared source and original SMT2 byte count and SHA-256 must match the
  descriptor-rooted file exactly. Each bounded source payload is retained as an
  immutable in-memory snapshot, not discarded after hashing.

The public run boundary reparses the exact descriptor bytes and reconstructs
the descriptor, original-SMT custody checks, source snapshot hashes, and
normalized journal. It rejects a fabricated or subsequently mutated query
object whose supplied derived fields differ. Execution and semantic replay use
fresh immutable snapshots; neither step reopens producer paths.

The descriptor, semantic input, transport responses, and verifier evidence use
only exact builtin JSON types: object with string keys, array, string, integer,
Boolean, and null. Floats, tuples, mapping subclasses, integer/Boolean
subclasses, duplicate keys, `NaN`, and infinities are rejected. Exact schemas
reject undeclared keys.

## Original SMT2 and the PIQD journal

The adapter keeps the original SMT2 file byte-for-byte as `original.smt2`. The
file must be UTF-8 and contain only PIQD state commands:

```text
set-logic              set-option
set-info               declare-sort
define-sort            declare-fun
define-fun             declare-const
define-const            declare-datatype
declare-datatypes       define-fun-rec
define-funs-rec         assert
push                    pop
```

The options PIQD owns are forbidden in producer input:

```text
print-success                 produce-models
produce-unsat-assumptions     produce-unsat-cores
regular-output-channel        diagnostic-output-channel
timeout                       tlimit-per
```

Every non-state command is rejected. That includes `check-sat`,
`check-sat-assuming`, every `get-*` query, and `exit`. The adapter never strips
a terminal query suffix. Accepting bytes and then silently dropping part of
them would invalidate the custody boundary.

The journal normalizer uses PIQD's top-level command semantics. It recognizes
SMT strings, quoted symbols, and comments while locating balanced top-level
commands. For each command it retains the exact UTF-8 byte slice from opening
to closing parenthesis and appends one LF byte. Whitespace and comments outside
commands do not enter the journal; spelling, whitespace, strings, quoted
symbols, and comments inside a command remain exact. The resulting bytes are
stored as `journal.smt2`.

## Exact PIQD session protocol

V1 uses only the current SMT session routes below. There is no model route,
source/blob route, replay route, manifest route, or named-core route.

1. `POST /sessions`

   Request: `solver`, `lane: "smt"`, and `label`.

2. `POST /sessions/:id/assert`

   Request: `commands` containing the normalized exact command strings and
   `expect_commands: 0`. The returned `added` and `commands` must both equal
   the packet command count.

3. `GET /sessions/:id/smt2`

   The raw response body must be byte-identical to `journal.smt2`. PIQD serves
   this export from separate live and detached code paths; v1 treats either
   path's disagreement as a hard custody failure.

   A pre-solve `GET /sessions/:id/receipts` must return the exact current
   envelope with count zero. This proves the newly created session has no prior
   solve receipt.

4. `POST /sessions/:id/solve`

   Request keys are exactly `assumptions`, `timeout_ms`, `include_model`, and
   `get_values`. Assumption registry IDs are translated to their registered SMT
   terms. Readback variable IDs are translated to their registered SMT terms.

   The status-specific response has `status`, `solve_ms`, `solve_index`, and
   `result_sha256`, plus:

   - SAT: exact raw `model` and `values` strings;
   - UNSAT: `core` and `terminal_unsat`; or
   - UNKNOWN: optional `interrupted_by`, currently only
     `"daemon_deadline"`.

5. `GET /sessions/:id/receipts`

   The envelope is exactly `session_id`, `lane`, `journal_path`,
   `receipts_path`, `count`, and `receipts`. After an observed solve response,
   the fresh session must contain exactly one receipt. The SMT receipt carries:

   ```text
   solve_index       base_commands      base_bytes
   base_sha256       solver_signature   solver_sha256
   assumptions       timeout_ms         include_model
   get_values        status             solve_ms
   result_sha256     at
   ```

   plus the same status-specific answer keys as the solve response.

   The receipt path is not treated as opaque text. Current PIQD constructs an
   SMT journal as `<data-root>/sessions/<session-uuid>/journal.smt2` and derives
   its receipt journal by replacing only the leaf with `receipts.jsonl`. V1
   requires the canonical session UUID/path components and exact derived
   sibling path. Create and close responses repeat and cross-bind the journal
   path; both the empty pre-solve and complete post-solve receipt envelopes must
   carry the one derived receipt path. The adapter has no separately configured
   PIQD data-root pathname, so the prefix above `sessions/` is daemon-authored
   create-time identity, not an independently authenticated operator path. The
   V1 guarantee is exact canonical derivation plus create/receipt/close
   cross-surface binding; it is not a claim that the daemon prefix resides under
   some external expected filesystem root.

6. `DELETE /sessions/:id`

   The session is closed in a `finally` path before the next solver starts. A
   create response must have zero clauses, variables, and solves and null last-
   solve fields. The close response must preserve create-time identity and bind
   `clauses`, `solves`, `last_status`, `last_solve_index`,
   `last_assumption_free`, and `last_terminal_unsat` to the one asserted journal
   and durable solve. Session UUIDs may not repeat across the two engines.

The adapter cross-binds the session ID and lane, solver signature and binary
hash, journal path, one-based solve index, journal command count/byte count/hash,
assumption terms, timeout, model request, readback terms, status-specific answer
fields, solve time, and result digest.

The ordinary binding gate for the result digest is equality between PIQD's
`result_sha256` in the solve response and in receipt 1. V1 also locally
recomputes the current `piqd-smt-solve-result/v1` digest over `status`,
`interrupted_by`, `terminal_unsat`, daemon `core`, `model`, and `values`. That
recomputation is recorded only as advisory metadata. It is not a gate, because
the internal digest framing may acquire a v2 while PIQD's own response/receipt
cross-binding remains valid.

### Transport loss after create

The adapter never retries `POST /solve`. If its response is lost after a
strict UUID-bearing session was created, it immediately reads that session's
receipts:

- one complete, request-bound receipt reconstructs the solve answer and is
  marked `reconciled_from_receipt: true`; there is no claimed response/receipt
  equality because the response was not received;
- zero receipts yields `INCONCLUSIVE_TRANSPORT_LOSS`, with null raw status,
  solve index, digest, and semantic replay.

Both paths still close the known session and validate the close state. A
transport loss during create exposes no trustworthy UUID and therefore fails
closed without guessing a session. Conversely, a malformed 201 body that still
contains a strict canonical UUID is deleted exactly once before the malformed
response is rejected. Other route or receipt transport failures remain hard
failures because they cannot be reconciled by an additional invented route.

## UNSAT assumption provenance

PIQD's SMT JSON response calls one field `core`, but it is populated by
`get-unsat-assumptions`. It is not a named assertion core. The adapter keeps the
raw daemon spelling only inside the immutable raw solve and receipt artifacts.
At its semantic boundary it renames the field to `unsat_assumptions` and emits:

```json
{
  "basis": "get-unsat-assumptions",
  "named_core_support": false,
  "daemon_field": "core",
  "assumption_terms": ["registered-term"],
  "source_atom_ids": ["producer-atom-id"],
  "terminal_unsat": false
}
```

Terms must be unique and a subset of the exact assumptions sent for that solve.
An unrequested or duplicate term is a hard provenance failure. An empty list
with `terminal_unsat: true` says only that the finite SMT state was UNSAT
without assumptions. The exact daemon invariant is
`terminal_unsat == core.is_empty()`; V1 checks it independently in the solve
response, durable receipt, renamed provenance object, and final engine output.
Thus a solve with no requested assumptions can only report an empty daemon
`core` and `terminal_unsat: true`. Every UNSAT result remains
`UNSAT_DISCOVERY_ONLY`.

## SAT semantic verifier seam

For each SAT result, the adapter calls a producer-supplied verifier with an
isolated snapshot of the source-semantic query, the solver name, the exact raw
model text, and the exact raw `get-value` text. The verifier returns only:

```text
SemanticVerification(accepted: exact Boolean, evidence: exact builtin JSON)
```

The adapter records hashes of the model and value text plus the verifier's
declared ID/version and evidence. Acceptance yields
`SAT_SEMANTICALLY_REPLAYED`. Rejection yields
`INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED`. An exception, wrong return type, or
invalid evidence yields `INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE`. A verifier
cannot turn the adapter's explicit false theorem/provenance claims true.

## Outcome classification

| Raw/effective condition | Adapter classification |
| --- | --- |
| SAT and verifier accepts | `SAT_SEMANTICALLY_REPLAYED` |
| SAT and verifier rejects | `INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED` |
| SAT verifier fails | `INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE` |
| UNSAT | `UNSAT_DISCOVERY_ONLY` |
| UNKNOWN | `INCONCLUSIVE_UNKNOWN` |
| Lost solve response, no receipt | `INCONCLUSIVE_TRANSPORT_LOSS` |
| Any effective inconclusive result | overall `INCONCLUSIVE` |
| Decisive raw solvers disagree | overall `INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT` |
| Same decisive finite raw status | overall `FINITE_DIAGNOSTIC_COMPLETE` |

Malformed packets, unexpected API schemas, route failures, receipt mismatch,
journal mismatch, or source/provenance mismatch fail closed rather than being
reclassified as mathematical UNKNOWN.

## Artifact custody and limits

Every input is opened relative to an already-open descriptor-root directory.
Every directory component and file uses no-follow descriptor operations. Input
paths must be canonical and relative; symlinks and non-regular files are
rejected. A file's device, inode, mode, link count, size, and timestamps must be
stable across capture.

Artifacts are first written into a private mode-`0700` staging directory below
an already-open, no-follow parent descriptor. Each artifact uses
descriptor-relative `O_EXCL | O_NOFOLLOW` creation with mode `0400`, a bounded
complete write, `fsync`, and a post-write size check. Success atomically renames
the staging directory to the requested previously absent name with platform
no-replace semantics, fsyncs the parent, and reopens the installed directory to
verify its device/inode identity. Failure removes the private staging files and
renames the held staging directory away from its reserved name, so a clean retry
may use the same requested output path. The directory itself is retained as the
bounded fail-closed tombstone described below. A concurrent entry at the final
name is preserved and causes failure; parent-path replacement cannot redirect
held-descriptor writes and is rejected by parent identity checks immediately
before and after installation.

Cleanup never trusts the remembered staging or final name. It scans only below
the held parent descriptor for the held staging device/inode, atomically moves
that identity to a fresh no-replace `.piqd-smt-tombstone-<uuid>` name, and
reopens that name to verify the same identity before child cleanup. A move
between the descriptor scan and a no-replace rename that has not succeeded
produces a rescan, never a fallback deletion through the stale name. The first
successful tombstone rename consumes the invocation's sole tombstone budget.
If a concurrent rename then substitutes a different directory at that name or
moves the held staging identity again, cleanup preserves both objects wherever
they now reside and aborts fail-closed; it neither tries to restore through a
name nor allocates another tombstone. Children are removed with
descriptor-relative `unlinkat` semantics:
regular files, symlinks, FIFOs, and sockets are unlinked without following a
target. A child directory or a directory rebound during child removal is
preserved and cleanup fails closed rather than recursively crossing an
attacker-controlled boundary. Publication also rejects any non-regular staging
entry and rejects a staging inode moved away from its reserved name.

V1 issues no final name-based `rmdir`. The supported POSIX interfaces provide
neither directory removal by an already-open capability nor an atomic
"remove only this device/inode" condition; `stat` followed by `rmdir(name)`
would therefore reopen the same-user rename/rebind window. After confirming the
held identity still occupies its tombstone name, V1 fsyncs the held directory
and parent and preserves the tombstone. On an ordinary failed run it is empty;
if a hostile child directory was encountered, that object remains inside it.
There is at most one bounded tombstone per failed invocation, it never occupies
the requested final output name, and tombstone garbage collection is outside
this adapter contract and requires a separately trusted, quiescent process.

The output contains:

```text
descriptor.json                 exact input descriptor bytes
original.smt2                   exact original source SMT2 bytes
journal.smt2                    normalized PIQD state journal
source-NNNN-HASH.bin            exact authenticated producer source bytes
source-manifest.json            canonical producer/source/semantic manifest
z3.session.json                 exact validated create response
z3.smt2                         exact GET /smt2 bytes
z3.receipts-before.json         exact empty pre-solve receipts envelope
z3.solve.json                   exact validated solve response, when received
z3.reconciled-solve.json        receipt-derived solve after response loss
z3.receipts.json                exact validated receipts envelope
z3.semantic.json                SAT verifier record, when applicable
z3.closed-session.json          exact validated close response
cvc5.*                          corresponding fresh cvc5 artifacts
result.json                     canonical adapter result
```

V1 bounds descriptor, individual source, aggregate source, original SMT2,
command count, SMT nesting, JSON depth/node count, API export, and output
artifact and aggregate output-tree sizes before trusting or installing them.

## Scope status

This adapter does not modify the Lean proof frontier. Proof-blueprint session
`019fdf9c` remains unchanged, open, and off-spine with respect to this work.
