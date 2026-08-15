# Literature search: the useful leads

I searched the literature through **August 13, 2026** along four lanes: convex-cap geometry, ordered distance matrices, cyclic-circle identities, and proof-producing real algebra. I did **not** find a published result that directly closes the FreshThird residual or Erdős #97; the problem is still classified as research-open in the Formal Conjectures corpus. ([GitHub][1])

There are, however, three results that look genuinely capable of changing the proof strategy:

1. **Ambient cap-witness inequalities** from Nivasch–Pach–Pinchasi–Zerbib and a new 2026 refinement by Scott Duke Kominers.
2. **Strict cross-chain distance-matrix restrictions** from Amol Aggarwal.
3. **Ptolemy identities for selected four-rows**, already available in Mathlib.

These are more promising than another whole-carrier coordinate search. They can operate on a bounded set of named points extracted from an arbitrary live configuration, respecting the prompt’s requirement for a cardinality-independent argument rather than a fixed-(n) experiment.  Existing fixed-cardinality and frozen-coordinate runs do not supply that reduction. 

There has also been substantial movement in the current Lean source. The active pinned-endpoint residual now extracts an escaping exact row and then constructs both a same-cap blocker/cross-deletion outcome and a mutual cross-deletion outcome before reaching the remaining `sorry`. The source explicitly describes the row-valued form as ingress for “finite row-pattern and weighted-Kalmanson certificates.” 

## Ranked assessment

| Priority | Literature line                                        | What it could provide                                                | Main missing adapter                                                   |
| -------- | ------------------------------------------------------ | -------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| **1**    | Cap witnesses and witness ordering                     | Strict distance inequalities from row equalities plus boundary order | Put a selected support pair and its center into the required cap order |
| **2**    | Aggarwal’s ordered distance matrices                   | Small forbidden (2\times2) or cyclic distance pattern                | Produce an antipodal two-chain cut and orient omitted distances        |
| **3**    | Ptolemy for cyclic four-rows                           | Eliminate centers and radii from the equations                       | Boundary-order-to-Ptolemy adapter                                      |
| **4**    | Perpendicular-bisector uniqueness and centroid circles | Uniqueness of a blocker witnessing a fixed pair on a chain           | Show the relevant support pair lies on the opposite chain              |
| **5**    | Cayley–Menger and Euclidean distance matrices          | Exact coordinate-free polynomial packet                              | Preserve cyclic orientation and handle aliases                         |
| **6**    | Exact real-algebra certificates                        | Kernel-checkable closure of larger coordinate cases                  | Still needs a source-clean finite named packet                         |

---

## 1. Cap-witness geometry is the strongest mathematical lead

### The established 2013 result

Nivasch, Pach, Pinchasi, and Zerbib define a witness for an edge (cd) in a cap (Q) as a polygon vertex lying on the perpendicular bisector of (cd) and on the appropriate side of the cap’s endpoint chord. They prove:

* distances from an endpoint of a cap increase strictly along the cap;
* every subset of a cap is again a cap;
* a witness for an edge lies between its endpoints in boundary order;
* witnesses to two edges sharing an endpoint are themselves ordered;
* if (a,b,c,d,e) occur in that order in a cap, (c) witnesses (ae), and (d) witnesses (be), then
  [
  |ab|>|cd|.
  ]

The last statement is their Lemma 11. 

This is unusually close to the FreshThird geometry. A selected-row center is automatically a **metric witness** for every pair in that row’s support:

[
u,v\in K
\quad\Longrightarrow\quad
d(c,u)=d(c,v).
]

The literature adds the missing geometric conclusion once the center and pair occupy the correct cap interval.

### The new 2026 ambient form

Kominers’ July 2026 manuscript refines the good-edge/witness method and explicitly extends the endpoint-edge lemma so that the equidistant witness may be an **ambient polygon point outside the current subset**. This extension is introduced precisely because iterative deletion arguments need to use previously deleted points. 

Its local content is especially useful. For a cap with endpoints (a,b), if an ambient point (x) witnesses a proper endpoint edge (ac), then the boundary order is

[
a,\ x,\ c,\ b
]

and

[
|xa|=|xc|<|xb|.
]

Moreover, one ambient point can witness at most one endpoint edge of the cap. 

That is almost tailor-made for the source-faithful deletion fan: the selected row may have been chosen after deleting some source, while its center and support points still belong to the ambient convex carrier.

### Important distinction

A FreshThird row center is immediately a **metric witness** because of its equal-distance equations. It is not automatically a **cap witness** in the Nivasch–Pach–Pinchasi–Zerbib sense. The latter also requires:

1. the witnessed pair to lie in one cap interval;
2. the center to lie on the non-separated side of the cap’s endpoint chord;
3. the necessary cyclic order.

The current theorem placing two blocker centers in the same strict cap does not, by itself, place the support pair of either blocker row in that cap. This is the source-side gap.

### Lean theorem worth adding

The literature’s consumer can be formalized independently of FreshThird:

```lean
theorem cap_endpoint_witness_strict
    {a b c x : ℝ²}
    (hcap : BoundaryCap B a b)
    (hc : c ∈ hcap.interval)
    (hxSide : NotSeparatedFromCap hcap x)
    (heq : dist x a = dist x c)
    (hac : a ≠ c) :
    BoundaryStrictBetween B a x c ∧
      dist x a < dist x b
```

The exact project API will differ, but this is the mathematical contract. Its proof is short: cap angles are at least right angles, the isosceles equality makes two base angles acute, and convex boundary order determines which diagonal lies inside which angle.

A second useful translation is the five-point lemma:

```lean
theorem dist_gt_of_two_cap_witnesses
    (horder : FivePointsInCapOrder B a b c d e)
    (hc : dist c a = dist c e)
    (hd : dist d b = dist d e) :
    dist a b > dist c d
```

### How it could close the live branch

The best possible outcome would be two opposed instantiations:

[
d(a,b)>d(c,d)
\qquad\text{and}\qquad
d(c,d)>d(a,b),
]

with one inequality coming from each mutual cross-deletion row.

Even one inequality may suffice when combined with a row equality or a Kalmanson inequality elsewhere in the packet.

The single source theorem to investigate is therefore not another distance theorem; it is something like:

```lean
theorem exists_capWitnessOrder_of_pinnedEndpoint_mutualDeletion
    ...
    (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    ¬ FullyDeletionRobustAt D center ∨
      Nonempty
        (FreshThirdMutualCapWitnessOrderPacket D S H B Row)
```

`FreshThirdMutualCapWitnessOrderPacket` should retain:

* the two actual blocker centers;
* one witnessed pair from each selected row;
* a genuine cap interval containing the pair;
* the non-separation facts;
* the cyclic order needed by the witness lemma.

The literature supplies a very strong clean consumer once that packet exists.

**Assessment:** highest mathematical value and likely modest Lean cost. The global counting arguments in these papers are not needed; the local witness lemmas are.

---

## 2. Aggarwal’s distance-matrix restrictions match the new row-valued interface

Aggarwal studies a cross-distance matrix obtained from an antipodal cut of a convex polygon. If the vertices on one chain are (u_1,\dots,u_r) and those on the other are (w_1,\dots,w_s), set

[
M_{ij}=d(u_i,w_j).
]

He proves that every such matrix has two local properties.

### Strict diagonal property

For (i_1<i_2) and (j_1<j_2),

[
M_{i_1j_1}+M_{i_2j_2}
<
M_{i_1j_2}+M_{i_2j_1}.
]

Equivalently, the matrix contains no (2\times2) submatrix for which the diagonal sum is at least the off-diagonal sum. This is a strict anti-Monge inequality. 

### Obtuse-angle property

Aggarwal also forbids certain patterns in which both ends of an ordered matrix simultaneously exhibit local distance minima. He packages the diagonal and obtuse-angle properties as “distance-like,” and proves that cycles with an intersection-free edge cannot occur in such matrices. 

### Why this is promising for FreshThird

Suppose two blocker centers lie on one chain and selected support points lie on the opposite chain. Every exact selected row supplies repeated entries:

[
d(c,u_1)=d(c,u_2)=d(c,u_3)=d(c,u_4).
]

Thus a selected row becomes a horizontal pattern of equal matrix entries. Two rows give two horizontal patterns. Mutual omissions or endpoint inequalities can then create:

* a forbidden (2\times2) equality pattern;
* a simultaneous-minimum pattern forbidden by the obtuse-angle property;
* a longer intersection-free cycle.

This is almost exactly the “finite row-pattern” consumer anticipated by the current Lean comment. 

For example, if order facts produced

[
d(c_1,a)=d(c_1,b),
\qquad
d(c_2,a)=d(c_2,b),
]

with (c_1<c_2) on one chain and (a<b) on the other, then the corresponding (2\times2) block has equal diagonal and off-diagonal sums, immediately violating the strict diagonal property.

### What prevents immediate use

The live data currently give:

* two blocker centers in the same cap;
* selected rows avoiding opposite sources;
* mutual omissions;
* distinct blocker centers.

They do not yet provide a single **antipodal cut** placing the centers on one ordered chain and the required support points on the other. Nor does an omission

[
w\notin K_z
]

say whether (d(c_z,w)) is larger or smaller than the selected radius.

The cap-witness lemmas from the first literature line may supply exactly those missing directions. This makes the two approaches complementary:

[
\text{cap order}
\Longrightarrow
\text{strict distance comparisons}
\Longrightarrow
\text{forbidden distance matrix}.
]

### Lean-facing theorem

A reusable local theorem would be:

```lean
theorem antipodalCut_strict_diagonal
    (hcut : AntipodalBoundaryCut B U W)
    {i₁ i₂ : U.Index} {j₁ j₂ : W.Index}
    (hi : i₁ < i₂) (hj : j₁ < j₂) :
    dist (U.point i₁) (W.point j₁) +
        dist (U.point i₂) (W.point j₂) <
      dist (U.point i₁) (W.point j₂) +
        dist (U.point i₂) (W.point j₁)
```

That theorem is considerably more reusable than hard-coding one FreshThird matrix.

**Assessment:** probably the strongest finite-pattern terminal available after the cap-order producer. It should be tried before a larger coordinate elimination.

---

## 3. Ptolemy gives a center-free equation for every selected row

Every exact selected four-row has four support points on one circle. Ptolemy therefore converts a row into an identity involving only support-to-support distances.

For support points (a,b,c,d) in cyclic order,

[
d(a,c)d(b,d)
============

d(a,b)d(c,d)+d(b,c)d(d,a).
]

Mathlib already contains

```lean
EuclideanGeometry.mul_dist_add_mul_dist_eq_mul_dist_of_cospherical
```

as its Ptolemy theorem. The documentation notes that the current statement works around the absence of a general cyclic-polygon abstraction. ([Lean Community][2])

### Why this matters

Coordinate expansion of one selected row introduces:

* two center coordinates;
* a radius or three equal-radius equations;
* coordinates for four support points.

Ptolemy eliminates the center and radius entirely. In the current mutual-deletion branch, there can be three exact four-rows:

1. the escaping `Row`;
2. the selected row (K_z) at the blocker of (z);
3. the selected row (K_w) at the blocker of (w).

The source now retains exact selected-row witnesses rather than anonymous survival propositions.  Consequently, one can write one Ptolemy identity per row and combine them with cap-order inequalities.

### Recommended adapter

```lean
theorem SelectedFourClass.ptolemy_of_boundary_order
    (K : SelectedFourClass D.A center)
    {a b c d : ℝ²}
    (ha : a ∈ K.support)
    (hb : b ∈ K.support)
    (hc : c ∈ K.support)
    (hd : d ∈ K.support)
    (horder : CyclicOrder4 B a b c d) :
    dist a b * dist c d + dist b c * dist d a =
      dist a c * dist b d
```

This should be a low-risk formalization: selected-row membership gives cosphericity, while `BoundaryIndexing` supplies distinctness and cyclic order.

Ptolemy will not create strictness on its own. Its best use is:

[
\text{Ptolemy equalities}
+
\text{cap-witness strict inequalities}
+
\text{Kalmanson/diagonal inequalities}.
]

**Assessment:** excellent supporting infrastructure and likely inexpensive to formalize. It probably will not close the residual alone.

---

## 4. Perpendicular-bisector uniqueness may attack the blocker branch directly

Aggarwal’s paper on isosceles triangles defines a “centroid” as a polygon vertex equidistant from three other vertices and studies the corresponding centroid circles. A selected four-row is stronger: its center is equidistant from four support vertices. 

A repeatedly used local observation in that paper is:

> The perpendicular bisector of a base contained in one convex boundary chain can meet the opposite boundary chain at most once.

Otherwise the convex boundary would cross the same line in an impossible way. Aggarwal uses this to bound isosceles triangles whose bases lie on one chain and apexes on another. 

A FreshThird version would say:

```lean
theorem unique_boundaryWitness_on_oppositeChain
    (hcut : BoundaryTwoChainCut B U W)
    {u v : U.Vertex}
    {x y : W.Vertex}
    (hx : dist x u = dist x v)
    (hy : dist y u = dist y v) :
    x = y
```

This could be useful in two ways:

1. If two distinct actual blocker centers are forced to witness the same support pair, contradiction.
2. If a source row and a fresh row share a support pair, their centers must occupy different chains or different chord sides; this can supply an orientation sign for the six-point theorem.

Again the obstruction is pair placement: the current interface does not automatically put a shared support pair entirely on one chain opposite both centers.

**Assessment:** narrower than the witness-order and distance-matrix routes, but potentially very short if the pinned-endpoint order packet already implies the required chain placement.

---

## 5. Cayley–Menger is the correct larger algebraic representation

The standard Euclidean distance-geometry literature recommends replacing coordinates by squared-distance variables

[
\delta_{ij}=d(p_i,p_j)^2.
]

Cayley–Menger determinants express simplex volumes entirely in terms of these squared distances. For points constrained to the plane, the determinants corresponding to three-dimensional simplex volume vanish; signed volume or separate orientation data distinguish the two possible orientations. 

This representation is attractive here because row constraints become linear:

[
\delta_{c,u_1}
==============

# \delta_{c,u_2}

# \delta_{c,u_3}

\delta_{c,u_4}.
]

### A universal named packet, not a fixed-(n) model

The current residual can source-produce:

* the pinned endpoint pair;
* source and fresh centers;
* an escaping exact four-row;
* two row points (z,w);
* blocker centers (c_z,c_w);
* exact four-support rows (K_z,K_w).

Even after choosing every support point, this is a bounded number of named roles independent of (|D.A|). Thus a solver can be legitimate if Lean first extracts this packet from every live instance and exhaustively handles aliases and boundary orders.

A reasonable packet has approximately 10–16 roles, not `Fin 17` as the entire carrier.

### Constraints

For each branch, use:

[
\begin{aligned}
&\delta_{ij}=\delta_{ji},\quad \delta_{ii}=0,\quad \delta_{ij}>0\ \text{for distinct roles};\
&\delta_{c,u_1}=\delta_{c,u_2}
=\delta_{c,u_3}=\delta_{c,u_4}
&&\text{for every selected row};\
&\operatorname{CM}(p_i,p_j,p_k,p_\ell)=0
&&\text{for planar quadruples};\
&\operatorname{signedArea}(p_i,p_j,p_k)\gtrless0
&&\text{from boundary order};\
&\text{Ptolemy identities}
&&\text{for selected support quadruples};\
&\text{cap-witness and cross-chain inequalities}
&&\text{where source-derived}.
\end{aligned}
]

Pure EDM constraints lose clockwise versus counterclockwise information, so the signed-area signs must remain part of the certificate.

### Relative value

Cayley–Menger should be the fallback after Ptolemy because Ptolemy is lower-degree and row-specific. Its main advantage is that it can combine several overlapping rows without repeatedly introducing and normalizing centers.

**Assessment:** a sound basis for an exact local solver wave, but not the first mathematical move.

---

## 6. Recent work gives a credible way to certify the nonlinear geometry

A July 2026 paper by Siddique and Mian addresses a closely analogous trust problem: nonlinear real-arithmetic solvers had declared thousands of geometric graph systems non-embeddable without producing checkable proof objects. They replace those results with exact rational case-tree certificates whose branches use polynomial factorization or rational sum-of-squares decompositions, and whose leaves close by injectivity, ideal membership, or Positivstellensatz-style positivity. The checker and soundness theorem are implemented in Lean 4. ([arXiv][3])

One important warning from that work is that complex ideal inconsistency is not enough for many real geometric obstructions: a polynomial variety may exist over (\mathbb C), while the contradiction over (\mathbb R) arises only from positivity or forced collisions. ([arXiv][3])

That matters here. Gröbner-basis elimination alone may fail to see a contradiction whose essential ingredients are:

[
\operatorname{signedArea}>0,\qquad d(a,b)>d(c,d),\qquad r>0.
]

A second 2026 paper, by Shen, Guo, Liu, and Zhi, develops a certificate architecture in which SageMath or SymPy performs Gröbner computations and Lean verifies the returned polynomial data, including remainder, basis, ideal, and radical-membership claims. ([arXiv][4])

### How this fits the repository

The repository’s existing six-point obstruction already follows the simplest version of this architecture:

1. normalize a shared chord to ((0,0),(1,0));
2. derive polynomial circle equations;
3. translate boundary order into signed-area inequalities;
4. close by `nlinarith`.

Its theorem consumes four equal-distance equations and seven orientation signs. 

For an eight- or twelve-point packet, the scaled-up workflow should be:

1. Lean extracts the named packet.
2. Normalize an anchor chord or triangle.
3. Propagate all equal-radius equations.
4. Enumerate only source-permitted order types and alias partitions.
5. Let a CAS discover factor, Gröbner, or SOS certificates.
6. Replay the minimized certificate in Lean.
7. Keep the source theorem and algebraic terminal separate.

**Assessment:** very useful proof infrastructure, but it cannot replace the missing cap/order producer.

---

# What the literature does not give

No paper I found establishes the implication

[
\text{same cap for two blocker centers}
\quad\Longrightarrow\quad
\text{the support pairs of their selected rows occupy a required cap order}.
]

Nor does mutual omission alone determine whether an omitted point is inside or outside the selected circle:

[
w\notin K_z
]

only gives

[
d(c_z,w)\ne r_z,
]

not

[
d(c_z,w)>r_z
\quad\text{or}\quad
d(c_z,w)<r_z.
]

The literature becomes effective only after boundary/cap geometry supplies that sign or witness-side information.

This makes the live bottleneck substantially more precise:

> **Produce a cap-ordered metric-witness or antipodal-distance-matrix packet from the pinned-endpoint deletion fan.**

Once that exists, several clean published consumers become available.

# Recommended next attack

## Phase 1: add the generic geometry bank

Formalize, independently of FreshThird:

```lean
cap_endpoint_witness_strict
dist_gt_of_two_cap_witnesses
unique_boundaryWitness_on_oppositeChain
antipodalCut_strict_diagonal
SelectedFourClass.ptolemy_of_boundary_order
```

The first and second come from the Nivasch–Pach–Pinchasi–Zerbib/Kominers cap-witness method; the third is perpendicular-bisector uniqueness; the fourth is Aggarwal’s strict diagonal property; the fifth wraps Mathlib Ptolemy.

## Phase 2: test one exact source theorem

The highest-value source theorem to prove or refute is:

```lean
theorem capWitnessPacket_of_pinnedEndpoint_sourceFaithfulFan
    ...
    (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row)
    (hrowEscape : ...) :
    ¬ FullyDeletionRobustAt D center ∨
      Nonempty
        (FreshThirdPinnedEndpointCapWitnessPacket D S H B Row)
```

The packet should not claim a contradiction. It should only expose one or two genuine cap-witness configurations with their exact boundary order.

## Phase 3: run a small ordered-row computation

After extracting the packet, enumerate:

* alias partitions among the named centers and supports;
* cyclic orders of the named carrier points;
* cap memberships;
* selected-row equalities;
* Kominers/NPPZ strict inequalities;
* Aggarwal diagonal/obtuse-angle restrictions;
* Ptolemy identities.

This is fundamentally different from earlier fixed-(n) runs: the carrier remains arbitrary, while the proof selects a bounded named subconfiguration from exact four-point rows.

## My current ranking

The most likely path to closure is:

[
\boxed{
\text{pinned-endpoint order packet}
;\to;
\text{ambient cap-witness inequalities}
;\to;
\text{strict distance-matrix violation}
}
]

Ptolemy should be added in parallel because it is inexpensive and may shorten the final algebra. Full Cayley–Menger or SOS machinery should be reserved for the order types that survive those two local methods.

[1]: https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/ErdosProblems/97.lean "formal-conjectures/FormalConjectures/ErdosProblems/97.lean at main · google-deepmind/formal-conjectures · GitHub"
[2]: https://leanprover-community.github.io/mathlib4_docs/Mathlib/Geometry/Euclidean/Sphere/Ptolemy.html "Mathlib.Geometry.Euclidean.Sphere.Ptolemy"
[3]: https://arxiv.org/pdf/2607.26413 "Machine-Checked Certificates for the Geometric Half of the Minimum Kochen-Specker Bound"
[4]: https://arxiv.org/abs/2604.13514 "[2604.13514] Automated Tactics for Polynomial Reasoning in Lean 4"

