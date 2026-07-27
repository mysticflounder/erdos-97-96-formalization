import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Exact-four physical-apex radius classification

Direct proof that a globally blocking deletion contained in the physical
`rho`-class rules out every robust radius-classification arm except the
five-point arm at `rho` itself.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

private theorem selectedClass_sdiff_eq_of_deleted_subset_otherRadius
    {A deleted : Finset ℝ²} {center : ℝ²} {rho r : ℝ}
    (hdeleted : deleted ⊆ SelectedClass A center rho)
    (hrne : r ≠ rho) :
    SelectedClass (A \ deleted) center r =
      SelectedClass A center r := by
  ext x
  constructor
  · intro hx
    exact mem_selectedClass.mpr
      ⟨(Finset.mem_sdiff.mp (mem_selectedClass.mp hx).1).1,
        (mem_selectedClass.mp hx).2⟩
  · intro hx
    have hxA : x ∈ A := (mem_selectedClass.mp hx).1
    have hxRadius : dist center x = r := (mem_selectedClass.mp hx).2
    have hxNotDeleted : x ∉ deleted := by
      intro hxDeleted
      have hxRho : dist center x = rho :=
        (mem_selectedClass.mp (hdeleted hxDeleted)).2
      apply hrne
      calc
        r = dist center x := hxRadius.symm
        _ = rho := hxRho
    exact mem_selectedClass.mpr
      ⟨Finset.mem_sdiff.mpr ⟨hxA, hxNotDeleted⟩, hxRadius⟩

/-- At the physical second apex, a globally blocking deletion contained in
the `rho`-class pins the robust radius classification to the five-point arm
at exactly `rho`.  Any different radius class survives the whole deletion and
contradicts global blocking. -/
theorem exactFourRigid221_physicalApex_radiusClassification_pinned
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} (hrho : 0 < rho)
    {u v : CarrierVertex D.A}
    {jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v}
    (surface : ExactFourPostCardElevenRobustSurface R)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (hcenter : G.center = S.oppApex2) :
    surface.radiusClassification =
      .fivePointRadius rho hrho hfive := by
  generalize hclassification :
      surface.radiusClassification = classification
  cases classification with
  | fivePointRadius r hr hfiveR =>
      have hrEq : r = rho := by
        by_contra hrNe
        apply G.blocked
        rw [hcenter]
        refine ⟨r, hr, ?_⟩
        have hclassEq :=
          selectedClass_sdiff_eq_of_deleted_subset_otherRadius
            G.deleted_subset_class hrNe
        change 4 ≤
          (SelectedClass (D.A \ G.deleted) S.oppApex2 r).card
        rw [hclassEq]
        omega
      subst r
      simpa using hclassification
  | twoDistinctRadii r otherRadius hr hother hfour hfourOther
      hradii _allSmall _firstRow _secondRow _hfirstRadius
      _hsecondRadius _hdisjoint =>
      exfalso
      by_cases hrEq : r = rho
      · have hotherNe : otherRadius ≠ rho := by
          intro hotherEq
          apply hradii
          exact hotherEq.trans hrEq.symm
        apply G.blocked
        rw [hcenter]
        refine ⟨otherRadius, hother, ?_⟩
        have hclassEq :=
          selectedClass_sdiff_eq_of_deleted_subset_otherRadius
            G.deleted_subset_class hotherNe
        change 4 ≤
          (SelectedClass
            (D.A \ G.deleted) S.oppApex2 otherRadius).card
        rw [hclassEq]
        exact hfourOther
      · apply G.blocked
        rw [hcenter]
        refine ⟨r, hr, ?_⟩
        have hclassEq :=
          selectedClass_sdiff_eq_of_deleted_subset_otherRadius
            G.deleted_subset_class hrEq
        change 4 ≤
          (SelectedClass (D.A \ G.deleted) S.oppApex2 r).card
        rw [hclassEq]
        exact hfour

end ATailFrontierLiveClosure
end Problem97
