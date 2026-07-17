/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RobustLargeRadiusExactFiveShellCurvature

/-!
# Scratch: live raw-row surface for the unseeded ordinal finite result

This file records exactly what the exact-five large-radius residual can source
before imposing the fixed fourteen-role `PROFILE=(8,4,5)` labeling used by the
unseeded ordinal DFS.

The physical second apex supplies an ambient-exact five-point class and a
selected four-subrow of that class. Two distinct members of the ambient class
can be used as provisional `A` and `D` centers. Global K4 supplies rows at
both. The retained critical map at `D` supplies an actual `t1` blocker row
through `D`; another point `X` of that row has its own global K4 row.

No fixed-profile support identities or cap/order labels are claimed here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustLargeRadiusExactFiveShellCurvatureScratch

open ATailRobustLargeRadiusExactFiveConsumerScratch
open ATailRobustLargeRadiusGeometryScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- The unused-point packet remembers the live large-cap cardinality that is
incompatible with the direct `PROFILE=(8,4,5)` role assignment's four-point
second opposite cap. -/
theorem six_le_oppCap2_card_of_unusedCriticalRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (unusedRow : LargeCapUniqueFiveUnusedCriticalRow D S H profile) :
    6 ≤ S.oppCap2.card := by
  have herase := unusedRow.unused.erased_oppCap2_card_ge_five
  rw [Finset.card_erase_of_mem unusedRow.unused.point_mem_oppCap2] at herase
  omega

/-- Maximal raw row surface that is uniformly extractable from the live
exact-five residual.

The field names follow the finite ordinal roles provisionally, but only the
displayed source-valid facts are asserted. In particular, `ARow`, `DRow`, and
`XRow` are arbitrary global-K4 selections; their fixed-profile supports are
not available. -/
structure LiveUnseededOrdinalRawRows
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (unusedRow : LargeCapUniqueFiveUnusedCriticalRow D S H profile) : Type where
  physicalO : ℝ²
  physicalO_eq : physicalO = S.oppApex2
  physicalO_mem_A : physicalO ∈ D.A
  ambientOClass : Finset ℝ²
  ambientOClass_eq :
    ambientOClass = SelectedClass D.A physicalO profile.radius
  ambientOClass_card_eq_five : ambientOClass.card = 5
  ORow : SelectedFourClass D.A physicalO
  ORow_support_subset_ambientOClass : ORow.support ⊆ ambientOClass
  Apoint : ℝ²
  Dpoint : ℝ²
  Apoint_mem_ambientOClass : Apoint ∈ ambientOClass
  Dpoint_mem_ambientOClass : Dpoint ∈ ambientOClass
  Apoint_ne_Dpoint : Apoint ≠ Dpoint
  Apoint_mem_A : Apoint ∈ D.A
  Dpoint_mem_A : Dpoint ∈ D.A
  ARow : SelectedFourClass D.A Apoint
  DRow : SelectedFourClass D.A Dpoint
  physicalO_survives_Dpoint_deletion :
    HasNEquidistantPointsAt 4 (D.A.erase Dpoint) physicalO
  t1 : ℝ²
  t1_eq : t1 = H.centerAt Dpoint Dpoint_mem_A
  t1_mem_A : t1 ∈ D.A
  t1_ne_physicalO : t1 ≠ physicalO
  t1CriticalRow : CriticalSelectedFourClass D.A Dpoint t1
  Dpoint_mem_t1CriticalSupport :
    Dpoint ∈ t1CriticalRow.toCriticalFourShell.support
  Xpoint : ℝ²
  Xpoint_mem_t1CriticalSupport :
    Xpoint ∈ t1CriticalRow.toCriticalFourShell.support
  Xpoint_ne_Dpoint : Xpoint ≠ Dpoint
  Xpoint_mem_A : Xpoint ∈ D.A
  XRow : SelectedFourClass D.A Xpoint
  unusedSource_not_mem_ambientOClass :
    unusedRow.unused.point ∉ ambientOClass

/-- The raw row surface above is uniformly available. The proof deliberately
stops before assigning the fixed `PROFILE=(8,4,5)` supports or fourteen-role
boundary order. -/
theorem nonempty_liveUnseededOrdinalRawRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (unusedRow : LargeCapUniqueFiveUnusedCriticalRow D S H profile) :
    Nonempty (LiveUnseededOrdinalRawRows D S H profile unusedRow) := by
  classical
  let physicalO := S.oppApex2
  let ambientOClass := SelectedClass D.A physicalO profile.radius
  have hphysicalOA : physicalO ∈ D.A := by
    simpa [physicalO] using oppApex2_mem_A S
  have hambientCard : ambientOClass.card = 5 := by
    simpa [ambientOClass, physicalO] using profile.class_card_eq_five
  rcases exists_selectedFourClass_of_globalK4 D.K4 hphysicalOA with ⟨ORow⟩
  have hORowSelected :
      4 ≤ (SelectedClass D.A physicalO ORow.radius).card := by
    have hsub : ORow.support ⊆ SelectedClass D.A physicalO ORow.radius := by
      intro x hx
      exact mem_selectedClass.mpr
        ⟨ORow.support_subset_A hx, ORow.support_eq_radius x hx⟩
    exact ORow.support_card.symm.le.trans (Finset.card_le_card hsub)
  have hORadius : ORow.radius = profile.radius :=
    profile.unique_K4_radius ORow.radius ORow.radius_pos
      (by simpa [physicalO] using hORowSelected)
  have hORowSub : ORow.support ⊆ ambientOClass := by
    intro x hx
    exact mem_selectedClass.mpr
      ⟨ORow.support_subset_A hx, by
        simpa [ambientOClass, physicalO, hORadius] using
          ORow.support_eq_radius x hx⟩
  have hambientOne : 1 < ambientOClass.card := by
    rw [hambientCard]
    omega
  rcases Finset.one_lt_card.mp hambientOne with
    ⟨Apoint, hApoint, Dpoint, hDpoint, hAD⟩
  have hApointA : Apoint ∈ D.A :=
    (mem_selectedClass.mp (by simpa [ambientOClass] using hApoint)).1
  have hDpointA : Dpoint ∈ D.A :=
    (mem_selectedClass.mp (by simpa [ambientOClass] using hDpoint)).1
  rcases exists_selectedFourClass_of_globalK4 D.K4 hApointA with ⟨ARow⟩
  rcases exists_selectedFourClass_of_globalK4 D.K4 hDpointA with ⟨DRow⟩
  have hphysicalSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase Dpoint) physicalO := by
    refine ⟨profile.radius, profile.radius_pos, ?_⟩
    have hfive :
        5 ≤ (SelectedClass D.A physicalO profile.radius).card := by
      simpa [ambientOClass] using hambientCard.ge
    have hfour := selectedClass_erase_card_ge_of_succ_le
      (A := D.A) (x := Dpoint) (s := physicalO)
      (d := profile.radius) (n := 4) hfive
    simpa [SelectedClass] using hfour
  let t1 := H.centerAt Dpoint hDpointA
  have ht1A : t1 ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt Dpoint hDpointA).toCriticalFourShell.center_mem).2
  have ht1NeO : t1 ≠ physicalO := by
    intro ht1
    apply H.no_qfree_at Dpoint hDpointA
    simpa [t1, ht1] using hphysicalSurvives
  let t1CriticalRow := H.selectedAt Dpoint hDpointA
  have hDpointSupport :
      Dpoint ∈ t1CriticalRow.toCriticalFourShell.support := by
    exact (H.selectedAt Dpoint hDpointA).toCriticalFourShell.q_mem_support
  have ht1SupportOne : 1 < t1CriticalRow.toCriticalFourShell.support.card := by
    rw [t1CriticalRow.toCriticalFourShell.support_card]
    omega
  obtain ⟨Xpoint, hXpointSupport, hXpointNe⟩ :
      ∃ Xpoint,
        Xpoint ∈ t1CriticalRow.toCriticalFourShell.support ∧
          Xpoint ≠ Dpoint := by
    rcases Finset.one_lt_card.mp ht1SupportOne with
      ⟨x, hx, y, hy, hxy⟩
    by_cases hxD : x = Dpoint
    · refine ⟨y, hy, ?_⟩
      intro hyD
      exact hxy (hxD.trans hyD.symm)
    · exact ⟨x, hx, hxD⟩
  have hXpointA : Xpoint ∈ D.A :=
    t1CriticalRow.toCriticalFourShell.support_subset_A hXpointSupport
  rcases exists_selectedFourClass_of_globalK4 D.K4 hXpointA with ⟨XRow⟩
  have hunusedOutside : unusedRow.unused.point ∉ ambientOClass := by
    simpa [ambientOClass, physicalO] using
      unusedRow.unused.point_not_mem_radiusClass
  exact ⟨{
    physicalO := physicalO
    physicalO_eq := rfl
    physicalO_mem_A := hphysicalOA
    ambientOClass := ambientOClass
    ambientOClass_eq := rfl
    ambientOClass_card_eq_five := hambientCard
    ORow := ORow
    ORow_support_subset_ambientOClass := hORowSub
    Apoint := Apoint
    Dpoint := Dpoint
    Apoint_mem_ambientOClass := hApoint
    Dpoint_mem_ambientOClass := hDpoint
    Apoint_ne_Dpoint := hAD
    Apoint_mem_A := hApointA
    Dpoint_mem_A := hDpointA
    ARow := ARow
    DRow := DRow
    physicalO_survives_Dpoint_deletion := hphysicalSurvives
    t1 := t1
    t1_eq := rfl
    t1_mem_A := ht1A
    t1_ne_physicalO := ht1NeO
    t1CriticalRow := t1CriticalRow
    Dpoint_mem_t1CriticalSupport := hDpointSupport
    Xpoint := Xpoint
    Xpoint_mem_t1CriticalSupport := hXpointSupport
    Xpoint_ne_Dpoint := hXpointNe
    Xpoint_mem_A := hXpointA
    XRow := XRow
    unusedSource_not_mem_ambientOClass := hunusedOutside
  }⟩

#print axioms nonempty_liveUnseededOrdinalRawRows
#print axioms six_le_oppCap2_card_of_unusedCriticalRow

end ATailRobustLargeRadiusExactFiveShellCurvatureScratch
end Problem97
