/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.N9Endpoint.N4a
import Erdos9796Proof.P97.CircumscribedMECPacket
import Erdos9796Proof.P97.Cap.Structure

/-!
# Generic cap lower bounds at a circumscribed non-obtuse Moser triangle

Generic-`A` port of the `n = 9` shell interior counts
(`FiniteEndpointShell.I1/I2/I3_card_ge_two` and `I1/I2/I3_card` from
`Erdos9796Proof.P97.N9Endpoint.Shell`): every cap of a `CapTriple` over a
circumscribed non-obtuse Moser triangle contains at least four points of `A`,
from `ConvexIndep`, noncollinearity, and the `K4` property alone.  The shell
originals consume no `A.card = 9` or cap-sum-12 facts; this file records the
same proofs with the shell fields replaced by explicit `(M, CP, P)`
parameters, so the bounds apply on the `9 < A.card` branch.

Consumed by `Erdos9796Proof.P97.U1LargeCapRouteBTail` to produce
`OppositeCapLowerBoundsAt` for the U1.2 residual.
-/

open scoped EuclideanGeometry
open scoped InnerProductSpace
open Finset

namespace Problem97

namespace U1OppositeCapLowerBounds

variable {A : Finset ℝ²}

/-- Cyclic rotation of a structural Moser triangle with apex `v₂`. -/
@[reducible] def rot2 (M : MoserTriangle A) : MoserTriangle A :=
  { v1 := M.v2
    v2 := M.v3
    v3 := M.v1
    v1_mem := M.v2_mem
    v2_mem := M.v3_mem
    v3_mem := M.v1_mem
    v12_ne := M.v23_ne
    v13_ne := M.v12_ne.symm
    v23_ne := M.v13_ne.symm }

/-- Cyclic rotation of a structural Moser triangle with apex `v₃`. -/
@[reducible] def rot3 (M : MoserTriangle A) : MoserTriangle A :=
  { v1 := M.v3
    v2 := M.v1
    v3 := M.v2
    v1_mem := M.v3_mem
    v2_mem := M.v1_mem
    v3_mem := M.v2_mem
    v12_ne := M.v13_ne.symm
    v13_ne := M.v23_ne.symm
    v23_ne := M.v12_ne }

/-- The circumscribed packet rotated to `rot2 M`. -/
@[reducible] def packetRot2 {M : MoserTriangle A}
    (P : CircumscribedMECPacket A M) :
    CircumscribedMECPacket A (rot2 M) :=
  { center := P.center
    radius := P.radius
    radius_pos := P.radius_pos
    moser_on_boundary_1 := P.moser_on_boundary_2
    moser_on_boundary_2 := P.moser_on_boundary_3
    moser_on_boundary_3 := P.moser_on_boundary_1
    inner_at_v1 := P.inner_at_v2
    inner_at_v2 := P.inner_at_v3
    inner_at_v3 := P.inner_at_v1
    disk_contains_A := P.disk_contains_A }

/-- The circumscribed packet rotated to `rot3 M`. -/
@[reducible] def packetRot3 {M : MoserTriangle A}
    (P : CircumscribedMECPacket A M) :
    CircumscribedMECPacket A (rot3 M) :=
  { center := P.center
    radius := P.radius
    radius_pos := P.radius_pos
    moser_on_boundary_1 := P.moser_on_boundary_3
    moser_on_boundary_2 := P.moser_on_boundary_1
    moser_on_boundary_3 := P.moser_on_boundary_2
    inner_at_v1 := P.inner_at_v3
    inner_at_v2 := P.inner_at_v1
    inner_at_v3 := P.inner_at_v2
    disk_contains_A := P.disk_contains_A }

/-- The open interior of the first cap, i.e. `C₁ \ {v₂, v₃}`. -/
@[reducible] noncomputable def interior1 {M : MoserTriangle A}
    (CP : CapTriple A M) : Finset ℝ² :=
  (CP.C1.erase M.v2).erase M.v3

/-- The open interior of the second cap, i.e. `C₂ \ {v₃, v₁}`. -/
@[reducible] noncomputable def interior2 {M : MoserTriangle A}
    (CP : CapTriple A M) : Finset ℝ² :=
  (CP.C2.erase M.v3).erase M.v1

/-- The open interior of the third cap, i.e. `C₃ \ {v₁, v₂}`. -/
@[reducible] noncomputable def interior3 {M : MoserTriangle A}
    (CP : CapTriple A M) : Finset ℝ² :=
  (CP.C3.erase M.v1).erase M.v2

/-- `N4a/N4b` bridge at the first cap: the `K4` class at `v₁` places two
points in the open interior of `C₁`. -/
theorem interior1_card_ge_two
    {M : MoserTriangle A} (CP : CapTriple A M)
    (hconv : ConvexIndep A)
    (hnoncol : ¬ Collinear ℝ (A : Set ℝ²))
    (hK4 : HasNEquidistantProperty 4 A)
    (P : CircumscribedMECPacket A M) :
    2 ≤ (interior1 CP).card := by
  classical
  rcases hK4 M.v1 M.v1_mem with ⟨r, hrpos, hTcard⟩
  let T : Finset ℝ² := A.filter (fun x => dist M.v1 x = r)
  have hv1_not_mem_T : M.v1 ∉ T := by
    intro hv1T
    have hv1eq : dist M.v1 M.v1 = r := (Finset.mem_filter.mp hv1T).2
    have h0r : (0 : ℝ) = r := by simpa using hv1eq
    nlinarith
  have hC2_one : (T ∩ CP.C2).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := CP.C2) (M := rot2 M)
      hconv hnoncol CP.C2_subset
      (fun x hxA => (CP.arc_membership x hxA).2.1)
      CP.v3_mem_C2 CP.v1_mem_C2 (packetRot2 P) (packetRot2 P).inner_at_v1
      (S := T ∩ CP.C2) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hC3_one : (T ∩ CP.C3).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := CP.C3) (M := rot3 M)
      hconv hnoncol CP.C3_subset
      (fun x hxA => (CP.arc_membership x hxA).2.2)
      CP.v1_mem_C3 CP.v2_mem_C3 (packetRot3 P) (packetRot3 P).inner_at_v1
      (S := T ∩ CP.C3) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hcover :
      T \ interior1 CP ⊆ (T ∩ CP.C2) ∪ (T ∩ CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI1⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv3 : x = M.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using CP.v3_mem_C2⟩
    by_cases hxv2 : x = M.v2
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using CP.v2_mem_C3⟩
    by_cases hxv1 : x = M.v1
    · exact False.elim (hv1_not_mem_T (hxv1 ▸ hxT))
    have hxnonmoser : x ∉ M.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC1 : x ∉ CP.C1 := by
      intro hxC1
      have hxI1 : x ∈ interior1 CP := by
        unfold interior1
        exact Finset.mem_erase.mpr ⟨hxv3, Finset.mem_erase.mpr ⟨hxv2, hxC1⟩⟩
      exact hxnotI1 hxI1
    have hone := CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC2 : x ∈ CP.C2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, hxC2⟩
    · have hxC3 : x ∈ CP.C3 := by
        by_cases hxC3 : x ∈ CP.C3
        · exact hxC3
        · simp [hxnotC1, hxC2, hxC3] at hone
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, hxC3⟩
  have houtside_le :
      (T \ interior1 CP).card ≤ 2 := by
    calc
      (T \ interior1 CP).card ≤ ((T ∩ CP.C2) ∪ (T ∩ CP.C3)).card :=
        Finset.card_le_card hcover
      _ ≤ (T ∩ CP.C2).card + (T ∩ CP.C3).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit :
      (T \ interior1 CP).card + (T ∩ interior1 CP).card = T.card := by
    simpa [Finset.inter_comm] using
      Finset.card_sdiff_add_card_inter T (interior1 CP)
  have hinter_le : (T ∩ interior1 CP).card ≤ (interior1 CP).card :=
    Finset.card_le_card Finset.inter_subset_right
  have hTfour : 4 ≤ T.card := by
    simpa [T] using hTcard
  omega

/-- `N4a/N4b` bridge at the second cap: the `K4` class at `v₂` places two
points in the open interior of `C₂`. -/
theorem interior2_card_ge_two
    {M : MoserTriangle A} (CP : CapTriple A M)
    (hconv : ConvexIndep A)
    (hnoncol : ¬ Collinear ℝ (A : Set ℝ²))
    (hK4 : HasNEquidistantProperty 4 A)
    (P : CircumscribedMECPacket A M) :
    2 ≤ (interior2 CP).card := by
  classical
  rcases hK4 M.v2 M.v2_mem with ⟨r, hrpos, hTcard⟩
  let T : Finset ℝ² := A.filter (fun x => dist M.v2 x = r)
  have hv2_not_mem_T : M.v2 ∉ T := by
    intro hv2T
    have hv2eq : dist M.v2 M.v2 = r := (Finset.mem_filter.mp hv2T).2
    have h0r : (0 : ℝ) = r := by simpa using hv2eq
    nlinarith
  have hC1_one : (T ∩ CP.C1).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := CP.C1) (M := M)
      hconv hnoncol CP.C1_subset
      (fun x hxA => (CP.arc_membership x hxA).1)
      CP.v2_mem_C1 CP.v3_mem_C1 P P.inner_at_v1
      (S := T ∩ CP.C1) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      simpa using (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hC3_one : (T ∩ CP.C3).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := CP.C3) (M := rot3 M)
      hconv hnoncol CP.C3_subset
      (fun x hxA => (CP.arc_membership x hxA).2.2)
      CP.v1_mem_C3 CP.v2_mem_C3 (packetRot3 P) (packetRot3 P).inner_at_v1
      (S := T ∩ CP.C3) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hcover :
      T \ interior2 CP ⊆ (T ∩ CP.C1) ∪ (T ∩ CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI2⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv1 : x = M.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using CP.v1_mem_C3⟩
    by_cases hxv3 : x = M.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using CP.v3_mem_C1⟩
    by_cases hxv2 : x = M.v2
    · exact False.elim (hv2_not_mem_T (hxv2 ▸ hxT))
    have hxnonmoser : x ∉ M.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC2 : x ∉ CP.C2 := by
      intro hxC2
      have hxI2 : x ∈ interior2 CP := by
        unfold interior2
        exact Finset.mem_erase.mpr ⟨hxv1, Finset.mem_erase.mpr ⟨hxv3, hxC2⟩⟩
      exact hxnotI2 hxI2
    have hone := CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ CP.C1
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, hxC1⟩
    · have hxC3 : x ∈ CP.C3 := by
        by_cases hxC3 : x ∈ CP.C3
        · exact hxC3
        · simp [hxC1, hxnotC2, hxC3] at hone
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, hxC3⟩
  have houtside_le :
      (T \ interior2 CP).card ≤ 2 := by
    calc
      (T \ interior2 CP).card ≤ ((T ∩ CP.C1) ∪ (T ∩ CP.C3)).card :=
        Finset.card_le_card hcover
      _ ≤ (T ∩ CP.C1).card + (T ∩ CP.C3).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit :
      (T \ interior2 CP).card + (T ∩ interior2 CP).card = T.card := by
    simpa [Finset.inter_comm] using
      Finset.card_sdiff_add_card_inter T (interior2 CP)
  have hinter_le : (T ∩ interior2 CP).card ≤ (interior2 CP).card :=
    Finset.card_le_card Finset.inter_subset_right
  have hTfour : 4 ≤ T.card := by
    simpa [T] using hTcard
  omega

/-- `N4a/N4b` bridge at the third cap: the `K4` class at `v₃` places two
points in the open interior of `C₃`. -/
theorem interior3_card_ge_two
    {M : MoserTriangle A} (CP : CapTriple A M)
    (hconv : ConvexIndep A)
    (hnoncol : ¬ Collinear ℝ (A : Set ℝ²))
    (hK4 : HasNEquidistantProperty 4 A)
    (P : CircumscribedMECPacket A M) :
    2 ≤ (interior3 CP).card := by
  classical
  rcases hK4 M.v3 M.v3_mem with ⟨r, hrpos, hTcard⟩
  let T : Finset ℝ² := A.filter (fun x => dist M.v3 x = r)
  have hv3_not_mem_T : M.v3 ∉ T := by
    intro hv3T
    have hv3eq : dist M.v3 M.v3 = r := (Finset.mem_filter.mp hv3T).2
    have h0r : (0 : ℝ) = r := by simpa using hv3eq
    nlinarith
  have hC1_one : (T ∩ CP.C1).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := CP.C1) (M := M)
      hconv hnoncol CP.C1_subset
      (fun x hxA => (CP.arc_membership x hxA).1)
      CP.v2_mem_C1 CP.v3_mem_C1 P P.inner_at_v1
      (S := T ∩ CP.C1) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      simpa using (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hC2_one : (T ∩ CP.C2).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := CP.C2) (M := rot2 M)
      hconv hnoncol CP.C2_subset
      (fun x hxA => (CP.arc_membership x hxA).2.1)
      CP.v3_mem_C2 CP.v1_mem_C2 (packetRot2 P) (packetRot2 P).inner_at_v1
      (S := T ∩ CP.C2) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hcover :
      T \ interior3 CP ⊆ (T ∩ CP.C1) ∪ (T ∩ CP.C2) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI3⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv2 : x = M.v2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using CP.v2_mem_C1⟩
    by_cases hxv1 : x = M.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using CP.v1_mem_C2⟩
    by_cases hxv3 : x = M.v3
    · exact False.elim (hv3_not_mem_T (hxv3 ▸ hxT))
    have hxnonmoser : x ∉ M.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC3 : x ∉ CP.C3 := by
      intro hxC3
      have hxI3 : x ∈ interior3 CP := by
        unfold interior3
        exact Finset.mem_erase.mpr ⟨hxv2, Finset.mem_erase.mpr ⟨hxv1, hxC3⟩⟩
      exact hxnotI3 hxI3
    have hone := CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ CP.C1
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, hxC1⟩
    · have hxC2 : x ∈ CP.C2 := by
        by_cases hxC2 : x ∈ CP.C2
        · exact hxC2
        · simp [hxC1, hxC2, hxnotC3] at hone
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, hxC2⟩
  have houtside_le :
      (T \ interior3 CP).card ≤ 2 := by
    calc
      (T \ interior3 CP).card ≤ ((T ∩ CP.C1) ∪ (T ∩ CP.C2)).card :=
        Finset.card_le_card hcover
      _ ≤ (T ∩ CP.C1).card + (T ∩ CP.C2).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit :
      (T \ interior3 CP).card + (T ∩ interior3 CP).card = T.card := by
    simpa [Finset.inter_comm] using
      Finset.card_sdiff_add_card_inter T (interior3 CP)
  have hinter_le : (T ∩ interior3 CP).card ≤ (interior3 CP).card :=
    Finset.card_le_card Finset.inter_subset_right
  have hTfour : 4 ≤ T.card := by
    simpa [T] using hTcard
  omega

/-- The first cap decomposes as its open interior plus the two Moser
endpoints. -/
theorem interior1_card_add_two
    {M : MoserTriangle A} (CP : CapTriple A M) :
    (interior1 CP).card + 2 = CP.C1.card := by
  classical
  have hv3 : M.v3 ∈ CP.C1.erase M.v2 :=
    Finset.mem_erase.mpr ⟨fun h => M.v23_ne h.symm, CP.v3_mem_C1⟩
  have hC1erase : (CP.C1.erase M.v2).card = CP.C1.card - 1 :=
    Finset.card_erase_of_mem CP.v2_mem_C1
  have hI1 : (interior1 CP).card = (CP.C1.erase M.v2).card - 1 := by
    unfold interior1
    exact Finset.card_erase_of_mem hv3
  have hC1_ge_two : 2 ≤ CP.C1.card := by
    have hsubset : ({M.v2, M.v3} : Finset ℝ²) ⊆ CP.C1 := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact CP.v2_mem_C1
      · exact CP.v3_mem_C1
    have hcard_le := Finset.card_le_card hsubset
    simpa [M.v23_ne] using hcard_le
  rw [hI1, hC1erase]
  omega

/-- The second cap decomposes as its open interior plus the two Moser
endpoints. -/
theorem interior2_card_add_two
    {M : MoserTriangle A} (CP : CapTriple A M) :
    (interior2 CP).card + 2 = CP.C2.card := by
  classical
  have hv1 : M.v1 ∈ CP.C2.erase M.v3 :=
    Finset.mem_erase.mpr ⟨M.v13_ne, CP.v1_mem_C2⟩
  have hC2erase : (CP.C2.erase M.v3).card = CP.C2.card - 1 :=
    Finset.card_erase_of_mem CP.v3_mem_C2
  have hI2 : (interior2 CP).card = (CP.C2.erase M.v3).card - 1 := by
    unfold interior2
    exact Finset.card_erase_of_mem hv1
  have hC2_ge_two : 2 ≤ CP.C2.card := by
    have hsubset : ({M.v3, M.v1} : Finset ℝ²) ⊆ CP.C2 := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact CP.v3_mem_C2
      · exact CP.v1_mem_C2
    have h31 : M.v3 ≠ M.v1 := fun h => M.v13_ne h.symm
    have hpair : ({M.v3, M.v1} : Finset ℝ²).card = 2 := by
      simp [h31]
    have hcard_le := Finset.card_le_card hsubset
    rw [hpair] at hcard_le
    exact hcard_le
  rw [hI2, hC2erase]
  omega

/-- The third cap decomposes as its open interior plus the two Moser
endpoints. -/
theorem interior3_card_add_two
    {M : MoserTriangle A} (CP : CapTriple A M) :
    (interior3 CP).card + 2 = CP.C3.card := by
  classical
  have hv2 : M.v2 ∈ CP.C3.erase M.v1 :=
    Finset.mem_erase.mpr ⟨fun h => M.v12_ne h.symm, CP.v2_mem_C3⟩
  have hC3erase : (CP.C3.erase M.v1).card = CP.C3.card - 1 :=
    Finset.card_erase_of_mem CP.v1_mem_C3
  have hI3 : (interior3 CP).card = (CP.C3.erase M.v1).card - 1 := by
    unfold interior3
    exact Finset.card_erase_of_mem hv2
  have hC3_ge_two : 2 ≤ CP.C3.card := by
    have hsubset : ({M.v1, M.v2} : Finset ℝ²) ⊆ CP.C3 := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact CP.v1_mem_C3
      · exact CP.v2_mem_C3
    have hcard_le := Finset.card_le_card hsubset
    simpa [M.v12_ne] using hcard_le
  rw [hI3, hC3erase]
  omega

/-- **Every cap has at least four points.**  At a circumscribed non-obtuse
Moser triangle of a convex-independent `K4` set, each closed cap carries its
two Moser endpoints plus at least two interior points of the apex's `K4`
class. -/
theorem capTriple_caps_card_ge_four
    {M : MoserTriangle A} (CP : CapTriple A M)
    (hconv : ConvexIndep A)
    (hnoncol : ¬ Collinear ℝ (A : Set ℝ²))
    (hK4 : HasNEquidistantProperty 4 A)
    (P : CircumscribedMECPacket A M) :
    4 ≤ CP.C1.card ∧ 4 ≤ CP.C2.card ∧ 4 ≤ CP.C3.card := by
  have h1 := interior1_card_ge_two CP hconv hnoncol hK4 P
  have h2 := interior2_card_ge_two CP hconv hnoncol hK4 P
  have h3 := interior3_card_ge_two CP hconv hnoncol hK4 P
  have hc1 := interior1_card_add_two CP
  have hc2 := interior2_card_add_two CP
  have hc3 := interior3_card_add_two CP
  omega

end U1OppositeCapLowerBounds

end Problem97
