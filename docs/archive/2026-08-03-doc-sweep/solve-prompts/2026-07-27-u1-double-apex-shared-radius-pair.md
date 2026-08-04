# Complete-resolution prompt — U1 two-shell witness producer (Family G): `DoubleApexOffSurplusSharedRadiusPair`

Date: 2026-07-27.
Target: `Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`,
`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2401` (`sorry` at `:2446`).
This document is self-contained: every hypothesis and the conclusion are
restated as plain mathematics, with the Lean-object mapping in Appendix A.
Faithfulness of the translation to the Lean statement is the top quality
criterion; where a convention matters (closed caps, index maps, exact-class
filters) it is spelled out.

---

## §1 Notation preamble

* $ℝ²$ denotes the Euclidean plane `EuclideanSpace ℝ (Fin 2)`; $\mathrm{dist}(x,y) = \|x-y\|$ is the Euclidean distance. Points are written $x = (x_0, x_1)$.
* $A$ is a finite set of points of $ℝ²$ (`Finset ℝ²`). $|A|$ is its cardinality. $A \setminus \{x\}$ is `A.erase x`.
* **Convex independence** (strictly convex position): $A$ is convex-independent iff every $a ∈ A$ satisfies $a ∉ \mathrm{convexHull}(A \setminus \{a\})$.
* **$K4$ property**: $A$ has the 4-equidistant property iff for every $a ∈ A$ there exists $r > 0$ with $|\{y ∈ A : \mathrm{dist}(a,y) = r\}| ≥ 4$. (The condition $r>0$ automatically excludes $y=a$.) We call $\{y ∈ A : \mathrm{dist}(c,y) = r\}$ the **radius class** of $A$ at center $c$, radius $r$; a radius class is **exact-4** when it has exactly 4 elements.
* **$K4$ at a point in a subset**: for $S ⊆ ℝ²$ finite and $c ∈ ℝ²$, "$S$ has 4 equidistant points at $c$" means $∃ r > 0$ with $|\{y ∈ S : \mathrm{dist}(c,y) = r\}| ≥ 4$.
* **Removable vertex**: $x$ is removable for $A$ iff $x ∈ A$ and $A \setminus \{x\}$ still has the $K4$ property.
* **Minimum enclosing circle (MEC)** of nonempty $A$: a center $O ∈ ℝ²$ and radius $R ≥ 0$ with $\mathrm{dist}(a, O) ≤ R$ for all $a ∈ A$, and $R$ minimal among all enclosing (center, radius) pairs. The Lean `mec A hA` is one fixed such circle chosen by `Classical.choice`; its radius is unique by minimality, and in the Euclidean norm its center is unique (midpoint argument). "Boundary" means $\mathrm{dist}(a,O) = R$.
* **Signed area**: $\mathrm{sa}(v, v_j, v_k) := (v_{j,0} - v_0)(v_{k,1} - v_1) - (v_{k,0} - v_0)(v_{j,1} - v_1)$, the cross product of $v_j - v$ and $v_k - v$ (twice the oriented area of triangle $(v, v_j, v_k)$).
* **Closed opposite arc-side predicate**: $\mathrm{OnArcOpposite}(v_i, v_j, v_k, v) :⟺ \mathrm{sa}(v, v_j, v_k) \cdot \mathrm{sa}(v_i, v_j, v_k) ≤ 0$ — the point $v$ lies on the closed side of the chord line through $v_j, v_k$ opposite to $v_i$ (equality = on the chord line; the closed-cap convention includes the chord).
* $q$-deleted skeleton: $\mathrm{sk}_q := A \setminus \{q\}$; further $\mathrm{sk}_q \setminus \{p\}$ erases the center $p$.
* Indices $i, j$ range over $\{0, 1, 2\}$ (Lean `Fin 3`); cap $C_1, C_2, C_3$ are selected by index $0, 1, 2$ respectively.
* All hypotheses below are exact equalities/inequalities of real algebraic quantities; nothing is asymptotic.

## §2 Problem statement

Resolve the following statement completely.

**Configuration data.** A finite point set $A ⊂ ℝ²$; six labelled points $p, q, t_1, t_2, t_3, u$; a triangle $(v_1, v_2, v_3)$; three caps $(C_1, C_2, C_3)$; two indices $i ≠ j ∈ \{0,1,2\}$; five "row" records (below). The hypotheses:

**H1 (carrier).** $A$ is nonempty, not all collinear, convex-independent, and $|A| > 9$.

**H2 (global $K4$).** Every $a ∈ A$ has some radius class of size $≥ 4$ (see §1).

**H3 (ambient packet).** The Lean record `CounterexampleData` additionally carries *some* surplus-cap packet on $A$ (`D.packet`): a non-obtuse circumscribed MEC Moser triangle with a cap triple and a designated cap of size $> 4$, exactly as in H4–H6 below but with its own (possibly different) triangle/caps/index. It is otherwise unconstrained and does not appear in the conclusion. (Interface assumption: for any $A$ satisfying H1–H2 and H6's cap sizes, such a record can be assembled from the H4–H6 data itself, so H3 adds no independent content beyond requiring the bundle to exist.)

**H4 (MEC Moser triangle, non-obtuse, circumscribed).** $v_1, v_2, v_3 ∈ A$ are pairwise distinct, all three lie on the boundary of the MEC of $A$ ($\mathrm{dist}(v_m, O) = R$ for the fixed MEC $(O, R)$ of $A$), the circumscribed branch of the Sylvester dichotomy is selected, and all three vertex angles are non-obtuse:
$$⟨v_2 - v_1,\, v_3 - v_1⟩ ≥ 0,\quad ⟨v_3 - v_2,\, v_1 - v_2⟩ ≥ 0,\quad ⟨v_1 - v_3,\, v_2 - v_3⟩ ≥ 0.$$

**H5 (closed cap triple pinned to arcs).** $C_1, C_2, C_3 ⊆ A$ with, for each $k$ (indices mod 3): $v_k ∉ C_k$, $v_{k+1} ∈ C_k$, $v_{k+2} ∈ C_k$; every non-vertex point of $A$ lies in exactly one cap; and the arc-membership invariant: for all $a ∈ A$,
$$a ∈ C_1 ⟺ \mathrm{OnArcOpposite}(v_1, v_2, v_3, a), \quad a ∈ C_2 ⟺ \mathrm{OnArcOpposite}(v_2, v_3, v_1, a), \quad a ∈ C_3 ⟺ \mathrm{OnArcOpposite}(v_3, v_1, v_2, a).$$
So each cap is exactly the set of $A$-points on the closed side of one chord of the triangle opposite its apex. Consequences (proved in-tree): $|C_1| + |C_2| + |C_3| = |A| + 3$ (each vertex counted in two caps, each non-vertex in one); the cap triple over a fixed triangle is uniquely determined by the invariant. (In Lean the cap triple lives over the *structural projection* $M$ of the MEC triangle, and the hypothesis `hM` identifies $M$'s vertices with $(v_1, v_2, v_3)$; the translation above has already performed that identification.)

**H6 (two large caps; $q$ a non-vertex surplus point).** Writing $\mathrm{cap}(0) = C_1$, $\mathrm{cap}(1) = C_2$, $\mathrm{cap}(2) = C_3$:
$q ∈ \mathrm{cap}(i)$, $|\mathrm{cap}(i)| > 4$, $q ∉ \{v_1, v_2, v_3\}$, $j ≠ i$, and $|\mathrm{cap}(j)| ≥ 5$.

**H7 (no $(m,4,4)$ packet anywhere on $A$).** There is NO choice of (non-obtuse circumscribed MEC-boundary triangle on $A$, cap triple over it satisfying H5's invariant, surplus index with cap size $> 4$) whose two non-surplus caps both have exactly 4 points. This quantifies over *all* admissible triangles and cap assignments on the same $A$, not just $(v_1,v_2,v_3)$.

**H8 (critical shell system — every point blocked by an exact-4 class).** For every $s ∈ A$ there exist a center $c(s) ∈ A \setminus \{s\}$ and a radius $ρ(s) > 0$ such that:
* the full radius class $K_s := \{y ∈ A : \mathrm{dist}(c(s), y) = ρ(s)\}$ has exactly 4 points and $s ∈ K_s$; and
* (blocker property) after deleting $s$, no radius class at $c(s)$ of size $≥ 4$ survives: for every $r > 0$, $|\{y ∈ A\setminus\{s\} : \mathrm{dist}(c(s), y) = r\}| ≤ 3$.

Equivalently: every $≥4$ radius class of $A$ at $c(s)$ contains $s$ and has exactly 4 points. Derived (one line): H8 implies $A$ has **no removable vertex**.

**H9 (local no-$q$-free blocker at $p$).** $q ∈ A$, $p ∈ A \setminus \{q\}$, and for every $r > 0$: $|\{y ∈ (A\setminus\{q\})\setminus\{p\} : \mathrm{dist}(p, y) = r\}| ≤ 3$.

**H10 (fixed dangerous triple at $p$).** $t_1, t_2, t_3 ∈ (A\setminus\{q\})\setminus\{p\}$ pairwise distinct, $\mathrm{dist}(p, q) > 0$, and $\mathrm{dist}(p, t_m) = \mathrm{dist}(p, q)$ for $m = 1, 2, 3$.

**H11 (live data).** (a) $\{t_1, t_2, t_3\}$ is non-collinear; (b) exact deleted-radius count: $|\{y ∈ (A\setminus\{q\})\setminus\{p\} : \mathrm{dist}(p, y) = \mathrm{dist}(p, q)\}| = 3$ (so the triple is the whole surviving class); (c) selected candidate: $u ∈ (A\setminus\{q\})\setminus\{p\}$ and $u ∉ \{t_1, t_2, t_3\}$. Derived in-tree: $\mathrm{dist}(p, u) ≠ \mathrm{dist}(p, q)$.

**H12 (six labels distinct).** $p, q, t_1, t_2, t_3, u$ are pairwise distinct.

**H13 (five critical source rows).** For each source $s ∈ \{q, t_1, t_2, t_3, u\}$ there are a center $c_s ∈ A \setminus \{s\}$ and radius $r_s > 0$ with the full radius class $\{y ∈ A : \mathrm{dist}(c_s, y) = r_s\}$ of size exactly 4 and containing $s$ (with its four points named). NOTE: the rows carry **no** blocker property and **no** stated provenance from H8's system — they are arbitrary exact-4 full shells through their sources.

**H14 ($t_2$-row pinned to the dangerous circle).** The $t_2$-row's center is $p$, and its full class is exactly the four dangerous labels:
$$\{y ∈ A : \mathrm{dist}(p, y) = r_{t_2}\} = \{q, t_1, t_2, t_3\}.$$
Since $q$ is in the class, $r_{t_2} = \mathrm{dist}(p, q)$. Combined with H9: the ONLY radius class of $A$ at $p$ of size $≥ 4$ is $\{q, t_1, t_2, t_3\}$, and it is exactly 4.

**Conclusion (the leaf's existence form).** Let the **surplus cap** be $\mathrm{cap}(i)$, and let $(a_1, a_2)$ be the two triangle vertices *adjacent* to it (its two endpoints), per the fixed index map
$$i = 0: (a_1, a_2) = (v_2, v_3);\qquad i = 1: (a_1, a_2) = (v_3, v_1);\qquad i = 2: (a_1, a_2) = (v_1, v_2),$$
with the remaining vertex $s^\* := v_{i+1}$ (i.e. $v_1, v_2, v_3$ resp.) the **surplus apex** (the vertex not on the surplus cap). Then:
$$∃\, x, w' ∈ A:\; x ≠ w',\; x ∉ \mathrm{cap}(i),\; w' ∉ \mathrm{cap}(i),\; ∃\, r, ρ ∈ ℝ:\; \mathrm{dist}(x, a_1) = \mathrm{dist}(w', a_1) = r \;\text{and}\; \mathrm{dist}(x, a_2) = \mathrm{dist}(w', a_2) = ρ.$$

**Edge conventions.**
* Caps are closed: each cap contains its two endpoint vertices; $a_1, a_2 ∈ \mathrm{cap}(i)$, so $x, w' ∉ \{a_1, a_2\}$ automatically; the surplus apex $s^\*$ is itself off-surplus and is an admissible value of $x$ or $w'$.
* $r, ρ$ are existentially quantified reals with no positivity constraint (they are distances, hence $≥ 0$ automatically).
* The quantifier order is essential: the configuration (all of H1–H14) is universally quantified outside; $x, w', r, ρ$ are chosen last.
* "$∉ \mathrm{cap}(i)$" with the arc invariant H5 means: strictly on the same open side of the chord line $a_1 a_2$ as the surplus apex $s^\*$ (proved in-tree, `signedArea2_mul_pos_of_not_mem_surplusCap_gen`).

### §2.1 Decisive logical structure — read before choosing a direction

The condition "$a_1$ and $a_2$ each equidistant from $x$ and $w'$" says both apexes lie on the perpendicular bisector of the segment $x w'$. Since $a_1 ≠ a_2$ (H4), that bisector IS the chord line through $a_1, a_2$; hence $x$ and $w'$ are **mirror images across the line $a_1 a_2$**. But both are off-surplus, hence strictly on the *same* open side of that line (H5/H6), while a mirror pair lies on opposite open sides. So — and this is a kernel-checked, core-axioms-only theorem in-tree (`U2NonSurplusSqueeze.oppCap2_escape_gen`, `U1LargeCapRouteBTail.lean:2257`) — **the conclusion's pair cannot exist in any configuration satisfying the hypotheses**. Therefore:

* the theorem is provable **iff the hypothesis set H1–H14 is contradictory** (the pair is then produced ex falso, and this is exactly how the sole consumer uses it: pair → `oppCap2_escape_gen` → `False` → `∃ removable vertex`);
* the theorem is refutable **iff the hypothesis set is satisfiable**: any single exact model of H1–H14 automatically has no such pair, hence witnesses the failure of the implication;
* a "proof" that the pair cannot exist is NOT a refutation of the theorem — it is already known and proved in-tree. Do not report it as progress in either direction.

The mathematical content, in the project's phrasing: *does the two-large-cap configuration ($>4$ surplus, second cap $≥ 5$, third cap $≥ 4$, hence $|A| ≥ 11$) + full center-$K4$ + a critical shell system + the exact dangerous row at $p$ + no-$(m,4,4)$ force the caps to overflow the exact-radius classes at the two apexes into a double-apex coincidence — equivalently, force a contradiction?*

## §3 Assume-solvable framing

Assume for purposes of this task that a complete resolution exists, but do not assume in advance which branch holds. A complete solution must prove exactly one of the two statements in §4. Both outcomes are equally valuable to the project: branch A closes the leaf; branch B proves the leaf false as stated and forces a route change, which must be reported as a success, not a failure.

## §4 Dual-branch success criteria

**Affirmative resolution (A).** A complete, rigorous proof that under H1–H14 the pair $(x, w')$ always exists. By §2.1 any correct proof necessarily establishes that H1–H14 are jointly unsatisfiable; a valid submission may equally derive `False` from H1–H14 by any rigorous route and conclude the existential ex falso. The proof must:
* be valid for **every** $|A| ≥ 11$ (H6 + the proven cap lower bounds give $|A| + 3 ≥ 14$; H1 gives $|A| > 9$; there is no upper bound on $|A|$) — a finite-cardinality verification alone does not qualify unless accompanied by a proof covering all remaining cardinalities;
* use every hypothesis it needs with exact quantifiers (in particular H7 quantifies over all packets on $A$, and H8 over all points of $A$);
* be precise enough to formalize in Lean 4 / mathlib on the existing vocabulary (Appendix A): every step either cites a named in-tree/mathlib theorem or is elementary Euclidean/counting reasoning with all cases handled (degenerate positions, boundary/chord cases of the closed-cap convention, all three values of $i$ and both values of $j$);
* not assume, without proof, additional structure such as: symmetry of the configuration, genericity/general position beyond what H5 grants, $|A| = 11$, the $(m,4,4)$ regime (excluded by H7), removability (excluded by H8), or that the five rows of H13 come from H8's system.

**Negative resolution (B).** One fixed configuration with **exact algebraic coordinates** (rational, or algebraic numbers given by exact minimal polynomials / isolating intervals with exact certification) satisfying **every** hypothesis H1–H14, verified exactly — every equality as an identity in the field of definition, every inequality by exact sign computation, every cardinality by complete enumeration. It is insufficient to present floating-point coordinates, a family of near-configurations, or a configuration verified only against a subset of the hypotheses. A configuration failing even one hypothesis is worthless (§5). The no-pair property need not be verified independently — it follows from the proven reflection kernel — but an explicit mirror-pair scan is welcome redundancy. The certificate must include, for the fixed $A$:
* the exact MEC (center, radius) with proof that it is the MEC (all points enclosed; minimality — e.g. two boundary points antipodal or three boundary points with the center in their convex hull; center uniqueness by the standard midpoint argument so that the Lean `mec` denotes it);
* the boundary triple $(v_1, v_2, v_3)$ with the three inner-product signs (H4) and the three filtered caps with their exact memberships and counts (H5, H6);
* the complete H7 sweep: enumeration of ALL pairwise-distinct MEC-boundary triples with all three non-obtuse inner products and a valid cap triple (each non-vertex point in exactly one closed cap), showing none has cap profile ($>4$, exactly 4, exactly 4) in any rotation;
* the H8 assignment $s ↦ (c(s), ρ(s))$ for every $s ∈ A$ with the exact-4 class and the full blocker check (every radius at $c(s)$ realized $≥ 4$ times in $A$ contains $s$);
* the H9–H14 data: $p, q, t_1, t_2, t_3, u$, the exact dangerous class at $p$, counts, distinctness, and the five rows with their exact-4 full classes, the $t_2$-row centered at $p$ with support exactly $\{q, t_1, t_2, t_3\}$.

## §4b Sanctioned reformulations

Each of the following is exact and may be used, but must be re-proved in the submission before use; none is lossy, but each has a listed invariant that must be preserved.

1. **False-form.** The theorem is equivalent to `LargeCapPCenteredT2SourceTwoLargeCapsStatement` (`U1LargeCapRouteBTail.lean:2344`): from H1–H14 (that form also carries "no removable vertex", which H8 implies) derive `False`. Invariant: the equivalence uses the proven reflection kernel in one direction and ex falso in the other; do not cite the kernel as if it resolved either branch.
2. **Mirror form.** Under H1–H5 the conclusion is equivalent to: *some two distinct off-surplus points of $A$ are mirror images across the chord line $a_1 a_2$*. Invariant: needs $a_1 ≠ a_2$ (H4) and the H5 arc invariant; the closed-cap convention places $a_1, a_2$ inside the surplus cap.
3. **Profile-collision form.** Define $Φ : A \setminus \mathrm{cap}(i) → ℝ²_{≥0}$, $Φ(x) = (\mathrm{dist}(x, a_1), \mathrm{dist}(x, a_2))$. The conclusion says $Φ$ is not injective. Branch B needs: $Φ$ injective on the off-surplus points (automatic in any model, but this is the cheap scan). Invariant: $Φ$-collisions and mirror pairs are the same thing only because all off-surplus points are on one open side of the line $a_1 a_2$.
4. **Model form of branch B.** "Exhibit a model of H1–H14" is exactly branch B; the pair-nonexistence check is subsumed (§2.1). Invariant: the model must satisfy every hypothesis, including the universally-quantified H7 and H8.

## §5 Insufficient progress

Partial progress does not count unless it implies exactly one of the two resolutions above. In particular, the following are insufficient:

* a pair co-radial about only one apex ($\mathrm{dist}(x,a_1) = \mathrm{dist}(w',a_1)$ but not about $a_2$), for either branch;
* a pair in which one or both points lie in the surplus cap, or one point is not in $A$;
* existence of the pair under extra symmetry, genericity, or general-position assumptions not implied by H1–H14;
* existence proofs valid only for special cap profiles (e.g. exactly $(5,5,4)$, or $|A| = 11$) without covering all profiles and cardinalities allowed by H6;
* numerical near-witnesses (floating point, interval-only, or unverified algebraic data) for either branch without exact verification;
* a candidate branch-B configuration failing even one hypothesis — in particular: non-convex-position sets; sets where some point lacks a $≥4$ radius class (H2); sets with a removable vertex or no critical shell system (H8); sets admitting an $(m,4,4)$ packet somewhere (H7); configurations without the exact dangerous row at $p$ (H9/H11(b)/H14); triangles not on the exact MEC boundary or with an obtuse vertex (H4). Such configurations are worthless for this task and must not be reported as counterexamples or near-counterexamples;
* observing that the conclusion's pair cannot exist (already proven in-tree) and claiming on that basis that the theorem is false — the theorem is an implication; see §2.1;
* deriving the pair (or `False`) from the $(m,4,4)$ regime — H7 excludes it here; the in-tree M44 squeeze results are attack-surface material, not applicable verbatim;
* a conditional theorem assuming the pair, a `...Closers`-style package, an outcome enumerator, or any wrapper that moves the unproved obligation without eliminating a case;
* re-derivation of already-proven scaffold (cap-sum identity, cap lower bounds $≥ 4$, second-cap $≥ 5$ bridge, reflection kernel, off-surplus strict side, H8 ⟹ no removable vertex);
* fixed-radius joint-fiber lower bounds: for fixed $(r, ρ)$ the off-surplus joint fiber has at most one point (kernel-checked in `scratch/atail-force/critical_row_coupling.lean`); any route lower-bounding a single fiber by 2 is dead on arrival;
* pattern-level or ideal-theoretic uniform lemmas that ignore convex position — falsified for $n ≥ 15$ by exact non-convex witnesses (dead-ends entry `doubleapex-card12up-uniform-pattern-lemma`); any uniform statement must be convexity-coupled;
* results about a modified configuration (different cap convention, open caps, non-MEC triangle, relaxed exactness of shells);
* reducing the problem to another unproved incidence or cap-counting statement of comparable strength.

## §6 Allowed background

Standard proved theorems of plane Euclidean geometry, convexity, and finite combinatorics may be used, but must be stated accurately and applied with all hypotheses. The following in-tree results are established background (core axioms only) and may be cited by name:

* `CapTriple.cap_sum_identity` — $|C_1|+|C_2|+|C_3| = |A|+3$;
* `U1OppositeCapLowerBounds.capTriple_caps_card_ge_four` / `oppositeCapLowerBoundsAt_of_circumscribed` (`U1LargeCapRouteBTail.lean:2135`) — under H1/H2/H4/H5 every cap has $≥ 4$ points; hence $|A| ≥ 11$ here;
* `exists_secondLargeCap_of_noM44` (`:2157`) — already instantiated as H6's $j$;
* `U2NonSurplusSqueeze.mem_surplusCap_iff_onArc_gen` (`:2233`) and `signedArea2_mul_pos_of_not_mem_surplusCap_gen` (`:2249`) — off-surplus ⟺ strictly on the surplus-apex side of the chord $a_1 a_2$;
* `U2NonSurplusSqueeze.oppCap2_escape_gen` (`:2257`) with `U2.WitnessReflectionKernel.twoCircle_midpoint_collinear` — the reflection kernel: any conclusion-pair yields `False`. It means exactly §2.1; it does **not** imply the theorem is false;
* `U2SqueezePort.oppApex1_exactRadiusClass_cover` (`U2SqueezePort.lean:299`) and `oppApex2_exactRadiusClass_cover` (`:320`) — every radius class at an apex of `D.packet` is covered by (surplus cap) ∪ (other opposite cap) ∪ (interior of its own opposite cap); stated for `D.packet`, so transferring it to the leaf packet built from $(v_1,v_2,v_3), (C_1,C_2,C_3), i$ requires the cap linkage — this transfer is part of the open work, not established;
* `U2SqueezePort.fourClass_of_cover` (`:345`) — the counting core: a $≥4$ class covered by two $≤1$-intersection regions plus a 2-point interior is exactly 4 and contains the interior;
* `oppApex{1,2}_interior_card_eq_two_of_isM44` (`:249`, `:274`) — the 2-point-interior inputs, proved only under $(m,4,4)$, which H7 excludes; transferring their content to the no-M44 regime is open;
* H8 ⟹ no removable vertex (one-line consequence, background).

Known negative results that must be respected (all recorded in `docs/dead-ends.md` and `docs/closure-matrix-2026-07-09.md`):
* the 2026-07-03 deep-thinker verdict rejected Apollonius-alone, verbatim-N4e-port, and finite-label-SMT routes for the parent False-form;
* `ATAIL-DANGEROUS-BLOCKER-COLLAPSE` (kernel-checked): from H8 as a bare existence, blocker-center diversity among the four dangerous sources is not forcible — a critical-shell system can always be modified so all four dangerous sources have center $p$; a proof wanting non-$p$ centers must construct them, not select them;
* `ATAIL-UROW-CAP-MULTIPLICITY-AUDIT`: this theorem receives `rows` (H13) and the shell system (H8) *independently*; no common provenance may be assumed;
* `ATAIL-FIBER-EXTRACT`: single joint fibers off-surplus have $≤ 1$ point (see §5);
* `doubleapex-card12up-uniform-pattern-lemma`: exact non-convex falsifiers (15-, 16-, 20-point lattice/ring witnesses, `scratch/d3-formulation/`) kill every equality/separator-shaped uniform statement for $n ≥ 15$ that does not use convex position — including row-decorated ones;
* the repo's exact-rational 11-point $(5,5,4)$ model carries an exact-four shell through every point but fails full center-$K4$ — it satisfies neither H2 nor H8 and is not a branch-B candidate, only a warning about how much of the hypothesis set weak models can already satisfy.

## §7 Multiagent orchestration block

Use multiagent orchestration aggressively and dynamically. You have up to 24 concurrent agents available. Do not use a fixed assignment such as "N agents for strategy X." Manage the search with these heuristics:

* Begin with a genuinely diverse portfolio. Agents should explore substantially different formulations, invariants, and reductions, including:
  1. **Apex radius-class counting** — transfer the `fourClass_of_cover` squeeze from the M44 regime to H7's no-M44 regime via the cap linkage; count how the $≥5$ cap at $j$ and the $>4$ surplus cap populate the exact-radius classes at $a_1$ and $a_2$ (H2 gives each apex a $≥4$ class; H8 makes every point's class exact-4);
  2. **Perpendicular-bisector / mirror-pair forcing** — the pair is exactly two off-surplus points symmetric across the chord line $a_1 a_2$ (§4b.2); study when convex position + closed caps force or forbid such symmetry, and what the forced *absence* of it (true in any model) implies back on the class structure;
  3. **Circle-intersection counting** — two circles meet in $≤ 2$ points; radius classes at distinct centers interact through at most 2 shared points (`two_circle_common_point_eq_endpoint` is in-tree); combine with exact-4 classes at $c(s)$ (H8) and at $p$ (H14);
  4. **Cap/arc ordering and convex cyclic order** — points of $A$ in convex position have a cyclic order compatible with the three arcs; distances to an apex along a convex arc are unimodal-type quantities; in-tree Kalmanson machinery (`ATail/CapCrossingKalmanson`, `ATail/OrdinalKalmansonCycle`) is available vocabulary;
  5. **Blocker-map combinatorics** — H8's $s ↦ c(s)$ is a self-map of $A$ with every value's $≥4$-classes exact and $s$-pinned; study its functional graph (multiplicities, 2-cycles, centers serving several sources) against convex position;
  6. **Exact coordinate normalization + polynomial elimination** — gauge $a_1, a_2$ to fixed coordinates; the hypotheses become a semialgebraic system; eliminate with resultants/Gröbner (msolve, Singular) per cardinality window; must be coupled with a cardinality-reduction argument to be more than evidence;
  7. **SMT/SAT encodings** — nonlinear real arithmetic (Z3/cvc5) for small windows; SAT for the combinatorial layer (cap memberships, class incidences) with lazy geometric refutation; always validate encodings on a known result first (e.g. re-derive the $≤1$ joint-fiber bound or the M44 squeeze);
  8. **Pigeonhole on shell occupancy** — $|A| ≥ 11$ points, each on an exact-4 shell (H8); count incidences (point, shell) and compare with cap sizes and the apex covers;
  9. **Head-window split** — treat $|A| ∈ \{11, 12, 13, 14\}$ by exact computation (per the closure-matrix note, sampled patterns there die in $≤ 8$-point windows) while a separate convexity-coupled argument handles $|A| ≥ 15$; the two halves must meet with no gap;
  10. **Branch-B exact model search** — construct candidate carriers satisfying the heaviest constraints first (H2 + H8 + convex position), then check H7 and the dangerous-row block; use the known near-miss models as seeds and repair their failing hypotheses; exact algebra only at the certification stage, numerics allowed for search;
  11. **Reflection-symmetric ansatz for branch B** — a model symmetric across a line NOT through two apexes avoids forced mirror pairs; study whether symmetry helps satisfy H8 without creating an H7 violation;
  12. **Dangerous-row local geometry** — H14 pins an exact 4-class $\{q, t_1, t_2, t_3\}$ on the circle of radius $\mathrm{dist}(p,q)$ about $p$, with $q$ in the surplus cap and H11(b) exactness; propagate through H5's arc constraints to locate $p$ relative to the caps;
  13. **Minimality-free audit** — the statement does not assume global minimality (`D.Minimal`) — only its two shadows H8 and (implied) no-removability; check whether a proposed proof silently uses minimality (it may not);
  14. **Computational sanity checks throughout** — exact small-case computation, mirror-pair scans, complete H7 sweeps for candidate models, counterexample search against every intermediate lemma proposed by other agents.
* Do not tell most agents the currently favored approach. Preserve independence during early rounds so that agents do not all converge to the same attractive but incomplete argument. The known **attractor approaches** to warn only the auditors about: (i) Apollonius-alone / verbatim N4e ports / finite-label SMT (rejected by the recorded verdict); (ii) single joint-fiber counting (provably capped at 1 point; §5); (iii) uniform pattern-level algebra without convexity (exactly falsified for $n ≥ 15$).
* Maintain an explicit registry of approach families, grouped by mathematical idea. If many agents converge to one family, redirect some toward underexplored formulations.
* Do not allow one approach to dominate merely because it gives an elegant reformulation. A route that ends at an unproved incidence or cap-counting lemma of strength comparable to the leaf is not close to completion.
* When an approach stalls at a theorem-strength missing lemma, mark that route as blocked; reopen it only for a materially new mechanism, invariant, construction, or quantitative estimate.
* Keep several incompatible routes alive through multiple rounds. Maintain both branch-A routes and branch-B model searches until one side is rigorously ruled out. Cross-pollinate only after independent development.
* Use computational agents throughout. Computation is evidence unless converted into a rigorous general proof or an exact certificate completing a valid reduction.
* Search aggressively for counterexamples to proposed intermediate lemmas before relying on them; the banked falsifiers (lattice/ring witnesses, the 11-point $(5,5,4)$ model, the blocker-collapse construction) are cheap first tests.
* Use adversarial agents throughout — independent of the authors. Every candidate resolution must be audited line-by-line against:
  * H1: convex independence verified exactly for every point; $|A| > 9$; noncollinearity;
  * H2: a $≥4$ class at **every** point of $A$, not only the labelled ones;
  * H3: the ambient packet is assemblable;
  * H4: vertices on the exact MEC boundary (MEC identified and certified); all three inner products $≥ 0$; pairwise distinctness;
  * H5: caps computed by the closed signed-area filter; every non-vertex in exactly one cap (no non-vertex on a chord line); the stated memberships of the vertices;
  * H6: exact cap cardinalities; $q$'s membership and non-vertex status; $j ≠ i$;
  * H7: the sweep covers ALL admissible triangles and rotations, not just the given one;
  * H8: exact-4 full classes (full ambient filter, not selected subsets) and the blocker bound at every radius for every source;
  * H9–H11: the deleted-skeleton filters and the exact count 3; non-collinearity of the triple; $u$'s membership and exclusions;
  * H12: all fifteen pairwise inequalities;
  * H13–H14: full-class exactness of all five rows; the $t_2$-row's center equals $p$ and its support equals $\{q, t_1, t_2, t_3\}$ as sets;
  * conclusion side: quantifier order; membership of $x, w'$ in $A$; both off-surplus; the `Fin 3` index maps for $\mathrm{cap}(\cdot)$ and $(a_1, a_2, s^\*)$ exactly as tabulated in §2;
  * every §5 item, in particular the "conclusion-is-impossible ⟹ theorem-false" fallacy and the joint-fiber trap;
  * closed-vs-strict side conventions (chord membership counts as both closed sides);
  * no hidden use of `D.Minimal`, of the $(m,4,4)$ regime, or of rows/H8 common provenance;
  * circular use of a statement equivalent to the desired conclusion (in particular, of the leaf's own False-form or of `exists_removableVertex_of_twoLargeCaps`).
* Require agents to return concrete lemmas, constructions, equations, exact certificates, or counterexamples to proposed sublemmas. Reject status reports, vague optimism, and claims that an unproved incidence statement is "routine."
* The root agent should repeatedly synthesize, challenge, redirect, and launch new rounds. Do not stop after the first wave fails. Produce a complete solution only if it survives adversarial audit; otherwise report only the strongest rigorously proved derivation and its exact remaining gap.

## §8 Anti-quit block

Do not return merely because current approaches fail or agents report theorem-strength gaps. Continue launching new rounds, reopening blocked approaches only when there is a genuinely new mechanism, and searching for fresh formulations. Spend at least three full rounds of the approach portfolio (each round including at least one branch-A family, one branch-B model-search family, and one adversarial audit pass) before even thinking of returning.

## §9 Return contract

Return only when the statement of §2 has been completely resolved — branch A proved for all admissible configurations, or branch B certified by one fixed exact configuration satisfying every hypothesis — and the argument survives adversarial audit. Do not return a reduction, partial result, isolated missing lemma, finite computation, numerical guess, "best effort" summary, or an explanation of difficulty. Do not stop, return, or give up until one branch is fully established.

## §10 Web-search restriction

Public search may be used only for ordinary mathematical background or standard named theorems (minimum enclosing circles, convex position, circle incidences, symmetric-difference counting), not to search for a solution to this exact formalization residual or to Erdős Problem 97's open status. Do not search the public web to determine whether this problem is open, and do not answer that it is open.

---

## Appendix A — Lean mapping

### Leaf → declaration

| Leaf | Lean declaration | Location |
|---|---|---|
| Family G, U1 two-shell witness producer | `Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` | `lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2401` (statement), `:2446` (`sorry`) |
| Equivalent False-form | `Problem97.LargeCapPCenteredT2SourceTwoLargeCapsStatement` | `U1LargeCapRouteBTail.lean:2344` |
| Sole consumer (pair → removable vertex, ex falso via kernel) | `exists_removableVertex_of_twoLargeCaps` | `U1LargeCapRouteBTail.lean:2470` |
| Reflection kernel (pair ⟹ `False`) | `U2NonSurplusSqueeze.oppCap2_escape_gen` | `U1LargeCapRouteBTail.lean:2257` |

No `section variable`/`include` blocks apply: the theorem binds all hypotheses explicitly inside namespace `Problem97.U1LargeCapRouteBTailMetricResidualTarget` (opened at `:1570`).

### Math object → Lean structure

| Math object (this document) | Lean name | Location |
|---|---|---|
| $ℝ²$ | scoped notation for `EuclideanSpace ℝ (Fin 2)` | `formal_conjectures/FormalConjecturesForMathlib/Geometry/2d.lean:30` |
| Carrier bundle $(A,$ nonempty, ConvexIndep, $K4$, packet$)$ (H1–H3) | `Problem97.CounterexampleData` (`D`) | `P97/U1TwoShortCapReduction.lean:83` |
| $K4$ predicates (H2, H8, H9) | `Erdos97.HasNEquidistantProperty` / `HasNEquidistantPointsAt` | `formal_conjectures/FormalConjectures/ErdosProblems/97.lean:34–49` |
| Convex independence (H1) | `EuclideanGeometry.ConvexIndep` via `Problem97.ConvexIndep` | `P97/Foundation.lean:28`; upstream `2d.lean:76` |
| MEC (§1) | `Problem97.MinEnclosingCircle`, `Problem97.mec` | `P97/MEC/Basic.lean:66`, `:275` |
| MEC boundary triangle + dichotomy (H4) | `Problem97.MEC.MoserTriangle`, field `case_split` | `P97/Moser/Triangle.lean:59` |
| Non-obtuse wrapper (H4), hypothesis `MT` | `Problem97.MEC.NonObtuseCircumscribedMoserTriangle` | `P97/Moser/TriangleNonObtuse.lean:667` |
| Circumscribed branch selection (H4), hypothesis `hCirc` | left disjunct of `case_split` | same |
| Structural triangle $(v_1,v_2,v_3)$, hypothesis `hM` | `Problem97.MoserTriangle`; `MEC.MoserTriangle.toStructural` | `P97/Cap/Structure.lean:98`; `P97/Cap/PartitionFromMEC.lean:127` |
| Closed cap triple (H5), hypothesis `CP` | `Problem97.CapTriple` (fields incl. `arc_membership`, `nonmoser_in_one`) | `P97/Cap/Structure.lean:161` |
| Signed area, arc-side predicate (§1) | `Problem97.signedArea2`, `Problem97.OnArcOpposite` | `P97/Foundation.lean:49`, `:57` |
| $\mathrm{cap}(i)$ (H6) | `CapTriple.capAt` | `P97/U1TwoShortCapReduction.lean:390` |
| Surplus-cap packet; $(m,4,4)$ predicate (H3, H7) | `Problem97.SurplusCapPacket`; `SurplusCapPacket.IsM44` | `P97/Cap/PartitionFromMEC.lean:332`, `:443` |
| Leaf packet in the conclusion | `U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket` | `U1LargeCapRouteBTail.lean:2211` |
| Surplus cap / apexes of the leaf packet ($\mathrm{cap}(i)$, $a_1$, $a_2$, $s^\*$) | fields `surplusCap`, `oppApex1`, `oppApex2`, `surplusApex` | `PartitionFromMEC.lean:367`; `U1TwoShortCapReduction.lean:297`, `:305`, `:313` |
| Critical shell system (H8), hypothesis `hcritical` | `Problem97.CriticalShellSystem` (fields `shellAt`, `no_qfree`) | `P97/U1CarrierInjection.lean:1015` |
| Exact full 4-shell; named labels (H8, H13) | `Problem97.CriticalFourShell`; `CriticalSelectedFourClass` | `P97/U1CarrierInjection.lean:547`, `:635` |
| Local no-$q$-free packet (H9), hypothesis `hlocalNoQFree` | `Problem97.U3LocalizedNoQFreePacket` | `P97/U3ToU5DangerousTriple.lean:252` |
| Fixed dangerous triple (H10), hypothesis `hfixed` | `Problem97.U3FixedTriplePacket` | `P97/U3ToU5DangerousTriple.lean:32` |
| Live data (H11), hypothesis `H` | `Problem97.U1LargeCapRouteBTailLiveData` (fields `dangerous`, `exactQDeletedRadius`, `selected`) | `U1LargeCapRouteBTail.lean:273` |
| Dangerous triple / selected candidate (H11) | `Problem97.U5DangerousTriple`; `U5SelectedCandidateSkeleton` | `P97/U5GlobalIncidenceBasic.lean:30`, `:65` |
| $q$-deleted skeleton (§1) | `CounterexampleData.skeleton` | `P97/U5ModeADeletion.lean:88` |
| Five source rows (H13), hypothesis `rows` | `Problem97.U1Depth5.CriticalSourceRows`; per-row `CriticalRowPacket` | `P97/U1Depth5Prefix.lean:539`, `:446` |
| Row selection (H14), `rows.rowAt .t2` | `CriticalSourceRows.rowAt`; `CriticalSource` | `P97/U1Depth5Prefix.lean:1502`, `:571` |
| Pairwise-distinct labels (H12), hypothesis `hbase` | `List.Pairwise (· ≠ ·) [p, q, t1, t2, t3, u]` | statement |
| Removable vertex (H8 consequence) | `Problem97.IsRemovableVertex` | `P97/SmallerCounterexample.lean:25` |

### Status note (verified 2026-07-27)

In the committed tree, lines 2371–2623 of `U1LargeCapRouteBTail.lean` — containing this theorem, its consumer chain, and their docstrings — sit inside a single block comment (the 2026-07-25 Route-B tail retirement; see `docs/closure-matrix-2026-07-09.md`, entries of 2026-07-20/25, and `docs/archive/2026-07-25-u1-route-b-tail-retired/`). The statement text transcribed here is exact as it appears at `:2401`–`:2446`; this prompt is issued for the restoration lane that re-activates the leaf.
