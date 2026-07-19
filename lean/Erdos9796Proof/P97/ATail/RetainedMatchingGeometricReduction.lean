/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapInteriorRadiusCounting
import Erdos9796Proof.P97.ATail.CriticalFiberRetainedRadiusSelector

/-!
# Geometric reduction of the retained blocker-matching arm

The retained-radius selector leaves an injective actual blocker map as one
of its two outcomes.  This module consumes the live MEC/cap geometry, the
complete retained radius filter, the source-indexed critical shells, and the
parent's no-`IsM44` hypothesis.

It produces two actual retained-radius sources in the strict first opposite
cap interior, with distinct blockers and a directed cross omission.  Exact
critical-shell semantics turn that omission into cross-deletion survival at
one blocker.  Independently, no-`IsM44` forces at least one non-surplus
opposite cap to have cardinality at least five.

This is a source-clean reduction, not a contradiction: a later consumer must
couple the directed omission with cap order and the complete shell filters.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedMatchingGeometricReduction

open ATailCriticalPairFrontier
open ATailCriticalFiberRetainedRadiusSelector
open ATailCommonDeletionTwoCenter
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem frontierRadius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) :
    0 < radius := by
  have hqOff : F.pair.q ∉ S.surplusCap :=
    (Finset.mem_sdiff.mp F.pair.q_mem_marginal).2
  have hqNe : F.pair.q ≠ S.oppApex1 := by
    intro h
    apply hqOff
    rw [h]
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
    · simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3
  have hdist : 0 < dist F.pair.q S.oppApex1 := dist_pos.mpr hqNe
  have hqRadius : dist F.pair.q S.oppApex1 = radius :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  simpa only [hqRadius] using hdist

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- Two distinct retained-radius sources with mutual cross membership have
the same actual blocker. The first apex and the two candidate blockers are
three carrier points on the perpendicular bisector of the source pair. -/
theorem blocker_centers_eq_of_mutual_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {x y : ℝ²} (hxA : x ∈ D.A) (hyA : y ∈ D.A) (hxy : x ≠ y)
    (hxRadius : x ∈ SelectedClass D.A S.oppApex1 radius)
    (hyRadius : y ∈ SelectedClass D.A S.oppApex1 radius)
    (hyx : y ∈ (H.selectedAt x hxA).toCriticalFourShell.support)
    (hxy' : x ∈ (H.selectedAt y hyA).toCriticalFourShell.support) :
    H.centerAt x hxA = H.centerAt y hyA := by
  classical
  let cx := H.centerAt x hxA
  let cy := H.centerAt y hyA
  let o := S.oppApex1
  have hoA : o ∈ D.A := by simpa [o] using oppApex1_mem_A S
  have hcxA : cx ∈ D.A := by
    simpa [cx, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨x, hxA⟩).2
  have hcyA : cy ∈ D.A := by
    simpa [cy, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨y, hyA⟩).2
  have hcx_ne_o : cx ≠ o := by
    simpa [cx, o] using R.actualBlocker_ne_firstApex x hxA
  have hcy_ne_o : cy ≠ o := by
    simpa [cy, o] using R.actualBlocker_ne_firstApex y hyA
  by_contra hcxcy
  have hoEq : dist o x = dist o y :=
    (mem_selectedClass.mp hxRadius).2.trans
      (mem_selectedClass.mp hyRadius).2.symm
  have hcxEq : dist cx x = dist cx y := by
    exact
      (H.selectedAt x hxA).toCriticalFourShell.support_eq_radius
        x (H.selectedAt x hxA).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt x hxA).toCriticalFourShell.support_eq_radius y hyx).symm
  have hcyEq : dist cy x = dist cy y := by
    exact
      (H.selectedAt y hyA).toCriticalFourShell.support_eq_radius x hxy'
      |>.trans
        ((H.selectedAt y hyA).toCriticalFourShell.support_eq_radius
          y (H.selectedAt y hyA).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex hxA hyA hxy
  have hoFilter :
      o ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have hcxFilter :
      cx ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcxA, hcxEq⟩
  have hcyFilter :
      cy ∈ D.A.filter (fun z => dist z x = dist z y) :=
    Finset.mem_filter.mpr ⟨hcyA, hcyEq⟩
  have hthree :
      2 < (D.A.filter (fun z => dist z x = dist z y)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, cx, hcxFilter, cy, hcyFilter,
      hcx_ne_o.symm, hcy_ne_o.symm, hcxcy⟩
  omega

/-- Live-geometric reduction of the blocker-matching arm. The two sources
lie in the actual strict opposite-cap interior and complete retained radius
filter. Their blockers are distinct, and in at least one direction deleting
the partner preserves K4 at the source's blocker. -/
structure RetainedInteriorDirectedOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (_R : FrontierCommonDeletionParentResidual F) : Type where
  source₁ : ℝ²
  source₂ : ℝ²
  source₁_mem_A : source₁ ∈ D.A
  source₂_mem_A : source₂ ∈ D.A
  sources_ne : source₁ ≠ source₂
  source₁_mem_radius :
    source₁ ∈ SelectedClass D.A S.oppApex1 radius
  source₂_mem_radius :
    source₂ ∈ SelectedClass D.A S.oppApex1 radius
  source₁_mem_capInterior : source₁ ∈ S.capInteriorByIndex S.oppIndex1
  source₂_mem_capInterior : source₂ ∈ S.capInteriorByIndex S.oppIndex1
  blockers_ne :
    H.centerAt source₁ source₁_mem_A ≠
      H.centerAt source₂ source₂_mem_A
  directed_omission :
    (source₂ ∉
        (H.selectedAt source₁ source₁_mem_A).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4 (D.A.erase source₂)
        (H.centerAt source₁ source₁_mem_A)) ∨
    (source₁ ∉
        (H.selectedAt source₂ source₂_mem_A).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4 (D.A.erase source₁)
        (H.centerAt source₂ source₂_mem_A))

/-- The common-deletion packet produced by either orientation of a retained
interior directed omission. -/
inductive RetainedInteriorCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorDirectedOmission R) : Type
  | deleteSecond
      (packet : CommonDeletionTwoCenterPacket D H P.source₂ S.oppApex1
        (H.centerAt P.source₁ P.source₁_mem_A))
  | deleteFirst
      (packet : CommonDeletionTwoCenterPacket D H P.source₁ S.oppApex1
        (H.centerAt P.source₂ P.source₂_mem_A))

/-- Each directed-omission arm is already a common deletion at the first
apex and the surviving source's actual blocker. -/
theorem nonempty_retainedInteriorCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorDirectedOmission R) :
    Nonempty (RetainedInteriorCommonDeletion P) := by
  have hfirstRobust := R.firstApexFullyDeletionRobust
  rcases P.directed_omission with hdeleteSecond | hdeleteFirst
  · have hblockerA :
        H.centerAt P.source₁ P.source₁_mem_A ∈ D.A := by
      simpa [CriticalShellSystem.blockerVertex] using
        (H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩).2
    rcases nonempty_commonDeletionTwoCenterPacket H
        P.source₂_mem_A (oppApex1_mem_A S) hblockerA
        (R.actualBlocker_ne_firstApex
          P.source₁ P.source₁_mem_A).symm
        (hfirstRobust.survives P.source₂ P.source₂_mem_A)
        hdeleteSecond.2 with ⟨packet⟩
    exact ⟨RetainedInteriorCommonDeletion.deleteSecond packet⟩
  · have hblockerA :
        H.centerAt P.source₂ P.source₂_mem_A ∈ D.A := by
      simpa [CriticalShellSystem.blockerVertex] using
        (H.blockerVertex ⟨P.source₂, P.source₂_mem_A⟩).2
    rcases nonempty_commonDeletionTwoCenterPacket H
        P.source₁_mem_A (oppApex1_mem_A S) hblockerA
        (R.actualBlocker_ne_firstApex
          P.source₂ P.source₂_mem_A).symm
        (hfirstRobust.survives P.source₁ P.source₁_mem_A)
        hdeleteFirst.2 with ⟨packet⟩
    exact ⟨RetainedInteriorCommonDeletion.deleteFirst packet⟩

/-- Blocker injectivity on the complete retained class produces a cap-local
directed omission and the corresponding cross-deletion survivor. -/
theorem exists_retainedInteriorDirectedOmission_of_matching
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (M : RetainedRadiusBlockerMatching R) :
    Nonempty (RetainedInteriorDirectedOmission R) := by
  classical
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 :=
    oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
  have htwo :
      2 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card := by
    rw [hcenter]
    exact S.selectedClass_capInteriorByIndex_card_ge_two D.convex S.oppIndex1
      (frontierRadius_pos R) (by simpa [hcenter] using
        R.frontierRadius_class_card_ge_four)
  have hone :
      1 < (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, y, hy, hxy⟩
  rcases Finset.mem_inter.mp hx with ⟨hxRadius, hxInterior⟩
  rcases Finset.mem_inter.mp hy with ⟨hyRadius, hyInterior⟩
  have hxA : x ∈ D.A := (mem_selectedClass.mp hxRadius).1
  have hyA : y ∈ D.A := (mem_selectedClass.mp hyRadius).1
  let sx : CriticalShellSystem.CarrierVertex D.A := ⟨x, hxA⟩
  let sy : CriticalShellSystem.CarrierVertex D.A := ⟨y, hyA⟩
  let rx : RetainedRadiusSource (S := S) radius := ⟨sx, hxRadius⟩
  let ry : RetainedRadiusSource (S := S) radius := ⟨sy, hyRadius⟩
  have hblockerVertices_ne : H.blockerVertex sx ≠ H.blockerVertex sy := by
    intro heq
    have hrxy : rx = ry := by
      apply M.injective
      simpa [retainedRadiusBlocker, rx, ry, sx, sy] using heq
    exact hxy
      (congrArg
        (fun z : RetainedRadiusSource (S := S) radius => z.1.1) hrxy)
  have hblockers_ne : H.centerAt x hxA ≠ H.centerAt y hyA := by
    intro heq
    apply hblockerVertices_ne
    exact Subtype.ext (by
      simpa [CriticalShellSystem.blockerVertex, sx, sy] using heq)
  refine ⟨{
    source₁ := x
    source₂ := y
    source₁_mem_A := hxA
    source₂_mem_A := hyA
    sources_ne := hxy
    source₁_mem_radius := hxRadius
    source₂_mem_radius := hyRadius
    source₁_mem_capInterior := hxInterior
    source₂_mem_capInterior := hyInterior
    blockers_ne := hblockers_ne
    directed_omission := ?_ }⟩
  by_cases hyx :
      y ∈ (H.selectedAt x hxA).toCriticalFourShell.support
  · have hxyOutside :
        x ∉ (H.selectedAt y hyA).toCriticalFourShell.support := by
      intro hxy'
      exact hblockers_ne
        (blocker_centers_eq_of_mutual_cross_membership R hxA hyA hxy
          hxRadius hyRadius hyx hxy')
    exact Or.inr ⟨hxyOutside,
      (cross_deletion_survives_iff_not_mem_selected_support H hyA).mpr
        hxyOutside⟩
  · exact Or.inl ⟨hyx,
      (cross_deletion_survives_iff_not_mem_selected_support H hxA).mpr hyx⟩

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- The retained parent is not in the `(m,4,4)` regime, so at least one of
its two actual non-surplus opposite caps has cardinality at least five. -/
theorem oppositeLargeCap_disjunction_of_parent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    5 ≤ (S.capByIndex S.oppIndex1).card ∨
      5 ≤ (S.capByIndex S.oppIndex2).card := by
  rcases oppositeCaps_card_ge_four D S with ⟨hfirstFour, hsecondFour⟩
  by_cases hfirstFive : 5 ≤ (S.capByIndex S.oppIndex1).card
  · exact Or.inl hfirstFive
  · right
    by_contra hsecondNotFive
    have hfirstEq : (S.capByIndex S.oppIndex1).card = 4 := by omega
    have hsecondEq : (S.capByIndex S.oppIndex2).card = 4 := by omega
    apply R.noM44
    refine ⟨S, ?_⟩
    constructor
    · simpa [← capByIndex_oppIndex1_eq_oppCap1 S] using hfirstEq
    · simpa [← capByIndex_oppIndex2_eq_oppCap2 S] using hsecondEq

/-- Parent-facing packet combining the cap-local directed omission with the
cardinality force contributed by no-`IsM44`. -/
structure RetainedMatchingGeometricReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type where
  omission : RetainedInteriorDirectedOmission R
  commonDeletion : RetainedInteriorCommonDeletion omission
  oppositeLargeCap :
    5 ≤ (S.capByIndex S.oppIndex1).card ∨
      5 ≤ (S.capByIndex S.oppIndex2).card

/-- The injective blocker arm always reaches the geometric reduction. -/
theorem nonempty_retainedMatchingGeometricReduction
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (M : RetainedRadiusBlockerMatching R) :
    Nonempty (RetainedMatchingGeometricReduction R) := by
  rcases exists_retainedInteriorDirectedOmission_of_matching R M with ⟨P⟩
  rcases nonempty_retainedInteriorCommonDeletion P with ⟨commonDeletion⟩
  exact ⟨⟨P, commonDeletion, oppositeLargeCap_disjunction_of_parent R⟩⟩

end ATailRetainedMatchingGeometricReduction
end Problem97
