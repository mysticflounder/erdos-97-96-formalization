# P97 profile-0034 supporting-edge unguarded deletion v1

**Status:** governed PIQD discovery lane. No run has been launched by this
implementation checkpoint.

## Purpose

The completed supporting-edge parent has Z3 UNSAT discovery results for the
two mirror radius branches. This lane asks which coarse assertion groups may be
removed while Z3 still reports UNSAT. It submits physically reduced QF_NRA
journals through PIQD. It does not use Boolean guards, named atoms, or solver
assumptions.

The result concerns only each authenticated submitted formula. A deletion
witness does not establish a source object, source coverage, minimality, Lean
reachability, or a theorem.

## Authenticated inputs

The producer imports
`census/card_head/exactfive_hard_source_swap_profile0034_supporting_edge_qfnra_piqd.py`
and authenticates its completed `run-0001`, launch, terminal, six result trees,
recorded execution commit, and source bytes. The parent status is
`TARGET_INCONCLUSIVE`: each mirror branch has a Z3 UNSAT result and a cvc5
UNKNOWN result.

All new solver traffic uses
`census/p97_search/phase3_piqd_smt_source_adapter.py`. Each cell creates one
fresh named PIQD session, appends one complete state journal, performs one Z3
solve, retrieves receipts and journal bytes, and proves session closure. There
is no direct solver process.

## Assertion partition

Each parent mirror formula has 156 assertions after 20 real declarations:

- 13 supporting-edge groups, indexed `00` through `12`; each group contains
  the 11 assertions sharing one directed cyclic edge;
- 11 singleton source-row equality groups;
- one radius-branch group; and
- one source-strict group.

Concatenating the 26 groups in their canonical order reconstructs the parent
assertion journal exactly, including order and multiplicity.

## Fixed 55-query plan

Controls run serially before any target query:

1. `z3-control-positive` must return SAT and pass exact rational replay.
2. `z3-control-negative` must return terminal, assumption-free UNSAT.

The next 51 queries are fresh unguarded deletion probes:

- for each branch `lt` and `gt`, 13 leave-one-edge-group-out cells;
- for each branch, 11 leave-one-row-equality-out cells;
- for each branch, one leave-source-strict-out cell; and
- one shared radius-free cell.

The shared radius-free cell is permitted only after the producer reconstructs
both mirror journals without their radius assertion and proves the resulting
bytes are identical. The canonical submitted copy is the `lt` reconstruction;
the record binds both source-system hashes and both journal hashes.

The 51 probes run in deterministic, plan-ordered batches. The worker setting
lies in `1..20`; both the default and maximum are 20. A batch never contains
more than the selected worker count. Every query uses Z3 with exactly 60,000
milliseconds.

After all probe result trees pass custody checks, one reduced candidate is
formed per branch. A group is omitted only when its own leave-one-out probe has
a terminal, assumption-free `UNSAT_DISCOVERY_ONLY` receipt. SAT, UNKNOWN,
semantic replay rejection, malformed decision input, and transport loss all
retain the group. The two new candidate cells are then submitted concurrently.

Thus the immutable plan contains 2 controls, 51 probes, and 2 reduced
candidates: 55 fresh sessions and 55 solves.

## Physical omission and identity

Every descriptor has:

```json
{"named_atoms": [], "solve": {"assumption_ids": []}}
```

The submitted journal contains declarations followed only by retained source
assertions. Omitted commands do not occur as guarded implications, disabled
atoms, or assumptions. Each query record binds the system, ordered retained
and omitted group IDs, exact journal bytes, source snapshots, deterministic
request ID, solver profile, session identity, solve receipt, close record, and
self-hashes.

Candidate descriptors additionally bind all 51 probe result files as source
snapshots. Their decision records name the probe, group, conservative
disposition, omission Boolean, and probe result self-hash.

## SAT replay

A SAT response is accepted only after exact rational readback. Replay checks:

- total coordinate reconstruction and the fixed equilateral frame;
- every retained supporting-edge assertion, and no omitted edge group;
- every retained row equality, and no omitted row group;
- the branch radius inequality exactly when radius is retained; and
- the source-strict inequality exactly when source-strict is retained.

Replay does not add the parent's 286 sorted-triple constraints or its two
non-emitted row equalities. Those assertions are outside the submitted reduced
formula. An accepted SAT result is a model of the retained journal only and is
not a source realization.

UNSAT is recorded as discovery for the exact journal. UNKNOWN remains
unresolved. A final reduced-candidate UNSAT result is useful discovery but does
not establish core minimality.

## Runtime and replay

The governed root is
`scratch/runs/exactfive-hard-source-swap-profile0034-supporting-edge-unguarded-deletion-piqd-20260904/run-0001`.
Its `worktree-run-manifest/v1` repeats checkpoint `base_head`
`d07392f52c05c1d2d68abc37c058ffe296e751cd` and binds exact source and parent
input digests.

A live launch is allowed only when every bound source file has identical bytes
at the current committed `HEAD`. A terminal replay uses the immutable launch's
recorded execution commit. A root containing a launch without a terminal may
not resume; use a new governed run ID. `--init-only` validates only a pristine,
manifest-only root. Default successful CLI execution is silent; failures are
printed to standard error, and `--verbose` prints the returned record.

## Claims

Every claim-bearing descriptor, semantic system, query result, launch, and
terminal record keeps all of these claims false:

- `live_source_completeness`
- `core_minimality`
- `source_realization`
- `all_profile_execution`
- `lean_ingress`
- `live_closure`
- `promotion`
- `theorem`

## Validation

The focused offline checks are:

```bash
uv run pytest -q census/card_head/tests/test_exactfive_hard_source_swap_profile0034_supporting_edge_unguarded_deletion_piqd.py
uv run --with ruff ruff check census/card_head/exactfive_hard_source_swap_profile0034_supporting_edge_unguarded_deletion_piqd.py census/card_head/tests/test_exactfive_hard_source_swap_profile0034_supporting_edge_unguarded_deletion_piqd.py scripts/run_exactfive_hard_source_swap_profile0034_supporting_edge_unguarded_deletion_piqd.py
```

These checks use fake transports. They do not launch the solver campaign.
