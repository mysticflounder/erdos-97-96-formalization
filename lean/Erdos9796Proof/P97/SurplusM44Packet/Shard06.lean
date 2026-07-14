/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusM44Packet.Shard01
import Erdos9796Proof.P97.SurplusM44Packet.Shard03
import Erdos9796Proof.P97.SurplusM44Packet.Shard05

/-!
# `SurplusM44Packet` shard 06 (lines 7223-8635 of the original monolith)

Mechanical split of `SurplusM44Packet.lean`; body text is verbatim.
First decl:
`left_one_sided_obstruction_payload`.
Last decl:
`IsM44.right_row2002_selectedClass_eq_moserPair_surplusPair`.
The aggregator module `Erdos9796Proof.P97.SurplusM44Packet` re-exports every shard, so
downstream imports are unchanged.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace SurplusCapPacket

/-- The left-sided obstruction row names the whole four-point selected class:
two Moser vertices, one same-cap point, one left-adjacent point, and no
right-adjacent point. -/
theorem left_one_sided_obstruction_payload
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hcard : (SelectedClass A x radius).card = 4)
    (hm : S.moserCount x radius = 2)
    (hs : S.sameCapCount i x radius = 1)
    (hl : S.leftAdjCount i x radius = 1)
    (hr : S.rightAdjCount i x radius = 0) :
    LeftOneSidedObstructionPayload S i x radius := by
  classical
  let M := SelectedClass A x radius ∩ S.triangle.verts
  let C := SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x
  let L := SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i
  let R := SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i
  have hMcard : M.card = 2 := by
    simpa [M, moserCount] using hm
  obtain ⟨m₁, m₂, hm12, hMeq⟩ := Finset.card_eq_two.mp hMcard
  have hCcard : C.card = 1 := by
    simpa [C, sameCapCount] using hs
  obtain ⟨s, hCeq⟩ := Finset.card_eq_one.mp hCcard
  have hLcard : L.card = 1 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨l, hLeq⟩ := Finset.card_eq_one.mp hLcard
  have hRcard : R.card = 0 := by
    simpa [R, rightAdjCount] using hr
  have hReq : R = ∅ := Finset.card_eq_zero.mp hRcard
  have hselCover : SelectedClass A x radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion i hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A x radius ⊆ ({m₁, m₂, s, l} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hm₁Sel : m₁ ∈ SelectedClass A x radius := by
    have hm₁M : m₁ ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hm₁M).1
  have hm₂Sel : m₂ ∈ SelectedClass A x radius := by
    have hm₂M : m₂ ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hm₂M).1
  have hsSel : s ∈ SelectedClass A x radius := by
    have hsC : s ∈ C := by
      rw [hCeq]
      simp
    exact (Finset.mem_inter.mp hsC).1
  have hlSel : l ∈ SelectedClass A x radius := by
    have hlL : l ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hlL).1
  have hselSuperset :
      ({m₁, m₂, s, l} : Finset ℝ²) ⊆ SelectedClass A x radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hm₁Sel
    · exact hm₂Sel
    · exact hsSel
    · exact hlSel
  have hseleq :
      SelectedClass A x radius = ({m₁, m₂, s, l} : Finset ℝ²) :=
    Finset.Subset.antisymm hselSubset hselSuperset
  have hnamedCard : ({m₁, m₂, s, l} : Finset ℝ²).card = 4 := by
    rw [← hseleq]
    exact hcard
  exact ⟨m₁, m₂, s, l, hm12, hMeq, hCeq, hLeq, hReq, hseleq, hnamedCard⟩

/-- The right non-surplus finite row `(0,0,1,3)` names the selected class as
one point from the other non-surplus interior pair together with the named
three-point surplus subpacket. -/
theorem IsM44.right_row0013_selectedClass_eq_oppInterior2_singleton_surplusTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 3)
    {s1 s2 s3 : ℝ²}
    (hRtriple : SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2)
    (hs13 : s1 ≠ s3)
    (hs23 : s2 ≠ s3) :
    ∃ q : ℝ²,
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1 =
        ({q} : Finset ℝ²) ∧
      q ∈ S.oppInterior2 ∧
      SelectedClass A center radius =
        ({q, s1, s2, s3} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex1).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex1
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hMcard : M.card = 0 := by
    simpa [M, moserCount] using hm
  have hMeq : M = ∅ := Finset.card_eq_zero.mp hMcard
  have hCcard : C.card = 0 := by
    simpa [C, sameCapCount] using hs
  have hCeq : C = ∅ := Finset.card_eq_zero.mp hCcard
  have hLcard : L.card = 1 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨q, hLeq⟩ := Finset.card_eq_one.mp hLcard
  have hqOpp : q ∈ S.oppInterior2 := by
    have hqL : q ∈ L := by
      rw [hLeq]
      simp
    have hqLeft := (Finset.mem_inter.mp hqL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2]
      using hqLeft
  have hRcard : R.card = 3 := by
    simpa [R, rightAdjCount] using hr
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  have hTriple_le : ({s1, s2, s3} : Finset ℝ²).card ≤ R.card := by
    rw [hTripleCard, hRcard]
  have hReqTriple : R = ({s1, s2, s3} : Finset ℝ²) :=
    Finset.eq_of_subset_of_card_le hRtriple hTriple_le
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex1
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
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReqTriple] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hqSel : q ∈ SelectedClass A center radius := by
    have hqL : q ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hqL).1
  have hs1Sel : s1 ∈ SelectedClass A center radius := by
    have hs1R : s1 ∈ R := by
      rw [hReqTriple]
      simp
    exact (Finset.mem_inter.mp hs1R).1
  have hs2Sel : s2 ∈ SelectedClass A center radius := by
    have hs2R : s2 ∈ R := by
      rw [hReqTriple]
      simp
    exact (Finset.mem_inter.mp hs2R).1
  have hs3Sel : s3 ∈ SelectedClass A center radius := by
    have hs3R : s3 ∈ R := by
      rw [hReqTriple]
      simp
    exact (Finset.mem_inter.mp hs3R).1
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
  exact ⟨q, hLeq, hqOpp, Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The right non-surplus finite row `(0,1,0,3)` names the selected class as
the same-cap singleton together with the named three-point surplus subpacket.
-/
theorem IsM44.right_row0103_selectedClass_eq_sameCap_surplusTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex1 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 0)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 3)
    {s1 s2 s3 : ℝ²}
    (hRtriple : SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
      ({s1, s2, s3} : Finset ℝ²))
    (hs12 : s1 ≠ s2)
    (hs13 : s1 ≠ s3)
    (hs23 : s2 ≠ s3) :
    ∃ c : ℝ²,
      SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex1).erase center =
        ({c} : Finset ℝ²) ∧
      SelectedClass A center radius =
        ({c, s1, s2, s3} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex1).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex1
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hMcard : M.card = 0 := by
    simpa [M, moserCount] using hm
  have hMeq : M = ∅ := Finset.card_eq_zero.mp hMcard
  have hCcard : C.card = 1 := by
    simpa [C, sameCapCount] using hs
  obtain ⟨c, hCeq⟩ := Finset.card_eq_one.mp hCcard
  have hLcard : L.card = 0 := by
    simpa [L, leftAdjCount] using hl
  have hLeq : L = ∅ := Finset.card_eq_zero.mp hLcard
  have hRcard : R.card = 3 := by
    simpa [R, rightAdjCount] using hr
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  have hTriple_le : ({s1, s2, s3} : Finset ℝ²).card ≤ R.card := by
    rw [hTripleCard, hRcard]
  have hReqTriple : R = ({s1, s2, s3} : Finset ℝ²) :=
    Finset.eq_of_subset_of_card_le hRtriple hTriple_le
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex1
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
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReqTriple] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hcSel : c ∈ SelectedClass A center radius := by
    have hcC : c ∈ C := by
      rw [hCeq]
      simp
    exact (Finset.mem_inter.mp hcC).1
  have hs1Sel : s1 ∈ SelectedClass A center radius := by
    have hs1R : s1 ∈ R := by
      rw [hReqTriple]
      simp
    exact (Finset.mem_inter.mp hs1R).1
  have hs2Sel : s2 ∈ SelectedClass A center radius := by
    have hs2R : s2 ∈ R := by
      rw [hReqTriple]
      simp
    exact (Finset.mem_inter.mp hs2R).1
  have hs3Sel : s3 ∈ SelectedClass A center radius := by
    have hs3R : s3 ∈ R := by
      rw [hReqTriple]
      simp
    exact (Finset.mem_inter.mp hs3R).1
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

/-- The right non-surplus finite row `(0,0,2,2)` names the selected class as
the other non-surplus interior pair together with two surplus-interior points.
-/
theorem IsM44.right_row0022_selectedClass_eq_oppInterior2_union_surplusPair
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 2)
    {q₁ q₂ : ℝ²}
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²)) :
    ∃ r₁ r₂ : ℝ²,
      r₁ ≠ r₂ ∧
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1 =
        ({r₁, r₂} : Finset ℝ²) ∧
      ({r₁, r₂} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q₁, q₂, r₁, r₂} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex1).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex1
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hMcard : M.card = 0 := by
    simpa [M, moserCount] using hm
  have hMeq : M = ∅ := Finset.card_eq_zero.mp hMcard
  have hCcard : C.card = 0 := by
    simpa [C, sameCapCount] using hs
  have hCeq : C = ∅ := Finset.card_eq_zero.mp hCcard
  have hLcard : L.card = 2 := by
    simpa [L, leftAdjCount] using hl
  have hLsub : L ⊆ S.oppInterior2 := by
    intro y hy
    have hy' := (Finset.mem_inter.mp hy).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2] using hy'
  have hLcard_le : S.oppInterior2.card ≤ L.card := by
    rw [hLcard, hM44.oppInterior2_card_eq_two]
  have hLeqOpp : L = S.oppInterior2 :=
    Finset.eq_of_subset_of_card_le hLsub hLcard_le
  have hLeq : L = ({q₁, q₂} : Finset ℝ²) := by
    rw [hLeqOpp, hqpair]
  have hRcard : R.card = 2 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨r₁, r₂, hr12, hReq⟩ := Finset.card_eq_two.mp hRcard
  have hRsub : ({r₁, r₂} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyR : y ∈ R := by
      rw [hReq]
      exact hy
    have hyRight := (Finset.mem_inter.mp hyR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hyRight
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex1 hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q₁, q₂, r₁, r₂} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hq₁Sel : q₁ ∈ SelectedClass A center radius := by
    have hq₁L : q₁ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hq₁L).1
  have hq₂Sel : q₂ ∈ SelectedClass A center radius := by
    have hq₂L : q₂ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hq₂L).1
  have hr₁Sel : r₁ ∈ SelectedClass A center radius := by
    have hr₁R : r₁ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hr₁R).1
  have hr₂Sel : r₂ ∈ SelectedClass A center radius := by
    have hr₂R : r₂ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hr₂R).1
  have hselSuperset :
      ({q₁, q₂, r₁, r₂} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hq₁Sel
    · exact hq₂Sel
    · exact hr₁Sel
    · exact hr₂Sel
  exact ⟨r₁, r₂, hr12, hReq, hRsub,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The right non-surplus finite row `(0,1,2,1)` names the selected class as
the other non-surplus interior pair, the same-cap singleton, and one
surplus-interior point. -/
theorem IsM44.right_row0121_selectedClass_eq_oppInterior2_union_sameCap_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex1 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 1)
    {q₁ q₂ : ℝ²}
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²)) :
    ∃ c r : ℝ²,
      SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex1).erase center =
        ({c} : Finset ℝ²) ∧
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1 =
        ({r} : Finset ℝ²) ∧
      r ∈ S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q₁, q₂, c, r} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex1).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex1
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hMcard : M.card = 0 := by
    simpa [M, moserCount] using hm
  have hMeq : M = ∅ := Finset.card_eq_zero.mp hMcard
  have hCcard : C.card = 1 := by
    simpa [C, sameCapCount] using hs
  obtain ⟨c, hCeq⟩ := Finset.card_eq_one.mp hCcard
  have hLcard : L.card = 2 := by
    simpa [L, leftAdjCount] using hl
  have hLsub : L ⊆ S.oppInterior2 := by
    intro y hy
    have hy' := (Finset.mem_inter.mp hy).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2] using hy'
  have hLcard_le : S.oppInterior2.card ≤ L.card := by
    rw [hLcard, hM44.oppInterior2_card_eq_two]
  have hLeqOpp : L = S.oppInterior2 :=
    Finset.eq_of_subset_of_card_le hLsub hLcard_le
  have hLeq : L = ({q₁, q₂} : Finset ℝ²) := by
    rw [hLeqOpp, hqpair]
  have hRcard : R.card = 1 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨r, hReq⟩ := Finset.card_eq_one.mp hRcard
  have hrSurplus : r ∈ S.capInteriorByIndex S.surplusIdx := by
    have hrR : r ∈ R := by
      rw [hReq]
      simp
    have hrRight := (Finset.mem_inter.mp hrR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hrRight
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex1
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q₁, q₂, c, r} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hq₁Sel : q₁ ∈ SelectedClass A center radius := by
    have hq₁L : q₁ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hq₁L).1
  have hq₂Sel : q₂ ∈ SelectedClass A center radius := by
    have hq₂L : q₂ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hq₂L).1
  have hcSel : c ∈ SelectedClass A center radius := by
    have hcC : c ∈ C := by
      rw [hCeq]
      simp
    exact (Finset.mem_inter.mp hcC).1
  have hrSel : r ∈ SelectedClass A center radius := by
    have hrR : r ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hrR).1
  have hselSuperset :
      ({q₁, q₂, c, r} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hq₁Sel
    · exact hq₂Sel
    · exact hcSel
    · exact hrSel
  exact ⟨c, r, hCeq, hReq, hrSurplus,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The right non-surplus finite row `(1,0,0,3)` names the selected class as
one Moser vertex together with the named three-point surplus subpacket. -/
theorem IsM44.right_row1003_selectedClass_eq_moser_surplusTriple
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 0)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 3)
    {s1 s2 s3 : ℝ²}
    (hRtriple : SelectedClass A center radius ∩
        S.rightAdjacentInteriorByIndex S.oppIndex1 ⊆
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
    (S.capInteriorByIndex S.oppIndex1).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex1
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
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
  have hLcard : L.card = 0 := by
    simpa [L, leftAdjCount] using hl
  have hLeq : L = ∅ := Finset.card_eq_zero.mp hLcard
  have hRcard : R.card = 3 := by
    simpa [R, rightAdjCount] using hr
  have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
    simp [hs12, hs13, hs23]
  have hTriple_le : ({s1, s2, s3} : Finset ℝ²).card ≤ R.card := by
    rw [hTripleCard, hRcard]
  have hReqTriple : R = ({s1, s2, s3} : Finset ℝ²) :=
    Finset.eq_of_subset_of_card_le hRtriple hTriple_le
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex1
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
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReqTriple] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hmSel : m ∈ SelectedClass A center radius := by
    have hmM : m ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hmM).1
  have hs1Sel : s1 ∈ SelectedClass A center radius := by
    have hs1R : s1 ∈ R := by
      rw [hReqTriple]
      simp
    exact (Finset.mem_inter.mp hs1R).1
  have hs2Sel : s2 ∈ SelectedClass A center radius := by
    have hs2R : s2 ∈ R := by
      rw [hReqTriple]
      simp
    exact (Finset.mem_inter.mp hs2R).1
  have hs3Sel : s3 ∈ SelectedClass A center radius := by
    have hs3R : s3 ∈ R := by
      rw [hReqTriple]
      simp
    exact (Finset.mem_inter.mp hs3R).1
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

/-- The right non-surplus finite row `(0,1,1,2)` names the selected class as
one point from the other non-surplus interior pair, the same-cap singleton,
and two surplus-interior points. -/
theorem IsM44.right_row0112_selectedClass_eq_oppInterior2_singleton_sameCap_surplusPair
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 0)
    (hs : S.sameCapCount S.oppIndex1 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 2) :
    ∃ q c r₁ r₂ : ℝ²,
      r₁ ≠ r₂ ∧
      SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex1).erase center =
        ({c} : Finset ℝ²) ∧
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1 =
        ({q} : Finset ℝ²) ∧
      q ∈ S.oppInterior2 ∧
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1 =
        ({r₁, r₂} : Finset ℝ²) ∧
      ({r₁, r₂} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q, c, r₁, r₂} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex1).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex1
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
  have hMcard : M.card = 0 := by
    simpa [M, moserCount] using hm
  have hMeq : M = ∅ := Finset.card_eq_zero.mp hMcard
  have hCcard : C.card = 1 := by
    simpa [C, sameCapCount] using hs
  obtain ⟨c, hCeq⟩ := Finset.card_eq_one.mp hCcard
  have hLcard : L.card = 1 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨q, hLeq⟩ := Finset.card_eq_one.mp hLcard
  have hqOpp : q ∈ S.oppInterior2 := by
    have hqL : q ∈ L := by
      rw [hLeq]
      simp
    have hqLeft := (Finset.mem_inter.mp hqL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2]
      using hqLeft
  have hRcard : R.card = 2 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨r₁, r₂, hr12, hReq⟩ := Finset.card_eq_two.mp hRcard
  have hRsub : ({r₁, r₂} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyR : y ∈ R := by
      rw [hReq]
      exact hy
    have hyRight := (Finset.mem_inter.mp hyR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hyRight
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex1
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q, c, r₁, r₂} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hqSel : q ∈ SelectedClass A center radius := by
    have hqL : q ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hqL).1
  have hcSel : c ∈ SelectedClass A center radius := by
    have hcC : c ∈ C := by
      rw [hCeq]
      simp
    exact (Finset.mem_inter.mp hcC).1
  have hr₁Sel : r₁ ∈ SelectedClass A center radius := by
    have hr₁R : r₁ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hr₁R).1
  have hr₂Sel : r₂ ∈ SelectedClass A center radius := by
    have hr₂R : r₂ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hr₂R).1
  have hselSuperset :
      ({q, c, r₁, r₂} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hqSel
    · exact hcSel
    · exact hr₁Sel
    · exact hr₂Sel
  exact ⟨q, c, r₁, r₂, hr12, hCeq, hLeq, hqOpp, hReq, hRsub,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The right non-surplus finite row `(1,0,1,2)` names the selected class as
one point from the other non-surplus interior pair, one Moser vertex, and two
surplus-interior points. -/
theorem IsM44.right_row1012_selectedClass_eq_moser_oppInterior2_singleton_surplusPair
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 2) :
    ∃ q m r₁ r₂ : ℝ²,
      r₁ ≠ r₂ ∧
      SelectedClass A center radius ∩ S.triangle.verts =
        ({m} : Finset ℝ²) ∧
      m ∈ S.triangle.verts ∧
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1 =
        ({q} : Finset ℝ²) ∧
      q ∈ S.oppInterior2 ∧
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1 =
        ({r₁, r₂} : Finset ℝ²) ∧
      ({r₁, r₂} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q, m, r₁, r₂} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex1).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex1
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
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
  have hLcard : L.card = 1 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨q, hLeq⟩ := Finset.card_eq_one.mp hLcard
  have hqOpp : q ∈ S.oppInterior2 := by
    have hqL : q ∈ L := by
      rw [hLeq]
      simp
    have hqLeft := (Finset.mem_inter.mp hqL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2]
      using hqLeft
  have hRcard : R.card = 2 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨r₁, r₂, hr12, hReq⟩ := Finset.card_eq_two.mp hRcard
  have hRsub : ({r₁, r₂} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyR : y ∈ R := by
      rw [hReq]
      exact hy
    have hyRight := (Finset.mem_inter.mp hyR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hyRight
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex1
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q, m, r₁, r₂} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hqSel : q ∈ SelectedClass A center radius := by
    have hqL : q ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hqL).1
  have hmSel : m ∈ SelectedClass A center radius := by
    have hmM : m ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hmM).1
  have hr₁Sel : r₁ ∈ SelectedClass A center radius := by
    have hr₁R : r₁ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hr₁R).1
  have hr₂Sel : r₂ ∈ SelectedClass A center radius := by
    have hr₂R : r₂ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hr₂R).1
  have hselSuperset :
      ({q, m, r₁, r₂} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hqSel
    · exact hmSel
    · exact hr₁Sel
    · exact hr₂Sel
  exact ⟨q, m, r₁, r₂, hr12, hMeq, hmVerts, hLeq, hqOpp, hReq, hRsub,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The right non-surplus finite row `(1,1,1,1)` names the selected class as
one point from the other non-surplus interior pair, the same-cap singleton,
one Moser vertex, and one surplus-interior point. -/
theorem IsM44.right_row1111_selectedClass_eq_moser_sameCap_oppInterior2_singleton_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex1 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 1) :
    ∃ q c m r : ℝ²,
      SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex1).erase center =
        ({c} : Finset ℝ²) ∧
      SelectedClass A center radius ∩ S.triangle.verts =
        ({m} : Finset ℝ²) ∧
      m ∈ S.triangle.verts ∧
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1 =
        ({q} : Finset ℝ²) ∧
      q ∈ S.oppInterior2 ∧
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1 =
        ({r} : Finset ℝ²) ∧
      r ∈ S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q, c, m, r} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex1).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex1
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
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
  have hLcard : L.card = 1 := by
    simpa [L, leftAdjCount] using hl
  obtain ⟨q, hLeq⟩ := Finset.card_eq_one.mp hLcard
  have hqOpp : q ∈ S.oppInterior2 := by
    have hqL : q ∈ L := by
      rw [hLeq]
      simp
    have hqLeft := (Finset.mem_inter.mp hqL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2]
      using hqLeft
  have hRcard : R.card = 1 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨r, hReq⟩ := Finset.card_eq_one.mp hRcard
  have hrSurplus : r ∈ S.capInteriorByIndex S.surplusIdx := by
    have hrR : r ∈ R := by
      rw [hReq]
      simp
    have hrRight := (Finset.mem_inter.mp hrR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hrRight
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex1
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q, c, m, r} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hqSel : q ∈ SelectedClass A center radius := by
    have hqL : q ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hqL).1
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
  have hrSel : r ∈ SelectedClass A center radius := by
    have hrR : r ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hrR).1
  have hselSuperset :
      ({q, c, m, r} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hqSel
    · exact hcSel
    · exact hmSel
    · exact hrSel
  exact ⟨q, c, m, r, hCeq, hMeq, hmVerts, hLeq, hqOpp, hReq, hrSurplus,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The right non-surplus finite row `(1,1,0,2)` names the selected class as
the same-cap singleton, one Moser vertex, and two surplus-interior points. -/
theorem IsM44.right_row1102_selectedClass_eq_moser_sameCap_surplusPair
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex1 center radius = 1)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 0)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 2) :
    ∃ c m r₁ r₂ : ℝ²,
      r₁ ≠ r₂ ∧
      SelectedClass A center radius ∩
          (S.capInteriorByIndex S.oppIndex1).erase center =
        ({c} : Finset ℝ²) ∧
      SelectedClass A center radius ∩ S.triangle.verts =
        ({m} : Finset ℝ²) ∧
      m ∈ S.triangle.verts ∧
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1 =
        ({r₁, r₂} : Finset ℝ²) ∧
      ({r₁, r₂} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({c, m, r₁, r₂} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex1).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex1
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
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
  have hLcard : L.card = 0 := by
    simpa [L, leftAdjCount] using hl
  have hLeq : L = ∅ := Finset.card_eq_zero.mp hLcard
  have hRcard : R.card = 2 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨r₁, r₂, hr12, hReq⟩ := Finset.card_eq_two.mp hRcard
  have hRsub : ({r₁, r₂} : Finset ℝ²) ⊆
      S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyR : y ∈ R := by
      rw [hReq]
      exact hy
    have hyRight := (Finset.mem_inter.mp hyR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hyRight
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex1
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({c, m, r₁, r₂} : Finset ℝ²) := by
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
  have hr₁Sel : r₁ ∈ SelectedClass A center radius := by
    have hr₁R : r₁ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hr₁R).1
  have hr₂Sel : r₂ ∈ SelectedClass A center radius := by
    have hr₂R : r₂ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hr₂R).1
  have hselSuperset :
      ({c, m, r₁, r₂} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hcSel
    · exact hmSel
    · exact hr₁Sel
    · exact hr₂Sel
  exact ⟨c, m, r₁, r₂, hr12, hCeq, hMeq, hmVerts, hReq, hRsub,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The right non-surplus finite row `(1,0,2,1)` names the selected class as
one Moser vertex, the other non-surplus interior pair, and one
surplus-interior point. -/
theorem IsM44.right_row1021_selectedClass_eq_moser_oppInterior2_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 1)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 2)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 1)
    {q₁ q₂ : ℝ²}
    (hqpair : S.oppInterior2 = ({q₁, q₂} : Finset ℝ²)) :
    ∃ m r : ℝ²,
      SelectedClass A center radius ∩ S.triangle.verts =
        ({m} : Finset ℝ²) ∧
      m ∈ S.triangle.verts ∧
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1 =
        ({r} : Finset ℝ²) ∧
      r ∈ S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q₁, q₂, m, r} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex1).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex1
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
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
  have hLcard : L.card = 2 := by
    simpa [L, leftAdjCount] using hl
  have hLsub : L ⊆ S.oppInterior2 := by
    intro y hy
    have hy' := (Finset.mem_inter.mp hy).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2] using hy'
  have hLcard_le : S.oppInterior2.card ≤ L.card := by
    rw [hLcard, hM44.oppInterior2_card_eq_two]
  have hLeqOpp : L = S.oppInterior2 :=
    Finset.eq_of_subset_of_card_le hLsub hLcard_le
  have hLeq : L = ({q₁, q₂} : Finset ℝ²) := by
    rw [hLeqOpp, hqpair]
  have hRcard : R.card = 1 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨r, hReq⟩ := Finset.card_eq_one.mp hRcard
  have hrSurplus : r ∈ S.capInteriorByIndex S.surplusIdx := by
    have hrR : r ∈ R := by
      rw [hReq]
      simp
    have hrRight := (Finset.mem_inter.mp hrR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hrRight
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex1
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q₁, q₂, m, r} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hq₁Sel : q₁ ∈ SelectedClass A center radius := by
    have hq₁L : q₁ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hq₁L).1
  have hq₂Sel : q₂ ∈ SelectedClass A center radius := by
    have hq₂L : q₂ ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hq₂L).1
  have hmSel : m ∈ SelectedClass A center radius := by
    have hmM : m ∈ M := by
      rw [hMeq]
      simp
    exact (Finset.mem_inter.mp hmM).1
  have hrSel : r ∈ SelectedClass A center radius := by
    have hrR : r ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hrR).1
  have hselSuperset :
      ({q₁, q₂, m, r} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hq₁Sel
    · exact hq₂Sel
    · exact hmSel
    · exact hrSel
  exact ⟨m, r, hMeq, hmVerts, hReq, hrSurplus,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The right non-surplus finite row `(2,0,1,1)` names the selected class as
two Moser vertices, one point in the other non-surplus interior pair, and one
surplus-interior point. -/
theorem IsM44.right_row2011_selectedClass_eq_moserPair_oppInterior2_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 2)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 1)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 1) :
    ∃ m₁ m₂ q r : ℝ²,
      m₁ ≠ m₂ ∧
      SelectedClass A center radius ∩ S.triangle.verts =
        ({m₁, m₂} : Finset ℝ²) ∧
      m₁ ∈ S.triangle.verts ∧
      m₂ ∈ S.triangle.verts ∧
      SelectedClass A center radius ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1 =
        ({q} : Finset ℝ²) ∧
      q ∈ S.oppInterior2 ∧
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1 =
        ({r} : Finset ℝ²) ∧
      r ∈ S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({q, m₁, m₂, r} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex1).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex1
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
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
  obtain ⟨q, hLeq⟩ := Finset.card_eq_one.mp hLcard
  have hqOpp : q ∈ S.oppInterior2 := by
    have hqL : q ∈ L := by
      rw [hLeq]
      simp
    have hqLeft := (Finset.mem_inter.mp hqL).2
    simpa [S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2]
      using hqLeft
  have hRcard : R.card = 1 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨r, hReq⟩ := Finset.card_eq_one.mp hRcard
  have hrSurplus : r ∈ S.capInteriorByIndex S.surplusIdx := by
    have hrR : r ∈ R := by
      rw [hReq]
      simp
    have hrRight := (Finset.mem_inter.mp hrR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hrRight
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex1
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({q, m₁, m₂, r} : Finset ℝ²) := by
    intro y hy
    have hycover := hselCover hy
    simp [M, C, L, R, hMeq, hCeq, hLeq, hReq] at hycover
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hqSel : q ∈ SelectedClass A center radius := by
    have hqL : q ∈ L := by
      rw [hLeq]
      simp
    exact (Finset.mem_inter.mp hqL).1
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
  have hrSel : r ∈ SelectedClass A center radius := by
    have hrR : r ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hrR).1
  have hselSuperset :
      ({q, m₁, m₂, r} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hqSel
    · exact hm₁Sel
    · exact hm₂Sel
    · exact hrSel
  exact ⟨m₁, m₂, q, r, hm₁₂, hMeq, hm₁Verts, hm₂Verts, hLeq,
    hqOpp, hReq, hrSurplus,
    Finset.Subset.antisymm hselSubset hselSuperset⟩

/-- The right non-surplus finite row `(2,0,0,2)` names the selected class as
two Moser vertices and two surplus-interior points. -/
theorem IsM44.right_row2002_selectedClass_eq_moserPair_surplusPair
    {A : Finset ℝ²} {S : SurplusCapPacket A} (_hM44 : S.IsM44)
    {center : ℝ²} {radius : ℝ}
    (hradius_pos : 0 < radius)
    (hm : S.moserCount center radius = 2)
    (hs : S.sameCapCount S.oppIndex1 center radius = 0)
    (hl : S.leftAdjCount S.oppIndex1 center radius = 0)
    (hr : S.rightAdjCount S.oppIndex1 center radius = 2) :
    ∃ m₁ m₂ r₁ r₂ : ℝ²,
      m₁ ≠ m₂ ∧
      r₁ ≠ r₂ ∧
      SelectedClass A center radius ∩ S.triangle.verts =
        ({m₁, m₂} : Finset ℝ²) ∧
      m₁ ∈ S.triangle.verts ∧
      m₂ ∈ S.triangle.verts ∧
      SelectedClass A center radius ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1 =
        ({r₁, r₂} : Finset ℝ²) ∧
      ({r₁, r₂} : Finset ℝ²) ⊆ S.capInteriorByIndex S.surplusIdx ∧
      SelectedClass A center radius =
        ({m₁, m₂, r₁, r₂} : Finset ℝ²) := by
  classical
  let M := SelectedClass A center radius ∩ S.triangle.verts
  let C := SelectedClass A center radius ∩
    (S.capInteriorByIndex S.oppIndex1).erase center
  let L := SelectedClass A center radius ∩
    S.leftAdjacentInteriorByIndex S.oppIndex1
  let R := SelectedClass A center radius ∩
    S.rightAdjacentInteriorByIndex S.oppIndex1
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
  have hLcard : L.card = 0 := by
    simpa [L, leftAdjCount] using hl
  have hLeq : L = ∅ := Finset.card_eq_zero.mp hLcard
  have hRcard : R.card = 2 := by
    simpa [R, rightAdjCount] using hr
  obtain ⟨r₁, r₂, hr₁₂, hReq⟩ := Finset.card_eq_two.mp hRcard
  have hRsubSurplus :
      ({r₁, r₂} : Finset ℝ²) ⊆ S.capInteriorByIndex S.surplusIdx := by
    intro y hy
    have hyR : y ∈ R := by
      rw [hReq]
      exact hy
    have hyRight := (Finset.mem_inter.mp hyR).2
    simpa [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
      using hyRight
  have hselCover : SelectedClass A center radius ⊆ M ∪ C ∪ L ∪ R := by
    intro y hy
    have hcover := S.selectedClass_subset_groupUnion S.oppIndex1
      hradius_pos hy
    simp only [Finset.mem_union] at hcover ⊢
    rcases hcover with (((hyM | hyC) | hyL) | hyR)
    · exact Or.inl (Or.inl (Or.inl (Finset.mem_inter.mpr ⟨hy, hyM⟩)))
    · exact Or.inl (Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyC⟩)))
    · exact Or.inl (Or.inr (Finset.mem_inter.mpr ⟨hy, hyL⟩))
    · exact Or.inr (Finset.mem_inter.mpr ⟨hy, hyR⟩)
  have hselSubset :
      SelectedClass A center radius ⊆ ({m₁, m₂, r₁, r₂} : Finset ℝ²) := by
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
  have hr₁Sel : r₁ ∈ SelectedClass A center radius := by
    have hr₁R : r₁ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hr₁R).1
  have hr₂Sel : r₂ ∈ SelectedClass A center radius := by
    have hr₂R : r₂ ∈ R := by
      rw [hReq]
      simp
    exact (Finset.mem_inter.mp hr₂R).1
  have hselSuperset :
      ({m₁, m₂, r₁, r₂} : Finset ℝ²) ⊆
        SelectedClass A center radius := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl | rfl
    · exact hm₁Sel
    · exact hm₂Sel
    · exact hr₁Sel
    · exact hr₂Sel
  exact ⟨m₁, m₂, r₁, r₂, hm₁₂, hr₁₂, hMeq, hm₁Verts, hm₂Verts,
    hReq, hRsubSurplus, Finset.Subset.antisymm hselSubset hselSuperset⟩


end SurplusCapPacket

end Problem97
