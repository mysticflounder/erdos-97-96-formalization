/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.RemovableVertexAxiom.PinnedSurplusGeneralM

/-!
# Cap-five apex-radius rigidity

This scratch module isolates the full convex/MEC consequence relevant to the
card-twelve `(5,5,5)` ATAIL branch.  Every K4 radius class at a Moser apex
contains at least two points of the strict interior of the opposite cap.  If
that closed cap has five points, its strict interior has only three points, so
two distinct K4 radii are impossible.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFullGeometryProducerScratch

attribute [local instance] Classical.propDecidable

/-- Uniformly, the indexed strict cap interior is obtained by deleting the two
Moser endpoints of the corresponding closed cap. -/
theorem capInteriorByIndex_card_add_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    (S.capInteriorByIndex i).card + 2 = (S.capByIndex i).card := by
  fin_cases i
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex]
    have hv3 : S.triangle.v3 ∈ S.partition.C1.erase S.triangle.v2 := by
      exact Finset.mem_erase.mpr
        ⟨S.triangle.v23_ne.symm, S.partition.v3_mem_C1⟩
    have htwo : 2 ≤ S.partition.C1.card := by
      have hsub : {S.triangle.v2, S.triangle.v3} ⊆ S.partition.C1 := by
        intro x hx
        simp only [Finset.mem_insert, Finset.mem_singleton] at hx
        rcases hx with rfl | rfl
        · exact S.partition.v2_mem_C1
        · exact S.partition.v3_mem_C1
      have hcard := Finset.card_le_card hsub
      simpa [S.triangle.v23_ne] using hcard
    rw [Finset.card_erase_of_mem hv3,
      Finset.card_erase_of_mem S.partition.v2_mem_C1]
    omega
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex]
    have hv1 : S.triangle.v1 ∈ S.partition.C2.erase S.triangle.v3 := by
      exact Finset.mem_erase.mpr
        ⟨S.triangle.v13_ne, S.partition.v1_mem_C2⟩
    have htwo : 2 ≤ S.partition.C2.card := by
      have hsub : {S.triangle.v3, S.triangle.v1} ⊆ S.partition.C2 := by
        intro x hx
        simp only [Finset.mem_insert, Finset.mem_singleton] at hx
        rcases hx with rfl | rfl
        · exact S.partition.v3_mem_C2
        · exact S.partition.v1_mem_C2
      have hcard := Finset.card_le_card hsub
      simpa [S.triangle.v13_ne, S.triangle.v13_ne.symm] using hcard
    rw [Finset.card_erase_of_mem hv1,
      Finset.card_erase_of_mem S.partition.v3_mem_C2]
    omega
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex]
    have hv2 : S.triangle.v2 ∈ S.partition.C3.erase S.triangle.v1 := by
      exact Finset.mem_erase.mpr
        ⟨S.triangle.v12_ne.symm, S.partition.v2_mem_C3⟩
    have htwo : 2 ≤ S.partition.C3.card := by
      have hsub : {S.triangle.v1, S.triangle.v2} ⊆ S.partition.C3 := by
        intro x hx
        simp only [Finset.mem_insert, Finset.mem_singleton] at hx
        rcases hx with rfl | rfl
        · exact S.partition.v1_mem_C3
        · exact S.partition.v2_mem_C3
      have hcard := Finset.card_le_card hsub
      simpa [S.triangle.v12_ne] using hcard
    rw [Finset.card_erase_of_mem hv2,
      Finset.card_erase_of_mem S.partition.v1_mem_C3]
    omega

/-- A five-point closed cap has three strict-interior points. -/
theorem capInteriorByIndex_card_eq_three_of_cap_card_eq_five
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hcard : (S.capByIndex i).card = 5) :
    (S.capInteriorByIndex i).card = 3 := by
  fin_cases i
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv3 : S.triangle.v3 ∈ S.partition.C1.erase S.triangle.v2 := by
      exact Finset.mem_erase.mpr
        ⟨S.triangle.v23_ne.symm, S.partition.v3_mem_C1⟩
    rw [Finset.card_erase_of_mem hv3,
      Finset.card_erase_of_mem S.partition.v2_mem_C1, hcard]
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv1 : S.triangle.v1 ∈ S.partition.C2.erase S.triangle.v3 := by
      exact Finset.mem_erase.mpr
        ⟨S.triangle.v13_ne, S.partition.v1_mem_C2⟩
    rw [Finset.card_erase_of_mem hv1,
      Finset.card_erase_of_mem S.partition.v3_mem_C2, hcard]
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv2 : S.triangle.v2 ∈ S.partition.C3.erase S.triangle.v1 := by
      exact Finset.mem_erase.mpr
        ⟨S.triangle.v12_ne.symm, S.partition.v2_mem_C3⟩
    rw [Finset.card_erase_of_mem hv2,
      Finset.card_erase_of_mem S.partition.v1_mem_C3, hcard]

/-- Every positive-radius class at the apex opposite a five-point cap has at
most five carrier points.  At most two class points lie outside the strict
cap interior, and that interior has cardinality three. -/
theorem oppositeVertex_selectedClass_card_le_five_of_cap_card_eq_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 5)
    {r : ℝ} (hr : 0 < r) :
    (SelectedClass A (S.oppositeVertexByIndex i) r).card ≤ 5 := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex i) r
  let I := S.capInteriorByIndex i
  have hleftOne :
      (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i r
  have hrightOne :
      (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i r
  have hcover :
      T \ I ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T, I] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hr
  have houtside : (T \ I).card ≤ 2 := by
    calc
      (T \ I).card ≤
          ((T ∩ S.leftAdjacentCapByIndex i) ∪
            (T ∩ S.rightAdjacentCapByIndex i)).card :=
        Finset.card_le_card hcover
      _ ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
          (T ∩ S.rightAdjacentCapByIndex i).card :=
        Finset.card_union_le _ _
      _ ≤ 2 := by omega
  have hI : I.card = 3 := by
    simpa [I] using
      capInteriorByIndex_card_eq_three_of_cap_card_eq_five S i hcap
  have hinter : (T ∩ I).card ≤ 3 := by
    exact (Finset.card_le_card Finset.inter_subset_right).trans_eq hI
  have hsplit := Finset.card_sdiff_add_card_inter T I
  change T.card ≤ 5
  omega

/-- At the apex opposite a five-point cap, all positive radii supporting four
carrier points coincide.

The proof uses the full MEC cap cover and convex one-hit bounds: each such
radius contributes at least two strict-interior points.  Distinct radii give
disjoint contributions, but the strict interior has cardinality three. -/
theorem oppositeVertex_K4_radius_unique_of_cap_card_eq_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 5)
    {r ρ : ℝ} (hr : 0 < r) (hρ : 0 < ρ)
    (hrFour : 4 ≤
      (SelectedClass A (S.oppositeVertexByIndex i) r).card)
    (hρFour : 4 ≤
      (SelectedClass A (S.oppositeVertexByIndex i) ρ).card) :
    r = ρ := by
  classical
  by_contra hrρ
  let Ir := SelectedClass A (S.oppositeVertexByIndex i) r ∩
    S.capInteriorByIndex i
  let Iρ := SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
    S.capInteriorByIndex i
  have hIr : 2 ≤ Ir.card := by
    simpa [Ir] using
      S.selectedClass_capInteriorByIndex_card_ge_two
        hconv i hr hrFour
  have hIρ : 2 ≤ Iρ.card := by
    simpa [Iρ] using
      S.selectedClass_capInteriorByIndex_card_ge_two
        hconv i hρ hρFour
  have hdisjoint : Disjoint Ir Iρ := by
    rw [Finset.disjoint_left]
    intro x hxIr hxIρ
    have hxr : dist (S.oppositeVertexByIndex i) x = r :=
      (mem_selectedClass.mp (Finset.mem_inter.mp hxIr).1).2
    have hxρ : dist (S.oppositeVertexByIndex i) x = ρ :=
      (mem_selectedClass.mp (Finset.mem_inter.mp hxIρ).1).2
    exact hrρ (hxr.symm.trans hxρ)
  have hsub : Ir ∪ Iρ ⊆ S.capInteriorByIndex i := by
    intro x hx
    rcases Finset.mem_union.mp hx with hxIr | hxIρ
    · exact (Finset.mem_inter.mp hxIr).2
    · exact (Finset.mem_inter.mp hxIρ).2
  have hinterior : (S.capInteriorByIndex i).card = 3 :=
    capInteriorByIndex_card_eq_three_of_cap_card_eq_five S i hcap
  have hunion : (Ir ∪ Iρ).card = Ir.card + Iρ.card :=
    Finset.card_union_of_disjoint hdisjoint
  have hle := Finset.card_le_card hsub
  omega

/-- A K4 witness at the apex opposite a five-point cap has a unique positive
radius.  This packages the preceding result in the native
`HasNEquidistantPointsAt` interface. -/
theorem oppositeVertex_K4_unique_radius_of_cap_card_eq_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 5)
    (hK4 : HasNEquidistantPointsAt 4 A (S.oppositeVertexByIndex i)) :
    ∃ r : ℝ, 0 < r ∧
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r).card ∧
      ∀ ρ : ℝ, 0 < ρ →
        4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) ρ).card →
        ρ = r := by
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hK4 with
    ⟨r, hr, hrFour⟩
  refine ⟨r, hr, hrFour, ?_⟩
  intro ρ hρ hρFour
  exact (oppositeVertex_K4_radius_unique_of_cap_card_eq_five
    S hconv i hcap hρ hr hρFour hrFour)

/-- Full-filter normal form at the apex opposite a five-point cap: its K4
radius class has ambient cardinality four or five and is the unique positive
radius carrying four points. -/
theorem oppositeVertex_K4_unique_four_or_five_full_filter_of_cap_card_eq_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 5)
    (hK4 : HasNEquidistantPointsAt 4 A (S.oppositeVertexByIndex i)) :
    ∃ r : ℝ, 0 < r ∧
      ((SelectedClass A (S.oppositeVertexByIndex i) r).card = 4 ∨
        (SelectedClass A (S.oppositeVertexByIndex i) r).card = 5) ∧
      ∀ ρ : ℝ, 0 < ρ →
        4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) ρ).card →
        ρ = r := by
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hK4 with
    ⟨r, hr, hrFour⟩
  have hrFive :
      (SelectedClass A (S.oppositeVertexByIndex i) r).card ≤ 5 :=
    oppositeVertex_selectedClass_card_le_five_of_cap_card_eq_five
      S hconv i hcap hr
  refine ⟨r, hr, by omega, ?_⟩
  intro ρ hρ hρFour
  exact oppositeVertex_K4_radius_unique_of_cap_card_eq_five
    S hconv i hcap hρ hr hρFour hrFour

/-- Capacity form of apex-radius rigidity.  Two positive K4 radii would give
two disjoint two-point subsets of the strict opposite-cap interior, so that
interior must have at least four points. -/
theorem oppositeVertex_K4_radius_unique_of_capInterior_card_le_three
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcapInterior : (S.capInteriorByIndex i).card ≤ 3)
    {r ρ : ℝ} (hr : 0 < r) (hρ : 0 < ρ)
    (hrFour : 4 ≤
      (SelectedClass A (S.oppositeVertexByIndex i) r).card)
    (hρFour : 4 ≤
      (SelectedClass A (S.oppositeVertexByIndex i) ρ).card) :
    r = ρ := by
  classical
  by_contra hrρ
  let Ir := SelectedClass A (S.oppositeVertexByIndex i) r ∩
    S.capInteriorByIndex i
  let Iρ := SelectedClass A (S.oppositeVertexByIndex i) ρ ∩
    S.capInteriorByIndex i
  have hIr : 2 ≤ Ir.card := by
    simpa [Ir] using
      S.selectedClass_capInteriorByIndex_card_ge_two
        hconv i hr hrFour
  have hIρ : 2 ≤ Iρ.card := by
    simpa [Iρ] using
      S.selectedClass_capInteriorByIndex_card_ge_two
        hconv i hρ hρFour
  have hdisjoint : Disjoint Ir Iρ := by
    rw [Finset.disjoint_left]
    intro x hxIr hxIρ
    have hxr : dist (S.oppositeVertexByIndex i) x = r :=
      (mem_selectedClass.mp (Finset.mem_inter.mp hxIr).1).2
    have hxρ : dist (S.oppositeVertexByIndex i) x = ρ :=
      (mem_selectedClass.mp (Finset.mem_inter.mp hxIρ).1).2
    exact hrρ (hxr.symm.trans hxρ)
  have hsub : Ir ∪ Iρ ⊆ S.capInteriorByIndex i := by
    intro x hx
    rcases Finset.mem_union.mp hx with hxIr | hxIρ
    · exact (Finset.mem_inter.mp hxIr).2
    · exact (Finset.mem_inter.mp hxIρ).2
  have hunion : (Ir ∪ Iρ).card = Ir.card + Iρ.card :=
    Finset.card_union_of_disjoint hdisjoint
  have hle := Finset.card_le_card hsub
  omega

/-- Sharp growth consequence: two distinct positive K4 radii at a Moser apex
force at least four strict-interior points in the opposite cap. -/
theorem oppositeVertex_distinct_K4_radii_force_capInterior_card_ge_four
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {r ρ : ℝ} (hr : 0 < r) (hρ : 0 < ρ)
    (hrFour : 4 ≤
      (SelectedClass A (S.oppositeVertexByIndex i) r).card)
    (hρFour : 4 ≤
      (SelectedClass A (S.oppositeVertexByIndex i) ρ).card)
    (hrρ : r ≠ ρ) :
    4 ≤ (S.capInteriorByIndex i).card := by
  by_contra hcard
  have hle : (S.capInteriorByIndex i).card ≤ 3 := by omega
  exact hrρ
    (oppositeVertex_K4_radius_unique_of_capInterior_card_le_three
      S hconv i hle hr hρ hrFour hρFour)

/-- Closed-cap version of the growth consequence: two distinct positive K4
radii at the opposite apex require a cap of cardinality at least six. -/
theorem oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {r ρ : ℝ} (hr : 0 < r) (hρ : 0 < ρ)
    (hrFour : 4 ≤
      (SelectedClass A (S.oppositeVertexByIndex i) r).card)
    (hρFour : 4 ≤
      (SelectedClass A (S.oppositeVertexByIndex i) ρ).card)
    (hrρ : r ≠ ρ) :
    6 ≤ (S.capByIndex i).card := by
  have hinter :=
    oppositeVertex_distinct_K4_radii_force_capInterior_card_ge_four
      S hconv i hr hρ hrFour hρFour hrρ
  have hcap := capInteriorByIndex_card_add_two S i
  omega

/-- A positive radius class at the apex opposite a four-point cap has at most
four carrier points. -/
theorem oppositeVertex_selectedClass_card_le_four_of_cap_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4)
    {r : ℝ} (hr : 0 < r) :
    (SelectedClass A (S.oppositeVertexByIndex i) r).card ≤ 4 := by
  classical
  let T := SelectedClass A (S.oppositeVertexByIndex i) r
  let I := S.capInteriorByIndex i
  have hleftOne :
      (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i r
  have hrightOne :
      (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i r
  have hcover :
      T \ I ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T, I] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hr
  have houtside : (T \ I).card ≤ 2 := by
    calc
      (T \ I).card ≤
          ((T ∩ S.leftAdjacentCapByIndex i) ∪
            (T ∩ S.rightAdjacentCapByIndex i)).card :=
        Finset.card_le_card hcover
      _ ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
          (T ∩ S.rightAdjacentCapByIndex i).card :=
        Finset.card_union_le _ _
      _ ≤ 2 := by omega
  have hI : I.card = 2 := by
    simpa [I] using
      S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four i hcap
  have hinter : (T ∩ I).card ≤ 2 := by
    exact (Finset.card_le_card Finset.inter_subset_right).trans_eq hI
  have hsplit := Finset.card_sdiff_add_card_inter T I
  change T.card ≤ 4
  omega

/-- Full-filter normal form at the apex opposite a four-point cap: the unique
K4 radius class has ambient cardinality exactly four. -/
theorem oppositeVertex_K4_unique_four_full_filter_of_cap_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4)
    (hK4 : HasNEquidistantPointsAt 4 A (S.oppositeVertexByIndex i)) :
    ∃ r : ℝ, 0 < r ∧
      (SelectedClass A (S.oppositeVertexByIndex i) r).card = 4 ∧
      ∀ ρ : ℝ, 0 < ρ →
        4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) ρ).card →
        ρ = r := by
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hK4 with
    ⟨r, hr, hrFour⟩
  have hrFour' :
      (SelectedClass A (S.oppositeVertexByIndex i) r).card = 4 := by
    have hrLe :=
      oppositeVertex_selectedClass_card_le_four_of_cap_card_eq_four
        S hconv i hcap hr
    omega
  have hInterior : (S.capInteriorByIndex i).card ≤ 3 := by
    rw [S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four i hcap]
    omega
  refine ⟨r, hr, hrFour', ?_⟩
  intro ρ hρ hρFour
  exact oppositeVertex_K4_radius_unique_of_capInterior_card_le_three
    S hconv i hInterior hρ hr hρFour hrFour

/-- Uniform card-twelve normal form: whenever the opposite closed cap has four
or five points, the apex has a unique positive K4 radius and its ambient class
has cardinality four or five. -/
theorem oppositeVertex_K4_unique_four_or_five_full_filter_of_cap_card_four_or_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4 ∨
      (S.capByIndex i).card = 5)
    (hK4 : HasNEquidistantPointsAt 4 A (S.oppositeVertexByIndex i)) :
    ∃ r : ℝ, 0 < r ∧
      ((SelectedClass A (S.oppositeVertexByIndex i) r).card = 4 ∨
        (SelectedClass A (S.oppositeVertexByIndex i) r).card = 5) ∧
      ∀ ρ : ℝ, 0 < ρ →
        4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) ρ).card →
        ρ = r := by
  rcases hcap with hcap | hcap
  · rcases oppositeVertex_K4_unique_four_full_filter_of_cap_card_eq_four
      S hconv i hcap hK4 with ⟨r, hr, hrFour, hunique⟩
    exact ⟨r, hr, Or.inl hrFour, hunique⟩
  · exact
      oppositeVertex_K4_unique_four_or_five_full_filter_of_cap_card_eq_five
        S hconv i hcap hK4

/-- General two-center growth barrier.  If both non-surplus Moser apices carry
two distinct positive K4 radii, both opposite caps have at least six points;
the surplus cap has at least five, so the carrier has at least fourteen
points. -/
theorem both_opposite_apices_distinct_K4_radii_force_card_ge_fourteen
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    {r₁ ρ₁ r₂ ρ₂ : ℝ}
    (hr₁ : 0 < r₁) (hρ₁ : 0 < ρ₁)
    (hr₂ : 0 < r₂) (hρ₂ : 0 < ρ₂)
    (hr₁Four : 4 ≤
      (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) r₁).card)
    (hρ₁Four : 4 ≤
      (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) ρ₁).card)
    (hr₂Four : 4 ≤
      (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2) r₂).card)
    (hρ₂Four : 4 ≤
      (SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex2) ρ₂).card)
    (hr₁ρ₁ : r₁ ≠ ρ₁) (hr₂ρ₂ : r₂ ≠ ρ₂) :
    14 ≤ D.A.card := by
  have hcap₁ : 6 ≤ (S.capByIndex S.oppIndex1).card :=
    oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
      S D.convex S.oppIndex1 hr₁ hρ₁ hr₁Four hρ₁Four hr₁ρ₁
  have hcap₂ : 6 ≤ (S.capByIndex S.oppIndex2).card :=
    oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
      S D.convex S.oppIndex2 hr₂ hρ₂ hr₂Four hρ₂Four hr₂ρ₂
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx
  all_goals
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus
    simp only [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.capByIndex, hi] at hcap₁ hcap₂
    omega

/-- For every carrier of cardinality at most thirteen, one non-surplus cap has
cardinality four or five. -/
theorem card_le_thirteen_has_opposite_cap_card_four_or_five
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (hcard : D.A.card ≤ 13) :
    ((S.capByIndex S.oppIndex1).card = 4 ∨
        (S.capByIndex S.oppIndex1).card = 5) ∨
      ((S.capByIndex S.oppIndex2).card = 4 ∨
        (S.capByIndex S.oppIndex2).card = 5) := by
  have hlower :
      4 ≤ S.partition.C1.card ∧
        4 ≤ S.partition.C2.card ∧
          4 ≤ S.partition.C3.card :=
    U1OppositeCapLowerBounds.capTriple_caps_card_ge_four
      S.partition D.convex S.hncol D.K4
        (CircumscribedMECPacket.ofNonObtuse S.triangleNonObtuse S.hCirc)
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx
  all_goals
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus
    simp only [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.capByIndex, hi]
    omega

/-- At cardinality twelve, one of the two caps opposite the surplus cap has
cardinality four or five.  This is a full live-geometry consequence: every cap
has cardinality at least four, the surplus cap has at least five points, and
the three closed-cap cardinalities sum to fifteen. -/
theorem card_twelve_has_opposite_cap_card_four_or_five
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (hcard : D.A.card = 12) :
    ((S.capByIndex S.oppIndex1).card = 4 ∨
        (S.capByIndex S.oppIndex1).card = 5) ∨
      ((S.capByIndex S.oppIndex2).card = 4 ∨
        (S.capByIndex S.oppIndex2).card = 5) := by
  exact card_le_thirteen_has_opposite_cap_card_four_or_five
    D S (by omega)

/-- Full-filter small-card corollary.  Through cardinality thirteen, at least
one non-surplus Moser apex has a unique positive K4 radius, whose ambient
selected class has cardinality four or five. -/
theorem card_le_thirteen_has_unique_small_opposite_apex_full_filter
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (hcard : D.A.card ≤ 13) :
    ∃ i : Fin 3,
      (i = S.oppIndex1 ∨ i = S.oppIndex2) ∧
      ((S.capByIndex i).card = 4 ∨
        (S.capByIndex i).card = 5) ∧
      ∃ r : ℝ, 0 < r ∧
        ((SelectedClass D.A (S.oppositeVertexByIndex i) r).card = 4 ∨
          (SelectedClass D.A (S.oppositeVertexByIndex i) r).card = 5) ∧
        ∀ ρ : ℝ, 0 < ρ →
          4 ≤ (SelectedClass D.A (S.oppositeVertexByIndex i) ρ).card →
          ρ = r := by
  rcases card_le_thirteen_has_opposite_cap_card_four_or_five D S hcard with
    hsmall | hsmall
  · refine ⟨S.oppIndex1, Or.inl rfl, hsmall, ?_⟩
    exact
      oppositeVertex_K4_unique_four_or_five_full_filter_of_cap_card_four_or_five
        S D.convex S.oppIndex1 hsmall
          (D.K4 (S.oppositeVertexByIndex S.oppIndex1)
            (S.oppositeVertexByIndex_mem S.oppIndex1))
  · refine ⟨S.oppIndex2, Or.inr rfl, hsmall, ?_⟩
    exact
      oppositeVertex_K4_unique_four_or_five_full_filter_of_cap_card_four_or_five
        S D.convex S.oppIndex2 hsmall
          (D.K4 (S.oppositeVertexByIndex S.oppIndex2)
            (S.oppositeVertexByIndex_mem S.oppIndex2))

/-- Full-filter card-twelve specialization.  At least one non-surplus Moser apex
has a unique positive K4 radius, whose ambient selected class has cardinality
four or five. -/
theorem card_twelve_has_unique_small_opposite_apex_full_filter
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (hcard : D.A.card = 12) :
    ∃ i : Fin 3,
      (i = S.oppIndex1 ∨ i = S.oppIndex2) ∧
      ((S.capByIndex i).card = 4 ∨
        (S.capByIndex i).card = 5) ∧
      ∃ r : ℝ, 0 < r ∧
        ((SelectedClass D.A (S.oppositeVertexByIndex i) r).card = 4 ∨
          (SelectedClass D.A (S.oppositeVertexByIndex i) r).card = 5) ∧
        ∀ ρ : ℝ, 0 < ρ →
          4 ≤ (SelectedClass D.A (S.oppositeVertexByIndex i) ρ).card →
          ρ = r := by
  exact card_le_thirteen_has_unique_small_opposite_apex_full_filter
    D S (by omega)

#print axioms capInteriorByIndex_card_eq_three_of_cap_card_eq_five
#print axioms capInteriorByIndex_card_add_two
#print axioms oppositeVertex_selectedClass_card_le_five_of_cap_card_eq_five
#print axioms oppositeVertex_K4_radius_unique_of_cap_card_eq_five
#print axioms oppositeVertex_K4_unique_radius_of_cap_card_eq_five
#print axioms oppositeVertex_K4_unique_four_or_five_full_filter_of_cap_card_eq_five
#print axioms oppositeVertex_K4_radius_unique_of_capInterior_card_le_three
#print axioms oppositeVertex_distinct_K4_radii_force_capInterior_card_ge_four
#print axioms oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
#print axioms oppositeVertex_selectedClass_card_le_four_of_cap_card_eq_four
#print axioms oppositeVertex_K4_unique_four_full_filter_of_cap_card_eq_four
#print axioms oppositeVertex_K4_unique_four_or_five_full_filter_of_cap_card_four_or_five
#print axioms both_opposite_apices_distinct_K4_radii_force_card_ge_fourteen
#print axioms card_le_thirteen_has_opposite_cap_card_four_or_five
#print axioms card_le_thirteen_has_unique_small_opposite_apex_full_filter
#print axioms card_twelve_has_opposite_cap_card_four_or_five
#print axioms card_twelve_has_unique_small_opposite_apex_full_filter

end ATailFullGeometryProducerScratch
end Problem97
