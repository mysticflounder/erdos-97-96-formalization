/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFiveLowHit

/-!
# Scratch: actual-source row boundary for the exact-five continuation

The two origin-tagged deleted sources each have an actual critical row.  This
file records the strongest cap-local facts available from those rows without
an additional incidence producer:

* after removing its source, each actual row contains at most one point of the
  physical exact-five strict-cap class; and
* reciprocal source-row membership is equivalent to equality of the two
  actual blocker centers.

Thus the shortest U5 bank sink, which asks for two other dangerous-circle
points in one actual q-critical row, is already on the contradictory side of
the boundary.  Reciprocal membership also does not produce three distinct
bisector centers: it collapses the two actual blockers.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailPairedCommonDeletionConsumerMatchScratch

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- Once its source is removed, an actual critical row sourced in the physical
exact-five strict-cap class contains at most one further point of that class.

Two further hits would localize the actual blocker into the same cap.  The
source and those two hits would then give three same-cap points in one exact
row, contradicting the ordered-cap two-point bound. -/
theorem actualCriticalRow_otherPhysicalInterior_inter_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {source : ℝ²}
    (hsourcePhysical :
      source ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2)
    (hphysicalSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex2) :
    (((SelectedClass D.A S.oppApex2 profile.radius ∩
          S.capInteriorByIndex S.oppIndex2).erase source) ∩
        (H.selectedAt source
          (mem_selectedClass.mp (Finset.mem_inter.mp hsourcePhysical).1).1).toCriticalFourShell.support).card ≤ 1 := by
  classical
  let hsourceA : source ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hsourcePhysical).1).1
  let K := (H.selectedAt source hsourceA).toCriticalFourShell
  rw [Finset.card_le_one]
  intro x hx y hy
  have hxOther := Finset.mem_erase.mp (Finset.mem_inter.mp hx).1
  have hyOther := Finset.mem_erase.mp (Finset.mem_inter.mp hy).1
  have hxPhysical := Finset.mem_inter.mp hxOther.2
  have hyPhysical := Finset.mem_inter.mp hyOther.2
  have hxRow : x ∈ K.support := by
    simpa [K, hsourceA] using (Finset.mem_inter.mp hx).2
  have hyRow : y ∈ K.support := by
    simpa [K, hsourceA] using (Finset.mem_inter.mp hy).2
  by_contra hxy
  have hcenterNe : H.centerAt source hsourceA ≠ S.oppApex2 := by
    intro hcenter
    apply H.no_qfree_at source hsourceA
    simpa only [hcenter] using hphysicalSurvives
  have hcenterA : H.centerAt source hsourceA ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hcenterEq :
      dist (H.centerAt source hsourceA) x =
        dist (H.centerAt source hsourceA) y :=
    (K.support_eq_radius x hxRow).trans (K.support_eq_radius y hyRow).symm
  have hphysicalEq : dist S.oppApex2 x = dist S.oppApex2 y :=
    (mem_selectedClass.mp hxPhysical.1).2.trans
      (mem_selectedClass.mp hyPhysical.1).2.symm
  have hcenterInterior :
      H.centerAt source hsourceA ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior
      hcenterA hcenterNe hxPhysical.2 hyPhysical.2 hxy
      hcenterEq hphysicalEq
  have hcenterCap :
      H.centerAt source hsourceA ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hcenterInterior
  have htripleSubset :
      ({source, x, y} : Finset ℝ²) ⊆
        K.support ∩ S.capByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨K.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex2
            (Finset.mem_inter.mp hsourcePhysical).2⟩
    · exact Finset.mem_inter.mpr
        ⟨hxRow, S.capInteriorByIndex_subset_capByIndex S.oppIndex2
          hxPhysical.2⟩
    · exact Finset.mem_inter.mpr
        ⟨hyRow, S.capInteriorByIndex_subset_capByIndex S.oppIndex2
          hyPhysical.2⟩
  have htripleCard : ({source, x, y} : Finset ℝ²).card = 3 := by
    simp [Ne.symm hxOther.1, Ne.symm hyOther.1, hxy]
  have hthree : 3 ≤ (K.support ∩ S.capByIndex S.oppIndex2).card := by
    rw [← htripleCard]
    exact Finset.card_le_card htripleSubset
  have htwo : (K.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    simpa [K] using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 K.toSelectedFourClass hcenterCap
  omega

/-- The first source's actual row is below the shortest two-hit U5 sink. -/
theorem firstActualRow_otherPhysicalInterior_inter_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    (((SelectedClass D.A S.oppApex2 profile.radius ∩
          S.capInteriorByIndex S.oppIndex2).erase P.first) ∩
        (H.selectedAt P.first P.firstPacket.q_mem_A).toCriticalFourShell.support).card ≤ 1 := by
  simpa using actualCriticalRow_otherPhysicalInterior_inter_card_le_one
    P.first_mem_physicalInterior P.first_survives_physicalApex

/-- The second source's actual row is below the shortest two-hit U5 sink. -/
theorem secondActualRow_otherPhysicalInterior_inter_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    (((SelectedClass D.A S.oppApex2 profile.radius ∩
          S.capInteriorByIndex S.oppIndex2).erase P.second) ∩
        (H.selectedAt P.second P.secondPacket.q_mem_A).toCriticalFourShell.support).card ≤ 1 := by
  simpa using actualCriticalRow_otherPhysicalInterior_inter_card_le_one
    P.second_mem_physicalInterior P.second_survives_physicalApex

/-- For the two physical deleted sources, reciprocal actual-row membership is
equivalent to equality of their actual blockers.  The forward implication uses
the physical apex as the third potential bisector center; the reverse
implication is deletion criticality. -/
theorem actualBlockers_eq_iff_mutualCrossMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    H.centerAt P.first P.firstPacket.q_mem_A =
        H.centerAt P.second P.secondPacket.q_mem_A ↔
      (P.second ∈ (H.selectedAt P.first P.firstPacket.q_mem_A).toCriticalFourShell.support ∧
        P.first ∈ (H.selectedAt P.second P.secondPacket.q_mem_A).toCriticalFourShell.support) := by
  constructor
  · intro hcenters
    constructor
    · by_contra hsecondOutside
      exact (blocker_centers_ne_of_not_mem_other_selected_support
        H P.secondPacket.q_mem_A P.firstPacket.q_mem_A hsecondOutside)
        hcenters.symm
    · by_contra hfirstOutside
      exact (blocker_centers_ne_of_not_mem_other_selected_support
        H P.firstPacket.q_mem_A P.secondPacket.q_mem_A hfirstOutside)
        hcenters
  · rintro ⟨hsecondFirst, hfirstSecond⟩
    let cfirst := H.centerAt P.first P.firstPacket.q_mem_A
    let csecond := H.centerAt P.second P.secondPacket.q_mem_A
    let apex := S.oppApex2
    have hapexA : apex ∈ D.A := by
      simpa [apex] using oppApex2_mem_A S
    have hcfirstA : cfirst ∈ D.A := by
      exact (Finset.mem_erase.mp
        (H.selectedAt P.first P.firstPacket.q_mem_A).toCriticalFourShell.center_mem).2
    have hcsecondA : csecond ∈ D.A := by
      exact (Finset.mem_erase.mp
        (H.selectedAt P.second P.secondPacket.q_mem_A).toCriticalFourShell.center_mem).2
    have hcfirst_ne_apex : cfirst ≠ apex := by
      simpa [cfirst, apex] using P.firstPacket.actual_blocker_ne_center₂
    have hcsecond_ne_apex : csecond ≠ apex := by
      simpa [csecond, apex] using P.secondPacket.actual_blocker_ne_center₂
    have hapexEq : dist apex P.first = dist apex P.second := by
      exact
        (mem_selectedClass.mp
          (Finset.mem_inter.mp P.first_mem_physicalInterior).1).2.trans
        ((mem_selectedClass.mp
          (Finset.mem_inter.mp P.second_mem_physicalInterior).1).2).symm
    have hcfirstEq : dist cfirst P.first = dist cfirst P.second := by
      exact
        (H.selectedAt P.first P.firstPacket.q_mem_A).toCriticalFourShell.support_eq_radius
          P.first
            (H.selectedAt P.first P.firstPacket.q_mem_A).toCriticalFourShell.q_mem_support
        |>.trans
          ((H.selectedAt P.first P.firstPacket.q_mem_A).toCriticalFourShell.support_eq_radius
              P.second hsecondFirst).symm
    have hcsecondEq : dist csecond P.first = dist csecond P.second := by
      exact
        (H.selectedAt P.second P.secondPacket.q_mem_A).toCriticalFourShell.support_eq_radius
          P.first hfirstSecond
        |>.trans
          ((H.selectedAt P.second P.secondPacket.q_mem_A).toCriticalFourShell.support_eq_radius
            P.second
              (H.selectedAt P.second P.secondPacket.q_mem_A).toCriticalFourShell.q_mem_support).symm
    by_contra hcenters
    have hbound := Dumitrescu.perpBisector_apex_bound D.convex
      P.firstPacket.q_mem_A P.secondPacket.q_mem_A P.first_ne_second
    have hapexFilter :
        apex ∈ D.A.filter (fun z ↦ dist z P.first = dist z P.second) :=
      Finset.mem_filter.mpr ⟨hapexA, hapexEq⟩
    have hcfirstFilter :
        cfirst ∈ D.A.filter (fun z ↦ dist z P.first = dist z P.second) :=
      Finset.mem_filter.mpr ⟨hcfirstA, hcfirstEq⟩
    have hcsecondFilter :
        csecond ∈ D.A.filter (fun z ↦ dist z P.first = dist z P.second) :=
      Finset.mem_filter.mpr ⟨hcsecondA, hcsecondEq⟩
    have hthree :
        2 < (D.A.filter (fun z ↦ dist z P.first = dist z P.second)).card := by
      rw [Finset.two_lt_card]
      exact ⟨apex, hapexFilter, cfirst, hcfirstFilter,
        csecond, hcsecondFilter, hcfirst_ne_apex.symm,
        hcsecond_ne_apex.symm, hcenters⟩
    omega

#print axioms actualCriticalRow_otherPhysicalInterior_inter_card_le_one
#print axioms firstActualRow_otherPhysicalInterior_inter_card_le_one
#print axioms secondActualRow_otherPhysicalInterior_inter_card_le_one
#print axioms actualBlockers_eq_iff_mutualCrossMembership

end ATailPairedCommonDeletionConsumerMatchScratch
end Problem97
