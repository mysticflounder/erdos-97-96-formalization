/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFiveCrossIncidence
import Erdos9796Proof.P97.ATail.CommonDeletionTwoCenter
import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Exact-five two-hit producer audit

The production two-hit packet is already contradictory.  This file proves
the unconditional complementary output of the same source-valid exact-five
surface: two distinct strict-cap members of the physical exact-five class
avoid the unused source's actual critical support.  Deleting either member
therefore preserves K4 at both the actual blocker and the physical apex.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveTwoHitProducerAttemptScratch

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

/-- The exact critical row stored by the exact-five packet is the same full
radius class as the row selected by the retained critical system. -/
theorem unusedCriticalRow_support_eq_selectedAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (row : LargeCapUniqueFiveUnusedCriticalRow D S H profile) :
    row.criticalRow.toCriticalFourShell.support =
      (H.selectedAt row.unused.point
        row.source_mem_A).toCriticalFourShell.support := by
  let K := row.criticalRow.toCriticalFourShell
  let KH := (H.selectedAt row.unused.point
    row.source_mem_A).toCriticalFourShell
  have hradius : K.radius = KH.radius := by
    calc
      K.radius = dist (H.centerAt row.unused.point row.source_mem_A)
          row.unused.point :=
        (K.support_eq_radius row.unused.point
          row.source_mem_criticalSupport).symm
      _ = KH.radius :=
        KH.support_eq_radius row.unused.point KH.q_mem_support
  calc
    K.support = D.A.filter
        (fun z ↦ dist (H.centerAt row.unused.point row.source_mem_A) z =
          K.radius) := K.support_eq
    _ = D.A.filter
        (fun z ↦ dist (H.centerAt row.unused.point row.source_mem_A) z =
          KH.radius) := by rw [hradius]
    _ = KH.support := KH.support_eq.symm

/-- The physical strict-cap class meets the unused source's actual critical
support in at most one point.  Two points would instantiate the production
two-hit terminal and hence be contradictory. -/
theorem physicalInterior_inter_unusedCriticalSupport_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (row : LargeCapUniqueFiveUnusedCriticalRow D S H profile) :
    ((SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2) ∩
      row.criticalRow.toCriticalFourShell.support).card ≤ 1 := by
  classical
  rw [Finset.card_le_one]
  intro x hx y hy
  by_contra hxy
  exact (false_of_largeCapUniqueFiveTwoHitCriticalRow
    { unused := row.unused
      center := H.centerAt row.unused.point row.source_mem_A
      row := row.criticalRow
      sourceDeletionBlocked := row.source_deletion_blocked_at_blocker
      x := x
      y := y
      x_ne_y := hxy
      x_mem_physicalInterior := (Finset.mem_inter.mp hx).1
      y_mem_physicalInterior := (Finset.mem_inter.mp hy).1
      x_mem_row := (Finset.mem_inter.mp hx).2
      y_mem_row := (Finset.mem_inter.mp hy).2 }).elim

/-- The proposed two-hit packet is not an intermediate source object: it is
already inconsistent by its production consumer. -/
theorem not_nonempty_largeCapUniqueFiveTwoHitCriticalRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S} :
    ¬ Nonempty (LargeCapUniqueFiveTwoHitCriticalRow D S profile) := by
  rintro ⟨P⟩
  exact false_of_largeCapUniqueFiveTwoHitCriticalRow P

/-- Two source points in the physical exact-five strict-cap class whose
deletions both preserve K4 at the physical apex and at the unused source's
actual blocker.  The two common-deletion packets retain the exact deleted
sources rather than projecting to an anonymous recursive state. -/
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

/-- Every source-valid exact-five unused critical row produces two distinct,
origin-tagged common deletions at the same blocker/physical-apex pair. -/
theorem nonempty_twoCommonDeletionSources_of_unusedCriticalRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (row : LargeCapUniqueFiveUnusedCriticalRow D S H profile) :
    Nonempty (LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) := by
  classical
  let T := SelectedClass D.A S.oppApex2 profile.radius ∩
    S.capInteriorByIndex S.oppIndex2
  let K := row.criticalRow.toCriticalFourShell.support
  have hTcard : 3 ≤ T.card := by
    simpa [T] using row.unused.radiusClass_capInterior_card_ge_three
  have hinter : (T ∩ K).card ≤ 1 := by
    simpa [T, K] using
      physicalInterior_inter_unusedCriticalSupport_card_le_one row
  have houtside : 2 ≤ (T \ K).card := by
    have hsplit := Finset.card_sdiff_add_card_inter T K
    omega
  rcases Finset.one_lt_card.mp (show 1 < (T \ K).card by omega) with
    ⟨first, hfirst, second, hsecond, hne⟩
  have hfirstT : first ∈ T := (Finset.mem_sdiff.mp hfirst).1
  have hsecondT : second ∈ T := (Finset.mem_sdiff.mp hsecond).1
  have hfirstNotK : first ∉ K := (Finset.mem_sdiff.mp hfirst).2
  have hsecondNotK : second ∉ K := (Finset.mem_sdiff.mp hsecond).2
  have hsupportEq := unusedCriticalRow_support_eq_selectedAt row
  have hfirstNotActual :
      first ∉ (H.selectedAt row.unused.point
        row.source_mem_A).toCriticalFourShell.support := by
    simpa [K, hsupportEq] using hfirstNotK
  have hsecondNotActual :
      second ∉ (H.selectedAt row.unused.point
        row.source_mem_A).toCriticalFourShell.support := by
    simpa [K, hsupportEq] using hsecondNotK
  have hfirstBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase first)
        (H.centerAt row.unused.point row.source_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support H
      row.source_mem_A).mpr hfirstNotActual
  have hsecondBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase second)
        (H.centerAt row.unused.point row.source_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support H
      row.source_mem_A).mpr hsecondNotActual
  have hfirstPhysical :
      HasNEquidistantPointsAt 4 (D.A.erase first) S.oppApex2 := by
    refine ⟨profile.radius, profile.radius_pos, ?_⟩
    exact selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := first) (s := S.oppApex2)
      (d := profile.radius) (n := 4) profile.class_card_eq_five.ge
  have hsecondPhysical :
      HasNEquidistantPointsAt 4 (D.A.erase second) S.oppApex2 := by
    refine ⟨profile.radius, profile.radius_pos, ?_⟩
    exact selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := second) (s := S.oppApex2)
      (d := profile.radius) (n := 4) profile.class_card_eq_five.ge
  have hfirstA : first ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hfirstT).1).1
  have hsecondA : second ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hsecondT).1).1
  rcases nonempty_commonDeletionTwoCenterPacket H
      hfirstA row.blocker_mem_A (oppApex2_mem_A S)
      row.blocker_ne_physicalApex hfirstBlocker hfirstPhysical with
    ⟨firstPacket⟩
  rcases nonempty_commonDeletionTwoCenterPacket H
      hsecondA row.blocker_mem_A (oppApex2_mem_A S)
      row.blocker_ne_physicalApex hsecondBlocker hsecondPhysical with
    ⟨secondPacket⟩
  exact ⟨{
    unusedRow := row
    first := first
    second := second
    first_ne_second := hne
    first_mem_physicalInterior := by simpa [T] using hfirstT
    second_mem_physicalInterior := by simpa [T] using hsecondT
    first_not_mem_actualCriticalSupport := hfirstNotActual
    second_not_mem_actualCriticalSupport := hsecondNotActual
    first_survives_actualBlocker := hfirstBlocker
    second_survives_actualBlocker := hsecondBlocker
    first_survives_physicalApex := hfirstPhysical
    second_survives_physicalApex := hsecondPhysical
    firstPacket := firstPacket
    secondPacket := secondPacket
  }⟩

/-- The live six-point large-cap premise therefore reaches the same
origin-tagged two-source common-deletion surface without any extra producer
hypothesis. -/
theorem nonempty_twoCommonDeletionSources_of_largeCapUniqueFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (hcap : 6 ≤ S.oppCap2.card)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) := by
  rcases nonempty_largeCapUniqueFiveUnusedCriticalRow H hcap profile with
    ⟨row⟩
  exact nonempty_twoCommonDeletionSources_of_unusedCriticalRow row

#print axioms unusedCriticalRow_support_eq_selectedAt
#print axioms physicalInterior_inter_unusedCriticalSupport_card_le_one
#print axioms not_nonempty_largeCapUniqueFiveTwoHitCriticalRow
#print axioms nonempty_twoCommonDeletionSources_of_unusedCriticalRow
#print axioms nonempty_twoCommonDeletionSources_of_largeCapUniqueFive

end ATailExactFiveTwoHitProducerAttemptScratch
end Problem97
