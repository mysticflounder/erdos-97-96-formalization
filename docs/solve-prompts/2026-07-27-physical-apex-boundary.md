# Family C — Physical-apex boundary leaves: complete-resolution prompt

> **Status refresh (2026-08-28): HISTORICAL PROMPT SNAPSHOT.** The two named
> declarations remain relevant, but their current source is
> `FrontierLiveClosure/Rigid221Closure.lean` (near lines 53 and 392), not the
> monolith or line anchors below. Refresh statements and spine reachability
> before dispatch.

Two leaf obligations from
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean` (both goals are
`False`):

* **Leaf C1** — `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU`
  (declaration at `:5430`, `sorry` at `:5479`);
* **Leaf C2** — `false_of_exactFourMutualOmissionRigid221_nonphysicalCollision`
  (declaration at `:5602`, `sorry` at `:5645`).

Both leaves are top-level theorems in namespace
`Problem97.ATailFrontierLiveClosure`; neither sits inside a `section` /
`variable` / `include` block, so the hypothesis lists below are complete as
written in the declarations. Every structure appearing in a hypothesis has
been unfolded recursively into plain planar-metric mathematics; the only
interface-level assumptions (global minimality, no-`(m,4,4)`-repackaging) are
stated precisely in prose where they occur.

---

## §1 Notation preamble

Define every symbol before the problem appears. No access to any external
problem page is assumed.

* $\mathbb{R}^2$ — the Euclidean plane, $d(x,y)$ the Euclidean distance.
  Points are written $x, y, z, \dots$; all point sets are finite.
* $A \subset \mathbb{R}^2$ — a fixed finite point set (the *carrier*),
  $|X|$ — cardinality of a finite set $X$.
* **Circle class.** For $p \in \mathbb{R}^2$ and $r \in \mathbb{R}$,
  $$\Gamma(p, r) \;:=\; \{\, z \in A : d(p, z) = r \,\}.$$
  (Lean: `SelectedClass A p r`.) Note $r$ is an arbitrary real; for
  $r \le 0$ the class is empty or (for $r=0$) at most $\{p\}\cap A$.
* **K4 witness predicate.** For a finite $B \subseteq \mathbb{R}^2$ and
  $p \in \mathbb{R}^2$,
  $$K4(B, p) \;:\Longleftrightarrow\; \exists\, r > 0 :\;
    |\{\, z \in B : d(p, z) = r \,\}| \ge 4.$$
  (Lean: `HasNEquidistantPointsAt 4 B p`.) The four points are at a *common
  positive* distance from $p$; since $r > 0$, $p$ itself never counts.
* **K4 property.** $A$ has the K4 property iff $K4(A, p)$ holds for every
  $p \in A$. (Lean: `HasNEquidistantProperty 4 A`.)
* **Convex independence.** $A$ is *convex-independent* iff every point of
  $A$ is an extreme point of the convex hull of $A$ (no point of $A$ lies in
  the convex hull of the others). (Lean: `ConvexIndep A`, mathlib's
  `EuclideanGeometry.ConvexIndep` on the coerced set.)
* $A \setminus \{x\}$, $A \setminus D_0$ — set difference (Lean:
  `Finset.erase`, `Finset.sdiff`).
* **Signed area.** $\mathrm{sa}(v, v_j, v_k) := (v_j^x - v^x)(v_k^y - v^y) -
  (v_k^x - v^x)(v_j^y - v^y)$ (twice the oriented triangle area).
* **Closed-arc predicate.** $\mathrm{OnArcOpp}(v_i, v_j, v_k; v)
  :\Longleftrightarrow \mathrm{sa}(v, v_j, v_k)\cdot\mathrm{sa}(v_i, v_j, v_k)
  \le 0$ — "$v$ lies on the closed side of chord $v_jv_k$ opposite $v_i$"
  (equality = on the chord; the closed-cap convention).
* **MEC.** The minimum enclosing circle of $A$ (unique smallest closed disk
  containing $A$), with its center and radius.

### Moser/cap data (the packet $S$)

The carrier is equipped with the following data (Lean: `SurplusCapPacket`):

* $A$ is nonempty and not collinear.
* A **Moser triangle**: three pairwise-distinct points
  $v_1, v_2, v_3 \in A$, each lying on the boundary circle of the MEC of
  $A$, with all three vertex angles non-obtuse:
  $\langle v_j - v_i,\, v_k - v_i \rangle \ge 0$ for each permutation
  $\{i,j,k\} = \{1,2,3\}$ (inner products in $\mathbb{R}^2$). The triangle
  is in the *circumscribed* branch of the Sylvester dichotomy (three
  distinct MEC-boundary vertices, not the diameter case).
* A **cap triple** $C_1, C_2, C_3 \subseteq A$ (closed caps): for each
  $i$, with $\{i,j,k\} = \{1,2,3\}$,
  $C_i = \{\, z \in A : \mathrm{OnArcOpp}(v_i, v_j, v_k; z)\,\}$
  restricted membership-wise so that $v_i \notin C_i$,
  $v_j, v_k \in C_i$, every non-Moser point of $A$ lies in exactly one cap,
  and every point of $A$ lies in some cap. Consequently
  $|C_1| + |C_2| + |C_3| = |A| + 3$.
* A **surplus index** $s \in \{0,1,2\}$ (caps indexed $C_1, C_2, C_3$ by
  $0,1,2$) with $|C_{s}| > 4$ where by abuse $C_s$ denotes the cap selected
  by the index. Named projections (cyclic in $s$):
  * $\mathrm{sC}$ — the **surplus cap** (the cap at index $s$);
  * $\hat C_1, \hat C_2$ — the two **opposite caps** (the caps at the next
    two cyclic indices, Lean `oppCap1`, `oppCap2`);
  * $a_1, a_2$ — the **opposite apices**: the Moser vertex carrying the same
    index as $\hat C_1$ resp. $\hat C_2$ (Lean `oppApex1`, `oppApex2`; cap
    $C_i$ is *opposite* vertex $v_i$, and $v_i \in \mathrm{sC}$ for both
    opposite apices);
  * $i_1, i_2$ — the cap indices of $\hat C_1, \hat C_2$ (Lean
    `oppIndex1`, `oppIndex2`).
* **Strict cap interior.** $C_i^{\circ}$ := $C_i$ minus its two endpoint
  Moser vertices (the two vertices $v_j, v_k$, $j,k \ne i$). (Lean:
  `capInteriorByIndex i`.) Write $\hat C_2^{\circ} := C_{i_2}^{\circ}$ for
  the strict interior of the second opposite cap.

### Blocker systems

* **Base blocker system $H$** (Lean: `CriticalShellSystem A`): an
  assignment, to each $x \in A$, of
  * a **blocker center** $c(x) \in A \setminus \{x\}$,
  * a **row radius** $r(x) > 0$,
  * the **row (support)** $\Sigma(x) := \Gamma(c(x), r(x))$, which is
    required to satisfy $|\Sigma(x)| = 4$ and $x \in \Sigma(x)$
    ($\Sigma(x)$ is the *entire* circle class of $A$ at that center and
    radius, not a chosen 4-subset), together with an (automatically
    satisfiable) enumeration of its four elements by distinct labels;
  * **blocking:** $\neg K4(A \setminus \{x\},\, c(x))$ — after deleting
    $x$, *no* positive radius carries $\ge 4$ points of
    $A \setminus \{x\}$ around $c(x)$.
* **Late system $H'$** (Family C only; Lean: `lateFirstApexSystem R`, a
  *defined* object, not a hypothesis): given the exact-four data of §2.4
  below, $H'$ is the modification of $H$ defined by
  $$H'(x) \;=\; \begin{cases}
    \bigl(c'(x), \Sigma'(x)\bigr) = \bigl(a_1,\; \Gamma_1\bigr)
      & \text{if } x \in \Gamma_1 := \Gamma(a_1, \rho_0), \\[2pt]
    \bigl(c(x), \Sigma(x)\bigr) & \text{otherwise,}
  \end{cases}$$
  where $\rho_0$ is the frontier radius of §2.3. On the class
  $\Gamma_1$ the row radius is $\rho_0$ and the support is the whole class
  $\Gamma_1$ (this is well-defined by hypotheses (C3.4)–(C3.6) below); off
  the class, $H'$ agrees with $H$ in every component. Throughout, $c'(x)$
  and $\Sigma'(x)$ denote the center and support assigned by $H'$.

### Common-deletion certificates

* **Two-center common-deletion certificate** (Lean:
  `CommonDeletionTwoCenterPacket D G x p_1 p_2`, relative to a blocker
  system $G$): data consisting of
  1. $x \in A$, $p_1 \in A$, $p_2 \in A$, $p_1 \ne p_2$;
  2. $K4(A \setminus \{x\}, p_1)$ and $K4(A \setminus \{x\}, p_2)$;
  3. $c_G(x) \ne p_1$ and $c_G(x) \ne p_2$, where $c_G(x)$ is the blocker
     center that $G$ assigns to $x$;
  4. finite sets $B_1, B_2$ with, for $i = 1, 2$:
     $B_i \subseteq (A \setminus \{x\}) \setminus \{p_i\}$, $|B_i| = 4$,
     $x \notin B_i$, and a radius $t_i > 0$ with $d(p_i, y) = t_i$ for all
     $y \in B_i$ ($B_i$ is a chosen 4-subset, *not* required to be the full
     class);
  5. $|B_1 \cap B_2| \le 2$.

  Write $\mathrm{CD}_G(x;\, p_1, p_2)$ for this bundle.
* **Minimal-deletion core** (Lean:
  `ATAILStageOneMinimalDeletionCore.MinimalDeletionCore A U p`): for a
  finite $U \subseteq \mathbb{R}^2$ and center $p$: for each $s \in U$ a
  radius $t_s > 0$ with $p \in A \setminus \{s\}$,
  $\Sigma_s := \Gamma(p, t_s)$, $|\Sigma_s| = 4$, $s \in \Sigma_s$;
  and for $s \ne t$ in $U$ the supports are disjoint:
  $\Sigma_s \cap \Sigma_t = \emptyset$.

### Global interface assumptions (stated in full)

* **Minimality** (Lean: `D.Minimal`): for **every** finite nonempty
  convex-independent $B \subset \mathbb{R}^2$ with the K4 property,
  $|A| \le |B|$. This quantifies over all such sets in the plane, not
  merely over subsets of $A$.
* **No $(m,4,4)$ repackaging** (Lean: `noM44`): there is **no** packet of
  Moser/cap data on the *same* carrier $A$ (any non-obtuse circumscribed
  MEC Moser triangle on $A$, any valid cap triple over it, any surplus
  designation, satisfying all bullet points of the packet definition above)
  whose two opposite caps both have exactly $4$ points.

---

## §2 Problem statement

Resolve the following two leaf obligations completely. Each leaf asserts
that a certain hypothesis bundle is contradictory (`False`). The
hypotheses are enumerated exhaustively below; the two leaves share the
stack (C0)–(C8) and differ only in their final hypotheses (C9) vs (C10).
**Faithfulness note:** every numbered line below is a hypothesis actually
present in (or a field of a structure argument of) the Lean declaration;
none may be dropped, merged, weakened, or strengthened. Lean field names
are given in parentheses.

### 2.1 (C0) Base configuration

* (C0.1) $A \subset \mathbb{R}^2$ finite, nonempty (`D.nonempty`).
* (C0.2) $A$ convex-independent (`D.convex`).
* (C0.3) $A$ has the K4 property: $\forall p \in A,\ K4(A, p)$ (`D.K4`).
* (C0.4) $A$ carries Moser/cap packet data $S$ as in §1 (triangle
  $v_1v_2v_3$, caps $C_1,C_2,C_3$, surplus index, projections
  $\mathrm{sC}, \hat C_1, \hat C_2, a_1, a_2, i_1, i_2$) (`D.packet` is a
  packet on $A$; the leaf's $S$ is a possibly different packet on the same
  $A$ — all hypotheses below refer to this $S$).
* (C0.5) $12 \le |A|$ (`_hcard`).

### 2.2 (C1) Base blocker system

* (C1.1) $H$ is a blocker system on $A$ as in §1: for every $x \in A$,
  $c(x) \in A\setminus\{x\}$, $r(x) > 0$,
  $\Sigma(x) = \Gamma(c(x), r(x))$, $|\Sigma(x)| = 4$, $x \in \Sigma(x)$,
  and $\neg K4(A \setminus \{x\}, c(x))$.

### 2.3 (C2) Frontier packet $F$ at radius $\rho_0$

There are a real $\rho_0$ (Lean: the implicit `radius`) and two points
$\bar q, \bar w$ (Lean: `F.pair.q`, `F.pair.w`) with:

* (C2.1) $\bar q, \bar w \in A$, $\bar q \ne \bar w$; both lie in the
  **first-apex marginal**
  $M := \{\, x \in A : d(x, a_1) = \rho_0 \,\} \setminus \mathrm{sC}$
  (`q_mem_marginal`, `w_mem_marginal`).
* (C2.2) $K4(A \setminus \{\bar q\}, a_2)$ and
  $K4(A \setminus \{\bar w\}, a_2)$ (`q_survives`, `w_survives`).
* (C2.3) $c(\bar q) \ne a_2$ and $c(\bar w) \ne a_2$
  (`q_blocker_ne_oppApex2`, `w_blocker_ne_oppApex2`).
* (C2.4) First-apex split (`F.firstApexSplit`):
  $K4\bigl((A\setminus\{\bar q\})\setminus\{\bar w\},\, a_1\bigr)$ **or**
  $\bigl(\,|\Gamma(a_1,\rho_0)| \in \{4,5\}$ and
  $\forall \rho > 0:\ 4 \le |\Gamma(a_1,\rho)| \Rightarrow \rho = \rho_0
  \bigr)$.
* (C2.5) Second-apex double survival (`F.secondApexDouble`):
  $K4\bigl((A\setminus\{\bar q\})\setminus\{\bar w\},\, a_2\bigr)$.
* (C2.6) Second-apex split (`F.secondApexSplit`):
  $K4\bigl((A\setminus\{\bar q\})\setminus\{\bar w\}, a_2\bigr)$ **or**
  there exist full-class certificates at $(\bar q, a_2)$ and
  $(\bar w, a_2)$: radii $t_q, t_w > 0$ with
  $t_q = d(a_2, \bar q)$, $t_w = d(a_2, \bar w)$, the classes
  $\Gamma(a_2, t_q) \ni \bar q$, $\Gamma(a_2, t_w) \ni \bar w$ each of
  cardinality exactly $4$, and
  $\Gamma(a_2,t_q) \cap \Gamma(a_2,t_w) = \emptyset$.
  (Given (C2.5) the left disjunct holds; the disjunction is retained for
  faithfulness. The Lean certificates carry two further fields not listed
  here because they are automatically satisfiable/derivable: four distinct
  labels enumerating each class, which any 4-set admits, and center
  membership $a_2 \in A \setminus \{\bar q\}$, which follows since
  $a_2 \in A$ is packet data and $a_2 \ne \bar q$ from radius positivity.)

Derived (not a hypothesis): $\rho_0 > 0$, since $a_1 \in \mathrm{sC}$
while $\bar q \notin \mathrm{sC}$, so $\bar q \ne a_1$ and
$\rho_0 = d(\bar q, a_1) > 0$.

### 2.4 (C3) Exact-four residual $R$

Write $\Gamma_1 := \Gamma(a_1, \rho_0)$.

* (C3.1) Minimality of $A$, as in §1 (`R.minimal`).
* (C3.2) No $(m,4,4)$ repackaging of $A$, as in §1 (`R.noM44`).
* (C3.3) $9 < |A|$ (`R.carrier_card_gt_nine`).
* (C3.4) $|\Gamma_1| = 4$ (`R.class_card_eq_four`).
* (C3.5) Unique K4 radius at the first apex:
  $\forall \rho > 0:\ 4 \le |\Gamma(a_1, \rho)| \Rightarrow \rho = \rho_0$
  (`R.unique_K4_radius`).
* (C3.6) Every class member blocks:
  $\forall x \in \Gamma_1:\ \neg K4(A \setminus \{x\},\, a_1)$
  (`R.every_class_member_blocks`).
* (C3.7) An **interior pair**: two distinct points
  $q_I \ne w_I$, both in $\Gamma_1 \cap C_{i_1}^{\circ}$
  (`R.interior_q`, `R.interior_w`, `R.interior_q_mem`,
  `R.interior_w_mem`, `R.interior_q_ne_w`).
* (C3.8) Bisector localization: every $c \in A$ with $c \ne a_1$ and
  $d(c, q_I) = d(c, w_I)$ lies in $C_{i_1}^{\circ}$
  (`R.bisector_center_mem_interior`).

The late system $H'$ of §1 is defined from (C3.4) and (C3.6); its two
defining facts (derived, not hypotheses) are: $c'(x) = a_1$ and
$\Sigma'(x) = \Gamma_1$ for every $x \in \Gamma_1$; $c'(x) = c(x)$ and
$\Sigma'(x) = \Sigma(x)$ for every $x \in A \setminus \Gamma_1$. In
particular $c'(\bar q) = a_1$ (since $\bar q \in \Gamma_1$ by (C2.1)).

### 2.5 (C4) Post-card-eleven robust surface

* (C4.1) **Ingress** (`surface.ingress`): there exist
  $x^{\dagger} \in \{\bar q, \bar w\}$ and a vertex
  $\sigma^{\dagger} \in A$ such that
  * $c'(\sigma^{\dagger}) \ne c'(\bar q)$
    ($\sigma^{\dagger}$ is outside the late blocker fiber of $\bar q$;
    by §2.4 this is equivalent to $c'(\sigma^{\dagger}) \ne a_1$);
  * $K4(A \setminus \{\bar q\},\, c'(\sigma^{\dagger}))$ **or**
    $K4(A \setminus \{\bar w\},\, c'(\sigma^{\dagger}))$
    ($\sigma^{\dagger}$ is a *good* outside source);
  * $c'(\sigma^{\dagger}) \ne a_2$;
  * a certificate
    $\mathrm{CD}_{H'}\bigl(x^{\dagger};\; c'(\sigma^{\dagger}),\, a_2\bigr)$
    as in §1.
* (C4.2) Second-apex full robustness (`surface.secondApex_robust`):
  $\forall z \in A:\ K4(A \setminus \{z\},\, a_2)$.
* (C4.3) $4 \le |\hat C_1|$ (`surface.firstOppCap_card_ge_four`).
* (C4.4) $5 \le |\hat C_2|$ (`surface.secondOppCap_card_ge_five`).
* (C4.5) Radius classification at $a_2$
  (`surface.radiusClassification`): **either**
  (i) $\exists r > 0$ with $5 \le |\Gamma(a_2, r)|$; **or**
  (ii) there exist $\varrho_1, \varrho_2 > 0$, $\varrho_2 \ne \varrho_1$,
  with $4 \le |\Gamma(a_2,\varrho_1)|$, $4 \le |\Gamma(a_2,\varrho_2)|$,
  such that $|\Gamma(a_2, r)| < 5$ for **every** $r > 0$, together with two
  4-point sets $S_1 \subseteq \Gamma(a_2,\varrho_1)$,
  $S_2 \subseteq \Gamma(a_2,\varrho_2)$, $|S_1| = |S_2| = 4$,
  $a_2 \notin S_1 \cup S_2$, $S_1 \cap S_2 = \emptyset$.
* (C4.6) Cap growth trichotomy (`surface.capGrowth`): **either**
  (a) $6 \le |\mathrm{sC}|$; **or**
  (b) $|\mathrm{sC}| = 5$, $5 \le |\hat C_1|$, and
  $|\hat C_1| + |\hat C_2| + 2 = |A|$; **or**
  (c) $|\mathrm{sC}| = 5$, $|\hat C_1| = 4$, $6 \le |\hat C_2|$, and
  $|\hat C_2| + 6 = |A|$.

### 2.6 (C5) Leaf parameters

* (C5.1) A real $\rho$ with $\rho > 0$ (`rho`, `_hrho`). Write
  $\Gamma_2 := \Gamma(a_2, \rho)$.
* (C5.2) $5 \le |\Gamma_2|$ (`_hfive`).
* (C5.3) $|\Gamma_2| = 5$ (`_hclassFive`).
* (C5.4) Vertices $\mathrm{source}, \mathrm{other}, u, v \in A$ with
  $u \ne v$ (`source`, `other`, `u`, `v`, `_huNeV`).
* (C5.5) $u, v \in \Gamma_2$ (`_huClass`, `_hvClass`).
* (C5.6) Mutual omission from the late rows: $v \notin \Sigma'(u)$ and
  $u \notin \Sigma'(v)$ (`_hvOmitted`, `_huOmitted`).

### 2.7 (C6) Source-row context (`_context`)

* (C6.1) $\mathrm{source} \in \Gamma_2$ (`source_mem_class`).
* (C6.2) $\mathrm{source} \in \hat C_2^{\circ}$ (`source_mem_interior`).
* (C6.3) $c'(\mathrm{source}) \ne c'(\bar q)$ (`source_mem_outside`;
  equivalently $c'(\mathrm{source}) \ne a_1$, since
  $c'(\bar q) = a_1$).
* (C6.4) $\bigl|\Sigma'(\mathrm{source}) \cap
  (\Gamma_2 \cap \hat C_2^{\circ})\bigr| \le 2$
  (`source_cross_card_le_two`).
* (C6.5) $\mathrm{other} \ne \mathrm{source}$ (`other_ne_source`).
* (C6.6) $\mathrm{other} \in \Gamma_2$ and
  $\mathrm{other} \in \hat C_2^{\circ}$
  (`other_mem_class`, `other_mem_interior`).
* (C6.7) $\mathrm{other} \notin \Sigma'(\mathrm{source})$
  (`other_not_mem_source_row`).
* (C6.8) $c'(\mathrm{source}) \ne c'(\mathrm{other})$
  (`source_other_blockers_ne`).
* (C6.9) $K4(A \setminus \{q_I\},\, c'(\mathrm{source}))$ **or**
  $K4(A \setminus \{w_I\},\, c'(\mathrm{source}))$
  (`source_survives_q_or_w`; $q_I, w_I$ are the interior pair of (C3.7),
  **not** $\bar q, \bar w$).
* (C6.10) $\mathrm{source} \in \Sigma'(u)$ (`source_mem_u_row`).
* (C6.11) $v \notin \Sigma'(\mathrm{source})$ (`v_not_mem_source_row`).
* (C6.12) $u = \mathrm{source}$ **or** $u \notin \Sigma'(\mathrm{source})$
  (`u_eq_source_or_not_mem_source_row`).

### 2.8 (C7) Joint deletion (`jointDeletion`)

There is a vertex $z^{\star} \in A$ (`jointDeletion.deleted`) with:

* (C7.1) $z^{\star} \in \Gamma_2$ (`deleted_mem_class`).
* (C7.2) $z^{\star} \ne u$ and $z^{\star} \ne v$
  (`deleted_ne_u`, `deleted_ne_v`).
* (C7.3) $z^{\star} \notin \Sigma'(u)$ and $z^{\star} \notin \Sigma'(v)$
  (`deleted_not_mem_uRow`, `deleted_not_mem_vRow`).
* (C7.4) $c'(u) \ne c'(v)$ (`blockers_ne`).
* (C7.5) A certificate
  $\mathrm{CD}_{H'}\bigl(z^{\star};\; c'(u),\, a_2\bigr)$ (`uPacket`).
  Unfolded: $z^{\star}, c'(u), a_2 \in A$; $c'(u) \ne a_2$;
  $K4(A\setminus\{z^{\star}\}, c'(u))$ and
  $K4(A\setminus\{z^{\star}\}, a_2)$;
  $c'(z^{\star}) \ne c'(u)$ and $c'(z^{\star}) \ne a_2$; 4-point sets
  $B_1 \subseteq (A\setminus\{z^{\star}\})\setminus\{c'(u)\}$,
  $B_2 \subseteq (A\setminus\{z^{\star}\})\setminus\{a_2\}$ on positive
  radii around $c'(u)$ resp. $a_2$, with $|B_1 \cap B_2| \le 2$.
* (C7.6) A certificate
  $\mathrm{CD}_{H'}\bigl(z^{\star};\; c'(v),\, a_2\bigr)$ (`vPacket`),
  unfolded analogously with $c'(v)$ in place of $c'(u)$.

### 2.9 (C8) Rigid $2{+}2{+}1$ global deletion (`globalDeletion`)

Write $I_u := \Sigma'(u) \cap \Gamma_2$ and
$I_v := \Sigma'(v) \cap \Gamma_2$. There are a point
$P \in \mathbb{R}^2$ (`globalDeletion.center`) and a finite set
$D_0 \subseteq \mathbb{R}^2$ (`globalDeletion.deleted`) with:

* (C8.1) Rigid partition (`rigid`): $|I_u| = 2$, $|I_v| = 2$,
  $I_u \cap I_v = \emptyset$, and
  $\Gamma_2 = \{z^{\star}\} \cup I_u \cup I_v$.
* (C8.2) $P \in A \setminus \Gamma_2$ (`center_mem_remaining`).
* (C8.3) $D_0 \ne \emptyset$, $D_0 \subseteq \Gamma_2$, $|D_0| \le 5$
  (`deleted_nonempty`, `deleted_subset_class`, `deleted_card_le_five`).
* (C8.4) Blocking: $\neg K4(A \setminus D_0,\, P)$ (`blocked`).
* (C8.5) Restoration: for every $s \in D_0$,
  $K4\bigl(A \setminus (D_0 \setminus \{s\}),\, P\bigr)$ (`restores`).
* (C8.6) Geometry dichotomy (`geometry`): **either**
  (i) $\exists s, t \in D_0$, $s \ne t$, with $d(P, s) = d(P, t)$
  (an equal-radius **collision** inside the deleted set); **or**
  (ii) a minimal-deletion core for $(A, D_0, P)$ as in §1: for each
  $s \in D_0$ a radius $t_s > 0$ with $\Gamma(P, t_s) \ni s$,
  $|\Gamma(P, t_s)| = 4$, and these classes pairwise disjoint across
  distinct $s, t \in D_0$. (As in (C2.6), each Lean certificate also
  carries four distinct enumerating labels and center membership
  $P \in A \setminus \{s\}$ — derivable from (C8.2) and
  $P \notin \Gamma_2 \supseteq D_0$ — omitted here as automatic.)

### 2.10 Leaf C1 — final hypotheses and goal

In addition to (C0)–(C8):

* (C9.1) $P = a_2$ (`_hcenter`).
* (C9.2) $c'(\mathrm{source}) \in \Gamma_2$ (`_hsourceBlockerClass`).
* (C9.3) $u \ne \mathrm{source}$ (`_huNeSource`).
* (C9.4) Placement (`_hsourceBlockerPlacement`):
  $$c'(\mathrm{source}) = z^{\star}
    \;\lor\; c'(\mathrm{source}) = u
    \;\lor\; c'(\mathrm{source}) \in \Sigma'(v) \cap \Gamma_2 .$$

**Goal (Leaf C1):** derive `False` — prove that no configuration
satisfies (C0)–(C9) simultaneously, or produce one that does (§4).

### 2.11 Leaf C2 — final hypotheses and goal

In addition to (C0)–(C8) (the hypotheses (C9.2)–(C9.4) are **absent**):

* (C10.1) $P \ne a_2$ (`_hcenter`).
* (C10.2) Collision (`_hcollision`):
  $\exists s, t \in D_0$, $s \ne t$, with $d(P, s) = d(P, t)$.
  (This selects the left arm of (C8.6) explicitly; both remain available.)

**Goal (Leaf C2):** derive `False` — prove that no configuration
satisfies (C0)–(C8) + (C10) simultaneously, or produce one that does
(§4).

### Edge conventions

* All classes $\Gamma(p, r)$ are subsets of $A$; membership statements like
  $u \in \Gamma_2$ carry both $u \in A$ and $d(a_2, u) = \rho$.
* $u, v, \mathrm{source}, \mathrm{other}, z^{\star}$ are points *of $A$*
  (Lean `CarrierVertex`); equalities/inequalities between them are point
  equalities.
* In (C8), $D_0$ is a *set*; $z^{\star}$ in (C7) is a *point*. They are
  independent data except through (C8.1) and (C8.3): $D_0 \subseteq
  \Gamma_2 = \{z^{\star}\} \cup I_u \cup I_v$.
* $\neg K4$ statements quantify over **all** positive radii, not just those
  named elsewhere.
* Quantifier order in (C3.5), (C4.2), (C8.5) is essential and as written.

---

## §3 Assume-solvable framing

Assume for purposes of this task that each leaf admits a complete
resolution, but do not assume in advance which branch holds. A complete
resolution of a leaf must establish exactly one of the two statements in
§4. The two leaves are independent tasks; resolving one does not resolve
the other, and the branches may differ between the leaves.

## §4 Dual-branch success criteria

**Branch A (proof of `False` — closes the leaf).** A complete, rigorous
proof that the hypothesis bundle of the leaf is contradictory: from
(C0)–(C9) (Leaf C1) resp. (C0)–(C8)+(C10) (Leaf C2), derive `False`.
The proof must:

* use only the stated hypotheses plus standard proved theorems (§6);
* treat **every** disjunctive hypothesis by complete case analysis —
  in particular (C2.4), (C2.6), (C4.1)'s $x^{\dagger}$ and its survival
  disjunct, (C4.5) (i)/(ii), (C4.6) (a)/(b)/(c), (C6.9), (C6.12),
  (C8.6) (i)/(ii), and for Leaf C1 the three-way placement (C9.4);
* introduce no additional assumptions — no genericity, no distinctness
  beyond that stated, no symmetric or concyclic special position, no
  rationality of coordinates, no assumption that $H$ or $H'$ has any
  property beyond those listed, and no strengthening of the interface
  assumptions (minimality is available exactly as stated, nothing more);
* be formalizable in Lean 4 over mathlib in the project's terms (finite
  sets in $\mathbb{R}^2$, `dist`, `Finset` cardinalities); an argument
  relying on unformalized "continuity" or "general position" devices does
  not qualify.

**Branch B (exact realizability certificate — kills the route).** One
**fixed** configuration: a finite point set $A$ with exact algebraic
coordinates (rational, or algebraic with exact minimal-polynomial data),
together with explicit exact choices of *all* quantified data — the Moser
triangle, the cap triple, the surplus index, the blocker system $H$
(center, radius, and full 4-class for every $x \in A$, with the blocking
condition verified), $\rho_0$, $\bar q$, $\bar w$, the residual data of
(C3), the surface data of (C4) including the ingress vertex and both
common-deletion certificates, $\rho$, $\mathrm{source}$, $\mathrm{other}$,
$u$, $v$, $z^{\star}$, and $(P, D_0)$ — such that **every** hypothesis of
the leaf, including the global interface assumptions, is satisfied, with
every equality and inequality of distances verified exactly (symbolic
algebra, not floating point). Such a certificate proves the leaf
unprovable and kills the parent route; it is **equally valuable** as
branch A and must be reported as a route-killing result, not as a failure.

Note the honest scope of branch B: hypothesis (C3.1) is global minimality,
so a certificate must also prove that no finite nonempty
convex-independent K4 configuration in the plane has fewer points than the
exhibited $A$; and (C3.2) requires proving no $(m,4,4)$ repackaging of the
exhibited $A$ exists. These are part of the hypothesis list; a
configuration lacking them certifies nothing (§5).

The quantifier structure is essential in both branches: branch A must
refute *every* configuration, branch B must exhibit *one* configuration
satisfying *all* hypotheses. It is insufficient to exhibit different
partial configurations for different hypothesis subsets, or to present
approximate/numerical configurations at any precision.

## §4b Sanctioned reformulations (optional)

* **Coordinate normalization.** Both branches may place $a_2$ at the
  origin and scale $\rho = 1$ (similarity invariance of every hypothesis:
  all conditions are equalities/inequalities of distances, cardinalities,
  memberships, and signed-area sign conditions, all preserved by
  similitude). This must be stated and used correctly: reflections also
  preserve everything; do not quotient by more than the similarity group.
* **Leaf C1 local picture.** Under (C5.3), (C8.1): $\Gamma_2$ is a
  5-point set partitioned as $\{z^{\star}\} \sqcup I_u \sqcup I_v$ with
  $|I_u| = |I_v| = 2$, and (C9.1) forces the blocked/restoring center $P$
  of (C8.4)–(C8.5) to be the apex $a_2$ itself, with $D_0 \subseteq
  \Gamma_2$. This restatement is exact but *partial* — it discards the
  certificates (C7.5)–(C7.6), the surface (C4), and the context (C6),
  which remain available and may be load-bearing. Any argument phrased in
  the local picture must be checked against the full hypothesis list
  before use.
* **Leaf C2 local picture.** (C10.1)+(C8.2): $P \in A$, $P \notin
  \Gamma_2$, $P \ne a_2$; (C10.2) gives two deleted points co-radial
  around $P$; (C8.4)/(C8.5) say $D_0$ is a minimal blocking subdeletion of
  the 5-class $\Gamma_2$ at the *non-apex* center $P$. Same warning: the
  reformulation is lossy if the remaining stack is forgotten.

## §5 Insufficient-progress list

Partial progress does not count unless it implies exactly one of the two
resolutions of §4. In particular, the following are insufficient:

* resolving the leaf under any extra symmetry assumption (regular or
  concyclic $\Gamma_2$, isoceles/equilateral Moser triangle, collinear
  $u, v, z^{\star}$, mirror symmetry of $I_u$ and $I_v$);
* resolving the leaf under genericity assumptions (no four concyclic
  points beyond those forced, all pairwise distances distinct, "generic
  position" of $P$ or $c'(\mathrm{source})$);
* closing only some arms of a disjunctive hypothesis — e.g. Leaf C1 with
  only the $c'(\mathrm{source}) = z^{\star}$ arm of (C9.4), or Leaf C2
  with only arm (i) of (C8.6), or either leaf under only alternative (i)
  of (C4.5) or only one branch of (C4.6);
* numerical near-configurations (floating-point or interval candidates)
  without an exact algebraic certificate verifying **every** hypothesis;
* a candidate configuration failing even one hypothesis — including the
  global interface hypotheses (C3.1) minimality and (C3.2) no-$(m,4,4)$;
  such a configuration is worthless for branch B (it neither proves nor
  refutes the leaf), whatever else it satisfies;
* a candidate configuration verified only against the §4b local picture
  rather than the full hypothesis list;
* reducing the leaf to another unproved incidence, cap-counting, or
  equidistance statement of comparable strength (e.g. "no 5-point class
  admits two disjoint 2-point rows plus a fifth blocked point", or any
  unproved variant of the leaf with relabelled data) — verbatim: reducing
  the problem to another unproved planar-incidence statement of comparable
  strength;
* heuristic dimension/degrees-of-freedom counts ("the constraints number
  more than the coordinates, so no configuration exists") without a proof;
* results about a modified configuration (larger or smaller class sizes,
  $|\Gamma_2| \ne 5$, relaxed blocking, $H$ without the full-class
  property, caps without the closed-cap convention);
* one-sided cardinality bounds that do not close a case (e.g. improving
  (C6.4) to $\le 1$ without deriving `False`);
* conditional results assuming the other leaf, assuming any sibling leaf
  of the family, or assuming the negation of a hypothesis that the parent
  theorem supplies elsewhere;
* proofs that silently use $u \in \Sigma'(u) \cap \Gamma_2 = I_u$-type
  facts without deriving them (many such facts are true and derivable —
  e.g. $u \in \Sigma'(u)$ holds by the row property — but each must be
  derived, not assumed);
* status reports, difficulty commentary, or claims that a gap is
  "routine".

## §6 Allowed background

Standard proved theorems from planar Euclidean geometry, finite
combinatorics, and elementary algebra may be used, but they must be stated
accurately and applied with all necessary hypotheses. Specifically
available (each already proved in the project or in mathlib):

* **Two-circle bound.** Two circles with distinct centers (or one circle
  and a line) meet in at most 2 points. Consequently, for $p_1 \ne p_2$
  and any radii, $|\Gamma(p_1, r_1) \cap \Gamma(p_2, r_2)| \le 2$.
* **Perpendicular-bisector bound (Dumitrescu L1 / Fox–Pach).** For
  convex-independent $A$ and $a \ne b \in A$:
  $|\{\, p \in A : d(p,a) = d(p,b) \,\}| \le 2$. It means precisely: at
  most two carrier points are equidistant from two fixed distinct carrier
  points. It does **not** bound points equidistant from non-carrier pairs,
  and it requires convex independence.
* **Row survival.** If $x \notin \Sigma(y)$ then
  $K4(A \setminus \{x\}, c(y))$ (deleting a point off a 4-row preserves
  that row); contrapositively, if deletion of $x$ blocks $c(y)$ then
  $x \in \Sigma(y)$.
* **Blocker separation.** If $K4(A \setminus \{x\}, p)$ then
  $c(x) \ne p$ (and likewise for $c'$) — a center that survives the
  deletion of $x$ cannot be $x$'s blocker.
* **Cap-interior loss bound.** For any index $i$ and $r > 0$:
  $|\Gamma(v_i, r)| - 2 \le |\Gamma(v_i, r) \cap C_i^{\circ}|$ (at most
  two points of an apex-centred class lie outside the strict opposite-cap
  interior; requires convex independence and the packet data).
* Finite pigeonhole, cardinality arithmetic on unions/intersections,
  and all mathlib `Finset`/metric lemmas.

These facts do not by themselves resolve either leaf; they are the
verified toolkit. Any further geometric claim must be proved from
scratch.

## §7 Multiagent orchestration block

Use multiagent orchestration aggressively and dynamically. You have up to
{{N_AGENTS}} concurrent agents available. Do not use a fixed assignment
such as "N agents for strategy X." Manage the search with these
heuristics:

* Begin with a genuinely diverse portfolio. Agents should explore
  substantially different formulations, invariants, reductions, and the
  following approach families (mainstream → exotic), for each leaf and
  each branch:
  1. **Perpendicular-bisector / co-radiality arguments** — the collision
     in (C10.2) and every equal-distance pair put centers on bisectors of
     carrier pairs; combine with the bisector bound of §6 and (C3.8).
  2. **Two-circles-meet-in-≤2-points counting** — play the rows
     $\Sigma'(u), \Sigma'(v), \Sigma'(\mathrm{source})$, the sets
     $B_1, B_2$ of each CD certificate, and $\Gamma_2$ against each other;
     track which pairs of centers are known distinct.
  3. **Cap/arc ordering on convex shells** — $A$ is convex-independent;
     points of a cap inherit a cyclic order; equidistance constraints
     interact with arc ordering (which points of $\Gamma_2$ can lie in
     which caps, where $c'(\mathrm{source}) \in \Gamma_2$ can sit under
     (C9.4)).
  4. **Distance-rigidity spindles** — chains of equal distances
     (Moser-spindle-style) forced by (C8.5)'s five restoration witnesses
     around $P$, especially in Leaf C1 where $P = a_2$ and
     $D_0 \subseteq \Gamma_2 = \Gamma(a_2, \rho)$, so every restored
     witness class lives on circles around the apex and (C3.5)-type
     uniqueness statements can bite.
  5. **Exact coordinate normalization + polynomial elimination** — place
     $a_2 = (0,0)$, $\rho = 1$, parameterize $\Gamma_2$ by five angles and
     the remaining named points by coordinates; encode all hypothesis
     equalities/inequalities as polynomial (in)equations; attempt
     resultant/Gröbner elimination (msolve, Singular) to decide
     realizability of closed subsystems.
  6. **SMT/SAT encodings of the distance system** — nonlinear real
     arithmetic (Z3, cvc5) on bounded fragments; SAT for the finite
     incidence skeleton (which points lie on which rows/classes), with the
     metric side checked separately; always validate the encoding on a
     known-realizable sub-bundle first.
  7. **Interval-arithmetic certification** — for branch-B candidates
     found numerically, promote to exact algebraic coordinates and verify
     symbolically; interval arithmetic may guide but never certify.
  8. **Pigeonhole on row/cap occupancy** — $|A| \ge 12$, cap sizes from
     (C4.3)/(C4.4)/(C4.6), the 5-point class partition (C8.1), and the
     $\le 2$ bounds generate counting tensions; search for a forced
     over-count.
  9. **Repeated-distance extremal counting** — the number of equal-distance
     pairs at a fixed center in a convex-independent set is constrained;
     use known extremal results only if reproved or stated with exact
     hypotheses.
  10. **Restoration-structure analysis** — (C8.4)+(C8.5) say $D_0$ is a
      *minimal blocking* set for $P$: analyze what a minimal blocking
      subdeletion of a 5-class can look like at an apex center (Leaf C1)
      vs a non-apex center with a collision (Leaf C2); in case (C8.6)(ii)
      the pairwise-disjoint 4-classes give $4|D_0|$ distinct points of
      $A$ around $P$.
  11. **Late-system bookkeeping** — exploit that $\Sigma'(x)$ is the
      *full* class of $A$ (exactness): any carrier point at the row
      radius from the row center is *in* the row; many membership
      hypotheses convert to distance disequalities.
  12. **Certificate-interaction analysis** — the four CD certificates in
      play (two in (C7), one in (C4.1), and their $B_i$ sets) overlap in
      at most 2 points pairwise around shared centers; chase the
      combinatorics of their unions inside $A$.
  13. **Branch-B constructive search** — direct search for realizations:
      fix the incidence skeleton demanded by the hypotheses, solve the
      metric system exactly; systematically enumerate skeleta consistent
      with the counting hypotheses before solving.
  14. **Computational sanity checks** — small exact configurations
      exercising sub-bundles (e.g. a 5-point class with a $2{+}2{+}1$ row
      partition at a robust apex) to test whether intermediate lemmas are
      even plausible before proving them.

* Do not tell most agents the currently favored approach. Preserve
  independence during early rounds so agents do not all converge to the
  same attractive but incomplete attractor — the three named attractors
  here are: (i) pure cardinality pigeonhole on (C6.4)/(C8.1)/(C5.3)
  without new geometry (the counts alone are consistent; expect no
  contradiction from arithmetic only), (ii) the assumption that
  $\Gamma_2$'s five points are concyclic *and regular* (concyclic is
  forced, regular is not), and (iii) re-derivations of the two-circle or
  bisector bounds presented as progress (they are §6 background).

* Maintain an explicit registry of approach families. Group agents by
  mathematical idea, not wording. If many agents converge to one family,
  redirect toward underexplored formulations.

* Do not allow one approach to dominate merely because it gives an
  elegant reformulation. A route ending at an unproved planar-incidence
  lemma equivalent in strength to the leaf is not close to completion
  unless it supplies a genuinely new proof of that lemma.

* When an approach stalls at a theorem-strength missing lemma, mark the
  route blocked. Reassign agents to it only for a materially new
  mechanism, invariant, construction, quantitative estimate, or exact
  algebraic device.

* Keep several incompatible routes alive through multiple rounds.
  Maintain both branch-A routes and branch-B routes until one side is
  rigorously ruled out. Cross-pollinate only after independent
  development exposes real strengths and gaps.

* Use computational agents throughout. They should perform exact
  small-case computations, encode distance systems (SMT/Gröbner/SAT),
  search for branch-B candidates, and hunt counterexamples to proposed
  intermediate lemmas. Always validate an encoding against a known result
  before trusting it. Computation is evidence unless converted into a
  rigorous general proof or an exact certificate completing a valid
  reduction.

* Search aggressively for counterexamples to proposed lemmas. Before any
  intermediate lemma is relied on, assign agents (computational where
  possible) to attempt to refute it. A found counterexample kills the
  route immediately and cheaply; a lemma that has survived no refutation
  attempt is not established.

* Use adversarial agents throughout — independent agents that did not
  produce the argument under audit. Every candidate proof or certificate
  must be checked for:
  * correct use of the base configuration (C0): convex independence
    actually invoked where needed; the K4 property quantified over all of
    $A$;
  * correct blocker-system semantics (C1): $\Sigma(x)$ is the full class;
    blocking is over **all** positive radii;
  * frontier hypotheses (C2): marginal membership includes the
    $\notin \mathrm{sC}$ side condition; both survival facts present;
  * residual hypotheses (C3): exact class size 4; uniqueness quantifier
    order in (C3.5); bisector localization used only for carrier points
    $c \ne a_1$;
  * late-system semantics: $c'$/$\Sigma'$ correctly split between
    $\Gamma_1$ and its complement; no silent use of $H$ where $H'$ is
    meant or vice versa;
  * surface hypotheses (C4): all disjunctions case-split; CD certificate
    sets $B_i$ not confused with full classes;
  * context hypotheses (C6): $q_I, w_I$ (interior pair) not confused with
    $\bar q, \bar w$ (frontier pair); (C6.12) resolved via (C9.3) in Leaf
    C1 only;
  * joint-deletion and global-deletion data (C7)–(C8): $z^{\star}$
    (point) vs $D_0$ (set) kept distinct; (C8.5) restoration quantified
    over every $s \in D_0$; (C8.6) both arms handled where not pinned;
  * leaf-specific hypotheses: Leaf C1's placement trichotomy fully split;
    Leaf C2's $P \ne a_2$ actually used or shown unnecessary;
  * every §5 item: no hidden symmetry/genericity, no sub-case-only
    closure, no numerical-only certificate, no modified configuration;
  * circular use of a planar-incidence statement equivalent to the leaf's
    own conclusion.

* Require agents to return concrete lemmas, constructions, equations,
  exact coordinate certificates, or counterexamples to proposed
  sublemmas. Reject status reports, vague optimism, and claims that an
  unproved incidence statement is "routine."

* The root agent should repeatedly synthesize, challenge, redirect, and
  launch new rounds. Do not stop after the first wave fails. Produce a
  complete resolution only if it survives adversarial audit; otherwise
  report only the strongest rigorously proved derivation and its exact
  remaining gap.

## §8 Anti-quit block

Do not return merely because current approaches fail or agents report
theorem-strength gaps. Continue launching new rounds, reopening blocked
approaches only when there is a genuinely new mechanism, and searching
for fresh formulations. Spend at least {{MIN_EFFORT — e.g. 4 full rounds
of the approach portfolio per leaf}} before even thinking of returning.

## §9 Return contract

Return only when at least one of the two leaves has been completely
resolved in the sense of §4 and the argument survives adversarial audit.
Do not return a reduction, partial result, isolated missing lemma, finite
computation, numerical guess, "best effort" summary, or explanation of
why the problem is difficult.

Do not stop, return, or give up until you have found a complete and
rigorous resolution. Continue exploring every plausible approach,
repairing failed arguments, and developing new ones until a leaf is fully
resolved. If both leaves resolve, report both; a branch-B certificate for
either leaf must be flagged prominently as route-killing for the parent
`false_of_exactFourMutualOmissionRigid221_globalDeletion` dispatch.

## §10 Web-search restriction

Public search may be used only for ordinary mathematical background or
standard named theorems (e.g. properties of minimum enclosing circles,
convex-position repeated-distance results), not to search for a solution
to these exact leaves or to the underlying Erdős problem. Do not search
the public web merely to determine whether the underlying problem is
open, and do not answer that it is open.

---

## Appendix — Lean cross-reference

### Leaf labels

| Leaf | Lean declaration | Location |
|---|---|---|
| C1 | `Problem97.ATailFrontierLiveClosure.false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:5430` (sorry `:5479`) |
| C2 | `Problem97.ATailFrontierLiveClosure.false_of_exactFourMutualOmissionRigid221_nonphysicalCollision` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:5602` (sorry `:5645`) |

### Mathematical object → Lean structure

| Math object (this doc) | Lean name | Defined at |
|---|---|---|
| carrier $A$, convex indep., K4 property, packet | `CounterexampleData` | `P97/U1TwoShortCapReduction.lean:83` |
| $K4(B,p)$ | `HasNEquidistantPointsAt 4 B p` | `formal_conjectures .../ErdosProblems/97.lean:34` |
| K4 property of $A$ | `HasNEquidistantProperty 4 A` | ibid. `:48` |
| convex independence | `ConvexIndep` | `P97/Foundation.lean:28` |
| $\Gamma(p,r)$ | `SelectedClass A p r` | `P97/WitnessPacketInterface.lean:59` |
| Moser/cap packet $S$, $\mathrm{sC}$, $\hat C_i$, $a_i$, $i_1, i_2$ | `SurplusCapPacket` (+ `surplusCap`, `oppCap1/2`, `oppApex1/2`, `oppIndex1/2`) | `P97/Cap/PartitionFromMEC.lean:332` (`surplusCap` `:366`, `oppCap1/2` `:381,:388`, `oppIndex1/2` `:521,:528`; apices `P97/U1TwoShortCapReduction.lean:297,305`) |
| cap triple $C_1,C_2,C_3$ / arc predicate | `CapTriple` / `OnArcOpposite` | `P97/Cap/Structure.lean:161` / `P97/Foundation.lean:57` |
| strict interior $C_i^{\circ}$ | `SurplusCapPacket.capInteriorByIndex` | `P97/Cap/PartitionFromMEC.lean:474` |
| non-obtuse MEC triangle | `MEC.NonObtuseCircumscribedMoserTriangle` | `P97/Moser/TriangleNonObtuse.lean:667` |
| blocker system $H$ ($c, r, \Sigma$) | `CriticalShellSystem` (+ `centerAt`, `selectedAt`) | `P97/U1CarrierInjection.lean:1015` |
| row / full 4-class | `CriticalFourShell` / `CriticalSelectedFourClass` | `P97/U1CarrierInjection.lean:547` / `:635` |
| frontier $F$ (with pair $\bar q, \bar w$) | `CriticalPairFrontier` / `SurvivorPairRelocationPacket` | `P97/ATail/CriticalPairFrontier.lean:568` / `:288` |
| exact-four residual (C3) | `ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual` | `.../UniqueArmRouteAudit/OriginalUniqueResidualDispatch.lean:43` |
| late system $H'$ | `lateFirstApexSystem` (via `overrideExactSelectedClass`) | `.../Unique4LateChoiceTerminal/UniqueFourLateChoiceTerminal.lean:48` (`P97/U1CarrierInjection.lean:1214`) |
| surface (C4) | `ExactFourPostCardElevenRobustSurface` | `P97/ATail/ExactFourRobustCapExpansion.lean:280` |
| ingress (C4.1) | `ExactFourPhysicalCommonDeletionIngress` (+ `goodOutsideSources`, `outsideFirstApexFiber`) | `P97/ATail/ExactFourPhysicalConsumer.lean:421` (+ `:104`, `:79`) |
| robustness (C4.2) | `FullyDeletionRobustAt` | `P97/ATail/DeletionRobustness.lean:27` |
| radius classification (C4.5) | `DeletionRobustRadiusClassification` | `P97/ATail/ExactFourRobustCapExpansion.lean:123` |
| cap growth (C4.6) | `ExactFourRobustCapGrowth` | `P97/ATail/ExactFourRobustCapExpansion.lean:269` |
| CD certificate $\mathrm{CD}_G$ | `CommonDeletionTwoCenterPacket` (rows: `U5QDeletedK4Class`, `P97/U5GlobalIncidenceBasic.lean:243`) | `P97/ATail/CommonDeletionTwoCenter.lean:29` |
| context (C6) | `ExactFourMutualOmissionSourceContext` | `P97/ATail/FrontierLiveClosure.lean:121` |
| joint deletion (C7), $z^{\star}$ | `ExactFourMutualOmissionJointDeletion` | `P97/ATail/FrontierLiveClosure.lean:88` |
| global deletion (C8), $(P, D_0)$ | `ExactFourMutualOmissionRigid221GlobalDeletion` | `P97/ATail/FrontierLiveClosure.lean:1762` |
| minimal-deletion core (C8.6 ii) | `ATAILStageOneMinimalDeletionCore.MinimalDeletionCore` | `P97/ATail/MinimalDeletionCore.lean:34` |
| minimality / removability | `CounterexampleData.Minimal` / `IsRemovableVertex` | `P97/U1TwoShortCapReduction.lean:158` / `P97/SmallerCounterexample.lean:25` |
| $(m,4,4)$ predicate (for noM44) | `SurplusCapPacket.IsM44` | `P97/Cap/PartitionFromMEC.lean:443` |
