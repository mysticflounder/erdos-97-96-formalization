# P97 profile 0034 physical block-deletion lane

Status: governed discovery lane, version 1, dated 2026-09-04.

## Scope and authenticated parents

This lane consumes the completed profile-0034 supporting-edge unguarded
deletion run and the completed unresolved group-core run. Before any launch it
authenticates both run manifests, launch and terminal records, retained query
artifacts, source snapshots, producer bytes, PIQD adapter bytes, and recorded
execution commits. It also reconstructs and validates the exact rational
witness for each fixed base set below. Any failed parent, source, commit, or
witness check stops the launch.

The assertion universe, in canonical source order, is:

1. `edge-index-00` through `edge-index-12`;
2. `source-row-equality-00` through `source-row-equality-10`;
3. `radius-branch`;
4. `source-strict`.

The fixed LT base `B_lt` is:

- `edge-index-00`, `edge-index-03`, `edge-index-04`;
- `source-row-equality-01`, `source-row-equality-05`.

The LT removable set `C_lt` is the exact universe complement:

- `edge-index-01`, `edge-index-02`, `edge-index-05`, `edge-index-06`,
  `edge-index-07`, `edge-index-08`, `edge-index-09`, `edge-index-10`,
  `edge-index-11`, `edge-index-12`;
- `source-row-equality-00`, `source-row-equality-02`,
  `source-row-equality-03`, `source-row-equality-04`,
  `source-row-equality-06`, `source-row-equality-07`,
  `source-row-equality-08`, `source-row-equality-09`,
  `source-row-equality-10`;
- `radius-branch`, `source-strict`.

The fixed GT base `B_gt` is:

- `edge-index-00`, `edge-index-03`;
- `source-row-equality-00`, `source-row-equality-01`,
  `source-row-equality-03`, `source-row-equality-05`.

The GT removable set `C_gt` is the exact universe complement:

- `edge-index-01`, `edge-index-02`, `edge-index-04`, `edge-index-05`,
  `edge-index-06`, `edge-index-07`, `edge-index-08`, `edge-index-09`,
  `edge-index-10`, `edge-index-11`, `edge-index-12`;
- `source-row-equality-02`, `source-row-equality-04`,
  `source-row-equality-06`, `source-row-equality-07`,
  `source-row-equality-08`, `source-row-equality-09`,
  `source-row-equality-10`;
- `radius-branch`, `source-strict`.

## Physical source contract

Every retained group is emitted as its original hard assertion in canonical
source order. A candidate removes the selected block from the source stream
itself. The generated target has no Boolean guard declarations, implication
wrappers, named atoms, or solver assumptions. The descriptor and request both
record empty named-atom and assumption lists.

Each branch begins by submitting `B` union `C`, which is the full parent
physical assertion journal for that branch and its frozen strict direction.
The lane proceeds only when this anchor returns a custody-valid UNSAT result.
The final selected set is linked to a reverified custody-valid UNSAT result.

## Scheduling and block deletion

The positive and negative controls run serially in that order. The positive
control must return SAT and pass exact rational replay. The negative control
must return custody-valid UNSAT. Control results do not mutate either target
branch.

After the controls pass, the LT and GT coordinators run concurrently. Both use
one shared executor capped at 20 live queries. Each branch has an absolute cap
of 128 submitted target queries, including its full-source anchor.

For one branch, block deletion starts with granularity `n = 2`. The current
removable sequence is partitioned into stable, near-equal contiguous chunks.
Every candidate in a round is `current` minus one chunk, and every query in
that batch binds the same unchanged-current digest. A query key binds the
branch, current digest, and deleted-block digest. A result whose round or
current digest is stale is rejected and cannot mutate branch state.

All candidates from an unchanged-current batch may run concurrently. If the
batch contains multiple custody-valid UNSAT results, the coordinator accepts
the first result after ranking by fewest retained groups and then the canonical
retained list, deleted block, and query key. The next current set is only that
candidate's retained set; deleted blocks from sibling results are never combined
without a fresh custody-valid UNSAT query. After an accepted deletion,
granularity returns to two. When a round has no accepted deletion, granularity
increases up to singleton chunks.

Only a custody-valid UNSAT result authorizes removal. SAT, UNKNOWN, transport
loss, malformed custody, rejected replay, and all unresolved outcomes retain
the tested block. A SAT result is accepted only after exact rational replay
against the precise retained hard assertions. Algebraic or otherwise
unreplayable values are unresolved and do not authorize removal.

The field `deletion_stable` is true only after every singleton deletion from
the final current set has resolved and none was accepted. It remains false if
the query cap truncates closure, any singleton is untested, any singleton is
UNKNOWN or unresolved, or a singleton deletion is accepted. This field makes
no global minimality claim.

## PIQD custody and immutable records

Every query uses Z3 through the governed PIQD SMT adapter with a 60,000 ms
timeout. Each query creates a fresh dynamically named session, performs one
solve, closes the session, and retains complete request, journal, receipt,
lifecycle, artifact, and close custody. Session identifiers are unique within
the run. The run tree and query records are create-once. A partial launch is
not resumed.

One semantic verification is performed for each immutable result in a process
and cached by its content key. Later validation passes still rehash all bound
files and records before consulting that cache. Manifests and per-query source
snapshots cover every execution-critical producer, adapter, parent input, and
generated source record.

The active run root is
`scratch/runs/exactfive-hard-source-swap-profile0034-physical-block-deletion-piqd-20260904/run-0005`.
Its manifest repeats the governed lane checkpoint base head. Default CLI success
is silent; errors are written to standard error.

All claim-bearing records set these claims to false:
`live_source_completeness`, `core_minimality`, `source_realization`,
`all_profile_execution`, `lean_ingress`, `live_closure`, `promotion`, and
`theorem`. Neither a retained-source SAT replay nor a reduced custody-valid
UNSAT result is a theorem or a source-completeness result.
