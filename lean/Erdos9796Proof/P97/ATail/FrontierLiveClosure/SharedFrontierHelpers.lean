/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletionCore

/-!
# Shared frontier helpers for the B1 / TwoDeletion boundary

This module holds the B1 live-frontier declarations that both the `B1Live`
cluster module and the `TwoDeletion` cluster module need.  They were moved
here verbatim from
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1Live` so that
`...FrontierLiveClosure.TwoDeletionCollision` no longer has to import a B1
cluster module, retiring the forbidden `TwoDeletion -> B1` cross-cluster
import edge recorded in `proof-status/import-waivers.json`.

What moved, in its original order:

* `b1_live_normalForm`
* `b1_live_bisectorSet_eq_pair`
* `b1_live_exists_third_interior_escape`
* `b1_live_escape_small_overlap`
* `b1_live_canonical_blocker_pinnedMultiplicity_eq_four`
* `b1_live_escape_physicalClass_inter_firstShell_card_le_two`
* `b1_live_false_of_escape_overlap_ge_three`
* `b1_live_false_of_third_bisector_carrier`
* `false_of_bisector_fiber_card_ge_three_of_eq_pair`
* `b1_live_false_of_bisector_fiber_card_ge_three`
* `B1GlobalTransportContext`
* `B1GlobalGapOrClosedTerminal`
* `false_of_b1_global_gap_or_closed_terminal`

The declaration text, its namespace nesting and the surrounding `open` set are
unchanged, so every statement, hypothesis and proof term is byte-identical to
the `B1Live` original.  `B1Live` imports this module, so its own remaining
declarations and all of its importers still see these names unqualified.

The basename deliberately matches no cluster prefix, so
`scripts/lint_cluster_imports.py` classifies this module as `shared`.
-/

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

/- A canonical blocker selected at an escaped carrier point cannot be the
   unresolved large-multiplicity centre: criticality makes every such centre
   a unique-four centre.  This is the centre-transport half of the producer
   split; it leaves the genuinely noncanonical μ ≥ 5 branch explicit. -/
theorem b1_live_canonical_blocker_pinnedMultiplicity_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (t : ℝ²) (htA : t ∈ D.A) :
    pinnedMultiplicity D.A
        ((lateFirstApexSystem R).centerAt t htA) = 4 := by
  exact pinnedMultiplicity_eq_four_of_isUniqueFourCenter
    (isUniqueFourCenter_centerAt (lateFirstApexSystem R) t htA)

/- The μ = 4 branch exposes the escaped canonical shell as a full physical
   radius class.  It is phrased against the existing overlap consumer so a
   future global producer can use physical-class language without silently
   changing the selected-shell trust boundary. -/
theorem b1_live_escape_physicalClass_inter_firstShell_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    {rho : ℝ} {u v : CarrierVertex D.A}
    (first : ExactFourMutualOmissionJointDeletion R rho u v)
    (t : ℝ²) (htA : t ∈ D.A)
    (htNotRow : t ∉
      ((lateFirstApexSystem R).selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support) :
    (SelectedClass D.A
        ((lateFirstApexSystem R).centerAt t htA)
        ((lateFirstApexSystem R).selectedAt t htA).toCriticalFourShell.radius ∩
      ((lateFirstApexSystem R).selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support).card ≤ 2 := by
  have hclass :=
    selectedClass_eq_support_of_pinnedMultiplicity_eq_four
      ((lateFirstApexSystem R).selectedAt t htA).toSelectedFourClass
      (b1_live_canonical_blocker_pinnedMultiplicity_eq_four R t htA)
  have hphysical :
      SelectedClass D.A ((lateFirstApexSystem R).centerAt t htA)
          ((lateFirstApexSystem R).selectedAt t htA).radius =
        ((lateFirstApexSystem R).selectedAt t htA).toCriticalFourShell.support := by
    simpa [CriticalFourShell.toSelectedFourClass] using hclass
  rw [hphysical]
  exact selected_support_inter_card_le_two_of_not_mem_other_selected_support
    (lateFirstApexSystem R) htA first.deleted.2 htNotRow

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

/-!
### PARKED-SPEC: global B1 transport interface

The local B1 consumers above have different argument lists, which made it
easy for a future producer to prove a nearby statement that could not actually
be fed to the live terminal.  This context packages the complete live packet
once.  `B1GlobalGapOrClosedTerminal` is the exact disjunction a source-level
transport theorem must produce:

* a third carrier on the deleted-source bisector;
* a direct cardinality lower bound on that bisector fiber; or
* the lower-overlap arm consumed by `b1_live_false_of_escape_overlap_ge_three`.

This is a checked consumer contract, not an assertion that the disjunction is
available.  It is deliberately not a load-bearing `sorry` or a publish target.
The missing producer and its arbitrary-cardinality lift remain separate.
-/
structure B1GlobalTransportContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H} where
  R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F
  hcard : 12 ≤ D.A.card
  surface : ExactFourPostCardElevenRobustSurface R
  rho : ℝ
  hrho : 0 < rho
  hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card
  u : CarrierVertex D.A
  v : CarrierVertex D.A
  huNeV : u ≠ v
  huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho
  hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho
  hvOmitted :
    v.1 ∉
      ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support
  huOmitted :
    u.1 ∉
      ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support
  first : ExactFourMutualOmissionJointDeletion R rho u v
  second : ExactFourMutualOmissionJointDeletion R rho u v
  hdeletedNe : first.deleted ≠ second.deleted
  hblockersEq :
    (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 =
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2

def B1GlobalGapOrClosedTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Prop :=
  (∃ c : ℝ²,
      c ∈ D.A ∧
      c ≠ (lateFirstApexSystem C.R).centerAt
        C.first.deleted.1 C.first.deleted.2 ∧
      c ≠ S.oppApex2 ∧
      dist c C.first.deleted.1 = dist c C.second.deleted.1) ∨
    (3 ≤
      (D.A.filter
        (fun p ↦ dist p C.first.deleted.1 = dist p C.second.deleted.1)).card) ∨
    (∀ (t : ℝ²),
      t ∈
        (SelectedClass D.A S.oppApex2 C.rho ∩
          S.capInteriorByIndex S.oppIndex2) →
      ∀ (htA : t ∈ D.A),
        t ≠ C.first.deleted.1 →
        t ≠ C.second.deleted.1 →
        t ∉
          ((lateFirstApexSystem C.R).selectedAt
            C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.support →
        (lateFirstApexSystem C.R).centerAt t htA ≠
          (lateFirstApexSystem C.R).centerAt
            C.first.deleted.1 C.first.deleted.2 →
        3 ≤
          (((lateFirstApexSystem C.R).selectedAt t htA).toCriticalFourShell.support ∩
            ((lateFirstApexSystem C.R).selectedAt
              C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.support).card)

theorem false_of_b1_global_gap_or_closed_terminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hterminal : B1GlobalGapOrClosedTerminal C) : False := by
  rcases hterminal with hthird | hfiber | hoverlap
  · rcases hthird with ⟨c, hcA, hcNeBlocker, hcNeApex, hcBisects⟩
    exact b1_live_false_of_third_bisector_carrier C.R C.hcard C.surface C.rho
      C.hrho C.hfive C.u C.v C.huNeV C.huClass C.hvClass C.hvOmitted
      C.huOmitted C.first C.second C.hdeletedNe C.hblockersEq c hcA
      hcNeBlocker hcNeApex hcBisects
  · exact b1_live_false_of_bisector_fiber_card_ge_three C.R C.hcard C.surface
      C.rho C.hrho C.hfive C.u C.v C.huNeV C.huClass C.hvClass C.hvOmitted
      C.huOmitted C.first C.second C.hdeletedNe C.hblockersEq hfiber
  · exact b1_live_false_of_escape_overlap_ge_three C.R C.hcard C.surface C.rho
      C.hrho C.hfive C.u C.v C.huNeV C.huClass C.hvClass C.hvOmitted
      C.huOmitted C.first C.second C.hdeletedNe C.hblockersEq hoverlap

end ATailFrontierLiveClosure
end Problem97
