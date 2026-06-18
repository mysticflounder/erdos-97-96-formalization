import Erdos9796Proof.P97.Foundation
import Erdos9796Proof.P97.TwoCircleCrossing
import Mathlib.Analysis.Convex.Extreme
import Mathlib.Analysis.Convex.StrictConvexSpace
import Mathlib.Analysis.Convex.Combination

/-!
# N4d q'=E b₂ rows — reusable small-s geometry reductions (L1–L4)

This module carries the **PROVEN, uniform-in-`v₃`** geometry lemmas distilled by
the small-`s` convex-obstruction analysis
(`docs/n-lane/97-n4d-qeqe-smallS-convex-obstruction.md`).  They are the reusable
infrastructure for the whole N4d branch's (T-disk)/(T-conv) routes; they are
**independent** of the open quantitative core `(★)` (the continuum emptiness
certificate), which is *not* settled here.

* **L1 `power_apexCircle_eq_two_inner`** — the power identity:
  for `P` on the apex circle through `v₃` about `v₂` (`‖P − v₂‖ = ‖v₃ − v₂‖`),
  `‖P − O‖² − ‖v₃ − O‖² = 2⟪P − v₃, v₂ − O⟫`.
  This converts the (quadratic) disk-power of `P` into a single (linear) inner
  product; it is the load-bearing nonlinear→linear converter the analysis uses.

Only the apex-circle hypothesis is needed — the `‖v₂ − O‖ = ‖v₃ − O‖`
(co-radial) terms cancel identically, so the identity holds for *any* `O`.
-/

open scoped EuclideanGeometry InnerProductSpace
open EuclideanGeometry

namespace Problem97

private noncomputable def vec2 (x y : ℝ) : ℝ² :=
  EuclideanSpace.single 0 x + EuclideanSpace.single 1 y

/-- **L1 (power identity, PROVEN, exact, uniform).**  For any points
`P v₂ v₃ O : ℝ²` with `P` on the circle about `v₂` through `v₃`
(`‖P − v₂‖ = ‖v₃ − v₂‖`),
`‖P − O‖² − ‖v₃ − O‖² = 2⟪P − v₃, v₂ − O⟫_ℝ`.

The power of `P` w.r.t. the circle centred at `O` through `v₃` equals twice the
inner product of `P − v₃` with `v₂ − O`.  When `O` is the MEC centre and
`v₃ ∈ Γ` this is exactly `power_Γ(P) = 2⟪P − v₃, v₂ − O⟫`. -/
theorem power_apexCircle_eq_two_inner (P v₂ v₃ O : ℝ²)
    (hP : ‖P - v₂‖ = ‖v₃ - v₂‖) :
    ‖P - O‖ ^ 2 - ‖v₃ - O‖ ^ 2 = 2 * (inner ℝ (P - v₃) (v₂ - O)) := by
  have hP2 : ‖P - v₂‖ ^ 2 = ‖v₃ - v₂‖ ^ 2 := by rw [hP]
  simp only [← real_inner_self_eq_norm_sq] at hP2 ⊢
  simp only [inner_sub_left, inner_sub_right] at hP2 ⊢
  linarith [real_inner_comm P O, real_inner_comm v₃ O, real_inner_comm P v₃,
            real_inner_comm v₂ O, real_inner_comm P v₂, real_inner_comm v₃ v₂]

/-- **L2 (half-plane reduction, PROVEN, exact, uniform).**  Let `O` be the
centre and `R` the radius of the circle through `v₃` (`‖v₃ − O‖ = R`, `0 ≤ R`).
For any apex-circle point `P` (`‖P − v₂‖ = ‖v₃ − v₂‖`), disk-containment of `P`
is *equivalent* to a single **linear** half-plane condition through `v₃`:

`‖P − O‖ ≤ R  ↔  ⟪P − v₃, v₂ − O⟫_ℝ ≤ 0`.

This collapses the (quadratic) disk constraint on each of the free
`circle(v₂,s)` points `a₂,b₂,a₃` to one linear inequality — the right primitive
for the whole N4d (T-disk)/(T-conv) branch.  The boundary line passes through
`v₃` with normal `v₂ − O`. -/
theorem disk_apexCircle_iff_halfplane (P v₂ v₃ O : ℝ²) (R : ℝ) (hR : 0 ≤ R)
    (hP : ‖P - v₂‖ = ‖v₃ - v₂‖) (hv₃ : ‖v₃ - O‖ = R) :
    ‖P - O‖ ≤ R ↔ inner ℝ (P - v₃) (v₂ - O) ≤ 0 := by
  have key := power_apexCircle_eq_two_inner P v₂ v₃ O hP
  rw [hv₃] at key
  -- key : ‖P - O‖ ^ 2 - R ^ 2 = 2 * ⟪P - v₃, v₂ - O⟫
  constructor
  · intro h
    have hsq : ‖P - O‖ ^ 2 ≤ R ^ 2 := by
      nlinarith [mul_nonneg (by linarith : (0:ℝ) ≤ R - ‖P - O‖)
        (by linarith [norm_nonneg (P - O)] : (0:ℝ) ≤ R + ‖P - O‖)]
    linarith
  · intro h
    have hsq : ‖P - O‖ ^ 2 ≤ R ^ 2 := by linarith
    calc ‖P - O‖ = Real.sqrt (‖P - O‖ ^ 2) := (Real.sqrt_sq (norm_nonneg _)).symm
      _ ≤ Real.sqrt (R ^ 2) := Real.sqrt_le_sqrt hsq
      _ = R := Real.sqrt_sq hR

/-- **L3 (boundary point is extreme, PROVEN, uniform).**  In the (strictly
convex) Euclidean plane, a point `p` on the sphere `‖p − O‖ = R` is **not** in
the convex hull of any set `S` of points lying in the closed disk
(`‖x − O‖ ≤ R`) that does not already contain `p`.

Applied to the MEC with `O` the centre, `R` the radius, `S = ↑A \ {vᵢ}` and
`p = vᵢ` (using `disk_contains_A` and the on-boundary fields), this shows each
MEC-boundary vertex `v₁, v₂, v₃` is a vertex of `conv A` — the trapped-point
localization `trapped ∈ {a₂,b₂,a₃,q,a₁,b₁}`.

NB (scope): this lemma proves extreme **only** for the three MEC-boundary bases
`v₁,v₂,v₃`. The 6-element set above is the *candidate* trapped set, NOT a claim
that it collapses — `97-n4d-qeqe-smallS-cluster-extreme.md` shows `b₂,a₃` are
genuinely trappable (interior to the disk), so no further 7→2 reduction follows
from L3. -/
theorem not_mem_convexHull_of_norm_eq_radius
    (O : ℝ²) (R : ℝ) (S : Set ℝ²) (p : ℝ²)
    (hp : ‖p - O‖ = R) (hS : ∀ x ∈ S, ‖x - O‖ ≤ R) (hpS : p ∉ S) :
    p ∉ convexHull ℝ S := by
  intro hmem
  have hpball : p ∈ Metric.closedBall O R := by
    rw [Metric.mem_closedBall, dist_eq_norm, hp]
  have hSball : S ⊆ Metric.closedBall O R := by
    intro x hx; rw [Metric.mem_closedBall, dist_eq_norm]; exact hS x hx
  have hhullball : convexHull ℝ S ⊆ Metric.closedBall O R :=
    convexHull_min hSball (convex_closedBall O R)
  -- `p` is an extreme point of the closed ball (strict convexity).
  have hpext : p ∈ (Metric.closedBall O R).extremePoints ℝ := by
    rw [mem_extremePoints]
    refine ⟨hpball, ?_⟩
    intro x₁ hx₁ x₂ hx₂ hpseg
    by_cases hne : x₁ = x₂
    · subst hne
      rw [openSegment_same, Set.mem_singleton_iff] at hpseg
      exact ⟨hpseg.symm, hpseg.symm⟩
    · exfalso
      have hopen : p ∈ Metric.ball O R :=
        openSegment_subset_ball_of_ne hx₁ hx₂ hne hpseg
      rw [Metric.mem_ball, dist_eq_norm, hp] at hopen
      exact lt_irrefl R hopen
  -- Extremeness is inherited by the smaller convex set `convexHull S`.
  have hpextHull : p ∈ (convexHull ℝ S).extremePoints ℝ :=
    inter_extremePoints_subset_extremePoints_of_subset hhullball ⟨hmem, hpext⟩
  -- Milman: extreme points of a convex hull lie in the generating set.
  exact hpS (extremePoints_convexHull_subset hpextHull)

/- ## L4 — MEC geometry under the normalized frame and non-obtuseness

Frame (kills the similarity DOFs): `v₁ = (0,0)`, `v₂ = (1,0)`,
`v₃ = (v₃x, v₃y)` with `v₃y > 0`.  The MEC centre `O` and radius `R` are
supplied by the three circumcentre equidistance hypotheses
`‖v₁ − O‖ = R`, `‖v₂ − O‖ = R`, `‖v₃ − O‖ = R`.

These lemmas are PROVEN, uniform in `v₃`, and algebraic; they are the §4
content of `docs/n-lane/97-n4d-qeqe-smallS-convex-obstruction.md`.  The
√-laden *upper* bounds `Oy ≤ s/(2√(1−s²))`, `R² ≤ ¼ + s²/(4(1−s²))` are
**deferred** (low value per the analysis, and awkward in Lean); the clean
non-obtuse *lower* bounds `0 ≤ Oy` and `¼ ≤ R²` are formalized here. -/

/-- **L4.1 (circumcentre x-coordinate, PROVEN).**  In the normalized frame
`v₁ = (0,0)`, `v₂ = (1,0)`, the circumcentre `O` (equidistant from `v₁` and
`v₂`) has `O 0 = 1/2`.  Uses only the `v₁,v₂` equidistance and the frame. -/
theorem mec_circumcenter_x (v₁ v₂ O : ℝ²) (R : ℝ)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (e1 : ‖v₁ - O‖ = R) (e2 : ‖v₂ - O‖ = R) :
    O 0 = 1 / 2 := by
  have h : ‖v₁ - O‖ ^ 2 = ‖v₂ - O‖ ^ 2 := by rw [e1, e2]
  rw [EuclideanSpace.norm_sq_eq, EuclideanSpace.norm_sq_eq] at h
  simp only [Fin.sum_univ_two, PiLp.sub_apply, h1x, h1y, h2x, h2y,
    Real.norm_eq_abs, sq_abs] at h
  nlinarith [h]

/-- **L4.2 (circumcentre y-coordinate / `Oy` formula, PROVEN).**  In the
normalized frame, with `v₃y > 0`, the circumcentre `O` (equidistant from
`v₁` and `v₃`, with `O 0 = 1/2`) has
`O 1 = (v₃x² − v₃x + v₃y²) / (2 · v₃y)`. -/
theorem mec_circumcenter_y (v₁ v₃ O : ℝ²) (R : ℝ)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h3y : 0 < v₃ 1)
    (hOx : O 0 = 1 / 2)
    (e1 : ‖v₁ - O‖ = R) (e3 : ‖v₃ - O‖ = R) :
    O 1 = (v₃ 0 ^ 2 - v₃ 0 + v₃ 1 ^ 2) / (2 * v₃ 1) := by
  have h : ‖v₁ - O‖ ^ 2 = ‖v₃ - O‖ ^ 2 := by rw [e1, e3]
  rw [EuclideanSpace.norm_sq_eq, EuclideanSpace.norm_sq_eq] at h
  simp only [Fin.sum_univ_two, PiLp.sub_apply, h1x, h1y,
    Real.norm_eq_abs, sq_abs] at h
  rw [eq_div_iff (by positivity)]
  nlinarith [h, hOx]

/-- The inner-product non-obtuse condition at `v₃` (interior angle of the
triangle `v₁v₂v₃` at `v₃` is `≤ π/2`), `⟪v₁ − v₃, v₂ − v₃⟫ ≥ 0`, expands in
the normalized frame to the nonnegativity of the `Oy`-numerator
`v₃x² − v₃x + v₃y² ≥ 0`. -/
theorem nonobtuse_v₃_numerator_nonneg (v₁ v₂ v₃ : ℝ²)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (hno : 0 ≤ (inner ℝ (v₁ - v₃) (v₂ - v₃) : ℝ)) :
    0 ≤ v₃ 0 ^ 2 - v₃ 0 + v₃ 1 ^ 2 := by
  rw [PiLp.inner_apply] at hno
  simp only [Fin.sum_univ_two, PiLp.sub_apply, h1x, h1y, h2x, h2y,
    RCLike.inner_apply, conj_trivial] at hno
  nlinarith [hno]

/-- **L4.3 (non-obtuse lower bound `0 ≤ Oy`, PROVEN).**  In the normalized
frame with `v₃y > 0`, if the triangle `v₁v₂v₃` is non-obtuse at `v₃`
(`⟪v₁ − v₃, v₂ − v₃⟫ ≥ 0`), then the circumcentre satisfies `0 ≤ O 1`. -/
theorem mec_circumcenter_y_nonneg (v₁ v₂ v₃ O : ℝ²) (R : ℝ)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (h3y : 0 < v₃ 1)
    (hno : 0 ≤ (inner ℝ (v₁ - v₃) (v₂ - v₃) : ℝ))
    (e1 : ‖v₁ - O‖ = R) (e2 : ‖v₂ - O‖ = R) (e3 : ‖v₃ - O‖ = R) :
    0 ≤ O 1 := by
  have hOx : O 0 = 1 / 2 := mec_circumcenter_x v₁ v₂ O R h1x h1y h2x h2y e1 e2
  have hOy : O 1 = (v₃ 0 ^ 2 - v₃ 0 + v₃ 1 ^ 2) / (2 * v₃ 1) :=
    mec_circumcenter_y v₁ v₃ O R h1x h1y h3y hOx e1 e3
  have hnum : 0 ≤ v₃ 0 ^ 2 - v₃ 0 + v₃ 1 ^ 2 :=
    nonobtuse_v₃_numerator_nonneg v₁ v₂ v₃ h1x h1y h2x h2y hno
  rw [hOy]
  positivity

/-- **L4.4 (radius lower bound `¼ ≤ R²`, PROVEN).**  In the normalized frame,
`R² = ‖v₁ − O‖² = (O 0)² + (O 1)² = ¼ + (O 1)²`, so `R² ≥ ¼` (clean, needs no
non-obtuseness — only the `v₁,v₂` equidistance for `O 0 = 1/2`).  Equivalently
`1/2 ≤ R` for `0 ≤ R`. -/
theorem mec_radius_sq_ge (v₁ v₂ O : ℝ²) (R : ℝ)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (e1 : ‖v₁ - O‖ = R) (e2 : ‖v₂ - O‖ = R) :
    (1 / 2 : ℝ) ^ 2 ≤ R ^ 2 := by
  have hOx : O 0 = 1 / 2 := mec_circumcenter_x v₁ v₂ O R h1x h1y h2x h2y e1 e2
  have hR : R ^ 2 = O 0 ^ 2 + O 1 ^ 2 := by
    rw [← e1, EuclideanSpace.norm_sq_eq]
    simp only [Fin.sum_univ_two, PiLp.sub_apply, h1x, h1y,
      Real.norm_eq_abs, sq_abs]
    ring
  rw [hR, hOx]
  nlinarith [sq_nonneg (O 1)]

/- ## L5 — circumcenter coincidence (the b₂ q'=E obstruction core)

Three **pairwise-distinct** points have at most one equidistant center in the
plane: if `A` and `B` are each equidistant from `P, Q, R` (pairwise distinct),
then `A = B`.  This is the elementary geometry kernel distilled in
`docs/n-lane/97-n4d-qeqe-b2-realfeas-uniform.md` §4 — the z3-UNSAT-verified core
that PROVEN-closes all 495 admissible b₂ class-pairs with `|Sa₂ ∩ Sb₂| ≥ 3`.

The proof is the perpendicular-bisector / Cramer route (no disk, no convexity,
no real-QE):

* **Non-collinearity** (`noncollinear_of_cospherical_of_pairwise_ne`): three
  *distinct* points equidistant from a common center `A` cannot be collinear —
  a real line meets a real circle in ≤ 2 points.  Formalized as the signed-area
  determinant `D := (Q−P)×(R−P) ≠ 0`, proved by contradiction: collinearity
  (`D = 0`) yields a scalar `t` with `R−P = t·(Q−P)`, and the two
  perpendicular-bisector equations through the center force `t·(1−t)·‖Q−P‖² = 0`,
  hence `t ∈ {0,1}`, i.e. `R = P` or `R = Q`, contradicting distinctness.
* **Cramer**: subtracting the bisector equations of `A` and `B` makes `A − B`
  orthogonal to both `Q − P` and `R − P`, so `(A−B)·D = 0` componentwise; with
  `D ≠ 0` this forces `A = B`.

The whole argument is uniform, axiom-clean, and elementary. -/

/-- **L5 — non-collinearity (coordinate form, PROVEN).**  If `(px,py)`, `(qx,qy)`,
`(rx,ry)` are pairwise distinct and all equidistant from `(ax,ay)`, then the
signed-area determinant `D = (qx−px)(ry−py) − (qy−py)(rx−px)` is nonzero — i.e.
the three points are non-collinear.

This is §4 Step 1: a real line meets a real circle in at most two points, so
three *distinct* cospherical points cannot be collinear.  Proof is by
contradiction via the collinearity scalar `t` and the bisector identity
`t·(1−t)·‖Q−P‖² = 0`. -/
private theorem noncollinear_of_cospherical_of_pairwise_ne
    (px py qx qy rx ry ax ay : ℝ)
    (hPQ : px ≠ qx ∨ py ≠ qy) (hPR : px ≠ rx ∨ py ≠ ry) (hQR : qx ≠ rx ∨ qy ≠ ry)
    (e1 : (ax - px) ^ 2 + (ay - py) ^ 2 = (ax - qx) ^ 2 + (ay - qy) ^ 2)
    (e2 : (ax - px) ^ 2 + (ay - py) ^ 2 = (ax - rx) ^ 2 + (ay - ry) ^ 2) :
    (qx - px) * (ry - py) - (qy - py) * (rx - px) ≠ 0 := by
  intro hD
  have hPQpos : (px - qx) ^ 2 + (py - qy) ^ 2 > 0 := by
    rcases hPQ with h | h
    · have h' : px - qx ≠ 0 := sub_ne_zero.mpr h
      have : (px - qx) ^ 2 > 0 := by positivity
      nlinarith [sq_nonneg (py - qy)]
    · have h' : py - qy ≠ 0 := sub_ne_zero.mpr h
      have : (py - qy) ^ 2 > 0 := by positivity
      nlinarith [sq_nonneg (px - qx)]
  -- collinearity `D = 0` produces a scalar `t` with `R − P = t·(Q − P)`
  obtain ⟨t, htx, hty⟩ : ∃ t : ℝ, rx - px = t * (qx - px) ∧ ry - py = t * (qy - py) := by
    by_cases hqxpx : qx - px = 0
    · have hqypy : qy - py ≠ 0 := by
        intro h; apply absurd hPQpos
        have e1' : px - qx = 0 := by linarith [hqxpx]
        have e2' : py - qy = 0 := by linarith [h]
        rw [e1', e2']; norm_num
      refine ⟨(ry - py) / (qy - py), ?_, ?_⟩
      · have hz : (qy - py) * (rx - px) = 0 := by rw [hqxpx] at hD; linarith [hD]
        have hrxpx : rx - px = 0 := by
          rcases mul_eq_zero.mp hz with h | h
          · exact absurd h hqypy
          · exact h
        rw [hrxpx, hqxpx]; ring
      · field_simp
    · refine ⟨(rx - px) / (qx - px), ?_, ?_⟩
      · field_simp
      · rw [div_mul_eq_mul_div, eq_div_iff hqxpx]; linear_combination hD
  -- the two perpendicular-bisector equations force `t·(1−t)·‖Q−P‖² = 0`
  have key : t * (1 - t) * ((qx - px) ^ 2 + (qy - py) ^ 2) = 0 := by
    have p1 : 2 * ((ax - px) * (qx - px) + (ay - py) * (qy - py))
        = (qx - px) ^ 2 + (qy - py) ^ 2 := by nlinarith [e1]
    have p2 : 2 * ((ax - px) * (rx - px) + (ay - py) * (ry - py))
        = (rx - px) ^ 2 + (ry - py) ^ 2 := by nlinarith [e2]
    have hrx : rx = px + t * (qx - px) := by linarith
    have hry : ry = py + t * (qy - py) := by linarith
    rw [hrx, hry] at p2
    linear_combination -t * p1 + p2
  have hN : (qx - px) ^ 2 + (qy - py) ^ 2 > 0 := by nlinarith [hPQpos]
  have htt : t = 0 ∨ t = 1 := by
    have h0 : t * (1 - t) = 0 := by
      rcases mul_eq_zero.mp key with h | h
      · exact h
      · exact absurd h hN.ne'
    rcases mul_eq_zero.mp h0 with h | h
    · exact Or.inl h
    · exact Or.inr (by linarith)
  rcases htt with h | h
  · -- `t = 0` ⟹ `R = P`, contradicting `P ≠ R`
    rw [h] at htx hty
    simp only [zero_mul] at htx hty
    rcases hPR with h2 | h2
    · exact h2 (by linarith)
    · exact h2 (by linarith)
  · -- `t = 1` ⟹ `R = Q`, contradicting `Q ≠ R`
    rw [h] at htx hty
    simp only [one_mul] at htx hty
    rcases hQR with h2 | h2
    · exact h2 (by linarith)
    · exact h2 (by linarith)

/-- **L5 (circumcenter coincidence, PROVEN, uniform).**  For `P Q R A B : ℝ²`
with `P, Q, R` pairwise distinct, if `A` is equidistant from `P, Q, R`
(`dist A P = dist A Q` and `dist A P = dist A R`) and `B` is equidistant from
`P, Q, R`, then `A = B`.

Two distinct points cannot both be equidistant from three pairwise-distinct
points: the equidistant center of a non-degenerate triple is unique (the
circumcenter).  This is the §4 lemma core, the b₂ q'=E obstruction. -/
theorem eq_of_dist_eq_three_of_pairwise_ne
    (P Q R A B : ℝ²)
    (hPQ : P ≠ Q) (hPR : P ≠ R) (hQR : Q ≠ R)
    (hAP_AQ : dist A P = dist A Q) (hAP_AR : dist A P = dist A R)
    (hBP_BQ : dist B P = dist B Q) (hBP_BR : dist B P = dist B R) :
    A = B := by
  -- squared-distance in coordinates
  have sq : ∀ X Y : ℝ², dist X Y ^ 2 = (X 0 - Y 0) ^ 2 + (X 1 - Y 1) ^ 2 := by
    intro X Y
    rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
    simp [Fin.sum_univ_two, PiLp.sub_apply, Real.norm_eq_abs, sq_abs]
  have eA1 : (A 0 - P 0) ^ 2 + (A 1 - P 1) ^ 2 = (A 0 - Q 0) ^ 2 + (A 1 - Q 1) ^ 2 := by
    rw [← sq, ← sq, hAP_AQ]
  have eA2 : (A 0 - P 0) ^ 2 + (A 1 - P 1) ^ 2 = (A 0 - R 0) ^ 2 + (A 1 - R 1) ^ 2 := by
    rw [← sq, ← sq, hAP_AR]
  have eB1 : (B 0 - P 0) ^ 2 + (B 1 - P 1) ^ 2 = (B 0 - Q 0) ^ 2 + (B 1 - Q 1) ^ 2 := by
    rw [← sq, ← sq, hBP_BQ]
  have eB2 : (B 0 - P 0) ^ 2 + (B 1 - P 1) ^ 2 = (B 0 - R 0) ^ 2 + (B 1 - R 1) ^ 2 := by
    rw [← sq, ← sq, hBP_BR]
  -- pairwise distinctness as a coordinate disjunction
  have dPQ : P 0 ≠ Q 0 ∨ P 1 ≠ Q 1 := by
    by_contra hc; push_neg at hc; exact hPQ (by ext i; fin_cases i; exacts [hc.1, hc.2])
  have dPR : P 0 ≠ R 0 ∨ P 1 ≠ R 1 := by
    by_contra hc; push_neg at hc; exact hPR (by ext i; fin_cases i; exacts [hc.1, hc.2])
  have dQR : Q 0 ≠ R 0 ∨ Q 1 ≠ R 1 := by
    by_contra hc; push_neg at hc; exact hQR (by ext i; fin_cases i; exacts [hc.1, hc.2])
  -- `P,Q,R` non-collinear (via the center `A`)
  have hD : (Q 0 - P 0) * (R 1 - P 1) - (Q 1 - P 1) * (R 0 - P 0) ≠ 0 :=
    noncollinear_of_cospherical_of_pairwise_ne
      (P 0) (P 1) (Q 0) (Q 1) (R 0) (R 1) (A 0) (A 1) dPQ dPR dQR eA1 eA2
  -- `A − B` orthogonal to both `Q − P` and `R − P` (subtract the bisector eqns)
  have hα : (A 0 - B 0) * (Q 0 - P 0) + (A 1 - B 1) * (Q 1 - P 1) = 0 := by
    linear_combination (1 / 2) * eA1 - (1 / 2) * eB1
  have hβ : (A 0 - B 0) * (R 0 - P 0) + (A 1 - B 1) * (R 1 - P 1) = 0 := by
    linear_combination (1 / 2) * eA2 - (1 / 2) * eB2
  -- Cramer: `(A − B) · D = 0` in each coordinate
  have hdxD : (A 0 - B 0) *
      ((Q 0 - P 0) * (R 1 - P 1) - (Q 1 - P 1) * (R 0 - P 0)) = 0 := by
    linear_combination (R 1 - P 1) * hα - (Q 1 - P 1) * hβ
  have hdyD : (A 1 - B 1) *
      ((Q 0 - P 0) * (R 1 - P 1) - (Q 1 - P 1) * (R 0 - P 0)) = 0 := by
    linear_combination (-(R 0 - P 0)) * hα + (Q 0 - P 0) * hβ
  have hdx : A 0 - B 0 = 0 := by
    rcases mul_eq_zero.mp hdxD with h | h
    · exact h
    · exact absurd h hD
  have hdy : A 1 - B 1 = 0 := by
    rcases mul_eq_zero.mp hdyD with h | h
    · exact h
    · exact absurd h hD
  ext i; fin_cases i
  · change A 0 = B 0; linarith [hdx]
  · change A 1 = B 1; linarith [hdy]

/-- **L5' (obstruction corollary, PROVEN, uniform).**  For `P Q R A B : ℝ²` with
`P, Q, R` pairwise distinct, if `A` and `B` are each equidistant from `P, Q, R`
*and* `A ≠ B`, then `False`.

This is the form the b₂ closure consumes: two *distinct* points cannot both be
equidistant from three pairwise-distinct points.  Immediate from
`eq_of_dist_eq_three_of_pairwise_ne`. -/
theorem not_dist_eq_three_of_ne
    (P Q R A B : ℝ²)
    (hPQ : P ≠ Q) (hPR : P ≠ R) (hQR : Q ≠ R)
    (hAP_AQ : dist A P = dist A Q) (hAP_AR : dist A P = dist A R)
    (hBP_BQ : dist B P = dist B Q) (hBP_BR : dist B P = dist B R)
    (hAB : A ≠ B) : False :=
  hAB (eq_of_dist_eq_three_of_pairwise_ne P Q R A B hPQ hPR hQR
    hAP_AQ hAP_AR hBP_BQ hBP_BR)

/- ## L6 — the Family-A chord obstruction (the b₂ q'=E majority closer)

  ⟦SUPERSEDED-FOR-ROWS 2026-06-10 (commit aa0e700).⟧  L6/L7/L8 below are
  kernel-clean and their sign hypotheses are FAITHFUL for the points they bind
  (a₂, b₂, v₃ are genuinely upper — `frame_c2_upper`).  But: (i) they are
  UNWIRED (no consumer), and (ii) their raison d'être — the 706-pair |T|≤2
  residual census and the λ₂-region split — is output of the UNFAITHFUL q'=E
  encoding (a₃ placed above the chord, omitting the `|v₃a₃|=t` pin).  The q'=E
  b₂ column is now CLOSED from an EMPTY hypothesis set by the pin clash
  `Problem97.qEqE_b2_column_pinclash_false` (`N4dQeqEb2PinClash.lean`), so this
  "majority closer" is moot-for-rows.  Do NOT wire L6/L7/L8 as the q'=E closer.
  Audit: `docs/n-lane/97-infidelity-audit-2026-06-10.md` §6 (F9).

`docs/n-lane/97-n4d-qeqe-b2-residual-attack-2026-06-02.md` §3, §6.  In the
normalized non-obtuse frame `v₁ = (0,0)`, `v₂ = (1,0)`, `v₃ = (v₃x,v₃y)` with
`v₃y > 0`, the b₂ selector pins `a₂` to the **upper** intersection of
`circle(v₁,1)` and `circle(v₂,s)`, where `s = |v₂v₃|`:

* `dist a₂ v₁ = 1`, `dist a₂ v₂ = s`, `dist v₃ v₂ = s`, `a₂y > 0`, `v₃y > 0`.

Since `a₂` and `v₃` both lie on `circle(v₂,s)`, the segment `a₂v₃` is a chord of
that circle.  Across the non-obtuse lens (`⟪v₁−v₂, v₃−v₂⟫ ≥ 0` and
`⟪v₁−v₃, v₂−v₃⟫ ≥ 0`, which pin `1 − s² ≤ v₃x ≤ 1`) the chord is **short**:
`|a₂v₃|² < 1` (Family-A `{v₃,v₁}` branch) and even `|a₂v₃|² < s²` (Family-A
`{v₃,v₂}` branch).  Either inequality clashes with a K4@a₂ class containing
`{v₃,v₁}` (forcing `|a₂v₃| = |a₂v₁| = 1`) resp. `{v₃,v₂}` (forcing
`|a₂v₃| = |a₂v₂| = s`).

The proofs are elementary and uniform — a reduction identity
`|a₂v₃|² = s²(1+v₃x) − 2 a₂y·v₃y` plus an explicit Positivstellensatz
certificate for the squared chord-length bound — in the L5 spirit (no disk, no
convexity, no SOS cone).  The pins give `a₂x = 1 − s²/2`,
`a₂y² = (4s² − s⁴)/4`, `v₃y² = s² − (v₃x − 1)²`. -/

/-- **L6 scalar core (`< 1` branch, PROVEN).**  In coordinates `(ax,ay)=a₂`,
`(x,y)=v₃`, with `ax = 1 − s²/2`, `ax²+ay²=1` (`|v₁a₂|=1`),
`(x−1)²+y²=s²` (`|v₂v₃|=s`), `ay,y>0`, and the lens bounds `1−s² ≤ x ≤ 1`,
the chord satisfies `(ax−x)²+(ay−y)² < 1`.

The reduction `(ax−x)²+(ay−y)² = s²(1+x) − 2 ay·y` plus the case split on
`c := s²(1+x) − 1`: for `c ≤ 0` immediate (`ay·y>0`); for `c > 0` square and
discharge the polynomial core `(4s²−s⁴)(s²−(x−1)²) > c²` by the explicit
certificate `c + s²(x−(1−s²)) + 2s²(1−s²) + 4s²(1−x)(x−(1−s²)) + s⁴(1−s²)`. -/
private theorem familyA_lt_one_scalar (s ax ay x y : ℝ)
    (hs0 : 0 < s) (hs1 : s < 1)
    (hax : ax = 1 - s ^ 2 / 2)
    (hcirc : ax ^ 2 + ay ^ 2 = 1)
    (hv3 : (x - 1) ^ 2 + y ^ 2 = s ^ 2)
    (hay : 0 < ay) (hy : 0 < y)
    (hxlo : 1 - s ^ 2 ≤ x) (hxhi : x ≤ 1) :
    (ax - x) ^ 2 + (ay - y) ^ 2 < 1 := by
  have hay2 : ay ^ 2 = (4 * s ^ 2 - s ^ 4) / 4 := by
    have hsq : ax ^ 2 = (1 - s ^ 2 / 2) ^ 2 := by rw [hax]
    nlinarith [hcirc, hsq]
  have hy2 : y ^ 2 = s ^ 2 - (x - 1) ^ 2 := by linear_combination hv3
  have hred : (ax - x) ^ 2 + (ay - y) ^ 2 = s ^ 2 * (1 + x) - 2 * (ay * y) := by
    have h : (ax - x) ^ 2 + (ay - y) ^ 2
        = (ax ^ 2 + ay ^ 2) - 2 * ax * x + (x ^ 2 + y ^ 2) - 2 * ay * y := by ring
    rw [h, hcirc, hax, hy2]; ring
  rw [hred]
  have hs2 : (0 : ℝ) < s ^ 2 := by positivity
  have hayy : 0 < ay * y := mul_pos hay hy
  have h4 : (2 * (ay * y)) ^ 2 = (4 * s ^ 2 - s ^ 4) * (s ^ 2 - (x - 1) ^ 2) := by
    rw [mul_pow, show (ay * y) ^ 2 = ay ^ 2 * y ^ 2 by ring, hay2, hy2]; ring
  by_cases hc : 0 < s ^ 2 * (1 + x) - 1
  · -- squaring branch: 2 ay·y > c via (2 ay·y)² > c²
    have hcore : (4 * s ^ 2 - s ^ 4) * (s ^ 2 - (x - 1) ^ 2) > (s ^ 2 * (1 + x) - 1) ^ 2 := by
      have hgq : 0 ≤ x - (1 - s ^ 2) := by linarith
      have hw : 0 ≤ 1 - x := by linarith
      have h1mp : 0 < 1 - s ^ 2 := by nlinarith [mul_pos hs0 hs0, hs1]
      have hid : (4 * s ^ 2 - s ^ 4) * (s ^ 2 - (x - 1) ^ 2) - (s ^ 2 * (1 + x) - 1) ^ 2
          = (s ^ 2 * (1 + x) - 1) + s ^ 2 * (x - (1 - s ^ 2))
            + 2 * s ^ 2 * (1 - s ^ 2) + 4 * s ^ 2 * (1 - x) * (x - (1 - s ^ 2))
            + s ^ 4 * (1 - s ^ 2) := by ring
      have t1 : 0 ≤ s ^ 2 * (x - (1 - s ^ 2)) := mul_nonneg (le_of_lt hs2) hgq
      have t2 : 0 < 2 * s ^ 2 * (1 - s ^ 2) := by positivity
      have t3 : 0 ≤ 4 * s ^ 2 * (1 - x) * (x - (1 - s ^ 2)) :=
        mul_nonneg (mul_nonneg (by positivity) hw) hgq
      have t4 : 0 ≤ s ^ 4 * (1 - s ^ 2) := by positivity
      linarith [hid, hc, t1, t2, t3, t4]
    have hsq : (s ^ 2 * (1 + x) - 1) ^ 2 < (2 * (ay * y)) ^ 2 := by rw [h4]; exact hcore
    have h2c : s ^ 2 * (1 + x) - 1 < 2 * (ay * y) :=
      lt_of_pow_lt_pow_left₀ 2 (by positivity) hsq
    linarith
  · push_neg at hc; linarith

/-- **L6 scalar core (`< s²` branch, PROVEN).**  Same frame as
`familyA_lt_one_scalar`; the chord is even shorter than the radius:
`(ax−x)²+(ay−y)² < s²`.  Reduces to `s²·x < 2 ay·y`; since `x ≥ 1−s² > 0`
this is the always-squaring branch, with the polynomial core
`(4s²−s⁴)(s²−(x−1)²) > (s²x)²` discharged by the certificate
`s²(3−s²)(x−(1−s²)) + 3s²(1−s²)(1−x) + 4s²(1−x)(x−(1−s²))`.  This branch is
quantitatively **tight** (margin → 0 near `s → 1`, `x → 0`); the certificate is
the secant lower bound of the concave-in-`(1−x)` polynomial. -/
private theorem familyA_lt_ssq_scalar (s ax ay x y : ℝ)
    (hs0 : 0 < s) (hs1 : s < 1)
    (hax : ax = 1 - s ^ 2 / 2)
    (hcirc : ax ^ 2 + ay ^ 2 = 1)
    (hv3 : (x - 1) ^ 2 + y ^ 2 = s ^ 2)
    (hay : 0 < ay) (hy : 0 < y)
    (hxlo : 1 - s ^ 2 ≤ x) (hxhi : x ≤ 1) :
    (ax - x) ^ 2 + (ay - y) ^ 2 < s ^ 2 := by
  have hay2 : ay ^ 2 = (4 * s ^ 2 - s ^ 4) / 4 := by
    have hsq : ax ^ 2 = (1 - s ^ 2 / 2) ^ 2 := by rw [hax]
    nlinarith [hcirc, hsq]
  have hy2 : y ^ 2 = s ^ 2 - (x - 1) ^ 2 := by linear_combination hv3
  have hred : (ax - x) ^ 2 + (ay - y) ^ 2 = s ^ 2 * (1 + x) - 2 * (ay * y) := by
    have h : (ax - x) ^ 2 + (ay - y) ^ 2
        = (ax ^ 2 + ay ^ 2) - 2 * ax * x + (x ^ 2 + y ^ 2) - 2 * ay * y := by ring
    rw [h, hcirc, hax, hy2]; ring
  rw [hred]
  have hs2 : (0 : ℝ) < s ^ 2 := by positivity
  have hxpos : 0 < x := by nlinarith [hs2, hs1, mul_pos hs0 hs0]
  have hayy : 0 < ay * y := mul_pos hay hy
  have h4 : (2 * (ay * y)) ^ 2 = (4 * s ^ 2 - s ^ 4) * (s ^ 2 - (x - 1) ^ 2) := by
    rw [mul_pow, show (ay * y) ^ 2 = ay ^ 2 * y ^ 2 by ring, hay2, hy2]; ring
  have hcore : (4 * s ^ 2 - s ^ 4) * (s ^ 2 - (x - 1) ^ 2) > (s ^ 2 * x) ^ 2 := by
    have hgq : 0 ≤ x - (1 - s ^ 2) := by linarith
    have hw : 0 ≤ 1 - x := by linarith
    have h3p : 0 < 3 - s ^ 2 := by nlinarith [mul_pos hs0 hs0]
    have h1mp : 0 < 1 - s ^ 2 := by nlinarith [mul_pos hs0 hs0, hs1]
    have hid : (4 * s ^ 2 - s ^ 4) * (s ^ 2 - (x - 1) ^ 2) - (s ^ 2 * x) ^ 2
        = s ^ 2 * (3 - s ^ 2) * (x - (1 - s ^ 2)) + 3 * s ^ 2 * (1 - s ^ 2) * (1 - x)
          + 4 * s ^ 2 * (1 - x) * (x - (1 - s ^ 2)) := by ring
    have hstrict : 0 < s ^ 2 * (3 - s ^ 2) * (x - (1 - s ^ 2))
          + 3 * s ^ 2 * (1 - s ^ 2) * (1 - x)
          + 4 * s ^ 2 * (1 - x) * (x - (1 - s ^ 2)) := by
      have t1 : 0 ≤ s ^ 2 * (3 - s ^ 2) * (x - (1 - s ^ 2)) :=
        mul_nonneg (mul_nonneg (le_of_lt hs2) (le_of_lt h3p)) hgq
      have t3 : 0 ≤ 4 * s ^ 2 * (1 - x) * (x - (1 - s ^ 2)) :=
        mul_nonneg (mul_nonneg (by positivity) hw) hgq
      rcases lt_or_eq_of_le hxhi with hlt | heq
      · have t2 : 0 < 3 * s ^ 2 * (1 - s ^ 2) * (1 - x) :=
          mul_pos (mul_pos (by positivity) h1mp) (by linarith)
        linarith
      · have hgqpos : 0 < x - (1 - s ^ 2) := by rw [heq]; nlinarith [mul_pos hs0 hs0]
        have t1' : 0 < s ^ 2 * (3 - s ^ 2) * (x - (1 - s ^ 2)) :=
          mul_pos (mul_pos hs2 h3p) hgqpos
        have t2 : 0 ≤ 3 * s ^ 2 * (1 - s ^ 2) * (1 - x) :=
          mul_nonneg (mul_nonneg (by positivity) (le_of_lt h1mp)) hw
        linarith
    linarith [hid, hstrict]
  have hsq : (s ^ 2 * x) ^ 2 < (2 * (ay * y)) ^ 2 := by rw [h4]; exact hcore
  have hfin : s ^ 2 * x < 2 * (ay * y) :=
    lt_of_pow_lt_pow_left₀ 2 (by positivity) hsq
  nlinarith [hfin]

/-- The squared-distance coordinate dictionary in the plane (shared by the L6
vector wrappers): `dist X Y ^ 2 = (X 0 − Y 0)² + (X 1 − Y 1)²`. -/
private theorem dist_sq_coords (X Y : ℝ²) :
    dist X Y ^ 2 = (X 0 - Y 0) ^ 2 + (X 1 - Y 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, PiLp.sub_apply, Real.norm_eq_abs, sq_abs]

/-- Shared extraction of the pinned scalar data from the b₂ Family-A vector
hypotheses: produces `a₂x = 1 − s²/2`, the two circle equations, and the
non-obtuse lens bounds `1 − s² ≤ v₃x ≤ 1`. -/
private theorem familyA_scalar_pins
    (v₁ v₂ v₃ a₂ : ℝ²) (s : ℝ)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (ha2v1 : dist a₂ v₁ = 1) (ha2v2 : dist a₂ v₂ = s) (hv3v2 : dist v₃ v₂ = s)
    (hno2 : 0 ≤ (inner ℝ (v₁ - v₂) (v₃ - v₂) : ℝ))
    (hno3 : 0 ≤ (inner ℝ (v₁ - v₃) (v₂ - v₃) : ℝ)) :
    a₂ 0 = 1 - s ^ 2 / 2 ∧ (a₂ 0) ^ 2 + (a₂ 1) ^ 2 = 1 ∧
      (v₃ 0 - 1) ^ 2 + (v₃ 1) ^ 2 = s ^ 2 ∧
      1 - s ^ 2 ≤ v₃ 0 ∧ v₃ 0 ≤ 1 := by
  have hcirc : (a₂ 0) ^ 2 + (a₂ 1) ^ 2 = 1 := by
    have h := dist_sq_coords a₂ v₁
    rw [ha2v1, h1x, h1y] at h; norm_num at h; linarith [h]
  have ha2v2sq : (a₂ 0 - 1) ^ 2 + (a₂ 1) ^ 2 = s ^ 2 := by
    have h := dist_sq_coords a₂ v₂
    rw [ha2v2, h2x, h2y] at h; linarith [h]
  have hv3v2sq : (v₃ 0 - 1) ^ 2 + (v₃ 1) ^ 2 = s ^ 2 := by
    have h := dist_sq_coords v₃ v₂
    rw [hv3v2, h2x, h2y] at h; linarith [h]
  have hax : a₂ 0 = 1 - s ^ 2 / 2 := by nlinarith [hcirc, ha2v2sq]
  have hxhi : v₃ 0 ≤ 1 := by
    rw [PiLp.inner_apply] at hno2
    simp only [Fin.sum_univ_two, PiLp.sub_apply, h1x, h1y, h2x, h2y,
      RCLike.inner_apply, conj_trivial] at hno2
    nlinarith [hno2]
  have hxlo : 1 - s ^ 2 ≤ v₃ 0 := by
    rw [PiLp.inner_apply] at hno3
    simp only [Fin.sum_univ_two, PiLp.sub_apply, h1x, h1y, h2x, h2y,
      RCLike.inner_apply, conj_trivial] at hno3
    nlinarith [hno3, hv3v2sq]
  exact ⟨hax, hcirc, hv3v2sq, hxlo, hxhi⟩

/-- **L6.1 `familyA_a2v3_sq_lt_one` (the load-bearing chord inequality, PROVEN,
uniform).**  In the normalized non-obtuse frame with the b₂ upper-intersection
pins (`dist a₂ v₁ = 1`, `dist a₂ v₂ = dist v₃ v₂ = s`, `a₂y, v₃y > 0`,
non-obtuse `v₃`), the chord from `a₂` to `v₃` satisfies `dist a₂ v₃ ^ 2 < 1`.

This is §6.1/§6.2 of the b₂-residual-attack doc: the Family-A `{v₃,v₁}` sign
fact, with robust margin (≈ 0.11 on `dist²`, never approaching 1). -/
theorem familyA_a2v3_sq_lt_one
    (v₁ v₂ v₃ a₂ : ℝ²) (s : ℝ)
    (hs0 : 0 < s) (hs1 : s < 1)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (ha2v1 : dist a₂ v₁ = 1) (ha2v2 : dist a₂ v₂ = s) (hv3v2 : dist v₃ v₂ = s)
    (ha2y : 0 < a₂ 1) (hv3y : 0 < v₃ 1)
    (hno2 : 0 ≤ (inner ℝ (v₁ - v₂) (v₃ - v₂) : ℝ))
    (hno3 : 0 ≤ (inner ℝ (v₁ - v₃) (v₂ - v₃) : ℝ)) :
    dist a₂ v₃ ^ 2 < 1 := by
  obtain ⟨hax, hcirc, hv3v2sq, hxlo, hxhi⟩ :=
    familyA_scalar_pins v₁ v₂ v₃ a₂ s h1x h1y h2x h2y
      ha2v1 ha2v2 hv3v2 hno2 hno3
  rw [dist_sq_coords]
  exact familyA_lt_one_scalar s (a₂ 0) (a₂ 1) (v₃ 0) (v₃ 1) hs0 hs1 hax hcirc
    hv3v2sq ha2y hv3y hxlo hxhi

/-- **L6.1′ `familyA_a2v3_sq_lt_ssq` (the tighter `< s²` chord inequality,
PROVEN, uniform).**  Same frame; the chord is shorter than the radius `s`:
`dist a₂ v₃ ^ 2 < s ^ 2`.  This is the §6.3 Family-A `{v₃,v₂}` branch; it is
quantitatively tight near the lens corner but closes with an exact certificate. -/
theorem familyA_a2v3_sq_lt_ssq
    (v₁ v₂ v₃ a₂ : ℝ²) (s : ℝ)
    (hs0 : 0 < s) (hs1 : s < 1)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (ha2v1 : dist a₂ v₁ = 1) (ha2v2 : dist a₂ v₂ = s) (hv3v2 : dist v₃ v₂ = s)
    (ha2y : 0 < a₂ 1) (hv3y : 0 < v₃ 1)
    (hno2 : 0 ≤ (inner ℝ (v₁ - v₂) (v₃ - v₂) : ℝ))
    (hno3 : 0 ≤ (inner ℝ (v₁ - v₃) (v₂ - v₃) : ℝ)) :
    dist a₂ v₃ ^ 2 < s ^ 2 := by
  obtain ⟨hax, hcirc, hv3v2sq, hxlo, hxhi⟩ :=
    familyA_scalar_pins v₁ v₂ v₃ a₂ s h1x h1y h2x h2y
      ha2v1 ha2v2 hv3v2 hno2 hno3
  rw [dist_sq_coords]
  exact familyA_lt_ssq_scalar s (a₂ 0) (a₂ 1) (v₃ 0) (v₃ 1) hs0 hs1 hax hcirc
    hv3v2sq ha2y hv3y hxlo hxhi

/-- **L6.2 `qEqE_b2_familyA_v1v3` (Family-A `{v₃,v₁}` obstruction corollary,
PROVEN, uniform; L5 idiom).**  Under the b₂ Family-A frame, if a K4 class at
`a₂` contains both `v₃` and `v₁` — i.e. `dist a₂ v₃ = dist a₂ v₁` (the common
radius forced by K4@a₂) — then `False`, because the pin `dist a₂ v₁ = 1` would
force `dist a₂ v₃ ^ 2 = 1`, contradicting `familyA_a2v3_sq_lt_one`.

This is the form the b₂ closure consumes for every residual pair whose `a₂`
K4-class satisfies `Sa₂ ⊇ {v₃, v₁}`.  Immediate from `familyA_a2v3_sq_lt_one`. -/
theorem qEqE_b2_familyA_v1v3
    (v₁ v₂ v₃ a₂ : ℝ²) (s : ℝ)
    (hs0 : 0 < s) (hs1 : s < 1)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (ha2v1 : dist a₂ v₁ = 1) (ha2v2 : dist a₂ v₂ = s) (hv3v2 : dist v₃ v₂ = s)
    (ha2y : 0 < a₂ 1) (hv3y : 0 < v₃ 1)
    (hno2 : 0 ≤ (inner ℝ (v₁ - v₂) (v₃ - v₂) : ℝ))
    (hno3 : 0 ≤ (inner ℝ (v₁ - v₃) (v₂ - v₃) : ℝ))
    (hK4 : dist a₂ v₃ = dist a₂ v₁) :
    False := by
  have hlt : dist a₂ v₃ ^ 2 < 1 :=
    familyA_a2v3_sq_lt_one v₁ v₂ v₃ a₂ s hs0 hs1 h1x h1y h2x h2y
      ha2v1 ha2v2 hv3v2 ha2y hv3y hno2 hno3
  have heq : dist a₂ v₃ ^ 2 = 1 := by rw [hK4, ha2v1]; norm_num
  rw [heq] at hlt; exact lt_irrefl 1 hlt

/-- **L6.2′ `qEqE_b2_familyA_v2v3` (Family-A `{v₃,v₂}` obstruction corollary,
PROVEN, uniform; L5 idiom).**  Under the b₂ Family-A frame, if a K4 class at
`a₂` contains both `v₃` and `v₂` — i.e. `dist a₂ v₃ = dist a₂ v₂` — then
`False`: the pin `dist a₂ v₂ = s` forces `dist a₂ v₃ ^ 2 = s²`, contradicting
the tighter `familyA_a2v3_sq_lt_ssq`.  Closes every residual pair with
`Sa₂ ⊇ {v₃, v₂}`. -/
theorem qEqE_b2_familyA_v2v3
    (v₁ v₂ v₃ a₂ : ℝ²) (s : ℝ)
    (hs0 : 0 < s) (hs1 : s < 1)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (ha2v1 : dist a₂ v₁ = 1) (ha2v2 : dist a₂ v₂ = s) (hv3v2 : dist v₃ v₂ = s)
    (ha2y : 0 < a₂ 1) (hv3y : 0 < v₃ 1)
    (hno2 : 0 ≤ (inner ℝ (v₁ - v₂) (v₃ - v₂) : ℝ))
    (hno3 : 0 ≤ (inner ℝ (v₁ - v₃) (v₂ - v₃) : ℝ))
    (hK4 : dist a₂ v₃ = dist a₂ v₂) :
    False := by
  have hlt : dist a₂ v₃ ^ 2 < s ^ 2 :=
    familyA_a2v3_sq_lt_ssq v₁ v₂ v₃ a₂ s hs0 hs1 h1x h1y h2x h2y
      ha2v1 ha2v2 hv3v2 ha2y hv3y hno2 hno3
  have heq : dist a₂ v₃ ^ 2 = s ^ 2 := by rw [hK4, ha2v2]
  rw [heq] at hlt; exact lt_irrefl (s ^ 2) hlt

/- ## L7 — the s = t Family-A branch (`Sb₂ ⊇ {v₂,v₃}`), convex-load-bearing

This is the one Family-A pattern NOT closable by a pure metric chord clash
(unlike L6's `{v₃,v₁}` / `{v₃,v₂}` a₂-side branches).  The K4@b₂ class
`Sb₂ ⊇ {v₂,v₃}` forces `|b₂v₂| = |b₂v₃|`; with the pin `|b₂v₂| = s` this gives
`|b₂v₃| = s`, i.e. **`t = s`** — so `b₂` lies on
`circle(v₂,s) ∩ circle(v₃,s)`, the two equal-radius circles through `v₃`.

The two intersection points are the two equilateral apexes of segment `v₂v₃`.
The far apex `P2` (with `power_Γ > 0`) is **always strictly outside the MEC
disk**, so `disk_contains_A` forces `b₂` to be the **v₁-side apex `P1`**.  Under
the lens region `λ₂ ≥ 0` (a base-only condition on `v₃`) the point `P1` is
trapped in `triangle(v₁,v₂,v₃) ⊆ conv(A∖{b₂})`, contradicting `ConvexIndep`.

**This branch genuinely requires `ConvexIndep`** (a standing field of
`FiniteEndpointShell`): the 6 pins + `t=s` + disk + 9-distinctness are
satisfiable WITHOUT convexity (z3-SAT at interior bases), so convexity is
load-bearing — see `docs/n-lane/97-n4d-familyA-st-branch-lean.md`.  L7 covers
the region `λ₂ ≥ 0` (the `Sb₂={v₂,v₃,a₁,b₁}` residual pairs `i=1945`/`i=2110`
are in this region); the complementary `λ₂ < 0` lens corner needs a
larger-support convex emptiness argument and is NOT closed here. -/

/-- **L7 scalar core — `b₂` is the v₁-side equilateral apex `P1` (y-coordinate).**
Under the `s=t` two-circle pins (`(bx,bw)` on both `circle(v₂,s)` and
`circle(v₃,s)`) plus disk-membership (the half-plane `(bx−X)/2 − Oy(bw−Y) ≤ 0`
through `v₃` with `Oy = (X²−X+Y²)/(2Y)`), `bw = Y/2 + √3(X−1)/2`.  The far apex
is excluded because it has strictly positive MEC power. -/
private theorem st_b2_apex_y (bx bw X Y Oy : ℝ)
    (hc1 : (bx-1)^2 + bw^2 = (X-1)^2+Y^2)
    (hc2 : (bx-X)^2 + (bw-Y)^2 = (X-1)^2+Y^2)
    (hY : 0 < Y) (_hbw : 0 < bw)
    (hdisk : (bx - X)/2 - Oy*(bw - Y) ≤ 0)
    (hOy : Oy = (X^2 - X + Y^2)/(2*Y))
    (hX0 : 0 < X) (hXlt : X < 1) :
    bw = Y/2 + Real.sqrt 3 * (X-1)/2 := by
  set r3 := Real.sqrt 3 with hr3
  have hr3sq : r3^2 = 3 := Real.sq_sqrt (by norm_num)
  have hr3pos : 0 < r3 := Real.sqrt_pos.mpr (by norm_num)
  have hs2pos : 0 < (X-1)^2+Y^2 := by nlinarith [sq_nonneg (X-1), mul_pos hY hY]
  have hprodred : ((X-1)^2+Y^2) * (bw^2 - Y*bw + (Y^2/4 - 3*(X-1)^2/4)) = 0 := by
    have e1 : (bx-1)^2 + bw^2 - ((X-1)^2+Y^2) = 0 := by linarith [hc1]
    have e2 : (bx-X)^2 + (bw-Y)^2 - ((X-1)^2+Y^2) = 0 := by linarith [hc2]
    linear_combination (3*X^2/4 - X - Y^2/4 + 1/4 + (1/2 - X/2)*bx + Y/2*bw) * e1
      + (X^2/4 - X + Y^2/4 + 3/4 + (X/2 - 1/2)*bx + (-Y/2)*bw) * e2
  have hroots : bw^2 - Y*bw + (Y^2/4 - 3*(X-1)^2/4) = 0 := by
    rcases mul_eq_zero.mp hprodred with h | h
    · exfalso; nlinarith [h, hs2pos]
    · exact h
  have hfact : (bw - (Y/2 + r3*(X-1)/2)) * (bw - (Y/2 - r3*(X-1)/2)) = 0 := by
    have hexp : (bw - (Y/2 + r3*(X-1)/2)) * (bw - (Y/2 - r3*(X-1)/2))
        = bw^2 - Y*bw + (Y^2/4 - r3^2*(X-1)^2/4) := by ring
    rw [hexp, hr3sq]; linarith [hroots]
  rcases mul_eq_zero.mp hfact with h | h
  · linarith [h]
  · exfalso
    have hbweq : bw = Y/2 - r3*(X-1)/2 := by linarith [h]
    have hrad : 2*(X-1)*bx - (X^2+Y^2-2*Y*bw-1) = 0 := by nlinarith [hc1, hc2]
    have hne : (X - 1) ≠ 0 := by intro hh; linarith
    have hbw0 : bw - (Y/2 - r3*(X-1)/2) = 0 := by linarith [hbweq]
    have hdY : 2*Y*((bx - X)/2 - Oy*(bw - Y)) = Y*(bx-X) - (X^2-X+Y^2)*(bw-Y) := by
      rw [hOy]; field_simp
    have h4 : (X-1) * (2*(Y*(bx-X) - (X^2-X+Y^2)*(bw-Y)) - (r3*X+Y)*((X-1)^2+Y^2)) = 0 := by
      linear_combination Y * hrad + (2*X*(-X^2 + 2*X - Y^2 - 1)) * hbw0
    have hkey : 2*(Y*(bx-X) - (X^2-X+Y^2)*(bw-Y)) - (r3*X+Y)*((X-1)^2+Y^2) = 0 := by
      rcases mul_eq_zero.mp h4 with hh | hh
      · exact absurd hh hne
      · exact hh
    have hpos : 0 < (r3*X+Y)*((X-1)^2+Y^2) := mul_pos (by positivity) hs2pos
    have hdle : 2*Y*((bx - X)/2 - Oy*(bw - Y)) ≤ 0 := by
      have h2Y : (0:ℝ) ≤ 2*Y := by positivity
      have := mul_le_mul_of_nonneg_left hdisk h2Y
      simpa using this
    rw [hdY] at hdle
    linarith [hkey, hpos, hdle]

/-- **L7 scalar core — `b₂`'s x-coordinate (`P1x`).**  From the radical axis of
the two equal-radius circles plus the `P1y` value, `bx = X/2 − √3·Y/2 + 1/2`. -/
private theorem st_b2_apex_x (bx bw X Y : ℝ)
    (hc1 : (bx-1)^2 + bw^2 = (X-1)^2+Y^2)
    (hc2 : (bx-X)^2 + (bw-Y)^2 = (X-1)^2+Y^2)
    (_hY : 0 < Y) (hXlt : X < 1)
    (hbweq : bw = Y/2 + Real.sqrt 3 * (X-1)/2) :
    bx = X/2 - Real.sqrt 3 * Y/2 + 1/2 := by
  set r3 := Real.sqrt 3 with hr3
  have hr3sq : r3^2 = 3 := Real.sq_sqrt (by norm_num)
  have hrad : 2*(X-1)*bx - (X^2+Y^2-2*Y*bw-1) = 0 := by nlinarith [hc1, hc2]
  have hne : (X - 1) ≠ 0 := by intro hh; linarith
  have hbw0 : bw - (Y/2 + r3*(X-1)/2) = 0 := by rw [hbweq]; ring
  have heq : (X-1) * (bx - (X/2 - r3*Y/2 + 1/2)) = 0 := by
    linear_combination (1/2) * hrad + (-Y) * hbw0
  rcases mul_eq_zero.mp heq with hh | hh
  · exact absurd hh hne
  · linarith [hh]

/-- **L7 membership core — `b₂ ∈ triangle(v₁,v₂,v₃)` from barycentric signs.**
With the normalized frame, `b₂` has barycentric weights `λ₁,λ₂,λ₃` summing to 1
where `λ₃ = b₂y/v₃y ≥ 0` follows from `b₂y > 0`; the hypotheses `λ₂ ≥ 0`,
`λ₁ ≥ 0` are supplied (the lens region condition). -/
private theorem mem_tri_of_bary (v₁ v₂ v₃ b₂ : ℝ²)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (hY : 0 < v₃ 1) (hby : 0 < b₂ 1)
    (hl2 : 0 ≤ b₂ 0 - v₃ 0 * (b₂ 1) / (v₃ 1))
    (hl1 : 0 ≤ 1 - b₂ 0 + (v₃ 0 - 1) * (b₂ 1) / (v₃ 1)) :
    b₂ ∈ convexHull ℝ ({v₁, v₂, v₃} : Set ℝ²) := by
  set L3 := b₂ 1 / v₃ 1 with hL3
  set L2 := b₂ 0 - v₃ 0 * (b₂ 1) / (v₃ 1) with hL2
  set L1 := 1 - b₂ 0 + (v₃ 0 - 1) * (b₂ 1) / (v₃ 1) with hL1
  have hL3nn : 0 ≤ L3 := le_of_lt (div_pos hby hY)
  refine mem_convexHull_of_exists_fintype
    (![L1, L2, L3]) (![v₁, v₂, v₃]) ?_ ?_ ?_ ?_
  · intro i; fin_cases i <;> simp_all
  · simp only [Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons]
    rw [hL1, hL2, hL3]; field_simp; ring
  · intro i; fin_cases i <;> simp
  · simp only [Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons]
    have hcomp : (L1 • v₁ + L2 • v₂ + L3 • v₃) 0 = b₂ 0 ∧
                 (L1 • v₁ + L2 • v₂ + L3 • v₃) 1 = b₂ 1 := by
      simp only [PiLp.add_apply, PiLp.smul_apply, smul_eq_mul, h1x, h1y, h2x, h2y]
      rw [hL1, hL2, hL3]
      constructor <;> · field_simp; ring
    apply PiLp.ext
    intro k
    fin_cases k
    · exact hcomp.1
    · exact hcomp.2

/-- **L7 `qEqE_b2_familyA_st` (the s=t Family-A obstruction, CONDITIONAL,
convex-load-bearing).**  Under the normalized non-obtuse frame with the b₂
selector pins, the K4@b₂ `s=t` equality (`|b₂v₃| = |b₂v₂| = s`, supplied here as
`dist b₂ v₃ = s`), disk-membership (the MEC center `O` from the three
circumcircle equations + the half-plane `⟪b₂−v₃, v₂−O⟫ ≤ 0`), the lens region
condition `λ₂ ≥ 0`, and `ConvexIndep A` with the relevant memberships and
9-distinctness `≠` facts, we derive `False`.

The mechanism: `s=t` ⟹ `b₂ ∈ circle(v₂,s) ∩ circle(v₃,s)`; disk ⟹ `b₂` is the
v₁-side equilateral apex `P1` (`st_b2_apex_{y,x}`); `λ₂ ≥ 0` ⟹
`b₂ ∈ triangle(v₁,v₂,v₃) ⊆ conv(A∖{b₂})`, contradicting `ConvexIndep`.

**Scope.** The hypothesis `hregion : 0 ≤ √3·v₃x(1−v₃x) + v₃y(1−√3·v₃y)`
(`λ₂ ≥ 0`) is a base-only condition on `v₃`, NOT the conclusion; it holds on the
majority lens sub-region that contains the residual `s=t` pairs.  The
complementary corner (`λ₂ < 0`, `v₃` near the `s→1` boundary) is left OPEN — it
requires a larger-support convex-position argument (as-hard-as-parent). -/
theorem qEqE_b2_familyA_st
    (v₁ v₂ v₃ b₂ O : ℝ²) (s R : ℝ)
    (_hs0 : 0 < s)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (hv3y : 0 < v₃ 1) (hby : 0 < b₂ 1)
    (hX0 : 0 < v₃ 0) (hXlt : v₃ 0 < 1)
    (hb2v2 : dist b₂ v₂ = s) (hv3v2 : dist v₃ v₂ = s) (hb2v3 : dist b₂ v₃ = s)
    (e1 : ‖v₁ - O‖ = R) (e2 : ‖v₂ - O‖ = R) (e3 : ‖v₃ - O‖ = R)
    (hdiskhp : (inner ℝ (b₂ - v₃) (v₂ - O) : ℝ) ≤ 0)
    (hregion : 0 ≤ Real.sqrt 3 * v₃ 0 * (1 - v₃ 0) + v₃ 1 * (1 - Real.sqrt 3 * v₃ 1))
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (hb2A : b₂ ∈ A) (h1A : v₁ ∈ A) (h2A : v₂ ∈ A) (h3A : v₃ ∈ A)
    (hb21 : b₂ ≠ v₁) (hb22 : b₂ ≠ v₂) (hb23 : b₂ ≠ v₃) :
    False := by
  set X := v₃ 0 with hXdef
  set Y := v₃ 1 with hYdef
  have hs2 : (X-1)^2 + Y^2 = s^2 := by
    have h := dist_sq_coords v₃ v₂
    rw [hv3v2, h2x, h2y] at h; rw [hXdef, hYdef]; nlinarith [h]
  have hc1 : (b₂ 0 - 1)^2 + (b₂ 1)^2 = (X-1)^2 + Y^2 := by
    have h := dist_sq_coords b₂ v₂
    rw [hb2v2, h2x, h2y] at h; rw [hs2]; nlinarith [h]
  have hc2 : (b₂ 0 - X)^2 + (b₂ 1 - Y)^2 = (X-1)^2 + Y^2 := by
    have h := dist_sq_coords b₂ v₃
    rw [hb2v3] at h; rw [hs2]; rw [hXdef, hYdef]; nlinarith [h]
  have hOx : O 0 = 1 / 2 := mec_circumcenter_x v₁ v₂ O R h1x h1y h2x h2y e1 e2
  have hOy : O 1 = (X^2 - X + Y^2)/(2*Y) := by
    have := mec_circumcenter_y v₁ v₃ O R h1x h1y hv3y hOx e1 e3
    rw [hXdef, hYdef]; exact this
  have hdisk : (b₂ 0 - X)/2 - (O 1)*(b₂ 1 - Y) ≤ 0 := by
    rw [PiLp.inner_apply] at hdiskhp
    simp only [Fin.sum_univ_two, PiLp.sub_apply, h2x, h2y, hOx,
      RCLike.inner_apply, conj_trivial] at hdiskhp
    rw [hXdef, hYdef]; linarith [hdiskhp]
  have hbwy : b₂ 1 = Y/2 + Real.sqrt 3 * (X-1)/2 :=
    st_b2_apex_y (b₂ 0) (b₂ 1) X Y (O 1) hc1 hc2 hv3y hby hdisk hOy hX0 hXlt
  have hbwx : b₂ 0 = X/2 - Real.sqrt 3 * Y/2 + 1/2 :=
    st_b2_apex_x (b₂ 0) (b₂ 1) X Y hc1 hc2 hv3y hXlt hbwy
  set r3 := Real.sqrt 3 with hr3
  have hr3pos : 0 < r3 := Real.sqrt_pos.mpr (by norm_num)
  have hr3sq : r3^2 = 3 := Real.sq_sqrt (by norm_num)
  have hl2 : 0 ≤ b₂ 0 - X * (b₂ 1) / Y := by
    rw [hbwx, hbwy]
    rw [show X / 2 - r3 * Y / 2 + 1 / 2 - X * (Y / 2 + r3 * (X - 1) / 2) / Y
        = (r3 * X * (1 - X) + Y * (1 - r3 * Y)) / (2 * Y) by field_simp; ring]
    exact div_nonneg hregion (by positivity)
  have hl1 : 0 ≤ 1 - b₂ 0 + (X - 1) * (b₂ 1) / Y := by
    rw [hbwx, hbwy]
    rw [show 1 - (X / 2 - r3 * Y / 2 + 1 / 2) + (X - 1) * (Y / 2 + r3 * (X - 1) / 2) / Y
        = (r3 * ((X - 1)^2 + Y^2)) / (2 * Y) by
          rw [eq_div_iff (by positivity)]; field_simp; ring]
    exact div_nonneg (by positivity) (by positivity)
  have hmem : b₂ ∈ convexHull ℝ ({v₁, v₂, v₃} : Set ℝ²) := by
    have h2 : 0 ≤ b₂ 0 - v₃ 0 * (b₂ 1) / (v₃ 1) := by rw [← hXdef, ← hYdef]; exact hl2
    have h1 : 0 ≤ 1 - b₂ 0 + (v₃ 0 - 1) * (b₂ 1) / (v₃ 1) := by rw [← hXdef, ← hYdef]; exact hl1
    exact mem_tri_of_bary v₁ v₂ v₃ b₂ h1x h1y h2x h2y hv3y hby h2 h1
  have hsub : ({v₁, v₂, v₃} : Set ℝ²) ⊆ (↑A : Set ℝ²) \ {b₂} := by
    intro x hx
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hx
    refine ⟨?_, ?_⟩
    · rcases hx with rfl | rfl | rfl
      · exact_mod_cast h1A
      · exact_mod_cast h2A
      · exact_mod_cast h3A
    · rcases hx with rfl | rfl | rfl
      · exact fun h => hb21 h.symm
      · exact fun h => hb22 h.symm
      · exact fun h => hb23 h.symm
  have hmemA : b₂ ∈ convexHull ℝ ((↑A : Set ℝ²) \ {b₂}) := convexHull_mono hsub hmem
  exact hconv b₂ (by exact_mod_cast hb2A) hmemA

/- ## L8 — the `λ₂ < 0` corner: the `{v₁,v₂,v₃}` simplex trap provably FAILS

The L7 closer traps `b₂ = P1` inside `triangle(v₁,v₂,v₃)` under `λ₂ ≥ 0`.  The
complementary corner `λ₂ < 0` (`v₃` near the equilateral / `s→1` tip) is *not*
closable that way, and the reason is sharp and PROVEN here: in that regime `P1`
lies **strictly on the `v₂`-far side of the edge line `v₁v₃`**, hence is **not**
in `conv{v₁,v₂,v₃}` at all.  So the simplex-trap mechanism cannot be extended to
the corner — any closure there must use a *different* (larger-support) argument.

The separating functional is `g(p) = (v₃y)·p₀ − (v₃x)·p₁`, which vanishes on the
line through `v₁=(0,0)` and `v₃`, is `> 0` at `v₂=(1,0)` (so `≥ 0` on the whole
triangle), but is **`< 0` at `P1`**:  the exact identity
`g(P1) = (√3·X(1−X) + Y(1−√3·Y))/2 = λ₂/2`, so `λ₂ < 0 ⟹ g(P1) < 0`.

This `L8` is the rigorous in-Lean record of the corner obstruction documented in
`docs/n-lane/97-n4d-st-corner-lean.md`: the corner is genuinely occupied by
admissible `ConvexIndep` configurations (so it is *not* vacuously closed), and
no named-simplex trap of the determined points `{v₁,v₂,v₃,a₂}` catches `P1`
uniformly across it.  The corner therefore reduces to the larger-support
K4@b₂ class emptiness (the `(★)` core), not to a discrete incidence. -/

/-- The edge-`v₁v₃` separating functional `g(p) = Y·p₀ − X·p₁` is `ℝ`-linear. -/
private theorem edge_functional_linear (X Y : ℝ) :
    IsLinearMap ℝ (fun p : ℝ² => Y * p 0 - X * p 1) := by
  constructor
  · intro p q
    simp only [PiLp.add_apply]; ring
  · intro c p
    simp only [PiLp.smul_apply, smul_eq_mul]; ring

/-- **L8 separation core.**  If the edge functional `g(b₂) = v₃y·b₂x − v₃x·b₂y`
is strictly negative, then `b₂ ∉ conv{v₁,v₂,v₃}`.  (`g ≥ 0` on the triangle: it
vanishes at `v₁,v₃` and equals `v₃y > 0` at `v₂`, and the half-space `{g ≥ 0}`
is convex, so it contains the hull.) -/
private theorem b2_not_mem_tri_of_sep (v₁ v₂ v₃ b₂ : ℝ²)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (hY : 0 < v₃ 1)
    (hsep : v₃ 1 * (b₂ 0) - v₃ 0 * (b₂ 1) < 0) :
    b₂ ∉ convexHull ℝ ({v₁, v₂, v₃} : Set ℝ²) := by
  intro hmem
  have hconvex : Convex ℝ {w : ℝ² | (0:ℝ) ≤ v₃ 1 * w 0 - v₃ 0 * w 1} :=
    convex_halfSpace_ge (edge_functional_linear (v₃ 0) (v₃ 1)) 0
  have hsub : ({v₁, v₂, v₃} : Set ℝ²) ⊆ {w : ℝ² | (0:ℝ) ≤ v₃ 1 * w 0 - v₃ 0 * w 1} := by
    intro x hx
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hx
    simp only [Set.mem_setOf_eq]
    rcases hx with rfl | rfl | rfl
    · rw [h1x, h1y]; nlinarith
    · rw [h2x, h2y]; nlinarith [hY]
    · nlinarith
  have hmem' : b₂ ∈ {w : ℝ² | (0:ℝ) ≤ v₃ 1 * w 0 - v₃ 0 * w 1} :=
    convexHull_min hsub hconvex hmem
  simp only [Set.mem_setOf_eq] at hmem'
  linarith [hsep]

/-- **L8 `st_b2_apex_not_mem_tri` (the corner obstruction, PROVEN, uniform).**
Under the same `s=t` apex pins as L7 that pin `b₂ = P1` (so `b₂` has the apex
coordinates `b₂x = X/2 − √3·Y/2 + 1/2`, `b₂y = Y/2 + √3·(X−1)/2`), if the lens
region value is **strictly negative** (`λ₂ < 0`, the corner condition), then
`b₂ ∉ convexHull{v₁,v₂,v₃}`.

This is the exact complement of L7's `mem_tri_of_bary`: the `{v₁,v₂,v₃}` simplex
trap **fails** precisely on `λ₂ < 0`.  Consequently the L7 region hypothesis
`hregion : 0 ≤ λ₂` is *not removable* — it is the sharp boundary of the simplex
trap, and the corner needs a genuinely different (larger-support) closure. -/
theorem st_b2_apex_not_mem_tri (v₁ v₂ v₃ b₂ : ℝ²) (X Y : ℝ)
    (hXdef : X = v₃ 0) (hYdef : Y = v₃ 1)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (hY : 0 < v₃ 1)
    (hbwx : b₂ 0 = X/2 - Real.sqrt 3 * Y/2 + 1/2)
    (hbwy : b₂ 1 = Y/2 + Real.sqrt 3 * (X-1)/2)
    (hcorner : Real.sqrt 3 * X * (1 - X) + Y * (1 - Real.sqrt 3 * Y) < 0) :
    b₂ ∉ convexHull ℝ ({v₁, v₂, v₃} : Set ℝ²) := by
  set r3 := Real.sqrt 3 with hr3
  have hsep : v₃ 1 * (b₂ 0) - v₃ 0 * (b₂ 1) < 0 := by
    rw [← hXdef, ← hYdef, hbwx, hbwy]
    have hid : Y * (X/2 - r3 * Y/2 + 1/2) - X * (Y/2 + r3 * (X-1)/2)
        = (r3 * X * (1 - X) + Y * (1 - r3 * Y)) / 2 := by ring
    rw [hid]; linarith [hcorner]
  exact b2_not_mem_tri_of_sep v₁ v₂ v₃ b₂ h1x h1y h2x h2y hY hsep

/- ## L9 — Family-B radius-s `rb=s` root-plus second-chord kernel

This is the explicit two-circle geometry used by the q'=E Family-B radius-s
`rb=s` closer: once `b₂` is pinned to the surviving root `root₊`, the circle
`circle(v₂,s)` meets `circle(b₂,s)` in exactly two points, namely the selector
point `a₂` and a second apex strictly below the x-axis.  So any **upper** point
on both circles must equal `a₂`.

The public theorem below is the reusable geometric heart of the closer.  It
does not yet prove that an arbitrary `(hRs, hb2_disk)` witness is *at* the
`root₊` coordinates; that bridge is the next slice. -/

private noncomputable def familyBRadiusSA2Point (s : ℝ) : ℝ² :=
  vec2 (1 - s ^ 2 / 2) (s * Real.sqrt (4 - s ^ 2) / 2)

private noncomputable def familyBRadiusSRootPlusB2Point (s : ℝ) : ℝ² :=
  vec2
    (1 - s ^ 2 / 4 - Real.sqrt 3 * s * Real.sqrt (4 - s ^ 2) / 4)
    (s * Real.sqrt (4 - s ^ 2) / 4 - Real.sqrt 3 * s ^ 2 / 4)

private noncomputable def familyBRadiusSRootMinusB2Point (s : ℝ) : ℝ² :=
  vec2
    (1 - s ^ 2 / 4 + Real.sqrt 3 * s * Real.sqrt (4 - s ^ 2) / 4)
    (s * Real.sqrt (4 - s ^ 2) / 4 + Real.sqrt 3 * s ^ 2 / 4)

private noncomputable def familyBRadiusSRootPlusOtherApex (s : ℝ) : ℝ² :=
  vec2
    (1 + s ^ 2 / 4 - Real.sqrt 3 * s * Real.sqrt (4 - s ^ 2) / 4)
    (-s * (Real.sqrt (4 - s ^ 2) + Real.sqrt 3 * s) / 4)

private theorem familyBRadiusS_a2_above_axis
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    0 < (familyBRadiusSA2Point s) 1 := by
  have h4 : 0 < 4 - s ^ 2 := by nlinarith
  have hsqrt4 : 0 < Real.sqrt (4 - s ^ 2) := Real.sqrt_pos.mpr h4
  simp [familyBRadiusSA2Point, vec2, EuclideanSpace.single_apply]
  nlinarith

private theorem familyBRadiusS_rootPlus_otherApex_below_axis
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    (familyBRadiusSRootPlusOtherApex s) 1 < 0 := by
  have h4 : 0 < 4 - s ^ 2 := by nlinarith
  simp [familyBRadiusSRootPlusOtherApex, vec2, EuclideanSpace.single_apply]
  have hsqrt4 : 0 < Real.sqrt (4 - s ^ 2) := Real.sqrt_pos.mpr h4
  have hsqrt3 : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
  nlinarith

private theorem familyBRadiusS_rootPlus_b2_left_of_v2
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    (familyBRadiusSRootPlusB2Point s) 0 < 1 := by
  have h4 : 0 < 4 - s ^ 2 := by nlinarith
  have hsqrt4 : 0 < Real.sqrt (4 - s ^ 2) := Real.sqrt_pos.mpr h4
  have hsqrt3 : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
  have hdrop : 0 < s ^ 2 / 4 + Real.sqrt 3 * s * Real.sqrt (4 - s ^ 2) / 4 := by
    positivity
  simp [familyBRadiusSRootPlusB2Point, vec2, EuclideanSpace.single_apply]
  nlinarith

private theorem familyBRadiusS_selector_y_formula
    (s ay : ℝ)
    (hs0 : 0 < s) (hs1 : s < 1)
    (haysq : ay ^ 2 = s ^ 2 - s ^ 4 / 4)
    (hay_pos : 0 < ay) :
    ay = s * Real.sqrt (4 - s ^ 2) / 2 := by
  have h4 : 0 ≤ 4 - s ^ 2 := by nlinarith
  have hsq : (s * Real.sqrt (4 - s ^ 2) / 2) ^ 2 = s ^ 2 - s ^ 4 / 4 := by
    rw [show (s * Real.sqrt (4 - s ^ 2) / 2) ^ 2
        = s ^ 2 * (Real.sqrt (4 - s ^ 2)) ^ 2 / 4 by ring]
    rw [Real.sq_sqrt h4]
    ring
  have hnonneg : 0 ≤ s * Real.sqrt (4 - s ^ 2) / 2 := by positivity
  nlinarith

private theorem familyBRadiusS_a2_on_v2_circle
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    dist (familyBRadiusSA2Point s) (vec2 1 0) = s := by
  have h4 : 0 ≤ 4 - s ^ 2 := by nlinarith
  have hr3sq : (Real.sqrt 3) ^ 2 = 3 := by
    rw [Real.sq_sqrt]; norm_num
  have hsq :
      dist (familyBRadiusSA2Point s) (vec2 1 0) ^ 2 = s ^ 2 := by
    rw [dist_sq_coords]
    simp [familyBRadiusSA2Point, vec2, EuclideanSpace.single_apply]
    ring_nf
    rw [Real.sq_sqrt h4]
    ring
  have hnonneg : 0 ≤ dist (familyBRadiusSA2Point s) (vec2 1 0) := dist_nonneg
  nlinarith

private theorem familyBRadiusS_rootPlus_on_v2_circle
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    dist (familyBRadiusSRootPlusB2Point s) (vec2 1 0) = s := by
  have h4 : 0 ≤ 4 - s ^ 2 := by nlinarith
  have hr3sq : (Real.sqrt 3) ^ 2 = 3 := by
    rw [Real.sq_sqrt]; norm_num
  have hsq :
      dist (familyBRadiusSRootPlusB2Point s) (vec2 1 0) ^ 2 = s ^ 2 := by
    rw [dist_sq_coords]
    simp [familyBRadiusSRootPlusB2Point, vec2, EuclideanSpace.single_apply]
    ring_nf
    rw [Real.sq_sqrt h4, hr3sq]
    ring
  have hnonneg : 0 ≤ dist (familyBRadiusSRootPlusB2Point s) (vec2 1 0) := dist_nonneg
  nlinarith

private theorem familyBRadiusS_a2_on_rootPlus_b2_circle
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    dist (familyBRadiusSA2Point s) (familyBRadiusSRootPlusB2Point s) = s := by
  have h4 : 0 ≤ 4 - s ^ 2 := by nlinarith
  have hr3sq : (Real.sqrt 3) ^ 2 = 3 := by
    rw [Real.sq_sqrt]; norm_num
  have hsq :
      dist (familyBRadiusSA2Point s) (familyBRadiusSRootPlusB2Point s) ^ 2 = s ^ 2 := by
    rw [dist_sq_coords]
    simp [familyBRadiusSA2Point, familyBRadiusSRootPlusB2Point, vec2,
      EuclideanSpace.single_apply]
    ring_nf
    rw [Real.sq_sqrt h4, hr3sq]
    ring
  have hnonneg : 0 ≤ dist (familyBRadiusSA2Point s) (familyBRadiusSRootPlusB2Point s) :=
    dist_nonneg
  nlinarith

private theorem familyBRadiusS_rootMinus_on_v2_circle
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    dist (familyBRadiusSRootMinusB2Point s) (vec2 1 0) = s := by
  have h4 : 0 ≤ 4 - s ^ 2 := by nlinarith
  have hr3sq : (Real.sqrt 3) ^ 2 = 3 := by
    rw [Real.sq_sqrt]; norm_num
  have hsq :
      dist (familyBRadiusSRootMinusB2Point s) (vec2 1 0) ^ 2 = s ^ 2 := by
    rw [dist_sq_coords]
    simp [familyBRadiusSRootMinusB2Point, vec2, EuclideanSpace.single_apply]
    ring_nf
    rw [Real.sq_sqrt h4, hr3sq]
    ring
  have hnonneg : 0 ≤ dist (familyBRadiusSRootMinusB2Point s) (vec2 1 0) := dist_nonneg
  nlinarith

private theorem familyBRadiusS_a2_on_rootMinus_b2_circle
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    dist (familyBRadiusSA2Point s) (familyBRadiusSRootMinusB2Point s) = s := by
  have h4 : 0 ≤ 4 - s ^ 2 := by nlinarith
  have hr3sq : (Real.sqrt 3) ^ 2 = 3 := by
    rw [Real.sq_sqrt]; norm_num
  have hsq :
      dist (familyBRadiusSA2Point s) (familyBRadiusSRootMinusB2Point s) ^ 2 = s ^ 2 := by
    rw [dist_sq_coords]
    simp [familyBRadiusSA2Point, familyBRadiusSRootMinusB2Point, vec2,
      EuclideanSpace.single_apply]
    ring_nf
    rw [Real.sq_sqrt h4, hr3sq]
    ring
  have hnonneg : 0 ≤ dist (familyBRadiusSA2Point s) (familyBRadiusSRootMinusB2Point s) :=
    dist_nonneg
  nlinarith

private theorem familyBRadiusS_rootMinus_above_axis
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    0 < (familyBRadiusSRootMinusB2Point s) 1 := by
  have h4 : 0 < 4 - s ^ 2 := by nlinarith
  have hsqrt4 : 0 < Real.sqrt (4 - s ^ 2) := Real.sqrt_pos.mpr h4
  have hsqrt3 : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
  simp [familyBRadiusSRootMinusB2Point, vec2, EuclideanSpace.single_apply]
  nlinarith

private theorem familyBRadiusS_otherApex_on_v2_circle
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    dist (familyBRadiusSRootPlusOtherApex s) (vec2 1 0) = s := by
  have h4 : 0 ≤ 4 - s ^ 2 := by nlinarith
  have hr3sq : (Real.sqrt 3) ^ 2 = 3 := by
    rw [Real.sq_sqrt]; norm_num
  have hsq :
      dist (familyBRadiusSRootPlusOtherApex s) (vec2 1 0) ^ 2 = s ^ 2 := by
    rw [dist_sq_coords]
    simp [familyBRadiusSRootPlusOtherApex, vec2, EuclideanSpace.single_apply]
    ring_nf
    rw [Real.sq_sqrt h4, hr3sq]
    ring
  have hnonneg : 0 ≤ dist (familyBRadiusSRootPlusOtherApex s) (vec2 1 0) :=
    dist_nonneg
  nlinarith

private theorem familyBRadiusS_otherApex_on_rootPlus_b2_circle
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    dist (familyBRadiusSRootPlusOtherApex s) (familyBRadiusSRootPlusB2Point s) = s := by
  have h4 : 0 ≤ 4 - s ^ 2 := by nlinarith
  have hr3sq : (Real.sqrt 3) ^ 2 = 3 := by
    rw [Real.sq_sqrt]; norm_num
  have hsq :
      dist (familyBRadiusSRootPlusOtherApex s) (familyBRadiusSRootPlusB2Point s) ^ 2 = s ^ 2 := by
    rw [dist_sq_coords]
    simp [familyBRadiusSRootPlusOtherApex, familyBRadiusSRootPlusB2Point,
      vec2, EuclideanSpace.single_apply]
    ring_nf
    rw [Real.sq_sqrt h4]
    ring
  have hnonneg :
      0 ≤ dist (familyBRadiusSRootPlusOtherApex s) (familyBRadiusSRootPlusB2Point s) := dist_nonneg
  nlinarith

/-- **L9 root-plus upper common-point uniqueness.**  At the explicit surviving
`root₊` position for `b₂`, the two equal-radius circles `circle(v₂,s)` and
`circle(b₂,s)` have exactly two common points: the selector point `a₂`, and a
second apex strictly below the x-axis.  Therefore every **upper** common point
equals `a₂`. -/
theorem qEqE_b2_familyB_radiusS_rootPlus_upper_common_eq_a2
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1)
    (q : ℝ²)
    (hqv2 : dist q (vec2 1 0) = s)
    (hqb2 : dist q (familyBRadiusSRootPlusB2Point s) = s)
    (hqy : 0 < q 1) :
    q = familyBRadiusSA2Point s := by
  let v₂ : ℝ² := vec2 1 0
  let a₂ : ℝ² := familyBRadiusSA2Point s
  let b₂ : ℝ² := familyBRadiusSRootPlusB2Point s
  let w : ℝ² := familyBRadiusSRootPlusOtherApex s
  have hsphere :
      (⟨v₂, s⟩ : Sphere ℝ²) ≠ ⟨b₂, s⟩ := by
    intro h
    have hcenter : v₂ = b₂ := by
      simpa [v₂, b₂] using congrArg (fun S : Sphere ℝ² => S.center) h
    have hx : b₂ 0 < 1 := by
      simpa [b₂] using familyBRadiusS_rootPlus_b2_left_of_v2 s hs0 hs1
    have hv₂x : v₂ 0 = 1 := by simp [v₂, vec2, EuclideanSpace.single_apply]
    rw [← hcenter] at hx
    linarith [hv₂x]
  have ha2v2 : a₂ ∈ (⟨v₂, s⟩ : Sphere ℝ²) := by
    refine EuclideanGeometry.mem_sphere.mpr ?_
    simpa [a₂, v₂] using familyBRadiusS_a2_on_v2_circle s hs0 hs1
  have ha2b2 : a₂ ∈ (⟨b₂, s⟩ : Sphere ℝ²) := by
    refine EuclideanGeometry.mem_sphere.mpr ?_
    simpa [a₂, b₂] using familyBRadiusS_a2_on_rootPlus_b2_circle s hs0 hs1
  have hwv2 : w ∈ (⟨v₂, s⟩ : Sphere ℝ²) := by
    refine EuclideanGeometry.mem_sphere.mpr ?_
    simpa [w, v₂] using familyBRadiusS_otherApex_on_v2_circle s hs0 hs1
  have hwb2 : w ∈ (⟨b₂, s⟩ : Sphere ℝ²) := by
    refine EuclideanGeometry.mem_sphere.mpr ?_
    simpa [w, b₂] using familyBRadiusS_otherApex_on_rootPlus_b2_circle s hs0 hs1
  have hqv2' : q ∈ (⟨v₂, s⟩ : Sphere ℝ²) := EuclideanGeometry.mem_sphere.mpr hqv2
  have hqb2' : q ∈ (⟨b₂, s⟩ : Sphere ℝ²) := EuclideanGeometry.mem_sphere.mpr hqb2
  have haw : a₂ ≠ w := by
    intro h
    have ha2y : 0 < a₂ 1 := by simpa [a₂] using familyBRadiusS_a2_above_axis s hs0 hs1
    have hwy : w 1 < 0 := by simpa [w] using familyBRadiusS_rootPlus_otherApex_below_axis s hs0 hs1
    have hwy_pos : 0 < w 1 := by simpa [h] using ha2y
    linarith
  have hqw : q ≠ w := by
    intro h
    have hwy : w 1 < 0 := by simpa [w] using familyBRadiusS_rootPlus_otherApex_below_axis s hs0 hs1
    have hqy' : 0 < w 1 := by simpa [h] using hqy
    linarith
  rcases two_circle_common_point_eq_endpoint hsphere haw ha2v2 hwv2 ha2b2 hwb2 hqv2' hqb2' with hq | hq
  · simpa [a₂] using hq
  · exact False.elim (hqw hq)

/-- **L9 root-plus second-chord contradiction.**  The uniqueness theorem above
immediately turns an explicit distinctness hypothesis into `False`. -/
theorem qEqE_b2_familyB_radiusS_rootPlus_secondChord
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1)
    (q : ℝ²)
    (hqv2 : dist q (vec2 1 0) = s)
    (hqb2 : dist q (familyBRadiusSRootPlusB2Point s) = s)
    (hqy : 0 < q 1)
    (hqne : q ≠ familyBRadiusSA2Point s) :
    False := by
  exact hqne (qEqE_b2_familyB_radiusS_rootPlus_upper_common_eq_a2 s hs0 hs1 q hqv2 hqb2 hqy)

/-- **L9 root classification for the radius-s pin.**  Under the selector
normal form, a point on both `circle(v₂,s)` and `circle(a₂,s)` is exactly one
of the two radius-s roots `root₊`, `root₋`. -/
theorem qEqE_b2_familyB_radiusS_hRs_eq_root
    (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1)
    (bx yb : ℝ)
    (hb2_circ : (bx - 1) ^ 2 + yb ^ 2 = s ^ 2)
    (hRs : (bx - (1 - s ^ 2 / 2)) ^ 2 + (yb - s * Real.sqrt (4 - s ^ 2) / 2) ^ 2 = s ^ 2) :
    vec2 bx yb = familyBRadiusSRootPlusB2Point s ∨
      vec2 bx yb = familyBRadiusSRootMinusB2Point s := by
  let v₂ : ℝ² := vec2 1 0
  let a₂ : ℝ² := familyBRadiusSA2Point s
  let bPlus : ℝ² := familyBRadiusSRootPlusB2Point s
  let bMinus : ℝ² := familyBRadiusSRootMinusB2Point s
  have hsphere :
      (⟨v₂, s⟩ : Sphere ℝ²) ≠ ⟨a₂, s⟩ := by
    intro h
    have hcenter : v₂ = a₂ := by
      simpa [v₂, a₂] using congrArg (fun S : Sphere ℝ² => S.center) h
    have ha2y : 0 < a₂ 1 := by
      simpa [a₂] using familyBRadiusS_a2_above_axis s hs0 hs1
    have hv₂y : v₂ 1 = 0 := by simp [v₂, vec2, EuclideanSpace.single_apply]
    rw [← hcenter] at ha2y
    linarith [hv₂y]
  have hbplus_v2 : bPlus ∈ (⟨v₂, s⟩ : Sphere ℝ²) := by
    refine mem_sphere.mpr ?_
    simpa [bPlus, v₂] using familyBRadiusS_rootPlus_on_v2_circle s hs0 hs1
  have hbplus_a2 : bPlus ∈ (⟨a₂, s⟩ : Sphere ℝ²) := by
    refine mem_sphere.mpr ?_
    rw [dist_comm]
    simpa [bPlus, a₂] using familyBRadiusS_a2_on_rootPlus_b2_circle s hs0 hs1
  have hbminus_v2 : bMinus ∈ (⟨v₂, s⟩ : Sphere ℝ²) := by
    refine mem_sphere.mpr ?_
    simpa [bMinus, v₂] using familyBRadiusS_rootMinus_on_v2_circle s hs0 hs1
  have hbminus_a2 : bMinus ∈ (⟨a₂, s⟩ : Sphere ℝ²) := by
    refine mem_sphere.mpr ?_
    rw [dist_comm]
    simpa [bMinus, a₂] using familyBRadiusS_a2_on_rootMinus_b2_circle s hs0 hs1
  have hpm : bPlus ≠ bMinus := by
    intro h
    have hxplus : bPlus 0 = 1 - s ^ 2 / 4 - Real.sqrt 3 * s * Real.sqrt (4 - s ^ 2) / 4 := by
      simp [bPlus, familyBRadiusSRootPlusB2Point, vec2, EuclideanSpace.single_apply]
    have hxminus : bMinus 0 = 1 - s ^ 2 / 4 + Real.sqrt 3 * s * Real.sqrt (4 - s ^ 2) / 4 := by
      simp [bMinus, familyBRadiusSRootMinusB2Point, vec2, EuclideanSpace.single_apply]
    have h4 : 0 < 4 - s ^ 2 := by nlinarith
    have hsqrt4 : 0 < Real.sqrt (4 - s ^ 2) := Real.sqrt_pos.mpr h4
    have hsqrt3 : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
    rw [h] at hxplus
    rw [hxminus] at hxplus
    have hzero : Real.sqrt 3 * s * Real.sqrt (4 - s ^ 2) = 0 := by nlinarith [hxplus]
    have hprod : 0 < Real.sqrt 3 * s * Real.sqrt (4 - s ^ 2) := by positivity
    linarith
  have hbq_v2 : vec2 bx yb ∈ (⟨v₂, s⟩ : Sphere ℝ²) := by
    refine mem_sphere.mpr ?_
    have hsq : dist (vec2 bx yb) v₂ ^ 2 = s ^ 2 := by
      rw [dist_sq_coords]
      simp [v₂, vec2, EuclideanSpace.single_apply]
      nlinarith [hb2_circ]
    have hnonneg : 0 ≤ dist (vec2 bx yb) v₂ := dist_nonneg
    nlinarith [hsq]
  have hbq_a2 : vec2 bx yb ∈ (⟨a₂, s⟩ : Sphere ℝ²) := by
    refine mem_sphere.mpr ?_
    have hsq : dist (vec2 bx yb) a₂ ^ 2 = s ^ 2 := by
      rw [dist_sq_coords]
      simpa [a₂, familyBRadiusSA2Point, vec2, EuclideanSpace.single_apply] using hRs
    have hnonneg : 0 ≤ dist (vec2 bx yb) a₂ := dist_nonneg
    nlinarith [hsq]
  rcases two_circle_common_point_eq_endpoint hsphere hpm hbplus_v2 hbminus_v2 hbplus_a2 hbminus_a2
      hbq_v2 hbq_a2 with hq | hq
  · exact Or.inl hq
  · exact Or.inr hq

set_option maxHeartbeats 4000000 in
/-- **L9 root-minus disk failure.**  In the open lens, the explicit `root₋`
point violates the L2 half-plane disk inequality strictly.  This is the
uniform elimination of the bad radius-s root. -/
theorem qEqE_b2_familyB_radiusS_rootMinus_halfplane_pos
    (s vx vy : ℝ)
    (hsHalf : (1 : ℝ) / 2 < s) (hs1 : s < 1)
    (hv3_circ : (vx - 1) ^ 2 + vy ^ 2 = s ^ 2)
    (hvy : 0 < vy)
    (hvxlo : 1 - s ^ 2 / 2 ≤ vx)
    (hvxhi : vx ≤ 1) :
    0 <
      s ^ 2 * (vy - (familyBRadiusSRootMinusB2Point s) 1)
        + vy * ((familyBRadiusSRootMinusB2Point s) 0 - 1)
        - (vx - 1) * ((familyBRadiusSRootMinusB2Point s) 1) := by
  have hs0 : 0 < s := by nlinarith
  set r3 : ℝ := Real.sqrt 3 with hr3
  set R : ℝ := Real.sqrt (4 - s ^ 2) with hR
  have hR_sq : R ^ 2 = 4 - s ^ 2 := by
    rw [hR, Real.sq_sqrt]
    nlinarith
  have hRpos : 0 < R := by
    rw [hR]
    apply Real.sqrt_pos.mpr
    nlinarith
  have hr3pos : 0 < r3 := by
    rw [hr3]
    exact Real.sqrt_pos.mpr (by norm_num)
  have hr3sq : r3 ^ 2 = 3 := by
    rw [hr3, Real.sq_sqrt]
    norm_num
  have hx_sq : (vx - 1) ^ 2 ≤ s ^ 4 / 4 := by
    have hband : -(s ^ 2 / 2) ≤ vx - 1 ∧ vx - 1 ≤ 0 := by
      constructor
      · nlinarith
      · linarith
    nlinarith [hband.1, hband.2]
  have hvy_sq : vy ^ 2 = s ^ 2 - (vx - 1) ^ 2 := by
    nlinarith [hv3_circ]
  have hvy_sq_lb : s ^ 2 - s ^ 4 / 4 ≤ vy ^ 2 := by
    nlinarith [hx_sq, hvy_sq]
  have hvy_lb : s * R / 2 ≤ vy := by
    have hleft_sq : (s * R / 2) ^ 2 = s ^ 2 - s ^ 4 / 4 := by
      rw [show (s * R / 2) ^ 2 = s ^ 2 * R ^ 2 / 4 by ring]
      rw [hR_sq]
      ring
    have hleft_nonneg : 0 ≤ s * R / 2 := by positivity
    nlinarith [hvy_sq_lb, hleft_sq, hleft_nonneg, hvy]
  have hcoef_pos : 0 ≤ s * (3 * s + r3 * R) / 4 := by positivity
  have hterm1 :
      s * (3 * s + r3 * R) / 4 * (s * R / 2)
        ≤ s * (3 * s + r3 * R) / 4 * vy := by
    exact mul_le_mul_of_nonneg_left hvy_lb hcoef_pos
  have hsum_le : s ^ 2 + vx - 1 ≤ s ^ 2 := by nlinarith
  have hcoef2_nonneg : 0 ≤ s * (R + r3 * s) / 4 := by positivity
  have hterm2 :
      s * (R + r3 * s) / 4 * (s ^ 2 + vx - 1)
        ≤ s * (R + r3 * s) / 4 * s ^ 2 := by
    exact mul_le_mul_of_nonneg_left hsum_le hcoef2_nonneg
  have hform :
      s ^ 2 * (vy - (familyBRadiusSRootMinusB2Point s) 1)
        + vy * ((familyBRadiusSRootMinusB2Point s) 0 - 1)
        - (vx - 1) * ((familyBRadiusSRootMinusB2Point s) 1)
      = s * (3 * s + r3 * R) / 4 * vy
        - s * (R + r3 * s) / 4 * (s ^ 2 + vx - 1) := by
    have h0 :
        s ^ 2 * (vy - (familyBRadiusSRootMinusB2Point s) 1)
          + vy * ((familyBRadiusSRootMinusB2Point s) 0 - 1)
          - (vx - 1) * ((familyBRadiusSRootMinusB2Point s) 1)
          - (s * (3 * s + r3 * R) / 4 * vy
            - s * (R + r3 * s) / 4 * (s ^ 2 + vx - 1)) = 0 := by
      simp [familyBRadiusSRootMinusB2Point, vec2, hr3, hR, EuclideanSpace.single_apply]
      ring
    nlinarith [h0]
  have hlower :
      s * (3 * s + r3 * R) / 4 * (s * R / 2)
        - s * (R + r3 * s) / 4 * s ^ 2
      ≤ s ^ 2 * (vy - (familyBRadiusSRootMinusB2Point s) 1)
        + vy * ((familyBRadiusSRootMinusB2Point s) 0 - 1)
        - (vx - 1) * ((familyBRadiusSRootMinusB2Point s) 1) := by
    nlinarith [hform, hterm1, hterm2]
  have hpos_core :
      0 < s * (3 * s + r3 * R) / 4 * (s * R / 2)
        - s * (R + r3 * s) / 4 * s ^ 2 := by
    have hcore_eq :
        s * (3 * s + r3 * R) / 4 * (s * R / 2)
          - s * (R + r3 * s) / 4 * s ^ 2
        = s ^ 2 / 8 * (s * R + r3 * (4 - 3 * s ^ 2)) := by
      have h0 :
          s * (3 * s + r3 * R) / 4 * (s * R / 2)
            - s * (R + r3 * s) / 4 * s ^ 2
            - s ^ 2 / 8 * (s * R + r3 * (4 - 3 * s ^ 2)) = 0 := by
        ring
        rw [hR_sq]
        ring
      nlinarith [h0]
    rw [hcore_eq]
    have hinner : 0 < s * R + r3 * (4 - 3 * s ^ 2) := by
      have h43 : 0 < 4 - 3 * s ^ 2 := by nlinarith
      positivity
    have hfac : 0 < s ^ 2 / 8 := by positivity
    exact mul_pos hfac hinner
  exact lt_of_lt_of_le hpos_core hlower

set_option maxHeartbeats 1000000 in
/-- **L9 radius-s `rb=s` closer (a₃ second-chord form).**  In the selector
normal form, if `b₂` satisfies the radius-s pin `|a₂b₂| = s`, the disk
constraint, and an upper point `a₃` satisfies both `|v₂a₃| = s` and
`|b₂a₃| = s`, then `a₃ = a₂`; the explicit distinctness hypothesis rules this
out.  This is the `Q = a₃` branch of the documented radius-s `rb=s` closer. -/
theorem qEqE_b2_familyB_radiusS_rbS
    (s ax ay vx vy bx yb qx qy : ℝ)
    (hsHalf : (1 : ℝ) / 2 < s) (hs1 : s < 1)
    (hax : ax = 1 - s ^ 2 / 2)
    (haysq : ay ^ 2 = s ^ 2 - s ^ 4 / 4) (hay_pos : 0 < ay)
    (hv3_circ : (vx - 1) ^ 2 + vy ^ 2 = s ^ 2)
    (hvy : 0 < vy) (hvxlo : 1 - s ^ 2 / 2 ≤ vx) (hvxhi : vx ≤ 1)
    (hb2_circ : (bx - 1) ^ 2 + yb ^ 2 = s ^ 2)
    (hb2_disk : s ^ 2 * (vy - yb) + vy * (bx - 1) - (vx - 1) * yb ≤ 0)
    (hRs : (bx - ax) ^ 2 + (yb - ay) ^ 2 = s ^ 2)
    (ha3_circ : (qx - 1) ^ 2 + qy ^ 2 = s ^ 2)
    (hqy : 0 < qy)
    (ha3_chord : (qx - bx) ^ 2 + (qy - yb) ^ 2 = s ^ 2)
    (hdist : (qx - ax) ^ 2 + (qy - ay) ^ 2 > 0) :
    False := by
  have hs0 : 0 < s := by nlinarith
  have hay : ay = s * Real.sqrt (4 - s ^ 2) / 2 :=
    familyBRadiusS_selector_y_formula s ay hs0 hs1 haysq hay_pos
  have hRs' : (bx - (1 - s ^ 2 / 2)) ^ 2 + (yb - s * Real.sqrt (4 - s ^ 2) / 2) ^ 2 = s ^ 2 := by
    rw [hax, hay] at hRs
    exact hRs
  rcases qEqE_b2_familyB_radiusS_hRs_eq_root s hs0 hs1 bx yb hb2_circ hRs' with hb | hb
  · have hbx : bx = (familyBRadiusSRootPlusB2Point s) 0 := by
      have := congrArg (fun p : ℝ² => p 0) hb
      simpa [vec2, EuclideanSpace.single_apply] using this
    have hyb : yb = (familyBRadiusSRootPlusB2Point s) 1 := by
      have := congrArg (fun p : ℝ² => p 1) hb
      simpa [vec2, EuclideanSpace.single_apply] using this
    have hqv2 : dist (vec2 qx qy) (vec2 1 0) = s := by
      have hsq : dist (vec2 qx qy) (vec2 1 0) ^ 2 = s ^ 2 := by
        rw [dist_sq_coords]
        simp [vec2, EuclideanSpace.single_apply]
        nlinarith [ha3_circ]
      have hnonneg : 0 ≤ dist (vec2 qx qy) (vec2 1 0) := dist_nonneg
      nlinarith [hsq]
    have hqb2 : dist (vec2 qx qy) (familyBRadiusSRootPlusB2Point s) = s := by
      have hsq : dist (vec2 qx qy) (familyBRadiusSRootPlusB2Point s) ^ 2 = s ^ 2 := by
        rw [← hb, dist_sq_coords]
        simpa [vec2, EuclideanSpace.single_apply] using ha3_chord
      have hnonneg : 0 ≤ dist (vec2 qx qy) (familyBRadiusSRootPlusB2Point s) := dist_nonneg
      nlinarith [hsq]
    have hqvecy : 0 < (vec2 qx qy) 1 := by
      simpa [vec2, EuclideanSpace.single_apply] using hqy
    have hqeq : vec2 qx qy = familyBRadiusSA2Point s :=
      qEqE_b2_familyB_radiusS_rootPlus_upper_common_eq_a2 s hs0 hs1 (vec2 qx qy) hqv2 hqb2 hqvecy
    have hqx : qx = 1 - s ^ 2 / 2 := by
      have := congrArg (fun p : ℝ² => p 0) hqeq
      simpa [familyBRadiusSA2Point, vec2, EuclideanSpace.single_apply] using this
    have hqy_eq : qy = s * Real.sqrt (4 - s ^ 2) / 2 := by
      have := congrArg (fun p : ℝ² => p 1) hqeq
      simpa [familyBRadiusSA2Point, vec2, EuclideanSpace.single_apply] using this
    nlinarith [hdist, hax, hay, hqx, hqy_eq]
  · have hbx : bx = (familyBRadiusSRootMinusB2Point s) 0 := by
      have := congrArg (fun p : ℝ² => p 0) hb
      simpa [vec2, EuclideanSpace.single_apply] using this
    have hyb : yb = (familyBRadiusSRootMinusB2Point s) 1 := by
      have := congrArg (fun p : ℝ² => p 1) hb
      simpa [vec2, EuclideanSpace.single_apply] using this
    have hpos :=
      qEqE_b2_familyB_radiusS_rootMinus_halfplane_pos s vx vy hsHalf hs1 hv3_circ hvy hvxlo hvxhi
    rw [hbx, hyb] at hb2_disk
    linarith

/- ## L10 — Family-B chord-equality `rb=s` support points

These are the explicit `α ± π/6` points from the documented chord-equality
route.  This pass only banks the stable coordinate facts needed by the final
closer: both points lie on `circle(v₂,s)`, both stay above the axis on the open
lens, their mutual chord has length `s`, and they are equidistant from `a₂`. -/

noncomputable def familyBChordEqLowerAnglePoint (s : ℝ) : ℝ² :=
  vec2
    (1 + s * Real.sqrt (4 - s ^ 2) / 4 - Real.sqrt 3 * s ^ 2 / 4)
    (s * (s + Real.sqrt 3 * Real.sqrt (4 - s ^ 2)) / 4)

noncomputable def familyBChordEqHigherAnglePoint (s : ℝ) : ℝ² :=
  vec2
    (1 - s * Real.sqrt (4 - s ^ 2) / 4 - Real.sqrt 3 * s ^ 2 / 4)
    (s * (Real.sqrt 3 * Real.sqrt (4 - s ^ 2) - s) / 4)

private theorem familyBChordEq_sqrt3_sq : (Real.sqrt 3 : ℝ) ^ 2 = 3 := by
  rw [Real.sq_sqrt]
  norm_num

/-- The explicit `α - π/6` point stays above the axis on the open lens. -/
theorem familyBChordEqLower_above_axis (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    0 < (familyBChordEqLowerAnglePoint s) 1 := by
  have h4 : 0 < 4 - s ^ 2 := by nlinarith
  have hR : 0 < Real.sqrt (4 - s ^ 2) := Real.sqrt_pos.mpr h4
  have h3 : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
  simp [familyBChordEqLowerAnglePoint, vec2, EuclideanSpace.single_apply]
  positivity

/-- The explicit `α + π/6` point also stays above the axis on the open lens. -/
theorem familyBChordEqHigher_above_axis (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    0 < (familyBChordEqHigherAnglePoint s) 1 := by
  have h4 : 0 < 4 - s ^ 2 := by nlinarith
  have hR : 0 < Real.sqrt (4 - s ^ 2) := Real.sqrt_pos.mpr h4
  have hineq : s < Real.sqrt 3 * Real.sqrt (4 - s ^ 2) := by
    have hsq :
        s ^ 2 < (Real.sqrt 3 * Real.sqrt (4 - s ^ 2)) ^ 2 := by
      rw [show (Real.sqrt 3 * Real.sqrt (4 - s ^ 2)) ^ 2 =
          (Real.sqrt 3) ^ 2 * (Real.sqrt (4 - s ^ 2)) ^ 2 by ring]
      rw [familyBChordEq_sqrt3_sq, Real.sq_sqrt]
      · nlinarith
      · nlinarith
    have hnonneg : 0 ≤ Real.sqrt 3 * Real.sqrt (4 - s ^ 2) := by positivity
    nlinarith
  simp [familyBChordEqHigherAnglePoint, vec2, EuclideanSpace.single_apply]
  nlinarith [hineq]

/-- The explicit `α - π/6` point lies on `circle(v₂,s)`. -/
theorem familyBChordEqLower_on_v2_circle (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    dist (familyBChordEqLowerAnglePoint s) (vec2 1 0) = s := by
  have h4 : 0 ≤ 4 - s ^ 2 := by nlinarith
  set R : ℝ := Real.sqrt (4 - s ^ 2) with hR
  have hR_sq : R ^ 2 = 4 - s ^ 2 := by
    rw [hR, Real.sq_sqrt h4]
  have hsq : dist (familyBChordEqLowerAnglePoint s) (vec2 1 0) ^ 2 = s ^ 2 := by
    rw [dist_sq_coords]
    simp [familyBChordEqLowerAnglePoint, vec2, EuclideanSpace.single_apply]
    rw [show Real.sqrt (4 - s ^ 2) = R by exact hR.symm]
    have hcalc :
        (1 + s * R / 4 - Real.sqrt 3 * s ^ 2 / 4 - 1) ^ 2 + (s * (s + Real.sqrt 3 * R) / 4) ^ 2
          = s ^ 2 * R ^ 2 / 4 + s ^ 4 / 4 := by
      ring_nf
      rw [familyBChordEq_sqrt3_sq]
      ring_nf
    rw [hcalc, hR_sq]
    nlinarith
  have hnonneg : 0 ≤ dist (familyBChordEqLowerAnglePoint s) (vec2 1 0) := dist_nonneg
  nlinarith [hsq]

/-- The explicit `α + π/6` point lies on `circle(v₂,s)`. -/
theorem familyBChordEqHigher_on_v2_circle (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    dist (familyBChordEqHigherAnglePoint s) (vec2 1 0) = s := by
  have h4 : 0 ≤ 4 - s ^ 2 := by nlinarith
  set R : ℝ := Real.sqrt (4 - s ^ 2) with hR
  have hR_sq : R ^ 2 = 4 - s ^ 2 := by
    rw [hR, Real.sq_sqrt h4]
  have hsq : dist (familyBChordEqHigherAnglePoint s) (vec2 1 0) ^ 2 = s ^ 2 := by
    rw [dist_sq_coords]
    simp [familyBChordEqHigherAnglePoint, vec2, EuclideanSpace.single_apply]
    rw [show Real.sqrt (4 - s ^ 2) = R by exact hR.symm]
    have hcalc :
        (1 - s * R / 4 - Real.sqrt 3 * s ^ 2 / 4 - 1) ^ 2 + (s * (Real.sqrt 3 * R - s) / 4) ^ 2
          = s ^ 2 * R ^ 2 / 4 + s ^ 4 / 4 := by
      ring_nf
      rw [familyBChordEq_sqrt3_sq]
      ring_nf
    rw [hcalc, hR_sq]
    nlinarith
  have hnonneg : 0 ≤ dist (familyBChordEqHigherAnglePoint s) (vec2 1 0) := dist_nonneg
  nlinarith [hsq]

/-- The two explicit chord-equality points are distinct. -/
theorem familyBChordEq_points_ne (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    familyBChordEqLowerAnglePoint s ≠ familyBChordEqHigherAnglePoint s := by
  intro h
  have hx :
      s * Real.sqrt (4 - s ^ 2) / 2 = 0 := by
    have hx0 := congrArg (fun p : ℝ² => p 0) h
    simp [familyBChordEqLowerAnglePoint, familyBChordEqHigherAnglePoint, vec2,
      EuclideanSpace.single_apply] at hx0
    nlinarith [hx0]
  have h4 : 0 < 4 - s ^ 2 := by nlinarith
  have hR : 0 < Real.sqrt (4 - s ^ 2) := Real.sqrt_pos.mpr h4
  have hpos : 0 < s * Real.sqrt (4 - s ^ 2) / 2 := by positivity
  linarith

/-- The mutual chord between the explicit `α ± π/6` points has length `s`. -/
theorem familyBChordEq_mutual_dist_eq_s (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    dist (familyBChordEqLowerAnglePoint s) (familyBChordEqHigherAnglePoint s) = s := by
  have h4 : 0 ≤ 4 - s ^ 2 := by nlinarith
  have hsq :
      dist (familyBChordEqLowerAnglePoint s) (familyBChordEqHigherAnglePoint s) ^ 2 = s ^ 2 := by
    rw [dist_sq_coords]
    simp [familyBChordEqLowerAnglePoint, familyBChordEqHigherAnglePoint, vec2,
      EuclideanSpace.single_apply]
    ring_nf
    have hsqrt : (Real.sqrt (4 - s ^ 2)) ^ 2 = 4 - s ^ 2 := by rw [Real.sq_sqrt h4]
    nlinarith [hsqrt, familyBChordEq_sqrt3_sq]
  have hnonneg :
      0 ≤ dist (familyBChordEqLowerAnglePoint s) (familyBChordEqHigherAnglePoint s) := dist_nonneg
  nlinarith [hsq]

/-- The explicit `α ± π/6` points are equidistant from the normalized `a₂`. -/
theorem familyBChordEq_equal_dist_to_a2 (s : ℝ) (hs0 : 0 < s) (hs1 : s < 1) :
    dist (familyBChordEqLowerAnglePoint s) (familyBRadiusSA2Point s) =
      dist (familyBChordEqHigherAnglePoint s) (familyBRadiusSA2Point s) := by
  have h4 : 0 ≤ 4 - s ^ 2 := by nlinarith
  have hsq :
      dist (familyBChordEqLowerAnglePoint s) (familyBRadiusSA2Point s) ^ 2 =
        dist (familyBChordEqHigherAnglePoint s) (familyBRadiusSA2Point s) ^ 2 := by
    rw [dist_sq_coords, dist_sq_coords]
    simp [familyBChordEqLowerAnglePoint, familyBChordEqHigherAnglePoint,
      familyBRadiusSA2Point, vec2, EuclideanSpace.single_apply]
    ring_nf
  have hnonneg1 :
      0 ≤ dist (familyBChordEqLowerAnglePoint s) (familyBRadiusSA2Point s) := dist_nonneg
  have hnonneg2 :
      0 ≤ dist (familyBChordEqHigherAnglePoint s) (familyBRadiusSA2Point s) := dist_nonneg
  nlinarith [hsq]

/-- The upper/lower explicit chord-equality coefficients satisfy the needed order
for the half-plane lower bound. -/
theorem familyBChordEq_coeff_order
    (s : ℝ) (hsHalf : (1 : ℝ) / 2 < s) (hs1 : s < 1) :
    s * (Real.sqrt (4 - s ^ 2) + (4 - Real.sqrt 3) * s) / 4
      ≤ s * (s + Real.sqrt 3 * Real.sqrt (4 - s ^ 2)) / 4 := by
  have hs0 : 0 < s := by nlinarith
  have hRpos : 0 < Real.sqrt (4 - s ^ 2) := by
    apply Real.sqrt_pos.mpr
    nlinarith
  have hr3sq : (Real.sqrt 3 : ℝ) ^ 2 = 3 := by
    rw [Real.sq_sqrt]
    norm_num
  have hr3gt1 : 1 < Real.sqrt 3 := by
    have hsq1 : (1 : ℝ)^2 < (Real.sqrt 3)^2 := by
      rw [hr3sq]
      norm_num
    have hnonneg : 0 ≤ Real.sqrt 3 := by positivity
    nlinarith
  have hleft_nonneg : 0 ≤ (3 - Real.sqrt 3) * s := by
    nlinarith [hs0, hr3sq]
  have hright_nonneg : 0 ≤ (Real.sqrt 3 - 1) * Real.sqrt (4 - s ^ 2) := by
    have hcoef : 0 < Real.sqrt 3 - 1 := by linarith
    nlinarith [hRpos, hcoef]
  have hsq :
      ((Real.sqrt 3 - 1) * Real.sqrt (4 - s ^ 2)) ^ 2 - ((3 - Real.sqrt 3) * s) ^ 2
        = 8 * (2 - Real.sqrt 3) * (1 - s ^ 2) := by
    have hsqrt : (Real.sqrt (4 - s ^ 2)) ^ 2 = 4 - s ^ 2 := by
      rw [Real.sq_sqrt]
      nlinarith
    calc
      ((Real.sqrt 3 - 1) * Real.sqrt (4 - s ^ 2)) ^ 2 - ((3 - Real.sqrt 3) * s) ^ 2
          = (Real.sqrt 3 - 1) ^ 2 * (Real.sqrt (4 - s ^ 2)) ^ 2 - ((3 - Real.sqrt 3) * s) ^ 2 := by
              ring
      _ = (Real.sqrt 3 - 1) ^ 2 * (4 - s ^ 2) - ((3 - Real.sqrt 3) * s) ^ 2 := by
            rw [hsqrt]
      _ = 8 * (2 - Real.sqrt 3) * (1 - s ^ 2) := by
            ring_nf
            rw [hr3sq]
            ring
  have hsq_pos : 0 < ((Real.sqrt 3 - 1) * Real.sqrt (4 - s ^ 2)) ^ 2 - ((3 - Real.sqrt 3) * s) ^ 2 := by
    rw [hsq]
    have hs2lt1 : s ^ 2 < 1 := by nlinarith [hs0, hs1]
    have hr3lt2 : Real.sqrt 3 < 2 := by
      have hsq2 : (Real.sqrt 3)^2 < (2 : ℝ)^2 := by
        rw [hr3sq]
        norm_num
      have hnonneg : 0 ≤ Real.sqrt 3 := by positivity
      nlinarith
    nlinarith [hs2lt1, hr3lt2]
  have hstrict : (3 - Real.sqrt 3) * s < (Real.sqrt 3 - 1) * Real.sqrt (4 - s ^ 2) := by
    nlinarith [hsq_pos, hleft_nonneg, hright_nonneg]
  nlinarith

set_option maxHeartbeats 4000000 in
-- The one-variable open-lens positivity for the lower chord-equality point is
-- algebraically heavier than the surrounding support lemmas.
private theorem familyBChordEq_core_inner_pos
    (s : ℝ) (hsHalf : (1 : ℝ) / 2 < s) (hs1 : s < 1) :
    0 < ((4 - Real.sqrt 3) * s - s ^ 2) + Real.sqrt (4 - s ^ 2) * (1 - Real.sqrt 3 * s) := by
  have hs0 : 0 < s := by nlinarith
  have hRpos : 0 < Real.sqrt (4 - s ^ 2) := by
    apply Real.sqrt_pos.mpr
    nlinarith
  have hr3sq : (Real.sqrt 3 : ℝ) ^ 2 = 3 := by
    rw [Real.sq_sqrt]
    norm_num
  have hr3pos : 0 < Real.sqrt 3 := by positivity
  have hr3cube : (Real.sqrt 3 : ℝ) ^ 3 = 3 * Real.sqrt 3 := by
    calc
      (Real.sqrt 3 : ℝ) ^ 3 = (Real.sqrt 3 : ℝ) ^ 2 * Real.sqrt 3 := by ring
      _ = 3 * Real.sqrt 3 := by rw [hr3sq]
  have hr3gt1 : 1 < Real.sqrt 3 := by
    have hsq1 : (1 : ℝ)^2 < (Real.sqrt 3)^2 := by
      rw [hr3sq]
      norm_num
    have hnonneg : 0 ≤ Real.sqrt 3 := by positivity
    nlinarith
  have hr3lt2 : Real.sqrt 3 < 2 := by
    have hsq2 : (Real.sqrt 3)^2 < (2 : ℝ)^2 := by
      rw [hr3sq]
      norm_num
    have hnonneg : 0 ≤ Real.sqrt 3 := by positivity
    nlinarith
  have hApos : 0 < (4 - Real.sqrt 3) * s - s ^ 2 := by
    have hcoef : 0 < 4 - Real.sqrt 3 - s := by
      nlinarith [hs1, hr3lt2]
    have hAeq : (4 - Real.sqrt 3) * s - s ^ 2 = s * (4 - Real.sqrt 3 - s) := by ring
    rw [hAeq]
    positivity
  by_cases hsmall : s ≤ 1 / Real.sqrt 3
  · have hsmall' := mul_le_mul_of_nonneg_left hsmall hr3pos.le
    have hmul : Real.sqrt 3 * (1 / Real.sqrt 3) = 1 := by
      field_simp [hr3pos.ne']
    rw [hmul] at hsmall'
    have hcoef_nonneg : 0 ≤ 1 - Real.sqrt 3 * s := by linarith
    nlinarith [hApos, hRpos, hcoef_nonneg]
  · have hlarge : 1 / Real.sqrt 3 < s := by linarith
    have hlarge' := mul_lt_mul_of_pos_left hlarge hr3pos
    have hmul : Real.sqrt 3 * (1 / Real.sqrt 3) = 1 := by
      field_simp [hr3pos.ne']
    rw [hmul] at hlarge'
    have hcoef_pos : 0 < Real.sqrt 3 * s - 1 := by linarith
    have hpoly :
        ((4 - Real.sqrt 3) * s - s ^ 2) ^ 2 -
            (Real.sqrt (4 - s ^ 2) * (Real.sqrt 3 * s - 1)) ^ 2 =
          4 * (s - 1) * (s ^ 3 - s ^ 2 - (2 * Real.sqrt 3 - 1) * s + 1) := by
      have hsqrt : (Real.sqrt (4 - s ^ 2)) ^ 2 = 4 - s ^ 2 := by
        rw [Real.sq_sqrt]
        nlinarith
      calc
        ((4 - Real.sqrt 3) * s - s ^ 2) ^ 2 -
            (Real.sqrt (4 - s ^ 2) * (Real.sqrt 3 * s - 1)) ^ 2
            = ((4 - Real.sqrt 3) * s - s ^ 2) ^ 2 -
                (4 - s ^ 2) * (Real.sqrt 3 * s - 1) ^ 2 := by
                  rw [show (Real.sqrt (4 - s ^ 2) * (Real.sqrt 3 * s - 1)) ^ 2 =
                      (Real.sqrt (4 - s ^ 2)) ^ 2 * (Real.sqrt 3 * s - 1) ^ 2 by ring]
                  rw [hsqrt]
        _ = 4 * (s - 1) * (s ^ 3 - s ^ 2 - (2 * Real.sqrt 3 - 1) * s + 1) := by
              ring_nf
              rw [hr3sq]
              ring
    have hmon : s ^ 3 - s ^ 2 - (2 * Real.sqrt 3 - 1) * s + 1 < 0 := by
      have hsle1 : s ≤ 1 := by linarith
      have hderiv : 3 * s ^ 2 - 2 * s - (2 * Real.sqrt 3 - 1) < 0 := by
        have haux : 3 * s ^ 2 - 2 * s ≤ 1 := by
          nlinarith [hs0, hsle1]
        linarith
      have hbase : (1 / Real.sqrt 3) ^ 3 - (1 / Real.sqrt 3) ^ 2
          - (2 * Real.sqrt 3 - 1) * (1 / Real.sqrt 3) + 1 < 0 := by
        have hbase_eq : (1 / Real.sqrt 3) ^ 3 - (1 / Real.sqrt 3) ^ 2
            - (2 * Real.sqrt 3 - 1) * (1 / Real.sqrt 3) + 1
            = 4 / (3 * Real.sqrt 3) - 4 / 3 := by
          field_simp [hr3pos.ne']
          nlinarith [hr3sq, hr3cube]
        rw [hbase_eq]
        nlinarith [hr3sq, hr3pos]
      have hdiff :
          (s ^ 3 - s ^ 2 - (2 * Real.sqrt 3 - 1) * s + 1)
            - ((1 / Real.sqrt 3) ^ 3 - (1 / Real.sqrt 3) ^ 2
              - (2 * Real.sqrt 3 - 1) * (1 / Real.sqrt 3) + 1) < 0 := by
        have hfactor :
            (s ^ 3 - s ^ 2 - (2 * Real.sqrt 3 - 1) * s + 1)
              - ((1 / Real.sqrt 3) ^ 3 - (1 / Real.sqrt 3) ^ 2
                - (2 * Real.sqrt 3 - 1) * (1 / Real.sqrt 3) + 1)
              = (s - 1 / Real.sqrt 3) *
                  (s ^ 2 + s / Real.sqrt 3 + (1 / Real.sqrt 3) ^ 2
                    - s - 1 / Real.sqrt 3 - (2 * Real.sqrt 3 - 1)) := by
          ring
        rw [hfactor]
        have hquad : s ^ 2 + s / Real.sqrt 3 + (1 / Real.sqrt 3) ^ 2
            - s - 1 / Real.sqrt 3 - (2 * Real.sqrt 3 - 1) < 0 := by
          have hsle1 : s ≤ 1 := by linarith
          nlinarith [hs0, hsle1, hr3sq, hr3pos]
        nlinarith [hlarge, hquad]
      linarith
    have hsq_pos :
        ((4 - Real.sqrt 3) * s - s ^ 2) ^ 2 -
            (Real.sqrt (4 - s ^ 2) * (Real.sqrt 3 * s - 1)) ^ 2 > 0 := by
      rw [hpoly]
      nlinarith [hs1, hmon]
    have hsum_pos :
        0 < ((4 - Real.sqrt 3) * s - s ^ 2)
          + Real.sqrt (4 - s ^ 2) * (Real.sqrt 3 * s - 1) := by
      positivity
    have : 0 < (((4 - Real.sqrt 3) * s - s ^ 2)
        - Real.sqrt (4 - s ^ 2) * (Real.sqrt 3 * s - 1)) := by
      nlinarith [hsq_pos, hsum_pos]
    nlinarith

set_option maxHeartbeats 4000000 in
-- The lower `α - π / 6` point sits strictly outside the open-lens MEC disk.
theorem qEqE_b2_familyB_chordEq_lower_halfplane_pos
    (s vx vy : ℝ)
    (hsHalf : (1 : ℝ) / 2 < s) (hs1 : s < 1)
    (hv3_circ : (vx - 1) ^ 2 + vy ^ 2 = s ^ 2)
    (hvy : 0 < vy)
    (hvxlo : 1 - s ^ 2 / 2 ≤ vx)
    (hvxhi : vx ≤ 1) :
    0 <
      s ^ 2 * (vy - (familyBChordEqLowerAnglePoint s) 1)
        + vy * ((familyBChordEqLowerAnglePoint s) 0 - 1)
        - (vx - 1) * ((familyBChordEqLowerAnglePoint s) 1) := by
  have hs0 : 0 < s := by nlinarith
  set R : ℝ := Real.sqrt (4 - s ^ 2) with hR
  have hR_sq : R ^ 2 = 4 - s ^ 2 := by
    rw [hR, Real.sq_sqrt]
    nlinarith
  have hRpos : 0 < R := by
    rw [hR]
    exact Real.sqrt_pos.mpr (by nlinarith)
  have hx_sq : (vx - 1) ^ 2 ≤ s ^ 4 / 4 := by
    have hband : -(s ^ 2 / 2) ≤ vx - 1 ∧ vx - 1 ≤ 0 := by
      constructor
      · nlinarith
      · linarith
    nlinarith [hband.1, hband.2]
  have hvy_sq : vy ^ 2 = s ^ 2 - (vx - 1) ^ 2 := by
    nlinarith [hv3_circ]
  have hvy_sq_lb : s ^ 2 - s ^ 4 / 4 ≤ vy ^ 2 := by
    nlinarith [hx_sq, hvy_sq]
  have hvy_lb : s * R / 2 ≤ vy := by
    have hleft_sq : (s * R / 2) ^ 2 = s ^ 2 - s ^ 4 / 4 := by
      rw [show (s * R / 2) ^ 2 = s ^ 2 * R ^ 2 / 4 by ring]
      rw [hR_sq]
      ring
    have hleft_nonneg : 0 ≤ s * R / 2 := by positivity
    nlinarith [hvy_sq_lb, hleft_sq, hleft_nonneg, hvy]
  have hu_nonneg : 0 ≤ 1 - vx := by linarith
  have hu_le : 1 - vx ≤ s ^ 2 / 2 := by nlinarith
  have hsum_pos : 0 < s + vy := by positivity
  have hu_sum : 1 - vx ≤ s + vy := by
    have hs2_lt_two_s : s ^ 2 / 2 < s := by nlinarith [hs0, hs1]
    nlinarith [hu_le, hs2_lt_two_s, hvy]
  have hgap_le : s - vy ≤ 1 - vx := by
    have hprod_le : (1 - vx) ^ 2 ≤ (1 - vx) * (s + vy) := by
      have hprod_le' : (1 - vx) * (1 - vx) ≤ (1 - vx) * (s + vy) := by
        exact mul_le_mul_of_nonneg_left hu_sum hu_nonneg
      simpa [pow_two] using hprod_le'
    have hprod_eq : (s - vy) * (s + vy) = (1 - vx) ^ 2 := by
      nlinarith [hv3_circ]
    have htmp : (s - vy) * (s + vy) ≤ (1 - vx) * (s + vy) := by
      simpa [hprod_eq] using hprod_le
    exact le_of_mul_le_mul_right htmp hsum_pos
  set A : ℝ := s * (R + (4 - Real.sqrt 3) * s) / 4
  set B : ℝ := s * (s + Real.sqrt 3 * R) / 4
  have hr3sq : (Real.sqrt 3 : ℝ) ^ 2 = 3 := by
    rw [Real.sq_sqrt]
    norm_num
  have hA_pos : 0 < A := by
    dsimp [A]
    rw [hR]
    have hr3lt4 : Real.sqrt 3 < 4 := by
      have hsq4 : (Real.sqrt 3 : ℝ)^2 < (4 : ℝ)^2 := by
        rw [hr3sq]
        norm_num
      have hnonneg : 0 ≤ Real.sqrt 3 := by positivity
      nlinarith
    have hcoef : 0 < Real.sqrt (4 - s ^ 2) + (4 - Real.sqrt 3) * s := by
      nlinarith [hRpos, hs0, hr3lt4]
    positivity
  have hA_nonneg : 0 ≤ A := by
    linarith
  have hB_pos : 0 < B := by
    dsimp [B]
    rw [hR]
    positivity
  have hB_nonneg : 0 ≤ B := by
    linarith
  have hB_ge_A : A ≤ B := by
    simpa [A, B, hR] using familyBChordEq_coeff_order s hsHalf hs1
  have hdelta_nonneg : 0 ≤ B * (1 - vx) - A * (s - vy) := by
    have h1 : A * (s - vy) ≤ A * (1 - vx) := by
      exact mul_le_mul_of_nonneg_left hgap_le hA_nonneg
    have h2 : A * (1 - vx) ≤ B * (1 - vx) := by
      exact mul_le_mul_of_nonneg_right hB_ge_A hu_nonneg
    nlinarith
  have hform :
      s ^ 2 * (vy - (familyBChordEqLowerAnglePoint s) 1)
        + vy * ((familyBChordEqLowerAnglePoint s) 0 - 1)
        - (vx - 1) * ((familyBChordEqLowerAnglePoint s) 1)
      = A * vy - B * (s ^ 2 + vx - 1) := by
    have h0 :
        s ^ 2 * (vy - (familyBChordEqLowerAnglePoint s) 1)
          + vy * ((familyBChordEqLowerAnglePoint s) 0 - 1)
          - (vx - 1) * ((familyBChordEqLowerAnglePoint s) 1)
          - (A * vy - B * (s ^ 2 + vx - 1)) = 0 := by
      simp [familyBChordEqLowerAnglePoint, vec2, EuclideanSpace.single_apply, A, B, hR]
      ring
    nlinarith [h0]
  have hdecomp :
      s ^ 2 * (vy - (familyBChordEqLowerAnglePoint s) 1)
        + vy * ((familyBChordEqLowerAnglePoint s) 0 - 1)
        - (vx - 1) * ((familyBChordEqLowerAnglePoint s) 1)
      = (A * s - B * s ^ 2) + (B * (1 - vx) - A * (s - vy)) := by
    nlinarith [hform]
  have hcore :
      0 < A * s - B * s ^ 2 := by
    have hcore_eq :
        A * s - B * s ^ 2
          = s ^ 2 / 4 * (((4 - Real.sqrt 3) * s - s ^ 2) + R * (1 - Real.sqrt 3 * s)) := by
      dsimp [A, B]
      ring
    rw [hcore_eq]
    have hinner : 0 < ((4 - Real.sqrt 3) * s - s ^ 2) + R * (1 - Real.sqrt 3 * s) := by
      rw [hR]
      exact familyBChordEq_core_inner_pos s hsHalf hs1
    have hfac : 0 < s ^ 2 / 4 := by positivity
    exact mul_pos hfac hinner
  rw [hdecomp]
  nlinarith [hcore, hdelta_nonneg]

/- **L10 explicit classification of the chord-equality pair.** If two upper
`circle(v₂,s)` points satisfy the normalized `Sa₂` chord-equality and their
mutual chord has length `s`, then they are exactly the explicit
`α ± π/6` points, up to swapping the labels. -/
set_option maxHeartbeats 4000000 in
-- The algebraic branch reconstruction here expands several explicit coordinate
-- identities; the default heartbeat budget is not enough for this one theorem.
theorem qEqE_b2_familyB_chordEq_classify
    (s ax ay bx yb qx qy : ℝ)
    (hsHalf : (1 : ℝ) / 2 < s) (hs1 : s < 1)
    (hax : ax = 1 - s ^ 2 / 2)
    (haysq : ay ^ 2 = s ^ 2 - s ^ 4 / 4) (hay_pos : 0 < ay)
    (hb2_circ : (bx - 1) ^ 2 + yb ^ 2 = s ^ 2)
    (ha3_circ : (qx - 1) ^ 2 + qy ^ 2 = s ^ 2)
    (hby : 0 < yb) (hqy : 0 < qy)
    (hCE : (qx - ax) ^ 2 + (qy - ay) ^ 2 = (bx - ax) ^ 2 + (yb - ay) ^ 2)
    (hchord : (qx - bx) ^ 2 + (qy - yb) ^ 2 = s ^ 2) :
    (vec2 bx yb = familyBChordEqHigherAnglePoint s ∧
      vec2 qx qy = familyBChordEqLowerAnglePoint s) ∨
    (vec2 bx yb = familyBChordEqLowerAnglePoint s ∧
      vec2 qx qy = familyBChordEqHigherAnglePoint s) := by
  have hs0 : 0 < s := by nlinarith
  have hay :
      ay = s * Real.sqrt (4 - s ^ 2) / 2 :=
    familyBRadiusS_selector_y_formula s ay hs0 hs1 haysq hay_pos
  set R : ℝ := Real.sqrt (4 - s ^ 2) with hR
  have hR_sq : R ^ 2 = 4 - s ^ 2 := by
    rw [hR, Real.sq_sqrt]
    nlinarith
  have hRpos : 0 < R := by
    rw [hR]
    exact Real.sqrt_pos.mpr (by nlinarith)
  have hline : s * R * (qy - yb) = s ^ 2 * (qx - bx) := by
    rw [hax, hay] at hCE
    rw [hR] at hCE
    nlinarith [hCE, hb2_circ, ha3_circ]
  have hline_sq : s ^ 2 * R ^ 2 * (qy - yb) ^ 2 = s ^ 4 * (qx - bx) ^ 2 := by
    have hsq := congrArg (fun z : ℝ => z ^ 2) hline
    nlinarith [hsq]
  have hdx_sq : (qx - bx) ^ 2 = s ^ 2 - (qy - yb) ^ 2 := by
    nlinarith [hchord]
  have hdy_sq : (qy - yb) ^ 2 = s ^ 4 / 4 := by
    rw [hR_sq] at hline_sq
    have hs2_ne : s ^ 2 ≠ 0 := by positivity
    have h0 : (4 - s ^ 2) * (qy - yb) ^ 2 = s ^ 2 * (qx - bx) ^ 2 := by
      apply (mul_right_cancel₀ hs2_ne)
      nlinarith [hline_sq]
    rw [hdx_sq] at h0
    ring_nf at h0
    nlinarith [h0]
  have hdy_ne : qy - yb ≠ 0 := by
    intro hzero
    have hpos : 0 < s ^ 4 / 4 := by positivity
    have : s ^ 4 / 4 = 0 := by simpa [hzero] using hdy_sq.symm
    linarith
  have hdy_cases : qy - yb = s ^ 2 / 2 ∨ qy - yb = -(s ^ 2 / 2) := by
    have hsq : (qy - yb) ^ 2 = (s ^ 2 / 2) ^ 2 := by
      nlinarith [hdy_sq]
    exact sq_eq_sq_iff_eq_or_eq_neg.mp hsq
  have hdiff : (qx - bx) * (qx + bx - 2) + (qy - yb) * (qy + yb) = 0 := by
    nlinarith [ha3_circ, hb2_circ]
  have hmid_line : R * (bx + qx - 2) + s * (yb + qy) = 0 := by
    have hline' : R * (qy - yb) = s * (qx - bx) := by
      nlinarith [hline, hs0]
    have hdiff' : (qx - bx) * (bx + qx - 2) + (qy - yb) * (yb + qy) = 0 := by
      simpa [add_comm] using hdiff
    have hfactor' : (qy - yb) * (R * (bx + qx - 2) + s * (yb + qy)) = 0 := by
      calc
        (qy - yb) * (R * (bx + qx - 2) + s * (yb + qy))
            = R * (qy - yb) * (bx + qx - 2) + s * (qy - yb) * (yb + qy) := by ring
        _ = s * (qx - bx) * (bx + qx - 2) + s * (qy - yb) * (yb + qy) := by
              rw [hline']
        _ = s * ((qx - bx) * (bx + qx - 2) + (qy - yb) * (yb + qy)) := by ring
        _ = 0 := by rw [hdiff']; ring
    exact (mul_eq_zero.mp hfactor').resolve_left hdy_ne
  have hmid_norm : (bx + qx - 2) ^ 2 + (yb + qy) ^ 2 = 3 * s ^ 2 := by
    nlinarith [hb2_circ, ha3_circ, hchord]
  have hsx_neg : bx + qx - 2 < 0 := by
    have hsumy : 0 < yb + qy := by linarith
    nlinarith [hmid_line, hRpos, hs0, hsumy]
  have hsx_sq : (bx + qx - 2) ^ 2 = 3 * s ^ 4 / 4 := by
    have h0 : R ^ 2 * (bx + qx - 2) ^ 2 = s ^ 2 * (yb + qy) ^ 2 := by
      have hline2 : R * (bx + qx - 2) = -s * (yb + qy) := by
        linarith [hmid_line]
      have hsq := congrArg (fun z : ℝ => z ^ 2) hline2
      ring_nf at hsq ⊢
      exact hsq
    have hsum : s ^ 2 * ((bx + qx - 2) ^ 2 + (yb + qy) ^ 2) = 3 * s ^ 4 := by
      have hsum0 := congrArg (fun z : ℝ => s ^ 2 * z) hmid_norm
      ring_nf at hsum0 ⊢
      exact hsum0
    have hpoly : 4 * (bx + qx - 2) ^ 2 = 3 * s ^ 4 := by
      rw [show s ^ 2 * ((bx + qx - 2) ^ 2 + (yb + qy) ^ 2)
          = s ^ 2 * (bx + qx - 2) ^ 2 + s ^ 2 * (yb + qy) ^ 2 by ring] at hsum
      rw [← h0] at hsum
      rw [hR_sq] at hsum
      ring_nf at hsum
      ring_nf
      exact hsum
    have hpoly' : (bx + qx - 2) ^ 2 * 4 = 3 * s ^ 4 := by
      simpa [mul_comm, mul_left_comm, mul_assoc] using hpoly
    exact (eq_div_iff (show (4 : ℝ) ≠ 0 by norm_num)).2 hpoly'
  have hsx : bx + qx - 2 = -(Real.sqrt 3 * s ^ 2 / 2) := by
    have hsqrt3_sq : (Real.sqrt 3 * s ^ 2 / 2) ^ 2 = 3 * s ^ 4 / 4 := by
      rw [show (Real.sqrt 3 * s ^ 2 / 2) ^ 2 = (Real.sqrt 3) ^ 2 * s ^ 4 / 4 by ring]
      rw [familyBChordEq_sqrt3_sq]
    have hsq : (bx + qx - 2) ^ 2 = (Real.sqrt 3 * s ^ 2 / 2) ^ 2 := by
      rw [hsqrt3_sq]
      exact hsx_sq
    rcases sq_eq_sq_iff_eq_or_eq_neg.mp hsq with h | h
    · exfalso
      have hvpos : 0 < Real.sqrt 3 * s ^ 2 / 2 := by positivity
      linarith [hsx_neg, hvpos, h]
    · exact h
  have hsy : yb + qy = Real.sqrt 3 * s * R / 2 := by
    have htmp : s * (yb + qy) = -R * (bx + qx - 2) := by
      linarith [hmid_line]
    rw [hsx] at htmp
    have hs_ne : s ≠ 0 := by linarith
    have htmp2 := congrArg (fun z : ℝ => z / s) htmp
    field_simp [hs_ne] at htmp2
    apply (eq_div_iff (show (2 : ℝ) ≠ 0 by norm_num)).2
    simpa [mul_comm, mul_left_comm, mul_assoc] using htmp2
  rcases hdy_cases with hdy | hdy
  · have hdx : qx - bx = s * R / 2 := by
      have hline1 := hline
      rw [hdy] at hline1
      have hs2_ne : s ^ 2 ≠ 0 := by positivity
      have hline2 := congrArg (fun z : ℝ => z / (s ^ 2)) hline1
      field_simp [hs2_ne] at hline2
      apply (eq_div_iff (show (2 : ℝ) ≠ 0 by norm_num)).2
      linarith [hline2]
    have hbx : bx = 1 - s * R / 4 - Real.sqrt 3 * s ^ 2 / 4 := by
      have hnum : 2 * bx = 2 - s * R / 2 - Real.sqrt 3 * s ^ 2 / 2 := by
        linarith [hsx, hdx]
      linarith [hnum]
    have hqx : qx = 1 + s * R / 4 - Real.sqrt 3 * s ^ 2 / 4 := by
      have hnum : 2 * qx = 2 + s * R / 2 - Real.sqrt 3 * s ^ 2 / 2 := by
        linarith [hsx, hdx]
      linarith [hnum]
    have hby' : yb = (Real.sqrt 3 * s * R - s ^ 2) / 4 := by
      have hnum : 2 * yb = Real.sqrt 3 * s * R / 2 - s ^ 2 / 2 := by
        linarith [hsy, hdy]
      linarith [hnum]
    have hqy' : qy = (Real.sqrt 3 * s * R + s ^ 2) / 4 := by
      have hnum : 2 * qy = Real.sqrt 3 * s * R / 2 + s ^ 2 / 2 := by
        linarith [hsy, hdy]
      linarith [hnum]
    have hby'' : yb = s * (Real.sqrt 3 * R - s) / 4 := by
      nlinarith [hby']
    have hqy'' : qy = s * (s + Real.sqrt 3 * R) / 4 := by
      nlinarith [hqy']
    left
    constructor
    · (ext i; fin_cases i)
      · simp [familyBChordEqHigherAnglePoint, vec2, hbx, hR, EuclideanSpace.single_apply]
      · simp [familyBChordEqHigherAnglePoint, vec2, hby'', hR, EuclideanSpace.single_apply]
    · (ext i; fin_cases i)
      · simp [familyBChordEqLowerAnglePoint, vec2, hqx, hR, EuclideanSpace.single_apply]
      · simp [familyBChordEqLowerAnglePoint, vec2, hqy'', hR, EuclideanSpace.single_apply]
  · have hdx : qx - bx = -(s * R / 2) := by
      have hline1 := hline
      rw [hdy] at hline1
      have hs2_ne : s ^ 2 ≠ 0 := by positivity
      have hline2 := congrArg (fun z : ℝ => z / (s ^ 2)) hline1
      field_simp [hs2_ne] at hline2
      linarith [hline2]
    have hbx : bx = 1 + s * R / 4 - Real.sqrt 3 * s ^ 2 / 4 := by
      have hnum : 2 * bx = 2 + s * R / 2 - Real.sqrt 3 * s ^ 2 / 2 := by
        linarith [hsx, hdx]
      linarith [hnum]
    have hqx : qx = 1 - s * R / 4 - Real.sqrt 3 * s ^ 2 / 4 := by
      have hnum : 2 * qx = 2 - s * R / 2 - Real.sqrt 3 * s ^ 2 / 2 := by
        linarith [hsx, hdx]
      linarith [hnum]
    have hby' : yb = (Real.sqrt 3 * s * R + s ^ 2) / 4 := by
      have hnum : 2 * yb = Real.sqrt 3 * s * R / 2 + s ^ 2 / 2 := by
        linarith [hsy, hdy]
      linarith [hnum]
    have hqy' : qy = (Real.sqrt 3 * s * R - s ^ 2) / 4 := by
      have hnum : 2 * qy = Real.sqrt 3 * s * R / 2 - s ^ 2 / 2 := by
        linarith [hsy, hdy]
      linarith [hnum]
    have hby'' : yb = s * (s + Real.sqrt 3 * R) / 4 := by
      nlinarith [hby']
    have hqy'' : qy = s * (Real.sqrt 3 * R - s) / 4 := by
      nlinarith [hqy']
    right
    constructor
    · (ext i; fin_cases i)
      · simp [familyBChordEqLowerAnglePoint, vec2, hbx, hR, EuclideanSpace.single_apply]
      · simp [familyBChordEqLowerAnglePoint, vec2, hby'', hR, EuclideanSpace.single_apply]
    · (ext i; fin_cases i)
      · simp [familyBChordEqHigherAnglePoint, vec2, hqx, hR, EuclideanSpace.single_apply]
      · simp [familyBChordEqHigherAnglePoint, vec2, hqy'', hR, EuclideanSpace.single_apply]

/-- Family-B chord-equality `rb = s` closes because the classified lower
`α - π / 6` point violates the open-lens MEC disk inequality. -/
theorem qEqE_b2_familyB_chordEq_rbS
    (s ax ay vx vy bx yb qx qy : ℝ)
    (hsHalf : (1 : ℝ) / 2 < s) (hs1 : s < 1)
    (hax : ax = 1 - s ^ 2 / 2)
    (haysq : ay ^ 2 = s ^ 2 - s ^ 4 / 4) (hay_pos : 0 < ay)
    (hv3_circ : (vx - 1) ^ 2 + vy ^ 2 = s ^ 2)
    (hvy : 0 < vy) (hvxlo : 1 - s ^ 2 / 2 ≤ vx) (hvxhi : vx ≤ 1)
    (hb2_circ : (bx - 1) ^ 2 + yb ^ 2 = s ^ 2)
    (ha3_circ : (qx - 1) ^ 2 + qy ^ 2 = s ^ 2)
    (hby : 0 < yb) (hqy : 0 < qy)
    (hb2_disk : s ^ 2 * (vy - yb) + vy * (bx - 1) - (vx - 1) * yb ≤ 0)
    (ha3_disk : s ^ 2 * (vy - qy) + vy * (qx - 1) - (vx - 1) * qy ≤ 0)
    (hCE : (qx - ax) ^ 2 + (qy - ay) ^ 2 = (bx - ax) ^ 2 + (yb - ay) ^ 2)
    (hchord : (qx - bx) ^ 2 + (qy - yb) ^ 2 = s ^ 2) :
    False := by
  have hlower :=
    qEqE_b2_familyB_chordEq_lower_halfplane_pos s vx vy hsHalf hs1 hv3_circ hvy hvxlo hvxhi
  rcases qEqE_b2_familyB_chordEq_classify s ax ay bx yb qx qy hsHalf hs1 hax haysq hay_pos
      hb2_circ ha3_circ hby hqy hCE hchord with h | h
  · rcases h with ⟨_, hq⟩
    have hqx : qx = (familyBChordEqLowerAnglePoint s) 0 := by
      have := congrArg (fun p : ℝ² => p 0) hq
      simpa [vec2, EuclideanSpace.single_apply] using this
    have hqy_eq : qy = (familyBChordEqLowerAnglePoint s) 1 := by
      have := congrArg (fun p : ℝ² => p 1) hq
      simpa [vec2, EuclideanSpace.single_apply] using this
    have hq_disk_pos :
        0 <
          s ^ 2 * (vy - qy) + vy * (qx - 1) - (vx - 1) * qy := by
      simpa [hqx, hqy_eq] using hlower
    linarith
  · rcases h with ⟨hb, _⟩
    have hbx : bx = (familyBChordEqLowerAnglePoint s) 0 := by
      have := congrArg (fun p : ℝ² => p 0) hb
      simpa [vec2, EuclideanSpace.single_apply] using this
    have hyb : yb = (familyBChordEqLowerAnglePoint s) 1 := by
      have := congrArg (fun p : ℝ² => p 1) hb
      simpa [vec2, EuclideanSpace.single_apply] using this
    have hb_disk_pos :
        0 <
          s ^ 2 * (vy - yb) + vy * (bx - 1) - (vx - 1) * yb := by
      simpa [hbx, hyb] using hlower
    linarith


end Problem97
