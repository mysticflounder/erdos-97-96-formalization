/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FirstApexInteriorPairCirclePower
import Erdos9796Proof.Geometry.SimilarityFrame
import Mathlib.Analysis.Convex.Combination

/-!
# The mutual return chord obstruction

The mutual-incidence guard is essential: these geometric lemmas do not
assert that an arbitrary pair of actual blocker rows is mutually incident.
-/

open scoped EuclideanGeometry
open Erdos9796Proof.Geometry

namespace Problem97.ExactFiveMutualReturnChord

private theorem affine_map_three {E : Type*} [AddCommGroup E] [Module ℝ E]
    (f : Plane →ᵃ[ℝ] E) (x y z : Plane) {a b c : ℝ}
    (hs : a + b + c = 1) :
    f (a • x + b • y + c • z) = a • f x + b • f y + c • f z := by
  have hd (p : Plane) : f p = f.linear p + f 0 := by
    simpa using f.map_vadd (0 : Plane) p
  rw [hd (a • x + b • y + c • z), hd x, hd y, hd z]
  simp only [map_add, map_smul, smul_add]
  have hh : (a + b + c) • f 0 = f 0 := by rw [hs, one_smul]
  conv_lhs => rw [← hh]
  module

private theorem convex_three {T : Set Plane} (hT : Convex ℝ T)
    {x y z : Plane} (hx : x ∈ T) (hy : y ∈ T) (hz : z ∈ T)
    {a b c : ℝ} (ha : 0 ≤ a) (hb : 0 ≤ b) (hc : 0 ≤ c)
    (hs : a + b + c = 1) : a • x + b • y + c • z ∈ T := by
  have hh := hT.sum_mem (t := Finset.univ) (w := ![a, b, c]) (z := ![x, y, z])
    (by intro i hi; fin_cases i <;> simp [*])
    (by simpa [Fin.sum_univ_succ, add_assoc] using hs)
    (by intro i hi; fin_cases i <;> simp [*])
  simpa [Fin.sum_univ_succ, add_assoc] using hh

private theorem not_convex_three {A : Finset Plane} (hA : ConvexIndep A)
    {p x y z : Plane} (hp : p ∈ A) (hx : x ∈ A) (hy : y ∈ A) (hz : z ∈ A)
    (hxp : x ≠ p) (hyp : y ≠ p) (hzp : z ≠ p)
    {a b c : ℝ} (ha : 0 ≤ a) (hb : 0 ≤ b) (hc : 0 ≤ c)
    (hs : a + b + c = 1) (he : p = a • x + b • y + c • z) : False := by
  apply hA p hp
  rw [he] at hxp hyp hzp
  rw [he]
  apply convex_three (convex_convexHull ℝ _) _ _ _ ha hb hc hs
  all_goals apply subset_convexHull ℝ _
  · exact ⟨hx, hxp⟩
  · exact ⟨hy, hyp⟩
  · exact ⟨hz, hzp⟩

/-- The upper equilateral placement is incompatible with the cap separator:
convex independence forces the coefficient of `c` to be positive. -/
private theorem upper_placement_false
    {A : Finset Plane} (hconv : ConvexIndep A) {q O c b : Plane}
    (hqA : q ∈ A) (hOA : O ∈ A) (hcA : c ∈ A) (hbA : b ∈ A)
    (hbq : b ≠ q) (hcq : c ≠ q) (hOq : O ≠ q)
    (F : Plane →ᵃ[ℝ] Plane) (hF : Function.Injective F)
    {h k s σ : ℝ} (hh : 0 < h) (hk : 0 < k) (hs : 0 < s)
    (hFq : F q = planePoint (-1) 0) (hFO : F O = planePoint 0 (-σ * h))
    (hFc : F c = planePoint 0 (σ * k))
    (hFb : F b = planePoint (-(1 + s * k) / 2) (σ * ((k + s) / 2)))
    (L : Plane →ᵃ[ℝ] ℝ)
    (hLq : 0 < L q) (hLc : 0 < L c) (hLO : L O < 0) (hLb : L b < 0) : False := by
  let α := (1 + s * k) / 2
  let γ := s * (1 + k ^ 2) / (2 * (h + k))
  let β := 1 - α + γ
  have hα : 0 < α := by dsimp [α]; positivity
  have hγ : 0 < γ := by dsimp [γ]; positivity
  have hhk : h + k ≠ 0 := ne_of_gt (add_pos hh hk)
  have hsum : α + β + -γ = 1 := by dsimp [β]; ring
  have hbAffine : b = α • q + β • c + (-γ) • O := by
    apply hF
    rw [affine_map_three F q c O hsum, hFb, hFq, hFc, hFO]
    ext i
    fin_cases i <;>
      simp [planePoint, PiLp.add_apply, PiLp.smul_apply,
        α, β, γ] <;>
      field_simp <;> ring
  by_cases hβ : β ≤ 0
  · have hαne := ne_of_gt hα
    have hqAffine : q = α⁻¹ • b + (-β / α) • c + (γ / α) • O := by
      have he : α • q = b + (-β) • c + γ • O := by
        rw [hbAffine]
        module
      calc
        q = α⁻¹ • (α • q) := by
          rw [smul_smul, inv_mul_cancel₀ hαne, one_smul]
        _ = α⁻¹ • b + (-β / α) • c + (γ / α) • O := by
          rw [he]
          simp only [smul_add, smul_smul, div_eq_mul_inv]
          module
    have hconvsum : α⁻¹ + -β / α + γ / α = 1 := by
      field_simp
      dsimp [β]
      ring
    exact not_convex_three hconv hqA hbA hcA hOA hbq hcq hOq
      (inv_nonneg.mpr hα.le) (div_nonneg (neg_nonneg.mpr hβ) hα.le)
      (div_nonneg hγ.le hα.le) hconvsum hqAffine
  · have hβpos : 0 < β := lt_of_not_ge hβ
    have hL := congrArg L hbAffine
    rw [affine_map_three L q c O hsum] at hL
    simp only [smul_eq_mul] at hL
    nlinarith [mul_pos hα hLq, mul_pos hβpos hLc, mul_neg_of_pos_of_neg hγ hLO]

/-- When the first apex has normalized height at least `√3`, the lower
equilateral placement is strictly inside the triangle with vertices `O,q,w`. -/
private theorem lower_placement_false
    {A : Finset Plane} (hconv : ConvexIndep A) {q w O b : Plane}
    (hqA : q ∈ A) (hwA : w ∈ A) (hOA : O ∈ A) (hbA : b ∈ A)
    (hbO : b ≠ O) (hbq : b ≠ q) (hbw : b ≠ w)
    (F : Plane →ᵃ[ℝ] Plane) (hF : Function.Injective F)
    {h k s σ : ℝ} (hsq : s ^ 2 = 3) (hs : 0 < s) (hsh : s ≤ h)
    (hk : 0 < k) (hk1 : k ≤ 1)
    (hFq : F q = planePoint (-1) 0) (hFw : F w = planePoint 1 0)
    (hFO : F O = planePoint 0 (-σ * h))
    (hFb : F b = planePoint ((s * k - 1) / 2) (σ * ((k - s) / 2))) : False := by
  let x := (s * k - 1) / 2
  let δ := (s - k) / (2 * h)
  have hs1 : 1 < s := by nlinarith
  have hs2 : s < 2 := by nlinarith
  have hh : 0 < h := lt_of_lt_of_le hs hsh
  have hhne := ne_of_gt hh
  have hδ : 0 < δ :=
    div_pos (sub_pos.mpr (lt_of_le_of_lt hk1 hs1)) (mul_pos (by norm_num) hh)
  have hδhalf : δ < 1 / 2 := by
    dsimp [δ]
    apply (div_lt_iff₀ (by positivity : 0 < 2 * h)).mpr
    linarith
  have hxlo : -(1 / 2) < x := by dsimp [x]; nlinarith [mul_pos hs hk]
  have hxhi : x < 1 / 2 := by dsimp [x]; nlinarith
  have hleft : 0 ≤ (1 - δ - x) / 2 := by linarith
  have hright : 0 ≤ (1 - δ + x) / 2 := by linarith
  have hsum : δ + (1 - δ - x) / 2 + (1 - δ + x) / 2 = 1 := by ring
  have hbAffine : b = δ • O + ((1 - δ - x) / 2) • q + ((1 - δ + x) / 2) • w := by
    apply hF
    rw [affine_map_three F O q w hsum, hFb, hFO, hFq, hFw]
    ext i
    fin_cases i <;>
      simp [planePoint, PiLp.add_apply, PiLp.smul_apply,
        x, δ] <;>
      field_simp <;> ring
  exact not_convex_three hconv hbA hOA hqA hwA hbO.symm hbq.symm hbw.symm
    hδ.le hleft hright hsum hbAffine

/-- The two equal-radius equations determine the two equilateral placements. -/
private theorem equilateral_placements
    {k x y s : ℝ} (hsq : s ^ 2 = 3)
    (heq1 : (x + 1) ^ 2 + y ^ 2 = 1 + k ^ 2)
    (heq2 : x ^ 2 + (y - k) ^ 2 = 1 + k ^ 2) :
    (x = -(1 + s * k) / 2 ∧ y = (k + s) / 2) ∨
      (x = (s * k - 1) / 2 ∧ y = (k - s) / 2) := by
  have hlinear : 2 * x + 2 * k * y = k ^ 2 - 1 := by
    nlinarith [heq1, heq2]
  have hprod : (1 + k ^ 2) * ((2 * y - k) ^ 2 - s ^ 2) = 0 := by
    linear_combination
      (4 - (2 * x - 2 * k * y + 3 + k ^ 2)) * heq1 +
      (2 * x - 2 * k * y + 3 + k ^ 2) * heq2 - (1 + k ^ 2) * hsq
  have hsq' : (2 * y - k) ^ 2 - s ^ 2 = 0 :=
    (mul_eq_zero.mp hprod).resolve_left (by positivity)
  have hfactor : (2 * y - k - s) * (2 * y - k + s) = 0 := by nlinarith [hsq']
  rcases mul_eq_zero.mp hfactor with hupper | hlower
  · have hy : y = (k + s) / 2 := by linarith
    rw [hy] at hlinear
    exact Or.inl ⟨by nlinarith [hlinear], hy⟩
  · have hy : y = (k - s) / 2 := by linarith
    rw [hy] at hlinear
    exact Or.inr ⟨by nlinarith [hlinear], hy⟩

set_option maxHeartbeats 400000 in
-- Two affine placement cases exceed the default budget within this single lemma.
/-- The normalized mutual-return configuration has sharp lower-center height.

The affine chart and separator are the same as in
`normalized_mutual_return_false`; the strict hypothesis `1 < h` replaces the
coarser `√3 ≤ h` bound and yields `k < 2 - √3` in the normalized coordinates.
-/
theorem normalized_mutual_return_height_lt
    {A : Finset Plane} (hconv : ConvexIndep A) {q w O c b : Plane}
    (hqA : q ∈ A) (hwA : w ∈ A) (hOA : O ∈ A) (hcA : c ∈ A) (hbA : b ∈ A)
    (hbO : b ≠ O) (hbq : b ≠ q) (hbw : b ≠ w) (hcq : c ≠ q) (hOq : O ≠ q)
    (F : Plane →ᵃ[ℝ] Plane) (hF : Function.Injective F)
    {h k x y s σ : ℝ} (_hσ : σ = 1 ∨ σ = -1)
    (hsq : s ^ 2 = 3) (hs : 0 < s) (hh : 1 < h) (hk : 0 < k) (hk1 : k ≤ 1)
    (hFq : F q = planePoint (-1) 0) (hFw : F w = planePoint 1 0)
    (hFO : F O = planePoint 0 (-σ * h)) (hFc : F c = planePoint 0 (σ * k))
    (hFb : F b = planePoint x (σ * y))
    (heq1 : (x + 1) ^ 2 + y ^ 2 = 1 + k ^ 2)
    (heq2 : x ^ 2 + (y - k) ^ 2 = 1 + k ^ 2)
    (L : Plane →ᵃ[ℝ] ℝ)
    (hLq : 0 < L q) (hLc : 0 < L c) (hLO : L O < 0) (hLb : L b < 0) :
    k < 2 - s := by
  have hs1 : 1 < s := by nlinarith [hsq]
  have hs2 : s < 2 := by nlinarith [hsq]
  rcases equilateral_placements hsq heq1 heq2 with ⟨hx, hy⟩ | ⟨hx, hy⟩
  · exfalso
    rw [hx, hy] at hFb
    exact upper_placement_false hconv hqA hOA hcA hbA hbq hcq hOq F hF
      (lt_trans (by norm_num) hh) hk hs hFq hFO hFc hFb L hLq hLc hLO hLb
  · rw [hx, hy] at hFb
    by_cases hks : 1 / s ≤ k
    · exfalso
      let x := (s * k - 1) / 2
      let δ := (s - k) / (2 * h)
      have hks' : 1 ≤ s * k := by
        have h' := (div_le_iff₀ hs).mp hks
        nlinarith [h']
      have hsklt : k < s := by nlinarith [hs1, hk1]
      have hskle : s * k ≤ s := by
        simpa only [mul_one] using mul_le_mul_of_nonneg_left hk1 hs.le
      have h3sk : 0 < 3 - s * k := by nlinarith [hskle, hs2]
      have hprod : 0 ≤ (s - 1) * (1 - k) :=
        mul_nonneg (by linarith) (by linarith)
      have hdiff : 0 < (3 - s * k) - (s - k) := by
        nlinarith [hprod, hs2]
      have hmul : 3 - s * k < h * (3 - s * k) := by
        simpa only [one_mul] using mul_lt_mul_of_pos_right hh h3sk
      have hdiff' : s - k < 3 - s * k := by linarith
      have hwidth : s - k < h * (3 - s * k) := lt_trans hdiff' hmul
      have hδ : 0 ≤ δ := by
        dsimp [δ]
        exact (div_pos (sub_pos.mpr hsklt) (by positivity)).le
      have hδbound : δ < (3 - s * k) / 2 := by
        dsimp [δ]
        apply (div_lt_iff₀ (by positivity : 0 < 2 * h)).mpr
        nlinarith [hwidth]
      have hδx : δ + x < 1 := by
        dsimp [x]
        nlinarith [hδbound]
      have hδlt : δ < 1 := by
        dsimp [δ]
        apply (div_lt_iff₀ (by positivity : 0 < 2 * h)).mpr
        have hsk2 : s - k < 2 := by linarith
        have h2h : 2 < 2 * h := by
          simpa only [mul_one] using mul_lt_mul_of_pos_left hh (by norm_num : 0 < (2 : ℝ))
        simpa only [one_mul] using lt_trans hsk2 h2h
      have hxnonneg : 0 ≤ x := by
        dsimp [x]
        linarith [hks']
      have hleft : 0 ≤ (1 - δ - x) / 2 := by linarith
      have hright : 0 ≤ (1 - δ + x) / 2 := by linarith
      have hsum : δ + (1 - δ - x) / 2 + (1 - δ + x) / 2 = 1 := by ring
      have hbAffine : b = δ • O + ((1 - δ - x) / 2) • q +
          ((1 - δ + x) / 2) • w := by
        apply hF
        rw [affine_map_three F O q w hsum, hFb, hFO, hFq, hFw]
        ext i
        fin_cases i <;>
          simp [planePoint, PiLp.add_apply, PiLp.smul_apply, x, δ] <;>
          field_simp <;> ring
      exact not_convex_three hconv hbA hOA hqA hwA hbO.symm hbq.symm hbw.symm
        hδ hleft hright hsum hbAffine
    · have hks' : k < 1 / s := lt_of_not_ge hks
      let α := (1 - s * k) / 2
      let β := (h * (1 + s * k) + k - s) / (2 * (h + k))
      let γ := s * (1 + k ^ 2) / (2 * (h + k))
      have hsklt : s * k < 1 := by
        have h' := (lt_div_iff₀ hs).mp hks'
        simpa only [mul_comm] using h'
      have hα : 0 < α := by
        dsimp [α]
        exact div_pos (sub_pos.mpr hsklt) (by norm_num : 0 < (2 : ℝ))
      have hden : 0 < 2 * (h + k) := by positivity
      have hγ : 0 < γ := by
        dsimp [γ]
        exact div_pos (mul_pos hs (by positivity)) hden
      have hsum : α + β + γ = 1 := by
        dsimp [α, β, γ]
        field_simp
        ring
      have hbAffine : b = α • q + β • c + γ • O := by
        apply hF
        rw [affine_map_three F q c O hsum, hFb, hFq, hFc, hFO]
        ext i
        fin_cases i <;>
          simp [planePoint, PiLp.add_apply, PiLp.smul_apply, α, β, γ] <;>
          field_simp <;> ring
      have hβ : β < 0 := by
        by_contra hβnot
        have hβnonneg : 0 ≤ β := le_of_not_gt hβnot
        have hbc : b ≠ c := by
          intro h
          have h' := congrArg (fun z : Plane => z 0) (congrArg F h)
          rw [hFb, hFc] at h'
          simp [planePoint] at h'
          linarith [hsklt]
        exact not_convex_three hconv hbA hqA hcA hOA hbq.symm hbc.symm hbO.symm
          hα.le hβnonneg hγ.le hsum hbAffine
      have hnum : h * (1 + s * k) + k - s < 0 := by
        have hβ' :
            (h * (1 + s * k) + k - s) / (2 * (h + k)) < 0 := by
          simpa only [β] using hβ
        have hnum' := (div_lt_iff₀ hden).mp hβ'
        simpa only [zero_mul] using hnum'
      have hineq : h + (s * h + 1) * k < s := by
        have hnum' : h * (1 + s * k) + k < s := by
          linarith only [hnum]
        calc
          h + (s * h + 1) * k = h * (1 + s * k) + k := by ring
          _ < s := hnum'
      by_contra hnot
      have hkge : 2 - s ≤ k := le_of_not_gt hnot
      have hcoef : 0 ≤ s * h + 1 := by positivity
      have hdiff_nonneg : 0 ≤ k - (2 - s) := by linarith
      have hprod₁ : 0 ≤ (s * h + 1) * (k - (2 - s)) :=
        mul_nonneg hcoef hdiff_nonneg
      have hprod₂ : 0 ≤ s * (h - 1) * (2 - s) := by
        have hfirst : 0 ≤ s * (h - 1) :=
          mul_nonneg hs.le (sub_nonneg.mpr hh.le)
        exact mul_nonneg hfirst (sub_nonneg.mpr hs2.le)
      have hmul : (s + 1) * (2 - s) ≤ (s * h + 1) * k := by
        nlinarith only [hprod₁, hprod₂]
      nlinarith only [hineq, hmul, hsq, hh]

/-- The normalized mutual-return configuration is impossible when `h ≥ √3`.

The affine chart records the two endpoints, the two circle centers, and the
equilateral return point. The separator puts `q,c` on its positive side and
`O,b` on its negative side. The upper placement contradicts this separation
or convex independence; the lower placement is a convex combination of `O,q,w`.
The sign parameter retains either reflection of the physical chart.

This is the normalized geometric contradiction from §3 of
`docs/audits/2026-09-06-exactfive-mutual-return-chord.md`. Its physical consumer
must supply the coordinate identities, equilateral equations, and separator;
it does not assert unconditional physical closure.
-/
theorem normalized_mutual_return_false
    {A : Finset Plane} (hconv : ConvexIndep A) {q w O c b : Plane}
    (hqA : q ∈ A) (hwA : w ∈ A) (hOA : O ∈ A) (hcA : c ∈ A) (hbA : b ∈ A)
    (hbO : b ≠ O) (hbq : b ≠ q) (hbw : b ≠ w) (hcq : c ≠ q) (hOq : O ≠ q)
    (F : Plane →ᵃ[ℝ] Plane) (hF : Function.Injective F)
    {h k x y s σ : ℝ} (_hσ : σ = 1 ∨ σ = -1)
    (hsq : s ^ 2 = 3) (hs : 0 < s) (hsh : s ≤ h) (hk : 0 < k) (hk1 : k ≤ 1)
    (hFq : F q = planePoint (-1) 0) (hFw : F w = planePoint 1 0)
    (hFO : F O = planePoint 0 (-σ * h)) (hFc : F c = planePoint 0 (σ * k))
    (hFb : F b = planePoint x (σ * y))
    (heq1 : (x + 1) ^ 2 + y ^ 2 = 1 + k ^ 2)
    (heq2 : x ^ 2 + (y - k) ^ 2 = 1 + k ^ 2)
    (L : Plane →ᵃ[ℝ] ℝ)
    (hLq : 0 < L q) (hLc : 0 < L c) (hLO : L O < 0) (hLb : L b < 0) : False := by
  rcases equilateral_placements hsq heq1 heq2 with ⟨hx, hy⟩ | ⟨hx, hy⟩
  · rw [hx, hy] at hFb
    exact upper_placement_false hconv hqA hOA hcA hbA hbq hcq hOq F hF
      (lt_of_lt_of_le hs hsh) hk hs hFq hFO hFc hFb L hLq hLc hLO hLb
  · rw [hx, hy] at hFb
    exact lower_placement_false hconv hqA hwA hOA hbA hbO hbq hbw F hF
      hsq hs hsh hk hk1 hFq hFw hFO hFb

end Problem97.ExactFiveMutualReturnChord
