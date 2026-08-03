# V20 disjoint cube wave

## Outcome and boundary

V20 is a sound orchestration successor to the exact terminal V19 run for
`fresh_DDD_k0_d2_f1`.  It does **not** claim that V19 closed the case: the
authenticated terminal status is `UNKNOWN` after wall-clock exhaustion, with
190 completed and zero pending assignments.  Each of those 190 assignments was
independently replayed `UNSAT` and contributes one complete 825-literal blocker.

V20 imports only those complete blockers.  It does not import a projected
blocker, inferred backbone, or empirical invariant.  Imported blockers and cube
literals are added only to the Boolean enumeration master.  V19's primary plus
fresh normalized QF_LRA replay continues to check every new complete assignment
against the unchanged raw full formula, whose pinned assertion hash is
`bce451bab18921a6c0d0d29d5307c8aab59be1c1fc937d991c6b40a8d7ca2720`.

`UNKNOWN`, a missing child, a pending or corrupt journal, or a hash mismatch is
fail-closed.  The aggregate may report conditional `UNSAT` only when every cube
in the authenticated exhaustive, pairwise-disjoint partition reports complete
`UNSAT`.  This is solver-orchestration evidence for the normalized exact-n15
case, not a Lean/kernel theorem or a universal Problem 97 closure.

## Authenticated V19 ingress

- Summary:
  `artifacts-v19-production1/20260802T153331.017335Z-case-pid34172/summary.json`
- Summary SHA-256:
  `327dd9f3df4d4bc36b77bc1866eae8933abf083e4c017899ebead6f9602796b9`
- Result SHA-256:
  `8e1a13271686fb558dc71d95db127afef06a9ba3f2cf28808fe9a30f04c8178a`
- Journal: 380 atomic hash-chained records, 190 paired proposals/outcomes,
  190 complete full blockers, zero pending.

Preflight recomputes the summary/result hashes, recovers and authenticates the
entire journal chain, pairs each proposal with its `UNSAT` outcome, checks the
complete assignment and blocker hashes/SMT text, and rejects any blocker whose
size is not exactly 825. Resume additionally pairs every journal record against
the corresponding CEGAR trace iteration and recomputes the cumulative blocker
and master-formula before/after chains.

## Partition

The default production partition uses four semantic Booleans:

1. `block_12_4`
2. `block_5_4`
3. `block_6_11`
4. `k4_14_9`

All `2^4 = 16` truth assignments are materialized in lexicographic bit order.
The terminal proposals occupy all sixteen cells, with 6--14 proposals per cell;
that observation is only a load-balancing heuristic.  Exhaustiveness and
disjointness follow from explicit enumeration of the complete four-bit truth
table and do not depend on the observed proposals.  A different split can be
preflighted with repeated `--split-bool NAME` flags.

## Commands

Read-only preflight is the default and launches no solver:

```bash
uv run python run_v20_cube_wave.py
```

Write the authenticated manifest without launching:

```bash
uv run python run_v20_cube_wave.py --manifest-out scratch/v20-manifest.json
```

Focused tests (no production wave):

```bash
uv run --with pytest pytest -q test_round5_cegar_v20.py
```

The production launch gate is deliberately explicit and has not been run here:

```bash
uv run python run_v20_cube_wave.py --execute \
  --artifacts artifacts-v20-cube-wave --workers 16
```

The coordinator launches a bounded parallel wave of 16 children by default,
each using `nice -n 10`.  There is exactly one child per cube, never more than
one child process per declared worker/core.  Thus the planned production
allocation is 16 V20 cube children plus the already-running V19 child: 17 cores,
within the 24-core lease.  `--workers` must be positive and cannot exceed the
available core count.

Every child has its own staging directory; its hash-chained assignment journal,
result, and exact SHA-256 attestation are completed before that directory is
atomically renamed into its final cube location. Dead-process
`.cube.pending.<pid>` trees are moved in sorted order under `.quarantine-v20/`;
a staging tree owned by a live PID is never moved. Only the coordinator writes
the aggregate, atomically, after completed-child notifications.

Finalized cubes preserve the exact v19 artifact basenames committed by their
inherited results. Resume binds the v20 status and completeness to the inherited
result and authenticates every declared journal, trace, prepass, and frozen SMT
blob plus their cross-file contracts. Terminal UNSAT replays the Boolean master;
its decompressed formula SHA-256 must equal the trace's committed final-master
SHA-256 before replay. Terminal SAT replays the witness against the raw frozen
formula. A missing or corrupt dependency becomes an unresolved error row, so
aggregation remains `UNKNOWN` rather than closing.

`aggregate-v20.json` contains a manifest-ordered `authenticated_children` row
for every successfully authenticated child. Each row commits the exact
`cube-result.json` and attestation SHA-256 values, the load-bearing inherited
trace/prepass/frozen/witness hashes and journal-chain heads, and a canonical
SHA-256 of that complete evidence map. A purported complete child without this
commitment is unresolved and cannot close the aggregate.

## Aggregate statuses

- `unsat`, `complete=true`, `conditional_unsat=true`: all 16 declared cubes
  closed complete `UNSAT`.
- `sat`, `complete=true`: a child returned a replay-validated raw-formula model.
- `unknown`, `complete=false`: at least one cube is missing, `UNKNOWN`, budget
  exhausted, errored, corrupt, or otherwise not authenticated complete.

No aggregate result is promoted automatically into production Lean sources.
