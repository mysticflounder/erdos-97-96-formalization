# Solve prompt — Family F round 2, Bridge 2: two distinct first-cap centers bisecting one named off-cap pair

Date: 2026-07-27.
Round: 2 (successor to `docs/solve-prompts/2026-07-27-exact-collision-terminals.md`,
"the F doc"; round-1 response at
`docs/solve-prompts/2026-07-27-f-round1-response.md`).

> **Historical-status notice (2026-07-30):** This round-2 prompt preserves a
> consumed 2026-07-27 frontier snapshot. Its statement that Bridge 2 closes
> F3/F4 is a prompt-time claim, not a current closure claim. The live direct
> frontier now consists of `false_of_crossBlockerCoincidence` and
> `false_of_capSourceThirdCanonicalRowSurface`. Use the closure matrix,
> computational closure plan, and generated blueprint for current status.

Scope: **one** global bridge — Bridge 2 of the four identified in round 1.
Closing it closes the `sorry` leaves F3 and F4 of
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`
(namespace `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`).

This document is self-contained.  Every hypothesis is stated below in plain
mathematics (finite point sets in $\mathbb{R}^2$, Euclidean distance,
cardinality, membership).  No access to the Lean sources is required to work
on it; Appendix A and Appendix B exist only for the formalization step.

---

## §1 Notation preamble and the shared ambient configuration

### 1.1 Basic notation

* $\mathbb{R}^2$ is the Euclidean plane with the standard Euclidean distance;
  $|xy|$ denotes the distance between points $x, y$.  All point sets are
  finite unless stated otherwise.  $|X|$ denotes cardinality of a finite set
  $X$; $X \setminus Y$ set difference.
* For $p \in \mathbb{R}^2$, $r \in \mathbb{R}$ and a finite
  $X \subset \mathbb{R}^2$, the **radius class** ("selected class") is
  $$S^X_p(r) := \{\, q \in X : |pq| = r \,\}.$$
  When $X = A$ (the ambient carrier, below) we write $S_p(r)$.  Note
  $p \in S^X_p(r)$ only if $p \in X$ and $r = 0$; for $r > 0$ the class never
  contains its own center.
* **K₄ predicate.**  For a finite $X \subset \mathbb{R}^2$ and
  $p \in \mathbb{R}^2$:
  $$K_4(X, p) :\iff \exists\, r > 0 \text{ with } |S^X_p(r)| \ge 4 .$$
  ("$p$ has four equidistant points in $X$.")  A set $X$ has the **K₄
  property** iff $K_4(X, p)$ holds for every $p \in X$.
* **Convex independence.**  A finite $X \subset \mathbb{R}^2$ is
  *convex-independent* iff every $x \in X$ satisfies
  $x \notin \mathrm{conv}(X \setminus \{x\})$, i.e. all points of $X$ are
  vertices of its convex hull.
* **Signed area.**  For $u, x, y \in \mathbb{R}^2$ with $u = (u_1,u_2)$ etc.:
  $$\mathrm{sa}(u, x, y) := (x_1 - u_1)(y_2 - u_2) - (y_1 - u_1)(x_2 - u_2).$$
* **Arc-side predicate.**  For a labelled triangle vertex $v_i$ with the other
  two vertices $v_j, v_k$, and a point $v$:
  $$\mathrm{Arc}(v_i; v) :\iff
    \mathrm{sa}(v, v_j, v_k)\cdot\mathrm{sa}(v_i, v_j, v_k) \le 0,$$
  i.e. $v$ lies on the closed side of the chord $v_j v_k$ opposite to $v_i$
  (points on the chord itself satisfy the predicate — **closed-cap
  convention**).
* **Two-center common-deletion packet.**  For $x \in A$ and
  $z_1, z_2 \in \mathbb{R}^2$ (relative to the fixed carrier $A$ and blocker
  system $c(\cdot)$ of §1.2), $\mathrm{Packet}(x; z_1, z_2)$ denotes the
  conjunction of:
  1. $x \in A$, $z_1 \in A$, $z_2 \in A$, $z_1 \ne z_2$;
  2. $K_4(A\setminus\{x\},\, z_1)$ and $K_4(A\setminus\{x\},\, z_2)$;
  3. $c(x) \ne z_1$ and $c(x) \ne z_2$;
  4. there exist finite sets $B_1, B_2 \subset \mathbb{R}^2$ and reals
     $r_1, r_2 > 0$ with, for $j \in \{1,2\}$:
     $B_j \subseteq (A\setminus\{x\})\setminus\{z_j\}$, $x \notin B_j$,
     $|B_j| = 4$, every $y \in B_j$ satisfies $|z_j y| = r_j$; and
     $|B_1 \cap B_2| \le 2$.

### 1.2 The ambient configuration Γ

Γ is the shared hypothesis package of the four Family-F leaves.  It is copied
faithfully from the F doc §1.2, which is the audited unfolding of the Lean
section-variable/`include` block at
`FrontierLiveClosure.lean:7421–7469`.

**Condensation record (required disclosure).**  Nothing in Γ has been dropped
or weakened.  Two purely presentational compressions were applied relative to
the F doc: (a) the two frontier instances (Q)/(R) are carried in the F doc's
own $\star \in \{r,\rho\}$ single-statement convention; (b) the per-item
"(redundant: …)" annotations in the (Q), (R) and (M) blocks are shortened to
"(redundant)".  The (Q)/(R) block plays no *direct* role in Bridge 2 — its
only downstream uses here are (D0) positivity of the radii and the robustness
facts (D6) — but it is retained in full because it is part of Γ and a Branch-B
certificate must satisfy it.

#### Carrier axioms (C)

* **(C1)** $A \subset \mathbb{R}^2$ is finite and nonempty.
* **(C2)** $A$ is convex-independent.
* **(C3)** $A$ has the K₄ property: $\forall p \in A,\; K_4(A, p)$.
* **(C4)** $A$ is not contained in a line.
* **(C5)** $A$ admits at least one surplus-cap packet in the sense of
  (P1)–(P5) below (bundled inside the counterexample datum; it need not equal
  the working packet; its only downstream use is $|A| > 4$).
* **(C6)** **Minimality.**  For every finite nonempty convex-independent
  $B \subset \mathbb{R}^2$ with the K₄ property, $|A| \le |B|$.  (Quantifies
  over *all* such planar sets, not subsets of $A$.)
* **(C7)** **No $(m,4,4)$ packet.**  There is *no* surplus-cap packet on $A$
  (no choice of MEC-boundary non-obtuse triangle, cap triple and surplus
  designation as in (P1)–(P5), for the same carrier $A$) whose two
  non-surplus caps both have exactly $4$ points.  This quantifies over **all**
  packets on $A$, not just the working packet.
* **(C8)** $|A| > 9$.

#### Working surplus-cap packet (P)

* **(P1)** **Minimum enclosing circle (MEC).**  Let $(O, R_0)$ be the unique
  pair with $R_0 \ge 0$, $|pO| \le R_0$ for all $p \in A$, and $R_0$ minimal
  among all enclosing pairs.
* **(P2)** **Non-obtuse circumscribed Moser triangle.**  Points
  $v_1, v_2, v_3 \in A$, pairwise distinct, each on the MEC boundary
  ($|v_i O| = R_0$), with all three angles non-obtuse in inner-product form:
  $\langle v_2 - v_1, v_3 - v_1\rangle \ge 0$,
  $\langle v_3 - v_2, v_1 - v_2\rangle \ge 0$,
  $\langle v_1 - v_3, v_2 - v_3\rangle \ge 0$.
* **(P3)** **Cap triple (closed-cap convention).**  Finite sets
  $C_1, C_2, C_3 \subseteq A$ with (indices cyclic, cap $C_i$ "opposite"
  apex $v_i$):
  * $v_i \notin C_i$ and $v_j, v_k \in C_i$ for $\{i,j,k\} = \{1,2,3\}$;
  * every $v \in A \setminus \{v_1,v_2,v_3\}$ lies in exactly one cap;
  * **arc membership:** for every $v \in A$ and each $i$:
    $v \in C_i \iff \mathrm{Arc}(v_i; v)$.  In particular the caps are
    determined by the triangle: $C_i = \{v \in A : \mathrm{Arc}(v_i; v)\}$.
* **(P4)** **Surplus designation.**  An index $\sigma \in \{1,2,3\}$ with
  $|C_\sigma| > 4$.  Write $m := C_\sigma$ (the surplus cap).
* **(P5)** **Naming.**  Let $(i_1, i_2)$ be the other two indices in cyclic
  order after $\sigma$: $\sigma=1 \Rightarrow (i_1,i_2) = (2,3)$;
  $\sigma=2 \Rightarrow (3,1)$; $\sigma=3 \Rightarrow (1,2)$.  Define
  $a_0 := v_\sigma$ (surplus apex), $a_1 := v_{i_1}$ (first opposite apex),
  $a_2 := v_{i_2}$ (second opposite apex); and the opposite caps $C_{i_1}$
  (first) and $C_{i_2}$ (second).  For each $i$, the **strict cap interior**
  is $C_i^{\circ} := C_i \setminus \{v_j, v_k\}$ ($j,k \ne i$), the cap minus
  its two Moser-vertex endpoints.

  Derived (proven in-project, listed for orientation, not hypotheses): the
  cap-sum identity $|C_1| + |C_2| + |C_3| = |A| + 3$;
  $a_1 \in C_\sigma \cap C_{i_2}$; each Moser vertex lies in exactly the two
  caps it bounds.

#### Critical shell (blocker) system (H)

* **(H1)** For every $x \in A$ there are given: a **blocker center**
  $c(x) \in A \setminus \{x\}$, a **shell radius** $r(x) > 0$, and the
  **exact shell** $K(x) := S_{c(x)}(r(x)) = \{z \in A : |c(x)\,z| = r(x)\}$,
  such that $|K(x)| = 4$ and $x \in K(x)$.  ($K(x)$ is the *entire* radius
  class of $A$ at that center and radius, not a selected 4-subset.)
* **(H2)** **Criticality.**  For every $x \in A$:
  $\lnot K_4(A \setminus \{x\},\, c(x))$; explicitly, for every $r > 0$,
  $|\{z \in A\setminus\{x\} : |c(x)\,z| = r\}| \le 3$.

#### Two frontier instances (Q★, R★), one for each radius ★ ∈ {r, ρ}

Fixed reals $r$ and $\rho$ (the two frontier radii; positivity is derivable,
see (D0)).  For **each** $\star \in \{r, \rho\}$ the following data are given
(two independent copies; write $q_\star, w_\star$ for the survivor pair of the
instance at radius $\star$):

* **(Q1)** $q_\star, w_\star \in A$, $q_\star \ne w_\star$.
* **(Q2)** $q_\star, w_\star \in S_{a_1}(\star) \setminus m$.
* **(Q3)** $K_4(A\setminus\{q_\star\},\, a_2)$ and
  $K_4(A\setminus\{w_\star\},\, a_2)$.
* **(Q4)** $c(q_\star) \ne a_2$ and $c(w_\star) \ne a_2$.
* **(Q5)** **First-apex split.**  $K_4(A\setminus\{q_\star, w_\star\},\, a_1)$,
  or else both: $|S_{a_1}(\star)| \in \{4, 5\}$ and every $\rho' > 0$ with
  $|S_{a_1}(\rho')| \ge 4$ satisfies $\rho' = \star$.  (In the presence of
  (X5)–(X7) the second disjunct is false for both instances, so (Q5) is
  equivalent to (R2).)
* **(Q6)** $K_4(A\setminus\{q_\star, w_\star\},\, a_2)$.
* **(Q7)** **Second-apex split.**  $K_4(A\setminus\{q_\star, w_\star\},\, a_2)$,
  or else there exist two exact shells at center $a_2$: full radius classes
  $S_{a_2}(|a_2 q_\star|)$ and $S_{a_2}(|a_2 w_\star|)$, each of cardinality
  exactly $4$, with positive radii, containing $q_\star$ resp. $w_\star$, and
  disjoint from each other.  (Redundant: first disjunct is (Q6).)
* **(R1)** $4 \le |S_{a_1}(\star)|$.  (Redundant.)
* **(R2)** $K_4(A\setminus\{q_\star, w_\star\},\, a_1)$.
* **(R3)** $\mathrm{Packet}(q_\star;\, a_1, a_2)$.

#### The two exact collision rows (X)

* **(X1)** $s_1, s_2 \in A$ with $s_1 \ne s_2$; and $t_1, t_2 \in A$ with
  $t_1 \ne t_2$.
* **(X2)** $s_1, s_2 \in S_{a_1}(r)$ and $t_1, t_2 \in S_{a_1}(\rho)$.
* **(X3)** $s_1, s_2, t_1, t_2 \in C_{i_1}^{\circ}$ (strict interior of the
  first opposite cap).
* **(X4)** **Blocker collisions.**  $c(s_1) = c(s_2) =: b$ and
  $c(t_1) = c(t_2) =: b'$.
* **(X5)** $\rho \ne r$.
* **(X6)** $|S_{a_1}(r)| = 4$.
* **(X7)** $|S_{a_1}(\rho)| = 4$.
* **(X8)** $S_{a_1}(r) \cap C_{i_1}^{\circ} = \{s_1, s_2\}$.
* **(X9)** $S_{a_1}(\rho) \cap C_{i_1}^{\circ} = \{t_1, t_2\}$.
* **(X10)** $\{s_1, s_2\} \cap \{t_1, t_2\} = \varnothing$.
* **(X11)** $b' \ne b$.

#### Robustness / richness / cover (T)

* **Definitions.**
  $\mathrm{Robust}(p) :\iff \forall z \in A,\; K_4(A\setminus\{z\}, p)$.
  $\mathrm{Rich}(p) :\iff (\exists r'' > 0:\ |S_p(r'')| \ge 6)$ or
  $(\exists\, r_1'' \ne r_2'' > 0:\ |S_p(r_1'')| \ge 4
  \text{ and } |S_p(r_2'')| \ge 4)$.
  $\mathrm{NR} := \{p \in A : \lnot\mathrm{Robust}(p)\}$.
* **(T1)** $\mathrm{Robust}(a_2)$.
* **(T2)** $|C_{i_1}| \ge 6$ and $|C_{i_2}| \ge 6$.
* **(T3)** $|m| \ge 6$.  (With (T2) and the cap-sum identity: $|A| \ge 15$.)
* **(T4)** $\mathrm{Rich}(a_1)$, $\mathrm{Rich}(a_2)$, $\mathrm{Rich}(a_0)$.
* **(T5)** $|A| \le 4\,|\mathrm{NR}|$.
* **(T6)** No common circle through the three apices centered in the carrier:
  for every $p \in A$ and every $r'' > 0$, not all of $v_1, v_2, v_3$ lie in
  $S_p(r'')$.

#### Unique-four cover of the blocker range (U)

* **(U1)** For every $x \in A$: $c(x) \ne x$ (redundant); $c(x)$ is a
  **unique-four center**: $c(x) \in A$, $|S_{c(x)}(r(x))| = 4$ (redundant),
  and every $\rho'' > 0$ with $|S_{c(x)}(\rho'')| \ge 4$ satisfies
  $\rho'' = r(x)$; moreover the four-point class selected at $c(x)$ is $K(x)$
  (redundant).

  Net new content: **at each blocker center the shell radius is the only
  radius carrying ≥ 4 carrier points.**

#### The mutual-omission two-cycles (M)

* **(M1)** $t_1 \notin K(s_1)$, and $\mathrm{Packet}(t_1;\, a_1, b)$.
* **(M2)** There is a chosen $u \in \{s_1, s_2\}$ with $u \notin K(t_1)$,
  plus $\mathrm{Packet}(u;\, a_1, b')$.  (Its remaining clauses —
  $u \in C_{i_1}^{\circ}$, $u \ne t_1$, $c(u) = b$, $t_1 \notin K(u)$,
  $b \ne c(t_1)$, $\mathrm{Packet}(t_1; a_1, b)$ — are redundant.)
* **(M3)** $s_1 \notin K(t_1)$, and $\mathrm{Packet}(s_1;\, a_1, b')$.
* **(M4)** There is a chosen $u' \in \{t_1, t_2\}$ with $u' \notin K(s_1)$,
  plus $\mathrm{Packet}(u';\, a_1, b)$.  (Remaining clauses redundant.)

### 1.3 Established derived facts (proven in-project, kernel-checked; usable as background)

* **(D0)** $r > 0$ and $\rho > 0$.
* **(D1)** **Cross-deletion criterion.**  For all $x \in A$ and
  $w \in \mathbb{R}^2$: $K_4(A\setminus\{w\},\, c(x)) \iff w \notin K(x)$.
* **(D2)** **Support locking.**  Any 4-point set $B \subseteq A$ on a common
  circle of positive radius about $c(x)$ (center not in $B$) equals $K(x)$.
* **(D3)** **Equal blockers ⇒ equal shells.**  If $c(x) = c(y)$ then
  $K(x) = K(y)$; hence $K(s_1) = K(s_2)$, $K(t_1) = K(t_2)$, and
  $s_2 \in K(s_1)$, $t_2 \in K(t_1)$.
* **(D4)** **Exact cap trace of the collision shells.**
  $K(s_1) \cap C_{i_1} = \{s_1, s_2\}$ and $K(t_1) \cap C_{i_1} = \{t_1,t_2\}$
  (**closed** cap), hence
  $|K(s_1) \setminus C_{i_1}| = |K(t_1) \setminus C_{i_1}| = 2$.
* **(D5)** **Blockers sit inside the cap.**  $b \in C_{i_1}^{\circ}$ and
  $b' \in C_{i_1}^{\circ}$; hence also $b, b' \in C_{i_1}$.
* **(D6)** $\mathrm{Robust}(a_1)$; and $\mathrm{Rich}(p) \Rightarrow
  \mathrm{Robust}(p)$, so (T4) gives $\mathrm{Robust}(a_0)$,
  $\mathrm{Robust}(a_2)$ as well.
* **(D7)** **Robust points are never blocker values.**  With (U1),
  $c(x) \notin \{a_0, a_1, a_2\}$ for every $x \in A$.
* **(D8)** **Cap two-point row bound.**  For any center $z \in C_i$ (closed
  cap, any $i$) and any 4-point set $B \subseteq A$ on a common
  positive-radius circle about $z$ with $z \notin B$: $|B \cap C_i| \le 2$.
  (Uses (C2).)
* **(D9)** **Off-cap pair has at most one cap bisector point.**  If
  $c \ne d$, both in $C_i$ (closed cap), and $a \ne b$ both in $A$ with
  $a, b \notin C_i$, then **not** both $|ca| = |cb|$ and $|da| = |db|$.
  (Uses (C2).)  This is the theorem the present bridge is designed to
  contradict; it is unfolded exactly in §2.1.
* **(D10)** **Minimality cover.**  From (C6): every $x \in A$ lies in the
  unique four-point class of some unique-four **center**; quantitatively
  $|A| \le 4\,|U|$ where $U$ is the set of unique-four centers, and (T5)
  restates this with $U \subseteq \mathrm{NR}$.
* **(D11)** **Two-circle bound.**  Two circles with distinct
  (center, radius) pairs share at most two points; hence
  $|K(x) \cap K(y)| \le 2$ whenever $(c(x), r(x)) \ne (c(y), r(y))$, and
  $|K(x) \cap S_p(r'')| \le 2$ whenever $(c(x), r(x)) \ne (p, r'')$.
* **(D12)** **Explicit four-point row.**  Under (F3a) below:
  $K(s_1) = \{s_1, s_2, e, o\}$.  Symmetrically under (F4b):
  $K(t_1) = \{t_1, t_2, e, o\}$ (the symmetric half has no in-tree
  declaration; it follows by the identical two-rewrite calc from the
  kernel-checked generic parts).
* **(D13)** **Deletion-survival reduction of packets.**  By (D1),
  $\mathrm{Packet}(x; a_1, z)$ with $z = c(y)$ contains the information
  $x \notin K(y)$, and conversely $x \notin K(y)$ plus $\mathrm{Robust}(a_1)$
  reconstructs such a packet.  In particular (M1)–(M4) reduce modulo Γ to:
  $t_1 \notin K(s_1)$, $s_1 \notin K(t_1)$,
  $\exists u \in \{s_1,s_2\}: u \notin K(t_1)$,
  $\exists u' \in \{t_1,t_2\}: u' \notin K(s_1)$.

### 1.4 The two leaf supplements relevant to this bridge

* **(F3a)** (enlarged first blocker fiber)  There exist $e, o$ with:
  1. $e \in A$, $e \notin \{s_1, s_2, t_1, t_2\}$;
  2. $c(e) = b$ (so $e$ is a **third** source in the first collision fiber);
  3. $e \in K(s_1)$ (redundant, from 2 by (D3));
  4. $e \notin C_{i_1}$ (**closed** cap);
  5. $o \in A$, $o \ne e$, $o \ne t_1$, $o \ne t_2$;
  6. $o \in K(s_1)$;  7. $o \notin C_{i_1}$;
  8. $K(s_1) \setminus C_{i_1} = \{e, o\}$.

  With (D4) this yields (D12): $K(s_1) = \{s_1, s_2, e, o\}$.

* **(F4b)** (enlarged second blocker fiber)  There exist $e, o$ with:
  1. $e \in A$, $e \notin \{s_1, s_2, t_1, t_2\}$;
  2. $c(e) = b'$;
  3. $e \in K(t_1)$ (redundant);
  4. $e \notin C_{i_1}$;
  5. $o \in A$, $o \ne e$, $o \ne s_1$, $o \ne s_2$;
  6. $o \in K(t_1)$;  7. $o \notin C_{i_1}$;
  8. $K(t_1) \setminus C_{i_1} = \{e, o\}$.

  Hence $K(t_1) = \{t_1, t_2, e, o\}$.

* **(F3b)** $= $ **(F4a)** (the cap-eight source, available in **both**
  leaves): $|C_{i_1}| \ge 8$, and there is $g \in A$ with:
  1. $g \in C_{i_1}^{\circ}$;
  2. $g \notin \{s_1, s_2, t_1, t_2\}$;
  3. $c(g) \ne b$;  4. $c(g) \ne b'$;
  5. $c(g) \ne a_1$;  6. $c(g) \ne a_2$  (5–6 redundant by (D7));
  7. $g \in K(g)$ and $|K(g)| = 4$ (redundant by (H1));
  8. $s_1 \notin K(g)$ or $s_2 \notin K(g)$;
  9. $t_1 \notin K(g)$ or $t_2 \notin K(g)$.

  Leaf F3's supplement is (F3a) ∧ (F3b) ∧ (F3c); leaf F4's supplement is
  (F4a) ∧ (F4b).  (F3c) is the five-center-deletion residual and is **not**
  needed by this bridge; see §7 CONJECTURE-(i).

### 1.5 Interface assumptions

* The MEC $(O, R_0)$ of (P1) is treated as given exact data satisfying the
  stated enclosing/minimality/uniqueness properties; nothing else about the
  MEC is assumed.
* The ordered-cap machinery behind (D8)/(D9) is used only through those two
  stated consequences.
* Global minimality (C6) and the no-$(m,4,4)$ hypothesis (C7) are stated
  exactly above and are *not* further unfolded; they are the only hypotheses
  quantifying over objects outside the fixed configuration.

---

## §2 Exact target statement

### 2.1 The uniqueness theorem, fully unfolded

The bridge is defined by what it must contradict.  The in-project uniqueness
theorem is `Problem97.CapSelectedRowCounting.outsidePair_unique_capCenter`
(`lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:283`, sorry-free).  It
is stated over an ordered-cap presentation $L$ of a cap; the file
`lean/Erdos9796Proof/P97/ATail/FirstFiberOverlapDescent.lean:111` carries the
directly consumable specialization
`false_of_two_cap_centers_equidistant_outside_pair` (`private` to that file;
new modules must re-derive it or cite the `CapSelectedRowCounting` original).
Its hypothesis list, verbatim in mathematics, is:

> Let $S$ be the working surplus-cap packet on $A$, let $k \in \{1,2,3\}$ be
> **any** cap index, and let $c, d, p, q \in \mathbb{R}^2$ satisfy
>
> 1. $c \in C_k$   — the **closed** indexed cap, not $C_k^{\circ}$;
> 2. $d \in C_k$   — the **closed** indexed cap;
> 3. $c \ne d$;
> 4. $p \in A$;
> 5. $q \in A$;
> 6. $p \ne q$;
> 7. $p \notin C_k$   — outside the **closed** cap;
> 8. $q \notin C_k$   — outside the **closed** cap;
> 9. $|c\,p| = |c\,q|$;
> 10. $|d\,p| = |d\,q|$.
>
> Then `False`.  The proof consumes (C2) convex independence and the strict
> cap order derived from the packet; it uses no other hypothesis of Γ.

Four consequences of this unfolding are load-bearing and must be respected by
any candidate bridge:

* **Cap side.**  Both centers must lie in the **closed** cap $C_{i_1}$.
  Membership in $C_{i_1}^{\circ}$ is stronger and therefore sufficient;
  membership in $A$ alone, or in $C_{i_2}$, or in $m$, is **not**.
* **Pair side.**  Both pair points must lie in $A$ and **outside the closed
  cap** $C_{i_1}$.  A pair point on the cap chord, or equal to a Moser
  endpoint $a_1$ or $a_2$ of that cap, is inside the closed cap and is
  therefore excluded.
* **Distinctness.**  $c \ne d$ (the two centers) and $p \ne q$ (the two pair
  points) are both required.  There is **no** requirement that $c$ or $d$ be
  a blocker center, a unique-four center, or carry any K₄ structure; and no
  requirement that $c, d \notin \{p,q\}$ (that follows from 1,2,7,8).
* **Equidistance is exact and unsigned.**  $|cp| = |cq|$ is an equality of
  distances, not of squared distances up to sign, and not "approximately".

### 2.2 The one already-supplied center

Under (F3a) the first collision blocker $b$ is **already** such a center for
the pair $\{e,o\}$.  Precisely, and this is the verification the round-2
harness must reproduce and not take on faith:

* $b = c(s_1) = c(s_2)$ by (X4).
* $b \in C_{i_1}^{\circ} \subseteq C_{i_1}$ by (D5).
* $K(s_1) = S_b(r(s_1))$ is the **full** radius class of $A$ at center $b$
  and radius $r(s_1) > 0$, by (H1).
* $e \in K(s_1)$ by (F3a).3 and $o \in K(s_1)$ by (F3a).6.  Hence
  $|b\,e| = r(s_1) = |b\,o|$.
* $e, o \in A$ by (F3a).1, (F3a).5; $e \ne o$ by (F3a).5;
  $e \notin C_{i_1}$ by (F3a).4 and $o \notin C_{i_1}$ by (F3a).7 — both
  **closed**-cap non-memberships, exactly as §2.1 requires.

So hypotheses 1, 4, 5, 6, 7, 8 and 9 of §2.1 are discharged by Γ + (F3a) with
$c := b$, $p := e$, $q := o$, $k := i_1$.  The symmetric statement under
(F4b) holds with $b' = c(t_1) = c(t_2)$ in place of $b$ and $K(t_1)$ in place
of $K(s_1)$; every step above transfers verbatim (in the Lean tree the
$b$-side is discharged inside
`false_of_firstFiber_twoOutsideHits_of_capCenter`,
`FirstFiberOverlapDescent.lean:901`; the $b'$-side has no in-tree
counterpart yet and must be written).

**The entire remaining content of Bridge 2 is hypotheses 2, 3 and 10: a
second point of the closed first cap, distinct from $b$ (resp. $b'$), that is
equidistant from $e$ and $o$.**

### 2.3 Branch-A goal (the producer theorem)

**(B2-first)** — main variant.  Prove, as a source-clean theorem valid for
every configuration satisfying the stated hypotheses:

> Assume Γ (all of §1.2) together with (F3a).  Then there exist
> $d_1, d_2 \in C_{i_1}$ and $p, q \in A$ with
> $$d_1 \ne d_2,\qquad p \ne q,\qquad p \notin C_{i_1},\qquad q \notin C_{i_1},$$
> $$|d_1\,p| = |d_1\,q|,\qquad |d_2\,p| = |d_2\,q| .$$

**(B2-second)** — symmetric variant.  The same conclusion from Γ together
with (F4b).

Two permitted strengthenings of the hypotheses, both harmless for the leaf
coupling because **both** leaves carry the cap-eight source:

* (B2-first) may additionally assume (F3b); (B2-second) may additionally
  assume (F4a).  These are the *same* statement ($|C_{i_1}| \ge 8$ plus the
  named $g$ with clauses 1–9 of §1.4).
* Either variant may be proved in the specialized form where the second
  center is exhibited as $c(g)$ for the cap-eight source $g$ — i.e. by
  proving
  $$c(g) \in C_{i_1} \quad\text{and}\quad \{e,o\} \subseteq K(g),$$
  since $c(g) \ne b$ is clause 3 of (F3b) and $c(g) \ne b'$ is clause 4, and
  $e,o \in K(g)$ gives $|c(g)\,e| = r(g) = |c(g)\,o|$.

A proof of (B2-first) or (B2-second) is a complete Branch-A resolution of
this document **only if** the produced objects satisfy every one of the ten
hypotheses of §2.1 with the named pair — a candidate second center that
misses one condition is not a bridge (see §5).

### 2.4 Leaf coupling — what a proof buys

* (B2-first) + (D9) $\Rightarrow$ `False` from Γ + (F3a).  Leaf F3 assumes
  Γ + (F3a) + (F3b) + (F3c), so this closes **F3** outright, without using
  (F3b) or (F3c) at all.
* (B2-second) + (D9) $\Rightarrow$ `False` from Γ + (F4b).  Leaf F4 assumes
  Γ + (F4a) + (F4b), so this closes **F4** outright.
* Because `false_of_capSource_freshOutsideFirstBlockerFiber`
  (`FrontierLiveClosure.lean:7632`) routes through F3, closing F3 also makes
  that theorem sorry-free.
* Leaves F1 and F2 are **not** closed by this bridge and are out of scope
  here.  (Round 1 listed "a common outside pair with two distinct first-cap
  bisector centers" among the possible F2 producers, but F2's supplement
  supplies no named off-cap pair on a common blocker circle; do not claim F2
  as collateral.)

Note the asymmetry of strength: (B2-first) is **stronger** than leaf F3
requires.  If a proof genuinely needs (F3b), say so and use it; do not
manufacture a weaker statement and then claim the stronger one.

---

## §3 Assume-resolvable, direction-neutral framing

Assume for purposes of this task that Bridge 2 admits a complete resolution,
but **do not assume in advance which direction it takes**.  A complete
resolution must establish exactly one of the two statements in §4.

The two variants (B2-first) under (F3a) and (B2-second) under (F4b) are
independent obligations and may resolve in different directions; resolving
either one in either direction is independently valuable and must be
reported on its own.  Do not assume that the $\rho$-row data is a mirror
image of the $r$-row data: (X8)/(X9) are separate hypotheses, the two rows
have different radii by (X5), and the (M) data are not symmetric under
swapping $(s_i, b, r) \leftrightarrow (t_i, b', \rho)$ — (M2) designates
$u \in \{s_1,s_2\}$ while (M4) designates $u' \in \{t_1,t_2\}$, and neither
designation is known to be a specific element.

---

## §4 Dual-branch success criteria

### Branch A — the bridge is a consequence

A complete, rigorous proof of (B2-first) or of (B2-second) as stated in §2.3:
valid for *every* configuration satisfying Γ plus the named supplement, using
each hypothesis only as stated, formalizable in Lean 4 with mathlib and no
new axioms, with the in-project facts (D0)–(D13) of §1.3 usable as
established.

A complete Branch-A proof must contain, explicitly:

1. the construction or identification of the second center $d_2$ (a point of
   $\mathbb{R}^2$, named by a formula, a choice principle applied to a
   proved existence statement, or an element of a named finite set);
2. a proof that $d_2 \in C_{i_1}$ **as the closed indexed cap of the working
   packet $S$** — via the arc predicate of (P3), or via
   $d_2 \in C_{i_1}^{\circ}$, or via an already-proved cap membership;
3. a proof that $d_2 \ne d_1$, where $d_1$ is the other center;
4. a proof of $|d_2\,p| = |d_2\,q|$ for the *same* pair $\{p,q\}$ that $d_1$
   bisects — with $p \ne q$, $p,q \in A$, and $p,q \notin C_{i_1}$ (closed);
5. discharge of every arm of every disjunctive hypothesis actually used —
   in particular clauses 8 and 9 of (F3b) if (F3b) is used, and the
   first-apex split (Q5) in both frontier instances if it is used;
6. no additional assumptions.  Specifically forbidden: general position
   beyond (C2); genericity of the radii $r(x)$; symmetric or mirror
   placement of $\{e,o\}$; exact cap size $|C_{i_1}| = 8$; boundedness of
   $|A|$; injectivity or any distinctness of the blocker map $x \mapsto c(x)$
   beyond (X4)/(X11)/(F3b).3–4; any unstated incidence ("no three named
   points concyclic", "all shell radii distinct", "$e,o$ lie in distinct
   caps", …).

### Branch B — the bridge is not a consequence

An exact certificate that (B2-first) (resp. (B2-second)) does **not** follow
from Γ + (F3a) (resp. Γ + (F4b)).  Honest negation, quantifiers explicit:

> There exists a configuration
> $\big(A;\ O, R_0;\ v_1,v_2,v_3;\ C_1,C_2,C_3;\ \sigma;\ c(\cdot), r(\cdot),
> K(\cdot);\ r, \rho;\ q_r, w_r, q_\rho, w_\rho;\ s_1,s_2,t_1,t_2;\ u, u';\
> e, o\big)$
> satisfying **every** clause of Γ (§1.2) and **every** clause of (F3a)
> (§1.4) such that
> $$\forall\, p, q \in A,\ \forall\, d_1, d_2 \in C_{i_1}:\quad
>   \big(p \ne q \wedge p \notin C_{i_1} \wedge q \notin C_{i_1}
>   \wedge |d_1 p| = |d_1 q| \wedge |d_2 p| = |d_2 q|\big)
>   \;\Longrightarrow\; d_1 = d_2 .$$

**Structural warning about this negation — read before working on Branch B.**
The universally quantified clause displayed above is *automatic* in any
configuration satisfying (C2) and (P3): it is exactly (D9), which is
kernel-checked.  Therefore the real content of a Branch-B certificate is
**exhibiting a model of Γ + (F3a) at all**; the "at most one bisecting cap
center" clause then costs nothing beyond certifying that (C2) and the cap
structure hold, which the certificate must do anyway.  State this
relationship explicitly in any Branch-B submission — a submission that
presents the automatic clause as the substantive part has misread the
target.

A Branch-B certificate must supply the carrier $A$ with exact algebraic
coordinates (rational, or elements of an explicitly presented real number
field with exact arithmetic), all the named data above, and the packet rows,
each hypothesis verified exactly by symbolic algebra, never floating point.

Honest scale note (a specification, not a discouragement): such a carrier is
a finite convex-independent set with the K₄ property that is minimal among
**all** planar such sets — i.e. a full counterexample object for the
enclosing Erdős-97 program — with $|A| \ge 15$ from (T2)/(T3) and the cap-sum
identity, and $|A| \ge 17$ if (F3b) is included.  The universally quantified
items must be certified too: (C6) minimality over all smaller planar
configurations, (C7) over all packets on $A$, (U1) over all positive radii at
each blocker center, (H2) over all positive radii at each blocker center,
(T5), (T6), and every negative membership fact.  For radius-quantified items
this is a finite check (only finitely many pairwise distances occur); for
(C6) an exact finite reduction with proof is required.  A configuration
failing even one clause of Γ or of (F3a) is worthless for Branch B — see §5.

**Quantifier order.**  Branch A must treat all Γ-data and all (F3a)/(F4b)
data as universally given (arbitrary), producing the two centers uniformly.
Branch B chooses everything existentially, but must then verify all
Γ-clauses including their internal universal quantifiers.

The two branches are of **equal value**.  A Branch-B certificate kills this
closure route and must be reported as a resolution, not soft-pedaled.

---

## §5 Insufficient-progress list

Partial progress does not count unless it implies exactly one of the two
resolutions of §4.  In particular, the following are insufficient:

* **Wrong pair.**  Producing two distinct cap centers equidistant from *some*
  off-cap pair $\{p,q\}$ that is not shown to be a pair both of whose points
  lie outside the **closed** cap $C_{i_1}$ and both of which are bisected by
  the *same* two centers.  In particular, a second center for a pair
  different from the named $\{e,o\}$ is not a bridge unless the first center
  is also re-established for that pair.
* **Wrong cap.**  Producing a second center in $A$, in $C_{i_2}$, in $m$, or
  in the *interior* of a cap other than $C_{i_1}$.  §2.1 hypothesis 2 is
  membership in the closed indexed cap $C_{i_1}$ of the **working** packet
  $S$; a center in a cap of some *other* packet on $A$ does not satisfy it.
* **Pair point inside the closed cap.**  Using a pair point that lies on the
  chord, or equals a Moser endpoint of $C_{i_1}$, or is only known to be
  outside $C_{i_1}^{\circ}$.  (F3a).4 and (F3a).7 give closed-cap
  non-membership; nothing weaker suffices.
* **Missing distinctness.**  Failing to prove $d_1 \ne d_2$, or $p \ne q$.
  A "second center" that is not proved distinct from $b$ (resp. $b'$) is not
  a second center.  Note $c(g) \ne b$ is available *only* if (F3b)/(F4a) is
  assumed.
* **Sign or square errors.**  Establishing $|d_2 p|^2 = |d_2 q|^2$ over a
  ring where this does not entail $|d_2 p| = |d_2 q|$, establishing
  equidistance only up to sign, establishing it for the wrong center, or
  establishing perpendicular-bisector membership without proving that the
  bisector point is in the closed cap.
* **Re-deriving the single-center global-minimal-deletion data.**  The
  instantiation of (C6) that returns **one** cap center equidistant from some
  off-cap pair, or a `MinimalDeletionCore`, is already checked in-project and
  is stated exactly in §6.4.  Reproducing it, restating it, or repackaging it
  as a new object is not progress.  It does not identify its pair with
  $\{e,o\}$ and does not exclude its center being $b$.
* **Round-1-refuted local routes** (each is a named trap; see §7):
  * local perpendicular-bisector arguments and Kalmanson-style inequalities —
    the realizable convex order of the named points is the permitted
    *alternating* order, and the existing order-based contradiction theorems
    require a **non**alternating order;
  * two-circle counting to force a third common point — the sharp bound is
    $|K(x) \cap K(y)| \le 2$ (D11) and exact convex models **attain** two, so
    counting alone never yields three;
  * blocker-map two-cycles — they produce mutual center *omissions*, not
    common support points;
  * unique-four cover counting — $|A| \le 4|\mathrm{NR}|$ is a lower bound on
    the number of non-robust centers, not a contradiction; three
    collision-fiber excesses can exactly account for the three robust apices.
* **Unverified use of the CONJECTURE items.**  The two round-1 items listed
  in §7.1 are *not* background.  Using CONJECTURE-(i) (F3c-redundancy) or the
  F4 half of CONJECTURE-(ii) as an established fact invalidates the argument.
* **Conditional results.**  "If additionally $c(g)$ lies in the first cap,
  then …", or "if $e$ and $o$ are in different caps, then …", unless the
  condition is itself proved from Γ + the named supplement.
* **Numerical evidence.**  Floating-point near-configurations, sampled
  models, or interval-arithmetic exclusions of a bounded parameter region
  without a proof that the region covers all configurations satisfying the
  hypotheses.
* **Partial model extensions for Branch B.**  The repository's exact rational
  15-point strictly convex model
  (`scratch/full-local-euclidean-model-complete/`) realizes all four
  principal local exact-four classes but fails Γ: twelve of its fifteen
  centers have no K₄ class, and it lacks a production MEC packet, a full
  critical-shell system, and three rich robust apices.  Extending a local
  model *toward* Γ without reaching **every** global hypothesis — (C3) at
  every carrier point, (C6), (C7), (U1), (H2), (T5), (T6), the frontier pairs
  and their packets, the (M)-cycle data — belongs on this insufficient list,
  not in a Branch-B report.  The same applies to the 17-point finite
  incidence model and the two-collision cap-order model: neither is a
  Euclidean `CounterexampleData` model.
* **Solver output without a certificate.**  SAT/SMT/Gröbner/interval output
  with no verifiable certificate or kernel-checkable reconstruction, or with
  an unvalidated encoding.  Every encoding must first pass a smoke test
  against a known small instance.
* **Combinatorial-only claims.**  Oriented-matroid-level consistency or
  inconsistency of an incidence pattern without metric realization or metric
  elimination.
* **Citing a sibling obligation.**  Proving the bridge by citing leaf F1, F2,
  F3 or F4, the parent coordinator
  `exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`,
  or any of its unproved consumers.
* **Equivalence-strength reduction** (verbatim guard, applies to every route
  in this document): *reducing the problem to another unproved planar
  incidence or cap-counting statement of comparable strength.*  A route that
  ends at an unproved lemma equivalent in strength to the original problem is
  not close to completion unless it supplies a genuinely new proof of that
  lemma.  Concretely on this bridge, each of the following is such a
  reduction and does **not** count: "every 8-point cap contains a source
  whose exact row meets $K(s_1)$ outside the cap"; "two exact-four rows with
  distinct blockers meet in at most one strict-cap point"; "some carrier
  point other than $b$ lies on the perpendicular bisector of $\{e,o\}$ inside
  $C_{i_1}$" restated without proof; "the cap-eight source can be chosen with
  $c(g)$ in the cap".

---

## §6 Allowed background

Standard proved theorems from planar Euclidean geometry, finite
combinatorics and convexity may be used, but they must be stated accurately
and applied with all necessary hypotheses and uniformity: two distinct
circles meet in at most two points; the perpendicular-bisector
characterization of equidistance; basic convex-position facts; pigeonhole;
double counting.  Mathlib's `EuclideanGeometry` and `Finset` libraries set
the formalization baseline.

The in-project facts (D0)–(D13) of §1.3 are established background, each
kernel-checked at the location in Appendix A.  They mean exactly what §1.3
states.  In particular (D8) and (D9) are statements about **closed** indexed
caps of the **working** packet and require (C2); they do **not** extend to
arbitrary subsets of $A$, and (D9) does **not** bound bisector points of
pairs that are not both outside the closed cap.

Known results on repeated distances in convex position (Erdős–Moser-type
bounds) may be used only as accurately stated published theorems with all
hypotheses; they do not by themselves settle this bridge.

The following theorems (§6.1–§6.4; §6.4(b) is a validated scratch artifact,
not in-project) are additionally available as established background.  Each
has been read in source this session and each lives in a file containing no
`sorry`.

### 6.1 The uniqueness theorem (D9)

`Problem97.CapSelectedRowCounting.outsidePair_unique_capCenter`
(`CapSelectedRowCounting.lean:283`) — the general ordered-cap form, stated
over an `OrderedCap` with a strict cap order and cap-index hypotheses.  The
ten-hypothesis unfolding in §2.1 is its packet-form specialization
`false_of_two_cap_centers_equidistant_outside_pair`
(`FirstFiberOverlapDescent.lean:111`), which is the form a producer should
target.

*It does not imply* anything about pairs with a point inside the closed cap;
it does not imply a bound on the number of cap points equidistant from a
*single* off-cap point; it does not imply that the two centers must be
blocker centers; and it does not by itself produce any center.

### 6.2 The F3-side consumer (the bridge's exact sink)

`Problem97.ATailFirstFiberOverlapDescent.false_of_firstFiber_twoOutsideHits_of_capCenter`
(`FirstFiberOverlapDescent.lean:901`).  In mathematics: assume Γ, the first
collision row $P$ (giving $s_1,s_2,b$), the second collision row $P_\rho$,
and a witness $Q$ of (F3a) (giving $e := Q.\mathrm{source}$,
$o := Q.\mathrm{otherOutsidePoint}$).  Let $g \in A$ be **any** carrier point
such that

* $c(g) \in C_{i_1}$ (closed cap),
* $c(g) \ne b$,
* $e \in K(g)$,
* $o \in K(g)$.

Then `False`.

The proof is exactly the §2.2 chain plus (D9): $b \in C_{i_1}$ from (D5);
$|c(g)e| = |c(g)o|$ because both lie on the exact shell $K(g)$;
$|be| = |bo|$ because both lie on $K(s_1)$; then
`false_of_two_cap_centers_equidistant_outside_pair`.

*It does not imply* that such a $g$ exists.  It does not locate $c(g)$.  It
does not place $e$ or $o$ in $K(g)$.  It is a sink, not a producer — it is
the reason Branch A of §2.3 closes leaf F3, and nothing more.

**There is no in-tree counterpart on the F4 side.**  A search of `lean/`
for consumers of `FreshOutsideSecondBlockerFiber` finds only the structure
declaration (`BlockerMultiplicityGeometry.lean:161`), its appearance in the
`GeometricMultiplicityResidual` disjunction (`:319`), and the F4 leaf itself
(`FrontierLiveClosure.lean:7650`).  (A stale duplicate of the declaring
module exists at `scratch/global-exact-four-prover/BlockerMultiplicityGeometry.lean`;
it is not imported by anything.)  A (B2-second) proof must therefore also
supply the symmetric sink, obtained from §2.2 by replacing $b$ with $b'$ and
$K(s_1)$ with $K(t_1)$.

### 6.3 The three-overlap terminal

`Problem97.ATailFirstFiberOverlapDescent.false_of_firstFiber_explicit_overlap_card_ge_three`
(`FirstFiberOverlapDescent.lean:772`).  In mathematics: under Γ, the two
collision rows, and a witness $Q$ of (F3a), if $g \in A$ satisfies
$c(g) \ne b$ and
$$\big|\,K(g) \cap \{s_1, s_2, e, o\}\,\big| \ge 3,$$
then `False`.  (Via (D12): $\{s_1,s_2,e,o\} = K(s_1)$, and two distinct
circles share at most two carrier points.)

*It does not imply* any overlap.  It is the second sufficient terminal
identified in round 1 and is **not** this bridge; it is listed here so that
agents do not rediscover it and mistake it for the target.

### 6.4 The single-center global-minimal-deletion producers

Read exactly, these are all that (C6) currently supplies in this branch.

**(a)** `Problem97.ATailGlobalMinimalDeletion.exists_fresh_sharedRadiusPair_or_minimalDeletionCore`
(`GlobalMinimalDeletion.lean:220`).  For a minimal carrier $A$ and any
prescribed $U \subseteq A$ with $U \ne \varnothing$ and $A \setminus U \ne
\varnothing$: there exist $\mathrm{ctr} \in A \setminus U$ and a nonempty
$V \subseteq U$ with $\lnot K_4(A \setminus V, \mathrm{ctr})$ and **either**

* $\exists\, s, t \in V$ with $s \ne t$ and
  $|\mathrm{ctr}\,s| = |\mathrm{ctr}\,t|$, **or**
* a `MinimalDeletionCore` on $(A, V, \mathrm{ctr})$: one exact critical
  four-shell per member of $V$, all centered at $\mathrm{ctr}$, with pairwise
  disjoint supports.

**(b)** `Problem97.HardBranchGlobalMinimalityScratch.exists_capCenter_sharedOutsidePair_or_offCapMinimalCore`
(`scratch/hard-branch-math/GlobalMinimalityOffCapInstantiation.lean:31`;
scratch, source-clean, `#print axioms` reported clean in its REPORT).  This
instantiates (a) with $U := A \setminus C_{i_1}$ under $|C_{i_1}| \ge 8$ and
$|K(s_1) \setminus C_{i_1}| = 2$, obtaining $\mathrm{ctr} \in C_{i_1}$, a
nonempty $V \subseteq A \setminus C_{i_1}$ with
$\lnot K_4(A \setminus V, \mathrm{ctr})$, and the same two-arm disjunction.

**(c)** `Problem97.ATailGlobalMinimalDeletion.five_le_selectedClass_of_restoration_and_sharedRadius`
(`GlobalMinimalDeletion.lean:101`).  If $U \subseteq A$, $s, t \in U$,
$s \ne t$, $K_4(A \setminus (U \setminus \{s\}), \mathrm{ctr})$,
$\lnot K_4(A \setminus U, \mathrm{ctr})$, and
$|\mathrm{ctr}\,s| = |\mathrm{ctr}\,t|$, then
$$\big|S_{\mathrm{ctr}}(|\mathrm{ctr}\,s|)\big| \ge 5 .$$
This theorem is currently **unconsumed** anywhere in `lean/`.

**What (a)–(c) do NOT provide** — this is the round-1 finding, re-verified
against the three sources this session, and it is the precise reason Bridge 2
is open:

* They supply **one** center in the cap ($\mathrm{ctr}$), never two.  (D9)
  needs two distinct cap centers for the **same** outside pair; no theorem in
  the tree identifies or manufactures the second.
* The pair $\{s,t\} \subseteq V$ delivered by the shared-radius arm is **not
  identified** with the named off-cap pair $\{e,o\}$ of (F3a).  It is only
  known to lie in $A \setminus C_{i_1}$.
* Nothing excludes $\mathrm{ctr} = b$.  If $\mathrm{ctr} = b$ the arm is
  vacuous for (D9).
* The minimal-core arm has no source-clean terminal:
  `MinimalDeletionCore.capByIndex_card_ge_six_of_two_sources`
  (`ATail/MinimalDeletionCore.lean:226`) and
  `MinimalDeletionCore.capByIndex_card_ge_six` (`:295`) require an
  unavailable equality between the core center and an indexed opposite apex
  and in any case yield only the already-known bound $|C_{i_1}| \ge 6$; the
  more contextual `false_of_exactFourMutualOmissionRigid221_minimalCore`
  (`ATail/FrontierLiveClosure.lean:2253`) is itself proved by `sorry`
  (`:2294`).
* (c) produces a **five**-point radius class at $\mathrm{ctr}$, which is a
  statement about *one* center, not a second bisector; it does not place
  $\mathrm{ctr}$ in the cap and does not name its pair.

Consequently: producing a bridge by citing (a), (b) or (c) and asserting that
a second center "may be taken" is precisely the failure mode this document
exists to prevent.

---

## §7 Multiagent orchestration

Use multiagent orchestration aggressively and dynamically.  You have up to 40
concurrent agents available.  Do not use a fixed assignment such as "N agents
for strategy X."  Manage the search with the heuristics below.

### 7.1 Candidate first verifications — CONJECTURE items, kernel-check before use

Two claims from the round-1 response are **CONJECTURE**.  They are not
background, they may not be cited, and any argument that uses them without
first discharging them is invalid.  Dispatch them first: either outcome
reshapes the route.

**CONJECTURE-(i) — F3c-redundancy.  Check this FIRST.**  The claim is:
modulo Γ and (F3b), the five-center-deletion arm (F3c) follows, so leaf F3's
unresolved core already lives in Γ + (F3a) + (F3b).  The proposed chain is:

1. (F3b).8 gives some $s_i \in \{s_1,s_2\}$ with $s_i \notin K(g)$;
2. $s_i \notin K(t_1)$, because $s_i \in C_{i_1}^{\circ} \subseteq C_{i_1}$
   by (X3) and $K(t_1) \cap C_{i_1} = \{t_1,t_2\}$ by (D4), while
   $\{s_1,s_2\} \cap \{t_1,t_2\} = \varnothing$ by (X10);
3. by (D1), 1 and 2 give $K_4(A \setminus \{s_i\}, c(g))$ and
   $K_4(A \setminus \{s_i\}, b')$;
4. $\mathrm{Robust}(a_0), \mathrm{Robust}(a_1), \mathrm{Robust}(a_2)$ by
   (D6)+(T4) give the remaining three survivals;
5. steps 3–4 are exactly arm 1 (if $s_i = s_1$) or arm 3 (if $s_i = s_2$) of
   (F3c); the $t$-arms follow symmetrically from (F3b).9.

Kernel-check this in Lean against the actual `FiveCenterDeletionSurvival` and
`FirstFiberCollisionFiveCenterDeletionResidual` definitions
(`FirstFiberOverlapDescent.lean:39,85`) before relying on any statement of the
form "F3 reduces to Γ + (F3a) + (F3b)".  If it holds, (F3c) may be dropped
from consideration entirely and every agent working the F3 side should be
told so.  If it fails, report the exact failing step — the residual is then a
genuine extra hypothesis available to Branch A.

**CONJECTURE-(ii) — the sharpened sufficient terminals.**  The round-1 claim
is that F3 and F4 each close under either
$$|K(g) \cap K(s_1)| \ge 3 \qquad\text{(resp. } |K(g) \cap K(t_1)| \ge 3\text{)}$$
or
$$c(g) \in C_{i_1} \ \wedge\ \{e,o\} \subseteq K(g),$$
the latter yielding this bridge's conclusion with second center $c(g)$.
Status, verified this session:

* the reading of the second terminal is **correct** for the first fiber, and
  the corresponding sink is the kernel-checked §6.2 theorem;
* the first terminal is **correct** for the first fiber, and is the
  kernel-checked §6.3 theorem;
* **for the second fiber both terminals are CONJECTURE**: no in-tree
  declaration consumes `FreshOutsideSecondBlockerFiber`.  Before relying on
  the F4 side, write and kernel-check the two symmetric sinks.

Do not treat "$c(g) \in C_{i_1} \wedge \{e,o\} \subseteq K(g)$" as the only
admissible bridge shape.  §2.1 shows the second center need not be a blocker
center at all: **any** $d \in C_{i_1} \setminus \{b\}$ with $|de| = |do|$
suffices.  Agents that fixate on $c(g)$ are searching a strictly smaller
space than the target permits.

### 7.2 Approach portfolio

Begin with a genuinely diverse portfolio.  Agents should explore
substantially different formulations, invariants, reductions, and
computational sanity checks, drawn from at least these families:

1. **Perpendicular-bisector occupancy.**  The bisector $\ell$ of $\{e,o\}$ is
   a line; $b \in \ell \cap C_{i_1}$.  Ask what forces a **second** carrier
   point of $C_{i_1}$ onto $\ell$: cap cardinality ($\ge 8$ under (F3b)),
   convex order along the cap arc, the position of $\ell$ relative to the
   chord $a_1 a_2$, or the MEC.
2. **Blocker-fiber size forcing.**  $b$'s fiber $c^{-1}(b)$ contains
   $s_1, s_2, e$ under (F3a).2.  Push on (U1): $b$ carries exactly one K₄
   radius.  Combine with (H2) at each fiber member.  Ask whether a second
   fiber whose center also lies in $C_{i_1}$ must contain both $e$ and $o$.
3. **Exact-row bookkeeping across the full row system.**  $K(s_1)$, $K(t_1)$,
   $K(g)$, $K(e)$, $K(o)$, $S_{a_1}(r)$, $S_{a_1}(\rho)$, and the packet rows
   $B_1, B_2$ of (R3)/(M1)–(M4).  Every pair of distinct (center, radius)
   pairs overlaps in $\le 2$ points (D11); every row centered in $C_{i_1}$
   meets $C_{i_1}$ in $\le 2$ points (D8).  Look for a counting configuration
   that forces two rows centered in the cap to share the two off-cap points.
4. **The shells of $e$ and $o$ themselves.**  $e, o \in A$, so by (H1) each
   has its own blocker $c(e), c(o)$ and exact shell.  (F3a).2 pins
   $c(e) = b$.  $c(o)$ is unconstrained by the supplement — determine what Γ
   forces about it, and whether $c(o) \in C_{i_1}$ can be derived or refuted.
   If $c(o) \in C_{i_1}$ and $e \in K(o)$, the bridge is done.
5. **Cap/arc convex ordering.**  Radial monotonicity along a convex arc;
   ordered occupancy of $C_{i_1}$ ($\ge 8$ points under (F3b); named
   occupants $s_1, s_2, t_1, t_2, b, b', g, a_1, a_2$).  Beware: the
   *alternating* order is realizable (see §7.3).
6. **Global minimality with a different prescribed deletion.**  §6.4(b)
   deletes $A \setminus C_{i_1}$.  Try other prescribed $U$: $\{e, o\}$
   alone; $\{e,o\} \cup \{s_1\}$; $A \setminus (C_{i_1} \cup \{e,o\})$;
   $K(s_1) \setminus C_{i_1}$.  Each choice moves where the returned center
   can live and which pair the shared-radius arm can name.  This is the most
   direct attack on the "$\{s,t\}$ is not $\{e,o\}$" gap of §6.4.
7. **The unconsumed five-point class.**  §6.4(c) yields
   $|S_{\mathrm{ctr}}(\cdot)| \ge 5$.  Under (U1) a blocker center carries a
   unique K₄ radius with exactly 4 points, so a 5-point class at
   $\mathrm{ctr}$ forces $\mathrm{ctr}$ to not be a blocker value.  Chase the
   consequences; a 5-point class inside the configuration is a strong object
   and is currently unused.
8. **(C7)/`noM44` re-packeting.**  Construct an alternative surplus-cap
   packet on the same $A$ (different Moser triangle) whose two non-surplus
   caps both have exactly 4 points.  This is Bridge 4 and is out of scope
   here, but a *partial* re-packeting can relocate the cap boundary and turn
   an existing bisector point into a cap point.  Track carefully which
   packet's $C_{i_1}$ each claim is about — §2.1 hypothesis 2 is about the
   working packet.
9. **Exact coordinate normalization + polynomial elimination.**  Place $a_1$
   at the origin, normalize $r$, fix a combinatorial pattern (cap assignment,
   which named points are on which named circles), and eliminate
   (resultants, Gröbner via msolve/Singular).  The enumeration of patterns
   must be proved exhaustive; (C6) is not semialgebraic in a fixed-$n$
   encoding and must be handled separately.
10. **SMT over nonlinear real arithmetic** (Z3/cvc5) on the existential
    fragment of a fixed pattern, with validated encodings.
11. **SAT/ILP enumeration of incidence patterns** under the cardinality
    constraints, followed by per-pattern geometric elimination.
12. **Pigeonhole on cap occupancy and blocker fibers.**  Fibers of $c$
    restricted to $C_{i_1}^{\circ}$; sizes forced by (X8)/(X9)/(F3b) and
    $|C_{i_1}| \ge 8$; the blocker-value budget from (T5)/(D10).
13. **Repeated-distance extremal counting in convex position** applied to the
    exact-4 classes: each unique-four center contributes four equal
    distances.
14. **Blocker-map digraph structure.**  $x \mapsto c(x)$ has no fixed points,
    every value is a unique-four center, iterates cycle; study the
    interaction of a cycle with the first collision fiber $\{s_1,s_2,e\}$.
15. **Exact Branch-B search.**  Small algebraic carriers ($n = 15..20$),
    structured families (orbits of a rotation, points on few concentric
    circles), checked exactly against the full clause list of §1.2 + §1.4.
    Report which clause fails first for each candidate — that is the useful
    output even when the search fails.
16. **Interval-arithmetic certified exclusion** over normalized parameter
    boxes, as evidence and to guide pattern pruning (must be upgraded per
    §5).

### 7.3 Named attractors — do not let agents converge here

Do not tell most agents the currently favored approach.  Preserve
independence during early rounds.  The known seductive dead ends on this
bridge are:

* **(A1) The $c(g)$ fixation.**  Assuming the second center must be $c(g)$
  for the cap-eight source, and then trying to force $c(g)$ into the cap by
  elimination.  §2.1 permits any cap point; and round 1 already established
  that (F3b) supplies only *omissions* at $K(g)$, never a location for
  $c(g)$.
* **(A2) Heuristic overdetermination counts.**  "Too many circles through too
  few points", "five constraints on four points is overdetermined".  These
  never produce an exact elimination and are explicitly on the §5 list.
* **(A3) Hidden symmetry on $\{e,o\}$ or between the two rows.**  Treating
  $\{e,o\}$ as symmetric about a cap axis, or the $\rho$-row data as a mirror
  image of the $r$-row data.  Nothing in Γ gives either.
* **(A4) Local-geometry contradiction.**  Round 1 established that the local
  circle, cap-order, collision and mutual-omission data are **jointly
  realizable** in exact convex geometry: there is an exact rational strictly
  convex 15-point model with all four principal local exact-four classes, and
  an exact rational model with two distinct apex radii, two disjoint
  equidistant source pairs, distinct blockers, all six roles in one strict
  cap and a compatible strict-convex cyclic order.  The realizable order is
  the permitted **alternating** one; the existing order-based contradiction
  theorems require a nonalternating order.  Any proof that never uses (C6),
  (C7), (C3)-at-every-point, or (T5) is refuted by these models before it is
  written.
* **(A5) Two-circle counting for a third point.**  The bound
  $|K(x) \cap K(y)| \le 2$ is sharp and attained in exact convex models.

Maintain an explicit registry of approach families.  Group agents by the
mathematical idea they are using, not by superficial wording.  If many agents
converge to one family, redirect some toward underexplored formulations.  Do
not allow one approach to dominate merely because it gives an elegant
reformulation.  When an approach stalls at a theorem-strength missing lemma,
mark that route as blocked; only continue assigning agents to it if someone
proposes a materially new mechanism, invariant, construction, quantitative
estimate, or exact-elimination device.

Keep several incompatible routes alive through multiple rounds.  Maintain
both Branch-A routes and Branch-B routes until one side is rigorously ruled
out.  Cross-pollinate only after independent agents have developed their
routes far enough to expose their real strengths and gaps.

Use computational agents throughout: exact small-case computation,
SAT/ILP/SMT encodings, Gröbner eliminations per pattern, candidate Branch-B
searches, and counterexample searches against proposed intermediate lemmas.
Always validate an encoding against a known result first.  Computation is
evidence unless converted into a rigorous general proof or an exact
certificate completing a valid reduction.

Search aggressively for counterexamples to proposed lemmas.  Before any
intermediate lemma is relied on, assign agents (computational where possible)
to attempt to refute it — configurations satisfying a *subset* of Γ are cheap
to build and often kill overstated sublemmas.  A found counterexample kills
the route immediately and cheaply; a lemma that has survived no refutation
attempt is not established.

### 7.4 Adversarial checklist

Use adversarial agents throughout — independent agents that did not produce
the argument under audit.  Every candidate proof must be checked for:

* **§2.1 hypothesis 1/2:** each claimed center proved to lie in the **closed**
  indexed cap $C_{i_1}$ of the **working** packet; interior membership
  distinguished from closed membership; no silent substitution of $C_{i_2}$,
  $m$, or a cap of a different packet.
* **§2.1 hypothesis 3:** $d_1 \ne d_2$ proved, with the source of the
  distinctness named (e.g. (F3b).3 for $c(g) \ne b$) — not assumed.
* **§2.1 hypotheses 4–6:** $p, q \in A$ and $p \ne q$ proved.
* **§2.1 hypotheses 7/8:** $p, q \notin C_{i_1}$ **closed**; not merely
  $\notin C_{i_1}^{\circ}$; Moser endpoints $a_1, a_2$ correctly treated as
  members of the closed cap.
* **§2.1 hypotheses 9/10:** exact distance equalities for the **same** pair;
  no squared-distance or sign slippage; no confusion of $r(g)$ with $r(s_1)$.
* (C2) convex independence used exactly as stated (extreme points, not
  "general position").
* $K_4$ always with a strictly positive radius and the correct ambient set —
  which point was deleted, and from what.
* (C6) minimality applied with its true quantifier (all planar sets, not
  subsets of $A$) and never in a circular descent.
* (C7) applied to **all** packets on $A$, not only the working packet.
* Exact cardinalities where hypothesized ($=4$ in (X6)/(X7)/(H1), $\le 2$ in
  packets) versus lower bounds elsewhere ($\ge 4$, $\ge 6$, $\ge 8$).
* $K(x)$ used as the **full** radius class in both directions: nothing else
  of $A$ is on that circle, and the four listed points are all of it.
* (H2) criticality invoked only at the deleted point's own blocker.
* (U1) unique-radius used only at blocker values $c(x)$, never at arbitrary
  carrier points.
* Robustness/richness claimed only where given ((T1), (T4), (D6)).
* Frontier data: $q_\star, w_\star \notin m$; the two frontier instances kept
  distinct; (Q5)'s second arm correctly refuted via (X5)–(X7) when used.
* Collision data: equal-blocker identities used with the right pair;
  (X8)/(X9) are about the **strict** interior; (X10) does not by itself give
  (X11).
* (M)-cycle facts: $u$ and $u'$ are fixed but **unknown** elements of their
  pairs — no proof may assume $u = s_1$ or $u' = t_1$.
* Packet clauses used as stated (rows live in $A$ minus the deleted point and
  the center; overlap bound is $\le 2$, not $= 2$).
* (F3a)/(F4b) fields: every clause consumed or explicitly declared unused;
  in particular (F3a).8 / (F4b).8, the exact two-point off-cap remainder, is
  an equality, not an inclusion.
* CONJECTURE-(i) and the F4 half of CONJECTURE-(ii) never used as
  established.
* Every item of §5.
* Circular use of a statement equivalent to the bridge's conclusion, to a
  Family-F leaf, or to the parent coordinator.

Require agents to return concrete lemmas, constructions, equations, exact
certificates, encodings with validation runs, or counterexamples to proposed
sublemmas.  Reject status reports, vague optimism, and claims that an
unproved incidence statement is "routine."

The root agent should repeatedly synthesize, challenge, redirect, and launch
new rounds.  Do not stop after the first wave fails.  Produce a completed
resolution only if it survives adversarial audit; otherwise report only the
strongest rigorously proved derivation and its exact remaining gap.

---

## §8 Anti-quit

Do not return merely because current approaches fail or agents report
theorem-strength gaps.  Continue launching new rounds, reopening blocked
approaches only when there is a genuinely new mechanism, and searching for
fresh formulations.  Round 1 already returned "no theorem identifies or
manufactures that second center"; repeating that finding is not a result.

Spend at least **six full rounds of the §7.2 portfolio** on (B2-first), and
at least **four** on (B2-second), before even thinking of returning.  The two
CONJECTURE items of §7.1 must be kernel-checked in the first round.

---

## §9 Return contract

Return only when Bridge 2 has been completely resolved in at least one
variant — a Branch-A producer theorem meeting every requirement of §4
Branch A for (B2-first) or (B2-second), or a Branch-B exact certificate
meeting every requirement of §4 Branch B — and the argument survives
adversarial audit.

Do not return a reduction, a partial result, an isolated missing lemma, a
finite computation, a numerical guess, a "best effort" summary, or an
explanation of why the problem is difficult.  Do not stop, return, or give up
until at least one complete and rigorous resolution exists; continue
exploring every plausible approach, repairing failed arguments, and
developing new ones.

If, after exhausting the portfolio repeatedly, a variant remains open, the
final report must state, for that variant:

1. the strongest rigorously proved derivation, with every hypothesis used;
2. the exact remaining gap as a precisely stated mathematical statement, in
   the §2.1 hypothesis vocabulary (which of the ten conditions is missing and
   for which candidate objects);
3. the audit trail of refuted intermediate lemmas, with the refuting
   configuration or argument for each;
4. the outcome of the two §7.1 CONJECTURE checks, as kernel-checked facts or
   as explicit failures with the failing step named.

---

## §10 Web-search restriction

Public search may be used only for ordinary mathematical background or
standard named theorems (convex-position distance counting, circle incidence,
real algebraic elimination), not to search for a solution to this exact
obligation, to this formalization project, or to Erdős problem 97's status.
Do not search the public web to determine whether these statements are open,
and do not answer that they are open.

---

## Appendix A — Declaration names and locations

All paths relative to the repository root of `erdos-97-96-formalization`.
Every line number below was read in source while writing this document.  Each
of the four files `CapSelectedRowCounting.lean`, `FirstFiberOverlapDescent.lean`,
`GlobalMinimalDeletion.lean`, `BlockerMultiplicityGeometry.lean` contains no
occurrence of `sorry`.

### The Family-F leaves (Γ block: `FrontierLiveClosure.lean:7421–7469`)

| Leaf | Declaration (namespace `Problem97.TwoSourceExactCollisionRowsTerminal`) | Location (`sorry`) |
|---|---|---|
| F1 | `false_of_crossBlockerCoincidence` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7476` (`:7479`) |
| F2 | `false_of_capSource_freshThirdBlockerFiber` | `…/FrontierLiveClosure.lean:7486` (`:7490`) |
| **F3** | `false_of_capSource_firstFiber_collisionFiveCenterDeletion` | `…/FrontierLiveClosure.lean:7620` (`:7628`) |
| **F4** | `false_of_capSource_freshOutsideSecondBlockerFiber` | `…/FrontierLiveClosure.lean:7648` (`:7652`) |

Sorry-free neighbours in the same section: `firstFiber_shell_eq_explicitFour`
(`:7495`), `FirstFiberCapSourceWitness` (`:7521`, `abbrev`),
`capSource_firstFiber_descent` (`:7554`, `private`).
`false_of_capSource_freshOutsideFirstBlockerFiber` (`:7632`) is **not**
sorry-free: its proof routes through F3.

### The uniqueness theorem and its consumable form

| Object | Declaration | Location |
|---|---|---|
| (D9), general | `Problem97.CapSelectedRowCounting.outsidePair_unique_capCenter` | `lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:283` |
| (D9), packet form | `false_of_two_cap_centers_equidistant_outside_pair` (`private`) | `lean/Erdos9796Proof/P97/ATail/FirstFiberOverlapDescent.lean:111` |
| (D8) | `Problem97.CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two` | `lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:257` |

Other `private` copies of the packet form exist at
`ATail/RetainedMatchingLargeCapConsumer.lean:68`,
`ATail/FirstApexInteriorPairGeometry.lean:71` and
`ATail/TwoCenterCapLocalization.lean:60`; all four are file-private, so a new
module must cite the `CapSelectedRowCounting` original or re-derive.

### The bridge's sinks (Branch-A consumers)

| Object | Declaration | Location |
|---|---|---|
| F3 sink (§6.2) | `Problem97.ATailFirstFiberOverlapDescent.false_of_firstFiber_twoOutsideHits_of_capCenter` | `lean/Erdos9796Proof/P97/ATail/FirstFiberOverlapDescent.lean:901` |
| three-overlap terminal (§6.3) | `Problem97.ATailFirstFiberOverlapDescent.false_of_firstFiber_explicit_overlap_card_ge_three` | `…/FirstFiberOverlapDescent.lean:772` |
| its base lemma | `Problem97.false_of_centerAt_selectedFourClass_inter_card_ge_three` | `lean/Erdos9796Proof/P97/ATail/MinimalUniqueFourCover.lean:375` |
| F4 sink | **does not exist** — must be written | — |

### The single-center producers (§6.4)

| Object | Declaration | Location |
|---|---|---|
| (a) | `Problem97.ATailGlobalMinimalDeletion.exists_fresh_sharedRadiusPair_or_minimalDeletionCore` | `lean/Erdos9796Proof/P97/ATail/GlobalMinimalDeletion.lean:220` |
| (a) support | `…​.exists_global_cardMinimal_blocking_subdeletion` | `…/GlobalMinimalDeletion.lean:178` |
| (a) support | `…​.exists_cardMinimal_blocking_subdeletion` | `…/GlobalMinimalDeletion.lean:61` |
| (a) support | `…​.not_hasNEquidistantProperty_of_nonempty_proper_subset` | `…/GlobalMinimalDeletion.lean:32` |
| (c) | `…​.five_le_selectedClass_of_restoration_and_sharedRadius` | `…/GlobalMinimalDeletion.lean:101` |
| (b) | `Problem97.HardBranchGlobalMinimalityScratch.exists_capCenter_sharedOutsidePair_or_offCapMinimalCore` | `scratch/hard-branch-math/GlobalMinimalityOffCapInstantiation.lean:31` |
| round-1 audit of (a)–(c) | — | `scratch/hard-branch-math/REPORT.md` |

### Round-1 provenance and models

| Object | Location |
|---|---|
| round-1 response | `docs/solve-prompts/2026-07-27-f-round1-response.md` |
| round-1 prompt (the F doc) | `docs/solve-prompts/2026-07-27-exact-collision-terminals.md` |
| 15-point exact rational local model | `scratch/full-local-euclidean-model-complete/` (`REPORT.md`, `check_model.py`, `K4_EXTENSION_OBSTRUCTION.md`) |

---

## Appendix B — Math object ↔ Lean structure

| §1 object | Lean name | Location |
|---|---|---|
| carrier + (C1)–(C5) bundle | `CounterexampleData` | `lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:83` |
| K₄ predicates | `Erdos97.HasNEquidistantPointsAt` / `Erdos97.HasNEquidistantProperty` | `lean/.lake/packages/formal_conjectures/FormalConjectures/ErdosProblems/97.lean:34,48` |
| convex independence | `Problem97.ConvexIndep` | `lean/Erdos9796Proof/P97/Foundation.lean:28` |
| (C6) minimality | `CounterexampleData.Minimal` | `lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:158` |
| (C7) $(m,4,4)$ predicate | `SurplusCapPacket.IsM44` | `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:443` |
| radius class $S_p(r)$ | `SelectedClass` | `lean/Erdos9796Proof/P97/WitnessPacketInterface.lean:59` |
| MEC $(O, R_0)$ | `MEC.mec` | `lean/Erdos9796Proof/P97/MEC/Basic.lean:275` |
| (P2) triangle | `MEC.NonObtuseCircumscribedMoserTriangle`; `MoserTriangle` | `lean/Erdos9796Proof/P97/Moser/TriangleNonObtuse.lean:667`; `Cap/Structure.lean:98` |
| (P3) caps + arc predicate | `CapTriple`; `OnArcOpposite` / `signedArea2` | `lean/Erdos9796Proof/P97/Cap/Structure.lean:161`; `Foundation.lean:57,49` |
| packet $S$, $m$, $\sigma$ | `SurplusCapPacket` | `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:332` |
| $a_0, a_1, a_2$ | `surplusApex` / `oppApex1` / `oppApex2` | `lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:313,297,305` |
| $C_i$, $C_i^{\circ}$, $i_1$ | `capByIndex` / `capInteriorByIndex` / `oppIndex1` | `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:466,474,521` |
| (H1)–(H2) system $c, r, K$ | `CriticalShellSystem` (`centerAt`, `selectedAt`, `no_qfree`) | `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1015` |
| shells | `CriticalFourShell` / `CriticalSelectedFourClass` | `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:547,635` |
| carrier vertex (subtype) | `CriticalShellSystem.CarrierVertex` | `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1111` |
| 4-point row (abstract) | `SelectedFourClass` | `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:405` |
| $\mathrm{Packet}(x; z_1, z_2)$ | `CommonDeletionTwoCenterPacket` | `lean/Erdos9796Proof/P97/ATail/CommonDeletionTwoCenter.lean:29` |
| (Q1)–(Q7) frontier | `SurvivorPairRelocationPacket`; `CriticalPairFrontier`; `FirstApexSplit` / `SecondApexSplit` | `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean:288,568,544,555` |
| (R1)–(R3) parent | `FrontierCommonDeletionResidual` / `FrontierCommonDeletionParentResidual` | `lean/Erdos9796Proof/P97/ATail/OrientedPhysicalApexIngress.lean:239,251` |
| (X1)–(X4) collision row | `RetainedInteriorBlockerCollision` | `lean/Erdos9796Proof/P97/ATail/RetainedStrictInteriorPairSelector.lean:95` |
| (D4) exact cap trace | `RetainedInteriorBlockerCollision.shell_inter_cap_eq_sources` | `…/RetainedStrictInteriorPairSelector.lean:279` |
| (D4) off-cap count | `collisionShell_sdiff_firstCap_card_eq_two` | `lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean:220` |
| (D5) blocker in cap interior | `RetainedInteriorBlockerCollision.blocker_mem_capInterior` | `…/RetainedStrictInteriorPairSelector.lean:244` |
| (M1)/(M3) common deletion | `LocalizedCollisionCommonDeletion` | `…/RetainedStrictInteriorPairSelector.lean:449` |
| (M2)/(M4) cycles | `LocalizedCollisionMutualOmissionCycle` | `lean/Erdos9796Proof/P97/ATail/LocalizedCollisionMutualOmissionCycle.lean:131` |
| (T1) | `FrontierBiApexRobustResidual` | `lean/Erdos9796Proof/P97/ATail/PhysicalSecondApexCommonDeletion.lean:171` |
| (T2) | `FrontierLargeOppositeCapsBiApexRobustResidual` | `lean/Erdos9796Proof/P97/ATail/LargeOppositeCapsBiApexSurface.lean:38` |
| (T3) | `FrontierAllLargeCapsBiApexRobustResidual` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:6430` |
| (T4)–(T6) | `FrontierAllLargeCapsTriApexRobustResidual` | `…/FrontierLiveClosure.lean:6527` |
| Robust / Rich | `FullyDeletionRobustAt`; `ApexRichClassStructure` | `lean/Erdos9796Proof/P97/ATail/DeletionRobustness.lean:27`; `ApexRichClassStructure.lean:50` |
| (U1) | `IsUniqueFourCenter` / `uniqueFourClass` | `lean/Erdos9796Proof/P97/ATail/MinimalUniqueFourCover.lean:48,64` |
| NR | `notRobustCenters` | `…/MinimalUniqueFourCover.lean:418` |
| (D10)/(T5) | `card_le_four_mul_notRobustCenters` | `…/MinimalUniqueFourCover.lean:429` |
| (D1) | `cross_deletion_survives_iff_not_mem_selected_support` | `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean:755` |
| (D2) | `selectedFourClass_support_eq_shell` | `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1087` |
| (D3) | `selectedSupports_eq_of_actualBlockers_eq` | `lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean:48` |
| (D6) | `firstApexFullyDeletionRobust` | `lean/Erdos9796Proof/P97/ATail/OrientedPhysicalApexIngress.lean:318` |
| (D7) | `not_isUniqueFourCenter_of_fullyDeletionRobust` | `…/MinimalUniqueFourCover.lean:159` |
| (D11) | `U5QDeletedK4Class.inter_card_le_two`; `criticalFourShell_inter_selectedClass_card_le_two` | `lean/Erdos9796Proof/P97/U5GlobalIncidenceSupport.lean:412`; `…/MinimalUniqueFourCover.lean:306` |
| (D12) | `firstFiber_shell_eq_explicitFour` | `lean/Erdos9796Proof/P97/ATail/FirstFiberOverlapDescent.lean:156`; `FrontierLiveClosure.lean:7495` |
| (F3a) | `FreshOutsideFirstBlockerFiber` | `lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean:115` |
| (F4b) | `FreshOutsideSecondBlockerFiber` | `…/BlockerMultiplicityGeometry.lean:161` |
| (F3b)=(F4a), existential | `CapSourceThirdCanonicalRowSurface` | `lean/Erdos9796Proof/P97/ATail/TwoCollisionGlobalProducer.lean:291` |
| (F3b)=(F4a), named | `FirstFiberCapSourceWitness` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7521` |
| (F3c) | `FirstFiberCollisionFiveCenterDeletionResidual` / `FiveCenterDeletionSurvival` | `lean/Erdos9796Proof/P97/ATail/FirstFiberOverlapDescent.lean:85,39` |
| (F1a) | `CrossBlockerCoincidence` | `lean/Erdos9796Proof/P97/ATail/TwoCollisionGlobalProducer.lean:272` |
| (F2c) | `FreshThirdBlockerFiber` | `lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean:70` |
| minimal deletion core | `MinimalDeletionCore` | `lean/Erdos9796Proof/P97/ATail/MinimalDeletionCore.lean:34` |
