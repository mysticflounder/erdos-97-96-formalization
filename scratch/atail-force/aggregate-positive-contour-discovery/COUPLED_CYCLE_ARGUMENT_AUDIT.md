# Coupled-cycle proof-attempt audit

Date: 2026-07-18

Status: **THREE CANDIDATE ARGUMENTS TESTED.  NONE IS COMPLETE.  EACH FIRST
UNJUSTIFIED STEP IS ISOLATED, WITH AN EXACT FINITE REGRESSION.**

This audit concerns only the one-signed circular interval-flux lemma from
[`INTERVAL_FLUX_NORMAL_FORM.md`](INTERVAL_FLUX_NORMAL_FORM.md).  It changes no
production Lean and closes no source `sorry`.

## Common notation

For a balanced incidence circulation `u`, write

```text
F(u) = (F_I(u))_I
```

for its outward flux over the nontrivial circular intervals modulo
complement.  The target is a nonzero `u` for which, after one global sign,
`F_I(u) <= 0` for all `I`.

The two mandatory regressions are:

1. **schema 4 partial core:** two individually mixed four-cycles whose
   opposite coupling is one-signed; and
2. **W(3,3) seed 1:** a high-girth eight-cycle whose flux is already
   one-signed.

The exact integer profiles used below are replayed by
[`test_assignment_comparability.py`](test_assignment_comparability.py).

## Attempt A: lexicographically minimal cycle and local uncrossing

### Candidate argument

Choose an oriented simple cycle of the center/target incidence graph with
lexicographically minimal positive-flux support.  If its flux is mixed, find
a second mixed cycle with the opposite sign on the first positive interval,
uncross the two at a shared incidence vertex, and obtain either a one-signed
cycle or a cycle with a strictly smaller lexicographic defect.  Iterate.

### First false step

On a deletion-minimal displayed equality core, the required cycles need not
share a vertex in the doubled incidence graph, and the first one-signed
object on that displayed support need not be a simple cycle.

In schema 4 the two cycles are

```text
C1: left centers {0,7}, right targets {6,8},
C2: left centers {6,8}, right targets {1,7}.
```

Their left and right vertex sets are disjoint as bipartite vertices.  Each
oriented cycle has flux minimum `-1` and maximum `1`, so neither is
one-signed.  Coupling them with opposite orientations gives

```text
F_I(C1-C2) = 1  for I(0,6), I(0,7),
F_I(C1-C2) = 0  otherwise.
```

The cancellation uses the identification of a carrier label appearing once
as a center and elsewhere as a target.  It is invisible to an uncrossing
operation confined to shared vertices of the doubled graph.

Thus a minimum-length, minimum-span, or lexicographically minimal **simple
cycle of the exposed core** argument fails at its first reduction.  Schema 4
is only a partial minimized equality core, not a full four-target row table.
It therefore does **not** refute the stronger possibility that every complete
four-target table contains some additional favorable simple cycle through an
edge omitted from the core.  That full-completion statement needs a separate
audit.  Minimizing over all coupled circulations avoids the core-local error,
but then zero is the unconstrained minimizer; introducing a nonzero
normalization simply restates the cone-intersection problem and supplies no
descent move.

### W(3,3) test

W(3,3) seed 1 does have a one-signed simple eight-cycle, so this example alone
would make the proposed argument look successful.  Schema 4 is the necessary
core-local regression: it proves that a saved positive core certificate
cannot always be reduced to one of that core's displayed simple cycles.  It
does not decide the stronger complete-table favorable-cycle conjecture.

## Attempt B: oriented-matroid positive-circuit extraction

### Candidate argument

The incidence graph has `4n` edges on `2n` bipartite vertices, hence a large
cycle space.  Map its graph circuits through `F` and invoke circuit
elimination until a positive circuit of the flux-oriented matroid appears.
Pair alternation is intended to control the signs of the four-cycle images.

### First false step

Graph-matroid cyclicity does not imply a positive circuit after applying the
flux map.  A single alternating shared-pair cycle already gives an exact
counterexample to that inference.

Take the cyclic carrier `Fin 8`, centers `0,4`, and common targets `2,6`.
The roles alternate as

```text
0 < 2 < 4 < 6.
```

For the swap

```text
f = {0 -> 2, 4 -> 6},
g = {0 -> 6, 4 -> 2},
```

the cycle flux has eight nonzero coordinates:

```text
+1 on I(0,4), I(0,5), I(1,4), I(1,5),
-1 on I(2,6), I(2,7), I(3,6), I(3,7).
```

Its one-dimensional image contains no nonzero one-signed vector.  Therefore
an incidence circuit can map to an acyclic rank-one flux orientation even
when its shared pair alternates exactly as required.

Oriented-matroid circuit elimination can combine already available sign
vectors, as schema 4 demonstrates, but it does not guarantee that the set of
mapped graph circuits contains the sign opposition needed to reach an
orthant.  Such a guarantee is equivalent to excluding the strictly positive
Gordan covector, which is the theorem still to be proved.

### W(3,3) test

The W(3,3) row design has no repeated target pair between two rows, so the
pair-alternation condition is vacuous there.  Its positive eight-cycle shows
that high-girth circuits can map favorably, but pair-local oriented-matroid
data cannot select that circuit.  Any successful positive-circuit theorem
must use the cyclic placement of an entire coupled circuit, not only the
graph cycle rank or the signs of four-cycles.

## Attempt C: Gordan-dual potentials and a descent contradiction

### Candidate argument

Assume the flux cone misses the one-signed orthant.  The exact Gordan dual
then gives strictly positive split weights `w_I` and potentials
`alpha_c,beta_x` such that

```text
D_w(c,x) = alpha_c + beta_x
```

on every selected incidence.  Use strict circular Monge single-crossing to
show that a row or potential extremum has too few tight neighbors, contradict
four selected targets and strong connectivity.

### What the local argument really proves

For two centers `a,b`, put

```text
Delta_x = D_w(a,x) - D_w(b,x).
```

Strict circular Monge inequalities make `Delta_x` strictly monotone on each
of the two open arcs between `a` and `b`.  If both centers select targets
`x,y`, the potential equations give

```text
Delta_x = alpha_a - alpha_b = Delta_y.
```

Hence `x,y` must lie on opposite arcs.  This recovers exactly the known
pair-alternation condition.  It is not a contradiction.

### Exact alternating tight-pair counterexample

Again take `Fin 8`, and give every nontrivial circular split weight `w_I=1`.
The resulting positive split metric depends only on cyclic separation `k`:

```text
D_w(c,c+k) = k*(8-k)-2.
```

In particular,

```text
D_w(0,2)=D_w(0,6)=D_w(4,2)=D_w(4,6)=10.
```

Thus the alternating four-cycle above is an additive tight graph with
`alpha_0=alpha_4=10` and `beta_2=beta_6=0`.  All split weights are strictly
positive.  This is a concrete Gordan separator for that cycle and proves that
single-crossing cannot eliminate an alternating shared pair.

A second tempting descent assertion is that `D_w(c,x)` increases as `x`
moves away from `c` along either arc.  That too is false for arbitrary
positive split weights.  On `Fin 7`, set every split weight to `1` except the
split `I(0,2)={1,2}`, whose weight is `10`.  Then the row at `0` is

```text
(D(0,1),...,D(0,6)) = (13,17,10,10,8,4),
```

so the distance drops from target `2` to target `3`.  Column potentials
`beta_x` only add more freedom.  No monotone radial-potential descent follows
from strict split positivity.

### W(3,3) test

Because W(3,3) has row intersections of size at most one, the two-row
single-crossing consequence supplies no restriction at all.  The successful
certificate is instead a global four-row/eight-edge tight-cycle obstruction.
The dual route therefore needs a genuinely global extremal theorem:

> A strictly positive circular-split metric has no additive tight graph with
> four selected incidences in every left row after sink reduction.

This statement is equivalent to the desired Gordan exclusion; neither local
single-crossing nor radial monotonicity proves it.

## Attempt D: assignment product-box comparability

The only candidate that survives both mandatory regressions without changing
its statement is the assignment route developed in
[`ASSIGNMENT_COMPARABILITY_REDUCTION.md`](ASSIGNMENT_COMPARABILITY_REDUCTION.md).
For equal-multiplicity assignments `f,g`, equation

```text
F_I(u_{f,g}) = O_I(f)-O_I(g)
```

is exact.  Schema 4 is closed by coupling two incomparable swaps with opposite
orientations, and W(3,3) is already one comparable assignment pair.

Its first missing step is precise rather than hidden: prove that some
target-multiplicity fiber in every strongly connected pair-alternating
four-choice product box is not an antichain under all circular cut profiles.
Pigeonhole proves only that a fiber contains two assignments.  It does not
prove comparability.  Moreover, minimized core 79 has an exact positive
mass-two circulation but no comparable assignment pair on its displayed
48-assignment equality support, so an assignment theorem is a genuine
strengthening, not a normal form for every coupled contour.

## Attempt E: minimal-counterexample deletion to the card-eight base

### Candidate argument

Assume a smallest complete degree-four counterexample and delete one carrier
point.  Apply an inductive product-box theorem to the remaining rows, then
lift its comparable pair back by making the same choice at the deleted row.
The exhaustive degree-four card-eight result is intended as the base case.

### First false step

Deleting a carrier does not preserve four choices: every row that selected
the deleted target becomes a three-choice row.  Extending the induction
hypothesis from degree four to degree at least three is false, even with the
other two structural hypotheses retained.

On `Fin 7`, consider the complete degree-three table

```text
S(0) = {1,2,4},       S(1) = {3,4,6},
S(2) = {0,1,4},       S(3) = {1,5,6},
S(4) = {0,2,5},       S(5) = {2,3,6},
S(6) = {1,3,5}.
```

Direct graph traversal verifies strong connectivity in both directions.
The only row pairs sharing two targets are

```text
(0,2) sharing {1,4},
(1,5) sharing {3,6},
(3,6) sharing {1,5},
```

and each shared pair lies on opposite arcs between its two centers.  Thus the
table is pair-alternating.

Exact enumeration of all `3^7 = 2187` assignments finds no distinct
equal-multiplicity pair with a nonzero one-signed interval profile.  More
strongly, it has a rational Gordan separator.  In the standard interval order

```text
(0,2),(0,3),(0,4),(0,5),
(1,3),(1,4),(1,5),(1,6),
(2,4),(2,5),(2,6),
(3,5),(3,6),(4,6),
```

take the strictly positive split weights

```text
w = (4,2,1,1, 1,1,4,1, 1,1,1, 3,1,1),
```

and potentials

```text
alpha = (16,20,15,22,15,17,20),
beta  = (0,-8,-1,-6,-1,-11,-8).
```

Integer replay gives

```text
D_w(c,x) = alpha_c + beta_x
```

on all 21 selected incidences.  Therefore this degree-three table has no
one-signed circulation at all, not merely no assignment-pair witness.

This counterexample does **not** refute the degree-four product-box theorem.
It proves that the fourth target must be load-bearing in any induction.  A
valid deletion step needs a repair operation that restores a fourth target in
every damaged row while preserving cyclic order and pair alternation; simply
weakening the induction hypothesis to three choices cannot work.

## Attempt F: planarity or a linear extremal bound for the dual tight graph

### Candidate argument

Under a Gordan separator, let `H` be the bipartite graph of additive-tight
incidences

```text
D_w(c,x) = alpha_c + beta_x.
```

If `H` were planar, its `2n` bipartite vertices would give
`|E(H)| <= 4n-4`.  A degree-four selected table has `4n` edges, yielding an
immediate contradiction.  Small exact maximization suggested the even
stronger bound `|E(H)| <= 4n-6`.

### Planarity is false

On `Fin 7`, take the 22-edge tight graph

```text
0 : {1,6}
1 : {0,3,5,6}
2 : {4,6}
3 : {1,4,5}
4 : {2,3,5}
5 : {1,3,4,6}
6 : {0,1,2,5}.
```

In standard interval order, the strictly positive split weights are

```text
w = (1,1,1,4, 1,2,1,1, 1,3,1, 1,1,1),
```

and one may take

```text
alpha = beta = (0,7,10,4,0,5,4).
```

Integer replay verifies every displayed tight equation.  The graph contains
a subdivision of `K_3,3` with branch sides

```text
{L5,L1,L4},        {L6,R3,R5}.
```

The nine branch paths are

```text
L5-R1-L6,          L5-R3,             L5-R4-L3-R5,
L1-R0-L6,          L1-R3,             L1-R5,
L4-R2-L6,          L4-R3,             L4-R5.
```

Their internal vertices are pairwise disjoint, so Kuratowski's theorem gives
nonplanarity.  Thus the proposed planar embedding is exactly false.

### The `4n-6` bound is also false

The same graph has

```text
|E(H)| = 22 = 4*7-6.
```

Exact Z3 optimization gives maximum tight-edge counts `14,18,22` at
`n=5,6,7`, respectively, suggesting `4n-6` only on that finite range.  At
`n=8`, HiGHS discovered the following 28-edge graph, and a separate exact Z3
reconstruction replayed it with positive rational split weights:

```text
0 : {2,4,6}
1 : {2,5,7}
2 : {0,3,4,7}
3 : {1,2,4,5}
4 : {0,2,3,6}
5 : {1,4,6,7}
6 : {0,4}
7 : {0,1,5,6}.
```

In standard interval order, take

```text
w = (3,1,1,1,3, 5,2,1,1,1, 2,1,1,2, 1,1,1, 3,1, 5),
alpha = (0,-9,-1,-10,-1,-10,-1,-10),
beta  = (20,29,19,10,19,28,19,28).
```

Every displayed incidence satisfies `D_w(c,x)=alpha_c+beta_x`, and

```text
|E(H)| = 28 = 4*8-4 > 4*8-6.
```

Thus the proposed `4n-6` bound is exactly false.

### Upper/lower forest decomposition is false

Another attempted derivation of `4n-6` splits tight arcs into the halves
`c<x` and `c>x` and claims each half is a forest.  The upper half already has
an exact six-cycle at `n=6`:

```text
0 : {4,5},       1 : {3,5},       2 : {3,4}.
```

All six arcs have `c<x`.  Standard interval weights

```text
w = (1,4,1,1,1,1,1,1,1),
alpha = (0,6,3,0,0,0),
beta  = (0,0,0,0,6,3)
```

replay every tight equation.  Hence neither triangular half is generally a
forest.

### The `4n-4` bound is false as well

The sharper live candidate is therefore:

At `n=10`, a floating MILP discovery followed by independent exact rational
reconstruction gives 39 tight incidences.  Its rows are

```text
0:{2,5,7,8}       1:{0,3,5,9}       2:{0,4,6,8}
3:{1,2,4,5}       4:{2,6,7,9}       5:{1,3,4,6}
6:{2,4,8}         7:{1,5,6,8,9}     8:{0,2,3,6}
9:{0,1,8}.
```

The standard-order positive split weights and potentials are

```text
w = (1,5,1,1,5,5,14,10,
     1,1,1,1,1,10,14,
     9,1,1,1,5,2,5,
     1,1,1,6,1,1,
     1,10,1,1,
     6,1,
     6),
alpha = (0,-18,7,-25,0,-25,0,-25,0,-25),
beta  = (50,82,57,75,50,75,50,63,50,75).
```

Exact integer replay verifies all 39 equations.  Hence

```text
|E(H)| = 39 = 4*10-1 > 4*10-4.
```

The row degrees are

```text
(4,4,4,4,4,4,3,5,4,3).
```

This is a feasible 39-edge model, not a proof that 39 is the card-ten
maximum.

### Surviving load-bearing statements

Either of the following would still exclude four tight choices in every row:

> **One-edge-deficit bound.**  Every additive tight graph of a strictly
> positive circular-split metric has at most `4n-1` nonloop incidences.

> **Minimum-row theorem.**  Every such graph has some row with at most three
> nonloop tight incidences.

At this stage of the audit, the minimum-row theorem was the exact statement
needed by the Gordan route.
Unlike a total-edge estimate, it remains meaningful if a few other rows have
large degree.  The 39-edge model is near-extremal evidence for both statements
and shows that any universal deficit can be at most one at `n=10`.

Any attempted proof would have needed to tolerate nonplanarity and avoid the
false half-forest split.  Attempt G below shows that no such proof exists from
the bare aggregate hypotheses.

The nonplanar `n=7` graph, upper-half `n=6` cycle, 28-edge `n=8` graph, and
39-edge `n=10` graph remain mandatory regressions.  Attempt G refutes both the
one-edge-deficit bound and the minimum-row theorem.

## Attempt G: uniform positive-split separator

The remaining aggregate targets are refuted by an explicit family.  For every
even `n >= 12`, give weight `n-8` to every size-two circular split and weight
one to every other proper circular split.  With the parity potentials in
[`TIGHT_GRAPH_UNIFORM_ATTACK.md`](TIGHT_GRAPH_UNIFORM_ATTACK.md), the complete
additive-tight graph has exactly four nonloop targets at every source and four
uses of every target.  It is strongly connected and pair-alternating, but the
positive split weights annihilate every balanced circulation and therefore
exclude a one-signed strict interval-flux vector.

The canonical card-twelve certificate has 48 tight arcs and passes two
independent exact-integer replays.  Thus the completed-row favorable-cycle,
generic assignment-comparability, one-edge-deficit, low-row, and general
coupled-circulation targets are all false on the bare aggregate surface.

## Conclusion

1. Local or lexicographic **simple-cycle extraction from the displayed
   minimized core is refuted** by schema 4; the stronger completed-row-table
   theorem is refuted by the uniform even-card family.
2. Graph cycle rank does not force an oriented-matroid positive circuit; an
   alternating tight four-cycle gives the exact first counterexample.
3. Gordan-dual single-crossing proves only pair alternation, and arbitrary
   positive split metrics defeat radial-potential descent.
4. Generic assignment comparability and the product-box width theorem are
   refuted from card twelve; the finite lower-card decisions remain useful.
5. Naive deletion to a degree-three induction hypothesis is exactly refuted;
   any induction must use a structure-preserving fourth-target repair.
6. Ordinary planarity, upper/lower forest decomposition, every proposed edge
   deficit through `|E| <= 4n-1`, and the minimum-row theorem are exactly
   refuted.

The generic one-signed flux lemma is false.  Any high-card parent theorem must
restore Euclidean/MEC, full critical-fiber provenance, or global minimality.
