# P97 PIQD statement-bank inclusion-minimality v1

## Scope

`census/p97_search/phase3_piqd_statement_bank_minimality.py` is a deterministic
round planner and interpreter over one already-authenticated
`phase3_piqd_statement_bank.SelectorPlan`.

It does not:

- call PIQD, HTTP, a daemon, or a solver;
- define or authenticate a receipt schema;
- attest a daemon or solver;
- emit a SAT model or an UNSAT proof;
- establish source entitlement or theorem closure; or
- claim a cardinality minimum or a global minimum.

The strongest possible output is
`INCLUSION_MINIMAL_RELATIVE_TO_SUPPLIED_BANK`. This means only that, in the
final retained subset of the supplied statement groups, the authenticated
baseline verdict is `UNSAT` and removing any one retained group has an
authenticated `SAT` verdict. For an empty retained subset, an authenticated
`UNSAT` baseline suffices.

The proof-blueprint anchor is unchanged. This layer is off-spine Python
bookkeeping and makes no Lean claim.

## Public API

The planner exposes:

```python
build_initial_round(plan) -> MinimalityRoundPlan
interpret_complete_round(plan, round_plan, verdicts) -> MinimalityRoundResult
build_next_round(plan, previous_round, previous_result) -> MinimalityRoundPlan
validate_round_plan(plan, round_plan) -> None
validate_round_result(plan, round_plan, result) -> None
```

The external authentication boundary is the exact frozen type
`AuthenticatedCompleteRoundVerdicts`. Its baseline is an
`AuthenticatedQueryVerdict`; its omission tuple contains
`AuthenticatedOmissionVerdict` values in canonical active-group order.
Constructing these values asserts that an external layer authenticated their
origin. This module still validates the plan hash, round hash, round ordinal,
completeness flag, query hashes, assumptions, statement IDs, tuple order, and
`SolverVerdict` types. It does not authenticate origin itself.

`MinimalityRoundResult` retains the exact
`AuthenticatedCompleteRoundVerdicts` object that authorized its document.
Result validation and successor construction revalidate that evidence and
recompute the decision from it. A copied result JSON document detached from
its typed authenticated evidence, or a document whose verdict strings and hash
were rewritten without matching authenticated evidence, fails closed.

## One immutable gated CNF

The input must be an exact `SelectorPlan`, not a subclass, and is validated by
the upstream strict validator. All rounds use the plan SHA-256 stored in its
validated canonical document together with its exact
`gated_cnf.dimacs_sha256` and selector allocation. No clause or selector is
rebuilt with a different numbering.

Let the canonical selector allocation be

```text
(A, s_A), (B, s_B), ..., (M, s_M).
```

For a current active set `R`, the baseline assumptions contain one literal for
every selector in canonical allocation order:

- `s_i` when group `i` is active; and
- `-s_i` when group `i` was deleted by an earlier round.

The leave-one-active-group-out query for active group `i` uses the same vector,
with only `s_i` negated. Deleted groups remain explicitly false. Thus every
query is against the same gated CNF and every selector has a fixed truth value.

Each query stores its full assumption vector and a deterministic SHA-256 of the
canonical JSON query body. The round stores all queries, current active
statement IDs and selectors, plan hash, gated-CNF hash, ordinal, both
predecessor hashes, and a deterministic round hash.

## Initial and successor rounds

Round zero activates every group in the selector plan and has null
`previous_round_sha256` and `previous_result_sha256`.

A successor may be built only from a validated result whose status is
`DELETE_FIRST_REDUNDANT_AND_CONTINUE`. It:

1. removes exactly the result's one selected group;
2. increments the round ordinal by one;
3. stores the exact previous round SHA-256; and
4. stores the exact previous result SHA-256.

The in-memory `MinimalityRoundPlan` also carries those exact predecessor
objects. Validation recursively checks the full chain, including every prior
deletion decision and active list. A later-round JSON document detached from
its predecessor objects is therefore not accepted merely because its hashes
are internally consistent.

An inconclusive or final result has no permitted successor.

## Complete-round decision rule

The interpreter accepts only a complete typed batch: one baseline verdict and
exactly one verdict for every active omission query. Missing, extra, reordered,
or differently bound verdicts fail closed.

For a complete round, apply these rules in order:

1. If the baseline is not `UNSAT`, return `INCONCLUSIVE`, delete nothing, and
   stop. This is the automatic vacuous-SAT guard.
2. If any omission is `UNSAT`, choose the first such group in canonical active
   order, delete exactly that group, and return
   `DELETE_FIRST_REDUNDANT_AND_CONTINUE`. A new round is mandatory before any
   minimality claim.
3. If no omission is `UNSAT` but any omission is `UNKNOWN`, return
   `INCONCLUSIVE`, delete nothing, and stop.
4. Otherwise, the baseline is `UNSAT` and every active omission is `SAT`.
   Return `INCLUSION_MINIMAL_RELATIVE_TO_SUPPLIED_BANK`.
5. If the active set is empty, the omission list is empty. An `UNSAT` baseline
   therefore satisfies rule 4.

An `UNKNOWN` earlier in canonical order does not mask a later `UNSAT`: rule 2
searches all omission verdicts and deletes the first `UNSAT` group.

## Why one full-bank LOO pass is insufficient

Take base clause `[1]` and two statement groups:

```text
A = {[-1]}
B = {[-1]}
```

With both groups active, the baseline is `UNSAT`. Omitting A is still `UNSAT`
because B remains, and omitting B is still `UNSAT` because A remains. A single
full-bank leave-one-out pass therefore labels both individually removable from
that full bank. Deleting both together would be wrong: the base `[1]` is `SAT`.

The deterministic round rule deletes only A, the first canonical `UNSAT`
omission. The next round keeps only B. Its baseline is `UNSAT`, while omitting
B is `SAT`, so the final retained bank is `{B}`. Replaying the same authenticated
verdicts produces identical round and result documents and hashes.

## Canonical form and fail-closed validation

Round and result hashes use the upstream canonical JSON function:

```python
json.dumps(value, sort_keys=True, separators=(",", ":"), allow_nan=False)
```

The hash field itself is excluded from the body it hashes. All stored hash
strings are lowercase 64-hex SHA-256 values.

Validators require exact object keys, exact list order, and exact JSON scalar
and container types. In the typed verdict seam, assumptions must be exact
tuples of exact integers. Python booleans are not accepted as integers for
ordinals, selectors, or assumption literals. A missing or extra field,
reordered active group or verdict, changed assumption, changed query hash,
changed plan/round/predecessor binding, or changed decision/result hash fails
closed.

`validate_round_plan` deterministically reconstructs all active-group and query
content from the selector plan. `validate_round_result` parses the recorded
verdicts and recomputes the entire decision and result document. Hash-only
acceptance is intentionally insufficient.

## Result claims

Every plan and every nonfinal result has this exact claim map:

```json
{"cardinality_minimum":false,"daemon_attestation":false,"global_minimum":false,"inclusion_minimal_relative_to_supplied_bank":false,"solver_attestation":false,"source_entitlement":false,"theorem_closure":false}
```

Only a final result changes
`inclusion_minimal_relative_to_supplied_bank` to `true`. Every other claim
remains `false`.

In particular, an authenticated `UNSAT` verdict here is an interpreted external
observation. It is not by itself a solver attestation, replayable UNSAT proof,
kernel proof, theorem closure, or entitlement to import a source theorem.

## Complexity boundary

For `m` supplied groups, one static round contains one baseline plus one query
per active group. At most one group is deleted per continuing round. If each
round is emitted and solved as a complete static batch, the worst-case number
of solve queries is

```text
(m + 1) + m + ... + 1 = (m + 1)(m + 2)/2 = O(m^2).
```

This obtains an inclusion-minimal retained subset under the deterministic
deletion order. It does not obtain a minimum-cardinality subset. Establishing
minimum cardinality generally requires opt-in enumeration or an equivalent
optimization procedure over subsets, with worst-case exponential work
`O(2^m)`, plus complete authenticated evidence for the relevant lower-cardinality
subsets. That is future work and is not inferred by this v1 layer.

## Verification

Focused checks:

```bash
uv run --with pytest python -m pytest -q \
  census/p97_search/tests/test_phase3_piqd_statement_bank_minimality.py
uvx ruff check \
  census/p97_search/phase3_piqd_statement_bank_minimality.py \
  census/p97_search/tests/test_phase3_piqd_statement_bank_minimality.py
uvx ruff format --check \
  census/p97_search/phase3_piqd_statement_bank_minimality.py \
  census/p97_search/tests/test_phase3_piqd_statement_bank_minimality.py
```
