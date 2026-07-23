/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RobustCompletionRadiusChoice
import UniqueFourEqualRadiusTerminal
import UniqueFourTwoCompletionRowPlacement

/-!
# Provenance-preserving robust inputs for exact-four curvature

This file keeps the two robust outputs of the global minimal-deletion theorem
separate.  In the collision arm the completion rows are chosen from the actual
ambient radius class of cardinality at least five.  In the packed-core arm the
two rows are actual shells indexed by two members of the minimal deletion core.

The structures retain the protected deletion set, strict physical cap,
fixed-system omission, and (on the packed arm) cap-complement packing.  They do
not assert the three cyclic gap inequalities required by
`TwoCompletionRowMiddleArcPlacement`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourRobustProvenanceCurvatureScratch

open ATAILStageOneMinimalDeletionCore
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourGlobalCouplingScratch
open ATailUniqueFourEqualRadiusTerminalScratch
open ATailUniqueFourLateChoiceTerminalScratch
open ATailUniqueFourRobustCompletionRadiusChoiceScratch
open ATailUniqueFourThreeRowOccurrenceScratch

attribute [local instance] Classical.propDecidable

/-- A radius class with two members has positive radius. -/
private theorem selectedClass_radius_pos_of_two_le
    {A : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (htwo : 2 ≤ (SelectedClass A center radius).card) :
    0 < radius := by
  have hnonempty : (SelectedClass A center radius).Nonempty :=
    Finset.card_pos.mp (by omega)
  rcases hnonempty with ⟨x, hx⟩
  have hradiusNonneg : 0 ≤ radius := by
    rw [← (mem_selectedClass.mp hx).2]
    exact dist_nonneg
  apply lt_of_le_of_ne hradiusNonneg
  intro hradiusZero
  have hone : (SelectedClass A center radius).card ≤ 1 := by
    apply Finset.card_le_one.mpr
    intro x hx y hy
    have hxCenter : x = center := by
      apply dist_eq_zero.mp
      simpa [dist_comm, hradiusZero] using (mem_selectedClass.mp hx).2
    have hyCenter : y = center := by
      apply dist_eq_zero.mp
      simpa [dist_comm, hradiusZero] using (mem_selectedClass.mp hy).2
    exact hxCenter.trans hyCenter.symm
  omega

/-- The collision branch with its actual five-point ambient class and two
independently selectable four-subsets retained. -/
structure CollisionCurvatureIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (Q : ExactTwoStrictHitDistribution R) : Type where
  fixed : FixedImageTwoRowIngress R Q
  center : ℝ²
  center_mem_A : center ∈ D.A
  capIndex : Fin 3
  center_mem_capInterior : center ∈ S.capInteriorByIndex capIndex
  deleted : Finset ℝ²
  deleted_nonempty : deleted.Nonempty
  deleted_subset_protected : deleted ⊆ protectedDeletionSet R
  blocked_after_deleted :
    ¬ HasNEquidistantPointsAt 4 (D.A \ deleted) center
  restored_after_each_deletion :
    ∀ source ∈ deleted,
      HasNEquidistantPointsAt 4 (D.A \ (deleted.erase source)) center
  source : ℝ²
  source_mem_deleted : source ∈ deleted
  partner : ℝ²
  partner_mem_deleted : partner ∈ deleted
  source_ne_partner : source ≠ partner
  source_partner_coRadial : dist center source = dist center partner
  robust : FullyDeletionRobustAt D center
  omitted_from_late_system :
    ∀ z : ℝ², ∀ hz : z ∈ D.A,
      (lateFirstApexSystem R).centerAt z hz ≠ center
  fullClass_card_ge_five :
    5 ≤ (SelectedClass D.A center (dist center source)).card
  leftCompletionRow : SelectedFourClass D.A center
  rightCompletionRow : SelectedFourClass D.A center
  leftCompletionRow_radius :
    leftCompletionRow.radius = dist center source
  rightCompletionRow_radius :
    rightCompletionRow.radius = dist center source
  completion_supports_ne :
    leftCompletionRow.support ≠ rightCompletionRow.support

namespace CollisionCurvatureIngress

/-- The actual collision class has at most two points in the strict center's
closed physical cap.  This uses the complete ambient class, not merely the two
chosen four-subsets. -/
theorem fullClass_inter_centerCap_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : CollisionCurvatureIngress R Q) :
    (SelectedClass D.A P.center (dist P.center P.source) ∩
      S.capByIndex P.capIndex).card ≤ 2 := by
  apply selectedClass_inter_capByIndex_card_le_two
    S D.convex P.capIndex
    (S.capInteriorByIndex_subset_capByIndex P.capIndex
      P.center_mem_capInterior)
    (selectedClass_radius_pos_of_two_le
      (A := D.A) (center := P.center)
      (radius := dist P.center P.source) (by
        exact le_trans (by omega) P.fullClass_card_ge_five))
  exact le_trans (by omega) P.fullClass_card_ge_five

/-- Rebased omission makes the collision center genuinely distinct from the
first fixed-image row center. -/
theorem center_ne_fixed_center₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : CollisionCurvatureIngress R Q) :
    P.center ≠ P.fixed.center₁.1 := by
  exact (P.omitted_from_late_system
    P.fixed.source₁.1 P.fixed.source₁.2).symm

/-- Rebased omission makes the collision center genuinely distinct from the
second fixed-image row center. -/
theorem center_ne_fixed_center₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : CollisionCurvatureIngress R Q) :
    P.center ≠ P.fixed.center₂.1 := by
  exact (P.omitted_from_late_system
    P.fixed.source₂.1 P.fixed.source₂.2).symm

end CollisionCurvatureIngress

/-- The nontrivial minimal-core branch with two actual, support-disjoint core
shells and the quantitative cap-complement packing bound retained. -/
structure PackedCoreCurvatureIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (Q : ExactTwoStrictHitDistribution R) : Type where
  fixed : FixedImageTwoRowIngress R Q
  center : ℝ²
  center_mem_A : center ∈ D.A
  capIndex : Fin 3
  center_mem_capInterior : center ∈ S.capInteriorByIndex capIndex
  deleted : Finset ℝ²
  deleted_nonempty : deleted.Nonempty
  deleted_subset_protected : deleted ⊆ protectedDeletionSet R
  blocked_after_deleted :
    ¬ HasNEquidistantPointsAt 4 (D.A \ deleted) center
  restored_after_each_deletion :
    ∀ source ∈ deleted,
      HasNEquidistantPointsAt 4 (D.A \ (deleted.erase source)) center
  core : MinimalDeletionCore D.A deleted center
  deleted_card_ge_two : 2 ≤ deleted.card
  robust : FullyDeletionRobustAt D center
  omitted_from_late_system :
    ∀ z : ℝ², ∀ hz : z ∈ D.A,
      (lateFirstApexSystem R).centerAt z hz ≠ center
  capComplement_packing :
    2 * deleted.card ≤ (D.A \ S.capByIndex capIndex).card
  leftSource : {x : ℝ² // x ∈ deleted}
  rightSource : {x : ℝ² // x ∈ deleted}
  sources_ne : leftSource ≠ rightSource

namespace PackedCoreCurvatureIngress

/-- Rebased omission makes the packed-core center genuinely distinct from the
first fixed-image row center. -/
theorem center_ne_fixed_center₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : PackedCoreCurvatureIngress R Q) :
    P.center ≠ P.fixed.center₁.1 := by
  exact (P.omitted_from_late_system
    P.fixed.source₁.1 P.fixed.source₁.2).symm

/-- Rebased omission makes the packed-core center genuinely distinct from the
second fixed-image row center. -/
theorem center_ne_fixed_center₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : PackedCoreCurvatureIngress R Q) :
    P.center ≠ P.fixed.center₂.1 := by
  exact (P.omitted_from_late_system
    P.fixed.source₂.1 P.fixed.source₂.2).symm

/-- The left completion row is an actual shell of the retained minimal core. -/
noncomputable def leftCompletionRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : PackedCoreCurvatureIngress R Q) :
    SelectedFourClass D.A P.center :=
  (P.core.shellAt P.leftSource).toSelectedFourClass

/-- The right completion row is an actual shell of the retained minimal core. -/
noncomputable def rightCompletionRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : PackedCoreCurvatureIngress R Q) :
    SelectedFourClass D.A P.center :=
  (P.core.shellAt P.rightSource).toSelectedFourClass

/-- The two retained completion rows are support-disjoint for the source-level
reason supplied by the minimal core, not by an arbitrary radius choice. -/
theorem completionRows_supports_disjoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : PackedCoreCurvatureIngress R Q) :
    Disjoint P.leftCompletionRow.support P.rightCompletionRow.support := by
  simpa [leftCompletionRow, rightCompletionRow,
    CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass] using
      P.core.supports_pairwise_disjoint
        P.leftSource P.rightSource P.sources_ne

/-- The left actual core shell obeys the checked two-hit bound in the fresh
center's physical cap. -/
theorem leftCompletionRow_inter_centerCap_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : PackedCoreCurvatureIngress R Q) :
    (P.leftCompletionRow.support ∩ S.capByIndex P.capIndex).card ≤ 2 := by
  exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    S D.convex P.capIndex P.leftCompletionRow
      (S.capInteriorByIndex_subset_capByIndex P.capIndex
        P.center_mem_capInterior)

/-- The right actual core shell obeys the checked two-hit bound in the fresh
center's physical cap. -/
theorem rightCompletionRow_inter_centerCap_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {Q : ExactTwoStrictHitDistribution R}
    (P : PackedCoreCurvatureIngress R Q) :
    (P.rightCompletionRow.support ∩ S.capByIndex P.capIndex).card ≤ 2 := by
  exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    S D.convex P.capIndex P.rightCompletionRow
      (S.capInteriorByIndex_subset_capByIndex P.capIndex
        P.center_mem_capInterior)

end PackedCoreCurvatureIngress

/-- The singleton output is passed through unchanged.  It is deliberately not
used by this robust-arm lane. -/
structure SingletonCorePassThrough
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type where
  center : ℝ²
  center_mem_A : center ∈ D.A
  capIndex : Fin 3
  center_mem_capInterior : center ∈ S.capInteriorByIndex capIndex
  deleted : Finset ℝ²
  deleted_nonempty : deleted.Nonempty
  deleted_subset_protected : deleted ⊆ protectedDeletionSet R
  blocked_after_deleted :
    ¬ HasNEquidistantPointsAt 4 (D.A \ deleted) center
  restored_after_each_deletion :
    ∀ source ∈ deleted,
      HasNEquidistantPointsAt 4 (D.A \ (deleted.erase source)) center
  core : MinimalDeletionCore D.A deleted center
  deleted_card_eq_one : deleted.card = 1

/-- Provenance-preserving source split.  In particular, the collision and
packed branches do not pass through `StrictCapRobustCompletionChoice`, which
forgets the witnesses distinguishing the two arms. -/
theorem exists_collisionCurvatureIngress_or_singleton_or_packedCoreCurvatureIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (Q : ExactTwoStrictHitDistribution R) :
    Nonempty (CollisionCurvatureIngress R Q) ∨
      Nonempty (SingletonCorePassThrough R) ∨
      Nonempty (PackedCoreCurvatureIngress R Q) := by
  classical
  rcases exists_fixedImageTwoRowIngress R Q with ⟨fixed⟩
  let Rlate := lateFirstApexResidual R
  rcases exists_strictCap_collision_or_singletonCore_or_packedCore Rlate with
    ⟨center, hcenterA, capIndex, hcenterCap, deleted, hdeletedNe,
      hdeletedSub, hblocked, hrestored, hcollision | hsingleton | hpacked⟩
  · rcases hcollision with
      ⟨source, hsource, partner, hpartner, hne, heq, hrobust, homitted⟩
    have hprotectedSub : protectedDeletionSet Rlate ⊆ D.A := by
      intro x hx
      rcases Finset.mem_union.mp hx with hxClass | hxVertex
      · exact (mem_selectedClass.mp hxClass).1
      · exact S.triangle.verts_subset hxVertex
    have hfive :
        5 ≤ (SelectedClass D.A center (dist center source)).card :=
      five_le_selectedClass_of_minimalDeletion_collision
        (hdeletedSub.trans hprotectedSub) hsource hpartner hne heq
        (hrestored source hsource) hblocked
    have hradius : 0 < dist center source :=
      selectedClass_radius_pos_of_two_le
        (A := D.A) (center := center) (radius := dist center source)
        (by omega)
    rcases exists_two_supportDistinct_selectedFourClasses_of_five_le
        hradius hfive with
      ⟨leftRow, rightRow, hleftRadius, hrightRadius, hsupports⟩
    exact Or.inl ⟨{
      fixed := fixed
      center := center
      center_mem_A := hcenterA
      capIndex := capIndex
      center_mem_capInterior := hcenterCap
      deleted := deleted
      deleted_nonempty := hdeletedNe
      deleted_subset_protected := by
        simpa [Rlate, protectedDeletionSet] using hdeletedSub
      blocked_after_deleted := hblocked
      restored_after_each_deletion := hrestored
      source := source
      source_mem_deleted := hsource
      partner := partner
      partner_mem_deleted := hpartner
      source_ne_partner := hne
      source_partner_coRadial := heq
      robust := hrobust
      omitted_from_late_system := homitted
      fullClass_card_ge_five := hfive
      leftCompletionRow := leftRow
      rightCompletionRow := rightRow
      leftCompletionRow_radius := hleftRadius
      rightCompletionRow_radius := hrightRadius
      completion_supports_ne := hsupports
    }⟩
  · rcases hsingleton with ⟨⟨core⟩, hcard⟩
    exact Or.inr (Or.inl ⟨{
      center := center
      center_mem_A := hcenterA
      capIndex := capIndex
      center_mem_capInterior := hcenterCap
      deleted := deleted
      deleted_nonempty := hdeletedNe
      deleted_subset_protected := by
        simpa [Rlate, protectedDeletionSet] using hdeletedSub
      blocked_after_deleted := hblocked
      restored_after_each_deletion := hrestored
      core := core
      deleted_card_eq_one := hcard
    }⟩)
  · rcases hpacked with
      ⟨⟨core⟩, hcard, hrobust, homitted, hpacking⟩
    have hone : 1 < deleted.card := by omega
    rcases Finset.one_lt_card.mp hone with
      ⟨leftSource, hleftSource, rightSource, hrightSource, hsources⟩
    let left : {x : ℝ² // x ∈ deleted} :=
      ⟨leftSource, hleftSource⟩
    let right : {x : ℝ² // x ∈ deleted} :=
      ⟨rightSource, hrightSource⟩
    have hlr : left ≠ right := by
      intro h
      exact hsources (congrArg Subtype.val h)
    exact Or.inr (Or.inr ⟨{
      fixed := fixed
      center := center
      center_mem_A := hcenterA
      capIndex := capIndex
      center_mem_capInterior := hcenterCap
      deleted := deleted
      deleted_nonempty := hdeletedNe
      deleted_subset_protected := by
        simpa [Rlate, protectedDeletionSet] using hdeletedSub
      blocked_after_deleted := hblocked
      restored_after_each_deletion := hrestored
      core := core
      deleted_card_ge_two := hcard
      robust := hrobust
      omitted_from_late_system := homitted
      capComplement_packing := hpacking
      leftSource := left
      rightSource := right
      sources_ne := hlr
    }⟩)

#print axioms
  CollisionCurvatureIngress.fullClass_inter_centerCap_card_le_two
#print axioms
  PackedCoreCurvatureIngress.completionRows_supports_disjoint
#print axioms
  PackedCoreCurvatureIngress.leftCompletionRow_inter_centerCap_card_le_two
#print axioms
  exists_collisionCurvatureIngress_or_singleton_or_packedCoreCurvatureIngress

end ATailUniqueFourRobustProvenanceCurvatureScratch
end Problem97
