# Complete-resolution prompt: rigid 2+2+1 physical-apex chain (Family A)

> **Status refresh (2026-08-28): HISTORICAL PROMPT SNAPSHOT.** The monolithic
> source path and all line numbers below are obsolete, and several listed
> declarations were closed, renamed, or removed. Related live obligations now
> reside in `Rigid221Placement.lean`, `Rigid221Closure.lean`, and
> `Rigid221SourceHeavy.lean`. Reconstruct a fresh packet from
> `proof-blueprint spine` before dispatch; do not send this document verbatim.

You are working on eight load-bearing theorems in the Lean 4 repository
`erdos-97-96-formalization`, all in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`, namespace
`Problem97.ATailFrontierLiveClosure`:

1. `false_of_exactFourMutualOmissionRigid221_minimalCore` (:2253)
2. `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted` (:2459)
3. `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy` (:2613)
4. `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_oppositeRowHeavy` (:2628)
5. `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_neitherRowHeavy` (:2651)
6. `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge` (:3353)
7. `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther_oppositeRowHeavy` (:5272)
8. `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther_sparseRows` (:5293)

Each theorem's conclusion is `False`; each currently ends in `sorry`. The
current source, not historical plans or scratch experiments, is authoritative.
Do not weaken, strengthen, replace, or bypass any of the eight statements. Do
not add axioms, extra assumptions, compatibility wrappers, conditional
closers, proposition-valued placeholders, or new `sorry`s. This document is a
faithful mathematical translation of the eight statements with every Lean
structure unfolded; the Lean source remains the ground truth, and the appendix
maps every object back to its Lean name.

## §1 Notation preamble

All definitions below are self-contained; assume no access to the repository.

**Plane, distance, classes.**

- Work in the Euclidean plane $\mathbb{R}^2$ (Lean: `EuclideanSpace ℝ (Fin 2)`),
  with Euclidean distance $d(x,y)$. Points are written $x=(x_1,x_2)$.
- $A$ is a finite set of points of $\mathbb{R}^2$; write $n=|A|$.
- For $p\in\mathbb{R}^2$ and $t\in\mathbb{R}$, the **radius class**
  $$\mathrm{Cl}(p,t)\;=\;\{x\in A: d(p,x)=t\}.$$
  (Lean `SelectedClass D.A p t`. The center $p$ need not lie in $A$; if $p\in A$
  and $t>0$ then $p\notin\mathrm{Cl}(p,t)$.)
- For a finite $X\subseteq\mathbb{R}^2$ and $p\in\mathbb{R}^2$, write
  $$K_4(X;p)\iff \exists\,t>0:\ |\{x\in X: d(p,x)=t\}|\ge 4.$$
  (Lean `HasNEquidistantPointsAt 4 X p`.) "$A$ has the $K_4$ property" means
  $K_4(A;p)$ for **every** $p\in A$.
- **Convex independence** (`ConvexIndep A`): every $a\in A$ satisfies
  $a\notin\mathrm{convexHull}(A\setminus\{a\})$ — i.e. $A$ is in strictly
  convex position. Standard consequence (available): no three points of $A$
  are collinear.
- **Global minimality** (`D.Minimal`) — interface assumption quantifying over
  all configurations: for every nonempty finite $B\subset\mathbb{R}^2$ that is
  convex-independent and has the $K_4$ property, $n\le|B|$.

**Minimum enclosing circle and the Moser triangle.**

- $\mathrm{mec}(A)$ is the minimum enclosing circle of $A$: center $\Omega$,
  radius $R_0\ge 0$, all of $A$ in the closed disk, and $R_0$ minimal among
  all enclosing (center, radius) pairs. (For finite nonempty $A$ the MEC is
  unique; uniqueness is standard background.)
- The configuration carries a **Moser triangle**: three pairwise distinct
  points $v_1,v_2,v_3\in A$ with
  $d(v_i,\Omega)=R_0$ for $i=1,2,3$ (all on the MEC boundary), and all three
  vertex angles non-obtuse:
  $$\langle v_2-v_1,\,v_3-v_1\rangle\ge 0,\quad
    \langle v_3-v_2,\,v_1-v_2\rangle\ge 0,\quad
    \langle v_1-v_3,\,v_2-v_3\rangle\ge 0.$$
- Signed area: $\mathrm{sa}(v,b,c)=(b_1-v_1)(c_2-v_2)-(c_1-v_1)(b_2-v_2)$.
  "$v$ lies on the closed arc from $b$ to $c$ not through $a$" is the closed
  chord-separation predicate
  $$\mathrm{OnArc}(a,b,c;v)\iff \mathrm{sa}(v,b,c)\cdot\mathrm{sa}(a,b,c)\le 0.$$
  Equality (point on the chord $b$–$c$) puts $v$ on **both** sides; closed
  caps include their chords.

**Cap partition and the surplus packet $S$.**

$S$ consists of the Moser triangle above together with three **closed caps**
$C_1,C_2,C_3\subseteq A$ satisfying:

- membership pattern: $v_i\notin C_i$; $v_j,v_k\in C_i$ for $\{i,j,k\}=\{1,2,3\}$;
  every non-Moser point of $A$ lies in exactly one cap; consequently
  $|C_1|+|C_2|+|C_3|=n+3$;
- arc characterization: for every $v\in A$,
  $v\in C_1\iff\mathrm{OnArc}(v_1,v_2,v_3;v)$,
  $v\in C_2\iff\mathrm{OnArc}(v_2,v_3,v_1;v)$,
  $v\in C_3\iff\mathrm{OnArc}(v_3,v_1,v_2;v)$;
- a **surplus index** $\sigma\in\{1,2,3\}$ with $|C_\sigma|>4$. Write (indices
  cyclic mod 3 on $\{1,2,3\}$):
  $$\Sigma=C_\sigma\ \text{(surplus cap)},\qquad
    O_1=C_{\sigma+1},\qquad O_2=C_{\sigma+2},$$
  $$a_1=v_{\sigma+1}\ \text{(first opposite apex)},\qquad
    a_2=v_{\sigma+2}\ \text{(second/"physical" apex)}.$$
  So $a_j$ is the Moser vertex **not** on the cap $O_j$, and the two Moser
  endpoints of $O_j$ are the other two vertices.
- **Strict cap interiors**: $O_j^{\circ}=O_j\setminus\{v_1,v_2,v_3\}$ — the
  closed cap minus its two Moser-vertex endpoints (the apex is not in $O_j$
  anyway). Membership in $O_j^{\circ}$ is a set condition on $A$, not an
  open-arc condition.
- $S$ also records: $A\neq\varnothing$ and $A$ not collinear.
- **No-$(m,4,4)$ hypothesis** (`noM44`) — quantifies over all packets: there
  is **no** admissible packet $T$ on the same $A$ (any non-obtuse
  circumscribed MEC Moser triangle with cap triple and surplus designation,
  exactly as above) whose two opposite caps both have exactly 4 points.

**Critical shell systems.**

A **critical shell system** $H$ on $A$ assigns to every $x\in A$:

- a **blocker center** $c_H(x)\in A\setminus\{x\}$;
- a **row radius** $r_H(x)>0$ and **row**
  $S_H(x)=\mathrm{Cl}(c_H(x),r_H(x))$, which is the **entire** ambient radius
  class (any point of $A$ at distance $r_H(x)$ from $c_H(x)$ is in the row),
  with $|S_H(x)|=4$ exactly and $x\in S_H(x)$;
- the **blocking property**: $\lnot K_4(A\setminus\{x\};\,c_H(x))$ — deleting
  $x$ destroys every 4-point coradial witness at $c_H(x)$ (at every radius).

**Fixed data chain (all eight leaves).** The theorems fix, in order:

- $D$: the carrier $A$ (nonempty, convex-independent, $K_4$ property, and a
  packet of its own that plays no role below);
- $S$: a surplus packet on $A$ as above — **not** assumed identical to $D$'s
  own packet;
- a real $r$ ("frontier radius") and a critical shell system $H$ on $A$;
- $F$, the **critical pair frontier**, consisting of:
  - a pair $\bar q\neq\bar w$, both in
    $\{x\in A: d(x,a_1)=r\}\setminus\Sigma$, with
    $K_4(A\setminus\{\bar q\};a_2)$, $K_4(A\setminus\{\bar w\};a_2)$,
    $c_H(\bar q)\neq a_2$, $c_H(\bar w)\neq a_2$;
  - first-apex split: $K_4(A\setminus\{\bar q,\bar w\};a_1)$, **or**
    $\bigl(|\mathrm{Cl}(a_1,r)|\in\{4,5\}$ and every $t>0$ with
    $|\mathrm{Cl}(a_1,t)|\ge4$ satisfies $t=r\bigr)$;
  - second-apex double deletion: $K_4(A\setminus\{\bar q,\bar w\};a_2)$;
  - second-apex split: $K_4(A\setminus\{\bar q,\bar w\};a_2)$ **or** there
    exist two full 4-point radius classes at $a_2$, through $\bar q$ and
    $\bar w$ respectively, at radii $d(a_2,\bar q)$ and $d(a_2,\bar w)$, with
    disjoint supports (each an exact ambient class of cardinality 4);
- $R$, the **exact-four residual** over $F$, consisting of:
  - (E1) global minimality of $D$ (as defined above);
  - (E2) the no-$(m,4,4)$ hypothesis on $A$;
  - (E3) $n>9$;
  - (E4) $|\mathrm{Cl}(a_1,r)|=4$;
  - (E5) radius uniqueness at $a_1$: every $t>0$ with
    $|\mathrm{Cl}(a_1,t)|\ge4$ satisfies $t=r$;
  - (E6) every class member blocks: every $x\in\mathrm{Cl}(a_1,r)$ satisfies
    $\lnot K_4(A\setminus\{x\};a_1)$;
  - (E7) a distinguished pair $\hat q\neq\hat w$, both in
    $\mathrm{Cl}(a_1,r)\cap O_1^{\circ}$;
  - (E8) bisector localization at $a_1$: every $c\in A$ with $c\neq a_1$ and
    $d(c,\hat q)=d(c,\hat w)$ lies in $O_1^{\circ}$.

**The late system $H^{\star}$.** From $H$ and (E4)–(E6) define the modified
critical shell system $H^{\star}$ (Lean `lateFirstApexSystem R`):

- for $x\in\mathrm{Cl}(a_1,r)$: $c_{H^{\star}}(x)=a_1$ and
  $S_{H^{\star}}(x)=\mathrm{Cl}(a_1,r)$ (row radius $r$);
- for $x\notin\mathrm{Cl}(a_1,r)$: $c_{H^{\star}}(x)=c_H(x)$ and
  $S_{H^{\star}}(x)=S_H(x)$.

$H^{\star}$ is itself a valid critical shell system. Established facts
(provable, may be used): $c_{H^{\star}}(x)=a_1\iff x\in\mathrm{Cl}(a_1,r)$;
for $x\in\mathrm{Cl}(a_1,r)$ the row of $x$ is exactly the class.
**Abbreviations used from here on:**
$$\beta(x):=c_{H^{\star}}(x),\qquad \mathrm{Row}(x):=S_{H^{\star}}(x).$$

**Common-deletion two-center packet.** For $z,c_1,c_2\in\mathbb{R}^2$, a
packet $\mathrm{CD}(z;c_1,c_2)$ (always relative to the system $H^{\star}$
here) consists of:

- $z,c_1,c_2\in A$, $c_1\neq c_2$;
- $K_4(A\setminus\{z\};c_1)$ and $K_4(A\setminus\{z\};c_2)$;
- $\beta(z)\neq c_1$ and $\beta(z)\neq c_2$;
- finite sets $B_1,B_2$ with $B_i\subseteq A\setminus\{z,c_i\}$, $|B_i|=4$,
  $z\notin B_i$, and radii $t_i>0$ with $d(c_i,y)=t_i$ for all $y\in B_i$;
- $|B_1\cap B_2|\le 2$.

($B_i$ is a 4-point coradial witness set, **not** required to be a full
ambient radius class and **not** required to be a canonical row of any
system.)

**Minimal deletion core.** For finite $U\subseteq A$ and
$\gamma\in\mathbb{R}^2$, a core $\mathrm{MC}(A,U,\gamma)$ assigns to each
$s\in U$ a full ambient radius class $W_s=\mathrm{Cl}(\gamma,t_s)$ with
$t_s>0$ (necessarily $t_s=d(\gamma,s)$), $|W_s|=4$, $s\in W_s$,
$\gamma\in A\setminus\{s\}$; and for distinct $s,t\in U$ the supports $W_s$
and $W_t$ are disjoint.

**Physical class and rows.** A real $\rho$ and points
$\mathit{source},\mathit{other},u,v\in A$ are fixed. Write
$$\mathcal{T}=\mathrm{Cl}(a_2,\rho)\quad(\text{the "physical class"}),\qquad
  I_u=\mathrm{Row}(u)\cap\mathcal{T},\qquad
  I_v=\mathrm{Row}(v)\cap\mathcal{T},$$
$$N_u=|I_u\cap O_2^{\circ}|,\qquad N_v=|I_v\cap O_2^{\circ}|.$$
(Lean `sourceRowInteriorCount` and `oppositeRowInteriorCount`; in leaves 2–8
the context forces $u=\mathit{source}$, so $N_u$ is the source-row count.)

**Warnings.** Do not silently identify $S$ with $D$'s own packet. Do not
conflate $H$ with $H^{\star}$: the frontier-pair blocker conditions
$c_H(\bar q)\neq a_2$, $c_H(\bar w)\neq a_2$ are about $H$; everything built
from $R$ onward ($\beta$, $\mathrm{Row}$, all packets below) is about
$H^{\star}$. Do not conflate the frontier radius $r$ (at $a_1$) with the
physical radius $\rho$ (at $a_2$); no hypothesis relates them. Finset
equalities are literal: $X=\{a,b\}$ with $a\neq b$ means $X$ has exactly two
elements.

## §2 Problem statements

Resolve the eight statements below completely, in the sense of §3–§4. All
eight share the base hypothesis block $\mathfrak{B}$; leaves 2–8 additionally
share the physical-apex context block $\mathfrak{P}$.

### §2.0 Base block $\mathfrak{B}$ (common to all eight leaves)

Fix the entire data chain of §1 ($D$, $S$, $r$, $H$, $F$, $R$, $H^{\star}$,
with all properties listed there), together with $\rho\in\mathbb{R}$ and
$\mathit{source},\mathit{other},u,v\in A$, and assume:

- (B1) $12\le n$.
- (B2) the **robust surface packet** at $a_2$:
  - (S1) *ingress*: there exist $z^{*}\in\{\bar q,\bar w\}$ and
    $\mathit{src}^{*}\in A$ with
    $\beta(\mathit{src}^{*})\neq\beta(\bar q)$ — the literal Lean condition;
    since $\beta(\bar q)=a_1$ in the fixed chain (see (C3)), this is
    equivalently $\beta(\mathit{src}^{*})\neq a_1$, i.e.
    $\mathit{src}^{*}\notin\mathrm{Cl}(a_1,r)$ — such that
    $K_4(A\setminus\{\bar q\};\beta(\mathit{src}^{*}))$ or
    $K_4(A\setminus\{\bar w\};\beta(\mathit{src}^{*}))$, and
    $\beta(\mathit{src}^{*})\neq a_2$, and a packet
    $\mathrm{CD}(z^{*};\,\beta(\mathit{src}^{*}),\,a_2)$ exists;
  - (S2) *full deletion robustness at $a_2$*: for every $z\in A$,
    $K_4(A\setminus\{z\};a_2)$;
  - (S3) $4\le|O_1|$;
  - (S4) $5\le|O_2|$;
  - (S5) *radius classification at $a_2$* — one of:
    (a) some $t>0$ has $|\mathrm{Cl}(a_2,t)|\ge5$; or
    (b) there are $t_1,t_2>0$, $t_2\neq t_1$, with
    $|\mathrm{Cl}(a_2,t_1)|\ge4$ and $|\mathrm{Cl}(a_2,t_2)|\ge4$, **no**
    $t>0$ has $|\mathrm{Cl}(a_2,t)|\ge5$, and there are two 4-point sets
    $P_1\subseteq\mathrm{Cl}(a_2,t_1)$, $P_2\subseteq\mathrm{Cl}(a_2,t_2)$,
    each coradial about $a_2$ at its radius, with $P_1\cap P_2=\varnothing$
    and $a_2\notin P_i$;
  - (S6) *cap growth* — one of:
    (a) $6\le|\Sigma|$; or
    (b) $|\Sigma|=5$, $5\le|O_1|$, and $|O_1|+|O_2|+2=n$; or
    (c) $|\Sigma|=5$, $|O_1|=4$, $6\le|O_2|$, and $|O_2|+6=n$.
- (B3) $0<\rho$.
- (B4) $5\le|\mathcal{T}|$.
- (B5) $u\neq v$; $u\in\mathcal{T}$ and $v\in\mathcal{T}$ (i.e.
  $d(a_2,u)=d(a_2,v)=\rho$).
- (B6) mutual omission: $v\notin\mathrm{Row}(u)$ and $u\notin\mathrm{Row}(v)$.
- (B7) **source context** for $(\mathit{source},\mathit{other},u,v)$:
  - (C1) $\mathit{source}\in\mathcal{T}$;
  - (C2) $\mathit{source}\in O_2^{\circ}$;
  - (C3) $\beta(\mathit{source})\neq\beta(\bar q)$ (since
    $\beta(\bar q)=a_1$, equivalently $\beta(\mathit{source})\neq a_1$,
    equivalently $\mathit{source}\notin\mathrm{Cl}(a_1,r)$);
  - (C4) $|\mathrm{Row}(\mathit{source})\cap(\mathcal{T}\cap O_2^{\circ})|\le 2$;
  - (C5) $\mathit{other}\neq\mathit{source}$;
  - (C6) $\mathit{other}\in\mathcal{T}$;
  - (C7) $\mathit{other}\in O_2^{\circ}$;
  - (C8) $\mathit{other}\notin\mathrm{Row}(\mathit{source})$;
  - (C9) $\beta(\mathit{source})\neq\beta(\mathit{other})$;
  - (C10) $K_4(A\setminus\{\hat q\};\beta(\mathit{source}))$ **or**
    $K_4(A\setminus\{\hat w\};\beta(\mathit{source}))$
    ($\hat q,\hat w$ are the residual pair (E7), **not** $\bar q,\bar w$);
  - (C11) $\mathit{source}\in\mathrm{Row}(u)$;
  - (C12) $v\notin\mathrm{Row}(\mathit{source})$;
  - (C13) $u=\mathit{source}$ **or** $u\notin\mathrm{Row}(\mathit{source})$.
- (B8) **joint deletion**: a point $z_d\in A$ with
  - (J1) $z_d\in\mathcal{T}$;
  - (J2) $z_d\neq u$ and $z_d\neq v$;
  - (J3) $z_d\notin\mathrm{Row}(u)$ and $z_d\notin\mathrm{Row}(v)$;
  - (J4) $\beta(u)\neq\beta(v)$;
  - (J5) a packet $\mathrm{CD}(z_d;\,\beta(u),\,a_2)$ exists (in particular
    $\beta(u)\neq a_2$, $K_4(A\setminus\{z_d\};\beta(u))$,
    $K_4(A\setminus\{z_d\};a_2)$, $\beta(z_d)\neq\beta(u)$,
    $\beta(z_d)\neq a_2$, with the two 4-point witness sets and overlap
    $\le2$);
  - (J6) a packet $\mathrm{CD}(z_d;\,\beta(v),\,a_2)$ exists (same reading
    with $v$ in place of $u$).
- (B9) $|\mathcal{T}|=5$.
- (B10) **rigid 2+2+1 global deletion**:
  - (G1) *rigid cover*: $|I_u|=2$, $|I_v|=2$, $I_u\cap I_v=\varnothing$, and
    $\mathcal{T}=\{z_d\}\cup I_u\cup I_v$;
  - (G2) a center $\gamma\in A\setminus\mathcal{T}$;
  - (G3) a set $\Delta\subseteq\mathcal{T}$ with $\Delta\neq\varnothing$ and
    $|\Delta|\le 5$;
  - (G4) *blocked*: $\lnot K_4(A\setminus\Delta;\gamma)$;
  - (G5) *minimality of the deletion*: for every $s\in\Delta$,
    $K_4\bigl(A\setminus(\Delta\setminus\{s\});\gamma\bigr)$;
  - (G6) *geometry*: $\bigl(\exists\,s,t\in\Delta,\ s\neq t,\
    d(\gamma,s)=d(\gamma,t)\bigr)$ **or** a core
    $\mathrm{MC}(A,\Delta,\gamma)$ exists.

Remark (derivable, not extra hypotheses): $u\in I_u$, $v\in I_v$,
$z_d\notin I_u\cup I_v$; hence by (G1) the five points of $\mathcal{T}$ are
exactly $z_d$, the two points of $I_u$, and the two points of $I_v$. By (S2)
and the blocking property of $H^{\star}$, $\beta(x)\neq a_2$ for every
$x\in A$. Also $a_1,a_2\in\{v_1,v_2,v_3\}$, $a_1\neq a_2$, and
$a_2\notin\mathcal{T}$ (as $\rho>0$).

### §2.1 Leaf A1 — `..._minimalCore` (:2253)

Assume $\mathfrak{B}$ and additionally:

- (A1.a) $\gamma\neq a_2$;
- (A1.b) an explicit core $\mathrm{MC}(A,\Delta,\gamma)$ is given: for each
  $s\in\Delta$ a full ambient 4-point radius class
  $W_s=\mathrm{Cl}(\gamma,d(\gamma,s))$ with $s\in W_s$, pairwise disjoint
  over $\Delta$.

Derive a contradiction.

### §2.2 Context block $\mathfrak{P}$ (leaves A2–A8)

Assume $\mathfrak{B}$ and additionally:

- (P1) $\gamma=a_2$;
- (P2) $\beta(\mathit{source})\in\mathcal{T}$;
- (P3) $u=\mathit{source}$.

(Under (P3), $\mathrm{Row}(u)=\mathrm{Row}(\mathit{source})$ and $N_u$ is the
source-row interior count. Note (P1) is consistent with (G2) since
$a_2\in A\setminus\mathcal{T}$. Leaves A2–A5 and A6–A8 then split on where
the blocker $\beta(\mathit{source})$ sits inside
$\mathcal{T}=\{z_d\}\cup I_u\cup I_v$.)

### §2.3 Leaf A2 — `..._sourceEqU_blockerDeleted` (:2459)

Assume $\mathfrak{B}$, $\mathfrak{P}$, and:

- (A2.a) $\beta(\mathit{source})=z_d$.

Derive a contradiction.

### §2.4 Leaf A3 — `..._sourceEqU_blockerV_sourceRowHeavy` (:2613)

Assume $\mathfrak{B}$, $\mathfrak{P}$, and:

- (A3.a) $\beta(\mathit{source})=v$;
- (A3.b) $N_u=2$;
- (A3.c) $v\in O_2^{\circ}$.

Derive a contradiction.

### §2.5 Leaf A4 — `..._sourceEqU_blockerV_oppositeRowHeavy` (:2628)

Assume $\mathfrak{B}$, $\mathfrak{P}$, and:

- (A4.a) $\beta(\mathit{source})=v$;
- (A4.b) $N_u\neq 2$;
- (A4.c) $N_v=2$.

Derive a contradiction.

### §2.6 Leaf A5 — `..._sourceEqU_blockerV_neitherRowHeavy` (:2651)

Assume $\mathfrak{B}$, $\mathfrak{P}$, and:

- (A5.a) $\beta(\mathit{source})=v$;
- (A5.b) $N_u\neq 2$;
- (A5.c) $N_v\neq 2$.

Derive a contradiction.

### §2.7 Leaf A6 — `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge` (:3353)

Assume $\mathfrak{B}$, $\mathfrak{P}$, and:

- (A6.a) $\beta(\mathit{source})\in\mathrm{Row}(v)\cap\mathcal{T}$
  (i.e. $\beta(\mathit{source})\in I_v$);
- (A6.b) $\beta(\mathit{source})\neq v$;
- (A6.c) the **source-heavy packet**: points $x_u,x_v\in\mathbb{R}^2$ with
  - $x_u\neq u$, $x_v\neq v$;
  - $I_u=\{u,x_u\}$ and $I_v=\{v,x_v\}$ (literal set equalities);
  - $\mathcal{T}=\{z_d\}\cup\{u,x_u\}\cup\{v,x_v\}$;
  - $\beta(\mathit{source})=x_v$;
  - $\{u,x_u\}\cap O_2^{\circ}=\{u,x_u\}$ (both $u$ and $x_u$ lie in
    $O_2^{\circ}$);
- (A6.d) $x_v\in O_2^{\circ}$;
- (A6.e) $6\le|O_2|$;
- (A6.f) $4\le|O_2^{\circ}|$;
- (A6.g) the cap-growth disjunction (S6) (restated as a separate hypothesis;
  it also sits inside (B2)).

Derive a contradiction.

### §2.8 Leaf A7 — `..._blockerVRowOther_oppositeRowHeavy` (:5272)

Assume $\mathfrak{B}$, $\mathfrak{P}$, and:

- (A7.a) $\beta(\mathit{source})\in\mathrm{Row}(v)\cap\mathcal{T}$;
- (A7.b) $\beta(\mathit{source})\neq v$;
- (A7.c) $N_u\neq 2$;
- (A7.d) $N_v=2$.

Derive a contradiction.

### §2.9 Leaf A8 — `..._blockerVRowOther_sparseRows` (:5293)

Assume $\mathfrak{B}$, $\mathfrak{P}$, and:

- (A8.a) $\beta(\mathit{source})\in\mathrm{Row}(v)\cap\mathcal{T}$;
- (A8.b) $\beta(\mathit{source})\neq v$;
- (A8.c) $N_u\neq 2$;
- (A8.d) $N_v\neq 2$.

Derive a contradiction.

## §3 Assume-solvable framing

Assume for purposes of this task that each leaf admits a complete resolution,
but do not assume in advance which direction it takes. For each leaf, a
complete resolution proves exactly one of the two statements in §4. Different
leaves may resolve in different directions.

## §4 Dual-branch success criteria

**Branch A (refutation — closes the leaf).** A complete, rigorous proof of
`False` from the stated hypotheses of the leaf — all of $\mathfrak{B}$ (and
$\mathfrak{P}$ where applicable) plus the leaf's own hypotheses, exactly as
written in §2, with no additional assumptions such as: symmetric or
equilateral placement of the Moser triangle, concyclicity of $\mathcal{T}$
beyond what is stated, genericity ("no accidental coincidences"), $\rho\neq r$,
$\mathit{other}$ lying in any particular row, or any unstated relation
between $\gamma$, $\Delta$, and the named points. The proof must be precise
enough to formalize in Lean 4 / mathlib: every case split enumerated, every
geometric step reduced to distance/incidence/convexity facts with exact
hypotheses. The universal hypotheses (E1) minimality and (E2) no-$(m,4,4)$
**are available** and may be used (e.g. via deletion/repacketing arguments),
as may every disjunction field — but a proof must handle **all** disjuncts it
does not refute.

**Branch B (realizability certificate — kills the leaf and this closure
route; equally valuable, and must be reported as such).** One fixed
configuration with exact algebraic coordinates (rational, or algebraic
numbers given by minimal polynomials / explicit radicals — not floating
point) together with exact witnesses for **every** object in the hypothesis
chain: the set $A$; the packet $S$ (triangle, caps, surplus index — with the
caps verified against the MEC of $A$ and the arc characterization); the
system $H$ (a full blocker assignment for all of $A$); $r$, $F$, $R$
(including the universal fields (E1), (E2), (E5), (E6), (E8)); the surface
packet (B2) with all six components; $\rho$, $\mathit{source}$,
$\mathit{other}$, $u$, $v$, $z_d$, the CD-packets, $\gamma$, $\Delta$, and
the leaf's own hypotheses — every hypothesis verified exactly
(computer-algebra verification of polynomial identities/inequalities is
acceptable if exact). A certificate for one leaf proves that leaf unprovable
and thereby kills the entire rigid-2+2+1 closure route through the parent.
Be aware of the stakes: since the hypotheses include $A$ convex-independent
with the $K_4$ property, any valid branch-B configuration is itself a
counterexample configuration for the underlying Erdős problem, and (E1)
additionally demands that no strictly smaller such configuration exists.
This is stated so that branch-B work is honestly scoped, not to bias the
search away from it: partial certificates are classified in §5.

**Per-leaf notes.**

- A1 is the only leaf with $\gamma\neq a_2$; its refutation may not assume
  $\gamma$ is any named point. The core (A1.b) gives $|\Delta|$ pairwise
  disjoint full 4-classes about $\gamma$, all meeting $\Delta\subseteq
  \mathcal{T}$; combined with (G1), (B9) this is a strong incidence system —
  but the radii $d(\gamma,s)$, $s\in\Delta$, are pairwise distinct only as a
  **consequence** of disjointness, not as a hypothesis.
- A3 differs from A4/A5/A7/A8: it carries the extra placement fact (A3.c)
  ($v\in O_2^{\circ}$), already derived by the coordinator from (A3.a)+(A3.b).
- A6 carries the full explicit five-point trace of $\mathcal{T}$ and the
  identity $\beta(\mathit{source})=x_v$; note (A6.e) $6\le|O_2|$ interacts
  with the growth disjunction (S6)/(A6.g): disjunct (S6)(b) forces
  $|O_1|+|O_2|=n-2$, and (S6)(c) forces $|O_2|=n-6$; checking which disjuncts
  survive is part of the work, not an assumption.
- A5 vs A8: identical count patterns ($N_u\neq2$, $N_v\neq2$) but different
  blocker placement ((A5.a) $\beta(\mathit{source})=v$ vs (A8.a)–(A8.b)
  $\beta(\mathit{source})\in I_v\setminus\{v\}$). Do not transfer a proof
  between them without re-deriving every step that touches the blocker.

## §4b Sanctioned reformulations

- **Similarity normalization.** Every hypothesis in §2 is invariant under
  plane similarities (translations, rotations, reflections, positive
  scalings): distances occur only in equalities between distances or with a
  single scale-covariant parameter, cardinalities and memberships are
  invariant, and the arc predicate uses a product of signed areas, invariant
  in sign under these maps. It is therefore sanctioned to normalize, e.g.
  $a_2=(0,0)$ and $\rho=1$. This normalization must be stated once and used
  consistently; it does not permit fixing any further point.
- **Existential-theory-of-the-reals encoding.** For fixed $n$ and fixed
  combinatorial assignments (which points form $\mathcal{T}$, the caps, the
  rows, the blocker map values), the conjunction of all **non-universal**
  hypotheses is a first-order formula over $(\mathbb{R},+,\times,\le)$ and
  its satisfiability is decidable in principle; per-carrier universal fields
  ((E5), (E6), (E8), (S2), row exactness) quantify only over the finite $A$
  and finitely many radii and are also expressible. The global fields (E1)
  and (E2)-over-all-packets are **not** captured at fixed $n$: (E1)
  quantifies over all cardinalities. Any solver-based claim must state
  exactly which hypothesis subset was encoded. This reformulation is lossy in
  precisely that respect and must be labeled accordingly.

## §5 Insufficient progress

Partial progress does not count unless it implies exactly one of the two
resolutions of §4 for at least one leaf. In particular, the following are
insufficient:

- proofs under extra symmetry or genericity assumptions not in the
  hypotheses (isosceles/regular placement of $\mathcal{T}$, equilateral Moser
  triangle, "generic position", distinct radii $\rho\neq r$, distinctness of
  points not stated distinct);
- arguments that only handle a sub-case of a leaf (one disjunct of (S5),
  (S6), (C10), (C13), or (G6); one placement of $z_d$; one orientation of
  the caps) without closing the others;
- numerical near-configurations, floating-point or interval evidence without
  an exact algebraic certificate;
- a configuration satisfying all but one hypothesis of a leaf — it is
  worthless as a branch-B certificate: every hypothesis, including (E1),
  (E2), and the packet fields, must hold simultaneously (a "local
  certificate" omitting only (E1)/(E2) may be reported as a labeled partial
  artifact but resolves nothing);
- reducing a leaf to another unproved cap-counting or incidence statement of
  comparable strength (verbatim category: reducing the problem to another
  unproved planar-incidence statement of comparable strength);
- heuristic dimension or degrees-of-freedom counts;
- results about a modified configuration: different cardinalities
  ($|\mathcal{T}|\neq5$, rows of size $\neq4$), non-strict inequalities where
  strict or exact ones are stated, open caps where closed caps are stated,
  partial rows where full ambient radius classes are stated;
- proofs that use a sibling leaf's statement, the parent coordinator's
  statement, or any other open obligation of the repository as a lemma;
- constructions of the packet objects "up to isomorphism" or "after small
  perturbation" — all packet equalities are literal;
- claims that an unproved incidence bound is "routine" or "standard" without
  a complete proof;
- status reports, plans, or strategy documents in place of proofs or
  certificates.

## §6 Allowed background

Standard proved theorems from planar Euclidean geometry, convexity, finite
combinatorics, and elementary algebra may be used, but they must be stated
accurately and applied with all necessary hypotheses. In particular the
following are established and available:

- Two distinct circles intersect in at most two points; three or more common
  coradial points force equal centers (perpendicular-bisector argument).
- The center of any circle through two distinct points lies on their
  perpendicular bisector.
- Convex independence of $A$ implies no three points of $A$ are collinear;
  hence at most two points of $A$ lie on any line, and any set of $\ge3$
  points of $A$ coradial about two centers forces those centers equal.
- The MEC of a finite nonempty set exists and is unique; every point is in
  the closed disk.
- Established interface facts of the repository (proved, axiom-clean; exact
  statements): (i) $\beta(x)=a_1\iff x\in\mathrm{Cl}(a_1,r)$, and for such
  $x$, $\mathrm{Row}(x)=\mathrm{Cl}(a_1,r)$; (ii) from (S2): $\beta(x)\neq
  a_2$ and $c_H(x)\neq a_2$ for every $x\in A$; (iii) *two-center cap
  localization*: if $c\in A$, $c\neq a_2$, $x\neq y$ both lie in
  $O_2^{\circ}$, $d(c,x)=d(c,y)$, and $d(a_2,x)=d(a_2,y)$, then $c\in
  O_2^{\circ}$; (iv) *row–class interior bound*: for every $x\in A$ with
  $x\in\mathcal{T}'\cap O_2^{\circ}$ where $\mathcal{T}'=\mathrm{Cl}(a_2,t)$
  for any $t$, $|\mathrm{Row}(x)\cap(\mathcal{T}'\cap O_2^{\circ})|\le2$
  (this generalizes (C4)).
- These background facts do not imply any of the eight conclusions on their
  own; every leaf's contradiction (or certificate) must engage the specific
  packet data.

## §7 Multiagent orchestration

Use multiagent orchestration aggressively and dynamically. You have up to
24 concurrent agents available. Do not use a fixed assignment such
as "N agents for strategy X." Manage the search with these heuristics:

- Begin with a genuinely diverse portfolio. Agents should explore
  substantially different formulations, invariants, reductions, and
  computational sanity checks, drawn from (mainstream to exotic):
  1. perpendicular-bisector and co-radiality bookkeeping (which centers are
     forced onto which bisectors of pairs in $\mathcal{T}$);
  2. two-circles-meet-in-$\le2$-points counting across the CD-packet witness
     sets $B_1,B_2$ and the rows;
  3. cap/arc circular-ordering arguments on the convex polygon $A$ (closed
     caps are contiguous arcs; use the arc characterization, respecting the
     closed-chord convention);
  4. Moser-spindle-style distance rigidity chains through
     $u,v,z_d,x_u,x_v,a_2,\gamma$;
  5. exact coordinate normalization ($a_2=0$, $\rho=1$) plus polynomial
     elimination — resultants / Gröbner bases (msolve, Singular) on the
     distance-equality systems;
  6. SMT encodings of the distance systems over nonlinear real arithmetic
     (Z3, cvc5), with the §4b scoping caveat stated in every result;
  7. SAT/exact-cover encodings of the finite incidence combinatorics (which
     of the 5 class points sit in which rows/caps/witness sets);
  8. interval-arithmetic certification to screen candidate branch-B
     configurations before exact verification;
  9. pigeonhole on row and cap occupancy (rows have exactly 4 points; caps
     partition $A$ up to the 3 doubly-counted Moser vertices; the (S6)
     profiles pin $|\Sigma|,|O_1|,|O_2|$ against $n$);
  10. extremal counting of repeated distances / isosceles triangles in
      convex position;
  11. inversive-distance or circle-inversion reformulations centered at
      $a_2$ (map coradial classes to collinear images) and other embedding
      arguments;
  12. deletion–restoration analysis of (G4)/(G5): what a minimal blocking
      set $\Delta$ at $\gamma$ forces about radius classes about $\gamma$;
  13. use of global minimality (E1): construct a strictly smaller
      convex-independent $K_4$ configuration from the hypothesized data
      (e.g. via a removable vertex) to contradict (E1);
  14. use of no-$(m,4,4)$ (E2): repackage $A$ with a different Moser
      triangle/cap designation to produce a forbidden $(m,4,4)$ packet;
  15. computational sanity checks: randomized and structured searches for
      near-realizations of single hypothesis groups, to map which
      combinations are tight.
- Do not tell most agents the currently favored approach. Preserve
  independence during early rounds so that agents do not all converge on the
  same attractive but incomplete argument — the known attractors here are:
  **naive coordinate bashing without case control** (unmanaged radicals and
  case explosions over the $O_2^{\circ}$ membership pattern),
  **degrees-of-freedom / dimension-count heuristics** (never a proof), and
  **assuming the five class points are symmetrically placed** on their
  circle.
- Maintain an explicit registry of approach families. Group agents by the
  mathematical idea, not superficial wording. If many agents converge on one
  family, redirect some toward underexplored formulations.
- Do not allow one approach to dominate merely because it gives an elegant
  reformulation. A route that ends at an unproved incidence lemma equivalent
  in strength to the leaf is not close to completion unless it supplies a
  genuinely new proof of that lemma.
- When an approach stalls at a theorem-strength missing lemma, mark that
  route as blocked. Reassign agents to it only on a materially new
  mechanism, invariant, construction, or quantitative estimate.
- Keep several incompatible proof routes alive through multiple rounds.
  Maintain both branch-A (refutation) and branch-B (realization) routes for
  each leaf until one side is rigorously ruled out. Cross-pollinate only
  after independent development has exposed real strengths and gaps.
- Use computational agents throughout: exact small-case computation,
  encodings (SAT/SMT/Gröbner), candidate searches, and counterexample
  searches against intermediate lemmas. Computation is evidence unless
  converted into a rigorous general proof or an exact certificate completing
  a valid reduction.
- Search aggressively for counterexamples to proposed lemmas. Before any
  intermediate lemma is relied on, assign agents (computational where
  possible) to attempt to refute it. A found counterexample kills the route
  immediately and cheaply; a lemma that has survived no refutation attempt
  is not established.
- Use adversarial agents throughout — independent agents that did not
  produce the argument under audit. Every candidate proof or certificate
  must be checked line-by-line for:
  - strict-interior handling: $O_2^{\circ}$ is the closed cap minus its two
    Moser endpoints (a set subtraction), not an open-arc or
    open-half-plane condition; closed caps include their chords;
  - exact-cardinality constraints: $|\mathcal{T}|=5$, $|I_u|=|I_v|=2$,
    $|\mathrm{Row}(x)|=4$, $|B_i|=4$, $|\mathrm{Cl}(a_1,r)|=4$ — exact, not
    "at least";
  - full-class row semantics: rows and core shells are entire ambient
    radius classes (any point of $A$ at the row radius is in the row);
    CD-packet witness sets $B_i$ are **not** full classes — do not upgrade
    them;
  - distinctness side conditions: $u\neq v$, $z_d\notin\{u,v\}$,
    $x_u\neq u$, $x_v\neq v$, $\hat q\neq\hat w$, $\bar q\neq\bar w$,
    $\beta(u)\neq\beta(v)$, center distinctness inside each CD-packet;
  - quantifier order and scope in packet fields: (E5)/(E6)/(E8)/(S2)
    quantify over all radii/points/carriers as written; (E1) quantifies over
    all finite configurations; (G5) quantifies over $s\in\Delta$ with the
    deletion set $\Delta\setminus\{s\}$, not $\Delta$;
  - disjunction discipline: (S5), (S6), (C10), (C13), (G6), the two frontier
    splits, and $z^{*}\in\{\bar q,\bar w\}$ are disjunctions — no disjunct
    may be silently discarded;
  - system discipline: $H$ vs $H^{\star}$; $\beta$/$\mathrm{Row}$ always
    refer to $H^{\star}$; the frontier-pair conditions refer to $H$;
  - packet discipline: $S$ is not $D$'s packet; $r$ is not $\rho$; $\hat q,
    \hat w$ (residual pair, at $a_1$, in $O_1^{\circ}$) are not $\bar q,
    \bar w$ (frontier pair, at $a_1$, off-surplus);
  - every §5 item;
  - branch-B audits: verify **every** hypothesis including (E1), (E2), and
    all universal fields against the exact coordinates;
  - circular use of a statement equivalent to the leaf's conclusion (or of
    a sibling leaf, the parent coordinator, or any open repository
    obligation).
- Require agents to return concrete lemmas, constructions, equations,
  incidence tables, exact coordinate systems, or counterexamples to proposed
  sublemmas. Reject status reports, vague optimism, and claims that an
  unproved incidence statement is "routine."
- The root agent should repeatedly synthesize, challenge, redirect, and
  launch new rounds. Do not stop after the first wave fails. Produce a
  resolution only if it survives adversarial audit; otherwise report only
  the strongest rigorously proved derivation and its exact remaining gap.

## §8 Anti-quit

Do not return merely because current approaches fail or agents report
theorem-strength gaps. Continue launching new rounds, reopening blocked
approaches only when there is a genuinely new mechanism, and searching for
fresh formulations. Spend at least three full rounds of the approach
portfolio across all eight leaves before even considering returning.

## §9 Return contract

Return only when the family is completely resolved and the argument survives
adversarial audit, meaning exactly one of:

1. **all eight** leaves have complete branch-A refutations (each a rigorous
   proof of `False` from that leaf's exact hypotheses); or
2. **at least one** leaf has a complete branch-B realizability certificate
   (which kills the entire closure route, resolving the family negatively).

Do not return a reduction, partial result, isolated missing lemma, finite
computation, numerical guess, "best effort" summary, or explanation of why
the problem is difficult. Individual completed leaves should be recorded as
they close, but the return condition is the family condition above. Do not
stop, return, or give up until it is met: continue exploring every plausible
approach, repairing failed arguments, and developing new ones.

## §10 Web-search restriction

Public search may be used only for ordinary mathematical background or
standard named theorems (convex position, repeated distances, minimum
enclosing circles, real-algebraic decision procedures), not to search for a
solution to this exact problem family, the underlying Erdős problem, or any
benchmark. Do not search the public web merely to determine whether the
underlying problem is open, and do not answer that it is open.

---

## Appendix A — leaf label → Lean declaration

All in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`, namespace
`Problem97.ATailFrontierLiveClosure` (line numbers: 2026-07-27 tree; the
declaration names are the stable keys).

| Leaf | Lean declaration | Decl line | `sorry` line |
|---|---|---|---|
| A1 | `false_of_exactFourMutualOmissionRigid221_minimalCore` | 2253 | 2294 |
| A2 | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted` | 2459 | 2469 |
| A3 | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy` | 2613 | 2624 |
| A4 | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_oppositeRowHeavy` | 2628 | 2639 |
| A5 | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_neitherRowHeavy` | 2651 | 2662 |
| A6 | `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge` | 3353 | 3375 |
| A7 | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther_oppositeRowHeavy` | 5272 | 5288 |
| A8 | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther_sparseRows` | 5293 | 5309 |

## Appendix B — math object → Lean structure

| Math object (this document) | Lean name | Source |
|---|---|---|
| $\mathbb{R}^2$ | `ℝ²` = `EuclideanSpace ℝ (Fin 2)` | formal_conjectures `FormalConjecturesForMathlib/Geometry/2d.lean` |
| $K_4(X;p)$ | `HasNEquidistantPointsAt 4 X p` | formal_conjectures `ErdosProblems/97.lean` |
| $K_4$ property of $A$ | `HasNEquidistantProperty 4 A` | same |
| convex independence | `ConvexIndep` | `P97/Foundation.lean` / formal_conjectures |
| $D$ (carrier bundle) | `CounterexampleData` | `P97/U1TwoShortCapReduction.lean:83` |
| global minimality (E1) | `CounterexampleData.Minimal` | `P97/U1TwoShortCapReduction.lean:158` |
| $\mathrm{Cl}(p,t)$ | `SelectedClass D.A p t` | `P97/WitnessPacketInterface.lean:59` |
| $S$ (surplus packet) | `SurplusCapPacket D.A` | `P97/Cap/PartitionFromMEC.lean:332` |
| Moser triangle (structural) | `Problem97.MoserTriangle` | `P97/Cap/Structure.lean:98` |
| MEC-boundary/non-obtuse triangle | `MEC.MoserTriangle`, `MEC.NonObtuseCircumscribedMoserTriangle` | `P97/Moser/Triangle.lean:59`, `P97/Moser/TriangleNonObtuse.lean:667` |
| caps $C_1,C_2,C_3$, arc predicate | `CapTriple`, `OnArcOpposite`, `signedArea2` | `P97/Cap/Structure.lean:161`, `P97/Foundation.lean:49,57` |
| $\mathrm{mec}(A)$ | `MEC.mec`, `MinEnclosingCircle` | `P97/MEC/Basic.lean:275,66` |
| $\Sigma,O_1,O_2$ | `S.surplusCap`, `S.oppCap1`, `S.oppCap2` | `P97/Cap/PartitionFromMEC.lean:367,381,388` |
| $a_1,a_2$ | `S.oppApex1`, `S.oppApex2` | `P97/U1TwoShortCapReduction.lean:297,305` |
| $O_j^{\circ}$ | `S.capInteriorByIndex S.oppIndexJ` | `P97/Cap/PartitionFromMEC.lean:474,521,528` |
| no-$(m,4,4)$ (E2) | `¬ ∃ T : SurplusCapPacket D.A, T.IsM44` | `P97/Cap/PartitionFromMEC.lean:443` |
| critical shell system $H$ | `CriticalShellSystem D.A` | `P97/U1CarrierInjection.lean:1015` |
| $c_H(x)$, $S_H(x)$, blocking | `H.centerAt`, `(H.selectedAt ..).toCriticalFourShell.support`, `H.no_qfree_at` | `P97/U1CarrierInjection.lean:1029,1034,1041` |
| row structure (full 4-class) | `CriticalFourShell`, `CriticalSelectedFourClass` | `P97/U1CarrierInjection.lean:547,635` |
| frontier $F$ ($\bar q,\bar w$, splits) | `CriticalPairFrontier`, `SurvivorPairRelocationPacket`, `FirstApexSplit`, `SecondApexSplit` | `P97/ATail/CriticalPairFrontier.lean:568,288,544,555` |
| residual $R$ ($\hat q,\hat w$, (E1)–(E8)) | `ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual` | `.../UniqueArmRouteAudit/OriginalUniqueResidualDispatch.lean:43` |
| late system $H^{\star}$ ($\beta$, $\mathrm{Row}$) | `lateFirstApexSystem R` (via `overrideExactSelectedClass`) | `.../Unique4LateChoiceTerminal/UniqueFourLateChoiceTerminal.lean:48`, `P97/U1CarrierInjection.lean:1214` |
| surface (B2), (S1)–(S6) | `ExactFourPostCardElevenRobustSurface` | `P97/ATail/ExactFourRobustCapExpansion.lean:280` |
| (S1) ingress | `ExactFourPhysicalCommonDeletionIngress`, `goodOutsideSources`, `outsideFirstApexFiber` | `P97/ATail/ExactFourPhysicalConsumer.lean:421,104,79` |
| (S2) robustness | `FullyDeletionRobustAt` | `P97/ATail/DeletionRobustness.lean:27` |
| (S5) radius classification | `DeletionRobustRadiusClassification` | `P97/ATail/ExactFourRobustCapExpansion.lean:123` |
| (S6)/(A6.g) cap growth | `ExactFourRobustCapGrowth` (+ `ExactFourFirstOppositeCapGrowth`, `ExactFourSecondOppositeCapGrowth`) | `P97/ATail/ExactFourRobustCapExpansion.lean:269,250,259` |
| $\mathrm{CD}(z;c_1,c_2)$ | `CommonDeletionTwoCenterPacket` (rows: `U5QDeletedK4Class`) | `P97/ATail/CommonDeletionTwoCenter.lean:29`, `P97/U5GlobalIncidenceBasic.lean:243` |
| source context (B7)/(C1)–(C13) | `ExactFourMutualOmissionSourceContext` | `P97/ATail/FrontierLiveClosure.lean:121` |
| joint deletion (B8)/$z_d$ | `ExactFourMutualOmissionJointDeletion` | `P97/ATail/FrontierLiveClosure.lean:88` |
| global deletion (B10)/$\gamma,\Delta$ | `ExactFourMutualOmissionRigid221GlobalDeletion` | `P97/ATail/FrontierLiveClosure.lean:1762` |
| $\mathrm{MC}(A,U,\gamma)$ | `ATAILStageOneMinimalDeletionCore.MinimalDeletionCore` | `P97/ATail/MinimalDeletionCore.lean:34` |
| $\mathfrak{P}$ context (P1)–(P3) + $\mathfrak{B}$ fields | `ExactFourRigid221PhysicalApexSourceEqUContext` | `P97/ATail/FrontierLiveClosure.lean:2415` |
| $N_u$, $N_v$ | `P.sourceRowInteriorCount`, `P.oppositeRowInteriorCount` | `P97/ATail/FrontierLiveClosure.lean:2474,2489` |
| source-heavy packet (A6.c)/$x_u,x_v$ | `ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket` | `P97/ATail/FrontierLiveClosure.lean:2692` |
| carrier vertex | `CriticalShellSystem.CarrierVertex A` = `{q : ℝ² // q ∈ A}` | `P97/U1CarrierInjection.lean:1111` |
| §6(iii) two-center localization | `commonPhysicalPair_center_mem_secondCapInterior` | `P97/ATail/TwoCenterCapLocalization.lean:191` |
| §6(iv) row–class interior bound | `actualLateRow_secondClassInterior_card_le_two` | `P97/ATail/ExactFourRobustCapExpansion.lean:296` |
