/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler

/-!
# A necessary MEC-boundary condition for an alternative `IsM44` packet

On the large-opposite-caps parent, all three caps of the displayed support
triangle have cardinality at least five.  If the carrier has exactly three
MEC-boundary vertices, every same-carrier circumscribed support triangle is a
relabeling of those three vertices.  Its arc-defined cap triple therefore has
the same three caps, up to permutation, and cannot be `IsM44`.

Consequently, any genuinely alternative `IsM44` packet on this parent forces
at least four MEC-boundary vertices.  This isolates the first geometric datum
which a `noM44` producer must obtain before exact-four cap counting can begin.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailAlternativeM44ConstructorScratch

open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

private theorem onArcOpposite_swap_chord (vi vj vk v : ℝ²) :
    OnArcOpposite vi vj vk v ↔ OnArcOpposite vi vk vj v := by
  unfold OnArcOpposite
  have hv : signedArea2 v vk vj = -signedArea2 v vj vk := by
    simp [signedArea2]
  have hi : signedArea2 vi vk vj = -signedArea2 vi vj vk := by
    simp [signedArea2]
  rw [hv, hi, neg_mul_neg]

private theorem supportTriangle_verts_subset_boundary
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.triangle.verts ⊆ MEC.boundary A S.hA := by
  intro x hx
  simp only [MoserTriangle.verts, Finset.mem_insert,
    Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl
  · exact (MEC.mem_boundary_iff S.hA).2
      ⟨S.triangle.v1_mem, S.triangleNonObtuse.toMoserTriangle.v1_boundary⟩
  · exact (MEC.mem_boundary_iff S.hA).2
      ⟨S.triangle.v2_mem, S.triangleNonObtuse.toMoserTriangle.v2_boundary⟩
  · exact (MEC.mem_boundary_iff S.hA).2
      ⟨S.triangle.v3_mem, S.triangleNonObtuse.toMoserTriangle.v3_boundary⟩

private theorem cap_eq_of_same_supportVertices
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    {a b c : ℝ²} {C : Finset ℝ²}
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (ha : a ∈ S.triangle.verts)
    (hb : b ∈ S.triangle.verts)
    (hc : c ∈ S.triangle.verts)
    (hC_subset : C ⊆ A)
    (hC_arc : ∀ x ∈ A, x ∈ C ↔ OnArcOpposite a b c x) :
    C = S.partition.C1 ∨ C = S.partition.C2 ∨ C = S.partition.C3 := by
  simp only [MoserTriangle.verts, Finset.mem_insert,
    Finset.mem_singleton] at ha hb hc
  rcases ha with ha | ha | ha
  · subst a
    rcases hb with hb | hb | hb
    · subst b
      exact (hab rfl).elim
    · subst b
      rcases hc with hc | hc | hc
      · subst c
        exact (hac rfl).elim
      · subst c
        exact (hbc rfl).elim
      · subst c
        left
        apply Finset.ext
        intro x
        by_cases hxA : x ∈ A
        · rw [hC_arc x hxA, (S.partition.arc_membership x hxA).1]
        · constructor
          · exact fun hx ↦ False.elim (hxA (hC_subset hx))
          · exact fun hx ↦ False.elim (hxA (S.partition.C1_subset hx))
    · subst b
      rcases hc with hc | hc | hc
      · subst c
        exact (hac rfl).elim
      · subst c
        left
        apply Finset.ext
        intro x
        by_cases hxA : x ∈ A
        · rw [hC_arc x hxA, (S.partition.arc_membership x hxA).1]
          exact onArcOpposite_swap_chord _ _ _ _
        · constructor
          · exact fun hx ↦ False.elim (hxA (hC_subset hx))
          · exact fun hx ↦ False.elim (hxA (S.partition.C1_subset hx))
      · subst c
        exact (hbc rfl).elim
  · subst a
    rcases hb with hb | hb | hb
    · subst b
      rcases hc with hc | hc | hc
      · subst c
        exact (hbc rfl).elim
      · subst c
        exact (hac rfl).elim
      · subst c
        right
        left
        apply Finset.ext
        intro x
        by_cases hxA : x ∈ A
        · rw [hC_arc x hxA, (S.partition.arc_membership x hxA).2.1]
        · constructor
          · exact fun hx ↦ False.elim (hxA (hC_subset hx))
          · exact fun hx ↦ False.elim (hxA (S.partition.C2_subset hx))
    · subst b
      exact (hab rfl).elim
    · subst b
      rcases hc with hc | hc | hc
      · subst c
        right
        left
        apply Finset.ext
        intro x
        by_cases hxA : x ∈ A
        · rw [hC_arc x hxA, (S.partition.arc_membership x hxA).2.1]
          exact onArcOpposite_swap_chord _ _ _ _
        · constructor
          · exact fun hx ↦ False.elim (hxA (hC_subset hx))
          · exact fun hx ↦ False.elim (hxA (S.partition.C2_subset hx))
      · subst c
        exact (hac rfl).elim
      · subst c
        exact (hbc rfl).elim
  · subst a
    rcases hb with hb | hb | hb
    · subst b
      rcases hc with hc | hc | hc
      · subst c
        exact (hbc rfl).elim
      · subst c
        right
        right
        apply Finset.ext
        intro x
        by_cases hxA : x ∈ A
        · rw [hC_arc x hxA, (S.partition.arc_membership x hxA).2.2]
        · constructor
          · exact fun hx ↦ False.elim (hxA (hC_subset hx))
          · exact fun hx ↦ False.elim (hxA (S.partition.C3_subset hx))
    · subst b
      rcases hc with hc | hc | hc
      · subst c
        right
        right
        apply Finset.ext
        intro x
        by_cases hxA : x ∈ A
        · rw [hC_arc x hxA, (S.partition.arc_membership x hxA).2.2]
          exact onArcOpposite_swap_chord _ _ _ _
        · constructor
          · exact fun hx ↦ False.elim (hxA (hC_subset hx))
          · exact fun hx ↦ False.elim (hxA (S.partition.C3_subset hx))
      · subst c
        exact (hbc rfl).elim
      · subst c
        exact (hac rfl).elim
    · subst b
      exact (hab rfl).elim

private theorem displayed_caps_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    5 ≤ S.partition.C1.card ∧
      5 ≤ S.partition.C2.card ∧
        5 ≤ S.partition.C3.card := by
  have hsurplus : 5 ≤ S.surplusCap.card := by
    exact Nat.succ_le_iff.mpr S.surplus_card_gt_four
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsurplus L ⊢ <;>
    omega

private theorem all_caps_card_ge_five_of_same_supportVertices
    {A : Finset ℝ²} (S T : SurplusCapPacket A)
    (hlarge : 5 ≤ S.partition.C1.card ∧
      5 ≤ S.partition.C2.card ∧
        5 ≤ S.partition.C3.card)
    (hverts : T.triangle.verts = S.triangle.verts) :
    5 ≤ T.partition.C1.card ∧
      5 ≤ T.partition.C2.card ∧
        5 ≤ T.partition.C3.card := by
  have hv1 : T.triangle.v1 ∈ S.triangle.verts := by
    rw [← hverts]
    simp [MoserTriangle.verts]
  have hv2 : T.triangle.v2 ∈ S.triangle.verts := by
    rw [← hverts]
    simp [MoserTriangle.verts]
  have hv3 : T.triangle.v3 ∈ S.triangle.verts := by
    rw [← hverts]
    simp [MoserTriangle.verts]
  have hC1 := cap_eq_of_same_supportVertices S T.triangle.v12_ne
    T.triangle.v13_ne T.triangle.v23_ne hv1 hv2 hv3
    T.partition.C1_subset (fun x hx ↦ (T.partition.arc_membership x hx).1)
  have hC2 := cap_eq_of_same_supportVertices S T.triangle.v23_ne
    T.triangle.v12_ne.symm T.triangle.v13_ne.symm hv2 hv3 hv1
    T.partition.C2_subset (fun x hx ↦ (T.partition.arc_membership x hx).2.1)
  have hC3 := cap_eq_of_same_supportVertices S T.triangle.v13_ne.symm
    T.triangle.v23_ne.symm T.triangle.v12_ne hv3 hv1 hv2
    T.partition.C3_subset (fun x hx ↦ (T.partition.arc_membership x hx).2.2)
  constructor
  · rcases hC1 with rfl | rfl | rfl <;> omega
  constructor
  · rcases hC2 with rfl | rfl | rfl <;> omega
  · rcases hC3 with rfl | rfl | rfl <;> omega

/-- Any alternative same-carrier `IsM44` packet on the large-opposite-caps
parent forces a fourth MEC-boundary vertex.  Thus a useful application of
`R.noM44` must first prove strictly more than the standard three-boundary-point
circumscribed branch supplied by global K4. -/
theorem boundary_card_ge_four_of_isM44
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (T : SurplusCapPacket D.A) (hT : T.IsM44) :
    4 ≤ (MEC.boundary D.A D.nonempty).card := by
  by_contra hfour
  have hSsub : S.triangle.verts ⊆ MEC.boundary D.A D.nonempty := by
    simpa only using supportTriangle_verts_subset_boundary S
  have hTsub : T.triangle.verts ⊆ MEC.boundary D.A D.nonempty := by
    simpa only using supportTriangle_verts_subset_boundary T
  have hSCard : S.triangle.verts.card = 3 := S.triangle.verts_card
  have hTCard : T.triangle.verts.card = 3 := T.triangle.verts_card
  have hBoundaryCard : (MEC.boundary D.A D.nonempty).card = 3 := by
    have hthree := Finset.card_le_card hSsub
    omega
  have hSBoundary : S.triangle.verts = MEC.boundary D.A D.nonempty :=
    Finset.eq_of_subset_of_card_le hSsub (by omega)
  have hTBoundary : T.triangle.verts = MEC.boundary D.A D.nonempty :=
    Finset.eq_of_subset_of_card_le hTsub (by omega)
  have hverts : T.triangle.verts = S.triangle.verts :=
    hTBoundary.trans hSBoundary.symm
  have hlargeT := all_caps_card_ge_five_of_same_supportVertices S T
    (displayed_caps_card_ge_five L) hverts
  rcases hi : T.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp only [SurplusCapPacket.IsM44, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hT <;>
    omega

#print axioms boundary_card_ge_four_of_isM44

end ATailAlternativeM44ConstructorScratch
end Problem97
