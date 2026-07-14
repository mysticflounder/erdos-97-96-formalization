import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Five-row metric core for the ATAIL-FORCE lane

This unimported scratch file isolates the real-algebraic obstruction found by
the five-row CEGAR core

* `1 : {0,2,5,6}`;
* `2 : {0,1,9,10}`;
* `6 : {1,2,8,11}`;
* `9 : {0,4,8,10}`;
* `10 : {1,6,7,8}`.

The one-use leaves `4,5,7,11` contribute no equation after choosing a base
distance in their row.  The remaining eleven squared-distance equalities are
exactly the hypotheses of `normalized_fiveRow_metric_core_false`.

This file is intentionally not imported by the project.  It is a kernel-checked
research artifact, not yet a claim that the finite ATAIL producer emits this
core.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailForce
namespace FiveRowMetricCore

open Census554.EqualityCore

/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/
private theorem fiveRow_dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

set_option maxHeartbeats 2000000 in
/-- The normalized eleven-equation CEGAR core has no real solution.

The coordinates are
`P₀=(0,0)`, `P₁=(1,0)`, `P₂=(a,b)`, `P₆=(c,d)`,
`P₈=(e,f)`, `P₉=(g,h)`, and `P₁₀=(i,j)`.
-/
theorem normalized_fiveRow_metric_core_false
    {a b c d e f g h i j : ℝ}
    (h12 : -a ^ 2 + 2 * a - b ^ 2 = 0)
    (h16 : -c ^ 2 + 2 * c - d ^ 2 = 0)
    (h201 : 2 * a - 1 = 0)
    (h209 : 2 * a * g + 2 * b * h - g ^ 2 - h ^ 2 = 0)
    (h20t : 2 * a * i + 2 * b * j - i ^ 2 - j ^ 2 = 0)
    (h612 : -a ^ 2 + 2 * a * c - b ^ 2 + 2 * b * d - 2 * c + 1 = 0)
    (h618 : 2 * c * e - 2 * c + 2 * d * f - e ^ 2 - f ^ 2 + 1 = 0)
    (h908 : -e ^ 2 + 2 * e * g - f ^ 2 + 2 * f * h = 0)
    (h90t : 2 * g * i + 2 * h * j - i ^ 2 - j ^ 2 = 0)
    (ht16 : -c ^ 2 + 2 * c * i - d ^ 2 + 2 * d * j - 2 * i + 1 = 0)
    (ht18 : -e ^ 2 + 2 * e * i - f ^ 2 + 2 * f * j - 2 * i + 1 = 0) :
    False := by
  have ha : a = 1 / 2 := by linarith [h201]
  have hb2 : b ^ 2 = 3 / 4 := by
    rw [ha] at h12
    norm_num at h12 ⊢
    linarith
  have hc : c = 2 * b * d := by
    rw [ha, hb2] at h612
    norm_num at h612 ⊢
    linarith
  have hdprod : d * (d - b) = 0 := by
    rw [hc] at h16
    ring_nf at h16
    rw [hb2] at h16
    norm_num at h16
    linear_combination -(1 / 4) * h16
  rcases mul_eq_zero.mp hdprod with hd | hdb
  · have hc0 : c = 0 := by rw [hd] at hc; norm_num at hc ⊢; exact hc
    have hi : i = 1 / 2 := by
      rw [hc0, hd] at ht16
      norm_num at ht16 ⊢
      linarith
    have hjquad : (j - b) ^ 2 = 1 := by
      rw [ha, hi] at h20t
      nlinarith [hb2]
    let s : ℝ := j - b
    have hs : s ^ 2 = 1 := by simpa [s] using hjquad
    have hj : j = b + s := by simp [s]
    have hsne : s ≠ 0 := by
      intro hs0
      rw [hs0] at hs
      norm_num at hs
    have hbsne : b + s ≠ 0 := by
      intro hzero
      have hbneg : b = -s := by linarith
      rw [hbneg] at hb2
      nlinarith [hb2, hs]
    have honebsne : 1 + b * s ≠ 0 := by
      intro hzero
      have hbs : b * s = -1 := by linarith
      have hsq := congrArg (fun x : ℝ => x ^ 2) hbs
      ring_nf at hsq
      rw [hb2, hs] at hsq
      norm_num at hsq
    have hEcirc : e ^ 2 + f ^ 2 = 1 := by
      rw [hc0, hd] at h618
      norm_num at h618 ⊢
      linarith
    have hEline : e + 2 * j * f = 1 := by
      rw [hi] at ht18
      linear_combination ht18 + hEcirc
    have hEfactor : f * ((4 * j ^ 2 + 1) * f - 4 * j) = 0 := by
      linear_combination hEcirc + (2 * j * f - e - 1) * hEline
    rcases mul_eq_zero.mp hEfactor with hf | hfactor
    · have he : e = 1 := by rw [hf] at hEline; norm_num at hEline ⊢; exact hEline
      have hg : g = 1 / 2 := by
        rw [he, hf] at h908
        norm_num at h908 ⊢
        linarith
      have h20t' := h20t
      rw [ha, hi] at h20t'
      have hhprod : j * (h - b) = 0 := by
        rw [hi, hg] at h90t
        linear_combination (1 / 2) * h90t - (1 / 2) * h20t'
      have hjne : j ≠ 0 := by simpa [hj] using hbsne
      have hh : h = b := by
        exact sub_eq_zero.mp ((mul_eq_zero.mp hhprod).resolve_left hjne)
      rw [ha, hg, hh] at h209
      nlinarith [hb2, h209]
    · have hcand : (4 * j ^ 2 + 1) * (s / 2) = 4 * j := by
        rw [hj]
        linear_combination 2 * s * hb2 + (4 * b + 2 * s) * hs
      have hfmul : (4 * j ^ 2 + 1) * (f - s / 2) = 0 := by
        linear_combination hfactor - hcand
      have hcoeffne : 4 * j ^ 2 + 1 ≠ 0 := by nlinarith [sq_nonneg j]
      have hf : f = s / 2 := by
        exact sub_eq_zero.mp ((mul_eq_zero.mp hfmul).resolve_left hcoeffne)
      have he : e = -b * s := by
        rw [hf, hj] at hEline
        nlinarith [hs, hEline]
      have hhprod : s * (h - s - 2 * b * g) = 0 := by
        rw [he, hf] at h908
        linear_combination h908 + s ^ 2 * hb2
      have hh : h = s + 2 * b * g := by
        have := sub_eq_zero.mp ((mul_eq_zero.mp hhprod).resolve_left hsne)
        linarith
      have hgprod : (1 + b * s) * g = 0 := by
        rw [hi, hj, hh] at h90t
        linear_combination (1 / 4) * h90t - (g - 1 / 4) * hb2 - (1 / 4) * hs
      have hg : g = 0 := (mul_eq_zero.mp hgprod).resolve_left honebsne
      have hh0 : h = s := by rw [hh, hg]; ring
      rw [ha, hg, hh0] at h209
      have hbs : 2 * b * s = 1 := by nlinarith [h209]
      have hsq := congrArg (fun x : ℝ => x ^ 2) hbs
      ring_nf at hsq
      rw [hb2, hs] at hsq
      norm_num at hsq
  · have hd : d = b := by linarith
    have hc3 : c = 3 / 2 := by
      rw [hd] at hc
      nlinarith [hc, hb2]
    have hit : i + 2 * b * j = 2 := by
      have ht16' := ht16
      rw [hc3, hd] at ht16'
      linear_combination ht16' + hb2
    have hnorm : i ^ 2 + j ^ 2 = 2 := by
      have h20t' := h20t
      rw [ha] at h20t'
      linear_combination -h20t' + hit
    have hi0 : i = 2 - 2 * b * j := by linarith [hit]
    have hb2j2 : b ^ 2 * j ^ 2 = (3 / 4) * j ^ 2 := by rw [hb2]
    have hjquad : (j - b) ^ 2 = 1 / 4 := by
      rw [hi0] at hnorm
      nlinarith [hnorm, hb2, hb2j2]
    let s : ℝ := 2 * (j - b)
    have hs : s ^ 2 = 1 := by
      dsimp [s]
      nlinarith [hjquad]
    have hj : j = b + s / 2 := by simp [s]
    have hi : i = 1 / 2 - b * s := by
      rw [hj] at hit
      nlinarith [hit, hb2]
    have hsne : s ≠ 0 := by
      intro hs0
      rw [hs0] at hs
      norm_num at hs
    let k : ℝ := 1 + b * s
    have hkne : k ≠ 0 := by
      intro hk0
      have hbs : b * s = -1 := by simpa [k] using (show b * s = -1 by
        dsimp [k] at hk0
        linarith)
      have hsq := congrArg (fun x : ℝ => x ^ 2) hbs
      ring_nf at hsq
      rw [hb2, hs] at hsq
      norm_num at hsq
    have hjne : j ≠ 0 := by
      intro hj0
      have hbval : b = -s / 2 := by rw [hj] at hj0; linarith
      rw [hbval] at hb2
      nlinarith [hb2, hs]
    have hbsne : b + s ≠ 0 := by
      intro hzero
      have hbval : b = -s := by linarith
      rw [hbval] at hb2
      nlinarith [hb2, hs]
    have htwobsne : 2 * b + s ≠ 0 := by
      intro hzero
      have hbval : b = -s / 2 := by linarith
      rw [hbval] at hb2
      nlinarith [hb2, hs]
    let X : ℝ := e - 1
    have hC : X ^ 2 - X + f ^ 2 - 2 * b * f = 0 := by
      have h618' := h618
      rw [hc3, hd] at h618'
      dsimp [X]
      linear_combination -h618'
    have hL : 2 * k * X - s * f = 0 := by
      have h618' := h618
      have ht18' := ht18
      rw [hc3, hd] at h618'
      rw [hi, hj] at ht18'
      dsimp [k, X]
      linear_combination h618' - ht18'
    have hR :
        s ^ 2 * f ^ 2 + 4 * k ^ 2 * f ^ 2 - 2 * s * k * f -
            8 * b * k ^ 2 * f = 0 := by
      linear_combination
        4 * k ^ 2 * hC +
          (-(2 * k * X - s * f) - 2 * (s * f - k)) * hL
    have hkfactor : k * (f * (f - b - s)) = 0 := by
      have heigth : 8 * k * f * (f - b - s) = 0 := by
        linear_combination
          hR - (4 * s ^ 2 * f ^ 2 - 8 * s * k * f) * hb2 -
            4 * f ^ 2 * hs
      linear_combination (1 / 8) * heigth
    have hffactor : f * (f - b - s) = 0 :=
      (mul_eq_zero.mp hkfactor).resolve_left hkne
    rcases mul_eq_zero.mp hffactor with hf | hfbs
    · have hL0 := hL
      rw [hf] at hL0
      have hkX : k * X = 0 := by
        linear_combination (1 / 2) * hL0
      have hX : X = 0 := (mul_eq_zero.mp hkX).resolve_left hkne
      have he : e = 1 := by dsimp [X] at hX; linarith
      have hg : g = 1 / 2 := by
        rw [he, hf] at h908
        norm_num at h908 ⊢
        linarith
      have h20t' := h20t
      have h90t' := h90t
      rw [ha] at h20t'
      rw [hg] at h90t'
      have hhprod : j * (h - b) = 0 := by
        linear_combination (1 / 2) * h90t' - (1 / 2) * h20t'
      have hh : h = b :=
        sub_eq_zero.mp ((mul_eq_zero.mp hhprod).resolve_left hjne)
      rw [ha, hg, hh] at h209
      nlinarith [hb2, h209]
    · have hf : f = b + s := by linarith
      have hXprod : k * (2 * X - 1) = 0 := by
        rw [hf] at hL
        linear_combination hL + hs
      have hXlin : 2 * X - 1 = 0 :=
        (mul_eq_zero.mp hXprod).resolve_left hkne
      have he : e = 3 / 2 := by dsimp [X] at hXlin; linarith
      have hA : 3 * g + 2 * (b + s) * h = 4 + 2 * b * s := by
        have h908' := h908
        rw [he, hf] at h908'
        linear_combination h908' + hb2 + hs
      have hB : 2 * i * g + 2 * j * h = i + 2 * b * j := by
        have h20t' := h20t
        rw [ha] at h20t'
        linear_combination h90t - h20t'
      have hBred :
          (1 - 2 * b * s) * g + (2 * b + s) * h - 2 = 0 := by
        rw [hi, hj] at hB
        linear_combination
          hB + 2 * hb2
      have hhprod : (2 * b + s) * (h - (b + s) / 2) = 0 := by
        linear_combination
          (3 / 4) * hBred - ((1 - 2 * b * s) / 4) * hA -
            s * h * hb2 - (b * h + 1 / 2 - b ^ 2) * hs
      have hh : h = (b + s) / 2 :=
        sub_eq_zero.mp ((mul_eq_zero.mp hhprod).resolve_left htwobsne)
      have hg : g = 3 / 4 := by
        rw [hh] at hA
        linear_combination (1 / 3) * hA - (1 / 3) * hb2 - (1 / 3) * hs
      have hkzero : k = 0 := by
        rw [ha, hg, hh] at h209
        linear_combination 2 * h209 - (3 / 2) * hb2 + (1 / 2) * hs
      exact hkne hkzero

set_option maxHeartbeats 2000000 in
/-- Metric form of the normalized core.  This is the bridge from the eleven
distance equalities to the scalar theorem above. -/
theorem normalized_fiveRow_metric_core_points_false
    {P₂ P₆ P₈ P₉ P₁₀ : ℝ²}
    (h102 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P₂)
    (h106 : dist (pt 1 0) (pt 0 0) = dist (pt 1 0) P₆)
    (h201 : dist P₂ (pt 0 0) = dist P₂ (pt 1 0))
    (h209 : dist P₂ (pt 0 0) = dist P₂ P₉)
    (h20t : dist P₂ (pt 0 0) = dist P₂ P₁₀)
    (h612 : dist P₆ (pt 1 0) = dist P₆ P₂)
    (h618 : dist P₆ (pt 1 0) = dist P₆ P₈)
    (h908 : dist P₉ (pt 0 0) = dist P₉ P₈)
    (h90t : dist P₉ (pt 0 0) = dist P₉ P₁₀)
    (ht16 : dist P₁₀ (pt 1 0) = dist P₁₀ P₆)
    (ht18 : dist P₁₀ (pt 1 0) = dist P₁₀ P₈) : False := by
  have h102sq := congrArg (fun r : ℝ => r ^ 2) h102
  have h106sq := congrArg (fun r : ℝ => r ^ 2) h106
  have h201sq := congrArg (fun r : ℝ => r ^ 2) h201
  have h209sq := congrArg (fun r : ℝ => r ^ 2) h209
  have h20tsq := congrArg (fun r : ℝ => r ^ 2) h20t
  have h612sq := congrArg (fun r : ℝ => r ^ 2) h612
  have h618sq := congrArg (fun r : ℝ => r ^ 2) h618
  have h908sq := congrArg (fun r : ℝ => r ^ 2) h908
  have h90tsq := congrArg (fun r : ℝ => r ^ 2) h90t
  have ht16sq := congrArg (fun r : ℝ => r ^ 2) ht16
  have ht18sq := congrArg (fun r : ℝ => r ^ 2) ht18
  dsimp only at h102sq h106sq h201sq h209sq h20tsq h612sq h618sq h908sq h90tsq ht16sq ht18sq
  rw [fiveRow_dist_sq_coord, fiveRow_dist_sq_coord] at h102sq h106sq
  rw [fiveRow_dist_sq_coord, fiveRow_dist_sq_coord] at h201sq h209sq h20tsq
  rw [fiveRow_dist_sq_coord, fiveRow_dist_sq_coord] at h612sq h618sq
  rw [fiveRow_dist_sq_coord, fiveRow_dist_sq_coord] at h908sq h90tsq
  rw [fiveRow_dist_sq_coord, fiveRow_dist_sq_coord] at ht16sq ht18sq
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at h102sq h106sq h201sq h209sq h20tsq h612sq h618sq h908sq h90tsq ht16sq ht18sq
  apply normalized_fiveRow_metric_core_false
      (a := P₂ 0) (b := P₂ 1) (c := P₆ 0) (d := P₆ 1)
      (e := P₈ 0) (f := P₈ 1) (g := P₉ 0) (h := P₉ 1)
      (i := P₁₀ 0) (j := P₁₀ 1)
  · linear_combination h102sq
  · linear_combination h106sq
  · linear_combination h201sq
  · linear_combination h209sq
  · linear_combination h20tsq
  · linear_combination h612sq
  · linear_combination h618sq
  · linear_combination h908sq
  · linear_combination h90tsq
  · linear_combination ht16sq
  · linear_combination ht18sq

set_option maxHeartbeats 2000000 in
/-- Invariant geometric consequence of the five-row metric core: labels `0`
and `1` must denote the same real plane point. -/
theorem fiveRow_metric_core_collision
    {P₀ P₁ P₂ P₆ P₈ P₉ P₁₀ : ℝ²}
    (h102 : dist P₁ P₀ = dist P₁ P₂)
    (h106 : dist P₁ P₀ = dist P₁ P₆)
    (h201 : dist P₂ P₀ = dist P₂ P₁)
    (h209 : dist P₂ P₀ = dist P₂ P₉)
    (h20t : dist P₂ P₀ = dist P₂ P₁₀)
    (h612 : dist P₆ P₁ = dist P₆ P₂)
    (h618 : dist P₆ P₁ = dist P₆ P₈)
    (h908 : dist P₉ P₀ = dist P₉ P₈)
    (h90t : dist P₉ P₀ = dist P₉ P₁₀)
    (ht16 : dist P₁₀ P₁ = dist P₁₀ P₆)
    (ht18 : dist P₁₀ P₁ = dist P₁₀ P₈) : P₀ = P₁ := by
  by_contra h01
  let T : ℝ² → ℝ² := normSim P₀ P₁
  have hdist (X Y : ℝ²) :
      dist (T X) (T Y) = (dist P₀ P₁)⁻¹ * dist X Y := by
    simpa [T] using normSim_dist_image P₀ P₁ h01 X Y
  have hT0 : T P₀ = pt 0 0 := by simpa [T] using normSim_fst P₀ P₁
  have hT1 : T P₁ = pt 1 0 := by simpa [T] using normSim_snd P₀ P₁ h01
  have mapEq {A B C D : ℝ²} (h : dist A B = dist C D) :
      dist (T A) (T B) = dist (T C) (T D) := by
    rw [hdist, hdist, h]
  apply normalized_fiveRow_metric_core_points_false
      (P₂ := T P₂) (P₆ := T P₆) (P₈ := T P₈)
      (P₉ := T P₉) (P₁₀ := T P₁₀)
  · simpa only [hT0, hT1] using mapEq h102
  · simpa only [hT0, hT1] using mapEq h106
  · simpa only [hT0, hT1] using mapEq h201
  · simpa only [hT0, hT1] using mapEq h209
  · simpa only [hT0, hT1] using mapEq h20t
  · simpa only [hT0, hT1] using mapEq h612
  · simpa only [hT0, hT1] using mapEq h618
  · simpa only [hT0, hT1] using mapEq h908
  · simpa only [hT0, hT1] using mapEq h90t
  · simpa only [hT0, hT1] using mapEq ht16
  · simpa only [hT0, hT1] using mapEq ht18

/-- Five selected four-classes with the CEGAR incidence pattern are already
inconsistent.  This is the Lean-facing bridge for the live counterexample
vocabulary: exactness of the rows is unnecessary, and the only producer
content left is the displayed support incidence. -/
theorem false_of_five_selectedFourClasses
    {A : Finset ℝ²} {P₀ P₁ P₂ P₆ P₈ P₉ P₁₀ : ℝ²}
    (h01 : P₀ ≠ P₁)
    (K₁ : SelectedFourClass A P₁)
    (K₂ : SelectedFourClass A P₂)
    (K₆ : SelectedFourClass A P₆)
    (K₉ : SelectedFourClass A P₉)
    (K₁₀ : SelectedFourClass A P₁₀)
    (h10 : P₀ ∈ K₁.support) (h12 : P₂ ∈ K₁.support)
    (h16 : P₆ ∈ K₁.support)
    (h20 : P₀ ∈ K₂.support) (h21 : P₁ ∈ K₂.support)
    (h29 : P₉ ∈ K₂.support) (h2t : P₁₀ ∈ K₂.support)
    (h61 : P₁ ∈ K₆.support) (h62 : P₂ ∈ K₆.support)
    (h68 : P₈ ∈ K₆.support)
    (h90 : P₀ ∈ K₉.support) (h98 : P₈ ∈ K₉.support)
    (h9t : P₁₀ ∈ K₉.support)
    (ht1 : P₁ ∈ K₁₀.support) (ht6 : P₆ ∈ K₁₀.support)
    (ht8 : P₈ ∈ K₁₀.support) :
    False := by
  apply h01
  apply fiveRow_metric_core_collision
  · exact (K₁.support_eq_radius P₀ h10).trans
      (K₁.support_eq_radius P₂ h12).symm
  · exact (K₁.support_eq_radius P₀ h10).trans
      (K₁.support_eq_radius P₆ h16).symm
  · exact (K₂.support_eq_radius P₀ h20).trans
      (K₂.support_eq_radius P₁ h21).symm
  · exact (K₂.support_eq_radius P₀ h20).trans
      (K₂.support_eq_radius P₉ h29).symm
  · exact (K₂.support_eq_radius P₀ h20).trans
      (K₂.support_eq_radius P₁₀ h2t).symm
  · exact (K₆.support_eq_radius P₁ h61).trans
      (K₆.support_eq_radius P₂ h62).symm
  · exact (K₆.support_eq_radius P₁ h61).trans
      (K₆.support_eq_radius P₈ h68).symm
  · exact (K₉.support_eq_radius P₀ h90).trans
      (K₉.support_eq_radius P₈ h98).symm
  · exact (K₉.support_eq_radius P₀ h90).trans
      (K₉.support_eq_radius P₁₀ h9t).symm
  · exact (K₁₀.support_eq_radius P₁ ht1).trans
      (K₁₀.support_eq_radius P₆ ht6).symm
  · exact (K₁₀.support_eq_radius P₁ ht1).trans
      (K₁₀.support_eq_radius P₈ ht8).symm

/-- Equality-closure packaging of the five-row metric core.  The four omitted
one-use leaves do not occur because their row equalities are redundant for this
collision consumer. -/
structure FiveRowCollisionCore {alpha : Type*} (P : RowPattern alpha) where
  p0 : alpha
  p1 : alpha
  p2 : alpha
  p6 : alpha
  p8 : alpha
  p9 : alpha
  p10 : alpha
  h01 : p0 ≠ p1
  h102 : EdgeClosure P (p1, p0) (p1, p2)
  h106 : EdgeClosure P (p1, p0) (p1, p6)
  h201 : EdgeClosure P (p2, p0) (p2, p1)
  h209 : EdgeClosure P (p2, p0) (p2, p9)
  h20t : EdgeClosure P (p2, p0) (p2, p10)
  h612 : EdgeClosure P (p6, p1) (p6, p2)
  h618 : EdgeClosure P (p6, p1) (p6, p8)
  h908 : EdgeClosure P (p9, p0) (p9, p8)
  h90t : EdgeClosure P (p9, p0) (p9, p10)
  ht16 : EdgeClosure P (p10, p1) (p10, p6)
  ht18 : EdgeClosure P (p10, p1) (p10, p8)

/-- A five-row collision core has no injective real-plane realization. -/
theorem not_realizes_of_fiveRowCollisionCore
    {alpha : Type*} {P : RowPattern alpha} (core : FiveRowCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {u v : Edge alpha} (h : EdgeClosure P u v) :
      edgeDist pointOf u = edgeDist pointOf v := EdgeClosure.sound hreal h
  have hcollision : pointOf core.p0 = pointOf core.p1 :=
    fiveRow_metric_core_collision
      (by simpa [edgeDist] using sound core.h102)
      (by simpa [edgeDist] using sound core.h106)
      (by simpa [edgeDist] using sound core.h201)
      (by simpa [edgeDist] using sound core.h209)
      (by simpa [edgeDist] using sound core.h20t)
      (by simpa [edgeDist] using sound core.h612)
      (by simpa [edgeDist] using sound core.h618)
      (by simpa [edgeDist] using sound core.h908)
      (by simpa [edgeDist] using sound core.h90t)
      (by simpa [edgeDist] using sound core.ht16)
      (by simpa [edgeDist] using sound core.ht18)
  exact core.h01 (hreal.injective hcollision)

#print axioms normalized_fiveRow_metric_core_false
#print axioms normalized_fiveRow_metric_core_points_false
#print axioms fiveRow_metric_core_collision
#print axioms false_of_five_selectedFourClasses
#print axioms not_realizes_of_fiveRowCollisionCore

end FiveRowMetricCore
end ATailForce
end Problem97
