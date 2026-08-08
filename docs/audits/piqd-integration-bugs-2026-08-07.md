# piqd integration bug handoff — 2026-08-07

Audit status: updated through 2026-08-08; one confirmed daemon bug and two
source-audit candidates remain open.

This log records piqd defects found while implementing the P97
`p97-cegar-wave/v1` integration. It is a handoff for a separate piqd agent; it
does not track missing P97 features or desired piqd enhancements.

## Classification rule

A finding belongs here only when current piqd behavior violates its live API,
documented invariant, or internally required lifecycle semantics and has a
reproducible test. Contract gaps that piqd never promised to cover are listed
separately so they are not misfiled as bugs.

## Confirmed bugs

### PIQD-RAW-001: concurrent identical prepares can return HTTP 500

- **Snapshot:** piqd revision `fb52766a4cfd04c3092a6fdd827517846b265745`;
  the relevant files were clean during reproduction.
- **Endpoint/state:** `POST /jobs/prepare-cnf`, before the job reaches
  `prepared`.
- **Cause:** `piqd/src/http/prepare_cnf.rs` performs an unlocked existing-job
  lookup followed by an insert, while `piqd/src/db/jobs.rs` enforces a unique
  `input_hash` without an `ON CONFLICT` recovery path. Concurrent blob writes
  also share one fixed `.tmp` path in `piqd/src/blob.rs`.
- **Reproduction:** against a live daemon, submit 100 concurrent multipart
  requests with identical CNF, metadata, and a fresh producer manifest. Repeated
  runs returned 99 HTTP 200 responses and one JSON HTTP 500 response.
- **Expected:** all 100 requests return HTTP 200 with the same `job_id`; one has
  `existing=false`, 99 have `existing=true`; exactly one database row and one
  exact blob exist.
- **Observed:** one request loses the lookup/insert race and exposes the unique
  constraint failure as HTTP 500.
- **P97 impact:** a control-plane retry can be misclassified as an oracle error
  even though the immutable raw-DIMACS identity was accepted by a sibling
  request. The wave journal must preserve the failed attempt and may recover by
  re-preparing/re-reading; it must not silently discard it.
- **P97 containment now implemented:**
  `census/p97_search/phase3_piqd_driver.py` treats HTTP 500 as retryable but
  appends the exact failed `PREPARE` event before making the next request. The
  retry remains bounded and a journal append with uncertain durability stops
  the lifecycle immediately. This prevents evidence loss but does not repair
  the piqd race.
- **Regression test:** issue concurrent identical multipart submissions behind
  a barrier and assert the expected behavior above, including exact stored blob
  bytes.

## Candidate bugs requiring focused reproduction

### PIQD-RAW-002: unknown raw solver profiles silently run the default profile

`POST /jobs/prepare-cnf` accepts an arbitrary `solver_profile` string and folds
that string into the raw-DIMACS job identity. The current CaDiCaL runner,
however, handles only `sat`, `unsat`, and `plain` specially; every other value
silently takes the default command path. Two identities can therefore claim
different execution profiles while running the same solver configuration.

This is source-audit evidence, not yet a live HTTP reproduction. A focused
acceptance test should submit an unknown profile and establish one of these
contracts:

- the API rejects it with a client error; or
- the API normalizes it before computing and returning the identity.

The P97 adapter fails closed on the live supported profile set in the meantime.

### PIQD-SMT-001: stored SMT SAT models appear unreachable through the HTTP API

At the same snapshot, `piqd/src/runner.rs` stores `model_blob_hash` for SAT SMT
jobs, but `piqd/src/http/status.rs` does not serialize that hash,
`piqd/src/http/model.rs` rejects SMT while referring clients to it, and
`piqd/src/http/blobs.rs` does not recognize the model hash as a job-owned blob.

Proposed acceptance test: run a SAT Z3 or cvc5 job, obtain its stored model hash
from the database, and request both job status and `/jobs/:id/blobs/:hash`. The
public API should expose and serve the model; the source audit predicts that
status omits the hash and blob retrieval returns 404. This is outside the P97
raw-DIMACS adapter, so it was not reproduced during this integration slice.

## Contract gaps, not piqd bugs

- P97 needs immutable per-attempt history for retries, while the current piqd
  job record is an oracle job identity rather than the authoritative P97 wave
  journal.
- P97 must independently validate SAT models and require checked DRAT/LRAT
  before treating an UNSAT result as a publication candidate.
- P97 source-surface provenance, theorem names, universal lift, and Lean
  consumer evidence remain P97 responsibilities; piqd's producer manifest is
  intentionally opaque.
- `POST /jobs/confirm` is intentionally not retry-idempotent: a second confirm
  returns 409 after the first transition. The adapter must treat 409 as
  ambiguous and re-read status before classifying it as failure.
- Raw-DIMACS jobs have no reset/requeue path after `UNKNOWN` or `failed`;
  re-preparing the same identity returns the existing terminal job. This is a
  missing retry feature rather than a violation of the current API.

## Handoff format

Each confirmed entry must include:

1. live piqd revision or source snapshot;
2. affected endpoint and lifecycle state;
3. minimal reproduction;
4. expected and observed behavior;
5. impact on P97 result classification;
6. proposed regression test and acceptance condition.
