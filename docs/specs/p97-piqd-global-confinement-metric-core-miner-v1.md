# P97 PIQD global-confinement metric core miner v1

## Status and scope

This specification defines the production/default P97 adapter lane for
`census/global_confinement/metric_realizability_cvc5_core_miner.py`. The lane
mines smaller row and equality-atom sets from the current
`metric_realizability_cvc5.json` frontier through PIQD SMT sessions. It emits
authenticated, replayable **diagnostic solver evidence**. It does not prove
global confinement, Problem 97, a Lean theorem, or the absence of `sorry`.
An `UNSAT` response without a maintained proof object remains diagnostic.

The old subprocess implementation is available only with the explicit
`--legacy-local` flag. Default execution and offline validation must not invoke
local cvc5 or Z3.

## Input and semantic binding

The adapter accepts only the current, exact top-level/result/stage schema of
`p97-global-confinement-metric-realizability-cvc5-v1`. It captures the input as
a singly-linked regular file without following the final symlink. It rejects an
oversize `st_size` before reading, reads at most the byte cap plus one while the
descriptor is open, rejects symlinks, hardlinks, nonregular files, and mutation,
and rechecks the captured identity and bytes immediately before publication.

Each system result binds canonical bytes and SHA-256 digests for the complete
semantic system, the point order, and the profile. The guarded journals are
deterministically rebuilt from those bytes. The offline validator rejects a
bundle unless the archived source, semantic record, journals, requests,
answers, durable receipts, and manifest all cross-bind.

The record also binds the unique, sorted, nonempty ordered list of selected
`system_id` values, its exact cardinality, and its canonical digest. Results
must have exactly those IDs in exactly that order. Membership in the archived
source is necessary but not sufficient: duplicate, missing, or crossed result
entries fail even if an attacker recomputes the record and manifest hashes.

## Append-only PIQD algorithm

Each solver gets one fresh SMT session. The adapter appends exactly one guarded
journal with `expect_commands = 0`, exports it, byte-compares the export, and
never appends again. The journal declares:

- one Boolean guard for every source row;
- one Boolean guard for every row equality atom; and
- one `p97_full_stage` guard for exact-support exclusions.

Every solve supplies a total positive/negative assignment for every guard.
Consequently row deletion, equality-atom deletion, and switching between the
full-convex and convex-only relaxations are all safe assumption changes over one
immutable append-only query; no query retraction or replacement is needed.

All solves are sequential (`workers = 1`). Each request has a deterministic
UUID `request_id`. A single retry after an ambiguous transport loss is accepted
only when PIQD reports the response as an idempotent replay. After every solve,
the complete current receipt history is fetched, strictly validated, and
checked to extend the previously authenticated history.

The cvc5 session performs deletion and validation. Every cvc5 SAT answer
requests both a model and exact coordinate values; the active equalities,
exact exclusions, distinctness constraints, and strict convex order are replayed
over Python `Fraction` values before the answer can influence minimization. Z3
uses a separate authenticated PIQD session for the final row-core and atom-core
status-only cross-checks (`include_model = false`, no readback variables). There
is no local fallback.

## Native cores and source promotion

PIQD native assumption cores are checked only for membership in the exact
requested assumption set and are archived as diagnostics. They are not used by
the deletion algorithm and are never source-promoted by this lane.

The generic `#5400` PIQD transport contract is shipped: callers may submit
`assumption_labels`, and the daemon returns `core_labels` while binding both
lists into the durable receipt and result digest. This status-only deletion
lane does not use that contract to promote a core. Source promotion remains
blocked on the caller-owned binding of every returned label to exact P97
source-statement bytes and independent replay of that interpretation. No
additional generic PIQD change is needed here.

## Output and offline validation

Publication is a flat, private staging directory installed atomically without
replacement. Every artifact is singly linked, regular, read-only, length-bound,
and SHA-256 inventoried. A complete bundle contains:

- the byte-exact source input;
- the result record and manifest;
- deterministic cvc5 and Z3 journals for every selected system; and
- the complete durable receipt envelope for both sessions.

The public standalone command

```bash
python -m census.global_confinement.metric_realizability_piqd_core_miner \
  --check PATH
```

validates the bundle without a daemon or solver. Any unknown current-schema
field, altered source/query/order/profile byte, request/result digest mismatch,
duplicate receipt/core, failed SAT replay, result-selection mismatch, mutable
artifact, or custody change fails closed. `UNKNOWN` remains an inconclusive
diagnostic; an `ERROR`-shaped solve response is rejected and the CLI exits with
an `INCONCLUSIVE` status rather than publishing.

The focused one-worker test command is:

```bash
./scripts/test-p97-piqd-global-metric-core-miner.sh
```

Its fake transport exercises only the maintained public PIQD SMT lifecycle; it
does not start PIQD or execute a real solver. The script fixes Python import
custody to the repository root, caps the supported process/thread pools at one,
runs one focused pytest process, then runs Ruff lint and Ruff format checks over
the producer, adapter, and focused test.

## Live qualification checkpoint

The bounded live canary from commit `299bd24067b622153356cc2ac4b6b063ad0e2a44`
selected system `0b12b25bf5daa7566f98` from the current archived frontier. It
created exactly two fresh sessions and left both closed:

- cvc5 session `c8ed7755-12c6-4540-857e-1e404fd45891` produced 32 unique
  solves and durable receipts: 15 `UNSAT` and 17 `UNKNOWN`;
- Z3 session `f9e39bf2-1770-424c-bf32-a778d8a91ab7` produced two unique
  status-only `UNSAT` solves and durable receipts.

The final cvc5 row and atom validations and both Z3 cross-checks were `UNSAT`.
The diagnostic core contains rows `[1, 5, 6, 9, 10, 11]` and equality atoms
`(1,6)`, `(1,8)`, `(1,9)`, `(5,9)`, `(5,11)`, `(6,5)`, `(9,1)`, `(9,6)`,
`(10,9)`, `(10,11)`, and `(11,9)`. The published result SHA-256 is
`54aa763c4fd59cab822d4b2c50245a33b8039ebb46ed662f3f49662f04fbcd5c`;
the manifest SHA-256 is
`87662bb7366b610e13f713028e183b6bb5ce1b3dce06100b9395f2566fd585d6`.

The public standalone validator and an independent seven-artifact custody
audit both passed. This qualifies the PIQD transport, lifecycle, receipt,
publication, and offline-replay boundary for this finite diagnostic run. The
generic `#5400` label/digest transport is shipped, but this producer has not
bound a named core to exact P97 source statements or independently replayed
that binding. All source-entitlement, named-core, proof, theorem, global,
universal, Lean, and `sorry`-closure claims remain false.
