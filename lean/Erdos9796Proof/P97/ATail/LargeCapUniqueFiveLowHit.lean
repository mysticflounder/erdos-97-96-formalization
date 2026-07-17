/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFiveCrossIncidence
import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter

/-!
# Exact-five low-hit continuation

The positive two-hit packet for the unused source's actual critical row is
already contradictory.  Its constructive complement is the useful output:
at least two strict-cap members of the physical exact-five class avoid that
actual row.  Deleting either member preserves K4 at both the actual blocker
and the physical apex, producing two origin-tagged common-deletion packets
with the same center pair.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLargeCapUniqueFiveLowHit

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveCrossIncidence

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- The actual retained row at the unused source has at most one physical
exact-five strict-cap hit.  Two hits instantiate the direct contradiction
packet. -/
theorem actualUnusedRow_physicalInterior_inter_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (R : LargeCapUniqueFiveUnusedCriticalRow D S H profile) :
    ((SelectedClass D.A S.oppApex2 profile.radius ∩
          S.capInteriorByIndex S.oppIndex2) ∩
        (H.selectedAt R.unused.point
          R.source_mem_A).toCriticalFourShell.support).card ≤ 1 := by
  classical
  rw [Finset.card_le_one]
  intro x hx y hy
  have hxPhysical :
      x ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2 :=
    (Finset.mem_inter.mp hx).1
  have hyPhysical :
      y ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2 :=
    (Finset.mem_inter.mp hy).1
  have hxRow :
      x ∈ (H.selectedAt R.unused.point
        R.source_mem_A).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hx).2
  have hyRow :
      y ∈ (H.selectedAt R.unused.point
        R.source_mem_A).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hy).2
  by_contra hxy
  exact false_of_largeCapUniqueFiveTwoHitCriticalRow
    { unused := R.unused
      center := H.centerAt R.unused.point R.source_mem_A
      row := H.selectedAt R.unused.point R.source_mem_A
      sourceDeletionBlocked := H.no_qfree_at R.unused.point R.source_mem_A
      x := x
      y := y
      x_ne_y := hxy
      x_mem_physicalInterior := hxPhysical
      y_mem_physicalInterior := hyPhysical
      x_mem_row := hxRow
      y_mem_row := hyRow }

/-- Two distinct physical strict-cap sources whose deletions preserve K4 at
the same actual blocker and physical apex.  The packet retains the unused
source and both concrete common-deletion packets. -/
structure LargeCapUniqueFiveTwoCommonDeletionSources
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) : Type where
  unusedRow : LargeCapUniqueFiveUnusedCriticalRow D S H profile
  first : ℝ²
  second : ℝ²
  first_ne_second : first ≠ second
  first_mem_physicalInterior :
    first ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
      S.capInteriorByIndex S.oppIndex2
  second_mem_physicalInterior :
    second ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
      S.capInteriorByIndex S.oppIndex2
  first_not_mem_actualCriticalSupport :
    first ∉ (H.selectedAt unusedRow.unused.point
      unusedRow.source_mem_A).toCriticalFourShell.support
  second_not_mem_actualCriticalSupport :
    second ∉ (H.selectedAt unusedRow.unused.point
      unusedRow.source_mem_A).toCriticalFourShell.support
  first_survives_actualBlocker :
    HasNEquidistantPointsAt 4 (D.A.erase first)
      (H.centerAt unusedRow.unused.point unusedRow.source_mem_A)
  second_survives_actualBlocker :
    HasNEquidistantPointsAt 4 (D.A.erase second)
      (H.centerAt unusedRow.unused.point unusedRow.source_mem_A)
  first_survives_physicalApex :
    HasNEquidistantPointsAt 4 (D.A.erase first) S.oppApex2
  second_survives_physicalApex :
    HasNEquidistantPointsAt 4 (D.A.erase second) S.oppApex2
  firstPacket : CommonDeletionTwoCenterPacket D H first
    (H.centerAt unusedRow.unused.point unusedRow.source_mem_A) S.oppApex2
  secondPacket : CommonDeletionTwoCenterPacket D H second
    (H.centerAt unusedRow.unused.point unusedRow.source_mem_A) S.oppApex2

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

/-- Every source-valid exact-five unused critical row produces two distinct,
origin-tagged common deletions at the same blocker/physical-apex pair. -/
theorem nonempty_twoCommonDeletionSources_of_unusedCriticalRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (R : LargeCapUniqueFiveUnusedCriticalRow D S H profile) :
    Nonempty (LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) := by
  classical
  let T := SelectedClass D.A S.oppApex2 profile.radius ∩
    S.capInteriorByIndex S.oppIndex2
  let K := (H.selectedAt R.unused.point
    R.source_mem_A).toCriticalFourShell.support
  have hTthree : 3 ≤ T.card := by
    simpa [T] using R.unused.radiusClass_capInterior_card_ge_three
  have hinterOne : (T ∩ K).card ≤ 1 := by
    simpa [T, K] using actualUnusedRow_physicalInterior_inter_card_le_one R
  have hsplit := Finset.card_sdiff_add_card_inter T K
  have houtsideTwo : 2 ≤ (T \ K).card := by omega
  rcases Finset.one_lt_card.mp (show 1 < (T \ K).card by omega) with
    ⟨first, hfirst, second, hsecond, hne⟩
  have hfirstT : first ∈ T := (Finset.mem_sdiff.mp hfirst).1
  have hsecondT : second ∈ T := (Finset.mem_sdiff.mp hsecond).1
  have hfirstNotK : first ∉ K := (Finset.mem_sdiff.mp hfirst).2
  have hsecondNotK : second ∉ K := (Finset.mem_sdiff.mp hsecond).2
  have hfirstPhysical :
      first ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2 := by
    simpa [T] using hfirstT
  have hsecondPhysical :
      second ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2 := by
    simpa [T] using hsecondT
  have hfirstNotRow :
      first ∉ (H.selectedAt R.unused.point
        R.source_mem_A).toCriticalFourShell.support := by
    simpa [K] using hfirstNotK
  have hsecondNotRow :
      second ∉ (H.selectedAt R.unused.point
        R.source_mem_A).toCriticalFourShell.support := by
    simpa [K] using hsecondNotK
  have hfirstA : first ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hfirstPhysical).1).1
  have hsecondA : second ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hsecondPhysical).1).1
  have hfirstBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase first)
        (H.centerAt R.unused.point R.source_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H R.source_mem_A).mpr hfirstNotRow
  have hsecondBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase second)
        (H.centerAt R.unused.point R.source_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H R.source_mem_A).mpr hsecondNotRow
  have hfirstApex := physicalApex_survives_erase
    (D := D) (S := S) (profile := profile) first
  have hsecondApex := physicalApex_survives_erase
    (D := D) (S := S) (profile := profile) second
  rcases nonempty_commonDeletionTwoCenterPacket H
      hfirstA R.blocker_mem_A (oppApex2_mem_A S)
      R.blocker_ne_physicalApex hfirstBlocker hfirstApex with
    ⟨firstPacket⟩
  rcases nonempty_commonDeletionTwoCenterPacket H
      hsecondA R.blocker_mem_A (oppApex2_mem_A S)
      R.blocker_ne_physicalApex hsecondBlocker hsecondApex with
    ⟨secondPacket⟩
  exact ⟨{
    unusedRow := R
    first := first
    second := second
    first_ne_second := hne
    first_mem_physicalInterior := hfirstPhysical
    second_mem_physicalInterior := hsecondPhysical
    first_not_mem_actualCriticalSupport := hfirstNotRow
    second_not_mem_actualCriticalSupport := hsecondNotRow
    first_survives_actualBlocker := hfirstBlocker
    second_survives_actualBlocker := hsecondBlocker
    first_survives_physicalApex := hfirstApex
    second_survives_physicalApex := hsecondApex
    firstPacket := firstPacket
    secondPacket := secondPacket
  }⟩

/-- The live six-point large-cap premise reaches the origin-tagged two-source
common-deletion surface without any extra producer hypothesis. -/
theorem nonempty_twoCommonDeletionSources_of_largeCapUniqueFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (hcap : 6 ≤ S.oppCap2.card)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) := by
  rcases nonempty_largeCapUniqueFiveUnusedCriticalRow H hcap profile with
    ⟨R⟩
  exact nonempty_twoCommonDeletionSources_of_unusedCriticalRow R

end ATailLargeCapUniqueFiveLowHit
end Problem97
