# Family E — Tri-apex directed-omission leaf: complete-resolution prompt

One leaf obligation from
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean` (goal is `False`):

* **Leaf E1** — `false_of_retainedInteriorDirectedOmission_and_all_low_hits`
  (declaration at `:6752`, `sorry` at `:6778`).

The leaf is a top-level theorem in namespace
`Problem97.ATailFrontierLiveClosure`; it does not sit inside a `section` /
`variable` / `include` block, so the hypothesis list below is complete as
written in the declaration. Every structure appearing in a hypothesis has
been unfolded recursively into plain planar-metric mathematics; the only
interface-level assumptions (global minimality, no-$(m,4,4)$-repackaging)
are stated precisely in prose where they occur.

---

## §1 Notation preamble

Define every symbol before the problem appears. No access to any external
problem page is assumed.

* $\mathbb{R}^2$ — the Euclidean plane, $d(x,y)$ the Euclidean distance;
  all point sets are finite; $|X|$ — cardinality.
* $A \subset \mathbb{R}^2$ — the fixed finite carrier set.
* **Circle class.** $\Gamma(p, r) := \{\, z \in A : d(p, z) = r \,\}$
  (Lean: `SelectedClass A p r`); $r$ is an arbitrary real.
* **K4 witness predicate.**
  $K4(B, p) :\Longleftrightarrow \exists\, r > 0 :
  |\{ z \in B : d(p, z) = r \}| \ge 4$
  (Lean: `HasNEquidistantPointsAt 4 B p`).
* **K4 property.** $\forall p \in A,\ K4(A, p)$
  (Lean: `HasNEquidistantProperty 4 A`).
* **Convex independence.** Every point of $A$ is an extreme point of the
  convex hull of $A$ (Lean: `ConvexIndep A`).
* **Signed area / closed-arc predicate / MEC** — as follows:
  $\mathrm{sa}(v, v_j, v_k) := (v_j^x - v^x)(v_k^y - v^y) -
  (v_k^x - v^x)(v_j^y - v^y)$;
  $\mathrm{OnArcOpp}(v_i, v_j, v_k; v) :\Leftrightarrow
  \mathrm{sa}(v, v_j, v_k)\cdot\mathrm{sa}(v_i, v_j, v_k) \le 0$
  (closed side of chord $v_jv_k$ opposite $v_i$); MEC = the minimum
  enclosing circle of $A$.

### Moser/cap data (the packet $S$)

The carrier is equipped with (Lean: `SurplusCapPacket`):

* $A$ nonempty, not collinear.
* A **Moser triangle**: pairwise-distinct $v_1, v_2, v_3 \in A$ on the MEC
  boundary circle, all vertex angles non-obtuse
  ($\langle v_j - v_i, v_k - v_i\rangle \ge 0$ for each permutation), in
  the circumscribed branch of the Sylvester dichotomy.
* A **cap triple** $C_1, C_2, C_3 \subseteq A$ (closed caps): $C_i$ is the
  set of $A$-points on the closed arc opposite $v_i$ (via
  $\mathrm{OnArcOpp}$), with $v_i \notin C_i$, the other two vertices in
  $C_i$, every non-Moser point in exactly one cap, caps covering $A$;
  hence $|C_1| + |C_2| + |C_3| = |A| + 3$.
* A **surplus index** $s \in \{0,1,2\}$ with the selected cap of size
  $> 4$. Projections: surplus cap $\mathrm{sC}$; opposite caps
  $\hat C_1, \hat C_2$ (Lean `oppCap1`, `oppCap2`) at cap indices
  $i_1, i_2$ (Lean `oppIndex1`, `oppIndex2`); opposite apices
  $a_1 := v_{i_1}$, $a_2 := v_{i_2}$ (Lean `oppApex1`, `oppApex2`);
  surplus apex $a_0 := v_{s}$ (Lean `surplusApex`,
  `oppositeVertexByIndex surplusIdx`). For any cap index
  $i \in \{0,1,2\}$, $v_i$ denotes the Moser vertex of the same index
  (Lean `oppositeVertexByIndex i`); cap $C_i$ is *opposite* $v_i$.
* **Strict cap interior.** $C_i^{\circ}$ := $C_i$ minus its two endpoint
  Moser vertices (Lean: `capInteriorByIndex i`).

### Blocker system

* **Blocker system $H$** (Lean: `CriticalShellSystem A`): to each
  $x \in A$ it assigns
  * a **blocker center** $c(x) \in A \setminus \{x\}$,
  * a **row radius** $r(x) > 0$,
  * the **row** $\Sigma(x) := \Gamma(c(x), r(x))$ with $|\Sigma(x)| = 4$
    and $x \in \Sigma(x)$ ($\Sigma(x)$ is the *entire* circle class of
    $A$, not a chosen 4-subset), plus an (automatically satisfiable)
    labelling of its four elements;
  * **blocking:** $\neg K4(A \setminus \{x\},\, c(x))$ — after deleting
    $x$, no positive radius carries $\ge 4$ points of $A\setminus\{x\}$
    around $c(x)$.

  This leaf uses $H$ directly throughout (no "late" override system).

### Named predicates

* **Full deletion robustness** (Lean: `FullyDeletionRobustAt D p`):
  $\forall z \in A,\ K4(A \setminus \{z\},\, p)$.
* **Non-robust centers** (Lean: `notRobustCenters D`):
  $\mathcal{N} := \{\, p \in A : \neg\,\forall z \in A,\
  K4(A\setminus\{z\}, p) \,\}$.
* **Unique-four center** (Lean: `IsUniqueFourCenter A p`):
  $p \in A$ and there exists $r > 0$ with $|\Gamma(p, r)| = 4$ such that
  every $\rho > 0$ with $|\Gamma(p, \rho)| \ge 4$ equals $r$. (The radius
  $r$ is then unique; the class $\Gamma(p,r)$ is the **unique four-class**
  of $p$, Lean `uniqueFourClass A p` — the Lean definition is a choice
  function, pinned to this class at every unique-four center.)
* **Apex-rich class structure** (Lean: `ApexRichClassStructure A p`):
  $$\bigl(\exists r > 0:\ 6 \le |\Gamma(p, r)|\bigr) \;\lor\;
    \bigl(\exists r_1, r_2 > 0:\ r_1 \ne r_2 \wedge
    4 \le |\Gamma(p, r_1)| \wedge 4 \le |\Gamma(p, r_2)|\bigr).$$
* **Opposite-cap rich interior pattern** (Lean:
  `OppositeCapRichClassInteriorPattern A S i`), for a cap index $i$:
  $$\bigl(\exists r > 0:\ 4 \le |\Gamma(v_i, r) \cap C_i^{\circ}|\bigr)
    \;\lor\;
    \bigl(\exists r_1, r_2 > 0:\ r_1 \ne r_2 \wedge
    2 \le |\Gamma(v_i, r_1) \cap C_i^{\circ}| \wedge
    2 \le |\Gamma(v_i, r_2) \cap C_i^{\circ}|\bigr).$$

### Common-deletion certificate

* $\mathrm{CD}_H(x;\, p_1, p_2)$ (Lean: `CommonDeletionTwoCenterPacket
  D H x p_1 p_2`): (1) $x, p_1, p_2 \in A$, $p_1 \ne p_2$;
  (2) $K4(A\setminus\{x\}, p_1)$ and $K4(A\setminus\{x\}, p_2)$;
  (3) $c(x) \ne p_1$ and $c(x) \ne p_2$;
  (4) sets $B_1, B_2$ with $B_i \subseteq (A\setminus\{x\})\setminus
  \{p_i\}$, $|B_i| = 4$, $x \notin B_i$, all points of $B_i$ at one
  positive radius from $p_i$ ($B_i$ a chosen 4-subset, not necessarily a
  full class); (5) $|B_1 \cap B_2| \le 2$.

### Global interface assumptions (stated in full)

* **Minimality** (Lean: `D.Minimal`): for **every** finite nonempty
  convex-independent $B \subset \mathbb{R}^2$ with the K4 property,
  $|A| \le |B|$.
* **No $(m,4,4)$ repackaging** (Lean: `noM44`): no Moser/cap packet on
  the same $A$ (any valid triangle + cap triple + surplus designation)
  has both opposite caps of size exactly $4$.

---

## §2 Problem statement

Resolve the following leaf obligation completely. The leaf asserts that
the hypothesis bundle (E0)–(E9) below is contradictory (`False`).
**Faithfulness note:** every numbered line is a hypothesis actually
present in (or a field of a structure argument of) the Lean declaration;
none may be dropped, merged, weakened, or strengthened. Lean names in
parentheses.

### 2.1 (E0) Base configuration

* (E0.1) $A \subset \mathbb{R}^2$ finite, nonempty (`D.nonempty`).
* (E0.2) $A$ convex-independent (`D.convex`).
* (E0.3) $A$ has the K4 property (`D.K4`).
* (E0.4) $A$ carries Moser/cap packet data $S$ as in §1 (`D.packet` is a
  packet on $A$; all hypotheses below refer to the leaf's packet $S$ on
  the same $A$).

### 2.2 (E1) Blocker system

* (E1.1) $H$ is a blocker system on $A$ as in §1.

### 2.3 (E2) Frontier packet $F$ at radius $\rho_0$

There are a real $\rho_0$ (Lean: the implicit `radius`) and points
$\bar q, \bar w$ (Lean `F.pair.q`, `F.pair.w`) with:

* (E2.1) $\bar q, \bar w \in A$, $\bar q \ne \bar w$, both in the
  first-apex marginal
  $M := \{x \in A : d(x, a_1) = \rho_0\} \setminus \mathrm{sC}$.
* (E2.2) $K4(A\setminus\{\bar q\}, a_2)$ and
  $K4(A\setminus\{\bar w\}, a_2)$.
* (E2.3) $c(\bar q) \ne a_2$ and $c(\bar w) \ne a_2$.
* (E2.4) First-apex split (`F.firstApexSplit`):
  $K4\bigl((A\setminus\{\bar q\})\setminus\{\bar w\}, a_1\bigr)$ **or**
  $\bigl(|\Gamma(a_1, \rho_0)| \in \{4, 5\}$ and
  $\forall \rho > 0:\ 4 \le |\Gamma(a_1,\rho)| \Rightarrow
  \rho = \rho_0\bigr)$.
* (E2.5) $K4\bigl((A\setminus\{\bar q\})\setminus\{\bar w\}, a_2\bigr)$
  (`F.secondApexDouble`).
* (E2.6) Second-apex split (`F.secondApexSplit`): the same disjunction as
  in the Family C prompt — $K4\bigl((A\setminus\{\bar q\})\setminus
  \{\bar w\}, a_2\bigr)$ **or** two disjoint exact 4-classes at $a_2$
  through $\bar q$ and $\bar w$ (radii $d(a_2,\bar q)$, $d(a_2,\bar w)$,
  each full class of size exactly 4, disjoint). Given (E2.5) the left
  disjunct holds; retained for faithfulness. (As in the Family C prompt,
  each Lean certificate also carries four distinct enumerating labels and a
  derivable center-membership field, omitted here as automatic.)

Derived (not a hypothesis): $\rho_0 > 0$.

### 2.4 (E3) Common-deletion parent residual $R$

* (E3.1) Minimality of $A$, as in §1 (`R.minimal`).
* (E3.2) No $(m,4,4)$ repackaging of $A$, as in §1 (`R.noM44`).
* (E3.3) $9 < |A|$ (`R.carrier_card_gt_nine`).
* (E3.4) $4 \le |\Gamma(a_1, \rho_0)|$
  (`R.frontierRadius_class_card_ge_four`).
* (E3.5) First-apex double survival (`R.common.firstApexDouble`):
  $K4\bigl((A\setminus\{\bar q\})\setminus\{\bar w\},\, a_1\bigr)$.
* (E3.6) A certificate $\mathrm{CD}_H(\bar q;\, a_1, a_2)$
  (`R.common.packet`). Unfolded: $\bar q, a_1, a_2 \in A$,
  $a_1 \ne a_2$; $K4(A\setminus\{\bar q\}, a_1)$ and
  $K4(A\setminus\{\bar q\}, a_2)$; $c(\bar q) \ne a_1$ and
  $c(\bar q) \ne a_2$; 4-point sets
  $B_1 \subseteq (A\setminus\{\bar q\})\setminus\{a_1\}$,
  $B_2 \subseteq (A\setminus\{\bar q\})\setminus\{a_2\}$ on positive
  radii around $a_1$ resp. $a_2$, $\bar q \notin B_1 \cup B_2$,
  $|B_1 \cap B_2| \le 2$.

### 2.5 (E4) Retained-interior directed omission $P$

There are points $x_1, x_2$ (Lean `P.source₁`, `P.source₂`) with:

* (E4.1) $x_1, x_2 \in A$, $x_1 \ne x_2$
  (`source₁_mem_A`, `source₂_mem_A`, `sources_ne`).
* (E4.2) $x_1, x_2 \in \Gamma(a_1, \rho_0)$
  (`source₁_mem_radius`, `source₂_mem_radius`).
* (E4.3) $x_1, x_2 \in C_{i_1}^{\circ}$ (strict interior of the first
  opposite cap) (`source₁_mem_capInterior`, `source₂_mem_capInterior`).
* (E4.4) $c(x_1) \ne c(x_2)$ (`blockers_ne`).
* (E4.5) Directed omission (`directed_omission`):
  $$\bigl(x_2 \notin \Sigma(x_1) \wedge
    K4(A\setminus\{x_2\},\, c(x_1))\bigr) \;\lor\;
    \bigl(x_1 \notin \Sigma(x_2) \wedge
    K4(A\setminus\{x_1\},\, c(x_2))\bigr).$$

### 2.6 (E5) Robustness and large-cap chain

* (E5.1) Second-apex full robustness (`B.secondApex_robust`):
  $\forall z \in A,\ K4(A\setminus\{z\},\, a_2)$.
* (E5.2) $6 \le |\hat C_1|$ (`L.firstOppCap_card_ge_six`).
* (E5.3) $6 \le |\hat C_2|$ (`L.secondOppCap_card_ge_six`).
* (E5.4) $6 \le |\mathrm{sC}|$ (`N.surplusCap_card_ge_six`).

Derived (not a hypothesis): $|A| = |C_1| + |C_2| + |C_3| - 3 \ge 15$.

### 2.7 (E6) Tri-apex rich residual $T$

* (E6.1) Apex-rich class structure at $a_1$ (`T.oppApex1_rich`):
  $(\exists r>0:\ 6 \le |\Gamma(a_1,r)|)$ or two distinct positive radii
  each with $\ge 4$-point classes at $a_1$.
* (E6.2) Apex-rich class structure at $a_2$ (`T.oppApex2_rich`).
* (E6.3) Apex-rich class structure at $a_0$ (the surplus apex)
  (`T.surplusApex_rich`).
* (E6.4) Cover bound (`T.notRobustCover_card`):
  $|A| \le 4 \cdot |\mathcal{N}|$, where
  $\mathcal{N} = \{p \in A : \neg\,\forall z \in A,\
  K4(A\setminus\{z\}, p)\}$ is the set of non-robust carrier centers.
* (E6.5) No tri-apex circle (`T.no_center_covers_all_apices`):
  $$\forall p \in A,\ \forall r > 0:\ \neg\bigl(
    v_1 \in \Gamma(p,r) \wedge v_2 \in \Gamma(p,r) \wedge
    v_3 \in \Gamma(p,r)\bigr)$$
  — no carrier point is simultaneously equidistant (at a single positive
  radius) from all three Moser vertices.

### 2.8 (E7) Unique-four shell cover

* (E7.1) (`hcriticalShellUniqueFourCover`) For **every** $x \in A$:
  1. $c(x) \ne x$;
  2. $c(x)$ is a unique-four center of $A$: $c(x) \in A$ and there is a
     unique $r > 0$ with $|\Gamma(c(x), r)| \ge 4$, and for that $r$,
     $|\Gamma(c(x), r)| = 4$;
  3. the unique four-class of $c(x)$ equals the row of $x$:
     $\Gamma(c(x), r) = \Sigma(x)$ (with $r$ the unique radius of item
     2).

  (Items 2–3 unfold Lean's `IsUniqueFourCenter D.A (H.centerAt x hx)` and
  `uniqueFourClass D.A (H.centerAt x hx) =
  (H.selectedAt x hx).toCriticalFourShell.support`; the pinned reading of
  `uniqueFourClass` is licensed by item 2.)

### 2.9 (E8) Rich interior patterns at the three cap indices

* (E8.1) (`hfirst`) The opposite-cap rich interior pattern at index
  $i_1$:
  $(\exists r>0:\ 4 \le |\Gamma(a_1, r) \cap C_{i_1}^{\circ}|)$ **or**
  $(\exists r_1 \ne r_2 > 0$ with
  $2 \le |\Gamma(a_1, r_j) \cap C_{i_1}^{\circ}|$ for $j = 1, 2)$.
* (E8.2) (`hsecond`) The same pattern at index $i_2$ (apex $a_2$, cap
  interior $C_{i_2}^{\circ}$).
* (E8.3) (`hsurplus`) The same pattern at the surplus index $s$ (apex
  $a_0$, cap interior $C_{s}^{\circ}$).

### 2.10 (E9) Low-hit hypothesis

* (E9.1) (`hlow`) For **every** cap index $i \in \{0, 1, 2\}$, **every**
  $x \in A$, and **every** real $r$ (not required positive): if the
  apex-rich class structure holds at $v_i$, then
  $$\bigl|\Sigma(x) \,\cap\, \bigl(\Gamma(v_i, r) \cap C_i^{\circ}\bigr)
  \bigr| \;\le\; 2 .$$

Derived (not a hypothesis): the three indices $\{0,1,2\}$ are exactly
$\{i_1, i_2, s\}$ and the corresponding apices are $a_1, a_2, a_0$; by
(E6.1)–(E6.3) the antecedent of (E9.1) holds at every index, so every
blocker row meets every apex-circle-within-strict-cap in at most 2
points.

**Goal (Leaf E1):** derive `False` — prove that no configuration
satisfies (E0)–(E9) simultaneously, or produce one that does (§4).

### Edge conventions

* Membership $x \in \Gamma(p, r)$ carries $x \in A$ and $d(p, x) = r$.
* In (E9.1) the radius $r$ ranges over **all** reals; for $r \le 0$ the
  intersection is empty or degenerate and the bound is vacuous, but the
  quantifier is as stated.
* (E4.5) is a disjunction; neither orientation is given, and an argument
  must handle both (or derive one).
* $\neg K4$ (in the blocking clause of (E1.1)) and robustness statements
  quantify over all positive radii and all carrier deletions
  respectively, in the stated order.
* The apices $a_1, a_2, a_0$ are Moser vertices and lie in $A$; each apex
  $v_i$ lies in the two caps $C_j$, $j \ne i$, and *not* in its opposite
  cap $C_i$; in particular $a_1 \in \mathrm{sC}$ and
  $a_1 \notin \hat C_1$.

---

## §3 Assume-solvable framing

Assume for purposes of this task that the leaf admits a complete
resolution, but do not assume in advance which branch holds. A complete
resolution must establish exactly one of the two statements in §4.

## §4 Dual-branch success criteria

**Branch A (proof of `False` — closes the leaf).** A complete, rigorous
proof that (E0)–(E9) are jointly contradictory. The proof must:

* use only the stated hypotheses plus standard proved theorems (§6);
* treat every disjunctive hypothesis by complete case analysis — in
  particular the directed-omission orientation (E4.5), the two arms of
  each rich-structure hypothesis (E6.1)–(E6.3), and the two arms of each
  interior pattern (E8.1)–(E8.3), including all cross-combinations that
  the argument depends on;
* introduce no additional assumptions — no genericity, no symmetric
  position, no assumption that the rich radii of (E6)/(E8) coincide with
  $\rho_0$ or with each other, no assumption on which orientation of
  (E4.5) holds, and no strengthening of the interface assumptions;
* be formalizable in Lean 4 over mathlib in the project's terms (finite
  sets in $\mathbb{R}^2$, `dist`, `Finset` cardinalities).

**Branch B (exact realizability certificate — kills the route).** One
**fixed** configuration: a finite point set $A$ with exact algebraic
coordinates, together with explicit exact choices of *all* quantified
data — Moser triangle, cap triple, surplus index, the blocker system $H$
(center, radius, full 4-class, and blocking condition verified for every
$x \in A$), $\rho_0$, $\bar q$, $\bar w$, the parent-residual
certificates (E3.5)–(E3.6), the pair $x_1, x_2$ with (E4.1)–(E4.5), and
verification of (E5)–(E9) in full — such that **every** hypothesis is
satisfied, with all distance equalities and inequalities verified
symbolically. Such a certificate proves the leaf unprovable and kills the
parent route (the exhaustive selector that produces $P$); it is
**equally valuable** as branch A and must be reported as such.

Honest scope of branch B: (E3.1) is global minimality — the certificate
must also prove that no finite nonempty convex-independent K4
configuration in the plane is smaller than the exhibited $A$ (which has
$|A| \ge 15$ by (E5)); (E3.2) requires proving no $(m,4,4)$ repackaging
of the exhibited $A$ exists; and (E6.4) with (E7.1) impose global
structure on $H$ and on the robustness pattern of $A$. All are part of
the hypothesis list; a configuration missing any one certifies nothing
(§5).

Quantifier structure is essential: branch A refutes every configuration;
branch B exhibits one configuration satisfying all hypotheses. Different
partial configurations for different hypothesis subsets do not combine.

## §4b Sanctioned reformulations (optional)

* **Counting skeleton.** (E6.4) + (E7.1) yield: the carrier is covered by
  the 4-point rows $\{\Sigma(x)\}$, each of which is the unique four-class
  of its non-robust center $c(x)$, and $|A| \le 4|\mathcal{N}|$. The
  apices $a_1, a_2$ are robust ((E5.1) for $a_2$; robustness of $a_1$ is
  derivable from (E6.1) — a six-point class or two K4 radii survive any
  single deletion), hence $a_1, a_2 \notin \mathcal{N}$; likewise
  $a_0 \notin \mathcal{N}$ from (E6.3). This reformulation is exact but
  partial: it forgets the metric content of (E8)/(E9) and the directed
  omission (E4), which are load-bearing. Any argument in the counting
  skeleton must be re-checked against the full list.
* **Hit-matrix formulation.** For each cap index $i$ and each rich
  radius $r$ of (E8), the set $\Gamma(v_i, r) \cap C_i^{\circ}$ has
  $\ge 4$ (arm 1) or twice $\ge 2$ (arm 2) points; every row $\Sigma(x)$
  hits each such set in $\le 2$ points by (E9.1); every point of each
  such set lies in $A$ and hence in its own row $\Sigma(\cdot)$ and in
  the four-class of some unique-four center by (E7.1). Bookkeeping of
  "which rows cover which apex-circle points" is a sanctioned exact
  reformulation; the warning is that rows for distinct sources may
  coincide (distinct $x, y$ can share $c(x) = c(y)$ and
  $\Sigma(x) = \Sigma(y)$ — nothing forbids it in general; (E4.4)
  forbids it only for $x_1, x_2$).

## §5 Insufficient-progress list

Partial progress does not count unless it implies exactly one of the two
resolutions above. In particular, the following are insufficient:

* resolving the leaf under extra symmetry assumptions (equilateral or
  isoceles Moser triangle, caps of equal size, regular spacing on any
  circle class, coincidence of the rich radii of (E6)/(E8) with $\rho_0$);
* resolving the leaf under genericity assumptions (all pairwise distances
  distinct, no accidental concyclicities, "generic" blocker assignment);
* closing only one orientation of the directed omission (E4.5), only one
  arm of a rich-structure or interior-pattern disjunction, or only one
  cap index of (E8)/(E9);
* numerical near-configurations without an exact algebraic certificate
  verifying **every** hypothesis;
* a candidate configuration failing even one hypothesis — including the
  global interface hypotheses (E3.1) minimality and (E3.2)
  no-$(m,4,4)$, the cover bound (E6.4), and the per-point unique-four
  cover (E7.1); such a configuration is worthless for branch B;
* a candidate configuration verified only against a §4b reformulation
  rather than the full hypothesis list;
* reducing the leaf to another unproved incidence or cap-counting
  statement of comparable strength (e.g. an unproved sharpening of
  (E9.1) to $\le 1$, an unproved claim that rich patterns force a
  removable vertex, or any relabelled variant of the leaf) — verbatim:
  reducing the problem to another unproved planar-incidence statement of
  comparable strength;
* heuristic dimension or degrees-of-freedom counts without proof;
* results about a modified configuration (caps smaller than 6, carrier
  below 15, rows not equal to full classes, blocking relaxed to a single
  radius);
* improving a constant in one counting inequality without deriving
  `False`;
* conditional results assuming sibling leaves of the frontier file, or
  assuming robustness/uniqueness facts not listed and not derived;
* status reports, difficulty commentary, or "routine gap" claims.

## §6 Allowed background

Standard proved theorems from planar Euclidean geometry, finite
combinatorics, and elementary algebra may be used, but must be stated
accurately and applied with all necessary hypotheses. Specifically
available (proved in the project or mathlib):

* **Two-circle bound.** For $p_1 \ne p_2$ and any radii,
  $|\Gamma(p_1, r_1) \cap \Gamma(p_2, r_2)| \le 2$.
* **Perpendicular-bisector bound (Dumitrescu L1 / Fox–Pach).** For
  convex-independent $A$ and $a \ne b \in A$:
  $|\{p \in A : d(p, a) = d(p, b)\}| \le 2$. Exactly this statement; it
  requires $a, b \in A$ and convex independence.
* **Row survival.** If $z \notin \Sigma(x)$ then
  $K4(A\setminus\{z\},\, c(x))$; contrapositively, a deletion that blocks
  $c(x)$ must delete a point of $\Sigma(x)$.
* **Blocker separation.** If $K4(A\setminus\{x\}, p)$ then $c(x) \ne p$.
  In particular robustness of $p$ (E5.1-style) gives $c(x) \ne p$ for
  every $x$.
* **Robustness from rich structure.** Apex-rich class structure at $p$
  implies full deletion robustness at $p$ (a $\ge 6$-class survives any
  deletion at $\ge 5 \ge 4$; two K4 radii cannot both be destroyed by one
  deletion of a point lying on at most one of the two circles).
  Consequently, under (E6.1)–(E6.3), $a_1, a_2, a_0 \notin \mathcal{N}$,
  and no blocker center $c(x)$ equals any of the three apices (by (E7.1)
  item 2, $c(x)$ is a unique-four center, and unique-four centers are not
  robust: deleting a point of the unique four-class blocks them).
* **Cap-interior loss bound.** For any cap index $i$ and $r > 0$:
  $|\Gamma(v_i, r)| - 2 \le |\Gamma(v_i, r) \cap C_i^{\circ}|$ (requires
  convex independence and the packet).
* **Shell-vs-rich-class bound.** For any $x \in A$, any rich apex
  $v_i$ (apex-rich structure holds there), and any radius $r$:
  $|\Sigma(x) \cap \Gamma(v_i, r)| \le 2$ — this is the two-circle bound
  after separating $c(x) \ne v_i$; it is the already-banked generic form
  of (E9.1) *without* the cap-interior restriction. It means (E9.1)'s
  content is exactly the restriction to $C_i^{\circ}$ being part of the
  hypothesis, not a new bound to prove.
* **Two-hit localization.** If a row $\Sigma(x)$ meets
  $\Gamma(v_i, r) \cap C_i^{\circ}$ in $\ge 2$ points and $c(x)$ is a
  unique-four center while $v_i$ is rich, then
  $c(x) \in C_i^{\circ}$ (the blocker is trapped in the same strict cap
  interior; proved in-project as
  `criticalShellCenter_mem_capInteriorByIndex_of_two_hits`).
* Finite pigeonhole, cardinality arithmetic, mathlib `Finset`/metric
  lemmas.

These facts are the verified toolkit; they do not by themselves resolve
the leaf.

## §7 Multiagent orchestration block

Use multiagent orchestration aggressively and dynamically. You have up to
{{N_AGENTS}} concurrent agents available. Do not use a fixed assignment
such as "N agents for strategy X." Manage the search with these
heuristics:

* Begin with a genuinely diverse portfolio across the following approach
  families (mainstream → exotic), for both branches:
  1. **Perpendicular-bisector / co-radiality arguments** — every pair of
     points sharing a row around a common center puts that center on a
     carrier-pair bisector; combine the bisector bound with the
     directed-omission pair $x_1, x_2$ (both on $\Gamma(a_1,\rho_0)$, so
     $a_1$ is on the bisector of $x_1 x_2$, and so is any common-row
     center).
  2. **Two-circles-meet-in-≤2-points counting** — the rows $\Sigma(x)$
     against the apex circles of (E8); track distinctness of centers via
     blocker separation and robustness.
  3. **Cap/arc ordering on convex shells** — convex position orders each
     cap; points of $\Gamma(v_i, r) \cap C_i^{\circ}$ appear consecutively
     constrained; the two-hit localization traps blockers inside strict
     cap interiors — chase where the trapped blockers' own four-classes
     can live.
  4. **Distance-rigidity spindles** — chains of equal distances between
     apex circles and rows; use (E6.5) (no tri-apex circle) as the
     rigidity breaker it is designed to be: any candidate center covering
     all three Moser vertices at one radius is forbidden.
  5. **Counting against the cover bound** — the sharpest stated global
     constraint is (E6.4): $|A| \le 4|\mathcal{N}|$ with
     $\mathcal{N} \subseteq A$, apices excluded from $\mathcal{N}$, and
     each non-robust center carrying exactly one 4-class (E7.1). Count
     row-coverage of the $\ge 15$ carrier and of the rich interior sets
     of (E8) under the $\le 2$ bound (E9.1); search for a forced
     over/under-count. (This is the family the leaf's docstring points
     at: combine the omission packet with the frontier pair and the other
     two rich apex patterns.)
  6. **Directed-omission propagation** — (E4.5) supplies a deletion of
     one interior source that both preserves K4 at the other's blocker
     and (by (E5.1) and first-apex robustness derivable from (E6.1))
     preserves K4 at both apices; iterate the project's producer pattern:
     an omission yields a common-deletion certificate at $(a_1, c(x_j))$;
     analyze what the minimality of $A$ (E3.1) forbids about such
     deletions (no removable vertex: deleting any single point of $A$
     must destroy the K4 property somewhere — this is derivable from
     (E3.1) and is the engine minimality provides).
  7. **Exact coordinate normalization + polynomial elimination** — fix
     $a_1 = (0,0)$, $\rho_0 = 1$, the MEC center on an axis; encode a
     candidate incidence skeleton as a polynomial system; decide
     realizability by resultants/Gröbner (msolve, Singular).
  8. **SMT/SAT encodings** — nonlinear real arithmetic (Z3, cvc5) for
     bounded fragments; SAT/ILP for the row-coverage combinatorics
     (which of the $\ge 15$ points lie on which 4-rows subject to
     (E6.4), (E7.1), (E9.1)); validate encodings on a known-realizable
     sub-bundle first.
  9. **Interval-arithmetic certification** — numeric search may guide
     branch-B candidates; only exact symbolic verification certifies.
  10. **Pigeonhole on row/cap occupancy** — $\ge 6$ points per cap,
      $\ge 4$ strict-interior points per rich arm, $\le 2$ hits per row:
      quantify how many distinct rows are needed to cover the rich sets
      and compare with $|\mathcal{N}|$ and the 4-point row size.
  11. **Repeated-distance extremal counting** — extremal bounds on
      equal-distance incidences in convex position, used only with exact
      statements and proofs.
  12. **Branch-B constructive search** — enumerate incidence skeleta
      consistent with (E5)–(E9) at the minimum carrier size 15 (or
      slightly above), then solve the metric systems exactly; report any
      exact solution as a route-killing certificate after full-hypothesis
      verification (including (E3.1) — see §4 honest-scope note).
  13. **Computational sanity checks** — exact micro-configurations
      exercising sub-bundles (e.g. a 6-point cap with a rich pattern and
      rows hitting it twice each) to stress-test intermediate lemmas
      before proving them.

* Do not tell most agents the currently favored approach. Preserve
  independence during early rounds so agents do not converge on the same
  attractive but incomplete attractor — the three named attractors here
  are: (i) pure counting from (E6.4)+(E9.1) alone (the arithmetic has
  slack; expect no contradiction without new geometric input), (ii)
  treating the directed omission as if both orientations held
  simultaneously (only the disjunction is given), and (iii) assuming the
  rich radii of (E8) equal the frontier radius $\rho_0$ (nothing forces
  this).

* Maintain an explicit registry of approach families; group agents by
  mathematical idea, not wording; redirect from crowded families to
  underexplored ones.

* Do not allow one approach to dominate merely because it yields an
  elegant reformulation. A route that ends at an unproved cap-counting
  lemma equivalent in strength to the leaf is not close to completion
  unless it supplies a genuinely new proof of that lemma.

* When an approach stalls at a theorem-strength missing lemma, mark the
  route blocked; reassign only for a materially new mechanism, invariant,
  construction, estimate, or exact algebraic device.

* Keep several incompatible routes alive through multiple rounds;
  maintain both branch-A and branch-B routes until one side is rigorously
  ruled out; cross-pollinate only after independent development.

* Use computational agents throughout: exact small-case computation,
  encodings (SAT/ILP/SMT/Gröbner), candidate searches, counterexample
  hunts against intermediate lemmas. Always validate the encoding against
  a known result first. Computation is evidence unless converted into a
  rigorous general proof or an exact certificate completing a valid
  reduction.

* Search aggressively for counterexamples to proposed lemmas before
  relying on them. A found counterexample kills a route immediately and
  cheaply; an unattacked lemma is not established.

* Use adversarial agents throughout — independent of the argument's
  authors. Every candidate proof or certificate must be checked for:
  * base configuration (E0): convex independence invoked where needed;
    K4 property quantified over all of $A$;
  * blocker semantics (E1): rows are full classes; blocking over all
    positive radii; no confusion of $\Sigma(x)$ with a chosen 4-subset
    ($B_i$ of a CD certificate);
  * frontier and parent hypotheses (E2)–(E3): marginal membership
    includes $\notin \mathrm{sC}$; the CD certificate's $B_i$ handled as
    subsets, not classes;
  * directed omission (E4): both orientations covered; (E4.4) used only
    for the pair $x_1, x_2$;
  * chain hypotheses (E5): robustness only at $a_2$ is *stated*;
    robustness at $a_1, a_0$ must be *derived* (via (E6)) if used;
  * tri-apex residual (E6): both arms of each rich structure; cover
    bound direction ($|A| \le 4|\mathcal{N}|$, not the reverse); (E6.5)
    applied only to carrier points and positive radii;
  * unique-four cover (E7): the uniqueness quantifier order; the pinned
    class equality used only under item 2;
  * interior patterns (E8): both arms; the correct apex-index pairing
    ($v_i$ with $C_i^{\circ}$, i.e. apex against its *opposite* strict
    cap interior);
  * low-hit hypothesis (E9): antecedent discharged via (E6) at each
    index actually used; arbitrary-real radius quantifier respected;
  * every §5 item: no hidden symmetry/genericity, no
    single-orientation/single-arm closure, no numerical-only
    certificates, no modified configuration;
  * circular use of a cap-counting or incidence statement equivalent to
    the leaf's own conclusion.

* Require agents to return concrete lemmas, constructions, equations,
  exact coordinate certificates, or counterexamples to proposed
  sublemmas. Reject status reports, vague optimism, and "routine" claims
  about unproved incidence statements.

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
of the approach portfolio}} before even thinking of returning.

## §9 Return contract

Return only when the leaf has been completely resolved in the sense of
§4 and the argument survives adversarial audit. Do not return a
reduction, partial result, isolated missing lemma, finite computation,
numerical guess, "best effort" summary, or explanation of why the
problem is difficult.

Do not stop, return, or give up until you have found a complete and
rigorous resolution. Continue exploring every plausible approach,
repairing failed arguments, and developing new ones until the leaf is
fully resolved. A branch-B certificate must be flagged prominently as
route-killing for the exhaustive selector that produces the
directed-omission packet
(`nonempty_retainedInteriorDirectedOmission_of_collision_of_capInterior_card_ge_three`
and its five-point wrapper).

## §10 Web-search restriction

Public search may be used only for ordinary mathematical background or
standard named theorems (minimum enclosing circles, convex-position
repeated distances, Fox–Pach-type bisector bounds), not to search for a
solution to this exact leaf or to the underlying Erdős problem. Do not
search the public web merely to determine whether the underlying problem
is open, and do not answer that it is open.

---

## Appendix — Lean cross-reference

### Leaf label

| Leaf | Lean declaration | Location |
|---|---|---|
| E1 | `Problem97.ATailFrontierLiveClosure.false_of_retainedInteriorDirectedOmission_and_all_low_hits` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:6752` (sorry `:6778`) |

### Mathematical object → Lean structure

| Math object (this doc) | Lean name | Defined at |
|---|---|---|
| carrier $A$, convex indep., K4 property, packet | `CounterexampleData` | `P97/U1TwoShortCapReduction.lean:83` |
| $K4(B,p)$ / K4 property | `HasNEquidistantPointsAt 4` / `HasNEquidistantProperty 4` | `formal_conjectures .../ErdosProblems/97.lean:34,48` |
| convex independence | `ConvexIndep` | `P97/Foundation.lean:28` |
| $\Gamma(p,r)$ | `SelectedClass A p r` | `P97/WitnessPacketInterface.lean:59` |
| packet $S$; $\mathrm{sC}, \hat C_i, a_1, a_2, a_0, i_1, i_2$ | `SurplusCapPacket` (+ `surplusCap`, `oppCap1/2`, `oppApex1/2`, `surplusApex`, `oppIndex1/2`) | `P97/Cap/PartitionFromMEC.lean:332` (`surplusCap` `:366`, `oppCap1/2` `:381,:388`, `oppIndex1/2` `:521,:528`; apices `P97/U1TwoShortCapReduction.lean:297,305,313`) |
| indexed apex $v_i$ | `SurplusCapPacket.oppositeVertexByIndex` | `P97/SurplusM44Packet/Shard01.lean:1013` |
| cap triple / arc predicate | `CapTriple` / `OnArcOpposite` | `P97/Cap/Structure.lean:161` / `P97/Foundation.lean:57` |
| strict interior $C_i^{\circ}$ | `SurplusCapPacket.capInteriorByIndex` | `P97/Cap/PartitionFromMEC.lean:474` |
| non-obtuse MEC triangle | `MEC.NonObtuseCircumscribedMoserTriangle` | `P97/Moser/TriangleNonObtuse.lean:667` |
| blocker system $H$ ($c, r, \Sigma$) | `CriticalShellSystem` (+ `centerAt`, `selectedAt`) | `P97/U1CarrierInjection.lean:1015` |
| row / full 4-class | `CriticalFourShell` / `CriticalSelectedFourClass` | `P97/U1CarrierInjection.lean:547` / `:635` |
| frontier $F$ (pair $\bar q, \bar w$) | `CriticalPairFrontier` / `SurvivorPairRelocationPacket` | `P97/ATail/CriticalPairFrontier.lean:568` / `:288` |
| parent residual (E3) | `FrontierCommonDeletionParentResidual` (+ `FrontierCommonDeletionResidual`) | `P97/ATail/OrientedPhysicalApexIngress.lean:251` (+ `:239`) |
| CD certificate $\mathrm{CD}_H$ | `CommonDeletionTwoCenterPacket` (rows: `U5QDeletedK4Class`, `P97/U5GlobalIncidenceBasic.lean:243`) | `P97/ATail/CommonDeletionTwoCenter.lean:29` |
| directed omission $P$ ($x_1, x_2$) | `RetainedInteriorDirectedOmission` | `P97/ATail/RetainedMatchingGeometricReduction.lean:150` |
| second-apex robustness (E5.1) | `FrontierBiApexRobustResidual` / `FullyDeletionRobustAt` | `P97/ATail/PhysicalSecondApexCommonDeletion.lean:171` / `P97/ATail/DeletionRobustness.lean:27` |
| large opposite caps (E5.2–3) | `FrontierLargeOppositeCapsBiApexRobustResidual` | `P97/ATail/LargeOppositeCapsBiApexSurface.lean:38` |
| large surplus cap (E5.4) | `FrontierAllLargeCapsBiApexRobustResidual` | `P97/ATail/FrontierLiveClosure.lean:6430` |
| tri-apex residual (E6) | `FrontierAllLargeCapsTriApexRobustResidual` | `P97/ATail/FrontierLiveClosure.lean:6527` |
| non-robust centers $\mathcal{N}$ | `notRobustCenters` | `P97/ATail/MinimalUniqueFourCover.lean:418` |
| apex-rich structure | `ApexRichClassStructure` | `P97/ATail/ApexRichClassStructure.lean:50` |
| rich interior pattern (E8) | `OppositeCapRichClassInteriorPattern` | `P97/ATail/ApexRichClassStructure.lean:153` |
| unique-four center / class (E7) | `IsUniqueFourCenter` / `uniqueFourClass` | `P97/ATail/MinimalUniqueFourCover.lean:48` / `:64` |
| minimality / removability | `CounterexampleData.Minimal` / `IsRemovableVertex` | `P97/U1TwoShortCapReduction.lean:158` / `P97/SmallerCounterexample.lean:25` |
| $(m,4,4)$ predicate (for noM44) | `SurplusCapPacket.IsM44` | `P97/Cap/PartitionFromMEC.lean:443` |
| two-hit localization (§6) | `criticalShellCenter_mem_capInteriorByIndex_of_two_hits` | `P97/ATail/FrontierLiveClosure.lean:6559` |
