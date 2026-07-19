# Period-three reverse-shell aggregate-curvature audit

Date: 2026-07-17

Status: **NEGATIVE ROUTE CORRECTION.  THREE SOURCE-FAITHFUL REVERSE
`2+2` ROWS DO NOT CONTRADICT THE MARGINAL SHELL-CURVATURE INEQUALITIES,
EVEN WHEN ALL THREE ROWS USE ONE SHARED FINITE TURN LEDGER.  DISTINCT
OUTSIDE PAIRS MAY HAVE STRICTLY NESTED MIDDLE ARCS.**

This lane owns only
`scratch/atail-force/period3-curvature-aggregate/`.  It does not edit
production Lean, closure documents, blueprint state, the user-owned
`ConvexCyclicOrder/ShellCurvature.lean`, `surplusM44`, the card-five
cap/mutual-consumer file, or the protected 555/654 lanes.  No Lean or Lake
build was run.

## Theorem-bank preflight

Before testing a new aggregate statement, this audit checked the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed-Lean searches covered three cap-straddling exact `2+2` rows,
period-three aggregate shell curvature, nested outside arcs, and shared
finite angle charts.  The closest hit was the already-known three-row cyclic
subsequence consumer in `Census554`; its named equality/orientation packet is
not produced by the reverse rows.  No banked theorem aggregates the current
shell-curvature outputs or supplies an overlap/coverage theorem for their
outside middle arcs.

Concretely,
`FourPointTwoCircleBisectorOrderBridge.false_of_three_rows_and_cyclic_subsequence`
needs labels `q,u,y,v` with `u,y` in the `q` row, `y,v` in the `u` row, and
`u,v` in the `y` row, in cyclic order `q,u,y,v`.  The reverse period-three
packet provides the three individual exact `2+2` rows but none of the two
cross-row return memberships needed to identify that schema.  The six-point
arc-overtake sibling requires an even larger named shared-incidence packet.

## Current checked input

The checked scratch DAG supplies, on every all-reverse edge `i`:

```text
actual blocker center p_i in the physical cap
same-cap targets      q_i, q_(i+1)
outside-cap targets   x_i, y_i
```

with the following source-faithful facts.

1. The actual critical support is exactly
   `{q_i, x_i, y_i, q_(i+1)}`.
2. In the strict cap order, `p_i` lies between `q_i` and `q_(i+1)`.
3. In the lifted cyclic row window,

   ```text
   p_i < q_(i+1) < x_i < y_i < q_i + N < p_i + N.
   ```

4. The three actual blocker centers are distinct.
5. The three unordered outside pairs `{x_i,y_i}` are distinct.  Equality of
   two pairs is already an immediate contradiction through
   `CapSelectedRowCounting.outsidePair_unique_capCenter`.

For period three the cap-local order is compatible with the checked rational
directed-cycle regression:

```text
q0 < c0 < c2 < q1 < c1 < q2.
```

Thus `c0` straddles `q0,q1`, `c1` straddles `q1,q2`, and `c2` straddles
`q2,q0`.  This cap nesting does **not** impose an order between the three
outside pairs on the complementary boundary chain.

## What one shell contributes

Write `tau(v)` for the exterior turn at a vertex and `mu([x,y])` for the
closed turn sum from the first outside target through the second.  The
current equal-radius shell-curvature theorem gives, for each row,

```text
tau(p_i) + mu([x_i,y_i]) < pi.                         (A_i)
```

Its stronger quarter-turn form says that each outside target lies more than
one quarter-turn from the center in both cyclic directions.  If the two
endpoint apex angles are `a_i,c_i > 0`, the quantitative form is

```text
pi/2 + a_i/2 <= curvature(p_i,x_i), curvature(p_i,y_i)
pi/2 + c_i/2 <= curvature(x_i,p_i+N), curvature(y_i,p_i+N)
tau(p_i) + mu([x_i,y_i]) <= pi - (a_i+c_i)/2.          (B_i)
```

These are per-row **upper** budgets.  Summing `(A_i)` only gives a quantity
strictly below `3*pi`; a contradiction requires an independent shared-chart
lower bound at least `3*pi`.

## Exact shared-ledger compatibility witness

The following single cyclic ledger realizes all three marginal outputs.  All
turns are listed in units of `pi`; hence the total must be `2`.

Use the cyclic vertex order

```text
left, q0, c0, c2, q1, c1, q2, right,
gapBefore, x0, x1, x2, x3, x4, x5, gapAfter, filler0, filler1.
```

Assign exterior-turn weights:

| vertices | weight at each vertex |
|---|---:|
| `left,q0,c0,c2,q1,c1,q2,right` | `1/40` |
| `gapBefore,gapAfter` | `3/5` |
| `x0,x1,x2,x3,x4,x5` | `1/50` |
| `filler0,filler1` | `6/25` |

Every weight is positive and

```text
8*(1/40) + 2*(3/5) + 6*(1/50) + 2*(6/25) = 2.
```

Take the three distinct outside pairs to be strictly nested:

```text
row 0 at c0 : {x0,x5},  middle interval [x0,x5]
row 1 at c1 : {x1,x4},  middle interval [x1,x4]
row 2 at c2 : {x2,x3},  middle interval [x2,x3].
```

The exact lifted role windows are:

```text
c0 < q1 < x0 < x5 < q0+18 < c0+18,
c1 < q2 < x1 < x4 < q1+18 < c1+18,
c2 < q2 < x2 < x3 < q0+18 < c2+18.
```

The middle-plus-center budgets are, exactly,

| row | `tau(center) + mu(middle interval)` |
|---|---:|
| `c0 / [x0,x5]` | `1/40 + 6/50 = 29/200` |
| `c1 / [x1,x4]` | `1/40 + 4/50 = 21/200` |
| `c2 / [x2,x3]` | `1/40 + 2/50 = 13/200` |

All are far below `1`, so all three instances of `(A_i)` hold.

For the four quarter-turn arcs of each row, the normalized values are:

| row | center to first | center to second | first to center+18 | second to center+18 |
|---|---:|---:|---:|---:|
| `c0; x0,x5` | `145/200` | `165/200` | `246/200` | `226/200` |
| `c1; x1,x4` | `134/200` | `146/200` | `257/200` | `245/200` |
| `c2; x2,x3` | `148/200` | `152/200` | `243/200` | `239/200` |

Choose all six endpoint apex-angle parameters equal to `pi/10`.  Then every
required outer lower bound is

```text
pi/2 + (pi/10)/2 = 11*pi/20 = 110*pi/200,
```

and every middle upper bound is

```text
pi - ((pi/10)+(pi/10))/2 = 9*pi/10 = 180*pi/200.
```

The table satisfies all twelve quantitative outer inequalities and all three
quantitative middle budgets strictly.  It uses one shared `18`-vertex turn
measure, three distinct centers, and three distinct outside pairs.  The
outside intervals are not disjoint: they are strictly nested.

This is an exact rational curvature ledger, not a claimed Euclidean
`CounterexampleData` realization.  It is sufficient for the scoped negative
result: no argument that uses only the total `2*pi` turn, positivity, the
three cyclic role windows, pair distinctness, and the scalar conclusions of
the shell-curvature theorems can derive `False`.

## Current chart-interface warning

At the source snapshot inspected here, production
`CounterclockwiseAngleChart.orderedTriple_sign_neg` is still quantified over
all increasing natural-number triples, while the equal-radius wrappers use
`point (p+N) = point p`.  The checked reverse adapter already proves these
two requirements inconsistent.  Therefore the current chart cannot yet be
constructed nonvacuously for even one reverse row.

The compatibility ledger above deliberately addresses the intended repaired
interface: even after the periodic-endpoint bug is fixed and all three rows
share one genuine turn measure, the marginal conclusions still do not close
period three.

The inspected production file had SHA-256
`859efa86438dc949d12c24095376d188fa6428c89167198fff0d742921dca572`.

## Precise missing global field

Let

```text
B_i = {the center turn at p_i} union [x_i,y_i].
```

The three current theorems prove `mu(B_i) < pi`.  An aggregate curvature
consumer needs new information implying

```text
3*pi <= sum_i mu(B_i),                                  (PACK)
```

or a stronger overlap consequence that immediately completes an existing
incidence sink.  Neither straddling, exact `2+2`, pair injectivity, nor the
period-three source order implies `(PACK)`, as the nested ledger shows.

The next missing field should therefore be stated as a **source-indexed
multirow coverage/overlap theorem**, not as another per-row curvature lemma.
It must use data absent from the marginal shell packets, for example the
shared `CriticalShellSystem`, deletion criticality/minimality, or full
cap/MEC placement, to force one of:

1. a checked coverage-multiplicity lower bound strong enough for `(PACK)`;
2. equality of two outside pairs (already terminal);
3. an outside endpoint in another row's erased support together with the
   named dangerous-triple fields required by a U5 sink; or
4. another direct global `False` consequence.

Plain interval interlacing is not enough: distinct interlacing endpoints can
also be placed in an arbitrarily short opposite-curvature cluster.  A useful
field must attach semantic row incidence or a quantitative lower bound to
the overlap.

## Epistemic status

| Claim | Status |
|---|---|
| Exact `2+2` source-faithful cyclic roles for every reverse row | **PROVEN in predecessor scratch** |
| Three distinct blockers and three distinct outside pairs | **PROVEN in predecessor scratch** |
| Current production periodic chart interface is nonvacuously usable | **DISPROVEN in predecessor scratch; source still has the incompatible field at the inspected snapshot** |
| Three marginal shell-curvature packets contradict total curvature | **DISPROVEN at the scalar/interval level by the exact ledger above** |
| The ledger is a Euclidean/full-critical-map realization | **NOT CLAIMED** |
| A shared critical-map coverage or incidence theorem closes period three | **OPEN; this is the next missing global field** |

## Validation scope

- Required theorem-bank and indexed-Lean preflight: **done**.
- Exact arithmetic in the ledger: **replayed with Python `Fraction` only**:

  ```text
  UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
    scratch/atail-force/period3-curvature-aggregate/check_fraction_ledger.py

  PASS: exact period-three marginal curvature ledger
  total_turn=2*pi
  nested_intervals=[x0,x5] > [x1,x4] > [x2,x3]
  c0: outer=(29/40, 33/40, 123/100, 113/100); middle_plus_center=29/200
  c1: outer=(67/100, 73/100, 257/200, 49/40); middle_plus_center=21/200
  c2: outer=(37/50, 19/25, 243/200, 239/200); middle_plus_center=13/200
  outer_lower=11/20*pi; middle_upper=9/10*pi
  ```

  The script asserts positivity, total turn `2*pi`, strict interval nesting,
  pair distinctness, every displayed rational value, all twelve strict outer
  inequalities, and all three strict middle budgets.
- Lean/Lake build: **not run, by lane instruction**.
- Production `sorry` closed: **none**.
