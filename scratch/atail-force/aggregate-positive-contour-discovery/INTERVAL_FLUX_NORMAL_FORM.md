# Interval-flux normal form for aggregate Kalmanson contours

Date: 2026-07-18

Status: **RIGOROUS DISCRETE REDUCTION; GENERIC FLUX-EXTRACTION LEMMA OPEN.**

This note isolates the exact combinatorial statement behind the aggregate
positive-contour route.  It does not edit production Lean, does not establish
generic coverage, and closes no source `sorry`.

## 1. Edge space and the local Kalmanson basis

Let `V = Fin n`, with its cyclic order, and let

```text
E = Q^(unordered two-element subsets of V).
```

Write `e_{xy}` for the unit vector at the unordered edge `{x,y}`.  Define the
unsigned degree map

```text
deg : E -> Q^V,
deg(e_{xy}) = delta_x + delta_y.
```

For `n >= 3`, `deg` has rank `n`: if a linear relation on its rows has
coefficients `a_x`, then `a_x + a_y = 0` for every distinct `x,y`; applying
this to three vertices forces every `a_x = 0`.  Hence

```text
dim ker(deg) = choose(n,2) - n = n(n-3)/2.
```

Index the nontrivial circular intervals modulo complement by pairs of
nonadjacent boundary edges.  In the cut `0 < ... < n-1`, write

```text
I(i,j) = {i+1,...,j}
```

for `0 <= i < j <= n-1`, excluding `j=i+1` and `(i,j)=(0,n-1)`.
There are exactly `n(n-3)/2` such intervals.  Associate the local strict
Kalmanson vector

```text
Q(i,j) = e_{i,j} + e_{i+1,j+1} - e_{i,j+1} - e_{i+1,j}
```

when `j < n-1`.  At the seam, use the local `K1` cell

```text
Q(i,n-1) = e_{i,n-1} + e_{0,i+1} - e_{0,i} - e_{i+1,n-1}.
```

Every `Q(i,j)` has zero unsigned degree.  For a circular interval `I`, let
`cut_I` be the linear functional that sums the coefficients of edges with
exactly one endpoint in `I`.  Direct inspection of the four corners gives

```text
cut_I(Q_J) = 2  if I=J modulo complement,
cut_I(Q_J) = 0  otherwise.
```

The `Q_I` are therefore linearly independent.  Their count equals
`dim ker(deg)`, so they form a basis of `ker(deg)`, and the coefficient of
`Q_I` in any `z in ker(deg)` is exactly

```text
(1/2) cut_I(z).
```

This is the triangular-grid/Moebius-strip filling in a coordinate form that
does not require choosing a noncanonical global Kalmanson rectangle.  Every
global `K1` or `K2` vector is its nonnegative rectangle sum in this local
basis.

## 2. Selected rows become balanced incidence circulations

Let `S(c) subset V \ {c}` be the four selected targets at center `c`.  Give
each selected incidence a rational multiplier `u(c,x)`, and set it to zero
off the selected support.  Its row-equality expression is

```text
Phi(u) = sum_{c,x} u(c,x) e_{cx}.
```

It is a valid linear combination of equalities inside the selected row at
`c` exactly when

```text
sum_x u(c,x) = 0                                      (row balance)
```

for every center.  If `Phi(u)` cancels Kalmanson vectors, it must also have
zero unsigned degree.  Under row balance,

```text
deg(Phi(u))(v) = sum_c u(c,v),
```

so the remaining necessary and sufficient condition is

```text
sum_c u(c,v) = 0.                                     (target balance)
```

Thus the permissible row multipliers are precisely the rational circulation
space of the bipartite center/target incidence graph.

For a proper circular interval `I`, define the outward interval flux

```text
F_I(u) = sum_{c in I, x notin I} u(c,x).
```

If both balances hold, then inward and outward flux agree:

```text
sum_{c notin I, x in I} u(c,x) = F_I(u).
```

Consequently

```text
cut_I(Phi(u)) = 2 F_I(u),
Phi(u) = sum_I F_I(u) Q_I.                            (* )
```

The second identity follows from the local-basis duality in Section 1.

## 3. Exact missing combinatorial statement

By `(*)`, a nonzero positive Kalmanson/Farkas contour exists if and only if
there is a balanced rational incidence circulation `u` such that, after one
global choice of sign,

```text
F_I(u) <= 0  for every nontrivial circular interval I,
F_I(u) < 0   for at least one I.
```

Indeed, put `lambda_I = -F_I(u)`.  Then all `lambda_I` are nonnegative and
not all zero, and

```text
sum_I lambda_I Q_I + Phi(u) = 0.
```

Clearing rational denominators produces the integral payload accepted by the
existing weighted Kalmanson checker.

The live generic theorem has therefore been reduced to the following purely
finite statement.

> **One-signed circular interval-flux lemma.**  If every center has four
> nonself selected targets, the selected digraph is strongly connected, and
> every shared target pair alternates with its two centers, then its bipartite
> incidence circulation space contains a nonzero `u` whose proper circular
> interval fluxes are all nonpositive and at least one is strictly negative.

Pair alternation is a clean residual assumption: a nonalternating shared pair
already gives a one-`K1` or one-`K2` contradiction.  Strong connectivity is
without loss for generic closure.  In any selected digraph, a sink strongly
connected component `B` is row-closed; since every row has four distinct
nonself targets, `|B| >= 5`.  The cyclic Kalmanson surface restricts to `B`,
so a contour on the induced row system extends by zero to the full carrier.

No proof or counterexample to the one-signed interval-flux lemma is currently
known.

### Exact Gordan alternative

The flux lemma has a useful exact dual description.  Let `Z(S)` be the
balanced incidence-circulation space and let

```text
F : Z(S) -> Q^(circular intervals modulo complement)
```

be the interval-flux map.  Stiemke--Gordan gives exactly one of:

1. a `u in Z(S)` with every coordinate of `F(u)` nonpositive and at least one
   coordinate strictly negative; or
2. strictly positive rational interval weights `w_I` such that
   `sum_I w_I F_I(u)=0` for every `u in Z(S)`.

The strict coordinate in item 1 is essential: `F` can have a nontrivial
kernel.  For example, when every row on five cyclic vertices contains all four
other vertices, the signed directed-cycle circulation with weights `+1`
forward and `-1` backward is nonzero but has zero flux across every circular
interval.  Such a circulation does not produce a nonempty strict contour.

In the second alternative define the positive circular split metric

```text
D_w(c,x) = sum_{I separates c and x} w_I.
```

For balanced `u`, inward and outward flux agree, so

```text
sum_{c,x} u(c,x) D_w(c,x) = 2 sum_I w_I F_I(u) = 0.
```

The annihilator of the circulation space of a bipartite graph consists of
left-plus-right potentials.  Hence, on every selected incidence,

```text
D_w(c,x) = alpha_c + beta_x.
```

Subtract the weak-sum term `beta_c + beta_x` from every unordered distance.
This leaves every strict Kalmanson slack unchanged and makes the selected
distances in row `c` equal to the single value `alpha_c - beta_c`.
Conversely, quotienting any strict Kalmanson table by its weak-sum lineality
gives strictly positive circular-split coordinates `w_I` and therefore the
separator in item 2.

Thus the one-signed interval-flux lemma is not implied by an ordinary cycle-
space dimension count: it is exactly the discrete Gordan dual of the bare
all-center strict-Kalmanson theorem.  A successful proof still has to use the
four marks per fiber, pair alternation, and (after sink reduction) strong
connectivity to rule out the positive split-metric potential representation.

## 4. Why a single extremal incidence cycle is insufficient

The deletion-minimal bank already contains a smallest exact obstruction to a
proof that chooses one bipartite support cycle and orients it.  The core is

```text
K2(0,1,6,7)
K2(0,1,7,8)

row 0: d(0,6) = d(0,8)
row 6: d(1,6) = d(6,7)
row 7: d(6,7) = d(7,8)
row 8: d(1,8) = d(7,8).
```

Its row-incidence graph has exactly two simple alternating four-cycles:

```text
centers {0,7}, targets {6,8},
centers {6,8}, targets {1,7}.
```

Both shared-pair placements alternate in the cyclic order.  For either simple
cycle, direct evaluation of all interval fluxes gives minimum `-1` and maximum
`1`; neither orientation is one-signed.

Their sum is nevertheless a positive contour.  The two strict vectors
telescope as

```text
K2(0,1,6,7) + K2(0,1,7,8)
  = d(0,6) + d(1,8) - d(1,6) - d(0,8),
```

and the four displayed row equalities make the right side zero.  The middle
terms cancel through center/target role identification.  Thus a proof by a
minimum-length, minimum-span, or minimum-crossing **single** support cycle is
false as stated.  The generic extraction theorem must allow a nonnegative
combination of individually mixed circulation cycles.

An audit of the current 263 deletion-minimal exact cores finds 38 cores with
no one-signed simple incidence cycle, although each complete core has a
positive exact Kalmanson dual.  This is finite evidence for the same
structural warning; it is not generic coverage.

## 5. High-girth positive example

The W(3,3) card-forty seed-1 contour has the balanced alternating incidence
cycle

```text
3 - 34 - 4 - 25 - 7 - 12 - 8 - 37 - 3.
```

Its one-signed filling compresses to

```text
K2(3,4,34,37) + K2(4,8,25,37) + K2(7,8,12,25).
```

This confirms that the interval-flux formulation handles sparse high-girth
row systems, but it does not prove that every strongly connected residual
has such a circulation.
