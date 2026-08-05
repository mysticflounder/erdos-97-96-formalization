/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletionCore

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open Census554.CapSelectedGeometry
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointCollisionLocalization
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open ATailTwoCollisionGlobalProducer
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- **B1 normal form.**  Blocker equality forces the two canonical shells to
coincide, each deleted source to lie on the other shell, and the common shell
to meet the physical second-apex class in exactly those two sources. -/
theorem b1_live_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support ∧
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support ∧
      second.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support ∧
      ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card = 2) := by
  classical
  have hne : first.deleted.1 ≠ second.deleted.1 := fun h ↦
    hdeletedNe (Subtype.ext h)
  have hsupportsEq :
      ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support :=
    selectedSupports_eq_of_actualBlockers_eq (lateFirstApexSystem R)
      first.deleted.2 second.deleted.2 hblockersEq
  have hfirstMemSecondRow :
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support := by
    rw [← hsupportsEq]
    exact ((lateFirstApexSystem R).selectedAt
      first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support
  have hsecondMemFirstRow :
      second.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support := by
    rw [hsupportsEq]
    exact ((lateFirstApexSystem R).selectedAt
      second.deleted.1 second.deleted.2).toCriticalFourShell.q_mem_support
  refine ⟨hsupportsEq, hfirstMemSecondRow, hsecondMemFirstRow, ?_⟩
  have hle :
      ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card ≤ 2) :=
    actualLateRow_secondClass_card_le_two R surface first.deleted
  have hz₁ :
      first.deleted.1 ∈
        ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho)) :=
    Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support,
        first.deleted_mem_class⟩
  have hz₂ :
      second.deleted.1 ∈
        ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho)) :=
    Finset.mem_inter.mpr ⟨hsecondMemFirstRow, second.deleted_mem_class⟩
  have hge :
      2 ≤
        ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card) := by
    have hpair :
        ({first.deleted.1, second.deleted.1} : Finset ℝ²) ⊆
          ((((lateFirstApexSystem R).selectedAt
              first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho)) := by
      intro x hx
      rcases Finset.mem_insert.mp hx with rfl | hx
      · exact hz₁
      · rw [Finset.mem_singleton] at hx
        exact hx ▸ hz₂
    calc
      2 = ({first.deleted.1, second.deleted.1} : Finset ℝ²).card :=
        (Finset.card_pair hne).symm
      _ ≤ _ := Finset.card_le_card hpair
  omega

/-- **B1 bisector saturation.**  Under the live collision binders, the carrier
points equidistant from the two deleted sources are exactly the common actual
blocker and the physical second apex. -/
theorem b1_live_bisectorSet_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    D.A.filter (fun p ↦ dist p first.deleted.1 = dist p second.deleted.1) =
      ({(lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2,
          S.oppApex2} : Finset ℝ²) := by
  classical
  have hne : first.deleted.1 ≠ second.deleted.1 := fun h ↦
    hdeletedNe (Subtype.ext h)
  obtain ⟨_, _, hsecondMemFirstRow, _⟩ :=
    b1_live_normalForm R _hcard surface rho _hrho _hfive u v _huNeV _huClass
      _hvClass _hvOmitted _huOmitted first second hdeletedNe hblockersEq
  have hbNeApex :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        S.oppApex2 := first.uPacket.actual_blocker_ne_center₂
  have hbA :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ∈ D.A :=
    (Finset.mem_erase.mp
      ((lateFirstApexSystem R).selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.center_mem).2
  have haA : S.oppApex2 ∈ D.A := first.uPacket.center₂_mem_A
  have hbBisects :
      dist ((lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2)
          first.deleted.1 =
        dist ((lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2) second.deleted.1 := by
    have h₁ :=
      ((lateFirstApexSystem R).selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support_eq_radius
        first.deleted.1
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support
    have h₂ :=
      ((lateFirstApexSystem R).selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support_eq_radius
        second.deleted.1 hsecondMemFirstRow
    exact h₁.trans h₂.symm
  have haBisects :
      dist S.oppApex2 first.deleted.1 = dist S.oppApex2 second.deleted.1 := by
    have h₁ := (mem_selectedClass.mp first.deleted_mem_class).2
    have h₂ := (mem_selectedClass.mp second.deleted_mem_class).2
    exact h₁.trans h₂.symm
  have hbound :
      (D.A.filter
        (fun p ↦ dist p first.deleted.1 = dist p second.deleted.1)).card ≤ 2 :=
    Problem97.Dumitrescu.perpBisector_apex_bound D.convex first.deleted.2
      second.deleted.2 hne
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_filter.mpr ⟨hbA, hbBisects⟩
    · rw [Finset.mem_singleton] at hx
      exact hx ▸ Finset.mem_filter.mpr ⟨haA, haBisects⟩
  · rw [Finset.card_pair hbNeApex]
    exact hbound

/- A class-size surplus does yield one concrete new point, but the point is
   initially an escape from the saturated common row rather than a third point
   on the deleted-source bisector.  Record that producer explicitly: it is the
   datum a blocker-multiplicity consumer must use next. -/
theorem b1_live_exists_third_interior_escape
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    ∃ (t : ℝ²)
      (ht : t ∈
        (SelectedClass D.A S.oppApex2 rho ∩
          S.capInteriorByIndex S.oppIndex2)),
        t ≠ first.deleted.1 ∧
        t ≠ second.deleted.1 ∧
        t ∉
          ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∧
        HasNEquidistantPointsAt 4 (D.A.erase t)
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2) ∧
        (lateFirstApexSystem R).centerAt t
            ((mem_selectedClass.mp
              (Finset.mem_inter.mp ht).1).1) ≠
          (lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2 := by
  classical
  rcases b1_live_normalForm R _hcard surface rho _hrho _hfive u v _huNeV
      _huClass _hvClass _hvOmitted _huOmitted first second hdeletedNe
      hblockersEq with
    ⟨_hsupportsEq, hfirstMemSecondRow, hsecondMemFirstRow,
      hrowClassCard⟩
  have hdeletedNe' : first.deleted.1 ≠ second.deleted.1 := by
    intro h
    exact hdeletedNe (Subtype.ext h)
  have hinteriorCard :
      3 ≤
        (SelectedClass D.A S.oppApex2 rho ∩
          S.capInteriorByIndex S.oppIndex2).card :=
    by
      have hboundIndexed :
          (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2) rho).card - 2 ≤
            (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
              S.capInteriorByIndex S.oppIndex2).card :=
        S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
          D.convex S.oppIndex2 _hrho
      have hbound :
          (SelectedClass D.A S.oppApex2 rho).card - 2 ≤
            (SelectedClass D.A S.oppApex2 rho ∩
              S.capInteriorByIndex S.oppIndex2).card := by
        simpa using hboundIndexed
      omega
  have hthird :
      ∃ t : ℝ²,
        t ∈
            (SelectedClass D.A S.oppApex2 rho ∩
              S.capInteriorByIndex S.oppIndex2) ∧
          t ≠ first.deleted.1 ∧ t ≠ second.deleted.1 := by
    by_contra h
    push_neg at h
    have hsubset :
        (SelectedClass D.A S.oppApex2 rho ∩
          S.capInteriorByIndex S.oppIndex2) ⊆
          ({first.deleted.1, second.deleted.1} : Finset ℝ²) := by
      intro t ht
      by_cases hfirst : t = first.deleted.1
      · exact Finset.mem_insert.mpr (Or.inl hfirst)
      · have hsecond : t = second.deleted.1 := by
          simpa [hfirst] using (h t ht)
        exact Finset.mem_insert.mpr (Or.inr (Finset.mem_singleton.mpr hsecond))
    have hcardle := Finset.card_le_card hsubset
    rw [Finset.card_pair hdeletedNe'] at hcardle
    omega
  rcases hthird with ⟨t, htInterior, htFirst, htSecond⟩
  have htClass : t ∈ SelectedClass D.A S.oppApex2 rho :=
    (Finset.mem_inter.mp htInterior).1
  have htA : t ∈ D.A := (mem_selectedClass.mp htClass).1
  have hrowClassSet :
      (((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 rho) =
        ({first.deleted.1, second.deleted.1} : Finset ℝ²) := by
    have hpairSubset :
        ({first.deleted.1, second.deleted.1} : Finset ℝ²) ⊆
          (((lateFirstApexSystem R).selectedAt
              first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho) := by
      intro x hx
      rcases Finset.mem_insert.mp hx with rfl | hx
      · exact Finset.mem_inter.mpr ⟨
          ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support,
          first.deleted_mem_class⟩
      · rw [Finset.mem_singleton] at hx
        subst x
        exact Finset.mem_inter.mpr ⟨hsecondMemFirstRow, second.deleted_mem_class⟩
    refine (Finset.eq_of_subset_of_card_le hpairSubset ?_).symm
    rw [Finset.card_pair hdeletedNe']
    omega
  have htNotRow :
      t ∉
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support := by
    intro htRow
    have htIntersection :
        t ∈
          (((lateFirstApexSystem R).selectedAt
              first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho) :=
      Finset.mem_inter.mpr ⟨htRow, htClass⟩
    rw [hrowClassSet] at htIntersection
    rcases Finset.mem_insert.mp htIntersection with ht | ht
    · exact htFirst ht
    · exact htSecond (Finset.mem_singleton.mp ht)
  have htSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase t)
        ((lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) first.deleted.2).mpr htNotRow
  have htBlockerNe :=
    Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
      (lateFirstApexSystem R) htA htSurvives
  exact ⟨t, htInterior, htFirst, htSecond, htNotRow, htSurvives, htBlockerNe⟩

/- The escaped point is already a source-clean input to the shell-overlap
consumer.  The point is outside the first deleted source's selected shell,
so the existing critical-shell theorem gives the at-most-two alternative for
the escaped point's selected shell.  This is deliberately a packet theorem,
not a contradiction: the missing global producer would have to force at least
three common support points. -/
theorem b1_live_escape_small_overlap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    ∃ (t : ℝ²)
      (ht : t ∈
        (SelectedClass D.A S.oppApex2 rho ∩
          S.capInteriorByIndex S.oppIndex2)),
        t ≠ first.deleted.1 ∧
        t ≠ second.deleted.1 ∧
        t ∉
          ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∧
        HasNEquidistantPointsAt 4 (D.A.erase t)
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2) ∧
        (lateFirstApexSystem R).centerAt t
            ((mem_selectedClass.mp
              (Finset.mem_inter.mp ht).1).1) ≠
          (lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2 ∧
        (((lateFirstApexSystem R).selectedAt t
            ((mem_selectedClass.mp
              (Finset.mem_inter.mp ht).1).1)).toCriticalFourShell.support ∩
          ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support).card ≤ 2 := by
  rcases b1_live_exists_third_interior_escape R _hcard surface rho _hrho
      _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted first second
      hdeletedNe hblockersEq with
    ⟨t, ht, htFirst, htSecond, htNotRow, htSurvives, htBlockerNe⟩
  have htA : t ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp ht).1).1
  have hsmall :=
    selected_support_inter_card_le_two_of_not_mem_other_selected_support
      (lateFirstApexSystem R) htA first.deleted.2 htNotRow
  exact ⟨t, ht, htFirst, htSecond, htNotRow, htSurvives, htBlockerNe, hsmall⟩

/-- Conditional B1 terminal for the remaining global gap.

The escape producer and the banked shell theorem supply the upper bound two.
Any future source-level theorem proving the matching lower bound three for
every admissible escape therefore closes the live collision leaf immediately.
The lower-bound premise is intentionally explicit: it is not derivable from
the current B1 binders and must not be smuggled in as a local consequence. -/
theorem b1_live_false_of_escape_overlap_ge_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
    (hlarge :
      ∀ (t : ℝ²)
        (ht : t ∈
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)),
        ∀ (htA : t ∈ D.A),
        t ≠ first.deleted.1 →
        t ≠ second.deleted.1 →
        t ∉
          ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support →
        (lateFirstApexSystem R).centerAt t htA ≠
        (lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2 →
        3 ≤
          (((lateFirstApexSystem R).selectedAt
              t htA).toCriticalFourShell.support ∩
            ((lateFirstApexSystem R).selectedAt
              first.deleted.1 first.deleted.2).toCriticalFourShell.support).card) :
    False := by
  rcases b1_live_escape_small_overlap R _hcard surface rho _hrho _hfive u v
      _huNeV _huClass _hvClass _hvOmitted _huOmitted first second hdeletedNe
      hblockersEq with
    ⟨t, ht, htFirst, htSecond, htNotRow, _htSurvives, htBlockerNe, hsmall⟩
  have htA : t ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp ht).1).1
  have hlarge' := hlarge t ht htA htFirst htSecond htNotRow htBlockerNe
  have hsmall' :
      (((lateFirstApexSystem R).selectedAt t htA).toCriticalFourShell.support ∩
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support).card ≤ 2 := by
    exact hsmall
  omega

/-- **B1 reduces to the global B1-gap producer.**  Any third carrier point
equidistant from the two deleted sources and distinct from the known two
bisector points closes the live collision leaf. -/
theorem b1_live_false_of_third_bisector_carrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
    (c : ℝ²) (hcA : c ∈ D.A)
    (hcNeBlocker :
      c ≠ (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2)
    (hcNeApex : c ≠ S.oppApex2)
    (hcBisects : dist c first.deleted.1 = dist c second.deleted.1) :
    False := by
  classical
  have hset :=
    b1_live_bisectorSet_eq_pair R _hcard surface rho _hrho _hfive u v _huNeV
      _huClass _hvClass _hvOmitted _huOmitted first second hdeletedNe
      hblockersEq
  have hc : c ∈ D.A.filter
      (fun p ↦ dist p first.deleted.1 = dist p second.deleted.1) :=
    Finset.mem_filter.mpr ⟨hcA, hcBisects⟩
  rw [hset] at hc
  rcases Finset.mem_insert.mp hc with h | h
  · exact hcNeBlocker h
  · exact hcNeApex (Finset.mem_singleton.mp h)

/- A finite-certificate producer may naturally return a lower bound on the
bisector fiber rather than a named third point.  Keep that interface
source-level and reduce it immediately to the same checked B1 consumer. -/
theorem false_of_bisector_fiber_card_ge_three_of_eq_pair
    {A : Finset ℝ²} {q r blocker apex : ℝ²}
    (hblockerNeApex : blocker ≠ apex)
    (hfiberSet :
      A.filter (fun p ↦ dist p q = dist p r) = {blocker, apex})
    (hfiberCard :
      3 ≤ (A.filter (fun p ↦ dist p q = dist p r)).card) :
    False := by
  have hcard :
      (A.filter (fun p ↦ dist p q = dist p r)).card = 2 := by
    rw [hfiberSet]
    exact Finset.card_pair hblockerNeApex
  omega

/- The B1-specific cardinality interface.  This is deliberately a consumer
only: the missing global producer must prove `hfiberCard`; the physical
five-point hypothesis is not used to manufacture it. -/
theorem b1_live_false_of_bisector_fiber_card_ge_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
    (hfiberCard :
      3 ≤
        (D.A.filter
          (fun p ↦ dist p first.deleted.1 = dist p second.deleted.1)).card) :
    False := by
  have hfiberSet :=
    b1_live_bisectorSet_eq_pair R _hcard surface rho _hrho _hfive u v
      _huNeV _huClass _hvClass _hvOmitted _huOmitted first second hdeletedNe
      hblockersEq
  exact false_of_bisector_fiber_card_ge_three_of_eq_pair
    first.uPacket.actual_blocker_ne_center₂ hfiberSet hfiberCard

/- A physical second-apex class of size five is not merely large enough to
   produce a mutually omitted deletion.  The ordered-cap count places at least
   three of its members in the strict second opposite cap.  This is a
   source-clean producer-side constraint; it does not assert that any one of
   those interior members is omitted from both live rows. -/
theorem b1_physicalClass_secondCapInterior_card_ge_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {rho : ℝ}
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card) :
    3 ≤
      (SelectedClass D.A S.oppApex2 rho ∩
        S.capInteriorByIndex S.oppIndex2).card := by
  have hboundIndexed :
      (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2) rho).card - 2 ≤
        (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2) rho ∩
          S.capInteriorByIndex S.oppIndex2).card :=
    S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
      D.convex S.oppIndex2 hrho
  have hbound :
      (SelectedClass D.A S.oppApex2 rho).card - 2 ≤
        (SelectedClass D.A S.oppApex2 rho ∩
          S.capInteriorByIndex S.oppIndex2).card := by
    simpa using hboundIndexed
  omega

/-- Once the B1 bisector has been saturated to the two known points, any two
strict-cap deleted sources force their common blocker into that same strict
second cap.  This is the cap-localization adapter for a future global B1
producer; the producer still has to supply the interior sources. -/
theorem b1_common_blocker_mem_secondCapInterior_of_bisectorSet_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {source partner blocker : ℝ²}
    (hblockerNeApex : blocker ≠ S.oppApex2)
    (hfiberSet :
      D.A.filter (fun p ↦ dist p source = dist p partner) =
        ({blocker, S.oppApex2} : Finset ℝ²))
    (hsource : source ∈ S.capInteriorByIndex S.oppIndex2)
    (hpartner : partner ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourcePartner : source ≠ partner)
    (hphysicalEq : dist S.oppApex2 source = dist S.oppApex2 partner) :
    blocker ∈ S.capInteriorByIndex S.oppIndex2 := by
  have hblockerFilter :
      blocker ∈ D.A.filter (fun p ↦ dist p source = dist p partner) := by
    rw [hfiberSet]
    simp
  have hblockerA : blocker ∈ D.A :=
    (Finset.mem_filter.mp hblockerFilter).1
  have hcenterEq : dist blocker source = dist blocker partner :=
    (Finset.mem_filter.mp hblockerFilter).2
  exact commonPhysicalPair_center_mem_secondCapInterior
    hblockerA hblockerNeApex hsource hpartner hsourcePartner hcenterEq
    hphysicalEq

/-- B1-specific wrapper for the preceding localization adapter.  The explicit
fiber equality is intentional: it keeps the theorem independent of the still
open construction of that equality, while making the resulting cap location
available to later producer proofs. -/
theorem b1_live_common_blocker_mem_secondCapInterior_of_deleted_sources_interior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ)
    (u v : CarrierVertex D.A)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hfiberSet :
      D.A.filter (fun p ↦ dist p first.deleted.1 = dist p second.deleted.1) =
        ({(lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2,
          S.oppApex2} : Finset ℝ²))
    (hfirstInterior : first.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsecondInterior : second.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2) :
    (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ∈
      S.capInteriorByIndex S.oppIndex2 := by
  have hdeletedNe' : first.deleted.1 ≠ second.deleted.1 := by
    intro h
    exact hdeletedNe (Subtype.ext h)
  have hphysicalEq :
      dist S.oppApex2 first.deleted.1 =
        dist S.oppApex2 second.deleted.1 :=
    (mem_selectedClass.mp first.deleted_mem_class).2.trans
      (mem_selectedClass.mp second.deleted_mem_class).2.symm
  exact b1_common_blocker_mem_secondCapInterior_of_bisectorSet_eq_pair
    first.uPacket.actual_blocker_ne_center₂ hfiberSet hfirstInterior
    hsecondInterior hdeletedNe' hphysicalEq

/-- Live-binder version of the preceding cap-localization adapter.  The
bisector saturation is discharged internally, so a future B1 producer only
has to provide the two strict-cap deleted sources. -/
theorem b1_live_common_blocker_mem_secondCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
    (hfirstInterior : first.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsecondInterior : second.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2) :
    (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ∈
      S.capInteriorByIndex S.oppIndex2 := by
  have hfiberSet :=
    b1_live_bisectorSet_eq_pair R _hcard surface rho _hrho _hfive u v
      _huNeV _huClass _hvClass _hvOmitted _huOmitted first second hdeletedNe
      hblockersEq
  exact b1_live_common_blocker_mem_secondCapInterior_of_deleted_sources_interior
    R rho u v first second hdeletedNe hfiberSet hfirstInterior hsecondInterior

/- PARKED-SPEC: this first formulation confused the deleted-source rows with
the original live rows required by the prescribed joint-deletion constructor.
It is retained only as an audit trail; the source-faithful cover trichotomy
below is the active interface.
/- The next producer-facing split isolates the remaining B1 cover case.  It
does not choose an arbitrary point from the physical class: the point is
forced into the strict cap, and the normal form proves that it is absent from
both live rows before the joint-deletion constructor is applied. -/
theorem b1_live_two_interior_sources_or_third_interior_joint_deletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    (first.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        second.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2) ∨
      ∃ third : ExactFourMutualOmissionJointDeletion R rho u v,
        third.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        third.deleted ≠ first.deleted ∧
        third.deleted ≠ second.deleted := by
  classical
  by_cases hfirstInterior :
      first.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2
  · by_cases hsecondInterior :
        second.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2
    · exact Or.inl ⟨hfirstInterior, hsecondInterior⟩
    · right
      let C := SelectedClass D.A S.oppApex2 rho
      let I := C ∩ S.capInteriorByIndex S.oppIndex2
      have hIthree : 3 ≤ I.card := by
        simpa [I, C] using
          b1_physicalClass_secondCapInterior_card_ge_three
            _hrho _hfive
      have hne : first.deleted.1 ≠ second.deleted.1 := by
        intro h
        exact hdeletedNe (Subtype.ext h)
      have hnormal :=
        b1_live_normalForm R _hcard surface rho _hrho _hfive u v
          _huNeV _huClass _hvClass _hvOmitted _huOmitted first second
          hdeletedNe hblockersEq
      have hsupportEq := hnormal.1
      have hsecondMemFirstRow := hnormal.2.2
      have hpairSubset :
          ({first.deleted.1, second.deleted.1} : Finset ℝ²) ⊆
            ((lateFirstApexSystem R).selectedAt
                first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩ C := by
        intro x hx
        rcases Finset.mem_insert.mp hx with rfl | hx
        · exact Finset.mem_inter.mpr ⟨
            ((lateFirstApexSystem R).selectedAt
              first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support,
            by simpa [C] using first.deleted_mem_class⟩
        · have hx' : x = second.deleted.1 := Finset.mem_singleton.mp hx
          subst x
          exact Finset.mem_inter.mpr ⟨hsecondMemFirstRow,
            by simpa [C] using second.deleted_mem_class⟩
      have hpair :
          ((lateFirstApexSystem R).selectedAt
              first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩ C =
            ({first.deleted.1, second.deleted.1} : Finset ℝ²) := by
        refine (Finset.eq_of_subset_of_card_le hpairSubset ?_).symm
        simpa [C] using hnormal.2.2.2
      have hthird :
          ∃ x ∈ I, x ∉ ({first.deleted.1, second.deleted.1} : Finset ℝ²) := by
        by_contra hnone
        push_neg at hnone
        have hsub : I ⊆ ({first.deleted.1, second.deleted.1} : Finset ℝ²) := by
          intro x hx
          exact hnone x hx
        have hle := Finset.card_le_card hsub
        have hpairCard :
            ({first.deleted.1, second.deleted.1} : Finset ℝ²).card = 2 := by
          simp [hne]
        omega
      obtain ⟨x, hxI, hxNotPair⟩ := hthird
      have hxParts := Finset.mem_inter.mp hxI
      have hxC : x ∈ C := hxParts.1
      have hxInterior : x ∈ S.capInteriorByIndex S.oppIndex2 := hxParts.2
      have hxNotFirstRow :
          x ∉
            ((lateFirstApexSystem R).selectedAt
              first.deleted.1 first.deleted.2).toCriticalFourShell.support := by
        intro hxRow
        apply hxNotPair
        rw [← hpair]
        exact Finset.mem_inter.mpr ⟨hxRow, hxC⟩
      have hxNotSecondRow :
          x ∉
            ((lateFirstApexSystem R).selectedAt
              second.deleted.1 second.deleted.2).toCriticalFourShell.support := by
        intro hxRow
        apply hxNotPair
        rw [← hpair]
        exact Finset.mem_inter.mpr ⟨by simpa [hsupportEq] using hxRow, hxC⟩
      let third : CarrierVertex D.A := ⟨x, (mem_selectedClass.mp hxC).1⟩
      obtain ⟨third, hthirdEq⟩ :=
        exactFourMutualOmissionJointDeletion_of_prescribed
          R surface rho u v third (by simpa [third] using hxC)
          (by simpa [third] using hxNotFirstRow)
          (by simpa [third] using hxNotSecondRow)
          first.blockers_ne
      refine ⟨third, ?_, ?_, ?_⟩
      · simpa [hthirdEq, third] using hxInterior
      · intro hEq
        apply hxNotPair
        have : x = first.deleted.1 := by
          simpa [hthirdEq, third] using congrArg Subtype.val hEq
        simp [this]
      · intro hEq
        apply hxNotPair
        have : x = second.deleted.1 := by
          simpa [hthirdEq, third] using congrArg Subtype.val hEq
        simp [this]
  · right
    let C := SelectedClass D.A S.oppApex2 rho
    let I := C ∩ S.capInteriorByIndex S.oppIndex2
    have hIthree : 3 ≤ I.card := by
      simpa [I, C] using
        b1_physicalClass_secondCapInterior_card_ge_three _hrho _hfive
    have hne : first.deleted.1 ≠ second.deleted.1 := by
      intro h
      exact hdeletedNe (Subtype.ext h)
    have hnormal :=
      b1_live_normalForm R _hcard surface rho _hrho _hfive u v
        _huNeV _huClass _hvClass _hvOmitted _huOmitted first second
        hdeletedNe hblockersEq
    have hsupportEq := hnormal.1
    have hsecondMemFirstRow := hnormal.2.2
    have hpairSubset :
        ({first.deleted.1, second.deleted.1} : Finset ℝ²) ⊆
          ((lateFirstApexSystem R).selectedAt
              first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩ C := by
      intro x hx
      rcases Finset.mem_insert.mp hx with rfl | hx
      · exact Finset.mem_inter.mpr ⟨
          ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support,
          by simpa [C] using first.deleted_mem_class⟩
      · have hx' : x = second.deleted.1 := Finset.mem_singleton.mp hx
        subst x
        exact Finset.mem_inter.mpr ⟨hsecondMemFirstRow,
          by simpa [C] using second.deleted_mem_class⟩
    have hpair :
        ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩ C =
          ({first.deleted.1, second.deleted.1} : Finset ℝ²) := by
      refine (Finset.eq_of_subset_of_card_le hpairSubset ?_).symm
      simpa [C] using hnormal.2.2.2
    have hthird :
        ∃ x ∈ I, x ∉ ({first.deleted.1, second.deleted.1} : Finset ℝ²) := by
      by_contra hnone
      push_neg at hnone
      have hsub : I ⊆ ({first.deleted.1, second.deleted.1} : Finset ℝ²) := by
        intro x hx
        exact hnone x hx
      have hle := Finset.card_le_card hsub
      have hpairCard :
          ({first.deleted.1, second.deleted.1} : Finset ℝ²).card = 2 := by
        simp [hne]
      omega
    obtain ⟨x, hxI, hxNotPair⟩ := hthird
    have hxParts := Finset.mem_inter.mp hxI
    have hxC : x ∈ C := hxParts.1
    have hxInterior : x ∈ S.capInteriorByIndex S.oppIndex2 := hxParts.2
    have hxNotFirstRow :
        x ∉
          ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support := by
      intro hxRow
      apply hxNotPair
      rw [← hpair]
      exact Finset.mem_inter.mpr ⟨hxRow, hxC⟩
    have hxNotSecondRow :
        x ∉
          ((lateFirstApexSystem R).selectedAt
            second.deleted.1 second.deleted.2).toCriticalFourShell.support := by
      intro hxRow
      apply hxNotPair
      rw [← hpair]
      exact Finset.mem_inter.mpr ⟨by simpa [hsupportEq] using hxRow, hxC⟩
    let third : CarrierVertex D.A := ⟨x, (mem_selectedClass.mp hxC).1⟩
    obtain ⟨third, hthirdEq⟩ :=
      exactFourMutualOmissionJointDeletion_of_prescribed
        R surface rho u v third (by simpa [third] using hxC)
        (by simpa [third] using hxNotFirstRow)
        (by simpa [third] using hxNotSecondRow)
        first.blockers_ne
    refine ⟨third, ?_, ?_, ?_⟩
    · simpa [hthirdEq, third] using hxInterior
    · intro hEq
      apply hxNotPair
      have : x = first.deleted.1 := by
        simpa [hthirdEq, third] using congrArg Subtype.val hEq
      simp [this]
    · intro hEq
      apply hxNotPair
      have : x = second.deleted.1 := by
        simpa [hthirdEq, third] using congrArg Subtype.val hEq
      simp [this]
-/

/- The source-faithful replacement for the parked formulation above.  It
records the exact remaining cover alternative: a point outside the two live
rows can be fed to the prescribed joint-deletion producer, while failure to
find such a point is retained as a finite-set cover obligation. -/
theorem b1_live_interior_joint_deletion_or_small_cover
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    (first.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        second.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2) ∨
      (∃ third : ExactFourMutualOmissionJointDeletion R rho u v,
        third.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        third.deleted ≠ first.deleted ∧
        third.deleted ≠ second.deleted) ∨
      (SelectedClass D.A S.oppApex2 rho ∩
          S.capInteriorByIndex S.oppIndex2 ⊆
        ({first.deleted.1, second.deleted.1} : Finset ℝ²) ∪
          (((lateFirstApexSystem R).selectedAt
              u.1 u.2).toCriticalFourShell.support ∪
            ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support)) := by
  classical
  by_cases hboth :
      first.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        second.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2
  · exact Or.inl hboth
  · right
    let C := SelectedClass D.A S.oppApex2 rho
    let I := C ∩ S.capInteriorByIndex S.oppIndex2
    let rowU :=
      ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support
    let rowV :=
      ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support
    by_cases houtside :
        ∃ x ∈ I, x ∉
          ({first.deleted.1, second.deleted.1} : Finset ℝ²) ∪
            (rowU ∪ rowV)
    · left
      obtain ⟨x, hxI, hxNotUnion⟩ := houtside
      have hxParts := Finset.mem_inter.mp hxI
      have hxC : x ∈ C := hxParts.1
      have hxInterior : x ∈ S.capInteriorByIndex S.oppIndex2 := hxParts.2
      have hxNotU : x ∉ rowU := by
        intro hx
        apply hxNotUnion
        exact Finset.mem_union.mpr
          (Or.inr (Finset.mem_union.mpr (Or.inl hx)))
      have hxNotV : x ∉ rowV := by
        intro hx
        apply hxNotUnion
        exact Finset.mem_union.mpr
          (Or.inr (Finset.mem_union.mpr (Or.inr hx)))
      have hxC' : x ∈ SelectedClass D.A S.oppApex2 rho := by
        simpa [C] using hxC
      let w : CarrierVertex D.A :=
        ⟨x, (mem_selectedClass.mp hxC').1⟩
      obtain ⟨K, hK⟩ :=
        exactFourMutualOmissionJointDeletion_of_prescribed
          R surface rho u v w (by simpa [w] using hxC')
          (by simpa [w, rowU] using hxNotU)
          (by simpa [w, rowV] using hxNotV)
          first.blockers_ne
      have hKval : K.deleted.1 = x := by
        simpa [w] using congrArg Subtype.val hK
      refine ⟨K, ?_, ?_, ?_⟩
      · rw [hKval]
        exact hxInterior
      · intro hEq
        apply hxNotUnion
        apply Finset.mem_union.mpr
        left
        have hxEq : x = first.deleted.1 := by
          calc
            x = K.deleted.1 := hKval.symm
            _ = first.deleted.1 := congrArg Subtype.val hEq
        simp [hxEq]
      · intro hEq
        apply hxNotUnion
        apply Finset.mem_union.mpr
        left
        have hxEq : x = second.deleted.1 := by
          calc
            x = K.deleted.1 := hKval.symm
            _ = second.deleted.1 := congrArg Subtype.val hEq
        simp [hxEq]
    · right
      have hcover : I ⊆
          ({first.deleted.1, second.deleted.1} : Finset ℝ²) ∪
            (rowU ∪ rowV) := by
        intro x hx
        by_contra hxNot
        exact houtside ⟨x, hx, hxNot⟩
      simpa [I, C, rowU, rowV] using hcover

/-/ The row-cover branch has one further source-clean consequence.  A live
    critical row contains its own source, while its intersection with the
    physical second-apex class has cardinality at most two.  Thus, if neither
    deleted source is interior, two live rows can cover at most two interior
    class points unless one of their own sources is interior.  This is a
    producer-side narrowing only: the resulting live-source-interior branch
    still needs a global consumer. -/
theorem b1_live_interior_deleted_or_third_or_live_source_interior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hblockersEq :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    (first.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 ∨
        second.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2) ∨
      (∃ third : ExactFourMutualOmissionJointDeletion R rho u v,
        third.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        third.deleted ≠ first.deleted ∧
        third.deleted ≠ second.deleted) ∨
      (u.1 ∈ S.capInteriorByIndex S.oppIndex2 ∨
        v.1 ∈ S.capInteriorByIndex S.oppIndex2) := by
  classical
  rcases b1_live_interior_joint_deletion_or_small_cover
      R _hcard surface rho _hrho _hfive u v _huNeV _huClass _hvClass
      _hvOmitted _huOmitted first second _hdeletedNe _hblockersEq with
    hboth | hthird | hcover
  · exact Or.inl (Or.inl hboth.1)
  · exact Or.inr (Or.inl hthird)
  · by_cases hfirstInterior :
        first.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2
    · exact Or.inl (Or.inl hfirstInterior)
    by_cases hsecondInterior :
        second.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2
    · exact Or.inl (Or.inr hsecondInterior)
    let C := SelectedClass D.A S.oppApex2 rho
    let I := C ∩ S.capInteriorByIndex S.oppIndex2
    let rowU :=
      ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support
    let rowV :=
      ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support
    have hcover' : I ⊆ ({first.deleted.1, second.deleted.1} : Finset ℝ²) ∪
        (rowU ∪ rowV) := by
      simpa [I, C, rowU, rowV] using hcover
    have hIrows : I ⊆ rowU ∪ rowV := by
      intro x hx
      rcases Finset.mem_union.mp (hcover' hx) with hdeleted | hrows
      · rcases Finset.mem_insert.mp hdeleted with hfirst | hsecond
        · exact (hfirstInterior (by simpa [hfirst] using (Finset.mem_inter.mp hx).2)).elim
        · have hsecond' : x = second.deleted.1 := Finset.mem_singleton.mp hsecond
          exact (hsecondInterior (by simpa [hsecond'] using (Finset.mem_inter.mp hx).2)).elim
      · exact hrows
    have hrowUclass : (rowU ∩ C).card ≤ 2 := by
      simpa [rowU, C] using
        criticalFourShell_inter_selectedClass_card_le_two
          ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell
          (surface.secondApex_robust.centerAt_ne
            (lateFirstApexSystem R) u.1 u.2)
    have hrowVclass : (rowV ∩ C).card ≤ 2 := by
      simpa [rowV, C] using
        criticalFourShell_inter_selectedClass_card_le_two
          ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell
          (surface.secondApex_robust.centerAt_ne
            (lateFirstApexSystem R) v.1 v.2)
    have huRowC : u.1 ∈ rowU ∩ C := by
      exact Finset.mem_inter.mpr ⟨
        ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.q_mem_support,
        _huClass⟩
    have hvRowC : v.1 ∈ rowV ∩ C := by
      exact Finset.mem_inter.mpr ⟨
        ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.q_mem_support,
        _hvClass⟩
    by_cases huInterior : u.1 ∈ S.capInteriorByIndex S.oppIndex2
    · exact Or.inr (Or.inr (Or.inl huInterior))
    by_cases hvInterior : v.1 ∈ S.capInteriorByIndex S.oppIndex2
    · exact Or.inr (Or.inr (Or.inr hvInterior))
    have huNotI : u.1 ∉ I := by
      intro huI
      exact huInterior (Finset.mem_inter.mp huI).2
    have hvNotI : v.1 ∉ I := by
      intro hvI
      exact hvInterior (Finset.mem_inter.mp hvI).2
    have hIu : (I ∩ rowU).card ≤ 1 := by
      have hsub : I ∩ rowU ⊆ (rowU ∩ C).erase u.1 := by
        intro x hx
        have hxI := Finset.mem_inter.mp hx
        have hxC := Finset.mem_inter.mp hxI.1
        have hxne : x ≠ u.1 := by
          intro hxu
          apply huNotI
          simpa [hxu] using hxI.1
        exact Finset.mem_erase.mpr ⟨hxne,
          Finset.mem_inter.mpr ⟨hxI.2, hxC.1⟩⟩
      have herase : ((rowU ∩ C).erase u.1).card = (rowU ∩ C).card - 1 :=
        Finset.card_erase_of_mem huRowC
      have hle := Finset.card_le_card hsub
      omega
    have hIv : (I ∩ rowV).card ≤ 1 := by
      have hsub : I ∩ rowV ⊆ (rowV ∩ C).erase v.1 := by
        intro x hx
        have hxI := Finset.mem_inter.mp hx
        have hxC := Finset.mem_inter.mp hxI.1
        have hxne : x ≠ v.1 := by
          intro hxv
          apply hvNotI
          simpa [hxv] using hxI.1
        exact Finset.mem_erase.mpr ⟨hxne,
          Finset.mem_inter.mpr ⟨hxI.2, hxC.1⟩⟩
      have herase : ((rowV ∩ C).erase v.1).card = (rowV ∩ C).card - 1 :=
        Finset.card_erase_of_mem hvRowC
      have hle := Finset.card_le_card hsub
      omega
    have hIcard : 3 ≤ I.card := by
      simpa [I, C] using
        b1_physicalClass_secondCapInterior_card_ge_three _hrho _hfive
    have hIcard_le : I.card ≤ (I ∩ rowU).card + (I ∩ rowV).card := by
      have hsub : I ⊆ (I ∩ rowU) ∪ (I ∩ rowV) := by
        intro x hx
        rcases Finset.mem_union.mp (hIrows hx) with hxU | hxV
        · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hx, hxU⟩))
        · exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hx, hxV⟩))
      calc
        I.card ≤ ((I ∩ rowU) ∪ (I ∩ rowV)).card :=
          Finset.card_le_card hsub
        _ ≤ (I ∩ rowU).card + (I ∩ rowV).card :=
          Finset.card_union_le _ _
    omega

/-/ The reusable robust-cap ingress keeps these two implications private in
    its implementation file.  Expose the source-clean forms here because the
    B1 live-source branch must account explicitly for the first-apex fiber
    and surplus-cap boundaries before it can consume that ingress. -/
theorem b1_source_mem_outsideFirstApexFiber_of_not_mem_firstApexClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    {source : CarrierVertex D.A}
    (hnot : source.1 ∉ SelectedClass D.A S.oppApex1 radius) :
    source ∈ outsideFirstApexFiber R := by
  apply Finset.mem_sdiff.mpr
  refine ⟨Finset.mem_univ _, ?_⟩
  intro hsourceFiber
  have hblockers := (Finset.mem_filter.mp hsourceFiber).2
  apply hnot
  apply
    (lateFirstApexSystem_centerAt_eq_iff_mem_class R source.2).mp
  calc
    (lateFirstApexSystem R).centerAt source.1 source.2 =
        (lateFirstApexSystem R).centerAt
          F.pair.q F.pair.q_mem_A :=
      congrArg Subtype.val hblockers
    _ = S.oppApex1 :=
      lateFirstApexSystem_centerAt_eq R F.pair.q_mem_A
        (frontier_pair_q_mem_firstApexClass F)

theorem b1_secondCapInterior_not_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.oppIndex2) :
    x ∉ S.surplusCap := by
  have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hx
    S.surplusIdx_ne_oppIndex2.symm
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simpa [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi] using hnot

/-/ When both live B1 sources are strict second-cap-interior, this is the
    exact source-clean split needed before entering the reusable robust-cap
    consumer.  The first arm is ready for its outside/survival ingress; the
    other two arms isolate the only remaining boundary, namely a source that
    also lies in the first-apex class.  This is a producer, not a closure
    theorem. -/
theorem b1_live_both_interior_outside_or_firstApexClass_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (huInterior : u.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hvInterior : v.1 ∈ S.capInteriorByIndex S.oppIndex2) :
    (u ∈ outsideFirstApexFiber R ∧
        v ∈ outsideFirstApexFiber R ∧
        (HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
            ((lateFirstApexSystem R).centerAt u.1 u.2) ∨
          HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
            ((lateFirstApexSystem R).centerAt u.1 u.2) ∨
          HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
            ((lateFirstApexSystem R).centerAt v.1 v.2) ∨
          HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
            ((lateFirstApexSystem R).centerAt v.1 v.2))) ∨
      (u ∈ outsideFirstApexFiber R ∧
        v.1 ∈ SelectedClass D.A S.oppApex1 radius) ∨
      (u.1 ∈ SelectedClass D.A S.oppApex1 radius ∧
        v ∈ outsideFirstApexFiber R) := by
  classical
  by_cases huFirst : u.1 ∈ SelectedClass D.A S.oppApex1 radius
  · by_cases hvFirst : v.1 ∈ SelectedClass D.A S.oppApex1 radius
    · have huA : u.1 ∈ D.A := (mem_selectedClass.mp huClass).1
      have hvA : v.1 ∈ D.A := (mem_selectedClass.mp hvClass).1
      have huFirstA : u.1 ∈ D.A := (mem_selectedClass.mp huFirst).1
      have hvFirstA : v.1 ∈ D.A := (mem_selectedClass.mp hvFirst).1
      have huOff : u.1 ∉ S.surplusCap :=
        b1_secondCapInterior_not_mem_surplusCap S huInterior
      have hvOff : v.1 ∉ S.surplusCap :=
        b1_secondCapInterior_not_mem_surplusCap S hvInterior
      have huMarginal : u.1 ∈
          (D.A.filter fun x => dist x S.oppApex1 = radius) \ S.surplusCap := by
        apply Finset.mem_sdiff.mpr
        refine ⟨Finset.mem_filter.mpr ⟨huFirstA, ?_⟩, huOff⟩
        simpa [dist_comm] using (mem_selectedClass.mp huFirst).2
      have hvMarginal : v.1 ∈
          (D.A.filter fun x => dist x S.oppApex1 = radius) \ S.surplusCap := by
        apply Finset.mem_sdiff.mpr
        refine ⟨Finset.mem_filter.mpr ⟨hvFirstA, ?_⟩, hvOff⟩
        simpa [dist_comm] using (mem_selectedClass.mp hvFirst).2
      have huHit : u.1 ∈
          (((D.A.filter fun x => dist x S.oppApex1 = radius) \ S.surplusCap).filter
            fun x => x ∈ SelectedClass D.A S.oppApex2 rho) :=
        Finset.mem_filter.mpr ⟨huMarginal, huClass⟩
      have hvHit : v.1 ∈
          (((D.A.filter fun x => dist x S.oppApex1 = radius) \ S.surplusCap).filter
            fun x => x ∈ SelectedClass D.A S.oppApex2 rho) :=
        Finset.mem_filter.mpr ⟨hvMarginal, hvClass⟩
      have hcard := firstApex_marginal_inter_secondClass_card_le_one
        D S radius rho
      rw [Finset.card_le_one] at hcard
      have huv : u.1 = v.1 := hcard u.1 huHit v.1 hvHit
      exact (huNeV (Subtype.ext huv)).elim
    · exact Or.inr (Or.inr
        ⟨huFirst,
          b1_source_mem_outsideFirstApexFiber_of_not_mem_firstApexClass
            R hvFirst⟩)
  · have huOutside :=
      b1_source_mem_outsideFirstApexFiber_of_not_mem_firstApexClass R huFirst
    by_cases hvFirst : v.1 ∈ SelectedClass D.A S.oppApex1 radius
    · exact Or.inr (Or.inl
        ⟨huOutside, hvFirst⟩)
    · have hvOutside :=
        b1_source_mem_outsideFirstApexFiber_of_not_mem_firstApexClass R hvFirst
      by_cases hsurvives :
          HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
              ((lateFirstApexSystem R).centerAt u.1 u.2) ∨
            HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
              ((lateFirstApexSystem R).centerAt u.1 u.2) ∨
            HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
              ((lateFirstApexSystem R).centerAt v.1 v.2) ∨
            HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
              ((lateFirstApexSystem R).centerAt v.1 v.2)
      · exact Or.inl ⟨huOutside, hvOutside, hsurvives⟩
      · exfalso
        have huBad : u ∈ interiorPairBadOutsideSources R := by
          refine Finset.mem_filter.mpr ⟨huOutside, ?_⟩
          exact ⟨(by intro hq; exact hsurvives (Or.inl hq)),
            (by intro hw; exact hsurvives (Or.inr (Or.inl hw)))⟩
        have hvBad : v ∈ interiorPairBadOutsideSources R := by
          refine Finset.mem_filter.mpr ⟨hvOutside, ?_⟩
          exact ⟨(by
              intro hq
              exact hsurvives (Or.inr (Or.inr (Or.inl hq)))),
            (by
              intro hw
              exact hsurvives (Or.inr (Or.inr (Or.inr hw))))⟩
        have huEntry : u ∈
            (interiorPairBadOutsideSources R).filter fun source =>
              source.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
                source.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
          Finset.mem_filter.mpr ⟨huBad, ⟨huClass, huInterior⟩⟩
        have hvEntry : v ∈
            (interiorPairBadOutsideSources R).filter fun source =>
              source.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
                source.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
          Finset.mem_filter.mpr ⟨hvBad, ⟨hvClass, hvInterior⟩⟩
        have hcard := interiorPairBad_secondClassInterior_card_le_one
          R surface.secondApex_robust (rho := rho)
        rw [Finset.card_le_one] at hcard
        exact huNeV (hcard u huEntry v hvEntry)


end ATailFrontierLiveClosure
end Problem97
