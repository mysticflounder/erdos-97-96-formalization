# `cardGeThirteen`: ingress-coupled case-split checkpoint

**Date:** 2026-09-03  
**Target:** `false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`  
**Status:** the former arbitrary four-way packet comparison has been reduced to a source-normalized three-arm outcome. This is a structural reduction, not yet a proof of `False`.

## 1. Fixed source data

Write

- \(A_1=S.\mathrm{oppApex1}\),
- \(A_2=S.\mathrm{oppApex2}\),
- \(q=R.\mathrm{interior\_q}\),
- \(w=R.\mathrm{interior\_w}\),
- \(H=\mathrm{lateFirstApexSystem}(R)\).

The live branch supplies two disjoint positive-radius `SelectedFourClass` rows
\(K_0,K_1\) centered at \(A_2\). The no-five hypothesis makes each support the
entire ambient radius class.

The mandatory ingress

```lean
surface.ingress : ExactFourPhysicalCommonDeletionIngress R
```

retains one deletion \(d\in\{q,w\}\), one good source \(s\), its actual blocker
\(b=H.centerAt(s)\), and a `CommonDeletionTwoCenterPacket` at centers
\((b,A_2)\). Its blocker row is the actual selected shell at \(s\); both that
row and the \(A_2\)-row omit \(d\).

A source-clean lift of the ingress \(A_2\)-row is available:

```text
U5QDeletedK4Class + card = 4
  → SelectedFourClass on the ambient carrier.
```

Under no-five it is a full radius class. Comparing its radius with the two live
rows always yields an **ingress-aligned row plus a full disjoint row of a
different radius**. This should be packaged as `IngressAlignedTwoRadiusRows`.

## 2. Selecting sources from the two pinned classes

Let

\[
J_i=K_i.\mathrm{support}\cap
S.\mathrm{capInteriorByIndex}(S.\mathrm{oppIndex2}),
\qquad
U=J_0\cup J_1.
\]

The source bounds are:

- \(|J_i|\ge2\);
- \(J_0,J_1\) are disjoint;
- at most one point of \(U\) is in the first-apex class;
- each radius slice contains at most one
  `interiorPairBadOutsideSource`.

Consequently

\[
\#\{\text{good sources in }U\}\ge |U|-3.
\]

Hence a nongrid configuration, for which \(|U|\ge5\), contains at least two
good sources. If \(|U|\ge6\), it contains at least three.

There is a useful radius refinement. Either one \(J_i\) contains two distinct
good sources, or—up to swapping the two radii—the exact sharp state is

\[
(|J_0|,|J_1|)=(3,2),
\]

with exactly one first-apex-class point in the 3-slice, one bad source in each
slice, and exactly one good source in each slice.

## 3. Normalize deletion choices before comparing packets

For a good source \(s\), define its actual selected shell

\[
C(s)=H.selectedAt(s).\mathrm{support}
\]

and its admissible deletion set

\[
O(s)=\{d\in\{q,w\}:d\notin C(s)\}.
\]

The source-specific ingress producer proves \(O(s)\ne\varnothing\).

For two distinct good sources \(s_0,s_1\), there are only two possibilities.

### 3.1 Common admissible deletion

If \(O(s_0)\cap O(s_1)\ne\varnothing\), choose
\(d\in O(s_0)\cap O(s_1)\). Both actual blocker rows and an \(A_2\)-row survive
deleting the same point \(d\).

Split only on the blocker centers \(b_0,b_1\):

1. **Equal blocker.**  
   `selectedSupports_eq_of_actualBlockers_eq` gives one common four-point
   shell containing \(s_0,s_1\) and omitting \(d\).

2. **Distinct blockers.**  
   The three distinct centers \(A_2,b_0,b_1\) carry exact four-point rows
   after the same deletion. This constructs
   `ThreeCenterCommonDeletionExactRows`.

If the two sources have the same \(A_2\)-radius, the equal-blocker shell meets
their full class in exactly \(\{s_0,s_1\}\). In the distinct-blocker case both
cross-memberships cannot hold: otherwise \(A_2,b_0,b_1\) would be three
distinct carrier centers equidistant from \(s_0,s_1\). Thus at least one
directed source omission is forced.

### 3.2 Complementary singleton omissions

If the omission sets are disjoint, the two-element universe forces them to be
opposite singletons. After swapping the sources if needed,

\[
q\notin C(s_0),\quad w\in C(s_0),\qquad
w\notin C(s_1),\quad q\in C(s_1).
\]

The blockers are automatically distinct: equal blockers would give equal
supports and hence equal \(q/w\)-omission sets.

Therefore the honest source-normal outcome has **three**, not four, arms:

```lean
inductive TwoGoodSourceDeletionCouplingOutcome
| commonDeletion_equalBlocker
| commonDeletion_distinctBlockers
| complementaryCrossed
```

The old `different deletion + equal blocker` and partial-cross branches are
artifacts of comparing two arbitrarily prechosen ingress witnesses rather
than choosing the deletion witnesses canonically.

## 4. The crossed arm is an exact five-point saturation

With three good sources, assigning one admissible deletion to each forces two
to share a deletion. Therefore a complementary-crossed **nongrid** arm implies

\[
|U|=5
\]

and exactly two good sources. Equality in the count forces:

- the slice sizes are \(3+2\);
- exactly one \(U\)-point is in the first-apex class;
- each slice contains exactly one bad source.

There are only two crossed distributions, up to swapping radii:

1. the first-apex point lies in the 2-slice, so the two good sources are in
   the 3-slice and have the same \(A_2\)-radius;
2. the first-apex point lies in the 3-slice, so there is one good source in
   each radius slice.

This packet should be named something like
`ExactFiveInteriorCrossedSaturation`.

## 5. Exact negative control for the same-radius crossed pair core

The crossed same-radius arm yields the four pair equalities

\[
\begin{aligned}
d(A_1,q)&=d(A_1,w),\\
d(A_2,s_0)&=d(A_2,s_1),\\
d(b_0,s_0)&=d(b_0,w),\\
d(b_1,s_1)&=d(b_1,q),
\end{aligned}
\]

together with \(q\notin C(s_0)\) and \(w\notin C(s_1)\).

These facts plus the Moser cap order are **geometrically realizable**. Put all
roles on one unit circle at the following counterclockwise angles:

```text
A2=0°, q=90°, w=120°, A0=140°,
s0=160°, s1=200°, A1=285°, b0=320°, b1=325°.
```

The three apex gaps are \(140^\circ,145^\circ,75^\circ\), so the circle is the
circumcircle/minimum enclosing circle of the apex triangle. The open arcs put

- \(q,w\) in the cap opposite \(A_1\);
- \(s_0,s_1\) in the cap opposite \(A_2\);
- \(b_0,b_1\) in the cap opposite \(A_0\).

Every displayed equality follows exactly from cosine symmetry. The required
opposite omissions also hold. All nine points are in strict convex position.

Therefore no theorem using only this four-equality pair core, cap order,
strict convexity, triangle inequalities, or Kalmanson inequalities can close
the crossed branch. A valid terminal must use at least one of:

- the two completion points of a blocker row and exact-four exclusion;
- the full common-deletion packet;
- `no_qfree`/minimality semantics;
- interaction with the second \(A_2\)-radius class.

## 6. Secondary split on the ingress-aligned \(A_2\)-row

Let \(K_{\mathrm{in}}\) be the full ambient \(A_2\)-class lifted from the
mandatory ingress \(B_2\), and let \(d'\) be the other member of \(\{q,w\}\).

- If \(d'\notin K_{\mathrm{in}}\), the same \(A_2\)-row survives both
  deletions.
- If \(d'\in K_{\mathrm{in}}\), robustness after deleting \(d'\) produces a
  four-point replacement row. It cannot have the same radius as
  \(K_{\mathrm{in}}\), because the full four-point class at that radius loses
  one member and has only three remaining points. Thus a different-radius,
  disjoint replacement class is forced.

This should be packaged as `IngressRowDeletionOutcome`. It is the correct
replacement for trying to instantiate the overly specialized
`BiSurvivalCanonicalRows`.

## 7. Lean implementation order

The recommended source-clean formalization sequence is:

1. `IngressAlignedTwoRadiusRows`.
2. The two-good-source selector, strengthened to expose two distinct sources
   when \(|U|\ge5\).
3. `TwoRadiusGoodPairOutcome`, including the sharp 3+2 saturation.
4. The pure two-deletion normalization lemma.
5. `TwoGoodSourceDeletionCouplingOutcome`.
6. A neutral `TwoCenterTwoDeletionPacket` if needed; use the existing
   three-center packet where its signature matches.
7. `IngressRowDeletionOutcome`.
8. Geometric corollary excluding mutual source cross-hit in the
   same-radius/distinct-blocker/common-deletion arm.

These are reductions with real downstream information. None should be
advertised as closing the live sorry.

## 8. Remaining mathematical terminals

After this checkpoint, the all-cardinality work is concentrated in:

- common deletion + equal blocker;
- common deletion + distinct blockers / three-center packet;
- exact-five complementary-crossed saturation;
- the exact adjacent-cap Grid branch.

The crossed pair-level geometry has been refuted as a terminal. The next
computational or synthetic probe must add completed blocker rows and
deletion/minimality semantics, not more Kalmanson clauses on the four pair
equalities alone.
