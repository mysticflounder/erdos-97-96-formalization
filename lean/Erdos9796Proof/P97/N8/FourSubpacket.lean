/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.N8.N8bEndpointPair

/-!
# Four-point subpackets for N8 selected classes

This file starts the finite-set normalization used to replace growing
same-radius classes by four-point subpackets.  The lemmas here are purely
combinatorial: a selected class with cardinality at least four contains a
four-point subset.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace FiniteEndpointShell

/-- A selected same-radius class with at least four members contains a
four-point subpacket. -/
theorem exists_fourSubpacket_of_selected_card_ge_four
    {A : Finset ℝ²} {x : ℝ²} {radius : ℝ}
    (hcard : 4 ≤ (SelectedClass A x radius).card) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A x radius ∧
      T.card = 4 := by
  classical
  rcases Finset.exists_subset_card_eq
      (s := SelectedClass A x radius) hcard with
    ⟨T, hTsub, hTcard⟩
  exact ⟨T, hTsub, hTcard⟩

/-- The selected class attached to an `N8SelectedApex` contains a four-point
subpacket. -/
theorem N8SelectedApex.exists_fourSubpacket
    {A : Finset ℝ²} {S : FiniteEndpointShell A} {i : Fin 3} {x : ℝ²}
    (hx : N8SelectedApex S i x) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 :=
  exists_fourSubpacket_of_selected_card_ge_four hx.selected_card

/-- A selected same-radius class with at least four members contains a
four-point subpacket preserving any already chosen subpacket of size at most
four. -/
theorem exists_fourSubpacket_preserving_of_selected_card_ge_four
    {A : Finset ℝ²} {x : ℝ²} {radius : ℝ} {P : Finset ℝ²}
    (hPsub : P ⊆ SelectedClass A x radius)
    (hPcard : P.card ≤ 4)
    (hcard : 4 ≤ (SelectedClass A x radius).card) :
    ∃ T : Finset ℝ²,
      P ⊆ T ∧
      T ⊆ SelectedClass A x radius ∧
      T.card = 4 := by
  classical
  rcases Finset.exists_subsuperset_card_eq
      (s := P) (t := SelectedClass A x radius) (n := 4)
      hPsub hPcard hcard with
    ⟨T, hP_T, hTsub, hTcard⟩
  exact ⟨T, hP_T, hTsub, hTcard⟩

/-- A selected same-radius class with at least four members contains a
four-point subpacket preserving any chosen member. -/
theorem exists_fourSubpacket_preserving_point_of_selected_card_ge_four
    {A : Finset ℝ²} {x p : ℝ²} {radius : ℝ}
    (hp : p ∈ SelectedClass A x radius)
    (hcard : 4 ≤ (SelectedClass A x radius).card) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x radius ∧
      T.card = 4 := by
  classical
  have hPsub : ({p} : Finset ℝ²) ⊆ SelectedClass A x radius := by
    intro q hq
    have hqp : q = p := by simpa using hq
    simpa [hqp] using hp
  have hPcard : ({p} : Finset ℝ²).card ≤ 4 := by simp
  rcases exists_fourSubpacket_preserving_of_selected_card_ge_four
      hPsub hPcard hcard with
    ⟨T, hpT, hTsub, hTcard⟩
  exact ⟨T, hpT (by simp), hTsub, hTcard⟩

theorem N8SelectedApex.exists_fourSubpacket_preserving_point
    {A : Finset ℝ²} {S : FiniteEndpointShell A} {i : Fin 3} {x p : ℝ²}
    (hx : N8SelectedApex S i x)
    (hp : p ∈ SelectedClass A x hx.radius) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 :=
  exists_fourSubpacket_preserving_point_of_selected_card_ge_four hp hx.selected_card

/- ## Packet-local incidence counts -/

/-- Count Moser vertices inside an arbitrary packet. -/
noncomputable def packetMoserCount
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (T : Finset ℝ²) : ℕ :=
  (T ∩ S.triangle.verts).card

/-- Count own-cap interior points, excluding the apex, inside an arbitrary packet. -/
noncomputable def packetSameCapCount
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (x : ℝ²)
    (T : Finset ℝ²) : ℕ :=
  (T ∩ (S.capInteriorByIndex i).erase x).card

/-- Count left-adjacent-cap interior points inside an arbitrary packet. -/
noncomputable def packetLeftAdjCount
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (T : Finset ℝ²) :
    ℕ :=
  (T ∩ S.leftAdjacentInteriorByIndex i).card

/-- Count right-adjacent-cap interior points inside an arbitrary packet. -/
noncomputable def packetRightAdjCount
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (T : Finset ℝ²) :
    ℕ :=
  (T ∩ S.rightAdjacentInteriorByIndex i).card

private theorem packet_inter_card_le_selected_inter_card
    {T U C : Finset ℝ²} (hTsub : T ⊆ U) :
    (T ∩ C).card ≤ (U ∩ C).card := by
  exact Finset.card_le_card (by
    intro q hq
    exact Finset.mem_inter.mpr
      ⟨hTsub (Finset.mem_of_mem_inter_left hq), Finset.mem_of_mem_inter_right hq⟩)

private theorem inter_card_eq_sum_indicator (T C : Finset ℝ²) :
    (T ∩ C).card = ∑ q ∈ T, (if q ∈ C then 1 else 0) := by
  rw [← Finset.card_filter (fun q => q ∈ C) T]
  rfl

private theorem indicator_le_indicator_of_imp {p q : Prop} [Decidable p] [Decidable q]
    (h : p → q) :
    (if p then 1 else 0 : ℕ) ≤ if q then 1 else 0 := by
  by_cases hp : p <;> simp [hp, h]

private theorem I1_subset_C1 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I1 ⊆ S.CP.C1 := by
  intro q hq
  rw [FiniteEndpointShell.I1] at hq
  exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hq)

private theorem I2_subset_C2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I2 ⊆ S.CP.C2 := by
  intro q hq
  rw [FiniteEndpointShell.I2] at hq
  exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hq)

private theorem I3_subset_C3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I3 ⊆ S.CP.C3 := by
  intro q hq
  rw [FiniteEndpointShell.I3] at hq
  exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hq)

private theorem triangle_v1_not_mem_I1 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v1 ∉ S.I1 := by
  intro h
  have hC : S.triangle.v1 ∈ S.CP.C1 := by
    rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase] at h
    exact h.2.2
  exact S.CP.v1_notin_C1 hC

private theorem triangle_v1_not_mem_I2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v1 ∉ S.I2 := by
  simp [FiniteEndpointShell.I2, FiniteEndpointShell.triangle,
    MEC.MoserTriangle.toStructural]

private theorem triangle_v1_not_mem_I3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v1 ∉ S.I3 := by
  simp [FiniteEndpointShell.I3, FiniteEndpointShell.triangle,
    MEC.MoserTriangle.toStructural]

private theorem triangle_v2_not_mem_I1 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v2 ∉ S.I1 := by
  simp [FiniteEndpointShell.I1, FiniteEndpointShell.triangle,
    MEC.MoserTriangle.toStructural]

private theorem triangle_v2_not_mem_I2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v2 ∉ S.I2 := by
  intro h
  have hC : S.triangle.v2 ∈ S.CP.C2 := by
    rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase] at h
    exact h.2.2
  exact S.CP.v2_notin_C2 hC

private theorem triangle_v2_not_mem_I3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v2 ∉ S.I3 := by
  simp [FiniteEndpointShell.I3, FiniteEndpointShell.triangle,
    MEC.MoserTriangle.toStructural]

private theorem triangle_v3_not_mem_I1 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v3 ∉ S.I1 := by
  simp [FiniteEndpointShell.I1, FiniteEndpointShell.triangle,
    MEC.MoserTriangle.toStructural]

private theorem triangle_v3_not_mem_I2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v3 ∉ S.I2 := by
  simp [FiniteEndpointShell.I2, FiniteEndpointShell.triangle,
    MEC.MoserTriangle.toStructural]

private theorem triangle_v3_not_mem_I3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v3 ∉ S.I3 := by
  intro h
  have hC : S.triangle.v3 ∈ S.CP.C3 := by
    rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase] at h
    exact h.2.2
  exact S.CP.v3_notin_C3 hC

/-- Packet-local Moser count is bounded by the corresponding full selected-class count. -/
theorem packetMoserCount_le_selected
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²} {radius : ℝ}
    {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetMoserCount T ≤ (SelectedClass A x radius ∩ S.triangle.verts).card := by
  exact packet_inter_card_le_selected_inter_card hTsub

/-- Packet-local same-cap count is bounded by the corresponding full selected-class count. -/
theorem packetSameCapCount_le_selected
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetSameCapCount i x T ≤
      (SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x).card := by
  exact packet_inter_card_le_selected_inter_card hTsub

/-- Packet-local left-adjacent count is bounded by the corresponding full selected-class count. -/
theorem packetLeftAdjCount_le_selected
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetLeftAdjCount i T ≤
      (SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i).card := by
  exact packet_inter_card_le_selected_inter_card hTsub

/-- Packet-local right-adjacent count is bounded by the corresponding full selected-class count. -/
theorem packetRightAdjCount_le_selected
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²} {radius : ℝ}
    (i : Fin 3) {T : Finset ℝ²} (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetRightAdjCount i T ≤
      (SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i).card := by
  exact packet_inter_card_le_selected_inter_card hTsub

/-- A packet member that is a Moser vertex contributes one to the packet Moser count. -/
theorem one_le_packetMoserCount_of_mem
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {T : Finset ℝ²} {p : ℝ²}
    (hpT : p ∈ T) (hpM : p ∈ S.triangle.verts) :
    1 ≤ S.packetMoserCount T := by
  unfold packetMoserCount
  exact Finset.card_pos.mpr ⟨p, Finset.mem_inter.mpr ⟨hpT, hpM⟩⟩

/-- A packet member in the same-cap erasure contributes one to the packet
same-cap count. -/
theorem one_le_packetSameCapCount_of_mem
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) {x p : ℝ²}
    {T : Finset ℝ²} (hpT : p ∈ T) (hpI : p ∈ (S.capInteriorByIndex i).erase x) :
    1 ≤ S.packetSameCapCount i x T := by
  unfold packetSameCapCount
  exact Finset.card_pos.mpr ⟨p, Finset.mem_inter.mpr ⟨hpT, hpI⟩⟩

/-- A packet member in the left-adjacent cap interior contributes one to the
packet left-adjacent count. -/
theorem one_le_packetLeftAdjCount_of_mem
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) {T : Finset ℝ²}
    {p : ℝ²} (hpT : p ∈ T) (hpI : p ∈ S.leftAdjacentInteriorByIndex i) :
    1 ≤ S.packetLeftAdjCount i T := by
  unfold packetLeftAdjCount
  exact Finset.card_pos.mpr ⟨p, Finset.mem_inter.mpr ⟨hpT, hpI⟩⟩

/-- A packet member in the right-adjacent cap interior contributes one to the
packet right-adjacent count. -/
theorem one_le_packetRightAdjCount_of_mem
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) {T : Finset ℝ²}
    {p : ℝ²} (hpT : p ∈ T) (hpI : p ∈ S.rightAdjacentInteriorByIndex i) :
    1 ≤ S.packetRightAdjCount i T := by
  unfold packetRightAdjCount
  exact Finset.card_pos.mpr ⟨p, Finset.mem_inter.mpr ⟨hpT, hpI⟩⟩

/-- Packet-local disjoint-cover budget.  Any packet contained in a positive-radius
selected class is covered by its Moser, same-cap, left-adjacent, and right-adjacent
subfamilies.  This deliberately proves the additive bound; equality requires a
separate disjointness layer. -/
theorem packet_card_le_groupSum
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ} {T : Finset ℝ²}
    (hradius_pos : 0 < radius) (hTsub : T ⊆ SelectedClass A x radius) :
    T.card ≤
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T := by
  classical
  have hx_notin_selected : x ∉ SelectedClass A x radius := by
    intro hh
    have hdist : dist x x = radius := (mem_selectedClass.mp hh).2
    rw [dist_self] at hdist
    linarith
  have hchain : ∀ (P Q R U : Finset ℝ²),
      T ⊆ P ∪ Q ∪ R ∪ U →
      T.card ≤ P.card + Q.card + R.card + U.card := by
    intro P Q R U hsub
    calc T.card
        ≤ (P ∪ Q ∪ R ∪ U).card := Finset.card_le_card hsub
      _ ≤ P.card + Q.card + R.card + U.card := by
          refine le_trans (Finset.card_union_le _ _) ?_
          refine add_le_add (le_trans (Finset.card_union_le _ _) ?_) le_rfl
          exact add_le_add (Finset.card_union_le _ _) le_rfl
  have hqfacts : ∀ q ∈ T, q ∉ S.triangle.verts →
      q ∈ S.I1 ∨ q ∈ S.I2 ∨ q ∈ S.I3 := by
    intro q hq hqv
    have hqsel : q ∈ SelectedClass A x radius := hTsub hq
    have hqA : q ∈ A := (mem_selectedClass.mp hqsel).1
    have hone := S.CP.nonmoser_in_one q hqA hqv
    have hqnv : q ≠ S.triangle.v1 ∧ q ≠ S.triangle.v2 ∧ q ≠ S.triangle.v3 := by
      simp only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton] at hqv
      push_neg at hqv
      exact hqv
    by_cases h1 : q ∈ S.CP.C1
    · refine Or.inl ?_
      rw [FiniteEndpointShell.I1, Finset.mem_erase, Finset.mem_erase]
      exact ⟨hqnv.2.2, hqnv.2.1, h1⟩
    · by_cases h2 : q ∈ S.CP.C2
      · refine Or.inr (Or.inl ?_)
        rw [FiniteEndpointShell.I2, Finset.mem_erase, Finset.mem_erase]
        exact ⟨hqnv.1, hqnv.2.2, h2⟩
      · have h3 : q ∈ S.CP.C3 := by
          by_contra h3
          simp only [if_neg h1, if_neg h2, if_neg h3] at hone
          omega
        refine Or.inr (Or.inr ?_)
        rw [FiniteEndpointShell.I3, Finset.mem_erase, Finset.mem_erase]
        exact ⟨hqnv.2.1, hqnv.1, h3⟩
  change T.card ≤
      (T ∩ S.triangle.verts).card +
        (T ∩ (S.capInteriorByIndex i).erase x).card +
        (T ∩ S.leftAdjacentInteriorByIndex i).card +
        (T ∩ S.rightAdjacentInteriorByIndex i).card
  fin_cases i <;>
  · apply hchain
    intro q hq
    have hqsel : q ∈ SelectedClass A x radius := hTsub hq
    have hqx : q ≠ x := fun h => hx_notin_selected (h ▸ hqsel)
    by_cases hqv : q ∈ S.triangle.verts
    · exact Finset.mem_union_left _ (Finset.mem_union_left _ (Finset.mem_union_left _
        (Finset.mem_inter.mpr ⟨hq, hqv⟩)))
    · rcases hqfacts q hq hqv with hI | hI | hI <;>
      simp only [capInteriorByIndex, leftAdjacentInteriorByIndex,
        rightAdjacentInteriorByIndex] <;>
      first
      | (refine Finset.mem_union_left _ (Finset.mem_union_left _ (Finset.mem_union_right _ ?_))
         exact Finset.mem_inter.mpr ⟨hq, Finset.mem_erase.mpr ⟨hqx, hI⟩⟩)
      | (refine Finset.mem_union_left _ (Finset.mem_union_right _ ?_)
         exact Finset.mem_inter.mpr ⟨hq, hI⟩)
      | (refine Finset.mem_union_right _ ?_
         exact Finset.mem_inter.mpr ⟨hq, hI⟩)

/-- The packet groups do not over-count a selected packet.  Moser vertices are
counted only in the Moser group, and each non-Moser selected point lies in
exactly one of the three open cap interiors. -/
theorem packet_groupSum_le_card
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ} {T : Finset ℝ²}
    (hradius_pos : 0 < radius) (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T ≤ T.card := by
  classical
  have hx_notin_selected : x ∉ SelectedClass A x radius := by
    intro hh
    have hdist : dist x x = radius := (mem_selectedClass.mp hh).2
    rw [dist_self] at hdist
    linarith
  unfold packetMoserCount packetSameCapCount packetLeftAdjCount packetRightAdjCount
  rw [inter_card_eq_sum_indicator T S.triangle.verts]
  rw [inter_card_eq_sum_indicator T ((S.capInteriorByIndex i).erase x)]
  rw [inter_card_eq_sum_indicator T (S.leftAdjacentInteriorByIndex i)]
  rw [inter_card_eq_sum_indicator T (S.rightAdjacentInteriorByIndex i)]
  rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
  rw [Finset.card_eq_sum_ones]
  apply Finset.sum_le_sum
  intro q hq
  have hqsel : q ∈ SelectedClass A x radius := hTsub hq
  have hqx : q ≠ x := fun h => hx_notin_selected (h ▸ hqsel)
  by_cases hqv : q ∈ S.triangle.verts
  · simp only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton] at hqv
    fin_cases i <;> rcases hqv with rfl | rfl | rfl <;>
      simp [capInteriorByIndex, leftAdjacentInteriorByIndex, rightAdjacentInteriorByIndex,
        MoserTriangle.verts, triangle_v1_not_mem_I1 S, triangle_v1_not_mem_I2 S,
        triangle_v1_not_mem_I3 S, triangle_v2_not_mem_I1 S,
        triangle_v2_not_mem_I2 S, triangle_v2_not_mem_I3 S,
        triangle_v3_not_mem_I1 S, triangle_v3_not_mem_I2 S,
        triangle_v3_not_mem_I3 S]
  · have hqA : q ∈ A := (mem_selectedClass.mp hqsel).1
    have hone := S.CP.nonmoser_in_one q hqA hqv
    have hM0 : (if q ∈ S.triangle.verts then 1 else 0 : ℕ) = 0 := by
      simp [hqv]
    have hI1e :
        (if q ∈ S.I1.erase x then 1 else 0 : ℕ) ≤
          if q ∈ S.CP.C1 then 1 else 0 :=
      indicator_le_indicator_of_imp (fun h => I1_subset_C1 S (Finset.mem_of_mem_erase h))
    have hI2e :
        (if q ∈ S.I2.erase x then 1 else 0 : ℕ) ≤
          if q ∈ S.CP.C2 then 1 else 0 :=
      indicator_le_indicator_of_imp (fun h => I2_subset_C2 S (Finset.mem_of_mem_erase h))
    have hI3e :
        (if q ∈ S.I3.erase x then 1 else 0 : ℕ) ≤
          if q ∈ S.CP.C3 then 1 else 0 :=
      indicator_le_indicator_of_imp (fun h => I3_subset_C3 S (Finset.mem_of_mem_erase h))
    have hI1 :
        (if q ∈ S.I1 then 1 else 0 : ℕ) ≤ if q ∈ S.CP.C1 then 1 else 0 :=
      indicator_le_indicator_of_imp (fun h => I1_subset_C1 S h)
    have hI2 :
        (if q ∈ S.I2 then 1 else 0 : ℕ) ≤ if q ∈ S.CP.C2 then 1 else 0 :=
      indicator_le_indicator_of_imp (fun h => I2_subset_C2 S h)
    have hI3 :
        (if q ∈ S.I3 then 1 else 0 : ℕ) ≤ if q ∈ S.CP.C3 then 1 else 0 :=
      indicator_le_indicator_of_imp (fun h => I3_subset_C3 S h)
    fin_cases i <;>
      simp only [capInteriorByIndex, leftAdjacentInteriorByIndex,
        rightAdjacentInteriorByIndex] <;>
      omega

/-- Exact packet incidence budget.  A positive-radius selected packet is
partitioned by the Moser, same-cap, left-adjacent, and right-adjacent groups. -/
theorem packet_groupSum_eq_card
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ} {T : Finset ℝ²}
    (hradius_pos : 0 < radius) (hTsub : T ⊆ SelectedClass A x radius) :
    S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = T.card := by
  exact le_antisymm (S.packet_groupSum_le_card i hradius_pos hTsub)
    (S.packet_card_le_groupSum i hradius_pos hTsub)

/-- A four-point packet in a positive-radius selected class has additive packet
budget at least four. -/
theorem four_le_packet_groupSum_of_card
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ} {T : Finset ℝ²}
    (hradius_pos : 0 < radius) (hTsub : T ⊆ SelectedClass A x radius)
    (hTcard : T.card = 4) :
    4 ≤
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T := by
  rw [← hTcard]
  exact S.packet_card_le_groupSum i hradius_pos hTsub

/-- A four-point selected packet has exact primitive incidence budget `4`. -/
theorem packet_groupSum_eq_four_of_card
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {x : ℝ²} (i : Fin 3) {radius : ℝ} {T : Finset ℝ²}
    (hradius_pos : 0 < radius) (hTsub : T ⊆ SelectedClass A x radius)
    (hTcard : T.card = 4) :
    S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rw [S.packet_groupSum_eq_card i hradius_pos hTsub, hTcard]

/-- The four-point subpacket attached to an `N8SelectedApex` can be chosen with
the exact primitive incidence budget. -/
theorem N8SelectedApex.exists_fourSubpacket_with_packet_budget
    {A : Finset ℝ²} {S : FiniteEndpointShell A} {i : Fin 3} {x : ℝ²}
    (hx : N8SelectedApex S i x) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rcases N8SelectedApex.exists_fourSubpacket hx with ⟨T, hTsub, hTcard⟩
  exact ⟨T, hTsub, hTcard,
    S.packet_groupSum_eq_four_of_card i hx.radius_pos hTsub hTcard⟩

/-- The four-point subpacket attached to an `N8SelectedApex` can preserve a
chosen selected point and still carry the exact primitive incidence budget. -/
theorem N8SelectedApex.exists_fourSubpacket_preserving_point_with_packet_budget
    {A : Finset ℝ²} {S : FiniteEndpointShell A} {i : Fin 3} {x p : ℝ²}
    (hx : N8SelectedApex S i x)
    (hp : p ∈ SelectedClass A x hx.radius) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rcases N8SelectedApex.exists_fourSubpacket_preserving_point hx hp with
    ⟨T, hpT, hTsub, hTcard⟩
  exact ⟨T, hpT, hTsub, hTcard,
    S.packet_groupSum_eq_four_of_card i hx.radius_pos hTsub hTcard⟩

/-- A selected left-adjacent point can be preserved in a four-point packet, where
it contributes to the packet left-adjacent count. -/
theorem N8SelectedApex.exists_fourSubpacket_preserving_left_point_with_packet_budget
    {A : Finset ℝ²} {S : FiniteEndpointShell A} {i : Fin 3} {x p : ℝ²}
    (hx : N8SelectedApex S i x)
    (hp : p ∈ SelectedClass A x hx.radius ∩ S.leftAdjacentInteriorByIndex i) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      1 ≤ S.packetLeftAdjCount i T ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rcases N8SelectedApex.exists_fourSubpacket_preserving_point_with_packet_budget hx
      (Finset.mem_of_mem_inter_left hp) with
    ⟨T, hpT, hTsub, hTcard, hbudget⟩
  exact ⟨T, hpT, hTsub, hTcard,
    S.one_le_packetLeftAdjCount_of_mem i hpT (Finset.mem_of_mem_inter_right hp),
    hbudget⟩

/-- A selected right-adjacent point can be preserved in a four-point packet, where
it contributes to the packet right-adjacent count. -/
theorem N8SelectedApex.exists_fourSubpacket_preserving_right_point_with_packet_budget
    {A : Finset ℝ²} {S : FiniteEndpointShell A} {i : Fin 3} {x p : ℝ²}
    (hx : N8SelectedApex S i x)
    (hp : p ∈ SelectedClass A x hx.radius ∩ S.rightAdjacentInteriorByIndex i) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      1 ≤ S.packetRightAdjCount i T ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  rcases N8SelectedApex.exists_fourSubpacket_preserving_point_with_packet_budget hx
      (Finset.mem_of_mem_inter_left hp) with
    ⟨T, hpT, hTsub, hTcard, hbudget⟩
  exact ⟨T, hpT, hTsub, hTcard,
    S.one_le_packetRightAdjCount_of_mem i hpT (Finset.mem_of_mem_inter_right hp),
    hbudget⟩

/-- Selected left- and right-adjacent points can be preserved together in a
four-point packet.  The resulting primitive row has nonzero left and right
adjacent counts and exact packet budget `4`. -/
theorem N8SelectedApex.exists_fourSubpacket_preserving_left_right_points_with_packet_budget
    {A : Finset ℝ²} {S : FiniteEndpointShell A} {i : Fin 3}
    {x pL pR : ℝ²}
    (hx : N8SelectedApex S i x)
    (hpL : pL ∈ SelectedClass A x hx.radius ∩ S.leftAdjacentInteriorByIndex i)
    (hpR : pR ∈ SelectedClass A x hx.radius ∩ S.rightAdjacentInteriorByIndex i) :
    ∃ T : Finset ℝ²,
      pL ∈ T ∧
      pR ∈ T ∧
      T ⊆ SelectedClass A x hx.radius ∧
      T.card = 4 ∧
      1 ≤ S.packetLeftAdjCount i T ∧
      1 ≤ S.packetRightAdjCount i T ∧
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4 := by
  classical
  let P : Finset ℝ² := {pL, pR}
  have hPsub : P ⊆ SelectedClass A x hx.radius := by
    intro q hq
    simp only [P, Finset.mem_insert, Finset.mem_singleton] at hq
    rcases hq with rfl | rfl
    · exact Finset.mem_of_mem_inter_left hpL
    · exact Finset.mem_of_mem_inter_left hpR
  have hPcard : P.card ≤ 4 := by
    dsimp [P]
    by_cases h : pL = pR
    · subst h
      simp
    · simp [h]
  rcases exists_fourSubpacket_preserving_of_selected_card_ge_four
      hPsub hPcard hx.selected_card with
    ⟨T, hP_T, hTsub, hTcard⟩
  have hpLT : pL ∈ T := hP_T (by simp [P])
  have hpRT : pR ∈ T := hP_T (by simp [P])
  exact ⟨T, hpLT, hpRT, hTsub, hTcard,
    S.one_le_packetLeftAdjCount_of_mem i hpLT (Finset.mem_of_mem_inter_right hpL),
    S.one_le_packetRightAdjCount_of_mem i hpRT (Finset.mem_of_mem_inter_right hpR),
    S.packet_groupSum_eq_four_of_card i hx.radius_pos hTsub hTcard⟩

/-- Packet arithmetic with left and right singleton rows.  Under the exact
four-point budget, a Moser bound `m <= 2`, a same-cap bound `s <= 1`, and
left/right rows equal to `1`, only the two primitive rows `(1,1,1,1)` and
`(2,0,1,1)` remain. -/
theorem packet_left_right_primitive_cases
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {i : Fin 3} {x : ℝ²}
    {T : Finset ℝ²}
    (hbudget :
      S.packetMoserCount T + S.packetSameCapCount i x T +
        S.packetLeftAdjCount i T + S.packetRightAdjCount i T = 4)
    (hm : S.packetMoserCount T ≤ 2)
    (hs : S.packetSameCapCount i x T ≤ 1)
    (hl : S.packetLeftAdjCount i T = 1)
    (hr : S.packetRightAdjCount i T = 1) :
    (S.packetMoserCount T = 1 ∧
      S.packetSameCapCount i x T = 1 ∧
      S.packetLeftAdjCount i T = 1 ∧
      S.packetRightAdjCount i T = 1) ∨
    (S.packetMoserCount T = 2 ∧
      S.packetSameCapCount i x T = 0 ∧
      S.packetLeftAdjCount i T = 1 ∧
      S.packetRightAdjCount i T = 1) := by
  omega

end FiniteEndpointShell

end Problem97
