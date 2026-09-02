/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Balanced555BoundaryIngress
import Erdos9796Proof.P97.GeneralCarrierAbstractRowSystem

/-!
# Source configuration for the balanced `(5, 5, 5)` exact-twelve branch

This module joins the balanced boundary labeling to one faithful selected
four-class at every carrier point.  At the three distinguished centers the
selected classes are exactly the three classes in the source normal form.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open Census554.GeneralCarrierBridge
open ExactFiveDistinctThreeCenterContinuation
open ExactFiveDistinctThreeCenterTightCover
open ExactTwelveCarrierIngress
open FirstApexUniqueRadiusResidual

/-- Source-faithful exact-twelve data for the balanced three-class branch. -/
structure Balanced555SourceConfiguration
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (I : BalancedTightCoverInvariant R C N) : Type where
  boundary : Balanced555BoundaryLabeling R C N I
  carrierPattern : FaithfulCarrierPattern D.A
  firstApex_classAt :
    carrierPattern.classAt S.oppApex1 N.freshThreeCenter.center₀_mem_A =
      N.firstApexClass
  blocker_classAt :
    carrierPattern.classAt blocker N.freshThreeCenter.center₁_mem_A = N.blockerClass
  secondApex_classAt :
    carrierPattern.classAt S.oppApex2 N.freshThreeCenter.center₂_mem_A =
      N.secondApexClass

/-- The balanced tight-cover invariant supplies a source-faithful carrier
configuration whose three distinguished selected classes are the normal-form
classes. -/
theorem nonempty_balanced555SourceConfiguration
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (I : BalancedTightCoverInvariant R C N) :
    Nonempty (Balanced555SourceConfiguration R C N I) := by
  classical
  rcases nonempty_balanced555BoundaryLabeling R C N I with ⟨boundary⟩
  have hfirstApex : S.oppApex1 ∈ D.A := by
    simpa only [oppositeVertexByIndex_oppIndex1] using
      S.oppositeVertexByIndex_mem S.oppIndex1
  let V : Finset ℝ² := {S.oppApex1, blocker, S.oppApex2}
  have hVA : V ⊆ D.A := by
    intro center hcenter
    simp only [V, Finset.mem_insert, Finset.mem_singleton] at hcenter
    rcases hcenter with rfl | rfl | rfl
    · exact hfirstApex
    · exact N.freshThreeCenter.center₁_mem_A
    · exact N.freshThreeCenter.center₂_mem_A
  have hVne : V.Nonempty := ⟨S.oppApex1, by simp [V]⟩
  let K : ∀ center : ℝ², center ∈ V → SelectedFourClass D.A center :=
    fun center hcenter ↦
      if hfirst : center = S.oppApex1 then
        hfirst ▸ N.firstApexClass
      else if hblocker : center = blocker then
        hblocker ▸ N.blockerClass
      else by
        have hsecond : center = S.oppApex2 := by
          simpa [V, hfirst, hblocker] using hcenter
        exact hsecond ▸ N.secondApexClass
  rcases exists_faithfulCarrierPattern_with_classes_on D.K4 hVA hVne K with
    ⟨carrierPattern, hclassAt⟩
  refine ⟨{
    boundary := boundary
    carrierPattern := carrierPattern
    firstApex_classAt := ?_
    blocker_classAt := ?_
    secondApex_classAt := ?_
  }⟩
  · simpa [K] using hclassAt S.oppApex1 (by simp [V])
  · simpa [K, N.freshThreeCenter.center₀_ne_center₁.symm] using
      hclassAt blocker (by simp [V])
  · simpa [K, N.freshThreeCenter.center₀_ne_center₂.symm,
      N.freshThreeCenter.center₁_ne_center₂.symm] using
      hclassAt S.oppApex2 (by simp [V])

namespace Balanced555SourceConfiguration

/-- The source configuration's selected four-classes, relabeled by its
boundary-compatible exact-twelve labels. -/
noncomputable def selectedAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (Q : Balanced555SourceConfiguration R C N I) :
    Census554.EqualityCore.RowPattern (Fin 12) :=
  labeledRowPattern Q.carrierPattern Q.boundary.labels

/-- The balanced labeling itself is a complete boundary indexing of the
source carrier. -/
def boundaryIndexing
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (Q : Balanced555SourceConfiguration R C N I) : BoundaryIndexing D.A where
  n := 12
  boundary := Q.boundary.pointOf
  indexOf := Q.boundary.labels
  boundary_injective := Q.boundary.pointOf_injective
  boundary_image := Q.boundary.pointOf_image
  boundary_ccw := Q.boundary.pointOf_ccw
  index_injective := Q.boundary.labels.injective
  point_eq := by
    intro label
    simp [Balanced555BoundaryLabeling.pointOf,
      Census554.GeneralCarrierBridge.pointOf]

/-- Every relabeled selected class has exactly four members, omits its center,
has pairwise row overlap at most two, and has pair codegree at most two. -/
theorem sourceCubeOK_selectedAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (Q : Balanced555SourceConfiguration R C N I) :
    SourceCubeOK Q.selectedAt := by
  exact sourceCubeOK_labeledRowPattern D.convex
    Q.carrierPattern Q.boundary.labels

/-- The relabeled selected classes retain their Euclidean realization. -/
theorem realizes_selectedAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (Q : Balanced555SourceConfiguration R C N I) :
    Census554.EqualityCore.Realizes Q.selectedAt Q.boundary.pointOf := by
  simpa [selectedAt, Balanced555BoundaryLabeling.pointOf] using
    realizes_labeledRowPattern Q.carrierPattern Q.boundary.labels

/-- The selected class at the first apex is exactly the first pinned
normal-form support after relabeling. -/
theorem selectedAt_firstApex_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (Q : Balanced555SourceConfiguration R C N I) :
    Q.selectedAt
        (Q.boundary.labels
          ⟨S.oppApex1, N.freshThreeCenter.center₀_mem_A⟩) =
      labelsOf Q.boundary.labels N.firstApexClass.support := by
  ext point
  rw [mem_labelsOf_iff, selectedAt, mem_labeledRowPattern_iff]
  rw [Q.boundary.labels.symm_apply_apply]
  rw [Q.firstApex_classAt]

/-- The selected class at the retained blocker is exactly the second pinned
normal-form support after relabeling. -/
theorem selectedAt_blocker_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (Q : Balanced555SourceConfiguration R C N I) :
    Q.selectedAt
        (Q.boundary.labels
          ⟨blocker, N.freshThreeCenter.center₁_mem_A⟩) =
      labelsOf Q.boundary.labels N.blockerClass.support := by
  ext point
  rw [mem_labelsOf_iff, selectedAt, mem_labeledRowPattern_iff]
  rw [Q.boundary.labels.symm_apply_apply]
  rw [Q.blocker_classAt]

/-- The selected class at the second apex is exactly the third pinned
normal-form support after relabeling. -/
theorem selectedAt_secondApex_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (Q : Balanced555SourceConfiguration R C N I) :
    Q.selectedAt
        (Q.boundary.labels
          ⟨S.oppApex2, N.freshThreeCenter.center₂_mem_A⟩) =
      labelsOf Q.boundary.labels N.secondApexClass.support := by
  ext point
  rw [mem_labelsOf_iff, selectedAt, mem_labeledRowPattern_iff]
  rw [Q.boundary.labels.symm_apply_apply]
  rw [Q.secondApex_classAt]

/-- Two shared points in two distinct relabeled selected classes alternate
across the two centers in the balanced cyclic order. -/
theorem sharedPairAlternating_selectedAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (Q : Balanced555SourceConfiguration R C N I) :
    ∀ {firstCenter secondCenter firstPoint secondPoint : Fin 12},
      firstCenter ≠ secondCenter →
      firstPoint ≠ secondPoint →
      firstPoint ∈ Q.selectedAt firstCenter →
      secondPoint ∈ Q.selectedAt firstCenter →
      firstPoint ∈ Q.selectedAt secondCenter →
      secondPoint ∈ Q.selectedAt secondCenter →
      (SurplusCOMPGBank.btw firstCenter secondCenter firstPoint ↔
        ¬ SurplusCOMPGBank.btw firstCenter secondCenter secondPoint) := by
  intro firstCenter secondCenter firstPoint secondPoint
    hcenters hpoints hfirstPointFirst hsecondPointFirst
    hfirstPointSecond hsecondPointSecond
  let firstCenterSource := Q.boundary.labels.symm firstCenter
  let secondCenterSource := Q.boundary.labels.symm secondCenter
  let firstPointSource := Q.boundary.labels.symm firstPoint
  let secondPointSource := Q.boundary.labels.symm secondPoint
  have hcentersSource : firstCenterSource ≠ secondCenterSource := by
    intro h
    exact hcenters (Q.boundary.labels.symm.injective h)
  have hpointsSource : firstPointSource ≠ secondPointSource := by
    intro h
    exact hpoints (Q.boundary.labels.symm.injective h)
  have hfirstPointFirstSource :
      firstPointSource ∈
        (GeneralCarrierAbstractRowSystem.system Q.carrierPattern).row
          firstCenterSource := by
    simpa [selectedAt, labeledRowPattern,
      GenericRowNogoodCertificate.reindexRowPattern,
      firstCenterSource, firstPointSource] using hfirstPointFirst
  have hsecondPointFirstSource :
      secondPointSource ∈
        (GeneralCarrierAbstractRowSystem.system Q.carrierPattern).row
          firstCenterSource := by
    simpa [selectedAt, labeledRowPattern,
      GenericRowNogoodCertificate.reindexRowPattern,
      firstCenterSource, secondPointSource] using hsecondPointFirst
  have hfirstPointSecondSource :
      firstPointSource ∈
        (GeneralCarrierAbstractRowSystem.system Q.carrierPattern).row
          secondCenterSource := by
    simpa [selectedAt, labeledRowPattern,
      GenericRowNogoodCertificate.reindexRowPattern,
      secondCenterSource, firstPointSource] using hfirstPointSecond
  have hsecondPointSecondSource :
      secondPointSource ∈
        (GeneralCarrierAbstractRowSystem.system Q.carrierPattern).row
          secondCenterSource := by
    simpa [selectedAt, labeledRowPattern,
      GenericRowNogoodCertificate.reindexRowPattern,
      secondCenterSource, secondPointSource] using hsecondPointSecond
  have hsource :=
    GeneralCarrierAbstractRowSystem.system_sharedPairAlternating
      Q.carrierPattern Q.boundaryIndexing hcentersSource hpointsSource
        hfirstPointFirstSource hsecondPointFirstSource
        hfirstPointSecondSource hsecondPointSecondSource
  simpa [boundaryIndexing, firstCenterSource, secondCenterSource,
    firstPointSource, secondPointSource] using hsource

end Balanced555SourceConfiguration

end ATailFrontierLiveClosure
end Problem97
