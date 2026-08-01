# v5 exact-branch diagnostic

Target:

`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow`

This is a bounded diagnostic over the existing v4 named necessary-condition
projection.  It is not a finite model of `D.A`, a Euclidean realization, or a
Lean proof.

## Smallest audited strengthening

The only missing universal consequence added by
`model_v5_branch_probe.py` is

```text
bs = bq -> SOURCE_SUPPORT = Q1_SUPPORT
```

This is kernel-proved by
`uniqueFourClass_centerAt_eq_selectedAt_support`: the selected support of any
source is the unique four-class of its actual blocker, so equal blockers give
equal selected supports.

Blocker-center strict-cap localization is not actually missing from v4.
The v4 constraints already:

1. identify `bs` and `bq` as actual blocker values;
2. exclude every actual blocker from all three apices;
3. put every named non-apex in exactly one indexed cap; and
4. define strict-cap membership as cap membership away from the two apex
   endpoints.

Thus v4 already entails that each of `bs` and `bq` lies in one indexed strict
cap interior.  The v5 script uses this fact in the branch formulas but does not
add a redundant copy.

The existing v4 block named `equal_blocker_support_coherence` only equates the
two supports selected by `q1` and `q2`; it does not connect either of them to
the cap-source support when `bs = bq`.

## Exact seven-way decision tree

After choosing strict-cap indices for `bs` and `bq`, the formulas are:

1. `bs = bq`;
2. distinct blockers and `q1` misses the source row;
3. distinct blockers, `q1` hits the source row, and `q2` misses it;
4. distinct blockers, both row hits, and distinct blocker-cap indices;
5. distinct blockers, both row hits, a common blocker cap, and `q1` is on it;
6. as in 5, but `q1` is off the common cap and `q2` is on it;
7. as in 6, but both `q1` and `q2` are off the common cap.

Branches 1--6 partition the no-alignment side.  Branch 7 is exactly the
positive alignment arm, not another residual no-alignment case.

## Results

All runs used surplus index 0, random seed 0, and a solver timeout no greater
than 60 seconds.

| Branch | Result | Seconds | Artifact | Qualification |
|---:|:---:|---:|---|---|
| 1 | SAT | 36.652287 | `v5-branch-1.json` | Unrefined |
| 2 | SAT | 54.550190 | `v5-branch-2-sat-witness.json` | A smaller cap-0/cap-2, both-row-miss case was chosen only to exhibit a witness |
| 3 | SAT | 40.900043 | `v5-branch-3-sat-witness.json` | The subcase `q1 = s2` was chosen only to exhibit a witness |
| 4 | SAT | 41.683631 | `v5-branch-4.json` | Unrefined |
| 5 | SAT | 38.684198 | `v5-branch-5.json` | Unrefined |
| 6 | SAT | 45.269340 | `v5-branch-6.json` | Unrefined |
| 7 | UNSAT | 2.276446 | `v5-branch-7.json` | Tautological clash with the retained `hnoAlignment`; not an independent computational closure |

The branch-2 and branch-3 refinements are not asserted as source
consequences.  They select strict subcases.  SAT for a strict subcase proves
SAT for the corresponding exact branch; an UNSAT result under such a
refinement would have had no branch-level force.  Cold unrefined probes for
branches 2 and 3 reached `UNKNOWN` at 60 seconds and are retained as
`v5-branch-2.json` and `v5-branch-3.json`.

## Commands

```bash
uv run python -m py_compile \
  scratch/atail-force/fresh-third-no-alignment-generic/model_v5_branch_probe.py

uv run python \
  scratch/atail-force/fresh-third-no-alignment-generic/model_v5_branch_probe.py \
  --branch 1 --timeout-ms 60000 \
  --output scratch/atail-force/fresh-third-no-alignment-generic/v5-branch-1.json

uv run python \
  scratch/atail-force/fresh-third-no-alignment-generic/model_v5_branch_probe.py \
  --branch 2 --sat-witness-refinement branch2-cap0-cap2-both-row-miss \
  --timeout-ms 60000 \
  --output scratch/atail-force/fresh-third-no-alignment-generic/v5-branch-2-sat-witness.json

uv run python \
  scratch/atail-force/fresh-third-no-alignment-generic/model_v5_branch_probe.py \
  --branch 3 --sat-witness-refinement branch3-q1-s2 \
  --timeout-ms 60000 \
  --output scratch/atail-force/fresh-third-no-alignment-generic/v5-branch-3-sat-witness.json

for branch in 4 5 6 7; do
  uv run python \
    scratch/atail-force/fresh-third-no-alignment-generic/model_v5_branch_probe.py \
    --branch "$branch" --timeout-ms 60000 \
    --output \
      "scratch/atail-force/fresh-third-no-alignment-generic/v5-branch-$branch.json"
done
```

## Interpretation

The added equality-of-support consequence does not eliminate even the equal
blocker arm: the branch-1 witness aliases `source = q1`, `bs = bq`, and the
two selected supports coherently.  This aliasing is permitted by the generic
Lean target.

The already-proved
`equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair` is stronger in its
own scope, but it requires two same-radius strict-interior sources.  A generic
`FreshThirdBlockerFiber` carries neither a common first-apex radius nor cap
localization for its two sources, so importing that conclusion into this
target would not be source-faithful.

Consequently the v5 branch census supplies no computational closure: all six
genuine no-alignment residual branches survive the strengthened relaxation.
No Lean source was edited.
