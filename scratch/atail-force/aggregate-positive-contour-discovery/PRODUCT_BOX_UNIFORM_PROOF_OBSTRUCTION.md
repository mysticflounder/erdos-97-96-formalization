# Uniform product-box proof audit: the `4n-6` tight-edge bound is false

Date: 2026-07-19

Status: **EXACT ALL-INTEGER COUNTEREXAMPLE TO THE PROPOSED EXTREMAL
BOUND; THE MINIMUM-ROW-DEGREE-FOUR STATEMENT REMAINS OPEN.**

This note is confined to the generic degree-four circular product-box route.
It neither changes production Lean nor claims that the product-box theorem is
false.  Its purpose is to remove one invalid proposed proof route with a
small exact regression.

The existing theorem-bank registries and the indexed Lean corpora were
searched before this audit.  They contain no theorem matching the required
circular product-box comparability or additive-tight-graph statement.

## 1. Dual setup

Let `V = Fin 8` with its standard cyclic order.  For

```text
0 <= i < j <= 7,
```

put

```text
I(i,j) = {i+1,...,j},
```

omitting adjacent pairs and `(0,7)`.  These are the twenty proper circular
intervals modulo complement used by the local Kalmanson basis.

Give every interval weight one, except

```text
w(1,6) = 2,
w(2,5) = 2.
```

Every weight is strictly positive.  Hence

```text
D(c,x) = sum_{I separates c and x} w_I
```

is a strictly positive circular-split metric and is a valid separator metric
in the Gordan-dual formulation.

Take row and target potentials

```text
alpha = ( 0, -5, -9, -5,  0, -5, -9, -5),
beta  = (20, 15, 11, 15, 20, 15, 11, 15).
```

## 2. Exact residual table

Direct integer summation of the twenty split indicators gives the residual
matrix

```text
R(c,x) = D(c,x) - alpha(c) - beta(x)
```

as follows.  Rows and columns are both ordered `0,...,7`.

```text
      0    1    2    3    4    5    6    7
0   -20  -10    0    0   -4    0    0  -10
1   -10  -10    0    2    0    6    8    0
2     0    0   -2    0    0    8   12    8
3     0    2    0  -10  -10    0    8    6
4    -4    0    0  -10  -20  -10    0    0
5     0    6    8    0  -10  -10    0    2
6     0    8   12    8    0    0   -2    0
7   -10    0    8    6    0    2    0  -10
```

Thus the complete off-diagonal additive-tight graph

```text
D(c,x) = alpha(c) + beta(x)
```

has rows

```text
0 : {2,3,5,6}
1 : {2,4,7}
2 : {0,1,3,4}
3 : {0,2,5}
4 : {1,2,6,7}
5 : {0,3,6}
6 : {0,4,5,7}
7 : {1,4,6}.
```

Its row degrees are

```text
(4,3,4,3,4,3,4,3),
```

so it has exactly

```text
4 + 3 + 4 + 3 + 4 + 3 + 4 + 3 = 28
```

nonself tight incidences.

For `n=8`, the proposed bound is

```text
4n - 6 = 26.
```

Therefore `28 > 26` is an exact counterexample to the proposed statement

> Every additive-tight graph of a strictly positive circular-split metric,
> with self incidences omitted, has at most `4n-6` edges.

This verification uses only integer additions and comparisons.  The displayed
residual table is itself a complete replay certificate; no floating-point or
solver soundness assumption remains.

## 3. What this does and does not decide

The counterexample also explains why total-edge maximization is not aligned
with the proof obligation.  Four rows have degree four, but the other four
have degree three.  Consequently it does **not** provide a four-target row
table and does not refute either:

1. the circular product-box comparability theorem; or
2. the more general one-signed interval-flux theorem.

Under a Gordan separator for a genuine four-target table, all four selected
incidences in every row would be additive-tight.  The actually load-bearing
dual statement is therefore the following much weaker extremal assertion.

> **Low-row tightness lemma.**  For every strictly positive circular-split
> metric `D` and potentials `alpha,beta`, the nonself additive-tight graph
> contains a row of degree at most three.

Equivalently, no such tight graph has minimum left degree four.  This lemma
would immediately contradict a full four-target separator, without requiring
any global bound as strong as `4n-6`.

The exact witness above is a mandatory regression for a proof of the low-row
lemma: a valid proof must permit alternating rows of degrees four and three.
In particular, it cannot derive a contradiction merely from the existence of
one degree-four row, from ordinary planarity, or from the total edge count
`4n-6`.

## 4. Historical route proposal, now retired

Before the uniform counterfamily was found, the proof search proposed these
two targets:

1. prove the low-row tightness lemma directly, most plausibly from the strict
   local mixed differences of the residual matrix; or
2. work in the primal circulation space and prove a one-signed interval-flux
   vector without passing through assignment comparability.

Section 6 refutes both remaining targets.  None of these statements should be
used as an induction hypothesis, charging invariant, or documentation claim.

## 5. The diagonal-inclusive zero-count shortcut is false

Subsequent exact discovery produced complete tight graphs with

```text
n = 10: 39 off-diagonal zeros and 0 diagonal zeros,
n = 11: 43 off-diagonal zeros and 1 diagonal zero,
n = 12: 47 off-diagonal zeros and 1 diagonal zero.
```

The card-eleven and card-twelve examples therefore have exactly `4n` zeros
when the diagonal is included, while their off-diagonal counts are exactly
`4n-1`.  The card-twelve example is obtained from the card-eleven support by
retaining all 43 old incidences and adding the four incidences

```text
3 -> 11,  8 -> 11,  11 -> 6,  11 -> 9.
```

All three claims are independently replayed by the exact certificate checker
and the persisted JSON witnesses adjacent to this note.  They initially
suggested a total-zero bound, but a fourth exact card-ten certificate refutes
it:

```text
38 off-diagonal zeros + diagonals {0,3,8} = 41 > 4*10.
```

The complete equality graph, all positive split weights, strict Kalmanson
slacks, and strong connectivity replay exactly from
`tight_additive_graph_n10_total41_witness.json`.  Thus the diagonal-inclusive
`4n` formulation is **REFUTED**, not a surviving conjecture.  It does not
refute the load-bearing off-diagonal `4n-1` target because the witness has only
38 nonself tight arcs.

There is a second, compatible sparsity signal.  Regard the complete tight
graph as bipartite, with one left and one right copy of each carrier.  Exact
enumeration of every left/right vertex subset in the persisted `n=10`,
`n=11`, and `n=12` witnesses verifies

```text
e(L',R') <= 2 * (|L'| + |R'|) - 1
```

for every nonempty induced bipartite subgraph.  The full `n=11` and `n=12`
graphs attain equality.  Thus the witnesses are `(2,1)`-tight in the usual
sparsity terminology.

This does not prove that every additive-tight graph is `(2,1)`-sparse.  It
does, however, identify a precise structural theorem whose full-set case is
the desired off-diagonal `4n-1` bound.  The coefficient is also consistent with a possible
genus-one or Moebius-strip zero-set argument: a quadrangulation-type count
would first give `e <= 2v`, and strict Kalmanson positivity would have to
exclude equality.  No valid embedding or equality-exclusion proof has yet
been constructed, so that topological interpretation must also remain
labelled heuristic.

## 6. Uniform refutation of the surviving targets

The surviving off-diagonal and low-row conjectures are also false.  For every
even `n >= 12`, the construction in
[`TIGHT_GRAPH_UNIFORM_ATTACK.md`](TIGHT_GRAPH_UNIFORM_ATTACK.md) gives a
positive circular-split metric whose complete additive-tight graph has
exactly `4*n` nonloop edges and degree four on both bipartite sides.  The
canonical card-twelve instance is strongly connected and pair-alternating,
has no tight diagonal, and replays with strict Kalmanson slack minima two.

Consequently neither `(2,1)` sparsity nor the suggested topological edge
deficit holds in general.  The product-box/interval-flux route remains useful
only for finite cards below the counterfamily.  A high-card theorem must add
Euclidean realizability, MEC/cap structure, full critical-fiber provenance,
or global minimality from the parent branch.
