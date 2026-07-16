/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# Fixed-surplus packet reorientation audit

The existing `U2NonSurplusSqueeze.exists_nonSurplusSwap` construction really
does exchange both non-surplus caps and both opposite Moser apices while
preserving the carrier and surplus cap.  Its public `NonSurplusSwap` record
only stores one of the two apex equalities.  This file recovers the omitted
second equality from the stored cap equalities and the cap-intersection
combinatorics, then packages the exact normalization needed by a CP-built
leaf packet: any index different from the surplus index can be made the
physical `oppCap2`/`oppApex2` role.

The original numerical `Fin 3` label is not preserved by this normalization:
the physical cap is transported through a cap-set equality after the
non-surplus labels are transposed.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerDistinctRadiusScratch

attribute [local instance] Classical.propDecidable

private lemma mem_moserVerts_cases
    {A : Finset ℝ²} {M : MoserTriangle A} {x : ℝ²}
    (hx : x ∈ M.verts) :
    x = M.v1 ∨ x = M.v2 ∨ x = M.v3 := by
  simpa [MoserTriangle.verts] using hx

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

private theorem oppApex1_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C2

private theorem surplusApex_mem_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex ∈ S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap1,
      SurplusCapPacket.surplusApex, hi] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppCap1,
      SurplusCapPacket.surplusApex, hi] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppCap1,
      SurplusCapPacket.surplusApex, hi] using S.partition.v3_mem_C1

private theorem surplusApex_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex ∈ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] using S.partition.v3_mem_C2

private theorem oppCap1_inter_oppCap2_subset_surplusApex
    (D : CounterexampleData) :
    D.packet.oppCap1 ∩ D.packet.oppCap2 ⊆
      ({D.packet.surplusApex} : Finset ℝ²) := by
  intro x hx
  have hx1 : x ∈ D.packet.oppCap1 := (Finset.mem_inter.mp hx).1
  have hx2 : x ∈ D.packet.oppCap2 := (Finset.mem_inter.mp hx).2
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] at hx1 hx2 ⊢
    by_cases hxVerts : x ∈ D.packet.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · simp
      · exact False.elim (D.packet.partition.v2_notin_C2 hx1)
      · exact False.elim (D.packet.partition.v3_notin_C3 hx2)
    · have hxA : x ∈ D.A := D.packet.partition.C2_subset hx1
      have hone := D.packet.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC1 : x ∈ D.packet.partition.C1
      · simp [hxC1, hx1, hx2] at hone
      · simp [hxC1, hx1, hx2] at hone
  · simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] at hx1 hx2 ⊢
    by_cases hxVerts : x ∈ D.packet.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (D.packet.partition.v1_notin_C1 hx2)
      · simp
      · exact False.elim (D.packet.partition.v3_notin_C3 hx1)
    · have hxA : x ∈ D.A := D.packet.partition.C3_subset hx1
      have hone := D.packet.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC2 : x ∈ D.packet.partition.C2
      · simp [hx1, hx2, hxC2] at hone
      · simp [hx1, hx2, hxC2] at hone
  · simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] at hx1 hx2 ⊢
    by_cases hxVerts : x ∈ D.packet.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (D.packet.partition.v1_notin_C1 hx1)
      · exact False.elim (D.packet.partition.v2_notin_C2 hx2)
      · simp
    · have hxA : x ∈ D.A := D.packet.partition.C1_subset hx1
      have hone := D.packet.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC3 : x ∈ D.packet.partition.C3
      · simp [hx1, hx2, hxC3] at hone
      · simp [hx1, hx2, hxC3] at hone

/-- The second opposite-apex equality omitted from the public swap record is a
consequence of its cap equalities. -/
theorem nonSurplusSwap_oppApex2_eq
    {D Dsw : CounterexampleData}
    (hswap : U2NonSurplusSqueeze.NonSurplusSwap D Dsw) :
    Dsw.packet.oppApex2 = D.packet.oppApex1 := by
  have hmemSurplus : D.packet.oppApex1 ∈ Dsw.packet.surplusCap := by
    rw [hswap.surplusCap_eq]
    exact oppApex1_mem_surplusCap D.packet
  have hmemOpp1 : D.packet.oppApex1 ∈ Dsw.packet.oppCap1 := by
    rw [hswap.oppCap1_eq]
    exact oppApex1_mem_oppCap2 D.packet
  have hmemInter :
      D.packet.oppApex1 ∈ Dsw.packet.surplusCap ∩ Dsw.packet.oppCap1 :=
    Finset.mem_inter.mpr ⟨hmemSurplus, hmemOpp1⟩
  have hsingleton :=
    U2NonSurplusSqueeze.surplus_inter_oppCap1_subset_oppApex2 Dsw hmemInter
  exact (Finset.mem_singleton.mp hsingleton).symm

/-- The physical surplus Moser apex also survives the non-surplus swap. -/
theorem nonSurplusSwap_surplusApex_eq
    {D Dsw : CounterexampleData}
    (hswap : U2NonSurplusSqueeze.NonSurplusSwap D Dsw) :
    Dsw.packet.surplusApex = D.packet.surplusApex := by
  have hmemOpp1 : D.packet.surplusApex ∈ Dsw.packet.oppCap1 := by
    rw [hswap.oppCap1_eq]
    exact surplusApex_mem_oppCap2 D.packet
  have hmemOpp2 : D.packet.surplusApex ∈ Dsw.packet.oppCap2 := by
    rw [hswap.oppCap2_eq]
    exact surplusApex_mem_oppCap1 D.packet
  have hmemInter :
      D.packet.surplusApex ∈ Dsw.packet.oppCap1 ∩ Dsw.packet.oppCap2 :=
    Finset.mem_inter.mpr ⟨hmemOpp1, hmemOpp2⟩
  have hsingleton :=
    oppCap1_inter_oppCap2_subset_surplusApex Dsw hmemInter
  exact (Finset.mem_singleton.mp hsingleton).symm

/-- Complete physical transport record for the already-proven fixed-surplus
swap. -/
structure CompleteNonSurplusSwap (D Dsw : CounterexampleData) : Prop where
  toNonSurplusSwap : U2NonSurplusSqueeze.NonSurplusSwap D Dsw
  oppApex2_eq : Dsw.packet.oppApex2 = D.packet.oppApex1
  surplusApex_eq : Dsw.packet.surplusApex = D.packet.surplusApex

theorem exists_completeNonSurplusSwap (D : CounterexampleData) :
    ∃ Dsw : CounterexampleData, CompleteNonSurplusSwap D Dsw := by
  obtain ⟨Dsw, hswap⟩ := U2NonSurplusSqueeze.exists_nonSurplusSwap D
  exact ⟨Dsw, hswap, nonSurplusSwap_oppApex2_eq hswap,
    nonSurplusSwap_surplusApex_eq hswap⟩

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem oppositeVertexByIndex_oppIndex1_eq_oppApex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppositeVertexByIndex S.oppIndex1 = S.oppApex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppApex1, hi]

private theorem oppositeVertexByIndex_oppIndex2_eq_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppositeVertexByIndex S.oppIndex2 = S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, SurplusCapPacket.oppApex2, hi]

/-- A physical non-surplus cap/apex selected by `j` has been normalized into
the second opposite role.  `j` remains an index for the original packet; the
new packet carries the same physical cap and apex through the two displayed
equalities. -/
structure RightOrientedNonSurplusIndex
    (D : CounterexampleData) (j : Fin 3) where
  data : CounterexampleData
  carrier_eq : data.A = D.A
  surplusCap_eq : data.packet.surplusCap = D.packet.surplusCap
  surplusApex_eq : data.packet.surplusApex = D.packet.surplusApex
  targetCap_eq : data.packet.oppCap2 = D.packet.capByIndex j
  targetApex_eq : data.packet.oppApex2 = D.packet.oppositeVertexByIndex j
  isM44_iff : data.IsM44 ↔ D.IsM44

/-- Any original cap index different from the surplus index can be assigned
to the physical `oppCap2`/`oppApex2` role. -/
theorem exists_rightOrientedNonSurplusIndex
    (D : CounterexampleData) (j : Fin 3)
    (hj : j ≠ D.packet.surplusIdx) :
    Nonempty (RightOrientedNonSurplusIndex D j) := by
  rcases D.packet.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 j with
      hsurplus | hfirst | hsecond
  · exact False.elim (hj hsurplus)
  · obtain ⟨Dsw, hswap⟩ := exists_completeNonSurplusSwap D
    refine ⟨{
      data := Dsw
      carrier_eq := hswap.toNonSurplusSwap.carrier_eq
      surplusCap_eq := hswap.toNonSurplusSwap.surplusCap_eq
      surplusApex_eq := hswap.surplusApex_eq
      targetCap_eq := ?_
      targetApex_eq := ?_
      isM44_iff := hswap.toNonSurplusSwap.isM44_iff }⟩
    · rw [hswap.toNonSurplusSwap.oppCap2_eq, hfirst,
        capByIndex_oppIndex1_eq_oppCap1]
    · rw [hswap.oppApex2_eq, hfirst,
        oppositeVertexByIndex_oppIndex1_eq_oppApex1]
  · refine ⟨{
      data := D
      carrier_eq := rfl
      surplusCap_eq := rfl
      surplusApex_eq := rfl
      targetCap_eq := ?_
      targetApex_eq := ?_
      isM44_iff := Iff.rfl }⟩
    · rw [hsecond, capByIndex_oppIndex2_eq_oppCap2]
    · rw [hsecond, oppositeVertexByIndex_oppIndex2_eq_oppApex2]

private noncomputable def counterexampleWithPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    CounterexampleData := {
  A := D.A
  nonempty := D.nonempty
  convex := D.convex
  K4 := D.K4
  packet := S }

private theorem leaf_capByIndex_eq_capAt
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i j : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card) :
    (U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
      (D := D) MT hCirc CP i hM hsurplus).capByIndex j = CP.capAt j := by
  subst hM
  fin_cases j <;>
    simp [U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket,
      SurplusCapPacket.capByIndex, CapTriple.capAt]

private theorem leaf_surplusIdx_eq
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card) :
    (U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
      (D := D) MT hCirc CP i hM hsurplus).surplusIdx = i := by
  subst hM
  rfl

/-- CP-built specialization: a second-large-cap witness can always be
normalized into the physical second-opposite role, and its cardinality lower
bound transports exactly. -/
theorem exists_rightOriented_leaf_secondLargeCap
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i j : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (hjne : j ≠ i) (hj5 : 5 ≤ (CP.capAt j).card) :
    ∃ Dright : CounterexampleData,
      Dright.A = D.A ∧
      Dright.packet.surplusCap =
        (U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
          (D := D) MT hCirc CP i hM hsurplus).surplusCap ∧
      Dright.packet.surplusApex =
        (U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
          (D := D) MT hCirc CP i hM hsurplus).surplusApex ∧
      Dright.packet.oppCap2 = CP.capAt j ∧
      Dright.packet.oppApex2 =
        (U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
          (D := D) MT hCirc CP i hM hsurplus).oppositeVertexByIndex j ∧
      5 ≤ Dright.packet.oppCap2.card := by
  let S := U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
    (D := D) MT hCirc CP i hM hsurplus
  let Dleaf := counterexampleWithPacket D S
  have hSidx : S.surplusIdx = i := by
    simpa [S] using leaf_surplusIdx_eq MT hCirc CP i hM hsurplus
  have hidx : Dleaf.packet.surplusIdx = i := by
    simpa [Dleaf] using hSidx
  have hjne' : j ≠ Dleaf.packet.surplusIdx := by
    simpa [hidx] using hjne
  obtain ⟨R⟩ := exists_rightOrientedNonSurplusIndex Dleaf j hjne'
  have hcap : Dleaf.packet.capByIndex j = CP.capAt j := by
    simpa [Dleaf, S] using
      leaf_capByIndex_eq_capAt MT hCirc CP i j hM hsurplus
  refine ⟨R.data, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · simpa [Dleaf] using R.carrier_eq
  · simpa [Dleaf, S] using R.surplusCap_eq
  · simpa [Dleaf, S] using R.surplusApex_eq
  · rw [R.targetCap_eq]
    exact hcap
  · simpa [Dleaf, S] using R.targetApex_eq
  · rw [R.targetCap_eq]
    rw [hcap]
    exact hj5

#print axioms nonSurplusSwap_oppApex2_eq
#print axioms nonSurplusSwap_surplusApex_eq
#print axioms exists_completeNonSurplusSwap
#print axioms exists_rightOrientedNonSurplusIndex
#print axioms exists_rightOriented_leaf_secondLargeCap

end ATailBlockerDistinctRadiusScratch
end Problem97
