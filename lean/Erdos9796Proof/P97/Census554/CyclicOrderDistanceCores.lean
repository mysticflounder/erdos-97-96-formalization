/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.Census554.FivePointCircleIsoscelesOrderCore
import Erdos9796Proof.P97.ConvexCyclicOrder.Basic
import Erdos9796Proof.P97.U2.WitnessReflectionKernel

/-!
# Distance-level cyclic-order cores on a convex boundary enumeration

Two obstructions stated directly on distances between vertices of one CCW
convex-polygon enumeration `φ : Fin n → ℝ²`, with the order data given as
cyclic patterns of indices (invariant under rotation of the enumeration):

* `false_of_two_circle_same_arc`: two distinct common points `u, y` of the
  circle centered at `q` and the circle centered at `v` are mirror images in
  the line `q v`, so they cannot lie on the same arc of the chord `q v`.
  Kernel: `Problem97.twoCircle_sameSide_reflection_false`.
* `false_of_circle_isosceles_cyclic`: five vertices in the cyclic pattern
  `W, F, P, X, Z` or its reverse cannot satisfy `WF = WX = WZ` and
  `PZ = XZ`.  Kernel: `FivePointCircleIsoscelesOrderCore.
  metric_order_incompatibility`, with the chord-side signs from `hneg_of_ccw`
  and the diagonal crossing from
  `CapCrossingKalmansonBridge.exists_mem_openSegment_diagonals_of_ccw`.

These are the two clause families of the exact-12 structural CNF of the D-R
two-radius branch (`census/card_head/dr_exact12_structural.py`, families
`two_circle_same_arc` and `five_point_circle_isosceles_order`); their
consumer is the valuation theorem of
`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`, Phase 3 (P3.4).
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace CyclicOrderDistanceCores

/-- Three indices occur in this cyclic order along the enumeration. -/
def CyclicThree {n : ℕ} (i j k : Fin n) : Prop :=
  (i < j ∧ j < k) ∨ (j < k ∧ k < i) ∨ (k < i ∧ i < j)

/-- Four indices occur in this cyclic order along the enumeration. -/
def CyclicFour {n : ℕ} (a b c d : Fin n) : Prop :=
  (a < b ∧ b < c ∧ c < d) ∨ (b < c ∧ c < d ∧ d < a) ∨
    (c < d ∧ d < a ∧ a < b) ∨ (d < a ∧ a < b ∧ b < c)

/-- Five indices occur in this cyclic order along the enumeration. -/
def CyclicFive {n : ℕ} (a b c d e : Fin n) : Prop :=
  (a < b ∧ b < c ∧ c < d ∧ d < e) ∨ (b < c ∧ c < d ∧ d < e ∧ e < a) ∨
    (c < d ∧ d < e ∧ e < a ∧ a < b) ∨ (d < e ∧ e < a ∧ a < b ∧ b < c) ∨
    (e < a ∧ a < b ∧ b < c ∧ c < d)

/-- Cyclic rotation of the three arguments leaves `signedArea2` unchanged. -/
private lemma signedArea2_rotate (a b c : ℝ²) :
    signedArea2 a b c = signedArea2 c a b := by
  simp only [signedArea2]
  ring

/-- Transposing the first two arguments negates `signedArea2`. -/
private lemma signedArea2_swap12 (a b c : ℝ²) :
    signedArea2 b a c = -signedArea2 a b c := by
  simp only [signedArea2]
  ring

/-- Transposing the outer two arguments negates `signedArea2`. -/
private lemma signedArea2_swap13 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 c b a := by
  simp only [signedArea2]
  ring

/-- The first, second and fifth entries of a cyclic quintuple form a cyclic
triple. -/
private lemma cyclicThree_abe {n : ℕ} {a b c d e : Fin n}
    (h : CyclicFive a b c d e) : CyclicThree a b e := by
  unfold CyclicFive at h
  unfold CyclicThree
  omega

/-- The first, second and fourth entries of a cyclic quintuple form a cyclic
triple. -/
private lemma cyclicThree_abd {n : ℕ} {a b c d e : Fin n}
    (h : CyclicFive a b c d e) : CyclicThree a b d := by
  unfold CyclicFive at h
  unfold CyclicThree
  omega

/-- The first, fourth and fifth entries of a cyclic quintuple form a cyclic
triple. -/
private lemma cyclicThree_ade {n : ℕ} {a b c d e : Fin n}
    (h : CyclicFive a b c d e) : CyclicThree a d e := by
  unfold CyclicFive at h
  unfold CyclicThree
  omega

/-- The second, fourth and fifth entries of a cyclic quintuple form a cyclic
triple. -/
private lemma cyclicThree_bde {n : ℕ} {a b c d e : Fin n}
    (h : CyclicFive a b c d e) : CyclicThree b d e := by
  unfold CyclicFive at h
  unfold CyclicThree
  omega

/-- The first four entries of a cyclic quintuple form a cyclic quadruple. -/
private lemma cyclicFour_abcd {n : ℕ} {a b c d e : Fin n}
    (h : CyclicFive a b c d e) : CyclicFour a b c d := by
  unfold CyclicFive at h
  unfold CyclicFour
  omega

/-- The last four entries of a cyclic quintuple form a cyclic quadruple. -/
private lemma cyclicFour_bcde {n : ℕ} {a b c d e : Fin n}
    (h : CyclicFive a b c d e) : CyclicFour b c d e := by
  unfold CyclicFive at h
  unfold CyclicFour
  omega

/-- A cyclically ordered triple of a CCW enumeration has negative signed area
(`hneg_of_ccw` extended to rotations of the triple). -/
theorem signedArea2_neg_of_cyclicThree {n : ℕ} {φ : Fin n → ℝ²}
    (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {i j k : Fin n} (h : CyclicThree i j k) :
    signedArea2 (φ i) (φ j) (φ k) < 0 := by
  rcases h with ⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨h1, h2⟩
  · exact hneg_of_ccw hinj hccw h1 h2
  · have hjki : signedArea2 (φ j) (φ k) (φ i) < 0 := hneg_of_ccw hinj hccw h1 h2
    rwa [signedArea2_rotate (φ j) (φ k) (φ i)] at hjki
  · have hkij : signedArea2 (φ k) (φ i) (φ j) < 0 := hneg_of_ccw hinj hccw h1 h2
    rwa [signedArea2_rotate (φ k) (φ i) (φ j), signedArea2_rotate (φ j) (φ k) (φ i)] at hkij

/-- The two diagonals of a cyclically ordered quadruple cross. -/
theorem exists_mem_openSegment_diagonals_of_cyclicFour
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {φ : Fin n → ℝ²}
    (hinj : Function.Injective φ)
    (himage : Finset.univ.image φ = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {a b c d : Fin n} (h : CyclicFour a b c d) :
    ∃ z : ℝ²,
      z ∈ openSegment ℝ (φ a) (φ c) ∧ z ∈ openSegment ℝ (φ b) (φ d) := by
  rcases h with ⟨h1, h2, h3⟩ | ⟨h1, h2, h3⟩ | ⟨h1, h2, h3⟩ | ⟨h1, h2, h3⟩
  · exact CapCrossingKalmansonBridge.exists_mem_openSegment_diagonals_of_ccw
      hA hinj himage hccw h1 h2 h3
  · obtain ⟨z, hz1, hz2⟩ :=
      CapCrossingKalmansonBridge.exists_mem_openSegment_diagonals_of_ccw
        hA hinj himage hccw h1 h2 h3
    exact ⟨z, by rw [openSegment_symm]; exact hz2, hz1⟩
  · obtain ⟨z, hz1, hz2⟩ :=
      CapCrossingKalmansonBridge.exists_mem_openSegment_diagonals_of_ccw
        hA hinj himage hccw h1 h2 h3
    exact ⟨z, by rw [openSegment_symm]; exact hz1, by rw [openSegment_symm]; exact hz2⟩
  · obtain ⟨z, hz1, hz2⟩ :=
      CapCrossingKalmansonBridge.exists_mem_openSegment_diagonals_of_ccw
        hA hinj himage hccw h1 h2 h3
    exact ⟨z, hz2, by rw [openSegment_symm]; exact hz1⟩

/-- Two distinct common points `u, y` of the circles centered at `q` and at
`v` do not lie on the same arc of the chord `q v`.  With `iq < iv`, the arc
condition says that `u` is strictly between `q` and `v` exactly when `y` is. -/
theorem false_of_two_circle_same_arc {n : ℕ} {φ : Fin n → ℝ²}
    (hinj : Function.Injective φ)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {iq iv iu iy : Fin n} (hqv : iq < iv) (huy : iu ≠ iy)
    (huq : iu ≠ iq) (huv : iu ≠ iv) (hyq : iy ≠ iq) (hyv : iy ≠ iv)
    (hsame : (iq < iu ∧ iu < iv) ↔ (iq < iy ∧ iy < iv))
    (hqu_qy : dist (φ iq) (φ iu) = dist (φ iq) (φ iy))
    (huv_yv : dist (φ iu) (φ iv) = dist (φ iy) (φ iv)) :
    False := by
  have hprod :
      0 < signedArea2 (φ iy) (φ iq) (φ iv) * signedArea2 (φ iu) (φ iq) (φ iv) := by
    by_cases hbu : iq < iu ∧ iu < iv
    · have hby : iq < iy ∧ iy < iv := hsame.mp hbu
      exact mul_pos (signedArea2_pos_of_between hccw hinj hby.1 hby.2)
        (signedArea2_pos_of_between hccw hinj hbu.1 hbu.2)
    · have hby : ¬ (iq < iy ∧ iy < iv) := fun hy => hbu (hsame.mpr hy)
      have hou : iu < iq ∨ iv < iu := by
        rcases lt_or_gt_of_ne huq with h | h
        · exact Or.inl h
        · rcases lt_or_gt_of_ne huv with h2 | h2
          · exact absurd ⟨h, h2⟩ hbu
          · exact Or.inr h2
      have hoy : iy < iq ∨ iv < iy := by
        rcases lt_or_gt_of_ne hyq with h | h
        · exact Or.inl h
        · rcases lt_or_gt_of_ne hyv with h2 | h2
          · exact absurd ⟨h, h2⟩ hby
          · exact Or.inr h2
      exact mul_pos_of_neg_of_neg (signedArea2_neg_of_outside hccw hinj hqv hoy)
        (signedArea2_neg_of_outside hccw hinj hqv hou)
  have hsq :
      0 < signedArea2 (φ iu) (φ iq) (φ iv) * signedArea2 (φ iu) (φ iq) (φ iv) := by
    have hne : signedArea2 (φ iu) (φ iq) (φ iv) ≠ 0 := by
      intro hz
      rw [hz, mul_zero] at hprod
      exact lt_irrefl 0 hprod
    exact mul_self_pos.mpr hne
  have hyq' : dist (φ iy) (φ iq) = dist (φ iu) (φ iq) := by
    rw [dist_comm (φ iy) (φ iq), ← hqu_qy, dist_comm]
  exact twoCircle_sameSide_reflection_false (q := φ iq) (v2 := φ iv) (apex := φ iu)
    (y := φ iy) (u := φ iu) (rq := dist (φ iu) (φ iq)) (rv := dist (φ iu) (φ iv))
    rfl hyq' rfl huv_yv.symm (hinj.ne huy) hsq hprod

/-- Five vertices in the cyclic pattern `W, F, P, X, Z` or its reverse cannot
satisfy `WF = WX = WZ` and `PZ = XZ`. -/
theorem false_of_circle_isosceles_cyclic
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {φ : Fin n → ℝ²}
    (hinj : Function.Injective φ)
    (himage : Finset.univ.image φ = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon φ)
    {iW iF iP iX iZ : Fin n}
    (hpat : CyclicFive iW iF iP iX iZ ∨ CyclicFive iZ iX iP iF iW)
    (hWF_WX : dist (φ iW) (φ iF) = dist (φ iW) (φ iX))
    (hWF_WZ : dist (φ iW) (φ iF) = dist (φ iW) (φ iZ))
    (hPZ_XZ : dist (φ iP) (φ iZ) = dist (φ iX) (φ iZ)) :
    False := by
  rcases hpat with h5 | h5
  · -- Forward pattern `W, F, P, X, Z`.
    have hv := h5
    unfold CyclicFive at hv
    have hWFZ : signedArea2 (φ iW) (φ iF) (φ iZ) < 0 :=
      signedArea2_neg_of_cyclicThree hinj hccw (cyclicThree_abe h5)
    have hFXZ : signedArea2 (φ iF) (φ iX) (φ iZ) < 0 :=
      signedArea2_neg_of_cyclicThree hinj hccw (cyclicThree_bde h5)
    have hXFZ : 0 < signedArea2 (φ iX) (φ iF) (φ iZ) := by
      rw [signedArea2_swap12]
      linarith
    obtain ⟨z, hz1, hz2⟩ :=
      exists_mem_openSegment_diagonals_of_cyclicFour hA hinj himage hccw
        (cyclicFour_bcde h5)
    exact FivePointCircleIsoscelesOrderCore.metric_order_incompatibility
      (hinj.ne (by omega)) (hinj.ne (by omega)) (hinj.ne (by omega))
      hWF_WX hWF_WZ hPZ_XZ (mul_neg_of_neg_of_pos hWFZ hXFZ) ⟨z, hz1, hz2⟩
  · -- Reverse pattern `Z, X, P, F, W`.
    have hv := h5
    unfold CyclicFive at hv
    have hZFW : signedArea2 (φ iZ) (φ iF) (φ iW) < 0 :=
      signedArea2_neg_of_cyclicThree hinj hccw (cyclicThree_ade h5)
    have hWFZ : 0 < signedArea2 (φ iW) (φ iF) (φ iZ) := by
      rw [signedArea2_swap13]
      linarith
    have hZXF : signedArea2 (φ iZ) (φ iX) (φ iF) < 0 :=
      signedArea2_neg_of_cyclicThree hinj hccw (cyclicThree_abd h5)
    have hXFZ : signedArea2 (φ iX) (φ iF) (φ iZ) < 0 := by
      rw [signedArea2_rotate (φ iX) (φ iF) (φ iZ)]
      exact hZXF
    obtain ⟨z, hz1, hz2⟩ :=
      exists_mem_openSegment_diagonals_of_cyclicFour hA hinj himage hccw
        (cyclicFour_abcd h5)
    refine FivePointCircleIsoscelesOrderCore.metric_order_incompatibility
      (hinj.ne (by omega)) (hinj.ne (by omega)) (hinj.ne (by omega))
      hWF_WX hWF_WZ hPZ_XZ (mul_neg_of_pos_of_neg hWFZ hXFZ) ⟨z, ?_, ?_⟩
    · rw [openSegment_symm]
      exact hz2
    · rw [openSegment_symm]
      exact hz1

end CyclicOrderDistanceCores
end Census554
end Problem97
