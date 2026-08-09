# P97 PIQD statement-bank receipts v1

Status: implemented strict adapter for PIQD-MIN-001 stage-1 SAT-session
receipts. The result is observational evidence relative to one supplied bank.
It is not a solver proof, source-entitlement proof, global-minimum proof, or
theorem closure.

## Boundary

`census/p97_search/phase3_piqd_statement_bank_receipts.py` accepts:

1. a generated and validated `SelectorPlan` from
   `phase3_piqd_statement_bank`;
2. the decoded response from `GET /sessions/:id/receipts`;
3. an `AuthenticatedJournalSnapshot` containing the expected session ID,
   authenticated journal bytes, and the expected SHA-256 of the complete
   snapshot;
4. one explicit baseline `solve_index`;
5. an exact `statement_id -> solve_index` map; and
6. the expected deterministic `conflict_limit`.

The main entry point is:

```python
adapt_authenticated_piqd_receipts(
    plan,
    receipts_response,
    journal_snapshot,
    baseline_solve_index=1,
    statement_solve_indexes={"A": 2, "B": 3},
    expected_conflict_limit=10_000,
)
```

The caller, not this module, authenticates custody of the journal snapshot and
the expected full-snapshot digest before constructing
`AuthenticatedJournalSnapshot`. The adapter rehashes those bytes. The type does
not assert that PIQD signed the bytes, that the response came over an
authenticated channel, or that a particular solver binary produced a verdict.

The adapter never reads `journal_path`, `receipts_path`, `~/.piqd`, or any other
ambient file. Paths in the response are checked only as stage-1 response
metadata. This keeps the evidence input explicit and makes fixtures replayable.

## Exact stage-1 response

The top-level response must have exactly:

```text
count, journal_path, receipts, receipts_path, session_id
```

`session_id` must be a canonical UUID and must equal the snapshot session ID.
Both paths must be nonempty strings. `count` must be a JSON integer (not a
Boolean), must equal the array length, and the receipt array must have ordered,
dense, unique `solve_index` values `1..count`.

Every receipt has these required fields:

```text
solve_index, base_clauses, base_bytes, base_sha256, assumptions,
status, model_recorded, result_sha256, at
```

Only these optional fields are accepted:

```text
conflict_limit, timeout_ms, interrupted_by, core
```

Unknown fields, missing required fields, present optional fields with null
values, Boolean-as-integer values, out-of-range values, or wrongly typed fields
fail closed. SHA-256 fields must be lowercase 64-hex. Assumptions
must be nonzero signed 32-bit literals, deduplicated, noncontradictory, and in
PIQD canonical order `(abs(literal), literal)`. A present core obeys the same
literal rules, must be a subset of the assumptions, and is required exactly for
`UNSAT`. A recorded model is allowed only for `SAT`; `interrupted_by` is allowed
only for `UNKNOWN`.

The only accepted statuses are `SAT`, `UNSAT`, and `UNKNOWN`.
`result_sha256` is treated as an opaque stage-1 64-hex identifier. The receipts
response does not carry a recorded model's literals, so it does not always carry
the inputs needed to reconstruct PIQD's result digest. This adapter therefore
does not selectively recompute the digest in easier cases.

All receipts in the response are schema-checked. Only the explicitly selected
baseline and omission receipts are used for interpretation; unrelated earlier
or later session solves may remain in the response.

## Query and budget binding

The statement selection map must be an ordinary dictionary whose keys equal the
plan's statement IDs exactly. Missing or extra IDs are rejected. Every selected
index must exist, and the baseline plus every statement index must be pairwise
distinct. The adapter then requires literal-for-literal equality between:

- the baseline receipt assumptions and `queries.baseline.assumptions`; and
- each selected omission receipt assumptions and the matching
  `queries.leave_one_group_out` entry.

Reordering an assumption list, swapping two selection bindings, selecting one
receipt twice, or selecting a receipt for a different query is an error.

Every selected receipt must record exactly `expected_conflict_limit`. Zero is a
valid deterministic limit. A selected receipt must omit `timeout_ms`; even a
well-typed wall timeout makes the observation non-reproducible and is rejected.
If a selected status is `UNKNOWN`, its `interrupted_by` value must be exactly
`conflict_limit`; cancellation and timeout observations are not deterministic
budget evidence.

## Exact journal-prefix binding

PIQD's SAT session journal is a DIMACS body with no `p cnf` header. Each clause
is rendered by writing every literal followed by one space, then `0` and a
newline. For example, the empty clause is `0\n` and `[1, -2]` is
`1 -2 0\n`.

For every receipt returned by the endpoint, the adapter rehashes its claimed
journal prefix, strictly parses the exact PIQD clause-line rendering, and checks
the parsed clause count against `base_clauses`. Thus an unselected record cannot
hide a malformed prefix inside an otherwise usable response.

All selected receipts must additionally agree exactly on `base_clauses`,
`base_bytes`, and `base_sha256`. Those values must equal the selector plan's
full gated clause list and its exact PIQD journal rendering. The adapter then:

1. checks that the authenticated snapshot contains at least `base_bytes`;
2. hashes exactly the first `base_bytes` and compares the digest with
   `base_sha256`;
3. strictly parses that prefix and compares the ordered clause tuples with the
   plan; and
4. compares the prefix bytes with the exact PIQD rendering.

An authenticated snapshot may contain a later append-only suffix. It is not
part of the selected solve base and does not affect interpretation.

This separately guards byte identity and clause semantics. A semantically equal
journal with alternate spacing is not accepted.

## Output and claims

`ReceiptAdapterResult.verdict_inputs` is the existing
`AuthenticatedVerdictInputs` public type. `interpretation` is produced only by
the existing `interpret_authenticated_verdicts` function, preserving its
baseline guard:

| Baseline | Omission | Label |
|---|---|---|
| `UNSAT` | `SAT` | `ESSENTIAL_RELATIVE_TO_SUPPLIED_BANK` |
| `UNSAT` | `UNSAT` | `REDUNDANT_RELATIVE_TO_SUPPLIED_BANK` |
| `UNSAT` | `UNKNOWN` | `INCONCLUSIVE` |
| `SAT` or `UNKNOWN` | any | `INCONCLUSIVE` |

The separate hashed `audit` record captures the selected indices, result-hash
identifiers, conflict limit, plan/session/journal/base bindings, and the policy
`OPAQUE_64_HEX_NOT_RECOMPUTED`. It explicitly records:

```json
{
  "daemon_attestation": false,
  "global_minimum": false,
  "incremental_unsat_proof": false,
  "observational_only": true,
  "solver_attestation": false,
  "source_entitlement": false,
  "theorem_closure": false
}
```

In particular, incremental `UNSAT` is only an observed status. It is not DRAT,
LRAT, a kernel-checked certificate, or any other proof object.

## Live-shape replay fixture

The tests use the semantics exercised by session
`60d64e0a-828d-4cc4-ab8d-eeea25429dfc` without reading that session or depending
on `~/.piqd`:

- source variable: `1`;
- base clause: `[1]`;
- statement A clause: `[-1]`, gated as `[-2, -1]`;
- statement B clause: `[1]`, gated as `[-3, 1]`;
- baseline assumptions `[2, 3]`: `UNSAT`;
- omit A assumptions `[-2, 3]`: `SAT`; and
- omit B assumptions `[2, -3]`: `UNSAT`.

The exact headerless journal fixture is 19 bytes:

```text
1 0
-2 -1 0
-3 1 0
```

Thus the interpretation labels A essential and B redundant only relative to
this supplied bank. The fixture includes no daemon-origin or solver
attestation, no proof trace, and no claim about the P97 source theorem bank.

## Adversarial coverage

Focused tests cover exact top-level and receipt shapes; JSON scalar types and
ranges; canonical, unique, noncontradictory assumptions; malformed optional
fields; status/core/model/interruption coherence; dense receipt numbering;
missing, extra, swapped, duplicated, and absent selection bindings; exact query
assumptions; deterministic conflict limits; wall-timeout refusal; cross-receipt
base agreement; plan base count/length/hash equality; full-snapshot and prefix
rehashing; truncated, tampered, and alternately rendered journals; opaque result
hashes; authenticated journal suffixes; and baseline-guarded interpretation.
