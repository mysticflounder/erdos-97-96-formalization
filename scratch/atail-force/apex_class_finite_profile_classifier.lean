/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import apex_class_complement_threshold

/-!
# Finite profiles from the opposite-apex complement threshold

This scratch module specializes the complement threshold to carrier cards
eleven and twelve and surplus-cap cards five and six.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILApexClassFiniteProfileScratch

private theorem oppApex2_mem_A
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    S.oppApex2 ∈ D.A := by
  rcases hi : S.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simp only [SurplusCapPacket.oppApex2, hi]
    exact S.partition.C2_subset S.partition.v3_mem_C2
  · simp only [SurplusCapPacket.oppApex2, hi]
    exact S.partition.C3_subset S.partition.v1_mem_C3
  · simp only [SurplusCapPacket.oppApex2, hi]
    exact S.partition.C1_subset S.partition.v2_mem_C1

private theorem filter_dist_comm_local
    (A : Finset ℝ²) (p : ℝ²) (r : ℝ) :
    A.filter (fun q => dist p q = r) =
      A.filter (fun q => dist q p = r) := by
  apply Finset.filter_congr
  intro x _hx
  rw [dist_comm]

private theorem complement_card
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {n k : ℕ} (hA : D.A.card = n) (hS : S.surplusCap.card = k) :
    (D.A \ S.surplusCap).card = n - k := by
  rw [Finset.card_sdiff_of_subset (surplusCap_subset S), hA, hS]

private theorem exists_secondApex_class_card_ge_four
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    ∃ rho : ℝ, 0 < rho ∧
      4 ≤ (D.A.filter fun x => dist x S.oppApex2 = rho).card := by
  obtain ⟨rho, hrho, hcard⟩ := D.K4 S.oppApex2 (oppApex2_mem_A D S)
  refine ⟨rho, hrho, ?_⟩
  rw [filter_dist_comm_local] at hcard
  exact hcard

/-- Card eleven and a six-point surplus cap are impossible once the first
opposite apex has an exact five-class. -/
theorem false_of_card_eleven_surplus_six
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {r : ℝ}
    (hfirst : (D.A.filter fun x => dist x S.oppApex1 = r).card = 5)
    (hA : D.A.card = 11) (hS : S.surplusCap.card = 6) : False := by
  obtain ⟨rho, _hrho, hfour⟩ := exists_secondApex_class_card_ge_four D S
  have hbound :=
    ATAILApexClassComplementThresholdScratch.secondApex_class_card_add_two_le_complement
      D S (rho := rho) hfirst
  have hcomp : (D.A \ S.surplusCap).card = 5 := by
    simpa using complement_card D S hA hS
  omega

/-- At card eleven with a five-point surplus cap, global K4 at the second
opposite apex is forced to use an exact four-point class. -/
theorem card_eleven_surplus_five_secondApex_exact_four
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {r : ℝ}
    (hfirst : (D.A.filter fun x => dist x S.oppApex1 = r).card = 5)
    (hA : D.A.card = 11) (hS : S.surplusCap.card = 5) :
    ∃ rho : ℝ, 0 < rho ∧
      (D.A.filter fun x => dist x S.oppApex2 = rho).card = 4 := by
  obtain ⟨rho, hrho, hfour⟩ := exists_secondApex_class_card_ge_four D S
  have hbound :=
    ATAILApexClassComplementThresholdScratch.secondApex_class_card_add_two_le_complement
      D S (rho := rho) hfirst
  have hcomp : (D.A \ S.surplusCap).card = 6 := by
    simpa using complement_card D S hA hS
  exact ⟨rho, hrho, by omega⟩

/-- At card twelve with a six-point surplus cap, the second opposite apex is
again forced to use an exact four-point class. -/
theorem card_twelve_surplus_six_secondApex_exact_four
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {r : ℝ}
    (hfirst : (D.A.filter fun x => dist x S.oppApex1 = r).card = 5)
    (hA : D.A.card = 12) (hS : S.surplusCap.card = 6) :
    ∃ rho : ℝ, 0 < rho ∧
      (D.A.filter fun x => dist x S.oppApex2 = rho).card = 4 := by
  obtain ⟨rho, hrho, hfour⟩ := exists_secondApex_class_card_ge_four D S
  have hbound :=
    ATAILApexClassComplementThresholdScratch.secondApex_class_card_add_two_le_complement
      D S (rho := rho) hfirst
  have hcomp : (D.A \ S.surplusCap).card = 6 := by
    simpa using complement_card D S hA hS
  exact ⟨rho, hrho, by omega⟩

/-- At card twelve with a five-point surplus cap, the selected second-apex
K4 class has exact cardinality four or five. -/
theorem card_twelve_surplus_five_secondApex_four_or_five
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {r : ℝ}
    (hfirst : (D.A.filter fun x => dist x S.oppApex1 = r).card = 5)
    (hA : D.A.card = 12) (hS : S.surplusCap.card = 5) :
    ∃ rho : ℝ, 0 < rho ∧
      ((D.A.filter fun x => dist x S.oppApex2 = rho).card = 4 ∨
        (D.A.filter fun x => dist x S.oppApex2 = rho).card = 5) := by
  obtain ⟨rho, hrho, hfour⟩ := exists_secondApex_class_card_ge_four D S
  have hbound :=
    ATAILApexClassComplementThresholdScratch.secondApex_class_card_add_two_le_complement
      D S (rho := rho) hfirst
  have hcomp : (D.A \ S.surplusCap).card = 7 := by
    simpa using complement_card D S hA hS
  refine ⟨rho, hrho, ?_⟩
  omega

#print axioms false_of_card_eleven_surplus_six
#print axioms card_eleven_surplus_five_secondApex_exact_four
#print axioms card_twelve_surplus_six_secondApex_exact_four
#print axioms card_twelve_surplus_five_secondApex_four_or_five

end ATAILApexClassFiniteProfileScratch
end Problem97
