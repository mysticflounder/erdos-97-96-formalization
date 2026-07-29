# FR Lemma 1, pattern P2 — proof draft (2026-07-28)

Companion to `fr-pattern-lemma1.md` (setting, transcription, P1 proof).
Task: prove the P2 forbidden-pattern case (both mirror variants, subset
semantics, general common distance δ > 0). Author: math-prover agent.
Status: main theorem PROVEN (pen-and-paper, self-contained below);
AWAITING ADVERSARIAL AUDIT. One transcription-level finding: the claim
is TRUE under exactly one of the two possible row/column orientation
conventions and FALSE (explicit exact counterexample) under the other,
so the orientation convention is load-bearing and is pinned below.

---

## 1. What was investigated

P2 (5 cells, two mirror variants), from Fig. 4 of Fishburn–Reeds 1992,
transcribed in `fr-pattern-lemma1.md`:

- rows r₁ < r₂ < r₃, columns c₁ < c₂ < c₃ (as a submatrix of the cut
  matrix);
- variant A cells: {(r₁,c₁), (r₁,c₂), (r₂,c₃), (r₃,c₁), (r₃,c₃)};
- variant B cells: {(r₁,c₁), (r₁,c₃), (r₂,c₁), (r₃,c₂), (r₃,c₃)}.

Claim to prove (subset semantics): there is no strictly convex polygon
with cut {A, B}, rows r₁ < r₂ < r₃ in A-order and columns c₁ < c₂ < c₃
in B-order, such that all five listed cells are simultaneously equal to
one common distance δ > 0. Blank cells are unconstrained.

## 2. Definitions and notation (self-contained)

**Strictly convex position.** Finite points in the plane, pairwise
distinct, no three collinear, each a vertex (extreme point) of their
convex hull. Equivalently (standard characterization, used throughout):
points q₁, …, q_n (n ≥ 3) listed in a cyclic order are the vertices of
a strictly convex polygon in that boundary order iff for every
cyclically consecutive pair (q_i, q_{i+1}) the remaining n − 2 points
lie strictly on one side of the line q_i q_{i+1}. We write K for the
hull; then K is the intersection of the n edge half-planes, ∂K is the
closed polyline q₁q₂…q_nq₁, and every q_i is extreme. "Cyclic order"
unqualified means the undirected cyclic order.

**Cut.** {A, B}: complementary contiguous arcs of the cyclic vertex
order of a strictly convex polygon, α = |A|, β = |B|. Rows of the cut
matrix = A in convex (arc) order a₁, …, a_α; columns = B in convex
order b₁, …, b_β.

**The two orientation conventions.** Fix the traversal direction of the
full cycle that lists A in increasing row order a₁, a₂, …, a_α. Along
that same traversal the arc B is met in one of two index orders:

- **Convention C1 (aligned):** full cycle = (a₁, …, a_α, b₁, …, b_β) —
  both index orders run with the traversal.
- **Convention C2 (opposed):** full cycle = (a₁, …, a_α, b_β, …, b₁) —
  the column index order runs against the traversal. In the planar
  picture this is the natural "book" layout: rows top-to-bottom down
  one side, columns top-to-bottom down the other side.

Reversing the traversal direction reverses BOTH index orders at once,
so it maps each convention to itself; C1 and C2 are genuinely different
readings of "rows = A in convex order, columns = B in convex order",
and the pattern cell sets are not invariant under reversing one axis
alone. This is exactly the "mirror variants" bookkeeping flagged in the
task.

**Adopted convention: C2.** Justification in §6: under C2 both variants
are forbidden (Theorem 1); under C1 variant A is realizable by an exact
strictly convex hexagon (Proposition 2). Hence, given the
HIGH-confidence transcription, if FR's Lemma 1 is correct their cut
matrix is read in convention C2, and all later patterns (P3, P4) must
be interpreted in C2 as well.

**Six-point labels.** Throughout, x, y, z denote the vertices in rows
r₁, r₂, r₃ and u, v, w the vertices in columns c₁, c₂, c₃. Variant A's
five constrained pairs are then

  xu, xv, yw, zu, zw   (all = δ),

and variant B's are xu, xw, yu, zv, zw. ∠pqr denotes the unsigned
angle at q between rays q→p and q→r, valued in [0, π]. C(p, r) is the
circle of radius r centered p. cross(p, q) = p_x q_y − p_y q_x.

## 3. Reduction to a hexagon statement

**Lemma R (reduction).** Under convention C2, variant A is forbidden in
every strictly convex polygon and every cut iff:

> **(H)** There do not exist six distinct points x, y, z, w, v, u in
> strictly convex position whose (undirected) hull cyclic order is
> (x, y, z, w, v, u), with |xu| = |xv| = |yw| = |zu| = |zw| = δ for
> some δ > 0.

*Proof.* (⇐) Suppose a strictly convex polygon P with cut {A, B} has a
variant-A occurrence at rows x, y, z ∈ A and columns u, v, w ∈ B. The
six points are distinct (rows are distinct, columns are distinct,
A ∩ B = ∅). A subset of points in strictly convex position is in
strictly convex position (extremality: p ∉ conv(S∖{p}) implies
p ∉ conv(S′∖{p}) for S′ ⊆ S; no-3-collinear inherits), and its hull
cyclic order is the restriction of the full cyclic order. Restriction
of the full order: the six points appear as the contiguous triple
x, y, z (in A-order, since A is a contiguous arc containing them)
followed by the contiguous triple from B; under C2 the traversal that
lists rows increasingly lists columns decreasingly, so the restricted
cycle reads (x, y, z, w, v, u). [That the restricted cyclic order is
the sub-hull's boundary order follows from the chord lemma L2 below
applied to the big polygon: for consecutive-in-the-subset vertices
p, q, all other subset points lie on one arc of P between them, hence
strictly on one side of line(p, q), which is the supporting-edge
characterization for the subset.] All five distances equal δ by the
occurrence. This is exactly a configuration forbidden by (H).

(⇒) A configuration as in (H) is itself a strictly convex hexagon;
take A = {x, y, z}, B = {u, v, w} (complementary contiguous arcs),
rows r₁, r₂, r₃ = x, y, z, columns c₁, c₂, c₃ = u, v, w, reading the
cycle per C2; the five unit cells form variant A with r_i = i,
c_j = j. ∎

Variant B reduces to the same statement (H) — see §5.

**Scaling.** (H) for one δ > 0 is equivalent to (H) for δ = 1 (apply
the similarity p ↦ p/δ; distances scale by 1/δ, convex position and
cyclic order are preserved). So the proof below fixes δ = 1, and the
result holds for every common distance δ > 0. PROVEN (trivial).

## 4. Toolkit lemmas

All are standard convex-geometry facts; compact proofs are included so
the draft is self-contained and auditable.

**Lemma L1 (edge support).** For a strictly convex polygon with cyclic
order q₁, …, q_n: for each consecutive pair (q_i, q_{i+1}), the other
n − 2 vertices lie strictly on one side of line(q_i, q_{i+1}).

*Proof.* This is the defining characterization quoted in §2
(strictness from no-3-collinear). ∎

**Lemma L2 (chord separation).** Let p, q be two non-adjacent vertices
of a strictly convex polygon, ℓ = line(p, q). Then (i) no other vertex
lies on ℓ; (ii) ℓ ∩ K = [p, q] and the open segment (p, q) ⊆ int K;
(iii) the vertices of the two open boundary arcs between p and q lie
strictly on opposite open sides of ℓ (each arc entirely within one
side).

*Proof.* (i) no-3-collinear. (ii) ℓ ∩ K is a segment containing
[p, q]. If it contained a point k beyond p (p strictly between k and
q), then p ∈ (k, q) ⊆ K would not be extreme — contradiction; so
ℓ ∩ K = [p, q]. If some c ∈ (p, q) were a boundary point, c would lie
on some edge E of ∂K; the edge line L_E supports K, and writing f for
an affine functional vanishing on L_E and ≥ 0 on K: f(c) = 0 with
c ∈ (p, q), f(p), f(q) ≥ 0 forces f(p) = f(q) = 0, so p, q ∈ L_E,
i.e., L_E = ℓ; then E ⊆ ℓ and E's two endpoint vertices lie on ℓ, so
by (i) they are p and q, making p, q adjacent — contradiction. Hence
(p, q) ⊆ int K. (iii) Each open arc is a connected subset of
∂K ∖ {p, q}, which by (ii) is disjoint from ℓ; hence each arc lies in
one open half-plane. If both arcs lay in the same open half H⁺, then
∂K ∖ {p, q} ⊆ H⁺ would give K ⊆ closure(H⁺), making every point of
[p, q] ⊆ ℓ a boundary point of K and contradicting (p, q) ⊆ int K. ∎

**Lemma L3 (vertex wedge).** Let m be a vertex of a strictly convex
polygon with neighbors s (previous) and t (next). Let W be the closed
convex cone at apex m spanned by the directions d_s = s − m and
d_t = t − m (these are linearly independent by no-3-collinear). Then
K ⊆ W, and every vertex p ∉ {m, s, t} lies in the open cone
int W = {a·d_s + b·d_t : a, b > 0}.

*Proof.* By L1, the edge lines line(s, m) and line(m, t) each have all
other vertices strictly on one side; let H₁, H₂ be the corresponding
closed half-planes containing the vertices. K = conv(vertices) ⊆
H₁ ∩ H₂. The two boundary lines meet exactly at m (independence), so
H₁ ∩ H₂ is one of the four closed cones at m bounded by them. It
contains d_t (on ∂H₂, strictly inside H₁ since t is strictly inside H₁
by L1) and d_s (symmetrically), hence it is the cone spanned by
d_s, d_t, i.e., W. Its boundary is ray(m→s) ∪ ray(m→t). A vertex
p ∉ {m, s, t} on ray(m→s) would make m, s, p collinear (excluded);
similarly for ray(m→t); and p ≠ m. So p ∈ int W, and interior points
of a cone spanned by two independent generators are exactly the
positive combinations. ∎

**Lemma L4 (angle inside a wedge).** Let d₁, d₂ be linearly
independent vectors with Ω := ∠(d₁, d₂) ∈ (0, π), and let
p = a·d₁ + b·d₂ with a, b > 0. Then ∠(d₂, p) < Ω (and symmetrically
∠(d₁, p) < Ω).

*Proof.* Choose orthonormal coordinates with d̂₂ = (1, 0) and
d̂₁ = (cos Ω, sin Ω), sin Ω > 0. Then p = (a|d₁| cos Ω + b|d₂|,
a|d₁| sin Ω) has cross(d̂₂, p) = a|d₁| sin Ω > 0 and
cross(p, d̂₁) = sin Ω · b|d₂| > 0. Writing θ = ∠(d₂, p) ∈ [0, π]:
the first inequality gives p strictly above the d₂-axis, so
θ ∈ (0, π) and p = |p|(cos θ, sin θ); the second gives
sin(Ω − θ)·|p| = cross(p, d̂₁) > 0 with Ω − θ ∈ (−π, π), hence
θ < Ω. ∎

**Lemma L5 (isosceles base angle).** If |mp| = |mq| = 1 and m, p, q
are not collinear, then ∠pqm = ∠qpm = (π − ∠pmq)/2 ∈ (0, π/2).

*Proof.* Triangle angle sum and the base angles of an isosceles
triangle; ∠pmq ∈ (0, π) strictly by non-collinearity. ∎

## 5. Main theorem

**Theorem 1 (P2 under convention C2; PROVEN).** There do not exist six
distinct points x, y, z, w, v, u in strictly convex position with hull
cyclic order (x, y, z, w, v, u) and
|xu| = |xv| = |yw| = |zu| = |zw| = δ (any δ > 0).

*Proof.* Scale δ = 1 (§3). Suppose such a configuration exists; K its
hull, a strictly convex hexagon with boundary order (x,y,z,w,v,u).

Adjacency structure (from the cyclic order): u's neighbors are v and
x; z's neighbors are y and w; z and u are non-adjacent.

**Step 1 (interior angles at u and z are acute).** The hexagon's
interior angle at u is the unsigned angle between its two incident
edges [u, v] and [u, x], i.e., ∠vux. Since |xu| = |xv| = 1 and x, u, v
are not collinear, Lemma L5 (apex x) gives

  ∠vux = (π − ∠uxv)/2 < π/2.   (1)

Symmetrically, the interior angle at z is ∠yzw, and |wz| = |wy| = 1
with w, z, y not collinear give (L5, apex w)

  ∠yzw = (π − ∠zwy)/2 < π/2.   (2)

**Step 2 (w seen from u, and x seen from z, within acute wedges).**
By L3 at vertex u (neighbors v, x), the vertex w lies in the open
wedge at u spanned by u→v and u→x, whose opening is ∠vux. By L4,

  ∠xuw < ∠vux < π/2.   (3)

By L3 at vertex z (neighbors y, w), the vertex x lies in the open
wedge at z spanned by z→y and z→w, opening ∠yzw. By L4,

  ∠wzx < ∠yzw < π/2.   (4)

**Step 3 (normalized frame).** Place z = (0, 0), u = (1, 0) by a rigid
motion (using |zu| = 1). z, u are non-adjacent, so Lemma L2 applies to
the chord zu: the arc vertices {w, v} lie strictly on one open side of
the axis and {x, y} strictly on the other. Reflecting across the axis
if necessary (an isometry preserving the undirected cyclic order and
all hypotheses), assume

  x strictly above the axis, w strictly below.

Since |xu| = 1 and x is above, x = (1 − cos A, sin A) for a unique
A ∈ (0, π) (namely A = ∠xuz). Since |zw| = 1 and w is below,
w = (cos B, −sin B) for a unique B ∈ (0, π) (namely B = ∠wzu).

**Step 4 (the two acute angles in coordinates).** From (3),
∠xuw < π/2, equivalently (x − u)·(w − u) > 0:

  (x − u)·(w − u) = (−cos A)(cos B − 1) + (sin A)(−sin B)
                  = cos A − cos(A − B) > 0.   (5)

From (4), ∠wzx < π/2, equivalently (x − z)·(w − z) > 0:

  (x − z)·(w − z) = (1 − cos A)(cos B) + (sin A)(−sin B)
                  = cos B − cos(A − B) > 0.   (6)

**Step 5 (contradiction).** Both A and |A − B| lie in [0, π), where
cosine is strictly decreasing in the absolute value. (5) says
cos A > cos(A − B), i.e., A < |A − B|. If A ≥ B this would need
A < A − B, i.e., B < 0 — impossible; hence B > A and A < B − A, i.e.,

  B > 2A.   (5′)

Symmetrically (6) gives B < |A − B|, forcing A > B and

  A > 2B.   (6′)

(5′) and (6′) together give A > 2B > 4A, so 3A < 0, contradicting
A > 0. ∎

Remarks.

- The five distance hypotheses are all load-bearing: zu fixes the
  frame; zw, xu give the A, B parametrization; xv makes the interior
  angle at u acute (Step 1); yw makes the interior angle at z acute.
  The points v, y themselves enter only through those two isosceles
  triangles, the edge-support half-planes of L3, and non-collinearity.
- The proof uses no finiteness beyond the six named points and no
  unit-distance-specific facts; like P1, the rule is k-general: it
  forbids the pattern for ANY single common distance δ across the cut.
- Consistency check against the C1 counterexample (§6): under C1, u's
  hexagon neighbors are z and v (not x), so Step 1 has no isosceles
  triangle to apply at u, and the argument correctly does not go
  through — as it must not, since C1 variant A is realizable.
- Degeneration check: both (5′) and (6′) become equalities-in-the-
  limit as A, B → 0⁺; numerically the C2 feasibility program's
  supremum of the min-constraint-margin is exactly 0, attained only in
  the degenerate limit v → u, w → u (§7). The strictness structure of
  the proof matches the observed geometry.

**Corollary (variant B under C2; PROVEN).** There do not exist six
distinct points x, y, z, w, v, u in strictly convex position with hull
cyclic order (x, y, z, w, v, u) and |xu| = |xw| = |yu| = |zv| = |zw|
= δ (the variant-B cell set).

*Proof (explicit mirror argument).* Suppose H were such a
configuration. Let H′ be its image under any reflection of the plane.
Distances are preserved; strictly convex position is preserved; the
directed hull cyclic order reverses, so H′ has undirected cyclic order
(u, v, w, z, y, x). Relabel: x′ := z, y′ := y, z′ := x, w′ := u,
v′ := v, u′ := w. Then the cyclic order of H′ reads, after rotation,
(x′, y′, z′, w′, v′, u′) — the template of Theorem 1 — and the five
unit pairs of H translate as

  xu = z′w′, xw = z′u′, yu = y′w′, zv = x′v′, zw = x′u′,

i.e., exactly {x′u′, x′v′, y′w′, z′u′, z′w′}, the variant-A set. So H′
contradicts Theorem 1. ∎

In cut-matrix terms this is the composite symmetry "reflect the
polygon (reversing the traversal) and re-index both rows and columns",
which is a symmetry of the C2 convention; single-axis re-indexing is
not (see §6). Together, Theorem 1 + Corollary discharge both P2
variants under convention C2, for arbitrary polygons and cuts via
Lemma R.

## 6. The orientation convention is load-bearing: C1 counterexample

**Proposition 2 (variant A is realizable under convention C1;
PROVEN).** There exist six points in strictly convex position with
hull cyclic order (x, y, z, u, v, w) — the C1 template, rows then
columns along the same traversal — with |xu| = |xv| = |yw| = |zu| =
|zw| = 1. Explicitly, with c := cos(π/8) = √(2+√2)/2 and
s := sin(π/8) = √(2−√2)/2:

  z = (0, 0), u = (1, 0),
  x = (1 − √2/2, √2/2), w = (√2/2, √2/2),
  y = (√2/2 − c, √2/2 − s), v = (1 − √2/2 + c, √2/2 − s).

*Verification (exact, machine-checked with sympy).* The five squared
distances are identically 1: |zu|² = 1; |zw|² = 1/2 + 1/2;
|xu|² = 1/2 + 1/2; |xv|² = c² + s²; |yw|² = c² + s². Convex position
in the stated cyclic order: all 24 supporting cross-products (each
directed edge of the cycle (x,y,z,u,v,w) against the four remaining
vertices) are strictly positive; minimum value ≈ 0.15851 (exact
algebraic numbers in ℚ(√2, √(2±√2)); signs decided symbolically with a
60-digit numeric fallback — margin 0.158 makes the sign determinations
unambiguous). No three points are collinear (all 20 triple
cross-products nonzero, checked exactly). The configuration is
mirror-symmetric across X = 1/2 under the relabeling z↔u, x↔w, y↔v,
which preserves the constraint set.

**Consequences.**

1. **Convention resolution.** Under C1, variant A occurs in a strictly
   convex hexagon with cut A = {x, y, z}, B = {u, v, w}; so P2 is NOT
   a valid pruning rule under C1. Combined with Theorem 1: given the
   HIGH-confidence transcription of Fig. 4, if FR's Lemma 1 is true,
   FR's cut matrix is read in convention C2 (rows and columns indexed
   oppositely along the cycle — the "both sides top-to-bottom" planar
   layout). All subsequent pattern proofs (P3, P4) must fix C2.
2. **Single-axis reflection is not a cut-matrix symmetry** — now by
   explicit demonstration, not just bookkeeping: reversing the column
   order alone converts forbidden variant A (C2) into the realizable
   pattern of Proposition 2 (variant A read in C1 = column-reversed
   variant A in C2). The valid symmetries of the C2 setting are
   transposition (swap A↔B) and simultaneous reversal of both axes
   (plane reflection, used in the Corollary).
3. **P1 is orientation-neutral** (the K₂,₂ cell set is invariant under
   either axis reversal), which is why the convention question could
   not arise before P2. No conflict with the existing P1 proof.

## 7. Numerical sanity checks performed (all EMPIRICALLY VERIFIED)

Scripts in the session scratchpad (`p2_probe.py`, `p2_probe2.py`,
`p2_diag.py`, `p2_verify_lemmas.py`, `p2_c1_witness.py`); gauge used
throughout: z = (0,0), u = (1,0), w = z + e(a), x = u + e(b),
v = x + e(c), y = w + e(d), which satisfies the five distance
constraints identically, reducing realizability to a 4-angle search
for convex position in the required cyclic order.

1. **Grid probe, both conventions** (96⁴ angle grid, full
   supporting-line predicate, either orientation): C1: 29,914 valid
   hits (open region); C2: 0 hits. An earlier probe using only the six
   consecutive-turn signs produced ~10⁸ spurious "hits" — winding-2
   star hexagons and near-collinear chains satisfy all-same-sign turns
   without being convex in the stated order; the corrected predicate
   (every directed edge has all four other vertices strictly on the
   same side, uniform sign) removes them. Recorded as a pitfall for
   any future pattern probe.
2. **C2 infeasibility structure**: maximizing the minimum constraint
   margin over the C2 parameter space (coarse 60×60×90×90 grid +
   Nelder–Mead refinement) yields supremum ≈ 0 (1.4e−19), attained
   only in the degenerate limit v → u, w → u, A, B → 0, with the
   blocking constraints exactly the wedge conditions at u used in
   Step 2. Matches the equality-in-the-limit structure of (5′), (6′).
3. **Lemma-level validation** (4,000,000 uniform random samples of
   (A, B, γ, η)): among 109,828 samples satisfying the u-side
   hypotheses (x above, w below, edge supports at (v,u) and (u,x)),
   zero violations of B > 2A (min slack 0.0053); among 110,388
   satisfying the z-side hypotheses, zero violations of A > 2B (min
   slack 0.0060); zero samples satisfied both sides simultaneously.
   Also: max interior angle ∠vux over u-side samples =
   1.5707856 < π/2, and ∠xuw − ∠vux < 0 always (max −1.4e−6).
4. **C1 witness**: found by margin maximization, then rounded to
   angles (a, b, c, d) = (45°, 135°, 337.5°, 202.5°) = π/8 ·
   (2, 6, 15, 9); five distances exact by construction; convex
   position margin 0.1585; then verified exactly (§6). Float and
   exact checks agree.

No realizable configuration matching P2's constraints exists in the C2
reading (probes 1–3 and Theorem 1); the C1 realization is a convention
artifact, not a transcription refutation — under the C2 reading forced
by FR's claim, both variants are genuinely forbidden.

## 8. Structural assumptions used

- Strict convexity (no three vertices collinear) is used essentially:
  in L2(i), in L3 (open-cone placement of w and x), and in L5 (strict
  acuteness). At the degenerate boundary (collinearities allowed) the
  inequalities (5′), (6′) become non-strict and the contradiction
  degenerates exactly at A = B = 0 — consistent with check §7.2.
- The cut's contiguous-arc structure is used only through Lemma R
  (restriction to the hexagon) — after that the proof is purely about
  six points.
- No finiteness assumptions beyond the six named points; the ambient
  polygon may have any number of vertices. No unit-distance facts:
  general δ by scaling.
- Everything is invariant under similarity transformations; the
  normalized frame is a gauge choice.

## 9. Honest gap list

- None known in the main chain (Lemma R, L1–L5, Theorem 1, Corollary,
  Proposition 2). Every step above is written out; nothing is deferred
  to "clearly" or to the literature except the standard equivalence of
  the two definitions of "strictly convex polygon with given boundary
  cyclic order" (§2), which is textbook convex geometry and is exactly
  the characterization the numerical predicates check.
- The exact witness's 24 sign checks: sympy decided signs
  symbolically where possible with a 60-digit numeric fallback; the
  0.158 margin versus 60-digit precision leaves no realistic doubt,
  but a fully exact-field sign certificate (e.g., resultant/minimal
  polynomial bounds) was not produced. Anyone auditing can recompute
  in interval arithmetic in seconds.
- Transcription caveat (inherited, not new): the proof addresses the
  cell sets as transcribed in `fr-pattern-lemma1.md` (HIGH
  confidence). If the Fig. 4 reading changes, §5–§6 must be revisited.
- This draft has NOT yet been adversarially audited; per lane policy
  P2 may not be ADMITTED as a census rule until it is.

## 10. What next (ranked)

1. **Adversarial audit** of this draft (math-skeptic), jointly with
   the P1 proof in `fr-pattern-lemma1.md`; on pass, update the status
   ledger there (P2 → proven under stated convention; convention
   section should be promoted into the setting paragraph).
2. **Propagate the C2 convention** into the P3/P4 transcriptions
   before attempting their proofs — their variant bookkeeping is
   orientation-sensitive in exactly the way P2's was; P3/P4 attempted
   under C1 would be attempts at false statements.
3. **P3 proof**: the 6-cycle instance
   {(r₁,c₁),(r₁,c₂),(r₂,c₁),(r₂,c₃),(r₃,c₂),(r₃,c₃)} should be
   approachable with the same toolkit (L3/L4 wedges + isosceles base
   angles give acute-angle inequalities at multiple vertices); the
   general P3 family adds the c_k ≤ c_h slack.
4. **Reusable artifact**: the wedge-plus-isosceles mechanism
   ("a vertex whose two hexagon edges reach equidistant targets has an
   acute interior angle, and every other vertex sits inside that
   wedge") is the transferable core; consider extracting it as a
   lemma bank entry for P3/P4 and for any future same-distance-cut
   pruning rules.
