/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Cap.PartitionFromMEC
import Erdos9796Proof.P97.CircumscribedMECPacket
import Erdos9796Proof.P97.WitnessPacketInterface
import Erdos9796Proof.P97.N8.FourSubpacket
import Erdos9796Proof.P97.N8.N8CapCoordNorm
import Erdos9796Proof.P97.U2.SameDistanceArcContainment
import Erdos9796Proof.P97.U2.WitnessReflectionKernel

/-!
# General-n `(m,4,4)` selected-apex packets

This file starts the proof-facing `SurplusCapPacket` interface needed by the
four-point subpacket reduction.  It deliberately proves only structural facts:
selected-apex extraction from global `K4`, cyclic adjacent-count vocabulary, and
the same-cap one-hit bound for a short cap of cardinality four.

It does not assert the adjacent one-hit bounds or Q lower bounds; those remain
geometric obligations.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace SurplusCapPacket

/-- The cyclic Moser triangle whose first vertex is opposite the selected cap
index. -/
@[reducible] def triangleByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    MoserTriangle A :=
  match i.1 with
  | 0 => S.triangle
  | 1 =>
      { v1 := S.triangle.v2
        v2 := S.triangle.v3
        v3 := S.triangle.v1
        v1_mem := S.triangle.v2_mem
        v2_mem := S.triangle.v3_mem
        v3_mem := S.triangle.v1_mem
        v12_ne := S.triangle.v23_ne
        v13_ne := S.triangle.v12_ne.symm
        v23_ne := S.triangle.v13_ne.symm }
  | _ =>
      { v1 := S.triangle.v3
        v2 := S.triangle.v1
        v3 := S.triangle.v2
        v1_mem := S.triangle.v3_mem
        v2_mem := S.triangle.v1_mem
        v3_mem := S.triangle.v2_mem
        v12_ne := S.triangle.v13_ne.symm
        v13_ne := S.triangle.v23_ne.symm
        v23_ne := S.triangle.v12_ne }

/-- The circumscribed MEC packet carried by a surplus packet. -/
@[reducible] noncomputable def circPacket
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    CircumscribedMECPacket A S.triangle :=
  CircumscribedMECPacket.ofNonObtuse S.triangleNonObtuse S.hCirc

/-- The circumscribed MEC packet rotated to cap index `1`. -/
@[reducible] noncomputable def circPacket2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    CircumscribedMECPacket A (S.triangleByIndex 1) :=
  { center := S.circPacket.center
    radius := S.circPacket.radius
    radius_pos := S.circPacket.radius_pos
    moser_on_boundary_1 := S.circPacket.moser_on_boundary_2
    moser_on_boundary_2 := S.circPacket.moser_on_boundary_3
    moser_on_boundary_3 := S.circPacket.moser_on_boundary_1
    inner_at_v1 := S.circPacket.inner_at_v2
    inner_at_v2 := S.circPacket.inner_at_v3
    inner_at_v3 := S.circPacket.inner_at_v1
    disk_contains_A := S.circPacket.disk_contains_A }

/-- The circumscribed MEC packet rotated to cap index `2`. -/
@[reducible] noncomputable def circPacket3
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    CircumscribedMECPacket A (S.triangleByIndex 2) :=
  { center := S.circPacket.center
    radius := S.circPacket.radius
    radius_pos := S.circPacket.radius_pos
    moser_on_boundary_1 := S.circPacket.moser_on_boundary_3
    moser_on_boundary_2 := S.circPacket.moser_on_boundary_1
    moser_on_boundary_3 := S.circPacket.moser_on_boundary_2
    inner_at_v1 := S.circPacket.inner_at_v3
    inner_at_v2 := S.circPacket.inner_at_v1
    inner_at_v3 := S.circPacket.inner_at_v2
    disk_contains_A := S.circPacket.disk_contains_A }

/-- The closed cap selected by an index is contained in the ambient point set. -/
theorem capByIndex_subset
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.capByIndex i ⊆ A := by
  intro x hx
  fin_cases i
  · exact S.partition.C1_subset hx
  · exact S.partition.C2_subset hx
  · exact S.partition.C3_subset hx

/-- The strict interior of an indexed cap is contained in the corresponding
closed cap. -/
theorem capInteriorByIndex_subset_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.capInteriorByIndex i ⊆ S.capByIndex i := by
  intro x hx
  fin_cases i
  · simp only [capInteriorByIndex, capByIndex] at hx ⊢
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    exact hx.2.2
  · simp only [capInteriorByIndex, capByIndex] at hx ⊢
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    exact hx.2.2
  · simp only [capInteriorByIndex, capByIndex] at hx ⊢
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    exact hx.2.2

/-- A short indexed cap has two named strict interior points. -/
theorem exists_capInteriorByIndex_pair_of_cap_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4) :
    ∃ x y : ℝ², x ≠ y ∧ S.capInteriorByIndex i = ({x, y} : Finset ℝ²) := by
  exact Finset.card_eq_two.mp
    (S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four i hcap)

/-- Indexed arc-membership for the closed cap selected by an index. -/
theorem capByIndex_arc_membership
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    ∀ x ∈ A, x ∈ S.capByIndex i ↔
      OnArcOpposite (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 x := by
  intro x hxA
  fin_cases i
  · simpa [capByIndex, triangleByIndex] using (S.partition.arc_membership x hxA).1
  · simpa [capByIndex, triangleByIndex] using (S.partition.arc_membership x hxA).2.1
  · simpa [capByIndex, triangleByIndex] using (S.partition.arc_membership x hxA).2.2

/-- A carrier point outside an indexed closed cap lies strictly on the same
side of that cap's chord as the opposite Moser vertex. -/
theorem signedArea2_mul_pos_of_not_mem_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {x : ℝ²} (hxA : x ∈ A) (hx : x ∉ S.capByIndex i) :
    0 < signedArea2 x (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 *
      signedArea2 (S.triangleByIndex i).v1
        (S.triangleByIndex i).v2 (S.triangleByIndex i).v3 := by
  rw [S.capByIndex_arc_membership i x hxA] at hx
  unfold OnArcOpposite at hx
  exact not_le.mp hx

/-- Two carrier points outside the same indexed cap cannot lie on the same two
endpoint-centered circles for that cap. -/
theorem twoCircle_sameSide_reflection_false_of_not_mem_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {rq rv : ℝ} {x y : ℝ²}
    (hxA : x ∈ A) (hyA : y ∈ A)
    (hx : x ∉ S.capByIndex i) (hy : y ∉ S.capByIndex i)
    (hne : x ≠ y)
    (hxq : dist x (S.triangleByIndex i).v2 = rq)
    (hyq : dist y (S.triangleByIndex i).v2 = rq)
    (hxv : dist x (S.triangleByIndex i).v3 = rv)
    (hyv : dist y (S.triangleByIndex i).v3 = rv) :
    False := by
  exact Problem97.twoCircle_sameSide_reflection_false
    (q := (S.triangleByIndex i).v2) (v2 := (S.triangleByIndex i).v3)
    (apex := (S.triangleByIndex i).v1) (y := y) (u := x)
    hxq hyq hxv hyv hne
    (S.signedArea2_mul_pos_of_not_mem_capByIndex i hxA hx)
    (S.signedArea2_mul_pos_of_not_mem_capByIndex i hyA hy)

/-- The first support endpoint of an indexed cap lies in that cap. -/
theorem triangleByIndex_v2_mem_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    (S.triangleByIndex i).v2 ∈ S.capByIndex i := by
  fin_cases i
  · exact S.partition.v2_mem_C1
  · exact S.partition.v3_mem_C2
  · exact S.partition.v1_mem_C3

/-- The second support endpoint of an indexed cap lies in that cap. -/
theorem triangleByIndex_v3_mem_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    (S.triangleByIndex i).v3 ∈ S.capByIndex i := by
  fin_cases i
  · exact S.partition.v3_mem_C1
  · exact S.partition.v1_mem_C2
  · exact S.partition.v2_mem_C3

/-- One-hit bound for an indexed support cap, viewed from its first support
endpoint. -/
theorem capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) (radius : ℝ) :
    (SelectedClass A (S.triangleByIndex i).v2 radius ∩ S.capByIndex i).card ≤
      1 := by
  fin_cases i
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.capByIndex 0) (M := S.triangleByIndex 0)
      hconv S.hncol (S.capByIndex_subset 0)
      (S.capByIndex_arc_membership 0)
      (S.triangleByIndex_v2_mem_capByIndex 0)
      (S.triangleByIndex_v3_mem_capByIndex 0)
      (by simpa [triangleByIndex] using S.circPacket)
      (by simpa [triangleByIndex] using S.circPacket.inner_at_v1)
      (S := SelectedClass A (S.triangleByIndex 0).v2 radius ∩ S.capByIndex 0)
      (r := radius)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.capByIndex 1) (M := S.triangleByIndex 1)
      hconv S.hncol (S.capByIndex_subset 1)
      (S.capByIndex_arc_membership 1)
      (S.triangleByIndex_v2_mem_capByIndex 1)
      (S.triangleByIndex_v3_mem_capByIndex 1)
      S.circPacket2
      (by simpa [triangleByIndex] using S.circPacket2.inner_at_v1)
      (S := SelectedClass A (S.triangleByIndex 1).v2 radius ∩ S.capByIndex 1)
      (r := radius)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.capByIndex 2) (M := S.triangleByIndex 2)
      hconv S.hncol (S.capByIndex_subset 2)
      (S.capByIndex_arc_membership 2)
      (S.triangleByIndex_v2_mem_capByIndex 2)
      (S.triangleByIndex_v3_mem_capByIndex 2)
      S.circPacket3
      (by simpa [triangleByIndex] using S.circPacket3.inner_at_v1)
      (S := SelectedClass A (S.triangleByIndex 2).v2 radius ∩ S.capByIndex 2)
      (r := radius)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2

/-- One-hit bound for an indexed support cap, viewed from its second support
endpoint. -/
theorem capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) (radius : ℝ) :
    (SelectedClass A (S.triangleByIndex i).v3 radius ∩ S.capByIndex i).card ≤
      1 := by
  fin_cases i
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.capByIndex 0) (M := S.triangleByIndex 0)
      hconv S.hncol (S.capByIndex_subset 0)
      (S.capByIndex_arc_membership 0)
      (S.triangleByIndex_v2_mem_capByIndex 0)
      (S.triangleByIndex_v3_mem_capByIndex 0)
      (by simpa [triangleByIndex] using S.circPacket)
      (by simpa [triangleByIndex] using S.circPacket.inner_at_v1)
      (S := SelectedClass A (S.triangleByIndex 0).v3 radius ∩ S.capByIndex 0)
      (r := radius)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.capByIndex 1) (M := S.triangleByIndex 1)
      hconv S.hncol (S.capByIndex_subset 1)
      (S.capByIndex_arc_membership 1)
      (S.triangleByIndex_v2_mem_capByIndex 1)
      (S.triangleByIndex_v3_mem_capByIndex 1)
      S.circPacket2
      (by simpa [triangleByIndex] using S.circPacket2.inner_at_v1)
      (S := SelectedClass A (S.triangleByIndex 1).v3 radius ∩ S.capByIndex 1)
      (r := radius)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.capByIndex 2) (M := S.triangleByIndex 2)
      hconv S.hncol (S.capByIndex_subset 2)
      (S.capByIndex_arc_membership 2)
      (S.triangleByIndex_v2_mem_capByIndex 2)
      (S.triangleByIndex_v3_mem_capByIndex 2)
      S.circPacket3
      (by simpa [triangleByIndex] using S.circPacket3.inner_at_v1)
      (S := SelectedClass A (S.triangleByIndex 2).v3 radius ∩ S.capByIndex 2)
      (r := radius)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2

/-- The cyclic cap index immediately to the left of an indexed cap. -/
@[reducible] def leftAdjacentIndex (i : Fin 3) : Fin 3 :=
  match i.1 with
  | 0 => 1
  | 1 => 2
  | _ => 0

/-- The cyclic cap index immediately to the right of an indexed cap. -/
@[reducible] def rightAdjacentIndex (i : Fin 3) : Fin 3 :=
  match i.1 with
  | 0 => 2
  | 1 => 0
  | _ => 1

/-- The strict interior of the left-adjacent cap for a cyclic cap index. -/
@[reducible] noncomputable def leftAdjacentInteriorByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.capInteriorByIndex 1
  | 1 => S.capInteriorByIndex 2
  | _ => S.capInteriorByIndex 0

/-- The strict interior of the right-adjacent cap for a cyclic cap index. -/
@[reducible] noncomputable def rightAdjacentInteriorByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.capInteriorByIndex 2
  | 1 => S.capInteriorByIndex 0
  | _ => S.capInteriorByIndex 1

/-- The closed left-adjacent cap for a cyclic cap index. -/
@[reducible] def leftAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.capByIndex 1
  | 1 => S.capByIndex 2
  | _ => S.capByIndex 0

/-- The closed right-adjacent cap for a cyclic cap index. -/
@[reducible] def rightAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.capByIndex 2
  | 1 => S.capByIndex 0
  | _ => S.capByIndex 1

theorem leftAdjacentInteriorByIndex_eq_capInteriorByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftAdjacentInteriorByIndex i =
      S.capInteriorByIndex (leftAdjacentIndex i) := by
  fin_cases i <;> rfl

theorem rightAdjacentInteriorByIndex_eq_capInteriorByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightAdjacentInteriorByIndex i =
      S.capInteriorByIndex (rightAdjacentIndex i) := by
  fin_cases i <;> rfl

theorem leftAdjacentCapByIndex_eq_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftAdjacentCapByIndex i = S.capByIndex (leftAdjacentIndex i) := by
  fin_cases i <;> rfl

theorem rightAdjacentCapByIndex_eq_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightAdjacentCapByIndex i = S.capByIndex (rightAdjacentIndex i) := by
  fin_cases i <;> rfl

theorem leftAdjacentCapByIndex_rightAdjacentIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftAdjacentCapByIndex (rightAdjacentIndex i) = S.capByIndex i := by
  fin_cases i <;> rfl

theorem rightAdjacentCapByIndex_leftAdjacentIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightAdjacentCapByIndex (leftAdjacentIndex i) = S.capByIndex i := by
  fin_cases i <;> rfl

/-- The strict left-adjacent interior lies in the closed left-adjacent cap. -/
theorem leftAdjacentInteriorByIndex_subset_leftAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftAdjacentInteriorByIndex i ⊆ S.leftAdjacentCapByIndex i := by
  intro x hx
  fin_cases i
  · exact S.capInteriorByIndex_subset_capByIndex 1 hx
  · exact S.capInteriorByIndex_subset_capByIndex 2 hx
  · exact S.capInteriorByIndex_subset_capByIndex 0 hx

/-- The strict right-adjacent interior lies in the closed right-adjacent cap. -/
theorem rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightAdjacentInteriorByIndex i ⊆ S.rightAdjacentCapByIndex i := by
  intro x hx
  fin_cases i
  · exact S.capInteriorByIndex_subset_capByIndex 2 hx
  · exact S.capInteriorByIndex_subset_capByIndex 0 hx
  · exact S.capInteriorByIndex_subset_capByIndex 1 hx

/-- Count Moser vertices in the selected class. -/
noncomputable def moserCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (x : ℝ²) (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ S.triangle.verts).card

/-- Count same-cap interior points, excluding the apex, in the selected class. -/
noncomputable def sameCapCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (x : ℝ²)
    (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ (S.capInteriorByIndex i).erase x).card

/-- Count left-adjacent-cap interior points in the selected class. -/
noncomputable def leftAdjCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (x : ℝ²)
    (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ S.leftAdjacentInteriorByIndex i).card

/-- Count right-adjacent-cap interior points in the selected class. -/
noncomputable def rightAdjCount
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (x : ℝ²)
    (radius : ℝ) : ℕ :=
  (SelectedClass A x radius ∩ S.rightAdjacentInteriorByIndex i).card

/-- The Moser vertex opposite the cap selected by a cyclic cap index. -/
@[reducible] def oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : ℝ² :=
  match i.1 with
  | 0 => S.triangle.v1
  | 1 => S.triangle.v2
  | _ => S.triangle.v3

/-- Closed left-adjacent one-hit bound for the Moser vertex opposite an indexed
cap. -/
theorem leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) (radius : ℝ) :
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i).card ≤ 1 := by
  fin_cases i
  · simpa [oppositeVertexByIndex, leftAdjacentCapByIndex, triangleByIndex] using
      S.capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep hconv 1 radius
  · simpa [oppositeVertexByIndex, leftAdjacentCapByIndex, triangleByIndex] using
      S.capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep hconv 2 radius
  · simpa [oppositeVertexByIndex, leftAdjacentCapByIndex, triangleByIndex] using
      S.capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep hconv 0 radius

/-- Closed right-adjacent one-hit bound for the Moser vertex opposite an indexed
cap. -/
theorem rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) (radius : ℝ) :
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i).card ≤ 1 := by
  fin_cases i
  · simpa [oppositeVertexByIndex, rightAdjacentCapByIndex, triangleByIndex] using
      S.capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep hconv 2 radius
  · simpa [oppositeVertexByIndex, rightAdjacentCapByIndex, triangleByIndex] using
      S.capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep hconv 0 radius
  · simpa [oppositeVertexByIndex, rightAdjacentCapByIndex, triangleByIndex] using
      S.capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep hconv 1 radius

/-- Left-adjacent count one-hit bound for a Moser-centered selected class at
the vertex opposite an indexed cap. -/
theorem leftAdjCount_at_opposite_le_one_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) (radius : ℝ) :
    S.leftAdjCount i (S.oppositeVertexByIndex i) radius ≤ 1 := by
  have hclosed :=
    S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i radius
  have hsub :
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentInteriorByIndex i ⊆
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentCapByIndex i := by
    intro y hy
    rw [Finset.mem_inter] at hy ⊢
    exact ⟨hy.1, S.leftAdjacentInteriorByIndex_subset_leftAdjacentCapByIndex i hy.2⟩
  exact le_trans (Finset.card_le_card hsub) hclosed

/-- Right-adjacent count one-hit bound for a Moser-centered selected class at
the vertex opposite an indexed cap. -/
theorem rightAdjCount_at_opposite_le_one_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) (radius : ℝ) :
    S.rightAdjCount i (S.oppositeVertexByIndex i) radius ≤ 1 := by
  have hclosed :=
    S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i radius
  have hsub :
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentInteriorByIndex i ⊆
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentCapByIndex i := by
    intro y hy
    rw [Finset.mem_inter] at hy ⊢
    exact ⟨hy.1, S.rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex i hy.2⟩
  exact le_trans (Finset.card_le_card hsub) hclosed

/-- The Moser endpoint on the left-adjacent cap that is not the opposite
Moser vertex for the selected cap. -/
@[reducible] def leftOuterVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : ℝ² :=
  match i.1 with
  | 0 => S.triangle.v3
  | 1 => S.triangle.v1
  | _ => S.triangle.v2

/-- The Moser endpoint on the right-adjacent cap that is not the opposite
Moser vertex for the selected cap. -/
@[reducible] def rightOuterVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : ℝ² :=
  match i.1 with
  | 0 => S.triangle.v2
  | 1 => S.triangle.v3
  | _ => S.triangle.v1

theorem oppositeVertexByIndex_leftAdjacentIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.oppositeVertexByIndex (leftAdjacentIndex i) =
      S.rightOuterVertexByIndex i := by
  fin_cases i <;> rfl

theorem oppositeVertexByIndex_rightAdjacentIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.oppositeVertexByIndex (rightAdjacentIndex i) =
      S.leftOuterVertexByIndex i := by
  fin_cases i <;> rfl

theorem rightOuterVertexByIndex_leftAdjacentIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightOuterVertexByIndex (leftAdjacentIndex i) =
      S.leftOuterVertexByIndex i := by
  fin_cases i <;> rfl

theorem leftOuterVertexByIndex_rightAdjacentIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftOuterVertexByIndex (rightAdjacentIndex i) =
      S.rightOuterVertexByIndex i := by
  fin_cases i <;> rfl

/-- The left outer Moser endpoint for an indexed cap lies in the closed
left-adjacent cap. -/
theorem leftOuterVertexByIndex_mem_leftAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftOuterVertexByIndex i ∈ S.leftAdjacentCapByIndex i := by
  fin_cases i
  · exact S.partition.v3_mem_C2
  · exact S.partition.v1_mem_C3
  · exact S.partition.v2_mem_C1

/-- The right outer Moser endpoint for an indexed cap lies in the closed
right-adjacent cap. -/
theorem rightOuterVertexByIndex_mem_rightAdjacentCapByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightOuterVertexByIndex i ∈ S.rightAdjacentCapByIndex i := by
  fin_cases i
  · exact S.partition.v2_mem_C3
  · exact S.partition.v3_mem_C1
  · exact S.partition.v1_mem_C2

/-- The left outer Moser endpoint for an indexed cap lies in the indexed cap
itself. -/
theorem leftOuterVertexByIndex_mem_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.leftOuterVertexByIndex i ∈ S.capByIndex i := by
  fin_cases i
  · exact S.partition.v3_mem_C1
  · exact S.partition.v1_mem_C2
  · exact S.partition.v2_mem_C3

/-- The right outer Moser endpoint for an indexed cap lies in the indexed cap
itself. -/
theorem rightOuterVertexByIndex_mem_capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.rightOuterVertexByIndex i ∈ S.capByIndex i := by
  fin_cases i
  · exact S.partition.v2_mem_C1
  · exact S.partition.v3_mem_C2
  · exact S.partition.v1_mem_C3

/-- A point in an indexed closed cap that is neither support endpoint lies in
the corresponding strict cap interior. -/
theorem mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    (hxcap : x ∈ S.capByIndex i)
    (hxne_right : x ≠ S.rightOuterVertexByIndex i)
    (hxne_left : x ≠ S.leftOuterVertexByIndex i) :
    x ∈ S.capInteriorByIndex i := by
  fin_cases i
  · simp only [capInteriorByIndex]
    exact Finset.mem_erase.mpr
      ⟨hxne_left, Finset.mem_erase.mpr ⟨hxne_right, hxcap⟩⟩
  · simp only [capInteriorByIndex]
    exact Finset.mem_erase.mpr
      ⟨hxne_left, Finset.mem_erase.mpr ⟨hxne_right, hxcap⟩⟩
  · simp only [capInteriorByIndex]
    exact Finset.mem_erase.mpr
      ⟨hxne_left, Finset.mem_erase.mpr ⟨hxne_right, hxcap⟩⟩

private theorem mem_triangle_verts_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (hx : x ∈ S.triangle.verts) :
    x = S.triangle.v1 ∨ x = S.triangle.v2 ∨ x = S.triangle.v3 := by
  simpa [MoserTriangle.verts] using hx

/-- A point in the strict interior of an indexed cap is private to that cap:
it is not in either adjacent closed cap. -/
theorem capInteriorByIndex_mem_private
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    (hxI : x ∈ S.capInteriorByIndex i) :
    x ∈ S.capByIndex i \
      (S.leftAdjacentCapByIndex i ∪ S.rightAdjacentCapByIndex i) := by
  classical
  fin_cases i
  · simp only [capInteriorByIndex] at hxI
    rw [Finset.mem_erase, Finset.mem_erase] at hxI
    have hxC1 : x ∈ S.partition.C1 := hxI.2.2
    have hxNonMoser : x ∉ S.triangle.verts := by
      intro hxVerts
      rcases mem_triangle_verts_cases hxVerts with rfl | rfl | rfl
      · exact S.partition.v1_notin_C1 hxC1
      · exact hxI.2.1 rfl
      · exact hxI.1 rfl
    have hxA : x ∈ A := S.partition.C1_subset hxC1
    have hone := S.partition.nonmoser_in_one x hxA hxNonMoser
    have hxNotC2 : x ∉ S.partition.C2 := by
      intro hxC2
      by_cases hxC3 : x ∈ S.partition.C3
      · simp [hxC1, hxC2, hxC3] at hone
      · simp [hxC1, hxC2, hxC3] at hone
    have hxNotC3 : x ∉ S.partition.C3 := by
      intro hxC3
      by_cases hxC2 : x ∈ S.partition.C2
      · simp [hxC1, hxC2, hxC3] at hone
      · simp [hxC1, hxC2, hxC3] at hone
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [capByIndex] using hxC1, by
        intro hxUnion
        simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
          capByIndex, Finset.mem_union] at hxUnion
        exact hxUnion.elim hxNotC2 hxNotC3⟩
  · simp only [capInteriorByIndex] at hxI
    rw [Finset.mem_erase, Finset.mem_erase] at hxI
    have hxC2 : x ∈ S.partition.C2 := hxI.2.2
    have hxNonMoser : x ∉ S.triangle.verts := by
      intro hxVerts
      rcases mem_triangle_verts_cases hxVerts with rfl | rfl | rfl
      · exact hxI.1 rfl
      · exact S.partition.v2_notin_C2 hxC2
      · exact hxI.2.1 rfl
    have hxA : x ∈ A := S.partition.C2_subset hxC2
    have hone := S.partition.nonmoser_in_one x hxA hxNonMoser
    have hxNotC3 : x ∉ S.partition.C3 := by
      intro hxC3
      by_cases hxC1 : x ∈ S.partition.C1
      · simp [hxC1, hxC2, hxC3] at hone
      · simp [hxC1, hxC2, hxC3] at hone
    have hxNotC1 : x ∉ S.partition.C1 := by
      intro hxC1
      by_cases hxC3 : x ∈ S.partition.C3
      · simp [hxC1, hxC2, hxC3] at hone
      · simp [hxC1, hxC2, hxC3] at hone
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [capByIndex] using hxC2, by
        intro hxUnion
        simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
          capByIndex, Finset.mem_union] at hxUnion
        exact hxUnion.elim hxNotC3 hxNotC1⟩
  · simp only [capInteriorByIndex] at hxI
    rw [Finset.mem_erase, Finset.mem_erase] at hxI
    have hxC3 : x ∈ S.partition.C3 := hxI.2.2
    have hxNonMoser : x ∉ S.triangle.verts := by
      intro hxVerts
      rcases mem_triangle_verts_cases hxVerts with rfl | rfl | rfl
      · exact hxI.2.1 rfl
      · exact hxI.1 rfl
      · exact S.partition.v3_notin_C3 hxC3
    have hxA : x ∈ A := S.partition.C3_subset hxC3
    have hone := S.partition.nonmoser_in_one x hxA hxNonMoser
    have hxNotC1 : x ∉ S.partition.C1 := by
      intro hxC1
      by_cases hxC2 : x ∈ S.partition.C2
      · simp [hxC1, hxC2, hxC3] at hone
      · simp [hxC1, hxC2, hxC3] at hone
    have hxNotC2 : x ∉ S.partition.C2 := by
      intro hxC2
      by_cases hxC1 : x ∈ S.partition.C1
      · simp [hxC1, hxC2, hxC3] at hone
      · simp [hxC1, hxC2, hxC3] at hone
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [capByIndex] using hxC3, by
        intro hxUnion
        simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
          capByIndex, Finset.mem_union] at hxUnion
        exact hxUnion.elim hxNotC1 hxNotC2⟩

/-- A point in the strict left-adjacent interior is a strict left-adjacent
escape point relative to the indexed cap. -/
theorem leftAdjacentInteriorByIndex_mem_strict
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    (hxI : x ∈ S.leftAdjacentInteriorByIndex i) :
    x ∈ S.leftAdjacentCapByIndex i \
      (S.capByIndex i ∪ S.rightAdjacentCapByIndex i) := by
  fin_cases i
  · have h := S.capInteriorByIndex_mem_private 1 hxI
    rcases Finset.mem_sdiff.mp h with ⟨hxCap, hxNot⟩
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [leftAdjacentCapByIndex] using hxCap, by
        intro hxUnion
        apply hxNot
        simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
          capByIndex, Finset.mem_union] at hxUnion ⊢
        exact hxUnion.elim Or.inr Or.inl⟩
  · have h := S.capInteriorByIndex_mem_private 2 hxI
    rcases Finset.mem_sdiff.mp h with ⟨hxCap, hxNot⟩
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [leftAdjacentCapByIndex] using hxCap, by
        intro hxUnion
        apply hxNot
        simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
          capByIndex, Finset.mem_union] at hxUnion ⊢
        exact hxUnion.elim Or.inr Or.inl⟩
  · have h := S.capInteriorByIndex_mem_private 0 hxI
    rcases Finset.mem_sdiff.mp h with ⟨hxCap, hxNot⟩
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [leftAdjacentCapByIndex] using hxCap, by
        intro hxUnion
        apply hxNot
        simp only [leftAdjacentCapByIndex, rightAdjacentCapByIndex,
          capByIndex, Finset.mem_union] at hxUnion ⊢
        exact hxUnion.elim Or.inr Or.inl⟩

/-- A point in the strict right-adjacent interior is a strict right-adjacent
escape point relative to the indexed cap. -/
theorem rightAdjacentInteriorByIndex_mem_strict
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    (hxI : x ∈ S.rightAdjacentInteriorByIndex i) :
    x ∈ S.rightAdjacentCapByIndex i \
      (S.capByIndex i ∪ S.leftAdjacentCapByIndex i) := by
  fin_cases i
  · have h := S.capInteriorByIndex_mem_private 2 hxI
    rcases Finset.mem_sdiff.mp h with ⟨hxCap, hxNot⟩
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [rightAdjacentCapByIndex] using hxCap, by
        intro hxUnion
        apply hxNot
        simpa [leftAdjacentCapByIndex, rightAdjacentCapByIndex] using
          hxUnion⟩
  · have h := S.capInteriorByIndex_mem_private 0 hxI
    rcases Finset.mem_sdiff.mp h with ⟨hxCap, hxNot⟩
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [rightAdjacentCapByIndex] using hxCap, by
        intro hxUnion
        apply hxNot
        simpa [leftAdjacentCapByIndex, rightAdjacentCapByIndex] using
          hxUnion⟩
  · have h := S.capInteriorByIndex_mem_private 1 hxI
    rcases Finset.mem_sdiff.mp h with ⟨hxCap, hxNot⟩
    exact Finset.mem_sdiff.mpr
      ⟨by simpa [rightAdjacentCapByIndex] using hxCap, by
        intro hxUnion
        apply hxNot
        simpa [leftAdjacentCapByIndex, rightAdjacentCapByIndex] using
          hxUnion⟩

/-- A selected point in the left-adjacent closed cap is in the strict
left-adjacent interior unless it is the outer Moser endpoint. -/
theorem mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    {radius : ℝ} (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxcap : x ∈ S.leftAdjacentCapByIndex i)
    (hxne_outer : x ≠ S.leftOuterVertexByIndex i) :
    x ∈ S.leftAdjacentInteriorByIndex i := by
  have hxne_opp : x ≠ S.oppositeVertexByIndex i := by
    intro hx
    have hdist : dist (S.oppositeVertexByIndex i) (S.oppositeVertexByIndex i) =
        radius := by
      simpa [hx] using (mem_selectedClass.mp hxT).2
    have h0r : (0 : ℝ) = radius := by simpa using hdist
    nlinarith
  fin_cases i
  · exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 1
      (by simpa [leftAdjacentCapByIndex] using hxcap)
      (by simpa [rightOuterVertexByIndex, leftOuterVertexByIndex] using hxne_outer)
      (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex] using hxne_opp)
  · exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 2
      (by simpa [leftAdjacentCapByIndex] using hxcap)
      (by simpa [rightOuterVertexByIndex, leftOuterVertexByIndex] using hxne_outer)
      (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex] using hxne_opp)
  · exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 0
      (by simpa [leftAdjacentCapByIndex] using hxcap)
      (by simpa [rightOuterVertexByIndex, leftOuterVertexByIndex] using hxne_outer)
      (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex] using hxne_opp)

/-- A selected point in the right-adjacent closed cap is in the strict
right-adjacent interior unless it is the outer Moser endpoint. -/
theorem mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    {radius : ℝ} (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxcap : x ∈ S.rightAdjacentCapByIndex i)
    (hxne_outer : x ≠ S.rightOuterVertexByIndex i) :
    x ∈ S.rightAdjacentInteriorByIndex i := by
  have hxne_opp : x ≠ S.oppositeVertexByIndex i := by
    intro hx
    have hdist : dist (S.oppositeVertexByIndex i) (S.oppositeVertexByIndex i) =
        radius := by
      simpa [hx] using (mem_selectedClass.mp hxT).2
    have h0r : (0 : ℝ) = radius := by simpa using hdist
    nlinarith
  fin_cases i
  · exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 2
      (by simpa [rightAdjacentCapByIndex] using hxcap)
      (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex] using hxne_opp)
      (by simpa [leftOuterVertexByIndex, rightOuterVertexByIndex] using hxne_outer)
  · exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 0
      (by simpa [rightAdjacentCapByIndex] using hxcap)
      (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex] using hxne_opp)
      (by simpa [leftOuterVertexByIndex, rightOuterVertexByIndex] using hxne_outer)
  · exact S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 1
      (by simpa [rightAdjacentCapByIndex] using hxcap)
      (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex] using hxne_opp)
      (by simpa [leftOuterVertexByIndex, rightOuterVertexByIndex] using hxne_outer)

theorem mem_leftAdjacentInteriorByIndex_of_left_strict_escape
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    {radius : ℝ} (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i)) :
    x ∈ S.leftAdjacentInteriorByIndex i := by
  rcases Finset.mem_sdiff.mp hxEsc with ⟨hxLeft, hxNotSelectedOrRight⟩
  have hxNotSelected : x ∉ S.capByIndex i := by
    intro hxSel
    exact hxNotSelectedOrRight (Finset.mem_union.mpr (Or.inl hxSel))
  have hxne_outer : x ≠ S.leftOuterVertexByIndex i := by
    intro h
    exact hxNotSelected (by
      simpa [h] using S.leftOuterVertexByIndex_mem_capByIndex i)
  exact S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
    i hradius hxT hxLeft hxne_outer

theorem mem_rightAdjacentInteriorByIndex_of_right_strict_escape
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    {radius : ℝ} (hradius : 0 < radius)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i)) :
    x ∈ S.rightAdjacentInteriorByIndex i := by
  rcases Finset.mem_sdiff.mp hxEsc with ⟨hxRight, hxNotSelectedOrLeft⟩
  have hxNotSelected : x ∉ S.capByIndex i := by
    intro hxSel
    exact hxNotSelectedOrLeft (Finset.mem_union.mpr (Or.inl hxSel))
  have hxne_outer : x ≠ S.rightOuterVertexByIndex i := by
    intro h
    exact hxNotSelected (by
      simpa [h] using S.rightOuterVertexByIndex_mem_capByIndex i)
  exact S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
    i hradius hxT hxRight hxne_outer

/-- A positive-radius Moser-centered selected class outside the indexed cap
interior is covered by the two adjacent closed caps. -/
theorem selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius) :
    SelectedClass A (S.oppositeVertexByIndex i) radius \
        S.capInteriorByIndex i ⊆
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentCapByIndex i) ∪
        (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentCapByIndex i) := by
  intro x hx
  rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI⟩
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  fin_cases i
  · by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [leftAdjacentCapByIndex, hxv3] using S.partition.v3_mem_C2⟩
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [rightAdjacentCapByIndex, hxv2] using S.partition.v2_mem_C3⟩
    by_cases hxv1 : x = S.triangle.v1
    · have hxT' : x ∈ SelectedClass A S.triangle.v1 radius := by
        simpa [oppositeVertexByIndex] using hxT
      have hdist : dist S.triangle.v1 S.triangle.v1 = radius := by
        simpa [hxv1] using (mem_selectedClass.mp hxT').2
      have h0r : (0 : ℝ) = radius := by simpa using hdist
      nlinarith
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC1 : x ∉ S.partition.C1 := by
      intro hxC1
      have hxcap : x ∈ S.capByIndex 0 := by simpa [capByIndex] using hxC1
      have hxI := S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 0 hxcap
        (by simpa [rightOuterVertexByIndex] using hxv2)
        (by simpa [leftOuterVertexByIndex] using hxv3)
      exact hxnotI hxI
    have hone := S.partition.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC2 : x ∈ S.partition.C2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [leftAdjacentCapByIndex] using hxC2⟩
    · have hxC3 : x ∈ S.partition.C3 := by
        by_cases hxC3 : x ∈ S.partition.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simp [hxnotC1, hxC2, hxC3] at hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [rightAdjacentCapByIndex] using hxC3⟩
  · by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [leftAdjacentCapByIndex, hxv1] using S.partition.v1_mem_C3⟩
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [rightAdjacentCapByIndex, hxv3] using S.partition.v3_mem_C1⟩
    by_cases hxv2 : x = S.triangle.v2
    · have hxT' : x ∈ SelectedClass A S.triangle.v2 radius := by
        simpa [oppositeVertexByIndex] using hxT
      have hdist : dist S.triangle.v2 S.triangle.v2 = radius := by
        simpa [hxv2] using (mem_selectedClass.mp hxT').2
      have h0r : (0 : ℝ) = radius := by simpa using hdist
      nlinarith
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC2 : x ∉ S.partition.C2 := by
      intro hxC2
      have hxcap : x ∈ S.capByIndex 1 := by simpa [capByIndex] using hxC2
      have hxI := S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 1 hxcap
        (by simpa [rightOuterVertexByIndex] using hxv3)
        (by simpa [leftOuterVertexByIndex] using hxv1)
      exact hxnotI hxI
    have hone := S.partition.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC3 : x ∈ S.partition.C3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [leftAdjacentCapByIndex] using hxC3⟩
    · have hxC1 : x ∈ S.partition.C1 := by
        by_cases hxC1 : x ∈ S.partition.C1
        · exact hxC1
        · have : (0 : ℕ) = 1 := by
            simp [hxC1, hxnotC2, hxC3] at hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [rightAdjacentCapByIndex] using hxC1⟩
  · by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [leftAdjacentCapByIndex, hxv2] using S.partition.v2_mem_C1⟩
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [rightAdjacentCapByIndex, hxv1] using S.partition.v1_mem_C2⟩
    by_cases hxv3 : x = S.triangle.v3
    · have hxT' : x ∈ SelectedClass A S.triangle.v3 radius := by
        simpa [oppositeVertexByIndex] using hxT
      have hdist : dist S.triangle.v3 S.triangle.v3 = radius := by
        simpa [hxv3] using (mem_selectedClass.mp hxT').2
      have h0r : (0 : ℝ) = radius := by simpa using hdist
      nlinarith
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC3 : x ∉ S.partition.C3 := by
      intro hxC3
      have hxcap : x ∈ S.capByIndex 2 := by simpa [capByIndex] using hxC3
      have hxI := S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer 2 hxcap
        (by simpa [rightOuterVertexByIndex] using hxv1)
        (by simpa [leftOuterVertexByIndex] using hxv2)
      exact hxnotI hxI
    have hone := S.partition.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.partition.C1
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [leftAdjacentCapByIndex] using hxC1⟩
    · have hxC2 : x ∈ S.partition.C2 := by
        by_cases hxC2 : x ∈ S.partition.C2
        · exact hxC2
        · have : (0 : ℕ) = 1 := by
            simp [hxC1, hxC2, hxnotC3] at hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr
        ⟨hxT, by simpa [rightAdjacentCapByIndex] using hxC2⟩

/-- Core selector for a Moser-centered selected class at an indexed short cap:
the class has exactly four points, contains the two strict own-cap interior
points, and hits each adjacent closed cap at most once. -/
theorem moserCapCoreSelectorAt
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcap : (S.capByIndex i).card = 4)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    (SelectedClass A (S.oppositeVertexByIndex i) radius).card = 4 ∧
      S.capInteriorByIndex i ⊆
        SelectedClass A (S.oppositeVertexByIndex i) radius ∧
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentCapByIndex i).card ≤ 1 ∧
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentCapByIndex i).card ≤ 1 := by
  classical
  let T : Finset ℝ² := SelectedClass A (S.oppositeVertexByIndex i) radius
  have hleft_one :
      (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i radius
  have hright_one :
      (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i radius
  have hcardT : 4 ≤ T.card := by simpa [T] using hcard
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  have houtside_le :
      (T \ S.capInteriorByIndex i).card ≤ 2 := by
    calc
      (T \ S.capInteriorByIndex i).card
          ≤ ((T ∩ S.leftAdjacentCapByIndex i) ∪
              (T ∩ S.rightAdjacentCapByIndex i)).card := Finset.card_le_card hcover
      _ ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
            (T ∩ S.rightAdjacentCapByIndex i).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit :
      (T \ S.capInteriorByIndex i).card +
          (T ∩ S.capInteriorByIndex i).card = T.card := by
    simp [T, Finset.card_sdiff_add_card_inter]
  have hinter_le :
      (T ∩ S.capInteriorByIndex i).card ≤ (S.capInteriorByIndex i).card :=
    Finset.card_le_card Finset.inter_subset_right
  have hinter_two :
      (S.capInteriorByIndex i).card = 2 :=
    S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four i hcap
  have hT_eq_four : T.card = 4 := by
    omega
  have hinter_ge :
      (S.capInteriorByIndex i).card ≤ (T ∩ S.capInteriorByIndex i).card := by
    omega
  have hinter_eq :
      T ∩ S.capInteriorByIndex i = S.capInteriorByIndex i :=
    Finset.eq_of_subset_of_card_le Finset.inter_subset_right hinter_ge
  have hinter_sub : S.capInteriorByIndex i ⊆ T := by
    intro x hx
    have hx' : x ∈ T ∩ S.capInteriorByIndex i := by simpa [hinter_eq] using hx
    exact Finset.mem_of_mem_inter_left hx'
  exact ⟨by simpa [T] using hT_eq_four,
    by simpa [T] using hinter_sub,
    by simpa [T] using hleft_one,
    by simpa [T] using hright_one⟩

theorem leftStrictEscape_mem_secondSelectedClass
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hradius : 0 < radius) (hρ : 0 < rho)
    (hcap : (S.leftAdjacentCapByIndex i).card = 4)
    (hρcard :
      4 ≤ (SelectedClass A (S.rightOuterVertexByIndex i) rho).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i)) :
    x ∈ SelectedClass A (S.rightOuterVertexByIndex i) rho := by
  have hxI := S.mem_leftAdjacentInteriorByIndex_of_left_strict_escape
    i hradius hxT hxEsc
  have hxI' : x ∈ S.capInteriorByIndex (leftAdjacentIndex i) := by
    simpa [S.leftAdjacentInteriorByIndex_eq_capInteriorByIndex i] using hxI
  have hcap' : (S.capByIndex (leftAdjacentIndex i)).card = 4 := by
    simpa [S.leftAdjacentCapByIndex_eq_capByIndex i] using hcap
  have hρcard' :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex (leftAdjacentIndex i)) rho).card := by
    simpa [S.oppositeVertexByIndex_leftAdjacentIndex i] using hρcard
  have hcore :=
    S.moserCapCoreSelectorAt hconv (leftAdjacentIndex i) hρ hcap' hρcard'
  exact by
    simpa [S.oppositeVertexByIndex_leftAdjacentIndex i] using hcore.2.1 hxI'

theorem rightStrictEscape_mem_secondSelectedClass
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hradius : 0 < radius) (hρ : 0 < rho)
    (hcap : (S.rightAdjacentCapByIndex i).card = 4)
    (hρcard :
      4 ≤ (SelectedClass A (S.leftOuterVertexByIndex i) rho).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i)) :
    x ∈ SelectedClass A (S.leftOuterVertexByIndex i) rho := by
  have hxI := S.mem_rightAdjacentInteriorByIndex_of_right_strict_escape
    i hradius hxT hxEsc
  have hxI' : x ∈ S.capInteriorByIndex (rightAdjacentIndex i) := by
    simpa [S.rightAdjacentInteriorByIndex_eq_capInteriorByIndex i] using hxI
  have hcap' : (S.capByIndex (rightAdjacentIndex i)).card = 4 := by
    simpa [S.rightAdjacentCapByIndex_eq_capByIndex i] using hcap
  have hρcard' :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex (rightAdjacentIndex i)) rho).card := by
    simpa [S.oppositeVertexByIndex_rightAdjacentIndex i] using hρcard
  have hcore :=
    S.moserCapCoreSelectorAt hconv (rightAdjacentIndex i) hρ hcap' hρcard'
  exact by
    simpa [S.oppositeVertexByIndex_rightAdjacentIndex i] using hcore.2.1 hxI'

/-- Endpoint-style selector packet at one cyclic Moser vertex: the selected
class has four points, contains the two strict interior points of its own
short cap, and has singleton intersections with the adjacent closed caps. -/
def MoserSelectorShapeAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (radius : ℝ) :
    Prop :=
  let T := SelectedClass A (S.oppositeVertexByIndex i) radius
  T.card = 4 ∧
    S.capInteriorByIndex i ⊆ T ∧
    ∃ p q : ℝ²,
      p ∈ S.leftAdjacentCapByIndex i ∧
      q ∈ S.rightAdjacentCapByIndex i ∧
      T ∩ S.leftAdjacentCapByIndex i = ({p} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex i = ({q} : Finset ℝ²)

/-- Four-point selector packet for a Moser-centered selected class.  Unlike
`MoserSelectorShapeAt`, this is stated for an extracted subpacket `T`, so it can
be used when the indexed own cap is the surplus cap and cannot itself be the
four-point selected class. -/
def MoserSubpacketSelectorShapeAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (radius : ℝ)
    (T : Finset ℝ²) : Prop :=
  T ⊆ SelectedClass A (S.oppositeVertexByIndex i) radius ∧
    T.card = 4 ∧
    ∃ p q : ℝ²,
      p ∈ S.leftAdjacentCapByIndex i ∧
      q ∈ S.rightAdjacentCapByIndex i ∧
      T ∩ S.leftAdjacentCapByIndex i = ({p} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex i = ({q} : Finset ℝ²)

/-- A short cap under convex independence has the endpoint-style selector
shape at its opposite Moser vertex. -/
theorem moserSelectorShapeAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcap : (S.capByIndex i).card = 4)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    S.MoserSelectorShapeAt i radius := by
  classical
  let T : Finset ℝ² := SelectedClass A (S.oppositeVertexByIndex i) radius
  have hcore := S.moserCapCoreSelectorAt hconv i hradius hcap hcard
  rcases hcore with ⟨hTcard, hIsub, hleftle, hrightle⟩
  have hTcard' : T.card = 4 := by simpa [T] using hTcard
  have hleftle' : (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using hleftle
  have hrightle' : (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using hrightle
  have hIcard : (S.capInteriorByIndex i).card = 2 :=
    S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four i hcap
  have hIsub' : S.capInteriorByIndex i ⊆ T ∩ S.capInteriorByIndex i := by
    intro z hz
    exact Finset.mem_inter.mpr ⟨by simpa [T] using hIsub hz, hz⟩
  have hTminus_eq_two : (T \ S.capInteriorByIndex i).card = 2 := by
    have hsplit :
        (T \ S.capInteriorByIndex i).card +
            (T ∩ S.capInteriorByIndex i).card = T.card := by
      simp [T, Finset.card_sdiff_add_card_inter]
    have hIge :
        (S.capInteriorByIndex i).card ≤
          (T ∩ S.capInteriorByIndex i).card :=
      Finset.card_le_card hIsub'
    have hIle :
        (T ∩ S.capInteriorByIndex i).card ≤
          (S.capInteriorByIndex i).card :=
      Finset.card_le_card Finset.inter_subset_right
    omega
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  have hUnion_eq_two :
      ((T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i)).card = 2 := by
    have hTminus_le :
        (T \ S.capInteriorByIndex i).card ≤
          ((T ∩ S.leftAdjacentCapByIndex i) ∪
            (T ∩ S.rightAdjacentCapByIndex i)).card :=
      Finset.card_le_card hcover
    have hUnion_le :
        ((T ∩ S.leftAdjacentCapByIndex i) ∪
            (T ∩ S.rightAdjacentCapByIndex i)).card ≤ 2 := by
      calc
        ((T ∩ S.leftAdjacentCapByIndex i) ∪
            (T ∩ S.rightAdjacentCapByIndex i)).card
            ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
                (T ∩ S.rightAdjacentCapByIndex i).card :=
              Finset.card_union_le _ _
        _ ≤ 1 + 1 := by omega
        _ = 2 := by norm_num
    omega
  have hsum_eq_two :
      (T ∩ S.leftAdjacentCapByIndex i).card +
          (T ∩ S.rightAdjacentCapByIndex i).card = 2 := by
    have hUnion_le_sum :
        ((T ∩ S.leftAdjacentCapByIndex i) ∪
            (T ∩ S.rightAdjacentCapByIndex i)).card ≤
          (T ∩ S.leftAdjacentCapByIndex i).card +
            (T ∩ S.rightAdjacentCapByIndex i).card :=
      Finset.card_union_le _ _
    omega
  have hlefteq1 : (T ∩ S.leftAdjacentCapByIndex i).card = 1 := by
    omega
  have hrighteq1 : (T ∩ S.rightAdjacentCapByIndex i).card = 1 := by
    omega
  obtain ⟨p, hpeq⟩ := Finset.card_eq_one.mp hlefteq1
  obtain ⟨q, hqeq⟩ := Finset.card_eq_one.mp hrighteq1
  have hp_left : p ∈ S.leftAdjacentCapByIndex i := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).2
  have hq_right : q ∈ S.rightAdjacentCapByIndex i := by
    have hqmem : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hqeq] at hqmem
    exact (Finset.mem_inter.mp hqmem).2
  exact ⟨by simpa [T] using hTcard',
    by simpa [T] using hIsub,
    p, q, hp_left, hq_right,
    by simpa [T] using hpeq,
    by simpa [T] using hqeq⟩

theorem rightSecondSelectedClass_selectedCap_singleton
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {rho : ℝ}
    (hρ : 0 < rho)
    (hcap : (S.rightAdjacentCapByIndex i).card = 4)
    (hρcard :
      4 ≤ (SelectedClass A (S.leftOuterVertexByIndex i) rho).card) :
    ∃ y : ℝ²,
      y ∈ S.capByIndex i ∧
        SelectedClass A (S.leftOuterVertexByIndex i) rho ∩
          S.capByIndex i = ({y} : Finset ℝ²) := by
  have hcap' : (S.capByIndex (rightAdjacentIndex i)).card = 4 := by
    simpa [S.rightAdjacentCapByIndex_eq_capByIndex i] using hcap
  have hρcard' :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex (rightAdjacentIndex i)) rho).card := by
    simpa [S.oppositeVertexByIndex_rightAdjacentIndex i] using hρcard
  rcases S.moserSelectorShapeAt_of_convexIndep hconv
      (rightAdjacentIndex i) hρ hcap' hρcard' with
    ⟨_hTcard, _hIsub, y, _z, hyCap, _hzCap, hySing, _hzSing⟩
  exact ⟨y,
    by simpa [S.leftAdjacentCapByIndex_rightAdjacentIndex i] using hyCap,
    by
      simpa [S.oppositeVertexByIndex_rightAdjacentIndex i,
        S.leftAdjacentCapByIndex_rightAdjacentIndex i] using hySing⟩

theorem leftSecondSelectedClass_selectedCap_singleton
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {rho : ℝ}
    (hρ : 0 < rho)
    (hcap : (S.leftAdjacentCapByIndex i).card = 4)
    (hρcard :
      4 ≤ (SelectedClass A (S.rightOuterVertexByIndex i) rho).card) :
    ∃ y : ℝ²,
      y ∈ S.capByIndex i ∧
        SelectedClass A (S.rightOuterVertexByIndex i) rho ∩
          S.capByIndex i = ({y} : Finset ℝ²) := by
  have hcap' : (S.capByIndex (leftAdjacentIndex i)).card = 4 := by
    simpa [S.leftAdjacentCapByIndex_eq_capByIndex i] using hcap
  have hρcard' :
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex (leftAdjacentIndex i)) rho).card := by
    simpa [S.oppositeVertexByIndex_leftAdjacentIndex i] using hρcard
  rcases S.moserSelectorShapeAt_of_convexIndep hconv
      (leftAdjacentIndex i) hρ hcap' hρcard' with
    ⟨_hTcard, _hIsub, _z, y, _hzCap, hyCap, _hzSing, hySing⟩
  exact ⟨y,
    by simpa [S.rightAdjacentCapByIndex_leftAdjacentIndex i] using hyCap,
    by
      simpa [S.oppositeVertexByIndex_leftAdjacentIndex i,
        S.rightAdjacentCapByIndex_leftAdjacentIndex i] using hySing⟩

/-- A Moser-centered selected class admits a four-point selector subpacket
preserving one chosen point from each adjacent closed cap.  Convexity supplies
the closed-cap one-hit bounds, so the preserved rows become singleton rows
inside the extracted packet.

This is the surplus-cap version of the endpoint selector interface: it avoids
claiming that the selected class contains the whole own cap, and records only
the adjacent singleton rows needed by the downstream form exclusions. -/
theorem exists_moserSubpacketSelectorShapeAt_preserving_adjacent
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (_hradius : 0 < radius)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    {p q : ℝ²}
    (hp : p ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
      S.leftAdjacentCapByIndex i)
    (hq : q ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
      S.rightAdjacentCapByIndex i) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      q ∈ T ∧
      S.MoserSubpacketSelectorShapeAt i radius T := by
  classical
  let P : Finset ℝ² := {p, q}
  have hPsub : P ⊆ SelectedClass A (S.oppositeVertexByIndex i) radius := by
    intro z hz
    simp only [P, Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_of_mem_inter_left hp
    · exact Finset.mem_of_mem_inter_left hq
  have hPcard : P.card ≤ 4 := by
    dsimp [P]
    by_cases hpq : p = q
    · subst hpq
      simp
    · simp [hpq]
  rcases Problem97.FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four
      hPsub hPcard hcard with
    ⟨T, hP_T, hTsub, hTcard⟩
  have hpT : p ∈ T := hP_T (by simp [P])
  have hqT : q ∈ T := hP_T (by simp [P])
  have hleftle_full :
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentCapByIndex i).card ≤ 1 :=
    S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i radius
  have hrightle_full :
      (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentCapByIndex i).card ≤ 1 :=
    S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep hconv i radius
  have hleft_sub :
      T ∩ S.leftAdjacentCapByIndex i ⊆
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.leftAdjacentCapByIndex i := by
    intro z hz
    exact Finset.mem_inter.mpr
      ⟨hTsub (Finset.mem_of_mem_inter_left hz),
        Finset.mem_of_mem_inter_right hz⟩
  have hright_sub :
      T ∩ S.rightAdjacentCapByIndex i ⊆
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
          S.rightAdjacentCapByIndex i := by
    intro z hz
    exact Finset.mem_inter.mpr
      ⟨hTsub (Finset.mem_of_mem_inter_left hz),
        Finset.mem_of_mem_inter_right hz⟩
  have hleftle : (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 :=
    le_trans (Finset.card_le_card hleft_sub) hleftle_full
  have hrightle : (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 :=
    le_trans (Finset.card_le_card hright_sub) hrightle_full
  have hleft_pos : 1 ≤ (T ∩ S.leftAdjacentCapByIndex i).card := by
    have hpos : 0 < (T ∩ S.leftAdjacentCapByIndex i).card :=
      Finset.card_pos.mpr
        ⟨p, Finset.mem_inter.mpr ⟨hpT, Finset.mem_of_mem_inter_right hp⟩⟩
    omega
  have hright_pos : 1 ≤ (T ∩ S.rightAdjacentCapByIndex i).card := by
    have hpos : 0 < (T ∩ S.rightAdjacentCapByIndex i).card :=
      Finset.card_pos.mpr
        ⟨q, Finset.mem_inter.mpr ⟨hqT, Finset.mem_of_mem_inter_right hq⟩⟩
    omega
  have hlefteq1 : (T ∩ S.leftAdjacentCapByIndex i).card = 1 := by
    omega
  have hrighteq1 : (T ∩ S.rightAdjacentCapByIndex i).card = 1 := by
    omega
  obtain ⟨p', hp'eq⟩ := Finset.card_eq_one.mp hlefteq1
  obtain ⟨q', hq'eq⟩ := Finset.card_eq_one.mp hrighteq1
  have hp'_left : p' ∈ S.leftAdjacentCapByIndex i := by
    have hp'mem : p' ∈ ({p'} : Finset ℝ²) := by simp
    rw [← hp'eq] at hp'mem
    exact (Finset.mem_inter.mp hp'mem).2
  have hq'_right : q' ∈ S.rightAdjacentCapByIndex i := by
    have hq'mem : q' ∈ ({q'} : Finset ℝ²) := by simp
    rw [← hq'eq] at hq'mem
    exact (Finset.mem_inter.mp hq'mem).2
  exact ⟨T, hpT, hqT, hTsub, hTcard,
    p', q', hp'_left, hq'_right, hp'eq, hq'eq⟩

/-- Specialization of
`exists_moserSubpacketSelectorShapeAt_preserving_adjacent` to the actual
surplus cap index. -/
theorem exists_surplusMoserSubpacketSelectorShape_preserving_adjacent
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius).card)
    {p q : ℝ²}
    (hp : p ∈ SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
      S.leftAdjacentCapByIndex S.surplusIdx)
    (hq : q ∈ SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
      S.rightAdjacentCapByIndex S.surplusIdx) :
    ∃ T : Finset ℝ²,
      p ∈ T ∧
      q ∈ T ∧
      S.MoserSubpacketSelectorShapeAt S.surplusIdx radius T :=
  S.exists_moserSubpacketSelectorShapeAt_preserving_adjacent hconv
    S.surplusIdx hradius hcard hp hq

/-- If both adjacent interiors are named two-point sets, a subpacket selector
row splits each adjacent singleton into one of the two named interior points or
the corresponding outer Moser endpoint. -/
theorem moserSubpacketSelectorShapeAt_adjacent_named_or_outer
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius : ℝ} {T : Finset ℝ²}
    (hradius : 0 < radius)
    (hshape : S.MoserSubpacketSelectorShapeAt i radius T)
    {l₁ l₂ r₁ r₂ : ℝ²}
    (hleftPair :
      S.leftAdjacentInteriorByIndex i = ({l₁, l₂} : Finset ℝ²))
    (hrightPair :
      S.rightAdjacentInteriorByIndex i = ({r₁, r₂} : Finset ℝ²)) :
    ∃ p q : ℝ²,
      p ∈ ({l₁, l₂, S.leftOuterVertexByIndex i} : Finset ℝ²) ∧
      q ∈ ({r₁, r₂, S.rightOuterVertexByIndex i} : Finset ℝ²) ∧
      T ∩ S.leftAdjacentCapByIndex i = ({p} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex i = ({q} : Finset ℝ²) := by
  classical
  rcases hshape with ⟨hTsub, _hTcard, p, q, hpCap, hqCap, hpeq, hqeq⟩
  have hpT : p ∈ T := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  have hqT : q ∈ T := by
    have hqmem : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hqeq] at hqmem
    exact (Finset.mem_inter.mp hqmem).1
  have hpNamed :
      p ∈ ({l₁, l₂, S.leftOuterVertexByIndex i} : Finset ℝ²) := by
    by_cases hpOuter : p = S.leftOuterVertexByIndex i
    · simp [hpOuter]
    · have hpI :
        p ∈ S.leftAdjacentInteriorByIndex i :=
          S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
            i hradius (hTsub hpT) hpCap hpOuter
      have hpPair : p ∈ ({l₁, l₂} : Finset ℝ²) := by
        simpa [hleftPair] using hpI
      rcases Finset.mem_insert.mp hpPair with hp1 | hp2
      · simp [hp1]
      · have hp2' : p = l₂ := by simpa using hp2
        simp [hp2']
  have hqNamed :
      q ∈ ({r₁, r₂, S.rightOuterVertexByIndex i} : Finset ℝ²) := by
    by_cases hqOuter : q = S.rightOuterVertexByIndex i
    · simp [hqOuter]
    · have hqI :
        q ∈ S.rightAdjacentInteriorByIndex i :=
          S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
            i hradius (hTsub hqT) hqCap hqOuter
      have hqPair : q ∈ ({r₁, r₂} : Finset ℝ²) := by
        simpa [hrightPair] using hqI
      rcases Finset.mem_insert.mp hqPair with hq1 | hq2
      · simp [hq1]
      · have hq2' : q = r₂ := by simpa using hq2
        simp [hq2']
  exact ⟨p, q, hpNamed, hqNamed, hpeq, hqeq⟩

/-- N4e-style containment at one cyclic cap index: every Moser-centered
four-class at the opposite vertex is contained in the corresponding cap. -/
def MoserCapContainmentAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ}, 0 < radius →
    4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card →
    SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i

/-- Full N4e-style containment for a general surplus packet. -/
def MoserCapContainment
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Prop :=
  ∀ i : Fin 3, S.MoserCapContainmentAt i

/-- The weaker containment interface actually needed by the Q-facing
non-surplus Moser row. -/
def NonSurplusMoserCapContainment
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Prop :=
  S.MoserCapContainmentAt S.oppIndex1 ∧
    S.MoserCapContainmentAt S.oppIndex2

/-- Full Moser-cap containment supplies the non-surplus-only interface. -/
theorem nonSurplusMoserCapContainment_of_moserCapContainment
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hcontain : S.MoserCapContainment) :
    S.NonSurplusMoserCapContainment :=
  ⟨hcontain S.oppIndex1, hcontain S.oppIndex2⟩

/-- The three escaped forms used by the non-surplus Moser-cap containment
producer.  This mirrors the endpoint `N4c` shape, but is local to the
general-`n` surplus-packet interface. -/
inductive MoserCapEscapedForm where
  | a
  | b
  | c
  deriving DecidableEq, Repr

/-- Non-surplus `N4c` Form `a` at one cyclic cap index: the escaped
Moser-centered four-class uses one strict-interior point from each adjacent
cap. -/
def IsMoserCapFormAAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (radius : ℝ) :
    Prop :=
  ∃ x y : ℝ²,
    x ∈ S.leftAdjacentInteriorByIndex i ∧
    y ∈ S.rightAdjacentInteriorByIndex i ∧
    SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i = ({x} : Finset ℝ²) ∧
    SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i = ({y} : Finset ℝ²)

/-- Non-surplus `N4c` Form `b` at one cyclic cap index: the escaped
Moser-centered four-class uses one strict-interior point on the left-adjacent
cap and the outer Moser endpoint on the right-adjacent cap. -/
def IsMoserCapFormBAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (radius : ℝ) :
    Prop :=
  ∃ x : ℝ²,
    x ∈ S.leftAdjacentInteriorByIndex i ∧
    SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i = ({x} : Finset ℝ²) ∧
    SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i =
          ({S.rightOuterVertexByIndex i} : Finset ℝ²)

/-- Non-surplus `N4c` Form `c` at one cyclic cap index: the escaped
Moser-centered four-class uses the outer Moser endpoint on the left-adjacent
cap and one strict-interior point on the right-adjacent cap. -/
def IsMoserCapFormCAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (radius : ℝ) :
    Prop :=
  ∃ y : ℝ²,
    y ∈ S.rightAdjacentInteriorByIndex i ∧
    SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i =
          ({S.leftOuterVertexByIndex i} : Finset ℝ²) ∧
    SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i = ({y} : Finset ℝ²)

/-- The strict adjacent-cap escape branch for a Moser-centered selected class
at one cyclic cap index. -/
def StrictAdjacentEscapeAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (radius : ℝ) :
    Prop :=
  ∃ x, x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∧
    (x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i) ∨
      x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i))

/-- Right-adjacent endpoint residual for the local endpoint-escape reduction.

The first radius is centered at the surplus/opposite vertex for `capByIndex i`.
The second radius is centered at the opposite vertex of the right-adjacent cap,
which is `leftOuterVertexByIndex i`. The shared endpoint between the selected
cap and the right-adjacent cap is `rightOuterVertexByIndex i`; this residual is
the branch where that shared endpoint is on the second radius but off the first
radius. -/
def EndpointEscapeRightAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (radius rho : ℝ) (x : ℝ²) : Prop :=
  0 < radius ∧
  0 < rho ∧
  4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card ∧
  x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∧
  x ∈ S.rightAdjacentCapByIndex i \
      (S.capByIndex i ∪ S.leftAdjacentCapByIndex i) ∧
  4 ≤ (SelectedClass A (S.leftOuterVertexByIndex i) rho).card ∧
  dist x (S.leftOuterVertexByIndex i) = rho ∧
  dist (S.rightOuterVertexByIndex i) (S.leftOuterVertexByIndex i) = rho ∧
  dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) ≠ radius

/-- Left-adjacent endpoint residual for the local endpoint-escape reduction. -/
def EndpointEscapeLeftAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (radius rho : ℝ) (x : ℝ²) : Prop :=
  0 < radius ∧
  0 < rho ∧
  4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card ∧
  x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∧
  x ∈ S.leftAdjacentCapByIndex i \
      (S.capByIndex i ∪ S.rightAdjacentCapByIndex i) ∧
  4 ≤ (SelectedClass A (S.rightOuterVertexByIndex i) rho).card ∧
  dist x (S.rightOuterVertexByIndex i) = rho ∧
  dist (S.leftOuterVertexByIndex i) (S.rightOuterVertexByIndex i) = rho ∧
  dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) ≠ radius

theorem rightEndpointOnFirstRadius_false
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i))
    (hxρ : dist x (S.leftOuterVertexByIndex i) = rho)
    (hsharedρ :
      dist (S.rightOuterVertexByIndex i) (S.leftOuterVertexByIndex i) = rho)
    (hsharedFirst :
      dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) = radius) :
    False := by
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hxFirst : dist x (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hxT).2
  rcases Finset.mem_sdiff.mp hxEsc with ⟨_hxRight, hxNotSelectedOrLeft⟩
  have hxNotSelected : x ∉ S.capByIndex i := by
    intro hxSel
    exact hxNotSelectedOrLeft (Finset.mem_union.mpr (Or.inl hxSel))
  have hxNotLeft : x ∉ S.leftAdjacentCapByIndex i := by
    intro hxLeft
    exact hxNotSelectedOrLeft (Finset.mem_union.mpr (Or.inr hxLeft))
  have hsharedA : S.rightOuterVertexByIndex i ∈ A :=
    S.capByIndex_subset i (S.rightOuterVertexByIndex_mem_capByIndex i)
  have hne : x ≠ S.rightOuterVertexByIndex i := by
    intro h
    exact hxNotSelected (by
      simpa [h] using S.rightOuterVertexByIndex_mem_capByIndex i)
  fin_cases i
  · have hsharedNotLeft :
        S.rightOuterVertexByIndex 0 ∉ S.leftAdjacentCapByIndex 0 := by
      simpa [rightOuterVertexByIndex, leftAdjacentCapByIndex] using
        S.partition.v2_notin_C2
    exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (1 : Fin 3)
      hxA hsharedA
      (by simpa [leftAdjacentCapByIndex] using hxNotLeft)
      (by simpa [rightOuterVertexByIndex, leftAdjacentCapByIndex] using hsharedNotLeft)
      (by simpa [rightOuterVertexByIndex] using hne)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [rightOuterVertexByIndex, leftOuterVertexByIndex, triangleByIndex] using
        hsharedρ)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex, triangleByIndex] using
        hsharedFirst)
  · have hsharedNotLeft :
        S.rightOuterVertexByIndex 1 ∉ S.leftAdjacentCapByIndex 1 := by
      simpa [rightOuterVertexByIndex, leftAdjacentCapByIndex] using
        S.partition.v3_notin_C3
    exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (2 : Fin 3)
      hxA hsharedA
      (by simpa [leftAdjacentCapByIndex] using hxNotLeft)
      (by simpa [rightOuterVertexByIndex, leftAdjacentCapByIndex] using hsharedNotLeft)
      (by simpa [rightOuterVertexByIndex] using hne)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [rightOuterVertexByIndex, leftOuterVertexByIndex, triangleByIndex] using
        hsharedρ)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex, triangleByIndex] using
        hsharedFirst)
  · have hsharedNotLeft :
        S.rightOuterVertexByIndex 2 ∉ S.leftAdjacentCapByIndex 2 := by
      simpa [rightOuterVertexByIndex, leftAdjacentCapByIndex] using
        S.partition.v1_notin_C1
    exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (0 : Fin 3)
      hxA hsharedA
      (by simpa [leftAdjacentCapByIndex] using hxNotLeft)
      (by simpa [rightOuterVertexByIndex, leftAdjacentCapByIndex] using hsharedNotLeft)
      (by simpa [rightOuterVertexByIndex] using hne)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [rightOuterVertexByIndex, leftOuterVertexByIndex, triangleByIndex] using
        hsharedρ)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex, triangleByIndex] using
        hsharedFirst)

theorem leftEndpointOnFirstRadius_false
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i))
    (hxρ : dist x (S.rightOuterVertexByIndex i) = rho)
    (hsharedρ :
      dist (S.leftOuterVertexByIndex i) (S.rightOuterVertexByIndex i) = rho)
    (hsharedFirst :
      dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) = radius) :
    False := by
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hxFirst : dist x (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hxT).2
  rcases Finset.mem_sdiff.mp hxEsc with ⟨_hxLeft, hxNotSelectedOrRight⟩
  have hxNotSelected : x ∉ S.capByIndex i := by
    intro hxSel
    exact hxNotSelectedOrRight (Finset.mem_union.mpr (Or.inl hxSel))
  have hxNotRight : x ∉ S.rightAdjacentCapByIndex i := by
    intro hxRight
    exact hxNotSelectedOrRight (Finset.mem_union.mpr (Or.inr hxRight))
  have hsharedA : S.leftOuterVertexByIndex i ∈ A :=
    S.capByIndex_subset i (S.leftOuterVertexByIndex_mem_capByIndex i)
  have hne : x ≠ S.leftOuterVertexByIndex i := by
    intro h
    exact hxNotSelected (by
      simpa [h] using S.leftOuterVertexByIndex_mem_capByIndex i)
  fin_cases i
  · have hsharedNotRight :
        S.leftOuterVertexByIndex 0 ∉ S.rightAdjacentCapByIndex 0 := by
      simpa [leftOuterVertexByIndex, rightAdjacentCapByIndex] using
        S.partition.v3_notin_C3
    exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (2 : Fin 3)
      hxA hsharedA
      (by simpa [rightAdjacentCapByIndex] using hxNotRight)
      (by simpa [leftOuterVertexByIndex, rightAdjacentCapByIndex] using hsharedNotRight)
      (by simpa [leftOuterVertexByIndex] using hne)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex, triangleByIndex] using
        hsharedFirst)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [leftOuterVertexByIndex, rightOuterVertexByIndex, triangleByIndex] using
        hsharedρ)
  · have hsharedNotRight :
        S.leftOuterVertexByIndex 1 ∉ S.rightAdjacentCapByIndex 1 := by
      simpa [leftOuterVertexByIndex, rightAdjacentCapByIndex] using
        S.partition.v1_notin_C1
    exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (0 : Fin 3)
      hxA hsharedA
      (by simpa [rightAdjacentCapByIndex] using hxNotRight)
      (by simpa [leftOuterVertexByIndex, rightAdjacentCapByIndex] using hsharedNotRight)
      (by simpa [leftOuterVertexByIndex] using hne)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex, triangleByIndex] using
        hsharedFirst)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [leftOuterVertexByIndex, rightOuterVertexByIndex, triangleByIndex] using
        hsharedρ)
  · have hsharedNotRight :
        S.leftOuterVertexByIndex 2 ∉ S.rightAdjacentCapByIndex 2 := by
      simpa [leftOuterVertexByIndex, rightAdjacentCapByIndex] using
        S.partition.v2_notin_C2
    exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (1 : Fin 3)
      hxA hsharedA
      (by simpa [rightAdjacentCapByIndex] using hxNotRight)
      (by simpa [leftOuterVertexByIndex, rightAdjacentCapByIndex] using hsharedNotRight)
      (by simpa [leftOuterVertexByIndex] using hne)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex, triangleByIndex] using
        hsharedFirst)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [leftOuterVertexByIndex, rightOuterVertexByIndex, triangleByIndex] using
        hsharedρ)

theorem rightPrivateSecondHit_reflection_false
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius rho : ℝ} {x y : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i))
    (hyI : y ∈ S.capInteriorByIndex i)
    (hyT : y ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxρ : dist x (S.leftOuterVertexByIndex i) = rho)
    (hyρ : dist y (S.leftOuterVertexByIndex i) = rho) :
    False := by
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hyA : y ∈ A := (mem_selectedClass.mp hyT).1
  have hxFirst : dist x (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hxT).2
  have hyFirst : dist y (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hyT).2
  rcases Finset.mem_sdiff.mp hxEsc with ⟨_hxRight, hxNotSelectedOrLeft⟩
  have hxNotSelected : x ∉ S.capByIndex i := by
    intro hxSel
    exact hxNotSelectedOrLeft (Finset.mem_union.mpr (Or.inl hxSel))
  have hxNotLeft : x ∉ S.leftAdjacentCapByIndex i := by
    intro hxLeft
    exact hxNotSelectedOrLeft (Finset.mem_union.mpr (Or.inr hxLeft))
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hyI) with
    ⟨hyCap, hyNotAdj⟩
  have hyNotLeft : y ∉ S.leftAdjacentCapByIndex i := by
    intro hyLeft
    exact hyNotAdj (Finset.mem_union.mpr (Or.inl hyLeft))
  have hne : x ≠ y := by
    intro h
    exact hxNotSelected (by simpa [h] using hyCap)
  fin_cases i
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (1 : Fin 3)
      hxA hyA
      (by simpa [leftAdjacentCapByIndex] using hxNotLeft)
      (by simpa [leftAdjacentCapByIndex] using hyNotLeft)
      hne
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hyρ)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hyFirst)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (2 : Fin 3)
      hxA hyA
      (by simpa [leftAdjacentCapByIndex] using hxNotLeft)
      (by simpa [leftAdjacentCapByIndex] using hyNotLeft)
      hne
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hyρ)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hyFirst)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (0 : Fin 3)
      hxA hyA
      (by simpa [leftAdjacentCapByIndex] using hxNotLeft)
      (by simpa [leftAdjacentCapByIndex] using hyNotLeft)
      hne
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [leftOuterVertexByIndex, triangleByIndex] using hyρ)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hyFirst)

theorem leftPrivateSecondHit_reflection_false
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius rho : ℝ} {x y : ℝ²}
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i))
    (hyI : y ∈ S.capInteriorByIndex i)
    (hyT : y ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxρ : dist x (S.rightOuterVertexByIndex i) = rho)
    (hyρ : dist y (S.rightOuterVertexByIndex i) = rho) :
    False := by
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hyA : y ∈ A := (mem_selectedClass.mp hyT).1
  have hxFirst : dist x (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hxT).2
  have hyFirst : dist y (S.oppositeVertexByIndex i) = radius := by
    simpa [dist_comm] using (mem_selectedClass.mp hyT).2
  rcases Finset.mem_sdiff.mp hxEsc with ⟨_hxLeft, hxNotSelectedOrRight⟩
  have hxNotSelected : x ∉ S.capByIndex i := by
    intro hxSel
    exact hxNotSelectedOrRight (Finset.mem_union.mpr (Or.inl hxSel))
  have hxNotRight : x ∉ S.rightAdjacentCapByIndex i := by
    intro hxRight
    exact hxNotSelectedOrRight (Finset.mem_union.mpr (Or.inr hxRight))
  rcases Finset.mem_sdiff.mp (S.capInteriorByIndex_mem_private i hyI) with
    ⟨hyCap, hyNotAdj⟩
  have hyNotRight : y ∉ S.rightAdjacentCapByIndex i := by
    intro hyRight
    exact hyNotAdj (Finset.mem_union.mpr (Or.inr hyRight))
  have hne : x ≠ y := by
    intro h
    exact hxNotSelected (by simpa [h] using hyCap)
  fin_cases i
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (2 : Fin 3)
      hxA hyA
      (by simpa [rightAdjacentCapByIndex] using hxNotRight)
      (by simpa [rightAdjacentCapByIndex] using hyNotRight)
      hne
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hyFirst)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hyρ)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (0 : Fin 3)
      hxA hyA
      (by simpa [rightAdjacentCapByIndex] using hxNotRight)
      (by simpa [rightAdjacentCapByIndex] using hyNotRight)
      hne
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hyFirst)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hyρ)
  · exact S.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex (1 : Fin 3)
      hxA hyA
      (by simpa [rightAdjacentCapByIndex] using hxNotRight)
      (by simpa [rightAdjacentCapByIndex] using hyNotRight)
      hne
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hxFirst)
      (by simpa [oppositeVertexByIndex, triangleByIndex] using hyFirst)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hxρ)
      (by simpa [rightOuterVertexByIndex, triangleByIndex] using hyρ)

theorem rightEndpointEscapeData_elim
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hradius : 0 < radius) (hρ : 0 < rho)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i))
    (hρcard : 4 ≤ (SelectedClass A (S.leftOuterVertexByIndex i) rho).card)
    (hxρ : dist x (S.leftOuterVertexByIndex i) = rho)
    (hsharedρ :
      dist (S.rightOuterVertexByIndex i) (S.leftOuterVertexByIndex i) = rho)
    (hend : S.EndpointEscapeRightAt i radius rho x → False) :
    False := by
  by_cases hsharedFirst :
      dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) ≠ radius
  · exact hend ⟨hradius, hρ, hcard, hxT, hxEsc, hρcard, hxρ, hsharedρ,
      hsharedFirst⟩
  · exact S.rightEndpointOnFirstRadius_false i hxT hxEsc hxρ hsharedρ
      (not_not.mp hsharedFirst)

theorem leftEndpointEscapeData_elim
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hradius : 0 < radius) (hρ : 0 < rho)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i))
    (hρcard : 4 ≤ (SelectedClass A (S.rightOuterVertexByIndex i) rho).card)
    (hxρ : dist x (S.rightOuterVertexByIndex i) = rho)
    (hsharedρ :
      dist (S.leftOuterVertexByIndex i) (S.rightOuterVertexByIndex i) = rho)
    (hend : S.EndpointEscapeLeftAt i radius rho x → False) :
    False := by
  by_cases hsharedFirst :
      dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) ≠ radius
  · exact hend ⟨hradius, hρ, hcard, hxT, hxEsc, hρcard, hxρ, hsharedρ,
      hsharedFirst⟩
  · exact S.leftEndpointOnFirstRadius_false i hxT hxEsc hxρ hsharedρ
      (not_not.mp hsharedFirst)

theorem rightStrictEscape_endpointData_elim
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hradius : 0 < radius) (hρ : 0 < rho)
    (hcap : (S.capByIndex i).card = 4)
    (hcapRight : (S.rightAdjacentCapByIndex i).card = 4)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.leftAdjacentCapByIndex i))
    (hρcard : 4 ≤ (SelectedClass A (S.leftOuterVertexByIndex i) rho).card)
    (hend : S.EndpointEscapeRightAt i radius rho x → False) :
    False := by
  have hxSecond := S.rightStrictEscape_mem_secondSelectedClass hconv i
    hradius hρ hcapRight hρcard hxT hxEsc
  have hxρ : dist x (S.leftOuterVertexByIndex i) = rho := by
    simpa [dist_comm] using (mem_selectedClass.mp hxSecond).2
  rcases S.rightSecondSelectedClass_selectedCap_singleton hconv i
      hρ hcapRight hρcard with
    ⟨y, hyCap, hySing⟩
  have hyMem :
      y ∈ SelectedClass A (S.leftOuterVertexByIndex i) rho ∩
        S.capByIndex i := by
    rw [hySing]
    exact Finset.mem_singleton_self y
  have hySecond :
      y ∈ SelectedClass A (S.leftOuterVertexByIndex i) rho :=
    (Finset.mem_inter.mp hyMem).1
  have hyρ : dist y (S.leftOuterVertexByIndex i) = rho := by
    simpa [dist_comm] using (mem_selectedClass.mp hySecond).2
  by_cases hyRight : y = S.rightOuterVertexByIndex i
  · have hsharedρ :
        dist (S.rightOuterVertexByIndex i) (S.leftOuterVertexByIndex i) =
          rho := by
      simpa [hyRight] using hyρ
    exact S.rightEndpointEscapeData_elim i hradius hρ hcard hxT hxEsc
      hρcard hxρ hsharedρ hend
  · by_cases hyLeft : y = S.leftOuterVertexByIndex i
    · have hzero : (0 : ℝ) = rho := by
        simpa [hyLeft] using (mem_selectedClass.mp hySecond).2
      nlinarith
    · have hyI : y ∈ S.capInteriorByIndex i :=
        S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer i
          hyCap hyRight hyLeft
      have hcore := S.moserCapCoreSelectorAt hconv i hradius hcap hcard
      have hyT : y ∈ SelectedClass A (S.oppositeVertexByIndex i) radius :=
        hcore.2.1 hyI
      exact S.rightPrivateSecondHit_reflection_false i hxT hxEsc hyI hyT
        hxρ hyρ

theorem leftStrictEscape_endpointData_elim
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {radius rho : ℝ} {x : ℝ²}
    (hradius : 0 < radius) (hρ : 0 < rho)
    (hcap : (S.capByIndex i).card = 4)
    (hcapLeft : (S.leftAdjacentCapByIndex i).card = 4)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex i \
        (S.capByIndex i ∪ S.rightAdjacentCapByIndex i))
    (hρcard : 4 ≤ (SelectedClass A (S.rightOuterVertexByIndex i) rho).card)
    (hend : S.EndpointEscapeLeftAt i radius rho x → False) :
    False := by
  have hxSecond := S.leftStrictEscape_mem_secondSelectedClass hconv i
    hradius hρ hcapLeft hρcard hxT hxEsc
  have hxρ : dist x (S.rightOuterVertexByIndex i) = rho := by
    simpa [dist_comm] using (mem_selectedClass.mp hxSecond).2
  rcases S.leftSecondSelectedClass_selectedCap_singleton hconv i
      hρ hcapLeft hρcard with
    ⟨y, hyCap, hySing⟩
  have hyMem :
      y ∈ SelectedClass A (S.rightOuterVertexByIndex i) rho ∩
        S.capByIndex i := by
    rw [hySing]
    exact Finset.mem_singleton_self y
  have hySecond :
      y ∈ SelectedClass A (S.rightOuterVertexByIndex i) rho :=
    (Finset.mem_inter.mp hyMem).1
  have hyρ : dist y (S.rightOuterVertexByIndex i) = rho := by
    simpa [dist_comm] using (mem_selectedClass.mp hySecond).2
  by_cases hyLeft : y = S.leftOuterVertexByIndex i
  · have hsharedρ :
        dist (S.leftOuterVertexByIndex i) (S.rightOuterVertexByIndex i) =
          rho := by
      simpa [hyLeft] using hyρ
    exact S.leftEndpointEscapeData_elim i hradius hρ hcard hxT hxEsc
      hρcard hxρ hsharedρ hend
  · by_cases hyRight : y = S.rightOuterVertexByIndex i
    · have hzero : (0 : ℝ) = rho := by
        simpa [hyRight] using (mem_selectedClass.mp hySecond).2
      nlinarith
    · have hyI : y ∈ S.capInteriorByIndex i :=
        S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer i
          hyCap hyRight hyLeft
      have hcore := S.moserCapCoreSelectorAt hconv i hradius hcap hcard
      have hyT : y ∈ SelectedClass A (S.oppositeVertexByIndex i) radius :=
        hcore.2.1 hyI
      exact S.leftPrivateSecondHit_reflection_false i hxT hxEsc hyI hyT
        hxρ hyρ

/-- Endpoint-radius input at one indexed cap: any K4-sized exact-radius class
around the opposite Moser vertex also contains both Moser endpoints of the
indexed cap. -/
def EndpointRadiusAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ}, 0 < radius →
    4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card →
      dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) = radius ∧
        dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) = radius

/-- No strict adjacent-cap escape occurs for any K4-sized exact-radius class
around the Moser vertex opposite an indexed cap. -/
def NoStrictAdjacentEscapeAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ}, 0 < radius →
    4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card →
      ¬ S.StrictAdjacentEscapeAt i radius

/-- No strict adjacent-cap escape occurs at either non-surplus short cap. -/
def NonSurplusNoStrictAdjacentEscape
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Prop :=
  S.NoStrictAdjacentEscapeAt S.oppIndex1 ∧
    S.NoStrictAdjacentEscapeAt S.oppIndex2

/-- If the two Moser endpoints of an indexed cap lie on the queried radius
around the opposite Moser vertex, the whole selected class is contained in that
indexed cap. -/
theorem selectedClass_subset_capByIndex_of_endpointRadius
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hleft : dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) =
      radius)
    (hright : dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) =
      radius) :
    SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i := by
  intro x hxT
  have hxA : x ∈ A := (mem_selectedClass.mp hxT).1
  have hxDist : dist x (S.oppositeVertexByIndex i) = radius := by
    rw [dist_comm]
    exact (mem_selectedClass.mp hxT).2
  fin_cases i
  · have hxDisk : dist x S.circPacket.center ≤ S.circPacket.radius := by
      simpa [dist_eq_norm] using S.circPacket.disk_contains_A x hxA
    have hArc :
        OnArcOpposite (S.triangleByIndex 0).v1
          (S.triangleByIndex 0).v2 (S.triangleByIndex 0).v3 x := by
      exact onArcOpposite_of_sameDist_apex_of_mem_mecDisk
        (O := S.circPacket.center) (apex := S.triangle.v1)
        (e₁ := S.triangle.v2) (e₂ := S.triangle.v3)
        (p := x) (R := S.circPacket.radius) (d := radius)
        S.circPacket.radius_pos hradius
        (by simpa [dist_eq_norm] using S.circPacket.moser_on_boundary_1)
        (by simpa [dist_eq_norm] using S.circPacket.moser_on_boundary_2)
        (by simpa [dist_eq_norm] using S.circPacket.moser_on_boundary_3)
        (by simpa [rightOuterVertexByIndex, oppositeVertexByIndex] using hright)
        (by simpa [leftOuterVertexByIndex, oppositeVertexByIndex] using hleft)
        (by simpa [oppositeVertexByIndex] using hxDist)
        hxDisk
    exact (S.capByIndex_arc_membership 0 x hxA).mpr hArc
  · have hxDisk : dist x S.circPacket2.center ≤ S.circPacket2.radius := by
      simpa [dist_eq_norm] using S.circPacket2.disk_contains_A x hxA
    have hArc :
        OnArcOpposite (S.triangleByIndex 1).v1
          (S.triangleByIndex 1).v2 (S.triangleByIndex 1).v3 x := by
      exact onArcOpposite_of_sameDist_apex_of_mem_mecDisk
        (O := S.circPacket2.center) (apex := (S.triangleByIndex 1).v1)
        (e₁ := (S.triangleByIndex 1).v2) (e₂ := (S.triangleByIndex 1).v3)
        (p := x) (R := S.circPacket2.radius) (d := radius)
        S.circPacket2.radius_pos hradius
        (by simpa [dist_eq_norm] using S.circPacket2.moser_on_boundary_1)
        (by simpa [dist_eq_norm] using S.circPacket2.moser_on_boundary_2)
        (by simpa [dist_eq_norm] using S.circPacket2.moser_on_boundary_3)
        (by
          simpa [triangleByIndex, rightOuterVertexByIndex, oppositeVertexByIndex]
            using hright)
        (by
          simpa [triangleByIndex, leftOuterVertexByIndex, oppositeVertexByIndex]
            using hleft)
        (by simpa [triangleByIndex, oppositeVertexByIndex] using hxDist)
        hxDisk
    exact (S.capByIndex_arc_membership 1 x hxA).mpr hArc
  · have hxDisk : dist x S.circPacket3.center ≤ S.circPacket3.radius := by
      simpa [dist_eq_norm] using S.circPacket3.disk_contains_A x hxA
    have hArc :
        OnArcOpposite (S.triangleByIndex 2).v1
          (S.triangleByIndex 2).v2 (S.triangleByIndex 2).v3 x := by
      exact onArcOpposite_of_sameDist_apex_of_mem_mecDisk
        (O := S.circPacket3.center) (apex := (S.triangleByIndex 2).v1)
        (e₁ := (S.triangleByIndex 2).v2) (e₂ := (S.triangleByIndex 2).v3)
        (p := x) (R := S.circPacket3.radius) (d := radius)
        S.circPacket3.radius_pos hradius
        (by simpa [dist_eq_norm] using S.circPacket3.moser_on_boundary_1)
        (by simpa [dist_eq_norm] using S.circPacket3.moser_on_boundary_2)
        (by simpa [dist_eq_norm] using S.circPacket3.moser_on_boundary_3)
        (by
          simpa [triangleByIndex, rightOuterVertexByIndex, oppositeVertexByIndex]
            using hright)
        (by
          simpa [triangleByIndex, leftOuterVertexByIndex, oppositeVertexByIndex]
            using hleft)
        (by simpa [triangleByIndex, oppositeVertexByIndex] using hxDist)
        hxDisk
    exact (S.capByIndex_arc_membership 2 x hxA).mpr hArc

/-- Endpoint-radius containment rules out the strict adjacent-cap escape
branch at one indexed cap. -/
theorem not_strictAdjacentEscapeAt_of_endpointRadius
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hleft : dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) =
      radius)
    (hright : dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) =
      radius) :
    ¬ S.StrictAdjacentEscapeAt i radius := by
  intro hEsc
  rcases hEsc with ⟨x, hxT, hxEsc⟩
  have hxCap : x ∈ S.capByIndex i :=
    S.selectedClass_subset_capByIndex_of_endpointRadius i hradius hleft hright hxT
  rcases hxEsc with hxLeft | hxRight
  · exact (Finset.mem_sdiff.mp hxLeft).2
      (Finset.mem_union.mpr (Or.inl hxCap))
  · exact (Finset.mem_sdiff.mp hxRight).2
      (Finset.mem_union.mpr (Or.inl hxCap))

/-- Endpoint-radius production for every K4-sized exact-radius class supplies
the no-strict-adjacent-escape interface. -/
theorem noStrictAdjacentEscapeAt_of_endpointRadiusAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hend : S.EndpointRadiusAt i) :
    S.NoStrictAdjacentEscapeAt i := by
  intro radius hradius hcard
  rcases hend hradius hcard with ⟨hleft, hright⟩
  exact S.not_strictAdjacentEscapeAt_of_endpointRadius i hradius hleft hright

/-- Form `a` gives positive closed-cap hits on both adjacent sides. -/
theorem isMoserCapFormAAt_adjacentClosedCounts_pos
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hform : S.IsMoserCapFormAAt i radius) :
    1 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i).card ∧
      1 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i).card := by
  rcases hform with ⟨_x, _y, _hx, _hy, hleft, hright⟩
  constructor
  · rw [hleft]
    simp
  · rw [hright]
    simp

/-- Form `b` gives positive closed-cap hits on both adjacent sides. -/
theorem isMoserCapFormBAt_adjacentClosedCounts_pos
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hform : S.IsMoserCapFormBAt i radius) :
    1 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i).card ∧
      1 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i).card := by
  rcases hform with ⟨_x, _hx, hleft, hright⟩
  constructor
  · rw [hleft]
    simp
  · rw [hright]
    simp

/-- Form `c` gives positive closed-cap hits on both adjacent sides. -/
theorem isMoserCapFormCAt_adjacentClosedCounts_pos
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hform : S.IsMoserCapFormCAt i radius) :
    1 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i).card ∧
      1 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i).card := by
  rcases hform with ⟨_y, _hy, hleft, hright⟩
  constructor
  · rw [hleft]
    simp
  · rw [hright]
    simp

/-- If the left adjacent interior is named, Form `a` splits into the two named
left-row alternatives while leaving the right-row witness explicit. -/
theorem isMoserCapFormAAt_left_named_split
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    {l₁ l₂ : ℝ²}
    (hleftPair : S.leftAdjacentInteriorByIndex i = ({l₁, l₂} : Finset ℝ²))
    (hform : S.IsMoserCapFormAAt i radius) :
    (∃ y : ℝ²,
        y ∈ S.rightAdjacentInteriorByIndex i ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.leftAdjacentCapByIndex i = ({l₁} : Finset ℝ²) ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.rightAdjacentCapByIndex i = ({y} : Finset ℝ²)) ∨
      (∃ y : ℝ²,
        y ∈ S.rightAdjacentInteriorByIndex i ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.leftAdjacentCapByIndex i = ({l₂} : Finset ℝ²) ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.rightAdjacentCapByIndex i = ({y} : Finset ℝ²)) := by
  rcases hform with ⟨x, y, hx, hy, hleft, hright⟩
  have hxPair : x ∈ ({l₁, l₂} : Finset ℝ²) := by
    simpa [hleftPair] using hx
  rcases Finset.mem_insert.mp hxPair with hx1 | hx2
  · exact Or.inl ⟨y, hy, by simpa [hx1] using hleft, hright⟩
  · have hx2' : x = l₂ := by simpa using hx2
    exact Or.inr ⟨y, hy, by simpa [hx2'] using hleft, hright⟩

/-- If the right adjacent interior is named, Form `a` splits into the two named
right-row alternatives while leaving the left-row witness explicit. -/
theorem isMoserCapFormAAt_right_named_split
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    {r₁ r₂ : ℝ²}
    (hrightPair : S.rightAdjacentInteriorByIndex i = ({r₁, r₂} : Finset ℝ²))
    (hform : S.IsMoserCapFormAAt i radius) :
    (∃ x : ℝ²,
        x ∈ S.leftAdjacentInteriorByIndex i ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.leftAdjacentCapByIndex i = ({x} : Finset ℝ²) ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.rightAdjacentCapByIndex i = ({r₁} : Finset ℝ²)) ∨
      (∃ x : ℝ²,
        x ∈ S.leftAdjacentInteriorByIndex i ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.leftAdjacentCapByIndex i = ({x} : Finset ℝ²) ∧
        SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.rightAdjacentCapByIndex i = ({r₂} : Finset ℝ²)) := by
  rcases hform with ⟨x, y, hx, hy, hleft, hright⟩
  have hyPair : y ∈ ({r₁, r₂} : Finset ℝ²) := by
    simpa [hrightPair] using hy
  rcases Finset.mem_insert.mp hyPair with hy1 | hy2
  · exact Or.inl ⟨x, hx, hleft, by simpa [hy1] using hright⟩
  · have hy2' : y = r₂ := by simpa using hy2
    exact Or.inr ⟨x, hx, hleft, by simpa [hy2'] using hright⟩

/-- If the left adjacent interior is named, Form `b` splits into the two named
left-row alternatives. -/
theorem isMoserCapFormBAt_left_named_split
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    {l₁ l₂ : ℝ²}
    (hleftPair : S.leftAdjacentInteriorByIndex i = ({l₁, l₂} : Finset ℝ²))
    (hform : S.IsMoserCapFormBAt i radius) :
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i = ({l₁} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i =
          ({S.rightOuterVertexByIndex i} : Finset ℝ²)) ∨
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i = ({l₂} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i =
          ({S.rightOuterVertexByIndex i} : Finset ℝ²)) := by
  rcases hform with ⟨x, hx, hleft, hright⟩
  have hxPair : x ∈ ({l₁, l₂} : Finset ℝ²) := by
    simpa [hleftPair] using hx
  rcases Finset.mem_insert.mp hxPair with hx1 | hx2
  · exact Or.inl ⟨by simpa [hx1] using hleft, hright⟩
  · have hx2' : x = l₂ := by simpa using hx2
    exact Or.inr ⟨by simpa [hx2'] using hleft, hright⟩

/-- If the right adjacent interior is named, Form `c` splits into the two named
right-row alternatives. -/
theorem isMoserCapFormCAt_right_named_split
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    {r₁ r₂ : ℝ²}
    (hrightPair : S.rightAdjacentInteriorByIndex i = ({r₁, r₂} : Finset ℝ²))
    (hform : S.IsMoserCapFormCAt i radius) :
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i =
          ({S.leftOuterVertexByIndex i} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i = ({r₁} : Finset ℝ²)) ∨
    (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.leftAdjacentCapByIndex i =
          ({S.leftOuterVertexByIndex i} : Finset ℝ²) ∧
      SelectedClass A (S.oppositeVertexByIndex i) radius ∩
        S.rightAdjacentCapByIndex i = ({r₂} : Finset ℝ²)) := by
  rcases hform with ⟨y, hy, hleft, hright⟩
  have hyPair : y ∈ ({r₁, r₂} : Finset ℝ²) := by
    simpa [hrightPair] using hy
  rcases Finset.mem_insert.mp hyPair with hy1 | hy2
  · exact Or.inl ⟨hleft, by simpa [hy1] using hright⟩
  · have hy2' : y = r₂ := by simpa using hy2
    exact Or.inr ⟨hleft, by simpa [hy2'] using hright⟩

/-- `N4c`-style form trichotomy at one cyclic cap index. -/
abbrev MoserCapFormsAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ}, 0 < radius →
    4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card →
    ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i →
    S.IsMoserCapFormAAt i radius ∨
      S.IsMoserCapFormBAt i radius ∨
      S.IsMoserCapFormCAt i radius

/-- General indexed `N4c` form trichotomy for a short cap. -/
theorem moserCapFormsAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4) :
    S.MoserCapFormsAt i := by
  classical
  intro radius hradius hcard hesc
  let T : Finset ℝ² := SelectedClass A (S.oppositeVertexByIndex i) radius
  have hcore := S.moserCapCoreSelectorAt hconv i hradius hcap hcard
  rcases hcore with ⟨hTcard, hIsub, hleftle, hrightle⟩
  have hTcard' : T.card = 4 := by simpa [T] using hTcard
  have hleftle' : (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using hleftle
  have hrightle' : (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using hrightle
  have hIcard : (S.capInteriorByIndex i).card = 2 :=
    S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four i hcap
  have hIsub' : S.capInteriorByIndex i ⊆ T ∩ S.capInteriorByIndex i := by
    intro z hz
    exact Finset.mem_inter.mpr ⟨by simpa [T] using hIsub hz, hz⟩
  have hTminus_eq_two : (T \ S.capInteriorByIndex i).card = 2 := by
    have hsplit :
        (T \ S.capInteriorByIndex i).card +
            (T ∩ S.capInteriorByIndex i).card = T.card := by
      simp [T, Finset.card_sdiff_add_card_inter]
    have hIge :
        (S.capInteriorByIndex i).card ≤
          (T ∩ S.capInteriorByIndex i).card :=
      Finset.card_le_card hIsub'
    have hIle :
        (T ∩ S.capInteriorByIndex i).card ≤
          (S.capInteriorByIndex i).card :=
      Finset.card_le_card Finset.inter_subset_right
    omega
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  have hUnion_le :
      ((T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i)).card ≤ 2 := by
    calc
      ((T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i)).card
          ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
              (T ∩ S.rightAdjacentCapByIndex i).card :=
            Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hUnion_eq_two :
      ((T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i)).card = 2 := by
    have hTminus_le :
        (T \ S.capInteriorByIndex i).card ≤
          ((T ∩ S.leftAdjacentCapByIndex i) ∪
            (T ∩ S.rightAdjacentCapByIndex i)).card :=
      Finset.card_le_card hcover
    omega
  have hsum_eq_two :
      (T ∩ S.leftAdjacentCapByIndex i).card +
          (T ∩ S.rightAdjacentCapByIndex i).card = 2 := by
    have hUnion_le_sum :
        ((T ∩ S.leftAdjacentCapByIndex i) ∪
            (T ∩ S.rightAdjacentCapByIndex i)).card ≤
          (T ∩ S.leftAdjacentCapByIndex i).card +
            (T ∩ S.rightAdjacentCapByIndex i).card :=
      Finset.card_union_le _ _
    omega
  have hlefteq1 : (T ∩ S.leftAdjacentCapByIndex i).card = 1 := by
    omega
  have hrighteq1 : (T ∩ S.rightAdjacentCapByIndex i).card = 1 := by
    omega
  obtain ⟨x, hxeq⟩ := Finset.card_eq_one.mp hlefteq1
  obtain ⟨y, hyeq⟩ := Finset.card_eq_one.mp hrighteq1
  have hxT : x ∈ T := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).1
  have hyT : y ∈ T := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).1
  have hxleft : x ∈ S.leftAdjacentCapByIndex i := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).2
  have hyright : y ∈ S.rightAdjacentCapByIndex i := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).2
  by_cases hxouter : x = S.leftOuterVertexByIndex i
  · by_cases hyouter : y = S.rightOuterVertexByIndex i
    · have hsubcap : T ⊆ S.capByIndex i := by
        intro z hz
        by_cases hzI : z ∈ S.capInteriorByIndex i
        · exact S.capInteriorByIndex_subset_capByIndex i hzI
        · have hzout : z ∈ T \ S.capInteriorByIndex i :=
            Finset.mem_sdiff.mpr ⟨hz, hzI⟩
          have hzcover := hcover hzout
          rcases Finset.mem_union.mp hzcover with hzleft | hzright
          · have hz_eq : z = x := by
              rw [hxeq] at hzleft
              simpa using hzleft
            simpa [hz_eq, hxouter] using S.leftOuterVertexByIndex_mem_capByIndex i
          · have hz_eq : z = y := by
              rw [hyeq] at hzright
              simpa using hzright
            simpa [hz_eq, hyouter] using S.rightOuterVertexByIndex_mem_capByIndex i
      exact False.elim (hesc (by simpa [T] using hsubcap))
    · have hyI :
          y ∈ S.rightAdjacentInteriorByIndex i :=
        S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
          i hradius (by simpa [T] using hyT) hyright hyouter
      exact Or.inr (Or.inr
        ⟨y, hyI, by simpa [T, hxouter] using hxeq, by simpa [T] using hyeq⟩)
  · by_cases hyouter : y = S.rightOuterVertexByIndex i
    · have hxI :
          x ∈ S.leftAdjacentInteriorByIndex i :=
        S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
          i hradius (by simpa [T] using hxT) hxleft hxouter
      exact Or.inr (Or.inl
        ⟨x, hxI, by simpa [T] using hxeq, by simpa [T, hyouter] using hyeq⟩)
    · have hxI :
          x ∈ S.leftAdjacentInteriorByIndex i :=
        S.mem_leftAdjacentInteriorByIndex_of_mem_leftAdjacentCapByIndex_of_ne_outer
          i hradius (by simpa [T] using hxT) hxleft hxouter
      have hyI :
          y ∈ S.rightAdjacentInteriorByIndex i :=
        S.mem_rightAdjacentInteriorByIndex_of_mem_rightAdjacentCapByIndex_of_ne_outer
          i hradius (by simpa [T] using hyT) hyright hyouter
      exact Or.inl
        ⟨x, y, hxI, hyI, by simpa [T] using hxeq, by simpa [T] using hyeq⟩

/-- The form trichotomy leaves only strict adjacent-cap escapes when
containment in the indexed cap fails. -/
theorem strictAdjacentEscapeAt_of_moserCapFormsAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {radius : ℝ}
    (hforms : S.MoserCapFormsAt i)
    (hradius : 0 < radius)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (hesc : ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆
      S.capByIndex i) :
    S.StrictAdjacentEscapeAt i radius := by
  rcases hforms hradius hcard hesc with hA | hB | hC
  · rcases hA with ⟨x, _y, hxI, _hyI, hleft, _hright⟩
    have hxInter :
        x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.leftAdjacentCapByIndex i := by
      rw [hleft]
      simp
    exact ⟨x, Finset.mem_of_mem_inter_left hxInter,
      Or.inl (S.leftAdjacentInteriorByIndex_mem_strict i hxI)⟩
  · rcases hB with ⟨x, hxI, hleft, _hright⟩
    have hxInter :
        x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.leftAdjacentCapByIndex i := by
      rw [hleft]
      simp
    exact ⟨x, Finset.mem_of_mem_inter_left hxInter,
      Or.inl (S.leftAdjacentInteriorByIndex_mem_strict i hxI)⟩
  · rcases hC with ⟨y, hyI, _hleft, hright⟩
    have hyInter :
        y ∈ SelectedClass A (S.oppositeVertexByIndex i) radius ∩
            S.rightAdjacentCapByIndex i := by
      rw [hright]
      simp
    exact ⟨y, Finset.mem_of_mem_inter_left hyInter,
      Or.inr (S.rightAdjacentInteriorByIndex_mem_strict i hyI)⟩

/-- Upstream placement split at one cyclic short cap: a Moser-centered
four-class is either contained in the cap, or it has a strict adjacent-cap
escape. -/
theorem containment_or_strictAdjacentEscapeAt_of_moserCapFormsAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {radius : ℝ}
    (hforms : S.MoserCapFormsAt i)
    (hradius : 0 < radius)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i ∨
      S.StrictAdjacentEscapeAt i radius := by
  by_cases hsub :
      SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i
  · exact Or.inl hsub
  · exact Or.inr
      (S.strictAdjacentEscapeAt_of_moserCapFormsAt hforms hradius hcard hsub)

/-- Convexity supplies the upstream placement split for any indexed cap of
closed-cardinality four. -/
theorem containment_or_strictAdjacentEscapeAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcap : (S.capByIndex i).card = 4)
    (hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i ∨
      S.StrictAdjacentEscapeAt i radius :=
  S.containment_or_strictAdjacentEscapeAt_of_moserCapFormsAt
    (S.moserCapFormsAt_of_convexIndep hconv i hcap) hradius hcard

/-- No strict adjacent-cap escape upgrades the placement split to containment
at one indexed short cap. -/
theorem moserCapContainmentAt_of_noStrictAdjacentEscapeAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4)
    (hno : S.NoStrictAdjacentEscapeAt i) :
    S.MoserCapContainmentAt i := by
  intro radius hradius hcard
  rcases S.containment_or_strictAdjacentEscapeAt_of_convexIndep
      hconv i hradius hcap hcard with hcontain | hstrict
  · exact hcontain
  · exact False.elim (hno hradius hcard hstrict)

/-- No strict adjacent-cap escape at both non-surplus short caps supplies the
non-surplus containment interface. -/
theorem IsM44.nonSurplusMoserCapContainment_of_convexIndep_noStrictAdjacentEscape
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A)
    (hno : S.NonSurplusNoStrictAdjacentEscape) :
    S.NonSurplusMoserCapContainment :=
  ⟨S.moserCapContainmentAt_of_noStrictAdjacentEscapeAt_of_convexIndep
      hconv S.oppIndex1 hM44.oppIndex1_cap_card_eq_four hno.1,
    S.moserCapContainmentAt_of_noStrictAdjacentEscapeAt_of_convexIndep
      hconv S.oppIndex2 hM44.oppIndex2_cap_card_eq_four hno.2⟩

/-- `N4c`-style classifier at one cyclic cap index: if a Moser-centered
four-class escapes the corresponding cap, it has one of the escaped forms. -/
abbrev MoserCapClassifiesAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Type :=
  ∀ {radius : ℝ}, 0 < radius →
    4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card →
    ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i →
    MoserCapEscapedForm

/-- `N4d`-style exclusion at one cyclic cap index: every classified escaped
Moser-centered four-class is impossible. -/
abbrev MoserCapExcludesAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (_classify : S.MoserCapClassifiesAt i) : Prop :=
  ∀ {radius : ℝ} (_hradius : 0 < radius)
    (_hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (_hesc : ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆
      S.capByIndex i),
    False

/-- Witness-level Form `a` exclusion at one cyclic cap index. -/
abbrev MoserCapExcludesFormAAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ} (_hradius : 0 < radius)
    (_hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (_hesc : ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆
      S.capByIndex i),
    S.IsMoserCapFormAAt i radius → False

/-- Witness-level Form `b` exclusion at one cyclic cap index. -/
abbrev MoserCapExcludesFormBAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ} (_hradius : 0 < radius)
    (_hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (_hesc : ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆
      S.capByIndex i),
    S.IsMoserCapFormBAt i radius → False

/-- Witness-level Form `c` exclusion at one cyclic cap index. -/
abbrev MoserCapExcludesFormCAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Prop :=
  ∀ {radius : ℝ} (_hradius : 0 < radius)
    (_hcard : 4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card)
    (_hesc : ¬ SelectedClass A (S.oppositeVertexByIndex i) radius ⊆
      S.capByIndex i),
    S.IsMoserCapFormCAt i radius → False

/-- Build the theorem-facing escaped-form classifier from a form trichotomy. -/
noncomputable def moserCapClassifiesAt_of_forms
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    (hforms : S.MoserCapFormsAt i) :
    S.MoserCapClassifiesAt i := by
  classical
  intro radius hradius hcard hesc
  by_cases hA : S.IsMoserCapFormAAt i radius
  · exact MoserCapEscapedForm.a
  · by_cases hB : S.IsMoserCapFormBAt i radius
    · exact MoserCapEscapedForm.b
    · have hC : S.IsMoserCapFormCAt i radius := by
        rcases hforms hradius hcard hesc with hA' | hB' | hC'
        · exact False.elim (hA hA')
        · exact False.elim (hB hB')
        · exact hC'
      exact MoserCapEscapedForm.c

/-- `N4d` assembly at one cyclic cap index: once Forms `a`, `b`, and `c` are
each excluded, the whole escaped-class branch is impossible. -/
theorem moserCapExcludesAt_of_form_excludes
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3}
    (hforms : S.MoserCapFormsAt i)
    (hA : S.MoserCapExcludesFormAAt i)
    (hB : S.MoserCapExcludesFormBAt i)
    (hC : S.MoserCapExcludesFormCAt i) :
    S.MoserCapExcludesAt i (S.moserCapClassifiesAt_of_forms hforms) := by
  intro radius hradius hcard hesc
  rcases hforms hradius hcard hesc with hform | hform | hform
  · exact hA hradius hcard hesc hform
  · exact hB hradius hcard hesc hform
  · exact hC hradius hcard hesc hform

/-- The paired non-surplus classifiers needed by the Q-facing Moser row. -/
abbrev NonSurplusMoserCapClassifies
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Type :=
  S.MoserCapClassifiesAt S.oppIndex1 ×
    S.MoserCapClassifiesAt S.oppIndex2

/-- The paired non-surplus escaped-form trichotomies needed by the Q-facing
Moser row. -/
abbrev NonSurplusMoserCapForms
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Prop :=
  S.MoserCapFormsAt S.oppIndex1 ∧
    S.MoserCapFormsAt S.oppIndex2

/-- An `(m,4,4)` packet supplies the two non-surplus form trichotomies under
convex independence. -/
theorem IsM44.nonSurplusMoserCapForms_of_convexIndep
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) :
    S.NonSurplusMoserCapForms :=
  ⟨S.moserCapFormsAt_of_convexIndep hconv S.oppIndex1
      hM44.oppIndex1_cap_card_eq_four,
    S.moserCapFormsAt_of_convexIndep hconv S.oppIndex2
      hM44.oppIndex2_cap_card_eq_four⟩

/-- An `(m,4,4)` packet admits names for the two strict interior points in each
non-surplus short cap. -/
theorem IsM44.exists_oppInterior_pairs
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44) :
    ∃ x1 y1 x2 y2 : ℝ²,
      x1 ≠ y1 ∧ S.oppInterior1 = ({x1, y1} : Finset ℝ²) ∧
      x2 ≠ y2 ∧ S.oppInterior2 = ({x2, y2} : Finset ℝ²) := by
  rcases S.exists_capInteriorByIndex_pair_of_cap_card_eq_four S.oppIndex1
      hM44.oppIndex1_cap_card_eq_four with
    ⟨x1, y1, hxy1, hpair1⟩
  rcases S.exists_capInteriorByIndex_pair_of_cap_card_eq_four S.oppIndex2
      hM44.oppIndex2_cap_card_eq_four with
    ⟨x2, y2, hxy2, hpair2⟩
  exact ⟨x1, y1, x2, y2, hxy1,
    by simpa [oppInterior1] using hpair1,
    hxy2, by simpa [oppInterior2] using hpair2⟩

/-- At the first non-surplus cap index, the left-adjacent interior is the
second non-surplus opposite interior. -/
theorem leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentInteriorByIndex S.oppIndex1 = S.oppInterior2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [leftAdjacentInteriorByIndex, oppInterior2, oppIndex1, oppIndex2, hi]

/-- At the first non-surplus cap index, the right-adjacent interior is the
surplus-cap strict interior. -/
theorem rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentInteriorByIndex S.oppIndex1 =
      S.capInteriorByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [rightAdjacentInteriorByIndex, capInteriorByIndex, oppIndex1, hi]

/-- At the second non-surplus cap index, the left-adjacent interior is the
surplus-cap strict interior. -/
theorem leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentInteriorByIndex S.oppIndex2 =
      S.capInteriorByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [leftAdjacentInteriorByIndex, capInteriorByIndex, oppIndex2, hi]

/-- At the second non-surplus cap index, the right-adjacent interior is the
first non-surplus opposite interior. -/
theorem rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentInteriorByIndex S.oppIndex2 = S.oppInterior1 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [rightAdjacentInteriorByIndex, oppInterior1, oppIndex1, oppIndex2, hi]

/-- At the first non-surplus cap index, the left-adjacent closed cap is the
second non-surplus cap. -/
theorem leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentCapByIndex S.oppIndex1 = S.capByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [leftAdjacentCapByIndex, oppIndex1, oppIndex2, hi]

/-- At the second non-surplus cap index, the right-adjacent closed cap is the
first non-surplus cap. -/
theorem rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentCapByIndex S.oppIndex2 = S.capByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [rightAdjacentCapByIndex, oppIndex1, oppIndex2, hi]

/-- Endpoint-residual exclusion eliminates the left, other-non-surplus escape
side at the first non-surplus cap index. -/
theorem IsM44.leftStrictEscape_oppIndex1_endpointData_elim
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ} {x : ℝ²}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius)
    (hxEsc : x ∈ S.leftAdjacentCapByIndex S.oppIndex1 \
        (S.capByIndex S.oppIndex1 ∪ S.rightAdjacentCapByIndex S.oppIndex1))
    (hend : ∀ {rho : ℝ},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False) :
    False := by
  have hcapLeft : (S.leftAdjacentCapByIndex S.oppIndex1).card = 4 := by
    rw [S.leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2]
    exact hM44.oppIndex2_cap_card_eq_four
  have hcenterA : S.rightOuterVertexByIndex S.oppIndex1 ∈ A :=
    S.capByIndex_subset S.oppIndex1
      (S.rightOuterVertexByIndex_mem_capByIndex S.oppIndex1)
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty hK4
      hcenterA with
    ⟨rho, hρ, hρcard⟩
  exact S.leftStrictEscape_endpointData_elim hconv S.oppIndex1
    hradius hρ hM44.oppIndex1_cap_card_eq_four hcapLeft hcard hxT hxEsc
    hρcard (by
      intro hres
      exact hend hres)

/-- Endpoint-residual exclusion eliminates the right, other-non-surplus escape
side at the second non-surplus cap index. -/
theorem IsM44.rightStrictEscape_oppIndex2_endpointData_elim
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ} {x : ℝ²}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card)
    (hxT : x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius)
    (hxEsc : x ∈ S.rightAdjacentCapByIndex S.oppIndex2 \
        (S.capByIndex S.oppIndex2 ∪ S.leftAdjacentCapByIndex S.oppIndex2))
    (hend : ∀ {rho : ℝ},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False) :
    False := by
  have hcapRight : (S.rightAdjacentCapByIndex S.oppIndex2).card = 4 := by
    rw [S.rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1]
    exact hM44.oppIndex1_cap_card_eq_four
  have hcenterA : S.leftOuterVertexByIndex S.oppIndex2 ∈ A :=
    S.capByIndex_subset S.oppIndex2
      (S.leftOuterVertexByIndex_mem_capByIndex S.oppIndex2)
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty hK4
      hcenterA with
    ⟨rho, hρ, hρcard⟩
  exact S.rightStrictEscape_endpointData_elim hconv S.oppIndex2
    hradius hρ hM44.oppIndex2_cap_card_eq_four hcapRight hcard hxT hxEsc
    hρcard (by
      intro hres
      exact hend hres)

/-- If endpoint escape is excluded, strict escape at the first non-surplus cap
can only remain on the surplus-adjacent side. -/
theorem IsM44.strictAdjacentEscapeAt_oppIndex1_reduces_to_right_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius).card)
    (hend : ∀ {rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hstrict : S.StrictAdjacentEscapeAt S.oppIndex1 radius) :
    ∃ x : ℝ²,
      x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∧
        x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
          (S.capByIndex S.oppIndex1 ∪
            S.leftAdjacentCapByIndex S.oppIndex1) := by
  rcases hstrict with ⟨x, hxT, hxSide⟩
  rcases hxSide with hxLeft | hxRight
  · exact False.elim
      (hM44.leftStrictEscape_oppIndex1_endpointData_elim hK4 hconv
        hradius hcard hxT hxLeft
        (fun {rho} hres => hend (rho := rho) (x := x) hres))
  · exact ⟨x, hxT, hxRight⟩

/-- If endpoint escape is excluded, strict escape at the second non-surplus cap
can only remain on the surplus-adjacent side. -/
theorem IsM44.strictAdjacentEscapeAt_oppIndex2_reduces_to_left_surplus
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius).card)
    (hend : ∀ {rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hstrict : S.StrictAdjacentEscapeAt S.oppIndex2 radius) :
    ∃ x : ℝ²,
      x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∧
        x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
          (S.capByIndex S.oppIndex2 ∪
            S.rightAdjacentCapByIndex S.oppIndex2) := by
  rcases hstrict with ⟨x, hxT, hxSide⟩
  rcases hxSide with hxLeft | hxRight
  · exact ⟨x, hxT, hxLeft⟩
  · exact False.elim
      (hM44.rightStrictEscape_oppIndex2_endpointData_elim hK4 hconv
        hradius hcard hxT hxRight
        (fun {rho} hres => hend (rho := rho) (x := x) hres))

/-- Endpoint residuals plus the two surplus-side residuals exclude strict
adjacent escape at both non-surplus cap indices. -/
theorem IsM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_surplus_residuals
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hsurplus1 :
      ∀ {radius : ℝ} {x : ℝ²}, 0 < radius →
        4 ≤ (SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex1) radius).card →
        x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius →
        x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
          (S.capByIndex S.oppIndex1 ∪
            S.leftAdjacentCapByIndex S.oppIndex1) →
        False)
    (hsurplus2 :
      ∀ {radius : ℝ} {x : ℝ²}, 0 < radius →
        4 ≤ (SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex2) radius).card →
        x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius →
        x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
          (S.capByIndex S.oppIndex2 ∪
            S.rightAdjacentCapByIndex S.oppIndex2) →
        False) :
    S.NonSurplusNoStrictAdjacentEscape := by
  constructor
  · intro radius hradius hcard hstrict
    rcases hM44.strictAdjacentEscapeAt_oppIndex1_reduces_to_right_surplus
        hK4 hconv hradius hcard
        (fun {rho} {x} hres =>
          hend1 (radius := radius) (rho := rho) (x := x) hres)
        hstrict with
      ⟨x, hxT, hxSurplus⟩
    exact hsurplus1 hradius hcard hxT hxSurplus
  · intro radius hradius hcard hstrict
    rcases hM44.strictAdjacentEscapeAt_oppIndex2_reduces_to_left_surplus
        hK4 hconv hradius hcard
        (fun {rho} {x} hres =>
          hend2 (radius := radius) (rho := rho) (x := x) hres)
        hstrict with
      ⟨x, hxT, hxSurplus⟩
    exact hsurplus2 hradius hcard hxT hxSurplus

/-- Endpoint residuals plus the two surplus-side residuals supply the
non-surplus Moser-cap containment interface used by the Q-facing row. -/
theorem IsM44.nonSurplusMoserCapContainment_of_endpoint_surplus_residuals
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    (hend1 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeLeftAt S.oppIndex1 radius rho x → False)
    (hend2 : ∀ {radius rho : ℝ} {x : ℝ²},
      S.EndpointEscapeRightAt S.oppIndex2 radius rho x → False)
    (hsurplus1 :
      ∀ {radius : ℝ} {x : ℝ²}, 0 < radius →
        4 ≤ (SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex1) radius).card →
        x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius →
        x ∈ S.rightAdjacentCapByIndex S.oppIndex1 \
          (S.capByIndex S.oppIndex1 ∪
            S.leftAdjacentCapByIndex S.oppIndex1) →
        False)
    (hsurplus2 :
      ∀ {radius : ℝ} {x : ℝ²}, 0 < radius →
        4 ≤ (SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex2) radius).card →
        x ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius →
        x ∈ S.leftAdjacentCapByIndex S.oppIndex2 \
          (S.capByIndex S.oppIndex2 ∪
            S.rightAdjacentCapByIndex S.oppIndex2) →
        False) :
    S.NonSurplusMoserCapContainment :=
  hM44.nonSurplusMoserCapContainment_of_convexIndep_noStrictAdjacentEscape hconv
    (hM44.nonSurplusNoStrictAdjacentEscape_of_endpoint_surplus_residuals
      hK4 hconv hend1 hend2 hsurplus1 hsurplus2)

/-- At the surplus cap index, the left-adjacent interior is the first
non-surplus opposite interior. -/
theorem leftAdjacentInteriorByIndex_surplusIdx_eq_oppInterior1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentInteriorByIndex S.surplusIdx = S.oppInterior1 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [leftAdjacentInteriorByIndex, oppInterior1, oppIndex1, hi]

/-- At the surplus cap index, the right-adjacent interior is the second
non-surplus opposite interior. -/
theorem rightAdjacentInteriorByIndex_surplusIdx_eq_oppInterior2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.rightAdjacentInteriorByIndex S.surplusIdx = S.oppInterior2 := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx <;>
    simp [rightAdjacentInteriorByIndex, oppInterior2, oppIndex2, hi]

/-- An `(m,4,4)` packet admits names for the two strict interior points in
each adjacent cap of the surplus cap. -/
theorem IsM44.exists_surplusAdjacentInterior_pairs
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44) :
    ∃ xL yL xR yR : ℝ²,
      xL ≠ yL ∧
        S.leftAdjacentInteriorByIndex S.surplusIdx =
          ({xL, yL} : Finset ℝ²) ∧
      xR ≠ yR ∧
        S.rightAdjacentInteriorByIndex S.surplusIdx =
          ({xR, yR} : Finset ℝ²) := by
  rcases hM44.exists_oppInterior_pairs with
    ⟨x1, y1, x2, y2, hxy1, hpair1, hxy2, hpair2⟩
  exact ⟨x1, y1, x2, y2, hxy1,
    by
      rw [S.leftAdjacentInteriorByIndex_surplusIdx_eq_oppInterior1]
      exact hpair1,
    hxy2,
    by
      rw [S.rightAdjacentInteriorByIndex_surplusIdx_eq_oppInterior2]
      exact hpair2⟩

/-- A surplus-side selector packet, together with the named finite alternatives
for both adjacent singleton rows.  The selected adjacent witnesses are explicit
hypotheses; producing them is the next upstream interface. -/
theorem IsM44.exists_surplusSelectorNamedSplit_of_selected_adjacent
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius).card)
    {pL pR : ℝ²}
    (hpL : pL ∈ SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
      S.leftAdjacentCapByIndex S.surplusIdx)
    (hpR : pR ∈ SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
      S.rightAdjacentCapByIndex S.surplusIdx) :
    ∃ T : Finset ℝ², ∃ xL yL xR yR rowL rowR : ℝ²,
      xL ≠ yL ∧
        S.leftAdjacentInteriorByIndex S.surplusIdx =
          ({xL, yL} : Finset ℝ²) ∧
      xR ≠ yR ∧
        S.rightAdjacentInteriorByIndex S.surplusIdx =
          ({xR, yR} : Finset ℝ²) ∧
      pL ∈ T ∧
      pR ∈ T ∧
      S.MoserSubpacketSelectorShapeAt S.surplusIdx radius T ∧
      rowL ∈
        ({xL, yL, S.leftOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      rowR ∈
        ({xR, yR, S.rightOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      T ∩ S.leftAdjacentCapByIndex S.surplusIdx =
        ({rowL} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.surplusIdx =
        ({rowR} : Finset ℝ²) := by
  rcases hM44.exists_surplusAdjacentInterior_pairs with
    ⟨xL, yL, xR, yR, hxyL, hleftPair, hxyR, hrightPair⟩
  rcases S.exists_surplusMoserSubpacketSelectorShape_preserving_adjacent
      hconv hradius hcard hpL hpR with
    ⟨T, hpLT, hpRT, hshape⟩
  rcases S.moserSubpacketSelectorShapeAt_adjacent_named_or_outer
      S.surplusIdx hradius hshape hleftPair hrightPair with
    ⟨rowL, rowR, hrowL, hrowR, hrowLeq, hrowReq⟩
  exact ⟨T, xL, yL, xR, yR, rowL, rowR, hxyL, hleftPair,
    hxyR, hrightPair, hpLT, hpRT, hshape, hrowL, hrowR, hrowLeq, hrowReq⟩

/-- Count-facing version of
`IsM44.exists_surplusSelectorNamedSplit_of_selected_adjacent`: positive hits in
both adjacent closed caps supply the selected adjacent witnesses. -/
theorem IsM44.exists_surplusSelectorNamedSplit_of_adjacent_counts
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius).card)
    (hleft :
      1 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
        S.leftAdjacentCapByIndex S.surplusIdx).card)
    (hright :
      1 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
        S.rightAdjacentCapByIndex S.surplusIdx).card) :
    ∃ T : Finset ℝ², ∃ xL yL xR yR rowL rowR : ℝ²,
      xL ≠ yL ∧
        S.leftAdjacentInteriorByIndex S.surplusIdx =
          ({xL, yL} : Finset ℝ²) ∧
      xR ≠ yR ∧
        S.rightAdjacentInteriorByIndex S.surplusIdx =
          ({xR, yR} : Finset ℝ²) ∧
      S.MoserSubpacketSelectorShapeAt S.surplusIdx radius T ∧
      rowL ∈
        ({xL, yL, S.leftOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      rowR ∈
        ({xR, yR, S.rightOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      T ∩ S.leftAdjacentCapByIndex S.surplusIdx =
        ({rowL} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.surplusIdx =
        ({rowR} : Finset ℝ²) := by
  have hleft_pos :
      0 < (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
        S.leftAdjacentCapByIndex S.surplusIdx).card := by
    omega
  have hright_pos :
      0 < (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius ∩
        S.rightAdjacentCapByIndex S.surplusIdx).card := by
    omega
  rcases Finset.card_pos.mp hleft_pos with ⟨pL, hpL⟩
  rcases Finset.card_pos.mp hright_pos with ⟨pR, hpR⟩
  rcases hM44.exists_surplusSelectorNamedSplit_of_selected_adjacent
      hconv hradius hcard hpL hpR with
    ⟨T, xL, yL, xR, yR, rowL, rowR, hxyL, hleftPair,
      hxyR, hrightPair, _hpLT, _hpRT, hshape, hrowL, hrowR, hrowLeq, hrowReq⟩
  exact ⟨T, xL, yL, xR, yR, rowL, rowR, hxyL, hleftPair, hxyR,
    hrightPair, hshape, hrowL, hrowR, hrowLeq, hrowReq⟩

/-- Form `a` at the surplus cap index supplies the positive adjacent closed-cap
counts needed for the surplus selector named split. -/
theorem IsM44.exists_surplusSelectorNamedSplit_of_formA
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius).card)
    (hform : S.IsMoserCapFormAAt S.surplusIdx radius) :
    ∃ T : Finset ℝ², ∃ xL yL xR yR rowL rowR : ℝ²,
      xL ≠ yL ∧
        S.leftAdjacentInteriorByIndex S.surplusIdx =
          ({xL, yL} : Finset ℝ²) ∧
      xR ≠ yR ∧
        S.rightAdjacentInteriorByIndex S.surplusIdx =
          ({xR, yR} : Finset ℝ²) ∧
      S.MoserSubpacketSelectorShapeAt S.surplusIdx radius T ∧
      rowL ∈
        ({xL, yL, S.leftOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      rowR ∈
        ({xR, yR, S.rightOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      T ∩ S.leftAdjacentCapByIndex S.surplusIdx =
        ({rowL} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.surplusIdx =
        ({rowR} : Finset ℝ²) := by
  have hcounts :=
    S.isMoserCapFormAAt_adjacentClosedCounts_pos S.surplusIdx hform
  exact hM44.exists_surplusSelectorNamedSplit_of_adjacent_counts
    hconv hradius hcard hcounts.1 hcounts.2

/-- Form `b` at the surplus cap index supplies the positive adjacent closed-cap
counts needed for the surplus selector named split. -/
theorem IsM44.exists_surplusSelectorNamedSplit_of_formB
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius).card)
    (hform : S.IsMoserCapFormBAt S.surplusIdx radius) :
    ∃ T : Finset ℝ², ∃ xL yL xR yR rowL rowR : ℝ²,
      xL ≠ yL ∧
        S.leftAdjacentInteriorByIndex S.surplusIdx =
          ({xL, yL} : Finset ℝ²) ∧
      xR ≠ yR ∧
        S.rightAdjacentInteriorByIndex S.surplusIdx =
          ({xR, yR} : Finset ℝ²) ∧
      S.MoserSubpacketSelectorShapeAt S.surplusIdx radius T ∧
      rowL ∈
        ({xL, yL, S.leftOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      rowR ∈
        ({xR, yR, S.rightOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      T ∩ S.leftAdjacentCapByIndex S.surplusIdx =
        ({rowL} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.surplusIdx =
        ({rowR} : Finset ℝ²) := by
  have hcounts :=
    S.isMoserCapFormBAt_adjacentClosedCounts_pos S.surplusIdx hform
  exact hM44.exists_surplusSelectorNamedSplit_of_adjacent_counts
    hconv hradius hcard hcounts.1 hcounts.2

/-- Form `c` at the surplus cap index supplies the positive adjacent closed-cap
counts needed for the surplus selector named split. -/
theorem IsM44.exists_surplusSelectorNamedSplit_of_formC
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) radius).card)
    (hform : S.IsMoserCapFormCAt S.surplusIdx radius) :
    ∃ T : Finset ℝ², ∃ xL yL xR yR rowL rowR : ℝ²,
      xL ≠ yL ∧
        S.leftAdjacentInteriorByIndex S.surplusIdx =
          ({xL, yL} : Finset ℝ²) ∧
      xR ≠ yR ∧
        S.rightAdjacentInteriorByIndex S.surplusIdx =
          ({xR, yR} : Finset ℝ²) ∧
      S.MoserSubpacketSelectorShapeAt S.surplusIdx radius T ∧
      rowL ∈
        ({xL, yL, S.leftOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      rowR ∈
        ({xR, yR, S.rightOuterVertexByIndex S.surplusIdx} : Finset ℝ²) ∧
      T ∩ S.leftAdjacentCapByIndex S.surplusIdx =
        ({rowL} : Finset ℝ²) ∧
      T ∩ S.rightAdjacentCapByIndex S.surplusIdx =
        ({rowR} : Finset ℝ²) := by
  have hcounts :=
    S.isMoserCapFormCAt_adjacentClosedCounts_pos S.surplusIdx hform
  exact hM44.exists_surplusSelectorNamedSplit_of_adjacent_counts
    hconv hradius hcard hcounts.1 hcounts.2

/-- The paired non-surplus exclusions needed by the Q-facing Moser row. -/
abbrev NonSurplusMoserCapExcludes
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (classify : S.NonSurplusMoserCapClassifies) : Prop :=
  S.MoserCapExcludesAt S.oppIndex1 classify.1 ∧
    S.MoserCapExcludesAt S.oppIndex2 classify.2

/-- The paired non-surplus form-level exclusions needed by the Q-facing Moser
row. -/
abbrev NonSurplusMoserCapFormExcludes
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Prop :=
  S.MoserCapExcludesFormAAt S.oppIndex1 ∧
    S.MoserCapExcludesFormBAt S.oppIndex1 ∧
    S.MoserCapExcludesFormCAt S.oppIndex1 ∧
    S.MoserCapExcludesFormAAt S.oppIndex2 ∧
    S.MoserCapExcludesFormBAt S.oppIndex2 ∧
    S.MoserCapExcludesFormCAt S.oppIndex2

/-- Build the paired non-surplus escaped-form classifiers from the paired
form trichotomies. -/
noncomputable def nonSurplusMoserCapClassifies_of_forms
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hforms : S.NonSurplusMoserCapForms) :
    S.NonSurplusMoserCapClassifies :=
  ⟨S.moserCapClassifiesAt_of_forms hforms.1,
    S.moserCapClassifiesAt_of_forms hforms.2⟩

/-- Pair the one-index `N4d` form assemblies for the two non-surplus caps. -/
theorem nonSurplusMoserCapExcludes_of_form_excludes
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hforms : S.NonSurplusMoserCapForms)
    (hexcludes : S.NonSurplusMoserCapFormExcludes) :
    S.NonSurplusMoserCapExcludes
      (S.nonSurplusMoserCapClassifies_of_forms hforms) := by
  constructor
  · exact S.moserCapExcludesAt_of_form_excludes hforms.1
      hexcludes.1 hexcludes.2.1 hexcludes.2.2.1
  · exact S.moserCapExcludesAt_of_form_excludes hforms.2
      hexcludes.2.2.2.1 hexcludes.2.2.2.2.1 hexcludes.2.2.2.2.2

/-- Non-surplus `N4c -> N4d -> N4e` assembly: once escaped Moser-centered
four-classes are classified and excluded for the two short caps, the
containment interface needed by the Moser-count consumer follows. -/
theorem nonSurplusMoserCapContainment_of_classifies_excludes
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (classify : S.NonSurplusMoserCapClassifies)
    (hexcludes : S.NonSurplusMoserCapExcludes classify) :
    S.NonSurplusMoserCapContainment := by
  constructor
  · intro radius hradius hcard
    by_contra hesc
    exact hexcludes.1 (radius := radius) hradius hcard hesc
  · intro radius hradius hcard
    by_contra hesc
    exact hexcludes.2 (radius := radius) hradius hcard hesc

/-- Non-surplus `N4c/N4d` form-level assembly: form trichotomies plus
form-level exclusions give the containment interface needed by the Moser-count
consumer. -/
theorem nonSurplusMoserCapContainment_of_forms_excludes
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (hforms : S.NonSurplusMoserCapForms)
    (hexcludes : S.NonSurplusMoserCapFormExcludes) :
    S.NonSurplusMoserCapContainment :=
  S.nonSurplusMoserCapContainment_of_classifies_excludes
    (S.nonSurplusMoserCapClassifies_of_forms hforms)
    (S.nonSurplusMoserCapExcludes_of_form_excludes hforms hexcludes)

/-- In an `(m,4,4)` packet, convexity reduces non-surplus Moser-cap containment
to the six form-level exclusions. -/
theorem IsM44.nonSurplusMoserCapContainment_of_convexIndep_form_excludes
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hconv : ConvexIndep A)
    (hexcludes : S.NonSurplusMoserCapFormExcludes) :
    S.NonSurplusMoserCapContainment :=
  S.nonSurplusMoserCapContainment_of_forms_excludes
    (hM44.nonSurplusMoserCapForms_of_convexIndep hconv) hexcludes

/-- The Moser vertex opposite a cyclic cap index is an ambient point. -/
theorem oppositeVertexByIndex_mem
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.oppositeVertexByIndex i ∈ A := by
  fin_cases i
  · simpa [oppositeVertexByIndex] using S.triangle.v1_mem
  · simpa [oppositeVertexByIndex] using S.triangle.v2_mem
  · simpa [oppositeVertexByIndex] using S.triangle.v3_mem

/-- Global `K4` supplies the endpoint-style selector shape at any short indexed
cap. -/
theorem exists_moserSelectorShapeAt_of_hasNEquidistantProperty
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hK4 : HasNEquidistantProperty 4 A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4) :
    ∃ radius : ℝ, 0 < radius ∧ S.MoserSelectorShapeAt i radius := by
  have hvA : S.oppositeVertexByIndex i ∈ A := S.oppositeVertexByIndex_mem i
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty hK4 hvA with
    ⟨radius, hradius, hcard⟩
  exact ⟨radius, hradius,
    S.moserSelectorShapeAt_of_convexIndep hconv i hradius hcap hcard⟩

/-- In an `(m,4,4)` packet, global `K4` supplies selector shapes for the two
non-surplus short caps. -/
theorem IsM44.exists_nonSurplusMoserSelectorShapes
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hconv : ConvexIndep A) :
    ∃ radius1 radius2 : ℝ,
      0 < radius1 ∧ S.MoserSelectorShapeAt S.oppIndex1 radius1 ∧
      0 < radius2 ∧ S.MoserSelectorShapeAt S.oppIndex2 radius2 := by
  rcases S.exists_moserSelectorShapeAt_of_hasNEquidistantProperty hK4 hconv
      S.oppIndex1 hM44.oppIndex1_cap_card_eq_four with
    ⟨radius1, hradius1, hshape1⟩
  rcases S.exists_moserSelectorShapeAt_of_hasNEquidistantProperty hK4 hconv
      S.oppIndex2 hM44.oppIndex2_cap_card_eq_four with
    ⟨radius2, hradius2, hshape2⟩
  exact ⟨radius1, radius2, hradius1, hshape1, hradius2, hshape2⟩

/-- Under Moser-cap containment, a short cap is an exact Moser-centered
four-class. -/
theorem exact_cap_class_at_index_of_cap_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.MoserCapContainmentAt i)
    (hcap : (S.capByIndex i).card = 4) :
    ∃ radius : ℝ, 0 < radius ∧
      SelectedClass A (S.oppositeVertexByIndex i) radius = S.capByIndex i := by
  have hvA : S.oppositeVertexByIndex i ∈ A := S.oppositeVertexByIndex_mem i
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty hK4 hvA with
    ⟨radius, hradius, hcard⟩
  have hsub : SelectedClass A (S.oppositeVertexByIndex i) radius ⊆ S.capByIndex i :=
    hcontain hradius hcard
  have hcap_le : (S.capByIndex i).card ≤
      (SelectedClass A (S.oppositeVertexByIndex i) radius).card := by
    rw [hcap]
    exact hcard
  exact ⟨radius, hradius, Finset.eq_of_subset_of_card_le hsub hcap_le⟩

/-- Distance readout from an exact Moser-centered cap class. -/
theorem dist_opposite_eq_of_mem_capByIndex_of_exact
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²}
    {radius : ℝ}
    (hexact : SelectedClass A (S.oppositeVertexByIndex i) radius =
      S.capByIndex i)
    (hxcap : x ∈ S.capByIndex i) :
    dist (S.oppositeVertexByIndex i) x = radius := by
  have hxsel : x ∈ SelectedClass A (S.oppositeVertexByIndex i) radius := by
    rw [hexact]
    exact hxcap
  exact (mem_selectedClass.mp hxsel).2

/-- If a K4-sized selected class is contained in a four-point indexed cap, then
the two Moser endpoints of the cap lie on the queried selected radius. -/
theorem endpointRadius_of_selectedClass_subset_capByIndex_of_cap_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {radius : ℝ}
    (hsub : SelectedClass A (S.oppositeVertexByIndex i) radius ⊆
      S.capByIndex i)
    (hcap : (S.capByIndex i).card = 4)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) = radius ∧
      dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) =
        radius := by
  have hcap_le : (S.capByIndex i).card ≤
      (SelectedClass A (S.oppositeVertexByIndex i) radius).card := by
    rw [hcap]
    exact hcard
  have hexact : SelectedClass A (S.oppositeVertexByIndex i) radius =
      S.capByIndex i :=
    Finset.eq_of_subset_of_card_le hsub hcap_le
  constructor
  · have hdist :=
      S.dist_opposite_eq_of_mem_capByIndex_of_exact i hexact
        (S.leftOuterVertexByIndex_mem_capByIndex i)
    simpa [dist_comm] using hdist
  · have hdist :=
      S.dist_opposite_eq_of_mem_capByIndex_of_exact i hexact
        (S.rightOuterVertexByIndex_mem_capByIndex i)
    simpa [dist_comm] using hdist

/-- Moser-cap containment at a four-point cap supplies endpoint-radius
production at that indexed cap. -/
theorem endpointRadiusAt_of_moserCapContainmentAt_of_cap_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hcontain : S.MoserCapContainmentAt i)
    (hcap : (S.capByIndex i).card = 4) :
    S.EndpointRadiusAt i := by
  intro radius hradius hcard
  exact S.endpointRadius_of_selectedClass_subset_capByIndex_of_cap_card_eq_four
    i (hcontain hradius hcard) hcap hcard

/-- Under the placement split, a K4-sized selected class at a four-point cap
either supplies endpoint-radius equalities or has a strict adjacent-cap escape. -/
theorem endpointRadius_or_strictAdjacentEscapeAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcap : (S.capByIndex i).card = 4)
    (hcard :
      4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    (dist (S.leftOuterVertexByIndex i) (S.oppositeVertexByIndex i) = radius ∧
      dist (S.rightOuterVertexByIndex i) (S.oppositeVertexByIndex i) =
        radius) ∨
      S.StrictAdjacentEscapeAt i radius := by
  rcases S.containment_or_strictAdjacentEscapeAt_of_convexIndep
      hconv i hradius hcap hcard with hsub | hstrict
  · exact Or.inl
      (S.endpointRadius_of_selectedClass_subset_capByIndex_of_cap_card_eq_four
        i hsub hcap hcard)
  · exact Or.inr hstrict

/-- No strict adjacent-cap escape implies endpoint-radius production at a
four-point indexed cap. -/
theorem endpointRadiusAt_of_noStrictAdjacentEscapeAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4)
    (hno : S.NoStrictAdjacentEscapeAt i) :
    S.EndpointRadiusAt i := by
  intro radius hradius hcard
  rcases S.endpointRadius_or_strictAdjacentEscapeAt_of_convexIndep
      hconv i hradius hcap hcard with hend | hstrict
  · exact hend
  · exact False.elim (hno hradius hcard hstrict)

/-- For a four-point indexed cap under convexity, endpoint-radius production is
equivalent to excluding the strict adjacent-cap escape branch. -/
theorem endpointRadiusAt_iff_noStrictAdjacentEscapeAt_of_convexIndep
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    (hcap : (S.capByIndex i).card = 4) :
    S.EndpointRadiusAt i ↔ S.NoStrictAdjacentEscapeAt i :=
  ⟨S.noStrictAdjacentEscapeAt_of_endpointRadiusAt i,
    S.endpointRadiusAt_of_noStrictAdjacentEscapeAt_of_convexIndep
      hconv i hcap⟩

/-- A selected apex in a short cap of an `(m,4,4)` surplus packet.

The `cap_card` field records the local short-cap fact needed for the same-cap
one-hit bound.  In an `IsM44` packet this is supplied by choosing one of the two
non-surplus cap indices. -/
structure M44SelectedApex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) (x : ℝ²) where
  radius : ℝ
  radius_pos : 0 < radius
  cap_mem : x ∈ S.capInteriorByIndex i
  cap_card : (S.capByIndex i).card = 4
  selected_card : 4 ≤ (SelectedClass A x radius).card

/-- A global `K4` hypothesis supplies the selected-apex packet at any point in a
short cap interior. -/
theorem M44SelectedApex.nonempty_of_hasNEquidistantProperty
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hxcap : x ∈ S.capInteriorByIndex i)
    (hcap : (S.capByIndex i).card = 4) :
    Nonempty (M44SelectedApex S i x) := by
  have hxA : x ∈ A := S.capInteriorByIndex_subset i hxcap
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty hK4 hxA with
    ⟨r, hr, hcard⟩
  exact ⟨{ radius := r
           radius_pos := hr
           cap_mem := hxcap
           cap_card := hcap
           selected_card := hcard }⟩

/-- A global `K4` hypothesis supplies a selected-apex packet in the first
non-surplus cap of an `IsM44` packet. -/
theorem M44SelectedApex.nonempty_oppIndex1_of_hasNEquidistantProperty
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hxcap : x ∈ S.oppInterior1) :
    Nonempty (M44SelectedApex S S.oppIndex1 x) := by
  exact M44SelectedApex.nonempty_of_hasNEquidistantProperty hK4
    (by simpa [oppInterior1] using hxcap)
    hM44.oppIndex1_cap_card_eq_four

/-- A global `K4` hypothesis supplies a selected-apex packet in the second
non-surplus cap of an `IsM44` packet. -/
theorem M44SelectedApex.nonempty_oppIndex2_of_hasNEquidistantProperty
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hxcap : x ∈ S.oppInterior2) :
    Nonempty (M44SelectedApex S S.oppIndex2 x) := by
  exact M44SelectedApex.nonempty_of_hasNEquidistantProperty hK4
    (by simpa [oppInterior2] using hxcap)
    hM44.oppIndex2_cap_card_eq_four

/-- Structural same-cap one-hit bound for a selected class centered at a point
in a short cap interior. -/
theorem sameCapCount_le_one_of_cap_card_eq_four
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²} (radius : ℝ)
    (hxcap : x ∈ S.capInteriorByIndex i)
    (hcap : (S.capByIndex i).card = 4) :
    S.sameCapCount i x radius ≤ 1 := by
  have herase : ((S.capInteriorByIndex i).erase x).card = 1 := by
    rw [Finset.card_erase_of_mem hxcap,
      S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four i hcap]
  calc S.sameCapCount i x radius
      ≤ ((S.capInteriorByIndex i).erase x).card :=
        Finset.card_le_card Finset.inter_subset_right
    _ = 1 := herase

/-- The same-cap one-hit bound attached to an `M44SelectedApex`. -/
theorem M44SelectedApex.sameCapCount_le_one
    {A : Finset ℝ²} {S : SurplusCapPacket A} {i : Fin 3} {x : ℝ²}
    (hx : M44SelectedApex S i x) :
    S.sameCapCount i x hx.radius ≤ 1 :=
  S.sameCapCount_le_one_of_cap_card_eq_four i hx.radius hx.cap_mem hx.cap_card

/-- Conditional Moser-row bound.  If the general-`n` interface supplies the
equilateral side length and the fact that the selected cap-interior apex is at
that side length from the opposite Moser vertex, then the selected class cannot
contain all three Moser vertices. -/
theorem moserCount_le_two_of_opposite_vertex_at_side
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {x : ℝ²} {r d : ℝ}
    (hdpos : 0 < d)
    (h12 : dist S.triangle.v1 S.triangle.v2 = d)
    (h23 : dist S.triangle.v2 S.triangle.v3 = d)
    (h31 : dist S.triangle.v3 S.triangle.v1 = d)
    (hopposite : dist (S.oppositeVertexByIndex i) x = d) :
    S.moserCount x r ≤ 2 := by
  classical
  by_contra hgt
  push_neg at hgt
  have hm3 : S.moserCount x r = 3 := by
    have hle : S.moserCount x r ≤ 3 := by
      simp only [moserCount]
      calc (SelectedClass A x r ∩ S.triangle.verts).card
          ≤ S.triangle.verts.card := Finset.card_le_card Finset.inter_subset_right
        _ = 3 := S.triangle.verts_card
    omega
  have hsub : S.triangle.verts ⊆ SelectedClass A x r := by
    have hinter : (SelectedClass A x r ∩ S.triangle.verts) = S.triangle.verts := by
      apply Finset.eq_of_subset_of_card_le Finset.inter_subset_right
      rw [S.triangle.verts_card]
      rw [← hm3]
      rfl
    intro y hy
    have hmem : y ∈ SelectedClass A x r ∩ S.triangle.verts := by
      rw [hinter]
      exact hy
    exact Finset.mem_of_mem_inter_left hmem
  have hv1 : S.triangle.v1 ∈ S.triangle.verts := by simp [MoserTriangle.verts]
  have hv2 : S.triangle.v2 ∈ S.triangle.verts := by simp [MoserTriangle.verts]
  have hv3 : S.triangle.v3 ∈ S.triangle.verts := by simp [MoserTriangle.verts]
  have dx1 : dist x S.triangle.v1 = r := (mem_selectedClass.mp (hsub hv1)).2
  have dx2 : dist x S.triangle.v2 = r := (mem_selectedClass.mp (hsub hv2)).2
  have dx3 : dist x S.triangle.v3 = r := (mem_selectedClass.mp (hsub hv3)).2
  have hrd : r = d := by
    fin_cases i
    · simp only [oppositeVertexByIndex] at hopposite
      rw [← dx1, dist_comm]
      exact hopposite
    · simp only [oppositeVertexByIndex] at hopposite
      rw [← dx2, dist_comm]
      exact hopposite
    · simp only [oppositeVertexByIndex] at hopposite
      rw [← dx3, dist_comm]
      exact hopposite
  rw [hrd] at dx1 dx2 dx3
  exact no_equidistant_apex_at_side S.triangle.v1 S.triangle.v2 S.triangle.v3 x d
    hdpos h12 h23 h31 dx1 dx2 dx3

/-- Under Moser-cap containment, the two non-surplus short caps of an
`(m,4,4)` packet lie on the corresponding side-length circles. -/
theorem IsM44.exists_oppInterior_side_placement_of_moserCapContainment
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment) :
    ∃ d : ℝ, 0 < d ∧
      dist S.triangle.v1 S.triangle.v2 = d ∧
      dist S.triangle.v2 S.triangle.v3 = d ∧
      dist S.triangle.v3 S.triangle.v1 = d ∧
      (∀ x ∈ S.oppInterior1, dist (S.oppositeVertexByIndex S.oppIndex1) x = d) ∧
      (∀ x ∈ S.oppInterior2, dist (S.oppositeVertexByIndex S.oppIndex2) x = d) := by
  classical
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex1 hK4
      hcontain.1 hM44.oppIndex1_cap_card_eq_four with
    ⟨r1, _hr1, hE1⟩
  rcases S.exact_cap_class_at_index_of_cap_card_eq_four S.oppIndex2 hK4
      hcontain.2 hM44.oppIndex2_cap_card_eq_four with
    ⟨r2, _hr2, hE2⟩
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx
  · simp only [oppIndex1, oppIndex2, capByIndex, oppositeVertexByIndex,
      oppInterior1, oppInterior2, hi] at hE1 hE2 ⊢
    let d : ℝ := dist S.triangle.v1 S.triangle.v2
    have hdpos : 0 < d := by
      exact dist_pos.mpr S.triangle.v12_ne
    have hv3C2 : S.triangle.v3 ∈ SelectedClass A S.triangle.v2 r1 := by
      rw [hE1]
      exact S.partition.v3_mem_C2
    have hv1C2 : S.triangle.v1 ∈ SelectedClass A S.triangle.v2 r1 := by
      rw [hE1]
      exact S.partition.v1_mem_C2
    have hv1C3 : S.triangle.v1 ∈ SelectedClass A S.triangle.v3 r2 := by
      rw [hE2]
      exact S.partition.v1_mem_C3
    have hv2C3 : S.triangle.v2 ∈ SelectedClass A S.triangle.v3 r2 := by
      rw [hE2]
      exact S.partition.v2_mem_C3
    have d23_r1 : dist S.triangle.v2 S.triangle.v3 = r1 :=
      (mem_selectedClass.mp hv3C2).2
    have d21_r1 : dist S.triangle.v2 S.triangle.v1 = r1 :=
      (mem_selectedClass.mp hv1C2).2
    have d31_r2 : dist S.triangle.v3 S.triangle.v1 = r2 :=
      (mem_selectedClass.mp hv1C3).2
    have d32_r2 : dist S.triangle.v3 S.triangle.v2 = r2 :=
      (mem_selectedClass.mp hv2C3).2
    have hr1d : r1 = d := by
      calc
        r1 = dist S.triangle.v2 S.triangle.v1 := d21_r1.symm
        _ = d := by simp [d, dist_comm]
    have h23 : dist S.triangle.v2 S.triangle.v3 = d := by
      calc
        dist S.triangle.v2 S.triangle.v3 = r1 := d23_r1
        _ = d := hr1d
    have hr2d : r2 = d := by
      calc
        r2 = dist S.triangle.v3 S.triangle.v2 := d32_r2.symm
        _ = dist S.triangle.v2 S.triangle.v3 := dist_comm _ _
        _ = d := h23
    have h31 : dist S.triangle.v3 S.triangle.v1 = d := by
      calc
        dist S.triangle.v3 S.triangle.v1 = r2 := d31_r2
        _ = d := hr2d
    refine ⟨d, hdpos, rfl, h23, h31, ?_, ?_⟩
    · intro x hx
      rw [Finset.mem_erase, Finset.mem_erase] at hx
      have hxsel : x ∈ SelectedClass A S.triangle.v2 r1 := by
        rw [hE1]
        exact hx.2.2
      calc
        dist S.triangle.v2 x = r1 := (mem_selectedClass.mp hxsel).2
        _ = d := hr1d
    · intro x hx
      rw [Finset.mem_erase, Finset.mem_erase] at hx
      have hxsel : x ∈ SelectedClass A S.triangle.v3 r2 := by
        rw [hE2]
        exact hx.2.2
      calc
        dist S.triangle.v3 x = r2 := (mem_selectedClass.mp hxsel).2
        _ = d := hr2d
  · simp only [oppIndex1, oppIndex2, capByIndex, oppositeVertexByIndex,
      oppInterior1, oppInterior2, hi] at hE1 hE2 ⊢
    let d : ℝ := dist S.triangle.v1 S.triangle.v2
    have hdpos : 0 < d := by
      exact dist_pos.mpr S.triangle.v12_ne
    have hv1C3 : S.triangle.v1 ∈ SelectedClass A S.triangle.v3 r1 := by
      rw [hE1]
      exact S.partition.v1_mem_C3
    have hv2C3 : S.triangle.v2 ∈ SelectedClass A S.triangle.v3 r1 := by
      rw [hE1]
      exact S.partition.v2_mem_C3
    have hv2C1 : S.triangle.v2 ∈ SelectedClass A S.triangle.v1 r2 := by
      rw [hE2]
      exact S.partition.v2_mem_C1
    have hv3C1 : S.triangle.v3 ∈ SelectedClass A S.triangle.v1 r2 := by
      rw [hE2]
      exact S.partition.v3_mem_C1
    have d31_r1 : dist S.triangle.v3 S.triangle.v1 = r1 :=
      (mem_selectedClass.mp hv1C3).2
    have d32_r1 : dist S.triangle.v3 S.triangle.v2 = r1 :=
      (mem_selectedClass.mp hv2C3).2
    have d12_r2 : dist S.triangle.v1 S.triangle.v2 = r2 :=
      (mem_selectedClass.mp hv2C1).2
    have d13_r2 : dist S.triangle.v1 S.triangle.v3 = r2 :=
      (mem_selectedClass.mp hv3C1).2
    have hr2d : r2 = d := by
      calc
        r2 = dist S.triangle.v1 S.triangle.v2 := d12_r2.symm
        _ = d := rfl
    have hr1d : r1 = d := by
      calc
        r1 = dist S.triangle.v3 S.triangle.v1 := d31_r1.symm
        _ = dist S.triangle.v1 S.triangle.v3 := dist_comm _ _
        _ = r2 := d13_r2
        _ = d := hr2d
    have h23 : dist S.triangle.v2 S.triangle.v3 = d := by
      calc
        dist S.triangle.v2 S.triangle.v3 =
            dist S.triangle.v3 S.triangle.v2 := dist_comm _ _
        _ = r1 := d32_r1
        _ = d := hr1d
    have h31 : dist S.triangle.v3 S.triangle.v1 = d := by
      calc
        dist S.triangle.v3 S.triangle.v1 = r1 := d31_r1
        _ = d := hr1d
    refine ⟨d, hdpos, rfl, h23, h31, ?_, ?_⟩
    · intro x hx
      rw [Finset.mem_erase, Finset.mem_erase] at hx
      have hxsel : x ∈ SelectedClass A S.triangle.v3 r1 := by
        rw [hE1]
        exact hx.2.2
      calc
        dist S.triangle.v3 x = r1 := (mem_selectedClass.mp hxsel).2
        _ = d := hr1d
    · intro x hx
      rw [Finset.mem_erase, Finset.mem_erase] at hx
      have hxsel : x ∈ SelectedClass A S.triangle.v1 r2 := by
        rw [hE2]
        exact hx.2.2
      calc
        dist S.triangle.v1 x = r2 := (mem_selectedClass.mp hxsel).2
        _ = d := hr2d
  · simp only [oppIndex1, oppIndex2, capByIndex, oppositeVertexByIndex,
      oppInterior1, oppInterior2, hi] at hE1 hE2 ⊢
    let d : ℝ := dist S.triangle.v1 S.triangle.v2
    have hdpos : 0 < d := by
      exact dist_pos.mpr S.triangle.v12_ne
    have hv2C1 : S.triangle.v2 ∈ SelectedClass A S.triangle.v1 r1 := by
      rw [hE1]
      exact S.partition.v2_mem_C1
    have hv3C1 : S.triangle.v3 ∈ SelectedClass A S.triangle.v1 r1 := by
      rw [hE1]
      exact S.partition.v3_mem_C1
    have hv3C2 : S.triangle.v3 ∈ SelectedClass A S.triangle.v2 r2 := by
      rw [hE2]
      exact S.partition.v3_mem_C2
    have hv1C2 : S.triangle.v1 ∈ SelectedClass A S.triangle.v2 r2 := by
      rw [hE2]
      exact S.partition.v1_mem_C2
    have d12_r1 : dist S.triangle.v1 S.triangle.v2 = r1 :=
      (mem_selectedClass.mp hv2C1).2
    have d13_r1 : dist S.triangle.v1 S.triangle.v3 = r1 :=
      (mem_selectedClass.mp hv3C1).2
    have d23_r2 : dist S.triangle.v2 S.triangle.v3 = r2 :=
      (mem_selectedClass.mp hv3C2).2
    have d21_r2 : dist S.triangle.v2 S.triangle.v1 = r2 :=
      (mem_selectedClass.mp hv1C2).2
    have hr1d : r1 = d := by
      calc
        r1 = dist S.triangle.v1 S.triangle.v2 := d12_r1.symm
        _ = d := rfl
    have hr2d : r2 = d := by
      calc
        r2 = dist S.triangle.v2 S.triangle.v1 := d21_r2.symm
        _ = d := by simp [d, dist_comm]
    have h23 : dist S.triangle.v2 S.triangle.v3 = d := by
      calc
        dist S.triangle.v2 S.triangle.v3 = r2 := d23_r2
        _ = d := hr2d
    have h31 : dist S.triangle.v3 S.triangle.v1 = d := by
      calc
        dist S.triangle.v3 S.triangle.v1 =
            dist S.triangle.v1 S.triangle.v3 := dist_comm _ _
        _ = r1 := d13_r1
        _ = d := hr1d
    refine ⟨d, hdpos, rfl, h23, h31, ?_, ?_⟩
    · intro x hx
      rw [Finset.mem_erase, Finset.mem_erase] at hx
      have hxsel : x ∈ SelectedClass A S.triangle.v1 r1 := by
        rw [hE1]
        exact hx.2.2
      calc
        dist S.triangle.v1 x = r1 := (mem_selectedClass.mp hxsel).2
        _ = d := hr1d
    · intro x hx
      rw [Finset.mem_erase, Finset.mem_erase] at hx
      have hxsel : x ∈ SelectedClass A S.triangle.v2 r2 := by
        rw [hE2]
        exact hx.2.2
      calc
        dist S.triangle.v2 x = r2 := (mem_selectedClass.mp hxsel).2
        _ = d := hr2d

/-- Moser-count bound for the first non-surplus short-cap interior, conditional
on the general `N4e`-style Moser-cap containment interface. -/
theorem IsM44.moserCount_oppIndex1_le_two_of_moserCapContainment
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x : ℝ²} (hxcap : x ∈ S.oppInterior1) (radius : ℝ) :
    S.moserCount x radius ≤ 2 := by
  rcases hM44.exists_oppInterior_side_placement_of_moserCapContainment hK4 hcontain with
    ⟨d, hdpos, h12, h23, h31, hopp1, _hopp2⟩
  exact S.moserCount_le_two_of_opposite_vertex_at_side S.oppIndex1
    hdpos h12 h23 h31 (hopp1 x hxcap)

/-- Moser-count bound for the second non-surplus short-cap interior, conditional
on the general `N4e`-style Moser-cap containment interface. -/
theorem IsM44.moserCount_oppIndex2_le_two_of_moserCapContainment
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x : ℝ²} (hxcap : x ∈ S.oppInterior2) (radius : ℝ) :
    S.moserCount x radius ≤ 2 := by
  rcases hM44.exists_oppInterior_side_placement_of_moserCapContainment hK4 hcontain with
    ⟨d, hdpos, h12, h23, h31, _hopp1, hopp2⟩
  exact S.moserCount_le_two_of_opposite_vertex_at_side S.oppIndex2
    hdpos h12 h23 h31 (hopp2 x hxcap)

/-- Structural same-cap one-hit bound in the first non-surplus cap of an
`IsM44` packet. -/
theorem IsM44.sameCapCount_oppIndex1_le_one
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x : ℝ²} (radius : ℝ) (hxcap : x ∈ S.oppInterior1) :
    S.sameCapCount S.oppIndex1 x radius ≤ 1 :=
  S.sameCapCount_le_one_of_cap_card_eq_four S.oppIndex1 radius
    (by simpa [oppInterior1] using hxcap)
    hM44.oppIndex1_cap_card_eq_four

/-- Structural same-cap one-hit bound in the second non-surplus cap of an
`IsM44` packet. -/
theorem IsM44.sameCapCount_oppIndex2_le_one
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    {x : ℝ²} (radius : ℝ) (hxcap : x ∈ S.oppInterior2) :
    S.sameCapCount S.oppIndex2 x radius ≤ 1 :=
  S.sameCapCount_le_one_of_cap_card_eq_four S.oppIndex2 radius
    (by simpa [oppInterior2] using hxcap)
    hM44.oppIndex2_cap_card_eq_four

end SurplusCapPacket

end Problem97
