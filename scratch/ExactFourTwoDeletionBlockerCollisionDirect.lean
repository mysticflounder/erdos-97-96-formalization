/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Direct analysis of the exact-four two-deletion blocker collision

The collision hypotheses determine the complete carrier intersection of the
perpendicular bisector of the two deleted sources.  It consists of the common
actual blocker and the physical apex.  In particular, the two arm blockers
cannot supply the third equidistant carrier point needed for the usual
perpendicular-bisector contradiction.

The final theorem below records the exact additional endpoint-equidistance
bridge that would turn this normal form into `False`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

/-- In the blocker-collision branch, the common deleted-source row meets the
physical-apex class exactly in the two deleted sources, and those sources'
perpendicular bisector contains exactly the common blocker and physical apex
among carrier points.  Consequently neither arm blocker is equidistant from
the two deleted sources. -/
theorem
    twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
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
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hsupportsEq :
      ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (hfirstMemSecondRow :
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (hsecondMemFirstRow :
      second.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support)
    (hclassIntersectionTwo :
      ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card = 2)) :
    D.A.filter (fun z =>
        dist z first.deleted.1 = dist z second.deleted.1) =
        { (lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2, S.oppApex2 } ∧
      ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho =
        { first.deleted.1, second.deleted.1 } ∧
      dist ((lateFirstApexSystem R).centerAt u.1 u.2)
          first.deleted.1 ≠
        dist ((lateFirstApexSystem R).centerAt u.1 u.2)
          second.deleted.1 ∧
      dist ((lateFirstApexSystem R).centerAt v.1 v.2)
          first.deleted.1 ≠
        dist ((lateFirstApexSystem R).centerAt v.1 v.2)
          second.deleted.1 := by
  classical
  let Hlate := lateFirstApexSystem R
  let q := first.deleted.1
  let r := second.deleted.1
  let b := Hlate.centerAt first.deleted.1 first.deleted.2
  let a := S.oppApex2
  have hqNeR : q ≠ r := by
    intro hqr
    exact hdeletedNe (Subtype.ext hqr)
  have haA : a ∈ D.A := by
    simpa [a] using first.uPacket.center₂_mem_A
  have hbA : b ∈ D.A := by
    exact (Finset.mem_erase.mp
      (Hlate.selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.center_mem).2
  have haEq : dist a q = dist a r := by
    exact (mem_selectedClass.mp first.deleted_mem_class).2.trans
      ((mem_selectedClass.mp second.deleted_mem_class).2).symm
  have hqOwn :
      q ∈ (Hlate.selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support :=
    (Hlate.selectedAt
      first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support
  have hrOwn :
      r ∈ (Hlate.selectedAt
        second.deleted.1 second.deleted.2).toCriticalFourShell.support :=
    (Hlate.selectedAt
      second.deleted.1 second.deleted.2).toCriticalFourShell.q_mem_support
  have hbCommon :
      b = Hlate.centerAt second.deleted.1 second.deleted.2 := by
    simpa [b, Hlate] using hblockersEq
  have hbEq : dist b q = dist b r := by
    rw [hbCommon]
    exact
      ((Hlate.selectedAt
        second.deleted.1 second.deleted.2).toCriticalFourShell.support_eq_radius
          q hfirstMemSecondRow).trans
      (((Hlate.selectedAt
        second.deleted.1 second.deleted.2).toCriticalFourShell.support_eq_radius
          r hrOwn).symm)
  have hbNeA : b ≠ a := by
    simpa [b, a, Hlate] using first.uPacket.actual_blocker_ne_center₂
  have hbound :
      (D.A.filter (fun z => dist z q = dist z r)).card ≤ 2 :=
    Dumitrescu.perpBisector_apex_bound D.convex
      first.deleted.2 second.deleted.2 hqNeR
  have hpairSubset :
      ({b, a} : Finset ℝ²) ⊆
        D.A.filter (fun z => dist z q = dist z r) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_filter.mpr ⟨hbA, hbEq⟩
    · exact Finset.mem_filter.mpr ⟨haA, haEq⟩
  have hfilter :
      D.A.filter (fun z => dist z q = dist z r) = {b, a} := by
    apply (Finset.eq_of_subset_of_card_le hpairSubset ?_).symm
    simpa [hbNeA] using hbound
  have hqClass : q ∈ SelectedClass D.A S.oppApex2 rho := by
    simpa [q] using first.deleted_mem_class
  have hrClass : r ∈ SelectedClass D.A S.oppApex2 rho := by
    simpa [r] using second.deleted_mem_class
  have hpairClassSubset :
      ({q, r} : Finset ℝ²) ⊆
        (Hlate.selectedAt
              first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hqOwn, hqClass⟩
    · exact Finset.mem_inter.mpr ⟨hsecondMemFirstRow, hrClass⟩
  have hclassIntersection :
      (Hlate.selectedAt
              first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho =
        {q, r} := by
    apply (Finset.eq_of_subset_of_card_le hpairClassSubset ?_).symm
    simpa [hqNeR, Hlate] using le_of_eq hclassIntersectionTwo
  have huNotEq :
      dist (Hlate.centerAt u.1 u.2) q ≠
        dist (Hlate.centerAt u.1 u.2) r := by
    intro huEq
    have huFilter :
        Hlate.centerAt u.1 u.2 ∈
          D.A.filter (fun z => dist z q = dist z r) :=
      Finset.mem_filter.mpr ⟨first.uPacket.center₁_mem_A, huEq⟩
    rw [hfilter] at huFilter
    simp only [Finset.mem_insert, Finset.mem_singleton] at huFilter
    rcases huFilter with huBlocker | huApex
    · exact first.uPacket.actual_blocker_ne_center₁
        (by simpa [b, Hlate] using huBlocker.symm)
    · exact first.uPacket.centers_ne
        (by simpa [a, Hlate] using huApex)
  have hvNotEq :
      dist (Hlate.centerAt v.1 v.2) q ≠
        dist (Hlate.centerAt v.1 v.2) r := by
    intro hvEq
    have hvFilter :
        Hlate.centerAt v.1 v.2 ∈
          D.A.filter (fun z => dist z q = dist z r) :=
      Finset.mem_filter.mpr ⟨first.vPacket.center₁_mem_A, hvEq⟩
    rw [hfilter] at hvFilter
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvFilter
    rcases hvFilter with hvBlocker | hvApex
    · exact first.vPacket.actual_blocker_ne_center₁
        (by simpa [b, Hlate] using hvBlocker.symm)
    · exact first.vPacket.centers_ne
        (by simpa [a, Hlate] using hvApex)
  exact ⟨
    by simpa [q, r, b, a, Hlate] using hfilter,
    by simpa [q, r, Hlate] using hclassIntersection,
    by simpa [q, r, Hlate] using huNotEq,
    by simpa [q, r, Hlate] using hvNotEq ⟩

/-- The original collision context becomes contradictory as soon as either arm
blocker is proved equidistant from the two deleted endpoints.  This is the
missing implication not supplied by `CommonDeletionTwoCenterPacket`: its
survival rows do not identify the deleted endpoints as row members. -/
theorem
    false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision_of_endpointEquidistance
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hblockersEq :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (hsupportsEq :
      ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (hfirstMemSecondRow :
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (hsecondMemFirstRow :
      second.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support)
    (hclassIntersectionTwo :
      ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card = 2))
    (hendpointEquidistance :
      dist ((lateFirstApexSystem R).centerAt u.1 u.2)
          first.deleted.1 =
          dist ((lateFirstApexSystem R).centerAt u.1 u.2)
            second.deleted.1 ∨
        dist ((lateFirstApexSystem R).centerAt v.1 v.2)
          first.deleted.1 =
          dist ((lateFirstApexSystem R).centerAt v.1 v.2)
            second.deleted.1) :
    False := by
  have hnormal :=
    twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision_normalForm
      R hcard surface rho hrho hfive u v huNeV huClass hvClass
      hvOmitted huOmitted first second hdeletedNe hblockersEq hsupportsEq
      hfirstMemSecondRow hsecondMemFirstRow hclassIntersectionTwo
  rcases hnormal with ⟨_, _, huNotEq, hvNotEq⟩
  exact hendpointEquidistance.elim huNotEq hvNotEq

end ATailFrontierLiveClosure
end Problem97
