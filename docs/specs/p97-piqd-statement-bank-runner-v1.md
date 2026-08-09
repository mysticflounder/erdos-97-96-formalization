# P97 PIQD statement-bank HTTP runner v1

Status: `OBSERVATIONAL_ONLY`

Implementation:
`census/p97_search/phase3_piqd_statement_bank_runner.py`.

This runner executes one already-validated
`phase3_piqd_statement_bank.SelectorPlan` against PIQD's SAT-session HTTP API.
It supplies transport evidence to the strict
`phase3_piqd_statement_bank_receipts` adapter; it does not strengthen that
adapter's claims.

## Required inputs

- A committed, canonical selector plan accepted by
  `validate_selector_plan`.
- An exact PIQD solver name.
- A positive, deterministic `conflict_limit`.
- Either the default loopback HTTP transport or an injected
  `JsonHttpTransport`.
- A positive finite HTTP request timeout and positive strict HTTP response-byte
  cap. Defaults are 300 seconds and 16 MiB, respectively.
- An explicit canonical PIQD data root beneath which the returned journal and
  receipt paths must live. If omitted, the runner uses the canonical spelling
  of `~/.piqd`; the root and all of its existing components must be real
  directories, not symlinks.
- A positive maximum number of journal bytes to authenticate. The default is
  256 MiB.

The runner never sends `timeout_ms`. Thus PIQD applies the requested conflict
limit without a solver wall-time limit. The separate positive HTTP request
timeout bounds client I/O; expiry or another transport/process failure is not
converted into a solver verdict. Success and HTTP-error bodies are both read in
bounded chunks, and a body larger than the configured cap fails closed.

Before creating a session, the runner checks that the gated CNF variable count,
every CNF literal, every allocated selector, and every query assumption fits
PIQD's signed-32-bit literal domain (excluding `i32::MIN` and zero literals).
An overflow therefore makes zero transport calls.

## Mandatory request sequence

The runner serializes its own requests in this order:

1. `POST /sessions` with lane `sat`, the exact solver name, and a deterministic
   plan-derived label unless the caller supplies one. The returned session must
   be fresh: zero clauses and zero solves.
2. Exactly one `POST /sessions/{id}/clauses`. Its clause array is exactly
   `plan.document["gated_cnf"]["clauses"]`. This occurs before any solve.
3. Exactly one baseline `POST /sessions/{id}/solve`, with the plan's exact
   baseline assumptions, `include_model: false`, and the exact conflict limit.
4. If and only if the baseline is `UNSAT`, one solve for every canonical
   `leave_one_group_out` query, sequentially in the selector plan's statement
   order. Every request uses that query's exact assumptions and the same
   budget.
5. `DELETE /sessions/{id}` to close and detach the live worker.
6. `GET /sessions/{id}/receipts` for the persisted closed-session receipts.
7. One authenticated journal snapshot, followed by strict receipt adaptation
   when the complete query family was run.

If the baseline is `SAT` or `UNKNOWN`, the runner makes no omission requests.
It still closes the session, retrieves and validates its one receipt, and
authenticates the journal. The explicit outcome is `BASELINE_NOT_UNSAT`, and
there is no adapter interpretation.

## Fail-closed response checks

HTTP status codes and JSON object keys must match the endpoint contract
exactly. Response reads are capped even for non-2xx errors. UUIDs, hashes, integral fields, solver statuses, optional
status-specific fields, session identity, immutable session metadata, clause
counts, maximum variable, solve counts, dense solve indexes, assumptions,
cores, interruption cause, conflict limit, and receipt/result hashes are all
checked. Redirects, duplicate JSON keys, non-finite JSON, embedded credentials,
non-origin base URLs, unexpected model material, response schema drift, and
session mismatches fail the run.

The journal and receipt paths must be canonical absolute paths below the
explicit configured PIQD data root. The journal must be
`<session UUID>/journal.cnf`; `receipts.jsonl` must be its sibling. The data
root is validated with a no-follow component walk before session creation, and
is reopened the same way for the snapshot. Every descendant component is then
opened relative to that root descriptor with `O_NOFOLLOW`, and the final
descriptor must be a regular file. Platforms without the required no-follow
directory primitives are rejected. The runner reads through that one
descriptor exactly once, enforces the byte cap, and compares device, inode,
mode, size, modification time, and change time before and after the read. It
then hashes the bytes and requires the complete file to equal the exact DIMACS
body produced by the single clause upload.

After a baseline `UNSAT`, the strict receipt adapter is called with an explicit
mapping: baseline solve index 1 and one exact solve index for each statement ID.
There is no inference from receipt order to statement identity.

For a `201` create response, the runner extracts a canonical UUID before doing
full schema validation. A malformed create response with such an ID therefore
gets exactly one best-effort `DELETE /sessions/{id}`. If no strict UUID exists,
the runner fails without guessing a cleanup target. A cleanup failure never
replaces the original error, and a failed response to a normal close is not
followed by a duplicate delete.

## Concurrency boundary

The runner serializes calls made by this runner instance. It cannot exclude a
different daemon client from mutating or solving the same session, and local
request ordering is not itself daemon-side mutual exclusion. The PIQD fixes
tracked as `#3836`, `#3837`, and `#3838` have been patched and deployed in the
current coordinated environment. This runner neither queries nor authenticates
that daemon version, however, so every result deliberately retains
`daemon_concurrent_actor_exclusion: false`. Journal and receipt equality checks
can detect many interferences, but they are not a concurrency or
process-attestation primitive.

## Claim boundary

The output is observational evidence tied to the supplied plan, session
metadata, HTTP responses, and locally read journal bytes. It does not attest
the daemon binary or solver binary. It does not establish source entitlement,
global statement minimality, an incremental UNSAT proof, a Lean proof, or
theorem closure. `SAT`, `UNSAT`, and `UNKNOWN` remain daemon-reported solver
outcomes. Any use of the resulting essential/redundant labels remains relative
to this exact statement bank and budget.

## Tests

The local fake transport persists a journal in pytest's temporary directory;
the suite requires neither a live daemon nor `~/.piqd`. It covers the complete
adapter path, exact request assumptions/order, `SAT` and `UNKNOWN` baseline
short-circuiting, malformed solve responses, unexpected solve indexes, session
mismatch, malformed-create cleanup, signed-32-bit preflight with zero HTTP
calls, finite HTTP timeout propagation, bounded success/error responses,
data-root custody, root and journal symlink rejection, size-cap enforcement,
unexpected journal suffixes, and in-read metadata changes.

Run:

```bash
PYTHONPATH=. uv run --with pytest pytest \
  census/p97_search/tests/test_phase3_piqd_statement_bank_runner.py
uv run ruff check \
  census/p97_search/phase3_piqd_statement_bank_runner.py \
  census/p97_search/tests/test_phase3_piqd_statement_bank_runner.py
uv run ruff format --check \
  census/p97_search/phase3_piqd_statement_bank_runner.py \
  census/p97_search/tests/test_phase3_piqd_statement_bank_runner.py
```
