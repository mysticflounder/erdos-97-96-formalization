# P97 PIQD incremental discovery adapter v1

Status: implementation specification. This is a producer-neutral discovery
adapter, not a proof, source, or theorem-closure contract. The proof-blueprint
session `019fdf9c` remains open and off-spine.

## Boundary and identity

`DiscoveryDescriptor` accepts exact raw ASCII DIMACS bytes, canonical strict
JSON producer/source manifests, a non-empty solver name, the CaDiCaL SAT lane,
and the exact producer `job_id` owning the seed. The seed must declare a
positive variable universe and at least one clause; zero-variable, clause-free,
and vacuous sessions fail closed. An empty clause is allowed and is handled as
an explicit UNSAT case.

The descriptor computes the lower-case 64-hex seed SHA-256 and a descriptor
root over schema, backend/profile, solver, project, producer job ID, seed hash,
and manifest hashes. JSON rejects duplicate keys, NaN/Infinity, non-builtin
types, non-canonical bytes, and non-canonical UUID/hex spellings. All local
events and returned results retain this root and producer identity.

Seed custody is exact and job-scoped: first fetch
`GET /jobs/:producer_job_id/blobs/:seed_blob_hash`, then compare both returned
bytes and SHA-256 to the descriptor. The bare `/blobs/:hash` route is never
used. `GET /sessions/:id/cnf` is reserved for logical clause-frontier replay;
its re-laid-out bytes never replace the producer blob identity.

## Rooted custody and journal

The receipt path is required to be an absolute normalized path below an
explicit custody root. Every path component is opened with no-follow flags;
components must remain directories and the captured CNF/journal object must be
a single regular file with link count one, owned by the current user and with
no group/world permission bits. Reads are bounded to 64 MiB and compare
device/inode/size/timestamps/link count before and after capture. Journal
creation uses exclusive create, mode `0600`, and fsync, so a fresh session
refuses any preexisting journal. Appends are O_APPEND, bounded, fsynced, and
checked for post-write identity/size changes.

The JSONL journal is dense and self-authenticating. Each event contains the
schema, zero-based sequence, prior event hash, event hash, session/job/root,
frontier count/hash, and `learned_state: "not_claimed"`. The event hash covers
the canonical unsigned event. `open` binds seed hashes; `append` binds the
ordered clause suffix and prior frontier hash; `solve` binds the exact receipt,
result hash, model, and false `proof_verified`/`closure_claim`; `revive` binds
the restored state. Replay rejects duplicate/gapped events, changed frontier,
new variables, malformed clauses, altered receipts, arbitrary state, and any
proof/closure/learned-state claim. Learned solver state is never claimed to
survive restart.

Revival treats the daemon as authoritative but never resends an operation.
When the local authenticated journal is a strict prefix, the exact exported
`GET /sessions/:id/cnf` clause suffix is recorded as one repaired append event,
and the complete receipt list is reconciled against the local prefix. A lost
append response therefore repairs from the ordered CNF. A lost solve/local
write can repair a new `UNSAT` or `UNKNOWN` receipt from the current receipt
surface. A `SAT` receipt is repairable only when the current live-session
descriptor has `last_status == "SAT"` and the receipt is the current
`last_solve_index`, then the live model surface supplies the exact total model.
The adapter never calls `/model` merely because a historical receipt says
`SAT`: if current `last_status` is anything else, recovery fails closed
without probing the route. Detached or unavailable model recovery fails closed
because a receipt alone does not expose that model. A receipt
whose base frontier is historical rather than the current logical frontier is
likewise rejected because this API has no historical frontier field. These are
explicit missing-field failures, not guesses.

## Session and solve contract

Creation requires the current PIQD session schema and SAT lane: session ID,
state, solver name/hash/signature, protocol, journal path, timestamps, clause
and variable counts, solve counters, and last-solve fields. The session is
required to agree with the descriptor seed universe and, on revival, with the
reconstructed frontier and solve count. Closed sessions cannot be revived.

Clause append posts an ordered `clauses` list to
`POST /sessions/:id/clauses`, rejects zero literals/new variables, checks the
acknowledged count/max variable, exports the session CNF, and verifies the
ordered frontier hash.

Solve posts `assumptions: []` and `include_model: true`, with optional
non-negative `timeout_ms` and positive `conflict_limit`. Only `SAT`, `UNSAT`,
and `UNKNOWN` are accepted. SAT requires a total signed model over every
current variable and local formula replay. This lane always sends
`assumptions: []`, so UNSAT accepts only an empty core and exact
`terminal_unsat: true`, derived from that empty core; nonempty cores are
impossible-protocol responses. UNKNOWN has no model/core/terminal claim.
Results without a total model, malformed cores, unexpected interruption
fields, or contradictory terminal fields fail closed.

Receipts use the current 17-field schema: nine ordinary fields (solve index,
base clause count/bytes/hash, assumptions, status, model-recorded flag, result
hash, timestamp), optional timeout/conflict/interruption/core fields, and the
four all-or-none batch fields `batch_key`, `batch_position`, `batch_size`, and
`batch_request_sha256`. Base hash/bytes, assumptions, request budgets, status,
model/core/interruption, model-recorded flag, and solve index are cross-checked
against the response and current frontier. PIQD `base_bytes` and
`base_sha256` bind the exact headerless session journal bytes (`journal.rs`),
not the exported DIMACS bytes: the latter additionally contain the `p cnf`
line. The adapter retains the exact exported-CNF identity separately and
derives the canonical journal body from its ordered clauses. Receipt lists
must be complete and dense.

The result digest follows PIQD's SAT contract (maintainer answer #4401 and
`src/session/receipts.rs`): SHA-256 of

```text
piqd-solve-result/v1
status=<status>
interrupted_by=<empty bytes when absent>
core=<- when absent; empty bytes when present-empty; otherwise abs/signed sorted decimal literals joined by spaces>
model=<- when absent; otherwise abs/signed sorted decimal literals joined by spaces>
```

Thus absent `interrupted_by` is never encoded as `-`; `-` is reserved for an
absent core or model. A present-empty core is distinct from an absent core.

The response hash must equal the receipt hash at the same `solve_index`; the
adapter also recomputes this digest independently as a fail-closed consistency
check. This SAT formula is not shared with SMT or batch-request digests.

## Callable boundary and claims

`PiqdIncrementalDiscoveryRunner(cnf_path, timeout_s, proof_path)` accepts an
authenticated CNF equal to the current frontier plus an ordered suffix,
appends that suffix, and solves with `timeout_s * 1000`. A non-null proof path
is rejected. The frozen output is status, assignment, solve index, result hash,
receipt, and frontier identity; all proof/source/closure booleans remain false.

Current PIQD APIs suffice for producer blob retrieval, SAT session creation,
CNF export, ordered append, assumption-free solve/model, receipts, status, and
delete. A close that is proven successful (including current-contract 404) is
never retried; a transport or malformed-response outcome is explicitly
uncertain, reconciled with GET session state, and retried only as the
idempotent DELETE requires. If session creation returns a strict UUID but
fails later validation, cleanup follows the same uncertain-close contract.
Adapter obligations not supplied as first-class PIQD data are strict
descriptor-rooted local custody, raw producer/source identity, local journal
authentication, restart/revive rebinding, total-model replay, and the
fail-closed no-proof boundary. The current PIQD model route has a separately
tracked non-SAT safety bug (#4428); v1 avoids it with the current-session
`last_status == "SAT"` gate above. This is a PIQD core bug, not an adapter
contract gap. Any future first-class attestation or proof handoff is a
maintainer feature, not assumed by v1.
