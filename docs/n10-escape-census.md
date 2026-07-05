<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# n = 10 Escape Census

This note records the finite combinatorial census computed on 2026-07-05 for the
first surplus case above the closed `n = 9` endpoint.

Scope:

- This is an incidence census, not a metric feasibility census.
- The rows are exhaustive for the token model stated below.
- The rows are not a proof that every row is realizable by a Euclidean convex
  configuration.
- The intended comparison point is the `n = 9` zero-defect `N4c` form census in
  `N9Endpoint/N4e.lean`.

## Generator

The reusable generator is:

```bash
env UV_CACHE_DIR=/tmp/uv-cache uv run python scripts/escape-census.py --families --max-n 20 --n10-detail
```

It prints, in this order:

- the parametric row families for a general surplus vector;
- a finite incidence table for `n = 9..max_n`;
- optionally, the detailed `n = 10` table below.

The finite table columns are:

```text
n              cardinality
surplus        n - 9
capVec         number of unlabeled cap-size vectors
zero/m44/two/three
               number of cap vectors with 0, 1, 2, or 3 surplus caps
moserTypes     distinct coarse Moser-apex token rows for that n
newMoser       token rows absent at n = 9
namedWLOG      named Moser-apex placements, summed over WLOG unlabeled cap vectors
n8Card         N8 (m,s,l,r) tuples with m <= 2
n8SameHit      same, additionally assuming s <= 1
```

The N8 columns are still count-distribution surfaces, not metric feasibility
results.

The generated `n = 10..81` table is stored at
[`n10-n81-incidence-table.md`](n10-n81-incidence-table.md).

Verification run:

```bash
env UV_CACHE_DIR=/tmp/uv-cache uv run python scripts/escape-census.py --families --max-n 81
```

completed successfully on 2026-07-05.  The endpoint row was:

```text
n surplus capVec zero m44 two three moserTypes newMoser namedWLOG n8Card n8SameHit
81      72    469    0   1  36   432        363      360 985050667958439410943747  244820      17953
```

## General Parametric Families

For general `n`, write

```text
|Ci| = 4 + ei,   ei >= 0,   e1 + e2 + e3 = n - 9.
```

Let

```text
Oi = |Ii| = 2 + ei
```

be the strict cap-interior sizes.

For a Moser-apex witness class centered at the apex opposite cap `Ci`, write

```text
O = Oi
L = left adjacent interior size
R = right adjacent interior size
h = number of own-cap interior points in the class.
```

The Moser-apex escape rows are exactly:

```text
For 2 <= h <= O:
  (h, E, I)  with named placements C(O,h) * R
  (h, I, E)  with named placements C(O,h) * L
  (h, I, I)  with named placements C(O,h) * L * R

For 3 <= h <= O:
  (h, 0, I)  with named placements C(O,h) * R
  (h, I, 0)  with named placements C(O,h) * L
```

Consequences:

```text
per fixed apex:             3 + 5*ei token rows
per labeled cap vector:     9 + 5*(n - 9) apex-labelled token rows
fixed n, token-shape union: 3 + 5*(n - 9) token rows
```

For a non-Moser selected apex in cap `Ci`, the N8 count-distribution family is:

```text
(m, s, l, r)

0 <= m <= 2
0 <= s <= Oi - 1       (or s <= 1 under a same-cap one-hit assumption)
0 <= l <= O_left
0 <= r <= O_right
m + s + l + r >= 4
```

with branch classes:

```text
adjacent-heavy: l >= 2 or r >= 2
Moser-pair:     l <= 1, r <= 1, m >= 2
same-cap-heavy: l <= 1, r <= 1, m <= 1, s >= 2
terminal-1111:  remaining cover case
```

## Cap Vector

For any cap triple, the closed-cap identity is

```text
|C1| + |C2| + |C3| = |A| + 3.
```

The `N4a/N4b` lower bounds give `|Ci| >= 4`.  For `n = 10`, the only unlabeled
cap-size vector is therefore

```text
(|C1|, |C2|, |C3|) = (5, 4, 4),
```

up to relabelling.  WLOG below:

```text
|C1| = 5, |C2| = |C3| = 4
|I1| = 3, |I2| = |I3| = 2
```

where `Ii` is the strict interior of cap `Ci`, obtained by deleting the two
Moser endpoints from the closed cap.

## Token Model

For a Moser-apex witness class centered at `vi`, the own cap is the cap opposite
`vi`.  The two adjacent closed caps can contribute:

```text
0 = no hit on that adjacent side
E = the adjacent Moser endpoint
I = one adjacent cap interior point
```

The one-hit bounds permit at most one selected-class point on each adjacent
closed cap.  A row is an escape row when at least one adjacent side contributes
`I`, i.e. the witness class is not contained in its opposite cap.

The column `named placements` counts concrete choices of the interior point
names under the fixed layout

```text
I1 = {a1, b1, c1}
I2 = {a2, b2}
I3 = {a3, b3}.
```

## Moser-Apex Census

### Surplus Apex

For the apex `v1` opposite the surplus cap `C1`, the own cap interior is `I1`
with three points.

```text
own I1 hits   C2   C3   class size   named placements   status
2             E    I    4            6                  N9-token, omits one surplus interior
2             I    E    4            6                  N9-token, omits one surplus interior
2             I    I    4            12                 N9-token, omits one surplus interior
3             0    I    4            2                  new surplus type
3             I    0    4            2                  new surplus type
3             E    I    5            2                  new surplus type
3             I    E    5            2                  new surplus type
3             I    I    5            4                  new surplus type
```

Totals:

```text
8 token types
36 named placements
```

The new behavior already visible at `n = 10` is the row family with all three
surplus-cap interior points present.  In particular, the one-sided escapes
`(3, 0, I)` and `(3, I, 0)` have no `n = 9` analogue.

### Short Apices

For either short apex, opposite `C2` or `C3`, the own cap interior still has two
points.  One adjacent cap is the surplus cap and the other adjacent cap is short.

```text
surplus adjacent   short adjacent   class size   named placements per apex
E                  I                4            2
I                  E                4            3
I                  I                4            6
```

Totals:

```text
3 token types per short apex
11 named placements per short apex
22 named placements across both short apices
```

### Moser-Apex Total

Across the three Moser apices:

```text
58 named placements
```

This total is at incidence resolution.  It does not quotient by additional
metric coincidences or split by ordered-cap position beyond the named interior
points above.

## N8 Count-Distribution Surface

For a non-Moser selected apex `x` in cap `i`, the N8 grouping surface records

```text
(m, s, l, r)
```

where:

```text
m = selected Moser vertices
s = selected same-cap interior points, excluding x
l = selected left-adjacent interior points
r = selected right-adjacent interior points
```

The N8 cover budget is `m + s + l + r >= 4`.  The closed `n = 9` proof routes
by adjacent-heavy cases, Moser-pair cases, and the terminal `(1,1,1,1)` case.

For `n = 10`, under cardinality bounds plus `m <= 2`, but allowing a surplus
same-cap count of `s = 0,1,2`, the surface is:

```text
unique tuples: 84

branch class        count
adjacent-heavy      71
Moser-pair          8
same-cap-heavy      4
terminal-1111       1
```

If one additionally assumes a same-cap one-hit bound on the surplus cap
(`s <= 1` also for the surplus-cap apex), the surface becomes:

```text
unique tuples: 61

branch class        count
adjacent-heavy      56
Moser-pair          4
terminal-1111       1
```

The second table is conditional on the surplus same-cap one-hit assumption.  The
first table is the safer purely cardinality-level N8 surface.

## n = 10 Reproducibility

For `n = 10`, the general formula gives the unique unlabeled surplus vector

```text
(e1, e2, e3) = (1, 0, 0),
```

which is the `(5,4,4)` cap vector above.

The Moser-apex table is generated by:

```text
own_count in 0..|Ii|
left_token, right_token in {0,E,I}
class_size = own_count + (left_token != 0) + (right_token != 0)
class_size >= 4
escape iff left_token = I or right_token = I
```

with the additional `n = 10` cap-interior sizes

```text
|I_surplus| = 3, |I_short| = 2.
```
