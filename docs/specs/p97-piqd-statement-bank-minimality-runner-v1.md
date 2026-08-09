# P97 PIQD statement-bank minimality runner v1

`phase3_piqd_statement_bank_minimality_runner.py` runs the deterministic
`SelectorPlan` inclusion-minimality procedure against PIQD's deployed SAT
session API. Its output is an observational custody record. It does not attest
the daemon or solver and makes no cardinality, global-minimum, source,
theorem-closure, or Lean claim.

The sole inclusion-minimality claim is the one in a terminal
`MinimalityRoundResult` produced by
`minimality.interpret_complete_round`: inclusion-minimal relative to the exact
supplied statement bank. Neither a per-round runner audit nor the campaign
audit repeats that claim.

## Public API and result types

`run_statement_bank_minimality_campaign` accepts an exact `SelectorPlan`, a
nonempty exact solver name, a positive 32-bit `conflict_limit`, and the same
HTTP/custody configuration used by the single-session runner. A transport can
be injected for testing; otherwise the strict standard-library JSON transport
is used. `run_minimality_campaign` is an alias.

The frozen `MinimalityCampaignResult` contains:

- the terminal control outcome, `INCLUSION_MINIMAL_RELATIVE_TO_SUPPLIED_BANK`
  or `INCONCLUSIVE`;
- a tuple of frozen `MinimalityRoundEvidence` records;
- the terminal `MinimalityRoundResult`, if a complete round was interpreted;
  and
- a canonical observational campaign audit.

Each round record retains the exact `MinimalityRoundPlan`, fresh session UUID,
deterministic canonical UUID batch key, typed round-receipt evidence, optional
minimality interpretation, and a canonical audit chained to the preceding
round audit hash. The campaign audit binds the ordered list of round audit
hashes and the terminal minimality-result hash. All audit claim flags are
false, including the inclusion-minimality flag. When there is a terminal
minimality result, the campaign audit records only the generic control outcome
`TERMINAL_MINIMALITY_RESULT`; it does not copy that result's status or claim.
Runner-owned round and campaign audits are recursively frozen after their
canonical hashes are computed: nested claim maps are read-only and ordered
hash collections are immutable tuples.

## One fresh closed session per adaptive round

For every round the runner performs exactly this exchange:

1. `POST /sessions` for a fresh `sat` session.
2. `POST /sessions/:id/clauses` with the selector plan's exact gated clauses.
3. `POST /sessions/:id/batch-solve` with the round baseline first and every
   active leave-one-group-out query afterward in canonical round order.
4. `DELETE /sessions/:id` exactly once to close the session.
5. `GET /sessions/:id/receipts` for the complete durable receipt journal.
6. Require `receipts_path` to be the expected session sibling, then open it
   below the configured PIQD root through component-by-component `O_NOFOLLOW`
   and read one stable regular-file snapshot. A missing file, symlink, non-file,
   oversized file, or concurrent mutation fails before adaptation.
7. Open the rooted CNF journal through the same `O_NOFOLLOW` stable-snapshot
   procedure and require its bytes to equal the exact uploaded DIMACS body.
8. Call
   `round_receipts.adapt_authenticated_minimality_round_receipts` to bind the
   batch response, all durable receipts, and journal snapshot to the plan and
   round.

This close-and-authenticate boundary occurs before any deletion decision. A
successor round therefore depends only on an immutable predecessor journal,
receipt set, adapter result, and `MinimalityRoundResult`; it never reuses a
live session.

The runner intentionally reuses private strict helpers from
`phase3_piqd_statement_bank_runner.py` for exact JSON scalar checks, session
schema validation, PIQD 32-bit preflight, rooted path custody, and stable
journal snapshots. It intentionally reuses the private batch parser from the
round-receipts adapter before close so the expected closed-session solve count
and last status are derived only from a strictly parsed response. This is
internal repository coupling, not a public cross-package API promise.

## Exact batch request

The batch key is a canonical UUIDv5 derived from the campaign schema, plan
SHA-256, and round SHA-256. The body has exactly three top-level fields:

```json
{
  "batch_key": "<canonical UUID>",
  "continue_after_first_only_if": "UNSAT",
  "queries": [
    {"assumptions": [10, -11], "conflict_limit": 10000}
  ]
}
```

Every query contains only `assumptions` and the same positive
`conflict_limit`. Batch mode omits `timeout_ms` and `include_model`; PIQD
rejects both fields on this route. The request contains at most 4096 queries.
The round-receipts adapter independently recomputes PIQD's
`piqd-batch-request/v1` digest over the guard, order, assumptions, and limits.

A fresh session must report a non-replayed batch, execute every returned
record, and use dense solve indexes starting at one. Its complete receipts
response must contain exactly those records; unrelated receipts are not
permitted in a session created for one round.

## Adaptive control and bounds

The initial round activates every group. A guarded `SAT` or `UNKNOWN` baseline
returns `AuthenticatedGuardedBaseline` and terminates the campaign
`INCONCLUSIVE`, even when the daemon reports `complete=true`; no deletion is
authorized.

A dense authenticated batch is passed to
`minimality.interpret_complete_round`:

- `DELETE_FIRST_REDUNDANT_AND_CONTINUE` builds the unique validated successor,
  checks that exactly one active group disappeared, and starts a fresh session;
- `INCLUSION_MINIMAL_RELATIVE_TO_SUPPLIED_BANK` terminates with that exact
  minimality result; and
- `INCONCLUSIVE` terminates without a deletion.

For `n` initial groups, the hard bound is `n + 1` rounds: at most `n` exact
deletions and one empty-active-set terminal check. An optional `max_rounds`
may lower but never exceed this bound. Reaching that limit after a deletion is
an error, not a silent inconclusive result. Round ordinals, predecessor hashes,
predecessor result status, active-group subsequences, and the one-deletion
measure are revalidated at every transition.

## Fail-closed and cleanup behavior

Exact built-in types are required for the plan, integral bounds, HTTP response
wrapper/status, UUIDs, paths, and all adapter inputs; Boolean, integer-subclass,
plan-subclass, and response-subclass spoofs are rejected. HTTP status errors,
missing or extra response fields, partial batches, a guard stop after `UNSAT`,
wrong query order, receipt disagreement, path substitution, symlink traversal,
journal append/substitution, and predecessor tampering all fail closed.

Once a strict session UUID is available, any failure before the close attempt
causes one best-effort `DELETE`. This includes a malformed HTTP 201 create body
that still carries a strict candidate UUID, a non-exact response subclass, or
an integer-subclass status equal to 201. Candidate extraction is deliberately
more permissive only for cleanup; normal response validation still rejects the
non-exact wrapper or status.
Once close has been attempted, no second delete is sent, even if the close
response, receipts, snapshot, or adapter later fails. Cleanup errors never
replace the original failure.

## Required tests

The fake-transport suite covers two-round first-redundant deletion followed by
supplied-bank inclusion-minimality; exact batch guard/order/fields; guarded
`SAT` and conflict-limit `UNKNOWN`; dense omission `UNKNOWN`; malformed,
partial, and guard-after-`UNSAT` batches; fresh sessions and exactly-once close;
cleanup after malformed 201 and mid-round HTTP failures; durable-receipt and
journal mismatches; missing and symlinked receipt files; deep audit
immutability; impossible low round bounds; and Boolean/integer/typed subclass
spoofs.
