# P97 global-confinement metric cvc5 over PIQD, v1

Status: implemented bounded adapter contract; fake-transport qualification only;
finite diagnostic, not a proof result.

This specification defines the additive PIQD onboarding slice in
`census/global_confinement/metric_realizability_piqd_cvc5.py`. It does not
modify proof-blueprint session `019fdf9c` or its anchor
`Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier`: that anchor
remains unchanged, open, and off-spine.

## Scope

One invocation selects exactly one system from the *current* reconstructed
global-confinement frontier and runs only the existing producer's
`full-convex` encoding. The system ID is mandatory. The adapter neither admits
a batch nor runs the equality-prefilter stage through PIQD.

```bash
python -m census.global_confinement.metric_realizability_piqd_cvc5 \
  --system-id 0b12b25bf5daa7566f98 \
  --out scratch/p97-global-metric-piqd-0b12b25bf5daa7566f98
```

This command is a production entry point, not part of the fake-only test gate.
It uses cvc5 through PIQD and has no local-solver or fallback path.

## Source custody and reconstruction

Every input component is opened relative to a held parent-directory file
descriptor with `O_NOFOLLOW`. It must be one regular, singly linked file. The
adapter captures bytes and file identity before parsing, then verifies identity
and bytes after frontier reconstruction, after SMT preparation, and after the
PIQD solve. Each component is capped at 16 MiB and the input tuple at 64 MiB.

JSON parsing rejects duplicate keys and non-finite numbers. The parsed tree is
bounded to depth 64 and 2,000,000 nodes. Semantically relevant scalars use exact
built-in types, so, for example, `true` is not admitted as an integer. The
selected system is bounded by `n <= 64`, and indices, order, supports, rows,
and exactness flags are checked before encoding.

The adapter calls the existing `extract_systems` and `_frontier` functions over
the captured bytes, requires the selected ID to occur exactly once in the
current frontier, and records the extraction and source hashes. It then calls
the existing `metric_realizability_cvc5.build_smt2` for `full-convex`. The
producer's exact original SMT-LIB bytes and hash are retained separately from
the PIQD journal. Assertion counts are recomputed independently from the source
system and bound into the descriptor.

## Qualified cvc5 session

The selected system receives one fresh cvc5 session, one assertion batch, one
bounded solve, and a close. Execution is sequential with one worker/process.
The exact first journal command is:

```smt2
(set-option :nl-cov true)
```

It precedes `(set-logic QF_NRA)`. The rest of the journal is the existing
producer source with only its terminal `(check-sat)` and `(exit)` removed and
with commands normalized by the hardened producer-neutral PIQD SMT-session
machinery. The exported journal, solver identity, query hash, command prefix,
readback terms, timeout, receipt, solve count, and closed session are all
validated. The metric adapter enters the shared SMT-session implementation only
through its documented public authenticated-single-solver boundary. That
boundary re-parses the immutable descriptor bytes, requires the descriptor's
solver list to be exactly `["cvc5"]`, binds the invoked solver to that entry,
and checks the independently reconstructed complete journal. The existing
public z3-then-cvc5 wave retains its exact two-solver descriptor contract.

For every bounded solve, the current daemon response and durable receipt must
both contain the exact built-in integer `effective_deadline_ms`. The adapter
binds the outbound `timeout_ms`, response, and receipt and requires
`effective_deadline_ms = timeout_ms + 30000` in each record. Missing fields,
extra fields, Booleans, floats, wrong arithmetic, and crossed response/receipt
deadlines fail closed. This invocation always sets `timeout_ms`, so omission is
never valid on its current route. Artifacts from pre-`fd1cacee` daemons that
omit the field remain honestly legacy records: this adapter neither rewrites
them nor accepts them as current-contract evidence.

A lost solve response enters a fixed seven-sample reconciliation schedule with
delays `0, 10, 25, 50, 100, 250, 500` milliseconds (935 milliseconds total).
Each sample authenticates both `GET /sessions/:id` and the durable receipt
journal. Recovery requires one terminal solve/status record and exactly one
matching receipt; it never resubmits `POST /solve`. Missing state throughout
the bounded window remains transport-loss inconclusive, while a half-terminal,
duplicate, crossed, or tampered record fails closed. A completed response with
no durable receipt and a solve/receipt answer or status mismatch also fail
closed. The session is closed exactly once after reconciliation. No second
solve and no local fallback are allowed. As in the maintained shared contract,
agreement between the daemon solve response and its durable receipt is binding.
The adapter's independent recomputation of PIQD's `result_sha256` is recorded
only as `result_digest_advisory`; a mismatch there is advisory and is not
silently promoted to a new protocol gate.

This client-side reconciliation fixes the response-loss race observed for live
session `3a2ffaea-21f8-49fa-904c-14b51364a869`; it does not change PIQD timeout
semantics. The prior issue was missing deadline disclosure and a client schema
that could not bind the effective bound, not a PIQD timeout defect. cvc5 1.3.3
does not honor PIQD's `tlimit-per` request, so the daemon's existing 30-second
grace is intentionally the effective bound for this solver: requested 20
seconds means `effective_deadline_ms = 50000`. The production client uses a
55-second HTTP timeout for that request, leaving a separate five-second
transport/response margin beyond the disclosed daemon deadline. A receipt with
`solve_ms > timeout_ms` is therefore not reclassified as an overrun; its
requested and effective deadlines remain distinct and explicit.

## Outcome semantics

`SAT` is retained only when every declared point coordinate has one bounded
exact-rational value and an independent replay verifies every source assertion:
all selected row equalities, all exact-row exclusions, all pairwise
distinctness constraints, and every strict convex-order determinant. The
replay works for arbitrary admitted `n`; it does not trust the solver's printed
model as an entitlement.

`UNSAT` is recorded only as a cvc5 diagnostic and is not kernel checked.
`UNKNOWN`, transport loss without a matching receipt, malformed or false
models, and all protocol or custody errors are inconclusive. Source
entitlement, theorem, global, universal, Lean, proof, and Euclidean Problem 97
claims are explicitly false for every outcome.

The historical full-convex system `0b12b25bf5daa7566f98` is retained as the
known-UNSAT fake-transport control. Its historical diagnostic does not become
a theorem or a live-solver qualification in this slice.

## Artifacts and qualification

Publication is strict and create-once. A successful run publishes a canonical
result plus the bound source record, descriptor, exact original SMT-LIB source,
PIQD journal, session artifacts, solve receipt, and replay evidence beneath one
new output directory. Pre-existing or incomplete target paths are rejected;
staged evidence remains available after an inconclusive solver outcome.

The bounded qualification command is:

```bash
scripts/test-p97-piqd-global-metric-cvc5.sh
```

It fixes common numerical, runtime, and package-manager thread counts to one,
runs the focused shared-session and metric tests with one pytest worker, and
checks Ruff style for both adapters and test modules. The tests include strict
deadline-schema type/arithmetic/cross-binding attacks, HTTP timeout sizing, and
lost-response recovery from the durable deadline-bearing receipt. Its transport is fake: it
does not contact PIQD, execute cvc5, run Lean, or mutate proof-blueprint state.
