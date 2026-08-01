# Solve prompt — Family F, Bridge 4: an alternative MEC surplus packet satisfying `IsM44`

Date: 2026-07-27.
Round: 2 (round-1 prompt: `docs/solve-prompts/2026-07-27-exact-collision-terminals.md`,
"the F doc"; round-1 response: `docs/solve-prompts/2026-07-27-f-round1-response.md`).

> **Historical-status notice (2026-07-30):** This round-2 prompt preserves a
> consumed 2026-07-27 frontier snapshot. Its four F1–F4 leaves and source line
> numbers are historical, not current obligations. The live direct frontier
> now consists of `false_of_crossBlockerCoincidence` and
> `false_of_capSourceThirdCanonicalRowSurface`. Use the closure matrix,
> computational closure plan, and generated blueprint for current status.

Scope: **one** global bridge target extracted from the round-1 response.  Round 1
returned no branch-A proof and no branch-B certificate for any of the four leaves
F1–F4 of `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`), and located the exact
stopping point: *"the current checked descent produces only negative incidences,
exact two-point traces, and single-center outside-pair data"*.  It named four
candidate global bridges, any one of which would materially advance all four
leaves.  This document is the round-2 prompt for **Bridge 4**:

> From the ambient configuration $\Gamma$, construct a `SurplusCapPacket` on the
> carrier $A$ satisfying `IsM44`, contradicting the `noM44` hypothesis (C7).

This document is self-contained.  Every hypothesis is stated below in plain
mathematics (finite point sets in $\mathbb{R}^2$, Euclidean distance,
cardinality, membership, signed area), and the entire packet layer is unfolded
field by field in §1.4.  No access to the Lean sources is required.

---

## §1 Notation preamble and the shared ambient configuration

### 1.1 Basic notation

* $\mathbb{R}^2$ is the Euclidean plane with the standard Euclidean distance;
  $|xy|$ denotes the distance between points $x, y$; $\langle u, v\rangle$ is
  the standard real inner product.  All point sets are finite unless stated
  otherwise.  $|X|$ denotes the cardinality of a finite set $X$;
  $X \setminus Y$ set difference.
* For $p \in \mathbb{R}^2$, $r \in \mathbb{R}$ and a finite
  $X \subset \mathbb{R}^2$, the **radius class** ("selected class") is
  $$S^X_p(r) := \{\, q \in X : |pq| = r \,\}.$$
  When $X = A$ (the ambient carrier, below) we write $S_p(r)$.  For $r > 0$ the
  class never contains its own center.
* **K₄ predicate.**  For a finite $X \subset \mathbb{R}^2$ and
  $p \in \mathbb{R}^2$:
  $$K_4(X, p) :\Longleftrightarrow \exists\, r > 0 \text{ with } |S^X_p(r)| \ge 4 .$$
  ("$p$ has four equidistant points in $X$.")  A set $X$ has the **K₄ property**
  iff $K_4(X, p)$ holds for every $p \in X$.
* **Convex independence.**  A finite $X \subset \mathbb{R}^2$ is
  *convex-independent* iff every $x \in X$ satisfies
  $x \notin \mathrm{conv}(X \setminus \{x\})$, i.e. all points of $X$ are
  vertices of its convex hull (extreme points; **not** "general position").
* **Removable vertex.**  $x$ is removable for $X$ iff $x \in X$ and
  $X \setminus \{x\}$ has the K₄ property.
* **Signed area.**  For $u, x, y \in \mathbb{R}^2$ with $u = (u_1,u_2)$ etc.:
  $$\mathrm{sa}(u, x, y) := (x_1 - u_1)(y_2 - u_2) - (y_1 - u_1)(x_2 - u_2).$$
* **Arc-side predicate (closed-cap convention).**  For an ordered triple
  $(w_i; w_j, w_k)$ of points and a point $v$:
  $$\mathrm{Arc}(w_i; w_j, w_k;\, v) :\Longleftrightarrow
    \mathrm{sa}(v, w_j, w_k)\cdot\mathrm{sa}(w_i, w_j, w_k) \le 0,$$
  i.e. $v$ lies on the closed side of the chord $w_j w_k$ opposite to $w_i$
  (points on the chord line itself satisfy the predicate).  The predicate is
  **symmetric in the chord endpoints**: $\mathrm{Arc}(w_i; w_j, w_k; v)
  \Leftrightarrow \mathrm{Arc}(w_i; w_k, w_j; v)$ (both signed areas flip sign,
  the product is unchanged).  When the chord endpoints are clear we write
  $\mathrm{Arc}(w_i; v)$.
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

$\Gamma$ is the hypothesis package shared by all four leaves F1–F4.  It is the
content of the Lean section-variable/`include` block
(`FrontierLiveClosure.lean:7421–7469`) after recursively unfolding every
structure.  **It is reproduced here from the audited §1.2 of the F doc; it has
not been re-derived.**  Redundant items are retained for faithfulness.

**Condensation record.**  Relative to the F doc's §1.2 the following was
condensed, and *nothing was dropped*: (i) the per-item "(redundant: …)"
justifications for (Q5), (Q7), (R1), (M1)–(M4) are compressed into a single
parenthetical each; (ii) the two frontier instances (Q1)–(Q7)/(R1)–(R3) are
listed compactly, since no clause of them is expected to be load-bearing for
this bridge; (iii) the derived facts (D0)–(D13) of §1.3 are stated in shortened
prose, with (D12)/(D13) — which are leaf-F3/F4-specific — reduced to one line
each.  Every item retains its full logical content and may be used.

#### Carrier axioms (C)

* **(C1)** $A \subset \mathbb{R}^2$ is finite and nonempty.
* **(C2)** $A$ is convex-independent.
* **(C3)** $A$ has the K₄ property: $\forall p \in A,\; K_4(A, p)$.
* **(C4)** $A$ is not contained in a line.
* **(C5)** $A$ admits at least one surplus-cap packet in the sense of §1.4
  (this is the packet bundled inside the counterexample datum; it need not equal
  the working packet fixed in (P1)–(P5); its only downstream use is $|A| > 4$).
* **(C6)** **Minimality.**  For every finite nonempty convex-independent
  $B \subset \mathbb{R}^2$ with the K₄ property, $|A| \le |B|$.  (Quantifies over
  *all* such planar sets, not subsets of $A$.)
* **(C7)** **No $(m,4,4)$ packet.**  There is *no* surplus-cap packet on $A$
  whose two non-surplus caps both have exactly $4$ points.  This quantifies over
  **all** packets on $A$ (all admissible MEC-boundary non-obtuse triangles, cap
  triples and surplus designations, in the exact sense of §1.4), not just the
  working packet $S$.
* **(C8)** $|A| > 9$.

#### Working surplus-cap packet (P)

* **(P1)** **Minimum enclosing circle (MEC).**  Let $(O, R_0)$ be the unique
  pair with $R_0 \ge 0$, $|pO| \le R_0$ for all $p \in A$, and $R_0$ minimal
  among all enclosing pairs.  (Existence and uniqueness are proven in-project.)
* **(P2)** **Non-obtuse circumscribed Moser triangle.**  Points
  $v_1, v_2, v_3 \in A$, pairwise distinct, each on the MEC boundary
  ($|v_i O| = R_0$), with all three angles non-obtuse in inner-product form:
  $\langle v_2 - v_1,\, v_3 - v_1\rangle \ge 0$,
  $\langle v_3 - v_2,\, v_1 - v_2\rangle \ge 0$,
  $\langle v_1 - v_3,\, v_2 - v_3\rangle \ge 0$.
* **(P3)** **Cap triple (closed-cap convention).**  Finite sets
  $C_1, C_2, C_3 \subseteq A$ with (indices cyclic, cap $C_i$ "opposite" apex
  $v_i$):
  * $v_i \notin C_i$ and $v_j, v_k \in C_i$ for $\{i,j,k\} = \{1,2,3\}$;
  * every $v \in A \setminus \{v_1,v_2,v_3\}$ lies in exactly one cap;
  * **arc membership:** for every $v \in A$ and each $i$:
    $v \in C_i \Leftrightarrow \mathrm{Arc}(v_i; v)$ (chord = the other two
    vertices).  In particular the caps are determined by the triangle:
    $C_i = \{v \in A : \mathrm{Arc}(v_i; v)\}$.
* **(P4)** **Surplus designation.**  An index $\sigma \in \{1,2,3\}$ with
  $|C_\sigma| > 4$.  Write $m := C_\sigma$ (the surplus cap).
* **(P5)** **Naming.**  Let $(i_1, i_2)$ be the other two indices in cyclic
  order after $\sigma$: $\sigma=1 \Rightarrow (i_1,i_2) = (2,3)$;
  $\sigma=2 \Rightarrow (3,1)$; $\sigma=3 \Rightarrow (1,2)$.  Define the apices
  $a_0 := v_\sigma$ (surplus apex), $a_1 := v_{i_1}$ (first opposite apex),
  $a_2 := v_{i_2}$ (second opposite apex); and the opposite caps $C_{i_1}$
  (first) and $C_{i_2}$ (second).  For each $i$, the **strict cap interior** is
  $C_i^{\circ} := C_i \setminus \{v_j, v_k\}$ ($j,k \ne i$), the cap minus its
  two Moser-vertex endpoints.

  Derived (proven in-project, listed for orientation, not hypotheses): the
  cap-sum identity $|C_1| + |C_2| + |C_3| = |A| + 3$;
  $a_1 \in C_\sigma \cap C_{i_2}$; each Moser vertex lies in exactly the two
  caps it bounds.

#### Critical shell (blocker) system (H)

* **(H1)** For every $x \in A$ there are given: a **blocker center**
  $c(x) \in A \setminus \{x\}$, a **shell radius** $r(x) > 0$, and the **exact
  shell** $K(x) := S_{c(x)}(r(x)) = \{z \in A : |c(x)\,z| = r(x)\}$, such that
  $|K(x)| = 4$ and $x \in K(x)$.  ($K(x)$ is the *entire* radius class of $A$ at
  that center and radius, not a selected 4-subset.)
* **(H2)** **Criticality.**  For every $x \in A$:
  $\neg K_4(A \setminus \{x\},\, c(x))$; explicitly, for every $r > 0$,
  $|\{z \in A\setminus\{x\} : |c(x)\,z| = r\}| \le 3$.

#### Two frontier instances (Q★, R★), one for each radius ★ ∈ {r, ρ}

Fixed reals $r$ and $\rho$ (the two frontier radii; positivity is derivable,
(D0)).  For **each** $\star \in \{r, \rho\}$ the following data are given (two
independent copies; $q_\star, w_\star$ is the survivor pair at radius $\star$):

* **(Q1)** $q_\star, w_\star \in A$, $q_\star \ne w_\star$.
* **(Q2)** $q_\star, w_\star \in S_{a_1}(\star) \setminus m$.
* **(Q3)** $K_4(A\setminus\{q_\star\},\, a_2)$ and $K_4(A\setminus\{w_\star\},\, a_2)$.
* **(Q4)** $c(q_\star) \ne a_2$ and $c(w_\star) \ne a_2$.
* **(Q5)** **First-apex split.**  $K_4(A\setminus\{q_\star, w_\star\},\, a_1)$,
  or else both: $|S_{a_1}(\star)| \in \{4, 5\}$ and every $\rho' > 0$ with
  $|S_{a_1}(\rho')| \ge 4$ satisfies $\rho' = \star$.  (Given (X5)–(X7) the
  second disjunct is false in both instances, so (Q5) reduces to (R2).)
* **(Q6)** $K_4(A\setminus\{q_\star, w_\star\},\, a_2)$.
* **(Q7)** **Second-apex split.**  $K_4(A\setminus\{q_\star, w_\star\},\, a_2)$,
  or else there exist two exact shells at center $a_2$: full radius classes
  $S_{a_2}(|a_2 q_\star|)$ and $S_{a_2}(|a_2 w_\star|)$, each of cardinality
  exactly $4$, positive radii, containing $q_\star$ resp. $w_\star$, and
  disjoint.  (First disjunct is (Q6).)
* **(R1)** $4 \le |S_{a_1}(\star)|$.  (Redundant given (X6)/(X7).)
* **(R2)** $K_4(A\setminus\{q_\star, w_\star\},\, a_1)$.
* **(R3)** $\mathrm{Packet}(q_\star;\, a_1, a_2)$ (§1.1).

#### The two exact collision rows (X)

* **(X1)** $s_1, s_2 \in A$ with $s_1 \ne s_2$; and $t_1, t_2 \in A$ with
  $t_1 \ne t_2$.
* **(X2)** $s_1, s_2 \in S_{a_1}(r)$ and $t_1, t_2 \in S_{a_1}(\rho)$.
* **(X3)** $s_1, s_2, t_1, t_2 \in C_{i_1}^{\circ}$.
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

* **Definitions.**  $\mathrm{Robust}(p) :\Leftrightarrow \forall z \in A,\;
  K_4(A\setminus\{z\}, p)$.  $\mathrm{Rich}(p) :\Leftrightarrow
  (\exists r'' > 0:\ |S_p(r'')| \ge 6)$ or
  $(\exists\, r_1'' \ne r_2'' > 0:\ |S_p(r_1'')| \ge 4 \text{ and } |S_p(r_2'')| \ge 4)$.
  $\mathrm{NR} := \{p \in A : \neg\mathrm{Robust}(p)\}$.
* **(T1)** $\mathrm{Robust}(a_2)$.
* **(T2)** $|C_{i_1}| \ge 6$ and $|C_{i_2}| \ge 6$.
* **(T3)** $|m| \ge 6$.  (With (T2) and the cap-sum identity: $|A| \ge 15$.)
* **(T4)** $\mathrm{Rich}(a_1)$, $\mathrm{Rich}(a_2)$, $\mathrm{Rich}(a_0)$.
* **(T5)** $|A| \le 4\,|\mathrm{NR}|$.
* **(T6)** No common circle through the three apices centered in the carrier:
  for every $p \in A$ and every $r'' > 0$, not all of $v_1, v_2, v_3$ lie in
  $S_p(r'')$.

#### Unique-four cover of the blocker range (U)

* **(U1)** For every $x \in A$: $c(x) \ne x$; $c(x)$ is a **unique-four
  center** — $c(x) \in A$, $|S_{c(x)}(r(x))| = 4$, and every $\rho'' > 0$ with
  $|S_{c(x)}(\rho'')| \ge 4$ satisfies $\rho'' = r(x)$; the four-point class
  selected at $c(x)$ is $K(x)$.  Net new content: **at each blocker center the
  shell radius is the only radius carrying $\ge 4$ carrier points.**

#### The mutual-omission two-cycles (M)

* **(M1)** $t_1 \notin K(s_1)$, and $\mathrm{Packet}(t_1;\, a_1, b)$.
* **(M2)** There is a chosen $u \in \{s_1, s_2\}$ with $u \notin K(t_1)$, plus
  the packet rows $\mathrm{Packet}(u;\, a_1, b')$ (all other listed conjuncts are
  redundant given (X3), (X4), (X10), (X11), (M1), (D3)).
* **(M3)** $s_1 \notin K(t_1)$, and $\mathrm{Packet}(s_1;\, a_1, b')$.
* **(M4)** There is a chosen $u' \in \{t_1, t_2\}$ with $u' \notin K(s_1)$, plus
  $\mathrm{Packet}(u';\, a_1, b)$ (other conjuncts redundant as above).

### 1.3 Established derived facts (proven in-project, kernel-checked; usable as background)

* **(D0)** $r > 0$ and $\rho > 0$.
* **(D1)** **Cross-deletion criterion.**  For all $x \in A$ and
  $w \in \mathbb{R}^2$: $K_4(A\setminus\{w\},\, c(x)) \Leftrightarrow w \notin K(x)$.
* **(D2)** **Support locking.**  Any 4-point set $B \subseteq A$ on a common
  circle of positive radius about $c(x)$ (center not in $B$) equals $K(x)$.
* **(D3)** **Equal blockers ⇒ equal shells.**  $c(x) = c(y) \Rightarrow K(x) = K(y)$;
  hence $K(s_1) = K(s_2)$, $K(t_1) = K(t_2)$, $s_2 \in K(s_1)$, $t_2 \in K(t_1)$.
* **(D4)** **Exact cap trace of the collision shells.**
  $K(s_1) \cap C_{i_1} = \{s_1, s_2\}$ and $K(t_1) \cap C_{i_1} = \{t_1, t_2\}$
  (closed cap), hence $|K(s_1) \setminus C_{i_1}| = |K(t_1) \setminus C_{i_1}| = 2$.
* **(D5)** **Blockers sit inside the cap.**  $b \in C_{i_1}^{\circ}$ and
  $b' \in C_{i_1}^{\circ}$.
* **(D6)** $\mathrm{Robust}(a_1)$; and $\mathrm{Rich}(p) \Rightarrow
  \mathrm{Robust}(p)$, so (T4) gives $\mathrm{Robust}(a_0)$, $\mathrm{Robust}(a_2)$.
* **(D7)** **Robust points are never blocker values.**  A robust center is not a
  unique-four center; with (U1), $c(x) \notin \{a_0, a_1, a_2\}$ for every
  $x \in A$.
* **(D8)** **Cap two-point row bound.**  For any center $z \in C_i$ (closed cap,
  any $i$, working packet) and any 4-point set $B \subseteq A$ on a common
  positive-radius circle about $z$ with $z \notin B$: $|B \cap C_i| \le 2$.
  (Uses (C2).)
* **(D9)** **Off-cap pair has at most one cap bisector point.**  If
  $c \ne d \in C_i$ (closed cap) and $a \ne b \in A$ with $a, b \notin C_i$, then
  not both $|ca| = |cb|$ and $|da| = |db|$.  (Uses (C2).)
* **(D10)** **Minimality cover.**  From (C6): every $x \in A$ lies in the unique
  four-point class of some unique-four center; quantitatively $|A| \le 4\,|U|$
  where $U$ is the set of unique-four centers, and (T5) restates this with
  $U \subseteq \mathrm{NR}$.
* **(D11)** **Two-circle bound.**  Two circles with distinct (center, radius)
  pairs share at most two points; hence $|K(x) \cap K(y)| \le 2$ whenever
  $(c(x), r(x)) \ne (c(y), r(y))$, and $|K(x) \cap S_p(r'')| \le 2$ whenever
  $(c(x), r(x)) \ne (p, r'')$.
* **(D12)** Under leaf F3's hypothesis: $K(s_1) = \{s_1, s_2, e, o\}$ with
  $e, o \notin C_{i_1}$; symmetrically under F4's: $K(t_1) = \{t_1, t_2, e, o\}$.
* **(D13)** Modulo $\Gamma$, (M1)–(M4) reduce via (D1) to:
  $t_1 \notin K(s_1)$, $s_1 \notin K(t_1)$,
  $\exists u \in \{s_1,s_2\}: u \notin K(t_1)$,
  $\exists u' \in \{t_1,t_2\}: u' \notin K(s_1)$.

### 1.4 The packet layer, fully unfolded

This subsection is the target's definition and is **not** condensed.  Every
clause below is a field of the Lean structures cited in Appendix A, read from
source.  A packet missing one clause is not a packet, and does not contradict
(C7).

#### 1.4.1 The minimum enclosing circle

For a nonempty finite $A$, $\mathrm{mec}(A) = (O, R_0)$ is the **unique** pair
with $R_0 \ge 0$, $|pO| \le R_0$ for all $p \in A$, and $R_0 \le r'$ for every
$(c', r')$ enclosing $A$.  It is a function of $A$ alone.  The **MEC boundary**
of $A$ is
$$\partial A := \{\, p \in A : |pO| = R_0 \,\}.$$

#### 1.4.2 An admissible triangle

Call an ordered triple $(w_1, w_2, w_3)$ of points **admissible for $A$** iff

* **(A-i)** $w_1, w_2, w_3 \in A$;
* **(A-ii)** $|w_1 O| = |w_2 O| = |w_3 O| = R_0$, i.e. $w_1, w_2, w_3 \in \partial A$;
* **(A-iii)** $w_1 \ne w_2$, $w_2 \ne w_3$, $w_1 \ne w_3$ (this is the
  *circumscribed branch* of the Sylvester dichotomy; the alternative *diameter
  branch* — $w_3 = w_1$, $w_1 w_2$ antipodal, $O$ the midpoint,
  $R_0 = |w_1w_2|/2$ — is **not** admissible, and a packet field explicitly
  selects the circumscribed branch);
* **(A-iv)** all three angles are non-obtuse in inner-product form:
  $$\langle w_2 - w_1, w_3 - w_1\rangle \ge 0,\qquad
    \langle w_3 - w_2, w_1 - w_2\rangle \ge 0,\qquad
    \langle w_1 - w_3, w_2 - w_3\rangle \ge 0 .$$

#### 1.4.3 The cap triple of an admissible triangle

Given an admissible $(w_1,w_2,w_3)$, a **cap triple** is a triple of finite sets
$C_1', C_2', C_3'$ with **all fourteen** of the following clauses:

1. $C_1' \subseteq A$, $C_2' \subseteq A$, $C_3' \subseteq A$;
2. $w_1 \notin C_1'$, $w_2 \in C_1'$, $w_3 \in C_1'$;
3. $w_1 \in C_2'$, $w_2 \notin C_2'$, $w_3 \in C_2'$;
4. $w_1 \in C_3'$, $w_2 \in C_3'$, $w_3 \notin C_3'$;
5. **(exactly-one)** every $v \in A \setminus \{w_1,w_2,w_3\}$ lies in exactly
   one of $C_1', C_2', C_3'$;
6. **(arc membership)** for every $v \in A$:
   $$v \in C_1' \Leftrightarrow \mathrm{Arc}(w_1; w_2, w_3; v),\quad
     v \in C_2' \Leftrightarrow \mathrm{Arc}(w_2; w_3, w_1; v),\quad
     v \in C_3' \Leftrightarrow \mathrm{Arc}(w_3; w_1, w_2; v).$$

**(N1) Determinacy of the caps** *(a one-step consequence of clauses 1 and 6;
no separate in-tree declaration — re-derive it, do not cite it)*: clauses 1 and
6 together force
$$C_i' \;=\; \{\, v \in A : \mathrm{Arc}(w_i;\,\cdot\,;\, v) \,\},$$
so the cap triple is **uniquely determined** by $A$ and the ordered triple.
Consequently the multiset $\{|C_1'|, |C_2'|, |C_3'|\}$ is a function of $A$ and
the *unordered* vertex set $\{w_1,w_2,w_3\}$ alone (the arc predicate is
symmetric in its chord endpoints, §1.1, so permuting the labels permutes the
three caps and nothing else).

#### 1.4.4 The `SurplusCapPacket` record

A **surplus-cap packet on $A$** consists of exactly:

| # | field | content |
|---|---|---|
| 1 | nonempty | $A \ne \varnothing$ |
| 2 | noncollinear | $A$ is not contained in a line |
| 3 | triangle | an ordered triple $(w_1,w_2,w_3)$ with (A-i), (A-ii), a dichotomy witness, and (A-iv) |
| 4 | circumscribed witness | the dichotomy witness is the *left* (circumscribed) branch, i.e. (A-iii) |
| 5 | partition | a cap triple $(C_1',C_2',C_3')$ over $(w_1,w_2,w_3)$, all fourteen clauses of §1.4.3 |
| 6 | surplus index | $\sigma' \in \{1,2,3\}$ |
| 7 | surplus bound | $|C_{\sigma'}'| > 4$ |

Fields 1, 2, 4, 7 are propositions; field 5 carries the three finite sets
$C_1', C_2', C_3'$ as data together with its fourteen propositional clauses;
fields 3 and 6 carry the remaining data.  Given (C1) and (C4), fields 1 and 2 are free.  Given the construction
of field 3 as data, field 4 holds by definitional unfolding.  **So the entire
freedom in a packet on the fixed carrier $A$ is: an ordered admissible triple
plus a surplus index** — and by (N1) the caps, hence all cap cardinalities, are
determined by the unordered triple.

The derived selectors are, with $\sigma'$ the surplus index and $(i_1', i_2')$
its cyclic successors ($\sigma'=1 \Rightarrow (2,3)$; $\sigma'=2 \Rightarrow (3,1)$;
$\sigma'=3 \Rightarrow (1,2)$):
$$\mathrm{surplusCap} := C_{\sigma'}',\qquad
  \mathrm{oppCap}_1 := C_{i_1'}',\qquad
  \mathrm{oppCap}_2 := C_{i_2'}' .$$
The cap-sum identity $|C_1'| + |C_2'| + |C_3'| = |A| + 3$ holds for every cap
triple (each Moser vertex is double-counted once).

#### 1.4.5 `IsM44`

$$\textbf{IsM44} \;:\Longleftrightarrow\; |\mathrm{oppCap}_1| = 4 \;\wedge\; |\mathrm{oppCap}_2| = 4 .$$

Both counts are **closed-cap** counts: each opposite cap contains its two Moser
endpoints, so "exactly four" means "exactly two points of $A$ in the strict
interior of that cap, and no more".  Under `IsM44`,
$|\mathrm{surplusCap}| + 5 = |A|$.

#### 1.4.6 The exact `noM44` hypothesis carried by the leaves

The four leaves carry, through the retained parent residual $R$ (the section
variable $\{R : \texttt{FrontierCommonDeletionParentResidual}\ F\}$, in scope via
the explicit collision datum $P : \texttt{RetainedInteriorBlockerCollision}\ R$),
the field

```lean
noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
```

together with `minimal : D.Minimal` (= (C6)) and
`carrier_card_gt_nine : 9 < D.A.card` (= (C8)).  Read literally:

> There is **no** $T$ whatsoever — no admissible ordered triple for $D.A$
> together with its determined cap triple and any surplus index — such that both
> non-surplus caps of $T$ have exactly four points.

The quantifier is over packets on **exactly the carrier $D.A$**, not over
packets on subsets, supersets, or images of $D.A$.

### 1.5 Interface assumptions

* The MEC $(O, R_0)$ is treated as given exact data satisfying the stated
  enclosing/minimality/uniqueness properties; nothing else about the MEC is
  assumed beyond §1.4.1 and the facts listed in §6.
* The ordered-cap machinery behind (D8)/(D9) is used only through those two
  stated consequences, and only for the **working** packet's caps.
* Global minimality (C6) and the no-$(m,4,4)$ hypothesis (C7) are stated exactly
  above; (C7) is unfolded exactly as §1.4.  They are the only hypotheses
  quantifying over objects outside the fixed configuration.

---

## §2 Problem statement — Bridge 4

Resolve the following obligation completely.  Assume the **entire** configuration
$\Gamma$ of §1.2 — items (C1)–(C8), (P1)–(P5), (H1)–(H2), both frontier
instances (Q1)–(Q7)/(R1)–(R3) for $\star \in \{r, \rho\}$, (X1)–(X11),
(T1)–(T6), (U1), (M1)–(M4) — and no other hypothesis.  No item of $\Gamma$ may
be dropped, weakened, or replaced.

> **Bridge 4.**  Construct a surplus-cap packet on $A$ in the exact sense of
> §1.4.4 satisfying `IsM44` (§1.4.5).
>
> $$\boxed{\ \Gamma \;\vdash\; \exists\, T \text{ a surplus-cap packet on } A \text{ with } \mathrm{IsM44}(T).\ }$$

Since $\Gamma$ contains (C7), which asserts the negation of that existential, a
proof of Bridge 4 yields `False` from $\Gamma$ alone, and therefore closes all
four leaves F1–F4 simultaneously (each leaf's supplement is then unused).  The
deliverable is the packet together with a proof of every field; the `False` is a
corollary.

### 2.1 The obligation in fully unfolded form

By §1.4.4 and (N1), Bridge 4 is *equivalent* to the following purely geometric
statement about $A$ and its minimum enclosing circle $(O, R_0)$:

> **(B4)** There exist three pairwise-distinct points $w_1, w_2, w_3 \in A$ with
> $|w_1O| = |w_2O| = |w_3O| = R_0$ and all three angles non-obtuse
> ($\langle w_2 - w_1, w_3 - w_1\rangle \ge 0$ and its two cyclic images), such
> that, setting
> $$C_i' := \{\, v \in A : \mathrm{sa}(v, w_j, w_k)\cdot\mathrm{sa}(w_i, w_j, w_k) \le 0 \,\}
>   \quad (\{i,j,k\} = \{1,2,3\}),$$
> **at least two** of $|C_1'|, |C_2'|, |C_3'|$ are equal to $4$.

The equivalence direction $\text{(B4)} \Rightarrow$ packet is fully proved
in-project and may be used as background (§6, item **(G4)**): from a
non-obtuse circumscribed triple, the cap triple exists (its exactly-one clause
is discharged from (C2) alone), and two exact four-caps plus $|A| > 9$ assemble
the `IsM44` packet with the remaining cap as surplus.  The direction
$\text{packet} \Rightarrow \text{(B4)}$ is immediate.

**Therefore the entire mathematical content of Bridge 4 is (B4): exhibit an
admissible boundary triple two of whose closed arc-caps carry exactly four
carrier points.**

### 2.2 Two structural facts that fix the shape of any solution

Both are consequences of proved in-project background (§6) plus $\Gamma$;
re-derive them, do not take them on trust.

* **(S1) Every cap of every admissible triple has $\ge 4$ points.**  For any
  admissible triple for $A$ and its determined caps,
  $|C_1'| \ge 4$, $|C_2'| \ge 4$, $|C_3'| \ge 4$ (background **(G5)**, using
  (C2), (C3), (C4) and the MEC data).  Hence "exactly four" is the *minimum
  possible* cap size, and (B4) asks for two caps simultaneously at the floor.
* **(S2) $\Gamma$ already forbids two exact-four caps on every triple.**
  Combining (S1), the cap-sum identity, (C8) and (C7): for **every** admissible
  triple for $A$, at most one of the three caps has exactly four points
  (background **(G6)**).  Bridge 4 is precisely the assertion that some triple
  violates this — that is what makes it a contradiction and not a theorem about
  a hypothetical object.  Any argument for Bridge 4 must therefore *construct*
  the offending triple; it cannot be obtained by rearranging (G6).

### 2.3 What the working triangle cannot give

By (P5), (T2) and (T3), the working packet's three caps satisfy
$|m| \ge 6$, $|C_{i_1}| \ge 6$, $|C_{i_2}| \ge 6$.  By (N1) the cap multiset
depends only on the **unordered** vertex set, so every relabelling of
$\{v_1, v_2, v_3\}$ (all six orderings) yields the same three caps up to
permutation, all of size $\ge 6$, and no choice of surplus index makes any
of them `IsM44`.

**Consequence (must be discharged by any solution).**  Any packet witnessing
Bridge 4 uses an unordered vertex set different from $\{v_1,v_2,v_3\} = \{a_0,
a_1, a_2\}$; hence
$$|\partial A| \ge 4,$$
and the new triple contains at least one MEC-boundary point of $A$ that is not a
working Moser apex.  Nothing in $\Gamma$ as stated asserts $|\partial A| \ge 4$.
Producing such a point — or proving it exists — is the first genuinely new
obligation, and any proposed solution that never exhibits or forces a fourth
boundary point has not produced a packet.

---

## §3 Assume-resolvable framing

Assume for purposes of this task that Bridge 4 admits a complete resolution, but
do **not** assume in advance which direction it takes.  A complete resolution
must establish exactly one of the two statements in §4.  The two branches are of
equal value and must be pursued at equal depth; do not treat branch A as the
"expected" answer or branch B as a fallback.

---

## §4 Dual-branch success criteria

### Branch A (derivation)

A complete, rigorous proof of (B4) — equivalently, an explicit surplus-cap
packet $T$ on $A$ together with proofs of **all seven fields** of §1.4.4 and of
`IsM44` — valid for *every* configuration satisfying $\Gamma$, using each
hypothesis only as stated, and formalizable in Lean 4 with mathlib (no new
axioms; the in-project facts (D0)–(D13) and (G1)–(G7) of §6 may be used as
established).

A branch-A solution must include, explicitly:

1. **The vertex triple.**  Named points $w_1, w_2, w_3 \in A$ (either concrete
   elements of the named $\Gamma$ data, or points produced by a proved
   existence argument from $\Gamma$), with:
   * $w_i \in A$;
   * $|w_i O| = R_0$ for each $i$ — a proof that each $w_i$ is on the **minimum
     enclosing circle of $A$**, not on some other circle through carrier points,
     and not merely "extreme in $A$";
   * pairwise distinctness (circumscribed branch);
   * the three non-obtuse inner-product inequalities in the stated orientation.
2. **The cap cardinalities.**  For at least two indices $i$, a proof that
   $$|\{\, v \in A : \mathrm{sa}(v, w_j, w_k)\cdot\mathrm{sa}(w_i, w_j, w_k) \le 0 \,\}| = 4,$$
   as a **closed** count including the two chord-endpoint vertices, i.e. exactly
   two carrier points in that arc's strict interior and no third.  Both a lower
   bound and an upper bound are required; (S1) supplies the lower bound, so the
   real content is the **upper** bound "no fifth point on that closed arc".
3. **The surplus designation.**  The index $\sigma'$ chosen so that the two
   exact-four caps are `oppCap₁` and `oppCap₂` **in the cyclic order of
   §1.4.4** ($\sigma'=1 \Rightarrow (2,3)$, $\sigma'=2 \Rightarrow (3,1)$,
   $\sigma'=3 \Rightarrow (1,2)$), plus a proof that the remaining cap has
   $> 4$ points.
4. **A field-by-field audit table** mapping each of the seven packet fields and
   the fourteen cap-triple clauses to its proof.
5. **A usage ledger** listing which items of $\Gamma$ were consumed.  Using (C7)
   itself inside the derivation is permitted (the argument is a proof by
   contradiction and (C7) is a hypothesis), but the ledger must make every such
   use visible, and no step may assume $\neg$(C7) or assume the existence of the
   packet being constructed.

The proof must not use additional assumptions such as: general position beyond
(C2); genericity of the radii $r(x)$; symmetric placement of shell points; exact
cap sizes for the working packet beyond (T2)/(T3); boundedness of $|A|$;
injectivity of $x \mapsto c(x)$ beyond (X4)/(X11); a stipulated value of
$|\partial A|$; or any unstated incidence ("no three named points concyclic",
"all shell radii distinct", …).

### Branch B (exact certificate that the bridge is not a consequence)

A complete construction — one fixed configuration — satisfying **every**
hypothesis of $\Gamma$, in which no `IsM44` packet on $A$ exists.

**Honest scope statement, stated once and not softened.**  (C7) is itself an
item of $\Gamma$.  Therefore a configuration satisfying every hypothesis of
$\Gamma$ *automatically* has no `IsM44` packet, and branch B for Bridge 4 is
**exactly a full realizability certificate for $\Gamma$**.  Such a certificate
does not merely refute this bridge: it makes all four leaves F1–F4 unprovable
and kills the entire Family F closure route.  That outcome is **equally valuable**
as branch A and must be reported as such, not soft-pedaled.  It is also strictly
harder than refuting the bridge alone, and there is no cheaper branch-B object
for this document: "a $\Gamma$-configuration with an `IsM44` packet" is
self-contradictory, and "a configuration satisfying $\Gamma$ minus (C7)" is not a
certificate (see §5).

A branch-B certificate must supply the carrier $A$ with exact algebraic
coordinates (rational, or elements of an explicitly presented real number field
with exact arithmetic), together with explicit choices of $(O, R_0)$, the working
triangle $v_1v_2v_3$, the caps, $\sigma$, the blocker system $(c, r, K)$, the
radii $r, \rho$, and all named points ($q_r, w_r, q_\rho, w_\rho, s_1, s_2,
t_1, t_2, u, u'$) with their packet rows, each clause verified exactly (symbolic
algebra, not floating point).  The universally quantified items must be certified
too: (C6) minimality over all smaller planar configurations; (C7) over **all**
admissible triples for $A$ — which, by §2.1, is a *finite* check once $\partial A$
is computed exactly: enumerate all $\binom{|\partial A|}{3}$ triples, discard the
obtuse ones, and verify that at most one arc-cap of each survivor has exactly
four points; (U1) over all positive radii at each blocker center (finite, since
only finitely many distances occur); (T5)–(T6); and the negative membership
facts.  For (C6) an exact finite reduction with proof is required.

**Known barrier for branch B.**  The strongest existing exact local construction
is the rational 15-point strictly convex model in
`scratch/full-local-euclidean-model-complete/` (`REPORT.md`, verified exactly by
`check_model.py`).  It realizes four exact carrier-level four-point classes and
strict convex position for all fifteen points, but it fails $\Gamma$ at the
earliest global item:

* **K₄ fails at twelve of its fifteen centers** — the pinned multiplicities are
  $4$ at exactly three centers ($O, c, d$) and $1$ at the other twelve.  So (C3)
  fails.
* Its MEC is the **diameter branch**: exact enumeration of all two- and
  three-point enclosing circles gives a unique MEC whose boundary is exactly two
  points $\{a, l\}$.  So no admissible triple exists at all — the circumscribed
  witness (field 4 of §1.4.4) cannot hold, and consequently the cap triple,
  surplus index and surplus bound cannot be instantiated.  There is **no
  production MEC packet** on this carrier.
* No `CriticalShellSystem` exists (only eight of fifteen sources have a legal
  critical row), and only one center ($O$) is fully deletion-robust, so the
  three rich/robust apices of (T4) can never hold simultaneously.

Moreover `scratch/full-local-euclidean-model-complete/K4_EXTENSION_OBSTRUCTION.md`
proves a finite extension lower bound: if a finite planar $B$ contains that
15-point carrier $A_0$ and has the K₄ property, then $|B \setminus A_0| \ge 6$.
(Twelve of the fifteen centers are distance-generic inside $A_0$; each needs
three new points in its class; the assignment center $\mapsto$ 3-subset is
injective because a point equidistant from three pairwise-distinct points is
unique; and $\binom{5}{3} = 10 < 12$.)  Convexity is not used, so the bound holds
a fortiori for convex-independent supercarriers.  This is an extension lower
bound, **not** a proof that no larger K₄ extension exists.

A branch-B attempt must therefore solve the all-center K₄ propagation problem
**before** it reaches (C6), (C7) or the tri-apex conditions, and must produce a
circumscribed (three-boundary-point) MEC.  Partial local models do **not**
qualify; extensions of the 15-point model that do not verify every clause belong
on the §5 insufficient list.

### Quantifier order

Branch A must treat all $\Gamma$-data as universally given (arbitrary), producing
the packet uniformly; branch B chooses everything existentially but must then
verify all $\Gamma$-clauses including their internal universal quantifiers.

---

## §4b Sanctioned reformulations (optional)

* **(B4) reformulation (proved, §2.1).**  Bridge 4 may be replaced throughout by
  the purely geometric statement (B4): an admissible boundary triple two of whose
  closed arc-caps carry exactly four carrier points.  This reformulation is exact
  in both directions and rests on kernel-checked in-project constructions
  (§6 **(G1)–(G4)**).
* **Membership reduction (proved).**  Modulo $\Gamma$, all K₄-survival
  hypotheses $K_4(A\setminus\{w\}, c(x))$ may be replaced by $w \notin K(x)$ via
  (D1), and the packets by their §1.1 clause lists ((D13)).
* **Arc-count reformulation.**  Since $A$ is convex-independent, listing $A$ in
  convex-hull cyclic order turns each closed arc-cap into a contiguous block of
  that cyclic order delimited by two of $w_1,w_2,w_3$ — **provided** the block
  structure is proved, not assumed.  Under this reading, (B4) says: three
  boundary points cut the convex cycle into three blocks, two of which contain
  exactly two non-endpoint carrier points.  **Warning:** the cap definition is
  the algebraic chord-separation predicate, not a circular-order predicate; the
  identification with contiguous blocks must be proved for the specific triple
  before it is used, and the closed/strict distinction must be tracked.
* **Semialgebraic encoding.**  For a fixed carrier size $n$ and a fixed
  combinatorial type (boundary-membership pattern, arc-assignment pattern,
  blocker map, shell incidences), $\Gamma$ plus $\neg$(B4) is a finite
  conjunction of polynomial equations and inequalities over $\mathbb{R}^{2n}$.
  Per-pattern elimination is permitted, but: the enumeration of combinatorial
  types must be proved exhaustive; (C6) is *not* semialgebraic in the fixed-$n$
  encoding and must be handled separately; and a quantifier-elimination or
  Positivstellensatz certificate for one pattern eliminates only that pattern.

---

## §5 Insufficient-progress list

Partial progress does not count unless it implies exactly one of the two
resolutions above.  In particular, the following are insufficient:

* **A packet with any field unproved.**  In particular: a triple whose points are
  not proved to lie on the *minimum enclosing circle of $A$* (field 3's boundary
  clauses); a triple whose non-obtuseness (A-iv) is asserted rather than proved,
  or proved in the wrong orientation; a cap triple whose exactly-one clause or
  arc-membership clause is not discharged; a surplus bound $|C_{\sigma'}'| > 4$
  not verified; or exact cap cardinalities established only as $\ge 4$ or $\le 5$.
  These are precisely the fields that tie the caps to the MEC and its Moser
  triangle, and they are what make a candidate object a packet at all.
* **Relabelling or permuting the existing working triangle.**  This move is
  **refuted**: by (N1) the cap multiset depends only on the unordered vertex set,
  and (T2)/(T3) put all three working caps at $\ge 6$.  The three transpositions
  of the working triangle, together with their cap triples, already exist in the
  tree as `swap23NonObtuse` / `swap13NonObtuse` / `swap12NonObtuse` and the
  corresponding fixed-surplus swap packets; they demonstrably preserve cap
  cardinalities.  Round 1's verdict is quoted verbatim in §7.
* **Treating the collision rows as caps.**  $S_{a_1}(r)$, $S_{a_1}(\rho)$,
  $K(s_1)$ and $K(t_1)$ are radius classes — circles about $a_1$, $b$, $b'$ —
  not arc-caps.  Presenting one of them as an `oppCap` without discharging the
  arc-membership clause (clause 6 of §1.4.3) and the boundary clauses (A-ii) for
  the corresponding triangle is not a packet.  See §7's named attractor.
* **A packet on a subset or a superset of $A$.**  The `noM44` field quantifies
  over `SurplusCapPacket D.A` — packets on **exactly** $D.A$.  An `IsM44` packet
  on $A \setminus \{x\}$, on $A \cup \{p\}$, or on any other carrier contradicts
  nothing.  Likewise, a packet whose caps are subsets of $A$ but whose triangle
  lives on a different carrier's MEC is not a packet on $A$.
* **Producing only one exact-four cap.**  (S2) shows $\Gamma$ permits one; only
  two simultaneously is `IsM44`.  In particular the bank terminal
  `false_of_shortCap_at_largeCapUniqueFiveApex` (a `COMPAT-ONLY/BANK` module with
  no import consumer and not on either publish spine) is about a *different*
  hypothesis package and may not be cited here.
* **Cap-sum arithmetic without a triple.**  "The cap sizes must sum to $|A|+3$,
  so some cap is small" is not a construction; it produces no $w_1,w_2,w_3$ and
  no boundary membership.
* **Asserting $|\partial A| \ge 4$.**  §2.3 shows a fourth MEC-boundary carrier
  point is necessary.  Assuming one exists, or assuming a particular value of
  $|\partial A|$, is not progress; producing one from $\Gamma$ with proof is.
* **Conditional results** ("if additionally $A$ has a fourth boundary point
  whose two neighbouring arcs are short…") unless the condition is itself proved
  from $\Gamma$.
* **Numerical evidence.**  Floating-point near-configurations, sampled carriers,
  or approximate boundary computations, for either branch.
* **Partial local models and their extensions, for branch B.**  A configuration
  failing even one clause of $\Gamma$ is worthless.  In particular the 15-point
  model of §4 fails (C3) at twelve centers and has a diameter-branch MEC; adding
  points to it without re-verifying **every** clause — including (C6), (C7) over
  all admissible triples, (U1)'s unique-radius clause, (T5), the frontier pairs
  and their packets, and the (M)-cycle data — is not a certificate.
* **Round-1-refuted local routes, re-run.**  Each of the following was checked
  and eliminated in round 1 and is a named trap: the cross-hit construction (the
  exact closed-cap traces force all four named cross hits false); the three-hit
  construction (incompatible with the exact rows under the rich-apex
  low-intersection theorem); blocker-map two-cycles (they produce mutual
  omissions, not common support points); two-circle counting (the sharp bound is
  $\le 2$ and exact convex models attain it); ordered-cap/Kalmanson arguments
  (the realizable order is the permitted alternating one); unique-four cover
  counting ($|A| \le 4|\mathrm{NR}|$ is a lower bound on non-robust centers, and
  three collision-fiber excesses exactly account for the three robust apices);
  and global minimal deletion (it supplies one cap center equidistant from an
  outside pair, while (D9) needs a second).
* **Solver output without a certificate.**  SAT/SMT/Gröbner/interval results
  without a verifiable certificate or kernel-checkable reconstruction, or with an
  unvalidated encoding (every encoding must first pass a smoke test against a
  known small instance).
* **Interval-arithmetic exclusion** of a bounded parameter region without a proof
  that the region covers all configurations satisfying $\Gamma$.
* **Combinatorial (oriented-matroid level) realizability or non-realizability**
  of a boundary/arc incidence pattern without metric realization or metric
  elimination.
* **Citing a sibling leaf or the parent coordinator.**  Proving Bridge 4 by
  citing F1–F4, `exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`,
  or any of its unproved consumers is circular.
* **Citing round-1 CONJECTURE items as established.**  Round 1's F3c-redundancy
  derivation and its sharpened F3/F4 sufficient terminals are **CONJECTURE**
  (explicitly not kernel-checked); they are not background and may not be used.
* **Reducing the problem to another unproved statement of comparable strength.**
  A route that ends at an unproved lemma equivalent in strength to the original
  problem is not close to completion.  Examples of such non-terminal endpoints
  here: "every minimal K₄ convex configuration has a four-point MEC boundary";
  "some arc between two consecutive boundary points contains exactly two carrier
  points"; "the working packet's surplus cap can be split by a boundary point".

---

## §6 Allowed background

Standard proved theorems from planar Euclidean geometry, finite combinatorics
and convexity may be used, but must be stated accurately and applied with all
necessary hypotheses: two distinct circles meet in at most two points;
perpendicular-bisector characterization of equidistance; a point equidistant
from three pairwise-distinct points is unique; basic convex-position facts;
pigeonhole; double counting.  Mathlib's `EuclideanGeometry` and `Finset`
libraries set the formalization baseline.

The in-project facts (D0)–(D13) of §1.3 are established background.  (D1)–(D5)
and (D8)–(D10) are kernel-checked at the locations in this document's Appendix
B; (D0), (D6), (D7) and (D13) at the inline citations in the F doc's §1.3.
Two caveats the F doc discloses and this document inherits: (D11)'s general
form has no single in-tree declaration — only kernel-checked instantiations
(e.g. `criticalFourShell_inter_selectedClass_card_le_two`) — and (D12)'s
symmetric (F4b) half has no in-tree declaration, following by the identical
two-rewrite calc.  They mean exactly what §1.3 states — in particular (D8)/(D9) are statements about *closed*
indexed caps of the **working** packet and require (C2); they do **not** extend
to arbitrary subsets of $A$, to caps of a different triangle, and (D9) does not
bound bisector points of pairs that are not both outside the cap.

The following additional in-project facts, all read from source and located in
Appendix A, are established background for this bridge.

* **(G1) MEC existence and uniqueness.**  For nonempty finite $A$ there is a
  unique pair $(O, R_0)$ with $R_0 \ge 0$, $|pO| \le R_0$ on $A$, and $R_0$
  minimal among enclosing radii.  *Does not imply* anything about
  $|\partial A|$, nor that $O \in A$, nor that $O$ is a carrier point.
* **(G2) Welzl invariant.**  For nonempty noncollinear finite $A$,
  $O \in \mathrm{conv}(\partial A)$.  *Does not imply* $|\partial A| \ge 3$ by
  itself, and does not identify which boundary points carry $O$ in their hull.
* **(G3) No diameter branch under K₄.**  If $A$ is nonempty, noncollinear,
  convex-independent and has the K₄ property, then $|\partial A| \ge 3$.
  *Does not imply* $|\partial A| \ge 4$, and does not say that any particular
  triple of boundary points is non-obtuse.
* **(G4) Triple $\to$ `IsM44` packet.**  (i) From $|\partial A| \ge 3$ one
  non-obtuse circumscribed triple exists (via (G2) plus Carathéodory: any
  boundary triple whose closed hull contains $O$ has all three angles
  non-obtuse — this implication is proved in-project, though as a `private`
  lemma, so it must be re-proved rather than cited across modules).  (ii) For
  *any* admissible triple, its cap triple exists: the non-degeneracy clause
  follows from the three boundary memberships plus pairwise distinctness, and
  the exactly-one clause follows from convex independence (C2) alone.  (iii) If
  two of the three caps of an admissible triple have exactly four points and
  $|A| > 9$, then an `IsM44` surplus-cap packet on $A$ exists, with the third cap
  as surplus.  *Does not imply* that any admissible triple has a small cap, and
  gives no upper bound on any cap.
* **(G5) Cap lower bound.**  For any cap triple over any Moser triangle on a
  convex-independent, noncollinear $A$ with the K₄ property, admitting the
  circumscribed MEC data (boundary memberships, non-obtuseness, disk
  containment), all three caps have $\ge 4$ points.  *Does not imply* $\ge 5$
  anywhere, does not bound caps above, and does not apply to a triangle whose
  vertices are not on the MEC boundary of $A$.
* **(G6) `noM44` consequence.**  Given (C7), for any admissible triple for $A$
  whose cap at index $i$ has $> 4$ points, some other cap has $\ge 5$ points.
  Combined with (G5), the cap-sum identity and (C8): **every** admissible triple
  for $A$ has at most one cap of size exactly four.  *Does not imply* that no
  cap has size four, does not identify which cap is large, and is a consequence
  of (C7) — it therefore may not be used as a step toward *establishing* (C7),
  and it cannot by itself produce a triple.
* **(G7) Exact four-cap $\Rightarrow$ apex selector class.**  In any surplus-cap
  packet on $A$ with global K₄ and convex independence, a cap of size exactly
  four at index $i$ forces a positive radius at which the radius class centred at
  the Moser vertex opposite that cap has cardinality **exactly** 4, contains that
  cap's strict interior, and meets each of the two adjacent caps in exactly one
  point.  Consequently an `IsM44` packet forces two such selector classes, one at
  each of its two opposite apices.  *Does not imply* anything about the surplus
  cap's apex, and does not identify the radii.  This is a strong **necessary
  condition** on any Bridge-4 witness, and is therefore both a consistency check
  and a possible source of contradiction with (U1)/(T4)/(X6)/(X7).

Known results on repeated distances in convex position (e.g. Erdős–Moser-type
bounds) may be used only as accurately stated published theorems with all
hypotheses; they do not by themselves settle this bridge.

---

## §7 Multiagent orchestration block

Use multiagent orchestration aggressively and dynamically.  You have up to 40
concurrent agents available.  Do not use a fixed assignment such as "N agents for
strategy X."  Manage the search with the following heuristics.

### Approach portfolio

Begin with a genuinely diverse portfolio.  Agents should explore substantially
different formulations, invariants, reductions and computational sanity checks,
drawn from (at least) these families:

1. **Boundary census.**  Determine, from $\Gamma$, what can be proved about
   $\partial A$: lower bounds beyond (G3); whether (T4)-richness, (U1), (T5) or
   (C6) force additional boundary points; whether any of the named points
   ($s_i, t_i, b, b', q_\star, w_\star, u, u'$) can be proved on or off
   $\partial A$.
2. **Boundary production from minimality.**  (C6)/(D10)/(T5): does the
   unique-four cover budget, applied to boundary versus interior points, force
   $|\partial A| \ge 4$?  Interact the cover count with (D7) (apices are never
   blocker values).
3. **Arc-occupancy calculus.**  How the three cap cardinalities change when one
   vertex of an admissible triple is replaced by another boundary point:
   discrete cap-transfer identities, and whether the working packet's
   $(\ge 6, \ge 6, \ge 6)$ profile can be driven to $(4, 4, m)$ by a single
   vertex substitution.
4. **Short-arc detection.**  Find a boundary point $w$ and a chord for which the
   opposite closed arc contains exactly two interior carrier points.  Combine
   convex-position ordering with the exact classes $S_{a_1}(r)$, $S_{a_1}(\rho)$
   (each exactly four points, (X6)/(X7)) and their strict-cap traces (X8)/(X9).
5. **Non-obtuseness combinatorics.**  Among triples of $\partial A$, which
   contain $O$ in their closed hull ((G2), Carathéodory)?  Characterize the
   admissible triples of a convex boundary set and count them.
6. **(G7) forward pressure.**  Assume a Bridge-4 witness and push (G7): two
   exact-four selector classes at the two new opposite apices.  Confront these
   with (U1) (unique K₄ radius at blocker centers), (D7), (T4), (T6) and the
   two frontier radii.  Either a contradiction (refuting a candidate triple) or a
   sharp localization of where the witness must live.
7. **Working-cap surgery.**  The surplus cap $m$ has $\ge 6$ points; can a
   boundary point inside $m$'s arc split it so that two of the new caps drop to
   four?  Track (P3)'s closed-cap convention through the surgery.
8. **Perpendicular-bisector and co-radiality counting** across the row system
   $K(s_1), K(t_1), S_{a_1}(r), S_{a_1}(\rho)$ and the packet rows, aimed at
   locating carrier points at MEC-boundary distance from $O$.
9. **Two-circles-meet-in-$\le 2$-points bookkeeping** between the MEC and the
   exact four-point rows: a row meets $\partial A$ in at most two points unless
   it *is* the MEC; use (T6) and (U1) to exclude the degenerate case.
10. **Blocker-map digraph structure.**  $x \mapsto c(x)$ has no fixed points,
    every value is a unique-four center, iterates cycle; how does the cycle
    interact with $\partial A$ and with the collision fibers?
11. **Exact coordinate normalization** (place $O$ at the origin, normalize
    $R_0 = 1$) **plus polynomial elimination** (resultants, Gröbner bases —
    msolve/Singular) per combinatorial pattern of boundary membership and arc
    assignment.
12. **SMT over nonlinear real arithmetic** (Z3/cvc5) on the existential fragment
    of a fixed pattern, with validated encodings.
13. **SAT/ILP enumeration of incidence patterns**: which carrier points are on
    $\partial A$, which lie in which arc for each candidate triple, under the
    cardinality constraints of $\Gamma$ — followed by per-pattern geometric
    elimination.
14. **Repeated-distance extremal counting in convex position** applied to the
    exact-four classes and to $\partial A$ (all boundary points are at the same
    distance $R_0$ from $O$, which is *not* a carrier point in general — check
    before using).
15. **Degenerate and boundary cases of the MEC dichotomy.**  What if
    $|\partial A| = 3$ exactly (then Bridge 4 is **false** for this carrier, by
    §2.3 — pursue this as a partial branch-B route: prove $|\partial A| = 3$ is
    consistent with $\Gamma$, or prove $\Gamma$ forces $|\partial A| \ge 4$);
    what if $|\partial A| = 4$; the diameter branch is excluded by (G3).
16. **Exact branch-B search**: small algebraic carriers ($n = 15..20$) with
    all-center K₄ and a circumscribed MEC — structured families (orbits of a
    rotation, points on few concentric circles, vertices of regular polygons with
    perturbation) — checked exactly against the full clause list of §1.2 plus the
    finite (C7) check of §4.
17. **K₄ propagation solvers.**  Attack the obstruction named in §4 directly:
    given a partial exact model, decide by exact search whether an all-center K₄
    convex extension exists at sizes $15 \le n \le 22$, using the injection lower
    bound as a pruning invariant.

### Named attractors — do not let the portfolio collapse onto these

Do not tell most agents the currently favored approach.  Preserve independence
during early rounds so that agents do not all converge to the same attractive but
incomplete argument.  The known attractors here are:

* **(a) THE COLLISION-ROW REPACKAGING ATTRACTOR (primary).**  The exact-collision
  context supplies two exact four-point classes — the $s$-row
  $K(s_1) = S_b(r(s_1))$ and the $t$-row $K(t_1) = S_{b'}(r(t_1))$, each of
  cardinality exactly four — and two exact four-point apex classes $S_{a_1}(r)$,
  $S_{a_1}(\rho)$.  Caution: Γ proves the two rows disjoint only *inside*
  $C_{i_1}$ ((D4) with (X10)); each row has exactly two points outside
  $C_{i_1}$, and nothing in Γ forbids those off-cap points from coinciding —
  (D11) permits up to two common points since $(b, r(s_1)) \neq (b', r(t_1))$.
  Full disjointness is an unproved premise, not configuration data.  The natural attempt is to package a pair of these as the two
  four-point opposite caps of a new packet.  **Round 1's verdict, verbatim:**

  > "`noM44`: no alternate MEC-derived surplus packet with two four-point caps is
  > produced by the distance rows.  Merely relabeling the working triangle does
  > not change the cap cardinalities in the required way."

  Any agent attempting this must check **every** packet field of §1.4.4 and
  **every** cap-triple clause of §1.4.3, and must report which fields fail and
  whether any variant survives.  The structural mismatch to be examined precisely:
  the rows are *circle classes* about centers $b, b' \in C_{i_1}^{\circ}$ and
  about the apex $a_1$, whereas caps are *closed arc segments of the MEC
  partition*, pinned by clause 6 (arc membership) to the chord-separation
  predicate of a triple of MEC-boundary points.  Concrete checks that must appear
  in any such attempt:
  * clause 6 (arc membership) — is the proposed cap equal to
    $\{v \in A : \mathrm{Arc}(w_i; v)\}$ for the proposed triple, as an equality
    of finite sets in both directions?
  * clauses 2–4 — does the proposed cap contain exactly the two chord-endpoint
    Moser vertices and exclude the opposite apex?  A four-point row containing
    neither of the new triangle's vertices cannot be a cap.
  * (A-ii) — are the proposed triangle's vertices on $\partial A$?  $a_1$ is
    (it is a working apex); $b$ and $b'$ are in $C_{i_1}^{\circ}$ and are
    unique-four centers, so by (D7) they are not apices — whether they are on
    $\partial A$ is an open question the attempt must settle, not assume.
  * (D8) — for a center $z$ in a closed cap $C_i$ of the working packet, every
    4-point row about $z$ meets $C_i$ in at most two points.  With (D5)
    ($b, b' \in C_{i_1}^{\circ}$) and (D4), each collision row already has
    exactly two points inside $C_{i_1}$ and two outside; a cap is not of that
    shape unless the new triangle cuts $A$ very differently.
  * (X3), (X8), (X9) — **both** the $s$-pair and the $t$-pair lie in the
    *same* strict cap interior $C_{i_1}^{\circ}$.  Two caps of one triangle are
    disjoint except at shared Moser vertices, so any attempt to make the two rows
    the two opposite caps of one triangle must explain how they become disjoint
    arc blocks.
* **(b) The relabelling attractor.**  Permuting the working triangle's labels or
  changing only the surplus index.  Refuted by (N1) plus (T2)/(T3); already
  implemented in-tree.
* **(c) Heuristic overdetermination and cap-sum counting.**  "The caps must sum
  to $|A|+3$, so some triple has two small caps" — an arithmetic observation that
  produces no triple and no boundary membership.
* **(d) The one-short-cap confusion.**  Producing (or citing a terminal about) a
  *single* exact-four cap.  (S2)/(G6) show $\Gamma$ permits exactly that; only
  two simultaneously is `IsM44`.

Also demand genuinely different constructions, not variants of (a): a **different
Moser triangle from a different boundary configuration** (a triple using one or
more boundary points that are not working apices); a **different non-obtuse
circumscribed triangle** on the same boundary set; and the **degenerate/boundary
cases of the MEC dichotomy** (exactly three boundary points; exactly four; the
excluded diameter branch).

### Process rules

* Maintain an explicit registry of approach families.  Group agents by the
  mathematical idea, not by wording.  If many agents converge to one family,
  redirect some toward underexplored formulations.
* Do not allow one approach to dominate merely because it gives an elegant
  reformulation.  A route that ends at an unproved incidence, boundary-count, or
  cap-counting lemma equivalent in strength to Bridge 4 is not close to
  completion unless it supplies a genuinely new proof of that lemma.
* When an approach stalls at a theorem-strength missing lemma, mark that route as
  blocked.  Only continue assigning agents to it if someone proposes a materially
  new mechanism, invariant, construction, quantitative estimate, or exact
  elimination device.
* Keep several incompatible routes alive through multiple rounds.  Maintain both
  branch-A routes and branch-B routes until one side is rigorously ruled out.
  Cross-pollinate only after independent agents have developed their routes far
  enough to expose real strengths and gaps.
* Use computational agents throughout: exact small-case computation, SAT/ILP/SMT
  encodings, Gröbner eliminations per pattern, candidate branch-B searches, and
  counterexample searches against proposed intermediate lemmas.  Always validate
  an encoding against a known result first.  Computation is evidence unless
  converted into a rigorous general proof or an exact certificate completing a
  valid reduction.
* Search aggressively for counterexamples to proposed lemmas.  Before any
  intermediate lemma is relied on, assign agents (computational where possible)
  to refute it — configurations satisfying a *subset* of $\Gamma$ are cheap to
  build and often kill overstated sublemmas.  A found counterexample kills the
  route immediately; a lemma that has survived no refutation attempt is not
  established.

### Adversarial checklist

Use adversarial agents throughout — independent agents that did not produce the
argument under audit.  Every candidate proof must be checked for:

**Packet fields (§1.4.4).**

* the packet is on **exactly** $A$, not a subset, superset or image;
* all three vertices are in $A$ (field 3, (A-i));
* all three vertices satisfy $|w_i O| = R_0$ for the MEC of $A$ — not of a
  sub-configuration, not "a circle through three carrier points", not "extreme
  points of $A$" (field 3, (A-ii));
* pairwise distinctness is established and the *circumscribed* branch is selected
  (field 4); the diameter branch is not silently used;
* all three non-obtuse inner products are proved, in the stated orientation
  (field 3, (A-iv)); an angle proved non-obtuse at the wrong vertex is a failure;
* the cap triple's subset clauses, the nine membership/non-membership clauses at
  the Moser vertices, the exactly-one clause, and the arc-membership clause are
  each discharged (field 5, all fourteen clauses of §1.4.3);
* caps are computed with the **closed** convention (chord-endpoint vertices
  included) and cardinalities counted accordingly;
* the surplus index is chosen so the two exact-four caps are `oppCap₁`/`oppCap₂`
  in the **cyclic order** of §1.4.4 — an off-by-one silently yields a non-`IsM44`
  packet (field 6);
* $|C_{\sigma'}'| > 4$ is proved, not inferred from `IsM44` (field 7);
* `IsM44`'s two equalities are exact ($= 4$), with both bounds proved; the upper
  bound ("no fifth point on the closed arc") is the load-bearing half.

**$\Gamma$ usage.**

* (C2) convex independence used exactly as stated (extreme points, not "general
  position");
* K₄ always with a strictly positive radius and the correct ambient set (which
  point was deleted, and from what);
* (C6) minimality applied with its true quantifier (all planar sets, not subsets
  of $A$) and never in a circular descent;
* (C7) applied to **all** packets on $A$; and never used to *establish* a fact
  that the construction then uses to contradict (C7) in a way that is actually
  circular — the usage ledger of §4 must make every (C7)-dependent step visible;
* (G6) not mistaken for an independent geometric fact — it is a (C7) consequence;
* closed cap $C_i$ vs strict interior $C_i^{\circ}$ in every membership;
  Moser endpoints handled under the closed-cap convention;
* exact cardinalities where hypothesized ($= 4$ in (X6)/(X7)/(H1), $\le 2$ in
  packets) vs lower bounds elsewhere ($\ge 4$, $\ge 6$, $\ge 8$);
* $K(x)$ used as the **full** radius class (both directions of exactness:
  nothing else of $A$ is on that circle);
* (H2) criticality invoked only at the deleted point's own blocker;
* (U1) unique-radius used only at blocker values $c(x)$, never at arbitrary
  carrier points, and never at $a_0, a_1, a_2$ (excluded by (D7));
* robustness/richness claimed only where given ((T1), (T4), (D6));
* (D8)/(D9) applied only to the **working** packet's closed caps, never to the
  caps of the new triangle;
* frontier data: $q_\star, w_\star \notin m$; both frontier instances kept
  distinct; (Q5)'s second arm correctly refuted via (X5)–(X7) when used;
* collision data: equal-blocker identities used with the right pair; (X8)/(X9)
  are statements about the *strict* interior; (X10) does not by itself give (X11);
* (M)-cycle facts: the designated $u, u'$ are fixed but unknown elements of their
  pairs — proofs must not assume $u = s_1$ or $u' = t_1$.

**Provenance and circularity.**

* every §5 item;
* no citation of F1–F4, of the parent coordinator, or of any unproved consumer;
* no citation of round-1 CONJECTURE items (F3c-redundancy; sharpened F3/F4
  terminals);
* no citation of `COMPAT-ONLY/BANK` modules as spine facts;
* circular use of a statement equivalent to Bridge 4, to (C7)'s negation, or to a
  sibling leaf's conclusion.

Require agents to return concrete lemmas, constructions, equations, exact
certificates, encodings with validation runs, or counterexamples to proposed
sublemmas.  Reject status reports, vague optimism, and claims that an unproved
boundary-count or cap-count statement is "routine."  The root agent should
repeatedly synthesize, challenge, redirect, and launch new rounds.  Do not stop
after the first wave fails.

---

## §8 Anti-quit block

Do not return merely because current approaches fail or agents report
theorem-strength gaps.  Continue launching new rounds, reopening blocked
approaches only when there is a genuinely new mechanism, and searching for fresh
formulations.  Spend at least six full rounds of the approach portfolio before
even thinking of returning.  Round 1 already established that the local circle,
cap-order, collision and mutual-omission data are jointly realizable in exact
convex geometry; a repeat of local-only reasoning is not a new round.

---

## §9 Return contract

Return only when Bridge 4 has been completely resolved — a branch-A construction
of an `IsM44` surplus-cap packet on $A$ from exactly the stated hypotheses, with
every field of §1.4.4 proved, or a branch-B exact realizability certificate for
$\Gamma$ — and the argument survives adversarial audit.

A branch-A return must contain: the named triple $w_1, w_2, w_3$; proofs of
(A-i)–(A-iv); the two exact cap cardinality computations with both bounds; the
surplus index and its bound; the field-by-field audit table; and the
$\Gamma$-usage ledger.

A branch-B return must contain: exact coordinates; the exact MEC with its
boundary set; the finite (C7) check over all admissible triples; and clause-by-
clause verification of every item of §1.2, with the verification scripts.

Do not return a reduction, partial result, isolated missing lemma, finite
computation, numerical guess, "best effort" summary, or an explanation of
difficulty.  Do not stop, return, or give up until a complete and rigorous
resolution exists; continue exploring every plausible approach, repairing failed
arguments, and developing new ones.  If, after exhausting the portfolio
repeatedly, the bridge remains open, the final report must state: the strongest
rigorously proved derivation; the exact remaining gap as a precisely stated
mathematical statement (in the vocabulary of §2.1 — a statement about admissible
triples and arc-cap cardinalities); and the audit trail of refuted intermediate
lemmas, including every candidate triple eliminated and the field that killed it.

---

## §10 Web-search restriction

Public search may be used only for ordinary mathematical background or standard
named theorems (minimum enclosing circles, Welzl's invariant, convex-position
distance counting, circle incidence, real algebraic elimination), not to search
for a solution to this exact obligation, to this formalization project, or to
Erdős problem 97's status.  Do not search the public web to determine whether
these statements are open, and do not answer that they are open.

---

## Appendix A — Declaration names and locations

All paths relative to `lean/` in the repository `erdos-97-96-formalization`,
except where noted.  Every line number below was read from source on 2026-07-27.

### The packet layer (target)

| Object | Lean declaration | Location |
|---|---|---|
| packet record | `Problem97.SurplusCapPacket` | `Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:332` |
| structural triangle projection | `SurplusCapPacket.triangle` | `Cap/PartitionFromMEC.lean:363` |
| surplus cap | `SurplusCapPacket.surplusCap` | `Cap/PartitionFromMEC.lean:367` |
| surplus $> 4$ | `SurplusCapPacket.surplus_card_gt_four` | `Cap/PartitionFromMEC.lean:374` |
| first opposite cap | `SurplusCapPacket.oppCap1` | `Cap/PartitionFromMEC.lean:381` |
| second opposite cap | `SurplusCapPacket.oppCap2` | `Cap/PartitionFromMEC.lean:388` |
| cap-sum identity | `SurplusCapPacket.capSum` | `Cap/PartitionFromMEC.lean:397` |
| **`IsM44`** | `SurplusCapPacket.IsM44` | `Cap/PartitionFromMEC.lean:443` |
| $m = |A| - 5$ under `IsM44` | `SurplusCapPacket.IsM44.surplus_card_eq` | `Cap/PartitionFromMEC.lean:448` |
| cap by cyclic index | `SurplusCapPacket.capByIndex` | `Cap/PartitionFromMEC.lean:466` |
| strict cap interior | `SurplusCapPacket.capInteriorByIndex` | `Cap/PartitionFromMEC.lean:474` |
| first opposite index | `SurplusCapPacket.oppIndex1` | `Cap/PartitionFromMEC.lean:521` |
| second opposite index | `SurplusCapPacket.oppIndex2` | `Cap/PartitionFromMEC.lean:528` |
| structural Moser triangle | `Problem97.MoserTriangle` | `Erdos9796Proof/P97/Cap/Structure.lean:98` |
| cap triple (14 fields) | `Problem97.CapTriple` | `Cap/Structure.lean:161` |
| MEC Moser triangle + dichotomy | `Problem97.MEC.MoserTriangle` | `Erdos9796Proof/P97/Moser/Triangle.lean:59` |
| non-obtuse circumscribed triangle | `MEC.NonObtuseCircumscribedMoserTriangle` | `Erdos9796Proof/P97/Moser/TriangleNonObtuse.lean:667` |
| circumscribed $\to$ structural | `MEC.MoserTriangle.toStructural` | `Cap/PartitionFromMEC.lean:127` |
| apices | `SurplusCapPacket.oppApex1` / `.oppApex2` / `.surplusApex` | `Erdos9796Proof/P97/U1TwoShortCapReduction.lean:297,305,313` |
| opposite vertex by index | `SurplusCapPacket.oppositeVertexByIndex` | `Erdos9796Proof/P97/SurplusM44Packet/Shard01.lean:1013` |
| signed area | `Problem97.signedArea2` | `Erdos9796Proof/P97/Foundation.lean:49` |
| arc predicate | `Problem97.OnArcOpposite` | `Foundation.lean:57` |
| arc predicate chord symmetry | `onArcOpposite_swap_chord` (`private`) | `Erdos9796Proof/P97/U2NonSurplusOneHit.lean:114` |
| radius class $S_p(r)$ | `Problem97.SelectedClass` | `Erdos9796Proof/P97/WitnessPacketInterface.lean:59` |
| convex independence | `Problem97.ConvexIndep` | `Foundation.lean:28` |
| K₄ predicates | `Erdos97.HasNEquidistantPointsAt` / `…Property` (re-exported) | `Foundation.lean:23` |

### The MEC layer

| Object | Lean declaration | Location |
|---|---|---|
| MEC existence/uniqueness | `MEC.exists_unique_minimum_enclosing_circle` | `Erdos9796Proof/P97/MEC/Basic.lean:255` |
| the MEC | `MEC.mec` | `MEC/Basic.lean:275` |
| MEC boundary set | `MEC.boundary` | `Erdos9796Proof/P97/MEC/Boundary.lean:62` |
| Welzl invariant (G2) | `MEC.mec_center_mem_convexHull_boundary` | `Moser/TriangleNonObtuse.lean:100` |
| $O \in \mathrm{conv} \Rightarrow$ non-obtuse | `inner_chord_nonneg_of_baryComb` (`private`) | `Moser/TriangleNonObtuse.lean:331` |
| non-obtuse triple existence | `MEC.exists_nonobtuse_circumscribed_triple` | `Moser/TriangleNonObtuse.lean:491` |
| triangle wrapper existence | `MEC.nonempty_nonobtuseCircumscribedMoserTriangle` | `Moser/TriangleNonObtuse.lean:687` |
| non-degeneracy | `MEC.moser_triangle_signed_area_ne_zero` | `Erdos9796Proof/P97/Moser/NonDeg.lean:181` |
| no diameter branch (G3) | `MEC.no_diameter_under_k4` | `Erdos9796Proof/P97/NoDiameterUnderK4.lean:725` |

### Producers used by (G4)–(G7)

| Fact | Lean declaration | Location |
|---|---|---|
| exactly-one clause from (C2) | `arc_partition_count_eq_one` | `Erdos9796Proof/P97/ArcPartitionCount.lean:402` |
| cap triple from a triple | `MEC.cap_partition_from_moser_circumscribed` | `Cap/PartitionFromMEC.lean:165` |
| packaged triple $\to$ cap triple | `MEC.exists_capTriple_of_circumscribed` | `Erdos9796Proof/P97/CapBridgeFromK4.lean:38` |
| cap triple $\to$ packet | `CapTriple.toSurplusCapPacket_of_card_gt_nine` | `Cap/PartitionFromMEC.lean:420` |
| MEC packet record | `Problem97.CircumscribedMECPacket` | `Erdos9796Proof/P97/CircumscribedMECPacket.lean:83` |
| MEC packet from triangle | `CircumscribedMECPacket.ofNonObtuse` | `CircumscribedMECPacket.lean:191` |
| **(G5)** cap lower bound | `U1OppositeCapLowerBounds.capTriple_caps_card_ge_four` | `Erdos9796Proof/P97/U1OppositeCapLowerBounds.lean:446` |
| **(G4iii)** two exact caps $\to$ `IsM44` | `isM44Packet_of_capTriple_two_exact_of_card_gt_nine` | `U1TwoShortCapReduction.lean:576` |
| … indexed variants | `isM44Packet_of_capTriple_C1_surplus` (and `C2`, `C3`) | `U1TwoShortCapReduction.lean:472, 499, 526` |
| **(G6)** second large cap from `noM44` | `exists_secondLargeCap_of_noM44` | `Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2157` |
| **(G7)** four-cap $\to$ selector shape | `SurplusCapPacket.exists_moserSelectorShapeAt_of_hasNEquidistantProperty` | `SurplusM44Packet/Shard05.lean:194` |
| **(G7)** `IsM44` $\to$ two selector shapes | `IsM44.exists_nonSurplusMoserSelectorShapes` | `SurplusM44Packet/Shard05.lean:208` |
| selector shape predicate | `SurplusCapPacket.MoserSelectorShapeAt` | `SurplusM44Packet/Shard02.lean:857` |

### The refuted relabelling constructions (attractor (b))

| Object | Lean declaration | Location |
|---|---|---|
| vertex transposition triangles | `swap23NonObtuse`, `swap13NonObtuse`, `swap12NonObtuse` (`private`) | `U2NonSurplusOneHit.lean:1417, 1446, 1475` |
| their cap triples | `swap23Partition`, `swap13Partition`, `swap12Partition` (`private`) | `U2NonSurplusOneHit.lean:1543, 1581, 1619` |
| their packets | `fixedSurplusSwapPacket0/1/2` (`private`) | `U2NonSurplusOneHit.lean:1657, 1671, 1685` |

### The `noM44` carrier and the four leaves

| Object | Lean declaration | Location |
|---|---|---|
| counterexample datum | `Problem97.CounterexampleData` | `U1TwoShortCapReduction.lean:83` |
| (C6) minimality | `CounterexampleData.Minimal` | `U1TwoShortCapReduction.lean:158` |
| **`noM44` field** | `FrontierCommonDeletionParentResidual.noM44` | `Erdos9796Proof/P97/ATail/OrientedPhysicalApexIngress.lean:256` |
| … sibling carrier | `FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual.noM44` | `ATail/OrientedPhysicalApexIngress.lean:217` |
| Γ section-variable block | — | `ATail/FrontierLiveClosure.lean:7421–7469` |
| F1 | `TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence` | `ATail/FrontierLiveClosure.lean:7476` (`sorry` :7479) |
| F2 | `…false_of_capSource_freshThirdBlockerFiber` | `ATail/FrontierLiveClosure.lean:7486` (:7490) |
| F3 | `…false_of_capSource_firstFiber_collisionFiveCenterDeletion` | `ATail/FrontierLiveClosure.lean:7620` (:7628) |
| F4 | `…false_of_capSource_freshOutsideSecondBlockerFiber` | `ATail/FrontierLiveClosure.lean:7648` (:7652) |

### Not usable here (recorded to prevent mis-citation)

| Object | Location | Why excluded |
|---|---|---|
| `false_of_shortCap_at_largeCapUniqueFiveApex` | `ATail/LargeCapUniqueFiveShortCapTerminal.lean:42` | module is `COMPAT-ONLY/BANK`: source-proved, no import consumer, not on either publish spine; and it concerns a single exact-four cap, not `IsM44` |

### Branch-B artifacts

| Artifact | Path |
|---|---|
| 15-point exact rational model + full-target audit | `scratch/full-local-euclidean-model-complete/REPORT.md` |
| K₄-extension lower bound ($\ge 6$ new vertices) | `scratch/full-local-euclidean-model-complete/K4_EXTENSION_OBSTRUCTION.md` |
| exact checkers | `scratch/full-local-euclidean-model-complete/check_model.py`, `check_k4_extension_bound.py` |
| round-1 response (source of Bridge 4) | `docs/solve-prompts/2026-07-27-f-round1-response.md` |
| round-1 prompt (source of Γ) | `docs/solve-prompts/2026-07-27-exact-collision-terminals.md` |

---

## Appendix B — Math object ↔ Lean structure

| §1 object | Lean name | Location |
|---|---|---|
| carrier + (C1)–(C5) bundle | `CounterexampleData` | `U1TwoShortCapReduction.lean:83` |
| (C6) minimality | `CounterexampleData.Minimal` | `U1TwoShortCapReduction.lean:158` |
| **(C7) $\neg\exists$ `IsM44` packet** | `FrontierCommonDeletionParentResidual.noM44` | `ATail/OrientedPhysicalApexIngress.lean:256` |
| (C7)'s predicate | `SurplusCapPacket.IsM44` | `Cap/PartitionFromMEC.lean:443` |
| (C8) $|A| > 9$ | `FrontierCommonDeletionParentResidual.carrier_card_gt_nine` | `ATail/OrientedPhysicalApexIngress.lean:257` |
| (P1) MEC $(O, R_0)$ | `MEC.mec` | `MEC/Basic.lean:275` |
| $\partial A$ | `MEC.boundary` | `MEC/Boundary.lean:62` |
| (P2) triangle | `MEC.NonObtuseCircumscribedMoserTriangle`; structural `MoserTriangle` | `Moser/TriangleNonObtuse.lean:667`; `Cap/Structure.lean:98` |
| (P3) caps + arc predicate | `CapTriple`; `OnArcOpposite` / `signedArea2` | `Cap/Structure.lean:161`; `Foundation.lean:57, 49` |
| packet $S$, $m$, $\sigma$ | `SurplusCapPacket` | `Cap/PartitionFromMEC.lean:332` |
| $a_0, a_1, a_2$ | `surplusApex` / `oppApex1` / `oppApex2` | `U1TwoShortCapReduction.lean:313, 297, 305` |
| $C_i$, $C_i^{\circ}$, $i_1$, $i_2$ | `capByIndex` / `capInteriorByIndex` / `oppIndex1` / `oppIndex2` | `Cap/PartitionFromMEC.lean:466, 474, 521, 528` |
| radius class $S_p(r)$ | `SelectedClass` | `WitnessPacketInterface.lean:59` |
| (H1)–(H2) system $c, r, K$ | `CriticalShellSystem` | `U1CarrierInjection.lean:1015` |
| carrier vertex (subtype) | `CriticalShellSystem.CarrierVertex` | `U1CarrierInjection.lean:1111` |
| $\mathrm{Packet}(x; z_1, z_2)$ | `CommonDeletionTwoCenterPacket` | `ATail/CommonDeletionTwoCenter.lean:29` |
| (Q1)–(Q7) frontier | `CriticalPairFrontier` | `ATail/CriticalPairFrontier.lean:568` |
| (R1)–(R3) parent | `FrontierCommonDeletionParentResidual` | `ATail/OrientedPhysicalApexIngress.lean:251` |
| (X1)–(X4) collision row | `RetainedInteriorBlockerCollision` | `ATail/RetainedStrictInteriorPairSelector.lean:95` |
| (M1)/(M3) common deletion | `LocalizedCollisionCommonDeletion` | `ATail/RetainedStrictInteriorPairSelector.lean:449` |
| (M2)/(M4) cycles | `LocalizedCollisionMutualOmissionCycle` | `ATail/LocalizedCollisionMutualOmissionCycle.lean:131` |
| (T4)–(T6) | `FrontierAllLargeCapsTriApexRobustResidual` | `ATail/FrontierLiveClosure.lean:6527` |
| Robust / Rich | `FullyDeletionRobustAt`; `ApexRichClassStructure` | `ATail/DeletionRobustness.lean:27`; `ATail/ApexRichClassStructure.lean:50` |
| (U1) | `IsUniqueFourCenter` / `uniqueFourClass` | `ATail/MinimalUniqueFourCover.lean:48, 64` |
| NR | `notRobustCenters` | `ATail/MinimalUniqueFourCover.lean:418` |
| (D1) | `cross_deletion_survives_iff_not_mem_selected_support` | `ATail/CriticalPairFrontier.lean:755` |
| (D2) | `selectedFourClass_support_eq_shell` | `U1CarrierInjection.lean:1087` |
| (D3) | `selectedSupports_eq_of_actualBlockers_eq` | `ATail/SurvivalCover.lean:48` |
| (D4) | `RetainedInteriorBlockerCollision.shell_inter_cap_eq_sources`; `collisionShell_sdiff_firstCap_card_eq_two` | `ATail/RetainedStrictInteriorPairSelector.lean:279`; `ATail/BlockerMultiplicityGeometry.lean:220` |
| (D5) | `RetainedInteriorBlockerCollision.blocker_mem_capInterior` | `ATail/RetainedStrictInteriorPairSelector.lean:244` |
| (D8)/(D9) | `selectedFourClass_inter_capByIndex_card_le_two`; `outsidePair_unique_capCenter` | `CapSelectedRowCounting.lean:257, 283` |
| (D10)/(T5) | `card_le_four_mul_notRobustCenters` | `ATail/MinimalUniqueFourCover.lean:429` |
| (F1a) | `CrossBlockerCoincidence` | `ATail/TwoCollisionGlobalProducer.lean:272` |
| (F2a)+(F2b) | `CapSourceThirdCanonicalRowSurface` | `ATail/TwoCollisionGlobalProducer.lean:291` |
| (F2c) | `FreshThirdBlockerFiber` | `ATail/BlockerMultiplicityGeometry.lean:70` |
| (F3a) | `FreshOutsideFirstBlockerFiber` | `ATail/BlockerMultiplicityGeometry.lean:115` |
| (F3c) | `FirstFiberCollisionFiveCenterDeletionResidual` | `ATail/FirstFiberOverlapDescent.lean:85` |
| (F4b) | `FreshOutsideSecondBlockerFiber` | `ATail/BlockerMultiplicityGeometry.lean:161` |

---

## Appendix C — Status of round-1 claims used in this document

**Audited and usable.**  Round 1's negative verdict on the `noM44` route (quoted
verbatim in §7(a)); the list of eliminated approaches reproduced in §5; the
existence and contents of the 15-point exact rational model and its full-target
audit; the K₄-extension lower bound.  These were verified in the rigid221-collapse
audit session of 2026-07-27 (every repository citation real; the cited Lean
artifacts sorry-free).

**Not re-verified in that audit** (treat as unconfirmed, do not build on):
the arithmetic of the 15-point model beyond the exact-rational checker artifacts
from the prior session, and the content match of the claimed six-point F1
equality-arm model against `scratch/hard-branch-math/equality-arm-model.lean`.

**CONJECTURE — must not be used as background.**  Round 1's F3c-redundancy
derivation ("modulo Γ and F3b, F3c carries no new positive geometry") and its
sharpened F3/F4 sufficient terminals ($|K(g) \cap K(s_1)| \ge 3$; $c(g) \in
C_{i_1}$ together with $\{e,o\} \subseteq K(g)$).  These are explicitly labelled
CONJECTURE until kernel-checked and are listed in §5 as inadmissible citations.

**Derivation in this document, not an in-tree theorem.**  (N1) (cap determinacy
from the subset and arc-membership clauses) and its corollaries (S1)-adjacent
reasoning in §2.3.  (N1) is a one-step consequence of two quoted structure
fields; re-derive it rather than citing it.  (S1) and (S2) are consequences of
the in-tree facts (G5)/(G6) plus $\Gamma$ and must likewise be re-derived.
