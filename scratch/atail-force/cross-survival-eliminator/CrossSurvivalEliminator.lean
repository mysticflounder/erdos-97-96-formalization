/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FrontierContinuationDispatcher
import ContinuationCapOrderClassifier

/-!
# Scratch: one-row continuation-survival consequences

This file studies only the `CrossSurvivalOutput` arm of the frontier
continuation dispatcher.  A surviving deletion is converted into an exact
selected four-row on the original carrier.  The retained critical-shell
system and ordered-cap geometry then give two independent sharp bounds:

* the survivor meets the deleted source's chosen critical shell in at most
  two points; and
* its support outside `oppCap2` has at least two points, but every fixed
  first-apex radius occurs there at most once.

The second statement is a negative compatibility result.  A single survivor
cannot itself manufacture the repeated first-apex outside pair needed by the
existing ordered-cap contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCrossSurvivalEliminatorScratch

open ATailCriticalPairFrontier
open ATAILStageOnePrescribedApexDichotomy
open ATailContinuationGeometryClassifier
open ATailContinuationCapOrderClassifierScratch
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch

attribute [local instance] Classical.propDecidable

namespace QDeletedFourRow

/-- Forget the deleted-point annotation and view an exact q-deleted row as a
selected four-class on the original carrier. -/
def toSelectedFourClass
    {D : CounterexampleData} {deleted center : ℝ²}
    (R : QDeletedFourRow D deleted center) :
    SelectedFourClass D.A center where
  support := R.support
  support_subset_A := by
    intro x hx
    have hxEraseCenter := R.row.subset hx
    have hxSkeleton := (Finset.mem_erase.mp hxEraseCenter).2
    have hxEraseDeleted : x ∈ D.A.erase deleted := by
      simpa [CounterexampleData.skeleton] using hxSkeleton
    exact (Finset.mem_erase.mp hxEraseDeleted).2
  support_card := R.support_card
  radius := R.row.radius
  radius_pos := R.row.radius_pos
  support_eq_radius := R.row.same_radius
  center_not_mem := by
    intro hcenter
    exact (Finset.mem_erase.mp (R.row.subset hcenter)).1 rfl

end QDeletedFourRow

/-- One orientation of a continuation cross-survival, retaining the exact
q-deleted row and the carrier/cap facts needed by downstream consumers. -/
structure SurvivingContinuationRow
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) where
  center : ℝ²
  deleted : ℝ²
  center_mem_A : center ∈ D.A
  deleted_mem_A : deleted ∈ D.A
  center_ne_deleted : center ≠ deleted
  center_strict :
    center ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1)
  survives : HasNEquidistantPointsAt 4 (D.A.erase deleted) center
  exactRow : QDeletedFourRow (rebasePacket D S) deleted center

namespace SurvivingContinuationRow

variable {D : CounterexampleData} {S : SurplusCapPacket D.A}
variable {H : CriticalShellSystem D.A}

/-- The exact survivor as a selected four-class over `D.A`. -/
def row (C : SurvivingContinuationRow D S H) :
    SelectedFourClass D.A C.center :=
  ATailCrossSurvivalEliminatorScratch.QDeletedFourRow.toSelectedFourClass
    (D := rebasePacket D S) C.exactRow

private theorem capByIndex_oppIndex2_eq_oppCap2
    (S : SurplusCapPacket D.A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem oppApex1_mem_oppCap2
    (S : SurplusCapPacket D.A) : S.oppApex1 ∈ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppCap2, hi] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppCap2, hi] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppCap2, hi] using S.partition.v1_mem_C2

private theorem oppApex1_mem_surplusCap
    (S : SurplusCapPacket D.A) : S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.surplusCap, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.surplusCap, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.surplusCap, hi] using S.partition.v1_mem_C3

theorem center_mem_oppCap2 (C : SurvivingContinuationRow D S H) :
    C.center ∈ S.oppCap2 :=
  (Finset.mem_sdiff.mp C.center_strict).1

theorem center_ne_oppApex1 (C : SurvivingContinuationRow D S H) :
    C.center ≠ S.oppApex1 := by
  intro hcenter
  have hnotSurplus : C.center ∉ S.surplusCap := by
    intro hmem
    exact (Finset.mem_sdiff.mp C.center_strict).2
      (Finset.mem_union.mpr (Or.inl hmem))
  exact hnotSurplus (hcenter ▸ oppApex1_mem_surplusCap S)

/-- The surviving center cannot be the deleted source's chosen blocker. -/
theorem blocker_ne_center (C : SurvivingContinuationRow D S H) :
    H.centerAt C.deleted C.deleted_mem_A ≠ C.center :=
  actual_blocker_ne_of_deletion_survives
    H C.deleted_mem_A C.survives

/-- The survivor circle and the deleted source's exact critical circle have
distinct centers, hence overlap in at most two support points. -/
theorem inter_criticalSupport_card_le_two
    (C : SurvivingContinuationRow D S H) :
    ((C.row.support ∩
      (H.selectedAt C.deleted C.deleted_mem_A).toCriticalFourShell.support).card
        ≤ 2) := by
  exact SelectedFourClass.inter_card_le_two
    C.row
    (H.selectedAt C.deleted C.deleted_mem_A).toSelectedFourClass
    C.blocker_ne_center.symm

/-- Four points minus the two-circle overlap leave at least two survivor
points outside the deleted source's chosen critical shell. -/
theorem two_le_support_sdiff_criticalSupport_card
    (C : SurvivingContinuationRow D S H) :
    2 ≤ (C.row.support \
      (H.selectedAt C.deleted C.deleted_mem_A).toCriticalFourShell.support).card := by
  have hsplit := Finset.card_sdiff_add_card_inter C.row.support
    (H.selectedAt C.deleted C.deleted_mem_A).toCriticalFourShell.support
  have hcard := C.row.support_card
  have hinter := C.inter_criticalSupport_card_le_two
  omega

/-- A selected four-row centered in `oppCap2` has at least two support points
outside that cap. -/
theorem two_le_support_outside_oppCap2_card
    (C : SurvivingContinuationRow D S H) :
    2 ≤ (C.row.support \ S.oppCap2).card := by
  have hcap : (C.row.support ∩ S.oppCap2).card ≤ 2 := by
    have hraw :=
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 C.row (by
          rw [capByIndex_oppIndex2_eq_oppCap2]
          exact C.center_mem_oppCap2)
    simpa [capByIndex_oppIndex2_eq_oppCap2] using hraw
  have hsplit := Finset.card_sdiff_add_card_inter
    C.row.support S.oppCap2
  have hcard := C.row.support_card
  omega

/-- Any two distinct survivor support points outside `oppCap2` have different
distances from the first opposite apex.  Equality at the survivor center is
automatic from the row; equality at the first apex would repeat one outside
pair at two distinct ordered-cap centers. -/
theorem outside_support_firstApex_distance_ne
    (C : SurvivingContinuationRow D S H)
    {a b : ℝ²}
    (ha : a ∈ C.row.support) (hb : b ∈ C.row.support)
    (haOutside : a ∉ S.oppCap2) (hbOutside : b ∉ S.oppCap2)
    (hab : a ≠ b) :
    dist S.oppApex1 a ≠ dist S.oppApex1 b := by
  apply second_center_separates_outside_pair
    S D.convex S.oppIndex2
    (c₁ := C.center) (c₂ := S.oppApex1) (a := a) (b := b)
  · simpa [capByIndex_oppIndex2_eq_oppCap2] using C.center_mem_oppCap2
  · simpa [capByIndex_oppIndex2_eq_oppCap2] using oppApex1_mem_oppCap2 S
  · exact C.center_ne_oppApex1
  · exact C.row.support_subset_A ha
  · exact C.row.support_subset_A hb
  · simpa [capByIndex_oppIndex2_eq_oppCap2] using haOutside
  · simpa [capByIndex_oppIndex2_eq_oppCap2] using hbOutside
  · exact hab
  · exact (C.row.support_eq_radius a ha).trans
      (C.row.support_eq_radius b hb).symm

/-- Consequently a fixed first-apex radius meets the survivor's outside-cap
support in at most one point. -/
theorem outside_support_inter_firstApexRadius_card_le_one
    (C : SurvivingContinuationRow D S H) (rho : ℝ) :
    (((C.row.support \ S.oppCap2).filter
      fun x => dist S.oppApex1 x = rho).card ≤ 1) := by
  rw [Finset.card_le_one]
  intro a ha b hb
  rcases Finset.mem_filter.mp ha with ⟨haOutsideSupport, haRadius⟩
  rcases Finset.mem_filter.mp hb with ⟨hbOutsideSupport, hbRadius⟩
  rcases Finset.mem_sdiff.mp haOutsideSupport with ⟨haRow, haOutside⟩
  rcases Finset.mem_sdiff.mp hbOutsideSupport with ⟨hbRow, hbOutside⟩
  by_contra hab
  exact C.outside_support_firstApex_distance_ne
    haRow hbRow haOutside hbOutside hab (haRadius.trans hbRadius.symm)

/-- Exact one-field conditional consumer: producing two outside support
points on any one first-apex radius closes the survivor immediately. -/
theorem false_of_two_firstApexRadius_hits
    (C : SurvivingContinuationRow D S H) (rho : ℝ)
    (htwo : 2 ≤ (((C.row.support \ S.oppCap2).filter
      fun x => dist S.oppApex1 x = rho).card)) : False := by
  have hone := C.outside_support_inter_firstApexRadius_card_le_one rho
  omega

end SurvivingContinuationRow

/-- Orient either disjunct of `CrossSurvivalOutput` and retain its exact
q-deleted row. -/
theorem nonempty_survivingContinuationRow_of_crossSurvival
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (K : FrontierSecondApexRow F)
    (P : TwoContinuationRows (rebasePacket D S) K.row)
    (hcross : CrossSurvivalOutput P) :
    Nonempty (SurvivingContinuationRow D S H) := by
  rcases hcross with ⟨hsurvives, ⟨R⟩⟩ | ⟨hsurvives, ⟨R⟩⟩
  · exact ⟨{
      center := P.z₁
      deleted := P.z₂
      center_mem_A := P.z₁_mem_A
      deleted_mem_A := P.z₂_mem_A
      center_ne_deleted := P.z₁_ne_z₂
      center_strict := (Finset.mem_inter.mp P.z₁_mem).2
      survives := hsurvives
      exactRow := R }⟩
  · exact ⟨{
      center := P.z₂
      deleted := P.z₁
      center_mem_A := P.z₂_mem_A
      deleted_mem_A := P.z₁_mem_A
      center_ne_deleted := P.z₁_ne_z₂.symm
      center_strict := (Finset.mem_inter.mp P.z₂_mem).2
      survives := hsurvives
      exactRow := R }⟩

/-- Strongest checked one-row normal form currently available from the cross
survival arm.  In particular, the outside-cap pair exists but cannot repeat a
first-apex radius. -/
theorem crossSurvival_oneRow_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (K : FrontierSecondApexRow F)
    (P : TwoContinuationRows (rebasePacket D S) K.row)
    (hcross : CrossSurvivalOutput P) :
    ∃ C : SurvivingContinuationRow D S H,
      2 ≤ (C.row.support \ S.oppCap2).card ∧
      2 ≤ (C.row.support \
        (H.selectedAt C.deleted C.deleted_mem_A).toCriticalFourShell.support).card ∧
      ∀ rho : ℝ,
        (((C.row.support \ S.oppCap2).filter
          fun x => dist S.oppApex1 x = rho).card ≤ 1) := by
  rcases nonempty_survivingContinuationRow_of_crossSurvival
      F K P hcross with ⟨C⟩
  exact ⟨C, C.two_le_support_outside_oppCap2_card,
    C.two_le_support_sdiff_criticalSupport_card,
    C.outside_support_inter_firstApexRadius_card_le_one⟩

#print axioms QDeletedFourRow.toSelectedFourClass
#print axioms SurvivingContinuationRow.inter_criticalSupport_card_le_two
#print axioms SurvivingContinuationRow.two_le_support_outside_oppCap2_card
#print axioms SurvivingContinuationRow.outside_support_firstApex_distance_ne
#print axioms SurvivingContinuationRow.false_of_two_firstApexRadius_hits
#print axioms crossSurvival_oneRow_normalForm

end ATailCrossSurvivalEliminatorScratch
end Problem97
