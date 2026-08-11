# Projected-static-v3 PIQD production qualification v1

Status: strict additive discovery qualification. This leaves proof-blueprint
session `019fdf9c` unchanged, open, and off-spine. It establishes no verified
UNSAT proof, global obstruction, theorem coverage, universal lift, or Lean
closure.

## Production identity

The production schema is hard-coded to the historical frontier at commit
`942ba5770a847b9b253916191c9f1bfb3c8946c2`:

- `base.cnf`: SHA-256
  `c9c302d28ef5571f82f802c03f3a487576c648768d948e6d48a0c6da36ae8e18`,
  1,194 variables and 58,319 clauses;
- historical current CNF: SHA-256
  `b36b25731a5475d32afc74d13950e388fad68183d388704fd3ad311ba925e5d5`,
  1,194 variables and 71,856 clauses;
- exact ordered suffix: 13,537 clauses and 878,534 bytes, SHA-256
  `0b5b08dcfe5ec09ed1ce3b948ebf41c59c26a92c6183ca1acbca58cf76c353a8`;
- source manifest SHA-256
  `986e1204d820061c5173604ec5ced25beed6a3e94ea69935283ee8a1e9ba8628`,
  producer manifest SHA-256
  `74ddf30ef786b9102b34fda4ecf6ed48ea1334ce877a063f54dfaa238197cded`,
  variable-map SHA-256
  `e5f7801c91152dd27a201c7014ae801b8036551e770092ae9419f03321c81802`,
  and raw-DIMACS producer identity
  `62faf51e4d6b4c926bb0e21675245d51788809f663a6e50395fcb2f94fcce8cf`.

The producer and wave IDs are the canonical historical v1 identities. There
is no retry nonce. `PreparedJob.existing` must be an exact builtin Boolean,
but either value is valid after the complete identity, job-bound CNF, and
completed SAT attestation checks. Evidence records `fresh` for false and
`reused` for true without making a stronger custody claim. In particular, the
authenticated historical job `a6282cd3-16d9-4983-9092-f142b608aaf2` is a
valid reused producer for these exact bytes.

Provenance is a three-file historical bundle, not a single source file:

- `census/p97_search/phase3_structural_cegar_projected_static_v3.py`:
  `a57d2c9b2f45617a068d231cf300c49c36b623908836c05e1f9dffcc7f616e08`;
- `census/p97_search/phase3_three_rhombus_prefix_bank.py`:
  `6626aaad7b03bc7ac2336fbe313b0578bd248a3d8a25475330b44496359320f9`;
- `census/p97_search/sat_generate.py`:
  `5a32d21476ca47945cf5be41cbf07fe4fe831fd91a88be7326bb3138df38d817`.

All three exact byte snapshots must be supplied to `prepare_qualification`.
The current checkout is not a substitute. Synthetic profiles exist only via
`prepare_test_qualification`; that entry point emits a disjoint test-only
schema which the production validator rejects.

## Two-phase call sequence

Before preparation, the launcher authenticates the exact `PreparedJob`
returned by `POST /jobs/prepare-cnf`, including its exact builtin `existing`
value, confirms it, and polls with a fixed bound until the producer status is
exactly `completed` with SAT, one-core, one-process, and basis evidence.
Preparation treats the prepare response as the authority for blob hash, raw
identity, backend, profile, dimensions, and core request. It performs
`GET /version` first, retrieves `GET /jobs/{id}`, retrieves the exact
job-bound bytes from `GET /jobs/{id}/cnf`, and then retrieves `/solvers`.
Any `cnf_blob_hash` or `identity_hash` later exposed by job status must be
lowercase 64-hex and equal the prepare authority. The adapter does not assume
those future fields are absent.

The job status requires and type-checks all 18 stable fields and the known
optional `progress`, `log_tail`, and `log_size_bytes` fields when present.
Forward additions are archived but never used for custody: at most 16 unknown
ASCII field names of at most 64 bytes each are permitted, and the complete
canonical status is bounded to 64 KiB. Preparation archives separate
canonical prepare and completed-status evidence, creates the private preflight
custody directory, and deliberately does not create `qualification.json`.

The caller then performs exactly this session sequence through
`contract.transport`:

1. create one session with the exact solver name, SHA-256, signature, and
   producer job UUID;
2. append the historical suffix and solve the historical current frontier;
   the result must be SAT with a total replayable model;
3. append the exact singleton clause `(91,)` and solve again; the result must
   be assumption-free UNSAT with an empty core;
4. close that exact session once (a GET observing `state=closed` may recover a
   lost DELETE response);
5. call `finalize_qualification(contract)`.

Transport response bounds are artifact-class and path sensitive. JSON,
control, model, and receipt responses remain capped at 1 MiB. A 256 MiB cap is
available only to `GET /jobs/{producer_job_id}/blobs/{base_sha256}`, where both
path values equal the authenticated qualification contract, and to
`GET /sessions/{session_id}/cnf`, where the session UUID has already been
authenticated by the exact create response. The former is therefore the
submitted CNF blob, not an arbitrary model or proof blob sharing the job blob
endpoint. All near-miss paths retain the 1 MiB cap. Exact `HttpResponse`,
builtin status, byte body, string-map headers, endpoint status, and downstream
digest/frontier validation remain mandatory. The 256 MiB value is the PIQD
accepted-CNF ceiling; it is not asserted as a bound for solver-produced proof
artifacts. A direct test-only wrapper without both producer bindings remains at
the control cap and cannot obtain the job-CNF allowance.

The narrow production wiring is: call `prepare_qualification(...)`; pass
`qualified_transport(contract)`, `contract.solver_sha256`,
`contract.solver_signature`, and `contract.identity_evidence_path` to the v3
runner; call that one runner first on the historical current `.solver.cnf`;
extend that DIMACS frontier by only the singleton clause `(91,)` (including
the corresponding header increment) and call the same runner again; call
`runner.close()`; then call `finalize_qualification(contract)`. No caller may
construct a second transport between these phases. The qualification packet
does not exist until the last call succeeds.

Session creation and DELETE close responses have exactly the 19 stable session
fields. A non-creation GET status may additionally carry `solver_stats`, but
only for a live SAT session. Its six-field shape is attributed to, and accepted
only under, exact worker name `piqd-satworker-cadical-3.0.0`, executable SHA-256
`0ee355934249f1b3f14a20928877391a87a0dd51326cf8c6135f75cba0b6b965`,
and signature `cadical-3.0.0`; it is not a PIQD daemon/Rust API attestation.
The exact fields are `vars`, `active`, `irredundant`, `clauses_added`, `solves`,
and `solve_ms_total`, each an exact nonnegative builtin integer.
`clauses_added` is worker telemetry and is not equated with seeded clauses.
Presence is optional and absence conveys no information. The packet records
this pinned-worker attribution and gate. The wrapper returns the original
bounded `HttpResponse`; it does not rewrite the live response bytes.

Finalization refuses to run before close. It recaptures every external source
and CNF input, then performs the post-session `GET /version`. The complete
canonical pre/post objects must be byte-identical, including
`limits.max_var=1000000`; matching executable hashes alone are insufficient.
Only after validating the terminal CNF, journal, receipts, session row, and
close evidence does finalization create the canonical qualification packet,
and it creates that packet last.

UNKNOWN, an error, a third solve, a second session, identity drift, version
drift, or a different frontier has no local fallback and cannot finalize.

## Custody and validation

Custody is a create-once mode-0700 directory of singly linked mode-0600 regular
files. Reads and writes use no-follow descriptors, bounded lengths, canonical
builtin JSON, strict schemas, and end-of-validation root, listing, and byte
recapture checks. The sealed artifacts include both manifests, the three-file
historical source bundle, stable base, historical current, ordered suffix,
terminal `.solver.cnf`, authenticated producer prepare evidence, completed
producer status and job-bound CNF, full solver registry, exact pre/post version
objects, session identity, journal, close response, session result, and the
final packet.

The offline validator re-authenticates all source and producer bytes and
requires the base to be an exact ordered prefix. It reconstructs the suffix,
historical current, and terminal current-plus-`(91,)` frontiers. It validates
the five journal events in the only accepted order (`open`, historical append,
SAT solve, canary append, UNSAT solve), dense solve indices, event hash chain,
frontier hashes, headerless journal-prefix receipt hashes, result digests, and
all session/receipt/result crossbindings. The historical SAT model is replayed
as a total assignment against the exact historical current CNF.

PIQD defines terminal UNSAT as `UNSAT` with an empty core. Those durable journal
and receipt fields are sufficient for offline recomputation; raw POST response
archiving is optional diagnostic evidence, not a qualification requirement.
Assumption-free is checked separately from the receipt and closed session's
`last_assumption_free=true`. The final row must also report exactly two solves,
last solve index two, last status UNSAT, and `last_terminal_unsat=true`.

`requested_core_limit=1` and the one-process attestation belong only to the
producer JOB lane. Incremental sessions do not attest core limit, process
count, or CPU affinity, so every packet records all three session attestation
claims as false. `limits.max_var` is an observed session ceiling; raw prepare
does not enforce it.

Finally, PIQD UNSAT is discovery-only. A separate fresh local DRAT-producing
solve and local proof verification remain mandatory for terminal proof
closure. Every proof/global/theorem/Lean claim in this schema is exactly false.
