# P97 PIQD statement-bank audit v1

Status: implemented finite-bank selector planning and result interpretation.
This stage is bookkeeping relative to one supplied clause bank. It is not a
global-minimum proof, a source-entitlement proof, or theorem closure.

## Purpose

`census/p97_search/phase3_piqd_statement_bank.py` builds one deterministic CNF
with a selector for every statement group. It emits an all-groups-active query
and one leave-one-group-out query per group. A later PIQD adapter may execute
those queries and authenticate its solve receipts. This module intentionally
does not define or guess that not-yet-landed receipt schema.

The construction is:

- source variables are `1..source_num_vars`;
- group `i` receives selector `s_i = source_num_vars + i + 1`;
- every clause `C` in group `i` is emitted, without deletion or normalization,
  as `[-s_i, *C]`;
- base clauses are emitted first and unchanged;
- the baseline assumptions are all positive selectors; and
- omission query `i` has exactly `-s_i`, with every other selector positive.

PIQD's raw-DIMACS ingress injects no assumptions. An executor must therefore
use an authenticated assumptions-capable session or materialize the assumption
units into a distinct CNF. That execution choice is outside this stage.

## Canonical input manifest

The only accepted schema is `p97-piqd-statement-bank/v1` with exactly these
keys:

```json
{"base_clauses":[[1],[1,-3]],"schema":"p97-piqd-statement-bank/v1","source_num_vars":3,"statement_groups":[{"clauses":[[2]],"statement_id":"S.01"}]}
```

The byte string must equal UTF-8 `json.dumps(value, sort_keys=True,
separators=(",", ":"), allow_nan=False)`. Thus whitespace, a trailing newline,
duplicate keys, NaN/infinity, and alternate key order are rejected rather than
normalized.

The remaining fail-closed rules are:

- `source_num_vars` is a nonnegative JSON integer, not a Boolean;
- `base_clauses` is nonempty;
- `statement_groups` is nonempty and sorted by `statement_id`;
- each group has exactly `statement_id` and `clauses`, and its clause list is
  nonempty;
- IDs are unique and match `[A-Za-z0-9][A-Za-z0-9._:-]{0,127}`;
- every literal is a nonzero JSON integer in the declared source-variable
  range;
- a clause contains neither repeated literals nor complementary literals;
- clause literals increase by variable index; and
- every clause collection is in that same lexicographic canonical order.

An empty clause is valid. A nonempty base CNF means at least one clause, not
that every clause has a literal. Exact duplicate clauses are also valid: they
can represent supplied immutable history and are diagnosed, not deleted.

`build_selector_plan` does not trust callers that bypass the JSON loader and
construct `StatementBank` or `StatementGroup` directly. At its public API
boundary it requires the exact frozen dataclass/container shapes, reconstructs
the sole canonical manifest bytes, strictly reparses all types, clauses,
nonempty rules, and sorted/unique IDs, and checks the supplied
`manifest_sha256`. Planning then uses only that reconstructed bank. It neither
uses loose dataclass equality nor emits from the caller's unchecked objects.

## Selector-plan artifact

The `p97-piqd-statement-selector-plan/v1` document contains:

- the exact source-manifest hash and semantic source-bank hashes;
- the selector allocated to each ordered statement ID;
- every base and selector-gated clause;
- canonical gated-clause and DIMACS hashes;
- the baseline and leave-one-group-out assumptions;
- a hash for every query; and
- a `plan_sha256` over the complete document except that self-hash field.

The DIMACS artifact has selector variables above every declared source
variable. Its hash is repeated in the plan. CLI output files are create-only:
an existing byte-identical artifact is accepted, while an existing different
artifact is never overwritten.

Example:

```bash
uv run python -m census.p97_search.phase3_piqd_statement_bank \
  bank.json --plan-output selector-plan.json --cnf-output selector-plan.cnf
```

With no `--plan-output`, canonical plan JSON is written to standard output.
The optional `--subsumption-pair-check-budget` controls only the diagnostic
scan described below. Its accepted range is `0..1000000`, and its value is
included in the hashed plan document.

## Syntactic diagnostics

Diagnostics always perform a complete exact-duplicate census, grouping each
duplicate single clause by all its source occurrences. This pass is not
pairwise and reports `status: COMPLETE`.

Strict set-inclusion diagnostics consider unordered pairs of unique clauses.
For `u` unique clauses, a complete scan requires exactly `u(u-1)/2` pair
checks. The plan records the configured budget, required and performed counts,
a `complete` Boolean, and a status:

- if the required count is at most the budget, every pair is checked and the
  result is `status: COMPLETE`, `complete: true`, with
  `performed_pair_checks == required_pair_checks`;
- if the required count exceeds the budget, no pair is checked and the result
  is `status: SKIPPED_RESOURCE_BOUND`, `complete: false`, with an empty `pairs`
  array and `performed_pair_checks: 0`.

The second case is deliberately all-or-nothing: no partial list can masquerade
as a complete subsumption census, and an empty `pairs` array under
`SKIPPED_RESOURCE_BOUND` means "not scanned", not "no subsumptions". The
default and maximum pair-check budget are both 1,000,000. Thus a bank with
100,000 unique clauses records 4,999,950,000 required checks and skips the
quadratic scan after the complete duplicate census.

This budget bounds only strict-subsumption comparisons. Manifest parsing,
occurrence collection, the complete duplicate report, and artifact output stay
linear in supplied history and are not size-capped by this option. In
particular, many occurrences of one duplicate clause can still produce a large
diagnostic record, and a complete scan can emit up to the configured number of
subsumption pairs.

For each pair actually checked, `A ⊂ B` records that the single clause `A`
syntactically subsumes the single clause `B` in the combined bank.

These diagnostics are read-only. They do not remove, reorder, merge, or replace
clauses in the emitted CNF. In particular, a cross-group duplicate or
subsumption does not by itself prove that either statement group is
semantically redundant under omission. Both the diagnostic section and the
top-level claims record that no semantic-redundancy conclusion is made from
this scan.

## Authenticated-verdict seam and labels

`AuthenticatedVerdictInputs` is an in-memory boundary, not a serialized receipt
format. A future adapter is responsible for authenticating solver receipts and
binding them to the exact `plan_sha256` before constructing this value. The
interpreter accepts only the typed verdicts `SAT`, `UNSAT`, and `UNKNOWN`, and
requires exactly one omission verdict for every statement ID.

The plan itself is not trusted merely because its internal hashes agree.
Before interpreting verdicts, `validate_selector_plan` requires exact JSON
scalar/container types, recomputes the root hash, checks exact object shapes and
selector/range structure, reconstructs the canonical source manifest from the
base clauses and gated clause payloads, regenerates the plan using the recorded
(bounded) diagnostic budget, and requires canonical plan bytes and DIMACS bytes
to match exactly. This prevents loose Python equality (for example `2.0 == 2`)
or recomputed self-hashes from blessing a modified/non-generated plan.

Exact regeneration proves construction integrity, not external source
entitlement. Another canonical supplied bank can legitimately generate another
valid plan. The future adapter or caller must select the trusted plan hash and
bind every solve receipt to that plan's exact query hash, assumptions, and CNF
hash before creating `AuthenticatedVerdictInputs`. The in-memory value records
that authenticated conclusion; this module intentionally does not authenticate
receipts itself. This is why `source_entitlement` remains explicitly false.

Interpretation is baseline-guarded:

| Baseline | Omitted-group query | Group label |
|---|---|---|
| `UNSAT` | `SAT` | `ESSENTIAL_RELATIVE_TO_SUPPLIED_BANK` |
| `UNSAT` | `UNSAT` | `REDUNDANT_RELATIVE_TO_SUPPLIED_BANK` |
| `UNSAT` | `UNKNOWN` | `INCONCLUSIVE` |
| `SAT` or `UNKNOWN` | any | `INCONCLUSIVE` |

The labels are relative only to the exact supplied base CNF and statement
groups. `REDUNDANT_RELATIVE_TO_SUPPLIED_BANK` is a semantic solver result, not a
permission to rewrite source history. `ESSENTIAL_RELATIVE_TO_SUPPLIED_BANK`
does not prove global minimum cardinality among all possible statement sets.

Every plan and interpretation explicitly sets these claims to false:

- `global_minimum`;
- `source_entitlement`; and
- `theorem_closure`.

The plan additionally sets `semantic_redundancy_from_diagnostics` to false.

## Validation boundary

Focused adversarial tests cover canonical JSON, duplicate keys, empty
collections, duplicate IDs, noncanonical order, Boolean/zero/out-of-range/
duplicate/tautological literals, selector placement, exact assumption polarity,
history-preserving diagnostics, complete and resource-skipped subsumption
statuses, invalid diagnostic budgets, artifact overwrite refusal, exact plan
regeneration including self-consistent tampering, direct-construction attacks
against the statement-bank API, plan binding, and the baseline guard.
