/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F2SupportHeavyReduction

/-!
# Scratch: the deleted-source cap in the F2 support-heavy arm

The support-heavy reduction says that the deleted source's exact critical
shell meets `oppCap2` in exactly two points.  The two named support-heavy
middle-row points already fill those two places.  Since the deleted source is
itself in the critical shell but is omitted from the middle row, it cannot
also lie in `oppCap2`.

For an off-surplus deleted source, the cap cover then places the source in
strict `oppCap1`.  This is a source-faithful strengthening: it uses the
actual deleted source and its actual selected critical shell, rather than a
new anonymous finite pattern.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2SupportHeavyDeletedCapScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRTwoOffLiveFailureScratch
open ATailStrictOppCapCrossClassifierScratch

attribute [local instance] Classical.propDecidable

/-- The two support-heavy middle-row witnesses exhaust the two available
`oppCap2` positions in the deleted source's selected critical shell.  The
deleted source itself is therefore outside `oppCap2`. -/
theorem F2SupportHeavyReduction.deleted_not_mem_oppCap2
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    (P : F2SupportHeavyReduction S W C) :
    deleted ∉ S.oppCap2 := by
  let supportStrict :=
    supportOnlyCell C.B₂
      ({q, t1, t2, t3} : Finset ℝ²)
      (deletedCriticalSupport C) ∩ strictSecondCap S
  let supportOpp2 :=
    deletedCriticalSupport C ∩ S.oppCap2
  have hsub : supportStrict ⊆ supportOpp2 := by
    intro z hz
    have hzSupportOnly :=
      Finset.mem_inter.mp hz |>.1 |> Finset.mem_sdiff.mp
    have hzSupport : z ∈ deletedCriticalSupport C :=
      (Finset.mem_inter.mp hzSupportOnly.1).2
    have hzOpp2 : z ∈ S.oppCap2 :=
      (Finset.mem_sdiff.mp (Finset.mem_inter.mp hz).2).1
    exact Finset.mem_inter.mpr ⟨hzSupport, hzOpp2⟩
  have hsupportStrictCard : supportStrict.card = 2 := by
    simpa [supportStrict] using P.supportStrict_card
  have hsupportOpp2Card : supportOpp2.card = 2 := by
    simpa [supportOpp2] using P.deletedSupport_oppCap2_card
  have heq : supportStrict = supportOpp2 := by
    apply Finset.eq_of_subset_of_card_le hsub
    omega
  intro hdeletedOpp2
  have hdeletedSupportStrict : deleted ∈ supportStrict := by
    rw [heq]
    exact Finset.mem_inter.mpr
      ⟨deleted_mem_deletedCriticalSupport C, hdeletedOpp2⟩
  have hdeletedMiddle : deleted ∈ C.B₂ := by
    have hdeletedSupportOnly :=
      (Finset.mem_inter.mp hdeletedSupportStrict).1
    exact
      (Finset.mem_inter.mp
        (Finset.mem_sdiff.mp hdeletedSupportOnly).1).1
  exact deleted_not_mem_secondRow C hdeletedMiddle

/-- An off-surplus deleted source in the support-heavy arm lies in strict
`oppCap1`. -/
theorem F2SupportHeavyReduction.deleted_mem_strictOppCap1
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    {S : SurplusCapPacket D.A}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    (P : F2SupportHeavyReduction S W C)
    (hdeletedOff : deleted ∉ S.surplusCap) :
    deleted ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  exact mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps
    S C.q_mem_A hdeletedOff
      (Problem97.ATailRF2SupportHeavyDeletedCapScratch.F2SupportHeavyReduction.deleted_not_mem_oppCap2
        P)

#print axioms F2SupportHeavyReduction.deleted_not_mem_oppCap2
#print axioms F2SupportHeavyReduction.deleted_mem_strictOppCap1

end ATailRF2SupportHeavyDeletedCapScratch
end Problem97
