# `cardGeThirteen` closure-route checkpoint

**Date:** 2026-09-03  
**Original blocked checkpoint:** `3589c08c0`  
**Live leaf:** `Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`  
**Machine-readable certificate:** `cardGeThirteen-card14-kalmanson-certificate-2026-09-03.json`  
**Certificate SHA-256:** `9cf470b3880eca078342de4f86300422f9b25e4c9e431ca87f9d1aadacccebad`

## Executive result

The original bounded-subcarrier route is not sound at the current interface, but the authenticated maximal card-14 Boolean survivor is now **exactly refuted** without coordinates, nonlinear arithmetic, or an SMT decision.

The refutation is a three-row, six-role Kalmanson triangle. It uses only:

1. one cyclic order on six named carrier points;
2. three selected-row equalities; and
3. two strict convex-quadrilateral Kalmanson inequalities.

An independent scan found 170 opposite-vector two-Kalmanson certificates in the same equality quotient and 20 support-level occurrences of the universal six-role no-good. The model is therefore not a near-realization: it is deeply incompatible with convex Euclidean distance order.

This kills one authenticated assignment. It does **not yet** prove the whole card-14 profile or the arbitrary-cardinality Lean leaf.

## 1. Exact refutation of the maximal card-14 assignment

The authenticated cyclic order is

```text
1 < 3 < 4 < 5 < 0 < 6 < 7 < 8 < 9 < 2 < 10 < 11 < 12 < 13
```

Use the six roles

```text
a = 1, b = 3, c = 4, d = 6, e = 9, f = 10.
```

They occur cyclically as

```text
a < b < c < d < e < f.
```

The selected four-point rows contain:

```text
row(a=1)  = {6,7,9,12}, so d(1,6) = d(1,9);
row(b=3)  = {4,6,11,13}, so d(3,4) = d(3,6);
row(f=10) = {4,8,9,11}, so d(10,4) = d(10,9).
```

For four vertices `x₀ < x₁ < x₂ < x₃` in strict convex cyclic order, the crossing-diagonal sum is strictly larger than either noncrossing opposite-pair sum.

Apply this to `(1,3,4,6)`:

```text
d(1,4) + d(3,6) > d(1,6) + d(3,4).
```

Cancel `d(3,6)=d(3,4)`:

```text
d(1,4) > d(1,6).                                  (A)
```

Apply the other Kalmanson comparison to `(1,4,9,10)`:

```text
d(1,9) + d(4,10) > d(1,4) + d(9,10).
```

Cancel `d(4,10)=d(9,10)`:

```text
d(1,9) > d(1,4).                                  (B)
```

The row at center `1` gives

```text
d(1,6) = d(1,9).                                  (C)
```

Combining (A), (B), and (C):

```text
d(1,4) > d(1,6) = d(1,9) > d(1,4),
```

a contradiction.

### Existing generic sink

This is the literal three-selected-row/two-Kalmanson six-role pattern already represented in the theorem bank, nearest to:

```text
Problem97.CapCrossingKalmansonBridge.false_of_six_ccw_two_k2_three_selected_rows
```

and its occurrence/reflection wrappers. The geometric theorem is not the missing work. The work is source occurrence or finite-CNF coverage.

## 2. Universal no-good

For cyclic roles

```text
a < b < c < d < e < f,
```

the impossible row-incidence pattern is:

```text
{d,e} ⊆ row(a),
{c,d} ⊆ row(b),
{c,e} ⊆ row(f).
```

At support-membership level:

```text
¬hit(a,d) ∨ ¬hit(a,e) ∨
¬hit(b,c) ∨ ¬hit(b,d) ∨
¬hit(f,c) ∨ ¬hit(f,e).
```

Because the structural encoder already carries distance-equality variables, the same cut can be emitted more economically as a three-literal equality clause:

```text
¬Eq(d(a,d), d(a,e)) ∨
¬Eq(d(b,c), d(b,d)) ∨
¬Eq(d(f,c), d(f,e)).
```

For `n=14`, the support-level generator has:

- 36,036 unique clauses;
- 12 clauses per cyclic six-subset;
- family SHA-256 in rank order  
  `1d2502192c18e870174eaa7f6140591f4321f9a02f99fc158a466da4f6ee0699`;
- 20 violated clauses in the maximal model.

This family is tiny compared with the 12,837,786-clause card-14 formula.

## 3. Routes that are now refuted

### 3.1 Induced smaller counterexample

A proper subset can retain the two explicit selected rows and convex independence, but it cannot inherit the complete `CounterexampleData`/K4/minimality/cap/frontier packet.

The decisive obstruction is that minimality proves every nonempty proper subset fails the global four-equidistant property. Closing a subset under all selected shells instead forces it back to the entire carrier. Thus an induced `CounterexampleData` of size 13 or 14 is not a valid reduction.

### 3.2 Partial exact-13/14 label map

A partial injective label map preserves local equalities and order, but not the first universal positive encoder family:

```text
k4_everywhere.
```

For a retained label, its ambient four-point witness may use omitted carrier points. The blocker family then recursively requires further unlabeled centers and supports. `LabelMap.image_eq` is therefore load-bearing in the current exact-cardinality ingress.

A partial map is sound only for a bounded local terminal such as the six-role theorem above—not for replaying the full exact-13/14 CNF.

### 3.3 Cardinality growth alone

The cap-sum and `capGrowth` arithmetic admit unbounded numerical families. For example, the profiles

```text
(5, n-8, 6)
```

in the first-opposite growth arm satisfy the current arithmetic conditions for arbitrarily large `n`. Hence there is no global “large enough cap” cutoff from the present profile inequalities alone.

The second-opposite arm is different: its profile is `(5,4,n-6)`, so the large cap has a six-point complement. If the general ordered-cap pair-count theorem is instantiated on that opposite cap, then

```text
(n-6)+4 ≤ choose(6,2)=15,
```

and therefore `n≤17`. This is a promising branch reduction, but its opposite-cap adapter still needs a source-level check before being promoted.

### 3.4 Bare blocker-cycle argument

The blocker map has no fixed points and hence a periodic orbit, but the exported interface supplies no strictly decreasing cap index, boundary ordinal, radius, apex distance, or deletion rank along blocker edges.

A 14-cycle abstract row system satisfies the available row-cardinality, center-exclusion, source-membership, pair-codegree, row-intersection, and support-minimality properties. Therefore a cycle is not itself a contradiction. A successful cycle proof must first convert some blocker edges into strict Kalmanson/ordinal comparisons.

### 3.5 Two disjoint apex rows by themselves

Two disjoint four-point radius classes at one hull vertex are locally realizable in strict convex position. Thus no proof using only the two supplied rows, their disjointness, and convexity can close the branch. The global K4/source/deletion system is essential.

## 4. New closure route

### Stage A — exact geometric CEGAR for card 14

1. Add every direct/reflected instance of the six-role equality clause.
2. Re-run all six card-14 structural profiles.
3. For each SAT survivor:
   - quotient all distance equalities;
   - enumerate all strict Kalmanson inequalities;
   - detect two-inequality opposite vectors first;
   - otherwise solve the homogeneous rational Kalmanson LP;
   - minimize an exact Farkas certificate;
   - add only the row equalities used by the certificate as a new no-good.
4. Repeat until the profile is UNSAT or a Kalmanson-feasible assignment survives.

No NRA call belongs before this loop is exhausted.

### Stage B — heredity/core audit

For each profile that becomes UNSAT, record whether the final core uses:

- exact total cardinality;
- exact cap sizes;
- universal `k4_everywhere`;
- global blocker coverage; or
- only a bounded local set of rows, lower-bound cap memberships, and order clauses.

A bounded local core becomes a candidate arbitrary-cardinality source theorem. A core using exact cap exhaustion closes only that finite profile.

### Stage C — arbitrary-cardinality source target

Define an ambient, non-surjective occurrence packet:

```text
ThreeRowKalmansonTriangleOccurrence D
```

containing six distinct carrier points in cyclic order and three selected rows with the three pair memberships above. Then prove:

```text
ThreeRowKalmansonTriangleOccurrence D → False
```

by the existing theorem bank.

The real arbitrary-cardinality obligation becomes an occurrence dichotomy from the live two-radius packet. Current source does not yet force the three pairwise row intersections, so this producer remains the mathematical frontier. It must use more than incidence counting—most plausibly the common-deletion packet, cap order, or a blocker-edge-to-ordinal comparison.

## 5. Current verdict

- **Bounded-subcarrier route:** refuted.
- **Partial full-CNF label route:** refuted.
- **Cap arithmetic as a complete cutoff:** refuted.
- **Bare blocker-cycle route:** refuted.
- **Maximal card-14 Boolean witness:** exactly refuted.
- **Whole card-14 profile:** not yet proved; exact CEGAR rerun required.
- **All `card ≥ 13`:** not yet proved.
- **Best new route:** structural SAT plus exact Kalmanson certificate CEGAR, followed by a heredity audit to expose the smallest ambient occurrence theorem.

## 6. Ambient eight-source blocker packet: the best arbitrary-cardinality extraction

There is a stronger bounded extraction that does **not** form a smaller
counterexample and therefore avoids the heredity failure.

Let `Kρ` and `Kσ` be the two disjoint exact four-point classes at
`S.oppApex2`.  Retain, in the original ambient carrier:

- the eight sources in `Kρ.support ∪ Kσ.support`;
- the actual blocker of each source;
- one selected four-row at each distinct blocker; and
- only the support points of those blocker rows.

This packet is uniformly finite even when `D.A` is arbitrarily large: there
are eight sources, at most eight distinct blockers, and at most 24 additional
row-support roles before identifications.

Two source-faithful reductions should be proved before any new search:

1. **No source uses the second apex as its blocker.**  Deleting a point of
   `Kρ` leaves the disjoint class `Kσ` intact at `S.oppApex2`, and conversely.
   Hence the deletion-blocking center for any of the eight sources cannot be
   `S.oppApex2`.
2. **Each blocker row meets each apex class in at most two points.**  Package
   the blocker row as a `SelectedFourClass`; its center differs from
   `S.oppApex2`, so the existing two-distinct-circles/intersection bound gives
   `card (blockerRow ∩ Kρ.support) ≤ 2` and likewise for `Kσ`.

Consequently every size-four blocker fiber has type exactly `2+2` across the
two apex classes, every size-three fiber has type `2+1` or `1+2`, and the
partition of the eight sources into actual-blocker fibers has finitely many
combinatorial types.

This does not by itself force the six-role Kalmanson triangle: abstract
triangle-free row systems satisfying the cardinality and intersection bounds
exist.  The next falsifiable campaign is nevertheless finite and
source-faithful: enumerate blocker-fiber types and induced cyclic-order cells,
then close them with the same exact Kalmanson-certificate loop.  A surviving
cell would precisely identify which additional deletion/minimality field is
needed; universal infeasibility would give an ambient arbitrary-cardinality
terminal, with no use of exact `D.A.card` and no restriction of the carrier.

This is currently the most credible route from the finite card-14 discovery
to the full `cardGeThirteen` theorem.
