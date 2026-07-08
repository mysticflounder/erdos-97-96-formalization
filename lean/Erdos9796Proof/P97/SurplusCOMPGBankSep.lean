/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBank
import Erdos9796Proof.P97.ArcBlockContiguity

/-!
# Separation producer core for surplus COMP-G shadows

This module contains the geometric SEP fact needed by the erased-pin row
producer: two distinct shared same-radius points for two centers lie on
opposite sides of the center chord.  The last lemma connects that geometric
`btw` alternation to the generated Boolean `separated` checker.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCOMPGBank

/-- Coordinate expansion of squared distance on `ℝ²`. -/
theorem dist_sq_coord (x c : ℝ²) :
    dist x c ^ 2 = (x 0 - c 0) ^ 2 + (x 1 - c 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

/-- Chord separation of shared equidistant points.  If `x` and `y` are both
equidistant from `c` and from `d`, then their signed areas against the chord
`(c,d)` are negatives. -/
theorem sep_signedArea2 (x y c d : ℝ²)
    (hxc : dist x c = dist y c) (hxd : dist x d = dist y d)
    (hxy : x ≠ y) :
    Problem97.signedArea2 x c d = -Problem97.signedArea2 y c d := by
  have Hc : (x 0 - c 0) ^ 2 + (x 1 - c 1) ^ 2
      = (y 0 - c 0) ^ 2 + (y 1 - c 1) ^ 2 := by
    have h : dist x c ^ 2 = dist y c ^ 2 := by rw [hxc]
    rw [dist_sq_coord, dist_sq_coord] at h
    exact h
  have Hd : (x 0 - d 0) ^ 2 + (x 1 - d 1) ^ 2
      = (y 0 - d 0) ^ 2 + (y 1 - d 1) ^ 2 := by
    have h : dist x d ^ 2 = dist y d ^ 2 := by rw [hxd]
    rw [dist_sq_coord, dist_sq_coord] at h
    exact h
  have hnp : (y 0 - x 0) * (c 0 - (x 0 + y 0) / 2)
      + (y 1 - x 1) * (c 1 - (x 1 + y 1) / 2) = 0 := by
    linear_combination Hc / 2
  have hnq : (y 0 - x 0) * (d 0 - (x 0 + y 0) / 2)
      + (y 1 - x 1) * (d 1 - (x 1 + y 1) / 2) = 0 := by
    linear_combination Hd / 2
  have key : ((y 0 - x 0) ^ 2 + (y 1 - x 1) ^ 2)
      * (Problem97.signedArea2 x c d + Problem97.signedArea2 y c d) = 0 := by
    simp only [Problem97.signedArea2]
    linear_combination
      (2 * ((y 0 - x 0) * (d 1 - (x 1 + y 1) / 2)
          - (y 1 - x 1) * (d 0 - (x 0 + y 0) / 2))) * hnp
      - (2 * ((y 0 - x 0) * (c 1 - (x 1 + y 1) / 2)
          - (y 1 - x 1) * (c 0 - (x 0 + y 0) / 2))) * hnq
  have hpos : 0 < (y 0 - x 0) ^ 2 + (y 1 - x 1) ^ 2 := by
    have hcoord : x 0 ≠ y 0 ∨ x 1 ≠ y 1 := by
      by_contra h
      push_neg at h
      exact hxy (by
        ext i
        fin_cases i <;> simp [h.1, h.2])
    rcases hcoord with h0 | h1
    · have : 0 < (y 0 - x 0) ^ 2 := by
        have : y 0 - x 0 ≠ 0 := sub_ne_zero.mpr (Ne.symm h0)
        positivity
      nlinarith [sq_nonneg (y 1 - x 1)]
    · have : 0 < (y 1 - x 1) ^ 2 := by
        have : y 1 - x 1 ≠ 0 := sub_ne_zero.mpr (Ne.symm h1)
        positivity
      nlinarith [sq_nonneg (y 0 - x 0)]
  have hsum :
      Problem97.signedArea2 x c d + Problem97.signedArea2 y c d = 0 := by
    rcases mul_eq_zero.mp key with h | h
    · exact absurd h (ne_of_gt hpos)
    · exact h
  linarith [hsum]

/-- Strict linear betweenness on the normalized ten-label hull order. -/
def btw (i j k : Fin 10) : Prop :=
  (i < k ∧ k < j) ∨ (j < k ∧ k < i)

instance (i j k : Fin 10) : Decidable (btw i j k) := by
  unfold btw
  infer_instance

/-- No point is strictly between an endpoint and itself. -/
theorem not_btw_same (i k : Fin 10) : ¬ btw i i k := by
  unfold btw
  rintro (⟨h1, h2⟩ | ⟨h1, h2⟩)
  · exact (not_lt_of_ge (le_of_lt h1)) h2
  · exact (not_lt_of_ge (le_of_lt h1)) h2

/-- SEP as `btw` alternation in a CCW convex ten-point enumeration. -/
theorem btw_sep {ψ : Fin 10 → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon ψ)
    (hinj : Function.Injective ψ)
    {i j a b : Fin 10} (hij : i ≠ j)
    (hbi : b ≠ i) (hbj : b ≠ j)
    (hci : dist (ψ a) (ψ i) = dist (ψ b) (ψ i))
    (hcj : dist (ψ a) (ψ j) = dist (ψ b) (ψ j))
    (habne : ψ a ≠ ψ b) :
    (btw i j a ↔ ¬ btw i j b) := by
  rcases lt_or_gt_of_ne hij with hlt | hgt
  · have hseq :
        Problem97.signedArea2 (ψ a) (ψ i) (ψ j) =
          -Problem97.signedArea2 (ψ b) (ψ i) (ψ j) :=
      sep_signedArea2 (ψ a) (ψ b) (ψ i) (ψ j) hci hcj habne
    obtain ⟨hpa, _hza, _⟩ := signedArea2_trichotomy hccw hinj hlt a
    obtain ⟨hpb, hzb, _⟩ := signedArea2_trichotomy hccw hinj hlt b
    have hsab_ne :
        Problem97.signedArea2 (ψ b) (ψ i) (ψ j) ≠ 0 := by
      intro h
      rcases hzb.mp h with h' | h'
      · exact hbi h'
      · exact hbj h'
    have hbtwa :
        btw i j a ↔ 0 < Problem97.signedArea2 (ψ a) (ψ i) (ψ j) := by
      rw [hpa]
      unfold btw
      exact
        ⟨fun h => h.elim id (fun ⟨h1, _h2⟩ => absurd h1 (by omega)),
          Or.inl⟩
    have hbtwb :
        btw i j b ↔ 0 < Problem97.signedArea2 (ψ b) (ψ i) (ψ j) := by
      rw [hpb]
      unfold btw
      exact
        ⟨fun h => h.elim id (fun ⟨h1, _h2⟩ => absurd h1 (by omega)),
          Or.inl⟩
    rw [hbtwa, hbtwb, hseq]
    constructor
    · intro h
      linarith
    · intro h
      have hle : Problem97.signedArea2 (ψ b) (ψ i) (ψ j) ≤ 0 :=
        not_lt.mp h
      have : Problem97.signedArea2 (ψ b) (ψ i) (ψ j) < 0 :=
        lt_of_le_of_ne hle hsab_ne
      linarith
  · have hseq :
        Problem97.signedArea2 (ψ a) (ψ j) (ψ i) =
          -Problem97.signedArea2 (ψ b) (ψ j) (ψ i) :=
      sep_signedArea2 (ψ a) (ψ b) (ψ j) (ψ i) hcj hci habne
    obtain ⟨hpa, _hza, _⟩ := signedArea2_trichotomy hccw hinj hgt a
    obtain ⟨hpb, hzb, _⟩ := signedArea2_trichotomy hccw hinj hgt b
    have hsab_ne :
        Problem97.signedArea2 (ψ b) (ψ j) (ψ i) ≠ 0 := by
      intro h
      rcases hzb.mp h with h' | h'
      · exact hbj h'
      · exact hbi h'
    have hbtwa :
        btw i j a ↔ 0 < Problem97.signedArea2 (ψ a) (ψ j) (ψ i) := by
      rw [hpa]
      unfold btw
      exact
        ⟨fun h => h.elim (fun ⟨h1, _h2⟩ => absurd h1 (by omega)) id,
          Or.inr⟩
    have hbtwb :
        btw i j b ↔ 0 < Problem97.signedArea2 (ψ b) (ψ j) (ψ i) := by
      rw [hpb]
      unfold btw
      exact
        ⟨fun h => h.elim (fun ⟨h1, _h2⟩ => absurd h1 (by omega)) id,
          Or.inr⟩
    rw [hbtwa, hbtwb, hseq]
    constructor
    · intro h
      linarith
    · intro h
      have hle : Problem97.signedArea2 (ψ b) (ψ j) (ψ i) ≤ 0 :=
        not_lt.mp h
      have : Problem97.signedArea2 (ψ b) (ψ j) (ψ i) < 0 :=
        lt_of_le_of_ne hle hsab_ne
      linarith

/-- Translate a generated label into the normalized hull-order index used by
the finite separation checker. -/
def hullFin : Label → Fin 10
  | .u => 0
  | .Q1 => 1
  | .Q2 => 2
  | .v => 3
  | .s1 => 4
  | .s2 => 5
  | .s3 => 6
  | .w => 7
  | .Pw => 8
  | .Pu => 9

/-- Translate a normalized hull-order index back to its generated label. -/
def labelOfHullFin : Fin 10 → Label
  | ⟨0, _⟩ => .u
  | ⟨1, _⟩ => .Q1
  | ⟨2, _⟩ => .Q2
  | ⟨3, _⟩ => .v
  | ⟨4, _⟩ => .s1
  | ⟨5, _⟩ => .s2
  | ⟨6, _⟩ => .s3
  | ⟨7, _⟩ => .w
  | ⟨8, _⟩ => .Pw
  | ⟨9, _⟩ => .Pu
  | ⟨n + 10, h⟩ => by omega

@[simp] theorem labelOfHullFin_hullFin (label : Label) :
    labelOfHullFin (hullFin label) = label := by
  cases label <;> rfl

@[simp] theorem hullFin_labelOfHullFin (i : Fin 10) :
    hullFin (labelOfHullFin i) = i := by
  rcases i with ⟨i, hi⟩
  interval_cases i <;> rfl

@[simp] theorem hullFin_inj {a b : Label} :
    hullFin a = hullFin b ↔ a = b := by
  constructor
  · intro h
    have h' := congrArg labelOfHullFin h
    simpa using h'
  · intro h
    simp [h]

/-- On a non-wrapping hull interval, generated cyclic betweenness is ordinary
strict betweenness. -/
theorem between_eq_decide_btw_of_hullFin_lt
    {c cp x : Label} (hlt : hullFin c < hullFin cp) :
    between c cp x =
      decide (btw (hullFin c) (hullFin cp) (hullFin x)) := by
  revert hlt
  cases c <;> cases cp <;> cases x <;> decide

/-- On a wrapping hull interval, generated cyclic betweenness is the complement
of ordinary strict betweenness away from the two endpoints. -/
theorem between_eq_decide_not_btw_of_hullFin_gt
    {c cp x : Label} (hgt : hullFin cp < hullFin c)
    (hxc : x ≠ c) (hxcp : x ≠ cp) :
    between c cp x =
      decide (¬ btw (hullFin c) (hullFin cp) (hullFin x)) := by
  revert hgt hxc hxcp
  cases c <;> cases cp <;> cases x <;> decide

/-- Boolean finite bridge: `btw` alternation in hull order implies the generated
`separated` checker for labels. -/
theorem separated_eq_true_of_btw_sep
    {c cp x y : Label}
    (hxc : x ≠ c) (hxcp : x ≠ cp) (hyc : y ≠ c) (hycp : y ≠ cp)
    (hsep : btw (hullFin c) (hullFin cp) (hullFin x) ↔
      ¬ btw (hullFin c) (hullFin cp) (hullFin y)) :
    separated c cp x y = true := by
  have hccp : c ≠ cp := by
    intro h
    subst cp
    have hleft : ¬ btw (hullFin c) (hullFin c) (hullFin x) :=
      not_btw_same (hullFin c) (hullFin x)
    have hright : ¬ btw (hullFin c) (hullFin c) (hullFin y) :=
      not_btw_same (hullFin c) (hullFin y)
    exact hleft (hsep.mpr hright)
  have hfin : hullFin c ≠ hullFin cp := by
    intro h
    exact hccp ((hullFin_inj.mp h))
  rcases lt_or_gt_of_ne hfin with hlt | hgt
  · have hxbetween :=
      between_eq_decide_btw_of_hullFin_lt (c := c) (cp := cp) (x := x) hlt
    have hybetween :=
      between_eq_decide_btw_of_hullFin_lt (c := c) (cp := cp) (x := y) hlt
    rw [separated, hxbetween, hybetween]
    by_cases hxbtw : btw (hullFin c) (hullFin cp) (hullFin x) <;>
      by_cases hybtw : btw (hullFin c) (hullFin cp) (hullFin y) <;>
        simp [hxbtw, hybtw] at hsep ⊢
  · have hxbetween :=
      between_eq_decide_not_btw_of_hullFin_gt
        (c := c) (cp := cp) (x := x) hgt hxc hxcp
    have hybetween :=
      between_eq_decide_not_btw_of_hullFin_gt
        (c := c) (cp := cp) (x := y) hgt hyc hycp
    rw [separated, hxbetween, hybetween]
    by_cases hxbtw : btw (hullFin c) (hullFin cp) (hullFin x) <;>
      by_cases hybtw : btw (hullFin c) (hullFin cp) (hullFin y) <;>
        simp [hxbtw, hybtw] at hsep ⊢

end SurplusCOMPGBank

end Problem97
