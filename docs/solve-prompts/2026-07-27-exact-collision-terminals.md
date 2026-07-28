# Solve prompt — Family F: exact collision terminals (four leaves, all goals `False`)

Date: 2026-07-27.
Scope: the four `sorry`-bearing leaf theorems of the
`TwoSourceExactCollisionRowsTerminal` section of
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`
(leaf labels F1–F4; see Appendix A for the exact declaration map).
Every leaf asserts `False` from a large shared hypothesis package plus a small
leaf-specific supplement.  This document is self-contained: every hypothesis of
every leaf is stated below in plain mathematics (finite point sets in ℝ²,
Euclidean distance, cardinality, membership).  No access to the Lean sources is
required to work on it.

---

## §1 Notation preamble and the shared ambient configuration

### 1.1 Basic notation

* ℝ² is the Euclidean plane with the standard Euclidean distance; $|xy|$
  denotes the distance between points $x, y$.  All point sets are finite unless
  stated otherwise.  $|X|$ denotes cardinality of a finite set $X$;
  $X \setminus Y$ set difference; $X^{c}$ is never used.
* For $p ∈ ℝ²$, $r ∈ ℝ$ and a finite $X ⊂ ℝ²$, the **radius class**
  ("selected class") is
  $$S^X_p(r) := \{\, q ∈ X : |pq| = r \,\}.$$
  When $X = A$ (the ambient carrier, below) we write $S_p(r)$.  Note $p ∈
  S^X_p(r)$ only if $p ∈ X$ and $r = 0$; for $r > 0$ the class never contains
  its own center.
* **K₄ predicate.**  For a finite $X ⊂ ℝ²$ and $p ∈ ℝ²$:
  $$K₄(X, p) :⟺ ∃\, r > 0 \text{ with } |S^X_p(r)| ≥ 4 .$$
  ("$p$ has four equidistant points in $X$.")  A set $X$ has the
  **K₄ property** iff $K₄(X, p)$ holds for every $p ∈ X$.
* **Convex independence.**  A finite $X ⊂ ℝ²$ is *convex-independent* iff every
  $x ∈ X$ satisfies $x ∉ \mathrm{conv}(X \setminus \{x\})$, i.e. all points of
  $X$ are vertices of its convex hull ($X$ is "in strictly convex position").
* **Removable vertex.**  $x$ is removable for $X$ iff $x ∈ X$ and
  $X \setminus \{x\}$ has the K₄ property.
* **Signed area.**  For $u, x, y ∈ ℝ²$ with coordinates $u = (u_1,u_2)$ etc.:
  $$\mathrm{sa}(u, x, y) := (x_1 - u_1)(y_2 - u_2) - (y_1 - u_1)(x_2 - u_2).$$
* **Arc-side predicate.**  For a labelled triangle vertex $v_i$ with the other
  two vertices $v_j, v_k$, and a point $v$:
  $$\mathrm{Arc}(v_i; v) :⟺ \mathrm{sa}(v, v_j, v_k)\cdot\mathrm{sa}(v_i, v_j, v_k) ≤ 0,$$
  i.e. $v$ lies on the closed side of the chord $v_j v_k$ opposite to $v_i$
  (points on the chord itself satisfy the predicate — closed-cap convention).
* **Two-center common-deletion packet.**  For $x ∈ A$ and $z_1, z_2 ∈ ℝ²$
  (relative to the fixed carrier $A$ and blocker system $c(\cdot)$ of §1.2),
  $\mathrm{Packet}(x; z_1, z_2)$ denotes the conjunction of:
  1. $x ∈ A$, $z_1 ∈ A$, $z_2 ∈ A$, $z_1 ≠ z_2$;
  2. $K₄(A\setminus\{x\},\, z_1)$ and $K₄(A\setminus\{x\},\, z_2)$;
  3. $c(x) ≠ z_1$ and $c(x) ≠ z_2$;
  4. there exist finite sets $B_1, B_2 ⊂ ℝ²$ and reals $r_1, r_2 > 0$ with,
     for $j ∈ \{1,2\}$: $B_j ⊆ (A\setminus\{x\})\setminus\{z_j\}$, $x ∉ B_j$,
     $|B_j| = 4$, every $y ∈ B_j$ satisfies $|z_j y| = r_j$; and
     $|B_1 ∩ B_2| ≤ 2$.

### 1.2 The ambient configuration Γ

The four leaves share one hypothesis package Γ, itemized exhaustively below.
Γ is exactly the content of the Lean section-variable/`include` block
(FrontierLiveClosure.lean:7421–7469) after recursively unfolding every
structure.  Redundant items (derivable from earlier items) are retained for
faithfulness and tagged "(redundant: …)".

#### Carrier axioms (C)

* **(C1)** $A ⊂ ℝ²$ is finite and nonempty.
* **(C2)** $A$ is convex-independent.
* **(C3)** $A$ has the K₄ property: $∀ p ∈ A,\; K₄(A, p)$.
* **(C4)** $A$ is not contained in a line.
* **(C5)** $A$ admits at least one surplus-cap packet in the sense of (P1)–(P5)
  below (this is the packet bundled inside the counterexample datum; it need
  not equal the working packet fixed in (P1)–(P5); its only downstream use is
  $|A| > 4$).
* **(C6)** **Minimality.**  For every finite nonempty convex-independent
  $B ⊂ ℝ²$ with the K₄ property, $|A| ≤ |B|$.  (Quantifies over *all* such
  planar sets, not subsets of $A$.)
* **(C7)** **No $(m,4,4)$ packet.**  There is *no* surplus-cap packet on $A$
  (i.e. no choice of MEC-boundary non-obtuse triangle, cap triple and surplus
  designation as in (P1)–(P5), for the same carrier $A$) whose two non-surplus
  caps both have exactly $4$ points.  This quantifies over **all** packets on
  $A$, not just the working packet $S$.
* **(C8)** $|A| > 9$.

#### Working surplus-cap packet (P)

* **(P1)** **Minimum enclosing circle (MEC).**  Let $(O, R_0)$ be the unique
  pair with $R_0 ≥ 0$, $|pO| ≤ R_0$ for all $p ∈ A$, and $R_0$ minimal among
  all enclosing pairs.  (Existence and uniqueness are proven in-project.)
* **(P2)** **Non-obtuse circumscribed Moser triangle.**  Points
  $v_1, v_2, v_3 ∈ A$, pairwise distinct, each on the MEC boundary
  ($|v_i O| = R_0$), with all three angles non-obtuse in inner-product form:
  $⟨v_2 - v_1,\, v_3 - v_1⟩ ≥ 0$, $⟨v_3 - v_2,\, v_1 - v_2⟩ ≥ 0$,
  $⟨v_1 - v_3,\, v_2 - v_3⟩ ≥ 0$.
* **(P3)** **Cap triple (closed-cap convention).**  Finite sets
  $C_1, C_2, C_3 ⊆ A$ with (indices cyclic, cap $C_i$ "opposite" apex $v_i$):
  * $v_i ∉ C_i$ and $v_j, v_k ∈ C_i$ for $\{i,j,k\} = \{1,2,3\}$;
  * every $v ∈ A \setminus \{v_1,v_2,v_3\}$ lies in exactly one cap;
  * **arc membership:** for every $v ∈ A$ and each $i$:
    $v ∈ C_i ⟺ \mathrm{Arc}(v_i; v)$ (with the chord being the other two
    vertices, as in §1.1).  In particular the caps are determined by the
    triangle: $C_i = \{v ∈ A : \mathrm{Arc}(v_i; v)\}$.
* **(P4)** **Surplus designation.**  An index $σ ∈ \{1,2,3\}$ with
  $|C_σ| > 4$.  Write $m := C_σ$ (the surplus cap).
* **(P5)** **Naming.**  Let $(i_1, i_2)$ be the other two indices in cyclic
  order after $σ$: $σ=1 ⇒ (i_1,i_2) = (2,3)$; $σ=2 ⇒ (3,1)$; $σ=3 ⇒ (1,2)$.
  Define the apices $a_0 := v_σ$ (surplus apex), $a_1 := v_{i_1}$ (first
  opposite apex), $a_2 := v_{i_2}$ (second opposite apex); and the opposite
  caps $C_{i_1}$ (first) and $C_{i_2}$ (second).  For each $i$, the **strict
  cap interior** is $C_i^{\circ} := C_i \setminus \{v_j, v_k\}$ ($j,k ≠ i$),
  the cap minus its two Moser-vertex endpoints.

  Derived (proven in-project, listed for orientation, not hypotheses):
  the cap-sum identity $|C_1| + |C_2| + |C_3| = |A| + 3$; $a_1 ∈ C_σ ∩ C_{i_2}$,
  each Moser vertex lies in exactly the two caps it bounds.

#### Critical shell (blocker) system (H)

* **(H1)** For every $x ∈ A$ there are given: a **blocker center**
  $c(x) ∈ A \setminus \{x\}$, a **shell radius** $r(x) > 0$, and the **exact
  shell** $K(x) := S_{c(x)}(r(x)) = \{z ∈ A : |c(x)\,z| = r(x)\}$, such that
  $|K(x)| = 4$ and $x ∈ K(x)$.  ($K(x)$ is the *entire* radius class of $A$ at
  that center and radius, not a selected 4-subset.)
* **(H2)** **Criticality.**  For every $x ∈ A$:
  $¬K₄(A \setminus \{x\},\, c(x))$; explicitly, for every $r > 0$,
  $|\{z ∈ A\setminus\{x\} : |c(x)\,z| = r\}| ≤ 3$.  (Deleting $x$ destroys
  every four-point witness at its blocker center.  Equivalently: for
  $r ≠ r(x)$, $|S_{c(x)}(r)| ≤ 3$, and $|K(x)| = 4$ with $x ∈ K(x)$.)

#### Two frontier instances (Q★, R★), one for each radius ★ ∈ {r, ρ}

Fixed reals $r$ and $ρ$ (the two frontier radii; positivity is derivable, see
(D0) below).  For **each** ★ ∈ {r, ρ} the following data are
given (two independent copies; write $q_★, w_★$ for the survivor pair of the
instance at radius ★):

* **(Q1)** $q_★, w_★ ∈ A$, $q_★ ≠ w_★$.
* **(Q2)** $q_★, w_★ ∈ S_{a_1}(★) \setminus m$ (both on the circle of radius ★
  about the first opposite apex, neither in the surplus cap).
* **(Q3)** $K₄(A\setminus\{q_★\},\, a_2)$ and $K₄(A\setminus\{w_★\},\, a_2)$.
* **(Q4)** $c(q_★) ≠ a_2$ and $c(w_★) ≠ a_2$.
* **(Q5)** **First-apex split.**
  $K₄(A\setminus\{q_★, w_★\},\, a_1)$, or else both:
  $|S_{a_1}(★)| ∈ \{4, 5\}$ and every $ρ' > 0$ with $|S_{a_1}(ρ')| ≥ 4$
  satisfies $ρ' = ★$.  (In the presence of (X6), (X7), (X5) below, the second
  disjunct is false for both instances, so (Q5) is equivalent to its first
  disjunct — which is (R2).)
* **(Q6)** $K₄(A\setminus\{q_★, w_★\},\, a_2)$ (second-apex double-deletion
  survival).
* **(Q7)** **Second-apex split.**  $K₄(A\setminus\{q_★, w_★\},\, a_2)$, or
  else there exist two exact shells at center $a_2$: full radius classes
  $S_{a_2}(|a_2 q_★|)$ and $S_{a_2}(|a_2 w_★|)$, each of cardinality exactly
  $4$, with positive radii, containing $q_★$ resp. $w_★$, and disjoint from
  each other.  (Redundant: the first disjunct is (Q6).)
* **(R1)** $4 ≤ |S_{a_1}(★)|$.  (Redundant given (X6)/(X7).)
* **(R2)** $K₄(A\setminus\{q_★, w_★\},\, a_1)$ (first-apex double-deletion
  survival).
* **(R3)** $\mathrm{Packet}(q_★;\, a_1, a_2)$ (§1.1; in particular
  $a_1 ≠ a_2$, $c(q_★) ∉ \{a_1, a_2\}$, and the two 4-point rows with overlap
  $≤ 2$).

#### The two exact collision rows (X)

* **(X1)** $s_1, s_2 ∈ A$ with $s_1 ≠ s_2$; and $t_1, t_2 ∈ A$ with
  $t_1 ≠ t_2$.
* **(X2)** $s_1, s_2 ∈ S_{a_1}(r)$ and $t_1, t_2 ∈ S_{a_1}(ρ)$.
* **(X3)** $s_1, s_2, t_1, t_2 ∈ C_{i_1}^{\circ}$ (strict interior of the
  first opposite cap).
* **(X4)** **Blocker collisions.**  $c(s_1) = c(s_2) =: b$ and
  $c(t_1) = c(t_2) =: b'$.
* **(X5)** $ρ ≠ r$.
* **(X6)** $|S_{a_1}(r)| = 4$.
* **(X7)** $|S_{a_1}(ρ)| = 4$.
* **(X8)** $S_{a_1}(r) ∩ C_{i_1}^{\circ} = \{s_1, s_2\}$.
* **(X9)** $S_{a_1}(ρ) ∩ C_{i_1}^{\circ} = \{t_1, t_2\}$.
* **(X10)** $\{s_1, s_2\} ∩ \{t_1, t_2\} = ∅$.
* **(X11)** $b' ≠ b$.

#### Robustness / richness / cover (T)

* **Definitions.**  $\mathrm{Robust}(p) :⟺ ∀ z ∈ A,\; K₄(A\setminus\{z\}, p)$.
  $\mathrm{Rich}(p) :⟺ (∃ r'' > 0:\ |S_p(r'')| ≥ 6)$ or
  $(∃\, r_1'' ≠ r_2'' > 0:\ |S_p(r_1'')| ≥ 4 \text{ and } |S_p(r_2'')| ≥ 4)$.
  $\mathrm{NR} := \{p ∈ A : ¬\mathrm{Robust}(p)\}$.
* **(T1)** $\mathrm{Robust}(a_2)$.
* **(T2)** $|C_{i_1}| ≥ 6$ and $|C_{i_2}| ≥ 6$.
* **(T3)** $|m| ≥ 6$.  (With (T2) and the cap-sum identity: $|A| ≥ 15$.)
* **(T4)** $\mathrm{Rich}(a_1)$, $\mathrm{Rich}(a_2)$, $\mathrm{Rich}(a_0)$.
* **(T5)** $|A| ≤ 4\,|\mathrm{NR}|$.
* **(T6)** No common circle through the three apices centered in the carrier:
  for every $p ∈ A$ and every $r'' > 0$, not all of $v_1, v_2, v_3$ lie in
  $S_p(r'')$.

#### Unique-four cover of the blocker range (U)

* **(U1)** For every $x ∈ A$: $c(x) ≠ x$ (redundant: (H1)); $c(x)$ is a
  **unique-four center**: $c(x) ∈ A$ and there is exactly one K₄ radius at
  $c(x)$ — explicitly, $|S_{c(x)}(r(x))| = 4$ (redundant: (H1)) and every
  $ρ'' > 0$ with $|S_{c(x)}(ρ'')| ≥ 4$ satisfies $ρ'' = r(x)$; moreover the
  four-point class selected at $c(x)$ is $K(x)$ (redundant given the two
  previous conjuncts).

  Net new content of (U1): **at each blocker center the shell radius is the
  only radius carrying ≥ 4 carrier points.**

#### The mutual-omission two-cycles (M)

* **(M1)** $t_1 ∉ K(s_1)$, and $\mathrm{Packet}(t_1;\, a_1, b)$.
  (Also $t_1 ∈ C_{i_1}^{\circ}$, $t_1 ∉ \{s_1, s_2\}$ — redundant: (X3),
  (X10).)
* **(M2)** There is a chosen $u ∈ \{s_1, s_2\}$ with: $u ∈ A$,
  $u ∈ C_{i_1}^{\circ}$, $u ≠ t_1$, $c(u) = b$ (all redundant: (X3), (X4),
  (X10)); $t_1 ∉ K(u)$ (redundant: $K(u) = K(s_1)$ by (D3) and (M1));
  $u ∉ K(t_1)$; $b ≠ c(t_1)$ (redundant: (X11));
  $\mathrm{Packet}(t_1;\, a_1, b)$ (redundant: (M1)); and
  $\mathrm{Packet}(u;\, a_1, b')$.
  Net new content: **a designated $u ∈ \{s_1, s_2\}$ with $u ∉ K(t_1)$**,
  plus the packet rows for $u$ at centers $(a_1, b')$.
* **(M3)** $s_1 ∉ K(t_1)$, and $\mathrm{Packet}(s_1;\, a_1, b')$.
  (Also $s_1 ∈ C_{i_1}^{\circ}$, $s_1 ∉ \{t_1, t_2\}$ — redundant: (X3),
  (X10).)
* **(M4)** There is a chosen $u' ∈ \{t_1, t_2\}$ with: $u' ≠ s_1$,
  $c(u') = b'$ (redundant), $s_1 ∉ K(u')$ (redundant: $K(u') = K(t_1)$ and
  (M3)); $u' ∉ K(s_1)$; $b' ≠ b$ (redundant);
  $\mathrm{Packet}(s_1;\, a_1, b')$ (redundant: (M3)); and
  $\mathrm{Packet}(u';\, a_1, b)$.
  Net new content: **a designated $u' ∈ \{t_1, t_2\}$ with $u' ∉ K(s_1)$**,
  plus the packet rows for $u'$ at centers $(a_1, b)$.

### 1.3 Established derived facts (proven in-project, kernel-checked; usable as background)

* **(D0)** $r > 0$ and $ρ > 0$ (from (Q2): $q_★ ∉ m ∋ a_1$, so $q_★ ≠ a_1$).
* **(D1)** **Cross-deletion criterion.**  For all $x ∈ A$ and $w ∈ ℝ²$:
  $K₄(A\setminus\{w\},\, c(x)) ⟺ w ∉ K(x)$.
  (`cross_deletion_survives_iff_not_mem_selected_support`,
  ATail/CriticalPairFrontier.lean:755.)
* **(D2)** **Support locking.**  Any 4-point set $B ⊆ A$ on a common circle of
  positive radius about $c(x)$ (center not in $B$) equals $K(x)$.
  (`selectedFourClass_support_eq_shell`, U1CarrierInjection.lean:1087.)
* **(D3)** **Equal blockers ⇒ equal shells.**  If $c(x) = c(y)$ then
  $K(x) = K(y)$; hence $K(s_1) = K(s_2)$, $K(t_1) = K(t_2)$, and
  $s_2 ∈ K(s_1)$, $t_2 ∈ K(t_1)$.
  (`selectedSupports_eq_of_actualBlockers_eq`, ATail/SurvivalCover.lean:48;
  `RetainedInteriorBlockerCollision.supports_eq`,
  ATail/RetainedStrictInteriorPairSelector.lean:207.)
* **(D4)** **Exact cap trace of the collision shells.**
  $K(s_1) ∩ C_{i_1} = \{s_1, s_2\}$ and $K(t_1) ∩ C_{i_1} = \{t_1, t_2\}$
  (closed cap!), hence $|K(s_1) \setminus C_{i_1}| = |K(t_1) \setminus C_{i_1}| = 2$.
  (`shell_inter_cap_eq_sources`,
  ATail/RetainedStrictInteriorPairSelector.lean:279;
  `collisionShell_sdiff_firstCap_card_eq_two`,
  ATail/BlockerMultiplicityGeometry.lean:220.)
* **(D5)** **Blockers sit inside the cap.**  $b ∈ C_{i_1}^{\circ}$ and
  $b' ∈ C_{i_1}^{\circ}$.  (`blocker_mem_capInterior`,
  ATail/RetainedStrictInteriorPairSelector.lean:244.)
* **(D6)** $\mathrm{Robust}(a_1)$.  (`firstApexFullyDeletionRobust`,
  ATail/OrientedPhysicalApexIngress.lean:318.)  Also
  $\mathrm{Rich}(p) ⇒ \mathrm{Robust}(p)$
  (ATail/ApexRichClassStructure.lean:105), so (T4) gives
  $\mathrm{Robust}(a_0)$, $\mathrm{Robust}(a_2)$ as well.
* **(D7)** **Robust points are never blocker values.**  A robust center is not
  a unique-four center (ATail/MinimalUniqueFourCover.lean:159); with (U1),
  $c(x) ∉ \{a_0, a_1, a_2\}$ for every $x ∈ A$.
* **(D8)** **Cap two-point row bound.**  For any center $z ∈ C_i$ (closed cap,
  any $i$) and any 4-point set $B ⊆ A$ on a common positive-radius circle
  about $z$ with $z ∉ B$: $|B ∩ C_i| ≤ 2$.
  (`selectedFourClass_inter_capByIndex_card_le_two`,
  CapSelectedRowCounting.lean:257; uses (C2).)
* **(D9)** **Off-cap pair has at most one cap bisector point.**  If
  $c ≠ d ∈ C_i$ (closed cap) and $a ≠ b ∈ A$ with $a, b ∉ C_i$, then not both
  $|ca| = |cb|$ and $|da| = |db|$.
  (`outsidePair_unique_capCenter`, CapSelectedRowCounting.lean:283, consumable
  form ATail/FirstFiberOverlapDescent.lean:111 — note that consumable form is
  `private` to its file, so cite the CapSelectedRowCounting original from new
  modules; uses (C2).)
* **(D10)** **Minimality cover.**  From (C6): every $x ∈ A$ lies in the unique
  four-point class of some unique-four **center** (that is the cited
  statement; since $x ∈ K(x)$ with center $c(x)$ by (H1)+(U1), every point in
  particular lies in the class of some blocker value); quantitatively
  $|A| ≤ 4\,|U|$ where $U$ is the set of unique-four centers, and (T5)
  restates this with $U ⊆ \mathrm{NR}$.  (MinimalUniqueFourCover.lean:429.)
* **(D11)** **Two-circle bound.**  Two circles with distinct (center, radius)
  pairs share at most two points; hence $|K(x) ∩ K(y)| ≤ 2$ whenever
  $(c(x), r(x)) ≠ (c(y), r(y))$, and $|K(x) ∩ S_p(r'')| ≤ 2$ whenever
  $(c(x), r(x)) ≠ (p, r'')$.  (No single in-tree declaration has this general
  form; kernel-checked instantiations:
  `U5QDeletedK4Class.inter_card_le_two`, U5GlobalIncidenceSupport.lean:412,
  and `criticalFourShell_inter_selectedClass_card_le_two`,
  ATail/MinimalUniqueFourCover.lean:306.)
* **(D12)** **Explicit four-point row (F3 context).**  Under leaf F3's
  hypothesis (F3a) below: $K(s_1) = \{s_1, s_2, e, o\}$.
  (`firstFiber_shell_eq_explicitFour`,
  ATail/FirstFiberOverlapDescent.lean:156 and FrontierLiveClosure.lean:7495.)
  Symmetrically under (F4b): $K(t_1) = \{t_1, t_2, e, o\}$ — the symmetric
  half has no in-tree declaration; it follows by the identical two-rewrite
  calc from the kernel-checked generic parts (`shell_inter_cap_eq_sources`
  applied to $P_ρ$ plus `FreshOutsideSecondBlockerFiber.outside_eq_pair`).
* **(D13)** **Deletion-survival reduction of packets.**  By (D1),
  $\mathrm{Packet}(x; a_1, z)$ with $z = c(y)$ contains the information
  $x ∉ K(y)$, and conversely $x ∉ K(y)$ plus $\mathrm{Robust}(a_1)$
  reconstructs such a packet.  In particular, (M1)–(M4) reduce modulo Γ to:
  $t_1 ∉ K(s_1)$, $s_1 ∉ K(t_1)$, $∃ u ∈ \{s_1,s_2\}: u ∉ K(t_1)$,
  $∃ u' ∈ \{t_1,t_2\}: u' ∉ K(s_1)$.

### 1.4 Interface assumptions

* The MEC $(O, R_0)$ of (P1) is treated as given exact data satisfying the
  stated enclosing/minimality/uniqueness properties; nothing else about the
  MEC is assumed.
* The ordered-cap machinery behind (D8)/(D9) is used only through those two
  stated consequences.
* Global minimality (C6) and the no-$(m,4,4)$ hypothesis (C7) are stated
  exactly above and are *not* further unfolded; they are the only hypotheses
  quantifying over objects outside the fixed configuration.

---

## §2 Problem statements — the four leaves

Resolve the following four proof obligations completely.  Each leaf is an
independent obligation: assume the **entire** configuration Γ of §1.2 —
items (C1)–(C8), (P1)–(P5), (H1)–(H2), both frontier instances
(Q1)–(Q7)/(R1)–(R3) for ★ ∈ {r, ρ}, (X1)–(X11), (T1)–(T6), (U1),
(M1)–(M4) — plus the leaf's supplement, and prove `False`; or produce the
branch-B certificate of §4.  No item of Γ may be dropped, weakened, or
replaced.

### Leaf F1 — `false_of_crossBlockerCoincidence`

Additionally assume:

* **(F1a)** $b = t_1$ or $b = t_2$ or $b' = s_1$ or $b' = s_2$.

Prove `False`.

*Per-leaf note.*  All four arms must be closed.  Under (F1a) the coinciding
point is simultaneously a collision source (element of one exact row, with its
own blocker) and the blocker center of the other row (a unique-four center by
(U1), lying in $C_{i_1}^{\circ}$ by (D5) — consistent with (X3)).  E.g. if
$b = t_1$: $t_1$ is the center of the 4-circle $K(s_1) ∋ s_1, s_2$, while
$c(t_1) = b'$, $t_1 ∈ K(t_1) = S_{b'}(r(t_1))$, $t_1 ∈ S_{a_1}(ρ)$, and by
(U1) at $x = s_1$ the radius $r(s_1)$ is the only K₄ radius of $t_1$.  The
Lean docstring records that this leaf is expected to need the retained
minimality (C6)/(T5), no-$(m,4,4)$ (C7), tri-apex (T4), and two-cycle (M)
data.  Note F1 does **not** assume $|C_{i_1}| ≥ 8$; only (T2)'s $≥ 6$ is
available.

### Leaf F2 — `false_of_capSource_freshThirdBlockerFiber`

Additionally assume:

* **(F2a)** $|C_{i_1}| ≥ 8$.
* **(F2b)** There exists $g ∈ A$ with:
  1. $g ∈ C_{i_1}^{\circ}$;
  2. $g ∉ \{s_1, s_2, t_1, t_2\}$;
  3. $c(g) ≠ b$;  4. $c(g) ≠ b'$;
  5. $c(g) ≠ a_1$;  6. $c(g) ≠ a_2$  (5–6 redundant: (D7));
  7. $g ∈ K(g)$ and $|K(g)| = 4$ (redundant: (H1));
  8. $s_1 ∉ K(g)$ or $s_2 ∉ K(g)$;
  9. $t_1 ∉ K(g)$ or $t_2 ∉ K(g)$.
* **(F2c)** There exist $x, y ∈ A$ with:
  1. $x ≠ y$;
  2. $c(x) = c(y)$ — a **third** blocker collision;
  3. $c(x) ≠ b$ and $c(x) ≠ b'$;
  4. $x ∉ \{s_1, s_2, t_1, t_2\}$ and $y ∉ \{s_1, s_2, t_1, t_2\}$
     (eight separate inequalities);
  5. $x ∈ K(y)$ and $y ∈ K(x)$ (redundant: (D3) gives $K(x) = K(y)$ from 2).

Prove `False`.

*Per-leaf note.*  (F2b) is the "cap-source third canonical row" surface: a
fifth strict-cap source whose exact row omits at least one endpoint of each
collision pair.  (F2c) supplies a third two-element blocker fiber with a fresh
blocker value $b'' := c(x) ∉ \{b, b'\}$; nothing is hypothesized about where
$x, y$ or $b''$ sit relative to the caps.  The Lean docstring records that no
positive incidence relation between the cap-source row and the fresh fiber is
currently known; producing one (or a counting contradiction) is the task.

### Leaf F3 — `false_of_capSource_firstFiber_collisionFiveCenterDeletion`

Additionally assume:

* **(F3a)** (enlarged first blocker fiber)  There exist $e, o$ with:
  1. $e ∈ A$, $e ∉ \{s_1, s_2, t_1, t_2\}$ (four inequalities);
  2. $c(e) = b$ (so $e$ is a **third** source in the first collision fiber);
  3. $e ∈ K(s_1)$ (redundant: (D3) from 2);
  4. $e ∉ C_{i_1}$ (closed cap);
  5. $o ∈ A$, $o ≠ e$, $o ≠ t_1$, $o ≠ t_2$;
  6. $o ∈ K(s_1)$;  7. $o ∉ C_{i_1}$;
  8. $K(s_1) \setminus C_{i_1} = \{e, o\}$.
  (With (D4) this yields (D12): $K(s_1) = \{s_1, s_2, e, o\}$.)
* **(F3b)** = (F2a) ∧ (F2b): $|C_{i_1}| ≥ 8$ and a named $g ∈ A$ with
  properties (F2b) 1–9.
* **(F3c)** (five-center deletion residual, four arms)  One of:
  1. deleting $s_1$ preserves K₄ at five centers:
     $K₄(A\setminus\{s_1\}, c(g))$, $K₄(A\setminus\{s_1\}, a_1)$,
     $K₄(A\setminus\{s_1\}, b')$, $K₄(A\setminus\{s_1\}, a_2)$,
     $K₄(A\setminus\{s_1\}, a_0)$;
  2. same five statements with deleted point $t_1$ and third center $b$
     instead of $b'$;
  3. same as arm 1 with deleted point $s_2$;
  4. same as arm 2 with deleted point $t_2$.

Prove `False`.

*Per-leaf note.*  By (D1) and (D6)/(D7)-robustness of $a_0, a_1, a_2$, (F3c)
reduces modulo Γ to
$$(s_1 ∉ K(g) ∧ s_1 ∉ K(t_1)) ∨ (t_1 ∉ K(g) ∧ t_1 ∉ K(s_1)) ∨ (s_2 ∉ K(g) ∧ s_2 ∉ K(t_1)) ∨ (t_2 ∉ K(g) ∧ t_2 ∉ K(s_1)),$$
each arm naming which collision source's deletion survives everywhere except
at its own blocker.  Note (H2): deleting $s_1$ still destroys K₄ at $b$;
the five listed centers avoid $b$ (arm 1) resp. $b'$ (arm 2), so no direct
clash occurs — the contradiction must come from deeper structure (e.g. the
minimality cover (T5)/(D10), the exact row (D12), or cap counting with
(F3b)).  All four arms must be closed.

### Leaf F4 — `false_of_capSource_freshOutsideSecondBlockerFiber`

Additionally assume:

* **(F4a)** = (F2a) ∧ (F2b) (the cap-eight surface with its source $g$).
* **(F4b)** (enlarged second blocker fiber)  There exist $e, o$ with:
  1. $e ∈ A$, $e ∉ \{s_1, s_2, t_1, t_2\}$;
  2. $c(e) = b'$;
  3. $e ∈ K(t_1)$ (redundant: (D3));
  4. $e ∉ C_{i_1}$;
  5. $o ∈ A$, $o ≠ e$, $o ≠ s_1$, $o ≠ s_2$;
  6. $o ∈ K(t_1)$;  7. $o ∉ C_{i_1}$;
  8. $K(t_1) \setminus C_{i_1} = \{e, o\}$.
  (Hence $K(t_1) = \{t_1, t_2, e, o\}$.)

Prove `False`.

*Per-leaf note.*  Mirror image of the first fiber, but here **no** analogue of
the F3 descent has been performed: the raw fiber must be consumed directly.
The corresponding first-fiber branch was closed in-project by descending to
F3's two terminal surfaces; a symmetric descent for the second fiber (swapping
the roles of $(s_i, b, r)$ and $(t_i, b', ρ)$) is available as a proof
strategy, and if carried out reduces F4 to statements of F3 type — but then
those must actually be proved, not cited.

---

## §3 Assume-solvable framing

Assume for purposes of this task that each leaf admits a complete resolution,
but do not assume in advance which direction it takes.  A complete resolution
of a leaf must establish exactly one of the two statements in §4.  The four
leaves may resolve in different directions; resolving any one leaf in either
direction is independently valuable and must be reported on its own.

## §4 Dual-branch success criteria

**Branch A (derivation).**  For a leaf L ∈ {F1, F2, F3, F4}: a complete,
rigorous proof of `False` from Γ plus L's supplement — valid for *every*
configuration satisfying those hypotheses, using each hypothesis only as
stated, and formalizable in Lean 4 with mathlib (no new axioms; the in-project
facts (D0)–(D13) may be used as established).  The proof must not use
additional assumptions such as: general position beyond (C2); genericity of
the radii $r(x)$; symmetric placement of the off-cap shell points; exact cap
size $|C_{i_1}| = 8$; boundedness of $|A|$; distinctness or injectivity of the
blocker map $x ↦ c(x)$ beyond what (X4)/(X11)/(F2c) state; or any unstated
incidence ("no three of the named points concyclic", "all shell radii
distinct", …).  Where a disjunctive hypothesis has several arms ((F1a), (F2b)
8–9, (F3c), (Q5)), every arm must be handled.

**Branch B (exact realizability certificate).**  For a leaf L: one fixed
configuration — the carrier $A$ with exact algebraic coordinates (rational, or
elements of an explicitly presented real number field with exact arithmetic),
together with explicit choices of $(O, R_0)$, $v_1 v_2 v_3$, caps, $σ$, the
blocker system $(c, r, K)$, radii $r, ρ$, all named points
($q_r, w_r, q_ρ, w_ρ, s_1, s_2, t_1, t_2, u, u'$, and the leaf's
$g, x, y, e, o$ as applicable), and packet rows — satisfying **every**
hypothesis of Γ and of L's supplement, each verified exactly (symbolic
algebra, not floating point).  Such a certificate proves that leaf L is
unprovable and kills this closure route; that outcome is **equally valuable**
as branch A and must be reported as such, not soft-pedaled.

Honest scale note for branch B (not a discouragement, a specification): a
certificate's carrier is a finite convex-independent set with the K₄ property
— i.e. a full counterexample object for the enclosing Erdős-97 program — with
$|A| ≥ 15$ (F1) resp. $|A| ≥ 17$ (F2–F4, from (F2a) and the cap-sum
identity), and the universally quantified items must be certified too:
(C6) minimality over all smaller planar configurations, (C7) over all packets
on $A$, (U1) over all positive radii at each blocker center, (T5)–(T6), and
the negative membership facts.  For radius-quantified items this is a finite
check (only finitely many pairwise distances occur); for (C6) an exact finite
reduction with proof is required.  A configuration failing even one hypothesis
of Γ or of the leaf's supplement is worthless for branch B (see §5).

**Quantifier order.**  Branch A must treat all Γ-data as universally given
(arbitrary), producing `False` uniformly; branch B chooses everything
existentially but must then verify all Γ-clauses including their internal
universal quantifiers.

## §4b Sanctioned reformulations (optional)

* **Membership reduction (proved).**  Modulo Γ, all K₄-survival hypotheses of
  the form $K₄(A\setminus\{w\}, c(x))$ may be replaced by $w ∉ K(x)$ via (D1),
  and the packets by their §1.1 clause lists.  This reformulation is exact and
  already kernel-checked ((D13)); it may be used freely.
* **Blocker-function formulation.**  The system (H1)–(H2)+(U1) is equivalent
  to: a function $c : A → A$ with no fixed point, such that each $p ∈
  \mathrm{ran}(c)$ carries exactly one K₄ radius, whose class has exactly 4
  points, and $c^{-1}(p) ⊆$ that class... — **warning:** the last inclusion
  ($x ∈ K(x)$) holds, but $c^{-1}(p)$ need not exhaust $K(x)$, and points of
  $K(x)$ need not have blocker $p$.  Any functional-digraph reformulation must
  preserve exactly this asymmetry.
* **Semialgebraic encoding.**  Each leaf's hypothesis set, for a fixed carrier
  size $n$ and a fixed combinatorial type (cap assignment, blocker map,
  incidence pattern of the shells), is a finite conjunction of polynomial
  equations and inequalities over ℝ^{2n}.  Branch-B search and per-pattern
  branch-A elimination may proceed pattern by pattern, but: the enumeration of
  combinatorial types must be proved exhaustive; (C6) is *not* semialgebraic
  in the fixed-$n$ encoding and must be handled separately; and a
  quantifier-elimination or Positivstellensatz certificate for one pattern
  eliminates only that pattern.

## §5 Insufficient-progress list

Partial progress does not count unless it implies exactly one of the two
resolutions above for at least one leaf.  In particular, the following are
insufficient:

* proving `False` under extra symmetry or genericity assumptions (mirror
  symmetry of a shell, "no 5 concyclic carrier points", distinct shell radii,
  injective blocker map);
* closing only some arms of a disjunctive hypothesis: subsets of (F1a)'s four
  equalities, one of the four arms of (F3c), one side of (F2b) 8–9, or the
  first-apex split (Q5) in only one frontier instance;
* numerical near-configurations (floating point) for branch B without exact
  algebraic verification of every clause;
* certificates that satisfy the local geometry but omit (C6) minimality, or
  (C7), or (U1)'s unique-radius clause, or (T5), or the frontier pairs
  $(q_★, w_★)$ and their packets, or the (M)-cycle data — a configuration
  failing even one hypothesis is worthless for branch B;
* heuristic dimension or degree-of-freedom counts ("five constraints on four
  points is overdetermined") without an exact algebraic or combinatorial
  elimination;
* modified-configuration results: conclusions for $|S_{a_1}(r)| = 5$, for
  non-convex carriers, for open caps where the hypothesis is a closed cap (or
  conversely), for "some cap" instead of the indexed cap $C_{i_1}$, or with
  $≥ 4$ where a hypothesis says $= 4$;
* treating $K(x)$ as an arbitrary 4-subset of a circle rather than the *full*
  radius class (exactness cuts both ways: nothing else of $A$ is on that
  circle);
* using survival/criticality with the wrong deletion set (e.g. citing (H2)
  after a *different* point's deletion);
* arguments requiring $a_1, a_2, a_0$ or $b, b'$ to be in general position
  with respect to the MEC beyond (P2)–(P3);
* solver output (SAT/SMT/Gröbner/interval) without a verifiable certificate
  or a kernel-checkable reconstruction, or with an unvalidated encoding (every
  encoding must first pass a smoke test against a known small instance);
* interval-arithmetic exclusion of a bounded parameter region without a proof
  that the region covers all configurations satisfying the hypotheses;
* combinatorial (oriented-matroid level) consistency or inconsistency of an
  incidence pattern without metric realization or metric elimination;
* proving one leaf by citing another unproved leaf of this family, or by
  citing the parent coordinator
  (`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`)
  or any of its unproved consumers;
* conditional results ("if additionally no third collision fiber exists…")
  unless the condition is itself proved from Γ;
* reducing a leaf to another unproved planar incidence or cap-counting
  statement of comparable strength (e.g. "two exact-four rows with distinct
  blockers meet in at most one strict-cap point", "every 8-point cap contains
  a source whose row avoids all four named sources").

## §6 Allowed background

Standard proved theorems from planar Euclidean geometry, finite combinatorics
and convexity may be used, but they must be stated accurately and applied with
all necessary hypotheses: two distinct circles meet in at most two points;
perpendicular-bisector characterization of equidistance; basic convex-position
facts; pigeonhole; double counting.  Mathlib's `EuclideanGeometry` and
`Finset` libraries set the formalization baseline.

The in-project facts (D0)–(D13) of §1.3 are established background (each is
kernel-checked at the cited location).  They mean exactly what §1.3 states —
in particular (D8)/(D9) are statements about *closed* indexed caps of the
working packet and require (C2); they do **not** extend to arbitrary subsets
of $A$, and (D9) does not bound bisector points of pairs that are not both
outside the cap.

Known results on repeated distances in convex position (e.g. Erdős–Moser-type
bounds) may be used only as accurately stated published theorems with all
hypotheses; they do not by themselves settle any leaf.

## §7 Multiagent orchestration block

Use multiagent orchestration aggressively and dynamically.  You have up to 40
concurrent agents available.  Do not use a fixed assignment such as "N agents
for strategy X."  Manage the search with the following heuristics:

* Begin with a genuinely diverse portfolio of approaches.  Agents should
  explore substantially different formulations, invariants, reductions, and
  computational sanity checks, drawn from (at least) these families:
  1. perpendicular-bisector and co-radiality counting (each blocker center is
     equidistant from every pair inside its shell; (D9) limits cap-interior
     bisector points of off-cap pairs — note $b$ is equidistant from
     $\{e, o\}$ in F3 via (D12));
  2. two-circles-meet-in-≤-2-points bookkeeping across the row system
     $K(s_1), K(t_1), K(g), K(x), S_{a_1}(r), S_{a_1}(ρ)$, and the packet rows
     $B_1, B_2$;
  3. cap/arc convex ordering: radial monotonicity along a convex arc, ordered
     occupancy of $C_{i_1}$ ($≥ 8$ points, 4 named sources, 2 named blockers,
     the source $g$, and $a_1$'s two circle traces (X8)/(X9));
  4. distance-rigidity spindles: chains of exact 4-shells sharing 2 points,
     equilateral/rhombus forcing, spindle transfer between $b$, $b'$, $b''$;
  5. exact coordinate normalization (place $a_1$, normalize $r$) + polynomial
     elimination (resultants, Gröbner bases — msolve/Singular) per
     combinatorial pattern;
  6. SMT over nonlinear real arithmetic (Z3/cvc5) on the existential fragment
     of a fixed pattern, with validated encodings;
  7. SAT/ILP enumeration of incidence patterns (which named points lie on
     which named circles/caps) under the cardinality constraints, followed by
     per-pattern geometric elimination;
  8. pigeonhole on cap occupancy and blocker fibers: fibers of $c$ restricted
     to $C_{i_1}^{\circ}$, sizes forced by (X8)/(X9)/(F2a);
  9. unique-four cover double counting: (T5)/(D10) — every carrier point is
     covered by a 4-class of a non-robust center; robust apices $a_0,a_1,a_2$
     spend nothing; count coverage of the ≥ 15 (or ≥ 17) points against the
     named blocker budget;
  10. repeated-distance extremal counting in convex position applied to the
      exact-4 classes (each unique-four center contributes 4 equal distances);
  11. blocker-map digraph structure: $x ↦ c(x)$ has no fixed points, every
      value is a unique-four center, iterates cycle; interaction of a cycle
      with the collision fibers;
  12. interval-arithmetic certified exclusion over normalized parameter boxes
      (as evidence and to guide pattern pruning — must be upgraded per §5);
  13. oriented-matroid / combinatorial-convexity enumeration of realizable
      orders of the named points on the convex hull and caps;
  14. exact branch-B search: small algebraic carriers ($n = 15..20$),
      structured families (orbits of a rotation, points on few concentric
      circles), checked exactly against the full clause list of §2.
* Do not tell most agents the currently favored approach.  Preserve
  independence during early rounds so that agents do not all converge to the
  same attractive but incomplete argument — the known attractors here are
  (a) heuristic overdetermination counts ("too many circles through too few
  points") that never produce an exact elimination, (b) hidden-symmetry
  assumptions on the off-cap shell points $\{e, o\}$ or on the two collision
  rows (e.g. treating $ρ$-row data as a mirror image of the $r$-row data), and
  (c) reduction to a clean but unproved "two rows share ≤ 1 cap point"-type
  incidence lemma of strength comparable to the leaf itself.
* Maintain an explicit registry of approach families.  Group agents by the
  mathematical idea they are using, not by superficial wording.  If many
  agents converge to one family, redirect some toward underexplored
  formulations.
* Do not allow one approach to dominate merely because it gives an elegant
  reformulation.  A route that ends at an unproved incidence or cap-counting
  lemma equivalent in strength to the leaf is not close to completion unless
  it supplies a genuinely new proof of that lemma.
* When an approach stalls at a theorem-strength missing lemma, mark that route
  as blocked.  Only continue assigning agents to it if someone proposes a
  materially new mechanism, invariant, construction, quantitative estimate, or
  exact-elimination device.
* Keep several incompatible proof routes alive through multiple rounds.
  Maintain both branch-A routes and branch-B routes for each unresolved leaf
  until one side is rigorously ruled out.  Cross-pollinate ideas only after
  independent agents have developed them far enough to expose their real
  strengths and gaps.
* Use computational agents throughout.  They should do exact small-case
  computation, SAT/ILP/SMT encodings, Gröbner eliminations per pattern,
  candidate branch-B searches, and counterexample searches against proposed
  intermediate lemmas.  Always validate an encoding against a known result
  first.  Computation is evidence unless converted into a rigorous general
  proof or an exact certificate completing a valid reduction.
* Search aggressively for counterexamples to proposed lemmas.  Before any
  intermediate lemma is relied on, assign agents (computational where
  possible) to attempt to refute it — configurations satisfying a *subset* of
  Γ are cheap to build and often kill overstated sublemmas.  A found
  counterexample kills the route immediately; a lemma that has survived no
  refutation attempt is not established.
* Use adversarial agents throughout — independent agents that did not produce
  the argument under audit.  Every candidate proof must be checked for:
  * use of (C2) convex independence exactly as stated (extreme points, not
    "general position");
  * K₄ always with a strictly positive radius and the correct ambient set
    (which point was deleted, and from what);
  * (C6) minimality applied with its true quantifier (all planar sets, not
    subsets of $A$) and never in a circular descent;
  * (C7) applied to *all* packets on $A$, not only the working packet $S$;
  * closed cap $C_i$ vs strict interior $C_i^{\circ}$ in every membership;
    Moser endpoints handled under the closed-cap convention;
  * exact cardinalities where hypothesized ($= 4$ in (X6)/(X7)/(H1),
    $≤ 2$ in packets) vs lower bounds elsewhere ($≥ 4$, $≥ 6$, $≥ 8$);
  * $K(x)$ used as the full radius class (both directions of exactness);
  * (H2) criticality invoked only at the deleted point's own blocker;
  * (U1) unique-radius used only at blocker values $c(x)$, never at arbitrary
    carrier points;
  * robustness/richness claimed only where given ((T1), (T4), (D6));
  * frontier data: $q_★, w_★ ∉ m$; both frontier instances kept distinct;
    (Q5)'s second arm correctly refuted via (X5)–(X7) when used;
  * collision data: equal-blocker identities used with the right pair; (X8)/
    (X9) are statements about the *strict* interior; (X10) does not by itself
    give (X11);
  * (M)-cycle facts: the designated $u, u'$ are fixed but unknown elements of
    their pairs — proofs must not assume $u = s_1$ or $u' = t_1$;
  * packet clauses used as stated (rows live in $A$ minus the deleted point
    and the center; overlap bound is $≤ 2$, not $= 2$);
  * leaf supplements: every field of (F1a)–(F4b) consumed or explicitly
    unused; disjunction arms all closed;
  * each item of §5;
  * circular use of a statement equivalent to the leaf's conclusion, to a
    sibling leaf, or to the parent coordinator.
* Require agents to return concrete lemmas, constructions, equations, exact
  certificates, encodings with validation runs, or counterexamples to proposed
  sublemmas.  Reject status reports, vague optimism, and claims that an
  unproved incidence statement is "routine."
* The root agent should repeatedly synthesize, challenge, redirect, and launch
  new rounds.  Do not stop after the first wave fails.  Produce a completed
  leaf only if it survives adversarial audit; otherwise report only the
  strongest rigorously proved derivation and its exact remaining gap.

## §8 Anti-quit block

Do not return merely because current approaches fail or agents report
theorem-strength gaps.  Continue launching new rounds, reopening blocked
approaches only when there is a genuinely new mechanism, and searching for
fresh formulations.  Spend at least six full rounds of the approach portfolio
per unresolved leaf before even thinking of returning.

## §9 Return contract

Return only when at least one leaf of {F1, F2, F3, F4} has been completely
resolved — a branch-A proof of `False` from exactly the stated hypotheses, or
a branch-B exact certificate satisfying every stated hypothesis — and the
argument survives adversarial audit.  Prefer resolving all four; report each
leaf separately.  Do not return a reduction, partial result, isolated missing
lemma, finite computation, numerical guess, "best effort" summary, or an
explanation of difficulty.  Do not stop, return, or give up until at least one
complete and rigorous resolution exists; continue exploring every plausible
approach, repairing failed arguments, and developing new ones.  If, after
exhausting the portfolio repeatedly, some leaves remain open, the final report
must state for each: the strongest rigorously proved derivation, the exact
remaining gap as a precisely stated mathematical statement, and the audit
trail of refuted intermediate lemmas.

## §10 Web-search restriction

Public search may be used only for ordinary mathematical background or
standard named theorems (convex-position distance counting, circle incidence,
real algebraic elimination), not to search for a solution to these exact
obligations, to this formalization project, or to Erdős problem 97's status.
Do not search the public web to determine whether these statements are open,
and do not answer that they are open.

---

## Appendix A — Leaf label ↔ Lean declaration

All paths relative to `lean/` in the repository
`erdos-97-96-formalization`; the section-variable block supplying Γ is
`Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7421–7469`.

| Leaf | Lean declaration | Location (sorry) |
|---|---|---|
| F1 | `Problem97.TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence` | Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7476 (:7479) |
| F2 | `…​.false_of_capSource_freshThirdBlockerFiber` | FrontierLiveClosure.lean:7486 (:7490) |
| F3 | `…​.false_of_capSource_firstFiber_collisionFiveCenterDeletion` | FrontierLiveClosure.lean:7620 (:7628) |
| F4 | `…​.false_of_capSource_freshOutsideSecondBlockerFiber` | FrontierLiveClosure.lean:7648 (:7652) |

Sorry-free neighbors (not obligations): `firstFiber_shell_eq_explicitFour`
(:7495), `capSource_firstFiber_descent` (:7554, `private`). Also
`false_of_capSource_freshOutsideFirstBlockerFiber` (:7632) — NOT sorry-free:
its proof routes through F3, so it transitively contains the F3 sorry and
closes only when F3 does.

## Appendix B — Math object ↔ Lean structure

| §1 object | Lean name | Location |
|---|---|---|
| carrier + (C1)–(C5) bundle | `CounterexampleData` | P97/U1TwoShortCapReduction.lean:83 |
| K₄ predicates | `Erdos97.HasNEquidistantPointsAt/Property` | formal_conjectures ErdosProblems/97.lean:34,48 |
| convex independence | `Problem97.ConvexIndep` | P97/Foundation.lean:28 |
| (C6) minimality | `CounterexampleData.Minimal` | P97/U1TwoShortCapReduction.lean:158 |
| (C7) $(m,4,4)$ predicate | `SurplusCapPacket.IsM44` | P97/Cap/PartitionFromMEC.lean:443 |
| radius class $S_p(r)$ | `SelectedClass` | P97/WitnessPacketInterface.lean:59 |
| MEC $(O, R_0)$ | `MEC.mec` | P97/MEC/Basic.lean:275 |
| (P2) triangle | `MEC.NonObtuseCircumscribedMoserTriangle` / structural `MoserTriangle` | P97/Moser/TriangleNonObtuse.lean:667; P97/Cap/Structure.lean:98 |
| (P3) caps + arc predicate | `CapTriple`; `OnArcOpposite`/`signedArea2` | P97/Cap/Structure.lean:161; P97/Foundation.lean:57,49 |
| packet $S$, $m$, $σ$ | `SurplusCapPacket` | P97/Cap/PartitionFromMEC.lean:332 |
| $a_0, a_1, a_2$ | `surplusApex`/`oppApex1`/`oppApex2` | P97/U1TwoShortCapReduction.lean:313,297,305 |
| $C_i$, $C_i^{\circ}$, $i_1$ | `capByIndex`/`capInteriorByIndex`/`oppIndex1` | P97/Cap/PartitionFromMEC.lean:466,474,521 |
| (H1)–(H2) system $c, r, K$ | `CriticalShellSystem` (`centerAt`, `selectedAt`, `no_qfree`); shells `CriticalFourShell`/`CriticalSelectedFourClass` | P97/U1CarrierInjection.lean:1015,547,635 |
| carrier vertex (subtype) | `CriticalShellSystem.CarrierVertex` | P97/U1CarrierInjection.lean:1111 |
| 4-point row (abstract) | `SelectedFourClass` | P97/U1CarrierInjection.lean:405 |
| packet row | `U5QDeletedK4Class` | P97/U5GlobalIncidenceBasic.lean:243 |
| $\mathrm{Packet}(x; z_1, z_2)$ | `CommonDeletionTwoCenterPacket` | P97/ATail/CommonDeletionTwoCenter.lean:29 |
| (Q1)–(Q7) frontier | `SurvivorPairRelocationPacket`; `CriticalPairFrontier`; `FirstApexSplit`/`SecondApexSplit` | P97/ATail/CriticalPairFrontier.lean:288,568,544,555 |
| (R1)–(R3) parent | `FrontierCommonDeletionResidual` / `FrontierCommonDeletionParentResidual` | P97/ATail/OrientedPhysicalApexIngress.lean:239,251 |
| (X1)–(X4) collision row | `RetainedInteriorBlockerCollision` | P97/ATail/RetainedStrictInteriorPairSelector.lean:95 |
| (M1)/(M3) common deletion | `LocalizedCollisionCommonDeletion` | P97/ATail/RetainedStrictInteriorPairSelector.lean:449 |
| (M2)/(M4) cycles | `LocalizedCollisionMutualOmissionCycle` | P97/ATail/LocalizedCollisionMutualOmissionCycle.lean:131 |
| (T1) | `FrontierBiApexRobustResidual` | P97/ATail/PhysicalSecondApexCommonDeletion.lean:171 |
| (T2) | `FrontierLargeOppositeCapsBiApexRobustResidual` | P97/ATail/LargeOppositeCapsBiApexSurface.lean:38 |
| (T3) | `FrontierAllLargeCapsBiApexRobustResidual` | P97/ATail/FrontierLiveClosure.lean:6430 |
| (T4)–(T6) | `FrontierAllLargeCapsTriApexRobustResidual` | P97/ATail/FrontierLiveClosure.lean:6527 |
| Robust / Rich | `FullyDeletionRobustAt`; `ApexRichClassStructure` | P97/ATail/DeletionRobustness.lean:27; P97/ATail/ApexRichClassStructure.lean:50 |
| (U1) | `hcriticalShellUniqueFourCover` via `IsUniqueFourCenter`/`uniqueFourClass` | P97/ATail/MinimalUniqueFourCover.lean:48,64 |
| NR | `notRobustCenters` | P97/ATail/MinimalUniqueFourCover.lean:418 |
| (F1a) | `CrossBlockerCoincidence` | P97/ATail/TwoCollisionGlobalProducer.lean:272 |
| (F2a)+(F2b) | `CapSourceThirdCanonicalRowSurface` | P97/ATail/TwoCollisionGlobalProducer.lean:291 |
| (F2b) named form | `FirstFiberCapSourceWitness` | P97/ATail/FrontierLiveClosure.lean:7521 |
| (F2c) | `FreshThirdBlockerFiber` | P97/ATail/BlockerMultiplicityGeometry.lean:70 |
| (F3a) | `FreshOutsideFirstBlockerFiber` | P97/ATail/BlockerMultiplicityGeometry.lean:115 |
| (F3c) | `FirstFiberCollisionFiveCenterDeletionResidual` / `FiveCenterDeletionSurvival` | P97/ATail/FirstFiberOverlapDescent.lean:85,39 |
| (F4b) | `FreshOutsideSecondBlockerFiber` | P97/ATail/BlockerMultiplicityGeometry.lean:161 |
| (D1) | `cross_deletion_survives_iff_not_mem_selected_support` | P97/ATail/CriticalPairFrontier.lean:755 |
| (D8)/(D9) | `selectedFourClass_inter_capByIndex_card_le_two`; `outsidePair_unique_capCenter` | P97/CapSelectedRowCounting.lean:257,283 |
| (D10)/(T5) | `card_le_four_mul_notRobustCenters` | P97/ATail/MinimalUniqueFourCover.lean:429 |
