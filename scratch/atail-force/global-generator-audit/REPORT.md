# Global-count shadow generator audit (2026-07-14)

## Verdict

The two witnesses in `../global_count_boundary/shadows.json` were produced by
two inline Z3 programs.  No copy of either generator was retained in the
repository.  The only owned executable in `../global_count_boundary/` is the
deterministic replay validator.

The current reusable finite-row search can nevertheless generate a fresh
card-12 `(4,5,6)` survivor while pruning all 23 current formalized metric-core
families.  This is an actionable CEGAR surface, but it is the fixed-placement
`second_center_query` schema, not a byte-for-byte reconstruction of the older
`global_count_boundary` schema.

## Recovered original provenance

The creation session is recorded at:

```text
/Users/adam/.codex/sessions/2026/07/13/
  rollout-2026-07-13T14-55-02-019f5d79-f771-79c0-914e-028490fc3aa8.jsonl
```

The two discovery calls occurred at `2026-07-13T22:18:27Z` and
`2026-07-13T22:19:59Z`.  Both used an inline command of the form

```bash
.venv/bin/python - <<'PY'
# complete one-off Z3 program; not retained as a file
PY
```

Each program:

1. generated all four-point row supports obeying the ordered-cap one-sided
   and endpoint-one-hit constraints;
2. represented the selected support at each of the 12 centers by one integer
   choice variable;
3. encoded pairwise compatibility by QF_LIA implications, including row
   overlap, cyclic separation, no reciprocal row membership, and same-cap
   outside-pair uniqueness;
4. required the selected rows to cover all 12 sources and required some row
   to hit the surplus-cap interior;
5. called `z3.SolverFor('QF_LIA')` with a 60-second solver timeout; and
6. directly revalidated the model, then existentially chose the dangerous
   labels and a source-cover blocker map with `t2 -> p`.

The `(5,5,5)` run built 12,201 implication blocks with 1,485,117 compatible
literals in 40.63 seconds and returned SAT in 1.62 seconds.  Its rows and
labels are exactly the first saved witness.  The `(4,5,6)` run built 12,607
blocks with 1,333,138 compatible literals in 34.02 seconds and returned SAT
in 1.26 seconds.  Its rows and labels are exactly the second saved witness.

There is therefore no present generator path or repository command that will
recreate `shadows.json`.  The validator docstring's phrase “the exploratory
Z3 search that found them” is accurate, but the original program, Z3 version,
and deterministic model-selection seed are not pinned.

## Current reusable generator

The reusable engine is:

```text
census/global_confinement/shadow.py
```

Its `solve_choice_rows` accepts both:

- `prefix_compatible`, for monotone forbidden motifs and early pruning; and
- `complete_compatible`, for full-assignment-only conditions.

The current card-12 wrapper which composes the Q-C prefix predicate with all
formalized metric-core detectors is:

```text
scratch/atail-force/second_center_query/formalized_core_shard.py
```

The exact command checked in this audit was:

```bash
PYTHONPATH=. UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/second_center_query/formalized_core_shard.py \
  --profile-index 0 --shard-count 1 --shard-index 0 --max-nodes 100000
```

It returned:

```text
profile       (4,5,6)
raw status    SAT
reported      SAT_FINITE_SHADOW_ONLY
nodes         5,780
survivor SHA  d9e61618600c467ab8db18067d1e8197ffce9fd423875c55e593f51771c7dcc3
12-row SHA    09c092eff258d9e6bf35970ebafe27408158f31597f3b81d1587e87a6e09cc3c
```

The complete distinct global row system is:

```text
0:{1,3,4,5}       1:{0,2,5,6}       2:{4,6,9,11}
3:{2,4,7,10}      4:{1,5,7,11}      5:{0,1,9,10}
6:{5,8,10,11}     7:{0,3,6,11}      8:{0,3,7,9}
9:{0,4,8,10}     10:{1,6,7,8}      11:{2,3,8,9}
```

The full named placement/frame data needed to reconstruct the query case is:

```text
cyclic order: 0,8,9,10,11,1,3,4,2,5,6,7
closed S:     {1,2,3,4}
closed O1:    {0,2,5,6,7}
closed O2:    {0,1,8,9,10,11}
surplus cap:  O1
second large: O2
(p,q,t1,t2,t3,u) = (0,5,3,1,4,2)
dangerous support = {1,3,4,5}
```

The supplied-row aliases are:

```text
supplied:q  = global:0
supplied:t1 = global:0
supplied:t2 = global:0
supplied:t3 = global:0
supplied:u  = global:1
```

The complete critical-shell blocker map is:

```text
0->1, 1->4, 2->3, 3->7, 4->2, 5->1,
6->1, 7->3, 8->6, 9->2, 10->3, 11->2.
```

For each source, `system:source` is the exact global row at the displayed
blocker center.  This specifies every supplied, global, and system row in the
full saved query document, including aliases.  The survivor SHA above is the
`witness_sha256` of that complete case document, not merely a hash of the 12
distinct supports.  The 12-row SHA is the canonical JSON hash of the sorted
`[{center, support, exact}]` metric-row list used by the compact survivor
format.

The current detector rejected prefixes at 11 observed stages, including both
cyclic orientations of the convex-five-point family.  A final direct scan of
the saved historical shadows gives:

```text
(5,5,5)  equality-convex-five-point-reverse
(4,5,6)  no current formalized metric core
```

Thus the current bank improvement invalidates the historical `(5,5,5)`
witness, while the historical `(4,5,6)` witness survives.  Independently, the
current generator also finds a new `(4,5,6)` survivor.

For a partitioned exhaustive run of the same fixed placement, use
`run_formalized_core_shards.py`.  All shards must finish UNSAT before the
wrapper reports fixed-placement finite-shadow exhaustion; one SAT shard is
already enough to refute exhaustion.

## Forbidden-motif support

The search can accept a new forbidden motif without changing its architecture.
The correct integration point is a monotone predicate composed into
`prefix_compatible`, as `formalized_core_shard.py` already does for
`_formalized_metric_core`.

The minimal scratch-only change point is the nested
`prefix_compatible` function inside
`scratch/atail-force/second_center_query/formalized_core_shard.py::solve_shard`.
Immediately after the existing `_formalized_metric_core(...)` call returns
`None`, call a new scratch `eleven_equality_core(...)` detector on the same
`_metric_rows(rows)` and reject the prefix when it returns a role assignment.
No change to `census/global_confinement/shadow.py` is necessary.

If the detector is later promoted into the shared bank classifier, the minimal
shared change is one new closure-based helper and one new entry in the
`checks` list of
`census/global_confinement/metric_realizability_probe.py::_formalized_metric_core`.
That promotion must also change the documented family/stage counts and extend
the metric-realizability differential tests.  It should not be done merely to
run the scratch experiment.

The existing `second_center_metric_cegar/cegar.py` also supports no-good cuts,
but its `Cut` type is a set of complete `(center, support)` row signatures.
The new fixed-shadow certificate uses 11 selected equalities from six rows,
not all equalities of a row.  Treating six complete rows as the cut would be
sound when those rows imply the certificate, but would be unnecessarily
specific and would miss relabeled or partial-row occurrences.

The useful implementation is therefore an equality-closure detector which:

1. searches injective assignments of seven point roles (six are centers) for
   the six-center/11-equality motif;
2. returns a rejection as soon as the required equality classes appear; and
3. is composed with the existing 23-family prefix classifier.

Equality closure only grows as rows are added, so this detector is monotone
and is valid for prefix pruning.  It should remain scratch-only until its role
contract and certificate correspondence are independently checked.

## Schema and staleness boundary

The old `global_count_boundary` checkpoint is not internally stale:

- `validator.py --check` passes;
- all 10 mutation/replay tests pass; and
- the checkpoint's canonical JSON hashes match the current manifest and
  shadows.

The apparent difference between the audit hashes and raw `shasum` output is
not drift: the checkpoint records the validator's canonical-JSON SHA-256,
whereas newer geometry tools pin the raw file-byte SHA-256
`e771d39cd7291aaf8e6adb7a7853495623e54439b2205d5fcdac4a085161064c`.

There is real search-schema drift:

- the historical generator used one chosen row at each center, existentially
  selected dangerous labels afterward, and prohibited reciprocal row edges;
- `second_center_query` fixes one named-label placement per profile, includes
  supplied and global rows, uses the current multi-center candidate inventory,
  and permits reciprocal row membership when equality closure remains
  compatible with exactness; and
- neither schema is exhaustive over all card-12 placements or target-faithful
  Euclidean geometry.

Consequently the fresh SAT result is evidence that the current 23-family bank
does not close the current fixed `(4,5,6)` query.  It is not a regenerated
instance of the historical manifest and is not a counterexample to K-A-PAIR.
