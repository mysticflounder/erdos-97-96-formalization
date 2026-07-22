/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFiveGlobalCrossDeletionPair

/-!
# Ordered-cap geometry of an exact-five global-cover star

On an asymmetric arm of the exact-five global-cover star, the two-hit spoke
row is centered at the hub and contains the other spoke.  One-sided distance
injectivity on the ordered physical cap therefore forces the hub to lie
strictly between the two spokes.

This is a source-faithful nonlinear order reduction.  It does not assert the
still-missing first-apex co-radiality of the row's outside pair.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveGlobalCoverStarGeometry

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveMutualOneHitGeometry
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- One ordered physical-cap block in which the blocker of the two-hit source
lies strictly between the source and its other physical support point. -/
structure SourceTwoHitSharedCapOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    (N : SourceTwoHitNormalForm Q profile M) : Type where
  block : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2)
  sourceIndex : Fin block.m
  blockerIndex : Fin block.m
  thirdIndex : Fin block.m
  source_point : block.L.points sourceIndex = M.source.1
  blocker_point : block.L.points blockerIndex = M.target.1
  third_point : block.L.points thirdIndex = N.third.1
  blocker_straddles :
    (sourceIndex < blockerIndex ∧ blockerIndex < thirdIndex) ∨
      (thirdIndex < blockerIndex ∧ blockerIndex < sourceIndex)

/-- The blocker of an exact-five two-hit physical row lies strictly between
the row source and its other physical support point in the common ordered
cap. -/
theorem nonempty_sourceTwoHitSharedCapOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    (N : SourceTwoHitNormalForm Q profile M) :
    Nonempty (SourceTwoHitSharedCapOrder N) := by
  classical
  rcases S.capByIndex_cgn4g_strictCapBlockData D.convex S.oppIndex2 with ⟨C⟩
  have hsourceCap : M.source.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior M.source)
  have hblockerCap : M.target.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior M.target)
  have hthirdCap : N.third.1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (PhysicalVertex.mem_capInterior N.third)
  let sourceIndex : Fin C.m := Classical.choose (C.exists_index_of_mem_cap hsourceCap)
  let blockerIndex : Fin C.m := Classical.choose (C.exists_index_of_mem_cap hblockerCap)
  let thirdIndex : Fin C.m := Classical.choose (C.exists_index_of_mem_cap hthirdCap)
  have source_point : C.L.points sourceIndex = M.source.1 :=
    Classical.choose_spec (C.exists_index_of_mem_cap hsourceCap)
  have blocker_point : C.L.points blockerIndex = M.target.1 :=
    Classical.choose_spec (C.exists_index_of_mem_cap hblockerCap)
  have third_point : C.L.points thirdIndex = N.third.1 :=
    Classical.choose_spec (C.exists_index_of_mem_cap hthirdCap)
  let row := (H.selectedAt M.source.1
    (PhysicalVertex.mem_A M.source)).toCriticalFourShell
  have hdist :
      dist (C.L.points blockerIndex) (C.L.points sourceIndex) =
        dist (C.L.points blockerIndex) (C.L.points thirdIndex) := by
    have hrowEq : dist M.target.1 M.source.1 = dist M.target.1 N.third.1 := by
      rw [← N.sourceBlocker_eq_target]
      exact (row.support_eq_radius M.source.1 row.q_mem_support).trans
        (row.support_eq_radius N.third.1 N.third_mem_sourceSupport).symm
    simpa only [blocker_point, source_point, third_point] using hrowEq
  have hblocker_ne_source : blockerIndex ≠ sourceIndex := by
    intro h
    apply PhysicalActualCriticalMutualOmissionPair.source_ne_target M
    apply Subtype.ext
    calc
      M.source.1 = C.L.points sourceIndex := source_point.symm
      _ = C.L.points blockerIndex := by rw [h]
      _ = M.target.1 := blocker_point
  have hblocker_ne_third : blockerIndex ≠ thirdIndex := by
    intro h
    apply N.third_ne_target
    apply Subtype.ext
    calc
      N.third.1 = C.L.points thirdIndex := third_point.symm
      _ = C.L.points blockerIndex := by rw [h]
      _ = M.target.1 := blocker_point
  have hsource_ne_third : sourceIndex ≠ thirdIndex := by
    intro h
    apply N.third_ne_source
    apply Subtype.ext
    calc
      N.third.1 = C.L.points thirdIndex := third_point.symm
      _ = C.L.points sourceIndex := by rw [← h]
      _ = M.source.1 := source_point
  have hinj := CGN.oneSidedDistanceInjective_of_mecCapPacket
    C.Packet C.Hside C.Hord
  have blocker_straddles :
      (sourceIndex < blockerIndex ∧ blockerIndex < thirdIndex) ∨
        (thirdIndex < blockerIndex ∧ blockerIndex < sourceIndex) := by
    rcases lt_or_gt_of_ne hblocker_ne_source with hblockerSource | hsourceBlocker
    · have hthirdBlocker : thirdIndex < blockerIndex := by
        rcases lt_or_gt_of_ne hblocker_ne_third with hblockerThird | hthirdBlocker
        · rcases lt_or_gt_of_ne hsource_ne_third with hsourceThird | hthirdSource
          · exact False.elim ((hinj.1 hblockerSource hsourceThird) hdist)
          · exact False.elim ((hinj.1 hblockerThird hthirdSource) hdist.symm)
        · exact hthirdBlocker
      exact Or.inr ⟨hthirdBlocker, hblockerSource⟩
    · have hblockerThird : blockerIndex < thirdIndex := by
        rcases lt_or_gt_of_ne hblocker_ne_third with hblockerThird | hthirdBlocker
        · exact hblockerThird
        · rcases lt_or_gt_of_ne hsource_ne_third with hsourceThird | hthirdSource
          · exact False.elim ((hinj.2 hsourceThird hthirdBlocker) hdist)
          · exact False.elim ((hinj.2 hthirdSource hsourceBlocker) hdist.symm)
      exact Or.inl ⟨hsourceBlocker, hblockerThird⟩
  exact ⟨{
    block := C
    sourceIndex := sourceIndex
    blockerIndex := blockerIndex
    thirdIndex := thirdIndex
    source_point := source_point
    blocker_point := blocker_point
    third_point := third_point
    blocker_straddles := blocker_straddles }⟩

/-- In the first-spoke asymmetric star arm, the third point named by the
two-hit normal form is exactly the other spoke. -/
theorem SourceTwoHitNormalForm.third_eq_spoke₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalGlobalCrossDeletionStar profile)
    (N : SourceTwoHitNormalForm Q profile T.spoke₁HubPair.toMutualOmissionPair) :
    N.third = T.spoke₂ := by
  have hthird := N.third.2
  change N.third.1 ∈ physicalVertices profile at hthird
  rw [T.physicalVertices_eq] at hthird
  simp only [Finset.mem_insert, Finset.mem_singleton] at hthird
  rcases hthird with hhub | hspoke₁ | hspoke₂
  · exfalso
    apply N.third_ne_target
    exact Subtype.ext hhub
  · exfalso
    apply N.third_ne_source
    exact Subtype.ext hspoke₁
  · exact Subtype.ext hspoke₂

#print axioms nonempty_sourceTwoHitSharedCapOrder
#print axioms SourceTwoHitNormalForm.third_eq_spoke₂

end

end ATailExactFiveGlobalCoverStarGeometry
end Problem97
