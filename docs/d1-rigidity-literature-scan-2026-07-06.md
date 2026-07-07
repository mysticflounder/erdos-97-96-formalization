<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# D1 — Literature scan: realizability of near-critical planar equidistance constraint systems

Dispatch: workstream D1 of `docs/closure-plan-2026-07-06.md` (§7), context §F3 of
`docs/audits/2026-07-06-frontier-missed-angle-analysis.md`. Date: 2026-07-06.

## 1. What was investigated

A scan of five literature areas for known theorems, or adaptable machinery, characterizing
realizability of the following target class.

**Target class.** Labeled points p₁, …, p_k ∈ ℝ², k ∈ {4,5,6}, required pairwise distinct.
Constraints are triples (c; a, b) imposing |p_c − p_a| = |p_c − p_b| — a center equidistant
from two witnesses; equivalently p_c incident to the perpendicular bisector of p_a p_b;
equivalently a linear equation d_ca = d_cb in squared-distance (EDM) coordinates. With R the
number of independent constraints, the defect δ := R − (2k − 4) lies in {−1, 0, 1, 2}
(the similarity group of ℝ² has dimension 4 and preserves all constraints, so 2k − 4 is the
naive critical count). Empirical structure from the project's |A| = 12 census (EMPIRICALLY
VERIFIED in-project, mined dead cores): every infeasible instance dies by forced coincidence
of two points required distinct — never by emptiness of the complex variety of the equality
system — and infeasible instances exist at δ = −1, so the criterion cannot be generic
degree-of-freedom counting.

**Out of scope (project dead ends, not proposed):** SOS/Positivstellensatz certificate
searches, order-type/chirotope enumeration encodings, pure bisector-incidence upper-bound
counting, generic-DOF counting arguments.

## 2. Verification standard

Every citation below was verified to exist via web search during this scan (title + authors +
venue or arXiv id). No lead is cited from memory alone. Leads I remembered but could not
verify are omitted and the omission is stated. Labels:

- PROVEN-in-literature — the cited result is proven and directly supplies a piece of the
  target analysis (possibly as an obstruction/ceiling).
- PARTIAL — proven machinery in an adjacent setting; adaptation gap stated per lead.
- NO-LEAD — verified to exist; examined; does not bear on the target question.
- UNVERIFIED-MEMORY — remembered, not verified. (Zero entries; everything cited was verified.)

One naming note: the dispatch mentions "Dress–Sturmfels style" realizability. No joint
Dress–Sturmfels work on realizability was located. The verified nearest items are
Bokowski–Sturmfels 1989 (lead 22) and Sturmfels 1987 (lead 21). Dress's chirotope work sits
under the project's order-type dead end and was not pursued.

## 3. Annotated leads

### Area 1 — Perpendicular-bisector arrangements and isosceles incidence geometry

**1. B. Lund, A. Sheffer, F. de Zeeuw, "Bisector energy and few distinct distances",
Proc. 31st Symposium on Computational Geometry (SoCG 2015), LIPIcs 34, pp. 537–552;
arXiv:1411.6868. Journal version in Discrete & Computational Geometry.**
Defines bisector energy E(P) = #{(a,b,c,d) ∈ P⁴ : bisector(a,b) = bisector(c,d)} and proves:
if no line or circle contains M(n) points of an n-point set, then
E(P) = O(M(n)^{2/5} n^{12/5+ε} + M(n)n²); applications to distinct distances and distinct
bisectors. The structure content is asymptotic: many bisector coincidences force many points
on a line or circle.
**Label: NO-LEAD.** Asymptotic counting over large n; the target class is k ≤ 6 with exact
constraint patterns. The project has already spent bisector counting (§F3: the 11-label
no-collision table satisfies every incidence/counting constraint). The elementary structural
fact underneath (two distinct pairs sharing a bisector form an isosceles trapezoid or are
reflections) is already implicit in the project's proven kills.

**2. B. Lund, G. Petridis, "Bisectors and pinned distances", Discrete & Computational
Geometry 64(3), pp. 995–1012, 2020; arXiv:1810.00765.**
Lower bound on pinned distances for small sets in 𝔽_q² and an improved bisector-energy upper
bound in ℝ². Same genre as lead 1.
**Label: NO-LEAD.** Same reason as lead 1.

**3. J. Pach, G. Tardos, "Isosceles triangles determined by a planar point set", Graphs and
Combinatorics 18(4), pp. 769–779, 2002.**
An n-point planar set determines O(n^{2.136}) isosceles triangles; feeds distinct-distance
lower bounds. Isosceles triples are exactly single equidistance constraints, so this is the
counting theory of the target class's atomic constraint.
**Label: NO-LEAD.** Counting, not realizability; no per-pattern criterion inside.

**4. P. Melotti, S. Ramassamy, P. Thévenin, "Points and lines configurations for
perpendicular bisectors of convex cyclic polygons", Electronic Journal of Combinatorics
29(1), #P1.59, 2022; arXiv:2003.11006.**
Characterizes exactly which topological configurations (encoded as words) of the n
perpendicular bisectors of the sides of a convex cyclic n-gon are realizable: a word is
realizable iff its signature is interlacing (their Theorem 1.1). Also exact/asymptotic counts
of realizable configurations.
**Label: PARTIAL.** This is the one verified instance of a *combinatorial* realizability
characterization for a class of bisector configurations — evidence that such
characterizations exist for structured subclasses. Class mismatch is real: their points are
constrained to a circle, the bisectors are the n side-bisectors (not an arbitrary
equidistance incidence pattern), and the realized data is the arrangement topology, not
incidence of centers with bisectors. Applicability: read for proof technique (their
realizability direction is constructive/deformation-based); do not expect direct transfer.

### Area 2 — Rigidity frameworks with non-bar constraints; CAD constraint systems

**5. B. Schulze, H. Serocold, L. Theran, "Frameworks with coordinated edge motions",
SIAM Journal on Discrete Mathematics, DOI 10.1137/20M1377539; arXiv:1807.05376.**
Rigidity theory for bar-joint frameworks in ℝ^d where specified classes of edges may change
length in coordination (length *differences* preserved within each class). Coordinated
rigidity is a generic property; rigid graphs are characterized via redundant rigidity in the
standard d-dimensional rigidity matroid; Laman/Henneberg-type characterizations for one and
two coordination classes in the plane; polynomial-time algorithm for any fixed number of
classes in ℝ².
**Label: PARTIAL — the closest verified generic theory to equidistance constraints.**
Translation (elementary, to be checked when used): an equidistance system on k points is the
bar-joint framework on the star edges {c,a} (over all constraints (c;a,b)) whose edges are
partitioned into coordination classes, one class per center-circle; within-class equality of
lengths is preserved by exactly the coordinated motions that fix within-class differences at
zero. Their count matroid is then the correct *generic* baseline for independence of
equidistance constraints — the right replacement for naive 2k − 4 counting. Two gaps: (i)
they characterize rigidity/flexibility and generic independence, not existence of
realizations with distinctness; (ii) the target class is structurally non-generic (centers
shared between classes; δ = −1 infeasible instances prove the generic count lies here).
Direct use: their sparsity/redundancy counts are computable candidate invariants for D2.

**6. B. Jackson, J. C. Owen, "A characterisation of the generic rigidity of 2-dimensional
point-line frameworks", Journal of Combinatorial Theory, Series B, 2016; arXiv:1407.4675.**
Frameworks of points and lines in ℝ² with point-point distance, point-line distance, and
line-line angle constraints; complete combinatorial characterization of generic rigidity,
with a polynomial algorithm.
**Label: PARTIAL.** A bisector can be modeled as a line object ℓ_{ab} bound to its defining
pair by two constraints (reflection exchange of a,b across ℓ), after which each equidistance
constraint is one point-line incidence (distance-0) — so the target class embeds into
point-line frameworks. Gap: the embedding is intrinsically non-generic (each line's position
is *determined* by two points; incidences are distance-0, not generic distances), so the
Jackson–Owen characterization does not directly decide the class. Use: vocabulary + the count
matroid on the derived point-line structure as a D2 invariant candidate.

**7. B. Servatius, W. Whiteley, "Constraining plane configurations in computer-aided design:
combinatorics of directions and lengths", SIAM Journal on Discrete Mathematics 12(1),
pp. 136–153, 1999.**
Complete generic (Laman-type) characterization for mixed direction and length constraints in
the plane via a matroid on a doubled edge set.
**Label: PARTIAL (template).** Proof that Laman-type theorems exist for mixed,
non-congruence-invariant constraint types (direction constraints are similarity-invariant,
like equidistance). No equidistance constraints; generic only. Value: the standard template
for building a count matroid under the similarity group (dimension 4 → counts of the form
2k − 4 appear there in mixed form).

**8. F. Saliola, W. Whiteley, "Constraining plane configurations in CAD: circles, lines, and
angles in the plane", SIAM Journal on Discrete Mathematics 18(2), pp. 246–271, 2004.**
Rigidity theory of angle constraints between "m-circles" (lines and circles) under the
inversive group; the full constraint set on v distinct m-circles yields a Jacobian of rank
3v − 6; develops the analogue of the rigidity matrix in that geometry.
**Label: PARTIAL (weak).** Demonstrates the rigidity-matrix method under a larger invariance
group. Equidistance systems are similarity-invariant (not inversive: "center of a circle" is
not Möbius-invariant), so the group and objects both differ. Value is methodological only.

**9. A. Nixon, J. C. Owen, S. C. Power, "Rigidity of frameworks supported on surfaces",
SIAM Journal on Discrete Mathematics 26(4), pp. 1733–1757, 2012.**
Laman-type characterizations for generic bar-joint frameworks constrained to spheres,
cylinders, planes in ℝ³ (counts 2|V| − ℓ with ℓ the dimension of the surface's isometry
group).
**Label: NO-LEAD.** Verified because the dispatch names these authors; the setting (surfaces
in ℝ³) does not bear on planar equidistance systems. The "modified count = group dimension"
template it exemplifies is already covered by leads 5, 7.

**10. A. Nixon, S. C. Power, "Double-distance frameworks and mixed sparsity graphs",
Discrete & Computational Geometry, 2019; arXiv:1709.06349.**
Combinatorial (mixed sparsity) characterizations of rigidity for frameworks carrying two
types of distance constraints simultaneously (e.g. Euclidean + geodesic on a surface;
Euclidean + non-Euclidean in the plane).
**Label: PARTIAL (weak).** Another verified instance of "two constraint types → mixed
sparsity count matroid," generic only. Template value for a future equidistance count
matroid; nothing to apply as-is.

**11. K. Haller, A. Lee-St.John, M. Sitharam, I. Streinu, N. White, "Body-and-cad geometric
constraint systems", Computational Geometry: Theory and Applications 45(8), pp. 385–405,
2012; arXiv:1006.1126.**
Infinitesimal rigidity theory for 3D bodies under 21 coincidence/angular/distance CAD
constraints; identifies a *nested sparsity* counting condition that is necessary but provably
NOT sufficient for minimal rigidity — the angular part breaks pure counting.
**Label: PARTIAL.** Independently documents the phenomenon the census found: for
CAD-type constraint classes, combinatorial counts are necessary-side only, and the
obstruction is constraint-type-specific algebra. Useful as the developed formalism closest in
spirit to "counting fails, find the algebraic residue"; planar specialization and
equidistance constraints would need to be built.

**12. J. Farre, A. Lee-St.John, J. Sidman, L. Theran, "Special positions of body-and-cad
frameworks", arXiv:1306.1572, 2013; journal version "Algorithms for detecting dependencies
and rigid subsystems for CAD", Computer Aided Geometric Design, 2016.**
Studies body-and-cad systems in *special (non-generic) positions*: algorithms detecting when
a nominally independent constraint set becomes dependent at a given placement, and extraction
of rigid subsystems, via linear-algebraic analysis of the rigidity matrix at the placement.
**Label: PARTIAL.** Directly aimed at the gap that defines the target class (generic count
vs actual rank at structured placements). The derived-bisector dependencies of the target
class (bisector determined by its defining pair; centers shared among circles) are "special
positions by construction". Adaptation needed: their framework is 3D body-and-cad; the
analysis mode (rank at the actual placement + certificate of dependency) transfers in spirit
to the plane.

**13. D. Michelucci, S. Foufou, "Geometric constraint solving: the witness configuration
method", Computer-Aided Design 38 (2006).**
Replaces graph-based (structural/generic) DOF analysis by rank computation of the constraint
Jacobian at a *witness* configuration — a solution of a variant system — thereby detecting
non-structural dependencies caused by geometric theorems, which no counting method sees.
**Label: PARTIAL.** Exactly the right diagnostic direction for δ = −1 kills: a dependency
exists at every relevant placement but not generically. Gap: the witness method assumes a
witness is available and typicality arguments are heuristic; for infeasible-with-distinctness
patterns the witness lies on the coincidence locus, and what the rank there certifies must be
worked out. Cheap to trial on mined cores.

**14. M. Sitharam, A. St. John, J. Sidman (eds.), "Handbook of Geometric Constraint Systems
Principles", CRC Press (Discrete Mathematics and Its Applications), 2019.**
Survey handbook covering combinatorial rigidity, geometric constraint decomposition,
body-and-cad, witness methods, and realizability questions in one place.
**Label: PARTIAL (survey umbrella).** The systematic place to check for an equidistance-type
constraint chapter before building anything new; use as citation-mining source for the
shortlist items rather than as a result.

**15. Z. Fekete, T. Jordán, V. E. Kaszanitzky, "Rigid two-dimensional frameworks with two
coincident points", Graphs and Combinatorics 31(3), pp. 585–599, 2015.**
Characterizes the graphs admitting an infinitesimally rigid realization in ℝ² with two
prescribed vertices coincident: G has a rigid {u,v}-coincident realization iff G − uv and
G/uv are both rigid. Deletion–contraction, fully combinatorial, non-generic stratum.
**Label: PARTIAL (strong).** This is proven rigidity theory *on the coincidence stratum* —
the stratum where all census kills land. Two adaptation gaps: (i) constraints are bar
lengths, not equidistances; (ii) quantifier direction — they characterize *existence* of a
good coincident realization, the target needs "every realization is coincident". But the
deletion/contraction move (identify the pair, recount) is precisely a computable invariant
family for D2: for each dead core and each pair {i,j}, the rank data of the contracted
system.

**16. H. Guler, B. Jackson, "Coincident Rigidity of 2-Dimensional Frameworks",
arXiv:2106.06767, 2021.**
Extends lead 15: characterization conjecture for an arbitrary coincident set T, proven for
|T| = 3.
**Label: PARTIAL (strong).** Same applicability as lead 15, for triple coincidences (which
occur in the census kill modes). Together, 15–16 are the verified core of "non-generic
rigidity at coincidences" in the plane.

### Area 3 — EDM completion, Cayley–Menger, equality patterns

**17. A. Y. Alfakih, "Euclidean Distance Matrices and Their Applications in Rigidity
Theory", Springer, 2018.**
Book-level treatment of the EDM ↔ projected Gram correspondence: D is an EDM of embedding
dimension ≤ r iff the projected Gram matrix is PSD of rank ≤ r; Cayley–Menger conditions;
facial structure of the EDM cone; SDP machinery; rigidity applications.
**Label: PROVEN-in-literature (for the reformulation, not the criterion).** Gives an exact
proven reformulation of the target class: with x = (d_ij) ∈ ℝ^{k(k−1)/2}, realizability with
distinctness ⇔ ∃x: x ∈ EDM_k with embedding dimension ≤ 2 (Cayley–Menger rank/sign
conditions), A·x = 0 (one linear equation d_ca − d_cb = 0 per constraint — the equidistance
pattern is a *linear section*), and x_ij > 0 for all i < j. Forced coincidence = the section
meets the embdim ≤ 2 stratum only where some coordinate x_ij = 0. The facial structure
machinery (faces of the cone ↔ configurations with prescribed coincidence/affine-dependence
patterns) is the natural language for the boundary. What is missing from the literature: any
characterization of *which linear equality patterns* force the section onto coordinate faces
— see the null result, lead 20.

**18. M. Bakonyi, C. R. Johnson, "The Euclidean distance matrix completion problem",
SIAM Journal on Matrix Analysis and Applications 16, pp. 646–654, 1995.**
Any partial EDM whose specified-entry graph is chordal is completable to a full EDM; for
every non-chordal G there is a non-completable partial EDM on G. (No embedding-dimension
bound; no equality constraints between unspecified entries.)
**Label: PARTIAL (weak).** The completion viewpoint (which entries are pinned by the
constraint pattern) may organize small cases, but both target-class features — equality
constraints among *unknown* entries and the hard cap embdim ≤ 2 — are outside the theorem.

**19. J. B. Saxe, "Embeddability of weighted graphs in k-space is strongly NP-hard",
Proc. 17th Allerton Conference on Communication, Control and Computing, pp. 480–489, 1979.**
Deciding realizability of prescribed edge lengths in fixed dimension (including d = 1, 2) is
strongly NP-hard.
**Label: PROVEN-in-literature (complexity ceiling).** Fixed-dimension distance realizability
has no efficient general criterion; any target-class criterion must exploit k ≤ 6 and the
special equidistance structure. Consistent with the project's per-instance certificate
approach; rules out expecting a general-purpose EDM feasibility theorem to do the work.

**20. Null result (explicit).** No literature was found on EDM completion (or Gram/PSD
completion) with *equality constraints among unspecified entries* at bounded embedding
dimension — searched via combinations of "distance matrix completion", "equality
constraints", "repeated entries", "rank two". The specific area-3 question appears
unstudied. Status: OPEN. (Adjacent machinery: leads 17–19; general low-rank PSD completion
literature is about which entries are specified, not about equalities among unknowns.)

### Area 4 — Incidence realizability, universality, decidability boundary

**21. B. Sturmfels, "On the decidability of Diophantine problems in combinatorial geometry",
Bulletin of the American Mathematical Society 17(1), pp. 121–124, 1987.**
An algorithm deciding realizability of (oriented) matroids over ℚ exists iff an algorithm
deciding solvability of arbitrary Diophantine equations over ℚ exists.
**Label: PROVEN-in-literature (obstruction shape).** For general incidence data,
combinatorial realizability has no known decision procedure over ℚ; over ℝ it is decidable
(real quantifier elimination) but not by combinatorial data. Any claimed "combinatorial
criterion" for a rich incidence class needs a reason the class is special — near-criticality
and k ≤ 6 are that reason for the target class, and D2's separation test is exactly the
empirical check of specialness.

**22. J. Bokowski, B. Sturmfels, "Computational Synthetic Geometry", Lecture Notes in
Mathematics 1355, Springer, 1989.**
Methods for deciding realizability of small incidence structures/oriented matroids;
introduces systematic *final polynomials* — bracket-algebra identities certifying
non-realizability of an incidence structure — and solvability sequences for realizability.
**Label: PARTIAL.** Final polynomials are the projective-incidence ancestor of the project's
algebraic kill certificates: a syntactic object whose existence proves emptiness, findable by
search, checkable exactly. Caveat flagged: this book's ambient formalism is
chirotope/oriented-matroid based, adjacent to the project's order-type dead end — the usable
idea is the certificate format (polynomial identity from the constraint ideal + distinctness
denominators), not the chirotope stratification.

**23. N. E. Mnëv, "The universality theorems on the classification problem of configuration
varieties and convex polytopes varieties", in: Topology and Geometry — Rohlin Seminar,
Lecture Notes in Mathematics 1346, Springer, 1988.**
Realization spaces of point configurations with fixed combinatorics can be stably equivalent
to arbitrary primary semialgebraic sets.
**Label: PROVEN-in-literature (obstruction shape).** Same consequence as lead 21, at the
level of realization-space topology: no simple normal form for realization spaces of general
incidence patterns. Bounds ambitions for a uniform-|A| lemma: the lemma must be about the
specific near-critical bisector patterns, not incidence patterns at large.

**24. M. Schaefer, "Realizability of Graphs and Linkages", in: J. Pach (ed.), Thirty Essays
on Geometric Graph Theory, Springer, 2013.**
Deciding realizability of a graph with prescribed edge lengths in ℝ² is ∃ℝ-complete, and
remains ∃ℝ-complete with all lengths equal (unit-distance realizability); same for linkages.
**Label: PROVEN-in-literature (complexity ceiling).** Sharpens lead 19 to the modern ∃ℝ
classification and to the unit-length (single equidistance class) case — notable because a
*global* "all edges equal" constraint is already ∃ℝ-hard, i.e. even the pure equality
pattern, unbounded k, admits no combinatorial criterion. The target class escapes only via
bounded k and bounded defect. Any uniform |A| ≥ 12 lemma must therefore have its combinatorial
content confined to the k ≤ 6 core patterns (as the census mining already arranged).

### Area 5 — Forced coincidence, nondegeneracy, degenerate-only solution sets

**25. Wu Wen-tsün, "Basic principles of mechanical theorem proving in elementary
geometries", Journal of Automated Reasoning 2, pp. 221–252, 1986 (original: J. Sys. Sci.
Math. Sci. 4(3), 1984).**
The characteristic-set method: decides whether a polynomial geometry statement holds on the
nondegenerate components of a hypothesis variety, generating the nondegeneracy conditions
(products of inequations) mechanically. Works over algebraically closed fields.
**Label: PROVEN-in-literature (machinery).** The forced-coincidence phenomenon is precisely
"the hypothesis variety has all its coincidence-free components empty". Wu's method (or its
Gröbner/saturation equivalent: saturate the equality ideal by the coincidence polynomials,
test triviality) *decides this per instance over ℂ* — a complete, certificate-producing
decision procedure for the ℂ-version of the target question, with no SOS content.

**26. S.-C. Chou, "Mechanical Geometry Theorem Proving", D. Reidel Publishing, 1988.**
Systematic development of Wu's method with the handling of degenerate/reducible components
(Ritt–Wu decomposition into irreducible ascending chains), demonstrated on 512 theorems;
companion algorithm literature: Chou–Gao, "Ritt–Wu's decomposition algorithm and geometry
theorem proving" (CADE-10, Springer LNCS, 1990 — verified).
**Label: PROVEN-in-literature (machinery).** The decomposition into components with explicit
degeneracy classification is the proven tool for asking, per dead core: *which* coincidence
locus contains each component, i.e. the "reason" each core dies. This is the structured
version of what the census recorded empirically.

**27. T. Recio, M. P. Vélez, "Automatic Discovery of Theorems in Elementary Geometry",
Journal of Automated Reasoning 23, pp. 63–82, 1999.**
Given a statement false in general, computes complementary hypotheses (equalities/
nondegeneracy conditions) making it true, via elimination ideals.
**Label: PARTIAL.** Dual use for D3: run discovery on "the pattern is realizable with all
points distinct" over the pattern's combinatorial parameters to *discover* the missing
combinatorial hypothesis — i.e. machine-generate candidate criteria from the mined cores,
rather than guessing invariants.

**28. C. W. Wampler, A. J. Sommese, "Numerical algebraic geometry and algebraic
kinematics", Acta Numerica 20, 2011 (survey of the Sommese–Wampler witness-set framework;
book: Sommese–Wampler, World Scientific, 2005).**
Numerical irreducible decomposition: computes all irreducible components of a polynomial
system's variety with witness points, used in kinematics to find degenerate/defective
mechanism components.
**Label: PARTIAL.** Exploratory-mode counterpart of leads 25–26: per dead core, numerically
decompose the equality variety and classify components by which coincidence locus contains
them; fast triage before exact saturation. Numerical output is EMPIRICAL only; exact
certificates must follow via the Gröbner route the project already runs.

**29. T. R. Chase, J. A. Mirth, "Circuits and Branches of Single-Degree-of-Freedom Planar
Linkages", ASME Journal of Mechanical Design 115(2), pp. 223–230, 1993.**
Taxonomy of solution-set connectivity defects (circuit/branch defects) in linkage synthesis.
**Label: NO-LEAD.** Verified because kinematic "defect" literature was in the dispatch's
area 5; it concerns disconnected solution branches of *feasible* mechanisms, not
degenerate-only solution sets. Nothing to transfer.

## 4. Cross-cutting assessment

1. **No off-the-shelf criterion exists.** After searching all five areas, there is no
   verified theorem characterizing realizability-with-distinctness of near-critical planar
   equidistance patterns, nor of any equivalent formulation (bisector-incidence,
   equality-pattern EDM sections, coordinated equal-length classes). The specific question is
   OPEN in the literature. Universality/∃ℝ results (leads 21, 23, 24) explain why no general
   theorem should be expected; they do not obstruct a criterion for the bounded class
   (k ≤ 6, δ ∈ {−1,…,2}).

2. **The two adaptable machinery clusters are complementary.**
   - *Non-generic rigidity cluster* (leads 5, 6, 12, 13, 15, 16): supplies computable
     combinatorial/linear-algebraic invariants designed exactly for "generic count is wrong at
     structured placements" — coordinated-class sparsity, point-line counts on the derived
     structure, coincident deletion–contraction ranks, witness ranks. These are D2 inputs, and
     any purely combinatorial criterion, if one exists, will likely be expressible in this
     vocabulary.
   - *Algebraic nondegeneracy cluster* (leads 25, 26, 27, 28): supplies a complete
     per-instance decision procedure for the ℂ-version (saturation by coincidence
     polynomials) and discovery tooling for the missing hypotheses. This cluster cannot be
     separated from computation, but the class is finite, and the project's certificate
     pipeline already speaks this language (Rabinowitsch separators).

3. **A decisive cheap dichotomy sits between the clusters** (assessment; the check is
   specified below). "All kills are forced-coincidence, never ℂ-emptiness" (census) is a
   statement about the equality system *without* distinctness. It does not settle whether
   distinctness already fails over ℂ. Two regimes:
   - If every dead core is dead over ℂ (saturated ideal = (1)): the criterion is a statement
     of complex algebraic geometry — radical membership — with kernel-checkable Nullstellensatz-
     style certificates and a realistic route to a uniform pattern-level lemma (ideal-theoretic,
     no real-closed-field content).
   - If some core is ℂ-alive but ℝ-dead with distinctness: the criterion has irreducibly real
     content, and (with SOS out of scope) the practical route stays per-instance real-root
     classification, i.e. census-shaped.
   The existing kill artifacts may already contain the answer: a kill produced as "reduced
   Gröbner basis = {1} with Rabinowitsch distinctness variables" is a ℂ-kill; a kill produced
   as "real solution count 0 / msolve real-root stage" is only an ℝ-kill as recorded.
   **FLAG FOR IMPLEMENTER:** inspect the mined kill artifacts for the |A| = 12 census dead
   cores and classify each kill as (GB = {1} over ℚ with Rabinowitsch vars) vs (real-stage
   only). For any core in the second bucket, rerun the saturation as a pure ideal-triviality
   check (msolve/Gröbner over ℚ, equality ideal + per-pair Rabinowitsch, ask ideal = (1)).
   Expected inputs: the dead-core JSONL from `scratch/u12-census-port/` (per closure plan
   §7 D2). Output: per-core bit ℂ-dead/ℂ-alive. This single bit routes D3 between two very
   different lemma shapes.

4. **Quantifier caution for the rigidity cluster.** Leads 15–16 characterize existence of
   rigid coincident realizations; the target property is "every realization (of the equality
   system) is coincident". These are different questions on the same stratification. The
   invariants transfer; the theorems do not. Any D3 lemma built from deletion–contraction
   counts must be proved from scratch for the equidistance matroid — nothing in the scan
   supplies it.

5. **Similarity normalization is exact, not heuristic.** All constraints are invariant under
   the 4-dimensional similarity group, and in EDM coordinates the constraint set is a linear
   section of the embdim ≤ 2 stratum, with scaling acting as x ↦ λx (so the section
   projectivizes). The 2k − 4 count and the EDM linear-section picture (lead 17) are two
   exact presentations of the same normalization; the second is the one with proven
   literature machinery attached (Cayley–Menger conditions, facial structure).

## 5. Ranked shortlist (≤ 5) with next verification step

1. **ℂ-vs-ℝ kill dichotomy via saturation (Wu–Chou machinery; leads 25–26).
   PROVEN-in-literature machinery.** Next step: the artifact inspection specified in §4.3 —
   classify every mined dead core as ℂ-dead vs ℂ-alive-but-ℝ-dead. One data pass plus at most
   one Gröbner run per unresolved core; decides the *shape* of any uniform lemma before any
   proof attempt.

2. **Coordinated edge motions (Schulze–Serocold–Theran; lead 5). PARTIAL.** Next step: write
   the exact translation equidistance-system → coordinated-class framework (star edges, one
   class per center-circle) and compute their sparsity/redundant-rigidity counts on the mined
   dead cores vs the ALIVE controls — a direct D2 invariant with a proven generic theorem
   behind it. If it separates, D3 has a natural lemma statement (non-generic strengthening of
   their count on the target class).

3. **Coincident deletion–contraction invariants (Fekete–Jordán–Kaszanitzky, Guler–Jackson;
   leads 15–16). PARTIAL.** Next step: for each dead core and each point pair {i,j} (and
   triple, per lead 16), compute the rank/count data of the pair-contracted equidistance
   system; test whether some function of these (e.g. "exists a pair whose contraction is
   over-critical") separates dead from alive cores in the census — the most targeted
   combinatorial-invariant family the literature suggests, since it probes exactly the
   coincidence strata where all kills land.

4. **Witness/special-position dependency detection (Michelucci–Foufou; Farre et al.;
   leads 12–13). PARTIAL.** Next step: for the δ = −1 dead cores, compute the constraint
   Jacobian rank at (a) a random point of the equality variety and (b) points of the
   coincidence strata, and check whether the δ = −1 infeasibility is visible as a rank defect
   at every witness — if yes, a rank-at-witness invariant is a candidate criterion component
   and the special-position formalism gives the vocabulary for stating it.

5. **EDM linear-section reformulation (Alfakih; lead 17). PROVEN-in-literature
   (reformulation only).** Next step: restate the target lemma once in EDM coordinates
   (linear section of the embdim ≤ 2 Cayley–Menger stratum, positivity off the coordinate
   hyperplanes) and check on a sample of dead cores which Cayley–Menger sign/rank conditions
   force the coordinate-face contact — this is the cleanest exact language in which a uniform
   |A| ≥ 12 statement could be posed, and the null result (lead 20) means posing it there is
   new but unobstructed.

Honorable mention, not shortlisted: Melotti–Ramassamy–Thévenin (lead 4) — the one verified
combinatorial realizability characterization of a bisector-configuration class; read for
technique if D3 reaches lemma-formulation stage; its class does not contain the target class.

## 6. Label counts

- PROVEN-in-literature: 7 (leads 17, 19, 21, 23, 24, 25, 26)
- PARTIAL: 16 (leads 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15, 16, 18, 22, 27, 28)
- NO-LEAD: 5 (leads 1, 2, 3, 9, 29)
- UNVERIFIED-MEMORY: 0 (one remembered item — a refined bisector-energy bound in Annals of
  Combinatorics — was located by title/venue but its author list was not verified in this
  scan; it is redundant with leads 1–2 and was omitted rather than cited incompletely)
- Explicit null results: EDM completion with equality patterns among unspecified entries
  (lead 20, OPEN); no joint "Dress–Sturmfels" realizability work found (§2).

## Sources

- https://arxiv.org/abs/1411.6868 ; https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.SOCG.2015.537
- https://arxiv.org/abs/1810.00765 ; https://link.springer.com/article/10.1007/s00454-019-00122-w
- https://link.springer.com/article/10.1007/s003730200063 (Pach–Tardos)
- https://arxiv.org/abs/2003.11006 ; https://www.combinatorics.org/ojs/index.php/eljc/article/view/v29i1p59
- https://arxiv.org/abs/1807.05376 ; https://epubs.siam.org/doi/doi/10.1137/20M1377539
- https://arxiv.org/abs/1407.4675 ; https://www.sciencedirect.com/science/article/pii/S0095895615001537
- https://epubs.siam.org/doi/10.1137/S0895480196307342 (Servatius–Whiteley)
- https://epubs.siam.org/doi/10.1137/S0895480100374138 (Saliola–Whiteley)
- https://epubs.siam.org/doi/10.1137/110848852 (Nixon–Owen–Power)
- https://arxiv.org/abs/1709.06349 ; https://link.springer.com/article/10.1007/s00454-019-00164-0
- https://arxiv.org/abs/1006.1126 ; https://www.sciencedirect.com/science/article/pii/S0925772112000235
- https://arxiv.org/abs/1306.1572 ; https://www.sciencedirect.com/science/article/abs/pii/S0167839616300814
- https://www.sciencedirect.com/science/article/abs/pii/S001044850600025X (Michelucci–Foufou)
- https://www.routledge.com/Handbook-of-Geometric-Constraint-Systems-Principles/Sitharam-StJohn-Sidman/p/book/9781032918303
- https://link.springer.com/article/10.1007/s00373-018-1983-8 (cylindrical analogue; FJK planar version: Graphs Combin. 31(3):585–599)
- https://arxiv.org/abs/2106.06767 (Guler–Jackson)
- https://link.springer.com/book/10.1007/978-3-319-97846-8 (Alfakih)
- https://epubs.siam.org/doi/10.1137/S0895479893249757 (Bakonyi–Johnson)
- https://arxiv.org/pdf/2602.00001 (Saxe theorems context; Saxe 1979 Allerton)
- https://projecteuclid.org/journals/bulletin-of-the-american-mathematical-society-new-series/volume-17/issue-1/On-the-decidability-of-Diophantine-problems-in-combinatorial-geometry/bams/1183553968.full
- https://www.amazon.com/Computational-Synthetic-Geometry-Lecture-Mathematics/dp/3540504788 (Bokowski–Sturmfels LNM 1355)
- https://en.wikipedia.org/wiki/Mn%C3%ABv%27s_universality_theorem
- https://ovid.cs.depaul.edu/documents/realizability.pdf ; https://link.springer.com/chapter/10.1007/978-1-4614-0110-0_24 (Schaefer)
- https://link.springer.com/article/10.1007/BF02328447 (Wu 1986)
- https://link.springer.com/chapter/10.1007/3-540-52885-7_89 (Chou–Gao 1990; Chou 1988 book via Reidel)
- https://link.springer.com/article/10.1023/A:1006135322108 (Recio–Vélez)
- https://www.cambridge.org/core/journals/acta-numerica/article/abs/numerical-algebraic-geometry-and-algebraic-kinematics/8A211CF0EA2F7B33CF4343229F0F1EC4
- https://asmedigitalcollection.asme.org/mechanicaldesign/article-abstract/115/2/223/417510/ (Chase–Mirth)
