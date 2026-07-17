/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Scratch: actual-center classifier for a frontier common pair

On a directed cross-membership arm, the first apex and the selected blocker
at the first source are already two carrier centers equidistant from the
frontier pair.  Convex independence permits no third carrier center on the
same perpendicular bisector.

This module records the source-faithful consequence for the retained total
`CriticalShellSystem`: at every source, its actual blocker either preserves
one of the two frontier-source deletions or coincides with one of the two
known centers.  The full frontier has one additional exact-card-four escape,
where the selected blocker need not be distinct from the first apex.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailThirdCenterCommonPairScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

private theorem firstApex_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) :
    H.centerAt source hsource ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt source hsource).toCriticalFourShell.center_mem).2

/-- The first apex is equidistant from the two points of a survivor pair. -/
theorem firstApex_dist_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    dist S.oppApex1 P.q = dist S.oppApex1 P.w := by
  have hq : dist P.q S.oppApex1 = r :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
  have hw : dist P.w S.oppApex1 = r :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.w_mem_marginal).1).2
  simpa only [dist_comm] using hq.trans hw.symm

/-- A directed cross hit makes the blocker selected at `P.q` equidistant
from the two frontier points. -/
theorem sourceBlocker_dist_eq_of_crossMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support) :
    dist (H.centerAt P.q P.q_mem_A) P.q =
      dist (H.centerAt P.q P.q_mem_A) P.w := by
  exact
    (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
      P.q (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support
    |>.trans
      ((H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
        P.w hwSupport).symm

/-- Once the first apex and `P.q`'s actual blocker are distinct common-pair
centers, no third actual blocker center can have a selected critical row
containing both frontier points. -/
theorem false_of_thirdActualCenter_selectedRow_contains_frontierPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hqBlocker_ne_first :
      H.centerAt P.q P.q_mem_A ≠ S.oppApex1)
    {source : ℝ²} (hsource : source ∈ D.A)
    (hthird_ne_first : H.centerAt source hsource ≠ S.oppApex1)
    (hthird_ne_qBlocker :
      H.centerAt source hsource ≠ H.centerAt P.q P.q_mem_A)
    (hqThird :
      P.q ∈ (H.selectedAt source hsource).toCriticalFourShell.support)
    (hwThird :
      P.w ∈ (H.selectedAt source hsource).toCriticalFourShell.support) :
    False := by
  let o := S.oppApex1
  let b := H.centerAt P.q P.q_mem_A
  let z := H.centerAt source hsource
  have hoA : o ∈ D.A := by
    simpa [o] using firstApex_mem_A S
  have hbA : b ∈ D.A := by
    simpa [b] using blocker_mem_A H P.q_mem_A
  have hzA : z ∈ D.A := by
    simpa [z] using blocker_mem_A H hsource
  have hoEq : dist o P.q = dist o P.w := by
    simpa [o] using firstApex_dist_eq P
  have hbEq : dist b P.q = dist b P.w := by
    simpa [b] using sourceBlocker_dist_eq_of_crossMembership P hwSupport
  have hzEq : dist z P.q = dist z P.w := by
    exact
      (H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
        P.q hqThird
      |>.trans
        ((H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
          P.w hwThird).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    P.q_mem_A P.w_mem_A P.q_ne_w
  have hoFilter :
      o ∈ D.A.filter (fun center ↦ dist center P.q = dist center P.w) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have hbFilter :
      b ∈ D.A.filter (fun center ↦ dist center P.q = dist center P.w) :=
    Finset.mem_filter.mpr ⟨hbA, hbEq⟩
  have hzFilter :
      z ∈ D.A.filter (fun center ↦ dist center P.q = dist center P.w) :=
    Finset.mem_filter.mpr ⟨hzA, hzEq⟩
  have hthree :
      2 < (D.A.filter
        (fun center ↦ dist center P.q = dist center P.w)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, b, hbFilter, z, hzFilter,
      hqBlocker_ne_first.symm, hthird_ne_first.symm,
      hthird_ne_qBlocker.symm⟩
  omega

/-- At any source of the retained total critical map, simultaneous failure
of the two frontier-source deletions forces that source's actual blocker to
be one of the two already known common-pair centers. -/
theorem actualBlocker_eq_knownCenter_of_both_frontierDeletions_blocked
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hqBlocker_ne_first :
      H.centerAt P.q P.q_mem_A ≠ S.oppApex1)
    {source : ℝ²} (hsource : source ∈ D.A)
    (hqBlocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source hsource))
    (hwBlocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt source hsource)) :
    H.centerAt source hsource = S.oppApex1 ∨
      H.centerAt source hsource = H.centerAt P.q P.q_mem_A := by
  have hqThird :
      P.q ∈ (H.selectedAt source hsource).toCriticalFourShell.support :=
    source_mem_critical_support_of_no_qfree
      (H.selectedAt source hsource) hqBlocked
  have hwThird :
      P.w ∈ (H.selectedAt source hsource).toCriticalFourShell.support :=
    source_mem_critical_support_of_no_qfree
      (H.selectedAt source hsource) hwBlocked
  by_cases hfirst : H.centerAt source hsource = S.oppApex1
  · exact Or.inl hfirst
  · by_cases hblocker :
      H.centerAt source hsource = H.centerAt P.q P.q_mem_A
    · exact Or.inr hblocker
    · exact False.elim
        (false_of_thirdActualCenter_selectedRow_contains_frontierPair
          P hwSupport hqBlocker_ne_first hsource hfirst hblocker
          hqThird hwThird)

/-- The missing producer can be stated without row names: both frontier
deletions fail at an actual blocker exactly when that source's selected
critical row contains both frontier points. -/
theorem both_frontierDeletions_blocked_iff_selectedRow_contains_pair
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q w source : ℝ²} (hsource : source ∈ D.A) :
    ((¬ HasNEquidistantPointsAt 4 (D.A.erase q)
          (H.centerAt source hsource)) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt source hsource)) ↔
      (q ∈ (H.selectedAt source hsource).toCriticalFourShell.support ∧
        w ∈ (H.selectedAt source hsource).toCriticalFourShell.support) := by
  constructor
  · rintro ⟨hqBlocked, hwBlocked⟩
    exact ⟨
      source_mem_critical_support_of_no_qfree
        (H.selectedAt source hsource) hqBlocked,
      source_mem_critical_support_of_no_qfree
        (H.selectedAt source hsource) hwBlocked⟩
  · rintro ⟨hqSupport, hwSupport⟩
    constructor
    · intro hqSurvives
      exact ((cross_deletion_survives_iff_not_mem_selected_support
        H hsource).mp hqSurvives) hqSupport
    · intro hwSurvives
      exact ((cross_deletion_survives_iff_not_mem_selected_support
        H hsource).mp hwSurvives) hwSupport

/-- Existential terminal form: after the two known common-pair centers have
been separated, there is no source whose actual blocker is genuinely third
and whose selected row contains the frontier pair. -/
theorem not_exists_thirdActualCenter_selectedRow_contains_frontierPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hqBlocker_ne_first :
      H.centerAt P.q P.q_mem_A ≠ S.oppApex1) :
    ¬ ∃ (source : ℝ²) (hsource : source ∈ D.A),
      H.centerAt source hsource ≠ S.oppApex1 ∧
        H.centerAt source hsource ≠ H.centerAt P.q P.q_mem_A ∧
        P.q ∈ (H.selectedAt source hsource).toCriticalFourShell.support ∧
        P.w ∈ (H.selectedAt source hsource).toCriticalFourShell.support := by
  rintro ⟨source, hsource, hfirst, hblocker, hqThird, hwThird⟩
  exact false_of_thirdActualCenter_selectedRow_contains_frontierPair
    P hwSupport hqBlocker_ne_first hsource hfirst hblocker hqThird hwThird

/-- Total-map classifier for one source: its actual blocker preserves one of
the frontier-source deletions or is one of the two saturated common-pair
centers. -/
theorem frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hqBlocker_ne_first :
      H.centerAt P.q P.q_mem_A ≠ S.oppApex1)
    {source : ℝ²} (hsource : source ∈ D.A) :
    HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source hsource) ∨
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt source hsource) ∨
      H.centerAt source hsource = S.oppApex1 ∨
      H.centerAt source hsource = H.centerAt P.q P.q_mem_A := by
  by_cases hqSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source hsource)
  · exact Or.inl hqSurvives
  · by_cases hwSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt source hsource)
    · exact Or.inr (Or.inl hwSurvives)
    · rcases actualBlocker_eq_knownCenter_of_both_frontierDeletions_blocked
        P hwSupport hqBlocker_ne_first hsource hqSurvives hwSurvives with
      hfirst | hblocker
      · exact Or.inr (Or.inr (Or.inl hfirst))
      · exact Or.inr (Or.inr (Or.inr hblocker))

private theorem q_firstApex_survives_of_double
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hdouble :
      HasNEquidistantPointsAt 4
        ((D.A.erase P.q).erase P.w) S.oppApex1) :
    HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex1 := by
  rcases hdouble with ⟨radius, hradius, hfour⟩
  refine ⟨radius, hradius, le_trans hfour (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzErase, hzdist⟩
  exact Finset.mem_filter.mpr ⟨(Finset.mem_erase.mp hzErase).2, hzdist⟩

private theorem q_firstApex_survives_of_five_le
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex1 r).card) :
    HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex1 := by
  refine ⟨r, hr, ?_⟩
  simpa [SelectedClass] using
    selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := P.q) (s := S.oppApex1) (d := r) (n := 4) hfive

/-- Full-frontier form.  On a directed cross hit, every source of the total
critical map satisfies the survival/alignment classifier unless the first
apex lies in the exact-card-four unique-radius arm. -/
theorem cardFour_or_frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (hr : 0 < r)
    (hwSupport :
      F.pair.w ∈
        (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support)
    {source : ℝ²} (hsource : source ∈ D.A) :
    (SelectedClass D.A S.oppApex1 r).card = 4 ∨
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
          (H.centerAt source hsource) ∨
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
          (H.centerAt source hsource) ∨
      H.centerAt source hsource = S.oppApex1 ∨
      H.centerAt source hsource =
        H.centerAt F.pair.q F.pair.q_mem_A := by
  have classify
      (hqFirst :
        HasNEquidistantPointsAt 4
          (D.A.erase F.pair.q) S.oppApex1) :
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
          (H.centerAt source hsource) ∨
        HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
          (H.centerAt source hsource) ∨
        H.centerAt source hsource = S.oppApex1 ∨
        H.centerAt source hsource =
          H.centerAt F.pair.q F.pair.q_mem_A := by
    have hne :
        H.centerAt F.pair.q F.pair.q_mem_A ≠ S.oppApex1 :=
      actual_blocker_ne_of_deletion_survives
        H F.pair.q_mem_A hqFirst
    exact frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
      F.pair hwSupport hne hsource
  rcases F.firstApexSplit with hdouble | ⟨hcard, _hunique⟩
  · exact Or.inr (classify
      (q_firstApex_survives_of_double F.pair hdouble))
  · rcases hcard with hfour | hfive
    · exact Or.inl hfour
    · have hfive' :
        5 ≤ (SelectedClass D.A S.oppApex1 r).card := by omega
      exact Or.inr (classify
        (q_firstApex_survives_of_five_le F.pair hr hfive'))

#print axioms firstApex_dist_eq
#print axioms sourceBlocker_dist_eq_of_crossMembership
#print axioms false_of_thirdActualCenter_selectedRow_contains_frontierPair
#print axioms actualBlocker_eq_knownCenter_of_both_frontierDeletions_blocked
#print axioms both_frontierDeletions_blocked_iff_selectedRow_contains_pair
#print axioms not_exists_thirdActualCenter_selectedRow_contains_frontierPair
#print axioms frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
#print axioms cardFour_or_frontierDeletionSurvival_or_actualBlocker_eq_knownCenter

end ATailThirdCenterCommonPairScratch
end Problem97
