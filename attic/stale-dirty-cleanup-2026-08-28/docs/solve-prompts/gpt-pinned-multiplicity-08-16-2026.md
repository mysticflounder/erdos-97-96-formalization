Yes. The search uncovered a much more direct research lineage than the usual pinned-distance literature. The term **“pinned multiplicity” is not standardly indexed**; the relevant work is scattered under:

[
\text{equidistant vertices},\quad
\text{isosceles triangles},\quad
\text{perpendicular-bisector witnesses},\quad
\text{unit-distance degree},\quad
\text{normal incidences},\quad
\text{bisector energy}.
]

For the present problem, the natural quantity is

[
m_A(p)=\max_{r>0}\left|{x\in A\setminus{p}:|x-p|=r}\right|.
]

Problem 97 asks whether every finite convex-position set has some (p) with (m_A(p)\le3).

## 1. The direct historical line: Danzer and Fishburn–Reeds

Danzer’s convex nonagon is the exact (k=3) predecessor. Every vertex has three other vertices at one common distance from that vertex, although the repeated radius depends on the pin. Erdős described its threefold-symmetric Reuleaux-triangle construction in 1987. Exact coordinates for a Danzer-type nonagon have also now been encoded in the formal-conjectures project. ([Rényi Institute][1])

Fishburn and Reeds then constructed a convex (20)-gon in which the repeated distance is globally the same: its vertices split into sets (A,B) on opposite sides of a line, and every vertex has three unit-distance neighbors across the cut. They proved that (20) is the smallest size possible under that cut formulation. ([Nokia Corporation | Nokia][2])

These should become permanent regression examples for your CEGAR system:

* **Danzer mode:** the selected radius varies by row.
* **Fishburn–Reeds mode:** one common radius generates a geometric (3)-regular bipartite graph.

Any proposed geometric refinement ought to preserve these configurations at multiplicity (3). They are better falsifiers than random numerical point sets because they sit immediately below the conjectured threshold.

### A strange bibliographic warning

Erdős wrote in 1975 that Danzer had an unpublished construction for every (k), apparently giving a convex polygon in which every vertex has (k) equidistant companions. But in 1987 Erdős himself explicitly posed the (k=4) statement as open. I found no published arbitrary-(k) construction. The safest interpretation is that the 1975 sentence is a bibliographic anomaly, a misunderstood unpublished claim, or refers to a materially different condition; it should not be treated as evidence that P97 is false. ([Springer][3])

It may nevertheless justify a bounded archival search through Danzer’s correspondence or unpublished problem notes.

## 2. The closest continuous analogue: circles through a convex boundary

The most conceptually useful overlooked paper is Bárány and Roldán-Pensado’s **“A Question from a Famous Paper of Erdős.”**

For a convex body (K), they define (N(K)) as the smallest (N) such that there is some boundary point (P) for which every circle centered at (P) meets (\partial K) in at most (N) points. They prove (N(K)<\infty) for every convex body and construct a (15)-gon with (N(K)=6). Thus, in that example, every boundary point is the center of some circle having at least six boundary intersections. These intersections can occur inside polygon edges, so this is not a finite-vertex counterexample to P97. It is, however, a very close **continuous relaxation**. ([Rényi Institute][4])

Their key observation is especially transferable. Suppose two points (Q_1,Q_2) on the convex boundary are equidistant from (P). On the boundary arc from (Q_1) to (Q_2) not containing (P), the distance-to-(P) function has an interior extremum. At that extremum (Q), there is a normal line to the convex body at (Q) passing through (P). Consequently, (m) intersections of a centered circle produce at least (m-1) normal incidences. ([Rényi Institute][4])

### A finite lemma suggested by this paper

Let a selected four-shell at (p) be

[
K_p={q_1,q_2,q_3,q_4},
\qquad
|p-q_i|=r_p.
]

Place the (q_i) in cyclic boundary order. Of the four boundary arcs between consecutive (q_i), exactly one can contain (p). Each of the other three arcs has equal distance values at its endpoints, and therefore contains an interior distance extremum. Hence:

[
\boxed{\text{Every selected four-shell produces at least three normal-incidence events.}}
]

For a polygon, each event has one of two exactly checkable forms:

1. **Vertex event:** at a vertex (v), the line (pv) is normal to some supporting line at (v). This can be encoded using the two adjacent edge directions and sign inequalities.
2. **Edge event:** the perpendicular projection of (p) lies in the interior of an edge (ab), equivalently
   [
   0< (p-a)\cdot(b-a)<|b-a|^2.
   ]

This gives a finite disjunctive certificate:

[
\text{four-shell}
\Longrightarrow
\text{three certified vertex-normal or edge-normal events}.
]

That looks highly suitable for CEGAR. A survivor that satisfies the abstract shell incidences but cannot assign the required normal events is geometrically spurious.

## 3. The cap-and-witness literature is directly applicable

Nivasch, Pach, Pinchasi, and Zerbib study pinned distinct distances from a vertex of a convex polygon using **witnesses**. A point (p) witnesses the base (uv) when

[
|p-u|=|p-v|,
]

or equivalently (p) lies on the perpendicular bisector of (uv). Their cap machinery proves strong ordering and matching restrictions on these witness relations. ([arXiv][5])

A July 2026 working paper by Scott Duke Kominers, **“A (Slightly) Stronger Lower Bound on the Number of Distinct Distances from a Vertex of a Convex Polygon,”** refines the method using:

* exact matching of successive minimum-enclosing-circle support sets;
* exact cap-size imbalance rather than a worst-case bound;
* simultaneous tracking of drift away from all three original support points;
* an ambient witness lemma that remains valid when the witness has been deleted from the current recursive set.

It obtains the working-paper bound

[
f_{\mathrm{conv}}(n)\ge
\left(\frac{13}{36}+\frac{3}{5270}\right)n-O(1).
]

More useful for P97 than the asymptotic coefficient are its local structural facts:

* a base with two witnesses has one witness on each boundary chain between its endpoints;
* in a cap, the edges witnessed by a fixed appropriately located point form a matching;
* distances from a cap endpoint increase strictly with cap order;
* a (t)-point cap has at most (t^2/4) internally witnessed edges. ([Scott Duke Kominers][6])

Those statements are very close to your existing cap-order and crossing proof surface.

## 4. A strong exact deduction for the selected-row system

The witness viewpoint gives a useful finite count that is stronger than the elementary pinned-energy lower bound.

For every center (p), choose one selected shell (K_p) of exactly four vertices. Every unordered pair in (K_p) has (p) as a witness, so (p) contributes

[
\binom42=6
]

selected witness incidences. Across all centers there are therefore exactly

[
6n
]

center–base incidences.

A fixed base (uv) can have at most two vertex witnesses: all its witnesses lie on the perpendicular bisector of (uv), and convex position forbids three collinear vertices. Let

* (s) be the number of bases having one selected witness;
* (d) be the number having two selected witnesses.

Then

[
s+2d=6n.
]

The number (s+d) of used bases is at most (\binom n2), so

[
\boxed{d\ge 6n-\binom n2.}
]

This gives:

| (n) | forced double-selected-witness bases | average degree in the associated overlap graph |
| --: | -----------------------------------: | ---------------------------------------------: |
|  10 |                        at least (15) |                                   at least (3) |
|  11 |                        at least (11) |                                   at least (2) |
|  12 |                         at least (6) |                                   at least (1) |

The “overlap graph” interpretation is particularly useful. If (p) and (q) are the two selected witnesses of a base ({u,v}), then

[
u,v\in K_p\cap K_q.
]

Two circles with distinct centers have at most two common points, so

[
K_p\cap K_q={u,v}.
]

Conversely, if (|K_p\cap K_q|=2), the two common points form a base selected-witnessed by both (p) and (q). Therefore:

[
\boxed{
d=
\left|\left{{p,q}:|K_p\cap K_q|=2\right}\right|.
}
]

So any (n=10) counterexample has at least **15 pairs of selected rows with overlap exactly two**, and some selected row has at least three overlap-two peers.

That is a direct statement in the language of your current Lean branches. It may be substantially more useful than proving another generic energy inequality.

There is also a branch-local form. If a CEGAR branch permits only (M) possible base pairs but contains (T) selected center–base incidences, then at least

[
T-M
]

of those bases must have two selected witnesses. Cap localization can make (M) much smaller than (\binom n2), allowing the same argument to remain effective beyond (n=12).

### Extra geometry of a double-witness base

If (p,q) both witness (uv), then (p,q) lie on the perpendicular bisector of (uv). The two witnesses lie on opposite boundary chains from (u) to (v), and the convex quadrilateral formed by these four points is a symmetric kite:

[
pu=pv,\qquad qu=qv,
]

with the diagonals (pq) and (uv) perpendicular and (pq) bisecting (uv).

I did not find a published theorem giving exactly the finite upper bound on such selected orthogonal kites that P97 needs. The witness/cap literature appears to be the nearest existing machinery. This suggests that a custom “many selected kites in convex order” lemma could be genuinely high leverage.

## 5. Every selected shell has its own intrinsic cap

There is another elementary but useful consequence.

Because (p) is an extreme point of (A),

[
p\notin\operatorname{conv}(A\setminus{p}),
]

and hence (p\notin\operatorname{conv}(K_p)). Four points on a circle centered at (p) have (p) outside their convex hull only when they lie in an open semicircle. Therefore:

[
\boxed{K_p\text{ lies in an open semicircle of its centered circle}.}
]

Thus every selected row comes with an intrinsic angular cap, independently of the global minimum-enclosing-circle cap decomposition. This should allow the Nivasch–Kominers witness-ordering lemmas to be applied at two scales:

* the global Moser support caps;
* the local semicircular order of each selected four-shell.

For a center (p) with three or more overlap-two peers, those peers lie on perpendicular bisectors of distinct chords of one four-point semicircular configuration. That is a small rigid geometric object and seems suitable for exhaustive symbolic classification.

## 6. Fishburn–Reeds/Aggarwal cut matrices

Aggarwal’s **“On Unit Distances in a Convex Polygon”** develops the matrix formulation underlying the Fishburn–Reeds approach. After cutting a convex polygon into two cyclically ordered chains, one forms a cross-distance matrix. Convex geometry imposes “diagonal” and obtuse-angle restrictions, and these imply that certain cyclic (0)-(1) unit-distance patterns cannot occur. ([arXiv][7])

For P97, the radii are row-dependent, so a simple unit-distance matrix is insufficient. But the appropriate generalization appears to be

[
M_{ij}
======

|p_i-q_j|^2-r_{p_i}^2,
]

recording negative, zero, or positive signs rather than only unit entries. The zeros are selected-shell incidences. The underlying convex quadrilateral inequalities still constrain the possible (2\times2) and cyclic sign patterns.

This suggests a concrete CEGAR program:

1. Enumerate small cross-cut selected-zero patterns.
2. Test them against full squared-distance coordinates and convex order.
3. Extract minimal unrealizable patterns with MARCO.
4. Formalize each resulting forbidden submatrix as a reusable cap/crossing lemma.

Fishburn–Reeds supplies a crucial positive benchmark: degree-three patterns can be surprisingly dense and symmetric, so the forbidden-pattern extractor must not accidentally eliminate their (20)-gon.

## 7. Bisector energy is useful as a structural brancher, not as the main contradiction

The bisector-energy work of Lund–Sheffer–de Zeeuw and Lund–Petridis establishes a useful dichotomy: unusually high multiplicity of perpendicular bisectors forces substantial line or circle concentration. ([arXiv][8])

Convex position rules out a rich line, leaving cocircular concentration as the relevant structured branch.

But P97 alone gives only

[
6n
]

unordered selected isosceles triangles, or (12n) ordered nontrivial collisions. That is merely linear. Existing global isosceles-count methods permit quadratic numbers of isosceles triangles in convex point sets, so a pure energy upper bound is unlikely to contradict P97 without additional amplification. The recent good-edge paper explicitly notes a ceiling on what the global isosceles-count reduction can prove. ([Scott Duke Kominers][6])

The better use is:

[
\text{ordinary survivor}
\quad\text{or}\quad
\text{high bisector energy}
\Longrightarrow
\text{large cocircular block}.
]

A cocircular block is exploitable. If (p) itself lies on a circle containing a set (S), then any circle centered at (p) meets that circle in at most two points. Consequently, a four-shell centered at (p) must contain at least two vertices outside (S). On a minimum-enclosing-circle branch, this becomes a clean “shell escape” constraint.

## 8. Multi-pin multiplicity gives exact polynomial constraints

Makhul’s 2026 Elekes–Szabó paper studies simultaneous membership in sphere families centered at several fixed pins. Its asymptotic result says that very many points simultaneously rich with respect to (d+1) pinned sphere families force affine dependence or another strongly degenerate center configuration. ([arXiv][9])

For finite CEGAR, the exact algebra is more useful than the asymptotic theorem.

Normalize three noncollinear pins to

[
p=(0,0),\qquad q=(1,0),\qquad r=(a,b),\quad b\ne0.
]

For a candidate carrier (x), set

[
u=|x-p|^2,\qquad
v=|x-q|^2,\qquad
w=|x-r|^2.
]

Define

[
T=u-v+1,
\qquad
S=u-w+a^2+b^2-aT.
]

Then necessarily

[
\boxed{b^2T^2+S^2=4b^2u.}
]

Indeed, (T=2x_1) and (S=2b x_2). Conversely, a compatible triple ((u,v,w)) determines (x) uniquely.

This gives a cheap exact check:

[
\text{abstract assignments of three pinned squared distances}
\Longrightarrow
\text{one quadratic compatibility equation}.
]

It avoids introducing both coordinates of every carrier during the early CEGAR stages. It should also be easy to formalize after coordinate normalization using polynomial normalization and `nlinarith`.

## 9. Lower-priority literature

The theory of **locally (k)-distance sets** studies sets in which every point sees at most (k) distinct distances. That condition is much stronger than P97’s requirement that one distance fiber have multiplicity four. It becomes relevant only if the surviving models also exhibit few total radii per pin. ([arXiv][10])

Recent work on global distance multiplicities records how many unordered pairs realize each distance, but discards which point is the center. That loss of pin identity makes it mainly background rather than a direct tool here. ([arXiv][11])

Finite-field and fractal pinned-distance results contain useful incidence and second-moment techniques, but they do not retain planar convex order, and finite fields introduce isotropic degeneracies absent from the Euclidean problem. I would place them behind the witness, normal-incidence, and cut-matrix approaches.

## Recommended next implementation

The highest-leverage next experiment is:

1. **Add the exact witness census**
   [
   d\ge6n-\binom n2
   ]
   and identify double-selected bases with selected-row overlaps of cardinality two.

2. **Add the opposite-chain certificate** for every overlap-two pair. This is entirely combinatorial plus perpendicular-bisector geometry.

3. **Add local shell semicircle order**, then apply cap matching to the six chords of each selected four-shell.

4. **Add the shell-to-normal-incidence refinement**, allowing vertex-normal and edge-normal outcomes.

5. **Add three-pin quadratic compatibility** only after the cheaper order constraints survive.

For MARCO, I would keep these as separate semantic groups:

[
\begin{aligned}
&\texttt{base_witness_capacity},\
&\texttt{double_witness_opposite_chains},\
&\texttt{local_shell_semicircle},\
&\texttt{cap_witness_matching},\
&\texttt{shell_normal_incidence},\
&\texttt{cut_matrix_forbidden_pattern},\
&\texttt{three_pin_compatibility}.
\end{aligned}
]

The strongest immediate result from this search is the overlap-two census. At (n=10), forcing at least 15 overlap-two selected-row pairs is a dense structural requirement. Combined with opposite-chain placement and the intrinsic semicircle order of each four-shell, it may expose a substantially shorter route than global pinned energy or Cauchy–Schwarz.

[1]: https://www.renyi.hu/~p_erdos/1987-27.pdf "https://www.renyi.hu/~p_erdos/1987-27.pdf"
[2]: https://www.nokia.com/bell-labs/publications-and-media/publications/unit-distances-between-vertices-of-a-convex-polygon/ "https://www.nokia.com/bell-labs/publications-and-media/publications/unit-distances-between-vertices-of-a-convex-polygon/"
[3]: https://link.springer.com/content/pdf/10.1007/BF02414146.pdf "https://link.springer.com/content/pdf/10.1007/BF02414146.pdf"
[4]: https://www.renyi.hu/~barany/cikkek/134.pdf "https://www.renyi.hu/~barany/cikkek/134.pdf"
[5]: https://arxiv.org/pdf/1207.1266 "https://arxiv.org/pdf/1207.1266"
[6]: https://www.scottkom.com/assets/articles/Kominers_Distinct_Distances_from_a_Vertex.pdf "https://www.scottkom.com/assets/articles/Kominers_Distinct_Distances_from_a_Vertex.pdf"
[7]: https://arxiv.org/abs/1009.2216 "https://arxiv.org/abs/1009.2216"
[8]: https://arxiv.org/pdf/1411.6868 "https://arxiv.org/pdf/1411.6868"
[9]: https://arxiv.org/abs/2607.03366 "https://arxiv.org/abs/2607.03366"
[10]: https://arxiv.org/pdf/0906.0199?utm_source=chatgpt.com "On a generalization of distance sets"
[11]: https://arxiv.org/html/2505.04283v5 "https://arxiv.org/html/2505.04283v5"
