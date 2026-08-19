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

```{=openxml}
<w:p><w:r><w:br w:type="page"/></w:r></w:p>
```

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

```{=openxml}
<w:p><w:r><w:br w:type="page"/></w:r></w:p>
```

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

### 16.5 Open theorem

- general non-`IsM44` contradiction above nine, outside the exact-cardinality-eleven branch.

**Status:** [OPEN; currently 36 reachable leaf theorems]

### 16.6 New prose-derived adapters

- semantic blocker iff canonical unique-four membership;
- semantic blocker iff multiplicity drops from four to three;
- removable iff no canonical blocker;
- exact all-blocker incidence identity;
- canonical row injectivity;
- pair-codegree at most two;
- forced directed cycle on unique-four centers.

**Status:** [DERIVED; suitable for standalone Lean declarations]

---

```{=openxml}
<w:p><w:r><w:br w:type="page"/></w:r></w:p>
```

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
- **Final composition** — `P97/RemovableVertexAxiom/RemovableVertexOfLarge.lean`
- **Current frontier measurement** — repository `README.md`, proof-status section

---

```{=openxml}
<w:p><w:r><w:br w:type="page"/></w:r></w:p>
```

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
