/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy

/-!
# Cardinality of a physical rigid deletion

The physical-apex rigid `2+2+1` packet supplies a five-point radius class.
Global minimality says that deleting the whole rigid subdeletion destroys every
four-point class at the physical apex, while restoring any one deleted point
must restore a four-point class.  The resulting arithmetic forces the
subdeletion to contain exactly two points.  This is a source-level consequence
used by the open non-`u` physical leaf; it does not itself close that leaf.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- Filtering a carrier after deletion commutes with a selected-radius class. -/
private theorem selectedClass_sdiff
    {A E : Finset ℝ²} {P : ℝ²} {r : ℝ} :
    ((A \ E).filter fun q ↦ dist P q = r) = SelectedClass A P r \ E := by
  classical
  ext q
  simp only [Finset.mem_filter, Finset.mem_sdiff, mem_selectedClass]
  tauto

/-- Restoring one deleted point forces a positive witness radius and four
surviving members of that radius class. -/
private theorem restored_class_card_ge_four
    {A E : Finset ℝ²} {P s : ℝ²}
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A \ E) P)
    (hrestore : HasNEquidistantPointsAt 4 (A \ E.erase s) P) :
    0 < dist P s ∧ 4 ≤ (SelectedClass A P (dist P s) \ E.erase s).card := by
  classical
  obtain ⟨r, hrpos, hcard⟩ := hrestore
  rw [selectedClass_sdiff] at hcard
  have hsmem : s ∈ SelectedClass A P r \ E.erase s := by
    by_contra hsnot
    refine hblocked ⟨r, hrpos, ?_⟩
    rw [selectedClass_sdiff]
    refine le_trans hcard (Finset.card_le_card ?_)
    intro x hx
    have hxs : x ≠ s := by
      rintro rfl
      exact hsnot hx
    rw [Finset.mem_sdiff] at hx ⊢
    refine ⟨hx.1, ?_⟩
    intro hxE
    exact hx.2 (Finset.mem_erase.mpr ⟨hxs, hxE⟩)
  have hdps : dist P s = r :=
    (mem_selectedClass.mp (Finset.mem_sdiff.mp hsmem).1).2
  refine ⟨by rw [hdps]; exact hrpos, ?_⟩
  rw [hdps]
  exact hcard

/-- The physical rigid deletion has exactly two points under its full packet. -/
theorem physicalGlobalDeletion_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_source _other : CarrierVertex D.A)
    (hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (_context : ExactFourMutualOmissionSourceContext R rho _source _other u v)
    (jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v)
    (hclassFive : (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion R rho u v jointDeletion)
    (hcenter : globalDeletion.center = S.oppApex2)
    (_hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt _source.1 _source.2 ∈
        SelectedClass D.A S.oppApex2 rho)
    (_huNeSource : u ≠ _source)
    (_hsourceBlockerPlacement :
      (lateFirstApexSystem R).centerAt _source.1 _source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt _source.1 _source.2 = u.1 ∨
        (lateFirstApexSystem R).centerAt _source.1 _source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho) :
    globalDeletion.deleted.card = 2 := by
  classical
  have hEsub : globalDeletion.deleted ⊆ SelectedClass D.A S.oppApex2 rho :=
    globalDeletion.deleted_subset_class
  have hEle : globalDeletion.deleted.card ≤ 5 := by
    have h := Finset.card_le_card hEsub
    omega
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ globalDeletion.deleted) S.oppApex2 := by
    rw [← hcenter]
    exact globalDeletion.blocked
  have hlow : 2 ≤ globalDeletion.deleted.card := by
    by_contra hcon
    push_neg at hcon
    refine hblocked ⟨rho, hrho, ?_⟩
    rw [selectedClass_sdiff]
    have hsd :
        (SelectedClass D.A S.oppApex2 rho \ globalDeletion.deleted).card =
          (SelectedClass D.A S.oppApex2 rho).card - globalDeletion.deleted.card := by
      rw [Finset.card_sdiff, Finset.inter_eq_left.mpr hEsub]
    omega
  obtain ⟨s, hs⟩ := globalDeletion.deleted_nonempty
  have hrestore := globalDeletion.restores s hs
  rw [hcenter] at hrestore
  obtain ⟨_, hfour⟩ := restored_class_card_ge_four hblocked hrestore
  have hdist : dist S.oppApex2 s = rho :=
    (mem_selectedClass.mp (hEsub hs)).2
  rw [hdist] at hfour
  have hEeraseSub :
      globalDeletion.deleted.erase s ⊆ SelectedClass D.A S.oppApex2 rho :=
    (Finset.erase_subset _ _).trans hEsub
  have hsd2 :
      (SelectedClass D.A S.oppApex2 rho \ globalDeletion.deleted.erase s).card =
        (SelectedClass D.A S.oppApex2 rho).card -
          (globalDeletion.deleted.erase s).card := by
    rw [Finset.card_sdiff, Finset.inter_eq_left.mpr hEeraseSub]
  have hsd3 :
      (globalDeletion.deleted.erase s).card = globalDeletion.deleted.card - 1 :=
    Finset.card_erase_of_mem hs
  omega

end ATailFrontierLiveClosure
end Problem97
