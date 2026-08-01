/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1TwoShortCapReduction
import Erdos9796Proof.P97.U1OppositeCapLowerBounds

/-!
# Card-ten cap-profile boundary

This module isolates the exact card-ten `(5,4,4)` closed-cap profile used by
the Phase-3 projected structural search.  The search records this profile as
the unordered multiset `(4,4,5)`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace U1LargeCapRouteBTailMetricResidualTarget

/-- For a ten-point counterexample, a designated surplus cap has size exactly
`5`, and each of the other two caps has size exactly `4`.

The proof uses only the cap-sum identity, the uniform lower bound `4` on all
three caps, and the fact that the designated cap has size greater than `4`. -/
theorem capProfile_eq_544_of_card_eq_ten
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    {i : Fin 3}
    (hsurplus : 4 < (CP.capAt i).card)
    (hcard10 : D.A.card = 10) :
    (CP.capAt i).card = 5 ∧
      ∀ j : Fin 3, j ≠ i → (CP.capAt j).card = 4 := by
  subst hM
  have hlower :
      4 ≤ CP.C1.card ∧ 4 ≤ CP.C2.card ∧ 4 ≤ CP.C3.card :=
    U1OppositeCapLowerBounds.capTriple_caps_card_ge_four CP D.convex hncol
      D.K4 (CircumscribedMECPacket.ofNonObtuse MT hCirc)
  have hsum : CP.C1.card + CP.C2.card + CP.C3.card = 13 := by
    have h := CP.cap_sum_identity
    omega
  fin_cases i
  · simp only [CapTriple.capAt] at hsurplus ⊢
    refine ⟨by omega, fun j hji => ?_⟩
    fin_cases j <;> simp at hji ⊢ <;> omega
  · simp only [CapTriple.capAt] at hsurplus ⊢
    refine ⟨by omega, fun j hji => ?_⟩
    fin_cases j <;> simp at hji ⊢ <;> omega
  · simp only [CapTriple.capAt] at hsurplus ⊢
    refine ⟨by omega, fun j hji => ?_⟩
    fin_cases j <;> simp at hji ⊢ <;> omega

end U1LargeCapRouteBTailMetricResidualTarget
end Problem97
