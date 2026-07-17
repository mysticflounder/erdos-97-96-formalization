/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFiveCommonDeletionNormalForm

/-!
# Exact-five physical-source omission continuation

The exact-five branch naturally produces recurrence rather than a local
descent. At every physical strict-cap source, its actual critical shell can
contain at most two physical strict-cap members. Since there are at least
three such members, another physical strict-cap source always avoids that
shell. Deleting the omitted source therefore preserves K4 at the current
source's actual blocker.

This is a source-faithful positive normal form, not a terminal contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLargeCapUniqueFivePhysicalOmissionSuccessor

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

private theorem physicalApex_survives_erase
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (deleted : ℝ²) :
    HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2 := by
  refine ⟨profile.radius, profile.radius_pos, ?_⟩
  have hfive :
      5 ≤ (SelectedClass D.A S.oppApex2 profile.radius).card := by
    rw [profile.class_card_eq_five]
  have hfour := selectedClass_erase_card_ge_of_succ_le
    (A := D.A) (x := deleted) (s := S.oppApex2)
    (d := profile.radius) (n := 4) hfive
  simpa [SelectedClass] using hfour

/-- An actual critical shell at a physical strict-cap source contains at most
two physical strict-cap members of the exact-five class. -/
theorem actualCriticalSupport_physicalInterior_inter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (q : ℝ²)
    (hqPhysical :
      q ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2) :
    (((SelectedClass D.A S.oppApex2 profile.radius ∩
          S.capInteriorByIndex S.oppIndex2) ∩
        (H.selectedAt q (mem_selectedClass.mp
          (Finset.mem_inter.mp hqPhysical).1).1).toCriticalFourShell.support).card ≤ 2) := by
  classical
  let P := SelectedClass D.A S.oppApex2 profile.radius ∩
    S.capInteriorByIndex S.oppIndex2
  have hqA : q ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hqPhysical).1).1
  let K := (H.selectedAt q hqA).toCriticalFourShell
  change (P ∩ K.support).card ≤ 2
  by_contra hnot
  have hthree : 3 ≤ (P ∩ K.support).card := by omega
  rcases Finset.one_lt_card.mp (show 1 < (P ∩ K.support).card by omega) with
    ⟨x, hx, y, hy, hxy⟩
  have hxP : x ∈ P := (Finset.mem_inter.mp hx).1
  have hyP : y ∈ P := (Finset.mem_inter.mp hy).1
  have hxK : x ∈ K.support := (Finset.mem_inter.mp hx).2
  have hyK : y ∈ K.support := (Finset.mem_inter.mp hy).2
  have hphysicalSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2 :=
    physicalApex_survives_erase (profile := profile) q
  have hcenterNe : H.centerAt q hqA ≠ S.oppApex2 := by
    intro hcenter
    apply H.no_qfree_at q hqA
    simpa only [hcenter] using hphysicalSurvives
  have hcenterA : H.centerAt q hqA ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hcenterEq :
      dist (H.centerAt q hqA) x = dist (H.centerAt q hqA) y :=
    (K.support_eq_radius x hxK).trans (K.support_eq_radius y hyK).symm
  have hxPhysical := Finset.mem_inter.mp hxP
  have hyPhysical := Finset.mem_inter.mp hyP
  have hphysicalEq :
      dist S.oppApex2 x = dist S.oppApex2 y :=
    (mem_selectedClass.mp hxPhysical.1).2.trans
      (mem_selectedClass.mp hyPhysical.1).2.symm
  have hcenterInterior :
      H.centerAt q hqA ∈ S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior
      hcenterA hcenterNe hxPhysical.2 hyPhysical.2 hxy hcenterEq hphysicalEq
  have hcenterCap : H.centerAt q hqA ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hcenterInterior
  have hsub :
      P ∩ K.support ⊆ K.support ∩ S.capByIndex S.oppIndex2 := by
    intro z hz
    have hzP := (Finset.mem_inter.mp hz).1
    exact Finset.mem_inter.mpr
      ⟨(Finset.mem_inter.mp hz).2,
        S.capInteriorByIndex_subset_capByIndex S.oppIndex2
          (Finset.mem_inter.mp hzP).2⟩
  have htwo : (K.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    simpa [K] using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 K.toSelectedFourClass hcenterCap
  have := (Finset.card_le_card hsub).trans htwo
  omega

/-- Every physical strict-cap source has a distinct physical strict-cap
successor omitted by its actual critical shell. -/
theorem exists_distinct_physicalInterior_not_mem_actualCriticalSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (q : ℝ²)
    (hqPhysical :
      q ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2) :
    ∃ w : ℝ²,
      w ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2 ∧
      w ≠ q ∧
      w ∉ (H.selectedAt q (mem_selectedClass.mp
        (Finset.mem_inter.mp hqPhysical).1).1).toCriticalFourShell.support := by
  classical
  let P := SelectedClass D.A S.oppApex2 profile.radius ∩
    S.capInteriorByIndex S.oppIndex2
  have hqA : q ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hqPhysical).1).1
  let K := (H.selectedAt q hqA).toCriticalFourShell
  have hPthree : 3 ≤ P.card := by
    simpa [P] using three_le_capInterior_hits_of_largeCapUniqueFive profile
  have hinterTwo : (P ∩ K.support).card ≤ 2 := by
    simpa [P, K] using
      actualCriticalSupport_physicalInterior_inter_card_le_two
        H profile q hqPhysical
  have hsplit := Finset.card_sdiff_add_card_inter P K.support
  have hdiffPos : 0 < (P \ K.support).card := by omega
  rcases Finset.card_pos.mp hdiffPos with ⟨w, hw⟩
  have hwP : w ∈ P := (Finset.mem_sdiff.mp hw).1
  have hwNotK : w ∉ K.support := (Finset.mem_sdiff.mp hw).2
  have hqK : q ∈ K.support := K.q_mem_support
  have hwNe : w ≠ q := by
    intro hwq
    apply hwNotK
    simpa only [hwq] using hqK
  exact ⟨w, by simpa [P] using hwP, hwNe, by simpa [K] using hwNotK⟩

/-- The omitted physical successor is exactly a cross-deletion survivor at
the source's actual blocker. -/
theorem exists_distinct_physicalInterior_survives_actualBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (q : ℝ²)
    (hqPhysical :
      q ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2) :
    ∃ w : ℝ²,
      w ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2 ∧
      w ≠ q ∧
      HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt q (mem_selectedClass.mp
          (Finset.mem_inter.mp hqPhysical).1).1) := by
  rcases exists_distinct_physicalInterior_not_mem_actualCriticalSupport
      H profile q hqPhysical with ⟨w, hwPhysical, hwq, hwOutside⟩
  refine ⟨w, hwPhysical, hwq, ?_⟩
  exact (cross_deletion_survives_iff_not_mem_selected_support H _).mpr hwOutside

end ATailLargeCapUniqueFivePhysicalOmissionSuccessor
end Problem97
