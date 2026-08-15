I did **not** obtain a complete proof of the claimed nonexistence. Presenting the deductions below as a resolution of (H1)–(H7) would therefore be incorrect. The strongest deductions I was able to verify rigorously are as follows.

## 1. Every cap is an obtuse chain

Let (C) be one of the caps, with endpoints (u,w). Order its points along the polygonal boundary from (u) to (w).

### Lemma 1

For any three points (x<y<z) of (C) in this order,
[
\angle xyz\geq \frac{\pi}{2}.
]
Consequently,
[
|xz|^2\geq |xy|^2+|yz|^2,
]
and in particular (|xz|>|xy|) and (|xz|>|yz|).

### Proof

The cap lies in the closed circular segment of the minimum enclosing disk cut off by the chord (uw) on the side opposite the third distinguished vertex. Because the corresponding angle of the support triangle is at most (90^\circ), that circular segment is contained in the disk with diameter (uw).

Apply a similarity taking (u=(0,0)), (w=(1,0)), with (C) above the (x)-axis. The polygonal cap is the graph of a nonnegative concave piecewise-linear function (f) on ([0,1]), with
[
f(0)=f(1)=0.
]
Containment in the disk with diameter (uw) says
[
f(t)^2\leq t(1-t).                                      \tag{1}
]

Write
[
x=(a,f(a)),\qquad y=(b,f(b)),\qquad z=(c,f(c)),
\quad 0\leq a<b<c\leq1,
]
and put
[
s_1=\frac{f(b)-f(a)}{b-a},\qquad
s_2=\frac{f(c)-f(b)}{c-b}.
]
Concavity gives (s_1\geq s_2). If (s_1s_2\geq0), then (1+s_1s_2\geq0). In the remaining possible case (s_1>0>s_2), concavity and the endpoint values give
[
s_1\leq \frac{f(b)}b,\qquad
-s_2\leq \frac{f(b)}{1-b}.
]
Using (1),
[
-s_1s_2
\leq \frac{f(b)^2}{b(1-b)}
\leq1.
]
Thus (1+s_1s_2\geq0) in every case. But
[
(x-y)\mathbin{\cdot}(z-y)
=-(b-a)(c-b)(1+s_1s_2)\leq0,
]
which is exactly (\angle xyz\geq90^\circ). ∎

### Corollary 1

For a fixed (p\in C), the distances from (p) to the cap vertices strictly increase as one moves away from (p) in either direction along (C).

Hence:

* a circle centered at an interior point of (C) contains at most two other points of (C), at most one on each side of its center;
* a circle centered at an endpoint of (C) contains at most one other point of (C).

No generic-position assumption is involved.

## 2. All three caps have at least four points

Put
[
I_i=C_i\setminus{v_j,v_k},
]
where (j,k) are the other indices. Thus (I_i) is the open core of (C_i).

The two caps containing (v_i) intersect only in (v_i). By Corollary 1, a circle centered at (v_i) contains at most one other point in each of those two caps. A witness circle at (v_i), however, contains at least four points. It must therefore contain at least two points of (I_i). Consequently,
[
|I_i|\geq2,\qquad |C_i|\geq4                         \tag{2}
]
for every (i).

This also shows that every valid support triangle on the same (A), not only the distinguished one initially supplied, has all three cap sizes at least four. Thus (H7) can equivalently be read as saying that every valid support triangle has at least two caps of size at least five.

More generally, for any cap (C):

* every witness circle centered at an interior point of (C) contains at least two points outside (C);
* every witness circle centered at either endpoint of (C) contains at least three points outside (C).

## 3. Minimality forces every selected witness digraph to be strongly connected

For every (p\in A), choose four points on one witness circle centered at (p), and direct four arcs from (p) to those points.

### Lemma 2

Every directed graph obtained in this way is strongly connected.

### Proof

If it were not strongly connected, its condensation would have a sink strongly connected component (B\subsetneq A). No selected arc from a point of (B) leaves (B). Therefore every (p\in B) has four points of (B) on one circle centered at (p). Hence (B) itself has the four-equidistant property.

Every subset of a convex-position set is again in convex position, so (B) would be a strictly smaller convex-position set with the four-equidistant property, contradicting (H3). ∎

This deduction makes essential use of both (H2) and (H3), so it does not apply to the stated 11-point adversarial configuration merely from the incoming exact-four-circle certificates.

## 4. A sharp injectivity property for cross-cap equal pairs

Let (C) be a cap with (m=|C|) and let
[
X=A\setminus C,\qquad |X|=n-m.
]

For (p\in C), choose a witness circle and let (k_p) be the number of its points lying in (X). From the cap lemma,
[
k_p\geq2
]
for an interior point (p), and
[
k_p\geq3
]
for either endpoint.

### Lemma 3

An unordered pair ({x,y}\subset X) can be equidistant from at most one center (p\in C).

### Proof

Every center equidistant from (x) and (y) lies on the perpendicular bisector of (xy). Since (x,y) lie on the complementary boundary chain, the two boundary arcs between them consist of:

1. a subchain of the complementary chain; and
2. the other part of that chain together with the whole cap (C).

The perpendicular bisector separates (x) from (y), so it meets each of these two boundary arcs. A line meets the boundary of a convex polygon in at most two points. Therefore it meets the arc containing (C) only once and hence contains at most one vertex of (C). ∎

It follows that all pairs contributed by the different centers of (C) are distinct:
[
\sum_{p\in C}\binom{k_p}{2}\leq \binom{n-m}{2}.       \tag{3}
]
Using only the guaranteed lower bounds on (k_p), the left side is at least
[
(m-2)\binom22+2\binom32=m+4.
]
Therefore every cap satisfies
[
\boxed{\binom{n-|C|}{2}\geq |C|+4.}                  \tag{4}
]

In core-size notation
[
a_i=|I_i|=|C_i|-2,\qquad
n=a_1+a_2+a_3+3,
]
inequality (4) becomes
[
\boxed{\frac{(a_j+a_k)(a_j+a_k+1)}2\geq a_i+6}       \tag{5}
]
for each permutation ({i,j,k}={1,2,3}).

This excludes sufficiently unbalanced cap-size triples, but it does not exclude balanced triples. In particular, for cap sizes ((5,5,4)), the three instances of (4) are
[
15\geq9,\qquad 15\geq9,\qquad 21\geq8,
]
so the adversarial base pattern is not resolved.

## 5. A crossing inequality for the three distinguished witness circles

Choose a witness circle (\Gamma_i) centered at (v_i), of radius (r_i), and let
[
P_i=\Gamma_i\cap I_i.
]
Section 2 gives (|P_i|\geq2).

For four points (a,b,c,d) in cyclic convex order, the two diagonals cross, and triangle inequalities at their intersection give
[
|ac|+|bd|>|ab|+|cd|,
\qquad
|ac|+|bd|>|ad|+|bc|.                                \tag{6}
]

Applying this to (v_i,v_j,x,y), where (x\in P_i) and (y\in P_j), yields
[
r_i+r_j>|v_jx|+|v_iy|.                              \tag{7}
]
Consequently, for every pair (i\ne j), at least one of the following two alternatives holds:
[
P_i\subset \operatorname{int}D(v_j,r_j),
\qquad\text{or}\qquad
P_j\subset \operatorname{int}D(v_i,r_i).            \tag{8}
]
Indeed, otherwise there would be (x\in P_i) and (y\in P_j) with
[
|v_jx|\geq r_j,\qquad |v_iy|\geq r_i,
]
contradicting (7).

Thus the three opposite-core witness sets satisfy a semicomplete system of strict disk containments. This condition alone is not contradictory: cyclic and bidirectional containment patterns are geometrically possible.

## 6. The exact unresolved step

The deductions above reduce the remaining difficulty to a genuinely global use of minimality. Locally, a cap (C) of size (m) supplies at least (m+4) distinct outside equal-pair incidences, and the perpendicular-bisector argument permits at most
[
\binom{n-m}{2}.
]
For balanced cap sizes this capacity is much larger than the forced local incidence count.

What is still missing is a proof that the strong connectivity forced by (H2)–(H3), together with two large caps and the ordered Euclidean equalities, forces one of the following:

1. enough additional cross-cap equal-pair incidences to violate (3);
2. the same outside pair to be used at both endpoints of a large cap, giving the supplied shared-radius contradiction;
3. a proper witness-closed subset of (A), contradicting Lemma 2 and (H3); or
4. a point outside all tight four-point shells, hence a removable point.

I was unable to establish any of these four conclusions. In particular, none of the arguments above resolves the allowed balanced families, including ((5,5,4)), ((5,5,5)), or arbitrarily large balanced cap sizes. Therefore they do not prove the requested claim.

