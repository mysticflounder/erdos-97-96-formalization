# Solve prompt — Family F, Bridge 3: a proper convex-independent K₄ subcarrier contradicting minimality

Date: 2026-07-27.  Round: 2.

> **Historical-status notice (2026-07-30):** This round-2 prompt preserves a
> consumed 2026-07-27 frontier snapshot. Its four F1–F4 leaves and source line
> numbers are historical, not current obligations. The live direct frontier
> now consists of `false_of_crossBlockerCoincidence` and
> `false_of_capSourceThirdCanonicalRowSurface`. Use the closure matrix,
> computational closure plan, and generated blueprint for current status.

Scope.  Round 1 of the Family-F harness (prompt:
`docs/solve-prompts/2026-07-27-exact-collision-terminals.md`, "the F doc";
response: `docs/solve-prompts/2026-07-27-f-round1-response.md`) returned neither
a branch-A proof nor a branch-B certificate for any of the four leaves
F1–F4, and isolated four candidate *global bridges*.  This document is the
round-2 prompt for **Bridge 3**: producing, from the shared ambient
configuration Γ, a set that satisfies the exact competitor predicate of the
minimality hypothesis and is strictly smaller than the carrier — hence `False`.

The four leaves live in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`, namespace
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`
(Appendix A).  This document is **self-contained**: every hypothesis is stated
below in plain mathematics (finite point sets in $ℝ^2$, Euclidean distance,
cardinality, membership).  No access to the Lean sources is required.

---

## §1 Notation preamble and the shared ambient configuration Γ

### 1.1 Basic notation

* $ℝ^2$ is the Euclidean plane with the standard Euclidean distance; $|xy|$
  denotes the distance between points $x, y$.  All point sets are finite unless
  stated otherwise.  $|X|$ is the cardinality of a finite set $X$;
  $X \setminus Y$ is set difference.
* For $p ∈ ℝ^2$, $r ∈ ℝ$ and finite $X ⊂ ℝ^2$, the **radius class**
  ("selected class") is
  $$S^X_p(r) := \{\, q ∈ X : |pq| = r \,\}.$$
  When $X = A$ (the ambient carrier, §1.2) we write $S_p(r)$.  For $r > 0$ a
  class never contains its own center.
* **K₄ predicate.**  For finite $X ⊂ ℝ^2$ and $p ∈ ℝ^2$:
  $$K₄(X, p) :⟺ ∃\, r > 0 \text{ with } |S^X_p(r)| ≥ 4 .$$
  $X$ has the **K₄ property**, written $\mathrm{K₄Prop}(X)$, iff $K₄(X, p)$
  holds **for every** $p ∈ X$.  Note carefully: the centers range over $X$
  itself, and the four equidistant points are counted **inside $X$**.
* **Convex independence.**  Finite $X ⊂ ℝ^2$ is *convex-independent* iff every
  $x ∈ X$ satisfies $x ∉ \mathrm{conv}(X \setminus \{x\})$ — every point of $X$
  is a vertex of its convex hull.  Convex independence is inherited by every
  subset.
* **Removable vertex.**  $x$ is *removable* for $X$ iff $x ∈ X$ and
  $\mathrm{K₄Prop}(X \setminus \{x\})$.
* **Signed area.**  For $u, x, y ∈ ℝ^2$ with $u = (u_1,u_2)$ etc.:
  $$\mathrm{sa}(u, x, y) := (x_1 - u_1)(y_2 - u_2) - (y_1 - u_1)(x_2 - u_2).$$
* **Arc-side predicate.**  For a labelled triangle vertex $v_i$ with the other
  two vertices $v_j, v_k$, and a point $v$:
  $$\mathrm{Arc}(v_i; v) :⟺ \mathrm{sa}(v, v_j, v_k)\cdot\mathrm{sa}(v_i, v_j, v_k) ≤ 0,$$
  i.e. $v$ lies on the closed side of the chord $v_j v_k$ opposite to $v_i$
  (points on the chord itself satisfy the predicate — closed-cap convention).
* **Two-center common-deletion packet.**  For $x ∈ A$ and $z_1, z_2 ∈ ℝ^2$
  (relative to the carrier $A$ and blocker system $c(\cdot)$ of §1.2),
  $\mathrm{Packet}(x; z_1, z_2)$ denotes the conjunction of:
  1. $x ∈ A$, $z_1 ∈ A$, $z_2 ∈ A$, $z_1 ≠ z_2$;
  2. $K₄(A\setminus\{x\},\, z_1)$ and $K₄(A\setminus\{x\},\, z_2)$;
  3. $c(x) ≠ z_1$ and $c(x) ≠ z_2$;
  4. there exist finite $B_1, B_2 ⊂ ℝ^2$ and reals $r_1, r_2 > 0$ with, for
     $j ∈ \{1,2\}$: $B_j ⊆ (A\setminus\{x\})\setminus\{z_j\}$, $x ∉ B_j$,
     $|B_j| = 4$, every $y ∈ B_j$ satisfies $|z_j y| = r_j$; and
     $|B_1 ∩ B_2| ≤ 2$.

### 1.2 The ambient configuration Γ

Γ is exactly the hypothesis package shared by all four leaves — the content of
the Lean section-variable/`include` block at
`FrontierLiveClosure.lean:7421–7469` after recursively unfolding every
structure.  It is reproduced from the F doc §1.2, which is audited; it has
**not** been re-derived here.

> **Declared condensations relative to the F doc.**  Nothing has been dropped.
> Three presentational compressions were applied, each flagged inline below:
> (i) the frontier items (Q5), (Q7) and (R1) are stated by their *net new
> content*, with the redundancy that the F doc records noted in place;
> (ii) the mutual-omission items (M1)–(M4) are stated by their net content via
> (D13), with the packet form recorded; (iii) derived fact (D12) is stated
> without reproducing its derivation.  Every other item is verbatim in content.

#### Carrier axioms (C)

* **(C1)** $A ⊂ ℝ^2$ is finite and nonempty.
* **(C2)** $A$ is convex-independent.
* **(C3)** $\mathrm{K₄Prop}(A)$: $∀ p ∈ A,\; K₄(A, p)$.
* **(C4)** $A$ is not contained in a line.
* **(C5)** $A$ admits at least one surplus-cap packet in the sense of (P1)–(P5)
  below (the packet bundled inside the counterexample datum; it need not equal
  the working packet fixed in (P1)–(P5); its only downstream use is $|A| > 4$).
* **(C6)** **Minimality.**  For every finite $B ⊂ ℝ^2$ with $B$ nonempty,
  $B$ convex-independent and $\mathrm{K₄Prop}(B)$: $|A| ≤ |B|$.
  (Quantifies over **all** such planar sets, not merely subsets of $A$.)
  This is the hypothesis Bridge 3 attacks; §2 unfolds it exactly.
* **(C7)** **No $(m,4,4)$ packet.**  There is *no* surplus-cap packet on $A$
  (no choice of MEC-boundary non-obtuse triangle, cap triple and surplus
  designation as in (P1)–(P5), for the same carrier $A$) whose two non-surplus
  caps both have exactly $4$ points.  Quantifies over **all** packets on $A$.
* **(C8)** $|A| > 9$.

#### Working surplus-cap packet (P)

* **(P1)** **Minimum enclosing circle (MEC).**  $(O, R_0)$ is the unique pair
  with $R_0 ≥ 0$, $|pO| ≤ R_0$ for all $p ∈ A$, and $R_0$ minimal among all
  enclosing pairs.
* **(P2)** **Non-obtuse circumscribed Moser triangle.**  Points
  $v_1, v_2, v_3 ∈ A$, pairwise distinct, each with $|v_i O| = R_0$, with all
  three angles non-obtuse in inner-product form:
  $⟨v_2 - v_1, v_3 - v_1⟩ ≥ 0$, $⟨v_3 - v_2, v_1 - v_2⟩ ≥ 0$,
  $⟨v_1 - v_3, v_2 - v_3⟩ ≥ 0$.
* **(P3)** **Cap triple (closed-cap convention).**  Finite $C_1, C_2, C_3 ⊆ A$
  with (indices cyclic, cap $C_i$ "opposite" apex $v_i$):
  * $v_i ∉ C_i$ and $v_j, v_k ∈ C_i$ for $\{i,j,k\} = \{1,2,3\}$;
  * every $v ∈ A \setminus \{v_1,v_2,v_3\}$ lies in exactly one cap;
  * arc membership: for every $v ∈ A$ and each $i$,
    $v ∈ C_i ⟺ \mathrm{Arc}(v_i; v)$; so $C_i = \{v ∈ A : \mathrm{Arc}(v_i; v)\}$.
* **(P4)** **Surplus designation.**  An index $σ ∈ \{1,2,3\}$ with
  $|C_σ| > 4$.  Write $m := C_σ$.
* **(P5)** **Naming.**  $(i_1, i_2)$ are the other two indices in cyclic order
  after $σ$: $σ=1 ⇒ (2,3)$; $σ=2 ⇒ (3,1)$; $σ=3 ⇒ (1,2)$.  Apices
  $a_0 := v_σ$, $a_1 := v_{i_1}$, $a_2 := v_{i_2}$; opposite caps $C_{i_1}$,
  $C_{i_2}$.  The **strict cap interior** is
  $C_i^{\circ} := C_i \setminus \{v_j, v_k\}$ ($j,k ≠ i$).

  Derived (proven in-project, listed for orientation, not hypotheses): the
  cap-sum identity $|C_1| + |C_2| + |C_3| = |A| + 3$; $a_1 ∈ C_σ ∩ C_{i_2}$;
  each Moser vertex lies in exactly the two caps it bounds.

#### Critical shell (blocker) system (H)

* **(H1)** For every $x ∈ A$ there are given: a **blocker center**
  $c(x) ∈ A \setminus \{x\}$, a **shell radius** $r(x) > 0$, and the **exact
  shell** $K(x) := S_{c(x)}(r(x))$, such that $|K(x)| = 4$ and $x ∈ K(x)$.
  ($K(x)$ is the *entire* radius class of $A$ at that center and radius.)
* **(H2)** **Criticality.**  For every $x ∈ A$: $¬K₄(A \setminus \{x\},\, c(x))$;
  explicitly, for every $r > 0$,
  $|\{z ∈ A\setminus\{x\} : |c(x)\,z| = r\}| ≤ 3$.

  (H1)+(H2) together are the hypothesis that **no point of $A$ is removable**,
  supplied with an explicit witness map.  This is decisive for §2.

#### Two frontier instances (Q★, R★), one for each radius ★ ∈ {r, ρ}

Fixed reals $r$ and $ρ$; positivity is (D0).  For **each** ★ ∈ {r, ρ} two
independent copies of the following data are given; write $q_★, w_★$ for the
survivor pair of the instance at radius ★.

* **(Q1)** $q_★, w_★ ∈ A$, $q_★ ≠ w_★$.
* **(Q2)** $q_★, w_★ ∈ S_{a_1}(★) \setminus m$.
* **(Q3)** $K₄(A\setminus\{q_★\},\, a_2)$ and $K₄(A\setminus\{w_★\},\, a_2)$.
* **(Q4)** $c(q_★) ≠ a_2$ and $c(w_★) ≠ a_2$.
* **(Q5)** *(condensed — net content)* $K₄(A\setminus\{q_★, w_★\},\, a_1)$.
  The Lean hypothesis is a disjunction whose second arm asserts
  $|S_{a_1}(★)| ∈ \{4,5\}$ together with uniqueness of the K₄ radius at $a_1$;
  the F doc records that (X5)–(X7) refute that arm for both instances, so
  (Q5) is equivalent to its first disjunct, which is (R2).
* **(Q6)** $K₄(A\setminus\{q_★, w_★\},\, a_2)$.
* **(Q7)** *(condensed — redundant)* the Lean hypothesis is a disjunction whose
  first arm is exactly (Q6); it contributes nothing beyond (Q6).
* **(R1)** *(condensed — redundant given (X6)/(X7))* $4 ≤ |S_{a_1}(★)|$.
* **(R2)** $K₄(A\setminus\{q_★, w_★\},\, a_1)$.
* **(R3)** $\mathrm{Packet}(q_★;\, a_1, a_2)$ (§1.1; in particular $a_1 ≠ a_2$,
  $c(q_★) ∉ \{a_1, a_2\}$, and the two 4-point rows with overlap $≤ 2$).

#### The two exact collision rows (X)

* **(X1)** $s_1, s_2 ∈ A$ with $s_1 ≠ s_2$; $t_1, t_2 ∈ A$ with $t_1 ≠ t_2$.
* **(X2)** $s_1, s_2 ∈ S_{a_1}(r)$ and $t_1, t_2 ∈ S_{a_1}(ρ)$.
* **(X3)** $s_1, s_2, t_1, t_2 ∈ C_{i_1}^{\circ}$.
* **(X4)** **Blocker collisions.**  $c(s_1) = c(s_2) =: b$ and
  $c(t_1) = c(t_2) =: b'$.
* **(X5)** $ρ ≠ r$.
* **(X6)** $|S_{a_1}(r)| = 4$.  **(X7)** $|S_{a_1}(ρ)| = 4$.
* **(X8)** $S_{a_1}(r) ∩ C_{i_1}^{\circ} = \{s_1, s_2\}$.
* **(X9)** $S_{a_1}(ρ) ∩ C_{i_1}^{\circ} = \{t_1, t_2\}$.
* **(X10)** $\{s_1, s_2\} ∩ \{t_1, t_2\} = ∅$.
* **(X11)** $b' ≠ b$.

#### Robustness / richness / cover (T)

* **Definitions.**  $\mathrm{Robust}(p) :⟺ ∀ z ∈ A,\; K₄(A\setminus\{z\}, p)$.
  $\mathrm{Rich}(p) :⟺ (∃ r'' > 0:\ |S_p(r'')| ≥ 6)$ or
  $(∃\, r_1'' ≠ r_2'' > 0:\ |S_p(r_1'')| ≥ 4 \text{ and } |S_p(r_2'')| ≥ 4)$.
  $\mathrm{NR} := \{p ∈ A : ¬\mathrm{Robust}(p)\}$; $\mathrm{R} := A ∖ \mathrm{NR}$.
* **(T1)** $\mathrm{Robust}(a_2)$.
* **(T2)** $|C_{i_1}| ≥ 6$ and $|C_{i_2}| ≥ 6$.
* **(T3)** $|m| ≥ 6$.  (With (T2) and the cap-sum identity: $|A| ≥ 15$.)
* **(T4)** $\mathrm{Rich}(a_1)$, $\mathrm{Rich}(a_2)$, $\mathrm{Rich}(a_0)$.
* **(T5)** $|A| ≤ 4\,|\mathrm{NR}|$.
* **(T6)** No common circle through the three apices centered in the carrier:
  for every $p ∈ A$ and every $r'' > 0$, not all of $v_1, v_2, v_3$ lie in
  $S_p(r'')$.

#### Unique-four cover of the blocker range (U)

* **(U1)** For every $x ∈ A$: $c(x) ≠ x$; $c(x)$ is a **unique-four center** —
  $c(x) ∈ A$, $|S_{c(x)}(r(x))| = 4$, and every $ρ'' > 0$ with
  $|S_{c(x)}(ρ'')| ≥ 4$ satisfies $ρ'' = r(x)$; and the four-point class
  selected at $c(x)$ is $K(x)$.

  Net new content: **at each blocker center the shell radius is the only radius
  carrying $≥ 4$ carrier points.**

#### The mutual-omission two-cycles (M)

*(condensed — net content, via (D13); the Lean fields additionally carry
$\mathrm{Packet}(t_1; a_1, b)$, $\mathrm{Packet}(u; a_1, b')$,
$\mathrm{Packet}(s_1; a_1, b')$, $\mathrm{Packet}(u'; a_1, b)$, which by (D1)
and $\mathrm{Robust}(a_1)$ are interderivable with the memberships below.)*

* **(M1)** $t_1 ∉ K(s_1)$.
* **(M2)** There is a designated $u ∈ \{s_1, s_2\}$ with $u ∉ K(t_1)$.
* **(M3)** $s_1 ∉ K(t_1)$.
* **(M4)** There is a designated $u' ∈ \{t_1, t_2\}$ with $u' ∉ K(s_1)$.

**Warning, carried forward from the F doc's adversarial checklist:** $u$ and
$u'$ are fixed but *unknown* elements of their pairs.  No proof may assume
$u = s_1$ or $u' = t_1$.

**Warning, specific to this bridge:** the (M) items are *mutual-omission*
two-cycles — statements about shell membership.  They are **not** two-cycles of
the blocker map $x ↦ c(x)$.  See §2.4 and the named attractors in §7.

### 1.3 Established derived facts (proven in-project, kernel-checked; usable as background)

* **(D0)** $r > 0$ and $ρ > 0$ (from (Q2)).
* **(D1)** **Cross-deletion criterion.**  For all $x ∈ A$ and $w ∈ ℝ^2$:
  $K₄(A\setminus\{w\},\, c(x)) ⟺ w ∉ K(x)$.
* **(D2)** **Support locking.**  Any 4-point set $B ⊆ A$ on a common circle of
  positive radius about $c(x)$ (center not in $B$) equals $K(x)$.
* **(D3)** **Equal blockers ⇒ equal shells.**  If $c(x) = c(y)$ then
  $K(x) = K(y)$; hence $K(s_1) = K(s_2)$, $K(t_1) = K(t_2)$, and
  $s_2 ∈ K(s_1)$, $t_2 ∈ K(t_1)$.
* **(D4)** **Exact cap trace of the collision shells.**
  $K(s_1) ∩ C_{i_1} = \{s_1, s_2\}$ and $K(t_1) ∩ C_{i_1} = \{t_1, t_2\}$
  (closed cap), hence $|K(s_1) \setminus C_{i_1}| = |K(t_1) \setminus C_{i_1}| = 2$.
* **(D5)** **Blockers sit inside the cap.**  $b ∈ C_{i_1}^{\circ}$ and
  $b' ∈ C_{i_1}^{\circ}$.
* **(D6)** $\mathrm{Robust}(a_1)$; and $\mathrm{Rich}(p) ⇒ \mathrm{Robust}(p)$,
  so (T4) gives $\mathrm{Robust}(a_0)$, $\mathrm{Robust}(a_1)$,
  $\mathrm{Robust}(a_2)$.
* **(D7)** **Robust points are never blocker values.**  A robust center is not
  a unique-four center; with (U1), $c(x) ∉ \{a_0, a_1, a_2\}$ for every $x ∈ A$.
* **(D8)** **Cap two-point row bound.**  For any center $z ∈ C_i$ (closed cap,
  any $i$) and any 4-point $B ⊆ A$ on a common positive-radius circle about $z$
  with $z ∉ B$: $|B ∩ C_i| ≤ 2$.  (Uses (C2).)
* **(D9)** **Off-cap pair has at most one cap bisector point.**  If
  $c ≠ d ∈ C_i$ (closed cap) and $a ≠ b ∈ A$ with $a, b ∉ C_i$, then not both
  $|ca| = |cb|$ and $|da| = |db|$.  (Uses (C2).)
* **(D10)** **Minimality cover.**  From (C6): every $x ∈ A$ lies in the unique
  four-point class of some unique-four center; quantitatively $|A| ≤ 4\,|U|$
  where $U$ is the set of unique-four centers.  (T5) restates this with
  $U = \mathrm{NR}$ — a disclosed strengthening of the F doc's
  $U ⊆ \mathrm{NR}$, kernel-backed in both directions
  (`MinimalUniqueFourCover.lean:159` gives ⊆; `:235` gives ⊇ for
  $p ∈ A$); see §6.1 for the exact statement and its exact limits.
* **(D11)** **Two-circle bound.**  Two circles with distinct (center, radius)
  pairs share at most two points; hence $|K(x) ∩ K(y)| ≤ 2$ whenever
  $(c(x), r(x)) ≠ (c(y), r(y))$, and $|K(x) ∩ S_p(r'')| ≤ 2$ whenever
  $(c(x), r(x)) ≠ (p, r'')$.
* **(D12)** *(condensed)* **Explicit four-point row.**  Under F3's hypothesis
  (F3a): $K(s_1) = \{s_1, s_2, e, o\}$.  Symmetrically under (F4b):
  $K(t_1) = \{t_1, t_2, e, o\}$.
* **(D13)** **Deletion-survival reduction of packets.**  By (D1),
  $\mathrm{Packet}(x; a_1, z)$ with $z = c(y)$ contains the information
  $x ∉ K(y)$; conversely $x ∉ K(y)$ plus $\mathrm{Robust}(a_1)$ reconstructs
  such a packet.  This is what licenses the (M) condensation above.

### 1.4 Interface assumptions

* The MEC $(O, R_0)$ of (P1) is given exact data satisfying the stated
  enclosing/minimality/uniqueness properties; nothing else about it is assumed.
* The ordered-cap machinery behind (D8)/(D9) is used only through those two
  stated consequences.
* (C6) and (C7) are stated exactly above; they are the only hypotheses
  quantifying over objects outside the fixed configuration.  §2 unfolds (C6)
  and nothing else.

### 1.5 The four leaf supplements (for reference only)

The bridge targets Γ itself, so the leaf supplements are optional extra
hypotheses (§2.5).  Stated compactly:

* **F1** adds **(F1a)**: $b = t_1$ or $b = t_2$ or $b' = s_1$ or $b' = s_2$.
* **F2** adds **(F2a)** $|C_{i_1}| ≥ 8$; **(F2b)** a *cap source* $g ∈ A$ with
  $g ∈ C_{i_1}^{\circ}$, $g ∉ \{s_1,s_2,t_1,t_2\}$,
  $c(g) ∉ \{b, b', a_1, a_2\}$, $|K(g)| = 4$, $g ∈ K(g)$, and
  ($s_1 ∉ K(g)$ or $s_2 ∉ K(g)$) and ($t_1 ∉ K(g)$ or $t_2 ∉ K(g)$);
  **(F2c)** a *third* blocker collision: $x ≠ y$ in $A$ with $c(x) = c(y)
  ∉ \{b, b'\}$ and $x, y ∉ \{s_1,s_2,t_1,t_2\}$.
* **F3** adds **(F3a)** an enlarged first fiber: $e ∈ A$ with $c(e) = b$,
  $e ∉ \{s_1,s_2,t_1,t_2\}$, $e ∉ C_{i_1}$, and $o ∈ A$ with $o ≠ e$,
  $o ∉ \{t_1,t_2\}$, $o ∈ K(s_1)$, $o ∉ C_{i_1}$, and
  $K(s_1) \setminus C_{i_1} = \{e, o\}$; **(F3b)** = (F2a) ∧ (F2b);
  **(F3c)** a four-armed five-center deletion residual (see the F doc §2).
* **F4** adds **(F4a)** = (F2a) ∧ (F2b); **(F4b)** the mirror enlarged second
  fiber: $e ∈ A$ with $c(e) = b'$, $e ∉ \{s_1,s_2,t_1,t_2\}$, $e ∉ C_{i_1}$,
  and $o ∈ A$ with $o ≠ e$, $o ∉ \{s_1,s_2\}$, $o ∈ K(t_1)$, $o ∉ C_{i_1}$,
  and $K(t_1) \setminus C_{i_1} = \{e, o\}$.

---

## §2 Target statement

### 2.1 The minimality field, unfolded exactly

(C6) is the Lean field `CounterexampleData.Minimal`
(`P97/U1TwoShortCapReduction.lean:158`), whose definition is *verbatim*:

$$\mathrm{Minimal}(A) \;:⟺\; ∀\,B ⊂_{\text{fin}} ℝ^2,\;\;
B ≠ ∅ \;⟶\; \mathrm{ConvexIndep}(B) \;⟶\; \mathrm{K₄Prop}(B)
\;⟶\; |A| ≤ |B| .$$

Define the **competitor predicate**

$$\boxed{\;\mathrm{Comp}(B) \;:⟺\; B ≠ ∅ \;∧\; \mathrm{ConvexIndep}(B) \;∧\;
\mathrm{K₄Prop}(B)\;}$$

Exactly three conditions.  Read them at full precision:

1. **Nonemptiness.**  $B ≠ ∅$.  Nothing more; no lower bound on $|B|$.
2. **Convex independence** of $B$ — in the extreme-point form of §1.1, matching
   the upstream `EuclideanGeometry.ConvexIndep` on the coerced set
   (`P97/Foundation.lean:28`).
3. **$\mathrm{K₄Prop}(B)$** in its exact quantifier form:
   $$∀\, p ∈ B,\ ∃\, ρ > 0,\ \bigl|\{\, q ∈ B : |pq| = ρ \,\}\bigr| ≥ 4 .$$
   The center ranges over **all** of $B$; the four points are counted **inside
   $B$**; the radius is **strictly positive**; the count is $≥ 4$, and the
   radius may depend on $p$.

There is **no** further side condition.  In particular the competitor $B$ is
**not** required to: have a surplus-cap packet, be packet-free, be minimal
itself, have any prescribed cardinality, contain or avoid any named point, or
bear any relation whatsoever to $A$.

The conclusion of the field is $|A| ≤ |B|$.

### 2.2 Branch-A goal

> **Bridge 3 (branch A).**  From Γ, exhibit a finite $B ⊂ ℝ^2$ with
> $\mathrm{Comp}(B)$ and $|B| < |A|$, and thereby derive `False`.

The derivation of `False` from such a $B$ is one line: (C6) applied to $B$
gives $|A| ≤ |B| < |A|$.

A candidate $B$ that fails **one** of the three conditions of $\mathrm{Comp}$
is not a bridge.  In particular a $B$ whose convex independence is unverified,
or for which the K₄ property has been checked at *some* centers only, or for
which the four equidistant points were counted in $A$ rather than in $B$, does
not qualify (§5).

### 2.3 Why $B ⊆ A$ is the only sensible shape

(C6) quantifies over **all** finite planar $B$, not only subsets of $A$.  That
extra freedom is illusory here:

* A free-standing $B ⊄ A$ with $\mathrm{Comp}(B)$ is, by itself, a nonempty
  convex-independent planar set with the K₄ property — i.e. exactly the object
  whose non-existence is the affirmative form of the enclosing Erdős problem
  (`FormalConjectures/ErdosProblems/97.lean:76–77`:
  `∀ A : Finset ℝ², A.Nonempty → ConvexIndep A → ¬HasNEquidistantProperty 4 A`).
  Constructing one resolves the enclosing problem outright; it is not a route
  *inside* this bridge, and any agent that believes it has one must report it as
  what it is.
* For $B ⊆ A$, convex independence is **free** from (C2) by inheritance
  (`ConvexIndep.mono`, `P97/ConvexIndepHelpers.lean:22`), and $|B| < |A|$ is
  equivalent to $B ≠ A$.  So for subcarriers the target collapses to a single
  condition:
  $$\boxed{\;\text{find } ∅ ≠ B ⊊ A \text{ with } \mathrm{K₄Prop}(B).\;}$$

The in-tree statement of exactly this is
`ATailGlobalMinimalDeletion.not_hasNEquidistantProperty_of_nonempty_proper_subset`
(`P97/ATail/GlobalMinimalDeletion.lean:32`): under (C6), every nonempty proper
subset of $A$ **fails** $\mathrm{K₄Prop}$.  Bridge 3 is the production of a
counterexample to that statement's conclusion from the rest of Γ.

Write $U := A ∖ B$ throughout, so $U ≠ ∅$ and $B = A ∖ U ≠ ∅$.

### 2.4 Sub-shape (a): single-point deletion, and the exact reason it is closed

$B = A ∖ \{x\}$ requires precisely: $∀ p ∈ A∖\{x\},\ K₄(A∖\{x\}, p)$, i.e. $x$
is a **removable vertex** (`IsRemovableVertex`, `P97/SmallerCounterexample.lean:25`).

Relation to deletion-robustness.  The project's robustness predicate
`FullyDeletionRobustAt D p` (`P97/ATail/DeletionRobustness.lean:27`) is the
*dual* quantification: it fixes the **center** $p$ and quantifies over the
deleted point ($\mathrm{Robust}(p)$ of §1.2).  Removability of $x$ fixes the
**deleted point** and quantifies over centers.  The set
$\mathrm{NR} = $ `notRobustCenters D` (`P97/ATail/MinimalUniqueFourCover.lean:418`)
is $\{p ∈ A : ¬\mathrm{Robust}(p)\}$, and by
`not_isUniqueFourCenter_of_fullyDeletionRobust` (:159) together with
`isUniqueFourCenter_of_not_fullyDeletionRobust` (:235) it coincides, for
$p ∈ A$, with the set of unique-four centers.  These are *different* objects
from removability and must not be conflated.

**Audited obstruction (derive it yourself; it is one line from Γ).**  For every
$x ∈ A$, $c(x) ∈ A ∖ \{x\}$ by (H1) and $¬K₄(A∖\{x\}, c(x))$ by (H2).  Hence
$\mathrm{K₄Prop}(A ∖ \{x\})$ fails at the center $c(x) ∈ A∖\{x\}$.  Therefore:

> **No single-point deletion is a Bridge-3 witness.**  Under Γ, every
> $B = A∖\{x\}$ violates $\mathrm{K₄Prop}$.  Every candidate must satisfy
> $|U| = |A ∖ B| ≥ 2$.

This is not a difficulty claim; it is a hypothesis of Γ, made explicit.  (H1)
and (H2) *are* the assertion that $A$ has no removable vertex, packaged with a
witness map.  A "proof" that some $x$ is removable, obtained without first
deriving `False`, is unsound; discard it.  (In Lean: `CriticalShellSystem.no_qfree_at`,
`P97/U1CarrierInjection.lean:1041`, with `centerAt_ne_source`,
`P97/ATail/MinimalUniqueFourCover.lean:269`.)

### 2.5 Sub-shape (a′): the deleted set must be closed under the blocker map

The single-deletion argument generalizes and yields the sharp necessary
condition on $U$.

> **(N) Blocker-invariance.**  Let $∅ ≠ U ⊆ A$ with $B := A ∖ U ≠ ∅$.  If
> $\mathrm{K₄Prop}(B)$ then $c(U) ⊆ U$.
>
> *Proof.*  Let $x ∈ U$ and suppose $c(x) ∉ U$.  Then $c(x) ∈ A ∖ U = B$.
> Since $B ⊆ A ∖ \{x\}$, for every $ρ>0$ we have
> $S^B_{c(x)}(ρ) ⊆ S^{A∖\{x\}}_{c(x)}(ρ)$, and (H2) bounds the latter by $3$.
> So $¬K₄(B, c(x))$ with $c(x) ∈ B$, contradicting $\mathrm{K₄Prop}(B)$. ∎

Consequences, all immediate:

* $U$ contains the whole forward $c$-orbit of each of its elements.  Since $A$
  is finite and $c$ has **no fixed point** ((H1): $c(x) ≠ x$), every nonempty
  $c$-invariant set contains a **cycle of the functional digraph** $x ↦ c(x)$
  of length $≥ 2$.  The minimal nonempty $c$-invariant sets are exactly those
  cycles.
* A cycle $Z$ satisfies $c(Z) = Z ⊆ \mathrm{ran}(c)$, and by (D7)
  $\mathrm{ran}(c) ∩ \{a_0, a_1, a_2\} = ∅$.  So **no Moser apex lies on a
  $c$-cycle**; the smallest candidate deletion sets avoid $a_0, a_1, a_2$.
* $|U| = 2$ forces an exact blocker **2-cycle**: $U = \{x,y\}$ with $c(x) = y$
  and $c(y) = x$.  Then $x ∈ K(x) = S_y(r(x))$ and $y ∈ K(y) = S_x(r(y))$, so
  $r(x) = |xy| = r(y)$: both shells have radius $|xy|$, and by (U1) that common
  value is the unique K₄ radius at $x$ and at $y$.
* Γ names **no** $c$-cycle.  (X4) gives the fibers $c^{-1}(b) ⊇ \{s_1,s_2\}$
  and $c^{-1}(b') ⊇ \{t_1,t_2\}$, but says nothing about $c(b)$ or $c(b')$.
  The (M) items are shell-membership omissions, **not** $c$-cycles.

Combining (N) with the definition, the subcarrier route has this exact,
fully specified form:

> **(B-SHAPE)** Find $∅ ≠ U ⊊ A$ such that
> **(i)** $c(U) ⊆ U$, and
> **(ii)** for every $p ∈ A ∖ U$ there is $ρ > 0$ with
> $\bigl|S_p(ρ) ∖ U\bigr| ≥ 4$.
>
> Then $B := A ∖ U$ satisfies $\mathrm{Comp}(B)$ and $|B| < |A|$, and (C6)
> gives `False`.

Notes on (ii), to be checked and not assumed:

* For $p ∈ \mathrm{NR} ∖ U$ the point $p$ is a unique-four center by (U1)-type
  reasoning: it has exactly one K₄ radius, with class of exactly four points.
  So (ii) at such $p$ is equivalent to $K_p ∩ U = ∅$ where $K_p$ is that unique
  class.  **No slack.**
* For $p ∈ \mathrm{R} ∖ U$ robustness alone is *insufficient* once $|U| ≥ 2$:
  $\mathrm{Robust}(p)$ only asserts survival of each **single** deletion.  Under
  (T4)/$\mathrm{Rich}(p)$, a class with $|S_p(r'')| ≥ 6$ survives $|U| ≤ 2$; but
  the two-distinct-radii disjunct of $\mathrm{Rich}$ can be broken by a
  two-element $U$ hitting both classes.  Each apex must be checked against the
  actual $U$.

### 2.6 Sub-shape (b): counting refinements

See §6.1 for the exact cover bound, the exact ledger it induces, and the exact
numerical threshold a counting route must cross.  Summary of the target there
(the robust-count form; §6.1 also gives the weaker-to-trigger excess form
$E > \tfrac34|A|$, which suffices on its own):
$$4\,|\mathrm{NR}| < |A| \quad\Longleftrightarrow\quad |\mathrm{R}| > \tfrac34 |A| ,$$
i.e. at least $12$ deletion-robust carrier points when $|A| = 15$ and at least
$13$ when $|A| = 17$ — against the three that Γ names.  Restating $|A| ≤ 4|\mathrm{NR}|$
is not progress (§5).

### 2.7 Leaf coupling

Γ is shared verbatim by F1, F2, F3, F4 (it is the section-variable/`include`
block, `FrontierLiveClosure.lean:7421–7469`), and (C6) enters every leaf as the
field `minimal` of the parent residual `R`
(`FrontierCommonDeletionParentResidual.minimal`,
`P97/ATail/OrientedPhysicalApexIngress.lean:255`), which is in scope in all four
leaf proofs.  Therefore:

> **A branch-A resolution of Bridge 3 from Γ alone closes all four leaves
> F1–F4 simultaneously**, and also discharges the parent producer branch, since
> it shows the shared package Γ is contradictory.

A *weaker but still complete* outcome is admissible: a Bridge-3 witness derived
from Γ **plus one leaf's supplement** (§1.5) closes that leaf.  Report clearly
which hypotheses were used.  Γ-only is strictly preferred and strictly
stronger.

---

## §3 Assume-resolvable framing

Assume for purposes of this task that Bridge 3 admits a complete resolution,
but do not assume in advance which direction it takes.  A complete resolution
must prove exactly one of the two statements in §4.  Do not assume that the
bridge holds; do not assume that it fails.  Both branches are to be developed
in parallel and at equal depth until one is rigorously ruled out.

---

## §4 Dual-branch success criteria

### Branch A — derivation of the subcarrier

A complete, rigorous proof that Γ (optionally plus one named leaf supplement
from §1.5) implies the existence of a finite $B ⊂ ℝ^2$ with $\mathrm{Comp}(B)$
and $|B| < |A|$; equivalently, by §2.3/§2.5, a proof of **(B-SHAPE)**.  It must:

* be valid for **every** configuration satisfying the hypotheses, using each
  hypothesis only as stated;
* verify all three conjuncts of $\mathrm{Comp}(B)$ explicitly — including
  $\mathrm{K₄Prop}(B)$ at **every** $p ∈ B$, with the four equidistant points
  counted inside $B$ and the radius strictly positive;
* handle **every arm** of every disjunctive hypothesis it consumes ((F1a),
  (F2b) 8–9, (F3c), (Q5), and the two disjuncts of $\mathrm{Rich}$);
* be formalizable in Lean 4 with mathlib, no new axioms; the in-project facts
  (D0)–(D13) and §6 may be used as established;
* use no additional assumptions such as: general position beyond (C2);
  genericity of the radii $r(x)$; injectivity or any cycle structure of the
  blocker map $x ↦ c(x)$ beyond (X4)/(X11)/(F2c) and the derived (N);
  symmetric placement of off-cap shell points; exact cap size
  $|C_{i_1}| = 8$; boundedness of $|A|$; or any unstated incidence.

Producing $B$ **non-constructively** is acceptable (an existence proof of a
$c$-invariant $U$ with property (ii) is a proof), but the existence argument
must establish property (ii) for **every** remaining center, not for a named
list.

### Branch B — exact certificate that the bridge is not a consequence

A fixed configuration satisfying **every** hypothesis of Γ (and, if the claim
is leaf-scoped, of that leaf's supplement), in which no proper subcarrier
satisfies the competitor predicate — with every clause verified exactly
(symbolic algebra over ℚ or an explicitly presented real algebraic field, never
floating point).

**Read this next paragraph before starting branch B.**  Since (C6) *is* a
hypothesis of Γ, the "no proper competitor" conclusion is automatic in any
model of Γ: for $B ⊊ A$ convex independence is inherited, so (C6) already
forbids $\mathrm{Comp}(B)$ with $|B| < |A|$.  Consequently **branch B for
Bridge 3 is exactly a full realizability certificate for Γ**.  Its
consequences, stated plainly:

* It kills not only Bridge 3 but the **entire Family-F closure route**: all
  four leaves F1–F4 become unprovable, and so does their parent coordinator.
* Its carrier $A$ is nonempty, convex-independent, satisfies
  $\mathrm{K₄Prop}(A)$, and has $|A| ≥ 15$ ((T2)+(T3)+cap-sum; $|A| ≥ 17$ if
  (F2a) is included).  That is precisely a counterexample to the affirmative
  form of the enclosing Erdős problem as formalized at
  `FormalConjectures/ErdosProblems/97.lean:76–77`.
* Every universally quantified item must be certified, not asserted: (C6)
  minimality over **all** smaller planar convex-independent K₄ sets; (C7) over
  **all** surplus-cap packets on $A$; (U1)'s unique-radius clause over **all**
  positive radii at each blocker center; (T5), (T6); and all negative
  membership facts.  Radius-quantified items are finite checks (only finitely
  many pairwise distances occur).  (C6) is **not** a finite check as stated and
  requires an exact finite reduction, proved.

This outcome is **equally valuable** as branch A and must be reported as such,
not soft-pedaled.  It is also, by the above, at least as hard as the enclosing
problem — which is a statement of scope, not a discouragement.

**Calibration — the K₄-propagation obstruction.**  The strongest existing exact
local construction is the 15-point rational carrier $A_0$ recorded at
`scratch/full-local-euclidean-model-complete/REPORT.md` (checker:
`check_model.py`, exact rational arithmetic).  It is in strict convex position
(all $\binom{15}{3} = 455$ ordered-triple determinants positive over ℚ) and
carries four exact carrier-level four-point classes.  It nonetheless fails Γ
early and badly:

* pinned multiplicities are $O=4$, $c=4$, $d=4$ and $1$ at the other twelve
  centers — so $\mathrm{K₄Prop}$ **fails at twelve of fifteen centers**;
* its MEC boundary is exactly $\{a, l\}$ (the diameter branch), so the
  three-distinct-boundary-point field of the surplus-cap packet cannot hold and
  the model has **no** production MEC-derived cap packet;
* only eight of fifteen sources admit a legal critical row, so **no**
  `CriticalShellSystem` exists on it;
* full deletion robustness holds at exactly **one** center ($O$), so the three
  rich/robust-apex fields of the tri-apex residual can never hold together.

Furthermore (`scratch/full-local-euclidean-model-complete/K4_EXTENSION_OBSTRUCTION.md`,
checker `check_k4_extension_bound.py`): at twelve of the fifteen centers every
positive-radius distance class inside $A_0$ is a **singleton**; if a finite
planar $B ⊇ A_0$ has $\mathrm{K₄Prop}(B)$, then choosing for each of those
twelve centers a three-element subset of the new points on one of its classes
gives an injection (two centers equidistant from three pairwise-distinct points
coincide, by `eq_of_dist_eq_three_of_pairwise_ne`,
`P97/N4d/SmallSReductions.lean:324`), whence $12 ≤ \binom{|B ∖ A_0|}{3}$ and,
since $\binom{5}{3} = 10$,
$$|B ∖ A_0| ≥ 6 .$$
This is a finite extension lower bound, **not** a proof that no larger K₄
extension exists.  These computations are exact-rational and re-runnable via
the named scripts; they are **not** kernel-checked in Lean.

**Consequence for branch B:** partial local models do **not** qualify.  A
construction that satisfies the local circle/cap/collision data but misses any
global hypothesis is worthless for branch B and belongs on the §5 list.  The
all-center K₄ propagation problem must be solved **before** (C6), (C7) or the
tri-apex conditions are even reached.

### Quantifier order

Branch A must treat all Γ-data as universally given (arbitrary) and produce the
competitor uniformly.  Branch B chooses everything existentially but must then
verify all Γ-clauses **including their internal universal quantifiers**.

---

## §4b Sanctioned reformulations

* **Subcarrier reduction (proved, §2.3).**  For $B ⊆ A$, $\mathrm{Comp}(B)$ is
  equivalent to $B ≠ ∅$ and $\mathrm{K₄Prop}(B)$; convex independence is
  inherited from (C2).  Free to use.
* **Blocker-invariance (proved, §2.5).**  $\mathrm{K₄Prop}(A∖U)$ with
  $A∖U ≠ ∅$ implies $c(U) ⊆ U$.  Free to use, in that direction only — it is
  **necessary**, not sufficient.
* **Blocker-digraph formulation.**  (H1)+(H2)+(U1) are equivalent to: a
  function $c : A → A$ with no fixed point, such that each $p ∈ \mathrm{ran}(c)$
  carries exactly one K₄ radius whose class $K_p$ has exactly $4$ points, with
  $c^{-1}(p) ⊆ K_p$.  **Warning:** $c^{-1}(p)$ need not exhaust $K_p$, and
  points of $K_p$ need not have blocker $p$.  Any functional-digraph
  reformulation must preserve exactly this asymmetry.
* **Semialgebraic encoding.**  For a fixed carrier size $n$ and a fixed
  combinatorial type (cap assignment, blocker map, incidence pattern of the
  shells), each hypothesis set is a finite conjunction of polynomial equations
  and inequalities over $ℝ^{2n}$.  Pattern-by-pattern work is permitted, but:
  the enumeration of types must be **proved** exhaustive; (C6) is **not**
  semialgebraic in the fixed-$n$ encoding and must be handled separately; and a
  quantifier-elimination or Positivstellensatz certificate for one pattern
  eliminates only that pattern.

---

## §5 Insufficient-progress list

Partial progress does not count unless it implies exactly one of the two
resolutions of §4.  In particular, the following are insufficient:

* **restating $|A| ≤ 4|\mathrm{NR}|$, or any algebraic rearrangement of it** —
  including $|\mathrm{R}| ≤ \lfloor 3|A|/4 \rfloor$, $|A| ≤ 4|\mathrm{ran}(c)|$,
  the fiber-excess identity $E = |A| - |\mathrm{ran}(c)|$, or the observation
  that the three robust apices force $E ≥ 3$.  All of these are already
  established in §6.1 and none is a contradiction;
* a candidate $B$ that fails **one** conjunct of $\mathrm{Comp}$: convex
  independence unverified; $\mathrm{K₄Prop}$ verified at some centers only; the
  four equidistant points counted in $A$ rather than inside $B$; radius zero
  or unsigned; the count taken as $≥ 3$ or as "$4$ distinct distances";
* a **deletion-robust point argument** that verifies robustness only for the
  named classes or the named centers, rather than for every center the
  predicate requires — i.e. every $p ∈ B$, including all points of
  $C_{i_1}^{\circ}$, both blockers $b, b'$, all of $m$, and both other caps;
* any claim that some single $x ∈ A$ is removable (refuted by (H1)/(H2), §2.4),
  or any $U$ with $c(U) ⊄ U$ (refuted by (N), §2.5);
* treating the (M) mutual-omission two-cycles as blocker $c$-cycles, or
  asserting a $c$-cycle that Γ does not supply;
* asymptotic, generic-position, or "for large $n$" arguments; statements that
  hold for all sufficiently large carriers but not for the given one;
* conditional results ("if additionally the blocker map has a 2-cycle …",
  "if additionally $c(g) ∈ C_{i_1}$ …") unless the condition is itself proved
  from Γ;
* numerical evidence: floating-point near-configurations, sampling, or
  interval-arithmetic exclusion of a bounded parameter region without a proof
  that the region covers all configurations satisfying the hypotheses;
* solver output (SAT/SMT/Gröbner/interval) without a verifiable certificate or
  a kernel-checkable reconstruction, or with an unvalidated encoding (every
  encoding must first pass a smoke test against a known small instance);
* for branch B: **partial model extensions** — a construction satisfying the
  local circle/cap/collision data but failing all-center K₄, or lacking a
  production MEC packet, or lacking a full critical-shell system, or lacking
  three rich/robust apices, or omitting the (C6)/(C7)/(U1)/(T5)/(T6)
  certification.  A configuration failing even one hypothesis of Γ is worthless
  for branch B;
* for branch B: an extension of the 15-point model of §4 obtained by "filling
  in names and packet rows"; the report cited there shows this cannot work, and
  the $≥ 6$-new-vertices bound applies;
* combinatorial (oriented-matroid level) consistency or inconsistency of an
  incidence pattern without metric realization or metric elimination;
* modified-problem results: conclusions for non-convex carriers, for open caps
  where a hypothesis says closed cap (or conversely), for "some cap" instead of
  the indexed cap $C_{i_1}$, or with $≥ 4$ where a hypothesis says $= 4$;
* proving the bridge by citing an unproved leaf F1–F4, a sibling bridge, the
  parent coordinator, or any of its unproved consumers;
* **round-1-refuted routes re-presented as new** (named traps, §7): a cross-hit
  construction; a three-hit construction; deriving a common support point from
  a blocker two-cycle; two-circle counting sharpened past $|K(x) ∩ K(y)| ≤ 2$;
  ordered-cap/Kalmanson arguments requiring a non-alternating order; producing
  a second distinct cap bisector center for an off-cap pair by relabeling;
  manufacturing an `IsM44` packet by relabeling the working triangle;
* reducing the problem to another unproved planar incidence, cap-counting, or
  minimality statement of comparable strength — for example "the blocker map
  has a 2-cycle", "some $c$-invariant set of size 2 exists whose deletion
  preserves K₄ everywhere", "more than three quarters of a minimal carrier is
  deletion robust", or "every minimal carrier has a proper K₄ subcarrier".  A
  route that ends at an unproved lemma equivalent in strength to the original
  problem is not close to completion unless it supplies a genuinely new proof
  of that lemma.

---

## §6 Allowed background

Standard proved theorems from planar Euclidean geometry, finite combinatorics
and convexity may be used, but they must be stated accurately and applied with
all necessary hypotheses: two distinct circles meet in at most two points; the
perpendicular-bisector characterization of equidistance; a point equidistant
from three pairwise-distinct points is unique; basic convex-position facts;
pigeonhole; double counting.  Mathlib's `EuclideanGeometry` and `Finset`
libraries set the formalization baseline.

The in-project facts (D0)–(D13) of §1.3 are established background, each
kernel-checked at the location in Appendix A.  They mean exactly what §1.3
states.  In particular (D8)/(D9) are statements about **closed indexed caps of
the working packet** and require (C2); they do **not** extend to arbitrary
subsets of $A$, and (D9) does **not** bound bisector points of pairs that are
not both outside the cap.

Known results on repeated distances in convex position (Erdős–Moser-type
bounds, Edelsbrunner–Hajnal, Füredi) may be used only as accurately stated
published theorems with all hypotheses.  They do not by themselves settle this
bridge.

### 6.1 The unique-four cover bound — exact statement, and exactly what it does not give

**Statement (established, kernel-checked).**  Call $p ∈ A$ a *unique-four
center* iff $p ∈ A$ and there is $r > 0$ with $|S_p(r)| = 4$ and every $ρ > 0$
with $|S_p(ρ)| ≥ 4$ satisfies $ρ = r$
(`IsUniqueFourCenter`, `P97/ATail/MinimalUniqueFourCover.lean:48`).  Write
$K_p$ for that class (`uniqueFourClass`, :64), and $U_4$ for the set of
unique-four centers.  Then, from (C6):

1. **Cover.**  Every $x ∈ A$ lies in $K_p$ for some unique-four center
   $p ≠ x$ (`exists_isUniqueFourCenter_of_minimal`, :101).
2. **Cardinality.**  $|A| ≤ 4\,|U_4|$
   (`card_le_four_mul_uniqueFourCenters`, :394).
3. **Robustness form.**  $U_4 = \mathrm{NR}$ as subsets of $A$ — a robust
   center is not a unique-four center (:159) and a non-robust carrier point is
   one (:235) — so $|A| ≤ 4\,|\mathrm{NR}|$
   (`card_le_four_mul_notRobustCenters`, :429).  This is item (T5) of Γ.
4. **Blocker range.**  Each $c(x)$ is a unique-four center with class $K(x)$
   ((U1); `isUniqueFourCenter_centerAt`, :257), and $x ∈ K(x)$
   (`source_mem_uniqueFourClass_centerAt`, :296).  Hence
   $\mathrm{ran}(c) ⊆ U_4 = \mathrm{NR}$, and $c^{-1}(p) ⊆ K_p$ so
   $|c^{-1}(p)| ≤ 4$ for every $p ∈ \mathrm{ran}(c)$.

**The exact ledger it induces.**  Put $E := |A| - |\mathrm{ran}(c)|
= \sum_{p ∈ \mathrm{ran}(c)} (|c^{-1}(p)| - 1) ≥ 0$, the total *blocker-fiber
excess*.  Then, from item 4:
$$|A| \;=\; \sum_{p∈\mathrm{ran}(c)} |c^{-1}(p)| \;≤\; 4\,|\mathrm{ran}(c)|
\;=\; 4\,(|A| - E), \qquad\text{i.e.}\qquad 4E ≤ 3|A| .$$
And from (D6)+(D7), $\mathrm{ran}(c)$ omits $a_0, a_1, a_2$, so
$|\mathrm{ran}(c)| ≤ |A| - 3$, i.e.
$$E ≥ 3 .$$

**What this means — read it carefully.**  The three robust apices *force* at
least three units of blocker-fiber excess, and the named collisions supply
exactly that much: $c^{-1}(b) ⊇ \{s_1,s_2\}$ and $c^{-1}(b') ⊇ \{t_1,t_2\}$ by
(X4) — items of Γ — contribute two units, and the third fiber of (F2c) — a
leaf supplement of F2–F4, not an item of Γ (§1.5) — a third.  From Γ alone
only the two collision units are named.  Round 1 recorded
this as *"three collision-fiber excesses can exactly account for the three
robust apices"* — the ledger **balances**, and the plain bound yields no
contradiction.  Quantitatively, with $|A| ≥ 15$ the cardinality bound
$|A| ≤ 4|\mathrm{NR}|$ reduces, given only the three named robust points, to
$|A| ≤ 4|A| - 12$, i.e. $|A| ≥ 4$ — **vacuous**.

**Therefore: the bound does not imply anything usable as stated.**  It does not
imply that a subcarrier exists; it does not imply that any fiber is large; it
does not bound $|A|$; it does not bound the number of collisions.

**What breaking the accounting actually requires.**  Two forms, each an
internally correct biconditional but *not* equivalent to one another (since
$\mathrm{ran}(c) ⊆ \mathrm{NR}$, the second is strictly weaker to trigger —
it is implied by the first and already contradicts $|A| ≤ 4|\mathrm{ran}(c)|$
on its own):
$$4\,|\mathrm{NR}| < |A| \iff |\mathrm{R}| > \tfrac34 |A|
\qquad\text{or the weaker-to-trigger}\qquad
4\,|\mathrm{ran}(c)| < |A| \iff E > \tfrac34 |A| .$$
At $|A| = 15$ that is $|\mathrm{R}| ≥ 12$, equivalently $|\mathrm{ran}(c)| ≤ 3$
and $E ≥ 12$.  At $|A| = 17$ (leaves F2–F4, via (F2a)) it is
$|\mathrm{R}| ≥ 13$, equivalently $|\mathrm{ran}(c)| ≤ 4$ and $E ≥ 13$.

So a counting route must do one of:

* **(K1)** exhibit further excess — but note the arithmetic above: a *fourth*
  excess unit alone changes nothing, because $E ≥ 3$ is already forced and
  $E ≥ 4$ remains consistent.  Excess is useful only if driven to
  $E > \frac34 |A|$, i.e. if the blocker map is shown to take at most
  $\lceil |A|/4 \rceil - 1$ distinct values.  A mechanism producing excess
  *proportional to $|A|$* is what is wanted, not another named fiber;
* **(K2)** harvest robust points up to more than three quarters of the carrier.
  The in-tree docstring at `P97/ATail/MinimalUniqueFourCover.lean:421–428`
  records the project's assessment of this route verbatim: *"a contradiction
  needs MORE than three quarters of the carrier to be deletion robust.
  Harvesting robustness at distinguished points yields a bounded number of
  them, so no fixed number of such harvests reaches this bound as `n` grows."*
  (This is a project note, not a theorem.)  Any (K2) route must therefore
  supply an $n$-growing harvest mechanism, not a fixed list of apices;
* **(K3)** show a fiber excess is **incompatible** with the exact collision
  rows — i.e. derive a contradiction from the *structure* of a large fiber
  against (X6)–(X9), (D4), (D8), (D9), rather than from its cardinality;
* **(K4)** abandon cardinality for incidence and prove (B-SHAPE) of §2.5
  directly: exhibit $c$-invariant $U$ with $K_p ∩ U = ∅$ for every
  $p ∈ \mathrm{NR} ∖ U$ and class-survival at every robust $p ∈ A∖U$.

### 6.2 The existing minimality-consuming machinery (and its direction)

`P97/ATail/GlobalMinimalDeletion.lean` already spends (C6) on a *prescribed*
deletion set.  Exact statements:

* `not_hasNEquidistantProperty_of_nonempty_proper_subset` (:32): under (C6), if
  $∅ ≠ B ⊆ A$ and $B ≠ A$ then $¬\mathrm{K₄Prop}(B)$.  **This is the exact
  negation of the Bridge-3 target for subcarriers.**
* `exists_cardMinimal_blocking_subdeletion` (:61): at a fixed center, any finite
  deletion destroying K₄ contains a cardinality-minimal blocking subdeletion
  $V$; restoring any single member of $V$ restores K₄ at that center.
* `five_le_selectedClass_of_restoration_and_sharedRadius` (:101): restoring one
  member of a deletion-minimal blocker in the presence of a distinct co-radial
  deleted member forces an ambient class of size $≥ 5$ at that center.
* `exists_global_cardMinimal_blocking_subdeletion` (:178) and
  `exists_fresh_sharedRadiusPair_or_minimalDeletionCore` (:220): for any
  prescribed proper deletion set $U$ with $A ∖ U ≠ ∅$, (C6) produces a center
  outside $U$ and a nonempty minimal blocking $V ⊆ U$ such that **either** two
  members of $V$ are co-radial about that center, **or** a `MinimalDeletionCore`
  exists — one exact critical four-shell per member of $V$ at that center, with
  pairwise-disjoint supports.

**It does not imply the bridge.**  This chain *consumes* minimality; it takes
$U$ as input and returns a local alternative.  It never produces a subcarrier,
and it does not by itself identify any $c$-invariant $U$.  Round 1 recorded the
outcome of its checked instantiation: it supplies one cap center equidistant
from some outside pair, or a minimal deletion core; (D9) requires a **second
distinct** cap center for the same pair, and no theorem identifies or
manufactures that second center.  Note also that the $≥5$-class output of
(:101) is a **robustness producer** (a five-point class makes its center
robust: `fullyDeletionRobustAt_of_five_le_selectedClass`,
`P97/ATail/DeletionRobustness.lean:58`, and
`fullyDeletionRobustAt_of_large_class`,
`P97/ATail/MinimalUniqueFourCover.lean:183`) and therefore feeds route (K2) —
subject to the growth requirement recorded there.

### 6.3 Status labels

The following round-1 items are **CONJECTURE**, not background, and must not be
cited as established: (i) the claim that modulo Γ and (F3b) the hypothesis
(F3c) carries no new positive geometry; (ii) the sharpened sufficient terminals
for F3/F4 ($|K(g) ∩ K(s_1)| ≥ 3$; $c(g) ∈ C_{i_1}$ together with
$\{e,o\} ⊆ K(g)$).  Neither is kernel-checked.  Everything in §1.3 and §6.1–6.2
is kernel-checked at the cited location, with two disclosed exceptions
inherited from the F doc: (D11)'s general form has no single in-tree
declaration (only kernel-checked instantiations, e.g.
`criticalFourShell_inter_selectedClass_card_le_two`), and (D12)'s symmetric
(F4b) half has no in-tree declaration (identical two-rewrite calc).  The two
derivations made *in this document* — §2.4's boxed "no single-point deletion
is a Bridge-3 witness" and §2.5's (N) blocker-invariance — are proved in the
document only, not in the tree: re-derive them rather than citing them.
Everything in §4's calibration paragraph is exact-rational computation
recorded in `scratch/`, not kernel-checked.

---

## §7 Multiagent orchestration block

Use multiagent orchestration aggressively and dynamically.  You have up to 40
concurrent agents available.  Do not use a fixed assignment such as "N agents
for strategy X."  Manage the search with the following heuristics:

* Begin with a genuinely diverse portfolio of approaches.  Agents should
  explore substantially different formulations, invariants, reductions and
  computational sanity checks, drawn from (at least) these families:
  1. **Blocker-digraph structure.**  The functional graph of $c$ on $A$: no
     fixed points, $\mathrm{ran}(c) ⊆ \mathrm{NR}$, apices excluded (D7),
     fibers of size $≤ 4$ contained in the fiber's shell.  Enumerate the
     possible $c$-invariant sets; locate cycles; test (B-SHAPE) against them.
  2. **Two-cycle analysis.**  A blocker 2-cycle $\{x,y\}$ forces
     $r(x) = |xy| = r(y)$, with $|xy|$ the unique K₄ radius at both $x$ and $y$
     by (U1).  Derive its geometric consequences against (C2), (D8), (D9),
     (D11), and against the cap structure when $x$ or $y$ lies in $C_{i_1}$;
     either construct one from Γ or prove Γ forbids one.
  3. **Shell-avoidance combinatorics.**  For a candidate $c$-invariant $U$, the
     requirement $K_p ∩ U = ∅$ for all $p ∈ \mathrm{NR} ∖ U$ is a hypergraph
     condition on the $4$-uniform system $\{K_p\}$.  Study which $U$ can be
     avoided by all outside classes, given that the classes cover $A$.
  4. **Robustness harvesting with growth.**  Route (K2) of §6.1: mechanisms
     producing $\Theta(|A|)$ robust centers (five-point classes, two disjoint
     four-classes) rather than a bounded list.  Feed
     `five_le_selectedClass_of_restoration_and_sharedRadius` with a family of
     deletion sets, not one.
  5. **Fiber-excess mechanisms.**  Route (K1): mechanisms forcing the blocker
     map to have few values — e.g. showing that all sources in a cap interior
     share a bounded set of blockers, or that (U1) plus (D8) collapses blockers
     along a convex arc.
  6. **Fiber–row incompatibility.**  Route (K3): contradict a large blocker
     fiber against (X6)–(X9), (D4), (D8), (D9) — geometric, not numerical.
  7. **Perpendicular-bisector and co-radiality counting.**  Each blocker center
     is equidistant from every pair inside its shell; (D9) limits cap-interior
     bisector points of off-cap pairs.
  8. **Two-circle bookkeeping** across the row system $K(s_1)$, $K(t_1)$,
     $K(g)$, $S_{a_1}(r)$, $S_{a_1}(ρ)$ and the packet rows $B_1, B_2$.
  9. **Cap/arc convex ordering.**  Radial monotonicity along a convex arc;
     ordered occupancy of $C_{i_1}$; where $c$ can send a cap-interior point.
  10. **Exact coordinate normalization + polynomial elimination** (resultants,
      Gröbner bases; msolve/Singular) per combinatorial pattern.
  11. **SMT over nonlinear real arithmetic** (Z3/cvc5) on the existential
      fragment of a fixed pattern, with validated encodings.
  12. **SAT/ILP enumeration** of blocker maps and incidence patterns under the
      cardinality constraints, followed by per-pattern geometric elimination.
      Include the search for $c$-invariant sets satisfying (B-SHAPE)(ii)
      abstractly, as a filter on which metric patterns are worth eliminating.
  13. **Repeated-distance extremal counting in convex position** applied to the
      exact-four classes (each unique-four center contributes four equal
      distances); check whether the required density of four-classes exceeds
      known convex-position repeated-distance bounds.
  14. **Branch-B: attack K₄ propagation directly.**  Exact algebraic
      constructions where *every* vertex carries a four-point class, guided by
      the $≥ 6$-new-vertices bound of §4; structured families (rotation orbits,
      few concentric circles, extensions of Danzer's 9-point 3-equidistant
      configuration).
  15. **Branch-B: full-Γ instantiation planning.**  Given a hypothetical
      all-center-K₄ convex carrier, work out what an MEC packet, a critical
      shell system, and three rich apices would require, so that a construction
      is aimed at Γ from the start rather than retrofitted.
  16. **Oriented-matroid / order-type enumeration** of realizable orders of the
      named points on the convex hull and caps, as a pruning filter only.

* Do not tell most agents the currently favored approach.  Preserve
  independence during early rounds.  The **named attractors** here — seductive
  dead ends that agents converge on — are:
  * **(A1) "delete one point."**  Refuted pointwise by (H1)/(H2) (§2.4).  Any
    argument that reaches a removable vertex without first deriving `False` is
    unsound.
  * **(A2) restating the cover bound.**  $|A| ≤ 4|\mathrm{NR}|$ and its
    rearrangements are vacuous at $|A| ≥ 15$ given three robust points (§6.1).
    Rediscovering the bound is not progress.
  * **(A3) mistaking the (M) mutual-omission cycles for blocker $c$-cycles.**
    They are shell-membership omissions.  Γ names no $c$-cycle.
  * **(A4) "the 15-point local model is nearly a certificate."**  It fails K₄ at
    twelve of fifteen centers and needs $≥ 6$ new vertices (§4).
  * **(A5) heuristic overdetermination counts** ("too many circles through too
    few points") that never produce an exact elimination.

* Maintain an explicit registry of approach families.  Group agents by the
  mathematical idea, not by wording.  If many agents converge to one family,
  redirect some toward underexplored formulations.

* Do not allow one approach to dominate merely because it gives an elegant
  reformulation.  A route that ends at an unproved incidence, cap-counting, or
  minimality lemma equivalent in strength to the bridge is not close to
  completion unless it supplies a genuinely new proof of that lemma.

* When an approach stalls at a theorem-strength missing lemma, mark that route
  as blocked.  Only continue assigning agents to it if someone proposes a
  materially new mechanism, invariant, construction, quantitative estimate, or
  exact-elimination device.

* Keep several incompatible proof routes alive through multiple rounds.
  Maintain both branch-A routes and branch-B routes until one side is
  rigorously ruled out.  Cross-pollinate only after independent agents have
  developed their routes far enough to expose real strengths and gaps.

* Use computational agents throughout: exact small-case computation,
  SAT/ILP/SMT encodings, Gröbner eliminations per pattern, abstract search for
  $c$-invariant sets satisfying (B-SHAPE), branch-B candidate searches, and
  counterexample searches against proposed intermediate lemmas.  **Always
  validate an encoding against a known result first.**  Computation is evidence
  unless converted into a rigorous general proof or an exact certificate.

* Search aggressively for counterexamples to proposed lemmas.  Before any
  intermediate lemma is relied on, assign agents (computational where possible)
  to refute it — configurations satisfying a *subset* of Γ are cheap to build
  and often kill overstated sublemmas.  A lemma that has survived no refutation
  attempt is not established.

* Use adversarial agents throughout — independent agents that did not produce
  the argument under audit.  Every candidate proof must be checked for:
  * **the competitor predicate, conjunct by conjunct**: $B ≠ ∅$;
    $\mathrm{ConvexIndep}(B)$ (inherited only if $B ⊆ A$); $\mathrm{K₄Prop}(B)$
    at **every** $p ∈ B$, radius strictly positive, count $≥ 4$, points counted
    **inside $B$**;
  * $|B| < |A|$, i.e. $B ≠ A$ when $B ⊆ A$;
  * (C6) applied with its true quantifier (all planar sets, not subsets of $A$)
    and never in a circular descent;
  * (H1)/(H2) consumed correctly: criticality is invoked **only** at the
    deleted point's own blocker; $c(x) ≠ x$; $K(x)$ is the **full** radius
    class, so nothing else of $A$ lies on that circle;
  * blocker-invariance (N) actually verified for the proposed $U$, for **every**
    element of $U$;
  * class survival verified at **every** remaining center, with the robust ones
    handled by an argument valid for $|U| ≥ 2$ (single-deletion robustness is
    not enough);
  * (U1)'s unique-radius clause used only at blocker values $c(x)$, never at
    arbitrary carrier points;
  * (C2) convex independence used exactly as stated (extreme points, not
    "general position");
  * closed cap $C_i$ vs strict interior $C_i^{\circ}$ in every membership;
    Moser endpoints handled under the closed-cap convention;
  * exact cardinalities where hypothesized ($=4$ in (X6)/(X7)/(H1), $≤2$ in
    packets) vs lower bounds elsewhere ($≥4$, $≥6$, $≥8$);
  * robustness/richness claimed only where given ((T1), (T4), (D6)); richness
    never silently upgraded to multi-deletion survival;
  * (D7) used only as stated (robust ⇒ not a unique-four center ⇒ not a blocker
    value);
  * collision data: equal-blocker identities used with the right pair;
    (X8)/(X9) concern the **strict** interior; (X10) does not by itself give
    (X11);
  * (M)-cycle facts: $u, u'$ are fixed but unknown elements of their pairs; no
    proof may assume $u = s_1$ or $u' = t_1$; the (M) items are not $c$-cycles;
  * leaf supplements (if used): every field consumed or explicitly unused, and
    every disjunction arm closed;
  * each item of §5, especially the named traps;
  * for branch B: every Γ clause verified exactly, including (C6), (C7), (U1)'s
    universal radius clause, (T5), (T6), and all negative memberships;
  * circular use of a statement equivalent to the bridge, to a leaf, to a
    sibling bridge, or to the parent coordinator.

* Require agents to return concrete lemmas, constructions, equations, exact
  certificates, encodings with validation runs, or counterexamples to proposed
  sublemmas.  Reject status reports, vague optimism, and claims that an unproved
  incidence or minimality statement is "routine."

* The root agent should repeatedly synthesize, challenge, redirect and launch
  new rounds.  Do not stop after the first wave fails.  Produce a completed
  resolution only if it survives adversarial audit; otherwise report only the
  strongest rigorously proved derivation and its exact remaining gap.

---

## §8 Anti-quit block

Do not return merely because current approaches fail or agents report
theorem-strength gaps.  Continue launching new rounds, reopening blocked
approaches only when there is a genuinely new mechanism, and searching for
fresh formulations.  Spend at least six full rounds of the approach portfolio —
with both branches alive throughout — before even thinking of returning.

---

## §9 Return contract

Return only when Bridge 3 has been completely resolved — either

* **branch A:** a rigorous derivation from Γ (optionally plus one named leaf
  supplement) of a finite $B$ with $\mathrm{Comp}(B)$ and $|B| < |A|$, hence
  `False`, with all three conjuncts of $\mathrm{Comp}$ verified and every
  disjunctive arm closed; or
* **branch B:** an exact certificate realizing **every** hypothesis of Γ,
  verified symbolically,

and the argument survives adversarial audit.

Do not return a reduction, partial result, isolated missing lemma, finite
computation, numerical guess, "best effort" summary, or an explanation of
difficulty.  Do not stop, return, or give up until a complete and rigorous
resolution exists.

If, after exhausting the portfolio repeatedly, the bridge remains open, the
final report must state:

1. the strongest rigorously proved derivation obtained, with its hypotheses;
2. the exact remaining gap, as a precisely stated mathematical statement
   (not a description of a difficulty);
3. the audit trail of refuted intermediate lemmas, each with the configuration
   or argument that refuted it;
4. for any candidate $U$ examined: which of (N)/(i) and (B-SHAPE)(ii) it
   satisfies and which it fails, pointwise;
5. an explicit statement of which claims are kernel-checked, which are exact
   computations, and which are conjecture.

---

## §10 Web-search restriction

Public search may be used only for ordinary mathematical background or standard
named theorems (convex-position distance counting, circle incidence, real
algebraic elimination, extremal repeated-distance results), not to search for a
solution to this obligation, to this formalization project, or to the status of
Erdős problem 97.  Do not search the public web to determine whether these
statements are open, and do not answer that they are open.

---

## Appendix A — Declaration names and locations

All paths relative to `lean/` in `erdos-97-96-formalization`, except the two
`scratch/` entries which are repository-root-relative.  Γ is supplied by the
section-variable/`include` block at
`Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7421–7469`, inside
`namespace Problem97 / ATailFrontierLiveClosure / TwoSourceExactCollisionRowsTerminal`
(`:41`, `:42`, `:7417`; section ends `:7656`).

### The four leaves

| Leaf | Lean declaration (fully qualified prefix `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.`) | Location (sorry) |
|---|---|---|
| F1 | `false_of_crossBlockerCoincidence` | FrontierLiveClosure.lean:7476 (:7479) |
| F2 | `false_of_capSource_freshThirdBlockerFiber` | FrontierLiveClosure.lean:7486 (:7490) |
| F3 | `false_of_capSource_firstFiber_collisionFiveCenterDeletion` | FrontierLiveClosure.lean:7620 (:7628) |
| F4 | `false_of_capSource_freshOutsideSecondBlockerFiber` | FrontierLiveClosure.lean:7648 (:7652) |

Sorry-free neighbours (not obligations): `firstFiber_shell_eq_explicitFour`
(:7495); `capSource_firstFiber_descent` (:7554, `private`).
`false_of_capSource_freshOutsideFirstBlockerFiber` (:7632) is **not**
sorry-free: it routes through F3 (:7641).

### Minimality, the competitor predicate, and the subcarrier interface

| Item | Declaration | Location |
|---|---|---|
| carrier bundle, (C1)–(C5) | `Problem97.CounterexampleData` | P97/U1TwoShortCapReduction.lean:83 |
| **(C6), the target predicate** | `Problem97.CounterexampleData.Minimal` | P97/U1TwoShortCapReduction.lean:158 |
| (C6) in scope in the leaves | `FrontierCommonDeletionParentResidual.minimal` | P97/ATail/OrientedPhysicalApexIngress.lean:255 (structure :251) |
| K₄ predicates | `Erdos97.HasNEquidistantPointsAt` / `HasNEquidistantProperty` | formal_conjectures `FormalConjectures/ErdosProblems/97.lean:34,48` |
| enclosing problem statement | `Erdos97.erdos_97` | formal_conjectures `FormalConjectures/ErdosProblems/97.lean:76` |
| convex independence | `Problem97.ConvexIndep` | P97/Foundation.lean:28 |
| subset inheritance | `Problem97.ConvexIndep.mono`; `ConvexIndep.erase` | P97/ConvexIndepHelpers.lean:22, :31 |
| removable vertex | `Problem97.IsRemovableVertex` | P97/SmallerCounterexample.lean:25 |
| removable ⇒ smaller competitor | `smaller_counterexample_of_removable` | P97/SmallerCounterexample.lean:30 |
| minimality excludes removable | `CounterexampleData.not_isRemovableVertex_of_minimal` | P97/U1TwoShortCapReduction.lean:166 |
| **negation of the target** | `ATailGlobalMinimalDeletion.not_hasNEquidistantProperty_of_nonempty_proper_subset` | P97/ATail/GlobalMinimalDeletion.lean:32 |

### Cover bound, robustness, blocker system

| Item | Declaration | Location |
|---|---|---|
| radius class $S_p(r)$ | `Problem97.SelectedClass` | P97/WitnessPacketInterface.lean:59 |
| unique-four center | `IsUniqueFourCenter` | P97/ATail/MinimalUniqueFourCover.lean:48 |
| its class $K_p$ | `uniqueFourClass` | P97/ATail/MinimalUniqueFourCover.lean:64 |
| cover (existence form) | `exists_isUniqueFourCenter_of_minimal` | P97/ATail/MinimalUniqueFourCover.lean:101 |
| robust ⇒ not unique-four | `not_isUniqueFourCenter_of_fullyDeletionRobust` | P97/ATail/MinimalUniqueFourCover.lean:159 |
| not robust ⇒ unique-four | `isUniqueFourCenter_of_not_fullyDeletionRobust` | P97/ATail/MinimalUniqueFourCover.lean:235 |
| blocker is unique-four | `isUniqueFourCenter_centerAt` | P97/ATail/MinimalUniqueFourCover.lean:257 |
| blocker ≠ source | `centerAt_ne_source` | P97/ATail/MinimalUniqueFourCover.lean:269 |
| source lies in its blocker class | `source_mem_uniqueFourClass_centerAt` | P97/ATail/MinimalUniqueFourCover.lean:296 |
| **cover bound** $\lvert A\rvert ≤ 4\lvert U_4\rvert$ | `card_le_four_mul_uniqueFourCenters` | P97/ATail/MinimalUniqueFourCover.lean:394 |
| $\mathrm{NR}$ | `notRobustCenters` | P97/ATail/MinimalUniqueFourCover.lean:418 |
| **(T5)** $\lvert A\rvert ≤ 4\lvert \mathrm{NR}\rvert$ | `card_le_four_mul_notRobustCenters` | P97/ATail/MinimalUniqueFourCover.lean:429 |
| project note on the bound | docstring | P97/ATail/MinimalUniqueFourCover.lean:421–428 |
| robustness predicate | `FullyDeletionRobustAt` | P97/ATail/DeletionRobustness.lean:27 |
| 5-class ⇒ robust | `fullyDeletionRobustAt_of_large_class` | P97/ATail/MinimalUniqueFourCover.lean:183 |
| two radii ⇒ robust | `fullyDeletionRobustAt_of_two_K4_radii` | P97/ATail/MinimalUniqueFourCover.lean:199 |
| richness | `ApexRichClassStructure` | P97/ATail/ApexRichClassStructure.lean:50 |
| rich ⇒ robust ((D6)) | `fullyDeletionRobustAt_of_apexRichClassStructure` | P97/ATail/ApexRichClassStructure.lean:105 |
| (H1)/(H2) system | `CriticalShellSystem` (`shellAt`, `no_qfree`) | P97/U1CarrierInjection.lean:1015 |
| $c(x)$, $K(x)$ | `CriticalShellSystem.centerAt`, `.selectedAt` | P97/U1CarrierInjection.lean:1029, :1034 |
| **(H2) usable form** | `CriticalShellSystem.no_qfree_at` | P97/U1CarrierInjection.lean:1041 |
| (D6) first apex robust | `FrontierCommonDeletionParentResidual.firstApexFullyDeletionRobust` | P97/ATail/OrientedPhysicalApexIngress.lean:318 |

### Minimality-consuming machinery (§6.2)

| Item | Declaration | Location |
|---|---|---|
| local blocker of a failure | `exists_local_blocker_of_not_global_K4` | P97/ATail/GlobalMinimalDeletion.lean:46 |
| minimal blocking subdeletion | `exists_cardMinimal_blocking_subdeletion` | P97/ATail/GlobalMinimalDeletion.lean:61 |
| restoration ⇒ 5-class | `five_le_selectedClass_of_restoration_and_sharedRadius` | P97/ATail/GlobalMinimalDeletion.lean:101 |
| global version | `exists_global_cardMinimal_blocking_subdeletion` | P97/ATail/GlobalMinimalDeletion.lean:178 |
| co-radial pair **or** core | `exists_fresh_sharedRadiusPair_or_minimalDeletionCore` | P97/ATail/GlobalMinimalDeletion.lean:220 |
| deletion core | `MinimalDeletionCore` | P97/ATail/MinimalDeletionCore.lean:34 |

### Derived facts (D1)–(D13) and packet/frontier data

| Item | Declaration | Location |
|---|---|---|
| (D1) | `cross_deletion_survives_iff_not_mem_selected_support` | P97/ATail/CriticalPairFrontier.lean:755 |
| (D2) | `selectedFourClass_support_eq_shell` | P97/U1CarrierInjection.lean:1087 |
| (D3) | `selectedSupports_eq_of_actualBlockers_eq`; `RetainedInteriorBlockerCollision.supports_eq` | P97/ATail/SurvivalCover.lean:48; P97/ATail/RetainedStrictInteriorPairSelector.lean:207 |
| (D4) | `RetainedInteriorBlockerCollision.shell_inter_cap_eq_sources`; `collisionShell_sdiff_firstCap_card_eq_two` | P97/ATail/RetainedStrictInteriorPairSelector.lean:279; P97/ATail/BlockerMultiplicityGeometry.lean:220 |
| (D5) | `RetainedInteriorBlockerCollision.blocker_mem_capInterior` | P97/ATail/RetainedStrictInteriorPairSelector.lean:244 |
| (D8) | `selectedFourClass_inter_capByIndex_card_le_two` | P97/CapSelectedRowCounting.lean:257 |
| (D9) | `outsidePair_unique_capCenter` | P97/CapSelectedRowCounting.lean:283 |
| (D11) | `criticalFourShell_inter_selectedClass_card_le_two` | P97/ATail/MinimalUniqueFourCover.lean:306 |
| (D12) | `firstFiber_shell_eq_explicitFour` | P97/ATail/FirstFiberOverlapDescent.lean:156; FrontierLiveClosure.lean:7495 |
| three-point equidistance ⇒ equal centers | `eq_of_dist_eq_three_of_pairwise_ne` | P97/N4d/SmallSReductions.lean:324 |

### Exact computations cited in §4 (not kernel-checked)

| Item | Source |
|---|---|
| 15-point exact rational model; pinned multiplicities; MEC $=\{a,l\}$; no `CriticalShellSystem`; one robust center | `scratch/full-local-euclidean-model-complete/REPORT.md` (checker `check_model.py`) |
| $\lvert B ∖ A_0\rvert ≥ 6$ for any K₄ extension | `scratch/full-local-euclidean-model-complete/K4_EXTENSION_OBSTRUCTION.md` (checker `check_k4_extension_bound.py`) |

---

## Appendix B — Math object ↔ Lean structure

| §1/§2 object | Lean name | Location |
|---|---|---|
| carrier $A$, (C1)–(C5) | `CounterexampleData` (fields `A`, `nonempty`, `convex`, `K4`, `packet`) | P97/U1TwoShortCapReduction.lean:83 |
| $\mathrm{K₄Prop}(X)$ | `Erdos97.HasNEquidistantProperty 4 X` | formal_conjectures 97.lean:48 |
| $K₄(X,p)$ | `Erdos97.HasNEquidistantPointsAt 4 X p` | formal_conjectures 97.lean:34 |
| $\mathrm{Comp}(B)$ | the three antecedents of `CounterexampleData.Minimal` | P97/U1TwoShortCapReduction.lean:159 |
| (C6) | `CounterexampleData.Minimal` | P97/U1TwoShortCapReduction.lean:158 |
| (C7) $(m,4,4)$ | `SurplusCapPacket.IsM44` | P97/Cap/PartitionFromMEC.lean:443 |
| $S_p(r)$ | `SelectedClass` | P97/WitnessPacketInterface.lean:59 |
| MEC $(O,R_0)$ | `MEC.mec` | P97/MEC/Basic.lean:275 |
| (P2) triangle | `MEC.NonObtuseCircumscribedMoserTriangle`; `MoserTriangle` | P97/Moser/TriangleNonObtuse.lean:667; P97/Cap/Structure.lean:98 |
| (P3) caps, $\mathrm{Arc}$, $\mathrm{sa}$ | `CapTriple`; `OnArcOpposite`; `signedArea2` | P97/Cap/Structure.lean:161; P97/Foundation.lean:57, :49 |
| packet $S$, $m$, $σ$ | `SurplusCapPacket` | P97/Cap/PartitionFromMEC.lean:332 |
| $a_0, a_1, a_2$ | `SurplusCapPacket.surplusApex` / `.oppApex1` / `.oppApex2` | P97/U1TwoShortCapReduction.lean:313, :297, :305 |
| $C_i$, $C_i^{\circ}$, $i_1$ | `capByIndex` / `capInteriorByIndex` / `oppIndex1` | P97/Cap/PartitionFromMEC.lean:466, :474, :521 |
| (H1)/(H2) $c, r, K$ | `CriticalShellSystem` | P97/U1CarrierInjection.lean:1015 |
| $c(x)$ | `CriticalShellSystem.centerAt` | P97/U1CarrierInjection.lean:1029 |
| $K(x)$ | `(CriticalShellSystem.selectedAt …).toCriticalFourShell.support` | P97/U1CarrierInjection.lean:1034 |
| 4-point row (abstract) | `SelectedFourClass` | P97/U1CarrierInjection.lean:405 |
| $\mathrm{Packet}(x; z_1, z_2)$ | `CommonDeletionTwoCenterPacket` | P97/ATail/CommonDeletionTwoCenter.lean:29 |
| (Q1)–(Q7) frontier | `SurvivorPairRelocationPacket`; `CriticalPairFrontier`; `FirstApexSplit`/`SecondApexSplit` | P97/ATail/CriticalPairFrontier.lean:288, :568, :544, :555 |
| (R1)–(R3) parent | `FrontierCommonDeletionResidual` / `FrontierCommonDeletionParentResidual` | P97/ATail/OrientedPhysicalApexIngress.lean:239, :251 |
| (X1)–(X4) collision row | `RetainedInteriorBlockerCollision` | P97/ATail/RetainedStrictInteriorPairSelector.lean:95 |
| (M1)/(M3) | `LocalizedCollisionCommonDeletion` | P97/ATail/RetainedStrictInteriorPairSelector.lean:449 |
| (M2)/(M4) | `LocalizedCollisionMutualOmissionCycle` | P97/ATail/LocalizedCollisionMutualOmissionCycle.lean:131 |
| (T1) | `FrontierBiApexRobustResidual` | P97/ATail/PhysicalSecondApexCommonDeletion.lean:171 |
| (T2) | `FrontierLargeOppositeCapsBiApexRobustResidual` | P97/ATail/LargeOppositeCapsBiApexSurface.lean:38 |
| (T3) | `FrontierAllLargeCapsBiApexRobustResidual` | P97/ATail/FrontierLiveClosure.lean:6430 |
| (T4)–(T6) | `FrontierAllLargeCapsTriApexRobustResidual` (fields `oppApex1_rich` :6539, `oppApex2_rich` :6541, `surplusApex_rich` :6543, `notRobustCover_card` :6547, `no_center_covers_all_apices` :6550) | P97/ATail/FrontierLiveClosure.lean:6527 |
| $\mathrm{Robust}$ / $\mathrm{Rich}$ / $\mathrm{NR}$ | `FullyDeletionRobustAt`; `ApexRichClassStructure`; `notRobustCenters` | P97/ATail/DeletionRobustness.lean:27; P97/ATail/ApexRichClassStructure.lean:50; P97/ATail/MinimalUniqueFourCover.lean:418 |
| (U1) | section hypothesis `hcriticalShellUniqueFourCover` via `IsUniqueFourCenter`/`uniqueFourClass` | P97/ATail/FrontierLiveClosure.lean:7447; P97/ATail/MinimalUniqueFourCover.lean:48, :64 |
| (F1a) | `CrossBlockerCoincidence` | P97/ATail/TwoCollisionGlobalProducer.lean:272 |
| (F2a)+(F2b) | `CapSourceThirdCanonicalRowSurface` | P97/ATail/TwoCollisionGlobalProducer.lean:291 |
| (F2b) named form | `FirstFiberCapSourceWitness` | P97/ATail/FrontierLiveClosure.lean:7521 |
| (F2c) | `FreshThirdBlockerFiber` | P97/ATail/BlockerMultiplicityGeometry.lean:70 |
| (F3a) | `FreshOutsideFirstBlockerFiber` | P97/ATail/BlockerMultiplicityGeometry.lean:115 |
| (F3c) | `FirstFiberCollisionFiveCenterDeletionResidual` / `FiveCenterDeletionSurvival` | P97/ATail/FirstFiberOverlapDescent.lean:85, :39 |
| (F4b) | `FreshOutsideSecondBlockerFiber` | P97/ATail/BlockerMultiplicityGeometry.lean:161 |
