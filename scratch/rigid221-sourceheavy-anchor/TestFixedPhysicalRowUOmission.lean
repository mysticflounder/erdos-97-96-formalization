import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PhysicalCycleIngress

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress

/-- In the fixed `(jointDeletion,v)=(0,2)` cell, a distinguished next center
lying in the physical row cannot have both labels `6` and `7` in its selected
row.  At centers `0` and `2` this is the source-proved adjacent-cap one-hit
bound; at center `6` it is center omission; center `8` is excluded separately.

This is a scoped finite consequence, not placement-complete coverage. -/
theorem frozenSafeCube_fixedPhysicalRow_six_not_mem_of_seven_mem
    {row : RowPattern Label}
    (hsafe : FrozenSafeCubeOK row)
    (hphysicalRow : row 1 = {0, 2, 6, 8})
    {d : Label}
    (hdPhysicalRow : d ∈ row 1)
    (hdNeEight : d ≠ 8)
    (hseven : 7 ∈ row d) :
    6 ∉ row d := by
  have hdCases : d = 0 ∨ d = 2 ∨ d = 6 ∨ d = 8 := by
    rw [hphysicalRow] at hdPhysicalRow
    simpa only [Finset.mem_insert, Finset.mem_singleton] using hdPhysicalRow
  rcases hdCases with rfl | rfl | rfl | rfl
  · have hcandidate : FrozenSafeCandidateAt 0 (row 0) :=
      mem_frozenSafeCandidateClasses.mp (hsafe.candidate_mem 0)
    have hone : (row 0 ∩ secondOppositeCapLabels).card ≤ 1 :=
      (hcandidate.2.2.1.1 rfl).2
    intro hsix
    have hpair : ({6, 7} : Finset Label) ⊆
        row 0 ∩ secondOppositeCapLabels := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · simp only [Finset.mem_inter, hsix, true_and,
          secondOppositeCapLabels, Finset.mem_insert, Finset.mem_singleton]
        decide
      · simp only [Finset.mem_inter, hseven, true_and,
          secondOppositeCapLabels, Finset.mem_insert, Finset.mem_singleton]
        decide
    have htwo : 2 ≤ (row 0 ∩ secondOppositeCapLabels).card := by
      simpa using Finset.card_le_card hpair
    omega
  · have hcandidate : FrozenSafeCandidateAt 2 (row 2) :=
      mem_frozenSafeCandidateClasses.mp (hsafe.candidate_mem 2)
    have hone : (row 2 ∩ secondOppositeCapLabels).card ≤ 1 :=
      (hcandidate.2.2.1.2.2 rfl).1
    intro hsix
    have hpair : ({6, 7} : Finset Label) ⊆
        row 2 ∩ secondOppositeCapLabels := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · simp only [Finset.mem_inter, hsix, true_and,
          secondOppositeCapLabels, Finset.mem_insert, Finset.mem_singleton]
        decide
      · simp only [Finset.mem_inter, hseven, true_and,
          secondOppositeCapLabels, Finset.mem_insert, Finset.mem_singleton]
        decide
    have htwo : 2 ≤ (row 2 ∩ secondOppositeCapLabels).card := by
      simpa using Finset.card_le_card hpair
    omega
  · exact hsafe.sourceCube.center_not_mem 6
  · exact (hdNeEight rfl).elim

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
