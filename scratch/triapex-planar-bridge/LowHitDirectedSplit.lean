import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-! Scratch characterization of the directed-shell branch at the low-hit leaf. -/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosureScratch

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailFrontierLiveClosure
open ATailMinimalUniqueFourCover

attribute [local instance] Classical.propDecidable

/-- Failure of the directed cross-deletion is exactly the missing incidence
needed to turn a same-class strict-cap pair into a two-hit critical shell. -/
theorem twoHit_of_crossDeletion_failure_sameRichCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3}
    {q w : ℝ²} (hqA : q ∈ D.A) {r : ℝ}
    (hq :
      q ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hw :
      w ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hqw : q ≠ w)
    (hfailure :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase w) (H.centerAt q hqA)) :
    2 ≤ ((H.selectedAt q hqA).toCriticalFourShell.support ∩
      (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)).card := by
  have hwShell :
      w ∈ (H.selectedAt q hqA).toCriticalFourShell.support := by
    by_contra hwOmitted
    exact hfailure
      ((cross_deletion_survives_iff_not_mem_selected_support H hqA).2
        hwOmitted)
  have hpairSubset :
      ({q, w} : Finset ℝ²) ⊆
        (H.selectedAt q hqA).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hzq | hzw
    · subst z
      exact Finset.mem_inter.mpr
        ⟨(H.selectedAt q hqA).toCriticalFourShell.q_mem_support, hq⟩
    · subst z
      exact Finset.mem_inter.mpr ⟨hwShell, hw⟩
  have hcard := Finset.card_le_card hpairSubset
  simpa [hqw, hqw.symm] using hcard

/-- For two points of one rich class inside its indexed strict cap, an actual
blocker outside that cap forces the directed cross-deletion to survive.

Thus the generic directed-shell dichotomy cannot by itself produce the new
anti-matching leaf: its shell-hit branch puts the blocker inside the cap, and
an outside blocker necessarily lands in the survival branch. -/
theorem crossDeletion_survives_of_blocker_outside_richCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3}
    {q w : ℝ²} (hqA : q ∈ D.A)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex i))
    (hunique : IsUniqueFourCenter D.A (H.centerAt q hqA))
    {r : ℝ}
    (hq :
      q ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hw :
      w ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hqw : q ≠ w)
    (houtside : H.centerAt q hqA ∉ S.capInteriorByIndex i) :
    HasNEquidistantPointsAt 4 (D.A.erase w) (H.centerAt q hqA) := by
  apply
    (cross_deletion_survives_iff_not_mem_selected_support H hqA).2
  intro hwShell
  apply houtside
  apply criticalShellCenter_mem_capInteriorByIndex_of_two_hits
    hqA hrich hunique
  have hpairSubset :
      ({q, w} : Finset ℝ²) ⊆
        (H.selectedAt q hqA).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with hzq | hzw
    · subst z
      exact Finset.mem_inter.mpr
        ⟨(H.selectedAt q hqA).toCriticalFourShell.q_mem_support, hq⟩
    · subst z
      exact Finset.mem_inter.mpr ⟨hwShell, hw⟩
  have hcard := Finset.card_le_card hpairSubset
  simpa [hqw, hqw.symm] using hcard

end ATailFrontierLiveClosureScratch
end Problem97
