/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion

/-!
# A named-row good source for the card-at-least-thirteen two-radius branch

The generic robust-apex source producer retains an unspecified positive
second-apex radius.  The two-radius terminal needs a source tied to one of its
two named rows.  This module supplies that source directly from the eight
points in the two disjoint supports, without replacing either support by an
unrelated selected class.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCardGeThirteenTwoRadiusGoodSourceIngress

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailSurvivalCover
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- A good late-first-apex source whose physical point belongs to one of the
two named second-apex rows.  The retained frontier-deletion disjunction is the
one attached to this same source. -/
structure TwoRadiusNamedRowGoodSourceIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2) : Type where
  source : CarrierVertex D.A
  source_mem_namedRows :
    source.1 ∈ firstRow.support ∨ source.1 ∈ secondRow.support
  source_mem_good : source ∈ goodOutsideSources R
  actualBlocker_ne_secondApex :
    (lateFirstApexSystem R).centerAt source.1 source.2 ≠ S.oppApex2
  survives_frontier_deletion :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
        ((lateFirstApexSystem R).centerAt source.1 source.2)

/-- The two disjoint full four-rows contain a good source in their union.

At most four of their eight points lie in the first-apex class, by the two
circle intersection bounds, and at most two further outside sources are bad.
Thus one named-row point remains good. -/
theorem nonempty_twoRadiusNamedRowGoodSourceIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hdisjoint : Disjoint firstRow.support secondRow.support) :
    Nonempty (TwoRadiusNamedRowGoodSourceIngress R firstRow secondRow) := by
  classical
  let firstClass := SelectedClass D.A S.oppApex1 radius
  let candidates := firstRow.support ∪ secondRow.support
  let shared :=
    (firstClass ∩ firstRow.support) ∪
      (firstClass ∩ secondRow.support)
  let badPoints :=
    (badOutsideSources R).image fun source => source.1
  have hfirstFull :
      firstRow.support =
        SelectedClass D.A S.oppApex2 firstRow.radius := by
    have hsub :
        firstRow.support ⊆
          SelectedClass D.A S.oppApex2 firstRow.radius := by
      intro z hz
      exact mem_selectedClass.mpr
        ⟨firstRow.support_subset_A hz, firstRow.support_eq_radius z hz⟩
    apply Finset.eq_of_subset_of_card_le hsub
    have hsmall := hnoFive firstRow.radius firstRow.radius_pos
    rw [firstRow.support_card]
    omega
  have hsecondFull :
      secondRow.support =
        SelectedClass D.A S.oppApex2 secondRow.radius := by
    have hsub :
        secondRow.support ⊆
          SelectedClass D.A S.oppApex2 secondRow.radius := by
      intro z hz
      exact mem_selectedClass.mpr
        ⟨secondRow.support_subset_A hz, secondRow.support_eq_radius z hz⟩
    apply Finset.eq_of_subset_of_card_le hsub
    have hsmall := hnoFive secondRow.radius secondRow.radius_pos
    rw [secondRow.support_card]
    omega
  have hcandidates : 8 ≤ candidates.card := by
    dsimp only [candidates]
    rw [Finset.card_union_of_disjoint hdisjoint,
      firstRow.support_card, secondRow.support_card]
  have hshared : shared.card ≤ 4 := by
    have hfirst : (firstClass ∩ firstRow.support).card ≤ 2 := by
      rw [hfirstFull]
      simpa [firstClass] using
        firstSecondClass_inter_card_le_two
          (rho := firstRow.radius) R
    have hsecond : (firstClass ∩ secondRow.support).card ≤ 2 := by
      rw [hsecondFull]
      simpa [firstClass] using
        firstSecondClass_inter_card_le_two
          (rho := secondRow.radius) R
    have hunion :=
      Finset.card_union_le
        (firstClass ∩ firstRow.support)
        (firstClass ∩ secondRow.support)
    dsimp only [shared]
    omega
  have hbad : badPoints.card ≤ 2 := by
    calc
      badPoints.card = (badOutsideSources R).card :=
        Finset.card_image_of_injective _ Subtype.val_injective
      _ ≤ 2 := badOutsideSources_card_le_two R
  have hsmall :
      shared.card + badPoints.card < candidates.card := by
    omega
  obtain ⟨z, hzCandidates, hzShared, hzBad⟩ :=
    exists_mem_not_mem_pair_of_card_gt
      candidates shared badPoints hsmall
  have hzCases :
      z ∈ firstRow.support ∨ z ∈ secondRow.support :=
    Finset.mem_union.mp hzCandidates
  have hzFirst : z ∉ firstClass := by
    intro hz
    apply hzShared
    rcases hzCases with hzFirstRow | hzSecondRow
    · exact Finset.mem_union_left _
        (Finset.mem_inter.mpr ⟨hz, hzFirstRow⟩)
    · exact Finset.mem_union_right _
        (Finset.mem_inter.mpr ⟨hz, hzSecondRow⟩)
  have hzA : z ∈ D.A := by
    rcases hzCases with hzFirstRow | hzSecondRow
    · exact firstRow.support_subset_A hzFirstRow
    · exact secondRow.support_subset_A hzSecondRow
  let source : CarrierVertex D.A := ⟨z, hzA⟩
  have houtside : source ∈ outsideFirstApexFiber R :=
    mem_outsideFirstApexFiber_of_not_mem_firstClass R
      (by simpa [source, firstClass] using hzFirst)
  have hnotBad : source ∉ badOutsideSources R := by
    intro hsourceBad
    apply hzBad
    exact Finset.mem_image.mpr ⟨source, hsourceBad, rfl⟩
  have hgood : source ∈ goodOutsideSources R :=
    Finset.mem_sdiff.mpr ⟨houtside, hnotBad⟩
  exact ⟨{
    source := source
    source_mem_namedRows := by simpa [source] using hzCases
    source_mem_good := hgood
    actualBlocker_ne_secondApex :=
      surface.secondApex_robust.centerAt_ne
        (lateFirstApexSystem R) source.1 source.2
    survives_frontier_deletion :=
      goodOutsideSources_survives_frontier_pair R hgood }⟩

/-- Two distinct good sources anchored in the union of the same two named
second-apex rows. -/
structure TwoRadiusNamedRowsTwoGoodSourcesIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2) : Type where
  first : TwoRadiusNamedRowGoodSourceIngress R firstRow secondRow
  second : TwoRadiusNamedRowGoodSourceIngress R firstRow secondRow
  sources_ne : first.source ≠ second.source

/-- After removing at most four first-apex points and at most two bad outside
sources from the eight named-row points, at least two distinct good sources
remain. -/
theorem nonempty_twoRadiusNamedRowsTwoGoodSourcesIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hdisjoint : Disjoint firstRow.support secondRow.support) :
    Nonempty
      (TwoRadiusNamedRowsTwoGoodSourcesIngress R firstRow secondRow) := by
  classical
  let firstClass := SelectedClass D.A S.oppApex1 radius
  let candidates := firstRow.support ∪ secondRow.support
  let shared :=
    (firstClass ∩ firstRow.support) ∪
      (firstClass ∩ secondRow.support)
  let badPoints :=
    (badOutsideSources R).image fun source => source.1
  have hfirstFull :
      firstRow.support =
        SelectedClass D.A S.oppApex2 firstRow.radius := by
    have hsub :
        firstRow.support ⊆
          SelectedClass D.A S.oppApex2 firstRow.radius := by
      intro z hz
      exact mem_selectedClass.mpr
        ⟨firstRow.support_subset_A hz, firstRow.support_eq_radius z hz⟩
    apply Finset.eq_of_subset_of_card_le hsub
    have hsmall := hnoFive firstRow.radius firstRow.radius_pos
    rw [firstRow.support_card]
    omega
  have hsecondFull :
      secondRow.support =
        SelectedClass D.A S.oppApex2 secondRow.radius := by
    have hsub :
        secondRow.support ⊆
          SelectedClass D.A S.oppApex2 secondRow.radius := by
      intro z hz
      exact mem_selectedClass.mpr
        ⟨secondRow.support_subset_A hz, secondRow.support_eq_radius z hz⟩
    apply Finset.eq_of_subset_of_card_le hsub
    have hsmall := hnoFive secondRow.radius secondRow.radius_pos
    rw [secondRow.support_card]
    omega
  have hcandidates : 8 ≤ candidates.card := by
    dsimp only [candidates]
    rw [Finset.card_union_of_disjoint hdisjoint,
      firstRow.support_card, secondRow.support_card]
  have hshared : shared.card ≤ 4 := by
    have hfirst : (firstClass ∩ firstRow.support).card ≤ 2 := by
      rw [hfirstFull]
      simpa [firstClass] using
        firstSecondClass_inter_card_le_two
          (rho := firstRow.radius) R
    have hsecond : (firstClass ∩ secondRow.support).card ≤ 2 := by
      rw [hsecondFull]
      simpa [firstClass] using
        firstSecondClass_inter_card_le_two
          (rho := secondRow.radius) R
    have hunion :=
      Finset.card_union_le
        (firstClass ∩ firstRow.support)
        (firstClass ∩ secondRow.support)
    dsimp only [shared]
    omega
  have hbad : badPoints.card ≤ 2 := by
    calc
      badPoints.card = (badOutsideSources R).card :=
        Finset.card_image_of_injective _ Subtype.val_injective
      _ ≤ 2 := badOutsideSources_card_le_two R
  have hsmall :
      shared.card + badPoints.card + 1 < candidates.card := by
    omega
  obtain ⟨z, hzCandidates, hzShared, hzBad,
      w, hwCandidates, hwShared, hwBad, hwNeZ⟩ :=
    exists_two_mem_not_mem_pair_of_card_gt
      candidates shared badPoints hsmall
  have hzCases :
      z ∈ firstRow.support ∨ z ∈ secondRow.support :=
    Finset.mem_union.mp hzCandidates
  have hwCases :
      w ∈ firstRow.support ∨ w ∈ secondRow.support :=
    Finset.mem_union.mp hwCandidates
  have hzFirst : z ∉ firstClass := by
    intro hz
    apply hzShared
    rcases hzCases with hzFirstRow | hzSecondRow
    · exact Finset.mem_union_left _
        (Finset.mem_inter.mpr ⟨hz, hzFirstRow⟩)
    · exact Finset.mem_union_right _
        (Finset.mem_inter.mpr ⟨hz, hzSecondRow⟩)
  have hwFirst : w ∉ firstClass := by
    intro hw
    apply hwShared
    rcases hwCases with hwFirstRow | hwSecondRow
    · exact Finset.mem_union_left _
        (Finset.mem_inter.mpr ⟨hw, hwFirstRow⟩)
    · exact Finset.mem_union_right _
        (Finset.mem_inter.mpr ⟨hw, hwSecondRow⟩)
  have hzA : z ∈ D.A := by
    rcases hzCases with hzFirstRow | hzSecondRow
    · exact firstRow.support_subset_A hzFirstRow
    · exact secondRow.support_subset_A hzSecondRow
  have hwA : w ∈ D.A := by
    rcases hwCases with hwFirstRow | hwSecondRow
    · exact firstRow.support_subset_A hwFirstRow
    · exact secondRow.support_subset_A hwSecondRow
  let firstSource : CarrierVertex D.A := ⟨z, hzA⟩
  let secondSource : CarrierVertex D.A := ⟨w, hwA⟩
  have hfirstOutside : firstSource ∈ outsideFirstApexFiber R :=
    mem_outsideFirstApexFiber_of_not_mem_firstClass R
      (by simpa [firstSource, firstClass] using hzFirst)
  have hsecondOutside : secondSource ∈ outsideFirstApexFiber R :=
    mem_outsideFirstApexFiber_of_not_mem_firstClass R
      (by simpa [secondSource, firstClass] using hwFirst)
  have hfirstNotBad : firstSource ∉ badOutsideSources R := by
    intro hsourceBad
    apply hzBad
    exact Finset.mem_image.mpr ⟨firstSource, hsourceBad, rfl⟩
  have hsecondNotBad : secondSource ∉ badOutsideSources R := by
    intro hsourceBad
    apply hwBad
    exact Finset.mem_image.mpr ⟨secondSource, hsourceBad, rfl⟩
  have hfirstGood : firstSource ∈ goodOutsideSources R :=
    Finset.mem_sdiff.mpr ⟨hfirstOutside, hfirstNotBad⟩
  have hsecondGood : secondSource ∈ goodOutsideSources R :=
    Finset.mem_sdiff.mpr ⟨hsecondOutside, hsecondNotBad⟩
  let firstIngress :
      TwoRadiusNamedRowGoodSourceIngress R firstRow secondRow := {
    source := firstSource
    source_mem_namedRows := by simpa [firstSource] using hzCases
    source_mem_good := hfirstGood
    actualBlocker_ne_secondApex :=
      surface.secondApex_robust.centerAt_ne
        (lateFirstApexSystem R) firstSource.1 firstSource.2
    survives_frontier_deletion :=
      goodOutsideSources_survives_frontier_pair R hfirstGood }
  let secondIngress :
      TwoRadiusNamedRowGoodSourceIngress R firstRow secondRow := {
    source := secondSource
    source_mem_namedRows := by simpa [secondSource] using hwCases
    source_mem_good := hsecondGood
    actualBlocker_ne_secondApex :=
      surface.secondApex_robust.centerAt_ne
        (lateFirstApexSystem R) secondSource.1 secondSource.2
    survives_frontier_deletion :=
      goodOutsideSources_survives_frontier_pair R hsecondGood }
  exact ⟨{
    first := firstIngress
    second := secondIngress
    sources_ne := by
      intro h
      apply hwNeZ
      exact (congrArg Subtype.val h).symm }⟩

end ATailCardGeThirteenTwoRadiusGoodSourceIngress
end Problem97

#print axioms Problem97.ATailCardGeThirteenTwoRadiusGoodSourceIngress.nonempty_twoRadiusNamedRowGoodSourceIngress
#print axioms Problem97.ATailCardGeThirteenTwoRadiusGoodSourceIngress.nonempty_twoRadiusNamedRowsTwoGoodSourcesIngress
