/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RobustLargeRadiusGeometry
import CapFiveApexRigidity

/-!
# Scratch: exact-five large-radius full-filter normal form

This file consumes the `LargeCapUniqueFiveSecondApexRadius` residual left by
the robust large-radius transition.  It deliberately does not reconstruct a
common-deletion packet or deletion-robust center: those return to an already
classified parent state.

The checked progress is geometric and full-filter based.  An exact five-point
radius class at the physical second apex has at least three points in the
strict interior of the opposite cap.  Since the closed opposite cap has at
least six points, it also has an unused point outside the entire exact radius
filter.  Erasing that unused point preserves the exact class, its cardinality,
and uniqueness among K4 radii, while the erased closed cap still has at least
five points.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustLargeRadiusExactFiveConsumerScratch

open ATailRobustLargeRadiusGeometryScratch
open ATailFullGeometryProducerScratch
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

private theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- An exact five-point class at the physical second apex has at least three
members in the strict interior of the opposite cap.  This is the sharp count
obtained from the MEC cap cover and the one-hit bounds on the two adjacent
caps. -/
theorem three_le_capInterior_hits_of_largeCapUniqueFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    3 ≤
      (SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2).card := by
  classical
  have hcenter :
      S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 :=
    oppApex2_eq_oppositeVertex_oppIndex2 S
  let T := SelectedClass D.A
    (S.oppositeVertexByIndex S.oppIndex2) profile.radius
  let I := S.capInteriorByIndex S.oppIndex2
  have hleftOne :
      (T ∩ S.leftAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        D.convex S.oppIndex2 profile.radius
  have hrightOne :
      (T ∩ S.rightAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        D.convex S.oppIndex2 profile.radius
  have hcover :
      T \ I ⊆
        (T ∩ S.leftAdjacentCapByIndex S.oppIndex2) ∪
          (T ∩ S.rightAdjacentCapByIndex S.oppIndex2) := by
    simpa [T, I] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
        S.oppIndex2 profile.radius_pos
  have houtside : (T \ I).card ≤ 2 := by
    calc
      (T \ I).card ≤
          ((T ∩ S.leftAdjacentCapByIndex S.oppIndex2) ∪
            (T ∩ S.rightAdjacentCapByIndex S.oppIndex2)).card :=
        Finset.card_le_card hcover
      _ ≤ (T ∩ S.leftAdjacentCapByIndex S.oppIndex2).card +
          (T ∩ S.rightAdjacentCapByIndex S.oppIndex2).card :=
        Finset.card_union_le _ _
      _ ≤ 2 := by omega
  have hT : T.card = 5 := by
    simpa [T, ← hcenter] using profile.class_card_eq_five
  have hsplit := Finset.card_sdiff_add_card_inter T I
  have hinter : 3 ≤ (T ∩ I).card := by omega
  simpa [T, I, ← hcenter] using hinter

/-- The unused-sixth-point and full-filter persistence packet. -/
structure LargeCapUniqueFiveUnusedPoint
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) : Type where
  point : ℝ²
  point_mem_oppCap2 : point ∈ S.oppCap2
  point_not_mem_radiusClass :
    point ∉ SelectedClass D.A S.oppApex2 profile.radius
  erased_oppCap2_card_ge_five : 5 ≤ (S.oppCap2.erase point).card
  radiusClass_erase_eq :
    SelectedClass (D.A.erase point) S.oppApex2 profile.radius =
      SelectedClass D.A S.oppApex2 profile.radius
  erased_radiusClass_card_eq_five :
    (SelectedClass (D.A.erase point)
      S.oppApex2 profile.radius).card = 5
  erased_unique_K4_radius :
    ∀ otherRadius : ℝ, 0 < otherRadius →
      4 ≤
        (SelectedClass (D.A.erase point)
          S.oppApex2 otherRadius).card →
      otherRadius = profile.radius
  radiusClass_capInterior_card_ge_three :
    3 ≤
      (SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2).card

/-- A six-point closed opposite cap cannot be exhausted by an exact
five-point ambient radius filter.  The point produced here is outside the
full filter, not merely outside a selected four-subset. -/
theorem nonempty_largeCapUniqueFiveUnusedPoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (hcap : 6 ≤ S.oppCap2.card)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (LargeCapUniqueFiveUnusedPoint D S profile) := by
  classical
  have hexists :
      ∃ point, point ∈ S.oppCap2 ∧
        point ∉ SelectedClass D.A S.oppApex2 profile.radius := by
    by_contra hnone
    push_neg at hnone
    have hsub :
        S.oppCap2 ⊆ SelectedClass D.A S.oppApex2 profile.radius := by
      intro point hpoint
      exact hnone point hpoint
    have hcard := Finset.card_le_card hsub
    have hfive := profile.class_card_eq_five
    omega
  rcases hexists with ⟨point, hpointCap, hpointRadius⟩
  have hcapErase : 5 ≤ (S.oppCap2.erase point).card := by
    rw [Finset.card_erase_of_mem hpointCap]
    omega
  have hclassErase :
      SelectedClass (D.A.erase point) S.oppApex2 profile.radius =
        SelectedClass D.A S.oppApex2 profile.radius := by
    rw [selectedClass_erase_eq, Finset.erase_eq_self.mpr hpointRadius]
  have hclassEraseCard :
      (SelectedClass (D.A.erase point)
        S.oppApex2 profile.radius).card = 5 := by
    rw [hclassErase, profile.class_card_eq_five]
  have huniqueErase :
      ∀ otherRadius : ℝ, 0 < otherRadius →
        4 ≤
          (SelectedClass (D.A.erase point)
            S.oppApex2 otherRadius).card →
        otherRadius = profile.radius := by
    intro otherRadius hotherPos hotherFour
    have hsub :
        SelectedClass (D.A.erase point) S.oppApex2 otherRadius ⊆
          SelectedClass D.A S.oppApex2 otherRadius := by
      intro x hx
      have hx' := (mem_selectedClass.mp hx)
      exact mem_selectedClass.mpr
        ⟨Finset.mem_of_mem_erase hx'.1, hx'.2⟩
    exact profile.unique_K4_radius otherRadius hotherPos
      (hotherFour.trans (Finset.card_le_card hsub))
  exact ⟨{
    point := point
    point_mem_oppCap2 := hpointCap
    point_not_mem_radiusClass := hpointRadius
    erased_oppCap2_card_ge_five := hcapErase
    radiusClass_erase_eq := hclassErase
    erased_radiusClass_card_eq_five := hclassEraseCard
    erased_unique_K4_radius := huniqueErase
    radiusClass_capInterior_card_ge_three :=
      three_le_capInterior_hits_of_largeCapUniqueFive profile
  }⟩

/-- Global, source-indexed refinement of the unused-sixth-point packet.  The
retained critical map supplies an exact critical row for the unused cap point.
The unchanged physical radius class proves that the row's actual blocker is a
genuinely different center from the physical second apex. -/
structure LargeCapUniqueFiveUnusedCriticalRow
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) : Type where
  unused : LargeCapUniqueFiveUnusedPoint D S profile
  source_mem_A : unused.point ∈ D.A
  physicalApex_survives_source_deletion :
    HasNEquidistantPointsAt 4 (D.A.erase unused.point) S.oppApex2
  blocker_ne_physicalApex :
    H.centerAt unused.point source_mem_A ≠ S.oppApex2
  blocker_mem_A : H.centerAt unused.point source_mem_A ∈ D.A
  criticalRow : CriticalSelectedFourClass D.A unused.point
    (H.centerAt unused.point source_mem_A)
  source_mem_criticalSupport :
    unused.point ∈ criticalRow.toCriticalFourShell.support
  source_deletion_blocked_at_blocker :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase unused.point)
      (H.centerAt unused.point source_mem_A)

/-- The unused sixth cap point therefore installs a fresh critical row whose
blocker differs from the physical apex.  This is the strongest direct global
progress available without returning to the already-classified robust/common-
deletion constructors. -/
theorem nonempty_largeCapUniqueFiveUnusedCriticalRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (hcap : 6 ≤ S.oppCap2.card)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (LargeCapUniqueFiveUnusedCriticalRow D S H profile) := by
  classical
  rcases nonempty_largeCapUniqueFiveUnusedPoint hcap profile with ⟨unused⟩
  have hcapEq : S.capByIndex S.oppIndex2 = S.oppCap2 :=
    capByIndex_oppIndex2_eq_oppCap2 S
  have hsourceA : unused.point ∈ D.A := by
    apply S.capByIndex_subset S.oppIndex2
    simpa only [hcapEq] using unused.point_mem_oppCap2
  have hphysical :
      HasNEquidistantPointsAt 4 (D.A.erase unused.point) S.oppApex2 := by
    refine ⟨profile.radius, profile.radius_pos, ?_⟩
    change 4 ≤
      (SelectedClass (D.A.erase unused.point)
        S.oppApex2 profile.radius).card
    rw [unused.radiusClass_erase_eq,
      profile.class_card_eq_five]
    omega
  have hblockerNe :
      H.centerAt unused.point hsourceA ≠ S.oppApex2 := by
    intro hcenter
    apply H.no_qfree_at unused.point hsourceA
    simpa only [hcenter] using hphysical
  have hblockerA : H.centerAt unused.point hsourceA ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt unused.point hsourceA).toCriticalFourShell.center_mem).2
  exact ⟨{
    unused := unused
    source_mem_A := hsourceA
    physicalApex_survives_source_deletion := hphysical
    blocker_ne_physicalApex := hblockerNe
    blocker_mem_A := hblockerA
    criticalRow := H.selectedAt unused.point hsourceA
    source_mem_criticalSupport :=
      (H.selectedAt unused.point hsourceA).toCriticalFourShell.q_mem_support
    source_deletion_blocked_at_blocker :=
      H.no_qfree_at unused.point hsourceA
  }⟩

#print axioms three_le_capInterior_hits_of_largeCapUniqueFive
#print axioms nonempty_largeCapUniqueFiveUnusedPoint
#print axioms nonempty_largeCapUniqueFiveUnusedCriticalRow

end ATailRobustLargeRadiusExactFiveConsumerScratch
end Problem97
