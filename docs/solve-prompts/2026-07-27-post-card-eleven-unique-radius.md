# Complete-resolution prompt — Family D: post-card-eleven / unique-radius consumers

Date: 2026-07-27.
Source obligations: four `sorry`-bearing leaf theorems in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`, each with goal `False`:

| Label | Lean declaration | Location |
|---|---|---|
| **D1** | `false_of_exactFourPostCardElevenTwoRadiusBranch` | `FrontierLiveClosure.lean:6090` (sorry at `:6117`) |
| **D2** | `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome` | `FrontierLiveClosure.lean:6167` (sorry at `:6177`) |
| **D3** | `false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual` | `FrontierLiveClosure.lean:6247` (sorry at `:6253`) |
| **D4** | `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual` | `FrontierLiveClosure.lean:6258` (sorry at `:6264`) |

This document is self-contained: every hypothesis of every leaf has been
unfolded, through all intermediate Lean structures, to plain statements about
finite point sets in the Euclidean plane. No access to the Lean sources is
required to work on it. A full appendix maps every mathematical object used
here back to its Lean structure and source location.

---

## §1 Notation preamble

All geometry is in the Euclidean plane $\mathbb{R}^2$ with the standard
Euclidean distance $d(x,y) = \lVert x - y\rVert$ and standard inner product
$\langle \cdot,\cdot\rangle$. For a point $x \in \mathbb{R}^2$ write
$x_0, x_1$ for its two coordinates. $|T|$ denotes the cardinality of a finite
set $T$. For a finite set $B$ and points $p, q$, $B \smallsetminus \{p\}$ and
$B \smallsetminus \{p,q\}$ denote element removal. All set-cardinality
statements below are about finite sets.

**Carrier.** $A \subset \mathbb{R}^2$ is a finite nonempty point set;
$n := |A|$.

**Convex independence.** $A$ is *convex-independent* iff every point of $A$
is an extreme point of its convex hull:
$\forall a \in A,\; a \notin \operatorname{conv}\bigl((A \smallsetminus \{a\})\bigr)$,
where $\operatorname{conv}$ is the convex hull in $\mathbb{R}^2$.

**Rows (same-distance classes).** For $B \subseteq \mathbb{R}^2$ finite, a
center $c \in \mathbb{R}^2$ and $\rho \in \mathbb{R}$:
$$\Lambda_B(c,\rho) \;:=\; \{x \in B : d(c,x) = \rho\}.$$
Abbreviate $\Lambda(c,\rho) := \Lambda_A(c,\rho)$. A *full row* at $(c,\rho)$
means the entire set $\Lambda(c,\rho)$, as opposed to a chosen subset of it.

**The $K_4$ predicate.** For finite $B \subseteq \mathbb{R}^2$ and
$c \in \mathbb{R}^2$:
$$K_4(B, c) \;:\Longleftrightarrow\; \exists\, \rho > 0,\; |\Lambda_B(c,\rho)| \ge 4.$$
(Since $\rho > 0$, the center never counts itself.) $A$ has the *$K_4$
property* iff $K_4(A, p)$ holds for every $p \in A$.

**Minimality.** $A$ is a *minimal counterexample* iff for every finite
nonempty convex-independent $B \subset \mathbb{R}^2$ with the $K_4$ property,
$n \le |B|$.

**Minimum enclosing circle (MEC).** $(O, \rho_{\mathrm{MEC}})$ with
$\rho_{\mathrm{MEC}} \ge 0$, $d(x, O) \le \rho_{\mathrm{MEC}}$ for all
$x \in A$, and radius minimal among all enclosing pairs ($\forall\, O', r'$:
if $d(x,O') \le r'$ for all $x \in A$ then $\rho_{\mathrm{MEC}} \le r'$).
This pair exists and is unique for nonempty $A$ (proved in-project).

**Signed area and arc predicate.** For $u, a, b \in \mathbb{R}^2$:
$$\sigma(u; a, b) \;:=\; (a_0 - u_0)(b_1 - u_1) - (b_0 - u_0)(a_1 - u_1)$$
(twice the signed area of triangle $u\,a\,b$). For a triangle
$v_1 v_2 v_3$ and a point $x$, with $(i,j,k)$ a cyclic permutation of
$(1,2,3)$:
$$\mathrm{Arc}_i(x) \;:\Longleftrightarrow\; \sigma(x; v_j, v_k)\cdot \sigma(v_i; v_j, v_k) \;\le\; 0,$$
i.e. $x$ and $v_i$ lie on opposite *closed* sides of the chord $v_j v_k$
("$x$ lies on the closed arc opposite $v_i$"; points on the chord satisfy
the predicate for both sides — the closed-cap convention).

**Non-obtuse circumscribed Moser triangle.** Points
$v_1, v_2, v_3 \in A$, pairwise distinct, each on the MEC circle
($d(v_i, O) = \rho_{\mathrm{MEC}}$), with all three angles non-obtuse in
inner-product form:
$\langle v_2 - v_1, v_3 - v_1\rangle \ge 0$,
$\langle v_3 - v_2, v_1 - v_2\rangle \ge 0$,
$\langle v_1 - v_3, v_2 - v_3\rangle \ge 0$.

**Cap triple.** Given such a triangle, a *cap triple* is
$C_1, C_2, C_3 \subseteq A$ satisfying **all** of:
* $v_1 \notin C_1$, $v_2 \in C_1$, $v_3 \in C_1$;
  $v_1 \in C_2$, $v_2 \notin C_2$, $v_3 \in C_2$;
  $v_1 \in C_3$, $v_2 \in C_3$, $v_3 \notin C_3$;
* every $x \in A \smallsetminus \{v_1,v_2,v_3\}$ lies in exactly one of
  $C_1, C_2, C_3$;
* arc invariant: for every $x \in A$ and each $i \in \{1,2,3\}$:
  $x \in C_i \iff \mathrm{Arc}_i(x)$.

Consequences (derived, not hypotheses): $C_1 \cup C_2 \cup C_3 = A$; each
Moser vertex lies in exactly two caps; the cap-sum identity
$|C_1| + |C_2| + |C_3| = n + 3$.

**Surplus-cap packet.** A *surplus-cap packet on $A$* is the full bundle:
$A$ nonempty; $A$ not collinear; a non-obtuse circumscribed Moser triangle
on $A$ (with the pairwise-distinctness witness selecting the circumscribed
branch of the Sylvester MEC dichotomy); a cap triple over it; and a surplus
index $s \in \{1,2,3\}$ with $|C_s| > 4$. Given a packet, define (cyclically,
with indices mod 3):
* $\Sigma := C_s$ (*surplus cap*), $\Gamma_1 := C_{s+1}$ (*first opposite
  cap*), $\Gamma_2 := C_{s+2}$ (*second opposite cap*);
* apexes: $a_0 := v_s$ (surplus apex), $a_1 := v_{s+1}$ (*first apex*,
  the Moser vertex opposite $\Gamma_1$), $a_2 := v_{s+2}$ (*second apex*,
  opposite $\Gamma_2$). Note $a_1 \notin \Gamma_1$, $a_1 \in \Sigma \cap \Gamma_2$;
  $a_2 \notin \Gamma_2$, $a_2 \in \Sigma \cap \Gamma_1$; $a_0 \in \Gamma_1 \cap \Gamma_2$,
  $a_0 \notin \Sigma$;
* strict cap interiors: $\Gamma_1^{\circ} := \Gamma_1 \smallsetminus \{a_0, a_2\}$,
  $\Gamma_2^{\circ} := \Gamma_2 \smallsetminus \{a_0, a_1\}$ (the closed cap minus
  its two Moser-vertex endpoints).

**$(m,4,4)$ packet.** A surplus-cap packet on $A$ is *$(m,4,4)$* iff its
own two opposite caps satisfy $|\Gamma_1| = 4$ and $|\Gamma_2| = 4$.

**Selected four-class at $c$.** A pair $K = (T, r)$ with $T \subseteq A$,
$|T| = 4$, $r > 0$, $d(c, t) = r$ for all $t \in T$, and $c \notin T$.
(The support $T$ need **not** be the full row $\Lambda(c,r)$.) Write
$\mathrm{supp}(K) = T$, $\mathrm{rad}(K) = r$.

**Critical four-shell at $c$ through $q$.** Data: $c \in A$, $c \ne q$,
$r > 0$, with the **full row** $R = \Lambda(c, r)$ satisfying $|R| = 4$ and
$q \in R$. (The Lean structure additionally names the four points of $R$;
this adds no mathematical content.)

**Critical shell system on $A$.** An assignment, to every $q \in A$, of:
* a *blocker center* $\chi(q) \in A$ with $\chi(q) \ne q$,
* a radius $r_q > 0$ such that the full row
  $R_q := \Lambda(\chi(q), r_q)$ has $|R_q| = 4$ and $q \in R_q$,
* subject to the *no-survival condition*:
  $\lnot K_4\bigl(A \smallsetminus \{q\},\, \chi(q)\bigr)$
  (after deleting $q$, **no** positive radius carries $\ge 4$ points of
  $A \smallsetminus \{q\}$ around $\chi(q)$).

**Marginal.** Given a packet and $\rho \in \mathbb{R}$, the *first-apex
marginal at $\rho$* is
$M_\rho := \{x \in A : d(x, a_1) = \rho\} \smallsetminus \Sigma
= \Lambda(a_1,\rho) \smallsetminus \Sigma$.

Everything above is the primitive vocabulary. Composite hypothesis blocks
(frontier, residuals, ingress, surface, swapped frontier) are defined in §2
where they are used, as labeled hypothesis lists.

---

## §2 Problem statements

Resolve the following four statements completely. Each leaf asserts that a
certain fully-specified finite plane configuration **cannot exist**; its goal
in Lean is `False` from the hypotheses. Resolving any single leaf in either
direction (§4) is independently valuable and must be reported per-leaf.

### §2.0 Common frame (hypothesis block C)

All four leaves share the following data and hypotheses.

**(C1) Carrier.**
* (C1.1) $A \subset \mathbb{R}^2$ finite, nonempty; $n := |A|$.
* (C1.2) $A$ is convex-independent.
* (C1.3) $A$ has the $K_4$ property: $\forall p \in A,\; K_4(A, p)$.
* (C1.4) $A$ is not collinear (part of the packet data in C2).
* (C1.5) The Lean carrier record additionally stores *some* surplus-cap
  packet on $A$; since (C2) supplies the distinguished packet $S$ this
  imposes no constraint beyond (C2).

**(C2) Distinguished surplus-cap packet $S$.** A surplus-cap packet on $A$
as in §1, with all its constituent facts:
* (C2.1) MEC $(O, \rho_{\mathrm{MEC}})$ of $A$;
* (C2.2) Moser triangle $v_1v_2v_3 \subseteq A$, pairwise distinct, on the
  MEC circle, non-obtuse (three inner-product inequalities);
* (C2.3) cap triple $C_1, C_2, C_3$ with the membership pattern and the arc
  invariant of §1;
* (C2.4) surplus index $s$ with $|\Sigma| > 4$;
* derived roles $\Sigma, \Gamma_1, \Gamma_2, a_0, a_1, a_2,
  \Gamma_1^{\circ}, \Gamma_2^{\circ}$ as in §1.

**(C3) Frontier radius.** A real number $\hat\rho \in \mathbb{R}$.
*(No sign hypothesis is given directly; $\hat\rho > 0$ is derivable from
(C5.1) since $q_F \in M_{\hat\rho}$ forces $q_F \ne a_1$, as $a_1 \in \Sigma$.)*

**(C4) Critical shell system $H$.** A critical shell system
$(\chi, (r_q)_{q\in A}, (R_q)_{q \in A})$ on $A$ as in §1.

**(C5) Critical-pair frontier $F$.** Data and facts:
* (C5.1) points $q_F, w_F \in A$ with $q_F, w_F \in M_{\hat\rho}$
  (equivalently: $d(q_F, a_1) = d(w_F, a_1) = \hat\rho$, $q_F, w_F \notin \Sigma$)
  and $q_F \ne w_F$;
* (C5.2) singleton-deletion survivals at the second apex:
  $K_4(A \smallsetminus \{q_F\}, a_2)$ and $K_4(A \smallsetminus \{w_F\}, a_2)$;
* (C5.3) blocker separation: $\chi(q_F) \ne a_2$ and $\chi(w_F) \ne a_2$;
* (C5.4) *first-apex split*:
  $K_4(A \smallsetminus \{q_F, w_F\}, a_1)$ **or**
  $\bigl[(|\Lambda(a_1,\hat\rho)| = 4 \lor |\Lambda(a_1,\hat\rho)| = 5)
  \;\wedge\; \forall \rho > 0\,(4 \le |\Lambda(a_1,\rho)| \to \rho = \hat\rho)\bigr]$;
* (C5.5) *second-apex double survival*:
  $K_4(A \smallsetminus \{q_F, w_F\}, a_2)$;
* (C5.6) *second-apex split*:
  $K_4(A \smallsetminus \{q_F, w_F\}, a_2)$ **or** there exist critical
  four-shells at center $a_2$: one through $q_F$ with radius $d(a_2, q_F)$
  and one through $w_F$ with radius $d(a_2, w_F)$, whose full-row supports
  are disjoint. *(Derived remark: (C5.5) already witnesses the left
  disjunct of (C5.6); both are nevertheless hypotheses.)*

*Derived (not hypotheses): $\hat\rho > 0$;
$q_F, w_F \in \Lambda(a_1, \hat\rho)$.*

### §2.0a Exact-four residual block R (used by D1, D2)

**(R)** In addition to (C):
* (R1) $A$ is a minimal counterexample (§1 Minimality).
* (R2) **No $(m,4,4)$ packet exists on $A$**: there is *no* surplus-cap
  packet on $A$ (any Moser triangle, cap triple, surplus index — not just
  $S$) whose two opposite caps both have exactly 4 points.
* (R3) $n > 9$.
* (R4) $|\Lambda(a_1, \hat\rho)| = 4$ (exactly).
* (R5) unique four-radius at the first apex:
  $\forall \rho > 0$: $4 \le |\Lambda(a_1,\rho)| \Rightarrow \rho = \hat\rho$.
* (R6) every class member blocks the first apex:
  $\forall x \in \Lambda(a_1,\hat\rho)$:
  $\lnot K_4(A \smallsetminus \{x\},\, a_1)$.
* (R7) an *interior pair*: points $p, p' \in \Lambda(a_1,\hat\rho) \cap \Gamma_1^{\circ}$
  with $p \ne p'$.
* (R8) bisector localization: for every $c \in A$ with $c \ne a_1$ and
  $d(c, p) = d(c, p')$, we have $c \in \Gamma_1^{\circ}$.

**Late first-apex system $\chi^{*}$ (a definition, enabled by (R4), (R6)).**
Modify $H$ by overriding the blocker choice on the exact class:
$$\chi^{*}(x) := \begin{cases} a_1 & x \in \Lambda(a_1,\hat\rho),\\ \chi(x) & \text{otherwise};\end{cases}$$
for $x \in \Lambda(a_1,\hat\rho)$ the associated shell is the full row
$\Lambda(a_1,\hat\rho)$ itself (radius $\hat\rho$), and for other $x$ the
shell $R_x$ of $H$ is kept. (R6) is exactly the no-survival condition making
$\chi^{*}$ a valid critical shell system. *Derived: $q_F, w_F, p, p'$ all lie
in the 4-element set $\Lambda(a_1,\hat\rho)$; $\chi^{*}(q_F) = \chi^{*}(w_F) = a_1$.*

**Outside fiber and good sources (definitions).**
$$\Omega \;:=\; \{x \in A : \chi^{*}(x) \ne \chi^{*}(q_F)\} \;=\; \{x \in A : \chi^{*}(x) \ne a_1\},$$
$$G \;:=\; \{x \in \Omega :\; K_4(A \smallsetminus \{q_F\}, \chi^{*}(x)) \;\lor\; K_4(A \smallsetminus \{w_F\}, \chi^{*}(x))\}.$$

### §2.0b Common-deletion ingress block I (used by D1 inside the surface, and by D2)

**(I)** Data and facts (all rows/blockers below refer to $\chi^{*}$):
* (I1) a deleted point $\delta \in \{q_F, w_F\}$;
* (I2) a source $u \in A$ with $u \in G$;
* (I3) $\chi^{*}(u) \ne a_2$. Write $c_1 := \chi^{*}(u)$, $c_2 := a_2$;
* (I4) $\delta \in A$, $c_1 \in A$, $c_2 \in A$, $c_1 \ne c_2$;
* (I5) $K_4(A \smallsetminus \{\delta\}, c_1)$ and
  $K_4(A \smallsetminus \{\delta\}, c_2)$;
* (I6) $\chi^{*}(\delta) \ne c_1$ and $\chi^{*}(\delta) \ne c_2$;
* (I7) finite sets $B_1, B_2 \subseteq \mathbb{R}^2$ with, for $i = 1, 2$:
  $B_i \subseteq (A \smallsetminus \{\delta\}) \smallsetminus \{c_i\}$,
  $\delta \notin B_i$, $|B_i| = 4$, and a radius $s_i > 0$ with
  $d(c_i, y) = s_i$ for all $y \in B_i$;
* (I8) $|B_1 \cap B_2| \le 2$.

*Derived: $\chi^{*}(\delta) = a_1$ (since $\delta \in \Lambda(a_1,\hat\rho)$),
so (I6) reduces to $a_1 \ne c_1$ and $a_1 \ne a_2$, both automatic.*

### §2.1 Leaf D1 — `false_of_exactFourPostCardElevenTwoRadiusBranch`

**Hypotheses.** (C), (R), and:
* (D1.1) $n \ge 12$;
* (D1.2) *post-card-eleven robust surface*:
  * (D1.2a) an ingress instance (I);
  * (D1.2b) full deletion robustness at the second apex:
    $\forall z \in A$: $K_4(A \smallsetminus \{z\},\, a_2)$;
  * (D1.2c) $|\Gamma_1| \ge 4$;
  * (D1.2d) $|\Gamma_2| \ge 5$;
  * (D1.2e) *deletion-robust radius classification at $a_2$* — at least one
    of:
    * (five-point branch) $\exists \rho > 0$ with $|\Lambda(a_2,\rho)| \ge 5$; or
    * (two-radii branch) $\exists\, \rho_c \ne \rho_c'$, both $> 0$, with
      $|\Lambda(a_2,\rho_c)| \ge 4$, $|\Lambda(a_2,\rho_c')| \ge 4$,
      $\forall \tau > 0\, (|\Lambda(a_2,\tau)| < 5)$, and two selected
      four-classes at $a_2$ with radii $\rho_c, \rho_c'$ and disjoint
      supports;
  * (D1.2f) *cap growth* — at least one of:
    * $|\Sigma| \ge 6$; or
    * $|\Sigma| = 5$, $|\Gamma_1| \ge 5$, and $|\Gamma_1| + |\Gamma_2| + 2 = n$; or
    * $|\Sigma| = 5$, $|\Gamma_1| = 4$, $|\Gamma_2| \ge 6$, and $|\Gamma_2| + 6 = n$;
* (D1.3) radii $\rho, \rho' \in \mathbb{R}$ with $\rho > 0$, $\rho' > 0$,
  $\rho' \ne \rho$;
* (D1.4) *no five-row at $a_2$*: $\forall \tau > 0$:
  $|\Lambda(a_2, \tau)| < 5$;
* (D1.5) $|\Lambda(a_2, \rho)| = 4$ and $|\Lambda(a_2, \rho')| = 4$ (exactly);
* (D1.6) selected four-classes $K_1, K_2$ at center $a_2$
  (§1: supports $T_1, T_2 \subseteq A$ of size 4, positive radii, $a_2$ not
  in the supports) with $\mathrm{rad}(K_1) = \rho$, $\mathrm{rad}(K_2) = \rho'$,
  and $T_1 \cap T_2 = \varnothing$;
* (D1.7) strict-interior double hit for both rows:
  $|\Lambda(a_2,\rho) \cap \Gamma_2^{\circ}| \ge 2$ and
  $|\Lambda(a_2,\rho') \cap \Gamma_2^{\circ}| \ge 2$.

**Conclusion.** $\bot$ (False).

*Derived remarks (not hypotheses): $T_1 \subseteq \Lambda(a_2,\rho)$ and
$|T_1| = 4 = |\Lambda(a_2,\rho)|$ give $T_1 = \Lambda(a_2,\rho)$; likewise
$T_2 = \Lambda(a_2,\rho')$. From (D1.2b) and (D1.4): for every $z \in A$
there exists a full 4-point row at $a_2$ avoiding $z$; in particular the
rows at $\rho, \rho'$ are exact and every deletion is covered by one of the
$a_2$-rows. (D1.4) forces the two-radii branch of (D1.2e).*

### §2.2 Leaf D2 — `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome`

**Hypotheses.** (C), (R), and:
* (D2.1) $n \ge 12$;
* (D2.2) an ingress instance (I);
* (D2.3) *swapped protected unique-four frontier*, consisting of:
  * (D2.3a) a **second** surplus-cap packet $S'$ on the same carrier $A$
    (its own non-obtuse circumscribed Moser triangle on the same MEC, its
    own cap triple satisfying the §1 cap-triple axioms, its own surplus
    index with surplus cap of size $> 4$) whose derived roles satisfy the
    five equalities
    $$a_1' = a_2,\quad a_2' = a_1,\quad \Gamma_1' = \Gamma_2,\quad \Gamma_2' = \Gamma_1,\quad \Sigma' = \Sigma$$
    (primes denote $S'$-roles; the third triangle vertex of $S'$ — its
    surplus apex $a_0'$ — is *not* constrained to equal $a_0$);
  * (D2.3b) a radius $r' > 0$;
  * (D2.3c) a critical-pair frontier for $(A, S', r', \chi^{*})$, i.e. the
    full block (C5) re-instantiated with packet $S'$, radius $r'$, and shell
    system $\chi^{*}$: points $q', w' \in \Lambda(a_2, r') \smallsetminus \Sigma$
    (note $a_1' = a_2$, $\Sigma' = \Sigma$), $q' \ne w'$;
    $K_4(A \smallsetminus \{q'\}, a_1)$ and $K_4(A \smallsetminus \{w'\}, a_1)$
    (note $a_2' = a_1$); $\chi^{*}(q') \ne a_1$, $\chi^{*}(w') \ne a_1$;
    the first-apex split for $S'$:
    $K_4(A \smallsetminus \{q', w'\}, a_2)$ or
    $[(|\Lambda(a_2,r')| \in \{4,5\}) \wedge \forall \tau > 0\,(4 \le |\Lambda(a_2,\tau)| \to \tau = r')]$;
    the double survival $K_4(A \smallsetminus \{q', w'\}, a_1)$; and the
    second-apex split for $S'$:
    $K_4(A \smallsetminus \{q', w'\}, a_1)$ or two disjoint full 4-shells at
    $a_1$ through $q'$ and $w'$ at radii $d(a_1, q')$, $d(a_1, w')$;
  * (D2.3d) $|\Lambda(a_2, r')| = 4$ (exactly);
  * (D2.3e) unique four-radius at the second apex:
    $\forall \tau > 0$: $4 \le |\Lambda(a_2,\tau)| \Rightarrow \tau = r'$;
  * (D2.3f) double-deletion obstruction at the second apex:
    $\lnot K_4(A \smallsetminus \{q', w'\},\, a_2)$.

**Conclusion.** $\bot$ (False).

*Derived remarks: $q', w' \notin \Lambda(a_1,\hat\rho)$ (else
$\chi^{*}(q') = a_1$, contradicting (D2.3c)); (D2.3f) forces the right
disjunct of the $S'$ first-apex split; $d(a_2, q') = d(a_2, w') = r'$.
Note the coexistence of (R4)/(R5) at $a_1$ with (D2.3d)/(D2.3e) at $a_2$:
each apex carries an exact four-row at its own unique four-point radius.*

### §2.3 Exact-five residual frame E (used by D3, D4)

**(E)** In addition to (C):
* (E1) $A$ is a minimal counterexample.
* (E2) no $(m,4,4)$ packet exists on $A$ (as in (R2)).
* (E3) $n > 9$.
* (E4) $|\Lambda(a_1, \hat\rho)| = 5$ (exactly).
* (E5) unique four-radius at the first apex:
  $\forall \rho > 0$: $4 \le |\Lambda(a_1,\rho)| \Rightarrow \rho = \hat\rho$.
* (E6) full deletion robustness at the first apex:
  $\forall z \in A$: $K_4(A \smallsetminus \{z\},\, a_1)$.
* (E7) original-pair double-deletion obstruction:
  $\lnot K_4(A \smallsetminus \{q_F, w_F\},\, a_1)$.
* (E8) a *reselected strict-interior pair*: points
  $\tilde q, \tilde w \in \Lambda(a_1,\hat\rho) \cap \Gamma_1^{\circ}$,
  $\tilde q \ne \tilde w$, with the second-apex double survival
  $K_4(A \smallsetminus \{\tilde q, \tilde w\},\, a_2)$.
* (E9) interior-pair double-deletion obstruction:
  $\lnot K_4(A \smallsetminus \{\tilde q, \tilde w\},\, a_1)$.

*Derived: (E7) and (E9) force the right disjunct of (C5.4);
$q_F, w_F, \tilde q, \tilde w$ all lie in the 5-element set
$\Lambda(a_1,\hat\rho)$ (the two pairs may overlap); by (E6) and the
no-survival condition of (C4), $\chi(z) \ne a_1$ for every $z \in A$; the
blocker rows $R_{\tilde q}, R_{\tilde w}$ of (C4) are full 4-point rows
through $\tilde q$ resp. $\tilde w$ centered at $\chi(\tilde q)$ resp.
$\chi(\tilde w)$, and
$\lnot K_4(A\smallsetminus\{\tilde q\}, \chi(\tilde q))$,
$\lnot K_4(A\smallsetminus\{\tilde w\}, \chi(\tilde w))$ hold.*

### §2.4 Leaf D3 — `false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual`

**Hypotheses.** (C), (E), and:
* (D3.1) distinct obstruction centers: $\chi(\tilde q) \ne \chi(\tilde w)$;
* (D3.2) directed cross-deletion survival:
  $K_4\bigl(A \smallsetminus \{\tilde w\},\, \chi(\tilde q)\bigr)$
  **or**
  $K_4\bigl(A \smallsetminus \{\tilde q\},\, \chi(\tilde w)\bigr)$.

**Conclusion.** $\bot$ (False).

### §2.5 Leaf D4 — `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual`

**Hypotheses.** (C), (E), and:
* (D4.1) common obstruction center: $\chi(\tilde q) = \chi(\tilde w) =: b$;
* (D4.2) mutual cross membership: $\tilde w \in R_{\tilde q}$ and
  $\tilde q \in R_{\tilde w}$ (each point lies on the other's blocker row);
* (D4.3) $b \in \Gamma_1^{\circ}$;
* (D4.4) $b \notin \Sigma$;
* (D4.5) no third carrier bisector point: for every $x \in A$ with
  $x \ne a_1$ and $x \ne b$:
  $d(x, \tilde q) \ne d(x, \tilde w)$.

**Conclusion.** $\bot$ (False).

*Derived remarks for D4: $b \in A \smallsetminus \{\tilde q\}$; $b \ne a_1$
(if $b = a_1$, the no-survival condition at $\tilde q$ contradicts (E6));
from (D4.1)–(D4.2), $d(b,\tilde q) = r_{\tilde q} = r_{\tilde w} = d(b,\tilde w)$
and $R_{\tilde q} = R_{\tilde w}$ is a single full 4-row at $b$ containing
both $\tilde q$ and $\tilde w$; $a_1$ is also equidistant from
$\tilde q, \tilde w$ (both at distance $\hat\rho$). So (D4.5) says: $a_1$
and $b$ are the **only** carrier points on the perpendicular bisector of
$\tilde q\,\tilde w$.*

---

## §3 Assume-solvable framing

> Assume for purposes of this task that a complete resolution exists for each
> leaf, but do not assume in advance which direction it takes. For each leaf,
> a complete resolution must prove exactly one of the two statements in §4.
> The four leaves are logically independent as stated (D1/D2 share the blocks
> (C)+(R); D3/D4 share (C)+(E)); a resolution of any one leaf in either
> direction is a complete deliverable for that leaf.

---

## §4 Dual-branch success criteria

For each leaf **L ∈ {D1, D2, D3, D4}**:

**Branch A (refutation of the configuration — proves the leaf).**
A complete rigorous proof that the hypotheses of L are contradictory: from
*arbitrary* data satisfying every hypothesis of L, derive $\bot$. The proof
must:
* treat every quantified object as arbitrary — in particular the critical
  shell system $\chi$ (D3/D4) or $\chi^{*}$-inputs (D1/D2), the cap triple,
  the Moser triangle, and $n$ itself (a fixed but unknown integer subject
  only to the stated bounds) are **given**, not chosen by the prover;
* close **every** disjunct of every disjunctive hypothesis it uses
  ((C5.4), (C5.6), (D1.2e), (D1.2f), (D3.2), the $S'$-splits in (D2.3c));
* use no hypotheses beyond those listed for L — in particular, without
  additional assumptions such as: general position, distinct pairwise
  distances, symmetry of the configuration, $n$ equal to any specific value,
  the interior pairs being disjoint from $\{q_F, w_F\}$, the two frontier
  packets in D2 sharing their third triangle vertex, or any Erdős-97
  statement not proved from the listed hypotheses;
* be formalizable in Lean 4 with mathlib (finite combinatorics + Euclidean
  plane geometry; no appeal to unformalized literature results — see §6).

**Branch B (exact realizability certificate — kills the leaf and the route).**
One **fixed** configuration with exact algebraic coordinates satisfying
**every** hypothesis of L. This proves the leaf statement unprovable (its
hypotheses are consistent), which eliminates this proof route for the
project. This outcome is **equally valuable** as Branch A and must be
reported as such — do not treat it as failure. A complete certificate must
supply, with exact (rational or algebraic-number, with defining polynomials)
data, every layer of the stack:
* the point set $A$ (hence $n$), with verification of (C1.2) convex
  independence and (C1.3) the $K_4$ property at **every** point;
* the MEC, the Moser triangle of $S$ with its non-obtuseness, the cap triple
  (note: given the triangle, the arc invariant *determines* the caps as
  sign-condition filters; the certificate must verify the membership
  pattern holds for those filters), and the surplus index;
* the critical shell system: a full table $q \mapsto (\chi(q), r_q, R_q)$
  over $A$, with the no-survival condition verified for each $q$ (a finite
  check: every distance class of $A \smallsetminus \{q\}$ around $\chi(q)$
  has $\le 3$ points);
* the frontier pair and every (C5) field;
* the minimality hypothesis (R1)/(E1) — see the interface note below;
* the universal no-$(m,4,4)$ field (R2)/(E2): a finite check over **all**
  candidate packets — every triple of pairwise-distinct non-obtuse
  MEC-boundary points of $A$ whose arc filters form a valid cap triple, and
  every surplus designation on it;
* every leaf-specific field of L, including the exactly-4 / exactly-5
  cardinalities, the universally quantified radius-uniqueness and
  bisector fields (finite checks over $A$'s distance classes), and for D2
  the entire second packet $S'$ and second frontier.

*Quantifier note (the crux for both branches).* All universally quantified
hypotheses over radii — (R5), (E5), (D1.4), (D2.3e), and the no-survival
conditions — range over all positive reals but are equivalent to finite
checks over the distance multiset of $A$, since $\Lambda(c,\rho) \ne \varnothing$
only for $\rho$ realized as a distance. Branch A may use only the stated
form; Branch B must verify the finite equivalent exactly.

*Interface assumption (minimality).* (R1)/(E1) is the one hypothesis that is
not a finite check on the certificate configuration: it quantifies over all
finite convex-independent $K_4$ sets $B$ and asserts $n \le |B|$. Treat
(R1)/(E1) as an interface assumption with the following precise meaning:
*$n$ is the minimum cardinality of a nonempty convex-independent plane set
with the $K_4$ property, assuming such sets exist at all.* A Branch-B certificate
therefore cannot be closed unconditionally; a certificate satisfying every
other hypothesis must state its minimality obligation explicitly as
"conditional on $n = \min$", and is then a *conditional route-kill*: it
proves the leaf unprovable **unless** the project can refute minimal
configurations of that specific cardinality by other means. Report this
status precisely; do not silently claim an unconditional kill.
The same applies to (C1.3)+(R1) jointly: any Branch-B configuration is
itself a convex-independent $K_4$ set, i.e. a counterexample candidate for
Erdős 97 — finding one would be a major event and must be flagged
accordingly, not buried in a leaf report.

**Per-leaf notes.**
* D1 vs D3/D4 are mutually exclusive at the level of (R4) ($|\Lambda(a_1,\hat\rho)|=4$)
  versus (E4) ($=5$): one configuration cannot serve as Branch-B certificate
  for both groups. D1 and D2 may share a configuration through (C)+(R)+(I)
  but need different leaf-specific tails.
* For D2 Branch A, the two unique-radius fields (R5) at $a_1$ and (D2.3e)
  at $a_2$ interact with the two frontiers; the proof must respect that the
  two packets share $\Sigma$ and swap $\Gamma_1 \leftrightarrow \Gamma_2$,
  $a_1 \leftrightarrow a_2$ exactly as stated, and nothing more.
* For D4 Branch A, note the derived bisector picture: exactly two carrier
  points ($a_1$, $b$) on the perpendicular bisector of $\tilde q \tilde w$,
  with $b$ in the strict interior of $\Gamma_1$, $a_1$ its opposite apex,
  and a single shared 4-row at $b$ through both points.

## §4b Sanctioned reformulations (optional)

* **Concyclic-row model.** $\Lambda(c,\rho)$ is the intersection of $A$ with
  the circle of center $c$, radius $\rho$; $K_4(B,c)$ says some circle
  centered at $c$ passes through $\ge 4$ points of $B$. Two distinct circles
  meet in $\le 2$ points; two rows at the same center and different radii
  are disjoint. This reformulation is exact and may be used freely.
* **Angular model on the MEC.** The three Moser vertices and the caps may be
  parametrized by angles on the MEC circle; caps become closed arcs by the
  arc invariant. Caution: points of $A$ other than $v_1, v_2, v_3$ need
  **not** lie on the MEC circle; only the chord-side characterization of cap
  membership is available for them. This structure must be preserved in any
  angular reformulation: a cap is *not* an arbitrary subset of an annulus.
* **Normalization.** A similarity of the plane (translation, rotation,
  reflection, positive scaling) preserves every hypothesis with all radii
  scaled by the same factor; one may normalize e.g. $a_1 = (0,0)$ and
  $\hat\rho = 1$. This must be stated and applied uniformly, not per-case.

---

## §5 Insufficient-progress list

> Partial progress does not count unless it implies exactly one of the two
> resolutions of §4 for at least one leaf. In particular, the following are
> insufficient:

* proofs assuming any symmetry not in the hypotheses (isosceles or
  equilateral Moser triangle, collinear centers, concurrent bisectors,
  reflection symmetry of the configuration, regular spacing on rows);
* genericity assumptions not derivable from the hypotheses (all pairwise
  distances distinct, no 4 concyclic points beyond the listed rows, no 3
  collinear carrier points beyond what convex independence gives);
* arguments closing only some disjuncts of (C5.4), (C5.6), (D1.2e),
  (D1.2f), (D3.2), or the $S'$-splits of (D2.3c), and asserting the rest
  "similar";
* arguments valid only for a special critical shell system $\chi$ (Branch A
  must handle arbitrary $\chi$ satisfying (C4); choosing a convenient
  $\chi$ is only legitimate in Branch B);
* fixing $n$ to a specific value (e.g. $n = 12$) in Branch A; the bounds are
  $n \ge 12$ (D1/D2) and $n \ge 10$ (D3/D4);
* numerical near-configurations (floating point, unverified optimization
  output) presented for Branch B without exact algebraic verification of
  **every** hypothesis; a candidate failing even one hypothesis — including
  one disjunct-side condition, one strictness, or one universally
  quantified field — is worthless;
* Branch-B candidates verified against the distinguished packet $S$ only,
  ignoring the universal no-$(m,4,4)$ quantification (R2)/(E2) over all
  packets on $A$, or omitting the full shell-system table, or omitting the
  second packet and frontier in D2;
* heuristic dimension counts ("the system has more equations than degrees of
  freedom") in either direction;
* modified-configuration results: different cardinalities (class of size 4
  where 5 is stated or vice versa; $|B_i| \ge 4$ where $= 4$ is stated),
  closed cap $\Gamma_1$ where the strict interior $\Gamma_1^{\circ}$ is
  stated, non-strict inequalities where strict are stated, $\le$ where $<$
  is stated, or dropping the exclusions $x \ne a_1$, $x \ne b$ in the
  bisector fields;
* weakening a universally quantified hypothesis to finitely many sampled
  radii or centers without the exactness argument of §4's quantifier note;
* results about the informal Erdős-97 problem (or about $(m,4,4)$ regimes,
  cap distributions, etc.) that do not discharge one of these four specific
  leaves;
* conditional results assuming another unproved leaf or another open
  obligation of this project;
* asymptotic ("for $n$ large enough") arguments;
* reducing a leaf to another unproved incidence or cap-counting statement of
  comparable strength.

---

## §6 Allowed background

> Standard proved theorems from finite combinatorics, convexity theory
> (Carathéodory, Radon, extreme points of convex hulls), elementary plane
> Euclidean geometry (perpendicular-bisector characterization of
> equidistance, two distinct circles intersect in at most two points, power
> of a point, Ptolemy's inequality/equality, law of cosines), and basic
> facts about minimum enclosing circles (existence, uniqueness, the
> Sylvester dichotomy: the MEC is determined either by a diametral pair or
> by at least three boundary points; every non-obtuse inscribed triangle
> contains the center in its closed convex hull) may be used, but must be
> stated accurately and applied with all necessary hypotheses.

It is known (proved without `sorry` in the project's support modules, and
re-derivable from the stated hypothesis blocks) that: the cap-sum identity
$|\Sigma| + |\Gamma_1| + |\Gamma_2| = n + 3$ holds; $|\Gamma_i^{\circ}| = |\Gamma_i| - 2$;
each fixed row $\Lambda(a_2,\rho)$ meets the first-apex marginal
$M_{\hat\rho}$ in at most one point; a selected four-class at a center in a
closed cap meets that cap in at most two points when the center lies on the
cap ("ordered-cap row bound"); and the exact-class override $\chi^{*}$ is a
valid critical shell system given (R4)/(R6). These may be used as
established background *after restating them precisely*; they mean exactly
what they say and do not imply any stronger incidence bound.

Results from the published literature on repeated distances in convex
position may be used only if their proofs are complete in the cited source
and their hypotheses are verified here exactly; no result may be imported
whose strength is comparable to a leaf itself (§5 last bullet).

---

## §7 Multiagent orchestration block

> Use multiagent v2 aggressively and dynamically. You have up to 40
> concurrent agents available. Do not use a fixed assignment such as "N
> agents for strategy X." Instead, manage the search using the following
> heuristics:
>
> * Begin with a genuinely diverse portfolio of approaches. Agents should
>   explore substantially different formulations, invariants, reductions,
>   and computational sanity checks, drawing on (at minimum) these families:
>   1. perpendicular-bisector / co-radiality arguments (equidistant centers
>      lie on bisector lines; count carrier points per line; convex
>      independence caps collinear carrier points);
>   2. two-circles-meet-in-≤-2-points row bookkeeping across the centers
>      $a_1, a_2, \chi(\tilde q), \chi(\tilde w), c_1, b$;
>   3. cap/arc ordering on the convex shell: cyclic order of $A$, chord-side
>      sign patterns, monotonicity of distances from an apex along an
>      opposite arc;
>   4. distance-rigidity spindle chains (rigid unit-style subgraphs from
>      overlapping 4-rows forcing point coincidences or reflections);
>   5. exact coordinate normalization + polynomial elimination (place
>      $a_1 = (0,0)$, $\hat\rho = 1$; Gröbner bases / resultants via
>      msolve/Singular on the distance system);
>   6. SMT encodings over nonlinear real arithmetic (Z3, cvc5) of a full
>      leaf hypothesis system at fixed small $n$ — unsat cores toward
>      Branch A intuition, models toward Branch B candidates;
>   7. SAT/ILP encodings of the combinatorial layer (cap memberships, row
>      memberships, shell tables) with geometric consistency constraints
>      added lazily;
>   8. interval-arithmetic certification of numerically found candidates,
>      followed by mandatory exact algebraic verification;
>   9. pigeonhole on row/cap occupancy: cap-sum identity, marginal bounds,
>      the ≤ 2-per-cap and ≤ 1-per-marginal row bounds, the $|B_1 \cap B_2| \le 2$
>      overlap bound;
>   10. repeated-distance extremal counting for convex position (maximum
>       multiplicity of a distance from a fixed vertex of a convex polygon;
>       Edelsbrunner–Hajnal-type configurations as candidate sources);
>   11. power-of-a-point / radical-axis identities linking the two disjoint
>       4-rows of D1 and the swapped frontiers of D2;
>   12. Ptolemy / law-of-cosines exact identities on concyclic 4-tuples and
>       their incompatibility with cap-interior constraints;
>   13. minimality exploitation: from the hypothesized data, delete a point
>       and repair the $K_4$ property to build a smaller convex $K_4$ set,
>       contradicting (R1)/(E1);
>   14. $(m,4,4)$-exclusion exploitation: from the hypothesized cap sizes,
>       construct an explicit alternative packet with both opposite caps of
>       size 4, contradicting (R2)/(E2) — natural in D1's cap-growth branch
>       $|\Gamma_1| = 4$ and in D2's swapped roles;
>   15. angular/trigonometric parametrization + cylindrical algebraic
>       decomposition feasibility checks at small $n$;
>   16. exact small-$n$ exhaustive candidate searches over structured
>       families (points on few concentric circles per apex) for Branch B.
>
> * Do not tell most agents the currently favored approach. Preserve
>   independence during early rounds so that agents do not all converge to
>   the same attractive but incomplete argument. The known attractors here
>   are: (a) generic-position dimension counting ("too many constraints, so
>   contradiction" — never closes); (b) assuming a 4-row or 5-row is an
>   arc-consecutive block of the convex order (unproved ordering
>   assumption); (c) re-deriving yet another cap-counting or incidence
>   reduction of strength comparable to the leaf and declaring progress.
>
> * Maintain an explicit registry of approach families. Group agents by the
>   mathematical idea they are using, not by superficial wording. If many
>   agents converge to one family, redirect some of them toward
>   underexplored formulations.
>
> * Do not allow one approach to dominate merely because it gives an elegant
>   reformulation. A route that ends at an unproved incidence lemma
>   equivalent in strength to the original leaf is not close to completion
>   unless it supplies a genuinely new proof of that lemma.
>
> * When an approach stalls at a theorem-strength missing lemma, mark that
>   route as blocked. Only continue assigning agents to it if someone
>   proposes a materially new mechanism, invariant, construction,
>   quantitative estimate, or exact algebraic identity.
>
> * Keep several incompatible proof routes alive through multiple rounds.
>   Maintain both Branch-A routes and Branch-B routes **per leaf** until one
>   side is rigorously ruled out. Cross-pollinate ideas only after
>   independent agents have developed them far enough to expose their real
>   strengths and gaps.
>
> * Use computational agents throughout. They should perform exact
>   small-case computation, solver encodings (SMT/SAT/ILP/Gröbner/CAD),
>   candidate configuration searches, and counterexample hunts against
>   intermediate lemmas. Always validate an encoding first with a smoke test
>   against a known result (e.g. verify the encoding rejects a configuration
>   violating a single stated hypothesis, and accepts a known-consistent
>   sub-system). Computation is evidence unless it is converted into a
>   rigorous general proof or an exact certificate completing a valid
>   reduction.
>
> * Search aggressively for counterexamples to proposed lemmas. Before any
>   intermediate lemma or sublemma is relied on, assign agents
>   (computational where possible) to attempt to refute it. A found
>   counterexample kills the route immediately and cheaply; a lemma that has
>   survived no refutation attempt is not established.
>
> * Use adversarial agents throughout — independent agents that did not
>   produce the argument under audit. Every candidate proof must be checked
>   for:
>   * convex independence used in its exact extreme-point form (strict
>     non-membership in the hull of the others), not a weaker "convex
>     position" paraphrase;
>   * the $K_4$ predicate quantified correctly ($\exists \rho > 0$ with
>     $\ge 4$ points; row taken in the correct deleted set
>     $A \smallsetminus \{\cdot\}$ or $A \smallsetminus \{\cdot,\cdot\}$);
>   * minimality (R1)/(E1) used only in its global form (all convex
>     $K_4$ sets $B$), never as local deletion-stability;
>   * no-$(m,4,4)$ (R2)/(E2) applied over **all** packets on $A$, with a
>     genuinely constructed alternative packet when invoked;
>   * closed caps vs strict interiors kept distinct ($\Gamma_i$ contains
>     its two Moser endpoints; $\Gamma_i^{\circ}$ does not);
>   * the arc invariant used with the closed-side (chord points on both
>     sides) convention;
>   * non-obtuseness used as $\ge 0$ inner products (right angles allowed);
>   * MEC facts used with all points inside the **closed** disc and only
>     $v_1, v_2, v_3$ guaranteed on the boundary;
>   * exact cardinalities (= 4, = 5) never silently relaxed to bounds, and
>     conversely bounds ((D1.2c,d), (I7)) never silently sharpened;
>   * unique-radius fields applied only to positive radii with $\ge 4$
>     points, and only at their own center ($a_1$ for (R5)/(E5), $a_2$ for
>     (D2.3e));
>   * full rows ($\Lambda(c,r)$, critical shells) vs selected four-subsets
>     (selected four-classes, $B_1, B_2$) never conflated;
>   * $\chi$ vs $\chi^{*}$ kept separate: D3/D4 fields use the original
>     system $\chi$; the ingress (I) and D2's swapped frontier use
>     $\chi^{*}$;
>   * $\Omega$-membership used as $\chi^{*}(x) \ne a_1$ with the derivation
>     $\chi^{*}(q_F) = a_1$ made explicit;
>   * deletion sets tracked exactly (which point is erased where; erasure
>     order irrelevant);
>   * the D1 disjointness $T_1 \cap T_2 = \varnothing$ and interior counts
>     (D1.7) applied to the correct rows and the correct cap
>     ($\Gamma_2^{\circ}$, not $\Gamma_1^{\circ}$);
>   * D2's five role equalities used exactly (in particular the third
>     vertex of $S'$ is unconstrained);
>   * D4's bisector field applied only with both exclusions $x \ne a_1$,
>     $x \ne b$;
>   * every §5 item;
>   * circular use of a statement equivalent to the leaf being proved (or to
>     another open leaf of this family) as the desired conclusion.
>
> * Require agents to return concrete lemmas, constructions, equations,
>   exact coordinate certificates, solver artifacts (encodings + logs +
>   independent re-checks), or counterexamples to proposed sublemmas. Reject
>   status reports, vague optimism, and claims that an unproved
>   incidence-strength statement is "routine."
>
> * The root agent should repeatedly synthesize, challenge, redirect, and
>   launch new rounds. Do not stop after the first wave fails. Produce a
>   complete solution only if it survives adversarial audit; otherwise
>   report only the strongest rigorously proved derivation and its exact
>   remaining gap.

---

## §8 Anti-quit block

> Do not return merely because current approaches fail or agents report
> theorem-strength gaps. Continue launching new rounds, reopening blocked
> approaches only when there is a genuinely new mechanism, and searching for
> fresh formulations. The four leaves offer four independent targets; when
> one leaf stalls in both branches, shift weight to another leaf rather than
> stopping.

---

## §9 Return contract

> Return only when at least one leaf of {D1, D2, D3, D4} has been completely
> resolved — Branch A (a rigorous proof of $\bot$ from that leaf's full
> hypothesis list) or Branch B (an exact certificate satisfying every
> hypothesis, with the minimality-interface caveat of §4 stated precisely) —
> and the argument survives adversarial audit. Report the status of all four
> leaves. Do not return a reduction, partial result, isolated missing lemma,
> finite computation, numerical guess, "best effort" summary, or explanation
> of why the problem is difficult.
>
> Do not stop, return, or give up until you have found a complete and
> rigorous resolution of at least one leaf. Continue exploring every
> plausible approach, repairing failed arguments, and developing new ones
> until that standard is met.
>
> Spend at least 6 full rounds of the §7 approach portfolio (across the four
> leaves, both branches) before even thinking of returning or giving up.

---

## §10 Web-search restriction

> Public search may be used only for ordinary mathematical background or
> standard named theorems (convexity, circle geometry, repeated-distance
> extremal theory), not to search for a solution to these exact statements,
> for the Erdős-97 formalization project that produced them, or for any
> benchmark status. Do not search the public web to determine whether these
> statements are open, and do not answer that they are open.

---

## Appendix A — Leaf ↔ Lean declaration map

All paths relative to
`/Users/adam/projects/math-projects/erdos-97-96-formalization/lean/`.

| Leaf | Declaration | File : line (sorry) |
|---|---|---|
| D1 | `Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch` | `Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:6090` (`:6117`) |
| D2 | `Problem97.ATailFrontierLiveClosure.false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome` | `Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:6167` (`:6177`) |
| D3 | `Problem97.ATailFrontierLiveClosure.false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual` | `Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:6247` (`:6253`) |
| D4 | `Problem97.ATailFrontierLiveClosure.false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual` | `Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:6258` (`:6264`) |

Spine context: D3/D4 are consumed by
`false_of_originalFrontierUniqueRadiusArm` (`FrontierLiveClosure.lean:6268`);
D1 by `false_of_exactFourPostCardElevenRobustSurface` (`:6123`); D2 by
`false_of_firstApexUniqueRadiusExactFourResidual_of_carrierCard_ge_twelve`
(`:6204`). All four leaves' declarations carry their hypotheses explicitly
in their binders; no enclosing `variable`/`include` block applies to them
(the file's only such block is inside the `TwoSourceExactCollisionRowsTerminal`
namespace opening at line 7417 — `section` :7419, `variable` :7421,
`include` :7467 — all after the four leaves).

## Appendix B — Mathematical object ↔ Lean structure map

| §-object | Lean name | Source |
|---|---|---|
| carrier bundle (C1) | `Problem97.CounterexampleData` | `P97/U1TwoShortCapReduction.lean:83` |
| minimality (R1)/(E1) | `CounterexampleData.Minimal` | `P97/U1TwoShortCapReduction.lean:158` |
| convex independence | `ConvexIndep` (project abbrev of upstream `ConvexIndep`) | `P97/Foundation.lean:28`; upstream `FormalConjecturesForMathlib/Geometry/2d.lean:76` |
| $K_4(B,c)$ | `Erdos97.HasNEquidistantPointsAt 4 B c` | `.lake/packages/formal_conjectures/FormalConjectures/ErdosProblems/97.lean:34` |
| $K_4$ property | `Erdos97.HasNEquidistantProperty 4 A` | same file `:48` |
| MEC | `Problem97.MEC.mec` / `MinEnclosingCircle` | `P97/MEC/Basic.lean:275` / `:66` |
| MEC Moser triangle + dichotomy | `Problem97.MEC.MoserTriangle` | `P97/Moser/Triangle.lean:59` |
| non-obtuse triangle | `MEC.NonObtuseCircumscribedMoserTriangle` | `P97/Moser/TriangleNonObtuse.lean:667` |
| structural triangle | `Problem97.MoserTriangle` | `P97/Cap/Structure.lean:98` |
| signed area / arc predicate | `signedArea2` / `OnArcOpposite` | `P97/Foundation.lean:49` / `:57` |
| cap triple | `Problem97.CapTriple` | `P97/Cap/Structure.lean:161` |
| surplus-cap packet $S$ | `Problem97.SurplusCapPacket` | `P97/Cap/PartitionFromMEC.lean:332` |
| $(m,4,4)$ predicate | `SurplusCapPacket.IsM44` | `P97/Cap/PartitionFromMEC.lean:443` |
| $\Sigma,\Gamma_1,\Gamma_2$ | `surplusCap` / `oppCap1` / `oppCap2` | `P97/Cap/PartitionFromMEC.lean:367/:381/:388` |
| $a_0,a_1,a_2$ | `surplusApex` / `oppApex1` / `oppApex2` | `P97/U1TwoShortCapReduction.lean:313/:297/:305` |
| cap interiors $\Gamma_i^{\circ}$ | `capInteriorByIndex` (+ `oppIndex1/2`) | `P97/Cap/PartitionFromMEC.lean:474` (`:521/:528`) |
| row $\Lambda(c,\rho)$ | `Problem97.SelectedClass` | `P97/WitnessPacketInterface.lean:59` |
| selected four-class | `Problem97.SelectedFourClass` | `P97/U1CarrierInjection.lean:405` |
| critical four-shell | `Problem97.CriticalFourShell` | `P97/U1CarrierInjection.lean:547` |
| labeled shell | `Problem97.CriticalSelectedFourClass` | `P97/U1CarrierInjection.lean:635` |
| critical shell system (C4) | `Problem97.CriticalShellSystem` | `P97/U1CarrierInjection.lean:1015` |
| class-override $\chi^{*}$ | `CriticalShellSystem.overrideExactSelectedClass`; instantiated as `lateFirstApexSystem` | `P97/U1CarrierInjection.lean:1214`; `P97/ATail/CardElevenUniqueFourCertificate/Support/Unique4LateChoiceTerminal/UniqueFourLateChoiceTerminal.lean:48` |
| survivor pair (C5.1–C5.3) | `SurvivorPairRelocationPacket` | `P97/ATail/CriticalPairFrontier.lean:288` |
| splits (C5.4)/(C5.6) | `FirstApexSplit` / `SecondApexSplit` | `P97/ATail/CriticalPairFrontier.lean:544/:555` |
| frontier $F$ (C5) | `CriticalPairFrontier` | `P97/ATail/CriticalPairFrontier.lean:568` |
| block (R) | `ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual` | `P97/ATail/CardElevenUniqueFourCertificate/Support/UniqueArmRouteAudit/OriginalUniqueResidualDispatch.lean:43` |
| fiber $\Omega$, good sources $G$ | `outsideFirstApexFiber` / `goodOutsideSources` (via `actualBlockerFiber`) | `P97/ATail/ExactFourPhysicalConsumer.lean:79/:104`; `P97/ATail/SurvivalCover.lean:40` |
| ingress (I) | `ExactFourPhysicalCommonDeletionIngress` | `P97/ATail/ExactFourPhysicalConsumer.lean:421` |
| two-center packet (I4–I8) | `CommonDeletionTwoCenterPacket` | `P97/ATail/CommonDeletionTwoCenter.lean:29` |
| deleted 4-row (I7) | `U5QDeletedK4Class` (over `CounterexampleData.skeleton`) | `P97/U5GlobalIncidenceBasic.lean:243`; `P97/U5ModeADeletion.lean:88` |
| robustness (D1.2b)/(E6) | `FullyDeletionRobustAt` | `P97/ATail/DeletionRobustness.lean:27` |
| radius classification (D1.2e) | `DeletionRobustRadiusClassification` | `P97/ATail/ExactFourRobustCapExpansion.lean:123` |
| cap growth (D1.2f) | `ExactFourRobustCapGrowth` (+ two profile structures) | `P97/ATail/ExactFourRobustCapExpansion.lean:269` (`:250/:259`) |
| surface (D1.2) | `ExactFourPostCardElevenRobustSurface` | `P97/ATail/ExactFourRobustCapExpansion.lean:280` |
| swapped frontier (D2.3) | `SwappedFirstApexUniqueFourFrontier` | `P97/ATail/PhysicalSecondApexSwap.lean:117` |
| interior pair (E8) | `ExactFiveInteriorCriticalPairFrontier` (private `Witness`) | `P97/ATail/FirstApexExactFiveInteriorFrontier.lean:338` (`:177`) |
| leaf-D3 block | `FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual` | `P97/ATail/FirstApexUniqueRadiusResidual.lean:175` |
| leaf-D4 block | `FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual` | `P97/ATail/FirstApexUniqueRadiusResidual.lean:209` |
| unique-radius arm (context) | `OriginalFrontierUniqueRadiusArm` | `P97/ATail/OrientedPhysicalApexIngress.lean:226` |
