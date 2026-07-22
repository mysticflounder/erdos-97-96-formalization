# Exact-five multirow shell-curvature audit

Date: 2026-07-21

## Result

**BLOCKED AT THE AGGREGATE OCCURRENCE PRODUCER.** The current shell-curvature
bank supplies only per-row quarter-turn inequalities. Its contradiction
consumer,

```lean
ShellCurvature.false_of_four_separated_quarter_turn_arcs
```

also needs four ordered, nonoverlapping arcs in one common fundamental
window. Neither the exact-five cap row-hit bounds nor
`outsidePair_unique_capCenter` supplies that cross-row order separation.

There is a small interface gap before this route starts: global K4 produces a
`SelectedFourClass`, while the current curvature adapters accept a
`CriticalFourShell`. The per-row proof uses only four selected equal-radius
points, so that adapter should be routine. It would expose only the same
nonterminal per-row facts and is not closure work by itself.

## Existing theorem chain and first missing premise

For each of the five vertices of the closed exact-five cap, the available
chain is:

1. `exists_selectedFourClass_of_globalK4` chooses a four-point row.
2. The endpoint rows have at most one cap hit by the ordered-cap endpoint
   bounds; every row has at most two cap hits by
   `selectedFourClass_inter_capByIndex_card_le_two`.
3. `outsidePair_unique_capCenter`, aggregated by
   `orderedCap_outsidePairCount_sum_le`, prevents reuse of an outside pair at
   two distinct cap centers.
4. A routine selected-row curvature adapter would provide four strict
   quarter-turn arcs for each row.

The first unavailable statement is an order-sensitive occurrence theorem:
four of those transported arcs must lie in one period with order

```text
a1 < b1 <= a2 < b2 <= a3 < b3 <= a4 < b4.
```

Without that statement the aggregate curvature terminal cannot be called.

## Exact finite regression model

This is a countermodel to the exported incidence and interval consequences,
not a Euclidean Problem 97 counterexample.

Take a cyclic carrier with 13 positions, exact cap `C = {0,1,2,3,4}`, and
the following cap-centered supports:

| center | support | cap hit | outside support |
|---:|---|---|---|
| 0 | `{1,6,7,8}` | `{1}` | `{6,7,8}` |
| 1 | `{2,6,9,10}` | `{2}` | `{6,9,10}` |
| 2 | `{3,6,11,12}` | `{3}` | `{6,11,12}` |
| 3 | `{4,7,9,11}` | `{4}` | `{7,9,11}` |
| 4 | `{0,7,10,12}` | `{0}` | `{7,10,12}` |

The outside triples are five lines of a Fano plane. Distinct triples meet in
one point, so no outside pair is reused. Every row has one cap hit and
therefore satisfies both endpoint and interior cap-hit bounds.

Use period `360` and common edge-lift coordinates

```text
index: 0  1  2  3  4   5   6   7   8   9  10  11  12
edge:  0  5 10 15 20 110 130 150 170 190 210 230 250
```

With the exact off-by-one convention of `openWindowArcCurvature`, all twenty
row arcs are strictly longer than `90`, and every row's open-window budget is
strictly below `360`. Exhaustive enumeration over all period translates finds
maximum nonoverlap cardinality `3`, not `4`.

The replay script is
`scratch/atail-force/exact-five-multirow-curvature/verify_interval_countermodel.py`.

## Consequence

Five cap-centered K4 rows, cap-hit bounds, outside-pair uniqueness, and all
current per-row curvature conclusions do not force the existing aggregate
terminal. A successful extension must add a genuinely cross-row,
order-sensitive nonlinear fact that forces four row arcs into disjoint
boundary sectors. Do not generalize the selected-row curvature interface or
add more row-local curvature lemmas until such a producer is identified.
