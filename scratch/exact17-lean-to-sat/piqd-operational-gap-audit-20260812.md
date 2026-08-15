# PIQD exact17 operational-control gap audit

Date: 2026-08-12  
Scope: read-only source audit of the exact17 wrapper and its raw-DIMACS PIQD
control path.  No daemon, solver, build, or git operation was run.  PIQD
source inspected from `/Users/adam/projects/rustprojects/piqd`.

The findings below are additional to the already-tracked model parser/range
and header-allocation issues, stale `model_checks` after retry, missing
model/log/run digests, crash gap, fail-open solver-exit/transcript handling,
and stale proof pointers.

## Findings

### HIGH — no daemon identity or endpoint attestation

`phase3_piqd_exact17_runner.py:1322-1338` accepts an arbitrary `--base-url`
(defaulting only to `http://127.0.0.1:7272`) and constructs a client without a
version/identity exchange.  The client protocol in
`phase3_piqd_exact17_runner.py:154-166` has no `version` or `solvers` operation;
`phase3_piqd_oracle.py:420-457` likewise only stores and concatenates the URL.
PIQD exposes daemon identity and binary SHA at `/version`
(`piqd/src/http/mod.rs:69-72`, `piqd/src/http/solvers.rs:68-86`), but exact17
never calls it or records it.  The receipt's explicit `daemon_attestation`
claim is false (`phase3_piqd_exact17_runner.py:470-484`), so this is an
unfulfilled operational acceptance condition rather than a false positive.

There is also no authentication/endpoint binding in the client or router
(`phase3_piqd_oracle.py:441-452`; `piqd/src/http/mod.rs:69-174`).  A daemon
speaking the expected unauthenticated HTTP shape can therefore mint the
status/artifact evidence consumed by exact17, without its build or protocol
identity being bound to the receipt.

### HIGH — backend/profile are not attested across the lifecycle

The PIQD prepare handler validates and stores `meta.backend` and
`meta.solver_profile` (`piqd/src/http/prepare_cnf.rs:157-199`, `315-352`), but
the prepare response contains neither field (`piqd/src/http/prepare_cnf.rs:104-123`,
`364-373`).  The Python oracle fills `PreparedJob.backend` and
`PreparedJob.solver_profile` from its own request rather than response data
(`phase3_piqd_oracle.py:577-629`); the strict exact17 check therefore only
checks locally supplied values (`phase3_piqd_exact17_runner.py:580-592`).

Terminal status does return `backend` but not `solver_profile`
(`piqd/src/http/status.rs:21-29`, `179-203`), and the strict status check only
binds the response by job id and process/core attestation
(`phase3_piqd_exact17_runner.py:607-640`).  It does not check status identity
hash, CNF hash, backend, or profile against the prepared identity.  Thus the
receipt can say `cadical`/`sat` based on the request while the daemon's
response stream is not independently bound to that backend/profile.  This is
distinct from solver transcript handling: it is a missing request/response
contract field and cross-check.

### HIGH — concurrent confirm can requeue a running job

`piqd/src/http/confirm.rs:28-35` reads and checks `status == 'prepared'`, then
verifies the blob, and finally calls `set_confirmed`
(`piqd/src/http/confirm.rs:58-70`).  The SQL implementation is unconditional
on status (`piqd/src/db/jobs.rs:116-126`):

```sql
UPDATE jobs SET status='confirmed', blob_hash=?, confirmed_at=? WHERE id=?
```

Consequently, request A can observe `prepared`; the runner can claim the row
(`piqd/src/db/jobs.rs:215-228`) and set it to `running`; then request B, which
also observed the earlier `prepared` state, can overwrite `running` back to
`confirmed`.  The worker can subsequently claim the same job again while the
first solver is still live.  The data-dir lock prevents two daemons from
sharing a database, but does not prevent this same-daemon HTTP/worker race
(`piqd/src/data_dir_lock.rs:1-20`).  Exact17 uses one confirm attempt itself,
but the daemon endpoint is reusable and this race is not represented in its
retry/recheck contract.

### HIGH — poll timeout leaves live work with no cancel/recheck transition

The exact17 policy allows 300 polls (`phase3_piqd_exact17_runner.py:1248-1258`)
and the generic driver, on exhaustion, records `POLL_TIMEOUT` and returns
without changing or cancelling the PIQD job (`phase3_piqd_driver.py:829-854`).
PIQD's job routes include prepare, confirm, status, log, CNF, model, model
check, proof, and blobs, but no job cancel/abort route
(`piqd/src/http/mod.rs:123-163`).  The receipt can consequently terminate with
`ERROR` while the daemon job remains `confirmed`/`running` and may later
complete; a subsequent exact17 retry deduplicates to that same identity but
has no operation to abandon, recheck-and-reconcile, or safely restart it.
This leaves an unresolved live writer/result after the wrapper has declared
the attempt finished, independent of the known crash gap.

### MEDIUM — exact17 does not verify daemon-retained producer manifest bytes

The daemon stores the exact uploaded manifest bytes by hash
(`piqd/src/http/prepare_cnf.rs:271-311`) and exposes both the manifest hash and
blob address in status (`piqd/src/http/status.rs:112-142`, `175-183`).  The
exact17 oracle verifies the daemon's CNF bytes before confirm
(`phase3_piqd_oracle.py:668-680`) but has no corresponding manifest retrieval
operation; its status method only checks the job id
(`phase3_piqd_oracle.py:660-666`).  The immutable receipt therefore proves
local producer bytes, but does not prove that the daemon retained and serves
the same manifest bytes that were used in its identity.

### MEDIUM — duplicate/unknown multipart parts are silently accepted

The raw-DIMACS handler overwrites prior `cnf`, `meta`, or `manifest` fields
and ignores every unknown multipart part (`piqd/src/http/prepare_cnf.rs:129-148`).
There is no uniqueness or exact-part-set check.  A duplicated field therefore
has last-wins semantics while the client and manifest identity describe only
the bytes it intended to send.  Exact17 emits one canonical part of each kind
(`phase3_piqd_oracle.py:557-567`), but the daemon endpoint has no fail-closed
request-schema contract if a proxy, caller, or future wrapper supplies a
duplicate or typo part.

## Positive controls observed

The exact17 path does byte-compare the daemon CNF before confirm
(`phase3_piqd_oracle.py:668-680`), restricts its requested core limit to one
and checks terminal process attestation (`phase3_piqd_exact17_runner.py:572-640`),
and PIQD uses an advisory data-directory lock plus atomic running-job recovery
(`piqd/src/data_dir_lock.rs:1-20`, `piqd/src/main.rs:101-120`).  These controls
do not close the lifecycle gaps above.
