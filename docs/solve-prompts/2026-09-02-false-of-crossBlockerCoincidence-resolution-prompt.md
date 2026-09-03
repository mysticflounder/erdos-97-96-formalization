# Resolution prompt: the cross-blocker coincidence leaf

Operator notes (not part of the prompt):

* Target: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`,
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean`
  (section variables at lines 78–118, statement at 131–135, body `sorry`).  It is the
  only open obligation in that module and sits on the live spine (`docs/live-blueprint.md`).
* Source revision for the dictionary: `102cd0fa5`.  Every hypothesis below was transcribed
  from the Lean fields, not from docstrings.  Extraction notes are in the session
  scratchpad (`xbc-dict-A-base.md`, `xbc-dict-B-residuals.md`, `xbc-dict-C-hypotheses.md`).
* The prompt is written for an agent with no Lean access; nothing below requires the
  repository.  Set the agent count in §7 before sending.
* Template: `math-toolchain:deep-thinker-prompt` (ShouqiaoW/erdos family), adapted from an
  Erdős-problem resolution to a single hypothesis-inconsistency obligation.  The two
  branches are "the hypothesis set is contradictory" and "a fixed finite configuration
  satisfies every hypothesis".  The second branch is intrinsically at least as strong as
  a negative answer to Erdős #97 (see §4); the prompt says so and does not hide it.

---

## §1 Notation and definitions

Everything is in the Euclidean plane $\mathbb{R}^2$.  $|xy|$ is the Euclidean distance
between points $x$ and $y$.  $A \subset \mathbb{R}^2$ is a finite set, called the
*carrier*.  $|X|$ is the cardinality of a finite set $X$.  $A \setminus \{x\}$ is $A$
with $x$ removed (if $x \notin A$ it is $A$).

**Radius class.**  For a point $p \in \mathbb{R}^2$ (not necessarily in $A$) and a real
$r$, $S_p(r) := \{\, y \in A : |py| = r \,\}$.  When we write $S_p(r)$ for a subset
$X \subseteq A$ in place of $A$ we write $S^X_p(r)$.

**Four-point circle.**  $K_4(X, p)$ means: there is a real $r > 0$ with
$|S^X_p(r)| \ge 4$, i.e. some circle of positive radius about $p$ passes through at
least four points of $X$.  The point $p$ itself is never counted (its distance to
itself is $0$, not $r$), and $p$ need not lie in $X$.

**K4 property.**  $A$ has the K4 property if $K_4(A, p)$ holds for every $p \in A$.

**Convex position.**  $A$ is in convex position if every $a \in A$ lies outside the
convex hull of $A \setminus \{a\}$; equivalently $A$ is the vertex set of a strictly
convex polygon.  Consequences that may be used freely: no three points of $A$ are
collinear; $A$ carries a cyclic (boundary) order; a line meets $A$ in at most two
points; the perpendicular bisector of two points of $A$ contains at most two points
of $A$ (so at most two points of $A$ are equidistant from two given points of $A$).
Any subset of a set in convex position is in convex position.

**Minimality.**  $A$ is *minimal* if $A$ is nonempty, in convex position, has the K4
property, and every nonempty finite set in convex position with the K4 property has
at least $|A|$ points.  Consequence (elementary): for every $x \in A$ the set
$A \setminus \{x\}$ does not have the K4 property, i.e. some $p \in A \setminus \{x\}$
has no four-point circle in $A \setminus \{x\}$.

**Minimum enclosing circle and Moser triangle.**  $\Gamma$ is the (unique) circle of
smallest radius whose closed disc contains $A$.  A *Moser triangle* is a triple of
pairwise distinct points $v_1, v_2, v_3 \in A$ lying on $\Gamma$ such that each angle of
the triangle $v_1 v_2 v_3$ is at most $90^\circ$ (right angles allowed).

**Caps.**  Given a Moser triangle, the three *closed caps* are
$C_1 := \{ v \in A : v \text{ and } v_1 \text{ lie on opposite closed sides of the line } v_2 v_3 \}$,
and cyclically $C_2$ (line $v_3 v_1$, apex $v_2$), $C_3$ (line $v_1 v_2$, apex $v_3$).
"Closed" means points on the line count as being on both sides.  Facts (all proved in
the project from the definition): $C_i \subseteq A$; $C_1$ contains $v_2, v_3$ and
not $v_1$ (cyclically); every point of $A$ other than $v_1, v_2, v_3$ lies in exactly
one cap; $|C_1| + |C_2| + |C_3| = |A| + 3$.  Since $A$ is in convex position and lies
in the closed disc of $\Gamma$, $C_1$ is the set of points of $A$ on the closed
circular segment of $\Gamma$ cut off by the chord $v_2 v_3$ on the side away from
$v_1$.  The *strict interior* of a cap is the cap minus its two endpoints:
$C_1^\circ := C_1 \setminus \{v_2, v_3\}$, etc.  The two endpoints of a cap are the two
Moser vertices it contains; its *apex* is the vertex it does not contain.

**Surplus-cap packet.**  A *packet* is a Moser triangle together with its cap
partition and a choice of one cap, the *surplus cap*, having at least $5$ points.
We name the pieces of the packet $\mathcal S$ fixed in §2 as follows:
$C_s$ is the surplus cap with apex $a_0$; $C$ (the *first opposite cap*) is the next cap
in the cyclic order $C_1 \to C_2 \to C_3 \to C_1$ after $C_s$, its apex is $a_1$, its
two endpoints are $a_0$ and $a_2$; $C'$ (the *second opposite cap*) is the remaining
cap, with apex $a_2$.  So $\{a_0, a_1, a_2\} = \{v_1, v_2, v_3\}$, $C = $ the set of
points of $A$ on the far side of chord $a_0 a_2$ from $a_1$, and
$C^\circ = C \setminus \{a_0, a_2\}$.

**$(m,4,4)$ packet.**  A packet is of type $(m,4,4)$ if both of its non-surplus caps
have exactly $4$ points (endpoints included).

**Blocker system.**  A *blocker system* on $A$ is a map $c : A \to A$ together with,
for every $x \in A$, a radius $r(x) > 0$ such that, writing
$K(x) := S_{c(x)}(r(x))$ (the *shell* of $x$):

* $c(x) \ne x$;
* $x \in K(x)$ (so $r(x) = |c(x)\,x|$) and $|K(x)| = 4$ **exactly**;
* (*criticality*) $K_4(A \setminus \{x\},\, c(x))$ is **false**: after deleting $x$,
  no circle of positive radius about $c(x)$ passes through four or more points of
  $A \setminus \{x\}$.

$c(x)$ is the *blocker* of $x$.  Consequences (all proved in the project): $r(x)$ is
the unique positive radius at which $c(x)$ sees at least four points of $A$, and it
sees exactly four; $c(x) \notin K(x)$; if $c(x) = c(y)$ then $K(x) = K(y)$; for
$w \in A$, $K_4(A \setminus \{w\}, c(x))$ holds if and only if $w \notin K(x)$; every
$z \in A$ with $|c(x)\,z| = r(x)$ lies in $K(x)$.

**Robust, rich, unique-four, non-robust.**  For $p \in \mathbb{R}^2$:

* $\mathrm{Robust}(p)$: for every $z \in A$, $K_4(A \setminus \{z\}, p)$.
* $\mathrm{Rich}(p)$: some circle about $p$ contains at least $6$ points of $A$, or
  two circles about $p$ of distinct positive radii each contain at least $4$ points of
  $A$.  (Proved: $\mathrm{Rich}(p) \Rightarrow \mathrm{Robust}(p)$.)
* $\mathrm{U4}(p)$: $p \in A$ and there is exactly one positive radius $r$ with
  $|S_p(r)| \ge 4$, and for it $|S_p(r)| = 4$.  (Proved: $\mathrm{U4}(c(x))$ for every
  $x$; $\mathrm{Robust}(p) \Rightarrow \neg \mathrm{U4}(p)$; $\mathrm{Robust}(p)
  \Rightarrow c(z) \ne p$ for every $z \in A$.)
* $\mathrm{NR} := \{ p \in A : \neg \mathrm{Robust}(p) \}$, the non-robust points.

**Rows and two-centre packets.**  A *$q$-free four-row at $z$ on $B$* is a set
$B \subseteq A \setminus \{q, z\}$ with $|B| \ge 4$ whose points all lie on one circle
of positive radius about $z$.  A *two-centre packet* $\mathrm{Pk}(x; z_1, z_2)$ consists
of: $x, z_1, z_2 \in A$, $z_1 \ne z_2$, $K_4(A \setminus \{x\}, z_1)$ and
$K_4(A \setminus \{x\}, z_2)$, $c(x) \ne z_1$ and $c(x) \ne z_2$, an $x$-free four-row
$B_1$ at $z_1$ and an $x$-free four-row $B_2$ at $z_2$ with $|B_1| = |B_2| = 4$ and
$|B_1 \cap B_2| \le 2$.  Note: nothing in the packet says $x \ne z_1$ or $x \ne z_2$.

**Cyclic order.**  Fix an enumeration of $A$ in boundary order.  For distinct
$u, v \in A$, the two open arcs between $u$ and $v$ are the two components of
$A \setminus \{u, v\}$ in the cyclic order.  "$p$ and $q$ lie on opposite arcs between
$u$ and $v$" has the obvious meaning.  Proved: if $p \ne q$ are both equidistant from
$u$ and from $v$ ($|up| = |uq|$, $|vp| = |vq|$) with $u \ne v$, then $p$ and $q$ lie on
opposite arcs between $u$ and $v$.

---

## §2 The hypothesis set $\Gamma$ and the obligation

Fix all of the following data.  This is the complete list; nothing else is assumed.

**(Γ1) Carrier.**  $A \subset \mathbb{R}^2$ finite, nonempty, in convex position, with the
K4 property, and minimal (§1).  $|A| \ge 10$.

**(Γ2) Packet.**  A packet $\mathcal S$ on $A$ (Moser triangle $a_0, a_1, a_2$ on
$\Gamma$, caps $C_s, C, C'$ as named in §1) with $|C_s| \ge 6$, $|C| \ge 6$,
$|C'| \ge 6$.  (Hence $|A| \ge 15$.)  Moreover **no** packet on $A$ — for any Moser
triangle on $\Gamma$, any cap partition, and any admissible surplus choice — is of
type $(m,4,4)$.

**(Γ3) Blocker system.**  A blocker system $c, r, K$ on $A$ (§1).

**(Γ4) Two first-apex radii.**  Reals $r \ne \rho$ with $|S_{a_1}(r)| = 4$ and
$|S_{a_1}(\rho)| = 4$.  (Both are positive, see Γ5.)

**(Γ5) Survivor pairs and common-deletion data, for $r$ and for $\rho$.**  For the radius
$r$: points $q \ne w$ in $A$ with $|a_1 q| = |a_1 w| = r$, $q \notin C_s$, $w \notin C_s$;
$K_4(A \setminus \{q\}, a_2)$ and $K_4(A \setminus \{w\}, a_2)$; $c(q) \ne a_2$ and
$c(w) \ne a_2$; $K_4(A \setminus \{q, w\}, a_2)$ and $K_4(A \setminus \{q, w\}, a_1)$;
and a two-centre packet $\mathrm{Pk}(q; a_1, a_2)$.  The same for $\rho$ with a pair
$q_\rho \ne w_\rho$ (independent of $q, w$).

**(Γ6) Two interior blocker collisions.**  Points $s_1 \ne s_2$ in $A$ with
$|a_1 s_1| = |a_1 s_2| = r$, $s_1, s_2 \in C^\circ$, and $c(s_1) = c(s_2) =: b$.
Points $t_1 \ne t_2$ in $A$ with $|a_1 t_1| = |a_1 t_2| = \rho$, $t_1, t_2 \in C^\circ$,
and $c(t_1) = c(t_2) =: b'$.  Exactness and separation:
$S_{a_1}(r) \cap C^\circ = \{s_1, s_2\}$, $S_{a_1}(\rho) \cap C^\circ = \{t_1, t_2\}$,
$\{s_1, s_2\} \cap \{t_1, t_2\} = \emptyset$, and $b \ne b'$.

**(Γ7) Apex robustness and richness; global counting.**  $\mathrm{Robust}(a_2)$;
$\mathrm{Rich}(a_0)$, $\mathrm{Rich}(a_1)$, $\mathrm{Rich}(a_2)$;
$|A| \le 4\,|\mathrm{NR}|$; and no point $p \in A$ is equidistant from $a_0, a_1, a_2$
(no circle about a point of $A$ passes through all three Moser vertices).

**(Γ8) Localized common deletions and mutual-omission cycles.**

* $L_\rho$: $t_1 \in C^\circ$, $t_1 \ne s_1$, $t_1 \ne s_2$, $t_1 \notin K(s_1)$, and a
  two-centre packet $\mathrm{Pk}(t_1; a_1, b)$ (so $K_4(A \setminus \{t_1\}, a_1)$,
  $K_4(A \setminus \{t_1\}, b)$, $b' = c(t_1) \ne a_1$, $b' \ne b$, plus the two rows).
* $M_\rho$: a point $u \in \{s_1, s_2\}$ with $u \ne t_1$, $c(u) = b$, $t_1 \notin K(u)$,
  $u \notin K(t_1)$, $b \ne b'$, packets $\mathrm{Pk}(t_1; a_1, b)$ and
  $\mathrm{Pk}(u; a_1, b')$.
* $L$: $s_1 \in C^\circ$, $s_1 \ne t_1$, $s_1 \ne t_2$, $s_1 \notin K(t_1)$, and
  $\mathrm{Pk}(s_1; a_1, b')$.
* $M$: a point $u' \in \{t_1, t_2\}$ with $u' \ne s_1$, $c(u') = b'$, $s_1 \notin K(u')$,
  $u' \notin K(s_1)$, $b' \ne b$, packets $\mathrm{Pk}(s_1; a_1, b')$ and
  $\mathrm{Pk}(u'; a_1, b)$.

Because $K(s_1) = K(s_2) = K(u)$ and $K(t_1) = K(t_2) = K(u')$, the incidence content
of Γ8 is exactly the four negative statements
$t_1 \notin K(s_1)$, $s_1 \notin K(t_1)$, $u \notin K(t_1)$ for some $u \in \{s_1, s_2\}$,
$u' \notin K(s_1)$ for some $u' \in \{t_1, t_2\}$, plus the packets.  No positive shared
incidence is stored.  The choices $u$ and $u'$ are part of the data; a proof may not
assume $u = s_1$ or $u' = t_1$.

**(Γ9) Cross-blocker coincidence.**  At least one of the four equalities
$$ b = t_1, \qquad b = t_2, \qquad b' = s_1, \qquad b' = s_2 $$
holds.  (In words: the common blocker of one collision pair is a member of the other
collision pair.)

**(Γ10) Geometric multiplicity residual.**  At least one of:

* (i) *fresh third fibre*: points $x \ne y$ in $A$, both outside $\{s_1, s_2, t_1, t_2\}$,
  with $c(x) = c(y) =: b''$, $b'' \ne b$, $b'' \ne b'$, $x \in K(y)$ and $y \in K(x)$.
  Nothing is said about where $x, y, b''$ lie relative to the caps.
* (ii) *fresh outside first fibre*: a point $e \in A$ outside $\{s_1, s_2, t_1, t_2\}$
  with $c(e) = b$, $e \in K(s_1)$, $e \notin C$, and a point $o \in A$ with $o \ne e$,
  $o \ne t_1$, $o \ne t_2$, $o \in K(s_1)$, $o \notin C$, such that
  $K(s_1) \setminus C = \{e, o\}$ (hence $K(s_1) = \{s_1, s_2, e, o\}$).
* (iii) *fresh outside second fibre*: the mirror image with $b'$, $K(t_1)$: $e \notin
  \{s_1, s_2, t_1, t_2\}$, $c(e) = b'$, $e \in K(t_1)$, $e \notin C$, $o \in A$,
  $o \ne e$, $o \ne s_1$, $o \ne s_2$, $o \in K(t_1)$, $o \notin C$,
  $K(t_1) \setminus C = \{e, o\}$.

**Not in Γ.**  No bound of the form $|C| \ge 8$ or $|C| \le 7$ is available.  (Upstream,
Γ9 was produced as the second arm of a non-exclusive disjunction "$|C^\circ| \ge 6$
(i.e. $|C| \ge 8$) or Γ9"; the first arm leads to a separate, still open obligation, so
it may not be cited, and the second arm does not carry $|C| \le 7$.)  No relation between $(q, w)$ and $(s_1, s_2)$, or between
$(q_\rho, w_\rho)$ and $(t_1, t_2)$, is given beyond their common membership in
$S_{a_1}(r)$, resp. $S_{a_1}(\rho)$.  No symmetry between $s_1$ and $s_2$ may be
assumed: $L$ and $M$ single out $s_1$ (and $L_\rho$, $M_\rho$ single out $t_1$).  The
swap $(r, s_1, s_2, b, q, w) \leftrightarrow (\rho, t_1, t_2, b', q_\rho, w_\rho)$
maps Γ to Γ (with (ii) $\leftrightarrow$ (iii) and the four equalities of Γ9 permuted),
and may be used after checking that claim.

**The obligation.**  Resolve completely whether $\Gamma$ is satisfiable:

> Either prove that **no** data $(A, \mathcal S, c, r, \rho, q, w, q_\rho, w_\rho,
> s_1, s_2, t_1, t_2, u, u', \ldots)$ satisfies all of (Γ1)–(Γ10), or construct one
> fixed instance of such data and verify every item exactly.

**Consequences of Γ already proved (usable as established facts).**

1. $K(s_1) = K(s_2)$, $s_2 \in K(s_1)$, $r(s_1) = r(s_2)$; likewise $K(t_1) = K(t_2)$.
2. $b \in C^\circ$ and $b' \in C^\circ$.  More generally, every blocker value $c(z)$
   lies in the strict interior of some cap (uses Γ7).
3. $K(s_1) \cap C = \{s_1, s_2\}$ and $|K(s_1) \setminus C| = 2$; likewise
   $K(t_1) \cap C = \{t_1, t_2\}$, $|K(t_1) \setminus C| = 2$.
4. If a blocker value lies in a closed cap $C_i$, at most two points of $C_i$ have
   that blocker.  So $s_1, s_2$ are the only points of $C$ with blocker $b$, and
   $t_1, t_2$ the only points of $C$ with blocker $b'$.  (Sources outside $C$ with
   blocker $b$ are not excluded.)
5. If $z \in A$ and $s_1, s_2 \in K(z)$ then $c(z) = b$ (only $a_1$ and $b$ can be
   equidistant from $s_1$ and $s_2$; the same for $t_1, t_2$ with $a_1$ and $b'$).
6. $s_1$ and $s_2$ lie on opposite arcs between $a_1$ and $b$; $t_1$ and $t_2$ lie on
   opposite arcs between $a_1$ and $b'$.
7. Two four-point radius classes with distinct centres share at most $2$ points; if
   both centres lie in the same closed cap $C_i$, they share at most $1$ point outside
   $C_i$.  A four-point class whose centre lies in a closed cap $C_i$ has at most $2$
   points in $C_i$.  For a rich point $p$ and any $x$ and radius $r''$,
   $|K(x) \cap S_p(r'')| \le 2$.
8. No Moser vertex is a blocker value: $c(z) \notin \{a_0, a_1, a_2\}$ for all $z$.
   Every blocker value is a unique-four centre and therefore non-robust:
   $c(A) \subseteq \mathrm{NR}$.
9. Under $b = t_1$: $t_1 \notin K(s_1)$ (a centre is never on its own shell), $t_1$ is a
   unique-four centre with unique four-point circle $K(s_1)$, and simultaneously
   $t_1 \in S_{a_1}(\rho)$, $t_1 \in K(t_1)$ with centre $b' \in C^\circ$.  The
   analogous statements hold in the other three arms.  No other consequence of Γ9
   alone is recorded in the project; each arm makes the same-named "cross hit"
   ($t_1 \in K(s_1)$, etc.) false, not true.
10. For every $x \in A$, $A \setminus \{x\}$ fails the K4 property (from minimality).

---

## §3 Framing

Assume for purposes of this task that a complete resolution exists, but do not assume
in advance whether $\Gamma$ is contradictory or satisfiable.  A complete solution must
establish exactly one of the two statements in §4.

---

## §4 Success criteria

**Affirmative resolution (Γ is inconsistent).**  A complete proof that no data satisfy
(Γ1)–(Γ10).  It must:

* cover all four arms of Γ9 crossed with all three arms of Γ10 (twelve combinations),
  either uniformly or case by case, and cover both choices of $u$ and of $u'$ in Γ8;
* state, for each step, exactly which items of Γ (and which of the proved consequences
  1–10) it uses; a proof that uses none of minimality, the no-$(m,4,4)$ condition, the
  richness/robustness data, the counting bound $|A| \le 4|\mathrm{NR}|$, or the
  residual Γ10 is possible in principle but must be checked with particular
  suspicion, because every purely local projection of Γ is known to be satisfiable
  (§6);
* use minimality only in one of the explicit forms: exhibiting a smaller nonempty
  finite set in convex position with the K4 property, or the derived facts
  (consequence 10, the bound $|A| \le 4|\mathrm{NR}|$);
* not rely on any bound on $|C|$ other than $|C| \ge 6$ (or what it derives itself);
* not rely on any relation between $(q, w)$ and $(s_1, s_2)$ beyond Γ5–Γ6;
* be valid for every $|A| \ge 15$, with no assumption of symmetry, regularity, rational
  coordinates, or a particular combinatorial type of $A$.

**Negative resolution (Γ is satisfiable).**  One fixed finite set $A$ with exact
coordinates (rational, or algebraic with exact certificates) together with all the
data: the Moser triangle on the minimum enclosing circle with all angles
$\le 90^\circ$ and the cap partition; the surplus choice; the map $c$ with, for every
$x \in A$, an exact four-point shell through $x$ and a verified criticality
condition; the radii $r, \rho$; the survivor pairs, rows and two-centre packets of
Γ5; the collision pairs of Γ6; the richness and robustness facts of Γ7; the points
$u, u'$ and packets of Γ8; the specific equality of Γ9 that holds; the specific arm of
Γ10 with its points.  Every equality, inequality, membership, non-membership,
cardinality and "exactly four" condition must be verified by exact arithmetic, for
every point of $A$ (not only the named ones).  Minimality must be proved: no nonempty
finite set in convex position with fewer than $|A|$ points has the K4 property.

Be aware of the intrinsic asymmetry: a set satisfying Γ1 alone is a finite set in
convex position in which every point has four other points equidistant from it.
Whether such a set exists is exactly Erdős problem #97 (the conjecture is that none
exists).  The negative branch therefore contains a negative answer to that problem
plus a proof of minimality.  This asymmetry is stated so that it is not discovered
late; it is not a licence to assume the affirmative branch.  A configuration that
satisfies every item of Γ except minimality and the bound $|A| \le 4|\mathrm{NR}|$
is **not** a resolution, but it is the single most valuable diagnostic artifact
short of one, because it proves that every affirmative proof must use those two
items; if found, it must be reported exactly (coordinates and full verification
ledger), labelled as a relative model, never as a countermodel.

The quantifier structure is essential: the affirmative branch is universal over all
data; the negative branch is one fixed instance.  It is insufficient to construct
instances satisfying more and more of Γ without reaching all of it, or to prove the
inconsistency of Γ strengthened by any extra hypothesis (a bound on $|A|$, $|C| \ge 8$,
$|C| \le 7$, $u = s_1$, $q \in \{s_1, s_2\}$, a symmetry of $A$, disjointness of
$K(s_1) \setminus C$ and $K(t_1) \setminus C$, or a particular arm of Γ9 or Γ10).

### §4b Sanctioned reformulations

* *Case table.*  Γ9 × Γ10 gives twelve cases; by the swap symmetry stated in §2,
  arms $b = t_1$ and $b' = s_1$ are mirror images (with (ii) ↔ (iii)), and so are
  $b = t_2$ and $b' = s_2$; the swap must be verified against every item of Γ before
  it is used.  Note that $b = t_1$ and $b = t_2$ are **not** related by a symmetry of
  Γ, because $L_\rho$ and $M_\rho$ single out $t_1$.
* *Blocker-map form.*  Γ3 defines a fixed-point-free map $c : A \to A$ whose every
  value is a unique-four centre.  Γ6 says $b, b'$ have fibres of size $\ge 2$ inside
  $C^\circ$; Γ9 says one of these blocker values is itself a source of the other
  collision, producing a chain such as $s_1 \mapsto t_1 \mapsto b'$.  Γ10 is a third
  multiplicity event of the map (a new two-element fibre, or a third element in the
  fibre of $b$ or of $b'$ lying outside $C$).  Any argument in this language must keep
  the exact-shell and criticality conditions, which are metric, not combinatorial.
* *Metric-algebra form.*  All equalities of Γ are equalities of squared distances;
  all cap and arc conditions are sign conditions on $2 \times 2$ determinants; the
  "exactly four" and criticality conditions are universally quantified inequations
  over $A$.  This form is lossy unless the universal conditions over all of $A$ are
  kept; any reformulation that fixes $|A|$ or names only some points of $A$ must be
  proved to lose nothing before it is used for the affirmative branch.

---

## §5 Insufficient progress

Partial progress does not count unless it implies exactly one of the two resolutions
above.  In particular, the following are insufficient:

* proving only the four "trivial negations" (under $b = t_1$, $t_1 \notin K(s_1)$, and
  the three analogues); these are consequence 9 and yield nothing further by
  themselves;
* any argument using only perpendicular bisectors, cyclic (boundary) order, circle–circle
  intersection counts, or Kalmanson/Ptolemy-type inequalities on the named points: a
  six-point strictly convex rational configuration realizes the metric content of one
  arm of Γ9 with alternating cap order, and exact rational witnesses exist for the
  named projection of every one of the twelve Γ9 × Γ10 cases (§6);
* deriving "$s_1, s_2$ lie on opposite arcs between $a_1$ and $b$" twice (once from
  consequence 6 and once from the bisector fact of §1) and treating the two copies as
  contradictory — this was the endgame of a previous failed attempt and proves nothing;
* assuming $K(s_1) \setminus C$ and $K(t_1) \setminus C$ share two points, share one
  point, or are disjoint; every case is compatible with the packet fields as far as is
  known;
* assuming $|C| \ge 8$ (the other arm is an open obligation) or $|C| \le 7$;
* assuming $u = s_1$, $u' = t_1$, $q \in \{s_1, s_2\}$, $\{q, w\} = \{s_1, s_2\}$, or
  $\{q, w\} \cap \{s_1, s_2\} = \emptyset$;
* assuming that the fresh points $x, y, b''$ of Γ10(i) lie in $C$, outside $C$, or in
  a particular cap;
* assuming that a blocker value has exactly two sources (consequence 4 bounds sources
  inside one closed cap only), or that $c$ is injective, surjective, an involution, or
  that $c(b) \in \{s_1, s_2\}$;
* assuming the other two points of $S_{a_1}(r)$ (besides $s_1, s_2$) lie in a
  particular cap or coincide with $q, w$;
* invoking a "$(2,1,1)$ circle-packing bound across three convex arcs" limiting the
  number of non-robust centres, or any similar packing statement, without a complete
  proof; no such theorem is known to the project;
* treating the twelve exact rational local witnesses, the six-point model, or any
  configuration that omits the criticality condition for every point of $A$, the
  exact-four condition for every shell, the cap partition, the no-$(m,4,4)$ condition,
  richness, or minimality, as a countermodel;
* treating a floating-point or numerically approximate configuration as a countermodel;
* exhibiting a relative model (all of Γ except minimality and $|A| \le 4|\mathrm{NR}|$)
  and calling it a resolution (report it, labelled, as described in §4);
* proving the inconsistency for some but not all of the twelve arm combinations, or
  for one orientation of the swap symmetry without verifying that the swap preserves Γ;
* proving the inconsistency under an added hypothesis on $|A|$, on the symmetry of $A$,
  on rationality of coordinates, or on the combinatorial type (which points lie on
  which circles);
* proving the inconsistency of a modified Γ (non-strict instead of strict cap interior,
  "at least four" instead of "exactly four" on a shell, criticality dropped for some
  point, a Moser triangle not on the minimum enclosing circle or with an obtuse angle);
* conditional results: a proof that assumes Erdős #97, assumes a bound on the size of a
  minimal convex K4 set, or assumes any unproved structural statement about minimal
  counterexamples (e.g. "a minimal counterexample has no blocker coincidences");
* reducing the problem to another open obligation of the same project (the cap-eight
  arm, the fresh-third terminals) or to any unproved combinatorial-geometry statement of
  comparable strength.

---

## §6 Allowed background

Standard proved theorems of Euclidean plane geometry, convex geometry (convex
polygons, supporting lines, minimum enclosing circles), elementary real algebraic
geometry, finite combinatorics and the theory of finite maps may be used, but they
must be stated accurately and applied with all necessary hypotheses.  The proved
consequences 1–10 listed in §2 may be used as established background.

**Known results about this obligation** (established; may be used, with the stated
limits):

* It is known that, for each of the twelve Γ9 × Γ10 cases, there is an exact
  rational-coordinate assignment to the named points $a_1, s_1, s_2, t_1, t_2, b, b'$
  and the residual's fresh points that satisfies: the first-apex equalities with
  $r \ne \rho$; all pairwise distinctness conditions of Γ6; the shell memberships
  $s_1, s_2 \in K(s_1)$, $t_1, t_2 \in K(t_1)$ with positive radii; the selected
  equality of Γ9; the four negative incidences of Γ8; the residual's memberships; and
  the "no named class has more than four named points" condition.  This means
  precisely that the named-point projection of Γ is consistent in every case.  It does
  **not** imply that Γ is satisfiable: those assignments omit the cap partition and
  cap order, the unnamed points of every shell, criticality for every point, the
  no-$(m,4,4)$ condition, robustness and richness, the two-centre packets' rows, and
  minimality.  Its valid conclusion is that any proof of inconsistency must use
  structure beyond the named-point projection.
* It is known that a six-point strictly convex configuration with rational
  coordinates realizes: $|a p| = |a q|$, $|a u| = |a v|$, $|b_0 p| = |b_0 q|$,
  $|b_1 u| = |b_1 v|$, with $b_0 = u$, distinct source pairs, distinct blockers, and
  the alternating boundary order in which the sources of each collision lie on
  opposite arcs between the apex and their blocker.  This means that the metric and
  order content of one Γ9 arm is realizable in convex position; it does not model the
  rest of Γ.  In particular the realizable boundary order is the alternating one, so
  any argument whose contradiction comes from a non-alternating order does not apply.
* It is known (consequence 9) that each arm of Γ9 makes the same-named cross incidence
  false; no known result derives any positive shared incidence between $K(s_1)$ and
  $\{t_1, t_2\}$, or between $K(t_1)$ and $\{s_1, s_2\}$, from Γ.
* It is known that a previous full case-split proof attempt used none of Γ7, Γ10 or
  minimality and ended in a circular step (§5, third bullet); it established nothing.
* The parent problem: it is an open question (Erdős #97) whether a finite set in
  convex position with the K4 property exists.  This may be cited as context; it may
  not be assumed in either direction.

---

## §7 Orchestration

Use multiagent orchestration aggressively and dynamically.  You have up to
$N$ concurrent agents available (set $N$ per harness; if the harness has no
subagents, run the portfolio below sequentially in rounds and keep the same
registry discipline).  Do not use a fixed assignment such as "$N$ agents for strategy
$X$."  Instead, manage the search using the following heuristics:

* Begin with a genuinely diverse portfolio of approaches.  Agents should explore
  substantially different formulations, invariants, reductions, and computational
  sanity checks, including at least these families:
  1. dynamics of the fixed-point-free blocker map $c : A \to A$: fibres, chains,
     periodic points, the chain $s_i \mapsto b = t_j \mapsto b'$ created by Γ9, and
     what a third multiplicity event (Γ10) forces on fibre sizes and images;
  2. unique-four centres: a blocker value that is also a source ($t_1 = b$) has
     exactly one four-point circle, namely $K(s_1)$, while lying on $S_{a_1}(\rho)$ and
     on $K(t_1)$; combine with richness of $a_1$ and exactness of $S_{a_1}(\rho)$;
  3. global counting: $|A| \le 4|\mathrm{NR}|$ together with $c(A) \subseteq
     \mathrm{NR}$, the cap sizes, and the positions of blocker values in cap interiors;
     look for a sharpened count under Γ9;
  4. minimality through deletion: every deletion destroys the K4 property of some
     point; combine with $\mathrm{Robust}(a_2)$, $\mathrm{Robust}(a_1)$ and the
     two-centre packets, which say which centres survive which deletions;
  5. the no-$(m,4,4)$ condition applied to packets other than $\mathcal S$ (other
     non-obtuse Moser triangles on $\Gamma$, other surplus choices);
  6. cap-arc cyclic order and bisector separation combined with global data (never
     alone; see §5);
  7. circle–circle intersection bounds applied to the outside points $e, o$ of
     Γ10(ii)/(iii) against the other shells and against $S_{a_1}(r)$, $S_{a_1}(\rho)$;
  8. the two exact first-apex circles: locate the two points of $S_{a_1}(r)$ and of
     $S_{a_1}(\rho)$ outside $C^\circ$ (they lie in $C_s$, in $C'$, or are $a_0, a_2$),
     and use richness of $a_1$ (a third circle about $a_1$ with $\ge 4$ points, or one
     with $\ge 6$);
  9. metric algebra: squared-distance equalities plus determinant sign conditions,
     Gröbner bases with saturation against degeneracies, exact real-root counting;
  10. inscribed-angle and chord arguments on $\Gamma$ for the non-obtuse Moser
      triangle and the caps it cuts;
  11. incidence counting for equidistant pairs and isosceles triangles in convex
      position;
  12. structure of the "same shell" relation on $A$ (which pairs of points share a
      shell) as a graph, with the exact-four condition as a degree constraint;
  13. Ptolemy and Kalmanson inequalities for convex quadrilaterals formed by the named
      points, combined with the equalities of Γ, used only together with global data;
  14. constructive attempts at relative models: exact search for configurations
      satisfying Γ minus minimality, starting from the twelve local witnesses and
      adding the omitted global conditions one at a time, to locate which condition
      first fails;
  15. computational sanity checks: enumerate combinatorial types (which points lie on
      which circles) consistent with Γ for small $|A|$ ($15 \le |A| \le 24$), then test
      metric realizability exactly.

* Do not tell most agents the currently favored approach.  Preserve independence
  during early rounds so that agents do not all converge to the same attractive but
  incomplete argument: the local bisector/alternation argument, the trivial cross-hit
  negations, the "$(2,1,1)$ packing" heuristic, and pure order/inequality reasoning
  are the known attractors and each is refuted by an exact model (§6).

* Maintain an explicit registry of approach families.  Group agents by the
  mathematical idea they are using, not by superficial wording.  If many agents
  converge to one family, redirect some of them toward underexplored formulations.

* Do not allow one approach to dominate merely because it gives an elegant
  reformulation.  A route that ends at an unproved geometric or combinatorial lemma
  equivalent in strength to the original problem is not close to completion unless it
  supplies a genuinely new proof of that lemma.

* When an approach stalls at a theorem-strength missing lemma, mark that route as
  blocked.  Only continue assigning agents to it if someone proposes a materially new
  mechanism, invariant, construction, quantitative estimate, or exact configuration.

* Keep several incompatible proof routes alive through multiple rounds.  Maintain both
  inconsistency routes and construction routes until one side is rigorously ruled out.
  Cross-pollinate ideas only after independent agents have developed them far enough to
  expose their real strengths and gaps.

* Use computational agents throughout.  They should perform exact small-case
  computations, exact rational or algebraic constructions, Gröbner/real-algebraic
  checks of proposed lemmas, enumeration of combinatorial types, and searches for
  counterexamples to intermediate lemmas.  Computation is evidence unless it is
  converted into a rigorous general proof or an exact certificate completing a valid
  reduction.

* Search aggressively for counterexamples to proposed lemmas.  Before any intermediate
  lemma or sublemma is relied on, assign agents (computational where possible) to
  attempt to refute it, starting from the twelve local witnesses and the six-point
  model.  A found counterexample kills the route immediately and cheaply; a lemma that
  has survived no refutation attempt is not established.

* Use adversarial agents throughout — independent agents that did not produce the
  argument under audit.  Every candidate proof must be checked for:
  * use of a bound $|C| \ge 8$ or $|C| \le 7$;
  * use of $u = s_1$, $u' = t_1$, or any identification of $(q, w)$ with $(s_1, s_2)$;
  * use of the wrong cap (closed $C$ versus strict $C^\circ$; the surplus cap versus
    the first opposite cap) or the wrong apex;
  * a shell treated as "at least four" instead of "exactly four", or criticality
    dropped for some point;
  * a radius class about a point not in $A$ treated as a shell;
  * the point $p$ itself counted in $K_4(X, p)$;
  * strict versus non-strict inequalities in cap membership and in angles of the
    Moser triangle (right angles are allowed);
  * assuming a symmetry between $s_1$ and $s_2$ (or $t_1$ and $t_2$) that Γ8 breaks;
  * assuming the swap symmetry without checking each item of Γ;
  * assuming the residual's fresh points lie in a particular cap;
  * assuming a blocker value has exactly two sources in all of $A$;
  * treating "$p$ and $q$ lie on opposite arcs" as a contradiction with itself, or
    deriving the same biconditional twice;
  * an unjustified interchange between "some circle about $p$ with $\ge 4$ points" and
    "the circle $K(x)$" for a specific $x$;
  * use of minimality in any form other than those allowed in §4;
  * use of Erdős #97 in either direction;
  * numerical rather than exact verification in any construction;
  * a construction whose verification checks only the named points and not every
    point of $A$;
  * circular use of a statement equivalent to the desired conclusion (e.g. "minimal
    counterexamples have no blocker coincidences").

* Require agents to return concrete lemmas, constructions, exact coordinates,
  equations, case tables, or counterexamples to proposed sublemmas.  Reject status
  reports, vague optimism, and claims that an unproved incidence or counting
  statement is "routine."

* The root agent should repeatedly synthesize, challenge, redirect, and launch new
  rounds.  Do not stop after the first wave fails.  Produce a complete solution only if
  it survives adversarial audit; otherwise report only the strongest rigorously proved
  derivation and its exact remaining gap (a verified relative model, as defined in §4,
  counts as such a derivation and must be reported in full).

---

## §8 Persistence

Do not return merely because current approaches fail or agents report
theorem-strength gaps.  Continue launching new rounds, reopening blocked approaches
only when there is a genuinely new mechanism, and searching for fresh formulations.
Spend at least three full rounds of the approach portfolio in §7 before even
thinking of returning.

---

## §9 Return contract

Return only when the satisfiability of Γ has been completely resolved — a complete
proof that (Γ1)–(Γ10) are jointly inconsistent, or one fixed exactly verified
instance of all of (Γ1)–(Γ10) — and the argument survives adversarial audit.  Do
not return a reduction, partial result, isolated missing lemma, finite computation,
numerical guess, "best effort" summary, or explanation of why the problem is
difficult.

Do not stop, return, or give up until you have found a complete and rigorous
solution.  Continue exploring every plausible approach, repairing failed arguments,
and developing new ones until the problem is fully resolved.

---

## §10 Search restriction

Public search may be used only for ordinary mathematical background or standard named
theorems, not to search for a solution to this exact obligation, to the Erdős problem
behind it, or to any benchmark.  Do not search the public web merely to determine
whether the underlying problem is open, and do not answer that it is open.
