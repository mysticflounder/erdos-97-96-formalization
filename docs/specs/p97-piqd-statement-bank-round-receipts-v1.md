# P97 PIQD statement-bank round receipts v1

`phase3_piqd_statement_bank_round_receipts.py` is the authentication bridge
from the live PIQD batch endpoint to the P97 minimality interpreter. It does
not run PIQD, authenticate the daemon or solver, or make a global, cardinality,
source, or Lean claim.

## Inputs

The adapter accepts an exact `SelectorPlan`, an already validated
`MinimalityRoundPlan`, the JSON object returned by
`POST /sessions/:id/batch-solve`, the complete durable receipts response, and
an exact `AuthenticatedJournalSnapshot`. A subclass of either typed plan or
snapshot is rejected. The plan's document hash is checked independently of its
property, so an overridden `plan_sha256` cannot spoof the authentication
binding.

The batch response has exactly these top-level fields:

```text
session_id, batch_key, batch_size, batch_request_sha256, replayed, executed,
stopped_by_guard, complete, records
```

Each response record has the durable fields `batch_position`, `solve_index`,
`status`, `assumptions`, `conflict_limit`, `base_clauses`, `base_bytes`,
`base_sha256`, `result_sha256`, and `at`; it may additionally contain
`interrupted_by`, `core`, and `terminal_unsat`. The adapter independently
checks exact JSON scalar types, canonical literals, UUIDs, SHA-256 strings,
status coherence, positive conflict limits, conflict-limit-only `UNKNOWN`,
and dense response positions.

## Request and durable binding

The expected batch contains exactly the baseline followed by every active
leave-one-group-out query in the round's canonical order. Its request guard is
`UNSAT`, and all queries use one positive conflict limit. The adapter
recomputes PIQD's `piqd-batch-request/v1` digest over the guard, query count,
canonical assumptions, and uniform limit; a daemon-provided digest is not
accepted merely because it is well typed.

The selected durable receipts must have the same batch key, size, request
digest, dense positions, and exact solve indexes as the response records.
Their assumptions, statuses, budgets, cores, timestamps, result hashes, and
journal-base fields must agree byte-for-byte/field-for-field with the batch
response. Returned typed receipt evidence retains these bindings and the
checked `model_recorded=false` and `timeout_ms=null` fields. Models and
wall-clock timeouts are refused. Unrelated receipts may
remain in the full response, but extra receipts carrying this batch key are a
failure.

The journal snapshot is rehashed. Its exact prefix must equal the plan's
PIQD DIMACS rendering, with the exact clause count, byte count, and SHA-256
claimed by every selected receipt. An append-only suffix is allowed; a short,
torn, differently rendered, or semantically substituted base is rejected.

## Exact sum of outcomes

The function returns one of two frozen types:

1. `AuthenticatedCompleteRound`: the response is dense at positions
   `0..batch_size-1`, has no guard stop, and has exactly one selected receipt
   for every round query. It retains every selected typed receipt and an
   `AuthenticatedCompleteRoundVerdicts` value. The caller may pass that value
   to `minimality.interpret_complete_round`; the adapter does not interpret it.
2. `AuthenticatedGuardedBaseline`: the response is explicitly
   `complete=true, stopped_by_guard=true`, has exactly one durable and response
   record at position 0, and that baseline is `SAT` or `UNKNOWN`. Its status is
   `INCONCLUSIVE`; it retains only the authenticated baseline evidence and has
   no omission verdicts. It cannot authorize deletion or be passed as a
   complete round. The empty-active-set round is the deliberate one-record
   exception: its dense batch has one baseline query but no guard, so it is
   returned as a complete typed round; the minimality interpreter may still
   classify a SAT/UNKNOWN baseline as `INCONCLUSIVE`.

Daemon `complete=true` alone is never enough. A guard stop after `UNSAT`, a
partial/non-dense batch, a full batch marked as guard-stopped, a missing or
extra member, a reordered member, or any response/receipt inconsistency fails
closed. In particular, a one-record `complete=true` response for a nonempty
active set is accepted only when the baseline guard semantics and durable
position-0 custody prove the distinct inconclusive outcome.

## Required canaries

Focused tests cover a dense three-query mapping, retained round evidence,
duplicate-group two-round deletion, vacuous SAT guard handling, partial and
reordered records, durable/response disagreement, guard-after-UNSAT rejection,
and plan-subclass hash spoofing. A live canary should additionally verify a
fresh session's dense `UNSAT/SAT/UNSAT` batch and a guard-stopped baseline with
exact replay and unchanged durable solve counts. These remain observational
receipt claims; they are not proof closure.
