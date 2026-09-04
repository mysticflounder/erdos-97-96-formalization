/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CyclicPairSignedArea
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactFiveDistinctOpposedTurnSourceOrder

/-!
# Signed-area transport for the exact-five opposed-turn split

This module transports the finite cyclic-order split to the two signed-area
product pairs used by the old opposed-turn obstruction and the residual
family-13 obstruction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

/-- The exact-five source-order split yields either the two old opposed-turn
products or the two family-13 products, all in the argument order expected by
their geometric consumers. -/
theorem signedAreaProducts_old_or_family13_of_chain_of_separated
    {n : ℕ} {ψ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon ψ)
    (hinj : Function.Injective ψ)
    {ic₁ iw iO ic₂ ia : Fin n}
    (hchain :
      (iw < iO ∧ iO < ic₂ ∧ ic₂ < ia) ∨
        (ia < ic₂ ∧ ic₂ < iO ∧ iO < iw))
    (hsep : separatedPair ic₁ ic₂ ia iO)
    (hic₁w : ic₁ ≠ iw)
    (hic₁O : ic₁ ≠ iO)
    (hic₁c₂ : ic₁ ≠ ic₂)
    (hic₁a : ic₁ ≠ ia) :
    ((signedArea2 (ψ ic₁) (ψ iO) (ψ ic₂) *
          signedArea2 (ψ ic₁) (ψ iO) (ψ iw) < 0 ∧
        signedArea2 (ψ ic₁) (ψ iO) (ψ ic₂) *
          signedArea2 (ψ ic₂) (ψ iO) (ψ iw) < 0) ∨
      (signedArea2 (ψ ic₁) (ψ iO) (ψ ia) *
          signedArea2 (ψ ia) (ψ ic₂) (ψ iw) < 0 ∧
        signedArea2 (ψ ic₁) (ψ iO) (ψ ia) *
          signedArea2 (ψ ia) (ψ ic₁) (ψ iw) < 0)) := by
  have hiwO : iw ≠ iO := by
    rcases hchain with hdirect | hmirror <;> omega
  have hiwc₂ : iw ≠ ic₂ := by
    rcases hchain with hdirect | hmirror <;> omega
  have hiwa : iw ≠ ia := by
    rcases hchain with hdirect | hmirror <;> omega
  have hOc₂ : iO ≠ ic₂ := by
    rcases hchain with hdirect | hmirror <;> omega
  have hOa : iO ≠ ia := by
    rcases hchain with hdirect | hmirror <;> omega
  have hc₂a : ic₂ ≠ ia := by
    rcases hchain with hdirect | hmirror <;> omega
  have hcyclic (X Y Z : ℝ²) :
      signedArea2 X Y Z = signedArea2 Y Z X := by
    simp only [signedArea2]
    ring
  have hswap (X Y Z : ℝ²) :
      signedArea2 X Y Z = -signedArea2 X Z Y := by
    simp only [signedArea2]
    ring
  rcases cyclicAdjacent_old_or_family13_of_chain_of_separated hchain hsep with
    hold | hfamily
  · left
    have hbaseRaw :=
      (not_cyclicAdjacent_iff_signedArea2_mul_neg
        hccw hinj hic₁O hic₁c₂.symm hOc₂.symm hic₁w.symm hiwO).mp hold.1
    have hcenterRaw :=
      (cyclicAdjacent_iff_signedArea2_mul_pos
        hccw hinj hOc₂.symm hic₁c₂ hic₁O hiwc₂ hiwO).mp hold.2
    constructor
    · rw [hcyclic (ψ ic₂) (ψ ic₁) (ψ iO),
          hcyclic (ψ iw) (ψ ic₁) (ψ iO)] at hbaseRaw
      exact hbaseRaw
    · rw [hswap (ψ ic₁) (ψ ic₂) (ψ iO),
          hcyclic (ψ iw) (ψ ic₂) (ψ iO)] at hcenterRaw
      nlinarith
  · right
    have hsameRaw :=
      (cyclicAdjacent_iff_signedArea2_mul_pos
        hccw hinj hc₂a.symm hOa hOc₂ hiwa hiwc₂).mp hfamily.1
    have hotherRaw :=
      (not_cyclicAdjacent_iff_signedArea2_mul_neg
        hccw hinj hic₁a.symm hOa hic₁O.symm hiwa hic₁w.symm).mp hfamily.2
    have hsepExchanged : separatedPair ia iO ic₁ ic₂ :=
      separatedPair_exchange hic₁a hic₁O hc₂a hOc₂.symm hsep
    have hsepNotAdjacent : ¬ cyclicAdjacent ia iO ic₁ ic₂ := by
      intro hadj
      exact not_separated_of_cyclicAdjacent hadj hsepExchanged
    have hseparatedRaw :=
      (not_cyclicAdjacent_iff_signedArea2_mul_neg
        hccw hinj hOa.symm hic₁a hic₁O hc₂a hOc₂.symm).mp hsepNotAdjacent
    have hST :
        0 < signedArea2 (ψ ia) (ψ ic₂) (ψ iO) *
          signedArea2 (ψ ia) (ψ ic₂) (ψ iw) := by
      rw [hcyclic (ψ iO) (ψ ia) (ψ ic₂),
          hcyclic (ψ iw) (ψ ia) (ψ ic₂)] at hsameRaw
      exact hsameRaw
    have hRU :
        signedArea2 (ψ ic₁) (ψ iO) (ψ ia) *
          signedArea2 (ψ ia) (ψ ic₁) (ψ iw) < 0 := by
      rw [hcyclic (ψ iO) (ψ ia) (ψ ic₁),
          hcyclic (ψ ia) (ψ ic₁) (ψ iO),
          hcyclic (ψ iw) (ψ ia) (ψ ic₁)] at hotherRaw
      exact hotherRaw
    have hRS :
        signedArea2 (ψ ic₁) (ψ iO) (ψ ia) *
          signedArea2 (ψ ia) (ψ ic₂) (ψ iO) < 0 := by
      rw [hswap (ψ ic₁) (ψ ia) (ψ iO)] at hseparatedRaw
      have hc₂aO :
          signedArea2 (ψ ic₂) (ψ ia) (ψ iO) =
            -signedArea2 (ψ ia) (ψ ic₂) (ψ iO) := by
        calc
          signedArea2 (ψ ic₂) (ψ ia) (ψ iO) =
              signedArea2 (ψ ia) (ψ iO) (ψ ic₂) :=
            hcyclic _ _ _
          _ = -signedArea2 (ψ ia) (ψ ic₂) (ψ iO) :=
            hswap _ _ _
      rw [hc₂aO] at hseparatedRaw
      nlinarith
    constructor
    · rcases mul_neg_iff.mp hRS with hRS | hRS
      · rcases mul_pos_iff.mp hST with hST | hST
        · linarith
        · exact mul_neg_of_pos_of_neg hRS.1 hST.2
      · rcases mul_pos_iff.mp hST with hST | hST
        · exact mul_neg_of_neg_of_pos hRS.1 hST.2
        · linarith
    · exact hRU

end ATailFrontierLiveClosure
end Problem97
