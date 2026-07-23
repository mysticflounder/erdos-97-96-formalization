# Global-K4 shell-curvature packing audit

Date: 2026-07-22

Status: **EXACT SAT COUNTERPATTERNS IN A CYCLIC SELECTED-ROW ABSTRACTION.
NOT EUCLIDEAN REALIZATIONS AND NOT COUNTEREXAMPLES TO THE LEAN RESIDUAL.**

## Question

The checked shell-curvature consumer closes the unique-four leaf if four
selected K4 rows supply quarter-turn arcs with pairwise disjoint open turn
supports.  Before attempting that source theorem, this audit asks whether the
occurrence follows from any of the following progressively stronger purely
combinatorial data:

1. one four-point nonself selected row at every cyclic carrier center;
2. the exact-two `2+1+1` first-apex class distribution; and
3. strong connectivity of the selected-row digraph.

## Result

The answer is no in both physical cap profiles at `n = 11`.

[`search_arc_packing_counterexample.py`](search_arc_packing_counterexample.py)
chooses one four-subset at every center.  It derives the two open turn-support
intervals used by the selected-four-class curvature adapter, searches for four
pairwise disjoint intervals, and adds an exact blocking clause for every
packing found.  With `--require-strong-connectivity`, every non-strong model is
cut by its sink strongly connected component.  With
`--require-curvature-sat`, the final row ledger is checked in exact rational
QF_LRA with positive turns, turn sum `4`, and both strict quarter-turn
inequalities at every center.

The durable models are:

| artifact | exact-two profile | selected graph | four-arc packing | scalar turn ledger |
|---|---:|---|---|---|
| `global.json` | none | unrestricted | absent | not required |
| `exacttwo-opp1-4-strong.json` | opposite cap 4 | strongly connected | absent | rational SAT |
| `exacttwo-opp1-5-strong.json` | opposite cap 5 | strongly connected | absent | rational SAT |

The first-apex row in each profiled model has exactly two strict-cap members
and one member in each adjacent closed cap.  The stored rational turn model
satisfies the full scalar ledger.

## Consequence for the proof route

Carrier-wide K4 row cardinality, the `2+1+1` distribution, and one selected
strongly connected witness graph do not imply the desired four-arc packet.
The live occurrence theorem must visibly consume additional source data, most
plausibly the complete radius partitions, fixed critical map and exact
critical supports, Euclidean two-circle/cyclic-alternation restrictions, or
the universal force of minimality over every row selection.

This does not refute the occurrence from `OriginalUniqueFourResidual`: these
models omit the complete radius partitions, actual blocker system, deletion
criticality, MEC geometry, and `noM44`.  Their role is to prevent an overstrong
packing lemma from entering the closure plan.

## Replay

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/unique4-global-k4-curvature-packing/\
    search_arc_packing_counterexample.py \
  --n 11 --exact-two-profile 4 --require-strong-connectivity \
  --require-curvature-sat --round-cap 100000 \
  --output scratch/atail-force/unique4-global-k4-curvature-packing/\
    exacttwo-opp1-4-strong.json
```

Replace profile `4` by `5` for the second physical cap profile.  The search is
exact for this documented cyclic abstraction only.
