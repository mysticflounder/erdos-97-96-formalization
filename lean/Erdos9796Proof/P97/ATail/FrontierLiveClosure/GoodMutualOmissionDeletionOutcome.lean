/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.GoodMutualOmissionTwoDeletionNetwork
import Erdos9796Proof.P97.ATail.ThreeCenterCommonDeletion

/-!
# The two-deletion split for a good mutually omitted pair

For each good source, at least one of the two retained frontier deletions omits its
actual blocker row.  Two nonempty omission subsets of a two-element frontier pair
either meet, giving three exact rows with one common deletion, or are complementary
singletons.  The common arm retains the two actual blocker rows and a row at the
robust physical second apex.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailDeletionRobustness
open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailGoodMutualOmissionTwoDeletionNetwork
open ATailMinimalUniqueFourCover
open ATailThreeCenterCommonDeletion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The actual critical four-row selected at the first source of the network. -/
noncomputable abbrev goodMutualOmissionSRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {surface : ExactFourPostCardElevenRobustSurface R}
    (N : GoodMutualOmissionTwoDeletionNetwork R surface) :
    SelectedFourClass D.A
      ((lateFirstApexSystem R).centerAt N.s.1 N.s.2) :=
  ((lateFirstApexSystem R).selectedAt N.s.1 N.s.2).toCriticalFourShell.toSelectedFourClass

/-- The actual critical four-row selected at the second source of the network. -/
noncomputable abbrev goodMutualOmissionTRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {surface : ExactFourPostCardElevenRobustSurface R}
    (N : GoodMutualOmissionTwoDeletionNetwork R surface) :
    SelectedFourClass D.A
      ((lateFirstApexSystem R).centerAt N.t.1 N.t.2) :=
  ((lateFirstApexSystem R).selectedAt N.t.1 N.t.2).toCriticalFourShell.toSelectedFourClass

/-- The canonical split of the two nonempty frontier-omission sets.

The common arm contains the exact three-row packet at the two actual blockers and
the physical second apex.  The other two arms record both possible orientations of
the complementary singleton omissions, including the positive memberships.
-/
inductive GoodMutualOmissionDeletionOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (N : GoodMutualOmissionTwoDeletionNetwork R surface) : Prop
  | commonFrontierDeletion
      (d : ℝ²)
      (d_is_frontier : d = F.pair.q ∨ d = F.pair.w)
      (d_not_mem_sRow : d ∉ (goodMutualOmissionSRow N).support)
      (d_not_mem_tRow : d ∉ (goodMutualOmissionTRow N).support)
      (secondApexRow : SelectedFourClass D.A S.oppApex2)
      (d_not_mem_secondApexRow : d ∉ secondApexRow.support)
      (threeCenter :
        ThreeCenterCommonDeletionExactRows D d
          ((lateFirstApexSystem R).centerAt N.s.1 N.s.2)
          ((lateFirstApexSystem R).centerAt N.t.1 N.t.2)
          S.oppApex2 (goodMutualOmissionSRow N).support
            (goodMutualOmissionTRow N).support secondApexRow.support)
  | complementaryCrossedQW
      (q_not_mem_sRow : F.pair.q ∉ (goodMutualOmissionSRow N).support)
      (w_mem_sRow : F.pair.w ∈ (goodMutualOmissionSRow N).support)
      (w_not_mem_tRow : F.pair.w ∉ (goodMutualOmissionTRow N).support)
      (q_mem_tRow : F.pair.q ∈ (goodMutualOmissionTRow N).support)
  | complementaryCrossedWQ
      (w_not_mem_sRow : F.pair.w ∉ (goodMutualOmissionSRow N).support)
      (q_mem_sRow : F.pair.q ∈ (goodMutualOmissionSRow N).support)
      (q_not_mem_tRow : F.pair.q ∉ (goodMutualOmissionTRow N).support)
      (w_mem_tRow : F.pair.w ∈ (goodMutualOmissionTRow N).support)

private theorem oppApex2_mem_carrier
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem actualRow_not_mem_of_survives
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (source : CriticalShellSystem.CarrierVertex D.A) (deleted : ℝ²)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted)
        (H.centerAt source.1 source.2)) :
    deleted ∉
      (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass.support := by
  intro hmem
  apply not_hasNEquidistantPointsAt_erase_of_mem_uniqueFourClass
    (isUniqueFourCenter_centerAt H source.1 source.2) _ hsurvives
  rw [uniqueFourClass_centerAt_eq_selectedAt_support H source.1 source.2]
  exact hmem

private theorem exists_selectedFourClass_avoiding_of_survives
    {A : Finset ℝ²} {center deleted : ℝ²}
    (hsurvives : HasNEquidistantPointsAt 4 (A.erase deleted) center) :
    ∃ K : SelectedFourClass A center, deleted ∉ K.support := by
  classical
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsurvives with
    ⟨radius, hradius, hfour⟩
  rcases Finset.exists_subset_card_eq hfour with ⟨support, hsupport, hcard⟩
  refine ⟨{
    support := support
    support_subset_A := ?_
    support_card := hcard
    radius := radius
    radius_pos := hradius
    support_eq_radius := ?_
    center_not_mem := ?_ }, ?_⟩
  · intro z hz
    exact Finset.mem_of_mem_erase (mem_selectedClass.mp (hsupport hz)).1
  · intro z hz
    exact (mem_selectedClass.mp (hsupport hz)).2
  · intro hcenter
    have hdist := (mem_selectedClass.mp (hsupport hcenter)).2
    have hzero : (0 : ℝ) = radius := by simpa using hdist
    linarith
  · intro hdeleted
    exact (Finset.mem_erase.mp
      (mem_selectedClass.mp (hsupport hdeleted)).1).1 rfl

private theorem commonDeletionOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (N : GoodMutualOmissionTwoDeletionNetwork R surface)
    (d : ℝ²) (hdA : d ∈ D.A)
    (hdFrontier : d = F.pair.q ∨ d = F.pair.w)
    (hdS : d ∉ (goodMutualOmissionSRow N).support)
    (hdT : d ∉ (goodMutualOmissionTRow N).support) :
    GoodMutualOmissionDeletionOutcome R surface N := by
  let Hlate := lateFirstApexSystem R
  have hsecondSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase d) S.oppApex2 :=
    surface.secondApex_robust.survives d hdA
  obtain ⟨secondApexRow, hdSecond⟩ :=
    exists_selectedFourClass_avoiding_of_survives hsecondSurvives
  have hsCenterA : Hlate.centerAt N.s.1 N.s.2 ∈ D.A :=
    Finset.mem_of_mem_erase
      (Hlate.selectedAt N.s.1 N.s.2).toCriticalFourShell.center_mem
  have htCenterA : Hlate.centerAt N.t.1 N.t.2 ∈ D.A :=
    Finset.mem_of_mem_erase
      (Hlate.selectedAt N.t.1 N.t.2).toCriticalFourShell.center_mem
  have hsecondA : S.oppApex2 ∈ D.A := oppApex2_mem_carrier S
  have hsNeSecond : Hlate.centerAt N.s.1 N.s.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne Hlate N.s.1 N.s.2
  have htNeSecond : Hlate.centerAt N.t.1 N.t.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne Hlate N.t.1 N.t.2
  let threeCenter :=
    (nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses
      hdA hsCenterA htCenterA hsecondA N.blockers_ne hsNeSecond htNeSecond
      (goodMutualOmissionSRow N) (goodMutualOmissionTRow N) secondApexRow
      hdS hdT hdSecond).some
  exact .commonFrontierDeletion d hdFrontier hdS hdT secondApexRow hdSecond threeCenter

/-- A good mutually omitted source pair has either a common frontier deletion
for its two actual blocker rows or complementary crossed singleton omissions. -/
theorem goodMutualOmission_deletionOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (N : GoodMutualOmissionTwoDeletionNetwork R surface) :
    GoodMutualOmissionDeletionOutcome R surface N := by
  have hsOmission :
      F.pair.q ∉ (goodMutualOmissionSRow N).support ∨
        F.pair.w ∉ (goodMutualOmissionSRow N).support :=
    N.s_survives_retained.imp
      (actualRow_not_mem_of_survives (lateFirstApexSystem R) N.s F.pair.q)
      (actualRow_not_mem_of_survives (lateFirstApexSystem R) N.s F.pair.w)
  have htOmission :
      F.pair.q ∉ (goodMutualOmissionTRow N).support ∨
        F.pair.w ∉ (goodMutualOmissionTRow N).support :=
    N.t_survives_retained.imp
      (actualRow_not_mem_of_survives (lateFirstApexSystem R) N.t F.pair.q)
      (actualRow_not_mem_of_survives (lateFirstApexSystem R) N.t F.pair.w)
  by_cases hsQ : F.pair.q ∉ (goodMutualOmissionSRow N).support
  · by_cases htQ : F.pair.q ∉ (goodMutualOmissionTRow N).support
    · exact commonDeletionOutcome R surface N F.pair.q F.pair.q_mem_A (Or.inl rfl) hsQ htQ
    · have htQMem : F.pair.q ∈ (goodMutualOmissionTRow N).support := by simpa using htQ
      have htW : F.pair.w ∉ (goodMutualOmissionTRow N).support :=
        htOmission.resolve_left htQ
      by_cases hsW : F.pair.w ∉ (goodMutualOmissionSRow N).support
      · exact commonDeletionOutcome R surface N F.pair.w F.pair.w_mem_A (Or.inr rfl) hsW htW
      · have hsWMem : F.pair.w ∈ (goodMutualOmissionSRow N).support := by
          simpa using hsW
        exact .complementaryCrossedQW hsQ hsWMem htW htQMem
  · have hsQMem : F.pair.q ∈ (goodMutualOmissionSRow N).support := by simpa using hsQ
    have hsW : F.pair.w ∉ (goodMutualOmissionSRow N).support :=
      hsOmission.resolve_left hsQ
    by_cases htW : F.pair.w ∉ (goodMutualOmissionTRow N).support
    · exact commonDeletionOutcome R surface N F.pair.w F.pair.w_mem_A (Or.inr rfl) hsW htW
    · have htWMem : F.pair.w ∈ (goodMutualOmissionTRow N).support := by
        simpa using htW
      have htQ : F.pair.q ∉ (goodMutualOmissionTRow N).support :=
        htOmission.resolve_right htW
      exact .complementaryCrossedWQ hsW hsQMem htQ htWMem

end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.goodMutualOmission_deletionOutcome
