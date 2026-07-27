import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4LateChoiceTerminal.UniqueFourLateChoiceTerminal
import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress

/-!
# Exact-four obstruction to frontier/common-deletion alignment

The physical-second-apex terminal requires a positive first-apex K4 after
deleting both points of its frontier pair. An exact-card-four unique-radius
first-apex residual forces the negation of that witness.
-/

namespace Problem97

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

namespace ATailCardTwelveFrontierCommonDeletionAlignmentScratch

attribute [local instance] Classical.propDecidable

private theorem pair_q_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.q_mem_marginal with ⟨hq, _⟩
  rcases Finset.mem_filter.mp hq with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr
    ⟨hqA, by simpa only [dist_comm] using hqRadius⟩

private theorem pair_w_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases Finset.mem_sdiff.mp F.pair.w_mem_marginal with ⟨hw, _⟩
  rcases Finset.mem_filter.mp hw with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr
    ⟨hwA, by simpa only [dist_comm] using hwRadius⟩

/--
For an exact-four unique first-apex class, deleting the two points of the
frontier pair cannot leave another four-point configuration at the first apex.

This is the precise obstruction to reusing the same frontier in
`FrontierCommonDeletionParentResidual`: that residual requires exactly the
negated witness.
-/
theorem firstApexDouble_blocked_of_originalUniqueFour
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    ¬ HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1 := by
  rintro ⟨tau, htau, hfour⟩
  have herased :
      4 ≤
        (SelectedClass ((D.A.erase F.pair.q).erase F.pair.w)
          S.oppApex1 tau).card := by
    simpa [SelectedClass] using hfour
  have hambient :
      4 ≤ (SelectedClass D.A S.oppApex1 tau).card := by
    rw [selectedClass_erase_eq, selectedClass_erase_eq] at herased
    exact herased.trans
      (Finset.card_le_card
        ((Finset.erase_subset _ _).trans (Finset.erase_subset _ _)))
  have htauEq := R.unique_K4_radius tau htau hambient
  subst tau
  have hwAfterQ :
      F.pair.w ∈
        (SelectedClass D.A S.oppApex1 radius).erase F.pair.q :=
    Finset.mem_erase.mpr
      ⟨F.pair.q_ne_w.symm, pair_w_mem_firstClass F⟩
  rw [selectedClass_erase_eq, selectedClass_erase_eq,
    Finset.card_erase_of_mem hwAfterQ,
    Finset.card_erase_of_mem (pair_q_mem_firstClass F),
    R.class_card_eq_four] at herased
  omega

/--
The original exact-four frontier cannot simultaneously carry the parent
residual expected by the physical-second-apex terminal.
-/
theorem no_same_frontier_commonDeletionParentResidual
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    ¬ Nonempty (FrontierCommonDeletionParentResidual F) := by
  rintro ⟨P⟩
  exact firstApexDouble_blocked_of_originalUniqueFour R
    P.common.firstApexDouble

/--
The same contradiction persists after the canonical late-first-apex rebase.
Thus `false_of_frontierCommonDeletionPhysicalSecondApex` cannot consume a
parent residual built on `lateFirstApexFrontier R`.
-/
theorem no_late_frontier_commonDeletionParentResidual
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    ¬ Nonempty
        (FrontierCommonDeletionParentResidual
          (lateFirstApexFrontier R)) :=
  no_same_frontier_commonDeletionParentResidual
    (lateFirstApexResidual R)

end ATailCardTwelveFrontierCommonDeletionAlignmentScratch

end Problem97
