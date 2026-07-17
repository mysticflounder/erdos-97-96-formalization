/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFiveLowHit

/-!
# Exact-five paired common-deletion row normal form

This production module proves that the existential rows stored by
`LargeCapUniqueFiveTwoCommonDeletionSources` are nevertheless canonical.
Criticality makes both actual-blocker rows equal the unused source's retained
critical support.  Uniqueness of the exact-five physical radius makes both
physical-apex rows equal the corresponding erasure of that complete class.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLargeCapUniqueFiveCommonDeletionNormalForm

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit

attribute [local instance] Classical.propDecidable

/-- A concrete q-deleted row is contained in its complete deleted-carrier
radius class. -/
theorem qDeleted_support_subset_selectedClass
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D q center B) :
    B ⊆ SelectedClass (D.A.erase q) center K.radius := by
  intro z hzB
  have hzSkeleton : z ∈ D.skeleton q :=
    (Finset.mem_erase.mp (K.subset hzB)).2
  have hzCarrier : z ∈ D.A.erase q := by
    simpa [CounterexampleData.skeleton] using hzSkeleton
  exact mem_selectedClass.mpr ⟨hzCarrier, K.same_radius z hzB⟩

/-- The first stored actual-blocker row has the retained critical radius. -/
theorem firstPacket_blocker_radius_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    P.firstPacket.row₁.radius =
      (H.selectedAt P.unusedRow.unused.point
        P.unusedRow.source_mem_A).toCriticalFourShell.radius := by
  have hnormal := cross_survival_unique_radius_and_exact_support
    H P.unusedRow.source_mem_A P.first_survives_actualBlocker
  apply hnormal.2 P.firstPacket.row₁.radius
    P.firstPacket.row₁.radius_pos
  exact P.firstPacket.row₁.card_four.trans <|
    Finset.card_le_card (qDeleted_support_subset_selectedClass P.firstPacket.row₁)

/-- The second stored actual-blocker row has the retained critical radius. -/
theorem secondPacket_blocker_radius_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    P.secondPacket.row₁.radius =
      (H.selectedAt P.unusedRow.unused.point
        P.unusedRow.source_mem_A).toCriticalFourShell.radius := by
  have hnormal := cross_survival_unique_radius_and_exact_support
    H P.unusedRow.source_mem_A P.second_survives_actualBlocker
  apply hnormal.2 P.secondPacket.row₁.radius
    P.secondPacket.row₁.radius_pos
  exact P.secondPacket.row₁.card_four.trans <|
    Finset.card_le_card (qDeleted_support_subset_selectedClass P.secondPacket.row₁)

/-- The first stored actual-blocker support is exactly the unused source's
retained critical support. -/
theorem firstPacket_B₁_eq_actualCriticalSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    P.firstPacket.B₁ =
      (H.selectedAt P.unusedRow.unused.point
        P.unusedRow.source_mem_A).toCriticalFourShell.support := by
  have hnormal := cross_survival_unique_radius_and_exact_support
    H P.unusedRow.source_mem_A P.first_survives_actualBlocker
  have hsub := qDeleted_support_subset_selectedClass P.firstPacket.row₁
  rw [firstPacket_blocker_radius_eq P, hnormal.1] at hsub
  apply Finset.eq_of_subset_of_card_le hsub
  rw [(H.selectedAt P.unusedRow.unused.point
    P.unusedRow.source_mem_A).toCriticalFourShell.support_card,
    P.firstPacket.B₁_card]

/-- The second stored actual-blocker support is exactly the same retained
critical support. -/
theorem secondPacket_B₁_eq_actualCriticalSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    P.secondPacket.B₁ =
      (H.selectedAt P.unusedRow.unused.point
        P.unusedRow.source_mem_A).toCriticalFourShell.support := by
  have hnormal := cross_survival_unique_radius_and_exact_support
    H P.unusedRow.source_mem_A P.second_survives_actualBlocker
  have hsub := qDeleted_support_subset_selectedClass P.secondPacket.row₁
  rw [secondPacket_blocker_radius_eq P, hnormal.1] at hsub
  apply Finset.eq_of_subset_of_card_le hsub
  rw [(H.selectedAt P.unusedRow.unused.point
    P.unusedRow.source_mem_A).toCriticalFourShell.support_card,
    P.secondPacket.B₁_card]

/-- A q-deleted row is also contained in the corresponding complete ambient
radius class. -/
theorem qDeleted_support_subset_ambientSelectedClass
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D q center B) :
    B ⊆ SelectedClass D.A center K.radius := by
  intro z hzB
  have hz := mem_selectedClass.mp
    (qDeleted_support_subset_selectedClass K hzB)
  exact mem_selectedClass.mpr ⟨Finset.mem_of_mem_erase hz.1, hz.2⟩

/-- The first stored physical-apex row uses the profile's unique radius. -/
theorem firstPacket_physical_radius_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    P.firstPacket.row₂.radius = profile.radius := by
  apply profile.unique_K4_radius P.firstPacket.row₂.radius
    P.firstPacket.row₂.radius_pos
  exact P.firstPacket.row₂.card_four.trans <|
    Finset.card_le_card
      (qDeleted_support_subset_ambientSelectedClass P.firstPacket.row₂)

/-- The second stored physical-apex row uses the same unique radius. -/
theorem secondPacket_physical_radius_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    P.secondPacket.row₂.radius = profile.radius := by
  apply profile.unique_K4_radius P.secondPacket.row₂.radius
    P.secondPacket.row₂.radius_pos
  exact P.secondPacket.row₂.card_four.trans <|
    Finset.card_le_card
      (qDeleted_support_subset_ambientSelectedClass P.secondPacket.row₂)

/-- The first stored physical-apex support is the complete exact-five class
with the first deleted source erased. -/
theorem firstPacket_B₂_eq_physicalClass_erase_first
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    P.firstPacket.B₂ =
      (SelectedClass D.A S.oppApex2 profile.radius).erase P.first := by
  have hsub := qDeleted_support_subset_selectedClass P.firstPacket.row₂
  rw [firstPacket_physical_radius_eq P, selectedClass_erase_eq] at hsub
  apply Finset.eq_of_subset_of_card_le hsub
  have hfirstClass :
      P.first ∈ SelectedClass D.A S.oppApex2 profile.radius :=
    (Finset.mem_inter.mp P.first_mem_physicalInterior).1
  rw [Finset.card_erase_of_mem hfirstClass, profile.class_card_eq_five,
    P.firstPacket.B₂_card]

/-- The second stored physical-apex support is the other erasure of the same
complete exact-five class. -/
theorem secondPacket_B₂_eq_physicalClass_erase_second
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    P.secondPacket.B₂ =
      (SelectedClass D.A S.oppApex2 profile.radius).erase P.second := by
  have hsub := qDeleted_support_subset_selectedClass P.secondPacket.row₂
  rw [secondPacket_physical_radius_eq P, selectedClass_erase_eq] at hsub
  apply Finset.eq_of_subset_of_card_le hsub
  have hsecondClass :
      P.second ∈ SelectedClass D.A S.oppApex2 profile.radius :=
    (Finset.mem_inter.mp P.second_mem_physicalInterior).1
  rw [Finset.card_erase_of_mem hsecondClass, profile.class_card_eq_five,
    P.secondPacket.B₂_card]

/-- The second source lies in the first source's exact physical-apex row. -/
theorem second_mem_firstPacket_B₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    P.second ∈ P.firstPacket.B₂ := by
  rw [firstPacket_B₂_eq_physicalClass_erase_first P]
  exact Finset.mem_erase.mpr ⟨P.first_ne_second.symm,
    (Finset.mem_inter.mp P.second_mem_physicalInterior).1⟩

/-- The first source lies in the second source's exact physical-apex row. -/
theorem first_mem_secondPacket_B₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    P.first ∈ P.secondPacket.B₂ := by
  rw [secondPacket_B₂_eq_physicalClass_erase_second P]
  exact Finset.mem_erase.mpr ⟨P.first_ne_second,
    (Finset.mem_inter.mp P.first_mem_physicalInterior).1⟩

/-- The two stored physical-apex supports intersect in exactly the complete
exact-five class with both chosen sources erased. -/
theorem physical_support_inter_eq_double_erase
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    P.firstPacket.B₂ ∩ P.secondPacket.B₂ =
      ((SelectedClass D.A S.oppApex2 profile.radius).erase P.first).erase P.second := by
  rw [firstPacket_B₂_eq_physicalClass_erase_first P,
    secondPacket_B₂_eq_physicalClass_erase_second P]
  ext z
  simp only [Finset.mem_inter, Finset.mem_erase]
  aesop

/-- The two physical-apex rows share exactly three points. -/
theorem physical_support_inter_card_eq_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    (P.firstPacket.B₂ ∩ P.secondPacket.B₂).card = 3 := by
  rw [physical_support_inter_eq_double_erase P]
  have hfirstClass :
      P.first ∈ SelectedClass D.A S.oppApex2 profile.radius :=
    (Finset.mem_inter.mp P.first_mem_physicalInterior).1
  have hsecondErase :
      P.second ∈
        (SelectedClass D.A S.oppApex2 profile.radius).erase P.first :=
    Finset.mem_erase.mpr ⟨P.first_ne_second.symm,
      (Finset.mem_inter.mp P.second_mem_physicalInterior).1⟩
  rw [Finset.card_erase_of_mem hsecondErase,
    Finset.card_erase_of_mem hfirstClass, profile.class_card_eq_five]

/-- Both actual-blocker rows are definitionally independent choices but
extensionally the same four-point support. -/
theorem firstPacket_B₁_eq_secondPacket_B₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    P.firstPacket.B₁ = P.secondPacket.B₁ := by
  rw [firstPacket_B₁_eq_actualCriticalSupport P,
    secondPacket_B₁_eq_actualCriticalSupport P]

/-- Beyond the two strict-cap sources, the shared three-point physical-row
core contains a third source outside the common actual-blocker support.  Its
deletion therefore preserves K4 at both centers.  The theorem does not assert
that this third source lies in the strict cap interior. -/
theorem exists_third_commonDeletionSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    ∃ third : ℝ²,
      third ∈ SelectedClass D.A S.oppApex2 profile.radius ∧
      third ≠ P.first ∧
      third ≠ P.second ∧
      third ∉ (H.selectedAt P.unusedRow.unused.point
        P.unusedRow.source_mem_A).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4 (D.A.erase third)
        (H.centerAt P.unusedRow.unused.point P.unusedRow.source_mem_A) ∧
      HasNEquidistantPointsAt 4 (D.A.erase third) S.oppApex2 := by
  have hexists :
      ∃ third : ℝ²,
        third ∈ P.firstPacket.B₂ ∩ P.secondPacket.B₂ ∧
        third ∉ P.firstPacket.B₁ := by
    by_contra hnone
    push_neg at hnone
    have hsub :
        P.firstPacket.B₂ ∩ P.secondPacket.B₂ ⊆
          P.firstPacket.B₁ ∩ P.firstPacket.B₂ := by
      intro z hz
      exact Finset.mem_inter.mpr
        ⟨hnone z hz, (Finset.mem_inter.mp hz).1⟩
    have hcard := Finset.card_le_card hsub
    rw [physical_support_inter_card_eq_three P] at hcard
    have hover := P.firstPacket.overlap_le_two
    omega
  rcases hexists with ⟨third, hthirdPhysicalRows, hthirdNotActualRow⟩
  have hthirdFirst := Finset.mem_inter.mp hthirdPhysicalRows |>.1
  have hthirdSecond := Finset.mem_inter.mp hthirdPhysicalRows |>.2
  rw [firstPacket_B₂_eq_physicalClass_erase_first P] at hthirdFirst
  rw [secondPacket_B₂_eq_physicalClass_erase_second P] at hthirdSecond
  have hthirdClass :
      third ∈ SelectedClass D.A S.oppApex2 profile.radius :=
    (Finset.mem_erase.mp hthirdFirst).2
  have hthirdNeFirst : third ≠ P.first :=
    (Finset.mem_erase.mp hthirdFirst).1
  have hthirdNeSecond : third ≠ P.second :=
    (Finset.mem_erase.mp hthirdSecond).1
  have hthirdNotCritical :
      third ∉ (H.selectedAt P.unusedRow.unused.point
        P.unusedRow.source_mem_A).toCriticalFourShell.support := by
    rw [← firstPacket_B₁_eq_actualCriticalSupport P]
    exact hthirdNotActualRow
  have hblocker :
      HasNEquidistantPointsAt 4 (D.A.erase third)
        (H.centerAt P.unusedRow.unused.point P.unusedRow.source_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H P.unusedRow.source_mem_A).mpr hthirdNotCritical
  have hphysical :
      HasNEquidistantPointsAt 4 (D.A.erase third) S.oppApex2 := by
    refine ⟨profile.radius, profile.radius_pos, ?_⟩
    have hcard :
        (SelectedClass (D.A.erase third)
          S.oppApex2 profile.radius).card = 4 := by
      rw [selectedClass_erase_eq, Finset.card_erase_of_mem hthirdClass,
        profile.class_card_eq_five]
    change 4 ≤
      (SelectedClass (D.A.erase third)
        S.oppApex2 profile.radius).card
    omega
  exact ⟨third, hthirdClass, hthirdNeFirst, hthirdNeSecond,
    hthirdNotCritical, hblocker, hphysical⟩

end ATailLargeCapUniqueFiveCommonDeletionNormalForm
end Problem97
