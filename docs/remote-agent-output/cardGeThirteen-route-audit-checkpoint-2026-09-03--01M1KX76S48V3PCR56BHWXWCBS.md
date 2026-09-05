# `cardGeThirteen` route audit checkpoint — 2026-09-03

## Live target

Current source audit gives the target

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen
```

with `12 < D.A.card`, a robust post-card-eleven surface, two disjoint
`SelectedFourClass` rows centered at `S.oppApex2` with distinct radii, and a
universal no-five-radius-class hypothesis at that center.

## Refuted routes

### 1. Proper-subset / induced-counterexample reduction

This route is not available. There is no transport of `CounterexampleData`,
`Minimal`, `K4`, `CriticalShellSystem`, `SurplusCapPacket`, cap interiors, or
deletion witnesses to an arbitrary proper subcarrier. Minimality explicitly says
that a proper nonempty deletion loses the global K4 property.

A partial-label variant also fails for the current finite formula: its first
non-hereditary family is `k4_everywhere`, which chooses a four-point witness
inside the labelled carrier for every label. Ambient K4 does not put those four
points in a chosen 13- or 14-label image. The blocker family then recursively
requires the blocker center and its exact row to be labelled. A successful local
reduction therefore needs a new bounded support/blocker-closure theorem.

### 2. Arithmetic cap-growth reduction

The source-clean cap constraints do not bound the carrier. With

```text
s  = |surplusCap|,
o1 = |oppCap1|,
o2 = |oppCap2|,
```

we have `s+o1+o2=n+3`, `s>=5`, `o1>=4`, `o2>=6`, together with the
three-way `capGrowth` split. For every sufficiently large `n`, each of

```text
(n-7, 4, 6),  (5, n-8, 6),  (5, 4, n-6)
```

satisfies one branch exactly. Thus no threshold reduces the problem to finitely
many cardinalities using the current arithmetic alone.

### 3. Two-radii geometry alone

Two distinct four-point distance classes about one hull vertex are not by
themselves contradictory: strict convexity is open under small radial
perturbations of points on a common short circular arc, so any prescribed
four/four radial interleaving can be realized. Any proof must use the MEC-cap,
blocker/deletion, or additional selected-row data.

## New exact card-14 contradiction

For the authenticated maximal `firstOppositeO1Six` Boolean model, the cyclic
order is

```text
[1,3,4,5,0,6,7,8,9,2,10,11,12,13].
```

The compressed distance components include

```text
C2:  0-9 = 0-10,
C5:  6-10 = 6-12,
C8:  1-9 = 1-12.
```

Strict convex Kalmanson inequalities for the ordered quadruples
`(1,0,9,10)` and `(1,6,10,12)` give

```text
d(1,9)+d(0,10) > d(1,10)+d(0,9),
d(1,10)+d(6,12) > d(1,12)+d(6,10).
```

After the row equalities, these become

```text
d(1,9) > d(1,10) > d(1,12) = d(1,9),
```

an exact contradiction. This uses six labels, three selected-row equalities,
and two Kalmanson inequalities; the QF_NRA `UNKNOWN` is unnecessary for this
model.

The generic theorem shape is:

```text
rows centered at a,b,c contain respectively {x,y}, {y,z}, {x,z};
cyclic orders c<a<x<y and c<b<y<z;
therefore False.
```

This should map to the existing six-role/two-K2/three-row Kalmanson terminal.

## New closure program

1. Add the six-role no-good for every occurrence in each card-14 structural
   profile and rerun CEGAR. Rejecting one model is not all-model coverage.
2. Mine each new survivor for the same two-K2 terminal or another small exact
   Kalmanson cancellation.
3. Promote the resulting finite motif bank only after proving a source
   occurrence theorem.
4. For arbitrary cardinality, the missing theorem is not a subset reduction but
   a bounded local-occurrence theorem: the live ingress/blocker/cap packet must
   force one of the banked Kalmanson motifs. Pure cap arithmetic, abstract
   support connectivity, and an unbounded blocker cycle do not suffice.

## Current uncertainty

The maximal card-14 model is refuted exactly. Other card-14 models/profiles and
the full arbitrary-cardinality leaf are not yet covered. The next decisive test
is the all-profile CEGAR rerun with the two-K2 no-good bank.

## Universal two-Kalmanson no-good

A cleaner occurrence uses only ordinary selected rows.  For six cyclic roles
`a,b,c,d,e,f`, the forbidden membership pattern is

```text
row(a) contains d,e;
row(b) contains c,d;
row(f) contains c,e.
```

Kalmanson on `(a,b,c,d)` and `(a,c,e,f)` gives respectively

```text
d(a,c) > d(a,d),
d(a,e) > d(a,c),
```

while the row at `a` gives `d(a,d)=d(a,e)`.  Hence the pattern is impossible.
The corresponding CNF no-good is

```text
¬hit(a,d) ∨ ¬hit(a,e) ∨ ¬hit(b,c) ∨ ¬hit(b,d) ∨ ¬hit(f,c) ∨ ¬hit(f,e).
```

For `n=14`, enumerating every cyclic 6-subset, its six rotations, and both
orientations gives exactly 36,036 distinct width-six clauses.  An independent
exact enumeration found 20 violated clauses in the authenticated maximal model,
including the occurrence

```text
(a,b,c,d,e,f) = (1,3,4,6,9,10).
```

The rank-order clause-family SHA-256 is
`1d2502192c18e870174eaa7f6140591f4321f9a02f99fc158a466da4f6ee0699`.
This is a universal geometric no-good, but the current evidence checks it only
against one authenticated maximal assignment.  Full profile closure still
requires rerunning CEGAR with the whole clause family.

## Candidate finite-cardinality reduction under source audit

There is a promising new route that combines, rather than replaces, cap growth
with ordered-cap selected-row counting.  If
`orderedCap_card_add_four_le_choose_outside` is available for the cap selected
in each `surface.capGrowth` arm, then the three exact growth profiles give:

```text
surplus growth:        |C| + 7 = n, outside=7, |C|+4 <= C(7,2),  so n <= 24;
first-opposite growth: |C| + 8 = n, outside=8, |C|+4 <= C(8,2),  so n <= 32;
second-opposite growth:|C| + 6 = n, outside=6, |C|+4 <= C(6,2),  so n <= 17.
```

Thus a source-clean instantiation would prove `n <= 32` and turn the
arbitrary-cardinality leaf into a finite `13 <= n <= 32` campaign without
forming a smaller counterexample.  A further endpoint-row count may sharpen the
first two bounds to 21 and 29, but that requires a generic outside-pair
uniqueness theorem for one additional selected row at the same endpoint.

This cardinality argument is mathematically exact conditional on the ordered-cap
counting theorem's source ingress.  The remaining audit point is whether the
live `SurplusCapPacket` supplies the required `OrderedCap`, MEC side/order data,
and faithful selected-row pattern for each growth cap, not merely for one
specially selected cap.
