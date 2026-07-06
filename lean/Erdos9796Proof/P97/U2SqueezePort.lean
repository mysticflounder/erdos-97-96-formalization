/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U2EquilateralMECFromM44

/-!
# U2 squeeze port: `U2FullDistanceClasses` from cap-containment

This file proves `u2FullDistanceClasses_of_capContainment`: given a
`CounterexampleData D` in the `(m, 4, 4)` regime, the `U2FullDistanceClasses`
conclusion follows from an explicit cap-containment hypothesis.

The hypothesis packages the "reverse containment" missing from U1.3
(`U1EndpointEquality`): any four-or-more-point equidistance class at the
opposite apex is already inside the opposite cap.  Combined with the K4
property (which supplies such a class) and the exact cap-size bound
(`|oppCap1| = 4`), a cardinality squeeze pins the cap as the full
equidistance class.

## Proof outline

1. `D.IsM44` gives `|oppCap1| = 4` and `|oppCap2| = 4`.
2. `D.K4` (specialised at `oppApex1 ∈ D.A`) gives radius `r₁ > 0` with
   `4 ≤ |D.A.filter (fun q => dist oppApex1 q = r₁)|`.
3. Rewrite via `dist_comm` so the filter uses `dist q oppApex1 = r₁`,
   matching the form in `U2FullDistanceClasses` and `hcont1`.
4. `hcont1 r₁` maps the rewritten class into `oppCap1`.  The class has
   size ≥ 4 and `|oppCap1| = 4`, so they are equal by
   `Finset.eq_of_subset_of_card_le`.
5. Repeat for `oppApex2 → r₂`.
6. Obtain `r₁ = r₂` via the cross-memberships `oppApex2 ∈ oppCap1` and
   `oppApex1 ∈ oppCap2`, which follow by surplusIdx case-split on the
   `CapTriple` membership fields.  The common value is `d := r₁`.

## Moser-vertex membership facts used (all from `CapTriple`)

The `CapTriple` structure has fields `v1_mem_C2`, `v1_mem_C3`, `v2_mem_C1`,
`v2_mem_C3`, `v3_mem_C1`, `v3_mem_C2` (and their `v?_notin_C?` negations).
In each surplusIdx case, `oppApex1` and `oppApex2` are two distinct vertices
not equal to the surplus cap's opposite apex; we extract their membership in
the non-surplus caps from the above fields and use `C?_subset` to lift to `A`.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- Helper: rewrite the K4 filter predicate from `dist apex x = r` to
`dist x apex = r` using `dist_comm`. -/
private lemma filter_dist_comm (A : Finset ℝ²) (p : ℝ²) (r : ℝ) :
    A.filter (fun q => dist p q = r) = A.filter (fun q => dist q p = r) := by
  apply Finset.filter_congr
  intros x _
  exact ⟨fun h => by rwa [dist_comm] at h, fun h => by rwa [dist_comm]⟩

namespace U2NonSurplusSqueeze

private lemma mem_moserVerts_cases {A : Finset ℝ²} {M : MoserTriangle A} {x : ℝ²}
    (hx : x ∈ M.verts) : x = M.v1 ∨ x = M.v2 ∨ x = M.v3 := by
  simpa [MoserTriangle.verts] using hx

private lemma nonmoser_not_mem_C1_C2 {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) {x : ℝ²} (hxA : x ∈ A) (hxnot : x ∉ M.verts)
    (hxC1 : x ∈ CP.C1) (hxC2 : x ∈ CP.C2) : False := by
  have hone := CP.nonmoser_in_one x hxA hxnot
  by_cases hxC3 : x ∈ CP.C3
  · simp [hxC1, hxC2, hxC3] at hone
  · simp [hxC1, hxC2, hxC3] at hone

private lemma nonmoser_not_mem_C1_C3 {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) {x : ℝ²} (hxA : x ∈ A) (hxnot : x ∉ M.verts)
    (hxC1 : x ∈ CP.C1) (hxC3 : x ∈ CP.C3) : False := by
  have hone := CP.nonmoser_in_one x hxA hxnot
  by_cases hxC2 : x ∈ CP.C2
  · simp [hxC1, hxC2, hxC3] at hone
  · simp [hxC1, hxC2, hxC3] at hone

private lemma nonmoser_not_mem_C2_C3 {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) {x : ℝ²} (hxA : x ∈ A) (hxnot : x ∉ M.verts)
    (hxC2 : x ∈ CP.C2) (hxC3 : x ∈ CP.C3) : False := by
  have hone := CP.nonmoser_in_one x hxA hxnot
  by_cases hxC1 : x ∈ CP.C1
  · simp [hxC1, hxC2, hxC3] at hone
  · simp [hxC1, hxC2, hxC3] at hone

private lemma C1_inter_C2_union_C3_eq_pair {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) :
    CP.C1 ∩ (CP.C2 ∪ CP.C3) = ({M.v2, M.v3} : Finset ℝ²) := by
  ext x
  constructor
  · intro hx
    have hxC1 : x ∈ CP.C1 := (Finset.mem_inter.mp hx).1
    have hxAdj : x ∈ CP.C2 ∪ CP.C3 := (Finset.mem_inter.mp hx).2
    by_cases hxVerts : x ∈ M.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (CP.v1_notin_C1 hxC1)
      · simp
      · simp
    · have hxA : x ∈ A := CP.C1_subset hxC1
      rcases Finset.mem_union.mp hxAdj with hxC2 | hxC3
      · exact False.elim (nonmoser_not_mem_C1_C2 CP hxA hxVerts hxC1 hxC2)
      · exact False.elim (nonmoser_not_mem_C1_C3 CP hxA hxVerts hxC1 hxC3)
  · intro hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨CP.v2_mem_C1, Finset.mem_union.mpr (Or.inr CP.v2_mem_C3)⟩
    · exact Finset.mem_inter.mpr ⟨CP.v3_mem_C1, Finset.mem_union.mpr (Or.inl CP.v3_mem_C2)⟩

private lemma C2_inter_C1_union_C3_eq_pair {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) :
    CP.C2 ∩ (CP.C1 ∪ CP.C3) = ({M.v1, M.v3} : Finset ℝ²) := by
  ext x
  constructor
  · intro hx
    have hxC2 : x ∈ CP.C2 := (Finset.mem_inter.mp hx).1
    have hxAdj : x ∈ CP.C1 ∪ CP.C3 := (Finset.mem_inter.mp hx).2
    by_cases hxVerts : x ∈ M.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · simp
      · exact False.elim (CP.v2_notin_C2 hxC2)
      · simp
    · have hxA : x ∈ A := CP.C2_subset hxC2
      rcases Finset.mem_union.mp hxAdj with hxC1 | hxC3
      · exact False.elim (nonmoser_not_mem_C1_C2 CP hxA hxVerts hxC1 hxC2)
      · exact False.elim (nonmoser_not_mem_C2_C3 CP hxA hxVerts hxC2 hxC3)
  · intro hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨CP.v1_mem_C2, Finset.mem_union.mpr (Or.inr CP.v1_mem_C3)⟩
    · exact Finset.mem_inter.mpr ⟨CP.v3_mem_C2, Finset.mem_union.mpr (Or.inl CP.v3_mem_C1)⟩

private lemma C3_inter_C1_union_C2_eq_pair {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) :
    CP.C3 ∩ (CP.C1 ∪ CP.C2) = ({M.v1, M.v2} : Finset ℝ²) := by
  ext x
  constructor
  · intro hx
    have hxC3 : x ∈ CP.C3 := (Finset.mem_inter.mp hx).1
    have hxAdj : x ∈ CP.C1 ∪ CP.C2 := (Finset.mem_inter.mp hx).2
    by_cases hxVerts : x ∈ M.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · simp
      · simp
      · exact False.elim (CP.v3_notin_C3 hxC3)
    · have hxA : x ∈ A := CP.C3_subset hxC3
      rcases Finset.mem_union.mp hxAdj with hxC1 | hxC2
      · exact False.elim (nonmoser_not_mem_C1_C3 CP hxA hxVerts hxC1 hxC3)
      · exact False.elim (nonmoser_not_mem_C2_C3 CP hxA hxVerts hxC2 hxC3)
  · intro hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨CP.v1_mem_C3, Finset.mem_union.mpr (Or.inr CP.v1_mem_C2)⟩
    · exact Finset.mem_inter.mpr ⟨CP.v2_mem_C3, Finset.mem_union.mpr (Or.inl CP.v2_mem_C1)⟩

private lemma C1_sdiff_C2_union_C3_card_eq_two {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) (hC1 : CP.C1.card = 4) :
    (CP.C1 \ (CP.C2 ∪ CP.C3)).card = 2 := by
  have hinter : (CP.C1 ∩ (CP.C2 ∪ CP.C3)).card = 2 := by
    rw [C1_inter_C2_union_C3_eq_pair CP]
    simp [M.v23_ne]
  have hsum := Finset.card_inter_add_card_sdiff CP.C1 (CP.C2 ∪ CP.C3)
  omega

private lemma C2_sdiff_C1_union_C3_card_eq_two {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) (hC2 : CP.C2.card = 4) :
    (CP.C2 \ (CP.C1 ∪ CP.C3)).card = 2 := by
  have hinter : (CP.C2 ∩ (CP.C1 ∪ CP.C3)).card = 2 := by
    rw [C2_inter_C1_union_C3_eq_pair CP]
    simp [M.v13_ne]
  have hsum := Finset.card_inter_add_card_sdiff CP.C2 (CP.C1 ∪ CP.C3)
  omega

private lemma C3_sdiff_C1_union_C2_card_eq_two {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) (hC3 : CP.C3.card = 4) :
    (CP.C3 \ (CP.C1 ∪ CP.C2)).card = 2 := by
  have hinter : (CP.C3 ∩ (CP.C1 ∪ CP.C2)).card = 2 := by
    rw [C3_inter_C1_union_C2_eq_pair CP]
    simp [M.v12_ne]
  have hsum := Finset.card_inter_add_card_sdiff CP.C3 (CP.C1 ∪ CP.C2)
  omega

private lemma C1_cover_by_C2_C3_interior {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) :
    A ⊆ CP.C2 ∪ CP.C3 ∪ (CP.C1 \ (CP.C2 ∪ CP.C3)) := by
  intro x hxA
  simp only [Finset.mem_union, Finset.mem_sdiff]
  by_cases hxC2 : x ∈ CP.C2
  · exact Or.inl (Or.inl hxC2)
  by_cases hxC3 : x ∈ CP.C3
  · exact Or.inl (Or.inr hxC3)
  have hxC1 : x ∈ CP.C1 := by
    by_cases hxVerts : x ∈ M.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (hxC2 CP.v1_mem_C2)
      · exact False.elim (hxC3 CP.v2_mem_C3)
      · exact False.elim (hxC2 CP.v3_mem_C2)
    · have hone := CP.nonmoser_in_one x hxA hxVerts
      by_cases hxC1 : x ∈ CP.C1
      · exact hxC1
      · simp [hxC1, hxC2, hxC3] at hone
  exact Or.inr ⟨hxC1, by simp [hxC2, hxC3]⟩

private lemma C2_cover_by_C1_C3_interior {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) :
    A ⊆ CP.C1 ∪ CP.C3 ∪ (CP.C2 \ (CP.C1 ∪ CP.C3)) := by
  intro x hxA
  simp only [Finset.mem_union, Finset.mem_sdiff]
  by_cases hxC1 : x ∈ CP.C1
  · exact Or.inl (Or.inl hxC1)
  by_cases hxC3 : x ∈ CP.C3
  · exact Or.inl (Or.inr hxC3)
  have hxC2 : x ∈ CP.C2 := by
    by_cases hxVerts : x ∈ M.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (hxC3 CP.v1_mem_C3)
      · exact False.elim (hxC1 CP.v2_mem_C1)
      · exact False.elim (hxC1 CP.v3_mem_C1)
    · have hone := CP.nonmoser_in_one x hxA hxVerts
      by_cases hxC2 : x ∈ CP.C2
      · exact hxC2
      · simp [hxC1, hxC2, hxC3] at hone
  exact Or.inr ⟨hxC2, by simp [hxC1, hxC3]⟩

private lemma C3_cover_by_C1_C2_interior {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) :
    A ⊆ CP.C1 ∪ CP.C2 ∪ (CP.C3 \ (CP.C1 ∪ CP.C2)) := by
  intro x hxA
  simp only [Finset.mem_union, Finset.mem_sdiff]
  by_cases hxC1 : x ∈ CP.C1
  · exact Or.inl (Or.inl hxC1)
  by_cases hxC2 : x ∈ CP.C2
  · exact Or.inl (Or.inr hxC2)
  have hxC3 : x ∈ CP.C3 := by
    by_cases hxVerts : x ∈ M.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (hxC2 CP.v1_mem_C2)
      · exact False.elim (hxC1 CP.v2_mem_C1)
      · exact False.elim (hxC1 CP.v3_mem_C1)
    · have hone := CP.nonmoser_in_one x hxA hxVerts
      by_cases hxC3 : x ∈ CP.C3
      · exact hxC3
      · simp [hxC1, hxC2, hxC3] at hone
  exact Or.inr ⟨hxC3, by simp [hxC1, hxC2]⟩

/-- The first non-surplus opposite cap has a two-point interior after removing
the two adjacent caps. -/
theorem oppApex1_interior_card_eq_two_of_isM44 {D : CounterexampleData}
    (hM44 : D.IsM44) :
    (D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2)).card = 2 := by
  obtain ⟨hcard1, _hcard2⟩ := hM44
  set CP := D.packet.partition
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · have hC2 : CP.C2.card = 4 := by
      simpa [CP, SurplusCapPacket.oppCap1, hi] using hcard1
    simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, hi] using
      C2_sdiff_C1_union_C3_card_eq_two CP hC2
  · have hC3 : CP.C3.card = 4 := by
      simpa [CP, SurplusCapPacket.oppCap1, hi] using hcard1
    simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, hi, Finset.union_comm] using
      C3_sdiff_C1_union_C2_card_eq_two CP hC3
  · have hC1 : CP.C1.card = 4 := by
      simpa [CP, SurplusCapPacket.oppCap1, hi] using hcard1
    simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, hi, Finset.union_comm] using
      C1_sdiff_C2_union_C3_card_eq_two CP hC1

/-- The second non-surplus opposite cap has a two-point interior after removing
the two adjacent caps. -/
theorem oppApex2_interior_card_eq_two_of_isM44 {D : CounterexampleData}
    (hM44 : D.IsM44) :
    (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)).card = 2 := by
  obtain ⟨_hcard1, hcard2⟩ := hM44
  set CP := D.packet.partition
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · have hC3 : CP.C3.card = 4 := by
      simpa [CP, SurplusCapPacket.oppCap2, hi] using hcard2
    simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, hi] using
      C3_sdiff_C1_union_C2_card_eq_two CP hC3
  · have hC1 : CP.C1.card = 4 := by
      simpa [CP, SurplusCapPacket.oppCap2, hi] using hcard2
    simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, hi] using
      C1_sdiff_C2_union_C3_card_eq_two CP hC1
  · have hC2 : CP.C2.card = 4 := by
      simpa [CP, SurplusCapPacket.oppCap2, hi] using hcard2
    simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, hi, Finset.union_comm] using
      C2_sdiff_C1_union_C3_card_eq_two CP hC2

/-- Every exact-radius class at the first non-surplus apex is covered by the
two adjacent caps and the two-point interior of the opposite cap. -/
theorem oppApex1_exactRadiusClass_cover (D : CounterexampleData) (r : ℝ) :
    D.A.filter (fun x => dist x D.packet.oppApex1 = r) ⊆
      D.packet.surplusCap ∪ D.packet.oppCap2 ∪
        (D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2)) := by
  intro x hx
  have hxA : x ∈ D.A := (Finset.mem_filter.mp hx).1
  set CP := D.packet.partition
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, hi] using
      C2_cover_by_C1_C3_interior CP hxA
  · simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, hi, Finset.union_comm] using
      C3_cover_by_C1_C2_interior CP hxA
  · simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, hi, Finset.union_comm] using
      C1_cover_by_C2_C3_interior CP hxA

/-- Every exact-radius class at the second non-surplus apex is covered by the
two adjacent caps and the two-point interior of the opposite cap. -/
theorem oppApex2_exactRadiusClass_cover (D : CounterexampleData) (r : ℝ) :
    D.A.filter (fun x => dist x D.packet.oppApex2 = r) ⊆
      D.packet.surplusCap ∪ D.packet.oppCap1 ∪
        (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)) := by
  intro x hx
  have hxA : x ∈ D.A := (Finset.mem_filter.mp hx).1
  set CP := D.packet.partition
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, hi] using
      C3_cover_by_C1_C2_interior CP hxA
  · simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, hi] using
      C1_cover_by_C2_C3_interior CP hxA
  · simpa [CP, SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusCap, hi, Finset.union_comm] using
      C2_cover_by_C1_C3_interior CP hxA

/-- Cardinality core of the non-surplus squeeze.

If a four-or-more point class `T` is covered by three regions `A`, `B`, `I`,
the two adjacent regions contribute at most one point each, and the interior
region `I` has exactly two points, then the class has exactly four points and
contains all of `I`. -/
theorem fourClass_of_cover {α : Type _} [DecidableEq α] {T A B I : Finset α}
    (hcover : T ⊆ A ∪ B ∪ I)
    (hIcard : I.card = 2)
    (hA : (T ∩ A).card ≤ 1)
    (hB : (T ∩ B).card ≤ 1)
    (hT : 4 ≤ T.card) :
    T.card = 4 ∧ I ⊆ T ∧ (T ∩ A).card = 1 ∧ (T ∩ B).card = 1 := by
  have hdecomp : T = (T ∩ A) ∪ (T ∩ B) ∪ (T ∩ I) := by
    ext x
    constructor
    · intro hxT
      have hx := hcover hxT
      simp only [Finset.mem_union, Finset.mem_inter] at hx ⊢
      rcases hx with (hxA | hxB) | hxI
      · exact Or.inl (Or.inl ⟨hxT, hxA⟩)
      · exact Or.inl (Or.inr ⟨hxT, hxB⟩)
      · exact Or.inr ⟨hxT, hxI⟩
    · intro hx
      simp only [Finset.mem_union, Finset.mem_inter] at hx
      rcases hx with (hxA | hxB) | hxI
      · exact hxA.1
      · exact hxB.1
      · exact hxI.1
  have hT_le_sum :
      T.card ≤ (T ∩ A).card + (T ∩ B).card + (T ∩ I).card := by
    calc
      T.card = (((T ∩ A) ∪ (T ∩ B)) ∪ (T ∩ I)).card := by
            exact congrArg Finset.card hdecomp
      _ ≤ ((T ∩ A) ∪ (T ∩ B)).card + (T ∩ I).card :=
            Finset.card_union_le _ _
      _ ≤ ((T ∩ A).card + (T ∩ B).card) + (T ∩ I).card :=
            Nat.add_le_add_right (Finset.card_union_le _ _) _
      _ = (T ∩ A).card + (T ∩ B).card + (T ∩ I).card := by
            rw [Nat.add_assoc]
  have hIle : (T ∩ I).card ≤ 2 := by
    have hsub : T ∩ I ⊆ I := Finset.inter_subset_right
    have := Finset.card_le_card hsub
    omega
  have hTcard : T.card = 4 := by omega
  have hAcard : (T ∩ A).card = 1 := by omega
  have hBcard : (T ∩ B).card = 1 := by omega
  have hTIcard : (T ∩ I).card = I.card := by omega
  have hTI_eq : T ∩ I = I := by
    refine Finset.eq_of_subset_of_card_le Finset.inter_subset_right ?_
    omega
  have hI_sub : I ⊆ T := by
    intro x hxI
    have hxTI : x ∈ T ∩ I := by
      rw [hTI_eq]
      exact hxI
    exact (Finset.mem_inter.mp hxTI).1
  exact ⟨hTcard, hI_sub, hAcard, hBcard⟩

/-- Non-surplus squeeze for the first opposite apex, conditional on the two
adjacent one-hit bounds and the structural decomposition of `oppCap1` into its
two-point non-surplus interior plus the adjacent caps. -/
theorem oppApex1_of_adjacent_one_hits (D : CounterexampleData) (r : ℝ)
    (hcover :
      D.A.filter (fun x => dist x D.packet.oppApex1 = r) ⊆
        D.packet.surplusCap ∪ D.packet.oppCap2 ∪
          (D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hInterior :
      (D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2)).card = 2)
    (hSurplus :
      ((D.A.filter (fun x => dist x D.packet.oppApex1 = r)) ∩
          D.packet.surplusCap).card ≤ 1)
    (hOther :
      ((D.A.filter (fun x => dist x D.packet.oppApex1 = r)) ∩
          D.packet.oppCap2).card ≤ 1)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card) :
    (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card = 4 ∧
      D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2) ⊆
        D.A.filter (fun x => dist x D.packet.oppApex1 = r) ∧
      ((D.A.filter (fun x => dist x D.packet.oppApex1 = r)) ∩
          D.packet.surplusCap).card = 1 ∧
      ((D.A.filter (fun x => dist x D.packet.oppApex1 = r)) ∩
          D.packet.oppCap2).card = 1 := by
  exact fourClass_of_cover hcover hInterior hSurplus hOther hK4

/-- Non-surplus squeeze for the second opposite apex, conditional on the two
adjacent one-hit bounds and the structural decomposition of `oppCap2` into its
two-point non-surplus interior plus the adjacent caps. -/
theorem oppApex2_of_adjacent_one_hits (D : CounterexampleData) (r : ℝ)
    (hcover :
      D.A.filter (fun x => dist x D.packet.oppApex2 = r) ⊆
        D.packet.surplusCap ∪ D.packet.oppCap1 ∪
          (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)))
    (hInterior :
      (D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1)).card = 2)
    (hSurplus :
      ((D.A.filter (fun x => dist x D.packet.oppApex2 = r)) ∩
          D.packet.surplusCap).card ≤ 1)
    (hOther :
      ((D.A.filter (fun x => dist x D.packet.oppApex2 = r)) ∩
          D.packet.oppCap1).card ≤ 1)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card) :
    (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card = 4 ∧
      D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1) ⊆
        D.A.filter (fun x => dist x D.packet.oppApex2 = r) ∧
      ((D.A.filter (fun x => dist x D.packet.oppApex2 = r)) ∩
          D.packet.surplusCap).card = 1 ∧
      ((D.A.filter (fun x => dist x D.packet.oppApex2 = r)) ∩
          D.packet.oppCap1).card = 1 := by
  exact fourClass_of_cover hcover hInterior hSurplus hOther hK4

/-- Non-surplus squeeze for the first opposite apex.  After the structural
cover and two-point interior facts are discharged from `D.IsM44`, the only
remaining hypotheses are the two adjacent one-hit bounds and the K4 lower
bound for the selected radius class. -/
theorem oppApex1_of_isM44_adjacent_one_hits (D : CounterexampleData) (r : ℝ)
    (hM44 : D.IsM44)
    (hSurplus :
      ((D.A.filter (fun x => dist x D.packet.oppApex1 = r)) ∩
          D.packet.surplusCap).card ≤ 1)
    (hOther :
      ((D.A.filter (fun x => dist x D.packet.oppApex1 = r)) ∩
          D.packet.oppCap2).card ≤ 1)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card) :
    (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card = 4 ∧
      D.packet.oppCap1 \ (D.packet.surplusCap ∪ D.packet.oppCap2) ⊆
        D.A.filter (fun x => dist x D.packet.oppApex1 = r) ∧
      ((D.A.filter (fun x => dist x D.packet.oppApex1 = r)) ∩
          D.packet.surplusCap).card = 1 ∧
      ((D.A.filter (fun x => dist x D.packet.oppApex1 = r)) ∩
          D.packet.oppCap2).card = 1 := by
  exact oppApex1_of_adjacent_one_hits D r
    (oppApex1_exactRadiusClass_cover D r)
    (oppApex1_interior_card_eq_two_of_isM44 hM44)
    hSurplus hOther hK4

/-- Non-surplus squeeze for the second opposite apex.  After the structural
cover and two-point interior facts are discharged from `D.IsM44`, the only
remaining hypotheses are the two adjacent one-hit bounds and the K4 lower
bound for the selected radius class. -/
theorem oppApex2_of_isM44_adjacent_one_hits (D : CounterexampleData) (r : ℝ)
    (hM44 : D.IsM44)
    (hSurplus :
      ((D.A.filter (fun x => dist x D.packet.oppApex2 = r)) ∩
          D.packet.surplusCap).card ≤ 1)
    (hOther :
      ((D.A.filter (fun x => dist x D.packet.oppApex2 = r)) ∩
          D.packet.oppCap1).card ≤ 1)
    (hK4 : 4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card) :
    (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card = 4 ∧
      D.packet.oppCap2 \ (D.packet.surplusCap ∪ D.packet.oppCap1) ⊆
        D.A.filter (fun x => dist x D.packet.oppApex2 = r) ∧
      ((D.A.filter (fun x => dist x D.packet.oppApex2 = r)) ∩
          D.packet.surplusCap).card = 1 ∧
      ((D.A.filter (fun x => dist x D.packet.oppApex2 = r)) ∩
          D.packet.oppCap1).card = 1 := by
  exact oppApex2_of_adjacent_one_hits D r
    (oppApex2_exactRadiusClass_cover D r)
    (oppApex2_interior_card_eq_two_of_isM44 hM44)
    hSurplus hOther hK4

end U2NonSurplusSqueeze

/-- **U2FullDistanceClasses from cap-containment.**

Conditional reduction: in the `(m,4,4)` regime, if every equidistance
class at `oppApex1` (resp. `oppApex2`) of size ≥ 4 is already contained
in `oppCap1` (resp. `oppCap2`), then `U2FullDistanceClasses D` holds.

The cap-containment hypotheses are the open reverse-inclusion obligations
left over from U1.3.  They are required only under the same `D.IsM44`
hypothesis that `U2FullDistanceClasses D` itself assumes. -/
theorem u2FullDistanceClasses_of_capContainment (D : CounterexampleData)
    (hcont1 : D.IsM44 → ∀ r : ℝ, 0 < r →
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex1 = r)).card →
        D.A.filter (fun x => dist x D.packet.oppApex1 = r) ⊆ D.packet.oppCap1)
    (hcont2 : D.IsM44 → ∀ r : ℝ, 0 < r →
        4 ≤ (D.A.filter (fun x => dist x D.packet.oppApex2 = r)).card →
        D.A.filter (fun x => dist x D.packet.oppApex2 = r) ⊆ D.packet.oppCap2) :
    U2FullDistanceClasses D := by
  -- Unfold the goal: given IsM44, produce d > 0 with both cap-equalities.
  intro hM44
  have hM44_for_cont : D.IsM44 := hM44
  -- Extract cap-size bounds from IsM44.
  obtain ⟨hcard1, hcard2⟩ := hM44
  set CP := D.packet.partition
  -- Step 1: Moser-vertex membership in D.A.
  -- oppApex1 ∈ D.A: oppApex1 is a Moser-triangle vertex; every Moser vertex
  -- lies in at least one cap, and every cap is a subset of A.
  have ha1_mem : D.packet.oppApex1 ∈ D.A := by
    rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
    interval_cases i
    · -- surplusIdx = 0: oppApex1 = v2; v2 ∈ C1 ⊆ A.
      simp only [SurplusCapPacket.oppApex1, hi]
      exact CP.C1_subset CP.v2_mem_C1
    · -- surplusIdx = 1: oppApex1 = v3; v3 ∈ C1 ⊆ A.
      simp only [SurplusCapPacket.oppApex1, hi]
      exact CP.C1_subset CP.v3_mem_C1
    · -- surplusIdx = 2: oppApex1 = v1; v1 ∈ C2 ⊆ A.
      simp only [SurplusCapPacket.oppApex1, hi]
      exact CP.C2_subset CP.v1_mem_C2
  have ha2_mem : D.packet.oppApex2 ∈ D.A := by
    rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
    interval_cases i
    · -- surplusIdx = 0: oppApex2 = v3; v3 ∈ C1 ⊆ A.
      simp only [SurplusCapPacket.oppApex2, hi]
      exact CP.C1_subset CP.v3_mem_C1
    · -- surplusIdx = 1: oppApex2 = v1; v1 ∈ C2 ⊆ A.
      simp only [SurplusCapPacket.oppApex2, hi]
      exact CP.C2_subset CP.v1_mem_C2
    · -- surplusIdx = 2: oppApex2 = v2; v2 ∈ C1 ⊆ A.
      simp only [SurplusCapPacket.oppApex2, hi]
      exact CP.C1_subset CP.v2_mem_C1
  -- Step 2: get the K4 radius at oppApex1.
  -- K4 at oppApex1: ∃ r > 0, (A.filter fun q => dist oppApex1 q = r).card ≥ 4
  obtain ⟨r₁, hr₁_pos, hr₁_card⟩ := D.K4 D.packet.oppApex1 ha1_mem
  -- Rewrite: swap dist order in filter to match U2FullDistanceClasses.
  rw [filter_dist_comm] at hr₁_card
  -- Step 3: squeeze oppCap1.
  set T₁ := D.A.filter (fun x => dist x D.packet.oppApex1 = r₁) with hT₁_def
  have hT₁_sub : T₁ ⊆ D.packet.oppCap1 :=
    hcont1 hM44_for_cont r₁ hr₁_pos hr₁_card
  -- |T₁| ≥ 4 and |oppCap1| = 4 and T₁ ⊆ oppCap1 → T₁ = oppCap1.
  have hT₁_card : T₁.card = 4 :=
    Nat.le_antisymm (hcard1 ▸ Finset.card_le_card hT₁_sub) hr₁_card
  have hT₁_eq : T₁ = D.packet.oppCap1 :=
    Finset.eq_of_subset_of_card_le hT₁_sub (by omega)
  -- Step 4: get the K4 radius at oppApex2.
  obtain ⟨r₂, hr₂_pos, hr₂_card⟩ := D.K4 D.packet.oppApex2 ha2_mem
  rw [filter_dist_comm] at hr₂_card
  -- Step 5: squeeze oppCap2.
  set T₂ := D.A.filter (fun x => dist x D.packet.oppApex2 = r₂) with hT₂_def
  have hT₂_sub : T₂ ⊆ D.packet.oppCap2 :=
    hcont2 hM44_for_cont r₂ hr₂_pos hr₂_card
  have hT₂_eq : T₂ = D.packet.oppCap2 :=
    Finset.eq_of_subset_of_card_le hT₂_sub (by omega)
  -- Step 6: show r₁ = r₂ via cross-memberships.
  -- Cross-membership: oppApex2 ∈ oppCap1.
  have ha2_in_opp1 : D.packet.oppApex2 ∈ D.packet.oppCap1 := by
    rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
    interval_cases i
    · -- surplusIdx = 0: oppCap1 = C2, oppApex2 = v3 → v3_mem_C2.
      simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppApex2, hi]
      exact CP.v3_mem_C2
    · -- surplusIdx = 1: oppCap1 = C3, oppApex2 = v1 → v1_mem_C3.
      simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppApex2, hi]
      exact CP.v1_mem_C3
    · -- surplusIdx = 2: oppCap1 = C1, oppApex2 = v2 → v2_mem_C1.
      simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppApex2, hi]
      exact CP.v2_mem_C1
  -- Cross-membership: oppApex1 ∈ oppCap2.
  have ha1_in_opp2 : D.packet.oppApex1 ∈ D.packet.oppCap2 := by
    rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
    interval_cases i
    · -- surplusIdx = 0: oppCap2 = C3, oppApex1 = v2 → v2_mem_C3.
      simp only [SurplusCapPacket.oppCap2, SurplusCapPacket.oppApex1, hi]
      exact CP.v2_mem_C3
    · -- surplusIdx = 1: oppCap2 = C1, oppApex1 = v3 → v3_mem_C1.
      simp only [SurplusCapPacket.oppCap2, SurplusCapPacket.oppApex1, hi]
      exact CP.v3_mem_C1
    · -- surplusIdx = 2: oppCap2 = C2, oppApex1 = v1 → v1_mem_C2.
      simp only [SurplusCapPacket.oppCap2, SurplusCapPacket.oppApex1, hi]
      exact CP.v1_mem_C2
  -- oppApex2 ∈ T₁ (since T₁ = oppCap1).
  have ha2_in_T₁ : D.packet.oppApex2 ∈ T₁ := hT₁_eq.symm ▸ ha2_in_opp1
  -- T₁ = A.filter (fun x => dist x oppApex1 = r₁), so dist oppApex2 oppApex1 = r₁.
  have hdist_a2_a1 : dist D.packet.oppApex2 D.packet.oppApex1 = r₁ :=
    (Finset.mem_filter.mp ha2_in_T₁).2
  -- oppApex1 ∈ T₂ (since T₂ = oppCap2).
  have ha1_in_T₂ : D.packet.oppApex1 ∈ T₂ := hT₂_eq.symm ▸ ha1_in_opp2
  -- dist oppApex1 oppApex2 = r₂.
  have hdist_a1_a2 : dist D.packet.oppApex1 D.packet.oppApex2 = r₂ :=
    (Finset.mem_filter.mp ha1_in_T₂).2
  -- r₁ = r₂: dist_comm gives dist oppApex2 oppApex1 = dist oppApex1 oppApex2.
  have hrr : r₁ = r₂ := by linarith [dist_comm D.packet.oppApex2 D.packet.oppApex1]
  -- Step 7: conclude U2FullDistanceClasses.
  -- Use d := r₁; both cap-equalities follow from hT₁_eq, hT₂_eq, hrr.
  refine ⟨r₁, hr₁_pos, hT₁_eq, ?_⟩
  -- For oppCap2: need A.filter (fun x => dist x oppApex2 = r₁) = oppCap2.
  -- T₂ = A.filter (fun x => dist x oppApex2 = r₂) = oppCap2, and r₁ = r₂.
  -- Rewrite r₁ in the filter to r₂ using hrr, then apply hT₂_eq.
  have : D.A.filter (fun x => dist x D.packet.oppApex2 = r₁) = T₂ := by
    simp only [hT₂_def, hrr]
  rw [this]
  exact hT₂_eq

end Problem97
