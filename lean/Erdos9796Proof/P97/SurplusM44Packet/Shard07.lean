/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusM44Packet.Shard01
import Erdos9796Proof.P97.SurplusM44Packet.Shard03
import Erdos9796Proof.P97.SurplusM44Packet.Shard05

/-!
# `SurplusM44Packet` shard 07 (lines 8636-10057 of the original monolith)

Mechanical split of `SurplusM44Packet.lean`; body text is verbatim.
First decl:
`IsM44.left_row0031_selectedClass_eq_oppInterior1_singleton_surplusTriple`.
Last decl:
`leftOneSidedErasedPayload_of_oppIndex2_surplus_mem`.
The aggregator module `Erdos9796Proof.P97.SurplusM44Packet` re-exports every shard, so
downstream imports are unchanged.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace SurplusCapPacket

/-- The left non-surplus finite row `(0,0,3,1)` names the selected class as
one point from the other non-surplus interior pair together with the named
three-point surplus subpacket. -/
theorem IsM44.left_row0031_selectedClass_eq_oppInterior1_singleton_surplusTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 3)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 1)
    {s1 s2 s3 : ℝ²}
    (hLtriple : SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2)
    (hs13 : s1 ≠ s3)
    (hs23 : s2 ≠ s3) :
    ∃ q : ℝ²,
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2 =
        ({q} : Finset ℝ²) ∧
      q ∈ S.oppInterior1 ∧
      SelectedClass A center radius =
        ({q, s1, s2, s3} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex2).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex2
  have hMcard : M.card = 0 := by
    simpa [M, moserCount] using hm
  have hMeq : M = ∅ := Finset.card_eq_zero.mp hMcard
  have hCcard : C.card = 0 := by
    simpa [C, sameCapCount] using hs
  have hCeq : C = ∅ := Finset.card_eq_zero.mp hCcard
  have hRcard : R.card = 1 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨q, hReq⟩ := Finset.card_eq_one.mp hRcard
  have hqOpp : q ∈ S.oppInterior1 := by
    have hqR : q ∈ R := by
      rw [hReq]
      simp
    have hqRight := (Finset.mem_inter.mp hqR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1]
      using hqRight
  have hLcard : L.card = 3 := by
    simpa [L, leftAdjCount] using hl
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  have hTriple_le : ({s1, s2, s3} : Finset ℝ²).card ≤ L.card := by
    rw [hTripleCard, hLcard]
  have hLeqTriple : L = ({s1, s2, s3} : Finset ℝ²) :=
    Finset.eq_of_subset_of_card_le hLtriple hTriple_le
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex2
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q, s1, s2, s3} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeqTriple, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hqSel : q ∈ SelectedClass A center radius := by
    have hqR : q ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hqR).1
  have hs1Sel : s1 ∈ SelectedClass A center radius := by
    have hs1L : s1 ∈ L := by
      rw [hLeqTriple]
      simp
    exact (Finset.mem_inter.mp hs1L).1
  have hs2Sel : s2 ∈ SelectedClass A center radius := by
    have hs2L : s2 ∈ L := by
      rw [hLeqTriple]
      simp
    exact (Finset.mem_inter.mp hs2L).1
  have hs3Sel : s3 ∈ SelectedClass A center radius := by
    have hs3L : s3 ∈ L := by
      rw [hLeqTriple]
      simp
    exact (Finset.mem_inter.mp hs3L).1
  have hselSuperset :
      ({q, s1, s2, s3} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hqSel
    · exact hs1Sel
    · exact hs2Sel
    · exact hs3Sel
  exact ⟨q, hReq, hqOpp, Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The left non-surplus finite row `(0,1,3,0)` names the selected class as
the same-cap singleton together with the named three-point surplus subpacket.
-/
theorem IsM44.left_row0130_selectedClass_eq_sameCap_surplusTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex2 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 3)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 0)
    {s1 s2 s3 : ℝ²}
    (hLtriple : SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2)
    (hs13 : s1 ≠ s3)
    (hs23 : s2 ≠ s3) :
    ∃ c : ℝ²,
      SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex2).erase center =
        ({c} : Finset ℝ²) ∧
      SelectedClass A center radius =
        ({c, s1, s2, s3} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex2).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex2
  have hMcard : M.card = 0 := by
    simpa [M, moserCount] using hm
  have hMeq : M = ∅ := Finset.card_eq_zero.mp hMcard
  have hCcard : C.card = 1 := by
    simpa [C, sameCapCount] using hs
  obtain ⟨c, hCeq⟩ := Finset.card_eq_one.mp hCcard
  have hLcard : L.card = 3 := by
    simpa [L, leftAdjCount] using hl
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  have hTriple_le : ({s1, s2, s3} : Finset ℝ²).card ≤ L.card := by
    rw [hTripleCard, hLcard]
  have hLeqTriple : L = ({s1, s2, s3} : Finset ℝ²) :=
    Finset.eq_of_subset_of_card_le hLtriple hTriple_le
  have hRcard : R.card = 0 := by
    simpa [R, rightAdjCount] using hr
  have hReq : R = ∅ := Finset.card_eq_zero.mp hRcard
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex2
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({c, s1, s2, s3} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeqTriple, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hcSel : c ∈ SelectedClass A center radius := by
    have hcC : c ∈ C := by
      rw [hCeq]
      simp
    exact (Finset.mem_inter.mp hcC).1
  have hs1Sel : s1 ∈ SelectedClass A center radius := by
    have hs1L : s1 ∈ L := by
      rw [hLeqTriple]
      simp
    exact (Finset.mem_inter.mp hs1L).1
  have hs2Sel : s2 ∈ SelectedClass A center radius := by
    have hs2L : s2 ∈ L := by
      rw [hLeqTriple]
      simp
    exact (Finset.mem_inter.mp hs2L).1
  have hs3Sel : s3 ∈ SelectedClass A center radius := by
    have hs3L : s3 ∈ L := by
      rw [hLeqTriple]
      simp
    exact (Finset.mem_inter.mp hs3L).1
  have hselSuperset :
      ({c, s1, s2, s3} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hcSel
    · exact hs1Sel
    · exact hs2Sel
    · exact hs3Sel
  exact ⟨c, hCeq, Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The left non-surplus finite row `(1,0,3,0)` names the selected class as
one Moser vertex together with the named three-point surplus subpacket. -/
theorem IsM44.left_row1030_selectedClass_eq_moser_surplusTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 3)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 0)
    {s1 s2 s3 : ℝ²}
    (hLtriple : SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex S.oppIndex2 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2)
    (hs13 : s1 ≠ s3)
    (hs23 : s2 ≠ s3) :
    ∃ m : ℝ²,
      SelectedClass A center radius ∩ S.triangle.verts =
        ({m} : Finset ℝ²) ∧
      m ∈ S.triangle.verts ∧
      SelectedClass A center radius =
        ({m, s1, s2, s3} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex2).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex2
  have hMcard : M.card = 1 := by
    simpa [M, moserCount] using hm
  obtain ⟨m, hMeq⟩ := Finset.card_eq_one.mp hMcard
  have hmVerts : m ∈ S.triangle.verts := by
    have hmM : m ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hmM).2
  have hCcard : C.card = 0 := by
    simpa [C, sameCapCount] using hs
  have hCeq : C = ∅ := Finset.card_eq_zero.mp hCcard
  have hLcard : L.card = 3 := by
    simpa [L, leftAdjCount] using hl
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  have hTriple_le : ({s1, s2, s3} : Finset ℝ²).card ≤ L.card := by
    rw [hTripleCard, hLcard]
  have hLeqTriple : L = ({s1, s2, s3} : Finset ℝ²) :=
    Finset.eq_of_subset_of_card_le hLtriple hTriple_le
  have hRcard : R.card = 0 := by
    simpa [R, rightAdjCount] using hr
  have hReq : R = ∅ := Finset.card_eq_zero.mp hRcard
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex2
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({m, s1, s2, s3} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeqTriple, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hmSel : m ∈ SelectedClass A center radius := by
    have hmM : m ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hmM).1
  have hs1Sel : s1 ∈ SelectedClass A center radius := by
    have hs1L : s1 ∈ L := by
      rw [hLeqTriple]
      simp
    exact (Finset.mem_inter.mp hs1L).1
  have hs2Sel : s2 ∈ SelectedClass A center radius := by
    have hs2L : s2 ∈ L := by
      rw [hLeqTriple]
      simp
    exact (Finset.mem_inter.mp hs2L).1
  have hs3Sel : s3 ∈ SelectedClass A center radius := by
    have hs3L : s3 ∈ L := by
      rw [hLeqTriple]
      simp
    exact (Finset.mem_inter.mp hs3L).1
  have hselSuperset :
      ({m, s1, s2, s3} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hmSel
    · exact hs1Sel
    · exact hs2Sel
    · exact hs3Sel
  exact ⟨m, hMeq, hmVerts,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The left non-surplus finite row `(0,0,2,2)` names the selected class as
the other non-surplus interior pair together with two surplus-interior points.
-/
theorem IsM44.left_row0022_selectedClass_eq_oppInterior1_union_surplusPair
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 2)
    {q₁ q₂ : ℝ²}
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²)) :
    ∃ l₁ l₂ : ℝ²,
      l₁ ≠ l₂ ∧
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2 =
        ({l₁, l₂} : Finset ℝ²) ∧
      ({l₁, l₂} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q₁, q₂, l₁, l₂} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex2).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex2
  have hMcard : M.card = 0 := by
    simpa [M, moserCount] using hm
  have hMeq : M = ∅ := Finset.card_eq_zero.mp hMcard
  have hCcard : C.card = 0 := by
    simpa [C, sameCapCount] using hs
  have hCeq : C = ∅ := Finset.card_eq_zero.mp hCcard
  have hRcard : R.card = 2 := by
    simpa [R, rightAdjCount] using hr
  have hRsub : R ⊆ S.oppInterior1 := by
    intro y hy
    have hy' := (Finset.mem_inter.mp hy).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1] using hy'
  have hRcard_le : S.oppInterior1.card ≤ R.card := by
    rw [hRcard, hM44.oppInterior1_card_eq_two]
  have hReqOpp : R = S.oppInterior1 :=
    Finset.eq_of_subset_of_card_le hRsub hRcard_le
  have hReq : R = ({q₁, q₂} : Finset ℝ²) := by
    rw [hReqOpp, hqpair]
  have hLcard : L.card = 2 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨l₁, l₂, hl12, hLeq⟩ := Finset.card_eq_two.mp hLcard
  have hLsub : ({l₁, l₂} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyL : y ∈ L := by
      rw [hLeq]
      exact hy
    have hyLeft := (Finset.mem_inter.mp hyL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hyLeft
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex2 hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q₁, q₂, l₁, l₂} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hq₁Sel : q₁ ∈ SelectedClass A center radius := by
    have hq₁R : q₁ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hq₁R).1
  have hq₂Sel : q₂ ∈ SelectedClass A center radius := by
    have hq₂R : q₂ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hq₂R).1
  have hl₁Sel : l₁ ∈ SelectedClass A center radius := by
    have hl₁L : l₁ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hl₁L).1
  have hl₂Sel : l₂ ∈ SelectedClass A center radius := by
    have hl₂L : l₂ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hl₂L).1
  have hselSuperset :
      ({q₁, q₂, l₁, l₂} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hq₁Sel
    · exact hq₂Sel
    · exact hl₁Sel
    · exact hl₂Sel
  exact ⟨l₁, l₂, hl12, hLeq, hLsub,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The left non-surplus finite row `(0,1,1,2)` names the selected class as
the other non-surplus interior pair, the same-cap singleton, and one
surplus-interior point. -/
theorem IsM44.left_row0112_selectedClass_eq_oppInterior1_union_sameCap_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex2 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 2)
    {q₁ q₂ : ℝ²}
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²)) :
    ∃ c l : ℝ²,
      SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex2).erase center =
        ({c} : Finset ℝ²) ∧
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2 =
        ({l} : Finset ℝ²) ∧
      l ∈ S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q₁, q₂, c, l} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex2).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex2
  have hMcard : M.card = 0 := by
    simpa [M, moserCount] using hm
  have hMeq : M = ∅ := Finset.card_eq_zero.mp hMcard
  have hCcard : C.card = 1 := by
    simpa [C, sameCapCount] using hs
  obtain ⟨c, hCeq⟩ := Finset.card_eq_one.mp hCcard
  have hRcard : R.card = 2 := by
    simpa [R, rightAdjCount] using hr
  have hRsub : R ⊆ S.oppInterior1 := by
    intro y hy
    have hy' := (Finset.mem_inter.mp hy).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1] using hy'
  have hRcard_le : S.oppInterior1.card ≤ R.card := by
    rw [hRcard, hM44.oppInterior1_card_eq_two]
  have hReqOpp : R = S.oppInterior1 :=
    Finset.eq_of_subset_of_card_le hRsub hRcard_le
  have hReq : R = ({q₁, q₂} : Finset ℝ²) := by
    rw [hReqOpp, hqpair]
  have hLcard : L.card = 1 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨l, hLeq⟩ := Finset.card_eq_one.mp hLcard
  have hlSurplus : l ∈ S.capInteriorByIndex S.surplusIdx := by
    have hlL : l ∈ L := by
      rw [hLeq]
      simp
    have hlLeft := (Finset.mem_inter.mp hlL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hlLeft
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex2
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q₁, q₂, c, l} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hq₁Sel : q₁ ∈ SelectedClass A center radius := by
    have hq₁R : q₁ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hq₁R).1
  have hq₂Sel : q₂ ∈ SelectedClass A center radius := by
    have hq₂R : q₂ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hq₂R).1
  have hcSel : c ∈ SelectedClass A center radius := by
    have hcC : c ∈ C := by
      rw [hCeq]
      simp
    exact (Finset.mem_inter.mp hcC).1
  have hlSel : l ∈ SelectedClass A center radius := by
    have hlL : l ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hlL).1
  have hselSuperset :
      ({q₁, q₂, c, l} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hq₁Sel
    · exact hq₂Sel
    · exact hcSel
    · exact hlSel
  exact ⟨c, l, hCeq, hLeq, hlSurplus,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The left non-surplus finite row `(0,1,2,1)` names the selected class as
one point from the other non-surplus interior pair, the same-cap singleton,
and two surplus-interior points. -/
theorem IsM44.left_row0121_selectedClass_eq_oppInterior1_singleton_sameCap_surplusPair
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex2 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 1) :
    ∃ q c l₁ l₂ : ℝ²,
      l₁ ≠ l₂ ∧
      SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex2).erase center =
        ({c} : Finset ℝ²) ∧
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2 =
        ({q} : Finset ℝ²) ∧
      q ∈ S.oppInterior1 ∧
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2 =
        ({l₁, l₂} : Finset ℝ²) ∧
      ({l₁, l₂} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q, c, l₁, l₂} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex2).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex2
  have hMcard : M.card = 0 := by
    simpa [M, moserCount] using hm
  have hMeq : M = ∅ := Finset.card_eq_zero.mp hMcard
  have hCcard : C.card = 1 := by
    simpa [C, sameCapCount] using hs
  obtain ⟨c, hCeq⟩ := Finset.card_eq_one.mp hCcard
  have hRcard : R.card = 1 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨q, hReq⟩ := Finset.card_eq_one.mp hRcard
  have hqOpp : q ∈ S.oppInterior1 := by
    have hqR : q ∈ R := by
      rw [hReq]
      simp
    have hqRight := (Finset.mem_inter.mp hqR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1]
      using hqRight
  have hLcard : L.card = 2 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨l₁, l₂, hl12, hLeq⟩ := Finset.card_eq_two.mp hLcard
  have hLsub : ({l₁, l₂} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyL : y ∈ L := by
      rw [hLeq]
      exact hy
    have hyLeft := (Finset.mem_inter.mp hyL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hyLeft
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex2
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q, c, l₁, l₂} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hqSel : q ∈ SelectedClass A center radius := by
    have hqR : q ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hqR).1
  have hcSel : c ∈ SelectedClass A center radius := by
    have hcC : c ∈ C := by
      rw [hCeq]
      simp
    exact (Finset.mem_inter.mp hcC).1
  have hl₁Sel : l₁ ∈ SelectedClass A center radius := by
    have hl₁L : l₁ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hl₁L).1
  have hl₂Sel : l₂ ∈ SelectedClass A center radius := by
    have hl₂L : l₂ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hl₂L).1
  have hselSuperset :
      ({q, c, l₁, l₂} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hqSel
    · exact hcSel
    · exact hl₁Sel
    · exact hl₂Sel
  exact ⟨q, c, l₁, l₂, hl12, hCeq, hReq, hqOpp, hLeq, hLsub,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The left non-surplus finite row `(1,0,2,1)` names the selected class as
one point from the other non-surplus interior pair, one Moser vertex, and two
surplus-interior points. -/
theorem IsM44.left_row1021_selectedClass_eq_moser_oppInterior1_singleton_surplusPair
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 1) :
    ∃ q m l₁ l₂ : ℝ²,
      l₁ ≠ l₂ ∧
      SelectedClass A center radius ∩ S.triangle.verts =
        ({m} : Finset ℝ²) ∧
      m ∈ S.triangle.verts ∧
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2 =
        ({q} : Finset ℝ²) ∧
      q ∈ S.oppInterior1 ∧
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2 =
        ({l₁, l₂} : Finset ℝ²) ∧
      ({l₁, l₂} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q, m, l₁, l₂} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex2).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex2
  have hMcard : M.card = 1 := by
    simpa [M, moserCount] using hm
  obtain ⟨m, hMeq⟩ := Finset.card_eq_one.mp hMcard
  have hmVerts : m ∈ S.triangle.verts := by
    have hmM : m ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hmM).2
  have hCcard : C.card = 0 := by
    simpa [C, sameCapCount] using hs
  have hCeq : C = ∅ := Finset.card_eq_zero.mp hCcard
  have hRcard : R.card = 1 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨q, hReq⟩ := Finset.card_eq_one.mp hRcard
  have hqOpp : q ∈ S.oppInterior1 := by
    have hqR : q ∈ R := by
      rw [hReq]
      simp
    have hqRight := (Finset.mem_inter.mp hqR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1]
      using hqRight
  have hLcard : L.card = 2 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨l₁, l₂, hl12, hLeq⟩ := Finset.card_eq_two.mp hLcard
  have hLsub : ({l₁, l₂} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyL : y ∈ L := by
      rw [hLeq]
      exact hy
    have hyLeft := (Finset.mem_inter.mp hyL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hyLeft
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex2
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q, m, l₁, l₂} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hqSel : q ∈ SelectedClass A center radius := by
    have hqR : q ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hqR).1
  have hmSel : m ∈ SelectedClass A center radius := by
    have hmM : m ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hmM).1
  have hl₁Sel : l₁ ∈ SelectedClass A center radius := by
    have hl₁L : l₁ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hl₁L).1
  have hl₂Sel : l₂ ∈ SelectedClass A center radius := by
    have hl₂L : l₂ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hl₂L).1
  have hselSuperset :
      ({q, m, l₁, l₂} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hqSel
    · exact hmSel
    · exact hl₁Sel
    · exact hl₂Sel
  exact ⟨q, m, l₁, l₂, hl12, hMeq, hmVerts, hReq, hqOpp, hLeq, hLsub,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The left non-surplus finite row `(1,1,1,1)` names the selected class as
one point from the other non-surplus interior pair, the same-cap singleton,
one Moser vertex, and one surplus-interior point. -/
theorem IsM44.left_row1111_selectedClass_eq_moser_sameCap_oppInterior1_singleton_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex2 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 1) :
    ∃ q c m l : ℝ²,
      SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex2).erase center =
        ({c} : Finset ℝ²) ∧
      SelectedClass A center radius ∩ S.triangle.verts =
        ({m} : Finset ℝ²) ∧
      m ∈ S.triangle.verts ∧
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2 =
        ({q} : Finset ℝ²) ∧
      q ∈ S.oppInterior1 ∧
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2 =
        ({l} : Finset ℝ²) ∧
      l ∈ S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q, c, m, l} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex2).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex2
  have hMcard : M.card = 1 := by
    simpa [M, moserCount] using hm
  obtain ⟨m, hMeq⟩ := Finset.card_eq_one.mp hMcard
  have hmVerts : m ∈ S.triangle.verts := by
    have hmM : m ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hmM).2
  have hCcard : C.card = 1 := by
    simpa [C, sameCapCount] using hs
  obtain ⟨c, hCeq⟩ := Finset.card_eq_one.mp hCcard
  have hRcard : R.card = 1 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨q, hReq⟩ := Finset.card_eq_one.mp hRcard
  have hqOpp : q ∈ S.oppInterior1 := by
    have hqR : q ∈ R := by
      rw [hReq]
      simp
    have hqRight := (Finset.mem_inter.mp hqR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1]
      using hqRight
  have hLcard : L.card = 1 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨l, hLeq⟩ := Finset.card_eq_one.mp hLcard
  have hlSurplus : l ∈ S.capInteriorByIndex S.surplusIdx := by
    have hlL : l ∈ L := by
      rw [hLeq]
      simp
    have hlLeft := (Finset.mem_inter.mp hlL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hlLeft
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex2
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q, c, m, l} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hqSel : q ∈ SelectedClass A center radius := by
    have hqR : q ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hqR).1
  have hcSel : c ∈ SelectedClass A center radius := by
    have hcC : c ∈ C := by
      rw [hCeq]
      simp
    exact (Finset.mem_inter.mp hcC).1
  have hmSel : m ∈ SelectedClass A center radius := by
    have hmM : m ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hmM).1
  have hlSel : l ∈ SelectedClass A center radius := by
    have hlL : l ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hlL).1
  have hselSuperset :
      ({q, c, m, l} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hqSel
    · exact hcSel
    · exact hmSel
    · exact hlSel
  exact ⟨q, c, m, l, hCeq, hMeq, hmVerts, hReq, hqOpp, hLeq, hlSurplus,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The left non-surplus finite row `(1,1,2,0)` names the selected class as
the same-cap singleton, one Moser vertex, and two surplus-interior points. -/
theorem IsM44.left_row1120_selectedClass_eq_moser_sameCap_surplusPair
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex2 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 0) :
    ∃ c m l₁ l₂ : ℝ²,
      l₁ ≠ l₂ ∧
      SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex2).erase center =
        ({c} : Finset ℝ²) ∧
      SelectedClass A center radius ∩ S.triangle.verts =
        ({m} : Finset ℝ²) ∧
      m ∈ S.triangle.verts ∧
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2 =
        ({l₁, l₂} : Finset ℝ²) ∧
      ({l₁, l₂} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({c, m, l₁, l₂} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex2).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex2
  have hMcard : M.card = 1 := by
    simpa [M, moserCount] using hm
  obtain ⟨m, hMeq⟩ := Finset.card_eq_one.mp hMcard
  have hmVerts : m ∈ S.triangle.verts := by
    have hmM : m ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hmM).2
  have hCcard : C.card = 1 := by
    simpa [C, sameCapCount] using hs
  obtain ⟨c, hCeq⟩ := Finset.card_eq_one.mp hCcard
  have hLcard : L.card = 2 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨l₁, l₂, hl12, hLeq⟩ := Finset.card_eq_two.mp hLcard
  have hLsub : ({l₁, l₂} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyL : y ∈ L := by
      rw [hLeq]
      exact hy
    have hyLeft := (Finset.mem_inter.mp hyL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hyLeft
  have hRcard : R.card = 0 := by
    simpa [R, rightAdjCount] using hr
  have hReq : R = ∅ := Finset.card_eq_zero.mp hRcard
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex2
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({c, m, l₁, l₂} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hcSel : c ∈ SelectedClass A center radius := by
    have hcC : c ∈ C := by
      rw [hCeq]
      simp
    exact (Finset.mem_inter.mp hcC).1
  have hmSel : m ∈ SelectedClass A center radius := by
    have hmM : m ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hmM).1
  have hl₁Sel : l₁ ∈ SelectedClass A center radius := by
    have hl₁L : l₁ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hl₁L).1
  have hl₂Sel : l₂ ∈ SelectedClass A center radius := by
    have hl₂L : l₂ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hl₂L).1
  have hselSuperset :
      ({c, m, l₁, l₂} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hcSel
    · exact hmSel
    · exact hl₁Sel
    · exact hl₂Sel
  exact ⟨c, m, l₁, l₂, hl12, hCeq, hMeq, hmVerts, hLeq, hLsub,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The left non-surplus finite row `(1,0,1,2)` names the selected class as
one Moser vertex, the other non-surplus interior pair, and one
surplus-interior point. -/
theorem IsM44.left_row1012_selectedClass_eq_moser_oppInterior1_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 2)
    {q₁ q₂ : ℝ²}
    (hqpair : S.oppInterior1 = ({q₁, q₂} : Finset ℝ²)) :
    ∃ m l : ℝ²,
      SelectedClass A center radius ∩ S.triangle.verts =
        ({m} : Finset ℝ²) ∧
      m ∈ S.triangle.verts ∧
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2 =
        ({l} : Finset ℝ²) ∧
      l ∈ S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q₁, q₂, m, l} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex2).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex2
  have hMcard : M.card = 1 := by
    simpa [M, moserCount] using hm
  obtain ⟨m, hMeq⟩ := Finset.card_eq_one.mp hMcard
  have hmVerts : m ∈ S.triangle.verts := by
    have hmM : m ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hmM).2
  have hCcard : C.card = 0 := by
    simpa [C, sameCapCount] using hs
  have hCeq : C = ∅ := Finset.card_eq_zero.mp hCcard
  have hRcard : R.card = 2 := by
    simpa [R, rightAdjCount] using hr
  have hRsub : R ⊆ S.oppInterior1 := by
    intro y hy
    have hy' := (Finset.mem_inter.mp hy).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1] using hy'
  have hRcard_le : S.oppInterior1.card ≤ R.card := by
    rw [hRcard, hM44.oppInterior1_card_eq_two]
  have hReqOpp : R = S.oppInterior1 :=
    Finset.eq_of_subset_of_card_le hRsub hRcard_le
  have hReq : R = ({q₁, q₂} : Finset ℝ²) := by
    rw [hReqOpp, hqpair]
  have hLcard : L.card = 1 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨l, hLeq⟩ := Finset.card_eq_one.mp hLcard
  have hlSurplus : l ∈ S.capInteriorByIndex S.surplusIdx := by
    have hlL : l ∈ L := by
      rw [hLeq]
      simp
    have hlLeft := (Finset.mem_inter.mp hlL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hlLeft
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex2
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q₁, q₂, m, l} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hq₁Sel : q₁ ∈ SelectedClass A center radius := by
    have hq₁R : q₁ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hq₁R).1
  have hq₂Sel : q₂ ∈ SelectedClass A center radius := by
    have hq₂R : q₂ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hq₂R).1
  have hmSel : m ∈ SelectedClass A center radius := by
    have hmM : m ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hmM).1
  have hlSel : l ∈ SelectedClass A center radius := by
    have hlL : l ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hlL).1
  have hselSuperset :
      ({q₁, q₂, m, l} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hq₁Sel
    · exact hq₂Sel
    · exact hmSel
    · exact hlSel
  exact ⟨m, l, hMeq, hmVerts, hLeq, hlSurplus,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The left non-surplus finite row `(2,0,1,1)` names the selected class as
two Moser vertices, one point in the other non-surplus interior pair, and one
surplus-interior point. -/
theorem IsM44.left_row2011_selectedClass_eq_moserPair_oppInterior1_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 2)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 1) :
    ∃ m₁ m₂ q l : ℝ²,
      m₁ ≠ m₂ ∧
      SelectedClass A center radius ∩ S.triangle.verts =
        ({m₁, m₂} : Finset ℝ²) ∧
      m₁ ∈ S.triangle.verts ∧
      m₂ ∈ S.triangle.verts ∧
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2 =
        ({q} : Finset ℝ²) ∧
      q ∈ S.oppInterior1 ∧
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2 =
        ({l} : Finset ℝ²) ∧
      l ∈ S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q, m₁, m₂, l} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex2).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex2
  have hMcard : M.card = 2 := by
    simpa [M, moserCount] using hm
  obtain ⟨m₁, m₂, hm₁₂, hMeq⟩ := Finset.card_eq_two.mp hMcard
  have hm₁Verts : m₁ ∈ S.triangle.verts := by
    have hm₁M : m₁ ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hm₁M).2
  have hm₂Verts : m₂ ∈ S.triangle.verts := by
    have hm₂M : m₂ ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hm₂M).2
  have hCcard : C.card = 0 := by
    simpa [C, sameCapCount] using hs
  have hCeq : C = ∅ := Finset.card_eq_zero.mp hCcard
  have hLcard : L.card = 1 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨l, hLeq⟩ := Finset.card_eq_one.mp hLcard
  have hlSurplus : l ∈ S.capInteriorByIndex S.surplusIdx := by
    have hlL : l ∈ L := by
      rw [hLeq]
      simp
    have hlLeft := (Finset.mem_inter.mp hlL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hlLeft
  have hRcard : R.card = 1 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨q, hReq⟩ := Finset.card_eq_one.mp hRcard
  have hqOpp : q ∈ S.oppInterior1 := by
    have hqR : q ∈ R := by
      rw [hReq]
      simp
    have hqRight := (Finset.mem_inter.mp hqR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1]
      using hqRight
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex2
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q, m₁, m₂, l} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hqSel : q ∈ SelectedClass A center radius := by
    have hqR : q ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hqR).1
  have hm₁Sel : m₁ ∈ SelectedClass A center radius := by
    have hm₁M : m₁ ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hm₁M).1
  have hm₂Sel : m₂ ∈ SelectedClass A center radius := by
    have hm₂M : m₂ ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hm₂M).1
  have hlSel : l ∈ SelectedClass A center radius := by
    have hlL : l ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hlL).1
  have hselSuperset :
      ({q, m₁, m₂, l} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hqSel
    · exact hm₁Sel
    · exact hm₂Sel
    · exact hlSel
  exact ⟨m₁, m₂, q, l, hm₁₂, hMeq, hm₁Verts, hm₂Verts, hReq,
    hqOpp, hLeq, hlSurplus,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The left non-surplus finite row `(2,0,2,0)` names the selected class as
two Moser vertices and two surplus-interior points. -/
theorem IsM44.left_row2020_selectedClass_eq_moserPair_surplusPair
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 2)
    (hs : S.sameCapCount S.oppIndex2 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex2 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex2 center radius = 0) :
    ∃ m₁ m₂ l₁ l₂ : ℝ²,
      m₁ ≠ m₂ ∧
      l₁ ≠ l₂ ∧
      SelectedClass A center radius ∩ S.triangle.verts =
        ({m₁, m₂} : Finset ℝ²) ∧
      m₁ ∈ S.triangle.verts ∧
      m₂ ∈ S.triangle.verts ∧
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2 =
        ({l₁, l₂} : Finset ℝ²) ∧
      ({l₁, l₂} : Finset ℝ²) ⊆ S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({m₁, m₂, l₁, l₂} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex2).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex2
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex2
  have hMcard : M.card = 2 := by
    simpa [M, moserCount] using hm
  obtain ⟨m₁, m₂, hm₁₂, hMeq⟩ := Finset.card_eq_two.mp hMcard
  have hm₁Verts : m₁ ∈ S.triangle.verts := by
    have hm₁M : m₁ ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hm₁M).2
  have hm₂Verts : m₂ ∈ S.triangle.verts := by
    have hm₂M : m₂ ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hm₂M).2
  have hCcard : C.card = 0 := by
    simpa [C, sameCapCount] using hs
  have hCeq : C = ∅ := Finset.card_eq_zero.mp hCcard
  have hLcard : L.card = 2 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨l₁, l₂, hl₁₂, hLeq⟩ := Finset.card_eq_two.mp hLcard
  have hLsubSurplus :
      ({l₁, l₂} : Finset ℝ²) ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyL : y ∈ L := by
      rw [hLeq]
      exact hy
    have hyLeft := (Finset.mem_inter.mp hyL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using hyLeft
  have hRcard : R.card = 0 := by
    simpa [R, rightAdjCount] using hr
  have hReq : R = ∅ := Finset.card_eq_zero.mp hRcard
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex2
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({m₁, m₂, l₁, l₂} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hm₁Sel : m₁ ∈ SelectedClass A center radius := by
    have hm₁M : m₁ ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hm₁M).1
  have hm₂Sel : m₂ ∈ SelectedClass A center radius := by
    have hm₂M : m₂ ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hm₂M).1
  have hl₁Sel : l₁ ∈ SelectedClass A center radius := by
    have hl₁L : l₁ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hl₁L).1
  have hl₂Sel : l₂ ∈ SelectedClass A center radius := by
    have hl₂L : l₂ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hl₂L).1
  have hselSuperset :
      ({m₁, m₂, l₁, l₂} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hm₁Sel
    · exact hm₂Sel
    · exact hl₁Sel
    · exact hl₂Sel
  exact ⟨m₁, m₂, l₁, l₂, hm₁₂, hl₁₂, hMeq, hm₁Verts, hm₂Verts,
    hLeq, hLsubSurplus, Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- If the erased point belongs to the right-adjacent singleton of a right
one-sided payload, the payload can be rewritten with that erased point as its
named adjacent vertex. -/
theorem rightOneSidedErasedPayload_of_payload_of_right_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : RightOneSidedObstructionPayload S i center radius)
    (herased :
      erased ∈ SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex i) :
    RightOneSidedErasedPayload S i center erased radius := by
  rcases hpayload with
    ⟨m₁, m₂, s, r, hmne, hM, hC, hL, hR, hsel, hcard⟩
  have her : erased = r := by
    have herSingleton : erased ∈ ({r} : Finset ℝ²) := by
      simpa [hR] using herased
    simpa using herSingleton
  exact ⟨m₁, m₂, s, hmne, hM, hC, hL,
    by simpa [← her] using hR,
    by simpa [← her] using hsel,
    by simpa [← her] using hcard⟩

/-- If the erased point belongs to the left-adjacent singleton of a left
one-sided payload, the payload can be rewritten with that erased point as its
named adjacent vertex. -/
theorem leftOneSidedErasedPayload_of_payload_of_left_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²} (i : Fin 3) {radius : ℝ}
    (hpayload : LeftOneSidedObstructionPayload S i center radius)
    (herased :
      erased ∈ SelectedClass A center radius ∩
        S.leftAdjacentInteriorByIndex i) :
    LeftOneSidedErasedPayload S i center erased radius := by
  rcases hpayload with
    ⟨m₁, m₂, s, l, hmne, hM, hC, hL, hR, hsel, hcard⟩
  have hel : erased = l := by
    have helSingleton : erased ∈ ({l} : Finset ℝ²) := by
      simpa [hL] using herased
    simpa using helSingleton
  exact ⟨m₁, m₂, s, hmne, hM, hC,
    by simpa [← hel] using hL, hR,
    by simpa [← hel] using hsel,
    by simpa [← hel] using hcard⟩

/-- In the first non-surplus erased-pin branch, a right one-sided payload has
the erased surplus point as its unique right-adjacent selected point. -/
theorem rightOneSidedErasedPayload_of_oppIndex1_surplus_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²}
    (herasedSurplus : erased ∈ S.capInteriorByIndex S.surplusIdx)
    (hpayload :
      RightOneSidedObstructionPayload S S.oppIndex1 center
        (dist center erased)) :
    RightOneSidedErasedPayload S S.oppIndex1 center erased
      (dist center erased) := by
  have herasedA : erased ∈ A :=
    S.capInteriorByIndex_subset S.surplusIdx herasedSurplus
  have herasedSelected :
      erased ∈ SelectedClass A center (dist center erased) :=
    mem_selectedClass.mpr ⟨herasedA, rfl⟩
  have herasedRight :
      erased ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using herasedSurplus
  exact S.rightOneSidedErasedPayload_of_payload_of_right_mem
    S.oppIndex1 hpayload
    (Finset.mem_inter.mpr ⟨herasedSelected, herasedRight⟩)

/-- In the second non-surplus erased-pin branch, a left one-sided payload has
the erased surplus point as its unique left-adjacent selected point. -/
theorem leftOneSidedErasedPayload_of_oppIndex2_surplus_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {center erased : ℝ²}
    (herasedSurplus : erased ∈ S.capInteriorByIndex S.surplusIdx)
    (hpayload :
      LeftOneSidedObstructionPayload S S.oppIndex2 center
        (dist center erased)) :
    LeftOneSidedErasedPayload S S.oppIndex2 center erased
      (dist center erased) := by
  have herasedA : erased ∈ A :=
    S.capInteriorByIndex_subset S.surplusIdx herasedSurplus
  have herasedSelected :
      erased ∈ SelectedClass A center (dist center erased) :=
    mem_selectedClass.mpr ⟨herasedA, rfl⟩
  have herasedLeft :
      erased ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    simpa [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
      using herasedSurplus
  exact S.leftOneSidedErasedPayload_of_payload_of_left_mem
    S.oppIndex2 hpayload
    (Finset.mem_inter.mpr ⟨herasedSelected, herasedLeft⟩)


end SurplusCapPacket

end Problem97
