<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Incidence Census Lemma Leads

This note records structural patterns visible in the incidence census generated
by `census/incidence/escape_census.py`.  It is evidence about the combinatorial/token
model only.  It is not a metric feasibility result.

The source table is [`n10-n81-incidence-table.md`](n10-n81-incidence-table.md).
Additional quotienting is recorded in
[`incidence-deduplication.md`](incidence-deduplication.md).

## Closed-Form Patterns

Let

```text
p = n - 9.
```

For `n >= 10`, the cap-vector columns have closed forms:

```text
capVec = floor((p^2 + 6p + 12) / 12)
m44    = 1
two    = floor(p / 2)
three  = capVec - 1 - floor(p / 2)
```

So there is always exactly one `(m,4,4)` cap vector, but it rapidly becomes a
small fraction of all cap vectors.  At `n = 81`, only `1 / 469` unlabeled
cap-size vectors is `(m,4,4)`.

The coarse Moser-apex token rows are linear:

```text
moserTypes = 3 + 5p
newMoser   = 5p
```

Thus the named-placement explosion comes from choosing subsets inside large
caps, not from a complicated growth in token families.

For N8 count-distribution tuples, the same-cap one-hit assumption is high
leverage:

```text
n8SameHit = 3p^2 + 33p + 25.
```

Without the same-cap one-hit bound, the count is cubic for `p >= 2`:

```text
n8Card = (p^3 + 21p^2 + 104p + 40) / 2.
```

The difference is the same-cap-heavy branch.  In incidence terms, this is the
branch where `l <= 1`, `r <= 1`, `m <= 1`, and `s >= 2`.

## Branch Decomposition Of The N8 Surface

The full N8 tuple surface splits into four disjoint covering branches.  Sizes
computed over `n = 9..17` (`p = 0..8`):

```text
 p   total  adjacent-heavy  Moser-pair  same-cap-heavy  terminal  adj%
 0     27         22             4            0             1      81%
 1     84         71             8            4             1      85%
 2    170        146            12           11             1      86%
 3    284        248            16           19             1      87%
 4    428        380            20           27             1      89%
 8   1364       1268            36           59             1      93%
```

Over this range:

- `adjacent-heavy` (`l >= 2` or `r >= 2`) carries 81% -> 93% of tuples, and its
  share rises monotonically.  The total is cubic while the other three branches
  are linear or constant, so the adjacent-heavy share rises toward `1`.
- `Moser-pair` = `4(p + 1)` (linear fit over the computed range).
- `same-cap-heavy` = `8p - 5` for `p >= 2` (linear fit over the computed range);
  this is exactly the branch removed by the one-hit bound.
- `terminal-1111` is exactly `1` for all `p`.  This is not merely a fit: the
  terminal class forces `m, s, l, r <= 1` with sum `>= 4`, so its only member is
  `(1, 1, 1, 1)`.

Reading: escaped incidence mass concentrates almost entirely in the
adjacent-heavy branch, where a selected class reaches one adjacent cap in two or
more points.  Consequently an adjacent one-hit bound (`l <= 1` and `r <= 1`)
removes the entire dominant branch; what survives is the linear Moser-pair and
same-cap tail plus the single terminal row.  In the `(m,4,4)` Q frame with
`s <= 1` and both adjacent hits forced, the survivors are exactly the two Q rows
`(2,0,1,1)` (Moser-pair) and `(1,1,1,1)` (terminal) — see
`four-point-subpacket-plan.md`.

Scope: the `adjacent-heavy -> 1`, `4(p+1)`, and `8p-5` statements are empirical
over `p = 0..8` and follow from the closed forms, which are themselves verified
(not proven for all `n`) in `escape-census-bugcheck.md`.

## Candidate Lemma Directions

### 1. Parametric Moser Escape Classification

The N9 `A/B/C` form census should have a parametric version.  For an apex
opposite cap `Ci`, write:

```text
O = |Ii|
L = left adjacent interior size
R = right adjacent interior size
h = number of own-cap interior points in the selected class.
```

Every escaped Moser-apex class in the incidence model is one of:

```text
2 <= h <= O:
  (h, E, I)
  (h, I, E)
  (h, I, I)

3 <= h <= O:
  (h, 0, I)
  (h, I, 0)
```

This would generalize the N9 form split from fixed named interiors to arbitrary
surplus vector `(e1,e2,e3)`.

### 2. Q-Row Normal Form in an `(m,4,4)` Frame

The current U-lane obligation `(Q)` is not the full surplus-vector census.  It
lives in an `(m,4,4)` frame and concerns a **non-surplus apex** whose K4 witness
class reaches into the surplus cap.

At incidence level, that target has only two essential row shapes.  Let:

```text
Cown      = the short cap opposite the non-surplus apex
Iown      = strict interior of Cown, so |Iown| = 2
Csurplus  = the adjacent surplus cap
Iother    = strict interior of the other short cap
T         = the selected K4 class at the non-surplus apex
```

Assuming the endpoint one-hit bounds used by the N9 core selector, any
Q-relevant escaped class has the form:

```text
T contains both points of Iown,
T meets Csurplus in exactly one surplus-interior point,
T meets the other adjacent short cap in exactly one point, either:

  (Q-E) the adjacent Moser endpoint, or
  (Q-I) one point of Iother.
```

Modulo cyclic/reflection relabelling, the two rows are:

```text
Iown(2) + surplus I + other E
Iown(2) + surplus I + other I
```

This is the clean reduction target:

```text
nonSurplusEscapedClass_cases
```

The proof should be incidence/arithmetic only:

1. `IsM44` gives `|Cown| = 4`, hence `|Iown| = 2`.
2. Endpoint one-hit bounds give at most one selected point on each adjacent
   closed cap.
3. The selected class has size at least `4` by K4.
4. The cap cover puts `T \ Iown` in the two adjacent closed caps.
5. Arithmetic forces `T.card = 4`, `Iown ⊆ T`, and singleton intersections with
   each adjacent closed cap.
6. The Q-specific escape hypothesis says the surplus-side singleton is not the
   shared endpoint but a strict surplus-cap interior point.
7. The other singleton is either the adjacent Moser endpoint or an interior point
   of the other short cap.

This would not prove `(Q)`, but it would isolate the metric obligation sharply:
rule out the two rows above.

### 3. Primitive `3+1` Surplus Escape

Every token row absent at `n = 9` has `h >= 3`.  In particular, it contains a
subconfiguration of the form:

```text
3 own-cap interior points + 1 adjacent-cap interior escape point.
```

This suggests looking for a lemma that either forbids or rigidly controls this
primitive `3+1` packet, rather than treating every larger row separately.

Correction relative to `(Q)`: this `3+1` pattern is about an apex whose **own**
cap is surplus.  It is not the main U-lane `(Q)` target after the `(m,4,4)`
reduction, where the apex is non-surplus and the class escapes into the surplus
cap.  Treat `3+1` as useful for broader surplus-vector bookkeeping, not as the
primary Q reduction.

### 4. N9 Port for `(m,4,4)` Non-Surplus Apices

In an `(m,4,4)` frame, a non-surplus apex still has own interior size `2`.  Its
token shapes are the same `A/B/C` shapes as in N9; the only difference is that
one adjacent interior witness may range over the surplus cap.

This is the most plausible place to port N9 machinery:

```text
N4d -> N4e -> N8
```

adapted to the two size-4 non-surplus caps, not replayed as a finite N9
certificate.

### 5. Same-Cap One-Hit for Surplus Apices

A same-cap bound

```text
sameCapCount <= 1
```

for non-Moser selected apices in a surplus cap would collapse the N8 count
surface from cubic to quadratic.  This may be hard or false, but the table
isolates it as the branch responsible for the extra growth.

### 6. Avoid Full Cap-Vector Case Splits

By `n = 81`, there are 469 unlabeled cap-size vectors, and only one is
`(m,4,4)`.  A proof strategy that case-splits all cap vectors is therefore the
wrong scale.

The table supports a structural route instead:

```text
minimal counterexample -> IsM44
```

or

```text
not IsM44 -> removable vertex / descent.
```

This matches the existing U-lane strategy better than a direct finite replay of
the N9 endpoint.

### 7. Prefer Primitive Four-Point Packets

The later deduplication check shows that full incidence surfaces grow too fast
only if radius classes are kept at their full cardinality.  If a larger
same-radius class can be replaced by a four-point equal-radius subpacket, then
the Moser families collapse to `5` ordered primitive rows, or `3` modulo
left/right reflection, for every `n >= 10`.

Under the same primitive-subpacket convention, the N8 tuple surface becomes
constant after `n = 12`:

```text
n8Prim ordered:     31
n8Prim reflected:   19
```

With the same-cap one-hit assumption, it is already constant after `n = 11`:

```text
n8SamePrim ordered:    21
n8SamePrim reflected:  12
```

So a promising proof-facing normalization is:

```text
radiusClass.card >= 4 -> exists four-point primitive subpacket
```

followed by a finite split over the constant primitive rows.
