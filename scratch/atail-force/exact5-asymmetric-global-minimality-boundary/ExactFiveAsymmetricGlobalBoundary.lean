import Erdos9796Proof.P97.ATail.ExactFiveGlobalCoverStarGeometry
import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion

/-!
# Exact-five asymmetric global-minimality boundary

The two outside points in an asymmetric exact-five row are already
deletion-critical at its known physical blocker. This supplies an explicit
singleton minimal-deletion core and records why applying global minimality to
the outside pair cannot force a fresh center.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveAsymmetricGlobalBoundaryScratch

open ATAILStageOneMinimalDeletionCore
open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveMutualOneHitGeometry
open ATailGlobalMinimalDeletion
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Each outside point of the asymmetric row is already deletion-critical at
the row's physical blocker. Thus global minimality applied to the outside
pair has an available singleton blocker and cannot by itself force a new
two-point deletion core. -/
theorem SourceTwoHitNormalForm.outside_deletions_block_at_target
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    (N : SourceTwoHitNormalForm Q profile M) :
    (¬ HasNEquidistantPointsAt 4 (D.A.erase N.outside₁) M.target.1) ∧
      (¬ HasNEquidistantPointsAt 4 (D.A.erase N.outside₂) M.target.1) := by
  let K := (H.selectedAt M.source.1
    (PhysicalVertex.mem_A M.source)).toCriticalFourShell
  have houtside₁ : N.outside₁ ∈ K.support := by
    have h : N.outside₁ ∈ K.support \ S.capByIndex S.oppIndex2 := by
      rw [N.outsidePair_eq]
      exact Finset.mem_insert_self _ _
    exact (Finset.mem_sdiff.mp h).1
  have houtside₂ : N.outside₂ ∈ K.support := by
    have h : N.outside₂ ∈ K.support \ S.capByIndex S.oppIndex2 := by
      rw [N.outsidePair_eq]
      exact Finset.mem_insert_of_mem (Finset.mem_singleton_self _)
    exact (Finset.mem_sdiff.mp h).1
  constructor
  · intro hsurvives
    have hsurvives' :
        HasNEquidistantPointsAt 4 (D.A.erase N.outside₁)
          (H.centerAt M.source.1 (PhysicalVertex.mem_A M.source)) := by
      simpa only [N.sourceBlocker_eq_target] using hsurvives
    exact ((cross_deletion_survives_iff_not_mem_selected_support
      H (PhysicalVertex.mem_A M.source)).mp hsurvives') houtside₁
  · intro hsurvives
    have hsurvives' :
        HasNEquidistantPointsAt 4 (D.A.erase N.outside₂)
          (H.centerAt M.source.1 (PhysicalVertex.mem_A M.source)) := by
      simpa only [N.sourceBlocker_eq_target] using hsurvives
    exact ((cross_deletion_survives_iff_not_mem_selected_support
      H (PhysicalVertex.mem_A M.source)).mp hsurvives') houtside₂

/-- The first outside point gives an explicit singleton minimal-deletion core
at the already-known blocker. This witnesses the precise stutter available
to any pair-minimality argument on the two outside points. -/
theorem SourceTwoHitNormalForm.nonempty_outside₁_singletonMinimalDeletionCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    (N : SourceTwoHitNormalForm Q profile M) :
    Nonempty (MinimalDeletionCore D.A {N.outside₁} M.target.1) := by
  let K := (H.selectedAt M.source.1
    (PhysicalVertex.mem_A M.source)).toCriticalFourShell
  have houtside₁Support : N.outside₁ ∈ K.support := by
    have h : N.outside₁ ∈ K.support \ S.capByIndex S.oppIndex2 := by
      rw [N.outsidePair_eq]
      exact Finset.mem_insert_self _ _
    exact (Finset.mem_sdiff.mp h).1
  have houtside₁A : N.outside₁ ∈ D.A :=
    K.support_subset_A houtside₁Support
  apply exists_minimalDeletionCore
  · simpa only [Finset.singleton_subset_iff]
  · exact PhysicalVertex.mem_A M.target
  · intro s hs t ht hst
    simp only [Finset.mem_singleton] at hs ht
    exact False.elim (hst (hs.trans ht.symm))
  · simpa only [Finset.sdiff_singleton_eq_erase] using
      (SourceTwoHitNormalForm.outside_deletions_block_at_target N).1
  · intro s hs
    have hsEq : s = N.outside₁ := Finset.mem_singleton.mp hs
    subst s
    simpa using D.K4 M.target.1 (PhysicalVertex.mem_A M.target)

#print axioms SourceTwoHitNormalForm.outside_deletions_block_at_target
#print axioms SourceTwoHitNormalForm.nonempty_outside₁_singletonMinimalDeletionCore

end

end ATailExactFiveAsymmetricGlobalBoundaryScratch
end Problem97
