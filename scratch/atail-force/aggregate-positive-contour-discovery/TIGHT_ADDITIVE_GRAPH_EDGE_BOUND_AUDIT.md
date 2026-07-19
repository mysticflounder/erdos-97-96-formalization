# Gordan-dual additive tight-graph edge-bound audit

Date: 2026-07-19

Status: **ALL PROPOSED UNIVERSAL EDGE-COUNT AND LOW-ROW TARGETS ARE REFUTED.
AN EXPLICIT DEGREE-FOUR COUNTERFAMILY EXISTS FOR EVERY EVEN `n >= 12`.**

This is scratch theorem-discovery work.  It changes no production Lean,
imports no solver certificate, and closes no source `sorry`.

## 1. Exact dual object

Let `V = Fin n` have its standard cyclic order.  Index proper circular
intervals modulo complement by

```text
I(i,j) = {i+1,...,j},
0 <= i < j < n,
j != i+1,
(i,j) != (0,n-1).
```

For strictly positive rational weights `w_I`, define

```text
D_w(c,x) = sum_{I separates c and x} w_I.
```

Given left and right potentials `alpha,beta`, call a nonloop directed
incidence `(c,x)` **additive-tight** when

```text
D_w(c,x) = alpha_c + beta_x.
```

This is exactly the Gordan separator in
[`INTERVAL_FLUX_NORMAL_FORM.md`](INTERVAL_FLUX_NORMAL_FORM.md): a selected
four-target row table can survive all positive interval-flux contours only if
all `4*n` selected incidences lie in such an additive-tight graph.

The theorem-bank registry and indexed Lean search were checked before this
audit.  The search found the existing strict Kalmanson producers in
`ATail.CapCrossingKalmanson`, but no extremal theorem about these additive
tight graphs.

## 2. Exact counterexample to `|E| <= 4*n-4`

The proposed universal bound is false already on `Fin 10`.
[`tight_additive_graph_n10_counterexample.json`](tight_additive_graph_n10_counterexample.json)
contains:

- 35 strictly positive integer split weights;
- integer potentials `alpha,beta`; and
- the **complete** nonloop equality graph for those values.

The graph has

```text
|E| = 39 > 4*10-4 = 36.
```

Its left and right degree sequences are

```text
left  = [4,4,4,4,4,4,3,5,4,3],
right = [4,4,5,3,4,4,5,2,5,3].
```

It is strongly connected as a directed graph on the underlying ten labels.
Thus disconnected stars or a bad sink reduction are not responsible for the
failure.

The independent verifier in
[`tight_additive_graph_bound_audit.py`](tight_additive_graph_bound_audit.py)
recomputes every split distance over `Fraction`, enumerates the complete
equality graph, and checks all `2 * choose(10,4)` strict Kalmanson slacks.  It
reports minimum slack `2` in both Kalmanson families:

```bash
uv run python \
  scratch/atail-force/aggregate-positive-contour-discovery/tight_additive_graph_bound_audit.py \
  --verify-certificate \
  scratch/atail-force/aggregate-positive-contour-discovery/tight_additive_graph_n10_counterexample.json
```

This is an exact rational counterexample, not a floating-model inference.

The same phenomenon repeats at card eleven.
[`tight_additive_graph_n11_4n_minus_1_witness.json`](tight_additive_graph_n11_4n_minus_1_witness.json)
contains 43 exactly replayed tight edges, so

```text
|E| = 43 = 4*11-1.
```

Its two strict-slack minima are again `2`, and its directed label graph is
strongly connected.  The left degree sequence is

```text
[4,4,4,3,6,2,4,5,4,3,4].
```

Use the same verifier command with the `n11` JSON path to replay it.  Moreover,
the card-eleven witness extends exactly to the 47-edge card-twelve certificate
[`tight_additive_graph_n12_4n_minus_1_witness.json`](tight_additive_graph_n12_4n_minus_1_witness.json):

```text
|E| = 47 = 4*12-1.
```

It is again strongly connected, has strictly positive integer weights, and
has minimum slack `2` in both Kalmanson families.  A separate unconstrained
600-second maximization had found only 46 edges before timing out; the exact
extension query shows why that timed-out incumbent was not an upper bound.

### Consequence

Planarity, bipartite-planarity, or any other argument whose endpoint is
`|E| <= 4*n-4` cannot close the aggregate Gordan lane.  The witness does **not**
refute the desired all-row-four theorem: two left rows have degree three.

It also leaves one potentially sharp total-count target alive:

```text
|E| <= 4*n-1.
```

That bound would still exclude a selected table with exactly `4*n` edges,
and the independently replayed `n=10`, `n=11`, and `n=12` witnesses all attain
equality.  This repeated saturation is positive evidence, not a proof.  No
generic proof or counterexample to `4*n-1` is known.

## 3. The upper/lower forest decomposition is false

A second proposed proof split was to partition edges by `c<x` and `c>x` and
prove each half acyclic.  The upper half is already cyclic on `Fin 6`.
Take the six edges

```text
0 -> {4,5},
1 -> {3,5},
2 -> {3,4}.
```

In the standard nine-interval order

```text
(0,2),(0,3),(0,4),
(1,3),(1,4),(1,5),
(2,4),(2,5),(3,5),
```

the positive weights and potentials

```text
w     = [1,4,1,1,1,1,1,1,1],
alpha = [0,6,3,0,0,0],
beta  = [0,0,0,0,6,3]
```

make all six displayed edges additive-tight.  They form the alternating
six-cycle

```text
0 - 4 - 2 - 3 - 1 - 5 - 0
```

inside the upper half.  Direct rational replay checks all six equalities and
positivity of every split weight.  Therefore neither half is a forest, and
the proposed `2*n-3`-per-half proof is unavailable.

The failure is not merely one small anomaly.  Exact reconstructions from the
half-graph maximizer already give 17 upper and 17 lower tight incidences at
`n=8`; HiGHS reports those two finite maximizations optimal, although that
optimality has no imported proof certificate.

## 4. Correct remaining theorem surfaces

The diagonal-inclusive reformulation was tested and refuted below.  Two
off-diagonal dual statements remain meaningful afterward.

### Total-zero version is also false

The diagonal equation is

```text
D_w(c,c) = 0 = alpha_c + beta_c.
```

Counting these diagonal equalities together with the directed nonloop edges
suggested the cleaner pair of assertions

```text
the total equality count is at most 4*n;
if the total count is exactly 4*n, at least one equality is diagonal.
```

Together they would imply the needed off-diagonal bound `|E| <= 4*n-1`.
However, the first assertion is false.  The exact certificate
[`tight_additive_graph_n10_total41_witness.json`](tight_additive_graph_n10_total41_witness.json)
has

```text
38 off-diagonal equalities + diagonals {0,3,8} = 41 > 4*10.
```

The verifier enumerates the complete off-diagonal equality graph, detects
those three and only those three tight diagonals, checks strong connectivity,
and reports minimum slack `2` in both strict Kalmanson families.  Thus this is
an exact rational refutation, not a failed optimization bound.

For comparison, the other exact certificates have

```text
n=11: 43 off diagonal + 1 diagonal = 44 = 4*n,
n=12: 47 off diagonal + 1 diagonal = 48 = 4*n.
```

The diagonal-inclusive reformulation therefore supplies useful regressions
but no viable bound.  The off-diagonal `4*n-1` statement remains logically
unrefuted because the 41-total-zero witness has only 38 off-diagonal edges.

Three exact QF-LRA searches for `4*n+1` total zeros at `n=8,9,10` all returned
`UNKNOWN` after 300 seconds.  Three searches for `4*n` off-diagonal edges with
all diagonal equalities forbidden likewise returned `UNKNOWN` at `n=8,9,10`.
These timeouts neither support nor refute a theorem; their statistics are
logged by the audit script.  They are recorded only to prevent a future lane
from silently treating these finite surfaces as decided.

### Total-edge version is false

```text
Every positive circular-split additive-tight graph on Fin n
has at most 4*n-1 nonloop directed edges.
```

This is refuted by the uniform family in
[`TIGHT_GRAPH_UNIFORM_ATTACK.md`](TIGHT_GRAPH_UNIFORM_ATTACK.md), which has
exactly `4*n` nonloop tight incidences for every even `n >= 12`.

### Row-local version is false

```text
Every positive circular-split additive-tight graph on Fin n
has a left row of degree at most three.
```

The same uniform family has degree four in every left and right row, is
strongly connected and pair-alternating, and therefore refutes this statement
on the exact aggregate surface.

The existing local-basis integrated decisions give external exact-arithmetic
`UNSAT` for complete four-target tables at cards eight, nine, and ten.
Card eleven remains `UNKNOWN` under the recorded 600-second portfolios.  In
this audit, 180-second HiGHS searches with minimum left degree four at cards
ten through twelve found no incumbent, but those timeouts are not decisions.

The 39-edge witness was also tested against its nearest exact repair surface:
delete one of its five row-7 incidences and add one missing incidence to each
of the two degree-three rows.  All 180 resulting fixed 40-edge supports are
exact-QF_LRA `UNSAT`.  This is a local neighborhood result only, not a
card-ten coverage theorem.

## 5. A useful exact normalization for a proof attempt

Put

```text
p_v     = (alpha_v + beta_v)/2,
gamma_v = (alpha_v - beta_v)/2,
S(c,x)  = D_w(c,x) - p_c - p_x.
```

Then `S` is symmetric and the tight-edge equation becomes

```text
c -> x is tight  iff  S(c,x) = gamma_c - gamma_x.       (1)
```

This identity is purely algebraic.  In particular, if both orientations of
an unordered pair are tight, then `gamma_c = gamma_x` and `S(c,x)=0`.
Therefore the bidirected part splits into `gamma`-level graphs, while every
single directed edge runs between levels and has its direction fixed by the
sign in `(1)`.

For the exact 39-edge witness, the bidirected pairs have two nontrivial
components on label sets

```text
{0,2,4,6,8},
{1,3,5,9},
```

with label `7` isolated in the bidirected subgraph.  There are 11 bidirected
unordered pairs and 17 singly directed pairs, hence `2*11+17=39` directed
edges.  This symmetric/antisymmetric decomposition survives both mandatory
regressions and is a more faithful starting point than upper/lower forests.

The uniform even-card construction shows that no global strict-Kalmanson
argument can prove either `|E| <= 4*n-1` or the low-row conclusion without
additional parent hypotheses.

## 6. Epistemic conclusion

- `|E| <= 4*n-4`: **REFUTED BY AN EXACT RATIONAL `n=10` COUNTEREXAMPLE**.
- upper-half and lower-half forest lemmas: **REFUTED BY AN EXACT RATIONAL
  `n=6` CYCLE**.
- exact 39-edge witness replay, strict slacks, and connectivity:
  **EXACTLY VERIFIED**.
- exact 43-edge card-eleven `4*n-1` witness replay, strict slacks, and
  connectivity: **EXACTLY VERIFIED**.
- exact 47-edge card-twelve `4*n-1` witness replay, strict slacks, and
  connectivity: **EXACTLY VERIFIED**.
- `|E| <= 4*n-1`: **REFUTED BY AN EXACT DEGREE-FOUR CARD-TWELVE
  COUNTEREXAMPLE AND A SYMBOLIC ALL-EVEN FAMILY**.
- total zero count `<= 4*n`: **REFUTED BY AN EXACT CARD-TEN WITNESS WITH
  41 TOTAL ZEROS**.
- existence of a left row of degree at most three: **REFUTED BY THE SAME
  UNIFORM FAMILY**.
- generic aggregate A-tail closure: **NOT ESTABLISHED; NO `sorry` CLOSED**.
