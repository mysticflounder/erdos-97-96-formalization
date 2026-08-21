---
title: "The Erdős 97 Descent Argument"
subtitle: "An atomic prose proof reconstruction, blocker reformulation, and exact open frontier"
author: "Working proof manuscript"
date: "19 August 2026"
---

**Repository:** `mysticflounder/erdos-97-96-formalization`  
**Source snapshot checked:** 19 August 2026  
**Proof-status measurement in the repository README:** 18 August 2026  
**Document status:** Research manuscript. The elementary descent, packet extraction, and `IsM44` branch are reconstructed in full. The general non-`IsM44` theorem remains open.

# Contents

**0.** Reader's guide and status convention  
**1.** Basic objects  
**2.** Atomic calculus of a selected class under deletion  
**3.** Exact deletion failure and canonical blockers  
**4.** Pinned multiplicity reformulation  
**5.** Incidence consequences of the all-blockers relation  
**6.** Elementary descent and strong induction  
**7.** Minimum-enclosing-circle and surplus-cap extraction  
**8.** Atomic erased-pin interfaces in the `IsM44` branch  
**9.** The `IsM44` branch, expanded atomically  
**10.** The non-`IsM44` branch, expanded atomically  
**11.** Current decomposition of the open theorem  
**12.** Results of the strengthened geometric attack  
**13.** What the missing global theorem must add  
**14.** Proposed atomic all-blockers API  
**15.** Conditional complete proof of descent  
**16.** Complete proof-status ledger  
**17.** Theorem-to-source crosswalk  
**Appendix A.** Exact rational local B2 stress model  
**Appendix B.** Adversarial checklist for terminal lemmas  
**Appendix C.** Final research conclusion

## 0. Reader's guide and status convention

This document expands the descent argument into small, individually checkable statements. Its purpose is not merely to restate the Lean call graph. It makes explicit every logical transition normally compressed into phrases such as “deletion destroys the witness,” “minimality gives a blocker,” or “the cap argument supplies a removable point.”

Four status labels are used.

- **[PROVED]** The statement is proved in the current Lean development without a `sorry` on its transitive path, apart from the repository's ordinary core axioms.
- **[CERTIFIED]** The statement is closed on the current proof spine using the project's declared `native_decide` certificate trust boundary. It does not reach `sorryAx`, but its axiom closure includes `Lean.ofReduceBool` and `Lean.trustCompiler`.
- **[DERIVED]** The statement follows mathematically from proved repository lemmas, and a complete prose proof is supplied here, but the exact standalone declaration proposed in this manuscript may not yet exist under that name in Lean.
- **[OPEN]** A genuinely new theorem is still required. An open coordinator, a finite abstraction, or an intended geometric picture is not counted as a proof.

The current public README says that neither Problem 97 nor Problem 96 is proved. It reports 36 `sorry`-carrying leaves reachable from the Problem 97 publication target, all below the general non-`IsM44` A-tail contradiction. Those leaves are one refinement tree for a single load-bearing mathematical assertion.

> **Global non-`IsM44` contradiction.** There is no minimal nonempty convexly independent K4 set of cardinality greater than nine that admits a surplus-cap packet but admits no `IsM44` surplus-cap packet.

If that assertion is proved, the existing source-clean adapters immediately close `RemovableVertexOfLarge`, then the descent theorem, then the strong-induction wrapper. A different theorem that produces a removable vertex under the same hypotheses would close the same spine.

### 0.1 The proof in one dependency diagram

```text
Counting floor: every counterexample has at least 9 points       [PROVED]
Exact 9-point endpoint is impossible                              [PROVED]

For |A| > 9:
  MEC/K4 geometry produces a surplus-cap packet                   [PROVED]
  Split on existence of an IsM44 packet
    IsM44 packet exists -> construct a removable point             [CERTIFIED]
    no IsM44 packet exists -> global A-tail contradiction          [OPEN]
  Therefore a removable point exists                              [OPEN transitively]
  Delete it to obtain a smaller counterexample                    [PROVED]
  Contradict strong-induction minimality                           [PROVED]
```

The only unconditional gap in this diagram is the general non-`IsM44` assertion. The rest of this manuscript explains exactly why.

---

## 1. Basic objects

Let `A` be a finite set of points in the Euclidean plane. In Lean it is a `Finset ℝ²`.

For any finite set `S` and point `x`, write

\[
S-x:=S.\operatorname{erase}(x).
\]

This notation is used only in prose formulas; Lean continues to use `S.erase x`.

### A0. Selected distance class

For a center `p` and radius `r`, define

\[
C_A(p,r)=\{q\in A:\operatorname{dist}(p,q)=r\}.
\]

This is `SelectedClass A p r`.

**Status:** [PROVED definition]

### A1. K4 at a center

Write `K4At(A,p)` for the assertion that there is a positive radius `r` such that

\[
|C_A(p,r)|\ge 4.
\]

This is `HasNEquidistantPointsAt 4 A p`.

**Status:** [PROVED definition]

### A2. Global K4 property

Write `K4(A)` for

\[
\forall p\in A,\;K4At(A,p).
\]

This is `HasNEquidistantProperty 4 A`.

**Status:** [PROVED definition]

### A3. Convex independence

`ConvexIndep A` means that no point of `A` lies in the convex hull of the other points of `A`. For finite planar sets this is the strict-convex-position condition used throughout the repository.

**Status:** [PROVED definition]

### A4. Counterexample

A Problem 97 counterexample is a finite set `A` such that

1. `A` is nonempty;
2. `A` is convexly independent; and
3. `K4(A)` holds.

The Lean predicate is

```lean
def IsCounterexample (A : Finset ℝ²) : Prop :=
  A.Nonempty ∧ ConvexIndep A ∧ HasNEquidistantProperty 4 A
```

**Status:** [PROVED definition]

### A5. Removable vertex

A point `x` is removable from `A` if

\[
x\in A
\quad\text{and}\quad
K4(A-x).
\]

The Lean definition is

```lean
def IsRemovableVertex (A : Finset ℝ²) (x : ℝ²) : Prop :=
  x ∈ A ∧ HasNEquidistantProperty 4 (A.erase x)
```

Convex independence is not repeated because it is inherited by subsets.

**Status:** [PROVED definition]

### A6. Strong-induction minimality

For a fixed counterexample `A`, the hypothesis used by descent is

\[
\forall B,
\bigl(|B|<|A|\bigr)\land
\bigl(B\ne\varnothing\bigr)\land
\operatorname{ConvexIndep}(B)\land
K4(B)
\Longrightarrow\bot.
\tag{Min}
\]

This does not assert that `A` was selected by a separate global minimization operation. It is exactly the induction hypothesis available while proving the cardinality-`|A|` case by strong induction.

**Status:** [PROVED interpretation of the Lean hypothesis]

---

## 2. Atomic calculus of a selected class under deletion

Fix a finite set `A`, a deleted point `x`, a surviving center `p`, and a real radius `r`.

### L0. Membership in a selected class

For any point `q`,

\[
q\in C_A(p,r)
\quad\Longleftrightarrow\quad
q\in A\text{ and }\operatorname{dist}(p,q)=r.
\]

**Proof.** This is the definition of the filtered finite set `SelectedClass`. QED.

**Status:** [PROVED]

### L1. A positive-radius class does not contain its center

If `r>0`, then

\[
p\notin C_A(p,r).
\]

**Proof.** `dist(p,p)=0`, so membership would imply `r=0`, contrary to `r>0`. QED.

**Status:** [DERIVED from metric identities]

### L2. Exact erase identity

For every `p,r,x`,

\[
C_{A-x}(p,r)=C_A(p,r)-x.
\tag{2.1}
\]

**Proof.** A point `q` belongs to the left side exactly when `q∈A`, `q≠x`, and `dist(p,q)=r`. Those are exactly the membership conditions for the right side. QED.

**Status:** [PROVED as `selectedClass_erase_eq`]

### L3. Deleting a point outside a class leaves the class unchanged

If `x∉C_A(p,r)`, then

\[
C_{A-x}(p,r)=C_A(p,r).
\]

**Proof.** Apply (2.1); erasing a nonmember changes nothing. QED.

**Status:** [DERIVED]

### L4. Deleting a member lowers the class cardinality by exactly one

If `x∈C_A(p,r)`, then

\[
|C_{A-x}(p,r)|=|C_A(p,r)|-1.
\]

**Proof.** Apply (2.1) and the finite-set cardinality formula for erasing a member. QED.

**Status:** [DERIVED]

### L5. A class of at least five survives every single deletion

If `r>0` and `|C_A(p,r)|≥5`, then for every `x`,

\[
|C_{A-x}(p,r)|\ge4.
\]

**Proof.** If `x` is outside the class, use L3. If `x` is inside, L4 leaves at least four points. QED.

**Status:** [PROVED in the robustness library]

### L6. Two distinct heavy radii cannot both be destroyed by one deletion

Suppose `r₁,r₂>0`, `r₁≠r₂`, and both selected classes have cardinality at least four. Deleting one point `x` leaves at least one of the two classes with cardinality at least four.

**Proof.** A point cannot belong to both classes: otherwise its distance from `p` would equal both radii, forcing `r₁=r₂`. Hence `x` can lie in at most one class. The other class is unchanged by L3. QED.

**Status:** [PROVED as the two-heavy-radii robustness theorem]

### L7. Exact four containing the deleted point is the only way to destroy a specified heavy class

Assume `|C_A(p,r)|≥4`. If the class at radius `r` has fewer than four points after deleting `x`, then

\[
x\in C_A(p,r)
\quad\text{and}\quad
|C_A(p,r)|=4.
\tag{2.2}
\]

**Proof.** If `x` were outside, L3 would preserve at least four points. Thus `x` lies in the class. L4 says the new cardinality is the old cardinality minus one. Being at most three forces the old cardinality to be at most four; the assumed lower bound makes it exactly four. QED.

**Status:** [DERIVED]

### L8. Exact erased pin

An **exact erased pin** at `(p,x)` is a positive radius `r` satisfying (2.2). Deleting `x` changes that exact four-point class into a three-point class. The three surviving points form the `ErasedPinTriple A x p` used by the continuation proof.

**Status:** [PROVED interface]

### L9. Excluding exact erased pins is sufficient for survival at a center

Assume `K4(A)` and `p∈A-x`. If no positive radius at `p` is an exact erased pin through `x`, then `K4At(A-x,p)`.

**Proof.** Since `p∈A`, global K4 provides a positive radius `r` with at least four points in `C_A(p,r)`. If deletion left fewer than four at that radius, L7 would produce an exact erased pin, contrary to the hypothesis. At least four therefore survive. QED.

**Status:** [PROVED as `selectedClass_erase_witness_of_no_exact_erased_pin`]

### L10. Centerwise witnesses assemble to removability

Suppose `x∈A` and every `p∈A-x` has a positive-radius class of at least four points in `A-x`. Then `x` is removable.

**Proof.** The centerwise witnesses are exactly the universal quantifier in `K4(A-x)`. Pair that property with `x∈A`. QED.

**Status:** [PROVED as `removableVertex_of_selectedClass_erase_witnesses`]

### Important caution

An exact four-point class containing `x` does **not** by itself prove that deletion fails at `p`. A second heavy radius might survive. Failure at a center is stronger: every heavy radius must be destroyed. The next section atomizes that stronger conclusion.

---

## 3. Exact deletion failure and canonical blockers

### B0. Semantic failure predicate

For `p∈A-x`, define

\[
\operatorname{Fail}_A(p,x)
:\Longleftrightarrow
\neg K4At(A-x,p).
\]

Equivalently, every positive-radius class at `p` in the erased carrier has cardinality at most three.

**Status:** [DERIVED definition]

### B1. Failure bounds every erased class by three

If `Fail_A(p,x)`, then for every `ρ>0`,

\[
|C_A(p,\rho)-x|\le3.
\tag{3.1}
\]

**Proof.** By L2, the left side is the selected class at radius `ρ` in `A-x`. If it had cardinality at least four, it would witness `K4At(A-x,p)`. QED.

**Status:** [PROVED inside the minimal unique-four construction]

### B2. Every heavy full-carrier class contains the deleted point

Assume `Fail_A(p,x)`. If `ρ>0` and `|C_A(p,ρ)|≥4`, then

\[
x\in C_A(p,\rho).
\]

**Proof.** If `x` were outside, L3 would preserve the class with at least four points, contradicting failure. QED.

**Status:** [PROVED]

### B3. Every heavy full-carrier class has exactly four points

Under the same hypotheses, every positive heavy radius `ρ` satisfies

\[
|C_A(p,\rho)|=4.
\]

**Proof.** B2 says `x` lies in the class. Equation (3.1) and L4 show that the full class has at most four points. It already has at least four. QED.

**Status:** [PROVED]

### B4. The heavy radius is unique

Assume `Fail_A(p,x)` and `K4(A)`. Then there is exactly one positive radius at `p` whose selected class has at least four points.

**Proof.** K4 at `p` supplies at least one heavy radius. If `ρ` and `r` were two heavy radii, B2 would put `x` in both corresponding classes. Equality of both distances to `dist(p,x)` forces `ρ=r`. QED.

**Status:** [PROVED]

### B5. Unique-four center

A point `p` is a **unique-four center** if

1. `p∈A`;
2. there is a positive radius `r` with `|C_A(p,r)|=4`; and
3. every positive radius with at least four points equals `r`.

This is `ATailMinimalUniqueFourCover.IsUniqueFourCenter A p`.

By B1-B4, if `A` is K4 and deletion of `x` fails at a surviving center `p`, then `p` is a unique-four center and `x` belongs to its unique four-point class.

**Status:** [PROVED]

### B6. Canonical unique four-class

Write `U_p` for `uniqueFourClass A p`. At a unique-four center this is the unique selected class of cardinality four. It satisfies

\[
|U_p|=4,
\qquad
U_p\subseteq A,
\qquad
p\notin U_p.
\tag{3.2}
\]

**Proof.** The first two properties belong to the selected-class construction. The defining radius is positive, so L1 gives the last property. QED.

**Status:** [PROVED, with the last clause DERIVED explicitly here]

### B7. Membership in a canonical row destroys the center

If `p` is a unique-four center and `x∈U_p`, then

\[
\neg K4At(A-x,p).
\]

**Proof.** The unique heavy class loses `x` and has only three survivors. Every other positive radius had fewer than four points before deletion and cannot gain points under deletion. QED.

**Status:** [PROVED as `not_hasNEquidistantPointsAt_erase_of_mem_uniqueFourClass`]

### B8. Exact semantic blocker equivalence

Assume `K4(A)` and `p∈A-x`. Then

\[
\operatorname{Fail}_A(p,x)
\quad\Longleftrightarrow\quad
\bigl(p\text{ is a unique-four center and }x\in U_p\bigr).
\tag{3.3}
\]

**Proof.** The forward implication is B1-B5. The reverse implication is B7. QED.

**Status:** [DERIVED from proved repository lemmas; recommended as a standalone Lean adapter]

### B9. Canonical blocker relation

Define

\[
\operatorname{Blocks}_A(p,x)
:\Longleftrightarrow
p\in A-x
\text{ and }
\operatorname{Fail}_A(p,x).
\]

Under K4, equation (3.3) gives

\[
\operatorname{Blocks}_A(p,x)
\quad\Longleftrightarrow\quad
p\text{ is a unique-four center and }x\in U_p.
\tag{3.4}
\]

The terminology is source-oriented: `p` blocks deletion of the source `x`.

**Status:** [DERIVED]

### B10. Removable if and only if unblocked

Assume `K4(A)` and `x∈A`. Then

\[
\operatorname{IsRemovableVertex}(A,x)
\quad\Longleftrightarrow\quad
\neg\exists p\in A,\;\operatorname{Blocks}_A(p,x).
\tag{3.5}
\]

**Proof.** `x` is removable exactly when K4 survives at every center of `A-x`. Negating that universal statement gives a surviving center at which K4 fails, which is exactly a blocker. QED.

**Status:** [DERIVED; recommended standalone interface]

### B11. Minimality forces every source to be blocked

Let `A` be a minimal counterexample with more than one point. Then

\[
\forall x\in A,\;\exists p\in A,\;\operatorname{Blocks}_A(p,x).
\tag{3.6}
\]

**Proof.** If some `x` had no blocker, B10 would make it removable. The elementary deletion theorem would produce a smaller nonempty convexly independent K4 set, contradicting minimality. QED.

**Status:** [PROVED in existential unique-four form]

### B12. Critical shell systems choose blockers; they do not retain all blockers

A `CriticalShellSystem` chooses, for every source `x`, one blocker center `β(x)` and one exact four-point row through `x`. The repository proves that

\[
\beta(x)\text{ is a unique-four center},
\qquad
\beta(x)\ne x,
\qquad
x\in U_{\beta(x)},
\]

and that the chosen shell support equals the canonical class `U_{β(x)}`.

The all-blockers relation is stronger data: a source may belong to several canonical rows, while a critical shell system records only one selected row. This matters whenever a later argument needs to choose a blocker strategically.

**Status:** [PROVED for the selected blocker; all-blockers packaging is DERIVED]

---

## 4. Pinned multiplicity reformulation

### P0. Pinned multiplicity

Let

\[
\mu_A(p)=\max_{r>0}|C_A(p,r)|.
\]

This is the repository's `pinnedMultiplicity A p`.

**Status:** [PROVED definition]

### P1. K4 is a multiplicity lower bound

For every center `p`,

\[
K4At(A,p)
\quad\Longleftrightarrow\quad
4\le\mu_A(p).
\tag{4.1}
\]

Consequently,

\[
K4(A)
\quad\Longleftrightarrow\quad
\forall p\in A,\;4\le\mu_A(p).
\]

**Status:** [PROVED in `PinnedMultiplicity.lean`]

### P2. One deletion changes pinned multiplicity by at most one

For a surviving center `p`,

\[
\mu_{A-x}(p)\le\mu_A(p)
\le\mu_{A-x}(p)+1.
\tag{4.2}
\]

**Proof.** Every erased selected class is obtained by deleting at most one member from the corresponding full class. Taking maxima preserves both inequalities. QED.

**Status:** [DERIVED]

### P3. Multiplicity blocker

Define

\[
\operatorname{MultiplicityBlocks}_A(p,x)
:\Longleftrightarrow
p\in A-x,
\quad
\mu_A(p)=4,
\quad
\mu_{A-x}(p)=3.
\]

### P4. Three equivalent blocker descriptions

Assume `K4(A)` and `p∈A-x`. The following are equivalent:

1. deletion of `x` destroys K4 at `p`;
2. `p` is a unique-four center and `x∈U_p`;
3. `MultiplicityBlocks_A(p,x)`.

**Proof.** The equivalence of (1) and (2) is B8. Under (2), the unique heavy class has cardinality four and becomes a three-point class after erasing `x`; every other class has cardinality at most three, so the two multiplicities are exactly four and three. Under (3), equation (4.1) says K4 fails after deletion, giving (1). QED.

**Status:** [DERIVED; this is the most useful pinned-multiplicity adapter]

### P5. Why a bare multiplicity restatement does not close descent

The statement

\[
\exists x\in A,\;\forall p\in A-x,\;4\le\mu_{A-x}(p)
\]

is definitionally the same removable-vertex goal. Merely restating `RemovableVertexOfLarge` in this notation adds no mathematical information.

The useful strengthening is to retain the complete relation of all pairs `(p,x)` satisfying P4. That relation canonically records every possible blocker rather than selecting one blocker too early.

**Status:** [DERIVED architectural conclusion]

---

## 5. Incidence consequences of the all-blockers relation

Let

\[
U=\{p\in A:p\text{ is a unique-four center}\},
\qquad
u=|U|,
\qquad
n=|A|.
\]

For `p∈U`, let `R_p=U_p`. Define the blocker degree of a source `x` by

\[
d(x)=|\{p\in U:x\in R_p\}|.
\]

Assume throughout this section that `A` is a minimal counterexample.

### I0. Every row has exactly four sources

For every `p∈U`,

\[
|R_p|=4.
\]

**Status:** [PROVED]

### I1. No center lies in its own row

For every `p∈U`,

\[
p\notin R_p.
\]

**Proof.** The row radius is positive. QED.

**Status:** [DERIVED]

### I2. Every source has positive blocker degree

For every `x∈A`,

\[
d(x)\ge1.
\]

**Proof.** This is B11 in incidence notation. QED.

**Status:** [PROVED in existential form]

### I3. Exact incidence count

Let

\[
I=\{(p,x):p\in U,\;x\in R_p\}.
\]

Then

\[
|I|=4\nu
\quad\text{and}\quad
\sum_{x\in A}d(x)=4\nu.
\tag{5.1}
\]

**Proof.** Sum the exact row cardinality four over all centers, then count the same incidences by sources. QED.

**Status:** [DERIVED]

### I4. Cover bound

\[
n\le4\nu.
\tag{5.2}
\]

**Proof.** By I2, each source contributes at least one to the incidence sum. Hence

\[
n=\sum_{x\in A}1
\le\sum_{x\in A}d(x)
=4\nu.
\]

QED.

**Status:** [PROVED as `card_le_four_mul_uniqueFourCenters`]

### I5. Average blocker degree

\[
\frac1n\sum_{x\in A}d(x)=\frac{4\nu}{n}.
\]

Since `U⊆A`, one has `ν≤n`; therefore the average blocker degree is at most four. Together with I2, some source has between one and four blockers.

**Status:** [DERIVED]

### I6. Distinct-center rows meet in at most two points

If `p,q∈U` and `p≠q`, then

\[
|R_p\cap R_q|\le2.
\tag{5.3}
\]

**Proof.** `R_p` and `R_q` lie on two circles with distinct centers. Two distinct Euclidean circles have at most two common points. The repository proves the exact finite-set form used here. QED.

**Status:** [PROVED]

### I7. The canonical row map is injective

If `R_p=R_q` for `p,q∈U`, then `p=q`.

**Proof.** If the centers were distinct, their row intersection would have cardinality four, contradicting I6. QED.

**Status:** [DERIVED]

### I8. Strict convexity forbids three carrier points on one line

Every line contains at most two points of `A`.

**Proof.** Among three distinct collinear points, one lies between the other two and therefore belongs to their convex hull, contradicting convex independence. QED.

**Status:** [DERIVED from `ConvexIndep`]

### I9. Pair codegree is at most two

Fix distinct sources `x,y∈A`. At most two centers `p∈U` have both `x,y∈R_p`.

**Proof.** Such a center satisfies `dist(p,x)=dist(p,y)`, so it lies on the perpendicular bisector of segment `xy`. All candidate centers are carrier points. I8 allows at most two carrier points on that line. QED.

**Status:** [DERIVED; potentially useful new generic lemma]

### I10. Pair-incidence inequality

Each row contains six unordered source pairs. By I9 each source pair occurs in at most two rows. Therefore

\[
6\nu\le2\binom n2=n(n-1).
\tag{5.4}
\]

**Status:** [DERIVED]

### I11. Shared-source second-moment inequality

Counting triples consisting of a source and two distinct blockers gives

\[
\sum_{x\in A}\binom{d(x)}2
=
\sum_{\{p,q\}\subseteq U}|R_p\cap R_q|
\le2\binom\nu2.
\tag{5.5}
\]

**Status:** [DERIVED]

### I12. Why the incidence inequalities do not contradict minimality

The bounds I4, I10, and I11 are compatible for every `n>9`. For example, I4 only forces `ν≥n/4`, while I10 is a quadratic upper bound. Even the Cauchy lower bound on the left side of (5.5) is vacuous in the relevant range.

Abstract four-uniform covers also satisfy all these conditions. For `n=4ν` with `ν≥2`, partition the sources into disjoint blocks of four. Choose one center in the preceding block cyclically and assign each chosen center the next block as its row. The rows cover every source, omit their own centers, have pairwise intersection zero, and have pair codegree one. This abstract system is not asserted to be Euclidean; it proves that pure finite incidence data cannot be the terminal contradiction.

**Status:** [DERIVED negative result]

### I13. A blocker map forces a directed cycle

Choose one blocker `β(x)∈U` for every source `x∈A`. Because no center lies in its own row, `β(x)≠x`. Restricting to `U` gives a fixed-point-free map

\[
\beta:U\longrightarrow U.
\]

Every finite self-map has a directed cycle, and the absence of fixed points makes the cycle length at least two.

**Status:** [DERIVED; the existing critical shell system supplies such a chosen map]

### I14. A directed cycle alone is not contradictory

For an edge `x→p`, the only immediate metric relation is

\[
x\in R_p,
\qquad
\operatorname{dist}(p,x)=r_p,
\]

where `r_p` is the canonical radius at `p`. Radii at different centers need not agree. A two-cycle merely makes both canonical radii equal to the distance between the two centers; two equal-radius circles with that separation are geometrically possible. Longer cycles likewise carry no monotone quantity by themselves.

A successful cycle proof therefore needs an additional potential—cap index, cyclic boundary order, signed orientation, or another global invariant—that changes strictly along every strategically chosen blocker edge.

**Status:** [DERIVED research boundary]

---

## 6. The elementary descent and strong induction

### D0. Deletion of a removable vertex

Let `A` be convexly independent, let `x` be removable, and suppose `1<|A|`. Set

\[
B=A-x.
\]

Then:

1. `B` is nonempty;
2. `|B|<|A|`;
3. `B` is convexly independent; and
4. `K4(B)`.

**Proof.** Since `x∈A`, `|B|=|A|-1`, which is positive and strictly smaller. Convex independence is hereditary under subsets. K4 of `B` is the second component of removability. QED.

**Status:** [PROVED as `smaller_counterexample_of_removable`]

### D1. Descent contradicts minimality

Let `A` be a nonempty convexly independent K4 set with `9<|A|`, and assume `(Min)`. If `A` has a removable vertex, then `False`.

**Proof.** Since `|A|>9`, one has `|A|>1`. Apply D0 to obtain a smaller nonempty convexly independent K4 set `B`. This contradicts `(Min)`. QED.

**Status:** [PROVED; this is the body of `descent_contradicts_minimality` after the removable vertex is obtained]

### D2. Strong-induction assembly

Suppose:

1. every counterexample has at least nine points;
2. no nine-point counterexample exists; and
3. every counterexample of size greater than nine contradicts the strong-induction minimality hypothesis.

Then no counterexample exists.

**Proof.** Strongly induct on `n=|A|`. A putative counterexample has `n≥9`. If `n=9`, use the endpoint theorem. If `n>9`, the strong-induction hypothesis excludes every smaller counterexample and therefore supplies `(Min)`; apply descent. QED.

**Status:** [PROVED as `UniversalProblem97_of_reduction`]

### D3. Exact location of the hard theorem

The current theorem `descent_contradicts_minimality` obtains the removable point by calling `RemovableVertexOfLarge`, then applies D0 and `(Min)`. No additional geometry occurs in `Descent.lean`.

**Status:** [PROVED source reading]

---

## 7. Minimum-enclosing-circle and surplus-cap extraction

This section expands `MEC.nonempty_surplusCapPacket_of_K4` into its atomic geometric and counting claims.

### M0. At least three carrier points

If `9<|A|`, then `A` has at least three points.

**Status:** [PROVED arithmetic]

### M1. Convex independence implies noncollinearity

If `A` is convexly independent and has at least three points, then `A` is not collinear.

**Proof.** Three distinct collinear points contain one point between the other two, contradicting convex independence. QED.

**Status:** [PROVED]

### M2. Minimum enclosing circle exists

A nonempty finite planar set has a minimum enclosing circle, with a center and nonnegative radius containing every point of `A`.

**Status:** [PROVED in the repository's MEC development]

### M3. Boundary-support dichotomy

For a noncollinear finite planar set, the minimum enclosing circle is supported either

1. by a diametrically opposite pair of carrier points; or
2. by at least three carrier points on the boundary.

**Status:** [PROVED in the repository's Sylvester/MEC development]

### M4. K4 excludes the diameter branch

For a nonempty noncollinear convexly independent K4 set, the diameter-supported alternative is impossible. Hence at least three points of `A` lie on the MEC boundary.

**Status:** [PROVED as `no_diameter_under_k4`]

### M5. Non-obtuse circumscribed boundary triple

From the boundary set one can choose three pairwise distinct boundary points

\[
v_1,v_2,v_3
\]

forming a non-obtuse circumscribed Moser triangle. They are noncollinear and belong to `A`.

**Status:** [PROVED]

### M6. Structural Moser triangle

The circumscribed branch records the pairwise-distinctness proofs, allowing the MEC triangle to be projected to the structural `Problem97.MoserTriangle` consumed by the cap library.

**Status:** [PROVED as `MoserTriangle.toStructural`]

### M7. Closed caps

Define three closed caps by the opposite-arc/chord predicate:

\[
C_1=A\cap\operatorname{Cap}(v_2v_3;v_1),
\quad
C_2=A\cap\operatorname{Cap}(v_3v_1;v_2),
\quad
C_3=A\cap\operatorname{Cap}(v_1v_2;v_3).
\]

In Lean these are filters using `OnArcOpposite`.

**Status:** [PROVED construction]

### M8. Triangle-vertex cap incidences

Each triangle vertex lies in the two caps for which it is a chord endpoint and does not lie in the cap opposite itself. Thus each of `v₁,v₂,v₃` contributes exactly two cap incidences.

**Proof.** Endpoint membership follows because the relevant signed area is zero. Opposite-cap exclusion follows from the nonzero signed area of the triangle. QED.

**Status:** [PROVED]

### M9. Every non-triangle carrier point lies in exactly one cap

For every `q∈A` distinct from the triangle vertices, the MEC arc geometry and convex independence imply that exactly one of the three `OnArcOpposite` predicates holds.

**Status:** [PROVED as `arc_partition_count_eq_one`, then consumed by `cap_partition_from_moser_circumscribed`]

### M10. Cap-sum identity

Counting cap incidences by points gives

\[
|C_1|+|C_2|+|C_3|
=(|A|-3)\cdot1+3\cdot2
=|A|+3.
\tag{7.1}
\]

**Status:** [PROVED as `CapTriple.cap_sum_identity` and `SurplusCapPacket.capSum`]

### M11. Existence of a surplus cap

If `9<|A|`, then the sum in (7.1) is greater than twelve. Therefore not all three cap cardinalities are at most four. At least one cap has cardinality at least five.

**Status:** [PROVED pigeonhole]

### M12. Surplus-cap packet

A `SurplusCapPacket A` packages:

1. nonemptiness and noncollinearity of `A`;
2. the non-obtuse circumscribed Moser triangle;
3. the circumscribed-branch witness;
4. the three-cap partition;
5. an index selecting one cap; and
6. a proof that the selected cap has cardinality greater than four.

`MEC.nonempty_surplusCapPacket_of_K4` constructs such a packet from the hypotheses of `RemovableVertexOfLarge`.

**Status:** [PROVED]

### M13. `IsM44`

For a packet `S`, let `C*` be the selected surplus cap and let `C₁'`, `C₂'` be the two opposite caps. The predicate `S.IsM44` is

\[
|C_1'|=4
\quad\text{and}\quad
|C_2'|=4.
\]

Since `|C*|≥5`, this is the `(m,4,4)` regime.

**Status:** [PROVED definition]

### M14. Cardinality identity in the `IsM44` regime

If `m=|C*|`, then

\[
m+4+4=|A|+3,
\qquad
m+5=|A|.
\tag{7.2}
\]

**Status:** [PROVED as `SurplusCapPacket.IsM44.surplus_card_eq`]

### M15. The top-level split is global

The proof splits on

\[
\exists S:\operatorname{SurplusCapPacket}(A),\;S.\operatorname{IsM44}.
\tag{7.3}
\]

The negative branch assumes that **no** surplus packet on `A` is `IsM44`. This global quantifier is stronger than saying that one selected packet fails `IsM44` and must be preserved in any replacement argument.

**Status:** [PROVED from `RemovableVertexOfLarge_from_threeWaySplit`]

---

## 8. Atomic erased-pin interfaces used in the `IsM44` branch

The continuation proof packages L7-L10 into named interfaces. Expanding them prevents the certificate route from appearing magical.

### E0. From an exact pin to a residual triple

Suppose `r>0`, `|C_A(p,r)|=4`, and `x∈C_A(p,r)`. Since `p` is not in the positive-radius class, erasing `x` and the center leaves exactly three carrier points at distance `dist(p,x)=r` from `p`.

This is the content of `erasedPinTriple_of_exact_erased_pin`.

**Status:** [PROVED]

### E1. Naming the three residual points

A three-element residual class can be written as `{t₁,t₂,t₃}` with pairwise distinct points. The theorem `exists_u3FixedTriplePacket_of_erasedPinTriple` packages their carrier membership and equal-distance identities.

**Status:** [PROVED]

### E2. Exact cardinality in skeleton notation

The same residual statement is transported to the deleted skeleton notation used by the U5 interfaces:

\[
\left|
\left\{y\in A-x-p:
\operatorname{dist}(p,y)=\operatorname{dist}(p,x)
\right\}
\right|=3.
\]

This is `u5ExactRadiusClassCard_of_erasedPinTriple`.

**Status:** [PROVED]

### E3. Triple exclusion implies exact-pin exclusion

If every residual triple of the form E0 is impossible for a category of centers, then no exact erased pin occurs in that category.

**Proof.** An exact pin would produce such a triple by E0. QED.

**Status:** [PROVED in `isM44NonSurplusContainmentExactPinResidualsExcluded`]

### E4. Exact-pin exclusion implies a surviving witness

Apply L9 center by center.

**Status:** [PROVED in `isM44NonSurplusContainmentResidualErasureWitnesses`]

### E5. All surviving witnesses imply removability

Apply L10.

**Status:** [PROVED in `isM44NonSurplusContainmentRemovable`]

---

## 9. The `IsM44` branch, expanded atomically

The branch theorem is `removableVertexOfLarge_of_isM44PinnedSurplus`. Its transitive proof is closed under the repository's approved certificate trust boundary.

Fix a minimal large counterexample `A` and an `IsM44` packet `S`.

### Q0. Endpoint residual exclusions

Two endpoint-escape families are ruled out:

- left endpoint escape at the first opposite index;
- right endpoint escape at the second opposite index.

These exclusions prevent a K4 class from escaping the intended opposite-cap geometry through a Moser endpoint.

**Status:** [CERTIFIED/source-clean consumer]

### Q1. Pinned-surplus residual exclusions

Two pinned families are ruled out:

- right-pinned surplus residuals;
- left-pinned surplus residuals.

They are discharged by the pinned-surplus certificate bank imported only at the final composition shard.

**Status:** [CERTIFIED]

### Q2. Non-surplus Moser-cap containment

The `IsM44` geometry, K4, convex independence, Q0, and Q1 imply `S.NonSurplusMoserCapContainment`.

This is the first conceptual payoff of the endpoint and pinned certificates: the two non-surplus sides have their relevant exact classes confined to the prescribed cap structure.

**Status:** [PROVED from certified premises]

### Q3. The surplus interior is nonempty

Write the selected surplus cap as $C_{\mathrm{sur}}$. An `IsM44` packet has $|C_{\mathrm{sur}}|\ge 5$. Its closed surplus cap contains the two Moser endpoints, so its strict cap interior has at least three points. Choose

\[
x\in C_{\mathrm{sur}}^{\circ}.
\]

Then `x∈A` and `x` is distinct from all three triangle vertices.

**Status:** [PROVED]

### Q4. Goal after choosing `x`

To prove that `x` is removable it is enough to show

\[
\forall p\in A-x,\;K4At(A-x,p).
\tag{9.1}
\]

By L9, for most categories it suffices to rule out exact erased pins through `x`.

**Status:** [PROVED reduction]

### Q5. Exhaustive location partition for a surviving center

Every `p∈A-x` is exactly one of the following:

1. the Moser vertex opposite the first non-surplus cap;
2. the Moser vertex opposite the second non-surplus cap;
3. the Moser vertex opposite the surplus cap;
4. a point in the strict interior of the surplus cap;
5. a point in the strict interior of the first opposite cap; or
6. a point in the strict interior of the second opposite cap.

**Proof.** Every carrier point is either a triangle vertex or a non-triangle point. M9 places every non-triangle point in exactly one cap interior. The three indexed triangle vertices exhaust the first alternative. QED.

**Status:** [PROVED by packet membership lemmas]

### Q6. Direct survival at the two non-surplus opposite vertices

For categories 1 and 2, exact-cap containment gives a positive-radius class that survives deletion of the surplus-interior point `x`.

These are the theorems

```text
exists_oppIndex1_erase_witness_of_surplusInterior
exists_oppIndex2_erase_witness_of_surplusInterior
```

**Status:** [PROVED]

### Q7. Four residual categories

The remaining categories are:

- the surplus-opposite triangle vertex;
- a surplus-interior center distinct from `x`;
- a first-opposite-interior center;
- a second-opposite-interior center.

For each category, assume for contradiction that an exact erased pin exists. E0-E2 convert it into a named three-point residual circle in the exact U3/U5 format.

**Status:** [PROVED reduction]

### Q8. Cardinality split inside the surplus packet

Equation (7.2) links the surplus-cap size to `|A|`.

- If `|C*|=5`, then `|A|=10`.
- If `|C*|>5`, the continuation proves `|C*|=6`, hence `|A|=11`.

The first case is routed to Proposition E/card-ten consumers. The second is routed to card-eleven certificate consumers.

**Status:** [CERTIFIED overall; arithmetic PROVED]

### Q9. Surplus-opposite triple is impossible

In the card-ten arm, the fixed U2/full-distance-class theorem gives the contradiction. In the card-eleven arm, the promoted erased certificate gives the contradiction.

**Status:** [CERTIFIED]

### Q10. Surplus-interior triple is impossible

The same card-ten/card-eleven split excludes an exact erased pin centered at another surplus-interior point.

**Status:** [CERTIFIED]

### Q11. First opposite-interior triple is impossible

The exact selected-count family for the first opposite cap, together with containment and the `IsM44` cardinalities, excludes the residual triple.

**Status:** [CERTIFIED]

### Q12. Second opposite-interior triple is impossible

The symmetric exact selected-count family excludes the residual triple in the second opposite cap.

**Status:** [CERTIFIED]

### Q13. All exact erased pins in residual categories are excluded

Combine Q9-Q12 and E3.

**Status:** [PROVED from certified premises]

### Q14. Every residual center has a surviving K4 witness

Apply L9 to each of the four residual categories.

**Status:** [PROVED]

### Q15. Every surviving center has a witness

Use Q5 to split an arbitrary `p∈A-x`. Use Q6 for the two direct apex cases and Q14 for the remaining four cases.

**Status:** [PROVED]

### Q16. The chosen point is removable

Q3 gives `x∈A`; Q15 gives `K4(A-x)`. Therefore `IsRemovableVertex A x`.

**Status:** [PROVED from certified premises]

### Q17. Branch conclusion

If there exists an `IsM44` surplus packet on `A`, then `A` has a removable vertex.

**Status:** [CERTIFIED; no current `sorryAx` dependency]

### Trust-boundary note

The prose argument is logically complete, but some terminal finite exclusions are proved with generated `native_decide` certificate banks. The current repository policy treats `Lean.ofReduceBool` and `Lean.trustCompiler` as approved for those banks. Calling the branch “certified” distinguishes that trust boundary from both ordinary kernel-only proofs and open `sorry` leaves.

---

## 10. The non-`IsM44` branch, expanded atomically

The current theorem is `removableVertexOfLarge_of_nonIsM44`. Its own Lean body is short and source-clean; the last general call reaches the open frontier.

Assume

\[
\neg\exists S:\operatorname{SurplusCapPacket}(A),\;S.\operatorname{IsM44}.
\tag{10.1}
\]

### N0. A surplus packet still exists

M12 provides at least one surplus packet `S` because `A` is nonempty, convexly independent, K4, and has more than nine points.

**Status:** [PROVED]

### N1. Counterexample data

Package `A`, its three counterexample hypotheses, and the chosen packet `S` into `CounterexampleData D`.

**Status:** [PROVED construction]

### N2. The strong-induction hypothesis implies structure-level minimality

`D.Minimal` says that no smaller nonempty convexly independent K4 set exists. If a candidate `B` violated this, then `|B|<|A|` and the original `hMin` would give `False`.

**Status:** [PROVED]

### N3. Global no-`IsM44` transports to `D.A`

Since `D.A` is definitionally `A`, equation (10.1) becomes

\[
\neg\exists T:\operatorname{SurplusCapPacket}(D.A),\;T.\operatorname{IsM44}.
\]

**Status:** [PROVED]

### N4. Minimality produces a critical shell system

For every source `x∈D.A`, minimality says `x` is not removable. Therefore deletion fails at some surviving center. B8 converts that failure into a unique-four blocker and canonical four-row through `x`. Choosing one blocker and row for every source yields a `CriticalShellSystem D.A`.

**Status:** [PROVED by `D.exists_criticalShellSystem_of_minimal`]

### N5. Canonical interpretation of the chosen system

For every source `x`:

1. `H.centerAt x` is a unique-four center;
2. `H.centerAt x ≠ x`;
3. the selected shell support equals the canonical row of that center; and
4. `x` belongs to that row.

**Status:** [PROVED in `MinimalUniqueFourCover.lean`]

### N6. Switch the target to contradiction

The formal branch target is an existential removable vertex. The proof executes `exfalso`: it is enough to show that no minimal configuration satisfying N0-N5 can exist.

This is logically sound because `False` implies every proposition, including the requested existential. It also means the negative branch need not name a geometrically canonical removable point.

**Status:** [PROVED logical step]

### N7. Exact cardinality-eleven branch

If `|D.A|=11`, apply

```text
false_of_twoLargeCaps_commonCriticalMap_of_card_eq_eleven
```

with the packet, minimality, global no-`IsM44` condition, cardinality equation, and critical shell system.

The current repository records this branch as closed by promoted finite certificates and source-clean coordinators.

**Status:** [CERTIFIED]

### N8. General cardinality branch

If `|D.A|≠11`, the source calls

```text
ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap
```

with the packet, minimality, global no-`IsM44`, `9<|D.A|`, and the critical shell system.

**Status:** [OPEN transitively]

### N9. Exact single theorem needed for unconditional closure

The entire negative branch would be unconditional if the following theorem were proved without `sorryAx`.

> **GlobalNonM44Contradiction.** Let `D` be counterexample data. Assume `D` is minimal, `9<|D.A|`, no surplus packet on `D.A` is `IsM44`, and `H` is a critical shell system on `D.A`. Then `False`.

The existing 36 leaves are one refinement tree for this theorem. Because unrestricted refactoring is allowed, those theorem boundaries need not be preserved. A different proof of `GlobalNonM44Contradiction`, or a direct removable-vertex theorem under the same hypotheses, would close the same spine.

**Status:** [OPEN]

---

## 11. Current decomposition of the open theorem

The current README measures 36 `sorry`-carrying leaves reachable from the publication target. They are all descendants of N8 and fall into four clusters.

### F0. Rigid221 cluster - 18 leaves

This cluster studies a five-point physical class split as `2+2+1` across two canonical rows and a fifth point. Its most developed exact-cardinality route reaches a 17-point configuration.

Atomic established facts in the described 17-point subbranch include:

1. a relevant cap has size 9, 10, or 11;
2. each of four rows meets that cap in at most two points;
3. cap sizes 10 and 11 provide spare interior points outside all four rows;
4. deleting those spares reduces to checked 16- and 15-point certificate banks;
5. for cap size 9, either an outside point is unused by all rows, which is closed, or the four rows partition all eight outside points into exact pairs, which is open.

The route is not unbounded: the current source has no transfer theorem for `|A|≥18` in this branch.

**Status:** [OPEN cluster]

### F1. TriApex cluster - 9 leaves

These leaves concern retained-omission configurations in which all three apex caps are large. The known local row and omission facts have not yet been converted into a global cyclic-order or metric contradiction.

**Status:** [OPEN cluster]

### F2. TwoSource cluster - 6 leaves

These leaves concern two cap sources, fresh third centers, blocker fibers, and exact collision rows. The cluster appears to retain more global provenance than the two-deletion leaves and may offer a higher-leverage route to a common theorem.

**Status:** [OPEN cluster]

### F3. Two-deletion cluster - 3 leaves

The three current leaves are the descendants historically called B1, B2, and B3:

1. a B1 global-gap-or-closed-terminal producer;
2. a common-deletion blocker-coincidence contradiction; and
3. a common-deletion survival-square contradiction.

**Status:** [OPEN cluster]

### F4. Source-clean coordinators do not change this status

The parent coordinators exhaustively dispatch to these leaves and may contain no `sorry` in their own files. Their transitive axiom closure still reaches `sorryAx`. Publication closure requires the leaves to be proved, bypassed by a stronger source-clean theorem, or removed from the dependency path.

**Status:** [PROVED dependency interpretation]

---

## 12. Results of the strengthened geometric attack

The attempted strengthening did not obtain a terminal geometry theorem. It did identify invalid or insufficient routes.

### G0. B1 contains a producer gap, not a consumer gap

The existing code has a contradiction consumer

\[
T\Longrightarrow\bot
\]

for a terminal disjunction `T`. The open theorem must produce `T` from the global B1 context, or derive `False` directly. Re-proving that every branch of `T` is contradictory only reconstructs the existing consumer and does not prove the missing implication.

The available local theorem gives an overlap upper bound of two. No premise supplies the required lower bound of three.

**Conclusion:** B1 needs a new global transport theorem.

### G1. The proposed B2 four-point intersection contradicts its own hypotheses

The rejected argument asserted that four named points lie in a row/physical-class intersection while also assuming that one of those points is not in the row. Branch-specific mutual omissions exclude additional named points. The live source already bounds the relevant late-row intersection by two.

**Conclusion:** the four-point-intersection narrative is false for the live contract.

### G2. B2 local counting is realizable in strict convex position

An exact rational eight-point configuration realizes all of the following simultaneously:

- a five-point unit-circle class centered at the origin;
- a four-point circle centered at `(-1,0)` with radius two;
- intersection of those selected point sets equal to `{(1,0)}`;
- four physical-class points outside the second row; and
- strict convex position, verified by positive exact orientation determinants.

This is not a Problem 97 counterexample and does not realize the full critical-shell/minimality packet. It proves that local two-circle incidence, the `5-2≥3` counting fact, and strict convexity do not imply a contradiction.

**Conclusion:** a valid B2 theorem must use global provenance, cap order, exact deletion identities, or minimality data absent from the model.

### G3. B3 was misread as four simultaneous circles

The live survival-square hypothesis is a disjunction of four alternatives. Each alternative supplies a pair of existential K4-survival statements for one selected role. It does not provide four simultaneous centers, common radii, common supports, or pairwise equidistance of centers.

**Conclusion:** each alternative must be normalized separately, and every support or radius identification used later must be proved.

### G4. Partial shell geometry is realizable

The repository records an exact eleven-point partial Euclidean witness with two complete blocker shells, four cross omissions, strict convexity, and cyclic order. It does not satisfy the full global theorem, but it rules out any terminal statement based only on those local shell facts.

**Conclusion:** the missing contradiction must consume a genuinely global hypothesis.

### G5. Consolidated impossibility boundary

The strengthened attack proves the following negative methodological result:

> Local circle incidences, small cardinality inequalities, and strict convexity do not by themselves imply a contradiction.

This is useful progress. It prevents the proof from being “closed” by an overstrong false lemma and identifies information that must not be discarded.

---

## 13. What the missing global theorem must add

The all-blockers analysis and failed local attacks narrow the research target.

### H0. Pure cover counting is insufficient

The exact cover identity, pairwise row-intersection bound, pair-codegree bound, and forced directed cycle are all compatible with abstract finite systems. None uses the cyclic order of the convex polygon or cap geometry strongly enough.

### H1. A fixed number of robust points cannot close an unbounded theorem

The cover bound is

\[
n\le4|U|=4|\{\text{nonrobust centers}\}|.
\]

To contradict it by harvesting robust points alone, more than three quarters of the carrier would have to be proved robust. Producing a fixed number of robust Moser or apex points cannot scale with `n`.

### H2. Same-cap row bounds need a single-source upper bound

Existing cap geometry often yields a fact of the form:

> A canonical circle centered in a strict cap contains at most two points of that same cap.

Thus a four-row centered there contains at least two points outside the cap. Summing over centers gives a lower bound on cross-cap incidences. To turn it into a contradiction, one also needs a strong upper bound on how many such rows can pass through one outside source, or an order theorem forcing incompatible pairings. Pair-codegree controls rows sharing **two** sources, not rows sharing one source, and is too weak by itself.

### H3. A blocker-cycle proof needs a strict potential

The forced cycle from I13 becomes contradictory if one can choose blockers so that every edge strictly decreases a finite potential. Candidate potentials include:

- cyclic boundary position within a cap;
- distance from a designated cap endpoint;
- signed orientation relative to a Moser side;
- a lexicographic pair of cap index and boundary rank; or
- inclusion/overlap data of canonical rows.

The all-blockers relation is useful because it preserves alternative blocker choices. A critical-shell system that chooses arbitrarily may discard the edge satisfying the desired monotonicity.

### H4. Acceptable shapes for a new theorem

A genuinely useful global producer would have one of the following forms.

#### H4a. Cap-weighted incidence inequality

Prove an upper bound on total blocker incidence crossing a chosen cap boundary that is smaller than the lower bound forced by four-point rows centered in that cap.

#### H4b. Hall defect for canonical blockers

Construct source and blocker subsets whose neighborhood violates the cover forced by minimality, using cyclic intervals or cap membership rather than cardinality alone.

#### H4c. Extremal-blocker theorem

For an extremal source in a cap, prove that at least one canonical blocker has a strictly earlier or later boundary position. Iterating the strategic choice would contradict finiteness.

#### H4d. Forbidden orientation cycle

Normalize a blocker cycle and prove that equal-distance constraints force a strict cyclic chain of signed orientations that cannot close.

#### H4e. Global row-overlap theorem

Use exact source provenance and multiple prescribed deletions to force two distinct-center canonical rows to share at least three points, contradicting the proved two-circle bound.

### H5. Research acceptance gate

Before rebasing the full A-tail development around a new interface, a proposed route must produce at least one source-clean theorem strictly stronger than the existing local facts. It must:

1. use a global minimality, all-blockers, cap-order, or orientation hypothesis;
2. remain compatible with the known exact partial witnesses;
3. imply a live terminal contradiction or a removable vertex;
4. avoid synchronizing existential radii or supports without proof; and
5. avoid a fixed ambient cardinality unless paired with an explicit unbounded transfer theorem.

---

## 14. Proposed atomic all-blockers API

The following declarations would consolidate already-proved facts and preserve the data needed by a new global attack. They are specifications, not new axioms.

```lean
def MultiplicityBlocks
    (A : Finset ℝ²) (p x : ℝ²) : Prop :=
  p ∈ A.erase x ∧
  pinnedMultiplicity A p = 4 ∧
  pinnedMultiplicity (A.erase x) p = 3

def CanonicalBlocks
    (A : Finset ℝ²) (p x : ℝ²) : Prop :=
  ATailMinimalUniqueFourCover.IsUniqueFourCenter A p ∧
  x ∈ ATailMinimalUniqueFourCover.uniqueFourClass A p

theorem multiplicityBlocks_iff_canonicalBlocks
    (hK4 : HasNEquidistantProperty 4 A) :
  MultiplicityBlocks A p x ↔ CanonicalBlocks A p x

theorem failure_iff_canonicalBlocks
    (hK4 : HasNEquidistantProperty 4 A)
    (hp : p ∈ A.erase x) :
  (¬ HasNEquidistantPointsAt 4 (A.erase x) p) ↔
    CanonicalBlocks A p x

theorem isRemovableVertex_iff_no_canonicalBlocker
    (hK4 : HasNEquidistantProperty 4 A) (hx : x ∈ A) :
  IsRemovableVertex A x ↔
    ∀ p ∈ A, ¬ CanonicalBlocks A p x

theorem minimal_all_sources_have_canonicalBlocker
    (hmin : D.Minimal) :
  ∀ x ∈ D.A, ∃ p ∈ D.A, CanonicalBlocks D.A p x

theorem canonicalBlocker_pair_codegree_le_two
    (hconv : ConvexIndep A) (hxy : x ≠ y) :
  ((A.filter fun p => CanonicalBlocks A p x ∧
                      CanonicalBlocks A p y).card) ≤ 2
```

The existing `CriticalShellSystem` can then be described explicitly as a chosen section of `CanonicalBlocks`. Downstream enriched packets should retain the complete set of eligible blockers when strategic choice matters.

---

## 15. Conditional complete proof of descent

This section states the complete argument with the exact open theorem isolated as a hypothesis.

### Theorem 15.1 - Conditional removable-vertex theorem

Let `A` be a nonempty convexly independent K4 set with `9<|A|`, and assume `(Min)`. Assume additionally `GlobalNonM44Contradiction`. Then `A` has a removable vertex.

**Proof.** By M0-M12, choose a surplus-cap packet on `A`. Split on (7.3).

If an `IsM44` packet exists, Q0-Q17 produce a removable point.

If no `IsM44` packet exists, construct `D` and `H` by N0-N5. `GlobalNonM44Contradiction` gives `False`. By contradiction elimination, the required existential removable-vertex statement follows.

Thus in either branch a removable vertex exists. QED.

**Status:** [PROVED conditional on one OPEN theorem]

### Theorem 15.2 - Descent

Under the same global theorem, no counterexample with more than nine points can be minimal.

**Proof.** Apply Theorem 15.1 to obtain a removable point. D0 gives a strictly smaller counterexample. This contradicts `(Min)`. QED.

**Status:** [PROVED conditional]

### Theorem 15.3 - Universal Problem 97 statement

Assume the proved counting floor, the proved nine-point endpoint, and `GlobalNonM44Contradiction`. Then no finite nonempty convexly independent K4 set exists.

**Proof.** Apply D2 using Theorem 15.2 as the descent hypothesis. QED.

**Status:** [PROVED conditional]

### Corollary 15.4 - What a closure commit must accomplish

No change is required in `SmallerCounterexample.lean`, `Descent.lean`, or the strong-induction body. A valid closure commit must make one of the following true:

1. `ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap` becomes transitively free of `sorryAx`;
2. `removableVertexOfLarge_of_nonIsM44` is rewritten to call a different source-clean contradiction; or
3. `RemovableVertexOfLarge` is replaced by a direct theorem that avoids the current non-`IsM44` split.

Afterward, `#print axioms Problem97.erdos97_rhs` must contain no `sorryAx`.

---

## 16. The complete proof-status ledger

### 16.1 Closed ordinary logic and finite-set steps

- definitions of counterexample and removability;
- selected-class erase identity;
- exact class-cardinality behavior under one deletion;
- hereditary convex independence;
- smaller counterexample from a removable vertex;
- contradiction with strong-induction minimality;
- universal strong-induction assembly.

**Status:** [PROVED]

### 16.2 Closed global geometric infrastructure

- noncollinearity from convex independence and cardinality;
- minimum-enclosing-circle support analysis;
- exclusion of the diameter branch under K4;
- non-obtuse circumscribed Moser triangle;
- exact three-cap partition and cap-sum identity;
- surplus-cap packet extraction.

**Status:** [PROVED]

### 16.3 Closed deletion-semantics infrastructure

- deletion robustness from a class of at least five;
- deletion robustness from two heavy radii;
- unique-four characterization of a nonrobust carrier center;
- minimality cover by canonical four-classes;
- exact survival iff robust or deleted point lies outside the canonical row;
- selected critical-shell blocker equals canonical unique-four blocker;
- distinct-center row intersection at most two.

**Status:** [PROVED]

### 16.4 Closed `IsM44` branch

- endpoint residual exclusions;
- pinned-surplus residual exclusions;
- non-surplus cap containment;
- residual triple and exact-pin exclusions;
- card-ten/card-eleven finite terminal consumers;
- assembly of erasure witnesses;
- removable surplus-interior point.

**Status:** [CERTIFIED]

### 16.5 The open theorem decomposed into its reachable leaves

The single prose statement `GlobalNonM44Contradiction` is not a single unstructured gap in the current Lean development. In the last built dependency-spine snapshot it reaches thirty-six declarations containing `sorry`, distributed over nine modules. This subsection records every one of those declarations as a separate mathematical obligation. The purpose is to prevent a source-clean coordinator, an exhaustive case split, or a stronger-looking packet type from being mistaken for a proof of its unresolved terminal.

#### 16.5.0 Roster authority, snapshot discipline, and counting rule

The numbered roster below follows the repository README's last built `proof-blueprint spine` measurement: thirty-six reachable leaves below `Problem97.erdos97_rhs`. This is the reachability authority for this manuscript. A raw grep for `sorry` is not equivalent to a dependency-spine measurement: raw `main` may contain newly added placeholders not yet present in the last built report, old placeholders that have become unreachable, and explicitly parked off-spine declarations.

Three declarations are expressly excluded from the thirty-six-leaf count because the README marks them off-spine: `false_of_exactFiveDistinct_biApexRobust_postCardEleven`, `TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_firstFiberDescentResidual`, and `DoubleApexOffSurplusSharedRadiusPair`. Current raw source also contains later fresh-third edits whose built-spine reachability has not yet been regenerated. Those declarations must be reassessed after a clean build, but they are not silently promoted into this numbered roster.

For each numbered leaf, five distinctions are maintained. The *contract* is what the theorem actually assumes and concludes. The *available data* are facts already produced by callers. The *missing implication* is the smallest presently unproved mathematical step. The *candidate closure program* is a research route, not a claim of proof. The *rejection tests* identify shortcuts that would be unsound or contradicted by known realizable local models.

**Status.** [OPEN-ROSTER; 36 built-spine leaves]

**Common-deletion progress.** The generic positive-incidence-completion target has been replaced by a proved robust-apex tetrahedron-or-continuation theorem in Section 16.5.38. It remains the correct generic reduction for A7 and A8. The source-specific A5 analysis is now stronger: the five-incidence hypothesis is redundant, the next blocker cannot equal `xv`, and the entire `d=xu` role family is impossible by strict-cap betweenness. A5 is reduced to four role families and twenty-four source-tagged cells. D8, I2, and I3 require different branch-specific theorems.


#### 16.5.A `Rigid221SourceHeavy.lean` - eight reachable leaves

These leaves refine the source-heavy side of an exact `2+2+1` decomposition of a five-point physical radius class. They retain unusually rich provenance: named row companions, exact physical-class traces, cap-interior placement, actual blocker identities, and prescribed deletions. The main opportunity is to replace repeated local case trees by one or two order-sensitive lemmas on points lying on a common physical circle.

##### 16.5.A1 - The pentagon blocker is the distinguished deleted point

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 3379-3457. This is the first terminal after the source-heavy pentagon is normalized and the blocker of the `xv` row is identified with the joint-deletion point.

**Atomic contract.** From the complete source-heavy pentagon packet, the exact five-point physical class, the full row-membership and omission trace, strict second-cap locations, and the equality `centerAt(xv)=deleted`, derive `False`.

**Data already proved upstream.** The physical class is exactly the five named points `u`, `xu`, `deleted`, `v`, and `xv`. The source row and opposite row meet that class in exact two-point blocks. The blocker of the source row is `xv`; `xv` lies in the strict second-cap interior. The blocker of the `xv` row is the deleted point, and that blocker is also localized to the same strict interior. The row at `xv` contains `xv` and `u`, while the blocker center itself is not in that row. The theorem also receives the carried five-cycle support traces rather than anonymous existential circles.

**Exact missing implication.** The missing statement is not merely that several points are concyclic or equidistant. One must show that the complete named blocker cycle and the strict cap order cannot be realized simultaneously by a convexly independent carrier.

**Candidate closure program.**

1. Introduce an angular-coordinate lemma for a fixed physical circle: if three distinct points `a,b,c` lie in one open cap arc and `b` is equidistant from `a` and `c`, then `b` is the unique arc midpoint between `a` and `c` in that arc. State this without trigonometric branch ambiguity by using oriented cyclic order and equal-chord lemmas.

2. Translate each carried row equality whose center also lies on the physical circle into an arc-midpoint equation. In particular, `centerAt(u)=xv` and the two physical members of the source row give one midpoint relation; `centerAt(xv)=deleted` and the pinned pair `{xv,u}` give a second.

3. Enumerate every additional relation contained in the five-cycle trace and prove that they form either a strict cyclic chain of arc midpoints or a closed affine equation in angular coordinates. A closed chain of strict midpoints forces equality of two named distinct points.

4. Package the result as a generic `false_of_commonCircle_strictArc_blockerMidpointCycle` theorem, then discharge this leaf by a source-faithful adapter.


**Known limits and rejection tests.** Two midpoint equations alone are geometrically realizable, so the proof must consume the complete cycle trace. It may not assume that cap membership automatically gives a common semicircle until the cap-to-open-arc lemma is proved. It also may not use `center = deleted` as an immediate contradiction: a center need not belong to the erased support.

**Immediate consumer.** The source-heavy second-opposite-large pentagon coordinator. Closing it removes one of the two named pentagon continuations and supplies a reusable common-circle cycle theorem for several later Rigid221 leaves.

**Status.** [OPEN]

##### 16.5.A2 - Exact seventeen, second-cap nine, and the four-row exact cover

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_eq_seventeen_secondCapNine`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 11710-11757. The theorem has already split the exact-cardinality-seventeen branch into an unused-outside-point arm and an exact-cover arm; the first arm is proved and only the exact-cover arm reaches `sorry`.

**Atomic contract.** Assume `|A|=17`, the indexed second cap has cardinality nine, the next blocker is strict-cap interior but outside the physical five-class, and its next row has at most one physical-class hit. The checked splitter says four named exact rows cover all eight carrier points outside the second cap. Prove that this exact cover is impossible.

**Data already proved upstream.** All four rows have cardinality four and retain their centers and source identities. The cap has an exact cyclic boundary model. Every point outside the cap is assigned to at least one of the four rows, and the complementary unused-point alternative has already been closed. The source file already contains certified boundary-order infrastructure for the seventeen-point normalization.

**Exact missing implication.** The unresolved implication is a finite cyclic-order obstruction: no assignment of the eight outside-cap points to the four named rows can satisfy all exact support memberships, center-not-in-support conditions, circle-intersection bounds, and the inherited physical-class omissions.

**Candidate closure program.**

1. Extract a minimal finite packet containing the seventeen boundary labels, the nine cap labels, the four row centers, the four exact support sets, and every forced membership and nonmembership. Do not encode arbitrary K4 witnesses not used by the terminal.

2. Normalize reflection and rotation symmetries of the boundary order so the certificate searches one representative per dihedral orbit.

3. For every candidate support assignment, derive exact orientation or circle-incidence constraints. Reject assignments by a small library of kernel lemmas: distinct-center circles meet in at most two carrier points; a row omits its own center; three collinear carrier points are impossible; and interlacing equal-chord pairs force a convex-hull crossing.

4. If the remaining state space is finite, emit a replayable certificate bank keyed by the normalized support assignment. A project-approved `native_decide` endpoint is acceptable here only after the geometric reduction to finite predicates is explicit and audited.


**Known limits and rejection tests.** A cardinality count alone cannot reject the exact cover: four four-point rows can cover eight points abstractly. The finite checker must encode the branch's exact provenance and geometric predicates, not just an incidence hypergraph. The existing exact rational B2 stress model warns that local two-circle counting plus strict convexity is insufficient.

**Immediate consumer.** The exact-seventeen deleted-row off-class coordinator. This is a bounded endpoint and is one of the best candidates for certificate closure without discovering a new unbounded theorem.

**Status.** [OPEN]

##### 16.5.A3 - The unbounded deleted-row off-class continuation

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_card_ge_eighteen`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 11760-11791. The source comment explicitly identifies this as the unbounded continuation after the exact-seventeen stratum is isolated.

**Atomic contract.** Under the same rigid pentagon and deleted-row off-class hypotheses, but with `18 <= |A|`, prove `False`.

**Data already proved upstream.** The physical five-class, prescribed deletion, interior next blocker, off-class condition, and next-row physical-intersection bound are all available. Exact-cardinality fifteen, sixteen, and the cap-ten/cap-eleven portions of seventeen have separate finite closures. No upper bound on the carrier is available here.

**Exact missing implication.** A cardinality-independent contradiction is missing. No finite label enumeration can prove this theorem unless one first establishes a bounded-obstruction reduction that preserves every hypothesis needed by the endpoint certificate.

**Candidate closure program.**

1. Attempt a cap-weighted all-blockers inequality. Count incidences from sources outside the physical second cap into canonical four-rows, but weight a row by the number of its support points forced outside that cap. The current branch supplies a row with at most one physical-class hit and should force at least three supports elsewhere.

2. Combine this lower bound with an order-sensitive upper bound: for centers in a fixed cap interval, canonical rows should not be able to use too many separated outside-cap pairs without producing interlacing chords or a repeated source pair. Pure pair-codegree at most two is too weak; the upper bound must use boundary intervals.

3. As an alternative, prove a genuine bounded-obstruction theorem: from any realization of the unbounded residual, select a bounded set of named centers and supports that itself violates a generic Euclidean lemma. This must not delete arbitrary carrier points or assume K4 is hereditary under taking subsets.

4. Only after one of those global reductions is proved should the exact-seventeen certificate be considered as a terminal for the unbounded branch.


**Known limits and rejection tests.** The tempting statement 'four rows have at most sixteen points, so an eighteenth point is unused' is invalid: the relevant rows need not cover the whole carrier, and an unused point can still be blocked by another canonical center. Deleting that point is not justified. This leaf is the clearest evidence that the current route needs a scalable invariant rather than more finite splitting.

**Immediate consumer.** The `card_ge_seventeen` coordinator and, transitively, the source-heavy pentagon route. This is the highest-risk single leaf in the current Rigid221 cluster.

**Status.** [OPEN]

##### 16.5.A4 - The blocker centered at `v` lies off the physical class

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerOffClass`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 12004-12019. All named physical-class placements of the next blocker have already been split; center-not-in-row, equilateral, and ordered-betweenness arguments close the other physical alternatives.

**Atomic contract.** Given the complete pentagon residual and the fact that the blocker selected at `v` is not in the exact physical five-class, derive `False`.

**Data already proved upstream.** The preceding packet identifies the physical five-class and its `2+2+1` row decomposition, the blocker chain through `u` and `xv`, cap-interior positions for the first two fresh blockers, and all row omissions. The only new center is the blocker of `v`, known to be a carrier point and the center of a canonical four-row.

**Exact missing implication.** The missing theorem must localize an off-circle blocker strongly enough to force either a previously closed physical placement, a forbidden row intersection, or a convex-order violation.

**Candidate closure program.**

1. Use each pair of physical-class support points in the `v` row to place the new blocker on a named perpendicular bisector. Derive a second independent bisector from another forced pair in its row or from a common-deletion support; one bisector alone leaves a one-dimensional family.

2. Prove a cap-localization lemma for the intersection of two such bisectors relative to the strict second-cap arc. The desired conclusion is that the intersection is either one of the named physical points, outside the convex hull, or in a cap region incompatible with the inherited blocker localization.

3. If only one physical pair is currently retained, strengthen the upstream packet additively with the exact second pair before restating the terminal. Do not guess it from an existential K4 witness.

4. Share the resulting `offPhysicalCircle_twoPinnedPairs` lemma with the nonphysical-collision and generic source-ne-`u` leaves.


**Known limits and rejection tests.** An off-class blocker is not impossible by itself; a point off one circle can be the center of a circle through two points on it. The proof needs two independent pair constraints or a global order condition. It must also preserve the independent radii of different selected rows unless equality is separately derived.

**Immediate consumer.** The `BlockerV` pentagon coordinator. A successful two-bisector localization theorem could also reduce leaves C1 and C2.

**Status.** [OPEN]

##### 16.5.A5 - Exact-twelve common-deletion residue: refined source-level analysis

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius_commonDeletion_missingIncidence`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 15438-15505 in the inspected source lineage. This is the exact-twelve `(5,4,6)` endpoint after the complete tetrahedron-incidence pattern has already been eliminated by a proved consumer. The present theorem is not merely a five-way incidence puzzle: it also receives an exact cap profile, a source-authenticated six-arm deletion clause, two concrete `xu`-deletion packets, and the complete source-heavy physical-cycle trace.

###### A5.0. Atomic notation

Write

- `O` for the physical second apex `S.oppApex2`;
- `t` for the distinguished point `P.jointDeletion.deleted`;
- `u,xu,v,xv` for the four named physical-class points;
- `C` for the exact five-point physical class centered at `O`;
- `c = β(xv)` for the actual blocker of `xv`;
- `d = β(c)` for the actual blocker of `c`;
- `Kxv` for the canonical exact four-row centered at `c` and selected by source `xv`;
- `Kc` for the canonical exact four-row centered at `d` and selected by source `c`; and
- `BO` for the physical radius class after deleting `xu`.

Thus

\[
C=\{u,xu,t,v,xv\},
\qquad
BO=C\setminus\{xu\}.
\tag{A5.0}
\]

The three exact rows used by the checked tetrahedron consumer are `BO`, `Kc`, and `Kxv`.

**Status:** [NOTATION]

###### A5.1. Exact physical row after deleting `xu`

One has

\[
BO=\{u,t,v,xv\},
\qquad |BO|=4.
\tag{A5.1}
\]

**Proof.** The source-heavy packet identifies `C` exactly as the five named points. The point `xu` belongs to `C`, and selected classes commute with erasure. Therefore deleting `xu` removes exactly that one point from `C`. QED.

**Status:** [DERIVED FROM PROVED SOURCE LEMMAS]

###### A5.2. Exact second-cap profile and forced order

At this endpoint,

\[
|A|=12,
\qquad
(|S_0|,|S_1|,|S_2|)=(5,4,6),
\tag{A5.2}
\]

and the strict interior of the physical second cap is exactly

\[
\{u,c,xv,xu\}.
\tag{A5.3}
\]

Up to reversal of the oriented cap, these four points occur in the order

\[
u<c<xv<xu.
\tag{A5.4}
\]

The order is not an arbitrary label choice. It is forced by two equal-chord relations: `xv` is equidistant from `u` and `xu`, while `c` is equidistant from `u` and `xv`.

**Status:** [PROVED IN THE SOURCE]

###### A5.3. Exact trace of `Kxv`

The `xv` row has the exact cap trace

\[
K_{xv}\cap S_2=\{u,xv\}.
\tag{A5.5}
\]

It also has the exact physical-class trace

\[
K_{xv}\cap C=\{u,xv\}.
\tag{A5.6}
\]

Consequently,

\[
K_{xv}\cap BO=\{u,xv\}.
\tag{A5.7}
\]

In particular,

\[
c\notin K_{xv},
\qquad
xu\notin K_{xv},
\tag{A5.8}
\]

and the other two members of `Kxv` lie outside the physical second cap.

**Proof.** Equation (A5.5) is the proved cap-intersection theorem for the `xv` row. Equation (A5.6) is one edge of the proved five-cycle trace. Equation (A5.7) follows from (A5.1) and (A5.6). The center `c` is omitted from its own positive-radius row, and `xu` is excluded by (A5.6). QED.

**Status:** [PROVED/DERIVED]

###### A5.4. The concrete `xu`-deleted three-row packet

The common arm supplies exact rows in `A-xu` at all three centers `O,c,d`. More precisely:

1. `BO` is an exact four-row centered at `O`;
2. `Kxv` is an exact four-row centered at `c` and omits `xu`;
3. `Kc` is an exact four-row centered at `d` and omits `xu`; and
4. every pair of these three rows has intersection cardinality at most two.

The two original common-deletion packets are

\[
\operatorname{CD}(xu;c,O)
\quad\text{and}\quad
\operatorname{CD}(xu;d,O).
\tag{A5.9}
\]

They imply that the actual blocker of `xu` is distinct from each of `O,c,d`.

**Status:** [PROVED IN THE SOURCE]

###### A5.5. The next-row strict-triple bound

The row `Kc` contains at most one of the three named points `u,xu,xv`:

\[
|K_c\cap\{u,xu,xv\}|\le 1.
\tag{A5.10}
\]

Since the common arm already gives `xu∉Kc`, at most one of `u` and `xv` belongs to `Kc`.

This fact is stronger than the generic two-circle intersection bound and must be retained in every exact-twelve classifier.

**Status:** [PROVED IN THE SOURCE]

###### A5.6. The exact four-source second-cap deletion fan

Let

\[
T_2=S_2\setminus K_{xv}.
\]

Because `|S2|=6` and `Kxv∩S2={u,xv}`,

\[
|T_2|=4.
\tag{A5.11}
\]

Every `q∈T2` is a common deletion for the centers `c` and `O`:

\[
q\in T_2
\quad\Longrightarrow\quad
\operatorname{CD}(q;c,O).
\tag{A5.12}
\]

The four points of `T2` are exactly `c`, `xu`, and the two boundary endpoints of the six-point cap. Thus A5 already contains a four-source deletion fan, not merely the single `xu` packet displayed by the leaf theorem.

The source also proves that the actual blocker map is not constant on this four-source fan. In particular, at least two sources in `T2` have distinct actual blockers, both different from `c` and `O`.

**Status:** [PROVED, WITH EXACT CARDINALITY DERIVED]

###### A5.7. The physical five-class deletion fan

Let

\[
T_C=C\setminus K_c.
\]

The source proves

\[
|T_C|\ge 3,
\tag{A5.13}
\]

and every `q∈TC` is a common deletion for `d` and `O`:

\[
q\in T_C
\quad\Longrightarrow\quad
\operatorname{CD}(q;d,O).
\tag{A5.14}
\]

The original `xu` packet belongs to this fan because `xu∉Kc`. This physical fan and the exact four-source cap fan are the two main global incidence resources that were not explicit in the earlier A5 prose reduction.

**Status:** [PROVED IN THE SOURCE]

###### A5.7a. The three concrete rows leave a row-avoiding deletion source

Let

\[
I_2=\{u,c,xv,xu\}
\]

be the strict second-cap interior, and define

\[
Z=(A\setminus I_2)\setminus(BO\cup K_{xv}\cup K_c).
\tag{A5.14a}
\]

Then

\[
|Z|\ge 1.
\tag{A5.14b}
\]

If `Kc` contains `u` or `xv`, then in fact

\[
|Z|\ge 2.
\tag{A5.14c}
\]

**Proof.** Since `|A|=12` and `|I2|=4`, exactly eight carrier points lie outside `I2`.

- By A5.1, `BO\I2={t,v}`, so `BO` uses exactly two outside points.
- By A5.3, `Kxv` has exactly two points outside the entire second cap, hence exactly two outside `I2`. Equation (A5.7) shows that these two points are disjoint from `{t,v}`.
- The row `Kc` contains `c` and at most one of `u,xv`, while omitting `xu`. Therefore it uses at most three points outside `I2`, and only two when it contains `u` or `xv`.

Thus the three rows use at most `2+2+3=7` of the eight outside points, or at most six in the latter two traces. QED.

Choose `z∈Z`. Then

\[
z\notin I_2,
\qquad
z\notin BO\cup K_{xv}\cup K_c,
\qquad
z\notin C.
\tag{A5.14d}
\]

The last assertion follows from `C=BO∪{xu}` and `xu∈I2`. Since `z` is absent from every concrete row, the unchanged supports prove

\[
\operatorname{Survives}_A(z;O),
\qquad
\operatorname{Survives}_A(z;c),
\qquad
\operatorname{Survives}_A(z;d).
\tag{A5.14e}
\]

No robustness argument is needed here: exact-row persistence proves all three survivals, including the cases `z=O` or `z=d`. If `e=beta(z)` is the actual blocker of `z`, blocker semantics therefore give

\[
e\ne O,
\qquad
e\ne c,
\qquad
e\ne d.
\tag{A5.14f}
\]

Equivalently, the exact-twelve common arm always contains a source-exact three-center deletion fan at some point outside both the physical five-class and the strict second-cap interior. It may be represented by the pair of packets

\[
\operatorname{CD}(z;O,c)
\quad\text{and}\quad
\operatorname{CD}(z;O,d),
\tag{A5.14g}
\]

with the same named deleted source `z`, or by one three-center packet retaining all three exact rows simultaneously.

This conclusion is independent of the missing-incidence branch and of the six-arm source choice. It is therefore available in every A5 branch and should be part of the common ingress rather than reconstructed in every source-tagged coverage cell.

**Scope caution.** The point `z` is new relative to the three row supports and the physical five-class, but it is not yet proved distinct from `O` or `d`. Any argument requiring a fourth distinct source point must first exclude those equalities. The blocker `e`, however, is provably distinct from all three row centers.

**Status:** [NEW DERIVED LEMMA; PROVED IN PROSE]

###### A5.8. The source-authenticated six-arm clause

Independently of the five tetrahedron incidences, the exact-twelve theorem receives a named source

\[
s\in\{u,xv,xu\}
\tag{A5.15}
\]

and one of the two prescribed first-apex deletions `q,w` such that deletion of that point preserves K4 at `β(s)`. Equivalently, one of the six exact clauses holds:

\[
(s,\delta)\in
\{u,xv,xu\}\times\{q,w\},
\qquad
\delta\notin K_s.
\tag{A5.16}
\]

The same theorem proves `β(s)≠O1`, where `O1` is the first apex. This six-arm clause is source-authenticated and must be included in any finite coverage theorem; it is not implied by the three concrete `xu`-deleted rows.

**Status:** [PROVED IN THE SOURCE]

###### A5.9. The next blocker cannot be `xv`

One has

\[
d\ne xv.
\tag{A5.17}
\]

**Proof.** The rigid source packet identifies the actual blocker of `u` with `xv`:

\[
\beta(u)=xv.
\]

Suppose, for contradiction, that `d=xv`. Since `d=beta(c)`, the sources `c` and `u` would then have the same actual blocker. Canonical-row uniqueness at a fixed actual blocker gives

\[
K_c=K_u,
\]

where `Ku` is the canonical row selected by source `u`. The exact source-row trace gives `xu∈Ku`. Hence `xu∈Kc`. But the `xu` common-deletion arm gives `xu∉Kc`. Contradiction. QED.

This argument uses support equality only; it does not identify any independently chosen radii.

**Status:** [DERIVED AND PROVED IN PROSE]

###### A5.10. The five-incidence hypothesis is redundant

The following three incidences are already incompatible:

\[
u\in K_c,
\qquad
d\in BO,
\qquad
d\in K_{xv}.
\tag{A5.18}
\]

**Proof.** By A5.3,

\[
BO\cap K_{xv}=\{u,xv\}.
\]

Thus the last two incidences force `d=u` or `d=xv`. The first alternative is impossible because `d` is the center of the positive-radius row `Kc` while `u∈Kc`. The second is excluded by A5.9. QED.

Consequently the full conjunction used by the planar-tetrahedron consumer is impossible even before the two incidences involving `O` are considered. In particular, the theorem parameter

```text
not (d in BO and O in Kc and u in Kc and O in Kxv and d in Kxv)
```

is derivable from the remaining A5 hypotheses and should be removed from the conceptual theorem statement. The source-level `by_cases` on that conjunction remains a valid implementation device, but it is not the mathematical classification of the exact-twelve residue.

**Status:** [DERIVED AND PROVED IN PROSE; ONE REDUNDANT HYPOTHESIS IDENTIFIED]

###### A5.11. The correct disjoint five-family role split

The common arm belongs to exactly one of the following five role families:

\[
\begin{array}{lll}
\mathsf U:      & u\notin K_c,\[1mm]
\mathsf{B_{xu}}:& u\in K_c\ \text{and}\ d=xu,\[1mm]
\mathsf{B_{off}}:&u\in K_c\ \text{and}\ d\notin C,\[1mm]
\mathsf{X_t}:   & u\in K_c\ \text{and}\ d=t,\[1mm]
\mathsf{X_v}:   & u\in K_c\ \text{and}\ d=v.
\end{array}
\tag{A5.19}
\]

**Proof.** Split first on `u∈Kc`.

- If `u∉Kc`, one is in `U`.
- Assume `u∈Kc`. Split on `d∈BO`.
  - If `d∉BO`, the identity `C=BO∪{xu}` gives `d=xu` or `d∉C`, producing `Bxu` or `Boff`.
  - If `d∈BO={u,t,v,xv}`, then `d≠u` because a positive-radius row omits its center, and `d≠xv` by A5.9. Hence `d=t` or `d=v`, producing `Xt` or `Xv`.

The alternatives are pairwise disjoint by construction. QED.

In the last two families, A5.3 also gives automatically

\[
d\notin K_{xv},
\tag{A5.20}
\]

because `t,v∈BO` while `BO∩Kxv={u,xv}`.

Crossing these five role families with the six source-authenticated clauses of A5.8 gives thirty source-faithful cells. The next theorem closes all six cells in the `Bxu` family, leaving twenty-four cells rather than thirty.

**Status:** [DERIVED AND PROVED IN PROSE]

###### A5.12. The `Bxu` family is impossible

The family

\[
u\in K_c,
\qquad
d=xu
\tag{A5.21}
\]

cannot occur.

**Proof.** The row `Kc` is centered at `d=xu` and contains both its source `c` and, by assumption, `u`. Therefore

\[
\operatorname{dist}(xu,u)
=
\operatorname{dist}(xu,c).
\tag{A5.22}
\]

The three distinct points `u,c,xu` all lie in the strict interior of the same second cap. The strict-cap equal-distance betweenness theorem therefore places the center `xu` strictly between the two equidistant endpoints `u` and `c` in cap order.

But A5.2 gives, up to reversal,

\[
u<c<xv<xu.
\]

Thus `c`, not `xu`, lies between `u` and `xu`; in particular `xu` is not between `u` and `c`. Contradiction. QED.

This proof consumes the source-derived cap order and the canonical-row identity. It does not use the six-arm clause or any finite certificate.

**Status:** [DERIVED AND PROVED IN PROSE; SIX OF THIRTY COVERAGE CELLS CLOSED]

###### A5.13. The `U` family has an exact-eleven five-row normal form

Assume

\[
u\notin K_c.
\tag{A5.23}
\]

Deleting `u` then preserves the exact row `Kc` at `d`; the source already supplies the other four required surviving rows. The proved exact-twelve ingress theorem consequently produces:

1. the exact cardinality
   \[
   |A-u|=11;
   \]
2. a `FiveSurvivorExactRowsBoundary` on the erased carrier; and
3. the distinct actual blocker at which deletion of `u` fails.

Thus `U` is not an unstructured missing-incidence branch. It is an exact-eleven, five-row finite boundary. The remaining theorem for this family is:

> No exact-eleven five-survivor-row boundary arising from the full A5 packet and one of the six source-authenticated clauses is realizable.

This is the most direct bounded-certificate target among the four surviving A5 families.

**Status:** [PROVED NORMALIZATION; TERMINAL EXCLUSION OPEN]

###### A5.14. The `Boff` family

Assume

\[
u\in K_c,
\qquad
d\notin C.
\tag{A5.24}
\]

Then `d` is outside the strict second-cap interior. Indeed that interior is exactly `{u,c,xv,xu}`; the three physical points are excluded by `d∉C`, and `d≠c` because an actual blocker differs from its source.

The row `Kc` nevertheless contains `c` and `u`, so

\[
\operatorname{dist}(d,c)=
\operatorname{dist}(d,u).
\tag{A5.25}
\]

Hence `d` lies on the perpendicular bisector of the strict-cap chord `cu`, but outside the four-point strict interior. The exact residual is therefore an **off-physical-class two-pinned-point localization problem**, not a generic common-deletion problem.

The branch still carries:

- the forced order `u<c<xv<xu`;
- the exact row `Kxv`, centered at `c`, through `u,xv`;
- the exact physical row `BO`;
- the two deletion fans of A5.6-A5.7;
- the row-avoiding source of A5.7a; and
- one source-authenticated six-arm clause.

A closing theorem must use those data to place `d` in a forbidden cap region, force a third point into a two-circle intersection, or produce a shell-metric core. The equality (A5.25) alone is realizable.

**Status:** [NORMAL FORM DERIVED; SIX SOURCE-TAGGED CELLS OPEN]

###### A5.15. The `Xt` and `Xv` five-point chain families

In either remaining physical family,

\[
u\in K_c,
\qquad
d\in\{t,v\},
\qquad
d\notin K_{xv}.
\tag{A5.26}
\]

The following equalities are forced:

\[
\begin{aligned}
&|Ou|=|Oxv|=|Od|=\rho,\\
&|cu|=|cxv|,\\
&|du|=|dc|.
\end{aligned}
\tag{A5.27}
\]

Thus the five named points `O,u,c,xv,d` form a source-faithful circle-isosceles chain:

- `u,xv,d` lie on the physical circle centered at `O`;
- `u,xv` lie on the row centered at `c`;
- `u,c` lie on the row centered at `d`; and
- `d` is explicitly omitted from the row centered at `c`.

The two cases `d=t` and `d=v` are distinct physical-cycle placements. They may be related by a reflection only after the adjacent-cap orientation and every source label are transported explicitly.

The remaining geometric target is to turn (A5.27), the strict order `u<c<xv<xu`, and the placement of `t,v` into one of the existing metric cores—most naturally a five-point circle-isosceles order core or a six-point circle-chain collision. The current packet does not yet contain the crossing/orientation premise required by those generic consumers, so that premise must be derived rather than assumed.

**Status:** [TWO METRIC NORMAL FORMS DERIVED; TWELVE SOURCE-TAGGED CELLS OPEN]

###### A5.16. The three-row union forces additional global escape data

Let

\[
B=BO\cup K_{xv}\cup K_c.
\tag{A5.28}
\]

Since `|BO|=|Kxv|=4` and `BO∩Kxv={u,xv}`,

\[
|BO\cup K_{xv}|=6.
\]

Adding the four-point row `Kc` gives

\[
|B|\le10<12=|A|.
\tag{A5.29}
\]

Moreover `xu∉B`: it is erased from `BO` and omitted from both canonical rows. Therefore `A\B` contains `xu` and at least one further point `z0≠xu`. For such a point,

\[
z_0\notin BO\cup K_{xv}\cup K_c.
\tag{A5.30}
\]

Exact-row persistence gives survival after deleting `z0` at all three centers `O,c,d`, and hence

\[
\beta(z_0)\notin\{O,c,d\}.
\tag{A5.31}
\]

This is a simpler carrier-counting companion to the stronger cap-localized source `z` constructed in A5.7a.

There is also a carrier-wide minimality consequence. In any faithful carrier pattern extending the A5 rows, the proper nonempty subset `B` has a center `e∈B` such that **every** selected four-support at `e` contains a point outside `B`. This is the proper-subset row-escape theorem applied to (A5.29). It produces a fourth selected row that genuinely leaves the three-row union.

Neither escape statement is itself a contradiction. Together they provide the missing global producer that a finite coverage proof may use:

- a named deletion source outside all three concrete rows, whose blocker avoids all three centers; and
- a center inside the three-row union whose selected row must escape that union.

**Status:** [DERIVED AND PROVED IN PROSE; GLOBAL ESCAPE PRODUCERS ADDED]

###### A5.17. Revised finite coverage contract: twenty-four cells

The source already constructs a twelve-point faithful carrier pattern whose exact rows at `O,c,d` are `BO,Kxv,Kc`. It also provides a source-clean contradiction consumer once the pattern is shown to satisfy a `ShellMetricCoreAlternative`. What is missing is coverage.

After A5.12, coverage need only consider the four surviving role families

\[
\mathsf U,
\quad
\mathsf{B_{off}},
\quad
\mathsf{X_t},
\quad
\mathsf{X_v},
\tag{A5.32}
\]

crossed with the six source-authenticated clauses of A5.8. Thus the exact classifier has **twenty-four**, not thirty, cells.

Every cell receives the following common ingress:

1. the exact twelve-point carrier and `(5,4,6)` cap partition;
2. the strict order `u<c<xv<xu`;
3. exact supports `BO,Kxv,Kc` and their intersection bounds;
4. the second-cap and physical-class deletion fans;
5. the two original `xu` common-deletion packets;
6. the cap-localized row-avoiding source `z` of A5.7a;
7. the second row-avoiding source `z0` and blocker exclusion (A5.31);
8. the proper-subset escape center `e` of A5.16; and
9. one of the four role tags and one of the six source/deletion tags.

The target of each cell is not an arbitrary contradiction but one of the explicit constructors of `ShellMetricCoreAlternative`, or a direct convex-hull/order contradiction. In particular:

- `U` should first pass through the exact-eleven five-row boundary;
- `Boff` should produce an off-class bisector/cap localization core;
- `Xt` and `Xv` should produce an oriented five-point circle-isosceles or six-point chain core.

An incidence-only SAT certificate is insufficient. The replay object must retain the cap order, exact source-to-row provenance, and the metric equalities needed by the chosen core constructor.

**Status:** [EXACT TWENTY-FOUR-CELL COVERAGE CONTRACT IDENTIFIED]

###### A5.18. Exact remaining implication

The A5 leaf has now been reduced to the following theorem:

> No twelve-point faithful carrier pattern realizes the complete common A5 ingress together with one of the twenty-four cells in (A5.32) crossed with the source-authenticated six-arm clause.

One of the five structural role families, `Bxu`, is closed by the strict-cap betweenness contradiction of A5.12. The original five-incidence negation is redundant, and the previously considered `d=xv` double-equilateral branch cannot occur at all.

The four remaining families are sharply different:

- `U` is an exact-eleven five-row finite endpoint;
- `Boff` is an off-physical-class bisector localization endpoint;
- `Xt` and `Xv` are two named circle-isosceles chain endpoints.

The current repository supplies the faithful-pattern constructor and the conditional shell-metric consumer, but it does not yet supply the exhaustive twenty-four-cell coverage theorem. The off-spine exact-twelve bank chain is evidence about local predicates, not a substitute for that coverage proof.

**Immediate consumer.** The exact-twelve interior-deletion physical-radius coordinator. Together with A6, A5 exhausts the exact-twelve physical-radius endpoint.

**Status.** [PARTIALLY CLOSED: ONE ROLE FAMILY PROVED IMPOSSIBLE; FOUR ROLE FAMILIES / TWENTY-FOUR SOURCE-TAGGED CELLS REMAIN OPEN]


##### 16.5.A6 - Exact-twelve next row has only the named `xu` hit

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius_nextRowOnlyHit`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 15506-15554. This is the complement of A5 after the common-deletion arm is absent.

**Atomic contract.** Under the same exact-twelve `(5,4,6)` cap profile, prove impossibility when the next canonical row contains `xu` but omits `u` and `xv`.

**Data already proved upstream.** The strict second-cap interior is exactly the four named points `u`, `centerAt(xv)`, `xv`, and `xu`. The next row has its source `centerAt(xv)` automatically, contains `xu`, and omits the other two named physical points. Its remaining two support points must therefore be outside that four-point interior set. The full twelve-point cap partition and the source-survival alternative are retained.

**Exact missing implication.** The unresolved step is to show that no exact four-row with precisely those two named interior hits can be placed among the remaining cap and boundary points while satisfying the other canonical rows and deletion semantics.

**Candidate closure program.**

1. Derive an exact support-location table for the two unnamed members of the next row. The `(5,4,6)` cap sizes determine the cardinalities of the three cap interiors and the shared Moser vertices; use these identities to replace broad carrier membership with a short list of cap regions.

2. For each region pair, use a circle-versus-convex-order lemma: two strict-cap points and two points in specified adjacent caps lie on a common circle centered at the named blocker only in certain noninterlacing orders.

3. Exploit the source-survival disjunction to eliminate the region assignments that place a deleted first-apex point in the canonical row.

4. Because the carrier has exactly twelve points, certify any residual finite order cases after all metric conditions have been reduced to exact orientation and equal-distance predicates.


**Known limits and rejection tests.** A same-cap row may contain two points without contradiction, and two additional points can lie outside the cap. The proof cannot stop at the observation that the row has only two physical-class hits. A finite endpoint must encode the full cap partition and all inherited rows.

**Immediate consumer.** The exact-twelve physical-radius split. Together with A5, this exhausts that endpoint.

**Status.** [OPEN]

##### 16.5.A7 - Deletion of `u` with a fixed physical source pair and a missing incidence

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_uDeletion_fixedPhysicalPair_missingIncidence`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 15826-15856 in the inspected source lineage. This is the source-clean `u`-deletion endpoint with the fixed physical pair `xu` and `deleted`.

**Atomic contract.** Let

- `cxu` be the actual blocker selected at source `xu`, with exact row `Kxu` centered at `cxu`;
- `cd` be the actual blocker selected at source `deleted`, with exact row `Kdeleted` centered at `cd`; and
- `BO` be the exact physical-radius row centered at the fully deletion-robust apex `O`.

The fixed-pair packet supplies the three seed incidences placing `deleted` in `BO`, `Kxu`, and `Kdeleted`. The checked tetrahedron consumer additionally requires

\[
c_{xu}\in BO,\quad O\in K_{xu},\quad c_d\in K_{xu},
\quad O\in K_{deleted},\quad c_{xu}\in K_{deleted}.
\tag{A7.1}
\]

The leaf assumes that at least one incidence in (A7.1) is absent.

**Canonical reduction now proved.** By the robust-apex tetrahedron-or-continuation theorem of Section 16.5.38, the five branches become exactly:

| Missing incidence | Deleted source | Surviving centers |
|---|---|---|
| `cxu ∉ BO` | `cxu` | `O` and `cxu` |
| `O ∉ Kxu` | `O` | `O` and `cxu` |
| `cd ∉ Kxu` | `cd` | `O` and `cxu` |
| `O ∉ Kdeleted` | `O` | `O` and `cd` |
| `cxu ∉ Kdeleted` | `cxu` | `O` and `cd` |

If all five incidences held, the exact rows would make `O`, `cxu`, `cd`, and `deleted` pairwise equidistant, contradicting planar geometry. If one is absent, exact-row persistence and robustness construct the corresponding common-deletion packet.

**Unbounded producer now proved.** Each of `BO`, `Kxu`, and `Kdeleted`
has exactly four points, so their union has at most twelve points. Since
`13 ≤ |A|`, choose a carrier source `q` outside all three rows. Deleting
`q` preserves all three exact rows with their original supports. The three
pairwise distinct centers `O`, `cxu`, and `cd` therefore form a
source-exact three-center common-deletion packet, and each pair of its row
supports intersects in at most two points.

This argument is formalized by
`pentagonOffClassBlocker_fixedPhysicalPair_uDeletion_exists_source_outside_threeRows`,
`ThreeCenterCommonDeletionExactRows`, and
`pentagonOffClassBlocker_fixedPhysicalPair_uDeletion_outsideThreeRows_exactRows`.
The live leaf now passes the chosen source, its three omission facts, and this
exact-row packet to the remaining terminal. It also passes the typed five-way
continuation packet; the terminal no longer receives only the unstructured
negation of (A7.1).

**Exact remaining implication.** It remains to prove the unbounded
continuation theorem: under the full source-heavy rigid packet, the
source-tagged exact-row triangle cannot coexist with any of the five typed
common-deletion continuations above. Unlike A5, a single exact-cardinality
certificate cannot establish this general-cardinality statement.

**Candidate closure program.**

1. Normalize the five packets into one tagged family while retaining the deleted source, the non-apex center, and the exact row that survived.

2. Compare each continuation to the original `u`-deletion data. In the three arms whose deleted source is one of `O`, `cxu`, or `cd`, determine whether the continuation creates a two-cycle in the chosen blocker map, a repeated common-deletion source, or a third distinct deletion.

3. Use the formalized outside-three-rows source as the common deletion for
   the exact rows at `O`, `cxu`, and `cd`. For a repeated continuation
   source, use canonical-row uniqueness at every nonrobust center to obtain
   exact support equality. For a new source, preserve it as a strictly larger
   source-faithful deletion fan; do not flatten it to anonymous survivals.

4. The required terminal must use the rigid cap placement. A promising form is a strict boundary-order potential on the sequence

\[
\text{deleted source}\longmapsto
\text{surviving non-apex center}\longmapsto
\text{its actual blocker}.
\]

Prove that every continuation arm strictly advances the potential, while finiteness forces a cycle.

5. If such a potential cannot be proved, this branch should be routed to the unbounded cap-weighted blocker theorem rather than split into more local leaves.

**Known limits and rejection tests.** The complete-incidence contradiction cannot be contraposed into positive incidence production. A directed blocker cycle is not contradictory without a strict potential. The two centers in a common-deletion packet may use independent radii. A finite list of cardinality slices does not close the unbounded `13 ≤ |A|` theorem.

**Immediate consumer.** The `threeCenterDeletion_u` coordinator. Its canonical five-way reduction is now closed; its continuation geometry remains open.

**Status.** [PARTIALLY REDUCED: canonical reduction PROVED in prose; unbounded five-arm continuation theorem OPEN]

##### 16.5.A8 - Deletion of `xv` with two failing-then-surviving blockers and a missing incidence

**Declaration.** `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_threeCenterDeletion_xv_missingIncidence`

**Source and role.** `Rigid221SourceHeavy.lean`, approximately lines 15917-15973 in the inspected source lineage. This is the `xv`-deletion endpoint after two nonphysical blockers are known to fail under deletion of `u` and survive under deletion of `xv`.

**Atomic contract.** Let `c1,c2` be the two distinct nonphysical blockers, with exact canonical rows `K1,K2`, and let `BO` be the exact row centered at the fully deletion-robust physical apex `O`. Failure after deleting `u` gives

\[
u\in K_1\cap K_2,
\]

and the physical packet gives `u ∈ BO`. The checked complete-incidence consumer requires the additional five incidences

\[
c_1\in BO,\quad O\in K_1,\quad c_2\in K_1,
\quad O\in K_2,\quad c_1\in K_2.
\tag{A8.1}
\]

The leaf assumes at least one incidence in (A8.1) is absent.

**Canonical reduction now proved.** Section 16.5.38 converts the five missing-incidence branches to:

| Missing incidence | Deleted source | Surviving centers |
|---|---|---|
| `c1 ∉ BO` | `c1` | `O` and `c1` |
| `O ∉ K1` | `O` | `O` and `c1` |
| `c2 ∉ K1` | `c2` | `O` and `c1` |
| `O ∉ K2` | `O` | `O` and `c2` |
| `c1 ∉ K2` | `c1` | `O` and `c2` |

The already-proved failed-then-surviving semantics are used only to identify `K1` and `K2` canonically and to establish `u ∈ K1∩K2`; no existential survival support is synchronized by choice. If all five additional incidences held, `O,c1,c2,u` would be four pairwise equidistant planar points.

**Exact remaining implication.** It remains to show that no one of these five continuation packets is compatible with the source-heavy cap order, the distinct nonphysical blocker placement, and the original `u`-failure/`xv`-survival asymmetry.

**Candidate closure program.**

1. Retain the multiplicity information at `c1` and `c2`: deletion of `u` drops each center from multiplicity four to three, while deletion of `xv` leaves each at multiplicity at least four. Hence `u` lies in both canonical rows and `xv` lies in neither.

2. For each continuation arm, compare its deleted source with `u` and `xv`. If the source is `c1`, `c2`, or `O`, record a three-deletion table at both blockers rather than discarding the asymmetry.

3. Since `K1` and `K2` already share `u`, any additional forced shared point saturates their two-circle intersection. Use the continuation packet to determine whether a third shared point is forced; otherwise retain the exact second point as a named pair and place both centers on its perpendicular bisector.

4. Combine that perpendicular-bisector placement with the strict cap locations of `c1` and `c2`. The desired terminal is either three carrier centers on one line, an interlacing-chord violation, or a strict boundary-order cycle.

5. A branch that yields only a new common-deletion packet should be handed to the same tagged continuation dispatcher as A7, not represented by a fresh opaque `False` leaf.

**Known limits and rejection tests.** Two distinct exact rows may share exactly two points, and independent radii may coexist. The common source `u` alone is not a contradiction. No radius equality follows merely from both rows containing `u`. The geometric step must use either a second named shared point or cap order.

**Immediate consumer.** The `threeCenterDeletion_xv` coordinator. The common-deletion reduction is complete; the cap-sensitive continuation terminal remains open.

**Status.** [PARTIALLY REDUCED: canonical reduction PROVED in prose; five cap-sensitive continuation arms OPEN]

#### 16.5.B `Rigid221Placement.lean` - five reachable leaves

These are the stable placement terminals immediately below the contextual rigid `2+2+1` decomposition. They are smaller than the source-heavy continuations but often lack the later named companions. Where necessary, the correct repair is to enrich the terminal with data already available to its caller rather than to invent a local geometric axiom.

##### 16.5.B1 - Pairwise-distinct-radius minimal deletion core

**Declaration.** `false_of_exactFourMutualOmissionRigid221_minimalCore`

**Source and role.** `Rigid221Placement.lean`, approximately lines 531-574. This is the minimal-core geometry arm of `ExactFourMutualOmissionRigid221GlobalDeletion` when the global deletion center is not the physical apex.

**Atomic contract.** From a minimal counterexample, a positive physical class of exact size five, mutual omission of two source rows, a rigid `2+2+1` decomposition, and a `MinimalDeletionCore` at a nonphysical center, derive `False`.

**Data already proved upstream.** The deleted set is nonempty, contained in the physical five-class, and has cardinality at most five. K4 fails at the global center after deleting the whole set but is restored when any one deleted point is put back. The core supplies a critical four-shell for each restored point and pairwise-disjoint shell supports. The rigid packet records how the physical class meets the two principal rows.

**Exact missing implication.** The missing theorem is a cap-sensitive bound on a family of pairwise-disjoint exact four-shells centered at one point and indexed by a small subset of one physical circle.

**Candidate closure program.**

1. Expand the minimal-core semantics into exact multiplicity statements. For each deleted source `s`, identify the unique radius at the common center whose four-class in the partially restored carrier contains `s` and fails when `s` is removed.

2. Prove that the core radii are pairwise distinct and their supports are disjoint in the original carrier, with each support containing exactly one deleted point. Make all cardinality consequences explicit.

3. Intersect every support with the three Moser caps. A circle centered at one fixed nonphysical carrier point should have a uniform upper bound on points in the physical strict cap or on repeated boundary intervals. Sum that bound over the disjoint shells.

4. If the resulting inequality is not contradictory, use the rigid `2+2+1` row traces to show that at least two core shells must share a named physical or boundary point, contradicting disjointness.


**Known limits and rejection tests.** Pure counting gives only `4 * |deleted|` support incidences and is compatible with sufficiently large carriers. The contradiction must use cap location or forced shared points. The theorem cannot be closed by asserting that distinct radii at one center are impossible; concentric circles are entirely possible.

**Immediate consumer.** The nonphysical branch of the Rigid221 placement dispatcher. A successful common-center/disjoint-shell cap bound would also inform the two-radius and unbounded leaves.

**Status.** [OPEN]

##### 16.5.B2 - The source blocker is the rigid singleton deletion

**Declaration.** `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted`

**Source and role.** `Rigid221Placement.lean`, approximately lines 734-746. The physical apex is the global-deletion center, `u` is the retained source, and the actual blocker of `u` is the distinguished singleton omitted from the two rigid two-point blocks.

**Atomic contract.** Prove impossibility of the exact placement `centerAt(u)=deleted` inside the rigid physical five-class context.

**Data already proved upstream.** The blocker and the source-row physical companion lie on the same physical circle centered at the second apex. The source row contains `u` and its companion but omits its own center. The deleted point is the fifth physical-class point outside the two disjoint row blocks. Mutual omission, exact class size five, cap-growth data, and the joint-deletion packet remain available through `P`.

**Exact missing implication.** One must turn the equal-chord relation at the deleted point and the known cap positions of the two-point blocks into a contradiction with the singleton's placement.

**Candidate closure program.**

1. Name the second physical member `xu` of the source row. From `centerAt(u)=deleted`, derive `dist(deleted,u)=dist(deleted,xu)`.

2. Use the common physical circle to convert that equality into an arc-midpoint alternative for `deleted` relative to `u` and `xu`.

3. Prove where the rigid singleton deletion lies in the cap partition. If it lies outside the open arc containing the source block, the midpoint alternative should place it at the opposite arc midpoint; compare that location with the two other physical-block points and convex order.

4. Close the remaining reflected orientation by one generic equal-chord/cap-separation lemma rather than two ad hoc coordinate calculations.


**Known limits and rejection tests.** The equality of two chord lengths is not itself contradictory. The proof needs an explicit theorem connecting the geometric cap to a unique open arc of the physical circle. It must not assume the singleton lies outside that arc without deriving its cap membership from the rigid packet.

**Immediate consumer.** The physical-apex source-equals-`u` placement dispatcher. The same common-circle arc lemma is expected to support A1 and B3.

**Status.** [OPEN]

##### 16.5.B3 - Blocker `v` and a source-row-heavy cap shape

**Declaration.** `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`

**Source and role.** `Rigid221Placement.lean`, approximately lines 882-897. The checked normalization already proves that `v` lies in the strict physical second-cap interior.

**Atomic contract.** Assume `centerAt(u)=v`, both physical members of the source row are strict second-cap interior, and `v` is also strict interior. Prove `False`.

**Data already proved upstream.** The source row meets the physical five-class in an exact two-point block containing `u`; call the companion `xu`. Thus `u`, `xu`, and the center `v` are distinct points on the same physical circle and in the same strict cap, with `dist(v,u)=dist(v,xu)`. The opposite row is mutually omitted from the source row and contributes the other rigid two-point block.

**Exact missing implication.** The immediate geometry yields a strict-arc midpoint relation, but a single midpoint is realizable. The missing step is to connect that midpoint to the opposite row or to the next blocker so that a closed order cycle is formed.

**Candidate closure program.**

1. Prove the arc-midpoint identity for `v` between `u` and `xu`.

2. Extract the exact cap locations of the opposite block `{v,xv}`. Because `v` is itself one member of that block, identify whether `xv` lies in the same strict arc or an adjacent cap.

3. Use mutual omission (`v` omitted from the `u` row and `u` omitted from the `v` row`) together with canonical blocker semantics to constrain the next blocker of `v`. Split it into the already named physical placements and an off-class center.

4. In the physical placements, derive a second arc-midpoint relation and close a strict cycle. In the off-class placement, invoke the two-pinned-pair localization proposed for A4.


**Known limits and rejection tests.** Three same-circle strict-cap points with one midpoint relation are feasible. Any proof stopping at that fact is incomplete. This leaf may need to be weakened into a source-clean producer for the later source-heavy pentagon rather than proved directly at the present information boundary.

**Immediate consumer.** The `blockerV` cap-shape splitter. It can be bypassed if the richer source-heavy continuation is made the primary terminal and this theorem becomes an adapter.

**Status.** [OPEN]

##### 16.5.B4 - A blocker in the opposite rigid row and an opposite-row-heavy shape

**Declaration.** `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_oppositeRowHeavy`

**Source and role.** `Rigid221Placement.lean`, approximately lines 907-921. This terminal is deliberately blocker-identity independent: it records membership in the opposite row and the physical class rather than a particular named point.

**Atomic contract.** The actual source blocker lies in the opposite row's physical two-point block; the source row is not heavy, while both opposite-row physical points lie in the strict cap. Prove `False`.

**Data already proved upstream.** The rigid class is exactly `2+2+1`. The blocker is one of the two opposite-block points and is a carrier center. The source itself is strict interior. The opposite row has exactly two physical strict-cap hits, while the source row has fewer than two. Mutual omissions and all exact row cardinalities are available.

**Exact missing implication.** The missing theorem must show that a canonical center chosen from the heavy opposite block cannot support the source row under the inherited cap order.

**Candidate closure program.**

1. Name the two opposite-block points and split the blocker membership into the source `v` and its companion. Keep both branches symmetric through a typed packet.

2. For each branch, derive the equal-chord relation from the blocker to the two physical members of the source row. Determine the source row's one or zero strict-cap physical hits from the `not heavy` hypothesis and the rigid `2+2+1` count.

3. Apply a common-circle separation lemma: a center on the heavy interior block cannot be equidistant to a source-block pair separated across the adjacent-cap boundary without forcing the center or one source onto the wrong arc.

4. If the row has only one physical-class member, retain the two nonphysical support points and use their cap regions; otherwise the equal-chord argument is underdetermined.


**Known limits and rejection tests.** The heavy count refers to an intersection cardinality, not automatically to a named pair until the exact two-point block is unpacked. A generic same-cap-circle bound of at most two points gives equality here, not a contradiction. The proof needs order, not another cardinality estimate.

**Immediate consumer.** The shared blocker-in-opposite-row dispatcher, used by both blocker-equality and blocker-other parents.

**Status.** [OPEN]

##### 16.5.B5 - The exceptional sparse `1+1+1` row pattern

**Declaration.** `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_sparseRows`

**Source and role.** `Rigid221Placement.lean`, approximately lines 930-944. Both row-heavy alternatives have been excluded; the rigid class and the three-interior-point bound normalize the remaining case to one interior point from each two-point block plus the singleton.

**Atomic contract.** Prove that the normalized sparse placement is impossible when the source blocker lies in the opposite row's physical block.

**Data already proved upstream.** There are exactly three strict physical-cap interior points. The source row contributes exactly one, the opposite row contributes exactly one, and the singleton physical-class point is the third. The two unused members of the rigid blocks lie outside the strict interior. The actual blocker is in the opposite block and in the physical class.

**Exact missing implication.** The missing step is an exact cyclic-order exclusion of this `1+1+1` placement together with the equal-distance relations from the two canonical rows.

**Candidate closure program.**

1. Introduce names for all five physical-class points and derive the two possible cyclic orders of the `1+1+1` cap split, modulo reflection.

2. Translate each row's exact two-point physical intersection into a chord. Determine whether the two chords cross, nest, or are separated on the physical circle.

3. Use the fact that each row center is itself a carrier point, one center lies in the opposite block, and centers are omitted from their own supports. Derive either an interlacing equal-chord configuration or a point lying in the convex hull of two neighbors.

4. Certify the finitely many residual orientation cases if the generic chord lemma leaves endpoint equalities.


**Known limits and rejection tests.** The abstract `1+1+1` distribution is realizable on a circle. The contradiction, if true, comes from the row centers and mutual omissions, not from the cap count alone. The proof must enumerate endpoint coincidences rather than silently assuming all five named roles are distinct.

**Immediate consumer.** The final sparse child of the physical-apex source-equals-`u` dispatcher.

**Status.** [OPEN]

#### 16.5.C `Rigid221Closure.lean` - five reachable leaves

These leaves coordinate the placement modules and the post-card-eleven continuation. One raw theorem in this module, `false_of_exactFiveDistinct_biApexRobust_postCardEleven`, is excluded here because the built status report marks it off-spine.

##### 16.5.C1 - The physical-apex branch with a genuine third source

**Declaration.** `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU`

**Source and role.** `Rigid221Closure.lean`, approximately lines 45-97. Here the contextual source is not `u`, so its selected row is genuinely distinct from the two rigid principal rows.

**Atomic contract.** Close the physical-apex rigid branch when the actual source blocker is localized to one of three placements: the distinguished deletion, `u`, or the opposite-row physical block.

**Data already proved upstream.** The source row retains its source identity and physical-class membership. The placement theorem has already reduced the blocker to a finite union. The complete Rigid221 context, mutual omissions, cap-growth surface, and joint-deletion data are still available.

**Exact missing implication.** Each placement requires a source-faithful contradiction. Existing source-equals-`u` leaves cannot simply be applied because the third source row has different support and omission facts.

**Candidate closure program.**

1. Split the theorem into three named child packets, one per placement, and carry the source row's exact physical-class intersection into each child.

2. For `blocker=deleted` and `blocker=u`, derive common-circle arc relations using the third source and its physical companion. Compare them with the already fixed principal-row chords.

3. For blocker membership in the opposite block, reuse B4/B5 only after proving an adapter that replaces their source-equals-`u` assumptions with the exact third-row traces they actually consume.

4. If the third row carries strictly more information than the stable B4/B5 interface, move the terminal downstream rather than discarding that information.


**Known limits and rejection tests.** Equality of the source with `u` is not cosmetic; it changes which canonical row is being discussed. Rewriting a third-row support as the `u` row would be unsound. The blocker-placement disjunction alone is not contradictory.

**Immediate consumer.** The physical-apex side of the top-level Rigid221 closure.

**Status.** [OPEN]

##### 16.5.C2 - Nonphysical global center with an equal-distance deleted pair

**Declaration.** `false_of_exactFourMutualOmissionRigid221_nonphysicalCollision`

**Source and role.** `Rigid221Closure.lean`, approximately lines 215-260. This is the collision geometry arm when the rigid global-deletion center is not the physical apex.

**Atomic contract.** Given two distinct deleted physical-class points at equal distance from a nonphysical center, together with the rigid `2+2+1` decomposition and global-deletion minimality, prove `False`.

**Data already proved upstream.** The nonphysical center is a carrier point outside the deleted set. The deleted points lie on the physical circle and on one circle centered at the global center. The minimal deletion packet records failure after deleting the full set and restoration when individual points return. The rigid rows specify which physical points belong to which principal supports.

**Exact missing implication.** The missing implication is to show that the equal-distance pair cannot be accommodated by the minimal-core shells and rigid physical-class partition.

**Candidate closure program.**

1. Intersect the global center's relevant radius circle with the physical circle. Distinct centers imply at most two common points, so the named deleted pair exhausts that intersection.

2. Use restoration for each deleted point to identify which minimal-core shell uses that point. Prove that any shell requiring another physical-class point at the same global-center radius would exceed the two-circle intersection bound.

3. Show that the rigid `2+2+1` partition or mutual omission forces such a third physical point, or else forces two core shells to share a nonphysical support, contradicting pairwise disjointness.

4. If neither follows from the present contract, enrich this terminal with the exact core-shell-to-rigid-row incidence already available at the caller.


**Known limits and rejection tests.** Two circles with distinct centers can meet in exactly two points, so the named collision is locally realizable. The proof must use the minimal-core restoration or a forced third intersection. It may not assert that the equal-distance pair makes the two centers equal.

**Immediate consumer.** The nonphysical side of the Rigid221 closure, immediately above the minimal-core and collision split.

**Status.** [OPEN]

##### 16.5.C3 - Two disjoint exact-four classes at two radii of one apex

**Declaration.** `false_of_exactFourPostCardElevenTwoRadiusBranch`

**Source and role.** `Rigid221Closure.lean`, approximately lines 694-714. This is the post-card-eleven branch when no positive radius class has size five but two distinct rich radii each give an exact four-class at the second apex.

**Atomic contract.** Prove that two disjoint four-point classes on concentric circles centered at the same apex cannot occur with the robust post-card-eleven surface and the inherited cap constraints.

**Data already proved upstream.** Both radii are positive and distinct. Each selected support has exactly four carrier points, the supports are disjoint, and their cap-interior slices are retained by the producer. The absence of any five-point class rules out a simple robustness escape. The carrier is convexly independent and the second apex is a Moser vertex.

**Exact missing implication.** Concentric exact-four classes are geometrically possible in isolation. The missing theorem must use the precise angular/cap placement to show that all eight points cannot simultaneously be exposed vertices of the carrier.

**Candidate closure program.**

1. Develop a polar exposed-point criterion. For an inner-circle point to be a convex-hull vertex in the presence of outer-circle points, its angular coordinate must lie in a sufficiently large gap between adjacent outer points; formulate this using supporting lines rather than analytic trigonometry where possible.

2. Apply the criterion to all four inner points. The four required outer angular gaps are disjoint. Combine their lower bounds with the known cap angular span or with reflected-pair identities supplied by the downstream two-radius grid route.

3. If the radius ratio is unconstrained, derive the additional equal-distance equations from the two canonical rows before expecting a contradiction. A purely concentric theorem with arbitrary close radii is likely false.

4. Share the strengthened result with D2, where the reflected-pair grid provides exactly the extra algebraic constraints missing here.


**Known limits and rejection tests.** Do not state that points on the smaller concentric circle are automatically inside the convex hull of the larger four points; that is false when the outer points leave large angular gaps. A valid theorem must include enough angular coverage or row equations to control those gaps.

**Immediate consumer.** The post-card-eleven robust-surface dispatcher. It is a likely beneficiary of a single two-radius convex-order theorem shared with the TriApex grid leaf.

**Status.** [OPEN]

##### 16.5.C4 - The swapped protected exact-four outcome

**Declaration.** `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome`

**Source and role.** `Rigid221Closure.lean`, approximately lines 756-770. The theorem receives the original residual, a physical common-deletion ingress, and a swapped protected exact-four frontier.

**Atomic contract.** Show that the swapped exact-four outcome is impossible or strictly decreases a well-founded measure, so the physical consumer cannot recurse symmetrically without progress.

**Data already proved upstream.** The swap retains source and deletion provenance and exchanges protected roles. The surrounding coordinator already handles the nonswapped outcome. The original surplus index, cap labels, and ordered source pair remain available outside the flattened swapped packet.

**Exact missing implication.** A symmetric packet is not contradictory by itself. The missing proof must identify an asymmetry that is preserved by construction and changes strictly under the swap, or bypass the swap with a direct geometric argument.

**Candidate closure program.**

1. List every field changed by the swap and every field fixed. Candidate measures include the ordered pair of cap indices, boundary positions of protected sources, and lexicographically ordered cap sizes.

2. Prove that the producer's choice rule is extremal with respect to one candidate measure. Then show the swapped outcome yields a strictly smaller admissible choice, contradicting extremality.

3. If no such measure is present, strengthen the producer to select the protected pair canonically before performing the split. Do not add an arbitrary orientation field after the fact.

4. As a fallback, unfold both protected frontiers simultaneously and prove a direct two-orientation contradiction, making clear which original asymmetry distinguishes them.


**Known limits and rejection tests.** A theorem whose hypotheses are invariant under the role swap cannot prove `False` solely because the roles are swapped. Any recursive call without a decreasing measure risks circularity. This leaf should be treated first as a well-foundedness audit, not as a metric endpoint.

**Immediate consumer.** The exact-four physical consumer and its protected-outcome dispatcher.

**Status.** [OPEN]

##### 16.5.C5 - Exact-five first-apex residual with a common obstruction center

**Declaration.** `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual`

**Source and role.** `Rigid221Closure.lean`, approximately lines 1107-1116. Both obstruction sources select the same canonical blocker in the exact-five first-apex residual.

**Atomic contract.** From the exact-five first-apex class and the equality of the two obstruction blockers, derive `False`.

**Data already proved upstream.** The common blocker has one canonical four-row containing both obstruction sources. The exact-five apex class, omission data, robust surface, and source identities are retained. Equal blockers imply equality of canonical rows without any support-choice ambiguity.

**Exact missing implication.** Two sources in one canonical row are allowed. The missing step is to force either a third point of the exact-five apex class into that row, a forbidden center/support coincidence, or a cap-order obstruction.

**Candidate closure program.**

1. Compute the intersection of the common canonical row with the exact-five apex class. It already contains the two obstruction sources and has cardinality at most two if its center differs from the apex. Therefore those two points exhaust the intersection in the distinct-center case.

2. Use every other member of the exact-five class as a deletion source. The obstruction definition should say why it cannot use the same blocker; translate that into survival or omission statements for the common row.

3. Apply a blocker-fiber pigeonhole or all-blockers selection theorem to force one additional class source to the same blocker, yielding a third circle intersection. If the common blocker equals the apex, use center-not-in-support because the apex's selected class cannot contain its center at positive radius.

4. If current obstruction data mention only two sources, move this leaf to the earliest caller where the remaining three exact-five points and their blockers are still available.


**Known limits and rejection tests.** The equality of two blockers is not enough for a contradiction: a four-row can contain two prescribed sources. The required third incidence must be positively produced, not inferred from the class having five points. This route is promising only if the global cover supplies blocker information for the other class members.

**Immediate consumer.** `false_of_originalFrontierUniqueRadiusArm`. This leaf has a compact contract and may be a high-leverage test of the all-blockers formulation.

**Status.** [OPEN]

#### 16.5.D `TriApexEndpointRetainedOmission.lean` - nine reachable leaves

The TriApex cluster retains three large cap/apex systems, paired common-deletion data, and endpoint omissions. Its local shells are known to be partly realizable, so every terminal must use the all-large context or a genuinely global order invariant.

##### 16.5.D1 - A joint deletion on the apex class with a fourth distinct blocker

**Declaration.** `false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core`

**Source and role.** `TriApexEndpointRetainedOmission.lean`, approximately lines 2014-2035. A third source `J` lies on the first-apex class, is omitted by both retained shells, and has its own blocker distinct from the first apex and the two retained blockers.

**Atomic contract.** Given survival after deleting `J` at the first apex and both retained blockers, plus a fourth distinct blocker selected for `J`, derive `False` under `TriApexAllLargeContext`.

**Data already proved upstream.** Four named centers are distinct. The deletion of `J` preserves K4 at three of them, while `J` lies in its own blocker's canonical row. All three relevant cap systems are large, and the paired common-deletion packets retain source identities and shell omissions.

**Exact missing implication.** The missing theorem is a four-center global common-deletion obstruction that uses the tri-apex cap order; the local survival statements alone are realizable.

**Candidate closure program.**

1. Canonicalize all three post-`J` survival witnesses and retain their independent supports. At each nonrobust center, survival says `J` is absent from its canonical row; at a robust center, record the second-heavy-radius alternative explicitly.

2. Place the fourth blocker and the three surviving centers into the tri-apex cap regions. Choose an extremal center in cyclic order and orient every canonical row relative to that choice.

3. Prove that the three `J`-omitting rows separate the carrier around `J` while the fourth row must contain `J`; use Jordan/chord crossing or signed orientation to force one row to cross the convex boundary improperly.

4. Route any robust alternative to a cap-growth count instead of adding another survival-square terminal.


**Known limits and rejection tests.** Four distinct centers and one common deletion do not synchronize radii or supports. No proof may treat the three surviving K4 witnesses as a single circle arrangement without canonicalization. The known partial shell witness rules out a theorem based only on two retained shells and omissions.

**Immediate consumer.** The paired-common-deletion tri-apex all-large dispatcher.

**Status.** [OPEN]

##### 16.5.D2 - The two-radius reflected grid with a four-in/four-escape cap census

**Declaration.** `false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core`

**Source and role.** `TriApexEndpointRetainedOmission.lean`, approximately lines 2036-2061. This is the richest explicit metric terminal in the TriApex cluster.

**Atomic contract.** Two distinct positive radii at the first apex produce two
disjoint exact four-classes. Two retained shells partition those eight points,
and four signed-area pair-separation identities form a two-radius grid. Exactly
four grid points lie in the strict first-cap interior; the other four escape to
the two adjacent caps. Prove `False`.

**Data already proved upstream.** `PairedGridCapPlacement` proves that the
retained-radius interior slice is exactly `{O.kept, O.deleted}`, the other
radius contributes exactly two interior points, and each retained shell
contributes exactly one of those points.  The retained partners lie outside the
strict interior.  The theorems
`grid_retainedPartners_mem_distinct_adjacentCaps` and
`grid_otherClass_escapees_mem_distinct_adjacentCaps` place both escape pairs
in opposite adjacent caps.  This four-in/four-escape census is PROVEN in Lean.

**Exact missing implication.** The unresolved statement is an order-sensitive
metric fact using the proved cap census: the two exact four-classes, shell
partition, four pair-separation identities, and opposite-adjacent-cap escapes
cannot occur in the strictly convex carrier.

**Candidate closure program.**

1. Choose typed labels for the interior point and escapee in each shell's
other-radius pair.  Retain the two independent left/right orientations instead
of assuming a common reflection axis.

2. Localize the two shell blockers by cap index and split on whether those
indices agree.

3. In the equal-index arm, combine the one-hit theorem for the other rich caps
with the exact shell slices.  In the unequal-index arm, convert the four
pair-separation identities and escape orientations into a finite forbidden
boundary-order outcome.

4. Route each outcome to an existing strict-convexity or Kalmanson consumer.
Any coordinate calculation must retain both radius-order cases and the exact
cap labels.


**Known limits and rejection tests.** Two arbitrary concentric four-sets can be
convexly independent, especially when the radii are close and angular gaps are
large. The proof must consume the reflected-pair grid and the exact
four-in/four-escape placement. A generic claim that inner-circle points lie
inside the outer hull is false.

**Immediate consumer.** The two-radius TriApex core. A successful theorem is likely to close or sharply reduce C3 as well.

**Status.** [CAP CENSUS PROVEN IN LEAN; ORIENTED-LABEL AND TERMINAL KERNEL OPEN]

##### 16.5.D3 - Endpoint cross-hit with first center equal to the fresh source

**Declaration.** `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_firstCenterEqFreshSource_triApexAllLarge_core`

**Source and role.** `TriApexEndpointRetainedOmission.lean`, approximately lines 3445-3461. This is the role-collision branch `A=J` after a reverse hit and a fresh endpoint cross hit.

**Atomic contract.** Derive `False` when the first endpoint blocker equals the fresh first-apex row source in the retained-omission all-large context.

**Data already proved upstream.** The cross hit places one endpoint in a named fresh row, the reverse hit places the fresh source in a retained shell, and the equality identifies a center role with that source. All source and blocker inequalities not collapsed by `A=J` remain available.

**Exact missing implication.** The missing implication is to show that the role equality forces a center into its own positive-radius support or creates a forbidden two-row intersection.

**Candidate closure program.**

1. Rewrite every row and center occurrence by `A=J` and build an exact membership table.

2. Apply center-not-in-own-support to any row now having `J` as both center and listed support. If no direct self-membership appears, identify the two rows that now share both endpoint and fresh source.

3. Use the cross-hit and reverse-hit distance equations to determine whether those rows have distinct centers. If distinct, a third inherited shared point would contradict the two-circle intersection bound; if equal, canonical row equality should contradict an omission.

4. Keep the all-large cap context only for residual cases not closed by the role equality; do not obscure a simple support contradiction behind a global theorem.


**Known limits and rejection tests.** Role equality must be propagated through dependent packet fields carefully; the source point, blocker center, and support source are different typed roles before rewriting. A visual diagram is not a proof of self-membership.

**Immediate consumer.** The endpoint-cross-hit equality splitter.

**Status.** [OPEN]

##### 16.5.D4 - Shared blocker with the fresh source in the left adjacent cap

**Declaration.** `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInLeftAdjacentCap_triApexAllLarge_core`

**Source and role.** `TriApexEndpointRetainedOmission.lean`, approximately lines 3462-3483. The endpoint centers coincide, and the fresh source lies in the left adjacent cap relative to the first-apex cap.

**Atomic contract.** Use the shared blocker, reverse hit, cross hit, and left-adjacent-cap placement to derive `False`.

**Data already proved upstream.** Two source rows have the same blocker and therefore the same canonical four-row. The row contains the two corresponding sources and inherited endpoint hits. The fresh source is outside the first strict cap and lies in the named left adjacent cap. All three apex caps are large.

**Exact missing implication.** The missing theorem is a one-sided cyclic-order contradiction for the common row and the retained shell endpoints.

**Candidate closure program.**

1. Canonicalize the equal-blocker rows to one exact support and list all forced members. If four distinct members are already identified, the row is completely determined.

2. Locate those four members in the three cap intervals and derive their boundary order. A circle centered at the shared blocker through an interlacing left-cap/first-cap pair should force a chord crossing or put the blocker on a forbidden side of a support line.

3. Prove the orientation lemma for an abstract ordered triangle cap with a `left` parameter. Derive D5 by reflection from the same theorem rather than duplicating metric algebra.

4. Use all-large cardinality only to choose a fresh point when the four support members do not yet exhaust the row.


**Known limits and rejection tests.** Equal blockers give equal canonical rows, not automatically equal arbitrary survival supports. The left/right reflection is valid only after proving that all oriented definitions transform as claimed. Local two-shell geometry alone is known to be realizable.

**Immediate consumer.** The shared-blocker branch of the endpoint-cross-hit splitter.

**Status.** [OPEN]

##### 16.5.D5 - Shared blocker with the fresh source in the right adjacent cap

**Declaration.** `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInRightAdjacentCap_triApexAllLarge_core`

**Source and role.** `TriApexEndpointRetainedOmission.lean`, approximately lines 3484-3504. This is the reflected companion of D4.

**Atomic contract.** Derive `False` from the same shared-row and endpoint incidences when the fresh source lies in the right adjacent cap.

**Data already proved upstream.** The packet is the orientation-reversed analogue of D4, with all source identities and cap indices retained.

**Exact missing implication.** The exact missing step is the right-oriented version of the common-row cyclic-order contradiction.

**Candidate closure program.**

1. Construct an explicit reflection adapter on the Moser-triangle cap indexing, row supports, and signed orientations.

2. Map the right-adjacent packet to the left-adjacent theorem proposed for D4.

3. Check that source order and the labels of reverse and cross hits are transformed, not silently exchanged.

4. Retain a direct proof only if the reflection adapter would require more machinery than the orientation lemma itself.


**Known limits and rejection tests.** Do not close this theorem by citing informal symmetry. Lean needs an isometry or a previously proved index-permutation theorem transporting every dependent field. If D4 remains open, this theorem remains open too.

**Immediate consumer.** The reflected shared-blocker branch.

**Status.** [OPEN]

##### 16.5.D6 - Endpoint cross-hit with the second center equal to the first source

**Declaration.** `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_secondCenterEqFirstSource_triApexAllLarge_core`

**Source and role.** `TriApexEndpointRetainedOmission.lean`, approximately lines 3562-3578. This is the role collision `X=C` in the second-center equality arm.

**Atomic contract.** Derive `False` when the blocker selected at the fresh source equals the first fiber source.

**Data already proved upstream.** The reverse-hit and endpoint-cross-hit packet identifies several exact row memberships. After `X=C`, one source becomes a center for a row connected back to its own retained endpoint. The other role inequalities remain.

**Exact missing implication.** The missing step is to turn the role collision into self-support, a forbidden two-cycle, or a third intersection of two distinct canonical rows.

**Candidate closure program.**

1. Substitute `X=C` through all dependent row fields and produce a membership matrix with rows as centers and columns as named sources.

2. Search first for an immediate center-in-own-row contradiction. If absent, isolate the directed two-cycle `C blocks J` and `J` or its endpoint blocks `C`.

3. For a two-cycle, both canonical radii equal the distance between centers. Use the cross-hit to find a second shared support; then use any retained endpoint as a third shared support or derive row equality and contradict an omission.

4. Only invoke cap order if the exact incidence matrix leaves a realizable equal-radius two-circle configuration.


**Known limits and rejection tests.** A blocker two-cycle is geometrically possible by itself. The proof needs the extra endpoint hit or omission. Equality substitution across carrier subtypes must preserve membership proofs.

**Immediate consumer.** The endpoint-cross-hit equality splitter.

**Status.** [OPEN]

##### 16.5.D7 - The generic six-role endpoint cross-hit configuration

**Declaration.** `false_of_retainedOmission_reverseHitFresh_endpointCrossHit_genericRoles_triApexAllLarge_core`

**Source and role.** `TriApexEndpointRetainedOmission.lean`, approximately lines 3579-3600. All six roles `O,A,X,J,C,K` are pairwise distinct after the three equality leaves are removed.

**Atomic contract.** Prove impossibility of the fully generic reverse-hit and endpoint-cross-hit configuration under the tri-apex all-large context.

**Data already proved upstream.** There are three source-blocker rows, two retained omission cycles, named reverse and cross hits, and six distinct carrier roles. Cap locations and source provenance are retained. The branch has no remaining easy equality collapse.

**Exact missing implication.** The missing theorem is a genuine global orientation-cycle obstruction.

**Candidate closure program.**

1. Encode the three canonical rows as oriented chords between their two named hits. Use the convex boundary order to assign each chord an interval or a signed separation relative to the three apex sides.

2. Prove that every directed blocker edge in this packet strictly advances one cyclic potential: for example, the boundary interval containing the row's second named hit. The three hits form a closed directed cycle, contradicting strict advance.

3. If one edge does not advance, show that equality of potential forces one of the already excluded role equalities or shared-blocker cases.

4. Test the proposed potential against the repository's exact partial eleven-point shell witness. The witness must fail an explicit all-large or third-row premise, not the lemma's conclusion.


**Known limits and rejection tests.** Pure incidence counts, pairwise circle intersections, and the mere existence of a blocker cycle are insufficient. A strict potential must be defined and proved monotone on every edge. The six-role distinctness does not synchronize row radii.

**Immediate consumer.** The generic branch of the endpoint-cross-hit splitter and one of the central global geometry obligations.

**Status.** [OPEN]

##### 16.5.D8 - The endpoint common-deletion packet when the cross hit is absent

**Declaration.** `false_of_retainedOmission_reverseHitFresh_endpointCommonDeletion_triApexAllLarge_core`

**Source and role.** `TriApexEndpointRetainedOmission.lean`, in the endpoint
collision branch.  Failure of the cross hit produces

```text
packet : CommonDeletionTwoCenterPacket D H Q.K S.oppApex1
  (H.centerAt Q.J Q.J_mem_A).
```

The inherited reverse-hit context already contains a second packet with the
same deleted source:

```text
C.freshPacket : CommonDeletionTwoCenterPacket D H Q.K S.oppApex1
  (H.centerAt O.deleted O.deleted_mem_A).
```

Write

```text
b := H.centerAt O.deleted O.deleted_mem_A,
x := H.centerAt Q.J Q.J_mem_A.
```

The source-faithful first split is therefore `b = x` or `b ≠ x`.

**D8.a, equal secondary blockers — PROVEN in the branch body.** Assume
`b = x`.  The uniqueness theorem
`ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support`
makes the canonical supports selected at `O.deleted` and `Q.J` equal.  Their
common support contains `Q.C`, `O.deleted`, and `Q.J`: the first point is the
reverse hit, the second and third are the own-source points of the two selected
critical shells, and the third membership is transported across the support
equality.

These points are pairwise distinct by `O.sources_ne`, `Q.J_ne_C`, and
`Q.J_ne_middle` after the recorded walk equalities.  All three lie in
`SelectedClass D.A S.oppApex1 radius`.  Hence the selected shell at
`O.deleted` meets the frontier-radius class in at least three points.  This
contradicts
`ATailFirstApexCriticalFiberRow.criticalShell_inter_frontierRadiusClass_card_le_two`.
This argument uses the frontier-specific bound directly; it does not assume a
new selected four-class at the first apex.

**D8.b, distinct secondary blockers — THREE-EDGE NORMALIZATION PROVEN;
GEOMETRIC TERMINAL OPEN.** Assume `b ≠ x`.  First, `Q.J` cannot lie in the
critical shell selected at `O.deleted`.  Otherwise that shell meets
`SelectedClass D.A S.oppApex1 radius` in the three pairwise-distinct points
`Q.C`, `O.deleted`, and `Q.J`, contradicting
`criticalShell_inter_frontierRadiusClass_card_le_two`.  This is the same
frontier-specific count used in D8.a, but no equality or transport of supports
is needed.

The resulting omission produces a third source-exact packet, now deleting
`Q.J` at the first apex and at `b`.  Together with the packet deleting `Q.K`
at the first apex and at `x`, and `O.packet` transported across the endpoint
blocker equality, the branch contains the directed omission cycle

```text
O.deleted  ->  Q.J  ->  Q.K  ->  O.deleted
     b             x             a
```

where `a` is the common actual blocker of `Q.C` and `Q.K`.  The blocker labels
are pairwise distinct: `b ≠ x` is the branch hypothesis, while the two packet
interfaces exclude `a = b` and `a = x`.  The Lean structure
`EndpointDistinctBlockerThreeStepDeletionCycle` retains `R,O,C,E,Q`, all three
omissions, and all three source-exact packets.  Its proved producer is
`nonempty_endpointDistinctBlockerThreeStepDeletionCycle`.

The remaining declaration
`false_of_endpointDistinctBlockerThreeStepDeletionCycle_triApexAllLarge_core`
is the caller-tagged cap/order terminal.  No existing theorem closes this
cycle: three-center common-deletion results use one deleted source at three
centers, whereas this packet has three successive deleted sources; the
positive-incidence Kalmanson kernels also cannot consume omission edges
without an additional order argument.

**Reuse preflight.** At source revision `8b902b92`, the in-project theorem
index was searched for `CommonDeletionTwoCenterPacket`, three-center deletion,
joint deletion, cross deletion, and three-distinct-blocker consumers.  The
nearest reusable producer is `ThreeCenterCommonDeletionExactRows`, but its
three rows share one deleted source and it has no contradiction consumer.
`ExactFourMutualOmissionJointDeletion` is specialized to the original
unique-four residual and cannot be constructed from this caller.  The
outside-cap fan helper returns blocker-cap escapes or a cross-deletion
disjunction and does not consume this cycle.  The first missing antecedent is
therefore not another packet constructor but a strict cap/order terminal for
the exact three-source cycle above; no import-cycle-free existing declaration
supplies it.

**Measured frontier change.** D8.a previously reduced the internal residual
from `{b = x, b ≠ x}` to `{b ≠ x}`.  This checkpoint closes the missing-edge
construction inside the distinct branch: the cycle-edge deficit decreases
from one to zero, constructor fan-out remains one, and the original D8
coordinator is proved by dispatch to the exact cycle terminal.  The kernel
frontier still has one `sorry`-bearing declaration in this subtree, now the
cycle terminal above.  At revision `8b902b92` the rooted subtree reported
`open: 1/59` with the coordinator itself as the open obligation.  After the
focused build and graph refresh (`da6dee711651`), it reports `open: 2/73` with
one open obligation, the new terminal.  The extra open node is the proved
coordinator reaching that terminal; raw node count is not the chosen measure.

**Immediate consumer.**
`false_of_retainedOmission_reverseHitFresh_endpointCriticalFiber_triApexAllLarge_core`,
and transitively `Problem97.erdos97_rhs`.

**Known limits and rejection tests.** The exact omission cycle is realizable
as local incidence data and is not itself a contradiction.  D8.b still needs
a strict cap-order potential or another global terminal.  It must not be
routed through a generic cycle theorem unless that theorem retains the three
source tags and proves a well-founded decrease.

**Status.** [PARTIAL LEAN CHECKPOINT: D8.a PROVEN; D8.b THREE-EDGE PRODUCER
PROVEN; FOCUSED BUILD PASSED; CALLER-TAGGED CYCLE TERMINAL OPEN; NOT PROMOTED]

##### 16.5.D9 - Three consecutive distinct blockers in the retained-omission route

**Declaration.** `false_of_retainedOmission_reverseHitFresh_threeDistinctBlockers_triApexAllLarge_core`

**Source and role.** `TriApexEndpointRetainedOmission.lean`, approximately lines 3679-3692. Three actual blockers in the reverse-shell/fresh-packet chain are pairwise distinct.

**Atomic contract.** Under the tri-apex all-large context, prove that the three-distinct-blocker path cannot occur.

**Data already proved upstream.** The path retains the exact sources blocked at each step, reverse-hit support memberships, endpoint omissions, and cap placements. Equality and shared-blocker alternatives are handled elsewhere.

**Exact missing implication.** The missing step is to rule out a length-three blocker path by a strict cap-order potential or by forcing an additional collision.

**Candidate closure program.**

1. Define the potential on a source-blocker edge using the oriented cap interval of the blocker relative to the source's retained shell.

2. Prove a local advance lemma for each of the three packet constructors. The proof should use the named reverse/fresh hit, not a generic blocker edge.

3. Compose the three advances. If the path returns to the starting interval, obtain an impossible strict cycle; if it exits, use the all-large third cap to produce the endpoint cross hit and route to D3-D7.

4. Make every equality case explicit so the strictness proof does not assume pairwise distinctness beyond what the theorem supplies.


**Known limits and rejection tests.** A finite map with distinct successive values need not contradict anything. The potential must be global and strictly monotone. Different canonical radii prevent using radius as the potential without an independent comparison theorem.

**Immediate consumer.** The reverse-hit fresh endpoint dispatcher immediately above the equality and common-deletion splits.

**Status.** [OPEN]

#### 16.5.E `TwoSourceFreshThirdResidual.lean` - three reachable leaves

The built snapshot counts three leaves in this module. Raw `main` contains later pinned-endpoint edits whose reachability has not yet been regenerated; they are tracked separately rather than inserted into the built roster.

##### 16.5.E1 - Fresh third source, first non-hit, and aligned retained data

**Declaration.** `false_of_freshThird_firstNonHit_alignedRetained`

**Source and role.** `TwoSourceFreshThirdResidual.lean`, approximately lines 2883-2897 in the built-snapshot source lineage. The packet combines a two-source canonical surface, a fresh-third fiber, and an aligned retained packet.

**Atomic contract.** Prove `False` when the fresh-third configuration has the first-source non-hit and the aligned retained interaction.

**Data already proved upstream.** The two original cap sources have canonical exact rows and a common-radius surface. A fresh third source and blocker fiber are named. The first source is omitted from a specified fresh row; the second-source interaction and aligned retained shell preserve deletion provenance. The source comments note that local named-row alternatives alone do not produce the needed third row.

**Exact missing implication.** The missing theorem is a carrier-wide consequence of the aligned packet: either a third canonical row with prescribed incidences must exist, or the existing rows violate cap order.

**Candidate closure program.**

1. Translate the first non-hit into exact survival-under-deletion semantics at the relevant blocker, eliminating arbitrary witness supports.

2. Use the all-blockers relation for the omitted source to select every alternative blocker rather than the early chosen one. Choose an extremal blocker relative to the cap boundary and prove it cannot remain outside the named rows.

3. Derive a third row or a repeated blocker fiber. Feed the repeated fiber into the common-obstruction or cross-blocker modules; feed the third row into the six-center orientation packet.

4. Keep the aligned retained packet intact through the dispatcher so row provenance is not lost at the final theorem.


**Known limits and rejection tests.** The local two-row incidence packet is known to be realizable. A theorem that concludes `False` from only the first non-hit and alignment would be overstrong. The proof must consume global minimality, an all-blockers choice, or the cap order.

**Immediate consumer.** The fresh-third first-non-hit coordinator.

**Status.** [OPEN]

##### 16.5.E2 - Fresh third source with an independent common-radius surface

**Declaration.** `false_of_freshThird_firstNonHit_commonRadius`

**Source and role.** `TwoSourceFreshThirdResidual.lean`, approximately lines 2900-2912. This branch retains an independent common-radius surface rather than the aligned retained packet of E1.

**Atomic contract.** Prove `False` from the first-source non-hit together with the independent common-radius surface and fresh-third fiber.

**Data already proved upstream.** Two canonical source rows share a separately produced common-radius structure. The fresh row and non-hit are named. The radii and supports of the common-radius surface are not definitionally identical to those of the earlier canonical surface.

**Exact missing implication.** The missing implication is to connect the independent common-radius provenance to the fresh-third non-hit without silently identifying existential radii or supports.

**Candidate closure program.**

1. Normalize both common-radius constructions into typed records containing centers, positive radii, exact supports, and one named shared support point.

2. Prove support or radius equality only from explicit uniqueness and shared-point hypotheses. If they remain independent, carry both surfaces into the geometry theorem.

3. Use the no-five-class or only-rich-radii information to show that two independent common-radius surfaces at the same source force either canonical support equality or deletion robustness.

4. Route equality to E1's aligned theorem; route robustness to an all-large or two-radius cap contradiction.


**Known limits and rejection tests.** Existential K4 witnesses at the same center may choose different radii. The proof cannot replace the independent surface by the aligned one without a uniqueness theorem. The local B2 stress model demonstrates how easily two-circle data can coexist in strict convex position.

**Immediate consumer.** The independent common-radius arm of the fresh-third first-non-hit dispatcher.

**Status.** [OPEN]

##### 16.5.E3 - Equal fresh-third center with two coherent noncanonical interactions

**Declaration.** `false_of_freshThirdEqualCenter_noncanonicalInteractions`

**Source and role.** `TwoSourceFreshThirdResidual.lean`, approximately lines 3064-3134. Both canonical sources cross-hit the fresh row, their selected blockers are equal, and both interactions are noncanonical. Mixed products are already closed; two coherent products remain.

**Atomic contract.** Exclude the two remaining coherent products: both interactions choose distinct blockers in different caps, or both remain in the same cap with an internal fiber source.

**Data already proved upstream.** Equal blockers give one canonical row containing both original sources. Both sources also cross-hit the fresh row. The six-way ingress records exact cap-interaction alternatives, and the mixed cases have source-clean consumers. Only the two globally coherent alternatives reach `sorry`.

**Exact missing implication.** The missing theorem is a joint cap-index incompatibility for the two interactions, not an independent contradiction for either interaction alone.

**Candidate closure program.**

1. Split the theorem into two named children corresponding exactly to the coherent products.

2. For the different-caps child, use the common canonical row to show its two source chords would have to cross two separated cap intervals. Derive an impossible cyclic order or a third row intersection.

3. For the same-cap/internal-source child, select the internal fiber source extremally and show that its blocker must leave the cap, contradicting coherence, or coincide with the common blocker, producing a three-source canonical row.

4. Abstract the shared conclusion as a cap-index parity or orientation invariant so the two children use one theorem with opposite hypotheses.


**Known limits and rejection tests.** Each coherent product may be locally realizable; the contradiction must compare both interactions. Equal blockers identify canonical rows only after unique-four canonicalization. Do not count the fresh row as simultaneous with an unrelated survival support unless source equality is proved.

**Immediate consumer.** The fresh-third equal-center coordinator.

**Status.** [OPEN]

#### 16.5.F `TwoSourceFirstFiberCollision.lean` - one reachable leaf

##### 16.5.F1 - Exact rows after an outside-pair deletion in the first blocker fiber

**Declaration.** `false_of_capSource_firstFiber_outsidePairDeletionExactRows`

**Source and role.** `TwoSourceFirstFiberCollision.lean`, approximately lines 2575-2614. This is a highly enriched five-center deletion boundary after the first blocker-fiber collision has been normalized.

**Atomic contract.** From two common-radius cap sources with mutual cross-membership, equal blockers, an exact two-point cap intersection for the common shell, a deletion equal to one of two named outside points, and a packet of exact surviving rows at five centers, derive `False`.

**Data already proved upstream.** The common blocker yields a canonical row shared by both sources. Collision endpoints are omitted as specified. The blocker lies in a strict cap, and its shell meets that cap exactly in the two sources. The outside pair and the deleted member are named. Five post-deletion centers have exact rows rather than anonymous K4 witnesses.

**Exact missing implication.** The missing theorem is a bounded exact-row collision obstruction preserving all five source identities and the cap order.

**Candidate closure program.**

1. Build a single `FiveCenterExactDeletionRows` normal form listing each center, source, radius, support, and all pairwise role inequalities. Canonicalize rows at nonrobust centers.

2. Construct the row-intersection graph. Equal blockers collapse two source rows; every remaining edge should carry a named shared support. Identify a forced cycle whose total distinct support demand exceeds the available outside pair and cap points.

3. For graph assignments surviving incidence counting, use cyclic order: convert each two-row shared pair into a chord and reject interlacing cycles by orientation.

4. If all roles lie in a bounded label set independent of `|A|`, create a replayable finite certificate. Otherwise prove a bounded-obstruction lemma before certificate use.


**Known limits and rejection tests.** Five exact rows do not automatically form five simultaneous circles with related radii. A finite certificate must encode the complete row provenance. Equal blockers alone supply one row equality, not equality of the other post-deletion supports.

**Immediate consumer.** The first-fiber collision dispatcher and a likely source for the common six-center theorem needed by G1 and H1.

**Status.** [OPEN]

#### 16.5.G `TwoSourceClosure.lean` - one reachable leaf

##### 16.5.G1 - The acyclic hard residual for a fresh point outside the first blocker fiber

**Declaration.** `false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual`

**Source and role.** `TwoSourceClosure.lean`, approximately lines 3100-3131. Its input `FreshThirdAcyclicHardResidual` is a three-way disjunction of provenance-rich constructors.

**Atomic contract.** Prove `False` for each of: an aligned retained packet with mutual first-fiber residual, an aligned retained packet with a one-sided six-center fixed-triple boundary, or an independent common-radius surface with the same six-center audit boundary.

**Data already proved upstream.** The common-radius mutual-incidence arm is already closed. Each remaining constructor retains exact sources, prescribed deletions, aligned or independent radius surfaces, and a six-center boundary. The disjunction is exhaustive for the acyclic path.

**Exact missing implication.** The missing implication is not one monolithic local lemma; it is a common global certificate that can consume all three source-provenance constructors without flattening them.

**Candidate closure program.**

1. Split `FreshThirdAcyclicHardResidual` into three theorem declarations with no nested disjunctions.

2. Normalize each constructor to a shared `SixCenterDeletionOrderPacket` containing the exact rows common to all three and an indexed field for the constructor-specific surface.

3. Prove a single global theorem on that packet: either a cross-blocker coincidence, a complete exact-row collision packet, or a strict orientation cycle occurs.

4. Route those terminals to H1, F1, or the TriApex generic orientation theorem. Ensure the dispatcher has no fallback to this original open theorem.


**Known limits and rejection tests.** Flattening the three constructors to only their common local incidences would recreate the information-loss problem identified in the B-family audit. The word 'acyclic' is a branch label, not a proof that a graph-theoretic acyclicity contradiction is available.

**Immediate consumer.** The top-level two-source fresh-outside-first-fiber closure. A well-designed six-center packet here could collapse several leaves at once.

**Status.** [OPEN]

#### 16.5.H `TwoSourceCanonicalSurface.lean` - one reachable leaf

##### 16.5.H1 - Cross-blocker coincidence against a geometric multiplicity residual

**Declaration.** `TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`

**Source and role.** `TwoSourceCanonicalSurface.lean`, approximately lines 92-102. The theorem combines one of four cross-blocker equalities with one of three geometric-multiplicity residuals, for twelve atomic products.

**Atomic contract.** From `CrossBlockerCoincidence P P_rho` and `GeometricMultiplicityResidual P P_rho`, together with the inherited minimal non-`IsM44` and tri-apex context, derive `False`.

**Data already proved upstream.** The packet retains two localized omission cycles, exact source/blocker identities, cap positions, and the multiplicity alternative. A cross-blocker equality is stronger than an anonymous blocker collision but often points away from the desired cross hit rather than directly creating it.

**Exact missing implication.** The missing theorem is a global exclusion of the twelve equality-by-multiplicity combinations.

**Candidate closure program.**

1. Expand the product into twelve named branch packets and generate a fact table for each: row equalities, forced support members, cap positions, and known omissions.

2. Search for a common invariant. The strongest candidates are a three-source common canonical row, a blocker center forced onto a source-pair perpendicular bisector already containing two carrier centers, or an orientation cycle across the two localized omission systems.

3. Prove the invariant as one theorem on an indexed branch type, with separate adapters for the twelve products. This keeps the exhaustive split mechanical while concentrating the mathematics.

4. When a branch produces a six-center exact-row packet rather than an immediate contradiction, forward it to the shared theorem proposed for F1/G1 instead of adding another leaf.


**Known limits and rejection tests.** Cross-blocker equality does not imply cross membership. Pairwise circle intersection bounds alone allow the documented partial shell configurations. Every branch must use the geometric-multiplicity alternative and the global cap/order context.

**Immediate consumer.** The nested `TwoSourceExactCollisionRowsTerminal` closure and one of six leaves in that namespace reported by the built spine.

**Status.** [OPEN]

#### 16.5.I `TwoDeletionCollision.lean` - three reachable leaves

These are the current descendants of the historical B1/B2/B3 family. They are best understood as one missing positive producer and two branch-specific global contradictions. Earlier proposed local proofs were rejected because they either reversed an implication or assumed circle data not present in the contract.

##### 16.5.I1 - B1 global transport must produce a terminal

**Declaration.** `b1_globalGapOrClosedTerminal_of_counterexample`

**Source and role.** `TwoDeletionCollision.lean`, approximately lines 133-143 in the current source lineage. The theorem has the form `B1GlobalTransportContext -> B1GlobalGapOrClosedTerminal`.

**Atomic contract.** From the full B1 counterexample transport context, positively produce at least one of three terminal arms: a third bisector carrier, a blocker fiber of cardinality at least three, or an admissible escape whose overlap has cardinality at least three.

**Data already proved upstream.** Every terminal arm already has a source-clean contradiction consumer. The context retains the relevant two-deletion sources, canonical rows, escape data, and global minimality/cap structure. Existing local escape analysis proves an overlap upper bound of two in a particular small-overlap branch.

**Exact missing implication.** The missing theorem is the producer `Context -> Terminal`. Proving `Terminal -> False` again, or proving a terminal's negation in one subcase, does not fill this gap.

**Candidate closure program.**

1. Express the negation of all three terminal arms as exact upper bounds and absence statements on the all-blockers incidence structure.

2. Under those negations, construct an injective transport from every eligible source or escape to a blocker/row slot. Use the global cover and cap partition to show the target has too few slots; this is the intended Hall-defect or pigeonhole step.

3. If cardinality alone is insufficient, refine slots by boundary intervals and prove that two sources assigned to the same interval create a third bisector carrier or a large blocker fiber.

4. State the result directly as `Terminal` or `False`; do not route through a fictitious overlap lower bound unless that bound is actually derived from the global context.


**Known limits and rejection tests.** The available theorem `overlap <= 2` cannot supply `overlap >= 3`. Contraposing an existing terminal consumer is invalid constructively and classically unless the exact logical hypotheses match, and even then yields only the negation of its premises. The B1 local packet alone has not been shown contradictory.

**Immediate consumer.** The B1 two-deletion coordinator. This is a producer gap and should be attacked with a global transport/counting theorem, not another local geometry consumer.

**Status.** [OPEN]

##### 16.5.I2 - Four-center common deletion with a blocker collision

**Declaration.** `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`

**Source and role.** `TwoDeletionCollision.lean`, approximately lines 637-684 in the inspected source lineage. The collision disjunction identifies the first prescribed deletion with the blocker of `u`, the blocker of `v`, or the blocker of the second deleted source.

**Atomic contract.** Under the original unique-four residual, cardinality at least twelve, robust surface, positive physical class of size at least five, mutual omission, two distinct prescribed deletions, blocker distinctness, and a four-center common-deletion packet, derive `False` in each blocker-collision branch.

**Data already proved upstream.** Each collision branch has a deterministic exact forward row and a branch-specific mutual-omission orientation. The common-deletion packet retains exact survival data. The current flat disjunction obscures which row and which omitted source belong to the selected equality.

**Scope correction after the common-deletion analysis.** I2 is not a direct application of the robust-apex tetrahedron theorem. A blocker equality is not a missing row incidence, and the branch does not initially provide the three exact rows and three seed incidences needed for a tetrahedron continuation. Section 16.5.38 contributes only the basic rule that a proved omission yields a source-exact survival packet.

**Exact missing implication.** Three typed collision branches remain. Each must combine its equality with its exact forward row, paired omissions, and cap/source provenance to produce a row collision, a forbidden blocker two-cycle, or a strict orientation contradiction.

**Candidate closure program.**

1. Replace the nested disjunction by typed branches `U`, `V`, and `S`; attach the exact row and the exact omitted points to each constructor.

2. Apply the canonical deletion calculus to every branch-proved omission. Do not attempt positive incidence completion.

3. Search for a three-row tetrahedron seed only after the branch has independently produced all three exact rows and the necessary anchor incidences. When such a seed exists, call Section 16.5.38; otherwise stay in the collision-specific theorem.

4. The terminal alternatives are: a third common point of two distinct rows, a center in its own positive-radius row, a source-faithful blocker two-cycle with a strict cap potential, or a branch-specific finite certificate.

**Known limits and rejection tests.** The equality `deleted=center` is not itself impossible. The rejected four-point-intersection narrative conflicts with live omissions. Support equality requires a uniqueness theorem; radius equality requires a named shared point. The collision branches may not be merged before their omission orientations are retained.

**Immediate consumer.** The blocker-collision side of the two-deletion coordinator.

**Status.** [OPEN: three typed collision certificates; only elementary common-deletion adapters are closed]

##### 16.5.I3 - Four-center common deletion with one survival-square alternative

**Declaration.** `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare`

**Source and role.** `TwoDeletionCollision.lean`, approximately lines 688-782 in the inspected source lineage. The `hsquare` input is a disjunction of four alternatives, each containing two K4-survival assertions for one selected role.

**Atomic contract.** For each selected role—physical apex, blocker of `u`, blocker of `v`, or blocker of the second deleted source—use the pair of deletion survivals and the full mutual-omission/common-deletion context to derive `False`.

**Data already proved upstream.** A chosen arm has one exact forward row already present in its source packet. Its reverse survival can be normalized to an exact row in the reverse-erased carrier. The two radii and supports remain independent until separately identified.

**Scope correction after the common-deletion analysis.** I3 is also not a direct application of Section 16.5.38. The hypothesis is one of four bidirectional survival pairs, not a simultaneous three-row tetrahedron seed. The common-deletion calculus can normalize each survival and export omissions at nonrobust centers, but it does not synchronize supports or produce the five cross-incidences.

**Exact missing implication.** Four role-specific survival-pair theorems remain. Each must use its exact forward row, normalized reverse row, mutual-omission orientation, and global cap/source provenance.

**Candidate closure program.**

1. Replace the disjunction by four typed `NormalizedSurvivalPair` constructors. Name both deleted sources, both centers, both positive radii, both exact supports, and every support inclusion.

2. At nonrobust centers, canonicalize the support and convert survival to exact omission. At robust centers, retain a five-class or second-radius certificate.

3. Test whether a branch now contains a genuine three-row tetrahedron seed. Only those subbranches may call Section 16.5.38, and the resulting conclusion is a continuation packet rather than immediate `False`.

4. For the remaining subbranches, prove a branch-specific two-cycle, intersection, or strict cap-order certificate. Keep independent radii independent.

**Known limits and rejection tests.** Four roles are alternatives, not simultaneous centers. Two survivals may use different radii and supports. The documented partial shell witness blocks a contradiction based only on two local survivals and strict convexity. No generic “survival square” geometry is presently justified.

**Immediate consumer.** The survival side of the two-deletion coordinator.

**Status.** [OPEN: four normalized survival-pair certificates; not closed by tetrahedron continuation]

#### 16.5.37 Shared closure lemmas suggested by the leaf ledger

The thirty-six leaves do not appear to require thirty-six unrelated discoveries. The ledger now exposes seven reusable theorem families. One of them—the robust-apex tetrahedron-or-continuation theorem—has a complete prose proof in Section 16.5.38. The remaining six are research targets.

1. **Common-circle strict-arc blocker-cycle theorem.** Convert equal-distance rows whose centers and support pairs lie on one physical circle into oriented arc-midpoint relations. A closed strict midpoint cycle would discharge A1 and parts of B2-B5, and would provide the physical-placement side of C1.

2. **Robust-apex tetrahedron-or-common-deletion continuation theorem.** Three exact rows around a fully deletion-robust apex cannot realize the complete planar tetrahedron incidence pattern. Every missing incidence canonically produces a tagged common-deletion packet. This theorem is proved in Section 16.5.38. For A7 and A8 it remains the correct generic reduction. A5 now has a stronger source-specific analysis: A5.9-A5.12 show that the five-incidence hypothesis is redundant, exclude `d=xv`, and close the entire `d=xu` role family by strict-cap betweenness.

3. **Two-row retained-omission common-deletion cycle theorem.** Starting from one source-exact common-deletion packet in the tri-apex all-large context, prove a new cross hit, a forbidden repeated packet, or strict advance of a finite cap-order potential. This is the proper common engine for D8.

4. **Typed collision and bidirectional-survival theorems.** Normalize the three I2 collision branches and the four I3 survival roles separately. A branch may call the tetrahedron theorem only after it has actually produced the required third row and anchor incidences.

5. **Two-radius convex-order theorem.** Combine concentric exact-four classes with reflected-pair or cap-span data to prove an exposed-vertex obstruction. D2 supplies the strongest contract; C3 should be reduced to it only after the missing grid identities are produced.

6. **Source-faithful six-center orientation theorem.** Normalize the F1, G1, H1, and fresh-third packets into exact rows with branch tags, then prove a cross-blocker, row-collision, or strict cyclic-potential terminal. This theorem must retain source and prescribed-deletion provenance.

7. **Unbounded cap-weighted blocker inequality or bounded-obstruction theorem.** A3 cannot be closed by finite endpoint enumeration alone. A scalable theorem must either contradict the all-blockers cover using convex boundary intervals or prove that every unbounded residual contains a bounded forbidden packet without deleting arbitrary carrier points.

The revised proof-discovery order is: finish A5's twenty-four-cell coverage after the strict-cap proof has removed the `Bxu` family; seek a strict potential for the unbounded A7/A8 continuation families; develop D8's two-row cycle theorem separately; then return to the two-radius, six-center, and unbounded global routes.

**Status:** [ONE SHARED THEOREM PROVED IN PROSE; SIX RESEARCH FAMILIES OPEN]

#### 16.5.38 Canonical common-deletion calculus and the robust-apex tetrahedron continuation theorem

This section replaces the earlier, overstrong “incidence-completion” target. The direction of implication matters. A deletion-survival witness naturally proves that a deleted point is absent from a critical exact row, or that the center has a second heavy radius. It does not force a positive cross-incidence. The valid reusable theorem is therefore a **tetrahedron-or-continuation theorem**: the complete incidence pattern is impossible, and every absent incidence creates a new source-exact common-deletion packet.

##### CD0. Exact rows and local survival

For a finite carrier `A`, write

\[
\operatorname{ExactRow}_A(c,R)
\]

when `R ⊆ A`, `|R|=4`, and there is a radius `r>0` such that every point of `R` is at distance `r` from `c`.

Write

\[
\operatorname{Survives}_A(z;c)
\]

when the erased carrier `A-z` still has four equidistant points at center `c`. The center itself need not belong to `A-z`; only the four support points must.

In a minimal no-removable configuration with a chosen actual blocker map `β`, a **source-exact common-deletion witness**

\[
\operatorname{CD}_A(z;p,q)
\]

records:

1. `z,p,q ∈ A` and `p ≠ q`;
2. `Survives_A(z;p)` and `Survives_A(z;q)`;
3. `β(z) ≠ p` and `β(z) ≠ q`; and
4. exact four-point supports for both survivals in `A-z`.

This is the semantic content needed from a `CommonDeletionTwoCenterPacket`; the present prose theorem does not depend on the current Lean structure boundary.

**Status:** [DEFINITIONAL REFORMULATION]

##### CD1. Exact-row persistence under an omitted deletion

If `ExactRow_A(c,R)` and `z ∉ R`, then

\[
\operatorname{Survives}_A(z;c).
\tag{CD1}
\]

**Proof.** Since `R ⊆ A` and `z ∉ R`, one also has `R ⊆ A-z`. Its four points remain at the same positive radius from `c`. Thus `R` itself witnesses survival. QED.

**Status:** [PROVED]

##### CD2. A positive-radius row omits its center

If `ExactRow_A(c,R)`, then `c ∉ R`.

**Proof.** Every member of `R` is at a positive distance from `c`, whereas `dist(c,c)=0`. QED.

**Status:** [PROVED]

##### CD3. Survival excludes the actual blocker

Assume `β(z)` is chosen so that deletion of `z` destroys K4 at `β(z)`. If `Survives_A(z;c)`, then

\[
\beta(z)\ne c.
\tag{CD3}
\]

**Proof.** Equality would say that deletion of `z` both destroys and preserves K4 at the same center. QED.

**Status:** [PROVED from blocker semantics]

##### CD4. Two omitted exact rows produce a common-deletion witness

Suppose `p≠q`, `ExactRow_A(p,Rp)`, `ExactRow_A(q,Rq)`, and

\[
z\notin R_p\cup R_q.
\]

Then `CD_A(z;p,q)`.

**Proof.** CD1 gives survival at both centers. CD3 gives both actual-blocker inequalities. The unchanged rows `Rp` and `Rq` are exact four-point supports in the erased carrier. QED.

**Status:** [PROVED]

##### CD5. A robust center paired with one omitted row

Call `O` **fully deletion-robust** when

\[
\forall z\in A,
\quad \operatorname{Survives}_A(z;O).
\]

If `O` is fully deletion-robust, `O≠c`, `ExactRow_A(c,R)`, and `z∉R`, then

\[
\operatorname{CD}_A(z;O,c).
\tag{CD5}
\]

**Proof.** Robustness gives survival at `O`; CD1 gives survival at `c`; CD3 gives the blocker inequalities; exact supports may be retained or extracted from the two survival witnesses. QED.

**Status:** [PROVED]

##### CD6. The saturated three-row pattern is a planar tetrahedron

Let `B0,B1,B2` be exact rows centered at `O,c1,c2`, respectively. Let `a` be a carrier point. Assume the eight incidences

\[
\begin{aligned}
&a,c_1\in B_0,\\
&O,a,c_2\in B_1,\\
&O,c_1,a\in B_2.
\end{aligned}
\tag{CD6.1}
\]

Then `O,c1,c2,a` are four distinct pairwise equidistant points.

**Proof.** Let the positive row radii be `r0,r1,r2`. From `a,c1∈B0`,

\[
\operatorname{dist}(O,a)=r_0=
\operatorname{dist}(O,c_1).
\]

From `O,a,c2∈B1`,

\[
\operatorname{dist}(c_1,O)=r_1=
\operatorname{dist}(c_1,a)=
\operatorname{dist}(c_1,c_2).
\]

Distance symmetry gives `r1=r0`. From `O,c1,a∈B2`,

\[
\operatorname{dist}(c_2,O)=r_2=
\operatorname{dist}(c_2,c_1)=
\operatorname{dist}(c_2,a).
\]

Since `dist(c2,c1)=dist(c1,c2)=r0`, one has `r2=r0`. Hence every one of the six pairwise distances among `O,c1,c2,a` equals the same positive number `r0`. Positive row radii also make all four points distinct.

Four pairwise equidistant points cannot lie in the Euclidean plane. Equivalently, three of them form an equilateral triangle and there is no planar point at the same edge distance from all three vertices. This is precisely the repository's proved three-exact-classes tetrahedron incompatibility. QED.

**Status:** [PROVED]

##### CD7. Robust-apex tetrahedron-or-common-deletion continuation

Assume:

1. `O` is fully deletion-robust;
2. `B0,B1,B2` are exact rows centered at pairwise distinct centers `O,c1,c2`;
3. `a∈B0`; and
4. all named points belong to `A`.

Then at least one of the following seven tagged continuation witnesses exists:

| Tag | Missing incidence | Common deletion produced |
|---|---|---|
| `T0` | `c1 ∉ B0` | `CD_A(c1; O,c1)` |
| `T1` | `O ∉ B1` | `CD_A(O; O,c1)` |
| `T2` | `a ∉ B1` | `CD_A(a; O,c1)` |
| `T3` | `c2 ∉ B1` | `CD_A(c2; O,c1)` |
| `T4` | `O ∉ B2` | `CD_A(O; O,c2)` |
| `T5` | `c1 ∉ B2` | `CD_A(c1; O,c2)` |
| `T6` | `a ∉ B2` | `CD_A(a; O,c2)` |

**Proof.** Suppose none of the seven tags holds. Then all seven listed incidences are present. Together with the assumed `a∈B0`, these are exactly the eight incidences (CD6.1), contradicting CD6.

It remains to construct the advertised packet in each missing-incidence branch.

- In `T0`, the exact row `B0` omits `c1`; the exact row `B1` also omits `c1` by CD2 because it is centered at `c1`. CD4 gives `CD_A(c1;O,c1)`.
- In `T1`, robustness gives survival at `O` after deleting `O`, while `O∉B1` and CD1 give survival at `c1`. CD5 gives `CD_A(O;O,c1)`.
- The proofs of `T2` and `T3` are identical, deleting `a` and `c2`, respectively.
- The proofs of `T4`, `T5`, and `T6` use the exact row `B2` and CD5 in the same way.

Thus saturation is impossible and every failure of saturation has a canonical source-exact continuation. The `T0` packet is degenerate in the following precise sense: because `B1` is centered at `c1` and `O` is fully robust, `CD_A(c1;O,c1)` exists even without the missing incidence `c1∉B0`. The `T0` tag is still a valid branch label, but its packet should not be counted as new progress. QED.

**Status:** [DERIVED AND PROVED IN PROSE; T0 DEGENERACY RECORDED]

##### CD8. Why this is not positive incidence completion

CD7 proves

\[
\text{not saturated}
\quad\Longrightarrow\quad
\text{typed common-deletion continuation}.
\]

It does **not** prove that the seven incidences hold, nor that a continuation packet is contradictory. This direction is forced by the semantics: survival after deleting `z` is naturally witnessed when `z` is absent from an exact row. The missing incidence is therefore useful negative information, not a defect to be filled by fiat.

A generic positive-incidence theorem would be false without additional global hypotheses. Exact rows and common-deletion packets can occur in realizable local configurations. The remaining proof must consume cap order, exact cardinality, retained source provenance, or another global invariant.

**Status:** [PROVED SCOPE BOUNDARY]

##### CD9. Specialization to A5

Use

\[
(B_0,B_1,B_2;O,c_1,c_2,a)
=(BO,K_c,K_{xv};O,d,c,u).
\]

The branch already supplies `u∈BO`, `c∈Kc`, and `u∈Kxv`, so the generic theorem still produces the five missing-incidence positions formerly used by A5. However, the source-specific information is strictly stronger. A5.9 proves `d≠xv`, A5.10 shows that `u∈Kc`, `d∈BO`, and `d∈Kxv` are already incompatible, and A5.11 replaces the missing-incidence tags by the disjoint role families `U`, `Bxu`, `Boff`, `Xt`, and `Xv`. A5.12 then refutes `Bxu` outright. Consequently CD7 is a valid generic adapter, but it is no longer the preferred A5 dispatcher.

**Status:** [DERIVED; GENERIC REDUCTION SUPERSEDED BY THE STRONGER A5 ROLE SPLIT]

##### CD10. Specialization to A7

Use

\[
(B_0,B_1,B_2;O,c_1,c_2,a)
=(BO,K_{xu},K_{deleted};O,c_{xu},c_d,deleted).
\]

The fixed physical pair supplies `deleted` in all three seed rows, eliminating `T2` and `T6`; the remaining five tags are exactly the five missing incidences in A7.

**Status:** [DERIVED; canonical reduction complete]

##### CD11. Specialization to A8

Use

\[
(B_0,B_1,B_2;O,c_1,c_2,a)
=(BO,K_1,K_2;O,c_1,c_2,u).
\]

Failure after deleting `u` identifies `u` in both canonical rows, while the physical packet gives `u∈BO`. Again `T2` and `T6` are eliminated and the five remaining tags are exactly A8's missing-incidence split.

**Status:** [DERIVED; canonical reduction complete]

##### CD12. The three residual continuation theorems

After CD7, the former common-deletion incidence-completion target has separated into three honest geometric obligations:

1. **Exact-twelve twenty-four-cell coverage.** In A5's full `(5,4,6)` packet, the `Bxu` family is already impossible. Refute the four surviving role families `U`, `Boff`, `Xt`, and `Xv`, each crossed with the six source-authenticated deletion clauses. The `U` family has an exact-eleven five-row normal form; `Boff` is an off-class bisector-localization problem; and `Xt`,`Xv` are named five-point circle-isosceles chains.
2. **Unbounded `u`-deletion continuation exclusion.** In A7's source-heavy rigid packet, refute the five tagged continuations by a cap-order potential or a scalable blocker inequality.
3. **Failed-then-surviving continuation exclusion.** In A8, combine the five tags with the exact multiplicity drops at `c1,c2` and the omission of `xv` from both canonical rows.

These are smaller than the original leaves and preserve the exact source and row responsible for every continuation. They should be stated as three dispatchers over one shared tag type, not as another five opaque `False` declarations per leaf.

**Status:** [OPEN GEOMETRIC TERMINALS; canonical logic closed]

##### CD13. Non-applications: D8, I2, and I3

The shared theorem originally proposed for A5, A7, A8, D8, I2, and I3 was too broad.

- **D8** does not directly instantiate CD6.  Its frontier-radius intersection
  bound nevertheless forces `Q.J` out of the reverse shell and hence produces
  a third source-exact packet.  The resulting object is a directed
  three-source omission cycle, not CD6's three-row positive-incidence seed;
  it therefore still needs its own cap/order terminal.
- **I2** begins with blocker equalities, not missing tetrahedron incidences. A three-row seed must first be derived branch by branch.
- **I3** supplies one of four pairs of survival assertions. The rows, radii, and supports are not simultaneous or synchronized.

All three may reuse CD1-CD5. None is closed by CD7 without additional branch-specific geometry.

**Status:** [PROVED SCOPE CLASSIFICATION]

### 16.6 New prose-derived adapters

- semantic blocker iff canonical unique-four membership;
- semantic blocker iff multiplicity drops from four to three;
- removable iff no canonical blocker;
- exact all-blocker incidence identity;
- canonical row injectivity;
- pair-codegree at most two;
- forced directed cycle on unique-four centers;
- exact-row persistence under omitted deletion;
- robust-apex tetrahedron-or-common-deletion continuation.
- exact-twelve three-row noncoverage: a point outside the physical class is omitted by all three concrete rows, so its blocker differs from all three row centers.

**Status:** [DERIVED; suitable for standalone Lean declarations]

---

## 17. Theorem-to-source crosswalk

- **A4, D2** — `P97/UniversalProblem97.lean`
- **A5, D0** — `P97/SmallerCounterexample.lean`
- **D1, D3** — `P97/Descent.lean`
- **L2, L5-L10, E0-E5** — `P97/RemovableVertexAxiom/Base.lean`, `Continuation.lean`, and deletion helpers
- **B5-B12, I0-I7** — `P97/ATail/MinimalUniqueFourCover.lean`
- **P0-P1** — `P97/PinnedMultiplicity.lean`
- **Deletion robustness** — `P97/ATail/DeletionRobustness.lean`
- **M0-M15** — `P97/CapBridgeFromK4.lean` and `P97/Cap/PartitionFromMEC.lean`
- **Q0-Q17** — `P97/RemovableVertexAxiom/Continuation.lean`, plus pinned-surplus and certificate imports
- **N0-N9** — `P97/RemovableVertexAxiom/Continuation.lean`, `P97/ATail/FiniteN11Frontier.lean`, and `P97/ATail/FrontierLiveClosure/`
- **16.5.A1-A8** — `P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`
- **16.5.B1-B5** — `P97/ATail/FrontierLiveClosure/Rigid221Placement.lean`
- **16.5.C1-C5** — `P97/ATail/FrontierLiveClosure/Rigid221Closure.lean`
- **16.5.D1-D9** — `P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean`
- **16.5.E1-E3** — `P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`
- **16.5.F1** — `P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean`
- **16.5.G1** — `P97/ATail/FrontierLiveClosure/TwoSourceClosure.lean`
- **16.5.H1** — `P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean`
- **16.5.I1-I3** — `P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean`
- **Final composition** — `P97/RemovableVertexAxiom/RemovableVertexOfLarge.lean`
- **Current frontier measurement and off-spine exclusions** — repository `README.md`, proof-status section

---

# Appendix A. Exact rational local B2 stress model

The following eight rational points are in strict convex position:

```text
z1 = (-1, 0)
x  = (1, 0)
c1 = (-16/65, -63/65)
c2 = (8/17, -15/17)
c3 = (3/5, -4/5)
r1 = (-33/17, 30/17)
r2 = (-59/85, 168/85)
r3 = (-1, 2)
```

The five points `z1,x,c1,c2,c3` lie on the unit circle centered at the origin. The four points `x,r1,r2,r3` lie on the radius-two circle centered at `z1=(-1,0)`. The two selected point sets meet only at `x`.

One strict hull order is

```text
r1 -> z1 -> c1 -> c2 -> c3 -> x -> r2 -> r3.
```

The eight consecutive orientation determinants are

```text
462/1105, 168/221, 264/5525, 6/85,
912/425, 48/85, 8/85, 32/17.
```

All are positive. This model refutes only the proposed local implication; it does not satisfy the full counterexample or minimality hypotheses.

---

# Appendix B. Adversarial checklist for every proposed terminal lemma

Before a new geometric statement is accepted into the prose proof or Lean implementation, verify all of the following.

1. **Quantifiers.** Is the hypothesis one simultaneous configuration or a disjunction of alternatives?
2. **Radius identity.** Are two existentially chosen radii actually proved equal before they are compared?
3. **Support identity.** Are selected four-point supports canonical at their centers, or merely arbitrary witnesses?
4. **Source identity.** Is the deleted point named and preserved through every adapter?
5. **Blocker provenance.** Is the center the blocker of the intended source, not an anonymous center obtained later?
6. **Distinctness.** Are all center/source and center/center inequalities explicitly available?
7. **Cap location.** Does every claimed cap-interior or endpoint fact have a producer?
8. **Cyclic order.** Does a crossing or orientation conclusion have an actual order hypothesis?
9. **Partial witnesses.** Does the theorem accidentally contradict the exact eight- or eleven-point partial models?
10. **Unboundedness.** If the theorem is fixed-cardinality, what transfers it to every larger cardinality?
11. **Dependency closure.** Does the final declaration avoid `sorryAx` transitively, not merely in its own file?
12. **Trust boundary.** Are any `native_decide` or external certificates declared and audited under project policy?

---

# Appendix C. Final research conclusion

The prose proof is complete through all elementary deletion logic, pinned-multiplicity semantics, canonical blocker extraction, minimum-enclosing-circle packet construction, and the certified `IsM44` branch. Atomizing these steps reveals that the remaining difficulty is not another hidden finite-set manipulation. It is one global geometric-combinatorial theorem.

The strongest clean reformulation is:

> In a minimal non-`IsM44` configuration, the canonical four-point rows of all unique-four centers cover the carrier, omit their own centers, meet pairwise in at most two points, and interact with a three-cap convex order. Prove that no such Euclidean configuration exists.

The cover, multiplicity, circle-intersection, pair-codegree, and directed-cycle consequences alone do not prove this. A closing argument must use cap order or another global orientation invariant in a way that the known local partial witnesses do not satisfy.

That statement is the exact frontier of the current prose proof.

---

## Source notes

- **[R1]** Repository `README.md`, current proof-status and frontier sections, inspected 19 August 2026.
- **[R2]** `lean/Erdos9796Proof/P97/UniversalProblem97.lean`.
- **[R3]** `lean/Erdos9796Proof/P97/SmallerCounterexample.lean`.
- **[R4]** `lean/Erdos9796Proof/P97/Descent.lean`.
- **[R5]** `lean/Erdos9796Proof/P97/CapBridgeFromK4.lean`.
- **[R6]** `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean`.
- **[R7]** `lean/Erdos9796Proof/P97/RemovableVertexAxiom/Continuation.lean`.
- **[R8]** `lean/Erdos9796Proof/P97/RemovableVertexAxiom/RemovableVertexOfLarge.lean`.
- **[R9]** `lean/Erdos9796Proof/P97/ATail/DeletionRobustness.lean`.
- **[R10]** `lean/Erdos9796Proof/P97/ATail/MinimalUniqueFourCover.lean`.
- **[R11]** `lean/Erdos9796Proof/P97/PinnedMultiplicity.lean`.
- **[R12]** `2026-08-18-b-family-closure-plan-audited-expanded.md` and the exact rational stress-test artifact described there.
