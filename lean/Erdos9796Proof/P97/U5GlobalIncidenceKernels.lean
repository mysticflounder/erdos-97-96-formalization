/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U5GlobalIncidenceBasic
import Erdos9796Proof.P97.TwoCircleCrossing

/-!
# U5 global-incidence metric kernels

This file contains the slow metric incompatibility lemmas used by the bounded U5
finite-audit extraction.  The lightweight theorem-facing interfaces and
adapters live in `U5GlobalIncidenceBasic.lean` so descriptor/support payload
work does not recompile these kernels.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

/-- A row-specific cocircularity source for the selected candidate supplies the
direct U5 same-circle branch.

This is the theorem-facing bridge for `RT-d2c-*` direct payloads: once a row
proves that the selected endpoint-literal candidate is cospherical with the
dangerous triple, the unique circle through the non-collinear triple is the
dangerous `p`-circle, so the candidate lies on that same `p`-circle.  This
lemma does **not** prove the missing row equality source; it consumes that
source in the neutral `Cospherical (insert u T)` form. -/
theorem u5SameCircleExport_of_cospherical_insert
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hcosph : Cospherical ((insert u T : Finset ℝ²) : Set ℝ²)) :
    U5SameCircleExport D q p T u := by
  refine ⟨hsel.candidate_mem, ?_⟩
  rcases U5DangerousTriple.exists_triple_labels htriple with
    ⟨t1, t2, t3, ht12, ht13, ht23, hT, _hnoncol, ht1_radius, ht2_radius,
      ht3_radius⟩
  rw [cospherical_def] at hcosph
  rcases hcosph with ⟨c, r, hcr⟩
  let s₁ : Sphere ℝ² := ⟨p, dist p q⟩
  let s₂ : Sphere ℝ² := ⟨c, r⟩
  have ht1s₁ : t1 ∈ s₁ := by
    rw [mem_sphere]
    simpa [s₁, dist_comm] using ht1_radius
  have ht2s₁ : t2 ∈ s₁ := by
    rw [mem_sphere]
    simpa [s₁, dist_comm] using ht2_radius
  have ht3s₁ : t3 ∈ s₁ := by
    rw [mem_sphere]
    simpa [s₁, dist_comm] using ht3_radius
  have ht1s₂ : t1 ∈ s₂ := by
    rw [mem_sphere]
    exact hcr t1 (by simp [hT])
  have ht2s₂ : t2 ∈ s₂ := by
    rw [mem_sphere]
    exact hcr t2 (by simp [hT])
  have ht3s₂ : t3 ∈ s₂ := by
    rw [mem_sphere]
    exact hcr t3 (by simp [hT])
  have hus₂ : u ∈ s₂ := by
    rw [mem_sphere]
    exact hcr u (by simp)
  have hs_eq : s₁ = s₂ := by
    by_contra hsne
    rcases two_circle_common_point_eq_endpoint
        (s₁ := s₁) (s₂ := s₂) hsne ht12 ht1s₁ ht2s₁ ht1s₂ ht2s₂
        ht3s₁ ht3s₂ with h31 | h32
    · exact ht13 h31.symm
    · exact ht23 h32.symm
  have hus₁ : u ∈ s₁ := by
    rw [hs_eq]
    exact hus₂
  have hudist : dist u p = dist p q := by
    simpa [s₁] using (mem_sphere.mp hus₁)
  simpa [dist_comm] using hudist

/-- Endpoint-literal descriptor constructor for the direct cocircularity
payload branch.

For a row such as `RT-d2c-v2`, after the row-specific determinant/equality
source has produced `Cospherical (insert v2 T)`, this constructor gives the
actual `U5CandidateDescriptor.producer_payload` field for the selector
`Selects v := v = v2`. -/
def u5EndpointLiteralDescriptor_of_cospherical
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hcosph : Cospherical ((insert u T : Finset ℝ²) : Set ℝ²)) :
    U5CandidateDescriptor D q p T where
  Selects v := v = u
  selected_skeleton := by
    intro v hv
    subst v
    exact hsel
  producer_payload := by
    intro v _hM44 _hU2 _hModeA _htriple hv
    subst v
    exact Or.inl (u5SameCircleExport_of_cospherical_insert htriple hsel hcosph)

/-- Core exact incompatibility behind the bounded-pattern prefilter
`nontriple_equilateral_on_p_circle`.

If a triple point `t` has a selected class containing both `p` and a non-triple
point `x`, and `x` has a selected class containing both `p` and `t`, then
`p,t,x` are mutually equidistant.  Since `t` lies on the dangerous `p`-circle,
`x` is forced onto that circle too, contradicting the bad-pattern hypothesis
that `x` is off it. -/
theorem u5_nontriple_equilateral_on_p_circle_incompatibility
    {D : CounterexampleData} {q p t x : ℝ²} {Bt Bx : Finset ℝ²}
    (ht_radius : dist p t = dist p q)
    (hx_off_circle : dist p x ≠ dist p q)
    (Kt : U5QDeletedK4Class D q t Bt)
    (Kx : U5QDeletedK4Class D q x Bx)
    (hpBt : p ∈ Bt) (hxBt : x ∈ Bt)
    (hpBx : p ∈ Bx) (htBx : t ∈ Bx) : False := by
  have htx : dist t x = dist t p := by
    calc
      dist t x = Kt.radius := Kt.same_radius x hxBt
      _ = dist t p := (Kt.same_radius p hpBt).symm
  have hxt : dist x t = dist x p := by
    calc
      dist x t = Kx.radius := Kx.same_radius t htBx
      _ = dist x p := (Kx.same_radius p hpBx).symm
  have hx_on_circle : dist p x = dist p q := by
    calc
      dist p x = dist x p := dist_comm p x
      _ = dist x t := hxt.symm
      _ = dist t x := dist_comm x t
      _ = dist t p := htx
      _ = dist p t := dist_comm t p
      _ = dist p q := ht_radius
  exact hx_off_circle hx_on_circle

/-- Metric lemma behind the bounded-pattern prefilter
`common_bisector_triple`.

If one non-triple selected center `x` has a q-deleted class containing `p` and
all three dangerous triple points, then those three triple points are common
points of two distinct circles: the dangerous `p`-circle and the selected
`x`-circle through `p`.  Two distinct planar circles cannot share three
non-collinear points. -/
theorem u5_common_bisector_triple_incompatibility
    {D : CounterexampleData} {q p x t1 t2 t3 : ℝ²} {Bx : Finset ℝ²}
    (hr_pos : 0 < dist p q)
    (hT_noncol : ¬ Collinear ℝ ({t1, t2, t3} : Set ℝ²))
    (ht1_radius : dist p t1 = dist p q)
    (ht2_radius : dist p t2 = dist p q)
    (ht3_radius : dist p t3 = dist p q)
    (Kx : U5QDeletedK4Class D q x Bx)
    (hpBx : p ∈ Bx) (ht1Bx : t1 ∈ Bx) (ht2Bx : t2 ∈ Bx)
    (ht3Bx : t3 ∈ Bx) : False := by
  let s₁ : Sphere ℝ² := ⟨p, dist p q⟩
  let s₂ : Sphere ℝ² := ⟨x, Kx.radius⟩
  have hs : s₁ ≠ s₂ := by
    intro hsame
    have hp_s2 : p ∈ s₂ := by
      rw [mem_sphere]
      calc
        dist p x = dist x p := dist_comm p x
        _ = Kx.radius := Kx.same_radius p hpBx
    have hp_s1 : p ∈ s₁ := by simpa [hsame] using hp_s2
    have hzero : dist p p = dist p q := by
      simpa [s₁] using (mem_sphere.mp hp_s1)
    simp at hzero
    subst q
    simp at hr_pos
  have ht12 : t1 ≠ t2 := by
    intro h
    apply hT_noncol
    simpa [h] using (collinear_pair (k := ℝ) t2 t3)
  have ht1s1 : t1 ∈ s₁ := by
    rw [mem_sphere]
    simpa [s₁, dist_comm] using ht1_radius
  have ht2s1 : t2 ∈ s₁ := by
    rw [mem_sphere]
    simpa [s₁, dist_comm] using ht2_radius
  have ht3s1 : t3 ∈ s₁ := by
    rw [mem_sphere]
    simpa [s₁, dist_comm] using ht3_radius
  have ht1s2 : t1 ∈ s₂ := by
    rw [mem_sphere]
    calc
      dist t1 x = dist x t1 := dist_comm t1 x
      _ = Kx.radius := Kx.same_radius t1 ht1Bx
  have ht2s2 : t2 ∈ s₂ := by
    rw [mem_sphere]
    calc
      dist t2 x = dist x t2 := dist_comm t2 x
      _ = Kx.radius := Kx.same_radius t2 ht2Bx
  have ht3s2 : t3 ∈ s₂ := by
    rw [mem_sphere]
    calc
      dist t3 x = dist x t3 := dist_comm t3 x
      _ = Kx.radius := Kx.same_radius t3 ht3Bx
  rcases two_circle_common_point_eq_endpoint
      hs ht12 ht1s1 ht2s1 ht1s2 ht2s2 ht3s1 ht3s2 with h31 | h32
  · apply hT_noncol
    simpa [h31] using (collinear_pair (k := ℝ) t2 t1)
  · apply hT_noncol
    simpa [h32] using (collinear_pair (k := ℝ) t1 t2)

private theorem dist_sq_eq_coord_sq_add_coord_sq (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 :=
  Problem97.dist_sq_coord x y

private theorem dist_eq_of_sq_eq {a b c : ℝ²}
    (h : dist a c ^ 2 = dist b c ^ 2) :
    dist a c = dist b c := by
  exact (sq_eq_sq₀ (dist_nonneg) (dist_nonneg)).mp h

/-- A coordinate point in the normalized U5d-d2c row frame. -/
noncomputable def u5NormalizedRowPoint (x y : ℝ) : ℝ² := !₂[x, y]

/-- The normalized row numerator equality supplies the U5d-d2c cocircularity
source.

In the frame `t1 = (0,0)`, `t2 = (1,0)`, `t3 = (alpha,beta)`, with
`beta ≠ 0`, vanishing of the row numerator
`beta*x + (alpha^2 + beta^2 - alpha)*y - beta*(x^2 + y^2)` places `(x,y)` on the
same circle as the fixed triple.  This is the forward direction needed by the
direct same-circle payload; it does not prove that any concrete row packet has
such a vanishing numerator. -/
theorem u5_normalized_row_cocircular_of_row_numerator_eq_zero
    {alpha beta x y : ℝ} (hbeta : beta ≠ 0)
    (hN : beta * x + (alpha ^ 2 + beta ^ 2 - alpha) * y
        - beta * (x ^ 2 + y ^ 2) = 0) :
    Cospherical ((({u5NormalizedRowPoint x y, u5NormalizedRowPoint 0 0,
      u5NormalizedRowPoint 1 0, u5NormalizedRowPoint alpha beta} :
      Finset ℝ²)) : Set ℝ²) := by
  rw [cospherical_def]
  let c : ℝ² := u5NormalizedRowPoint (1 / 2)
    ((alpha ^ 2 + beta ^ 2 - alpha) / (2 * beta))
  refine ⟨c, dist (u5NormalizedRowPoint 0 0) c, ?_⟩
  intro z hz
  have hz' : z = u5NormalizedRowPoint x y ∨
      z = u5NormalizedRowPoint 0 0 ∨
      z = u5NormalizedRowPoint 1 0 ∨
      z = u5NormalizedRowPoint alpha beta := by
    simpa only [Finset.mem_coe, Finset.mem_insert, Finset.mem_singleton] using hz
  rcases hz' with rfl | rfl | rfl | rfl
  · apply dist_eq_of_sq_eq
    rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq]
    simp only [u5NormalizedRowPoint, c, Matrix.cons_val_zero, Matrix.cons_val_one]
    have hdiff :
        ((x - (1 / 2)) ^ 2
            + (y - (alpha ^ 2 + beta ^ 2 - alpha) / (2 * beta)) ^ 2)
          - ((0 - (1 / 2)) ^ 2
            + (0 - (alpha ^ 2 + beta ^ 2 - alpha) / (2 * beta)) ^ 2)
          = -(beta * x + (alpha ^ 2 + beta ^ 2 - alpha) * y
            - beta * (x ^ 2 + y ^ 2)) / beta := by
      field_simp [hbeta]
      ring
    rw [show (-(beta * x + (alpha ^ 2 + beta ^ 2 - alpha) * y
            - beta * (x ^ 2 + y ^ 2)) / beta) = 0 by rw [hN]; simp] at hdiff
    linarith
  · rfl
  · apply dist_eq_of_sq_eq
    rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq]
    simp only [u5NormalizedRowPoint, c, Matrix.cons_val_zero, Matrix.cons_val_one]
    ring
  · apply dist_eq_of_sq_eq
    rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq]
    have h2beta : (2 : ℝ) * beta ≠ 0 := mul_ne_zero two_ne_zero hbeta
    simp only [u5NormalizedRowPoint, c, Matrix.cons_val_zero, Matrix.cons_val_one]
    field_simp [h2beta, hbeta]
    ring

/-- Insert-form version of
`u5_normalized_row_cocircular_of_row_numerator_eq_zero`, matching the
`u5SameCircleExport_of_cospherical_insert` input shape. -/
theorem u5_normalized_row_cocircular_insert_of_row_numerator_eq_zero
    {alpha beta x y : ℝ} {T : Finset ℝ²}
    (hT : T = {u5NormalizedRowPoint 0 0, u5NormalizedRowPoint 1 0,
      u5NormalizedRowPoint alpha beta})
    (hbeta : beta ≠ 0)
    (hN : beta * x + (alpha ^ 2 + beta ^ 2 - alpha) * y
        - beta * (x ^ 2 + y ^ 2) = 0) :
    Cospherical ((insert (u5NormalizedRowPoint x y) T : Finset ℝ²) : Set ℝ²) := by
  subst T
  simpa using u5_normalized_row_cocircular_of_row_numerator_eq_zero hbeta hN

/-- Endpoint-literal descriptor constructor for a normalized row once the row
has proved the required numerator equality.

This is the completed direct-branch wiring for a row such as `RT-d2c-v2`: the
only remaining row-specific input is the proof that its normalized numerator
vanishes. -/
def u5EndpointLiteralDescriptor_of_normalized_row_numerator_eq_zero
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²}
    {alpha beta x y : ℝ}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T
      (u5NormalizedRowPoint x y))
    (hT : T = {u5NormalizedRowPoint 0 0, u5NormalizedRowPoint 1 0,
      u5NormalizedRowPoint alpha beta})
    (hbeta : beta ≠ 0)
    (hN : beta * x + (alpha ^ 2 + beta ^ 2 - alpha) * y
        - beta * (x ^ 2 + y ^ 2) = 0) :
    U5CandidateDescriptor D q p T :=
  u5EndpointLiteralDescriptor_of_cospherical htriple hsel
    (u5_normalized_row_cocircular_insert_of_row_numerator_eq_zero
      hT hbeta hN)

set_option maxHeartbeats 1000000 in
-- The proof performs a coordinate Gram-determinant elimination in `ℝ²`.
/-- Metric lemma behind the bounded-pattern prefilter
`unit_triangle_on_p_circle`.

There are no four planar points `p,t1,t2,t3` whose six pairwise distances are
all the same positive radius.  In coordinates, the three vectors from `p` to
the triple points would have Gram matrix with diagonal `r²` and off-diagonal
`r²/2`, whose determinant is positive; every three-vector Gram determinant in
the plane is zero. -/
theorem u5_unit_triangle_on_p_circle_incompatibility
    {p t1 t2 t3 : ℝ²} {r : ℝ} (hr : 0 < r)
    (hp1 : dist p t1 = r) (hp2 : dist p t2 = r) (hp3 : dist p t3 = r)
    (h12 : dist t1 t2 = r) (h13 : dist t1 t3 = r)
    (h23 : dist t2 t3 = r) : False := by
  have hp1sq : dist p t1 ^ 2 = r ^ 2 := by rw [hp1]
  have hp2sq : dist p t2 ^ 2 = r ^ 2 := by rw [hp2]
  have hp3sq : dist p t3 ^ 2 = r ^ 2 := by rw [hp3]
  have h12sq : dist t1 t2 ^ 2 = r ^ 2 := by rw [h12]
  have h13sq : dist t1 t3 ^ 2 = r ^ 2 := by rw [h13]
  have h23sq : dist t2 t3 ^ 2 = r ^ 2 := by rw [h23]
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hp1sq hp2sq hp3sq h12sq h13sq h23sq
  set a0 := p 0 - t1 0
  set a1 := p 1 - t1 1
  set b0 := p 0 - t2 0
  set b1 := p 1 - t2 1
  set c0 := p 0 - t3 0
  set c1 := p 1 - t3 1
  set R := r ^ 2
  have hR : 0 < R := by positivity
  have haa : a0 ^ 2 + a1 ^ 2 = R := by
    simpa [a0, a1, R] using hp1sq
  have hbb : b0 ^ 2 + b1 ^ 2 = R := by
    simpa [b0, b1, R] using hp2sq
  have hcc : c0 ^ 2 + c1 ^ 2 = R := by
    simpa [c0, c1, R] using hp3sq
  have hab : a0 * b0 + a1 * b1 = R / 2 := by
    dsimp [a0, a1, b0, b1, R]
    nlinarith [hp1sq, hp2sq, h12sq]
  have hac : a0 * c0 + a1 * c1 = R / 2 := by
    dsimp [a0, a1, c0, c1, R]
    nlinarith [hp1sq, hp3sq, h13sq]
  have hbc : b0 * c0 + b1 * c1 = R / 2 := by
    dsimp [b0, b1, c0, c1, R]
    nlinarith [hp2sq, hp3sq, h23sq]
  have hgram :
      (a0 ^ 2 + a1 ^ 2) * (b0 ^ 2 + b1 ^ 2) * (c0 ^ 2 + c1 ^ 2)
        + 2 * (a0 * b0 + a1 * b1) * (a0 * c0 + a1 * c1)
          * (b0 * c0 + b1 * c1)
        - (a0 ^ 2 + a1 ^ 2) * (b0 * c0 + b1 * c1) ^ 2
        - (b0 ^ 2 + b1 ^ 2) * (a0 * c0 + a1 * c1) ^ 2
        - (c0 ^ 2 + c1 ^ 2) * (a0 * b0 + a1 * b1) ^ 2 = 0 := by
    ring
  rw [haa, hbb, hcc, hab, hac, hbc] at hgram
  ring_nf at hgram
  have hpos : 0 < R ^ 3 * (1 / 2 : ℝ) := by positivity
  linarith

/-- q-critical support incompatibility: two dangerous-triple centers cannot both
have q-critical classes through `p` if one class also contains the other
center.

The deleted point `q` is implicit in each `U5QCriticalTripleClass`: the three
recorded points are exactly the surviving companions to `q` on the same
centered circle.  If the two q-critical classes both contain `p`, and one
also contains the other triple center, then `q,t₁,t₂` form a unit triangle on
the dangerous `p`-circle, contradicting
`u5_unit_triangle_on_p_circle_incompatibility`. -/
theorem U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility
    {D : CounterexampleData} {q p t₁ t₂ : ℝ²} {T B₁ B₂ : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (ht₁ : t₁ ∈ T) (ht₂ : t₂ ∈ T)
    (K₁ : U5QCriticalTripleClass D q t₁ B₁)
    (K₂ : U5QCriticalTripleClass D q t₂ B₂)
    (hpB₁ : p ∈ B₁) (hpB₂ : p ∈ B₂)
    (hadj : t₂ ∈ B₁ ∨ t₁ ∈ B₂) : False := by
  have hq_t₁ : dist q t₁ = dist p q := by
    calc
      dist q t₁ = dist t₁ q := dist_comm q t₁
      _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have hq_t₂ : dist q t₂ = dist p q := by
    calc
      dist q t₂ = dist t₂ q := dist_comm q t₂
      _ = dist t₂ p := (K₂.same_q_radius p hpB₂).symm
      _ = dist p t₂ := dist_comm t₂ p
      _ = dist p q := htriple.T_same_radius t₂ ht₂
  have ht₁_t₂ : dist t₁ t₂ = dist p q := by
    rcases hadj with ht₂B₁ | ht₁B₂
    · calc
        dist t₁ t₂ = dist t₁ q := K₁.same_q_radius t₂ ht₂B₁
        _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
        _ = dist p t₁ := dist_comm t₁ p
        _ = dist p q := htriple.T_same_radius t₁ ht₁
    · calc
        dist t₁ t₂ = dist t₂ t₁ := dist_comm t₁ t₂
        _ = dist t₂ q := K₂.same_q_radius t₁ ht₁B₂
        _ = dist t₂ p := (K₂.same_q_radius p hpB₂).symm
        _ = dist p t₂ := dist_comm t₂ p
        _ = dist p q := htriple.T_same_radius t₂ ht₂
  exact u5_unit_triangle_on_p_circle_incompatibility htriple.q_radius_pos
    rfl (htriple.T_same_radius t₁ ht₁) (htriple.T_same_radius t₂ ht₂)
    hq_t₁ hq_t₂ ht₁_t₂

/-- q-critical support incompatibility: two dangerous-triple centers cannot both
have q-critical classes through `p` that also contain the same remaining
dangerous-triple point.

The two q-critical center-circles would have three common points: `p`, `q`,
and the remaining triple point.  Since the centers are distinct, this
contradicts the two-circle intersection theorem. -/
theorem U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility
    {D : CounterexampleData} {q p t₁ t₂ t₃ : ℝ²} {T B₁ B₂ : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (_ht₁ : t₁ ∈ T) (_ht₂ : t₂ ∈ T) (ht₃ : t₃ ∈ T)
    (ht₁₂ : t₁ ≠ t₂)
    (K₁ : U5QCriticalTripleClass D q t₁ B₁)
    (K₂ : U5QCriticalTripleClass D q t₂ B₂)
    (hpB₁ : p ∈ B₁) (hpB₂ : p ∈ B₂)
    (ht₃B₁ : t₃ ∈ B₁) (ht₃B₂ : t₃ ∈ B₂) : False := by
  let s₁ : Sphere ℝ² := ⟨t₁, dist t₁ q⟩
  let s₂ : Sphere ℝ² := ⟨t₂, dist t₂ q⟩
  have hsne : s₁ ≠ s₂ := by
    intro h
    exact ht₁₂ (congrArg (fun s : Sphere ℝ² => s.1) h)
  have hps₁ : p ∈ s₁ := by
    rw [mem_sphere]
    calc
      dist p t₁ = dist t₁ p := dist_comm p t₁
      _ = dist t₁ q := K₁.same_q_radius p hpB₁
  have hqs₁ : q ∈ s₁ := by
    rw [mem_sphere]
    exact dist_comm q t₁
  have ht₃s₁ : t₃ ∈ s₁ := by
    rw [mem_sphere]
    calc
      dist t₃ t₁ = dist t₁ t₃ := dist_comm t₃ t₁
      _ = dist t₁ q := K₁.same_q_radius t₃ ht₃B₁
  have hps₂ : p ∈ s₂ := by
    rw [mem_sphere]
    calc
      dist p t₂ = dist t₂ p := dist_comm p t₂
      _ = dist t₂ q := K₂.same_q_radius p hpB₂
  have hqs₂ : q ∈ s₂ := by
    rw [mem_sphere]
    exact dist_comm q t₂
  have ht₃s₂ : t₃ ∈ s₂ := by
    rw [mem_sphere]
    calc
      dist t₃ t₂ = dist t₂ t₃ := dist_comm t₃ t₂
      _ = dist t₂ q := K₂.same_q_radius t₃ ht₃B₂
  have ht₃_ne_p : t₃ ≠ p := (Finset.mem_erase.mp (htriple.T_subset ht₃)).1
  have ht₃_ne_q : t₃ ≠ q := by
    have ht₃_skeleton : t₃ ∈ D.skeleton q :=
      (Finset.mem_erase.mp (htriple.T_subset ht₃)).2
    have ht₃_erase_q : t₃ ∈ D.A.erase q := by
      change t₃ ∈ D.A.erase q at ht₃_skeleton
      exact ht₃_skeleton
    exact (Finset.mem_erase.mp ht₃_erase_q).1
  rcases two_circle_common_point_eq_endpoint
      hsne htriple.p_ne_q hps₁ hqs₁ hps₂ hqs₂ ht₃s₁ ht₃s₂ with
    ht₃p | ht₃q
  · exact ht₃_ne_p ht₃p
  · exact ht₃_ne_q ht₃q

set_option maxHeartbeats 1000000 in
-- Scalar form of the two Gram-factor eliminations in
-- `u5_qcritical_aux_center_metric_incompatibility`.
theorem u5_chain_antipodal_coord
    {q0 q1 a0 a1 b0 b1 c0 c1 R : ℝ}
    (hR : 0 < R)
    (hqq : q0 ^ 2 + q1 ^ 2 = R)
    (haa : a0 ^ 2 + a1 ^ 2 = R)
    (hbb : b0 ^ 2 + b1 ^ 2 = R)
    (hcc : c0 ^ 2 + c1 ^ 2 = R)
    (hqadot : q0 * a0 + q1 * a1 = R / 2)
    (habdot : a0 * b0 + a1 * b1 = R / 2)
    (hbcdot : b0 * c0 + b1 * c1 = R / 2)
    (hQ2_ne_R : q0 * b0 + q1 * b1 ≠ R)
    (hA3_ne_R : a0 * c0 + a1 * c1 ≠ R) :
    q0 + c0 = 0 ∧ q1 + c1 = 0 := by
  set Q2 := q0 * b0 + q1 * b1
  have hgram_q12 :
      (q0 ^ 2 + q1 ^ 2) * (a0 ^ 2 + a1 ^ 2) * (b0 ^ 2 + b1 ^ 2)
        + 2 * (q0 * a0 + q1 * a1) * (q0 * b0 + q1 * b1)
          * (a0 * b0 + a1 * b1)
        - (q0 ^ 2 + q1 ^ 2) * (a0 * b0 + a1 * b1) ^ 2
        - (a0 ^ 2 + a1 ^ 2) * (q0 * b0 + q1 * b1) ^ 2
        - (b0 ^ 2 + b1 ^ 2) * (q0 * a0 + q1 * a1) ^ 2 = 0 := by
    ring
  rw [hqq, haa, hbb, hqadot, habdot] at hgram_q12
  have hgram_q12' :
      R * R * R + 2 * (R / 2) * Q2 * (R / 2) - R * (R / 2) ^ 2 -
        R * Q2 ^ 2 - R * (R / 2) ^ 2 = 0 := by
    simpa [Q2] using hgram_q12
  have hQ2 : Q2 = -R / 2 := by
    have hfacR : R * ((Q2 - R) * (2 * Q2 + R)) = 0 := by
      linear_combination -2 * hgram_q12'
    have hfac : (Q2 - R) * (2 * Q2 + R) = 0 :=
      (mul_eq_zero.mp hfacR).resolve_left (ne_of_gt hR)
    rcases mul_eq_zero.mp hfac with hleft | hright
    · exfalso
      exact hQ2_ne_R (by simpa [Q2] using sub_eq_zero.mp hleft)
    · linarith
  set A3 := a0 * c0 + a1 * c1
  have hgram_123 :
      (a0 ^ 2 + a1 ^ 2) * (b0 ^ 2 + b1 ^ 2) * (c0 ^ 2 + c1 ^ 2)
        + 2 * (a0 * b0 + a1 * b1) * (a0 * c0 + a1 * c1)
          * (b0 * c0 + b1 * c1)
        - (a0 ^ 2 + a1 ^ 2) * (b0 * c0 + b1 * c1) ^ 2
        - (b0 ^ 2 + b1 ^ 2) * (a0 * c0 + a1 * c1) ^ 2
        - (c0 ^ 2 + c1 ^ 2) * (a0 * b0 + a1 * b1) ^ 2 = 0 := by
    ring
  rw [haa, hbb, hcc, habdot, hbcdot] at hgram_123
  have hgram_123' :
      R * R * R + 2 * (R / 2) * A3 * (R / 2) - R * (R / 2) ^ 2 -
        R * A3 ^ 2 - R * (R / 2) ^ 2 = 0 := by
    simpa [A3] using hgram_123
  have hA3 : A3 = -R / 2 := by
    have hfacR : R * ((A3 - R) * (2 * A3 + R)) = 0 := by
      linear_combination -2 * hgram_123'
    have hfac : (A3 - R) * (2 * A3 + R) = 0 :=
      (mul_eq_zero.mp hfacR).resolve_left (ne_of_gt hR)
    rcases mul_eq_zero.mp hfac with hleft | hright
    · exfalso
      exact hA3_ne_R (by simpa [A3] using sub_eq_zero.mp hleft)
    · linarith
  have hlin1_sq : (q0 + b0 - a0) ^ 2 + (q1 + b1 - a1) ^ 2 = 0 := by
    linear_combination hqq + hbb + haa + 2 * hQ2 - 2 * hqadot -
      2 * habdot
  have hlin1_0 : q0 + b0 - a0 = 0 := by
    nlinarith [hlin1_sq, sq_nonneg (q0 + b0 - a0),
      sq_nonneg (q1 + b1 - a1)]
  have hlin1_1 : q1 + b1 - a1 = 0 := by
    nlinarith [hlin1_sq, sq_nonneg (q0 + b0 - a0),
      sq_nonneg (q1 + b1 - a1)]
  have hlin2_sq : (a0 + c0 - b0) ^ 2 + (a1 + c1 - b1) ^ 2 = 0 := by
    linear_combination haa + hcc + hbb + 2 * hA3 - 2 * habdot -
      2 * hbcdot
  have hlin2_0 : a0 + c0 - b0 = 0 := by
    nlinarith [hlin2_sq, sq_nonneg (a0 + c0 - b0),
      sq_nonneg (a1 + c1 - b1)]
  have hlin2_1 : a1 + c1 - b1 = 0 := by
    nlinarith [hlin2_sq, sq_nonneg (a0 + c0 - b0),
      sq_nonneg (a1 + c1 - b1)]
  constructor
  · linear_combination hlin1_0 + hlin2_0
  · linear_combination hlin1_1 + hlin2_1

set_option maxHeartbeats 1000000 in
-- First half of the q-critical chain: the second intersection of the
-- `p`- and `t₁`-circles is forced by a planar Gram determinant.
private theorem u5_first_chain_coord
    {q0 q1 a0 a1 b0 b1 R : ℝ}
    (hR : 0 < R)
    (hqq : q0 ^ 2 + q1 ^ 2 = R)
    (haa : a0 ^ 2 + a1 ^ 2 = R)
    (hbb : b0 ^ 2 + b1 ^ 2 = R)
    (hqadot : q0 * a0 + q1 * a1 = R / 2)
    (habdot : a0 * b0 + a1 * b1 = R / 2)
    (hQ2_ne_R : q0 * b0 + q1 * b1 ≠ R) :
    q0 + b0 - a0 = 0 ∧ q1 + b1 - a1 = 0 := by
  set Q2 := q0 * b0 + q1 * b1
  have hgram_q12 :
      (q0 ^ 2 + q1 ^ 2) * (a0 ^ 2 + a1 ^ 2) * (b0 ^ 2 + b1 ^ 2)
        + 2 * (q0 * a0 + q1 * a1) * (q0 * b0 + q1 * b1)
          * (a0 * b0 + a1 * b1)
        - (q0 ^ 2 + q1 ^ 2) * (a0 * b0 + a1 * b1) ^ 2
        - (a0 ^ 2 + a1 ^ 2) * (q0 * b0 + q1 * b1) ^ 2
        - (b0 ^ 2 + b1 ^ 2) * (q0 * a0 + q1 * a1) ^ 2 = 0 := by
    ring
  rw [hqq, haa, hbb, hqadot, habdot] at hgram_q12
  have hgram_q12' :
      R * R * R + 2 * (R / 2) * Q2 * (R / 2) - R * (R / 2) ^ 2 -
        R * Q2 ^ 2 - R * (R / 2) ^ 2 = 0 := by
    simpa [Q2] using hgram_q12
  have hQ2 : Q2 = -R / 2 := by
    have hfacR : R * ((Q2 - R) * (2 * Q2 + R)) = 0 := by
      linear_combination -2 * hgram_q12'
    have hfac : (Q2 - R) * (2 * Q2 + R) = 0 :=
      (mul_eq_zero.mp hfacR).resolve_left (ne_of_gt hR)
    rcases mul_eq_zero.mp hfac with hleft | hright
    · exfalso
      exact hQ2_ne_R (by simpa [Q2] using sub_eq_zero.mp hleft)
    · linarith
  have hlin_sq : (q0 + b0 - a0) ^ 2 + (q1 + b1 - a1) ^ 2 = 0 := by
    linear_combination hqq + hbb + haa + 2 * hQ2 - 2 * hqadot -
      2 * habdot
  constructor
  · nlinarith [hlin_sq, sq_nonneg (q0 + b0 - a0),
      sq_nonneg (q1 + b1 - a1)]
  · nlinarith [hlin_sq, sq_nonneg (q0 + b0 - a0),
      sq_nonneg (q1 + b1 - a1)]

set_option maxHeartbeats 1000000 in
-- This scalar proof uses a planar Gram determinant plus polynomial
-- square-zero extraction.
private theorem u5_collinear_aux_center_coord_incompatibility
    {q0 q1 a0 a1 u0 u1 x0 x1 R S : ℝ}
    (hR : 0 < R)
    (hqq : q0 ^ 2 + q1 ^ 2 = R)
    (haa : a0 ^ 2 + a1 ^ 2 = R)
    (hS : u0 ^ 2 + u1 ^ 2 = S)
    (hqadot : q0 * a0 + q1 * a1 = R / 2)
    (hqudot : q0 * u0 + q1 * u1 = 0)
    (haudot : a0 * u0 + a1 * u1 = S / 2)
    (hSpos : 0 < S)
    (hx_aq : x0 * a0 + x1 * a1 - (x0 * q0 + x1 * q1) = 0)
    (hx_uq_twice :
      2 * (x0 * u0 + x1 * u1 - (x0 * q0 + x1 * q1)) = S - R) :
    False := by
  have hgram_qau :
      (q0 ^ 2 + q1 ^ 2) * (a0 ^ 2 + a1 ^ 2) * (u0 ^ 2 + u1 ^ 2)
        + 2 * (q0 * a0 + q1 * a1) * (q0 * u0 + q1 * u1)
          * (a0 * u0 + a1 * u1)
        - (q0 ^ 2 + q1 ^ 2) * (a0 * u0 + a1 * u1) ^ 2
        - (a0 ^ 2 + a1 ^ 2) * (q0 * u0 + q1 * u1) ^ 2
        - (u0 ^ 2 + u1 ^ 2) * (q0 * a0 + q1 * a1) ^ 2 = 0 := by
    ring
  rw [hqq, haa, hS, hqadot, hqudot, haudot] at hgram_qau
  ring_nf at hgram_qau
  have hSeq : S = 3 * R := by
    have hfac : R * S * (3 * R - S) = 0 := by
      nlinarith [hgram_qau]
    rcases mul_eq_zero.mp hfac with hRSzero | hlin
    · rcases mul_eq_zero.mp hRSzero with hRzero | hSzero
      · exact False.elim ((ne_of_gt hR) hRzero)
      · exact False.elim ((ne_of_gt hSpos) hSzero)
    · linarith
  have hu_line_sq : (u0 - (2 * a0 - q0)) ^ 2 +
      (u1 - (2 * a1 - q1)) ^ 2 = 0 := by
    nlinarith [hS, hqq, haa, hqadot, hqudot, haudot, hSeq]
  have hu_line0 : u0 - (2 * a0 - q0) = 0 := by
    nlinarith [hu_line_sq, sq_nonneg (u0 - (2 * a0 - q0)),
      sq_nonneg (u1 - (2 * a1 - q1))]
  have hu_line1 : u1 - (2 * a1 - q1) = 0 := by
    nlinarith [hu_line_sq, sq_nonneg (u0 - (2 * a0 - q0)),
      sq_nonneg (u1 - (2 * a1 - q1))]
  have hx_uq_zero :
      x0 * u0 + x1 * u1 - (x0 * q0 + x1 * q1) = 0 := by
    linear_combination x0 * hu_line0 + x1 * hu_line1 + 2 * hx_aq
  have hx_uq_R :
      x0 * u0 + x1 * u1 - (x0 * q0 + x1 * q1) = R := by
    nlinarith [hx_uq_twice, hSeq]
  nlinarith [hR, hx_uq_zero, hx_uq_R]

private theorem u5_dot_difference_of_sqdist_eq
    {x0 x1 y0 y1 z0 z1 Y Z : ℝ}
    (hy : y0 ^ 2 + y1 ^ 2 = Y)
    (hz : z0 ^ 2 + z1 ^ 2 = Z)
    (hdist :
      (y0 - x0) ^ 2 + (y1 - x1) ^ 2 =
        (z0 - x0) ^ 2 + (z1 - x1) ^ 2) :
    2 * (x0 * y0 + x1 * y1 - (x0 * z0 + x1 * z1)) = Y - Z := by
  nlinarith [hy, hz, hdist]

-- The Gram determinant hypotheses are consumed through normalization after
-- rewriting; the declaration linter reports the normalized-away names.
set_option linter.unusedVariables false in
set_option maxHeartbeats 1000000 in
-- The first-chain scalar data force `|u - q|^2 = 4R`, contradicting a tail
-- equation that forces `|u - q|^2 = R`.
private theorem u5_selected_tail_radius_coord_incompatibility
    {q0 q1 a0 a1 u0 u1 R S : ℝ}
    (hR : 0 < R)
    (hqq : q0 ^ 2 + q1 ^ 2 = R)
    (haa : a0 ^ 2 + a1 ^ 2 = R)
    (hS : u0 ^ 2 + u1 ^ 2 = S)
    (hqadot : q0 * a0 + q1 * a1 = R / 2)
    (hqudot : q0 * u0 + q1 * u1 = 0)
    (haudot : a0 * u0 + a1 * u1 = S / 2)
    (hSpos : 0 < S)
    (huqsq_coord : (u0 - q0) ^ 2 + (u1 - q1) ^ 2 = R) :
    False := by
  have hgram_qau :
      (q0 ^ 2 + q1 ^ 2) * (a0 ^ 2 + a1 ^ 2) * (u0 ^ 2 + u1 ^ 2)
        + 2 * (q0 * a0 + q1 * a1) * (q0 * u0 + q1 * u1)
          * (a0 * u0 + a1 * u1)
        - (q0 ^ 2 + q1 ^ 2) * (a0 * u0 + a1 * u1) ^ 2
        - (a0 ^ 2 + a1 ^ 2) * (q0 * u0 + q1 * u1) ^ 2
        - (u0 ^ 2 + u1 ^ 2) * (q0 * a0 + q1 * a1) ^ 2 = 0 := by
    ring
  rw [hqq, haa, hS, hqadot, hqudot, haudot] at hgram_qau
  ring_nf at hgram_qau
  have hSeq : S = 3 * R := by
    have hfac : R * S * (3 * R - S) = 0 := by
      nlinarith [hgram_qau]
    rcases mul_eq_zero.mp hfac with hRSzero | hlin
    · rcases mul_eq_zero.mp hRSzero with hRzero | hSzero
      · exact False.elim ((ne_of_gt hR) hRzero)
      · exact False.elim ((ne_of_gt hSpos) hSzero)
    · linarith
  have huqsq_four :
      (u0 - q0) ^ 2 + (u1 - q1) ^ 2 = 4 * R := by
    nlinarith [hS, hqq, hqudot, hSeq]
  nlinarith [hR, huqsq_coord, huqsq_four]

set_option maxHeartbeats 1000000 in
-- First-chain scalar data force the selected point to the third vertex of the
-- `q,t₁,u` collinear chain.
private theorem u5_first_chain_selected_coord
    {q0 q1 a0 a1 u0 u1 R S : ℝ}
    (hR : 0 < R)
    (hqq : q0 ^ 2 + q1 ^ 2 = R)
    (haa : a0 ^ 2 + a1 ^ 2 = R)
    (hS : u0 ^ 2 + u1 ^ 2 = S)
    (hqadot : q0 * a0 + q1 * a1 = R / 2)
    (hqudot : q0 * u0 + q1 * u1 = 0)
    (haudot : a0 * u0 + a1 * u1 = S / 2)
    (hSpos : 0 < S) :
    u0 - (2 * a0 - q0) = 0 ∧ u1 - (2 * a1 - q1) = 0 := by
  have hgram_qau :
      (q0 ^ 2 + q1 ^ 2) * (a0 ^ 2 + a1 ^ 2) * (u0 ^ 2 + u1 ^ 2)
        + 2 * (q0 * a0 + q1 * a1) * (q0 * u0 + q1 * u1)
          * (a0 * u0 + a1 * u1)
        - (q0 ^ 2 + q1 ^ 2) * (a0 * u0 + a1 * u1) ^ 2
        - (a0 ^ 2 + a1 ^ 2) * (q0 * u0 + q1 * u1) ^ 2
        - (u0 ^ 2 + u1 ^ 2) * (q0 * a0 + q1 * a1) ^ 2 = 0 := by
    ring
  rw [hqq, haa, hS, hqadot, hqudot, haudot] at hgram_qau
  ring_nf at hgram_qau
  have hSeq : S = 3 * R := by
    have hfac : R * S * (3 * R - S) = 0 := by
      nlinarith [hgram_qau]
    rcases mul_eq_zero.mp hfac with hRSzero | hlin
    · rcases mul_eq_zero.mp hRSzero with hRzero | hSzero
      · exact False.elim ((ne_of_gt hR) hRzero)
      · exact False.elim ((ne_of_gt hSpos) hSzero)
    · linarith
  have hu_line_sq : (u0 - (2 * a0 - q0)) ^ 2 +
      (u1 - (2 * a1 - q1)) ^ 2 = 0 := by
    nlinarith [hS, hqq, haa, hqadot, hqudot, haudot, hSeq]
  constructor
  · nlinarith [hu_line_sq, sq_nonneg (u0 - (2 * a0 - q0)),
      sq_nonneg (u1 - (2 * a1 - q1))]
  · nlinarith [hu_line_sq, sq_nonneg (u0 - (2 * a0 - q0)),
      sq_nonneg (u1 - (2 * a1 - q1))]

private theorem u5_antipodal_aux_center_coord_incompatibility
    {q0 q1 c0 c1 x0 x1 R S : ℝ}
    (hR : 0 < R) (hqc0 : q0 + c0 = 0) (hqc1 : q1 + c1 = 0)
    (hqxdot : q0 * x0 + q1 * x1 = R / 2)
    (hcxdot : c0 * x0 + c1 * x1 = S / 2) (hSnonneg : 0 ≤ S) :
    False := by
  have hcx_neg : c0 * x0 + c1 * x1 = -R / 2 := by
    linear_combination x0 * hqc0 + x1 * hqc1 - hqxdot
  have hSneg : S = -R := by
    nlinarith [hcxdot, hcx_neg]
  nlinarith

set_option maxHeartbeats 5000000 in
-- The proof extracts the forced regular-hexagon chain by planar Gram
-- determinants, then uses the auxiliary center's perpendicular-bisector data.
/-- Metric lemma behind the first q-critical auxiliary-center incompatibility.

Let `q,t₁,t₂,t₃` be a unit chain on the dangerous `p`-circle:
`q` and `t₂` are the two non-degenerate intersections of the `p`- and
`t₁`-circles, and `t₁` and `t₃` are the two non-degenerate intersections of the
`p`- and `t₂`-circles.  Then `t₃` is antipodal to `q`.  No point can be
equidistant from `p` and `q` while also lying on the unit circle centered at
`t₃`. -/
theorem u5_qcritical_aux_center_metric_incompatibility
    {p q t₁ t₂ t₃ a : ℝ²} {r : ℝ} (hr : 0 < r)
    (hpq : dist p q = r) (hpt₁ : dist p t₁ = r)
    (hpt₂ : dist p t₂ = r) (hpt₃ : dist p t₃ = r)
    (ht₁q : dist t₁ q = r) (ht₁t₂ : dist t₁ t₂ = r)
    (ht₂t₃ : dist t₂ t₃ = r)
    (hq_ne_t₂ : q ≠ t₂) (ht₁_ne_t₃ : t₁ ≠ t₃)
    (hapq : dist a p = dist a q)
    (ht₃a : dist t₃ a = r) : False := by
  have hpqsq : dist p q ^ 2 = r ^ 2 := by rw [hpq]
  have hp1sq : dist p t₁ ^ 2 = r ^ 2 := by rw [hpt₁]
  have hp2sq : dist p t₂ ^ 2 = r ^ 2 := by rw [hpt₂]
  have hp3sq : dist p t₃ ^ 2 = r ^ 2 := by rw [hpt₃]
  have h1qsq : dist t₁ q ^ 2 = r ^ 2 := by rw [ht₁q]
  have h12sq : dist t₁ t₂ ^ 2 = r ^ 2 := by rw [ht₁t₂]
  have h23sq : dist t₂ t₃ ^ 2 = r ^ 2 := by rw [ht₂t₃]
  have hapqsq : dist a p ^ 2 = dist a q ^ 2 := by rw [hapq]
  have h3asq : dist t₃ a ^ 2 = r ^ 2 := by rw [ht₃a]
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpqsq hp1sq hp2sq hp3sq h1qsq h12sq h23sq
  rw [dist_sq_eq_coord_sq_add_coord_sq a p,
    dist_sq_eq_coord_sq_add_coord_sq a q] at hapqsq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at h3asq
  set q0 := p 0 - q 0
  set q1 := p 1 - q 1
  set a0 := p 0 - t₁ 0
  set a1 := p 1 - t₁ 1
  set b0 := p 0 - t₂ 0
  set b1 := p 1 - t₂ 1
  set c0 := p 0 - t₃ 0
  set c1 := p 1 - t₃ 1
  set x0 := p 0 - a 0
  set x1 := p 1 - a 1
  set R := r ^ 2
  set S := x0 ^ 2 + x1 ^ 2
  have hR : 0 < R := by positivity
  have hqq : q0 ^ 2 + q1 ^ 2 = R := by
    simpa [q0, q1, R] using hpqsq
  have haa : a0 ^ 2 + a1 ^ 2 = R := by
    simpa [a0, a1, R] using hp1sq
  have hbb : b0 ^ 2 + b1 ^ 2 = R := by
    simpa [b0, b1, R] using hp2sq
  have hcc : c0 ^ 2 + c1 ^ 2 = R := by
    simpa [c0, c1, R] using hp3sq
  have hqadot : q0 * a0 + q1 * a1 = R / 2 := by
    dsimp [q0, q1, a0, a1, R]
    nlinarith [hpqsq, hp1sq, h1qsq]
  have habdot : a0 * b0 + a1 * b1 = R / 2 := by
    dsimp [a0, a1, b0, b1, R]
    nlinarith [hp1sq, hp2sq, h12sq]
  have hbcdot : b0 * c0 + b1 * c1 = R / 2 := by
    dsimp [b0, b1, c0, c1, R]
    nlinarith [hp2sq, hp3sq, h23sq]
  have hQ2_ne_R : q0 * b0 + q1 * b1 ≠ R := by
    intro hQ2R
    have hqt₂sq_zero : dist q t₂ ^ 2 = 0 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq q t₂]
      have hsumsq : (b0 - q0) ^ 2 + (b1 - q1) ^ 2 = 0 := by
        linear_combination hbb + hqq - 2 * hQ2R
      dsimp [q0, q1, b0, b1] at hsumsq ⊢
      ring_nf at hsumsq ⊢
      exact hsumsq
    have hqt₂_zero : dist q t₂ = 0 := sq_eq_zero_iff.mp hqt₂sq_zero
    exact hq_ne_t₂ (dist_eq_zero.mp hqt₂_zero)
  have hA3_ne_R : a0 * c0 + a1 * c1 ≠ R := by
    intro hA3R
    have ht₁t₃sq_zero : dist t₁ t₃ ^ 2 = 0 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq t₁ t₃]
      have hsumsq : (c0 - a0) ^ 2 + (c1 - a1) ^ 2 = 0 := by
        linear_combination hcc + haa - 2 * hA3R
      dsimp [a0, a1, c0, c1] at hsumsq ⊢
      ring_nf at hsumsq ⊢
      exact hsumsq
    have ht₁t₃_zero : dist t₁ t₃ = 0 := sq_eq_zero_iff.mp ht₁t₃sq_zero
    exact ht₁_ne_t₃ (dist_eq_zero.mp ht₁t₃_zero)
  rcases u5_chain_antipodal_coord hR hqq haa hbb hcc hqadot habdot hbcdot
      hQ2_ne_R hA3_ne_R with
    ⟨hqc0, hqc1⟩
  have hqxdot : q0 * x0 + q1 * x1 = R / 2 := by
    dsimp [q0, q1, x0, x1, R]
    nlinarith [hpqsq, hapqsq]
  have hcxdot : c0 * x0 + c1 * x1 = S / 2 := by
    dsimp [c0, c1, x0, x1, S, R]
    nlinarith [hp3sq, h3asq]
  have hSnonneg : 0 ≤ S := by
    dsimp [S]
    positivity
  exact u5_antipodal_aux_center_coord_incompatibility hR hqc0 hqc1 hqxdot
    hcxdot hSnonneg

/-- q-critical/exact/exact auxiliary-center incompatibility.

This is the class-record form of
`u5_qcritical_aux_center_metric_incompatibility`.  A q-critical class at `t₁`
through `p` and `t₂`, followed by exact q-free classes at `t₂` and `t₃`, forces
`t₃` antipodal to `q` on the dangerous `p`-circle.  An auxiliary q-critical
center `a` through `p` then cannot lie in the exact `t₃`-class. -/
theorem U5QCriticalTripleClass.qcritical_exact_exact_aux_center_incompatibility
    {D : CounterexampleData} {q p t₁ t₂ t₃ a : ℝ²}
    {T B₁ B₂ B₃ Ba : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (ht₁ : t₁ ∈ T) (ht₂ : t₂ ∈ T) (ht₃ : t₃ ∈ T)
    (ht₁_ne_t₃ : t₁ ≠ t₃)
    (K₁ : U5QCriticalTripleClass D q t₁ B₁)
    (K₂ : U5QDeletedK4Class D q t₂ B₂)
    (K₃ : U5QDeletedK4Class D q t₃ B₃)
    (Ka : U5QCriticalTripleClass D q a Ba)
    (hpB₁ : p ∈ B₁) (ht₂B₁ : t₂ ∈ B₁)
    (hpB₂ : p ∈ B₂) (ht₃B₂ : t₃ ∈ B₂)
    (hpB₃ : p ∈ B₃) (haB₃ : a ∈ B₃)
    (hpBa : p ∈ Ba) : False := by
  have hq_ne_t₂ : q ≠ t₂ := by
    have ht₂_skeleton : t₂ ∈ D.skeleton q :=
      (Finset.mem_erase.mp (htriple.T_subset ht₂)).2
    have ht₂_erase_q : t₂ ∈ D.A.erase q := by
      change t₂ ∈ D.A.erase q at ht₂_skeleton
      exact ht₂_skeleton
    exact (Finset.mem_erase.mp ht₂_erase_q).1.symm
  have ht₁q : dist t₁ q = dist p q := by
    calc
      dist t₁ q = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₁t₂ : dist t₁ t₂ = dist p q := by
    calc
      dist t₁ t₂ = dist t₁ q := K₁.same_q_radius t₂ ht₂B₁
      _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₂t₃ : dist t₂ t₃ = dist p q := by
    calc
      dist t₂ t₃ = K₂.radius := K₂.same_radius t₃ ht₃B₂
      _ = dist t₂ p := (K₂.same_radius p hpB₂).symm
      _ = dist p t₂ := dist_comm t₂ p
      _ = dist p q := htriple.T_same_radius t₂ ht₂
  have ht₃a : dist t₃ a = dist p q := by
    calc
      dist t₃ a = K₃.radius := K₃.same_radius a haB₃
      _ = dist t₃ p := (K₃.same_radius p hpB₃).symm
      _ = dist p t₃ := dist_comm t₃ p
      _ = dist p q := htriple.T_same_radius t₃ ht₃
  exact u5_qcritical_aux_center_metric_incompatibility htriple.q_radius_pos
    rfl (htriple.T_same_radius t₁ ht₁) (htriple.T_same_radius t₂ ht₂)
    (htriple.T_same_radius t₃ ht₃) ht₁q ht₁t₂ ht₂t₃ hq_ne_t₂
    ht₁_ne_t₃ (Ka.same_q_radius p hpBa) ht₃a

set_option maxHeartbeats 5000000 in
-- Coordinate extraction is the same antipodal chain used by the auxiliary
-- center incompatibility; the final contradiction is a scalar distance comparison.
/-- Metric lemma behind the q-critical/exact/q-critical antipodal incompatibility.

A q-critical `t₁` class through `p,q,t₂`, followed by an exact `t₂` class
through `p,t₃`, forces `t₃` antipodal to `q` on the dangerous `p`-circle.
Then `t₁` cannot lie on the circle centered at `t₃` through `q`. -/
theorem u5_qcritical_exact_qcritical_antipodal_metric_incompatibility
    {p q t₁ t₂ t₃ : ℝ²} {r : ℝ} (hr : 0 < r)
    (hpq : dist p q = r) (hpt₁ : dist p t₁ = r)
    (hpt₂ : dist p t₂ = r) (hpt₃ : dist p t₃ = r)
    (ht₁q : dist t₁ q = r) (ht₁t₂ : dist t₁ t₂ = r)
    (ht₂t₃ : dist t₂ t₃ = r)
    (hq_ne_t₂ : q ≠ t₂) (ht₁_ne_t₃ : t₁ ≠ t₃)
    (ht₃t₁q : dist t₃ t₁ = dist t₃ q) : False := by
  have hpqsq : dist p q ^ 2 = r ^ 2 := by rw [hpq]
  have hp1sq : dist p t₁ ^ 2 = r ^ 2 := by rw [hpt₁]
  have hp2sq : dist p t₂ ^ 2 = r ^ 2 := by rw [hpt₂]
  have hp3sq : dist p t₃ ^ 2 = r ^ 2 := by rw [hpt₃]
  have h1qsq : dist t₁ q ^ 2 = r ^ 2 := by rw [ht₁q]
  have h12sq : dist t₁ t₂ ^ 2 = r ^ 2 := by rw [ht₁t₂]
  have h23sq : dist t₂ t₃ ^ 2 = r ^ 2 := by rw [ht₂t₃]
  have h3t₁qsq : dist t₃ t₁ ^ 2 = dist t₃ q ^ 2 := by rw [ht₃t₁q]
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpqsq hp1sq hp2sq hp3sq h1qsq h12sq h23sq
  rw [dist_sq_eq_coord_sq_add_coord_sq t₃ t₁,
    dist_sq_eq_coord_sq_add_coord_sq t₃ q] at h3t₁qsq
  set q0 := p 0 - q 0
  set q1 := p 1 - q 1
  set a0 := p 0 - t₁ 0
  set a1 := p 1 - t₁ 1
  set b0 := p 0 - t₂ 0
  set b1 := p 1 - t₂ 1
  set c0 := p 0 - t₃ 0
  set c1 := p 1 - t₃ 1
  set R := r ^ 2
  have hR : 0 < R := by positivity
  have hqq : q0 ^ 2 + q1 ^ 2 = R := by
    simpa [q0, q1, R] using hpqsq
  have haa : a0 ^ 2 + a1 ^ 2 = R := by
    simpa [a0, a1, R] using hp1sq
  have hbb : b0 ^ 2 + b1 ^ 2 = R := by
    simpa [b0, b1, R] using hp2sq
  have hcc : c0 ^ 2 + c1 ^ 2 = R := by
    simpa [c0, c1, R] using hp3sq
  have hqadot : q0 * a0 + q1 * a1 = R / 2 := by
    dsimp [q0, q1, a0, a1, R]
    nlinarith [hpqsq, hp1sq, h1qsq]
  have habdot : a0 * b0 + a1 * b1 = R / 2 := by
    dsimp [a0, a1, b0, b1, R]
    nlinarith [hp1sq, hp2sq, h12sq]
  have hbcdot : b0 * c0 + b1 * c1 = R / 2 := by
    dsimp [b0, b1, c0, c1, R]
    nlinarith [hp2sq, hp3sq, h23sq]
  have hQ2_ne_R : q0 * b0 + q1 * b1 ≠ R := by
    intro hQ2R
    have hqt₂sq_zero : dist q t₂ ^ 2 = 0 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq q t₂]
      have hsumsq : (b0 - q0) ^ 2 + (b1 - q1) ^ 2 = 0 := by
        linear_combination hbb + hqq - 2 * hQ2R
      dsimp [q0, q1, b0, b1] at hsumsq ⊢
      ring_nf at hsumsq ⊢
      exact hsumsq
    have hqt₂_zero : dist q t₂ = 0 := sq_eq_zero_iff.mp hqt₂sq_zero
    exact hq_ne_t₂ (dist_eq_zero.mp hqt₂_zero)
  have hA3_ne_R : a0 * c0 + a1 * c1 ≠ R := by
    intro hA3R
    have ht₁t₃sq_zero : dist t₁ t₃ ^ 2 = 0 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq t₁ t₃]
      have hsumsq : (c0 - a0) ^ 2 + (c1 - a1) ^ 2 = 0 := by
        linear_combination hcc + haa - 2 * hA3R
      dsimp [a0, a1, c0, c1] at hsumsq ⊢
      ring_nf at hsumsq ⊢
      exact hsumsq
    have ht₁t₃_zero : dist t₁ t₃ = 0 := sq_eq_zero_iff.mp ht₁t₃sq_zero
    exact ht₁_ne_t₃ (dist_eq_zero.mp ht₁t₃_zero)
  rcases u5_chain_antipodal_coord hR hqq haa hbb hcc hqadot habdot hbcdot
      hQ2_ne_R hA3_ne_R with
    ⟨hqc0, hqc1⟩
  have hc0 : c0 = -q0 := by
    linear_combination hqc0
  have hc1 : c1 = -q1 := by
    linear_combination hqc1
  have hcq0 : c0 - q0 = -2 * q0 := by
    linear_combination hqc0
  have hcq1 : c1 - q1 = -2 * q1 := by
    linear_combination hqc1
  have hcat1_sq : (c0 - a0) ^ 2 + (c1 - a1) ^ 2 = 3 * R := by
    calc
      (c0 - a0) ^ 2 + (c1 - a1) ^ 2 =
          (-q0 - a0) ^ 2 + (-q1 - a1) ^ 2 := by
        rw [hc0, hc1]
      _ = 3 * R := by nlinarith [hqq, haa, hqadot]
  have hcq_sq : (c0 - q0) ^ 2 + (c1 - q1) ^ 2 = 4 * R := by
    calc
      (c0 - q0) ^ 2 + (c1 - q1) ^ 2 =
          (-2 * q0) ^ 2 + (-2 * q1) ^ 2 := by rw [hcq0, hcq1]
      _ = 4 * (q0 ^ 2 + q1 ^ 2) := by ring
      _ = 4 * R := by rw [hqq]
  have hdist_coord :
      (c0 - a0) ^ 2 + (c1 - a1) ^ 2 =
        (c0 - q0) ^ 2 + (c1 - q1) ^ 2 := by
    dsimp [c0, c1, a0, a1, q0, q1] at h3t₁qsq ⊢
    ring_nf at h3t₁qsq ⊢
    exact h3t₁qsq
  linarith [hR, hcat1_sq, hcq_sq, hdist_coord]

/-- q-critical/exact/q-critical antipodal incompatibility.

This is the class-record form of
`u5_qcritical_exact_qcritical_antipodal_metric_incompatibility`.  A q-critical
class at one dangerous-triple center followed by an exact class at the adjacent
center forces the third dangerous-triple point antipodal to `q`; a q-critical
class centered at that third point cannot contain the first center. -/
theorem U5QCriticalTripleClass.qcritical_exact_qcritical_antipodal_incompatibility
    {D : CounterexampleData} {q p t₁ t₂ t₃ : ℝ²}
    {T B₁ B₂ B₃ : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (ht₁ : t₁ ∈ T) (ht₂ : t₂ ∈ T) (ht₃ : t₃ ∈ T)
    (ht₁_ne_t₃ : t₁ ≠ t₃)
    (K₁ : U5QCriticalTripleClass D q t₁ B₁)
    (K₂ : U5QDeletedK4Class D q t₂ B₂)
    (K₃ : U5QCriticalTripleClass D q t₃ B₃)
    (hpB₁ : p ∈ B₁) (ht₂B₁ : t₂ ∈ B₁)
    (hpB₂ : p ∈ B₂) (ht₃B₂ : t₃ ∈ B₂)
    (ht₁B₃ : t₁ ∈ B₃) : False := by
  have hq_ne_t₂ : q ≠ t₂ := by
    have ht₂_skeleton : t₂ ∈ D.skeleton q :=
      (Finset.mem_erase.mp (htriple.T_subset ht₂)).2
    have ht₂_erase_q : t₂ ∈ D.A.erase q := by
      change t₂ ∈ D.A.erase q at ht₂_skeleton
      exact ht₂_skeleton
    exact (Finset.mem_erase.mp ht₂_erase_q).1.symm
  have ht₁q : dist t₁ q = dist p q := by
    calc
      dist t₁ q = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₁t₂ : dist t₁ t₂ = dist p q := by
    calc
      dist t₁ t₂ = dist t₁ q := K₁.same_q_radius t₂ ht₂B₁
      _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₂t₃ : dist t₂ t₃ = dist p q := by
    calc
      dist t₂ t₃ = K₂.radius := K₂.same_radius t₃ ht₃B₂
      _ = dist t₂ p := (K₂.same_radius p hpB₂).symm
      _ = dist p t₂ := dist_comm t₂ p
      _ = dist p q := htriple.T_same_radius t₂ ht₂
  exact u5_qcritical_exact_qcritical_antipodal_metric_incompatibility
    htriple.q_radius_pos rfl (htriple.T_same_radius t₁ ht₁)
    (htriple.T_same_radius t₂ ht₂) (htriple.T_same_radius t₃ ht₃)
    ht₁q ht₁t₂ ht₂t₃ hq_ne_t₂ ht₁_ne_t₃
    (K₃.same_q_radius t₁ ht₁B₃)

set_option maxHeartbeats 5000000 in
-- Coordinate extraction from the distance hypotheses is the expensive step.
/-- Metric lemma behind the q-critical collinear auxiliary-center incompatibility.

A q-critical `t₁`-class through `p,q,t₂,u` and an exact `t₂`-class through
`p,u` force `q,t₁,u` into a collinear three-point chain with `t₁` as the
middle point.  No auxiliary center can then be equidistant from all three
points `q,t₁,u`. -/
theorem u5_qcritical_collinear_aux_center_metric_incompatibility
    {p q t₁ t₂ u a : ℝ²} {r : ℝ} (hr : 0 < r)
    (hpq : dist p q = r) (hpt₁ : dist p t₁ = r)
    (hpt₂ : dist p t₂ = r)
    (ht₁q : dist t₁ q = r) (ht₁t₂ : dist t₁ t₂ = r)
    (ht₁u : dist t₁ u = r) (ht₂u : dist t₂ u = r)
    (hq_ne_t₂ : q ≠ t₂) (hp_ne_u : p ≠ u)
    (hat₁q : dist a t₁ = dist a q)
    (hauq : dist a u = dist a q) : False := by
  have hpqsq : dist p q ^ 2 = r ^ 2 := by rw [hpq]
  have hp1sq : dist p t₁ ^ 2 = r ^ 2 := by rw [hpt₁]
  have hp2sq : dist p t₂ ^ 2 = r ^ 2 := by rw [hpt₂]
  have h1qsq : dist t₁ q ^ 2 = r ^ 2 := by rw [ht₁q]
  have h12sq : dist t₁ t₂ ^ 2 = r ^ 2 := by rw [ht₁t₂]
  have h1usq : dist t₁ u ^ 2 = r ^ 2 := by rw [ht₁u]
  have h2usq : dist t₂ u ^ 2 = r ^ 2 := by rw [ht₂u]
  have hat₁qsq : dist a t₁ ^ 2 = dist a q ^ 2 := by rw [hat₁q]
  have hauqsq : dist a u ^ 2 = dist a q ^ 2 := by rw [hauq]
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpqsq hp1sq hp2sq h1qsq h12sq h1usq h2usq
  rw [dist_sq_eq_coord_sq_add_coord_sq a t₁,
    dist_sq_eq_coord_sq_add_coord_sq a q] at hat₁qsq
  rw [dist_sq_eq_coord_sq_add_coord_sq a u,
    dist_sq_eq_coord_sq_add_coord_sq a q] at hauqsq
  set q0 := p 0 - q 0
  set q1 := p 1 - q 1
  set a0 := p 0 - t₁ 0
  set a1 := p 1 - t₁ 1
  set b0 := p 0 - t₂ 0
  set b1 := p 1 - t₂ 1
  set u0 := p 0 - u 0
  set u1 := p 1 - u 1
  set x0 := p 0 - a 0
  set x1 := p 1 - a 1
  set R := r ^ 2
  set S := u0 ^ 2 + u1 ^ 2
  have hR : 0 < R := by positivity
  have hqq : q0 ^ 2 + q1 ^ 2 = R := by
    simpa [q0, q1, R] using hpqsq
  have haa : a0 ^ 2 + a1 ^ 2 = R := by
    simpa [a0, a1, R] using hp1sq
  have hbb : b0 ^ 2 + b1 ^ 2 = R := by
    simpa [b0, b1, R] using hp2sq
  have hS : u0 ^ 2 + u1 ^ 2 = S := by simp [S]
  have hqadot : q0 * a0 + q1 * a1 = R / 2 := by
    dsimp [q0, q1, a0, a1, R]
    nlinarith [hpqsq, hp1sq, h1qsq]
  have habdot : a0 * b0 + a1 * b1 = R / 2 := by
    dsimp [a0, a1, b0, b1, R]
    nlinarith [hp1sq, hp2sq, h12sq]
  have hQ2_ne_R : q0 * b0 + q1 * b1 ≠ R := by
    intro hQ2R
    have hqt₂sq_zero : dist q t₂ ^ 2 = 0 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq q t₂]
      have hsumsq : (b0 - q0) ^ 2 + (b1 - q1) ^ 2 = 0 := by
        linear_combination hbb + hqq - 2 * hQ2R
      dsimp [q0, q1, b0, b1] at hsumsq ⊢
      ring_nf at hsumsq ⊢
      exact hsumsq
    have hqt₂_zero : dist q t₂ = 0 := sq_eq_zero_iff.mp hqt₂sq_zero
    exact hq_ne_t₂ (dist_eq_zero.mp hqt₂_zero)
  rcases u5_first_chain_coord hR hqq haa hbb hqadot habdot hQ2_ne_R with
    ⟨hrel0, hrel1⟩
  have hSpos : 0 < S := by
    have hpusq : dist p u ^ 2 = S := by
      simpa [u0, u1, S] using dist_sq_eq_coord_sq_add_coord_sq p u
    have hpu_pos : 0 < dist p u := dist_pos.mpr hp_ne_u
    have hpu_sq_pos : 0 < dist p u ^ 2 := sq_pos_of_pos hpu_pos
    simpa [hpusq] using hpu_sq_pos
  have haudot : a0 * u0 + a1 * u1 = S / 2 := by
    dsimp [a0, a1, u0, u1, S, R]
    nlinarith [hp1sq, h1usq]
  have hbudot : b0 * u0 + b1 * u1 = S / 2 := by
    dsimp [b0, b1, u0, u1, S, R]
    nlinarith [hp2sq, h2usq]
  have hqudot : q0 * u0 + q1 * u1 = 0 := by
    have hdot : q0 * u0 + q1 * u1 + (b0 * u0 + b1 * u1) -
        (a0 * u0 + a1 * u1) = 0 := by
      linear_combination u0 * hrel0 + u1 * hrel1
    linear_combination hdot - hbudot + haudot
  have hx_aq : x0 * a0 + x1 * a1 - (x0 * q0 + x1 * q1) = 0 := by
    have hdist :
        (a0 - x0) ^ 2 + (a1 - x1) ^ 2 =
          (q0 - x0) ^ 2 + (q1 - x1) ^ 2 := by
      dsimp [x0, x1, a0, a1, q0, q1] at hat₁qsq ⊢
      ring_nf at hat₁qsq ⊢
      exact hat₁qsq
    have htwice :=
      u5_dot_difference_of_sqdist_eq haa hqq hdist
    nlinarith [htwice]
  have hx_uq_twice :
      2 * (x0 * u0 + x1 * u1 - (x0 * q0 + x1 * q1)) = S - R := by
    have hdist :
        (u0 - x0) ^ 2 + (u1 - x1) ^ 2 =
          (q0 - x0) ^ 2 + (q1 - x1) ^ 2 := by
      dsimp [x0, x1, u0, u1, q0, q1] at hauqsq ⊢
      ring_nf at hauqsq ⊢
      exact hauqsq
    exact u5_dot_difference_of_sqdist_eq hS hqq hdist
  exact u5_collinear_aux_center_coord_incompatibility hR hqq haa hS hqadot
    hqudot haudot hSpos hx_aq hx_uq_twice

/-- q-critical/exact auxiliary-center collinearity incompatibility.

This is the class-record form of
`u5_qcritical_collinear_aux_center_metric_incompatibility`.  It rules out the
pattern where a q-critical dangerous-triple center forces a selected point into
the second equilateral step, while a q-critical auxiliary center is required to
pass through that selected point and the original dangerous-triple center. -/
theorem U5QCriticalTripleClass.qcritical_exact_aux_collinear_incompatibility
    {D : CounterexampleData} {q p t₁ t₂ u a : ℝ²}
    {T B₁ B₂ Ba : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (ht₁ : t₁ ∈ T) (ht₂ : t₂ ∈ T)
    (K₁ : U5QCriticalTripleClass D q t₁ B₁)
    (K₂ : U5QDeletedK4Class D q t₂ B₂)
    (Ka : U5QCriticalTripleClass D q a Ba)
    (hpB₁ : p ∈ B₁) (ht₂B₁ : t₂ ∈ B₁) (huB₁ : u ∈ B₁)
    (hpB₂ : p ∈ B₂) (huB₂ : u ∈ B₂)
    (ht₁Ba : t₁ ∈ Ba) (huBa : u ∈ Ba) : False := by
  have hq_ne_t₂ : q ≠ t₂ := by
    have ht₂_skeleton : t₂ ∈ D.skeleton q :=
      (Finset.mem_erase.mp (htriple.T_subset ht₂)).2
    have ht₂_erase_q : t₂ ∈ D.A.erase q := by
      change t₂ ∈ D.A.erase q at ht₂_skeleton
      exact ht₂_skeleton
    exact (Finset.mem_erase.mp ht₂_erase_q).1.symm
  have hp_ne_u : p ≠ u := (Finset.mem_erase.mp hsel.candidate_mem).1.symm
  have ht₁q : dist t₁ q = dist p q := by
    calc
      dist t₁ q = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₁t₂ : dist t₁ t₂ = dist p q := by
    calc
      dist t₁ t₂ = dist t₁ q := K₁.same_q_radius t₂ ht₂B₁
      _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₁u : dist t₁ u = dist p q := by
    calc
      dist t₁ u = dist t₁ q := K₁.same_q_radius u huB₁
      _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₂u : dist t₂ u = dist p q := by
    calc
      dist t₂ u = K₂.radius := K₂.same_radius u huB₂
      _ = dist t₂ p := (K₂.same_radius p hpB₂).symm
      _ = dist p t₂ := dist_comm t₂ p
      _ = dist p q := htriple.T_same_radius t₂ ht₂
  exact u5_qcritical_collinear_aux_center_metric_incompatibility htriple.q_radius_pos
    rfl (htriple.T_same_radius t₁ ht₁) (htriple.T_same_radius t₂ ht₂)
    ht₁q ht₁t₂ ht₁u ht₂u hq_ne_t₂ hp_ne_u
    (Ka.same_q_radius t₁ ht₁Ba) (Ka.same_q_radius u huBa)

set_option maxHeartbeats 5000000 in
-- Coordinate extraction repeats the first-chain scalar proof and needs extra
-- heartbeats in this already-heavy kernel file.
/-- Metric lemma behind the q-critical/exact selected-tail radius incompatibility.

The same first-chain equations used in
`u5_qcritical_collinear_aux_center_metric_incompatibility` force the selected
point `u` to satisfy `dist u q = 2 * r`.  Hence any tail of classes forcing
`dist u q = r` is impossible. -/
theorem u5_qcritical_selected_tail_radius_metric_incompatibility
    {p q t₁ t₂ u : ℝ²} {r : ℝ} (hr : 0 < r)
    (hpq : dist p q = r) (hpt₁ : dist p t₁ = r)
    (hpt₂ : dist p t₂ = r)
    (ht₁q : dist t₁ q = r) (ht₁t₂ : dist t₁ t₂ = r)
    (ht₁u : dist t₁ u = r) (ht₂u : dist t₂ u = r)
    (hq_ne_t₂ : q ≠ t₂) (hp_ne_u : p ≠ u)
    (huq : dist u q = r) : False := by
  have hpqsq : dist p q ^ 2 = r ^ 2 := by rw [hpq]
  have hp1sq : dist p t₁ ^ 2 = r ^ 2 := by rw [hpt₁]
  have hp2sq : dist p t₂ ^ 2 = r ^ 2 := by rw [hpt₂]
  have h1qsq : dist t₁ q ^ 2 = r ^ 2 := by rw [ht₁q]
  have h12sq : dist t₁ t₂ ^ 2 = r ^ 2 := by rw [ht₁t₂]
  have h1usq : dist t₁ u ^ 2 = r ^ 2 := by rw [ht₁u]
  have h2usq : dist t₂ u ^ 2 = r ^ 2 := by rw [ht₂u]
  have huqsq : dist u q ^ 2 = r ^ 2 := by rw [huq]
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpqsq hp1sq hp2sq h1qsq h12sq h1usq h2usq
  rw [dist_sq_eq_coord_sq_add_coord_sq u q] at huqsq
  set q0 := p 0 - q 0
  set q1 := p 1 - q 1
  set a0 := p 0 - t₁ 0
  set a1 := p 1 - t₁ 1
  set b0 := p 0 - t₂ 0
  set b1 := p 1 - t₂ 1
  set u0 := p 0 - u 0
  set u1 := p 1 - u 1
  set R := r ^ 2
  set S := u0 ^ 2 + u1 ^ 2
  have hR : 0 < R := by positivity
  have hqq : q0 ^ 2 + q1 ^ 2 = R := by
    simpa [q0, q1, R] using hpqsq
  have haa : a0 ^ 2 + a1 ^ 2 = R := by
    simpa [a0, a1, R] using hp1sq
  have hbb : b0 ^ 2 + b1 ^ 2 = R := by
    simpa [b0, b1, R] using hp2sq
  have hS : u0 ^ 2 + u1 ^ 2 = S := by simp [S]
  have hqadot : q0 * a0 + q1 * a1 = R / 2 := by
    dsimp [q0, q1, a0, a1, R]
    nlinarith [hpqsq, hp1sq, h1qsq]
  have habdot : a0 * b0 + a1 * b1 = R / 2 := by
    dsimp [a0, a1, b0, b1, R]
    nlinarith [hp1sq, hp2sq, h12sq]
  have hQ2_ne_R : q0 * b0 + q1 * b1 ≠ R := by
    intro hQ2R
    have hqt₂sq_zero : dist q t₂ ^ 2 = 0 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq q t₂]
      have hsumsq : (b0 - q0) ^ 2 + (b1 - q1) ^ 2 = 0 := by
        linear_combination hbb + hqq - 2 * hQ2R
      dsimp [q0, q1, b0, b1] at hsumsq ⊢
      ring_nf at hsumsq ⊢
      exact hsumsq
    have hqt₂_zero : dist q t₂ = 0 := sq_eq_zero_iff.mp hqt₂sq_zero
    exact hq_ne_t₂ (dist_eq_zero.mp hqt₂_zero)
  rcases u5_first_chain_coord hR hqq haa hbb hqadot habdot hQ2_ne_R with
    ⟨hrel0, hrel1⟩
  have hSpos : 0 < S := by
    have hpusq : dist p u ^ 2 = S := by
      simpa [u0, u1, S] using dist_sq_eq_coord_sq_add_coord_sq p u
    have hpu_pos : 0 < dist p u := dist_pos.mpr hp_ne_u
    have hpu_sq_pos : 0 < dist p u ^ 2 := sq_pos_of_pos hpu_pos
    simpa [hpusq] using hpu_sq_pos
  have haudot : a0 * u0 + a1 * u1 = S / 2 := by
    dsimp [a0, a1, u0, u1, S, R]
    nlinarith [hp1sq, h1usq]
  have hbudot : b0 * u0 + b1 * u1 = S / 2 := by
    dsimp [b0, b1, u0, u1, S, R]
    nlinarith [hp2sq, h2usq]
  have hqudot : q0 * u0 + q1 * u1 = 0 := by
    have hdot : q0 * u0 + q1 * u1 + (b0 * u0 + b1 * u1) -
        (a0 * u0 + a1 * u1) = 0 := by
      linear_combination u0 * hrel0 + u1 * hrel1
    linear_combination hdot - hbudot + haudot
  have huqsq_coord :
      (u0 - q0) ^ 2 + (u1 - q1) ^ 2 = R := by
    dsimp [u0, u1, q0, q1, R] at huqsq ⊢
    ring_nf at huqsq ⊢
    exact huqsq
  exact u5_selected_tail_radius_coord_incompatibility hR hqq haa hS hqadot
    hqudot haudot hSpos huqsq_coord

/-- q-critical/exact selected-tail radius incompatibility.

This is the class-record form of
`u5_qcritical_selected_tail_radius_metric_incompatibility`.  The q-critical
dangerous-triple center and adjacent exact class force `dist u q = 2r`, while
the exact/q-critical tail through an auxiliary center forces `dist u q = r`. -/
theorem U5QCriticalTripleClass.qcritical_exact_tail_radius_incompatibility
    {D : CounterexampleData} {q p t₁ t₂ t₃ u a : ℝ²}
    {T B₁ B₂ B₃ Bu Ba : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (ht₁ : t₁ ∈ T) (ht₂ : t₂ ∈ T) (ht₃ : t₃ ∈ T)
    (K₁ : U5QCriticalTripleClass D q t₁ B₁)
    (K₂ : U5QDeletedK4Class D q t₂ B₂)
    (K₃ : U5QDeletedK4Class D q t₃ B₃)
    (Ku : U5QCriticalTripleClass D q u Bu)
    (Ka : U5QDeletedK4Class D q a Ba)
    (hpB₁ : p ∈ B₁) (ht₂B₁ : t₂ ∈ B₁) (huB₁ : u ∈ B₁)
    (hpB₂ : p ∈ B₂) (huB₂ : u ∈ B₂)
    (hpB₃ : p ∈ B₃) (haB₃ : a ∈ B₃)
    (haBu : a ∈ Bu)
    (ht₃Ba : t₃ ∈ Ba) (huBa : u ∈ Ba) : False := by
  have hq_ne_t₂ : q ≠ t₂ := by
    have ht₂_skeleton : t₂ ∈ D.skeleton q :=
      (Finset.mem_erase.mp (htriple.T_subset ht₂)).2
    have ht₂_erase_q : t₂ ∈ D.A.erase q := by
      change t₂ ∈ D.A.erase q at ht₂_skeleton
      exact ht₂_skeleton
    exact (Finset.mem_erase.mp ht₂_erase_q).1.symm
  have hp_ne_u : p ≠ u := (Finset.mem_erase.mp hsel.candidate_mem).1.symm
  have ht₁q : dist t₁ q = dist p q := by
    calc
      dist t₁ q = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₁t₂ : dist t₁ t₂ = dist p q := by
    calc
      dist t₁ t₂ = dist t₁ q := K₁.same_q_radius t₂ ht₂B₁
      _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₁u : dist t₁ u = dist p q := by
    calc
      dist t₁ u = dist t₁ q := K₁.same_q_radius u huB₁
      _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₂u : dist t₂ u = dist p q := by
    calc
      dist t₂ u = K₂.radius := K₂.same_radius u huB₂
      _ = dist t₂ p := (K₂.same_radius p hpB₂).symm
      _ = dist p t₂ := dist_comm t₂ p
      _ = dist p q := htriple.T_same_radius t₂ ht₂
  have huq : dist u q = dist p q := by
    calc
      dist u q = dist u a := (Ku.same_q_radius a haBu).symm
      _ = dist a u := dist_comm u a
      _ = Ka.radius := Ka.same_radius u huBa
      _ = dist a t₃ := (Ka.same_radius t₃ ht₃Ba).symm
      _ = dist t₃ a := dist_comm a t₃
      _ = K₃.radius := K₃.same_radius a haB₃
      _ = dist t₃ p := (K₃.same_radius p hpB₃).symm
      _ = dist p t₃ := dist_comm t₃ p
      _ = dist p q := htriple.T_same_radius t₃ ht₃
  exact u5_qcritical_selected_tail_radius_metric_incompatibility
    htriple.q_radius_pos rfl (htriple.T_same_radius t₁ ht₁)
    (htriple.T_same_radius t₂ ht₂) ht₁q ht₁t₂ ht₁u ht₂u hq_ne_t₂
    hp_ne_u huq

/-- q-critical/exact selected-center radius incompatibility.

This is a shorter class-record form of the same tail-radius metric
incompatibility.  A q-critical class centered at the selected point and containing
the adjacent exact center forces `dist u q = r`, contradicting the first-chain
consequence `dist u q = 2r`. -/
theorem U5QCriticalTripleClass.qcritical_exact_selected_center_incompatibility
    {D : CounterexampleData} {q p t₁ t₂ u : ℝ²}
    {T B₁ B₂ Bu : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (ht₁ : t₁ ∈ T) (ht₂ : t₂ ∈ T)
    (K₁ : U5QCriticalTripleClass D q t₁ B₁)
    (K₂ : U5QDeletedK4Class D q t₂ B₂)
    (Ku : U5QCriticalTripleClass D q u Bu)
    (hpB₁ : p ∈ B₁) (ht₂B₁ : t₂ ∈ B₁) (huB₁ : u ∈ B₁)
    (hpB₂ : p ∈ B₂) (huB₂ : u ∈ B₂)
    (ht₂Bu : t₂ ∈ Bu) : False := by
  have hq_ne_t₂ : q ≠ t₂ := by
    have ht₂_skeleton : t₂ ∈ D.skeleton q :=
      (Finset.mem_erase.mp (htriple.T_subset ht₂)).2
    have ht₂_erase_q : t₂ ∈ D.A.erase q := by
      change t₂ ∈ D.A.erase q at ht₂_skeleton
      exact ht₂_skeleton
    exact (Finset.mem_erase.mp ht₂_erase_q).1.symm
  have hp_ne_u : p ≠ u := (Finset.mem_erase.mp hsel.candidate_mem).1.symm
  have ht₁q : dist t₁ q = dist p q := by
    calc
      dist t₁ q = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₁t₂ : dist t₁ t₂ = dist p q := by
    calc
      dist t₁ t₂ = dist t₁ q := K₁.same_q_radius t₂ ht₂B₁
      _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₁u : dist t₁ u = dist p q := by
    calc
      dist t₁ u = dist t₁ q := K₁.same_q_radius u huB₁
      _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₂u : dist t₂ u = dist p q := by
    calc
      dist t₂ u = K₂.radius := K₂.same_radius u huB₂
      _ = dist t₂ p := (K₂.same_radius p hpB₂).symm
      _ = dist p t₂ := dist_comm t₂ p
      _ = dist p q := htriple.T_same_radius t₂ ht₂
  have huq : dist u q = dist p q := by
    calc
      dist u q = dist u t₂ := (Ku.same_q_radius t₂ ht₂Bu).symm
      _ = dist t₂ u := dist_comm u t₂
      _ = dist p q := ht₂u
  exact u5_qcritical_selected_tail_radius_metric_incompatibility
    htriple.q_radius_pos rfl (htriple.T_same_radius t₁ ht₁)
    (htriple.T_same_radius t₂ ht₂) ht₁q ht₁t₂ ht₁u ht₂u hq_ne_t₂
    hp_ne_u huq

set_option maxHeartbeats 5000000 in
-- Coordinate extraction combines the first-chain and antipodal-chain scalar
-- kernels; each side is already nontrivial for `nlinarith`.
/-- Metric lemma behind the q-critical/exact selected-antipodal incompatibility.

The q-critical/exact chain `q,t₁,t₂,u` forces `u = 2 * t₁ - q`, while the
exact chain `t₁,t₂,t₃` forces `t₃` antipodal to `q`.  Therefore
`dist u t₃ = 2r`, contradicting an exact selected class forcing
`dist u t₃ = r`. -/
theorem u5_qcritical_exact_selected_antipodal_metric_incompatibility
    {p q t₁ t₂ t₃ u : ℝ²} {r : ℝ} (hr : 0 < r)
    (hpq : dist p q = r) (hpt₁ : dist p t₁ = r)
    (hpt₂ : dist p t₂ = r) (hpt₃ : dist p t₃ = r)
    (ht₁q : dist t₁ q = r) (ht₁t₂ : dist t₁ t₂ = r)
    (ht₁u : dist t₁ u = r) (ht₂t₃ : dist t₂ t₃ = r)
    (ht₂u : dist t₂ u = r) (ht₃u : dist t₃ u = r)
    (hq_ne_t₂ : q ≠ t₂) (ht₁_ne_t₃ : t₁ ≠ t₃)
    (hp_ne_u : p ≠ u) : False := by
  have hpqsq : dist p q ^ 2 = r ^ 2 := by rw [hpq]
  have hp1sq : dist p t₁ ^ 2 = r ^ 2 := by rw [hpt₁]
  have hp2sq : dist p t₂ ^ 2 = r ^ 2 := by rw [hpt₂]
  have hp3sq : dist p t₃ ^ 2 = r ^ 2 := by rw [hpt₃]
  have h1qsq : dist t₁ q ^ 2 = r ^ 2 := by rw [ht₁q]
  have h12sq : dist t₁ t₂ ^ 2 = r ^ 2 := by rw [ht₁t₂]
  have h1usq : dist t₁ u ^ 2 = r ^ 2 := by rw [ht₁u]
  have h23sq : dist t₂ t₃ ^ 2 = r ^ 2 := by rw [ht₂t₃]
  have h2usq : dist t₂ u ^ 2 = r ^ 2 := by rw [ht₂u]
  have h3usq : dist t₃ u ^ 2 = r ^ 2 := by rw [ht₃u]
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpqsq hp1sq hp2sq hp3sq h1qsq h12sq
  rw [dist_sq_eq_coord_sq_add_coord_sq t₁ u] at h1usq
  rw [dist_sq_eq_coord_sq_add_coord_sq t₂ t₃] at h23sq
  rw [dist_sq_eq_coord_sq_add_coord_sq t₂ u] at h2usq
  rw [dist_sq_eq_coord_sq_add_coord_sq t₃ u] at h3usq
  set q0 := p 0 - q 0
  set q1 := p 1 - q 1
  set a0 := p 0 - t₁ 0
  set a1 := p 1 - t₁ 1
  set b0 := p 0 - t₂ 0
  set b1 := p 1 - t₂ 1
  set c0 := p 0 - t₃ 0
  set c1 := p 1 - t₃ 1
  set u0 := p 0 - u 0
  set u1 := p 1 - u 1
  set R := r ^ 2
  set S := u0 ^ 2 + u1 ^ 2
  have hR : 0 < R := by positivity
  have hqq : q0 ^ 2 + q1 ^ 2 = R := by
    simpa [q0, q1, R] using hpqsq
  have haa : a0 ^ 2 + a1 ^ 2 = R := by
    simpa [a0, a1, R] using hp1sq
  have hbb : b0 ^ 2 + b1 ^ 2 = R := by
    simpa [b0, b1, R] using hp2sq
  have hcc : c0 ^ 2 + c1 ^ 2 = R := by
    simpa [c0, c1, R] using hp3sq
  have hS : u0 ^ 2 + u1 ^ 2 = S := by simp [S]
  have hqadot : q0 * a0 + q1 * a1 = R / 2 := by
    dsimp [q0, q1, a0, a1, R]
    nlinarith [hpqsq, hp1sq, h1qsq]
  have habdot : a0 * b0 + a1 * b1 = R / 2 := by
    dsimp [a0, a1, b0, b1, R]
    nlinarith [hp1sq, hp2sq, h12sq]
  have hbcdot : b0 * c0 + b1 * c1 = R / 2 := by
    dsimp [b0, b1, c0, c1, R]
    nlinarith [hp2sq, hp3sq, h23sq]
  have hQ2_ne_R : q0 * b0 + q1 * b1 ≠ R := by
    intro hQ2R
    have hqt₂sq_zero : dist q t₂ ^ 2 = 0 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq q t₂]
      have hsumsq : (b0 - q0) ^ 2 + (b1 - q1) ^ 2 = 0 := by
        linear_combination hbb + hqq - 2 * hQ2R
      dsimp [q0, q1, b0, b1] at hsumsq ⊢
      ring_nf at hsumsq ⊢
      exact hsumsq
    have hqt₂_zero : dist q t₂ = 0 := sq_eq_zero_iff.mp hqt₂sq_zero
    exact hq_ne_t₂ (dist_eq_zero.mp hqt₂_zero)
  have hA3_ne_R : a0 * c0 + a1 * c1 ≠ R := by
    intro hA3R
    have ht₁t₃sq_zero : dist t₁ t₃ ^ 2 = 0 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq t₁ t₃]
      have hsumsq : (c0 - a0) ^ 2 + (c1 - a1) ^ 2 = 0 := by
        linear_combination hcc + haa - 2 * hA3R
      dsimp [a0, a1, c0, c1] at hsumsq ⊢
      ring_nf at hsumsq ⊢
      exact hsumsq
    have ht₁t₃_zero : dist t₁ t₃ = 0 := sq_eq_zero_iff.mp ht₁t₃sq_zero
    exact ht₁_ne_t₃ (dist_eq_zero.mp ht₁t₃_zero)
  rcases u5_chain_antipodal_coord hR hqq haa hbb hcc hqadot habdot hbcdot
      hQ2_ne_R hA3_ne_R with
    ⟨hqc0, hqc1⟩
  rcases u5_first_chain_coord hR hqq haa hbb hqadot habdot hQ2_ne_R with
    ⟨hrel0, hrel1⟩
  have hSpos : 0 < S := by
    have hpusq : dist p u ^ 2 = S := by
      simpa [u0, u1, S] using dist_sq_eq_coord_sq_add_coord_sq p u
    have hpu_pos : 0 < dist p u := dist_pos.mpr hp_ne_u
    have hpu_sq_pos : 0 < dist p u ^ 2 := sq_pos_of_pos hpu_pos
    simpa [hpusq] using hpu_sq_pos
  have haudot : a0 * u0 + a1 * u1 = S / 2 := by
    dsimp [a0, a1, u0, u1, S, R]
    nlinarith [hp1sq, h1usq]
  have hbudot : b0 * u0 + b1 * u1 = S / 2 := by
    dsimp [b0, b1, u0, u1, S, R]
    nlinarith [hp2sq, h2usq]
  have hqudot : q0 * u0 + q1 * u1 = 0 := by
    have hdot : q0 * u0 + q1 * u1 + (b0 * u0 + b1 * u1) -
        (a0 * u0 + a1 * u1) = 0 := by
      linear_combination u0 * hrel0 + u1 * hrel1
    linear_combination hdot - hbudot + haudot
  rcases u5_first_chain_selected_coord hR hqq haa hS hqadot hqudot haudot
      hSpos with
    ⟨hu_line0, hu_line1⟩
  have hucsq_coord : (u0 - c0) ^ 2 + (u1 - c1) ^ 2 = R := by
    dsimp [u0, u1, c0, c1, R] at h3usq ⊢
    ring_nf at h3usq ⊢
    exact h3usq
  have huc0 : u0 - c0 = 2 * a0 := by
    linear_combination hu_line0 - hqc0
  have huc1 : u1 - c1 = 2 * a1 := by
    linear_combination hu_line1 - hqc1
  have hucsq_four : (u0 - c0) ^ 2 + (u1 - c1) ^ 2 = 4 * R := by
    calc
      (u0 - c0) ^ 2 + (u1 - c1) ^ 2 = (2 * a0) ^ 2 + (2 * a1) ^ 2 := by
        rw [huc0, huc1]
      _ = 4 * (a0 ^ 2 + a1 ^ 2) := by ring
      _ = 4 * R := by rw [haa]
  linarith [hR, hucsq_coord, hucsq_four]

/-- q-critical/exact selected-antipodal incompatibility.

This is the class-record form of
`u5_qcritical_exact_selected_antipodal_metric_incompatibility`.  A q-critical
dangerous-triple center and an adjacent exact class force the selected point
and the third dangerous-triple point to be too far apart for an exact selected
class to contain both of them. -/
theorem U5QCriticalTripleClass.qcritical_exact_selected_antipodal_incompatibility
    {D : CounterexampleData} {q p t₁ t₂ t₃ u : ℝ²}
    {T B₁ B₂ Bu : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (ht₁ : t₁ ∈ T) (ht₂ : t₂ ∈ T) (ht₃ : t₃ ∈ T)
    (ht₁_ne_t₃ : t₁ ≠ t₃)
    (K₁ : U5QCriticalTripleClass D q t₁ B₁)
    (K₂ : U5QDeletedK4Class D q t₂ B₂)
    (Ku : U5QDeletedK4Class D q u Bu)
    (hpB₁ : p ∈ B₁) (ht₂B₁ : t₂ ∈ B₁) (huB₁ : u ∈ B₁)
    (hpB₂ : p ∈ B₂) (ht₃B₂ : t₃ ∈ B₂) (huB₂ : u ∈ B₂)
    (ht₁Bu : t₁ ∈ Bu) (ht₃Bu : t₃ ∈ Bu) : False := by
  have hq_ne_t₂ : q ≠ t₂ := by
    have ht₂_skeleton : t₂ ∈ D.skeleton q :=
      (Finset.mem_erase.mp (htriple.T_subset ht₂)).2
    have ht₂_erase_q : t₂ ∈ D.A.erase q := by
      change t₂ ∈ D.A.erase q at ht₂_skeleton
      exact ht₂_skeleton
    exact (Finset.mem_erase.mp ht₂_erase_q).1.symm
  have hp_ne_u : p ≠ u := (Finset.mem_erase.mp hsel.candidate_mem).1.symm
  have ht₁q : dist t₁ q = dist p q := by
    calc
      dist t₁ q = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₁t₂ : dist t₁ t₂ = dist p q := by
    calc
      dist t₁ t₂ = dist t₁ q := K₁.same_q_radius t₂ ht₂B₁
      _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₁u : dist t₁ u = dist p q := by
    calc
      dist t₁ u = dist t₁ q := K₁.same_q_radius u huB₁
      _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₂t₃ : dist t₂ t₃ = dist p q := by
    calc
      dist t₂ t₃ = K₂.radius := K₂.same_radius t₃ ht₃B₂
      _ = dist t₂ p := (K₂.same_radius p hpB₂).symm
      _ = dist p t₂ := dist_comm t₂ p
      _ = dist p q := htriple.T_same_radius t₂ ht₂
  have ht₂u : dist t₂ u = dist p q := by
    calc
      dist t₂ u = K₂.radius := K₂.same_radius u huB₂
      _ = dist t₂ p := (K₂.same_radius p hpB₂).symm
      _ = dist p t₂ := dist_comm t₂ p
      _ = dist p q := htriple.T_same_radius t₂ ht₂
  have ht₃u : dist t₃ u = dist p q := by
    calc
      dist t₃ u = dist u t₃ := dist_comm t₃ u
      _ = Ku.radius := Ku.same_radius t₃ ht₃Bu
      _ = dist u t₁ := (Ku.same_radius t₁ ht₁Bu).symm
      _ = dist t₁ u := dist_comm u t₁
      _ = dist p q := ht₁u
  exact u5_qcritical_exact_selected_antipodal_metric_incompatibility
    htriple.q_radius_pos rfl (htriple.T_same_radius t₁ ht₁)
    (htriple.T_same_radius t₂ ht₂) (htriple.T_same_radius t₃ ht₃)
    ht₁q ht₁t₂ ht₁u ht₂t₃ ht₂u ht₃u hq_ne_t₂ ht₁_ne_t₃ hp_ne_u

/-- q-critical/exact/exact selected-antipodal incompatibility.

This is the class-record form of
`u5_qcritical_exact_selected_antipodal_metric_incompatibility` for the case where
the exact class centered at the third dangerous-triple point itself contains
the selected point. -/
theorem U5QCriticalTripleClass.qcritical_exact_exact_selected_antipodal_incompatibility
    {D : CounterexampleData} {q p t₁ t₂ t₃ u : ℝ²}
    {T B₁ B₂ B₃ : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (ht₁ : t₁ ∈ T) (ht₂ : t₂ ∈ T) (ht₃ : t₃ ∈ T)
    (ht₁_ne_t₃ : t₁ ≠ t₃)
    (K₁ : U5QCriticalTripleClass D q t₁ B₁)
    (K₂ : U5QDeletedK4Class D q t₂ B₂)
    (K₃ : U5QDeletedK4Class D q t₃ B₃)
    (hpB₁ : p ∈ B₁) (ht₂B₁ : t₂ ∈ B₁) (huB₁ : u ∈ B₁)
    (hpB₂ : p ∈ B₂) (ht₃B₂ : t₃ ∈ B₂) (huB₂ : u ∈ B₂)
    (hpB₃ : p ∈ B₃) (huB₃ : u ∈ B₃) : False := by
  have hq_ne_t₂ : q ≠ t₂ := by
    have ht₂_skeleton : t₂ ∈ D.skeleton q :=
      (Finset.mem_erase.mp (htriple.T_subset ht₂)).2
    have ht₂_erase_q : t₂ ∈ D.A.erase q := by
      change t₂ ∈ D.A.erase q at ht₂_skeleton
      exact ht₂_skeleton
    exact (Finset.mem_erase.mp ht₂_erase_q).1.symm
  have hp_ne_u : p ≠ u := (Finset.mem_erase.mp hsel.candidate_mem).1.symm
  have ht₁q : dist t₁ q = dist p q := by
    calc
      dist t₁ q = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₁t₂ : dist t₁ t₂ = dist p q := by
    calc
      dist t₁ t₂ = dist t₁ q := K₁.same_q_radius t₂ ht₂B₁
      _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₁u : dist t₁ u = dist p q := by
    calc
      dist t₁ u = dist t₁ q := K₁.same_q_radius u huB₁
      _ = dist t₁ p := (K₁.same_q_radius p hpB₁).symm
      _ = dist p t₁ := dist_comm t₁ p
      _ = dist p q := htriple.T_same_radius t₁ ht₁
  have ht₂t₃ : dist t₂ t₃ = dist p q := by
    calc
      dist t₂ t₃ = K₂.radius := K₂.same_radius t₃ ht₃B₂
      _ = dist t₂ p := (K₂.same_radius p hpB₂).symm
      _ = dist p t₂ := dist_comm t₂ p
      _ = dist p q := htriple.T_same_radius t₂ ht₂
  have ht₂u : dist t₂ u = dist p q := by
    calc
      dist t₂ u = K₂.radius := K₂.same_radius u huB₂
      _ = dist t₂ p := (K₂.same_radius p hpB₂).symm
      _ = dist p t₂ := dist_comm t₂ p
      _ = dist p q := htriple.T_same_radius t₂ ht₂
  have ht₃u : dist t₃ u = dist p q := by
    calc
      dist t₃ u = K₃.radius := K₃.same_radius u huB₃
      _ = dist t₃ p := (K₃.same_radius p hpB₃).symm
      _ = dist p t₃ := dist_comm t₃ p
      _ = dist p q := htriple.T_same_radius t₃ ht₃
  exact u5_qcritical_exact_selected_antipodal_metric_incompatibility
    htriple.q_radius_pos rfl (htriple.T_same_radius t₁ ht₁)
    (htriple.T_same_radius t₂ ht₂) (htriple.T_same_radius t₃ ht₃)
    ht₁q ht₁t₂ ht₁u ht₂t₃ ht₂u ht₃u hq_ne_t₂ ht₁_ne_t₃ hp_ne_u

private theorem u5_equilateral_opposite_point_coord_incompatibility
    {a0 a1 b0 b1 c0 c1 x0 x1 R S : ℝ}
    (hR : 0 < R)
    (haa : a0 ^ 2 + a1 ^ 2 = R)
    (hbb : b0 ^ 2 + b1 ^ 2 = R)
    (hcc : c0 ^ 2 + c1 ^ 2 = R)
    (hS : x0 ^ 2 + x1 ^ 2 = S)
    (habdot : a0 * b0 + a1 * b1 = R / 2)
    (hacdot : a0 * c0 + a1 * c1 = R / 2)
    (haxdot : a0 * x0 + a1 * x1 = S / 2)
    (hbxdot : b0 * x0 + b1 * x1 = S / 2)
    (hcxdot : c0 * x0 + c1 * x1 = R / 2) : False := by
  have hgram_abx :
      (a0 ^ 2 + a1 ^ 2) * (b0 ^ 2 + b1 ^ 2) * (x0 ^ 2 + x1 ^ 2)
        + 2 * (a0 * b0 + a1 * b1) * (a0 * x0 + a1 * x1)
          * (b0 * x0 + b1 * x1)
        - (a0 ^ 2 + a1 ^ 2) * (b0 * x0 + b1 * x1) ^ 2
        - (b0 ^ 2 + b1 ^ 2) * (a0 * x0 + a1 * x1) ^ 2
        - (x0 ^ 2 + x1 ^ 2) * (a0 * b0 + a1 * b1) ^ 2 = 0 := by
    ring
  rw [haa, hbb, hS, habdot, haxdot, hbxdot] at hgram_abx
  ring_nf at hgram_abx
  have hgram_acx :
      (a0 ^ 2 + a1 ^ 2) * (c0 ^ 2 + c1 ^ 2) * (x0 ^ 2 + x1 ^ 2)
        + 2 * (a0 * c0 + a1 * c1) * (a0 * x0 + a1 * x1)
          * (c0 * x0 + c1 * x1)
        - (a0 ^ 2 + a1 ^ 2) * (c0 * x0 + c1 * x1) ^ 2
        - (c0 ^ 2 + c1 ^ 2) * (a0 * x0 + a1 * x1) ^ 2
        - (x0 ^ 2 + x1 ^ 2) * (a0 * c0 + a1 * c1) ^ 2 = 0 := by
    ring
  rw [haa, hcc, hS, hacdot, haxdot, hcxdot] at hgram_acx
  ring_nf at hgram_acx
  have hdiff : R ^ 2 * (S - R) = 0 := by
    nlinarith [hgram_abx, hgram_acx]
  have hR2pos : 0 < R ^ 2 := by positivity
  have hS_eq_R : S = R := by
    nlinarith [hdiff, hR2pos]
  rw [hS_eq_R] at hgram_abx
  ring_nf at hgram_abx
  nlinarith

set_option maxHeartbeats 5000000 in
-- Coordinate extraction from the distance hypotheses is the expensive step.
/-- Metric lemma behind the bounded-pattern prefilter
`equilateral_opposite_point`.

If the selected classes force `p,a,b,x` to be the two equilateral points over
the edge `ab`, and also put `c` on the other `p`/`a` circle intersection, then
`x` cannot be equidistant from `p` and `c`.  The proof is a two-determinant
coordinate elimination in the plane. -/
theorem u5_equilateral_opposite_point_metric_incompatibility
    {p a b c x : ℝ²} {r : ℝ} (hr : 0 < r)
    (hpa : dist p a = r) (hpb : dist p b = r) (hpc : dist p c = r)
    (hab : dist a b = r) (hac : dist a c = r)
    (hax : dist a x = r) (hbx : dist b x = r)
    (hxpc : dist x p = dist x c) : False := by
  have hpasq : dist p a ^ 2 = r ^ 2 := by rw [hpa]
  have hpbsq : dist p b ^ 2 = r ^ 2 := by rw [hpb]
  have hpcsq : dist p c ^ 2 = r ^ 2 := by rw [hpc]
  have habsq : dist a b ^ 2 = r ^ 2 := by rw [hab]
  have hacsq : dist a c ^ 2 = r ^ 2 := by rw [hac]
  have haxsq : dist a x ^ 2 = r ^ 2 := by rw [hax]
  have hbxsq : dist b x ^ 2 = r ^ 2 := by rw [hbx]
  have hxpcsq : dist x p ^ 2 = dist x c ^ 2 := by rw [hxpc]
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpasq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpbsq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpcsq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at habsq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hacsq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at haxsq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hbxsq
  rw [dist_sq_eq_coord_sq_add_coord_sq x p,
    dist_sq_eq_coord_sq_add_coord_sq x c] at hxpcsq
  set a0 := p 0 - a 0
  set a1 := p 1 - a 1
  set b0 := p 0 - b 0
  set b1 := p 1 - b 1
  set c0 := p 0 - c 0
  set c1 := p 1 - c 1
  set x0 := p 0 - x 0
  set x1 := p 1 - x 1
  set R := r ^ 2
  set S := x0 ^ 2 + x1 ^ 2
  have hR : 0 < R := by positivity
  have haa : a0 ^ 2 + a1 ^ 2 = R := by
    simpa [a0, a1, R] using hpasq
  have hbb : b0 ^ 2 + b1 ^ 2 = R := by
    simpa [b0, b1, R] using hpbsq
  have hcc : c0 ^ 2 + c1 ^ 2 = R := by
    simpa [c0, c1, R] using hpcsq
  have hS : x0 ^ 2 + x1 ^ 2 = S := by simp [S]
  have habdot : a0 * b0 + a1 * b1 = R / 2 := by
    dsimp [a0, a1, b0, b1, R]
    nlinarith [hpasq, hpbsq, habsq]
  have hacdot : a0 * c0 + a1 * c1 = R / 2 := by
    dsimp [a0, a1, c0, c1, R]
    nlinarith [hpasq, hpcsq, hacsq]
  have haxdot : a0 * x0 + a1 * x1 = S / 2 := by
    dsimp [a0, a1, x0, x1, S, R]
    nlinarith [hpasq, haxsq]
  have hbxdot : b0 * x0 + b1 * x1 = S / 2 := by
    dsimp [b0, b1, x0, x1, S, R]
    nlinarith [hpbsq, hbxsq]
  have hcxdot : c0 * x0 + c1 * x1 = R / 2 := by
    dsimp [c0, c1, x0, x1, S, R]
    nlinarith [hpcsq, hxpcsq]
  exact u5_equilateral_opposite_point_coord_incompatibility
    hR haa hbb hcc hS habdot hacdot haxdot hbxdot hcxdot

/-- K4-class form of `u5_equilateral_opposite_point_metric_incompatibility`. -/
theorem u5_equilateral_opposite_point_incompatibility
    {D : CounterexampleData} {q p a b c x : ℝ²}
    {Ba Bb Bx : Finset ℝ²}
    (hr_pos : 0 < dist p q)
    (ha_radius : dist p a = dist p q)
    (hb_radius : dist p b = dist p q)
    (hc_radius : dist p c = dist p q)
    (Ka : U5QDeletedK4Class D q a Ba)
    (Kb : U5QDeletedK4Class D q b Bb)
    (Kx : U5QDeletedK4Class D q x Bx)
    (hpBa : p ∈ Ba) (hbBa : b ∈ Ba) (hcBa : c ∈ Ba) (hxBa : x ∈ Ba)
    (hpBb : p ∈ Bb) (_haBb : a ∈ Bb) (hxBb : x ∈ Bb)
    (hpBx : p ∈ Bx) (hcBx : c ∈ Bx) : False := by
  have hab : dist a b = dist p q := by
    calc
      dist a b = Ka.radius := Ka.same_radius b hbBa
      _ = dist a p := (Ka.same_radius p hpBa).symm
      _ = dist p a := dist_comm a p
      _ = dist p q := ha_radius
  have hac : dist a c = dist p q := by
    calc
      dist a c = Ka.radius := Ka.same_radius c hcBa
      _ = dist a p := (Ka.same_radius p hpBa).symm
      _ = dist p a := dist_comm a p
      _ = dist p q := ha_radius
  have hax : dist a x = dist p q := by
    calc
      dist a x = Ka.radius := Ka.same_radius x hxBa
      _ = dist a p := (Ka.same_radius p hpBa).symm
      _ = dist p a := dist_comm a p
      _ = dist p q := ha_radius
  have hbx : dist b x = dist p q := by
    calc
      dist b x = Kb.radius := Kb.same_radius x hxBb
      _ = dist b p := (Kb.same_radius p hpBb).symm
      _ = dist p b := dist_comm b p
      _ = dist p q := hb_radius
  have hxpc : dist x p = dist x c := by
    calc
      dist x p = Kx.radius := Kx.same_radius p hpBx
      _ = dist x c := (Kx.same_radius c hcBx).symm
  exact u5_equilateral_opposite_point_metric_incompatibility hr_pos
    ha_radius hb_radius hc_radius hab hac hax hbx hxpc

set_option maxHeartbeats 2000000 in
-- The proof eliminates three planar Gram determinants.
private theorem u5_equilateral_bisector_coord_incompatibility
    {a0 a1 b0 b1 c0 c1 x0 x1 R S : ℝ}
    (hR : 0 < R)
    (haa : a0 ^ 2 + a1 ^ 2 = R)
    (hbb : b0 ^ 2 + b1 ^ 2 = R)
    (hcc : c0 ^ 2 + c1 ^ 2 = R)
    (hS : x0 ^ 2 + x1 ^ 2 = S)
    (habdot : a0 * b0 + a1 * b1 = R / 2)
    (haxdot : a0 * x0 + a1 * x1 = S / 2)
    (hbxdot : b0 * x0 + b1 * x1 = S / 2)
    (hcxdot : c0 * x0 + c1 * x1 = R / 2)
    (hac_eq_hbc : a0 * c0 + a1 * c1 = b0 * c0 + b1 * c1) : False := by
  set Y := a0 * c0 + a1 * c1
  have hbcdot : b0 * c0 + b1 * c1 = Y := by
    simpa [Y] using hac_eq_hbc.symm
  have hacdot : a0 * c0 + a1 * c1 = Y := by simp [Y]
  have hgram_abx :
      (a0 ^ 2 + a1 ^ 2) * (b0 ^ 2 + b1 ^ 2) * (x0 ^ 2 + x1 ^ 2)
        + 2 * (a0 * b0 + a1 * b1) * (a0 * x0 + a1 * x1)
          * (b0 * x0 + b1 * x1)
        - (a0 ^ 2 + a1 ^ 2) * (b0 * x0 + b1 * x1) ^ 2
        - (b0 ^ 2 + b1 ^ 2) * (a0 * x0 + a1 * x1) ^ 2
        - (x0 ^ 2 + x1 ^ 2) * (a0 * b0 + a1 * b1) ^ 2 = 0 := by
    ring
  rw [haa, hbb, hS, habdot, haxdot, hbxdot] at hgram_abx
  ring_nf at hgram_abx
  have hgram_abc :
      (a0 ^ 2 + a1 ^ 2) * (b0 ^ 2 + b1 ^ 2) * (c0 ^ 2 + c1 ^ 2)
        + 2 * (a0 * b0 + a1 * b1) * (a0 * c0 + a1 * c1)
          * (b0 * c0 + b1 * c1)
        - (a0 ^ 2 + a1 ^ 2) * (b0 * c0 + b1 * c1) ^ 2
        - (b0 ^ 2 + b1 ^ 2) * (a0 * c0 + a1 * c1) ^ 2
        - (c0 ^ 2 + c1 ^ 2) * (a0 * b0 + a1 * b1) ^ 2 = 0 := by
    ring
  rw [haa, hbb, hcc, habdot, hacdot, hbcdot] at hgram_abc
  ring_nf at hgram_abc
  have hgram_acx :
      (a0 ^ 2 + a1 ^ 2) * (c0 ^ 2 + c1 ^ 2) * (x0 ^ 2 + x1 ^ 2)
        + 2 * (a0 * c0 + a1 * c1) * (a0 * x0 + a1 * x1)
          * (c0 * x0 + c1 * x1)
        - (a0 ^ 2 + a1 ^ 2) * (c0 * x0 + c1 * x1) ^ 2
        - (c0 ^ 2 + c1 ^ 2) * (a0 * x0 + a1 * x1) ^ 2
        - (x0 ^ 2 + x1 ^ 2) * (a0 * c0 + a1 * c1) ^ 2 = 0 := by
    ring
  rw [haa, hcc, hS, hacdot, haxdot, hcxdot] at hgram_acx
  ring_nf at hgram_acx
  have hR2pos : 0 < R ^ 2 := by positivity
  have hSprod : S * (3 * R - S) = 0 := by
    nlinarith [hgram_abx, hR]
  have hYsq : Y ^ 2 = (3 / 4) * R ^ 2 := by
    nlinarith [hgram_abc, hR]
  have hE3 : 2 * S * Y - S ^ 2 + S * R - R ^ 2 = 0 := by
    rw [hYsq] at hgram_acx
    ring_nf at hgram_acx ⊢
    nlinarith [hgram_acx]
  rcases mul_eq_zero.mp hSprod with hS0 | hS3
  · nlinarith [hR2pos]
  · have hSeq : S = 3 * R := by nlinarith
    have hYeq : Y = 7 * R / 6 := by nlinarith
    nlinarith [hYsq, hR2pos]

set_option maxHeartbeats 5000000 in
-- Coordinate extraction from the distance hypotheses is the expensive step.
/-- Metric lemma behind the bounded-pattern prefilter
`equilateral_bisector`.

If `x` is forced to be the second equilateral point over the edge `ab`, if
`c` is equidistant from `a` and `b`, and if `x` is equidistant from `p` and
`c`, then the three planar Gram determinants are inconsistent. -/
theorem u5_equilateral_bisector_metric_incompatibility
    {p a b c x : ℝ²} {r : ℝ} (hr : 0 < r)
    (hpa : dist p a = r) (hpb : dist p b = r) (hpc : dist p c = r)
    (hab : dist a b = r) (hax : dist a x = r) (hbx : dist b x = r)
    (hxpc : dist x p = dist x c) (hcab : dist c a = dist c b) :
    False := by
  have hpasq : dist p a ^ 2 = r ^ 2 := by rw [hpa]
  have hpbsq : dist p b ^ 2 = r ^ 2 := by rw [hpb]
  have hpcsq : dist p c ^ 2 = r ^ 2 := by rw [hpc]
  have habsq : dist a b ^ 2 = r ^ 2 := by rw [hab]
  have haxsq : dist a x ^ 2 = r ^ 2 := by rw [hax]
  have hbxsq : dist b x ^ 2 = r ^ 2 := by rw [hbx]
  have hxpcsq : dist x p ^ 2 = dist x c ^ 2 := by rw [hxpc]
  have hcabsq : dist c a ^ 2 = dist c b ^ 2 := by rw [hcab]
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpasq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpbsq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpcsq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at habsq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at haxsq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hbxsq
  rw [dist_sq_eq_coord_sq_add_coord_sq x p,
    dist_sq_eq_coord_sq_add_coord_sq x c] at hxpcsq
  rw [dist_sq_eq_coord_sq_add_coord_sq c a,
    dist_sq_eq_coord_sq_add_coord_sq c b] at hcabsq
  set a0 := p 0 - a 0
  set a1 := p 1 - a 1
  set b0 := p 0 - b 0
  set b1 := p 1 - b 1
  set c0 := p 0 - c 0
  set c1 := p 1 - c 1
  set x0 := p 0 - x 0
  set x1 := p 1 - x 1
  set R := r ^ 2
  set S := x0 ^ 2 + x1 ^ 2
  have hR : 0 < R := by positivity
  have haa : a0 ^ 2 + a1 ^ 2 = R := by
    simpa [a0, a1, R] using hpasq
  have hbb : b0 ^ 2 + b1 ^ 2 = R := by
    simpa [b0, b1, R] using hpbsq
  have hcc : c0 ^ 2 + c1 ^ 2 = R := by
    simpa [c0, c1, R] using hpcsq
  have hS : x0 ^ 2 + x1 ^ 2 = S := by simp [S]
  have habdot : a0 * b0 + a1 * b1 = R / 2 := by
    dsimp [a0, a1, b0, b1, R]
    nlinarith [hpasq, hpbsq, habsq]
  have haxdot : a0 * x0 + a1 * x1 = S / 2 := by
    dsimp [a0, a1, x0, x1, S, R]
    nlinarith [hpasq, haxsq]
  have hbxdot : b0 * x0 + b1 * x1 = S / 2 := by
    dsimp [b0, b1, x0, x1, S, R]
    nlinarith [hpbsq, hbxsq]
  have hcxdot : c0 * x0 + c1 * x1 = R / 2 := by
    dsimp [c0, c1, x0, x1, S, R]
    nlinarith [hpcsq, hxpcsq]
  have hac_eq_hbc : a0 * c0 + a1 * c1 = b0 * c0 + b1 * c1 := by
    dsimp [a0, a1, b0, b1, c0, c1]
    nlinarith [hpasq, hpbsq, hcabsq]
  exact u5_equilateral_bisector_coord_incompatibility
    hR haa hbb hcc hS habdot haxdot hbxdot hcxdot hac_eq_hbc

/-- K4-class form of `u5_equilateral_bisector_metric_incompatibility`. -/
theorem u5_equilateral_bisector_incompatibility
    {D : CounterexampleData} {q p a b c x : ℝ²}
    {Ba Bb Bx Bc : Finset ℝ²}
    (hr_pos : 0 < dist p q)
    (ha_radius : dist p a = dist p q)
    (hb_radius : dist p b = dist p q)
    (hc_radius : dist p c = dist p q)
    (Ka : U5QDeletedK4Class D q a Ba)
    (Kb : U5QDeletedK4Class D q b Bb)
    (Kx : U5QDeletedK4Class D q x Bx)
    (Kc : U5QDeletedK4Class D q c Bc)
    (hpBa : p ∈ Ba) (hbBa : b ∈ Ba) (hxBa : x ∈ Ba)
    (hpBb : p ∈ Bb) (_haBb : a ∈ Bb) (hxBb : x ∈ Bb)
    (hpBx : p ∈ Bx) (hcBx : c ∈ Bx)
    (haBc : a ∈ Bc) (hbBc : b ∈ Bc) : False := by
  have hab : dist a b = dist p q := by
    calc
      dist a b = Ka.radius := Ka.same_radius b hbBa
      _ = dist a p := (Ka.same_radius p hpBa).symm
      _ = dist p a := dist_comm a p
      _ = dist p q := ha_radius
  have hax : dist a x = dist p q := by
    calc
      dist a x = Ka.radius := Ka.same_radius x hxBa
      _ = dist a p := (Ka.same_radius p hpBa).symm
      _ = dist p a := dist_comm a p
      _ = dist p q := ha_radius
  have hbx : dist b x = dist p q := by
    calc
      dist b x = Kb.radius := Kb.same_radius x hxBb
      _ = dist b p := (Kb.same_radius p hpBb).symm
      _ = dist p b := dist_comm b p
      _ = dist p q := hb_radius
  have hxpc : dist x p = dist x c := by
    calc
      dist x p = Kx.radius := Kx.same_radius p hpBx
      _ = dist x c := (Kx.same_radius c hcBx).symm
  have hcab : dist c a = dist c b := by
    calc
      dist c a = Kc.radius := Kc.same_radius a haBc
      _ = dist c b := (Kc.same_radius b hbBc).symm
  exact u5_equilateral_bisector_metric_incompatibility hr_pos
    ha_radius hb_radius hc_radius hab hax hbx hxpc hcab

set_option maxHeartbeats 1000000 in
-- The proof first forces the common triple dot product, then eliminates ABX.
private theorem u5_equilateral_circumcenter_coord_on_circle
    {a0 a1 b0 b1 c0 c1 x0 x1 R S Y : ℝ}
    (hR : 0 < R)
    (haa : a0 ^ 2 + a1 ^ 2 = R)
    (hbb : b0 ^ 2 + b1 ^ 2 = R)
    (hcc : c0 ^ 2 + c1 ^ 2 = R)
    (hS : x0 ^ 2 + x1 ^ 2 = S)
    (habdot : a0 * b0 + a1 * b1 = Y)
    (hacdot : a0 * c0 + a1 * c1 = Y)
    (hbcdot : b0 * c0 + b1 * c1 = Y)
    (hYne : Y ≠ R)
    (haxdot : a0 * x0 + a1 * x1 = R / 2)
    (hbxdot : b0 * x0 + b1 * x1 = R / 2) : S = R := by
  have hgram_abc :
      (a0 ^ 2 + a1 ^ 2) * (b0 ^ 2 + b1 ^ 2) * (c0 ^ 2 + c1 ^ 2)
        + 2 * (a0 * b0 + a1 * b1) * (a0 * c0 + a1 * c1)
          * (b0 * c0 + b1 * c1)
        - (a0 ^ 2 + a1 ^ 2) * (b0 * c0 + b1 * c1) ^ 2
        - (b0 ^ 2 + b1 ^ 2) * (a0 * c0 + a1 * c1) ^ 2
        - (c0 ^ 2 + c1 ^ 2) * (a0 * b0 + a1 * b1) ^ 2 = 0 := by
    ring
  rw [haa, hbb, hcc, habdot, hacdot, hbcdot] at hgram_abc
  ring_nf at hgram_abc
  have hYeq : Y = -R / 2 := by
    have hfac : (Y - R) ^ 2 * (2 * Y + R) = 0 := by
      nlinarith [hgram_abc]
    have hnot : (Y - R) ^ 2 ≠ 0 := by
      intro hzero
      have : Y - R = 0 := sq_eq_zero_iff.mp hzero
      exact hYne (by linarith)
    have hlin : 2 * Y + R = 0 := by
      exact (mul_eq_zero.mp hfac).resolve_left hnot
    linarith
  have hgram_abx :
      (a0 ^ 2 + a1 ^ 2) * (b0 ^ 2 + b1 ^ 2) * (x0 ^ 2 + x1 ^ 2)
        + 2 * (a0 * b0 + a1 * b1) * (a0 * x0 + a1 * x1)
          * (b0 * x0 + b1 * x1)
        - (a0 ^ 2 + a1 ^ 2) * (b0 * x0 + b1 * x1) ^ 2
        - (b0 ^ 2 + b1 ^ 2) * (a0 * x0 + a1 * x1) ^ 2
        - (x0 ^ 2 + x1 ^ 2) * (a0 * b0 + a1 * b1) ^ 2 = 0 := by
    ring
  rw [haa, hbb, hS, habdot, haxdot, hbxdot, hYeq] at hgram_abx
  ring_nf at hgram_abx
  have hR2pos : 0 < R ^ 2 := by positivity
  have hdiff : R ^ 2 * (S - R) = 0 := by
    nlinarith [hgram_abx]
  nlinarith [hdiff, hR2pos]

set_option maxHeartbeats 5000000 in
-- Coordinate extraction from the distance hypotheses is the expensive step.
/-- Metric lemma behind the bounded-pattern prefilter
`equilateral_circumcenter_on_p_circle`.

If the dangerous triple has equal pairwise chord lengths on the `p`-circle,
then any point equidistant from `p` and two triple vertices lies on the same
`p`-circle. -/
theorem u5_equilateral_circumcenter_on_p_circle_metric_incompatibility
    {p a b c x : ℝ²} {r : ℝ} (hr : 0 < r)
    (hpa : dist p a = r) (hpb : dist p b = r) (hpc : dist p c = r)
    (hab_eq_hac : dist a b = dist a c)
    (hab_eq_hbc : dist a b = dist b c)
    (hab_pos : 0 < dist a b)
    (hxpa : dist x p = dist x a)
    (hxpb : dist x p = dist x b)
    (hx_off : dist p x ≠ r) : False := by
  have hpasq : dist p a ^ 2 = r ^ 2 := by rw [hpa]
  have hpbsq : dist p b ^ 2 = r ^ 2 := by rw [hpb]
  have hpcsq : dist p c ^ 2 = r ^ 2 := by rw [hpc]
  have hab_hac_sq : dist a b ^ 2 = dist a c ^ 2 := by rw [hab_eq_hac]
  have hab_hbc_sq : dist a b ^ 2 = dist b c ^ 2 := by rw [hab_eq_hbc]
  have hxpa_sq : dist x p ^ 2 = dist x a ^ 2 := by rw [hxpa]
  have hxpb_sq : dist x p ^ 2 = dist x b ^ 2 := by rw [hxpb]
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpasq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpbsq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpcsq
  rw [dist_sq_eq_coord_sq_add_coord_sq a b,
    dist_sq_eq_coord_sq_add_coord_sq a c] at hab_hac_sq
  rw [dist_sq_eq_coord_sq_add_coord_sq a b,
    dist_sq_eq_coord_sq_add_coord_sq b c] at hab_hbc_sq
  rw [dist_sq_eq_coord_sq_add_coord_sq x p,
    dist_sq_eq_coord_sq_add_coord_sq x a] at hxpa_sq
  rw [dist_sq_eq_coord_sq_add_coord_sq x p,
    dist_sq_eq_coord_sq_add_coord_sq x b] at hxpb_sq
  set a0 := p 0 - a 0
  set a1 := p 1 - a 1
  set b0 := p 0 - b 0
  set b1 := p 1 - b 1
  set c0 := p 0 - c 0
  set c1 := p 1 - c 1
  set x0 := p 0 - x 0
  set x1 := p 1 - x 1
  set R := r ^ 2
  set S := x0 ^ 2 + x1 ^ 2
  set Y := a0 * b0 + a1 * b1
  have hR : 0 < R := by positivity
  have haa : a0 ^ 2 + a1 ^ 2 = R := by
    simpa [a0, a1, R] using hpasq
  have hbb : b0 ^ 2 + b1 ^ 2 = R := by
    simpa [b0, b1, R] using hpbsq
  have hcc : c0 ^ 2 + c1 ^ 2 = R := by
    simpa [c0, c1, R] using hpcsq
  have hS : x0 ^ 2 + x1 ^ 2 = S := by simp [S]
  have habdot : a0 * b0 + a1 * b1 = Y := by simp [Y]
  have hacdot : a0 * c0 + a1 * c1 = Y := by
    dsimp [a0, a1, b0, b1, c0, c1, Y]
    nlinarith [hpasq, hpbsq, hpcsq, hab_hac_sq]
  have hbcdot : b0 * c0 + b1 * c1 = Y := by
    dsimp [a0, a1, b0, b1, c0, c1, Y]
    nlinarith [hpasq, hpbsq, hpcsq, hab_hbc_sq]
  have hYne : Y ≠ R := by
    intro hYR
    have hab_zero : dist a b = 0 := by
      have habsq_zero : dist a b ^ 2 = 0 := by
        rw [dist_sq_eq_coord_sq_add_coord_sq a b]
        dsimp [a0, a1, b0, b1, R, Y] at hpasq hpbsq hYR ⊢
        nlinarith [hpasq, hpbsq, hYR]
      exact sq_eq_zero_iff.mp habsq_zero
    nlinarith [hab_pos, hab_zero]
  have haxdot : a0 * x0 + a1 * x1 = R / 2 := by
    dsimp [a0, a1, x0, x1, S, R]
    nlinarith [hpasq, hxpa_sq]
  have hbxdot : b0 * x0 + b1 * x1 = R / 2 := by
    dsimp [b0, b1, x0, x1, S, R]
    nlinarith [hpbsq, hxpb_sq]
  have hS_eq_R := u5_equilateral_circumcenter_coord_on_circle
    hR haa hbb hcc hS habdot hacdot hbcdot hYne haxdot hbxdot
  have hx_sq : dist p x ^ 2 = r ^ 2 := by
    rw [dist_sq_eq_coord_sq_add_coord_sq p x]
    dsimp [x0, x1, S, R] at hS_eq_R ⊢
    nlinarith [hS_eq_R]
  have hx_on : dist p x = r := by
    have hdist_nonneg : 0 ≤ dist p x := dist_nonneg
    nlinarith
  exact hx_off hx_on

/-- K4-class form of the circumcenter-on-`p`-circle incompatibility. -/
theorem u5_equilateral_circumcenter_on_p_circle_incompatibility
    {D : CounterexampleData} {q p a b c x : ℝ²} {Bx : Finset ℝ²}
    (hr_pos : 0 < dist p q)
    (ha_radius : dist p a = dist p q)
    (hb_radius : dist p b = dist p q)
    (hc_radius : dist p c = dist p q)
    (hab_eq_hac : dist a b = dist a c)
    (hab_eq_hbc : dist a b = dist b c)
    (hab_pos : 0 < dist a b)
    (hx_off : dist p x ≠ dist p q)
    (Kx : U5QDeletedK4Class D q x Bx)
    (hpBx : p ∈ Bx) (haBx : a ∈ Bx) (hbBx : b ∈ Bx) : False := by
  have hxpa : dist x p = dist x a := by
    calc
      dist x p = Kx.radius := Kx.same_radius p hpBx
      _ = dist x a := (Kx.same_radius a haBx).symm
  have hxpb : dist x p = dist x b := by
    calc
      dist x p = Kx.radius := Kx.same_radius p hpBx
      _ = dist x b := (Kx.same_radius b hbBx).symm
  exact u5_equilateral_circumcenter_on_p_circle_metric_incompatibility
    hr_pos ha_radius hb_radius hc_radius hab_eq_hac hab_eq_hbc hab_pos
    hxpa hxpb hx_off

set_option maxHeartbeats 1000000 in
-- The proof eliminates the outer equilateral point by three Gram determinants.
private theorem u5_equilateral_outer_point_coord_incompatibility
    {a0 a1 b0 b1 c0 c1 x0 x1 R S Y : ℝ}
    (hR : 0 < R)
    (haa : a0 ^ 2 + a1 ^ 2 = R)
    (hbb : b0 ^ 2 + b1 ^ 2 = R)
    (hcc : c0 ^ 2 + c1 ^ 2 = R)
    (hS : x0 ^ 2 + x1 ^ 2 = S)
    (habdot : a0 * b0 + a1 * b1 = Y)
    (hacdot : a0 * c0 + a1 * c1 = Y)
    (hbcdot : b0 * c0 + b1 * c1 = Y)
    (hYne : Y ≠ R)
    (haxdot : a0 * x0 + a1 * x1 = (S - R + 2 * Y) / 2)
    (hbxdot : b0 * x0 + b1 * x1 = (S - R + 2 * Y) / 2)
    (hcxdot : c0 * x0 + c1 * x1 = R / 2) : False := by
  have hgram_abc :
      (a0 ^ 2 + a1 ^ 2) * (b0 ^ 2 + b1 ^ 2) * (c0 ^ 2 + c1 ^ 2)
        + 2 * (a0 * b0 + a1 * b1) * (a0 * c0 + a1 * c1)
          * (b0 * c0 + b1 * c1)
        - (a0 ^ 2 + a1 ^ 2) * (b0 * c0 + b1 * c1) ^ 2
        - (b0 ^ 2 + b1 ^ 2) * (a0 * c0 + a1 * c1) ^ 2
        - (c0 ^ 2 + c1 ^ 2) * (a0 * b0 + a1 * b1) ^ 2 = 0 := by
    ring
  rw [haa, hbb, hcc, habdot, hacdot, hbcdot] at hgram_abc
  ring_nf at hgram_abc
  have hYeq : Y = -R / 2 := by
    have hfac : (Y - R) ^ 2 * (2 * Y + R) = 0 := by
      nlinarith [hgram_abc]
    have hnot : (Y - R) ^ 2 ≠ 0 := by
      intro hzero
      have : Y - R = 0 := sq_eq_zero_iff.mp hzero
      exact hYne (by linarith)
    have hlin : 2 * Y + R = 0 := by
      exact (mul_eq_zero.mp hfac).resolve_left hnot
    linarith
  have haxdot' : a0 * x0 + a1 * x1 = (S - 2 * R) / 2 := by
    nlinarith
  have hbxdot' : b0 * x0 + b1 * x1 = (S - 2 * R) / 2 := by
    nlinarith
  have hgram_abx :
      (a0 ^ 2 + a1 ^ 2) * (b0 ^ 2 + b1 ^ 2) * (x0 ^ 2 + x1 ^ 2)
        + 2 * (a0 * b0 + a1 * b1) * (a0 * x0 + a1 * x1)
          * (b0 * x0 + b1 * x1)
        - (a0 ^ 2 + a1 ^ 2) * (b0 * x0 + b1 * x1) ^ 2
        - (b0 ^ 2 + b1 ^ 2) * (a0 * x0 + a1 * x1) ^ 2
        - (x0 ^ 2 + x1 ^ 2) * (a0 * b0 + a1 * b1) ^ 2 = 0 := by
    ring
  rw [haa, hbb, hS, habdot, haxdot', hbxdot', hYeq] at hgram_abx
  ring_nf at hgram_abx
  have hgram_acx :
      (a0 ^ 2 + a1 ^ 2) * (c0 ^ 2 + c1 ^ 2) * (x0 ^ 2 + x1 ^ 2)
        + 2 * (a0 * c0 + a1 * c1) * (a0 * x0 + a1 * x1)
          * (c0 * x0 + c1 * x1)
        - (a0 ^ 2 + a1 ^ 2) * (c0 * x0 + c1 * x1) ^ 2
        - (c0 ^ 2 + c1 ^ 2) * (a0 * x0 + a1 * x1) ^ 2
        - (x0 ^ 2 + x1 ^ 2) * (a0 * c0 + a1 * c1) ^ 2 = 0 := by
    ring
  rw [haa, hcc, hS, hacdot, haxdot', hcxdot, hYeq] at hgram_acx
  ring_nf at hgram_acx
  have hSprod : (S - R) * (S - 4 * R) = 0 := by
    nlinarith [hgram_abx]
  rcases mul_eq_zero.mp hSprod with hS1 | hS4
  · have hSeq : S = R := by linarith
    rw [hSeq] at hgram_acx
    ring_nf at hgram_acx
    have hR3pos : 0 < R ^ 3 := by positivity
    nlinarith
  · have hSeq : S = 4 * R := by linarith
    rw [hSeq] at hgram_acx
    ring_nf at hgram_acx
    have hR3pos : 0 < R ^ 3 := by positivity
    nlinarith

set_option maxHeartbeats 5000000 in
-- Coordinate extraction from the distance hypotheses is the expensive step.
/-- Metric lemma behind the bounded-pattern prefilter
`equilateral_outer_point`.

If the dangerous triple has equal pairwise chord lengths on the `p`-circle
and `x` is at that side-length from two adjacent triple vertices, then `x`
cannot also be equidistant from `p` and the opposite triple vertex. -/
theorem u5_equilateral_outer_point_metric_incompatibility
    {p a b c x : ℝ²} {r : ℝ} (hr : 0 < r)
    (hpa : dist p a = r) (hpb : dist p b = r) (hpc : dist p c = r)
    (hab_eq_hac : dist a b = dist a c)
    (hab_eq_hbc : dist a b = dist b c)
    (hab_pos : 0 < dist a b)
    (hax_side : dist a x = dist a b)
    (hbx_side : dist b x = dist a b)
    (hxpc : dist x p = dist x c) : False := by
  have hpasq : dist p a ^ 2 = r ^ 2 := by rw [hpa]
  have hpbsq : dist p b ^ 2 = r ^ 2 := by rw [hpb]
  have hpcsq : dist p c ^ 2 = r ^ 2 := by rw [hpc]
  have hab_hac_sq : dist a b ^ 2 = dist a c ^ 2 := by rw [hab_eq_hac]
  have hab_hbc_sq : dist a b ^ 2 = dist b c ^ 2 := by rw [hab_eq_hbc]
  have hax_side_sq : dist a x ^ 2 = dist a b ^ 2 := by rw [hax_side]
  have hbx_side_sq : dist b x ^ 2 = dist a b ^ 2 := by rw [hbx_side]
  have hxpcsq : dist x p ^ 2 = dist x c ^ 2 := by rw [hxpc]
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpasq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpbsq
  rw [dist_sq_eq_coord_sq_add_coord_sq] at hpcsq
  rw [dist_sq_eq_coord_sq_add_coord_sq a b,
    dist_sq_eq_coord_sq_add_coord_sq a c] at hab_hac_sq
  rw [dist_sq_eq_coord_sq_add_coord_sq a b,
    dist_sq_eq_coord_sq_add_coord_sq b c] at hab_hbc_sq
  rw [dist_sq_eq_coord_sq_add_coord_sq a x,
    dist_sq_eq_coord_sq_add_coord_sq a b] at hax_side_sq
  rw [dist_sq_eq_coord_sq_add_coord_sq b x,
    dist_sq_eq_coord_sq_add_coord_sq a b] at hbx_side_sq
  rw [dist_sq_eq_coord_sq_add_coord_sq x p,
    dist_sq_eq_coord_sq_add_coord_sq x c] at hxpcsq
  set a0 := p 0 - a 0
  set a1 := p 1 - a 1
  set b0 := p 0 - b 0
  set b1 := p 1 - b 1
  set c0 := p 0 - c 0
  set c1 := p 1 - c 1
  set x0 := p 0 - x 0
  set x1 := p 1 - x 1
  set R := r ^ 2
  set S := x0 ^ 2 + x1 ^ 2
  set Y := a0 * b0 + a1 * b1
  have hR : 0 < R := by positivity
  have haa : a0 ^ 2 + a1 ^ 2 = R := by
    simpa [a0, a1, R] using hpasq
  have hbb : b0 ^ 2 + b1 ^ 2 = R := by
    simpa [b0, b1, R] using hpbsq
  have hcc : c0 ^ 2 + c1 ^ 2 = R := by
    simpa [c0, c1, R] using hpcsq
  have hS : x0 ^ 2 + x1 ^ 2 = S := by simp [S]
  have habdot : a0 * b0 + a1 * b1 = Y := by simp [Y]
  have hacdot : a0 * c0 + a1 * c1 = Y := by
    dsimp [a0, a1, b0, b1, c0, c1, Y]
    nlinarith [hpasq, hpbsq, hpcsq, hab_hac_sq]
  have hbcdot : b0 * c0 + b1 * c1 = Y := by
    dsimp [a0, a1, b0, b1, c0, c1, Y]
    nlinarith [hpasq, hpbsq, hpcsq, hab_hbc_sq]
  have hYne : Y ≠ R := by
    intro hYR
    have hab_zero : dist a b = 0 := by
      have habsq_zero : dist a b ^ 2 = 0 := by
        rw [dist_sq_eq_coord_sq_add_coord_sq a b]
        dsimp [a0, a1, b0, b1, R, Y] at hpasq hpbsq hYR ⊢
        nlinarith [hpasq, hpbsq, hYR]
      exact sq_eq_zero_iff.mp habsq_zero
    nlinarith [hab_pos, hab_zero]
  have haxdot : a0 * x0 + a1 * x1 = (S - R + 2 * Y) / 2 := by
    dsimp [a0, a1, b0, b1, x0, x1, S, R, Y]
    nlinarith [hpasq, hpbsq, hax_side_sq]
  have hbxdot : b0 * x0 + b1 * x1 = (S - R + 2 * Y) / 2 := by
    dsimp [a0, a1, b0, b1, x0, x1, S, R, Y]
    nlinarith [hpasq, hpbsq, hbx_side_sq]
  have hcxdot : c0 * x0 + c1 * x1 = R / 2 := by
    dsimp [c0, c1, x0, x1, S, R]
    nlinarith [hpcsq, hxpcsq]
  exact u5_equilateral_outer_point_coord_incompatibility
    hR haa hbb hcc hS habdot hacdot hbcdot hYne haxdot hbxdot hcxdot

/-- K4-class form of the outer-equilateral incompatibility. -/
theorem u5_equilateral_outer_point_incompatibility
    {D : CounterexampleData} {q p a b c x : ℝ²} {Bx : Finset ℝ²}
    (hr_pos : 0 < dist p q)
    (ha_radius : dist p a = dist p q)
    (hb_radius : dist p b = dist p q)
    (hc_radius : dist p c = dist p q)
    (hab_eq_hac : dist a b = dist a c)
    (hab_eq_hbc : dist a b = dist b c)
    (hab_pos : 0 < dist a b)
    (hax_side : dist a x = dist a b)
    (hbx_side : dist b x = dist a b)
    (Kx : U5QDeletedK4Class D q x Bx)
    (hpBx : p ∈ Bx) (hcBx : c ∈ Bx) : False := by
  have hxpc : dist x p = dist x c := by
    calc
      dist x p = Kx.radius := Kx.same_radius p hpBx
      _ = dist x c := (Kx.same_radius c hcBx).symm
  exact u5_equilateral_outer_point_metric_incompatibility hr_pos
    ha_radius hb_radius hc_radius hab_eq_hac hab_eq_hbc hab_pos
    hax_side hbx_side hxpc

end Problem97
