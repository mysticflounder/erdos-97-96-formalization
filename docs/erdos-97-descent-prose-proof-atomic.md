---
title: "The Erdős 97 Descent Argument"
subtitle: "Authoritative current atomic prose proof"
author: "Working proof manuscript"
date: "4 September 2026"
---

**Erdős Problem 97.** “Does every convex polygon have a vertex with no other 4 vertices equidistant from it?”

The question is quoted from the pinned `formal-conjectures` source,
`FormalConjectures/ErdosProblems/97.lean`, revision
`89a67be506fbae633d02941ccbd9f3737bbd5457`. The exact proposition targeted
by `Problem97.erdos97_rhs` is:

```text
∀ A : Finset ℝ², A.Nonempty → EuclideanGeometry.ConvexIndep (A : Set ℝ²) →
  ¬ Erdos97.HasNEquidistantProperty 4 A
```

The local statement uses the upstream predicates through
`P97/Foundation.lean`; `Problem97.upstream_iff` identifies the statement
types by `Iff.rfl`. The formal target has not been strengthened or weakened.
**The overall result is CONJECTURED / OPEN:** the general non-`IsM44`
contradiction remains unresolved, so neither Problem 97 nor Problem 96 is
proved by this development.

## 0. Authority, evidence, and navigation

This file is the **authoritative current mathematical narrative and obligation
summary** for the descent argument. Its current branch contracts are in §11,
its conditional conclusion in §12, its completion matrix in §13, and its
source crosswalk in §14. The elementary atomic argument in §§1–10 is retained
where it continues to apply.

Superseded contracts, retired obligations, old frontier counts, rejected
closure programs, and unintegrated research packages have been moved to the
[historical archive](archive/2026-09-04-atomic-prose-superseded.md). That
archive is not an assignment list or a status authority. Searches for active
obligations must exclude `docs/archive/**`. In particular, the archived
A/F/I research labels do not designate additional current Lean obligations.

**Reconciliation date:** 4 September 2026. **Source-review base:**
`e91a960183e6f9104d51b52cd5c2963ed9267d3a`. The checkout contains concurrent proof work. Source-backed
statements below identify their actual consumers; a helper or solver result
is not treated as an integrated closure merely because it exists on disk.
This documentation update does not claim a new Lean build or a new
publication audit.

The exact current Lean statement, its imported proof, its successful build,
and its transitive axiom closure determine what is formalized. The
`proof-blueprint` graph and `proof-status/` registry are machine evidence
only to the extent that their source and kernel indexes are fresh. A cached
count does not override a current source obligation. The project has no
approved custom axioms; `.blueprint.toml` separately approves
`Lean.ofReduceBool` and `Lean.trustCompiler` for the governed native
certificate route. These trust boundaries are stated separately below.

Status conventions for the retained atomic argument:

- **[PROVED] / [DERIVED]**: a PROVEN pen-and-paper step under its stated
  hypotheses. A source filename identifies an implementation; it does not
  by itself assert a fresh kernel audit of this checkout.
- **[CERTIFIED]**: a PROVEN Lean-formalized step using the project's approved
  native certificate trust where stated. The completion matrix identifies
  the relevant evidence and scope.
- **[OPEN]**: a CONJECTURED required conclusion, with `{{NEEDS_PROOF}}`.
  A conditional proof using such a conclusion does not prove Problem 97.
- **EMPIRICALLY VERIFIED**: finite computational evidence at the stated
  abstraction and size, with no claim of the ambient geometric theorem.

```text
Counting: every counterexample has at least 9 points             PROVEN
Exact 9-point endpoint is impossible                             PROVEN
For a minimal counterexample with more than 9 points:
  MEC geometry produces a surplus-cap packet                     PROVEN
  An IsM44 packet gives a removable vertex                       CERTIFIED
  No IsM44 packet: general A-tail contradiction                   OPEN
A removable vertex gives a smaller counterexample                PROVEN
Strong induction concludes, conditional on the open step         CONDITIONAL
```

All Lean paths below are relative to `lean/Erdos9796Proof/` unless stated
otherwise. Definitions A0–A6, deletion lemmas L0–L10, blocker lemmas B0–B12,
pinned-multiplicity lemmas P0–P5, incidence lemmas I0–I14, descent lemmas
D0–D3, MEC lemmas M0–M15, `IsM44` steps Q0–Q17, and non-`IsM44` steps
N0–N9 retain their identifiers. Retired branch labels live only in the archive.

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

Thus every positive-radius class at `p` in the erased carrier has cardinality at most three; conversely, these bounds exclude a K4 witness at `p`.

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

### B8. Exact semantic blocker characterization

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

### B10. Unblocked sources are exactly the removable vertices

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

### P4. Three mutually implying blocker descriptions

Assume `K4(A)` and `p∈A-x`. Each of the following three conditions implies the other two:

1. deletion of `x` destroys K4 at `p`;
2. `p` is a unique-four center and `x∈U_p`;
3. `MultiplicityBlocks_A(p,x)`.

**Proof.** B8 proves both (1) ⇒ (2) and (2) ⇒ (1). Under (2), the unique heavy class has cardinality four and becomes a three-point class after erasing `x`; every other class has cardinality at most three, so the two multiplicities are exactly four and three. Under (3), equation (4.1) says K4 fails after deletion, giving (1). QED.

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
|I|=4u
\quad\text{and}\quad
\sum_{x\in A}d(x)=4u.
\tag{5.1}
\]

**Proof.** Sum the exact row cardinality four over all centers, then count the same incidences by sources. QED.

**Status:** [DERIVED]

### I4. Cover bound

\[
n\le4u.
\tag{5.2}
\]

**Proof.** By I2, each source contributes at least one to the incidence sum. Hence

\[
n=\sum_{x\in A}1
\le\sum_{x\in A}d(x)
=4u.
\]

QED.

**Status:** [PROVED as `card_le_four_mul_uniqueFourCenters`]

### I5. Average blocker degree

\[
\frac1n\sum_{x\in A}d(x)=\frac{4u}{n}.
\]

Since `U⊆A`, one has `u≤n`; therefore the average blocker degree is at most four. Together with I2, some source has between one and four blockers.

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
6u\le2\binom n2=n(n-1).
\tag{5.4}
\]

**Status:** [DERIVED]

### I11. Shared-source second-moment inequality

Counting triples consisting of a source and two distinct blockers gives

\[
\sum_{x\in A}\binom{d(x)}2
=
\sum_{\{p,q\}\subseteq U}|R_p\cap R_q|
\le2\binomu2.
\tag{5.5}
\]

**Status:** [DERIVED]

### I12. Why the incidence inequalities do not contradict minimality

The bounds I4, I10, and I11 are compatible for every `n>9`. For example, I4 only forces `u≥n/4`, while I10 is a quadratic upper bound. Even the Cauchy lower bound on the left side of (5.5) is vacuous in the relevant range.

Abstract four-uniform covers also satisfy all these conditions. For `n=4u` with `u≥2`, partition the sources into disjoint blocks of four. Choose one center in the preceding block cyclically and assign each chosen center the next block as its row. The rows cover every source, omit their own centers, have pairwise intersection zero, and have pair codegree one. This abstract system is not asserted to be Euclidean; it proves that pure finite incidence data cannot be the terminal contradiction.

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

**Status:** [CERTIFIED; approved native certificate trust]

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

The current source obligations in §11 refine this theorem. Proving them all, proving `GlobalNonM44Contradiction` directly, or constructing a removable vertex under the same hypotheses would complete this step.

**Status:** [OPEN]

---

## 11. Current branch contracts and source obligations

The remaining work lies below
`ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap`.
Every required terminal conclusion below is `False` under its complete
inherited geometric and minimality hypotheses. A local row model or a finite
solver abstraction is not a counterexample to that complete statement.

### 11.1 Closed circle-wedge geometry

**PROVEN (Lean-formalized, core axioms).** The source-heavy pentagon packet
`Q : ExactFourRigid221PentagonBlockerVResidual P packet` is impossible.
Its five physical points are `u`, `xu`, `deleted`, `v`, and `xv`, on a
positive-radius class centered at the physical apex `O`. Put
`b := H.centerAt v`. The packet supplies the two physical points `v,xv`
on the row centered at `b`. Their cap placement localizes `b` and forces
the strict cap order

```text
u < v < b < xv < xu
```

or its reversal. The three equal-chord relations give parameters
`tx > 0`, `tv > 0`, and `T > 1/2` with

```text
xv - O = tx * ((u - O) + (xu - O)),
v  - O = tv * ((u - O) + (xv - O)),
b  - O = T  * ((v - O) + (xv - O)).
```

`A4GlobalCircleWedge.two_clearances_of_four_point_fan` proves that the
circle centered at `b` through `v` has strict clearance from both outer
wedge lines `O-u` and `xu-O`. The exact-four row centered at `b` has at
most two points in the closed second cap. Choose one of its outside-cap
points distinct from `O`. Global convex boundary order puts that point on
the forbidden side of at least one outer wedge line, whereas row-radius
equality puts it on the circle with the corresponding strict clearance.
`ExactA2CapMetric.false_of_clearance_and_outside_hit` gives the contradiction.

The source theorem is
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowCircleWedge`.
It assumes no carrier-cardinality bound. The live `pentagonBlockerV` parent
calls it directly. The companion deleted-row clearance theorem in
`A3GlobalCircleWedge` is also cardinality-free. Their focused builds,
core-only axiom walks, and independent reviews are recorded in the
[circle-wedge audit](audits/2026-08-28-rigid221-a3-global-circle-wedge.md).
These are closed subbranches; the sibling source-heavy configurations in
§11.2 remain unproved.

**PROVEN (Lean-formalized, bounded scope).** The exact-seventeen,
second-cap-nine, four-row exact-cover terminal is also available. Exact
cover places the opposite apex on one of four named rows and supplies an
outside support on the deleted-center row. Cyclic order and the common
physical circle yield the positive bisector-fan parameters. Three apex-row
positions contradict a positive inner product; the fourth contradicts chord
clearance. `ExactA2CapMetric.false_of_exactA2_boundary_data` and
`false_of_exactSeventeen_secondCapNine_exactCover` implement this argument.
The metric proof is core-only; the outer coordinator's unused-point arm
uses the approved native certificate trust. The
[bounded terminal audit](audits/2026-08-28-rigid221-exact-a2-skeptic.md)
records that distinction. No cardinality-seventeen restriction is imposed
on the separate circle-wedge theorem above.

### 11.2 Remaining source-heavy configurations

The physical five-class, named sources, canonical blockers, strict-cap
locations, and prescribed deletions remain part of every source-heavy
contract. The current `Rigid221SourceHeavy.lean` obligations are:

1. the pentagon blocker is the distinguished deleted point;
2. at exact cardinality twelve, the physical-radius common-deletion packet
   lacks the required incidence;
3. at exact cardinality twelve, the next row has only its prescribed physical
   hit;
4. deletion of `u` retains the fixed physical pair and an outside-three-rows
   configuration; and
5. deletion of `xv` yields the three-center missing-incidence configuration.

**CONJECTURED / OPEN.** Each terminal remains `sorry`-backed;
`{{NEEDS_PROOF}}`. Their exact declaration names are listed in §11.8.

**PROVEN (Lean-formalized, scoped reductions).** The current source also
excludes the exact-six boundary in the deleted-blocker arm, derives the
exact-seven normal form, splits the next `v`-row center, excludes certain
off-class positions, localizes the erased-class `xu` center, and exports and
normalizes the exact next row. The
[source-reduction audit](skeptic-Rigid221SourceHeavy-2026-09-04-2.md)
checks these statements and their core-only helper evidence. They do not
produce the missing terminal contradictions. In particular, the
next-row-only-hit branch still lacks the finite placement/realization data
and the `DimacsUnsatisfiable` premise needed by its candidate finite consumer.

### 11.3 Minimal-core and placement configurations

`Rigid221Placement.lean` retains five terminal contracts: the pairwise-distinct
radius minimal deletion core; the physical-apex/source-`u` branch whose
blocker is the deleted point; the source-row-heavy blocker-`v` branch; the
opposite-row-heavy blocker-in-`v`-row branch; and the sparse-row branch.
**CONJECTURED / OPEN:** all five conclusions require proof, as listed in
§11.8. A local equal-radius model is insufficient to refute or prove any
of these full minimality-and-cap statements.

The current B1 route also reaches the physical-class-five/six terminal in
`TwoDeletionCollision.lean`. Its complete geometric provenance is needed;
an abstract canonical-row pattern is not a replacement for that input.

**Current implementation work, not integrated closure.** The working tree
contains `B1FullGeometricCoupledSource.lean` and the
`B1ExactFiveSourceThirdRowIngress.lean` /
`B1ExactFiveSourceBlockerOutcome.lean` producers. They retain the escape
source, deletion survival at the named centers, omitted strict-cap peers,
mutually omitted sources, and blocker identities. At class size five they
retain the disjunction between a second joint deletion and a rigid `2+2`
partition. The newer source split distinguishes a second deletion, the
source-equals-`u` case, and a named third-row case.
These files and their B1 audits were untracked at this reconciliation and
are not proof dependencies of the committed aggregate. The proposed
`B1WinningLiveSliceSameBoundaryArc` premise still needs a producer; the
card-six winning-arc and escape-source-context premises are not supplied
by the existing cap-order alternatives. None of these helper developments
discharges the B1 terminal in §11.8.

### 11.4 The two-radius branch: exact twelve and larger carriers

The input consists of the original unique-four residual, the robust
post-card-eleven surface, two distinct positive radii at `S.oppApex2`, two
disjoint selected four-classes at those radii, and the assertion that no
positive-radius class at that apex has five points. These are concentric
rows, together with the full inherited K4, minimality, and cap geometry.

**PROVEN (Lean-formalized, approved native trust; exact cardinality twelve).**
`false_of_exactFourPostCardElevenTwoRadiusBranch` now splits on
`D.A.card = 12`. Its twelve-point arm applies
`DRExactTwelveTwoFamilyUnsat.false_of_twoRadiusBranch_exactTwelve_of_clausesUnsatisfiable`
to `DRExactTwelveTwoFamilyReplayIngress.clausesUnsatisfiable`.
The retained CNF replay, source ingress, build, and axiom evidence are in
the [replay provenance](audits/2026-09-02-dr-two-radius-p35-replay-provenance.json)
and [dated ingress binding](audits/2026-09-02-dr-two-radius-lean-ingress-binding.json).
The replay uses `Lean.ofReduceBool` and `Lean.trustCompiler`. The binding
records its own captured aggregate bytes; this documentation change does
not revalidate that older binding against later aggregate edits.

**CONJECTURED / OPEN.** The other arm is exactly
`false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`, with
`12 < D.A.card` and the same two-row and robust-surface data.
`{{NEEDS_PROOF}}`. This is the current larger-cardinality obligation;
the twelve-point replay does not discharge it.

The available `CardGeThirteenOutcomeDispatcher` constructs the applicable
row-overlap, uncovered-point, exact-thirteen tight-cover, or adjacent-cap-grid
outcome. The tight-cover case has the form

\[
A=\{z\}\mathbin{\dot\cup}C_0
 \mathbin{\dot\cup}C_1\mathbin{\dot\cup}K,
\qquad |C_0|=|C_1|=|K|=4.
\]

The disjoint cover is a case of the split, not an unconditional premise for
all carriers of size at least thirteen. The dispatcher stops at outcome
packets; importing it does not consume them in the larger-cardinality leaf.

**PROVEN (Lean-formalized, fixed cells only).** The
`CardGeThirteenTwoCanonicalK4FixedCell` result has an independent
[core-only audit](skeptic-CardGeThirteenTwoCanonicalK4FixedCell-2026-09-04.md).
The center-9 fixed-row cancellation result also has a checked finite endpoint.
The broad source packet does not yet supply all fixed-row, order, and coverage
premises needed to apply these cells. In particular, the current tight-cover
outcome does not itself produce `FixedFiveRows` for the center-9 consumer.

**EMPIRICALLY VERIFIED (specified finite abstractions).** The
[exact-thirteen computation audit](audits/2026-09-04-cardge13-exact13-tight-cover-qfnra-piqd.md)
records replayed SAT assignments in abstract Kalmanson-metric relaxations,
bounded planar QF_NRA runs returning `UNKNOWN`, and fixed-cell K4 exclusions.
The displayed rational local model fails global K4 at named centers, so it
is not a Problem 97 counterexample. These computations do not settle the
larger-cardinality leaf. The
[two-radius closure plan](plans/2026-09-01-dr-two-radius-branch-closure.md)
retains the general-carrier obligation.

### 11.5 Exact-five and the remaining Rigid221 closure contracts

The first-apex unique-radius splitter produces exact-four, exact-five with
distinct obstruction centers, or exact-five with a common obstruction
center. In the common-center arm,
`ExactFiveCommonAdaptiveReselection.nonempty_swapped_or_distinct` yields a
swapped exact-four residual or the distinct-center exact-five residual.
This is a reduction to existing consumers, not an independent contradiction.

For distinct centers, the current three-center normal form separates a fresh
deletion source from an exact-twelve tight physical cover. The tight physical
arm is discharged through the existing `Balanced555FiniteUnsat` finite
terminal, under the declared certificate trust. Its theorem
`false_of_exactFiveDistinct_threeCenter_exactTwelveTightPhysical` retains
`|A| = 12`, union cardinality eleven, equality between the erased carrier
and that union, omission of the retained source from the second selected
class, and the retained physical two-center packet. The
[tight-cover closure record](plans/2026-09-01-rigid221-exactfive-tight-cover.md)
gives the scope. Two fresh-source contracts remain:

- `false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`, retaining
  the three exact rows, the retained source's omission from the second row,
  and its physical two-center packet;
- `false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`,
  retaining the complete `RobustApexFourIncidenceContinuationPacket`.

**CONJECTURED / OPEN:** both fresh-source contradictions still contain
`sorry`; `{{NEEDS_PROOF}}`. Source separation such as
`fresh_not_mem_firstApexSelectedClass` is a useful proved restriction, not
a contradiction. The
[distinct-center plan](plans/2026-09-01-rigid221-exactfive-distinct-three-center.md)
covers this route.

The [three-fan source adapter](plans/2026-09-03-exactfive-three-fan-source-adapter.md),
[opposed-turn adapter](plans/2026-09-03-exactfive-opposed-turn-source-adapter.md),
and `ExactlyOneCrossAliasGeometry` lemmas supply conditional geometric
consumers. Their injective convex-order enumerations, signed turns, and
distance equalities still have to be produced from each applicable source
case. They do not replace the full five-incidence obligation with a fixed
solver profile.

The other current `Rigid221Closure.lean` terminals are the physical-apex
source-distinct-from-`u` case, the nonphysical equal-distance collision,
and the swapped protected exact-four outcome, in addition to the
larger-cardinality two-radius leaf in §11.4. Their exact names appear in
§11.8; all remain CONJECTURED / OPEN.

### 11.6 TriApex: exact fifteen and at least sixteen

The paired common-deletion route retains
`J : PairedApexClassJointDeletion O`, the full
`G : TriApexAllLargeContext D S`, and the
`TriApexFiveSurviveOneFail` witness supplied by
`triApexFiveSurviveOneFailOfApexRich`. Reverse hits already produce the
required paired packet. The two-radius-grid sibling is discharged by
`false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core`.

The radius provenance is part of this contract. `PairedApexClassJointDeletion`
does not assert that its `sourceRadius` equals the parent frontier radius.
The direct reverse-hit producer chooses that radius; the other-rich-radius
escape in `PairedCommonDeletionNormalForm` may use a different one. The
generic `PairedCommonDeletionProvenance` producer surface in
`JointDeletion/Producers.lean` is not consumed by the current TriApex route.
It supplies no additional terminal closure.

The current five-survive/one-fail coordinator is a source-clean size split.
Every closed cap has at least six points; the cap-sum identity is
`cap₀ + cap₁ + cap₂ = |A| + 3`. Hence `15 ≤ |A|`. At equality each closed
cap has six points and each strict cap interior has four points. The source
identifies the four-point supports with those interiors and supplies the
six-slot cap order and the two-radii/adjacent-mutual-omission-pair
alternative. These are exact-fifteen controls, not statements for every
larger carrier.

**CONJECTURED / OPEN.** The current terminal declarations are
`false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_card_eq_fifteen`
and
`false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_card_ge_sixteen`.
Both retain `J`, `G`, and the full witness `Q`; both still contain `sorry`.
The coordinator
`false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core`
calls these two children. Its source-clean body does not close either child.
`{{NEEDS_PROOF}}`. The
[TriApex closure plan](plans/2026-09-01-d1-triapex-paired-common-deletion-closure-plan.md)
provides the route's contract and producer discipline; exact current child
statements are in the source linked in §11.8.

### 11.7 TwoSource and two-deletion contracts

The current TwoSource route has four FreshThird terminal declarations:
aligned-retained first-non-hit; common-radius first-non-hit; equal-center
noncanonical interactions; and the pinned-endpoint outside-seed residual.
The equal-center declaration has two remaining proof holes in its coherent
subcases; its mixed subcases are discharged. The other TwoSource obligations
are the first-fiber outside-pair-deletion exact rows, the acyclic hard
residual, and cross-blocker coincidence.

The two-deletion route retains the physical-class-five/six B1 normal form,
four-center blocker coincidence, and the four-center survival square. The
prescribed deletions, actual blocker identities, selected rows, and
minimality hypotheses are part of these contracts. Global deletion survival
cannot be inferred from survival at only the displayed centers.

**CONJECTURED / OPEN.** These are the ten current source declarations in
the last five file groups of §11.8. Each needs a terminal proof;
`{{NEEDS_PROOF}}`. The unapplied preferred-choice FreshThird patch, intrinsic
two-root prose program, and physical-trace/fan research remain in the archive.
They are not additional current terminal contracts and do not discharge
the source declarations listed here.

### 11.8 Exact current source inventory

This table lists **theorem declarations containing `sorry`**, not individual
tactic holes, solver cells, or compatibility wrappers. It is a source
inventory, not a freshly kernel-mined publication count. Each declaration has a current source call path to an active aggregate
consumer. The generated graph currently reports stale symbols and labels
these declarations off-spine; that cached classification must not be read as
proof closure or as a replacement for the source call paths.
The old registry counts are not repeated here.

Each row has status **CONJECTURED / OPEN**, and retains every hypothesis in
its linked source declaration. Names in the first five groups are in
`Problem97.ATailFrontierLiveClosure`; the four TwoSource groups additionally
use the namespace `TwoSourceExactCollisionRowsTerminal`.

**Rigid221SourceHeavy.lean** — 5 declarations.

| Current terminal declaration | Source |
|---|---|
| `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted` | [Rigid221SourceHeavy:5039](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean#L5039) |
| `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius_commonDeletion_missingIncidence` | [Rigid221SourceHeavy:19068](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean#L19068) |
| `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_interiorDeletion_physicalRadius_nextRowOnlyHit` | [Rigid221SourceHeavy:19133](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean#L19133) |
| `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_uDeletion_fixedPhysicalPair_outsideThreeRows` | [Rigid221SourceHeavy:19699](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean#L19699) |
| `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_threeCenterDeletion_xv_missingIncidence` | [Rigid221SourceHeavy:19865](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean#L19865) |

**Rigid221Placement.lean** — 5 declarations.

| Current terminal declaration | Source |
|---|---|
| `false_of_exactFourMutualOmissionRigid221_minimalCore` | [Rigid221Placement:543](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean#L543) |
| `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted` | [Rigid221Placement:749](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean#L749) |
| `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy` | [Rigid221Placement:972](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean#L972) |
| `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_oppositeRowHeavy` | [Rigid221Placement:997](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean#L997) |
| `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_sparseRows` | [Rigid221Placement:1022](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean#L1022) |

**Rigid221Closure.lean** — 6 declarations.

| Current terminal declaration | Source |
|---|---|
| `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU` | [Rigid221Closure:63](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean#L63) |
| `false_of_exactFourMutualOmissionRigid221_nonphysicalCollision` | [Rigid221Closure:402](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean#L402) |
| `false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen` | [Rigid221Closure:1252](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean#L1252) |
| `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome` | [Rigid221Closure:1364](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean#L1364) |
| `false_of_exactFiveDistinct_threeCenter_distinctFresh_physical` | [Rigid221Closure:1533](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean#L1533) |
| `false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence` | [Rigid221Closure:1558](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean#L1558) |

**TriApexEndpointRetainedOmission.lean** — 2 declarations.

| Current terminal declaration | Source |
|---|---|
| `false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_card_eq_fifteen` | [TriApexEndpointRetainedOmission:2882](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean#L2882) |
| `false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_card_ge_sixteen` | [TriApexEndpointRetainedOmission:2948](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean#L2948) |

**TwoDeletionCollision.lean** — 3 declarations.

| Current terminal declaration | Source |
|---|---|
| `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence` | [TwoDeletionCollision:1380](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L1380) |
| `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare` | [TwoDeletionCollision:1454](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L1454) |
| `false_of_b1PhysicalClassFiveSixNormalForm` | [TwoDeletionCollision:1753](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L1753) |

**TwoSourceFreshThirdResidual.lean** — 4 declarations.

| Current terminal declaration | Source |
|---|---|
| `false_of_freshThird_firstNonHit_alignedRetained` | [TwoSourceFreshThirdResidual:3079](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean#L3079) |
| `false_of_freshThird_firstNonHit_commonRadius` | [TwoSourceFreshThirdResidual:3097](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean#L3097) |
| `false_of_freshThirdEqualCenter_noncanonicalInteractions` | [TwoSourceFreshThirdResidual:3347](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean#L3347) |
| `false_of_freshThird_pinnedEndpoint_outsideSeedResidual` | [TwoSourceFreshThirdResidual:9598](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean#L9598) |

**TwoSourceFirstFiberCollision.lean** — 1 declaration.

| Current terminal declaration | Source |
|---|---|
| `false_of_capSource_firstFiber_outsidePairDeletionExactRows` | [TwoSourceFirstFiberCollision:2652](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean#L2652) |

**TwoSourceClosure.lean** — 1 declaration.

| Current terminal declaration | Source |
|---|---|
| `false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual` | [TwoSourceClosure:3278](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceClosure.lean#L3278) |

**TwoSourceCanonicalSurface.lean** — 1 declaration.

| Current terminal declaration | Source |
|---|---|
| `false_of_crossBlockerCoincidence` | [TwoSourceCanonicalSurface:131](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean#L131) |

There are **28 source declarations in these nine modules** at this
reconciliation. The noncanonical-interactions declaration contains two
remaining `sorry` expressions and is counted once. Publication reachability
must be re-mined from matching built modules before reporting a kernel
frontier count.

---

## 12. Conditional complete proof of descent

This section states the complete argument with the exact open theorem isolated as a hypothesis.

### Theorem 12.1 - Conditional removable-vertex theorem

Let `A` be a nonempty convexly independent K4 set with `9<|A|`, and assume `(Min)`. Assume additionally `GlobalNonM44Contradiction`. Then `A` has a removable vertex.

**Proof.** By M0-M12, choose a surplus-cap packet on `A`. Split on (7.3).

If an `IsM44` packet exists, Q0-Q17 produce a removable point.

If no `IsM44` packet exists, construct `D` and `H` by N0-N5. `GlobalNonM44Contradiction` gives `False`. By contradiction elimination, the required existential removable-vertex statement follows.

Thus in either branch a removable vertex exists. QED.

**Status:** [PROVED conditional on one OPEN theorem]

### Theorem 12.2 - Descent

Assume `GlobalNonM44Contradiction` and the established surplus-packet and
`IsM44` branch results used in Theorem 12.1. No counterexample with more
than nine points can be minimal.

**Proof.** Apply Theorem 12.1 to obtain a removable point. D0 gives a strictly smaller counterexample. This contradicts `(Min)`. QED.

**Status:** [PROVED conditional]

### Theorem 12.3 - Universal Problem 97 statement

Assume the proved counting floor, the proved nine-point endpoint, and `GlobalNonM44Contradiction`. Then no finite nonempty convexly independent K4 set exists.

**Proof.** Apply D2 using Theorem 12.2 as the descent hypothesis. QED.

**Status:** [PROVED conditional]

### Corollary 12.4 - What a closure commit must accomplish

No change is required in `SmallerCounterexample.lean`, `Descent.lean`, or the strong-induction body. A valid closure commit must make one of the following true:

1. `ATailFrontierLiveClosure.false_of_twoLargeCaps_commonCriticalMap` becomes transitively free of `sorryAx`;
2. `removableVertexOfLarge_of_nonIsM44` is rewritten to call a different source-clean contradiction; or
3. `RemovableVertexOfLarge` is replaced by a direct theorem that avoids the current non-`IsM44` split.

Afterward, `#print axioms Problem97.erdos97_rhs` must contain no `sorryAx`.

---

## 13. Completion matrix

The table separates complete prose deductions, recorded Lean proofs, and
required conclusions that remain conjectural. Conditional statements are
proved only with their displayed hypotheses; they do not upgrade the final
unconditional theorem. The current source inventory in §11.8 is part of
this matrix: every one of its 28 named declarations appears as a separate
open entry there.

| Obligation | Rigor and scope | Status | Evidence |
|---|---|---|---|
| A0–A6: selected classes, K4, convex independence, counterexample, removability, minimality | Definitions, matching upstream vocabulary | Defined | §§1 and 14 |
| L0–L10: single-deletion class calculus and assembly of removability | PROVEN (pen-and-paper) | Done | §2; selected-class erase identities |
| B0–B12: exact failure, unique-four centers, canonical blocker relation, minimality cover | PROVEN (pen-and-paper) | Done | §3; `MinimalUniqueFourCover` |
| P0–P5: pinned multiplicity and its blocker interpretation | PROVEN (pen-and-paper) | Done | §4; `PinnedMultiplicity` |
| I0–I14: incidence counts, two-circle intersections, cycle and cover consequences | PROVEN (pen-and-paper, with explicit limits on the conclusions) | Done | §5 |
| D0 and D1: removable vertex gives a smaller counterexample and contradicts minimality | PROVEN (pen-and-paper) | Done | §6; `SmallerCounterexample`, `Descent` |
| Counting floor `9 ≤ \|A\|` | PROVEN (Lean-formalized, core axioms in the recorded audit) | Done | `Counting`; [recorded trust measurement](../README.md) |
| Exact-nine endpoint | PROVEN (Lean-formalized, core axioms in the recorded audit) | Done | `N9Endpoint/Closure`; [recorded trust measurement](../README.md) |
| D2–D3: strong-induction assembly from counting, endpoint, and descent | PROVEN (pen-and-paper, conditional) | Done as an implication | §6; `UniversalProblem97_of_reduction` |
| M0–M15: MEC support, Moser triangle, cap partition, surplus packet | PROVEN (pen-and-paper) | Done | §7; `CapBridgeFromK4`, `Cap/PartitionFromMEC` |
| E0–E5: erased-pin interfaces | PROVEN (pen-and-paper) | Done | §8 |
| Q0–Q17: removable vertex from an `IsM44` packet, including finite terminal inputs | PROVEN (Lean-formalized under approved native trust) | Done within that branch | §9; `RemovableVertexAxiom/Continuation` and its certificate consumers |
| N0–N6: counterexample-data and critical-shell construction | PROVEN (pen-and-paper) | Done | §10; `D.exists_criticalShellSystem_of_minimal` |
| N7: exact-eleven non-`IsM44` branch | PROVEN (Lean-formalized under approved native trust) | Done within that branch | `false_of_twoLargeCaps_commonCriticalMap_of_card_eq_eleven` |
| Circle-wedge pentagon contradiction, including the cardinality-free deleted-row continuation | PROVEN (Lean-formalized, core axioms) | Done within that branch | §11.1 and its independent audit |
| Exact-seventeen / second-cap-nine exact-cover terminal | PROVEN (Lean-formalized; outer unused-point arm uses approved native trust) | Done at the stated cardinalities | §11.1 and its bounded audit |
| Source-heavy cardinality, localization, and next-row reductions | PROVEN (Lean-formalized, scoped helper results) | Done as reductions | §11.2; terminal conclusions remain listed in §11.8 |
| Exact-twelve two-radius replay and geometric ingress | PROVEN (Lean-formalized under approved native trust; dated build/binding evidence) | Done for `\|A\| = 12` | §11.4; no claim of a newly refreshed binding |
| Larger-cardinality two-radius contradiction | CONJECTURED | Open | §11.4 and the exact source row in §11.8 |
| Exact-thirteen fixed-cell K4 exclusions | PROVEN (Lean-formalized, fixed cells only) | Done for their explicit inputs; source coverage pending | §11.4; these are not the general-carrier terminal |
| Common-center exact-five adaptive reselection | PROVEN (conditional source reduction) | Reduced to exact-four or distinct-center consumers | §11.5; it still inherits their unresolved conclusions |
| Exact-five distinct-center exact-twelve tight physical cover, with the eleven-point union, erase identity, retained-source omission, and retained packet | PROVEN (Lean-formalized under approved native trust) | Done for the full tight-cover contract | §11.5; `false_of_exactFiveDistinct_threeCenter_exactTwelveTightPhysical` and `Balanced555FiniteUnsat` |
| Exact-five distinct-center fresh-source contradictions | CONJECTURED | Open | §11.5; both exact declarations in §11.8 |
| TriApex cardinality split and exact-fifteen controls | PROVEN (pen-and-paper cap counting; implemented source reductions) | Done as reductions | §11.6; both terminal conclusions remain open |
| All other source-heavy, placement, closure, TwoSource, and two-deletion terminals | CONJECTURED | Open individually | Every corresponding declaration in §11.8 |
| N8–N9: `GlobalNonM44Contradiction` | CONJECTURED | Open | §10; requires the remaining terminal proofs or a proof under the same hypotheses |
| Theorems 12.1–12.3: removable vertex, descent, and universal conclusion assuming N9 | PROVEN (pen-and-paper, conditional) | Done as implications | §12 |
| Unconditional `Problem97.erdos97_rhs` | CONJECTURED | Open | N9 remains unproved; no publication closure is claimed |

The counting and exact-nine core-axiom measurements cited above were recorded
on 18 August 2026. They are evidence for those already established components,
not a claim that this documentation task reran their builds. The finite
`FiniteN10Closure` and `FiniteN11Closure` certificate endpoints yield the
stronger lower bound `|A| ≥ 12` under approved native trust; the `Counting`
plus `FiniteN9Closure` route yields `|A| ≥ 10` with core axioms alone.

## 14. Source crosswalk and next proof work

| Part of the argument | Current source |
|---|---|
| Upstream predicates and exact target | [Foundation](../lean/Erdos9796Proof/P97/Foundation.lean), [UpstreamBridge](../lean/Erdos9796Proof/P97/UpstreamBridge.lean) |
| Counterexample and induction | [UniversalProblem97](../lean/Erdos9796Proof/P97/UniversalProblem97.lean) |
| Smaller carrier and descent | [SmallerCounterexample](../lean/Erdos9796Proof/P97/SmallerCounterexample.lean), [Descent](../lean/Erdos9796Proof/P97/Descent.lean) |
| Counting and exact-nine base | [Counting](../lean/Erdos9796Proof/P97/Counting.lean), [N9Endpoint/Closure](../lean/Erdos9796Proof/P97/N9Endpoint/Closure.lean) |
| Canonical four-row and deletion semantics | [MinimalUniqueFourCover](../lean/Erdos9796Proof/P97/ATail/MinimalUniqueFourCover.lean), [DeletionRobustness](../lean/Erdos9796Proof/P97/ATail/DeletionRobustness.lean), [PinnedMultiplicity](../lean/Erdos9796Proof/P97/PinnedMultiplicity.lean) |
| MEC packet and cap partition | [CapBridgeFromK4](../lean/Erdos9796Proof/P97/CapBridgeFromK4.lean), [PartitionFromMEC](../lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean) |
| Removable-vertex branch consumers | [Continuation](../lean/Erdos9796Proof/P97/RemovableVertexAxiom/Continuation.lean), [RemovableVertexOfLarge](../lean/Erdos9796Proof/P97/RemovableVertexAxiom/RemovableVertexOfLarge.lean) |
| Exact-eleven and general frontier | [FiniteN11Frontier](../lean/Erdos9796Proof/P97/ATail/FiniteN11Frontier.lean), [FrontierLiveClosure](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean) |
| Geometric circle clearances | [ExactA2CapMetric](../lean/Erdos9796Proof/P97/ATail/ExactA2CapMetric.lean), [A3GlobalCircleWedge](../lean/Erdos9796Proof/P97/ATail/A3GlobalCircleWedge.lean), [A4GlobalCircleWedge](../lean/Erdos9796Proof/P97/ATail/A4GlobalCircleWedge.lean) |
| Exact remaining theorem names | §11.8, with declaration-level source links |
| Machine status and declared trust | [proof-status](../proof-status/README.md), [.blueprint.toml](../.blueprint.toml); check freshness before quoting counts |

The next proof work is determined by a concrete row in §11.8 and its immediate
source consumer. First preserve its full hypotheses and identify the missing
antecedent of any proposed helper or finite terminal. Then discharge that
antecedent or the terminal itself. For the two-radius and exact-five routes,
fixed-cell proofs still require source occurrence and exhaustive coverage;
for B1, a suitable geometric source/arc producer remains missing; for TriApex,
both size-specific terminal contradictions remain missing. These are proof
tasks, not consequences of a source-clean dispatcher.

A closure claim requires the intended aggregate build, transitive axiom audit,
matching source/kernel reference mine, and applicable ingress-binding checks.
Update this document and its exact obligation table when that proof lands.
Keep retired contracts in the archive, so an active search here continues to
identify only the current proof and its remaining obligations.
