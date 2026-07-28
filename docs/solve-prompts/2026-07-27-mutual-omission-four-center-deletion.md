# Complete-resolution prompt — Family B: mutual-omission four-center common deletion (three leaves)

Target: the three `sorry`-bearing leaf theorems in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean` whose goals are all
`False`:

* **Leaf B1** `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision`
* **Leaf B2** `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`
* **Leaf B3** `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare`

This document is self-contained: every hypothesis of each leaf is translated
below into plain planar Euclidean geometry (finite point sets in $\mathbb{R}^2$,
Euclidean distance, cardinality, membership). No access to the Lean sources is
required to work on it. The appendix maps every label back to its Lean
declaration.

---

## §1 Notation preamble — the shared ambient configuration

All geometry is in the Euclidean plane $\mathbb{R}^2$ with distance
$d(x,y) = \lVert x-y \rVert$. All point sets are finite. $|X|$ denotes
cardinality. $X \smallsetminus x$ abbreviates $X \smallsetminus \{x\}$.
Strict and non-strict inequalities are exactly as written; "exactly $k$"
means cardinality $= k$, not $\ge k$.

### N1. The equidistance predicate

For a finite $X \subset \mathbb{R}^2$ and $p \in \mathbb{R}^2$ write

$$E_4(X, p) \;:\equiv\; \exists\, r > 0 :\; |\{x \in X : d(p,x) = r\}| \ge 4 .$$

(Since $r > 0$, the point $p$ itself never counts even when $p \in X$.)
For $s \in \mathbb{R}^2$ and $\rho \in \mathbb{R}$, the **radius class**
("selected class") is

$$\mathrm{Cl}(X, s, \rho) \;:=\; \{x \in X : d(s,x) = \rho\}.$$

### N2. Convex independence

$\mathrm{ConvexIndep}(A)$: every $a \in A$ satisfies
$a \notin \mathrm{convexHull}(A \smallsetminus a)$ — i.e. $A$ is the vertex
set of a convex polygon (for $|A| \ge 3$, no vertex inside or on the hull of
the others).

### N3. The counterexample bundle $D$

$D$ consists of a finite set $A \subset \mathbb{R}^2$ with:

* **(D1)** $A \neq \varnothing$;
* **(D2)** $\mathrm{ConvexIndep}(A)$;
* **(D3)** the **K4 property**: $E_4(A, p)$ for every $p \in A$ — every
  vertex has (at least) four other vertices equidistant from it, at some
  positive radius depending on the vertex;
* **(D4)** $A$ carries at least one surplus-cap packet in the sense of N4
  (the bundle's own packet; its only role in the leaves is guaranteeing that
  such a packet exists, hence $|A| > 4$).

* **(D5, used through R below) Minimality**: for every finite nonempty
  $B \subset \mathbb{R}^2$ with $\mathrm{ConvexIndep}(B)$ and the K4 property,
  $|A| \le |B|$. (A global interface assumption: $A$ is a minimum-cardinality
  convex K4 configuration.)

This is exactly the hypothesis set of a minimal counterexample to Erdős
problem 97 ("every convex polygon has a vertex with no four other vertices
equidistant from it"), plus the packet structure below.

### N4. The surplus-cap packet $S$

$S$ is a given surplus-cap packet on $A$ — a further datum of the leaves,
not necessarily equal to the bundle's own packet of (D4); every apex and
cap named below refers to $S$. The packet consists of:

* **(S1)** $A \neq \varnothing$ and $A$ not collinear;
* **(S2)** a **Moser triangle**: three pairwise distinct points
  $v_1, v_2, v_3 \in A$ lying on the boundary circle of the minimum enclosing
  circle $\mathrm{MEC}(A)$ (the unique center–radius pair $(O, \rho_0)$ with
  $d(p, O) \le \rho_0$ for all $p \in A$ and $\rho_0$ minimal), such that all
  three vertex angles are non-obtuse:
  $\langle v_2 - v_1,\, v_3 - v_1\rangle \ge 0$,
  $\langle v_3 - v_2,\, v_1 - v_2\rangle \ge 0$,
  $\langle v_1 - v_3,\, v_2 - v_3\rangle \ge 0$;
* **(S3)** a **cap triple** $C_1, C_2, C_3 \subseteq A$ (closed-cap
  convention) with the exact membership pattern: $v_i \notin C_i$; the other
  two triangle vertices belong to $C_i$ (e.g. $v_2, v_3 \in C_1$); every
  non-triangle point of $A$ lies in exactly one cap; and the
  **arc-membership invariant**: for all $x \in A$,
  $x \in C_1 \iff \sigma(x, v_2, v_3)\,\sigma(v_1, v_2, v_3) \le 0$ and
  cyclically, where
  $\sigma(p,q,r) := (q_x - p_x)(r_y - p_y) - (r_x - p_x)(q_y - p_y)$ is twice
  the signed area — so $C_i$ is precisely the set of $A$-points on the closed
  MEC arc opposite $v_i$ (chord included);
* **(S4)** a **surplus index** $s \in \{1,2,3\}$ with $|C_s| > 4$.

Derived labels (cyclic successor notation, indices mod 3):

* surplus cap $C_s$; **first opposite apex** $a_1 := v_{s+1}$, **second
  opposite apex** $a_2 := v_{s+2}$; **first opposite cap** $P_1 := C_{s+1}$,
  **second opposite cap** $P_2 := C_{s+2}$.
* The **strict interior** of cap $C_i$ is $C_i$ minus its two endpoint
  triangle vertices (e.g. $\mathrm{int}(C_1) = C_1 \smallsetminus \{v_2, v_3\}$).
  Write $\mathrm{int}(P_1)$, $\mathrm{int}(P_2)$ for the interiors of the two
  opposite caps.
* Cap-sum identity (provable, background): $|C_s| + |P_1| + |P_2| = |A| + 3$.

**(S5) No-(m,4,4) hypothesis** (field of R below): there is **no** packet
$T$ on the same set $A$ — i.e. no choice of non-obtuse circumscribed Moser
triangle, cap triple satisfying (S1)–(S4), and surplus designation — whose
two opposite caps both have exactly 4 points. (Another global interface
assumption, quantifying over all admissible re-partitions of $A$.)

### N5. Critical shell systems

A **critical shell system** $\Sigma$ on $A$ assigns to each $q \in A$:

* a **blocker center** $b_\Sigma(q) \in A$, $b_\Sigma(q) \neq q$;
* a **radius** $r_\Sigma(q) > 0$, such that the full circle class
  $$K_\Sigma(q) := \{x \in A : d(b_\Sigma(q), x) = r_\Sigma(q)\}$$
  satisfies $|K_\Sigma(q)| = 4$ and $q \in K_\Sigma(q)$
  (so $K_\Sigma(q)$ is an **exact** four-point circle: it is the whole
  radius class of $A$ at that center and radius, not a chosen 4-subset);
* the **no-q-free condition**: $\neg E_4(A \smallsetminus q,\; b_\Sigma(q))$ —
  after deleting $q$, no radius at all leaves four $A$-points equidistant
  from $b_\Sigma(q)$. (In particular $b_\Sigma(q) \notin K_\Sigma(q)$, and
  any four $A$-points concyclic about $b_\Sigma(q)$ must include $q$;
  equivalently, every 4-point circle class about $b_\Sigma(q)$ in $A$ IS
  $K_\Sigma(q)$.)

Existence of such a system on a minimal counterexample is a proved upstream
fact (minimality forbids removable vertices); here $\Sigma$ (called $H$ in
Lean) is simply given data.

Useful proved equivalence (background, §6): for $q \in A$, $w \in \mathbb{R}^2$,
$$E_4(A \smallsetminus w,\; b_\Sigma(q)) \iff w \notin K_\Sigma(q). \tag{N5.1}$$

### N6. The critical pair frontier $F$

$F$ consists of a **survivor pair relocation packet** together with two
deletion split facts, for a fixed radius $r \in \mathbb{R}$ (positive —
provable from the packet, background):

* **(F1)** points $q_0, w_0 \in A$, $q_0 \neq w_0$, both in the **first-apex
  marginal** $\;M_r := \{x \in A : d(x, a_1) = r\} \smallsetminus C_s$
  (on the circle of radius $r$ about $a_1$, not in the surplus cap);
* **(F2)** single-deletion survival at the second apex:
  $E_4(A \smallsetminus q_0, a_2)$ and $E_4(A \smallsetminus w_0, a_2)$;
* **(F3)** $b_\Sigma(q_0) \neq a_2$ and $b_\Sigma(w_0) \neq a_2$;
* **(F4)** **first-apex split**:
  $E_4((A \smallsetminus q_0) \smallsetminus w_0,\; a_1)$, or else
  $\bigl(|\mathrm{Cl}(A, a_1, r)| \in \{4, 5\}$ and every $\rho > 0$ with
  $|\mathrm{Cl}(A, a_1, \rho)| \ge 4$ satisfies $\rho = r\bigr)$;
* **(F5)** **second-apex double-deletion survival**:
  $E_4((A \smallsetminus q_0) \smallsetminus w_0,\; a_2)$;
* **(F6)** **second-apex split**:
  $E_4((A \smallsetminus q_0) \smallsetminus w_0,\; a_2)$ (implied by (F5)), or
  there exist exact four-point circle classes $K_q, K_w \subseteq A$ centered
  at $a_2$ through $q_0$ resp. $w_0$ (i.e. $K_q = \mathrm{Cl}(A, a_2, d(a_2,q_0))$
  with $|K_q| = 4$, $q_0 \in K_q$, $d(a_2, q_0) > 0$, and similarly for $K_w$)
  with $K_q \cap K_w = \varnothing$.

### N7. The exact-four residual $R$

$R$ bundles, for the frontier radius $r$ of N6 and $T_1 := \mathrm{Cl}(A, a_1, r)$:

* **(R1)** minimality (D5);
* **(R2)** the no-(m,4,4) hypothesis (S5);
* **(R3)** $|A| > 9$;
* **(R4)** $|T_1| = 4$ (exact four-point first-apex class);
* **(R5)** **unique K4 radius at $a_1$**: for every $\rho > 0$ with
  $|\mathrm{Cl}(A, a_1, \rho)| \ge 4$, $\rho = r$;
* **(R6)** **every class member blocks**: for every $x \in T_1$,
  $\neg E_4(A \smallsetminus x,\; a_1)$;
* **(R7)** two distinct points $t_q \neq t_w$ with
  $t_q, t_w \in T_1 \cap \mathrm{int}(P_1)$ (a strict-interior pair of the
  class in the first opposite cap);
* **(R8)** **bisector localization**: every $c \in A$ with $c \neq a_1$ and
  $d(c, t_q) = d(c, t_w)$ satisfies $c \in \mathrm{int}(P_1)$.

### N8. The late first-apex system $\Sigma^{*}$ and row notation

$\Sigma^{*}$ (Lean: `lateFirstApexSystem R`) is the critical shell system
obtained from $\Sigma$ by overriding the choice on $T_1$:

* if $x \in T_1$: $\;b_{\Sigma^*}(x) = a_1$, $r_{\Sigma^*}(x) = r$, and
  $K_{\Sigma^*}(x) = T_1$ (legal by (R4), (R6), $x \in T_1$, $r > 0$);
* if $x \notin T_1$: $\Sigma^{*}$ agrees with $\Sigma$ at $x$.

Abbreviate, for $x \in A$:

$$\beta(x) := b_{\Sigma^*}(x), \qquad \mathrm{Row}(x) := K_{\Sigma^*}(x),
\qquad r^*_x := r_{\Sigma^*}(x).$$

Standing facts (definitional or proved, all available): $\beta(x) \in A$,
$\beta(x) \neq x$, $r^*_x > 0$, $x \in \mathrm{Row}(x)$,
$|\mathrm{Row}(x)| = 4$,
$\mathrm{Row}(x) = \{y \in A : d(\beta(x), y) = r^*_x\}$ (full class),
$\beta(x) \notin \mathrm{Row}(x)$,
$\neg E_4(A \smallsetminus x, \beta(x))$, and the survival equivalence
(N5.1) for $\Sigma^{*}$:
$E_4(A \smallsetminus w, \beta(x)) \iff w \notin \mathrm{Row}(x)$.
For $x \in T_1$: $\beta(x) = a_1$ and $\mathrm{Row}(x) = T_1$; in particular
$\beta(q_0) = a_1$ (since $q_0 \in T_1$ by (F1)).

### N9. Common-deletion two-center packets

For $z \in A$ and centers $c_1, c_2$, a packet $\mathrm{CDP}(z; c_1, c_2)$
(with respect to $\Sigma^{*}$) consists of:

* **(P1)** $z, c_1, c_2 \in A$ and $c_1 \neq c_2$;
* **(P2)** $E_4(A \smallsetminus z,\; c_1)$ and $E_4(A \smallsetminus z,\; c_2)$;
* **(P3)** $\beta(z) \neq c_1$ and $\beta(z) \neq c_2$;
* **(P4)** finite sets $B_1, B_2 \subset \mathbb{R}^2$ with, for $i = 1, 2$:
  $B_i \subseteq (A \smallsetminus z) \smallsetminus c_i$, $z \notin B_i$,
  $|B_i| = 4$, and a radius $r_i > 0$ with $d(c_i, y) = r_i$ for all
  $y \in B_i$ (a 4-point equidistant witness about $c_i$ avoiding both $z$
  and $c_i$);
* **(P5)** $|B_1 \cap B_2| \le 2$.

### N10. The post-card-eleven robust surface $\Phi$

$\Phi$ bundles five items:

* **($\Phi$1) Ingress.** A point $\delta_0 \in \{q_0, w_0\}$ and a source
  $s_0 \in A$ such that:
  * $s_0$ is a **good outside source**: $\beta(s_0) \neq \beta(q_0)$
    (equivalently $\beta(s_0) \neq a_1$, since $\beta(q_0) = a_1$), and at
    least one of $E_4(A \smallsetminus q_0, \beta(s_0))$,
    $E_4(A \smallsetminus w_0, \beta(s_0))$ holds;
  * $\beta(s_0) \neq a_2$;
  * a packet $\mathrm{CDP}(\delta_0;\; \beta(s_0),\; a_2)$.
* **($\Phi$2) Second-apex full deletion robustness**: for **every** $z \in A$,
  $E_4(A \smallsetminus z,\; a_2)$. (Consequence used constantly:
  $\beta(x) \neq a_2$ for every $x \in A$.)
* **($\Phi$3)** $|P_1| \ge 4$;
* **($\Phi$4)** $|P_2| \ge 5$;
* **($\Phi$5) Radius classification at $a_2$** — at least one of (the two
  branches are in fact mutually exclusive, but the given datum is the plain
  disjunction):
  * (five-point radius) some $\rho' > 0$ has
    $|\mathrm{Cl}(A, a_2, \rho')| \ge 5$; or
  * (two distinct radii) there are $\rho' \neq \rho''$, both $> 0$, with
    $|\mathrm{Cl}(A, a_2, \rho')| \ge 4$ and
    $|\mathrm{Cl}(A, a_2, \rho'')| \ge 4$, while **every**
    $\rho''' > 0$ has $|\mathrm{Cl}(A, a_2, \rho''')| < 5$; moreover there
    are two 4-element subsets $W_1 \subseteq \mathrm{Cl}(A, a_2, \rho')$,
    $W_2 \subseteq \mathrm{Cl}(A, a_2, \rho'')$ with $a_2 \notin W_i$ and
    $W_1 \cap W_2 = \varnothing$.
* **($\Phi$6) Cap growth** — one of:
  * $|C_s| \ge 6$; or
  * $|C_s| = 5$, $|P_1| \ge 5$, and $|P_1| + |P_2| + 2 = |A|$; or
  * $|C_s| = 5$, $|P_1| = 4$, $|P_2| \ge 6$, and $|P_2| + 6 = |A|$.

### N11. Joint-deletion packets (the family's central object)

Fix $\rho > 0$ and let $C := \mathrm{Cl}(A, a_2, \rho)$ (the **physical
second-apex class**). For $u, v \in A$, an
**exact-four mutual-omission joint deletion** $J$ for $(u, v)$ consists of:

* **(J1)** a point $z \in A$ with $z \in C$;
* **(J2)** $z \neq u$ and $z \neq v$;
* **(J3)** $z \notin \mathrm{Row}(u)$ and $z \notin \mathrm{Row}(v)$;
* **(J4)** $\beta(u) \neq \beta(v)$;
* **(J5)** a packet $\mathrm{CDP}(z;\; \beta(u),\; a_2)$
  (so in particular $E_4(A \smallsetminus z, \beta(u))$,
  $E_4(A \smallsetminus z, a_2)$, $\beta(z) \neq \beta(u)$,
  $\beta(z) \neq a_2$, $\beta(u) \neq a_2$);
* **(J6)** a packet $\mathrm{CDP}(z;\; \beta(v),\; a_2)$
  (similarly with $\beta(v)$; in particular $\beta(z) \neq \beta(v)$ and
  $\beta(v) \neq a_2$).

Write $z(J)$ for the deleted point of $J$.

### N12. Interface summary

Two hypotheses are global (not locally checkable from coordinates of $A$
alone as a configuration-with-packets): **minimality (D5)** — no smaller
convex K4 configuration exists anywhere — and **no-(m,4,4) (S5/R2)** — no
admissible re-partition of $A$ has both opposite caps of size exactly 4. All
other hypotheses are explicit finite statements about $A$ and the packet
data. Everything named above ($D, S, \Sigma, F, R, \Sigma^{*}, \Phi, J$) is
**given data**: a proof of a leaf may use only the listed properties, and a
refuting model must construct all of it.

---

## §2 Problem statement

Resolve the following family of three statements completely. Each leaf
asserts that its hypothesis list is contradictory (Lean goal `False`). The
three leaves share the common prefix below; do not drop, weaken, merge, or
"simplify" any hypothesis.

### Common prefix (all three leaves)

Assume the entire ambient configuration of §1: the counterexample bundle $D$
with point set $A$ (D1–D5), packet $S$ (S1–S5), a critical shell system
$\Sigma$, a frontier $F$ with pair $(q_0, w_0)$ and radius $r$ (F1–F6), an
exact-four residual $R$ (R1–R8) — hence the late system $\Sigma^{*}$ with
$\beta(\cdot)$, $\mathrm{Row}(\cdot)$ as in N8 — and a robust surface $\Phi$
($\Phi$1–$\Phi$6). Additionally:

* **(H1)** $|A| \ge 12$;
* **(H2)** $\rho > 0$ and $C := \mathrm{Cl}(A, a_2, \rho)$ satisfies $|C| \ge 5$;
* **(H3)** $u, v \in A$, $u \neq v$, with $u \in C$ and $v \in C$
  (i.e. $d(a_2, u) = d(a_2, v) = \rho$);
* **(H4)** **mutual omission**: $v \notin \mathrm{Row}(u)$ and
  $u \notin \mathrm{Row}(v)$;
* **(H5)** two joint-deletion packets $J_1, J_2$ for $(u,v)$ as in N11
  (each carrying J1–J6; in particular both share the field
  $\beta(u) \neq \beta(v)$), with deleted points $z_1 := z(J_1)$,
  $z_2 := z(J_2)$;
* **(H6)** $z_1 \neq z_2$.

Note the standing consequences already available: $z_1, z_2 \in C$;
$z_i \notin \mathrm{Row}(u) \cup \mathrm{Row}(v)$; $z_i \neq u, v$;
$\beta(z_i) \notin \{\beta(u), \beta(v), a_2\}$;
$\beta(u) \neq a_2 \neq \beta(v)$; and by ($\Phi$2), $E_4(A \smallsetminus
x, a_2)$ for all $x \in A$.

### Leaf B1 — blocker collision

Beyond the common prefix, assume:

* **(B1.1)** $\beta(z_1) = \beta(z_2)$;
* **(B1.2)** $\mathrm{Row}(z_1) = \mathrm{Row}(z_2)$;
* **(B1.3)** $z_1 \in \mathrm{Row}(z_2)$ and $z_2 \in \mathrm{Row}(z_1)$;
* **(B1.4)** $|\mathrm{Row}(z_1) \cap C| = 2$ (exactly two).

**Prove $False$.**

(Geometric digest for orientation only — the hypotheses above are the
authority: $K := \mathrm{Row}(z_1) = \mathrm{Row}(z_2)$ is a single exact
4-point circle class about the common blocker $b := \beta(z_1) = \beta(z_2)$,
containing both $z_1$ and $z_2$; by (B1.4) and (B1.3),
$K \cap C = \{z_1, z_2\}$. Both $b$ and $a_2$ are equidistant from $z_1,
z_2$, with $b \neq a_2$, $b \notin \{\beta(u), \beta(v)\}$, and
$\neg E_4(A \smallsetminus z_i, b)$ for $i = 1, 2$.)

### Leaf B2 — blocker coincidence

Beyond the common prefix, assume:

* **(B2.1)** $\beta(z_1) \neq \beta(z_2)$;
* **(B2.2)** $\beta(z_1) \neq \beta(u)$, $\beta(z_1) \neq \beta(v)$,
  $\beta(z_1) \neq a_2$;
* **(B2.3)** $\beta(z_2) \neq \beta(u)$, $\beta(z_2) \neq \beta(v)$,
  $\beta(z_2) \neq a_2$;
* **(B2.4)** a cross packet $\mathrm{CDP}(z_1;\; \beta(z_2),\; a_2)$
  (per N9: $E_4(A \smallsetminus z_1, \beta(z_2))$,
  $E_4(A \smallsetminus z_1, a_2)$, $\beta(z_1) \neq \beta(z_2)$,
  $\beta(z_1) \neq a_2$, plus the two 4-point witness rows with
  $\le 2$ overlap);
* **(B2.5)** **collision**: $z_1 = \beta(u)$ or $z_1 = \beta(v)$ or
  $z_1 = \beta(z_2)$ — the first deleted point coincides, as a point of the
  plane, with one of the three non-physical carrier centers.

**Prove $False$.**

### Leaf B3 — survival square

Beyond the common prefix, assume (B2.1), (B2.2), (B2.3), (B2.4) verbatim
(same hypotheses as Leaf B2 minus the collision), and:

* **(B3.5)** **bidirectional deletion-survival square**: at least one of the
  following four conjunctions holds, where $c$ ranges over the four surviving
  centers $\{a_2,\; \beta(u),\; \beta(v),\; \beta(z_2)\}$:
  * $E_4(A \smallsetminus z_1,\; a_2) \;\wedge\; E_4(A \smallsetminus a_2,\; \beta(z_1))$; or
  * $E_4(A \smallsetminus z_1,\; \beta(u)) \;\wedge\; E_4(A \smallsetminus \beta(u),\; \beta(z_1))$; or
  * $E_4(A \smallsetminus z_1,\; \beta(v)) \;\wedge\; E_4(A \smallsetminus \beta(v),\; \beta(z_1))$; or
  * $E_4(A \smallsetminus z_1,\; \beta(z_2)) \;\wedge\; E_4(A \smallsetminus \beta(z_2),\; \beta(z_1))$.

**Prove $False$.**

(Origin of the split, background: a proved producer shows that under the
common prefix plus (B2.1)–(B2.4), either $z_1$ equals one of the three
non-physical centers — Leaf B2's (B2.5) — or one of the four survival
squares of (B3.5) holds, because $\mathrm{Row}(z_1)$ has exactly 4 points
containing $z_1$ and the four centers $a_2, \beta(u), \beta(v), \beta(z_2)$
are pairwise distinct, so at least one of them is not in $\mathrm{Row}(z_1)$,
and the survival equivalence (N5.1) converts non-membership into
$E_4(A \smallsetminus c, \beta(z_1))$. Note the second conjunct of each
square is equidistance survival at $\beta(z_1)$ after deleting a **center**,
paired with survival at that center after deleting $z_1$.)

### Edge conventions

* All classes $\mathrm{Cl}(\cdot)$ and rows $\mathrm{Row}(\cdot)$ are **full**
  radius classes of $A$ — exact circle intersections, never chosen subsets;
  the sets $B_i, W_i$ inside packets are the only chosen 4-subsets.
* The condition $r_\Sigma(q) > 0$, $\rho > 0$ everywhere excludes degenerate
  zero-radius circles; a center is never a member of its own class.
* $u, v, z_1, z_2$ carry membership in $A$; equality/distinctness of these
  is equality of points of $\mathbb{R}^2$.
* Hypotheses prefixed `_` in the Lean source (e.g. `_hcard`) are ordinary
  hypotheses; the underscore only marks them unused by the current partial
  proof script.

---

## §3 Assume-solvable framing

Assume for purposes of this task that a complete resolution exists for each
leaf, but do not assume in advance which branch holds for any leaf. A
complete solution for a leaf must prove exactly one of the two statements in
§4. The three leaves may resolve in different directions. Full family
success is a complete resolution of all three leaves; a complete resolution
of a single leaf is a self-contained deliverable and must be reported as
such.

## §4 Dual-branch success criteria

**Branch A — proof (leaf is true).** A complete, rigorous proof of $False$
from the leaf's full hypothesis list (§2), i.e. a proof that no
configuration satisfies all of that leaf's hypotheses simultaneously. The
proof must be stated in ordinary mathematical prose precise enough to
formalize in Lean 4 with mathlib against the exact definitions of §1: every
case covered, every application of a background theorem (§6) with its
hypotheses checked, no step "by symmetry" unless the symmetry is an exact
hypothesis-preserving involution that is exhibited. It must use only the
listed hypotheses — without additional assumptions such as: general position
of $A$; distinctness of points or centers beyond what is stated; $u, v$ or
$z_i$ lying in a particular cap or cap interior; $\rho \neq r$ or
$\rho = r$; $|C| = 5$ exactly; $|A| = 12$ exactly; the radius classification
($\Phi$5) resolving to a preferred branch; the cap growth ($\Phi$6)
resolving to a preferred branch; or any unproved incidence bound.

**Branch B — exact realizability certificate (leaf is unprovable).** One
fixed configuration: a finite point set $A \subset \mathbb{R}^2$ with exact
algebraic coordinates (rational, or algebraic numbers given by explicit
minimal polynomials and isolating intervals), together with **all** packet
data — the Moser triangle, cap triple and surplus index, the system
$\Sigma$, the frontier data $(q_0, w_0, r$, splits$)$, the residual fields
of $R$, the surface data $\Phi$ including ingress and witness rows, $\rho$,
$u$, $v$, and both joint-deletion packets — satisfying **every** hypothesis
of that leaf, each verified exactly (symbolic arithmetic, not floating
point). This proves the leaf unprovable, kills this closure route, and is
**equally valuable** as Branch A; it must be reported as a success, not a
failure. The constructed object must satisfy every hypothesis of the
original statement — including convex independence (D2), the K4 property
(D3), minimality (D5), and no-(m,4,4) (S5) — symmetric to Branch A's
no-extra-hypotheses clause. Be aware of the consequence and state it
honestly if reached: since (D1)–(D3) are the hypotheses of a convex K4
configuration, a full Branch-B certificate contains a counterexample to
Erdős problem 97 itself, and (D5) additionally requires proving no smaller
one exists. A certificate is a certificate only when every one of these is
discharged.

The quantifier structure is essential in both branches: $\Sigma$, $F$, $R$,
$\Phi$, $J_1$, $J_2$ are existentially given data. Branch A must derive
$False$ for **every** admissible choice of this data; Branch B must exhibit
**some** admissible choice.

**Per-leaf note.** For Leaf B2, Branch A may proceed by three subcases of
(B2.5); all three must be closed. For Leaf B3, all four disjuncts of (B3.5)
must be closed; closing a strict subset of disjuncts is partial progress
only (§5). For Leaf B1, note (B1.2) and (B1.3) are formally independent
hypotheses even though (B1.2) follows from (B1.1) by the canonical-support
lemma (§6); a proof may derive one from the other, a certificate must
satisfy both.

## §4b Sanctioned reformulation (optional)

The survival equivalence (N5.1) may be used to translate freely between
"$E_4(A \smallsetminus w, \beta(x))$" and "$w \notin \mathrm{Row}(x)$" for
$x \in A$; this is proved and lossless. Any other reformulation (e.g.
graph-theoretic encodings of row incidences, or replacing full classes by
selected subsets) changes the objects and must be proved equivalent before
use; the exactness of $\mathrm{Row}$ and $\mathrm{Cl}$ — full circle
classes — must be preserved in any reformulation: a row is not an arbitrary
4-subset of a circle.

## §5 Insufficient-progress list

Partial progress does not count unless it implies exactly one of the two
resolutions of §4 for at least one leaf. In particular, the following are
insufficient:

* proofs under extra symmetry assumptions (e.g. $A$ symmetric under a
  reflection, $u, v$ symmetric about a bisector, an isoceles or regular
  sub-configuration) not derivable from the hypotheses;
* proofs under genericity assumptions ("in general position", "for a generic
  configuration", "the degenerate case can be ignored");
* sub-case-only arguments: closing one disjunct of (B2.5) or of (B3.5), one
  branch of ($\Phi$5) or ($\Phi$6), or the case $\rho = r$ only, without the
  remaining cases;
* numerical near-configurations: floating-point coordinates approximately
  satisfying the hypotheses, without exact symbolic verification of every
  equality $d(\cdot,\cdot) = \rho$ and every cardinality;
* a Branch-B candidate failing even one hypothesis — including the global
  ones (minimality (D5), no-(m,4,4) (S5)) and bookkeeping ones (packet
  inequalities (P3), overlap bounds (P5), the splits (F4)–(F6)) — is
  worthless for the certificate branch; report it only as computational
  evidence, never as a resolution;
* modified-configuration results: different cardinalities ($|\mathrm{Row}| \ne 4$,
  $|C| \le 4$, $|A| < 12$), non-strict versions where strict is stated
  ($\rho \ge 0$, $|C_s| \ge 4$), or $E_3$/$E_5$ in place of $E_4$;
* one-sided translations: proving the prose digest of a leaf while silently
  strengthening or dropping a stated hypothesis (faithfulness to §2 is the
  acceptance criterion);
* heuristic dimension or degrees-of-freedom counts ("the constraints
  outnumber the coordinates") without an exact algebraic elimination
  certificate;
* unverified interval-arithmetic or SMT output: solver claims of UNSAT/SAT
  over a real encoding without either a checkable certificate or an exact
  reconstruction of the argument;
* proofs that assume the answer to Erdős 97 (no convex K4 set exists) or any
  bound equivalent to it;
* conditional results ("if additionally every row meets $C$ in $\le 1$
  point, then...") whose side condition is not discharged;
* status reports, plans, or claims that a missing lemma is "routine";
* reducing a leaf to another unproved incidence, cap-counting, or
  equidistance statement of comparable strength (verbatim: reducing the
  problem to another unproved planar-metric-combinatorics statement of
  comparable strength).

## §6 Allowed background

Standard proved theorems from planar Euclidean geometry, convexity,
elementary combinatorics of finite sets, and algebraic geometry of circles
(radical axes, power of a point, resultants/Gröbner bases as proof devices)
may be used, but they must be stated accurately and applied with all
necessary hypotheses. In addition, the following project facts are proved
(kernel-checked, no `sorry`) and may be used as established background:

* **Perpendicular-bisector bound** (Dumitrescu L1 / Fox–Pach): for
  convex-independent $A$ and $p \neq q$ both in $A$:
  $|\{c \in A : d(c,p) = d(c,q)\}| \le 2$. It means precisely that at most
  two carrier points lie on the perpendicular bisector of any carrier edge.
  It does not bound bisector points off the carrier, and it requires
  $p, q \in A$.
* **Two-circle bound**: two circles with distinct centers share at most two
  points; consequently $|\mathrm{Row}(x) \cap \mathrm{Cl}(A, s, \rho')| \le 2$
  whenever $\beta(x) \neq s$, and any actual late row meets $C$ in at most
  two points: $|\mathrm{Row}(x) \cap C| \le 2$ for every $x \in A$ (using
  ($\Phi$2) for $\beta(x) \neq a_2$).
* **Survival equivalence** (N5.1), for $\Sigma$ and $\Sigma^{*}$.
* **Canonical-support lemma**: if $B$ is any exact 4-point equidistant row
  about $\beta(x)$ inside $(A \smallsetminus w) \smallsetminus \beta(x)$
  for some $w$, with $|B| = 4$, then $B = \mathrm{Row}(x)$; likewise equal
  blockers force equal rows: $\beta(x) = \beta(y) \Rightarrow \mathrm{Row}(x)
  = \mathrm{Row}(y)$.
* **Blocker two-cycle exclusion** (proved sibling of this family): under the
  common prefix, if $z_1 \neq z_2$, $\beta(z_1) \neq \beta(z_2)$, both
  $\neq a_2$, and
  $z_1 \in \mathrm{Row}(z_2)$, $z_2 \in \mathrm{Row}(z_1)$, then $False$ —
  via three distinct carrier points $a_2, \beta(z_1), \beta(z_2)$ on the
  bisector of $z_1 z_2$, contradicting the bisector bound. (Note its
  hypotheses differ from Leaf B1's: there the blockers are distinct; in B1
  they are equal.)
* **Late-system normalization**: $\beta(x) = a_1$ and $\mathrm{Row}(x) = T_1$
  for $x \in T_1$; $\beta(q_0) = a_1$.
* **Mutual omission with one original**: any joint deletion $J$ for $(u,v)$
  under the prefix satisfies: $u \notin \mathrm{Row}(z(J))$ and $z(J) \notin
  \mathrm{Row}(u)$, or the same with $v$.
* Cap-sum identity, cap membership pattern (N4), and elementary cardinality
  consequences ($|C_s| \ge 5$, $|A| \ge 5$, etc.).

These backgrounds do not imply any leaf by direct assembly; in particular
the two-circle bound gives $|\mathrm{Row}(z_1) \cap C| \le 2$, which is
consistent with (B1.4), not contradictory.

## §7 Multiagent orchestration block

Use multiagent aggressively and dynamically. You have up to 40 concurrent
agents available. Do not use a fixed assignment such as "N agents for
strategy X." Instead, manage the search using the following heuristics:

* Begin with a genuinely diverse portfolio of approaches. Agents should
  explore substantially different formulations, invariants, reductions,
  drawn from at least these families, mainstream to exotic:
  1. perpendicular-bisector and co-radiality counting (which carrier points
     are equidistant from which pairs; saturating the bisector bound);
  2. two-circles-meet-in-$\le 2$-points bookkeeping across the row/class
     incidence structure ($\mathrm{Row}(u), \mathrm{Row}(v),
     \mathrm{Row}(z_1), \mathrm{Row}(z_2), T_1, C$);
  3. cap/arc ordering on the convex shell: cyclic order of
     $u, v, z_1, z_2$, the centers, and the caps $C_s, P_1, P_2$; convex
     position forbidding chord/bisector configurations;
  4. distance-rigidity spindles: chains of equal distances forcing rigid
     sub-frameworks (Moser-spindle-style) inconsistent with convex
     independence;
  5. exact coordinate normalization + polynomial elimination: place $a_2$
     at the origin, $\rho = 1$, reduce hypotheses of a leaf to a polynomial
     system; decide emptiness by Gröbner bases / resultants / CAD on the
     reduced system (msolve, Singular);
  6. SMT encodings of the distance systems (Z3, cvc5 nonlinear real
     arithmetic), on both the full hypothesis set and adversarially chosen
     subsets, in both SAT-hunting and UNSAT-core modes;
  7. SAT/exact-cover encodings of the finite incidence skeleton (which
     points lie on which of the $\le 8$ named circles), enumerating
     incidence patterns consistent with the cardinality hypotheses before
     any metric realization is attempted;
  8. interval-arithmetic certification for promoting numerically found
     Branch-B candidates to exact algebraic ones (isolating boxes + exact
     polynomial verification);
  9. pigeonhole on row and cap occupancy: $|A| \ge 12$, cap growth
     ($\Phi$6), $|C| \ge 5$, rows of size 4 meeting $C$ in $\le 2$ points —
     occupancy accounting across $T_1$, $C$, and the caps;
  10. repeated-distance extremal counting on convex polygons (each distance
      about a fixed convex-position vertex, unit-distance style bounds);
  11. radical-axis / power-of-a-point identities among the named circles
      (the four centers of B3, the two joint rows of B1);
  12. deletion-survival calculus: systematic exploitation of (N5.1) to
      convert every membership hypothesis into a survival statement and
      hunt for a center forced to violate its own no-q-free condition;
  13. minimality leverage: attempts to build a strictly smaller convex K4
      configuration from the hypotheses (deleting a point whose rows are
      covered), contradicting (D5);
  14. small-configuration computational search for Branch B: randomized and
      structured search over convex polygons with $12 \le |A| \le 16$
      approximately satisfying the local hypotheses, then exact repair;
  15. computational sanity checks on every proposed intermediate lemma
      (random convex configurations, degenerate limits).
* Do not tell most agents the currently favored approach. Preserve
  independence during early rounds so that agents do not all converge to the
  same attractive but incomplete argument. The known attractor approaches to
  guard against: (i) re-running the proved blocker-two-cycle bisector
  argument, which does not apply verbatim (B1 has equal blockers; B2/B3
  lack the mutual row membership); (ii) pure cardinality bookkeeping from
  the two-circle bound, which is consistent with all stated cardinalities
  and cannot close any leaf alone; (iii) degrees-of-freedom counts
  concluding "overdetermined, hence contradiction" without an elimination
  certificate.
* Maintain an explicit registry of approach families. Group agents by the
  mathematical idea they are using, not by superficial wording. If many
  agents converge to one family, redirect some of them toward underexplored
  formulations.
* Do not allow one approach to dominate merely because it gives an elegant
  reformulation. A route that ends at an unproved incidence or cap-counting
  lemma equivalent in strength to the leaf is not close to completion unless
  it supplies a genuinely new proof of that lemma.
* When an approach stalls at a theorem-strength missing lemma, mark that
  route as blocked. Only continue assigning agents to it if someone proposes
  a materially new mechanism, invariant, construction, quantitative
  estimate, or exact algebraic identity.
* Keep several incompatible proof routes alive through multiple rounds.
  Maintain both Branch-A (proof of $False$) routes and Branch-B
  (realizability) routes for each leaf until one side is rigorously ruled
  out. Cross-pollinate ideas only after independent agents have developed
  them far enough to expose their real strengths and gaps.
* Use computational agents throughout. They should do exact small-case
  computation, SAT/SMT/Gröbner encodings, candidate configuration searches,
  and counterexample hunts against every proposed intermediate lemma.
  Computation is evidence unless it is converted into a rigorous general
  proof or an exact certificate completing a valid reduction. Always
  validate an encoding first with a smoke test against a known result
  (e.g. the encoding must reproduce the proved blocker-two-cycle exclusion
  and the two-circle bound).
* Search aggressively for counterexamples to proposed lemmas. Before any
  intermediate lemma is relied on, assign agents (computational where
  possible) to attempt to refute it. A found counterexample kills the route
  immediately and cheaply; a lemma that has survived no refutation attempt
  is not established.
* Use adversarial agents throughout — independent agents that did not
  produce the argument under audit. Every candidate proof or certificate
  must be checked for:
  * exact use of the counterexample bundle: (D1) nonemptiness, (D2) convex
    independence, (D3) the K4 property at **every** vertex, (D5) minimality
    not silently assumed away or silently invoked;
  * packet fidelity: Moser triangle non-obtuseness and MEC boundary
    membership, the cap membership pattern and arc invariant, $|C_s| > 4$,
    correct cyclic identification of $a_1, a_2, P_1, P_2$;
  * shell-system fidelity: rows are **full** classes of exactly 4 points
    containing their source; the no-q-free condition holds at every source;
    the late override at $T_1$ handled correctly ($\beta = a_1$ on $T_1$,
    unchanged off $T_1$);
  * frontier fidelity: $q_0, w_0$ in the marginal $M_r$, both survival
    facts, both splits (F4)/(F6) with the correct disjunct actually
    established;
  * residual fidelity: $|T_1| = 4$ exact, unique-radius (R5) quantifying
    over all $\rho > 0$, blocking (R6) for all four members, the interior
    pair and bisector localization (R7)–(R8);
  * surface fidelity: robustness ($\Phi$2) for **every** $z \in A$, the
    ingress data, both cap cardinalities, the classification ($\Phi$5) and
    growth ($\Phi$6) case actually in force;
  * joint-deletion fidelity: (J1)–(J6) for both $J_1, J_2$, including the
    CDP sub-fields (P1)–(P5);
  * leaf-specific hypotheses used exactly: (B1.1)–(B1.4) / (B2.1)–(B2.5) /
    (B3.5) with all disjuncts covered;
  * quantifier order: universally quantified data ($\Sigma, F, R, \Phi,
    J_i$) not instantiated to a convenient special form in Branch A;
  * every §5 item: no genericity, no symmetry, no sub-case-only closure, no
    numerical-only verification, no modified cardinalities, no conditional
    side conditions left open;
  * circular use of a statement equivalent to the leaf (or to Erdős 97) as
    the desired conclusion.
* Require agents to return concrete lemmas, constructions, equations, exact
  coordinate data, polynomial certificates, or counterexamples to proposed
  sublemmas. Reject status reports, vague optimism, and claims that an
  unproved incidence statement is "routine."
* The root agent should repeatedly synthesize, challenge, redirect, and
  launch new rounds. Do not stop after the first wave fails. Produce a
  complete solution only if it survives adversarial audit; otherwise report
  only the strongest rigorously proved derivation and its exact remaining
  gap.

**Per-leaf notes.** Leaf B1 is the most constrained (a single shared row
$K$ with $K \cap C = \{z_1, z_2\}$) and is the natural first target for
both the polynomial-elimination and bisector-saturation families. Leaf B2
splits into three point–center coincidence subcases with different
geometry ($z_1 = \beta(u)$ vs. $z_1 = \beta(z_2)$); treat them as separate
sub-registries. Leaf B3 is the widest (four survival squares); its fourth
square interacts with the cross packet (B2.4) and deserves dedicated
agents.

## §8 Anti-quit block

Do not return merely because current approaches fail or agents report
theorem-strength gaps. Continue launching new rounds, reopening blocked
approaches only when there is a genuinely new mechanism, and searching for
fresh formulations. Spend at least 5 full rounds of the approach portfolio
across the family — with every leaf attacked from at least 4 distinct
approach families, and at least one full computational round (encodings 5–8
of §7) per leaf — before even thinking of returning or giving up.

## §9 Return contract

Return only when at least one leaf has been completely resolved — a proof of
$False$ from that leaf's exact hypothesis list, or an exact realizability
certificate satisfying every hypothesis — and the argument survives
adversarial audit. Report per leaf: resolved (which branch, full argument or
full certificate) or not resolved (strongest rigorously proved derivation
and its exact remaining gap, stated as a precise mathematical statement).
Do not return a reduction, partial result, isolated missing lemma, finite
computation, numerical guess, "best effort" summary, or explanation of why
the problem is difficult.

Do not stop, return, or give up until you have found a complete and rigorous
resolution of at least one leaf. Continue exploring every plausible
approach, repairing failed arguments, and developing new ones until then;
after the first leaf resolves, continue on the remaining leaves with the
insight gained, and return the family status.

## §10 Web-search restriction

Public search may be used only for ordinary mathematical background or
standard named theorems (repeated distances in convex position,
perpendicular-bisector bounds, minimum enclosing circles, unit-distance
graphs), not to search for a solution to these exact statements or to
Erdős problem 97, and not to determine this family's open/closed status.
Do not search the public web merely to determine whether the problem is
open, and do not answer that it is open.

---

## Appendix — Lean mapping

### Leaf labels

| Leaf | Lean declaration | Location (file:line, `sorry` line) |
|---|---|---|
| B1 | `Problem97.ATailFrontierLiveClosure.false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:693` (sorry `:743`) |
| B2 | `Problem97.ATailFrontierLiveClosure.false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:1165` (sorry `:1234`) |
| B3 | `Problem97.ATailFrontierLiveClosure.false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:1240` (sorry `:1334`) |

No enclosing `section`/`variable` block adds hypotheses to these three
declarations; each hypothesis list in §2 is complete as stated.

### Math object → Lean structure

| §1 object | Lean name | Source |
|---|---|---|
| $E_4$ (N1) | `Erdos97.HasNEquidistantPointsAt 4` | `.lake/packages/formal_conjectures/FormalConjectures/ErdosProblems/97.lean:34` |
| $\mathrm{Cl}$ (N1) | `Problem97.SelectedClass` | `lean/Erdos9796Proof/P97/WitnessPacketInterface.lean:59` |
| ConvexIndep (N2) | `ConvexIndep` | `.lake/packages/formal_conjectures/FormalConjecturesForMathlib/Geometry/2d.lean:76` |
| $D$ (N3) | `Problem97.CounterexampleData` | `lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:83` |
| Minimality (D5) | `CounterexampleData.Minimal` | `lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:158` |
| $S$ (N4) | `Problem97.SurplusCapPacket` | `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:332` |
| MEC | `Problem97.MEC.mec` | `lean/Erdos9796Proof/P97/MEC/Basic.lean:275` |
| Moser triangle (MEC layer) | `Problem97.MEC.MoserTriangle` | `lean/Erdos9796Proof/P97/Moser/Triangle.lean:59` |
| Non-obtuse triangle (S2) | `Problem97.MEC.NonObtuseCircumscribedMoserTriangle` | `lean/Erdos9796Proof/P97/Moser/TriangleNonObtuse.lean:667` |
| Structural triangle | `Problem97.MoserTriangle` | `lean/Erdos9796Proof/P97/Cap/Structure.lean:98` |
| Cap triple (S3) | `Problem97.CapTriple` | `lean/Erdos9796Proof/P97/Cap/Structure.lean:161` |
| Arc predicate / $\sigma$ | `Problem97.OnArcOpposite`, `Problem97.signedArea2` | `lean/Erdos9796Proof/P97/Foundation.lean:57,49` |
| $a_1, a_2, C_s, P_1, P_2$ | `SurplusCapPacket.oppApex1/oppApex2/surplusCap/oppCap1/oppCap2` | `lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:297–318`, `Cap/PartitionFromMEC.lean:367–392` |
| Cap interiors | `SurplusCapPacket.capInteriorByIndex`, `oppIndex1/2` | `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:474,521,528` |
| (m,4,4) predicate (S5) | `SurplusCapPacket.IsM44` | `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:443` |
| $\Sigma$ (N5) | `Problem97.CriticalShellSystem` | `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1015` |
| Exact 4-point shell | `Problem97.CriticalFourShell` | `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:547` |
| Named shell | `Problem97.CriticalSelectedFourClass` | `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:635` |
| Selected 4-row (($\Phi$5) witnesses) | `Problem97.SelectedFourClass` | `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:405` |
| Survivor pair (F1)–(F3) | `ATailCriticalPairFrontier.SurvivorPairRelocationPacket` | `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean:288` |
| $F$ (N6) | `ATailCriticalPairFrontier.CriticalPairFrontier` | `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean:568` |
| $R$ (N7) | `ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual` | `lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/UniqueArmRouteAudit/OriginalUniqueResidualDispatch.lean:43` |
| $\Sigma^{*}$ (N8) | `ATailUniqueFourLateChoiceTerminalScratch.lateFirstApexSystem` (via `CriticalShellSystem.overrideExactSelectedClass`) | `.../Unique4LateChoiceTerminal/UniqueFourLateChoiceTerminal.lean:48`, `U1CarrierInjection.lean:1214` |
| $\mathrm{CDP}$ (N9) | `ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket` | `lean/Erdos9796Proof/P97/ATail/CommonDeletionTwoCenter.lean:29` |
| Packet witness row (P4) | `Problem97.U5QDeletedK4Class` (+ `CounterexampleData.skeleton`) | `lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean:243`, `U5ModeADeletion.lean:88` |
| $\Phi$ (N10) | `ExactFourPostCardElevenRobustSurface` | `lean/Erdos9796Proof/P97/ATail/ExactFourRobustCapExpansion.lean:280` |
| Ingress ($\Phi$1) | `ExactFourPhysicalCommonDeletionIngress` (+ `goodOutsideSources`, `outsideFirstApexFiber`, `badOutsideSources`, `actualBlockerFiber`) | `lean/Erdos9796Proof/P97/ATail/ExactFourPhysicalConsumer.lean:421,79–109`, `ATail/SurvivalCover.lean:40` |
| Robustness ($\Phi$2) | `ATailDeletionRobustness.FullyDeletionRobustAt` | `lean/Erdos9796Proof/P97/ATail/DeletionRobustness.lean:27` |
| Classification ($\Phi$5) | `DeletionRobustRadiusClassification` | `lean/Erdos9796Proof/P97/ATail/ExactFourRobustCapExpansion.lean:123` |
| Cap growth ($\Phi$6) | `ExactFourRobustCapGrowth` (+ two growth profiles) | `lean/Erdos9796Proof/P97/ATail/ExactFourRobustCapExpansion.lean:250–276` |
| $J$ (N11) | `ATailFrontierLiveClosure.ExactFourMutualOmissionJointDeletion` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:88` |
| Bisector bound (§6) | `Problem97.Dumitrescu.perpBisector_apex_bound` | `lean/Erdos9796Proof/P97/Dumitrescu/L1.lean:128` |
| Survival equivalence (N5.1) | `cross_deletion_survives_iff_not_mem_selected_support` | `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean:755` |
| Row ∩ class $\le 2$ (§6) | `actualLateRow_secondClass_card_le_two` | `lean/Erdos9796Proof/P97/ATail/ExactFourRobustCapExpansion.lean:383` |
| Two-cycle exclusion (§6) | `false_of_exactFour_twoDeletion_blockerTwoCycle` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:747` |
| Canonical-support lemma (§6) | `qDeletedRow_at_actualBlocker_eq_canonicalSupport`, `selectedSupports_eq_of_actualBlockers_eq` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:1110`, `ATail/SurvivalCover.lean:48` |
| B3 split producer (§2 note) | `exactFour_fourSurvivingCenters_survivalSquare_split` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:930` |
| Mutual omission w/ one original (§6) | `exactFour_jointDeleted_mutualOmission_with_one_original` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:1047` |
