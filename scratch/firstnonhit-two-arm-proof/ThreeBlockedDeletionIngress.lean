import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-! Scratch-only API proof for three blocked deletions. -/

namespace Problem97

open ATailCriticalPairFrontier
open ATAILStageOnePrescribedApexDichotomy

/-- Three distinct blocked points need not be named individually: a three-point
subfinset of the target row, all of whose deletions block K4 at the source-row
center, lies in the source row as well. -/
theorem scratch_selectedRow_inter_card_ge_three_of_blocked_deletions
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (source target : CriticalShellSystem.CarrierVertex D.A)
    (blocked : Finset (EuclideanSpace ℝ (Fin 2)))
    (hcard : 3 ≤ blocked.card)
    (hsubset :
      blocked ⊆
        (H.selectedAt target.1 target.2).toCriticalFourShell.support)
    (hblocked : ∀ w ∈ blocked,
      ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt source.1 source.2)) :
    3 ≤
      ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
        (H.selectedAt target.1 target.2).toCriticalFourShell.support).card := by
  apply hcard.trans
  apply Finset.card_le_card
  intro w hw
  simp only [Finset.mem_inter]
  exact ⟨source_mem_critical_support_of_no_qfree
      (H.selectedAt source.1 source.2) (hblocked w hw),
    hsubset hw⟩

/-- Consumer-ready form: a distinct-center source row together with three
blocked deletions drawn from the target support is exactly the active
three-overlap witness. -/
theorem scratch_exists_selectedRow_overlap_card_ge_three_of_blocked_deletions
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (source target : CriticalShellSystem.CarrierVertex D.A)
    (hcenters :
      H.centerAt source.1 source.2 ≠ H.centerAt target.1 target.2)
    (blocked : Finset (EuclideanSpace ℝ (Fin 2)))
    (hcard : 3 ≤ blocked.card)
    (hsubset :
      blocked ⊆
        (H.selectedAt target.1 target.2).toCriticalFourShell.support)
    (hblocked : ∀ w ∈ blocked,
      ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt source.1 source.2)) :
    ∃ witness : CriticalShellSystem.CarrierVertex D.A,
      H.centerAt witness.1 witness.2 ≠
          H.centerAt target.1 target.2 ∧
        3 ≤
          ((H.selectedAt witness.1 witness.2).toCriticalFourShell.support ∩
            (H.selectedAt target.1
              target.2).toCriticalFourShell.support).card := by
  refine ⟨source, hcenters, ?_⟩
  exact scratch_selectedRow_inter_card_ge_three_of_blocked_deletions
    source target blocked hcard hsubset hblocked

#print axioms scratch_selectedRow_inter_card_ge_three_of_blocked_deletions
#print axioms scratch_exists_selectedRow_overlap_card_ge_three_of_blocked_deletions

end Problem97
