/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourClassCapDistribution
import UniqueFourStrictPairMinimality
import SelectedFourClassCurvature
import NoM44SupportLocalization

/-!
# Exact-four aligned-interior closure audit

The source `AlignedInteriorFrontier` retains the reselected strict pair, the
three-hit premise, and the rebased exact-four residual.  This file extracts
the strongest unconditional two-apex row surface:

* the complete first-apex exact-four row has at least three strict-cap hits;
* a selected second-apex row survives deletion of the aligned pair and hence
  omits both aligned points;
* the second row meets the strict part of the first row in at most one point;
* both rows carry their transported shell-curvature inequalities in one
  common boundary chart; and
* every strict-pair minimal-deletion center is different from the second
  apex.

No row-overlap occurrence, disjoint-arc occurrence, or alternative M44 packet
is asserted.
-/

open scoped EuclideanGeometry Real BigOperators

namespace Problem97
namespace ATailUniqueFourAlignedInteriorClosureAuditScratch

open ATailCriticalPairFrontier
open ATailNoM44SupportLocalization
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourStrictPairMinimalityScratch
open ShellCurvatureRows
open ShellCurvatureRows.ShellBoundaryIndexing

attribute [local instance] Classical.propDecidable

/-- The complete exact-four class viewed as a selected first-apex row. -/
noncomputable def alignedFirstApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (_P : AlignedInteriorFrontier R) :
    SelectedFourClass D.A S.oppApex1 :=
  SelectedFourClass.ofSelectedClass (frontier_radius_pos F) R.class_card_eq_four

@[simp] theorem alignedFirstApexRow_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : AlignedInteriorFrontier R) :
    (alignedFirstApexRow P).support =
      SelectedClass D.A S.oppApex1 radius := rfl

/-- Three strict interior points force the first opposite closed cap to have
at least five vertices. -/
theorem alignedFirstOppositeCap_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : AlignedInteriorFrontier R) :
    5 ≤ (S.capByIndex S.oppIndex1).card := by
  have hcap := ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
    S S.oppIndex1
  have hinter :
      3 ≤ (S.capInteriorByIndex S.oppIndex1).card := by
    exact P.three_strict_hits.trans (Finset.card_le_card Finset.inter_subset_right)
  omega

/-- On the three-hit arm the displayed surplus packet is already not M44;
the global `noM44` field has no further local support-incidence consequence. -/
theorem alignedFixedPacket_not_isM44
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : AlignedInteriorFrontier R) :
    ¬ S.IsM44 :=
  not_isM44_of_nonSurplus_cap_card_ge_five S S.oppIndex1
    S.surplusIdx_ne_oppIndex1.symm
      (alignedFirstOppositeCap_card_ge_five P)

private theorem nonempty_selectedFourClass_of_local_K4
    {A : Finset ℝ²} {center : ℝ²}
    (hK4 : HasNEquidistantPointsAt 4 A center) :
    Nonempty (SelectedFourClass A center) := by
  classical
  rcases hK4 with ⟨radius, hradius, hfour⟩
  rcases Finset.exists_subset_card_eq hfour with ⟨support, hsupport, hcard⟩
  exact ⟨{
    support := support
    support_subset_A := by
      intro x hx
      exact (Finset.mem_filter.mp (hsupport hx)).1
    support_card := hcard
    radius := radius
    radius_pos := hradius
    support_eq_radius := by
      intro x hx
      exact (Finset.mem_filter.mp (hsupport hx)).2
    center_not_mem := by
      intro hcenter
      have hdist := (Finset.mem_filter.mp (hsupport hcenter)).2
      have hzero : radius = 0 := by simpa using hdist.symm
      exact (ne_of_gt hradius) hzero }⟩

private def ambientSelectedFourClassOfDoubleErased
    {A : Finset ℝ²} {q w center : ℝ²}
    (K : SelectedFourClass ((A.erase q).erase w) center) :
    SelectedFourClass A center where
  support := K.support
  support_subset_A := by
    intro x hx
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp (K.support_subset_A hx)).2).2
  support_card := K.support_card
  radius := K.radius
  radius_pos := K.radius_pos
  support_eq_radius := K.support_eq_radius
  center_not_mem := K.center_not_mem

/-- The exact two-apex row surface retained by the aligned branch. -/
structure AlignedApexRowSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : AlignedInteriorFrontier R) : Type where
  secondApexRow : SelectedFourClass D.A S.oppApex2
  aligned_q_not_mem_second : P.frontier.pair.q ∉ secondApexRow.support
  aligned_w_not_mem_second : P.frontier.pair.w ∉ secondApexRow.support
  second_inter_firstStrict_card_le_one :
    (secondApexRow.support ∩
      (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1)).card ≤ 1
  first_second_inter_card_le_two :
    ((alignedFirstApexRow P).support ∩ secondApexRow.support).card ≤ 2

private theorem strictFirstClass_subset_firstApexMarginal
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (radius : ℝ) :
    SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1 ⊆
      (D.A.filter fun x ↦ dist x S.oppApex1 = radius) \ S.surplusCap := by
  intro x hx
  rcases Finset.mem_inter.mp hx with ⟨hxClass, hxInterior⟩
  rcases mem_selectedClass.mp hxClass with ⟨hxA, hxRadius⟩
  refine Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr ⟨hxA, ?_⟩, ?_⟩
  · simpa [dist_comm] using hxRadius
  · have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hxInterior
      S.surplusIdx_ne_oppIndex1.symm
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi] using hnot

private theorem oppApex1_ne_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v12_ne

/-- The aligned pair's double-deletion witness yields an ambient selected row
at the second apex which omits both aligned points. -/
theorem nonempty_alignedApexRowSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : AlignedInteriorFrontier R) :
    Nonempty (AlignedApexRowSurface P) := by
  classical
  let q := P.frontier.pair.q
  let w := P.frontier.pair.w
  rcases nonempty_selectedFourClass_of_local_K4
      P.frontier.secondApexDouble with ⟨erasedRow⟩
  let secondRow : SelectedFourClass D.A S.oppApex2 :=
    ambientSelectedFourClassOfDoubleErased erasedRow
  have hqNot : q ∉ secondRow.support := by
    intro hq
    have hqErase := erasedRow.support_subset_A hq
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp hqErase).2).1 rfl
  have hwNot : w ∉ secondRow.support := by
    intro hw
    have hwErase := erasedRow.support_subset_A hw
    exact (Finset.mem_erase.mp hwErase).1 rfl
  have hstrictSub := strictFirstClass_subset_firstApexMarginal S radius
  have hinterSub :
      secondRow.support ∩
          (SelectedClass D.A S.oppApex1 radius ∩
            S.capInteriorByIndex S.oppIndex1) ⊆
        secondRow.support ∩
          ((D.A.filter fun x ↦ dist x S.oppApex1 = radius) \ S.surplusCap) := by
    intro x hx
    exact Finset.mem_inter.mpr
      ⟨(Finset.mem_inter.mp hx).1, hstrictSub (Finset.mem_inter.mp hx).2⟩
  have hinterLe :
      (secondRow.support ∩
        (SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1)).card ≤ 1 :=
    (Finset.card_le_card hinterSub).trans
      (secondApexFourClass_inter_firstApexMarginal_card_le_one
        D S radius secondRow)
  have hapicesNe : S.oppApex1 ≠ S.oppApex2 := by
    exact oppApex1_ne_oppApex2 S
  refine ⟨{
    secondApexRow := secondRow
    aligned_q_not_mem_second := by simpa [q] using hqNot
    aligned_w_not_mem_second := by simpa [w] using hwNot
    second_inter_firstStrict_card_le_one := hinterLe
    first_second_inter_card_le_two :=
      SelectedFourClass.inter_card_le_two
        (alignedFirstApexRow P) secondRow hapicesNe }⟩

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) : S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) : S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- Both source-proved rows carry their two outer quarter-turn inequalities in
one common global boundary lift.  No separation between the four arcs follows
from the aligned packet. -/
theorem AlignedApexRowSurface.exists_commonBoundary_curvature
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedApexRowSurface P) :
    ∃ B : ShellBoundaryIndexing D.A,
      B.HasGlobalSelectedQuarterTurnArcs
          (alignedFirstApexRow P) (oppApex1_mem_A S) ∧
        B.HasGlobalSelectedQuarterTurnArcs Q.secondApexRow (oppApex2_mem_A S) := by
  have hnoncoll : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    ConvexIndep.not_collinear_of_card_ge_three D.convex (by
      have hcard := D.card_gt_four
      omega)
  rcases exists_shellBoundaryIndexing D.convex hnoncoll with ⟨B⟩
  exact ⟨B,
    B.selectedFourClass_has_globalSelectedQuarterTurnArcs
      (alignedFirstApexRow P) (oppApex1_mem_A S),
    B.selectedFourClass_has_globalSelectedQuarterTurnArcs
      Q.secondApexRow (oppApex2_mem_A S)⟩

/-- The aligned second-apex double-deletion witness excludes the second apex
as the blocker selected by strict-pair minimality. -/
theorem strictPairMinimalDeletion_center_ne_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : AlignedInteriorFrontier R)
    (M : StrictPairMinimalDeletion P.residual) :
    M.center ≠ S.oppApex2 := by
  let q := P.frontier.pair.q
  let w := P.frontier.pair.w
  have hdeletedSub : M.deleted ⊆ ({q, w} : Finset ℝ²) := by
    simpa [q, w, AlignedInteriorFrontier.residual] using M.deleted_subset_pair
  have herasedSub :
      (D.A.erase q).erase w ⊆ D.A \ M.deleted := by
    intro x hx
    rcases Finset.mem_erase.mp hx with ⟨hxw, hxEraseQ⟩
    rcases Finset.mem_erase.mp hxEraseQ with ⟨hxq, hxA⟩
    refine Finset.mem_sdiff.mpr ⟨hxA, ?_⟩
    intro hxDeleted
    have hxPair := hdeletedSub hxDeleted
    simp only [Finset.mem_insert, Finset.mem_singleton] at hxPair
    exact hxPair.elim hxq hxw
  have hsurvives :
      HasNEquidistantPointsAt 4 (D.A \ M.deleted) S.oppApex2 :=
    hasNEquidistantPointsAt_mono herasedSub P.frontier.secondApexDouble
  intro hcenter
  apply M.blocked
  simpa [hcenter] using hsurvives

#print axioms alignedFirstOppositeCap_card_ge_five
#print axioms alignedFixedPacket_not_isM44
#print axioms nonempty_alignedApexRowSurface
#print axioms AlignedApexRowSurface.exists_commonBoundary_curvature
#print axioms strictPairMinimalDeletion_center_ne_secondApex

end ATailUniqueFourAlignedInteriorClosureAuditScratch
end Problem97
