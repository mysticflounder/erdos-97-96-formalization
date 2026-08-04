# Solve prompt — Family F, Bridge 1: a named positive cross-shell incidence

Date: 2026-07-27.

> **Historical-status notice (2026-07-30):** This round-2 prompt preserves a
> consumed 2026-07-27 frontier snapshot. Its four F1–F4 leaves and source line
> numbers are historical, not current obligations. The live direct frontier
> now consists of `false_of_crossBlockerCoincidence` and
> `false_of_capSourceThirdCanonicalRowSurface`. Use the closure matrix,
> computational closure plan, and generated blueprint for current status.

Round: 2.  Round 1 ran `docs/solve-prompts/2026-07-27-exact-collision-terminals.md`
("the F doc") against the four `sorry` leaves F1–F4 of
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7476, 7486, 7620, 7648`).
It returned neither a proof nor a certificate, and named four candidate
"global bridges".  This document is the round-2 prompt for **Bridge 1**.

Round-1 response: `docs/solve-prompts/2026-07-27-f-round1-response.md`.

**Scope.**  Bridge 1 is: *derive from the ambient configuration $Γ$ one of the
three positive-incidence data packages that the repository's already-proved
terminals consume.*  Package (4) of the round-1 census — a common two-point
pair outside a cap, consumed by `outsidePair_unique_capCenter` — is **not** in
scope here; it is the subject of the companion round-2 document
`docs/solve-prompts/2026-07-27-f-bridge-second-cap-center.md` (Bridge 2).
Do not work package (4) in this document's scope; cross-reference only.

This document is self-contained.  A reader with neither the F doc nor the
repository can work on it: every hypothesis is stated below in plain
mathematics (finite point sets in $ℝ^2$, Euclidean distance, cardinality,
membership, convex position).  Appendices A–C carry the Lean coordinates,
verified against the working tree on 2026-07-27.

---

## §1 Notation preamble and the shared ambient configuration

### 1.1 Basic notation

* $ℝ^2$ is the Euclidean plane with the standard Euclidean distance; $|xy|$
  denotes the distance between points $x, y$.  All point sets are finite unless
  stated otherwise.  $|X|$ denotes cardinality of a finite set $X$;
  $X \setminus Y$ set difference.
* For $p ∈ ℝ^2$, $\varrho ∈ ℝ$ and a finite $X ⊂ ℝ^2$, the **radius class**
  ("selected class") is
  $$S^X_p(\varrho) := \{\, q ∈ X : |pq| = \varrho \,\}.$$
  When $X = A$ (the ambient carrier, below) we write $S_p(\varrho)$.  For
  $\varrho > 0$ the class never contains its own center.
* **K₄ predicate.**  For a finite $X ⊂ ℝ^2$ and $p ∈ ℝ^2$:
  $$K₄(X, p) :⟺ ∃\, \varrho > 0 \text{ with } |S^X_p(\varrho)| ≥ 4 .$$
  ("$p$ has four equidistant points in $X$.")  A set $X$ has the
  **K₄ property** iff $K₄(X, p)$ holds for every $p ∈ X$.
* **Convex independence.**  A finite $X ⊂ ℝ^2$ is *convex-independent* iff
  every $x ∈ X$ satisfies $x ∉ \mathrm{conv}(X \setminus \{x\})$: all points of
  $X$ are vertices of its convex hull ($X$ is in strictly convex position).
* **Signed area.**  For $u, x, y ∈ ℝ^2$ with $u = (u_1,u_2)$ etc.:
  $$\mathrm{sa}(u, x, y) := (x_1 - u_1)(y_2 - u_2) - (y_1 - u_1)(x_2 - u_2).$$
* **Arc-side predicate.**  For a labelled triangle vertex $v_i$ with the other
  two vertices $v_j, v_k$, and a point $v$:
  $$\mathrm{Arc}(v_i; v) :⟺ \mathrm{sa}(v, v_j, v_k)\cdot\mathrm{sa}(v_i, v_j, v_k) ≤ 0,$$
  i.e. $v$ lies on the closed side of the chord $v_j v_k$ opposite to $v_i$
  (points on the chord itself satisfy the predicate — closed-cap convention).
* **CCW boundary enumeration.**  For a convex-independent $A$ with $|A| = n$, a
  *ccw enumeration* is an injective $φ : \{0,1,\dots,n-1\} → ℝ^2$ with image
  $A$ such that for all $i < j < k$ the three points $φ(i), φ(j), φ(k)$ are in
  counterclockwise orientation.  In the repository's sign convention this is
  $\mathrm{sa}(φ(i), φ(j), φ(k)) < 0$ for all $i<j<k$.  Such an enumeration
  exists for every convex-independent finite $A$ (a packet-relative in-tree
  version: `exists_ccw_boundary_order_at_surplus_apex`,
  `SurplusM44Packet/Shard05.lean:121`), and any **cyclic shift** of
  one is again one; consequently only the *cyclic* order of named points
  matters, and the cut (which point receives index $0$) may be chosen freely.
  **Orientation warning.**  The $\mathrm{sa} < 0$ clause is the normative one:
  the repository predicate `EuclideanGeometry.IsCcwConvexPolygon` proves
  *negative* `signedArea2` on increasing index triples
  (`ConvexCyclicOrder/Basic.lean:74–92`).  The scratch models quoted in §6
  (B5)/(B7) list hull orders with all increasing-triple determinants
  *positive* — those orders are the **reverse** of a valid (T2-b)/(T3-e)
  enumeration and must be reversed before use.
* **Two-center common-deletion packet.**  For $x ∈ A$ and $z_1, z_2 ∈ ℝ^2$
  (relative to the fixed carrier $A$ and blocker system $c(\cdot)$ of §1.2),
  $\mathrm{Packet}(x; z_1, z_2)$ denotes the conjunction of:
  1. $x ∈ A$, $z_1 ∈ A$, $z_2 ∈ A$, $z_1 ≠ z_2$;
  2. $K₄(A\setminus\{x\},\, z_1)$ and $K₄(A\setminus\{x\},\, z_2)$;
  3. $c(x) ≠ z_1$ and $c(x) ≠ z_2$;
  4. there exist finite sets $B_1, B_2 ⊂ ℝ^2$ and reals $\varrho_1, \varrho_2 > 0$
     with, for $j ∈ \{1,2\}$: $B_j ⊆ (A\setminus\{x\})\setminus\{z_j\}$,
     $x ∉ B_j$, $|B_j| = 4$, every $y ∈ B_j$ satisfies $|z_j y| = \varrho_j$;
     and $|B_1 ∩ B_2| ≤ 2$.

### 1.2 The ambient configuration Γ

$Γ$ is the hypothesis package shared by all four leaves: exactly the content of
the Lean section-variable/`include` block at
`FrontierLiveClosure.lean:7421–7469` after recursively unfolding every
structure.  It is reproduced here **in full and unweakened** from the F doc's
audited §1.2.  See §1.5 for the (short) list of what was condensed.

#### Carrier axioms (C)

* **(C1)** $A ⊂ ℝ^2$ is finite and nonempty.
* **(C2)** $A$ is convex-independent.
* **(C3)** $A$ has the K₄ property: $∀ p ∈ A,\; K₄(A, p)$.
* **(C4)** $A$ is not contained in a line.
* **(C5)** $A$ admits at least one surplus-cap packet in the sense of (P1)–(P5)
  below (bundled inside the counterexample datum; need not equal the working
  packet; its only downstream use is $|A| > 4$).
* **(C6)** **Minimality.**  For every finite nonempty convex-independent
  $B ⊂ ℝ^2$ with the K₄ property, $|A| ≤ |B|$.  (Quantifies over *all* such
  planar sets, not subsets of $A$.)
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
  $v_1, v_2, v_3 ∈ A$, pairwise distinct, each on the MEC boundary
  ($|v_i O| = R_0$), with all three angles non-obtuse in inner-product form:
  $⟨v_2 - v_1,\, v_3 - v_1⟩ ≥ 0$, $⟨v_3 - v_2,\, v_1 - v_2⟩ ≥ 0$,
  $⟨v_1 - v_3,\, v_2 - v_3⟩ ≥ 0$.
* **(P3)** **Cap triple (closed-cap convention).**  Finite sets
  $C_1, C_2, C_3 ⊆ A$ with (indices cyclic, cap $C_i$ "opposite" apex $v_i$):
  * $v_i ∉ C_i$ and $v_j, v_k ∈ C_i$ for $\{i,j,k\} = \{1,2,3\}$;
  * every $v ∈ A \setminus \{v_1,v_2,v_3\}$ lies in exactly one cap;
  * **arc membership:** for every $v ∈ A$ and each $i$:
    $v ∈ C_i ⟺ \mathrm{Arc}(v_i; v)$.  In particular
    $C_i = \{v ∈ A : \mathrm{Arc}(v_i; v)\}$ is the trace on $A$ of a closed
    half-plane.  (The half-plane gloss is a one-step derivation added by this
    document — $\mathrm{sa}(v_i, v_j, v_k) ≠ 0$ by (C2) fixes the chord's
    sides — not part of the F doc's (P3) text; it is used as a premise in
    §2.4.)
* **(P4)** **Surplus designation.**  An index $σ ∈ \{1,2,3\}$ with
  $|C_σ| > 4$.  Write $m := C_σ$ (the surplus cap).
* **(P5)** **Naming.**  Let $(i_1, i_2)$ be the other two indices in cyclic
  order after $σ$: $σ=1 ⇒ (i_1,i_2) = (2,3)$; $σ=2 ⇒ (3,1)$; $σ=3 ⇒ (1,2)$.
  Define $a_0 := v_σ$ (surplus apex), $a_1 := v_{i_1}$ (first opposite apex),
  $a_2 := v_{i_2}$ (second opposite apex); and the opposite caps $C_{i_1}$
  (first) and $C_{i_2}$ (second).  The **strict cap interior** is
  $C_i^{\circ} := C_i \setminus \{v_j, v_k\}$ ($j,k ≠ i$).  In particular
  $C_{i_1}^{\circ} = C_{i_1}\setminus\{a_0, a_2\}$ and $a_1 ∉ C_{i_1}$.

  Derived (proven in-project, listed for orientation, not hypotheses): the
  cap-sum identity $|C_1| + |C_2| + |C_3| = |A| + 3$; $a_1 ∈ C_σ ∩ C_{i_2}$;
  each Moser vertex lies in exactly the two caps it bounds.

#### Critical shell (blocker) system (H)

* **(H1)** For every $x ∈ A$ there are given: a **blocker center**
  $c(x) ∈ A \setminus \{x\}$, a **shell radius** $r(x) > 0$, and the **exact
  shell** $K(x) := S_{c(x)}(r(x)) = \{z ∈ A : |c(x)\,z| = r(x)\}$, such that
  $|K(x)| = 4$ and $x ∈ K(x)$.  ($K(x)$ is the *entire* radius class of $A$ at
  that center and radius, not a selected 4-subset.)
* **(H2)** **Criticality.**  For every $x ∈ A$: $¬K₄(A \setminus \{x\},\, c(x))$;
  explicitly, for every $\varrho > 0$,
  $|\{z ∈ A\setminus\{x\} : |c(x)\,z| = \varrho\}| ≤ 3$.

#### Two frontier instances (Q★, R★), one for each radius ★ ∈ {r, ρ}

Fixed reals $r$ and $ρ$ (the two frontier radii; positivity is derivable, (D0)).
For **each** ★ ∈ {r, ρ} the following data are given (two independent copies;
write $q_★, w_★$ for the survivor pair of the instance at radius ★):

* **(Q1)** $q_★, w_★ ∈ A$, $q_★ ≠ w_★$.
* **(Q2)** $q_★, w_★ ∈ S_{a_1}(★) \setminus m$.
* **(Q3)** $K₄(A\setminus\{q_★\},\, a_2)$ and $K₄(A\setminus\{w_★\},\, a_2)$.
* **(Q4)** $c(q_★) ≠ a_2$ and $c(w_★) ≠ a_2$.
* **(Q5)** **First-apex split.**  $K₄(A\setminus\{q_★, w_★\},\, a_1)$, or else
  both: $|S_{a_1}(★)| ∈ \{4, 5\}$ and every $ρ' > 0$ with $|S_{a_1}(ρ')| ≥ 4$
  satisfies $ρ' = ★$.  (Given (X5)–(X7) below the second disjunct is false for
  both instances, so (Q5) is equivalent to (R2).)
* **(Q6)** $K₄(A\setminus\{q_★, w_★\},\, a_2)$.
* **(Q7)** **Second-apex split.**  $K₄(A\setminus\{q_★, w_★\},\, a_2)$, or else
  there exist two exact shells at center $a_2$: full radius classes
  $S_{a_2}(|a_2 q_★|)$ and $S_{a_2}(|a_2 w_★|)$, each of cardinality exactly
  $4$, with positive radii, containing $q_★$ resp. $w_★$, and disjoint from
  each other.
* **(R1)** $4 ≤ |S_{a_1}(★)|$.
* **(R2)** $K₄(A\setminus\{q_★, w_★\},\, a_1)$.
* **(R3)** $\mathrm{Packet}(q_★;\, a_1, a_2)$ (§1.1; in particular $a_1 ≠ a_2$,
  $c(q_★) ∉ \{a_1, a_2\}$, and the two 4-point rows with overlap $≤ 2$).

#### The two exact collision rows (X)

* **(X1)** $s_1, s_2 ∈ A$ with $s_1 ≠ s_2$; and $t_1, t_2 ∈ A$ with
  $t_1 ≠ t_2$.
* **(X2)** $s_1, s_2 ∈ S_{a_1}(r)$ and $t_1, t_2 ∈ S_{a_1}(ρ)$.
* **(X3)** $s_1, s_2, t_1, t_2 ∈ C_{i_1}^{\circ}$.
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
  $\mathrm{Rich}(p) :⟺ (∃ \varrho > 0:\ |S_p(\varrho)| ≥ 6)$ or
  $(∃\, \varrho_1 ≠ \varrho_2 > 0:\ |S_p(\varrho_1)| ≥ 4 \text{ and } |S_p(\varrho_2)| ≥ 4)$.
  $\mathrm{NR} := \{p ∈ A : ¬\mathrm{Robust}(p)\}$.
* **(T1)** $\mathrm{Robust}(a_2)$.
* **(T2)** $|C_{i_1}| ≥ 6$ and $|C_{i_2}| ≥ 6$.
* **(T3)** $|m| ≥ 6$.  (With (T2) and the cap-sum identity: $|A| ≥ 15$.)
* **(T4)** $\mathrm{Rich}(a_1)$, $\mathrm{Rich}(a_2)$, $\mathrm{Rich}(a_0)$.
* **(T5)** $|A| ≤ 4\,|\mathrm{NR}|$.
* **(T6)** For every $p ∈ A$ and every $\varrho > 0$, not all of
  $v_1, v_2, v_3$ lie in $S_p(\varrho)$.

#### Unique-four cover of the blocker range (U)

* **(U1)** For every $x ∈ A$: $c(x) ≠ x$; $c(x)$ is a **unique-four center**:
  $c(x) ∈ A$, $|S_{c(x)}(r(x))| = 4$, and every $\varrho > 0$ with
  $|S_{c(x)}(\varrho)| ≥ 4$ satisfies $\varrho = r(x)$; the four-point class
  selected at $c(x)$ is $K(x)$.

  Net new content: **at each blocker center the shell radius is the only radius
  carrying ≥ 4 carrier points.**

#### The mutual-omission two-cycles (M)

* **(M1)** $t_1 ∉ K(s_1)$, and $\mathrm{Packet}(t_1;\, a_1, b)$.
* **(M2)** There is a chosen $u ∈ \{s_1, s_2\}$ with $u ∉ K(t_1)$, together
  with $\mathrm{Packet}(u;\, a_1, b')$.
* **(M3)** $s_1 ∉ K(t_1)$, and $\mathrm{Packet}(s_1;\, a_1, b')$.
* **(M4)** There is a chosen $u' ∈ \{t_1, t_2\}$ with $u' ∉ K(s_1)$, together
  with $\mathrm{Packet}(u';\, a_1, b)$.

  The designated $u, u'$ are fixed but **unknown** elements of their pairs: a
  proof may not assume $u = s_1$ or $u' = t_1$.

### 1.3 Established derived facts (proven in-project, kernel-checked; usable as background)

* **(D0)** $r > 0$ and $ρ > 0$.
* **(D1)** **Cross-deletion criterion.**  For all $x ∈ A$ and $w ∈ ℝ^2$:
  $K₄(A\setminus\{w\},\, c(x)) ⟺ w ∉ K(x)$.
* **(D2)** **Support locking.**  Any 4-point set $B ⊆ A$ on a common circle of
  positive radius about $c(x)$ (center not in $B$) equals $K(x)$.
* **(D3)** **Equal blockers ⇒ equal shells.**  If $c(x) = c(y)$ then
  $K(x) = K(y)$; hence $K(s_1) = K(s_2)$, $K(t_1) = K(t_2)$, and
  $s_2 ∈ K(s_1)$, $t_2 ∈ K(t_1)$.
* **(D4)** **Exact cap trace of the collision shells.**
  $K(s_1) ∩ C_{i_1} = \{s_1, s_2\}$ and $K(t_1) ∩ C_{i_1} = \{t_1, t_2\}$
  (**closed** cap), hence
  $|K(s_1) \setminus C_{i_1}| = |K(t_1) \setminus C_{i_1}| = 2$.
* **(D5)** **Blockers sit inside the cap.**  $b ∈ C_{i_1}^{\circ}$ and
  $b' ∈ C_{i_1}^{\circ}$.
* **(D6)** $\mathrm{Robust}(a_1)$; and $\mathrm{Rich}(p) ⇒ \mathrm{Robust}(p)$,
  so (T4) gives $\mathrm{Robust}(a_0)$, $\mathrm{Robust}(a_2)$ as well.
* **(D7)** **Robust points are never blocker values.**  A robust center is not
  a unique-four center; with (U1), $c(x) ∉ \{a_0, a_1, a_2\}$ for every $x ∈ A$.
* **(D8)** **Cap two-point row bound.**  For any center $z ∈ C_i$ (closed cap,
  any $i$) and any 4-point set $B ⊆ A$ on a common positive-radius circle about
  $z$ with $z ∉ B$: $|B ∩ C_i| ≤ 2$.  (Uses (C2).)
* **(D9)** **Off-cap pair has at most one cap bisector point.**  If
  $c ≠ d ∈ C_i$ (closed cap) and $a ≠ b ∈ A$ with $a, b ∉ C_i$, then not both
  $|ca| = |cb|$ and $|da| = |db|$.  (Uses (C2).)  *This is the terminal of
  Bridge 2, not of this document.*
* **(D10)** **Minimality cover.**  From (C6): every $x ∈ A$ lies in the unique
  four-point class of some unique-four center; quantitatively $|A| ≤ 4|U|$
  where $U$ is the set of unique-four centers, and (T5) restates this with
  $U ⊆ \mathrm{NR}$.
* **(D11)** **Two-circle bound.**  Two circles with distinct (center, radius)
  pairs share at most two points; hence $|K(x) ∩ K(y)| ≤ 2$ whenever
  $(c(x), r(x)) ≠ (c(y), r(y))$, and $|K(x) ∩ S_p(\varrho)| ≤ 2$ whenever
  $(c(x), r(x)) ≠ (p, \varrho)$.
* **(D12)** **Explicit four-point row (F3 context).**  Under (F3a) below:
  $K(s_1) = \{s_1, s_2, e, o\}$ — kernel-checked
  (`firstFiber_shell_eq_explicitFour`, Appendix B).  Symmetrically under
  (F4b): $K(t_1) = \{t_1, t_2, e, o\}$ — **the symmetric half has no in-tree
  declaration**; it follows by the identical two-rewrite calc from the
  kernel-checked generic parts (disclosure inherited from the F doc).
* **(D13)** **Deletion-survival reduction of packets.**  By (D1),
  $\mathrm{Packet}(x; a_1, z)$ with $z = c(y)$ contains the information
  $x ∉ K(y)$, and conversely $x ∉ K(y)$ plus $\mathrm{Robust}(a_1)$
  reconstructs such a packet.  In particular (M1)–(M4) reduce modulo $Γ$ to:
  $t_1 ∉ K(s_1)$, $s_1 ∉ K(t_1)$, $∃ u ∈ \{s_1,s_2\}: u ∉ K(t_1)$,
  $∃ u' ∈ \{t_1,t_2\}: u' ∉ K(s_1)$.
* **(D14)** **Perpendicular-bisector bound in convex position.**  For a
  convex-independent finite $A$ and distinct $a, b ∈ A$:
  $$|\{\,p ∈ A : |pa| = |pb|\,\}| ≤ 2 .$$
  (`Problem97.Dumitrescu.perpBisector_apex_bound`, P97/Dumitrescu/L1.lean:128.
  Kernel-checked; it is the engine of target T1 below.  It was not listed in
  the F doc's (D0)–(D13); it is added here because Bridge 1 turns on it.)

### 1.4 Interface assumptions

* The MEC $(O, R_0)$ of (P1) is given exact data satisfying the stated
  enclosing/minimality/uniqueness properties; nothing else about the MEC is
  assumed.
* The ordered-cap machinery behind (D8)/(D9) is used only through those two
  stated consequences.
* Global minimality (C6) and no-$(m,4,4)$ (C7) are stated exactly above and are
  *not* further unfolded; they are the only hypotheses quantifying over objects
  outside the fixed configuration.

### 1.5 What was condensed relative to the F doc's §1.2

$Γ$ above is hypothesis-complete: no item of the F doc's $Γ$ was dropped or
weakened.  Two purely editorial condensations were made, both of commentary
rather than content:

1. The F doc annotated many items "(redundant: …)".  Those annotations were
   removed.  In particular (M1)–(M4) are stated by their **net new content**
   only (the F doc's own reading, and its (D13)); the redundant conjuncts
   $t_1 ∈ C_{i_1}^\circ$, $t_1 ∉ \{s_1,s_2\}$, $c(u) = b$, $b ≠ c(t_1)$, etc.
   are all already implied by (X3), (X4), (X10), (X11), (D3).
2. The parenthetical derivations attached to (Q5), (Q7), (R1) were shortened.
   The disjunctions themselves are reproduced in full; every arm must still be
   handled by a Branch-A proof and satisfied by a Branch-B certificate.

Nothing relevant to Bridge 1 was condensed.  In particular (C6), (C7), (U1),
(T5), (T6), (X6)–(X9) and both frontier instances appear at full strength.

---

## §2 Exact target statement

### 2.0 The bridge in one sentence

Produce, from $Γ$ (optionally plus a leaf supplement; see §2.5), a
**source-clean derivation of one of the three existential statements T1, T2, T3
below**.  Each of the three is the exact hypothesis package of an
already-proved terminal in the repository; each such terminal concludes
`False`.  Consequently a derivation $Γ ⊢ \mathrm{T}k$ is a complete proof of
$Γ ⊢ ⊥$ and closes every leaf whose supplement was used (§2.5).

**Read this before starting.**  Because each terminal proves `False` from its
package, each package is *unsatisfiable* in any convex-independent carrier.
Two consequences, both load-bearing:

* You cannot certify a target by exhibiting a configuration realizing it.  The
  deliverable is a **derivation**, not a construction.
* The three targets are not "easier subgoals"; they are three *named shapes* of
  contradiction.  Their value is that each names exactly which positive
  incidences must be forced, and the repository already owns the terminal that
  consumes them.  A route that replaces a target by yet another unproved
  statement of comparable strength is not progress (§5).

Throughout §2 the *first* collision row is $(s_1, s_2)$ at frontier radius $r$
with common blocker $b$; the *second* is $(t_1, t_2)$ at radius $ρ$ with common
blocker $b'$.  Every target has a mirror form obtained by swapping
$(s_i, b, r) ↔ (t_i, b', ρ)$; deriving either form suffices, and both must be
reported separately if both are obtained.

### 2.1 A $Γ$-consequence used by two of the three targets

**Fact (E1) — exact bisector census of a collision pair.**
$$\{\,p ∈ A : |p\,s_1| = |p\,s_2|\,\} = \{a_1,\ b\},\qquad
  \{\,p ∈ A : |p\,t_1| = |p\,t_2|\,\} = \{a_1,\ b'\}.$$

*Proof.*  By (X2), $|a_1 s_1| = |a_1 s_2| = r$.  By (X4) and (H1),
$s_1, s_2 ∈ K(s_1) = S_b(r(s_1))$, so $|b s_1| = |b s_2| = r(s_1)$.  By (D6)
$a_1$ is robust, and by (D7) a robust point is never a blocker value, so
$b ≠ a_1$.  Thus $\{a_1, b\}$ are two distinct members of the set; (D14) with
$a := s_1$, $b := s_2$ (distinct by (X1)) caps the set at two.  Same for the
second row using (X11)-independent data. $\square$

Status: derived in this document from kernel-checked ingredients; it is **not**
a named in-tree declaration.  Its ingredients ((D14), (X1), (X2), (X4), (H1),
(D6), (D7)) are all kernel-checked.

### 2.2 Target T1 — both sources of one collision inside one genuinely distinct actual row

Consumer: `Problem97.ATailRetainedCollisionCapLocalization.false_of_distinct_actualRow_contains_collisionSources`
(`lean/Erdos9796Proof/P97/ATail/RetainedCollisionCapLocalization.lean:246`).

**Full unfolded hypothesis list.**  Write $(y_1, y_2)$ for a collision pair and
$β$ for its common blocker; the intended instantiation is
$(y_1, y_2, β, \varrho) := (s_1, s_2, b, r)$ or $(t_1, t_2, b', ρ)$.

* **(T1-a)** $y_1, y_2 ∈ A$ and $y_1 ≠ y_2$.
* **(T1-b)** $y_1, y_2 ∈ S_{a_1}(\varrho)$, i.e. $|a_1 y_1| = |a_1 y_2| = \varrho$,
  where $\varrho$ is the frontier radius of that instance.
* **(T1-c)** $c(y_1) = c(y_2) = β$.
* **(T1-d)** $β ∈ A$ and $β ≠ a_1$.
* **(T1-e)** $K(y_1) = K(y_2)$; $|K(y_1)| = 4$; $y_1 ∈ K(y_1)$ and
  $y_2 ∈ K(y_1)$.  (The Lean structure carries two further fields,
  `radii_eq` and `sources_ne`; both are Γ-derivable — (D3) and (X1) — so
  they add no missing content.)
* **(T1-f)** $¬K₄(A\setminus\{y_1\}, β)$ and $¬K₄(A\setminus\{y_2\}, β)$.
* **(T1-g)** $\mathrm{Robust}(a_1)$.
* **(T1-h)** $x ∈ A$.
* **(T1-i)** $c(x) ≠ β$.
* **(T1-j)** $y_1 ∈ K(x)$.
* **(T1-k)** $y_2 ∈ K(x)$.

(T1-a)–(T1-g) are supplied by $Γ$ verbatim: (X1), (X2), (X4), (D7)+(D6),
(D3)+(H1), (H2), (D6).  **The entire missing content is (T1-h)–(T1-k):**
$$\boxed{\ ∃\, x ∈ A:\quad c(x) ≠ b \ \wedge\ s_1 ∈ K(x) \ \wedge\ s_2 ∈ K(x)\ }$$
(or the mirror with $t_1, t_2, b'$).  By (D1) this is equivalent to
$$∃\, x ∈ A:\quad c(x) ≠ b,\quad ¬K₄(A\setminus\{s_1\},\, c(x)),\quad ¬K₄(A\setminus\{s_2\},\, c(x)).$$

**Terminal mechanism.**  Given (T1-h)–(T1-k), the point $c(x)$ is equidistant
from $y_1$ and $y_2$ (both lie on the circle $K(x)$ about $c(x)$); so are $a_1$
(by (T1-b)) and $β$ (by (T1-e)).  These three are pairwise distinct: $β ≠ a_1$
by (T1-d); $c(x) ≠ β$ by (T1-i); $c(x) ≠ a_1$ by (D7).  That is three carrier
points on the perpendicular bisector of $\{y_1,y_2\}$, contradicting (D14).
This is verbatim the terminal's proof (RetainedCollisionCapLocalization.lean:
177–242, then :246).

**Rider (unsatisfiability, and what it means).**  By (E1) — derived from the
Γ items (X2), (X4), (H1), (D6), (D7) together with (D14), not from convex
independence alone — no such $x$ exists under $Γ$.  Hence T1 admits no realizing configuration:
the only way to obtain it is a derivation from $Γ$, which is simultaneously the
proof of $Γ ⊢ ⊥$.  Any argument that appears to *construct* such an $x$ from
local metric data contains an error; find it before reporting.

**Rider (what "genuinely distinct" costs).**  The condition $c(x) ≠ b$ cannot be
dropped: if $c(x) = b$ then $K(x) = K(s_1)$ by (D3) and (T1-j)/(T1-k) hold
trivially, so the package degenerates.  A candidate producer must therefore
exhibit a *third* blocker center whose exact shell swallows both collision
sources — not merely some row containing them.

### 2.3 Target T2 — two distinct vertices in both selected rows, in increasing cyclic order

Consumer: `Problem97.CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`
(`lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean:427`).

**Full unfolded hypothesis list.**

* **(T2-a)** $A$ is convex-independent.  [This is (C2).]
* **(T2-b)** A ccw enumeration $φ$ of $A$ in the sense of §1.1 ($φ$ injective,
  image $A$, and $φ(i),φ(j),φ(k)$ counterclockwise whenever $i<j<k$).
* **(T2-c)** Indices $i_1 < i_2 < i_3 < i_4$; write $p_j := φ(i_j)$.  (The four
  $p_j$ are automatically pairwise distinct.)
* **(T2-d)** A set $B_1 ⊆ A$ and a real $\varrho_1 > 0$ with $|B_1| = 4$,
  $|p_1 z| = \varrho_1$ for every $z ∈ B_1$, and $p_1 ∉ B_1$.
* **(T2-e)** A set $B_2 ⊆ A$ and a real $\varrho_2 > 0$ with $|B_2| = 4$,
  $|p_2 z| = \varrho_2$ for every $z ∈ B_2$, and $p_2 ∉ B_2$.
* **(T2-f)** $p_3 ∈ B_1$ and $p_4 ∈ B_1$.
* **(T2-g)** $p_3 ∈ B_2$ and $p_4 ∈ B_2$.

$B_1, B_2$ are **arbitrary** four-point equal-radius classes: they need not be
full radius classes, need not be shells $K(\cdot)$, and their centers need not
be blocker values.  This is the weakest of the three packages in that respect.

**Terminal mechanism.**  (T2-d)+(T2-f) give $|p_1p_3| = |p_1p_4|$;
(T2-e)+(T2-g) give $|p_2p_3| = |p_2p_4|$.  The strict Kalmanson inequality for
four increasing vertices of a strictly convex ccw boundary
(`dist_add_dist_lt_diagonal_sum_of_ccw`, CapCrossingKalmanson.lean:240) reads
$$|p_2p_3| + |p_1p_4| \;<\; |p_1p_3| + |p_2p_4| ,$$
and substituting the two equalities turns it into $X < X$.

**Rider (the order is the whole content).**  Only the two distance equalities are
used; the four-point classes are pure packaging.  By (D14) applied to the pair
$\{p_3,p_4\}$, the centers $p_1,p_2$ exhaust $\{p : |pp_3| = |pp_4|\}$.  So T2
asks precisely for a **non-alternating** placement of a bisector pair relative
to the pair it bisects.  Round 1 established that the realizable placement is
the alternating one $p_1, p_3, p_2, p_4$ (see §6 (B6)); therefore T2, like T1,
is unsatisfiable and can only be obtained by derivation.  Any argument whose
output is "the order is alternating" is a refutation of that route, not
progress.

**Rider (the cut is free).**  A cyclic shift of a ccw enumeration is again a ccw
enumeration (`isCcwConvexPolygon_cyclicShift`,
`lean/Erdos9796Proof/P97/ConvexCyclicOrder/Basic.lean:196`), so (T2-c) is a
condition on the *cyclic* order of $p_1p_2p_3p_4$ only.

### 2.4 Target T3 — fresh selected row, positive cross membership, prescribed six-point order

Consumers: `Problem97.ATailRetainedCollisionDifferentPairConsumer.OrderedDifferentPairCrossHit.false`
(`lean/Erdos9796Proof/P97/ATail/RetainedCollisionDifferentPairConsumer.lean:157`)
and its sibling `AlternateOrderedDifferentPairCrossHit.false` (:258), which
consumes the same incidence data under the second admissible cyclic order.
**Module status:** that file is marked `COMPAT-ONLY/BANK` and currently has
zero importers in the tree; it is source-proved but off-spine.  See §2.6.

**Full unfolded hypothesis list.**  Let $(C, K)$ be the two sources of one
collision row in either order — $(C,K) ∈ \{(s_1,s_2), (s_2,s_1)\}$, or the
mirror $\{(t_1,t_2),(t_2,t_1)\}$ — and let $β$ be that row's common blocker.

* **(T3-a)** [collision data] $C, K ∈ A$, $C ≠ K$, $c(C) = c(K) = β$,
  $β ∈ A$, $β ≠ a_1$, $K(C) = K(K)$, $|K(C)| = 4$, $C ∈ K(C)$, $K ∈ K(C)$,
  $¬K₄(A\setminus\{C\}, β)$, $¬K₄(A\setminus\{K\}, β)$, and $C, K ∈ S_{a_1}(r)$
  (resp. $S_{a_1}(ρ)$), and $\mathrm{Robust}(a_1)$.
* **(T3-b)** [apex row] A set $B_0 ⊆ A$ and a real $\varrho_0 > 0$ with
  $|B_0| = 4$, $|a_1 z| = \varrho_0$ for every $z ∈ B_0$, $a_1 ∉ B_0$, and
  $C ∈ B_0$.
* **(T3-c)** [fresh row point] $J ∈ B_0$ with $J ≠ C$, $J ≠ K$; and $J ∈ A$.
* **(T3-d)** [**the positive cross membership**] $K ∈ K(J)$.
* **(T3-e)** [enumeration] A ccw enumeration $φ$ of $A$ as in §1.1.
* **(T3-f)** [six-point order] Indices with
  $$i_O < i_J < i_C < i_A < i_X < i_K$$
  and $φ(i_O) = a_1$, $φ(i_J) = J$, $φ(i_C) = C$, $φ(i_A) = β$,
  $φ(i_X) = c(J)$, $φ(i_K) = K$.
* **(T3-f′)** [alternate admissible order — the sibling terminal] the same six
  labels with
  $$i_O < i_C < i_J < i_X < i_A < i_K,$$
  i.e. $φ(i_O) = a_1$, $φ(i_C) = C$, $φ(i_J) = J$, $φ(i_X) = c(J)$,
  $φ(i_A) = β$, $φ(i_K) = K$.

Either (T3-f) or (T3-f′) suffices; the other fields are shared.

**Terminal mechanism, order (T3-f).**  From (T3-b)+(T3-c), $|a_1 J| = |a_1 C|$.
The complementary strict Kalmanson inequality
(`complementary_dist_add_dist_lt_diagonal_sum_of_ccw`,
CapCrossingKalmanson.lean:273) applied at $(i_O, i_J, i_C, i_A)$ reads
$|a_1J| + |Cβ| < |a_1C| + |Jβ|$, hence $|βC| < |βJ|$.  From (T3-d) and
$J ∈ K(J)$ (by (H1)) we get $|c(J)\,J| = |c(J)\,K|$; from (T3-a) we get
$|βC| = |βK|$.  The same inequality applied at $(i_J, i_A, i_X, i_K)$ reads
$|Jβ| + |c(J)K| < |J\,c(J)| + |βK|$, which after both substitutions collapses
to $|βJ| < |βC|$.  Contradiction.

**Terminal mechanism, order (T3-f′).**  Kalmanson at $(i_O,i_C,i_J,i_X)$ with
$|a_1J| = |a_1C|$ gives $|J\,c(J)| < |C\,c(J)|$; Kalmanson at
$(i_C,i_X,i_A,i_K)$ with $|c(J)K| = |c(J)J|$ and $|βK| = |βC|$ gives
$|C\,c(J)| < |c(J)\,J|$.  Contradiction.

**Rider (what $Γ$ already supplies).**  Take $B_0 := S_{a_1}(r)$.  By (X6)
$|B_0| = 4$; by (X2) $s_1, s_2 ∈ B_0$; by (D0) the radius is positive and
$a_1 ∉ B_0$.  So (T3-b) is free with $C ∈ \{s_1,s_2\}$.  By (X8),
$B_0 ∩ C_{i_1}^{\circ} = \{s_1,s_2\}$, so the two remaining members
$J_1, J_2$ of $B_0$ lie **outside** $C_{i_1}^{\circ}$ and either can serve as
$J$ in (T3-c) — automatically $J ≠ C$ and $J ≠ K$.  By (D7), $c(J) ≠ a_1$.
**Only (T3-d) and the order (T3-f)/(T3-f′) are missing.**

**Rider (the order silently forces $c(J) ≠ β$).**  In (T3-f), $φ(i_A) = β$ and
$φ(i_X) = c(J)$ with $i_A ≠ i_X$; $φ$ is injective, so $c(J) ≠ β$.  This is not
decoration: if $c(J) = β$ then $K(J) = K(C)$ by (D3) and (T3-d) holds for free,
because $K ∈ K(C)$.  So the genuine content of T3 is
$$\boxed{\ ∃\, J ∈ S_{a_1}(r)\setminus\{s_1,s_2\}:\quad c(J) ∉ \{a_1, b\}
  \ \wedge\ K ∈ K(J)\ \wedge\ \text{(T3-f) or (T3-f′)}\ }$$
for one of the two choices of $(C,K)$ from $\{s_1,s_2\}$ (or the mirror row).

**Rider (order-forced cap placement; derived in this document).**  Under (T3-f):
$C, β, K ∈ C_{i_1}^{\circ}$ by (X3) and (D5), and $a_1 ∉ C_{i_1}$ by (P5).  By
(P3), $C_{i_1}$ is the trace on $A$ of a closed half-plane, so in convex
position it is a contiguous arc of the hull cycle.  The three cap points
$C, β, K$ occur at increasing indices $i_C < i_A < i_K$ while $a_1 ∉ C_{i_1}$
occurs at $i_O < i_C$, so the cap arc is the index-increasing path from $C$ to
$K$, not the complementary wrap-around path.  Hence every point at an index
strictly between $i_C$ and $i_K$ lies in $C_{i_1}$; in particular
$c(J) ∈ C_{i_1}$, and by (D7) $c(J) ∉ \{a_0,a_2\}$, so
$$c(J) ∈ C_{i_1}^{\circ}.$$
The same argument under (T3-f′) puts $J$ itself at an index strictly between
$i_C$ and $i_K$, hence $J ∈ C_{i_1}$; but $J ∉ C_{i_1}^{\circ}$ by (X8), so
$$J ∈ \{a_0, a_2\}\quad\text{(alternate order only).}$$
(Both narrowings are contingent on taking $B_0 = S_{a_1}(r)$ for the (T3-b)
class; (T3-b) itself admits *any* `SelectedFourClass D.A S.oppApex1`, and a
producer using a different class escapes them.)
These two consequences are narrowings a producer must respect (or contradict —
contradicting one of them *from $Γ$* eliminates that order arm outright, which
is itself a legitimate partial deliverable to report).  Status: derived in this
document with the proofs just given; not kernel-checked.

**Rider (T3 is the only target not governed by bisector counting).**  T1 and T2
both bottom out in (D14) — "at most two carrier points bisect a carrier pair".
So does Bridge 2's package (4) via (D9).  T3 instead uses three *different*
bisecting relations ($a_1$ bisects $\{J,C\}$ and $\{C,K\}$; $β$ bisects
$\{C,K\}$; $c(J)$ bisects $\{J,K\}$) and derives its contradiction from the
convex order, not from a bisector count.  T3 is therefore the target whose
missing content is a genuinely new incidence rather than a third collinear
point.  Allocate accordingly, but do not abandon T1/T2 (§7).

### 2.5 Admissible hypothesis variants, and what each closes

A producer may assume $Γ$ alone, or $Γ$ plus one leaf supplement.  State
explicitly which variant your derivation uses.

* **Variant A0 — $Γ$ alone.**  Closes all four leaves F1, F2, F3, F4.
* **Variant A1 — $Γ$ plus (F1a).**  Closes F1.
  * **(F1a)** $b = t_1$ or $b = t_2$ or $b' = s_1$ or $b' = s_2$.
    All four arms must be handled.
* **Variant A2 — $Γ$ plus (F2a) and (F2b).**  Closes F2, F3 and F4
  simultaneously, because F3's supplement (F3b) and F4's supplement (F4a) are
  both literally (F2a) ∧ (F2b).
  * **(F2a)** $|C_{i_1}| ≥ 8$.
  * **(F2b)** There exists $g ∈ A$ with: (1) $g ∈ C_{i_1}^{\circ}$;
    (2) $g ∉ \{s_1,s_2,t_1,t_2\}$; (3) $c(g) ≠ b$; (4) $c(g) ≠ b'$;
    (5) $c(g) ≠ a_1$; (6) $c(g) ≠ a_2$; (7) $g ∈ K(g)$ and $|K(g)| = 4$;
    (8) $s_1 ∉ K(g)$ or $s_2 ∉ K(g)$; (9) $t_1 ∉ K(g)$ or $t_2 ∉ K(g)$.
    Items (5)–(6) are redundant by (D7); (7) by (H1).  Both disjunctions (8)
    and (9) must be handled in full.
* **Variant A3 — $Γ$ plus (F2a), (F2b) and (F2c).**  Closes F2 only.
  * **(F2c)** There exist $x, y ∈ A$ with $x ≠ y$; $c(x) = c(y)$ (a *third*
    blocker collision); $c(x) ≠ b$ and $c(x) ≠ b'$;
    $x, y ∉ \{s_1,s_2,t_1,t_2\}$ (eight inequalities); $x ∈ K(y)$ and
    $y ∈ K(x)$.
* **Variant A4 — $Γ$ plus (F3a).**  Closes F3 (with (F3b) also available if
  wanted, i.e. together with Variant A2's data).
  * **(F3a)** There exist $e, o$ with: $e ∈ A$, $e ∉ \{s_1,s_2,t_1,t_2\}$;
    $c(e) = b$; $e ∈ K(s_1)$; $e ∉ C_{i_1}$ (closed cap); $o ∈ A$, $o ≠ e$,
    $o ≠ t_1$, $o ≠ t_2$; $o ∈ K(s_1)$; $o ∉ C_{i_1}$; and
    $K(s_1)\setminus C_{i_1} = \{e, o\}$.  With (D4) this gives (D12).
* **Variant A5 — $Γ$ plus (F4b).**  Closes F4.
  * **(F4b)** The mirror of (F3a) for the second fiber: there exist $e, o$ with
    $e ∈ A$, $e ∉ \{s_1,s_2,t_1,t_2\}$; $c(e) = b'$; $e ∈ K(t_1)$;
    $e ∉ C_{i_1}$ (closed cap); $o ∈ A$, $o ≠ e$, $o ≠ s_1$, $o ≠ s_2$;
    $o ∈ K(t_1)$; $o ∉ C_{i_1}$; and $K(t_1)\setminus C_{i_1} = \{e,o\}$.
    With (D4) this gives $K(t_1) = \{t_1,t_2,e,o\}$.

Variants are ordered by value: A0 ≻ A2 ≻ {A1, A3, A4, A5}.  A producer under a
weaker variant is strictly better; do not add a supplement you do not use.

### 2.6 Formalization interface (not mathematical content)

Two interface facts about how a produced package is consumed in Lean.  Neither
is a mathematical gap; both must be reported if a producer is written.

1. The consumers of T1 and T3 are stated against
   `RetainedRadiusCollision`, whereas $Γ$ carries
   `RetainedInteriorBlockerCollision`.  An adapter exists —
   `retainedRadiusCollisionOfInteriorCollision`,
   `lean/Erdos9796Proof/P97/ATail/LocalizedCollisionMutualOmissionCycle.lean:43`
   — but it is `private` to its file.  Mathematically the translation is exact:
   every field of `RetainedRadiusCollision` is $Γ$-data ((X1)–(X4), (X2),
   (H1)–(H2), (D3), (D6), (D7)).  A new module must re-expose or re-prove the
   adapter.
2. T3's consumer module `ATail/RetainedCollisionDifferentPairConsumer.lean` is
   marked `COMPAT-ONLY/BANK` and has zero importers; it is source-proved but
   off the publish spine.  T1's module
   (`ATail/RetainedCollisionCapLocalization.lean`) and T2's module
   (`ATail/CapCrossingKalmanson.lean`) are on the spine.  A T3 producer must
   also state the import promotion.

### 2.7 Explicitly out of scope

Package (4) of the round-1 census — "a common two-point pair outside a cap,
consumed by `outsidePair_unique_capCenter` (D9)" — belongs to the companion
Bridge-2 prompt `docs/solve-prompts/2026-07-27-f-bridge-second-cap-center.md`.
Do not develop it here.  If a route to T1/T2/T3 passes through a second cap
center for an off-cap pair, say so and hand it to Bridge 2 rather than
absorbing it.

Bridge 3 (a proper convex-independent K₄ subcarrier contradicting (C6)) and
Bridge 4 (an alternative MEC surplus packet satisfying `IsM44`, contradicting
(C7)) are likewise not this document's targets; they have their own round-2
prompts, `docs/solve-prompts/2026-07-27-f-bridge-k4-subcarrier.md` and
`docs/solve-prompts/2026-07-27-f-bridge-m44-repackaging.md`.  They may be *used*
as tools inside a derivation of T1/T2/T3 if that derivation is complete.

---

## §3 Assume-resolvable framing

Assume for purposes of this task that the bridge admits a complete resolution,
but do not assume in advance which direction it takes.  A complete resolution
must establish exactly one of the two statements in §4.  The three targets may
resolve in different directions and are independently valuable; report each
separately.  Neither direction is favored: a rigorous Branch-B certificate is
worth exactly as much as a Branch-A derivation and must be reported as such,
without softening.

---

## §4 Dual-branch success criteria

### Branch A — derivation of a target

For a target $\mathrm{T}k ∈ \{$T1, T2, T3$\}$ and a variant
$\mathrm{A}j ∈ \{$A0,…,A5$\}$: a complete, rigorous proof of $\mathrm{T}k$'s
existential statement from $Γ$ plus variant $\mathrm{A}j$'s supplement — valid
for *every* configuration satisfying those hypotheses, using each hypothesis
only as stated, and formalizable in Lean 4 with mathlib without new axioms.
The in-project facts (D0)–(D14) of §1.3 may be used as established.

The proof must exhibit **every** field of the target's hypothesis list, named:

* for T1: the point $x$, together with proofs of (T1-h)–(T1-k), and the
  identification of which collision row $(y_1,y_2,β)$ is used;
* for T2: the ccw enumeration $φ$, the four indices $i_1<i_2<i_3<i_4$, the two
  four-point classes $B_1, B_2$ with their radii and center-exclusions, and the
  four memberships (T2-f)/(T2-g);
* for T3: the orientation $(C,K)$, the class $B_0$ with $C ∈ B_0$, the point
  $J$, the membership $K ∈ K(J)$, and *one* of the two full six-index orders
  (T3-f)/(T3-f′) with all six labelling equations.

A package missing one field is not a bridge.  In particular: "some point of $A$
lies in both rows" is not (T1-j)+(T1-k); "the two rows meet" is not (T2-f)+
(T2-g); "there is a cross membership somewhere" is not (T3-d) with its order.

The proof must not use additional assumptions such as: general position beyond
(C2); genericity of the radii $r(x)$; symmetric placement of off-cap shell
points; exact cap size $|C_{i_1}| = 8$; boundedness of $|A|$; injectivity of
$x ↦ c(x)$ beyond what (X4)/(X11)/(F2c) state; or any unstated incidence ("no
three named points concyclic", "all shell radii distinct", …).  Where a
disjunctive hypothesis has several arms ((F1a), (F2b) 8–9, (Q5), (Q7)), every
arm must be handled.

Since each target is unsatisfiable, a Branch-A success is simultaneously a
proof of $Γ + \mathrm{A}j ⊢ ⊥$; state that consequence and name the leaves it
closes per §2.5.

### Branch B — exact certificate that the bridge is not a consequence of Γ

One fixed configuration — the carrier $A$ with exact algebraic coordinates
(rational, or elements of an explicitly presented real number field with exact
arithmetic), together with explicit choices of $(O, R_0)$, the Moser triangle
$v_1v_2v_3$, the caps $C_1,C_2,C_3$, the surplus index $σ$, the blocker system
$(c, r, K)$ for **every** carrier point, the two frontier radii $r, ρ$, all
named points ($q_r, w_r, q_ρ, w_ρ, s_1, s_2, t_1, t_2, u, u'$, plus the
variant's $g, x, y, e, o$ as applicable) and all packet rows — satisfying
**every** hypothesis of $Γ$ (and of the variant's supplement, if the claim is
variant-relative), each verified exactly by symbolic algebra, **and** in which
none of T1, T2, T3 is realized.

The last clause is automatic: by §2.2/§2.3/§2.4 each target is unsatisfiable in
any convex-independent carrier, so any exact model of $Γ$ falsifies all three
at once.  **Therefore Branch B here is not weaker than the F doc's Branch B: it
is the same object, a full exact model of $Γ$.**  Do not report a "model where
package T$k$ fails" as a Branch-B result; failure of the packages is free, and
carries no information without the rest of $Γ$.

Scale note (a specification, not a discouragement): the carrier is a finite
convex-independent set with the K₄ property — a full counterexample object for
the enclosing Erdős-97 program — with $|A| ≥ 15$ (and $|A| ≥ 17$ under (F2a),
by the cap-sum identity).  The universally quantified items must be certified
too: (C6) minimality over all smaller planar configurations; (C7) over all
packets on $A$; (U1) over all positive radii at each blocker center; (T5),
(T6); and every negative membership fact in (M1)–(M4).  For radius-quantified
items this is a finite check (only finitely many pairwise distances occur); for
(C6) an exact finite reduction with proof is required.

**Partial local models do not qualify.**  Specifically:

* A configuration realizing the four principal exact circles, the collision
  rows, the cap order and the packet rows, but failing (C3) K₄ at some carrier
  center, is **not** a Branch-B certificate.  The repository's most complete
  such object is the exact rational 15-point model at
  `scratch/full-local-euclidean-model-complete/` (§6 (B7)); it fails (C3) at
  twelve of fifteen centers, admits no `SurplusCapPacket` (its MEC is a
  diameter branch with boundary $\{a,l\}$), admits no critical-shell system,
  and has exactly one deletion-robust center.  It is disqualified.
* Extending such a local model — adding points until more centers acquire K₄
  classes — is *work in progress*, not a certificate, until every clause of $Γ$
  is verified.  Announcing an extension without the full verification belongs
  on the §5 insufficient list.  (The same directory records a finite extension
  lower bound: any finite planar $B ⊇ A_0$ with the K₄ property has
  $|B \setminus A_0| ≥ 6$; that bound is a constraint on extensions, not a
  certificate and not an impossibility proof.)
* A finite/combinatorial incidence model that reproduces the cardinality
  shadow without metric realization (e.g. the 17-point model at
  `scratch/hard-branch-math/FullPacketIncidenceShadow.lean`) is not a
  certificate: it is not a Euclidean configuration at all.

**Quantifier order.**  Branch A treats all $Γ$-data as universally given
(arbitrary), producing the target uniformly; Branch B chooses everything
existentially but must then verify all $Γ$-clauses including their internal
universal quantifiers.

### §4b Sanctioned reformulations (optional)

* **Membership reduction (proved).**  Modulo $Γ$, every K₄-survival hypothesis
  $K₄(A\setminus\{w\}, c(x))$ may be replaced by $w ∉ K(x)$ via (D1), and the
  packets by their §1.1 clause lists.  Exact and already kernel-checked ((D13));
  use freely.  Under this reformulation:
  * T1 becomes: some blocker center other than $b$ is destroyed by deleting
    $s_1$ **and** by deleting $s_2$;
  * T3-d becomes: $¬K₄(A\setminus\{K\},\, c(J))$.
* **Blocker-function formulation.**  (H1)–(H2)+(U1) is equivalent to: a function
  $c : A → A$ with no fixed point, each value carrying exactly one K₄ radius
  whose class has exactly 4 points, with $x ∈ K(x)$.  **Warning:** $c^{-1}(p)$
  need not exhaust $K(x)$, and points of $K(x)$ need not have blocker $p$.  Any
  functional-digraph reformulation must preserve exactly this asymmetry.
* **Cyclic-order formulation for T2/T3.**  Since cyclic shifts preserve ccw
  enumerations, the index conditions (T2-c), (T3-f), (T3-f′) are conditions on
  the cyclic order of the named points around the hull.  Reformulate them as
  cyclic-order statements if convenient; do **not** weaken them to
  "the points are in convex position" or "the order is compatible with the cap".
* **Semialgebraic encoding.**  For a fixed carrier size $n$ and a fixed
  combinatorial type (cap assignment, blocker map, incidence pattern of the
  shells, hull order), each target's hypothesis set is a finite conjunction of
  polynomial equations and inequalities over $ℝ^{2n}$.  Per-pattern work is
  allowed, but: the enumeration of combinatorial types must be proved
  exhaustive; (C6) is *not* semialgebraic in the fixed-$n$ encoding and must be
  handled separately; and a quantifier-elimination or Positivstellensatz
  certificate for one pattern eliminates only that pattern.

---

## §5 Insufficient-progress list

Partial progress does not count unless it implies exactly one of the two
resolutions above for at least one target.  In particular, the following are
insufficient:

* **Producing a package with one hypothesis missing or weakened.**  A T1 without
  (T1-i) ($c(x) ≠ b$); a T2 without the strict index chain $i_1<i_2<i_3<i_4$ or
  with one of the two shared memberships only; a T3 with (T3-d) but without a
  complete six-index order, or with five of the six labelling equations, or
  with an order that is neither (T3-f) nor (T3-f′).  Every field matters.
* **Producing the incidence for a non-named point.**  "Some point of $A$ lies in
  both rows", "there exists a row containing a collision source", "the shells
  intersect" — an existential without the geometric position data the consumer
  needs (which point, which center, which cap, which index) is not a package.
* **Local bisector arguments.**  Round 1 refuted these: the equality arms of
  (F1a) do not create the cross-hits, because a blocker/source equality makes
  the identified foreign source the **center** of that shell (§6 (B1)).  Any
  argument whose only inputs are the equidistance relations $|a_1s_1|=|a_1s_2|$,
  $|a_1t_1|=|a_1t_2|$, $|bs_1|=|bs_2|$, $|b't_1|=|b't_2|$ is refuted by the
  exact six-point rational model of §6 (B5).
* **Convex-order / Kalmanson arguments that conclude "alternating".**  The
  realizable order of a bisector pair against the pair it bisects is the
  alternating one (§6 (B6)); the existing order terminals require a
  non-alternating order.  Re-deriving alternation is a refutation of the route.
* **Circle-intersection counting.**  Two distinct circles meet in at most two
  carrier points, and exact convex models attain two (§6 (B4)).  Counting
  arguments that stop at "$≤ 2$" produce no membership.
* **Blocker-map two-cycles.**  The mutual-omission cycles (M1)–(M4) store
  *omissions*, not memberships (§6 (B3)); no arrangement of two-cycles yields a
  positive shared support point.
* **Unique-four cover counting alone.**  $|A| ≤ 4|\mathrm{NR}|$ is a lower bound
  on the number of non-robust centers, not a contradiction; three
  collision-fiber excesses can exactly account for the three robust apices.
* **Partial model extensions for Branch B.**  Extending the 15-point model, or
  any local model, without reaching **every** clause of $Γ$ — including (C3) at
  every carrier center, a genuine MEC-derived `SurplusCapPacket`, a full
  critical-shell system, three rich/robust apices, (C6), (C7), (U1), (T5),
  (T6), both frontier instances with their packets, and the (M)-cycle data.
* **Certificates verified numerically.**  Floating-point near-configurations
  without exact algebraic verification of every clause.
* **Certificates that satisfy the local geometry but omit a global clause.**
  A configuration failing even one hypothesis of $Γ$ is worthless for Branch B.
* **Conditional results.**  "If additionally no third collision fiber exists,
  then T1"; "assuming $c(J) ∈ C_{i_1}^{\circ}$, then T3" — unless the condition
  is itself proved from $Γ$.
* **Numerical evidence.**  Verification over any fixed range of carrier sizes,
  sampled configurations, or randomized searches, without a general proof or an
  exact certificate.
* **Solver output without a certificate.**  SAT/SMT/Gröbner/interval results
  without a verifiable certificate or kernel-checkable reconstruction, or with
  an unvalidated encoding.  Every encoding must first pass a smoke test against
  a known small instance.
* **Interval-arithmetic exclusion** of a bounded parameter region without a
  proof that the region covers all configurations satisfying the hypotheses.
* **Oriented-matroid consistency** of an incidence pattern without metric
  realization or metric elimination.
* **Proving a target by citing an unproved leaf.**  F1–F4, the parent
  coordinator
  `exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
  (FrontierLiveClosure.lean:7673), or any of its unproved consumers, are not
  available as premises.
* **Redirecting to Bridge 2/3/4 targets.**  Producing package (4) (two distinct
  first-cap centers bisecting one named off-cap pair), a proper convex K₄
  subcarrier, or an `IsM44` packet is out of scope here (§2.7); it may be a
  useful result, but it is not a resolution of *this* document.
* **Modified-configuration results.**  Conclusions for $|S_{a_1}(r)| = 5$; for
  non-convex carriers; for open caps where the hypothesis is a closed cap (or
  conversely); for "some cap" instead of the indexed cap $C_{i_1}$; with $≥ 4$
  where a hypothesis says $= 4$; or treating $K(x)$ as an arbitrary 4-subset of
  a circle rather than the *full* radius class (exactness cuts both ways:
  nothing else of $A$ lies on that circle).
* **Wrong-deletion criticality.**  Citing (H2) after a *different* point's
  deletion, or (U1) at a carrier point that is not a blocker value.
* Finally, and governing all of the above:
  * **reducing the problem to another unproved statement of comparable
    strength** — e.g. "two exact-four rows with distinct blockers meet in at
    most one strict-cap point", "every 8-point cap contains a source whose row
    avoids all four named sources", "the fresh apex-row point's blocker lies in
    the first cap".  A route that ends at an unproved lemma equivalent in
    strength to the original problem is not close to completion.

---

## §6 Allowed background

Standard proved theorems from planar Euclidean geometry, finite combinatorics
and convexity may be used, but they must be stated accurately and applied with
all necessary hypotheses: two distinct circles meet in at most two points; the
perpendicular-bisector characterization of equidistance; basic convex-position
facts; pigeonhole; double counting.  Mathlib's `EuclideanGeometry` and `Finset`
libraries set the formalization baseline.

The in-project facts (D0)–(D14) of §1.3 are established background, each
kernel-checked at the location given in Appendix B.  They mean exactly what
§1.3 states.  In particular (D8)/(D9) are statements about *closed* indexed caps
of the working packet and require (C2); they do **not** extend to arbitrary
subsets of $A$, and (D9) does not bound bisector points of pairs that are not
both outside the cap.

Additionally, the following round-1 results are established and may be used.
Each is stated exactly, with what it does **not** imply.

**(B1) All four F1 equality-arm cross-hits are impossible.**  For each of the
four arms of (F1a), the correspondingly named cross-hit is false:

* if $b = t_1$ then $t_1 ∉ K(s_1)$; if $b = t_2$ then $t_2 ∉ K(s_1)$;
* if $b' = s_1$ then $s_1 ∉ K(t_1)$; if $b' = s_2$ then $s_2 ∉ K(t_1)$.

*Reason:* under the equality the identified foreign source **is the center** of
that shell, and a critical shell of positive radius never contains its own
center (`CriticalFourShell.center_not_mem_support`,
`lean/Erdos9796Proof/P97/U1CarrierInjection.lean:590`).
Source: `scratch/cross-blocker-terminal/CrossBlockerCoincidenceAudit.lean`,
theorems `firstBlocker_eq_secondSource₁_not_mem_firstShell`,
`firstBlocker_eq_secondSource₂_not_mem_firstShell`,
`secondBlocker_eq_firstSource₁_not_mem_secondShell`,
`secondBlocker_eq_firstSource₂_not_mem_secondShell`.  The file contains no
`sorry`, `admit`, `axiom` declarations, or `native_decide` (it does contain
`#print axioms` commands); the accompanying REPORT records
`lake env lean` acceptance on Lean 4.27.0 with axioms
`[propext, Classical.choice, Quot.sound]` only.

*Does not imply:* that no positive cross-shell incidence exists.  It rules out
the **four named** cross-hits between the two collision fibers.  Target T3's
membership $K ∈ K(J)$ is between a collision source and the shell of a *fresh
apex-row point* — a different statement, not covered by (B1).  Nor does (B1)
give any information about $K(g)$, $K(x)$ or $K(y)$ from the F2/F3/F4
supplements.

**(B2) The three-hit arm is impossible.**  There is no $i ∈ \{1,2,3\}$,
$x ∈ A$, and $\varrho ∈ ℝ$ with $\mathrm{Rich}(v_i)$ and
$$3 ≤ \bigl|\,K(x) ∩ \bigl(S_{v_i}(\varrho) ∩ C_i^{\circ}\bigr)\,\bigr| .$$
*Reason:* richness gives deletion robustness, which separates the shell's
blocker center from the apex; then the two-circle bound caps the intersection at
two.  Sources: `scratch/hard-branch-math/NoThreeHit.lean`
(`not_exists_canonical_three_hit_at_rich_apex`), on top of
`criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich`
(`lean/Erdos9796Proof/P97/ATail/ApexRichClassStructure.lean:129`).

*Does not imply:* that $|K(x) ∩ S_{v_i}(\varrho) ∩ C_i^\circ| ≤ 1$, nor anything
about intersections with the closed cap, nor anything about shells centered at
non-rich points.  The bound is exactly two and is attained.

**(B3) The mutual-omission cycles store omissions only.**  (M1)–(M4) reduce
modulo $Γ$ to the four negative statements of (D13).
`LocalizedCollisionMutualOmissionCycle` records two negative cross incidences,
distinct blockers, and common-deletion packets; it stores no positive shared
support point.  Moreover the packet interface
`CommonDeletionTwoCenterPacket` requires $z_1 ≠ z_2$ and $c(x) ∉ \{z_1,z_2\}$
but has **no** field $x ≠ z_2$, so the blocker/source equality degenerations of
(F1a) are legal inside it.
Source: `scratch/cross-blocker-terminal/REPORT.md`, section "Why the collision
packets do not close an equality arm".

*Does not imply:* that no positive incidence is derivable from $Γ$ — only that
the cycle packets do not carry one.

**(B4) Two-circle sharpness.**  Two circles with distinct (center, radius) pairs
share at most two carrier points ((D11)), and **exact convex models attain
two**.  Source: round-1 audit; the 15-point exact rational model of (B7) has
$K$-classes $\{a,b,i,j\}$ and $\{a,b,e,f\}$ sharing exactly $\{a,b\}$.

*Does not imply:* any lower bound on an intersection.  In particular
$|K(g) ∩ K(s_1)| ≥ 1$ does not follow from anything in $Γ$ established so far.

**(B5) An exact rational six-point equality-arm model exists.**  With
$$a = (1,\tfrac{15}{4}),\quad p = (0,1),\quad u = (1,0),\quad q = (2,1),
  \quad b_1 = (3,\tfrac{11}{4}),\quad v = (4,6),$$
and $b_0 := u$, the following hold exactly over $ℚ$: the cyclic order
$a,p,u,q,b_1,v$ is strictly convex (all 20 increasing orientation determinants
positive); the source pairs $\{p,q\}$ and $\{u,v\}$ are disjoint; the blockers
$b_0 ≠ b_1$; each blocker lies strictly between its own sources in the
$x$-coordinate; and
$$|ap|^2 = |aq|^2 = \tfrac{137}{16},\quad |au|^2 = |av|^2 = \tfrac{225}{16},
  \quad |b_0p|^2 = |b_0q|^2 = 2,\quad |b_1u|^2 = |b_1v|^2 = \tfrac{185}{16}.$$
So one common apex supports two distinct radii while the first blocker **is** a
source of the second row; relabelling realizes all four (F1a) arms.
Source: `scratch/cross-blocker-terminal/CrossBlockerCoincidenceAudit.lean`,
theorems `common_apex_two_distinct_radii`,
`first_blocker_eq_second_source_realizable`, `strict_convex_full_order`,
`all_four_cross_equalities_by_relabeling`.

*Satisfies:* strict convex position, both apex equidistance pairs, both blocker
equidistance pairs, disjoint source pairs, distinct blockers, one
blocker/source coincidence, the alternating cap order.
*Fails:* it is **not** a model of $Γ$ — no (C3) K₄ property, no
`CounterexampleData`, no MEC packet, no critical-shell system, no tri-apex
data, six points against $|A| ≥ 15$.
*Does not imply:* that (F1a) is consistent with $Γ$.  It shows only that
ordered-cap, bisector, circle-intersection and Kalmanson-style reasoning
**alone** cannot refute any equality arm.

**(B6) The realizable order of a bisector pair is alternating.**  Round 1
established that in the live configuration the order type available to the
ordered-cap terminals is the permitted alternating one, whereas the existing
contradiction theorems (`false_of_nonalternating_equidistant`, the four
`TwoCenterBisectorParity` order terminals,
`false_of_two_selected_rows_shared_late_pair`) require a non-alternating order.
Source: `scratch/cross-blocker-terminal/REPORT.md`, "Theorem-bank audit";
`docs/solve-prompts/2026-07-27-f-round1-response.md`, "Why the most natural
proof routes fail".

*Does not imply:* that a non-alternating order is impossible **given $Γ$** — that
is exactly what a Branch-A derivation of T2 would establish.  It does imply that
no argument using only convex position and the two equidistance relations can
produce one.

**(B7) The exact rational 15-point four-class model exists, and what it fails.**
There is an exact rational, strictly convex 15-point carrier
$A_0 = \{O,e,f,a,u,c,d,b,v,j,k,l,i,g,h\}$ with ccw hull order
$O, e, f, a, u, c, d, b, v, j, k, l, i, g, h$, six named cap roles
($a,u,c,d,b,v$) in one strict cap cut by the rational line $x = 3$, all eight
remaining shell points outside that cap, and **exactly four** carrier-level
full radius classes:
$$S_O(10) = \{a,b,i,j\},\quad S_O(\sqrt{185761/1849}) = \{u,v,k,l\},$$
$$S_c(\sqrt{6500/121}) = \{a,b,e,f\},\quad
  S_d(\sqrt{27882168817/339692733}) = \{u,v,g,h\}.$$
All 195 non-incident supporting-edge determinants and all
$\binom{15}{3} = 455$ ordered-triple determinants are exactly positive
(minimum $\tfrac{13458371304069}{2075414877378445}$).
Source: `scratch/full-local-euclidean-model-complete/` (`check_model.py`,
`REPORT.md`); the exact-rational checker was re-run on 2026-07-27 and prints
`PASS`.

*Satisfies:* (C1), (C2), (C4); the four designated exact circles as **full**
carrier-level classes (no unwanted fifth point); the cap order; the two
distinct radii at a common center $O$.
*Fails:* (C3) — the largest positive-radius class is a singleton at twelve of
the fifteen centers; no `SurplusCapPacket` (its unique MEC is the diameter
branch with boundary $\{a,l\}$, so the three-distinct-boundary-point condition
fails); no `CriticalShellSystem` (only eight of fifteen sources admit a legal
critical row); exactly one deletion-robust center ($O$), hence no three
rich/robust apices, hence no (T4).
*Does not imply:* that $Γ$ is satisfiable, nor that it is not.  It shows that
the four-circle local pattern is metrically realizable in strictly convex
position, so no Branch-A argument may rest on local metric incompatibility of
that pattern alone.

Known results on repeated distances in convex position (Erdős–Moser-type
bounds) may be used only as accurately stated published theorems with all
hypotheses; they do not by themselves settle any target.

---

## §7 Multiagent orchestration block

Use multiagent orchestration aggressively and dynamically.  You have up to 40
concurrent agents available.  Do not use a fixed assignment such as "N agents
for target T3."  Manage the search with the following heuristics.

* **Begin with a genuinely diverse portfolio.**  Agents should explore
  substantially different formulations, invariants, reductions, and
  computational sanity checks, drawn from at least these families:
  1. **Third-bisector production for T1**: find a mechanism in $Γ$ that forces
     a blocker center other than $b$ to carry both $s_1$ and $s_2$; by (E1)
     this is a contradiction, so the mechanism is the whole content.  Attack
     via (D1): force $¬K₄(A\setminus\{s_1\}, z)$ and $¬K₄(A\setminus\{s_2\}, z)$
     for a common $z ∈ \mathrm{ran}(c)\setminus\{b\}$.
  2. **Deletion-survival bookkeeping**: for each of the four collision sources,
     tabulate which blocker centers its deletion kills; (H2) forces one, (D1)
     converts memberships to kills, (T5)/(D10) bounds the total budget.  A
     source killing two distinct centers is exactly T1.
  3. **Unique-four cover double counting**: (T5)/(D10) — every carrier point is
     covered by the 4-class of a non-robust center; the three robust apices
     $a_0,a_1,a_2$ spend nothing; count coverage of the $≥ 15$ (or $≥ 17$)
     points against the named blocker budget, with the exact traces (D4) and
     the exact classes (X6)–(X9) as constraints.
  4. **Fresh-apex-row analysis for T3**: $S_{a_1}(r) = \{s_1,s_2,J_1,J_2\}$ with
     $J_1,J_2 ∉ C_{i_1}^\circ$ by (X6)/(X8).  Determine $c(J_1), c(J_2)$: where
     can they lie, what do their shells contain, and can $Γ$ force
     $s_2 ∈ K(J_1)$ (or a relabelling)?  Note the derived narrowings of §2.4.
  5. **Hull-order combinatorics for T3-f/T3-f′**: enumerate the admissible
     placements of the six labelled points on the hull cycle subject to
     $a_1 ∉ C_{i_1}$, $C, β, K ∈ C_{i_1}^\circ$, $J ∉ C_{i_1}^\circ$, and the
     arc structure of $C_{i_1}$; determine which placements are excluded by $Γ$
     and whether the complement is exactly (T3-f) ∪ (T3-f′).
  6. **Cap/arc ordered occupancy**: $|C_{i_1}| ≥ 6$ always, $≥ 8$ under (F2a);
     named occupants are $s_1,s_2,t_1,t_2,b,b'$ (and $g$ under (F2b)), all in
     $C_{i_1}^\circ$, plus the two endpoints $a_0,a_2$.  Push the counting.
  7. **Perpendicular-bisector saturation**: (E1) says the bisector of each
     collision pair is *saturated* by $\{a_1, b\}$.  Systematically ask which
     other pairs have saturated bisectors, and whether saturation propagates.
  8. **Two-circle bookkeeping across the row system** $K(s_1), K(t_1), K(g),
     K(x), K(J), S_{a_1}(r), S_{a_1}(ρ)$ and the packet rows $B_1, B_2$, using
     (D11) in both directions (upper bounds *and* the forced overlaps implied
     by exact cardinalities).
  9. **Distance-rigidity spindles**: chains of exact 4-shells sharing two
     points; rhombus/equilateral forcing; spindle transfer between $b$, $b'$
     and a third blocker value.
  10. **Exact coordinate normalization + polynomial elimination**: place $a_1$,
      normalize $r$, then resultants / Gröbner bases (msolve, Singular) per
      combinatorial pattern.
  11. **SMT over nonlinear real arithmetic** (Z3, cvc5) on the existential
      fragment of a fixed pattern, with validated encodings.
  12. **SAT/ILP enumeration of incidence patterns** (which named points lie on
      which named circles, caps and hull arcs) under the cardinality
      constraints, followed by per-pattern geometric elimination.
  13. **Blocker-map digraph structure**: $x ↦ c(x)$ has no fixed point, every
      value is a unique-four center, iterates cycle; study the interaction of a
      cycle with the collision fibers and with $J_1, J_2$.
  14. **Repeated-distance extremal counting in convex position** applied to the
      exact-4 classes (each unique-four center contributes four equal
      distances).
  15. **Exact Branch-B search**: small algebraic carriers ($n = 15..20$),
      structured families (rotation orbits, points on few concentric circles),
      checked exactly against the full clause list of §1.2; and, separately,
      exact obstruction proofs for such families.
  16. **Interval-arithmetic certified exclusion** over normalized parameter
      boxes, as evidence and to guide pattern pruning (must be upgraded per §5).

* **Do not tell most agents the currently favored approach.**  Preserve
  independence during early rounds so agents do not converge on the same
  attractive but incomplete argument.  The known attractors here are:
  * **(a) Re-deriving alternation.**  Agents will repeatedly rediscover that the
    bisector pair alternates with the pair it bisects and report it as progress.
    It is (B6), a refutation of the route, not a step toward T2.
  * **(b) Re-deriving a named cross-hit.**  Agents will aim at $t_i ∈ K(s_1)$ or
    $s_i ∈ K(t_1)$.  Those four are impossible by (B1); an argument that reaches
    one has an error.
  * **(c) Heuristic overdetermination counts.**  "Too many circles through too
    few points", "five constraints on four points is overdetermined" — these
    never produce an exact elimination.
  * **(d) Hidden-symmetry assumptions.**  Treating the $ρ$-row data as a mirror
    image of the $r$-row data, or assuming symmetric placement of the off-cap
    shell points $\{e, o\}$.
  * **(e) Reduction to a clean but unproved incidence lemma** of strength
    comparable to the target itself.

* **Maintain an explicit registry of approach families.**  Group agents by the
  mathematical idea, not by wording.  If many agents converge on one family,
  redirect some toward underexplored formulations.  Track separately which
  target (T1/T2/T3) and which variant (A0–A5) each agent is working.

* **Do not allow one approach to dominate merely because it gives an elegant
  reformulation.**  A route that ends at an unproved incidence or cap-counting
  lemma equivalent in strength to the target is not close to completion unless
  it supplies a genuinely new proof of that lemma.

* **When an approach stalls at a theorem-strength missing lemma, mark that route
  as blocked.**  Only continue assigning agents to it if someone proposes a
  materially new mechanism, invariant, construction, quantitative estimate, or
  exact-elimination device.

* **Keep several incompatible routes alive through multiple rounds.**  Maintain
  both Branch-A routes and Branch-B routes for each unresolved target until one
  side is rigorously ruled out.  Cross-pollinate only after independent agents
  have developed their routes far enough to expose real strengths and gaps.

* **Use computational agents throughout.**  Exact small-case computation,
  SAT/ILP/SMT encodings, Gröbner eliminations per pattern, candidate Branch-B
  searches, and counterexample searches against proposed intermediate lemmas.
  Always validate an encoding against a known result first.  Computation is
  evidence unless converted into a rigorous general proof or an exact
  certificate completing a valid reduction.

* **Search aggressively for counterexamples to proposed lemmas.**  Before any
  intermediate lemma is relied on, assign agents (computational where possible)
  to attempt to refute it — configurations satisfying a *subset* of $Γ$ are
  cheap to build and often kill overstated sublemmas.  A found counterexample
  kills the route immediately; a lemma that has survived no refutation attempt
  is not established.

* **Use adversarial agents throughout** — independent agents that did not
  produce the argument under audit.  Every candidate derivation must be checked
  for:
  * every field of the claimed package present and named: for T1 the point $x$
    and all of (T1-h)–(T1-k); for T2 the enumeration, the four indices in
    strict increasing order, both four-point classes with positive radii and
    center-exclusions, and all four memberships; for T3 the orientation
    $(C,K)$, $B_0 ∋ C$, $J ∈ B_0$ with $J ∉ \{C,K\}$, the membership
    $K ∈ K(J)$, and all six labelling equations of one complete order;
  * (C2) convex independence used exactly as stated (extreme points, not
    "general position");
  * K₄ always with a strictly positive radius and the correct ambient set
    (which point was deleted, and from what);
  * (C6) minimality applied with its true quantifier (all planar sets, not
    subsets of $A$) and never in a circular descent;
  * (C7) applied to **all** packets on $A$, not only the working packet;
  * closed cap $C_i$ versus strict interior $C_i^{\circ}$ in every membership;
    Moser endpoints handled under the closed-cap convention; $C_{i_1}^\circ =
    C_{i_1}\setminus\{a_0,a_2\}$ and $a_1 ∉ C_{i_1}$;
  * exact cardinalities where hypothesized ($= 4$ in (X6)/(X7)/(H1)/(T1-e)/
    (T2-d)/(T2-e)/(T3-b), $≤ 2$ in packets) versus lower bounds elsewhere;
  * $K(x)$ used as the **full** radius class in both directions of exactness;
  * (H2) criticality invoked only at the deleted point's own blocker;
  * (U1) unique-radius used only at blocker values $c(x)$, never at arbitrary
    carrier points;
  * robustness/richness claimed only where given ((T1), (T4), (D6));
  * (D14) applied only to pairs of **carrier** points, and (E1) not extended to
    pairs it does not cover;
  * ccw-order facts: the index chain is strict and total; the enumeration is
    injective with image exactly $A$; cyclic shifts used only via the shift
    lemma; no conflation of the linear index order with the cyclic order;
  * frontier data: $q_★, w_★ ∉ m$; both frontier instances kept distinct;
    (Q5)'s second arm correctly refuted via (X5)–(X7) when used;
  * collision data: equal-blocker identities used with the right pair; (X8)/(X9)
    are statements about the **strict** interior; (X10) does not by itself give
    (X11);
  * (M)-cycle facts: the designated $u, u'$ are fixed but unknown elements of
    their pairs — no proof may assume $u = s_1$ or $u' = t_1$;
  * packet clauses used as stated (rows live in $A$ minus the deleted point and
    the center; overlap bound is $≤ 2$, not $= 2$);
  * variant supplements: every field of (F1a)/(F2a)–(F2c)/(F3a)/(F4b) consumed
    or explicitly unused; disjunction arms all closed;
  * each item of §5;
  * circular use of a statement equivalent to a target, to one of the four
    leaves, to the parent coordinator, or to Bridge 2/3/4.

* **Require agents to return concrete lemmas, constructions, equations, exact
  certificates, encodings with validation runs, or counterexamples to proposed
  sublemmas.**  Reject status reports, vague optimism, and claims that an
  unproved incidence statement is "routine."

* **The root agent should repeatedly synthesize, challenge, redirect, and launch
  new rounds.**  Do not stop after the first wave fails.  Produce a resolved
  target only if it survives adversarial audit; otherwise report only the
  strongest rigorously proved derivation and its exact remaining gap.

---

## §8 Anti-quit block

Do not return merely because current approaches fail or agents report
theorem-strength gaps.  Continue launching new rounds, reopening blocked
approaches only when there is a genuinely new mechanism, and searching for
fresh formulations.  Spend at least six full rounds of the approach portfolio
per unresolved target before even thinking of returning.

---

## §9 Return contract

Return only when at least one of T1, T2, T3 has been completely resolved — a
Branch-A derivation of that target's full package from $Γ$ plus a named variant
supplement, or a Branch-B exact certificate satisfying every clause of $Γ$ —
and the argument survives adversarial audit.  Prefer resolving all three; report
each target separately, and for a Branch-A result state the variant used and the
leaves it closes per §2.5.

Do not return a reduction, partial result, isolated missing lemma, finite
computation, numerical guess, "best effort" summary, or an explanation of
difficulty.  Do not stop, return, or give up until at least one complete and
rigorous resolution exists; continue exploring every plausible approach,
repairing failed arguments, and developing new ones.

If, after exhausting the portfolio repeatedly, some targets remain open, the
final report must state, for each: the strongest rigorously proved derivation,
the exact remaining gap as a precisely stated mathematical statement, and the
audit trail of refuted intermediate lemmas.

---

## §10 Web-search restriction

Public search may be used only for ordinary mathematical background or standard
named theorems (convex-position distance counting, circle incidence, Kalmanson
inequalities, real algebraic elimination), not to search for a solution to these
exact obligations, to this formalization project, or to Erdős problem 97's
status.  Do not search the public web to determine whether these statements are
open, and do not answer that they are open.

---

## Appendix A — leaf and consumer declarations

All Lean paths are relative to `lean/` in `erdos-97-96-formalization`.  Every
line number below was verified against the working tree on 2026-07-27.

### A.1 The four `sorry` leaves

Namespace: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`
(`namespace Problem97` at FrontierLiveClosure.lean:41, `ATailFrontierLiveClosure`
at :42, `TwoSourceExactCollisionRowsTerminal` at :7417).  The section-variable
block supplying $Γ$ is `Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:
7421–7469` (`variable` at 7421–7465, `include` at 7467–7469).

| Leaf | Declaration | Location (`sorry`) |
|---|---|---|
| F1 | `false_of_crossBlockerCoincidence` | FrontierLiveClosure.lean:7476 (:7479) |
| F2 | `false_of_capSource_freshThirdBlockerFiber` | :7486 (:7490) |
| F3 | `false_of_capSource_firstFiber_collisionFiveCenterDeletion` | :7620 (:7628) |
| F4 | `false_of_capSource_freshOutsideSecondBlockerFiber` | :7648 (:7652) |

Sorry-free neighbours in the same section: `firstFiber_shell_eq_explicitFour`
(:7495), `FirstFiberCapSourceWitness` (:7521, `abbrev`),
`capSource_firstFiber_descent` (:7554, `private`).
`false_of_capSource_freshOutsideFirstBlockerFiber` (:7632) is **not**
sorry-free: it routes through F3.  The parent coordinator is
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
(:7673).

### A.2 The three consumers (targets)

| Target | Consumer declaration | Location | Spine |
|---|---|---|---|
| T1 | `Problem97.ATailRetainedCollisionCapLocalization.false_of_distinct_actualRow_contains_collisionSources` | ATail/RetainedCollisionCapLocalization.lean:246 | on spine |
| T1 (helper) | `actualRow_center_eq_commonBlocker_of_contains_collisionSources` | ATail/RetainedCollisionCapLocalization.lean:177 | on spine |
| T2 | `Problem97.CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair` | ATail/CapCrossingKalmanson.lean:427 | on spine |
| T3 | `Problem97.ATailRetainedCollisionDifferentPairConsumer.OrderedDifferentPairCrossHit.false` | ATail/RetainedCollisionDifferentPairConsumer.lean:157 (structure at :120) | **off spine**, `COMPAT-ONLY/BANK`, zero importers |
| T3′ | `…​.AlternateOrderedDifferentPairCrossHit.false` | same file:258 (structure at :223) | same |
| T3 (prefix) | `…​.FreshFirstApexRowPoint` | same file:62 | same |

### A.3 Terminal engines

| Engine | Declaration | Location |
|---|---|---|
| (D14) bisector bound | `Problem97.Dumitrescu.perpBisector_apex_bound` | P97/Dumitrescu/L1.lean:128 |
| Kalmanson (T2) | `dist_add_dist_lt_diagonal_sum_of_ccw` | ATail/CapCrossingKalmanson.lean:240 |
| Kalmanson (T3) | `complementary_dist_add_dist_lt_diagonal_sum_of_ccw` | ATail/CapCrossingKalmanson.lean:273 |
| ccw predicate | `EuclideanGeometry.IsCcwConvexPolygon` | `.lake/packages/formal_conjectures/FormalConjecturesForMathlib/Geometry/2d.lean:85` |
| cyclic shift | `isCcwConvexPolygon_cyclicShift` | P97/ConvexCyclicOrder/Basic.lean:196 |
| (B1) center exclusion | `CriticalFourShell.center_not_mem_support` | P97/U1CarrierInjection.lean:590 |
| (B2) three-hit bound | `criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich` | ATail/ApexRichClassStructure.lean:129 |
| interface adapter | `retainedRadiusCollisionOfInteriorCollision` (`private`) | ATail/LocalizedCollisionMutualOmissionCycle.lean:43 |

### A.4 Round-1 scratch artifacts cited in §6

| Artifact | Path |
|---|---|
| (B1), (B5) | `scratch/cross-blocker-terminal/CrossBlockerCoincidenceAudit.lean` |
| (B1), (B3), (B6), consumer census | `scratch/cross-blocker-terminal/REPORT.md` |
| (B2) | `scratch/hard-branch-math/NoThreeHit.lean` |
| hard-branch audit | `scratch/hard-branch-math/REPORT.md` |
| 17-point incidence shadow (disqualified for Branch B) | `scratch/hard-branch-math/FullPacketIncidenceShadow.lean` |
| (B7) | `scratch/full-local-euclidean-model-complete/REPORT.md`, `check_model.py` |
| K₄-extension lower bound | `scratch/full-local-euclidean-model-complete/K4_EXTENSION_OBSTRUCTION.md` |

---

## Appendix B — math object ↔ Lean structure

All paths relative to `lean/Erdos9796Proof/`.  Verified 2026-07-27.

| §1 object | Lean name | Location |
|---|---|---|
| carrier + (C1)–(C5) bundle | `CounterexampleData` | P97/U1TwoShortCapReduction.lean:83 |
| K₄ predicates | `Erdos97.HasNEquidistantPointsAt` / `Erdos97.HasNEquidistantProperty` | `.lake/packages/formal_conjectures/FormalConjectures/ErdosProblems/97.lean:34, 48` |
| (C2) convex independence | `Problem97.ConvexIndep` | P97/Foundation.lean:28 |
| (C6) minimality | `CounterexampleData.Minimal` | P97/U1TwoShortCapReduction.lean:158 |
| (C7) $(m,4,4)$ predicate | `SurplusCapPacket.IsM44` | P97/Cap/PartitionFromMEC.lean:443 |
| radius class $S_p(\varrho)$ | `SelectedClass` | P97/WitnessPacketInterface.lean:59 |
| (P1) MEC $(O,R_0)$ | `MEC.mec` | P97/MEC/Basic.lean:275 |
| (P2) triangle | `MEC.NonObtuseCircumscribedMoserTriangle` | P97/Moser/TriangleNonObtuse.lean:667 |
| (P3) caps, arc predicate | `CapTriple`; `OnArcOpposite` / `signedArea2` | P97/Cap/Structure.lean:161; P97/Foundation.lean:57, 49 |
| packet $S$, $m$, $σ$ | `SurplusCapPacket` | P97/Cap/PartitionFromMEC.lean:332 |
| $a_0, a_1, a_2$ | `surplusApex` / `oppApex1` / `oppApex2` | P97/U1TwoShortCapReduction.lean:313, 297, 305 |
| $C_i$, $C_i^{\circ}$, $i_1$ | `capByIndex` / `capInteriorByIndex` / `oppIndex1` | P97/Cap/PartitionFromMEC.lean:466, 474, 521 |
| (H1)–(H2) system $c, r, K$ | `CriticalShellSystem` (`centerAt`, `selectedAt`, `no_qfree`) | P97/U1CarrierInjection.lean:1015 |
| exact shell $K(x)$ | `CriticalFourShell`; `CriticalSelectedFourClass` | P97/U1CarrierInjection.lean:547, 635 |
| carrier vertex (subtype) | `CriticalShellSystem.CarrierVertex` | P97/U1CarrierInjection.lean:1111 |
| 4-point row (T2-d/e, T3-b) | `SelectedFourClass` | P97/U1CarrierInjection.lean:405 |
| packet row | `U5QDeletedK4Class` | P97/U5GlobalIncidenceBasic.lean:243 |
| $\mathrm{Packet}(x;z_1,z_2)$ | `CommonDeletionTwoCenterPacket` | P97/ATail/CommonDeletionTwoCenter.lean:29 |
| (Q1)–(Q7) frontier | `SurvivorPairRelocationPacket`; `CriticalPairFrontier`; `FirstApexSplit`; `SecondApexSplit` | P97/ATail/CriticalPairFrontier.lean:288, 568, 544, 555 |
| (R1)–(R3) parent | `FrontierCommonDeletionResidual` / `FrontierCommonDeletionParentResidual` | P97/ATail/OrientedPhysicalApexIngress.lean:239, 251 |
| (X1)–(X4) collision row | `RetainedInteriorBlockerCollision` | P97/ATail/RetainedStrictInteriorPairSelector.lean:95 |
| collision row (consumer form) | `RetainedRadiusCollision`; `FrontierCommonDeletionCriticalFiber`; `IsFiberOrientation` | P97/ATail/CriticalFiberRetainedRadiusSelector.lean:187; P97/ATail/FirstApexCriticalFiber.lean:61; P97/ATail/CriticalFiberClosingCore.lean:33 |
| (M1)/(M3) common deletion | `LocalizedCollisionCommonDeletion` | P97/ATail/RetainedStrictInteriorPairSelector.lean:449 |
| (M2)/(M4) cycles | `LocalizedCollisionMutualOmissionCycle` | P97/ATail/LocalizedCollisionMutualOmissionCycle.lean:131 |
| (T1) | `FrontierBiApexRobustResidual` | P97/ATail/PhysicalSecondApexCommonDeletion.lean:171 |
| (T2) | `FrontierLargeOppositeCapsBiApexRobustResidual` | P97/ATail/LargeOppositeCapsBiApexSurface.lean:38 |
| (T3) | `FrontierAllLargeCapsBiApexRobustResidual` | P97/ATail/FrontierLiveClosure.lean:6430 |
| (T4)–(T6) | `FrontierAllLargeCapsTriApexRobustResidual` | P97/ATail/FrontierLiveClosure.lean:6527 |
| Robust / Rich | `FullyDeletionRobustAt`; `ApexRichClassStructure` | P97/ATail/DeletionRobustness.lean:27; P97/ATail/ApexRichClassStructure.lean:50 |
| (U1) | `IsUniqueFourCenter` / `uniqueFourClass` | P97/ATail/MinimalUniqueFourCover.lean:48, 64 |
| NR | `notRobustCenters` | P97/ATail/MinimalUniqueFourCover.lean:418 |
| (F1a) | `CrossBlockerCoincidence` | P97/ATail/TwoCollisionGlobalProducer.lean:272 |
| (F2a)+(F2b) | `CapSourceThirdCanonicalRowSurface` | P97/ATail/TwoCollisionGlobalProducer.lean:291 |
| (F2b) named form | `FirstFiberCapSourceWitness` | P97/ATail/FrontierLiveClosure.lean:7521 |
| (F2c) | `FreshThirdBlockerFiber` | P97/ATail/BlockerMultiplicityGeometry.lean:70 |
| (F3a) | `FreshOutsideFirstBlockerFiber` | P97/ATail/BlockerMultiplicityGeometry.lean:115 |
| (F3c) | `FirstFiberCollisionFiveCenterDeletionResidual` / `FiveCenterDeletionSurvival` | P97/ATail/FirstFiberOverlapDescent.lean:85, 39 |
| (F4b) | `FreshOutsideSecondBlockerFiber` | P97/ATail/BlockerMultiplicityGeometry.lean:161 |
| (D1) | `cross_deletion_survives_iff_not_mem_selected_support` | P97/ATail/CriticalPairFrontier.lean:755 |
| (D2) | `selectedFourClass_support_eq_shell` | P97/U1CarrierInjection.lean:1087 |
| (D3) | `selectedSupports_eq_of_actualBlockers_eq`; `RetainedInteriorBlockerCollision.supports_eq` | P97/ATail/SurvivalCover.lean:48; P97/ATail/RetainedStrictInteriorPairSelector.lean:207 |
| (D4) | `shell_inter_cap_eq_sources`; `collisionShell_sdiff_firstCap_card_eq_two` | P97/ATail/RetainedStrictInteriorPairSelector.lean:279; P97/ATail/BlockerMultiplicityGeometry.lean:220 |
| (D5) | `blocker_mem_capInterior` | P97/ATail/RetainedStrictInteriorPairSelector.lean:244 |
| (D6) | `FrontierCommonDeletionParentResidual.firstApexFullyDeletionRobust`; `fullyDeletionRobustAt_of_apexRichClassStructure` | P97/ATail/OrientedPhysicalApexIngress.lean:318; P97/ATail/ApexRichClassStructure.lean:105 |
| (D7) | `not_isUniqueFourCenter_of_fullyDeletionRobust` (with (U1)) | P97/ATail/MinimalUniqueFourCover.lean:159 |
| (D8)/(D9) | `selectedFourClass_inter_capByIndex_card_le_two`; `outsidePair_unique_capCenter` | P97/CapSelectedRowCounting.lean:257, 283 |
| (D10)/(T5) | `card_le_four_mul_notRobustCenters` | P97/ATail/MinimalUniqueFourCover.lean:429 |
| (D11) | `U5QDeletedK4Class.inter_card_le_two`; `criticalFourShell_inter_selectedClass_card_le_two` | P97/U5GlobalIncidenceSupport.lean:412; P97/ATail/MinimalUniqueFourCover.lean:306 |
| (D12) | `firstFiber_shell_eq_explicitFour` | P97/ATail/FirstFiberOverlapDescent.lean:156; P97/ATail/FrontierLiveClosure.lean:7495 |
| (D14) | `Problem97.Dumitrescu.perpBisector_apex_bound` | P97/Dumitrescu/L1.lean:128 |

---

## Appendix C — status register

Use only the first two categories as premises.

**Kernel-checked (Lean, in-tree or scratch, `sorry`-free):**
$Γ$ as stated in §1.2 (it is a Lean `variable`/`include` block, not a claim);
(D0)–(D13) at the Appendix-B locations; (D14); the terminal mechanisms of T1,
T2, T3 (the three consumer theorems themselves); (B1); (B2); (B3); (B5).
For the scratch files (`CrossBlockerCoincidenceAudit.lean`, `NoThreeHit.lean`)
the recorded validation is `lake env lean <file>` on Lean 4.27.0 with axioms
`[propext, Classical.choice, Quot.sound]`; those builds were **not re-run** while
preparing this document, but the files were read in full and contain no `sorry`,
`admit`, `axiom` declarations, or `native_decide` (both contain `#print axioms`
commands).

**Exact-arithmetic checked (not Lean):**
(B7), the 15-point rational model — `check_model.py` re-run 2026-07-27, prints
`PASS` with the coordinates, hull order, four exact classes, pinned
multiplicities, MEC, and 195 + 455 positive determinants quoted in §6.
The K₄-extension lower bound $|B\setminus A_0| ≥ 6$ in
`K4_EXTENSION_OBSTRUCTION.md` is a written proof over the same exact data; it
is not formalized.

**Derived in this document (proofs given inline; not kernel-checked):**
(E1), the exact bisector census of a collision pair (§2.1); the observation that
each of T1, T2, T3 is unsatisfiable in a convex-independent carrier and hence
that Branch B coincides with a full exact $Γ$-model (§2.0, §4); the
order-forced placements $c(J) ∈ C_{i_1}^{\circ}$ under (T3-f) and
$J ∈ \{a_0,a_2\}$ under (T3-f′) (§2.4).  Verify these before building on them.

**CONJECTURE — do not use as premises:**

* The round-1 claim that, modulo $Γ$ and (F3b), hypothesis (F3c) carries no new
  positive geometry (i.e. that the unresolved core of F3 already lies in
  $Γ + \mathrm{(F3a)} + \mathrm{(F3b)}$).  Not kernel-checked.
* The round-1 "sharpened" sufficient terminals **for F4 only** (the mirror
  statements $|K(g) ∩ K(t_1)| ≥ 3$ and $c(g) ∈ C_{i_1}$ with
  $\{e,o\} ⊆ K(g)$): not kernel-checked.  The **F3-side** terminals ARE
  kernel-checked in-tree and are established background, not conjecture:
  `false_of_firstFiber_explicit_overlap_card_ge_three`
  (`FirstFiberOverlapDescent.lean:772`; takes $c(g) ≠ b$ and
  $3 ≤ |K(g) ∩ \{s_1,s_2,e,o\}|$) and
  `false_of_firstFiber_twoOutsideHits_of_capCenter` (`:901`; takes
  $c(g)$ in the closed first cap, $c(g) ≠ b$, $e, o ∈ K(g)$).  In any case
  neither hypothesis set is currently derivable from $Γ$.
* Any claim that a particular target is *underivable* from $Γ$ short of a
  complete Branch-B certificate.
