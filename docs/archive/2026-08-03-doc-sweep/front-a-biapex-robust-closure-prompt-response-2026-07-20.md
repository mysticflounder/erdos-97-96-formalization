## Result

I did **not** obtain a complete proof of

```lean
Problem97.ATailFrontierLiveClosure.false_of_frontierBiApexRobustResidual
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R) :
    False
```

In particular, I did not construct either constructor of `CriticalFiberClosingCore R`, a new valid ((m,4,4)) support triangle, or another contradiction covering the all-large-cap residual. The branch therefore remains unclosed by this analysis.

I did obtain a source-faithful geometric strengthening that eliminates the card-11 and card-12 regimes and supplies the previously missing “two other caps are large” ingress for every exact-five, exact-six, or exact-seven displayed cap.

---

## 1. Complete exact-class structure at every blocker

Let (x\in A), let (b=b(x)), and let

[
E_b(r)={y\in A:d(b,y)=r}.
]

### Lemma 1 — unique blocker radius

There is exactly one radius (r_b>0) for which (|E_b(r_b)|\ge4), and

[
|E_b(r_b)|=4.
]

Moreover, (x\in E_b(r_b)).

### Proof

Suppose (r>0) and (|E_b(r)|\ge4). If (x\notin E_b(r)), then deletion of (x) leaves all of (E_b(r)), contradicting the criticality of (b(x)).

If (x\in E_b(r)) but (|E_b(r)|\ge5), then deletion of (x) leaves at least four points at radius (r), again contradicting criticality.

Thus every four-witness radius at (b) has an exact four-point class containing (x). But every such radius must equal the fixed number (d(b,x)). Hence there can be only one such radius. The chosen shell in (H3) supplies its existence. ∎

Write this unique class as (E_b).

Two immediate consequences are important:

[
H^{-1}(b)\subseteq E_b,
\qquad |H^{-1}(b)|\le4.
]

Also, for every (y\in E_b), deletion of (y) destroys the four-equidistant property at (b). Thus (b) is a valid latent blocker for all four members of its complete shell, even though the fixed map (H) need not choose (b) for all of them.

Finally, (b(x)\ne x), because a positive-radius shell centered at (x) cannot contain (x). Hence (H) has no fixed point.

**Status: PROVEN.** This uses complete ambient radius classes, not selected four-subsets.

---

## 2. Exact classification of deletion-robust centers

For any carrier center (v), its positive-radius classes are mutually disjoint. Full singleton-deletion robustness at (v) is equivalent to one of the following:

1. (v) has at least two radius classes of cardinality at least four; or
2. (v) has a radius class of cardinality at least five.

Indeed, a unique exact four-class is destroyed by deleting any of its members. Conversely, a class of size at least five survives every singleton deletion, and if there are two K4 classes, deletion of one point can affect at most one of them.

Therefore neither (O_1) nor (O_2) can be a blocker center of the type described in Lemma 1, agreeing with the omitted-image conclusion in the parent.

**Status: PROVEN.**

---

## 3. The endpoint one-hit lemma

Let (P) denote the third Moser vertex, let (C_1) be the closed cap opposite (O_1), and let (C_2) be the closed cap opposite (O_2). Thus the cap endpoints are

[
S:\ O_1,O_2,\qquad
C_1:\ O_2,P,\qquad
C_2:\ P,O_1.
]

Let (I_1=C_1\setminus{O_2,P}) and (I_2=C_2\setminus{P,O_1}) be the strict parts.

The standard endpoint-chain monotonicity for a closed Moser cap gives:

> A positive-radius circle centered at one endpoint of a cap contains at most one carrier point on that cap after the center endpoint is removed.

This is endpoint-centered monotonicity, not the false opposite-apex monotonicity highlighted in the failure registry.

Consequently, an (O_1)-radius class (T) meets each of

[
S\setminus{O_1},\qquad C_2\setminus{O_1}
]

in at most one point. Those two sets, together with (I_1), partition
(A\setminus{O_1}). Therefore

[
\boxed{|T\cap I_1|\ge |T|-2.} \tag{1}
]

Similarly, every (O_2)-radius class (U) satisfies

[
\boxed{|U\cap I_2|\ge |U|-2.} \tag{2}
]

These inequalities concern full radius classes. They remain valid when a chosen four-row is only a subset of such a class.

**Status: PROVEN mathematically from the MEC cap geometry; the exact current-file Lean adapter was not available for checking here.**

---

## 4. Both opposite caps are strictly large

Suppose first that (|C_1|=4). Then (|I_1|=2). By (1), every (O_1)-radius class of size at least four contains both points of (I_1), and it cannot have more than four points:

[
|T|-2\le |I_1|=2
\quad\Longrightarrow\quad
|T|\le4.
]

Thus every K4 class at (O_1) is exact four. There cannot be two distinct such classes, since distinct radius classes are disjoint but both would contain all of (I_1). Hence (O_1) has a unique exact four-class. Deleting either point of (I_1) destroys every K4 witness at (O_1), contradicting (H5).

Therefore

[
|C_1|\ge5.
]

The same argument at (O_2) gives

[
|C_2|\ge5.
]

Since (S) is the surplus cap,

[
|S|\ge5.
]

Thus, before using the retained pair (q,w), all three displayed caps are already strictly larger than four.

**Status: PROVEN.**

---

## 5. The cap opposite (O_1) has at least six points

Let (M) be the full (O_1)-radius class containing (q,w). By (H4),

[
|M|\ge4.
]

Let (N) be the full ambient (O_1)-radius class underlying a witness after deleting both (q) and (w).

There are two cases.

### Same radius

If (N=M), then at least four points of (M) remain after deleting (q,w). Hence

[
|M|\ge6.
]

By (1),

[
|M\cap I_1|\ge |M|-2\ge4.
]

Thus (|I_1|\ge4), so

[
|C_1|=|I_1|+2\ge6.
]

### Different radii

If (N\ne M), the two full radius classes are disjoint. Each has at least four points, so by (1),

[
|M\cap I_1|\ge2,\qquad |N\cap I_1|\ge2.
]

The two intersections are disjoint. Therefore again (|I_1|\ge4), and

[
\boxed{|C_1|\ge6.}
]

Combining all cap bounds,

[
|S|\ge5,\qquad |C_1|\ge6,\qquad |C_2|\ge5.
]

The closed-cap counting identity is

[
|S|+|C_1|+|C_2|=|A|+3,
]

because each Moser vertex is counted in two caps and every other carrier point in exactly one. Hence

[
|A|+3\ge5+6+5=16,
]

so

[
\boxed{|A|\ge13.}
]

This eliminates every card-10, card-11, and card-12 configuration directly from the robust parent data. In particular, the surviving card-11 structural SAT shadow cannot represent a Euclidean/MEC realization satisfying (H4)–(H5).

**Status: PROVEN.**

---

## 6. Exact classification of the remaining five-point opposite cap

Suppose

[
|C_2|=5.
]

Then (|I_2|=3). By (2), every K4 class (U) at (O_2) satisfies

[
|U\cap I_2|\ge |U|-2.
]

It follows that (|U|\le5). Two distinct K4 classes are impossible, because each would require at least two points of the three-point set (I_2), while distinct radius classes are disjoint.

Therefore (O_2) has exactly one K4 radius class. Full deletion robustness rules out cardinality four, so this class has exactly five points. Equality in (2) shows that it consists of

* all three points of (I_2);
* exactly one point on (S\setminus{O_2});
* exactly one point on (C_1\setminus{O_2}).

Furthermore, since deleting both (q,w) leaves a K4 witness at (O_2), this unique five-class contains at most one of (q,w).

Thus the five-point case is not an unstructured residue: it is the unique (3+1+1) radius-class mode at the robust opposite apex.

**Status: PROVEN.**

This is a source-valid ingress shape for the exact-five cap-first family. The other two displayed caps satisfy

[
|S|>4,\qquad |C_1|>4,
]

so the two “other large caps” inequalities that were missing from the generic robust residual are now available.

---

## 7. Exact six- and seven-point modes at (C_1)

The same counting gives compact classifications of the next two cap sizes.

### If (|C_1|=6)

Then (|I_1|=4).

If the original (q,w)-class itself survives the double deletion, it must have exactly six points. It contains all four points of (I_1), plus exactly one point on each adjacent endpoint chain.

If a distinct class supplies the double-deletion witness, then the original class and the surviving class are both exact four-classes. Each contains exactly two points of (I_1) and one point on each adjacent chain. Their strict-cap parts partition (I_1).

### If (|C_1|=7)

Then (|I_1|=5).

If the original class survives, it is the unique K4 class at (O_1), of size six or seven.

If a distinct class survives, the two class-size possibilities are

[
(4,4),\qquad (4,5),\qquad (5,4).
]

No third K4 class is possible.

**Status: PROVEN.**

Again, (S) and (C_2) are both larger than four. Therefore these are exact, source-valid ingress modes for the advertised exact-six and exact-seven cap-first families, provided their current Lean declarations require precisely the advertised cap cardinality, mode data, and the two other large-cap inequalities.

I could not inspect the current declarations of those families, so I have **not** counted the final constructor wiring as completed.

---

## 8. Strengthening of the cross-arm cover

On the directed cross-membership arm, the existing full-fiber theorem gives

[
|H^{-1}(b(q))|\le4.
]

The newly proved (|A|\ge13) therefore improves the number of sources outside the (q)-blocker fiber from the generic “at least six” to

[
\boxed{|A\setminus H^{-1}(b(q))|\ge9.}
]

If the exact-five, exact-six, and exact-seven cap-first consumers eliminate every cap of size (5,6,7), then all three displayed caps have size at least eight. The cap identity would then give

[
|A|\ge8+8+8-3=21,
]

and the cross-arm cover would contain at least

[
21-4=17
]

sources outside the (q)-blocker fiber.

This still does not force either terminal constructor: the cover only says that each such source preserves deletion of (q) or deletion of (w) at its actual blocker. It does not force the cross membership needed for the ordered constructor, nor a second center through a repeated-fiber pair for the same-cap constructor.

---

## Precise first missing statement

After consuming the exact-five, exact-six, and exact-seven cap-first branches, the first genuinely mathematical missing statement can be isolated as follows.

```lean
allLargeCaps_closingCore_or_retriangulation
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (hS  : 8 ≤ S.surplusCap.card)
    (hC1 : 8 ≤ S.oppCap1.card)
    (hC2 : 8 ≤ S.oppCap2.card) :
    Nonempty (CriticalFiberClosingCore R) ∨
      Nonempty (AlternativeM44Packet D.A)
```

Here `AlternativeM44Packet` is schematic: it must contain the full production contract for a different nonobtuse MEC support triangle, including MEC membership, the circumscribed branch, closed-cap semantics, and exact cap counts ((m,4,4)) with (m>4).

* The first disjunct feeds `false_of_criticalFiberClosingCore`.
* The second contradicts the no-((m,4,4)) hypothesis.
* The theorem must use the fixed critical choice (H), not a reassigned blocker map.
* It must not conclude merely that a third row passes through (q,w), because that conclusion is excluded on the directed cross arm.

**Status: CONJECTURED.** I obtained neither a proof nor empirical full-configuration verification of this statement.

A narrower ordered-output version would need to prove that among the favorable repeated fibers there are (B_0,C,K,J,X) satisfying simultaneously

[
H(C)=H(K)=B_0,\qquad
J,K\in E_X,\qquad
d(O_1,J)=d(O_1,C),
]

together with the required six-point cyclic order. The full-fiber and cap estimates above do not by themselves force the middle cross membership (K\in E_{H(J)}).

---

## Adversarial audit

The proved deductions above:

* use complete ambient radius classes;
* do not replace them with arbitrary selected rows;
* retain the fixed map (H);
* make no distinct-radius or generic-position assumption;
* apply uniformly to all (|A|>9);
* do not invoke the third-center classifier outside its directed arm;
* do not treat the displayed triangle as an ((m,4,4)) packet;
* do not assume (|A|=11), (|A|\ge14), or another cardinality without deriving it.

What remains missing is terminal coverage in the all-large-cap regime. The nonlinear rank/paraboloid formulation, global deletion-closure relation, retriangulation route, and repeated application of the card-(\ge14) producer did not yield the required cross membership, same-cap second center, strict descent invariant, or alternative MEC triangle. Consequently, none of those routes currently produces `False` from exactly (H1)–(H5).
